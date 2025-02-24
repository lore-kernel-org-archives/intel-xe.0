Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1263BC021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 14:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D791110E3CC;
	Mon, 24 Feb 2025 14:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDERV11N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C83C10E3CC
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740408626; x=1771944626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/0kxG72lzPSSgMvSPfgH8xv21OAryetVZVk6Onuk4L0=;
 b=aDERV11N2wSGv2sixAvuhbYtUcrtUFs2pWgMyuLPfO9HCdQr/Tn49ZnY
 XA1nXBtZhjm6KbsmqqihcsUNi7OdvlRbmIU7g5GFUMzceeKUV0Xhf9IAp
 U80MCcwWDHYRLIEP5+cM/YD+1wgr5a6XMx42M1WSrimUErDFAb8hZV+k4
 qcL0LAxPBT7y6R8MfquCw/IqCOD/R308m3BIlJXC+Z7HTlMCD5bM3Snf9
 /V7K8WXxpRBKSo1EHbXCc/76otYnZrBwclVsj0Hw85qll50Zv5Hfq+qTx
 6cPYxUwgoTuFEXJJ0WQugvf7vKBWzmjZjpInjeRf7g1T2PpubBjEgpR5g g==;
X-CSE-ConnectionGUID: Fq2QrwzJTJaU3gRzD5MqOQ==
X-CSE-MsgGUID: +LyKHcmoQq6ujhHnJjk7gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="66536531"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="66536531"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:50:26 -0800
X-CSE-ConnectionGUID: BgzabF5iQNCmjPP1bZUhLw==
X-CSE-MsgGUID: aHNTdfO2STqFzD/vh/Xy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="121042390"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:50:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 06:50:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 06:50:25 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 06:50:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+TgG65fCYK/D5uM2E81W9uFfm9lpkil36gYodfpEdWp3STHCx4KoVlQvEvW0Rh3SHvnD3pDcUdCH5zv/b85b+76V5b5+IOGHJJ9i/adX0/KQ8QptlX+51MgWA3JMmwpRWx8he0RPm8qkFiw6yPfyu47pWUXSxTxIBm82vVLIgeXdnHrw3HnVS6zwHYxKUnBzbJijnx5JysEkhVHRJ0PzdJVGXD6oaGgcPyin+OI01488JFHHWrKvaTY1pPQKAZd3H5oyEkBufb5DQ99ZFZu92rDFCVXn3tM0QH5a6zqn3IQMWjcYUl0ZzzvWnJeSi3e1EEmMDMs6JoxbVtqgYQLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBe5b1pdr8/uRTmGA5AfaaGIIhZd2H4r48m0w+1WKs8=;
 b=kFQM3N5WQG/z86pIH1IgzSckQIZVvN0YcUKGBvoWH8SLwFSDGfvYXniGRwQ+du79YxnRoxglC5r3RyaeWG76Q4jX4Gt/IEtrh8quWcJ67khmWZMbZON1RwMtHv+ErE4QE9tfMjzxB+vBx4tEBdgeZSYQr83XaaFD6BBZNJb9kPv32tqDhook3Yh5JXbvFqlCAVa8Nm5mXJOlLWarAldSgo+A3QTACuKbMmUMkJNMKpa23uoLExBX+TJ+OdHxhfo02Nn1BROqClGikkPGXJs+Oba7tceS+yAdyCNYfrLZRqNJadBcSpyFTqwPUkh9MO940HE5yeRp+Z7XSXkezfl1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 14:50:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 14:50:19 +0000
