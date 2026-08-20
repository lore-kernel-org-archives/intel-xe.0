Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F8AC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 07:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6B210EF23;
	Thu, 20 Aug 2026 07:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPjWGH09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6956110EF23
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 07:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787209441; x=1818745441;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rCctXR0JeKAc3Vh+1ocNNdRAH8sPHkJjT6ljLFPeCi0=;
 b=MPjWGH09Ks05eGu4m3JC7l8gOfQIVaPTB7jIPX1EgNkXX6fCcfKttayH
 bUeStKf/kq340xVPNsQzGdpS5JAk4DFeYSyBvVotTmLU2JfwPvshBOuGZ
 OMnZD1+5po02g2sVWATm4IAHtslcCfA1iJKeOt1tZrIPJqB6Vu2/YWZol
 ucA+GwPH/2mpVUX/Qcxq8l184Q42JKSidfvIECw04a20BO6wk2+PY6HIe
 lPzXLpLudOUFNn64RZngH0o/rcTC3k5b9nJilfkf1O3+iOHAJ/QJlDtwt
 t2NhgfwGPyJt48PdligAyXBFpCRkr2B5VQU83AeXQLtyBFt6H3UEvRSjv g==;
X-CSE-ConnectionGUID: hxpUxvCmQKeHOmo2Ppf87g==
X-CSE-MsgGUID: sxGwNqx1RuuJ6dM2YFUHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87857469"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="87857469"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 00:04:00 -0700
X-CSE-ConnectionGUID: TxsbMeJ5T+i5n5LIVb4Enw==
X-CSE-MsgGUID: XfbhKTD0Ro6MDVrze1JMCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="262572492"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 00:04:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 00:03:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 00:03:59 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 00:03:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSiQdxxqS1hA7aaHrekp+aeOvTHRWYkjHUG2PYn31Rn9z5i3MKT1zQiXFValqFczh3G6bS2BtIs/yPM0WjzRwGd7eEkxs/yUUHoHRqU8HplxOgC2jhDjXauTEoriRP5Vn++VAQ1Dv/I3AHZF+0KvI30lWeBOFPWZsnxtGB5QK05DPDqgu7gw0hLQGwA0vBGVyrQnKa6pGXtLaKtiJYeqrFFcylkbBmIhcfkI3aGGGk8a8T/vL8p6d5QuVjOxJ5BzErf+q66eGZYJLI3Y8XfraNPZss+rOVim686Du7hC7vd8130G55eXHBazRYisl0O5mc4/m913er3J2mNXRAoU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rP5QJTSmXfe78Bi5ZDPIrdqBM7fXB02TxuK1fjTT0fA=;
 b=CEDKhaccNvcFS9tTXfzh3hTPWjECdqvpcXhw7LZGFf3ha2CZg0SLYH1giDyXEfPL6s/dWnZlWXCs5CtYmQiM2iBWhHIfUptNqkh/QE/g/nWEV/MIaB/wdpFm+5lmYY4bTfJQ0TCEIgsxJttiev/AeSuFGsYmGbrpgPgbYw4u7Buz0aMOcl9kDJlKlMAH7wZgHgR2L/TaG++U0/dxEZL9CRcYUicQp9xx/9Rf02V38WKhOuv8gi90KwOfoJqlx9A3J20eSwRtU4xTmEtxYCYLW9fMPiE5jhK0j1N+6tmWKjtqT/RzFDYohV9bhZ7j/57BWI7IPU6zEDzN8SguB4ABsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB5203.namprd11.prod.outlook.com (2603:10b6:303:98::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 07:03:55 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 07:03:55 +0000
Date: Thu, 20 Aug 2026 00:03:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/6] drm/pagemap: Add fault injection for higher-order
 RAM folio allocation
Message-ID: <aoam2CCqmye2vWxF@gsse-cloud1.jf.intel.com>
References: <20260805231041.3791771-1-matthew.brost@intel.com>
 <20260805231041.3791771-7-matthew.brost@intel.com>
 <bc7357ee-e7f2-442b-a367-b3be2be6559e@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc7357ee-e7f2-442b-a367-b3be2be6559e@intel.com>
