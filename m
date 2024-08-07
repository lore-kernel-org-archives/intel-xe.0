Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DCCC52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 22:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39B910E5FB;
	Wed,  7 Aug 2024 22:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrcDQtuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C8910E5FB
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 22:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723071119; x=1754607119;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t7TzTemgzdp2eAQiybM9osWHnno++jMJSaiA9/IJZWw=;
 b=BrcDQtuB3HoZL4K5TDWV3QeFg8s2jrbB4IIiOLHfYErgCkNb2a9wmkvh
 GcyrJn99jSwqHTc+llJq+XzpOV7NPBwZDohYZ/8FYwWl9eqoLzQjQxySu
 C+o7O17xwLcOTR7sCWTG8OK9PZp8vFagnEr7AJ2UP3ZRkfhuv3Sla8jXu
 d1112/2+c13Jg/s5UaYRMwQVQ3FiKMu7YrDqQz6RR2ow7mzKCjMuEMVgI
 WKU7PDoo91fSkN4E6nHWP+XDVIIpiFsptcDtctAIvA1N/6DBWYWaC6UDw
 DujvVgehlwMHbedUnsu9k6cCUrimrCtJTwaIkbiJB71diw3WjvnoADZDY g==;
X-CSE-ConnectionGUID: 4X/+pEB5RbK+3/u9GLu3Jg==
X-CSE-MsgGUID: BkKuEBHfSkm5VkhIe9FjuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21140474"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="21140474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 15:51:58 -0700
X-CSE-ConnectionGUID: i4EhdsRwRoWnBWIcJhogzw==
X-CSE-MsgGUID: QHPJ3HqCQCmhfLNTlVgz+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61880937"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 15:51:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 15:51:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 15:51:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 15:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq3eCCrZPn7Mj5+goYsSiFPLZkeCtO5ErS6DP0/0ac1nYbGtL8YlfFW+4kYMImP68qncxuTTSpRRMv+65st9/h6iwlpb5iTH9iv8o1UylXgxgLuk8yYDJg3xQr5cEHMo7pv8aG1psppC995oxZ1C0a5TEARy+nVVLkgvDs4KKDAXYb8th66q+r5dA3/z/CP+lcIPYDPHjrW5Zc6IgChieH+ppWH5llPyvRT5sEeEWWwsuRHWnUQxunkpN/vY93l8FC1HMxtAyKA1GfpkouuMw01gVHe/H877kVGJPDiu9rtUbdihscu+eycT+6q7IZ7maFea1Kw9cM1UE6PW5iw8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFkCKbULDY6IX+NSmHWB+DZx+zc3yyXOT8P5BHL8wQ4=;
 b=aHy0s9W/DQwYShqs4pn4wHkTS0avRXCAcRuyVbfwpQ5B7+o2wr8W1bptVsZBxruKDBL5tequPd2/A4r08D8/BT4jzrK67rd2sjBoar+sDzYbUv4+T3hqHLucmN9T/lLywkJl71rt7b6r0Ynspf/Ep6uEzKh1QylaF0SuJt508xsV7mq4U4u2pN2rLosBfug/w5H+qWKFu+gcAmuNgvCTh+c+0INa135xn9vUFko/KZ7xIEksz0Tk7WewjE3xE8HKQYWtnTqgTXAtEbXnVr3eRAknPpKGoOcLRFWSTF6wVkjpBMjbZqo3hsg9gjTJjUKTlAnNQxC3FTbIC/yP110QQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Wed, 7 Aug
 2024 22:51:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Wed, 7 Aug 2024
 22:51:54 +0000
