Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A87CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 22:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DEE10E2DE;
	Thu, 25 Sep 2025 22:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCMHESnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FF910E2DE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 22:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758838507; x=1790374507;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JedvX3M8c6wg73JW2GYqovl6E305NKzrl7ge+6r2zyw=;
 b=iCMHESnlrdkn7k75FgrUj0nTfWJZ6HkZIfaWXsclbv5QetPpyCNpYi88
 OK5oBq1qcVKoyYcdDqukriGxDp1I3YKhdSunhPp+vufGYWswnFAj/x5HK
 hxQZfwbimeR45Z4goYmEY0ApTPBzRlXx0J6uYChqQVt1igWmc1LkRUgFl
 20FiJF9sXkApGolxsAT9VCzclHAU4p62dHRrZzYInF7ISyp520IXvgKHB
 A+BQRQjfYCgrSVACHmaSBJju0aK4GutAmI07vXqh1/a52UNjUCLn1MmLx
 ygfVq1MfqJIbfg6f+KE/9SJ4RsVOpIQN+/ps1UY3sCtjD7TOzwVwpYE4J g==;
X-CSE-ConnectionGUID: IOpqHTgbRiKh9sMHTHOvRQ==
X-CSE-MsgGUID: L8dQRs3tTfap32YlACTviA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61222843"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61222843"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:15:06 -0700
X-CSE-ConnectionGUID: XyE8HuDFTC+hF2mLAP0o2w==
X-CSE-MsgGUID: HjoJvLwcQuCZOkpit6JwNA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:15:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 15:15:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 15:15:04 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 15:14:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pjc2V8t4x5jG0IOpYKhQaBjcbU99imBa+Lm29F5uZZaSkJc+S6oKx3MBl2FGctTfqkK3MD9N5tQkbPpw/gymH7W08zkYHhLsDaMlrTh8CAfbGGGjzhB89ixiBHLjSa074QIiPINFh3/ho6h3hMEPhkkOX9UFjDK82OGXAhSKlEvInF1tDZfBEdEyOjliw9evVO4Xu6tfvsYncnmFlDT7hq2HNtLA+7YATwfChhT9DKcvGpsD3vCcGGhLuN6G4rV0CnDltMhzcbPEJWIdhYxL8bP2vBihSZIdQIjbk9Nvpe3RVT5cus1SdSHusc1i2Q9F/uuo7jF0wtYCy2Ffmnn47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m9v4TBtCFJT46oJ6FUp4iHWZQ/rAYSuQk1NNv678k8=;
 b=QwXQ9q9vWcp56K9SlOZ1PyP7+0MhCStUI1WMnYTEqX63ZBokOoFY+1JrlIOZ3/qCiN1+qyk+qxDOAibkP4Dc5PsPBsgYYSS8H6DyhI0BeFALMPmRKo4fQOEt3ghNS7LIL5jnDODJnPJZm0FQmWMH2x3zzUyFm+XyZF6AhIYCCA2lEHbSc8kD8m5R089woIaiiHN/ovpnmoZnkhDT9trsbMvKD7KRNDMr+SjyfALcb2YOhzG9Fcxo6JduiQBsKQ/QNhPRbYTAPzkY6RgqHFYjxVGFPd/hRBOuIPbXNVBneNhcp44IfhKhHd4m03DSkPLuhft1VYH1DIEJMVdTp0JfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 22:14:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 22:14:53 +0000
