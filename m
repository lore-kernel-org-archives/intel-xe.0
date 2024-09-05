Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EF8CD4F54
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 05:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1D10E6A0;
	Thu,  5 Sep 2024 05:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8NdIRDS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA3C10E6A0
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 05:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725515464; x=1757051464;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N5omERl+aoEcEUzDyHlS6t+uNviPmktHaIK6ZvQUR7Q=;
 b=P8NdIRDSrZOn1wZ7XiqrRQyARY26zmnOPA7i6tGa/5wR3UfFkrAKgy2x
 WyKsdZAt8Qwd4o/Ol8WLPULF6A5dQ+Z65IkTW5UIo9HVJn9Eq65FJJbmY
 UtVZOmmsbPMEkq8+iZOhkKu77UQmCPZDWwS+qjyhV5L9mYJ95w6tUklzZ
 ON5y966xdOlNrShQNXbgYR+eSPwSIsx3euBwNRzu5far5uRJZ0Skfiy44
 UU5/P2ItKyRBvlJNCAQM5TbTM9TZ484M4s2XrRO073iekph051BRx++la
 39gjmBeKP25q7NGBOfwvtBunkG1MWO4SYq6bL8885QZ5y+DNsRezmIfaP Q==;
X-CSE-ConnectionGUID: gYAGu5UzQeechRnViGMbCQ==
X-CSE-MsgGUID: lMdWxPRZQNGKThXRdaLoFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24354987"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="24354987"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 22:51:04 -0700
X-CSE-ConnectionGUID: TuxxcN7XQF2YCZkgNl2AFQ==
X-CSE-MsgGUID: kP+bLrmQSsCpZHoqvcbSng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="69913070"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 22:51:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 22:51:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 22:51:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 22:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4ropCKJESMQXPw0A1yxWvgWmfkiGM3fJf1xBw3VBJWGG6EF1Mi0FZs251Qs43CTtsM5iC2+mr4BLeRO7CBehSFoxk2OlA3wDo7JuhTKp6+X+Tsd9vcGDaJZGaAsj4D3FwSEqMtrzyVV+fzbFWERmLhnCb6kBsbMsWVKKdU8qH3QRQmHQzEuaVmQVmAjD09MIDYJ59nTdsGd9zLrn1hP3D2LfHmC6T6BJoJCUyQSRslqBC0t5RtbAZivdaD/pVxLq9mZ7JCpPqfd/HwpbSf7xxt8k6XTyOHYnlB26ElbSdSxD0CoMacquj99ickvBEYj5yONKe26TV8hfxQxIwtq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZUPihQmoaDwq+s4gyFHL9Z8vrHh5P7K5BjevAyx0NI=;
 b=emLDe36msBREbDklyTugR1tVlZeWIXrRm6yPBs7Mtmo65LqLJoOM4eJO1FqfWc+ZKUiQv7zTSOmSmqMr+Kiq/co5No4wS2GCIm+vbNpjOLE89Sr7Vvqn9cL05is1FhYndqJwIjgJiLlTVgL192N5wXaDKuviZKLgtTFBpx+dO/LsGA0JamPZRNOrM9iNQE+dU+BRKGHUi9XskcoCvg4XhHA8IsmL+9SM+5qo/gGYDgDZNpZ99GVrxbFCjsqV/WdXKzOmowpmGE4ksZTGkxpt1l6lnkABg1S7JsjeuE8iJRf3H2+oQwfsVfQgy5yUKaiV3L1joy+KPUty0wwXDvspGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 05:51:01 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 05:51:01 +0000
