Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD5AC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 14:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2210FD6C;
	Tue,  2 Apr 2024 14:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftHn8g7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C11E10FD6D
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712068263; x=1743604263;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6cbfs3Lg9ANWnfT/mZnomXEULS0V7tgIYi28COQXwco=;
 b=ftHn8g7UnMDDGl7g8pwcFxPkP5FlIImqBvm1mugruhiIpTYTUXPJh2la
 eE6GItLQkgR0foqOrSq0NtVKSAFMHfQN8jIqTf/dx4MbTAjXhs7TT+Ea4
 5rSh9GC7BL/0ldkKyBtBFqlpJGdy3iYr+MQooiv8qkE/GJcErnUXHmkYS
 pHCbGfqT/PoMuxhUcfDifnQdKtzDJaLZzX5PZH7Elg+pTOpjJjJ2BlCA5
 P8E/LwKfFO5WOmhuGhDrzWO0F4zfk/iiXp3zQHF0xiL0srXvweMePL1ff
 AY3gJWbszsdllBytt66keVsG2JtDUnE4oObqRkfGiydsrzsxTaKOGRClA A==;
X-CSE-ConnectionGUID: /gxaI1cvSUmmK6WL2e2AGA==
X-CSE-MsgGUID: Qx/DyOgWSfa7qU2V//O+CA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11023353"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="11023353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 07:31:00 -0700
X-CSE-ConnectionGUID: 8s64OV+6QISXEaaj0CKJ/w==
X-CSE-MsgGUID: 3B6nPXb/QFKk3EbkAby2bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="17905845"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 07:30:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 07:30:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 07:30:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 07:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bou1UP9izJD9qnTKGtxJef07NdXTLU+DPvNCPvElDmh/tWSfX5F8L19BV75QrZKtONikmHczb+8W+tIko2U09Gf3ZdNQJpGgjPtmmIRVlHfqPuDvNcp30HC34ZFdDhKnxd109IOHuHZYmGvabQ4qzEIldvPeCWk+Gt0pr0rqk/deym0un2mrgikkhcFjeRvBx1zLXUhlJhvz4WocShZh/kN5irTGnzqXSPCnRSlV2ycdxoy5bDVIaUVSBLRq1LGekiZwB2+P+r/1svxNO4Zt+cdMfcgLHcVpWaRX9IscsclHXydp4kFO2NrUPnc/m9tvefoXb4BDJpd722QcyuOY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3cDVgX9sIDTC0uwJ1TZPvsPLT3kkUGxwhv3x3UL3N0=;
 b=Ytb+ZUE+3fUlXN6kQtw6Y6xVJTs35WctPZN65+b29aR4FrGSeUYGs8xN1YXJr0tXvqlh98jdYaRjcUpzvn4MNfxpZteRRvj7uNrbSbDcxrivG3jcuOf+lWzFPDeCPbFx7hOKXgG7LBpnOB3jbwc5gijHi6OUm6s2E+waDqoAmUj7fqy9LXKUwr1IMIe7G+MzqxX01MAxsJ7dGVaWcPhG/Dv6GlcM6u4HPVlM9d508sJmycEkoAtQwQPrHtnyUTC+hqDObM/pcPDJkj5c+aBzln5I4NHGgt3a/uirv825pFWtCtFhUzcygE3jUMYrYfLO7DtPOaUxijrexPcBs278WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6287.namprd11.prod.outlook.com (2603:10b6:8:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 14:30:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 14:30:56 +0000
Date: Tue, 2 Apr 2024 07:30:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 06/11] drm/xe/xe2hpg: Determine flat ccs offset for vram
Message-ID: <20240402143053.GD6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-7-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-7-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6287:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqGkcA1WQre4g6cu4vb0Mr3KghRGmdlzrgcFMpy/ow23g0VLgvVDLtRSaRBgJguw8dykwOHWxU1optDiZdzra9/busIE/wTAyR/H8fH307IZqP665E7SpKP2tLmvXyTLdCQVumlasCJQuayT2qPOCoDQnROknEgGzlaOxIxDOKLF6b1cP1H2lFci2XWDn8zuU7GUUM/QpExMAMlJnZpmDlQlg5jWqAJ3a+QDKWGZoV5WbzMxedMtZxlVJ2sqDYJ4eyFtblDKwWUlta1cao6nlSj55f9hggRCEfCj8/jxczBc4Vjp6KzGgK+89m7jY8+FuIaB2lQ4t3tlLaGQlQUkRO1ppcfQeQvRO6gHNWKdmFlf/mZRXt1UL5+dZSSAhUat+2iBgbWLfcLrfv8himFnFRSUqryjdlGY/u2zIO+t3/gvS3MhghVe7+UPEDsMCJcjIuJMLCg5JZkwA2tLlvvh6PJM+LXpwNVk1+fMhYACcWfMRByDKRhR9LPts3lSE8paZAqq4K1V74fME7JxStYm+gDTTcUBH4lc0w7Zl+FAMC2onk/QrF5fAsYEsDHI0U/d7YGgDC5SE91hXOwcP65xCQ4McpSlePaC1y0z1r94BpxOQtfQ6Adbp6SZzUMoh89p0JJ4ETNYRuPK50uLNdDXnP0oijlrpBH95E+I+6Ho9oU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vc+pzDti9Q3Ic/TJelZMqgIjhjlrqXoOSYj67udTvc9t0SfiotW+3KekKB1G?=
 =?us-ascii?Q?PC46pb7rknbsXfVJgPXo6kt+qNKxgKIOiMxSAe8fDPQqgwkY3Iq4dzpl9nK6?=
 =?us-ascii?Q?vPbuSacdcJMC54zcvqSCPULW52n5mv7yhTw9v85TsqlkUV50ANX43Ag1NeSo?=
 =?us-ascii?Q?Kv6iFWC/0dtN+E57fXzrsuVN0xrt2AgCwF6wvfwxYBkaj0lVf9/RwEHagace?=
 =?us-ascii?Q?2oAnlF50l3wKdfvYvPNzUy3H8YH62JKFZ9BXIPtDgvsepKRaL9qwqf3iSAPl?=
 =?us-ascii?Q?fkQWn4Xs8ZGc1NgU3tiHSFNk6tdsrKWRpd5mPb6sZN3Q7cCltd34fPVgtb0P?=
 =?us-ascii?Q?OraWQH2SzzrCPAIfThiVy0tQetYz3h+z0M/yMlhgA6uqcyd5dmB1o+CrHT7X?=
 =?us-ascii?Q?zzSYD7BG90LuJH/pUjOcLjeldSXaxTWUswjyUnKpXp8uyMtMTLXyPFMQE86P?=
 =?us-ascii?Q?Zgdut1Un8Xyb8BAGlHpGypildYiu3UjwvYb96UTuRaMWTv4r1cVo5NN6Vfeb?=
 =?us-ascii?Q?77ZJmNKSXYbIG+IqTjVBQuh9Wi0ZJVwp4BfEmp0468G+uPilbLFdHSTKlDuL?=
 =?us-ascii?Q?B9tVxAEVpE32u/sEr1kWFQJGkOJAy7uRQo6unzS5wqg1GnyCia0/LjnFgYuW?=
 =?us-ascii?Q?1S010KVSBIPROvwxENXa+/auAA1imw9GBe1GgbLj4EsopH/cg8iZfjtUpGKM?=
 =?us-ascii?Q?RsJqB8gm76CD1tvaOBE5lN+a5xvE6rarMkDnQgalkGb+8n4mIuMnf1yoJUPZ?=
 =?us-ascii?Q?DFgzXZo2Ilx4FqKExCHXW47jmYq5E7v2ucyDOPOIkeVB6S00BA+wMqfgYTVq?=
 =?us-ascii?Q?uqJaXCyvcskUB4odHzDXwzzV/lc1Ao9eTyO+FjyGcMBRW1R1MLxMa4hZ9Hbg?=
 =?us-ascii?Q?laIHdaD082OIfZ0P0nVJEMvU2x4NEdddHrnzpFMmURDscba84DV/K7N0KVD8?=
 =?us-ascii?Q?Y32eky2Y8Ny3L2jfn40lWF5PNis42jrVg0dHgymrJwySjA2MJCZF/RqKKfER?=
 =?us-ascii?Q?57aaIaUIEZgaE9k/4FXsCVMGqF5UOO0N6+VzFnpSQ6Jh1lPx+0ZAXWl6BSUN?=
 =?us-ascii?Q?iH5RYSItA86ftZaqWnHfy8LK72FG+nUftHGe8Wfl6aOH2CVWoxkjFvRG79z+?=
 =?us-ascii?Q?ajOj3XEBErqGFVcsrE68m+mbPULoogSUqOpNkpeQN2E3fZ60iYV08D0u18Sx?=
 =?us-ascii?Q?h9LIAsIvoDVeMmF4uafZsdfF+5rvTRG5UtpgMpzBzkLRpnkycQtrjU8dBr0i?=
 =?us-ascii?Q?vD28QI4PjZXjYyS/nawe31FoDjLwRNrtMjQm17i7R9u6AoSy9UNFA0apGskX?=
 =?us-ascii?Q?3scZwYU0Fy3c/KcvzQsmlF0I6qFzIWInY/sigE3bkkxwbC5Wzkcn9riJu1mR?=
 =?us-ascii?Q?X2OquZW497LsQS8WyAd5yEbDbLEYlhkwVxwa/xQJmLQVQSVwOCySMKLI4J55?=
 =?us-ascii?Q?P6yFM5Y0MWW/g44sdeRemCoc+dmCTrn0+oGnsKEg8SOgdyMJMLuwjSsVX105?=
 =?us-ascii?Q?SCFsyOWwITCEsxYkJ4Gemx/sy+roR0vtxhFxWfbBHwjyp6T5DDrEnOzrVB+i?=
 =?us-ascii?Q?DicYbho+r5EyuzyWMrpnmycljjk03z4iAMhfc1bvaRJjTWXFTGFPjjANzlCV?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bd2c5a-ae6b-4363-339a-08dc532181f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 14:30:56.0648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4ku3wezR2AOIe22LEbNGmUhfdxBd20jf8LxGxWlAO6yUt4K76z9prRl2iRjUHQUbGkiK8o2nw15rey0w9q20pdWnwHYgmnB/FpVFgEIr1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6287
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