Message-ID: <a2777749-a680-4c96-b5a3-44b0b5b1d356@intel.com>
Date: Fri, 26 Sep 2025 00:14:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Guard against NULL return for xe_device_get_gt
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20250925204106.67332-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250925204106.67332-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c87fa24-e48d-4860-5535-08ddfc80f3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnpoMndJK3ZVQ1ZTSlVDR1RwWXJtQ3psd1hRK0hrbUtPNnBKclVsY0x1TXdt?=
 =?utf-8?B?S21jUVZNOXI1T3lJZ0lZcE5YamY5VTZPQVhtTVJnbTEvWDJHeGhYMHdKaUZy?=
 =?utf-8?B?VGYrT3Vwcmg0eUdqZm9OSkZRQ1FJcXJHQkF0dkdCaE9rRk5Ca2NuSEk4bjBK?=
 =?utf-8?B?QkV2NW0rVEhVV1ZVSFZkVTdQbGtzU2w0N3FXOGFsYUpXSXJOMWV2ek9SbEtO?=
 =?utf-8?B?Nm1MSVEvSVZtQm9mUFV0SHNuVGxObUpoUUIyWTdSd2t0MS8xMXRxMmVmeElW?=
 =?utf-8?B?Mkk5RG9vb1hMSURsYWw2dndnNFRpYktMTUc3RlBZakowV3Y3ZkdrbEhzUWhk?=
 =?utf-8?B?QlJZK2psVHpoMzFHNDRUaWxXeWx0elNhU2NaZmxkRWxZakU3RDAzZU16V3RP?=
 =?utf-8?B?WGFqZUFyWjdPdTJucllqMGZjU0x5WEV2QTR6ekcyeEk5dVVpY1hZYTlUeW5O?=
 =?utf-8?B?cXg5Nm02V2puZHFicXE3enRWSy9iZUVaNklXSkxrbVo5YVNqblhXcWk5aEs1?=
 =?utf-8?B?Z1dxZlpkWElSN2NHMXlRbVZuOHZFNVRBM255TDZGR3M5K0Y1Tk0wZkR0Zmp6?=
 =?utf-8?B?MU0zK05kQTlmWkdxOHdyWUNNQkZQUkJpTWVENnRLa240VGhFV2NRYUxWYVB0?=
 =?utf-8?B?VG9EZE9Sb2FLN2JkR1VBN2FuS2FLUTFvb0pWbm5Qa09DNm1qeURob051THRX?=
 =?utf-8?B?ZVBKWm1NMkd6YVhjNzcwTC9Kc25QdjlYd2NOOVQ3YkRxaDBzNHNBTmRoK21H?=
 =?utf-8?B?RGkzcHNsNVJaYmIrQWc4aWVsbFhBeFh6eUpleUd6MUY1RllFVVBJZUIyNE5T?=
 =?utf-8?B?VXBYNHJieXpZVEFvNks3Qm9hVUJSdnF4RENTZmZ3NjRHbFBOM1BBQ3o0MTFK?=
 =?utf-8?B?TEhRZnV3NWpxSVUzc3VDaGR1Nzk5N0lVdVYzajVHanpyaUYrTVVEakF5QkF5?=
 =?utf-8?B?TWhxbTAzMTk5YzRQY0pFUXpLejl1NW52T1c5V2UxZG92Z3h6a1krbXBZV1oz?=
 =?utf-8?B?VkpnRFRaQ0Jua0dpbFdPR2NqTmx5ZE5JeHA1UzV3Y1B4dEp2RGdlcmdMMElN?=
 =?utf-8?B?WWhmL2pHeWJMVWhSbjBLeXdlSDYvOTYwTUJwakRiK1VpNGU4TUxHSy9VVXBB?=
 =?utf-8?B?d2VpV202Q1pnaGJZc05EQUdRNWFOczRGbHVZVnY3OWxPOHhEYWxleTFnbXpp?=
 =?utf-8?B?dytTbFBiQmttcStuM0E4M2FqTXZJTGRzNVZ3bFlldUtXcU1VaURraHBVTjc3?=
 =?utf-8?B?NWl2a0NJNTFuUWdSVCszc1gxZXhhQ0tPemhNUi9EeHdKQnlCL1BlcVEyang1?=
 =?utf-8?B?dGFUTGFJU1NqZzI3cE4zaGZUc1hIN0FQODM2Q3lGOHpGa1ZvazdwSW55Wks0?=
 =?utf-8?B?N25rczBlM2VkQW9sRWJXK3hqNExGZkQybkh5QkpFcmpFMG10Rmh6NzNEUXJ4?=
 =?utf-8?B?MWlOUlE0S2NHWFYrMzBGMVhid1lCb1JVaFJHOXZObHhTMG1sVUFzdXYrdm5Y?=
 =?utf-8?B?SGlTd1RVV1pNTHpGai9YQyt6Vm51MEFEWVFGYzZMVFc1UmFLT3BMVko3RkZI?=
 =?utf-8?B?MFZnZ2FUVmhBRzh4b2VMaFBKSGRHTmF1Q2VZZjgvUTljNVBKWXRQb1FZUjYx?=
 =?utf-8?B?Z2ZmbjdXcTZmOEEvb0owRnF5dldYZm1MVm1ndDlYVXZHM1M0ck8rU2txaGtq?=
 =?utf-8?B?M1pTNlExR2gvbkpQOXR3dElzSWpHcnlrNXlWSnVZMWpwMXlZRDVrdFB6Y0NL?=
 =?utf-8?B?OGU3Rm5TUGhXNTlrak4wS3Zha09WbVVtSUpkbjJTcVVnRGxkc0NNZnRPZ1Vh?=
 =?utf-8?B?dncxVmYrS2p2aHVCdXR1aHhDUEJYOGp2eVQzL052dmhidllRekVGQnpUUk1m?=
 =?utf-8?B?SHpuWlNZU3NESm5YWG03S0dNaEJVVDdCbFViNHdjRFFYOUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStJSkVlQUIvcWt3cmRIK00xSUV3QW9Wekl3Wi9SZ2dLNG44Um1ZdUJDV25t?=
 =?utf-8?B?bGs1aWpUNHRxV01jQVAwelYyRUE3SUNoYXZ2KzJGSUJRNHlSS1dkVkUrSSti?=
 =?utf-8?B?MHhkNWkwVGVjOEZjZnFyYU5zU3RtaXdHODRQekpCUE5MTUNXclhvU2l3Tm5X?=
 =?utf-8?B?NkNUMHhDYXpIMkVnRkd1VTdUUmZ2dVR5cUJmTnZlUEVhSzVHMnVWRVRWdmwr?=
 =?utf-8?B?SDhJQlRvSGxLYUVtTjBTZHRXRTBiclEyK0JIbVZaZCtrTk1mdWRqbjNkWXhQ?=
 =?utf-8?B?bWwyaUN3Z0pNTk9Pek5GQ1ByT3hSdW5sUjVjcHVMSG4wSUlHdTFWeW1JZk5y?=
 =?utf-8?B?MEw3dmNibmV3MXp1Vmlob1ZHN0hHKzU4TlVLVnhURGpNaUZNK3R3MlhKWHdT?=
 =?utf-8?B?aDFwdnplZGoyZnZFc2pnZ2R6enhtR0tLS05rdE5WbW8veFNpT0NBU1UxRUJ5?=
 =?utf-8?B?cmJLdk5aMmFJN1FzdjdLM2pJNm91YXFsQzlxTFBQRTRDMFhTOFp3ZXhsVGtO?=
 =?utf-8?B?dFlZTURMRXJRR1QzZE8rM3lVdFllUkJrRnQ5ckNnWUdJUWx1dEFiK1IrTjVR?=
 =?utf-8?B?ck51QUFUZHk1UkNHOFIxbFo3M29kcmh2cGh5YnJKRjJkd3c4ZlU3ZkRDTGpY?=
 =?utf-8?B?cWdDeDY4U3FUcldxMWJFZ2JOTmh0ZU1PTVpTOG9rYUxKQTV3ZnpzU1o2bjg4?=
 =?utf-8?B?OWh3cGNjVzEzcW5jSW1iT1NFK3VMMUVCckR0dldiM3VYUnlnOEdzVG51RGho?=
 =?utf-8?B?VDIza2VtTm1wN2JVZDIza0tJay9qbTdOangvZk03eGxZV3B1WmI2bU05T2F6?=
 =?utf-8?B?cmtXQ2IvWWtveFUxWUdhS3MvOHdIemo4UTBaZ2tYYS84ZGhyM3RkSGpseGgz?=
 =?utf-8?B?N2FIZWlVUGZLWVlUNlRSbzVQOTZLYThlSHZwM29EaHJubmdUT1d0YVVPTlFV?=
 =?utf-8?B?T1dSSXF2Rm4rQTZiUWVyWkRoV2lTR250VHd1OVhOdnU0Q051YXpsODZKVndD?=
 =?utf-8?B?cVJZa1lNWlJ4MVVDaHdLY1FDbDkrTE9KZWVhNXpxZkVDVUczMUtVbEFmK0Rl?=
 =?utf-8?B?Zzd6OU1mUHlDbE4vVVhHQk1mYUFOdnROcGxjNFdjQmNaK3BDYmpJeVNZQ2Ix?=
 =?utf-8?B?MlFUVVM0M0w4SWtaQXJWRUhSYWdnZ2FuK3M3RDg0U3ROUmhQWWRHZlExdzR0?=
 =?utf-8?B?N042blRrWHVlTlR0R0hhLzBSMW1iNnlLQVh4cTQ3MW9sUUdLNHM0VXRFT1p4?=
 =?utf-8?B?UU5JUS9SY2JEck1mN0h3Y0FTZkx3NnJBNmFGSG1OMjN1bHRvNnU3ZVVBM0o2?=
 =?utf-8?B?bzZwRkplOXQ4T1FnUzBaNXViSUk0b2s4bmo1WGJaUXQwYml5b3VKVFBlUitR?=
 =?utf-8?B?UkFOMVgyRkJNdllPR09MTVI1bUxkb0JTZjBOQmpYYVZBZDFHSmQ0YlYvekJ0?=
 =?utf-8?B?RWl2NmRBNHpocWFLL1piMVcvL1ZDRDR2dG52L3BSTjlQaDE0VUVNUjhiL0FB?=
 =?utf-8?B?azhWM0UwYUVjNGVKVURTY1pkbXJMLy9jRmZxL2s5NlZvMFFCV0cwQVY5YXhw?=
 =?utf-8?B?aTlaMDdQdWR6bzBaYmppVmd5S0FSWXlrK3ljVHFGYmNuYUlPY3N1MzlmK1E5?=
 =?utf-8?B?ak5QeURRMUR1akV4alcvWStiZkFDbFJWTjZBR3JnV3cvcDRZWVdheTB4ZExD?=
 =?utf-8?B?OHU4TVpLcWowZXdRZE9qekVrd1JMWUxIWkszekYxcWNlQzlBQkgzZm1rNStI?=
 =?utf-8?B?Y2RsdHZOeEFxMHZnWDVTRXFEUjN4QnBZT01Pb0NxeFlyY3hOZVhEdDdyVkhK?=
 =?utf-8?B?cFdsdnQxZ1pFS0doMzlwRUFZemxodXFta2NyL055TThLdUZmY0hmQVJ5djdX?=
 =?utf-8?B?SzQ4aW5wVE0rNFgybU9JWTJCVmt0SE9HQVoxMXRGL0xxckhVTjBMWjY3VFNL?=
 =?utf-8?B?Q2lqcjBPVmZHMk1UZDhRazRDb3VBZFVoaEQ2Rll5ZGEzWmVQZXlMZk4zakxE?=
 =?utf-8?B?TVUrV2pCWGhId0hIVVBucHNiQXlmQVl3TkdIY1dOYlNGWEc4OVJBRTYrY0kx?=
 =?utf-8?B?a24vQXJmUTFYeDJGUWUwTzNEU2VrQXF4dG5TVWN4eU9LSXFoRFpuRnVZYW5i?=
 =?utf-8?B?YmVzWTNhdk5nTHlDVklZZkswYm1JMGp4R2kzMkg3RVdiNXlWZWtxTE4yRXFJ?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c87fa24-e48d-4860-5535-08ddfc80f3ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 22:14:53.7257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGPDIlKfGibJs12pYZJ6/i9z+awoEyRSfFNCDlFmoQmi/N2GSeNMdop4QBaAyKgu/YjgiNKOTtRmfg6pF5dAQwTAHt63pCh8OBQ9CCmhJxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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



