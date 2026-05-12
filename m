Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57FCCD484E
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 05:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6617A10E10F;
	Tue, 12 May 2026 05:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egeVjx5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1215010E10F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 05:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778563688; x=1810099688;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1NZaEfDHVBfcntv4gy7c02KZ1ENh9qXRrZ67DQ4ftzs=;
 b=egeVjx5ovZFoQ9IKpfWEKsMGqnJkJ6GijZTKfPMUqEThgxGQ5f5OIYnA
 kedpe3Q6Z3ovOxU/0u5mFMXf4B2VQavlWk0Nz8t8/MAUBLZ1t7fzcrqUd
 LrTWPo25DtDmbd9VSRQ4Y3B4sOl2GwpOVZp9M2tRHtEqHZjcH6ZcuSzKX
 JKXwr841fWepewf0YdKOHXDR3a1X+RBUvq7oJV6HdJ6b4cJH7NAs1fd7F
 4UYMW8r0msjK2MFKNjwJznxdkSJR66rrqBXcIQF2iFELypYJVJ/BTWiqN
 t2gdg+AgJ1/ZtdSCMg+adhld54hvUg87Z1dIQk/nK3gpaIvvY3PqDgt00 Q==;
X-CSE-ConnectionGUID: E+gA/eDaTIqI4JkMBJ+9bA==
X-CSE-MsgGUID: JviCWLaaRai12PZ7WXB/Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89766408"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="89766408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:28:08 -0700
X-CSE-ConnectionGUID: hAOWtZSQRg2mXBotwWdThw==
X-CSE-MsgGUID: JtnzNn1UQh6kjxiqVxilIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="233350232"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:28:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 22:28:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 22:28:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 22:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCDvn9xnpT2zil5dsd6zVyvvKN7JANvnuPJC+kGC50yMh3Vww6qbcN26xPtz4XH3PFxDnM0FnZ2SdDd7ahAyHyc9txXLLqSCSiiCdngR4CtjmkqNHlsdajuC2Uhhw5+yZVTQb/Vf0dAMNfx80/exLoLuZhD3QuQ06jGxokr0OpawEeg7wfr1c0GwqE32ueU0EzWBD2kipcA7D0IZICQ/l6Lxd4Vxmj2XGKZCdgeWRaKgNsv10ljEB3ECHdS6rdC+BPPmiDe7mXsfSKIbncZ24gP91MbLbMrwqz4hPuCZMITZFSwpYOW7hnWcQOuJoUZJfPXAHLtOk1lSzjWDwMVDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxTjLiX7Ydca6iDJ05uMiWz59C12M+8RMvyPGLaonCM=;
 b=eYupFa2Y5ZD2oWohV8+QZBOXgiaYgKNgci9X80e7XxPnm9X9VkEHJ7KfkGGlkEM1NKBPykKgogxD9wCA+cPcaP7cyXNgtnF0Szax6hXHoxP8CKb8jqi2nNuHs9xpZ7zaXXt65BwCTcjZlkYszXevtmGoT/5NnY2ydDVZyD6AhuMUfUuEB6P9w2n3JY2reKo00hEeyYKkJ2m1Zu+ukyz0OYP2sFNYmuG9UL09mBWN3/8O4RHpIn5F+Q9jRn6YeVOzRPmWs8E7pDf6vDjPnwHZTCKoIyEDTGeQ/OW+O3/UcRYL/fsA2g0xBP4iXF17UQpChwfzQC4BjBNYUDp6oz4s8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPFF1A08ABF9.namprd11.prod.outlook.com (2603:10b6:518:1::d5f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 05:27:59 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 05:27:58 +0000
Message-ID: <c25d46c5-8c40-4665-9472-d1c84fbaf996@intel.com>
Date: Tue, 12 May 2026 10:57:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/xe/xe_ras: Add support to get error counter in
 CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-10-riana.tauro@intel.com>
 <agH1Xch7B6Ube4_5@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <agH1Xch7B6Ube4_5@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPFF1A08ABF9:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bcdb1a-58dd-4681-e32f-08deafe73a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: LRuow3iiD2Zy/QgcJBdn4Ih6AsshA6ZEZPXd6dJKdTe1/b7tckDjUhJNDfpyv91qV6HXH8dHiluUIlkAirbZT49J9qFUnkGCXVCVtQlu8EfP+IhOkZi/XrFX4le5nBEg5W1FBM9MTt29qEQUZwj4ZZMBkNlYBnEHfec8qTN5tWtarxB/34Vp+na7xkeVyoM5vSAIaWUQJmdXXaCjPjwQE+yzXnVOFtRJHxR49LvIrrpOyh6PL2drIjrTyHk6v9MHJcKHRY0zsuoXduXTaDRnR71oMpautsrNLh1YvqcIjKkSyosRApuXMlyeZlx+uUwTJvD6BqOo4Om9QnoO9PfhDQbReMyRRH12sDBjCV6iU56Bfonjtheu3QGQDkjOL4R+7p3tnxs0JtaEA5Sl+qU8foZnQRH0PquOeeWLBepiNdqVjwO1iNntE4gElg2iKP7tx1ynYvZB3eqfhztrR/Cp2fsP7vTd9Senv/OSEiaXDP9dteXOVEJ9y6VUBbMfsvIxf5QttwekFgJD7PtxhFD8b9kIsVSLSKkno+d3ZhI4Adokaxqu6R4runlXGWaw9ZfuV0hswiHnDq22FXfak7Uu4HqgDuUalnhyiSo0l8HYdQMWjR/eKONDjCwS14/rez4iqUq1FENTK9ZzWbv4uXnxU1mB5GirWtKnkoSuKHgkvnAGLQ9R9X5C93qO51SXw6rN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(11063799003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2hJR3l1TDRmbnk2VHZMVzJyTmJLdGMvelZvZHV5T0ljNlNNY2NoS1JiRlVP?=
 =?utf-8?B?d09ic0VsVk1lRVpqSUlxNVJ4RERHeVhWRkVUaDBieUJXdENBay80ZnVRUlJD?=
 =?utf-8?B?eEM5RjlURnhRVXBNS0dGOFdadlkyU2Q2ajBlWXQ2WGlqY3JBR1ZXVWQ0QnIz?=
 =?utf-8?B?WjNlam1VK2VNbnZvU2pDVTRmSzc3ajBwSGNyR0NmY3plYmhaa0JkK1pNN3po?=
 =?utf-8?B?K0lKMHlPY3g1SW1FTXhHVWtQWUZRN29sOU92TG93VTYvaWFlRXFXMkVPZnBZ?=
 =?utf-8?B?eUhGYzI4UmRJeTI0bVJTZHBoZm1LWDZvTDdHTzEzOUtUMXF3aU9VOXF0TzVK?=
 =?utf-8?B?K0ZqY0ZudlR0SmVWY3ZNQ0JTcm1oZjk3Y0kxY0g3MUVXN1JNWnhhSEcyTXU0?=
 =?utf-8?B?NlJlMnRqaDhsMXVnZ2E0dnhwalU0UlhtaHhuSm1HU2Y2bUNNZmJ1RjgrZFJx?=
 =?utf-8?B?anREdXRLMWdYUCtGcXkyVnc2WlV3U3ZleUprTFo2OFpEdVMxdWV3N0xwenpG?=
 =?utf-8?B?UlZiay9ESllMa254Ukc2SEZVY09hdnF1OU05RGFkK29hQTVGRjlyOURQVVlL?=
 =?utf-8?B?dkVRUEpWQ3FrRytjL2NSVXkrTU03dm9OU2NmWnFVZTI0NFh4ejdEeHBYZ0Fy?=
 =?utf-8?B?Z3NKRVczeHh2Ymt2cEtVL0NpazgzMWU4S0Z5T1YyWGI3THVEQ3k5ZXZiM0xv?=
 =?utf-8?B?aVNYME11RExFTFR6OC9BVkhNNHNhSjBoZDVJUXIrOGRLZnQ3eDNQTmxnQ1ps?=
 =?utf-8?B?aW5acElZakpXdGxQR0IxSXNPTHVMQnZzbXhXNGxZaWU1a0RaL0V4RlJZaWpS?=
 =?utf-8?B?dFFpQnNIVjlaanRMWUxPK1hSbXFpUkRLQjMxaENLZWZKSDl2bUxlaTZIMWR6?=
 =?utf-8?B?SG5DQ25vWXFPeDJsTkFIdis3VkJzVjlyaTdzYjJuYnNYNUNVT0o1ZC9sVTNR?=
 =?utf-8?B?czlieklQK1JDMmJzUHZQQ2htbTRIZ1JhdFgranJyY1YrQlUxMW1uaHEzUzlR?=
 =?utf-8?B?QU03U09ja0I4ZCtSVytlcmxVVDBoSDV1aWNiejAyUlNlRVhZbkZnenJ0M0Vx?=
 =?utf-8?B?MHgzVStHWnhJL01ka0dmRS9Fc3JjcDZxY1FnREVjRnlaTmhWUmxZakJmVWt3?=
 =?utf-8?B?akhmOEp2eDBkTS9JVUVhQktwQzVaaFVBRzhTYTFBZExiRjlidURRd0poV0RP?=
 =?utf-8?B?bWdwaHNXdThZcm5LQW10UGI2akJ2aDZXd2NBbE5jSmZOR1JDTWF3azlYNWF0?=
 =?utf-8?B?Sk00Y2l4bHNVTEVHZElTaytYV29tSUZSN1lJYXJaK3hkc0NvYmlNR1FWb3Vx?=
 =?utf-8?B?YnZwNSt6WGZMUkNESXZueHB1U0M2TUQ5cmRZeDN4YndhVEkrTC9keURuRU1Q?=
 =?utf-8?B?Smg1elBwYktGVk8vVVZLTmMra29ia2pGUzhTZzdWd1JlQ1pacVI2TUtVbGJ2?=
 =?utf-8?B?TDlyQ2dpNmVLZE1XV3BDODdSL1BGRzQ3djFKcTZMcTVHdTVSUmU0UG5HTFA0?=
 =?utf-8?B?MkZxM2JBN3Q5eW8vRjBjdGVEUnRIYUxVdVk5bFRLemNDZFh1Q3hWemxqTDI3?=
 =?utf-8?B?TUowT0FyMTAwUHdOTE0xWVNCalZQcEQ5VGRJeEJ0MUxsU0ZqV1dDMWd6Q2k4?=
 =?utf-8?B?aTNhcUFXbnNmdjZEN281VXZBckRwejg5ZHNDOWVPUnZsbUdPMjBSQk5FV3F1?=
 =?utf-8?B?Vm9JUGQzQUt2ZU9DQnp4aXdTT1kvZCtYWk5PUk1LSVNDdGlnaXIyZjhVWTY1?=
 =?utf-8?B?WjVZUFk3RTZsZEIxT3pWWGtud3o3OU9NVUNlRDZTN2ttTC9kSDh6VUMrSTBs?=
 =?utf-8?B?TWdSWTFTeUtkQVoxVmlVV0ZCMllWUE00M0Ruby9wa1k4Z3ZpY2RnbmRNR09F?=
 =?utf-8?B?a3RoMWc3SFF2VWUrR294Vi9hT3hWQ3ZaUlZXMDNDMnRjV1l6NU1VZ2dud1lm?=
 =?utf-8?B?OUdqMWxFcVhCOFpvSW10UTZra1R4dVBOYXp6NW5nQ0xrSDh3UkVDeHhBc2Yz?=
 =?utf-8?B?U0JrbzhYWnNreVl5TEZ2NDNQanVBeEpBOXIyK2dRL28vMERvL3Y4Zm01MGl4?=
 =?utf-8?B?VU1ZREcwMG12dHdwRU1lOU9CeG9DYVdNaEEwSWovRlhsdisxbE5mbDZTOUJB?=
 =?utf-8?B?YkQvdmE1Rml4WjFKdW9sWkljUHNNNWZQQzc4N2lZLytxOVhuenU1RHA3N29Y?=
 =?utf-8?B?R3VCZGJNQnl4SnRHN2d3VFkzdlVBUkpnOE45bzkzTUlLcmVSdksySEFtN3Jz?=
 =?utf-8?B?ejk4dUNUOFl0aU1zb0RVeXBCZEphb2dqbEdCaFk3dW9IdVhPOXFtU3hJVjdD?=
 =?utf-8?B?QVFJbDFpL2xRY3M0amxXZ2xwUVVlK1JzVFFnUHh1ODA0amExcjZwdz09?=
X-Exchange-RoutingPolicyChecked: Fd45viAYmnCcPlmNdZYyArgutdmNVT+jVylABg7twVgBLKtOa7EGgMx721yEuj+nbOCCCGbcvC3+IvdeNaVkJ5m0aUYDbqIO51uAsN6SLFVJejMRrfRflNt9Jvb3sXyFxLgw/kaHuk9ok+N9KHkVxhpeWCLvyCieWom+Etk2kcRsIP022PKDJkb+U0S/wZbPd/US2pr8OEeET0pfX25XREFqZF0pDr2n9I/4ErRHlsgxndYrL27NOohRzHt5hMvYNwDPpeAFKPNY+g/Uwg425ftQ5WD4QDvlIYnZvWNQMTzL9/EvEnnFaTqOXOW1rHtVrDTfVTN6K/JLV+5PESA3Rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bcdb1a-58dd-4681-e32f-08deafe73a45
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 05:27:58.4776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lBTqdrbMO4BLn0Hf1G2gylCoy+3Ys19EY/1nT/2yKirH8SJ/XcGWdhT5Pz4IOBY2WSEQn2vXw3zDNICJKSlxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF1A08ABF9
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


On 5/11/2026 8:57 PM, Raag Jadav wrote:
> On Mon, May 04, 2026 at 12:26:17PM +0530, Riana Tauro wrote:
>> Add request/response structures and helper functions to query system
>> controller to get error counter value.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add structures for clear counter
>>      move commands to sysctrl file
>>      split functions
>>      fix commit message (Raag)
>>
>> v3: fix log message
>>      squash patches
>>      change error code for sysctrl error (Raag)
>>
>> v4: rename function
>>      remove unecessary macro (Raag)
>>      add documentation for enum
>>
>> v5: rebase
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 91 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |  4 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 30 ++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>>   4 files changed, 127 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 4cb16b419b0c..47a58ce3b3ca 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -4,11 +4,14 @@
>>    */
>>   
>>   #include "xe_device.h"
>> +#include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_ras_types.h"
>>   #include "xe_sysctrl.h"
>>   #include "xe_sysctrl_event_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>>   
>>   /* Severity of detected errors  */
>>   enum xe_ras_severity {
>> @@ -50,6 +53,23 @@ static const char *const xe_ras_components[] = {
>>   };
>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>   
>> +/* Mapping from drm_xe_ras_error_component to xe_ras_component */
>> +static const int drm_to_xe_ras_component[] = {
>> +	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
>> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL]	= XE_RAS_COMP_SOC_INTERNAL,
>> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY]	= XE_RAS_COMP_DEVICE_MEMORY,
>> +	[DRM_XE_RAS_ERR_COMP_PCIE]		= XE_RAS_COMP_PCIE,
>> +	[DRM_XE_RAS_ERR_COMP_FABRIC]		= XE_RAS_COMP_FABRIC
>> +};
>> +static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);
>> +
>> +/* Mapping from drm_xe_ras_error_severity to xe_ras_severity */
>> +static const int drm_to_xe_ras_severity[] = {
>> +	[DRM_XE_RAS_ERR_SEV_CORRECTABLE]	= XE_RAS_SEV_CORRECTABLE,
>> +	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE]	= XE_RAS_SEV_UNCORRECTABLE
>> +};
>> +static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
> So we don't accept new entries unless also added in uapi and vice versa
> which is good, but if you feel the need to have bounds checking just
> switch() instead.

