Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D29C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 21:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299E31128CB;
	Tue, 28 May 2024 21:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YU5v+iID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AB61128CB
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 21:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716933023; x=1748469023;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=69EF8URXXIq/ucv9aBRJVwhglZ5DwhgZN0Zn5aLi9FM=;
 b=YU5v+iID54dT8bhNNO99qLQxVWaaAiqrX68l5rE7DlnbTFh9pwx6iHAV
 VVc3j06AYSTPDCBC5hC7OAGVNIifFtoCZwLd57u+NubReV1uFhDi3LpxX
 +jxjEYSlbeVb2OBhrtJgLiLJUoT8mB3r5Wai8DlKYgD8sz/kBhH6PZItE
 U/i6fCAKxrNs8DbU7iYCD4LQyBIa9kA/snKWaarxjBu0+mJal0pPoANvS
 GUzY9gMCEcJE/kwWYdEOxt8osxWa9xpqWJo5rsyvSBdCIS/jHc5dXAGNW
 KRBmgE5CB57vBe01XX3mcHylh/oHT1ANa5JQYJ3VVHjU1/R+5d4D6CdYN Q==;
X-CSE-ConnectionGUID: T92srygLT6SxKkKim1SBzw==
X-CSE-MsgGUID: v2yKhWWURWScY8UVHPt0EA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24436450"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="24436450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:50:22 -0700
X-CSE-ConnectionGUID: xnnxHOsjRC+SSEgjkmgRXQ==
X-CSE-MsgGUID: 1JSwNSKpRKCb1q3IVWUe4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39728975"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 14:50:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 14:50:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 14:50:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 14:50:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 14:50:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTrPZ+hqD46ieIvf2FjlsfMlWXNaFZ+KjlBGLlEksIItAErKWAYzKhCllF+PpKPDWa9mIhnKWLflPqKzmPcScIJUPJjVXBd5WhFxnEN24veTxAIn80DSXlybWLsHFmP6N/DadwGKqg8MmlNkKod65N1FlGVL5iDN2BeExPujfHl17Mep/Gj1Ib00bDg4RfXW+kPhE8VtefF4Sq0eN89rZTjjmiAUDFInV1Aa3h5i6EowJpMKO8pH8k6E3LSTHzTaLejQVXAx/IlBnamMopGZARUNKRhjXIXOp8vOXJCByh7LZb4+nRRAA14ioFm1UjCcCy+POIHS0ioja+ZtY74fQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kpm6LINvpSSahNRR7F/2AUsZE+QiiLV7qHEFvR8ohMI=;
 b=JCNFnPjOTsM2RysH6UP3oyyCR9HgI4C/dsNrcG0JWwP3582ZZ0PCjkAVbYa3K2aL20w4lnOABy2wqM9bixmAvH7I9UaXsrIPL1QzwXetOkC/sKaQgvm/dJdntVLmXrq32jTLncpNvlrh64gu7M3JAzVHrE4VdlqIXCAORqt2YAlZ+gH8wXt2pFQq9N3eX6oD8LuVtWt8qU4Cw2SJo/3BjTmfr43HRAVQzEQQG40yupELF+kCZdIMOno8DC4DhoWMpsqE9d0GzUGPOyyDU3/gv87eRv2zmqLTyNJv3qLmLnrWsVsVwZIqi589W/qvIEZkJcqO7CCBTONfFDXlWzknCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB5827.namprd11.prod.outlook.com (2603:10b6:806:236::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 21:50:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 21:50:18 +0000
Date: Tue, 28 May 2024 14:50:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe/vf: Setup VRAM based on received config data
Message-ID: <20240528215015.GJ4990@mdroper-desk1.amr.corp.intel.com>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527173554.1108-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 391b86ea-6fe4-4f31-918b-08dc7f602a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p6GoAsRxvadz5DDmn8wA+rGDBGh/mQFiFSC76hRiiYys77RFlncKvdflZLPP?=
 =?us-ascii?Q?57EQg9rn0lYRXLxuEyVG78qkbFMNPbG2JZVI9yFoW0/kukzsJAKTbTUlIMzk?=
 =?us-ascii?Q?FnVpEfL87AxeKmUvfmGZybvCXJ0ocM5dC8lWOGuNg5Vy5nAgwBd952/gTaGf?=
 =?us-ascii?Q?6HlH8okiHIEcedcr5tzgeBfXVjSxiWhPnGTozUSHCmF5ZFJHP5JhpwVnTEOn?=
 =?us-ascii?Q?hCb4wu3RLOnbjP4StlLaWMBwSByWkEW+jfbNK/hbHv5YWR0aMxqZnhSEsYs/?=
 =?us-ascii?Q?6Dg9uP8hRkEq/gOJLasNNzoHt4sgJfaezEl3jfvrkHUlp0Q7560CJg9fyaAc?=
 =?us-ascii?Q?njQ2gY3GNHcNTyGnAqgwz4/zws4/yiVrasl3OJbGkcG4Goxqb8F6X8z7hod2?=
 =?us-ascii?Q?WqRdnf5QIkXBOr9iaMDxlwJNeg1tm3BWFybgOZilcLecI6YMdoV+zR8Litqt?=
 =?us-ascii?Q?brW+1VHzgdpdro8iXQI2MWSU7q5pSmMpkXxXYkJKj/bdPSgQuRTU8yvBiR6v?=
 =?us-ascii?Q?v63a6Ay1T6Qziz5IPsb8aO0uUvtKdM9F5kwxrbyMsHeFGtER+qAC+JhEIfTa?=
 =?us-ascii?Q?4svjxHow5HogeKabD1lLB5dWxHz0OVeV33n08qicvGKwAZzhuvTsnlORliCu?=
 =?us-ascii?Q?Wp1uW4dIGBVakmyC/KYLC1aDaSdYlrgtSv00ibspMs24w42zk2moNQJQBGlz?=
 =?us-ascii?Q?zGRPQGS2Ed+MvwZKNw4jtlEW4VBbZFGW/zyd/reXQnc4wj6no1pWzXGiyWoS?=
 =?us-ascii?Q?aj+MSw1QaoMoWcpGxFdCxI/X4Jl8Y7epC3WP4V/PBYhUltgELwle+y+oGAaG?=
 =?us-ascii?Q?eeMa8lQqQw9kTsA0Xji5akVRfxNeKHnntNS3cMjnwFSLJxakp6JkgyCBDPDi?=
 =?us-ascii?Q?b80xpO9n2pHsuRmg0Q+o0JWcCO0D93hskmcg44Voq7WVBMFfuhUuxKKblll6?=
 =?us-ascii?Q?Ox/4mzU3yPEwDHUA4uk7va9n0yeWU7TLTz7hphCd/ZeDvD5h88XPNDcanZ1b?=
 =?us-ascii?Q?Bi3vluvtpape+ymByZjAlwPSP49G95nKAR9xjPjisSDbNJabmLhH8QKryAfk?=
 =?us-ascii?Q?sp0HM9xfVzJu1E8fS/6fVsg93vOjty+srjFVLhXSNUCeRtdAEgR+3B3Yk4ju?=
 =?us-ascii?Q?Dotyi3rJf4YLsShYVNCI97vtJAY71RDhEK/S/4SVJFx4mVDf+BRUdU3w+oEs?=
 =?us-ascii?Q?Hqe+KBv+RjnQoTFK0hnHEMOtwuSZjq8oeSXKxQirY4V23YGiGGM1vLCu7l35?=
 =?us-ascii?Q?bdj95RZZ51TGMN4qH5b3SpAOna4YaIrTmLBicu6blw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBfDS5VmZkd9SDKnXhb0bkwf1VyEIQGElUGqbUEDkdfnrx3teGPBBe06giWQ?=
 =?us-ascii?Q?5LgrYhRbmhh6HM38U76T2VNg304r0YxzPTWC3VJMcptgt764Tg/f3s+4AASQ?=
 =?us-ascii?Q?ketLI10ifqyTQEaFj1XIw+OhwZhCa4BmxAPgAofHPlibxFOQtPXeYnv4qzIZ?=
 =?us-ascii?Q?acV1tnmym1MEazbOrPchSaxJebRyzAu40meUX2UCZS9UT00KqgBPhrdWcWQT?=
 =?us-ascii?Q?pqNTz96KarzrVBBvHjRFIRc78k9GDfZ+XyBcY3vj3mNiq4sC+748FsncFQtx?=
 =?us-ascii?Q?ERZfWxP/J0D8oIA92l9M1J6C8VAR1q0FelDI+JmUlS2uJGsRjq+5YKyEIgxY?=
 =?us-ascii?Q?eiWz+NZEy+ajcjXVGwSUBwKFsl1m6a7IK7mhEq3NLsh3K1DG0fxdvKJMsWzI?=
 =?us-ascii?Q?ybBpSQfRAcI9JHG15PRuAwd220TIrKqyv/t7/KBEjX9NgjbbdtBxJTwhtU4Q?=
 =?us-ascii?Q?zNppokxohpAbA5L6Eb1PO4EL3e8fMhQ1RZciaf3CA6lsL3wzrzd2jXRJgezh?=
 =?us-ascii?Q?Rvifa8uzxIDoB3PxYF8A7jPL2h3aFg7UziPRwuzwuDAOMcNeA+Zr2KqZEW7I?=
 =?us-ascii?Q?4dRz/IEyYWqlQA6wJPdwbpypZmTmhqqM7lYCBt3doKAIrZ7fTJZsRWeyCWh9?=
 =?us-ascii?Q?GLFBYE2GSvEtWTMXalnOVNOt9Nyi4fp2JKGGfgZ1x038DroHFN2YZovbaIlH?=
 =?us-ascii?Q?0rdjoFAqBKv+Qhh5uzfGr+UGQr/+gMLX+rG1kd2rS8xT8Vj+t978J/xbk7a1?=
 =?us-ascii?Q?KSlVh+U5vrnLN2ISO6V4dnvQiZucGD0PnMgQfy8W60XKI66Y8MWbvHpACG/o?=
 =?us-ascii?Q?yMFSKvor8xppH6YrLJpE3YEuE7pM8+kJXNeyXlSU8kGgmmWhdRO7Eqrk8twB?=
 =?us-ascii?Q?V3Fo2NXulJlLHc9PJ1U4dOoJLrWsLkV7p73AHdsN4wnf6uj++5A/xbKe9iBw?=
 =?us-ascii?Q?HopU4YtAPcFXn5s1vUC7J9AebVjeHFFuKuHepUAKN+CB4xZzJysrG4k1zveE?=
 =?us-ascii?Q?kyoR6sencaxXiyW7f70mgMW+e2ACBUPG5wIPwlkHWgKJNPqx2dEy+WGZb7I0?=
 =?us-ascii?Q?4HS7Yav1fGjDnGjT0ibFXIaJpe5jjKssFGdEU2ABoZ1l+0RA26aPJDFG/uHt?=
 =?us-ascii?Q?w+4eZriunH2+5zCw8wLFI0LoW/hk5t/czH+n244gsjD9kAJChIwRnVMqmRvt?=
 =?us-ascii?Q?dojjeLfegGsAEyGrkME3fGd2/tthtuviKCMLXP6Rv8OWCyihJ9BT+JGl4w9+?=
 =?us-ascii?Q?XiEuukftibMbVSBeB9yVq/lvdjeMdglwqPFeJTpyaESi9u6DNtG1g/jN4LNS?=
 =?us-ascii?Q?A1/qm6SI9mMwUx1ObwPJXkMHGrur8SnC5nSNMa55HjlKDIbOZ98XxHOOYpcw?=
 =?us-ascii?Q?KWYm0/AkntwJjVroWHswOscWz8w2iT5Jtc22QGRx9MOnuXAaDAMe4Fvxrb/l?=
 =?us-ascii?Q?NCxEg/CluBkIEjqU0j5iWTNh7nXf02Zazz9yJwN8pRBaGfPduRAFOx81cx60?=
 =?us-ascii?Q?nOTjIYg0m20MJr5Oq5uiNeDaTM/a21vSULKByJksG4UBS9RIfRzDsTJ6J/dM?=
 =?us-ascii?Q?bmswswdWDoID89JMKvOVS4rr6SJ5KWrMql6P5UVLonbj8q7ap+JoQDfZ6DZf?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 391b86ea-6fe4-4f31-918b-08dc7f602a0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 21:50:17.9931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBzzgUPgEYTBf3kSO4L8/MJ0kGAOmZ7YC26EP2C5gvqHwEawMIj7gAd+0VYTOnNkhUzsO0/Wnwzv9VV+ukMqyErSfihwdr3p3Q6bdpkPElk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5827
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

On Mon, May 27, 2024 at 07:35:54PM +0200, Michal Wajdeczko wrote:
> VF drivers will obtain VRAM configuration from the GuC as part of
> the VF self config. Use that configuration instead of trying to
> read inaccessible registers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_vram.c        | 18 ++++++++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index da7c64f6285b..41e46a00c01e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -478,6 +478,23 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.num_ctxs;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_lmem - VF LMEM configuration.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: size of the LMEM assigned to VF.
> + */
> +u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> +
> +	return gt->sriov.vf.self_config.lmem_size;
> +}
> +
>  static int vf_balloon_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 7a04bcaffe9f..0de7f8cbcfa6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -20,6 +20,7 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> +u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 411e8d23fd4d..ccc4791c0e34 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -15,8 +15,10 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_sriov.h"
>  #include "xe_vram.h"
>  
>  #define BAR_SIZE_SHIFT 20
> @@ -220,6 +222,22 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  	int err;
>  	u32 reg;
>  
> +	if (IS_SRIOV_VF(xe)) {
> +		struct xe_tile *t;
> +		int id;
> +
> +		offset = 0;
> +		for_each_tile(t, xe, id)
> +			for_each_if(t->id < tile->id)
> +				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
> +
> +		*tile_size = xe_gt_sriov_vf_lmem(gt);
> +		*vram_size = *tile_size;
> +		*tile_offset = offset;
> +
> +		return 0;
> +	}
> +
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (err)
>  		return err;
> -- 
> 2.43.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
