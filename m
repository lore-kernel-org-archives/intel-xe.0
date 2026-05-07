Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D409DCD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 12:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9225310F09C;
	Thu,  7 May 2026 12:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQsB+oO3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8415510F0B6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 12:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778158307; x=1809694307;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rHBN2kkTV9lk7ViCJfnPAqj9WMvJhcR1cj8176uidjQ=;
 b=mQsB+oO3RkGkd+999TU9qaRXNIgyCp3ttpf7X/68hG9Wti1WuM6PWEbX
 PpS8x8A+gJZJKovSOf2nlc9W4zeop2K2TMgFUMctsqZ9ev8a3yRB5+uW4
 Lsca/rFhIRIMjelh9QiidJCcdGsxwSbyBlFglc0WgUt4lDvc8qqMNhX1U
 RwTuyi9HrDfx7UqzTB/3Bu2IAfYNPtz/w5l5I3xLENhGJAXzPwyw1G6/r
 dT3x7Z6PAwIehCzG4W+QPBuGyzsaUhqi3Rs2QaTmZj3jRUdnbbf7pdbm5
 c3NQNiYzJmMOeK0zDUz10H/OVmWAoRD+rEHR6Bts8kKL6aU55BlkURylf w==;
X-CSE-ConnectionGUID: ReeA/pugS1C7bMtWPPbg8Q==
X-CSE-MsgGUID: 8VvYadjuRpmxJOsEXipWrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78823164"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="78823164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:51:46 -0700
X-CSE-ConnectionGUID: J9TS5LqsR7WP5Hok0gf+jA==
X-CSE-MsgGUID: ejOjqAvsT2K16psqTnuZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236371496"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:51:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 05:51:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 05:51:45 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 05:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPi0C8OcFIDcFZTlc4SmXA3mmWEb/G9zis3goIpuS71s4n0IpmHlNR+gZQFgS7Xoix8NrI5HmCd0TkBY7C1ykDvDUyH7NQXcbJXMrM93RZ+jRHUVWKfGKsJVvnc2PgAAS4Q5JpFFnUQ1IO2TnZXnuEFkpb99F4hRzjh2rZPcl39z1ilJ4ymdBcWY7onrHK5LJjXrMBLgGdWENXizgXRpkC6lSnoidQRSEzt3zZIXgCCrwNBEzE5RThIPYQmqNyQW7VOXUrtrSRjTmWIwY1pfjurT5/zfB3AWPT1GPbRjvOs0O/MTINoNtMEka+PYJjq5C6g1/W0/PkGHc5IMh+PgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy6I2c37CZY1zBuiUCGFPqMv5YY/Vnk6wq6kl3UQXBw=;
 b=QvXxQP0oVngrI84q4UIVYjI18X4mQAiOPEpg9IbEuavYFqvzmuY2uNO4Il8jv/ZQ8ZaB60q8wzHL+49sXZE5OGjlQNUil4EoNEfPbTwuAxsxCx7af4JriL8A2LoUpnC3t2Qi7F4sNo8/czWDsbmRylYogNXsKZw90E3KhPZ0ZCoAyY9cJPWDsBLJj7olwF3S9oCfE6Ofro+q4Fi478aMGqofBuiC9QDpqoXSPa6zUWoUH09ZqYIut9RHJ3cUM2Qk6TR7NiA6he7ycWIEozYSpfZK+Bn3ISbriUdIog3QQDJTsJUwsjA4eeALpCPySOJEQQ+I9eM+kVmYYyNtqQCb5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 12:51:41 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 12:51:41 +0000
