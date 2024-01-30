Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F6DC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED2F1132E7;
	Tue, 30 Jan 2024 17:31:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EED1132E7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706635888; x=1738171888;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x3c9/Z0SwNHFCoABOB4nBXaddN0xPx6z/4caTx+Pn48=;
 b=KeFW4Bt/nSY14Y0olqmaKTtGRuIS3rNl/JApE94nb30I6HI9oqoy3O8j
 hcWHD6OhPPIxpo5pyOh2sUI1ZRS//m82DnT98IU17Ke8Ne0+VhysdyHlG
 Vf6uOcTkJZYVa+Hb2yNUlgIlS6wbGeQgrD4BPN51fMA5SJRWIIJDOzo73
 TGj9RonPza7Kv+O9RG5O1P54jAUan/hbyEpXuHEF6yKIc7itskwTnwPxv
 LRxwmEL/xzTl06yZMlq3kkS3fKj/EwYfC+/4AEicQ86+uWC6bMAxAolRi
 G0yu6g73t4Bg8Y9v2Ra7eA7CGcKPbhyTGvIw2J4qxFrorMNiD8lZ5Riji g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="16732247"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="16732247"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:30:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="737833828"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="737833828"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 09:30:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:30:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:30:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 09:30:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 09:30:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=colllt2qNIPwUT6nnxrQqeW9pcOMkWytAZNKUIGI9khhfW1uZ/4dHBUP4CHDdbQQEpeUpJZNsFajnJbuqfZ2s3X5t/s4idQNgH9tf/7jlbjiyFekKvSB/oeNayvO5kjLDjnZ+pPTeEbIQwGsxz6LHdq9i8hfXuzb7+aVpDUKwcyVPx/f4TV5sUsWk4yV9F+zNrQegd3HOquQ/ucbDi+UZGJUf+ujmkt8p+ywZisBD9LNUCFpYMnztljO5r4SXd4/MpBR4o/G7e2u+Ckg6PIO+qLgkJAoF3HQR0U366gszbpJfVn3ir0sLoqyErpODZdCaYOhzu3JW8dT0UwJthQvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDYC7B3Su69Y9vJPtFkK10F+tN7+grPVNbPjcIRVYrw=;
 b=iisb0Ir6vKumXIxzD5oAaLCVRnzLNu5G7aoGGDa4vTHwYze6wnjgbvA3qKn7CA12y4wGCY96vLZrRNWOFjSlkLuLwRZ4MtuDTj2Dkloyea/c5Iv6QXqKHKj33F/b4COKSSACHccL9N4WuQs4XjiuvmaGJzLwFR7GSYdPBuWMzypoUQHbSvLeoZT+GGU2pyuhti7o1A7jJZDoQeAq8RUeftpA1Dq9+qgs0HRWSEopPdgJJeDFa8TUxXxRVfX971z4KtZ6j680pkkThq/OHSXrnMFMzlpgYxLFbiIRZxTik4aUJKfD62MNH7wP7T3SbqCuWLmv0Sv5NGg0t+3waz/kRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.22; Tue, 30 Jan 2024 17:30:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.028; Tue, 30 Jan 2024
 17:30:19 +0000
