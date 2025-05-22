Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251E6C54E90
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 19:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A4110E188;
	Thu, 22 May 2025 19:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zh93HA7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8709F10E188
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747942767; x=1779478767;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PtkPxWUQqqSYAKHtt/L/RoIAlsCFgs7z/JgFTpEAiSs=;
 b=Zh93HA7MdQCur8EsWRto/Vyud5orV3Fx5pA3lgWcn5OhYKVIPAZEaAj8
 UZ2m7j0z2f3adKRQSvqAfDhBV33mPnjlselQyTJ6yooXi8/+u/ju7pyGA
 AA5A8DsE6cT0dWFIxnafxXMN3NWnXCUEeZgvgprROzxsCWnhL9mpAEwCh
 8C1fKtL7Bf6AdrttXPQwDqgYjXdKAD5CVT5r8CNM2VdtySNfcHY/hn+Me
 1O7doVnDqYBGdgZtj37eD8I3LcV7QTalOlM1MumnkqWvCOMUs4GLmPbgh
 Gfj48qvi8lQnOdkFFZLFO7w/v758HSGbM+uFkDHW32cQvEaa7pmsQxcPF w==;
X-CSE-ConnectionGUID: VP4hbFc1RwOtGJkagHlJpA==
X-CSE-MsgGUID: TtIc1OiDRVanW6IFxUTdjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60642422"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="60642422"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 12:39:27 -0700
X-CSE-ConnectionGUID: zjMz2Y9PQw2Uw8dQj0Y9vA==
X-CSE-MsgGUID: RT/Wg1OZQmq3NqSv2E6baA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="145695710"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 12:39:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 12:39:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 12:39:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 12:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOvhfx1kgPJ+wKxQ88lqhYuJljejzEOPaFBV5Zw2ApdNdXJoJZtZwEEtiSsG95JFOjZGCWGB/TQBvndbTfF0a0cBfWuKZIytwQ+zWEUO4T/h9E4c3tywrGQscKWL3HitolvFN0r48ysUjib/xBXCmGp1nGH1MgWVwBUFkaNuAt/9zEvuvvSNNmN14exG5SVojR1XQWx/l64lAiHZM2PfkuncZEy32Drk/NuxG+iAXD1gJp8l8CE7Aw3joRLQfxqP7G8folRxct0zFduCwCJ2TE+eSGIV9MgSAJR0b0pRE/I9qIwixYOdzrw8HdHR2D6IJN05nJkGnYmtziC9D0QgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpyuXG3Es8wBb17w6n+I71b9zZ4l0btwM6jU0ZzLAfs=;
 b=uw2xjAn5mXHY7r9fP5SARWB2aUFwqSiOkjX0y5jQ1qdqQFQFr4mrOLiCQ3G4y94xFbWNwwgAuL6YTcNoaNCcy+KSMUZHSzCPqOE4HzNtfcQUz2q3d+825dVQcI3sI5inXrfhyH68bepUx8wh1v+pGaMVVfgRqnpHsJOC3MBjKMSWUsSewZ2k2t5sliJuJfIPCvNomLo4Pfm1HOacEVtKwxQTR3vsb1/VEsaKL6M5bR6kfbmoD/IzOjurzjqLzZ1YakQTsqIWnNBR5P4LpDYWnGANdSQfzAmVbmfGdInHKKwDYOw/7GQOb5GKYjHPUj4XkwMsRFA7gAfOi14vHAubFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 19:38:56 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 19:38:56 +0000
