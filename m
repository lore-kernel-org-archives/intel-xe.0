Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE0DC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 20:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3040C10E02E;
	Thu,  9 Nov 2023 20:27:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE7010E02E
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699561675; x=1731097675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BD1pD2vpU2mwqdVk1l7tS7vx2yaHceVB3SrJAq+OnVI=;
 b=N4hRAE0IGVrg1AXD6eFuAKFVMiSCZBzH4k+UiJ1PCUoj31UjdP6Xb2rr
 cvFNLjbnlavcauoIGD3zFt/UPf04Ev64nQZDpM2986DNEz3zNfPpopE5+
 wOKtunKV4edcnOv5rPmjRI2PD9UjGRV/YAUoxsMyBaxE2edHjXkUohya7
 0dBncgkAoVZTvamZDdPTzlDL2+3xgXlRk6QqNP13H46WicbRxSRtDkJ9E
 UA1OU6WhgezON13RjYAx8alG7mw7/KVPLMWapl1cWOORoS/JsuhaP6o2L
 y2Az4S9V4942IJ6fVVdcCIztC5G91GrRzHYajltwVc/v78mVUNPlN13Qa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="387230294"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="387230294"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 12:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792664502"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="792664502"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 12:27:54 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 12:27:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 12:27:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 12:27:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 12:27:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvPb1bEfF8R1xuTTl40IgZC7bo3K68J0k5Z/DLCSEa4VNYviVuFQ2KsrpkI/6POthV0FE1AEfXqevK8nt3qThuOo37AicOsJXRZiJUso7nwmhf8wh0bBQ/ZoG/BfgHQUJX2Oe7WJVENDxjcWt0IFca7yS/nP780oLEf0gdFLkFFEDhRm1c1VHaMvy3pnjIgwG39CuKKiM2TQMUQceDgBfJfaLvr+Uz+EvudMJtNKnUQopafA4oN8TSiuvKvxyx1gIZGM+DtQ+qI2aIgOCvWBHKdw9ZQV17p3A4bvjqTmNbBc9T+VNGkfr25+G8HEwznj9OQCpPtnIq6c7ffmU1cfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOLc/0BVHfsfsJDBzEA21cu6LHN408bhtS8rM5/CzOg=;
 b=i/2kedJw1pzFuKHrP1hVz2gXUkNbi+bTdOnkX/vkI//ks6ipXBJzqJmG4QzzSTJIIzNpMBrpO63FsNUgH3nNkz5AMJwCiRPRvcF6hL2T14esPjeMpX8o+RhR0V1kXWDcMe8aS5ryamB9GF8Hc8SJO5SyXfCwsv0dpEnp5ikUspgjXpGWaQq7PiumS2S81hxt+y4E5PJBrE/M1Tc4YY8PpWKDqHfoWvlLmnrBtLTGUXA/FjaT0PfBE0Xn8z0Ib3gFx2cdWZloaJ+MzbSjMtFEurDi3wvakUp3s7jl3z40xtFqK1d+BaiqiTr1uQ6Dem+NdoenJ5Wg93kQSX9Fpwtj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 20:27:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 20:27:50 +0000
