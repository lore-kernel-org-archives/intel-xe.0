Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEF0C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 23:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AB910E2D1;
	Thu,  6 Mar 2025 23:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKCqsGFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABF810E2D1
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 23:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741305593; x=1772841593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gW7wwFAxvCqD0gv6qnXDcw3KV19Im7QyAah0LwDT+OQ=;
 b=NKCqsGFeYLz+eR+2hLhqOWYuCCJqEs99/QlH+rYxn3xQiypuBoAYIZfP
 t8iCuqDvOEvPMPGaCE+1IWMk5EG5iBGwFN0IQO3MC8SfD39TGl971/EL8
 CXKj5f9ALWh+jv7V4gPasqd5VXKQNwhqQnVwSziTglROaX+Osb7q034hh
 RWUfLXRqzlcn/NT4PrHAWJJ2NZ219RhwgxCl1Rg2beIJSVvlBpq4mh4U4
 i8tyWw6a2DdEXSCU1epzX7M/AlB+kOj1RKHMKdTwrxFFoGoq2K+smyPeh
 xUAN5RrCtU3UdawD3IxqERoHCe73MKYqt7xlRMaokLpTihg/xHlTBdqW7 Q==;
X-CSE-ConnectionGUID: aBZnC2EnQemtvoctbgpptg==
X-CSE-MsgGUID: zrJ99ue7SW2oTZY3GJnl3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46269414"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="46269414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:59:53 -0800
X-CSE-ConnectionGUID: UZyFaQKlR4WkWRaZ88X8wQ==
X-CSE-MsgGUID: 0OOoRnhlQRyJ7SJkDFCtTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156388609"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:59:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 15:59:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 15:59:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 15:59:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCFbpuybgFTfo0EVkd7FxRfXiDsvaoz4RUQ2b6GYaXrcpW7had0ajAB929rNuRBlaeJ1G7IsCX5FZhTJJVhDO/gSrtRyGlFiM/8ZCUjN/o0vw29kExwNlNdR6nevuaOWGOt5EeTsnTDiJ9w30m0px1eRCn+sTJGSoTLBb7/tUlVrDaz5UaW+gq3BIgqAR4ruffBAbeKyL9FADc9DC9X2+tek3vex7K8mbmWzQ68NLoWcQkvTyBXOVpT9y3XM0b5zlBPWDAnqYLzG2PtnMcWte+3gfbLlmJS8Rw3h6gdltHjoxFWS3hZLQOfPRvYhpfpUFOT+rdsIn6MF2dh9NxmsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5cOwBShMGY+m2HGBlVSiXACyRhtDaXB0kWYcy1KIL8=;
 b=d6xDbK2Cvdcj37x+M4FGq92hRxTqbeoW+lgth9e8F0G4HzB1mA6i3WIO1MhDj62A+FRiKEpWWYLnM5WmmQCsLlsNgZxK2Rbet7Alkv6OM7IsJEuspnTp7I3WvC44O/YcibOATsMDE12uFrREqNoE9V4OjU/jHj6Wca3SvGvDIiWB/FwVA/0bitMnmePi3/gxLoV14nlfqADsE632hd4ucVMvRGPMQhFyKFFhZ479Cmu0xcfo8GQ+NIO+dlsWYwszfedhzuVirwNUHMwYwuUPRoxhg7nfZkMhlj3+baeUoB9ORol8wwZtHF0B2aMM7wdOVouVUB8o+3Q7VB10G04TXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Thu, 6 Mar
 2025 23:59:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 23:59:35 +0000
