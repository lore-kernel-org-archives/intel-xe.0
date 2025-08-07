Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED731C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 19:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B351110E181;
	Thu,  7 Aug 2025 19:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jB2mlmGe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C1C10E181
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754596473; x=1786132473;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=grafQTZa8MBFpqUiR78QRz3dA83oCwxx3oiZcOUhIoQ=;
 b=jB2mlmGetk60D3BqVPbigZoibve04PMVLMdtsKkRqQPdo7gNRBWpNUPa
 meUErRB1bx4viCr39QP5kCAy93VcO85G8vyZ6S1IB8mGEtbgUY8s/zAS1
 JO7UdCfuuu3cnQPtj58vcbVH1LaYGUBEVVAhuWqV+vbkV3oKe7W6t+RD6
 43cBQaviQQstdGM4Crg5QRfaIN7NT1s6aMq5QuW4NEOoOjeZCGLv0j3i0
 6koBwo/n803neAH9wBcrK5KPrmJJv0kNDS9MXcR2WBKK/Y4Ipdd8GuuIH
 W6bTUFId0xmEGCJQCUY33JMsJQVQCpA5fkqO7+773uF8tzEAHWNy4dpqk Q==;
X-CSE-ConnectionGUID: OotIg5x8RUOCgYjgTGYmbw==
X-CSE-MsgGUID: pbRJ7xl4TQW0c1ioUEk5BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60750181"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="60750181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 12:54:33 -0700
X-CSE-ConnectionGUID: bmr5fz9EQkCZH2j5Xwx+Bw==
X-CSE-MsgGUID: uqSyGRZSRGOO7SFghIAhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165162383"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 12:54:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 12:54:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 12:54:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 12:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8kjOn+gFL8/ZDt/xJItxgGeEOsvVJ3ly7PnQowdTfyhIqlViPjiqqo4Sf9Za3EWWUiRrpe+jgjT+feSUdfZjHhRW0vcqeSAv5HzrQyOkvqFSGVd5l+au1rVkyzBRDfZ27LH7CZTYHUX3mWqWRSRi4R9mCIXnlIIN3gHpA3OvaGqJp7iLFpQlHYCgbjF/3hOkYK9mVTyusww2lsSPuyzzmuX/rbmgIdVy2HGkM5S1muT1bttwoOQu6Zv6q0DNIshtwHKIA3VAu9XR/d7EYn8J8gj/NZS2CNCWdeCWPhR5LtFXIthAJgha21iJTXoPIrhy8bi50VemLXJGo5iuied2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdBw67fIQ28MovN2z+71aTFmpjiJ9zN0yQwKjUPYAWA=;
 b=AmwvgHYKDP3qWgHhAiSe1gNaG0F68zqyaifw9gShwknr2a0hyIq7EpiMFaSmKa+IM9hoF99Q9XDZ/8fL9YU6tKtKe4A1e9pqOVrkLMBfBpS7/13HEGZSVJsxlj+LfovLOUQzsWNgQSYLhrl81XL3J4gzmgRO+MFNjee88e+Ngmi9bDRmnjpMFG6ZCmcM0Es9i7XwhpNq0TznRgrLQHHAGB/cSPrUvHU2eTxjPFbO1yMMNJMker3EuVZpIBrPzMtm9EZrg0p6eWs4sNhMIaRHCPqnuXbLWVn6nEWhVHXXjKgSFZ3tImaWHFUC9CUqHlQTut0geJ77pqYopYZ1Vkaytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 7 Aug
 2025 19:54:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 19:54:30 +0000
Date: Thu, 7 Aug 2025 12:54:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: stuartsummers <stuart.summers@intel.com>
CC: <farah.kassabri@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/xe: Move explicit CT lock in TLB invalidation
 sequence
Message-ID: <aJUEc0/8K+yDe+Yn@lstrano-desk.jf.intel.com>
References: <20250807193649.55399-1-stuart.summers@intel.com>
 <20250807193649.55399-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807193649.55399-2-stuart.summers@intel.com>
