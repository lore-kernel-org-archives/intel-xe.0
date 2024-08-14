Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1F7C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 16:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AE010E4E2;
	Wed, 14 Aug 2024 16:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrhWFg5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FFE10E4E2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723653273; x=1755189273;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sRn5NahETtuvR5WNtvQa4WEB7DjaDeEx8IkNRoFwa+4=;
 b=mrhWFg5ATPo4j2Bxvgj9Q+UjfxxLx8fi/PEhWfyKDbm/xQt7tV5dldc9
 aFIxidNz2TNh3JUDvWfx4TCSXpudKvItK9shv3504nAdXzKrJKBg/Vint
 RBEqtjre+kTGLHc+FDP1LEtnYwvUFz1JVSdH5knpMsDVxrAb3NfhRlbGo
 JL3QmpiytK2awfgsxqZPZNcihxruTuzX72Zxw3NmLboBJUx2tlpOQiqkO
 u15H1GMaNkL2FccPwD7X7NeTwbTEhEOzg+80FPudbB3eO128gP3rwpApl
 sCmI5QF66slfDfe96/HDh3kdNyXGtx8ZmnGueB/CDAsd2sUdVZYFqIft9 g==;
X-CSE-ConnectionGUID: qIb5GsT/SZK+jsEW1lFI3A==
X-CSE-MsgGUID: XZFZIUBJStGAMkpjycpnHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33290785"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="33290785"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 09:34:33 -0700
X-CSE-ConnectionGUID: j56Slf1tSuu1p1EKaHbS9Q==
X-CSE-MsgGUID: T0RIoyYiQgSNWYM8pM/gBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59221379"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 09:34:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 09:34:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 09:34:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 09:34:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 09:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NK/wGOnZOKUy/lfml3EpsIY4GzOCgt9MuJr+q/rdoTUq6Y1AC28RlxGLja1log7zhE6solPj2LdrPyiO871E61Vs8N0mWZIoN8jThrYpf7AnxK6WnfzyGK8E2YuG3LqIyuDqdvVUDNjSg6tvbDV9uPalrKpYV4bzKD0LAuY6ioQKoSD1jVUoEn94QbjikBsAwXT8eZNe3txQHd20xsoCHPS9foR3HDEv8dbi1p5f8CxNknYMY7OOE8f2Y7jF+PP//UcBELJ3521yFPxxnPwFSz47wcdZDmjBXtQfkJLJV0cYim78HmFoARONqCQFotPltgqa7rsDccyIa/S+WAbwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbZMvL1zVPfGti9kqS1tTrlme67ikaaREtRkTTil1cE=;
 b=DY8CyKmokZ8nAOC6v0+yU+FENLsF769UDiwkqiq9WjbO7I5IUeVqPpwwt9/9W4IhX9im+pmvMldeuS2vbl5LEtjTvJGurVZCRwlKFtdvRNyEKStp1OJC28Nw4hXYmSghJr/9gra2GZQJq0lXsVJw7nfivjz1elQ1iWwM3N9i8UkGkEPtB2LG6EZXlG+j4GCEdaIldYLWs+9AJJE4ENr8OEU5LFLfKgqE0c+mDRRgCqwtlgQoo5ve4wsr3JLM7v2zwpZTZeOyn/cJHGtKGFBerm47zjYMYfD/duC5MGXdTqUAqqG09ydSA4gy1gvfSr/FwBahYF/Csgx4+RsqcRaiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Wed, 14 Aug
 2024 16:34:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 14 Aug 2024
 16:34:24 +0000
