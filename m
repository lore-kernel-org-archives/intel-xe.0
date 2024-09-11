Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CFAEE57D7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8137110EA97;
	Wed, 11 Sep 2024 20:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vu9fIZ51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2EE10EA97
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726087700; x=1757623700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=33AK9nfWscW5DwgOji9nHU0PinROadhEUYgQZ6erNKw=;
 b=Vu9fIZ51JD//xhp9IKeoRh1Ylc7YUDb1YtLajQnxUohcYYSmuN913D+C
 VU+5DvFdjwWnbb1Bnw4E8FscWN/bcRTd8EwxHHp7ffRtkjra6NdkONdN5
 V5ikCqXXSxvP9cHnHwpMUE1JZw7zuYN951YyY8ZYO9ACYJ9WMetvyWBFw
 jbZvua896CEwfakuIUsUFWkrgii2zjWg34EqpFw0616nXbMEhVh5mCtyx
 Ch3RcJWscpAo2ocHpI/tMUV+OIEIs3GbsTrpRx4hVYqVWWu1iYvE1QRlS
 KxTbSwuGyxSK8q2+IEvYwaONphoYaF0tDkCWfAi5KmO9twiVx23HRRmO6 g==;
X-CSE-ConnectionGUID: SYRzlrRhTzOyBwj5Pfo0yg==
X-CSE-MsgGUID: adsYHkTJT9qQbK+RrKvjiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28687723"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="28687723"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:48:19 -0700
X-CSE-ConnectionGUID: hTHq6Z6xRzWPtJ7RHwww9Q==
X-CSE-MsgGUID: E3oeh2/OQ5KAK0u0xQOEPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67100706"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:48:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:48:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:48:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:48:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:48:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxCZEsVC5fUEWyv/PB0k786+0ZqhdKChpRpUChvepfFxJ1qFk2HT5CL2DLRPfF3r5o/hHEwH/P5XNicGrS/sdz4AI96KFXvzr98CAJhDAEifEJ/qx0aGofyfaidvFoBGq2yXoLnOT7kLfpVsSsggF1Z2fVsNdEWFeEbBory97CMOx5umCKI+mF1ZzMUU/UXa00WuggVss4DHmskV0yOO/lTLTmKxpl7ztyYZDGTSqO9UxyDskTKyvsb1g4S7F/4XZR4VWUv2zlK6ga70MmUDFjOWLrL3/QXeK1P5PoHagDy58zsx9s/vhNDVfh6RWNKTBbi+0NUb9IwSY0OgvjbuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvgmIilGL5CIJZbQurakSDeK818p10pmLaGHgLAAqOc=;
 b=YJVbiXXGvSbjdQXznxKybw3H842xHgmSlBtFGu2fTmZo8OfO811DrFda52ZzqO/SYc/HaCvsb9pHoAxq8qhnnRem4XInPRmeKkMWc56786cKbl1xPY2GIYb/rrFMQPTFwahgH+/+psJ+5Gg4LiwZyO+5ZDKDvfyspu76dECDYLi1yrN4UNjA8+rcX8td27/G2CP45KuLhA9/Av8GIzsi3LGuw8GoZxoDfcfkZieLqYTwcMJgSou1E5W0C3hmRIVDm/YAQdX8d1Hz//OjVyanWKrzrvsOXLWuEEecFIdHHKrqR/DLb0IFB1Uk6PqABgcN7GXMWnDttb++Xzf1wxPDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Wed, 11 Sep
 2024 20:48:14 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 20:48:14 +0000
