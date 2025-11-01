Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A3FCCFA02
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 23:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F968826D;
	Sat,  1 Nov 2025 23:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJWf+Ymv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA438826D
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 23:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762039413; x=1793575413;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eOxSh2v1oqUZmjIE2KN10q0O0J5XmPYV6A6U/bzvexM=;
 b=MJWf+Ymve3YhiqsZskuiV18juLH5/8eQBk+gqelp139o93O+TVKf7yDX
 w8+2+5GvyISH2txzBT16IuOuXR53qvgV+7HlHXZmw45gW3oLvzsqhmRHk
 Zq26Wm2Ga1YUbj/OoXl7iI4OA2DeMb9KMFo+JpxbpnpppdIYQT3Av8G35
 e/k2+tIGeP41cc0QtCHhBKEzkn7h/CIngbnBRnRO7J1oGgouQ9hg1S0tq
 Unj87UI+60yGAENO3MX0J6aEJ06wG5dMSYP0NQeNmTPRb0sLJmN4JVx62
 9+t8ZbFaKrC3R1Wp8y/2PGhsmoTgYmEhoyB5OibBs9c2ZdrVj7BYTz7Wh g==;
X-CSE-ConnectionGUID: DsZA/9pyTzWrcoYbu72GjQ==
X-CSE-MsgGUID: F26h9vBzQGS+uwkZ5/mOtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="68025332"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="68025332"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 16:23:33 -0700
X-CSE-ConnectionGUID: 0dm9VUmURlm5hIqJty1M5w==
X-CSE-MsgGUID: fKqzfXZYQG+puJsw1IHnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="190879524"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 16:23:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 16:23:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 16:23:32 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 16:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9k/EmWVCCYYo5EniURJH0NMNqNrv1UngA5WQ+J5FiimcC+08tUGDEjuvWm7fa65p0sJJvS3D4VXWJgGo/ZE1Iwg2R2zt57o4brfE+weCRhiYNESXDAw27MyyNX6dzx52h65dIzAAlc79IWsl6TrJ5dnc8N710JZ7/h820Ouy23AwriL7PZOHDl0pk9wfheolqUZmfw8q0i+AQ7PakCQgSVFpy6fsMjZ/6iUuRMGRiGTvwV2i18p8yGJ+ilOhd/tOCdwTO5K3irhhBgVcN8IeTSKixkIcOoMCWAIHyWXKfNyXe/XVsU9e7x3VG2bZKuFukhaHHHblMsu1WMV4bzaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGsW4cTuv0lcUe/kMX7njrn7vetKqFIxICHS4QWOYSk=;
 b=nbR+hjYfdedsJbZ5SaxScfJrUGJJDgy4/Y8ONnOcMtqzPxcI6+7qUqcD1fp6B7PD0UnJ9g8jH625w8gr3kuVhqar/9tK1JkpBh69tAepaKAMWDc5YF36zPJFWbHi0hUF5AUWt8kY/WL1lLkFFCyDjsOv8GRKmTd7Yd06r0qxWi/jkL6wTWIJK7kxVZYAYFxZFxRFNBS0FZtMj8QFTwCEVFASKZWcEfMX2B7bv6DBtTt0JIlQvtryVTNJ3K1ED+zqqVTPZRPEFDflXhhSRFsSd2sl7eROMrvVDeeara9FY/qqPWun0UjdVK9m5fGnFCb2U+DSeegARisqaQBN7Pl/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Sat, 1 Nov
 2025 23:23:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sat, 1 Nov 2025
 23:23:30 +0000
