Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B22CAC5B0
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 22:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF07010E1D1;
	Sat, 27 Sep 2025 22:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b12sy0YI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF1B10E1D1
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 22:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759012197; x=1790548197;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mv6/dRG4WVct6spbvUWSeHs+ct73tnYSZJ5pMW444p0=;
 b=b12sy0YI5Fl6mNWQRXM1MiweJKRoPltlw1s/OiVP98UlpvLyfCY5V8Yc
 YZqIU3UySTOjMIei0Y46fIa6sDAGJRvY/euwzsGDM+bpmLK4K0s4kD/lN
 NLNoQvWoWZfvna74wk4ANMBdaVhafM964kCZTlir2cUe4tdxCv1QTqy6c
 3kUDlv6qILGIz3/bwUsbPaCXOvY8ZoIM9xE5AG5FeyNPvTuL/1ia8ufws
 yl+dXAEjvQQcAFYNvLTWNs9G570FYDMk0DwrVM+pauj7qGwXf2wJ67N9a
 wHFRHDyFGBVjiq09t05CBNMRfLSMCuDS8PYYJTKt08fkKLKBf1tL51lL7 g==;
X-CSE-ConnectionGUID: +cVuGP6mSLSEe1ADxzzMcQ==
X-CSE-MsgGUID: wN7n2A/2R7ifC8HIqpr+jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61412038"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="61412038"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:29:56 -0700
X-CSE-ConnectionGUID: 91fEvs2GSCaGu0ETNpr0qg==
X-CSE-MsgGUID: WVLqlOgkTdubu+gjwEi8iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="182195168"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:29:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:29:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 15:29:55 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:29:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZQrY+I0Tk4aN297KAaM/TSvHVEbzGWDoeKt33qlAosRSj0mgxEGVxsmrFaMtlO9GgEROst1ZY0Ti+nCKlgedYmN/cvpkXB38dBviiGJOnWOP3x7AUO0OXMCnOiUEBOeCFH4dqFBHEvD6YgtG2141ykRewvuzuqWBtGiu4GimgMksVNlUZrhnOs4Bsvnn2Do/CtTzD4k/Lf41VjdO9eT6Esb0o80NNjPaqN8nfI5PQzQkTjtA1kSMYNgDUZyc7yikMe4Jgf69+F0R+OsnqW95Ha/QOBPirPn/pwabYUD0h7SYmE6MLc1RzaWOiW6FJ6n9L/7PwYCFAv9tQW5BI0iFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5i2M/0zAx+9lPF6ZDzdPV97sCl46uENP5qBQsza0mig=;
 b=JshUAMT7t12i4ZYcrZHHLECuEfrPfQztma3tzZQfhW1CQB/Y6+tezWL6GDhmO31YQYO7ca/0VKsSxSmdtsTBtRa0Dnmmd419LQS2GoeBpKU0FFLnv191CQzfA22Rd8YTJbNM2KOPDxO/lW/IgmJFroJgJWp2uex6wnBKK4jj82raJ7il/VzeOSOjXpLXUsAVVtWq5h6BohkeMf92aaN9ua7FHGs+SwsqawA7wc5ZMnRZ9pz7YiX3QorgaVnD8K9w5rpXjNvXNaXD81aTQClDQVg0cTr41/J1WiQJF4LHav+04PJUPtdmRKmPCxsuN5IJc4a7QTlHMs26+VoAkVzBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sat, 27 Sep
 2025 22:29:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 22:29:51 +0000
Date: Sat, 27 Sep 2025 15:29:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 22/34] drm/xe/vf: Reset TLB invalidations during VF
 post migration recovery
Message-ID: <aNhlXdfzlCHREzxE@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-23-matthew.brost@intel.com>
 <75b42874-6628-4f4d-b7d4-4f702abfd46b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <75b42874-6628-4f4d-b7d4-4f702abfd46b@intel.com>