Date: Thu, 6 Mar 2025 15:59:25 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Add support for per-function engine activity
Message-ID: <Z8o23UNwOUaqarsH@orsosgc001>
References: <20250304095743.3274062-1-riana.tauro@intel.com>
 <20250304095743.3274062-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250304095743.3274062-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:303:b8::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: f12aff01-5c5b-4769-bb4f-08dd5d0af1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUVsR2RkaGptWVdoVzdreGRadDdMK3BJMnJSSmg4dGdOcUUwUndZWXdlcWhv?=
 =?utf-8?B?ZDJSRVJud2d3aWRZZHdITk9Jb0RPa2ZFREx1K2swN1ZBcFBlRkhTM0I2S3Fq?=
 =?utf-8?B?L3Rpb3JqZzFTUTJmNVIzSitPNEdLTHNsWGdEK2JUNmMzTnJHVmFxQUUrYmdC?=
 =?utf-8?B?YXg1MHVzdDY2dGFzNHN0WFRsd1FsakJGYVgzVHNOMkNxMXlsRXV3S2RqaSto?=
 =?utf-8?B?SE1WQW05YnRLdWRkOTlBYzd4VStEazlydkg2bGJTVGNoWUdvUk5XWDUrSUg2?=
 =?utf-8?B?QXNvRFY4YWtYOFJhRFNWNHZtcndMbThHUThreXZRaFlaWEJuSVVtSGRsOUdT?=
 =?utf-8?B?c3VOMTgzUUd4RVczL21oVGFxNEs1QythcTFBV1R2NE9abGUzSXRtblhxUmU3?=
 =?utf-8?B?dUw5eW9LcXd4cFFRYSs3V2JlZXBZMis0MXkwOHlpVlgyaWRGc2MvaHJpaEJ4?=
 =?utf-8?B?aXVrclE3SUlLNkVmRDhqTWttQXlVdkVYVFBLRTJCbCtEWHNFc3V5RDVRdkl4?=
 =?utf-8?B?bkd6a0VaY2dqWWZpQnpQNzM1R0krenhtUzdPOE8zVXBjcXk3UWpPSnFvYUta?=
 =?utf-8?B?U0JJaGt0SUZ2bUlXWXEwb3ZYWDR1ZWg5S0lQd2V0cExjSW0zMTl1VEtCaytB?=
 =?utf-8?B?NHFVcy9kY2tBdXhWaVFLYzZENDh6a3JzeVVKRVlQcVV4VUUvQ0FwbDQ0MDIv?=
 =?utf-8?B?VFczYTVoaUM0d3FHOWdaUkFEbUdZeElwYnFuSUhpSkRLNi9oYlh6dS9VQWFB?=
 =?utf-8?B?V3ZrTk4xVk5VQ09LUzU0Vm1LS3M3b2JHdWhDaDVVVnRiVDdMMHlGTHlyalBU?=
 =?utf-8?B?L282Z1dSUFpkL3cvL2I0NktxeFNleVFiU2hqRmFNQm1GK0xRQ2JIQS9JNkw2?=
 =?utf-8?B?QnZpcWg5aXR1NWNsNW9OaE1hTmc2dTBDQyttbnJ3TzVDSTExd1BteE1WNzkr?=
 =?utf-8?B?N0YyYmdIVFc0OExQVzI5ZEF5Tk0rMGljL0ErUHhsZmdZd0xESmkvMkxDRzhY?=
 =?utf-8?B?UXg5RDVGb0Y0NEswSTBtNTZpZVMvUTNQUjJHd3M1Nm9GZ2dYV2tPeUFDRmdp?=
 =?utf-8?B?YlVFQ28rNW91VlVWWm9ZbFdhVStLaEpIeTRBQmRsNUVHL0srR0QxZGsvUWNy?=
 =?utf-8?B?OXhWdTBGZXNKakRxKzRTb0kydnpZc21jeGRDREVjUG0xTjczZGFWY2dGamgw?=
 =?utf-8?B?L0tpTWlWUzg1cDB1ZDNCU05RNGljWFVPeXlrSFhINWxlMHVuL1FtcXVBMVhY?=
 =?utf-8?B?bFBVQ3ZQb1oveU5oR0FvWVd2eVZsNVNHQjJVc3hoM2Q5Wm9Ocm4vZ1BNT1VN?=
 =?utf-8?B?UHBGVHlKRmZnNStya2JSeFh0K1AvUlBBS2tVSGI1d1g5dGNnYklEOU1sYVds?=
 =?utf-8?B?R2xiS05wcWZTakpXZ1pqTlZmTDZsN0xSaGUzY09kTFJNaVFnYWdnbjRRcWJ3?=
 =?utf-8?B?UFE5LytvNXBmaFo5a3FZY1ovUG9JVU1WampYRTltOFoyd3NYZGVkWlhGTkJR?=
 =?utf-8?B?M0MrMlZtZFRmSHlMK1FTWEh4S0lIVjRQaFY5cFpqTWFPWXdldWgrdzVPNmlY?=
 =?utf-8?B?bGZieEhWbC9CL2pUWklNYmE1Q25wL3RzYjZjakw1Z1BxbjNlMzZNcVlKMUJR?=
 =?utf-8?B?emIveG5SNjVJdGtjVzR0WWsvcVB2RFNCRWs4K010QUJvY3d4NnVINHZlQ0pX?=
 =?utf-8?B?c0wxMzFHWjBaaG9mWkc2c2UxbXRYT2FvcjBMd2NQU2htTHJpSTdvdTBUaGpu?=
 =?utf-8?B?R0RndjZMSWJVbGFIWnlpWEFZc3hERnhEcTQ4czRxZXQwMnFPOUFHeFBNcDhu?=
 =?utf-8?B?ak8wZE1TZTdPTHZJaEZaRTlSU09iT2JPQmNlZTV0b0ZrNmRSakhoTFQwMHVh?=
 =?utf-8?Q?5MZJN8YFZR3/w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzUwaDA3M0p4bHVycXQ0MVlPcnV0MUZFSkFvc3JHRUtPV3BsRk1ZdE5lalZU?=
 =?utf-8?B?Zm5mZFhkUGpQUDBQUHpTL29FR3Z0UHoyZEEyT1JjMWo3VUp0RGxma1E1SnJt?=
 =?utf-8?B?VVE1SmFWM2tJQURudjRHWmhvUDhMOS8zTVZuQm1wdzFzbEhDczRzb0puakky?=
 =?utf-8?B?aldFWVZ0cUdrMi9FOTRaQVhmdWJTcC8wYWpVZVEvaWNvQUxueDZuZlRhR1Zo?=
 =?utf-8?B?elQyam9lQ29CMFdoTDcxS3ZYMUM0TDVPTUt1QVNYUTM4OUtGeTBnNnpBK2Qz?=
 =?utf-8?B?Y0JDVDlRVjRSaGRTc0ZzcFFNdG45WDVibFlNVWcrTHQxUHBsNEkya0NMRXIv?=
 =?utf-8?B?b0tReXVjSjlHcktnTk9TNE1uNVNNcThOUHZCaVFMUXcwak9FMW81b3pBaHgr?=
 =?utf-8?B?eXlSYjF6NVBSTFZQdldqTVBKMnlpRFMvcUJaQWJkV1J4azhSRlV3ZE5FWjRq?=
 =?utf-8?B?R2RKNFVSeWV4YnN6bWJOd1hVZlNXRzR4MXdxTm03MVFHeHJIUFBYeXVYNkg1?=
 =?utf-8?B?azEwOGFGY2NLZzZkRG5lNE9BVXdIZXBSZ2orS2JoSnpLT1JsaWY2RmFQeHV4?=
 =?utf-8?B?aFFIZ0pMSk1qY0VIR3J0WjRiYUxGYXVQWFRsRG5kV3lBMHNPdmdkMFBha0Fa?=
 =?utf-8?B?cUgrSnpQUTNtRlVyeGRDV1FneFQ4YkUyNEJRTmJWUWxTUDYvQkkzRE9tS0Uv?=
 =?utf-8?B?UzNrN2J6Y0ZSeU9Bd1lBZzdVWGppMWZKR3dReDk0OUdZS2VJNmtzSTRqc2lj?=
 =?utf-8?B?TlRZWDdEcXBWQjZBSXh0WUgyWisxSm9HcnNwbWZvV1R3OEJFRXB6NVU3YnZ5?=
 =?utf-8?B?ZmlGVFBTVGpMdjN4aHdONmw2RTNNcnpJZENtd0hYN3VKM0FTR3dGMU9tK3c3?=
 =?utf-8?B?OVdQMEQ3eWdmSmdGZlE3azRVSTE5MEFVSFZIUUc1OWVQK2dCTmozT3M2aThO?=
 =?utf-8?B?R0tGRVcwc0NYRWdPR01MeXlyTFNvcEU1bUcvcVV2Q3loV05pbGNUb2ZOcjZp?=
 =?utf-8?B?ekZ1QjVHNE8wZEZNY1VCMUVjQ0Z1REp1KzRsbmpDbHF5YjZ5N24xZmw0RWN1?=
 =?utf-8?B?QXBEREpVTlB1enNMKytVZUdzbStsTlQ2Q3VGakROUjhIc0c4RmpJV29WRlRh?=
 =?utf-8?B?dmRoaUFheXp6OTB6UTRmQUk0YmJPeTlqNUhDbXJUUzYvb2VXTERpU1UrejFt?=
 =?utf-8?B?ZmxJT0sxK0g3L1BHeS9XQVc1YnZGbm1tdkdNZ1RtY1NNb1hLaE5jRld1cWtM?=
 =?utf-8?B?QS9jV0JLWnIvYzVvVjhHQVRuTEZPOHVuWXYyTEo1a0QxaFFDbVR0U1ZVWHNN?=
 =?utf-8?B?RDErd0J1VitqUm5IQUpNaXdEOXRFelVFMnJnMXZmYkl3eFJhRmlreStDU1JI?=
 =?utf-8?B?aUxlUjIrVXQ1bWtzbEJEUml1eEo5RlBaSzhNRVYxb0lQLytTZHBWdUpIRldC?=
 =?utf-8?B?aHhER3pGQkRNUnZuSFZqdTB5MXFOcnhzMXY0Q1B3d1BETWxkbVA3U1VqRm9y?=
 =?utf-8?B?cmVuNDhJcTVLVS9EZG1NdjdVeFdMR2xwUlJ6SjFkU3RWckxKbTFjNE50RVM5?=
 =?utf-8?B?RlpyS0h0Ni9GTWtzRmRyWGFYb05SRzhuQVI2azJpODBoZS9KZVZDMWJWQjFi?=
 =?utf-8?B?a2lYZVdxL2ZyVFl0akFUaks5NmhBQ0doSGU5SE9xZ0Z2dERhc1B2UWlpVHU5?=
 =?utf-8?B?SVdMb1RZUlNLOWpuQU51M1ZHRjVMYkZJSWJadmhnb29mZG1CQU9YQUJ3cDd3?=
 =?utf-8?B?UndZejZtb3prczVVczJzdkNSZjNyZ1pVMm5CZys0WUtPZnJqcUFpcjhYUUcx?=
 =?utf-8?B?VHlwUHc3THYwSmJ6SGg3WHM3M3hjTXB6WlhDSGJpSkkvQkZGY3ViK1FtSzlB?=
 =?utf-8?B?U01zNWt2ZFNtNUE4cW15cFNrc3pWYW9PbkRCWmdvMUh0cVROTS9WUjY2UHRq?=
 =?utf-8?B?TzdzQVIxNElqQzRwZzN0Qm9hc3hhTloxd0MraThYVzFMY1BMY3lvR0RzUmRW?=
 =?utf-8?B?eWEwR3ROeVBqL2w5d25lelM5REFyb3gvUTY5WVdPNFlpUzlPS2xLWC91Q2Fi?=
 =?utf-8?B?cXVVTnhTZEJNTGp4VlkzeW0yNFljL29WcjJYYjVHSEV4UUJhZ1VOS0hmb3Ns?=
 =?utf-8?B?bjBMb0RoNHkwaFNkK1grU2VSMTZZSkFtMVcvSDhWcHFOaEFmR1NZWVFaZEln?=
 =?utf-8?Q?0pITWXMlDHf+j2QBUSOPzjU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f12aff01-5c5b-4769-bb4f-08dd5d0af1ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 23:59:34.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFMceUYFfv/mqBXamIMrbU3YNAVt52QWE2/zwieF/FsPN5a2IeSE1Z/xEoHqV0v5tJi278Wnov1ptB/fhyFN1t1YpDBTbaip4upc1FQanA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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

