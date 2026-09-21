Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4759C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 11:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F63810E37C;
	Mon, 21 Sep 2026 11:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2zVIKVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAA410E37C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789988855; x=1821524855;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mDdIkuUfdikZxS3MJUN0WvRMq4ZEMIRrPprGHi6KNl8=;
 b=T2zVIKVzNjjNQuaiwRt1MzvCuVzYdnYnW+C2lKLrdsqfF8/ysTzdTuRk
 JtdOBpppF+Aoox0dVbq0TJ8lVPCPPx/ZxylFEzh09iC8KFIzUq20WtmcU
 8Q5erh+zPdsma0TwwXsSQeeOrYDdkOIEFHlkTMV9j1wPzbzA7T5ft9RTS
 OniunuYFzLXLfjZHvMSAXKCI5ha9RoEh68u5zrLKFIAgJj4K2s92BJl0p
 BKJAVB8jh7ECTvPbJEyONAqa8TKs9N3+E/4Ztw4pbCDngqh9qNq7RaBoy
 AC8pQpUFY9ufrqoDt71oNZ7fZ9cC18B1pJ8tgvQIzK1sfGLI56ZzN0WHq A==;
X-CSE-ConnectionGUID: qW2ZTFt/RoqW/QlcDkFo6g==
X-CSE-MsgGUID: 7iXkrG+oS/a2ssSnlS5fvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101152924"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="101152924"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 04:07:34 -0700
X-CSE-ConnectionGUID: EdeXSHpySOaQk2lRD+P/Zg==
X-CSE-MsgGUID: 1paReoT7SEeMjktOFIK56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="277402276"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 04:07:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 04:07:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 04:07:34 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 04:07:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8pwm3KAqvYmqCfxL/34v/DKMp1hAYenLpnAFpQD+LwMOs0WXRQ8xsbyvLPb2MKcU9HwyZICYkakdBlLOO+xB48iuWiHoh8fYmSPulzOpKSV0hiALS7GVUxXaqc2g+aAVTeZSygyZHbIZ+tTA2GC3EAoeO674XOCIhnmCjEF78JLa6r1xfamO4QhXWd/HNFRI00DVR/pgvxCWmqcCs05l6hGoDjBdDi1t8ci8el9wIMkcNiD5DjbSfzzBiqrr9toC3tUXgsKLWV+xycd4d4KRmojx91nrxiS96IK05lh7/K1hOPfwNpH5yuXAD/mgSkHVAIXXVxWPxtYN7BESXBA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n96gsyjnu6Dw6w0UnvRQHeftqAQIATK9dCtSHEMoCfk=;
 b=gZxqfouIC8e7NfodbyRLunrAJMKIlEoz2ne/uJ24qJWOEyVe+1J2KzfMD3zpjr8U9J0LdlPgJKeGd6CfrCSasRlJyP+80/IsqzDoBpOstrSc9mDXTNZeSZzbT2hg90p/oQMGsU0+smhhxft/T0tUccrztSFpEipJj1zCnmYQTVA9yorERTyXompJ4Rp9+sUF7OAah2BPS6gw7K3TQUUamlFE1oDf54kii+RKmH5ixmrBYLcJz8dIkCRxO2RaaNKzoSY+E9HaqtlPgqOZTejQV5Gq4H0KCSWaT+0WxwELE1VOpa6o9g3CsfdP8b+rAGY24vAzbty5wbL9xFL0/68W4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 11:07:25 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 11:07:24 +0000
