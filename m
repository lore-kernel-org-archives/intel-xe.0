Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2919DC4450A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 04:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BBD10E10C;
	Wed, 15 Jul 2026 04:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gz//ohKm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0994210E10C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 04:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784089614; x=1815625614;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dzogt9XJlyCUZnOD38rg09Mb1fHH9JGDZTJtht5FLX8=;
 b=gz//ohKmWz6kSfnleEciqgM+gS40LKzc+mHk4mUwUjhtWis8OJjIXTH0
 1eYqZ9Yp8XuDpBJYL+x2o0q6yLyEdrhhMTOR3PK7ytWdeoAwJGNieXA/D
 UyAExNePSobs6dGh474gzWtP8Gsme4aZ/ZH+iDhetb5EctWLS6ijRe9bY
 9FdEOhoBwad3lskPEjkJ8SDCR7lpxtYLwo9vwsh4Qy6sWTwj0HRYe7N81
 gsTlc3qRNb99wLMUaPxyv0s+di7lI/z8Zpn1JrW8lWz0et+fHE19VkkhO
 rdzpTKvQosSSc+Pu7Na62sNe3PSRi7XRDNY1wMaHfxmINPfGhbKim3IjB w==;
X-CSE-ConnectionGUID: En7K5d7hQWm4oAT3G91F9g==
X-CSE-MsgGUID: z4xSDMfPTRGVgAwvbtU4rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84807788"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84807788"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:26:53 -0700
X-CSE-ConnectionGUID: CItW194FSM6z8JhgRM3ZdA==
X-CSE-MsgGUID: 40GjBDgNTBWk/tQi0w/sFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="259884948"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:26:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 21:26:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 21:26:53 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 21:26:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8g08B2G6Fabe2HohRLF0BSKUcBOvQeNHU57fSAyice8Qyd9BsuqiIBL18LhLuLuIb9IiAcivfTQDHxwLzDG9CGwO9JgNgSG5D3iftJJQwq3sYJ1Rb+PLJJfze/ob5Gb5CkYOxl/Qnh/tjmZ+c6WbVUY1f+YJYnNsqx6r9CJBJxIA0y8nGAiHjOXDq1YvYQAWnlPLGXD7yRu/CSUyVZ3ljGfS+qFW9ZnFObsuq0Hofn0TV3QHcl+evsZNmv4biyPhNsGJHMeYpPKrgD+DPS62tAvVUvMrG2n8sjRfkhdH0KEXcvY0obPDy+AkQd2EevKYixS9c5wJKrqtuEPC+oL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25F0DZ/hh/EhW0ikixaf3RaNT81X9+VekUbtneA3iig=;
 b=bMDzwMFaZL4l/ZZxImbnW0Gvak/DDkgtQU+QzREg22kFHWQNW41BGK1CVgyHA/4lDn+Oh51cwJnO4x0mfw+HLa+g24GtlQs4IvfZGTRTviRIQ1fx+E+LN1JHkSOZGQ0QoXZOjysSjhOk+lG3UHrUOifmdbPPT4PZG817cGI2KxdvpMycoEkK/I8n3QfLL6cMEvGp7PRkJn69NCL+rH0e60kS5DztHeRuMlSzfFMZz1aWzqCeNMhe7oygcRKmfu7nVTbn7e2ChcTSLL+jAXeJnSYZYzZuN6xAGnUKaX1iqxCk1K7m6vD/AHegXvz2xSEITiXGVSp3tBVpUuXsKiAlhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB5698.namprd11.prod.outlook.com (2603:10b6:208:33d::8)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 04:26:44 +0000
