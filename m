Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410BBC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 14:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B327112B56;
	Tue,  5 Mar 2024 14:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TL3dabfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6253112B56
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709649745; x=1741185745;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QYBKknX3oAMe3JaAV53Bd8lGoiRFTnmCBK5JyRLUkVc=;
 b=TL3dabfElPGIT19g3CQ7oNDsEsefqM/LHxIH/AGCF4C6Rpki8nhjGunp
 B1xJJhBVzz5tj8p1HiHe36OlsRYikC4vWYEdiZ4S09Esh4gnwJvp3rrzN
 rWlqzQaMuoozIpQ3jax+AhmuOb8/+pzj9FdhYuhikw/QP9nBq+yt5nTiF
 NXzV9QyoSpK6bOqcosIVHjAzDx/LwqqNg0S1rTrQyXWJI2PjS+BejHMTj
 bxSgvlWch/bwd31QUlW5KOLQttHzyavkFrPakNzNTOR/C/7n7YGjGxfpL
 Ekz7jTwl7vTqQCopfFJ8sTJtOIgwalToA6sKyw6HQfZKCSAF2doNB/ui7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14785462"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14785462"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:42:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14073004"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 06:42:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:42:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 06:42:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 06:42:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3O92nWNjfB4zlpGjcV/oGT6OuUuRyd82xLGOHRHkd/16+4Mt9YErQ0Z7R+b24kzxtSTaOVVc8SbHJasICVmDvutqTWB9IniVlRgbOK2rIDskobGdV3eSu70YhV013rldeiksnD9b5hVwmkQcs0UoAiatYMoRX/YA0GqhmtjgdDBD5svruNW5wfAWSpflsyBfjik4lLvuqj15SRjNgbwMWaZJbuzhOZgbuw2lNTShmINbRWpLgbKEZtx2E9vXDD584ay3/U8Xc6F+656N89mUtZSyTMORiY5sxI6kMDxBseAl4PaQdpxU27DLU5Frw1iUONunXTTS4n6qEYivvzcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO5FLI/04E3CPUvVrlayXE/ZKzD2n1tnyN47y+8Jx4Y=;
 b=DS8JV+1OrD4ihzRKog4SDgIuKjvtmQ2nrGzmp9djff7e4u300qCIJi4RiNIZ/W5symW9uzVgPHJbtvIGh4zQdUYrNfvBGDwpklB4yTzvO6oJwfEtG5OfKwqoxZPJg9PFA/l4wBZdOUWv7n5LGfCo+XWIexCusWS5l2JmPrvk01lYcKmEZ29KXjnI9U+CiInnmF/aPMqiz6piLNBIGJsWALk7JqqQKxma4KU4elsSYiR+l8QzQESKxDSUubwMdOaPQgxz8B2u14hIBMMvTPdXyLWD0JRjpvcSyLUsiJzKACxzpBYpy0EDvhklKJCS4jMcITbf6ETKsFd/PiwCNgWvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8345.namprd11.prod.outlook.com (2603:10b6:a03:53c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 14:42:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 14:42:19 +0000
Date: Tue, 5 Mar 2024 09:42:14 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/4] fix "drm/xe: Cleanup some layering in GGTT"
Message-ID: <ZecvRt6bLL7xzmS9@intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
 <20240305131250.5330-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240305131250.5330-2-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c81732-7248-489b-99c5-08dc3d2275d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nYDD2xqkxJTl63JCp65SeHEYIpi8nXcpW1GnqF93SULkLqfIGOtAcgSmZgpoQTZPlKrBfgevYO3q8BFmMJZZsiKQd7z8dDNCWm1VeHZhlGajYCq6Xo+dAyEmWAmbMnnEgh+jYH5hV+q8PGFyg4LAngEcXSlB/XLBBxooA6qJlhNTdVIeJZhOKXkPzUzLHOvONvExSRFqC9bSoubE9Qe4LqdVLUKQrs9oSY10aHgnT/uY9NyHoyiklf9VuchqRTW74zJI0mrIgg3Pn6i1KkXJTwDKE0uK2Rvh8T+z20cZWM4J3WwoVJPTRBGehekQvV6OIpx3c9o4FOHyAUc94cpqhMlVv16pCquzY6+m1mwxuQLT75L3CPX78v49t977MPdFDs2DRBqa7OOHhl0k2CMP3EhNgVGp9nCTN4hRbCCkYfYh4ZejTlyaRzKFY6v+x7c0y5OLVdF8YKVktiP6ea9WWi2QzI/P8sGHssKs2v9WH+pB2vx7LNHyZnOCQNAazrgkcM/8XOZJ+7h8+n4nkmJ3rc7WxOJq6NYKCE1PRREIxujCTyK7Jlssmsb2UNmpzxuzri9wxz6AS9OvVU5JSC/14u4uvtn7DkzIM3nc1iLvn67DHM6M5NupZO7a/Rs7y0SSSHa6Yz7LTKZnmnoOacFtGpaH1TTB1Pyp1Tux7Jl9LA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?daCrDTNzLZdhwXU/poD0RvGsCXIrQl8AW1QjHxp8EwQxg8CvQ6H9sW62g4N4?=
 =?us-ascii?Q?wqDg50tFPT/LZzp0Xx1feZ3W+O7hbc0kYGBIhNAYEKTlfocS4Nm8o2YPpwLE?=
 =?us-ascii?Q?DWq3T+v3rs/IprpOings64TNkjmYVx5TK4/4JtbJ96olvW6f08H35hlg6TM7?=
 =?us-ascii?Q?NcHkucWFqZtZXMO6e9eQ11hK80D9KqWHMP3YaJv+V/Uils3/CQav0ai7ZHY0?=
 =?us-ascii?Q?mRsBo3/MZhyFPn6D5hvEbsiZexGPVnfCRwHkaI2eQ1Dmx4RTeIVR/5aY+h75?=
 =?us-ascii?Q?FAzvuhtBFrB5BD9LJaN2oOJTAXxVE+UjXm1z6k+qdZvNKNlgxzcmVNWBx6u1?=
 =?us-ascii?Q?Y687I4AcCAU0FhizJiv9Rbr5pSuj/2r8+gq86e4F6MhH/uLgc0U1mcNP8uOF?=
 =?us-ascii?Q?jYLBmP5/y5xWlU0osq7bh/gv+6Xe8BRJ5Qwp99RwdS4sQTI0Gjs1agJykw+q?=
 =?us-ascii?Q?sbSMWBkwGD+c+V8ElP9trNYZBim4e6f84s+Zn3b9bGRkdwZjkQ9fZRsj9/Kt?=
 =?us-ascii?Q?4wvPHGuIxr2VCeNxHo13Zgjr8+0eNRQS7edxOrl0tyhf+UpAuY3tDQCzC08V?=
 =?us-ascii?Q?q9YnJrijlh6ov2H0t08lMDxuyRgOvCbuLWi9EywNIn8UwyCUcyfEg+Qzdfc0?=
 =?us-ascii?Q?otFu26lO3GYAM0nEoBloEcC1AXh4LT1yZdnDHHdEyVlMdORRdGjV1kPt0Iyh?=
 =?us-ascii?Q?Y37y761f95EcMmuIDsHLsf6QD2NBhetP04suuBVeG7X8L1cYlgxPFa8qLT+P?=
 =?us-ascii?Q?cVUkn7bYNefqeY8cFSmPJvNZemN33i539z42TtsdJRTsPG0RPdvVfupGa2ac?=
 =?us-ascii?Q?212UIltVmvQPtP59aoZgk3AKH2I5a+f3Q0IR2C0mNezdwlKXuASkox9VAZBN?=
 =?us-ascii?Q?3jnkFwyUbcF16eWzxM5vT5+6FJEXclI1uS/ZdBb6y6MGwWtFu3z/KdfQsQn2?=
 =?us-ascii?Q?3oXCI5zcSP0Aweid/NJQsWKQLboEdokEJKBRsyaLoxcmEqseb2w1fSI8gcA5?=
 =?us-ascii?Q?eFbvYS9/uJb0HzjpF65OqJYY5AqaCjs55awkmg6i4lWiydfxvwV3Ny48hN5s?=
 =?us-ascii?Q?QtATZeGPAtMGz5yd7teLWZ+p/kxJOoLMm0L5b6r1udigoEqB5gcsT1uZAuU8?=
 =?us-ascii?Q?wyM+dVkFaJTjfhIe6pAIfxxyjz6lXZ+NA0bBPSHpoLpwNMCg4f7wPaKSkYnn?=
 =?us-ascii?Q?Cy8sb7y+bs6VxkUJnqR6qFmZLkGHigS9fOF6ZlP8XoVqZ1WhAh70QaMVyepz?=
 =?us-ascii?Q?kWrTIs5FPvw1ofIg8raAD7Gu3rDGEiDRSXrlHUC6g290nuQxWBvv1B6yxBxj?=
 =?us-ascii?Q?WaWVMipXKmITlmv++f//sQJQCaOhp7ilU+7waqPsC+ruTcY4CwBaw3tWlHKp?=
 =?us-ascii?Q?YjTKM37dAPUtqDX/L7rklbw0rhBlvygJkRa7s6/QmR/AAKYmVq8z6a9wE4/y?=
 =?us-ascii?Q?IyzbdxrXUpWqZSlitv5oByESrBlDpfOf2WbsBKxPDxNSlKz3bj0DTORf7Jp9?=
 =?us-ascii?Q?1c09FSrn6Faf9TNf8YI5r01Ndw3VxhG63pCD0/Y/80dwheBkPLYGthBxXd4l?=
 =?us-ascii?Q?pfs+ucXMnJnrYEFn+bwKTOuQ8QOdcTeKDYfqwzYlGoU4galZEbgZk5eVYQcg?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c81732-7248-489b-99c5-08dc3d2275d3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 14:42:19.8457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfpWeAC19D1gKj8N+Bl/lSzFDmhO2yl6uFXVqh/kyrBNj8v8n4nKzRR/m0/7mrAdRVZ4AoKpbFlLrw3OVby2VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8345
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

On Tue, Mar 05, 2024 at 02:12:47PM +0100, Maarten Lankhorst wrote:
> The null check for GT is after calling gt_to_xe, fix it.
> 
> Fixes: 3121fed0c51b ("drm/xe: Cleanup some layering in GGTT")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 717d0e76277a..0435e1202c46 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -251,7 +251,6 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>  
>  static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	if (!gt)
> @@ -265,7 +264,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	err = xe_gt_tlb_invalidation_ggtt(gt);
>  	if (err)
> -		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> +		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
>  
> -- 
> 2.43.0
> 
