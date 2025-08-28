Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9520CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB5310E1D1;
	Thu, 28 Aug 2025 10:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0S0SZoe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D49B10E1D1
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756378105; x=1787914105;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yNIRlMlgivrpeeYq8L5hV41oqwG+uuAqp1K7J0NWCDQ=;
 b=G0S0SZoe8Cc7CfyM1QjgWRckR3j1cDNguoPGUlB0F+n+4XiV7yLLN0Lr
 VOhQtOUnQ3OCz0MONlB7mqLqvpRFVZ+QqnWOAD0W3/1WU++S5BibHUi+t
 uj6FE4CNmQH7lZNty1Ej/UofsB2HB8govHZbFmLhCS0HTDh/AERljmXdl
 YUp8KBbWtfHSxk+MaJjKXP5UJodt6E+GmGSHRMyjyOoNMFitFXah+WH5r
 xtZOIn0cjYAbn3M8bV6ARmOXroCuye9UINal0Qh20h3266jPPi64IlaDm
 cKRl5YEzoHkUIUKXiOxoHc9Z6agxy0GCTxgE59Zg1Q/ju5ifX06DekNaf g==;
X-CSE-ConnectionGUID: 7NKS3BLNReif9a2S0KEROw==
X-CSE-MsgGUID: MNJUn5sSRiygjyhheGGJ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69236455"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69236455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:48:25 -0700
X-CSE-ConnectionGUID: rhZN19Q0SjGxcLT6o07HIA==
X-CSE-MsgGUID: Xfl+9uVqTtmQKWPmvbDjZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169981374"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:48:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 03:48:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 03:48:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 03:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfxQaMfLmPD9/iB2SFehoruZAVczYP5SBPz3lyJegtjlzVoITwAOzfCoQEm7F1VjuY2/cggW67UMHIQIoLuB30MYXo5c+F/uhGHinMItWVOx9tuAeki/PSft9MAVWcMpaGCv0xsHA2NCZKqgKSGQ5yao+nStjs9Osn5pqUiPyHJS4QJoXZh6mdqKZDbMHWBgpghl3M3CEmRzFKe+iNqKhGbHGhyhEbrX6egk+SWrmJwtn5wrS+1i8FDr02m812cJkKdAakdSr/IkOLyZCN4UyEE6RCDIOhksW/nA+86hBuUn9PTdGRFVxmdgesVo33u+SRl8hQ+FLB8V/3f+dPZGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjdBSkxYNwSbmaZsalAiNdaXy1H3XxKd8qzwx+NTAIk=;
 b=dqmHgqbGfG0IDy4//rTBQRGgdEx3P1NCsUD3BB6bFggJfbAE0msbQJ+HL6BmilIjBUaNAGwr8otMpMLADZewYfuXf3UoXnFb7jFL8WTQHjwpdWc1aPg51tnOEj8vNycHD7iESiEoZG1GW1ejBnPUrxb/PF2r+RNLAWXIRUZB74g7Q9lOTIowdv6XvjuXLu/XLOOvJt9BrmZM5euDMBSjp20Ik/+A+jAoMjsR1PNVxvskesgGIlZSox+iiQLYP/jG8RFODRyriglDon3YE/6EXqKQlADHjIurgF9t5P+DZYCvUH0kUCEqsVB7suKpBmKB2hBuFzO6VL7DipYZneIr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA3PR11MB7980.namprd11.prod.outlook.com
 (2603:10b6:806:2fc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 10:48:17 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 10:48:17 +0000
Message-ID: <8e37eb4d-eaba-4e28-bda3-52b9a76a6936@intel.com>
Date: Thu, 28 Aug 2025 16:18:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
References: <aLAwP0xAjMpLLpFm@stanley.mountain>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aLAwP0xAjMpLLpFm@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA3PR11MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: e197bcb8-dd7a-43a5-3238-08dde6206582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVd2ZU9CcE9Vb1UrMDRyQWpUYTlpK0FCYy85aDdEQkM2bzlHeDRDNFZVbmpH?=
 =?utf-8?B?dEZpamtmVVRIaXVIS1QzR3g4UVJqSVFJdDZGM21ySGVDZXI4VXRDOUdENndQ?=
 =?utf-8?B?SEpHTi9GTnI0MmFIb203UGU3K0tPaEd0TVZvT1VkcGUvNEk1REhUa1IzLzBm?=
 =?utf-8?B?S0h2NDdDZjlkQ29QaHJXTnBFTUlaYkc5SFhWSzluSlpPZjdUWWVWOS9VSmhR?=
 =?utf-8?B?YjR2dmdqRDdCRHdPK0dGc3BxdHpFSG5wSCsxdjZvWG1ndjFYeHBIaHlUYXRj?=
 =?utf-8?B?azc1Mk1ldnVBWERuWm5DcXVkTzBlSi9DamlaU3hDR1BOTkdCWE1KaXR0NU55?=
 =?utf-8?B?Ynd0bTZWYmx6TUxxdEsyMDBqMkZJc0JtajhoZnVVbXRSQVNhNW1PZFh1MkR3?=
 =?utf-8?B?cE0wYW42MXlaZ2hyQjJPaEJMT3Z3WFdVTzVHUmhYcjdQaG54aXNUaGtMend6?=
 =?utf-8?B?akZUb0NsQXd5V09rL2E5Wk5nczhNR2dIcHhNZmJNUmdPZ0hPZVNaZEFuR3hw?=
 =?utf-8?B?dVJ5UDg5dkFIV0Zab1JEdWJoR29FbDRWQ0N2ejR2UG85QzRFV2VHU0t1RkMx?=
 =?utf-8?B?MUpYNTQ3dmRWZE9QZm1leS9QeXg1YzZHTjZzanlEVUVRTlZ5NnJTb1hXU2pv?=
 =?utf-8?B?M2w2MWpkbjNhTThJUnRGaEpVaW94cVRJcS9tYXFnRHgwRlNnNzdaZVVzdU95?=
 =?utf-8?B?ZWJyMGg4bGg2Wm1RTkIzM2xzaW0wWHRkVkZmaTY1SE8yZjEvNXRackx6WHVO?=
 =?utf-8?B?T0dNRWt3UU1MaW43OXZrUU9hR3VKOXhXendSblJoeW13Qldtays1TDR4TGFN?=
 =?utf-8?B?UUVtdnJJMDBBZytEam5iK3luR3JLV3kxZFBvaTM5blVnSzNrYlRKOXhNN2VY?=
 =?utf-8?B?U1NCNXZQVEwybmRXSzJGTDZjV2JoMFowZ0IwS0RYWWVBdWp4MGlMRTdRQ1Z6?=
 =?utf-8?B?T1doM2pURTZDUDF4ZFBCbmJBWENwVFEzeG9aQTBORk5ES2RtT1oxdzFxOStH?=
 =?utf-8?B?VWtZVlBmc3pqZTd4azQ2Tlk2TFIzbjBSc25XYzRaNS9DdmNXY1lLakJ2VGZE?=
 =?utf-8?B?aXk0NDBNOUYrc1c3MXcySTdETFMvZ3BsU3ZqcldEeGlmbXQ5UEdhU1FPMUg5?=
 =?utf-8?B?VEJCb3FCSU9YejdQQ1c4cXYwNGZmOGM3cCtEQmp3N2tUNjNpVXFDQW9GSXZw?=
 =?utf-8?B?aG91dEFBMUd3WTEyYjg0TmF0anM0ZkxIWEpoRVdqQW1HbjB1MlFpN2dzRE1O?=
 =?utf-8?B?ZFN4bkdqZHhWOWxHOWhWZWhta2xCNmM2T3ZveDBHK0poNGZVYTcwUHZCbE5S?=
 =?utf-8?B?OCtTenp6NXF3bTIzWGQwQVIxeXUrdlB3WHVpb2JLQVROVy9mWWcxMjdGM0xz?=
 =?utf-8?B?czlmVWtoK25XeHQydzMrYWlFdTBtU1N0cGVRREN3UlhnekdGblA3L0JrdW9V?=
 =?utf-8?B?ZU9uNHBwTXVHakxlZjZ3Uy9uY3VubEk5dGNxNTBYSWZCV2h4aFROakxPU0w4?=
 =?utf-8?B?M1BHMlh0SVBlWWV5YWEzaDlaK1c3Zm5KQnZvaHJaZ01JalVJTWUrTVdCWmN0?=
 =?utf-8?B?U2dsK2EyVGxOUkRqSTlPbW9uZDd3WElVU1U4Z0UxZmhTSUsxY0pmL3EvVHFE?=
 =?utf-8?B?bnhibXNrbVBLcm5LcW5iZnlyNlViQkFTY2tRMzhkUisyWnp3K2VneHh0Tnlk?=
 =?utf-8?B?YVhQY0VrNk9sU21pUmpEQnZQanNad21ONFp0Wlhkem84UlIrNTJGZmtvU1h3?=
 =?utf-8?B?Qkl0UFZPRzlIWVE0cWFyQWQ5VWlUc25tOGtOYmdPSTRXZEV4OHFpTzllcTl4?=
 =?utf-8?B?YzF2VWNBdnJiQUE4azZYN2hMQ0h0THhua2d5OUJtNVRuYWtLNW9qbEtBajI4?=
 =?utf-8?B?WlZ0azErM3RGLzBtY2VENlZXZFNIUUZpSUFtcXZwU01ucW9tT2tNMmN0V0lt?=
 =?utf-8?Q?lWw2Emr5Ypg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2gyS1hMOThPYXk2cFBXSVdCOThPV0VKc1BZcVZoNmJQS0dHNnlndDI5VnN5?=
 =?utf-8?B?UWk5UWphb1RQWUZaYWxtSDI5aWs5MXY1ZHZNaGc3MDU1TXdEQTUvNEIwWXBy?=
 =?utf-8?B?TFZsT3ZDUFR2YVRidUk3Mm91RGwydzlKUGhwbCtxTU9LWDF1eVBXVG1DaC8z?=
 =?utf-8?B?QWJmVkdvd09VeWJxR2lMSVdVRGlGTHFtVDFHSytiNmJ3aEplNHhnUGIwRnd4?=
 =?utf-8?B?ZUhPUG8wU0lTbk1oS1JuY1haa3JQcW02alVKc2M3OFRmMThnWWVhQTcrOVYz?=
 =?utf-8?B?cnJzMlFGMVFUdmFEbnBMN2VyY1AzbEVWWDlXY1NMMnc3dnpSbENDdkI3aDU4?=
 =?utf-8?B?STZ6QytTc1MwYXpGMmIrNUVCQWpYWHZYWnBoSWh6UWx3S1lrcm9DamNjMEk1?=
 =?utf-8?B?MWJ5RmR5VGhCRDNiMU04Y2V5eU5nWHU3cjBSbVJGQ0ZOcHloNkNQc2JzWCs3?=
 =?utf-8?B?ZUJ1V1pLR0NKckkzcXBVOHFvUk94OHRGeS9DWkQ5ZWNCNU1GSDYxaVlPb0g5?=
 =?utf-8?B?MW5TbkY5eG1SMmRRUkFmVURkcXB6eWlNOXFRZnhsazIwSVkwTkJnTnFyQndY?=
 =?utf-8?B?QjlhMzFiaTYvSVVyMGY4RVdKSjdZOXpvSkpHcEZBS3pQS2FHNy9IWnNkQUNp?=
 =?utf-8?B?cWtVOU5tcVhRL0ZJc0FQR2ZUVnpiaGUzOGNGNWNXVTBORVNZeFFjVDhMUzdq?=
 =?utf-8?B?WjFpSVJ1TDMwNTlIN1YzNXJTZVB0MDBNYVdtVGY5QXBBUElvZ3FTMjlxYUR2?=
 =?utf-8?B?SmtyRzZodlpQNkwrMjZXc3BVS0EwN3I2bnhVRDhHZUNCZ01EenIvVk13czZ1?=
 =?utf-8?B?djJyd0hHNEUzL0pSS0JPRThKckFvRHN1MFZrazl1V25BbWNmOXRVaUozbUVa?=
 =?utf-8?B?WUh0ZE4zclkxakhMYW9Rcm56WFZJQ3RDOXNYalM5OHBKdUVaU1FxTjVZNXBH?=
 =?utf-8?B?Z3pVc2tNcys1VTl3cncyZE1UUGVzbDVEUHl1d1VwRE1mYjlkc0ZQSTVMMnND?=
 =?utf-8?B?TXpISXBldDM2dVpaQWpoWTlpeW1USVorRkRwWnluVHo4SUx3Y0YxZEhubGR2?=
 =?utf-8?B?ZnoxNGlIakJCNGdLWHZadEhWOWNjcjlWQVRNNnhWQS9LM2pHYTRsdmhMdmhW?=
 =?utf-8?B?Znp2bk5TNWROS0drQ1RYdHRkUVdLL1oxNk5LTTZnemRCcXhmMFdPaGwzRlor?=
 =?utf-8?B?aWJ2SUVzMGluSFlUd1d6akVMUjFjYzNpbFJ5a25tQVRNZ2Y5azNzOUE2aGZM?=
 =?utf-8?B?N2UxYWxyblZXM2J5TDd3S2RnT2pvN2ZkbTRGRFVwL05QWnpBbUhDOVhpbUh0?=
 =?utf-8?B?VjRRSXVqcFBjOStEb0dQdkZRczdidkJIR013bnZGRjFuVCtaeVRhbGpWeHdn?=
 =?utf-8?B?dXZkMWw4NGVGY1MvYjkwWDMyRWpVdEg5WDVXZmZXQ21lSjBpbXo1VGl1MHhu?=
 =?utf-8?B?WUdjLzlZQ3Z5am5HdVZVQXo0YldPVEZoKzFpVHV4L1BHeFpVK2ZUOW9kMFlw?=
 =?utf-8?B?dmpGZnREeVhlNnJnbm9NMGlvZDNraEYyTjNJYVVGNUpFQzl2Szd6KzB0VTc5?=
 =?utf-8?B?M3p4b1A0U1RCbVptU29HRjI2YnNkZlJhUzdoU05mVTluWmFUcXZhd09rOEVt?=
 =?utf-8?B?aEhGY295NmkxQlNJakx4aTFSb1J1UHhFMDFqQ3NPSStBeVU0ZEJBSjZpRWpw?=
 =?utf-8?B?YklsOXRDd29XaWxEWlZDSDlwTjIrRmt1bzVLeWE4NHlZU0VubzQwcXlKUEJC?=
 =?utf-8?B?SDJHY05uNy9vVlhxZGRwQW9rNi92eDF3VDF4cjUwbHpxdEt2a3VWRXc3dmdw?=
 =?utf-8?B?aHZqWmhUeXlVK25vOHF5WVdXT3ZpVkFBZnljUHN2eFkyWWY4ZUlxRkJuTXor?=
 =?utf-8?B?b3NqTEFWL2RFMlZKSy9qbWxPUzFHNklyOHBwdXBieldma29renI5QWZCVVdD?=
 =?utf-8?B?LzkvM2RVc1JUMVp6VkVsOHgyR1g1d0RCdmdZVmJabnZ0N0FRTEdzd2VQTjho?=
 =?utf-8?B?aUVPeDlQZ3J3TjZNSFh0UmVxdTBDU1Y1M1ZyYTZ0RUljcHRBTllnRkV4Wk9j?=
 =?utf-8?B?cjlrWmxwNlM1K3hma1d3d0JBTXpKdHhZZEZ0bFBBQ2VLa2pxMC9YR1BQcWFn?=
 =?utf-8?B?SFJwRnJwUHlRaGVDZG0yZ1lZVW8rVTMxN0RKYWduTEo2VUF2cHRHVlB2Z3kx?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e197bcb8-dd7a-43a5-3238-08dde6206582
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:48:17.6235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNqx7tc1QicG6GchTaw7HQnk15v0tfcysPQ1pfBUmsOiCnFuxohHgqWopaxi4LkDoJS3W6AZ86vc0CMLbiZfmxURKyjnLwl23qv6Jyq25e4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7980
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



On 28-08-2025 16:02, Dan Carpenter wrote:
> Hello Himal Prasad Ghimiray,
> 
> Commit a2eb8aec3ebe ("drm/xe: Reset VMA attributes to default in SVM
> garbage collector") from Aug 21, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/gpu/drm/xe/xe_vm.c:4442 xe_vm_alloc_vma()
> 	error: uninitialized symbol 'default_pat'.
> 
> drivers/gpu/drm/xe/xe_vm.c
>      4396 static int xe_vm_alloc_vma(struct xe_vm *vm,
>      4397                            struct drm_gpuvm_map_req *map_req,
>      4398                            bool is_madvise)
>      4399 {
>      4400         struct xe_vma_ops vops;
>      4401         struct drm_gpuva_ops *ops = NULL;
>      4402         struct drm_gpuva_op *__op;
>      4403         bool is_cpu_addr_mirror = false;
>      4404         bool remap_op = false;
>      4405         struct xe_vma_mem_attr tmp_attr;
>      4406         u16 default_pat;
>      4407         int err;
>      4408
>      4409         lockdep_assert_held_write(&vm->lock);
>      4410
>      4411         if (is_madvise)
>      4412                 ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, map_req);
>      4413         else
>      4414                 ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
>      4415
>      4416         if (IS_ERR(ops))
>      4417                 return PTR_ERR(ops);
>      4418
>      4419         if (list_empty(&ops->list)) {
>      4420                 err = 0;
>      4421                 goto free_ops;
>      4422         }
>      4423
>      4424         drm_gpuva_for_each_op(__op, ops) {
>      4425                 struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>      4426                 struct xe_vma *vma = NULL;
>      4427
>      4428                 if (!is_madvise) {
>      4429                         if (__op->op == DRM_GPUVA_OP_UNMAP) {
>      4430                                 vma = gpuva_to_vma(op->base.unmap.va);
>      4431                                 XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
>      4432                                 default_pat = vma->attr.default_pat_index;
>      4433                         }
>      4434
>      4435                         if (__op->op == DRM_GPUVA_OP_REMAP) {
>      4436                                 vma = gpuva_to_vma(op->base.remap.unmap->va);
>      4437                                 default_pat = vma->attr.default_pat_index;
>      4438                         }
>      4439
>      4440                         if (__op->op == DRM_GPUVA_OP_MAP) {
>      4441                                 op->map.is_cpu_addr_mirror = true;
> --> 4442                                 op->map.pat_index = default_pat;
> 
> Maybe we *know* the __ops are always in a specifc order so
> REMAP and UNMAP come before MAP??

True MAP is always follwed by REMAP.

> 
>      4443                         }
>      4444                 } else {
>      4445                         if (__op->op == DRM_GPUVA_OP_REMAP) {
>      4446                                 vma = gpuva_to_vma(op->base.remap.unmap->va);
>      4447                                 xe_assert(vm->xe, !remap_op);
>      4448                                 xe_assert(vm->xe, xe_vma_has_no_bo(vma));
>      4449                                 remap_op = true;
>      4450
>      4451                                 if (xe_vma_is_cpu_addr_mirror(vma))
>      4452                                         is_cpu_addr_mirror = true;
>      4453                                 else
>      4454                                         is_cpu_addr_mirror = false;
>      4455                         }
>      4456
>      4457                         if (__op->op == DRM_GPUVA_OP_MAP) {
>      4458                                 xe_assert(vm->xe, remap_op);
>      4459                                 remap_op = false;
>      4460                                 /*
>      4461                                  * In case of madvise ops DRM_GPUVA_OP_MAP is
>      4462                                  * always after DRM_GPUVA_OP_REMAP, so ensure
>      4463                                  * we assign op->map.is_cpu_addr_mirror true
>      4464                                  * if REMAP is for xe_vma_is_cpu_addr_mirror vma
>      4465                                  */
>      4466                                 op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
>      4467                         }
>      4468                 }
>      4469                 print_op(vm->xe, __op);
>      4470         }
>      4471
>      4472         xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>      4473
>      4474         if (is_madvise)
>      4475                 vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>      4476
>      4477         err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>      4478         if (err)
>      4479                 goto unwind_ops;
>      4480
>      4481         xe_vm_lock(vm, false);
>      4482
>      4483         drm_gpuva_for_each_op(__op, ops) {
>      4484                 struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>      4485                 struct xe_vma *vma;
>      4486
>      4487                 if (__op->op == DRM_GPUVA_OP_UNMAP) {
>      4488                         vma = gpuva_to_vma(op->base.unmap.va);
>      4489                         /* There should be no unmap for madvise */
>      4490                         if (is_madvise)
>      4491                                 XE_WARN_ON("UNEXPECTED UNMAP");
>      4492
>      4493                         xe_vma_destroy(vma, NULL);
>      4494                 } else if (__op->op == DRM_GPUVA_OP_REMAP) {
>      4495                         vma = gpuva_to_vma(op->base.remap.unmap->va);
>      4496                         /* In case of madvise ops Store attributes for REMAP UNMAPPED
>      4497                          * VMA, so they can be assigned to newly MAP created vma.
>      4498                          */
>      4499                         if (is_madvise)
>      4500                                 tmp_attr = vma->attr;
>      4501
>      4502                         xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>      4503                 } else if (__op->op == DRM_GPUVA_OP_MAP) {
>      4504                         vma = op->map.vma;
>      4505                         /* In case of madvise call, MAP will always be follwed by REMAP.
>      4506                          * Therefore temp_attr will always have sane values, making it safe to
>      4507                          * copy them to new vma.
>      4508                          */
>      4509                         if (is_madvise)
>      4510                                 vma->attr = tmp_attr;
>      4511                 }
>      4512         }
>      4513
>      4514         xe_vm_unlock(vm);
>      4515         drm_gpuva_ops_free(&vm->gpuvm, ops);
>      4516         return 0;
>      4517
>      4518 unwind_ops:
>      4519         vm_bind_ioctl_ops_unwind(vm, &ops, 1);
>      4520 free_ops:
>      4521         drm_gpuva_ops_free(&vm->gpuvm, ops);
>      4522         return err;
>      4523 }
> 
> regards,
> dan carpenter

