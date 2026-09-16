Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69179C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CE110EAD5;
	Wed, 16 Sep 2026 13:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMHWBdi0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A770910EAD1;
 Wed, 16 Sep 2026 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789565079; x=1821101079;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X4qDSSQgeLXccRap1DoH+RWvZ7dRMDrwdCrdjQ+ka9g=;
 b=GMHWBdi0lE85tuabC11//22Ibr5QIQINYhGL0mqZt98cfTf2pusdCQ+2
 5O71B3a734EaGmqaTQOUGMM35N/G2Y9PS4s0W5SJwPzsovg9Gsexa4tzJ
 zfqk2Vvu3zTps48YnhYElS4qj2D6HG2P4U1ps9WSycx9t67WU0EO6mBij
 fAiWR4i5Sm8M5ld08Qi9psfFnd+j8wDAnkD5yvrhFVUec/zS18pmJQoMo
 MvRs8IjnEbxwqkhvKQ0+yv3n1KSc/bRqyzpT5QOvZlkw/QFMWmgAXUTps
 crA9zeBZynxA5lJVcEwJObL7P4D4/rdyYU0YKWBJ3enYe98SSGBJqI9a9 w==;
X-CSE-ConnectionGUID: UymsL4h6T9WQaNNiGk9BoA==
X-CSE-MsgGUID: 51UBWtclQCm7rz1X57JbJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="449345"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="449345"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:24:39 -0700
X-CSE-ConnectionGUID: ytLOHahjTq6gp0VQqOSWTA==
X-CSE-MsgGUID: F7rNrDSRRVWt33ikOMcq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298408369"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:24:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:24:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:24:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFCsvrperz1ffJnBvJqgbyw8KWdxTAcLMvoNSURP7Qy7TtxqwpoZB155VzM/xZL3Rmn58OdqDJU9YG/fkfdJVgoHNP+kCmoqjCvHTbgBjhFZUqHK/V8iteH6mPM6l6mJxXtwSieLlhSeMtpUHaGoFXj1Dho1GWsU74QdjVFdrz77MO8EUnQt4A+9r20Fgtql70ht2yIcpwjnO2BGUEwSyXH8RH5PqD18XfIx8zsLJ8g+gDBNV5ypGNs5grONRHzhFx7SX8cv+Rl0nVqbm4bm9G+2UuoZxk2ReKzHQou5Cg8B042TMs6H3psgqr3lD3WQd6AYbcU8TC5HY0YT0TVr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2m2h+W7iYTcOpo85cQV5oMdqLUHwMo7HvWmSilYpiA=;
 b=QCdgEyaIXSc5IGoAQ2LGJZvGOorZDJgJqkSsNKux/3LdjbkXcYWDbDzCoFz2mFnaYxEp3yK6fLgrS4BEy20SFbkkczkzmBkX+DWdby5O70owH9OkuMW5Z/ubZotJwzHd4Dj5ApYVP9F8yCTztWwLrVzFGorhk1PIc146Y06nkCPcaVC14aHgkbcRvKaoti+39mwWY+8PPUPNhdAeE60p1uKVcJQa6OrqyO8wS57c+a9WcZextl9vmrEYVgP6zNhe5o4srTnOJaFUeS1squAn5M52VuxgsWOTBON+SnxcJknvvQgZQ+8+zEQNxGPoqqjxA0gWFuOIbNy4QhTngDw3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:24:33 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:24:33 +0000