On Tue, Mar 04, 2025 at 03:27:41PM +0530, Riana Tauro wrote:
>Add support for function level engine activity stats.
>Engine activity stats are enabled when VF's are enabled
>
>v2: remove unnecessary initialization
>    move offset to improve code readability (Umesh)
>    remove global for function engine activity (Lucas)
>
>v3: fix commit message (Michal)
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   7 +-
> .../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
> drivers/gpu/drm/xe/xe_pmu.c                   |   5 +-
> 5 files changed, 188 insertions(+), 33 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>index ec516e838ee8..448afb86e05c 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>@@ -141,6 +141,7 @@ enum xe_guc_action {
> 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>+	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
> 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>index 2a457dcf31d5..37edc0414231 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>@@ -17,36 +17,61 @@
> #include "xe_hw_engine.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>+#include "xe_sriov_pf_helpers.h"
> #include "xe_trace_guc.h"
>
> #define TOTAL_QUANTA 0x8000
>
>-static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+					    unsigned int index)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>+	struct engine_activity_buffer *buffer;
> 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> 	size_t offset;
>
>-	offset = offsetof(struct guc_engine_activity_data,
>+	if (engine_activity->num_functions) {
>+		buffer = &engine_activity->function_buffer;
>+		offset = sizeof(struct guc_engine_activity_data) * index;
>+	} else {
>+		buffer = &engine_activity->device_buffer;
>+		offset = 0;
>+	}
>+
>+	offset += offsetof(struct guc_engine_activity_data,
> 			  engine_activity[guc_class][hwe->logical_instance]);
>
> 	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
> }
>
>-static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>+static struct iosys_map engine_metadata_map(struct xe_guc *guc,
>+					    unsigned int index)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>+	struct engine_activity_buffer *buffer;
>+	size_t offset;
>
>-	return buffer->metadata_bo->vmap;
>+	if (engine_activity->num_functions) {
>+		buffer = &engine_activity->function_buffer;
>+		offset = sizeof(struct guc_engine_activity_metadata) * index;
>+	} else {
>+		buffer = &engine_activity->device_buffer;
>+		offset = 0;
>+	}
>+
>+	return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
> }
>
> static int allocate_engine_activity_group(struct xe_guc *guc)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> 	struct xe_device *xe = guc_to_xe(guc);
>-	u32 num_activity_group = 1; /* Will be modified for VF */
>+	u32 num_activity_group;
>+
>+	/*
>+	 * An additional activity group is allocated for PF
>+	 */
>+	num_activity_group = IS_SRIOV_PF(xe) ? xe_sriov_pf_get_totalvfs(xe) + 1 : 1;
>
> 	engine_activity->eag  = drmm_kcalloc(&xe->drm, num_activity_group,
> 					     sizeof(struct engine_activity_group), GFP_KERNEL);
>@@ -60,10 +85,11 @@ static int allocate_engine_activity_group(struct xe_guc *guc)
> }
>
> static int allocate_engine_activity_buffers(struct xe_guc *guc,
>-					    struct engine_activity_buffer *buffer)
>+					    struct engine_activity_buffer *buffer,
>+					    int count)
> {
>-	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>-	u32 size = sizeof(struct guc_engine_activity_data);
>+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata) * count;
>+	u32 size = sizeof(struct guc_engine_activity_data) * count;
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_bo *bo, *metadata_bo;
>@@ -118,10 +144,11 @@ static bool is_engine_activity_supported(struct xe_guc *guc)
> 	return true;
> }
>
>-static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe,
>+							    unsigned int index)
> {
> 	struct xe_guc *guc = &hwe->gt->uc.guc;
>-	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>+	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
> 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>
> 	return &eag->engine[guc_class][hwe->logical_instance];
>@@ -138,9 +165,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
> #define read_metadata_record(xe_, map_, field_) \
> 	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>
>-static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+				   unsigned int index)
> {
>-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
> 	struct guc_engine_activity *cached_activity = &ea->activity;
> 	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>@@ -151,8 +179,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	u64 active_ticks, gpm_ts;
> 	u16 change_num;
>
>-	activity_map = engine_activity_map(guc, hwe);
>-	metadata_map = engine_metadata_map(guc);
>+	activity_map = engine_activity_map(guc, hwe, index);
>+	metadata_map = engine_metadata_map(guc, index);
> 	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>
> 	/* GuC has not initialized activity data yet, return 0 */
>@@ -194,9 +222,9 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	return ea->total + ea->active;
> }
>
>-static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe, unsigned int index)
> {
>-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
> 	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> 	struct guc_engine_activity *cached_activity = &ea->activity;
> 	struct iosys_map activity_map, metadata_map;
>@@ -205,8 +233,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	u64 numerator;
> 	u16 quanta_ratio;
>
>-	activity_map = engine_activity_map(guc, hwe);
>-	metadata_map = engine_metadata_map(guc);
>+	activity_map = engine_activity_map(guc, hwe, index);
>+	metadata_map = engine_metadata_map(guc, index);
>
> 	if (!cached_metadata->guc_tsc_frequency_hz)
> 		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>@@ -245,10 +273,35 @@ static int enable_engine_activity_stats(struct xe_guc *guc)
> 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> }
>
>-static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>+static int enable_function_engine_activity_stats(struct xe_guc *guc, bool enable)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	struct engine_activity_group *eag = &engine_activity->eag[0];
>+	u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>+	u32 action[6];
>+	int len = 0;
>+
>+	if (enable) {
>+		metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>+		ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>+		num_functions = engine_activity->num_functions;
>+	}
>+
>+	action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
>+	action[len++] = num_functions;
>+	action[len++] = metadata_ggtt_addr;
>+	action[len++] = 0;
>+	action[len++] = ggtt_addr;
>+	action[len++] = 0;
>+
>+	/* Blocking here to ensure the buffers are ready before reading them */
>+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>+}
>+
>+static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned int index)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_group *eag = &engine_activity->eag[index];
> 	int i, j;
>
> 	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>@@ -265,34 +318,106 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
> 	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> }
>
>+static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+
>+	if (!IS_SRIOV_PF(xe) && fn_id)
>+		return false;
>+
>+	if (engine_activity->num_functions && fn_id >= engine_activity->num_functions)
>+		return false;
>+
>+	return true;
>+}
>+
>+static int engine_activity_disable_function_stats(struct xe_guc *guc, bool enable)