Message-ID: <ebbae452-0a14-46dc-8e25-989c36bb0dda@intel.com>
Date: Thu, 22 May 2025 12:38:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
References: <20250522080020.2787294-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250522080020.2787294-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:303:87::21) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: c58c275f-5b86-4b3f-e56d-08dd99684a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wng1TTU0a3JRdTZVYXV0MU1BVHFEbGtIRExFRWhyOFo0a2JtVDZrRWlTYWxx?=
 =?utf-8?B?a2FvOFRJbWllY0Q3UmN3Mi82T3U5OGVPNGdleUtidGt1WnlKZkx5aVZnSFFC?=
 =?utf-8?B?WGNhcUNtSHF1MnpVcDZSWjFhbXVLTEZKR3hiOWxxTzR4cG9RY1haaWVVejI1?=
 =?utf-8?B?c3VzVFNtWlNDOTQxSDliazVsTG82bnRVTzBvZzh1cXh6S2ltanhXNFhsWnkr?=
 =?utf-8?B?cERaK1dEUWdwVmpva2lOR01veTl5aEpmYjRxMi8vK212SVkxOG9VaUpIUzRs?=
 =?utf-8?B?bTJCK213UGJRS1hTM3dHSlV5TS9NS0tsSW1talU1S0dEbjdIbTVzQVUxVHBD?=
 =?utf-8?B?UWlWaVVJaTVhN0dnb3psaVJMcmswbXVneWp4R0w5amJPNk5CaGlzai9qWVU4?=
 =?utf-8?B?TGhIejNkRUdDQWxKbGRnaU0vMCt5R1VQYXBxVkhpaWVkUnhOempKS2I3UVJX?=
 =?utf-8?B?RUhPZFFMYkdzRGEvZkFhc2dvKzQyUWVMVFNSazBNUWRDQUdlYVVwWjA4RFZN?=
 =?utf-8?B?MWJpNFE4M21QemFSTGQzckRRMlI0ZG95NDRlVmFTTUVYYWZIK0E5ZFJySUpQ?=
 =?utf-8?B?aUx2TmswdlVBRDVqMFU3c0NGaXlXUWxDZk93dzMzK0dwVE9YZTJ0enZjZGpt?=
 =?utf-8?B?cFFNVEd5V1RZOFdIS3IwblpvUk8wZzZoOVFJWWhMalBKa09TT2JzVDZWaDFV?=
 =?utf-8?B?SnY0WVE5QmdWRDk0MjFXOWp3ZUNiZUIwKzZTak1oVnQ1aWp6UG5JREdvQk5p?=
 =?utf-8?B?UGhINjlHU29YSG82S0RNckw2VVNGc2NBaWNwUHpham9wd3FLQ09UYnRKUlVq?=
 =?utf-8?B?UUQxeVdWcXl2a1JKV3c4ODNpb3psc1BUdVVDUXJrdHRMVVhFeGFSL3VYNnNz?=
 =?utf-8?B?U0ZNVytra0M1S1IzQVhMdDlnUE5FTFMwTUptV1VCeXdPMDJIZFlQdDVPVTVy?=
 =?utf-8?B?NHZrVEFkL1ZWeHlhL3plV2oyWEVMMlpVd3o1TnZOSGttaFR5L3BNZWxieXZD?=
 =?utf-8?B?b2w1c0Z3Q1ptS09oc3dqTXBJYW9ybjdWTlZRNE1yNXh6MEVVVUt0aW9CNDRa?=
 =?utf-8?B?OXQ1TmNhc05RM084SWFrSGx2Tkl6aGxiYnEzaEFObWpGM3ZEV0Z0eGJvUXlL?=
 =?utf-8?B?RHgzZmtCbXdjeEVJOGltRGZ3WXJ6ZWtOSDZJTlpqeUZZVlo0SExjMWEvSkNU?=
 =?utf-8?B?bzJoU1QxWXhEbG1aWk5Xb0lmOUdYdVNmdmtUWmJZTktTR2V4ZUdHbHNJOEJ6?=
 =?utf-8?B?VFpKM0x3K2ZBL2I3K1BFRHdUNXF0TXJuVytNTk9Ub3YvRnF5TDVRdTgyVXZK?=
 =?utf-8?B?MmVJMVhSZ3JHZ1JubVFiajRha0YzaDhMV2FWQ0xUL0hMRGFZdTFIdEpxTW81?=
 =?utf-8?B?WDFFY3B5Q1ZCUVpPOGkwSWt6dnBic0JGQStDZ0VYcE1HZzY4YURVeHp1ZXJh?=
 =?utf-8?B?WXlaWUZJVEVHQmRBVEhXa3lqS2lkK0lLSEp0M0FteXE2V3FuTVlrM2JQbFNn?=
 =?utf-8?B?MVlDYUpiR0NpV3IxYlFMVG1OS1V1NnhnUlVaMVBsOFFsaFUzV2tpMlAwODhw?=
 =?utf-8?B?c0JxY0FxR1pyOFNhamtSaTRab05UUjRHR0dCbkM0UlJSZU1qdHltbWh2dnlX?=
 =?utf-8?B?MFhwS1hObk5VYWJRQWMwU0dDOUV1TlRxTnExSkNlKzQvcnNtL1FwajFRK2RY?=
 =?utf-8?B?VUxQMWFhOHFQa3hQbWhFa3RPRzFneEFCZnk0dTJ6UGJ3SUF5VkRUMXdPSzdQ?=
 =?utf-8?B?OFZyeVVHQmFxWXRWSW1iNEZaTGlWWDNXVkZMR2FzbnFpb1VQU3NkQVJZZyt6?=
 =?utf-8?B?UTZKd1BYN3BPNGVtVkNyQ25sV1Y5TGsyS09XRWo5S2t5UFI1YVlndzFWeDkw?=
 =?utf-8?B?THdaUjZzdDdVYjVRbHlIakt2ZjJHR2hKdENyUEZkd3ZGWW1DV1VwRi9hU1Nl?=
 =?utf-8?Q?o3fH4Iun9tg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFJpcTRPeXArUHNldjNaNW1DZTdnWllPZG94bUhydHpkVUpOa3Z5NUMzTkVW?=
 =?utf-8?B?UEIxcDNuOUViNFhNU2xKOXU3UVZMY2V6UmRXU0IzbE1aRWNmaXYvL0c5MWM3?=
 =?utf-8?B?RG1kelgza3hodTVjYnI3WVdOWlNKb1F6TFFOUnBPd0JxZHR1cjh2MkVPTUZq?=
 =?utf-8?B?MWdMb3Y3UEFNcjNiTE9vNURLMFZGWUtmTjh3SjE1U0ZIOGRtRE4vYXRLeW1E?=
 =?utf-8?B?WXJuNURMYUtQZ3Ryb2JKQlZzTnkxZE90b3R3U2F5c0pvTk9oS1dVRjhOZ1N1?=
 =?utf-8?B?VGkzd001ZEtIaVJCTW1WRi9YMXdWWmNNM05POTllNW1tU2cvb29MOXdkd04w?=
 =?utf-8?B?NER0VVRIbFVrc091ZnBmSTZ0NDQzQ1YrWmZOdG5MWE5VRStDa3NKMnlGSS80?=
 =?utf-8?B?NjBBMEF0c3Vpbk1mZjlwWUlEV2RmOXN2b0srUEZVRmRvd281K1NxVVYydnlk?=
 =?utf-8?B?akFyRDE2TEdaVDhiYlZTNGUyNS9uZFdGZ0oxQjNoQzNkRHBhdE9ncEM3OUl1?=
 =?utf-8?B?eG5tL0Nra2ZsYzlIbWRJL2RhOEwzYTVsMDV5bm9nckozNWVIbklYZjJQa3RJ?=
 =?utf-8?B?dXkxSXdsMkFaYXFrT3FCamRUR1VneTNQeEhZQlIyUGljRDZGOWtQTnlIY0Rt?=
 =?utf-8?B?UFg4dlJNVGprODd1MGRFdkExR3p6YVFVajhOSnNDM1pyU3ZtSjhHem1GN2ZX?=
 =?utf-8?B?Vk1XQkR0MVBwNitRc0ZUOUdEaHlaaElwQWNMVi80QmNBTHVrMmZBQkZnQllV?=
 =?utf-8?B?NDNaV1QzZlYvNjBiekpIWFdqUS9vb3JVeG96cVZvRDArYU02ZnJKUUNzUFJt?=
 =?utf-8?B?RUk0VUY0c0RFOVNDbVdaMFg1UDVCSytuTG85TmRMTWxYOVh5NkJnZHpTbHpi?=
 =?utf-8?B?VVZkb1BPMFo4ZUZmNEFEUmxDUWJnYXA5dlBzSUZXSENWVGc2UDUwTk56WldT?=
 =?utf-8?B?RVVhdVVXL2JTanNkcEpXRmtVcGZCM2c1Vy9Rc0JJWUJDSjFUUFEzQ0tJbkg2?=
 =?utf-8?B?a1VmdjI4RU9lVWI5aGo3RUZXdmNtS2gwM0JkRThjWkl6Z2grZ0l6bkZCMS9V?=
 =?utf-8?B?RG5JMVRMNDVyemZiRnFSSVNMR1BiekMvTzZicmJWSm1QYjh2Z2VLejFjUTFp?=
 =?utf-8?B?blRuTnFWWDl0UmEyRllzUll4eC9WTk15eGwyc0trNnhnUUxqZzhPUThCQzRp?=
 =?utf-8?B?aWNySy9mNkk0T0tSU2xWQmhCUVJPYjI4YTRENThqcWs0RUZGNjhSY1dDdnVj?=
 =?utf-8?B?VHZTcnNqWTMzQVVyU3d4MWlmc0VhVWxOaDFIVGg4UWN5TjFGME5sdit1dVRy?=
 =?utf-8?B?ZS9iZ1hzeTJsaG1KazFtRDZCaDNjMTFFYklad2FONmthL091MXN5TnVhc0N4?=
 =?utf-8?B?NmZtOW9SVjFJRkNMbVJ1Syt6eUIyYlQ2US9xQjJQTEQ4aFE2N3hkaTdqcnU4?=
 =?utf-8?B?bzJqUWVCa3pzMlpZdmtiYkYxQ2ZYNHd4YVdMRVV3dkRLSzJwbTNJb3ppMmJh?=
 =?utf-8?B?WGlWNGNHczdlc0dYQUp2QW03Nlc3V2loSUcrMGtseVpDZWNyS3dPSlU0MDRL?=
 =?utf-8?B?U1kzdmF1L1R2d29mbUNhMUxSdkIrSThQbkFlZ0I4M29UeUJxV0dBa1BTRFdL?=
 =?utf-8?B?aHAyZzJVdjVEWjJzVFRTRGJWV1g5V0phcVpGVUE2L29rNEROWUtsOVVPcENO?=
 =?utf-8?B?ZmJVWE5vNU1OVFhYM0ZUVy9QcmhSUTBXaVV3UHd3d2FBVGJ0c2tkREdwNmda?=
 =?utf-8?B?eEJKQ3lUck9GTmVvYU9Db2ovalZkdG9MNTFSY2xYRm0rUTBPY0t2M1JuU0g3?=
 =?utf-8?B?d0tSTVNoZTF2SWNHa1Z6aERDcWJaSmVvY2laWUZ4MVpzZ3dza0VWb0RuUXpq?=
 =?utf-8?B?WmFUWnU1UngzSnE2SEFucVl0Q2l5MGRJdDNnekJkYVI4ZVYxWmFsdG9jT2JC?=
 =?utf-8?B?cWVDc0RrWUxPcld3c0J1anBHU1BYeHdWYWd5S1ZEaFdOWnEwTHRzVFRYeGhw?=
 =?utf-8?B?K1ZubW9WWTBtdGJnSHhSY0NSRFIwY05aVVhjdGtaUVZkSkhTbWFjdEh4VFNI?=
 =?utf-8?B?SWh0elJGUzJjbGtZbnNmT3JDQzJRMWE5b1NMdUtnNm9XRUEzTkFCWFFYOXdO?=
 =?utf-8?B?Z3JzSEpEcEFYRTVVUEx3ZkZEUW40bnVFajBFaUgwaGJIUlVMUzI3MjF6RjhG?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c58c275f-5b86-4b3f-e56d-08dd99684a40
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:38:56.0489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rX99evx7wpqAFwKDYlu0Za9aX3Bmm+4hq27meiQ7gkiuXEl5Jlwmps3zWaEQXWV6vZCeXFseEGO3wli5PAqyJN/ZGLo3HCUKL2NHyU00whc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7705
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

