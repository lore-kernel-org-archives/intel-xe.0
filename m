Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC776CE7AA1
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 21:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2396F10E959;
	Thu,  5 Sep 2024 21:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHwgQMkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6264110E959
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 21:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725573201; x=1757109201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kfmvFbULXcrm4iRP0bmwT9EM9iz/M7FgQx3NYuuJ6bw=;
 b=CHwgQMkwr2SgSf8SPOMj20lewdYugV0jA6MVvkvm/RHrC5/u4J+Un6A5
 M44HuafARgr9AFnYYlda9tGKXvA6XHvdoqSJz7pnnWXEnh7qP6ULLPAk1
 sHsoghyShZyGCDJrdMQbpixQKzQLm0GQOxlppyIEdNURX1pqG95xcfC16
 k3yjnSr6alj8b+L/rth163FF4Uc8YoazbR0RfOEIP0ZRhc7npZbkX/r4J
 RmGZgmJGHQFMszmltSL/HfmC6aXy/BRMMNZNeC4ih0TXV+iYlZPEFbD+Y
 SkJ+MsMet3FJ+xNou7RjJbuUJXw6aHVB94ewVll0l+mzJHyQ/IGvu5kny g==;
X-CSE-ConnectionGUID: qXFfqN09RqyV1asKOBY3rA==
X-CSE-MsgGUID: jvYB07+8SSy6p6UyVd1v3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23823805"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="23823805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 14:53:21 -0700
X-CSE-ConnectionGUID: wZ/xeLaRTYGF2BH7Spkk/w==
X-CSE-MsgGUID: +NQqaiiHSrmk4RTK5Zv40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="66087608"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 14:53:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 14:53:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 14:53:20 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 14:53:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZHYy4NpGfSRlkFVjav497GgklJZlABp4HcrPDJ0gLFLLM/gTK86tDDizpM5CppD4hS5RpIPmwID7BQHYho/ZTq7cGxH82WomuNq8ieAs/NiRQpfTdYlwlYIu5qP9QcvQNoWuekTDam7Fl8kTfXm7x7pqN/6XZxC+PSlCL8PXKC8R9796NhS4G9D3c3H4SqenHPWLtwDzb+kXCPJrA9osC+R/OJcyT36TsQ/CjsFmBw8XIdQXqohBqAMyPuypUYzu0I9hgLBVEw4IODW3dgTv941Gbmy9953HOHNR7/7LIlqMBMzNwVivm4iRAXn1SsfIXFq5mrcOfikhEh+H2YMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJpJIAnlNeLhpUBQInZ7LCU2itBvO7YZAiQr7mjdiUk=;
 b=u3NLmK2di+x4au8peuFhTiF/vebo/TTXGuUEE5XSlKZ2Riv38KNJTA28QmQzmDWme4pvhVzvcC/+X9iWaxqpcU7cEI7hh5JG8FFFCY9q+AvvSqYr5l9wSdJeJbIkZ5Vq7UqBReNMR4Ma3eEatd56BH6+B71emNldCQGiLt8LAzd1jFBKwojNFGujgoSEC5RYKIbvG9SFZX77FUevELe0/NgvkPnWngpIa6WJt7s00iXnaCg5/e4hIW0fYcDHqWoqa2qcU+Ofizxf9mJHW4ZpM+G1rGGdwzpTnFAtoegJubCwZwrWRxo2dzREyePFtDPz4StAE2p1sI8QL3/MP+kLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 5 Sep
 2024 21:53:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 21:53:17 +0000
Date: Thu, 5 Sep 2024 16:53:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/43] drm/xe: Move GSI offset adjustment fields into
 'struct xe_mmio'
