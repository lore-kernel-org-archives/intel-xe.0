Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB7FD149F7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 23:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4979010EBA5;
	Fri, 25 Oct 2024 23:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4Kqg13h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3376710EBA5
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 23:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729898690; x=1761434690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8q4N+wcd40RVCyNTkcvtNHh4lbheqY8hn48+/Jdrd0c=;
 b=U4Kqg13hfClNPbvtmeHGltwwb+4gvNa/4g+SG/WZidWi1DP93LeWH8CW
 STILBzxG/vqgqIKldX+2N6BIF9Xu8Mg6tjI0bf/Su6+4PluHZ16VCkYeY
 UKy1yLksYQSh+y8QmBmTk1NcUt6Zmx9ja187ZGFzWORGHIVV2jO1LK9Zs
 C41jelWRKOULw0wTVF/RkwetGqjjbi/UCBGZRCdD83123wOZCwN7sl14y
 p0a7MTG7FY/N4A4BPP7HCYQaAMPQvLsJgTS5IbWHgZOBsECnsbpM18N6p
 MaY03+y4oIXG4sThOYTy+E3oNMhBnCAwFdAO+xIIzfSZ8npAeqgu8w/a8 w==;
X-CSE-ConnectionGUID: RzSPVineQhyRtJLOWix9NA==
X-CSE-MsgGUID: JbBWBo79RSub9zWxP7eUDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40970378"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="40970378"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 16:24:50 -0700
X-CSE-ConnectionGUID: yNEfu6M+QjeDuDPV/Xforw==
X-CSE-MsgGUID: 7+FYvCZFR2KkUR0qXRUcTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="81508337"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 16:24:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 16:24:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 16:24:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 16:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doWb0tC0zztW/8dYwsdXqW+GtDtm1tvjPQ+W0vzdcE9xu6TdSEeJvY9+k8aFzsdXq7yDIkZqy0wQB6lYx0SuMUozlifNriXps9reVmMCuHCvCaBwuGNpAzni4+Ytcg50/MSpD8EsewH0MIg2adWYGahrJvYWC1CiaFbU9gYzuRZ9hca5h/YQG2vDpbFWHujIi8WGpygnkUEHqF2cpCYrFB3CFPVnpDnLApuxyL6C+8GIMP3fvaqIjrssGnxXd8+2C0u/GMIhuhCM8Evi/Kg69hKxSQXfj+5elFJbQ4/uqfVq+6Gcs7w5pjGXdFaQSHEJ+2t5SduseG7ayY6HGQQLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=su17CTCrmjSwRrLthWo9dvQEw86sdbkfJCenadCHr+E=;
 b=dnIj6GjULmZJT2R6+N0Z8xHMbIIWEcwWMmz5lm4i4Ya+TCSAlJx0W3Yhsnq16SFgUQHJ0j34+UizyJ5JPQk8bLu2zebA3AvcKA7uKYKBeEOrph65xd2sykyW8syIPdozTFhcd6UnaKzz4tbcHwtan6n8GpsnOwMVARBLGnWOoLRCGDQdT6Lk4Y3jU96TiUQRy25HTGC6zgFnAeEtG6oRETrambIn4Tb71mccor40RT788vTil+d3PuDZiwLzQiXy09HMuD5fGxaR88XZwKOF1HK2rZRU/T5T28+xEQsWhxDGSIcrNenPzqP3WROrkgp1lKi2PO+3JnImygzCg6lZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 23:24:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 23:24:43 +0000
