Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C36CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 00:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962D010E029;
	Tue, 12 Sep 2023 00:34:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403B210E029
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 00:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694478844; x=1726014844;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=m+oQxelb7ztnOqEpo1kEgmNNP3yJt5WJoN71hJErGRo=;
 b=fKRY/9Qq/lqBmGkJlR2x9OKqPo3UhmpYhzDc7exwRqWf2yUlhU29/PAS
 Jew1/EKeE1Fr7XotGHzERyLudsmjouUc/ioEcf0X3TXLABDtv4RBUyBpo
 GNx7/XuSboaq3hamH3qltODNfcqdy4zPvw+rQQgFm9GHYVnrIwiG7CRur
 1aVnEJ3A4G7igMROdlrgl5YW7149aHcGm2JgsaIgPtzE1wgXUyqeBweAl
 pdPwvtqJIzM7YG+aosw6Darm61uc0cro4sgi+W9VhE1AKVP66/6urguWl
 GczHJLPlQ1q462VI6/aJLVk8P3aLt2hmccHWw3ko+RqwZvYHi3J1WQv9V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442256019"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="442256019"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772790372"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="772790372"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 17:34:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:34:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:34:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 17:34:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 17:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odQAfhfEVGth0TOESTYJZIG2XqO3ikyPMHng0XlQHZSKmk4SWsjL1td/IC1/3sir/770FYlihGmnCc+JfA/0okcHrEwbJV+uE9QqPQtvsk7VxxTrVdpzkAMszaz8tQIWqLdCXqte3sQEKMYLRB8TTS+3U0mwPs8MjOyqidnq82mnAs/O5ysaus1TKo9ogJoqc3Q9dC2v0NPprHdoKTtxd09nH04jQm25pocTMKRVq+p5s/emK89UeJ9Tys3Gfm/x527Vk3VkwsfKCV3ENdGeHlDOxMTiE/2NKKTntZMHP/qshoEdrXea94G4DyLK1H8OKGoO9giVPHU5vpDYGKqBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ELII35eiO3YQVCBtE+Lvx6wmQIWJwyr3mMyvvY6wX8=;
 b=n7pHf9qqmrjAShMv7B2O8nHAoFYcqeqPgS9I/p/nHx+P+VdkPrYDI0h+b1w+PANp732muVQNwgLrdtpxw7eOXIqkuZthcOidYp/9WCTKKhGHVL4cU7aoL0lsFXr42HyAARmiXNKk0vgy7DeMXkgKgdSl6RqVnJxaBjyG5PeweozOQL29+ZUMSd4VGGZZqNdJEJhABj/t5uA2ITY22G3QkJ9OVZTmgOBiLpY8wHCXMoQsgqB0LyIWwR3jRzsVmfIH2hDDPav/iMhvHNL7bB0oudl6xIT1tnTWC2E3fvPwKTmsIxYbCVhBQFRL7sDuOECVX/Kk8SALvWl1XaJeploKWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 00:33:58 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:33:58 +0000
Message-ID: <fc846ac7-e3c8-1d92-1318-927232980799@intel.com>
Date: Mon, 11 Sep 2023 17:33:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
 <ba6018b2-ba65-99be-ab77-2b1b2b663fca@intel.com>
 <54ec3096-452c-4eba-982a-b36fc8e7d7c6@intel.com>
 <e7fab04f-6391-4899-55b6-4f0c4a3c6b53@intel.com>
