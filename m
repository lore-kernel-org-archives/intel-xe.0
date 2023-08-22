Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7B7EE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 15:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F363310E391;
	Tue, 22 Aug 2023 15:18:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80E110E391
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692717512; x=1724253512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SpSD8xALDetaijtYaZnFF4UA1B3PcNziz3ZrtUnI+mU=;
 b=VQPqUiIFJcHVYtWtA4BGMJi/e6U663IOCC3XakpWkxk7EEtVQKXLIQiV
 LX9ruU7X9TFOmEaGoienaYWGtGER+Z/PsBvHYxH3YSvM6H7y4N6RoqQxN
 JNGSqfqevvt5hERj5Sndhm1jwxopUvm+ZW0wGvQqB0sPlArgmBu4vAE7k
 Edm6yLdWaAPQjWev3qD7z875+D63Asrtanuv2e68PLDJ9+qRn02AzlTKK
 V+k+nYh2NlEj9O/IUH6YOl/1dAODtP5vY8DkdI0Zg5gK0P+piDu9Mxezo
 DUt/1vT5AAlNJI0mZIOAjg/EBZG6NQSuj30zlwjvKqzDdvT6FvXK3HlkM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364082558"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="364082558"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 08:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="910107715"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="910107715"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 08:08:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 08:08:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 08:08:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 08:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwtIvzDTdH2E8dHistGCqY7sWZLzQxmR9YSvF/svQrthIZc+CmNsDDBGgnp4EuWrGPSuDi+rYgLcLZk8hDjRra5uJN9Aa+EjKOhCzLWd3gUOKdaeh/L4FOZkaSjm8lNvXQ9tGX+H2wyuF3ITA34dIS6ALq9f4LV7BBnd42gEgzM+KPs0WShkVbHpjN2354jIUwJwIC2pUav+TsDshqj77VbnNRtSGpt1qMRdV5yqLNlpeeiSUfVtFQ9WkQwT0mXdtzZnBtmnS7ecJhXVDj4iMtbtaFHpL1w7KFNgNWz+YLFJ946lR0vUz29RysWizSMs8s8ES51Cy2nwdNhQFEeQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXpKpOYeP9YceXzcd/ZR/JGiE2L8HCQ70VrS/1ZRjx0=;
 b=mVrdfPDNPvkAi3Zs+U71jeO7u2+VcpqmC0qbcB31R3gSmgl5+KCHxLjZ7dXf1vmgAJFSb/kF3xA8R+nfws+UD/HIJSOipJpmfZS1bVKJ0hxLkaYjRzg1TBnREzaDpGhv6VdZqI6V5SgFXWMTRTgcE9B/3AopnJzGb6Q1YBigoda1RwWLn8nlL7KoUvcQgppCxk02Yesu45BCsNYSL66Q30tgHn6zP0AtdMnDP6+a/QnoxEyLaW+0M7t3zxxMvtmxn/qT4XRyiyUd1NGrO313pTGGNcOa/u/emojgwfENbAsJiQgRUSD/t02vDXk+cqJN/ms4d7BSqeNJHnL20xI/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6623.namprd11.prod.outlook.com (2603:10b6:a03:479::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 15:08:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:08:42 +0000
Date: Tue, 22 Aug 2023 08:08:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <5zjvepws4itjiyfr3dnprnz45cbhuo2jczbe4ekwdjqvc74ael@w3ohh7o6baf6>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-4-niranjana.vishwanathapura@intel.com>
 <20230817162906.GD3375865@mdroper-desk1.amr.corp.intel.com>
 <ZN9rFgXcrSzEUD21@nvishwa1-DESK>
 <20230818204330.GB986140@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230818204330.GB986140@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW2PR16CA0056.namprd16.prod.outlook.com
 (2603:10b6:907:1::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fec7c23-9adb-491f-1838-08dba321ac2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5f+hfVL1r/qErgNTcWHvRNe71DHkrAbLZ0nPqlKTewLmWD3lap2/kJCgrG5asghs5j4T8ZOMdCFQsjj79wX5oYCqFecHEqEDkrDV4pEsZTp1xnvlm0zY9LSbgT9Mi+yAOo6AC2SqkVrLnWZmwuLYrh9BHh1LcTlUhF1/XbRDAtuXtjYgCQ8aPDsobNEAG3gOHaLN34M6H8zVJXnFwbEmpX6StAoj1oTZ3JaUIoBYbXHSpuaNG/xki0Vp1qK5vnhNEO7TftOSUr6dGZcOMM8ERV5PdjuLunUw0hfG+0qgjNklKnc6ow7TRCONdWVTlf+fBHYRx3G533DT/PxJwmfr1Wl40i60DJYJqEFEyrhD76/dR31v2mncieMg1ovc/h6DHbFna5QLwKyie/CIq2YsaTUIQ9JMAe5A5Be2HOgp0laa784QcqXFbU/CJK17BK+MgJDbSbwkDVXa/yugXjnTDrnuyq+28kweOOYNqqnPR4CSI9ffdVEGHA+rN7rq/93ZZ+widsZRLXv7zelAmjRzm3Wq+KfU4zOViYuMpq8fSUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(39860400002)(136003)(396003)(346002)(1800799009)(186009)(451199024)(966005)(478600001)(6486002)(6506007)(9686003)(6512007)(33716001)(2906002)(26005)(41300700001)(8936002)(4326008)(6636002)(316002)(66946007)(8676002)(6862004)(5660300002)(66556008)(66476007)(82960400001)(86362001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SpLvXYxdOizer6wACpxLf6O4J3OWTShI5EuCnyUyEqWpjpcFEM0bA1KGuzRo?=
 =?us-ascii?Q?ChO1L6R0NR8UTyVHLdvGpkEUrcdpdSdZ4h7SV6Plds2hEOMzi8gOVsmZe+cv?=
 =?us-ascii?Q?xkpgeG6T/2Unf+TcV4nEX0e+ys6HLyjDkkmdjm4VklcvCj0zZPMTqeNZcHEN?=
 =?us-ascii?Q?Km9skQnd+IT4a1oGbmYgwqUlEiHzSeYFvilThqnnmRtCfEEM6wNcYLj8DjEv?=
 =?us-ascii?Q?4N1s18p5vDxfFOVJrFwSm+1dBEB0I6ly/4OhwI2Zc2qgf8N2n8Nz1dSJBLok?=
 =?us-ascii?Q?gRpz9YN7N7sDT+KBEPaF3WaKnQZay1olyR4XUf5gH2qU8+qEya03I77DpVM0?=
 =?us-ascii?Q?VMr4iqmL/MsXFSa1qWuOlHfrVeYhDZRJmUTSsFXZGgSJcYZtFwEXNh2xug5H?=
 =?us-ascii?Q?hkfctuybJ2KBhc3+M/jpHqJIEk8R2+zy4/0CnzPwv4BNSyY+5jvChZOSDOR6?=
 =?us-ascii?Q?RdJ45UjEovPq9hzcBmjImc0oGn8U54NMeODHtBv/GTXP5RF22NZ1vYoYFFrT?=
 =?us-ascii?Q?v37OPko/L4Acnmq4cy9nyyt8B3If7D0mYvpuJ31JMsoY1P1nOCIwp5W5ga+m?=
 =?us-ascii?Q?KHY/5LvXOZF2O2E5H6igXZETUO4aYmON9szJcm5CM2fH0ERIQrfihaKKl4J5?=
 =?us-ascii?Q?GMYqty240Ff93KGdEfRkbL+pBsC8BMFxA5kd+nANS2RdBh3vaa1R7He0Mjl8?=
 =?us-ascii?Q?CMqkFQOI74IZ5K/UGYng0akOYVFjExuxjPt5XWklkm4PFqOWkozOgebmUbqf?=
 =?us-ascii?Q?JIFDRXpaSnaK6UbLenWWLynVRskZs3yO4KO0cLSDkL2NiVB3GInDL9p/5FLS?=
 =?us-ascii?Q?2Q8e2PbE1zpziYfpmWHoQ71nKt1n0OcO4zdULNoBV1aF19CUl3qoWM8z9bhz?=
 =?us-ascii?Q?L1LIWdAppYGSP394tynqHtoOPc6BH6g++NWAsJGOIBrDyyo8iyYYVFFtRF/i?=
 =?us-ascii?Q?OXvxiqVX8sskQq47SD8strOTeY9Oa6uCR573SwZFGClCqcdS33lvISfiy8bw?=
 =?us-ascii?Q?7JceGQN9+ZQGmGeIpVDcwgwzxkv97vCU8HzO6WY1ppHcVPRRHF174koVUgEJ?=
 =?us-ascii?Q?ivUI84BJno8tRmX2BswtoKuc4kl49QWlyDQNb8I6WT+EZB6CnZv/nQvcqFw/?=
 =?us-ascii?Q?3a0yItJkXMNydL7ZG1lXwV0pXKIR8PZA2838gWD17SYrnhWsCqDFULsMJwN5?=
 =?us-ascii?Q?T2v0UYFkYn6L0Zeb9O6AMW3G44Tel1lekI0uEHJa1i/VdCk/rC/yjlp8JIOC?=
 =?us-ascii?Q?F9FBhQ5Xnm2D99h95mufV3t9kzeGdgdMMtD+awv+c7skRblCIAM63sXiz/xr?=
 =?us-ascii?Q?XSExdv8wQMcWX4UVsyka+bXsQyUMkpKaUsaICcKyxZR0l5cun3YC7YME5ysL?=
 =?us-ascii?Q?BgcfqUHx4CNS5M0ZkTT8k+KaNac7/0rfp20jMPdzXfHGs0Zv32f6LBRxkR/T?=
 =?us-ascii?Q?KN41wjQVfXvXPsWSX055f4vm9T84mkpJnaQsjuqxN539ErxctB36PTq8zwxq?=
 =?us-ascii?Q?VxKKa04Gko6Vces6PreTLeIws5bN57n2vrcPETviPNMAYLXixxseMaO1l6HW?=
 =?us-ascii?Q?gf1FQ7rb6NK1//rQaL3Gm0PS+ufC04AVg4AWBuf3mfJe/1uc1VX1VMErdno+?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fec7c23-9adb-491f-1838-08dba321ac2a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 15:08:42.3305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4e0Xta9q2aR+Acx33gxaxCqrOQrrjIrCuxu1CLfalnkDiHlh3/la7c9dTjW8UYaB1OUI6UsSwF2iaNv/hBO2U7rCooHL3TcU3jzmx2AnoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6623
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 01:43:30PM -0700, Matt Roper wrote:
>On Fri, Aug 18, 2023 at 05:59:02AM -0700, Niranjana Vishwanathapura wrote:
>> On Thu, Aug 17, 2023 at 09:29:06AM -0700, Matt Roper wrote:
>> > On Thu, Aug 17, 2023 at 04:03:52AM -0700, Niranjana Vishwanathapura wrote:
>> > > Some copy hardware engine instances are faster than others on PVC.
>> > > Use a virtual engine of these plus the reserved instance for the migrate
>> > > engine on PVC. The idea being if a fast instance is available it will be
>> > > used and the throughput of kernel copies, clears, and pagefault
>> > > servicing will be higher.
>> > >
>> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++++++++++++++
>> > >  drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>> > >  drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
>> > >  3 files changed, 36 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > index 4c812d04e182..00329efbd968 100644
>> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > @@ -791,3 +791,34 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>> > >  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>> > >  		hwe->instance == gt->usm.reserved_bcs_instance;
>> > >  }
>> > > +
>> > > +/**
>> > > + * xe_hw_engine_migrate_logical_mask - Return logical mask for migrate engine.
>> > > + * @gt: gt instance
>> > > + *
>> > > + * On PVC, due to workaround 16017236439, odd instance hardware copy engines

s/On PVC, d/D/

>> > > + * are faster than even instance ones.
>> > > + * This function returns the mask involving all faster copy engines and the
>> > > + * reserved copy engine to be used as logical mask for migrate engine.
>> > > + * Including the reserved copy engine is required to avoid deadlocks due to
>> > > + * migrate jobs servicing the faults gets stuck behind the job that faulted.
>> > > + */
>> > > +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt)
>> > > +{
>> > > +	struct xe_device *xe = gt_to_xe(gt);
>> > > +	u32 logical_mask = 0;
>> > > +	struct xe_hw_engine *hwe;
>> > > +	enum xe_hw_engine_id id;
>> > > +
>> > > +	/* Only support this function on PVC for now */
>> > > +	if (XE_WARN_ON(xe->info.platform != XE_PVC))
>> >
>> > Here you warn if the platform isn't PVC...
>> >
>> > > +		return 0;
>> > > +
>> > > +	for_each_hw_engine(hwe, gt, id) {
>> > > +		if (hwe->class == XE_ENGINE_CLASS_COPY &&
>> > > +		    (hwe->instance & 1 || xe_gt_is_usm_hwe(gt, hwe)))
>> > > +			logical_mask |= BIT(hwe->logical_instance);
>> > > +	}
>> > > +
>> > > +	return logical_mask;
>> > > +}
>> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > index 71968ee2f600..edee71e26c57 100644
>> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > @@ -52,6 +52,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>> > >  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>> > >  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>> > >  				enum xe_engine_class engine_class);
>> > > +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt);
>> > >
>> > >  struct xe_hw_engine_snapshot *
>> > >  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
>> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> > > index 956a96b38346..cb9a82d13089 100644
>> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
>> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> > > @@ -338,11 +338,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>> > >  							   XE_ENGINE_CLASS_COPY,
>> > >  							   primary_gt->usm.reserved_bcs_instance,
>> > >  							   false);
>> > > -		if (!hwe)
>> > > +		u32 logical_mask = xe_hw_engine_migrate_logical_mask(primary_gt);
>> >
>> > ...but here you call the function unconditionally on all platforms...
>> >
>> > > +
>> > > +		if (!hwe || !logical_mask)
>> > >  			return ERR_PTR(-EINVAL);
>> > >
>> >
>> > ...and here we fail out if logical mask isn't set (which is will never
>> > be on non-PVC).
>> >
>>
>> This patch was derived from the below earlier work.
>> https://patchwork.freedesktop.org/patch/528460/?series=115575&rev=2
>>
>> It was discussed there.
>>
>> We should be fine here as currently only PVC Platforms call this
>> xe_hw_engine_migrate_logical_mask() function. The reason for having a
>> warning there is to detect any issue while supporting any future platforms
>> so that we fix that immediately.
>
>xe_hw_engine_migrate_logical_mask is called on any platform with
>supports_usm, right?  I guess that's just PVC at the moment, but we
>already have LNL patches pending on the mailing list which I expect to
>eventually start setting that bit as well.  I guess we'll have to make
>sure we remember to come back here and make some adjustments once a bit
>of that code starts landing.
>
>>
>> > I think you probably want an OOB workaround for some of this logic (see
>> > xe_wa_oob.rules); then you can do something like
>> >
>> >        if (XE_WA(gt, 16017236439))
>> >
>> > to guard any code that should only be executed on platforms where this
>> > workaround applies.
>> >
>>
>> Hmm...the previous patch in the series adds this WA (16017236439) as a
>> engine_was (to be moved to lrc_was). I would like to keep that as that
>> does the register update nicely (instead of adding additional code for
>> that).
>>
>> If at all we need, we need to check here whether that engine/lrc WA is
>> active. But as you mentioned, XE_WA() only works for OOB WAs.
>> We could add a duplicate OOB WA here (with same number 16017236439).
>> But not sure if that is a good idea.
>> Or, we can add a function to check if a engine/lrc WA is active by
>> doing the name comparision (instead of XE_WA()). Third option is to
>> support generating WA index numbering for engine/lrc WAs also (similar
>> to OOB), so that we can use some macro similar to XE_WA().
>
>+cc Lucas for his thoughts.

