Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EE1C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 17:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944110E9B3;
	Wed, 22 Mar 2023 17:07:53 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B47D10E9B1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 17:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679504870; x=1711040870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=90GpaAxG0+chOaigDlkN6TyCOQNfJO+Fw/CUysnhA7Y=;
 b=Nt+i1SB5FwRz8qX1tpnSU9ygIHkhssCsi+5zddvIXG+zqXmrSYC0zMOh
 G3uPj7YCwFSu0qjWRtGTQXdMawShsmawfFvGLX2iYnwot4CRUOwtCGCN6
 gfOkyZHCKLKQbXP9en0IAD7yLZ4zkgVn1wYiFiBgo4zPpGOuRoaL4bFg+
 nAHmml2JU08G8OVs4aOdBFKmcjvmKlxurcokFevtyhDW/l9XyacdG2KNq
 p+01mjCZXn0VDGotpkj7FhAh2ax8QWXf2Gxsr1Bl9yAY2KsenmI4jjhXf
 WgibURDq/wnT0vQy2vLSEbI2X8OqpiK8zxpzMUnIB6E/6jaimUGmvTxf9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327655255"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="327655255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 10:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="771120867"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="771120867"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2023 10:07:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 10:07:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 10:07:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 10:07:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 10:07:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sd+gxD8D0J+Zss+uLs7uju6oKmkSLe1zxabi6ldnNvPfsaYGFWWu/upmCjlivpvxjAe2UiroMDX5CyGdR2A6c5yTjEmzNOJOp6O7KV52Yght8M/KhZ7wLp43tU+eZGSH0jZrwOTT5rDpW2iwL4HL7IQGPRm9Rrm4hGi9uTN7LlTiFC47WHp7k20a+DJYDEEH7abvR2uluVYWCpQ6pkbLuOrqGxQZqIkw6yBZ5hVKZCr1ormS3pqqgvjbtStvTsObXZHXgJm+GG4AoeklVosd82D6kVZkugYXOSCTd4higIqM2d2B6gnnGSgymwx6bu3IWtmJKIhrsHv5zBZCwKrmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUEdi1rw9HhImX3pCqU69M33qM9hG0I3coTWTWH8NNM=;
 b=NdDGu2cfG2Tt62JOU6EWqM7ApkNvpT0ZYmjAcUgVEZOGMafYr7JaKNw77PrpNxQ1RmdyhJb5HhOW+YHPTIovKNFExnw2NIdvX8/Ud1Ka35NS7QfExM+JhzIkACqOzW7KnD6oGaZXmAioTm3GmG1/aW0b/sobafs9CsTAFLkqXhNsTxKh4zP/i06bNQ+852VJxnCI3kOOZe1ngS1wAnT3A5Mp8G/6eNzeKR+cwsxbTu3EK85oxcEXOTH5l/xASmc2xoAwJUbO4MOgy9CuMYnZeBPlU/e+bZ/iZyYXKsX1aGeyFbWr8jTwIkHKE4L5VY5Jsk+qonnod/p4UWO/JGJ6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 17:07:46 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 17:07:46 +0000