In-Reply-To: <e7fab04f-6391-4899-55b6-4f0c4a3c6b53@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0150.namprd04.prod.outlook.com
 (2603:10b6:303:84::35) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: abd422fb-5aca-453d-187d-08dbb327f429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u27To/LXwhK+O8hoF3gGAHv0m1R0qUjFODTFMAk3JasrHVCraiU7/ZIUoZU4+hB7iI6fAU2bVO0oKPS4LPV7AB4xxKFXc7jtT6hiZSSd/Bwucm9yDOwtbQBqRS8/yLqTKwpbEHOQDBp++O4imhCCENa6rkXxhs8d4C+HkgIrQOPW7dZsxImnAnx7d14nhA1Abpr7sNw5H0hEDb0DygFI6yKOFPp/yOddKDdejb/nIFYC8fGgJKu0pMypGT+s+LI0QJcj87AFH8W7jRDx/6eKESePL2VpdBRCnjM3GJHRCjcE6GMoM9bHeWJ+ggg9DTnMvqdaqwQfYyvOXMmrvSAig2L+NQzxyjIGcrytiWeHK3+EgiBlFzxLTF+zhSeBH37GQpeUEQDfbjvEBq3LeQxDeNNuSmSTY0cjxT+Ki8CNWD4lxHwQ6rfayXkKockDwrJQb7iBRI7O1FqpSOIj/5CTTu0pLZE8//zMwKMun/KB1N1E+7yP+JfK19OMUUJ8X7alVIQDy6KY4cjUCVNXYKWuwiVeRmVbO8K0r4NGTgdV4FcthEhYtWEe/3DVJMw1CUZ/K4HFHZkikptGakdErRbvr/I7Dp8jGpRkQtwtdDrB+qkgJdk4Kr9rNjN0ahOq5w7Qx2M8uMcTzCv+SonnpuHplA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199024)(186009)(1800799009)(2906002)(66476007)(66946007)(316002)(82960400001)(66556008)(38100700002)(5660300002)(41300700001)(36756003)(8676002)(86362001)(31696002)(8936002)(6512007)(6506007)(31686004)(53546011)(6666004)(26005)(2616005)(6486002)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWFmUnN5dnV0VG9VQlpSajJIUzM0RVdqclkxMmV1eG93THN5Zjh4NUllWU1Q?=
 =?utf-8?B?enZZdTVTTGRIYjVXNXVxcGJrbzBqZzVhdVBENWU3RzNSWnJoNFJWNUE1OFlt?=
 =?utf-8?B?bFVsQU9wM0MraTBBRms3Um5pWUM5d0Vuc3g4U043cGQ4VnlnZG1YaHE4MFRD?=
 =?utf-8?B?WG16RWpVWEY5K3E4a0Z4bDl0Uy9YWDFkam9qM1M3cnhhUUUyZUljZlk2SW9q?=
 =?utf-8?B?cEEvWHBsdlcvUzl4cnFjWlJCZGlKVG90RGYzcUFjSjJDbVZmUHBXY2xPaEV0?=
 =?utf-8?B?NmUwMDVoYlE5WVA5SmdXVmFRWVFzbnR2NFpXQ2VLdklYNXZaSjRsREFEb2xn?=
 =?utf-8?B?WXdHTW84dzlvRmxQT3Q2dHFHZ2JKZ1FVSkFHOU0vQjFLWUhBVVFIVHo5V0NK?=
 =?utf-8?B?WGZWZ0drUGV5RzdyMzI3RnRpT0RKYmtWSW1lcGVQMC9ZU0huV3pXaGpxek1o?=
 =?utf-8?B?dWVzSEhEakhpOGVERFJQS0VialB5UDB1d3BNNG5PV0Z6TGRXMEZFalg3VHZM?=
 =?utf-8?B?Uk4wVlQwdmFPSm4rbmJtWU9Ma29NWXVEVGk1MjhYZGZaVWpxUUZjbXJDVTZz?=
 =?utf-8?B?Qkl4WWNKSGhpQXI1M2pKTTlKdjk1d2lORnh6RWwvdkNQaUQ1bWxXY2VBc1U5?=
 =?utf-8?B?cWNvRUJmUVRPSkVmUENmN0wwZTB4MkU5cVd3Q0h3dVpVMXVEcVVOZmxFellp?=
 =?utf-8?B?S1ZQZUpVU25sb0VWVFllVCtBQ041MDM3WGpQK0l4eElxdjI1dGd2QU8rOWxR?=
 =?utf-8?B?TS9lTFgwTndQeU5xYkplK2Jta2c1Mlp1b2ZDVUt6eFFVQjYrczdROFp4ck9B?=
 =?utf-8?B?NVR0cWxMK2hDU25saUNwbnZUcEMreDdtK09wbVA0OXRyWG1CSy92QWZ6ejZ5?=
 =?utf-8?B?ZTFFVmxYWnpQcWt2SjB1MGRkWHE3L3B5RTlYNDQ5bFBad25mZXpTWEJQWUw5?=
 =?utf-8?B?N1l1SzJmS0dsVjFWTWJRcjV0QXhaRmg1cFJpMGNuYVdmUjJId1FzMmpCNy9E?=
 =?utf-8?B?QWZmalVMS0lQVThsclgrOHVMVVBHVjlHcy9EM05jbS9ONCt0SDBDSS9iTEtN?=
 =?utf-8?B?YkJaVVVJVE9DRlhybDJndjJZNEp4Q1ppZlJUcTc0L0RzRDI4V2FYU1JJN1Rq?=
 =?utf-8?B?MzFqV3ZCZ0k1U3JFUkZvZVBYWVZTbU5NeUUzMDZvRUhiWVZyZzdxcHIwVjdq?=
 =?utf-8?B?RmZyVE43SnVzaTc4STNDWVpIWVZUTit3L0ZqbWcvN3JKOHQ3bjNTVC9ZMTVu?=
 =?utf-8?B?T0dIN1BZR0RSbWlwWllMRFQ3Z0NKQk1BMVZmZEpUODA0UnRFRCtaLzF4QnA2?=
 =?utf-8?B?djYrNXFnVzdMclRVYzQ5S0Q0UXNEVlZYRldjclRrMzMrVytzSFVhWXhubEtF?=
 =?utf-8?B?c2tyZGQ3Q1grRGNTQmxDRjFHaU5CTWcrdXZWQzU4VzhncXhhdzNKU1JkRDMy?=
 =?utf-8?B?citJaTZiT1lzaFRlU0dZUVZ4Yk4wSitYVE9MYzQwRGhMeDFLYWVlVkNRT0Js?=
 =?utf-8?B?V3dWV0gxb1JVQmxoeis3NFlFd2pxZjBmUUhUMGNLMTE4ZGk0ZndDZVBPc2gx?=
 =?utf-8?B?Uy9yYUEwRkwrK0VacUlIaGZKZDBrN0RVWWM2RTRKcGFDa1NYUzJjY2RlRENs?=
 =?utf-8?B?S2R6YU93VVdxVkJ0cm81aE9PR0F2Vy80aHVsbThCell0T1NKRVRzaDdWb2pz?=
 =?utf-8?B?SlR0TTFzRG5yYldwTi9CbncwTXJnN01sMGN5UUM5cmVmaEEzVnlXNHc1cUVU?=
 =?utf-8?B?UmRXa25VYWVlVFRiWitpRTBGVi9sajBNTHJnS0xjWllXMlBOcmxWQ0lEYVJ1?=
 =?utf-8?B?RWpqUVRvd1ZiYVFSUERkMnQxdDhNb3N0b3pLZ3Z5Mm4xdDg1ZDRhUTFlb0Z3?=
 =?utf-8?B?OFc2K1cwQXFFUUxDaW9YbUNXUDVrVFR4VU84N2RYZVZmOHFjK05YRGIwT1d2?=
 =?utf-8?B?bWNsVDBwaG80R0djZjRjUGdtMHdHUHYrcEZNa1hnUjFUTnN3Wnd3a2E2UG8z?=
 =?utf-8?B?OFNqemF6THlabmlEeTFqSWhPMHBKOFhibFpPZE4zZ2FULzJaeDgxclpDeEVS?=
 =?utf-8?B?Tnc5S2ppZ016blF2NUNxaDkwSjlDT0k0QVhNOGIwa2R6ZkdxL1pFNWNoMXFI?=
 =?utf-8?B?bXdVMnVsQWVjY0RDdnlmTE12Y2p2MXk5clFDT2lhOTUrc3F1U244VzZSaFhQ?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abd422fb-5aca-453d-187d-08dbb327f429
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:33:58.5595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VEN7VjCh8T3ichT6MJRHr8AkyawMl+K9oQ+YPirmqPm3PQv58g3kCdWhe+I63USza3IJ59rwwPb6D7qTwN9/G8/D0wvQFtuK9t+00Jgv8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uc: Fix uC status tracking
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