For now, just adding the workaround to oob with the same number should
be good enough and that should take care of the other question about
warning for !pvc too.

>
>Maybe longer term what we want is another RTP matching rule that behaves
>as "match platform/stepping according to a specific OOB WA."  That way
>workarounds that have both simple register programming (in lrcs_was[]
>and such) and additional out-of-band logic can be handled in a
>consistent way and the platform/IP matching managed in just a single
>place.  We could accomplish the same kind of thing with an RTP "FUNC()"
>rule and a wrapper function today, but it would be nice to avoid the
>need to manually create a wrapper when adding new workarounds.


yeah, that sounds good and not terribly complicated. I will add that to
my todo list.

>
>>
>> What do you suggest?
>> I think we can leave the code as is for now as it gets called only
>> for PVC.
>
>Since Lucas is handling the LNL enablement, I'll let him decide whether
>he's okay leaving this as-is for now (and we'll come back and make some
>adjustments once more of the LNL and Xe2 patches have landed) or whether
>he'd rather see some adjustments right now.

Let's use the suggested check:

         if (XE_WA(gt, 16017236439))

Lucas De Marchi

>
>
>Matt
>
>>
>> Niranjana
>>
>> >
>> > Matt
>> >
>> > > -		m->q = xe_exec_queue_create(xe, vm,
>> > > -					    BIT(hwe->logical_instance), 1,
>> > > +		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
>> > >  					    hwe, EXEC_QUEUE_FLAG_KERNEL);
>> > >  	} else {
>> > >  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>> > > --
>> > > 2.21.0.rc0.32.g243a4c7e27
>> > >
>> >
>> > --
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