X-ClientProxiedBy: MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB5203:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dc2069-36fe-42f7-a852-08defe8932af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|4143699003|18002099003|22082099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: DvagMAU/S+WLm/O3jhNPH3U7RhYO3sIlYLoRH0yn6UZy5VNzlmcyizDinRFP8aNlKkqmDi3lwEA4XqRHvyUAmTi6EsOaYCiIH9jS+EIMDOb4W7HkRVdOaBRXQuH1XIrfi3YmUX+sOWTJcanIKR32CSRbsgEeamr62DH9oWwFUgsMbq2uUTRNpL5dP9y6eeEjeX9I4qxQV91t4SdSmfoT+V6g9w2dyfnOIVJEXQmsfZKCnUInwC8/Zqfah9DHBO8XdqBxAj/YcRC8qZ4oj5AdrrR9tdYztoTeNtRGBwM7Ea7+je1IrgO5oy0hvfsJjcg/ku0w8xBMV2/Tqh5dD5ixMSkqP3N3W+BlnzM9kzxDClTpd0GANH+eyZqYkvnh276op2VJBVCqYRubtFtJBoMlQNU+Lp/VcXhjVUJMfxZFXjzuT4JosOb9gFM2eEmcg1TlV9z3/zUfAceRTdNxPpjcls1/S+wlZ3nfJc+ZbwDFO/gHoKEbgjuscvgqdLY80VAXZ7urL0b3E4lmxifKz3/SNWiAxRM6cy+a0Mln5DPDPJ5ShS8S0Zx5I1v8TlwknW96gGuOpPemI+L59BNHHogXslWaX0390nYuHPzJbc801XEDkM6tiTI9YJ5wQziiL732ikqgE62qarKDxWuZ0ZX59TT01mOR0fHNtaLJU6kHe2s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+tu4PX9u3W2pS1bj7qokN4FHSmsPGPqIZnc+8aZ/soOQAXHqRj+x2iTAIU?=
 =?iso-8859-1?Q?aiTJhvMIQrq+JNmu1Smi7peBAiRKQcvA0HUvcbJsNO06reSKwYDgogl5Ms?=
 =?iso-8859-1?Q?/ga8cV4PjXz+7svpDwNuCsomqUZstHlGy46VG2pNeIpYisR2Wy29ithiOb?=
 =?iso-8859-1?Q?MpJbCBcf+vntyi3rzrMkOg3trBEYY7LhGS12xXISvVovB3Wd0T2/jeb6ej?=
 =?iso-8859-1?Q?x56MrFpIzmv6aYtZIXbVfewW/QHCKqVyHphfARrvfSD8O2fqtcdpkN17nJ?=
 =?iso-8859-1?Q?VoU3CFuBTrWJfaMT2hCRU264pY3yr8ZN8PO21Bl4NJNkFcTv35PRZiDu58?=
 =?iso-8859-1?Q?lD68yzINY3nGNcUZ7/GPOI7s9V+JzBgIoluNqLgZ4VU9Q9wh048Ua2a0q/?=
 =?iso-8859-1?Q?PNcz1u6DZXrOwax48KN4hOskjezRBxlPEyEnF5tTIhuwpVSc7OlYOkDFKu?=
 =?iso-8859-1?Q?8d/exdpshDA0ub4vNwqRaiiyDQJ4N+/KiUOWXQkjYwy/YIW5RY43pQYGsP?=
 =?iso-8859-1?Q?xAq9BMRca48ilrkyhexLtxi8acVTRp9eIAmTmD6zCGHf/1/AS+OvTiNQTW?=
 =?iso-8859-1?Q?0m0Lday/fAlMhBrDJ+al0n0rKWeZOgygHv439RXNMs0QrgCFalKdXVCxb8?=
 =?iso-8859-1?Q?ZB9oeUALM0pvYsRBtXf5U4k3eiZBE5ZM/MV89/oa3Oit4C15f6urGgrb+s?=
 =?iso-8859-1?Q?XGJk4PRPXaWGJjB0rd69IDp3N+y3ymmeF6mrxJ4aQI7RJZiTM6Ik45sHzw?=
 =?iso-8859-1?Q?U1k/sJQYUXe58QetFFQrC6glAYUllOSqpv/00XgtIPeMAGl4fsu2KMncWv?=
 =?iso-8859-1?Q?ejl2kQqo3DtWuwQtX7gDvrDo9ahrH4S0wJZyqEGOSkM8vJH+/OoJWIAbx4?=
 =?iso-8859-1?Q?RL2QO/v44jsGkA8pB+U9ye8ttrPFF69LmVqn5/VYQgwVTP7Tydv5bgTw1v?=
 =?iso-8859-1?Q?qMCOhAXakQqSCw4ruzRLr9cesVxjTIQClvY2dMYLFWNvP48IjD8AfiYJxb?=
 =?iso-8859-1?Q?vmcQINFi/jlwdk+ef0SPDGNefRqaaOevR5G6Mqqh+FO9XYHVgkoOZgpTNY?=
 =?iso-8859-1?Q?FoEzulVOiO445iN9oZYmDMPskY0CG3oGgq1St0odQJUjdpy5whMEkYal3h?=
 =?iso-8859-1?Q?F1VaLeGXOl8boPYl3urjNgOtlznRveK9xYP6WFYD5tkqTWiGk8L1hpMQbY?=
 =?iso-8859-1?Q?ViqiD4mgpvNN240FvehPpTcgbHRc273wAJsQrT8v1ER3SRMtbBn/+Znter?=
 =?iso-8859-1?Q?xcQ0c0WiAsAREpLMO3cZS/jvsNqID7Mko1sW/5Nq5bVcw1czm/kHsmZFrf?=
 =?iso-8859-1?Q?yZRmzzhFNbQC/5zpYTpYRZ9+8yb0dy8P2EJOQk8Roe1qvq9dMMlZfOVnkU?=
 =?iso-8859-1?Q?eafG92jruMnDE4AqsJ8DHyUd61StYlosOmRflTROtwrUMSwPVJJ7LQo0EC?=
 =?iso-8859-1?Q?taJtxYfUtgGo5nww27SO8cWae4snJGIisTHB0P5Y4bt5I7bpYVXWd4ESFa?=
 =?iso-8859-1?Q?Uvm+/66LBjQc8P8MqPq9NnxFOmsLQhZvVBPub62p95uXdWIJU3uGQh6kl9?=
 =?iso-8859-1?Q?oVpGHnUCTwJEt2Jl6aS8WMIxUGn2cPWZe4KDp90xVZTEL2iw/mWC3cAQhN?=
 =?iso-8859-1?Q?kWioXZRazx1lD23mK1iSl7q/C/wQhK1ON7Ek6mzI7EH6jhdau89AR6vLbd?=
 =?iso-8859-1?Q?IIUCfWdBB2ed/vlC43Hp8ramfqYg+UN17aWXV9hsQtVne7yv1EoSDG2eGD?=
 =?iso-8859-1?Q?SDJ5yoo5rkmAbaW7m+qMR2udaFNx4WNTT2wUA99k4gCJ1DhGKhTFmIxsuG?=
 =?iso-8859-1?Q?fWpHFmpEx6cHaHroqqbe7+IzWNIXGz8=3D?=