Message-ID: <743b357c-f240-4a89-947a-bf7fa4cb571a@intel.com>
Date: Wed, 16 Sep 2026 18:54:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] drm/i915: Introduce enum intel_commit_type
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-11-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-11-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0152.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: d6988e65-08ca-411a-8241-08df13f5d892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 8eZu3yB/EAqH1vMzz/rZRZuVb17QPRB+pHoQktLcvRL70AkfPGxg7k3rUMwyOIfhzWIUByA75O9RI/1jEZxNDyVgbTK/k8qe8jMA5IYaR//nKOnFtBAEc0J/iV7inrkEN/AGM7bu3aPFTtpDB87DhHjaeM/N7YKu1ofnoPBTZqY7dYpi18Z6QHHEzMg+r+Fsr6NMQagr+PCtIwUyAc/FvACA1K7hmH9y8CedF7YjCAsJBl8aqCW1NcGOctJW00xjI5vbfqVOi/8hKz91L8TtzGzvu9kbvSZPNEObzNd11DMRmelKhEVwkdAoCvBNWI4S6ccUpZUiUoen+on2aCIsYXsS5dgbCnIvQW9kvxu1wjXvpE6PEFouwo/4hxcBLp9qpYDxO6hsxF70AFzgOeV/iSkw5ohOEskX5vA/w1L1C9mgwM6+jwChANMUkvATc0UHPXpHiDSG6AN+p+k5y46486ffylHiX0wRoHrUy2zF9Ya0mhFdcPMcYLtXPOx/cu/aysfgcDdiFox0ZogmCBJ6TDWKQCHxyrp2hHoGxpquzBxMmZmiew6VdN25hKrG+w6fqo3y4KOBgDHnjh31bGTrxdgtVQXFhD9kBRr8InFyOZZjEVoA4feswShdv4TzJsPSfXObzsuVqxBnRrACyyluBBaYZOH1cOtL9ejScaSBhXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE4ySVdyKzVQYTcvajdmRS9rZmR3YU5nQVY5NTNUbXdjSW5TL3dUa0NSaU5w?=
 =?utf-8?B?dU5QQUUvZ2JDQ3Z6QTVBRFFqdVNTcVJLcHpzMnRkRGZlbE0wWUVHQXFncDU3?=
 =?utf-8?B?ZCtJNStqTENnZm82Zk85Qi9LeVdsTWxnYnVHS1VPakJpM3lzQzIwV1VLY01H?=
 =?utf-8?B?eVlYdW5YWEhmamxRbVlmZzRCZ1FqeHJYeFJ1RnZkdWdLWVk5VTBVVFhINEFo?=
 =?utf-8?B?cWVWbHFpMy80bVFqTERacTJWc1ppL0R4QmV1ZlloMFhaZ01FV2svOGl4Uk8v?=
 =?utf-8?B?RnJ2T3VERTY4V0pvNkhKYWNxdVJJcFIybXRZdFNoQkMrK0NWdVhmRDlaY0Ni?=
 =?utf-8?B?NTM5WUtwSUFIZ2MyVGxpRXZNUDNuRDJiSjhrd1pwaktPQk1IczkrSTdaWEVj?=
 =?utf-8?B?YmN0NXJSdTZUR0xUMDlwK0FSQ1pNRUVxWkY2U1pNdnVFWVFXTCtmV01KdEh4?=
 =?utf-8?B?Z3VkZHJOSDh4RzkyTWFQM2lmY3VTZklNL0pUME5aU2hzYTJVR1NIS05XMklV?=
 =?utf-8?B?RFFscllUZmpNS2tYNm5JOVROVnVSSTVPNlBqL254MUtEdlBlc2Qzb0YzR0sy?=
 =?utf-8?B?STBYVCs3dmdKY1pobW9BT0NmV25QdlhxQnJ4L09VUEJ0bDRnSWM0YU85R3h6?=
 =?utf-8?B?emZ0bUpDeHRuOGNIemVtN1JmbjUzVXJNaHEvZUJLcmQxUUE1SHlRN1g4YTRt?=
 =?utf-8?B?OUpjTW4vbUxWeFp2VVQ0cml6TjhUbGxZL1BVL2RmTTl2NlhyVTRtVzEyaUwr?=
 =?utf-8?B?Umg4ekFZVHMzNThiQi9MQktGWDhLWFc3TktiU2hWR3NwRUt2MXp1WFJEaVRh?=
 =?utf-8?B?TG10Y2dMUjlvZ252RENITldIN01DZDFkV2NpVWREelNjYmZnaDQza2I2ZWNk?=
 =?utf-8?B?YU9sRC9BVktHbGllYXprTHF2TjhHdFZFbVVuVXcraFpHVFpyTTAzQURVd2tF?=
 =?utf-8?B?YlFOWCtGcTc2eVgrUHFBNk1RREIvcmpQbitXWW1xKzZ1ZjRBR0RGMndzWlBL?=
 =?utf-8?B?ajkxYXY5end3VjlUbFBsTU9TRE5WMHdMN0lCOTd5dGZHZFNweEhyNmF0c3N4?=
 =?utf-8?B?NFVjWFUwUTdkL3p1MXBqR3JDUHhNWlJocGhKNElXa3ZnUEc5Q0RkNFkvYUZS?=
 =?utf-8?B?Skl2T0doZHlIL1RMS3I1VDk2OE1jdzgvK3ZWeUo1K0ZnN1J4OTdZY1EwMXVF?=
 =?utf-8?B?bzN1dC8vZ1VOVXFxTXMwSnIyck9LNjhZTkJYalJzdzlJOThGS3hsZGU5V3No?=
 =?utf-8?B?UXZrcC9qMC9QMWhNb1pGWEU2QVEwQm5VOGZqMnhKWGQwdTRGR0V1aU5BZ2JF?=
 =?utf-8?B?a2JwUFRHNVdWK1AzakVBVzRvTzJmL2lyTjk4TStpL29FTEpzV2pCS0xtRnJj?=
 =?utf-8?B?eHB5bmg0YUJhdHY0aytXM055NSt2Z21DU0w0a0ZHazZ5cTV0Q3FrcWFzTXhS?=
 =?utf-8?B?aUhXeU9xZFFneEI0QWtUeDA3TFJiUFI0eUcrMjh2c3NjVmtWcHJsa3Q1ejNw?=
 =?utf-8?B?emI3Skx3cmhXQmFMMWZIcGtsNmlhMzN3aGtyOEc4VmlucHQ4Und2ajMrTVFY?=
 =?utf-8?B?aFJrQWxRSkQ3dmpXbHlBaGc0Q3l6QWl2Umh1UFBLTmJKVUNSeU5YUFRvMTls?=
 =?utf-8?B?K3g5SEFhaWlzaVo3dVh2eXo3Z2I2RHNCeGFLZTR4cTRONUN0elFoNFZrUXM3?=
 =?utf-8?B?WGxXUWVleUdLQkh6Q2tjcEtpQis1YUpXMUg3WVNFY0UydXlsc3hZMldadmQv?=
 =?utf-8?B?VWlKRytlWVh2dTlydThHQWtIaktXaGhYV29YaFVURXM4UU95V2l5RGdBcHcy?=
 =?utf-8?B?K2R0QnJrMzFwYmFiUWNrN1BDbEgwTFgvUmQyOVM5aXZUVys5R1V0cVZsRHJw?=
 =?utf-8?B?WXBPN0F5RmRGUkF1SGtsYzNHdlA2ZFp4bkI1Zzg4eUV5VGRDRFZxMzhNcGlJ?=
 =?utf-8?B?bWExTUIwV2V3dy9UZ3p5cjNSeUNGeUJVZkpsZEtjZnY5Tkh2Z2xXanBKeFNn?=
 =?utf-8?B?UlA3bkN6a2ZjaVBlVGd2MTQrSDVxVDJoclpTMXRacHJockdvOHNqbGVtUnBn?=
 =?utf-8?B?T1MwUVlQbEJHK3VZeHlhdTRrWU5LaWRPS1g3VnBma1lZeE9KSisxWGJaWDF0?=
 =?utf-8?B?OVZrOFFMb1VPWm8xd25WUkhtejFpaTdCQjlPRlpiRWlCM3JQbENJNENrbnBT?=
 =?utf-8?B?YkM1YXhaT1VFNFZMQVNyM0xWbkFzbWJlQ0FnTGNqZGVDZjB0ZS8rSE9tOGVk?=
 =?utf-8?B?NFVKMWtWdG9xZExlRWJYakw4NFUrV0NnR0xQaTBFVWFYNGUxWC81NmxWRDZq?=
 =?utf-8?B?NGtFMC9VSDhjcFNqZzdQMmZEQ2FhRjBlV1FmRjd2azVTOVlZK2wxaFUxNm4v?=
 =?utf-8?Q?/zOM3hrMSatcgSGg=3D?=