Message-ID: <dbcc0ff8-fd93-4cee-aa5d-c6a023768626@intel.com>
Date: Fri, 25 Oct 2024 16:24:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Upgrade job timeout message to warn
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <paulo.r.zanoni@intel.com>
References: <20241025214330.2010521-1-matthew.brost@intel.com>
 <20241025214330.2010521-3-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241025214330.2010521-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41)
 To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cde9e9-fd8a-47ee-fbc2-08dcf54c3516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVpqdlFRb2dmMDIycVR6YW9kT1RrQ29PVjBSUnJkQTl4YlZ2U0NZeHEvVllM?=
 =?utf-8?B?NVl5K2NDQ1IzSnljNHNYSkU2SzBuWUNDZ2xOQzZyS3lFcnVVSzhtZDVTZURH?=
 =?utf-8?B?Zi9oTGZSZTNvNk9lMFJPRUxXWG1JV1VGeXNReEhFTUhFQ2txNjM3V1dLVUtr?=
 =?utf-8?B?ZzJoWTIvMUZjQkpEaDVEMDFaWEx2RTRHc1F3bE1tTFFENVNQejEyRHhkbitt?=
 =?utf-8?B?bCsva3dvQUR4S3ZGYitpUDhseE1yQWsvdyszZS9lRDc3a2Y4UGtGdFVyYll1?=
 =?utf-8?B?NURUWVNpQlBSU2FsVUpxU0tMSEUxaUFPeXo4NURRUU1uaE05SkkwbUZrTHZu?=
 =?utf-8?B?ODlWamFhQmx5bFdpR1BYYWhhcEtsVUowMkdDYmdYZllUSUJacW5lYlFMVmJF?=
 =?utf-8?B?a0EyS3FKQmZvY2dSbTFmdmFZK2czS1JoN2ZDdFBaN2hnK1lNZ29rbEV0Y2hX?=
 =?utf-8?B?QjNhY1NNZ0tBSXpEZVBnbHUxYTNqeUxtdWZVam8vc3dINnk1TGRNdU1UVHZ3?=
 =?utf-8?B?WU53Y3M5V25OSTNuNGYwcTBKdmtTNlN1anBIN0pwVSt3cnZPcTlaeW5FWTRP?=
 =?utf-8?B?TEpyb1hCR29NZ3FaVk05YVR4MHJOckZyTVk2YXpNWWhXbS9IUmlORU1kYXhh?=
 =?utf-8?B?Ymg2b1ZoYkhsZFEwcmh5T0YwTnpVUjMranpUWnA2Qmx2ZmJjK3UyOVg1Skxa?=
 =?utf-8?B?V01Pb0tZd1dKMmp0Nlppak0zWld2Z3p1UVU1RmxSeHBZNUxscHU5Q2g5WUtP?=
 =?utf-8?B?clZrWlZCcjh5Qm4xN05Rbk4zZU0yZXoyOUluK3BRYzhINTNUZTNLNXRuWWF1?=
 =?utf-8?B?elBXQWY3anZ3ZjBESTBuN1VjMUh1MjRnU2ovOVJPanF0MWdaTVpNYzNselZy?=
 =?utf-8?B?WC9pQlFSbnJ5MzVBY1lCUHdMTm5ZL29VZGRSQ2RGamQwRmQxLzZUbFZYVlZl?=
 =?utf-8?B?YWVRdjNZUlpJM0N0TFRwOE80dXJSRVVESytrWEtIYXpHN2txSUE3Ym5GTm01?=
 =?utf-8?B?VHA0ZTVBSWl2Mnozc2FIWVpWdk5MWkFXSUNRM21ob2I2dWRtTk5oaWJ4Mzlx?=
 =?utf-8?B?TGE2SVI5Q3g1cEJFZ3NFd0FzTjBMSEN1VkpNMDN2NDU4WStTQnk4OXp0VVFT?=
 =?utf-8?B?TC9KU0hSeXhWdGRKREowS2dRZXg5ZThNbmdpTldsR1dZMzM4N2swclpuWlpM?=
 =?utf-8?B?TzEvdndCL2dqMDAyY0xwc1VsaTdiMFFhRlNna2NZRVI5ZngzT3RnNGs1aS9H?=
 =?utf-8?B?MzdlUDRhNU9IUytnYnhLNDIxRWU1dFpuMjd5UkUwTm91N1UwSm9ES1l1SndH?=
 =?utf-8?B?Z0JzRTZmRUxHZ3RpQ1NIVmliSkNYYmJXSC9ZSWJUZ0h3WlJrWU0wUGdjWmJy?=
 =?utf-8?B?anNXajMwM1FGd2wrV3BnRytFV0xIMERQSFladnZkVGFpNDExRTdQVitJMlRx?=
 =?utf-8?B?emtsMUM4K3RaQU96bTlhWlpaVUx2S0gxWElIdTdaZ3d3eXlLaFEwMHNxc0xw?=
 =?utf-8?B?QTl0RldocmlmNEVrYWZ4ZzBzR0VPQ2FPS1NtZGRTREFvcHF2S1lzdUxnSloy?=
 =?utf-8?B?U2JTSHV1Z0RsQVJpTVhBb3dGbWJBd0dsblVIUXJuUlRMcDg3SVNxNU1HNkJN?=
 =?utf-8?B?aCswY2U2ajJZNGRqdW1BRFVicEhYNmNwcXkrMVZJQ0xmTE04MkNOc1kxbFBL?=
 =?utf-8?B?dEJZVzFXRFlCOURxZU9IME9mSFFISE5ESU4yNEdHWGtaOWJlZFpXSnJsL2Jr?=
 =?utf-8?Q?AoWW0Tl1w23qNrFA052owXGsnt/ILrPSutFkwo+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG1wT29pTkUvbmFKL01zcUl5cTBpYWdJTlpZbDFDcU5ISGUxSmlrS0pOWHFv?=
 =?utf-8?B?SWJ1THpyT3Q3QUVhQkswWUpzWXBJYStGTE1uejNldzduby9ibE1QNDUyQlly?=
 =?utf-8?B?SEg2TmxoSVRDVVdRRWhVYllCRHUreGEwQkFmcXJKU3pUSkNpbXdmL3Fwbmd3?=
 =?utf-8?B?Z0JPcmhOaXZjaXVqNVp3dXI0Vk1YZFRZK2tBWWxIR3g4K0F0SU5hVnVZZlE3?=
 =?utf-8?B?ZFFOdVg4RVVvR04zOXc2MkNWdmhIWGVOc3hnUkFBWFYvUThWQ0lpUzcxUHRF?=
 =?utf-8?B?SEVDZHd2UnNMQ1ZOVGNHbVZHZFRsQ3lxYStiQmNtZUpmaStLRHg5bituSXAx?=
 =?utf-8?B?Q1JDWmdtdlM2a2gzVlNHT2tLN1RJYXhOYlpTNUFFWU1kNnJpQlE4VDZUV1dz?=
 =?utf-8?B?MjVwUGVRNy9NMVd2VkhxTXVZckczZWtnOVhMeHUyVDlKYnZ6ZmZrNnJ0cVdy?=
 =?utf-8?B?Y01Kb21sSE9xRHRDVUNVUnVCcFJ6TVpXdmFuRmprb2U3WHBlVTlwN2dwSWhL?=
 =?utf-8?B?b1lOczZvVWMvY2FOcS9uV1JPR3EzR1BLWUlwcE5Bd1FCdUxNekRQcTVMeXJh?=
 =?utf-8?B?RnNhaC9CTVQwUEpHSEhpZTlTYXE0ZzVtOHBiNnpDUC9QOWd6ODBBNmtnWnEy?=
 =?utf-8?B?eExpVDdlKzdrSWl3M2dqQ05SRnRDQ3Y5bElDOVVWekM5SzhKY0gwK1JZSzNH?=
 =?utf-8?B?dDRDM0tEVm9YakRNd2YydkJsR3ZNZDQ1SGpvSFoyTkJSeUxXNWYvVGpiTU9u?=
 =?utf-8?B?V0wwcVIzYUw5RVNzb2NKZ3Y2SWZ0Y3N5OFFVaUZIY3dneTJpSloxd041M2Rq?=
 =?utf-8?B?VHVZNEVzVkxoK2kwdk1XSzlaejk4Mm83dExmR01tSHdISXNXRTd2RFd4NU9Z?=
 =?utf-8?B?bm1jMFhiSkNZVFN3aU93VXlNSjE4MHZBZmJGRUE4Tko0LzNqTHdnd3QxQ3BF?=
 =?utf-8?B?aUtsSDFHSmMvOFNZSG1NcG8yZEJjU0N0cjRCbklVYmpwUm5qSSs1NnM4L3Y4?=
 =?utf-8?B?QmF3ZE5waG93NVdEUWVHNFlSeEV5QUo0VTJvOWhyL2R1UndvRHl1R3ZnYXUz?=
 =?utf-8?B?em8vQVUyQThjUHk5R1p5OXg1TzRSZHdmWjBYV0VQdWpzN1gvYXVCZFZPQ3or?=
 =?utf-8?B?RmNlbXZZKzRWdjB4cm81MnV0cnNtTmR4ZEpPclViSnRKaXc5N3ZlTVJQOVVQ?=
 =?utf-8?B?Z096cmR4NHZFdFlhUFp4S0dmNlZpNGhrendMWGh0WHRnRUxYU1pSMGErNS96?=
 =?utf-8?B?azJaWS81RFA4czNGSWUxMEdIN21YdEIyWGYrWC9hK1lQWHdDZTRWbm9sY2NW?=
 =?utf-8?B?YUR0TkR6TW1HcEF1ZWhBcC9nT0N2bGNmRUlsR3BLb2diOHkxaGhBMHFQSEtr?=
 =?utf-8?B?THBqQ2c0NENsQzkySEh6cmVvTXo1dzhBaEVYaC9FMG52ejBPdDBHaXNxYUhJ?=
 =?utf-8?B?cGZ6c0UrME9OalBld1hPL1RCU3JkQlp2WG1XdkFuYkYxUkxyN2ZiTUxlc1Z5?=
 =?utf-8?B?UnY5YmJuZ21QSkNjVFUvcUdpN01xS3NIREgvUmhKbUlrbmRKNW5yMFVLa1Yr?=
 =?utf-8?B?bDJVd2c5WEd6c0JpOG14bk1MWFgrSUFsM2RBSDBnZ0xoSXAwWjFEamdKZXF2?=
 =?utf-8?B?MXZBNUhlZnQxZy9wbm9tdWRyVExhZHRlM1RQV2FvTnl6enBDM2paR0psWC9u?=
 =?utf-8?B?K055cG1vN0NpV3FUYTllTE1PVE4vbmdEd2VQdFFWUlZlc1htSHZvTkd1Qm9m?=
 =?utf-8?B?RTBRQUQzTVpLSGZJNGVDZ201Zmd3MDB4WnNIMyszOERSMHdIaGU0Y2tCWnhz?=
 =?utf-8?B?NzZNaHM2ZFBUekRRVXZxUjdKVDJiaEg0V01WV3BSTDRYa2FrRnRJbk9aYlBY?=
 =?utf-8?B?MXJURE1pSzJ3SWlHNjNjYnBsUkF2bW4wQ0trOFJRYnFRZUtVM2VtdzNxVktU?=
 =?utf-8?B?ZGU0WHNpR1pnRzVZMUdET1FqeFUyWGJ5ZDZrZVA5Wi9YUlBTRnFPcVpEWWUr?=
 =?utf-8?B?dXByNForQnBvN25aQzlCcWlDQnE1SlNyTnh1cjE2d1FXc1JKaVJSaEltTGh4?=
 =?utf-8?B?eUMzdmNZc0Uxc1U5Wlh5YVJCRG9ndkZ0WFRKQkVxcFFBSlJXdTlSSFhrVlpp?=
 =?utf-8?B?R05VTzZxQkNjRjVOUERnSnV6V0dzRW5rYWV4RXhscml1RjNqK3FnZnk1SXI3?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cde9e9-fd8a-47ee-fbc2-08dcf54c3516
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 23:24:43.8876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoFhYaBzbhvPlSbhp2thOAvwaBTMEbja19KzFFjDoAk05Sa/NjSSzqGMVLYM1MlhCrTNIV8fcc9B8WPyxDdRTwA9zj8eKUTgXaSbvKJhD2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
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

On 10/25/2024 14:43, Matthew Brost wrote:
> Ensure job timeout message shows up on distro configs for user bug
> reports. Change job timeout message from notice to warn.
I don't think you are allowed to do this. Job timeouts occur when the 
user submits bad batch buffers. They are expected error handling for 
untrusted user programs. As such, they should not generate warnings or 
errors. Same as passing dodgy data into an IOCTL should not generate a 
warning but just return EINVAL or similar.

John.

>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7afcc243037c..067cf2bfac1e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1154,9 +1154,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		process_name = q->vm->xef->process_name;
>   		pid = q->vm->xef->pid;
>   	}
> -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> -		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		     q->guc->id, q->flags, process_name, pid);
> +	xe_gt_warn(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		   q->guc->id, q->flags, process_name, pid);
>   
>   	trace_xe_sched_job_timedout(job);
>   

