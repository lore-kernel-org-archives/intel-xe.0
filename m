Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF6BC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 17:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164B510F43E;
	Fri, 18 Sep 2026 17:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPtc62ze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAFD10F44A
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789751740; x=1821287740;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aorFj2pMZnSn3cHD1qUjuT9CvdVBdT/qr2PHslQzAlM=;
 b=VPtc62zeCOzyx+doPe/kJkdXgqDHJb0g7v/yUrz77pUWfO+isXOX5w29
 Wxg7KRZL/1TIyAngOFfX3REAf61NDCn+MkTSAp1I89UbVMQwC3Q3z5EYe
 gGtopTrhW1z9fuSZv3G5t3LHqf8lwUSY2H9OxuGRpT/ab/3y2Replqosn
 JJu06ghzvWvw11ZthBRX2OWTU494hkb/kcCK46l6tWuhMuU6jrpYoI6x9
 9TnyOcfd9wbL+sZY0BkFkP3I19UyCMU8ly/6H5EgvIxmvAcRmuFqQ8+BG
 MuWIWYX7IFiv1OrooPftB2aVrBDxNtnjNwRvZF2b21YkiYCbWg6yE7wsT Q==;
X-CSE-ConnectionGUID: MS3N79VBT0yN9IUEQPJGPA==
X-CSE-MsgGUID: pXpiV2TWRX6ODnHOVpKFMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="781126"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="781126"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 10:15:39 -0700
X-CSE-ConnectionGUID: PkHL5E51Rf6SomqOCTFJVw==
X-CSE-MsgGUID: xRevz8KoTBaM5y4xIhWDew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="297952165"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 10:15:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 10:15:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 10:15:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 10:15:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeN94LLgiw2VCuAwUFIag1tNbji59YSQ38rGIlw8xfIHK7TIPJ3rjTQOX00EyE/+hRSTkFgjmqxoOOp9+Apk0J8blzXp//JoyrN4LpRJqrf7WpfOc41XUc0YpElsRy9ro2TAXcRHbFmL/ECqGYmnCXJyhoR4xvVE7bEOQdf3UWD1SEqyAdG1X3nRL4f6iTrax/EqxnFqfVz6xj50CjuxsPMpEhrM72nsluJ5g/bHH4NPs5Oe1aSn4GlzYJ39s+7bMPFZ6GIbj13goNjVk5iCS8CaP9fOR8KO0hpcBEGsxzAsAQanku2exzgzjW7Wixjfl3PQwBGAEJmVwrzfwUVL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGRwwUSQFrezjTleREftIc5W3eQhN+jZuu2UZquQKwA=;
 b=L3Fuma/J5/LgBdxiIbD9x3Lvp1hqSX5RuLqCSuRQhYjSeIhAEPfhAJUlQGY5DvTTfNkyRYDX+/tJs5Vk+JkCRj1B+Qsy07fiGo8pzCKNG5qKAQEZHMqwgSEYEQpPUSQ5lGfb9ybZuZUY2UPzEZJowVrDQhTxml7Sam0UAH5xZo+vzu8w2yWbtZTZmbdm+HFbNajOZsV1Wx3HMVeQEkcBTcBrm8Vv8AADh3urs0tQuHbu+xD7Hsw++/c3igsYyxPnymLbypDS1Rh9kgYswF4Gs6iSTTB3mY+sMLGQXBpt3nYDq6AocxTVFSc9v/BQ3cbbiDwPw64bsxOOabZdNYHhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 17:15:32 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 17:15:32 +0000
Message-ID: <7aaa165f-e426-4e05-9811-9aa96a48314e@intel.com>
Date: Fri, 18 Sep 2026 22:45:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't wedge shared engine on stale faults from
 torn-down VMs
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
References: <20260911192300.1561972-2-sanjay.kumar.yadav@intel.com>
 <aqRoWdaMm1VH1OW0@gsse-cloud1.jf.intel.com>
 <878c1246-d4fe-466b-a109-8e3f617ac546@intel.com>
