Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432BFC624DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 18:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C849010E173;
	Thu,  3 Sep 2026 18:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZhXO+LZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505B410E173
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 18:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788460195; x=1819996195;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q9skNNWlHcwuJ+j/0sCr0RgLpy3fcxeCK6vbp35C9ak=;
 b=aZhXO+LZMc5z3ULZjVAnEOZT6rWtRfguuzHqrAzkS6UdO4RpdVPoyzn+
 sXqswwHJGIrjZatOSOO9zFPHdq8Rf+/T4O/3FuI0MEHiKB57akPysSum4
 tMuFtmerXEXWQPoK45eMkLwyLjSLjKKR33See4/+QtG7xpV+SryaAF5kQ
 Xb+11FFQbpaHHEKMEhkJRF//eTe8w9fvGuUZHGFi8URLy5Dm1txzTCwfp
 IiIodZYQ0b11F2nOko5eKDwDASXl8FVihU320PnhXjBUQLJQCOOKAagr6
 qwRlcUZdc5AxlMFn9FQZrKlcGcz+mIRhbyN1OziPoNzVmQnd9fIxn/enU g==;
X-CSE-ConnectionGUID: N0fE5swURgu3qOhjBfHf4A==
X-CSE-MsgGUID: z8DLxdaQRC292gdykD14rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88799155"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88799155"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 11:29:55 -0700
X-CSE-ConnectionGUID: xNhk8EdGTPSS8BFR7z6dbQ==
X-CSE-MsgGUID: kqt3OeFKQlmP28UtmB9Yvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="273960514"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 11:29:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 11:29:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 11:29:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 11:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izbdlAbiYwiWyOLm/7LEzy3SMvCTY/iXCEWZdvqG/9H/J1KZKzSE2BVo2aX/vLT5MPljAVBmxFMgypaUwTENIRkoZykI4UDnJQLFnHbKeD9UyHyM2CsH1ZF2gkv5B+LE0iR8SgIbVQPMdDtB8kVCQapIdpkkoG7CdhVktsrAJIXUngye863kI6ZZK3hil/XwxYv5gefk7cmhawDhbjehBfpCMvVF7uWspMD8M59euBPHVwYI1BgMd74J2nmGdfHMIz1Bw2y42ikgO0AZNHZoZ4gClMsbnLRjuUNQtL6WzFWIxBdJpuz3k6mcbu7+tfuHgacL+8jFQKsiT9OUSOY7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A476ZheCst2kFCwyNaGWyVL47FPTpTcSIG4ig9aePbU=;
 b=shyvrbRt/01mCzTFGgnuSP4Y5T8KE80Yq0YIx+kRDBfaragkK2oMhNqoqNnVyfNZBACjsqrNvNdir+L9s9v2kTy6xiueJyKe2vw/DlKNSsHeO6RSYzBNrgS+GAl90WwvFP6p7uw4KRvjwW85RefKAIn62l3Pn2LNcNmQinwZ4Rud6itZjL2pGcYZNnPx0iF3yExWjsvYoJJEQY5MKn+9EL0rcG7BHTaTMSOyUuviSguM/FmgKYlKXzPvisEpzfw9f6VZYqvzv4Sfp4GTTNqYDlNhUhqbnmRYEbKFO97GEn2LXycp/wneehoLKUlvlqzuVqE8cMVE+3f+vSobhjb1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by PH8PR11MB9535.namprd11.prod.outlook.com
 (2603:10b6:510:39f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:29:52 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f%8]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 18:29:51 +0000
