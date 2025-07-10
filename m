Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAD5C83F18
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 08:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D91210E1B4;
	Thu, 10 Jul 2025 08:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xb+l97Au";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444E410E1B4
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752137046; x=1783673046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gQDvFk9dmLbFQtlyBV1ncltF0d+t4FuMw/CBUtNpQiU=;
 b=Xb+l97Auhg6ZlvlqcZpxIqjtehs9FE+HRuMWFhtwGU3P+lLEdgnznDkT
 N35SNnOdwfIGgb7I7c8LsbE/DFR475+sM3o/cBMW0W0/1f2D3g9rnZOaU
 UvGM7f4m3Cv22QX4yp0JeHPJ7jrz+LE+b/TmryeNojoun8NrSILwleNdb
 7XpHhWIy6bSVFTh5tom+Qx5JK0UfFImO6UPttAuS9zMSneXIUlCOR5rCL
 3Xk9JQAcRCQ+VN2RCvD3dr2maaM2Pr7FgkwROS/nXNUPqoYJRuVZpOGL7
 DK5cUO0q0e40yVuKNmWOoS4TxQD3Dj5N676uLRlEL4R3lRrdbMG8Xf+dr w==;
X-CSE-ConnectionGUID: 8tFj26FoRzOs2d23C105kg==
X-CSE-MsgGUID: X7KbphHZSamCtbN6DxLIbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="71856906"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="71856906"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:44:05 -0700
X-CSE-ConnectionGUID: 1jMuhmjMSZClnDYMKB5LXw==
X-CSE-MsgGUID: D2X1s2irSjq/VtT26+H5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="187018135"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:44:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 01:44:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 01:44:04 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 01:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NII4FG8snauj5W2kd0giJsceHFH9qzBJPwDg5+rBNoy32j1MvH0HQ2CGcB/G9hTtuqFVyKJERGFkEGgrKEGkPnu6oW82gGw73hK6HMyqL0piPVId22vzyfImC5pEtqSP7b8Tqn9bNozZuJkD/+NzTg+LMnvBxtaUpbuS8QbWhvmBNTddAD6sFEdPlHS5n1txQQulSfzf4a2CPROvk6ewJAFPZqijO0NWKvkvfdUMhGTsYtRrFiVsNdWvY6IqWlK0Ap9ot7xKZSjxXUXN8D+9uav5MWdduBaMrEcuCd++iFyLX+y+0g77s7NYnjTAoT4xthJ6mjfCnUXMGonWJQNpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS4emUXGOPkkHelYScKb+874q4xap05malgSDBe3fl0=;
 b=GcAtKVXYqIXiuKysfJ0inGsV7Qfay9tRIZa3E3oFvcmHbSa234Qqhc2kxQtd59xKzdpWT1QeN75eWzWZBv8VDdA3e7RgTU9n9leQYF8gQzqaL6+2jPw7RmMUtXqvQ2z3VJKjfvcw57dXf4XDVrnWXCN62H5rc99r2SJPFBV8YjGP5R/nfPKujGwm0ciRgYrP18FzN77f4y77sNyNEtkGuOutMSSh47Hzw+VDcPOvJwOMXEYIS8+p2weNSQozEM0/5UzlXIZSFHSJZm/KcYLlUUEphsRg8eGkksAfTfmmd/E/cAuFpEdNjgOvFPfI5gEYdp3D6nDgROy526R1cBefaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 08:44:02 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 08:44:01 +0000
