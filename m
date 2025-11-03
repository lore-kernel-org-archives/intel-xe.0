Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39232CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 18:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F165B10E468;
	Mon,  3 Nov 2025 18:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBnt38gm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B9C10E216
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 18:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762196175; x=1793732175;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lxpva/WwfA05LDX/9UIemm7XHuVC11QoKAXCquQbxxQ=;
 b=mBnt38gmDzmC6FjAFr9MgSvYNKtdvU3uJjtQOyKIddq3V1RwMQipNebc
 1b0jcFt8b7Eh74KpG7Sn0tp63ZvTF4KxfyY1w3qFYTJSo/lOvl5ACx4uS
 yLZ9a77NV5SUi9Z8B5Ox/l9ESKbq9gwaPXg33E2e0+M38a6gJQo/ETKkK
 DdaajNU4lIMeLGaMUVNcDDJpLhQ+gUyLUyuAp9myb3UHqXHsLGjnnp8JS
 qMTqc3B6pcgRa1r5zl9AfbD1Fm+LHLoaE1EhpGfSN5e57yddF/VRJBz8L
 z3ntAJwt/XggNu7o5AjZ5xgOnX0nSpe3+UbrjhPWSvKGjiKluNYIiyKRJ w==;
X-CSE-ConnectionGUID: Jj566nJqTLm3Tf5dxw+7UQ==
X-CSE-MsgGUID: 5WGSFE3PQA6oUSkWcthU/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64207104"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64207104"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:56:14 -0800
X-CSE-ConnectionGUID: Z/fPdvtjQxS0PdhtBfrpgQ==
X-CSE-MsgGUID: 2Kgu+txjQkSxcL93SvuGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187665913"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:56:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:56:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 10:56:13 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:56:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fU1JI2BhCm5cfcf/0nks1/jSTlFeA/BUg9hECVyg57MuYs1//LW8eFr1BkY2Hdt+yIVMtCLXqj1Omb6RgHy/PMcerzrRdIuS7Y2LvS6BkacHnaPCydko95Nz6xL0HpZA5SegszP6pq1Sx0d8VhlQvRt7WrCE3kSUakxScnj1Cgok6XJqahH2X9089wN35qgFm8USeoXG6ShI0VrI1UmdRRTBmMXLFDjPlwG9wmN7vy+xV1oOKZea7SlHtqU7Zsy+KTADABFjcetTECauQNmnnPaQ82pGCJUZRj5OVmDOLyOB54FducAKovePvG+ORQBV6oQR9wxQ3lSaiynyTrNuGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B0kVwOHQQ6ga+hVxTscjagZtlIYL6m3AblDO2M37SI=;
 b=qYnWUdIje5gDdIAv+IRzDleHiPmcR7IDBJetEMfwgL6xLolcukBttBpqfh7hXkCaLZyiDOLTCZLiygPwSaD9/mbhVeIB5xzGI//QH//jtKRfT0VC41kJvWkGJncvAHF9sHhC2ZJiyZlyM7/+im85IRUSMA0/rzL06MmDPF7gvrIPRQEkYJNqdQBWQrSYB+B6RS+qVQy6XPwTJR5DiIQcEGYmRB6sdGaNeGPkOlq3tibFoajsUQKYogf+vekJ4DFJle5S9Oh2coW+XhigU2ZILPTxKnm2VYrc2LCFHlz+Qj1ZBG1JJAJKqcfAiGsVmAGfLnSgw1+SPEQn0cbiDb3Njg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 18:56:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 18:56:08 +0000
