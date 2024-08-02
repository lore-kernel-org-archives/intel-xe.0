Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A6DC3DA7F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADCB10E20F;
	Fri,  2 Aug 2024 22:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxeoNTvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6C410E20F
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722638705; x=1754174705;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=priytkBfEm5jmq3capXjpS8CtApEZChb5LbdAQ4v6yk=;
 b=kxeoNTvG6qIg49GCguc6VsZ1xSr7/1dSJtB5OU88l4uDqob6swuebfuB
 v8YL5vZ0iRPPK1hCtZLj5NycDW7VA2hcLcamYtyNtZ3AaG8/x2E+hdHlM
 N/LhlJ3dkOUrq+6gvVsYO+9XxzJiDL40uabTtj/bfxgYSmH/WXZsZoeYt
 szyui1Q3et412CLgKBoZ8mGDg5HkGYJ8iIWKb9F7P6Q9b+6XZAv7hmvjj
 jW517lQdzNt9wPldHg4iC/S7n14YxUZQyXRXC/YcvyFsow4T3X28DQ6ow
 fLsk9sDe8HlfC5VReTszKf9Y7/NmeGJiAASh06yHvA1RyJHDmrefQuXQI g==;
X-CSE-ConnectionGUID: cwO+yOVwQ2OjdBInnToPMg==
X-CSE-MsgGUID: S9/MG++KSfOWRiwjb0V7wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="32047735"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="32047735"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:45:04 -0700
X-CSE-ConnectionGUID: HHPukMPNQeai4PZ5uNxD0w==
X-CSE-MsgGUID: y2N5pMSeSzaJAIvItptyPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="55429184"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 15:45:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 15:45:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 15:45:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 15:45:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lluaVQJSxzsdClUPi0If83YAJH0/Gl8bSgE/mZEiWeEcXTMM6CllttJSrHvBKNnkclyVI8G6PXemvx8B0xwq+5ih3URPrwnLH23xq9PIg+CtoPWNhFHn8zKbXmVxmOJBFJsa/pjNPCKsgLlcS6OpcmMiehjjyhBpgrBPKeIUTPiiaEBei7ZQjXJ3JHYH3TVtVTZ8O55RlLEr1WipMOPiPsYuA0eS5NQ0s1kr8pj+qVsEZh9ALkxSJLUVRAfnosq/wRAF0yguAebjXkol1UAzibdOXFUHj6typL2/QefmsxleBxbw7Z5p4e78ym6kp6iVPlfI/Liw//59mdVC+qxGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1Y1rhlwR54Q3Z68QWBgjc9FvavhVQsmz5TJ4XF84DY=;
 b=TbdTwknkXp9xvL5yp8nlm261ZheQiISc6yed9kRrjXJBS2qa4mpMYAQ26XIN8FcC7QXX0Ll5rzz1KlzXcryFoc3OVd2PZLR9YEcmn2R+eUiYkL0ao83tVuFljbPdOl2B4/08dl1Qg8TR1vd6WUTZrtpBg0UugoqvX+NHT18zqdXBCYRzkJPhOx3cJzS457lp0PDeaw/xbkr21lc0jncgtra/wGcUah4nLUUDRPnY4RbBln6EQJaZuyJpPyZRpnMqlSIoycsM15xaUnP8M1WsSM3vevbaUtDX8VXpEH6hxDGusDFwcDdtxRMJB2t2XZJCp1dyluk079iBiUAjCH4HDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 22:45:01 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 22:45:00 +0000