X-ClientProxiedBy: MW4P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b06956b-5003-41c9-7ee7-08ddd5ec38c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wF39ypebpFZRhDzTGv3KDcOVapohraO9Tc0RUpVJtD0pg0nj6V7voVcl5tIu?=
 =?us-ascii?Q?xPUiOELKfwnyUKWrdCzpLGNwQJC8nU4vt3CF6maNsmbxbyCZmpVE+/7olyaC?=
 =?us-ascii?Q?24rngEeZzrvGuB0I4XbkO6M8edFu6dJwbJ/cB2IR/p4aqFGd6GzsP4zh0vp2?=
 =?us-ascii?Q?SCG1MBf6Q8zCXGqFPLKqRMhJYNo03Xx6fuI+nYadYsxP/GwDUOIbk4UGESuF?=
 =?us-ascii?Q?V0b04gYM8+vr9nvlMmvLaOtwORW+n0kR8eBpzqi/CrMbMzXD4gyf2o9rz5Ok?=
 =?us-ascii?Q?5lGlueykBEuFNOUrai1W9a1nzMhFubUsR+v1z4Rcw35ZIFy2bpH8ZSmbZHfw?=
 =?us-ascii?Q?JuKw5RqN2djLN91Nh94p+GooxxVe6LNoKjV58cAqmCereVHS9AXLxrIzPj55?=
 =?us-ascii?Q?lXlxnwe8jseQCfWKJqhampXoaaHSODPZvkjPkt9/EPzejP2WbFeCoV5atJOW?=
 =?us-ascii?Q?pcAXBWbkMa6ysTz1zz5zuPN7mJmWP/sSpQlU5HO2z307fLJjCuczFBM8dOpy?=
 =?us-ascii?Q?oDUXm8kIi+0RfJBWKK8XMkGh4rF1/5DLtfR6gjeodZry/HV2mM72dQOOYcx2?=
 =?us-ascii?Q?e699GPU+Fx6L2pzfd8rdyww7krbhNHn9DRKITpJ46ykH/iCUv3J99IXqXySw?=
 =?us-ascii?Q?QuDEZ5gBzZV3Qaw9ZR7pJ8ak682I0Iw5A0J3cd8TdokvGXV/0sUu5jqsLNbn?=
 =?us-ascii?Q?2PaBA3PBnf1knHNusXXLro0GseC/wS3MMSwFea9zjGLI9FEnBkHhPTzSZnn0?=
 =?us-ascii?Q?TnNYp1mBj2U/V5YX3MWR/+XjrN2kDVGLC6eGR6bV10f6okcLhkF2iC7e4N7y?=
 =?us-ascii?Q?LYHmU0SkBfAae2FIAZDM01SM2cRc90osY13zpuFcS/mMigdJ+rWcq9i//Dx1?=
 =?us-ascii?Q?ME3y4N2uFVnYah4L9XN36x4wStF+q/b+3Oo2+d+LFn0Jnk40vgAHEKcwh7I0?=
 =?us-ascii?Q?NVEh02X6CsZXV+H9cmEghWGIG4UQrgKSSPZcInzDHe+B2XJzucfW7kKTsPR+?=
 =?us-ascii?Q?OVDMPqUtoChIhh51GBi3o2dFF46gLyQkz/PzWj1Zy0f9NTgXwu+k5kOlvWoG?=
 =?us-ascii?Q?FJYaw6zbiDx1Ujtzbi4nOVBi2VAJkYMAIt5mTF3ObBkknAfypR/Xwo5Z7vgc?=
 =?us-ascii?Q?t25smk3x1Mc1/1TyiC8UGzj8A0uHFhHSRpf3SWEm7s3zeyXQhoBF+n48Tjx6?=
 =?us-ascii?Q?7R7akHkx+wL2iX7NLdSybAsXVLRPcbCKAhewTE5BDQpACY1OP+icMaKBZ8im?=
 =?us-ascii?Q?HlLfC9D3Ge65miuSIwIh/9un0yGLDHsKEh0on7ma10+vlEgWq6ax+MS7VyHs?=
 =?us-ascii?Q?WjxD0NYDDYLqp8NONxh2/62Dj+hu9yIYcc+AgTGHfalEchH5tkfrLnVv81WG?=
 =?us-ascii?Q?JxBrCNZRzd9Y0xWIph+/4MJFAp9ax9wp8PVhq2AITi6qTkjQM7AUOZ7GyGJG?=
 =?us-ascii?Q?1dsRozlOuS8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1wXtUmUSrUz2LvLfk3IoYiHrQjROMSGLsgUHGBz5iMr+4Q1eHLlmd5Guyo1U?=
 =?us-ascii?Q?IO687BDZka/CAaeQDv3jynl/uUCXuTU10Ij7XCHDZ1Ov3OQfKgigpWL8hf/3?=
 =?us-ascii?Q?DHAsGL+d6ivI5OczDnMX8UMJeRogy28sHAvkRoEKeCdoQx5+NinnM1O/RKcn?=
 =?us-ascii?Q?5AbjbaOm5dEKLBq0ctTYn8X34VxI5CuvaczXgLoMjrHpqYNIVhHO7EI2vQ9L?=
 =?us-ascii?Q?cjPf1JZYGwkaHiuCNbdf4EW0dHg1NLgBOcYEjmebrPfjHtvoPPOzD9/mmbFW?=
 =?us-ascii?Q?gAQIxsMLDb6Q+AE60skPrunwHoCGBDjvQegfiTYyKOM+i4rhyB4IP5SaRa6Q?=
 =?us-ascii?Q?lH60mUyvPB1phRMKABbZeV2SvI/UXdNGkIr357mNp3Z0gwFQ1SsUI+qGxdu9?=
 =?us-ascii?Q?Gp3z8dbnjA0R2c6Aq6htMq/1Ewfe/Ou+fiuDGlVFusb+oIH397RrsEFNekpI?=
 =?us-ascii?Q?825RYnuMjd1hQBDKOl7zwghNaUl+28Qo/1L2hm1mxBMD4l2eFWoOZ2FI5hdM?=
 =?us-ascii?Q?ZVqSc1Go7XdEftvGOn44lYe7Y4YaN6xD5JqC//hlTrZxFKvklDyvI/YcY1GC?=
 =?us-ascii?Q?itbDga2PzbLAWgHAToW1jpCyamIUZugXgVRu+LL1aP6rM+CXQcrmO/btj3pM?=
 =?us-ascii?Q?jPdh5tMduzP8MzzfJzqRT8JbaF0uP3Gv9DvBhdWWxwzhAdDTcDZc2siEH2jG?=
 =?us-ascii?Q?0gJIBrjx0F1vEkizeu4sH+mie85zGIw6TQlNEpFMBa4hzBOhWIY+8c4G/tNP?=
 =?us-ascii?Q?iVjyCluS3J5sYFDBZpZlzdptBVB0vuhZJBhTm1+v8HZsXgSyoOf6S3oxi2j+?=
 =?us-ascii?Q?McQOUDWdYU63GKynttGDtw/ScBpuicwILUXaUDVLtMpVXnpiq2gruPFLmmP8?=
 =?us-ascii?Q?rvvL70BowUatgjzlFaVvtv27dIzs7p1MDDWwS/kxLgGdvJfT1Vi6uUgSNWce?=
 =?us-ascii?Q?GnIPJLhgltbY0clVBkJNoSfPQShkCYkX8mHBFglwAF6pJLEbOU/rakNi8Vvp?=
 =?us-ascii?Q?b2glfToCr98CVsgAR+/ShdKoolrNHKOVltmcqXtJmvSjDXv7vNLMRHJomw0M?=
 =?us-ascii?Q?hCYePj9Dp9XzNDex64wpke9Nv/XilVcsjTl3c5Ag7WgsZBCv2kq6r/frZIBj?=
 =?us-ascii?Q?LfQZJEL0l9HDB94qY1bmnuAudVX7Gd7sB4GJyWZnhLux4JKpcFhcIgh5ec5e?=
 =?us-ascii?Q?3LY+mFkh1F49xo2rx3rIqtcDFAyf70/m6XDto2p4nAhPP9ucgPsruLgjhOt0?=
 =?us-ascii?Q?cQLOBE/s0O5k1aH/GvouGS8B5Bd3VmmLJUDYj2NtL8TihsaSODXRniUzzjdA?=
 =?us-ascii?Q?0X7kmszc/f6MGr+znVGsNfSf21c1dpsV7lpr0SRXr4gvdJGTwLE3ixB2Ys2R?=
 =?us-ascii?Q?G/IJcdXEYusp5+28FFnat9JbaFs8WhmJvgtYFVj90uNdX81KktAiq1xFclb/?=
 =?us-ascii?Q?X4GY90EHsGX9SzK0t5HDUvhczTO+1bb+4h+TKWPzwDiKLZYv3aRFSn8rSprR?=
 =?us-ascii?Q?Ys0ZoZqUsRf31j/HiYMyZmkELiNoORfVwkj01kvQdKZz3UkpYn8K6Qqdnsxa?=
 =?us-ascii?Q?xWf5qzzGwiAs8223DnrQ5Yx8kpGF+Lg50VdqeXOvi0+brtDhhKZly5dDkSdJ?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b06956b-5003-41c9-7ee7-08ddd5ec38c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 19:54:30.0133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cokAsf2UcYArUN0EqSEsBiO0EDqm+pd9NSLHBRfTF8Jz1K9tbGzfxgwQWeSbqWRSpXCYb4J+sOlsPU4EoKKnsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
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

