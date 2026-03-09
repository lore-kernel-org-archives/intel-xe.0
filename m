Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30CEFCA180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 20:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A4810E5B9;
	Mon,  9 Mar 2026 20:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DM/ClDue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AC310E5B9
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 20:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773087575; x=1804623575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F7Rn3QKrTa3Z17QrVFKX/GSo+zqEAtQus4Q+w+xwXro=;
 b=DM/ClDue79ExooA0FKTYaOQY/QiWjxCxTzAuXb5vyOMjrm2hJkTNFnkS
 5KHU4ynWSGNgUj0szQ+tYRGkTDXfHuSnKXgBVCEmZq3HyGf15h14LgMRj
 QRDL9A1w3CbDcvQgW+htVZKI6SLSqVodvWzW0q+w9Jp+eIyYRmn6quFXi
 Uq/0cfm8v83fFXnGKvezNH1csjmPHzm+xV/5Ox81US6DEJ9/LvNNP7qVv
 75wMAG1WhW9i7DWDXQXkU0Kg96qbza0n7EAAjPwY+JAs5sCg1Ll0j0WK+
 U4BO2o/+LDQ5e2HwWfL2TsPJZ1WBayZ9YehYoZ0oPK493Q5kWjOwENdOB A==;
X-CSE-ConnectionGUID: 9pWrTKdUQIicOo4PIiv8Bg==
X-CSE-MsgGUID: /EHmF7wET+SnuIvQBm4lyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85596733"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="85596733"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:19:35 -0700
X-CSE-ConnectionGUID: rNosKufBQvWqalOC5AO6Mg==
X-CSE-MsgGUID: 0lSnSsYoRMim1gKTn103qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="222514717"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:19:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 13:19:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 13:19:33 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 13:19:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVABTyFzQ7d35LEnTVSDH+4sNJAPq/6wPSDX3ERjRMQeiJhm2oJDuzykA/3vSrp5Ap0QJ+IV6Wq+jeuA89DYWXa5JO87cV/W8Iuvr1XQyhPzasra9BP+EOT03Q6qRt15whnDKavclR9WnlnLuKtNCIzYKCpGkAVhiDVQX6oQFf7hS1NVA07KYLF7X++2/O3MXai7J+lAPgiJQuZb14N/uso4LzmjSkLEW/BOmikyMpe52Towee3tDHnnylO3tlEpLoaUrh9znhMmMLUksjK1trRhyOsURtEt2t/FhMBJhNJSdJii5vrQ0yvz54UXNJZKUivMMki8grJeETze5C1OIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKJRB6m7Hl38Wb7RPXa+mzS9RGRrO4MKT1ouYPj/+74=;
 b=Ihm5ELrrDv5gNtcgARHVui1Qajg85VDzhfc6OhpqkHQMcaosJfkpJkPmAQTL43cuKmCXkXFzEA8AvCUw1X2l6O9+bzW4vSUeHluIMHWxl4SOzC9IwnUKn4Is+0Ka9ahdomLdzLvWIJZQVQFHKcfiEqjm9N/UXBtq52Au4L+9jQAni1hxLOh95EDia2jBX7U7ZaaXEU5KNjPsb9Scx5RUEV6mkba7RXDOmpQdKtkzcgxRqE0nQnTzYZ0fd0JQJNy5PBf7dHShPHBg7X8OcEOb/2ejAeJMwQDRFI3lGxnnUoRoyHY35UrhvIhYfoQ5NLA9hxBuvY9sjxzzLBiN0EaFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 20:19:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 20:19:30 +0000
Date: Mon, 9 Mar 2026 13:19:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/8] drm/xe: Call xe_wa_process_device_oob() after
 xe_sriov_probe_early()
Message-ID: <20260309201928.GZ4694@mdroper-desk1.amr.corp.intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
 <20260309-extra-nvl-p-enabling-patches-v3-5-0416900dd498@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v3-5-0416900dd498@intel.com>
