Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C7C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE3410F55A;
	Fri, 14 Aug 2026 10:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikwMlvZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C716210F53B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786702823; x=1818238823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/aJfII3pwj7txdGWhTBMt9tTKEayJ6aghYiDOzv5haI=;
 b=ikwMlvZwM2+XIKv7L7tGG6IC0YFwSiV80Xmdbqwaa/UYdgtFpVGSi2YE
 jSyLv3Q+ybZdQ2y3VxECDON9aZOGZOXInTMNobMjBz9uW13lkA8s+Hoa+
 okzoorvEVwr29GJnw3nW555SJ710jiiCb/Y3ODbkxxxB9QjGpz4nHfQzn
 qu60LnwcGNYoL/NIwt0IJapFsybp6RXcyfuYNFE64qoJtFfzukpiEw0Re
 Lrhsm992ALP/MftLv84EQfexgdbN3lj/1NTeOHsdwtWnv01Jnqswnf43K
 ipjsCgvHF7dffSLsyUVqa28ZBmgW03Jj29yMKPNp9XXE7yxFi3HtlJs4o w==;
X-CSE-ConnectionGUID: EcbVyCXMQ6OoB3qyRIWIRQ==
X-CSE-MsgGUID: c9QoqMybS7OLXKqCNUfYpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="112825707"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="112825707"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:20:22 -0700
X-CSE-ConnectionGUID: +PyZ6JOATcKl0eklCAh6Cw==
X-CSE-MsgGUID: +3wERfKpS9ma1qlEgobToQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="294126204"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:20:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:20:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:20:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:20:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYFUc582EJ3rI86wbYsi++PV+k7XkdfeHFcEEPbgLRUh0xcT9FL1cMNX+N9UF3SadUSjwS/LDBF+yzskjHqLsWSWzTRg3uCdlP2/teifrjjHqykrDCX9Sua/EOQ1wdhCIqwu8fvm1+zH341USf8T0kAhHpFPwkT63M0CZQW7/wA5D1Lkb3BWlyD+VsyIz/tWRo1id/4yFZ1NUZUI7anLvtU72wIsFsxYQxQi1hjCed5HTpVvAoCe3JguZGPdw2K3Ov8D10SzCzCDlrvCLBd72LRVf+SgBy9fC8T+htuNMRnOEQwslrkYnN+5VuWX60leiUx9gl5VCHzOg3IMpEGt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la14unDdV/p8iU7TOzMIsTX6ncVHQhLUVyX+0vgiAEQ=;
 b=XZyslRtlfk0cf0GvWm2h+tGFAFkWeZU6olfomWPJ8DfLSuHFJIBn1RXTLWIjOtAiCclzwRFQ0YVehiy5nC6hyvQI0N82m8j2UdspctN42yZNLop++j7uoQkMC80fYhKHNSdHWYFMiPb4x+lExPI5DNIx24WWeoSEVCsXG8Eve4MuWA9NX+T4gPO2vqtVNXhtTeAOCtxNVNvGq6C//4fmuCGUyYewHrQaVS2HsvV3yO467pbLPZJJv1CFtiTGno+n2r+BIoq+IOnCq8HlsDoHwqnRVfbKkM9b9A5DmoYA8kVo4wit8zetnRYQ7DFfx2iWTEiqasmuUm5DLQRzhKbfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 10:20:18 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 10:20:18 +0000
