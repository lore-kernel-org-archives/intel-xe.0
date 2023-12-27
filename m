Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37BAC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 13:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3629310E107;
	Wed, 27 Dec 2023 13:00:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6898910E243
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 13:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703682005; x=1735218005;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1IX1gFzsXx2PKcKF/ogu8k4vB7eKk8ROu4DoxPQD+A4=;
 b=n9NrjW5nTZI3NVY/ALJAW7Ir6rDxMqleE+gBQHhy7y2Lt2KfcaR2qPc3
 RpQDVyee8J7xd9kf8HbzL0IDBJdqm/M+zDBVp5E4JxBAePcfT7v2Al4sc
 5RZh2ti4KlnK/j+ZUI/p3Ok9l77L5SPTngHmH5X0dYGTOQoTXqIcZpvaC
 OYp90LM7GRhc0IM91HUIrRC7om3NQvaqzXjS8PzbJk/roYq0fox5dIyK8
 kgvnYiRmRKZBQe9iOE28W4BLUfDL8bwtWnSuNS3Ab3wfXiA7gd+4FSJfH
 JanAgb1MT36AeylqcQSHAlCTbIz6gvpbT5tQsoaajMD3qKTdyw1xt2lA9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="375936953"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="375936953"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 05:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="1025390094"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="1025390094"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 05:00:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 05:00:03 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 05:00:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 05:00:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7aDY5/z/C9ddqZ/V0wr3vNvWMR6pLB5dcOHCFDC2MjYTQy2xkyNbRFNccWsIKyVR0fIgc2CsS2renpWgvlV8TShjcKYTnaOjBKBpPxItvpbbQJ8Qh0auLaGH65Yg3eYBEMZajdUrpcKupiqkCBdeHR5EQSTXRBKSUHj+xk9qd/aD3ujEID4kiQQkvmuUkPJLPqhYW5JTq6MiaPco7ii0EyRV1pki2ExiWSkbWi8XL0unEE5MfRD6Mft0zzoJfBSLqRMEQ6+7dDO/xOqJZ9xQtKTTdIs6TPdau5jrp2ULE8y3GNPfMJMJFqNhwaI+UQf1sYlUUZ9zMxz+gzsbcT40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ROX6v1KNZREuoXGUvLgab/hYJYKmtiCjPakb+xdc9U=;
 b=DwQaiMLLavPusNaKWRnb5z9gwKfr/t8D1Z+eLBhNNnCPXLLimMr2IDMO8o9feFyHceZviczZPuAoTb4LSuFLJn9kjieLYhz4/zRfl7/xbmVRH3lZfIiRH7PTYw/IuF3tbvlgqenFG2oY96XjfiDvmLVmy/jgNsLn6rNCPt21iyBvA37Igtes0JmiREQEpnUEGrOuulDTDC6I/WmnoR4blmx/3SPehwXxharUOzOF4D8bP1PlkwCDMAMuXzwmQyN4KhKYu5TFJiS5P4oyZBO1K+JTrg/hydcGZMEj7hDBzhRiYS4z3BSTuqx9k/WoRk4whipItGtdHwsjesxefZ4u1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 BL1PR11MB5526.namprd11.prod.outlook.com (2603:10b6:208:31d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.19; Wed, 27 Dec
 2023 12:59:48 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::1ed2:770e:2fbb:de41]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::1ed2:770e:2fbb:de41%5]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 12:59:47 +0000
Message-ID: <fbd23755-eb5c-4591-979c-6ec3ebaa2b8a@intel.com>
Date: Wed, 27 Dec 2023 18:29:39 +0530
User-Agent: Mozilla Thunderbird
From: "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231227083204.3982491-1-karthik.poosa@intel.com>
 <CY5PR11MB6211A31CBBD708FFEDBDCF06959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <CY5PR11MB6211A31CBBD708FFEDBDCF06959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::15) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|BL1PR11MB5526:EE_
