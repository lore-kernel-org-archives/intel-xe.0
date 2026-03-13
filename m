Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20709107BCD9
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 20:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D089210E455;
	Fri, 13 Mar 2026 20:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeHMnxBW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EE410E455
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773433879; x=1804969879;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YFN3/Yq3iIolTc1yTmauWtVB1RuIzcpZoQ7Xq1s7pZY=;
 b=CeHMnxBWstnEYFaXSQgW23Xl7ZKEcNKLv+wJyNEccK53pfC5I5lKVZ7+
 S5EoHLk+77hqaCvT0rBRLD4pUkIV892DuZAGtyquAYrhI24kQm0j1HBtm
 bhTconNk3021PdFsSJRt+IQb5J0aNDpiP36xQKaed0UnOgegGGkcDarTY
 +chC54ivLO71PCgucqgZ4nVbKFYEnQtk2UqBQYOMmYOZUU2Gvt23JoG4F
 r4x1FKAIhJ8KXJ2jnRK0B65E31RFjyfQH0uQOUiigKKkaLbTvf+b+ysgr
 PuPdah2NVIFqx2sNUxccULohxtg7QjFXkDgHgN8R1T8uk+Cft1wkAyu0F g==;
X-CSE-ConnectionGUID: jqI9WMz3S3Cdr4BHrM305w==
X-CSE-MsgGUID: kUABkQIuQYafODqlN8L0tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="78439455"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="78439455"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 13:31:16 -0700
X-CSE-ConnectionGUID: pYudZ/HHRWafnCcdiK7hqw==
X-CSE-MsgGUID: 1Ax4HGElRRacgGrEaXdF/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="221350929"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 13:31:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 13:31:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 13:31:14 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 13:31:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsmnGyGrCRQBxhzsCcjXU9or4tKXm7Btk8l2zziRoQRlIJVzmYzrtNIhrg6+Z0+0gqoeT5hUat0ApGmxd3515+HVgpzdcikATyN1dz1MnPFeSL9H8O/mdnT/YkcnsQyNS13YF7l1HF1NtMff7ZdxywFO0SOwhSvzF/AnBoINoGztTiWC2uOhCiFsuLQ6D+ByFzJ5Y8KZ+h78g3AsLvs1Oz2KPL31bpDQf0Gl71veBuBxe9mU2btA1luP+XsJQ8lUqJH8n20TmAEPQXaf4UkRnj1uhNbDLgR+PhT+48703UwVqySjjGqcIY/baLODCWcX979wPQ5Nh2QvZBz9N6Buow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmKxoCCizCgY9Mqy7t193UvqpkWS/nKqKPIVU4ARg98=;
 b=FfPcZsAbsACki6LOanuxpI3gWJXgTWEm8Nt7EB12VY7BG5ZgXPjc4QdITX60QMMW0/jD6oEvhA5N/MGO+0QTpcoG5Cy/mLVC55SJ71dLAwT43LHDE9eGI9Ghoi1VR9+fHHg0dYmY59X9elXX5Iex/UJEoxEjQXolZqMgYE4aThKuAleq0uIeifa9vEb6aR0gzNkJg4DqJaWs/ROVRMf6sv4ODPNRglGmWk7e6Lm5ZRRgQBLhtCtVM2fRTid6y63IfTAt9evz/uT/Dtw4t+gbRx1NB8g3/+okshQKPp4wStzVNEBde+3YWrYUxBjUESf0pt6Brqupu+eo25UR7arENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH3PR11MB7346.namprd11.prod.outlook.com (2603:10b6:610:152::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 20:31:11 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 20:31:10 +0000
Message-ID: <70de5c7f-01e9-4ecb-b26c-3348b31a8a40@intel.com>
Date: Fri, 13 Mar 2026 16:31:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] drm/xe: Trigger queue cleanup if not in wedged
 mode 2
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stable@vger.kernel.org>
References: <20260310225039.1320161-1-zhanjun.dong@intel.com>
 <20260310225039.1320161-4-zhanjun.dong@intel.com>
 <e9979dfc-eaab-413e-963f-a50985018e18@intel.com>
 <abRcHpXsfB/YVC3e@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <abRcHpXsfB/YVC3e@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH3PR11MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bba1cf1-49f7-4133-09bf-08de813f7686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: fx1sKz9Al0zPSq2JTTlK/PcekmlhqdKylKnpeg7oskSeC9Xm2wB3JxfQWCQoWj22p2z0hoUF3X338ag5wWd9fkCn0XqMoIIaaWJ21b/MOel9iUu+voKwBxjtOEXYgkOUmbiomzCXj1ubdAxAriwLB5jkc8Ixne7riCtbdFXxFYsJx7Kyw3LwpDFhnH2wnXxAut1dNHdFHBmlTTnPdxXK0kEJNPIpxMSrmUmSbQAKXkIfb1fwAetAgq0SsCw208cnDUffpgdakA6C389DIbilaWCzX3PoOIgJjyrR/yD8LjkJeDCEHSZzQt7t0ipA4zXSyEMCUOm8DG7Gb2jNPCXrFNSp3ak6vSlKWozdNBkFJ0clQvN3gXvzMeymzyjqSj3G7iArVTbSWOl4tZUemjdY4G03ujs+6O9ojbZWrfIowQP7QdVMQuum5owJ90B38j1JyxqnqRhqnNilEUW1c6jJXVuAoo3MH9Bkk+W8tT+uNS0fupVJFPhEZdryNxvjHA4fDrGo2Hhx1e2JMQgeJi/yWNsyLU3LwYON2sopGBOkxFvCNpHGNDrKyH4aqFulKfdEbC1t8O/OhRmndp2hjiHWZZIS1MkjzCH3j7RXY9tMX55f+dlDXQ0cRiikddwiO/J5n6Hr5VN2fsioXgTiLoV/wmx/8pC9ZN+xrkOj/2OzzxB3Y7H38m2YP8g7leUSmI99JnwPNjTCR2Vhzoi/QBS6szVQpCO+zSa1LRoHHTy3Z2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REp3cU1LVzR1ZERGc3JzQ24rVnA1ZThHcWpYLy81ZFo4cVlQdUFoMFdEdDVn?=
 =?utf-8?B?UVVuT0pJdFVLR1BpRUdwL0VaT2wybjMyUTFkT3VGbzBSYTdkMWdWaVJvRzNz?=
 =?utf-8?B?WXNRekZnRHRKU1h6UFVnYU55UHhSQ2VzdjJtVzZmYjBENUpDV0NnK3kzK2tr?=
 =?utf-8?B?WDEzanpQaHNBZVpQY2ozRHk5NWZaTWpFVGtNdURHNUlZeExqZmJDTDRSem9K?=
 =?utf-8?B?UHY2Mk44NWc4OUpnN3o2aHBOdFlFdE1RN3FEVVR1eS9qcTFoOWVGYmZlN0hx?=
 =?utf-8?B?b1cvZWI5aEpSRnZnUUpROU1YTjV0YmxMcTBZSWRYb0lOWkMyQ1N1WHVBRnNQ?=
 =?utf-8?B?Ui9KSFl2TTk2ODBWaVhvcFA3cEFJNzh6TXhmZUs1V210VlBNRHVzQmQrUm9Z?=
 =?utf-8?B?eis5cFRMdm9IVjhObkFpSVB6T3N2SlVjTHBsREgzYTR1VnBBQit1ZjEvNWll?=
 =?utf-8?B?K05KMlF1VzRpMWs5ajdxKzdFQ2hsVkJ1c0JXenl1ZzV4cEVGMUJQeU14bFNm?=
 =?utf-8?B?U1N6UXZVNDYycW5BVHhCR3c3d1BXbFVTREtIdzg4dld2VU4zaDhRZDR6TVpM?=
 =?utf-8?B?TTB4ckQyaTZMcFh6TkpkeGtmSXBzYWVhZXp3MHcySS9Lcno2Y0g0dVdYd0ly?=
 =?utf-8?B?dHpHSzhsSk9yYm9Xek1mZ1M5eithNFNxdy9ncHRScHJqeHVhRFh1K3p3Z1cw?=
 =?utf-8?B?RDJ1cjJsZ3VIbkpVejRKNnhIcmlNWlIrNWhoZTF0WUIwUUVMMWZtQ2grZ29t?=
 =?utf-8?B?akpEL3RGQk5NcjJPNFlsUnpMR2JHeVRNTzJDdU5zODZQRUxaV1hVVzdkRSsv?=
 =?utf-8?B?LzA1cklUVVZDOUFjWVBGU3J5ODVyOHZRTkRrS0RqZE5UR2dMN2thY0orVzBE?=
 =?utf-8?B?MFpmeTFZRk5SRFB2bHh4TElXSTQzKzAvY3Z6TEE1U3l4enZUMjNFd2Z2RExB?=
 =?utf-8?B?emp6QzZCbUVxWlZSS2JlWW1PR1hjWGNRMEIrK3hMd1pub1VyQ2FkM3IrT25U?=
 =?utf-8?B?amZHVk1ITk5SNE51UG9QeCs0azV2SFZGaE5Bb3pwTklRVXl4VjdRSFVPZng4?=
 =?utf-8?B?Mzk1QWszTWVDamVWU0NWUnFRTUN6RHJCLzh0bi9kZXNQS0g5UkRvcW5UNXUx?=
 =?utf-8?B?V3RUUWQxQ3BZaUNjNWE5YWdIZTBwSjVyQ2kvdFpaSVZCSCtUZGpQVmM1T3dx?=
 =?utf-8?B?cG1JU1ZlSXkyNXpYRTVvNWJub1JRaElXVy9QZUoxaTk1TWMzZC95TjlZbHF6?=
 =?utf-8?B?L2hsTEZlc21iRG1SKzFrc25HY1VCNS9ZQ2xmTkZKUjR5Mk5CMVVqSktuaGFC?=
 =?utf-8?B?RUNhUjZGUXBJREdxa0pEYjh5NDJRem5uajZDaWpZOXB2YUI5eHhmaVlZV2d5?=
 =?utf-8?B?Q1FoNExqaERVSitWY2cxN3RSSkw4ZElFZEFOYlQrYURleGdWZDNEQWdoVzhU?=
 =?utf-8?B?UWhmVTB4YnBaVnBSeWxKbXI4Y0d1YlVpK3lOUGNEMWxMcHFzWVJIR1VPb2Nn?=
 =?utf-8?B?VVNDNFZBc2FRY3d6NzRtL3hUZ0cxUkhtNXRDZ3p2MWU2bUN5cU0rZ2E4Um5U?=
 =?utf-8?B?OStoNUtCUUxnZXdPVHluYzl6SG0wZGhVdUE5V2tWdHdpeC92TE9xeUVHRTNq?=
 =?utf-8?B?UDJaeERjSUUvN0V5RGZCd0VUTUxqcUJwblVtMDQxSUpPL1prVXZjaXI5czZL?=
 =?utf-8?B?ckJrMmtNR1pqZ1NnVzIvV1RFQnNZZFN5OE1IV0ZPWmFkY3hTRTMwK0NXQVFR?=
 =?utf-8?B?N2JtUmV3aE1jSkxOYU1xckcvU1R0TTJ4VDE4T0VFM2NtU2pCcXI3MEh3dXVY?=
 =?utf-8?B?NDlaY2NtQ0UyQzRIbUJBYmFQajA2QWlZTjMxclBFYmdvTlYxS210ZGJDdWRn?=
 =?utf-8?B?YlRoMmpnSzlxWmNSeG80V0s4YWUyL1doemNTVXNkVVk3TEJySWVFNUlURmdh?=
 =?utf-8?B?YnBjdkFRT3pXTm13clVUejVYVmFwM0cxRmIyZjNWK29TNzJnZDhYWXh4cmcx?=
 =?utf-8?B?VVJVV0lObGpkcEJDWitLdE1MbVhiYms5YXk4cEs1VWxJWDNEbnV3cUN4Vko3?=
 =?utf-8?B?QVpuQjFPeU5hRG94MDMzRG1VUWMwelpnZ0tScFBYMnBHRUxmdWx5NTVZUHVQ?=
 =?utf-8?B?alVQc3pYdUkxUHA0ZExGNVMySjY1Zi9DU3d4SEc1UnhDUjQxbGhWTnZTZ1pN?=
 =?utf-8?B?Z0pTbHR5Smh6UkladTV2UHkvd0VWSUwvdWdVb2N3ZHZpWkxCakFuWFhPVU9F?=
 =?utf-8?B?L3dZTHlpYmZnbXZXb3lUQmJIQUVYZGVWSkhKQzc5bzhqNkJNV1JOM1NDY0Uz?=
 =?utf-8?B?U3VzOWNtb2ZPd1JzTWF3MVNZUGFtdGtYaHVQY0RTUUQ0WnB6amRoK0d3SU9j?=
 =?utf-8?Q?rvMVVeHMoiYUx3AA=3D?=
