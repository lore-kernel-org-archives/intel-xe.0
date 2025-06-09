Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03602C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 22:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B20D8992E;
	Mon,  9 Jun 2025 22:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuCaDZMK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62398992E
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749507108; x=1781043108;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DipNM18VgDILrJlRGLVOofX7gEJqx7dXd57x5XhXep0=;
 b=TuCaDZMKtYp9QRLJE69AAsKQ/HfgXodDnayW926tnLwhO7MK+p2/CgGw
 +iY0VEK1l65mt+nzy+Huic32EmwyVDAsJNTAyA3MB7Isfgf7roX3GHNep
 eQnalAHLYG/S+94mGIxe7xWCc07yDsTQG0myZ5IWx0oVmH1xezr1RvEEj
 b5zYo4+rUJEI1hyCaur8alwTaObB6uVcNavrZlL2RPaVHhaUqQvidbBfc
 d/zeyugtse1yx2+CaVKBy1CaXfuBGGawrzVbBNcsIC5NBHDrMD9KTV8+9
 aLNSstq3p6Bw0r5KqzEGqZ/jDuaYoUHocG/1SOhQ0zTcTZVBjg4xWKGVZ g==;
X-CSE-ConnectionGUID: djfftRuUSGWroucuWoyO5A==
X-CSE-MsgGUID: mP4ZKUhYTkOMY2MWGnMltQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62254582"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="62254582"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 15:11:48 -0700
X-CSE-ConnectionGUID: K9mYpq0PQ264iOKJ55xHHw==
X-CSE-MsgGUID: /CJaefV2QV6eh57q73al4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="146622636"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 15:11:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 15:11:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 15:11:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 15:11:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kenWbi0n63loGkb/f1ExoXEL37jP9FaCZ3HxqnxiSaZaiQ97dMATgeVqabNBCbWkpvBfQwk/jVgruJ88akv5mSZYiQWVGnC1j+BWjEUVERNLoa75AYrvKsk2OX6SZcWbcTdXz31cxqfcaXQHzVj6MLpZTNw4CGNAv0sGZv5opx9FGKyGIg3qgRNsc9/kPbXHD5aKUgkHccmB+lWpf0gjlF5hSoeItbnLH3kPiz21Ti8NTRbT1UQyXn0MHyOAmYoKij/B+I3vHcVesBcW+llyHVGs/ZcLbtHKEjSyjtc12CW5kdvYgxMpWp4xflJZ4EhDpfNleTGR6TdpHAV3dBMieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcHd8afXUY0PUVmUwXKrQzDHh8OCw4WnK91N5EnbBBA=;
 b=bPkzQeRVaiVPKsoQ2+ubF5qLXoQugXEibQvErjJcag5RgwJkT9BY20jtgs6LKUiXJWMNZj2daaqTTVCcn7c6e9YfVKaDrOOCdveX287ZZem2DDT1CzUe9IlIEIWU9ukG3c3ka15ALw81tQSXDcfCey2swEeMd7smIh7dbL+xW9x0vJUDs6F3wPrIbbTAIaa94TkcaF11yPRjzA/fAmBQCEdWfwqWFR1HTvUpLpvjDtJAm8lbgUKhkupd/dtkK7olUz+LaDHN1BNz+K/sKrKt3V+cLKXDdc6PNOh2e0PaZ9PEEDBFcSj3AwLHJjVS2O9//AExRrYFSC0CyZpH5d5U3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL4PR11MB8821.namprd11.prod.outlook.com (2603:10b6:208:5a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 22:11:45 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 22:11:45 +0000