Date: Mon, 3 Nov 2025 10:56:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 6/7] drm/xe: Add xe_guc_pagefault layer
Message-ID: <aQj6xi3HUTHcBoD4@lstrano-desk.jf.intel.com>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-7-matthew.brost@intel.com>
 <sfcg7e3k33utodthmvswkqyav66z3toqn6seiipgnkz5gmxzdc@7f37xxkdfspn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <sfcg7e3k33utodthmvswkqyav66z3toqn6seiipgnkz5gmxzdc@7f37xxkdfspn>
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: ec13458c-1164-4a8a-9b52-08de1b0aa62f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cHlFkpoBnPS/DV2+l1vrbWin0lim00ypyX60rW2nZQFaEK1umVi8pJLTjmvf?=
 =?us-ascii?Q?tTlazebiapxM3XZ3LvhaT/gc4Sx3HC+/dyfHiSYHaKqyua2BuyxjC8ObI7Z0?=
 =?us-ascii?Q?bb6u1JS426HOiKCk3zggcW0Gln9PpdVAaZe0UCaEXSOoxgRds8JyUvAhcrqd?=
 =?us-ascii?Q?2EBWEP/A7viHjtqlIw+OZlvegfpY7DWBV/FRVBIh/tdcmxwP3yJC3lKUvLwY?=
 =?us-ascii?Q?AXRqMcZKqg7A7apk1qpnmeDnFd54FPYlVil5NuDqaFTXbdZ0fkbUw82tmDrp?=
 =?us-ascii?Q?6uiijccBakk5+JmlcSbXQ7eIskzxVeEIAowakLXXfjAZiwdtOfvGgKYDrwEq?=
 =?us-ascii?Q?OFKNx8/Fsn2m8h3vZRCIv08ltoBCBUnNk4LuGHc1IGM9kSVNXE5cnd251p0v?=
 =?us-ascii?Q?KRcY9jDxj0ahl/nxHq3QTS5hJ5bjBlkJH5J3vIJzQg72bNo2wx3/JQJITHx3?=
 =?us-ascii?Q?PMZdRyVGeGwaqC7V+Tu+bHc39aJzSLY28o8HXbT06LJbISyQH2ug9ys3Q4z9?=
 =?us-ascii?Q?FT65f9YZvQ+hfCgJT67KLaIB9O3B6o1sE6ynuKWYD1IPl11n8wX8xj2WZEux?=
 =?us-ascii?Q?+yEidgehxl5rIcLwfHStNoumlQIPlnqH9pvpQ+gnuXAfhO6zay/JLzIFkeVw?=
 =?us-ascii?Q?gu84lH/vAUPC+FShK7KNNh9G+tNQwyo2/kZRut7bjrKy/rcQ2zf0v88k9IwI?=
 =?us-ascii?Q?Od0EBnzi3C7YrlJUZ5B0pBiId7PwRVsrX8QbEr7lQ/0Ut6nCWOFOgA7cYwrB?=
 =?us-ascii?Q?92wzrJ7qZQISkp/orQe591sjIYmBUlUUMIL+oH5v+HCuW8VjQtj+VXxBuI55?=
 =?us-ascii?Q?Q2ldcQlarFm5u+k56+sxViPEyib92AHNk7ssGMdQRtEQXj+S+velUEBWsPtx?=
 =?us-ascii?Q?i65sPazeVekl2JS/TROR+J+S3qJLenazFbxbsTBXVLBlg26WFkw3I+lUyZAX?=
 =?us-ascii?Q?QctkFCz2g3FH7Yj62SDKN4FM1jKvAo+n4vrQwDX/gsk+Ek0MTZcVH8RXTlhc?=
 =?us-ascii?Q?hQz095mfrAgOB48jvmJI9OiDodlmlmYHE0oKSPJVwhUgb1/AVFHiRi4ORq7B?=
 =?us-ascii?Q?/GPsPTDVfxzLr8KALQ9+TrOCGBVGFUt+1DQ8gcMgw06b0uu1/na8HSbKlSvY?=
 =?us-ascii?Q?TMAQzHE9IhQRv+OlLwP6p8M+pNPOULDXcnzEVKU19QShBo50/NTRg/uuBiim?=
 =?us-ascii?Q?gNEHVDfqmuqfmJFlmKiWiNSaZeYopSp9xdaDy7pJUF5hqjIRAfM4rUUmXx6k?=
 =?us-ascii?Q?MNCZr9/JgRGEVrBykhTlEiuKYyjiHTfZWbmsbk+UB+k07hOATWj3Xj6i6tIe?=
 =?us-ascii?Q?iJnKFvREWrfwoS2BdkrFkUarw8VuOayzq9HXMMNBF8r7PdIbcTil8/weegCP?=
 =?us-ascii?Q?DmygjzUVsGawbJPAtfwHkQ0fAA4XgLEN1xNaeqy3PRk+beHsav91ZN/+zHhZ?=
 =?us-ascii?Q?VPD1mWCOjfmJMkauXwuEBrbj1mcbclcq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kE7KN70OcPYg+lVfMEaegLbJYdV5SD/UELcvxAOB14xBufH79tyRylRJFGjE?=
 =?us-ascii?Q?3/ncCLywXJoOu7a51fmTkjo4hTsGJ2Ba7p21hn4p/dsADzcwaNW/gYw7m3Pb?=
 =?us-ascii?Q?Nzw5Ni7jk+078qryhG8CFEDmlUumVSmmmZZh/x1OB/dsFutAlgGn0AtLPLXg?=
 =?us-ascii?Q?Lyng1Aswm6dcbpOmaN02fmZUNO5FlOBwb/pgoGjYrANCUZXrViRb5Fc2Rg51?=
 =?us-ascii?Q?bWoSm1l0VGgRNhFi49iB00zj3gRppbk1n+jgve0ss/OD07UjFZg3E5HVxUMi?=
 =?us-ascii?Q?zHFgjxBKP7HwAj8TKXbq2Ruw6MWQ6FxgsKLI4L8Yxo2JvIWSuej+KFXv09Ej?=
 =?us-ascii?Q?4OxeDpS9Crr/aoP5KJkvAw6L28JZJ14uuajlGHauA/b0K8YIHixeT1dMmXoz?=
 =?us-ascii?Q?6RgBrT9tkniPcJTG8ZIJJoaLn43SNxcIFL52df2X6xOpd6wKKmizttUhQlKK?=
 =?us-ascii?Q?xsXxfyZfzcsPmkPcOG1Ot89Wskh0e0TCUupekAwFamDjWlNG2Po3HWcGDjRX?=
 =?us-ascii?Q?P2rdIG4EMFtk2xdnniJP+4BOGbb7vJB6dvlAYwRr9hDBGBrIbL4qtvs561LC?=
 =?us-ascii?Q?0VoUlRuP02QLb4cRic94qxPqJA/l8yPFdumA2DfHzdiNqjxwUQhHk/GjfQPL?=
 =?us-ascii?Q?d2XL9c3VVVtJBJD4OT/FEKsIai7Wk7fCRj3PwyyYwLqWxxqLIUxTRX0II/Gs?=
 =?us-ascii?Q?uaS7tNTu5kLev21UvtkRGD/SJXUgxB2JN3AAP7qQjR/ED1SONgpFlAPeZXN4?=
 =?us-ascii?Q?pYRVxophSwbbjrgsybcqbWRNoJxxSnl+TaT1sEN2FjgI2IV84CriSEyLuba/?=
 =?us-ascii?Q?qYssNyqXOwOjC1T+s6lSJnqnVWyzZrkX8c7QoY+VNOfK8IKH0NfQtEPL+nd0?=
 =?us-ascii?Q?S+8vObUY4fnncL2f4mOpM0PgAoE7nAbrIryx74J9QVP+9ZRTzO8okJQYorpu?=
 =?us-ascii?Q?YpQWdYPx6vDEO5eQ0cPVBo3SnCzMbgqo/ah6luiHX3Gg64lioScyoyWUoBXa?=
 =?us-ascii?Q?r+by1FSOnqzNgqIay0r+6j14rYoKKmnB0vtix3wNOz7E4On68TtJlSBkkowL?=
 =?us-ascii?Q?YrFOgIs6UPc8HlsrVNl7bgGL+VjpzrHxBl7Af4D1vacAegkJW6yzsADO+Fdk?=
 =?us-ascii?Q?LHEy/BNJUxEv+PRDOtCJHPEjjCDtk38CDm3ZqkpzO0/lQvqQ10X1W1uWPnku?=
 =?us-ascii?Q?YgKrLwXqjsVzzcynpzwjeBuYWD9OfPObT7Q+pckbTcwTDZA19yYaYYu5vqmo?=
 =?us-ascii?Q?vAnlLtnUunBu2ymHlLnEk4Of/7CXgRRX8Bmbgm2bea8X9f3yYeOXIBppEN1N?=
 =?us-ascii?Q?ghbRbAXxn5ENIHI3mIVSpUvjwT085GFnO64BCSmciiOEjjBN5W3YSrTa2fJ8?=
 =?us-ascii?Q?1g3Q0owwS3XGPG8aDGF85OnaOAPKfgCLY3iCCuP1yTVx/JRvrI0FDac5D+GW?=
 =?us-ascii?Q?gnsELuot6Xkk2rNYZZHQc6A/sJ/3P06BJnkcIpHdF+zDbjbimAA2buwaTdWh?=
 =?us-ascii?Q?eHkCH3ExMX4wNhzScFpB4q8i6lLOcbLbgHRPok47kT1ibXXBfBzSMsoqD3zL?=
 =?us-ascii?Q?Sr63IKnvB3BvjdlIOYFoc+p1Qz7LycL5FvZvGMseV1X7xxwLDPnniswpX+2z?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec13458c-1164-4a8a-9b52-08de1b0aa62f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:56:08.7077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxiwNi7qSWzZHDRSIZ7MR0GNcBUKauo2BUjGuCYgZAXdATAVoKfyPA2iUc+nSvJLXC/oSKnWNPTGPdSYLQ8RIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