On 9/25/2025 10:41 PM, Jonathan Cavitt wrote:
> Static analysis reveals the following issue:
> xe_device_get_gt is theoretically able to return NULL in some cases, but
> several use cases don't check the return value before performing a
> dereference, resulting in a NULL pointer dereference.
> 
> Add some guards against this.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  5 +++-
>  drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  7 +++++-
>  drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  1 +
>  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  7 +++++-
>  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  | 24 +++++++++++++++----

at minimum, I would split this patch into tests vs production code

>  drivers/gpu/drm/xe/xe_guc.c                   |  6 ++++-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |  3 +--
>  drivers/gpu/drm/xe/xe_pmu.c                   |  6 +++++
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 10 +++++++-

but likely each file/component should be fixed separately

>  9 files changed, 58 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index d266882adc0e..6582aa4404aa 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -57,13 +57,16 @@ static int guc_buf_test_init(struct kunit *test)
>  		.subplatform = XE_SUBPLATFORM_NONE,
>  	};
>  	struct xe_ggtt *ggtt;
> +	struct xe_gt *gt;
>  	struct xe_guc *guc;

please try to keep vars in reverse xmas tree order
>  
>  	test->priv = &fake;
>  	xe_kunit_helper_xe_device_test_init(test);
>  
>  	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
> -	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
> +	gt = xe_device_get_gt(test->priv, 0);

