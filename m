Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAA7C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 00:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAE010E24D;
	Tue, 11 Jun 2024 00:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMj7l+ii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A34410E24D
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 00:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718064549; x=1749600549;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZfYHXtcN25wF8AB3cF3rvgf9SHR1iWJ/EF7PGUAPVag=;
 b=lMj7l+iiRhbRoVNwEX16z4AmwdTQLFzGbGeloRDPSufjbAiJaFH95wh4
 2+RplMIEpogG/1KnaPHKgezD1mM48+8J/+ph5AYp9ZwT22AgWob68RfYJ
 2iilAHlFmBfF0a0jZS+akGtpLeFGVO1xYFl3dJoY8OcT3cMt58pYwONsH
 QtZi/w4pyyZp5R6Y9NAmkoaNplTuh5ygJ78BclS+WXv0bZ6qzP8c8+7ag
 k+fXNnMmsdyNfhCSZGNt+ce8c2DH/57LZde2xLdSrXp2IG3YYz8y7ueJe
 CEIwEQsbSGE+DGd4PZjNqPHpQEkV1F3co6GZuD7vyWSuCGSWugvs0xiim Q==;
X-CSE-ConnectionGUID: GO60yjsdTHW9C02eeKHXxA==
X-CSE-MsgGUID: Wvf1c97OQ0mv4tZi8Q1rlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="37273875"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="37273875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 17:09:09 -0700
X-CSE-ConnectionGUID: 7B4ReMDaQXW2YhMdN/ARTw==
X-CSE-MsgGUID: bpc0mCShTJC841XSjX3agA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39073640"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 17:09:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 17:09:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 17:09:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 17:09:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 17:09:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPSjwbCk4LKO8STP0etsBzdTLKQyxD0WdJZm7vu0BXQd86U8CC55SazRqjymwt671tId9fo4+fc3UAwjHrTuBV3+FZrmEEBs8K7oMWDGMC0x9jKKi9QSF9YtGWiC4mJ/HrE7SCDTHjQfZrxxKgCU2ng2v9U+mU+8aXQlRqRDsVzkN0Y6t1r1vI0YgoUMYBnKIJ0z6Pe4V/FweXSJfGm+UmzEtmWg15H0qU6bYhe5IS40sGqkPTd+kExbAy6gcPwcOkvZ0KBXVh/KZpvPMp/ErOR2bibH6tKCWwS7a/nRAOMN3gOOmdpbiGQ1X2McjFPYIj9jjaUcsD+/V0q4p4gnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMCA73N0ETbjmW8DzkGUFhHPc7s1OGWnI/CBDm8cq8A=;
 b=YGg813kheH0xVospPgdTHcWqsfsTv8682hwXcb1qEmeDozVcnRwpyjaWEGplpmAr17aCrWPdg4j8o0jQcl/8BVrMrvAtQwarkyY8LRFxXvt9G0CFBdEPgI5O7n7NmQvV+WvaL3Jgbort1NdRTAbcXwN5ub1i+bYh5IqV2xuFM5O4/M1bB8udCH+yiR/UIEAl4+yhpPuiH0H784BgA0ujYdHJjJzEeg6QxJC7c9dDN/OTCVf03Wklt017lzSVGgSc5brKhdvWM7uYXhSw+Rwmp6TIbWw75xke6vIoEvzEP8pS/T9W7SH+24Nr+inflfYDIlPg3r09GPdqAR0cYU1O7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6835.namprd11.prod.outlook.com (2603:10b6:510:1ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 00:09:05 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 00:09:05 +0000
Message-ID: <328a4647-642d-4d39-8d3b-dc69cb7ee4ce@intel.com>
Date: Mon, 10 Jun 2024 17:09:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-7-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240610141823.2605496-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:180::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6c4b64-b4d8-4794-a17a-08dc89aab4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFVCOGxPMzBDQm1ic1h3ZXZsOE5lMWI1dy8yL3A5am9XMUpTTUs3KzBNeHY0?=
 =?utf-8?B?L3hUT253MG1UaGgzak1TQkJXbGVwRy9tNjVpQmNyaGFhc0FWUm9CWmZXdEdw?=
 =?utf-8?B?OG1md0ZLcWpjWFV4cVlwbUdDYnJKK2FodGdFTkEwQWVmWUtVd0dUSXYxU05h?=
 =?utf-8?B?VkJOQ0tSejUxNlNISnJyZmNneHYzU0RNSWJDS0VuQ1VheXk0eUZseUJMNWFZ?=
 =?utf-8?B?QitvUUwyVkNINFpFZi9DTUJGWERTc295S3gzSUcvMlRqMlR0enozeWVMRlp5?=
 =?utf-8?B?SmlpK1JVeTM3a2J6a0orSGhxOWV4cHRZa0hEK0k0c0ZZL2RZcVBqb0p3U1pn?=
 =?utf-8?B?aGJBQUlaeVFXZGFRVG5vcHpCRE55MEIyZVc2cEpZSG4rK0dUY3BqU1pYRlVE?=
 =?utf-8?B?Q2ZyOHBYc1N4L0FWWFd3aTlrZlFiczlRWUs4MlRHeDluTzVZOUtXNE8xOE5E?=
 =?utf-8?B?aktPbStjNTFSOHk1QkxvLzlSVFdRamhKd2lBb2xISXpBaU9oYkJpczNVQjFt?=
 =?utf-8?B?bWpwNnBnN1VPWG1kUEhVbTlyMEdzYjhkOGhETGtwNi9CdkMyUVdPazM2dyt0?=
 =?utf-8?B?VDczZUxxb2hyaGtkWmlTaEZyUU9qUWdXM21wY0RtbW56aWVNL0ZqMll6aTRt?=
 =?utf-8?B?SU53MVhLZ0Q5QlpNQ0taUEN0VDFqUDhRSndJNGdJYnFnR3oyQWpScE9kcnB3?=
 =?utf-8?B?Z0RTVnRtdjcyZjIzcURNRy9PWm5pdTNBSnk5OTlaZXk5dUVsd3N3eTBRQXlC?=
 =?utf-8?B?VlZsc3pJU25uRXo0VWdiZXNmREV0TVhwYUJSMmZvMVpMNjhUQURFMHRyMGNN?=
 =?utf-8?B?aFJuMDN0ZS9aMnNoTjA5WGtNc1R4Z3hqYkRWTzVjTVpSdVpITVVvN3ZrMUtw?=
 =?utf-8?B?WmFOdHJDaDF3OERBOHRGeHJjU2FPRXg0SDJSR0NnN2tRSTZVYmxDeEU2RGNB?=
 =?utf-8?B?eEladEp1SXB1ZDFRZjlLSzJDVFhpWjAyZUNRNTEwWkxjUkc0MEhjZnRyY093?=
 =?utf-8?B?ZnZ1d3JoWURYMDQyYXUwNXFjcC9rekdPYmthWU5waWdTSWhvWHNXN0lHK2M1?=
 =?utf-8?B?QTNpeE1Dbld1RVh2WCtJOTBxR0JZVGJxMSt5anJ0QWdjbHR5MEZoQjNsZUI5?=
 =?utf-8?B?Mm1aMTRtYUkxa3dTV1BOYWZpUWpLbXo1cXVKYkNMeDFtSTExNXl4eVdkZ29l?=
 =?utf-8?B?Y2NWaGs2R1V4dUJPYkswNXJSYjJ1THlxUGhuMUs4SHdmc0preEFzSG96ajRY?=
 =?utf-8?B?ZTVpc0VCdFJZdGJXVVN6UXJncCtReXJhM0VDWGtFYWE5YWEvaWxmL21LVUdr?=
 =?utf-8?B?MmNaUFlUYnRWT3B2SHJaeVVuVzdKaCtKbVRDbUVZb2VVQUluQm9JVkZWRU1q?=
 =?utf-8?B?Tk5KM1M0YzFPQUdxMXJkSzNvbVZnM2lLSGp3TXVjcHdFQTdxdWx1c1Q5emtD?=
 =?utf-8?B?aFhaVVZHTnQ1SGVRWTVKcE81TXh0bnd6Q0lHdkIyRWswQTkzeVQvN1pHaDdw?=
 =?utf-8?B?UEE1bXhRYlZQeUZCSVVXMmVlSDFtZ3JsSG5xdTF0UlVFNmNYNFQ0UllpL3I5?=
 =?utf-8?B?TzVpTlcrSjk5UWVTaWFnc3ZBWG56UDhkZnJaeGhHSDF3Rm9jdDhBbGZ4ZThT?=
 =?utf-8?B?L2JNczR4cytEdzdzZ1pDY3VSMUhoODlEbEhXVmZ4NmwxQmJsVU9TWllOUzh4?=
 =?utf-8?B?cFVjY3lvNzZHemd6b1d1a3pGWjdkaHo4UHhLa2tiZitTWEhramhpZk82c1dX?=
 =?utf-8?Q?WSHe6AhKR91R19Y4QDTuAvy3d9TWMqwRfgRChqh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2RBVEp4YnVhQU5rVTFSc2o5VVRnU0NFc1h3V3ByTnJpSnFJSjNqa2JaRE42?=
 =?utf-8?B?WGpPQStYbDhMdFZ3T2tIcEJURVhremtUbG0xTjA4Z3VCRElkeXNXT3lIZVVK?=
 =?utf-8?B?V2tNY3B2TU5JZU9QSFVDWWFsQnZhMXVXV05sZk02dnZWam1Yb1FtL2cwWVFl?=
 =?utf-8?B?OGU1VVNyUEdJRUxXdzRVdk9IYWh2TE1nOUl4OGlUaG14VDFBUEs5UTdkZnRR?=
 =?utf-8?B?b3htVnhpcC9hRmJaYU9aejZZcGdtVTh6eHcxMnRGeVhEaDNhOUQ1MjMvMkhP?=
 =?utf-8?B?dzU3K2dYZHNzYlZNdTcxckJuR0NjYVh6WEVkUERFUGYzbzNkL2RIWnJ0S1lx?=
 =?utf-8?B?R1lLSkpBQXlaV1pUcFZQb3phd1FvdXVOT0tKVzVkMm9NNzdzSnU4TGI0RTZr?=
 =?utf-8?B?TDZ6N1U5SHJXSHE1SDdCSTRDc2FjL085ZWRzME9YUWU4dytOQlVqVnNFUEp6?=
 =?utf-8?B?U3BaS2s5VmY0VmRVTjBLRHRzbWZDUHU5aDh5QzdPKzZtWWVCU0ZNN3FTcHNO?=
 =?utf-8?B?MnkrMUd5TzZLVzN2bHcxNGQ2OGdKQnk1SWUyY3M3aXFkWFVxS0hWR1dpNkwx?=
 =?utf-8?B?Mk1zRVNZQzU3OFBCOE9UMlNMWVFqUnBhY3hsbGRjMkNqV1ltajh6dnpGYTRm?=
 =?utf-8?B?WDB1SlhFazdaVEtmSktnUnErYzExeTNYdGJaaEFncUhKTlNQeVNrYVR4Zy93?=
 =?utf-8?B?OUhCaHZiVmcvUGtUZlhNK05QUGJQK3BXT0ltWC8zL3d5V3ZjblJSWjJYN3px?=
 =?utf-8?B?SjRWUW1YTWFQQnJaNXBHOWY5dU1BSGkrWmdKdFFoamE2RWwySWZJMzY2V2Vn?=
 =?utf-8?B?Nkg1aWtoMFJTeWZBUnJFbFpkakJzeGtrdTlCbERUZithanREZ2M3N3AwNVNN?=
 =?utf-8?B?YVBiMlFjdjBzZ0dMMnVmYUozd0R5T1dwYngwYVNhWTloNmRnUlJuSTdOUU05?=
 =?utf-8?B?SkFJQ2VIWHFpdXJoTnBlekFKUU9XT0R6VG02SWtVUmJsYms2ZkhhZlNvMHBo?=
 =?utf-8?B?RWFxVDJCVVZSNFlnRzlyVzMrWHVmbnpocHU5dDVHVkxjczY3d3hOSFNaaXMx?=
 =?utf-8?B?RllSQURRMVBmKzVSMm9FVDU4dzVmMm9Xcks4VllUZkw2UzdJSTM5SGRzZXJJ?=
 =?utf-8?B?U1pGcm9KUHg2bGtVdTN1MzlkdUxOd3RHU2dRYjNlcXE3T3Q2aU9vOFN6dEp4?=
 =?utf-8?B?T2hLZXM2bDI0a0swdzduc2xzNmFWRkxneUt5ZWxkbkhLOFpNYXg1VSs5Y04y?=
 =?utf-8?B?Z3lKVzdaajdFMlY1Nm1VSnZ2SXVtSVV4YmlVRG9iMC80L0tJUjdLeGtYQ1JD?=
 =?utf-8?B?ZGdaVmdYKzJJZU84bmZCOENlTzdDNUFUZ29FQ2VqZmVZZm4zcC9sT3owNTNP?=
 =?utf-8?B?blM5bjZFNG90bkxIaEQxMlUzKzBSNDZEdU84WDJob3didEd0a1h0SkIvVkFv?=
 =?utf-8?B?Y2xFaEpwcFdSL08wRTNCNncreDA3QzhNdjVlNHd1bjFreml5Tm8zS1ZZbjhy?=
 =?utf-8?B?c1c4M0tFV1lpQUNRcjVieHlzNGhhcnRHMjlWalhZTkxvVlVjTkZOOWl5anBv?=
 =?utf-8?B?K1dkS2tBY3BVWkdJNkdza1QvUlVkbXppcnZ1d1IvUlhOR08wS0J6cGJVbnRC?=
 =?utf-8?B?Y05Nc0txZmx0ZzZaM1VpWHNKVVJKbVViM1E0RDZCNmcxZ3QwbEFDbURBVXNt?=
 =?utf-8?B?TjFESGxZU0tSYVVGNlZUOTlTRDlHVGxHcTZJODFYMFhncXZKTlJtbzJHc1RO?=
 =?utf-8?B?TXMrTEE1ME5ITFFiQWhBQjNieEo1ckowNkVSYzFPOHJVSllkMzlBZ2w2UGFw?=
 =?utf-8?B?a2pvUHFKQklEQ1ExbmIrQWdIemxRcVphWHhmQ0thWXpPZkQzaGhrcXR3RTBS?=
 =?utf-8?B?bU5nS3ozbmlLQzFYVWQ4RkZkWXR6SWtaS1Nua0hqWTBqV2Z6UzV2TktvWEhK?=
 =?utf-8?B?bTl2ZE9ZRythNnlZUklSOVN2RTZ2ZUt6ejhLa01YY1ArQjFTaW1tTi9yL3Rn?=
 =?utf-8?B?UU15cC9PK2htUldUT2JidExkaGxxLzF5TnNyRndFN29yK2JPSlY4eGFXcTIr?=
 =?utf-8?B?Z1pENUtrS3l4WEhPdnVQbmxWNFR4bGhjMFNlOEl3bXJrTWl4S0lRWE5xbVZh?=
 =?utf-8?B?akhPTXlhTWJ5SGJDT0gzVlc3cE1pZEZHVjV6b0dsdUJOTE1tTk1qWWhTUXNK?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6c4b64-b4d8-4794-a17a-08dc89aab4c5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 00:09:05.1529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UmoETz86KCIdwJNVBXB4/FdlwOyhOXTG6YBrOdrKRKvkFL6Lqo7wbOPOJl0lSksRFpV8Q6alkdxjtRfYGzOD9lmMDMQyrrH/j0oTdOy+hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6835
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

On 6/10/2024 07:18, Matthew Brost wrote:
> Include G2H handler name when an unexpected error state messages.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4464ba337d12..766ff8e48dde 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1632,8 +1632,8 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   
>   	if (unlikely(!exec_queue_pending_enable(q) &&
>   		     !exec_queue_pending_disable(q))) {
> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> -			atomic_read(&q->guc->state));
> +		drm_err(&xe->drm, "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=%d",
> +			atomic_read(&q->guc->state), q->guc->id);
>   		return -EPROTO;
>   	}
My earlier point was that this G2H notification provides two words of 
data - the context id and the runnable state. The code is currently not 
looking at that second word. It is only looking at the internal KMD 
state and assuming that the notification will match. Instead, the code 
should read out the state from msg[1] and pass that in to 
handle_sched_done(). Which should complain if the notification is for an 
enable but only a disable is pending and vice versa. And by extension, 
should not do the disable processing if the notification was actually 
for an enable, and vice versa.

And as per Michal's comment, any update to a drm_err|warn|info|dbg|etc. 
should take the opportunity to convert it to an xe_gt_ equivalent.

John.

>   
> @@ -1671,8 +1671,8 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   
>   	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
>   	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> -			atomic_read(&q->guc->state));
> +		drm_err(&xe->drm, "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
> +			atomic_read(&q->guc->state), q->guc->id);
>   		return -EPROTO;
>   	}
>   