Date: Sat, 1 Nov 2025 16:23:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/16] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Message-ID: <aQaWcP/ykkycsx51@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-8-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-8-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: e36371a9-2bfc-4fbc-d42a-08de199dab0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ob7Ln6obR85vZqdg5KtTQCjB0BlubjE3pLd4SHcCsejMENPlNyRO8/FOhSSf?=
 =?us-ascii?Q?JAOs9nMARkeX/vQ4bncbBnTCAMqqXNuo1YbqvXhowdCoLg9llCxEqYrtVLnG?=
 =?us-ascii?Q?BpTQ4Q9A165+nMC5kUs65oCXPaKyk6gXi9FEeLgveEDIC/SxS0h3MzBBP4PC?=
 =?us-ascii?Q?E18Jfx3dSvsjOcfkSMdF9wQUERvBc7g7aYG8eMPN+t9MdPDKSJusLfOAZlTh?=
 =?us-ascii?Q?J3oGZB+yNUu6duaZpS1FWONe5os3mwRr39FxWn0299oM7kTKerHMzWZoAmCI?=
 =?us-ascii?Q?FJGsITphdU33tX4QNtNoUIA4Buh6/3PgJgTeBKeCzZU1j3Se7xoV0sfbOe4d?=
 =?us-ascii?Q?khYep1J6yQTzsla0j02FDg+UwEcxt4mJoXHXMER4olHn7X3ZW8urhCWyqT/U?=
 =?us-ascii?Q?tEKcE7Lq87we0vpxMN403ZlJxqmFuo0gaX9EhbnouW456+1swRKXCCMuKwN+?=
 =?us-ascii?Q?IyWYaM/W/m9D1ihrh+G6iU/lnJb/SG1DSIco7WqMLtw5fUIZKA2HP+ZcuNQJ?=
 =?us-ascii?Q?cEg1bCPa+iuW16Nae4pW1+5aKbrgAfS0LwGZCa/6O6uV2dcMi1w43qKbgp7m?=
 =?us-ascii?Q?XMMs6MQP+TY4jmVGKdjtDlkkYCYPh8Vt9rOdUHStOR+mh5qi6fpN9ucErNA1?=
 =?us-ascii?Q?3KOhSv6etI73blvqIKe3YzThl05PY5+pZlhc0t0dTHhcVEHX5GVurKc12hMP?=
 =?us-ascii?Q?6lBo2MkBYReHPdGZE7uG+NDebHgMxDrfOzB0teK23wAyPS1hAlRxWpc3KCsO?=
 =?us-ascii?Q?pDESFQizqBx8NnA4C3DiXnKMjpZPGW1KWwQ8dFekI252vMHLChlYmS7XNb8t?=
 =?us-ascii?Q?j7eEj7UkjUryiQq08uqUKV1bXy/fvAjY44Iw2/5x0aBiZh81VwMu82EV3xxW?=
 =?us-ascii?Q?n8y2WUYBPdF4dwivT0W86tmz6eAg4SEORhLeGeZg5//+Abf3eQmsmZ8Z6x1N?=
 =?us-ascii?Q?m5I0Qr4loW478nryN+NKUd82RddRmcr5l/XHqwgafzTyRu3Oe1Drh7g2TRpi?=
 =?us-ascii?Q?qF+MlIxrq0BxcAJJGpdCpHohJDN/fOdXrAhEpM6biyEl12XOqJgPensTp2CB?=
 =?us-ascii?Q?c7R5DavmumOx+eIsRjsBx8sCf+jeIK3OvkIjydIW9M82vCoW317otzXn9T2g?=
 =?us-ascii?Q?fJMwn21E1CvOSALocywJS/6skIKXHCCHmnWYcVLJ49hIpEDrC704ai5eEFeL?=
 =?us-ascii?Q?6orAXeEYWBz4X+9rQQuxrUl92nnD8qtWh223pm8tgkRHOUE7pyOqHxFapAQ0?=
 =?us-ascii?Q?1twdPHtY5VMEFkqbUjlK4xw9t5K7DINogXnj9tdAio7xeqpFKOwp7UPOa1fU?=
 =?us-ascii?Q?rBcGWSz6h0NMZUFdg7I8D58N61y9Y7x8OyIZ2xE2XRzvPROejOaUIjO4gmzt?=
 =?us-ascii?Q?L9xEu9z+o/wPC3xNFcZggysCAXSxPEBnp5+fUbrp/Oyyk+zY6nHU/PR/X4qF?=
 =?us-ascii?Q?EVRFvr6gzMTbh1aVN5jpAcj4+l6vMcTO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hLZnkDSchSQIAaX2s06CIZGTic+tttcPSFxOinmJrt75DDqllSCs++bZmIkH?=
 =?us-ascii?Q?tvXPKYFCv0m5j1Cuuh4Iimru4X49n3bSW0Xu+jWkxLfLBKKgzf2WvwvVfbgr?=
 =?us-ascii?Q?pQ/yTIsSFAPvrYDpPjDLd48JTKhmD0deyu0jcHrz2JqKdM4PMmaw4bF+oBrE?=
 =?us-ascii?Q?NdjddBpA+t29JOQ0HuAu3cAzS8dM5/TE7Ie72dCEBHkr+5x/I5Jq6gwiAPnx?=
 =?us-ascii?Q?VRDeStF5Ry+sIPgPl/kh3GW/131gGt2wuZiMWdoglZLQwDww+89BS2sf5J4t?=
 =?us-ascii?Q?hgea1/R16Y8ip3jyaE28L1PpQrRg4UCWYjMObA2exXvUcb2+230C53cpqyEL?=
 =?us-ascii?Q?mk0vdRGbLc92JFlnLdlD9eqmb7G2u8KyZxTC6hfjFCXChExwY1tLO1pHn07k?=
 =?us-ascii?Q?07i7Efb+daos+Clp1QJfFQchSrrmXNAdnKAusodcyu96QJ+dziXsecZzneUe?=
 =?us-ascii?Q?hJcsg84/sO5G44zfZ+nfdClAPZJMsHzye5a8oTTayyIoUR4QWNJveyiM0ayM?=
 =?us-ascii?Q?irIeKXW2k4Yn8CapT/fbHsA4Jg3mZPapYbeCF4ysTdbgknSc6HgNZKIGZV0X?=
 =?us-ascii?Q?2TxffqbiwgUh6Ene5Il4ICYN2dSHJAVpeNaDyrVvWAalg0gTKh+cBN6acHol?=
 =?us-ascii?Q?81U/ne2RLzE8Hz/Ij/9KQrprBy8iGLNppUV2f+0dNIKVIzTjzqQpCXF46tbO?=
 =?us-ascii?Q?40DqDpcFLTCxudYJxeaAZpQPgMUGnnBv3C5a5EHcBJpE1ODVSTbFNlqyOCL1?=
 =?us-ascii?Q?I7AroJ0LHpJzY8x4oak2aO4aJjW/6KgOyMFgci9gFp6DqU7sOjDMQbBARlZn?=
 =?us-ascii?Q?vGgvkc7tnA3GWRJrAEMR3HC67dhuCL/LHoMrRfCpxBbIktWxQzGcstpGSTs2?=
 =?us-ascii?Q?XFmN1JOLJKpPBoROVPt/plvF64k8/urj2W611UplU/NiYtW23BP6KNN9fMoo?=
 =?us-ascii?Q?VV0ZjzObOff7s7xVrnY7+5QvX3B2Lt4DKM3MPZ5YI6SDOG8k9PN4TPVRBI1r?=
 =?us-ascii?Q?EJyDl/2F4JTxr2L0LsY8ssb/PotvWRjYOjAkssD/8bWGHAA2wOh0wOElr4Av?=
 =?us-ascii?Q?SYipTSgLZ6lwS7es9ZzRF88MaeZgDJu2Xt+pYvrcOhnNuwvylYl74Q0MyJsF?=
 =?us-ascii?Q?WWToGMmZo4PjPuawBeo3zbAsNNK2dD5t4DJxtxevDQ1uTwvwE5DwFG+BRqbj?=
 =?us-ascii?Q?kenDtBXhewyMdtYYL5tZzJj2/5sNVbKdiyN9+eAhAvv2PMNwsvM+2KYUpjat?=
 =?us-ascii?Q?uYg0OkSahLO16HdLMCG2n2B9D/RZEqan+qnPgPUG3ykl8IDKJFqG8JtLp8hl?=
 =?us-ascii?Q?1U67wN5nPLv++zql+yxtSFQHqJimaud21MYLYy77RrQuX8v286YCgJFUC9ct?=
 =?us-ascii?Q?83too9/x9oZa4MIoJVQg6ZJgTmR6IYuS7JZGqog3PWlUdbbLt5ohQtHKic8q?=
 =?us-ascii?Q?jkrDlyJVDQcp2m97sCBS34aPPTc7rdyBmXeINeGjPpl27RS53g2XtbJzPpKd?=
 =?us-ascii?Q?UsbgZ81qKGkLswF/u0ivx8KelQFeajlAf8s12Ca4HO33gpJFyFHa1dzLj8RM?=
 =?us-ascii?Q?K6zIwm+gm2T5dv8zn3MlW0Y/CsV+4e3yybqwIba2+yG7Co81K9UiTHk38X9D?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e36371a9-2bfc-4fbc-d42a-08de199dab0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 23:23:30.4939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC1G2OncunQtrYUsbA8LVpDXn+b/kh8c+e24yc7swONfMWC4BEAQ9Lbictp0uDVPJtAWOp+zjHaro54WLEJsdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 31, 2025 at 11:29:27AM -0700, Niranjana Vishwanathapura wrote:
