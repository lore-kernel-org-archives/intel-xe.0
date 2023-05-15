Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57919C7EE24
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 18:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E10810E1AA;
	Mon, 15 May 2023 18:11:19 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C00310E1AA
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684174278; x=1715710278;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4seDu3vcSpQYxYl0MBfTSIsV6gZ+CvBWLyBJ1/u3fnk=;
 b=fDV7ruc+UjgwUgEuF2nqyciwGssZJw1+givWjhjtQTabrqsaPqFZ+CEg
 wB6d8hIViQIinqpWEXPBixJlCdmXg53kX9nad1NitzIsLHFXZbAbNsUul
 JI4etFm4O7AXuUj6nvQkbwvPi4VdB8F6EFNauXkHsgbEBvHGjYNy/HAoh
 kSGnq7w08qQYjYVRSNwFZLpYtf5h+GYACXyQn8j196kO6hSwNtyABiOek
 XkUGt/cvI2Ga/wT1BeDW9bYkhmAmCsDKf10y/La88R0fP0wc6QwqgRAjW
 Z3pZuzenQGpJNviggrc0FrhB3CsnVXnSjyBLMhRNZ7jFbSjln9sjwSF6F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="351306890"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="351306890"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 11:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="770693155"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="770693155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 15 May 2023 11:11:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 11:11:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 11:11:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 11:11:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 11:11:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgBRvWiKvBnCgXYFFZklr3JuUhWCrkmME50CHAhLVm/yP6ynzVwoinQSRnVsl7qfoPGDLZFl78EiuKlNWLUMpe23UJ2DdiSnp811Ho9xXGKvsZhq0vLgyInD77l46WNmrVB8EgKaovGmxw3wWq7Wh4htLQjsypnlPf3a7a1xxfCUuL1/dxWAOpRUJ34Wn0CP9nB2d2Zy/tHvljoOZ/oVEuOj4qtj2duH3IG2+tDIoNi6yHMHsKkFTbYw1edSDx9Wi/+SY1wa3iVEPWiKYveuZaaYSYfvLw0AFVaHGDyepXL9gVYT2YYI+BwoyB5TAHkKv3MpXMnjgn9AF/gZR2YeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZFHWf3MMKrQETHTUNSa545fjV+eJab323HabrcRBJE=;
 b=Qpge9d/rzxH9g5isJEKWj/Ph0im+JN/gJMQxw4R0mt3X2Sl9vZQ0FkmuRPxjzyl7h5eWEbW8sSDjRlK1Yj0cRdQ1MHJoP/9i+eZtFLn5dLHiPuE7MMerm+xkazCHX/ph51gEBK/3sopxInPI5Xbph/gDUhCtUmk0K1LWBnmS4FLmnZJawaa6GqY/DJMLyU/qHWqQVMqJ+FeJoLA3viOdCBpHNo/LviNqvCztJJSf1cFU2E26it7gMWR6AediT4Or8R43Y8NGiphVK+uy+JEG13S3gl55RVZs7wn1hdC79BOGNB3DAT042SEz4YJpP2YIX0dEq5490zs0Okt6dIUU6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 18:11:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 18:11:08 +0000