Message-ID: <juaj2oeapjuq2h6cvv3xien32zutykxh7pglylvues7icqd2db@63qvz6huybbi>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-49-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-49-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: d512cad6-31f1-4ece-6f89-08dccdf5262b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h16M65qU5m7l2AlcINelc4wnOfXRBEQp4a9+kadpJaaL1d6RYGAO7NGk4LWf?=
 =?us-ascii?Q?WLyrPIIYcn75T85kJZv4ObypKZdS56xI7EUebHObiEwFi6SJjF8GU9KaMDoq?=
 =?us-ascii?Q?GK4mIToMAyAFZfU8Kj9NVwiCgOTrD6OqKzRnLAyhkMfjnX6WQ6emWs/THlB5?=
 =?us-ascii?Q?uUIuqDOuraKUfBptA9yRLdOE84LkVBul1M6cqK0BsrKYyuWgFm8wQ/4OU1Mt?=
 =?us-ascii?Q?MRVd7LvWrwTdDkM8hT6OBhOx397Q+8P1KCgKgoBT9H1fco3f81Iqwy5yqB2c?=
 =?us-ascii?Q?Dhx6BQi++IzNgkM4G/vJ1rs1icjA8LjZUKCs30JfB2o+xStMUb0x7MAyc5bQ?=
 =?us-ascii?Q?P5fx0qloJYN2OMWlnsHz7s7Jr0+lupjkKUjR/vArEnDxEMIHpISP1ov/g0Ny?=
 =?us-ascii?Q?zM3cUAQcLNH5qeN5cT0ykGtQxyIRy6lv56YdDAuMiwYpj0ujsqjZeeZt+Mxh?=
 =?us-ascii?Q?OZFc6MS52L8O5xfj7lj53PDheFKnJVWbbxJRQmqMjk4LKn/hiYjiSvvSEjku?=
 =?us-ascii?Q?AbseoJJBxyTstqAZUdUH5ih3HMhYHykGoI3EsL6qutLRwJbnwRJcNza4uwYj?=
 =?us-ascii?Q?4HehNvg3UA2V/dYBShDyOSQIFhaWOuJwJj0aDnhWNwSnnZU2q4Gaq87FaoVj?=
 =?us-ascii?Q?ernGtUdVC6DZXMCSCVLauBE2c/sECZo6ijW/HA6+sQjVcd35INWblJeFEXVD?=
 =?us-ascii?Q?3INEgAx8HvaNukNiJAF5PjHNiwW5idK1WJ4a9SptqCmFaQlHbyYhwwEiN+QJ?=
 =?us-ascii?Q?pCEJ733Sz2ZS67T7RWN1V80RF1EAILqyMpAyN/lexAZDhg+Bnpkv/lbVYMw7?=
 =?us-ascii?Q?t3Dg4igCIWWEw8ujkICpQ9GXnsNJ28VcXr47J5fjZu6R5ORIyFf7z4+7nlDk?=
 =?us-ascii?Q?AO7KpWxK43nAz8WMRkr+C6rOwv7+EALjFRqG4D/8hyqDD5wvm7SdmRQb1+kx?=
 =?us-ascii?Q?LWzK9K65meH9bHDujHQlkGn2E29Fp2YvgIMfB2CIfuWFTOXvk0YPLLCUZ/Js?=
 =?us-ascii?Q?Kr15hdWw5rjQaysCyd6viFbJLEB4PtRsbm2m5axaBRrugmx0a5KX9TmZylGy?=
 =?us-ascii?Q?GwM8VNO50NI+SqJFDP0+mA5uG7jGfIcurbzdHTsoa9sb8DMrQZY4DytHIquA?=
 =?us-ascii?Q?twZva+QlsMwHKpECM4MpdigbxkxhLnfZechQ8dxj2T5nS0mq8kBJxZwwaJgb?=
 =?us-ascii?Q?gb5fXmjZmzQj1flfswmMpAEkgZW8c3TiSoJ0HPL0yozewH6sk/CO2aY+VQVr?=
 =?us-ascii?Q?wHwjIHuJH4nInjzusn8RBRohGg5biwKDrFJyj71RugAnLWkedXEhluDa706L?=
 =?us-ascii?Q?EkCDBW3mJTRqGdS6yvxtEE3voHSQrh0PV1UZS8CA9XbI+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9zPBl7bUzx8KPbNNqMPwsMXeZmPb/aBBfmMvbgTdPVqEPOHMSQCqa9Sicx/U?=
 =?us-ascii?Q?QNhITyz4xiP3hrr0poyYU7FdP1YU9VyGRJjGt81XER0akYl3GxGa84bboOOm?=
 =?us-ascii?Q?jMWrer+FNU+jlY1sqHCHd4DCzJwkIEUrU5XtqoMblo0/fC+buJUGNQvHYOrG?=
 =?us-ascii?Q?jESSYnP2woOMPq8ZGVA4q8Sxu7zYi0E5uzMsPIdNHaKik6MYlPO6XfIUhdC2?=
 =?us-ascii?Q?IaJgKVyrkEkZP/ssDTpY1ShSKuGZePtflhVWgn8/+TL19ahBty8hwazHQclO?=
 =?us-ascii?Q?SwC66yEIBT8iQBeRNVTQfBg3H+4X2S1jVx2thkQyEEBizdt9YHlsbk3ua2i0?=
 =?us-ascii?Q?mkPwuiJ+GJaMmi1gFS0SnDgK6XDu9r9dEn5piwbSsPpkgqf10f0Q43rMLUKJ?=
 =?us-ascii?Q?fIAjx/VAxEDRZ77bev2uHLR9Vz8VjIRvSrxvk7T2hGSF7Zij7FWwldMTXLgp?=
 =?us-ascii?Q?Cbv0px/25G1EUE8pW06t4rU0Q0UZqUXcF69rBIQVuKjZOM2NOx4oNluLfM2f?=
 =?us-ascii?Q?2GCV4H2FzbkR4JWhARNNK3ygdLKTaYuJXp8W40Vjyc6onURkNf6ExwpX+qtq?=
 =?us-ascii?Q?9V5d0P7D1GKs689ZPFs6ETiLiNMKvpWJyJvSml1X2vOrgNr2DIj+gmWc3N3f?=
 =?us-ascii?Q?G0jxr3ZOf1OicM38Y9XguJYjEd4X8JfLB7HO/gijg42U5xXMyJZ/4wgPZRDZ?=
 =?us-ascii?Q?MJ5bAW7FF8DRfjqkXXKmGNsRd4Tz2uOwWesn5HZjZMyY5l1j7UVlWe+AY73N?=
 =?us-ascii?Q?vy4uam/bBX3KBmnWJioekXu3r3EvRWf03cz1iMewcYXQ7fqFfC0b5GRobbAf?=
 =?us-ascii?Q?pV6bLMAbcYjtV8KELU7gtcSYx+JpGgg5X1msLDCPfJpeRk6sdgU7y96S8Ztk?=
 =?us-ascii?Q?me5CmMpk0h45B39hhiSUhr2X8gz4hAVNVNJdxrF28Qb5Tfja5xB3OPJYrWvp?=
 =?us-ascii?Q?HysGaK2AXenwC1g4UyvCIkG+9B14Z6Bg1o0HYcTLEcW+8orKgm1XZvWTMIZS?=
 =?us-ascii?Q?sLHW5s+StgP3oChtpacC3WRZqUZ54a0OYWD4ShaBtT87Qc851t2jZorK6IbT?=
 =?us-ascii?Q?Wp41THxTAm3ZwCMR/XAKY3UgtQexww4zQoBMP9GpTdsKYUYoI1k2kKN7EgPw?=
 =?us-ascii?Q?ZlybOp1478mcPO4XPs8DOKvZZTz/zVxi+GfK65YDasLJUlovvUCa4hPNf9ky?=
 =?us-ascii?Q?ao27CREdSoN9BHR6gblWpjPCKwkrWaU5YWTl8piuXtuVMfPw2D7a/pARtEjJ?=
 =?us-ascii?Q?yxMqlLksCOeuFMEppygUnpK9v25WzHP1H4zRC5W7mnii3guuNuSM8ayswbYa?=
 =?us-ascii?Q?YJ2O0SOkAvd6Hg+6pitxuLsr63FXBfiFoepitLoFBaYOSIe8eq4v7D9DmDdn?=
 =?us-ascii?Q?BjEx0sSe+rN6DfWTkLPQtWvek19SFY7c6nFcENf+QAe6eNpS32j3p/MYnEDQ?=
 =?us-ascii?Q?K+x89OG0bAGwVh47tiAHb0uIY5UP/1AFIdEBrmUyvJLGc528djbQA0Enh5tF?=
 =?us-ascii?Q?lLAM5xt1QPRUFx/AcrBYha4GVtJU4HPUB3aRFitXf+MRsskR8XvZyL1NnUQm?=
 =?us-ascii?Q?7Pi0XEO5HR20XAsxy4rHIpt3h0mMBVXmNxGiTEFzl8LKyzp5LWQvXOZ2Tbt+?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d512cad6-31f1-4ece-6f89-08dccdf5262b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 21:53:17.2844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+JdAFk1A0kEHbivIKcg+clGAzqnbvWYkCANV8khvQl0E/sh9rH1ucJ25uOyHGNi5Eebl2tL/trbamNO20L6dDe8xGbFqhY9KRqqXg2aODE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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