> Support dynamic priority change for multi queue group queues via
> exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
> the drm scheduler message interface for priority to take effect.
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 12 ++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 56 ++++++++++++++++++++++--
>  3 files changed, 65 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0264cab00fd4..98f8f1c7f13b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -729,9 +729,13 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>  	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
>  		return -EINVAL;
>  
> -	q->multi_queue.priority = value;
> +	/* For queue creation time (!q->xef) setting, just store the priority value */
> +	if (!q->xef) {
> +		q->multi_queue.priority = value;
> +		return 0;
> +	}
>  
> -	return 0;
> +	return q->ops->set_multi_queue_priority(q, value);
>  }
>  
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
> @@ -760,6 +764,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> +	if (XE_IOCTL_DBG(xe, args->property !=
> +			 DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +		return -EINVAL;

This check looks to be in the wrong place. There are other valid
properties, e.g., DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE, etc...

I think CI is complaining about this too.

> +
>  	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>  	if (XE_IOCTL_DBG(xe, !q))
>  		return -ENOENT;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 964a0e6654c7..dcb55b069ed8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -241,6 +241,9 @@ struct xe_exec_queue_ops {
>  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
>  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
>  	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
> +	/** @set_multi_queue_priority: Set multi queue priority */
> +	int (*set_multi_queue_priority)(struct xe_exec_queue *q,
> +					enum xe_multi_queue_priority priority);
>  	/**
>  	 * @suspend: Suspend exec queue from executing, allowed to be called
>  	 * multiple times in a row before resume with the caveat that
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 5ec144c1c2dc..426b64ef8d99 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1761,10 +1761,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>  	}
>  }
>  
> -#define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
> -#define SET_SCHED_PROPS	2
> -#define SUSPEND		3
> -#define RESUME		4
> +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q = msg->private_data;
> +
> +	if (guc_exec_queue_allowed_to_change_state(q)) {
> +#define MAX_MULTI_QUEUE_REG_SIZE        (2)
> +		struct xe_guc *guc = exec_queue_to_guc(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> +		int len = 0;
> +
> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> +		action[len++] = group->primary->guc->id;
> +#undef MAX_MULTI_QUEUE_REG_SIZE
> +
> +		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);

Just to confirm - even though multi-group priority isn't part of CGP
rathe the LRC, a CGP_SYNC is needed?

> +	}
> +
> +	kfree(msg);
> +}
> +
> +#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> +#define SET_SCHED_PROPS			2
> +#define SUSPEND				3
> +#define RESUME				4
> +#define SET_MULTI_QUEUE_PRIORITY	5
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1788,6 +1810,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>  	case RESUME:
>  		__guc_exec_queue_process_msg_resume(msg);
>  		break;
> +	case SET_MULTI_QUEUE_PRIORITY:
> +		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2004,6 +2029,28 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>  	return 0;
>  }
>  
> +static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> +						   enum xe_multi_queue_priority priority)
> +{
> +	struct xe_sched_msg *msg;
> +
> +	if (!xe_exec_queue_is_multi_queue(q))
> +		return -EINVAL;

Minor nit, I'd move this check to the caller as
xe_exec_queue_is_multi_queue is available there, then assert it is a
xe_exec_queue_is_multi_queue here.

Matt

> +
> +	if (q->multi_queue.priority == priority ||
> +	    exec_queue_killed_or_banned_or_wedged(q))
> +		return 0;
> +
> +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	q->multi_queue.priority = priority;
> +	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
> +
> +	return 0;
> +}
> +
>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> @@ -2095,6 +2142,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.set_priority = guc_exec_queue_set_priority,
>  	.set_timeslice = guc_exec_queue_set_timeslice,
>  	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> +	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> -- 
> 2.43.0
> 