enable is always false here so you can just drop the additional function 
parameter and just use false below instead.

>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>+	int ret;
>+
>+	if (!engine_activity->num_functions)
>+		return 0;
>+
>+	ret = enable_function_engine_activity_stats(guc, enable);
>+	if (ret)
>+		return ret;
>+
>+	free_engine_activity_buffers(buffer);
>+	engine_activity->num_functions = 0;
>+
>+	return 0;
>+}
>+
>+static int engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
>+{

Likewise enable is always true here.

>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>+	int ret, i;
>+
>+	if (!num_vfs)
>+		return 0;
>+
>+	/* This includes 1 PF and num_vfs */
>+	engine_activity->num_functions = num_vfs + 1;
>+
>+	ret = allocate_engine_activity_buffers(guc, buffer, engine_activity->num_functions);
>+	if (ret)
>+		return ret;
>+
>+	ret = enable_function_engine_activity_stats(guc, enable);
>+	if (ret) {
>+		free_engine_activity_buffers(buffer);
>+		engine_activity->num_functions = 0;
>+		return ret;
>+	}
>+
>+	for (i = 0; i < engine_activity->num_functions; i++)
>+		engine_activity_set_cpu_ts(guc, i + 1);
>+
>+	return 0;
>+}
>+
> /**
>  * xe_guc_engine_activity_active_ticks - Get engine active ticks
>  * @guc: The GuC object
>  * @hwe: The hw_engine object
>+ * @fn_id: function id to report on
>  *
>  * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>  */
>-u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+					unsigned int fn_id)
> {
> 	if (!xe_guc_engine_activity_supported(guc))
> 		return 0;
>
>-	return get_engine_active_ticks(guc, hwe);
>+	if (!is_function_valid(guc, fn_id))
>+		return 0;
>+
>+	return get_engine_active_ticks(guc, hwe, fn_id);
> }
>
> /**
>  * xe_guc_engine_activity_total_ticks - Get engine total ticks
>  * @guc: The GuC object
>  * @hwe: The hw_engine object
>+ * @fn_id: function id to report on
>  *
>  * Return: accumulated quanta of ticks allocated for the engine
>  */
>-u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+				       unsigned int fn_id)
> {
> 	if (!xe_guc_engine_activity_supported(guc))
> 		return 0;
>
>-	return get_engine_total_ticks(guc, hwe);
>+	if (!is_function_valid(guc, fn_id))
>+		return 0;
>+
>+	return get_engine_total_ticks(guc, hwe, fn_id);
> }
>
> /**
>@@ -310,6 +435,25 @@ bool xe_guc_engine_activity_supported(struct xe_guc *guc)
> 	return engine_activity->supported;
> }
>
>+/**
>+ * xe_guc_engine_activity_function_stats - Enable/Disable per-function engine activity stats
>+ * @guc: The GuC object
>+ * @num_vfs: number of vfs
>+ * @enable: true to enable, false otherwise
>+ *
>+ * Return: 0 on success, negative error code otherwise
>+ */
>+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
>+{
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
>+	if (enable)
>+		return engine_activity_enable_function_stats(guc, num_vfs, enable);
>+
>+	return engine_activity_disable_function_stats(guc, enable);
>+}
>+
> /**
>  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>  * @guc: The GuC object
>@@ -327,7 +471,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
> 	if (ret)
> 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> 	else
>-		engine_activity_set_cpu_ts(guc);
>+		engine_activity_set_cpu_ts(guc, 0);
> }
>
> static void engine_activity_fini(void *arg)
>@@ -360,7 +504,7 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
> 		return ret;
> 	}
>
>-	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>+	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer, 1);
> 	if (ret) {
> 		xe_gt_err(gt, "failed to allocate engine activity buffers (%pe)\n", ERR_PTR(ret));
> 		return ret;
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>index a042d4cb404c..b32926c2d208 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>@@ -14,6 +14,9 @@ struct xe_guc;
> int xe_guc_engine_activity_init(struct xe_guc *guc);
> bool xe_guc_engine_activity_supported(struct xe_guc *guc);
> void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>-u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>-u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable);
>+u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+					unsigned int fn_id);
>+u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+				       unsigned int fn_id);
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>index 5cdd034b6b70..bab0ae6cae00 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>@@ -79,14 +79,20 @@ struct xe_guc_engine_activity {
> 	/** @num_activity_group: number of activity groups */
> 	u32 num_activity_group;
>
>+	/** @num_functions: number of functions */
>+	u32 num_functions;
>+
> 	/** @supported: indicates support for engine activity stats */
> 	bool supported;
>
>-	/** @eag: holds the device level engine activity data */
>+	/** @eag: array with entries to hold engine activity stats of global, PF and VF's */

If I understand this correctly, now eag will either hold global OR hold 
PF and VF. You might want to describe it here.

/** @eag: holds the device level engine activity data in native mode. In 
  * SRIOV mode, it points to an array with entries to hold engine 
  * activity stats of PF and VFs.
  */

Thanks,
Umesh

> 	struct engine_activity_group *eag;
>
> 	/** @device_buffer: buffer object for global engine activity */
> 	struct engine_activity_buffer device_buffer;
>+
>+	/** @function_buffer: buffer object for per-function engine activity */
>+	struct engine_activity_buffer function_buffer;
> };
> #endif
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 4f62a6e515d6..f8f6ebb7c9c6 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -245,10 +245,11 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
> 	u64 val = 0;
>
> 	hwe = event_to_hwe(event);
>+
> 	if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>-		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe);
>+		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, 0);
> 	else
>-		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe);
>+		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, 0);
>
> 	return val;
> }
>-- 
>2.47.1
>
