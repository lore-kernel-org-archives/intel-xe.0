Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A794CD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 19:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1654410E576;
	Tue,  5 May 2026 19:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCk6D69o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1082F10E576
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778007774; x=1809543774;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hkq3+DjW6VAA0qcAYmQuJvtGMTILgNQoTOCc4zqKvCQ=;
 b=HCk6D69oh//wITp9A1DBOsF1sJZkoD1w+5FYk/05rQq64WwsuSuGuotm
 Tma0kqwWlVIrdoPkFwNNp1EKwjrbHIS/2jLELJVbGWtRfO3N0KAi5V/Z5
 sO9z/PsoCEmKXnIGaZCPB69Jjp7hnxSQZjzf43JITeVl9GvfoNST37wS/
 OCpzzahq5eq77yjHn0gvx4GuJRnh+TmULarK4VqT6pv4TflP7+lCchCeJ
 TsbJtbXh6lJ+qNTygDEyTotVo/2zXs4SS5UH4fwsz1InQxOswdqHfPWy6
 w7nrmu/vtJ/ujnxOPyK0DayqLyfUvGG6K3QXVTynLUogCD+Xlo6aHgjk9 A==;
X-CSE-ConnectionGUID: Lzt8W6JIRrGkFGls4LZcFw==
X-CSE-MsgGUID: dkT5JY72SJedQ3JjnphWIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89588809"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="89588809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:02:53 -0700
X-CSE-ConnectionGUID: wL+lM1uRQyOLstgLlyIESQ==
X-CSE-MsgGUID: m4LKWFYcRN+XolQp8rWN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="234894120"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:02:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:02:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 12:02:53 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8xDgRG4ZkkNed0BGXXdTqF+JG1Emn1CamQS0vnRGNWiFY8GNrLj+nSgFn++t8kAn28XsEavrGmn1VdCxQU08006CyoFeXhjMyHyMLXC38Qe8esctl8rR3ItY+T0/6GJIHxQT2SVHobL58WGd8QKqC4E9a/+UOUNDtxpujtJF2TElOcqURyf6EfrpWAWVMy6l32mxwXYtMRy1BfDIptIl4wvvimOMrO3+KeIn1b6YH8OvaLaziMX0TTdziY5Ep6M7C8j3M9ASLNPaoRmGqii1XoeLMkwt9BlYINvOTvHLZ9ssGQ8srnvoZq01jWyEQyRT01tjpoLNkRd7bk5NgDuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kx1+u44GXL7AzpyT28bxCrAatjYyQ3BdukT3GUsjM1Q=;
 b=SpdNz4Qdx9MneUKLHE56HhXOrP5CUn3Xk3bsSWI9Y5miHnEGCoHAh1XinGmFwueLGH0nZZ2suOVngcGwTEqxbSgpHtK3eyJmr/hOLz/L6YZ866vaBcugalYXuIDBckMYbP4RfflW8OJOfUdf5ouB260I9Tp6Q9wbIEwdZwVtz5IKPp8jfgxstnGnMZM4wd1v/SoGDJ2SZ+2ssbLuzVHucB9/AIAvi1ZNzYQ8qeW98OPiZkgTuM9C+0vbyFVNTreZHnlla6T26wwhF0OHRu5OTBx1Z6l5NS5KIN7smOoXmcb/XW7u0h/wAO5mQeGrlr72xFMEz2P8hQ7vmbqk52e02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DSVPR11MB9743.namprd11.prod.outlook.com (2603:10b6:8:34d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 19:02:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:02:50 +0000
Date: Tue, 5 May 2026 12:02:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 6/9] drm/xe/multi_queue: Capture queue run times for
 active queues
