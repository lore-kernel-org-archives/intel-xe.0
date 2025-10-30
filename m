Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48DCCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD71210EA70;
	Thu, 30 Oct 2025 22:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGjSWv+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53A10E106
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863459; x=1793399459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n0K61L8eUgGM0GTA/lzMYINrPxNLOeHXLyO/Ju5R950=;
 b=JGjSWv+W4X9RBUzgDtCsp1D9hs6+abM2cZhxvXFSfq/rkx6ucbH3e2Gf
 +K4eDNV00cxq7OsiGe7LdnVPZM3+Gsa6njPwPzpBTFMaQape5GdwWxFYs
 GhZU4Q0kebQo/OxqwJ2UCjjyJEPb7XoTXo6nmNxWeBZYmXSJqHl0mPlXm
 9Z1SP0ufkczu+azxRHqVjdC+SHkdtYCaPK1C0bt1CZfb5DOYHDqvMwb9o
 tjoyMtdybjYAAB9ngPlwU6KMVXhjq/QoETmUXt5qLaIq2n41EP0+YVIDu
 gKqbHXgsvxnfbX1vvu+42VsHwt5aQdDki9Y9oPpS+HT2pHszVeO/Nw9td w==;
X-CSE-ConnectionGUID: b8G/zWJ/TeyY5q5J+GXpdw==
X-CSE-MsgGUID: qectJjv6Syeu5isMo/fIqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67880938"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67880938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:30:58 -0700
X-CSE-ConnectionGUID: lL7xVcb5RGClijgUg3tWWg==
X-CSE-MsgGUID: 5ZI7tZA3QwyUCV1HeYomDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185735438"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:30:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:30:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 15:30:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:30:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwZj58GeZRdEFUlOIUUVooKWHzbl+VbUtMSaXCilRed7HI+m4kvZv8rd3JC3lw/OFUzueBXZvkd7nSLINUvHhclfCJL66g6RfDS8kK6gLJWYwf6RwSfcATBYiWeM/3l+Hw1AnedPzF2ODeNavIyr55VJx756KWS+a7ENEmupriK5Rt/hQR4FdlgbyU18QTaH6fZ+X5RN89cLJg/wMkW0MlBlDnPJwbVTiYjml6o1vnZnVis8Yn1bO8MLaGecaLdFb1tMfsRMg/W6vIkHEn14GBPDIQSUTkegDxxPq60fdyu25h69L989GgRCD7s2ZZGunAjOmaBFKaxDQ0vdM6eLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7r5LgwCKSDAJSlB0PO8tAo4+NmQN+xokmLvVrwOr0Zw=;
 b=WQ6bApqkwPVtKx/NNE4QT2A83gsYNn1CHXuZk0HwIRwUhbfXjPdN1APFqV0SGpWK10lphdmditzVl9HrAli/Noujuw6ZrPufX83OLR2rcM1y01/owyKDHrerlFsbGjxnKJdhiR93kJ0BZ3cgP3FQSH0qDeHwzRRic6Lskd77d+aBbfDamya64pZTTAeMIkGXa1TGXmQZyEgofJc/09EasGRUJmyqnR4DmjfKxsKoXTdg52+3hBxG1r7rzTvUK6TTTAToeX+fNoB2gupYdeeGorp9gDj5fhkJZan19unuIA2bHKrl3BeEqz30kbq0as1KrheOcTfMshG5Oi7+n4H5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 22:30:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 22:30:55 +0000
