Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB69C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 03:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5572610E071;
	Tue,  8 Sep 2026 03:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqh8I7M2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BB710E071
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 03:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788839576; x=1820375576;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h+5FY1Ejr4FFvVG+Z1RWA041erNunRDe1fWRVDnPEAg=;
 b=mqh8I7M2zlXngdPkmND016Ge1zSUkgUupA4QFZx7DaKF8vwruwHgH2dX
 0K4vkTMAQt9UL/ugy+8E2gcar9O0/BXlVv4w0wE6KLwmX0wlsXsc3HOg2
 mUM7RINej7edPIoCRjEWRecBfYTy6EKTM8Cqr+dKdYvUklcTp+eKc6EW3
 6itu4UuipPodRrM/wO3yU5xlJMxwhiNL8lgOzRXB1P/IVOVVHT8gDTTEv
 IQUB7Ddie2u7MENKZFqV3pv+VNxYy6OHJ930OpoJgu2QtbePY+1r8D6Ou
 NGRbJ3BHMpe1kE+lktF2ZsIwriDOWuFpdcwXddbGAkzvkPJehxcZu1ohH A==;
X-CSE-ConnectionGUID: obBiH9kXQLCV6ebyNpJsIA==
X-CSE-MsgGUID: 2efjVPcIQoCrzTuHVxdTZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89107246"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89107246"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:52:56 -0700
X-CSE-ConnectionGUID: 4S41lyWcS+KKNMV1Eh43vQ==
X-CSE-MsgGUID: /6auSoANT6WyP/2OuBdM1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="275008726"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:52:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:52:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 20:52:55 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3uFYdDBQOa7NLGNir6mfzkcScRC+1WM1Doz+0D3Xc3gb0NtwY1PsUpH+rl+PWbgj5uQE4PeABWbzM+VevXNG6PnsjDyjxC1UUtX5N/7Xbxshnw7WM1w5Sp/kJThv1yqIHdGlqEW+YnUQexdsvtF9oNFv37FT7eZVN6mAs2wxd+BJ6oMF3ui194f4JrUDwzjkZnirapYIDZdlBuNdps2vpoziWUH8jkvmJI3K3wSHzK8HUibTJ3BsXaEYn7R2qU0jf4tzPukRc1f2eeQiRKQHwwpeYZK/Eel28DlaF/R5LKk+/OxpY7WwKy7NFbQMNUlwKxRreUVODi9ltYm0oPL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CUxdGnBvD2mY15s6V6cKWlQT+mSIow7A6AXxY3twb4=;
 b=ZhyppmaplD/oOl3yikc90s4totnvoCf+3Dyp091C9vm9kW51S6cu8LXAGsQjFfr0iZYq6YJgYuDxp+xY5+87Qmk9YOL4XwFtjOmXYIjkErdhUg49a3m7X4xA/uTQ32BqUO6m7mvH960cNutuy8x018/YF8cPiRnpXLd0TDWBbVXyRwn+C6OA+Fe3y/2r5Isq8ze4H0PC8fWfn1c8+xjh3TnCoOdyynICm4v+EZETIoJNs/5fjrWyE9eYN9AdXRJSaew5jJ9n9MSYGY+/boyMG5o0sIQg9WCFN8BN9o3V7lovgi3AvjLp9sQmT1NBhnY5YoPkTqAAmdny+uwXR3Fe1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN7PR11MB993112.namprd11.prod.outlook.com
 (2603:10b6:208:5f5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 03:52:48 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 03:52:48 +0000
Message-ID: <ee9418ac-38fa-4891-8024-4d4752a406b7@intel.com>
Date: Tue, 8 Sep 2026 09:22:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [V2] drm/xe: Skip clearing purged page-table BOs
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20260907153706.888679-2-tejas.upadhyay@intel.com>
 <a081b43b-c4db-4744-8b81-7a87040b573b@intel.com>
Content-Language: en-US
In-Reply-To: <a081b43b-c4db-4744-8b81-7a87040b573b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0062.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN7PR11MB993112:EE_
X-MS-Office365-Filtering-Correlation-Id: 8450ba39-d69b-4b91-276d-08df0d5ca5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9GfPTFLOGovyES9uuUyKgCAI5//+BRsYsYOkMbbCjypsNYS6MRqIwZwxgdkz2qu7/ijcLvHOHUxRMDPZm4aXb6WIqNe9oZI1WCIOlb70i9stJJY7p3lrSzn+bZuarzmhWVatoON5Hj8wRavGpC4rBx7mTO1uSsvN/jWoB/fZKivgyUVSSOLuuI3dtv3zM3HXrL5RmSeMhUPPKla5FUOTF4797NhMvNNa3HgEZVOArGEEmuE+C4lU9xEKwyAHLzkPwhL8h3RGUqI4yICp2qkl8Pr8kOijQZtCBPF7WrrntjIQZFKKZubGQ8p9Dh+cC7ws5VlMVw97ka5k/bow1rufxxUzZ5Jre09w6YdWO+OKrc6Wj5g+6UAi9s2ekcCoiWdJKiwX4K8SpfTFIFWrsnd0BOa9DEgPFjTLiw22Dv0aEi+l5gu22NkrHmBrk+c3HvrMsK6C0U6hzicn8BLnuwwZ6CnaX+UZ/Rh9UIBqFYPNzzrV34Ay9nfEoqbylNCbQhj4SWhr6cP9LtjelgR8Khv0xPrkXkx4c2thK9ECsnD1hCLJnzCwP3duMvvLqjZjnryAfYTkIhMmnhlhkYKzR8zRM9k+tgyxwAjfNrQDwqwnqgxphWXQ9VYHFYLH6ovgDetR65Euf53KM8vOuXbQ/lcista/bNUPJyg68Op2kSr5y5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXR5dUw1ZXJvQ3puaEdkL3gzK2hkem1hTlJSVDRGQmI5eDgvdFVTQVhubGhV?=
 =?utf-8?B?cGpQSlo1d2U3dWdyRnRTKytLdnBFZXZVNm9DSjBBMnRrQlRRZmhUaVJEZFpK?=
 =?utf-8?B?UU1WbTVubi80cmZkYUR6a2NOcktCM3ZVOXZTQ2xsMnlIOU8yVUk3Y0JkNWky?=
 =?utf-8?B?Vm9BOWdQa2ZWUFQ1K1NGOVdFaTVQVGdVRDl2YnR0T05ZYVdEK1Q4b3JMRjlY?=
 =?utf-8?B?d3Bjam96b1IwaTYxRE1sNnNzdnNJV1N3YldpYmtCOFEwbG1lMy9vWFhWVEZr?=
 =?utf-8?B?SnMrZEtjTkEraFJwY0Y5a2ZKby9qN0VjdXpCZTZyS0FiSDdJMGNXUmFRS2la?=
 =?utf-8?B?M200Q1ZReGpCUUFsTDMzRVNoYkZ2elNVWGZoM3haNmpFT1J1NFA3aVRzTHEv?=
 =?utf-8?B?aHU2SHRnNW5iR0MwR0JJc1lJdXVwaTJvVVljOWI0ek1CcjdpemVNUjlQcHNG?=
 =?utf-8?B?L2w2ZHBhSkZWSXhrY3gyMUVIQjRzZVI5Z3c3c3l2c211ekZNNWd0bkVTaWhL?=
 =?utf-8?B?K0VBMWNSYitiWDZrRlN1RWZlc2c5aGlKVE40TE1Tb0JnN1VETCsrdjlkMHNE?=
 =?utf-8?B?NjhHUUxmeTNKbnl5ZkJCeUJZZUN0K04xME12R1A5Y1pUSFJaR1BZOHZsY1RU?=
 =?utf-8?B?YWpRMDBuNjFuZE1BcGlQbXdnTlplTldteER1S01OMmVrNGNlcGxGbDJQWitj?=
 =?utf-8?B?anRpNG44Tm5XSXRuMktMczJGQ1lUUUdXZHR1dkZ2M3l5amtRMFl0NjVBTFg0?=
 =?utf-8?B?NFl3eC91L0VLUnY0UVAwZGJjNmVseFkrTkRJMFJzbUdKanNycERhZkxkR3hP?=
 =?utf-8?B?d3ErRVlzTFd5d1A5T2dLdEF6UFo1T2hwOHdvYi9tS1JaNDJSQm4zYzRWQzFQ?=
 =?utf-8?B?TnBTNjg3WjlNSi9MQk9QWHVqRFdkVSszM2RIVzE0VUMxMHlGa0pGd2dydStu?=
 =?utf-8?B?emtxSUorRlI5OFE2S29MMTQvVW9LTDF1ZU1zS1lTS284Vm1YclBEMGN1Szdw?=
 =?utf-8?B?K3JjVWVVVkNSNm1XWnUvZjRoMzVtRTFHd0g4T2dZcmdGZUJyMWNEZzErT0xp?=
 =?utf-8?B?VkdkUks0VzJKcnIxZGpGMEdoTFJFS2pYRjBHd0ZYNGtTeTdmK3JGWVRlY0hx?=
 =?utf-8?B?aFhobU9sWCtjUkpodkFubERicEFTdzU4MzdYVHZhNVRaaDlURnBxem5YQ2c4?=
 =?utf-8?B?ZWJPT3ZhZklCZFNtQXVZL3ZLT08yQkczQ1NPVkRvZE9RdGlaSnhTcGt5Zktu?=
 =?utf-8?B?UW9CTnVnUjZ0WmkyLzhDN3NzdGoxb25Gb1dTaVM2Z2ZLd1pNdUxDMm04QWJm?=
 =?utf-8?B?aWN3b21JYzZsYkpUa0FzWTg3N0ZHWStqVHh4aE82Nmk2SGxpMnhuWjlNRTMz?=
 =?utf-8?B?UjY5Q2psRjBTdGpibWNJQmh0WnNRbHdBTUpINXlvdHVGUXR5OVpyQ2FuSEpw?=
 =?utf-8?B?dldYU1NxUWFWVEtFeUtPWGhoSlhtb1RhOE1iMHBhV0JGaUNERlpGaStRRlpo?=
 =?utf-8?B?N1p5Q2pFRjlGcEhUMHN0NmZLOTNUZjZ2UlhQeHMvaUJNQVJmTUF2dmhISndq?=
 =?utf-8?B?T2MycFZBK1NpUUw3UFlCVmpUeTdXN1FaaC8xRVJvdkJUTHpQZUFWL0J3T2ZV?=
 =?utf-8?B?SHZpUFlpMy9MZ2l1STBIbGVKdUNadWNiMVFCSnBvMTNhMHpMNlNFS0pJQXhD?=
 =?utf-8?B?L2Y4U05vdEZBTzhyTk92Ujc1c2twSGlHY2FwSXlRbFMyaDI0OGxQYkNMdSsw?=
 =?utf-8?B?L1JRRWI2dVRFYWxnR2wxc281eWoyUzFsb1MzT2JwTXMwMFRtdnRoTXFXY25Y?=
 =?utf-8?B?VExxQnU3ZVdxZERkYkRzTStDV0RXMEl2K0dSME5WcloxeVZnY3hkdTEzMWNh?=
 =?utf-8?B?b0MrNTA4RWFOY2VKRTFTM1c5eEFwQi9CbGF0T3A2RitFY2xZTnNmaDFMNjJE?=
 =?utf-8?B?ekppQXhHZ3lObFJpUTZ3ZHIxQW5xSWFCdUtzangyR0VpK1l5MWxYM084Q2pP?=
 =?utf-8?B?WWRnY0ZuWElOS0xPWmFHaEtpY0Nqd0Nvd0xWTHRIU01ROHF5VUkzdFEvVTNJ?=
 =?utf-8?B?ZDVsQ0ZYMmpvVytoSkNodW5iQzVWcW9JVHVsdVIwQllSeE90RjNRdCtCNW1U?=
 =?utf-8?B?cXVJdnV1Mk9peVhXVVRoU0hnNVhqaUFIWlNsWkh0WDl3YzFvdXduYVNXUTRT?=
 =?utf-8?B?dVpHTWtGYkRGYTdWOXdmbXE3WnY1OFhZV2RnSDBudmQ4WFRLZ0E3cVUrWGFF?=
 =?utf-8?B?YVgvMUl0SEFOVldWMVlZdXBLVnhQaGdPWUJhOEczaUJ5VUNMd05WVFBQRE5t?=
 =?utf-8?B?aTFRbmZpMzJ3bnJHWFNsMFI1Q2VsQmtjalNSM2NOMUtZUG91K0NTZEpqNDJ4?=
 =?utf-8?Q?TgwN5tUB+n5PBLB0=3D?=
X-Exchange-RoutingPolicyChecked: c9THfn7PPu6kjyt91CpdUccHVL9TqjI9NHSZjtn9CWYKgUko8GGj+uVPcNyseVu58D2bIiqMLm9yANoEnIOk+4Byxxi+jSVD5EVwAIREcIv/rEMsAuVb+ZalvDRy5Jd+iQxQ/zHM+vfCstDUWKECMfT8Dze/2s6/t52N4VhNqyJ0L9pksYo85/nGB/IZnxoR5kM/5ghaEs0gCgOCUsZVU+qMxbX9XBq0TwueK24TposbmOAXCz9KoOf6fpCf4+YxxZYTYidhZ74C+/X7Ypds7LJ6AOsW+fVxU5wjRQ6WqPayiqYXAgnHQHtNb1Cx0gYzBkiiiJau1G+zrWbcblrz/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8450ba39-d69b-4b91-276d-08df0d5ca5c2
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 03:52:48.0294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xjcex//BjkpuzMMf2NuPsURrDZyJkZbWXE5+rdimoZWPej0tPSXfG9uO5TK0B2J3AmdOH5OtYiZSCSnpG/jRH7QNU6iRGXQbvQy2W1NEgS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB993112
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



On 08-09-2026 00:58, Ghimiray, Himal Prasad wrote:
> 
> 
> On 07-09-2026 21:07, Tejas Upadhyay wrote:
>> VRAM page offlining can clear a page-table BO's vmap before VM teardown
>> calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
>> writing to the mapping.
>>
>> v2(Sashiko):
>> - Fix lock ordering
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 6 ++++--
>>   drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 5d990c1c3740..a9b9cd7ac2c8 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, 
>> struct llist_head *deferred)
>>    */
>>   void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
>>   {
>> -    struct iosys_map *map = &pt->bo->vmap;
>> +    struct xe_bo *bo = pt->bo;
>> -    xe_map_memset(xe, map, 0, 0, SZ_4K);
>> +    xe_bo_assert_held(bo);
>> +    if (!xe_bo_is_purged(bo))
>> +        xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>>   }
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 9e71567b27cc..e77ff3cf3ca3 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1876,10 +1876,13 @@ static void xe_vm_close(struct xe_vm *vm)
>>       bound = drm_dev_enter(&xe->drm, &idx);
>>       down_write(&vm->lock);
>> +    xe_vm_lock(vm, false);
>> +
>>       if (xe_vm_in_fault_mode(vm))
>>           xe_svm_notifier_lock(vm);
>> -
>>       vm->size = 0;
>> +    if (xe_vm_in_fault_mode(vm))
>> +        xe_svm_notifier_unlock(vm);
>>       if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
>>           struct xe_tile *tile;
>> @@ -1901,8 +1904,7 @@ static void xe_vm_close(struct xe_vm *vm)
>>           }
>>       }
>> -    if (xe_vm_in_fault_mode(vm))
>> -        xe_svm_notifier_unlock(vm);
>> +    xe_vm_unlock(vm);
>>       up_write(&vm->lock);
> 
> LGTM
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Sashiko pointed a valid scenario where the check breaks and could lead 
to NPD.  Please move to iosys_map_is_null check as suggested.

> 
>>       if (bound)
> 

