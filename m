Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C12CE7F143
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E651F10E44B;
	Tue, 26 Sep 2023 22:42:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAD510E386;
 Tue, 26 Sep 2023 22:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695768131; x=1727304131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Il8F6rGMe7AUBmB3eDJCJpbseBBriqkbUsY9YWq57NI=;
 b=ADpNG3LFXou1SLwSSoYY32v36YNtuBytt4srC1o0yc+wgLC69X17Js65
 xP4xeaUZ18KIjHH96uNot5XXlzxYoSUvEtjPqBr3sG4b9VJhr9YDVjaVk
 ddQV84gyUbAmWMdNzUxJDNA7RUbaj0Ps5nGQO9H1B52PpnQ5vUbrrm0fN
 lKPifMfIorZc0jDmZQrHzErYpKgSaXCekbjz7S2+WzlGAivGrtbOVGyzj
 LNRt3YTbTd3mzeUTdhw9uKOXLuQUumIkFRsxC+NtyFAXQ3fZkt2qi7cSz
 ucF6qP0YknJAJ/L2pOhTFvg7aOedKsj0jv24qLWJRJjMcQYSDJjAemKHM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361063136"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361063136"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725588019"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="725588019"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 15:42:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:42:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:42:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 15:42:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 15:42:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndfAksAXyBC4v+mxf3xAeOjvUM+PRi/GDLoZcTXuBP2ChyOz9SZl7iGIUchx+vtdA+mQIR+WJQIaxUvjDkVQSDOOLkN6XJ5wA+kj7yYsnIfp9kznZ00tBK2NZEBrNei006XRwJILDz6376OAm5832mjmEUyyYkFDHx2P8D9y/iPGtEScQ5oGf3FngnMzd1/wfjM8EOResv/ATpK0EoSM6ySnXVDCLoVFUJpFTo08t13J20Yx7hRID3L+mLyGxZh4P1WwFTxWbS93ITrlUD5fWQlCxmSsIqWQyTnDtJoHuB+6rwkSZg0h46uAgtpS5K5VQCKVSjMM3d6Xx+Gs3ASVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4uizkyxmKwwo+4BqgacbQuY3xMBQfwzCJPCMA2NV/I=;
 b=ENobKCOmEDhIjpT9nwUDLIjHV1uNVX3ldkAbLikhuInNSoky1MQFf0RwCA/Uwr4oLzdTNEyjhtI2DgGj/9gcgWlZjWtc2sTCf91kY0e00FZBIvri2/u4OrQDIBjo7d03jLhoq9KVJRLcGtuJemLfnTMdHFrDe/u05qMFtAczkqLaWDR4bRJ3oUTfixbqER/9t/urmGaQzDqe6bKO75CLUxMa74xO/ycwRllNfgylmwf3ROpwb+xT4HCsFkFrWYPKCb/QHNn0fb0TJGR55AVCTnAZaYIJ9url7UrSWBXvWMYPsckebG4a/0nrXxIFmzvFsveeNZ+q9OvMqpkme415+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Tue, 26 Sep
 2023 22:42:01 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 22:42:01 +0000
