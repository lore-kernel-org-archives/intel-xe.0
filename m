Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E57C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 17:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C9610EA66;
	Fri, 28 Mar 2025 17:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRupT7pe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85FA10EA66
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 17:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743184338; x=1774720338;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hMzQSTDognDSulnjCfc6QQ4/6ioD0UrUL2I9FqimjVQ=;
 b=FRupT7pemx9rBJeG4cz9M5GcZcdlZK1KApNoyah+zARUzuJ/GKUuyY7d
 WDhfn7hJwMu/n87noR29n+aeXvWkVz6cSlbNnfnNUX6vZFLaNKL4yEpdr
 rETy7rzdrjKqeIUws+tCgygo6xLBVoKOmuA9MpchDlyyMyDH4PZ/ZrhDd
 ItZFwnD8kKBHF27f20Of+j7W2MGYtAQI0L2scJBZlwPjriLzL/GBVOpzi
 yXBf4Wh0xUVofaARnJ5O7Shl4zxa5dKK6MYREMbk2xsMkbFKB4dzRl8EP
 zgEEIrsuMn0LWnl3qSK7ftbD68ch6THC9/xfjMwTsecq6WtrudZkKvYqc g==;
X-CSE-ConnectionGUID: URu/ihETQxueIlR1gwH/Qg==
X-CSE-MsgGUID: aFw+M4LqTNaaZaSqNzxvHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="47284984"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="47284984"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:52:17 -0700
X-CSE-ConnectionGUID: 3aGj4uHFTmmO2L+lsjSubg==
X-CSE-MsgGUID: fmQMM3yMTzKcx6/f2tL/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="126033306"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 10:52:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 10:52:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 10:52:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 10:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knX5NkHwXpaUUFeepeI0R6SCrdOZ9iionTj/bDaIj4Xol15mnvhcd6klZGa1YQXHlz9S15gGvzc7balFaranWmzqhgwmXBxB0SFY0oL3htBjOrfGAEUrgBwLbgUFlS3agwArweFiSaagzyEJ8Ad8H3Up9eLlFSQH9LvqGDmyExqU2sCnCxpO1p5mpifi4bXBtNtSnfRBf6cbd9XHUDmFmb16XVPOv8zFl7/NFbMPMt21r5Tq98rO0oszbJTju30pz/7JpOQ9TZgVUTuZNO3v7Y+dje12F4L73jkSVv34+ZWLGHIFH4DOg4klDoyxVRV4BfhStP6rCeMjXOfGTYeTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9DPujB4ibp6HeasMV7aHbmMKPEXEur2Qc9fqw7XtEM=;
 b=tZB8CVZ4r0EwpMPbJdXJWeISEM7GFCBH7h9v4jeg/t+UnQwmgqMzaYnZQLc14gHp5xbUzNWA9pRKIzF3xCYrmUjSBakutmmrFmFlS6K0FvBOOWUBCt5Mq2XFxsS9/k45Y6ewXeiCIS1+Eim1Zo031E/NxazMuNkSKQ6bQstbZbLDuquCYCBBjoU+pZ8md3wRkHWNRV4OyOOrIDo7ZNbuzKInenQYZm8msJAANmZjntBkQn+n9yv/hwPKpDGQ2AzTMGepaNSDScWN3wI4wEIf8Ny/gZj4vIpdlOru+OTSQ/MuMNaqNU2G9wb/Y6AUUCMGqKr2ARhAAn5kuVHCRMzSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 17:52:13 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8534.045; Fri, 28 Mar 2025
 17:52:12 +0000
Message-ID: <a0691649-b9f0-4396-ad49-86332825e90c@intel.com>
Date: Fri, 28 Mar 2025 18:52:07 +0100
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
 <20250306222126.3382322-3-tomasz.lis@intel.com>
 <1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com>
 <4b91723b-d291-4a8d-ab92-68f7df253ce6@intel.com>
 <51a8957d-2fb4-4f6f-8e75-2ecbe4f1d141@intel.com>