Date: Tue, 30 Jan 2024 17:29:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/vm: Subclass userptr vmas
Message-ID: <ZbkyFRIpbkjzWn1p@DUT025-TGLU.fm.intel.com>
References: <20240130170207.5219-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130170207.5219-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ff76f8-5b2c-42b6-9e9d-08dc21b921b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XljAc0rzafKNp9c+bico6jjw7IVUgMsoQr9nTB+0s9wIiPqsxPf0W4IOUZgGcIzGv6Lv7KzHhVncx8oOE+Rzq9Rrl898g89hY5PSlyYAwJAQho+NFmeZfVSkqaJdqzElG+adrEyHB+MgCcYfskAEfW1tN+16vbcWYmAP5QaKJBkOJ0At5fAvNo7ahS8/wY5fCDdF/qtT2YhO0echluJwVfKP3VbM78d8HNORhYTrLmTk8L6R9DRB5dgVXB+SoHGn1vhiGjpBLC0OeIJE4xTSd8KvyqzcdgzK4RGVtYfXxrJpAMMgrD4A3YSCXeu9WSyTm0oz4ljinSa3uECO/+aamjwCbVnGCgNz1Z/kYxSRNSZJnsGeNVr0NCy77rBJfhQVl+9TOf02iH07StPFC/AliFOQdz0mTSBYcVN+HKqcyOynUP1si6IUfJ30wHmEjW0wPJ+xNvQoi874IS7ODMvEBXQ/GZlXtSiu72bzKbhiwDvP+RfF/nxJAxXmctMQ1dLm5yhfFo+G8KhNcEQsonrRR3Sa11M/kqAIl65TJ/Pe3UA1WVtE8SSHDe2OLsCGm4M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(5660300002)(8676002)(8936002)(44832011)(4326008)(82960400001)(86362001)(66574015)(83380400001)(54906003)(30864003)(2906002)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(66946007)(66556008)(316002)(6486002)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bth7LjMqcagR1sJ+ijogDK1VnV4Pf8MDbnGAjDDdYoNfYCer4/5UxyM9Zg?=
 =?iso-8859-1?Q?b1AXhVaJEqjYLaY1mAcuIXQTWgluAcdI0auoUp37PujLPCnXEeznAaFCnA?=
 =?iso-8859-1?Q?G0FA+knN3mqK9GJvAs5oCxGuC0USdaNZTodB5qzjEMUi3cGid8/YXJjjaG?=
 =?iso-8859-1?Q?5nQza2ZMD7gjIVbbPDJ60TRNHxnT54f0j12bipz30ySQrQUN4SXMZXUIgk?=
 =?iso-8859-1?Q?mIjBIvWJc/d3Haf6qOPPJLXvMzXyPTavPQ81nhSy3/wrSAkrXjcbZ9I/dC?=
 =?iso-8859-1?Q?gi5hqbgwzzoq+LE+5I3HMx71leWJRkDgU8Qdbq2/95kpTSZ4ZiMk+w4X/u?=
 =?iso-8859-1?Q?k+2sA0DPZALIOmYTorQasyJFAC3xAeqCSWekE4jqkzyGZK8tHE9WPTqUNG?=
 =?iso-8859-1?Q?lsH7H4CetSWZyJ5ac9UxEpKOsza5TuqeBxDXa1gWYr56/a4k2CJVvVL6b5?=
 =?iso-8859-1?Q?ta2/56ZaH3UlPP7rY1ftrDcN4FTCuFwxX4tbHCcGUSOlXofQPqtd9qqtOX?=
 =?iso-8859-1?Q?M8pjPAd49NaITue17AVHBVLiSSCYg/C4AjDH+o40N2y7hYvGX4FyTunVv4?=
 =?iso-8859-1?Q?3ubXbVdMFHqni2xrlshlCbb9mIxi3/iQoTCQffOPtLKB0294XMEhHkTBYq?=
 =?iso-8859-1?Q?/aorEvypkqB+Q5ay1zuJTytF9imrEZ+fHfZzOXYmB1asjkt7TJZRo0LU8L?=
 =?iso-8859-1?Q?NDhlyj/MhIc3nLBFIVrP6a6+BbpN3XNGdK35Ls4Vbg6nJh74wsUPc7R5wI?=
 =?iso-8859-1?Q?oqoJ5Idqo6ZYj7Kf5Ww4/dk2DNxbothcGmjAPRbiavQWnbCaLz0UfDOT7N?=
 =?iso-8859-1?Q?UlCIZGUgEcUcPSauImmrxfrNja/x0KB/TTbLmGrEB4SdlxpDeoissOIP8T?=
 =?iso-8859-1?Q?0AQ31FxpMOGofGRoquGAG0qWx0f2qur0IKJvDk75rJXGiElrMr+hGD6b7n?=
 =?iso-8859-1?Q?UtNB61MfejQ2cas42VKa94FId+AJF/gewSRQ7m5NwBIEP64OPZjIUNnPX1?=
 =?iso-8859-1?Q?QBTantsw/WtLmaZluaNuzqqSxJJnqI08d0S9gWZsP1IhX1w1rtrVesx59C?=
 =?iso-8859-1?Q?UET6H62I7YqtXqri2HVsLhWfLK5xPvY6jLOO6IJGEmB/1khdp2CHPBcXQK?=
 =?iso-8859-1?Q?oywRX26DBR22NopvjYpXGNBSD+YHr7/2/EROmZT+D7A3unEdvkcbTHlhsF?=
 =?iso-8859-1?Q?TrjCjS+5L3P0fvnibat8AZBpnzrS1drU4B8VKCYUvLcf1AqKmU6/fqrw6w?=
 =?iso-8859-1?Q?eeeMJVgCoG8Uch7KpS/3P0a31GfLWPsAj4PIkRhXzo3aRZ+YMiiEMw/vVe?=
 =?iso-8859-1?Q?ijDz6Q9thctalPQrw+wmI0lNS/bPVydHEKVXzMdfJec+Msyl8GfJvYNOeR?=
 =?iso-8859-1?Q?4XsHvaaVXYaBKfUzVDQnr5BieYNpsDNiHlbvBNx9/NUPRqkhKP+VHmxAuo?=
 =?iso-8859-1?Q?e6Zv7QPBZbwJsbqewlVd3D6PJJqlca+JnNEbYwtrNsS8qM2J/hWHvGK82e?=
 =?iso-8859-1?Q?oUgsfA4JMMmoxMR3yjxFerJSlJ5eqDCLoayxlkQdQ7cxaZXDE+RDrpkPwd?=
 =?iso-8859-1?Q?8cdA7+MO2oh2i+wMPAVyAb1yOiik1n+a2xFX4ARhsPimq5SV/X5NoUNVnW?=
 =?iso-8859-1?Q?0dyT76OCZO9oLnJ5qhliG3AYU7gLlDAHsXsvFckkFHleHyRNBnS/W45Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ff76f8-5b2c-42b6-9e9d-08dc21b921b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 17:30:19.9342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5RhDMrPnsR/zGvepHeYXFC5+Vt4Rps3cGST7z+nWVDmHUnH27DKZqqpg8yhzfS47k4h9I/uoK5Oim/YElbB/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 06:02:07PM +0100, Thomas Hellström wrote:
