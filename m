Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD02EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 13:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F83B10E1F8;
	Mon, 26 Jun 2023 13:01:45 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5139810E1F4
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687784501; x=1719320501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=syWLkrRz6TATVq2vbq0T9DJHm78KVlVS/x+lgry8jwA=;
 b=l+wIwlDnvl32G2twTOk9ZWSkubBUNfpz1us8V6+WZfNocUYSSevDiDM9
 zBUH2mQkS7MYMAOd3wjhLpbiL/aMzhA9o0ozln/wYWjxktcYHLUPoFDOw
 kgtZXXqmzZaZzqU2WXtMv3c0zmWoW3wgrnLe9U7eOjEVoDwFOfnpIZWmI
 +tAZ9XY01wRFXV0rS5IsI4cXSJt98lVRmECx5tCzNPt2qOVKuhSvWvmFA
 jRsAJLLz1moNCvf3DvzHdO+Ml+W2ijK0Xx3diwB7aQDP86qmx5Uxa+8AG
 gdTy4NE4lryUvo2Bm6bCa95dFI1CkJKkmN1xph4nfOUA8xjLD4t2OX1TN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="447645997"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="447645997"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 06:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="666288047"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="666288047"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 26 Jun 2023 06:01:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 06:01:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 06:01:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 06:01:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 06:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrOgjrb9ytVMNb2I7V3SUxky4tmI70ms5+QF7Bre+0tIupNzZiUdDpA7JIkW47gdtzvtG0L0KK3G5YtXb1qC2IlSRtcuSFf0aYwimifXpf5+VLYDDilV3Q9tztwnhFN13nZyXGAnx9/o3UOPMngyZ9jiLx2C3eCEjR278P2TgEp5hYUiWrW8yGM9jrLPLgmYSRHuqRTPUTUGtA14yKHq8m8J62tfAHjok0xy548PgVNxx0uz15s75nCLL0EAroUmOQQsE+fqZu1Ab2Rt2IcYOUar0jjmtDWCDbUDIDoFTiqSag3NZ973cHX1KjKSMf+GV5eaBqlrlb/Au/PRf8LSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK8lMe0i96bUtgWxQDC+XCcMfvhHWB+PDTDlbEfb+BU=;
 b=iqDzbVDVe0wu+cFkL7zO1yUc5biNT9MAGUoXifsYqslBfgoubefEAlelnK+3I1bGnGTbi7+0MGSgUvln6EVleeGR3Ch+x6298wriHifOwpTBSCrJejdsO523DkeVKAQOLTUyD6svXllNC0JhHliYNXjad3wfyICoWQfBJlqtR5peRoL+Boq9DGZ4wavQ+Gw3IaBT5OWOOVXhEG7OmMSLf8SOcuAdGID6NVe49fY/jng0Osups29rv8hdMaeupAuurM2giKg26OPFOtU2GCdJWuFf0/4B0P6s21lDtMBFv8IDxvwYBstruYSv5tjZRYNAUAWHEpffdwtzCSndFRMBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Mon, 26 Jun 2023 13:01:31 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 13:01:31 +0000