Message-ID: <afo+1fbWcxJCk8c2@soc-5CG1426VCC.clients.intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-17-umesh.nerlige.ramappa@intel.com>
 <afluHJJvWpbcBTsp@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <afluHJJvWpbcBTsp@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0375.namprd04.prod.outlook.com
 (2603:10b6:303:81::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DSVPR11MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: d01597cc-3555-4d5c-f9f7-08deaad8e74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: VBi4s4qnGkFyNpnvZR0hlhBs9AQgOKNeLuQ3kLg9HKxuvEhTfOPAS2QqeTzAnyrDB67F43boCyhAsvKJmZk/a03jAHMonuw95LkmQZth35oAE9cvkNXHFjsCFEzMSTcL7/ofew0xfjpBGc8FYWfnXkM3v51Dbh3k9cRR6PCGo4e+zSixclDL2iSM5/ELT3AEfAL4Zxbo5Y66zL05xBmo6ewUYTOrfwz3bQjkCuuiELY+VNs+/ZvlcW2qdgyyPtLNw4WMRZBfBLMULXbTuXgReeBOpO+UCWj4bOWLTxTYXIrRlBdHJVBuoL33/+Rtze7LDwqQ/ycuGH4MywdJH75RZFOWJZpP16eflY9uA7LRkf0/mnrAiD1DrCpjbIe/aQMZlEng69nF/eVRappuH38/GFWymNRBthN24NjwRJSfJaM2S0Rf73Rom+DZnRGfEwoUucm21+UatuXFCpzUvqVeRD6bd6DI9hFQptEHr6Q2Ja95raFm6wAS8c0aBFleNlKHqLHD+U7yHduZfMyC2LWHkTm57RNw4XHiGOt8pRPXUAlN1uhgFz5O4/c3wNwREYYb/k/t+iq6gYN/q92Jut3aVH/S6SxaEHYcLtLgnHveO0O7b4KxGNKPE8g8EMICiX/23Etcx5lvjAVZeWo8fo6HCI+wys9x9P2rdVtqiVfQ12s6WazKl3r1GVZhPpKsSNyG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmNtK0xsZnFlOG1uS2dwWTd0Q2JoT2ZIWU5oOWFqMnZKZkdqdk43SHFGajRx?=
 =?utf-8?B?eC93eFNDTGN0TEJRbzlCeHN2cG92TnBZV1Z1SmdaRnArQXVUMDZlU01xK3NY?=
 =?utf-8?B?L2RWV3pOTVlYM3BEZ0ozaW5UaVBaUFhoTnJHZ0lkWTlqa2VtcVlsUDBJTVBK?=
 =?utf-8?B?YitvZFYzNHFOZG96RTYzSVN4Vk1LRXZnMERHVTFEWDhTdVpGSTRRejZ0YUdD?=
 =?utf-8?B?cE9MYlU2UWVRcEVKdnVIbk8yMEZkTUdoUkR4YnJXN3lZZnNoRjhDVkJOVnhs?=
 =?utf-8?B?enF0TW5NS1FhazNEb1JwWGdLQWlqYmx5aUN1N3g1RzZPL09HM2wwVDdFaGNO?=
 =?utf-8?B?MmZuczBSRTd3KzhyUjNxVExsckthanpsNkNnT0t6NEZQc1ZtTFVMeGtNZ2tL?=
 =?utf-8?B?NlQxNmxpcWROWXRyYkc0eXNNWWMxdGhjdG51cWpiN3NnTEdrQWRlS2FDNEF5?=
 =?utf-8?B?OE81UkRXRWZ5dU9xQlh1SGxHRTBjc0gyaUNuZU1XaC9LcWdOR0JWTC9GbVk4?=
 =?utf-8?B?VmFmOFZDdVpKVFFtallia3hXTlQ4dGVRRXFnTS92cjFRTzlqSjlGbVRvWEpO?=
 =?utf-8?B?MEMvdUd1bVE2TkZCcW9xcDIxOWJSRzRQYlRmWEpORkZ3bWVIMlVwZ3pGZFps?=
 =?utf-8?B?LytndlZ6ajR1YnNBWXE0WGZ2YXdpN3hyc2xUMkxjVGgvOTF2c2NJcTIvdndC?=
 =?utf-8?B?Q2VWOUVzeGRsYkwvT1l1YkZpb1NXQWJsQjRMOVVycFVjbjFOR0ZRMFJhaTUx?=
 =?utf-8?B?d3J6VGVOWGVuMlBYMGxoVTZHWUtVWitoZi9ybTBwakNCOFZONWRBT0Fsb1dJ?=
 =?utf-8?B?cDExaDl1VUU1NGFRbDJwSmE3eEpoSjlQZTFJQytVME9OdTMyZHdJRjRRcTdz?=
 =?utf-8?B?eHliTXUwRmdsbEFxTC9WVUhlNzZHMTk1T1IwbHdZTld4T0E4STNEUDBrcnFD?=
 =?utf-8?B?YmFoWGdNS21VK3BrckJuTmYwcnpUYjFOdjlER0l5NkhHU1UwOGgwMG1qRC9m?=
 =?utf-8?B?UjMxSzBvaCtuNmNCOEZOcU9sQWpXWmdsK1NvL1FRemRoaGdUT3A0SzlqSjJk?=
 =?utf-8?B?OW5YZnkyd2ZibGNtNVk1RXZma0gyaWY5NEk5Q0lFUWVEVWpISW5RT2gzd1hF?=
 =?utf-8?B?SFV6emVXWFIvbnlhdmE3WCtVN0crajZBNDlOZjREYlhVMXV0RnNDUERpNksw?=
 =?utf-8?B?MUx0bGRtZFZoSEVKMWplQ25WSjVYS3ZYYXI4cWlYMGZ2MERvU0VXb0xnekpn?=
 =?utf-8?B?S05nWm8vZHpnN014NDlRTHBBUWF4K1QrTXNBRnZBcjJTVEcrVWt2b3BWTERW?=
 =?utf-8?B?amxkTHJBd0QxM2JrL2I2dEpKWW80TUhmLzJmRnowZXk1TXdMWUxkd1hqWWQ1?=
 =?utf-8?B?TnRxSm1uWE1DWW9JZ0JXUnBXd3RUQUl4VVFpeWZ6UlFIME5Ock9WZUxWRkhi?=
 =?utf-8?B?UDNuRis5ZGc3MTlQSlhUSWxKUmRkcXZwem5Gb1hPRTR5dmpPNTFXN0F0NzNG?=
 =?utf-8?B?OHBtT0pKYlBNVG0xZERDMll0dUJWYTJIN0w1VFNhNkEwQTNtb2Z1VHBXSHM5?=
 =?utf-8?B?YmJ0UlVxeisralkrRExETFZGM2ZzS1gyU3g1VUlJNlZkZWR1Yk9KU3k2QjUr?=
 =?utf-8?B?U0UwejZTcEdkYi9MNHhibHcwSkFwNVowZEh3V3UzMTBBVzlSNElUaHRweXgz?=
 =?utf-8?B?S0hxS21SbHVTc0N0bEsxdEtPVFlYWDRNUFU3WkVYVnVydGhGTUVVMjBrZUp3?=
 =?utf-8?B?MUhBN2VvSURudFBpMmpvWW9RZmxsWFRoNDgzaENHMElCS3M4MTBwMlNXdlVn?=
 =?utf-8?B?Y3I2eTIyZ01BTE1zMWgzRlFrWGIwM2xmemhGY0lmbzFCbEJ3c1k1TzBaaDBJ?=
 =?utf-8?B?a1FVUFdvNlBXdC93aHI5Ty9tSW9XcFJBN3gyVjA0S09PTnJGcEVLeGFueWVL?=
 =?utf-8?B?U28zQ1FJV21iZ2xDcjcrS3NjUjFOSHhaL0xEVWlXckgzZUkrblgxekxsNTZv?=
 =?utf-8?B?YzZMZ1pOS21xb1FPaGkzakIxK3k1dUdwdWE3U2NQVHpURW5wdnNwbE94N3F6?=
 =?utf-8?B?ejhnUzFZYjJmK2ptMFFqcEw5Tk0yRUUzcXlsNWRSVU1aMUtObW9ZcmhibjNE?=
 =?utf-8?B?RnNhOTdHMWdGdVNKcnJ1aTZ1eXVVNUtaN2dOS0lqM29EOTdKUDJySm90ZFFy?=
 =?utf-8?B?WFNPV3BGL2dtcVFZMGd6QVRqbzYzL29vcFdFbTJwWHpYVXhFRDdnRkgxdWJY?=
 =?utf-8?B?Y1VwU2NWZUxFem1ySTd0NCtUZFRLMm13MEpMblRicUJXeGZ6MjlQc0YvTXVp?=
 =?utf-8?B?dUxINitlb1NQVlRiOTZCZDRYUUovNmRLUDh5bWdTYUliRy9iVHFmTzE4QllO?=
 =?utf-8?Q?RZ0Ko8DidQITqRMaPoLkuRryPtqvFF0R1QtPf?=
X-Exchange-RoutingPolicyChecked: cQxcCkFnk7F3u2SXF+TF6AGNdvF7xlw4doTHcIOhgSKKwLVZ9VHjl9+HVuOhRVQa8SSNyBdwhXA8CQOvXOeJnIdPW23DpralR5L3FYNR5Bt0xGUAbyiuW1birgXhMTwO72rUxN2eNcRP44GQoZytFwN95rwwhtFdn8Dy6A3+ceBe+rxg4fvxrPbg35wIYnXBVPLKdi5YcmGgGpPDkpCmNMLxrvwbUPUYX/ii2JUYV/JvaDdTrQdf0je0Je8pUBHDtMCPTzic+XoQdZztKx8HHIw+HYeSgsNRuzjFiBeZ0S9dGjvEjBjclZvYtw5OhpvN4T+G6OFoBxtSKJu/ZB8LcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d01597cc-3555-4d5c-f9f7-08deaad8e74c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:02:50.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMa7ytKqKgS3wMSfL0OmSx2ylb01wIQuPpQuh6dHczCtUZXFRgUgZrI7rt1WaLrXOSH0vZSQRiI/rycluNCbtMNcChDGh052SZRi+Jife84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9743
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

On Mon, May 04, 2026 at 09:12:12PM -0700, Niranjana Vishwanathapura wrote:
>On Fri, May 01, 2026 at 05:53:39PM -0700, Umesh Nerlige Ramappa wrote:
>>If a queue is currently active on the CS, query the QUEUE TIMESTAMP
>>register to get an up to date value of the runtime. To do so, ensure
>>that the primary queue is active and then check if the secondary queue
>>is executing on the CS.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v2:
>>- Move trace to a separate patch (Stuart)
>>- Refactor multi queue timestamp logic (Matt/Niranjana)
>>---
>>drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
>>drivers/gpu/drm/xe/xe_lrc.c              | 115 +++++++++++++++++++----
>>2 files changed, 99 insertions(+), 20 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>index 1b4a7e9a703d..af6af6f3f5e8 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>@@ -170,6 +170,10 @@
>>#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>>
>>#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
>>+#define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
>>+
>>+#define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
>>+#define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
>>
>>#define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 92419e5058fd..023202be5d52 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -21,6 +21,7 @@
>>#include "xe_configfs.h"
>>#include "xe_device.h"
>>#include "xe_drm_client.h"
>>+#include "xe_exec_queue.h"
>>#include "xe_exec_queue_types.h"
>>#include "xe_gt.h"
>>#include "xe_gt_clock.h"
>>@@ -2655,17 +2656,65 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>>	return 0;
>>}
>>
>>-/**
>>- * xe_lrc_timestamp() - Current ctx timestamp
>>- * @lrc: Pointer to the lrc.
>>- *
>>- * Return latest ctx timestamp. With support for active contexts, the
>>- * calculation may be slightly racy, so follow a read-again logic to ensure that
>>- * the context is still active before returning the right timestamp.
>>- *
>>- * Returns: New ctx timestamp value
>>- */
>>-u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>>+static u64 get_queue_timestamp(struct xe_hw_engine *hwe)
>>+{
>>+	return xe_mmio_read64_2x32(&hwe->gt->mmio,
>>+				   RING_QUEUE_TIMESTAMP(hwe->mmio_base));
>>+}
>>+
>>+static u32 get_queue_id(struct xe_hw_engine *hwe)
>>+{
>
>NIT...may be rename it as get_multi_queue_active_queue()?
>
>>+	u32 val = xe_mmio_read32(&hwe->gt->mmio,
>>+				 RING_CSMQDEBUG(hwe->mmio_base));
>>+
>>+	return REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK, val);
>>+}
>>+
>>+static bool context_active(struct xe_lrc *lrc)
>>+{
>>+	return xe_lrc_ctx_timestamp(lrc) == CONTEXT_ACTIVE;
>>+}
>>+
>>+static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>>+{
>>+	struct xe_lrc *primary_lrc = lrc->multi_queue.primary_lrc;
>>+	struct xe_hw_engine *hwe;
>>+	u64 reg_queue_ts = lrc->queue_timestamp;
>>+
>>+	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
>>+		return xe_lrc_queue_timestamp(lrc);
>>+
>>+	if (!primary_lrc || !context_active(primary_lrc))
>>+		return xe_lrc_queue_timestamp(lrc);
>
>May be print a warning if primary_lrc is not set?

I can replace it with an assert(primary_lrc), because we are here only 
after checking multi_queue. Otherwise the check is there only to make 
sure we don't do a NPD in context_active(primary_lrc).

>
>>+
>>+	/* WA BB populates engine id in PPHWSP of primary context only */
>>+	hwe = engine_id_to_hwe(primary_lrc->gt, xe_lrc_engine_id(primary_lrc));
>>+	if (!hwe)
>>+		return xe_lrc_queue_timestamp(lrc);
>>+
>>+	if (get_queue_id(hwe) != lrc->multi_queue.pos)
>>+		return xe_lrc_queue_timestamp(lrc);
>>+
>>+	/* queue is active, so store the queue timestamp register */
>>+	reg_queue_ts = get_queue_timestamp(hwe);
>>+
>>+	/* double check queue and primary queue are both still active */
>>+	if (get_queue_id(hwe) != lrc->multi_queue.pos ||
>>+	    !context_active(primary_lrc))
>>+		return xe_lrc_queue_timestamp(lrc);
>>+
>>+	return reg_queue_ts;
>>+}
>>+
>>+static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>>+{
>>+	*old_ts = lrc->queue_timestamp;
>>+	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>
>Same here, add a warning message if lrc is not multi-queue?

The function is only called if we are multi_queue.

>
>>+
>>+	return lrc->queue_timestamp;
>>+}
>>+
>>+static u64 xe_lrc_single_queue_timestamp(struct xe_lrc *lrc)
>>{
>
>Hmm...NIT...we never used the word 'single_queue' so far to refer to
>non-multi-queue case. May be rename it to xe_lrc_ctx_timestamp()
>or something?

Will try to rename

>
>Also, may be update this funcion to make use the newly added
>context_active() function?

I had given it a shot earlier and that became slightly messy. Will try 
again

Umesh
>
>Niranjana
>
>>	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
>>	u32 engine_id;
>>@@ -2697,24 +2746,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>>	return new_ts;
>>}
>>
>>+static u64 xe_lrc_update_ctx_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>>+{
>>+	*old_ts = lrc->ctx_timestamp;
>>+	lrc->ctx_timestamp = xe_lrc_single_queue_timestamp(lrc);
>>+
>>+	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>>+
>>+	return lrc->ctx_timestamp;
>>+}
>>+
>>/**
>>- * xe_lrc_update_timestamp() - Update ctx timestamp
>>+ * xe_lrc_timestamp() - Current lrc timestamp
>>+ * @lrc: Pointer to the lrc.
>>+ *
>>+ * Return latest lrc timestamp. With support for active contexts/queues, the
>>+ * calculation may be slightly racy, so follow a read-again logic to ensure that
>>+ * the context/queue is still active before returning the right timestamp.
>>+ *
>>+ * Returns: New lrc timestamp value
>>+ */
>>+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>>+{
>>+	if (xe_lrc_is_multi_queue(lrc))
>>+		return xe_lrc_multi_queue_timestamp(lrc);
>>+	else
>>+		return xe_lrc_single_queue_timestamp(lrc);
>>+}
>>+
>>+/**
>>+ * xe_lrc_update_timestamp() - Update lrc timestamp
>> * @lrc: Pointer to the lrc.
>> * @old_ts: Old timestamp value
>> *
>>- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>>+ * Populate @old_ts with current saved lrc timestamp, read new lrc timestamp and
>> * update saved value.
>> *
>>- * Returns: New ctx timestamp value
>>+ * Returns: New lrc timestamp value
>> */
>>u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>>{
>>-	*old_ts = lrc->ctx_timestamp;
>>-	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
>>-
>>-	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>>-
>>-	return lrc->ctx_timestamp;
>>+	if (xe_lrc_is_multi_queue(lrc))
>>+		return xe_lrc_update_multi_queue_timestamp(lrc, old_ts);
>>+	else
>>+		return xe_lrc_update_ctx_timestamp(lrc, old_ts);
>>}
>>
>>/**
>>-- 
>>2.43.0
>>
