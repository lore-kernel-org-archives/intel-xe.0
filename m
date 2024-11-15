Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5392D68BCF
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 20:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC0510E3DC;
	Fri, 15 Nov 2024 20:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bw7DSUbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B685710E3DC
 for <Intel-Xe@lists.freedesktop.org>; Fri, 15 Nov 2024 20:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731700832; x=1763236832;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L3fBiQOU8stR/jwl1pNsZGUCGeEWg0lq7M/61Gwvuhc=;
 b=bw7DSUbGujTnmebT+VyHi986oYzKajitLBmuk+B1pvO6ITOzgkOcdPbP
 AZg8w8jTg42bFBpZTfRMNfm+PaMQ8/9CKFYC+jfLkXRMBfRHNJiu9o6p6
 p3jMZLhSJIyd2Br7BDI0281+jjX/c6tSqIm3bMMl+6MLGCm7q8D5A9w94
 DbAhshR4jO63ncLrxwLA8xYUJdamFhpIRbwUZ9Nf+kDCALSdSGNQ9mLz8
 LRaFK/2nDFdSFbkYo3mA/A6Y+OFXZt//UyuWybDSZgKFE1QEbEHjE+JV+
 zWPt4mQgoFjySnca8SbOV91Xu1i+fi7Cd0QUXakD8aMbWysbJjpPuYJ4N g==;
X-CSE-ConnectionGUID: p5UYm+UFTRupBh3QuIWOcA==
X-CSE-MsgGUID: eDPMTTkdQheNj2spNVNpWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="35483807"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="35483807"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 12:00:31 -0800
X-CSE-ConnectionGUID: mUOWIjKOQbmUCIV3LhCwmg==
X-CSE-MsgGUID: kBrgZk5CSTmbvJA0D97TIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88231961"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 12:00:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:00:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 12:00:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 12:00:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnV/jJOIemy63oWnWCu1e4Y0/9KqnocA5caqoQ37+qFEIC4BDO9mluonzmybiHoK/lBsGAt/PM/Vu/zKRpUXXsKw6zpQ5Qbvz++n1GRGD0uh40TXw6jRd6Wg7IGYH5MOBC4d4Qb2+ZBw9z1kUECo3c/yw7MVois6YBgj2e+mdsz7LR36dhtrLhAZT/zSnmcXPFl3Uc0szssWO9A+Jz86efsq0fVQFnA2gXB9g2zEgAkMECc+jsOlL+C4hvHTsILXju8+G1KR4n0b+ieXU0TSzXiChsjlTAClQN9OPG7gWHc/F6vmGztWwzGlzeyo5BqRMQx6ZGPDJf1PRPSnURfXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyEA08B/RbZ9VQD6cACpdmO9OvXK2cPpln3Z5kgjq0k=;
 b=fD2oltGhwCZ8k3KU/paJKjR1230IJwGSDFEexmOjMHarmsizznca7+xTQtUFSb/Ura621h6HLNHVS7Vaui8jSYEOeAQ0tuUb5yv+XlPPQULdkJoPyN1jQpkcoiH7JgSydiGq9vQzklKstv4yRPApBjPpz2Wez5vBcOUtWeyJO06mEUjyBhDaT3CQHHQF6tqSACYWpCnxaG5B3QEPibtaUhRBiAm4GawbZ5tx7meGgmKQpyb4MTwhlO54phZSYKVKTSR2b8gkshLjgoQsOEvoWm7hkWX6g+rw/LxlPAeCOFZwhIZ98qy+FYFkbmDGdDIfUfUg4evwD7EDU/Nwo3Csew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 20:00:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 20:00:22 +0000