On Thu, Aug 07, 2025 at 07:36:42PM +0000, stuartsummers wrote:
> Currently the CT lock is used to cover TLB invalidation
> sequence number updates. In an effort to separate the GuC
> back end tracking of communication with the firmware from
> the front end TLB sequence number tracking, add a new lock
> here to specifically track those sequence number updates
> coming in from the user.
> 
> Apart from the CT lock, we also have a pending lock to
> cover both pending fences and sequence numbers received
> from the back end. Those cover interrupt cases and so
> it makes not to overload those with sequence numbers
> coming in from new transactions. In that way, we'll employ
> a mutex here.
> 
> v2: Actually add the correct lock rather than just dropping
>     it... (Matt)
> 
> Signed-off-by: stuartsummers <stuart.summers@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 19 +++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_types.h            |  2 ++
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 02f0bb92d6e0..75854b963d66 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -118,6 +118,9 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   */
>  int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
>  	gt->tlb_invalidation.seqno = 1;
>  	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
>  	spin_lock_init(&gt->tlb_invalidation.pending_lock);
> @@ -125,6 +128,10 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
>  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>  			  xe_gt_tlb_fence_timeout);
>  
> +	err = drmm_mutex_init(&xe->drm, &gt->tlb_invalidation.seqno_lock);
> +	if (err)
> +		return err;
> +
>  	gt->tlb_invalidation.job_wq =
>  		drmm_alloc_ordered_workqueue(&gt_to_xe(gt)->drm, "gt-tbl-inval-job-wq",
>  					     WQ_MEM_RECLAIM);
> @@ -158,7 +165,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  	 * appear.
>  	 */
>  
> -	mutex_lock(&gt->uc.guc.ct.lock);
> +	mutex_lock(&gt->tlb_invalidation.seqno_lock);
>  	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
>  	/*
> @@ -178,7 +185,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  				 &gt->tlb_invalidation.pending_fences, link)
>  		invalidation_fence_signal(gt_to_xe(gt), fence);
>  	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> -	mutex_unlock(&gt->uc.guc.ct.lock);
> +	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
>  }
>  
>  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> @@ -211,13 +218,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	 * need to be updated.
>  	 */
>  
> -	mutex_lock(&guc->ct.lock);
> +	mutex_lock(&gt->tlb_invalidation.seqno_lock);
>  	seqno = gt->tlb_invalidation.seqno;
>  	fence->seqno = seqno;
>  	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
>  	action[1] = seqno;
> -	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
> -				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> +	ret = xe_guc_ct_send(&guc->ct, action, len,
> +			     G2H_LEN_DW_TLB_INVALIDATE, 1);
>  	if (!ret) {
>  		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  		/*
> @@ -248,7 +255,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  		if (!gt->tlb_invalidation.seqno)
>  			gt->tlb_invalidation.seqno = 1;
>  	}
> -	mutex_unlock(&guc->ct.lock);
> +	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index dfd4a16da5f0..420900ecaa97 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -190,6 +190,8 @@ struct xe_gt {
>  		/** @tlb_invalidation.seqno: TLB invalidation seqno, protected by CT lock */
>  #define TLB_INVALIDATION_SEQNO_MAX	0x100000
>  		int seqno;
> +		/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
> +		struct mutex seqno_lock;
>  		/**
>  		 * @tlb_invalidation.seqno_recv: last received TLB invalidation seqno,
>  		 * protected by CT lock
> -- 
> 2.34.1
> 