On 5/22/2025 1:00 AM, Satyanarayana K V P wrote:
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is
> injected into this xe_inject_fault() helper function, ct dead capture
> is avoided which suppresses ct dumps in the log.
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
>
> V4 -> V5:
> - Fixed review comments.
>
> V3 -> V4:
> - Updated the name of helper function and moved to xe_device.h file.
>
> V2 -> V3:
> - Added inline function to avoid compilation error in the absence of
> CONFIG_FUNCTION_ERROR_INJECTION.
>
> V1 -> V2:
> - Fixed review comments.
> ---
>   drivers/gpu/drm/xe/xe_device.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device.h | 14 ++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_ct.c |  6 ++++++
>   3 files changed, 38 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 660b0c5126dc..e1b4087a2974 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1120,6 +1120,24 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   	xe_pm_runtime_put(xe);
>   }
>   
> +/**
> + * xe_is_injection_active() - Helper function to test whether a fault
> + * inject test is running.
> + *
> + * This is a helper function that the driver can use to detect whether
> + * a fault injection test is running in order to suppress excessive debug
> + * output. By default, the return value is fixed as zero but it can be modified
> + * by the fault injection framework to return an error.
> + *
> + * Returns:
> + * 0 if no fault is injected.
> + * Injected error if fault is injected.
> + */
> +int xe_is_injection_active(void)
> +{
> +	return xe_inject_fault();
> +}
> +
I'm confused. What is the point of this wrapper?

