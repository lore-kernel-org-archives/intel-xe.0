Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD4ECD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 18:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C705E10E13C;
	Tue,  5 May 2026 18:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJXJtXze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECB110E13C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778004226; x=1809540226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cCa+Bl2NNOs8NAUw8FAFJQ/1B/6bWrzAIKL2drtm8zw=;
 b=ZJXJtXzeaYLxpkHqItnqr5Le0H+8kY31tGAxaWy4JB+YlwDGQsiT+unJ
 oq1yjJsB9+Ccq6SaUEKezB3qd/44Ap9LDaPu+K/yY0mJhOsCGqPeb1jCI
 mzGIgKG5x8TbkBjZQZ8txFbXsHCbvo89XxViVDtwPJjZWfVcZphSh2FB+
 c7sRYcpS0bISGf/++DE7mkICpRxmFaoISaRiGQweqM8d6B2I2ASmdZXbR
 FDzRnViCWpRlsjpP4JiUQvy4FUsNkxkkHvStxMNWBijON6pT+mbJJWx98
 VuRzDUigzE6yHjalAWL570rPXPliKrW8iXLI/zawzJBM7NI21xAQxW0Ei A==;
X-CSE-ConnectionGUID: CkrK3J1jQLKWojuNmdTXDA==
X-CSE-MsgGUID: XfFFpDjGRdaOaZWjIzr7sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82736289"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="82736289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:03:45 -0700
X-CSE-ConnectionGUID: J/vWdqhUQU+EMw6G8ZCbJw==
X-CSE-MsgGUID: zE4E36msTROP6KPRueFSFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="240874807"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:03:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:03:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 11:03:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:03:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3McJwhYG+NJ382gyl51lda9xuFCOg9zLfaYakrmT+cNi70eBtgP122HHIWHml6MTQZ6GpDnv6ZypGPqZcvF2npNppNJFEQ4TINdEonEgZy4C9r6Co6usIZ6RgY8ml/QcUeK/z4ADCDssL1Uz/nYv488OklwHlJRX0pIMy7182HyPLnVipjbLJHfuYrd/mNrR19rpeSkfKsxzlUONhf6rw/wJik+m7H/uwO4IWIi60ge2hay9oTZlHS1KWNyH3cL0JyUuruaBvF4JTdCw0blw1ttkY6SDpyeKftm1tf+2nC49rfMImoXNnaFEXYXz7dBI6Rd/5trP25oLrIjsKC50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svz7pR06braZ89Em3a5rSNIoTuNufjHHJ0IMwqyxdWc=;
 b=eUC4Bpv/6eHk5snwSLjHiHXO4jv7q3dZ27lX3W8tOYTq5ZcGFfvjzU8qVNoYl4cbGXO8cwwqc9hTr/2QhWZ1klf7kNF3j213d1wID5xwBMz50JIIuEGoiIOfihYquZuHE/MvRREWxdVTM5AQW3pXxBpse/8NY1qmpu7YiACTAwFKsQVKs8zaNvFIpCeRMSCaSWPyf2WVv9PB9HALhy0iOgLw1vv4+TdOOkyFmu6Ul6ZLMbOSfoZ6ouJpabDxgHkT7uJNxG5CA/h3YjtZ0dhmBNZf7Y8XPBsLzcZQMq2H034iLhulEZ1o2uTddCyeE0j3Gt0SdiIjUrDOiNQfA55QVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 18:03:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:03:39 +0000