Message-ID: <6f4f4aff-7e83-4b40-920a-2edafa60b06a@intel.com>
Date: Mon, 9 Jun 2025 15:11:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Make debugfs guc_log_dmesg attribute
 write-only
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250603175302.593-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250603175302.593-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL4PR11MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 135eda95-d93e-4a1b-84f9-08dda7a29edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWkvYVlxbys3NWpab2NaWjRtaFpkazBSTWh1RjkxMkpWWUNZUTl4K012bkk4?=
 =?utf-8?B?STFpTTlFcVhNUkpmbW5NOVNneFdxb3hWcE1IQU5XWVVOQW1JczBRb01SZ3Vy?=
 =?utf-8?B?ZzhyUlFsSTlJSS9hTFhmQ2NRT0x3Q0NyZ2dMbHFrN3pLZnhzbFNqUWpRZUV2?=
 =?utf-8?B?eDgvRXZYRUlXV0tXejNBY1R4bkhNeHRwZ1M5SkltK1pJUjBFME1FZjZEK0Jx?=
 =?utf-8?B?eElsMlRVWnloMGxDOWU1dEtTb21yVEhiQXo2V1ZlOHNpTWEyWkY5UFJzQUJZ?=
 =?utf-8?B?dElhc3lObTZMcDNsa2RDaXhRZlpreUxTVmplcTN2dnJGSWRqZmtlcWxzZmpB?=
 =?utf-8?B?Z0RQTjM1aUxGYWV0dTJkRmJTVjkxWnFkZy9LWjI3bkdxYUFSeUh3OUJWQkd1?=
 =?utf-8?B?MUowb2tkR01DK0JSVG9vUkJzVFc3d2R6ZmlxY3NiMVNMRUJ1RkVUcUM2SFZm?=
 =?utf-8?B?NC82WVlPTXNVbjU3eTVvcXAyWkNEUjc5Y1JUNkFROFJxUGowSTZ4QnVBTlQy?=
 =?utf-8?B?N1l1Vi80L0pjY3JOZ3Q5aCt1SVhUVzhGUkFJN0hielFsUmhHSTdaVmJHbjhK?=
 =?utf-8?B?YjV3MWFjQyticWJ6OUhPaGVVT2dFcW5ZdG5xUDgrWTIvdW9yUm1LOTgzRXpm?=
 =?utf-8?B?aGdYSGNibUNsTHJzUVZmOXVQYUlMckM1T3hpSlFKZ0xJMkNYOFpDYjdRc21B?=
 =?utf-8?B?dWg3d0hQaWFvcGlaUUsxU3NId3lJSEQrTkJsZWo4M0VkcG1YdEZDSWR0ckNk?=
 =?utf-8?B?ZVpEdEE0WXJRYkRDMzFBYW9yMS9QcXJqOWRVdXIvZmFjME5HaFRXVTF3SE1y?=
 =?utf-8?B?RXk1eFcyenZtZEtiVWNKSG5rRnh2L2w1L1dBdWtLY2VwSjNDUDllaGRqdzV0?=
 =?utf-8?B?VWMyeGtBTGhTOXFMdmQ3Z0NzNUUxVWFPdzREOVBtUTB2NWllNjdmZWZqaXo5?=
 =?utf-8?B?Y3l5U0tIeVFGYXJYZlVMMjFYYnV5ZUVUUUdXNmRrdXNQUjlDcTBGNWJNaGV0?=
 =?utf-8?B?aWVyK0d2ZExjWkwvYTdJSEs2TVQvZDBUM0ROL1Q2bkorNE1JWVQ4VFhOZllr?=
 =?utf-8?B?TU1Tby9TVXdLOGRzcnQyeEZIREZiY2VKL2JUT1dib0lYWXVvcSsyaTMyOUpK?=
 =?utf-8?B?N2NFOVg3SmtjQUsxNW9PS2NOQ1JMOURxbGhvNE0yNUllL3pKRVVVSzI4ZlBR?=
 =?utf-8?B?bDdLYmo4d2t6UlBKdzhYbit5MEVJbVRTT1cvWVNZandMTUw5MzNVT29UbXFG?=
 =?utf-8?B?V2tMRmc0bXNtUFo3YnJYcnJ3Qk1oM1lDSDFQSXZSQzN0VkJCcjFnZlBpMU1E?=
 =?utf-8?B?eWZmWStlcm9oZE5BK05tU3AyNnlzTnMrZ04zdHljbm9Ta1Rqc3R0c3lJVG5V?=
 =?utf-8?B?M2lUSGtBT3BDcDFqQXBhSTNLQVZVS0FxZmRnaXliVDI1a2tWQTZRU2FLNTJj?=
 =?utf-8?B?Tml5d3FrRDZWT2hURkNhNDAwN2hsY010dVFCeWNJc2dVTTNIbUdOcmtkVUwx?=
 =?utf-8?B?OHk5TUh2aFJtUlJ5T2JNbzVvZ3ZrVEVyVlBBZEx2V1RPcUl4Wkd1NHp4b2FG?=
 =?utf-8?B?TFlURjFmMWxONEptQjROSVJiTUFPUHk5RWxIZ1JHVlBzdm5wcUgyNUIrTkNN?=
 =?utf-8?B?UDBuYnhESHBaZUZnaWlqQkwrY2hEMEo0Wm1ObTRpRnQ0YmNqbW5KcG5zK0xx?=
 =?utf-8?B?aXNWK0s1N28wdFkzb3o4bGhOdEx6MFZLREtDNEdwMXZsTnN2UWpZTlBjVVJM?=
 =?utf-8?B?RVFkRHJONnZpM3Q5MjdNdFQ3M0UvOHl0RUxLMHlSNlRyRTZHazlQVnE0Y2tI?=
 =?utf-8?B?dmNybG1YaUFHTUMyR0xHUVFlOEdDWmFyNXZ0VXgzWnJGTUdPV21vWGViM2xP?=
 =?utf-8?B?aVVlNnZoL2R0Um9pOVpBeDlRQ21ML1I1aGwyUXdnMVdXYlpMNytHWWZFeU5i?=
 =?utf-8?Q?zjZYtzB8cxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXl3ZWIvR1NVYXJ0QVV3RmxIdnRSaHJINHJSNUxVSmZmTWkxQ0hRVktsUDVZ?=
 =?utf-8?B?L1NMc01aWG5rY3BYNzR3OUtPNVI5SWlKdkZHQjdMZmQ5SkhqUXdOM0RWcU80?=
 =?utf-8?B?Q3hBVEhTeHpOVUdxLzNZWjdEVHhML0c2Q1dNVm0zb2VyT09tNUk4b1p2M1k0?=
 =?utf-8?B?TncvWU5VeHJ6UitoVXUvOEVGbHRYSXNQY1doYmxBQkNSQmsybGNpR1Z6QUF6?=
 =?utf-8?B?SnBIek5YcnVMakV3OEt4VjFBNjlCVXRBc2czdnBFU1VycHRvMVIxaW8ycWR2?=
 =?utf-8?B?Y1VuVnJEQ3cxZ2crRlB2NWVGeGZBWDhGUmJNeGJreXRReUhTVmF4ZWlwRlcw?=
 =?utf-8?B?RHc4eDU4ZkYxVHJWVzlwRHVuMUFHQis0U2xvR0o3ZjB6VWxpRGdqMDd3VnFS?=
 =?utf-8?B?Y1Z2VmZnWXBYWHo0VXBqdDN6a3NJUm5BUlBHUHlsZ1NaYTVaM3d4N3pvWUdP?=
 =?utf-8?B?VTNVblNnbmdwSFlxNzJJTk43RWxyQUFSNHVaV2V0RTAwMi9hZjk2RjBMbEcr?=
 =?utf-8?B?bm1XTkdVT3RLRVlpS1p2UDMxMjJjazFKWDRxT0YyZE92MEthS0s1YU9nYWFZ?=
 =?utf-8?B?SXorQTFtcmF3UnRVT1RqeXQwc2NhTmQ0UngrSHZmNnZ5VE9JYlkzU3lUanhz?=
 =?utf-8?B?ckczcTdYNC9DY2J6MDJ2Nm9HdmlPMHVoYS92cm16K2plNVdDK3lTWU1Fd2o2?=
 =?utf-8?B?bWcwcVVycEw2QUcyZHRVc2FYN0R0eHlTK2lPRlJDSUxSK0RyZnlmRVZwRWVq?=
 =?utf-8?B?N2k2UWdNVDhOQ2ZWQjVNNTQxcGlPK3JCbEFEcU13WEpscVEyaSt0STk0bTk3?=
 =?utf-8?B?WE1CL1l5OGlkK0lHV2pVeHRnRUYzZ3F0QXdrMUpTZkVpemZNQUVQZ051czRT?=
 =?utf-8?B?cUFoZDAvMDZZOUExejRCNWFueUpPb0dSUGlLbExrVWFGZkNwQUZIMlU1bE40?=
 =?utf-8?B?b1ZHcWRZTkJIRGtFbTVLTGZ0N09Za3VENUpyV3ZXZFhHcVd4Nm5tUE1VckIv?=
 =?utf-8?B?QzY3YjVvdEtFV3JCejlKM0xQQUlIaDFOdTEwOHp0cjljN05QcXFIWHJWZSs2?=
 =?utf-8?B?RURiaVBZOTVyalNxQS9ncjU1QnpqSThRWXczN0VaZFJHUjk0cExsa1U0Rkxw?=
 =?utf-8?B?MWpLYnl4YlhNMXlpUjc1aDRrem5Tc2luRHU4YXErbXozT2haNGc0aldFR2Fi?=
 =?utf-8?B?QmZTdFF5SGp4WTVMNGVKdUQ3eXJiSnB6VjJKVGZYUlA4ZklHQmpnZ0l2S3lQ?=
 =?utf-8?B?a0pnOEd4ZjhJbXhpQ0ZEcHVoZEhmb3JRU3lLbzMraU9hWVUvZjlwbUpWL25F?=
 =?utf-8?B?WnZubW5Bb0pFcmxaY2FEcHdrMUlTSlNsMlNOUGk2M0h2Zzd0eHgwbkQ3ZFMy?=
 =?utf-8?B?c2xmdFMxUjlFdEtQSk1TdjN2b1R2eld2Nm1YREszSHQ5NllicUd6b2plZGQz?=
 =?utf-8?B?aitJOTF5OUpTVkJrM1hVV21XOEZXRTNBK25wZ25sZ3k1cU10TGJ4Tzk3SWN0?=
 =?utf-8?B?TkNxUlJ4M1IwS0R6T2N4N2tUTnhnTXB0MVAvOVR5NDUyTExiOWlLZGpVZEtz?=
 =?utf-8?B?WVFnQzVla3lDb0x6aE1zRi9aQzk4Q1RGUWt4RG5XeHd2LzNheCtOZHFGR1FM?=
 =?utf-8?B?c0xYcTdUUUZ6K1VQbTBiT3NoQURXRjN5YTEvOEtuTDZpUVlBOEMvbTNrUDlE?=
 =?utf-8?B?alJXbVVCMlNoUHZjaDF2ZnkzRStDaUZyWFdEaytkK1liTEFXNnBYYnp6aDVm?=
 =?utf-8?B?bHZhZUduYUUrTXZlLzgvV3E5dFBJOGp6cGltRmZvUnFQc1NhUUNYdkVUZSsz?=
 =?utf-8?B?Ui8wbFJ0YXY4Tjg2UHdkMUtCdVZlVXpaa1hhd2o3Y3gzOG9TU05yaUN3akdF?=
 =?utf-8?B?M3h6cDFwbHBZVVlHa294elZhQmI1emR0ejNheHVDNmNPbDdTSVIzcEQrYjRq?=
 =?utf-8?B?WkFnbnJkbk41Y3ZpWGtRYjYzREtrOXBHaWR4aElKaHdJMGpxWmhxUVI2UndC?=
 =?utf-8?B?MnM5bFBIY21kQ285OHlCSEFkK3l3ZXVuU3UzR2piWmFVbW5aWXNXeFVhbU11?=
 =?utf-8?B?UGd1aU5hVkpsWDJDN0pMUFdLQ2pBYjFid01idXpEdTIwS0F6UjdSU2lhVnlx?=
 =?utf-8?B?RFN3TWowbXRoNm9GVm9oalRmY0M2d3dLTENTOVVGNlBQMHBQZVloRTk3dkhk?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 135eda95-d93e-4a1b-84f9-08dda7a29edc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 22:11:45.0331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCPaYSDS5STtFr5HaJXnR5vk5lXgg0xPoPUXpijzr158BGTebZqiWz3nAonilNwYsgADkwadiyRfFu+m7l9mRO7MStD/776ssRLbi6JQ8+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8821
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

