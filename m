Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AA3C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 14:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861D410F69C;
	Fri, 12 Apr 2024 14:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9N+a7UC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D60D10F69C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712933744; x=1744469744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wE2vsDiaIC93OiXvAykGfkGe/kH8sA/M1caufghmn+s=;
 b=D9N+a7UCSieraeDEVSn4loGuJgv79jd7JupGg7/wOzC/9IyrJSEesW5p
 h/sDfsir4T65AKmUPBSsR7qpEaKlGsAFy9BjXEGHmJt2IRUkLeIaKjSu0
 6GtA9M4owaBd76DkUqKspe8ijX8LQw2Vx9kmjfLMhKVU3iWstf8x38cMf
 YhhrIrwPYFRMUcxYcz9i4NOkq4fTKT5f4N1IKL7Pf+oJVRXSUDFz0OdLt
 IB5x6t5fF3+wX7jNQ4kxH+fMkBuOo3T1wJ7QODRq8qlJZ9cmsQIfHrLOT
 uYh+mC8FoJbKLVP04kx7TwjKDvg4gSI+npcmvrMBX+LmFVydPn2XQwGGd g==;
X-CSE-ConnectionGUID: Xc2OjLr2TnyjoSLVOEhPdA==
X-CSE-MsgGUID: ijx30+TQSOW1/wbi3DxqeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="30870402"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="30870402"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:55:44 -0700
X-CSE-ConnectionGUID: 6CxhSnQnSUu3a7kQ/1AbXA==
X-CSE-MsgGUID: yyJUKgmTR5Kkvqt3owHK8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="44515590"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 07:55:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 07:55:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 07:55:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 07:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eX0i7lQUjKfeScE2SEe3x6srLdn/5D0NC+8gFZHVjJZsUzhwofAxzp/gTyU7+e3DuvGHuMpmnPSavRQAE1SzgBoMiANv15QmpuY2a07jqo35t4LFakgsXJ9lKutA/umSYxQ/WItFZaGiXqW1w3SlJ+hRqRTsHPLomgG5uzmq8clZDW8Epm25qlCaAGFpHxUrHoIpEmKW3OXi95iW2hGfXFAZfLsrkAdjDn9YkjIjkON1/wDcuCxqDNwJaMhMozMJ2In+xInlxQa3J5lP2Gtrq83VS3G2Kww1R4LNOkBjFMvqp8ZjO03yu8B9CqMJqb2R3UL/ytor3vmruHVeXaFftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGg2kqxZk58st2j7MPP/dpQnnMsiTw9gdsWIIGqnak8=;
 b=fWNJZQRgJybKKSq0TP2sEZiz8DkVufWx8diY30gCqOcy3Tncoh+04laPvbb36xMS+tPpQ8tVfjTWz2pj4oIe74stEfJrbj5sC7rH3pjOK78NCWQd0qi0Q+tQJtrTWk2zoeqqaCrlOOR/HlfhUWunF0wiNwKwEzE9SF1JMAesX3pum3kEGhhieNDG77JwkJyhupZNmrul+du51a8bEpobiPO9uCWbnLTw5P1nElgtI1zR0MZJSRyBYrx0rM8wbK6274Kymqa1m3awqreqR51oBFlnC2+tCIuR+a2kGlgYFns5m4KOCp4I9BToLwOYKXByVekwRIFO8wUA4OYi8kokMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 14:55:40 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 14:55:40 +0000
Message-ID: <43232546-5496-4d26-bd74-c5f0c69688dd@intel.com>
Date: Fri, 12 Apr 2024 20:25:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe: Incase of action add failure, remove sysfs
 only once
