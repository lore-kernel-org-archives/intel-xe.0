Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BABFCF8540
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 06:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A50A10E6DF;
	Thu, 20 Nov 2025 06:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xlwha3y5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36E810E6DF
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763618998; x=1795154998;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=puIkFvJCQYl0P8oGxMomHKnLYepNXu3dX10BCrS+KEk=;
 b=Xlwha3y55PwNQANUTzL5Xoyi4ccdiQB/ez88kVM8euWqBbA31rEDs+rf
 mDGHeRhL3Fm59BCxFvjOZ0hupYsiXOSUemyMRyCW1gMKNQLjByPlokRYL
 xrK31RVKfXvVbIllcyZBx6LCiUAAdvH3HWPpeoLlvpjrGppe9ZOg6XLBe
 wWJcWR3M+Ho0TWo0KaDSwhrX/fJNb1BkwrblOC5PRikrcBmLqmKioBuWr
 ZwDE3+lMN4a9YWrDFuZtmXiq4thkCc07WaYtKzAu2dR1gvAt6/pm/rqBn
 M6zCIAahLy7umJK/BpTSiXoSavo/eksnib7i40Kut9ho9tmEQfTqFnxIc g==;
X-CSE-ConnectionGUID: WqqlZ5ftSyiyEmlTeXxG+w==
X-CSE-MsgGUID: CnJMbTWAQ+6WwfgJP9IeZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77141953"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="77141953"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 22:09:58 -0800
X-CSE-ConnectionGUID: iiT+FfzTQYqwIShABjXsiw==
X-CSE-MsgGUID: HmOoWv93Ty27EXnyzY8GfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="195752154"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 22:09:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:09:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 22:09:56 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:09:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2or5tnErs8t1rERsQbvLwfZFuEC+4MEqG929h/4srw8a27aTt4YbkF3bcRDdvOATIqAv0BPkMqABQc+ZjwdPjCjQQ6WW/OqHU6+kAaVxocDsAW6Cymy3e5PhBP4xGIr0PUBT1Y7Aiehy2aGPbqGxGPt2oFs2Zrwmy+kPNBEkQCXeW8ufd8xTrbN5BksMa+qWLH+GJdbg1sfctH7jQEH/cOyj0cemAMy480vkip4IB+Q8AhAaNmhV17rmpwrsaTrsAiQLhKDNIChItEJfs4FINSYdJqShmv1cZl3Gk+4jMuVjHMiF56KfIQ9Gjzaa7iQfBp0BVDlsSaLd3iDk4+S1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IVzOJN4iXwsktG+2ZbzFYp6xOc+4EKuYs/EWHnrH/o=;
 b=mP+nO7lfyE67bkdy7itPhwm8qwUdKv9PD9oBXibul8Bpb5Br2FhtyZiWBxXmzP77k8X60slb6oKzsvZ0e7zgkAoss+mZeA0n3IYtkg1cAyoLUtzoDXmcLZ4x7/A7XD/hNMW5uvFs4C5dajG9BhXxF6kKgGolzWOOOj5eJ8o7dq7fVEpfGW2gSCCVgy0vGtVJWsLXq1zuasvdbYbgqzorvV1bJdK9IJmhQrkm5kHT6qjKdWSpkqFZ5yyx00Uf2KKDfBY+WUw7Z/1fEg3/tRB2Jmlr4mD1gSCxTaLdcWatpGc+SUnEjOrAhoGLc08ndin7w3dT5NAvy0qPmEozFnDb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 06:09:53 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 06:09:53 +0000
Message-ID: <12fec0e4-1ee5-439e-b051-0fc4da013253@intel.com>
Date: Thu, 20 Nov 2025 11:39:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pcode: Allow checking for mailbox command
 support during driver probe
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>, 
 <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <ville.syrjala@linux.intel.com>