Date: Mon, 24 Feb 2025 06:51:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: cancel pending job timer before freeing scheduler
Message-ID: <Z7yHa1C7VbKj8UtJ@lstrano-desk.jf.intel.com>
References: <20250224122237.576893-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224122237.576893-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:303:8d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dfcd3bb-4569-4a1f-8d23-08dd54e28ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AWG/BZUJ/aPBoA7PvpaPAEEakaoMEWZLpB0l+42zGuMnXutRDLX97Cngoauo?=
 =?us-ascii?Q?RsRLAccgAUjifNDyBuHkHQ20fKn9ZzraZQq1oXnJgmkKIuUuP5lxs33CEzot?=
 =?us-ascii?Q?odg53sI8AFHw/RtZIn82q8pwwM2TTpCbGft06s6npqgTHAsRXM7Fyr48Yk/8?=
 =?us-ascii?Q?1uw5hSNgfoCJ3T0aHgzTItJTIaxt8bIRUFr5HhAuGcRD1FxzfALw5KeTZ9dk?=
 =?us-ascii?Q?ywG7h66tlMjQSD7nyyLV0XdyNe2ODkZnYidIxUGCfgnb11h3EgZiUP2HZUG3?=
 =?us-ascii?Q?dQq7Thy+A0zcLzmBUmcVAxbSrtf0M42Pdm7ZM+9AR1FAe2uqhRmcgA2YTXLX?=
 =?us-ascii?Q?z/zDnKDplJKnWCqDfCawNOMbT0qeptZI55VuKslEEfBkkA465kgASx9FEfio?=
 =?us-ascii?Q?5nU60854APdHUl1buNnsR395C6WM1bL4HYDLIMPGa46P9Wdw/3U4NiH3bACI?=
 =?us-ascii?Q?Gk1aZp8O9W6fFRQ0V2NZnNWZjA0/nk+RyxFsnYB4tBmRSjb6P1fQ4KKSVYIC?=
 =?us-ascii?Q?yu2ef0ryRqGDZE53ZpTfi1s06L2wONMXBnjx5mieKICguRXhtssCBcCfY30a?=
 =?us-ascii?Q?48B4KJVPbddMqDbjUcE0r1l7bRjBvHtZo7h3i+gIeorYOGSkFj1BB1GuoQcA?=
 =?us-ascii?Q?Qbt9+XlTg92ut1pGW0UV2uVUjXlWbkQhkUcf5y7IdwVWsbEBxTSCt1ePOeCb?=
 =?us-ascii?Q?OBKeWEg/i2kdMZgHK/fJHpBquEfSOB9peXkzthDL+PLnnMRMl35N4KxYF+mY?=
 =?us-ascii?Q?PLQTRJntv7JudEqS8/drLu/tU9Upj0/9KhEsfydDbDiPekBcUJ2Q2yl+7vK4?=
 =?us-ascii?Q?N7hGocs3mAFzAtxD2AlwVbe/m1f7eOTL3Z7NcZ8Uz7fmN/Njd7vUzs9W0A8Q?=
 =?us-ascii?Q?8DWug8y6oeg0+3R4CpG4yUqEl3wSXJpeRVNfSWNdIMH0qmRyaZ2Lc82uPWpL?=
 =?us-ascii?Q?Co5owrEixsPBPd/rPVD76PdRoGC3YVjao/kRNh+OJxEgjfvcTfTyYpsLzExg?=
 =?us-ascii?Q?USQGzxkYg1CcCGEpemjo/qGO/J8Os0I6Hufmj/WpHvfKLPOk/rU8k6axyLNf?=
 =?us-ascii?Q?nyGc3/ziC/IFez7oGIw+RKxaUmAkabV7agyfhYvqpXBXCNvKRz03HdVwQdL8?=
 =?us-ascii?Q?3Q8k5YAjyHlhn71kh0PpLypeyP1d1T1Xx6OymwnOk+3eHQJuXtK+1UW2WSUC?=
 =?us-ascii?Q?9jDmOX8gvyjU9H6Bn8REciLlNh7mbap7KGwNzmbBjCjDj8ZmPK9KGNe2RF4F?=
 =?us-ascii?Q?wN2Cpq4uEkWaBXLBzCDpRgb9she9ZxvrIJzzC5pjTRQyYWauFa1lyQ/U4gY0?=
 =?us-ascii?Q?kn9YmjC+2ZIagGlwhqf0H03mJXfWyF0/GA/tUM/gRPXJ3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dIZqSo7CSv8WgZZ33c3mFmaVVnMum3CUNxePRA23O3aMlQOSYgbBOEqs1DpY?=
 =?us-ascii?Q?EDCW5TfnejbIyYkIAyx1RpWT/xMfvgDryacnMelxZZdgGErvitNc54BM052k?=
 =?us-ascii?Q?04MoeLJvCGoMM/ToN1mdLODdnVgRorJTQm6/W05HhD8GoY/vKkxNA0ovXsft?=
 =?us-ascii?Q?jICfolu5whvYxPRI0UkMTydLu+VW6sTPY1KgTBMU5LFVYUAOySOQMORFetQS?=
 =?us-ascii?Q?nXqo/xtd+/PW624hG+jdUP3nVdGmrqpOx3BCrCDQfrZ3WnvZ3PKqg/8Bm/h3?=
 =?us-ascii?Q?PeoQ5VTGysV6cz54A6/Dk+tJr0LqRQZNHpPhRWEts778cVFZHsaE7WeTkMYh?=
 =?us-ascii?Q?Y9sJpJ1UaP5sy8plwBrECz8eTEUAw8szps2NbwHD3E6fw2DFnhZsG8fuGBYB?=
 =?us-ascii?Q?rFPzHl07Q331nnmM+WrDi5UO0Mzx9HkXLoeNxUU/cjv1KMeqdWCt7F2nljKO?=
 =?us-ascii?Q?Xc3rltFBvsYZmIYXqrba/VVbWIdlqGYERGtY6TY1JJ+uugc51VZVjKVVbtv3?=
 =?us-ascii?Q?6iP2wDY0DiVFiEwMzwaJ18NyEV3VkkjmYhHz312OGuTC/lfLmH04AcIp6QQm?=
 =?us-ascii?Q?k8kTZG90+rKqQjaVWwvXUz4ZJ/zLWzzzND0Dbq5fM68oyEA4+Qs11gnd3Knu?=
 =?us-ascii?Q?6RSVIskrXc2zOQeYaKWJFMTu8PZMNbyv9R4im1HlFGNY53DblI4i3YIbGU4a?=
 =?us-ascii?Q?CWqvyMruYA1vUqZN7aCV3R99U2rax3BZUTYKJeJfTNE2a2iAY16Ulj5XD6Q6?=
 =?us-ascii?Q?0FPlPqgt0ugXo7sb6hq6i4vtNOx2uB0QfzUYJMUNfTSqWYbP3PJoWgKmvlrp?=
 =?us-ascii?Q?8N+Y3e19QQ3yHAfd+Ka9EcOfqG8n/lI7J1lbGvbuumtxvMJbQqPtxHj2mYQf?=
 =?us-ascii?Q?ExXQq08BaKOeZP57d4QedwYr2BcN3p8o5/xy5vpVnfoFy56wwPtxdzKvH+fS?=
 =?us-ascii?Q?8UJCvf/ObotwXgIShhkO2NgR+/SZNqC38ra2WZhaDVySzcfx5fAlMMrqB5Qb?=
 =?us-ascii?Q?ysufPcHBesFAnujongI9Sf9vxtbLSWd7AnKLPLn3i7zu6xFO04FxwBH2kzOx?=
 =?us-ascii?Q?N7K0vDg++91YzyvRUuXvvVHuERWaVWUHIkGjImC+bnXE1ujo4ZW9A2GW/GBt?=
 =?us-ascii?Q?I6CqaduBnUHBZOkXfKxPAyjfBkDTEQ/C+GihfNpH5OzD/8493oxvEiYRNn0n?=
 =?us-ascii?Q?RIoEOtgo1Zq76Dc+sUAi6cwDHVdCVJJemz//7Et/dLEzfICvry+3XQ77Yr75?=
 =?us-ascii?Q?mgvNpFEpHv/5uJsQcPpII/27GO4bWr350Gv+4s0P9AP5jporogOKSvF9UdMf?=
 =?us-ascii?Q?Y6tN7TTfw1BdX7tLzsAObdxkMNUq5WOAwwgPmoANJGeemQkCiApeaehgI//s?=
 =?us-ascii?Q?3VtxdjB/L9C94Vg/SWiMj3uhOacI5E/dpvcllroEcROFPKKdvW8zztbavSXh?=
 =?us-ascii?Q?guyWG0CHPL9yR5Tmi0o9FVrp2YqQ2ohjTgnVeWjvin++IsrpPkMMHQsbQ/o7?=
 =?us-ascii?Q?tchc/fwCCatJruKLc4b9FdBEOZ+xlCPmRY3eNS5sVSJqBBSGZ3kkdweDzVgQ?=
 =?us-ascii?Q?+3dQGj+2/VkegoD+1sZWlwx3rdTOA31xXIo/HU7LqjI6DfRtUtFQiosc77gT?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfcd3bb-4569-4a1f-8d23-08dd54e28ee9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 14:50:19.5314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r31Qw6m94WMW7epGJPJyma2kBU2+whZqJeT9Qh/GpJs5PFWuC9qpOCsQurbOpwntyy9FJyBGQucNd3G6bStsXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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

On Mon, Feb 24, 2025 at 05:52:37PM +0530, Tejas Upadhyay wrote:
> Async call to __guc_exec_queue_fini_async frees scheduler
> at the same time when some scheduler submission would have
> timed out and restarted. To handle such small window race
> case, all pending jobs timer should be cancelled before
> freeing scheduler.
> 
> It will help to solve below which is not easily reproducible,
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223

I'd drop this part of the comment as it creates confusion as this patch
is not fixing the above issue. 

> 
> V2(MattB):
>  - Cancel pending jobs before scheduler finish
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f2ce3086838c..8b7165d3820b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1258,6 +1258,8 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
>  		cancel_work_sync(&ge->lr_tdr);
>  	release_guc_id(guc, q);
>  	xe_sched_entity_fini(&ge->entity);
> +	/* Confirm no work left behind accessing device structures */
> +	cancel_delayed_work_sync(&ge->sched.base.work_tdr);

Nit: I'd move this next 'cancel_work_sync(&ge->lr_tdr)' statement.

Matt

>  	xe_sched_fini(&ge->sched);
>  
>  	kfree(ge);
> -- 
> 2.34.1
> 