On Tue, Sep 03, 2024 at 05:21:05PM GMT, Matt Roper wrote:
>By moving the GSI adjustment fields into 'struct xe_mmio' we can replace
>the GT's MMIO substructure with another instance of xe_mmio.  At the
>moment this means MMIO operations wind up pulling information from two
>different places (the tile's xe_mmio for the iomap and the GT's xe_mmio
>for the adjustment), but we'll address that in future patches.
>
>The type headers change a bit with this change, meaning that various
>files should be including xe_device_types.h instead of (or in addition
>to) xe_gt_types.h.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_assert.h       |  2 +-
> drivers/gpu/drm/xe/xe_device.h       |  1 +
> drivers/gpu/drm/xe/xe_device_types.h |  7 ++++++-
> drivers/gpu/drm/xe/xe_gt_freq.c      |  2 +-
> drivers/gpu/drm/xe/xe_gt_printk.h    |  2 +-
> drivers/gpu/drm/xe/xe_gt_types.h     | 11 ++---------
> 6 files changed, 12 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>index e22bbf57fca7..04d6b95c6d87 100644
>--- a/drivers/gpu/drm/xe/xe_assert.h
>+++ b/drivers/gpu/drm/xe/xe_assert.h
>@@ -10,7 +10,7 @@
>
> #include <drm/drm_print.h>
>
>-#include "xe_device_types.h"
>+#include "xe_gt_types.h"
> #include "xe_step.h"
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index ec726dcd5f99..ca8d8ef6342b 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -9,6 +9,7 @@
> #include <drm/drm_util.h>
>
> #include "xe_device_types.h"
>+#include "xe_gt_types.h"
>
> static inline struct xe_device *to_xe_device(const struct drm_device *dev)
> {
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 7427f40086e8..e080be9bba52 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -14,7 +14,6 @@
>
> #include "xe_devcoredump_types.h"
> #include "xe_heci_gsc.h"
>-#include "xe_gt_types.h"
> #include "xe_lmtt_types.h"
> #include "xe_memirq_types.h"
> #include "xe_oa.h"
>@@ -127,6 +126,12 @@ struct xe_mmio {
> 	 * non-register regions such as the GGTT PTEs.
> 	 */
> 	size_t regs_length;
>+
>+	/** adj_limit: adjust MMIO address if address is below this value */
>+	u32 adj_limit;
>+
>+	/** @adj_offset: offect to add to MMIO address when adjusting */

			 ^

while at it, may be worth to fix the typo that was already there.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+	u32 adj_offset;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>index 68a5778b4319..552435951f11 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>@@ -11,9 +11,9 @@
> #include <drm/drm_managed.h>
> #include <drm/drm_print.h>
>
>-#include "xe_device_types.h"
> #include "xe_gt_sysfs.h"
> #include "xe_gt_throttle.h"
>+#include "xe_gt_types.h"
> #include "xe_guc_pc.h"
> #include "xe_pm.h"
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>index d6228baaff1e..5dc71394372d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_printk.h
>+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>@@ -8,7 +8,7 @@
>
> #include <drm/drm_print.h>
>
>-#include "xe_device_types.h"
>+#include "xe_gt_types.h"
>
> #define xe_gt_printk(_gt, _level, _fmt, ...) \
> 	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index e9026023e240..593bc5aa9a4a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -6,6 +6,7 @@
> #ifndef _XE_GT_TYPES_H_
> #define _XE_GT_TYPES_H_
>
>+#include "xe_device_types.h"
> #include "xe_force_wake_types.h"
> #include "xe_gt_idle_types.h"
> #include "xe_gt_sriov_pf_types.h"
>@@ -147,15 +148,7 @@ struct xe_gt {
> 	 * register space, but have their own copy of GSI registers at a
> 	 * specific offset.
> 	 */
>-	struct {
>-		/**
>-		 * @mmio.adj_limit: adjust MMIO address if address is below this
>-		 * value
>-		 */
>-		u32 adj_limit;
>-		/** @mmio.adj_offset: offect to add to MMIO address when adjusting */
>-		u32 adj_offset;
>-	} mmio;
>+	struct xe_mmio mmio;
>
> 	/**
> 	 * @pm: power management info for GT.  The driver uses the GT's
>-- 
>2.45.2
>