X-ClientProxiedBy: MW4PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:303:b4::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc0a2b3-6c48-4a92-6fdd-08ddfe156009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vXHLK2BkXMBgWZ4dQHclUE4cC6aI3zzK1ClIwQJd1rWdPbfuZImjR1a6p0H3?=
 =?us-ascii?Q?SriiAKvSTMTpk98E2/2SdNd3Ig0rxvC0U1ywM1XjXlZWmYx3FLdf8HK3qhxV?=
 =?us-ascii?Q?2DRAHtEUf33OSwuY0YKvuXlFOH74O8jFumI8u09toVEJmDeLkveljpVPFSAy?=
 =?us-ascii?Q?skuRwc+ThNxTAsHOlf8wtcikGbYH70UJciB/GVt1uvIhnfGXCwv/vk/VlMBR?=
 =?us-ascii?Q?C6VEP4q3uB3GeFWhDUXT2Xrxl4KykzwqbYrPzPVwX94dRzOJhQg0Wm2q/M5p?=
 =?us-ascii?Q?Qn+DJsA8O9L9719j+MA+kHquXnAnGwJhGfkIuGAIG8tkyEUeoeimd3cPhRTx?=
 =?us-ascii?Q?qElH6sxiCBGBcyQXlYUtnKf772uvqKEv7jjjnLC/twMGSEcoVki7cNZrJOuV?=
 =?us-ascii?Q?QQrgIrA3DvGx4lvQY9yljfYPsCu3kllPWRxG2XKdkbsxU5OSdumT3z12WUpS?=
 =?us-ascii?Q?W1I8L9JH33HnF3BC7s0g99YUMEPCjW8yJM8B6DexQetLnUdwmpC2BLR3FWJM?=
 =?us-ascii?Q?Cj7ogl/6mM8U4tlDT1Wvsm/LY+LzNCY2aadqiyOnuiHF/D1xV0FoA02xkBEh?=
 =?us-ascii?Q?rLVSIq+q+WJuh11jP7n1kCJaspLOv5aWUszT/8d4LpK5SWQ92s39H2nyrx3Y?=
 =?us-ascii?Q?UR+/aq3/h0AJ0k5KEnTNKyDPBiEVSYXy4Xni+V7vUKM3NMbSyh6bI0RRN0CR?=
 =?us-ascii?Q?fE4hwLcTtWE3I6dAAtphXJglcQ1ZcR6eecGNB14hhv+Aej2URXw9PtESYhb4?=
 =?us-ascii?Q?GZMn16dPj0PE8d/U5cwDhFzzzjC8nK0eIGnu108pBL+c3l+S4YQvDd7+ozzx?=
 =?us-ascii?Q?mq2Xxjx5wqpTjYRr7pEJ109d2UIKPfckQZwGF9Zr0fPLxmnuw/ZPb8YfOVD2?=
 =?us-ascii?Q?nglASoB7RKG3eLFE58k/GTemggvd8DXRLQWz3rLBc703r8GTiMAlfqnSrF6N?=
 =?us-ascii?Q?nvuk6Up/tybfX2s7MG8A6h8dyE0EeK0HzOorgr1HCy8QYQLtaXJpXgukvucC?=
 =?us-ascii?Q?dgsR8SwtPm4sg2J5t9GB4V50MhdYauEJVHRklMqEOqKmJQqtz3LKCL1fpo5a?=
 =?us-ascii?Q?pe1rczeFOd3+s+aWPiv93xCGJai0qPrMSdouWeZEAicef8QvDI9LpxSM6M7O?=
 =?us-ascii?Q?EmFfNeNr7bH3Nifqn+7OZoB9ZAYVzZPh2me6JbQ8g1Rr6nRlfOq1UY0AB+DP?=
 =?us-ascii?Q?Mb6AsLyR61bx8z4rLzTnjxpPnLd91cDYgLgBDnUhybtv39MJH9zeu9QWL2qs?=
 =?us-ascii?Q?wjlyga20fleRhSX4+4qOV77cFlh5lnWTRKdNrnFF0Cj3YynhEncRsSSkAcDa?=
 =?us-ascii?Q?PGRaU4nIO4khLg00zAga4JjY0sPG69HjjqdZrj/BY5hGhF9Eo3AtRu+y70n0?=
 =?us-ascii?Q?VVrR3I5HFWup/+IDLwwNuBPV1ISdZo/6ZNvbPxmdhNMx2d3wPBSZhWE6Dlan?=
 =?us-ascii?Q?7FqumAyIjEYrpKSLG5Tw3OgLmvEbo1B2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zetLh02sQZbuWgdLat9AUXUwalhjgljHtPR3D0DNG8GG68HVXfumsI/5JAwy?=
 =?us-ascii?Q?wvhk4gT4dioh/u2rGpwzMhbn7HdN756PNdB0BI3p/8EHWBlmKTw4BoleH8zR?=
 =?us-ascii?Q?5FQvFJpxnGa0D267SvbjX1I3Vrhd7AomicS3XipUXr1tiEG/RzjNzsV35BPC?=
 =?us-ascii?Q?3pemeCbf0a1vKiK0AkAagoLzl8wPmWi8gFvoklz4aV+MIFo66KS2b3JuB2ue?=
 =?us-ascii?Q?azx4flVSLIXELEo/83AXj4Aa+yZ5odOEo8ECh/pNC33k/wUQqTYbahQnxYJ/?=
 =?us-ascii?Q?GP2wphxkuoC8pZvjj2QiXxQ6vaTmTAtT2UnD/3oTaZi5N0SHi/DB9ipRe3DR?=
 =?us-ascii?Q?4H9L0dOhrVUoGHECQ1783u71BWN/ZXuFJA8QOjwsKG2ztEAIKGCEKPb8JBw6?=
 =?us-ascii?Q?7KkukjcK+2voQ4FXL8fm1GqUVyqjTMtPmdd1UrpoBj6sqBqlEjAMSYYy7SiF?=
 =?us-ascii?Q?aYjZrL/KeAnG/uGYz3DeTdVzvThXHjyxz5gDnTJ70bx1fA6JfL5RiMaGVdgm?=
 =?us-ascii?Q?Bi1PeUJAvfIQC3bPJcpiX/kUR1GcqylVnQNtuGXaRlStOb8rsq43CPyPzcpP?=
 =?us-ascii?Q?8QL9G4Y6JlYwq+Myh0/2xid4b06DO7wuSJ+1qIQMCSbSgYVsUhDFXPMgSnql?=
 =?us-ascii?Q?u1yVspvaZL4eV8pX9ImGjNzXLxoiTU7kLV+ImXRPIRCFyYm+xepNq6TK1Km5?=
 =?us-ascii?Q?P0cKgeiZ/BbiJKKRd9vFzjOI7w80x5mpgz2AqcIe69/Q1/Bc9iVSPNMtYuyl?=
 =?us-ascii?Q?Kqou4qMfmz8k+WMbhkwODxMecMgKiF/PAWBYHoilN9X3L0aBg/Q/4bFmb0E6?=
 =?us-ascii?Q?seiokYD3IH1EK9DPWp25s+ArhQpfLuMqSbOWagunmVHrbcCdwW7xE7wXBIVC?=
 =?us-ascii?Q?YhJ5oIVgGfcMQl8cmzxBbYPgv8Xadq7Ri1oXqUYYts3l47HLFSFPwVGNaHNy?=
 =?us-ascii?Q?ZCJDVRRp01bb1oi6/AG4OFNHYCGBfNspEC0rBfJD6LakxGLBZ/LXClyk93pB?=
 =?us-ascii?Q?+lJ8fcQVuGFJBeW6vgEMUC9w5yMMQTwuSfM9XrCHC1/u9Fb0pleJA2SafMB1?=
 =?us-ascii?Q?7TK94GHanmOIxQTa3Rl+ItXCvgAQVjJEMrn16tgh7rbrgUWeeIYwlMJ46PIf?=
 =?us-ascii?Q?oyiqPV0loGWMrBz9Bf1I2opusYPgWnAHhkboGfFaCVDMWKEAST3GZxRh/66K?=
 =?us-ascii?Q?gqynkpHg4ygqHSi3naoYNWdS+mhJ7Nni/l8gMeL8CRZL1hWMaxBA/kLM0pT+?=
 =?us-ascii?Q?HjI8cftVs8xfOdx+jRvnCUr6h8v73H+UvD13I1hgoQgxxAzaYKcApxCIGdcv?=
 =?us-ascii?Q?yRV6M26XeanoGjcHRTPJxas0lXFg/dGPPFnmUbpTkS6z8q3q1AmvenKlObRG?=
 =?us-ascii?Q?d3gS+je+BzlBNwKJeoR6mL2hCupuB9piNgq6Q2wtutLw+wqGv285htMnblID?=
 =?us-ascii?Q?W/Z9meggj7z2HWc2rt+hkHwqdDvQLSIjuaE8575Trg2+wthAsyiQ2mKlY4lQ?=
 =?us-ascii?Q?nltMoy79+1exRuDtk3BkUib6NZVvKNmiRHUSToh+ou9qLFZkLUioINgkOs1D?=
 =?us-ascii?Q?BA1Zmyz7NyEs3bQLPe4cu9d8ilyNUOxHtp0DJejp0qys5tnnceocLeFLYAV/?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc0a2b3-6c48-4a92-6fdd-08ddfe156009
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 22:29:51.7511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVO+qN9QaRAU7jl4kNUgQUs8z8m5OU/ywvD1YJJTArFZwQzxzu2oejiHLyClLzSb7meTH72FQyf0bIvZ76VSNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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