Date: Tue, 5 May 2026 11:03:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 2/9] drm/xe: Add timestamp_ms to LRC snapshot
Message-ID: <afow9Ap0QC+lv2YQ@soc-5CG1426VCC.clients.intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-13-umesh.nerlige.ramappa@intel.com>
 <afky3io69uo2yxKU@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <afky3io69uo2yxKU@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:303:b8::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: b199d928-3b08-4f06-9b97-08deaad0a27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: zAbY6NngwpYCi7wHx9U2tZMewp9Kfi3A6p0ZomOR6TSqx7YtQ5x6u4hYXV9tPdNcuQmXbXMojDuk6cD/11uXMHRNh6Oais73kqhBA33M5RO4vFIOqP8Bw8yxEowSPrg9y3Je6paowz/fesK3GN6Ee5EqgBwL2JFIHst5ymnwSFysEkp9bE77Fodwcpdj2eS2nqxeyxM6Or/uIBToFWM0DxdWaTF4lt1cvfrFgrMeYSiFvsCEN2ofd5SldGKi0o0Bul8j14DJrcKxZdkfNi03KzZmLWhhdkKAk75uFECMdJjo/fugWrdt8MvzuDTviKktc9iPxO0bkcOSTlV5INmDJ/7gwjH9S5fm70YxwbZeJzz1Yj+j/sFG9bfFJ741RMSZtefuhoMIK/iMmOgk+F08LU6h8R5AWzGeWsrzITiMum9bo/1aWkjPXejj40gSWOlHwk7XS4BUl2c+ZWQKlKA1vVBhalJvRV8+jTJ5QFDcZ13rc2ghCpdOy7tScXvFOyD/5RZpezJJYz7YAhO1o2U0PnZsujHFAgjpguG7JO0IB2Fn8aaPCOdhX9eo9BgEqwUNrcWCpm53lW/a4zcxwoirJkTWzQzzFc0fhJuS2zlw57PbqtdBpFs5kZ7x1svAhLGxqym0Tam5hN+uYudOAWRSOxOBM+52zs+8xddG5jzAf3ZknKvj821f6EV8JG+ZW+8m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUp3ZGdwOVVxUmMrUXhoNTB4dmtWTDREMVo3R3JsODV4emZtTkprNVQrTCs1?=
 =?utf-8?B?MEVVYzF1aE9RVS92ZFAyWTZZTHRxY00yaXZXY2cyQ05LeGhWbUVrU2lJdnRD?=
 =?utf-8?B?RDczOWNjeXZ3Ujh6M3FXUkVrUlBMdjFZWU42ckdFTmlJMHZVV05qbXpkN05q?=
 =?utf-8?B?dGFDMXMxREtlcEFsb0JtZms4YlBET2pKekt0cmp3bDNYb0RyK05hUHA2Q1c0?=
 =?utf-8?B?eXIrMVh6V3VmR25HZ3k1S0hacFFDVWgrOGhtR3M4MTYxbGtPa1hpT2kyZ1Qy?=
 =?utf-8?B?Z0hYR1g2V2R2Q09odTRpQnZ2V0lXVGVVTE5NSUVhazVoM1RkaVNyZnFPNjNr?=
 =?utf-8?B?ZlFGYzBjWE8wVjB1aDArM0VlSVluanJPSWVqVDlkQ1ZKUTdxTEJ4RFNPMjJi?=
 =?utf-8?B?dURUcUoyRk9SVTc1SXJvS2RqRVBuRGNRb2U3bmljaXR3V1ZGUFNCNE83ekFS?=
 =?utf-8?B?RVI3VzlEQVppTXFKSXNOUENNTDdoS1JmeWlDMnV2ZjVRSW5rd1FSSHpqempV?=
 =?utf-8?B?WWU4Z04rdDJnZHFCV3VxdG9UVnFaR0ZDY2N4SDdRVUQxMjF1WVU0aG9OYVFw?=
 =?utf-8?B?UXd6dmVCTHlrL2pjazhvZSt3ODBNVGxSMUJwZU5EMHRIWWR4N1lCSjJOUXFI?=
 =?utf-8?B?NzhkUTcyR0pQWkYxajJ0NGRuTE9iQmVGZEVMbWZpZ1ZIUkROWnlXcWovQmF0?=
 =?utf-8?B?dmVnbkxzYk1kTDZxbThFa3ZGMUJsTnZuRXl2U0xhMFlkTGNucmY2LzlCZmJF?=
 =?utf-8?B?V3B4d2xLSDRyYXUyNDVuMWFMcDBsZmRJM0owTFQ4T2lVUXlBZ2lmWDBERjBw?=
 =?utf-8?B?YzZJU3FRZW41aVNuejNtWTlaMlovSFl2alJKci9BRkM1NVliaGJNeVhWdUd3?=
 =?utf-8?B?TTRyenRNSjNiSUovYllWbzRtMmQ2ZFJJVzQ1T0I0dlRDR3lPTnUwNENERndx?=
 =?utf-8?B?cU5UUDUyREJNWkM5SERpVzNMU1VkUW0xaVJzNjUwa2l2ZTAvb1cyTzJnSjJa?=
 =?utf-8?B?ZjM3aFlXNWs0ZkFscytPZzFSaU5IMzdROWNISWI4R2N5bWZPd2NUV1g0RFA0?=
 =?utf-8?B?b3oxZGJaOXc0VUxESWRZdjlmbFMrK2xkbzN5YmoweDl5d0Vwa0c0cDM1RENz?=
 =?utf-8?B?Vlo1VlRncEdQa1BJZ0h6WURCVTJYeTdqdG1NVXA5RmF3KzhvR2lPWTVtaHRp?=
 =?utf-8?B?THhhV0oyZzdwNXVvVi8xeUErbjFzbVlZNndZbVFtTjJpQTByaU1mbTAvdEhr?=
 =?utf-8?B?cFRCNHVpbldBSkVldHhKdWttQklkeFNqdnhxYmU3YXpkazBCbk1xUCtMRExW?=
 =?utf-8?B?MThRbU1IdDdpRUdNTTdmeUJ1Y0pmL2hFTUtSazlOZUNTOHlyeHo2UUVnWnhN?=
 =?utf-8?B?YU5zcTF3RCtWNFN3dlRlZW9ubUl4QUo1VmUvcHhZZkRzRVhJdGdGTlJPUk4v?=
 =?utf-8?B?WGxRaU4xLzg0Y0hMZDU0c1M4M3BhWXl0SzRjVStwc3BGeW02d25WRmo3Y3Fs?=
 =?utf-8?B?QnRPMUxZejdJZnAwcUtmOGo0emlvQnZhL0phK3FTQ3p2ODBjaUZxdEdMSUxX?=
 =?utf-8?B?RnQ4TjNLY2czQ1FvNS9CVGtBOVlyT0VsM2RQajNTeTlhOHRKSFBpK2RVb2Zy?=
 =?utf-8?B?MENjK0ZPeXVGaVJWbGlxNXpsWnl0S0pIdVpmejVjUENuOEhxLzZyVlVmTW5W?=
 =?utf-8?B?U1ZjTUxUSmxta2U2WDBaVG1zbmVDU3BDRTdaUkw2enA0bm1UWjlRcm83VEdw?=
 =?utf-8?B?S1lKYTQ4d29sL1FJcjdvWWtHb2hsb3VaYnh6WjUyOThQSzkwOWhyUXBhNnh6?=
 =?utf-8?B?aVorZ3FKckxzc2RkZTZqa2NBWE1Ha3ZTNWxyVnNadStKSTlqZW16VjFQcDFM?=
 =?utf-8?B?UGRHQXlDZUdGTVNmMzQzV29pOW4yVEZ6LytCVzhGdHNKenFTeWhPMHpWZTlp?=
 =?utf-8?B?aUxWSXhrV1NsaUpUTXo5S1dUaDl5TWc5R090WHY0ckRoVkdWWkxiOVE1Ky9I?=
 =?utf-8?B?c21FYkJMTzA2TjJkd0hGZWhNNFUzS1BCRDlnUmdZdHAzdkM0TjdvTEV0UGhv?=
 =?utf-8?B?dDEveEdnNGN2OHlwc0FTZlAxc0l4Sjk3QzVCa1Z2Q3FKOHBwREFvQk9pOW9P?=
 =?utf-8?B?SlV6UVdXSTFqS2hKTkx6T2QvbHZYc0ZqeFpBNXR5WTlEdFNNQ0lhenE0VHM5?=
 =?utf-8?B?NlN4cVcyVlZyZnBQRkF6QXMrRXB0bHZkUFJaYWxzZVo3Zmw2cm5hNUt1SS83?=
 =?utf-8?B?THBadjhhQzBnYVdNNW5xZ1l0YWU5V0o2VGNxQUFCUlA3N0FweTlaK3ZUZ2RT?=
 =?utf-8?B?OW1NMGJpUGQzWVI3ejZoU2dIdVBmTzJ4Q2FJTVJ0N2Q3N2c0aDV4V0Qwejgx?=
 =?utf-8?Q?YnJJvp5uuJR5U+QXqOZ80+9T6n37w4NDQATRv?=