Date: Thu, 10 Jul 2025 10:43:53 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 1/9] drm/xe: Explicitly mark migration queues with flag
Message-ID: <aG99SaY_t-l_bVxU@fdugast-desk>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702234222.3278264-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0291.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM6PR11MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: e6452bc8-b59a-48ed-9182-08ddbf8deb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8GWyPxDxspQprEMja352xFriby9LrfyKnO+nlHK692htWLuji72XGQUZU6v8?=
 =?us-ascii?Q?o5GkdWqqLtOwKIP8/525YJw9aMJCp1NvrUfg/V82H4e8YwWBOdn719u7nyjc?=
 =?us-ascii?Q?nlixW41N4ELs41cMtgTnOaZRXQNe3h+7RyXLDX6+khO436Y9GujFwOWW6VR/?=
 =?us-ascii?Q?jY4K8lgck/48rewgPwZMMZbOiPj/SOuHl6H/L8hgLgC6j8WP7AEqVHsmy9hm?=
 =?us-ascii?Q?FB3bl1Jhx3ljSVJ5QfxQmjSOF0sYLZc85u/fv8nq/yUyegdO8yILV7ZO1DEL?=
 =?us-ascii?Q?ZDw835+0689WQmxjbBdxYtvNSw3QWQi+3sJLtZDQMeI6ODSf95VV18Y3IYHX?=
 =?us-ascii?Q?PpkyeB0BGyuUP/ERjXo+E1iMo3cJ+u5Qe5INmkhYOVxQdGDK9jqwXSlHfkEm?=
 =?us-ascii?Q?WL0WTvrzoujmhFuXH5V2j8vhoNHwmhO7go7tyW1ltMq4aAhsYoLvbky4zy51?=
 =?us-ascii?Q?IxZeF5ULixoQtSfD8CtqIPBnxtA3CADxQG5EZJwTwcVtEuK55ZwSaVoKW91I?=
 =?us-ascii?Q?B/IkUrNuOAZajC96j74RkbPDh3Grg3o9lg/mVIoT7hR+tV6/OxeW8tNSCnSY?=
 =?us-ascii?Q?adq7iWm7azUCtUrwbvGDh/5qQkxzqCizrMUqk8uUjY0OX2gkMAs0wsiXjWsq?=
 =?us-ascii?Q?/PVThGL2O8EQWFz2ZCRKzRO3zv2TKzjmyQRD68u15HTU/Q3qWeGTJeBxtIci?=
 =?us-ascii?Q?zM92hMFghY3aovqfyAYGYW+C6fwcO0j+g486EOZiPgjYMJGlx63Wdx59rMZx?=
 =?us-ascii?Q?8CeIab1eugVVduzLuPYBGYjAXBaXMPXDsppmadaZmPl2WnjsA6KdGqJhX2wx?=
 =?us-ascii?Q?sagEoBmbYQu6/c/OUrWkcBtqBaIF8fu8dwfupjyNicNCxS+KyxWn/8+ay4n5?=
 =?us-ascii?Q?jO3M4MaGgiL6OkM7GzHW2k1p1NZDLkz2MuJhHfwGYjWyxLQsQlCe1UaXLr6y?=
 =?us-ascii?Q?eh6DET7CxZuWWFef9y501cPy9QTaOE4OCC3iXwNB8IXcyCzCJKYpLf+7Qde0?=
 =?us-ascii?Q?WNSj7ksjhZx8CsalO3/sJUWx0D7gmsCc4AaZryPKXJaOyxH3JnN/N3CJjpnJ?=
 =?us-ascii?Q?TkFEh3Tm5sMfBdBCxqOXCqCKKZTs0ElrDtv+OguDKUJiN2cspW3ADP/Mcdr9?=
 =?us-ascii?Q?eAD4+BToLuDPJpVCsyqnFTN8osebFSS9pnlGczXFw0YauErJyOuQq+ICDenj?=
 =?us-ascii?Q?2eumQwe6u7wNW3cFVpPICy38OTf4Wivuz/u6SW6ad0m3CTGdnV9RG7blAsC4?=
 =?us-ascii?Q?iBUoKsb/UZGopdbb1+uegUupHT0rSmNsvAUm2kI9yOn/qzAuXIEkuXOctDhl?=
 =?us-ascii?Q?hNtTuHopXKi0uuotYhUgGxgwbfw/hEDdgqpXkV/lwSfUPzH7QEvhwS31rL1U?=
 =?us-ascii?Q?KZMT1ejCgk35EbVh3V0VpVdip25OP/bxfMB1kg30/XgRJuFUS6mr+z/2+bMA?=
 =?us-ascii?Q?kTwRuXsSR4Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3fYy1b7+7t5+wAqvdfWLakbGKRxmDuvXwRtwlhsG9Zefgw6o7nOX+AUglDzf?=
 =?us-ascii?Q?3prPiWFkuazotZMuvkbUpwjIi3vRopp8BHqNPfmrB0r/nfSjkAQfgqlRTrB3?=
 =?us-ascii?Q?wnDseYgY77x0y861Lz+VcCWmA4JD/wev0tbLzN5twqMcmvCFx3cMRSlqpaNh?=
 =?us-ascii?Q?BYHzkXFojTqY2yQBokK68401/GdsbNbOVGWBzGFLAl3DvqWAEWI4glQk3hJy?=
 =?us-ascii?Q?+uV6ycGL20NfZSkoLAqv7W0E5E4toViu1CKKbAkIVjY+RXM/C67miCbXfFYM?=
 =?us-ascii?Q?rw9sMuldAPdLhRf0kHEK3rNcs+4TScCU1pERBBC74kh9jAti6smRmFSRTp3K?=
 =?us-ascii?Q?f36g+oAraf6dVph7BLjb+DXNfwepN4Q3287d/bVMGi1o5iGycl+gRkY9xNOw?=
 =?us-ascii?Q?XVI2BvsZg143g+GHAg6bkEr2d1995FuF1jzisqaGBXTqlQTXA4QE5NwhEA/+?=
 =?us-ascii?Q?r+zfG3sQ559/zoPX/hCCBkU6UJV9VKxQCYWFThIPEzif5GZ0kyH93NkkM1yM?=
 =?us-ascii?Q?9NoBeNyLTpyAAiiqECYBvjxVKE7tJRWdzDJ9CzMxL4YrTyX/Ay2By/doV+0W?=
 =?us-ascii?Q?QlP9SSrHpvWKpW6pV0sTC8tvpbWU8OD0poli03heZGxE/avYZisxOgRilFTj?=
 =?us-ascii?Q?FleXXvjCSZCGN6reeVR04bIjoIMu5uGzpUex9YHcLwW+Z/XJZsXg4LnZJ1ie?=
 =?us-ascii?Q?IcFzLm8q4xdequSuRnwDgRJM/2uj5yusMDYrNu2sCtbMBn016axMQLk8PNu+?=
 =?us-ascii?Q?WBmqleYxb7+MiJP87ifCJnGP17xbiowdM7ELdTI+RJM4w2fBGDt73k8Yi9AT?=
 =?us-ascii?Q?Yf7jfx3N/n1tFEoycXdANoHBGfHg+NHSVoV4HYpYZENAaMBL9TOzVW30GQkC?=
 =?us-ascii?Q?+pIubMwKFL8WCKhjg9v06PEtwfXDZ/EtJk99fw2CIWCYcavbA4AJ9d8PMEIk?=
 =?us-ascii?Q?sK+o779WFLZ04H6naSKGaakelsvd9OzDi1vDQj2dOqZxT/pTJhmiTg3tDpkF?=
 =?us-ascii?Q?75X0TuLlFb1FlgbAYMyaQ28lcBRuolkB6XPJ1NYW+xvj8aevOEoi49arQl0X?=
 =?us-ascii?Q?/rVUYWE6rws7ylCXwCd3gyku2KU/8FGrZJMj9t9vFYA9Tj1D/cy7LawZHnLT?=
 =?us-ascii?Q?BRM2gsRR3bWDIB8LWIn4uvBo5bfHRXpsgslleaNi2ih/1hy9OEY7498CItJy?=
 =?us-ascii?Q?/9u7ng0CHr06jL4PcyT9jm1mDiqlRXas021kgu27yEFfgJDujBPAdsss2aSx?=
 =?us-ascii?Q?c/tPZ1EBbviNtPssFJsJUzl5UvEVVCZQXMMoU+hCry9rTMG1pjMIiSPWfueo?=
 =?us-ascii?Q?vm6+Tm0lrq1JZKWT8lnVmtOxEgjZsao4m2xbkaCfERw5jOA+lxgXxoExzqtC?=
 =?us-ascii?Q?SseXB2zDcW61Mi0O5+dYkFI8GQ0JqL2vpTP762VW4aWHNCJPczUj66MZGlR4?=
 =?us-ascii?Q?hLeT5brmxZnW94Gp8zngV4h8lS/HHngBwPX6UNWf8NlrrG7gWeafZd6lOq88?=
 =?us-ascii?Q?7SGErcjb0mynMr7KcoIG4PYgN3pK9r5XjVSulAcfvtnKCU/uP0nNP9MWFUPx?=
 =?us-ascii?Q?I1nQq5aspBGknX2IV5mpLt1Ya+YicnHML7eZzz76fA/JHaN9wtr1hnZD/A3o?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6452bc8-b59a-48ed-9182-08ddbf8deb63
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 08:44:01.8823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kn6BU/P5nFNFbvWzIR62hou51NXjGra0IP9nqIvxkjsjx9paAiZmNZNfubkLKKyJkH0yhYcyOaSbmj1JuQbkU5SAfMCOJP4dRT30NjGpZVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
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