Date: Thu, 30 Oct 2025 15:30:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH v3] drm/xe: highlight reserved PAT entries in dump output
Message-ID: <20251030223052.GV1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <20251030221734.1058350-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030221734.1058350-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: fec9edf4-92bf-4c07-80b8-08de1803fda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AXdvnCKKrtqpTcrj4GuRocPMaxQvm1dzJtrFpubgGmkW1Wow2s9noH8VP+qe?=
 =?us-ascii?Q?yyv5l33YyQuQjhhRbVx3HNymbQrrWaCvBGeUJnZqVcSUo8GMyOfovZCS2cxD?=
 =?us-ascii?Q?D/0IxTqvF0/Xl++5q4s46IFB0PlTpy891lwL1kmMqtVqAVXJn0rJXPNeXVpe?=
 =?us-ascii?Q?1XOHmxq4mvfXqlPpaAifrdj15OaNToKfXRN2q11AnMotLCQL229eBpBiEhq0?=
 =?us-ascii?Q?FPSjs4k2viggZjt1NyvWaaMDHPAS2LmY771IrmheNxIs8HRvkqrIC4Z24rms?=
 =?us-ascii?Q?VBEDHhIJNe9tcSNwsj2hc3GhpTOgvTa5wXns9N+YT/CJwZ8Lz0+fwiMaLVNH?=
 =?us-ascii?Q?Wao3LkgUA0XAWbBTLvMQGq8/aFSyVh6HYwv/NptbQ+Ay8y3ABL08bSYRMF/d?=
 =?us-ascii?Q?vAx2pewSZHeGVaW5GKyFwENpuxnpj3Uxp5MrLqZQPJjIkhraBk4koI9EOG6r?=
 =?us-ascii?Q?lqym0I8VECZ6tXZG4IqF9I0IWCUR3geYq8PEBur/a8+HRuinnq/tGeM3JS0Y?=
 =?us-ascii?Q?cjKRPARnBm2oetbE8Qc9v+/bJuLdE8AeUs2jlKrxR3e7Ibx/gBQ5aMEMyEh3?=
 =?us-ascii?Q?fOZBtly1Oy9Jq8qg+B5ORXc67SHPubKKa3lCK1tvk84tWpD5nKualj377/PD?=
 =?us-ascii?Q?f2RuReEhV9ZzqbTQvwYRga7CI1n2GbCwA55mFn3puxMYAXFqeyhr2vfgUBH+?=
 =?us-ascii?Q?ACNO5jhFF8jDbNEoHCXgsMVrHMoOg6DWw7NdfloPxrLwC/gOer4zMMQPuABC?=
 =?us-ascii?Q?uHIbTym6cazfVhogEhfyXyZrVSYzWwcwTppMV3fd6uElab2DXMhyiCRXf/b9?=
 =?us-ascii?Q?900VE7dU01x6WYko9ouLBrTw8MiIktDzIWu4d47gX4EREJ7CtZLGN5Y2Tz+p?=
 =?us-ascii?Q?YtFS8WQnRGSfNTHlAvkJnR7KnF8u1hi4vnk7eyiZUmQL+dQYbfsJejR8cuS5?=
 =?us-ascii?Q?ilIS3ymB/gRrKY6UEmS1JIOErxj803bWwsQOHrUqLaU4+mceNy608y/+qdGc?=
 =?us-ascii?Q?HK80F9miavzX2H1+duDCl6iPwqFnrbWlLOGRyDV7Js/3vVZAH7l7JznCW7NJ?=
 =?us-ascii?Q?Gwbw0rCLDP3izoVytVZA+DYAyxw5fVZZH1WkzrziiF4Oe0I1EN7WI4ViX/dc?=
 =?us-ascii?Q?uPQc7FZeGbjphl/f978q+gw/B8+L2+Stdo8yGnRcbbUcG+DRNGjLmBZkCv82?=
 =?us-ascii?Q?rzHa+frHs343GkqxGSODTArYSbthsZUA5hVMA2wcW9rc/ENQmw/5C4zZQ8Gc?=
 =?us-ascii?Q?h6VDWdKNdoaJspA4FtcJdqIKpg0+95o1WK1ecKIqVB/7Gr/d36G8Qh6N4jZ1?=
 =?us-ascii?Q?CtyhJBeOcp/ZMk2eJkeL8Za5cF6vZ/741wGRAyEpmt1zbpS6CQwxJW/eAnCh?=
 =?us-ascii?Q?wIOvHH7qcdCt7jGvY3LWhO/CKPpPmQdfOQsTpmvb+E5Cvua85684d2hODOX7?=
 =?us-ascii?Q?qv6rlSZYtJXQb7C+up8YSJ8KpJNnKjmp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bn6VYT5qz52jfXgkjaeH2fej8GsHNDUSD6A9S0q51/z2L00xVtGeO8KIT5SM?=
 =?us-ascii?Q?u1u7lUR9WSxTQ2vf5FnjS8uRcScbOL6bmaJBWfb5JRWkN+R3kRSLff5TtpKi?=
 =?us-ascii?Q?x9X6VPzgOJS6ahjVP64lpdDcZi8Y7F9agY2d1LQAIgYckfEfn0sIgtcvS24g?=
 =?us-ascii?Q?4DK5LkDUgsLdapY6e4wMFvYr16k40Z+sURaixZfKcNPQoEWHURd94N7VX7Ca?=
 =?us-ascii?Q?x9UPiY48yekBMgI4KvBMCyA5tUZgs0nxcyil0O3wDc7pSFTVTfXQ1pg1Gwdl?=
 =?us-ascii?Q?r9WtMMlQIUBLfxniC+oihLwZTI1GSYZMtp/8+2PaED37i55EKOusAv9yENNI?=
 =?us-ascii?Q?EuSzSb6F5yU9TcJUG9HOHrM/C4fv7SCj8Mm6EkcW6lqLmUClA+fYcRzbNITK?=
 =?us-ascii?Q?q80mDyoVuEG5EnidjP9r/svbMhRkhNJFn2yVRKostHICtTjnZOdSyzImKUo4?=
 =?us-ascii?Q?zHJ15zygcxFilt24AtEjkKgX0Pd8fHoBfWbxmTdJr6ThoDfr6XgTOmGGqWbw?=
 =?us-ascii?Q?6x5cuJEid/WJ75GewLYPvf9l8YpatEMbSDpn6hTMktnxdKMuy99v2EnY9otY?=
 =?us-ascii?Q?uDyzVPwc7EBmh9csjmd7kVY6wAzaSSGg/YN5leIrBrAmwC7QmoVxJ9grYEfo?=
 =?us-ascii?Q?ykplZox9TeEkINBQVVoBuCHdwSzEQQRDsUczo2MdtW47bJBfkjXlwVVrirHc?=
 =?us-ascii?Q?2hV813nwuiCasJ47ILU5hCVgfbxvM76QHMK1OiKzB63s4V0OS79wzz9GfrJd?=
 =?us-ascii?Q?aopPtP+hEj5COoWJPLAmXWjrUlpSSa8ATvr7vlY2nK6zRZZa8b73GZZFa9/j?=
 =?us-ascii?Q?1NkqD/Row6SgtlhDPqQWPWv9ND5N9q7DO1wOHa6R+2gVrOOm6Ch9bPaE9xTD?=
 =?us-ascii?Q?kjjgYvmcBirt68m5e88nYRetgnxcP0O7bAWaDn10TRg00d88Eg31BclOa5ED?=
 =?us-ascii?Q?LO3Y1q5S/PfdiiWyEG250yz6qb6b9cbA6shRDIzYivWIf6ZA56UYpgbm7xfp?=
 =?us-ascii?Q?bTXd1HFOWrbaxRH0ByRMruMeTmHwovFA71BlhyUSyEpdgs16c1wCYTd5O3M/?=
 =?us-ascii?Q?bgLK99Nq5PFKi15SJmMZIl+6ciJ2Hrn/4Zsuas+r14AKrja+A4BGzyPNN7c0?=
 =?us-ascii?Q?ARqhvIQ0xpCS+VcVWh8iVzFT6rggdpbjWy8Pws8ffE/2edEgBleZP8eH6yh3?=
 =?us-ascii?Q?Ez1CIpF/oWvualXB50fX5U+vq8zmCJxAYMKPW4krv9wPiCFXF/WI5iFpFx7y?=
 =?us-ascii?Q?I5yfCqQG81XSIUpA0dxQJQtOzPO99lkuXGfxdKURw37iiCDE9243fZlz2uvO?=
 =?us-ascii?Q?VDgo6jugzQYfjL8PYlPpt4UZkhnfPXW/Y7+s+sjJ0chpSlctcJyCByuZIJv+?=
 =?us-ascii?Q?gSbVYVmpPL7IG8/9jQuSlarV+NusTy0akxjV+PZNClCtWCIRaE5TPF5FfYtf?=
 =?us-ascii?Q?aNv9INPxGzLtWgfUdKxJYX8RMcRzL2b7NFi2GtujgLECbFxxmvqzjYPcbgRI?=
 =?us-ascii?Q?RYBLSdzt5AzDmo36rO1xLKKZabgxbr8WxAvh+zwFHIvNefF3nCqLImydMDOa?=
 =?us-ascii?Q?CS7VkvxJJeIqeODvsg7pP7c80dXr3othzAyLHa42rUO9ZnjR9s8CcK2+G0+n?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fec9edf4-92bf-4c07-80b8-08de1803fda7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 22:30:55.4219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgXBeu/VzhCUqkUq5yohqHzzN0fdEYgZOLvtS2n1N174ndzDHfglC+WircaWwhJBhMi63BSd1OSzb2uWgPNkmSebJZeh52WnhiJSUSzWwZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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