To: Jani Nikula <jani.nikula@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-3-himal.prasad.ghimiray@intel.com>
 <x3sy3ujfkzbusyjqfdrjwrg5zvoeog6wu6d74tkonyc6own6hr@sjd2byv6ajqr>
 <87edba4pa3.fsf@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <87edba4pa3.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::30) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7fff79-8095-463e-5d0b-08dc5b009edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8ijeN+bH1yhWL5MIjmwroQTKYZI5BckeWcgcIa3EaBwK8U6U+AP+rR4P155L8xDeFn2s96KLAcWYjRPbaqLl0sL0ERcfPhz5hq0eIxT/kdCK7gwbBW/nRwIomnnvBQ2297i4Cy3Xonjx0jOdUF8lebu0sYPJymCqHY1i40gobVvkIhYt9sJmpqYKVw3y3036sPANXVakLyih9WwS0Sh+vbOnj01kb1BBN9oKr7t08NmmAl7Gj8tYv/BVCosFWCMT8c5BMb4N8Haukvw9r6AJj3477cIZVwJpy86tE3TZEOXEzu7WsjkXjv3Gy2nU+1POVxippjVHTYzAbSGIQ/h9TwHMu7UgmPStsLKs+CS8utPZBTrqKRv6MIhYqGlsInZkrlZT7zDXl6oFk6uINRjZhhh1ZEj1I6TH3re4KP/fw1qwyKkf9w6GCcoFWVVcgVj3mrTlQKYpWqoNTMiRiHmF0Oib9G09rue3uOJrIM1ohYeopaNu8vCQ0U7NyIGszVQS++ZDagDPryqVHQHijXORUgRNsWjNTDBY8k3Lnf4CWhm5wX7QYAKOmB+2AhW27Gudwm3frzFyXO4yNoF6QI6J6NnE2TwyRpBLtIQbOeOxH37WsCGUcMEHljsmvKgVls+gSxln1KbrQInJvfAO7AEepXRNLziFsfq8ibDcY8XCSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUs3QmN5YXQzZVhhMVNGN3MxbVNDS3pERzlvZTgxeEdzNFVoTHdCOVc4dzRn?=
 =?utf-8?B?UFhVRGtLU21YMllVK1V3TWJqRHdIclg5K0NQMHBkdTlqd3FFTEVNelRDRUhi?=
 =?utf-8?B?c2FobVd5Q3JiZHloYzJXWlIxUEV3aEZuRjNINm5GbWdML2NvcCtRckF4R3Fy?=
 =?utf-8?B?VVByY0tDOGNpR2hoVk1OMlYwekZOcUc4WHZkMFNwOWhsRXEwWFIrWllGWlVp?=
 =?utf-8?B?NnJPSXpVN05kYVd2d0VGcHpISTBwT3RrNnRWMlpwS1ZLcDI4RzlZQVJVem1X?=
 =?utf-8?B?c2RhKzBSbjFGaWx5RzJFU2xiNDRUWXVjZDI4SzhDeGk3S2xSd1FpazBwejZr?=
 =?utf-8?B?QStkSGlhZ0VNdDlGbmx4OU1DbVo5NHhsYlIrak1ISExKOGNIRnZrWkw1VTMr?=
 =?utf-8?B?OXMvUHRXMGNObVNCZU1qSWlRa1JlMnM0ZGhOVFhYTTNub0JoZENER2tMdDVq?=
 =?utf-8?B?S0xQVlNCTEtsbjh3ZGQ4RUtTQUNGb2MzQWRtQjVKaFFjM2pTWkp4S2dtN1Ez?=
 =?utf-8?B?dnI1K2dPcVlPSVh6T2hKNDJaaHdCeFU0cExVM2V4dHFEcVI2RzRqKzRaS0Vu?=
 =?utf-8?B?LzhUc21ield0bi9CMnVnZUN0VXAvUjNwUGR6U2s3UXhsaTV1MmNRdjJ1WTlP?=
 =?utf-8?B?VGM2clZkMjBFM3M1emxvTlFGWDVWM2Z3a1BmWnkyMStmOFdMazBaQVpUeHIx?=
 =?utf-8?B?NUlWQkRwWFNwSVNzT3czVkN4Nm1EaktEbUNCbTI2QS9WaUF6KzlVNGRBWWhC?=
 =?utf-8?B?dEtOY3BJQUNCNitEK0dxRjFRMEY5K0g3YTcvaEVZL1N2bjlDYjNTczNsQWR0?=
 =?utf-8?B?T2lmK0QyM2hhTU9PMjhobkR4Z3dGNW03UmVEM2MraEszcVRoN2lPNzdGc0ln?=
 =?utf-8?B?dFYvNXpIbm9MY3FFWFg3d3VWTVQ4cCtDN0hiRVI4SUw4SGQraW1nOWlRTTU5?=
 =?utf-8?B?NXFHV0pvdzNjOUQ0MWd4T0JaamR0ODlEU0FIa1JSZlNRQ3NxdlZSWGM1c3FN?=
 =?utf-8?B?OWlaYnE3WTlpeGdWL1BSWWl3UVcralBLNEVQcmYyMXcrYXd6dFVBVzNLd2dJ?=
 =?utf-8?B?UTJtOE1ERythUjlMdVVwY1dTUFRmWXFLSlQ3cWlBdHM0WnZQL25oYmovYkk2?=
 =?utf-8?B?QTFCRFZpNDFHeHNNWWt3NXIvUXRZUnE5cUhlNVJsODRDdzBDVUNDc0EwU1Mv?=
 =?utf-8?B?TnZNK2dNQVh2dnBQV0lpTzdRM0lYOE95MGxiMnkzeGZBM2V6VUMzdi9uUDg1?=
 =?utf-8?B?RUxsL1o5MmN0Z09uTzlrbzBWajdzeTBvcmVMOFZRRUp2OGoveFkrWHJ6cU5y?=
 =?utf-8?B?S3dQOVFzaXpjNGFFV0FkQTd5Y2ZXTytYZ2llcVBNb25RRTdOWTdmZHBWMU9H?=
 =?utf-8?B?c1RKWHF3KzVhMllzRUdIM2xsZlNlWTgvQUZ0SzNEU3BFN0tDeDN5U1lIMWFC?=
 =?utf-8?B?SWE5bGdXcytoUmNjVEhMZGJoblJNUUlLQzJTa3lNZ0hvZjUyZjFpclNzTW1T?=
 =?utf-8?B?cWx1TEhUbFQwRGVqWUFzT2hncCtFblQ5UlVLTDJmSVlJVUdHWE1UTzJvSWZ5?=
 =?utf-8?B?eTFKY1BLVjlOT0pxYzgxcWdqZDE1SGpmVGFTUlB6U09rNHAyTXVsQVRiN29C?=
 =?utf-8?B?TURINXNVdU9mOWxacmVUeU1HRElIRldvcm5yenBPdm9VRFZBYWZqdVNCRXJH?=
 =?utf-8?B?ZmlEYVNjZnpHa3JBc2dzLyt6VTZjd0tPYitTM1ZJeG5NWUQ0T0RLdHFSaC9S?=
 =?utf-8?B?Y2RmQjBNWXgvb1d0SEVrZUhtbXhTcG01bjZvWEphcUtOUm1yRXJBRVZ3UzZu?=
 =?utf-8?B?aVJEQkRYVnR1eWtLRm1aYnJNRjhSWUh3YmVEVlpVTGx0V2QwdU9YZ2E4T3JD?=
 =?utf-8?B?Mi84WWtlUnN4ODBsOG00dVJRdENLc0ZnQ1ptMVVHVXBMaFNQZlN1ZlAxM0lL?=
 =?utf-8?B?bEhTZkpoL3NJaTArc1hUK2MyaVhtbGdBbmFjUDJzVmNnTFd2Z1B0M2Y2UWVJ?=
 =?utf-8?B?WjdMMU41b3NkYjhEVFVQRGlldmVYYlJtREkxbTlaRTJFbHplUVp1M1NIVWhH?=
 =?utf-8?B?RUFRZjBybUhGR3diVEFacVNJanZzQk4vYW1ISkt0cTVTWmJhdUoxTkVxdEh6?=
 =?utf-8?B?TEdTM1AxbWxVU3YwRVJ0bzR3dFlxNVRpOC9JQzlNRHMxVjk3aWVsbjVpRG5C?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7fff79-8095-463e-5d0b-08dc5b009edf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 14:55:40.6535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGgTfjQaek/T0ZM2jTJUvg6/9zX3wMVq1hTpdjwqGUXmHukp7qEQZMrQDJkgUQd8ti7ww2a9oVnWJjxeCn70hM5PynQdgxT9am19jIYd8WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
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


