Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB489F46C69
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 18:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C25010E2BD;
	Mon,  6 Apr 2026 18:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BE0ExTRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF1F10E259
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 18:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775501967; x=1807037967;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eeZfEG2OMPc/bsjnzLsKDbM47OMcO8rJwofC5LhGZ7I=;
 b=BE0ExTRIPdUsZxlCVeWPrC7zcLiNbQPtLPFlR8+5TrmAzzVQQAoWopDm
 wwspxI2ctbafEXVwYJ0NYOQYj6A6/5A4i8SANNB5SjBXNS7xKxa+sue9y
 A5DLcXndFF3dK8f3ogZIp8LjY7XIw3krpzAvIJTw7wyp5mjsz1zFAsTaP
 0o3idO8B/Om0jRexmQmDSr+RZMbyT/kpRVzRWd20rtgppURVAJJOqp5Wk
 Zb+817fnl3iiqrpqRoziFazKAGOEyaj4O1z2q1oxq+YNfN79Bo2I8OjYC
 qACotQUQ5ycBZE4TEO5jL+Ng+NQRuIdZl9S8jVmPCcOUApQhdeyGJUmkv A==;
X-CSE-ConnectionGUID: krGOCsJ7TKu8aNQbOYl+KQ==
X-CSE-MsgGUID: bjSWDptcQYmGwhN+ld55Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76351577"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76351577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 11:59:26 -0700
X-CSE-ConnectionGUID: GKD8fO12RZGuraDSEGO9Sw==
X-CSE-MsgGUID: W6UsIK//R1SYmatSneqCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="251219255"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 11:59:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 11:59:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 11:59:25 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 11:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaBxLKFbtJU2pXEVQwO6SMC/d7TpGmUdRw4t4BDWIYfBanFUGC4vALteR4TMfOJnwv2Yamy2Ft9PGJ5p++OMI/8lq3xqsGfu+CVDwYGia0cAWhU22XE1xtwvvLOo0w0rcHZEbOzQZmh6nj6LNCcRzBnXHGRS0pUY901PpLFUn+9TAUianlFwe9ko/BDkvn02raHgXnCJS4Gf7z4fOjJ0Zl+Ly5RQ0RhyVWhAC2HmuFAa8xQp5EKnnlp0e8fOOYgvX2DvqxDQdbu3CGr6MKbp1zW8vaLZFPjdnzkew2M7IxQUvSc4l2+G8g6uSuO2ApbZRUIXKgR4j4hzTpmKhdKWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C87HD5vIGXW5hr98Vy5reUL1P83wYUlxXIwL9C2dC+E=;
 b=Zj81UmCUrdb6ZjusgeJYaw6cOiOLWDwhtqqJWs0bJlvvFpw5Q8LESfn5u7g5d88CX+iNE4kfXQwlkyzlGwRf02/nrMiRiHSqLXouIBeC1CZ182oU5HfkZdkyHw9ytmh9y63gb1fT17WwthsSJnMv+V+nKHt2ZxfK9MBPpix66EejjfTD/JQq59CBhdOU80XF8RrKhHLrJz5A45Qwn5isrOLfrZu+JFUPN/71PNYBvTKyHirZNqkxRlM1dEFWu66lkp5fqJjMv9lU22cO8dhvz4YEEnns7VDfAtaZ20i90uHA0rGlFRIeAPDA3+RN4Ee57EfNRe9GODIN73D8m/POUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 18:59:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 18:59:22 +0000