Content-Language: en-US
In-Reply-To: <878c1246-d4fe-466b-a109-8e3f617ac546@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c9f74d-8c02-4549-a0cc-08df15a871af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|5023799004|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MG+N1Q8j9M7s6QUd7w9ldfpIEPyUvxzcn/xF4bahTsTCLxvYHxGt/tfjyP1iayREnjt3x2K5ydVCLsG+GtfdKPNGhqgpJwwwEgqgQxnhUQS7p6inLaQPGVFdqqWB1zKu3skQmgN5H73TwtMR4nX7ysQLFT/uMLtwb2HWutC60SRkHfanivJQHaVnA8QgMIqiIUGHloPRLg4Vh0sc81N3wmbjtri4HTbrHQAlruqnK33SS7MLmdVQofHoPICFdRXxTKPmOCYNxfHRI7ErUJ62XMQikaalHObD8opgUbNdLl4ksLEUdHkdSMdJsMafxYoWBKzPvB4eW82VTb44zUvtFwuQb2NLC5l2cj4PjQFd0dgS80b9lVrlKspHhHMQWtWKT2PJDjHMeQd8iLHLiQELymiuRrbpX61NUxZf7k2DyGhjkpplFXVsxHSdC5pqjZE3n5lwaiv8/7XQS3lV7jTpUiHDbRcyYatyHYM+ZXXJlZcQeK8W3yBiGmysw4T3B3rPWcqK6W1aSPyvREKkwzU5aoBRs3G3G+Wyx5IzLg7mYsv5qemr/q6Qbb1U+GsHIPqW9jt/feqyWHr2B2a85UGjQ0hSTKp8izZqfBV3ahYPp2kD/lQYgvxB8ThHvQwnKcsjMjAC6XUtgfuOkLWavqEkqPx2ndn4dnLDGvctuQD0STw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(5023799004)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWtEdHpzZVhJV0V2aFlrcVRVQWpYdFhVYzBYczgxbXdxMTlROVF2cC9DblJv?=
 =?utf-8?B?UHhRandxYTVKY1psZ2FSSFJWRXlIVmZBalgrS0NMVUhDbGhHUzU4NkQrbGhJ?=
 =?utf-8?B?cDRmRUpyTSs3N0paSlVTSFNtU3NsbHJXSE5jVHA0eHFLMnBXd2lWd0srclZQ?=
 =?utf-8?B?ZVNvdmJyaG1uQUhrQXBMWGJQSENCcXAxS2pFb1BQWVJjUDQxS2l2MDk0NU9r?=
 =?utf-8?B?MGNFUFVQaWtLbmxWbEpxUStFZFNmUlhHb1dUeGtwNVBQeFBobXBGT2FPcDdM?=
 =?utf-8?B?L1dXU08yZ1E3SDlKRTI3ZVNycU9xbVFOd1RyU2lpRW14S1N6UWo5ZW9EMzdK?=
 =?utf-8?B?bDNrblp2S1ZVQkh4Y1dYc2kxdzNsUVpLc3cxNnBGclhPYjY0Ynh3YVFzUUQv?=
 =?utf-8?B?SFA5REVPNW5IU0hsbEMwZlhnODRTWVcrSWNIWlRsQXVLc0krRWlZUUZwY2w5?=
 =?utf-8?B?Q1pFN2dqUElGQWpqYlAwYmVMTWNOVi8yTE03UStuVGp3WktybjBZSlZNUFZl?=
 =?utf-8?B?M1RCRU92Z1orZkxWQ3k5cElxa1BwajlBd21uRXpiZkl6WTIrdEVkOU5qRHU3?=
 =?utf-8?B?RU9nck9LTUw5dFJkYlJlZ0RkbEQvbC8rcnpHdVN2MkFkL0hnQ1dIa3dMVTRl?=
 =?utf-8?B?a0dBSWQ0YWtHOW00eWVYK293MGx6RFBmRjQ4MUUyaGU4a3VZeDcrKzRPTFdM?=
 =?utf-8?B?bHZ2WGsxVU9IZHpmRVViTm12a2hnRzQ5bCtuUlRmY0FFajYrZDI1K2pNdUhs?=
 =?utf-8?B?KzhPZ1JlRGtDYjFPVWpvTHZvOHZwZGY5a3NuVDYrZDQ5Mm93Z1gzZDcxR1JI?=
 =?utf-8?B?aWh1S2NRUnJsQTZjRnJkcXh3K2RZbm9ncjF0WENFUWg3VXFmVUN5dEhrcjV5?=
 =?utf-8?B?L29XRlBxbk1uYmhrc2MxQTl1azNUMTdMWlFVU2hWMFZFMDV0K0w0RlZLdVE2?=
 =?utf-8?B?MkQ3K2xtR09aSmRZdzVuL0xrcml4YWx4YXZRSHhZSXZHeVVoSTN3a2ppRTQv?=
 =?utf-8?B?cjZnL0FwRU03QUxmd0NZZDkzSm5HYUh3dTJVZjVoZVgzdmE1SS9QV2pySFFX?=
 =?utf-8?B?OWxVZm9OMHlaR1REQjFmczBwNWo2QiszZ3BwY28vUDR4Yk5XQWwvS0pvRzdI?=
 =?utf-8?B?b0V6UW5Mb2NxYyt5WW02TG1nMmQ4a3ZmZjN6UFZUMHNoM0x0Y0tBanVPZlk4?=
 =?utf-8?B?ZzVkYXFvUmtuTTFZTTU5Q2dmcFg4SDVnUjdRdkVEQUF1L1FxN2JaaGNIdWdr?=
 =?utf-8?B?QUtKYVd2eGowTlhJdEE0ZVQ4M0xqV3E0T2NiV3oxRCtyWm4wZjVVandoWVZQ?=
 =?utf-8?B?K1BOUjBheXkyQWxwK1JTcWxHUVpUc2RrZjNDMXJEelhUcmRXcEd2MklhZ3hX?=
 =?utf-8?B?eGwwYmhKQldEb3V0TC9XckhEcEN2Q2wyRXd3VC9uc1d1MUJsQjF1UEZzYkZv?=
 =?utf-8?B?N2JHUmNVZkZ0R3F1dnltYXpzcTdKWHV4Ui9sOE5ZcVNUOUV0TldoaUZNaktX?=
 =?utf-8?B?K2NYYUMvNnR4My9RQS9VdEJ1V2NuSlZJODBuUUtMUElMZ2ZKU1NOaGJJaHA5?=
 =?utf-8?B?eThlOEh0ZVVxTDRKS29hR3dPVXQ5NHFmYlVYWnFOdWJUTm9QVGl4RklEZzVI?=
 =?utf-8?B?eG03TktNU2hhU0JYQ05JcUxHYVhhVDErL3c0QUdhZTlJUHU4elZtaW8vakJ6?=
 =?utf-8?B?aEt1S25pV0RUejZEbm5tR3R1c1NnYkJyZDBKUXNNUUluaE1IbXo3NjFZTExK?=
 =?utf-8?B?a0ZNNTlWNUFvdGVTQktVK0w2cjZHZ0VUWno4NzAxT0JsY0l6REFsM2pTQkFO?=
 =?utf-8?B?c1NrUXFkK3pKYndUVk01MjV2MFlJdmVsVkV6TTkwN2xjZDkwMS9MS0pvLzVj?=
 =?utf-8?B?clJiS2dId3ZjaE1wZW9IS0hPcTV1SlBnNHdjbUZqam9IKzZNd2k5Nit4ZG1w?=
 =?utf-8?B?TFo4bURabFVUR3JCWUJMRmswZ0luOThTNDVJRzRwVlBmY2xVWGlXRzI5dHpF?=
 =?utf-8?B?aFRvZ1NqdktaWFNVaXlScVg2TmJxaGh6enAxU1l5RXVYKzZMaHl2RzFydHpj?=
 =?utf-8?B?RUx2cmxoZ0VoZlNHOUxaSkQxWEZBcUdUZ0NYd0E2NFl6bTIwY3paZHlLaEl5?=
 =?utf-8?B?d2VEODNjdEp3UmMyakpKNWduS3UvTVBoVnZDd0M5ZndGL2VLRkhKQVJTNWhI?=
 =?utf-8?B?SmhjNG9HdkZYNW5ycG9UREFzRXN4TUt4LzBMUlJHNVd0TDZIVGJ0YlpVeWZm?=
 =?utf-8?B?MFhlWGhTOFprUVBodFlEQWg0QVRFSVdzc0twV3VSbHQ3UndhM3d2RWNDQVND?=
 =?utf-8?B?eGdHanByV1lMTStiMVhWckt5cU02U1EwOFY1b1VsbjRPdFd2Um84UHVpOTlj?=
 =?utf-8?Q?KwmlUqsX4OC3iEN8=3D?=