X-Exchange-RoutingPolicyChecked: BV5QVCPnHe4A43sXgY2o7kidZ84LbGfQnh7Zgtt5VtMQpF8dRLCNI5mSsWH/V5y89KaWAPgqd9kO32H6aOCxXxuo+D3JXCNlEUiFv66wNxpKFkYtprPQgtyPyWSi+sBWtUxtcwbe6ZSWEf/6qd0wc7oU9f7OnsCwMNLw0DiQoZ/UpMnJqIByENy+nWpb4rjs/M3cVVjkx3lhaNz8KZEBZSyEmRo+vEIxpx6cysFRZmI6NfkeH98l/h1gCCTYuJ7dTs7zfHoLiHCLULJ4aS3PcqGC7hdwpQOABQwQsiLpdRFpZ7whwDbrVnUip8FB6be1GD6ZX7W4ip8tQ05roEciaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dc2069-36fe-42f7-a852-08defe8932af
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:03:54.9533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMGw0nA/27WFf9ODxblWMPKlSZsLVKAqTu4ELVCuTBdu44E1VNZ2wOQ9aVZS7GSMLDvKmjF5Dp5F5TAbUPfiTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5203
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

On Sun, Aug 16, 2026 at 08:44:21PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-08-2026 04:40, Matthew Brost wrote:
> > Migrating a device-private THP back to system memory has two distinct
> > paths in __migrate_device_pages(): the fast path where both source and
> > destination carry MIGRATE_PFN_COMPOUND, and the fallback path where the
> > destination could only be satisfied with order-0 folios and the source
> > THP therefore has to be split via migrate_vma_split_unmapped_folio().
> > 
> > The fallback path only triggers under genuine memory pressure, which
> > makes it both rare and awkward to reproduce, yet it is the path where
> > the interesting refcounting happens (the CPU fault holds an extra
> > reference on the device folio taken by do_huge_pmd_device_private()).
> > 
> > Add a fault_attr, modelled on backup_fault_inject in ttm_pool.c, that
> > forces the higher-order allocation in
> > drm_pagemap_migrate_populate_ram_pfn() to fail so the existing order-0
> > fallback is taken deterministically.
> > 
> > The attribute is exposed at /sys/kernel/debug/drm_pagemap_fault_inject
> > and requires CONFIG_FAULT_INJECTION_DEBUG_FS. With
> > CONFIG_FAULT_INJECTION disabled the helper compiles out to a constant
> > false and the injection has no cost.
> > 
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Lorenzo Stoakes <ljs@kernel.org>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Cc: Liam R. Howlett <liam@infradead.org>
> > Cc: Nico Pache <nico.pache@linux.dev>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Dev Jain <dev.jain@arm.com>
> > Cc: Barry Song <baohua@kernel.org>
> > Cc: Lance Yang <lance.yang@linux.dev>
> > Cc: Usama Arif <usama.arif@linux.dev>
> > Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> > Cc: Rakie Kim <rakie.kim@sk.com>
> > Cc: Byungchul Park <byungchul@sk.com>
> > Cc: Gregory Price <gourry@gourry.net>
> > Cc: Ying Huang <ying.huang@linux.alibaba.com>
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: Balbir Singh <balbirs@nvidia.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-mm@kvack.org
> > Cc: linux-kernel@vger.kernel.org
> > Assisted-by: GitHub_Copilot:claude-opus-5
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/drm_pagemap.c | 36 ++++++++++++++++++++++++++++++++++-
> >   1 file changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 51c6f12e4256..6ae8c9aa36cc 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -3,6 +3,7 @@
> >    * Copyright © 2024-2025 Intel Corporation
> >    */
> > +#include <linux/debugfs.h>
> >   #include <linux/dma-fence.h>
> >   #include <linux/dma-mapping.h>
> >   #include <linux/migrate.h>
> > @@ -12,6 +13,27 @@
> >   #include <drm/drm_pagemap_util.h>
> >   #include <drm/drm_print.h>
> > +#ifdef CONFIG_FAULT_INJECTION
> > +#include <linux/fault-inject.h>
> > +static DECLARE_FAULT_ATTR(migrate_to_ram_fault_inject);
> > +
> > +/*
> > + * Force a higher-order destination folio allocation to fail in
> > + * drm_pagemap_migrate_populate_ram_pfn(), exercising the order-0 fallback
> > + * (and, in turn, the THP split path in __migrate_device_pages()) without
> > + * having to drive the system into actual memory pressure.
> > + */
> > +static bool drm_pagemap_fault_inject_folio(void)
> > +{
> > +	return should_fail(&migrate_to_ram_fault_inject, 1);
> > +}
> > +#else
> > +static bool drm_pagemap_fault_inject_folio(void)
> > +{
> > +	return false;
> > +}
> > +#endif
> > +
> >   /**
> >    * DOC: Overview
> >    *
> > @@ -960,7 +982,9 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> >   		if (order)
> >   			gfp |= __GFP_NOWARN;
> > -		if (vas)
> > +		if (order && drm_pagemap_fault_inject_folio())
> > +			folio = NULL;
> > +		else if (vas)
> >   			folio = vma_alloc_folio(gfp, order, vas, addr);
> >   		else
> >   			folio = folio_alloc(gfp, order);
> > @@ -1554,6 +1578,16 @@ void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim
> >   		kfree(dpagemap);
> >   }
> > +static int __init drm_pagemap_module_init(void)
> > +{
> > +#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_FAULT_INJECTION)
> > +	fault_create_debugfs_attr("drm_pagemap_fault_inject", NULL,
> > +				  &migrate_to_ram_fault_inject);
> > +#endif
> > +	return 0;
> > +}
> > +module_init(drm_pagemap_module_init);
> > +
> >   static void drm_pagemap_exit(void)
> >   {
> 
> Missed fault injection debugfs removal ?
> 
> Sashiko flags it and looks valid concern.

I checked on this and kernel wide no code seems to undo
fault_create_debugfs_attr on module unload, nor is there a function in
linux/fault-inject.h to undo all debugfs entries setup.

So IMO this is either everyone is kernel is doing this wrong or this is
a non-issue. debugfs_create_file kernel doc seems to indicate all
debugfs enteries should be removed with debugfs_remove though (?).
Either way I'd say this out of scope for this series.

Matt

> >   	flush_work(&drm_pagemap_work);
> 