Date: Wed, 11 Sep 2024 16:48:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5] drm/xe: Add driver load error injection
Message-ID: <ZuICC_gKCSyxRj2H@intel.com>
References: <20240910152241.1554435-1-francois.dugast@intel.com>
 <ZuC2BiKnZEaXAY1N@intel.com>
 <tpweqdb7sux3pfnz6762omn5jate6xugqfxmm7wcfq3gf7qfmv@5ukqvov3au42>
 <ZuFzhBHH3TKDAPel@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuFzhBHH3TKDAPel@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af5ce17-d977-40c7-5315-08dcd2a30e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emx1ZDdrWEV3RDdvQUFYdTRjeDdZYXV5aWpZblRmVFh0REx5WEJEMTBaL3lT?=
 =?utf-8?B?YnVJcXVTNUYxM01BRjIwSmI3aDg3OHR1c25uR0VaaDFocUR4cDV6cEVEbWtS?=
 =?utf-8?B?V2pYVHFCNXZKK0xrbDR4WG5DeG05NWU0NUthS3RZZ2JPdzVtRzNqVHAvOERS?=
 =?utf-8?B?SzdKSDlTN01IWkFaVXloVzZBVGlWTkxBSlRGZHZzVXdCUGJNbmNZZHc5cXBN?=
 =?utf-8?B?Q3diSmpOa1l4TkRGcFBPZWE1aUlvM1Zmd1RlN3FJdnYrSkF3bkVEYS9iNHIx?=
 =?utf-8?B?ejR0NFhtRWd3MC9CRlh0SXl3WDlJc0lWOUNQdnJiTjdtVmNzZHI0WU9nSXFx?=
 =?utf-8?B?TjdFUFg1N09lbVFUVTBBL2VxZlZlK1oxa3p0cTFnZ2NrVU1rMlA2R282b0s2?=
 =?utf-8?B?WG5KUWhMb1UrNkxnVHhYdTgzZEU5bExuQzBISEJ0RkpDNGRUdVVkeVU0dFg1?=
 =?utf-8?B?Y0psREJHZEZkTXdiMkxkK202bW5MRUFnb3ZGaXhvRjdWaHlsN3FyRzZWZEJ0?=
 =?utf-8?B?d2grV1Bjek5QZVBUVlgzTFkzR2Mvd09tMTRXdkVtZG9xOVRnWHRZcFBJTlBy?=
 =?utf-8?B?cHFQWEsxemJkOFRIckk1YlZqcWZTL2xHTXdKeVRUVFUydC8vWEREZTZpVktM?=
 =?utf-8?B?endHanI2TzArR0ExQW1EN1VrakVkNm1UR3ExVWNFRnF6djJXNklrTHBDeW8w?=
 =?utf-8?B?ekNmMEZoVnNmclQ5eExyRWJlaDFSOVdTSWpLT2pFYTR0RXZ1eDFKRCthd0JY?=
 =?utf-8?B?YkNaejVCWWFqQmJIcXRnVzV4U1ZKZ0lKT09MRWkwRFQ5Y05IZWhXSVl3Tlkx?=
 =?utf-8?B?RjY3dTR0S0hLS3dhRjRqcVE4aUlab2w5ZzB6bzJMUFIrWXV5OWVhZVBhSG82?=
 =?utf-8?B?cWpVbWVKeXM1cGxLSHdqT1NsWkkwamVYWCtrNzd2d1U5eDBKelNLUHJMRWhj?=
 =?utf-8?B?UEhyYW9UcWRoeDMrbGNydHpJcjJUNlo2a21WREpNWWxrZDNwWERsWFRmU1Rj?=
 =?utf-8?B?OTNlR29OY05VcXZhV1lTRGRrQndCU25iWTlrd3B2SWRyT1c4eTNTdDY5MCtz?=
 =?utf-8?B?UEo2dGRHckllQmIxNU50NkRzVFV2T0hVWlpRc3Y3azZIMmhpL0ZPeFlNckNQ?=
 =?utf-8?B?MWxGOWp4Wk9XUzU2N0k3eUdjUWdEdi9UREZ6WWZFSlJSditlV2x3SWs3ZTlO?=
 =?utf-8?B?YUQvN3hqVCtCVTU2RHFkdDEwd1hxbDNCQkt0RGFSa0JPN1l3VSs5QUZ3NzNt?=
 =?utf-8?B?bS9uMi96Ukx3YjVmWitHMnQzd3FMVHZ5cUxlcjFiQU1wcDh1cldKc2hRc2hY?=
 =?utf-8?B?MzlwOFVNcnBlZ0JDaVRWclgvL0NwZFc5L0h5Ty9rTFZmcUxkaXcwS0Zvc0pJ?=
 =?utf-8?B?dDNCMUh4ZzlNZVBHdUo4enlLWmh1eWc0aFkwT0dnQ3ovMVNKRWxoNzdtSm1h?=
 =?utf-8?B?R1BSRjNoZzlhenBRRlhsLzNkQmRKMWNwczNoQ2ZmL1JjMWhDQmg5bVdycHZp?=
 =?utf-8?B?eUoyUDk3NWRGVEUzeUFHTEF2Vy9PNEdRZmttQUFuMlZxemNrZjJueGF6cHZl?=
 =?utf-8?B?N0swVUk4dGlNckxQYUkyVkN3RzM2WjVRcWpDSmxZalk5TWhKdklkTmxCRmZL?=
 =?utf-8?B?VzBvQVIyVnlrcndlMUxHY0tDZWV4UDVWNFdwODhOTVg3c1oxZ1BRazNacE9r?=
 =?utf-8?B?YXpSL1NsYWRLcFJhcTNFSCtLajZid0hDSGxiaWVGRyt0QWd0a01wVldoenRK?=
 =?utf-8?B?Z3UvRDNaZW9BdVZvazdsRy9NaXo3MEtSZ29PWWZCQTNhbzRiR2J6b0RiZlpI?=
 =?utf-8?Q?iJ5vv4f+WyH0C8MXUL8CHnFAC+F675pVY30j0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXBQWlQ5amFTbTFkaktjbnAydmtrZm5hdTRHejBYU1hkOENzNGp2VXcwd0g2?=
 =?utf-8?B?WnhsaXJJUmJtT2o1dkNmNTBPVXNVMHlXdUxueVVRNnBrbmJyekJKVS83b3U4?=
 =?utf-8?B?VkJlQXl6VFl6WjBsU1kvK25PeGFUVFBDTGFPUThWYURGaTRpNFpBMERSeWVs?=
 =?utf-8?B?QjFDekorQ1RlTmxyTXhNZlBOaG9sZkU0SkYxelhFZjMrQjFCRnRlQlVPdDJN?=
 =?utf-8?B?SGVwendodGN6VkpUWjNzL0dNellqcHhaVnIwenJRV0d1b1BwS1NUSW5uc3Vz?=
 =?utf-8?B?SkRzajdNbUxobDNuOFRDT2pvWU5XYk9CbEMreUdmbmVLRnNTbDNqTTFiTFV4?=
 =?utf-8?B?WFFmWnh6TGtpNTdCOEZHVXc3a3BXVHk1dmZaZDkyT3R1WE1pQ3V3TVBXSWIv?=
 =?utf-8?B?RGcyM0VPVlE3WUh5WUpCYUx2MzhhMmxESzdoWEtqajVNOFkvcmxUTzZ0Y2x3?=
 =?utf-8?B?cnRZTU5SNEZuTVM5eFlseVpPMWpVM2ZPendrWC84akJKQjRsOXg0OXl4YmlJ?=
 =?utf-8?B?TVBtMENicm05VjdEZ2RmV1ZrbE5YL1VreUVUSEpzTjQrV0ZvejRLc1ZxWnVC?=
 =?utf-8?B?Q2R0NGlpUzFrdWR0NjVTbW5pN3J1U0hiQzFZdUlyTTZKdXlOak1paFpJSzRB?=
 =?utf-8?B?RUFwemJqSXRoS2dXaDNLVEs4emxHQzA4RkhnSEo5cUV4eStNVThRUXI4d1RI?=
 =?utf-8?B?RFpPOXRXZXRlZEcvUE1YRE5xc0RZeU1icnRLcE5rWmNScUlJa1NWbU9OaVhJ?=
 =?utf-8?B?eHZCMWEwdmpraXRZS0UyQkpiMjByWlJYT1FNV3M1Z3g2V0N5ZjZJQUgxb3FX?=
 =?utf-8?B?MDUvK2lFUjZIeWFjQTloRTAzN3VSeEs1NmEyd2d2Zm5RMmhlQ0JLV0hqeHR6?=
 =?utf-8?B?QnAvdHlvVHdNSzdEWTBLOElGWkxTUVBhTE9VbllxQ3VKc2ZZSjdDNlVUaHNv?=
 =?utf-8?B?L2JNOW9HQTVnVDhqUDlSUjhZZmxYUjBNRTYva0NPVGJVc0xEeEV1US83RFdP?=
 =?utf-8?B?Yml1aVd5bXlaQXJ5Y0ZhdU1xK08yVFMwa0hMNlZlM1FCaUYvdGRNZmZidWUy?=
 =?utf-8?B?dE5obGEwZ0lpSnhHMmgyS0FCZG5PMUcrMXIxNlpJaU5DdVNTVkI3Nzl0dTZk?=
 =?utf-8?B?QU4vOHZkaFQxdEtIY09QdkxiU0dDVmZScW5LdXNNQTFjdTZRbEYzRWRwVGw3?=
 =?utf-8?B?aHpoTXpSai9tN2FpaC84aVFIWVF1ZDBhd1NXTmpTVldxbDZNOENZT2N1WUdG?=
 =?utf-8?B?Z1RBM2R6endiZ1ZiU2hOT1JLWE96QnZhWU94OXVYQ1owTjBweFp4bmx3SjNR?=
 =?utf-8?B?OGNvdHFMZ1gzcHJ4N2cyTmJrdG1YcWJza0JoVGxhWjZRUjB0MUxkSGl6UmR0?=
 =?utf-8?B?TVp6ZVhXOWxHbTVIRnRzalBlU3dKVFVJSnRoaUczWTIyZU5ST1ZjU21XWFZN?=
 =?utf-8?B?cHhjVFpudU9HMnRCN1gzVDRUWE5WN3BPZlNEM2ZyYnNRRGpCTmJkRy8zNEg0?=
 =?utf-8?B?eU9kdTk0ejhqa29mcGkvTGFkME5Hak1EcHBXL3Z1R3dWNmFvKzlqK0dBMTR3?=
 =?utf-8?B?THJSb2JaaHlIOWZlZW1SZ3g5RXdZcDlpckxpK1BYOThIdVhNOVYvVXo1Ykhq?=
 =?utf-8?B?STlZeUxXWjhjSmdMU091cUxyaWRkSlE5NkwxejUraUtXZ21ieXptQXlFS0pU?=
 =?utf-8?B?NzNnd2hjcGJHaDdZaUpUK3I2SVB1UjlvNDVJVmZISmtrVXlSLzNPNEhnaXV1?=
 =?utf-8?B?NkFOYVM4eW1JN2JyMlVLb3Q3OVFka2FBek4vN3VoaFBEaXR4RU9HTW9wdVZH?=
 =?utf-8?B?NVVXZWtxOTcwZ3Q3dFFvZmUxSG55eU9sc2xId2lIZW1LWFJuTjdyY2lxQmFs?=
 =?utf-8?B?WS96ejRqUUlVanF4QXRUNzZIQWh5cGFZQURxdnFlaGdwdmdidE5ubVVwbVpX?=
 =?utf-8?B?Rnl0alVJQng1SHlWMkJST3c1L01ZZ3JQbDhJMit5YnVqVkJYOVNtTldodWFa?=
 =?utf-8?B?d3dhZEQzNHVEay9JWkdUUS95eHJ4dmZxdUJhU1BXMm12NmhYcDZnay9vWW55?=
 =?utf-8?B?V3JuZXAyM0VwV00weXRqTzR5eFRlKytWSzk0bHBLUjAxS2NjMUJiWURqS3Zt?=
 =?utf-8?B?Z1Q2N1AyRVdmS0ZNOXFMT3MvTTN3UStCbWxoeUl2OUxTdVBmdUNGcjNPVWhI?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af5ce17-d977-40c7-5315-08dcd2a30e62
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:48:14.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yo0bL4hcE/GAF9y4HVo8MOAtIJitMCC/TZelRtrIZ9c8QJKbxlXP9O5LoDJdjeQwCCzBB51XcOecCTckZt5S/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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