On 12-04-2024 20:11, Jani Nikula wrote:
> On Fri, 12 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Oh... nit on commit message "Incase" is not a proper word. Same on other
>> places in this series. Please use "In case" when re-spinning this series.
> Or just "remove sysfs only once on action add failure" or something.
Noted.
>
>> Lucas De Marchi
>>
>> On Fri, Apr 12, 2024 at 01:32:40PM +0530, Himal Prasad Ghimiray wrote:
>>> The drmm_add_action_or_reset function automatically invokes the action
>>> (sysfs removal) in the event of a failure; therefore, there's no
>>> necessity to call it within the return check.
>>>
>>> Modify the return type of xe_gt_ccs_mode_sysfs_init to int, allowing the
>>> caller to pass errors up the call chain. Should sysfs creation or
>>> drmm_add_action_or_reset fail, error propagation will prompt a driver
>>> load abort.
>>>
>>> Fixes: f3bc5bb4d53d ("drm/xe: Allow userspace to configure CCS mode")
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_gt.c          |  5 ++++-
>>> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 17 +++++++----------
>>> drivers/gpu/drm/xe/xe_gt_ccs_mode.h |  2 +-
>>> 3 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 2421a8d34324..dca0e9fb3315 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -379,7 +379,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>> 			 err);
>>>
>>> 	/* Initialize CCS mode sysfs after early initialization of HW engines */
>>> -	xe_gt_ccs_mode_sysfs_init(gt);
>>> +	err = xe_gt_ccs_mode_sysfs_init(gt);
>>> +	if (err)
>>> +		goto err_gt_sysfs_create;
>>>
>>> 	/*
>>> 	 * Stash hardware-reported version.  Since this register does not exist
>>> @@ -395,6 +397,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>>
>>> err_force_wake:
>>> 	dump_pat_on_error(gt);
>>> +err_gt_sysfs_create:
>>> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>> err_hw_fence_irq:
>>> 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>> index 529fc286cd06..67a5bd71770d 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>> @@ -167,25 +167,22 @@ static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
>>>   * and it is expected that there are no open drm clients while doing so.
>>>   * The number of available compute slices is exposed to user through a per-gt
>>>   * 'num_cslices' sysfs interface.
>>> + *
>>> + * Returns: Returns error value for failure and 0 for success.
>>>   */
>>> -void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>> +int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>> {
>>> 	struct xe_device *xe = gt_to_xe(gt);
>>> 	int err;
>>>
>>> 	if (!xe_gt_ccs_mode_enabled(gt))
>>> -		return;
>>> +		return 0;
>>>
>>> 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
>>> 	if (err) {
>>> -		drm_warn(&xe->drm, "Sysfs creation for ccs_mode failed err: %d\n", err);
>>> -		return;
>>> +		drm_err(&xe->drm, "Sysfs creation for ccs_mode failed err: %d\n", err);
>>> +		return err;
>>> 	}
>>>
>>> -	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
>>> -	if (err) {
>>> -		sysfs_remove_files(gt->sysfs, gt_ccs_mode_attrs);
>>> -		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>>> -			 __func__, err);
>>> -	}
>>> +	return drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
>>> }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>> index f39975aaaab0..f8779852cf0d 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>> @@ -12,7 +12,7 @@
>>> #include "xe_platform_types.h"
>>>
>>> void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>>> -void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>>> +int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>>>
>>> static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>>> {
>>> -- 
>>> 2.25.1
>>>