Date: Thu, 9 Nov 2023 15:27:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZU1Aw5m2Xd0KSemc@intel.com>
References: <20231109194606.1835284-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231109194606.1835284-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4160f8-346b-407f-2dae-08dbe1625847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dc32IbjweQ5nBJT5SOWfsLKElHtvO4OjIIntT+NvIs9marIflEkgMZtzxkw8mr5oRInFn3PU76r5np9k3huPzXbLezsvsRJR01O5jjJYIGdJgEIR2vNEGvC0rdbvW+eMMPB77PyRYhzSP1tGC1Z3XShd3FTt/jq1Tx4ovxt515IYVNZ5+THeAvm712juvnNLZwPy6eJTYMKvJhhDhe+OJ+qpM+URxfzziJlR+/zBEE42eBRk6qLWyEgELZ9kmlj0kx8ovEi+r+aQJh3tg/nnGkecBKqXHmfWQWhEKrLmE6FvR/PISzpqwk1LVjV87i3T938xuZRv3WaINMEBFqALfIxt4Q85A66UVXykzzOBIjRYovvNepV3By59HwaeNRQcdAjJ0cbHMfE131IMttiehVdT/bwi+nquH55ZyAKmoZ1rNH92htgFAh/fQV4xPzrftjDAs+0MFRfNBOdbfbxSHLDLYvX8mwQ7WFxD/D0F9UJeIv/HgN9vpUgSOrubVzwu3zTdi9s5hYhnA/mMv0+FX8tnNCnUzYMySJFFE+EVuvvjPB/l/Hoh+17S38zFBmX4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(26005)(2616005)(83380400001)(6666004)(6512007)(6486002)(86362001)(6506007)(478600001)(38100700002)(44832011)(41300700001)(2906002)(5660300002)(316002)(66946007)(82960400001)(36756003)(8936002)(37006003)(66556008)(6862004)(8676002)(6636002)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2jHRsM4h9vJggw7luFCzGNdMDFEiXhy0H2GMcgpUmLyfGAgNJl5y2naaa9Mi?=
 =?us-ascii?Q?nvP8WseyPLT4sAbrD4l9gHFt7J1h1u+7uUGe6FjdNfIeqrpG3/wd4hKtABuY?=
 =?us-ascii?Q?9mVBiru1/dPt3yeR8VIjObgP37g3i21Mx5ApjrAkY5/EMluttdSj7hkmQQM/?=
 =?us-ascii?Q?XWe0qGHtbpbL88g2AOJ5Uc3WIbdDxA1yJXOVaGHGEXXS7pz71TNS8ALQcdbb?=
 =?us-ascii?Q?sN9TGVwURD5Ue65FDifZT2sCEVsfqh3Cz5IE/TpYQoh2x56S4Q9FtYYeoDgB?=
 =?us-ascii?Q?1l5yNbp0it/UEDBsquKS5OTrOjjAhUs/K/Z/TEBd0cGQDJl1WhDWGDzTi/u/?=
 =?us-ascii?Q?rsENc/kw/Hy7phcZaxDJc5SntbM0Xs1DXMPTDeZiW7TZvW78H9ln3NnR3HjB?=
 =?us-ascii?Q?dn7/UOsr2Eux7tCdBwrNYruR2J+elMK++dfaZVB+jh/mxJGj0v+uTI/pkk4U?=
 =?us-ascii?Q?6ByoGgZRz38jQSASBhcPgF5OHkroeRTZ5UG0zSnAmVr4oiuLscc5RkDAZdIz?=
 =?us-ascii?Q?i2+53Km0ikskcZruzssHCMARY9o1EkmLUNznH1OpV5y/Ec+KBAJQZKHxKXtn?=
 =?us-ascii?Q?AJl5nDWC5v5mEWJ1yWWIsn1D8QiCEssPxGO1g+rlCOcEQ68TrHeyhXVP6uVs?=
 =?us-ascii?Q?PwMYb57GCXqZ2lvhsZ6gzPj8li5n971RjTWbyDPNQyOHMng9EUn19Yr9iB2Y?=
 =?us-ascii?Q?fmQMMQd+CBGNCCPunCcu9o4F7rp+ytwBnvAxKfz8vXu0Bnhz3ElqLhQkXdPI?=
 =?us-ascii?Q?9zm0it5uLys3kzEd1ocQKhAlYf1/evf7mpbuj8jAxYlwQbyXjc2sUFhqahqs?=
 =?us-ascii?Q?SQjAIzwae0RqKhUNn2+zAY0Uh3Vh481HhtevIqw6GdvzeagS07jOomnhoLZM?=
 =?us-ascii?Q?iSZMsbEmaY/V+OL8XrJeh0uLKuym4chyoPnxh2ERCQ8xD/duqgG8lDOoq6vu?=
 =?us-ascii?Q?PdHsIeUwCyG3PNrXTLvE3us9OtwjKr3JFom5jg9KwdSLQe9o9CC4+2F9Xgt1?=
 =?us-ascii?Q?y72Db7x98Pv9o37qHJdBNOb7hyBQSb0BvHGQOOcIJYC0b0rGUIdLKtDFO8HV?=
 =?us-ascii?Q?74ZiB8jAyyB2QeKJNsYM6FOOGG4aCp+bnuS+VkddkOnf86ZGBOvuO5D0x1wd?=
 =?us-ascii?Q?BnWR5+jwzU8jnYcpenro+GmjDAf4o5OqZmF9UGt8LKxQ1wBLCr/abwFxHdhZ?=
 =?us-ascii?Q?4o490W73ukn9xZbp8HrPvGZev44rtwva/ogZuTEdE0xNOzdJILhlAInZjx3U?=
 =?us-ascii?Q?tLs7GCbKHNJisVBfyc4rcWJ7Wd6wAYCT3OHOGO+teR7dv8EnW0+3l4s+nlV1?=
 =?us-ascii?Q?vWWx14pXzH7IkVugRwhrtaVhTXkTTNMETZEDYXpWpkQ3aJDl1Ari6GJU8zjx?=
 =?us-ascii?Q?63hqWr8ueGiGV1g0BlRcwth7Yifp89T/PB1h6Ms4xNeFyIwgvzP4z05dWtCj?=
 =?us-ascii?Q?i3gFSJv92DNCHaZrqRzvbMUnDyauO2j4zubIOrl/LsgQqTT3MQpr6xh0vKWk?=
 =?us-ascii?Q?N2cZJ21uopKiYiompk+2nkwIHsaxCsq0oLq9nj8J2e3a9+9/Dr11+5lVBSfZ?=
 =?us-ascii?Q?eWskPZG7er9P5Y1kr0SvmOvxru7g69q+UdzcLXwX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4160f8-346b-407f-2dae-08dbe1625847
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 20:27:50.9178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeGuNcVzo9A6akUN16he+61O6d1jSWs5QhMWCdcno3LUthkhKuwR+DdmXlhdzsfRGXkyKaxCZN+4LjbaNjr+ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Drop EXECLIST_CONTROL from error
 state dump
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

