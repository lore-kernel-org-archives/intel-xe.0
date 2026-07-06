Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A3BC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 08:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FEF10E25B;
	Mon,  6 Jul 2026 08:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVRd56KQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE11910E25B
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 08:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783326938; x=1814862938;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tmRK42RFFNjIY97/wZJdYzr19DHZlnmcBJgNh22IH0g=;
 b=AVRd56KQZTdnkMlje1HQjJbSqJFIkRgEiJ30+gVa/GgAl0/io8N3dikJ
 aia/l/CO+RB0N8OyhchAxWcLUYzviaVoiPybgoo2aAH+mGBJuJk0J3sJG
 z3IaXk/E3euvaj2dWWWI7lZ80mWxU4+xucXHsSTOwzNhQf7u38rreP6Fr
 pfnHY/yZd1I3W0BK8+9MMkzC5nwcKut+fURV3/c+H/oORPgdPItgqJMkr
 /KUKUHUElzSc0oTWpG9yViJ2T5yZYnOKr1k7kS8PkqssZHN4eSPOmtFMz
 kzy+RpdSQKTSYmzLfEBZA7DklC2LPHpddA9QNFKfOpvWSuBl1ZSscfdCz A==;
X-CSE-ConnectionGUID: t92WzASSQbeCCAMJqGmc5Q==
X-CSE-MsgGUID: tQdU8A5rQ4al1SGsDioErQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87870415"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="87870415"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:35:37 -0700
X-CSE-ConnectionGUID: BhT9OTUtRqqdEIfj6ZdBRA==
X-CSE-MsgGUID: Kv815l63TpywKl3FFsJl/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="253182100"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:35:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:35:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 01:35:37 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:35:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMeDPTuqYoIoblXXn/OPrGxPL8T/kV9h7II0kq+CwKPkuGMi94Vm9X7kuVTCvd6pPj2rupb0QIFdvGH1uozejLUKSt41bLt2HlW+U+lYA2Se3OBS6TaTcZqHR21pC7G/XLIMp8RXz5qYArkOKrr07eTu7GXkGPVnX1MlztEZSr4yV6BUkEkKX0JDXB5hQMBIBvOCo2E5VR1k4/PMLGjgCPtG1f1KxurCS1i/LbIKR71IUPPKpMqhbtsHDZVUQB2XNUxek0K5rJnWIhcWeoVqrryFa0dASzV4zJxTYV5P84mFtNjryEs+h3q1HuaQNaast5S83AqvkYlb2VoNosYInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atbRNQnTWnBMff8L+E5n0LdU5GJTMVZGg/MrpPo6weA=;
 b=M861UWg42S+L11R7gXO9WBnuFRYAW8CQVU0tXJcnatJgiXl87ZDbK69MtY88wsK76Md9dL4ZPvm4OOFJ5dJXI3QaesKmicPPDCcHubuhOPe/dMLMmTDseTrwVoH+IBghLWR1DDarbYts8PGBG5VXRP9PWwH8n9OdHn6ZuqfVAiXrjc3Zo7Tfa2Nfa0GSCIl/i0PBu6EdvL2PIek8NtaOBd0Y6jyGpJKG8+KVXz2AhdHKX0O94ajLIJuHiS5hf+FHOOVHfu2djRj5YArWDwXSX3IqDj88vKJhJlkls+Sub3UzEqbaZYoYj0q67uLJC5sekInB4gwm3HT+4dCm8/r79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Mon, 6 Jul
 2026 08:35:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 08:35:29 +0000
