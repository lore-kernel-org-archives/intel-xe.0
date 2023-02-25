Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666FAC6FA8E
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A9710ED9B;
	Sat, 25 Feb 2023 00:32:31 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F9A10EDD1
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677285149; x=1708821149;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JKZEjO8myM7AP4mvNJ2NURVd6pd6R26kav5cAF8yNbc=;
 b=HPveMNpUrMIGAHEIPTDekN6MlgwhMXUUwnCmLW3V1CP5hz2YTG5aEh6/
 S3ae7TCo+9QzcFgO8Lz2xjkYBKhF2MAOoMajVUCHOHeFRJHHHyjgutbeX
 xe2fMhHMNLejWRJ8LkOoBGJGXxzN7l8+Mf2twiuym12rUXf/8Cld63xqP
 mNTDnQNZwF0kqchn3swGLYS5pxHP3MUCyVIF+0wtifwsO5HHjcVvEZl7Z
 QIsZ/EzPhdKnBT9Cp0K1+xJ0MLLDSehsQCW6oQ5RxKfqDe9pKk/gsLjrI
 vt+5yvV6OddFohuC7DprirrlsIOptEu7EvbGXtEcZdd+p9Cu9pff0gtTW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="396120581"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="396120581"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="675122851"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="675122851"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 24 Feb 2023 16:32:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:32:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 16:32:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 16:32:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWr0WIK+oVXBz9+4uRqSL1VGUyJCE+JtWS5XZH/wmIl02TUQe7lpSIfGNIC8P3lr4zQ1BCe301n3TBXIv9dG24GkiW0eNSqdOLs6qQeJftVBRygxFtlO7kk+epxvbrWU1MlWrUo82h0gw4OAkBx2NCOfQe+w7KL4nRdpm5hwhZuzZyJqKtNic49fK+HKZGH2CbZ/nHstaYqRAxofpq7i+WuqAf4ohHU3MNfBFq1P1bKtfJYrBgApvdEezuBxhEq9q1Z8nDoIvjBlSATlMTviuycpj66Uz3pjAWC7GuTD955LYFnk0sR00JRIT9e1MON91rlUFOwyA/qtYKTwiF7qrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcIC4brpszBzbfGbhws323aajGUM79GC/IGLgiihkTY=;
 b=W5jhSZDLn14zeWZMlhvisPQF0C3gk3asqRsiRyKZMKcrXDJaO08IPK+X2KYg/unW8Ngv4xoiDhIZFZGBXjba6tFdrOZrZ6fea8i1ZveKmu0hM3qkikVq5r1OtZ+x055c80f411vDPMZCM/BSgIIpzly/mmgrL3MfswyswygtGFEDuLYmH71y2i5pZekovL53Pq8MGUZL6FWKXsRjh0/iDm3xgjnMvvcj9nW90461QuZH0VS+CUsUZds840foVe2/JM9dChGlb44IllQnlU6CK2r2bXIZs5F5UKoZ1iGG+1PFCMtwEST9Ko1fTHg9f/0ifgf3ot9e6wE9aPML0hofkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5466.namprd11.prod.outlook.com (2603:10b6:408:11f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.24; Sat, 25 Feb 2023 00:32:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 00:32:25 +0000
Date: Fri, 24 Feb 2023 16:32:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/lXFhtKHQ+Cq7EI@mdroper-desk1.amr.corp.intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
 <20230225001548.1743820-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230225001548.1743820-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ee1d4c-fb36-4c83-f037-08db16c7c411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fiA/vXJ6wkMex3Y0x7v8VJPwTZiBsYNQV9y1nZLzNtBuzcUVQgucoTguMj2BCj+TzQLubTSfmRgsx7N6h2vyt6gbhySO4/02WKvDcat98tZoO3b3nTDTXvjGMHMc1Gs2FoYeVjixY3Z1eiBGfYCXb5GEpTS0j2CoH1kXdvZspbZPcgtROuTaF/paVG8u+0FSD47ia7s32Rc8DfHmRLwP22nmEqNrlTGmSSolfkHHk/eD1N1o17sqldrZ+JSPguPBRH0fJWZcrI3AcxHv0kSZ+7nfBulIahkrEQohIdEPXtUV4qYT4OGu27SAz/WqBcoqIYG6e0LMTNPPnbZhO0Fphj1NnmbHxCHPvpLGHaCLWQMg7nmF2zm0sxOV1+cVze667BX8OJgmF/7NYxnL46PQ6HCzEI4CEGtSpPd1at6wua43/8HzaOZw+VfGmMTZ3+0wvf2ll7iDIxE04gpkDH/XI8q1pq0khIN3SEMnMHfCxuWGgc5LNXdDwSh51mzK5E/XuAwChg/yq4a95r4nChVIWO8KFxzTiWgVbVcAbNGGdeLBoMCUhM0ceB9xBMleKWGWEjxiJBjGIBfYSkGiG3CPWPIE2LPKpsU60Fd8Sq0YjKTXxao48SCXBpb9jY5L9MmqJV25uAvnjTM1iPx0xAqtoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199018)(38100700002)(83380400001)(82960400001)(30864003)(86362001)(5660300002)(2906002)(8936002)(6862004)(41300700001)(6666004)(26005)(186003)(6512007)(107886003)(6636002)(6506007)(54906003)(4326008)(8676002)(316002)(66946007)(6486002)(66556008)(478600001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Czs4896JuytyZ3qXLbHfh8T8HjsmAJGIq0GUQFdjenGp1tBHBWLiP1RdpB?=
 =?iso-8859-1?Q?g+38caEe8buJGrvikUOfSapxFWWgbST6J1PGFkts5P2dUmz3ayJ586751s?=
 =?iso-8859-1?Q?XLPT2doubOf8vYUgQMYCEQ9S+fbLRBA6DMd1QViNjLmAOiRjnUxJ8CdYSC?=
 =?iso-8859-1?Q?BrCtpZ1XdMwPuZ8FmeS/t5QbDyvngBt5qJUYjGbP+snj+7aSvtYGUEALB7?=
 =?iso-8859-1?Q?41wTswW3cBMWz4ATcbeDqHecbqW0t9F1D/LlylC/59xV/l7eqZwQuvQjLO?=
 =?iso-8859-1?Q?InunbGOqbW4rid5JsriIAQjW8aL0PiYD4R9a2f48lrjPB5rojO36sdEKRv?=
 =?iso-8859-1?Q?Cy0SX9SttRcdYh9XtSfrK8uxB0s5HTtfq6EOFQmc9X/PdT0DfUZKCC3L7y?=
 =?iso-8859-1?Q?5kTOINUY0DT7R6A7NXIwcDfFGk/FnqgzBq6e+Bu4pn2rH7BHABfrta55hj?=
 =?iso-8859-1?Q?tSBYhceIQ4Ji34uRlWRG5zyPqB64HttcxDaruyklR4+23NkGC82ZtEv46k?=
 =?iso-8859-1?Q?f3hw8rIOgPnT1Oyd1F5Mp9vpaUJXKpfmhC2M3Vs0tTlKTz7Q8EQB5V8u9J?=
 =?iso-8859-1?Q?2QIGVxSYHpw0kFkRl1z/1e5Rd6K4PB8w7ZInMtrEHVMe8w/CoVtbDQClPe?=
 =?iso-8859-1?Q?mc4Ck4ypsTxJbkwVn3QkS1qiweoOXuYqzqGf1ork4dsKGaTe6mAsfK2/Z1?=
 =?iso-8859-1?Q?dm7I+zGNLDxatmHI+BMIoe2kN6JOOOUSzd9H/BgOCG2KE8+s0FRL0TRW7u?=
 =?iso-8859-1?Q?HV+euOf9CXIUL0bxD1Ykubcc9KSSR8lfZ6oKP0fFQ7cls4IhdmLr7HFkYz?=
 =?iso-8859-1?Q?nesF9EXXVsrrrHsNt49hSxa0Aq02kzB4IZAqk9cti/V6PSo3tj97U+tmoK?=
 =?iso-8859-1?Q?Q/nOyWHGVALhsx1oEJb4qyWLo/DPOJrWrVKHDmLTS7hDLcdsK1nbhWz9h0?=
 =?iso-8859-1?Q?BG2PTOhpnH1b80ycCMP+9csSWNBJOZyvFhJw1gqDNQWTm6NBSlOXPaB4AQ?=
 =?iso-8859-1?Q?179NmcbAttBhb3CfyDf6Y4aF9nYvhRIBwYqSDKOxe63jWH3j55A8pZeyGw?=
 =?iso-8859-1?Q?e7/k+e2l6shIQwxFiFx02SXhzKE5ya3nMgovae0zCoKVCDUy2D3SQzbAts?=
 =?iso-8859-1?Q?itI0ATcqnCrSgN2lZEVOsFRU1Nz0c6EXKffCM2G/rwMzLmr5RsQtJIEz+m?=
 =?iso-8859-1?Q?OJEy+vuLH6F0osPyTRW7AxbDEtc9LSQCPYlfq7mQkJHk63lXOT6M7d2fsV?=
 =?iso-8859-1?Q?NLUidg3fNwcgEScE5scGkr3VKVTkipAsYDYj7VzAms6htyCfvRKA15ZM1j?=
 =?iso-8859-1?Q?k6qSLgx+O8uZ/g6UjsS0cng7zXXyGKJDLfJwHpt8s42rCpefFRYNInUWqA?=
 =?iso-8859-1?Q?HiZeQSCV7k47RqgimKK4xCvVXkslTi8dflYOqoitBZaCnF1A1Qv9PNtH8X?=
 =?iso-8859-1?Q?w1uyT/nXjXvW8v9qtHx+tVZlW66dmoFbIb8NFVFABarEcCIZCCrukDxfIm?=
 =?iso-8859-1?Q?QB3aVt+7/mbe8pNXdCP871ZOpemU4GJd3wMPFPnbUcGY3ZPFN8xKmloItD?=
 =?iso-8859-1?Q?kuYEdhNTc9xA/pc+SBVctvWc77QKiizObgTgrlsfCLfsrUnU1Mc8+FjOUi?=
 =?iso-8859-1?Q?P/YuvpnwhUFf1rXocpuBXYFHSIi4YBUiEpo9yaKWkA0MnbQX2rGOH9qA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ee1d4c-fb36-4c83-f037-08db16c7c411
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 00:32:24.8588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z92S67FOIvxDRsKD729nttalSO8NfYCGSTlAHq6PpKpVOGONu5HVYG/TqeHbZpSSaPPmkBywjrTvUDV7+7W0VNxzzL5EATvV9PNSDR656PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5466
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 07/12] drm/xe: Remove dependency on
 i915_reg.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 04:15:43PM -0800, Lucas De Marchi wrote:
> Copy the macros used by xe in i915_reg.h to regs/xe_regs.h. A minimal
> cleanup is done while copying so they adhere minimally to the coding
> style.  Further reordering and cleaning is left for later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h      | 111 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_execlist.c       |   3 +-
>  drivers/gpu/drm/xe/xe_ggtt.c           |   3 +-
>  drivers/gpu/drm/xe/xe_gt_clock.c       |   3 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c         |   3 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c      |   3 +-
>  drivers/gpu/drm/xe/xe_irq.c            |   3 +-
>  drivers/gpu/drm/xe/xe_lrc.c            |   3 +-
>  drivers/gpu/drm/xe/xe_mmio.c           |   3 +-
>  drivers/gpu/drm/xe/xe_pci.c            |   3 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c       |   4 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |   3 +-
>  drivers/gpu/drm/xe/xe_wa.c             |   3 +-
>  13 files changed, 123 insertions(+), 25 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> new file mode 100644
> index 000000000000..53f1ed54fb1c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -0,0 +1,111 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef _XE_REGS_H_
> +#define _XE_REGS_H_
> +
> +#include "i915_reg_defs.h"
> +
> +#define GU_CNTL					_MMIO(0x101010)
> +#define   LMEM_INIT				REG_BIT(7)
> +
> +#define RENDER_RING_BASE			0x02000
> +#define BSD_RING_BASE				0x04000
> +#define GEN6_BSD_RING_BASE			0x12000
> +#define GEN8_BSD2_RING_BASE			0x1c000