References: <20251113044620.537345-1-raag.jadav@intel.com>
 <8450848f-703b-4eef-8de9-0b7665da001c@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <8450848f-703b-4eef-8de9-0b7665da001c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0096.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::11) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SN7PR11MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3453a0-83c3-4635-53a6-08de27fb6bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGVYQ3JKWlk2NEQ2ZUo4NGtLU25EVVhKeGUwQ2NFaWZ6L3ZxY21qSHdlOUs4?=
 =?utf-8?B?dDU2a2lVZWhCek1vTG5RNDhFbXV4Wkc5TVM1a2tFRFNCNGhBdzNQd05zdTFX?=
 =?utf-8?B?ZWQvUSt2b2x5VkVGeC9JRzU2NytpdDh5cFlhNHRSeFppdnMyRUpHckwrVnJR?=
 =?utf-8?B?bGNlakhtRUxHblk1TXRaSy84SGRkcmVaNko1N1BqR1pOa3lxeEpOTDNNZFV5?=
 =?utf-8?B?bVhSM1huVVR5c29PRVBQWGprTENDWVozeXdDcm1kYjFyOXBnUjBXRTVHLzRx?=
 =?utf-8?B?bmpSVkl0YTVBVHdTdGd4aVhEdVo1Ykt4OXpTbUtLeFNPZk9mVzgwOXZsVld4?=
 =?utf-8?B?ZDNuZzA3RGg0TW03c1o1R3RqKzMvb0RlbWVaM29ROER4SzFwZE4zWmRnZklK?=
 =?utf-8?B?Z00wMkhuL1NyRktQZGdocmFLdW0xZ0Z0S21BdGFDTkg5eUtSK25WY1R6SGNr?=
 =?utf-8?B?UjdLNFJIZi9iVytDSXRxak9zYW1OQ3N5UVFmZHVxWVNwZ0J2dzdaQmpsbjJJ?=
 =?utf-8?B?YUdNeGxmSjEzNXREcUFNYXJSenF6TjBmSHBvSm1nMjUvbzRJNlBGVUxiN1o5?=
 =?utf-8?B?QThQQmEzbERlT09oTW4rYXdzdWtQeTJ2ZklwQnM5aCtseHc1UzYxTVYvLzcy?=
 =?utf-8?B?dGZIYUZlSGJZODdlS2RLaGJWR0I0VGJKT2prM2JwSlAzd3ZkQWhIQ1RmTkhJ?=
 =?utf-8?B?ZS9DSGdva2pheFRpaE5zRVZLMnRXVUNIaWpQUzZlM081ckdUQUFLbTdNSEZK?=
 =?utf-8?B?SEZ0QldxbUJlT1pINXhGYlI1YlZsalBFcFFqYUpoUzc2YmNCTFhPai9EYWJm?=
 =?utf-8?B?ZW5CVk9aNnJpNU5NWDJvdlpKQzdvTmJFeTdXWmwxVVVHdkZuemhBWUZ6MXFL?=
 =?utf-8?B?NlVSOEdnbTBLM2FCOFhTNVJRaXFoZEtMSm5NVnFTa2FJVDN3aE50eTBIcmdS?=
 =?utf-8?B?T3dKREttMFd6bkNGTktyMGhqT2V2allCOWMzR0c1RjVCNVUxUkpQbmMxWi95?=
 =?utf-8?B?RUNERE1LcTVhbTlQakNvVHMxKzBJaUpWWDFWWGNIVHM5VDAzUFFXWENhcDcy?=
 =?utf-8?B?VXNpczgzbzk0cjR6YzM1cVNGM1ZwYmZrcWk1Z1BNTVJCdEhuWllNUVBiNGtO?=
 =?utf-8?B?T3JKa0Y3M1pDUWpORUlCYzhxWENqVmVQcis4SDFNVDVscXA3WEtQSjlSb2da?=
 =?utf-8?B?aUluSk9iZGU3Ymw0alMxSXl5bkkva0JJci9kNEIwb0MrREdsOUd0RVR2cG10?=
 =?utf-8?B?d3RLcmp6eFVKMUwvMkx6aFlPL2JXSjFDdzNDTWJDZC9PLzRZV1FXbHhuWEZt?=
 =?utf-8?B?WnFpUWs1cTdKKzM5Tzhia21CbXpvQjMrWHp4dmVEK1NqZXRaOHk0R1N0L0F0?=
 =?utf-8?B?Smc3RERWR3JQc3o4OHl5bnBadmg4NGxvQ0tsWjNOK09FcWJoUEwwbzJ2SXA2?=
 =?utf-8?B?RWtUR3lJNjZLeStxYmFISVo1d3N6b1p4eXpITDVwNlpjV2pqdExYTnEzT1l1?=
 =?utf-8?B?eU41NHAvcHdvdldVazVGK0VmVytpL1kxSUhvOU50ME9lbTg5WUl3Q212cS9i?=
 =?utf-8?B?eVh4MTc2MFMxR2huSlFWbGJScG5GZ0VNc2FqRnQ1NHRjU3RGRDVXQkRhL2Uy?=
 =?utf-8?B?VkNjN1drVDljUEpQSXhHRExYSGUvVjI3c0VjWXZGc1RxTXd2WXNYQzIvVWNH?=
 =?utf-8?B?cUJQempPaC9uZE1WM2VQamJjVDluTEhMbjlVSDBaWGpuZXB0SEtPUVZyOGpp?=
 =?utf-8?B?R0JIWmxJdTJlUExrQWFUQ1ZpZERpRzRjbndRM3c5SUsrVSt2WWlsWG5PbnZT?=
 =?utf-8?B?aml0eVB2dG1Pcm5XVUUzY1pjbSswU3dneURmQUxUeDlJa0JwUmszOFM0ak5I?=
 =?utf-8?B?Yit5eE5nVzBWeEE3KzFnT2NncEZrWDNjQkZRVjRaV21FNDJrZ1lCaExNbEhU?=
 =?utf-8?Q?lwGAZJ9Tdgwn4d4/+NahoH1XWtmdDcPJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC9RSGQxalBORzhveHN6ajgwa3FISDBSMUVLeHVjWXFoTFJHTUJRQjJlT08y?=
 =?utf-8?B?ZjVRRkhaQnoxYUxBRjN4QWZMaGpSRkpUZzcrcXNqcDdaakhMSEs3TUl6TE5R?=
 =?utf-8?B?ODd2Nnpidk5XWDVhcGFKNENud2psSFFVeTlwWXZxVURNeXRDY0V4STFJZVNN?=
 =?utf-8?B?VFFWR0FoSlR1QkJmQ0x5WlJpSUNxV3dRMDlXSkpZK2VMbDdhUU5MT0thMFd1?=
 =?utf-8?B?T3FBVE1maU5JOWhPWmZDUEI1R1Y5NVdpbkxaVURkZVlvS3p4elI5MkpGNGR5?=
 =?utf-8?B?SHQ1YnRIRlBLY0lwNll6dFBLWlFyZEN1OEdEV2NGNUdRZzdsdXZlUUQrRlVk?=
 =?utf-8?B?bUNERlljQlFFdkgrQ1lJNFJlV3B6Mi9WS3JEZUUwTlVMTWdHOEdES2JkOWsv?=
 =?utf-8?B?Mkh3NXVJalV1RFRhMG1hU3cyRmlla1M0dlJZRnowRHB5WlU4LzBuQS9Hd1Jw?=
 =?utf-8?B?S3hMeFdnczBxb2tOY3VGTGdrRjZTdElCUmcwQ0xWZUlSb3piYU9OV2VEaEdq?=
 =?utf-8?B?RmpINHlVVkVxQ21VRmZHMnZWd2Y5NXpSVG9HZ2FrSENRc0pkS05pREVlSjJS?=
 =?utf-8?B?ZmtUanZqdUtRVGdxMVQwd0t3T25PMllMbUN6K2RqRjdNVGY3OWlqYWdPS3Uy?=
 =?utf-8?B?d01hajErL1JuWk9tZHBzeG5vWUdOTUM4SlpndE8vaW1qbzJqb0ZWTm1iZnRG?=
 =?utf-8?B?THlTQ2N1SFMvU0puSGMxcGRLUmN0MmxYRmVldXB6RDZwRUsrdlhTSVo3QTdH?=
 =?utf-8?B?ZGxDdVJUaWZFNGNGZWVaOXpYK243Y0dxcWdnZHU1YndGdkU3NkNHZHRaN01J?=
 =?utf-8?B?bkQ4d2c0YzRVSXBkL2MrdHBQZkZqSEphYitOQjB3S0NvaHM0K3RLNDVENUlK?=
 =?utf-8?B?NkZFaTdhU0g3ek9vMytMS00xNUJnSHB4OGJwelRQNk1panJ6RUh5SnpLODFW?=
 =?utf-8?B?Vk5lbFNHTm9xeWhtbEluYmJlb2pjSW1sVnJ5REhlNW8zUFJVSDhDaXNUekdC?=
 =?utf-8?B?ZmRoejc4Q0Q2UHV6VFVPVktPN2tmM2tsTWNSZ1BibE9lYWMzeS8yM2o3dlJu?=
 =?utf-8?B?MnoyT1R2ZXpEWUx3M3ZRbWpGdTdmUmUzZUFDaTRZM1VzRlpOZDJmU1BZSFJy?=
 =?utf-8?B?cjJmZEtjcWU2TzVxTUZRdFRqL1R6N1Y2TWMzZ3JBUWxpSGtOblF6b0QwRjFM?=
 =?utf-8?B?YXFhcGhveXp2ZkZaTXFLbVp0eVF1TEcydEM0UjBDbUNjY0VISk92bUdWcWpS?=
 =?utf-8?B?eVdrbHhuU2UveENYQUlET1MzTjhhYUFISWtBdlhQZk5hSW1XOVJJZmx3V0V0?=
 =?utf-8?B?UDZncm5jZkNIcHlGU2llMmU1VXBCdFI5MW9iQzFLN1VScE9iajJ5WkxUY1hT?=
 =?utf-8?B?WjJiZ0Y4MHJDN3d0bnJGUVZtbW9nRG5LZytaY2FEdm04d0dIWHQveVFzN3ZJ?=
 =?utf-8?B?YzdhenFFMVpBTk9aSzM0dzZnRFhOenN0QTBKUTJ4ZlRKTnAwUTFoOWYzMU93?=
 =?utf-8?B?WitRSnR2TEFaWGo5VUtQSTl6cFBoNmNwQk1JR3BUYW5oVzZaaGFxaHZjdDlF?=
 =?utf-8?B?aG8vN1pxTVRHTkh2d2I4TzVuak81cDFYMUZDcHFMLzVpNFJ3Y1g0NzVOTFl1?=
 =?utf-8?B?VTZOY1VBNndsd0RTbmZKMGQyYUN1bkpPM2psN1N1V0VvMC8xOUM2YnQ2a0pT?=
 =?utf-8?B?SkZiWHhuUG9Xb0VrMjhjYUlnQUlsTGhDTGNjd0xVYzBwemo0T05iSEpsZnFM?=
 =?utf-8?B?bjVXaWtvQXc0SWxOQ3BiOWEvaE5DWlJsTFBOaExreFVMdFNMTUpOdFk4cDdV?=
 =?utf-8?B?eVZiTkl0UEQyQnhvdmdUL0RtdHFJOTV2RERINDFVZzJMRGJYTEp2RXROQmtn?=
 =?utf-8?B?V0J2NkdUc0tPY0NnMitrdW9FMmxFY3l6UllQSHlqRFk1a2FYVjlwekJxZUs1?=
 =?utf-8?B?T1lrTFN2NDY0SXdVcWVOV2RjZXM0OWVuQ3QwVDcxTU1uWm9BV1Zac3VhdWs5?=
 =?utf-8?B?MU56V3hhVkYxNDNQQVdSYmZsWUFmeVRUc2ROQ1FjRUxwZTg2TnoyU2lscUU5?=
 =?utf-8?B?c05PRzlwOFFTUkRxWUVGbEt6VlQ0TlZqWm1NVURDZHhLWXFUUVg2d1hremtF?=
 =?utf-8?B?cHZ2TFJoVFYwcDNkRnE2U0d0VWtGSWkyNnc5ZGEyb3ZhdVFQZFduZ2laU1dj?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3453a0-83c3-4635-53a6-08de27fb6bc6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:09:53.7029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNrIHKtXy4KHx2BpB36x7rtfKk3FhKV6EcG6Wf49sIU0PIKUmNOT/kK8anOsTXqDTLgn6QoxSV0pBIKGUeUK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
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