Message-ID: <fa82aca7-1cc8-460e-b7b0-3d11c1729f7d@intel.com>
Date: Fri, 14 Aug 2026 15:50:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
 <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
 <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
 <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
 <a0fe9b9e-95bd-438a-b96f-e9ad1005a8f4@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <a0fe9b9e-95bd-438a-b96f-e9ad1005a8f4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0292.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BN9PR11MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: bb450cc4-c76d-4be3-5de5-08def9eda394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T8H3JgtNskVR0KDY/kV0+DMu1QtsBy7fGzrFsKqSzKDGTKtiz1DFQgRi3lkYaa6HokwJ4OgbiXm1ZYVUyEsj7HbuMDtTsotbyvLY9L3GGXyPKgvntORbMYZ/ab/eDpn0E8KsD7+aKfFvu9sGHvv9YhpNKB6lb7QDl4kGjKDDbceOElK1ncUGWpI7KS1YNDilyy0I6pNhKyIKzhQeEV8HMpH+CTtYKYzzv5pQCY8SH+9YoXaPE90NV05S2iC9c6RrnL3YAnsiRS7vkGmoKcYwghTrGqzO3ajkJgL2XQDeqifOflH5qf4llSAF67Cl1Al4RdmOnyDRmDzcFBujv0+PzNMUxmHY1QCQKXpQ45QGROUwWjMEUujNudCdUFv8qvrjOr/vNo7ahhaSz5RlsBuWa+vCtbfrfELmvVJnudGAn5wyzdWTvBimPKlMdAF20EcjOfS+5fWurcIr1f53Ge6g0K1Fe7ZYdxOfK7gpaaShLfYHC1HvUJYJN0GwllV8fP/2Xgzn/ifXInjOvr0LOYRaEmBU/3eQk1ztXsx+m3eu5/1VBObIwqYmvY1V9ILYhZtcJpp9KHRumE2cLSbsKnCu2P1JggazI6eBDTPJ86QpfUq63ZBy0kn7dFunIrL3uFEs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVVlOWNucjVGdkcxckhoY0U4SmM1dWYvdW5TaDhXYkN5NjFHYzFaQjFaenAz?=
 =?utf-8?B?elZ5YU9id3BLT2xiQk54OFpVenM0RU1XdTZsYUVZN2p5SG90TTRCY2U1WGov?=
 =?utf-8?B?M3ptUHRxbXp4WVBpODIrOVMvU2ppa1hBZ3BYUCt4V2NDSVdERTRmMTdGR3BJ?=
 =?utf-8?B?YzZuSmtpdHZlazFUK1lXdWkxc1NCTU5SeVRZaGhZM1lpby9OR2tpMUM2MlpM?=
 =?utf-8?B?UFRBQzBDeXI5bDVVR1E2NlhlbEh0NENqWVVDbk1PK1BnMFUxQUJ6Z2ZHekNP?=
 =?utf-8?B?dDdtS3ppTzdnR0k2VmI1UEc2Qlh5M045eGxxbU1nMnA0TWQ0RW1IK0tONTls?=
 =?utf-8?B?eHZBZnBmMGFURDYrdVVLSGVWVTJ6eVo3OHN2YXhtUnc1YlB0Rm9MNTk0K1F2?=
 =?utf-8?B?WVpEV1FQRjdDbHVsNGFVenRUdHZqdU02UmpIVVlrQ0FDRWgybDc4UVlVaGtu?=
 =?utf-8?B?YzBLckFXZmpDZlBtUnFBYURWTmx1Q25oWDltaWJuenk1bUJRVGRQakYrYm50?=
 =?utf-8?B?a210N3RPMHVGUzNNUkJ0a1RJYUR3TlMrNlc3QUg3cWVXOTc1dHdaUmNGSWJm?=
 =?utf-8?B?NTlUdkhjMXd6WUFOazE1RTAxMEZtYnBUMTBPUFZKcGVtVUwzd3dqcmpyM1Jt?=
 =?utf-8?B?NW9RaExOUkhKRG1BT3J2VThHaXl4UWlyTmEwTlJIbDNlZlQ4Q0s2U3I4ZCtk?=
 =?utf-8?B?U0tEUHc1Ty9STGdTMHpwYmxQTEc1RmtSdmxHWXdBUVg4ZGlZcENob3VIMDlW?=
 =?utf-8?B?a1BhdjhscFk4dHplUjZQT1FqUEwrZWEzVFVlTGtHSVhjdGdHN09WOGdJVktV?=
 =?utf-8?B?TEhNcWtTajJhTmlKTmh5VzdHOURWWEpRZWg3c0pKYmx4c21DSkFZUlNseWZU?=
 =?utf-8?B?YllXRldESTBzekZBQndLUEFXbDIxUTdoQm1zY3BvcVc1bG9RTVM0TWpsOGR4?=
 =?utf-8?B?NW9PeHpIN2R0ZlZlSDBHL0dobWt5U1dPc1RPMzVMckF0VTAxZlAvRXVrK29R?=
 =?utf-8?B?ZU5yNE1GVEtRczlKTHhzbUJvak5SWGtaK0tzbFFxZ2U3ZnpuVFNTNlhvenY2?=
 =?utf-8?B?N3YxYm5XeG5jYldLSzhuUVh6T1VIYVR2S3p4Nnp4a1NYb3FpNjcyaHhkT1lS?=
 =?utf-8?B?bjUvTnl4bjdOVjI4R0I3SEZNZmRWQ2YyOWwvaHVKT3dFTmdNRkZ1MzliTnNt?=
 =?utf-8?B?UzNlMENrb2dMZm1NNXdqV1ZUYWw2MmV5a0FENWxBdThHWlkyN2dRTjgxK21u?=
 =?utf-8?B?V0Mxbll2a3ZiOHJUUDJWQ2xWTHRzNyt3dlhKUUY3bDJDeU9MZGtoQXE5WTkr?=
 =?utf-8?B?VmNzVmdpWVBQZEl6VkVYcDVaSk54SWg2d2RId0M0Si9uSjhrNHhwMnhqMlB5?=
 =?utf-8?B?a0NiR2JJV1hBWkNNeUtHUEJvby8zQjhjYTIyNnAwTjhDOFpwbGxhTHBrZk9a?=
 =?utf-8?B?T2NnTVcwM3QyRitBL2tZRUtLYmtNUlM3eFJxMVhjdUI0VDBsOUh4cFZtS21u?=
 =?utf-8?B?YUxkRC94NTlzL2s1RFhJSXFhY3RtL3hnOUxlRE1lK3dVSmRib2cwUW95dGJq?=
 =?utf-8?B?WUFjVjg5RkxGZFRXUXlMWWREUytLbHVlOWxMTWZEKzYxOUNBaGRZdkUvYnJm?=
 =?utf-8?B?T0NGblVDcFVDRTlUZFYrUnZNU056ZlhkYmttR2N3UWZPY2E5WHkwYUFRamFI?=
 =?utf-8?B?UkV2c0JxWDBKeFY1aUMvN09GUlEwVjlIcVorcUNWL3BPbktRNG85OGh4RXZB?=
 =?utf-8?B?c0NGYUU5b1BwbXF3RU5nTHRxMWJmeEMvSGVJYWVXZU40WlhNaGRmdkxTWWFL?=
 =?utf-8?B?VU5TUDRWSm9oME02YjlCOEg0NiszNjM5UTBPVkpvM1ovejAyd0d2di9sMWNC?=
 =?utf-8?B?b0JsRjk2WXpWL0puK2NtMzFJNEQ5V1FoTS9Wa2h5SWtWRFlQc2xnNnkvVVRF?=
 =?utf-8?B?cnFmL2V1L0QzdEtNNXBRMjJ1L29qc1RSRWdKZEZYNjNzaDk4NDJKRWJCcnBH?=
 =?utf-8?B?RE0wWjRxVDFxMkhCSEJqUUQvc0ZiUk1VRHNTZ0I2ZW9EUmRmang3ZzQ5WTFs?=
 =?utf-8?B?VFAyVW5TdnFIcTNaNWRGTFFXbHluQXBESnc5YnE0aU95WjFHWXd5VERJZnRy?=
 =?utf-8?B?ODByeXcvZ2pVb01BY3J3SG1sZnVhU1F4QzJMaW4rc0lBYk13bVU3cHN4QTF3?=
 =?utf-8?B?Z2ZCOTFFUFROK3F2Yis3RGxvU2J2R2xiZE9zdkZMTG91Rm1sajBmL0lrbHB3?=
 =?utf-8?B?ZEJ4enBsQkZjNnB0RVkxS0JpTS9ZRVFmTXZidDB0UXVkd1NIK0wwWmVTSE55?=
 =?utf-8?B?Y0tTVU4wZVVTUHRyWmorWTBicFRic0U3MTB1OXhVZk5JVmtwaXBEQT09?=