Date: Wed, 22 Mar 2023 10:07:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230322170743.GY4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230322013439.789634-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230322013439.789634-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:332::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 897af32d-dccf-4c76-ecb6-08db2af7f52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2Or9pgEoy00tvS5Ch4BWotQMDi/rwCMBnq7R3PH21sUx9oOrW/BnJbqLbOKZ4fvLB55gmz5j1VF9LO8gzqlLwYwDhHpyQI4u+ArWTzNqpa8IE7bnIOvC983ORp919jdqNHkXFiFEtISu+umjP9YwCNg55bw17YIvKqayZx+2r0lIHH8jSJdkx2xfSHmDXaWUWjmAokHzzSaVDfjFGW5psWciEft5aQx0IT1t12504r4Uf1M0fev2Ls015Usvixn6b0QV+EfqhGxMrWqoGkaedkP5pvZ2KOMZmiqcQ0pR9v/6el9Uo1LxIqdyJualNREzIDzYQ95k0XWYQOPXWQn+8dH5v0FtFHo6gv2TKIjh5MpBCsEtDSo7vBs2BIcadOgF8QKG2p5eTaCZZKclwfPKZx7hHQ5JvCzDBLsL8g1ELCWgM7AS+2dQu+BP0oGI245c35nEFNsFFOMhw7dnCXG9/fbzkLN7utcsumcT4rWkkBLGTlqrVq9AUb6KNtbEcZFctR+Y9XP1GuRzIHpzhI6J2F3N/F6Yi1tctVXMpQ9APQ/XAOYo5HqJwv5KHzQpG6w1B2ibwY1tG/+7B5sCvCS2rNT/9odRRGZdWaXgNQVSIMxfXFvHZQFFF5aRz068tzs7AeNN7ovuPdcU06XakD38g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199018)(186003)(6666004)(478600001)(6486002)(83380400001)(6512007)(6506007)(1076003)(6636002)(316002)(66476007)(66946007)(66556008)(8676002)(4326008)(8936002)(41300700001)(5660300002)(6862004)(38100700002)(26005)(2906002)(82960400001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ByygyjXK5E7cnBB39IKSEmvAkLomqfI6ezxFldVWClQH1PodrUuTo8eFhRO4?=
 =?us-ascii?Q?LMWBwzCwXBZzgWvk+IyZEaEDXAtrsKzl043hohg76nXHagv09wLK97ue8f4n?=
 =?us-ascii?Q?RTm87EEcSi2QjrlJCocHnTaP7/D5wr4jjSnZybjGwXtI1xfhUyv8h1DMQ3qU?=
 =?us-ascii?Q?z9F7JYcXF/9dUkpYMqvBF6CHX8N2F4t3eRnqjnXV6+m24yZsuzmPU9OLG1Vz?=
 =?us-ascii?Q?K2AulPIIKXKzWkOoDccEcQsyDD2/cN3Qn79nK/ddlzddhIThzxH1NRarubWp?=
 =?us-ascii?Q?GMUTVHPoG457d+voOaPMLMBg5Gc7PU5+5KmwexfQP5QB1oHYtjZsBvl4Tc72?=
 =?us-ascii?Q?bb3yk5unePsQ2Dz/xJKDJNO2SZCXElK0Coc104mJ+Y5NmvfJaDYGQkuZl1lm?=
 =?us-ascii?Q?UVABOtauJnjq7+HC2KZaCpisCVanZjs1+JM7CcVHnXON6w/KbDBfJ2Bu/jNB?=
 =?us-ascii?Q?LSNo3KpWswk0YdlEkEC9L0iZNv0ov4z/Q95KaByXtezSR9wtruUBlLlxqQLx?=
 =?us-ascii?Q?dSgB12uZNzgUlSA5gnWyRDSjZQuiRZW+Hvbu7dErtk1MKVhfWGM7rGe56hfr?=
 =?us-ascii?Q?w5Mvhrh/KtZJzYcRvbYEay7MMsy2xO2VwO7AYMP1ddC2y7AafVAPpGDGRk1j?=
 =?us-ascii?Q?mW6ADfrnCHtyDubz9wLgVvX42o2XDYpGH3VyoWusesJXkWKh95w/ruMCd71v?=
 =?us-ascii?Q?6AUWeYi/Y5L/05svPOkK0b7+BfHGsHVC5P5s6duekmzJvyDiY7vtbdlpkn/C?=
 =?us-ascii?Q?pmNshDbI4rlxdy36CbCuWlCNyo/QLsyeRMqSLoCRu18b+RXMnQ9DVyCo3v5r?=
 =?us-ascii?Q?z/vxDTiW8Gl1lYi1G/7S7trumQKNMgFFwTRL6IqoIDujyagdfWWDnD5HDM3K?=
 =?us-ascii?Q?+PfLBN/FrLlPUiwxu2cRSqoVjI3xZNvMkXuXzDtKI3wsE7DEjIB7gQO6efkz?=
 =?us-ascii?Q?xx3c3LAielH8MUC6i7KLO4WZVNJvxloKZb2IpO4OkcduoQycrdjYFR1C/JTn?=
 =?us-ascii?Q?0Au9MZf0NYq9LdO7qMYCkt1VcPAtpPyVSjTO9/8v77iuZBNS3dZPsIn88yLa?=
 =?us-ascii?Q?s4j7whKkLzbM/ZGIrlKrv6Hu+cYnAb7P14KJoKJ/LZhmZBve4YN1JEUbvpMC?=
 =?us-ascii?Q?C8FWAvT+7TiKZkBLoON/7tTZK9ZFvUu8+hjvggtBe/RwXGb2wxwmxBExiOIb?=
 =?us-ascii?Q?eeA+eW4jFuyOcu20nawmxLcCUpw/2XHwLn4u8n88cD3SQEG07xOVb/mVTQQ5?=
 =?us-ascii?Q?Mbbj3Aoc3WghGvCunlqTtWmnxxmPBbTMLGKoPR/UoNuq19dLE2Lj0a+JOVz3?=
 =?us-ascii?Q?r/lKNr0u6H6YHYXZaYM6E5UNiB9by4rWATNtZqR3b3oB0o+6AqslVBeZGKZb?=
 =?us-ascii?Q?kc4LOyFCQ3LYqyUv5pYQ2SAXit35d0/vzU5HWl6K+i6JsGepeHIo6s/wDdrf?=
 =?us-ascii?Q?7qhnZ0N4+QL6asazuRC52gE4uY10S0veuiEnj3BKQPR4asgwHsrS2nbGy3rG?=
 =?us-ascii?Q?YD1VaSvTh0OXQMKqa0oUJ0LgFPY1BPM8+7HzBZBPtRZPDwmV3MHkdfYSeZHx?=
 =?us-ascii?Q?6S+X77aQyhg906f39bI9CbnqVUiwfy2iSwdwErVdMbdFTNwUsQ/ODz9ctmii?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 897af32d-dccf-4c76-ecb6-08db2af7f52b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 17:07:46.3673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrhQRcbTRDfDS53yYwBNyG3mfL8DkR2ObTx0j4segpYTIhZ6/NclqcW+KeYf5N0bAKdd6F2zfowsSgWUiI8n8LTR+2P0MHlu44h8ZdWQU2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Reinstate render / compute cache
 invalidation in ring ops
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

On Tue, Mar 21, 2023 at 06:34:39PM -0700, Matthew Brost wrote:
> Render / compute engines have additional caches (not just TLBs) that
> need to be invalidated each batch, reinstate these invalidations in ring
> ops.
> 
> v2: Rebase for CI
> v3: Add missing changes to xe_gpu_commands.h
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  5 ++++
>  drivers/gpu/drm/xe/xe_ring_ops.c          | 30 +++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index e60372a82723..9d6508d74d62 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -66,20 +66,25 @@
>  #define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
>  
>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> +#define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
>  #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
>  #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
>  #define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
> +#define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
>  #define   PIPE_CONTROL_CS_STALL				(1<<20)
>  #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
>  #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
>  #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
>  #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
> +#define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11)
>  #define   PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE		(1<<10)
>  #define   PIPE_CONTROL_INDIRECT_STATE_DISABLE		(1<<9)
>  #define   PIPE_CONTROL_FLUSH_ENABLE			(1<<7)
>  #define   PIPE_CONTROL_DC_FLUSH_ENABLE			(1<<5)
>  #define   PIPE_CONTROL_VF_CACHE_INVALIDATE		(1<<4)
> +#define   PIPE_CONTROL_CONST_CACHE_INVALIDATE		(1<<3)
> +#define   PIPE_CONTROL_STATE_CACHE_INVALIDATE		(1<<2)
>  #define   PIPE_CONTROL_STALL_AT_SCOREBOARD		(1<<1)
>  #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 4441fe60cd00..918e819e7c91 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -106,6 +106,30 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
>  	return i;
>  }
>  
> +static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
> +{
> +	u32 flags = PIPE_CONTROL_CS_STALL |
> +		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
> +		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
> +		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
> +		PIPE_CONTROL_VF_CACHE_INVALIDATE |
> +		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
> +		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
> +		PIPE_CONTROL_QW_WRITE |
> +		PIPE_CONTROL_STORE_DATA_INDEX;
> +
> +	flags &= ~mask_flags;
> +
> +	dw[i++] = GFX_OP_PIPE_CONTROL(6);
> +	dw[i++] = flags;
> +	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR;
> +	dw[i++] = 0;
> +	dw[i++] = 0;
> +	dw[i++] = 0;
> +
> +	return i;
> +}
> +
>  #define MI_STORE_QWORD_IMM_GEN8_POSTED (MI_INSTR(0x20, 3) | (1 << 21))
>  
>  static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> @@ -212,8 +236,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	struct xe_gt *gt = job->engine->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool pvc = xe->info.platform == XE_PVC;
> +	u32 mask_flags = 0;
>  
>  	dw[i++] = preparser_disable(true);
> +	if (pvc)
> +		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
> +	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
> +		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
> +	i = emit_pipe_invalidate(mask_flags, dw, i);
>  	/* Wa_1809175790 */
>  	if (!xe->info.has_flat_ccs)
>  		i = emit_aux_table_inv(gt, GEN12_GFX_CCS_AUX_NV.reg, dw, i);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