On Wed, Sep 11, 2024 at 12:40:04PM +0200, Francois Dugast wrote:
> On Tue, Sep 10, 2024 at 04:33:21PM -0500, Lucas De Marchi wrote:
> > On Tue, Sep 10, 2024 at 05:11:34PM GMT, Rodrigo Vivi wrote:
> > > On Tue, Sep 10, 2024 at 05:22:41PM +0200, Francois Dugast wrote:
> > > > Those new macros inject errors by overriding return codes. They must
> > > > manually be called, preferably at the very beginning of the function
> > > > that will fault, otherwise if not possible by turning this pattern:
> > > > 
> > > >     err = foo();
> > > >     if (err)
> > > >         return err;
> > > > 
> > > > into:
> > > > 
> > > >     err = foo();
> > > >     err = xe_device_inject_driver_probe_error(xe, err);
> > > >     if (err)
> > > >         return err;
> > > > 
> > > > When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
> > > > 
> > > > When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
> > > > be overridden when the module argument inject_driver_load_error is
> > > > set to value X. By doing so, it is possible to test proper error
> > > > handling and improve robustness for current and future code. A few
> > > > injection points are added in this patch but more need to be added.
> > > > One way to use this error injection at driver probe is:
> > > > 
> > > >     for i in {1..200}; do
> > > >         echo "Run $i"
> > > >         modprobe xe inject_driver_probe_error=$i;
> > > >         rmmod xe;
> > > >     done
> > > 
> > > can we have an IGT test so we ensure that CI is tracking and we are working
> > > to close the existing issues?
> > 
> > yeah.. that would be great. I think it would make more sense to use
> > bind/unbind in igt.