Message-ID: <a52b5323-6d2c-405a-b23b-8727a67551fa@intel.com>
Date: Fri, 15 Nov 2024 12:00:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
 <ZzeczRm2B3ekqb4Y@lstrano-desk.jf.intel.com>
 <b2707450-2273-4933-bd2a-bc175c3905ac@intel.com>
 <ZzelyrwhddiK0QBY@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZzelyrwhddiK0QBY@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:303:8e::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 596718a1-8f43-4dda-5fc4-08dd05b02378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWJRMHVubkxZZitiRzFLS0ZkZFdlb1Vldk1zbm9McnNxNVo5Mm5LaXR4dTUy?=
 =?utf-8?B?L3BCQjMzaUgyNEIxazlxQ3ZmQ1hmUHpIcVhjbjZ1NWRJY09kK1FGS1Aydk1Z?=
 =?utf-8?B?SjYyWWVhNzg1L0pZSlFQS0QwdWZhRE5ncUNPb1dZR0JFSGd3eUxUbUFrMlBi?=
 =?utf-8?B?YTFDT3RuL1hnbENFMDdCZGpLVnV4bEZTWCsrbThMWE4ySmt0b0o0NC9VNUlJ?=
 =?utf-8?B?NGsvVHBrMkE0bU0wQXg5blBzM1VXSDJ5SnVRcEtJSitPWERNcEtFNTQ2ekxh?=
 =?utf-8?B?YmYxaUZmZFJ2d1VkS2FieGsvK1Vid3FPcy9rRDFjY0VVWGxVMnl0dHRNSWl5?=
 =?utf-8?B?QU0zM2FoeTI3aWxSb2RxcU41Sk1DSlBHdDh1UUhVME9lQmQvQ0s1QWJLQTd6?=
 =?utf-8?B?R3VlMEZqM2tOVW1tYVpEMVJUWC8rVkxFY1JWaHlxdWdsWWE4TFA4SlJQNStw?=
 =?utf-8?B?QkRZQnlIM0g1V0N3eUd2UmpsWUgxbzllcXFEZFMvbmJRWStySzlKZlNqNExa?=
 =?utf-8?B?a3ZIN2hGTHFOdUowdkdYcG5VZm9CUjhTRHg5T0phNVpYUWJOblh2cS9aOG5j?=
 =?utf-8?B?OFdDai92d3JCMTFPbGl4MVhRczN3M2IxQ291cTZyOUprNHRuNG1xZG0ydTJq?=
 =?utf-8?B?N0JDVHNXdllvQzZIalV4SkNmT2V1R04xMTRJMWpOZ082UWg0YlBkV1l2RzNG?=
 =?utf-8?B?LzNuaFVwVjF0a1h4am1KQytwamFHNXdyS1FRRTJRRVRSMTdyOEFZVVpqK0g2?=
 =?utf-8?B?Z3k3UlExQ3lEU1hGNHFtN1FET2RDNVJ5WGl1emlheXhMczhSLzQ4Z09oR2lP?=
 =?utf-8?B?eHVWbUNnYVhtNHI4Qi9yRDhjRmVMMTVkTFNGQnBRSXZYU1BZbXhrSXVXZFAw?=
 =?utf-8?B?ZkJ2a2MvN1lUbkJSTGNOU1VIWXZlc0lHYVFqdzBIK3M4YldManY2ZFpVT2JJ?=
 =?utf-8?B?Z2xnYktHbWFkczBjUG9FdlhmUVl2Sm91WUhHVGhwOTBacE9TUXBkcVhyczIz?=
 =?utf-8?B?NGJoWDdab3BOMko4c0l5ZUNpbXUvclAwejBIVTc2bzk4VTdyY25Nbm1OVDlm?=
 =?utf-8?B?VVhtajlkWVo2eUd0SitnRGJJaUJOd1NZS3dwR3RRU2lmTzMzcXNMdXhERU5Q?=
 =?utf-8?B?ZlROWkVNWmY1bGFhWW40MXIrY1dqMnBUWnFFMmdGbk8vUXhNUStNM2h5cHhQ?=
 =?utf-8?B?d0REaG5ENHNKWHVoMkROb2ZkT1A0OS9VN29PRE5xUFhKKzAwWkFnc3V6T1c3?=
 =?utf-8?B?TS9Ya2Y4TitabTBtQzVkVnBseGVqUjFvNnIyUEdIUEJ0eUpWNjhCOE9vUDRY?=
 =?utf-8?B?cXQ1V2NHQnZUNk9vWlhZLzM3Qmdzb2d5M2hyeFFNQ1Fscmdsbkc4STAxRFNl?=
 =?utf-8?B?WUpzdXpXakU2bkdEYWwxNFkxRGpiSStHRzZSY0paZS8xa0E4Y1hwWmVGRDJy?=
 =?utf-8?B?SHd2bEd3ZVpTSlA2bXpVNWZwd2FEQUhGdWN5VW11aEdCTWp5MzAxTTBxV1hX?=
 =?utf-8?B?R3daNzBQeVRSRzFOem1XaUVBMUVsQjFCUDBGMkR5VUx1Z1FaRHlXUUpvNHhm?=
 =?utf-8?B?NzJjUzNrdmR4bmh0N0liSkQ1aGhDL0JQY3dsUkppYXBaLys0aFdoRnB0Y21y?=
 =?utf-8?B?UGZPTmxxUEFJQ2FqTmFKR2tnYldnQ3U1YWg0dFlDN3FmeUZraDBqSlgraXVI?=
 =?utf-8?B?Vnk4QWpLbERWb1REZTBScFQ2bWJkMEE4WGVVQkM1aUx3UEc0VTBSZlo0V1FI?=
 =?utf-8?Q?ijU3b0sqfX6X/K1xBNJgR4lENEW48xbauQ2voMd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlEzU0c3Vnd1K1F6WVB3THJHNUVRbTFRNDZINStvMy9ZdGRxUUlPd0pSN2RU?=
 =?utf-8?B?cmxzSUNTYkJMK0VEUVUycEZ5S29mNWtlVnJxcXJNbHd6NlJnQlRFK01GNnB5?=
 =?utf-8?B?dllZNDgvdjl5aHc1RTlra0VYaVlNeGZLcUYyVFZTSEJPTEZOUmpmWXkxZmhR?=
 =?utf-8?B?OUQxcFlMZ3pxN25Ga1lvTDFFVFdiZnpzMUROU0NCQkNJdWpNcjIydk5ENEV0?=
 =?utf-8?B?WmZXVGFRTk50OCs1U3FLY2tyVVk4S0s2ZGlua0pGTFZQckVqOXEyZ0xGTTFG?=
 =?utf-8?B?ZGJGTWZrTU5oNUFSWlZaTmxsUDRnZEtZbXRHa3lzdUV0bEpRQnJoeHlGNVl2?=
 =?utf-8?B?N0RxN0NWeHdPMERiUVdlL05YZUgyMmpaQkZzVFRFeTJ2SCtDYVl1K210d3l4?=
 =?utf-8?B?U3h3Zm9LYm9Fai9xZHk3Tyt1TGVWcldCTWVZdG9SRm9qVXBiRWozTGREbWFh?=
 =?utf-8?B?SUlMc3FUa0dhVGRGVDdMeDdTN200ekNGbmd0cFdFUU1aQW82cmJFaHd0aHIw?=
 =?utf-8?B?N1g5NC9RNCtFTzlRdzRHVlRSQUhTcDdmNDZlVHBjc3Iyb1pFbUd0ZTJiRmRL?=
 =?utf-8?B?TjU5NHlpbnR1VGxCTnJuTlA3YmR0em1iT1lDOHVLbGRHWk5LSFIzbEpaSWJN?=
 =?utf-8?B?dkFlck1mK1hSRk5xVzQ3TTkwQkhsKzVvODQyYlorSW5xcXJrMWcwWkxNOFR2?=
 =?utf-8?B?ZWZWbUp2czljU2EzUWYvRzhyOWlhUjI1clY2SGFzZVZhSjgzZzZ0VmF0YWVM?=
 =?utf-8?B?T3hrYWxrNk1VYnczMDRGM253Wm5nYjdLeFNYSDB6MlpielNMakE2cjl1QnM0?=
 =?utf-8?B?Ukc2R1ZHUCtqTDRtd2VZVkdObHNldys2MkJVYUNmaWhyV0VSTVljZytKRGpO?=
 =?utf-8?B?MjFRdkZvSEFQdVZvRytweUs0dGtuajk0czRJQmhVVEM0NGZsVyt2OWFEMGNq?=
 =?utf-8?B?T3JlQkJoV0VZMXJsZXAySlU5ZWdWTDZjdXhMbERWSXl4bUgvYVp2enRHUjRS?=
 =?utf-8?B?cnJMT1NrRFZKWVg1N0kyaU1hRDNCeWFoVGRGSEpaR3JvbTNiTS94TTVIdnYv?=
 =?utf-8?B?ZldEZitYTlRvRXpON0ZzYTNlZDlGWjl6Zkh1OE5TUkFFUU5Wc3lZN0RlQjVr?=
 =?utf-8?B?RjEzMk9qTW50bkpGSW00c0pHSFRsRWJoRlJmcWxaeTI1bzFqQ01JT05WdUlX?=
 =?utf-8?B?azM4N2IrN280aS8xS2c3cHpnSkUyWnpwb2RLNGJ6aUJzTmhIWHJ6b2ViN1JS?=
 =?utf-8?B?TlFNNU1QL1liSWRzc1ptWTI2WmI4SGdkdFFQZW9tOUlxTHd2RUs5azlHSnFs?=
 =?utf-8?B?T29WUmppYlRLakNJc2E0SjhmbnBWcUtrd09vV1AycVRDVTQwaDJjWkZFT1VZ?=
 =?utf-8?B?TW9KMkdHKzVVNXJLcTlNMi9vYlFBbE9EQjd6VHNWK0RpbENDTHNJNTVyQ2pX?=
 =?utf-8?B?N0I5aVIyZWxHTWhCVFY2d1Q3Uk5SS0sraGJYazFKOGtrenhERkUzL0xNc0JS?=
 =?utf-8?B?d3A3c041YXIvVWk1SVpoRC9QckpySUhNUmJTRjJpYmsxUE1VZXhtUiszZDlF?=
 =?utf-8?B?Y0M4Z01JU3pxWVB6bDFteVBMWEc5RUFmQ0I3dyt4d2lOREVvRFNwU2ZJenRB?=
 =?utf-8?B?UXlQQjRFSHh2MDZnSWZ1MGp5eWo1c2hOM1RPUEJoZEN3U20yODh4UFA1T2M2?=
 =?utf-8?B?blQ1bmFLZkdCY1lHa3gvRFdyc2t0OVNmeUxON0FJVCtPdFRodDcweFNFNXlR?=
 =?utf-8?B?WUhTM09ZSlkxZFZXei9WQVp3ZkNDaWNGYjhoNHo3ZXZUR0M3UzJQNmlBVjdq?=
 =?utf-8?B?TW45elE4OFN4cjNFMDdxMWFON2YwRHVMRG1pNi9ReXhsbGZnN21qV01rS1dE?=
 =?utf-8?B?SVZjVVFaVnZBcXNiM3F3UE9oYnpVOENTTXRpQVVEdE1QbE0rcHhEaWRidkRt?=
 =?utf-8?B?Q0Zjcnp0T1JaM2pqZFlqMVk1c3Uxdmp0Ny9EUWo2VFcyRnc1MVR4ZVpoMTRO?=
 =?utf-8?B?QWtER1gyRzd4djBDWUtrZUtLRnJXS05kcFVyWFdmcG9vQ0hLTG1qQjdWb2c2?=
 =?utf-8?B?ejk4VlJoSzY3dFR6bUNQT2tGa1FSTTBPeXQzZG03ZEpRK0JNY3cyMWlvMFdo?=
 =?utf-8?B?OCsySHJuc1J5NGQrbFR3RXNoZ0pxVzE0ajN0MHFuM2RFZ2VwQk51UzdPWjJk?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 596718a1-8f43-4dda-5fc4-08dd05b02378
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:00:22.6185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/V/GNss9vNuts9tg5BhUu/f/0MDyX+cCiHpIMlgWhxQDofiI895a2e5CjKKW+DTusnGskaoRttJckcs+Q9qS3xgb1MQAVDZV4Tl2Z/iwWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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