X-Exchange-RoutingPolicyChecked: XjqHFKOQv6q/FKnd/Y74qlXm4M9/m72rZZJdFb2TxLeTjJwo11DaRXLAbO5dB3i5MC/vCPJPZ0gEaMwLFKU4SLsf3DIBVQ1HMJnhWZFkFG/cwBh6b4zvWP6ez3ShwP4goe3oVqRltNpAZHPyoHtlrS1B5rNf5gnNmZoMyFn3FdT/cgR8oV1FHRezlQpxQHsnmWJZc4ubJuhF0Ib54HgoRLCU6axjwanRlm861Ky6BfzSOywvmBqZdspbCtmDJ356UjqIfqEfDM8uv7Y9gDIf5b/oqvBz4B+yNVjJ4Qr8Bhuj8PWc3ImpVU+z5R5BS2QbEL/SOVUduYubjY8/F/ITNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bba1cf1-49f7-4133-09bf-08de813f7686
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 20:31:10.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaFyHy7lcUIruK7hTJamweK6JEQt+RmqMayjTmxNn8mFb2tcTe6DiOeOdTEFNACIB7jXQLUDzoQa37+ZrXeCeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7346
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

LGTM

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>


On 2026-03-13 2:49 p.m., Matthew Brost wrote:
> On Wed, Mar 11, 2026 at 12:33:54PM -0400, Dong, Zhanjun wrote:
>>
>>
>> On 2026-03-10 6:50 p.m., Zhanjun Dong wrote:
>>> The intent of wedging a device is to allow queues to continue running
>>> only in wedged mode 2. In other modes, queues should initiate cleanup
>>> and signal all remaining fences. Fix xe_guc_submit_wedge to correctly
>>> clean up queues when wedge mode != 2.
>>>
>>> Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 35 +++++++++++++++++++-----------
>>>    1 file changed, 22 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 8afd424b27fb..cb32053d57ec 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -1319,6 +1319,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>>     */
>>>    void xe_guc_submit_wedge(struct xe_guc *guc)
>>>    {
>>> +	struct xe_device *xe = guc_to_xe(guc);
>>>    	struct xe_gt *gt = guc_to_gt(guc);
>>>    	struct xe_exec_queue *q;
>>>    	unsigned long index;
>>> @@ -1333,20 +1334,28 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>>>    	if (!guc->submission_state.initialized)
>>>    		return;
>>> -	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>>> -				       guc_submit_wedged_fini, guc);
>>> -	if (err) {
>>> -		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
>>> -			  "Although device is wedged.\n",
>>> -			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
>>> -		return;
>>> -	}
>>> +	if (xe->wedged.mode == 2) {
>>> +		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>>> +					       guc_submit_wedged_fini, guc);
>>> +		if (err) {
>>> +			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
>>> +				  "Although device is wedged.\n");
>>> +			return;
>>> +		}
>>> -	mutex_lock(&guc->submission_state.lock);
>>> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>>> -		if (xe_exec_queue_get_unless_zero(q))
>>> -			set_exec_queue_wedged(q);
>>> -	mutex_unlock(&guc->submission_state.lock);
>>> +		mutex_lock(&guc->submission_state.lock);
>>> +		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>>> +			if (xe_exec_queue_get_unless_zero(q))
>>> +				set_exec_queue_wedged(q);
>>> +		mutex_unlock(&guc->submission_state.lock);
>>> +	} else {
>>> +		/* Forcefully kill any remaining exec queues, signal fences */
>> Q: Shall we do VF bypass here?
>>
> 
> Same answer as last patch - no.
> 
> Matt
> 
>> Regards,
>> Zhanjun Dong
>>> +		guc_submit_reset_prepare(guc);
>>> +		xe_guc_submit_stop(guc);
>>> +		xe_guc_softreset(guc);
>>> +		xe_uc_fw_sanitize(&guc->fw);
>>> +		xe_guc_submit_pause_abort(guc);
>>> +	}
>>>    }
>>>    static bool guc_submit_hint_wedged(struct xe_guc *guc)
>>