X-ClientProxiedBy: SJ0PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:a03:333::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: bb239729-7215-45ba-ceb7-08de7e192bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: QFceEY80mF3NQrTlq3CwlAYy97eSzRyC6pCPtyMy3hg7HFL+JqURcEFdygu2lWT1Nm9B4gcwa+Q1+pDTswSRPTp9kPdecitqjAzx7XYgyIokVtXEIA8YRGd+DAbm61iyLXvtFJwEw5+LY2CgKSxstMIxPXk9MuGnro4LcSC/o4JiCp4xR3g+mZvDCOgyHyJJ35Rd9Rm3u01G6QpKDZZO7MWaoNil8X81y8pU9y/E9isDgVD8aFJdNPg+8U0eK1W4Y5+hSyFst4hzN4i9xmWGeY+tk83YxDjfPMAkWXu8boQ58TDkNVJT+7kL9Hbp7eDAXJho3Cj6QvFKhKqgGkJ9RpH033w823WN0FVjh2XLIXVuKqqFwnC32KGwK0b0TXMmgfmvUy70QQJo40hM3jZZUeROUquOEDKFVrhTOvtnvGc7Kx3JRoLCbpgCA4hQy9x7Lg14ar6z7MFhu4ogUPE7Vdmqb07nvyiK6CUoz3BF3W3ad+RMkJkeAHKC8pNCfoNIpllfaH0KwA/U/lxYqpMi0EZS6O8ivkt0qUpAbg7Z+rpVE+O37GWNaj08XqMCjzodPjs4iIU570ZKNaQAoFrklHmA79x2GtzzUBm7T4JsoQEEr3C4sF5dpFwOF1SHbY+4eiGRkTsEDhfFaY0JHxnFVhL8+dQjjFCzUEtaSA8BOWrP9LrOuR6vUjdk8krZnWq83BtM/fTBxZOf9qUfwpXFjxr7hju09xMl+OhgObgVI6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qQ2AkPCntn53Qbx9/eyqXJPvwjtsKMAMcOjvX+WAt6S2pQUxJuJr39bRomnh?=
 =?us-ascii?Q?y9Pi3OVN25f8c6Yzigjq724fNlGAC5CTtasdgN/2XIvnTpUBchvNnnKk4Voi?=
 =?us-ascii?Q?oMehXSXMJcDropt4ajXHeJBlUY3n4y2jx/bEpVNVQDvstPFPBbDifPuh74oe?=
 =?us-ascii?Q?frf1fYlwFbJAgdqu/m/mZxJo3mT1NsbSOX0zmjuM9zuVma92MfAAMZZrTQkD?=
 =?us-ascii?Q?xOSupgUn7JlUyOTd4xryHjZD+fXMXgJqHDf41eDdS8oZMhpN4l94M/5Izv0/?=
 =?us-ascii?Q?SREYIWRM8E1VpOLP28eHjMcN+0onxUSANVazsBx74o727YdjTv+0IxudKPP3?=
 =?us-ascii?Q?iiFpjdCkYkp0VGI9BzVorVo0riGCEYbX8LqmcDYbtBOkV6cMQLmfBM3QRLJo?=
 =?us-ascii?Q?E4mCImXS2fNtqkTvQHLXmFd+iOksJDjtCS4iH4YnMHOA0+i0QY+JlcvrbZUg?=
 =?us-ascii?Q?q5MQ2iKWrNRQPw0P0I8ujat4oSZImR0JuV+r2hV6ezsT9PY2EG7BB2U9Y60a?=
 =?us-ascii?Q?OGsyDvZLW+Ckj2S3nCfF+k5crw/58Dgdj+idPnnNj/s9CfZ8zyraXmZSpoX+?=
 =?us-ascii?Q?NXX1kf74ikVXYnzk14N3IhQ8sQjXgZtQfo6qfmu1N/Stf9y4WTf2oMsNSP43?=
 =?us-ascii?Q?2T6GERU3LNZq/ZCZbjThB8h2n/9HF/bRnLIeLBsF5OZLt1jYHSGl6v1ET0dd?=
 =?us-ascii?Q?OEvzcTNodcy8JsKmlEXRkIufWd17fPzOaiIqTzzGCWVl3LWhuRRJXTotEdUn?=
 =?us-ascii?Q?MgvChHSdAFaJhBL2+4HK6vRtm4+rIrlhwguSzgGgQV8TTyCadpuTOkqiUSp/?=
 =?us-ascii?Q?c/vDEqyJaBShmWBMvJvZT+atqT03i4mPwQwYQBbpfJmgmeQixsxsP6nOl+XY?=
 =?us-ascii?Q?ziDy6fYYE6KdnsIfz9JBXfB6gFZpncjR4Z0ZBGCrZ6ImR8jrJ0YZ23telMSu?=
 =?us-ascii?Q?c/GmFlw6Is7hedVOO2bQUpAuTtDyK9It6RTY9sbQbt+gkegoojknVrqlxnEq?=
 =?us-ascii?Q?QLQD76MIuTMTMrmAgH3hj6pZhOnKHtg1WYsZlkJCHU9PztXSWfFizkWN6JLA?=
 =?us-ascii?Q?uI0I4dD1tf9P64zwhYeS9K/rdJFfPbl8GCmR0OJYiUfB9UpkcK7VLdUyDAtG?=
 =?us-ascii?Q?PIWaWRJ2vef5q2LyMg04VJa04j3SBpsaQDy9NLHXMmDIuzbjdkQQnCdUxrJN?=
 =?us-ascii?Q?2uoqB4eUPY85XuGcv46QNScAmJ/EAywHaMZUuT66kypdnbjy8mBr0AsxHtEH?=
 =?us-ascii?Q?Ngozhk4XoRdkB/s+etnO30+43LBMwCxhnxzsi4t9RUB/6Rlc+cv77eM6qwDM?=
 =?us-ascii?Q?UdflRDmT3EAzbCYSTcVSJ3scKlIyQHPDd393zd/YP6Tq1Oc1wWpY9/ztz8I4?=
 =?us-ascii?Q?m9Y1p/RbXcNpKJOEDZPL3FtMMT40gsVEFG5CWDYsPj2nUyk7Pjzg7On2nQUO?=
 =?us-ascii?Q?s8uQRX2pjmSt47RXmWrVT0VyHEXdZ4GUseLbYXg/JlWu3T3gOrlLB81rku/t?=
 =?us-ascii?Q?iXvDaEs7LsbY1iOWoSuqAn0m6O46+6ddK7+z4BxXV5QRCDQ3jUPQfk7lD7uA?=
 =?us-ascii?Q?018+rygqoMBSBR8JSZ5ovAd7VhUswzSosYMjrFPpoDk3ATiECdxxcdhhmeUy?=
 =?us-ascii?Q?KlD53BtC1aUod5uN3K8MYXgHUkOe/eJvHedizZdHr66MLnPYWgXpQDDCuw9W?=
 =?us-ascii?Q?FVT4IpkWshd4+fck8UyMQNTl9KkiHdL6zi6c209I3uRUpSNkfnv1TuqBru+4?=
 =?us-ascii?Q?9kuVuejaKY74Bt+N1PbdTFmJUnP1nMg=3D?=