Date: Mon, 6 Apr 2026 11:59:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <adQChk1p9hRnvQxl@gsse-cloud1.jf.intel.com>
References: <20260404062250.3435419-1-fei.yang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260404062250.3435419-1-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 683040b4-7688-48af-e518-08de940e9cee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: XW2+m4qrqzpYeZwMfBp1emZmIm3PYdsRaa98wqZOLUCOybhMYr3V2GwyEQQUaUyiG1eFZ7ZCWzkVxPDHu9d2hgB6YQ5A42pmws42n0TOUIh+H9OdT6uVAy9vbozYH7ydkX70+xXVrXWx/1iqnDTHOevUabRg+X3cPhUQcdL++7+kFjbrUOl4Fm38Tedz/iWfEQ+Uon0b82BzapAPy/ducAAPVeihnuJmXYlXOj7DFz+22MOXHtWMfjycOKzKtVQUYcIT40VibZPwEUFFBRwUrZsDXWGL/YzjxeUBN7nuwFF1MPb/XS4IO8ApOVwClPRb2Jo8gj1/EPJr8c3hcH7Micz7sLWvcXnlk6ocbX7yphTRZv1u+keNkqBfv4iXbXpHjRdG9vuLfcKO4+tdbC8Eav+iVfY9NU1ZjO/tuNvdwNJcuVAUz6/K1bG+Y6pDlONtY3djLHQcARWcPEm+5ciUVEgiOOqqlglQtidjOilf08NsG8Ho1VEC8Vzf6PFMLExXz5LmNjGB9bYw7paLkwT99ihn77u4GepSZZhfbYLtK4FSwvQi3+egGFInUhydnNvApakDguk1Kig9313at+CCBNymxpd3HSsJbxVQrVtjERZ8Vzhwe9KUhP4r4fo7BPVTYvFpRh9z/RxtpNbTceoiBaOrDe5yXe7vxka6ATkyGcGwhTLdWMB3h04E3IoGVZ2rDj2Jdook8LjvqdvygSbK3F6+YchmllZMalGcWfVSHbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9jNrPmp68R6JAmhfUZOjmuUPvhrvAnAPG326yHdFdJXMAOF1EeNjtAwOoh?=
 =?iso-8859-1?Q?FsZArpfGc8f1qYscsGV66kHRJP44AZYBZBWQDvrV1qxqOqMe+eDqMXNnYs?=
 =?iso-8859-1?Q?06JMJPV2m6cIOX8uaOdGCRqz8Nj/MVdyy2PGLtTWoDHpH9VdLSORJF6Kej?=
 =?iso-8859-1?Q?SwV1qMV+SoRAFiPzDY2gojr9V7n7ZwWqORB3y70/eOIIt4pjJwIJMUw+EJ?=
 =?iso-8859-1?Q?WCAJdvJ8KRZB2Pq1NjDJ0MWGCUF8gwxIZgJ6ofcS3dyNa3cnpF5FuLRwfr?=
 =?iso-8859-1?Q?+1tehwutObFA7734XYSO9RyBhBSqNFhVZZMSZngwdzdgEupX4fVFPx2O4N?=
 =?iso-8859-1?Q?E/nhgZo+l7GzEpaIe52qzNDoXfRtEWtgjuxWBfurD6OkyzdJhSvg+ReW8y?=
 =?iso-8859-1?Q?it91Be0u1uHLZWCwPx07FxEAXuva1g2jx+H7NqSr9l4mOblMBQroY4PVp0?=
 =?iso-8859-1?Q?gNv7MkINo8le7BGmm4XynHIiKQ4VbaKv9uyhXcs58T7uux4o3Sc3bNNKVh?=
 =?iso-8859-1?Q?F7PUmd7aGvXUKcMRDnZPoMM0GsqCTnWfmOmr0fCh9ofx26e8DQzejzSZm4?=
 =?iso-8859-1?Q?5bKi8XJOjKTe7aNgXJAeT/kbRYVwg6H35Pv3ghyMLGyJmPjOQMuvUEn08B?=
 =?iso-8859-1?Q?rhWbodRmH01EgvGZis4wox+IfLSdug7MJWzh1RWOSCRgx97WIzc21gkb5C?=
 =?iso-8859-1?Q?8yeacVHkd2oOJ3qkHGdNTebqzuDDVVfa+jFojOPrJXczHF0ZQgxMaxAtiz?=
 =?iso-8859-1?Q?IqkS8NJsCMPHtnQjD35xkJHXkXC1e7XV1ija5t8YgiXorybc9MH14+F+TN?=
 =?iso-8859-1?Q?ZI8NzdZLHGpVZLmDyUmx5iWkdOj0Y4O+7ko3e8F15QZuruEZ7dm8hGt22r?=
 =?iso-8859-1?Q?3yoXpaiPrOoFkfOfNBEZpPPmmpV/QXJ4y6X48ggX0wzlqZvF2gYKGoOuDw?=
 =?iso-8859-1?Q?KSbWdbEHbTib4EkJveg49dMBaFg8oIY/F96RFzlhvE4J9Eb/AsWLHaQIe2?=
 =?iso-8859-1?Q?+VYEIx/h5zTQSCh7Kmz5Z3p8liSx0VCCbhvJXZUdK4S0idL7evjOOE52uh?=
 =?iso-8859-1?Q?e2/Vc6fx+TTqLECs/AUuJfaR/zq7ipWbLq0QECUznvNKjpEI9t8u9iVdrg?=
 =?iso-8859-1?Q?jn0fXDzWIEIFZbv6roaehnKE8SOxyi86P8Q4LbzjKZx9mi6RdPhlC/OEmP?=
 =?iso-8859-1?Q?4/sDbM4q/ZqZ9oX++6nBxlqlbAlm/qDNwo1lSpGNDcZ+9ur0H7KNBxiVml?=
 =?iso-8859-1?Q?Yg9nSM6IZKbiaDFXpcT0bjf3W+iw8UsTMbgBtfrjseEwscaZlCN07FLBMO?=
 =?iso-8859-1?Q?ZbWdzvNJUZtc2Te4Zf/vUCOYvjoFQ0OrbYnOC618wznRX+yMIEVp9aG0VS?=
 =?iso-8859-1?Q?ZNxl4XK4KtxlsSMOZQKYHu871AO90NC6dwPoz2O7dQuaR76ZI3MUOhIu36?=
 =?iso-8859-1?Q?88sMsKRavLIgX00cp9L603/tuOhHq3VePsCWWGjcOqTSdiX+1fR8aBfHOc?=
 =?iso-8859-1?Q?soNl92NbWgmB3DwzjCBNVko4p3O5PmNP5uHySexxQcruUtjfauut1Ihs61?=
 =?iso-8859-1?Q?zVUFSBuzgUknG4PYvpU4CsJBbVh9almpJpk6A3khL4HKXBL8eIGrAKDAfM?=
 =?iso-8859-1?Q?cZ7cop7uUQ1zAJN0vln7mhVTiXDLb2dDm9f/tutGGBQ9ZodZM2GBlFgnSw?=
 =?iso-8859-1?Q?d8HPlp+QMUydKCpiVQqEK0ij/AMWObsVFId4hRja3on8pjavmo2Ojl/5v5?=
 =?iso-8859-1?Q?EGh331GtgNt8j3CyJbXLULmBNoO9C03BSmxOaLj4+mKi5W9DQV8MJcJUET?=
 =?iso-8859-1?Q?cMEscvVdZg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Mjm6JmDzMXRX4RVzyuQhC4xOXWnwoRxHZ/k20d/Y2U1QrR363b/bUtIrscSl5ocZ1QVVtw9xgSSvagivG/s2ks5WWqqacItuojvT+Oqbq6hwgJIHnnHbZqcCh9cwORAyHrM8HwJV+gNgFC5SOJ12ex22oq2OCEOFSKR1IN+M3ZW7NOf4FZPRYoTPAgJHdTubiWqwgePIKOHPHvyEIZ9zYUjw1dagQwcdZmmMHqDwmsfNp1nE2HvCkV9LPxvWMLLcVL4kw5aNJFi6Hqss+v7nVOqQ56OKoJhqBiwLJrDGCr/cwlSl8zBlpPDp/hIjho2mpiYjeLeS6F69LJSdmJ7Wdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 683040b4-7688-48af-e518-08de940e9cee
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 18:59:21.9002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEPMvS6JOWDy0N1fnvfWFhVcS96rJPSudoiB1gx6EoexvNSuuA57kAWyPIbnLcoPZtwpCf7z3UhbVfUE+hmoSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7608
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