Message-ID: <9f2c10b8-ff61-40c5-a602-0bd1eb08a775@intel.com>
Date: Thu, 3 Sep 2026 11:29:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle access
 with unplug
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>,
 <matthew.brost@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-2-zongyao.bai@intel.com> <apmeaQJPDe0aryMJ@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <apmeaQJPDe0aryMJ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::32) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|PH8PR11MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: 15909af7-cde3-45d8-6754-08df09e957dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|4143699003|11063799006|5023799004|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 6dUZa7DIYC46U4uy/a4obg0VBespEML6Ro+o/c0VM0XRciKIUrQrgj5iYl8vpWEwu8FxvxSY2gfdUcD64Ys3Sy8McHlTyx2KvaMbpnipraqeoEst3cD6170+UiUoecOOmMF4S/B8cvO7MbRbS6r+DuWcXBMHZINUGN0DuUC5MtbpeUeV1eh3ak3Leo0pMlDsFJKV0PuYTd2uBU7p1eS/R09XMdWAaetQN2l8/fzWQIl2Kh9aJaQMDez1WNHm2RQjE8ldb3jcQrM1bEq3PsVmrhsFFoz4l30eMMNqV8fF4XAtLe8GWxXM3kvBvqqPF44W1ANKUQp4Fp9RMeQHpbQU8LUJBWrsf3eb1kvgugpxKYY4vKKoGkNDAnI5HsOQ6ZpuuWVHp2855q7L1r4UtR5H6c8BUZoqe8DL33dcjzMOtLoTnP8MXh0Aa+f049fZgdQQywdJmYxd0PHi+6E53mab7ux2Y1XHVfUjWuDdn9scmyySQRCqC28iiGn8ym1MNO/sLTfBu0gJN/4lnCEkOV8V9z0i/ijjGWmfO7Wgua2HPfpts/zYffAIT6m6VsMeCagdTx7ST47upqS9WEqSPzo4GiNoPT1bLjHilhha+Z3FM1CJpmNzmx6T/T/0l8Fuk7XClj9RC5qgpWEpdd3fqhFQWlrC8dtpmZ7GOZku/azY0so=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEU2bmpKcHVJNERISzQ5Y1VjLytPeWc4amFzM25ZOTdmN0l5elNDQ3VkQThR?=
 =?utf-8?B?aG13YTdoQk5nWnA5NndydGF0U0xqaE84c1E3UWtUR0JVT09xLzdBd1Z0VnhD?=
 =?utf-8?B?UWt4Rm0vWGQ4SHJ3WFRSZXNnQnFUWnlGYVRLTUswTVE0Uzg1MG9NY3hHRkJy?=
 =?utf-8?B?cCtKTElCMFIxV1hxRXVjMmE4SEtwdXQ1SWV0SVBEbzQrS1lKWWE1bmpOZ3pN?=
 =?utf-8?B?ZjNJT2ZhL3UwL2p0OGNtYTdndm9hbGtwS2ljWXBmKy8ycWVIYjQ2Q1lFUFN3?=
 =?utf-8?B?NGZyajVFV1FNaWk0cEEyTzc0Q0w5ZERqVjRLVGFJVnZ5U2k1bFo4MVBWcTYw?=
 =?utf-8?B?L3hlaVFnblhWTlZLanRXNHFHbXdhOFZrbm1MdXRpc1F4dlhITDJ3c05SemQ5?=
 =?utf-8?B?S09kZWlQSzVUQXhIeWxFZnROaUNlMS9VbDNOSktBNFYzS2VhSS85MmNpSWpD?=
 =?utf-8?B?T1BmaG5GVGxUSkl0KzdnRC9xajBLYzgwT2ZQZFJlT0VQUUlUbDV1ZmdTcHJD?=
 =?utf-8?B?bEliY0NSZnRBTGpxUTFiKzNVT1Yzc1BBZDhWZm5mNVlQU1lPMEFad090NVpU?=
 =?utf-8?B?WDFUN3g1RlBvY1M1Ym9nK3dBYUg3aEdNOTZQNzFZT3hTdXJST0lEWWRJQmxG?=
 =?utf-8?B?eDlIVDc0MEhlQ3E0OERST0x3b1oyVitVZVY5U1VkWjd1SXVZdkNKR3MxS3pm?=
 =?utf-8?B?YUhtNXBQczhvb0dEdmxoL3lUNDRBYTlsdHZoOXBoUU03MTZMbW9objVXZE1S?=
 =?utf-8?B?TkxNL2xVc3o2R3ErTHdCRUIwWnBsYUxvejcvdnd1RHZTK01zRXN4L25HbnF1?=
 =?utf-8?B?UjlLVUJZWkYrNDhiS0JtU1pZdzFhYi9vRXdVSUtZMVRmaUNRSmZ1N28rQVR2?=
 =?utf-8?B?d2dYaW9KcFNnQ0I0MnMrTzA5MHQxeFdocXYyTC91Q2liTEYzYmlTNSthc3BT?=
 =?utf-8?B?d2lNM0t6OTdtTnVCUUgxb2xYbm00UEVCTkdzazRnTU4rOTZYb2xJODB6SWhh?=
 =?utf-8?B?cFVPZnF3MlU4d2kxaWJRd2F3bXhsdUM1VERIaW9iYlFIRlpRY081cHRzM255?=
 =?utf-8?B?VVd4b0NDbW12ZC92emtTekRvRzlNWGhhWVVONnVWazhyVE96YUtPYytiQXlq?=
 =?utf-8?B?U1k0MURQT0hEQlNFTjVIWHNleFNSY0hIZCtBZWhBeUlVMXlZRnpKNW1jRXJy?=
 =?utf-8?B?WlRTRm9yRG16bm1SdGNIRnV1RDJVT0h1YXo3QUJzdGJ3azYvZ0pmN3BOWTBG?=
 =?utf-8?B?dTFUK0JKaTdvdkdDa1dBdCt4UUVCN2VZYTdIQzNnZ1Bzc1NpSkFCNFpiV2hQ?=
 =?utf-8?B?MnNrSVpPUHNJUzNsV05qc3NGVkpKLys5TnhQUXNBSW5EWTF2Mk5EQWhDaFNP?=
 =?utf-8?B?bUlZYUxDMUhRdW85aW9BZTY3M3MxTE16Y0lRSXQ5WUluWGcrZGVpcWhZYnBk?=
 =?utf-8?B?OFNTSE9zVzAzNmlYNTBLd0VlSE9EdEVnc1hUZC9iTnM0Ump2RDRZRHJJMjY4?=
 =?utf-8?B?YWtFdklDVkI1Sk5DSnFwSlFmZjVBYkY4Zjdlb0FKNHZ0ZHlVRlRlendtK2Vs?=
 =?utf-8?B?TjZOL0NIczdyWkdyZnVRMTc1djJvOTg3Q3RGZk5VU2x4dEtDa3NFYStHUkdJ?=
 =?utf-8?B?WTFXaFJNVEQxYUg3cHd2RFhPMXFOL2NWeXN0aytUeWdUbUxPN3U0NkFtcnlt?=
 =?utf-8?B?K0pUaExZZ3RHOFJwcFR6Ry9JcmJaMTEzSjd0RDNuSzZURmRHWkw0QXoweDBG?=
 =?utf-8?B?N29nV2F3b2N6Ymk3UzJCVmhVQTAzTXRuSXViRVhOd3JhVUlocVZ4OW80MElq?=
 =?utf-8?B?MVdIZmxoeWVkYWpDb1dzcCs0T2pVY1FJMzRqK2RWaFR2ZXllazFzYndXRE5W?=
 =?utf-8?B?M0lLcjhycG5Da1FpTHZaNDJwQ2FORkpjK3Y0S24vVUx3UjZvamxnWFdoYUVD?=
 =?utf-8?B?VTNXamZ4N3BMdXhkOFV0dkt3YVNicWJTTlJVSGJQVExvM2I0UDVXSUpwc3N5?=
 =?utf-8?B?RDlINnpHaDhFZUwxazhUT2ExbzZQMWdIeGxCWmIxbzUrTUtQY0hqNVM1enJH?=
 =?utf-8?B?a3dRTG5uMUwzanJ4TGdYTHVmTi9BdTNPd0VwcTZEUmhmd1hLUHI5VWIzK1dm?=
 =?utf-8?B?Z29HKzA3UVl1NmE4VnFteGJHNDRNTDU4YjdWcUlWWmtXdElLaks2ZHdabUQr?=
 =?utf-8?B?RllWWm0rNFl0L01FQXk3SG5PNjNPWlpxNms4OGRocFBVbi9Sc0RFNEVMY2sr?=
 =?utf-8?B?Z1dZVXRZMUFpUEdlR3FxSXo0MlQycVpiNkJwdm0reTJyZ2g5dkROM2d2Z0JF?=
 =?utf-8?B?eEJqSFVDUTRRVHlTRUdZSXlzU3Vtd3QybFU2WnAxRUZXWG0rbTZsUT09?=
