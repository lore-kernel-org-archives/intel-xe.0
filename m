Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D39C02193
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 10:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08B810E1A3;
	Fri, 31 Jan 2025 10:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCbeQfUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5E410E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738319887; x=1769855887;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hLr7HPxpV2YzSMn3Cc7lIfo7oPFrUCp0bawvDbJLLUk=;
 b=iCbeQfUihpL1Pz6E0MCVx4Da3c/ThMZ72rjceApNmikrUDvMqH1hJQgK
 nW956QJJy1qV40TpgD7pD0NvarjA3UALZw1PhlTU44MpUcR6UQGpAqSNR
 IG03/p3ximV+zrj4bKbp+Fhx6WC0kB2ywiAXdlFsmDBsjgpIcu7J0gXNr
 +oY6m2uI8dENpiG9MmllkbqQ9+WBuRGzUlW25IV6sVkutNiZS+pazdDMc
 6uUYnPRgxKthYGdD4nm4iZE/sRDmZewFki1d9wMY9y2kGq3xCVOMvRwiq
 6t2Mo2LrWwWSnaQCfAAHbtePKstRiir8fgmokT1Gl2xkgfyyb6+KybQcO g==;
X-CSE-ConnectionGUID: Y9PmlPBkTTKLCZJTCXjUhQ==
X-CSE-MsgGUID: axc+rCXuTlmFw8diR8R6wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61355387"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="61355387"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 02:38:07 -0800
X-CSE-ConnectionGUID: 2RFgEe3OQI+HwxxX/C1LCQ==
X-CSE-MsgGUID: 3ZFNZ/qTRgK5OsxeZu1Apg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114201895"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 02:38:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 02:38:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 02:38:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 02:38:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrPmMQJLx84bxoMhONsrv2aHHtQ26letsNwcbHSRWkGnziGDeKmHpcZN7hMdTuzyyL019jLXE9okBBgOUwtsQJtsU2T3+iT7YKjkQ/5c8ahnSAroRqKCpOVPvXglNopoM9TAv7b5ExJVaupN5tanoVut5qsUTTJQ+gAkjVprxC5rqKcBrmO+39UZGa36HwnrIkVrsdcT5OHzUKOLv3VvNzUZwnNjkAFYQpFvukdAXYtBsMWCAeTTtsoefDa5KBR5hqwGRskku0eW86/aic5YXVTPMXXwhDQNur5KdDIb7Ja+PJrLG/pAN5ZutHy64rAxBRcztAt6HKUBEvDFZnJu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1S7yV7Wd1sHgPPhdQ4jgxbfUGgcPsHkVgz/egAlqzs8=;
 b=dXj3W+lDxEtQunpiHcpVYllk2XWTCjvK4QyQj1lVftucplWUyUfOO8mPRGTh/fPQaArM+NvLsRENQy04VZNndafTPGnsohX7j6s4hGaOdkUltCqCxDKqHXNFehWlJsW+t1Wm35B0LJRYOQVxdeAXN7nv+pFZkhEpGcOJ5sMgUkZD6fHjKv71RR/3n3Y7YGBNgjaUTCWUBA56m43vPydw1kwq+SUtIbLOqO3RRcgvrYsOtVmXe6ksdm0YKscSXFZY4/H8GpAafW3zQ8uPO1HzbF3aFoGKi+KeJoqRg3/nVJJKoVng5f+z/qtmo3llSZBaxO3ooY/zJVE/MG3eS5H7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Fri, 31 Jan
 2025 10:37:45 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%4]) with mapi id 15.20.8398.014; Fri, 31 Jan 2025
 10:37:45 +0000
