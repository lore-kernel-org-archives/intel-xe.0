Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0A9C77B7C
	for <intel-xe@archiver.kernel.org>; Sat, 27 May 2023 00:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46E810E1F8;
	Sat, 27 May 2023 00:22:56 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67CF10E1F8
 for <intel-xe@lists.freedesktop.org>; Sat, 27 May 2023 00:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685146974; x=1716682974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6d4oyV+SrgaUiduly9FJX7Hzp3IuIvi58m9NemABXgg=;
 b=k593NFazCzoTb6cbmF4ts/nzYrFM9By6lT9iVSqsaPezvtWrJ/8/GC2j
 Oafn34zcuAdvrLpX65D2ZHCbfqrijnmaIYZJEq/8LNM5EuGv4rRPsfjyJ
 25JIGVIsXo6PYGkr2h2AUTV37Acw1TjVkQFCe3vZFAdAZKklgRvNIAruf
 r0Kd0kxfjAzSliCQrhVnzRdzXmKYm2Vboq5Q7n1sUG/WliMbHP1Krsx+5
 bZsyKWVSWJfKHi/lx/Tk6dbcf4c/4ySHeOpYp56idsRkFo2iysVrD59oO
 QaXzgGmcjtcSj+q3tlZtf72CtHN0APGG5QfhkwodU0T8lKdhFOVooXgbk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="338932887"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="338932887"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 17:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682892687"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682892687"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 26 May 2023 17:22:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 17:22:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 17:22:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 17:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGtOK/Jn9nS1p58rwLfWGX230Hv2GB5ya6apjw8SWQ3AOJ0SLH6PUxfIkVjs7MQS/1j44YKC5DR1QIClWddX9dPKd8qQ31Q6oIXl4qF1WYwFdITVX7GyZ2f+anRQUCNhHEQo94Us0uKdkvyE+IG0vPJJ7dW94QCbiVrKpK9JB+zw19iX0ep7wcSnFCpIUTdk4S5GbaiZ9iXYnQAOHm9jgCHT8CES8nZHz8o/jG96aAM1dh2rhgNSfp9GdcVWuDLabK0w/ISDTqM9sCA1Ptwb/d0ZcMxFqyqIUVbGd175l4LGRc0GEs7sAIrdICTr3/FKQuLYjQ83Xpj8ESm5WCyLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPoWvikBGEt3SQMF1D9rYREmuqDwYuyM/b1LnvRv/2U=;
 b=Nws+pAuWozfHwnsZOerz5eeNNokMDefawYESAbD6XTfmIB2DO+R7l1lB/Y2d6Y6Njs+tevWfAvsApSiO13bShbsa0/2LZSzCDpAK5W5zfxPRBJEBmmYGcRGX61Pzts2ziB4v0iAWxSPsFVh1/1Bmxf0mJnVrpcoYx6/M/V+QHAvZY6m9duLEEFSgqolS5URO6MqDDT2juH0D4QO2mDecqwYWsYfQYZrn74OJga50xIqwvTpFobwpcDtE2aCkMpBHRWs8g9Br/GjgSGsOjtbKOf2Nl2W3N3C/5OGdOSHDUK3pSdOyahNt4qL8XLU97QdibzZc8ZFF7aJumwDam/oslw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7582.namprd11.prod.outlook.com (2603:10b6:806:31e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Sat, 27 May
 2023 00:22:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Sat, 27 May 2023
 00:22:51 +0000
Date: Fri, 26 May 2023 17:22:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230527002247.GO10045@mdroper-desk1.amr.corp.intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-31-matthew.d.roper@intel.com>
 <curv6g7uei6wkpfgbhaox25eozgqh7hmkghgvfsjznzmclr4ax@oxrvqdrwvear>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <curv6g7uei6wkpfgbhaox25eozgqh7hmkghgvfsjznzmclr4ax@oxrvqdrwvear>
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: a24cbbc4-cfdb-4f49-313f-08db5e488197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXHPnFCnpoY7yT0WdVtsETbjjPZb3kCWRwEpdIXRHNH1BMc99ysX1oFRFjwQLLGnb0keMMVdHYjTM8HT3fU1F7GNZOF2jVMNsGZFtMfead2gw30GxJBCNxclyw3l6tw84la4CPM3hkRc2VdLB4RUfzaj9+zJIbM3BJM44UBtT+cLuEaeBBZYxZvF3CCyAl6h1ynw5w64jrNrQKTPMkIgBflhD+729MSPGypkV23Ws61jonKxW7AgacjHTNjKJ2hfhg8K/TKJaMZopqpZEwf+2kkMUxPf1ir9lXjs8lzOKA0umi1rC27Bh5eaAj0Q+CKiOKMTu++Kc3QpBckjcilhcx67kbNfKS+YkDCv2nCFEc0TsjkUsejZd2E+O7FzF9wLAYPFYQ+ZG1gc4psHiIos8+0Vi69Yi4rTIpDntisXOwH7848jlfi6ic9WlIwxm/qZbEyarl71weTxQbPpKCYqhFkGgZkZdVWkMmUcaFDyEjB9L7nk3G2jnxNQ5W30khc3IM9Dpa0nQkwV96lKD1q+thtexXHZsF5lbrQqawG1ey0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(376002)(396003)(346002)(451199021)(38100700002)(1076003)(6506007)(6512007)(316002)(5660300002)(26005)(6636002)(4326008)(186003)(82960400001)(6862004)(6666004)(8676002)(2906002)(8936002)(66476007)(66946007)(86362001)(966005)(83380400001)(66556008)(33656002)(478600001)(41300700001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XfCBG9HobL/gxReM9HDJltrGTXYvyU2q9TRezwZITLoNHNSFkKTZ4YKhwFFi?=
 =?us-ascii?Q?/KIYHBT5Dp5EF9F3ONqRbRpk9x4uSxE07puQSI0iI/4Er6G+lay/D568+Rk1?=
 =?us-ascii?Q?xBadKUDToaLRgBbEwuCA+DRE2JafrLm5CFat5TYrd89Y0QhI4RSeYzuBg1p8?=
 =?us-ascii?Q?kOoAGMEx8mZwWJaUbFZanpbgTJVb6SjTbgKW1IkllR9yoY1MdHHD0iou2BdR?=
 =?us-ascii?Q?9eyBmEDZQUx1NZ2BeDDm0OoO8mZQUbjkbx+Ow/6yLncnxoNMvulLxsgnyrg7?=
 =?us-ascii?Q?ej4WJAj1kQ4FSE/RbB2rS1O7dTjyhtWmS57oxcCmM0H58FpD2QSzFvEXXDQ3?=
 =?us-ascii?Q?BWwmulOjzClczj9GGQW8Yj1MzoTVZmQdNubS08N/y8rHxG9j7N95fCJ+KSA+?=
 =?us-ascii?Q?xOYwTL4fk3cB15o49DGE6++6NWkxED+KYxI/lTD8D7D2qOP+ymnyvqyFU/2W?=
 =?us-ascii?Q?wSB4CkzBqK2UWbFc3D0Y7cWya93OC84yyxmuJotEk8gRZL1rxfHyDI5geQgG?=
 =?us-ascii?Q?HSDY9CQdQ6W/hF11w8l2Kc24GEbfsu26T+gT9WwzdThuSQpje2citojIo6wm?=
 =?us-ascii?Q?np8t4Nmytk+zlbnemvvYNe6Nk5WdV51pXE/d/mCrkHQNL073yNHrWbWdvkEt?=
 =?us-ascii?Q?wDlcv5aO9tSaWmFCgmmZJJ2gNIGxGQc7sEiqFRVt2/mKMxzP7GwDhgj4DGn2?=
 =?us-ascii?Q?tBNQxT+/sy/4rBbI0wlaNPb7weQTPOvsAPfV4lAVYM37N7UwYmclNn4rhNNI?=
 =?us-ascii?Q?MXOYKzq3rG3GZ2obb56DQ7mybHDGyParEzzj3A1AHbzEfjTJ+iTQyz6Rl+jI?=
 =?us-ascii?Q?YejPRB0rqH+KVg/atDuUYpG2HyB+V0O51TgBSXEdKW6TjgRga6xxM01sXPDd?=
 =?us-ascii?Q?n4pQq3NDuShsVXKbuhCx+yPYLV5hOqBaEWyeAGnIoMpWuwFsyAYQMNIrO5fT?=
 =?us-ascii?Q?W82EgD0yfee4YiDcmG0MP8paZQew28DlFTJskzaQ9+5PxH/7J/HqK21pJC+H?=
 =?us-ascii?Q?foU1ctr5Qw8PDn+j8gZmm8C8FuEfoE3RF+owlzHdfMoMXIBBrCE7sIG/0UCN?=
 =?us-ascii?Q?DdUKXqXroH1T2dCn6UpEU9sa1mmpWK+Ng097Cb5KvuKXeHP1ehlCAEvBzy0F?=
 =?us-ascii?Q?0pEz2/SXv16BJD2J0AO3WtZtloMi27FH1a/XtI+zRpxxKtu6riaSNfb/quXV?=
 =?us-ascii?Q?C3mshiyKSclB7FMF5AUtfraSZDi2iO223/bSmJstBvjAheOoKhkl/8qZACK7?=
 =?us-ascii?Q?m1voqXYFbvcsbwBKNfh+EEa4Qd98mF9bU4gBEA+lpnzs+Nr241SoOUpPmxMs?=
 =?us-ascii?Q?MJvbnwhFQrKWbLwupAaPO+pBdHvPGFlyeuEeXL6+ySuCgTr1z/8FuVL9irnE?=
 =?us-ascii?Q?x2Om0bzloITY88Zi7k0mbkidJ/wroDuBAuxO1RjiPmESvE/C+ZxT1qBT+Tj5?=
 =?us-ascii?Q?VXrdVwT3JbI7U6t6q7lm8CBFJSZ0OauFhfSMS80A8h+YpYGI8bWrYbGEfXCi?=
 =?us-ascii?Q?HoNgH9JBYTraEKFEflZbnPuThB8cuFXUxhzMAPc/qKbchg5PYGpwrhuytapP?=
 =?us-ascii?Q?X1f/GrSdIpZT2QRu/W3rwdyVzhHwESYvQtPQT0g/LaDZrCKhLdjIjde3te7m?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a24cbbc4-cfdb-4f49-313f-08db5e488197
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2023 00:22:51.0183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5tak5C5khF8sIe02D8kg+uKq+syAvLkCD/h8CIjhqYn8s6ptQBiciSPGB+WYdq1VV6ZpGdmW/5q9V82pl3dCVycj0R78pe8udy5RYTVFlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7582
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 30/30] drm/xe: Add kerneldoc description
 of multi-tile devices
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

On Fri, May 26, 2023 at 03:52:16PM -0700, Lucas De Marchi wrote:
> On Fri, May 19, 2023 at 04:18:27PM -0700, Matt Roper wrote:
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > Documentation/gpu/xe/index.rst   |  1 +
> > Documentation/gpu/xe/xe_tile.rst | 14 ++++++++
> > drivers/gpu/drm/xe/xe_tile.c     | 57 ++++++++++++++++++++++++++++++++
> > 3 files changed, 72 insertions(+)
> > create mode 100644 Documentation/gpu/xe/xe_tile.rst
> > 
> > diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> > index 2fddf9ed251e..5c4d6bb370f3 100644
> > --- a/Documentation/gpu/xe/index.rst
> > +++ b/Documentation/gpu/xe/index.rst
> > @@ -21,3 +21,4 @@ DG2, etc is provided to prototype the driver.
> >    xe_wa
> >    xe_rtp
> >    xe_firmware
> > +   xe_tile
> > diff --git a/Documentation/gpu/xe/xe_tile.rst b/Documentation/gpu/xe/xe_tile.rst
> > new file mode 100644
> > index 000000000000..c33f68dd95b6
> > --- /dev/null
> > +++ b/Documentation/gpu/xe/xe_tile.rst
> > @@ -0,0 +1,14 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +==================
> > +Multi-tile Devices
> > +==================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_tile.c
> > +   :doc: Multi-tile Design
> > +
> > +Internal API
> > +============
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_tile.c
> > +   :internal:
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 908eec5c17d9..d2654b78cfb4 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -12,6 +12,63 @@
> > #include "xe_tile.h"
> > #include "xe_ttm_vram_mgr.h"
> > 
> > +/**
> > + * DOC: Multi-tile Design
> > + *
> > + * Different vendors use the term "tile" a bit differently, but in the Intel
> > + * world, a 'tile' is pretty close to what most people would think of as being
> > + * a complete GPU.  When multiple GPUs are placed behind a single PCI device,
> > + * that's what is referred to as a "multi-tile device."  In such cases, pretty
> > + * much all hardware is replicated per-tile, although certain responsibilities
> > + * like PCI communication, reporting of interrupts to the OS, etc. are handled
> > + * solely by the "root tile."  A multi-tile platform takes care of tying the
> 
> ". instead of ."

Actually this one is correct as-is; periods at the end of sentences
always go inside the quotation marks (at least in English; not sure
about other languages).
https://www.grammar.com/periods-with-quotation-marks/

> 
> > + * tiles together in a way such that interrupt notifications from remote tiles
> > + * are forwarded to the root tile, the per-tile vram is combined into a single
> > + * address space, etc.
> > + *
> > + * In contrast, a "GT" (which officially stands for "Graphics Technology") is
> > + * the subset of a GPU/tile that is responsible for implementing graphics
> > + * and/or media operations.  The GT is where a lot of the driver implementation
> > + * happens since it's where the hardware engines, the execution units, and the
> > + * GuC all reside.
> > + *
> > + * Historically most Intel devices were single-tile devices that contained a
> > + * single GT.  PVC is an example of an Intel platform built on a multi-tile
> > + * design (i.e., multiple GPUs behind a single PCI device); each PVC tile only
> > + * has a single GT.  In contrast, platforms like MTL that have separate chips
> > + * for render and media IP are still only a single logical GPU, but the
> > + * graphics and media IP blocks are exposed each exposed as a separate GT
> 
> too many exposed words here

Good catch, thanks.


Matt

> 
> other than that,
> 
> 	
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> thanks
> Lucas De Marchi
> 
> > + * within that single GPU.  This is important from a software perspective
> > + * because multi-GT platforms like MTL only replicate a subset of the GPU
> > + * hardware and behave differently than multi-tile platforms like PVC where
> > + * nearly everything is replicated.
> > + *
> > + * Per-tile functionality (shared by all GTs within the tile):
> > + *  - Complete 4MB MMIO space (containing SGunit/SoC registers, GT
> > + *    registers, display registers, etc.)
> > + *  - Global GTT
> > + *  - VRAM (if discrete)
> > + *  - Interrupt flows
> > + *  - Migration context
> > + *  - kernel batchbuffer pool
> > + *  - Primary GT
> > + *  - Media GT (if media version >= 13)
> > + *
> > + * Per-GT functionality:
> > + *  - GuC
> > + *  - Hardware engines
> > + *  - Programmable hardware units (subslices, EUs)
> > + *  - GSI subset of registers (multiple copies of these registers reside
> > + *    within the complete MMIO space provided by the tile, but at different
> > + *    offsets --- 0 for render, 0x380000 for media)
> > + *  - Multicast register steering
> > + *  - TLBs to cache page table translations
> > + *  - Reset capability
> > + *  - Low-level power management (e.g., C6)
> > + *  - Clock frequency
> > + *  - MOCS and PAT programming
> > + */
> > +
> > /**
> >  * xe_tile_alloc - Perform per-tile memory allocation
> >  * @tile: Tile to perform allocations for
> > -- 
> > 2.40.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
