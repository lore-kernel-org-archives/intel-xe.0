Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738B6C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 17:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B7210E0BC;
	Tue, 29 Jul 2025 17:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jkn+LQRE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDE010E0BC
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753811950; x=1785347950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KOi1r1p8EJoO8rnKZyXxMYukVYGkAlHivdCa+FS+1Vg=;
 b=Jkn+LQRE+A7dEzZFOZTExli0DldX5mVM4AoNm5dp6XtTQkGbopH32fwE
 u8FWpppyO1biwQY6mVZy93lZCHApQ3m8NgTAx5OEkctablFLsisXGLi++
 g2ZHIJaF3oo7FSN28FNyTT57+AAfUWHXUrvvQZ/vi52jr8Bi4uAWo+zPH
 8UIRSNDmFJ5ktqrYmpQmAFEQEr3V2wGSJj6XEjAQwq4rXUwbXVv1UcBwY
 0UBa/tq5Tm2/GKdoyT9r3Fn0uK+nw4907Imw1e0IB3HVon6zcGfedYCjd
 RI3L/0Dr3JHR2YzBON533ZTfeIxXzrmWtcLxyzmh18+SFzKWQz/RNRaty A==;
X-CSE-ConnectionGUID: 0hZQZyziT6eAnlKtR6UA6Q==
X-CSE-MsgGUID: GJfM8muzQIO6NOwjLhLzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67178785"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67178785"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 10:58:25 -0700
X-CSE-ConnectionGUID: KZT2JF1ER227GoTqPra+Ew==
X-CSE-MsgGUID: vnonUFaoSeS1XdZFgXD4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162657476"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 10:58:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 10:58:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 10:58:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 10:58:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttPCLeh2O7NxeOf/MAao/PG1WIZksxvraCdswamtXPx7C82Ct+/5YnuLWByO5vOJy+PX7mS+UX+ZhmdK8ByPI8Rczv5CZ6t7330nrjGPxx8YwtETmnaUbvuHF74T8qcxRFmF+4+GPzdTiRhCi6HkqQZWGX0CKY0ja787s+hwqEwA1a9O6qBaLrKdxfBuRuKkTfIdMHb/9sD/2WsQ9XZAwJPpj8o9zT0+LG0xnyjJY4gpAQphyhwZ5M3LDqpZu4d0R9/zdOi3v3TnU4QyLguc2epUCjiVXYJSoiQ1kSN7cjMpb1jbw+k1Ho5yHOoG63PbNGBOaCNsu98w5AFteHQBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdfi3bJtKb88LtTUKp+lozgC4Gw6UaFN7nnEj6mOTC0=;
 b=OnRL51uCezflze55lLQshpNXV1yiKP7lbdnICThmevy7FGydLmm7fm/an8lOkV5wB8M600vHHUS4PBADkEKCiuuUe5UzbW8tBsTegHH7fztGB+oa4nXDk/nkXUyTJ/kn1H2Nvb3YXJ7o0A6V6J+TDgDE3lcu5im8O1l85z7NMtkZeTwctXXSZIemCXgYjeuhUtkN+Sgfe16uNBwJ11YaxIiKFhk/M85jANl6kNkekaGFMgP6dA8pTnqxbp1rQqVEP+rja9ktMTalKg2H0bzaLrDxNpfZ0xaQd5pj0tur6SKWWCQAPPG4nePexMUca+s0TrEhNS4dVeYJtXm3J5Lblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Tue, 29 Jul
 2025 17:58:21 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 17:58:21 +0000