Message-ID: <d45496eb-4e9a-4a20-94b1-d985f5588ac2@intel.com>
Date: Wed, 7 Aug 2024 15:51:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: fix WA 14018094691
To: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240807211106.1322197-1-daniele.ceraolospurio@intel.com>
 <57qe3afswvijqjsf2vowsif7p4hofxn3mhv36e3k5wc5qwop47@xgh3gy6ol5cl>
 <20240807224209.GC5774@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240807224209.GC5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2248acec-8af3-4731-aa0f-08dcb73388cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkFoK0dzN0hOdUNCK3Z5SXlpQytCYWoraXJ4UG9aZUthNmpQQnpQREcySDlS?=
 =?utf-8?B?ckE0endmVEozQ2hFYW91RXk1VnlyTXNsQnczMnpoOUhRSlZKeU16NGg0b1c0?=
 =?utf-8?B?bWRQUVNPR0tqYVJScWdndG5wRmgwbkkwUjFLVS9LN0trdTdxYnhEdnVsUUNR?=
 =?utf-8?B?UzRvQVFja1djeEZvUlVvNXVDdk4rZHREQ1VtZy9zdEZwZGhjSmFXSFhSTkpo?=
 =?utf-8?B?dGY3VjdVSzdndVRwMll5K0pSSVpYWWxDbnhIbnU2MzZhd2pOcGRobndqTitN?=
 =?utf-8?B?bTM5WjR0enBybkxxdnk1UWsxL1N3a21rL1RRNUwzVVp4aU9RWUo0NEV1RDhq?=
 =?utf-8?B?WTloU1FLOENKSXNsNjZxWlZnMVZ4dVRRbWpha2tPQ2VUbnhDVmt3SHovbjNl?=
 =?utf-8?B?bGVaN1B4U2tIS3N1SEtmTVRaWTd5TW9TeU5DaVRkWE9KeklUREFvQmFqaG9q?=
 =?utf-8?B?OGFyMmxnVFg2b21lR3AvWC9aVDZsWENvSGI4Rjl0SEU0WDlPc2YxOEVUaW5P?=
 =?utf-8?B?R1dLNC9iMGpzNGo2MVZqTHJ4QTkwSnlIK1Q4aSthTXVqazNsWjd1TWw1YUhz?=
 =?utf-8?B?bUJDUjNsNzJrWkx6THdncUVEVUIvTVJiWVc1a3J0MnZINXNPWlBIanhHU3pn?=
 =?utf-8?B?WnVFTmNpS2hpbEhzSWxrNVkxNE8yNkdUR2gycURnNDlwd1lUNTRlSnRSc0tu?=
 =?utf-8?B?eVlqejNxYUw1bkRyVExsZEk0ckZEdXhmZ0JRRXpQT3RaRGNTRk9XeExDcGRY?=
 =?utf-8?B?eDRUMnRhUGtxNEJVYVFwSDJSa1AycCttK1RrZ3pwNmd1c0lpTUdMSExOdTFJ?=
 =?utf-8?B?VWErbnF0cTMyQTZKS2dEVzVaRzYzb3pQazk1dW4zWncyZmpiSVN3dnlIV0NF?=
 =?utf-8?B?enpyQmZtMzJyT3psUFJhbkx6aE9ReWI4amhEZ21JRnJ4YXlKa3N3Z1JUMHlY?=
 =?utf-8?B?eFY0aVZleDk2d0R2L2ZIMCt4QWlxMUtESHVSRGhOKzJETmN6ODFxUDgxdHZH?=
 =?utf-8?B?UkdtQnBmcmlFYXo3bGUzdFNkNVpNaGVkaUlnYTk5Vmo4OFpJTjVaM1Voa3BS?=
 =?utf-8?B?ek5YNHdpSlFYdGlHM1BDb05RSGhiMXIvNEZyem95cml4Zkowd3FDVmtlZldU?=
 =?utf-8?B?TTBWYU9RTENOTHl3Z2ZLaDZBaitzUTZwdS9kY0h0bmJmQ0NkZkJEMnZxNjBL?=
 =?utf-8?B?Uzl0Z0hzVVNWd1ZQcWt1cTlRaEtJclQ5ZGdEWmlZejNOVEtkcnUyaC85Mmlu?=
 =?utf-8?B?dFlXeG51S2ZEb3V4KzV2bFJXdjJsTXZaaGVGK2dsMm1IOU90QXBGYVUrZWxO?=
 =?utf-8?B?MExKQ1VmR0ptVWVrZms4ek9CY01nWFB5R2toeEovQTNDYi8xZnNJRWUrcGlt?=
 =?utf-8?B?ZE43TmRReUVvb29OdS8rV2cyc0ZBMXhTTXViVlpkTDdlbTBIS0l1ajBiYStI?=
 =?utf-8?B?UEhZS0ZKaXdHUG9nbmJjVTlzRFVXeUZ5WHc3cm93dk9qTTdQbFR4NW4rbHhZ?=
 =?utf-8?B?b0hITmJWY0RFM1JLSFRSdW9nVnlISVJuUTkwbEd4ZHBOZk1ZMy80TjFwVDZK?=
 =?utf-8?B?VUNxNEdVS212SU9pY1k4UE1IYktsTUxxdkU2VVJUWkRlSS8xTENsREJZckIx?=
 =?utf-8?B?WXZqR2t2Um9HbHdlR3ZVemNYQ1hCOWJKNVFjZUVEbTdQWG9ZdSttK3hiZjM3?=
 =?utf-8?B?YmFCWEVPQ3ZHbUw1RG41QTlWV3dabDNaK2kwZmJ3YkQ1Sk9rZGc5SkZIUHBU?=
 =?utf-8?B?RTg4MHZjZWZoZDJ1clhiZWwxMWlueTFTeEVia0RiTU5xWXNVNzl5Yi9NKzlE?=
 =?utf-8?B?MGg2TzdkWGlTWkphU3luQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWt0eFNSNzdPNEIyNDk0TFhDRXo4cUhhbFRTVTlEMGZ3MjMrb0h0WGt6RjA2?=
 =?utf-8?B?R1lrQW4wZlBvZjRTSGFPWFRkZ0VNU1RWL1cxazB1SFg5R1lZTlpsMjdobitm?=
 =?utf-8?B?QmI2dk4vaWJCdXg2UDBpek9YRTdjTEROMUp1YVhoendVQWRpa0JkNkhaUVBy?=
 =?utf-8?B?dG9CMXZtVHpSeEFwcVpOWk11ZGZYRTBHVVlZNzNyeVZLcWlnb0t6ZWhSMFpz?=
 =?utf-8?B?SW1vUWdCU3hrOEJVT3BFWWFyNEJBTDZiVzV6aXdKMi9MeElJV3JGZitCT3pl?=
 =?utf-8?B?UmZnczZuZ0RCVFY5V2pObXdGVFdtV1crM0F5MXhoZExRMDA1cEkzaHVKRmJp?=
 =?utf-8?B?WDA0UjFrbWJ0S0oxZGFBY2s4dnF5NHVhVVNEZ2Zkakc4aUo2S1dCeEg3VENw?=
 =?utf-8?B?RlFVRG1xU2J0MklXK0kwRmV5dWxDRG1pWHhLQ016MytpWkJDRWpjNkZhWkpC?=
 =?utf-8?B?YkRna2Z4Qks3QjcxQXZranc3MytyK1RNNno5a2o3U1JiVGtqOFYxTGRoM1N3?=
 =?utf-8?B?VWI1TVpwZ3Vka3dCRTFCTEl1TC9wcTFZaXBLVWwvYTJSem1RMFRrSERmUjJy?=
 =?utf-8?B?ak05REg2N2MrWHp5bEFMTTF2QUxHVllDNStXQ3ZRZ3cvTjVFdllybTdERzhz?=
 =?utf-8?B?TDRRMXhocjBQSVpIeUtHWktYdGRwanhsZ213bjN5RjdsSnZLMHJPWWNlNUZE?=
 =?utf-8?B?N09YNWNpNUExZ0kzb213U1lIUjc5OVF5bVR6ZDdtMzhrWlo1UnZVd1pTd0xT?=
 =?utf-8?B?aFNnZkhydkljc2FPWHVLY3RIcUlKTkRITHNKRS9GeUVVMUI3U1VOeWVIUlcx?=
 =?utf-8?B?RTFYQTZPQlBic09rbXhKOXpsNGFDZGl1VnFEOTc4Z0JkOU1KaThvVDl0QkVZ?=
 =?utf-8?B?ZmRTTWhQWWdvaFBzVjJGeHJwamM4eU4yVVI0TU5TcnJ0YmlDZ2tTMVllcjNy?=
 =?utf-8?B?ZDRPWVYvMklKeENvVGhOWFN2NXo4RnRtYk95ck45TlAwemFOUVRkd0l3YmVk?=
 =?utf-8?B?Qk5FcTkwQjZ4R3RGY2haa0VVMmlFQVFEZ20rdHRGZHZXbVFNd0JaczlTT2lH?=
 =?utf-8?B?aEJWaDkzeTJReUdLY3BCMCt2cS90VnlkaE5Ocng5eHNJSFRNVWhGQ2Y2K2Fa?=
 =?utf-8?B?c2gyQXFkZ2R5bk0xVVNYWkxrNkRsQnQyZEVqOEFBa1JuUDRnbmFHQ25CeDRy?=
 =?utf-8?B?OTM3c3llSzJ6dlhOQWRuNDVJWGNxakZlTndQYmxYak44Mmh4Y213Q1psUWFi?=
 =?utf-8?B?S2hrOEw2ZXEweE9ZNjdFSE9Jdjh1aVZNMUlZU2V2T1l0aVprMFpVOStZMzgw?=
 =?utf-8?B?VjlSUUZDVzl6VTcwRGYyam9acDBJd2gxSTBDU003dlJXSU5oZWdpbDJycDly?=
 =?utf-8?B?dytWYlBtL2k1MzVsb2gzeUYxSFBXMkhxZkEwcHlqU2IyemlvTDNxNUloNzBR?=
 =?utf-8?B?Y3hjd3R4WHF4U2JGOXJFUkNOejhnaTc5bzF4VmF2ZVJVYjk4N0lnQ3l2NGo0?=
 =?utf-8?B?L1NiYnZOZERVWFZvZGZIR0FpeTJGSWFZbVJ6ZXR4WS9BdnRueENpckNiMWNY?=
 =?utf-8?B?RkZ2OWhNOWZXVmpjcW9vNlBBRTZzZDJiYlhGZnZkWWpxNDJrUjNjdFFWNitw?=
 =?utf-8?B?VWpoNGRsMDFWL2JWcTdIRFZJV21SOU5pbjNWV0ZjSHpGeWljNElPN09vNFg2?=
 =?utf-8?B?a240Rk9HSUNDcU5HMkIyOTBPd3EwQUFWRGxxcFF2aXF0cmIybjhNb01UeEFG?=
 =?utf-8?B?WE9UQWhQNmE0ZFhUSXpPUzhKTDVoYXJ1MHJhZ3BlbUFZZlV6V3lFSHZRa2RE?=
 =?utf-8?B?VDJZRFdWallWOEtOZW01S3hJa0tjcDdXZWx5Uk1Ub2xnTXBTemVoQjFMSFho?=
 =?utf-8?B?djRWRmVJZGQ1NStwYTB0bmRWb2JsUUVvamYxcTNERTE4MUx3N1VIRkhzQnNX?=
 =?utf-8?B?dG1CbjNPK09Yd2F1d0ZOcVZmVm5zejhKTDdYOXJLL0REZGg5YmlzeWJPUHNY?=
 =?utf-8?B?S1RWemFiUzJRYmp6ZjhsMjVBbXZySWc4K2hMdFBsMGl4RWdheWU5SkZUenVM?=
 =?utf-8?B?MjZpOXRiVFNiZDBtNUN2ZCtOektndXl4ZG8vckhvS24ySU1jNXRjZlVESEJT?=
 =?utf-8?B?c1p6MlkxRnYxTVNDZWJFUkdCNUZoa2Nkb3VkU05vVUtzUHoxRHFwdmU1U3Ew?=
 =?utf-8?Q?PFdQ4H8XPs/wzwSin7qTMZw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2248acec-8af3-4731-aa0f-08dcb73388cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 22:51:54.7781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 259JC6Z7MKNU2dFsZUpzVvh3lC2ajChX8wZljvsk09wXHV+ZlfJPxQWc6XkyDLCRw1841gpLqSq4FZZYgkkBbMKFg9QCJynSRxv0nGDQ6rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
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