X-Exchange-RoutingPolicyChecked: kGHHlYFLI03SANkqJgJp8G8LlG5FPZtjCTpC+r8WJOemqe4qfXO7FbaPCLY2s65XpFxCTN9hPlOhXIIUQ9V+48/RZtnJ2TLJAa7WGVW0s5PYq5czPTLWZfdzQ8ISAwQOt+KFSN9BkwymiuuNDm9rZCwE1PvvCrvpii+uJi3FnF2dGQv3CPXStHDY34z7uax6G9ECqu2BkiUC9B6WMZIfI8lGH+zWxWterLzCyDmwtNS3K0bdiP19YelEf+qpNeYtl5KeKT6rRtvHpgzB6OFyUdxqxwJ5Z3yv7wAJrG888wKmT0Ax/4Kl7h7RkUPVeTQ2W8wLCxOc1fkYMiG9wqpvRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6988e65-08ca-411a-8241-08df13f5d892
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:24:33.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cczFZL8yBbfJipFkIu2L57500NDyG36bVuK0WHe0K69mG6ZQ7yn915n2VaikjZLS6m5s3GEq/59ASBG9wmQFuLOSdeBHNm5A5ZhDAQ7qKKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Currently we use two booleans (use_dsb and use_flipq)
> to track how we are going to perform the actual commit.
> That is rarher awkward, and potentially fragile as the