X-Exchange-RoutingPolicyChecked: I+I043x5C2ShGy7Q5nI8JWfevmFyGaC1qDSvRn1v/iOmm+Qm2OYHPfWHBTOdujcZIGL+3Vif/6v0HxBwS7KR1S0vkja6FrmUT9+EEHIjJZVzOawD8j/Ry3Kni+aDZpvmS5PsCB6yE0jiBmzXR/hrQREvpcJMexUfyMpTGZ8C7QYga61R22LYa4++VnJumRYlWF0adjz8CVXAUdfvMbBofRGrnrKtcHPrawnJd8OyBXGlO6gGR2BX+qxiAXTWWw3QryA+0Qsqw/tqBb4sgXsLxmZB8mNHH5JXmMCu6UeEW3WspKlCpc2FbKqrjCBZUKR1DmEz8t4ewLyzn5gA/4hOVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b199d928-3b08-4f06-9b97-08deaad0a27f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:03:39.1490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TewiM3tKKm43ET8POg3tUhgOXjHJ+gTbhm2Ppey3u3KLojXfuSfXdlYtGx6/ia/aXeK9Dl2nQReDynnIL6QCVOqYz2dzCsXnZstpX406dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
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

On Mon, May 04, 2026 at 04:59:26PM -0700, Niranjana Vishwanathapura wrote:
>On Fri, May 01, 2026 at 05:53:35PM -0700, Umesh Nerlige Ramappa wrote:
>>From: Matthew Brost <matthew.brost@intel.com>
>>
>>Add a timestamp in milliseconds to the LRC snapshot to make it easier to
>>reason about how long the LRC has been running and the average duration
>>of each job.
>>
>>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_lrc.c | 4 ++++
>>drivers/gpu/drm/xe/xe_lrc.h | 1 +
>>2 files changed, 5 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 98dc4d0eb61b..d85c712d106b 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -23,6 +23,7 @@
>>#include "xe_drm_client.h"
>>#include "xe_exec_queue_types.h"
>>#include "xe_gt.h"
>>+#include "xe_gt_clock.h"
>>#include "xe_gt_printk.h"
>>#include "xe_hw_fence.h"
>>#include "xe_map.h"
>>@@ -2476,6 +2477,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>	snapshot->replay_size = lrc->replay_size;
>>	snapshot->lrc_snapshot = NULL;
>>	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>>+	snapshot->ctx_timestamp_ms =
>>+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
>>	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>>	return snapshot;
>>}
>>@@ -2529,6 +2532,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>>	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
>>	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
>>	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
>>+	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
>
>Do we need a separate field for this? Maybe add it in a single line?
>drm_printf(p, "\tTimestamp: 0x%016llx (%llums)\n", snapshot->ctx_timestamp, snapshot->ctx_timestamp_ms);
>
>I am hoping we don't have any script that is using these capture dumps which we might be breaking here.

I don't know, but I think it's easier for scripts if the new prints are 
on separate line. Also the intention was to keep Matt's patch separate 
here.

>
>>	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>>
>>	if (!snapshot->lrc_snapshot)
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>index 62beaffba0af..97aef0327fc8 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.h
>>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>>@@ -39,6 +39,7 @@ struct xe_lrc_snapshot {
>>	u32 seqno;
>>	u64 ctx_timestamp;
>>	u32 ctx_job_timestamp;
>>+	u64 ctx_timestamp_ms;
>
>NIT...may be put ctx_timestamp_ms right after ctx_timestamp?
>That way, we won't be adding a u32 in between two u64s.

will change,

Umesh
>
>Niranjana
>
>>};
>>
>>#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>>-- 
>>2.43.0
>>