>   /**
>    * xe_device_declare_wedged - Declare device wedged
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..13a43fe4fb64 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -195,6 +195,20 @@ void xe_device_declare_wedged(struct xe_device *xe);
>   struct xe_file *xe_file_get(struct xe_file *xef);
>   void xe_file_put(struct xe_file *xef);
>   
> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> +/*
> + * As fault is injected using this function, need to make sure that
> + * the compiler does not optimize and make it as a inline function.
> + * To prevent compile optimization, "noinline" is added.
> + */
> +static noinline int xe_inject_fault(void) { return 0; }
> +ALLOW_ERROR_INJECTION(xe_inject_fault, ERRNO);
> +#else
> +static inline int xe_inject_fault(void) { return 0; }
Why not name this xe_is_injection_active() and just call it directly?

John.

> +#endif
> +
> +int xe_is_injection_active(void);
> +
>   /*
>    * Occasionally it is seen that the G2H worker starts running after a delay of more than
>    * a second even after being queued and activated by the Linux workqueue subsystem. This
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 822f4c33f730..89f992feba31 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -2040,6 +2040,12 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>   
>   	if (ctb)
>   		ctb->info.broken = true;
> +	/*
> +	 * Huge dump is getting generated when injecting error for guc CT/MMIO
> +	 * functions. So, let us suppress the dump when fault is injected.
> +	 */
> +	if (xe_is_injection_active())
> +		return;
>   
>   	/* Ignore further errors after the first dump until a reset */
>   	if (ct->dead.reported)