On Thu, Oct 30, 2025 at 10:17:34PM +0000, Xin Wang wrote:
> Enhance the PAT table dump by marking reserved entries with an
> asterisk (*) for improved readability and debugging.
> 
> V2:
>   Added a note in the "PAT table" header explaining the meaning of
> the asterisk(*) to improve clarity for readers. (Matt Roper)
> 
> V3:
>   Introduced a valid field in struct xe_pat_table_entry to
> explicitly track whether an entry is valid or reserved, avoiding
> reliance on coh_mode == 0. (Matt Roper)
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

In the future we can potentially change "valid" to a bitmask of flags if
it turns out there are other traits we want to track as well, we can do
that if/when the time comes.


Matt

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 15 ++++++++-------
>  drivers/gpu/drm/xe/xe_pat.h |  5 +++++
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 059e3a88ce5a..47e76a46ef02 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -109,7 +109,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
>  			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
>  			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
>  		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
> -			XE_COH_AT_LEAST_1WAY : XE_COH_NONE \
> +			XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
> +		.valid = 1 \
>  	}
>  
>  static const struct xe_pat_table_entry xe2_pat_table[] = {
> @@ -403,7 +404,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  	if (!fw_ref)
>  		return -ETIMEDOUT;
>  
> -	drm_printf(p, "PAT table:\n");
> +	drm_printf(p, "PAT table: (* = reserved entry)\n");
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		if (xe_gt_is_media_type(gt))
> @@ -411,14 +412,14 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		else
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
>  			   !!(pat & XE2_NO_PROMOTE),
>  			   !!(pat & XE2_COMP_EN),
>  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat);
> +			   pat, xe->pat.table[i].valid ? "" : " *");
>  	}
>  
>  	/*
> @@ -461,18 +462,18 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	if (!fw_ref)
>  		return -ETIMEDOUT;
>  
> -	drm_printf(p, "PAT table:\n");
> +	drm_printf(p, "PAT table: (* = reserved entry)\n");
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
>  			   !!(pat & XE2_NO_PROMOTE),
>  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat);
> +			   pat, xe->pat.table[i].valid ? "" : " *");
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 268c9a899f56..05dae03a5f54 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -29,6 +29,11 @@ struct xe_pat_table_entry {
>  #define XE_COH_NONE          1
>  #define XE_COH_AT_LEAST_1WAY 2
>  	u16 coh_mode;
> +
> +	/**
> +	 * @valid: Set to 1 if the entry is valid, 0 if it's reserved.
> +	 */
> +	u16 valid;
>  };
>  
>  /**
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