> The construct allocating only parts of the vma structure when
> the userptr part is not needed is very fragile. A developer could
> add additional fields below the userptr part, and the code could
> easily attempt to access the userptr part even if its not persent.

I think we do something similar xe_sched_job wrt to the batch_addr
field. We might want to clean that up too.
> 
> So introduce xe_userptr_vma which subclasses struct xe_vma the
> proper way, and accordingly modify a couple of interfaces.
> This should also help if adding userptr helpers to drm_gpuvm.
> 

Patch itself makes sense to me, good cleanup. One nit below.

> Fixes: a4cc60a55fd9 ("drm/xe: Only alloc userptr part of xe_vma for userptrs")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  11 ++-
>  drivers/gpu/drm/xe/xe_pt.c           |  32 ++++----
>  drivers/gpu/drm/xe/xe_vm.c           | 114 ++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_vm.h           |  16 +++-
>  drivers/gpu/drm/xe/xe_vm_types.h     |  16 ++--
>  5 files changed, 108 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 7ce67c9d30a7..78970259cea9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -165,7 +165,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		goto unlock_vm;
>  	}
>  
> -	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
> +	if (!xe_vma_is_userptr(vma) ||
> +	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>  		downgrade_write(&vm->lock);
>  		write_locked = false;
>  	}
> @@ -181,11 +182,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	/* TODO: Validate fault */
>  
>  	if (xe_vma_is_userptr(vma) && write_locked) {
> +		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> +
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&vma->userptr.invalidate_link);
> +		list_del_init(&uvma->userptr.invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  
> -		ret = xe_vma_userptr_pin_pages(vma);
> +		ret = xe_vma_userptr_pin_pages(uvma);
>  		if (ret)
>  			goto unlock_vm;
>  
> @@ -220,7 +223,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	dma_fence_put(fence);
>  
>  	if (xe_vma_is_userptr(vma))
> -		ret = xe_vma_userptr_check_repin(vma);
> +		ret = xe_vma_userptr_check_repin(to_userptr_vma(vma));
>  	vma->usm.tile_invalidated &= ~BIT(tile->id);
>  
>  unlock_dma_resv:
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de1030a47588..e45b37c3f0c2 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -618,8 +618,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  
>  	if (!xe_vma_is_null(vma)) {
>  		if (xe_vma_is_userptr(vma))
> -			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
> -					&curs);
> +			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
> +					xe_vma_size(vma), &curs);
>  		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>  			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
>  				     xe_vma_size(vma), &curs);
> @@ -906,17 +906,17 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
>  
>  #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
>  
> -static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
> +static int xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
>  {
> -	u32 divisor = vma->userptr.divisor ? vma->userptr.divisor : 2;
> +	u32 divisor = uvma->userptr.divisor ? uvma->userptr.divisor : 2;
>  	static u32 count;
>  
>  	if (count++ % divisor == divisor - 1) {
> -		struct xe_vm *vm = xe_vma_vm(vma);
> +		struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>  
> -		vma->userptr.divisor = divisor << 1;
> +		uvma->userptr.divisor = divisor << 1;
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&vma->userptr.invalidate_link,
> +		list_move_tail(&uvma->userptr.invalidate_link,
>  			       &vm->userptr.invalidated);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  		return true;
> @@ -927,7 +927,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>  
>  #else
>  
> -static bool xe_pt_userptr_inject_eagain(struct xe_vma *vma)
> +static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
>  {
>  	return false;
>  }
> @@ -1000,9 +1000,9 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  {
>  	struct xe_pt_migrate_pt_update *userptr_update =
>  		container_of(pt_update, typeof(*userptr_update), base);
> -	struct xe_vma *vma = pt_update->vma;
> -	unsigned long notifier_seq = vma->userptr.notifier_seq;
> -	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_userptr_vma *uvma = to_userptr_vma(pt_update->vma);
> +	unsigned long notifier_seq = uvma->userptr.notifier_seq;
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>  	int err = xe_pt_vm_dependencies(pt_update->job,
>  					&vm->rftree[pt_update->tile_id],
>  					pt_update->start,
> @@ -1023,7 +1023,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	 */
>  	do {
>  		down_read(&vm->userptr.notifier_lock);
> -		if (!mmu_interval_read_retry(&vma->userptr.notifier,
> +		if (!mmu_interval_read_retry(&uvma->userptr.notifier,
>  					     notifier_seq))
>  			break;
>  
> @@ -1032,11 +1032,11 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  		if (userptr_update->bind)
>  			return -EAGAIN;
>  
> -		notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
> +		notifier_seq = mmu_interval_read_begin(&uvma->userptr.notifier);
>  	} while (true);
>  
>  	/* Inject errors to test_whether they are handled correctly */
> -	if (userptr_update->bind && xe_pt_userptr_inject_eagain(vma)) {
> +	if (userptr_update->bind && xe_pt_userptr_inject_eagain(uvma)) {
>  		up_read(&vm->userptr.notifier_lock);
>  		return -EAGAIN;
>  	}
> @@ -1297,7 +1297,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  		vma->tile_present |= BIT(tile->id);
>  
>  		if (bind_pt_update.locked) {
> -			vma->userptr.initial_bind = true;
> +			to_userptr_vma(vma)->userptr.initial_bind = true;
>  			up_read(&vm->userptr.notifier_lock);
>  			xe_bo_put_commit(&deferred);
>  		}
> @@ -1642,7 +1642,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  
>  		if (!vma->tile_present) {
>  			spin_lock(&vm->userptr.invalidated_lock);
> -			list_del_init(&vma->userptr.invalidate_link);
> +			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
>  			spin_unlock(&vm->userptr.invalidated_lock);
>  		}
>  		up_read(&vm->userptr.notifier_lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d096a8c00bd4..66593d841fa9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -46,7 +46,7 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  
>  /**
>   * xe_vma_userptr_check_repin() - Advisory check for repin needed
> - * @vma: The userptr vma
> + * @uvma: The userptr vma
>   *
>   * Check if the userptr vma has been invalidated since last successful
>   * repin. The check is advisory only and can the function can be called
> @@ -56,15 +56,17 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>   *
>   * Return: 0 if userptr vma is valid, -EAGAIN otherwise; repin recommended.
>   */
> -int xe_vma_userptr_check_repin(struct xe_vma *vma)
> +int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
>  {
> -	return mmu_interval_check_retry(&vma->userptr.notifier,
> -					vma->userptr.notifier_seq) ?
> +	return mmu_interval_check_retry(&uvma->userptr.notifier,
> +					uvma->userptr.notifier_seq) ?
>  		-EAGAIN : 0;
>  }
>  
> -int xe_vma_userptr_pin_pages(struct xe_vma *vma)
> +int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  {
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	struct xe_vma *vma = &uvma->vma;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_device *xe = vm->xe;
>  	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
> @@ -80,30 +82,30 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>  		return 0;
>  
> -	notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
> -	if (notifier_seq == vma->userptr.notifier_seq)
> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> +	if (notifier_seq == userptr->notifier_seq)
>  		return 0;
>  
>  	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
>  	if (!pages)
>  		return -ENOMEM;
>  
> -	if (vma->userptr.sg) {
> +	if (userptr->sg) {
>  		dma_unmap_sgtable(xe->drm.dev,
> -				  vma->userptr.sg,
> +				  userptr->sg,
>  				  read_only ? DMA_TO_DEVICE :
>  				  DMA_BIDIRECTIONAL, 0);
> -		sg_free_table(vma->userptr.sg);
> -		vma->userptr.sg = NULL;
> +		sg_free_table(userptr->sg);
> +		userptr->sg = NULL;
>  	}
>  
>  	pinned = ret = 0;
>  	if (in_kthread) {
> -		if (!mmget_not_zero(vma->userptr.notifier.mm)) {
> +		if (!mmget_not_zero(userptr->notifier.mm)) {
>  			ret = -EFAULT;
>  			goto mm_closed;
>  		}
> -		kthread_use_mm(vma->userptr.notifier.mm);
> +		kthread_use_mm(userptr->notifier.mm);
>  	}
>  
>  	while (pinned < num_pages) {
> @@ -123,32 +125,32 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	}
>  
>  	if (in_kthread) {
> -		kthread_unuse_mm(vma->userptr.notifier.mm);
> -		mmput(vma->userptr.notifier.mm);
> +		kthread_unuse_mm(userptr->notifier.mm);
> +		mmput(userptr->notifier.mm);
>  	}
>  mm_closed:
>  	if (ret)
>  		goto out;
>  
> -	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt, pages,
> +	ret = sg_alloc_table_from_pages_segment(&userptr->sgt, pages,
>  						pinned, 0,
>  						(u64)pinned << PAGE_SHIFT,
>  						xe_sg_segment_size(xe->drm.dev),
>  						GFP_KERNEL);
>  	if (ret) {
> -		vma->userptr.sg = NULL;
> +		userptr->sg = NULL;
>  		goto out;
>  	}
> -	vma->userptr.sg = &vma->userptr.sgt;
> +	userptr->sg = &userptr->sgt;
>  
> -	ret = dma_map_sgtable(xe->drm.dev, vma->userptr.sg,
> +	ret = dma_map_sgtable(xe->drm.dev, userptr->sg,
>  			      read_only ? DMA_TO_DEVICE :
>  			      DMA_BIDIRECTIONAL,
>  			      DMA_ATTR_SKIP_CPU_SYNC |
>  			      DMA_ATTR_NO_KERNEL_MAPPING);
>  	if (ret) {
> -		sg_free_table(vma->userptr.sg);
> -		vma->userptr.sg = NULL;
> +		sg_free_table(userptr->sg);
> +		userptr->sg = NULL;
>  		goto out;
>  	}
>  
> @@ -167,8 +169,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	kvfree(pages);
>  
>  	if (!(ret < 0)) {
> -		vma->userptr.notifier_seq = notifier_seq;
> -		if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
> +		userptr->notifier_seq = notifier_seq;
> +		if (xe_vma_userptr_check_repin(uvma) == -EAGAIN)
>  			goto retry;
>  	}
>  
> @@ -635,7 +637,9 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  				   const struct mmu_notifier_range *range,
>  				   unsigned long cur_seq)
>  {
> -	struct xe_vma *vma = container_of(mni, struct xe_vma, userptr.notifier);
> +	struct xe_userptr *userptr = container_of(mni, typeof(*userptr), notifier);
> +	struct xe_userptr_vma *uvma = container_of(userptr, typeof(*uvma), userptr);
> +	struct xe_vma *vma = &uvma->vma;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
> @@ -651,7 +655,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	mmu_interval_set_seq(mni, cur_seq);
>  
>  	/* No need to stop gpu access if the userptr is not yet bound. */
> -	if (!vma->userptr.initial_bind) {
> +	if (!userptr->initial_bind) {
>  		up_write(&vm->userptr.notifier_lock);
>  		return true;
>  	}
> @@ -663,7 +667,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	if (!xe_vm_in_fault_mode(vm) &&
>  	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&vma->userptr.invalidate_link,
> +		list_move_tail(&userptr->invalidate_link,
>  			       &vm->userptr.invalidated);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  	}
> @@ -703,7 +707,7 @@ static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
>  
>  int xe_vm_userptr_pin(struct xe_vm *vm)
>  {
> -	struct xe_vma *vma, *next;
> +	struct xe_userptr_vma *uvma, *next;
>  	int err = 0;
>  	LIST_HEAD(tmp_evict);
>  
> @@ -711,22 +715,23 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  
>  	/* Collect invalidated userptrs */
>  	spin_lock(&vm->userptr.invalidated_lock);
> -	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
> +	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
>  				 userptr.invalidate_link) {
> -		list_del_init(&vma->userptr.invalidate_link);
> -		list_move_tail(&vma->combined_links.userptr,
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		list_move_tail(&uvma->userptr.repin_link,
>  			       &vm->userptr.repin_list);
>  	}
>  	spin_unlock(&vm->userptr.invalidated_lock);
>  
>  	/* Pin and move to temporary list */
> -	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list,
> -				 combined_links.userptr) {
> -		err = xe_vma_userptr_pin_pages(vma);
> +	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
> +				 userptr.repin_link) {
> +		err = xe_vma_userptr_pin_pages(uvma);
>  		if (err < 0)
>  			return err;
>  
> -		list_move_tail(&vma->combined_links.userptr, &vm->rebind_list);
> +		list_del_init(&uvma->userptr.repin_link);
> +		list_move_tail(&uvma->vma.combined_links.rebind, &vm->rebind_list);
>  	}
>  
>  	return 0;
> @@ -801,10 +806,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	xe_assert(vm->xe, end < vm->size);
>  
>  	if (!bo && !is_null)	/* userptr */
> -		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> +		vma = kzalloc(sizeof(struct xe_userptr_vma), GFP_KERNEL);
>  	else
> -		vma = kzalloc(sizeof(*vma) - sizeof(struct xe_userptr),
> -			      GFP_KERNEL);
> +		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>  	if (!vma) {
>  		vma = ERR_PTR(-ENOMEM);
>  		return vma;
> @@ -848,13 +852,15 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		drm_gpuvm_bo_put(vm_bo);
>  	} else /* userptr or null */ {
>  		if (!is_null) {
> +			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
>  			u64 size = end - start + 1;
>  			int err;
>  
> -			INIT_LIST_HEAD(&vma->userptr.invalidate_link);
> +			INIT_LIST_HEAD(&userptr->invalidate_link);
> +			INIT_LIST_HEAD(&userptr->repin_link);
>  			vma->gpuva.gem.offset = bo_offset_or_userptr;
>  
> -			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
> +			err = mmu_interval_notifier_insert(&userptr->notifier,
>  							   current->mm,
>  							   xe_vma_userptr(vma), size,
>  							   &vma_userptr_notifier_ops);
> @@ -864,7 +870,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				return vma;
>  			}
>  
> -			vma->userptr.notifier_seq = LONG_MAX;
> +			userptr->notifier_seq = LONG_MAX;
>  		}
>  
>  		xe_vm_get(vm);
> @@ -880,13 +886,15 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  	bool read_only = xe_vma_read_only(vma);
>  
>  	if (xe_vma_is_userptr(vma)) {
> -		if (vma->userptr.sg) {
> +		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
> +
> +		if (userptr->sg) {
>  			dma_unmap_sgtable(xe->drm.dev,
> -					  vma->userptr.sg,
> +					  userptr->sg,
>  					  read_only ? DMA_TO_DEVICE :
>  					  DMA_BIDIRECTIONAL, 0);
> -			sg_free_table(vma->userptr.sg);
> -			vma->userptr.sg = NULL;
> +			sg_free_table(userptr->sg);
> +			userptr->sg = NULL;
>  		}
>  
>  		/*
> @@ -894,7 +902,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  		 * the notifer until we're sure the GPU is not accessing
>  		 * them anymore
>  		 */
> -		mmu_interval_notifier_remove(&vma->userptr.notifier);
> +		mmu_interval_notifier_remove(&userptr->notifier);
>  		xe_vm_put(vm);
>  	} else if (xe_vma_is_null(vma)) {
>  		xe_vm_put(vm);
> @@ -933,7 +941,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
>  
>  		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del(&vma->userptr.invalidate_link);
> +		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  	} else if (!xe_vma_is_null(vma)) {
>  		xe_bo_assert_held(xe_vma_bo(vma));
> @@ -2150,7 +2158,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  		drm_exec_fini(&exec);
>  
>  	if (xe_vma_is_userptr(vma)) {
> -		err = xe_vma_userptr_pin_pages(vma);
> +		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>  		if (err) {
>  			prep_vma_destroy(vm, vma, false);
>  			xe_vma_destroy_unlocked(vma);
> @@ -2507,7 +2515,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
>  		lockdep_assert_held_write(&vm->lock);
> -		err = xe_vma_userptr_pin_pages(vma);
> +		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>  		if (!err)
>  			goto retry_userptr;
>  
> @@ -3130,8 +3138,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
>  		if (xe_vma_is_userptr(vma)) {
>  			WARN_ON_ONCE(!mmu_interval_check_retry
> -				     (&vma->userptr.notifier,
> -				      vma->userptr.notifier_seq));
> +				     (&to_userptr_vma(vma)->userptr.notifier,
> +				      to_userptr_vma(vma)->userptr.notifier_seq));
>  			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>  							     DMA_RESV_USAGE_BOOKKEEP));
>  
> @@ -3192,11 +3200,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  		if (is_null) {
>  			addr = 0;
>  		} else if (is_userptr) {
> +			struct sg_table *sg = to_userptr_vma(vma)->userptr.sg;
>  			struct xe_res_cursor cur;
>  
> -			if (vma->userptr.sg) {
> -				xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
> -						&cur);
> +			if (sg) {
> +				xe_res_first_sg(sg, 0, XE_PAGE_SIZE, &cur);
>  				addr = xe_res_dma(&cur);
>  			} else {
>  				addr = 0;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index e9c907cbcd89..c1884f974a72 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -160,6 +160,18 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
>  }
>  
> +/**
> + * xe_userptr_vma() - Return a pointer to an embedding userptr vma

s/xe_userptr_vma/to_userptr_vma

Other than this, LGTM. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> + * @vma: Pointer to the embedded struct xe_vma
> + *
> + * Return: Pointer to the embedding userptr vma
> + */
> +static inline struct xe_userptr_vma *to_userptr_vma(struct xe_vma *vma)
> +{
> +	xe_assert(xe_vma_vm(vma)->xe, xe_vma_is_userptr(vma));
> +	return container_of(vma, struct xe_userptr_vma, vma);
> +}
> +
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
>  
>  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> @@ -222,9 +234,9 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>  	}
>  }
>  
> -int xe_vma_userptr_pin_pages(struct xe_vma *vma);
> +int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
>  
> -int xe_vma_userptr_check_repin(struct xe_vma *vma);
> +int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>  
>  bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 63e8a50b88e9..1fec66ae2eb2 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -37,6 +37,8 @@ struct xe_vm;
>  struct xe_userptr {
>  	/** @invalidate_link: Link for the vm::userptr.invalidated list */
>  	struct list_head invalidate_link;
> +	/** @userptr: link into VM repin list if userptr. */
> +	struct list_head repin_link;
>  	/**
>  	 * @notifier: MMU notifier for user pointer (invalidation call back)
>  	 */
> @@ -68,8 +70,6 @@ struct xe_vma {
>  	 * resv.
>  	 */
>  	union {
> -		/** @userptr: link into VM repin list if userptr. */
> -		struct list_head userptr;
>  		/** @rebind: link into VM if this VMA needs rebinding. */
>  		struct list_head rebind;
>  		/** @destroy: link to contested list when VM is being closed. */
> @@ -105,11 +105,15 @@ struct xe_vma {
>  	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
>  	 */
>  	u16 pat_index;
> +};
>  
> -	/**
> -	 * @userptr: user pointer state, only allocated for VMAs that are
> -	 * user pointers
> -	 */
> +/**
> + * struct xe_userptr_vma - A userptr vma subclass
> + * @vma: The vma.
> + * @userptr: Additional userptr information.
> + */
> +struct xe_userptr_vma {
> +	struct xe_vma vma;
>  	struct xe_userptr userptr;
>  };
>  
> -- 
> 2.43.0
> 