Date: Wed, 14 Aug 2024 11:34:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH V2 1/3] drm/xe: Move enable host l2 VRAM post MCR init
Message-ID: <xwmsqnf33e2itfsgcmy6csqd7wos7hcixfy3oyr7jcxqknmvab@wv2qijzrkql2>
References: <20240814095614.909774-1-tejas.upadhyay@intel.com>
 <20240814095614.909774-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240814095614.909774-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:303:86::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6f78b4-6986-4fda-5a93-08dcbc7ef51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: F6pLx7OiNCZBs9yK/HzXlPLsFabuZWSurfg4hQ+QcNh/H8+HQdM47whhnV9Vf03UVUajM7kwKSEHlMpy/5DtwA0zO+hoDHPDVtmJ4ib3P4rp6+eB55tORGkrgl+DH9YUimed2JUEbLFaWSswNOSV1lSh7mqtkuYrCg3Xt2johVWqOXsSpMW+cSwIqlrWCUSOUYGWBO/hfqxBG1kkQ/kVcNAZavzkfsWgVlNRn3+YX9BFuDIdnRoEIL/x3ZsG+4L22u7cto+6Hle7+TZKlx/thADq/UxAB1pPasiB6AcJK2URFrlmcL8czvxqR6SKPEKwgdRQElyfoDqEujFK/iW/qlMI/mJOmEMOrBJBsD+pqzQuRfCNQiYPgtCwABScXjUEtCQIcWo/iFYLnHPJeAHFmjYBEnWaG7H4BaQxqUrP6rEUftCsYXDkck0eNYViw0gqv1HT1PlYJvL0nSaVrNvB9sr6OdMkJHBXVdsP8gI4fNAisEiOhADYVACpsksvyIbTBA/is6YPCsaMbPkfRXzcRxCU4cRk9VzxtEf+TSQmYXqvhrlkeKrwRA5G/+IIiSUNxEfSS2/qiKU4eUfDOn4B8gAp0BHKbg3RSTo+Owi0xnuy8eK+9B9979ozftg0BFHdJXOGkNUlQbYu7/HSiQQVJaqctwqcE7dix7I51POocg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Km+aonHSI9QdQC3z27FHCkvKpKO0b08YjPKVtRQJjEDFE2ukuERGLnY2jnrJ?=
 =?us-ascii?Q?PzEadhB10/Hucb0/krZuFhFH1S8KpgrV+TUJ92frJV1zgJVwFYd3jk4+VNjl?=
 =?us-ascii?Q?eyU6M7hEUTLRfXSYiyvuvyAuR/H5pH1zfw33XgWl5YApH3Pz6bZCaobdtfna?=
 =?us-ascii?Q?ze23bb+WWu7Z5kDLN2Jk1DxiLv3oW0aZ+VgnxIxgQuDucmYSe4W0j8YWHLbA?=
 =?us-ascii?Q?JznJp7QB33grEGPIz3vWlVRbZ6DYPCAzm+g9FPc7TEXjtz6IrOSODHd7CKIu?=
 =?us-ascii?Q?XfOuwOSTcLuBiWuynOJdXny/93efaIAM/rsZ2Qv4YPEWCNZ7t26wt5gWmCMV?=
 =?us-ascii?Q?KfDRimSdqFG9Bdq84c2WEJEcwya0Hu7VXzdsOCPt4IcnTs7yHA+aCARlH1BA?=
 =?us-ascii?Q?sRxvYMsTLr7urWL/IZaXaYQv5YzYnDgT2anBE4t1gKniIb9x82YZ2qds9yLJ?=
 =?us-ascii?Q?0IYtLhimoMDavc55WrDVOxp88A7DOyUbu0qYc7M0sXpqzcbK3k+IpWFoLSWe?=
 =?us-ascii?Q?fWveiS4mLdDB4+ygrsrROo7u4oz04Qa7DcQ17YIrx9DUQfft0/7XR/Q3M1qj?=
 =?us-ascii?Q?8dDDKmEJF1xTYuNu/zjOZ3C5cn0SJLAW0i23Si0tzDXSN4Z9jJpYGwAi6M+S?=
 =?us-ascii?Q?2emL+dSXy5eDit7kFG6aZnO+u+Aqz//Msn36DQll/MmVdKhlCjCGWXEaYrf0?=
 =?us-ascii?Q?R9g2zc6LeK7rWgTQcUiY6gDGRlhHjj/Tj/1t4boyd5ujdZLq4QXUobHABoJa?=
 =?us-ascii?Q?rG6ABnHiTaWOkmeVZg7BNFjGi9CHhIrc5afXrgr684offhhCj2455blVEX/2?=
 =?us-ascii?Q?4q9/6UNggih34xk86iSXV1mH3LZSAR9JaLUBewpbXbdzg2maE8RpW6qHmVHN?=
 =?us-ascii?Q?KQR8UiK18NVngOIfcpE/8wWVJdKU5nG6oF3/1eIUmsCZSoGMoF5T/l9Dt1ei?=
 =?us-ascii?Q?N8Mas85UQmvo/zvKi9g84R+RiArQbm16QY2BL1QQAQdsGLuxL0/YpdfRqXdc?=
 =?us-ascii?Q?Wl7G6jU44fGi6uNfliPaRRA4obBNUPwTpzY5QfvAH0T7wu7sKQ4fc5JRf8od?=
 =?us-ascii?Q?yNKWLBjgJ06H1xzUFCUogPNDt4NdMwGpaYNuOyzkO3RELlrdiNOPbeCJpL5G?=
 =?us-ascii?Q?wnZlMF1EKOVIT5krviy2XAxozGMB48IMe9ZOS3Ta31qk/6rLijo6HkmBr3W8?=
 =?us-ascii?Q?QjkFcypSnwA5/nrVcsSQuHX1mkjpauPwGSRRmw0hgtFzruLJQDn8PDOYyoOg?=
 =?us-ascii?Q?PxTusfoBL3G8PLlxOg3nrM+orOlwn4LqdMHk4nS6wAm0p2vr0WDcN8gsLGvc?=
 =?us-ascii?Q?s0DGIu5eOvpU4g/EAK3HzVL6kR/MKYDztfhapg/zNDeyNPaRFGSeCQMGjdwD?=
 =?us-ascii?Q?bOGqDF9Bmi91gXjeeQxJxrdg+IKECQseRdfUSHyjSlP+dwzfhadOqPSbtIrS?=
 =?us-ascii?Q?8A1rXVkEKIgYfekwbgjZiGLqOyOV+0qQH+FaPgIJ0Y1qtxFnub+HDMEgxeji?=
 =?us-ascii?Q?ULU4vHSV8gbY6j/VBnS3F/k9JXzYoogQjrBptwHMf/E3mollb8HMeNDxTz9B?=
 =?us-ascii?Q?e70gGN496EVf2KxmCo8ysJhHa97ETxyJ/ndtXyDErYWduMLZnqHQd3b9YZ/Y?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6f78b4-6986-4fda-5a93-08dcbc7ef51b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 16:34:24.5888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5CV733SFcl0q+1Vc6QZ7nt0ZUh50pU0EI6pA2G9ro/nwiOwHkjodsMQauJIFB1pM2CZAf0J/vwzFUOcVFG1H9okt6UDoX94E1SgswhDCR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
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

