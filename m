Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBA6C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 21:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC49A10E3F4;
	Tue, 28 May 2024 21:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEgNFA1M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481E610E452
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 21:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716930897; x=1748466897;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aUc9B47NMQDxAHXek+DCUu5DyGLcOe0L7lnVpCTUXW0=;
 b=aEgNFA1MakyoNkq4ZSTKh9C7rXJq1WNkouwh3PAHpAr7dxE77Gt/SaIE
 Etbr8L9NUMSWlxkMFeius/K6qkJeQXSjHWMrGLagb7Ps/BSwKSO4GJzMU
 jwlnoBBUp8uyfGOw+4u0h2ISSHDWagVgEQ0PzlU4+Ldw3sAaWLh+3oaHR
 cfS5drW9fTv0jQCta5+5kD2T89rVOlIYN+G3cBJxAhmezlOT5qi7BAtu7
 Ne8bTRindFLZfjAhV7mzFz/n7cffcnNV2R/IEhCRDPmoYdPHnCNdEkKQZ
 AME2Cz7AbRZIJ67+e8T1Y3z5SBbrALlG6HF3P3ljQmqWXIz08THykopL0 w==;
X-CSE-ConnectionGUID: YRI5svYHTn+SRROt8DVZ7A==
X-CSE-MsgGUID: ecxNPDNlQ6Wd8w+KxQSF/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24719234"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="24719234"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:14:57 -0700
X-CSE-ConnectionGUID: O2j5vurtR+ipRXAkvDphYw==
X-CSE-MsgGUID: rhD3o+ehRFOTXsb7vsILfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35219848"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 14:14:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 14:14:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 14:14:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 14:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wnd4MqhTFOYl5rLpkbmVJBuRd/qvelCqDnQg686u3/A20KlATQtHPiY9jBoY76L5xxDewoAWPy0t1jBpumMJYTUG1C67wyH6bzIZTiFCbW8DDccxgzIUjRiKReeTX+cqBMqkEVsvBBVH8uRUabEVM2cipT14ciytjPH00rL8GEqam8ORvgrXwe8mdKUF3PZRrMe43N+9H4n4Fa5HkuDhUuwp9aWR5flS4S/QaJe4KnPRWf+i3WVI30brXwc8Q0zm1nkjZnvRkMIXnlTN8oOCaZqt+iI9RNL0nywSvz3HCZR7lOcgl2HZ3bxf0I7E2nBgbHclPSPzklvuFWrgrumpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjvYNOti799FVE4IQFoZcAabHBkzVCgw5s7Bv25UMRo=;
 b=LXONsSY2f3OQZMSH5FZTkZJrztEghEhiHQ2krA2AT0cT0RjJBWVZ3Ssr3luuyW2MJRdZzAq4LQKhRXIa8IUGKZlmHTwF5TamGbDR+XyXNhp6XvFba5/ms1I+y8HugJUMOtStvssEUSvK9ce+d8HNYZWnnN/zP87FHoqSWSBkUmpKbATSiF4ke9XuhkkLdAi6A5tkcwI81Fm1yLLPjw1IvGdTJupHeC38vNn3MBrRw9pTMKTF4y+C7dzAHWtQ/qHkrIVaEo1MYof2403ZrG6SZzYuIKhJG5/HQMOgj99fC+fKjAYmKZrl3GWILKX33RYtXOmum54c3jtPud12GqUogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7393.namprd11.prod.outlook.com (2603:10b6:930:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 21:14:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 21:14:45 +0000
Date: Tue, 28 May 2024 14:14:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe: Move XEHP_MTCFG_ADDR register definition to
 xe_regs.h
Message-ID: <20240528211443.GF4990@mdroper-desk1.amr.corp.intel.com>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527173554.1108-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:74::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: 89715eb3-4b38-494b-aee9-08dc7f5b331e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VPhAhqo0rwJz8I4YAr1c5VIZDxevxoJAQEltg+Vj/IOfzyPcuh5qbkM0uRQW?=
 =?us-ascii?Q?tzwVJ+gu/deKNekonr8I0jWBgR1f+3DiqywUBThd+Llq2whdKOV4PlUbQYhz?=
 =?us-ascii?Q?/NPjL87y0J0n3QYdzamXux5CZbV9wrrJQID9B5gCzdENeSXq2k12+UretNIj?=
 =?us-ascii?Q?b78Llvd59uyr5W0ab9BIN6/JogS1dWHTstzhQnMty0yyWmG7k0rH8XG2U5tJ?=
 =?us-ascii?Q?hT8K4OgO3apFWuCWtLFrxC0Q6rQrxsXr6kNbEoLUPpYcHHPusdp3DwmjPSXG?=
 =?us-ascii?Q?Gcly10d8sW8irv5T6A6Ul14IU5gyD5Oo63Aiz4OeLdQ0ImK00anWgl5yd6ic?=
 =?us-ascii?Q?izCO7ubOcqIrRUaAUodE6Vn+ACpIqBcmTTo5+Cieh3usPYn2bJ8gJhT1CStX?=
 =?us-ascii?Q?hs7zSEnH70NZgTs7xVqMNNqo7CnheDBx9CCt0BNFGwEj4849VeLSIP8QHQNy?=
 =?us-ascii?Q?sOLLrP++DPFyHnkM6EWOCSrEZRrzTDwCgy3MFQ+C+awb31D9zeruj3cjBUb/?=
 =?us-ascii?Q?wxYVABOHG25AnraEJ8vUNVlMzOj2IyrmLl+IT0tC6ZsTJAXo0LGwo5jj7Bwe?=
 =?us-ascii?Q?gP6yxOGgRInTTpb4gH/YCvOFsDmJ1GQ4nOoxuZ2f69PADf1mrCXrguM9iL9D?=
 =?us-ascii?Q?wnrGuMavGwzi1eHN5ug68kYv30iFtgoCFSo2LuOQHp3RgXQ/gFnzob3x6hKm?=
 =?us-ascii?Q?l00r18hT8NfP2da5MLmfeEUSxRXZm7EyOImGDmPPHYHdf1EvV6cOm1BLnKhp?=
 =?us-ascii?Q?Wxo1btpOjLIqsPboV705jSBvrZNa2uv2Sipy2xx0++uw1NhnQv0KhGgW7vrl?=
 =?us-ascii?Q?84XqA3q83kwjisXy9/avy1DMSDJTcwETyPVQfQo6ena7LOg4M1EKvj2wl8yd?=
 =?us-ascii?Q?FkokLwR4h3ogqO1/1aoy/MzXJloENkeF+zYYqss2iD3NT8g1nQvHi3QmBvFy?=
 =?us-ascii?Q?mc1l7HFkSlvlXZQcD04cirEOKHLHj1Neh0O0GMk1mrHPin7glE1V7Oplbh9D?=
 =?us-ascii?Q?fQWuT3+GBXOjazpvFBbiw4kIZLwTJCvGYVmiY9fM/WYXfUJoDLIxxc0MxLrP?=
 =?us-ascii?Q?TdJhgM6HgQVfoy5Z5O3JGc6C89zcAd5XScPuQ2SE7z5Q89rTOo6NASmbXvTd?=
 =?us-ascii?Q?nr5idBtFSpUj8Z3jCBoDJxaWEX498VZ2RGAk/JrcTHAnSYXUJ5QDJ5kdwzPL?=
 =?us-ascii?Q?U2BL1oJgUYHI8Vol+8/+LkOcrNIvOgGBj6wHYZXG/0PzxeZvF5JCr6WeUb3i?=
 =?us-ascii?Q?Mj8ShD6UgPepCJtneLjzdLpZK5cADcD+THzvWQInRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fS4wJGIp956qJyJ08XRGMCAc+cAO7i0nlHkMlqV4A+XJMamgnfvL1Iy30Dxp?=
 =?us-ascii?Q?0i5fEuhkHVO14n5I2gvYpcHgAWNeReIO9sRjKdABHB2jpg1We4o0UU4Yg5SK?=
 =?us-ascii?Q?phoNlmiGrrrSaNnNl6QHqurwlQ1+5L/8oRK03HxrNoUcfuR8xgfpDFKvEy0G?=
 =?us-ascii?Q?WTvOoKWO4TYEzMWgqVEMSTTgp/FF2guSp/bgfuibhHPpG4gnJmi+FJS4vDCt?=
 =?us-ascii?Q?MYKTcAt5CkMUNXI0iHpmvJyMVaRnHvAOecWHbKXWUhxi+r243ajE6ytZZPFI?=
 =?us-ascii?Q?a7WwY8pnIfZSwoPdq7m0Oa7Mr824taEYTtqwpsDcQZGQTcXp+L9+dFeP17Lo?=
 =?us-ascii?Q?MWuydyetIGYUhigE70T96PIuMYukyHpxtoHUV4xljy8BMSuczfaFtzHz75bw?=
 =?us-ascii?Q?7kpZ8uFUtsfjid8AocUccQwHEMVzAc7D/XVFL3VRy2IGNhebDFVkTx94YtwP?=
 =?us-ascii?Q?IbBcZd8lQAvJSxNBuIKXl1NKMLhH4P8epLLUHWem4KkP8tuHbz5k4pCrvjmd?=
 =?us-ascii?Q?7djQ0tHv7ksrJ+Aeztp0hlTY+7a4OAim8SbRNuti2D6ND8VD3wXLCmgOVj9s?=
 =?us-ascii?Q?ZTErZlF/PYoOdyQJqT+THYrJiXlfdepGgl99OEZ3Uz5bWhUH2uxpqYwdkhTH?=
 =?us-ascii?Q?EAWElt5KuY/wpzsaqzwwx0rbKTU3DwG0EvZWxk23eY5dCPiKh29FAacgeLh/?=
 =?us-ascii?Q?5GId4ZcurzGiiSMkaoLHMHITIRSD/Eg13UjhUhJWitk8L6jiR6YZC5mnEiZ+?=
 =?us-ascii?Q?iKGdcZLAS9N9d2KEuh1+Cf3R6fo2MuT+5RXdab0WYbYcBFwjM2mEQjYjUnxP?=
 =?us-ascii?Q?we6gvoYwhx9gWI7oWokqDR9rPZjWYyvJQKvhA5DRfuk8PS2aXpYO4L1KpORE?=
 =?us-ascii?Q?l6WTi3t85tMgcY1HjhHI99tXmVMuFkW5rkEp5iLsoqMzvt98rp9zh8iovpaC?=
 =?us-ascii?Q?Xp30X94E7EB9dHw4ibvhBfZX1fRfB1agRJeiX623eHFGJWPsYP7VFw6v7V72?=
 =?us-ascii?Q?jzWaRaXXlCwK3uunQhGSWsZs0lHuUNQLmjMS/++4w3OVlI0K6NR1+KnlEx6S?=
 =?us-ascii?Q?eX0FMsopi6MBDYVC5bBJqGYS74KOM4zT9JRNkzElprpzeJNIuQl7Ul8jcVX/?=
 =?us-ascii?Q?DfZZJpS5+vHLXeONZb7Msr5FHcEJO3U6PUrXEJd+Rz2ZhCCQf3tk7FJPt90F?=
 =?us-ascii?Q?Y5vWi0i5wwQQifG2TQO2en9tg1HKdrAm+Hhm60O/5/sBHr4FakZwEjfuhTpA?=
 =?us-ascii?Q?9Qv5tOT8EuQtcwXVgLK8WRfNO3rHSQDvscTMHhv1Sg3ykRnJufzxnC9G2qP8?=
 =?us-ascii?Q?fPIEpnROPyhAyHUk8cB+mF4/U3BiTTF71JjgH8On0z162ZB+3IiTVCcPZN8D?=
 =?us-ascii?Q?P57v0JjN4/bxfUrfM4rYAqiRT2aCUjvCuyt2J3l15XOT6SNWPADgeuL5tzqA?=
 =?us-ascii?Q?XgzkHWL1RJKwVUYVHFeB+128G+Uef95KEg9Vl8NkO1eGe1Ei1Pyp6c1dwhdQ?=
 =?us-ascii?Q?W5/LdUcdgjUgjAZ3UiMkp8Ltso6UbRqDtRvRHtnPndRPb15LdLLxC4LdTl2R?=
 =?us-ascii?Q?dS+j0ojW2nsEKaY27okTUB0+V+lLbnOyldR3zooJjzhgmIkWcau5AcuGSkZ2?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89715eb3-4b38-494b-aee9-08dc7f5b331e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 21:14:45.7184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cTbsdv0iLwoMkMDsAANW95kU1CV1hE+0rvLtgPUXCM7CHw0dBdw+XFOzzpqEj8MS4flONjD0sG0wnCnSucR0k/eA5Civkvax+qgZXDjI4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7393
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

On Mon, May 27, 2024 at 07:35:50PM +0200, Michal Wajdeczko wrote:
> We should not define registers directly in the code while we have
> dedicated files for all register definitions. Move XEHP_MTCFG_ADDR
> to regs/xe_regs.h
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_mmio.c      | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 722fb6dbb72e..23e33ec84902 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -30,6 +30,9 @@
>  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
>  
> +#define XEHP_MTCFG_ADDR				XE_REG(0x101800)
> +#define   TILE_COUNT				REG_GENMASK(15, 8)
> +
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 248e93ec6df7..44bff104c011 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -28,9 +28,6 @@
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
>  
> -#define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> -#define TILE_COUNT		REG_GENMASK(15, 8)
> -
>  #define BAR_SIZE_SHIFT 20
>  
>  static void
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