Date: Tue, 26 Sep 2023 15:41:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926224159.GN2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec16c13-7487-4f07-aff4-08dbbee1ccd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: krB6HT7jlapyb4FDlhxn4oO+eU6K3+mEnGAE2jETZuWk/xRGgosyOcEmuBxjcWh1uPuNk8f12XVGfbtk2lyr9Qm1rCitl4A33by8U2dlhET9vj+VFZ5hzW2XNIwlU6a6QhcYs6NHkFAsTB7Xo6YLyJOThNUMkwERta+e2Applj1+qE+3Tr3P5jXrvEh9RxVm/lvaaPJ/tdtPneYfnXdR0rDavBhmA/E20MPY0R/HpPOwPADi9DBPOK2fU/WNAfV99GNtYHAda94YO44L0vsrm9vNa4li7foTRGTKPuJNqBONi/3o/dGj6xGBocLM6viV2qLpR8WekmRICFPIDvvgsE29/2VYycrbWV851B3r1eI0qRoykpsHTjXKbqMaKC5+7sJcEVvlSUWJzqZn6cfY+xrDCrwHqOEbFDrw5JxGx5n/Y4hl/91AWiHCQvfBabcWUX5QB2DPNVEIA0deo5HyNdWeSOA9l3uZE2EncI7TJXM4gtvxACpNxofi+HQ8qv21xwq4ORaZl60SV/HhFqa7hm2dVqHJ05WS6aS2+Zi9tqmKteBS6/sz9cbmzO5jRb31
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(478600001)(6486002)(8936002)(66476007)(66946007)(66556008)(8676002)(83380400001)(316002)(6636002)(66899024)(450100002)(5660300002)(33656002)(82960400001)(4326008)(86362001)(2906002)(1076003)(26005)(38100700002)(41300700001)(6862004)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgRDNsbp7dcLdQoLClnY2pp5iZqmAXifVBSCctcUG5EQqHCotYPDMtTjOpdO?=
 =?us-ascii?Q?bGLQLjOwMaW7uIQkQ9N5eqwnJsyoN6gas3tT1I50zelO9GsNmQeIWU5ugn71?=
 =?us-ascii?Q?9zXMpDMObkgtb2xkSr1zpZZ8WCMWDInXAUZkSRrroHaEFPQYJuYDLX8j60fQ?=
 =?us-ascii?Q?ky2e29gT3/sltBgDrktGBxvOepsagZSlA9SNQpA0vCgr7H12hHtf0crT0ziR?=
 =?us-ascii?Q?yi1zbEInJxTnlp0GHABYHrPI10BmI1XsvSK5voG3kXB7Fy/Ns6zTmSSdBUXN?=
 =?us-ascii?Q?Pn1AG5res+h+1PtlRiLQNBVBo5iYCVvDV1iKIsAQnJaD/xDxeNiJDOVr6oGm?=
 =?us-ascii?Q?H+wtnUvkJtqdnDo1eS3ETvndAq4xrDLH6OFQHuXf6H9a1CJs2KKz7QrJskPK?=
 =?us-ascii?Q?Q9gGUrEgyFVUXAU/09ENB2IlWX3BfxRFKC+1DmUXrAc44G+qmEmx3nBDUnUA?=
 =?us-ascii?Q?ZEMBRJY5cOkFl0boxU529hPgeyBcfzXdJTKr2NVidT9/M4h3YhJ1PnUbyFp6?=
 =?us-ascii?Q?U5nBZhzfNc0yy+fzREKokjiJzOdo057EwNHhsD2/lj2twczkICaIdRImntxf?=
 =?us-ascii?Q?L4wfI9I7+r2DDWOfu/yf9/AIQCDHB1sfj6GuizcZDAAw/HZyUlJr/C0cCo1O?=
 =?us-ascii?Q?G589vFYU/ZVnKijiXVutZojvPzdBV75mDENRe+5If21LbgOSk6x/urKAbWOM?=
 =?us-ascii?Q?qzm6iyCymqAdDfQ8J7Y0LxvaM7sH7VAqg3Y9Nae8xiBHkhUDQ+jEMt9FMa2y?=
 =?us-ascii?Q?Ml9JhXkvusCn09s7d9x7DpgdPuGYgjGBXy9RVzX/Bu/svTd1+HBDXDaAMSwp?=
 =?us-ascii?Q?myT9rF+zY2WIf3GFJ7exFV1U9Pvz9zGsD/YuhrocgN5pl5LmZ/7RfwkXQzJ0?=
 =?us-ascii?Q?dE1TNI06Tnb9pBuw8sEp7/YvVeqryM7h2geRQvsMgsVlLas684/5XUPmceXf?=
 =?us-ascii?Q?AGG1R0hrHIp+PuBsmbLjBUzIlP67wTBBIWcq2epIbehB35eUV+DbC48W0pfN?=
 =?us-ascii?Q?R9vK0FWLPBpwwbf2CWbrg1IhAcm+qAdsU7wWYjpC0z5rnFSHdQX66CToPzf4?=
 =?us-ascii?Q?wKlO595tY4GTQO6TpIRLFaXQb19RqLK1IzSSEn87rwQHT/dPPUh/taMaI/uz?=
 =?us-ascii?Q?976fyMQ+EG+rgFOu1IKJIGwzpyuKLI84iHjnoKolvfWQXGIWPzgVZvWt8eef?=
 =?us-ascii?Q?tEKEZ2ku7siBuZuKzqO28pcsx9WSp/rvrLvKlsyPaFMa6a28t+apj4juOWcp?=
 =?us-ascii?Q?Rwil1giqnvI/uIWHpKETFVOsXLgyOZR2/AWiuhpj2epsojH3k4lKZ0D1a55d?=
 =?us-ascii?Q?KAKdY0D/psE8W5yVhKDET7dAKS49r6XM9QGmDyK02rul4YR2LzdYSt2VwVGL?=
 =?us-ascii?Q?R9zQMeWaVfgU8adpH8HpTN5A9eZWvBomocy+r4k6U3dLuGQI8s/j80PSeLVx?=
 =?us-ascii?Q?/yEQtatEx1aiJebvkGlQrKIQFm7zSTSRC4tDDdQUzueaWElu0rNNK0Hcn9C4?=
 =?us-ascii?Q?rRN0/iAX6N9ilxtpPYANKm7QaR04qWlgwj7DfaCNo4C2auXdc387SDervUi9?=
 =?us-ascii?Q?Vdrcmr2Qe4ctd22+kUn5RGUxqVZ3nXIWq11eTMR/bBnRf8GsR3ZdhqMWCl1K?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec16c13-7487-4f07-aff4-08dbbee1ccd7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 22:42:01.8013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+Y0zzyeGTYvY6AHaeOMIXLDRoH+Lj9S6W9HR8kSO2qu0T8tD7EtbE3As4vEZFLZ88cZY8hCPRhvTqA03CSU9DKuoKPM2f4Xdd/znn6vkMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 07/14] lib/intel_mocs: Stop encoding
 mocs
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:39AM -0700, Lucas De Marchi wrote:
> From gen9 until xe2, the various gpu commands use a mocs object that is
> defined as
> 
> 	[0]   pad