Hmm... but that would require a deferred_probe and then the bind to force the reprobe...
kind of complicate things here...

> > 
> > > 
> > > > 
> > > > In the future this is expected to be replaced by the infrastructure
> > > > provided by fault-inject.h
> > > 
> > > I was taking a look at the fault-inject again. It could easily be a
> > > global fault_attr with a module sysfs entry, then during the test
> > > you load the module, then unbind the device, then change the fault-inject
> > > probability and time and then bind it back what will reprobe, but now
> > > with the fault-injected.
> > > 
> > > The only problem with the fault-inject idea is that it would require
> > > a very granular thing with multiple fault_attr, one per failure.
> > 
> > when going with a real fault-injection, I'd actually try to cover it per
> > function as described here:
> > 
> > https://docs.kernel.org/fault-injection/fault-injection.html
> > 	/sys/kernel/debug/fail_function/inject:
> > 
> > 	Format: { ‘function-name’ | ‘!function-name’ | ‘’ }
> > 
> > 	specifies the target function of error injection by name. If the
> > 	function name leads ‘!’ prefix, given function is removed from injection
> > 	list. If nothing specified (‘’) injection list is cleared.
> > 
> > Integration via ALLOW_ERROR_INJECTION() is similar to the
> > KUNIT_STATIC_STUB_REDIRECT() we already use.
> > 
> > In my review I didn't bother to go with fault-inject directly because we
> > will probably need to refactor the code so the failure points are in
> > their own functions. Something we don't have today. Short term it's
> > important to fix the current/unknown problems. Mid term we can convert
> > things piece meal.
> > 
> > Are we on the same page?
> 
> It is also my intention with this patch, get something in with minimal risk
> and changes so we can soon focus on solving potential issues it highlights.
> 
> In parallel I am preparing a RFC based on fault-inject with a proposal how
> we can use fail_function with a few real examples from our code that we can
> take more time to discuss thoroughly.

