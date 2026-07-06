Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A355C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 08:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D94210E815;
	Mon,  6 Jul 2026 08:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atWX1Sqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9218E10E814
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783326798; x=1814862798;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Eto/Vacuoc6LKWgywcAC+YXrOb6m07RtCBRxjWUm3R0=;
 b=atWX1SqfxTwLz4qUAq7cLrRcmv7YJFQsUGYCqwkUTb3Nr58ZkdUY6fSc
 PELU9TlQC9+/bAOp8jfXBYI0FHk4VrOpx7v2D6bF2gK/X27difYYMb/vM
 RdTc9fg8Kc/8x+2jHBB+Zi0RiUCs+Wyy8JPy8oSlj2n4vXUx5wjVSB4q0
 19bPPB3R6hJCvYgIa4X4wVM6bNeEdhMf3idstCp66G8+UzlMzWtK3eSr4
 LnfrLxlmhehaHEhG58HTlxw0QVoM4GzMjYzHqIUugQWgB83ywWk8xrC+f
 Tt9bL73Z/pIOVEcMI46uJbWiLFpIevxAvGZeXHBr/EwM8ioLsMqfCVD6y A==;
X-CSE-ConnectionGUID: NoShJ58uQdKaSavhC+xDGg==
X-CSE-MsgGUID: lo96ZirNSHGBK/ZSvoRIKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95463126"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95463126"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:33:13 -0700
X-CSE-ConnectionGUID: 9isIWNBuSYqSlWRZgDFSIQ==
X-CSE-MsgGUID: 93EnXmG5TZSlLkWsh/g0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="258550897"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:33:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:33:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 01:33:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK/wfdjntGr6aib3yuroR+9BTb5X4XwGnfA85tif6dWdMLitOSrAv5eIqk184lRnI6ho/6PowpISxZqFWkdvOBHTttTwF7VndAkWlO6G3eKlMEpf/ODgUh/2N+h4TT397Jt8yk6+AD3ZuGbp/PjXXqo2SVsS7Ark9cB5MZmB12WgqxvGC19bW/u7VZoIIz0N2cI2C6cy0+ugHs7qSCnxGqt3Rr0laYUts4bItYa4wpIsTuZ96m8GqKmePaVp9TOupBIkoWc6Nl3ZXA68jmT1Q+sZxjw/tDtamzwSZyGdiaS69RFSmOEAArYIzYomLJkpfeOntG/MEkmRatzEXMXQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71Ou1kJ2ShgMFfSzGW3E/8RBxp+Rqv+SFa/ME3TrUAs=;
 b=F7Q1nDIkmUCoDR2xyEpt8XOnPyy3BblTDXBBV9eMisM0sIudZcB8P+GuWS/2YUhdJsmZ2s3X6B+L82gEG+VWWBxaKJl7cvp1JORYO71Gg1ck59acflJOR/S3OccqcuHmOW6+uVJn+p5vEd4NyP7S3J/XYB+nkpz7p8WbmGOHupc6DVnkQbOFeXzsZb8S9f5nax7Es+7349agBc/F4+y8WbO2e3DTih6Ok+KoiNSSSg6bw2ty5axJ7+Q13FqWPODB8PzDd01SDofpU/32RWQXVxSA2Codn/WS9xgIAJtRVkta4dxFk9hB4Hnn1v4zPi3sotRWT9TOnXa/Oyy4o53Kow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Mon, 6 Jul
 2026 08:33:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 08:33:08 +0000