X-Exchange-RoutingPolicyChecked: npDnmgJE1MKQ+Wma4GTzkP5K567glFozUE1e+yIztYM6pVBlxE7/pmUkpNLG5tCarISmGwmpYKHUnL4OjC3iojnREqkTnYsharGA8yKAdKrLVuxPiB4cWsnCoESTIdRvM98Yd4mkJqCeEQoOXr/eABFfqY4k1asKDyXGgQvLW+TQa0DxPeNlaStC5CwN5kuIZ9IbkaJb1dwD3u4AR1fdF0U2p7X3jQF/QZePurF/+fMmrrtFpiZXQkkq6vfubmpj40pXl+TBZetIEoivSYTS3KZJjctWkuGca0GJf23huWFdyi4ZCK27CI8Goagu4zZPO/n1dXqfyPIucmLnHrXbdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c9f74d-8c02-4549-a0cc-08df15a871af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:15:31.9962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIQ1gBXynvoWrJKDhYibEE2ikUa2ynfJ1aWoDjfMdZg1ewuqJFeA3tQ8s3JrSm38TV6zhgYNAvksyhfCWFWllojLIdDDYtJppmswCZQ43Fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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


On 14-09-2026 16:05, Yadav, Sanjay Kumar wrote:
>
> On 12-09-2026 02:15, Matthew Brost wrote:
>> On Sat, Sep 12, 2026 at 12:53:01AM +0530, Sanjay Yadav wrote:
>>> A recoverable page fault generated by a process's completed migrate/BCS
>>> work can arrive after that process's VM has been closed and its ASID
>>> removed (abnormal exit while GPU work was in flight).
>>> xe_pagefault_service() returned an error for such faults, which is
>>> reported to the GuC/HW as an unsuccessful response. Repeated
>>> unsuccessful responses eventually escalate to an engine memory CAT
>>> error. Because the migrate/BCS engine is shared, that CAT error
>>> wedges it for unrelated processes, which then hang on their own
>>> copies.
>> Yikes. Do you have a reproducer for this? I wouldn't expect this
>> behavior from the hardware, as it appears to violate the expected
>> process isolation contract.
> Yes, there is a reproducer, "l0-abnormal-exit-repro", in GSD-13290 on 
> BMG. I have also attached the dmesg logs
> in the GSD from the drm-tip kernel, as well as from the older 7.0 
> kernel, where the issue was originally reported.
>>> Detect stale faults whose owning VM is closed or whose ASID no longer
>>> maps to a fault-capable VM, and drain them instead of replying
>>> unsuccessful.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Fixes, CC stable if this is an issue.
> sure
>>
>>> Assisted-by: GitHub Copilot:claude-opus-4.8
>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pagefault.c | 22 +++++++++++++++++++---
>>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c 
>>> b/drivers/gpu/drm/xe/xe_pagefault.c
>>> index c82b8bc8bc70..2827652ab8a3 100644
>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>> @@ -238,8 +238,10 @@ static struct xe_vm 
>>> *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>>>       vm = xa_load(&xe->usm.asid_to_vm, asid);
>>>       if (vm && xe_vm_in_fault_mode(vm))
>>>           xe_vm_get(vm);
>>> -    else
>>> +    else if (vm)
>>>           vm = ERR_PTR(-EINVAL);
>>> +    else
>>> +        vm = ERR_PTR(-ENOENT);
>>>       up_read(&xe->usm.lock);
>>>         return vm;
>>> @@ -260,13 +262,27 @@ static int xe_pagefault_service(struct 
>>> xe_pagefault *pf)
>>>           return -EFAULT;
>>>         vm = xe_pagefault_asid_to_vm(xe, asid);
>>> -    if (IS_ERR(vm))
>>> +    if (IS_ERR(vm)) {
>>> +        if (PTR_ERR(vm) == -ENOENT) {
>>> +            drm_info(&xe->drm,
>>> +                 "xe_pf_debug: drain stale fault (no VM) asid=%u 
>>> addr=0x%llx\n",
>>> +                 asid, pf->consumer.page_addr);
>>> +            xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
>>> +            xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
>>> +            return 0;
>> Won't the page walker hotspin on faults until the executing queue is
>> descheduled from the hardware if we successfully acknowledge them? That
>> doesn't seem ideal.
>>
>> Matt
> agree with your point
> also with this patch[with_patch-752845-fix_run.txt attached in GSD] 
> from a 1.5h run (3,373 torn-down contexts)
> 95% of ASIDs re-faulted exactly once before being descheduled, 0 CAT 
> errors, 0 hangs.
> So the existing async teardown already deschedules the context within 
> a fault cycle or two.
>
> can I move it to teardown wait for the ASIDs queues to deregister and 
> drain its pending faults
> in xe_vm_close_and_put() before erasing the ASID, but that a larger 
> change. Happy to change either way.
> -Sanjay


Gentle ping

>>> +        }
>>>           return PTR_ERR(vm);
>>> +    }
>>>         down_read(&vm->lock);
>>>         if (xe_vm_is_closed(vm)) {
>>> -        err = -ENOENT;
>>> +        drm_info(&xe->drm,
>>> +             "xe_pf_debug: drain stale fault (closed VM) asid=%u 
>>> addr=0x%llx\n",
>>> +             asid, pf->consumer.page_addr);
>>> +        xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
>>> +        xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
>>> +        err = 0;
>>>           goto unlock_vm;
>>>       }
>>>   --
>>> 2.52.0
>>>