Might be more accurate to say "pxp" here since that's how it's actually
being used in the code.

> 	[6:1] mocs index
> 
> However this is not true for xe2 anymore. Also the way it is coded right
> now it's very easy to double shift the mocs value and end up with the
> wrong setting. Avoid this by separating where the index should be used
> (intel_mocs.[ch]) and the encoding on the various commands. To help with
> clarity the following renames were done:
> 
> 	intel_get_wb_mocs() -> intel_get_wb_mocs_index()
> 	intel_get_uc_mocs() -> intel_get_uc_mocs_index()
> 	gen9_surface_state.*.memory_object_control
> 		 -> gen9_surface_state.*.mocs_index
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/gen9_media.h                |  5 +++--
>  lib/gen9_render.h               |  3 ++-
>  lib/gpu_cmds.c                  | 14 +++++++-------
>  lib/igt_draw.c                  |  4 +++-
>  lib/igt_fb.c                    |  5 +++--
>  lib/intel_blt.c                 | 22 +++++++++++++---------
>  lib/intel_mocs.c                | 14 ++++++--------
>  lib/intel_mocs.h                |  4 ++--
>  lib/intel_reg.h                 |  3 ++-
>  lib/rendercopy_gen9.c           | 12 ++++++------
>  lib/xehp_media.h                |  3 ++-
>  tests/intel/gem_ccs.c           |  6 +++---
>  tests/intel/gem_lmem_swapping.c |  4 ++--
>  tests/intel/xe_ccs.c            |  6 +++---
>  14 files changed, 57 insertions(+), 48 deletions(-)
> 
> diff --git a/lib/gen9_media.h b/lib/gen9_media.h
> index 414001dfd..d66004701 100644
> --- a/lib/gen9_media.h
> +++ b/lib/gen9_media.h
> @@ -43,9 +43,10 @@ struct gen9_surface_state
>  
>  	struct {
>  		uint32_t qpitch:15;
> -		uint32_t pad1:4;
> +		uint32_t pad2:4;
>  		uint32_t base_mip_level:5;
> -		uint32_t memory_object_control:7;
> +		uint32_t pad1:1;
> +		uint32_t mocs_index:6;
>  		uint32_t pad0:1;
>  	} ss1;
>  
> diff --git a/lib/gen9_render.h b/lib/gen9_render.h
> index af3a2b3af..8ed60a2a5 100644
> --- a/lib/gen9_render.h
> +++ b/lib/gen9_render.h
> @@ -42,7 +42,8 @@ struct gen9_surface_state {
>  		uint32_t qpitch:15;
>  		uint32_t pad1:4;
>  		uint32_t base_mip_level:5;
> -		uint32_t memory_object_control:7;
> +		uint32_t pxp:1;
> +		uint32_t mocs_index:6;
>  		uint32_t pad0:1;
>  	} ss1;
>  
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 61b18d20d..ac2076423 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -215,9 +215,9 @@ gen9_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
>  	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> @@ -276,9 +276,9 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
>  
>  	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> @@ -295,7 +295,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss9.base_addr_hi = address >> 32;
>  
>  	if (is_dst) {
> -		ss->ss1.memory_object_control = 2;
> +		ss->ss1.mocs_index = 1;

This is an accurate conversion of the existing code, but it doesn't seem
like there should be a magic number here.  Looks like this originates
from

        commit c4b2b2f07fe8231afb8514fab19218dec95d562d
        Author:     Tony Ye <tony.ye@intel.com>
        AuthorDate: Tue Nov 13 14:36:28 2018 +0000
        Commit:     Tvrtko Ursulin <tvrtko.ursulin@intel.com>
        CommitDate: Tue Feb 5 12:23:09 2019 +0000

            tests/gem_media_vme: Simple test to exercise the VME block

with no real explanation.

Since this is a gen11 function, I guess we could probably switch this
to I915_MOCS_PTE to try to match the presumed intent here.

>  		ss->ss2.height = 1;
>  		ss->ss2.width  = 95;
>  		ss->ss3.pitch  = 0;
> @@ -909,9 +909,9 @@ xehp_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
>  	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 476778a13..d7c3ac64c 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -676,6 +676,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  	uint32_t devid = intel_get_drm_devid(fd);
>  	int ver = intel_display_ver(devid);
>  	int pitch;
> +	uint32_t mocs;
>  
>  	dst = create_buf(fd, cmd_data->bops, buf, tiling);
>  	ibb = intel_bb_create(fd, PAGE_SIZE);
> @@ -715,9 +716,10 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  		}
>  
>  		pitch = tiling ? buf->stride / 4 : buf->stride;
> +		mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>  
>  		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
> -		intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | (pitch-1));
> +		intel_bb_out(ibb, blt_cmd_tiling | mocs | (pitch-1));
>  		intel_bb_out(ibb, (rect->y << 16) | rect->x);
>  		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
>  		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 4b592825d..722996779 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2750,7 +2750,7 @@ static void copy_with_engine(struct fb_blit_upload *blit,
>  static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  					   uint32_t plane, uint32_t memregion)
>  {
> -	uint32_t name, handle;
> +	uint32_t name, handle, mocs;
>  	struct blt_copy_object *blt;
>  	enum blt_tiling_type blt_tile;
>  	uint64_t stride;
> @@ -2763,9 +2763,10 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  
>  	blt_tile = fb_tile_to_blt_tile(fb->modifier);
>  	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
> +	mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>  
>  	blt_set_object(blt, handle, fb->size, memregion,
> -		       intel_get_uc_mocs(fb->fd),
> +		       mocs,

Doesn't this function expect just the (non-shifted) index?  If so, we
shouldn't shift by XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT above.

>  		       blt_tile,
>  		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
>  		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 429511920..9f8e3dea3 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -58,7 +58,8 @@ struct gen12_block_copy_data {
>  	struct {
>  		uint32_t dst_pitch:			BITRANGE(0, 17);
>  		uint32_t dst_aux_mode:			BITRANGE(18, 20);
> -		uint32_t dst_mocs:			BITRANGE(21, 27);
> +		uint32_t pad:				BITRANGE(21, 21);
> +		uint32_t dst_mocs:			BITRANGE(22, 27);

Should we also rename all these dst_mocs and src_mocs with "_index" too
as you've done elsewhere?  Or will that cause too much churn?

>  		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
>  		uint32_t dst_compression:		BITRANGE(29, 29);
>  		uint32_t dst_tiling:			BITRANGE(30, 31);
> @@ -98,7 +99,8 @@ struct gen12_block_copy_data {
>  	struct {
>  		uint32_t src_pitch:			BITRANGE(0, 17);
>  		uint32_t src_aux_mode:			BITRANGE(18, 20);
> -		uint32_t src_mocs:			BITRANGE(21, 27);
> +		uint32_t pad:				BITRANGE(21, 21);
> +		uint32_t src_mocs:			BITRANGE(22, 27);
>  		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
>  		uint32_t src_compression:		BITRANGE(29, 29);
>  		uint32_t src_tiling:			BITRANGE(30, 31);
> @@ -628,7 +630,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>  		 cmd[0],
>  		 data->dw00.client, data->dw00.opcode, data->dw00.color_depth,
>  		 data->dw00.special_mode, data->dw00.length);
> -	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs: %d, compr: %d, "
> +	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>  		 "tiling: %d, ctrl surf type: %d>\n",
>  		 cmd[1], data->dw01.dst_pitch, data->dw01.dst_aux_mode,
>  		 data->dw01.dst_mocs, data->dw01.dst_compression,
> @@ -646,7 +648,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>  		 data->dw06.dst_target_memory);
>  	igt_info(" dw07: [%08x] src geom <x1: %d, y1: %d>\n",
>  		 cmd[7], data->dw07.src_x1, data->dw07.src_y1);
> -	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs: %d, compr: %d, "
> +	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>  		 "tiling: %d, ctrl surf type: %d>\n",
>  		 cmd[8], data->dw08.src_pitch, data->dw08.src_aux_mode,
>  		 data->dw08.src_mocs, data->dw08.src_compression,
> @@ -914,7 +916,8 @@ struct gen12_ctrl_surf_copy_data {
>  
>  	struct {
>  		uint32_t src_address_hi:		BITRANGE(0, 24);
> -		uint32_t src_mocs:			BITRANGE(25, 31);
> +		uint32_t pad:				BITRANGE(25, 25);
> +		uint32_t src_mocs:			BITRANGE(26, 31);
>  	} dw02;
>  
>  	struct {
> @@ -923,7 +926,8 @@ struct gen12_ctrl_surf_copy_data {
>  
>  	struct {
>  		uint32_t dst_address_hi:		BITRANGE(0, 24);
> -		uint32_t dst_mocs:			BITRANGE(25, 31);
> +		uint32_t pad:				BITRANGE(25, 25);
> +		uint32_t dst_mocs:			BITRANGE(26, 31);
>  	} dw04;
>  };
>  
> @@ -940,11 +944,11 @@ static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
>  		 data->dw00.size_of_ctrl_copy, data->dw00.length);
>  	igt_info(" dw01: [%08x] src offset lo (0x%x)\n",
>  		 cmd[1], data->dw01.src_address_lo);
> -	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs: %u\n",
> +	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs idx: %u\n",
>  		 cmd[2], data->dw02.src_address_hi, data->dw02.src_mocs);
>  	igt_info(" dw03: [%08x] dst offset lo (0x%x)\n",
>  		 cmd[3], data->dw03.dst_address_lo);
> -	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs: %u\n",
> +	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs idx: %u\n",
>  		 cmd[4], data->dw04.dst_address_hi, data->dw04.dst_mocs);
>  }
>  
> @@ -1557,7 +1561,7 @@ void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
>  void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>  {
>  	igt_info("[%s]\n", info);
> -	igt_info("surface <handle: %u, size: %llx, region: %x, mocs: %x>\n",
> +	igt_info("surface <handle: %u, size: %llx, region: %x, mocs_idx: %x>\n",
>  		 obj->handle, (long long) obj->size, obj->region, obj->mocs);
>  	igt_info("        <tiling: %s, compression: %u, compression type: %d>\n",
>  		 blt_tiling_name(obj->tiling), obj->compression, obj->compression_type);
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index cf3b8e4fe..6a4ec25e4 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -51,22 +51,20 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>  	}
>  }
>  
> -/* BitField [6:1] represents index to MOCS Tables
> - * BitField [0] represents Encryption/Decryption
> - */
> -
> -uint8_t intel_get_wb_mocs(int fd)
> +uint8_t intel_get_wb_mocs_index(int fd)
>  {
>  	struct drm_intel_mocs_index mocs;
>  
>  	get_mocs_index(fd, &mocs);
> -	return mocs.wb_index << 1;
> +
> +	return mocs.wb_index;
>  }
>  
> -uint8_t intel_get_uc_mocs(int fd)
> +uint8_t intel_get_uc_mocs_index(int fd)
>  {
>  	struct drm_intel_mocs_index mocs;
>  
>  	get_mocs_index(fd, &mocs);
> -	return mocs.uc_index << 1;
> +
> +	return mocs.uc_index;
>  }
> diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
> index 255eac0ff..278f143ec 100644
> --- a/lib/intel_mocs.h
> +++ b/lib/intel_mocs.h
> @@ -6,7 +6,7 @@
>  #ifndef _INTEL_MOCS_H
>  #define _INTEL_MOCS_H
>  
> -uint8_t intel_get_wb_mocs(int fd);
> -uint8_t intel_get_uc_mocs(int fd);
> +uint8_t intel_get_wb_mocs_index(int fd);
> +uint8_t intel_get_uc_mocs_index(int fd);
>  
>  #endif /* _INTEL_MOCS_H */
> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index 3bf3676dc..f97154d2b 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2562,7 +2562,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  #define XY_MONO_SRC_BLT_WRITE_ALPHA	(1<<21)
>  #define XY_MONO_SRC_BLT_WRITE_RGB	(1<<20)
>  
> -#define XY_FAST_COLOR_BLT		((0x2<<29)|(0x44<<22)|0xe)
> +#define XY_FAST_COLOR_BLT				((0x2<<29)|(0x44<<22)|0xe)
> +#define   XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT		22

Not a problem with your patch, but I'm surprised to see GPU instructions
defined in intel_reg.h...   Seems like the code has been organized that
way since 2009 and nobody has ever reorganized it.  :-(

>  
>  #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
>  /* dword 0 */
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index b8959d073..6c410e8a8 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -138,7 +138,7 @@ static const uint32_t gen12p71_render_copy[][4] = {
>  
>  /* Mostly copy+paste from gen6, except height, width, pitch moved */
>  static uint32_t
> -gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> +gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  	      bool fast_clear) {
>  	struct gen9_surface_state *ss;
>  	uint32_t write_domain, read_domain;
> @@ -173,11 +173,11 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  		/*
>  		 * mocs table version 1 index 3 groub wb use l3
>  		 */
> -		ss->ss1.memory_object_control = 3 << 1;
> +		ss->ss1.mocs_index= 3;

Minor spacing glitch.

>  		ss->ss5.mip_tail_start_lod = 0;
>  	} else {
>  		ss->ss0.render_cache_read_write = 1;
> -		ss->ss1.memory_object_control = intel_get_uc_mocs(i915);
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
>  		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
>  	}
>  
> @@ -187,7 +187,7 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  		ss->ss0.tiled_mode = 3;
>  
>  	if (intel_buf_pxp(buf))
> -		ss->ss1.memory_object_control |= 1;
> +		ss->ss1.pxp = 1;
>  
>  	if (buf->tiling == I915_TILING_Yf)
>  		ss->ss5.trmode = 1;
> @@ -282,10 +282,10 @@ gen8_bind_surfaces(struct intel_bb *ibb,
>  	binding_table = intel_bb_ptr_align(ibb, 32);
>  	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
>  
> -	binding_table[0] = gen8_bind_buf(ibb, dst, 1, fast_clear);
> +	binding_table[0] = gen9_bind_buf(ibb, dst, 1, fast_clear);
>  
>  	if (src != NULL)
> -		binding_table[1] = gen8_bind_buf(ibb, src, 0, false);
> +		binding_table[1] = gen9_bind_buf(ibb, src, 0, false);
>  
>  	return binding_table_offset;
>  }
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index 65a72d950..087eb2ec0 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -109,7 +109,8 @@ struct xehp_surface_state {
>  		uint32_t double_fetch_disable: BITRANGE(17, 17);
>  		uint32_t corner_texel_mode: BITRANGE(18, 18);
>  		uint32_t base_mip_level: BITRANGE(19, 23);
> -		uint32_t memory_object_control: BITRANGE(24, 30);
> +		uint32_t pad1: BITRANGE(24, 24);

Should we name this 'pxp' to match the name used in gen9_surface_state?


Matt

> +		uint32_t mocs_index: BITRANGE(25, 30);
>  		uint32_t unorm_path_in_color_pipe: BITRANGE(31, 31);
>  	} ss1;
>  
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index f5d4ab359..f869e98aa 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -100,7 +100,7 @@ static void surf_copy(int i915,
>  	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
>  	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
>  	uint32_t *ccscopy;
> -	uint8_t uc_mocs = intel_get_uc_mocs(i915);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>  	int result;
>  
>  	igt_assert(mid->compression);
> @@ -323,7 +323,7 @@ static void block_copy(int i915,
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
>  	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> -	uint8_t uc_mocs = intel_get_uc_mocs(i915);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>  	int result;
>  
>  	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> @@ -439,7 +439,7 @@ static void block_multicopy(int i915,
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
>  	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> -	uint8_t uc_mocs = intel_get_uc_mocs(i915);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>  	int result;
>  
>  	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> index ede545c92..2e0ba0793 100644
> --- a/tests/intel/gem_lmem_swapping.c
> +++ b/tests/intel/gem_lmem_swapping.c
> @@ -486,7 +486,7 @@ static void __do_evict(int i915,
>  				   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
>  		blt_set_object(tmp, tmp->handle, params->size.max,
>  			       INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
> -			       intel_get_uc_mocs(i915), T_LINEAR,
> +			       intel_get_uc_mocs_index(i915), T_LINEAR,
>  			       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
>  		blt_set_geom(tmp, stride, 0, 0, width, height, 0, 0);
>  	}
> @@ -516,7 +516,7 @@ static void __do_evict(int i915,
>  			obj->blt_obj = calloc(1, sizeof(*obj->blt_obj));
>  			igt_assert(obj->blt_obj);
>  			blt_set_object(obj->blt_obj, obj->handle, obj->size, region_id,
> -				       intel_get_uc_mocs(i915), T_LINEAR,
> +				       intel_get_uc_mocs_index(i915), T_LINEAR,
>  				       COMPRESSION_ENABLED, COMPRESSION_TYPE_3D);
>  			blt_set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
>  			init_object_ccs(i915, obj, tmp, rand(), blt_ctx,
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 20bbc4448..27ac51380 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -96,7 +96,7 @@ static void surf_copy(int xe,
>  	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
>  	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
>  	uint32_t *ccscopy;
> -	uint8_t uc_mocs = intel_get_uc_mocs(xe);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>  	uint32_t sysmem = system_memory(xe);
>  	int result;
>  
> @@ -294,7 +294,7 @@ static void block_copy(int xe,
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
>  	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> -	uint8_t uc_mocs = intel_get_uc_mocs(xe);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>  	int result;
>  
>  	bb = xe_bo_create_flags(xe, 0, bb_size, region1);
> @@ -415,7 +415,7 @@ static void block_multicopy(int xe,
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
>  	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> -	uint8_t uc_mocs = intel_get_uc_mocs(xe);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>  	int result;
>  
>  	bb = xe_bo_create_flags(xe, 0, bb_size, region1);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