Content-Language: en-US
In-Reply-To: <51a8957d-2fb4-4f6f-8e75-2ecbe4f1d141@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::18) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: e460d24e-2795-447e-2899-08dd6e2144d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnJVZkdxQm9qMUFDSkFOVlpnNEZ4aXRqNmxXZ0s1MW13THJSU2N4b2tHeFJI?=
 =?utf-8?B?NmU1YlN2d0lmMUJGbUhUN2lManVCd1pWQnl5dlJvek02aWROU2pleGFCSHJF?=
 =?utf-8?B?dUpSK2pkR3lGWndEdzhMRjR5QjR2Y0hmSDhOVUY1cEFGNTd3ZndQbGdsdzZx?=
 =?utf-8?B?UVZ2K3NGQVB4UjNPb3lrT0RpU2I3aG1IcER2cDFhaHdyejZ3aWNkcW9RVHM3?=
 =?utf-8?B?OUNWL1lFMExrT2h3bjhIR0RQb2hLUGRzUVBENjhPdVhtTkY2V2FCNzFOb3Yy?=
 =?utf-8?B?ZlFOczN1ajhQRkJVVHdINWZzR1JDd3UvTU1vS2ZaTi9VQkNLNW5qUFIwVHpa?=
 =?utf-8?B?K29wWjRNdC9UOW5qMVJkSWF1WkpyNjhGQ1JlVVNDVldHY1liSXN6VmE1VEJD?=
 =?utf-8?B?NWZjRUl5b29wNnpKMXJrYnJLSE5hTUhKaVlRMkhxVlZIS25tbUVVcVQyOUJB?=
 =?utf-8?B?OWI3TXVrZHZ0UmNyTU9FZEFZdlpoRjRzdjAvK2hGaWZkUGhHZzJkeTVkUkU2?=
 =?utf-8?B?L3ZZYjY3K3BvRm83czQrTkxYWlJwQVhsZ0c4dDhGNEI1eXBSSC9LVmhlRWYy?=
 =?utf-8?B?b2tZMm5qR1B5T2l3ZExKQXpmM0FEQWxJWkdLOGFlQXhDZ3l6dWlEa09MZ1pP?=
 =?utf-8?B?UUFyeFFaZHFkdU4yY1R2WXRnZkdGUVNEekdWMllmNFZRWlJFbmlPdytmbUJ3?=
 =?utf-8?B?c1Y2eFlTa1NLYW83RW9BU3EvNVVPd09OT21zVmhrdWdYUE9FZ3IwU0tvRk55?=
 =?utf-8?B?c1NxVStrRkVySzRrWDVUbUJ3UmJyT0RwSmhEQWZqazNVV1p1WitBazk5eUxX?=
 =?utf-8?B?M1BkbkVHbDdZZWtjU3pkWlZpMG1uZlZiK2kzOC91cHpZV1RwWE10aUZESUpx?=
 =?utf-8?B?MEFleHVMTC9TNmNDL0QyOXBCOG5XL0JmWlBaZHdJR1JrWGZYemRBQXN4amtp?=
 =?utf-8?B?QWN5cEFaWnFXUUt0UHZKNjBhVXVVLzJjYmVXQWR6K2xTdFFKMXpuYVppaHho?=
 =?utf-8?B?cnFDbzU2NjhwUWVrOHlpYmE4eXdkNmNhRkI0YlVBSzR5NDlnaEs5STZDQVdF?=
 =?utf-8?B?Mkp4WEEwUFFteGFoYXZXNTRGZTFvYTUrd3c2aHlnVndxVzF4c1VLUldFQUU0?=
 =?utf-8?B?dE10U05Sd3BLYmFhd2RoelNDTkIxTnZld0FUWkxVZlZ2ZGhHcGVZUXBDMHF3?=
 =?utf-8?B?ekVsbTBOZ01KbWtWZWVkL3JleGR4QnIxOEFyMTZBN3N3ODA2empNTVNCektX?=
 =?utf-8?B?QXFNZmtnTXVwd09wOWxIdzJ1NCtrbEtoRVh0Mno2MWhPazZ4cEdkVEtJcXRp?=
 =?utf-8?B?VHduUXdqR1ltNGRlczczNmFHd0hlUnlXc2VGL09MdnVMQ3ZWY1JHdXZiUGxK?=
 =?utf-8?B?UEc1aXFkSjVoQnR3QlNpaHFSZ2xNQnNpYXZUTUFjN0J2MlRoWDlZUE5xczhz?=
 =?utf-8?B?dXM3UTgwQ2lROHF5Q1BBMU5qVS9sakV5SStyZmhNTVlpS1VEODAxNkNhbjd2?=
 =?utf-8?B?M0tCTkR0Zms0dTBQcGJXbkJ5YlRiRWhlYVF2MkZ5N3c1bVNLSDNkUXlFYXJm?=
 =?utf-8?B?cFRUTjNPRmhWaE5CSEJrSzlhU2drUHdpQnRFc1hYckYzaUFCWVZMN1Q1T1FF?=
 =?utf-8?B?NzBjT1dTVkZMZGlnZkZoRXJkTmR4cEMzRXB6NFJUNkllc012OExBM3FQaXlw?=
 =?utf-8?B?ZjdrdWdSQlhjTCt4OVArM2UyQURqTVBQUlVjYUdYbUpTMU43blEzN0JwVTlT?=
 =?utf-8?B?M2ZkUnlwTmdLV1UvcDRrS1BmOXNQTjlJNGZWQ0RhbzVCQ3lWMzZrZEprUFI2?=
 =?utf-8?B?cFpaWnZuTmFCV0s4TDZ2WWY4SThsQ3hHL0pZb3Zkbi9GRmJIK1k5V2FxNnJl?=
 =?utf-8?B?QW1ueXRhNjNoV2gyNUdxaHVMWkRHd25oSG5RZHFReVFtRmVzclArSmZlZlBz?=
 =?utf-8?Q?Ek6GfXwAQiU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGhwQXhoM2ZOSWNXL3c4S1lpbUVYdVcwN2YxRUdQdnhIRkZHa09zYXVYUC9F?=
 =?utf-8?B?ZEhUVEtsS1BDS2ZhbnJoamRmNi80YVgvYi9IRTVpUXJqbVRXVERHMUFLSjlT?=
 =?utf-8?B?R0VIV2wzUFYxS3FBZE5nOWhsaCtzYmhVREtBNDhXVlk1NUdGWXcrQXE3WGM4?=
 =?utf-8?B?Vm5oWE4rd0UweWVSVDhReE11R3JDWG9MejBKMmh2TGtxeTJOOXZxK0ZoVUt5?=
 =?utf-8?B?MHRSTWxsWURlQXlnL3BXUmoyb2FHMXd3Tm1wai9yOFEySnU2dEMzWWkwUEZC?=
 =?utf-8?B?MC9oOFIweHQ5SENjL2lIcUVDR3Y3MUZ1Mis2ZCs5Z3hYaWUvMlViaDFoRXBh?=
 =?utf-8?B?SUw3Qm90bDVmY3ZFQ2FZb05VUFJvdWVHYzc4bk1lL0h0SUN5bEpHcmZLelRO?=
 =?utf-8?B?Tng0WE1xOHVrRDJwL0ViOEExZ1ZwdXBvTU5BRVNSdFdBcCtYeUdhc29OditS?=
 =?utf-8?B?dGlqRW9aYTdMYUZjQ0tIMkJQK3JZOE5kNFJjdEtwZ2xLcTdJZnYwOGJMc0Jl?=
 =?utf-8?B?WnJySysxL2pJZkp4VGhnKzBwVU5TbWpBL29TSXV2dURuUHB6NWUxd0I4dUE4?=
 =?utf-8?B?b1NqY05HK0ptY1BoczBYQVQreWV2UGVQQzkrNlkxRlRxY3dVWGlUdXczYjZK?=
 =?utf-8?B?bjFOcDVyakRvcnhoY3BQM0l6QWdLWUtFSjFYSTVMdkJrc2NMa3JXRzJNSXhn?=
 =?utf-8?B?SmE2OGFTMi81aUlsU1MrZ2JmclBxcndUNndaNWRjV3k4TjZWWkwwMmg5QWtn?=
 =?utf-8?B?WEU2ck9vS2FaRkpqMHRWdm4zcWpjR05EUkp2dFdpb1owZUx2NmN6bGVuZ045?=
 =?utf-8?B?MDF5a2pnaGhzMm45TXBLZWJLVHJtUExKdFg2WnljUUc0YzYzUkYxaEdkRU5M?=
 =?utf-8?B?cWtrOHlRd0plbXRHQlFMcVVNeEQ1cHBjNDhPUWxmK0VzcDNqeUtrOEUxeHlx?=
 =?utf-8?B?NU1SL0Z4SnpIVmQySndyT2JmRWJsazVjeG9VN0Ewc05lSUN6WUpod2VaR3NB?=
 =?utf-8?B?elcxajZteVZVQXRkR1U4dWQ2eDkwZmQvNjZaWm53VTNaV1lzYWExT1AyWU9i?=
 =?utf-8?B?RW1MdVZjNEpadkovemxQQzdXRWtxZUw2WG1TWE41em9vbStYNWZLWUNUaElV?=
 =?utf-8?B?OUQrK3NFaHNJbHhKd1RXLzQ0dVBMSTcwZW1vZFpSR0o3ZmIydGRuUWNNS0Jv?=
 =?utf-8?B?amovdXA2cm5DU3BFb1A3YTZHV0tsT0pDRzdQWkpvWk5SVythSHU2cTZQb0pv?=
 =?utf-8?B?WWp4N05KY0RGSWk5SDV6WkhmOUR3U25SOTFxekZSaWkvdnY4ZE9ZMzFrZGc5?=
 =?utf-8?B?T2RKaXcxWjR3dnc0bUhwZldYQmM0emlKUmE2bkhPdEE5T0UwbElaeUVLTmRn?=
 =?utf-8?B?RFN0VWdLd1dCUjYwdmVSek50cDBpTUtqN2JmSE9ISDA4TWM2OHlCaVZ4VTdn?=
 =?utf-8?B?aEVpNTJIT1JtcXdvRGsrM3R0Q1pZaElSZk9ocjVBcFNpU1JsNkwwTThQenZU?=
 =?utf-8?B?aUpFT3N0SEtsZ2M4V0hFYmRjSHNCYm1TUThLbTVyVUFBcm5WZ1NnMkFrUGhI?=
 =?utf-8?B?MGZmbGhrSi9ReEZYR29icHZDTlZ2bEQ0TFVBamJKekJZMGhJVGpUSHZOdkdo?=
 =?utf-8?B?citRQmQ3SkUxemQ4K2h0NVRRQjdSN2wrVmVVdkhNVFZobGZVQzIva3UyK2Y0?=
 =?utf-8?B?cnk2QmcxM1NSRkRwdlArbTJLMDVMbFI2YzNtUzNJdFgyRlphdmxEQ0szNldS?=
 =?utf-8?B?MmZDaTduNnhoVVB2VHp5eXhrUE9tQzJiNU9GLzdmMThLZERWc1Q1WkpUcE1E?=
 =?utf-8?B?NVJQc3NSVXhpYkR1K1N3aTFOSnV4am8vQVVIaE9CWUY1Wmt3VVRqSmQ1SE9o?=
 =?utf-8?B?L05abksxaW1sLzJaVkRmZ0R2OFlqdDBZVlI3Nk5IK2JZM3RYRGxHQldBYTNJ?=
 =?utf-8?B?eFdKYXJzMmpPYXdteGtQbnRKaGdwbWRleXR2Z253cm1Lc0tqdmJ5aitwUnpr?=
 =?utf-8?B?ckJYT2QwWmZ6ckdjd0ZKUkhnb25hRkY5OHVWMWpud21wVXJFT3YxUkU0UUMx?=
 =?utf-8?B?K3FVdmxFaXFCcEtENTBBS0RqV283WTIzK1NkcUZGMjJkeTcrMjgyYU5SSktj?=
 =?utf-8?Q?sEgdJMn6lwIEn+vGlrOniIAx1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e460d24e-2795-447e-2899-08dd6e2144d9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:52:12.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +geZRlQf00lE0hF/x/O0o/Ttj0aZzJJydkHRbhUmoznVFKf3SQDMdTkHqtzdeV4CrePrzR3RQk5YHuig5gouwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
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


