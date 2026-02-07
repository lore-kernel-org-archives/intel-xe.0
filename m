Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692B7EE0AE8
	for <intel-xe@archiver.kernel.org>; Sat,  7 Feb 2026 22:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1593C10E155;
	Sat,  7 Feb 2026 22:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h54fx2yq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A2910E155
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Feb 2026 22:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770501916; x=1802037916;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2dTBk9mXrflXwQqaOPMLOH61iK8qeNRax3u5ehgQQR8=;
 b=h54fx2yqCoJe5N0MTedKYLnAhx7ERfZvwK0Y6rjuUA+LOVWgUYqQ92ci
 DlyxVjDvv1hwIa2UNEDdPc7c2s4N3FtLm4vV321MSAykWXDn83geSvc6L
 k729X5N5+gv08+YSFmmRAkh2vwSOEIkfWV3eqjmjS/c7HLl9/wtMIMQYF
 0MpM1Mn/ttYfJRhEdjVlqCY9tEVqsGiDRaWJbWKEe3bfC6PIThbUa48y8
 cAXWFFAcLf2m33BnnjxMUPVXy0yC/ioasQ5cka73V80elM6G9GJuNTEQh
 l/pJRpXZ8Aqy5SxGK9/yLXGe2eH06BkZ1qVCW0QzFzIPlYuNufF39iNE+ g==;
X-CSE-ConnectionGUID: KIpdz70kR/iETwjTNf42EQ==
X-CSE-MsgGUID: fHs9PFJmQti/mEJpTmAaAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="83041225"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="83041225"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2026 14:05:16 -0800
X-CSE-ConnectionGUID: ubicAXiGR9qAVahFUhd8pQ==
X-CSE-MsgGUID: eRYgOCm8R+29apSHMxJaQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="211015975"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2026 14:05:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 7 Feb 2026 14:05:15 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sat, 7 Feb 2026 14:05:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 7 Feb 2026 14:05:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNZZW8Rl+eKMPYo+ZwEpSZUH7o/hEJkWE2P7l/UF7x0ybkYGHlt4H+um5Let6HcAcqbh5vzpThXst8Ue9VrHlkJ0WagpLS9YggxJSuMFl5ysbdNuCyfRlM/DV/7E43Hji/OhFhnUi32GS/OvlXtTOH0xYJbJjfRcHx+Odr8BaOr32PSbcXEj8XNbvTzoLTcLWWF+RVcJuor+juNmLQ8kqfXQUm61CnUOfBtEU3WkOiDlrOhQ2hBIVHBh6o5SBN0Q0UMUhNb04qVLewUZ9SOo6itLzBNXj7L6BWXRccbmVny3O1YISciixFnUqo26Os6piL/ykns8tnrrrZi3rVUGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fx4vXQrQzfGhmRp1iC7kR+oIFa5SAwA46m6FmGQw2X8=;
 b=be5F9UnfpUhhRaRKzayuvkXn5Lc1XEIewy6ka5SJEcaRWpa9v4uy/rYb9FDvvPGGYSdCUbWxD+B9R8XW3CVD9exYlgSyFetdPutbChqYJkU83P9lXQi15aDxGXryMh/XO5t3YKRoTSjxAOGudR5W+3FKXFrjIIpn/NW1lo9ESUb7Uw7shEqkk0xKD+qiJaElh7/s22DEZZjkQQsbrUTANbnZnozF1EmKnpbVkLDjXdj7+52HVVQ/QP2BaVcY/PBfBrb5k+Wg00aU5XccOmLgl9UOYjP0rZ5+IWS9wL0BUaPjjY4x7iEYA9o3du5/dGki0SthaXZZJkBqJTE1Tr34hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.17; Sat, 7 Feb 2026 22:05:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9587.013; Sat, 7 Feb 2026
 22:05:13 +0000