Date: Fri, 31 Jan 2025 05:37:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 2/2] drm/xe: Move VRAM manager to struct xe_vram_region
Message-ID: <Z5yn9oxNNd0jeD1j@intel.com>
References: <20250131100913.659082-1-piotr.piorkowski@intel.com>
 <20250131100913.659082-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131100913.659082-3-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MW4PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:303:85::19) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: e6bb559a-e096-4d98-a12e-08dd41e34c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2HpXsq6CviAfkak05M/E2mTo/Oz+OX1scSdZFHAvADTCCgbKagTh67At3I?=
 =?iso-8859-1?Q?r+8A5oFvXYGynYNesOrotx/xr1omkiQeE4JfQikggFnubtjq30/80pQNW3?=
 =?iso-8859-1?Q?AC+0bGff0f55PYTeou8w52ThYbQNnYnqL7/r9xTDWGH/06yP47wGR7vzk+?=
 =?iso-8859-1?Q?TYmXkKHZVtHxrvgq4Jqqw8nq1anZXafh9PV4SuQcgKZikMWLtA4p5dYlNi?=
 =?iso-8859-1?Q?D65xMFepvdrEbpQ2JLZT5Mr1A8JsH3enMq4AKicRx8bIZAtSRnViSuMsOo?=
 =?iso-8859-1?Q?pQTJ224O3UYdJjV0unY3bNBDzTj8H7lfTualzCMPw/xwSvXyIHErZ2huvw?=
 =?iso-8859-1?Q?vtEY/CCzKvJEvfs3TbFeTXjQJ+X/QEbsB3rKdMmmhy+iWG6DcDuiRv8+JU?=
 =?iso-8859-1?Q?M27SlqZW/06XuwrXkUhzFqlu841/o/T8tctzpTmRWgVFgEmc0+0PsoUkVB?=
 =?iso-8859-1?Q?L693oJVI2NbsOtOC5feWPfpXA1NXL8jqTUFupZIsbNXqT4JZswDp5qHLkE?=
 =?iso-8859-1?Q?IilirDu2QY1n1XSJ/E7I92v4Iqd3jnN1g4z8ZNEndHu0lqxxZQx7U2zrNz?=
 =?iso-8859-1?Q?O65wfzzw4Au+5kI9zG8AnUZ4kt1Ag1d691CzsI8zpbguXZddUXk63n7I2o?=
 =?iso-8859-1?Q?p3L4/xpQMajsePYKPgoTHatqarTqYhQZPNS0Hw4JAGP7cjuob4a577y2Zb?=
 =?iso-8859-1?Q?5mde1V7FKI5koVEv3yNqbDQjODk3y19EhZ6XKYlNJpxz8KJ7ziDrie0uRJ?=
 =?iso-8859-1?Q?VEfAlGa7c52F2cVhKrcggYbUCWRLQc9dZlUeOOdktAjEEst6sBlSVAZu4z?=
 =?iso-8859-1?Q?Pda68XU68vCdcoyxM/a9nLd9vhBt/fuwvVEVnb2S1kgC4AnKxmDlryzDHP?=
 =?iso-8859-1?Q?CQZEdstVuxWn7HFo8K/2nv8p3RlG8BWGQoKOiCC4p7NAWggeI0id1ujp1h?=
 =?iso-8859-1?Q?+VyqV/CB09ULLijzrMDoxJ10WsgsNM5VH1/iCMPm0Mr87I6vdNVpxxiXT5?=
 =?iso-8859-1?Q?hyrvwATr55f4UTak3I9xCWCUzJQfk55fn8Rt40cNS5pDpVFqRyRBCAubHB?=
 =?iso-8859-1?Q?jUGW6kHnMxDB0HHGzAH4bO3YOYA57Fd2X9eb9eWOnvHlbVI/jZmqMi67xP?=
 =?iso-8859-1?Q?mUV6uw02ChKfbW67Y0Xc5JdiovgN7+5SfFCo0luY5DOUBJcoW3Hi1X2o+u?=
 =?iso-8859-1?Q?k49rcyo94Im9UsG2w51hBoEsV8/KNAfcvffn6NnJ0AvLqp8s3byKXoPxZd?=
 =?iso-8859-1?Q?AvLxoyobpF1IQlTD+gUmqM4rgIXiX6C0GsgjY1uTZJERoZr1RMZCz6FKaw?=
 =?iso-8859-1?Q?SxPL405H4OO/vGgF05MjYjsczfPoMHFK1iwf9bphjVHJCHveTa3/u+e6R7?=
 =?iso-8859-1?Q?9coAxGSwoN3Anur0AjyK53dW3BINzrhU3QW/tC2KsqkuduPTy/MRwDiLLR?=
 =?iso-8859-1?Q?DQ0TDBF6hy3ov22W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nM6ninjhPRCaSjbR5AEddAzueiLk5QuugbfDIrJTR/bP6dAdoRnr3EEE05?=
 =?iso-8859-1?Q?/8vC7uZg4LLSSsu4h4IgDTWce4Q3VhU6hlYRUUMv9TNMJqlpHVfryNpkwY?=
 =?iso-8859-1?Q?YWP+mTCLwU/0A4pkzMxVfGo4K3TnIEkFp0UOjn24xy0SRGwORVYuZu4p8u?=
 =?iso-8859-1?Q?eICicfP1h/o3TK7p/Z1aXnspMjrHEzFrfyV/kfz83XkKVAQGLnqKlGPAZj?=
 =?iso-8859-1?Q?z1VKdP86PB10DvamGgSFgj7P77ZMJ6Wu1EvwLsOAufmNU6gGkuNcMmYGru?=
 =?iso-8859-1?Q?JQgxBeJCo5rahw6iQwefhWHFkXdMvDq6LawpS0rcFizisSkuoCWqd+gLhP?=
 =?iso-8859-1?Q?1F96B8CU07URQg2ESP2qf44SvzxpeSdt/0oTEUnFH7zW0PyYJvboouSloG?=
 =?iso-8859-1?Q?CGdri2rZATWbvm26rXDEGNxFe2nRuKZ/Z4ue0GIdNZECVdLUPF6edlR4yC?=
 =?iso-8859-1?Q?RZXkR2j9Cxg1aedkSIb285akqeoEOTFc4k44umundw5lprkIEvtLaPeHz7?=
 =?iso-8859-1?Q?aVCpSjdL+0mukLSR8eTNl91CQs0HnLpLY+lRzp8VzyaJUbvO1E2XTYq7lN?=
 =?iso-8859-1?Q?VoEEoUKVwoAxOZDx0mEHSslxQT2GJ3EwhSsk0SZDuvVbcYjMWjvbsSn2zS?=
 =?iso-8859-1?Q?Ed2y+dsy9VDh6xD9RHyqzTTIVLUg+jzh+K+bAfQ7MApOEdwnl20Tr/3oeo?=
 =?iso-8859-1?Q?/5obIm0QAo7JKpfjRFABwkCEnmkZIuef/ItjnL5BspripyujzwIm0HdG/L?=
 =?iso-8859-1?Q?zHqSC5Msj8ppiFUAhrGXVLqqjohjaR/CfEIkbavJwuEm54Vz5k5SG8eykr?=
 =?iso-8859-1?Q?20tVniqL82PZ2N11+8KUnGdS9hGiPM46fGxf9IH/+2XBl8m1PXkUSrff4B?=
 =?iso-8859-1?Q?ZOC1Ht9qoQgRLK84uUjeyIE3EU1mmxEwAoiKE328KtAf0zBfviIvhOT76p?=
 =?iso-8859-1?Q?1rcAVQv6E4hfU3sg7GE1NY/zG2eOOy9nU45vs3TYJQu5y5ATYgDjDWcHh8?=
 =?iso-8859-1?Q?K1S5MYnsttNEoJT9aJpBx+NZCiilF8sVfQtavLK1ipPy8n+MTX4wELS+nF?=
 =?iso-8859-1?Q?NbXSMxdPz9884e/k7C+Zf6TZf+MND3gHZ+5cVlDVppoeN/uFRX/J9vmRwg?=
 =?iso-8859-1?Q?7wSbFj3oLAflXzcZ/gopuUkHiCF2LFKcZOQENCBlMEgKFyaQNQ+zgPJZdd?=
 =?iso-8859-1?Q?HhF/cE/BqJ0N7wzwNZoPn+4O8xfZSRK4s+b+ED3kEx6bqYSXqAG/LmUj2x?=
 =?iso-8859-1?Q?xm1HtUhM/nFixPsP9yo/AP/jRKnGikzGov8gc35pf6bKTEuOnbJQahxsk6?=
 =?iso-8859-1?Q?tWbKZXDN15iDqyJ6v4fxpzuI7cn7nYOUGfVlhUl04YnoTiJdvFqCDgUUay?=
 =?iso-8859-1?Q?8beGrBiN/PGCkkv+erZycpXbCKycR4PReNAd34gKCgl5sJFOoTJIousrNz?=
 =?iso-8859-1?Q?FhMGJg1pYOxljuubjVG/qTlHtS+6/PAhf8Lt/6e9KVOBIDr8gUPEpAD+b5?=
 =?iso-8859-1?Q?dF2/BXahZQEA+Fz2NL6bajn8AAyFPNJP2PuwLa06BKAdRw1Lm3hDEARbPA?=
 =?iso-8859-1?Q?YJf2cZDtLgz8wq3kVeSDFtS5vosuuXsI/2iSHUoprWhj+vVBGeR4B/FPP2?=
 =?iso-8859-1?Q?/Owp4rK+GExW+rmDRKYzJ2X6yB6F+JbLJ5wOwef6JeRPyAnKR3/eraqw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bb559a-e096-4d98-a12e-08dd41e34c88
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:37:45.5774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkiUHwNTGzGU8oV/7GUZZ/x0TeY8rnNnuFaEzoUeCA+s0+uv3x0np/CKaxfU69xT1VvQhdwWluGGjHzVYydSJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
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

