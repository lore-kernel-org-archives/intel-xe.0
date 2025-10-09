Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239E1CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 14:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0A210EA7C;
	Thu,  9 Oct 2025 14:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvvKbP+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2628C10EA7C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760021590; x=1791557590;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2FdbuD0T9ZpD+bM/SVI1c7rg2KNd3Sgppzc44vyCvt8=;
 b=FvvKbP+1+3LR8ZnuyT94RYwyFtBQIrbu/5k4zRmkaGPvoDyrvDNq1zoU
 D8+uXGbrhjZKklT9od4TcIUUigwsAQvfdleWja3JanVkj+DFYfRXQQ9i/
 mVKs/6PylifWAW9SW/fu0rUq9WMxRHzRVu7jvEPaRxr9dd8qBMFTi3ECK
 69184yOQKa9wde18nWkxdkPC5cGgji0Fopr+0Uf1Jpil1bB7+kyOFN0jf
 c+0RUnJhW6sR0Wn/U4Gqdh8kAX2I0/kGRy9WSTt6EoDdDdiInz6IJc3EN
 0OQTh5f1FK2VItkD2P4l6cO9cuCmJ5fnCsqcccepcVdQyocTjvxR1XDLo g==;
X-CSE-ConnectionGUID: SJiwOIPaTxq2SFUdcOr5Cg==
X-CSE-MsgGUID: 9b6GgXHISHmLkA6odPoNqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62174556"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62174556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:53:09 -0700
X-CSE-ConnectionGUID: lcWfPvvZQH2a5Y/dwFkmew==
X-CSE-MsgGUID: oJSHhWhKTsaMU54EV5j+8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180747705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:53:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:53:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 07:53:09 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:53:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fw5fKGIccNpQ580ISE/K1rMgk3NghJWYGzJ8mOl/TkJUOXVdsxOg4W10NCtDXQmwynrY1UkDyXIfjzfBNO0nMwMu9H0V/IMly7Ms2Tp3cadsAZkjTzmyx4w8bRcly1ZcIFBeaVfFOTYTJcjNRri50FYRjPT1LcEcrBTWEWk30a/ZNUhkxLNMTMETPeUb9JmiXLqEdlxkNGEvNuDLDYFdRvJfOgUOIVhWNrImZ4/XlG78qsN/1RMHxqeKjcUOvjvj12evLzVNMhSIrpmxWOPn4Ju0JZitEz7pbnwiB29XtofFbs3DecPCIMDoTEiEhJddFXRLyms44B6DibA8hu3osA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V+9f7aVb3fCurWg1ri+MGv0cky4IoFOAJi+lCvkP1I=;
 b=DPPsIK54JbRWizUWYrggjDxpTPJNK0L+bAhaneB2VXUv/1OXwb1SC3DDM+cjDslB4PQjkEoTiV6E/dQDerzcYPc9kVNypeTSC7T6YYvmHG589iHIt3ZV7MMUqmsMh90hHBT57tGYXHiUotiA6D364KQlRr0O7+6QwVGioAc+a1/nv1u/WJxCnuzsVL1KcThWRw4VixQyfdDfydz73+vf+zjR47l2I+Qk7BIFRl5QrBsQFNkaTDI7cLPNCwWA76ViJvVxZ6KrOD14rIEczKh8lEZdvHIf6At1hxHt1FM+cmK08A7nMF0wWiYEN0VoZf4JOiecvNGNJvxNBh+k5Wm6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:53:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:53:07 +0000
Date: Thu, 9 Oct 2025 10:53:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Change return type of detect_bar2_dgfx()
 from s64 to u64