Message-ID: <40fa79df-fd04-40fe-8e97-f93f6a24181e@intel.com>
Date: Mon, 6 Jul 2026 14:05:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 2/5] drm/xe: Add RAS logging helpers
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-9-mallesh.koujalagi@intel.com>
 <6b6e6259-a4bb-4d79-a87f-a8b21e22e923@intel.com>
 <44fb1c8d-2a72-4c65-97b8-b95ec23a9bfa@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <44fb1c8d-2a72-4c65-97b8-b95ec23a9bfa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9d368f-d508-4c99-107e-08dedb3988c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: M7oitOORXTLC6CFnAfqttcW45x8fRECmmWy0QpDo0aUbppoUWlwwBWc3QNOSAnYYBOClTXOW31Mg4mWS9mkoQya0dAzGbUtInUN36daftHdyqXCkjswuJRbTg/vGUOvEQavVk+t7jfliUvRWczxNiccATedC6JpkV/hzZXyK4dwewQ7YpfcutGF/mBpkJYtjh1I9OesVnZGB1AWlZFgEQ4yXjOFhBGKv1YBo4fcjy46OOKj5hz+LCoHzu294ztlmostSvg/aloOAT+5EscGyrMfBIWLPzGD8UQsn8u+PA5V5+3qYnYKaR/ybqMmZtcKEnv3cUAKNe6YsoAAdlvAFijnoLtwyCiVPvxWYH/QlQajZRSJhBk7350PJkG8VXgczSOMf3QsUrrywF7VvhFzAmfjigEQ4oz4T1qwKPoZ+rdjiaaqif1xfolfOqI9mLp3yQOeouSHNKN0rC4Xiepk08eLqF9VXeL4w2w8ckiCO3pWXjLav45VKihQmOwv1LITtRRB188IaMffOSMoH3OlkH3pF24uwB+EKCpY8WVqNpen0yluExIy7DnD3Y6VOtPeTuToJlfZdKjwsnpKur87iBEEY71lPX7McDZSCsN1uN6ocLwVJOFGXkzgShYH3sDJBFzx2n/R9ld8N9TG9CPxYKKZmcx8DfVd2dJRF0uOZV/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVp5bWRXc011SjdwZ3RBRm1hSDFuaHBGTVZoZU5NZWlZWVdEbUpvL1R3TEdZ?=
 =?utf-8?B?eVZDbmNqaHM1aDVuanR3OXJqZ2ZMSmFTMTZGWTdLWVdzRlN1RURWV01rZHFk?=
 =?utf-8?B?aVp0K2JRaWJLa2ZmQmxodG92T1BaakNhNGZNSXpiYmd5eEpYdmJNOHVPbExa?=
 =?utf-8?B?WFNoRjFHMFduRVpIVlNkZ1pWRnRiY3dDTXpuUWR3U01CWitvTU10UnZTYU9y?=
 =?utf-8?B?ekZ4Q01qMm1pSHZWMThxYU05YWpqdHByNjV0czNoYkcxMEVHQ3JFVHozTnQw?=
 =?utf-8?B?UTJGejlwTXZtZWRjTVAxdldvM1UzSFdTU21nZFgrcWlXVzcwOWpWWTg4NEJM?=
 =?utf-8?B?ZWkwZ2xFSG1SZTZXcU9CZmlXUFE1M2RlU2d1eTB5N3YzclFVRThHN0NjTmVv?=
 =?utf-8?B?T2t3ZXdVdDR3M0QrYmtRaVBtWkFzcUlMRG9rdlRVRWQwZTNQTkhlVWNRcU9E?=
 =?utf-8?B?UllKQlBRc1R3QXpVWlYvQ0o1cmNxMnpTTmJBanVHblRHTVIxUHcycC9ScE9z?=
 =?utf-8?B?d3VXSGREMW8zMFJWUDlaV2xsdHVBdTFKU0YrUjNMRk14RU1SNEpIbXpMN05R?=
 =?utf-8?B?c2xHZUt3bk1sWFJxanRVcjVYYUVLOGRsYWVVR01XbllSUVR4M0k5Zi9vbGZY?=
 =?utf-8?B?bUNjVDJydEVzZVpRNUQ1MjNkWGNxV01SbkJ5N1FzNDJMNm5lZFNJMnA2eXZH?=
 =?utf-8?B?ajNTNTFWVVRDazBMMzhUTWtwdURFY0htYldTWjJCT0lTYlduZW1iUkh5K2xa?=
 =?utf-8?B?MytqTnZrWlRNZm9EWXREemU1STQ2OW9kZ2ZKaUc2bzQ2M2kwdGRKd0VrUDla?=
 =?utf-8?B?MzRKbnB3R0lUYWJHSnUzalA5QTJocEJQOE4ydHMvSjRucTZSRHZOSEJpRFQ1?=
 =?utf-8?B?QlRYc084MjNsTE8vL1pqOWtGWHczb3JuOS9pRGFDSjFNbm1BbGIxalI2cmx2?=
 =?utf-8?B?T2s2TSt5L0RJQ3lKVFBqZVg2Q3AwOFRkZHpwWHowQ29tbGNxM3NPeG15SjQ5?=
 =?utf-8?B?dlpuV3pDRkUyMHFIZ0NCaWIveTV0bmx0T3dMMm50VkNPT3h2REJIYnVkKzhG?=
 =?utf-8?B?Uis3VDBBRVhNYzA0dnpITy9BSGZjWHU2cVRxcFdnYysvZjF4WXZEUDBQNFVB?=
 =?utf-8?B?a2JuS01hakVFMXQvWlhwWXd6dDNUYTgvTlF4T1RZQUttZVdTdUVKbnFXRGRs?=
 =?utf-8?B?K0lZRklZMk9oRHozbmZMUmd3OURtQUxPMWZPcGhMUGRHdHExYTdFZ0ZwNXpW?=
 =?utf-8?B?bGdzaTgzNHBEdk0xaFlFZU9EeS9oMFowSlRVUWg3aVNuZEdtL29oQVd5RDJT?=
 =?utf-8?B?TlJua05NMVpLaDZLVjlwQXEwWkx5RDdRV0JaaHo2cHBEMWtNbDZHTjBCd3Vy?=
 =?utf-8?B?NTR2aUJWQk9mQnNSZWViMEdydE1FOEdXTUduSVlOZXR4c1l2cW9maG95eDg2?=
 =?utf-8?B?eFhoMjB5OFBhR3hobFlwL25XQ0N4dUdCb2hKSnZ0b3BhZHQ5cFJQVkpLTnVo?=
 =?utf-8?B?MGl5VnVLSlM4Q2h3Wnp2TExzMmJhL3ZKakJERFFYVGpuaW5ZT3IrRjROWFlJ?=
 =?utf-8?B?VDhpaTl2SEVwcHVJQS96MFIzVlBWV0FmUHNLbHBWUUp2NnIrNFdERVpDZTVJ?=
 =?utf-8?B?ektBQ3I1eURVRDlSb1l1MlJZS3Q3ajh0cE01dm13OHA0M2ZUOTFreHorWnVl?=
 =?utf-8?B?OEx0RE5wNkh5aEZ4by9oZEViUmNDcGRadTUremlyeWtCYUlKRDJNbVVJbDh6?=
 =?utf-8?B?YnJGOE04Y3lWdlQzZUJXeE5ycDBQVmVqbmhpZThyT1kyNTEwSzF0RVhxRFFH?=
 =?utf-8?B?ZDNEQjNnSWF2U1lWZjlYS29RWEJETVY3NGlQSXVyM0xrMWdYbVM0UTEwYjNT?=
 =?utf-8?B?czFkM2lHRHlOb2U2dE94dWo3UDNMR1R4WTd2YU1GTHlkUmdjUVlVQi8zRSth?=
 =?utf-8?B?dXQ2c0xoNWY0SmF3czRKaEdjOVJSY29odTlGWkFUME43OUlnS3ByRWJjTEox?=
 =?utf-8?B?eTFaM1FISER0UVpWTjhBOFpYWm5TV1RSTTVsWmp4a2hpb3JZaVgrd2hiSmFz?=
 =?utf-8?B?aEp3VjB6Q3BXV0hlcEZuWFNvQ0pxNnZzRzcvZHlKUzFZWno0SDM5b2lBdkpB?=
 =?utf-8?B?eUY1QXNXTHdSc2d5bUtMT3R3SEgvZlk4RmE1UTEwSElmU2tCbzR2QmhUcUh0?=
 =?utf-8?B?RTRkZkhQcGhEYkdUSHo3aHE5OFE3MUhUS3R2M0grSnNmc1BKYzkzOVB3SmxH?=
 =?utf-8?B?dlUvbDA4cDVOOHpEdWplVzBXTzFOOFZsbEl2UTVBbDlwWjQ4ZzZjS1FzUGlX?=
 =?utf-8?B?dFNDTTVxdXJpYTlmV1cyNUZSLy9LMmxRYUlrSlJTajIvZFQ0bFRvUT09?=