On Fri, Jan 31, 2025 at 11:09:13AM +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> VRAM manager is related directly to struct xe_vram_region so it
> should be inside this structure.
> Let's move the VRAM to struct xe_vram_region.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h       | 5 ++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
>  drivers/gpu/drm/xe/xe_tile.c               | 6 +++---
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c7c285c6a6c9..a4d998add4c3 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -104,6 +104,8 @@ struct xe_vram_region {
>  	resource_size_t actual_physical_size;
>  	/** @mapping: pointer to VRAM mappable space */
>  	void __iomem *mapping;
> +	/** @vram_mgr: VRAM TTM manager */
> +	struct xe_ttm_vram_mgr *vram_mgr;
>  };
>  
>  /**
> @@ -198,9 +200,6 @@ struct xe_tile {
>  		 */
>  		struct xe_vram_region vram;
>  
> -		/** @mem.vram_mgr: VRAM TTM manager */
> -		struct xe_ttm_vram_mgr *vram_mgr;
> -
>  		/** @mem.ggtt: Global graphics translation table */
>  		struct xe_ggtt *ggtt;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b1d994d65589..98e443faabdc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1560,7 +1560,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt->tile;
>  
> -	return xe_ttm_vram_get_avail(&tile->mem.vram_mgr->manager);
> +	return xe_ttm_vram_get_avail(&tile->mem.vram.vram_mgr->manager);

I like your series, but I didn't like how this ended here
vram vram
manager manager

Then I went to see if there was something we could do about the
xe_ttm_vram_mgr itself, but then I noticed it has pointer to
xe_vram_region inside it and I disliked this double pointer now.

So, if we really want to take this path we probably need a bigger
refactor, or this can bring more confusion then help.

>  }
>  
>  static u64 pf_query_max_lmem(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 2825553b568f..b13a0ec7c296 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -94,8 +94,8 @@ static int xe_tile_alloc(struct xe_tile *tile)
>  		return -ENOMEM;
>  	tile->mem.ggtt->tile = tile;
>  
> -	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
> -	if (!tile->mem.vram_mgr)
> +	tile->mem.vram.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram.vram_mgr), GFP_KERNEL);
> +	if (!tile->mem.vram.vram_mgr)
>  		return -ENOMEM;
>  
>  	return 0;
> @@ -139,7 +139,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>  	int err;
>  
>  	if (tile->mem.vram.usable_size) {
> -		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
> +		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram.vram_mgr);
>  		if (err)
>  			return err;
>  		xe->info.mem_region_mask |= BIT(tile->id) << 1;
> -- 
> 2.34.1
> 