I'm also on the same page. Let's do it.

But we need to at least:
1. fix the documentation return statement
2. fix checkpatch on module_param_named_unsafe huge line
3. IGT ?!

> 
> Francois
> 
> > 
> > > But at least this really ensures that we are really testing all the cases
> > > with more reliability.
> > > 
> > > I just realized that this i915-style probe injection might have an issue
> > > on platforms with discrete platforms. Well, the pci subsystem won't
> > 
> > one more reason to go with the bind/unbind. Then you control where it's
> > happening and where.
> > 
> > Lucas De Marchi
> > 
> > > probe in parallel, and likely it will be the same order of probe on
> > > every module load, but if it doesn't the Nth point of the failure
> > > won't be the same everytime, so in every load you might stop in a
> > > different device and end up with not covering every single entry.
> > > Unlikely I know... And I don't believe this should be a blocker
> > > to move forward with something...
> > > 
> > > (more below)
> > > 
> > > > 
> > > > v2: Fix style and build errors, modparam to 0 after probe, rename to
> > > >     xe_device_inject_driver_probe_error, check type when compiled out,
> > > >     add _return macro, move some uses to the beginning of the function
> > > > v3: Rebase
> > > > v4: Improve commit message and comments, keep if/return rather than
> > > >     change the flow inside the macro (Lucas De Marchi)
> > > > v5: Rebase, add comments, keep existing return points (Lucas De Marchi)
> > > >     Add finish wrapper, move to function beginning for all xe functions
> > > >     (Michal Wajdeczko) Bolt into i915 error injection (Jani Nikula)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/display/ext/i915_utils.c |  4 +-
> > > >  drivers/gpu/drm/xe/xe_device.c              | 48 +++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_device.h              | 30 +++++++++++++
> > > >  drivers/gpu/drm/xe/xe_device_types.h        |  5 +++
> > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  5 +++
> > > >  drivers/gpu/drm/xe/xe_guc.c                 |  1 +
> > > >  drivers/gpu/drm/xe/xe_guc_ct.c              |  1 +
> > > >  drivers/gpu/drm/xe/xe_guc_pc.c              |  4 ++
> > > >  drivers/gpu/drm/xe/xe_mmio.c                |  5 +++
> > > >  drivers/gpu/drm/xe/xe_module.c              | 17 ++++++++
> > > >  drivers/gpu/drm/xe/xe_module.h              |  3 ++
> > > >  drivers/gpu/drm/xe/xe_pci.c                 |  5 +++
> > > >  drivers/gpu/drm/xe/xe_pm.c                  |  5 +++
> > > >  drivers/gpu/drm/xe/xe_sriov.c               |  7 ++-
> > > >  drivers/gpu/drm/xe/xe_sriov_pf.c            |  6 +++
> > > >  drivers/gpu/drm/xe/xe_tile.c                | 13 ++++++
> > > >  drivers/gpu/drm/xe/xe_uc.c                  |  4 ++
> > > >  drivers/gpu/drm/xe/xe_wa.c                  |  8 +++-
> > > >  drivers/gpu/drm/xe/xe_wopcm.c               |  7 ++-
> > > >  19 files changed, 172 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > > index 43b10a2cc508..11d8377a125f 100644
> > > > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > > @@ -4,6 +4,7 @@
> > > >   */
> > > > 
> > > >  #include "i915_drv.h"
> > > > +#include "xe_device.h"
> > > > 
> > > >  bool i915_vtd_active(struct drm_i915_private *i915)
> > > >  {
> > > > @@ -16,11 +17,10 @@ bool i915_vtd_active(struct drm_i915_private *i915)
> > > > 
> > > >  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
> > > > 
> > > > -/* i915 specific, just put here for shutting it up */
> > > >  int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
> > > >  			      const char *func, int line)
> > > >  {
> > > > -	return 0;
> > > > +	return __xe_device_inject_driver_probe_error(i915, err, 0, func, line);
> > > >  }
> > > > 
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 449b85035d3a..f22d94ff302e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -319,6 +319,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > > >  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > > >  			      xe->drm.anon_inode->i_mapping,
> > > >  			      xe->drm.vma_offset_manager, false, false);
> > > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > > >  	if (WARN_ON(err))
> > > >  		goto err;
> > > > 
> > > > @@ -477,6 +478,7 @@ static int xe_set_dma_info(struct xe_device *xe)
> > > >  		goto mask_err;
> > > > 
> > > >  	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
> > > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > > >  	if (err)
> > > >  		goto mask_err;
> > > > 
> > > > @@ -498,6 +500,11 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> > > >  {
> > > >  	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > > >  	unsigned long timeout, start;
> > > > +	int err;
> > > > +
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > 
> > > >  	if (!IS_DGFX(xe))
> > > >  		return 0;
> > > > @@ -750,6 +757,8 @@ int xe_device_probe(struct xe_device *xe)
> > > >  	for_each_gt(gt, xe, id)
> > > >  		xe_gt_sanitize_freq(gt);
> > > > 
> > > > +	xe_device_inject_driver_probe_error_finish();
> > > > +
> > > >  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> > > > 
> > > >  err_fini_display:
> > > > @@ -1000,3 +1009,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > > >  	for_each_gt(gt, xe, id)
> > > >  		xe_gt_declare_wedged(gt);
> > > >  }
> > > > +
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +/**
> > > > + * __xe_device_inject_driver_probe_error - Inject an error during device probe
> > > > + * @xe: xe device instance
> > > > + * @err_injected: the error to inject
> > > > + * @err_real: the error returned by the actual function
> > > > + * @func: the name of the function where this is called from
> > > > + * @line: the line where this is called from
> > > > + *
> > > > + * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
> > > > + *
> > > > + * Return: err_real if != 0, err_injected otherwise
> > > 
> > > Not just otherwise....
> > > 
> > > Return 0 if this is not the Nth iteration of the requested iterations from
> > > modparam.inject_driver_probe_error
> > > 
> > > Return err_injected if in the Nth iteration...
> > > 
> > > > + */
> > > > +int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
> > > > +					  const char *func, int line)
> > > > +{
> > > > +	if (err_real != 0)
> > > > +		return err_real;
> > > > +
> > > > +	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
> > > > +		return 0;
> > > > +
> > > > +	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
> > > > +		return 0;
> > > > +
> > > > +	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
> > > > +		 err_injected, xe->inject_driver_probe_error, func, line);
> > > > +
> > > > +	xe_modparam.inject_driver_probe_error = 0;
> > > > +	return err_injected;
> > > > +}
> > > > +
> > > > +void __xe_device_inject_driver_probe_error_finish(void)
> > > > +{
> > > > +	/* After probe finishes, stop checking for error injection */
> > > > +	xe_modparam.inject_driver_probe_error = 0;
> > > > +}
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > index 894f04770454..c410e55b6b09 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > @@ -178,4 +178,34 @@ void xe_device_declare_wedged(struct xe_device *xe);
> > > >  struct xe_file *xe_file_get(struct xe_file *xef);
> > > >  void xe_file_put(struct xe_file *xef);
> > > > 
> > > > +#define XE_DEVICE_INJECTED_ERR -ENODEV
> > > > +#define xe_device_inject_driver_probe_error(__xe) \
> > > > +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
> > > > +#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
> > > > +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
> > > > +					      __LINE__)
> > > > +#define xe_device_inject_driver_probe_error_finish()	\
> > > > +	__xe_device_inject_driver_probe_error_finish()
> > > > +
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +
> > > > +int __xe_device_inject_driver_probe_error(struct xe_device *xe,
> > > > +					  int err_injected, int err_real,
> > > > +					  const char *func, int line);
> > > > +
> > > > +void __xe_device_inject_driver_probe_error_finish(void);
> > > > +
> > > > +#else
> > > > +
> > > > +static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
> > > > +							int err_injected, int err_real,
> > > > +							const char *func, int line)
> > > > +{
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static inline void __xe_device_inject_driver_probe_error_finish(void) {};
> > > > +
> > > > +#endif
> > > > +
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index ec7eb7811126..582b8b7cdee4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -487,6 +487,11 @@ struct xe_device {
> > > >  		int mode;
> > > >  	} wedged;
> > > > 
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +	/** @inject_driver_probe_error: Counter used for error injection during probe */
> > > > +	int inject_driver_probe_error;
> > > > +#endif
> > > > +
> > > >  #ifdef TEST_VM_OPS_ERROR
> > > >  	/**
> > > >  	 * @vm_inject_error_position: inject errors at different places in VM
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > > index 0e23b7ea4f3e..b5da321bbbea 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include "regs/xe_guc_regs.h"
> > > >  #include "regs/xe_regs.h"
> > > > 
> > > > +#include "xe_device.h"
> > > >  #include "xe_mmio.h"
> > > >  #include "xe_gt_sriov_printk.h"
> > > >  #include "xe_gt_sriov_pf_helpers.h"
> > > > @@ -275,6 +276,10 @@ int xe_gt_sriov_pf_service_init(struct xe_gt *gt)
> > > >  {
> > > >  	int err;
> > > > 
> > > > +	err = xe_device_inject_driver_probe_error(gt_to_xe(gt));
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	pf_init_versions(gt);
> > > > 
> > > >  	err = pf_alloc_runtime_info(gt);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > index 5599464013bd..eb764b44ced7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > @@ -353,6 +353,7 @@ int xe_guc_init(struct xe_guc *guc)
> > > >  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
> > > > 
> > > >  	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
> > > > +	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
> > > >  	if (ret)
> > > >  		goto out;
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index 4b95f75b1546..51ffb05605bb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -202,6 +202,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > >  	ct->bo = bo;
> > > > 
> > > >  	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
> > > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > > >  	if (err)
> > > >  		return err;
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > index 034b29984d5e..d27d843057e7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > @@ -1064,6 +1064,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> > > >  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> > > >  	int err;
> > > > 
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	if (xe->info.skip_guc_pc)
> > > >  		return 0;
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > > index 3fd462fda625..a4cf082d3261 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> > > >  {
> > > >  	size_t tile_mmio_size = SZ_16M;
> > > >  	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> > > > +	int err;
> > > > +
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > 
> > > >  	mmio_multi_tile_setup(xe, tile_mmio_size);
> > > >  	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > > index 77ce9f9ca7a5..3de603e0438f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > @@ -56,6 +56,23 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > > >  MODULE_PARM_DESC(force_probe,
> > > >  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > > > 
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +/*
> > > > + * The error code at checkpoint X will be overridden when the module argument
> > > > + * inject_driver_load_error is set to value X. By doing so, it is possible to
> > > > + * test proper error handling and improve robustness for current and future
> > > > + * code. One way to test multiple error injection points:
> > > > + *
> > > > + * for i in {1..200}; do
> > > > + *     echo "Run $i"
> > > > + *     modprobe xe inject_driver_probe_error=$i;
> > > > + *     rmmod xe;
> > > > + * done
> > > > + */
> > > > +module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);
> > > 
> > > we need to break this line... or perhaps get a smaller word for the param name?
> > > 
> > > > +MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
> > > > +#endif
> > > > +
> > > >  #ifdef CONFIG_PCI_IOV
> > > >  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> > > >  MODULE_PARM_DESC(max_vfs,
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > > > index 161a5e6f717f..47cefaf8d79b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > > @@ -20,6 +20,9 @@ struct xe_modparam {
> > > >  	char *force_probe;
> > > >  #ifdef CONFIG_PCI_IOV
> > > >  	unsigned int max_vfs;
> > > > +#endif
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +	int inject_driver_probe_error;
> > > >  #endif
> > > >  	int wedged_mode;
> > > >  };
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 3bce0e550a63..9bb60b300727 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -644,8 +644,13 @@ static int xe_info_init(struct xe_device *xe,
> > > >  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> > > >  	struct xe_tile *tile;
> > > >  	struct xe_gt *gt;
> > > > +	int err;
> > > >  	u8 id;
> > > > 
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	/*
> > > >  	 * If this platform supports GMD_ID, we'll detect the proper IP
> > > >  	 * descriptor to use from hardware registers. desc->graphics will only
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 9c59a30d7646..a059be07a11d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -258,6 +258,7 @@ int xe_pm_init_early(struct xe_device *xe)
> > > >  		return err;
> > > > 
> > > >  	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
> > > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > > >  	if (err)
> > > >  		return err;
> > > > 
> > > > @@ -276,6 +277,10 @@ int xe_pm_init(struct xe_device *xe)
> > > >  {
> > > >  	int err;
> > > > 
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	/* For now suspend/resume is only allowed with GuC */
> > > >  	if (!xe_device_uc_enabled(xe))
> > > >  		return 0;
> > > > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > > > index 5a1d65e4f19f..c7512d8acc28 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > > > @@ -102,11 +102,13 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> > > >   */
> > > >  int xe_sriov_init(struct xe_device *xe)
> > > >  {
> > > > +	int err;
> > > > +
> > > >  	if (!IS_SRIOV(xe))
> > > >  		return 0;
> > > > 
> > > >  	if (IS_SRIOV_PF(xe)) {
> > > > -		int err = xe_sriov_pf_init_early(xe);
> > > > +		err = xe_sriov_pf_init_early(xe);
> > > > 
> > > >  		if (err)
> > > >  			return err;
> > > > @@ -114,7 +116,8 @@ int xe_sriov_init(struct xe_device *xe)
> > > > 
> > > >  	xe_assert(xe, !xe->sriov.wq);
> > > >  	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
> > > > -	if (!xe->sriov.wq)
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (!xe->sriov.wq || err)
> > > >  		return -ENOMEM;
> > > > 
> > > >  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
> > > > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > > index 0f721ae17b26..8d75bb6570f0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > > @@ -80,8 +80,14 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
> > > >   */
> > > >  int xe_sriov_pf_init_early(struct xe_device *xe)
> > > >  {
> > > > +	int err;
> > > > +
> > > >  	xe_assert(xe, IS_SRIOV_PF(xe));
> > > > 
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> > > >  }
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > > index dda5268507d8..774668ac67b4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > > @@ -114,6 +114,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > > >  {
> > > >  	int err;
> > > > 
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	tile->xe = xe;
> > > >  	tile->id = id;
> > > > 
> > > > @@ -127,6 +131,15 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > > > 
> > > >  	xe_pcode_init(tile);
> > > > 
> > > > +	/*
> > > > +	 * xe_tile_alloc() and xe_gt_alloc() only fail with -ENOMEM.
> > > > +	 * drmm_zalloc() is used so resources will be freed even if
> > > > +	 * an error is injected.
> > > > +	 */
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	return 0;
> > > >  }
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > > index 0d073a9987c2..6eaef7a3c58e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > @@ -135,6 +135,10 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
> > > >  {
> > > >  	int ret;
> > > > 
> > > > +	ret = xe_device_inject_driver_probe_error(uc_to_xe(uc));
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > >  	/* GuC submission not enabled, nothing to do */
> > > >  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > > >  		return 0;
> > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > index 28b7f95b6c2f..8baad6106968 100644
> > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > @@ -825,6 +825,11 @@ int xe_wa_init(struct xe_gt *gt)
> > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > >  	size_t n_oob, n_lrc, n_engine, n_gt, total;
> > > >  	unsigned long *p;
> > > > +	int err;
> > > > +
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > 
> > > >  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> > > >  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> > > > @@ -833,7 +838,8 @@ int xe_wa_init(struct xe_gt *gt)
> > > >  	total = n_gt + n_engine + n_lrc + n_oob;
> > > > 
> > > >  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
> > > > -	if (!p)
> > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > +	if (!p || err)
> > > >  		return -ENOMEM;
> > > > 
> > > >  	gt->wa_active.gt = p;
> > > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > > index d3a99157e523..70674b30c4c6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > > @@ -206,6 +206,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > > >  	bool locked;
> > > >  	int ret = 0;
> > > > 
> > > > +	ret = xe_device_inject_driver_probe_error(xe);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > >  	if (!guc_fw_size)
> > > >  		return -EINVAL;
> > > > 
> > > > @@ -252,8 +256,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > > >  		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
> > > > 
> > > >  check:
> > > > +	ret = xe_device_inject_driver_probe_error_override(xe, ret);
> > > >  	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
> > > > -			   guc_fw_size, huc_fw_size)) {
> > > > +			   guc_fw_size, huc_fw_size) && !ret) {
> > > >  		wopcm->guc.base = guc_wopcm_base;
> > > >  		wopcm->guc.size = guc_wopcm_size;
> > > >  		XE_WARN_ON(!wopcm->guc.base);
> > > > --
> > > > 2.43.0
> > > > 