Message-ID: <886da27a-3807-49cd-8f8f-c48e5ca10eb3@intel.com>
Date: Mon, 6 Jul 2026 14:03:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/15] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
 <20260608084700.640376-25-riana.tauro@intel.com>
 <2f605dbb-7bb9-4b19-bf84-1fe100753e2c@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <2f605dbb-7bb9-4b19-bf84-1fe100753e2c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 333d2815-c759-453d-afce-08dedb3934fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|5023799004|11063799006|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 4x45ME3np/NMCHeDwCKTe9K3AVvYTHe9DNZBBwyxaMOFopB7bbAlJal+HG+jSskhw+Y/7P9kvgiyazT5QuoHJ0yynKV69fStqTFZfhfhyVXI21sl9mUpD8xZTemR3XcBaqj1ivGU6R6XCkYMKVblOrgETF38/TWBmm+ijbg+iNzmzzKHP8pQh55i3ahqyqHbqUWDm22qpSwDWbqUnte60GgZNduovLCqZ0itucAsrj3Jf9g/uSBvZx9OXhFsIms4lttHBVKg7ikAgV/zquUy/Owh4tI0HG1zafstPxOidlAnWCiGdBjp+tWYs5jNtXF/LzAYZR93mFkI5WG/UtNozZEjjXauIfCRNMGmRz/RN4FxqKgHnTjK4GRuSfJwlpbtTvRROcSPHMz3iexBfgJOIxwc0V3SgSx9eSp0ZY642gbHosKSPttoG4ikiO0E0tTXfiyHHHX7rJbra2ugZE9BIF1l18JQ9Zip+l5rTZqfpCu7Gzo8GkcXJ4D+vZeGkaInZRdQcLIP9mbAzzd33y7RGLYsg0HE5bwUucCp5SaGCCw/MytkfWYG1R9rcC6rjDdiM7l/OtiaGAkUTskfwd5jZwL+NOdcpIgX1u3FBx9pDe3UMsoe/XtSXoiolDLPx4fyBUIg9KrXA0TtXqZHPefpU+lX9o0qYTfplNYFrarViWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlnUS9BWW55WUJ6Nmh2VTA2aTBpNG5BZitCOVJ0cjJ5QWZGOENQeUI3VXFu?=
 =?utf-8?B?OVRpaUlQdkJVT0Fta01UZXl3STdEMTNXdnZ5NXdVKzZHVVJLOS9tbmxPSWRW?=
 =?utf-8?B?a0dFRWtwekF5Y0dkVlNFZDhycnE0UER3SEpabFRvUUxWS2FLYzRQNkovM1N1?=
 =?utf-8?B?c29ReGw3OS8wRlZiLzFGa3ZiOFdvRUg0YkVyZVZSZll1Z1VKeVkvMnAxUkFs?=
 =?utf-8?B?NUJpdTdxYm9UWlBNUkpEczl1bW1hT3EyMmNsSU4rdXhPZ1ZmaWxybnN3bTdQ?=
 =?utf-8?B?ai9NZEhGd3p1QnFJR0s2dlltT0R4NHNRVFdjMUp0YWRLRDJQMG5HbXVMRGlE?=
 =?utf-8?B?QWFTMkVmTkpBcE1ENFNTL0tucWlES0ZUR0NoblpzQ1hrR2FTUGJxMEVSZGtO?=
 =?utf-8?B?SDR3NHJkMmpkeUwrVHBHZ3JXZW03NkFUWGRSL20xR2pYR2dTanBRY3hiQTlK?=
 =?utf-8?B?RVFGbTRKUmFFQUdZZzB1U2QwOWhTbjFseTlaeWJHL08za0pzdnZTYldWUjNv?=
 =?utf-8?B?cTJtUHBCTyttNlFlQ0FjQ1dHZ09ZS3NzK0VCREpJQng5QkIvaHo3akpCMkh0?=
 =?utf-8?B?Z204T2M1d3h0elgzSElDU0JsaDlpcDNFSHIyVitsU0ppeFkvN2VOazd2UDg5?=
 =?utf-8?B?a3RocWNpekV3RUpSbW1Ca1BpVlFiVXBKZXhSTGJacUR4MmpuNmNCcThTZUc2?=
 =?utf-8?B?T3FXWXJnQ1hqSkx3NnpiVE5OYllERlFpbUJrc3RsR3RSdlo2dW9wam42Zk13?=
 =?utf-8?B?alIxMGdvQ2NTbENJbU82S0ZKR2FoS21qbXpxYk9qOVJLdXMrc0wvS2lld1Ay?=
 =?utf-8?B?TFRMamd6Z29SQVJiS3dydzdRTlE4UGRXdk8wVENiRFFtUmx5Tlh5cXdVVFhm?=
 =?utf-8?B?ZmlrakRhTSsrem1HZjRQMjlnZ2JXMnlpWU5hYlMvalNGaUlTRUQxMnQzajhz?=
 =?utf-8?B?a2ZtVDEzTkd6MEJMWWFDZDFnSitVU2hwNzB6b2JSMkw4V1NMbU5PNjVaYmZO?=
 =?utf-8?B?TUhkSDZFdmJCdEdwbG5vbkhnVmwxVldDWUZIWnE3MnUyNFhqVlJEZGxIMjRW?=
 =?utf-8?B?VWNRYkRCYzdIQmNXb3hzNmI4M3I3MTR5Z2V3ODR5Y2U5TmpYcUw4U1MyZ21C?=
 =?utf-8?B?dXdBSUJldGZ4WHdhaVVFQ203N0J1ZUlicU9lQ2RmeVl5alpCUmhZcGppdnJK?=
 =?utf-8?B?Z0ZmaEg1dis0NUVGTXFvQXBCNHNLMmhZWGV0czk2T3h3TmtqQXNFVndGaERk?=
 =?utf-8?B?UkpSRG94bElxTDdPUG84am8xU3FaZ2Q1eW5yUGdsWXpYNjlyVnF2WEV6RUta?=
 =?utf-8?B?eGtOdmxkVVJXQjd3MkpQeWorN2pET0RxaStrYkhVTW1ReUNVRzFoUHFvb28r?=
 =?utf-8?B?MDdTRnVJT0tvM1ltUXJSSFZXdlZmeHBjN1lTQVluSENKOTl1eXVVbmRxODZp?=
 =?utf-8?B?TEQvbkYvblZ4a1ovZDlLa2dBR3l1UHczZVBEbWRuazVBWEdHRmdzNlJKekNE?=
 =?utf-8?B?a1dSU2JvaGx5Ry9FNTVjcTlpbDVHQ1hoSmRJQ2hVMG1DbVlSMitVYXMzd2U0?=
 =?utf-8?B?dTJob0oydEFaY0cydnVTMTdyMlRaMG1ocHlBY09HSVlhL0dwcGcxSWZRZFJ6?=
 =?utf-8?B?bmNSVUFwVXZtV2RvTGlQU3gyVGwyQXZsYU5qMUFRUmpDVUxTeDUzVzRJN21v?=
 =?utf-8?B?K21xckVZbUU3allJUjY1S0tSOUY0dytDOVkwZUhmeW5KWWVCNjIzUXM1ODFR?=
 =?utf-8?B?VGZxdytDcGNjRDVTRDFRWDU2YWtReUxQa3BBNC96UnZTaXJpaGZ1NG1aL0Y4?=
 =?utf-8?B?VmVaRWludzFIbjlSTExtakR2bG02RTVUbXZyWWcvWGQrYlBEWU9EL2ZTOGZB?=
 =?utf-8?B?R2FvQjJkL1ZiYXZoUU5aUmxiNlQvaXQzMlZDdHcwcENaVG1NQnFRNFhkZkR6?=
 =?utf-8?B?UVRwZkhqd3ZsbnpOYUFUQzlpcGpWRWNtZzAwTUZ1dC9aUmdlb0wxUytKMnNO?=
 =?utf-8?B?S2dvYUZkVDVDOTZsOFZPa1NibFNEV0VuSXFzUVdoL2ZZRmhieHlkRkQ3eCtE?=
 =?utf-8?B?dWI4aUk1bEhMNnVralFVb1RVbWlhMlJCazE3bGlFMjZiVkdpRVhmeE4xOVRr?=
 =?utf-8?B?RExUblFtOXdPaFlqVU5TWGtrMktZa0lIRnBFdGdmcGE4eHBzZFhIQUdLY2hX?=
 =?utf-8?B?YTdRSmF2Zi90N2RVUkg3Z0ZIRGJXdFpkeFB5ZTVuaFZ4c3g0Mzd5RmNqZjNX?=
 =?utf-8?B?VUc4cE5mVU5QMVBvU1c1cy82aEkwbituQldrV2NuUGRta0hwa1E3SHJDMmJi?=
 =?utf-8?B?djg2Yk1icFBtUERoVGZCRnlta1NscE1TVVZNck1uc0RMNE9IYmhrQT09?=