Message-ID: <f10c1e0d-5aab-a502-2af7-1f3d1c0e8227@intel.com>
Date: Mon, 26 Jun 2023 18:31:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-3-badal.nilawar@intel.com>
 <1ac21da0-3573-3f01-e56c-55dbd6f36970@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <1ac21da0-3573-3f01-e56c-55dbd6f36970@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::22) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e40597e-1f23-4306-3cdc-08db7645765b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9juwWbs87K42JEX0FbUWzgF691BGsZZmqYRtV99DroXKPLR8Wy0JvJDVquelgBk/YPguntPmGT/YCdUiCWT3DZavuX5LJifsNvDqQx0fWucExhn0BjgO/F+OEJRMIQINK2OGfKaR1gWes1OH+AqAN1X/mA62dPZHhKGtQyQUO/f1TqRyd6cZICELgkkA67yz31fddQvUe6eaEac2msLWTZckUWpda1haluSRM3KTaqAMyKnKZHPfXau7Y/SmcCvPz/wiaOVI4Ud/7NIVqNcKPMVvtbrdavgQ92yoytYMpeEBePuOrVJxE8+NPQzEE7dhSNMkCS7TXS6BiPs7K6osblYogMcDp1zApHDibJGK9U1YrAVR8mFbF9MeExv+s0AwBkTHXhOnSWdIz0PiCDMPY2Lb8lWQ5ftyjTZgQAhzqyMR6AR9KzGkVCxEouWpet9knfkVUVF87sVULWkabsmOx0pI329dHzf8qP3UkkABFD9B2gerTLkx6HBfoGtdiLGxlaRDdYNcELBOKxqxTw9T6cvkuCX6w2Bfowk2R0qx3zR1x4w/VsKJJAji8/5jP4ArHqpslj0m3HXge16+4TKNL5tMyJMwOzPBaB5sta5PaURrK6WrOlldws3f+QigSu2GURFromsU1MiyyMosPUZLC4GkqSt6B07U7wqLxuG3DUl/gn3JJilncugU3Qr3V2T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(107886003)(478600001)(6666004)(6486002)(2616005)(83380400001)(26005)(186003)(6506007)(53546011)(2906002)(30864003)(5660300002)(36756003)(38100700002)(4326008)(66946007)(82960400001)(316002)(31696002)(86362001)(8936002)(8676002)(41300700001)(66556008)(66476007)(31686004)(6512007)(43740500002)(45980500001)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L29XWktvWXZLUmdVRVFkcjZxOFFiNU51UzByMEF1Q0VOeHI2UEhWNGdKTnhL?=
 =?utf-8?B?Q1JxcXlXZ09XWGtmaUYvdWdRZ3pDL0ZjUENSN1daeXV3c2VxdThWb1BYVXFY?=
 =?utf-8?B?NzArVGo2ZkhrYWNkclZIaHNNYmNCNHJIbDdZVkZMK1BncjRNd01OYkltc3Nz?=
 =?utf-8?B?dmJGL01oUVBjM3dBZUxJTFJaR0x0eUpiQkxtTmo5cm9wV1BvWGFjYmNFS2xS?=
 =?utf-8?B?UkZuNFlFR2k0RW9rYVRyL0xid1RHdGxlREJFdy84MThKREpMK3kybUFIbXlr?=
 =?utf-8?B?Snp2QjRGLzVNcDJYcDF0Smt1L2RKaE9GMmpCL2ZRYVR4aklyVE5QTFAwQXVu?=
 =?utf-8?B?eEdpS0krRXZuWWpOaGN6dVNXL1hISHdrYzZXMmhJVUg0TkJwMWJidjBKQ1lp?=
 =?utf-8?B?LzAvZE1IWXVNNHliNEtHbjhPejVUNzI3ajNkTlh3cXdZcnNFN3lUbjdDMk9L?=
 =?utf-8?B?R2JSaHRBNTdTNkw3cXNXdkxHZUxxUVRUalJPNnc5ZktTbWxkbUFZMGkvRnM3?=
 =?utf-8?B?cE9NZ2xIcEFvY1dRL3dLaVVxcFNYRURoWkV0SkJMYndxL2NhV2h3YUFNUGR1?=
 =?utf-8?B?WGVieUNvLzkzOHY1TmJUMHVCRjN5VHJ3byt5L2ZnZkU3WmhPREZyb3hubVdz?=
 =?utf-8?B?SE84cTliS2ZxV1BYRC9sRmNHYlJib2NNRmF6dERyZFc1Ylo0S1IvTWQvYVQx?=
 =?utf-8?B?V0NEeHhlTHIwTHFVQ0t3UFk2bzcwSzd0Q09LMVBkNDBaa2pENnlkZ3U1aUVh?=
 =?utf-8?B?cjd5NG1qa2sybm5IMExFOGt0T0pCejd5ZHgyTmR5ajlLY1JaTEVhRituMkds?=
 =?utf-8?B?RnVrRkhOSjBvMXRTUWZJUVk3QnFEL0VOakI0ci9nVEJNejY0VDMzVlFtKzYx?=
 =?utf-8?B?cHJUamk1M1JjK2pMckh2U2x5TUt0RGk5VU5KbnpBaVJBSm95ckdsYm5ZV21Q?=
 =?utf-8?B?MlM0ZFRybzc1VktlWWJKaWE5eG55WFo4VkNvdjkySlMxaWlscmhiNjRkRUVr?=
 =?utf-8?B?eHowV2ExZk1DR3NUMnJkcTUxczFkdFNiRDRzbWFueGVDckRHVGw0ejBBamhO?=
 =?utf-8?B?OWJyZ1hsa3JQelI5ZXlDM1h1dHpIYlVlOXVPZ1VjYS9aRzlya0RaeHpxYStw?=
 =?utf-8?B?VVc1ZzRKb3RiSHJuamxYV1pEUlcwcHloUXJMa25keCt3S1pJNFJ0Nkt5WHhD?=
 =?utf-8?B?YjFLbFBCK044R0M5ak5FWkpJWnViQzdWSWR0MlVlTGhiMFBlZ3lqMU5tUXNj?=
 =?utf-8?B?MHQ1RTBtZW5EVFB3UlZmd2N6aUROeWNRRm1nKzh1REZGcllwZmd4Nzh6WVR6?=
 =?utf-8?B?VEVNM21yVXdDeGNScWVUZGMrTWVJaE9hdStyeFpyZk45ZGVKdnA0V0NtZk5a?=
 =?utf-8?B?b2Ric0FvdFBOYjc5WGpvam9jK2oxZ1NaMFVPY1lRTHYvcTl5TWZUenkzUjB5?=
 =?utf-8?B?TURzdFBwU0ljV2R5UWtub1llRUlNcGVFbzR2VTR2YlEvNlU2ZGRaOTl5U0tC?=
 =?utf-8?B?eG5Jd09mT29DTTFKN2NtdGQwQ2xTZWY0NS96bDVYcFMzbU5hUTZrT2hYUkFQ?=
 =?utf-8?B?Y3hSb1ByRzZWM21XYk0yc2hQeGVJeWVyd3BFRGN3dXp6dmQ1L0dTbkVqRkkw?=
 =?utf-8?B?L3M4L1JKSnpyUnByeVdYcmhnRWs3UGFsaEcxS000YWlUOUlsVW9tUE8ycWwy?=
 =?utf-8?B?SE9YYWlIQndVMGxuZDlrZEFETUFiU2QyMHFHdmxEQmUzRHgrNW1RajRrSmQ5?=
 =?utf-8?B?eWVTa3h2cU5GYytoVGpHaE5JZy9oQWI5bnRzYTRjU2wwM09JYmpoNjNSMUJJ?=
 =?utf-8?B?dVpEc1ZGa29rTktYWGdHK3psbCtVRi9aYzQ4VHRsWktvWVAveEgwaERkeUhD?=
 =?utf-8?B?a1VrZmJsYi9ySWdOai9hK2xBN3VyaXFVTmpBRHJZcDRLQk83VitSREt4cTZn?=
 =?utf-8?B?b3d4NU5QTC8rWkg0aktYcGVPZlJCM1MzVTQ2L08rY1lHakdFUlhWdkIyOFRu?=
 =?utf-8?B?eUkxNG84cWVPeXhET3RnM0tCMGpxL2dBZWVNbnRkbFdiZEgyQ2VtZ2ZlZ2JV?=
 =?utf-8?B?eWRFS2c3c0FCUGgrdnkrakZRYm1oRlkxTjBmd1hDNlg3em40VWsyQ2l6bWp1?=
 =?utf-8?B?UWwvNW14ZTZsOHFab0dXdGN4UEhwNlBzMnBSSHdQVWZLdkIyS3pjVFRUMGJJ?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e40597e-1f23-4306-3cdc-08db7645765b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 13:01:31.7206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuRqy3HwCRhFRi82G4LxHZZYXlV34nvbp59s9gRZnFpBQuGQwh3V1DE0oISFhPw2oJKwqRHG73udLBNYxyHP8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 2/6] drm/xe/hwmon: Expose power attributes
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 14-06-2023 10:46, Riana Tauro wrote:
> 
> Hi Badal
> 
> On 6/6/2023 6:20 PM, Badal Nilawar wrote:
>> Expose power_max (pl1) and power_rated_max (tdp) attributes
>>
>> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  34 ++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 342 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_hwmon.h                 |   4 +
>>   drivers/gpu/drm/xe/xe_uc.c                    |   6 +
>>   6 files changed, 408 insertions(+), 4 deletions(-)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> new file mode 100644
>> index 000000000000..54a7b668009e
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -0,0 +1,22 @@
>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_max
>> +Date:        June 2023
>> +KernelVersion:    6.3
>> +Contact:    intel-gfx@lists.freedesktop.org
>> +Description:    RW. Card reactive sustained  (PL1/Tau) power limit in 
>> microwatts.
>> +
>> +        The power controller will throttle the operating frequency
>> +        if the power averaged over a window (typically seconds)
>> +        exceeds this limit. A read value of 0 means that the PL1
>> +        power limit is disabled, writing 0 disables the
>> +        limit. Writing values > 0 will enable the power limit.
>> +
>> +        Only supported for particular Intel xe graphics platforms.
>> +
>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>> +Date:        June 2023
>> +KernelVersion:    6.3
>> +Contact:    intel-gfx@lists.freedesktop.org
>> +Description:    RO. Card default power limit (default TDP setting).
>> +
>> +        Only supported for particular Intel xe graphics platforms.
>> +
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0f920175526e..9d888aae907e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -382,4 +382,8 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK        XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK        XE_REG(0x19011c)
>> +#define PVC_GT0_PACKAGE_RAPL_LIMIT        XE_REG(0x281008)
>> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT        XE_REG(0x281068)
>> +#define PVC_GT0_PACKAGE_POWER_SKU        XE_REG(0x281080)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> new file mode 100644
>> index 000000000000..4ad473e69e27
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_MCHBAR_REGS_H__
>> +#define _XE_MCHBAR_REGS_H_
>> +
>> +#include "regs/xe_reg_defs.h"
>> +
>> +/*
>> + * MCHBAR mirror.
>> + *
>> + * This mirrors the MCHBAR MMIO space whose location is determined by
>> + * device 0 function 0's pci config register 0x44 or 0x48 and matches 
>> it in
>> + * every way.
>> + */
>> +
>> +#define MCHBAR_MIRROR_BASE_SNB            0x140000
>> +
>> +#define PCU_CR_PACKAGE_POWER_SKU        XE_REG(MCHBAR_MIRROR_BASE_SNB 
>> + 0x5930)
>> +#define   PKG_PKG_TDP                GENMASK_ULL(14, 0)
>> +
>> +#define PCU_CR_PACKAGE_POWER_SKU_UNIT        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>> +#define   PKG_PWR_UNIT                REG_GENMASK(3, 0)
>> +#define   PKG_MIN_PWR                GENMASK_ULL(30, 16)
>> +#define   PKG_MAX_PWR                GENMASK_ULL(46, 32)
> PKG_MIN_PWR & PKG_MAX_PWR are under PCU_CR_PACKAGE_POWER_SKU
> Should be moved above
Sure
>> +
>> +#define PCU_CR_PACKAGE_RAPL_LIMIT        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>> +#define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>> +#define   PKG_PWR_LIM_1_EN            REG_BIT(15)
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 65e5488dec82..8e248e806559 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -7,42 +7,358 @@
>>   #include <linux/hwmon-sysfs.h>
>>   #include <linux/types.h>
>> +#include "regs/xe_mchbar_regs.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_device.h"
>>   #include "xe_hwmon.h"
>>   #include "xe_mmio.h"
>>   #include "xe_gt.h"
>> +#include "i915_drv.h"
>> +
>> +enum hwm_reg_name {
>> +    pkg_rapl_limit,
>> +    pkg_power_sku,
>> +    pkg_power_sku_unit,
>> +};
>> +
>> +enum hwm_reg_operation {
>> +    reg_read,
>> +    reg_write,
>> +    reg_rmw,
>> +};
>> +
>> +/*
>> + * SF_* - scale factors for particular quantities according to hwmon 
>> spec.
>> + * - voltage  - millivolts
>> + * - power  - microwatts
>> + */
>> +#define SF_VOLTAGE    1000
>> +#define SF_POWER    1000000
>>   struct hwm_drvdata {
>>       struct xe_hwmon *hwmon;
>>       struct device *hwmon_dev;
>> +    struct xe_gt *gt;
>>       char name[12];
>> +    bool reset_in_progress;
>> +    wait_queue_head_t waitq;
>>   };
>>   struct xe_hwmon {
>>       struct hwm_drvdata ddat;
>>       struct mutex hwmon_lock;    /* counter overflow logic and rmw */
>> +    int scl_shift_power;
>>   };
>> +struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name 
>> reg_name)
>> +{
>> +    switch (reg_name) {
>> +    case pkg_rapl_limit:
>> +        if (IS_DG2(gt_to_xe(ddat->gt)))
>> +            return PCU_CR_PACKAGE_RAPL_LIMIT;
>> +        else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
>> +            return PVC_GT0_PACKAGE_RAPL_LIMIT;
>> +        else
>> +            return XE_REG(0);
> returns XE_REG(0) at the end. Can be removed
Sure
>> +        break;
>> +    case pkg_power_sku:
>> +        if (IS_DG2(gt_to_xe(ddat->gt)))
>> +            return PCU_CR_PACKAGE_POWER_SKU;
>> +        else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
>> +            return PVC_GT0_PACKAGE_POWER_SKU;
>> +        else
>> +            return XE_REG(0);
>> +        break;
>> +    case pkg_power_sku_unit:
>> +        if (IS_DG2(gt_to_xe(ddat->gt)))
>> +            return PCU_CR_PACKAGE_POWER_SKU_UNIT;
>> +        else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
>> +            return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>> +        else
>> +            return XE_REG(0);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return XE_REG(0);
>> +}
>> +
>> +int process_hwmon_reg(struct hwm_drvdata *ddat, enum hwm_reg_name 
>> reg_name,
>> +              enum hwm_reg_operation operation, u32 *value,
>> +              u32 clr, u32 set)
>> +{
>> +    struct xe_reg reg;
>> +    int ret = 0;
>> +
>> +    reg = hwm_get_reg(ddat, reg_name);
>> +
>> +    if (!reg.raw)
>> +        return -EOPNOTSUPP;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
>> +    switch (operation) {
>> +    case reg_read:
>> +        *value = xe_mmio_read32(ddat->gt, reg);
>> +        break;
>> +    case reg_write:
>> +        xe_mmio_write32(ddat->gt, reg, *value);
>> +        break;
>> +    case reg_rmw:
>> +        *value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
>> +        break;
>> +    default:
>> +        ret = -EOPNOTSUPP;
>> +    }
>> +
>> +    xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +    return ret;
> Return 0 instead of extra variable
Variable ret is needed to handle default case but this will be taken 
care once I fix place for rpm calls. Actually during suspend resume flow 
I am observing locking issues so to fix it I am planning to add rpm 
calls at higher level in the function instead of adding at reg access 
level. There this will be taken care.
>> +}
>> +
>> +int process_hwmon_reg_read64(struct hwm_drvdata *ddat, enum 
>> hwm_reg_name reg_name, u64 *value)
>> +{
>> +    struct xe_reg reg;
>> +
>> +    reg = hwm_get_reg(ddat, reg_name);
>> +
>> +    if (!reg.raw)
>> +        return -EOPNOTSUPP;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
>> +    *value = xe_mmio_read64(ddat->gt, reg);
>> +
>> +    xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +    return 0;
>> +}
>> +
>> +#define PL1_DISABLE 0
>> +
>> +/*
>> + * HW allows arbitrary PL1 limits to be set but silently clamps these 
>> values to
>> + * "typical but not guaranteed" min/max values in rg.pkg_power_sku. 
>> Follow the
>> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but 
>> display
>> + * clamped values when read. Write/read I1 also follows the same 
>> pattern.
>> + */
> Last line about I1 should be added in the next patch
Sure
>> +static int hwm_power_max_read(struct hwm_drvdata *ddat, long *value)
>> +{
>> +    struct xe_hwmon *hwmon = ddat->hwmon;
>> +    u32 reg_val;
>> +    u64 r, min, max;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
>> +    process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &reg_val, 0, 0);
>> +    /* Check if PL1 limit is disabled */
>> +    if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>> +        *value = PL1_DISABLE;
>> +        xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +        return 0;
>> +    }
>> +
>> +    reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>> +    *value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +    process_hwmon_reg_read64(ddat, pkg_power_sku, &r);
>> +    min = REG_FIELD_GET(PKG_MIN_PWR, r);
>> +    min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>> +    max = REG_FIELD_GET(PKG_MAX_PWR, r);
>> +    max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>> +
>> +    if (min && max)
>> +        *value = clamp_t(u64, *value, min, max);
>> +
>> +    xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +    return 0;
>> +}
>> +
>> +static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
>> +{
>> +    struct xe_hwmon *hwmon = ddat->hwmon;
>> +    DEFINE_WAIT(wait);
>> +    int ret = 0;
>> +    u32 nval;
>> +
>> +    /* Block waiting for GuC reset to complete when needed */
>> +    for (;;) {
>> +        mutex_lock(&hwmon->hwmon_lock);
>> +
>> +        prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
>> +
>> +        if (!hwmon->ddat.reset_in_progress)
>> +            break;
>> +
>> +        if (signal_pending(current)) {
>> +            ret = -EINTR;
>> +            break;
>> +        }
>> +
>> +        mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +        schedule();
>> +    }
>> +    finish_wait(&ddat->waitq, &wait);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
>> +    /* Disable PL1 limit and verify, as limit cannot be disabled on 
>> all platforms */
>> +    if (value == PL1_DISABLE) {
>> +        process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
>> +                  PKG_PWR_LIM_1_EN, 0);
>> +        process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
>> +                  PKG_PWR_LIM_1_EN, 0);
>> +
>> +        if (nval & PKG_PWR_LIM_1_EN)
>> +            ret = -ENODEV;
>> +        goto exit;
>> +    }
>> +
>> +    /* Computation in 64-bits to avoid overflow. Round to nearest. */
>> +    nval = DIV_ROUND_CLOSEST_ULL((u64)value << 
>> hwmon->scl_shift_power, SF_POWER);
>> +    nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
>> +
>> +    process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
>> +              PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
>> +exit:
>> +    xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long 
>> *value)
>> +{
>> +    struct xe_hwmon *hwmon = ddat->hwmon;
>> +    u32 reg_val;
> xe_device_mem_access_get needs to be added?
Actually its added in process_hwmon_reg so didn't add here.
> 
> Thanks
> Riana
>> +
>> +    process_hwmon_reg(ddat, pkg_power_sku, reg_read, &reg_val, 0, 0);
>> +    reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
>> +    *value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct hwmon_channel_info *hwm_info[] = {
>> +    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>>       NULL
>>   };
>> +static umode_t
>> +hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>> +{
>> +    u32 reg_val;
>> +
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        return process_hwmon_reg(ddat, pkg_rapl_limit,
>> +                     reg_read, &reg_val, 0, 0) ? 0 : 0664;
>> +    case hwmon_power_rated_max:
>> +        return process_hwmon_reg(ddat, pkg_power_sku,
>> +                     reg_read, &reg_val, 0, 0) ? 0 : 0444;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int
>> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>> +{
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        return hwm_power_max_read(ddat, val);
>> +    case hwmon_power_rated_max:
>> +        return hwm_power_rated_max_read(ddat, val);
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int
>> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>> +{
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        return hwm_power_max_write(ddat, val);
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
>> +{
>> +    struct xe_hwmon *hwmon = xe->hwmon;
>> +    struct hwm_drvdata *ddat = &hwmon->ddat;
>> +    u32 r;
>> +
>> +    if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
>> +                    reg_read, &r, 0, 0))
>> +        return;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    hwmon->ddat.reset_in_progress = true;
>> +
>> +    process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
>> +              PKG_PWR_LIM_1_EN, 0);
>> +    *old = !!(r & PKG_PWR_LIM_1_EN);
>> +
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +}
>> +
>> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
>> +{
>> +    struct xe_hwmon *hwmon = xe->hwmon;
>> +    struct hwm_drvdata *ddat = &hwmon->ddat;
>> +    u32 r;
>> +
>> +    if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
>> +                    reg_read, &r, 0, 0))
>> +        return;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
>> +              PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
>> +
>> +    hwmon->ddat.reset_in_progress = false;
>> +    wake_up_all(&hwmon->ddat.waitq);
>> +
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +}
>> +
>>   static umode_t
>>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>              u32 attr, int channel)
>>   {
>> +    struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
>> +    int ret;
>> +
>>       switch (type) {
>> +    case hwmon_power:
>> +        ret = hwm_power_is_visible(ddat, attr, channel);
>> +        break;
>>       default:
>> -        return 0;
>> +        ret = 0;
>>       }
>> +
>> +    return ret;
>>   }
>>   static int
>>   hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>        int channel, long *val)
>>   {
>> +    struct hwm_drvdata *ddat = dev_get_drvdata(dev);
>> +
>>       switch (type) {
>> +    case hwmon_power:
>> +        return hwm_power_read(ddat, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -52,7 +368,11 @@ static int
>>   hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>         int channel, long val)
>>   {
>> +    struct hwm_drvdata *ddat = dev_get_drvdata(dev);
>> +
>>       switch (type) {
>> +    case hwmon_power:
>> +        return hwm_power_write(ddat, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -70,8 +390,19 @@ static const struct hwmon_chip_info hwm_chip_info = {
>>   };
>>   static void
>> -hwm_get_preregistration_info(struct xe_device *xe)
>> +hwm_get_preregistration_info(struct hwm_drvdata *ddat)
>>   {
>> +    struct xe_hwmon *hwmon = ddat->hwmon;
>> +    u32 val_sku_unit = 0;
>> +    int ret;
>> +
>> +    ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, 
>> &val_sku_unit, 0, 0);
>> +    /*
>> +     * The contents of register pkg_power_sku_unit do not change,
>> +     * so read it once and store the shift values.
>> +     */
>> +    if (!ret)
>> +        hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, 
>> val_sku_unit);
>>   }
>>   void xe_hwmon_register(struct xe_device *xe)
>> @@ -96,15 +427,18 @@ void xe_hwmon_register(struct xe_device *xe)
>>       ddat->hwmon = hwmon;
>>       snprintf(ddat->name, sizeof(ddat->name), "xe");
>> -    hwm_get_preregistration_info(xe);
>> +    init_waitqueue_head(&ddat->waitq);
>> +
>> +    hwm_get_preregistration_info(ddat);
>>       drm_dbg(&xe->drm, "Register HWMON interface\n");
>> -    /*  hwmon_dev points to device hwmon<i> */
>> +    /* hwmon_dev points to device hwmon<i> */
>>       hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>>                                ddat,
>>                                &hwm_chip_info,
>>                                NULL);
>> +
>>       if (IS_ERR(hwmon_dev)) {
>>           xe->hwmon = NULL;
>>           return;
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h 
>> b/drivers/gpu/drm/xe/xe_hwmon.h
>> index a078eeb0a68b..a5dc693569c5 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.h
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
>> @@ -14,9 +14,13 @@ struct xe_device;
>>   #if IS_REACHABLE(CONFIG_HWMON)
>>   void xe_hwmon_register(struct xe_device *xe);
>>   void xe_hwmon_unregister(struct xe_device *xe);
>> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old);
>> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old);
>>   #else
>>   static inline void xe_hwmon_register(struct xe_device *xe) { };
>>   static inline void xe_hwmon_unregister(struct xe_device *xe) { };
>> +static inline void xe_hwmon_power_max_disable(struct xe_device *xe, 
>> bool *old) { };
>> +static inline void xe_hwmon_power_max_restore(struct xe_device *xe, 
>> bool old) { };
>>   #endif
>>   #endif /* __XE_HWMON_H__ */
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 70eabf567156..9df5a3a85dc3 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_huc.h"
>>   #include "xe_uc_fw.h"
>>   #include "xe_wopcm.h"
>> +#include "xe_hwmon.h"
>>   static struct xe_gt *
>>   uc_to_gt(struct xe_uc *uc)
>> @@ -127,11 +128,15 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>>   int xe_uc_init_hw(struct xe_uc *uc)
>>   {
>>       int ret;
>> +    bool pl1en;
>>       /* GuC submission not enabled, nothing to do */
>>       if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>>           return 0;
>> +    /* Disable a potentially low PL1 power limit to allow freq to be 
>> raised */
>> +    xe_hwmon_power_max_disable(uc_to_xe(uc), &pl1en);
>> +
>>       ret = xe_uc_sanitize_reset(uc);
>>       if (ret)
>>           return ret;
>> @@ -160,6 +165,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>       if (ret)
>>           return ret;
>> +    xe_hwmon_power_max_restore(uc_to_xe(uc), pl1en);
>>       /* We don't fail the driver load if HuC fails to auth, but let's 
>> warn */
>>       ret = xe_huc_auth(&uc->huc);
>>       XE_WARN_ON(ret);