Received: from BL3PR11MB5698.namprd11.prod.outlook.com
 ([fe80::fd06:443b:bd51:8e09]) by BL3PR11MB5698.namprd11.prod.outlook.com
 ([fe80::fd06:443b:bd51:8e09%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 04:26:43 +0000
Message-ID: <13aa91ef-452d-411d-9bb5-0ca43ea169da@intel.com>
Date: Wed, 15 Jul 2026 09:56:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Keep scheduler timeline name alive
To: Tvrtko Ursulin <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260714064402.2457257-1-arvind.yadav@intel.com>
 <3f103d7b-3a58-4c3d-a4d7-e413e7b92e47@ursulin.net>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <3f103d7b-3a58-4c3d-a4d7-e413e7b92e47@ursulin.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0255.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::8) To CH0PR11MB5706.namprd11.prod.outlook.com
 (2603:10b6:610:ed::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB5698:EE_|CY8PR11MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7729a6-7ce7-4d72-c726-08dee229459e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: vnvAuu4r+EhasMDN/l/oJafRlmYWtTn3tFc0uPF7PDVIZ6fWYq6Dzy24qI21yyggSrYhkbax4VqM0xfUI5v/CnWnHbmR/+GAnLtShVcIv/V+0RX9ITVDb13ssI7jRq8Pl4vlK+sglzyFBWf70BGpySVhOItu3ogd56xi4a0b93GbJ3CHJU0SUyQ9sVDSkuQ3Lndq7q2bP16Um/GsIXyRQXx7s5P5U2fmcgxLDMgGWbdchfV5bba/UUlL5mDTkhXlQxFaQanLgkqDAkKhXpya6hterNXzlqVfUHQEP0fIioImoMzXCTZQ6eSGMvbxRTQxBAu0dPm0hSflVdsW+MbdYurUHc/zYorYJyhaMSWJjQ2A1+rQUdRVBOQPquLIoiy+DVB4WbtjMtRg8W9Wv4Vv+xRVpDNtbtKngIs3RSGFZty2QiArgL0suQXInSByd75KuqwBT6Mjn/vUXepSKJTjvZvgzZzeDHSrM1fZErTXYo8YbTVmPjemJIWKDYqmzJLGU3gv9GNqHaRCTCmvqnKLMdgFjdcfgQIOXOS4fd3OB7JoYOq5oYPhyselzZ6N9BkS21bY33cA7XwWzlPE+303onpF19bGaZM9ki/2x2lwq2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5698.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elp3TWtncWtuZmhEV0lHaGhOTUJ4VFgrMjVWbzBia21ROVVUTHllaUN0cnl6?=
 =?utf-8?B?UGcvMTQ2NFRXT21QOFdLMENySktSV0dZY05icEhGR1lTU3IxMWszejFUU04z?=
 =?utf-8?B?aDcyenNpYmdhRnJlbCtoQUkvYlBsRk1uWmN0UlRxWmt4SUhUdlZYY3dFMHUw?=
 =?utf-8?B?dmVCRittckEzVnF5cFFBeXBUNEZOOEE5dlJBeEYxVEorWFkzci9oNENPZ1Rj?=
 =?utf-8?B?aEJQWGw5SlhiYjdxZ05pN1VHOEtEQnFLUElWdnQxa2FNcngyQzZ4UjB1QmRa?=
 =?utf-8?B?aTk0Y3RwV09NWmhvakJtSGFOVkZqb3gxa3ZIZHVSVUdaNk1ETFJoRUZrZnVI?=
 =?utf-8?B?VjE4SU40ZksyclVEVGxKYmlYTHNHUUFpOXJSdzQ4YzIyYzZpNWVwUEUvZzBQ?=
 =?utf-8?B?YXZuN1pjemE3T2F3QnN5WXhQTGFINGVqSG1lb1pCZm8rMy9jaFZnc29nOUJV?=
 =?utf-8?B?dDl1dzJOZ1BNZmR4eUhDRG93b0VuT2lkUyt0N0RtRnpubHZreEhMQ2pYTjBR?=
 =?utf-8?B?VHRNemV5UGgwZ29sQWhrMCtuRy9KV1U4M3NrK0gzVm0yamZjTVRlMWZFOUJr?=
 =?utf-8?B?UXBuT3k3NkdOdk44WElQNFY0SEFxSFVpbFhTblgwbkxQeS9iZkpBT1hXL2Fx?=
 =?utf-8?B?c1ZTWkhwNlNLVHo2ODhVdWFaZU9hYjZrMGxtWjgrRGh3bHVKNFA3ME9sZXQ3?=
 =?utf-8?B?UVZWbzYzZmtqeTYyRDg5dGNlRFVFdVEzRFAvc01uR1JaTVZyRVJHZkNMajZY?=
 =?utf-8?B?NWUwejNjMktSUEhOQVRFRkwyeFRVb2diVDh3QnVvWVNQMDlGQ2htMWRCUlVT?=
 =?utf-8?B?dlVVK0Z5MW94MGM0SG50ZTRtRUJRMno5cW0yOVpWQjFEODZkUmxyZ04yWkJr?=
 =?utf-8?B?T1B0Y0NkbmJPTUovMVE4cTBkTVRqZDMrVVJRU1d3MnB3c1hoMllhVVZhUGNJ?=
 =?utf-8?B?RXdDS1NLTXdTWTIzNkJ1T2ozeWZmelNYdkxqOFZFTnB4bUFGcTR4ZXNhMmJN?=
 =?utf-8?B?a3ppT05ZSi82Wms1NlU3SjI0WVpta1lzaDNjRmZ6eWs4VzUxTkhCQjBodHNV?=
 =?utf-8?B?WHNVcDEwQTBJTXkwb20vaGlhdzdyT3Uxb2RYSTBwYUJsRkNDOWxxV0xIMTNR?=
 =?utf-8?B?ckNqd0R3VWcvbGdJeXVUbDB2dHFXUytKbTFjTksyd2FPazhqd1J5cXRIT2t4?=
 =?utf-8?B?REJmVUo2UjcvY05vcDA1dElYTzBYZUJaYkR2RUppeVVTdmtrM212NCtuN044?=
 =?utf-8?B?MzVLMGVoSENadjhKbXF3WUQvd2JxcnFJYXZqeVRWSmdGSTFwWkVoYUF1dUtv?=
 =?utf-8?B?Z2RteFhCeEhHenMxQWtXZnFjV1NZTGpVOHkxR0NYNzE1alc1c0tEZ1BTdkVL?=
 =?utf-8?B?MEU3NEhGbjJkK1p4MDhJbEY4MFV3Q01jYURjUzJjYTFZV1pjQXVQMDVPTzZr?=
 =?utf-8?B?am5NSmZucU51SnlESTIzcjhkUVRNcG5DUW9MandMVG12NlhPazVOWENSQkQr?=
 =?utf-8?B?YmNJaitiS28wbFhJTGliWlozc2lvWTJmcXVyWnVDejNHcXdjcXVBbG91cnZT?=
 =?utf-8?B?OWlPZjJqK0pJRThYd1BuY1gzSlFwRjRMMTRlbm5KQnBTcXJiV25pczZVL2lm?=
 =?utf-8?B?ZEZZSUVXY1Y2Nk4xU3ZsSlZKczNOVll6ZWpGKzE4TVFhTk9iMXRRejdMN2xP?=
 =?utf-8?B?V1l6S0R4KzZHSGVHWGVpU3BCOTQ4cmhzREFaRGlnU2hTaGwwK1d1Rlh0YmE0?=
 =?utf-8?B?NEJiL0pUZlBaa1IrNUEwSVA0VDl5aWJ0clpPVGZZcm96eXVCQmlvcHRCM3Z4?=
 =?utf-8?B?MFZZeUJnWUMraFdsVUU2bUNUUWJtajc1Y00xcVptQkVreHQ0aGF1c0UwM294?=
 =?utf-8?B?UlUvaUVNL0pZVHFHNlJHa0ZNSGlieXJTOGxBLzVvZlVKems2Sy95TU9janVi?=
 =?utf-8?B?REM4blR1SURxUkJDWVBnYUJSL0tWTXl3bm9haWtUcXI0cGJkREZFNlU4M1VH?=
 =?utf-8?B?U2diaXk2RGNXQUVOdnJUUm1RT0FmejBIQWZXbEEyNlRhNTZ6RUtUUDBDWnho?=
 =?utf-8?B?dllHbUoyOXA5Yk1WM25oSXVHekY0Zll6M3d0OGIzcmR3RVhFejVQQllTbXNX?=
 =?utf-8?B?WkJRU1VNYUI5M1Z5SGxINzNORXVkK3lhRjBwZEI0SnZnQ2syM1k4SEN4WG1M?=
 =?utf-8?B?WWQzdVZJUFdEc3dpS3JzdTJaaDQ1eUNIUUV3UUxnbFRkRlVidlNFaDlMeHVp?=
 =?utf-8?B?cktSK3FMbVJjZUlwOTV4d3g2OWpvVW1YRmViRC94M3BMWUl5Z3pMQ1ZWSTg5?=
 =?utf-8?B?cTZwSmpTK1pBZUdiVWFNb3MwcGxGVG5tVG85dlRpQ3BMdEMzZUYrUT09?=
X-Exchange-RoutingPolicyChecked: fb2+GiMHTurPKT27vC6WDg8t0vf3OaPT6IUyJEijzZYHTsujie68GgwZNGZ9+FEhVT7NVHvWZQQd6t8upc0O1ZfoATiP9x9cG08HZrmTNbcnI0Q0blYAsUvbxg3IaFR/Aw39UJokcv2HkIHcUnp5NeEX2TuR9GH8Bu8qe9JAvjvLLVp8zV53FBDHIEcDKgAqDejOrbnaZz9txPf5b5rY/Wwd5P3/Mue999W/HRPdHW5HYKP6CARq1X4gZq196yfICDqbg0GyRSwWbjMjMGTvGdOoTHduFYdiMfTvt4i8lwJReo/DIAo/756PBhld6A/KdK+EVw4oTmFxoqyrJmIyiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7729a6-7ce7-4d72-c726-08dee229459e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 04:26:43.1627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH9+lj5hcj7pqKx3i8+NX9fODc8oXyaS/BDJxoc2lBiQAljrEXEFyXIv6109leuFmpXmlf3HHbW/zDXcvFB6eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
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


On 14-07-2026 15:02, Tvrtko Ursulin wrote:
>
> On 14/07/2026 07:44, Arvind Yadav wrote:
>> The scheduler keeps a pointer to the timeline name, but q->name
>> is freed with the exec queue while scheduler fences can still
>> reference it.
>>
>> Store the name in struct xe_guc_exec_queue so it shares
>> the scheduler's RCU-deferred lifetime.
>>
>> Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe 
>> access rules")
>
> Feel free to copy me if I broke something, or even fixed it 
> incompletely. :)
>
> It is curious since I had an IGT which confirmed the fix was effective 
> by dereferencing the timeline.
>
> At the time of the above commit:
>
> __guc_exec_queue_process_msg_cleanup
>   __guc_exec_queue_fini
>     guc_exec_queue_fini_async
>     ...
>         xe_sched_entity_fini
>         xe_sched_fini
>         kfree_rcu ge
>         xe_exec_queue_fini q
>           __xe_exec_queue_free
>            kfree q
>
>
> Now:
>
> __guc_exec_queue_process_msg_cleanup
>   __guc_exec_queue_destroy
>     guc_exec_queue_destroy_async
>       __guc_exec_queue_destroy_async
>         xe_exec_queue_fini
>       __xe_exec_queue_fini
>             guc_exec_queue_fini
>             ...
>               xe_sched_entity_fini
>               xe_sched_fini
>               kfree_rcu ge
>       __xe_exec_queue_free
>               kfree q
>
> Looks functionally identical.
>
> AFAIR the problem actually was:
>
> drm_sched_fence_get_timeline_name()
>   return (const char *)fence->sched->name;
>
> Where fence->sched is drm sched, aka "ge" from the above flow.
>
> And that has kfree_rcu in the today's code base too. So no issue with 
> the sched pointer itself.
>
> What about sched->name ie. q->name? It is only free after the 
> scheduler is freed, so after the RCU grace, and if scheduler itself is 
> unreachable then sched->name is surely unreachable too.
>
> What am I missing? Could you provide some details on where and how 
> this crashes?
>
Thanks Tvrtko,

The gap is in the lifetime of sched->name, not fence->sched. 
drm_sched_init() stores the name as a pointer. it does not copy it. 
Today that pointer refers to q->name, which is embedded in struct 
xe_exec_queue.

The teardown order is:
         kfree_rcu(ge)    // scheduler remains valid until the RCU grace 
period
         kfree(q)         // q->name is freed immediately

So during the RCU grace period, fence->sched is still valid, but 
fence->sched->name points into the already freed q. The patch moves the 
name storage into ge, so the scheduler and its name share the same 
RCU-deferred lifetime.

this issue is pointed by sashiko -: 
https://sashiko.dev/#/patchset/20260713042530.2108459-1-arvind.yadav%40intel.com

Regards,
Arvind


> Regards,
>
> Tvrtko
>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 5 +++++
>>   drivers/gpu/drm/xe/xe_guc_submit.c           | 4 +++-
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> index e5e53b421f29..cda14d954e57 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> @@ -10,6 +10,7 @@
>>   #include <linux/workqueue.h>
>>     #include "xe_gpu_scheduler_types.h"
>> +#include "xe_hw_fence_types.h"
>>     struct dma_fence;
>>   struct xe_exec_queue;
>> @@ -24,6 +25,10 @@ struct xe_guc_exec_queue {
>>       struct rcu_head rcu;
>>       /** @sched: GPU scheduler for this xe_exec_queue */
>>       struct xe_gpu_scheduler sched;
>> +    /**
>> +     * @name: Scheduler timeline name, kept with @sched until RCU free.
>> +     */
>> +    char name[MAX_FENCE_NAME_LEN];
>>       /** @entity: Scheduler entity for this xe_exec_queue */
>>       struct xe_sched_entity entity;
>>       /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index cec3bbf3a10e..8ef6eeebfaa8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1978,6 +1978,8 @@ static int guc_exec_queue_init(struct 
>> xe_exec_queue *q)
>>         xe_exec_queue_assign_name(q, q->guc->id);
>>   +    strscpy(ge->name, q->name, sizeof(ge->name));
>> +
>>       /*
>>        * Use primary queue's submit_wq for all secondary queues of a
>>        * multi queue group. This serialization avoids any locking around
>> @@ -1992,7 +1994,7 @@ static int guc_exec_queue_init(struct 
>> xe_exec_queue *q)
>>       err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>>                   submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 
>> 64,
>>                   timeout, guc_to_gt(guc)->ordered_wq, NULL,
>> -                q->name, gt_to_xe(q->gt)->drm.dev);
>> +                ge->name, gt_to_xe(q->gt)->drm.dev);
>>       if (err)
>>           goto err_release_id;
>