Message-ID: <c5c3dfe2-dccd-45b7-8d48-ab7a8761e997@intel.com>
Date: Fri, 2 Aug 2024 15:44:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Enable w/a 14022293748 and 22019794406
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240802004017.3057708-1-julia.filipchuk@intel.com>
 <20240802004017.3057708-4-julia.filipchuk@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240802004017.3057708-4-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c0ff98-0ff0-4a3b-a34a-08dcb344bdef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2hrSnFwRlBnditzMXp0Ry9NNkJqcXBCZTVzcHlhdTQ0d0tKU1lZU0REWXUy?=
 =?utf-8?B?VFBRNWYvWjVGN1dDZFZRVkJOWElXL21zSm5RNUQyTnRYNkRyZk8reXVrWlRF?=
 =?utf-8?B?cFdlaVNIYWdZWlFHVVVxcHhMQUNjQ0VoRm1SYVd0MXRhL3VneGQ3VEtlQVpE?=
 =?utf-8?B?Wnk5b0NKS0NnQ2E1bVNIa2ZkU3hsa05NUS9OTmxDREhpRjVNb2Z5NTcvaDIv?=
 =?utf-8?B?b1MyQUFIR1pncXpPV1BnV1ZjMm5RbCtMS29FdGphMFdwbjJvWEpWWFowa1cr?=
 =?utf-8?B?Q0ZGb3I4Ym16Q0laeU1MbndnUFZRNGxoSFBsbGViaC9aSzRvWVZNNGVrdi9U?=
 =?utf-8?B?WE4veTVwazlJTEkyVnFBYmJFOTdWaXFoaU1KYXo2MHp1bDNvRjR5MTZNbmNa?=
 =?utf-8?B?a0R2ZWd5MDgvYlBJU2I1SFV1MDRYZGo3aGkvSEJYR0RlL25NN2thMDVsVW1G?=
 =?utf-8?B?UlNpTFhMNUNKcTRCR0FrRUQyQ1o5aUs5T0ZYd1NKZjVDd0RIU0xHeDM1cERh?=
 =?utf-8?B?QUQ0RGhpOXhrclU0ck5JeERNOWYxVlR4empmOEdQWWhNS3lOUGJCbmJMQ1Js?=
 =?utf-8?B?YTVkamFFZTVHbEN5TnRYWDhqaVhuamZEbHR1N2dhak9mbUx6R1QrZHp1Zjk1?=
 =?utf-8?B?QVdLZ0ZONEZoN0lVNE41SEV5cEtGOEJXaUh3RHB6ajlJQmJiM3ZsTFpSMFZP?=
 =?utf-8?B?dG56ODdZMk04SVBIaFFWd2FnUndwZEtNWkU0azQ0SGxzL24zbzYwV3djc1RV?=
 =?utf-8?B?QkJxUkRlZno4c09Rd3BkcjdUcEIwb1dVcGtndmhwdk9OM0x5dHRkM281eDJO?=
 =?utf-8?B?NS9sT3phOEhOTXR1bjFZOXdqcHVOUGZpTXdtSjZSVDhacXp6RU56a0Q4TERK?=
 =?utf-8?B?RXdKVTF3cmpZTXZIbkpUZmYwTHhrZm1uTVQwSW9jVHljWEFjbjZ5Q3NjMUMw?=
 =?utf-8?B?eW1sa0dlaGNQYUVUQWgrOUJiQlVHK3ExdGdaakZ6Wi9pUTZ4UnhPQmZtNUdR?=
 =?utf-8?B?UHlvWEUwa1VrWFFCMVlSQ1I1SmRZb3J1S0dJcFBlYS96SFc3T0x3SkVVdXdT?=
 =?utf-8?B?MUJvUWlYS0NuVHVMWDZUR2dLK1c1V0lkejhPMnNWTWZZK0VSVXArU0w3QW9G?=
 =?utf-8?B?UURQYVQ3NURwaGR2R0treUlHU3VuaktBOHVhek9IYmlBVU1vKzgzRDBWZmtz?=
 =?utf-8?B?S0pidlFGa0NpM2F4TWRUQkJpN1paZm9iNkhkakpUYUprS2g3Rzl5YWpQQVBG?=
 =?utf-8?B?d1ppSWxYb2lTSFBmVTZ2RU9aekxxRzliQ3dvckcyVmovK1hCYU5mWjJUeXZx?=
 =?utf-8?B?UnlYNjVrRDJ5S0NvTlFDVHVTVTI1K3kxZUN5VDBRcjFxQlRGVHcyTmNrREk0?=
 =?utf-8?B?QmtRclNCeXhhcHRKaG50cHJuYnNjTGdhRnZxLytaZjVLdGtyd1Q5UzNSaDBl?=
 =?utf-8?B?YmNZTjBVWEoyNFhDQTVPVDk0RmkrUVQrUWJjOXRZVzI0Z0YyaE1jbDBjNmhq?=
 =?utf-8?B?amF2R0kxMXY1NlJiL2dZSjlHMHBtQS8vbXRJZ25QbmJpWkczZFFIekhZZm5Y?=
 =?utf-8?B?QWhIRFdKY1hxYjJVS0dlVGgvejcrU1g1cWVDQXYzaDU5QmttdU1pc3dXTTlO?=
 =?utf-8?B?SXNoOTMvSERHVGpvZEFZMEJJSVZRQmUrL1phanpxRTQ5MGZPeUNXTWMzZXJD?=
 =?utf-8?B?TkUwMSt3V1dlcjVMcHZxdlRPUzdHc2cwQ2V4TW1rbHIwSm95MmN3b0dNekln?=
 =?utf-8?B?WmM4Z3lBeElsM29UMjVlTUVER3ZhN29NeWt3L3Q3ZUk5WGQ5ZENEOU0xbWE4?=
 =?utf-8?B?OEVRajk0NVBDNHduMUMyUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGNSMGtFMVRKSHJvMVRXRC9Wc0lPUDJMS3J4Mi9ZeCsxTzRDZC9XNFF3eGQz?=
 =?utf-8?B?dkNCdWdpNTFUcWxFb0hNU0lIUmJ4UjJEMG9hT0gzZFdXbksyMXpvVU1jR09z?=
 =?utf-8?B?ZG41YmRiQzlaZVBaV1p6c2tFMlZINVBLZjZDOUQvWHV3cUsweldlT2c0TW9p?=
 =?utf-8?B?bXRkSGdrNFFoT1U1YU1xcmJOMGJmakhiS3JxeVlOZW9STkhLdkhlYmRnaUJj?=
 =?utf-8?B?d1FpamJuMXQ5dHBrVXRzaVhFS0l3aExpK3lIMmc0MWx6OHB6eWFjeTNmZEZo?=
 =?utf-8?B?aThIaGI5aEZUNTJ3UG1ha0VueWRBcEN1cWExODVaSDc2b3JLWnA5Sm9VQ01I?=
 =?utf-8?B?YU96MUxaZlpNUXNUTnZuTTZ0dnNlcURKRlV5KzlPNXVoOE0xWm1QRDExTGtH?=
 =?utf-8?B?VGpxZ2haR3BnZkpRYzFwakFkVTBsMUhnNVE4TmxsRitNU2ZwSUc1YXhNTGVX?=
 =?utf-8?B?TktlejU1OGprRm00NFhjZ0xROUt6cDllVVMwMlNGOE50dE9HeG9jeDdWVDc4?=
 =?utf-8?B?RkxjalZodmtEeGNEQnl4cUxIdFdIUGg1SFBOeGIyOVY1V0pCaVY0dnZNNWM0?=
 =?utf-8?B?b05QeTJCam9FU0t4V3k2N1doTlFUb2FMTjVaZUdpRTRkSWlYRGc4cUdKaDY3?=
 =?utf-8?B?aUZmcEQ5Uis0NWxuQkgvcUZqNjFaOUNYTjZwNnlTL2tUZUxGWHNDcVZWcmdn?=
 =?utf-8?B?UGtqMkloNkVrTHoxVUwxZm5WaVFNeEJpNy85Q1VFUkJNK0tYSUtrcWNFYzdV?=
 =?utf-8?B?Z1lBUCtZaW16djNLcm83dnR1N0R5WXlzTW5PVTlHV2RTbHRLaitXcW1pQ1Y3?=
 =?utf-8?B?aVJ2ZHh0MGozSjBmek9Bc2R4OHdHRzRxb1hqVUo2WThJbG9iUERsQVloZ1Zh?=
 =?utf-8?B?RE10V3M1WDFzVUpwWlBqRlVybEhKNTZ4VnI4b0lGak5WdXRHQnZqdy9ETE0y?=
 =?utf-8?B?YUh0Vmw3VW5DTjVxd1I4M3lrRHRnUjh4S3djUGhaK2FJKzI5RHZHeGVjVE5n?=
 =?utf-8?B?ME03NW9OWDJEOGJKNkt0U2hmcmY4b3dpaTNzZkFySm9oQzRVMzFFYnIrZ1U5?=
 =?utf-8?B?M3UxQnUyaVpzVjlPY0g2OEpOWW1KdzdZUWV5OXBCQi9VRGlRNFBRbEhjSUFS?=
 =?utf-8?B?NFN6dlc1SGVqZDFzZEtUeEY2WEE1THlGRWVTSHY4cFVVempQcGJjOFplRjN4?=
 =?utf-8?B?dkdJU25lVXRJOTZxTjgvT2ZyQWJVcVBXcHFiUkh6cVpkYjlBMFAxVDhtakhs?=
 =?utf-8?B?RW9hdGordm9QOW4yOUpKM0xiaWJjeTNJMzE3VTczaEttd0l0blU5K0FWaWw3?=
 =?utf-8?B?VU5aNDdHR0gwYWpuK0d6Y2VoKzk2YTZoRTcxMTJuaHJKcFJyb0VNYTEyUWRu?=
 =?utf-8?B?cGV4V3VLaVd0Z2NhWFB3S2FmbHdoWmVLbWtXSjJxeXFZbk00OEJZK0hYKzBB?=
 =?utf-8?B?TElZbXFoNXkyTlk5T29IM21BbUllaHNKbUt0NTJ1MU9FeVhXdHNVMm5scytW?=
 =?utf-8?B?MGtXOVNtNHE5cW9zU1I5Q0diNlBxZTNwRFJZK1NmVHRMcmJCQ2VhUks1ZjQ1?=
 =?utf-8?B?UTF6MXlsektkYkJvZFAzRHVJSHpnUEczV3lpWnpWZEFyMEZaVzhvbzlQZFVt?=
 =?utf-8?B?R1Fmbkd2SzlyWVVPTmlGdVh6S0tCTk9ST09vR3RjTnZyNnhoNjVINkZHZzlX?=
 =?utf-8?B?R1JISWFON1hmWXBhZXBDcXFJS3A2a3E2Szc3Q2xDV082ODVWekx5bUprb29E?=
 =?utf-8?B?NFd5OGNtRUVIdjRmTnQwYTBqM20yMFZldXlRbEtobXdWZGlRdW0xS2lLNmZB?=
 =?utf-8?B?cGtuTjAxam1zajVKWVZnM1dNT3BPTlFvYlkzZVNsRzZMQ1A4SjZWemtDSWt3?=
 =?utf-8?B?eDFNNllndTRNQ1ZhdVFsZW1MVVJLWmFwbEhvY3BwREhlZEtVVXZZZ05VNGlh?=
 =?utf-8?B?cTJ4WjZqNngwK2NBb1JZVGdZQmtEZ0wzR1Y4YlpseVpPZDF3UndqMGlJSVhv?=
 =?utf-8?B?ZVlOZUdYbUFaWGZuUjdnOHlmVVYzYjBnZXFnMlcvSVhlOUVIdmI5ZHhGZFVB?=
 =?utf-8?B?dWpOQi9wZjgxMEtXbmVmanZaZSsrTlpXQUxlZElpaS9wVCtBZEVYaDJUbkhn?=
 =?utf-8?B?Wm9iSCtYd3JHZDkvanZlODFkSTJFVTZkNFIySG9SZ3pjV1FKa2RGUGJRWXJC?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c0ff98-0ff0-4a3b-a34a-08dcb344bdef
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 22:45:00.6916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoznGJRtEK/+4KLM2upV2b+jQzQASvNRTOgS5v430rTVHU6ESa9WsEGGKb5VqCatOaNxLNMC159ySZ4Z3kVZ/58sfzJo8Lpv5vac7DU6uuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
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