On Mon, Nov 03, 2025 at 12:28:50PM -0600, Lucas De Marchi wrote:
> On Fri, Oct 31, 2025 at 09:54:15AM -0700, Matthew Brost wrote:
> > Add xe_guc_pagefault layer (producer) which parses G2H fault messages
> > messages into struct xe_pagefault, forwards them to the page fault layer
> > (consumer) for servicing, and provides a vfunc to acknowledge faults to
> > the GuC upon completion. Replace the old (and incorrect) GT page fault
> > layer with this new layer throughout the driver.
> > 
> > v2:
> > - Include engine instance (Stuart)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/Makefile           |  2 +-
> > drivers/gpu/drm/xe/xe_gt.c            |  6 --
> > drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
> > drivers/gpu/drm/xe/xe_guc_pagefault.c | 95 +++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc_pagefault.h | 15 +++++
> > drivers/gpu/drm/xe/xe_svm.c           |  3 +-
> > drivers/gpu/drm/xe/xe_vm.c            |  1 -
> > 7 files changed, 113 insertions(+), 15 deletions(-)
> > create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
> > create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index b35021e5b9eb..319f208eb19a 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -58,7 +58,6 @@ xe-y += xe_bb.o \
> > 	xe_gt_freq.o \
> > 	xe_gt_idle.o \
> > 	xe_gt_mcr.o \
> > -	xe_gt_pagefault.o \
> > 	xe_gt_sysfs.o \
> > 	xe_gt_throttle.o \
> > 	xe_gt_topology.o \
> > @@ -73,6 +72,7 @@ xe-y += xe_bb.o \
> > 	xe_guc_id_mgr.o \
> > 	xe_guc_klv_helpers.o \
> > 	xe_guc_log.o \
> > +	xe_guc_pagefault.o \
> > 	xe_guc_pc.o \
> > 	xe_guc_submit.o \
> > 	xe_guc_tlb_inval.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index e4852c4c90cd..44ed3202dfd1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -32,7 +32,6 @@
> > #include "xe_gt_freq.h"
> > #include "xe_gt_idle.h"
> > #include "xe_gt_mcr.h"
> > -#include "xe_gt_pagefault.h"
> > #include "xe_gt_printk.h"
> > #include "xe_gt_sriov_pf.h"
> > #include "xe_gt_sriov_vf.h"
> > @@ -638,10 +637,6 @@ int xe_gt_init(struct xe_gt *gt)
> > 	if (err)
> > 		return err;
> > 
> > -	err = xe_gt_pagefault_init(gt);
> > -	if (err)
> > -		return err;
> > -
> > 	err = xe_gt_idle_init(&gt->gtidle);
> > 	if (err)
> > 		return err;
> > @@ -851,7 +846,6 @@ static int gt_reset(struct xe_gt *gt)
> > 	xe_uc_gucrc_disable(&gt->uc);
> > 	xe_uc_stop_prepare(&gt->uc);
> > 	xe_pagefault_reset(gt_to_xe(gt), gt);
> > -	xe_gt_pagefault_reset(gt);
> > 
> > 	xe_uc_stop(&gt->uc);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index e68953ef3a00..529d2b3bec21 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -21,12 +21,12 @@
> > #include "xe_devcoredump.h"
> > #include "xe_device.h"
> > #include "xe_gt.h"
> > -#include "xe_gt_pagefault.h"
> > #include "xe_gt_printk.h"
> > #include "xe_gt_sriov_pf_control.h"
> > #include "xe_gt_sriov_pf_monitor.h"
> > #include "xe_guc.h"
> > #include "xe_guc_log.h"
> > +#include "xe_guc_pagefault.h"
> > #include "xe_guc_relay.h"
> > #include "xe_guc_submit.h"
> > #include "xe_guc_tlb_inval.h"
> > @@ -1545,10 +1545,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
> > 		break;
> > -	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> > -		ret = xe_guc_access_counter_notify_handler(guc, payload,
> > -							   adj_len);
> > -		break;
> 
> this doesn't seem to belong here. Should that be in the last patch?

I think it is in this patch as xe_gt_pagefault.h was removed as include
and xe_guc_pagefault.h was added. So I think this is probably correct.

> Or a dedicated patch for acc removal?
> 
> I started to look into this because we need to add support for the
> prefetch bit for xe3p, and I think it makes sense to add it on top of
> your series rather than conflicting with it.
> 

Yes, adding it on top would be preferred from my point of view.

Matt

> Lucas De Marchi
