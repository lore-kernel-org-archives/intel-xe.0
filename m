Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768C8CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 17:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AD489A5E;
	Thu, 28 May 2026 17:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwXaG3UX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A6289A5E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779989719; x=1811525719;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jCyxEp9DdIPsnGJ8DSoOTpr16VL+4W+wGGfFNYChMLY=;
 b=IwXaG3UXEck7M3otRsXI8PjMNd76+MO9oqe8J+wXS6CXYK3jjIdYtK1q
 Lnfl45FjwCStemfCnP09lGLxYMhk1wgAogAjCO/TYoZmnLabAn6arCxHd
 lb826UeokBZe9pBNcoQx4blKYlkGfwuLxoIjupYUVe9FsuMqYhXGzTqgP
 0TweHdm2vRGCauxV5vpUaMVvfYe5nnsRkVh5KrwLh6Drwn7jf9CKOkvr8
 cLN37en8vTPj/T4bUHbXJBqls9LHgtkpVKeuQQc0am+xFtqb/AHlhIaef
 RfuyjOudFqiyoiNAVXczD6caj3vMz9hLjGcD8cVyAVPPuGQqo0p0et85a A==;
X-CSE-ConnectionGUID: mH1RtFLDQqq0k9YuIomF3w==
X-CSE-MsgGUID: lx7BsUQSQLCOHUSYzH+CxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92311693"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="92311693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:35:15 -0700
X-CSE-ConnectionGUID: XYKou+hVQAaMICEId64nYA==
X-CSE-MsgGUID: ibXBv3cHR7yYSqtVKFVzNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="238421375"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:35:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:35:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 10:35:14 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:35:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3jckinIRzl2xo6dDhiYWozbMACiVsl9PZmmFYuMkOpJlqS9A4Oa1uk2jJgW3e/CKkP9Kb86d+zC/LsmP2O9l+cO3R+kTg+kP5Jaz/Yh0YWiJgODQBXD1WXneQhqjKdiERS/LjeyT+iS8Z2yliGJlQEckD03NSqpgycMda0Tkj6YU4P69/Ia4iB0ROtTWHgQpnLKB+DkU/K59TQQd0nDpFGZ+NXziI6jlLQJ7WOcdzEnmOU5tFoUoLtzT5UOdsF8YM7iKCU9j+MKqsUZH9E1hapEQi0mNsmcTskcF/uKEus2Jjp8XtFpJ331nbtEkCNaigrV9Zqa9RWfWAs/HIHLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWGEzuQX5YGMWKgytPcpSyXzwyCAWGv+QD4bc2qRjBw=;
 b=teCj2j0CRpGaoGwWbCqLFUnj9r2UYx7TP2jsKv2pGGs/bh471ZZA4kXvPHt40oMkWrMLqxwF7j2Aod3qodsPvAY8hJv8g0yW1MQ/dx0UciboPBKTxiKMbwXBZvAKVaEYo5sSjCJEFTwBwXcoQ1H1Gl1BPK68Z0aqxxqKleIxCy2+Aay/6eVw6SDBPqZl4E1JrXWYIeg5sTN4W6TPm0GKlDKRRTmlHNDsXlFUoID876kfq53yrnOt/L9K7VwAClhVe7nDM6QvQC6kMImptWmccmLPkVwlIvJhkWFGRxxZNePog2nSrEeGNkwYIyW8vxzD6moFiH5IAfL13r8KQuDP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB7795.namprd11.prod.outlook.com (2603:10b6:610:120::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Thu, 28 May
 2026 17:35:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:35:03 +0000
Message-ID: <553bcab7-0fb4-4797-ba13-c872ab2b5c18@intel.com>
Date: Thu, 28 May 2026 19:34:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mmio: Assert MMIO is available
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20260527175437.22585-1-michal.wajdeczko@intel.com>
 <754ed1a5-ed12-4e0e-bafc-5775106d8e14@intel.com>
 <d7fd718c-413a-4a7e-83d4-cfb0401194fc@intel.com>
 <d77e39ad-2463-4947-a0d7-d366f6d45cfc@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d77e39ad-2463-4947-a0d7-d366f6d45cfc@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0016.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: 10feb038-e370-4689-b24d-08debcdf7313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|5023799004|56012099006|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: XXAWM9zqw2gJLJ24vhBxUmCN0WkDzZLmlGBRdEj0wCVjZ94hqMVFXwIPL3rWVfsbOXLQPecZBLi2vYyCKAmMlGszyADvCVggMB2VJJBztMngrryZXZUexSfd1RrXMM/J0ngFEham/Lr9OsSbLVc9dFh/ibDuQwvy4ADxDIB9LWm4GLRpi0mtNopVCg3FHyt/V5ukYVAaV/u2vSg32lPZ6XnWqJtBBpOAteEpRfiNX2YH1BcC392+to0EW1kB8lAVZHMyD8/shSoxcb9+v+r9YKsTr21G6DlmnHDuPi/Wx7XZIDnE28KxUJiAGMNfvdZGUHUFPZmHvg3ZhFBWoD4A+nzkXVNwNEqDF8k64jX0v5BSkQ/We4QmfRSv9ODY/kTS1J6zaLJF34pvvd1BoceIXDsE0kWjcU9f4/exx16xMYuOdSWnCTOLr+SLC6ihhHQR6+eWbZKgxmGmnsvv49Md0+i5zGir8j8dCBW0sNfxuUkpaUdVSwmbPnh6Is7cJDNSrQim0oRKNSus/hDJAoWyS2JSWk6M8O+zDzXvTm+1YIJECJvpEcdRdyVKYyq0FTR+3V3rKgMKvbqlc9Labo0K6Wkk87pbpDTu4BAM5w844ibvZt1mR8U0XvvbbWfccH+PGtxhfHxcNAplB3KlZhlp0wh40xcRrtZR9b4lS1QRqEBuvEI1yPFDKxxFEi2dECSK53TEmVrgX2x7QVkPFGxWvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(5023799004)(56012099006)(4143699003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2RxK0hHZTJNQm9TUXNuOXlOZmRJcFBrN1RUQUV6QVNGZXhpRnZyYUIzRFJD?=
 =?utf-8?B?QXJvbW9EeGVvWkwzWFRIY1JIbUEvRnAxQWorMi94V0E3NEJYYXhjUFJGQi9t?=
 =?utf-8?B?Vk9QYXdvZU1FOEcwMkhieUdpL3pjN2ZwV2tuT3pVOGRFZjFENENHMW02MFJ6?=
 =?utf-8?B?N1JmTEprZmJsNVhEMmFxWW1iLzFEQkxiTjBsUUpXczkzR1JjMHEzM01QdlFL?=
 =?utf-8?B?Nk5Ic3lxc2M2ZlJzM3kzOHJyWGxudVMxYi9WajNhRHJsaStJV0ZIbjdlUG5n?=
 =?utf-8?B?WUg4cnExcVF5aml6TDI5VWhXa2NnYWpGOHRvNWljemE1QzFtb0pCd3JuQ3dZ?=
 =?utf-8?B?OVZWUFNHL2ZaeTdrNElQc2F1SnJGdnZObnBqdXp2aDJFY25WcVNKMEZGM3J4?=
 =?utf-8?B?eXdSd0cwc0h3Q0x4ODRvOTQzYkM0S0JPTnJ5RjlaM09WdUFuWDJaRTBvT1Ra?=
 =?utf-8?B?QXYwN2FOSGtOeFhnWVRFMnM4dzhyaFFYNmJhbnFjb3J6Smx3cFhQL21iazhP?=
 =?utf-8?B?Q3ZsUnF4MkJoTFFUK0lKZmJCanFjakVCdm9wQXhYUXprVEhDbDZEYkRaT2c4?=
 =?utf-8?B?SFBmdzg1eWNpY1JhT3ZrSjBlZzJlZi8yOGtOdjNtU2RkVnRXNlBHUnpBS1Ey?=
 =?utf-8?B?bDEwZFFLb3FxSGNoekUvc1hjamVaQ1dCbGlSUEJNS1B1Z2I2a2xXd1VVdnZq?=
 =?utf-8?B?dklwWXAwZ0R2QmVnM2FYbkQxZlhja29EekV1eTUrYS9RYVVBdnB1RHZsc1Vv?=
 =?utf-8?B?Rnd5UThuQlREYnRRTHVRaHlqWTFyZi9ZTXBIUWdBQituY08rbUxidE90REhV?=
 =?utf-8?B?UWV0TEpPam9QazhJS2tFdFRocU9YZ2cxajBnVUtmQWFBTWVCTThBcmhLOWJX?=
 =?utf-8?B?U0ZPQkQxVFF2aERQem1hbWtucVRKY0tUN3ZOZXZYZzc4ODg1amY2T3o3VVRE?=
 =?utf-8?B?dDljdkJEQzBRNzN5RnZmemNVQjJSMXZoRmVBQ3RueDJyZUV6bUpRSWFMenRj?=
 =?utf-8?B?VzhKZ1h3R0E2Sm5rN0MyQVR5bjdLYXVFWURwM3RqZXFBNUpyY0xHRGdaMHdh?=
 =?utf-8?B?bndvTEJBeXNYMjY3VmhtK0ttR0thUHdpSXNLcTBJRlV5c1kxZmVaREo4OXlU?=
 =?utf-8?B?SzJGaWhhOWhURmJybjJ4STJGRUFvZ1ZrK2tZd2ozdnhrL3JnRzNHZE9pQVUx?=
 =?utf-8?B?ZXZWeitJd3g3SU9GNEwvTTRPaHN2SE5rOTJVVFJlaUE5RHdua0xiczhQUXUy?=
 =?utf-8?B?cXQ3R1ZsMi92Z1hiYXBma0RrU2diaUhCeHk3RU1qKy85R2RIemZGdnVHR3Uv?=
 =?utf-8?B?LzFsWEJzWnlTZlgrMzdKMytwVHRaSGhoZjJuU0ZiTkdJVTc1RWxoNlJiQTF5?=
 =?utf-8?B?M0YyNlZYSERtUVc4RHd2aXRYNnl4cDNycEZwVVdwMDZZV1NuVlpKTjY2TEdu?=
 =?utf-8?B?eWF0UkVEZUlmRzMzaFQ0QVE0U25pUGNibCt4M0lhK25YSUs2bEtJSDh4Nmtl?=
 =?utf-8?B?akhRcnNTUVBReWlndm14MDRsNTZZVU42Wk85Rm9sQXBLYm56WUpUVkdtc1NT?=
 =?utf-8?B?TThBNElwNTNFNENqNzdTQ21RRFZYT3pvdVpoYURYVWJiVGVMaEVWeGdvWmdq?=
 =?utf-8?B?MXZKQXA3WUowQ2pZYmtpbEJoOHI2TXRtZ0IvR2ZEYmJOa0dWNzNYSTE5cmFU?=
 =?utf-8?B?NFV1VE1Dak5sb1g5ZkdqR2psRWJ4STlTWEJmMGsrdmFMTTAxR1NleTRiMjd1?=
 =?utf-8?B?V1pSK0k0RXlRSnkzRC9zMVlrdUdzWFlnVERBRnA2WlNWZHB3SklncHFTRHBr?=
 =?utf-8?B?eEIvQ2R0emY1SGdWVnZYOFFyVUIreVJmYzY1K0RZU3VhTWlobEovSWZZeDVw?=
 =?utf-8?B?TGZJcTZtdUNSY3ROTmdxK2UwQUpGbldVRFEzdW9aNG5TanJIbHE0ZHo2NUN6?=
 =?utf-8?B?bUZBWXQyUUpWek9YM3htOFJBWHRGVUxZVXB1NHAvZEpGTzJsOFBvT1pZd0xu?=
 =?utf-8?B?dlZXMndwZnNET1RscGlVT3JkbVpWeG1EeEdRRDFxR0RNQ0V3SkpTSFpQbUw3?=
 =?utf-8?B?RWcySFdZalU1REx2RTNTNklkYldSWERsQXNLQjFYN3pQMHJ6UDRkRFc1UlMv?=
 =?utf-8?B?MzJTSExnTEF0cXR1K3pVWnFEMlBoYTJpYlhrVWkwWWp0dzRKQnFWQlJiVVMz?=
 =?utf-8?B?eGhZUk9pTDl4T3ZyS0MrUEtBdWxNUjR3ZjNLQWVscGROaFNva2NxaThDTmFG?=
 =?utf-8?B?eEFTNVAxamlMZ2ZsQlZqY2JKb04zKzJzSEVvalRPQVdvaUplODdmWEdHZW9r?=
 =?utf-8?B?N2hDZWF3LzFSazVWMWZKMjRoeWRyT3cxSHpoRjh5Ly85VS93YnRyVGlsaXpQ?=
 =?utf-8?Q?iD1YH9R5rBFiG+Uw=3D?=
X-Exchange-RoutingPolicyChecked: HYEENRkqvWakZvcZM6kYkCErvV58+twwkfBvJgq+OSq5hbBU+/W43r7r9yfq17Uw3eVnCcMUfK6cZ99aYK294x7huF46xyix9nSBA7IXnzxiZ2geat4aYVX5aBAGPVfFh9qDqh34XAcrJ6JcAlnA36UNZDK5swl0DHm2VO5zFSjD+O3Je22KKIfMfBWsNdW7RFCDJKwKcfqQjjVHkjYK3nCQOQ5Kb2yDYLEeRbVznmM1OAtAxWDkQk+PEKP5aOn6tZMVqo34JOzmfJ9EUCJuFqhZ9rCtxRird3atBVwZEGpffDhzfcYdLJhQWXNjPAqXJzQUd+FayQv80vso7SzJig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10feb038-e370-4689-b24d-08debcdf7313
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:35:03.0441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pogKBin/QQo1yr3rkprxGaLXP+1wXclj8Fn0t1beZUp1F8J1XJ04RuRZAPu5bbY8Rw2AcqDevH3FM+keJ1j1wicwlYJLrYw2yP9WzgrtJp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7795
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



On 5/28/2026 6:47 PM, Matthew Auld wrote:
> On 28/05/2026 17:16, Michal Wajdeczko wrote:
>>
>>
>> On 5/28/2026 11:13 AM, Matthew Auld wrote:
>>> On 27/05/2026 18:54, Michal Wajdeczko wrote:
>>>> We shouldn't access device registers after the device was unplugged.
>>>> Instead of relying on the NPD splat due to zeroed xe.mmio.regs, which
>>>> might be unreliable anyway as not all xe_mmio are using that directly,
>>>> add an explicit assert during xe_mmio read/write operations to catch
>>>> invalid accesses to MMIO after device was unplugged.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_mmio.c | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>>> index 78adb303b663..b77a717f0556 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>> @@ -10,6 +10,7 @@
>>>>    #include <linux/minmax.h>
>>>>    #include <linux/pci.h>
>>>>    +#include <drm/drm_drv.h>
>>>>    #include <drm/drm_managed.h>
>>>>    #include <drm/drm_print.h>
>>>>    @@ -128,6 +129,11 @@ void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr,
>>>>        mmio->tile = tile;
>>>>    }
>>>>    +static void mmio_assert_available(struct xe_mmio *mmio)
>>>> +{
>>>> +    xe_tile_assert(mmio->tile, !drm_dev_is_unplugged(&mmio->tile->xe->drm));
>>>
>>> Yeah, I was hopeful this would work, but as per CI the unplug=true needs to happen before the devm actions run,
>>
>> yup, we mark drm.unplugged = true in our pci.remove hook:
>>
>> void xe_device_remove(struct xe_device *xe)
>> {
>> ...    drm_dev_unplug(&xe->drm);
>>
>> while devm actions are called as part of the kobj.release hook:
>>
>> static void device_release(struct kobject *kobj)
>> {
>> ...    devres_release_all(dev);
>>
>>
>>> so we get a pile of false positives with this. I think the best we can do is NULL, or perhaps mmio.unplugged and check that here?
>>
>> there is pci_dev_is_disconnected() but that one will likely cover real unplug scenarios, for which we might be completely not prepared ;(
> 
> Yeah, I assume pci_dev_is_disconnected() is if the user literally ripped out the physical card or the hw died, without doing a software unbind first to let the driver gracefully shut down the hw state?
> 
>>
>> but now I'm wondering if maybe those 'false positives' are actually a good one, as it might be risky to access the HW during final SW unwind, like here:
>>
>> <4> [45.999577]  xe_mmio_read32+0x38/0x290 [xe]
>> <4> [46.000710]  ggtt_node_remove+0xbb/0xf0 [xe]
>> <4> [46.001167]  xe_ggtt_node_remove+0x40/0xa0 [xe]
>> <4> [46.001618]  xe_ggtt_remove_bo+0x87/0x250 [xe]
>> <4> [46.002076]  xe_ttm_bo_destroy+0xa2/0x2d0 [xe]
>> <4> [46.002917]  ttm_bo_release+0x70/0x310 [ttm]
>> <4> [46.004082]  ttm_bo_fini+0x3c/0x70 [ttm]
>> <4> [46.004424]  xe_gem_object_free+0x1a/0x30 [xe]
>> <4> [46.004857]  drm_gem_object_free+0x1d/0x40
>> <4> [46.005231]  xe_bo_put+0x12a/0x190 [xe]
>> <4> [46.005618]  __xe_bo_unpin_map_no_vm+0x49/0x70 [xe]
>> <4> [46.006097]  devm_action_release+0x16/0x30
>> <4> [46.006449]  release_nodes+0x3d/0x150
>>
>> and the fact that mmio.regs is still non-NULL and points to the connected HW, is just our luck?
>>
>> maybe we should kill the HW immediately on pci.remove, if it is still present, and just unwind SW state using devm/drmm actions?
> 
> devm is for unwinding hw related state, 

hmm, are we 100% sure?

from [1] it looks that the devres rationale was about "leaking resources" problem and the example still shows that HW cleanup is part of the .remove hook:

my_remove_one()
{
      unregister_from_upper_layer(d);
      shutdown_my_hardware();
}

so maybe indeed we are little abusing the device model by touching the HW beyond the .remove?

[1] https://docs.kernel.org/driver-api/driver-model/devres.html

> so we for sure need mmio etc. On normal unplug we need to gracefully shut everything down from hw pov with devm (or do it manually in .remove). Once we get as far as the mmio_fini() or whatever it is called, we should be right towards the tail end of the devm unwind actions, so nothing should be messing with mmio it at that point.
> 
> For sw state, that is the job of drmm, at which point I don't think there should be any hw access.
> 
> So devm is more tied to the physical pci device, and drmm is only really tied to the drm_device. They have different life cycles with unbind triggering devm and unwinding the hw state, and drmm only being triggered when there are no more driver users, like every open driver fd has been closed. We still need ioctls etc to survive but return an error, to give the UMD chance to recover, like with potentially opening a new card or so.
> 
>>
>>>
>>>> +}
>>>> +
>>>>    static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>>>>    {
>>>>    #define DUMMY_REG_OFFSET    0x130030
>>>> @@ -146,6 +152,7 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>>        u8 val;
>>>>    +    mmio_assert_available(mmio);
>>>>        mmio_flush_pending_writes(mmio);
>>>>          val = readb(mmio->regs + addr);
>>>> @@ -158,6 +165,7 @@ void xe_mmio_write8(struct xe_mmio *mmio, struct xe_reg reg, u8 val)
>>>>    {
>>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>>    +    mmio_assert_available(mmio);
>>>>        trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>>>>          writeb(val, mmio->regs + addr);
>>>> @@ -168,6 +176,7 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>>        u16 val;
>>>>    +    mmio_assert_available(mmio);
>>>>        mmio_flush_pending_writes(mmio);
>>>>          val = readw(mmio->regs + addr);
>>>> @@ -180,6 +189,7 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>>>>    {
>>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>>    +    mmio_assert_available(mmio);
>>>>        trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>>>>          if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>>>> @@ -194,6 +204,7 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>>>>        u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>>>        u32 val;
>>>>    +    mmio_assert_available(mmio);
>>>>        mmio_flush_pending_writes(mmio);
>>>>          if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>>>
>>
> 