X-Exchange-RoutingPolicyChecked: Hn1Df8gdbbolvkvXvLoNYAlMf6xPYyW4At9lXZy5R2CV/a68QtvgoMJ+BH4TnWTShcEpW4IQLyhW4NnXTBL2cS5OzLkwQaA6srVD2YHfYASitdckgs2spzv4nEWnIdhMfBG7c3ndwPwIZv1VvBtno9koMlNNdyjD0e7UQyW+OwEFfwn/GIkLjWgBcq0gA7lpRetkujq3WK9nmh8YKw/iTiYR+Y3kfDEd642jBu1yQO4J89cMjFLbGNJkbLnRYFYFwVUlUYu67iPx+X0S3NrKqA1NWsrzerqBMAQAA/I5k7yfrcrgSt6ae4pso4cas8ynviNZwWNq5Unlqvsz6Y4CRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb450cc4-c76d-4be3-5de5-08def9eda394
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:20:18.2795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQNPSUAmmeAfGazV/MqginJopryPj5ICF3H+GZElFdZJI+Sic+hpC79I18pcvbiu3bKQgW3YNHDyxq0mF4qbhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
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


On 14-08-2026 15:36, Michal Wajdeczko wrote:
>
> On 8/14/2026 8:31 AM, Tauro, Riana wrote:
>> On 13-08-2026 16:31, Michal Wajdeczko wrote:
>>> On 8/13/2026 12:52 PM, Mallesh, Koujalagi wrote:
>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>> Report 'Boot Mode' status or failure using various xe_log() helpers.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
>>>>>     1 file changed, 13 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> index 2d8c532157fd..ebd288986c11 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>>>>       static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>>     {
>>>>> -    struct device *dev = &pdev->dev;
>>>>>         struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>         struct xe_survivability *survivability = &xe->survivability;
>>>>> -    int ret = 0;
>>>>> +    int ret;
>>>>>           ret = create_survivability_sysfs(pdev);
>>>>>         if (ret)
>>>>> -        return ret;
>>>>> +        goto failed;
>>>>>           /* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>>>>>         survivability->mode = true;
>>>>> @@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>>         if (survivability->fdo_mode) {
>>>>>             ret = xe_nvm_init(xe);
>>>>>             if (ret)
>>>>> -            goto err;
>>>>> +            goto failed;
>>>>>         }
>>>>>           ret = xe_i2c_probe(xe);
>>>>>         if (ret)
>>>>> -        goto err;
>>>>> +        goto failed;
>>>>>     -    dev_err(dev, "In Survivability Mode\n");
>>>>> +    if (check_boot_failure(xe))
>>>>> +        xe_log_comp_fatal(pdev, SURVIVABILITY,
>>>>> +                  &survivability->boot_status,
>>>>> +                  sizeof(survivability->boot_status),
>>>>> +                  "Boot Mode enabled!\n");
>> Do we need this check? This function is only called if it is a boot failure.
> are you sure?
>
> in xe_device_probe_early() there is:
>
> 	err = xe_pcode_probe_early(xe);
> 	if (err || xe_survivability_mode_is_requested(xe)) {
> 		err = xe_survivability_mode_boot_enable(xe);
>
> and xe_survivability_mode_is_requested() may return true based
> on the xe_configfs_get_survivability_mode() settings


Configfs also is provided for users to enable boot survivability mode.
So one log should be sufficient.

If we do need to add a blob instead of error no we should go ahead with all
the scratch registers as they contain the error details instead of just 
boot status.
Can't we just add 0 for now and come up with something that we can 
decode in future.?


>
>> We can have a error log with the type here. We don't need if else.
> based on [1] all survivability mode SIGID are FATAL
> and based on 21] it was an arch choice to go with info level for all
>
> but IMO if the boot mode was selected via configfs it doesn't
> make sense to call it FATAL, but if there was real problem detected
> we should make it FATAL (like we do with failed PROBE)
>
> [1] https://patchwork.freedesktop.org/patch/732271/?series=168333&rev=1
> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>
>> How about something like this? and remove else
>>
>>
>> <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=<N> FATAL (01000000) SURVIVABILITY: mode=Boot

I am still trying to understand this series. Apologies if it is wrong, i 
tried to generate log using AI.

>                                                        ^^^^^^^^
> boot_status is u8 so it will be at most (01)
>
> and I don't think we should be so cryptic in the user facing error messages
>
>>>> In case of fatal, will make sense to return "0" OR we can add return as -ENXIO right? any thoughts?
>> Mallesh, you cannot change return codes here. This defeats the purpose of survivability mode
>>
>>> you're a reviewer here ;)
>>>
>>> but seriously, enable_boot_survivability_mode() is called from
>>> xe_survivability_mode_boot_enable() which says:
>>>
>>>    * Return: 0 if boot survivability mode is enabled or not requested, negative error
>>>    * code otherwise.
>>>
>>> so returning 0 as success code in enabling boot mode is the correct one
>>> returning -ENXIO will be no different than failing to enter boot mode
>>>
>>> @Riana, this is your code, can you please confirm that
>>>
>>>> After handling fatal case
>>>>
>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>
>>>>> +    else
>>>>> +        xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>>>>>           return 0;
>>>>>     -err:
>>>>> -    dev_err(dev, "Failed to enable Survivability Mode\n");
>>>>> +failed:
>>>>> +    xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
>> Can we retain the previous dmesg?
> there will be already "SURVIVABILITY: " prefix included,
> so IMO instead of generic:
>
>    [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Survivability Mode
>
> it's better to have more clearer message:
>
>    [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Boot Mode!

Boot Mode and Runtime mode doesn't sound right. But i don't have any 
better suggestions here due
to repetition.Since its message and can be changed . Will replace it if 
i can come up with something better in
the future.

Thanks
Riana


>
>> Thanks
>> Riana
>>
>>>>>         survivability->mode = false;
>>>>>         return ret;
>>>>>     }
