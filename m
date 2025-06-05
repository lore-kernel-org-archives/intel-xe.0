Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21976C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 05:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248C10E7A6;
	Thu,  5 Jun 2025 05:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiOTU4ct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBB410E7A6
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 05:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749102576; x=1780638576;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d41UV1GYWAlLlJbuWWlcUTIyNddGIA2VBD9Nd85Mm+E=;
 b=WiOTU4cttvBw1CyVLk3JNZADtaFHDo5q7KHX9lxQeBRiEH1Eg2USgiQZ
 aIYYXetk3q7FLQ6lzBwXpLMz1RHgkdMmqSlVJM7jBOMmGvEcuHNXrq6NK
 05gj70yxKMhWkgpG0Nm0tx43uJe/HmVdcvaoyro+KFJw99rtdq/kiAZfT
 61p027quo0yGWx7mNZJuI5jt9qI7RKa8UXrWmMruj8vhYU4V5Xga+8z8O
 IYW7fV6Qpp9xASdl8N07IdsmsZCm40KWlsq9Jl9ufRTb4Cy913maDrDQi
 DPNysZ2+VfHCAYxPvDAMGNj4EjBH0Qv/y9pevcSJWTPQr8f/WMQwCIk0I A==;
X-CSE-ConnectionGUID: fJDdAFzoRQmcmRBO+vvH+Q==
X-CSE-MsgGUID: 7XEHgzfASA6ZEGrY27qRMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54997008"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="54997008"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 22:49:36 -0700
X-CSE-ConnectionGUID: TykWy3JZTT2nPcNp/v/esg==
X-CSE-MsgGUID: Q38CR7ElRSChtu2spCWdhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="182607651"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 22:49:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 22:49:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 22:49:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 22:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoEHoX3WEkaXv6/WTqCwNEAgD8LwDkLMPLDX4ogJC3V7SU/IwPLtifI5xKLPRx003GmNuLRTx3aRSPplzf31UyfS7D48Xlk1U4lkg9vmQ5dW2o4xBe5sGBxgj+xzO0nV84Tyd9Lpwgbz7I+tnoAh1cQ96838LopdXXxLU7w99RvKq9akJU/PbhEAsiQ92RKbe6hSgtq9TiLub9VtI2T3DIZq8qLGaChhsFCABcgkgtSYsNZzgs1crk8wx3VNfTtfSKu+hiPp36pFtdUQIIdMTwR8+ZOuHVJHAoPM2oJaVnZ1Clbp+YRQ51WFzirA7em8UYov/UilxZ9rpEO8jcuEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQXDKHK8+pl7YNtJJwIqYpIdFTLOII8VfQS8SAriAds=;
 b=rWLxGFk9qVEZx1IpE1/v5vrrasZCu+EjCrf6jYH78/oV6+0Z3NweqbPFOG94V49mYC4dxY+x7plHi+lyCsDrRUQtjKOaTdVJQypO1/xoRSlyuW792C55fWDKIfKhVTGnclh9+qUD5bOIVeXPna4t7pxRzRcMtq2ukxu4bcRPQScu5wrqom9sbp51w9NK3Rtzl4XzlVyZ7hB0UnLE/SjI9InhY2McHhWZ9dvwCQmYYg3du+v92vwUlILbUUGWHjp7vWd/vk3yqFSEVJhmcYvvM6utEkmNYRUB63x5TRffonoDW43l5DXMgqESUpPAw0thAxjnUhYGwsk2OyZ1rGGHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 05:49:33 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%4]) with mapi id 15.20.8769.029; Thu, 5 Jun 2025
 05:49:33 +0000