X-Exchange-RoutingPolicyChecked: WHsB9KyZNq0HmbZkK/gjKwqoyWkEaJVGwECQ6dvcwmycbfOWNcToORky39BNVw/5NjxgiFMEvVD1qYzRmpOt6b4JN3prTm+cfOBUcMQWSUnKQIqbQDFJKC4CmdIkKyJCpliLV3aFRr0HzbJZGBHVKzKlHJ7gByXF5H4ka1lBkx1GK8ZWfKTKI7c50ecIXCSnBlI3dJSJrRgr7sH/mREz4/FWL3mZUVTTMDaHk+s2WJA2vaHbmIxn4ggNBuSv95BR1CpVtGzpY+EqdmmClG+FhJPtQaGBtlHIgG9asVIW/q+xlP0+QyKy1AfLIvVJr7CjRW3wizkI+GwQrXZmzQsYtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 333d2815-c759-453d-afce-08dedb3934fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:33:08.6065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NOmFICeB1bCe5EnAkI3RNnLfVJJZTtodBMiM3Ecm8/Utt8Mr+tG8Mqe8jsoSIHASc2xhhJCwffcD98+GUS6fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
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


On 12-06-2026 07:13, Mallesh, Koujalagi wrote:
>
> On 08-06-2026 02:17 pm, Riana Tauro wrote:
>> Add structures and command for get soc error and process uncorrectable
>> core-compute errors.
>>
>> Uncorrectable core-compute errors are classified into global and local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without disrupting the rest of the device.
>>
>> Upon detection of an uncorrectable local core-compute error, an AER is
>> generated and GuC is notified of the error to trigger engine reset.
>> Return recovered from PCI error callbacks for these errors as no
>> action is needed.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add newline and fix log
>>      add bounds check (Mallesh)
>>      add ras specific enum (Raag)
>>      helper for sysctrl prepare command
>>      process all errors before deciding recovery action
>>
>> v3: remove TODO from commit message
>>      remove redundant rlen check
>>      fix loop
>>      add check for sysctrl flooding (Raag)
>>      do not use xe_ras prefix for static functions (Soham)
>>
>> v4: remove rlen initialization to 0
>>      remove local variable
>>      add error message for length mismatch (Raag)
>>      reset on sysctrl flooding
>>      fix sysctrl flood condition
>>
>> v5: rebase
>>      modify log and move it to process_errors
>>      modify sysctrl flood check
>>      remove whitespace
>>      simplify structure (Raag)
>>      fix typo in commit message
>>
>> v6: remove xe parameter
>>      remove error_class local variable (Mallesh)
>>      move prepare_sysctrl_command to sysctrl layer (Raag)
>>      shorten structure member names
>>      rename count to remaining
>>      fix sparse warnings
>>
>> v7: rename sysctrl_build_command (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 110 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |   3 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  55 +++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   4 +-
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   6 files changed, 201 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index c846e98ec6ab..005db8ab9622 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -9,6 +9,11 @@
>>   #include "xe_ras_types.h"
>>   #include "xe_sysctrl.h"
>>   #include "xe_sysctrl_event_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +#define CORE_COMPUTE_UNCORR_TYPE    GENMASK(26, 25)
>> +#define  GLOBAL_UNCORR_ERROR        2
>>     /* Severity of detected errors  */
>>   enum xe_ras_severity {
>> @@ -66,6 +71,24 @@ static inline const char *comp_to_str(u8 component)
>>       return xe_ras_components[component];
>>   }
>>   +static enum xe_ras_recovery_action 
>> handle_core_compute_errors(struct xe_ras_error_array *arr)
>> +{
>> +    struct xe_ras_compute_error *error_info = (void *)arr->details;
>> +    u8 uncorr_type;
>> +
> nit: Static check needed.

Sorry did not get this. What do you mean by this?

>> +    uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, 
>> error_info->log_header);
>> +
>> +    /* Request a reset if error is global */
>> +    if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +        return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +    /*
>> +     * No action needed for other errors.
>> +     * Local errors are recovered using an engine reset by GuC.
>> +     */
>> +    return XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +}
>> +
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>                         struct xe_sysctrl_event_response *response)
>>   {
>> @@ -92,6 +115,93 @@ void xe_ras_counter_threshold_crossed(struct 
>> xe_device *xe,
>>       }
>>   }
>>   +/**
>> + * xe_ras_process_errors() - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: recovery action to be taken
>> + */
>> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_get_soc_error response;
> Zero initialization required.