typo: rather

> 'use_dsb && use_flipq' combination isn't even legal.
> Switch over to an enum instead.
> 
> v2: Rebase due to intel_crtc_needs_vblank_work() keeping
>      the use_dsb check
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_atomic.c   |   3 +-
>   drivers/gpu/drm/i915/display/intel_color.c    |   6 +-
>   drivers/gpu/drm/i915/display/intel_crtc.c     |   7 +-
>   drivers/gpu/drm/i915/display/intel_display.c  | 101 ++++++++++--------
>   .../drm/i915/display/intel_display_types.h    |   8 +-
>   5 files changed, 72 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index b66c2d4ba2b3..b042c3cc78e1 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -275,8 +275,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>   	crtc_state->update_planes = 0;
>   	crtc_state->dsb_color = NULL;
>   	crtc_state->dsb_commit = NULL;
> -	crtc_state->use_dsb = false;
> -	crtc_state->use_flipq = false;
> +	crtc_state->commit_type = INTEL_COMMIT_MMIO;
>   
>   	return &crtc_state->uapi;
>   }
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 26e92221fa19..aa2f2b22312a 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -2029,14 +2029,14 @@ void intel_color_prepare_commit(struct intel_atomic_state *state,
>   		crtc_state->dsb_color = intel_dsb_prepare(state, crtc, INTEL_DSB_1, 1024);
>   
>   	if (!intel_color_uses_dsb(crtc_state)) {
> -		crtc_state->use_flipq = false;
> -		crtc_state->use_dsb = false;
> +		crtc_state->commit_type = INTEL_COMMIT_MMIO;
>   		return;
>   	}
>   
>   	display->color.funcs->load_luts(crtc_state);
>   
> -	if (crtc_state->use_dsb && intel_color_uses_chained_dsb(crtc_state)) {
> +	if (crtc_state->commit_type == INTEL_COMMIT_DSB &&
> +	    intel_color_uses_chained_dsb(crtc_state)) {
>   		intel_vrr_send_push(crtc_state->dsb_color, crtc_state);
>   		intel_dsb_wait_for_delayed_vblank(state, crtc_state->dsb_color);
>   		intel_vrr_check_push_sent(crtc_state->dsb_color, crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 0de24d221e48..829ff2a2c025 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -499,8 +499,7 @@ static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_sta
>   		!crtc_state->preload_luts &&
>   		!intel_crtc_needs_modeset(crtc_state) &&
>   		!intel_color_uses_dsb(crtc_state) &&
> -		!crtc_state->use_flipq &&
> -		!crtc_state->use_dsb;
> +		crtc_state->commit_type == INTEL_COMMIT_MMIO;
>   }
>   
>   static void intel_crtc_vblank_work(struct kthread_work *base)
> @@ -598,7 +597,7 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
>   	struct intel_vblank_evade_ctx evade;
>   	int scanline;
>   
> -	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
> +	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
>   
>   	intel_psr_lock(new_crtc_state);
>   
> @@ -737,7 +736,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
>   	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
>   	ktime_t end_vbl_time = ktime_get();
>   
> -	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
> +	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
>   
>   	if (new_crtc_state->do_async_flip)
>   		goto out;
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index d7bd1b862aa9..9a24eb16025a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6798,7 +6798,7 @@ static void commit_pipe_pre_planes(struct intel_atomic_state *state,
>   		intel_atomic_get_new_crtc_state(state, crtc);
>   	bool modeset = intel_crtc_needs_modeset(new_crtc_state);
>   
> -	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
> +	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
>   
>   	/*
>   	 * During modesets pipe configuration was programmed as the
> @@ -6828,7 +6828,7 @@ static void commit_pipe_post_planes(struct intel_atomic_state *state,
>   		intel_atomic_get_new_crtc_state(state, crtc);
>   	bool modeset = intel_crtc_needs_modeset(new_crtc_state);
>   
> -	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
> +	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
>   
>   	/*
>   	 * Disable the scaler(s) after the plane(s) so that we don't
> @@ -6917,13 +6917,13 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
>   
>   	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
>   
> -	if (!modeset &&
> -	    intel_crtc_needs_color_update(new_crtc_state) &&
> -	    !new_crtc_state->use_dsb && !new_crtc_state->use_flipq)
> -		intel_color_commit_noarm(NULL, new_crtc_state);
> +	if (new_crtc_state->commit_type == INTEL_COMMIT_MMIO) {
> +		if (!modeset &&
> +		    intel_crtc_needs_color_update(new_crtc_state))
> +			intel_color_commit_noarm(NULL, new_crtc_state);
>   
> -	if (!new_crtc_state->use_dsb && !new_crtc_state->use_flipq)
>   		intel_crtc_planes_update_noarm(NULL, state, crtc);
> +	}
>   }
>   
>   static void intel_update_crtc(struct intel_atomic_state *state,
> @@ -6934,18 +6934,23 @@ static void intel_update_crtc(struct intel_atomic_state *state,
>   	struct intel_crtc_state *new_crtc_state =
>   		intel_atomic_get_new_crtc_state(state, crtc);
>   
> -	if (new_crtc_state->use_flipq) {
> +	switch (new_crtc_state->commit_type) {
> +	case INTEL_COMMIT_FLIPQ:
>   		intel_flipq_enable(new_crtc_state);
>   
>   		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->flipq_event);
>   
>   		intel_flipq_add(crtc, INTEL_FLIPQ_PLANE_1, 0, INTEL_DSB_0,
>   				new_crtc_state->dsb_commit);
> -	} else if (new_crtc_state->use_dsb) {
> +		break;
> +
> +	case INTEL_COMMIT_DSB:
>   		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->dsb_event);
>   
>   		intel_dsb_commit(new_crtc_state->dsb_commit);
> -	} else {
> +		break;
> +
> +	case INTEL_COMMIT_MMIO:
>   		/* Perform vblank evasion around commit operation */
>   		intel_pipe_update_start(state, crtc);
>   
> @@ -6959,6 +6964,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
>   		commit_pipe_post_planes(state, crtc);
>   
>   		intel_pipe_update_end(state, crtc);
> +		break;
>   	}
>   
>   	/*
> @@ -7368,36 +7374,47 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
>   	}
>   }
>   
> -static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
> -				     struct intel_crtc *crtc)
> +static enum intel_commit_type
> +intel_atomic_commit_type(struct intel_atomic_state *state,
> +			 struct intel_crtc *crtc)
>   {
>   	struct intel_display *display = to_intel_display(state);
>   	struct intel_crtc_state *new_crtc_state =
>   		intel_atomic_get_new_crtc_state(state, crtc);
>   
>   	if (!new_crtc_state->hw.active)
> -		return;
> +		return INTEL_COMMIT_MMIO;
>   
>   	if (state->base.legacy_cursor_update)
> -		return;
> +		return INTEL_COMMIT_MMIO;
>   
>   	/* FIXME deal with everything */
> -	new_crtc_state->use_flipq =
> -		intel_flipq_supported(display) &&
> -		!new_crtc_state->do_async_flip &&
> -		!new_crtc_state->vrr.enable &&
> -		!new_crtc_state->has_psr &&
> -		!intel_crtc_needs_modeset(new_crtc_state) &&
> -		!intel_crtc_needs_fastset(new_crtc_state) &&
> -		!intel_crtc_needs_color_update(new_crtc_state);
> -
> -	new_crtc_state->use_dsb =
> -		intel_dsb_supported(display) &&
> -		!new_crtc_state->use_flipq &&
> -		!new_crtc_state->do_async_flip &&
> -		(DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr) &&
> -		!intel_crtc_needs_modeset(new_crtc_state) &&
> -		!intel_crtc_needs_fastset(new_crtc_state);
> +	if (intel_flipq_supported(display) &&
> +	    !new_crtc_state->do_async_flip &&
> +	    !new_crtc_state->vrr.enable &&
> +	    !new_crtc_state->has_psr &&
> +	    !intel_crtc_needs_modeset(new_crtc_state) &&
> +	    !intel_crtc_needs_fastset(new_crtc_state) &&
> +	    !intel_crtc_needs_color_update(new_crtc_state))
> +		return INTEL_COMMIT_FLIPQ;
> +
> +	if (intel_dsb_supported(display) &&
> +	    !new_crtc_state->do_async_flip &&
> +	    (DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr) &&
> +	    !intel_crtc_needs_modeset(new_crtc_state) &&
> +	    !intel_crtc_needs_fastset(new_crtc_state))
> +		return INTEL_COMMIT_DSB;
> +
> +	return INTEL_COMMIT_MMIO;
> +}
> +
> +static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
> +				     struct intel_crtc *crtc)
> +{
> +	struct intel_crtc_state *new_crtc_state =
> +		intel_atomic_get_new_crtc_state(state, crtc);
> +
> +	new_crtc_state->commit_type = intel_atomic_commit_type(state, crtc);
>   
>   	intel_color_prepare_commit(state, crtc);
>   }
> @@ -7406,7 +7423,7 @@ static unsigned int
>   commit_dsb_max_cmds(const struct intel_crtc_state *crtc_state)
>   {
>   	/* just enough to start the chained DSB */
> -	if (!crtc_state->use_dsb && !crtc_state->use_flipq)
> +	if (crtc_state->commit_type == INTEL_COMMIT_MMIO)
>   		return 16;
>   
>   	/*
> @@ -7429,23 +7446,21 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
>   	struct intel_crtc_state *new_crtc_state =
>   		intel_atomic_get_new_crtc_state(state, crtc);
>   
> -	if (!new_crtc_state->use_flipq &&
> -	    !new_crtc_state->use_dsb &&
> +	if (new_crtc_state->commit_type == INTEL_COMMIT_MMIO &&
>   	    !new_crtc_state->dsb_color)
>   		return;
>   
>   	new_crtc_state->dsb_commit = intel_dsb_prepare(state, crtc, INTEL_DSB_0,
>   						       commit_dsb_max_cmds(new_crtc_state));
>   	if (!new_crtc_state->dsb_commit) {
> -		new_crtc_state->use_flipq = false;
> -		new_crtc_state->use_dsb = false;
> +		new_crtc_state->commit_type = INTEL_COMMIT_MMIO;
>   		intel_color_cleanup_commit(new_crtc_state);
>   		return;
>   	}
>   
> -	if (new_crtc_state->use_flipq || new_crtc_state->use_dsb) {
> +	if (new_crtc_state->commit_type != INTEL_COMMIT_MMIO) {
>   		/* Wa_18034343758 */
> -		if (new_crtc_state->use_flipq)
> +		if (new_crtc_state->commit_type == INTEL_COMMIT_FLIPQ)
>   			intel_flipq_wait_dmc_halt(new_crtc_state->dsb_commit, crtc);
>   
>   		if (new_crtc_state->vrr.dc_balance.enable) {
> @@ -7477,7 +7492,7 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
>   		intel_psr_trigger_frame_change_event(new_crtc_state->dsb_commit,
>   						     state, crtc);
>   
> -		if (new_crtc_state->use_dsb)
> +		if (new_crtc_state->commit_type == INTEL_COMMIT_DSB)
>   			intel_dsb_vblank_evade(state, new_crtc_state->dsb_commit);
>   
>   		if (intel_crtc_needs_color_update(new_crtc_state))
> @@ -7495,7 +7510,7 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
>   					   new_crtc_state);
>   
>   		/* Wa_18034343758 */
> -		if (new_crtc_state->use_flipq)
> +		if (new_crtc_state->commit_type == INTEL_COMMIT_FLIPQ)
>   			intel_flipq_unhalt_dmc(new_crtc_state->dsb_commit, crtc);
>   	}
>   
> @@ -7506,7 +7521,8 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
>   		intel_dsb_gosub(new_crtc_state->dsb_commit,
>   				new_crtc_state->dsb_color);
>   
> -	if (new_crtc_state->use_dsb && !intel_color_uses_chained_dsb(new_crtc_state)) {
> +	if (new_crtc_state->commit_type == INTEL_COMMIT_DSB &&
> +	    !intel_color_uses_chained_dsb(new_crtc_state)) {
>   		/*
>   		 * Dsb wait vblank may or may not skip. Let's remove it for PSR
>   		 * trans push case to ensure we are not waiting two vblanks
> @@ -7695,10 +7711,11 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>   
>   		intel_atomic_dsb_wait_commit(new_crtc_state);
>   
> -		if (!state->base.legacy_cursor_update && !new_crtc_state->use_dsb)
> +		if (!state->base.legacy_cursor_update &&
> +		    new_crtc_state->commit_type == INTEL_COMMIT_MMIO)
>   			intel_vrr_check_push_sent(NULL, new_crtc_state);
>   
> -		if (new_crtc_state->use_flipq)
> +		if (new_crtc_state->commit_type == INTEL_COMMIT_FLIPQ)
>   			intel_flipq_disable(new_crtc_state);
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 9016be52c7ea..11d68c951a3a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1389,8 +1389,12 @@ struct intel_crtc_state {
>   
>   	/* For DSB based pipe updates */
>   	struct intel_dsb *dsb_color, *dsb_commit;
> -	bool use_dsb;
> -	bool use_flipq;
> +
> +	enum intel_commit_type {
> +		INTEL_COMMIT_MMIO,
> +		INTEL_COMMIT_DSB,
> +		INTEL_COMMIT_FLIPQ,
> +	} commit_type;

Not sure if this belongs exactly here but not a blocker.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


>   
>   	u32 psr2_man_track_ctl;
>   