If i move this to switch, there will be inconsistency with the component 
array.
The component array has multiple entries so array is preferable.
Also bounds check is already done in upper layers for this so not needed.

>
>>   static inline const char *sev_to_str(u8 severity)
>>   {
>>   	if (severity >= XE_RAS_SEV_MAX)
>> @@ -66,6 +86,22 @@ static inline const char *comp_to_str(u8 component)
>>   	return xe_ras_components[component];
>>   }
>>   
>> +static void prepare_ras_command(struct xe_sysctrl_mailbox_command *command,
> This looks like it should be a sysctrl helper (for non-RAS mailbox users).

We do not have any non-ras users. We can move if we need it

>
>> +				u32 cmd, void *request, size_t request_len,
>> +				void *response, size_t response_len)
>> +{
>> +	struct xe_sysctrl_app_msg_hdr header = {0};
>> +
>> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
>> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd);
>> +
>> +	command->header = header;
>> +	command->data_in = request;
>> +	command->data_in_len = request_len;
>> +	command->data_out = response;
>> +	command->data_out_len = response_len;
>> +}
>> +
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response)
>>   {
>> @@ -91,3 +127,58 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   			comp_to_str(component), sev_to_str(severity));
>>   	}
>>   }
>> +
>> +static int get_counter(struct xe_device *xe, struct xe_ras_error_class *error_class,
> s/error_class/counter
>
> Single word parameters usually help with wrapping but ofcourse it's a
> personal preference.
okay
>
>> +		       u32 *value)
>> +{
>> +	struct xe_ras_get_counter_response response = {0};
>> +	struct xe_ras_get_counter_request request = {0};
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	request.error_class = *error_class;
>> +
>> +	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_COUNTER, &request, sizeof(request),
>> +			    &response, sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: failed to get counter %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>> +		return -EIO;
>> +	}
>> +
>> +	*value = response.counter_value;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_ras_get_counter() - Get error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be queried
>> + * @error_id: Error component to be queried
>> + * @value: Counter value
>> + *
>> + * This function retrieves the value of a specific error counter based on
>> + * the error severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> const for consistency.