X-Exchange-RoutingPolicyChecked: eZmP2uepdn/BOfKwwuuq7uIBE8kgT84/wKR0xYFCPzt/3vEeh8hVXmr8rqXiJOTNkdn++NKsALLxSL/yEDk0h67+yLoqZJnAMqPxNhLS7o7uZljGFEJYj6UOUrf7Zq9itDbnbZcxzgi5kFPNf++IiLB2GrO9yuPS1xe0kz3rdZXufIvzlwutM+fAscloXV+3bhM8b9R/2MTGdgdl1rVtFaiSh1Qz5SxOdmdYwcLeVVUaoPUS+r5bznKjSqC3i2Os6+FuS6kaKP6jmraXWzFe9Sq8WadrmgBO5SWbi476RxEL+n7C5auj4qq16SviWQ4PCImjqO+E+fInUl+FZ5c+yg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb239729-7215-45ba-ceb7-08de7e192bab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:19:30.6993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DlSwLrfirBQv5HQP9SPNYHHGG3Myn0YbBt/RvGURVlMY/mGlkI8zH/q2uGxTggpsPUcEsjof+4omeMcbOpEubXFSDdKe48ArdtK00k9wRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
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

On Mon, Mar 09, 2026 at 05:07:33PM -0300, Gustavo Sousa wrote:
> We will need to use FUNC(xe_rtp_match_not_sriov_vf) in an upcoming
> device OOB workaround and we need the SRIOV mode already defined by the
> time that workaround check is done.  Move the call to
> xe_wa_process_device_oob() to happen after  xe_sriov_probe_early() to
> allow usage of FUNC(xe_rtp_match_not_sriov_vf).
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Seems okay for now.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Like you said earlier, we might need to make additional changes to the
device workarounds at some point in the future to allow different
subsets of device workarounds to be processed and checked with varying
levels of driver initialization.  Maybe extra flags in xe->wa_active to
keep track of which parts of driver initialization are done and which
kinds of rules are usable.

In theory we could wind up with device workarounds in the future that
need to be processed and checked solely based on the PCI config space,
before we even map the BARs and have register access.  But we can cross
that bridge if/when we come to it.


Matt

> ---
>  drivers/gpu/drm/xe/xe_device.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3462645ca13c..5651bcdc6752 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -699,15 +699,15 @@ int xe_device_probe_early(struct xe_device *xe)
>  {
>  	int err;
>  
> -	xe_wa_device_init(xe);
> -	xe_wa_process_device_oob(xe);
> -
>  	err = xe_mmio_probe_early(xe);
>  	if (err)
>  		return err;
>  
>  	xe_sriov_probe_early(xe);
>  
> +	xe_wa_device_init(xe);
> +	xe_wa_process_device_oob(xe);
> +
>  	if (IS_SRIOV_VF(xe))
>  		vf_update_device_info(xe);
>  
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