On Wed, Aug 14, 2024 at 03:26:12PM GMT, Tejas Upadhyay wrote:
>enable host l2 VRAM is reading MCR register thus
>should be moved after MCR init is done.

This commit message skips a lot of the details on what was discussed in
the other thread. Let's improve it and for future please be more verbose
in your commit messages. Suggestion:

	xe_gt_enable_host_l2_vram() is reading the XE2_GAMREQSTRM_CTRL register
	that is currently missing the MCR annotation. However, just adding the
	annotation doesn't work as this function is called before MCR handling
	is initialized in xe_gt_mcr_init().

	xe_gt_enable_host_l2_vram() is used to implement WA 16023588340 that
	needs to be done as early as possible during initialization in order
	to be effective since the MMIO writes impact it. In the failure
	scenario, driver would simply not be able to bind sucesfully.

	Moving xe_gt_enable_host_l2_vram() later, after MCR initialization is
	done, only incurs a few additional HW accesses, particularly when
	loading GuC for hwconfig. Binding/unbinding the driver 100 times in
	BMG still works so it should be ok to start handling the WA a little
	bit later. This is sufficient to allow adding the MCR annotation to
	XE2_GAMREQSTRM_CTRL.

>
>V2(Matt):
> - Reword commit message
>V1(Lucas):
> - Reorder patch and reorder flow of L2 VRAM enable
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Matt Roper / Matthew Auld, do the paragraphs above capture
correctly the discussion we had in the previous version?

with that,

// Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 58895ed22f6e..238c7d1053f0 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -557,7 +557,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>
> 	xe_gt_mcr_init_early(gt);
> 	xe_pat_init(gt);
>-	xe_gt_enable_host_l2_vram(gt);
>
> 	err = xe_uc_init(&gt->uc);
> 	if (err)
>@@ -569,6 +568,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>
> 	xe_gt_topology_init(gt);
> 	xe_gt_mcr_init(gt);
>+	xe_gt_enable_host_l2_vram(gt);
>
> out_fw:
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>-- 
>2.25.1
>
