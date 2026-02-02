Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3E2E7DF16
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 18:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7F410E53A;
	Mon,  2 Feb 2026 18:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPhmat3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5991A10E53A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 18:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770055895; x=1801591895;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=riENtaCi4kDBRWlFZe9aC1/Sbxjl6+VBOxvd06uoGIA=;
 b=ZPhmat3vebmLDRuq77cBDmcb1wKWv96SU82CYhmsWBE56vZZs+YHXhfF
 mM4gzY3l65ecHyZeNwWBbB4ethTJdepHxCuvtLCHArOMFsaQUjrN6hqzX
 cfdyk1DRsPhLoEi7iRBkSsuEezUoDguy2aRFDYCzdwMwsA66wWmUM4fqK
 aZQJf+vcmyjmqqOvYADlRsQlMAvAucrhxFSSkxa9yQR9Lj9jUIadx/rEy
 y2cxzXIfI1tsZk6efLHpbZLJibthUeHgFrK4DNgt3HUFoOZwkskmHVZtL
 Sh4TczqgBCTs0F9NPI9Ovl8Xkv7yUVeaLpfW3S02ex/mqThl7UZEvt2zA A==;
X-CSE-ConnectionGUID: SoZ4EBvLQAq+WTxJPuqFEg==
X-CSE-MsgGUID: u3x3kRNnQgaZ4ShqGOSS6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75074971"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="75074971"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 10:11:35 -0800
X-CSE-ConnectionGUID: DA/y9Y2qRxiKkeq4jOzORw==
X-CSE-MsgGUID: YA2haXymRpmRPzfHLPXC3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209372162"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 10:11:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 09:20:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 09:20:26 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 09:20:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMI2HRkDJ7jqrh7anEaSElb3qocKCAnYpx8Q/6LGxlZ6ZuI3dnZ837XV6AzeyTFwAtm9MMHxb45C/x2cR8TEFIhPDZqvu5eupKL1dR5R+geh+RqmxRBPWzMOkCW6WEy5e2ABBLncb8eDNNkPsP1kM94WzgAM4M9YdjDjSdKDRlNed+1nzgb9ozNoQtLu3riNUSy0CKnouI1CYMAQn3d6f284Z/Q5mbYj9+bn6c6PAwIO60AqBdFG120wpMLuYZi10PRMj1nYGumrBz1SCD1lvZoA8iQXGhtdAaUyxcVG2C2f8zhVFIscnp7uLUc92w1KYAWHbXe+f326NZfrtC6u2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED5FFCu5dlWMckRDX/Rql4ihz0S+7c1x4EU6SyCaQuM=;
 b=F3tlAIe1LsRmfcOSnmEndcHHLqJ+Qe/HnwTQJtBioKZlqu0lRKYFjqQtHFN8tmq08RvJFuBqo/KlfZCbqSgeJG49qJ7st28mFoDFj01egHcTyEr1bLlHvhHsDVoWChn+a18SYjUHrB7gt54jGJ/9MW3Zg8DsmmmXcSbIY2rm8Hs1v2fMyKq7wiYZ3t3xBbMwH3XVCugcyL333kyPXTgMreF/AjkmCTuL5tueKM6H0aR/vvbzDLS56BEsPP1p8iMGnb/JqDI2IuV0IJ+NRDe3PbJ2Mhe/OLwN1yWjtWZTDriQKQ+ACnGW6opVyLuKOUCD3U10a8+R5OZIcq0j0jurAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH8PR11MB9505.namprd11.prod.outlook.com (2603:10b6:610:2bb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Mon, 2 Feb
 2026 17:20:24 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9564.010; Mon, 2 Feb 2026
 17:20:24 +0000
Message-ID: <421a0f41-38f5-4887-8d89-d38442d8fef4@intel.com>
Date: Mon, 2 Feb 2026 22:50:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add forcewake status to powergate_info
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
 <20260115224040.2668209-3-vinay.belgaumkar@intel.com>
 <a5187a5e-f74e-4d8c-a435-131a86d5f649@intel.com>
 <c07e167c-33cf-4497-8a31-e88c5a0414a8@intel.com>
 <7a7b4693-8a28-423c-bbbb-8b16b4ee2de7@intel.com>
 <e40bb59b-d40e-46a1-9792-93019db06221@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <e40bb59b-d40e-46a1-9792-93019db06221@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH8PR11MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: 51785859-ad33-407c-71f2-08de627f59b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDNYVE1BeC9zZEhWMVc2clF2b3VwekFmcE5yUy81Z1R4R1lKdWxWbGwxUWNP?=
 =?utf-8?B?WlBwK1dOTldVZklKMUFjMEpybWEwd0pWUnVVZi9tTHZ0cE83b0dQMWhLQTVu?=
 =?utf-8?B?QzVrbG02L2FwSHBzcGZ0T2hadFFqcUR3c0YzdW84TXBMaUVGZmhTaXJRanJ1?=
 =?utf-8?B?clpTdVJRbmZYdGlJL3pKUmlSc3RBbWUrbVZyUUV5bEI1MzdlVzBlai9USGpH?=
 =?utf-8?B?bjZ5OUFDMWtWSXBJOTVhWDAybm1Sc01YTzA0RlhLcnozVHJPWkZ2blJYOUVl?=
 =?utf-8?B?YkQwYUJjcWpxSUdwMUluQ2w5NnRVTnVJWWRSSE8xei9pOWppZVBmcE85RjNu?=
 =?utf-8?B?SmZzMWc0OFhLMEs4NkJObHpoaUUxQVUrdTd1WDV6d1ExY1Nra1h0Z1MzdHNo?=
 =?utf-8?B?N0tNMWhCTlpKeW9WS2Z0WWVKV2ZyeTh2VWx4ekdIWFBMRExQbTdiSHFsSUJN?=
 =?utf-8?B?S2RGdXRXckkwOTBUUEhTSUdxc01od2NEcTlURUt6alVvblg2dU5IaGl4SFN3?=
 =?utf-8?B?TXB1MnhzbGkwS25tV0lGT21qWVIzdUphT0JQY21xSFpSRVZWOVZyRmpzYlRP?=
 =?utf-8?B?N3lsNjViYXFpQTJ6NnprcjQwL05XTnNibjhQWk0rZE83Um10dXNia1BBQy9O?=
 =?utf-8?B?N1Z3NHNLQUNpVlRtanYxWHZ3Rzc5REc2a244SVR4ZVlIRVFzQnljUWxrdm1O?=
 =?utf-8?B?eU5sbHAyR05kTGtoTGxpTmh5OEQwZC8xVVVVZ1plMkcvaXJOdWdoTm5nMFFS?=
 =?utf-8?B?MEp3L3VHelpvbmhROHEvek42bE4venhPNERDb3JhTGU5L2kyQUlPdFg1S0Rx?=
 =?utf-8?B?bHd4RGFqZG1seWlMQlEyUEVwaFdEZlNRREVLQVkwQnRVMG9Wb3l3dWJObjNE?=
 =?utf-8?B?YVhwcHFXQXo4WG1GWlFOanBXRTc3VHh4Sk9ycHVVN2NyUFRWc2U5R1NVMTJk?=
 =?utf-8?B?SzIzWjd1elpUdXZjWWg2OVVSRTNYcHZjM3h2M244bThhdHlqamNQd2poMTFt?=
 =?utf-8?B?cGtBdTBteXdlbHJNRWVDQ0ZKUlRBUU9LV3N1bDNUSkd4TUJQejFpSVU4eVVp?=
 =?utf-8?B?NEdYOWRvdG5lcjFsWGpqM2JyQXVIMzZDNFJDcHpXMi9wbENHQVhTNjdzL3J4?=
 =?utf-8?B?WWU0bEQxVWFHTnN0N0JrVEVFNURMMzRjc2tlTWp6TDJwb3FHUW10c1Y5c29m?=
 =?utf-8?B?NlROdmFZbGxseVVPcFpPSm9uSkMrLzZQZVcrTEdCRVRtMENMUGZEa25tVFlN?=
 =?utf-8?B?ZkhQcjdVdm1hWmdNd2llT0cycGtib0FIOHJpaXMyaEJpenlsWTE4anJEdTlG?=
 =?utf-8?B?RHEvaDJBY1Roc2JuK3hsOWpWQk5UNDBHK0NyOWVPNitHdXRKaEIxZkJTS3JN?=
 =?utf-8?B?Y1V1Y0NybTdBU3ZMYmxTdUw3ZC9JVlU1eXJUMHZrbXJzMTJPUEZuYUxUU1pn?=
 =?utf-8?B?b1RmK0ZOZE9DTGlkdFFLUFVLTit2RzZTaDd6TUtJTTRQNHpYTWEvcTZINENk?=
 =?utf-8?B?T3lDQ1B3WGJoeHQveGNOcDRmbHZwRENHdERnck9GQTk5NWpJR2h3YjE5ZHRn?=
 =?utf-8?B?SkFJOG8xbTA0dmJ0OEFqMkZ6RytYRk9aeUN0cVc2WWdLOHM0UEtyd2Q3emk5?=
 =?utf-8?B?Z2ZIYUtXalQvRmRXMHNEbVVLRHFDaTJHVmFycWpSMHJsQ0dmQkdxdlczRXhB?=
 =?utf-8?B?NTlHNlB0SHVDekZJVC8wZlJkUzJkenlhUElGMDBoUzBVNEVVWXdaOVRweW1o?=
 =?utf-8?B?TXk5cktveGZmM0NSNlJubmpPRFFBKzNQNWc5Vnl0YVV2amY1VnFUb0VDZzJ5?=
 =?utf-8?B?MWpLQUJodWQzbWxJQUpQb1VCdG5ISWJGM2YvK09zM2dWbjRNYWpDQWdveEJG?=
 =?utf-8?B?V2lDem9FaTdnRjlhelplZWVhZytKdnlZaWxNV3FERUVmREg1NDBUaEZGK2NK?=
 =?utf-8?B?bFBlUEZRMnVQb256eTJuekFCWjMvQ1FBNWtFZzJHODlBRnhGaHNtZnR6a05E?=
 =?utf-8?B?aklVVGp2WUhpUmMxWFMxYmxIT3VuckNZRi9vWWw0eUorNUlIcWEzd2hVaHFU?=
 =?utf-8?B?dDJkKzlPb3F5NmU0U28rYSsxa1ptNFpKS0RwaFJLZGN3TjJHYXp2dm1ZMlc5?=
 =?utf-8?Q?52Xs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2dtZ3RNOFk0b3BkWU8wbEpMZzZpVXNXRHhvY0JXYWVHbzYvNnFSdmFaZWxU?=
 =?utf-8?B?TmhhYXZUcitaMEhrTWZaNUlEVmdJSnlvVE52cDdZTjVKZSt6RmM2Z21IaXhp?=
 =?utf-8?B?TFAyVGJ2TmEvMFJUZWtPcUVLcFNvczF4QjdVUFREd2JPanFGb2JjWEJuNVkx?=
 =?utf-8?B?N3ZxbFhmWFo3U2poOS84dlVjampURE9HdUFzMXlVaS9YcnZMTUFOQ0kraURL?=
 =?utf-8?B?emp3SHdJemQ4RlBuRys5SVNTeWNPd051TmRwUE1lQUdZMmJ2YlNRMEZjcnNF?=
 =?utf-8?B?VTFZUlJZTFVPSzVUUzFIcmF1VjNPV05IdjBSUHUrMFN4amxtTTkxeHJGQm50?=
 =?utf-8?B?a1BkcUE4LzFvMFkxbE5ubjNuLzRnVTY2WXJyYmttUzhya0c5aEZQT1dobnJj?=
 =?utf-8?B?bXNWS0hsR2kvcG9mSjFGdWo5RkZXTmJQbXZ5aSsxZmtIZ1NKV0JUelFaTlVG?=
 =?utf-8?B?NkVJdFJHNlBYVmlTMHN2WnBYSVdOMnJwZDdtMVdsRmMwend1TGZ1alhTUm1E?=
 =?utf-8?B?OE1jdlozT3Q0R2RsaXUyMHd3d2F5UEg3Z1gzcDJrNDNtN05SR09iZEltSy9u?=
 =?utf-8?B?V3V4YVNxTHZHeU82dFRaSVZCbFZ3T2xtWU9QSFRvTWJOQlVJYmFoK0tJODBz?=
 =?utf-8?B?U21SRFZVaHcraDdQRE9ab0N3MVhEYW5CKy9JWVhUUWpNRnFwSlhmTDc4a0ta?=
 =?utf-8?B?VWdHNVBrbzVpdC9pb0VROE9FeUxSZFJjRkp3ZldkYlJMZVFTQUJGUVlPY2Z0?=
 =?utf-8?B?a0NlQW9uMXZnempjdkZEZ0RwZ0pHa0pRWFZST1ZFaDlLQnh6MXRhbmg2ZW84?=
 =?utf-8?B?UVZsMHptZkFPYWJ6WTR6RmlLTTJrWmpldWZLMGpBek9veEtRWEtzcmFXSVdI?=
 =?utf-8?B?QlAvRjRMNzBuSEdIWk44bll2N0FFbWFoYUpsRG9CSlFMQ1ZjQ3hZREpqL0dz?=
 =?utf-8?B?dVk2NWRIU1k0ZkFtaUlRWUxXa2F3V1poQkc4NE0wbDZJbXBRZzhIN2FhZGk5?=
 =?utf-8?B?OUtpc0ttNlBFaXB6UGJNTGNCbU1aV3Z4Wi83S2VscHlhZjl4UjFVcE9TdUZ0?=
 =?utf-8?B?OWM4R1RVWktpWVBza05wMG5nczdEUEdGTlBiY1NaekswVmZVS0Z5VVFiRGxM?=
 =?utf-8?B?cGtWTlNiVU5hazIwdmhpQUFjRlJ1S1QwRUo0MnJkVkhtRHpaa0tBOE9BcXFm?=
 =?utf-8?B?YmhtUkZTeUZ4VnVDV2ozRTdINDRoeXRSWVVNZk9yNXZWbTZpbXNtYWdBbmxv?=
 =?utf-8?B?UHNmSUtvOGljeXRpelVZNmVLcEhFc3NTMUtUZWdPcUhRaUF1OG1mNkF2d1Jt?=
 =?utf-8?B?NVYwZXdBY0krUDRIcGpnRG5YWmlXUlY4WS9WTUdPZzFwK05ZNFRiNUtZQ0hs?=
 =?utf-8?B?ZGlPVkVUOUlNYmRwLzhqeXFkTXhaa1lEVFFEajBDcnRNUUFzemlWcWxRWmw5?=
 =?utf-8?B?NGh1bVRUSUZ6UmJuZTJ6S0M3OXhOS01xWk5sQS8zOS9MeXhtbWNoNFkxcWZY?=
 =?utf-8?B?OThNMjlhR2NZK2VQUVYwSGFwMzh0UlJsSDZOVnVnZ1FKdUhDZ2RHQlY4b0pF?=
 =?utf-8?B?Z3R0RlN2OFRFdUNQS1NOR0paMEN1VXlNejl2M041OVY3QkNSYmhqSlcycjMz?=
 =?utf-8?B?VkFIRGFlQW9nVTcwd3ZCbnl6eWlrekNWbHBHK1VhdSt6U1dRWkVNYUdvU1Qw?=
 =?utf-8?B?WHUzY0wxOTUwR0t6bHRZSVh5eGN1aTVkOWUzd3MrREFSQVZPL29VQ2U2RTdy?=
 =?utf-8?B?VG5yK0VzM1JvdkNsb2FmNkJHTHpyM2JNMXdZZnhWRzJ5YTgyS2ExVXhxYzBw?=
 =?utf-8?B?TlFBaGpRL1Q1cERDREVxN3RUcjBPMmpMWHp5dVFoMHV5eDJkU3lyeS9XTEc0?=
 =?utf-8?B?NXBDMzZqM3ZDblNuYk9aSGIzK215VTRLTGxtdkR2M1lqWUR6MWFYNEVMcUtR?=
 =?utf-8?B?VEdUaXM0RStBQktZTWt6ai81bjd1OFA0RUFJS2xtNWFBc0ljNTJhVUdMSTRp?=
 =?utf-8?B?OTJHN2ZjZmJySXh0RkZqMGM5c1FuUWl0VUxpaUhweHl0SUVueXdPa2tsN3pq?=
 =?utf-8?B?TE1yeWVUQWlPOE9FR2NoOFlVQnNtZTJqeWlMZjhFOHdEWGM0SDUvRzRPdEZl?=
 =?utf-8?B?cDhjK3hjMEY5OGxBUXQxdStRUkRzWTVWczFnbDVtUjFvOCtpT3hPcW8wbzJM?=
 =?utf-8?B?WmFmdS82N2ZrY1lENnJNTThMcFFSSlM4VzlQN0dGNHpSWEQ1djA4cXhJd0Ru?=
 =?utf-8?B?YXR4TVZ3cmR4VndRUnYvM2srMWJWVHZYRHVhSzJIRERBL1Z3cnpXa2pqSGFk?=
 =?utf-8?B?OGNnSGxMYXduT3JYRWlRYVYyTnVCQzFWNUM2K2locWhpV2hRT29YZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51785859-ad33-407c-71f2-08de627f59b4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 17:20:24.3055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uts1EK21wPdns7uXA81IAgH7veyslF2BRzMftj9hQpFQgX592zmubhQHu9QJo2ZPOsaliUPOy0+uv6iQ2ykwTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9505
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


On 02-02-2026 22:42, Belgaumkar, Vinay wrote:
>
> On 2/1/2026 10:38 PM, Nilawar, Badal wrote:
>>
>> On 30-01-2026 23:04, Belgaumkar, Vinay wrote:
>>>
>>> On 1/30/2026 7:20 AM, Nilawar, Badal wrote:
>>>>
>>>> On 16-01-2026 04:10, Vinay Belgaumkar wrote:
>>>>> Dump forcewake status and ref counts for all domains as part
>>>>> of this debugfs. This is the sample output from gt1-
>>>>>
>>>>> $ cat /sys/kernel/debug/dri//0/gt1/powergate_info
>>>>> Media Power Gating Enabled: yes
>>>>> Media Slice0 Power Gate Status: down
>>>>> GSC Power Gate Status: down
>>>>> GT.ref_count=0, GT.forcewake=0x10000
>>>>> VDBox0.ref_count=0, VDBox0.forcewake=0x10000
>>>>> VEBox0.ref_count=0, VEBox0.forcewake=0x10000
>>>>> GSC.ref_count=0, GSC.forcewake=0x10000
>>>>>
>>>>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_force_wake.c | 46 
>>>>> ++++++++++++++++++++++++++----
>>>>>   drivers/gpu/drm/xe/xe_force_wake.h | 11 +++++++
>>>>>   drivers/gpu/drm/xe/xe_gt_idle.c    | 20 +++++++++++++
>>>>>   3 files changed, 71 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c 
>>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> index 76e054f314ee..197e2197bd0a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> @@ -148,12 +148,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>>       return __domain_wait(gt, domain, false);
>>>>>   }
>>>>>   -#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>>>>> -    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>>>>> -        for_each_if((domain__ = ((fw__)->domains + \
>>>>> -                     (ffs(tmp__) - 1))) && \
>>>>> -                     domain__->reg_ctl.addr)
>>>>> -
>>>>>   /**
>>>>>    * xe_force_wake_get() : Increase the domain refcount
>>>>>    * @fw: struct xe_force_wake
>>>>> @@ -266,3 +260,43 @@ void xe_force_wake_put(struct xe_force_wake 
>>>>> *fw, unsigned int fw_ref)
>>>>>       xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to 
>>>>> acknowledge sleep request\n",
>>>>>              str_plural(hweight_long(ack_fail)), ack_fail);
>>>>>   }
>>>>> +
>>>>> +const char *xe_force_wake_domain_to_str(enum 
>>>>> xe_force_wake_domain_id id)
>>>>> +{
>>>>> +    switch (id) {
>>>>> +    case XE_FW_DOMAIN_ID_GT:
>>>>> +        return "GT";
>>>>> +    case XE_FW_DOMAIN_ID_RENDER:
>>>>> +        return "Render";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA:
>>>>> +        return "Media";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX0:
>>>>> +        return "VDBox0";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX1:
>>>>> +        return "VDBox1";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX2:
>>>>> +        return "VDBox2";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX3:
>>>>> +        return "VDBox3";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX4:
>>>>> +        return "VDBox4";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX5:
>>>>> +        return "VDBox5";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX6:
>>>>> +        return "VDBox6";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX7:
>>>>> +        return "VDBox7";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX0:
>>>>> +        return "VEBox0";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX1:
>>>>> +        return "VEBox1";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX2:
>>>>> +        return "VEBox2";
>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX3:
>>>>> +        return "VEBox3";
>>>>> +    case XE_FW_DOMAIN_ID_GSC:
>>>>> +        return "GSC";
>>>>
>>>> How about creating static look up table.
>>>>
>>>>     static const char * const domain_names[] = {
>>>>         [XE_FW_DOMAIN_ID_GT] = "GT",
>>>>         [XE_FW_DOMAIN_ID_RENDER] = "Render",
>>>>         [XE_FW_DOMAIN_ID_MEDIA] = "Media",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX0] = "VDBox0",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX1] = "VDBox1",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX2] = "VDBox2",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX3] = "VDBox3",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX4] = "VDBox4",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX5] = "VDBox5",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX6] = "VDBox6",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX7] = "VDBox7",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX0] = "VEBox0",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX1] = "VEBox1",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX2] = "VEBox2",
>>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX3] = "VEBox3",
>>>>         [XE_FW_DOMAIN_ID_GSC] = "GSC",
>>>>     };
>>>>
>>>>     if (id < ARRAY_SIZE(domain_names) && domain_names[id])
>>>>         return domain_names[id];
>>>
>>> I was trying to make it a little more dynamic where, if something 
>>> changes in the FW table, we don't need to update 2 locations.
>>
>> Ok, but even with a switch-case statement, you’d still need to update 
>> it whenever a new enum value is added.
>> So, updates in two places can’t be completely avoided.
>
> True. Similar thing was needed in sriov and guc code, and switch/case 
> was used there. So, just following the same method to keep it uniform 
> might be better? I believe i915 used the array definition method.

In xe also its used in boot survivability, late binding and sriov etc. 
But fine lets keep the switch case method.

Thanks,
Badal

>
> Thanks,
>
> Vinay.
>
>>
>>>
>>> Thanks,
>>>
>>> Vinay.
>>>
>>>>
>>>> Thanks,
>>>> Badal
>>>>
>>>>> +    default:
>>>>> +        return "Unknown";
>>>>> +    }
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h 
>>>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> index 1e2198f6a007..f7690cb34ef7 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>> @@ -19,6 +19,17 @@ unsigned int __must_check 
>>>>> xe_force_wake_get(struct xe_force_wake *fw,
>>>>>                           enum xe_force_wake_domains domains);
>>>>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int 
>>>>> fw_ref);
>>>>>   +const char *xe_force_wake_domain_to_str(enum 
>>>>> xe_force_wake_domain_id id);
>>>>> +
>>>>> +#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>>>>> +    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>>>>> +        for_each_if((domain__ = ((fw__)->domains + \
>>>>> +                     (ffs(tmp__) - 1))) && \
>>>>> +                     domain__->reg_ctl.addr)
>>>>> +
>>>>> +#define for_each_fw_domain(domain__, fw__, tmp__) \
>>>>> +    for_each_fw_domain_masked(domain__, 
>>>>> fw__->initialized_domains, fw__, tmp__)
>>>>> +
>>>>>   static inline int
>>>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>>>>             enum xe_force_wake_domains domain)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> index 52436dcb6381..8e36202f1a4f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>> @@ -169,6 +169,24 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, 
>>>>> gtidle->powergate_enable);
>>>>>   }
>>>>>   +static void force_wake_domains_show(struct xe_gt *gt, struct 
>>>>> drm_printer *p)
>>>>> +{
>>>>> +    struct xe_force_wake_domain *domain;
>>>>> +    struct xe_force_wake *fw = gt_to_fw(gt);
>>>>> +    unsigned int tmp;
>>>>> +    unsigned long flags;
>>>>> +
>>>>> +    spin_lock_irqsave(&fw->lock, flags);
>>>>> +    for_each_fw_domain(domain, fw, tmp) {
>>>>> +        drm_printf(p, "%s.ref_count=%u, %s.fwake=0x%x\n",
>>>>> + xe_force_wake_domain_to_str(domain->id),
>>>>> +                   READ_ONCE(domain->ref),
>>>>> + xe_force_wake_domain_to_str(domain->id),
>>>>> +                   xe_mmio_read32(&gt->mmio, domain->reg_ctl));
>>>>> +    }
>>>>> +    spin_unlock_irqrestore(&fw->lock, flags);
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * xe_gt_idle_pg_print - Xe powergating info
>>>>>    * @gt: GT object
>>>>> @@ -260,6 +278,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, 
>>>>> struct drm_printer *p)
>>>>>                  str_up_down(pg_status & GSC_AWAKE_STATUS));
>>>>>       }
>>>>>   +    force_wake_domains_show(gt, p);
>>>>> +
>>>>>       return 0;
>>>>>   }