We do not need const since it's passed by value
consistency ? the upper layer does not have a const

Thanks
Riana

>
> Raag
>
>> +		       u32 error_id, u32 *value)
>> +{
>> +	struct xe_ras_error_class error_class = {0};
>> +
>> +	error_class.common.severity = drm_to_xe_ras_severity[severity];
>> +	error_class.common.component = drm_to_xe_ras_component[error_id];
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	return get_counter(xe, &error_class, value);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index ea90593b62dc..74582c911b02 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,10 +6,14 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>>   
>> +#include <uapi/drm/xe_drm.h>
>> +
>>   struct xe_device;
>>   struct xe_sysctrl_event_response;
>>   
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response);
>> +int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
>> +		       u32 error_id, u32 *value);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 4e63c67f806a..74d85875cd63 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -70,4 +70,34 @@ struct xe_ras_threshold_crossed {
>>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_get_counter_request - Request for get error counter
>> + */
>> +struct xe_ras_get_counter_request {
>> +	/** @error_class: Error class counter to be queried */
>> +	struct xe_ras_error_class error_class;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_counter_response - Response for get error counter
>> + */
>> +struct xe_ras_get_counter_response {
>> +	/** @error_class: Error class counter that was queried */
>> +	struct xe_ras_error_class error_class;
>> +	/** @counter_value: Current counter value */
>> +	u32 counter_value;
>> +	/** @timestamp: Timestamp when counter was last updated */
>> +	u64 timestamp;
>> +	/** @threshold_value: Threshold value for the counter */
>> +	u32 threshold_value;
>> +	/** @counter_status: Status of the counter */
>> +	u32 counter_status:8;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:24;
>> +	/** @reserved1: Reserved for future use */
>> +	u32 reserved1[56];
>> +} __packed;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 84d7c647e743..b315847cbf64 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>>   /**
>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>    *
>> + * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>> +	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>>   };
>>   
>> -- 
>> 2.47.1
>>