maybe we should just use everywhere xe_root_mmio_gt()

that should free us from asserts like below

> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);

which btw, is wrong as gt can't be ERR

> +	guc = &gt->uc.guc;
>  
>  	KUNIT_ASSERT_EQ(test, 0,
>  			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> index a87a7b4b040a..69c1d467e2ee 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> @@ -11,9 +11,14 @@
>  static int guc_dbm_test_init(struct kunit *test)
>  {
>  	struct xe_guc_db_mgr *dbm;
> +	struct xe_gt *gt;
>  
>  	xe_kunit_helper_xe_device_test_init(test);
> -	dbm = &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
> +
> +	gt = xe_device_get_gt(test->priv, 0);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +
> +	dbm = &gt->uc.guc.dbm;
>  
>  	mutex_init(dbm_mutex(dbm));
>  	test->priv = dbm;
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> index 3b213fcae916..4675d92366d7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -356,6 +356,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
>  	int i;
>  
>  	root_gt = xe_device_get_gt(xe, 0);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, root_gt);

adding random asserts just to make tool happy is usually wrong IMO

note that tests should focus on the test scenario,
not on validating preparation steps as those could be hacky anyway


>  	root_gt->uc.guc.g2g.bo = bo;
>  	root_gt->uc.guc.g2g.owned = true;
>  	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> index ee30a1939eb0..44b72a6aba85 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -11,9 +11,14 @@
>  static int guc_id_mgr_test_init(struct kunit *test)
>  {
>  	struct xe_guc_id_mgr *idm;
> +	struct xe_gt *gt;
>  
>  	xe_kunit_helper_xe_device_test_init(test);
> -	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
> +
> +	gt = xe_device_get_gt(test->priv, 0);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +
> +	idm = &gt->uc.guc.submission_state.idm;
>  
>  	mutex_init(idm_mutex(idm));
>  	test->priv = idm;
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> index 13701451b923..82973f7a843c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> @@ -31,6 +31,7 @@ static int relay_test_init(struct kunit *test)
>  	};
>  	struct xe_guc_relay *relay;
>  	struct xe_device *xe;
> +	struct xe_gt *gt;
>  
>  	test->priv = &fake;
>  	xe_kunit_helper_xe_device_test_init(test);
> @@ -38,7 +39,10 @@ static int relay_test_init(struct kunit *test)
>  	xe = test->priv;
>  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
>  
> -	relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	gt = xe_device_get_gt(xe, 0);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +
> +	relay = &gt->uc.guc.relay;
>  	kunit_activate_static_stub(test, relay_get_totalvfs,
>  				   replacement_relay_get_totalvfs);
>  
> @@ -476,30 +480,42 @@ static struct kunit_suite vf_relay_suite = {
>  static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
>  {
>  	struct xe_device *xe = test->priv;
> -	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +	struct xe_guc_relay *relay;
>  	const u32 *msg = test_guc2pf;
>  	u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
>  
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	relay = &gt->uc.guc.relay;
> +
>  	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_process_guc2pf(relay, msg, len));
>  }
>  
>  static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
>  {
>  	struct xe_device *xe = test->priv;
> -	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +	struct xe_guc_relay *relay;
>  	const u32 *msg = test_guc2vf;
>  	u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
>  
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	relay = &gt->uc.guc.relay;
> +
>  	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_process_guc2vf(relay, msg, len));
>  }
>  
>  static void xe_rejects_send_if_not_ready(struct kunit *test)
>  {
>  	struct xe_device *xe = test->priv;
> -	struct xe_guc_relay *relay = &xe_device_get_gt(xe, 0)->uc.guc.relay;
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +	struct xe_guc_relay *relay;
>  	u32 msg[GUC_RELAY_MSG_MIN_LEN];
>  	u32 len = ARRAY_SIZE(msg);
>  
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	relay = &gt->uc.guc.relay;
> +
>  	KUNIT_ASSERT_EQ(test, -ENODEV, xe_guc_relay_send_to_pf(relay, msg, len, NULL, 0));
>  	KUNIT_ASSERT_EQ(test, -ENODEV, relay_send_to(relay, TEST_VFID, msg, len, NULL, 0));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d5adbbb013ec..1a3c2187af20 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -467,9 +467,13 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>  
>  	if (gt->info.id != 0) {
>  		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> -		struct xe_guc *root_guc = &root_gt->uc.guc;
> +		struct xe_guc *root_guc;
>  		struct xe_bo *bo;
>  
> +		if (!root_gt)
> +			return -ENODEV;
> +
> +		root_guc = &root_gt->uc.guc;
>  		bo = xe_bo_get(root_guc->g2g.bo);
>  		if (!bo)
>  			return -ENODEV;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1cf623b4a5bc..f4b9857d6195 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1071,7 +1071,6 @@ xe_hw_engine_lookup(struct xe_device *xe,
>  	idx = array_index_nospec(eci.engine_class,
>  				 ARRAY_SIZE(user_to_xe_engine_class));
>  
> -	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> -			       user_to_xe_engine_class[idx],
> +	return xe_gt_hw_engine(gt, user_to_xe_engine_class[idx],
>  			       eci.engine_instance, true);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index cab51d826345..0fd12decfd89 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -142,6 +142,9 @@ static bool event_gt_forcewake(struct perf_event *event)
>  
>  	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>  
> +	if (!gt)
> +		return false;

while this fix looks ok

> +
>  	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
>  	if (!fw_ref)
>  		return false;
> @@ -219,6 +222,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
>  
>  	if (fw_ref) {
>  		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> +		xe_assert(xe, gt);

but here, in similar code, this is done in different way

how can this assert help to solve the potential/actual issue?

>  		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
>  		kfree(fw_ref);
>  		event->pmu_private = NULL;
> @@ -499,6 +503,8 @@ static void set_supported_events(struct xe_pmu *pmu)
>  	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>  	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>  
> +	xe_assert(xe, gt);
> +
>  	if (!xe->info.skip_guc_pc) {
>  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index cdd9f8e78b2a..0879fd687169 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -177,8 +177,11 @@ static void vf_migration_init_early(struct xe_device *xe)
>  
>  	if (!IS_DGFX(xe)) {
>  		struct xe_uc_fw_version guc_version;
> +		struct xe_gt *gt = xe_device_get_gt(xe, 0);
>  
> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> +		xe_assert(xe, gt);
> +
> +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>  		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>  			return vf_disable_migration(xe,
>  						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> @@ -361,6 +364,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
>  		struct xe_gt *gt = xe_device_get_gt(xe, id);
>  
> +		if (!gt) {
> +			err = -ENODEV;
> +			goto fail;
> +		}

adding runtime checks against the conditions that shall never happen is wrong

code is expecting real and valid gt, so maybe it is just using wrong helper?

> +
>  		err = gt_vf_post_migration_fixups(gt);
>  		if (err)
>  			goto fail;