On Wed, Jul 02, 2025 at 04:42:14PM -0700, Matthew Brost wrote:
> Rather than inferring if an exec queue is a migration queue for a flag,
> explicitly mark migration queues with a flag.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_migrate.c          | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index cc1cffb5c87f..abdf4a57e6e2 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -87,6 +87,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
>  /* flag to indicate low latency hint to guc */
>  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> +/* for migration (kernel copy, clear, bind) jobs */
> +#define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 0838582537e8..b5f85162b9ed 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -437,12 +437,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
>  					    EXEC_QUEUE_FLAG_KERNEL |
>  					    EXEC_QUEUE_FLAG_PERMANENT |
> -					    EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
> +					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
> +					    EXEC_QUEUE_FLAG_MIGRATE, 0);
>  	} else {
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>  						  XE_ENGINE_CLASS_COPY,
>  						  EXEC_QUEUE_FLAG_KERNEL |
> -						  EXEC_QUEUE_FLAG_PERMANENT, 0);
> +						  EXEC_QUEUE_FLAG_PERMANENT |
> +						  EXEC_QUEUE_FLAG_MIGRATE, 0);
>  	}
>  	if (IS_ERR(m->q)) {
>  		xe_vm_close_and_put(vm);
> -- 
> 2.34.1
> 