Message-ID: <819f042c-cbdf-4e09-a26c-ffd1a9046529@intel.com>
Date: Sat, 7 Feb 2026 23:05:06 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZS93YTog?=
 =?UTF-8?Q?Steer_RMW_of_MCR_registers_while_building_default_LRC?=
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260206223058.387014-2-matthew.d.roper@intel.com>
 <177041971619.235359.15714116294103961937@a3b018990fe9>
 <20260206235738.GD458797@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260206235738.GD458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0302.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6d3d12-0852-4e17-37ac-08de6694f7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0lKdENhRzR3RjRUY09zWG5ZZFI5V3hWMWRaV2MzR0ZKRjQ0Wld1b0FEOFhD?=
 =?utf-8?B?TFVVTktnc2hNTkhsWDlxcHk4M2tRNGU4Y3NDMDBxQVJ6STZha0E1YTh1NklB?=
 =?utf-8?B?SUpkeFphaDFGd01Rb2RBNkpERjVIbjlqSHdVSCsvVG9KODhCUFZKV2hYOWhK?=
 =?utf-8?B?TFNQZlNlZHI2bkF2SVhwSENSVjVJOTc0TnVlc2RvSkVJa2RmU0IwOFlPMzVk?=
 =?utf-8?B?SitCL2ZqYVBOdnJ4YW1ML0dBL2J4Wkd2ZTlaU2x5czAxZjcyNlBDeUd1bXhV?=
 =?utf-8?B?aWp4Mkg0S0k1bFBKek4yd3lCQnUxbDR6MzdXR1BoS1hkYW9mdWJPQmVMRlho?=
 =?utf-8?B?L09lNUVyVm8xcXpKNlZ0S2NjOUpjd2s3NjdlR05UdWZXSlVjUTZBMDEwR1Bv?=
 =?utf-8?B?ditIbEpLczBSMXoySGNlVlRta0hmS095VUNIdEJPK3ZMUUhSOUprQk5DeDNB?=
 =?utf-8?B?Mkw0RXFJNmE0QnBxMWZxckFicmh2YzRRRDd2WFl6S0VlcTNNaXhRUUdsVkMr?=
 =?utf-8?B?cEpubzNHdnlHRHlWQVNhc3dzbEg2RnhEY3RtTmFsdkRMRUtINWpjNUNkSDYy?=
 =?utf-8?B?WGU4QTV2YjAzbHpNQ1BjRk4vOFdGRDU5OVNlcVc1eWJOdFBDNmZQdmk1V1hm?=
 =?utf-8?B?T2lFK3JPdnNpRGFudmpBNzR3dUtjSlZLZ2hhL3NiWkRuVFZzcXFUNVhRSTIx?=
 =?utf-8?B?aEhiYStuQzhTUUZxY0NUbDZVdktic0xGNXpoQVE5RTFHdjIvVlcyUFJYYm5Q?=
 =?utf-8?B?Ym5hYTdQbGp2cHZjWGV2UW1jSWs3azBnOTBmWFl3amg0aDBRM0VGd3U5c2E4?=
 =?utf-8?B?Zjk5YVJZU3VwSjRYUmFrRUhKc1hTMmZEWmxJbmUxU2dseUdwaWh6TUczTDQz?=
 =?utf-8?B?eUdCbHZSRXFEV3ZEZDF5alNlUzArY0orL2dJMEdqRSs5YjFXMVZ2SWpKVVJy?=
 =?utf-8?B?MnVWOEo0RHllTDZieXZYU2tVVDdCRHZZZkVDaGM2aDdsWnhaR1crMjFWVjZu?=
 =?utf-8?B?NWNya2swN1lYdkFncndXWXh3S0FJRXk4MElCSHo5VGgvQU95M3JvMFlHV3lV?=
 =?utf-8?B?TkNzQWhaODlURytkdGNaTHBCZ3lVWUhqMDRIVmVJMFZzNTdtVGJZSXBFVWZl?=
 =?utf-8?B?WUpxeDFxNTBOd09IZG9FbStrM0JpZGF5M0RJTE1mbTVwN1RDOWV3RHlHQ2ln?=
 =?utf-8?B?a09GS1dxU3kvVm5YNWllSzlBNGtlSk80Mng0dG1uai9MbVdiWkZKV1pvNlNC?=
 =?utf-8?B?TzJqM2FnZnhtNlMzaXBsZlRENWZNem5jeHhLcFgzZy9uRDloMEpFNG9OWU04?=
 =?utf-8?B?UzlCQWJMWkRJTFFKRmFnOW1XSUlKbi9aMzdUTmxGOCtqWkdaWkU2Z0w1ay9v?=
 =?utf-8?B?ODJweWtYN2ZFTmVIKzlFMzU0MkxldkRqU3g2V3JSMGQyV2VsYnFBdkthT0lF?=
 =?utf-8?B?U29RUUE5aXUxQ2UvUStmWDdpU3Fha09RWlRzNHpyRW43eXd1T09jYnY4dG5o?=
 =?utf-8?B?MUxpZU0xZG9QR0hTcXdDZGY0VDRBTVFhUVZYT1kwVHNsT0VGQjkxaEhzS1V6?=
 =?utf-8?B?S2NRcGQxcjVRRXhiSEREbjlLSlErekphTjdFclpiZXdnTVpJeVVZS2x1T3ZJ?=
 =?utf-8?B?cUJUYldhYTdoUUwvYThSZ2lPRGovYlorVWFOeHltMDg0MW92Q2tTWXdkV2hO?=
 =?utf-8?B?Zi9yV3dmd3lTZTVOTzdhMmJsQXNMVUFxUmxsdk9zQW16Rk11bnlCYVBzR09F?=
 =?utf-8?B?MWR6ek9OVTVJNG5rcjhQYTVua0tYbnJUaXhHU0dBdXhZUnB2QzVqSmhuT0Iz?=
 =?utf-8?B?eUh5dC9kRUUxOUtIbmtRUytaUzFDVlJiTjV3Q0w1SUN3eWpUT3VuTmw1aDFo?=
 =?utf-8?B?alhyVEJTZnBsTHhuZ2NLVHQ1VlJrZytpaktwUFpKN1JwMitzaERWZlZZakh0?=
 =?utf-8?B?Vk5nbVB0YjRIOHpFZS9XV0IzdlpEMEtIOE8xSXYxU1JzbElIeENFMFozbFVh?=
 =?utf-8?B?R0toRGlZdXhhVG8xYnZEbmsxYUpoMy9SYXNHcHJiRUxSTmtTZ1VjZ3kwWisx?=
 =?utf-8?Q?ZLqiOc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFluNk5ENU4vcDRwM1hNNWRMOWdWekg1bjNjYm5IL3p5dDduOUg5YzdCbVJH?=
 =?utf-8?B?NHUxUTY0NXBtemxZKzhUMjF5V0NsM05MMlEyY3hseXJlTzBHMEptRVArRG1F?=
 =?utf-8?B?RXZEZ3B5amN6YVVxVG9nYTI3WjVFanFuRFh1ZHo2TWt6NkI0RkhZRmJsSUwr?=
 =?utf-8?B?a1FsOHBCajNtaXVURmhoQXFNTjdUbmpDZ2I4QUZ6djFWL21yR1g5VzBBbG42?=
 =?utf-8?B?aHVWTy80b2pYZi9yMVZvTWxPOU96RWlnNFBWRFQrdDlhbXAxb3F4M3NIWFJL?=
 =?utf-8?B?b1h3bmRSQzlySjJiT0ZVeG9LZXhWL0V1K3ZodVpCMzFIT1VsSkJzUmFlK2Zi?=
 =?utf-8?B?elpkaUNMMGlYSEs3dEw2SDZXM0o2WTBld2gyZHJsQytvZ1kxbDdMWm9LZ3Bv?=
 =?utf-8?B?N2dTcHJvNFhKRWh4dElwOTRuQ01NLzNPcWxFQzhuMm96WlZpMHB6RVRidlZZ?=
 =?utf-8?B?MjdoQnErSHZSQXJaY1RtS2dUWUhzQVFmdFhwVzB2a2tPc0l5Z25SVmFJTzd4?=
 =?utf-8?B?ZFBHVlhocEhjaWg5WnlCNXFCOFgva2gzWFZvUXdWdW95T2lhRWMrREwrZE9E?=
 =?utf-8?B?bGs4Y1hGVU1GbnBYM1ZwYjZoemtld0ZDT0EzY21VdzM2TjdDZEc0WVdxUXY4?=
 =?utf-8?B?QzhyY21jbUlWeFEzWGZ1V1ZwZlBvZ1dRY1pQWHZ6di9Wc2dmSHFhWCtUWDlY?=
 =?utf-8?B?dEI2Rnd4cnJ5ODNSWnhLSmdLTUw3K0h1TER4L3JHc3NCQnN6VDNnNVYxTi9q?=
 =?utf-8?B?R245bnpYbmpUNkRvZkVvNkM0VjNpTzgwWjRaa25OSWJpQ1ZndEo1ZHRxRUxo?=
 =?utf-8?B?b0dLUUNqSmJVdmlGb0dTNlZLb08rNThjQ1lqLzBXK1R6c3F6YjJCK2pxd3ZU?=
 =?utf-8?B?cFgxRTZFb0F1UUloL0ZUeEkyTUNSWFIzV3plY01qbWVOOVQ1ZnA0QnFRS25U?=
 =?utf-8?B?SnRVVmpLb241OEFrRnFuQlphOGc5TFlzWmFXZG5UdW5hOWFXL2FKa0NUaEhB?=
 =?utf-8?B?c2FSQ1k4K0ZBcUMzVDB4N2srenk0Y3E3QmFnNzhlNVdZc2RMSkdYbFNxOUhU?=
 =?utf-8?B?ZVNCWGNjeUIrR05tQ2dDc0NlU3d2M0MvT2lqa0lOTUd5bCtOWVdhY0JGZjcw?=
 =?utf-8?B?VU0vK00wbytZS1FpZmQ1QXoySGN3cnExL2F6dyt5NVYzeVhvajYxbVd6c3hY?=
 =?utf-8?B?c0tsTjZjVzdzcFk3d2thYlZXRXlBQkJUamlHVjUzSnpFVUlZbWRoMU0rd3Ev?=
 =?utf-8?B?UzFvclRIUkdWTU02b2kydUVkWEVsTkVHc05uNkVHR0JTdThGOEhTK25xWTd2?=
 =?utf-8?B?MDRBeE85clBtdENNb3R1L1E1UXliVDlNK1BpU3J4dVkzYjdlY3M2YlpLb2VW?=
 =?utf-8?B?NTNpaUxqa3dFdnJFMi9UbVJrRWs1L05tY3VZV2YvRzBMUXZuNDBWL2M5a2t0?=
 =?utf-8?B?Nk1xQWxhR0dLWERuVTRaSjBibnhWZFJFNzF2czZGODRUVUJhUU9uUW5UQ3NV?=
 =?utf-8?B?QUFjblR4a2o2cXgyaEFyMTRIc2FiSGlOeFcyTEhCUW5MMkM5QVVvR01seUJv?=
 =?utf-8?B?cmdZdk1JbldGUGlHdlFjWHZTcWxoVmR5d2NWZjJiaEMvcnBwQ3J2U0xqeGNE?=
 =?utf-8?B?ZnVwZFY2WTdoVlNkZEEwTEJFcXVCb1FrQlFTZFByQi9tMTl3ZzZRcTlwNVpt?=
 =?utf-8?B?RlVhYkREVU9rRWU4dGI2WFJOS2kzemVlMnVITElqai9PaDBNWG02YTVQTkRH?=
 =?utf-8?B?T2JKeFJmUEF5TXNLUFVEMk1sYmdHR2t6a1BVUysrZ1pGUXRhQVlMQ1FyaDVH?=
 =?utf-8?B?UWRzc2xIMUk0N3ZjQzV6eHdMNXdmQXVIWU0xVUZURmdwRnFza1pmRVcwVXZJ?=
 =?utf-8?B?cFZ3ZGZDM3lFR2FPcktxNnNCZzd1VDdMT0Vtby9xMWRLWFc4MzZHa3A1SEps?=
 =?utf-8?B?R1hQTjNCcllDT2k2NFE4Zlh5MVpmclVLU3JMbjFlQktrVi9IYVpIQk9QTXRi?=
 =?utf-8?B?WWhxN296NG52NFMvb1ZLcXVlUXdiaWdTYkR6VmtYa0dQd1Q2WTF6aUFkYlR6?=
 =?utf-8?B?d1VmQWI3Qy9GTTBsVWFIUUV4QTJKcWNYQzJNUGtlZDB0MVgyOGRBOVNnZGMr?=
 =?utf-8?B?eEJNcWlUSjFKUkV3WlREN1lqSTN1UXIxWkZhS0pZNXpqOVh3YVlKQzZKY29I?=
 =?utf-8?B?RzIxV1I0UGZuNWk0RDFXT0tZTmlwaDdhb3MwNm5MZ3Exa1lWU01NcEhPNzNp?=
 =?utf-8?B?b3ltU3ZxQWFkL1BTQkxNMmlraTFTN3pRVU5WK2IvZThYM3NCOUplemVGSlFz?=
 =?utf-8?B?aHhHVGtIeGtYelNnc1gvd3VZNGs2Sm0zNlljVnRCRlZMM25RUUlWUXZ2VEN6?=
 =?utf-8?Q?Ewvrr9zTvd3e6Okk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6d3d12-0852-4e17-37ac-08de6694f7d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 22:05:13.3581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygAg46w+UgD42plrL3xX64YywAaHFTBLnIxFPOBVBA2OYhPDaieaKMcCwoqslSnNt/feM7GoaacKy3kOv8UM1x0SDvW+amB00oMS0P+yf80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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