Message-ID: <87f6232f-1652-41f7-9f38-ad14ee650db1@intel.com>
Date: Mon, 21 Sep 2026 16:37:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/24] drm/xe: Add struct xe_pt_job_ops
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-10-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-10-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0158.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 5129d2bf-eda5-4240-5a2b-08df17d08410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: guODjXvRQWIzbTJFhnaa5tk+v9nnseXZ2ecHKkrIoHxlGNswxPHDIA9I4NcX6YMkZSeiWl+I1AVg56bTU7yUDfs86+hy/H+c29OkHnuk1yGgzMA6GiWDW218sC0jsriJ+TxApHu/pSzyw06mBrcXVdSHX9Avl2o2osTB7r3ISOSnbGhmq7xNhRu0HFwjBKKRyn8FpkogKwZfTjEt+1RZtQUZ5kBwvXqI4UkP0wqruROySStB3qwwMVWOz6L1O259HF3Nw5fm/Uecz8Nm+YDZhhCpRC5afm0c2sOjd+zXqN3duadCHphZjYmBYwKnEulbX8SK9J6tGuJp1rJqqWIEoAreo19qe3/l7Kxy6DMA4VzL2dolaZvSvLftRIFRVNeaMB0Jgw69zDAH34YmTmjCA+tsfJG+PBpKKQJTRTCLmu/nFeBsdtwpqH5E/bWRG0MXrm6YcMwOZr3u/yY1TrpbGYzRrN0V0kxS5ei6+oOEGR62NrH2hTBRiiH1cn8aBR7DJ6VE99/saklZpXH/qIYZfHKnbxsR+RjsoiIYC1rrLz+Db+DJrrasYPulUB0aQY2RdOUexAosoaSUi5Yd/KkrcVwI3dHI+RQlC5N+AvRLbE8hbblrwHfRWAXIMM72qu2s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTRRVFpnYXNueHdLUXhMK2JRaGJZb2o4aXM1MHphY0RkekpSWWhFdkMxSXBC?=
 =?utf-8?B?N3JQbDlxaXIyUDd4akhUbTR4Q2tuR2tvZGFLSEVHWHdwalg3d2xWWndsOVVO?=
 =?utf-8?B?MzFpSytMZFpTT3ViWkYvNEF6clRKZlRhdk1vZjNRTXluSWRvcHQwU3pybFJ3?=
 =?utf-8?B?emMrWDdzUVVod0FyaGRKaVhrNkdpbVRJU2loem41L3B5Tmo5S2pNN2Z2aUpw?=
 =?utf-8?B?RTB6MVFiOWQvTzA4OFplZ0FwZHdFTDB6Unp1S2w5em5OM2t0Ny9RdS9lYkRw?=
 =?utf-8?B?enJYVU1XQno2OWk1eHJZb29BZ2hKdEp1V1ZDWkpzSVRWemt4bi9uNG1QbDh1?=
 =?utf-8?B?Nm1nSW5UOUpKR1QyaHUxTXdmTGxUZEZrK2hZNlVLczd1Ni9vTDZGUWtBUE1Y?=
 =?utf-8?B?RjdqWEZBRjMyRHFzNWJNMmErRGtLNVNFYnBXVVcva1d5aDZKWm43RUlFZnFC?=
 =?utf-8?B?RFdMMVNtMldWZ1l4SVh2ajJOUWU5K2dWeFN2MXJxeE00ODFxWmpVZlk3ejVk?=
 =?utf-8?B?MnlIVURRV1ozVlhKa1Z3Vm5tWk5KMElDUGtuN0FwYS91cFVMRDA4c3hzSnNT?=
 =?utf-8?B?R2dJeXNySkRaNzBCU0tGZ0VvUFRuakgvcnFLS1VtUFIrK2Q0TTI1R3hxV1VQ?=
 =?utf-8?B?aGIwbzdKMk1WeVhMWUthNVQ0R013UklpUXBjWWpubUFoR3B0VEh0cWZ4RG1D?=
 =?utf-8?B?cGJybFI0L2hGQUZZOEZLczV0dlFZWVFqME1hNjRRdmhJZ3BIcVFCVGo5Q0dj?=
 =?utf-8?B?RnF3T0ViczVXeU9WUS9oRXQ3bmRQdnBDS2pmcnpZaVZRS0IxTU1lK1J6N2xR?=
 =?utf-8?B?aUNCUUQyMmJvQ1lrbzQ5VHVpY01WS3hPL2JEWlJabzlBMFRhTDZSUkRNYXNr?=
 =?utf-8?B?TmkrNVpIS2Q1TzE5RGhNNWtPZEhMN29Nc2xpUXZyU3BwRytnWFZmYmZwVXhJ?=
 =?utf-8?B?dXdMV1VpdFR5c2Zha2JwSURiVzJuL0RqYnNBa2dRWWdSSlJlTXREQlRqUk5t?=
 =?utf-8?B?Q2t6MkZKaGpNK01PUUNMYUN4K2tWWk13c3R1MFIvNG15cE5xMW5hQTFkQzZQ?=
 =?utf-8?B?WUpqM0MxQmVteGhXZENpRU5JVUJoY2NiWUl6clRIL1ZZS1RSZWpTL1JubVJn?=
 =?utf-8?B?Y1ZmTVZPVEI1WXVsejQ2UlNBRkR4OHFrWG05a0tnUzl1SjhqREYzcExxblc3?=
 =?utf-8?B?ZXVCcGk2MVQ1KzNvamE2bzZPZk1YcXZMWU1ZTnVwcUFEQnl1TTdOWHllcnR1?=
 =?utf-8?B?RWVtMkRjaFJFWTFRaGtGbFRXQnlka0pzMFVsKzlsaXkwemJRR0YxYU9DeGxw?=
 =?utf-8?B?bjJPZkdQNUJ2NlFPNnVNUjRUbnp3bUJRSnBnR2YzaU1pa2kxd3dEM2I1bHUy?=
 =?utf-8?B?WGM0QVJDY3d6UDhYMGdxc1U4dVRXa1pNRC9BamRSbzdRRWpZUEhBVUVNZFJp?=
 =?utf-8?B?ZzJPY3ozdVhqajRPbXdQMElKN0tiOTNBcmVxMEVVdDVDN3R2UFlORXZ6Zmpq?=
 =?utf-8?B?bkMyWVV3UXMxUE03YUNNYk55SkpyOXFVeFFPUHJxN3ZOVFFpd3NodjBkZkRh?=
 =?utf-8?B?TnBoSFJzaFhKa2ViUVowTjZuSk1vVUZQVmlCaXZnTDBXYWhiTEVac2Z4K1hE?=
 =?utf-8?B?Tm5HVll1UkMyNmtYWmhkRFBHdjBlRGtMclpIWnZON2xTLzVLc3ByM3NZdGdT?=
 =?utf-8?B?RkVYTnBsWFlYMGZFQ0tJMzI1Z1ZZTEhyOHc1dTRpVFNmRmhGcEhldmpnVW9P?=
 =?utf-8?B?RlBWRVQ5Tk5WU20zWFdtbXRVM2xhRnRTOVRKZEI4YTlIQzZBbGZCRVFYQVNl?=
 =?utf-8?B?TTZnaVlTOUEwZ01aTjVlN2ZCZWRoR3E5bnRMQlhPcmFYTjJJRlRqaWJ5ZVFj?=
 =?utf-8?B?NHYwRHFNQW9EY3ZsMm4vbk94Q3JsRVI4dDhOY0xIYklCeHlCN0I5bVRPNzMy?=
 =?utf-8?B?alNhSjFLanp6aGlwaVl4d1MvZEE2ZnU1M3pFZ0MvSSsvQ1VUajN3ek96d0Qx?=
 =?utf-8?B?bTUxdndYU3J1SjNxQVlBeS9tUnIvT1lQUlh6M0g3YWN3RStWZGJIL0g1cC9V?=
 =?utf-8?B?YzMzeGdaQ0FFbVNNN1J1eXlsYktPVGhRcUY1NFVLUzBDaGhKc3pmK00rODN1?=
 =?utf-8?B?YTlsWURodEFzcnBadHpUd0NkRm8wMERjdFZFWlVSQTFMb0l6MDErbkdMYTFU?=
 =?utf-8?B?RlZtaWYxek14bGdaMlQxQjRtVnZlREtGOG14OHBVd3BSQ2hBdld5czliSlkr?=
 =?utf-8?B?WVZGSHp1N1oxSlQxN1J6UzU1SXlUaHRwNjhrR3hiME9XbGFSZWJMVUpQY0Vm?=
 =?utf-8?B?NjNIblR1NXRvOUt2UFY1bitCaWxnZE5IRndWUFRNWU5KWjRuK0hRUHdOd01G?=
 =?utf-8?Q?/04AxhyroCgbwY84=3D?=