On 8/7/2024 3:42 PM, Matt Roper wrote:
> On Wed, Aug 07, 2024 at 04:51:32PM -0500, Lucas De Marchi wrote:
>> On Wed, Aug 07, 2024 at 02:11:05PM GMT, Daniele Ceraolo Spurio wrote:
>>> This WA is applied while initializing the media GT, but it is currently
>>> defined as a primary GT WA (because it modifies a register on the
>>> primary GT), so the XE_WA macro is returning false even when the WA
>>> should be applied.
>> humn... I don't see the media gt marked in the WA db. Does it need to
>> be updated considering the GSC is actually loaded in the media GT? But
>> it would be odd to write to the primary_gt. So... alternative approach
>> that I think would be more correct would be to change the implementation
>> in drivers/gpu/drm/xe/xe_gsc.c so it passes the primary_gt to XE_WA(),
>> just like it's doing when writing the register.
>>
>> Thoughts? Would also like to see Matt Roper's opinion
> Yeah, I agree.  It sounds like the workaround applicability is keyed off
> the primary GT's IP and the registers that need to be written are also
> the primary GT's copy, so I think we should just be passing that GT to
> XE_WA() as well.

ok, will switch.

>
> BTW, it looks like this workaround needs to apply to both graphics
> version 20.04 (used by LNL) and 20.01 (used by BMG) if I'm reading
> correctly?

yes. patch 2 in this series extends the WA to BMG (will rework that as 
well to use the GRAPHICS_VERSION).

Daniele

>
> Matt
>
>> Lucas De Marchi
>>
>>> Since both GTs are involved in the flow, fix this by marking the WA as
>>> applying to the platform instead of just the specific GT.
>>>
>>> Note that this WA only applies to PXP and we don't yet support that in
>>> Xe, so there are no negative effects to this bug, which is why we didn't
>>> see any errors in testing.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> index 540d38603f32..40354fb01737 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> @@ -19,7 +19,7 @@
>>> 		GRAPHICS_VERSION_RANGE(1270, 1274)
>>> 		MEDIA_VERSION(1300)
>>> 		PLATFORM(DG2)
>>> -14018094691	GRAPHICS_VERSION(2004)
>>> +14018094691	PLATFORM(LUNARLAKE)
>>> 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>>> 18024947630	GRAPHICS_VERSION(2001)
>>> 		GRAPHICS_VERSION(2004)
>>> -- 
>>> 2.43.0
>>>