Message-ID: <aOfMT1zzARbUH2yb@intel.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
 <20251006201339.2603160-8-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251006201339.2603160-8-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR07CA0101.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::42) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: 49496ed3-05bb-4629-e2ea-08de07438e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xf2V0bDWMypkDoAM997Hra37EPJqdMs22/PYCJf8aij7fv0IO6s2FniZ5+w3?=
 =?us-ascii?Q?uKScxzFLgBWY3cXNAduc/9rdz2WeEJ7sLMet9dO1PjBkGwZEm2O/IXYiqyO1?=
 =?us-ascii?Q?bmq3L5naO9YYVKfgvkLDjxnqLTjFkOxFxA1bjYB6RIr95yujpiVmKbPFLNwX?=
 =?us-ascii?Q?qyWLXvGWS6Y17iXvVuqhNtuia0m1nXZ6e089AUULHEWPsymCo24Zqjr/Sday?=
 =?us-ascii?Q?OjGAraG7KXXj8A+BJnNfM6zgqL4eZewaabb9+T2QUWrZFCMWNfGad5vuCVQQ?=
 =?us-ascii?Q?8tcCM/vGTRAfFp8THL9WnFfXHfsfZBfpBTHCjmcQc3QUuLbcj1RKNiSP88f3?=
 =?us-ascii?Q?zIMZ9Y1mNcnHki3f26LSAK9LWEdCPIALcERo3mGNjaNcS2EoElNdeikxlSw8?=
 =?us-ascii?Q?T5ZBu9cjTJheYxCi/W1MLHxscaQ2QbVFMfwp8n5qmxnShWNm04HImpKsQPTe?=
 =?us-ascii?Q?uDFjSeVVNTYCu2ZZE3HASpvhTmdaEEpCvaxj7+bXiTwZzd2v4+/i9CPtVakg?=
 =?us-ascii?Q?Z7HKQVXXcuCeV8QIuIJTSgv6h2YXF83tWRIW9YoQgBJUNXF+0mOvFWSQV3G2?=
 =?us-ascii?Q?/RKuN7FXJGsviwW9tsYbvD0vU+GO8UzPCVRAvsVEmvSdBKzR42V4HmkKHcXn?=
 =?us-ascii?Q?g+0g+DS0nkRGFW9qOwgIVNHkXYgwNzmjdhM0pxaN2LwBk7Skp/V6NQ7KfnfC?=
 =?us-ascii?Q?N3mLGUcpxVY5FpnsYUDrkro6ku5TRJAO7Yv9LGpiA1fo03kBvDbr6jNUOhH3?=
 =?us-ascii?Q?bQvxKD5gxAgxREAOeJstOICKS8AwFj1lV7uyNb2xZ/kWhC7A7iInJZMjwMdN?=
 =?us-ascii?Q?Y3L1Dw+93nWGL4vGLyCMeGWcHb9BuNpzHo3nIaMPn8g5Lo/dLMpsMUG53WAJ?=
 =?us-ascii?Q?R6c08BiSfHe0QFm2XTempH7oS1iIOCrrzfopoK61O8cLtAVcDnFeLt+BvLL/?=
 =?us-ascii?Q?PVHX7CpLl78+V4mR6aHzgkHg7iy2TdE7PWixhKza85KzMrxwLNeDGdwT13MJ?=
 =?us-ascii?Q?QVOY6SE/HeRcOzGGgbhQBGHbXuFbRHiKO26bYBIFVhWH7FcTNhKr8zWDbl8P?=
 =?us-ascii?Q?vBBnGvZozDS92CH1xQ49LqKmJm8Uy3DLnEpPKqjQssL8FZXNEaN8EdLFxzAo?=
 =?us-ascii?Q?Tofk78s7EeMBsiGpMJ4LHf+w3ALToQ3FYEcLRb8Dldczyfjsyhi9/jIoDaP/?=
 =?us-ascii?Q?1Ax+0hjujmjmc65D6UcbioGMHB+mD6aRdy7SN3Pe9MlrE0jiR2idwFkfpuGh?=
 =?us-ascii?Q?QuoczoisRhPi7AVSrOh/wBdwK7y/fYOeniWLe8wLCDXWQDIr9wBwwGXA9CZe?=
 =?us-ascii?Q?eiBO6uGSumnExD62kAvWbh4JXHkQQk8GGvVcaaNooVVnis/YCjqeWA7UDjSm?=
 =?us-ascii?Q?sndKSN528pCGygLXM5magW53ihyV3CezGD2HCg0pD4O5MVfiM8XlAFIODu1y?=
 =?us-ascii?Q?8wfbiGYRBLngnlmJSDa1HazPG5uCaDfe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r0fFgoVBcbGQHs4Fb7B2klh1hEqQCkxpMQOqOK2fnHmZtU6uwdT61TPLV/yh?=
 =?us-ascii?Q?SXI+5i7T4TinJinkP38WvKrYzgQsbupIUqBTaIMl8LbKrp5cZpS/XOAcyg4x?=
 =?us-ascii?Q?xTh/piZP3imP5JyHp3/gnKQRGIryFv6OLmFjKYWxceI5d5nTeufPmVpHJIcl?=
 =?us-ascii?Q?8PBStDlyxNIbXe0GGj1vqifwt/nQMJ/TBjELFR+PIz+f4IoUfEhYAz1DMFvK?=
 =?us-ascii?Q?cx93fdzuOjisaJwLU0DgQ8q7NemcI6UKK35YUbyMlaGAsUz/cHocliRg0JHq?=
 =?us-ascii?Q?kUrYnnCWzbjWLAMrv1soZ4dHMBZliANMkxUMYECWdIAjObor1HoS9y6nkrZl?=
 =?us-ascii?Q?/KI4DsBbOAHsiYQIBfszuSC7z+XSj2MI90GGstSZ7dK5ly6LIwkMjRBYpZ0p?=
 =?us-ascii?Q?Uo0C9nwsIuS9jq7uD0U6g5In2Wx7ZIN8HY78FOFZCcTirN2CYhlKanKNHe5t?=
 =?us-ascii?Q?YkO8+i7cHDyavsrGOHGp/YNv7VFkNDXYBWCJ1kdjYi5IxaGR+b1MsinSZ09b?=
 =?us-ascii?Q?zb6BUtvkip5OyOFmcUwh7kRIKzh4t21upvFqo81HbeEzvTryIhddkWQLIPri?=
 =?us-ascii?Q?Kdspe1T2h5Yti1RR/FbA05vxTurZhKb96JKC7Xr+mRDCfh/OReJkkM+Bc4jP?=
 =?us-ascii?Q?SyfSuMrWaSGvkot+ZfTUqvkhmXkWPHLOtxQbUpdIXUZ8VcHBmIdOnHIpmqqZ?=
 =?us-ascii?Q?t9Kkx3tg+vxe31sGmDlsSGhIl99k9kX3homYE1niu7+sOb3jUcIAa5+GZ6e4?=
 =?us-ascii?Q?Z9UQEu68OcJv/Gjz18wt91KKJ0G2CL+UC0Lw9sHPZ9QL0z16f8nvtp3XXc7g?=
 =?us-ascii?Q?cXOzCLo2MRRZhdAZ7fnenNoZBqW9M6rYQRW3LdMWoLiWSIUue6PnclOAE2NV?=
 =?us-ascii?Q?Dvi9I/WawgfTXkb66C7oI2v4ArSJ3WSmJfhUUHjNPiXQrYQ4GUgbEESYgQ/Y?=
 =?us-ascii?Q?XzySk43SZqkeXSw8ixLdd8PiHl4odmT1E2vEaFUPCvb4QizrHOurw5jl3F46?=
 =?us-ascii?Q?sdn7gwZWm2NWlvTqQmS3ODr5smMBONKIlSzGM0f1vRWzRrAw88rLPDpveMtu?=
 =?us-ascii?Q?wwYoHr+jqSJSxTbaoyWXXLD6EIPxZCfWEuArbIJizzG0KU49HI/PNV1rejbd?=
 =?us-ascii?Q?KlU4KXtkwrSydByH2JljPlzSj6Dkpl6ddOKhBpzQiKv5LLxTqxAaNBOAZ8TE?=
 =?us-ascii?Q?s+9ubnyjyrC4FiLv9Pi3LIQDj2xsJgl1MMyrU4tJ1c1G8EBY26QOjaqrbdyF?=
 =?us-ascii?Q?YJd1tVJytZ+aQKe8HhpsyaP+gC4wnM+5Ei+J5WGpfOeGXEA8qURFhXlVMk1L?=
 =?us-ascii?Q?EZLtAjop9nCkdV27z4FUSA7xQKbwIPesb9ZJTN+wQMQAudsYwBzT0LfrQ/NW?=
 =?us-ascii?Q?O6/l0siDhLczCyhfP1zik5mG2Oj2E67MtDCtf3cU67RIeFGM7jWWfKF3q4KQ?=
 =?us-ascii?Q?UC2YlpRMXRI0s/WDrJidCJd7t94wjf0ktE02ZKAySbD4tNMsFyF8fIZQcAwJ?=
 =?us-ascii?Q?P4wbfAlTdThzY3Xhou62+CyNwx9l6tC7+JWOJNvaXpPsse/LJ+Cb5rMRDk6l?=
 =?us-ascii?Q?ZTPFK1JdsrJaQg0n4lnt1Tvm4tN0MAsPqFwYHkWPB1GhdJHeY2tBXvMaAjNj?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49496ed3-05bb-4629-e2ea-08de07438e79
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:53:07.0542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QR9yglQj0XM86RXlWgPRigRJDsPI/fnVvOBslb7AvO5O29kyBHAJSO9FpsQ0PmW1Gb0U4ODmOHxBCz9JpXORjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
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

On Mon, Oct 06, 2025 at 08:13:27PM +0000, Shuicheng Lin wrote:
> The function never returns a negative value, and the return value is
> assigned to a u64 variable. Use u64 for better type correctness
> and clarity.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 9b00bdc8ef1a..d8ded2400706 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -81,7 +81,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
>  	return wopcm_size;
>  }
>  
> -static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> +static u64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)

hmmm.... because stolen size is u64, this is right.

But looking to this function below, I'm wondering...

Although theoritical case, perhaps we should convert stolen_size to s64
and then fail if stolen_size -= wopcm_size took it to the negative side?

Lucas, Thomas, thoughts?

>  {
>  	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
>  	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
> -- 
> 2.49.0
> 
