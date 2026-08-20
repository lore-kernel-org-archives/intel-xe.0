Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A783C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 15:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B5E10F0A7;
	Thu, 20 Aug 2026 15:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eU0v765X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4D310F0A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787239340; x=1818775340;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UNco5vqOSSsqGqUPArkxSNYMDoiG6cE8IkW/iJO7nT8=;
 b=eU0v765X60kl4KyrHISYgQfCUU2H7v1W2yAWTCQ5J34jYs12lRWbLC/z
 skacC5hXQjVcE9tHHu8kpAbRcYkLV4j5fqhk+dJmGSuFs9iBlrQhi6l8q
 yDPNwP02cHtWCOs2PHpU9XeDavmdIv1viEj+yO1xV7AfBj6U/0Z1bMlEg
 HLxT+yu7lG2qekV9L67cefcP2jR1MC5/vDqGKPCO4sQemOc5ME4UhYowJ
 NBpfOIft55n35iFUZPZ8vUjg5uTCCNZRiKt9uSygMmwWtWi2c/YjhwMBh
 cdK15dPeCKMFmkJeAaZTyQkUcMhWBXJGIrERpn8n+raO2tWwoZerAw0/z Q==;
X-CSE-ConnectionGUID: 3OyivW2bSzSaL8cHe1aloA==
X-CSE-MsgGUID: 5W2Cx7V8QJqxhgy4HeBmCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86727433"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="86727433"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 08:22:19 -0700
X-CSE-ConnectionGUID: r6LI3Ml5T3iCtQ3yS8axRw==
X-CSE-MsgGUID: qbmGGTjTTeajzN1QDyB+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="270310633"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 08:22:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 08:22:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 08:22:19 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.33)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 08:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpigTyK5eDiKZVlYxHlY2OrsWc/t8wLmS2FJo9Q9PtITJcpN1v+3dTUjUFKqWbV83v96cJseLY9mwfMOOeoUY8rdZVAjiOiCHBwms/gDsTeMmgegBRe97CbhuAA/MtJa7I6w2Ao/STRoh5oTbTvcJs4BrinfxAFelBUkMYq5FkHTZwJzw9ScgyTXnjxwkXBW4AWDS2nPNoNiv10IX2itQcNJ8Zf3YsjMLNTRZA7VkbgRuyM18KSckkxcVmKECitOQkMwT1cyfi2NH93gkO7jN7fJ47W4+ckrZztr6g/dCgn24G/oNWaNYw5acq4XDqTCwpzy5vJuUHqNqnKIj/p2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcxX/IZgzsgqsSfurxIlV74nUPpEQseKhwtiiCfC30s=;
 b=nDmm04VEOsH7HO8eLJP8rFv0KnM5vr6wzOmoxOY9hGsjZqLCSYLa4KCCrFcla5lFfSL/koB6SHqtOSF1e2BENIt44TiO2nlJj/BbqqcayG/0koKHU58qj3WadFF7AryMzZ16Ng1Ot+uWf0uXoCpQm9m93BfAdTjlTcd33gVQuYwss7g2Bic1cHwdHbmKtmu7++g7B5s0IzVC3xvRwVecPBovLfXMLL5VkIGaeQt/ua35oeZpuUv2fr10ub1rWrNWjOxuegckDXT8tkpT5EPB/95doqhgNqSr5m/RxS70Jcz1KdWc5imKVSUHMdPCaxK5DlLjSuDqsUMJ5QPVYWk/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 15:22:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 15:22:14 +0000
Date: Thu, 20 Aug 2026 08:22:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/6] drm/pagemap: Add fault injection for higher-order
 RAM folio allocation
Message-ID: <aocbpOKlZaYVzXms@gsse-cloud1.jf.intel.com>
References: <20260805231041.3791771-1-matthew.brost@intel.com>
 <20260805231041.3791771-7-matthew.brost@intel.com>
 <bc7357ee-e7f2-442b-a367-b3be2be6559e@intel.com>
 <aoam2CCqmye2vWxF@gsse-cloud1.jf.intel.com>
 <3a0fd8de-6e2e-45d0-803f-a0274d4630ce@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a0fd8de-6e2e-45d0-803f-a0274d4630ce@intel.com>