On 15.03.2025 15:27, Michal Wajdeczko wrote:
> On 15.03.2025 00:45, Lis, Tomasz wrote:
>> On 14.03.2025 19:22, Michal Wajdeczko wrote:
>>> On 06.03.2025 23:21, Tomasz Lis wrote:
>>>> We have only one GGTT for all IOV functions, with each VF having
>>>> assigned
>>>> a range of addresses for its use. After migration, a VF can receive a
>>>> different range of addresses than it had initially.
>>>>
>>>> This implements shifting GGTT addresses within drm_mm nodes, so that
>>>> VMAs stay valid after migration. This will make the driver use new
>>>> addresses when accessing GGTT from the moment the shifting ends.
>>>>
>>>> By taking the ggtt->lock for the period of VMA fixups, this change
>>>> also adds constraint on that mutex. Any locks used during the recovery
>>>> cannot ever wait for hardware response - because after migration,
>>>> the hardware will not do anything until fixups are finished.
>>>>
>>>> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>>>>     after querying; improved documentation; switched some warns to
>>>> asserts;
>>>>     skipping fixups when GGTT shift eq 0; iterating through tiles
>>>> (Michal)
>>>> v3: Updated kerneldocs, removed unused funct, properly allocate
>>>>     balloning nodes if non existent
>>>>
>>>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ggtt.c              | 163 ++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_ggtt.h              |   2 +
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  26 ++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>>>>    drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 +++
>>>>    6 files changed, 216 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> index 5fcb2b4c2c13..6865d1cdd676 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> @@ -489,6 +489,169 @@ void xe_ggtt_node_remove_balloon(struct
>>>> xe_ggtt_node *node)
>>>>        xe_ggtt_node_fini(node);
>>>>    }
>>>>    +static u64 drm_mm_node_end(struct drm_mm_node *node)
>>>> +{
>>>> +    return node->start + node->size;
>>>> +}
>>>> +
>>>> +static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct
>>>> drm_mm_node *balloon_beg,
>>>> +                struct drm_mm_node *balloon_fin, s64 shift)
>>>> +{
>>>> +    struct drm_mm_node *node, *tmpn;
>>>> +    LIST_HEAD(temp_list_head);
>>>> +    int err;
>>>> +
>>>> +    lockdep_assert_held(&ggtt->lock);
>>>> +
>>>> +    /*
>>>> +     * Move nodes, from range previously assigned to this VF, into
>>>> temp list.
>>>> +     *
>>>> +     * The balloon_beg and balloon_fin nodes are there to eliminate
>>>> unavailable
>>>> +     * ranges from use: first reserves the GGTT area below the range
>>>> for current VF,
>>>> +     * and second reserves area above.
>>>> +     *
>>>> +     * Below is a GGTT layout of example VF, with a certain address
>>>> range assigned to
>>>> +     * said VF, and inaccessible areas above and below:
>>>> +     *
>>>> +     *
>>>> 0                                                                        4GiB
>>>> +     *  |<--------------------------- Total GGTT size
>>>> ----------------------------->|
>>>> +     *
>>>> WOPCM                                                         GUC_TOP
>>>> +     *      |<-------------- Area mappable by xe_ggtt instance
>>>> ---------------->|
>>>> +     *
>>>> +     *  +---+---------------------------------+----------
>>>> +----------------------+---+
>>>> +     *  |\\\|/////////////////////////////////|  VF mem
>>>> |//////////////////////|\\\|
>>>> +     *  +---+---------------------------------+----------
>>>> +----------------------+---+
>>>> +     *
>>>> +     * Hardware enforced access rules before migration:
>>>> +     *
>>>> +     *  |<------- inaccessible for VF ------->|<VF owned>|<--
>>>> inaccessible for VF ->|
>>>> +     *
>>>> +     * drm_mm nodes used for tracking allocations:
>>>> +     *
>>>> +     *     |<----------- balloon ------------>|<- nodes->|<-----
>>>> balloon ------>|
>>>> +     *
>>>> +     * After the migration, GGTT area assigned to the VF might have
>>>> shifted, either
>>>> +     * to lower or to higher address. But we expect the total size
>>>> and extra areas to
>>>> +     * be identical, as migration can only happen between matching
>>>> platforms.
>>>> +     * Below is an example of GGTT layout of the VF after migration.
>>>> Content of the
>>>> +     * GGTT for VF has been moved to a new area, and we receive its
>>>> address from GuC:
>>>> +     *
>>>> +     *  +---+----------------------+----------
>>>> +---------------------------------+---+
>>>> +     *  |\\\|//////////////////////|  VF mem
>>>> |/////////////////////////////////|\\\|
>>>> +     *  +---+----------------------+----------
>>>> +---------------------------------+---+
>>>> +     *
>>>> +     * Hardware enforced access rules after migration:
>>>> +     *
>>>> +     *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible
>>>> for VF ------->|
>>>> +     *
>>>> +     * So the VF has a new slice of GGTT assigned, and during
>>>> migration process, the
>>>> +     * memory content was copied to that new area. But the drm_mm
>>>> nodes within xe kmd
>>>> +     * are still tracking allocations using the old addresses. The
>>>> nodes within VF
>>>> +     * owned area have to be shifted, and balloon nodes need to be
>>>> resized to
>>>> +     * properly mask out areas not owned by the VF.
>>>> +     *
>>>> +     * Fixed drm_mm nodes used for tracking allocations:
>>>> +     *
>>>> +     *     |<------ balloon ------>|<- nodes->|<----------- balloon
>>>> ----------->|
>>>> +     *
>>>> +     * Due to use of GPU profiles, we do not expect the old and new
>>>> GGTT ares to
>>>> +     * overlap; but our node shifting will fix addresses properly
>>>> regardless.
>>>> +     *
>>>> +     */
>>>> +    drm_mm_for_each_node_in_range_safe(node, tmpn, &ggtt->mm,
>>>> +                       drm_mm_node_end(balloon_beg),
>>>> +                       balloon_fin->start) {
>>>> +        drm_mm_remove_node(node);
>>>> +        list_add(&node->node_list, &temp_list_head);
>>>> +    }
>>>> +
>>>> +    /* shift and re-add ballooning nodes */
>>>> +    if (drm_mm_node_allocated(balloon_beg))
>>>> +        drm_mm_remove_node(balloon_beg);
>>>> +    if (drm_mm_node_allocated(balloon_fin))
>>>> +        drm_mm_remove_node(balloon_fin);
>>>> +    balloon_beg->size += shift;
>>>> +    balloon_fin->start += shift;
>>>> +    balloon_fin->size -= shift;
>>>> +    if (balloon_beg->size != 0) {
>>>> +        err = drm_mm_reserve_node(&ggtt->mm, balloon_beg);
>>>> +        xe_tile_assert(ggtt->tile, !err);
>>>> +    }
>>>> +    if (balloon_fin->size != 0) {
>>>> +        err = drm_mm_reserve_node(&ggtt->mm, balloon_fin);
>>>> +        xe_tile_assert(ggtt->tile, !err);
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Now the GGTT VM contains only nodes outside of area assigned
>>>> to this VF.
>>>> +     * We can re-add all VF nodes with shifted offsets.
>>>> +     */
>>>> +    list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>>>> +        list_del(&node->node_list);
>>>> +        node->start += shift;
>>>> +        err = drm_mm_reserve_node(&ggtt->mm, node);
>>>> +        xe_tile_assert(ggtt->tile, !err);
>>>> +    }
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_ggtt_node_shift_nodes - Shift GGTT nodes to adjust for a
>>>> change in usable address range.
>>>> + * @ggtt: the &xe_ggtt struct instance
>>>> + * @balloon_beg: ggtt balloon node which preceds the area
>>>> provisioned for current VF
>>>> + * @balloon_fin: ggtt balloon node which follows the area
>>>> provisioned for current VF
>>>> + * @shift: change to the location of area provisioned for current VF
>>>> + */
>>>> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct
>>>> xe_ggtt_node **balloon_beg,
>>>> +                  struct xe_ggtt_node **balloon_fin, s64 shift)
>>>> +{
>>>> +    struct drm_mm_node *balloon_mm_beg, *balloon_mm_end;
>>>> +    struct xe_ggtt_node *node;
>>>> +
>>>> +    if (!*balloon_beg)
>>>> +    {
>>>> +        node = xe_ggtt_node_init(ggtt);
>>>> +        if (IS_ERR(node))
>>>> +            goto out;
>>>> +        node->base.color = 0;
>>>> +        node->base.flags = 0;
>>>> +        node->base.start = xe_wopcm_size(ggtt->tile->xe);
>>>> +        node->base.size = 0;
>>>> +        *balloon_beg = node;
>>>> +    }
>>>> +    balloon_mm_beg = &(*balloon_beg)->base;
>>>> +
>>>> +    if (!*balloon_fin)
>>>> +    {
>>>> +        node = xe_ggtt_node_init(ggtt);
>>>> +        if (IS_ERR(node))
>>>> +            goto out;
>>>> +        node->base.color = 0;
>>>> +        node->base.flags = 0;
>>>> +        node->base.start = GUC_GGTT_TOP;
>>>> +        node->base.size = 0;
>>>> +        *balloon_fin = node;
>>>> +    }
>>>> +    balloon_mm_end = &(*balloon_fin)->base;
>>>> +
>>>> +    xe_tile_assert(ggtt->tile, (*balloon_beg)->ggtt);
>>>> +    xe_tile_assert(ggtt->tile, (*balloon_fin)->ggtt);
>>>> +
>>>> +    xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end,
>>>> shift);
>>>> +out:
>>>> +    if (*balloon_beg && !xe_ggtt_node_allocated(*balloon_beg))
>>>> +    {
>>>> +        node = *balloon_beg;
>>>> +        *balloon_beg = NULL;
>>>> +        xe_ggtt_node_fini(node);
>>>> +    }
>>>> +    if (*balloon_fin && !xe_ggtt_node_allocated(*balloon_fin))
>>>> +    {
>>>> +        node = *balloon_fin;
>>>> +        *balloon_fin = NULL;
>>>> +        xe_ggtt_node_fini(node);
>>>> +    }
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_ggtt_node_insert_locked - Locked version to insert a
>>>> &xe_ggtt_node into the GGTT
>>>>     * @node: the &xe_ggtt_node to be inserted
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>>>> index 27e7d67de004..d9e133a155e6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>>>> @@ -18,6 +18,8 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>>>>    int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>>>>                    u64 start, u64 size);
>>>>    void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
>>>> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct
>>>> xe_ggtt_node **balloon_beg,
>>>> +                  struct xe_ggtt_node **balloon_fin, s64 shift);
>>>>      int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32
>>>> align);
>>>>    int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/
>>>> xe/xe_gt_sriov_vf.c
>>>> index a439261bf4d7..dbd7010f0117 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> @@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>>        xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>>>                    start, start + size - 1, size / SZ_1K);
>>>>    +    config->ggtt_shift = start - (s64)config->ggtt_base;
>>> btw, is it safe to keep ggtt_shift after we're done with fixups?
>> its value is always set in `vf_post_migration_requery_guc()`. And fixup
>> functions are only called after that, and will never be called outside
>> of recovery.
> "called after"
> "called outside"
>
> is that somehow enforced? do we some asserts for that?