On 2/7/2026 12:57 AM, Matt Roper wrote:
> On Fri, Feb 06, 2026 at 11:15:16PM +0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: drm/xe/wa: Steer RMW of MCR registers while building default LRC
>> URL   : https://patchwork.freedesktop.org/series/161300/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5_BAT -> xe-pw-161300v1_BAT
>> ====================================================
>>
>> Summary
>> -------
>>
>>   **FAILURE**
> 
> Hmm, it looks like this is problematic in SRIOV VF environments because
> the VF doesn't know how to steer (because it doesn't have access to the
> fuse registers that provide the necessary details).  Lack of steering
> knowledge usually isn't a problem since the VF also doesn't need to do
> any CPU-originated MCR accesses (steered via 0xFD4).  But in this case
> to do a CS-originated RMW operation on an MCR register, the ability to
> steer properly does become important, and the VF just doesn't have a way
> to get the information it needs.
> 
> I'm not sure how to fix that gap.  Michal, any thoughts?

It looks that VFs already know the fuses at the time of mcr_init() just
we didn't let them run any initialization since we didn't need that.

We can let them do that now and with [1] I didn't see any WARNs.

Michal

[1] https://patchwork.freedesktop.org/series/161319/

> 
> 
> Matt
> 
>>
>>   Serious unknown changes coming with xe-pw-161300v1_BAT absolutely need to be
>>   verified manually.
>>   
>>   If you think the reported changes have nothing to do with the changes
>>   introduced in xe-pw-161300v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>   to document this new failure mode, which will reduce false positives in CI.
>>
>>   
>>
>> Participating hosts (12 -> 11)
>> ------------------------------
>>
>>   Missing    (1): bat-bmg-3 
>>
>> Possible new issues
>> -------------------
>>
>>   Here are the unknown changes that may have been introduced in xe-pw-161300v1_BAT:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>>     - bat-bmg-2:          [PASS][1] -> [ABORT][2] +1 other test abort
>>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
>>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
>>
>>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
>>     - bat-bmg-1:          [PASS][3] -> [ABORT][4] +1 other test abort
>>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>>     - bat-atsm-2:         [PASS][5] -> [ABORT][6] +1 other test abort
>>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>>
>>   
>>
>>
>> Build changes
>> -------------
>>
>>   * Linux: xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5 -> xe-pw-161300v1
>>
>>   IGT_8742: 8742
>>   xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5: ab5b6da7d4879640bce3197597e0bc707bd60ab5
>>   xe-pw-161300v1: 161300v1
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/index.html
> 