X-ClientProxiedBy: MW4PR04CA0261.namprd04.prod.outlook.com
 (2603:10b6:303:88::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 91071b8a-865f-4b9e-a569-08defeced042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Wev+6WHGmgzF6xopeXQ/GsoZZWyt+hmFPoFsX5yF1cGH2Sse97DBnEnJt58ANUOOgtgTW/WyrtmB+OFSv8tUTVr8LOsoPeX//bTfI/VaRykW+ydgQhVdWPBOLJptokNeOh5UIuKPxoYz8VKQJlHyy/n9idZ/A/NuCAS0gXPCVSLI3RG0s4mrcDOG3Ex7pAJC0TT6WldUDi4kjObfb8QV6vB0EQ1M5CoiYI/4eJjiaVzzGyaiqgCf29BY+qSDxYv1MeVvO2S+VQN/uLaK5fSqbiYDyahIlfQY0hVEEKNNfNDgS/Hk8UBUv+VBazMTVXoYOdN1AKt0cZ8omzEg4DPaaVabJc/gJGwmh9qhYQQfnFSfgpEbwYRMt14Byt7PIx4ZVPDtnhpWJbADjd4YiEQLeJhmCkxsxkJaC6kHXdpLeXlqBi7ibeKDrDHFbS40oemmtNKWJUCStPRHr+YKrfy7ZkPBVG2rRqdC2MB67vq4ZOhb/tBp6BnFNZxXNvwW6kNF//UFbDZ9fx0GwPxrYAL8wNP8OgvBUhcqDzRVK6oTG40TvRY+LLGMrRFZeESGW04O8IKhbYVKQBhXQuMzaovRInDmzuxK4TQxDqCqpUU3EAwJYjIXdZ8mT/hFrerBWgP+eZwtzHzjzZUXAEO0rYhqyeX4Yj0SlTbov7i36Intehk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t6GEUwximjp+7yZqUP4tMS2XdKJPIOSBEdk1tP0gAxpPp431Nvyy4Pzrbd?=
 =?iso-8859-1?Q?8Mk0qGe3rEFBfQAYaKuO+uvSis1fcsq9wYb1dHtuxzn6dR4qQ2LXKTbo+P?=
 =?iso-8859-1?Q?VVuidls3EVm1rI/gcpGRC3Co7DvIta+AnGdLhtBd0qKDVAZJYsVQRrulqN?=
 =?iso-8859-1?Q?KCiTPGHeVGlDu77+OymnqBi6ee98jTy6jVm8pl9yRtifc93URPg4C7/2/w?=
 =?iso-8859-1?Q?5bjR2LOu8aS31qARKRI/dMuaQpOlupFbMmQyTqn4y1nZ78DOCtdV8H443T?=
 =?iso-8859-1?Q?poQ+77a9ORwK/dPvC/d63brLBWme5J29Mgd6X9ljI2CpaSNaZSbjE7CtYf?=
 =?iso-8859-1?Q?tBl6SXeoMFcrTqCpL2u01haZ4HnUIngRDyR/Oky7pw3D005DQwqp2x5VL1?=
 =?iso-8859-1?Q?dHVJFDWks8+/wv0pRgmtNd2uA+v/eGgMjNrdLlLEbmcbmbncaq9bmVpHRP?=
 =?iso-8859-1?Q?t2IM4IckiIFKZZ504EylHLH3VljRKfmca7GgFJiXTSa8DxjQruwZownniw?=
 =?iso-8859-1?Q?BovFdTRc8jJ2ldort2vSByQb+M2ueKHWkMc9wv9LNuqs3El93IGjZVxI/r?=
 =?iso-8859-1?Q?7Hv9YLyVnWJcXsg+oIADzjNvC/jslgOwW4m8BqC8/zb0rNRWbmNHafRDzs?=
 =?iso-8859-1?Q?nS6FCDvGVQsBLZf2/8F6QVM/sOXGFseledA8R01CS3E+exkjaBsmW6l/gF?=
 =?iso-8859-1?Q?6lBATg23XYKkV2pWhPdVoH6grlEkgR9Rp8eSA0brlwEtrKFq5T0KbSxbt5?=
 =?iso-8859-1?Q?EtA2RrYitkVpEWzYGrAiHomH3zsa3aNcwYYWxtnA2Xxa+vToxbkdQK4HAD?=
 =?iso-8859-1?Q?ud+mfMlKyrrgvlTAQQhRbqMr2ztl1J3drIOalYj6vhVUmTJ0D7jivvMEsr?=
 =?iso-8859-1?Q?s5IeftFg6BSBtAeaw6ZPL8GcbYQnen1jM6pxbTBCR37iBlELK9zfNSWVOz?=
 =?iso-8859-1?Q?Wu9h2eygS7cvgY4za3I+warStdfgKEbJbxkgpeZfoWt7BiJBGy2XPq3AYl?=
 =?iso-8859-1?Q?iuarrUaI59wMFixY0KvwhY9nLd8UUGSZdL07OJWouTJYZzH17BRoNdRUd2?=
 =?iso-8859-1?Q?TTvtSR8uFDR3yIYMobKIlz41yZVJ+YzMrVp5/3BvVwj99uDVYGTUzud1yG?=
 =?iso-8859-1?Q?ciAQe7a303Ejbtmi9bt7ud6LrKiO1TMnX47q1MZZBin7Athohg2JSQaT+k?=
 =?iso-8859-1?Q?UFQdyf8c/IC6rm2jev1k/BCIMVBzj/xjXg1RHGKdUivxFave6MDv8MRMlh?=
 =?iso-8859-1?Q?MYNlbIXpT3B1Q93m+Q2Irev5lLrvl1VdmO1GfHK0+RPqCGp14Dpty3RZmE?=
 =?iso-8859-1?Q?ZDJuyNO5K08RzA5JJVs2UdIXAjZBQNiy+w3hP7CL4wJAAKiO7HJX2anCVI?=
 =?iso-8859-1?Q?y2cSRds6S8FAF7ozEYZI+Nf4bbGvYhG+SxgvdDYahrTDuDSLi2QZGB0/hG?=
 =?iso-8859-1?Q?xE/3q/JelqbATGwRZWyKpFrSFLOxU++xl42IKYNt+dokbnXDZZNFHtIzch?=
 =?iso-8859-1?Q?ELXLUMFbIjrd8PbaqfWIgS5BmdsFfigUm0tx9ww1v88i0IcZTmsE4LMQjx?=
 =?iso-8859-1?Q?xL2asmAJBqogTLlQOnHrnMc8x+hBg9StL4gMSoExCDajzO8CTsMdhtJRi0?=
 =?iso-8859-1?Q?jSmG/emHLEBZBEHd5X9oi+kFoBjU/CSuK1a7pOSgW42jk3Ci4ViJPV4eHu?=
 =?iso-8859-1?Q?5mw7zdXC5MZ/VvMPvL8zsbRpiwP07h93LQovHkgbk7bILg4F3/0rbC89r/?=
 =?iso-8859-1?Q?53wCIQvAjwQZPj5DRbQ6jwfOvcuToaScCVi/SrTgMLOl/XiawoqVBW1Ich?=
 =?iso-8859-1?Q?vEkiG3F752NUmLNSrUyaP8lqTaz+4j0=3D?=
X-Exchange-RoutingPolicyChecked: HeFL6XlciywfoqcxXvSfcsQNzp0+xD8hRh5v9ZXPWEo0mZni2+igicCYkpCt0fascP44SBc6p3R60uuEyugIpPD23IVebpHkFGCis8lsnPQvLEhPpiEmYYL8nZPct0rr4JQrdH1MEjjOWluA95br8xQQ3JuyooNzkMHAC3IMcBGCX1AgpA5BN/dFfuYzBmNmHGbZUElhzwB+teW7RwoUPrNcF/Vt+ff3DlphmRaGH+k2XLKcEonuwGKneQqjK8LObjoEz6+69Div7Eqaayy70e12LBZZUJzG9wAT5zgquvnMOqpjEMdv3S35jRjGswsIriA8cB3yldav1xBTgri6Dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91071b8a-865f-4b9e-a569-08defeced042
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:22:14.6553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQf1b5nC0eCeLFrPZ5L3dxN4WH3oyl8WL8g9jGEnwdMAX8Dv8zw97NBosnSocGNS84b+zt2cO3ysHd9CXr/klA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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

On Thu, Aug 20, 2026 at 03:58:16PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 20-08-2026 12:33, Matthew Brost wrote:
> > On Sun, Aug 16, 2026 at 08:44:21PM +0530, Ghimiray, Himal Prasad wrote:
> > > 
> > > 
> > > On 06-08-2026 04:40, Matthew Brost wrote:
> > > > Migrating a device-private THP back to system memory has two distinct
> > > > paths in __migrate_device_pages(): the fast path where both source and
> > > > destination carry MIGRATE_PFN_COMPOUND, and the fallback path where the
> > > > destination could only be satisfied with order-0 folios and the source
> > > > THP therefore has to be split via migrate_vma_split_unmapped_folio().
> > > > 
> > > > The fallback path only triggers under genuine memory pressure, which
> > > > makes it both rare and awkward to reproduce, yet it is the path where
> > > > the interesting refcounting happens (the CPU fault holds an extra
> > > > reference on the device folio taken by do_huge_pmd_device_private()).
> > > > 
> > > > Add a fault_attr, modelled on backup_fault_inject in ttm_pool.c, that
> > > > forces the higher-order allocation in
> > > > drm_pagemap_migrate_populate_ram_pfn() to fail so the existing order-0
> > > > fallback is taken deterministically.
> > > > 
> > > > The attribute is exposed at /sys/kernel/debug/drm_pagemap_fault_inject
> > > > and requires CONFIG_FAULT_INJECTION_DEBUG_FS. With
> > > > CONFIG_FAULT_INJECTION disabled the helper compiles out to a constant
> > > > false and the injection has no cost.
> > > > 
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: David Hildenbrand <david@kernel.org>
> > > > Cc: Lorenzo Stoakes <ljs@kernel.org>
> > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > > Cc: Liam R. Howlett <liam@infradead.org>
> > > > Cc: Nico Pache <nico.pache@linux.dev>
> > > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > > Cc: Dev Jain <dev.jain@arm.com>
> > > > Cc: Barry Song <baohua@kernel.org>
> > > > Cc: Lance Yang <lance.yang@linux.dev>
> > > > Cc: Usama Arif <usama.arif@linux.dev>
> > > > Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> > > > Cc: Rakie Kim <rakie.kim@sk.com>
> > > > Cc: Byungchul Park <byungchul@sk.com>
> > > > Cc: Gregory Price <gourry@gourry.net>
> > > > Cc: Ying Huang <ying.huang@linux.alibaba.com>
> > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: linux-mm@kvack.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Assisted-by: GitHub_Copilot:claude-opus-5
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/drm_pagemap.c | 36 ++++++++++++++++++++++++++++++++++-
> > > >    1 file changed, 35 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > > index 51c6f12e4256..6ae8c9aa36cc 100644
> > > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > > @@ -3,6 +3,7 @@
> > > >     * Copyright © 2024-2025 Intel Corporation
> > > >     */
> > > > +#include <linux/debugfs.h>
> > > >    #include <linux/dma-fence.h>
> > > >    #include <linux/dma-mapping.h>
> > > >    #include <linux/migrate.h>
> > > > @@ -12,6 +13,27 @@
> > > >    #include <drm/drm_pagemap_util.h>
> > > >    #include <drm/drm_print.h>
> > > > +#ifdef CONFIG_FAULT_INJECTION
> > > > +#include <linux/fault-inject.h>
> > > > +static DECLARE_FAULT_ATTR(migrate_to_ram_fault_inject);
> > > > +
> > > > +/*
> > > > + * Force a higher-order destination folio allocation to fail in
> > > > + * drm_pagemap_migrate_populate_ram_pfn(), exercising the order-0 fallback
> > > > + * (and, in turn, the THP split path in __migrate_device_pages()) without
> > > > + * having to drive the system into actual memory pressure.
> > > > + */
> > > > +static bool drm_pagemap_fault_inject_folio(void)
> > > > +{
> > > > +	return should_fail(&migrate_to_ram_fault_inject, 1);
> > > > +}
> > > > +#else
> > > > +static bool drm_pagemap_fault_inject_folio(void)
> > > > +{
> > > > +	return false;
> > > > +}
> > > > +#endif
> > > > +
> > > >    /**
> > > >     * DOC: Overview
> > > >     *
> > > > @@ -960,7 +982,9 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> > > >    		if (order)
> > > >    			gfp |= __GFP_NOWARN;
> > > > -		if (vas)
> > > > +		if (order && drm_pagemap_fault_inject_folio())
> > > > +			folio = NULL;
> > > > +		else if (vas)
> > > >    			folio = vma_alloc_folio(gfp, order, vas, addr);
> > > >    		else
> > > >    			folio = folio_alloc(gfp, order);
> > > > @@ -1554,6 +1578,16 @@ void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim
> > > >    		kfree(dpagemap);
> > > >    }
> > > > +static int __init drm_pagemap_module_init(void)
> > > > +{
> > > > +#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_FAULT_INJECTION)
> > > > +	fault_create_debugfs_attr("drm_pagemap_fault_inject", NULL,
> > > > +				  &migrate_to_ram_fault_inject);
> > > > +#endif
> > > > +	return 0;
> > > > +}
> > > > +module_init(drm_pagemap_module_init);
> > > > +
> > > >    static void drm_pagemap_exit(void)
> > > >    {
> > > 
> > > Missed fault injection debugfs removal ?
> > > 
> > > Sashiko flags it and looks valid concern.
> > 
> > I checked on this and kernel wide no code seems to undo
> > fault_create_debugfs_attr on module unload, nor is there a function in
> > linux/fault-inject.h to undo all debugfs entries setup.
> 
> I believe the cleanup is done via standard debugfs_remove_recursive via
> passing the fault_create_debugfs_attr dir or parent. Here we have no parent
> so
> 
> dir = fault_create_debugfs_attr at init
> 
> and debugfs_remove_recursive(dir) should be sufficient during
> drm_pagemap_exit
> 
> I assume not cleaning it exit might leave the debugfs entries incase of
> module unload.

I think you are right here - realised this after typing this.

Will fix.

Matt

>  >
> > So IMO this is either everyone is kernel is doing this wrong or this is
> > a non-issue. debugfs_create_file kernel doc seems to indicate all
> > debugfs enteries should be removed with debugfs_remove though (?).
> > Either way I'd say this out of scope for this series.
> > 
> > Matt
> > 
> > > >    	flush_work(&drm_pagemap_work);
> > > 
> 