X-Exchange-RoutingPolicyChecked: QmidPagkl6beTG5x2wQ8T3YuPMne4BB0DLgscHvEnj17iyi37oUmqHN4xrid66XBNQSQKNnjOCsIe7CLdis5JX8ZVr3PGEGaHvaMspe7y6esOhyKLktgyPWYoSEXS871gSFviwKHjxf6Cx/Zgr4I4hcEkGhFyvVOE961JTPVg9aUEbzlqKr96NR3Hvf8u2IRNBJt5TZRux4tfLMPsT1YI5uZLfuPhj4m4NUEk1ssrhkiuDfpiJkbV3twMYkOSkKQzZvFfDyz+fI58f5WnpWQI7jcAd55spQoAuTIgUZMqu/LJ5A3HQeAwM/qQk2dAjO50xl59WjN8GZ1W7tOErKPVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5129d2bf-eda5-4240-5a2b-08df17d08410
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 11:07:24.7797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzvKLmLaRJcGuHgap4fZPFXKeJpMnd/z0mZ5IZRzz4sH7trObdE/fhoeDW7qVE1/+Ndp01tro+izrts+4Gdkv0YHeC8PBiWE0bgH4MnuLvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
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



On 05-09-2026 02:45, Matthew Brost wrote:
> Add struct xe_pt_job_ops, a dynamically refcounted object that contains
> the information required to issue a CPU bind via a job after the initial
> bind IOCTL returns.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-10-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c  |  10 +--
>   drivers/gpu/drm/xe/xe_pt.c       | 136 +++++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_pt.h       |   4 +
>   drivers/gpu/drm/xe/xe_pt_types.h |  27 ++++--
>   drivers/gpu/drm/xe/xe_vm.c       |  10 +--
>   5 files changed, 152 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 68a0b05f56ec..217e526526e0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1875,7 +1875,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>   	}
>   
>   	xe_migrate_update_pgtables_cpu_execute(vm, m->tile, ops,
> -					       pt_update_ops->ops,
> +					       pt_update_ops->pt_job_ops->ops,
>   					       pt_update_ops->num_ops);
>   
>   	return dma_fence_get_stub();
> @@ -1902,7 +1902,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   	bool usm = is_migrate && xe->info.has_usm;
>   
>   	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> -		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->pt_job_ops->ops[i];
>   		struct xe_vm_pgtable_update *updates = pt_op->entries;
>   
>   		num_updates += pt_op->num_entries;
> @@ -1971,7 +1971,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   
>   			for (; i < pt_update_ops->num_ops; ++i) {
>   				struct xe_vm_pgtable_update_op *pt_op =
> -					&pt_update_ops->ops[i];
> +					&pt_update_ops->pt_job_ops->ops[i];
>   				struct xe_vm_pgtable_update *updates = pt_op->entries;
>   
>   				for (; j < pt_op->num_entries; ++j, ++current_update, ++idx) {
> @@ -2008,7 +2008,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
>   		for (i = 0; i < pt_update_ops->num_ops; ++i) {
>   			struct xe_vm_pgtable_update_op *pt_op =
> -				&pt_update_ops->ops[i];
> +				&pt_update_ops->pt_job_ops->ops[i];
>   			struct xe_vm_pgtable_update *updates = pt_op->entries;
>   
>   			for (j = 0; j < pt_op->num_entries; ++j) {
> @@ -2026,7 +2026,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   
>   		for (i = 0; i < pt_update_ops->num_ops; ++i) {
>   			struct xe_vm_pgtable_update_op *pt_op =
> -				&pt_update_ops->ops[i];
> +				&pt_update_ops->pt_job_ops->ops[i];
>   			struct xe_vm_pgtable_update *updates = pt_op->entries;
>   
>   			for (j = 0; j < pt_op->num_entries; ++j)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index e560f167fdf1..30127ebf1b60 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -206,6 +206,7 @@ unsigned int xe_pt_shift(unsigned int level)
>    */
>   void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>   {
> +	bool added = false;
>   	int i;
>   
>   	if (!pt)
> @@ -213,7 +214,19 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>   
>   	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
>   	xe_bo_unpin(pt->bo);
> -	xe_bo_put_deferred(pt->bo, deferred, NULL);
> +	xe_bo_put_deferred(pt->bo, deferred, &added);
> +	if (added) {
> +		xe_assert(pt->bo->vm->xe, !kref_read(&pt->bo->ttm.base.refcount));
> +
> +		/*
> +		 * We need the VM present until the BO is destroyed as it shares
> +		 * a dma-resv and BO destroy is async. Reinit BO refcount so
> +		 * xe_bo_put_async can be used when the PT job ops refcount goes
> +		 * to zero.
> +		 */

Seems BO refcount logic is from previous version and might be the reason 
prompting Sashiko comments.


> +		xe_vm_get(pt->bo->vm);
> +		pt->bo->flags |= XE_BO_FLAG_PUT_VM_ASYNC;
> +	}
>   
>   	if (pt->level > 0 && pt->num_live) {
>   		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> @@ -2081,13 +2094,13 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
>   static struct xe_vm_pgtable_update_op *
>   to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 op_idx)
>   {
> -	return &pt_update_ops->ops[op_idx];
> +	return &pt_update_ops->pt_job_ops->ops[op_idx];
>   }
>   
>   static u32
>   get_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
>   {
> -	return pt_update_ops->current_op;
> +	return pt_update_ops->pt_job_ops->current_op;
>   }
>   
>   static struct xe_vm_pgtable_update_op *
> @@ -2099,7 +2112,7 @@ to_current_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
>   static void
>   incr_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
>   {
> -	++pt_update_ops->current_op;
> +	++pt_update_ops->pt_job_ops->current_op;
>   }
>   
>   static void
> @@ -2473,8 +2486,7 @@ static int op_prepare(struct xe_vm *vm,
>   static void
>   xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
>   {
> -	init_llist_head(&pt_update_ops->deferred);
> -	pt_update_ops->current_op = 0;
> +	pt_update_ops->pt_job_ops->current_op = 0;
>   	pt_update_ops->start = ~0x0ull;
>   	pt_update_ops->last = 0x0ull;
>   	pt_update_ops->needs_svm_lock = false;
> @@ -2824,7 +2836,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   			to_pt_op(pt_update_ops, i);
>   
>   		xe_pt_commit(pt_op->vma, pt_op->entries,
> -			     pt_op->num_entries, &pt_update_ops->deferred);
> +			     pt_op->num_entries,
> +			     &pt_update_ops->pt_job_ops->deferred);
>   		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
>   	}
>   
> @@ -2912,19 +2925,8 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
>   {
>   	struct xe_vm_pgtable_update_ops *pt_update_ops =
>   		&vops->pt_update_ops[tile->id];
> -	int i;
>   
>   	xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> -
> -	lockdep_assert_held(&vops->vm->lock);
> -	xe_vm_assert_held(vops->vm);
> -
> -	for (i = 0; i < pt_update_ops->current_op; ++i) {
> -		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> -
> -		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> -	}
> -	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
>   }
>   
>   /**
> @@ -2961,3 +2963,101 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
>   
>   	xe_pt_update_ops_fini(tile, vops);
>   }
> +
> +/**
> + * xe_pt_job_ops_alloc() - Allocate PT job ops
> + * @num_ops: Number of VM PT update ops
> + *
> + * Allocate PT job ops and internal array of VM PT update ops.
> + *
> + * Return: Pointer to PT job ops or NULL
> + */
> +struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops)
> +{
> +	struct xe_pt_job_ops *pt_job_ops;
> +
> +	pt_job_ops = kmalloc_obj(*pt_job_ops);
> +	if (!pt_job_ops)
> +		return NULL;
> +
> +	pt_job_ops->ops = kvmalloc_array(num_ops, sizeof(*pt_job_ops->ops),
> +					 GFP_KERNEL);
> +	if (!pt_job_ops->ops) {
> +		kfree(pt_job_ops);
> +		return NULL;
> +	}
> +
> +	pt_job_ops->current_op = 0;
> +	kref_init(&pt_job_ops->refcount);
> +	init_llist_head(&pt_job_ops->deferred);
> +
> +	return pt_job_ops;
> +}
> +
> +/**
> + * xe_pt_job_ops_get() - Get PT job ops
> + * @pt_job_ops: PT job ops to get
> + *
> + * Take a reference to PT job ops
> + *
> + * Return: Pointer to PT job ops or NULL
> + */
> +struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops *pt_job_ops)
> +{
> +	if (pt_job_ops)
> +		kref_get(&pt_job_ops->refcount);
> +
> +	return pt_job_ops;
> +}

Although unused in this patch, but seems correct place to introduce it.
> +
> +static void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op,
> +				  u32 num_ops)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < num_ops; ++i, ++pt_op)
> +		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> +}
> +
> +static void xe_pt_job_ops_destroy(struct kref *ref)
> +{
> +	struct xe_pt_job_ops *pt_job_ops =
> +		container_of(ref, struct xe_pt_job_ops, refcount);
> +	struct llist_node *freed;
> +	struct xe_bo *bo, *next;
> +
> +	xe_pt_update_ops_free(pt_job_ops->ops,
> +			      pt_job_ops->current_op);
> +
> +	freed = llist_del_all(&pt_job_ops->deferred);
> +	if (freed) {
> +		llist_for_each_entry_safe(bo, next, freed, freed) {
> +			struct xe_bo_dev *bo_device =
> +				&xe_bo_device(bo)->bo_device;
> +			/*
> +			 * If called from run_job, we are in the dma-fencing
> +			 * path and cannot take dma-resv locks so use an async
> +			 * put.
> +			 */
> +			if (llist_add(&bo->freed, &bo_device->async_list))
> +				schedule_work(&bo_device->async_free);
> +		}
> +	}
> +
> +	kvfree(pt_job_ops->ops);
> +	kfree(pt_job_ops);
> +}
> +
> +/**
> + * xe_pt_job_ops_put() - Put PT job ops
> + * @pt_job_ops: PT job ops to put
> + *
> + * Drop a reference to PT job ops
> + */
> +void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops)
> +{
> +	if (!pt_job_ops)
> +		return;
> +
> +	kref_put(&pt_job_ops->refcount, xe_pt_job_ops_destroy);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 4daeebaab5a1..5faddb8e700c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -49,4 +49,8 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>   bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>   			  struct xe_svm_range *range);
>   
> +struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops);
> +struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops *pt_job_ops);
> +void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index a7d1bb708b69..39c5b89ce9b7 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -91,12 +91,29 @@ struct xe_vm_pgtable_update_op {
>   	bool rebind;
>   };
>   
> +/**
> + * struct xe_pt_job_ops - Page-table update operations (dynamically allocated)
> + *
> + * This is the portion of &struct xe_vma_ops and
> + * &struct xe_vm_pgtable_update_ops that is dynamically allocated, as it
> + * must remain valid until the associated bind job completes. A reference
> + * count controls its lifetime.
> + */
> +struct xe_pt_job_ops {
> +	/** @current_op: current page-table update operation */
> +	u32 current_op;
> +	/** @refcount: reference count */
> +	struct kref refcount;
> +	/** @deferred: list of deferred PT entries to destroy */
> +	struct llist_head deferred;
> +	/** @ops: page-table update operations */
> +	struct xe_vm_pgtable_update_op *ops;
> +};
> +
>   /** struct xe_vm_pgtable_update_ops: page table update operations */
>   struct xe_vm_pgtable_update_ops {
> -	/** @ops: operations */
> -	struct xe_vm_pgtable_update_op *ops;
> -	/** @deferred: deferred list to destroy PT entries */
> -	struct llist_head deferred;
> +	/** @pt_job_ops: PT update operations dynamic allocation*/
> +	struct xe_pt_job_ops *pt_job_ops;
>   	/** @q: exec queue for PT operations */
>   	struct xe_exec_queue *q;
>   	/** @prl: embedded page reclaim list */
> @@ -107,8 +124,6 @@ struct xe_vm_pgtable_update_ops {
>   	u64 last;
>   	/** @num_ops: number of operations */
>   	u32 num_ops;
> -	/** @current_op: current operations */
> -	u32 current_op;
>   	/** @needs_svm_lock: Needs SVM lock */
>   	bool needs_svm_lock;
>   	/** @needs_invalidation: Needs invalidation */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 753a5fc55baa..2737bd25f39a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -681,11 +681,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>   		if (!vops->pt_update_ops[i].num_ops)
>   			continue;
>   
> -		vops->pt_update_ops[i].ops =
> -			kmalloc_objs(*vops->pt_update_ops[i].ops,
> -				     vops->pt_update_ops[i].num_ops,
> -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> -		if (!vops->pt_update_ops[i].ops)
> +		vops->pt_update_ops[i].pt_job_ops =
> +			xe_pt_job_ops_alloc(vops->pt_update_ops[i].num_ops);
> +		if (!vops->pt_update_ops[i].pt_job_ops)
>   			return array_of_binds ? -ENOBUFS : -ENOMEM;
>   	}
>   
> @@ -732,7 +730,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>   	xe_vma_svm_prefetch_ops_fini(vops);
>   
>   	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> -		kfree(vops->pt_update_ops[i].ops);
> +		xe_pt_job_ops_put(vops->pt_update_ops[i].pt_job_ops);

With stale comment removal. Patch LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   }
>   
>   static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, int inc_val)