The three BSD defines here (and VEBOX_RING_BASE below) should no longer
be used as of f86cbd81daa9 ("drm/xe: Remove gen-based mmio offsets from
hw engine init").  Not sure if you want to drop them now, or do that as
part of the later cleanup; either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +#define GEN11_BSD_RING_BASE			0x1c0000
> +#define GEN11_BSD2_RING_BASE			0x1c4000
> +#define GEN11_BSD3_RING_BASE			0x1d0000
> +#define GEN11_BSD4_RING_BASE			0x1d4000
> +#define XEHP_BSD5_RING_BASE			0x1e0000
> +#define XEHP_BSD6_RING_BASE			0x1e4000
> +#define XEHP_BSD7_RING_BASE			0x1f0000
> +#define XEHP_BSD8_RING_BASE			0x1f4000
> +#define VEBOX_RING_BASE				0x1a000
> +#define GEN11_VEBOX_RING_BASE			0x1c8000
> +#define GEN11_VEBOX2_RING_BASE			0x1d8000
> +#define XEHP_VEBOX3_RING_BASE			0x1e8000
> +#define XEHP_VEBOX4_RING_BASE			0x1f8000
> +#define GEN12_COMPUTE0_RING_BASE		0x1a000
> +#define GEN12_COMPUTE1_RING_BASE		0x1c000
> +#define GEN12_COMPUTE2_RING_BASE		0x1e000
> +#define GEN12_COMPUTE3_RING_BASE		0x26000
> +#define BLT_RING_BASE				0x22000
> +#define XEHPC_BCS1_RING_BASE			0x3e0000
> +#define XEHPC_BCS2_RING_BASE			0x3e2000
> +#define XEHPC_BCS3_RING_BASE			0x3e4000
> +#define XEHPC_BCS4_RING_BASE			0x3e6000
> +#define XEHPC_BCS5_RING_BASE			0x3e8000
> +#define XEHPC_BCS6_RING_BASE			0x3ea000
> +#define XEHPC_BCS7_RING_BASE			0x3ec000
> +#define XEHPC_BCS8_RING_BASE			0x3ee000
> +#define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
> +#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
> +#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
> +#define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> +#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
> +
> +#define GEN7_FF_THREAD_MODE			_MMIO(0x20a0)
> +#define   GEN12_FF_TESSELATION_DOP_GATE_DISABLE BIT(19)
> +
> +#define PVC_RP_STATE_CAP			_MMIO(0x281014)
> +#define MTL_RP_STATE_CAP			_MMIO(0x138000)
> +
> +#define MTL_MEDIAP_STATE_CAP			_MMIO(0x138020)
> +#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> +#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
> +
> +#define MTL_GT_RPE_FREQUENCY			_MMIO(0x13800c)
> +#define MTL_MPE_FREQUENCY			_MMIO(0x13802c)
> +#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> +
> +#define TRANSCODER_A_OFFSET			0x60000
> +#define TRANSCODER_B_OFFSET			0x61000
> +#define TRANSCODER_C_OFFSET			0x62000
> +#define TRANSCODER_D_OFFSET			0x63000
> +#define TRANSCODER_DSI0_OFFSET			0x6b000
> +#define TRANSCODER_DSI1_OFFSET			0x6b800
> +#define PIPE_A_OFFSET				0x70000
> +#define PIPE_B_OFFSET				0x71000
> +#define PIPE_C_OFFSET				0x72000
> +#define PIPE_D_OFFSET				0x73000
> +#define PIPE_DSI0_OFFSET			0x7b000
> +#define PIPE_DSI1_OFFSET			0x7b800
> +
> +#define GEN8_PCU_ISR				_MMIO(0x444e0)
> +#define GEN8_PCU_IMR				_MMIO(0x444e4)
> +#define GEN8_PCU_IIR				_MMIO(0x444e8)
> +#define GEN8_PCU_IER				_MMIO(0x444ec)
> +
> +#define GEN11_GU_MISC_ISR			_MMIO(0x444f0)
> +#define GEN11_GU_MISC_IMR			_MMIO(0x444f4)
> +#define GEN11_GU_MISC_IIR			_MMIO(0x444f8)
> +#define GEN11_GU_MISC_IER			_MMIO(0x444fc)
> +#define   GEN11_GU_MISC_GSE			(1 << 27)
> +
> +#define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
> +#define   GEN11_MASTER_IRQ			(1 << 31)
> +#define   GEN11_GU_MISC_IRQ			(1 << 29)
> +#define   GEN11_DISPLAY_IRQ			(1 << 16)
> +#define   GEN11_GT_DW_IRQ(x)			(1 << (x))
> +
> +#define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
> +#define   DG1_MSTR_IRQ				REG_BIT(31)
> +#define   DG1_MSTR_TILE(t)			REG_BIT(t)
> +
> +#define GEN9_TIMESTAMP_OVERRIDE					_MMIO(0x44074)
> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT	0
> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK	0x3ff
> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
> +
> +#define GGC					_MMIO(0x108040)
> +#define   GMS_MASK				REG_GENMASK(15, 8)
> +#define   GGMS_MASK				REG_GENMASK(7, 6)
> +
> +#define GEN12_GSMBASE				_MMIO(0x108100)
> +#define GEN12_DSMBASE				_MMIO(0x1080C0)
> +#define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 59cfbeec09d1..be0a3741eff8 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -11,6 +11,7 @@
>  #include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
> @@ -23,8 +24,6 @@
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  
> -#include "i915_reg.h"
> -
>  #define XE_EXECLIST_HANG_LIMIT 1
>  
>  #define GEN11_SW_CTX_ID_SHIFT 37
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 09637f0845a7..a0d672b6afb2 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -11,6 +11,7 @@
>  #include <drm/i915_drm.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -19,8 +20,6 @@
>  #include "xe_mmio.h"
>  #include "xe_wopcm.h"
>  
> -#include "i915_reg.h"
> -
>  /* FIXME: Common file, preferably auto-gen */
>  #define MTL_GGTT_PTE_PAT0	BIT_ULL(52)
>  #define MTL_GGTT_PTE_PAT1	BIT_ULL(53)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index fd0ca33925cd..60a2966bc1fd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -6,13 +6,12 @@
>  #include "xe_gt_clock.h"
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> -#include "i915_reg.h"
> -
>  static u32 read_reference_ts_freq(struct xe_gt *gt)
>  {
>  	u32 ts_override = xe_mmio_read32(gt, GEN9_TIMESTAMP_OVERRIDE.reg);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f983f47cefb6..acaba5c375e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -20,8 +21,6 @@
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  
> -#include "i915_reg.h"
> -#include "i915_reg_defs.h"
>  #include "intel_mchbar_regs.h"
>  
>  /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 2cf42afd97d9..ff6ba0d8b9a6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -9,6 +9,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
> @@ -23,8 +24,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_wa.h"
>  
> -#include "i915_reg.h"
> -
>  #define MAX_MMIO_BASES 3
>  struct engine_info {
>  	const char *name;
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 17e204e74714..ae2f65c00fa6 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_display.h"
>  #include "xe_drv.h"
> @@ -18,8 +19,6 @@
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
>  
> -#include "i915_reg.h"
> -
>  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
>  {
>  	u32 val = xe_mmio_read32(gt, reg.reg);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4435ec750489..af4518a82db2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -9,6 +9,7 @@
>  #include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
> @@ -17,8 +18,6 @@
>  #include "xe_map.h"
>  #include "xe_vm.h"
>  
> -#include "i915_reg.h"
> -
>  #define GEN8_CTX_VALID				(1 << 0)
>  #define GEN8_CTX_L3LLC_COHERENT			(1 << 5)
>  #define GEN8_CTX_PRIVILEGE			(1 << 8)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 5e6ca0d2076a..65b0df9bb579 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -10,14 +10,13 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
>  
> -#include "i915_reg.h"
> -
>  #define XEHP_MTCFG_ADDR		_MMIO(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
>  #define GEN12_LMEM_BAR		2
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 29270cce7a46..11dc0de66101 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/xe_pciids.h>
>  
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_macros.h"
> @@ -21,8 +22,6 @@
>  #include "xe_pm.h"
>  #include "xe_step.h"
>  
> -#include "i915_reg.h"
> -
>  #define DEV_INFO_FOR_EACH_FLAG(func) \
>  	func(require_force_probe); \
>  	func(is_dgfx); \
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 16c56d0a9bb0..4441fe60cd00 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -8,6 +8,7 @@
>  #include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
> +#include "regs/xe_regs.h"
>  #include "xe_engine_types.h"
>  #include "xe_gt.h"
>  #include "xe_lrc.h"
> @@ -15,8 +16,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
>  
> -#include "i915_reg.h"
> -
>  /*
>   * 3D-related flags that can't be set on _engines_ that lack access to the 3D
>   * pipeline (i.e., CCS engines).
> @@ -40,7 +39,6 @@
>  		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
>  		PIPE_CONTROL_DC_FLUSH_ENABLE)
>  
> -
>  static u32 preparser_disable(bool state)
>  {
>  	return MI_ARB_CHECK | BIT(8) | state;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index fe0f707ad054..2e8d07ad42ae 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -11,8 +11,7 @@
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_range_manager.h>
>  
> -#include "../i915/i915_reg.h"
> -
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 155cfd1dcc50..df72b15dfeb0 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -9,6 +9,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -18,8 +19,6 @@
>  #include "xe_rtp.h"
>  #include "xe_step.h"
>  
> -#include "i915_reg.h"
> -
>  /**
>   * DOC: Hardware workarounds
>   *
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
