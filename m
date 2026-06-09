Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD39CD8CB9
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 16:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BA110E1B0;
	Tue,  9 Jun 2026 16:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cB2hlu6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D547F10E1B0
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781021823; x=1812557823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=588u7jyI4YwBt7JU4mHRpG4Ol1NkeipcZi0UQOJxW8o=;
 b=cB2hlu6mucwltqA+nuQXVLbyxvl6654Gc9DzaDgexSgeWSmiQyDYPcXM
 rXlwPrF8GYydRtf4JSlt6z5hGsKh/MdiHaSQq7PvgeIR0OEmBk1+FVaAD
 Hjtq6kGRGVU8eEtr3uX1mUDP/b4loJWGH7fcCaqPUFWZIW/1lQwESmapw
 iOiMcXCIi4QTwdo5YY9FH3UDSfEe3m9tqtZ8q88HY87I6SeUAGULDBgK+
 2R2S2dngqZulmrV4zrcTa3V8CnCiLa21wAP6501z8FtLa9lVKWTYfnWFY
 CHiR1D7YXzsZ89yGtc8J3L3AX0TJb7Mh0f7KCUw4PmpL7+Dx9WIniFjQl Q==;
X-CSE-ConnectionGUID: PuOwqGoRSj6wTMzVC4sXCw==
X-CSE-MsgGUID: dggHx3crQO20WSibMmSRCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92109909"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="92109909"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:17:03 -0700
X-CSE-ConnectionGUID: p1mcyxWGSGmCja+1/U4ryg==
X-CSE-MsgGUID: lSKmZ0VFTS2vF9vIIdixuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="245058683"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:17:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:17:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 09:17:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4AtFRuZ/OBUQ+WHdzg3ZWEpuc5r+Qz/B6Qt+93hcP3IIzgjeDdQtdo8g4Ubpeocb+XTwWig8aN1UkJqKA9+ct3huBzSAsSo4v0qz/c620vIV8Bc/EA84ioduXzGDHz3QJvqNVuMrgj1tPdKDkjwWxH1vlpV7U8UL/kp5ezqEvBlS3vCzwTqD1u+Om7WgHfqOODv8raSxUoBbvsCn2ISKSal4QhlhNFTiRWC9FA7bPdWEdc3cLepo4ewN/f5nJCpJXYwywkFeus+f/jL15QpXcxqXvzN2pNE7ntfFiStGqn7R0W8lhg5Q7PlONnNmVDTSdfgxb16GZdlJDvFEcNFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZcHShIX7sFJpwFTVE2EWK7lhTHdWKrF+8qBXiVS2FQ=;
 b=xnUFeGngBmoijyVDJ6IVtkbm5fSyXtVOTzuo6XKUxYEt0i6UYpvJtc+dHnJ0mdDlCe0955Z0jTTc+nZ6Gn9+EyNset58kUYeVE4iAoq/xbPjDj/Tfku81SLnOuNLJfk0dfvfbGVNUNgNNwCyMzl7TSTV1gTxkBHSEi1ecuACFh3DMAixrk9prnZden7ZgKAPPEzV5m6ZwE4xZnIdKNX46tbLpF5F5BkLbJhHm7ZS+ikRE9x+KzZF0avC7IYMaMb5HugDIFUYEy0au3UTCg4qKRSY6E8o14NsOR2MEEb4aYv9F11SzD1Mnck69+0qgWusddyL+wXM705BfBFkMgm4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA3PR11MB7626.namprd11.prod.outlook.com
 (2603:10b6:806:307::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Tue, 9 Jun 2026
 16:16:58 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:16:58 +0000
Message-ID: <d18b50f4-e2ca-44af-aaf5-d237540717a2@intel.com>
Date: Tue, 9 Jun 2026 21:46:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Sanjay Yadav <sanjay.kumar.yadav@intel.com>
References: <20260609144412.244678-3-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260609144412.244678-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA3PR11MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: ee66deda-b286-4c07-6039-08dec64287bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: P5Yc+EIJIGYHtrODqVRQZffPqSfIsyrJ3mDme37HbVnuZt2gOi385uxnkG3GEn37EquIcRf8tl7syJSl2y1odowg4TmT0cHdaSBBxe+2SqI/C2ubUi2KZwHi6v+M3e3aW4IDWZWirH+kXDv9V9aVq3sri378dVP6e/x5Y99GTg176c72lW90hSZ9lEhr6rwh2/5Wg+uGxER16Nl86KibiEF16a72pw5S05faXr26TrvV7owtYjb3sYjorDsOQNglLSSRrPMdor0aiQoS+VbPjy6fqpZmOnaTFprsaw285v/lI4JKIKBNTOyPKO++T5B5yEY8cRS7/xifpSUd7trCzfzSUuN/3jNvGAxpt2Vod4wMO3Vrhm1/x0QgSe4EFcXdqOmP92j+nLi7G+GXHgcCZiP82NOSQXfVN1tQMB2utGQPmUNaj0LN/7lbznR/ahWoZJOL2H+ZC0mYR8PBCnT0RtFU7czzXvAsqaN0n09s/vltFceRXHOn0U25c5ZZyGdaeh9dseuXrkaK2pK1FZNptSXWIr1lZrHgWsmnQ2fPDMjblyzCnTfZPRNf7OiqJORic79B+x+mmf74z5oDRJeQhk/DzokoneGy85YBKd8n6a8SOqGpXF3BDg3Av7yjfVeZrhgtrop/iP8dhyy8jizWAWQGQhMh6CUuBMn4l4/gReF0NOtMoQ9CS9aO7SgQOZiD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3pYVjBsYVBtbVpKTWdiKzVvenBTNmlmbVh1d3NCZllKNUNmd1lWaVIySDRO?=
 =?utf-8?B?bUJpam1zU1VIZjlKZUFUVG1JOURqSFJSNUxJSkI1Nms0QlpxaERSSzhXdXJT?=
 =?utf-8?B?OUloM3hpUExqeFo2VDZDS21RSklVQytNcFVRejFxeHhxSWJBVWRKcW4vVmdz?=
 =?utf-8?B?UlJlTXJ5K2wzTzA3VGlzMVRxS3pUdkxmTk8wT2JCRXd0WkoyZk93VkZoRFRK?=
 =?utf-8?B?N2dNUVl6LzhNb0RObnRYbUJGQjlKLzJpb25zZEIvTTRXeWhkOGc1ZXlyNGt0?=
 =?utf-8?B?ZkRlUVhEdUI4NzUzUmZZVHhwdGdCNkdpRTQva3lGN2pYVmFHZG9FQmtOUWYx?=
 =?utf-8?B?aGpiUStMRGNHNTcxanNzODVFemlpcXN0UXBENFVZY3dmT2E0cTNBWUE0SlFk?=
 =?utf-8?B?VzhjTUg2SjlqZjBHUDh1N3FJNkZnT245aE5xUS9SYlp2V2VGMVZneEg0eWFF?=
 =?utf-8?B?ak5CYlBTMDd6NlNmTkUyVm85aCtWMGtDeE82dklQLzhUZlZKQk9ITCsvVjV3?=
 =?utf-8?B?anFpaFlGcTgrVXZIRDBmZG4xS1NyK3JTVTRnMmw2L2RKZVJnbXNqdTVRMzRY?=
 =?utf-8?B?SGNsVERHc0Q2Q205Vm5DWEdGUm5nWTNtUU02M1lYQzFsRFBVa3hzQ2pmVGNT?=
 =?utf-8?B?MmVQRWRKbGVhZXNuMTMyamdVVjV1RG53NEhQRlV3c0FvRm9Ca0xnRVhVS2du?=
 =?utf-8?B?TVBDYm1NNDlzNENGU3VkZ3YvUG1HcDg4em14OEdFMVF3L1pLU0dTc1VVVFdi?=
 =?utf-8?B?WnNlOG1OdGpFNXpTZGhxNVpIb28vcU9IMFcwTjk0dm5iLzR1bDZBRGtFWU9r?=
 =?utf-8?B?Z3Z3dXJ3NmhWWkdYQUhvYTk3VCsvak5rWU5GYWJxUUVyemNMbitHS2xlUnEv?=
 =?utf-8?B?M1dhWUxpcHNLTEp3S2ptMTFsbWpPVlBjbXZTRGwrbmNBbkREa1VzRS85TWlI?=
 =?utf-8?B?ZzJJYVlINnc1TjliVDZBMjhxbmFZV3JtUEgwWEFNWUVZK256NUpJT1RDWmdn?=
 =?utf-8?B?cEg0b3BiV0d5YzM4cUswU2VOc1dncENEakliQ3VDdHp2L1dxQjFIeTZQRWVE?=
 =?utf-8?B?d3hZM0xqOVliT3o0S2pndENMRHE3a29sRU9ub2Z1ZTRBMVUyTTdUbzV3cjdK?=
 =?utf-8?B?WHh1TGkwaDdTSmVrcWc4T1R4SU55R3QrOFJFMUpFZFV0eFVZZEYxeE5DZDA3?=
 =?utf-8?B?b1o1blBac1VoYzRYL3BlYU1xOHVUUEEyblBvcTFWMFhRYk9YQzFFYjZpWjVL?=
 =?utf-8?B?eGhxMURmUHNSQXAxV2NEd2lONEkwSDFUSDRac0M3bHB3YkR1c1p4UkVRY1FX?=
 =?utf-8?B?MWNyTDViZGs0S1lwak5yc2JxNUxLRUFSTXlsTEdkbHMwMjhrVFpjZmJsZC9G?=
 =?utf-8?B?WEhXM2p2WHJnaHhrS3gwVHJ5RXRJUTNTa1JubEEvancvR3BYQzliUkkrS2dZ?=
 =?utf-8?B?aWdRVHpucTN5TFJNazBzYlhwWDVXdDdMTWRIZ0ZlcWtIMHoxUjkwUlV2Rk5h?=
 =?utf-8?B?d1VNcWtSVEdzMkxtUzBSQTVXWXY2bGpIRWZjY3BDcHZCbFpZZ0Jydjh6aldw?=
 =?utf-8?B?dXhFcGE5V2pseUlMTEt0azNaSitPYTFMY0lqN3B4TmZsTDhRL29kUkJSYlE2?=
 =?utf-8?B?bXNQVk1DSTFpK2piNTNVSWxYaWp3Q3BtUTJDS1lzRDJkNFVtMXlwbFFDeFQw?=
 =?utf-8?B?aTNLOTFYZ0tzYk1lVG9qMUNKcUxmR0o1bEh2Wm5OU0dRSktrVE9XMFBod1Fn?=
 =?utf-8?B?T3JvZkZ4RnhmV2JFdlRNZWExSk9YRW9aSEJRaTVoYU9LQmQvckovK2pDd2c3?=
 =?utf-8?B?VjRFZ3ducWROZTd2bHlQMW1tQ2tQUGE2Q0I0cmt0azNUV1lMUTAwcW1OWm44?=
 =?utf-8?B?OGVFVzQrOEpVTzZKaHpQTkRQbmdaeGJnbmFiQXZjY2xYaFd6aXE1dFVEd2dn?=
 =?utf-8?B?YnpvQkJpMnZrMUMwbC9KNUR5VFJONCtVYk1CT29pVVVlN2E3SENnVUY3Y29u?=
 =?utf-8?B?N1BsMEExOWp3eUd3TnRlbEh6aVFDQ0l2cTZYdWRDYmdDM1JXdTFRaWk0UWFQ?=
 =?utf-8?B?WTA0S1JjSFVhQ2l6MDBmR0s0aTA1S1QwZ0NUSWZIZFNCU1pOb0c5Vk00WUpZ?=
 =?utf-8?B?QXlpaHpGZUkrNVJxTTlKRHo2OEgrb3dET2h5dG55cjFnU0RtTFFLbUc3MWlF?=
 =?utf-8?B?VFE2Tk1RZjNXOHNZYzJSU003S2RwN2ZkZHhpV0V2NU1hMWd5NFBJWUNGQ2pP?=
 =?utf-8?B?cDExbXRyUHNTQzgvU01lZWlZVkVUT2NZVDZsSUJkejBwMERNekRBWStzaGkz?=
 =?utf-8?B?VFU0QWdSTGFaS2E1SFhEVG8yTXY5L003enNWNTlCbzNYbnlQcnc2S0JUV3Vy?=
 =?utf-8?Q?4R+P06pJV+GA6JCc=3D?=
X-Exchange-RoutingPolicyChecked: XlBltS62dWPWm6BwJa4ybL4gFs4zucXbzpl2aWTFrVm98T4ywcGHjS22qmPSbezkFF4ln5gK99nxDLFTXjC+D7aK2+jVqOUC+wXR4u75tS0qyGwbbd7dmYnIg1nGQejqivGNYT4BWAqeJhPuR+OgwqZolXtE1MCy8A/P3DwUBFeXLcKcfUyRI7ABy+80Bqs2BIQyLRuMyRBr2tHzgZBP2ZUBR6JQ5wbNX4VpotcLmfkgCQ9jsOmudr5O+UweuAruprsto/81jdGWgOlqjlibl2VOj5m8UKbL4QfFbk2NulZDUd/J47Cg5atMQxp+P7j/kGjWYxULsx61T8bWTIABvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee66deda-b286-4c07-6039-08dec64287bc
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:16:58.1840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3fPY14glhvm1Xziu4jsCIKARL7SmxVg3YLrEejogNU6Mw3RjVDbSMbOea4qHtJxgLb3EC8S5vkYCL+/X42mn3sq7OmK/dTB2aQmZ56LBlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7626
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



On 09-06-2026 20:14, Rodrigo Vivi wrote:
> Jobs that GuC never scheduled were silently errored out instead of
> triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> should wedge the device rather than silently fail, and userspace VM bind
> queues should stay permanently banned rather than being reset and retried.
> 
> The queue is banned early in the timeout handler to signal the G2H
> scheduling-done handler so it wakes the disable-scheduling waiter; without
> it the waiter sleeps the full 5s timeout. For not started works the ban is
> cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> after the GT reset — a banned queue would block resubmission and cause an
> infinite TDR loop.
> 
> v2: (Himal) Do it for any queue type, not just kernel/migration
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 41 ++++++++++++++++++++----------
>   1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4b247a3019d2..5c40eee41103 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>   }
>   
> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> +{
> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +}
> +
>   static bool exec_queue_suspended(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			   q->guc->id);
>   
> -		return xe_sched_invalidate_job(job, 2);
> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> +		return true;
>   	}
>   
>   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> @@ -1460,6 +1466,12 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>   			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>   }
>   
> +/* Unstarted jobs (GuC scheduling failure) and kernel queues recover via GT reset */
> +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job)
> +{
> +	return !xe_sched_job_started(job) || (q->flags & EXEC_QUEUE_FLAG_KERNEL);
> +}
> +
>   static enum drm_gpu_sched_stat
>   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   {
> @@ -1608,19 +1620,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			       q->guc->id, q->flags);
>   
> -	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> -	 */
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_gt_reset_async(q->gt);
> -			goto rearm;
> +	if (!wedged) {
> +		if (timeout_needs_gt_reset(q, job)) {
> +			/* Retry after a GT reset; wedge a kernel queue once karma is exhausted */
> +			if (!xe_sched_invalidate_job(job, 2)) {
> +				clear_exec_queue_banned(q);
> +				xe_gt_reset_async(q->gt);
> +				goto rearm;
> +			}
> +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> +				xe_device_declare_wedged(gt_to_xe(q->gt));
> +			}
> +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>   		}

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	}
>   