On 13-11-2025 13:41, Nilawar, Badal wrote:
>
> On 13-11-2025 10:14, Raag Jadav wrote:
>> If the device is running older pcode firmware, it is possible that newer
>> mailbox commands are not supported by it. The respective functionality
>> isn't useful in that case but nor is error logging, since it doesn't
>> particularly signify anything wrong with pcode firmware or device as a
>> whole. Log such failures as debug messages during driver probe which 
>> allows
>> the caller to check for mailbox command support without it being 
>> reported
>> as an error. This is useful in cases where we want to make a decision on
>> driver functionality based on pcode return codes and a relatively 
>> simpler
>> design choice compared to other solutions like checking pcode firmware
>> version, which comes with additional complexity of binding every single
>> command to a specific version and deems pcode commands useless in 
>> case the
>> driver fails to obtain it for reasons unrelated to pcode.
>>
>> This only silences command related failures and still reports other
>> failures as errors, so we don't end up hiding the genuine ones.
>>
>> v2: Split unsupported command cases
>> v3: Add device bound check
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>>
>> I've not followed the documented device_lock() rule here because
>>
>> 1. It'll deadlock in ->probe() path.
>> 2. I don't know the code well enough to tell if it's really needed for
>>     our case.
>>
>> So feel free to weigh in.
>>
>>   drivers/gpu/drm/xe/xe_device.h | 7 +++++++
>>   drivers/gpu/drm/xe/xe_pcode.c  | 8 ++++++--
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 32cc6323b7f6..e8f997546ae1 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -12,6 +12,13 @@
>>   #include "xe_gt_types.h"
>>   #include "xe_sriov.h"
>>   +static inline bool xe_is_bound(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +
>> +    return device_is_bound(dev);
>> +}
>> +
>>   static inline struct xe_device *to_xe_device(const struct 
>> drm_device *dev)
>>   {
>>       return container_of(dev, struct xe_device, drm);
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c 
>> b/drivers/gpu/drm/xe/xe_pcode.c
>> index 0d33c14ea0cf..0f1edf5155c4 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>>       }
>>         if (err) {
>> -        drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>> -            err_decode, err_str);
>> +        if (err_decode == -ENXIO && !xe_is_bound(tile_to_xe(tile)))
>
> Use -EBUSY here. The check should be against -6, which indicates 
> "mailbox temporarily unsupported.
>
> Thanks,
> Badal

  -EXNIO is the correct check, as that is returned for Illegal subcommand

    CASE_ERR(PCODE_ILLEGAL_SUBCOMMAND, -ENXIO,     "Illegal Subcommand");
>
>> + drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox unsupported: %d %s",
>> +                err_decode, err_str);
>> +        else
>> +            drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: 
>> %d %s",
>> +                err_decode, err_str);
>>             return err_decode;
>>       }