Message-ID: <32a74590-112a-4482-b8f1-cc0d92eb68c5@intel.com>
Date: Thu, 5 Sep 2024 11:20:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pciids: add some missing ADL-N PCI IDs
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>
References: <cover.1725443121.git.jani.nikula@intel.com>
 <47d543393e4026588401a03c4e3ce12ce29780e3.1725443121.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <47d543393e4026588401a03c4e3ce12ce29780e3.1725443121.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0182fd-73bd-45cb-689d-08dccd6eb8ab
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXJZcTRpbWVRSzJ6MXhzU1VzaGp4eDVEUzBUWXpiSmJ6NjJ3OXI2anlibk9q?=
 =?utf-8?B?ZXVyMTFGY0ZsVDhQaVNJREFMS3h6NEJiaEdzaTluRjh3WGp3OWNZNkhwN1o1?=
 =?utf-8?B?SjVGa0w2d0ViQ2pQd04yZlA1WlUyWUFNb3V2aDl6cHpHRTZmOXUvZlhta3JY?=
 =?utf-8?B?NmphUUg3ZDhvTUVSZDVrM0oxY09aS3R2cElYUGxsUlZPMGxLZ1pkTHNqc0M2?=
 =?utf-8?B?enNYS21NNWZYcGMzd1FTRnMvN3VWN25BWUtxejdQUFdyT0FZY1RqTFJMUXNs?=
 =?utf-8?B?TENUN2lZSmVRaUxCeHBvSG4rd0VURGIxRysxdUxhNStOUWNHcTI4c1BoblpX?=
 =?utf-8?B?SDlKZEFUNVNDSTk1bUFYNUp5cXZpd2F6R0V5ZlRPaTA0WWlRUy9kSjBWNmFw?=
 =?utf-8?B?aFdEUjh5RVRvSnFPVlFnOWZVTnJETVNrZFZCZHBieHgxckoyTVBzMmNWekJv?=
 =?utf-8?B?Q3JXTlg2ajhER0FXRitHREZRVzhyTkQwYXpoRGZlWlZGY244ZVQ2dWZVbVZz?=
 =?utf-8?B?OUlkYWd4eHV3dElOUTBWYzgvNUVUaFNzK0pNN0ZSd0lsR0pvQVBMbW13TVdj?=
 =?utf-8?B?MW1sWWtQejJLMGF0UmlYV1lrYUo3Qnk5VDRBMlRodVJDRFZJMXpVaE41aksv?=
 =?utf-8?B?eE1SM1U4SVhRYjExUjFpRzdnbEdBQnFiMWVCWG5yUzZ4RmRwaTgvMXhPS3I2?=
 =?utf-8?B?UzVEcU5yVHEyWlI2VmMrK3VLVXNUeEJCeTROVVFhOWlESzBpSTRtL3FlU29a?=
 =?utf-8?B?OEt6UTM2QlJzWGZLTncyczRQMTBWeCtyblROVlYwbHFtenFWbTFJTFRINlVX?=
 =?utf-8?B?UWVtUk9yNHl0YnJhYlFhVy8rUk5FWWxBK053VFc4bklEaTlRUkJDK3IwbUdE?=
 =?utf-8?B?dzZDam5tR0JSaFV0bWVRTTYyTWJ5UXFxQUVGRHExVjlRT2VsMFkvTFNka0Jo?=
 =?utf-8?B?ekI5di9SNG9lTzVmdEdVN2VTZ1RXVUFMV01Rb0h0eHBmNDZpUEZKY2x4NzQz?=
 =?utf-8?B?RmlwejhHT2VDcTAyRFhBclVSNndpa1dPeGhGTlZUbVB4ZHdLbU9WYWZjVlo2?=
 =?utf-8?B?em9NVkxDdFE0NEt1eHU5aHZ2Q2loVW1qaGlVdTVNSHkvUmJGNmtMZ2FSYlpr?=
 =?utf-8?B?cmVCcWMrbmF1UVcwYUQyQ2pTU0tLZ1FXRjRicG5kcnNoMEFTZHdxSGRoVC80?=
 =?utf-8?B?cXU3Rmp0bVZ3UFp3amZtMXNnY0NRcGdpKy8rQzVGaE4yTFR5aUc0VVh6eGJu?=
 =?utf-8?B?TUV6aHRJb0pFSTAxdGNkYzFRcUtVRWRvS281RTBqbHh5OFo4b2dyVDZrMXJ3?=
 =?utf-8?B?NFZqaGFtZTVac01sM0JjQlBGK1NmbXZXM0hYN2J6V2lPc3BscUhPMk81bzNK?=
 =?utf-8?B?dmpPNmlWRXNkclVHbVdzVmpGK1d0S2xzVlVvVHY1dUo4N284WVJCKy95T2pi?=
 =?utf-8?B?SWZhUnZzZFMvcGtoc1Fhbkg2czk4TC8vRU9qNW5PVzR3UnhWcStxc3NON2ZL?=
 =?utf-8?B?TVVyQ2tvbnFBUm1QT3ozR3lpemE1bWtDOXBvajJyMFQyelZhYzNGcDU1YTho?=
 =?utf-8?B?VWFjU2tHbVhGOC9HSXVyU09JYUJtK1BlYVkzT1Vvd1BOOFBhd00wSUkrdzZI?=
 =?utf-8?B?cEFDVzBuNFlZUC9VVXA2QmgzZEh5TjdDNDh0eEc1enNRbmpoNVZhdEtzemJm?=
 =?utf-8?B?Y2txQit6MVRnSkNrZTFXaThranp2K0hEYnM2SlBZcC9vSnJsdjFHQkx3Qm41?=
 =?utf-8?B?Q2pPNWdGS2MzMndDUkNWODFWdS9yZjAxMy9Fejg1L3E1akJRMXJQNjdvUzUy?=
 =?utf-8?B?ejU1WWlvbzMrT2hnVytEdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG01TGU3N2ZIRFlHaStmNnZWdnVkeHRpVHJaa3NEY0hjYmhlOVB5a2ZPSW83?=
 =?utf-8?B?ZGtBY0dITWtzSlZoK1JTSFdMa1VLcFFKYytNUXhEcEhzdkQvS2lBRnJVbm9Q?=
 =?utf-8?B?YWt1SkprbzROeFNVVlROSnQyTEw0MUw0T0xVNXl2OVFQc0lrbEE3RVhQcGk3?=
 =?utf-8?B?ajdUR3V0WHZGdGRQM0lzYUdHT0NqcFBRQnQ5Zi9YUHhpZjc3c1cvMzYwOVJN?=
 =?utf-8?B?ZzBIMWRsdGs5bmxHc2xnUkY1cEtYaVJGMmhMeHBMUHFaRW54Wm1icmtlNDVV?=
 =?utf-8?B?bXE2VWg4citPQm1WK0VCSXRPTWhYY2FURktsMlo5R2w4eDJ2Z0hIdDlPOFBa?=
 =?utf-8?B?VFpNR3ZmaEZLZ1NTK1Ivdm50NnQ1ZmNPK1U4VGQ1NFU3T3k3amV3UUdZdUJJ?=
 =?utf-8?B?cFlIWDBna012NkxlaXBzVEtCMUUzSVRJYWI4dDFtaTd5RE96UzQvUlZyeDdz?=
 =?utf-8?B?SkxROEJKV3oxVjdyMlpVYVV6a05reGhWZmhDMUxiT0hybHA3Uk4rb0MxL2Ur?=
 =?utf-8?B?MjErbG5pQlZxOHcyQjJKNzRBS2dzeXBMMHc4Z0tXVkNzbGVnbzYvQ2lQaGhS?=
 =?utf-8?B?MFprNmsxN2M0c2ZvQVJEZG9HbkhRVEJ0OTl6S2NCRHZYNUhxR3kzTzFKUVVv?=
 =?utf-8?B?NU5HbjdxY2d1THdYOEZxQ3Y4WEttWjZ2RGNWTHNMSEVhVGpUKzhzamtvU0xG?=
 =?utf-8?B?N25zc0g4VW5WSVA1T3hxL0dYUmo4Zmg1ODRtT3g1Z0krL1pZc1R0S0Q0RG9m?=
 =?utf-8?B?UDlqQzZ0NElFaHlpS3dxUHRGWTl1ekJpek9mMUNoQmcwOWVSQzZ3Zmh5b2k4?=
 =?utf-8?B?SDVaMUhRRFpCK2RpWlBmYUg2aDNBd1dpVzVGM2V6NGh4ZnRMZmY1enJrNWZ2?=
 =?utf-8?B?c3FZS2Nhejg5SWs0SWp4S3JYOEFJeit0WU8xaXhmbGpJb2xQdUZHRkpBQnVL?=
 =?utf-8?B?WVNnN3psdUJ4TWR5VUovRnVyQThqUXVvWFUrMC94aS84VE1EaVpqQzJXczlT?=
 =?utf-8?B?eVRycVVPZW10a2tZOEc5TkVNTUZCZXFjenplcGh0TUFISHE0NnhWY3Y1Y2dJ?=
 =?utf-8?B?ODYyV21kVEdSWjVobHpWazFOcXBPRUZtY1J4cXpkNStITnZKSWNFQlM3R0Jx?=
 =?utf-8?B?ajREbnl3disxSGdzMUxwQndKWUNzZWdQb0FVbVNYZzNxUitnYm9XL2ZyMzNr?=
 =?utf-8?B?MG1ZT3JsYTdadVA0SnB6dlpzc0FVNEVDTWp6dGtsWE9tYjIwMjQ5ZUxYSkZG?=
 =?utf-8?B?d3NrRXcvT1dyRytMODV2am1aSy9NSjdOdVNsYnAzaWF1L3hEV2pLQTNSRXFF?=
 =?utf-8?B?aFhrbGZwa01vVkk0SnZYR1ZwQStwUTZDS1BzaFdhR1dEN1hMNjZrTGZuTUxV?=
 =?utf-8?B?OXo3WGtOWjIrRDlYVVhtUWpVNU1QWGo0aFdYUmx4TzIrQXJEWEpEZDNkRDBW?=
 =?utf-8?B?MGZvVTQrSzUwSlFvM04vcVNSblc1NVRDQ2VXNG8yeFRZT1V2QnhaMTNiWHlm?=
 =?utf-8?B?ZGFucXdxMVJwTytySU1JODlhRVhLa2hLNnBxeHVnOVZmQzc5ZmVyOVRHVXFx?=
 =?utf-8?B?SmN3NHo4cFhsNjNJczJDYm84STU1am12UnRscGY4bmNEMCsrUFBWeW5JVWRP?=
 =?utf-8?B?TDZXMXhHd0JNTjJZOTZIZ1VuTE9RWGhpSml4ekZFcitYYkV1T25ocWZiaWZn?=
 =?utf-8?B?K0l4R3A2K1phS3RPc1FYUVJqU25lcGl1KzM0bnk2S3MrOStHWGRFRllKRUpO?=
 =?utf-8?B?ZUZuZGZUOThYUHFkbkJQd2FpVFRBYWZUSndNcStBZ05scDNJMk8rZUM2Rjd4?=
 =?utf-8?B?Y3dRY3ZjdkM3dDFyOHAyVzhjek45R3EvanJsbTBNZ0FDSmhWRHoyaE1MTEtZ?=
 =?utf-8?B?dm55NG1TUDlBQ092b29tNFFEMEkyZDdEZXBFbGJudU5nL3BhZ0tPUWR3dENW?=
 =?utf-8?B?d1k5RGxaNHUrdFR0eXlZMjFXNVhRNmQ0NFNKNEQvVm1MMWIvVFZ3THlyRFFH?=
 =?utf-8?B?ckpneGVlNmx1SXFrQmxYTjkyODBWTVA3NGNQcStzZDhqc3kxcHFwUEJtWUdW?=
 =?utf-8?B?RVJrL1A0YlVOcW5PYnJPVS9JaXNyZDM5ajdFT3VGRXNGNG9TWjZvVW15SWFT?=
 =?utf-8?B?MzNGV2ZOWjBPdmdaTURIRk45N0JSRVBxKzhRYTNtbXltT050S0dpU2NJOU8w?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0182fd-73bd-45cb-689d-08dccd6eb8ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 05:51:00.9169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRi1AiiG5PcJ6yofes4/yMicbpOzydY+b8y2RDG8vfrtKgaLmsT47m8Fg33/a/q5nxbrzAVCE403i4cztcm9v6lOqgXu7wN0SKeKj3+NSPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
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


On 04-09-2024 15:16, Jani Nikula wrote:
> Similar to commit 425b463859ed ("drm/i915: Update ADL-N PCI IDs").
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks good.

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   include/drm/intel/xe_pciids.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 73d972a8aca1..41617c5ac6ab 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -97,7 +97,9 @@
>   #define XE_ADLN_IDS(MACRO__, ...)		\
>   	MACRO__(0x46D0, ## __VA_ARGS__),	\
>   	MACRO__(0x46D1, ## __VA_ARGS__),	\
> -	MACRO__(0x46D2, ## __VA_ARGS__)
> +	MACRO__(0x46D2, ## __VA_ARGS__),	\
> +	MACRO__(0x46D3, ## __VA_ARGS__),	\
> +	MACRO__(0x46D4, ## __VA_ARGS__)
>   
>   /* RPL-S */
>   #define XE_RPLS_IDS(MACRO__, ...)		\