X-Exchange-RoutingPolicyChecked: AxE9qVvGm62egqXCi0znZEFH38TYo9cJq2RWUhbKkh5k9Osccx0uW+ymE5lv9CaoFWtynXos/mgABH7dfYCixrIV++RwRjnq4yKKYTYP9rTRRb4IkeRki5FzR761LEJKwcPUU4+ngB3gvjvnIrcRvl4+ZKdetYz2XgIVe943BVhiAdDywAoem+3+uow+jcRy82/B/Wiq1bn2tl9seW36Zta8MlZcmAo2VzCEKlmH0/XWHdBju+YLfqT0j84BgZVZ1kwIlaFLm3dvWU/lItisBUZODb+hyYiaK2J1Y2cBWG88jz0Z8zgjKwHmUhVKOyfRc5e3wxBsWNy4v0IjRGYBmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9d368f-d508-4c99-107e-08dedb3988c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:35:29.0549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfqEyYmcoqFxnKsCyF0511G0EiZmzTKB668rR2w9OWoOhmvk6s4dIHPYysrdi4XPZKIyMWk0KIfVdXZXYa8lcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
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


On 03-07-2026 18:31, Mallesh, Koujalagi wrote:
>
> On 03-07-2026 04:45 pm, Tauro, Riana wrote:
>>
>> On 30-06-2026 17:25, Mallesh Koujalagi wrote:
>>> Add xe_ras_log_(*) macros to report Xe driver errors in a
>>> consistent, structured format.
>>>
>>> Exposes one macro per error category (probe, wedged,
>>> survivability, firmware, GT TDR, memory fault, IO bus). Each macro
>>> hard-codes the correct SIG_ID and severity for that category, so
>>> callers only need to pass the device or GT handle, errno, and message.
>>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> v3:
>>> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
>>> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
>>> - Declare __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
>>> - Make macro function properly.
>>> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
>>> - Add sig id documents. (Riana)
>>> - Change macro function same prefix as the file.
>>> - Handle __xe_ras_log() function with variable format.
>>>
>>> v4:
>>> - Handle CONFIG_UEFI_CPER properly.
>>> - Add CPER_SEV_RECOVERABLE in __xe_ras_log().
>>> - Add xe_ras_log_runtime_fw() and xe_ras_log_device_fw() macros.
>>> - Update commit message.
>>> - Remove document. (Riana)
>>> ---
>>>   drivers/gpu/drm/xe/Makefile     |  1 +
>>>   drivers/gpu/drm/xe/xe_ras_log.c | 65 
>>> +++++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ras_log.h | 62 +++++++++++++++++++++++++++++++
>>>   3 files changed, 128 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index e5a04253e73b..cac19c21be08 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>>>       xe_query.o \
>>>       xe_range_fence.o \
>>>       xe_ras.o \
>>> +    xe_ras_log.o \
>>>       xe_reg_sr.o \
>>>       xe_reg_whitelist.o \
>>>       xe_ring_ops.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c 
>>> b/drivers/gpu/drm/xe/xe_ras_log.c
>>> new file mode 100644
>>> index 000000000000..928fa4f45cdc
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
>>> @@ -0,0 +1,65 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include <drm/drm_print.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_ras_log.h"
>>> +
>>> +/**
>>> + * __xe_ras_log - Emit a structured RAS log entry
>>> + * @xe: xe device instance
>>> + * @gt: GT instance where the error occurred, or NULL if device-wide
>>> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
>>> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, 
>>> CPER_SEV_RECOVERABLE, etc.)
>>> + * @errno_val: negative errno describing the error condition
>>> + * @fmt: printf-style format string
>>> + * @...: format arguments
>>> + *
>>> + * Formats the message and emits a kernel log line via drm_err() 
>>> for fatal
>>> + * events or drm_warn() for all others. CPER record generation and 
>>> hex dump
>>> + * are planned as follow-ups.
>>> + *
>>> + * Format:
>>> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno 
>>> = <n> Message = "<msg>"
>>> + */
>>> +__printf(6, 7)
>>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>>> +          u16 sig_id, u32 cper_sev, int errno_val,
>>> +          const char *fmt, ...)
>>> +{
>>> +    char loc[32];
>>> +    struct va_format vaf;
>>> +    va_list ap;
>>> +
>>> +    if (gt)
>>> +        snprintf(loc, sizeof(loc), "tile%u/gt%u",
>>> +             gt->tile->id, gt->info.id);
>>> +    else
>>> +        snprintf(loc, sizeof(loc), "device");
>>> +
>>> +    va_start(ap, fmt);
>>> +    vaf.fmt = fmt;
>>> +    vaf.va = &ap;
>>> +
>>> +    if (cper_sev == CPER_SEV_FATAL || cper_sev == 
>>> CPER_SEV_RECOVERABLE)
>>> +        drm_err(&xe->drm,
>>> +            "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno 
>>> = %d Message = \"%pV\"",
>>> +            sig_id,
>>> +            IS_ENABLED(CONFIG_UEFI_CPER) ? 
>>> cper_severity_str(cper_sev) : "unknown",
>>> +            loc, errno_val, &vaf);
>>> +    else
>>> +        drm_warn(&xe->drm,
>>> +             "[xe-err] SIG_ID = %u Severity = %s Location = %s 
>>> Errno = %d Message = \"%pV\"",
>>> +             sig_id,
>>> +             IS_ENABLED(CONFIG_UEFI_CPER) ? 
>>> cper_severity_str(cper_sev) : "unknown",
>>> +             loc, errno_val, &vaf);
>>
>>
>> There were few comments regarding this from both me and Michal from 
>> previous rev that were agreed by you but not fixed.
>> Also let's close comments from previous rev before sending new 
>> revisions.
>>
> I checked with the Arch team. Even though this is logged using 
> drm_warn(),
> we still want the output to be prefixed with xe_err because it is used
> for error handling paths. These messages are generated when correctable
> or other hardware errors occur, so having an explicit xe_err tag helps
> identify them as error-related events in the logs.
>

Why not replace with xe-ras instead. We are using 3 different terms here
ras, sigid and err. Let's keep it consistent.

Thanks
Riana


> Thanks,
> -/Mallesh
>
>> Thanks
>> Riana
>>
>>> +
>>> +    va_end(ap);
>>> +
>>> +    /* TODO: Add CPER record driver handler */
>>> +    /* TODO: Add RAS dump cper hex handler */
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h 
>>> b/drivers/gpu/drm/xe/xe_ras_log.h
>>> new file mode 100644
>>> index 000000000000..3f94e6747e86
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
>>> @@ -0,0 +1,62 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_RAS_LOG_H_
>>> +#define _XE_RAS_LOG_H_
>>> +
>>> +#include <linux/cper.h>
>>> +
>>> +#include "xe_sig_ids.h"
>>> +
>>> +struct xe_device;
>>> +struct xe_gt;
>>> +
>>> +/*
>>> + * Common backend helper
>>> + */
>>> +__printf(6, 7)
>>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>>> +          u16 sig_id, u32 cper_sev, int errno_val,
>>> +          const char *fmt, ...);
>>> +
>>> +/*
>>> + * Driver error reporting macros
>>> + */
>>> +
>>> +/* FATAL */
>>> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +/* RECOVERABLE */
>>> +#define xe_ras_log_runtime_fw(xe, gt, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), (gt), XE_SIG_RUNTIME_FW, 
>>> CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_device_fw(xe, gt, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), (gt), XE_SIG_DEVICE_FW, CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#endif /* _XE_RAS_LOG_H_ */