X-Exchange-RoutingPolicyChecked: HnWfRTk3N3RuMwM5Nmi9Wgq/s2ZvQvoBj7xtI7REM5HVUlbKFA+byvF44kkh+3DbRSZuyhcJ36gYjoJpZ0afU/PFqVjGNScwOlI7dXa3pjUAe9SuySJs0rkMc6TcSxHcwFZVKcZ1TOu0C05rebdZHAO2vBdT2NVqCj3nwvwanHbDWSFJqqwdLjnh5kcLE2ljCQUys/rOS2g5SMM7laEex39JGyuEww6fwUkcC+i9xP8qYjyEZLZHzPTrL/j95gMjP0+kO4n0vbyQRrldQpK36snrSYbEWxr5yBxO2Qidpoe4VAoIgCClmOxqbZRAWslIx3rR3HU+xT/HyfE1SxfzUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 15909af7-cde3-45d8-6754-08df09e957dd
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:29:51.7736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ytiWDsEAAocmPaKcs4KtLyOoXws8tEcJuGpKbTp6NCYQsDtk2viTbeIjTzqJPxv/eM/qEES1e5QeBhc64FMzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9535
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


On 9/3/2026 9:20 AM, Rodrigo Vivi wrote:
> On Thu, Aug 13, 2026 at 12:06:51AM +0000, Zongyao Bai wrote:
>> Prepare engine-cycle queries for delayed forcewake release by
>> protecting their forcewake and MMIO section with drm_dev_enter(). This
>> lets unplug wait for admitted queries before flushing delayed-release
>> timers.
>>
>> Use drm_dev_unplug() on post-registration probe failure to provide the
>> same synchronization before teardown.
>>
>> Assisted-by: GitHub-Copilot:gpt-5.6-sol
>> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c |  2 +-
>>   drivers/gpu/drm/xe/xe_query.c  | 34 ++++++++++++++++++++++++++--------
>>   2 files changed, 27 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 71111ad32465..81b31325e581 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1166,7 +1166,7 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   err_unregister_display:
>>   	xe_display_unregister(xe);
>> -	drm_dev_unregister(&xe->drm);
>> +	drm_dev_unplug(&xe->drm);
>>   
>>   	return err;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index dc975f595368..3c356bc48e2a 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/nospec.h>
>>   #include <linux/sched/clock.h>
>>   
>> +#include <drm/drm_drv.h>
>>   #include <drm/ttm/ttm_placement.h>
>>   #include <generated/xe_wa_oob.h>
>>   #include <uapi/drm/xe_drm.h>
>> @@ -123,6 +124,7 @@ query_engine_cycles(struct xe_device *xe,
>>   	__ktime_func_t cpu_clock;
>>   	struct xe_hw_engine *hwe;
>>   	struct xe_gt *gt;
>> +	int dev_idx, err = 0;
> use ret instead of err, then...
>
>>   
>>   	if (IS_SRIOV_VF(xe))
>>   		return -EOPNOTSUPP;
>> @@ -143,28 +145,44 @@ query_engine_cycles(struct xe_device *xe,
>>   		return -EINVAL;
>>   
>>   	eci = &resp.eci;
>> +	if (!drm_dev_enter(&xe->drm, &dev_idx))
>> +		return -ENODEV;
>> +
>>   	gt = xe_device_get_gt(xe, eci->gt_id);
>> -	if (!gt)
>> -		return -EINVAL;
>> +	if (!gt) {
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>>   
>> -	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>> -		return -EINVAL;
>> +	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class)) {
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>>   
>>   	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>>   			      eci->engine_instance, true);
>> -	if (!hwe)
>> -		return -EINVAL;
>> +	if (!hwe) {
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>>   
>>   	fw_domain = xe_hw_engine_to_fw_domain(hwe);
>>   
>>   	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
>> -		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
>> -			return -EIO;
>> +		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain)) {
>> +			err = -EIO;
>> +			goto out;
>> +		}
>>   
>>   		hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
>>   				   &resp.cpu_delta, cpu_clock);
>>   	}
>>   
>> +out:
>> +	drm_dev_exit(dev_idx);
>> +	if (err)
> oh no!
> never to the if (err) after the goto! Sashiko is absolutely right!
>
> ... then you move this to the very end and simply:
>
> out:
> 	drm_dev_exit(dev_idx);
> 	return ret;

Thank you Vivi

Got it.

I will try to remove goto label to met both of the review requirements.

=====================================================

Re: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed 
forcewake release
 > [Severity: Low]
 > Does this code mix goto-based error handling with scope-based cleanup 
macros?
 >
 > According to the cleanup subsystem guidelines, the expectation is 
that usage of
 > goto and cleanup helpers is never mixed in the same function.

Yes, I agree this is code style issue,
this function contains both a goto out and the 
xe_with_force_wake_delay() scope macro.
And this issue is introduced by path [PATCH v5 1/4], but not in this patch.

It may need split query_engine_cycles to two to avoid goto.
Since this appears to be more of a coding style preference,
I'd like to wait for consensus from other reviewers before updating it.

>
>> +		return err;
>> +
>>   	if (GRAPHICS_VER(xe) >= 20)
>>   		resp.width = 64;
>>   	else
>> -- 
>> 2.43.0
>>