It is "enforced", by the flow of the code. Are you implying there is a 
need of protecting against someone reordering the lines of code within 
the function, or calling random functions from somewhere else?

No, we do not and will not protect from that. We have the tools - a 
kernel thread can check whether it's a specific worker. It just makes no 
sense to check for that.

>> So, yes it's safe.
> I would feel more safe if the ggtt_shift is guaranteed to be zero
> outside the recovery process

No, I see no point in that. We do not clear unused variables in kernel.  
Because there's no point if they're unused (unless they cause a security 
risk, but it doesn't happen here).

It wouldn't be hard to do - the value is only set within the worker, and 
we can only have one worker at once - so the shift could be cleared 
without any need of additional protection.

It is just against the kernel development practices.

>>>>        config->ggtt_base = start;
>>>>        config->ggtt_size = size;
>>>>    @@ -938,6 +939,31 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt
>>>> *gt)
>>>>        return err;
>>>>    }
>>>>    +/**
>>>> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match
>>>> assigned range.
>>>> + * @gt: the &xe_gt struct instance
>>>> + * Return: 0 on success, ENODATA if fixups are unnecessary
>>> if you really need to distinguish between nop/done then bool as return
>>> will be better, but I'm not sure that caller needs to know
>> I don't really need this. Michal, this was introduced on your request.
> hmm, I don't recall and can't find it now my prev reply...
>
> but likely my point was that if we can fail we should report that
>
>>> if we need to know whether there was a shift, and thus we need to start
>>> the fixup sequence, then maybe we should have a separate function that
>>> returns (and maybe clears) the ggtt_shift
>> No need to clear the shift.
> but it could be easily used as indication of WIP vs DONE/NOP

Where do we need such a check? Even if we need it somewhere, how is that 
better from checking if the worker is active?

>> I did not checked for a zero shift in my original patch. I consider it
>> pointless to complicate
> what's so complicated in check for zero/non-zero?
>
> with zero shift there is nothing to do, so even with
> broken/unimplemented fixup code we should still be able to move on (by
> avoid calling fixup code at all or doing early exit if shift is 0)

I've often got requests of putting two, and sometimes even one line into 
a separate function. You know who requested these.

Now we're discussing making a chunk of logic conditional, and you have 
no problem with complicating the code?

What has changed?

Secondly, what is the benefit? Faster recovery? No, we're saving 
microseconds.

Error avoidance? If there is internal inconsistency somewhere, 
everything will fall regardless

whether we iterate through some requests and messages or not.

Making this conditional strikes me as an example of premature, 
completely unnecessary optimization.

Thirdly, "nothing to do"? we still have to do the time-intensive part of 
the work in the exact same

way - get provisioning, and send RESFIX_DONE at the end. All we're 
skipping is a set of 4 (some to be added later)

functions, the ones which never wait for hardware so pass through at 
full CPU speed.

Again, why are we doing this? If we're complicating the code, adding new 
conditions, then there must be a reason.

Why make it "so complicated" only for the complication sake? Is there 
some kind of threshold for unnecessary complication?

>> the flow with this skip. This was introduced on your request. If you
>> agree please let me
>>
>> know and I will revert the changes which introduced this check. I can
>> instead make a separate
>>
>> function iterating through tiles too, if that is your preference.
>>
>>>> + *
>>>> + * Since Global GTT is not virtualized, each VF has an assigned range
>>>> + * within the global space. This range might have changed during
>>>> migration,
>>>> + * which requires all memory addresses pointing to GGTT to be shifted.
>>>> + */
>>>> +int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
> what about
>
> 	xe_gt_sriov_vf_fixup_ggtt_nodes(gt, ggtt_shift)