On Tue, Apr 02, 2024 at 06:17:19PM +0530, Balasubramani Vivekanandan wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> on Xe2 dgfx platform determine the offset using Flat CCS size
> bitfield of XE2_FLAT_CCS_BASE_RANGE_[UPPER/LOWER] mcr registers.
> 
> Bspec: 68023
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 ++++
>  drivers/gpu/drm/xe/xe_mmio.c         | 39 ++++++++++++++++++++++++++--
>  2 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d5b21f03beaa..ea75c1f0ebd0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -69,6 +69,7 @@
>  
>  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> +#define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
>  
>  #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
>  #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
> @@ -141,6 +142,10 @@
>  
>  #define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
>  #define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
> +#define XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK	REG_GENMASK(31, 6)
> +
> +#define XE2_FLAT_CCS_BASE_RANGE_UPPER		XE_REG_MCR(0x8804)
> +#define XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK	REG_GENMASK(7, 0)
>  
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 5d13fc7cb9d2..49a32b03fcf8 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -163,6 +163,42 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 *tile_size)

It doesn't seem to be necessary to pass by reference for tile_size.

> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 offset;
> +	u32 reg;
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		u64 ccs_size = *tile_size / 512;

This value only gets used for the assertion below, but should we be 
taking the value from 0x8804[23:14] rather than deriving it from
TILE_ADDR_RANGE?

> +		u64 offset_hi, offset_lo;
> +		u32 nodes, num_enabled;
> +
> +		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
> +		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
> +		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
> +
> +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> +		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);

This register also appears to have a general "enable" bit for FlatCCS in
bit(0).  Should we be reading that to make sure FlatCCS hasn't been
fused off or disabled by the IFWI?


Matt

> +
> +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
> +		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
> +
> +		offset = offset_hi << 32; /* HW view bits 39:32 */
> +		offset |= offset_lo << 6; /* HW view bits 31:6 */
> +		offset *= num_enabled; /* convert to SW view */
> +
> +		/* We don't expect any holes */
> +		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
> +			      "Hole between CCS and GSM.\n");
> +	} else {
> +		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> +		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
> +	}
> +
> +	return offset;
> +}
> +
>  /**
>   * xe_mmio_tile_vram_size() - Collect vram size and offset information
>   * @tile: tile to get info for
> @@ -207,8 +243,7 @@ static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  
>  	/* minus device usage */
>  	if (xe->info.has_flat_ccs) {
> -		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> -		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
> +		offset = get_flat_ccs_offset(gt, tile_size);
>  	} else {
>  		offset = xe_mmio_read64_2x32(gt, GSMBASE);
>  	}
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