Message-ID: <d0f5842c-95e1-488d-8732-20384e80968e@intel.com>
Date: Thu, 5 Jun 2025 11:19:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/xe/xe3: Add support for media IP version 30.02
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
 <20250603182430.1016734-4-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20250603182430.1016734-4-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 501b6ec9-31ba-4b6b-ca28-08dda3f4bf52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHgrRnhCZGFVVHVTdlFJREpSSXFlQ1hDbGpCSjdrQ1ovTjlJbEF3ajdiNHRB?=
 =?utf-8?B?KzlJWGkzK1c0b2pwTnFVZXQvWWc1aTBvcUZUTkVkRDVJRFowRlBRRHl4UlAr?=
 =?utf-8?B?T25XSjBWdmdVR003K3JuUUhDZk1IOFQvd1pKT3I4a2g4L0lVcHpOWDRCV3Mr?=
 =?utf-8?B?aHVWb1M2OWFWdXM5UzcrRXhwMVpDMFhpZGxnVWdwTHpUUmVQV3ZkZ0RiOWRt?=
 =?utf-8?B?elFqOTNXd3NRQWZVbzVyeGtobEx1cWNuZFVOR0ptY3FhSkREMUo3ZDZFNWJL?=
 =?utf-8?B?d3hhQUtHNzJrUHU5Mi9Vc2pHVXlHa0JoMGJVODNSU0Y4aTBvSW5meXhCc25q?=
 =?utf-8?B?RG15Y1Y2MDl4QzhRTmFTSDFWQ3J2ZFRBUHpEMzdES09lQ2ZCbE5TMGVQQjN2?=
 =?utf-8?B?V0Yyc0FFcXUwTEt2cDV2dXhoamt3ZDRWazFkK1BXZHVyb0RvaGltQkJScEVR?=
 =?utf-8?B?eVZFUjNmd1N1WnJjbHVubkowdFdoNmxVUzN3VlRXZFlUSFVVOUd0VHB5YW9a?=
 =?utf-8?B?YUJRNnlmdzBsc2RRb0hEU1BadWtYeWFCdXcyb2Y1TyttUmhwQTdqWDBDOHNR?=
 =?utf-8?B?VDFIN24veUJiNXBWZG8wVmRWSU5LNlU1RTAyU25QWElHbDdVSExoT1Q0K214?=
 =?utf-8?B?aGNCV2V0WS92dWVIcXF2QW5XL0VzMEpTWXAvMFE2d3JqekdVYW13TnNUa1NT?=
 =?utf-8?B?a0l2WURnODhrSDhpUFBxUzJsNW9HZ2lTUlQ5Nm80M3ZvNWgvOUhJWHRlYmtr?=
 =?utf-8?B?dXlLT3JzSW1XanpqWVVMSUdOVEVieFBRRk9xc1FaS05LSjVkNG1IYTQ1c1Z4?=
 =?utf-8?B?TVRuTHNwaW5Vb2RwQzRrWG8vYy9lelAwMkJFQ3I3SVNDc25rdjBpbE04Z3lV?=
 =?utf-8?B?TWtJeGJuSU9HZVBNSVZra3FKNmM1emFLallMTkNLc0hkQTBwWnkyS1N4cUxY?=
 =?utf-8?B?eVlyc2ZWVEROS0JieG04NE84c3JGV2JqbkYyNlhuOENuY1VPTi8rczRrWjVq?=
 =?utf-8?B?a2R3N0IzdWdQUGJvMkhrS0UzZWl4NG4yTVc0QmxZVlRDdFJ3ODl0SDlEalRG?=
 =?utf-8?B?UThISTZIRE5Db2JMRHA4NXVWR1hGc0ZSK2t0dVRwK1l2YjZDU0xjaU9tRTRl?=
 =?utf-8?B?NFJlNGFPMFQ5cUR6K05sVWxOTDJFaDlrZVN4bFlDMUZRaGdLTmtDTXkwUVhV?=
 =?utf-8?B?amlzelFtREo3MEJFZzJxd0x6SlVzTjl5VmQ3ZGxuM09IYTFra2xBR2tNb3ZP?=
 =?utf-8?B?ck9ERVNFUnB2bjJ4UFVuczhPb2x4eW9obzcvblFaeEwzcDF4NU9jUUllTS9o?=
 =?utf-8?B?d0lrbjZJSzJhaXR0b1JZaE9CYmpRQkdrYjVLL2NuRUdxMUVKZ1dhMXhlRXdJ?=
 =?utf-8?B?UVEweE5taGd6SzhweW9Cbkd5dkJyaFdqNysrWXZLUllteFkyaXZFdVA1Wm50?=
 =?utf-8?B?NkRReWNGRUlzMnJkL1dLY1BtQ0hrRTVtdk9MMFBYK2FmWTE4RFIrSkZKTXA5?=
 =?utf-8?B?eGxuaFUvNFJTSmJOZzNaTTNuTmRJQjBOVmxLVzMxdXlWR1VqUDJmTXR4R2dI?=
 =?utf-8?B?ZGc4dmdLZHFuSTU5TFRDSUFDTTltdmU1M0FiTXg0b0lXUlJobUJHN2RXZTdE?=
 =?utf-8?B?ZWhIVjIxWWhzWXQxd1pkTi9rTU5zcHVUUXZpVWl4WG8wa3ErOTBPcHFlMGUy?=
 =?utf-8?B?eWI0NjBZQVZiU1BISGRZWGV3QWNaT282VVdqKzRMbnVyRGVOZjZoRVJzNC8w?=
 =?utf-8?B?b05pL2F0R2ZOS0Q1c2VSOWlvN0h2QVRTdkhzcGlwRWFWc1kxVVVFTjMyS0V2?=
 =?utf-8?B?QnJWL1FkMWdTcDV5V2RZemkzTFhSaVMySnUvSUVyR2VKVGVTaFN4MW1xT0Vj?=
 =?utf-8?B?RWcwR2MrbFhMNTA2L0lxakhGVXlwZzE5bjBGVGVvT0FhelV1M2pDN0gyRVY0?=
 =?utf-8?Q?QrUjOcN7O5Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitHcHZNMXVXaGpvaGxwLzBndzNQL1dqQWtSQ2Qwcm0vdDBYbUkyeWFIYXI4?=
 =?utf-8?B?TUd2dXVUY1g2RklDV0o3eDBYVllzMVZqbXRON0lVMk9NV0hKbWhEbE4xT1hN?=
 =?utf-8?B?US93aEYvSFNkc0lZbXY4TEExZDl3RlhIWHo0Z2MzZzlGVkE5MG1sMUNTbXZN?=
 =?utf-8?B?Q3pHTTJxOVJNR1o2WHRGVWQ3UHpTOUllUXBSQjRiaTNCTFBPVWo2SGx5bGdX?=
 =?utf-8?B?b0lKTndtRERTYk1lZmFnNjVGMVBxNGxKUTJCc2VHYUdYQ0pKNzA0THcreUlZ?=
 =?utf-8?B?RTZ1YThacVNnL1RKRXBmaTFNOTdFRFRSMEUxanFQYjl3RXY1bjQ0ZU5TWkZQ?=
 =?utf-8?B?Zy9RQk1aZnU5ZFZKUzJ2U3ZVUFhmRGlraEpyY2dPU1U5ZGRMaXFiNW1lZjVF?=
 =?utf-8?B?WW00WnlSZFQ0VkZNZnVkZHJCR2xiMWhVclRjNE1YSDlBeXI2RFh1S2lLS3BL?=
 =?utf-8?B?amtvTzJYNEx4RTRDMTVNTzBEdkU3NmtEL0VnN055Y3kybGdqcWFsdXQvT2dM?=
 =?utf-8?B?SUlqazU4OGlHeTZlQjNmMlFNL1dXSi8xYjZ2MnlsUjdJSU91OHN3a3k0ZUZV?=
 =?utf-8?B?aHNPUnFtWFNmL0Y0MGVhTmhuWVN0czFxNzg1OHl0ZmlLdTdleUtPMTBLMVRy?=
 =?utf-8?B?UzdEcDY2L1RMUXNGTW1pc2x6dUMrUndXdWVVVTJMOG13eGI5ZGZ0Tk5WSlBI?=
 =?utf-8?B?R0E3UURQVG1RNGlaeXk3RnpqOTBGNS93V0JiSkUrVUJoTEw2VG9JRi9LdXVz?=
 =?utf-8?B?eFFEVUVmUERyTEN0Ni9qS1F0NEhWQWJuM3NRcE4yR2Z4TEowVkpyVkJYdi9V?=
 =?utf-8?B?dTF0aHp4THdHR0FjSW4zeXJmMHlGSXVreWt6NWlGbmh2ZDVzZFBWc2ZCMldQ?=
 =?utf-8?B?SUpHK29CQ3U2L1R4Qk1lUzFET3J6QjFsWmxpZ2lvWXFxVVlmekYzQWVKU0t4?=
 =?utf-8?B?VjZ6eE1UMHh0RlorTytMUVNBZTRyc0J5VG1vbDZWeWJGMVlIUDNHTUdrTzRl?=
 =?utf-8?B?eUV3dlg0dWtFSDJtRERmdnh3anVzdEFVQ09Yak1vYkpYTG1ZOFZKZXVEWUlW?=
 =?utf-8?B?akhOQUc5R29aRk15aGQ3Y1B4TTJsL2tCNFFBUjkvdjJ3WFg0bmoyL3ZiRGVT?=
 =?utf-8?B?OG5aQVZkN2o5MmhPL241YUZJOWNTVXhxR3ZxOEhrOStzenVRT0diY1E2S3hq?=
 =?utf-8?B?Q2xlZjR5WmJ6WUpnbFhhNlNsYkY1NEtEV3ZTOEVqbXB0QXZHUmU1akphWTI1?=
 =?utf-8?B?ZmdvWUthVU9PUUs1ZTkrUWZzQ1VHYU1CK0FEM0VKS2RTWXVDYkdFMFprenpi?=
 =?utf-8?B?eXE4VkhLY2NmV2ZrM3BqZDFPVG5oODVBNC9MVUJ2VEw4ZUhhNnVOaENWVUE2?=
 =?utf-8?B?Mm1iNjNIQmRIZit0UDByTmovTUxua0hlVTB4SzVaazdUMFA2NlJ3NW9BUFlV?=
 =?utf-8?B?MFc2SHA2MXZ6Z0dyODV3aEdwNUVVLzZoWjVQcVRaQzQyN0tONE9XWEM0MVhR?=
 =?utf-8?B?ZEpWT0ZaeGY1YnhsWkp6blBObmwyVnpVell6cWUvQXowaThDM3VRMFpTQVMw?=
 =?utf-8?B?WXhBbzU4S2xJbHNOVmc0a2tPZUdkcG5MN0YwUU5RL3ZaMTIwQmpLRUx1V1Vr?=
 =?utf-8?B?YThhUVpEbm53RjB2L2tjdVpTVmRDTmJPVi92akdiZXJDZHUrM2ZSK1phQXBl?=
 =?utf-8?B?cE9peXQxdnd5Y2poZVBrOE90bUxON0VRV2IyZ2MyeHU4WDloN2FuZ1pLK1Bi?=
 =?utf-8?B?emU2UnN1bzRVS3pCMWV0dUpLNDJ1UThjRnp4WHZ6cEFYWFhuajJKUDBWRGlV?=
 =?utf-8?B?a254d09KdjFDOEZGdklOYmxHazl0S2RCRk9sMWlZVzEyRHJKc3piUUpiODJ6?=
 =?utf-8?B?RHVCQUIydXVod0ZXaXJ1Q0FNYVJhdFZvRStRRnZ0ZFpicmkycmhpMEl4UHFk?=
 =?utf-8?B?akZDMVh2M3VWU3RtZGxya0F1RlRyNTFrV3Q4d0FLS1lMdE9UMjNQQ1FFc3ZP?=
 =?utf-8?B?Y1Y4L203dmVWQ1NOUzBaWVRlSUgwSHpTQnRtbWZRT0ZxUDhCUnExN2lHTkdO?=
 =?utf-8?B?QjA3Z0RKaTdJRE9YM0JSRVgrSGcwbGpUMHpxN3VmUGdRbzQxcGJ6YnV4TkJ2?=
 =?utf-8?B?c0lpcnpLL1M0aFFIbkVwV0FVREVZRVVQNldwbi9UUTR4Y1JKdEZCdWUrTXFQ?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 501b6ec9-31ba-4b6b-ca28-08dda3f4bf52
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:49:33.6720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5hI4Uh1QgTacx/C5hy8kXfORUamBcTuKnx7Jr+Kw7gtukQItuV+CbtbesSxEfWf4r+nzdmj9JbmUcQCUHQTHQIFAx3f8XD/Y7tzuhv/U4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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