On 11/15/2024 11:49, Matthew Brost wrote:
> On Fri, Nov 15, 2024 at 11:34:40AM -0800, John Harrison wrote:
>> On 11/15/2024 11:11, Matthew Brost wrote:
>>> On Fri, Nov 08, 2024 at 12:22:16PM -0800, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Some features require inter-GuC communication channels on multi-tile
>>>> devices. So allocate and enable such.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
>>>>    drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
>>>>    drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
>>>>    3 files changed, 305 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>> index b54fe40fc5a9..fee385532fb0 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>> @@ -134,6 +134,8 @@ enum xe_guc_action {
>>>>    	XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>>>>    	XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>>>>    	XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>>>> +	XE_GUC_ACTION_REGISTER_G2G = 0x4507,
>>>> +	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>>>>    	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>>>>    	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>>>    	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>> @@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
>>>>    	XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
>>>>    };
>>>> +/*
>>>> + * GuC to GuC communication (de-)registration fields:
>>>> + */
>>>> +enum xe_guc_g2g_type {
>>>> +	XE_G2G_TYPE_IN = 0x0,
>>>> +	XE_G2G_TYPE_OUT,
>>>> +	XE_G2G_TYPE_LIMIT,
>>>> +};
>>>> +
>>>> +#define XE_G2G_REGISTER_DEVICE	REG_GENMASK(16, 16)
>>>> +#define XE_G2G_REGISTER_TILE	REG_GENMASK(15, 12)
>>>> +#define XE_G2G_REGISTER_TYPE	REG_GENMASK(11, 8)
>>>> +#define XE_G2G_REGISTER_SIZE	REG_GENMASK(7, 0)
>>>> +
>>>> +#define XE_G2G_DEREGISTER_DEVICE	REG_GENMASK(16, 16)
>>>> +#define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
>>>> +#define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
>>>> +
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 1cbad8a91798..899094423291 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>>>    			    struct xe_bo *bo)
>>>>    {
>>>>    	struct xe_device *xe = guc_to_xe(guc);
>>>> -	u32 addr = xe_bo_ggtt_addr(bo);
>>>> +	u32 addr;
>>>> +
>>>> +	/*
>>>> +	 * For most BOs, the address on the allocating tile is fine. However for
>>>> +	 * some, e.g. G2G CTB, the address on a specific tile is required as it
>>>> +	 * might be different for each tile. So, just always ask for the address
>>>> +	 * on the target GuC.
>>>> +	 */
>>>> +	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>>>>    	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
>>>>    	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
>>>> @@ -244,6 +252,263 @@ static void guc_write_params(struct xe_guc *guc)
>>>>    		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
>>>>    }
>>>> +static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev,
>>>> +					  u32 desc_addr, u32 buff_addr, u32 size)
>>>> +{
>>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	u32 action[] = {
>>>> +		XE_GUC_ACTION_REGISTER_G2G,
>>>> +		FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |
>>>> +		FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
>>>> +		FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
>>>> +		FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
>>>> +		desc_addr,
>>>> +		buff_addr,
>>>> +	};
>>>> +
>>>> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
>>>> +	xe_assert(xe, !(size % SZ_4K));
>>>> +
>>>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>> +}
>>>> +
>>>> +static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev)
>>>> +{
>>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	u32 action[] = {
>>>> +		XE_GUC_ACTION_DEREGISTER_G2G,
>>>> +		FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
>>>> +		FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
>>>> +		FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
>>>> +	};
>>>> +
>>>> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
>>>> +
>>>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>> +}
>>>> +
>>>> +#define G2G_DEV(gt)	(((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
>>>> +
>>>> +#define G2G_BUFFER_SIZE (SZ_4K)
>>>> +#define G2G_DESC_SIZE (64)
>>>> +#define G2G_DESC_AREA_SIZE (SZ_4K)
>>>> +
>>>> +/*
>>>> + * Generate a unique id for each bi-directional CTB for each pair of
>>>> + * near and far tiles/devices. The id can then be used as an index into
>>>> + * a single allocation that is sub-divided into multiple CTBs.
>>>> + *
>>>> + * For example, with two devices per tile and two tiles, the table should
>>>> + * look like:
>>>> + *           Far <tile>.<dev>
>>>> + *         0.0   0.1   1.0   1.1
>>>> + * N 0.0  --/-- 00/01 02/03 04/05
>>>> + * e 0.1  01/00 --/-- 06/07 08/09
>>>> + * a 1.0  03/02 07/06 --/-- 10/11
>>>> + * r 1.1  05/04 09/08 11/10 --/--
>>>> + *
>>>> + * Where each entry is Rx/Tx channel id.
>>>> + *
>>>> + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
>>>> + * be reading from channel #11 and writing to channel #10. Whereas,
>>>> + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
>>>> + */
>>>> +static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
>>>> +			     u32 type, u32 max_inst, bool have_dev)
>>>> +{
>>> This function makes my head hurt but I don't have any other suggestions.
>>>
>>>> +	u32 near = near_tile, far = far_tile;
>>>> +	u32 idx = 0;
>>>> +	int i;
>>>> +
>>>> +	if (have_dev) {
>>>> +		near = (near << 1) | near_dev;
>>>> +		far = (far << 1) | far_dev;
>>>> +	}
>>>> +
>>>> +	if (far > near) {
>>>> +		for (i = near; i > 0; i--)
>>>> +			idx += max_inst - i;
>>>> +		idx += (far - 1 - near);
>>>> +		idx *= 2;
>>>> +		idx += type;
>>>> +		return idx;
>>>> +	}
>>>> +
>>>> +	if (far < near) {
>>>> +		for (i = far; i > 0; i--)
>>>> +			idx += max_inst - i;
>>>> +		idx += (near - 1 - far);
>>>> +		idx *= 2;
>>>> +		idx += (1 - type);
>>>> +		return idx;
>>>> +	}
>>>> +
>>>> +	return -1;
>>>> +}
>>>> +
>>>> +static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 type, bool have_dev)
>>>> +{
>>>> +	struct xe_gt *near_gt = guc_to_gt(near_guc);
>>>> +	struct xe_device *xe = gt_to_xe(near_gt);
>>>> +	struct xe_bo *g2g_bo;
>>>> +	u32 near_tile = gt_to_tile(near_gt)->id;
>>>> +	u32 near_dev = G2G_DEV(near_gt);
>>>> +	u32 far_tile = gt_to_tile(far_gt)->id;
>>>> +	u32 far_dev = G2G_DEV(far_gt);
>>>> +	u32 max = xe->info.gt_count;
>>>> +	u32 base, desc, buf;
>>>> +	int slot;
>>>> +
>>>> +	xe_assert(xe, xe == gt_to_xe(far_gt));
>>>> +
>>>> +	g2g_bo = near_guc->g2g.bo;
>>>> +	xe_assert(xe, g2g_bo);
>>>> +
>>>> +	slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
>>>> +	xe_assert(xe, slot >= 0);
>>>> +
>>>> +	base = guc_bo_ggtt_addr(near_guc, g2g_bo);
>>>> +	desc = base + slot * G2G_DESC_SIZE;
>>>> +	buf = base + slot * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
>>>> +
>>>> +	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
>>>> +	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
>>>> +
>>>> +	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
>>>> +					      desc, buf, G2G_BUFFER_SIZE);
>>>> +}
>>>> +
>>>> +static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type)
>>>> +{
>>>> +	guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
>>>> +}
>>>> +
>>>> +static u32 guc_g2g_size(struct xe_guc *guc)
>>>> +{
>>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	unsigned int count = xe->info.gt_count;
>>>> +	u32 num_channels = (count * (count - 1)) / 2;
>>>> +
>>>> +	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
>>>> +}
>>>> +
>>>> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
>>>> +{
>>>> +	/* Can't do GuC to GuC communication if there is only one GuC */
>>>> +	if (xe->info.gt_count <= 1)
>>>> +		return false;
>>>> +
>>>> +	/* No current user */
>>>> +	return false;
>>>> +}
>>>> +
>>>> +static int guc_g2g_alloc(struct xe_guc *guc)
>>>> +{
>>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	struct xe_tile *tile = gt_to_tile(gt);
>>>> +	struct xe_bo *bo;
>>>> +	u32 g2g_size;
>>>> +
>>>> +	if (guc->g2g.bo)
>>>> +		return 0;
>>>> +
>>>> +	if (gt->info.id != 0) {
>>>> +		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>>>> +		struct xe_guc *root_guc = &root_gt->uc.guc;
>>>> +		struct xe_bo *bo;
>>>> +
>>>> +		bo = xe_bo_get(root_guc->g2g.bo);
>>>> +		if (IS_ERR(bo))
>>>> +			return PTR_ERR(bo);
>>> A few things.
>>>
>>> - xe_bo_get returns BO or NULL.
>> Meaning just use if(bo) rather than the IS_ERR wrapper?
>>
> Yes but if(!bo) is the error case. Assuming a typo on your end.
Yes. I meant "if(!bo) return -ENODEV;"

>
>>> - Checking the return seems overkill
>> Seems wrong to not return an error if there is no allocation. E.g. just
>> change it to 'return -ENODEV' or some such if the bo is null?
>>
> That's fine if want to leave in the error case but tons of places in
> driver don't have this check. Maybe that is an oversight though in some
> cases. Some cases we are in a non-failure path though. It can only
> return NULL if argument is NULL.
Indeed. But the source is coming from another GT. So technically it is 
outside of the control of this GT. And I like defensive programming and 
always checking for errors!

>
>>> - I don't see an associated xe_bo_put
>>> - Do we even need a reference? i.e. The clean up is handled by DRM managed on driver unload.
>> Technically, the get is not required at present if the secondary GTs can all
>> assume that the root GT is guaranteed to be holding its reference at all
>> times. It seems cleaner (and more future proof) to not make such
>> assumptions, though. Just have each GT look after its own usages and
>> requirements.
>>
>> And yes, there is currently no put because everything just magically
>> vanishes on driver unload (same as per a whole bunch of other driver
> That function only drops a ref, so if you don't have put the BO will
> never actually get destroyed. I'd expect if you load the driver on a
> multt-GT device with this series and then unload it you will get loud
> complaints in dmesg unless I'm missing something. So if you leave in the
> get, you need put unless I'm missing something.
Hmm. Confused. I've run this code plenty on various types of multi-GT 
devices and not noticed any complaints. Do I need any particular CONFIG 
options enabled? Pretty sure I've run with the regular kernel leak 
detector enabled but maybe not in a while.

John.

>
> Matt
>
>> internal BOs). The selftest does require dynamically releasing and
>> re-allocating the shared BO in various different configurations, though
>> (including different per GT splits that mean the root GT isn't necessarily
>> owning the allocation, it might not even have an allocation). That code
>> isn't included in this patch set at present for a bunch of 'not ready'
>> reasons.
>>
>>>> +
>>>> +		guc->g2g.bo = bo;
>>>> +		guc->g2g.owned = false;
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	g2g_size = guc_g2g_size(guc);
>>>> +	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
>>>> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>>> +					  XE_BO_FLAG_GGTT |
>>>> +					  XE_BO_FLAG_GGTT_ALL |
>>>> +					  XE_BO_FLAG_GGTT_INVALIDATE);
>>>> +	if (IS_ERR(bo))
>>>> +		return PTR_ERR(bo);
>>>> +
>>>> +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>>>> +	guc->g2g.bo = bo;
>>>> +	guc->g2g.owned = true;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int guc_g2g_start(struct xe_guc *guc)
>>>> +{
>>>> +	struct xe_gt *far_gt, *gt = guc_to_gt(guc);
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	unsigned int i, j;
>>>> +	int t, err;
>>>> +	bool have_dev;
>>>> +
>>>> +	if (!guc->g2g.bo) {
>>>> +		int ret;
>>>> +
>>>> +		ret = guc_g2g_alloc(guc);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	/* GuC interface will need extending if more GT device types are ever created. */
>>>> +	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
>>>> +
>>>> +	/* Channel numbering depends on whether there are multiple GTs per tile */
>>>> +	have_dev = xe->info.gt_count > xe->info.tile_count;
>>>> +
>>>> +	for_each_gt(far_gt, xe, i) {
>>>> +		u32 far_tile, far_dev;
>>>> +
>>>> +		if (far_gt->info.id == gt->info.id)
>>>> +			continue;
>>>> +
>>>> +		far_tile = gt_to_tile(far_gt)->id;
>>>> +		far_dev = G2G_DEV(far_gt);
>>>> +
>>>> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
>>>> +			err = guc_g2g_register(guc, far_gt, t, have_dev);
>>>> +			if (err) {
>>>> +				while (--t >= 0)
>>>> +					guc_g2g_deregister(guc, far_tile, far_dev, t);
>>>> +				goto err_deregister;
>>>> +			}
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_deregister:
>>>> +	for_each_gt(far_gt, xe, j) {
>>>> +		u32 tile, dev;
>>>> +
>>>> +		if (far_gt->info.id == gt->info.id)
>>>> +			continue;
>>>> +
>>>> +		if (j >= i)
>>>> +			break;
>>>> +
>>>> +		tile = gt_to_tile(far_gt)->id;
>>>> +		dev = G2G_DEV(far_gt);
>>>> +
>>>> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
>>>> +			guc_g2g_deregister(guc, tile, dev, t);
>>>> +	}
>>>> +
>>>> +	return err;
>>>> +}
>>>> +
>>>>    static void guc_fini_hw(void *arg)
>>>>    {
>>>>    	struct xe_guc *guc = arg;
>>>> @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>>    int xe_guc_post_load_init(struct xe_guc *guc)
>>>>    {
>>>> +	int ret;
>>>> +
>>>>    	xe_guc_ads_populate_post_load(&guc->ads);
>>>> +
>>>> +	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>>>> +		ret = guc_g2g_start(guc);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>>    	guc->submission_state.enabled = true;
>>>>    	return 0;
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>>>> index fa75f57bf5da..83a41ebcdc91 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>>> @@ -64,6 +64,15 @@ struct xe_guc {
>>>>    	struct xe_guc_pc pc;
>>>>    	/** @dbm: GuC Doorbell Manager */
>>>>    	struct xe_guc_db_mgr dbm;
>>>> +
>>>> +	/** @g2g: GuC to GuC communication state */
>>>> +	struct {
>>>> +		/** @g2g.bo: Storage for GuC to GuC communication channels */
>>>> +		struct xe_bo *bo;
>>>> +		/** @g2g.owned: Is the BO owned by this GT or just mapped in */
>>>> +		bool owned;
>>>> +	} g2g;
>>>> +
>>>>    	/** @submission_state: GuC submission state */
>>>>    	struct {
>>>>    		/** @submission_state.idm: GuC context ID Manager */
>>>> @@ -79,6 +88,7 @@ struct xe_guc {
>>>>    		/** @submission_state.fini_wq: submit fini wait queue */
>>>>    		wait_queue_head_t fini_wq;
>>>>    	} submission_state;
>>>> +
>>> Unrelated.
>> Sort of. If the coding style is to have blank lines between sub-structs then
>> adding the g2g struct ahead of submission_state gives it a blank line above
>> but not below, which is therefore wrong because it is both mis-matched start
>> vs end and not following the style guide. On the other hand, if blank lines
>> should not be included at all then the lines before/after the g2g struct
>> should be dropped.
>>
>> John.
>>
>>> Matt
>>>
>>>>    	/** @hwconfig: Hardware config state */
>>>>    	struct {
>>>>    		/** @hwconfig.bo: buffer object of the hardware config */
>>>> -- 
>>>> 2.47.0
>>>>