On Fri, Apr 03, 2026 at 11:22:49PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Hardware requires the software to poll the valid bit and make sure it's
> cleared before issuing a new TLB invalidation request.
> We also need to avoid racing against GuC on TLB invalidations by only
> allowing KMD to issue TLB invalidation request during GuC reset.
> 
> v2: separate ggtt inval to xe_gam_port and call in guc_reset only (Matt)
> 

I guess CI doesn't like this... Unsure why, clearly missed something in
my suggestion.

Maybe it is best move this new code into xe_guc_tlb_inval.c for TLB now
unless someone really has time to dig in.

Matt

> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |  1 +
>  drivers/gpu/drm/xe/xe_gam_port.c      | 72 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gam_port.h      | 15 ++++++
>  drivers/gpu/drm/xe/xe_gt.c            |  1 +
>  drivers/gpu/drm/xe/xe_gt_types.h      |  7 +++
>  drivers/gpu/drm/xe/xe_guc.c           |  4 ++
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 18 -------
>  7 files changed, 100 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gam_port.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gam_port.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f9abaf687d46..96127ad60e9b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -78,6 +78,7 @@ xe-y += xe_bb.o \
>  	xe_guc_rc.o \
>  	xe_guc_submit.o \
>  	xe_guc_tlb_inval.o \
> +	xe_gam_port.o \
>  	xe_heci_gsc.o \
>  	xe_huc.o \
>  	xe_hw_engine.o \
> diff --git a/drivers/gpu/drm/xe/xe_gam_port.c b/drivers/gpu/drm/xe/xe_gam_port.c
> new file mode 100644
> index 000000000000..137887cf93b8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gam_port.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gt_stats.h"
> +#include "xe_gt_types.h"
> +#include "xe_gt_printk.h"
> +#include "xe_mmio.h"
> +#include "xe_gam_port.h"
> +
> +#include "regs/xe_guc_regs.h"
> +
> +/*
> + * GGTT TLB invalidation as part of GuC reset flow while the communication
> + * between host and GuC is disabled.
> + */
> +
> +int xe_gam_port_tlb_inval_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_mmio *mmio = &gt->mmio;
> +	int ret = 0;
> +
> +	spin_lock(&gt->mmio_tlb_invl_lock);
> +
> +	if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> +		/* Wait 1-second for the valid bit to be cleared */
> +		ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> +				     0, 1000 * USEC_PER_MSEC, NULL, true);
> +		if (ret) {
> +			ret = -ECANCELED;
> +			goto out;
> +		}
> +
> +		xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1, PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> +		xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID);
> +
> +		/* Wait 1-second for the valid bit to be cleared */
> +		ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> +				     0, 1000 * USEC_PER_MSEC, NULL, true);
> +		if (ret) {
> +			ret = -ECANCELED;
> +			goto out;
> +		}
> +	} else {
> +		/* Wait 1-second for the valid bit to be cleared */
> +		ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE,
> +				     0, 1000 * USEC_PER_MSEC, NULL, true);
> +		if (ret) {
> +			ret = -ECANCELED;
> +			goto out;
> +		}
> +
> +		xe_mmio_write32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE);
> +
> +		/* Wait 1-second for the valid bit to be cleared */
> +		ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE,
> +				     0, 1000 * USEC_PER_MSEC, NULL, true);
> +		if (ret) {
> +			ret = -ECANCELED;
> +			goto out;
> +		}
> +	}
> +
> +out:
> +	spin_unlock(&gt->mmio_tlb_invl_lock);
> +
> +	if (ret)
> +		xe_gt_warn(gt, "TLB INVAL cancelled due to uncleared valid bit\n");
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gam_port.h b/drivers/gpu/drm/xe/xe_gam_port.h
> new file mode 100644
> index 000000000000..b5c383d635f1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gam_port.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GAM_PORT_H_
> +#define _XE_GAM_PORT_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_gt;
> +
> +int xe_gam_port_tlb_inval_ggtt(struct xe_gt *gt);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 8a31c963c372..6bb990069eff 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -514,6 +514,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>  
>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  	spin_lock_init(&gt->global_invl_lock);
> +	spin_lock_init(&gt->mmio_tlb_invl_lock);
>  
>  	err = xe_gt_tlb_inval_init_early(gt);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 8b55cf25a75f..2418a0b2f19c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -324,6 +324,13 @@ struct xe_gt {
>  	 */
>  	spinlock_t global_invl_lock;
>  
> +	/**
> +	 * @mmio_tlb_invl_lock: prevents back to back TLB invalidation
> +	 *    without polling for hardware clearance for the previous
> +	 *    invalidation
> +	 */
> +	spinlock_t mmio_tlb_invl_lock;
> +
>  	/** @wa_active: keep track of active workarounds */
>  	struct {
>  		/** @wa_active.gt: bitmap with active GT workarounds */
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e762eada21db..70eff5b22fbb 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -48,6 +48,7 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> +#include "xe_gam_port.h"
>  
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
> @@ -991,6 +992,9 @@ int xe_guc_reset(struct xe_guc *guc)
>  		goto err_out;
>  	}
>  
> +	if (xe_gam_port_tlb_inval_ggtt(gt))
> +		xe_gt_warn(gt, "GGTT TLB invalidation timed out\n");
> +
>  	return 0;
>  
>  err_out:
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index ced58f46f846..7c3e63e49760 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -61,8 +61,6 @@ static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  {
>  	struct xe_guc *guc = tlb_inval->private;
> -	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_device *xe = guc_to_xe(guc);
>  
>  	/*
>  	 * Returning -ECANCELED in this function is squashed at the caller and
> @@ -77,22 +75,6 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  		};
>  
>  		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
> -	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> -		struct xe_mmio *mmio = &gt->mmio;
> -
> -		if (IS_SRIOV_VF(xe))
> -			return -ECANCELED;
> -
> -		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> -		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> -			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
> -					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> -			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
> -					PVC_GUC_TLB_INV_DESC0_VALID);
> -		} else {
> -			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> -					GUC_TLB_INV_CR_INVALIDATE);
> -		}
>  	}
>  
>  	return -ECANCELED;
> -- 
> 2.43.0
> 