On 6/3/2025 23:54, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
>
> Media version 30.02 should be treated the same as other Xe3 IP, but
> will have a slightly different set of workarounds.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c        |  1 +
>   drivers/gpu/drm/xe/xe_wa.c         | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  3 ++-
>   3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 247cd928b933..7b84afe873f7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -195,6 +195,7 @@ static const struct xe_ip media_ips[] = {
>   	{ 1301, "Xe2_HPM", &media_xelpmp },
>   	{ 2000, "Xe2_LPM", &media_xelpmp },
>   	{ 3000, "Xe3_LPM", &media_xelpmp },
> +	{ 3002, "Xe3_LPM", &media_xelpmp },
>   };
>   
>   static const struct xe_device_desc tgl_desc = {
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c

Similar feedback to what I've provided for the Graphics GMD-ID patch.

-shekhar

> index 5f750054a9c4..7ff79abe23e7 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -285,6 +285,18 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>   	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>   	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>   	},
> +	{ XE_RTP_NAME("16021865536"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3002),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3002),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
>   	{ XE_RTP_NAME("14021486841"),
>   	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
>   		       ENGINE_CLASS(VIDEO_DECODE)),
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 557d23c1bb9f..e46b4975ebef 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -59,6 +59,7 @@ no_media_l3	MEDIA_VERSION(3000)
>   		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>   16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>   		MEDIA_VERSION_RANGE(1301, 3000)
> +		MEDIA_VERSION(3002)
>   		GRAPHICS_VERSION(3003)
>   16026508708	GRAPHICS_VERSION_RANGE(1200, 3003)
> -		MEDIA_VERSION_RANGE(1300, 3000)
> +		MEDIA_VERSION_RANGE(1300, 3002)