This is memset below. That's' why 0 initialization is not used.

>> +    enum xe_ras_recovery_action final_action;
>> +    u32 remaining = XE_SYSCTRL_FLOOD_LIMIT;
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +    /* Default action */
>> +    final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_GET_SOC_ERROR,
>> +                  NULL, 0, &response, sizeof(response));
>> +
>> +    do {
>> +        memset(&response, 0, sizeof(response));
>> +
>> +        ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +        if (ret) {
>> +            xe_err(xe, "sysctrl: failed to get soc error %d\n", ret);
>> +            goto err;
>> +        }
>> +
>> +        if (rlen != sizeof(response)) {
>> +            xe_err(xe, "sysctrl: unexpected get soc error response 
>> length %zu (expected %zu)\n",
>> +                   rlen, sizeof(response));
>> +            goto err;
>> +        }
>> +
>> +        /* Report if number of errors exceeds the maximum errors 
>> supported */
>> +        if (response.num_errors > XE_RAS_NUM_ERROR_ARR)
>> +            xe_err(xe, "sysctrl: number of errors received %d out of 
>> bound (%d)\n",
>> +                   response.num_errors, XE_RAS_NUM_ERROR_ARR);
>> +
>> +        for (int i = 0; i < response.num_errors && i < 
>> XE_RAS_NUM_ERROR_ARR; i++) {
>> +            struct xe_ras_error_array *arr = &response.arr[i];
>> +            enum xe_ras_recovery_action action;
>> +            u8 component, severity;
>> +
>> +            component = arr->counter.common.component;
>> +            severity = arr->counter.common.severity;
>> +
>> +            xe_err(xe, "[RAS]: %s %s detected\n", 
>> comp_to_str(component),
>> +                   sev_to_str(severity));
>> +
>> +            switch (component) {
>> +            case XE_RAS_COMP_CORE_COMPUTE:
>> +                action = handle_core_compute_errors(arr);
>> +                break;
>> +            default:
>> +                /* For any other component, reset */
>> +                action = XE_RAS_RECOVERY_ACTION_RESET;
>> +                break;
>> +            }
>> +
>> +            /* Process and log all errors and then trigger highest 
>> recovery action */
>> +            if (action > final_action)
>> +                final_action = action;
>> +        }
>> +
>> +        /* Treat flooding as an system controller error */
>> +        if (!--remaining) {
>> +            xe_err(xe, "[RAS]: sysctrl: get soc error response 
>> flooding\n");
>> +            return XE_RAS_RECOVERY_ACTION_RESET;
>
> We can use goto err.

Sure.
Thank you for the RB.

Thanks
Riana

>
> With minor changes
>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
>> +        }
>> +
>> +    } while (response.additional_errors);
>> +
>> +    return final_action;
>> +
>> +err:
>> +    return XE_RAS_RECOVERY_ACTION_RESET;
>> +}
>> +
>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>>   {
>>       struct pci_dev *vsp;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 8acfd0ffe48e..8d106c708ff1 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,11 +6,14 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>>   +#include "xe_ras_types.h"
>> +
>>   struct xe_device;
>>   struct xe_sysctrl_event_response;
>>     void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>                         struct xe_sysctrl_event_response *response);
>>   void xe_ras_init(struct xe_device *xe);
>> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device 
>> *xe);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 4e63c67f806a..3ffd7baa7a8c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -8,8 +8,27 @@
>>     #include <linux/types.h>
>>   +#define XE_RAS_NUM_ERROR_ARR            3
>>   #define XE_RAS_NUM_COUNTERS            16
>>   +/**
>> + * enum xe_ras_recovery_action - RAS recovery actions
>> + *
>> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
>> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
>> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
>> + * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
>> + *
>> + * This enum defines the possible recovery actions that can be taken 
>> in response
>> + * to RAS errors.
>> + */
>> +enum xe_ras_recovery_action {
>> +    XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
>> +    XE_RAS_RECOVERY_ACTION_RESET,
>> +    XE_RAS_RECOVERY_ACTION_DISCONNECT,
>> +    XE_RAS_RECOVERY_ACTION_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across 
>> all products
>>    */
>> @@ -70,4 +89,40 @@ struct xe_ras_threshold_crossed {
>>       struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>   } __packed;
>>   +/**
>> + * struct xe_ras_error_array - Details of the error types
>> + */
>> +struct xe_ras_error_array {
>> +    /** @counter_value: Counter value of the returned error */
>> +    u32 counter_value;
>> +    /** @counter: Error counter */
>> +    struct xe_ras_error_class counter;
>> +    /** @timestamp: Timestamp */
>> +    u64 timestamp;
>> +    /** @details: Error details specific to the counter */
>> +    u32 details[XE_RAS_NUM_COUNTERS];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_soc_error - Response from get soc error command
>> + */
>> +struct xe_ras_get_soc_error {
>> +    /** @num_errors: Number of errors reported in this response */
>> +    u8 num_errors;
>> +    /** @additional_errors: Indicates if the errors are pending */
>> +    u8 additional_errors;
>> +    /** @arr: Array of up to 3 errors */
>> +    struct xe_ras_error_array arr[XE_RAS_NUM_ERROR_ARR];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_compute_error - Error details of Core Compute error
>> + */
>> +struct xe_ras_compute_error {
>> +    /** @log_header: Error Source and type */
>> +    u32 log_header;
>> +    /** @reserved: Reserved */
>> +    u32 reserved[15];
>> +} __packed;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 3caa9f15875f..f49d8dabcf73 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -307,6 +307,34 @@ void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>>       sc->phase_bit = (ctrl_reg & SYSCTRL_FRAME_PHASE) ? 1 : 0;
>>   }
>>   +/**
>> + * xe_sysctrl_create_command() - Create System controller command 
>> structure
>> + * @command: Sysctrl command structure
>> + * @group_id: Command group ID
>> + * @cmd_id: Command ID
>> + * @request: Pointer to request buffer (can be NULL)
>> + * @request_len: Size of request buffer
>> + * @response: Pointer to response buffer
>> + * @response_len: Size of response buffer
>> + *
>> + * Helper function to create sysctrl command to be sent via 
>> xe_sysctrl_send_command()
>> + */
>> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
>> *command, u8 group_id, u8 cmd_id,
>> +                   void *request, size_t request_len, void *response,
>> +                   size_t response_len)
>> +{
>> +    struct xe_sysctrl_app_msg_hdr header = {0};
>> +
>> +    header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>> +              FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>> +
>> +    command->header = header;
>> +    command->data_in = request;
>> +    command->data_in_len = request_len;
>> +    command->data_out = response;
>> +    command->data_out_len = response_len;
>> +}
>> +
>>   /**
>>    * xe_sysctrl_send_command() - Send mailbox command to System 
>> Controller
>>    * @sc: System Controller instance
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> index f67e9234de48..0ba841b0be1b 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> @@ -27,5 +27,7 @@ void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>                   struct xe_sysctrl_mailbox_command *cmd,
>>                   size_t *rdata_len);
>> -
>> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
>> *command, u8 group_id, u8 cmd_id,
>> +                   void *request, size_t request_len, void *response,
>> +                   size_t response_len);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index faa973986c0d..93ff0d481d74 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>>   /**
>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>    *
>> + * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>> +    XE_SYSCTRL_CMD_GET_SOC_ERROR        = 0x01,
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>   };