On Thu, Nov 09, 2023 at 11:46:07AM -0800, Matt Roper wrote:
> EXECLIST_CONTROL ($enginebase + 0x550) is a write-only register; we
> shouldn't be trying to read or report it as part of the device error
> state.
> 
> Bspec: 45910, 60335
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 4 ----
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 2 --
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b5b084590888..e831e63c5e48 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -704,8 +704,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_execlist_sq_contents_hi =
>  		hw_engine_mmio_read32(hwe,
>  				      RING_EXECLIST_SQ_CONTENTS_HI(0));
> -	snapshot->reg.ring_execlist_control =
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0));
>  	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
>  	snapshot->reg.ring_head =
>  		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
> @@ -765,8 +763,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  		   snapshot->reg.ring_execlist_sq_contents_lo);
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
>  		   snapshot->reg.ring_execlist_sq_contents_hi);
> -	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
> -		   snapshot->reg.ring_execlist_control);
>  	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
>  	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
>  	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 5d4ee2904240..39908dec042a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -183,8 +183,6 @@ struct xe_hw_engine_snapshot {
>  		u32 ring_execlist_sq_contents_lo;
>  		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
>  		u32 ring_execlist_sq_contents_hi;
> -		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
> -		u32 ring_execlist_control;
>  		/** @ring_start: RING_START */
>  		u32 ring_start;
>  		/** @ring_head: RING_HEAD */
> -- 
> 2.41.0
> 