On 6/3/2025 10:53 AM, Michal Wajdeczko wrote:
> Ocassionally we want to dump a GuC log into the dmesg, but current
I would describe this interface as purely a test for the dump-via-dmesg 
code itself. It is not really useful for triggering a dump for actual 
bug investigation purposes. If a system is alive enough to use this 
debugfs interface then it is alive enough to use the official 
devcoredump or GuC-log-via-debugfs interfaces.

Having said that, this change probably needs an IGT test to go with it. 
One that explicitly does the write and triggers the dump to make sure it 
works. Potentially it could actually check the dmesg output for a valid 
dump but as a first pass, just calling the interface and ensuring the 
kernel doesn't die is a good step!

The problem at the moment is that there are multiple IGTs which do a 
blanket read of everything in debugfs. Thus, they get the dump-via-dmesg 
even if they aren't interested in it. And those multiple dumps fill up 
dmesg to the point where CI complains about too much log output. So 
making this change will make those tests more reliable. However, it 
means that we would get no testing of the dump-via-dmesg mechanism 
itself. So unless a new IGT is added to explicitly test the interface, 
we might as well just remove it completely.

> implementation is based on the drm debugfs API and was triggering
> dump on the read operation.  Expose guc_log_dmesg attribute as
> write-only using pure debugfs API to make dump requests explicit.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_debugfs.c | 43 ++++++++++++++++++++++++-----
>   1 file changed, 36 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index 0b102ab46c4d..eb6124d02d53 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -5,6 +5,8 @@
>   
>   #include "xe_guc_debugfs.h"
>   
> +#include <linux/debugfs.h>
> +
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_managed.h>
>   
> @@ -85,12 +87,6 @@ static int guc_log(struct xe_guc *guc, struct drm_printer *p)
>   	return 0;
>   }
>   
> -static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
> -{
> -	xe_guc_log_print_dmesg(&guc->log);
> -	return 0;
> -}
> -
>   static int guc_ctb(struct xe_guc *guc, struct drm_printer *p)
>   {
>   	xe_guc_ct_print(&guc->ct, p, true);
> @@ -121,9 +117,39 @@ static const struct drm_info_list slpc_debugfs_list[] = {
>   /* everything else should be added here */
>   static const struct drm_info_list pf_only_debugfs_list[] = {
>   	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
> -	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
>   };
>   
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── uc
> + *      │   │   ├── guc_log_dmesg
> + */
> +static ssize_t guc_log_dmesg_write(struct file *file,
> +				   const char __user *userbuf,
> +				   size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_guc *guc = s->private;
> +	bool yes;
> +	int ret;
> +
> +	if (*ppos)
> +		return -EINVAL;
> +	ret = kstrtobool_from_user(userbuf, count, &yes);
> +	if (ret < 0)
> +		return ret;
> +	if (yes)
> +		xe_guc_log_print_dmesg(&guc->log);
> +	return count;
> +}
> +
> +static int guc_log_dmesg_show(struct seq_file *s, void *unused)
> +{
> +	return 0;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(guc_log_dmesg);
Is a 'show' entry needed if the file is write only?

John.

> +
>   void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
>   {
>   	struct xe_device *xe =  guc_to_xe(guc);
> @@ -142,5 +168,8 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
>   			drm_debugfs_create_files(slpc_debugfs_list,
>   						 ARRAY_SIZE(slpc_debugfs_list),
>   						 parent, minor);
> +
> +		debugfs_create_file("guc_log_dmesg", 0200, parent,
> +				    guc, &guc_log_dmesg_fops);
>   	}
>   }