Message-ID: <46edcb51-0b37-407a-81c9-b0fe91106b9e@intel.com>
Date: Thu, 7 May 2026 14:51:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] drm/xe: Track pagefault worker runtime
To: <intel-xe@lists.freedesktop.org>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-8-matthew.brost@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260226042834.2963245-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0181.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::22) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|IA1PR11MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 7899d756-a1fe-426b-d78c-08deac37628f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: X4XMirEcxj1rnZjii+zGgAAy86/HVdYTgsm5dGwPaIZyXaMfjc+vRivqbA210ZA5Rx76K1udjBXITyghCSYkQHPpKEKesTQyaQiA7mo8I2fCfBtR/PF351mvxaGWBZXL9uUnk5yT1xf9/utjZ4fOV6IqHrBK/Qhmy5KJbE6qdKHp30JYDAhha/2fkfijx2zHssHnSdKAkFM8C554cMlm1uDx1/WiIuXghAX5Lx4+WyT2hb/kijEJPr/iLsgSIG2Yb8zuQbR4O7iU13UXQMtOUewSCxGFf6PWygKRKCsMHQ1jvBLQdS+VBdf6LHm8MICLPbQ0TRdABS5uT6pBO/BG3KF1QaD1l0BmFa3bzoBUPaEp6X4ONF70zGpMUJAfEs0VbgyAyNlDU/X9fLnlbDXjmH79Khm6LBYH0AFYXvHsiOK+EYdCzpNnkI/jK2aINqVb6YXmL/0qpVK811npgEhwH1KJQxkPvThF2LozFkH/PWK4Yo+RD5a2MynmBBN7/tJn1Lc470DVHP9nyjm3zv/0RaWuGYPVHiiFFrgd0xbtYT2G/PJ90SD5glPRv61Kj7nGYLUNpoQx2L5B44ZvMEcUxCWkvZXqXBQgFYQUFArWa24maoScT0wsetAz6WD0meviWNyutjMB9G/Xi571qfPB2tcUhUJPQIEYRPd1KpRq51nme8ABXFq0RkxsIo/wXrxy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXNNdUVYcVA2ZDVNdk4xb1dEbWlGeGNlR1dVcVpRK1dHajk1NTFIMHFva29s?=
 =?utf-8?B?Rld1TjE2UjNLUUZpNSt1Sk9DZlFMMFIrVlFUbWQwWVlEdkVuU096MHV0aEs2?=
 =?utf-8?B?amxYbm9WdndMNEtIMnNIVWFEdFZFakEwTzJoZWJ0dWpicld0N256YUZOR1U4?=
 =?utf-8?B?SU1aODAzOFZHOFh5ZXN2ZjBIZDlpajduK3Zrdi9ZQWNyeVFpc0dXS0NpYk9a?=
 =?utf-8?B?d3hCRVJWajZFbkdmbHJHUEpMM2xZU0IyK1kwTG9XdlFxeWRKamRJa0RVRXpy?=
 =?utf-8?B?SEozbmFzd3Q0RFpCajJ4RW40QTVmTWhhRHBKWDRKR3FFMXpNUGlzOVhNYk1y?=
 =?utf-8?B?UjFjdVZtdWl3anVNcXUvbnozQ2hQaHVmL002SHBEVEhPellBU2lOMXB2ZFFz?=
 =?utf-8?B?eFI3U2RYL3lOcjZmOHZVWWNhL1ROdDRMbXhDYjB3d3I4clhycFN2QlZiUGRB?=
 =?utf-8?B?MVJsUC9TS2xVU2N1Ky94ZFM0V2VYYy9CZm5HN2lKQllrVlc3Q01zUnNJa3VW?=
 =?utf-8?B?c20vcVBOaHEwREJzcFVZaE1IdGtFTURBSnFKZWdCSXFlSERUUEFhNitoa2RD?=
 =?utf-8?B?SldLZlJrSUdhcW9vaE5DM1NSU0JqanVKaHdSaDU1dnVjSjg1VGRjSXluUjFs?=
 =?utf-8?B?TzFuQWwvMmFBNFV0NzhlUHdHYVhqYk9LTUQ2S1FXTlptb0U2N1FveWM5UWlC?=
 =?utf-8?B?MlpFMkJibWVvUHU2dVBBaG1xM3l0ajNxOFAvOHlHTkhUVnhMcHliOTVsNlhj?=
 =?utf-8?B?RXZWWDYrdnZ4SnVGU0NHS3pubklxRktDZUE1Z2ZObWtJTk53MkFNVWlqQzZk?=
 =?utf-8?B?alBETXA0Tnk0TThaVzA1YVlQOHlCWDN5RW9XblorYWoxSVZ3NFYzcDFvQmQ1?=
 =?utf-8?B?cTV5ZmFESDd2T2llTGVxMTVucERBZDI5aFpQMEFrZ3lJRTNxQTZtZnFjck95?=
 =?utf-8?B?OUJkY3N6MytKRHc0UXZYUkJUVkFCbTE3WmNsYVpKMXpYTGV5RHF2YWdqRURH?=
 =?utf-8?B?dVk2Yis0aTdwSVFGOGJZVWY3Z3ZKTUw4cklmYWZCR2pmbkc5MGtVR3NwN0Nh?=
 =?utf-8?B?MUFtc1RaM0dGQnQ0aU5weklkdktET1lab0VPaUtJZUFzMVIwTzNET1A3eFJ1?=
 =?utf-8?B?V3BzdlpkK0lWZ3ZwZ042NjBmcWYxY1BIMGpqdzlxdEhyMTNNclkySzZVa2tT?=
 =?utf-8?B?L2ZKcmpzb3pKeWdodHVNVEpqTE41Unk3ZU5aU1lLbVhUZUJoT1YvSlpxZmda?=
 =?utf-8?B?T0gvcmQzdlpWajJVTGlnUTZnQm9zL2c3c0NJYWhKc0xONk5oY2VoMHRHUjlj?=
 =?utf-8?B?VTVJeGJ1NHl5ck85c285R1c1L1dRUkNVbmJ5MGU4bFNOOEVCQTZMT0hMcjBJ?=
 =?utf-8?B?OFRVMWNxbk0zRnlWZ0R0SlN6RGhQR21sMThuT2xnQWljU245cnYrUE1sSlRX?=
 =?utf-8?B?UGVKVHNhempCYmYwT1AzRFppQUtUR1U4Y2pSSlFnWVp4ZStoZXhQNlVlbkNi?=
 =?utf-8?B?SFdRTXBKazN2OFpqb2E0d0hON3pIZG9kYXRlNkpmV2ZtVjViVFhDbDVWMktr?=
 =?utf-8?B?V2VoMEVZOFpmQ2twR2hXT3g4RXNndk5DMzFUNi95V1hPd0dtKzUvQnFJNDlJ?=
 =?utf-8?B?N1RoSHJXNG1YdVBRZVorRHlhcnYxcXEwOG5oVDQ3NkpvbmV5Z3V0SnhDaWlh?=
 =?utf-8?B?UTJaTUs5U1lBSTlRWEFSTy9XVHdmZFBPQjVrNU1BakZMbi92SjQzRzQ5NFdT?=
 =?utf-8?B?NVIrN0JURUdiNXJFTWhVVzdPTzdMNVJHU3hHVDZKUjVOZjBRTzU2aE5sUFdn?=
 =?utf-8?B?SE5zRGRTeE9QUndYUmlxeXNhbkJIdStYcXJnMXRrRVFacE5WclBjY2lIV1V3?=
 =?utf-8?B?YUN0REJqYjh5ek9iVGtGQmR1Y2NMTlh0TjdWeFJ4ZmFUTFZKZTRSbnFUM3h3?=
 =?utf-8?B?WjZWNFpsMjhxcTFjRktvMmxXZ1hBMXJoR25uaWhmb2MzREVCMWlBdzlGNkgv?=
 =?utf-8?B?ckNXa09xd3lReXRoOVphdXk0ZFRSSUF2V2RYTCt4WC9qclFJMWtDeWx6VmFa?=
 =?utf-8?B?cnQ4M2ZWc2ZzbkplZE15UFRKRW9HTExoYkhIbWxoM0p2ejcxM1RnUXZmRHFj?=
 =?utf-8?B?K29DZGhnMTJtNUhyUmt1aEM4ZU0rNEVQc3lrcHBhNjZwZFFyU2VYWUlRbk8y?=
 =?utf-8?B?ZFE4UlJpNHh6bVgxOFMyR0JYeW14ejcvblFXTERNUEJJOTJpQkNjMkhHVWpa?=
 =?utf-8?B?WW5LdnNBanV2ZmZoQWpuRWVNTHNTb3JjUElKNnI4bnlDT0VhVElkWDhOaWNW?=
 =?utf-8?B?RTdXQ0tqOUdacWNmcnV4Q1lYVG10SEF5V0xwOGRlU3ZNcjRVcW5Cb2VmYmxv?=
 =?utf-8?Q?rg0PW9YguXgBkDCI=3D?=