Message-ID: <4c93f880-7209-4230-b429-6e2afd56bde3@intel.com>
Date: Tue, 29 Jul 2025 10:58:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] drm/xe/configfs: Drop redundant init() error
 message
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250729114215.177586-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 2059f46e-3549-40fd-6021-08ddcec9816e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXlTQXJ4UFJkT3BWbERKOXRVM2JLN0FyOTl0UW9SWHFrbkpveUd3QkY0UCtJ?=
 =?utf-8?B?V0hZcTFFVmprbGQyMm5FWWduUlN4K0FvUlhoc2FDTGVtZGp3WFhDbklURVh3?=
 =?utf-8?B?QVZ6aWRJWm4vV3liaHBTN29WMHF0MGNpeEhxV3RUdjByL2ExcmFpKzlIUTZY?=
 =?utf-8?B?NFdIRGluNk42aE5IbVgzVHFwOE52Q280WG03OGpnS3l0cUNTYU5mSkhzSmxQ?=
 =?utf-8?B?TXpVUGlLSERnOWwyOXlHcjZTVEMxS3I1QU9zbzlFUmJMWWFvdERrd0NRUXhV?=
 =?utf-8?B?RUJFVnliTkJMS2h0d1Z5R1VvdXBhaU9oQVArbkxSRnd4cFlQSmw4aU43Wm9U?=
 =?utf-8?B?QTdac3J3ZXJJVEU4R3hMdTdSaHZWN2lxSGcxVFJJNUZyYkY2S055M2NMT05H?=
 =?utf-8?B?RVZVb05FWmpLZGxwdEx4emxBbGxiaWI3WUZtVjVIc1ZpcmhaRm5wR3pFRlAw?=
 =?utf-8?B?ZWd1Sk9tNWlNelp4ZGpkbGdYaSs3TklhVzArMGxPL1Q4andPMG1Za3o1Q1lJ?=
 =?utf-8?B?bjNHdEowKzlhR2ZSTFF4aC9YUUo2Nmk3RUFwZWJncXZ6R1JlM29LVjJoZ0hn?=
 =?utf-8?B?RllGdStzWTF3Mmg2RXVoTUdXY29oSW9LRURYYzhuQzhnRk9OTHRhbDY1U1Rt?=
 =?utf-8?B?TSsxSHR4bVB3YWRPbXhGVkhJY0gveW9VSTl1V3pBVXpNT1RzYTZUcVE0TU5a?=
 =?utf-8?B?K3hFUnNTSVozdmVZZXJuU0VlL1JxTnNLNDB2YVVyeWJ5N1NDTUZzU0pocWJY?=
 =?utf-8?B?YVcxWDhyMVVtSEpkNHNNRlhLYlNseW9La1V1SU9pMXFpeldkN01WeFVBdW91?=
 =?utf-8?B?MTZNbUdSTzUxd2tNWjVyYUN2RnZvdDYwbVhRbEJUNDcvZFROUkhZM1BHcG5v?=
 =?utf-8?B?dDNqMmJiU1ZZZFRBb3ZZTjBMcE1aRFhudlhrN2RTU3grTmVIYjB6WjdjREhD?=
 =?utf-8?B?c2Rhd0l3cENtZzNtc2dac21SeGJTd204NWphMEwrVnMreUhNNmtYNHNTMjFs?=
 =?utf-8?B?UysyZVZpTkhKV0U5WDNzMVc3Y1JDQ0k2NVFKUnh1TUttMTBVajhFSFZBZ2lw?=
 =?utf-8?B?TmpTYk9IL2RVWHlSWTQ1MHJ4YmEvVU5ZaS9qalpGU3VoL3Z4cEZXbmRCMU5j?=
 =?utf-8?B?OUtNV3lNbEtUNnJwdmswS2ptZG94Zzdpc1BuNjg3Q0RSdGw4ZUl4NnVQRGQz?=
 =?utf-8?B?OHRZZkhtak1TTzNtYTJPYlZ3SVpXNUdjUnFwbERKdyt0NU5WZmlpVlgwR1I3?=
 =?utf-8?B?NHFmcE9pQWNUMHgyRWZWVGY2MzhTZE1iZzQwSURuNGxMTXNGSHoxNFU0NUxn?=
 =?utf-8?B?U2czRzRxOTNNSzExOXpvLzFjbUVMMmFjNmlDMG9wWkoyR3VjNnEwYVl3Q0lY?=
 =?utf-8?B?VkFYYklOOFR0V29PYXBLQXRVZTNWMUh3dyt4Q3VqeDNHa2V1V3lWQUVHNCtN?=
 =?utf-8?B?YVBlbENVRXY3R1VkdDljYU1WbGZJcWE1c3FvY05PY0pyeGRmZS9WQ1hEWk9a?=
 =?utf-8?B?bjZ1MnVVb0d5SVdwU05zMVhDUC9JZk11RFc0WkhtM0VqSHJWdlcxN2Nwb2Iw?=
 =?utf-8?B?K3cvcGRFVE1tLzl3OXVhQVhQV1N6UUJUSDFFd3NsVEdJcVVnUlZFcWNkbDlw?=
 =?utf-8?B?TElaa2JNeU56K05mVytKNWJ2VlVGYWtUYWlCVDN1OU9QR1k0YVhsQTgwUlZi?=
 =?utf-8?B?bHlaUXBGMWYwNEpmMDU5M2Zrc3d5d3Ixb0h1MjA4L0ZFWnpta21WMm16VGRG?=
 =?utf-8?B?d0Y4RXZOT08wWmpicktzYllzcTJOMlllWDl5YTFVOXN3aFVrRFdHYVJlQVpW?=
 =?utf-8?B?SjlVQk5GVTZLc1UwWURNZi9LV1l5T3c4VXl2NkllLzBvdkJvK2szUTVPYmJB?=
 =?utf-8?B?MzZCLzFTMWFwSTkzQjlCVUVMUitBc0FTTDQ0ZzJ2TFpTcVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXdmQTZsdWw1eW1CaDU3aUZjQlNia3lSVitzS1hWaElJckF1cmU3eDJSbXlr?=
 =?utf-8?B?TE9Id0w4U28wWFZCeGpGajBtekI2VmE2RTNFYzN0OElzM0NPeFBFWmxyZWlH?=
 =?utf-8?B?aDZHSlN6d3FOT3kzd1REb0N5S3J4NkpqRVlydHVWUXlkQ0xHckVkZmNQekcr?=
 =?utf-8?B?NGV2QjNudWlsQzI0WW9MZkEyamZ4OEdOUnQyMGswSFkvWXU4WlE2bUg4UEY5?=
 =?utf-8?B?Y1dtQ0oxdXZpYUlPejVVTFo1cC9ENkdMZTd0T05ObHRpR3pweWRCUTlyZGlm?=
 =?utf-8?B?MXExUmVmV2c5alNkNEZ2bkc4U0tUd0ZxLzNVRWdxdVVBUmVlbmNKaEVLUlhH?=
 =?utf-8?B?TWxISXJFOWZHWEduR21BVC8yVk1GUmZ1TTFGWWdZZENEVjI0SHRsdUo0UDZo?=
 =?utf-8?B?ZnB2cWx4K3VWUTQ4ZGl4TWFESml3RHUyaFdGeGhscmJIQkdkNTJqVjVsTVNR?=
 =?utf-8?B?VkZTb3A0ZXcxU05TbGcwOEJOamIxd2N2VENxTXN5L3R1YTNJYnR2QnBORXk5?=
 =?utf-8?B?ZGlObmR5ZkZoaER1ZGI5RzBndVR6cDhWM3QwNjNIM3lwYU9jYU1lR0FXQkg1?=
 =?utf-8?B?WGp3YmNYTWF5UE9jYUhjL0VJdjR5YTY0R0FzaXd5RjByYXRnQUNrMlRyVXBH?=
 =?utf-8?B?ZEk4Q3ExSlppTzErVTIrQ3h5NG9Ka1haRXROUm9FNUlxaC91ZDdnb3F1bEhk?=
 =?utf-8?B?VnVRZEw1NmxVcmUzcXh0WmU0Ui9CR2M4VCtFVkIvUkljZWpkZFl1ZHZoMFhv?=
 =?utf-8?B?RHFweTN6N3lNd0tIbm5WVFRkL1pHUTM2bk9ld2M2MkNsQzJRNnpGaTA2REhH?=
 =?utf-8?B?YVB0a09ZQ005RFAzSnpRQ2NQVkN2OUNoYzNYV2pISDQ0b1ptU2RNdU50V2h3?=
 =?utf-8?B?RTcyU2xDWDJ1ZnY2aXNWcXBjVkxpRFh5dWhFMXRqODZYYkdSZlpsSW90b0Z5?=
 =?utf-8?B?aVA5NnJHM2JFN2c2YzlVeUpMZmNWWUtQTS9ZN1dDNlYzc2J1OEJJcSt5V0FE?=
 =?utf-8?B?RW50OHF1NlNhaHo2Y3dtQnFBc2RjU1RuZHlTMjUzQ0duZXFJVWRydXR4Q2Jz?=
 =?utf-8?B?Y3hYUmhuWUluT1NlbnFuRmkzbllYNGlDek1DWXA5MEZmYjdaWlNibjBWUnZN?=
 =?utf-8?B?Unl5Y0Y1eGQxOUY3VG41R1NUR0toVmE3QjZDdFM1TlNEbVZMNnlYb016eHJX?=
 =?utf-8?B?d0R5OUJnaW40YUdQWXRSb3h2WEMxdC9BaW4zNkhSemgwRkVnSzkzcjdIdmp2?=
 =?utf-8?B?bXVRNjU3WlNtdDlBU082VGR4d1l0aDNJbDdncmRkcHlzZzlZbmtJNXZyMm1o?=
 =?utf-8?B?RHhrK2xjbVYxcEdWR1pwZDNJWDdjSjRrR3ZDUkI0cytvTEFsQkRFZnduS0Rx?=
 =?utf-8?B?OHdiUyt4aTBTUmFJWkw4dkJrcS9OeCtDTkl5QWRRZ0UyaENpNkFwcC9pdTJM?=
 =?utf-8?B?TGdyZ0dTMmNFaTk4eXo1QndjUUZGM0pVczhBcmdjTStFSTJDMDlXcU0xSWZ3?=
 =?utf-8?B?THdqck1uTGZjb3dDVmpXS0pNbFdRV1hZa2Zpbk16OHpkdzZuNmxSQitHem9h?=
 =?utf-8?B?MHJiRXdTN3AvSzEvd1FNQVllZlFGKzJuOGJjRDdlTWUvNW1tU2JqSXJ5bS9G?=
 =?utf-8?B?NkdYMUE0bE9yN0lxQ2Z6Wko5YU5vUnVLaHBJcHZtZEFWckE1MndlemhBQVBO?=
 =?utf-8?B?S2ZscXFQcEJvRW5mZWY2a1NybStxYTRaN2R5eDZsbzNzcmtXQzBVQzQ5MW8w?=
 =?utf-8?B?ZnJreURWU3hXSGtyWFF0MnQzQmp4QzllMzRnbG55S00rZjhSTEFzeEJQSXdC?=
 =?utf-8?B?TUQrMlNWYlRiMnRYRmlyc1pCREJsNFh5aFhUTHRjODNNOVJZU01FWUZnd1Ex?=
 =?utf-8?B?bWJ2d0kwNzBDeDc4WGFrSzlSdVlzQ1NBNXBaRExXZ0dIeHBUYVMvTWw2L1k3?=
 =?utf-8?B?aEkwSjVNb2UrNGNZc0JaTFM0elFBQ1E4TDFFZk9mTzFmV2NZU3RONEdSNmZy?=
 =?utf-8?B?QkhaRjNtNEpDL3JKU1RyTGRNKzRwSGRtaXBXbzNOem9ybit3MHVkOVNQeHRN?=
 =?utf-8?B?UHNuM3d1OVk5S0FUWXZpWlA0ZE1ISURCY1dvbldOdlV2QnNmMW51ZXhQZFNH?=
 =?utf-8?B?TlBkU0w1TkhLSzkzVkNyVkJLMGVhRGNKWS8xaXdYc2RDMUFRSjZhbmxLdGVK?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2059f46e-3549-40fd-6021-08ddcec9816e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 17:58:21.3590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hCIHJ80XLmfpUlsZ4lBR6GuiQqoPYDHU96LNw+W3U3qRN3KPQn3hBnIXzGEjuP85t0L540fbAbkAH4BIfznT8Up3ci1rDzfjZmK3iHewlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
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

On 7/29/2025 4:42 AM, Michal Wajdeczko wrote:
> There is no need to print separate error message since we will
> also print one in xe_init(). Also drop temporary variable, which
> was likely just taken from the example code.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 56fbf4c1c37f..6aa0531bcf76 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -392,15 +392,12 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>   
>   int __init xe_configfs_init(void)
>   {
> -	struct config_group *root = &xe_configfs.su_group;
>   	int ret;
>   
> -	config_group_init(root);
> +	config_group_init(&xe_configfs.su_group);
>   	mutex_init(&xe_configfs.su_mutex);
>   	ret = configfs_register_subsystem(&xe_configfs);
>   	if (ret) {
> -		pr_err("Error %d while registering %s subsystem\n",
> -		       ret, root->cg_item.ci_namebuf);
>   		mutex_destroy(&xe_configfs.su_mutex);
>   		return ret;
>   	}