On Sat, Sep 27, 2025 at 05:43:57AM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > TLB invalidations can be lost during VF post-migration recovery. Since
> > the VF has migrated, these invalidations are no longer needed.
> > 
> > Reset the TLB invalidation frontend, which will signal all pending
> > fences.
> 
> Can something other than timeout wait on these fences? Because if they
> trigger

The hardware via a G2H - xe_guc_ct_flush_and_stop find any remaining
G2H, the timeout mechanism, the CT channel being stopped or via
xe_tlb_inval_reset are th ways tlb invalidation fences signal.
> 
> additional processes, then it would make sense to wait with this.
> 
> If this can trigger submissions, then doing this after submit_pause would
> make sense.
>

Yes, fence signaling can trigger submissions. It is harmless where it is
but logically perhaps after xe_guc_submit_pause makes a bit more sense.
Will move this.

> If can trigger even more, then moving this to `kickstart` (to after
> recovery) may be a good idea.
> 
> -Tomasz
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 071c2c5e0d0a..01399a871f12 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -35,6 +35,7 @@
> >   #include "xe_sriov.h"
> >   #include "xe_sriov_vf.h"
> >   #include "xe_tile_sriov_vf.h"
> > +#include "xe_tlb_inval.h"
> >   #include "xe_uc_fw.h"
> >   #include "xe_wopcm.h"
> > @@ -1187,6 +1188,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
> >   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> >   	xe_guc_ct_flush(&gt->uc.guc.ct);
> > +	xe_tlb_inval_reset(&gt->tlb_inval);
> >   	xe_guc_submit_pause(&gt->uc.guc);
> >   }