X-Exchange-RoutingPolicyChecked: UdI2SoQ7uy/88ozQ7hpKHM/MZ9VwRWC9wEL0CbUoQwGXDSKy36GsWT3tiYFcCJtM0xIB8cBUrRzcDWWsBrj/au2nl/PLvgRVLva3ag1GuIQO+1Ac7wo+nY89N4a+c9d1A9iZzfpEEsBj66TJ7LMsyEPhi2gRRx5+9m6ZOslP3kbS2iJGhnEDasFcC1Tsb0TQd2wv/CyZzRhJRyPkvYequvZzy+2zJft3h0bGkxL2o28iZb1fl3IvV/QYsCH2AMT0F6Bz+86eDWi3lb20aQyBzxw6hJNh2OqKFBm+Uuld9bHKpUox22hhlbVLdVEjyZuu0jKmV94p9P6UD9L5m7tQKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7899d756-a1fe-426b-d78c-08deac37628f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 12:51:41.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /72pXFD3bI1nrDQbbyswWXGbLugbMF6rfzwiH1xqEWxnYoozHNXtJeE35/8LhojKgU4grMxnmsvVnS9riM7Hlrk2NzQGVWLEFE8Tej/J2js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
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

On 26/02/2026 05:28, Matthew Brost wrote:

> Add a GT stat measuring total time spent servicing pagefault workqueue
> iterations. The counter accumulates the runtime of the pagefault worker
> in microseconds, allowing correlation of fault storms and chaining
> behavior with CPU time spent in the fault handler.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_stats.c       | 1 +
>   drivers/gpu/drm/xe/xe_gt_stats_types.h | 1 +
>   drivers/gpu/drm/xe/xe_pagefault.c      | 8 ++++++++
>   3 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 81cec441b449..c1af3ecb429b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -60,6 +60,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>   	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
>   	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
>   	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
> +	DEF_STAT_STR(PAGEFAULT_US, "pagefault_us"),
>   	DEF_STAT_STR(INVALID_PREFETCH_PAGEFAULT_COUNT, "invalid_prefetch_pagefault_count"),
>   	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
>   	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index b6081c312474..129260bfdfe6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -15,6 +15,7 @@ enum xe_gt_stats_id {
>   	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
>   	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> +	XE_GT_STATS_ID_PAGEFAULT_US,
>   	XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
>   	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index a6fa790774c5..030452923ab9 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -277,6 +277,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   	struct xe_device *xe = pf_work->xe;
>   	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
>   	struct xe_pagefault pf;
> +	ktime_t start = xe_gt_stats_ktime_get();
> +	struct xe_gt *gt = NULL;
>   	unsigned long threshold;
>   
>   #define USM_QUEUE_MAX_RUNTIME_MS      20
> @@ -288,6 +290,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   		if (!pf.gt)	/* Fault squashed during reset */
>   			continue;
>   
> +		gt = pf.gt;
>   		err = xe_pagefault_service(&pf);
>   
>   		if (err == -EAGAIN) {
> @@ -314,6 +317,11 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   		}
>   	}
>   #undef USM_QUEUE_MAX_RUNTIME_MS
> +
> +	if (gt)
> +		xe_gt_stats_incr(xe_root_mmio_gt(gt_to_xe(gt)),
> +				 XE_GT_STATS_ID_PAGEFAULT_US,
> +				 xe_gt_stats_ktime_us_delta(start));
>   }
>   
>   static int xe_pagefault_queue_init(struct xe_device *xe,

I would use plural here to emphasis pagefaults and workers.

My first impression when reading 'pagefault_us' it that is single 
pagefault processing time.


Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