On 8/1/2024 17:40, Julia Filipchuk wrote:
> Enable workarounds for HW bug where render engine reset fails. Check
> firmware version supports the workarounds.
>
> v2: Enable KLV correctly for either workaround (Lucas)
> v4: Add check for minimum supported GuC firmware version. Enable w/a for
> hw version 20.01 too. (Daniele)
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  4 ++++
>   3 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 8f9f60b28306..6b30743a2f6c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>   	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
>   	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
> +	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 1c60b685dbc6..ba70e6a81d88 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -24,6 +24,7 @@
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_platform_types.h"
> +#include "xe_uc_fw.h"
>   #include "xe_wa.h"
>   
>   /* Slack of a few additional entries per engine */
> @@ -337,9 +338,14 @@ static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>   static void guc_waklv_init(struct xe_guc_ads *ads)
>   {
>   	struct xe_gt *gt = ads_to_gt(ads);
> +	struct xe_guc *guc = ads_to_guc(ads);
>   	u64 addr_ggtt;
>   	u32 offset, remain, size;
> +	u64 fw_ver;
>   
> +	xe_gt_assert(gt, guc->fw.type == XE_UC_FW_TYPE_GUC);
Not sure if this is necessary? If the ads -> guc -> fw route is broken 
to the extent of returning a HuC firmware or something then I think we 
have bigger problems than version checking a w/a flag.

> +
> +	fw_ver = GUC_FIRMWARE_VER(guc);
>   	offset = guc_ads_waklv_offset(ads);
>   	remain = guc_ads_waklv_size(ads);
>   
> @@ -367,6 +373,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					  0xC40,
>   					  &offset, &remain);
>   
> +	if (fw_ver >= MAKE_VER(70, 29, 0) &&
Given the other patch set to bump the minimum required version to 
70.29.2, this version check is no longer required.

John.

> +		(XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406)))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> +					&offset, &remain);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 540d38603f32..5cf27ff27ce6 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,6 +27,10 @@
>   16022287689	GRAPHICS_VERSION(2001)
>   		GRAPHICS_VERSION(2004)
>   13011645652	GRAPHICS_VERSION(2004)
> +14022293748	GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2004)
> +22019794406	GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2004)
>   22019338487	MEDIA_VERSION(2000)
>   		GRAPHICS_VERSION(2001)
>   22019338487_display	PLATFORM(LUNARLAKE)