X-MS-Office365-Filtering-Correlation-Id: a6fa0bd8-2acd-4f85-e3d6-08dc06dbb434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4nS+sZ2uOI7++ZZ6AF6zeR4qleBXNmlrdmRG6Ni92tNCjYG06UlwNAbiC90uHieNR6bSNYs/5bSPlvZZJoYdzyl9caoyt+xtFNg1EK0KqSOaR2FJ9cHWvzXH8WpZeMU08PHRMQ+n7Ibj39KRRPJw7b0o/giWFMEj5L2uHjnaFqr7BVlholMbOIdq+yNWYAC0FCjpamNotaEJCz4pfyZpf0LCjlhyXEBdeayVvtVGwmgvJKVBDtgOrk2JBhegugMAvhbCAMpNgO96McwUQbMT1LRJALBQMGVrYbpfx5atmbcs8rmZd/hhtbpADve5dDvXdAEEYNDzj/5NA1Aoan0pJMTOsnTCn3lu80yxzTNQhB+NCVvhbijmFgl7+jTvYFEiI0n68dIj0DC6xsPW7N08DL9cEaDuqQdmVuKH6xbi8sivYpRnaWb6M00+ZftAXS7TCEtOtIn2c0EU2uGaceJZmMKdx1HfPU3gOmvfKTEYtuway7WNSb79MUIrwIpioZOHKpKeleffDlI9HssD9Q3N9O3fDdIKFUAvFDyW5+ej2wGfkHGHPZwpuKjcJ1zTVGWttSCfxHrNTAY5gmxaA9LWaNYqUBhpoWB9BrpQ2xuhN6dx/kxc+pzNxL9O5eyJjUGx9G2KepDAuPFs8YB3x9I8ON0/1ukaLFuixoqcpE00b3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(26005)(83380400001)(38100700002)(66556008)(54906003)(110136005)(66476007)(66946007)(316002)(8676002)(8936002)(5660300002)(2906002)(4326008)(6512007)(6506007)(53546011)(107886003)(2616005)(41300700001)(6486002)(6666004)(478600001)(82960400001)(31686004)(86362001)(36756003)(31696002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkJYSDFWSlR2YlhVR1h1YnVvWGxUMHIxOEhJVlhMMFJhdnlMdW90aWxRVnE1?=
 =?utf-8?B?MFB6UUw4OXFLcURZdGlCZWQ4OThwVlNhcys1V2JEdWVHajdUcEFmUEJDRUZ4?=
 =?utf-8?B?Wm01ZXdhcy9nck1IdjZlVHVIbkwxQzI1S2RBeTVnSmhTLzIxb1ExQ3dEU0kx?=
 =?utf-8?B?eExSSkFpTGZpajBhZ3QvdGRXN1laM056MmJRYStZMmZMRkpUZDdxaXk0ak85?=
 =?utf-8?B?NHIvRlhFWGRJTjVJR24vVFhZSU1MK3ZxM1hPbTRvOTVJUmFPbzdhT3g3b2pN?=
 =?utf-8?B?Q0xydGZZTzd5ZzJGcnNWcUQ2SEtzaGhvMWtnSE56aG9WK1lyNzRwSEFtTUN3?=
 =?utf-8?B?OWtOQTZTUmV3NFlTYUNIcjArQjJ0a2ZXYVVMVWU3ZXJVUzN2WC95V2tPaHcw?=
 =?utf-8?B?YTcxRit2dTdMQWZKOVZUNVExUis0SnNwTWhaQkgwYXY3bjJjcllySFhNdEV5?=
 =?utf-8?B?T0RlMnRmWVpZcjNhWm1NbWlXNHdFL2krbUxVZCt3RHpRa0VESEg5WmhSbzU2?=
 =?utf-8?B?VVM3N3Uzbm5KNTdYVmZLa0lYcStJVFh5RUoyRHhUVGdmWENhUFJwV3RlUDh5?=
 =?utf-8?B?SmtuL3FZdFc1eUk0RXY1NE84YkpNQXJvYUt6UW1qMEUzNk1ta05LUExOdFhK?=
 =?utf-8?B?d1g1NVFIdlN0cDBVZVJwdXJwRmRkTGdUaGp1NWd1aVc2Y0xKejNTeU9McGdX?=
 =?utf-8?B?UFdUcmp1VVVPSGFQUVRUTWZGZFdKbk4weExVVnBRamhzRERRRHk0ZHcrelBv?=
 =?utf-8?B?b0tiQmgvLzlSUkM5b2lwcGhNa3NUTXFXRTlhaFZTOGRSZS9JWkUzbklsSnpF?=
 =?utf-8?B?dThaemdYTHBXbGM1bkhiMXNJNm53NW9EbnZTV0V3OE9KMFdUc1UyeGtIV3NC?=
 =?utf-8?B?UmJTM0tBTFhNV21DU09jakhqUXVoNUJXWUExWkR6U2ZCa1M3TlVSV0hVaVJB?=
 =?utf-8?B?bHJpWXpqOExReVlDak1qeE9wVGdOdnpoUlFCMEcwVkNCTUsxdTI5bmRCZUll?=
 =?utf-8?B?Mk9VcUprU2xXRTJPNEdrM21JTjZtSm1ONzltOVBWZ3hrZTB4QktaNkJYbTBG?=
 =?utf-8?B?eUQxQkNyMHkxcG1DWk1aUi8xZEJxcjByWGdsVStiWEZLaDJXZUJFaVdUeGhZ?=
 =?utf-8?B?MHBvY2w5N25VZ1dnR2JzY1drUUlEWlI4Z1VIR1pyMG1VUUhlekwwMHZLU29V?=
 =?utf-8?B?cWZhSjZyWXZBWktNc2JHOU1JZWRTRGl6bTVla3FLcmYwM0w3dlVRWlVuUndF?=
 =?utf-8?B?WVYyWUJYMm1kWHVzaHlYTERNWmM3Qk9ubUdtWVhQRDhrV3pWVTYrUlN4RzE2?=
 =?utf-8?B?MVkrdDJZMXJBNS8yZ1dSYVArOXZKbDd3Ymp0RytpRnBJKzl0UXZ0alQ4enFl?=
 =?utf-8?B?elhSekFzOVQzcTFOZi9SeDQ3MUE1VDlNZ05GaXMxVEVheEgvRFVtVENpQ2ZX?=
 =?utf-8?B?NkVvL0FaNDVDb0pGckRFNlNBUkJlWWhweWFVU1dyR0RvN0NyL2VkWE84ODlt?=
 =?utf-8?B?WTFHL3R0d1pydkRzWkxNL0hMMWx3YWtweXNmYVJCT29ZMHN5a2VkWmp2SGQ4?=
 =?utf-8?B?NFdQeG9QMFY1QjgvWU1FR1RYTmYwSEFtR01zUks1akwxSEJUTzdYUzFmZ3Zp?=
 =?utf-8?B?UTJtQUNUQldLRjRITEozcjNKM21OVG5EazU0ei9mTnZib1BSQWdWYmhvVC95?=
 =?utf-8?B?aDVjb1RZczFpOHRQRlZXakdDS1YwL2hXSWJQYXJhNlVjNVhBUElHeVgxTjZE?=
 =?utf-8?B?ZHRNdVYyREp5Y1FudjBwVnl4R2FuWTFuNTltS2FiK1B6TE5XWEtSVi9CTlQr?=
 =?utf-8?B?eGIvNk9TSzFnd1QrWVo1elRHa3ZWWTFWNFZiYnNwa282ck1nUW5DdmpJTFQr?=
 =?utf-8?B?SnBDN2lFcnA2eGZUWnVtaTcrMHB4Um82VG43MDBlMnhGL01ONWdSbVNtbDhF?=
 =?utf-8?B?T3RxZytySDJJTG9paUkzemFVSE52TUV4Rm1OYmQwaHhPWWpSU0FRZE13aktZ?=
 =?utf-8?B?V0FmeHlkU2ZPbXUxWTVUUmgxUUdtVGJxRldpUmYvQ3BpRjI4d3BNSlNLVlkw?=
 =?utf-8?B?UEVZOHRzK1ZLdWNkT3h3NFZZOTFuZ0Rpd0lpL3pMd1hieTM2TFlraW10S0p2?=
 =?utf-8?Q?eCc7Pee8LZh4g0goN49MJazX5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fa0bd8-2acd-4f85-e3d6-08dc06dbb434
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 12:59:47.6338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaMH9TOvJKJqlOLAqOJWH/Odn/+7plgVvMXZsa/37cD6CKN5qbmu+NdT6j7jZlA7NlkcjkIXjcSO/wLoZ3PtKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5526
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Anshuman,

1. Can't force_reset be synchronous ?

2. regarding adding wait in get freq APIs,

there is already a flag 'pc->freq_ready' in xe_guc_pc_get_xxx_freq APIs, 
which returns -EAGAIN if reset in progress, instead of waiting, which is 
causing the test failures.

On 27-12-2023 16:06, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Poosa, Karthik <karthik.poosa@intel.com>
>> Sent: Wednesday, December 27, 2023 2:02 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa, Karthik
>> <karthik.poosa@intel.com>
>> Subject: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
>>
>> Wait for gt reset to complete before returning from force_reset sysfs call.
>> Without this igt test freq_reset_multiple fails sporadically in case xe_guc_pc is
>> not started.
>>
>> v2:
>> - Changed wait for completion to interruptible (Anshuman).
>> - Moved timeout to xe_gt.h (Anshuman).
>> - Created a debugfs for updating timeout (Rodrigo).
>>
>> Testcase: igt@xe_guc_pc@freq_reset_multiple
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c         |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
>>   3 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>> 3af2adec1295..47abb9336c58 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>>
>>   	gt->tile = tile;
>>   	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>> +	init_completion(&gt->reset_done);
>>
>>   	return gt;
>>   }
>> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	XE_WARN_ON(err);
>>
>> +	complete(&gt->reset_done);
>>   	xe_gt_info(gt, "reset done\n");
>>
>>   	return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index c4b67cf09f8f..fbda886c8a95 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -58,8 +58,16 @@ static int hw_engines(struct seq_file *m, void *data)
>> static int force_reset(struct seq_file *m, void *data)  {
>>   	struct xe_gt *gt = node_to_gt(m->private);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	long ret;
>>
>>   	xe_gt_reset_async(gt);
>> +	ret = wait_for_completion_interruptible_timeout(&gt->reset_done,
>> +
> This would defeat the purpose of xe_gt_reset_async(), as this will make force_reset
> synchronous , I think we need wait_for_completion_interruptible_timeout in  xe_gt_freq sysfs
> before reading the guc pc frequency.
> Something like below.
> guc_pc_freq_ready()
> {
> 	wait_for_completion_interruptible_timeout()
> }
>
> Thanks,
> Anshuman Gupta.
> 						msecs_to_jiffies(gt-
>>> reset_timeout_ms));
>> +	if (ret <= 0) {
>> +		drm_err(&xe->drm, "gt reset timed out/interrputed, ret
>> %ld\n", ret);
>> +		return -ETIMEDOUT;
>> +	}
>>
>>   	return 0;
>>   }
>> @@ -225,6 +233,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>   		return;
>>   	}
>>
>> +	/* set a default timeout */
>> +	gt->reset_timeout_ms = 1000;
>> +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
>> +					&gt->reset_timeout_ms);
>>   	/*
>>   	 * Allocate local copy as we need to pass in the GT to the debugfs
>>   	 * entry and drm_debugfs_create_files just references the
>> drm_info_list diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index f74684660475..824cefde20d2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -358,6 +358,12 @@ struct xe_gt {
>>   		/** @oob: bitmap with active OOB workaroudns */
>>   		unsigned long *oob;
>>   	} wa_active;
>> +
>> +	/** @reset_done : completion for GT reset */
>> +	struct completion reset_done;
>> +
>> +	/** @gt_reset_timeout_ms : gt reset timeout in ms */
>> +	u32 reset_timeout_ms;
>>   };
>>
>>   #endif
>> --
>> 2.25.1