Date: Mon, 15 May 2023 11:11:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230515181105.GK10045@mdroper-desk1.amr.corp.intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <70299874a6ff739e3606017c8819bf4f267da731.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70299874a6ff739e3606017c8819bf4f267da731.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: b6021fa6-0df1-4fcd-cc9b-08db556fc1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MEJjfHbszsBmuhFT1I+O+emV4+vd2t2FvzTx8IJgvx9WGnSoQOfkSMyinQ9KUu8+gfrMCNjgTc7IGQUrpg9FRkhBQ90qCUq96qVQbUwsDgAcrXkWDVfXFmXTXmlu08JZ2CVm9RPbHO4ec3xdKp9pX1PcHWPTrFRMnGPuUZL76a1MeNtPqojbhGe/odbvOYsVkuG2DtwqMOkrNwDUYrI1ioK76QxizFXEacwUoguyLwvk/E2MYAI5mdsCejdRncx7bEbAJkG+VRqR5g5PdH/ZKhiMo68gWGhC8p6gmWNOq+/EwsljLbAFd5spPQQCIfWFgb7QIigAMXq4qZO3w6nxzOYNEoyRmL0McQ6gvfRm+SYWQiBrkTUXIdy7dDvZhNWgPFd2C6OVdPojuvKtoj4J257Irz9SaC7QyNtQo+azQlwAmMzwiu+hWgYDQXbsMqSlFTpY5bI+rtHzo7bMmih0nUyGQKL9hlSp2KBgnUFX1Z1RcChAGqt9+402hezrfejh5e6k9nDfjlzm/OFTEIg2oRDNyDw+umOSGht630G70SujH4xETsJ5tpMo97rT0cKa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(33656002)(86362001)(54906003)(316002)(66946007)(66476007)(4326008)(6916009)(66556008)(478600001)(6486002)(5660300002)(8676002)(8936002)(6666004)(2906002)(38100700002)(82960400001)(41300700001)(6512007)(1076003)(186003)(26005)(6506007)(83380400001)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qDIVQq1k1jxRsLMo1+1u8sU96YMuqug1qD760w28ISe3hY3+pZ5OSvrJyG?=
 =?iso-8859-1?Q?1hXBUgXlH/qhNMIqwZttToJXyZ6PGhBrMPbixoJdWeUw6CIhZxRUNH9mQY?=
 =?iso-8859-1?Q?ziDWT7tczl3Zyphb9x8Hmmdc0ktOcYx+boMQJ++hPr2u3sEd3ZIcFXQfS/?=
 =?iso-8859-1?Q?7/7Q7do8iYE2zokhqKs2OhIpNq44i4+yJ58qwOz/w37rqgeU9vX3Fqpoaa?=
 =?iso-8859-1?Q?o/fEwvNjfe925gSQaGsw5du65kNBCjY4BJ0q38th8ratEO73xgzhhtuz1k?=
 =?iso-8859-1?Q?RK3RKBi+ttYSjHngaMAzKN/azFlKRISiPEXe5/EO2NxnBhav4h9Z7EA8Ux?=
 =?iso-8859-1?Q?xFInBuLRf7B6ukNu0An+A9E148qjj4Jd/Y0gZwgL9iUAnpTCq7YhkF3u0Q?=
 =?iso-8859-1?Q?7mW5hWptXZClhXMMpKI2N6M+p9iIkHig9WqFywKP28Uo2TCowfO0caSQSz?=
 =?iso-8859-1?Q?nj2qzVnxuuaPDhW9jBo/gXtwpL0YIOHV7H3iBMwfwS1Kl0KYbB/Xh264nn?=
 =?iso-8859-1?Q?9OGtk6KAXfbNxoO+2wwIOV2PIortEf/P4jQx637kqAVi5yqty93yV5nwul?=
 =?iso-8859-1?Q?A2KwIvrik7EPSs8Saoz4aXErbnOHI7Cy74b3YrTUuUxCjLD8vDpQSshCFu?=
 =?iso-8859-1?Q?/QNvJmPL+OL8qvU8lO/JVBUViy9GHsqfxzy2tzJLGfjxDCSBXMpc8NqUaS?=
 =?iso-8859-1?Q?Gr6bh/+4CersRJuTJHEkXWn4rHEK/9X5Jpa+Y4d98cqWbgr2ukNRc3tFvl?=
 =?iso-8859-1?Q?+Rg0ixRhEPsH+Q96QabOavZAvCicLC6LjIrF0+lvm5NZIZdfCMHtKKN2Qo?=
 =?iso-8859-1?Q?QD3nqiGE1uaH7UNOXFqOu6MG/OJIGfBm0CCin5Kgf458eBP4yu+mvgLp05?=
 =?iso-8859-1?Q?uhbn7Q/EJOA7c9WSgDHwMAicsLIdwEyl0aMCd+gvH5qbT4evtg56/Rbwh3?=
 =?iso-8859-1?Q?XUyq2LokVSbAYkQNJ76Aeu/gWB858KGU6Vj5+cMdIZd6/+yyYlKhB6/zcy?=
 =?iso-8859-1?Q?JZiqTaiwNw6w/L7lfhhaDqm5aT/3Fo/6rSWbBaciKDxuhEgXugq3gJsrbi?=
 =?iso-8859-1?Q?8pp4zYJ2CJelXXqUdhPio4wlcw6q5UXlTLDWwRVIira+foOwADkXsOUMhV?=
 =?iso-8859-1?Q?nD8LQwroE/67YREsz3CM6WvoEBluhvH8ATzcm4bJGApNS0YT8Nf5yMenSt?=
 =?iso-8859-1?Q?AjuO6H/5kTvkVue/RDI98/dMDN3S3nqGSaPuNCvLvO+/Op8uqE4V2zX/C+?=
 =?iso-8859-1?Q?3OTJZ0sGpQXCl3rLK+GtQk09Itfvys4aJYt8wFIcNthcwfg+hlKRB5TTny?=
 =?iso-8859-1?Q?J4rEfyz8X/u/N8+xRRy76INRdLAzxkohmR9gZ4ti50tIj0PQODCY9Ox4BW?=
 =?iso-8859-1?Q?A9m08orrt+OzIqAIkX4Nj0Vc/jmSeKfGXtAKHlOnQaXFAPfovkppdQjoOu?=
 =?iso-8859-1?Q?OVBFxKJ2i5YDEdKqKTJyY4yfibYUmH/a3hs+40SmrH9q217ro/dNFwK7Bu?=
 =?iso-8859-1?Q?03V2teN5+LJ599JDViRnbmYfK3c2mQdKg4eK30eQNF6Tm3IQdKv0r13fJr?=
 =?iso-8859-1?Q?YXnFJss3azf6FQTaqUHCK8trWuJYvNSmzXM3PoanowtaUpvg5Ty6rbzCN2?=
 =?iso-8859-1?Q?xa6MRRbcBeRa96tneWje/y3AvGxpvBAtKtDHObnbokH/qZjhkCkO8GOQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6021fa6-0df1-4fcd-cc9b-08db556fc1c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 18:11:08.7284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmBemqc7L1fhHQUF7tB+YEATQMHn9nKRkBgdiPNMyKC39iMNdTYgBpJnbRnWjB+Zyf5gxTLr2DFxiUDv+eKEvGnO3OdW+eAy57qrcY18GV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/26] Separate GT and tile
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
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 03:08:24PM +0200, Thomas Hellström wrote:
> Hi, Matt,
> 
> On Wed, 2023-05-10 at 20:46 -0700, Matt Roper wrote:
> > A 'tile' is not the same thing as a 'GT.'  For historical reasons,
> > i915
> > attempted to use a single 'struct intel_gt' to represent both
> > concepts,
> > although this design hasn't worked out terribly well.  For Xe we have
> > the opportunity to design the driver in a way that more accurately
> > reflects the real hardware behavior.
> > 
> > Different vendors use the term "tile" a bit differently, but in the
> > Intel world, a 'tile' is pretty close to what most people would think
> > of
> > as being a complete GPU.  When multiple GPUs are placed behind a
> > single
> > PCI device, that's what we refer to as a "multi-tile device."  In
> > such
> > cases, pretty much all hardware is replicated per-tile, although
> > certain
> > responsibilities like PCI communication, reporting of interrupts to
> > the
> > OS, etc. are handled solely by the "root tile."  A multi-tile
> > platform
> > takes care of tying the tiles together in a way such that interrupt
> > notifications from remote tiles are forwarded to the root tile, the
> > per-tile vram is combined into a single address space, etc.
> > 
> > In contrast, a "GT" (which officially stands for "Graphics
> > Technology")
> > is the subset of a GPU/tile that is responsible for implementing
> > graphics and/or media operations.  The GT is where a lot of the
> > driver
> > implementation happens since it's where the hardware engines, the
> > execution units, and the GuC all reside.
> > 
> > Historically most Intel devices were single-tile devices that
> > contained
> > a single GT.  PVC is currently the only released Intel platform built
> > on
> > a multi-tile design (i.e., multiple GPUs behind a single PCI device);
> > each PVC tile only has a single GT.  In contrast, platforms like MTL
> > that have separate chips for render and media IP are still only a
> > single
> > logical GPU, but the graphics and media IP blocks are exposed each
> > exposed as a separate GT within that single GPU.  This is important
> > from
> > a software perspective because multi-GT platforms like MTL only
> > replicate a subset of the GPU hardware and behave differently than
> > multi-tile platforms like PVC where nearly everything is replicated.
> > 
> > This series separates tiles from GTs in a manner that more closely
> > matches the hardware behavior.  We now consider a PCI device
> > (xe_device)
> > to contain one or more tiles (struct xe_tile).  Each tile will
> > contain
> > one or two GTs (struct xe_gt).  Although we don't have any platforms
> > yet
> > that are multi-tile *and* contain more than one GT per tile, that may
> > change in the future.  This driver redesign splits functionality as
> > follows:
> > 
> > Per-tile functionality (shared by all GTs within the tile):
> >  - Complete 4MB MMIO space (containing SGunit/SoC registers, GT
> >    registers, display registers, etc.)
> >  - Global GTT
> >  - VRAM (if discrete)
> >  - Interrupt flows
> >  - Migration context
> >  - kernel batchbuffer pool
> >  - Primary GT
> >  - Media GT (if media version >= 13)
> > 
> > Per-GT functionality:
> >  - GuC
> >  - Hardware engines
> >  - Programmable hardware units (subslices, EUs)
> >  - GSI subset of registers (multiple copies of these registers reside
> >    within the complete MMIO space provided by the tile, but at
> > different
> >    offsets --- 0 for render, 0x380000 for media)
> >  - Multicast register steering
> >  - TLBs to cache page table translations
> >  - Reset capability
> >  - Low-level power management (e.g., C6)
> >  - Clock frequency
> >  - MOCS and PAT programming
> > 
> 
> With that detailed cover-letter description, I think this makes sense.
> 
> I figure pagetables will need to be per tile with this splitup? What

Yeah, the GGTT moves into the xe_tile in this series.  I thought I had a
specific patch for that, but it looks like I might have accidentally
squashed it into the VRAM patch; I should separate those back out into
two separate patches in the next series revision.

> about per-tile resources, like VRAM, that is accessible from all tiles
> but with separate throughput / latencies depending on from which tile
> they are accessed? Should those perhaps be per device with a per-tile
> pointer to "preferred VRAM" and a map [tile][memory_type] of access
> cost?

I kept the VRAM inside the tile in this series, but we could definitely
promote it up to the device level if we think that makes sense (e.g., if
we suspect that future platforms might not have a 1:1 relationship
between GPU/tile and VRAM).  That would probably be worth doing as a
follow-up series though; since vram was already inside the xe_gt, moving
it to the xe_tile (which matches the reality of how PVC works) seemed
like the natural first step.


Matt

> 
> /Thomas
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