We're often hiding arguments for functions, but this one requires an 
additional one?

What is the reason? Why this one in particular?

I do not see any reason for that change.

>>>> +{
>>>> +    struct xe_gt_sriov_vf_selfconfig *config = &gt-
>>>>> sriov.vf.self_config;
>>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>>> +    struct xe_ggtt *ggtt = tile->mem.ggtt;
>>>> +    s64 ggtt_shift;
>>>> +
> then
> 	xe_gt_assert(gt, ggtt_shift);
> or
> 	if (!ggtt_shift)
> 		return

Why? What is the reason? What is the benefit for additional code? What 
are the savings?

I don't see the necessity. The code will work perfectly fine with zero 
shift.

>>>> +    mutex_lock(&ggtt->lock);
>>>> +    ggtt_shift = config->ggtt_shift;
>>>> +    if (ggtt_shift)
>>>> +        xe_ggtt_node_shift_nodes(ggtt, &tile->sriov.vf.ggtt_balloon[0],
>>>> +                     &tile->sriov.vf.ggtt_balloon[1], ggtt_shift);
>>> maybe to make it a little simpler on the this xe_ggtt function side, we
>>> should remove our balloon nodes before requesting shift_nodes(), and
>>> then re-add balloon nodes here again?
>> I like having balloons re-added first, as that mimics the order in
>> probe, and makes the flow more logical: define bounds first, then add
>> the functional content.
> but during the recovery there will be no new allocations, so we can drop
> the bounds/balloons, move existing nodes, and apply new bounds/balloons

While I don't agree these arguments justify the change, the arguments 
below do justify it.

>> What would make this flow simpler is if the balloons always existed
>> instead of having to be conditionally created.
> it might be also simpler if we try to reuse existing ballooning code
> from xe_gt_sriov_vf_prepare_ggtt() - maybe all we need is to add
> xe_gt_sriov_vf_release_ggtt() that will release balloons on request

The code reuse is a good argument for this change. Will do, with all 
required

locking changes.

>> Having the balloons added at the end would not make the code easier to
>> understand for new readers, but actually more convoluted.
> why? in xe_ggtt we might just focus on moving the nodes (maybe using
> drm_mm_shift from your [2] series) without worrying about any balloons
>
> and without the balloons (which are really outside of xe_ggtt logic
> right now) we know that nodes shifts shall be successful
>
> [2]
> https://lore.kernel.org/dri-devel/20250204224136.3183710-1-tomasz.lis@intel.com/

The kernel dev practices are to avoid using uncertain future changes as 
a justification

for current code. But by heart I agree, this does help with future 
prospects.

>> That would also mean in case of error we wouldn't just get few non-
>> allocated nodes, but unset bounds.
> hmm, so maybe the only problem is that right now, ie. after xe_ggtt_node
> refactoring, our balloon nodes are initialized (allocated) at the same
> time when we insert them into GGTT
>
> if in the VF code we split calls to xe_ggtt_node_init() and
> xe_ggtt_node_insert_balloon() then there could be no new allocations
> when re-adding balloons during recovery, so we can't fail due to this

With the code reuse, the split is not only required due to error 
returns, but also

to avoid creating lockdep relation between ggtt lock and memory allocation.

>> No reset would recover from that.
>>
>>>> +    mutex_unlock(&ggtt->lock);
>>>> +    return ggtt_shift ? 0 : ENODATA;
>>> and it's quite unusual to return positive errno codes...
>> right, will negate.
> negative codes usually means errors, but I guess we can't fail, and all
> you want is to say whether we need extra follow up steps (fixups) or not
>
> so bool return is likely a better choice
>
>>>> +}
>>>> +
>>>>    static int vf_runtime_reg_cmp(const void *a, const void *b)
>>>>    {
>>>>        const struct vf_runtime_reg *ra = a;
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/
>>>> xe/xe_gt_sriov_vf.h
>>>> index ba6c5d74e326..95a6c9c1dca0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> @@ -18,6 +18,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>>>    int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>>>    int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>>>    int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>>>> +int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
>>>>    int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>>>    void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>>    diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/
>>>> gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> index a57f13b5afcd..5ccbdf8d08b6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>>        u64 ggtt_base;
>>>>        /** @ggtt_size: assigned size of the GGTT region. */
>>>>        u64 ggtt_size;
>>>> +    /** @ggtt_shift: difference in ggtt_base on last migration */
>>>> +    s64 ggtt_shift;
>>>>        /** @lmem_size: assigned size of the LMEM. */
>>>>        u64 lmem_size;
>>>>        /** @num_ctxs: assigned number of GuC submission context IDs. */
>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/
>>>> xe_sriov_vf.c
>>>> index c1275e64aa9c..4ee8fc70a744 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> @@ -7,6 +7,7 @@
>>>>      #include "xe_assert.h"
>>>>    #include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>>    #include "xe_gt_sriov_printk.h"
>>>>    #include "xe_gt_sriov_vf.h"
>>>>    #include "xe_pm.h"
>>>> @@ -170,6 +171,26 @@ static bool vf_post_migration_imminent(struct
>>>> xe_device *xe)
>>>>        work_pending(&xe->sriov.vf.migration.worker);
>>>>    }
>>>>    +static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>>>> +{
>>>> +    struct xe_tile *tile;
>>>> +    unsigned int id;
>>>> +    int err;
>>>> +
>>>> +    for_each_tile(tile, xe, id) {
>>>> +        struct xe_gt *gt = tile->primary_gt;
>>>> +        int ret;
>>>> +
>>>> +        /* media doesn't have its own ggtt */
>>>> +        if (xe_gt_is_media_type(gt))
>>> primary_gt can't be MEDIA_TYPE
>> ok, will remove the condition.
>>>> +            continue;
>>>> +        ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
>>>> +        if (ret != ENODATA)
>>>> +            err = ret;
>>> for multi-tile platforms, this could overwrite previous error/status
>> Kerneldoc for `xe_gt_sriov_vf_fixup_ggtt_nodes` explains possible `ret`
>> values. With that, the solution is correct.
> this is still error prone, as one day someone can add more error codes
> to xe_gt_sriov_vf_fixup_ggtt_nodes()
>
> hmm, and while the doc for xe_gt_sriov_vf_fixup_ggtt_nodes() says:
>
> 	Return: 0 on success, ENODATA if fixups are unnecessary
>
> what would be expected outcome of vf_post_migration_fixup_ggtt_nodes()?
>
> maybe with bool it will be simpler (for both functions):
>
> 	Return: true if fixups are necessary

What would be simpler is no unnecessary return value at all, like in my 
original series.

But ok, I will switch the standard Linux error codes to just a bool.

-Tomasz

>>>> +    }
>>>> +    return err;
>>> err might be still uninitialized here
>> True. Will fix.
>>
>> -Tomasz
>>
>>>> +}
>>>> +
>>>>    /*
>>>>     * Notify all GuCs about resource fixups apply finished.
>>>>     */
>>>> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct
>>>> xe_device *xe)
>>>>        if (unlikely(err))
>>>>            goto fail;
>>>>    +    err = vf_post_migration_fixup_ggtt_nodes(xe);
>>>>        /* FIXME: add the recovery steps */
>>>>        vf_post_migration_notify_resfix_done(xe);
>>>>        xe_pm_runtime_put(xe);