On 9/11/2023 17:12, John Harrison wrote:
> On 9/11/2023 17:03, Daniele Ceraolo Spurio wrote:
>> On 9/11/2023 4:54 PM, John Harrison wrote:
>>> On 8/2/2023 14:26, Daniele Ceraolo Spurio wrote:
>>>> The current uC status tracking has a few issues:
>>>>
>>>> 1) the HuC is moved to "disabled" instead of "not supported"
>>>>
>>>> 2) the status is left uninitialized instead of "disabled" when the
>>>>     modparam is used to disable support
>>>>
>>>> 3) due to #1, a number of checks are done against "disabled" 
>>>> instead of
>>>>     the appropriate status.
>>>>
>>>> Address all of those by making sure to follow the appropriate state
>>>> transition and checking against the required state.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_guc.c   |  3 +++
>>>>   drivers/gpu/drm/xe/xe_huc.c   | 15 +++++++--------
>>>>   drivers/gpu/drm/xe/xe_uc.c    | 10 +++++++---
>>>>   drivers/gpu/drm/xe/xe_uc_fw.c | 14 ++++++++------
>>>>   drivers/gpu/drm/xe/xe_wopcm.c |  3 +--
>>>>   5 files changed, 26 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 2493c5859948..7cef5dcf571e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -228,6 +228,9 @@ int xe_guc_init(struct xe_guc *guc)
>>>>       if (ret)
>>>>           goto out;
>>>>   +    if (!xe_uc_fw_is_enabled(&guc->fw))
>>>> +        return 0;
>>>> +
>>>>       ret = xe_guc_log_init(&guc->log);
>>>>       if (ret)
>>>>           goto out;
>>>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>>>> index 177cda14864e..35e2fdd07f69 100644
>>>> --- a/drivers/gpu/drm/xe/xe_huc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_huc.c
>>>> @@ -42,22 +42,21 @@ int xe_huc_init(struct xe_huc *huc)
>>>>       if (ret)
>>>>           goto out;
>>>>   +    if (!xe_uc_fw_is_enabled(&huc->fw))
>>>> +        return 0;
>>>> +
>>>>       xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>>>>         return 0;
>>>>     out:
>>>> -    if (xe_uc_fw_is_disabled(&huc->fw)) {
>>>> -        drm_info(&xe->drm, "HuC disabled\n");
>>>> -        return 0;
>>>> -    }
>>>>       drm_err(&xe->drm, "HuC init failed with %d", ret);
>>>>       return ret;
>>>>   }
>>>>     int xe_huc_upload(struct xe_huc *huc)
>>>>   {
>>>> -    if (xe_uc_fw_is_disabled(&huc->fw))
>>>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>>>           return 0;
>>>>       return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
>>>>   }
>>>> @@ -69,7 +68,7 @@ int xe_huc_auth(struct xe_huc *huc)
>>>>       struct xe_guc *guc = huc_to_guc(huc);
>>>>       int ret;
>>>>   -    if (xe_uc_fw_is_disabled(&huc->fw))
>>>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>>>           return 0;
>>>>         XE_WARN_ON(xe_uc_fw_is_running(&huc->fw));
>>>> @@ -106,7 +105,7 @@ int xe_huc_auth(struct xe_huc *huc)
>>>>     void xe_huc_sanitize(struct xe_huc *huc)
>>>>   {
>>>> -    if (xe_uc_fw_is_disabled(&huc->fw))
>>>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>>>           return;
>>>>       xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>>>>   }
>>>> @@ -118,7 +117,7 @@ void xe_huc_print_info(struct xe_huc *huc, 
>>>> struct drm_printer *p)
>>>>         xe_uc_fw_print(&huc->fw, p);
>>>>   -    if (xe_uc_fw_is_disabled(&huc->fw))
>>>> +    if (!xe_uc_fw_is_enabled(&huc->fw))
>>>>           return;
>>>>         err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>> index addd6f2681b9..368e4feb57db 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>> @@ -31,9 +31,10 @@ int xe_uc_init(struct xe_uc *uc)
>>>>   {
>>>>       int ret;
>>>>   -    /* GuC submission not enabled, nothing to do */
>>>> -    if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>>>> -        return 0;
>>>> +    /*
>>>> +     * We call the GuC/HuC init functions even if GuC submission 
>>>> is off to
>>>> +     * correctly move our tracking of the FW state to "disabled".
>>>> +     */
>>>>         ret = xe_guc_init(&uc->guc);
>>>>       if (ret)
>>>> @@ -43,6 +44,9 @@ int xe_uc_init(struct xe_uc *uc)
>>>>       if (ret)
>>>>           goto err;
>>>>   +    if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>>>> +        return 0;
>>>> +
>>>>       ret = xe_wopcm_init(&uc->wopcm);
>>>>       if (ret)
>>>>           goto err;
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> index 2e70dd4880f6..fd53ef9e5c99 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> @@ -339,17 +339,19 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>>       XE_WARN_ON(uc_fw->path);
>>>>         uc_fw_auto_select(xe, uc_fw);
>>>> -    xe_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
>>>> +    xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>>>>                      XE_UC_FIRMWARE_SELECTED :
>>>> -                   XE_UC_FIRMWARE_DISABLED :
>>>>                      XE_UC_FIRMWARE_NOT_SUPPORTED);
>>>>   -    /* Transform no huc in the list into firmware disabled */
>>>> -    if (uc_fw->type == XE_UC_FW_TYPE_HUC && 
>>>> !xe_uc_fw_is_supported(uc_fw)) {
>>>> +    if (!xe_uc_fw_is_supported(uc_fw))
>>>> +        return 0;
>>>> +
>>>> +    if (!xe_device_guc_submission_enabled(xe)) {
>>> This is generic code for all firmware types. So why specifically 
>>> check for GuC submission? Can't we still load the HuC even with GuC 
>>> submission disabled?
>>
>> This is an unfortunately named function that is not actually GuC (or 
>> even submission) specific, but it is actually used to track usage of 
>> all FWs and related features (see e.g. xe_uc_init). I agree that it 
>> could be renamed, but that's out of scope for this patch.
> I would argue that correct naming of functions is a critical 
> requirement. Otherwise it makes it impossible to understand what the 
> code is doing! Either when developing or when reviewing patches.
>
> John.

PS: Agreed that such renaming is not part of this patch. So with a 
suitable bug logged to track it (or a patch posted)...
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>
>> Note that there is no way in Xe to load HuC without GuC submission, 
>> nor there is a plan to add it AFAIK, and even this existing switch is 
>> only there to turn off the FWs for debug.
>>
>> Daniele
>>
>>>
>>> John.
>>>
>>>> xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>>> -        err = -ENOPKG;
>>>> -        return err;
>>>> +        drm_dbg(&xe->drm, "%s disabled", 
>>>> xe_uc_fw_type_repr(uc_fw->type));
>>>> +        return 0;
>>>>       }
>>>> +
>>>>       err = request_firmware(&fw, uc_fw->path, dev);
>>>>       if (err)
>>>>           goto fail;
>>>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c 
>>>> b/drivers/gpu/drm/xe/xe_wopcm.c
>>>> index 9a85bcc18830..bf85d4fa56cc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_wopcm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>>>> @@ -139,8 +139,7 @@ static int __wopcm_init_regs(struct xe_device 
>>>> *xe, struct xe_gt *gt,
>>>>   {
>>>>       u32 base = wopcm->guc.base;
>>>>       u32 size = wopcm->guc.size;
>>>> -    u32 huc_agent = xe_uc_fw_is_disabled(&gt->uc.huc.fw) ? 0 :
>>>> -        HUC_LOADING_AGENT_GUC;
>>>> +    u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? 
>>>> HUC_LOADING_AGENT_GUC : 0;
>>>>       u32 mask;
>>>>       int err;
>>>
>>
>

