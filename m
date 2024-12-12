Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A36BE77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 12:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A4B10ED9A;
	Thu, 12 Dec 2024 12:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AabF+tQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C9210ED9A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734007565; x=1765543565;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jQaC9mnSCAp8IbdW+kTlFVifgSOpvoFckWAx75trmww=;
 b=AabF+tQ9KV+jUxol1anMLdxdR6+8ExGSqS9Ur6l9gdyiclFlJWV8YaQC
 AYQEkrB7kfz4HMQ86KT0w9RqK4IkpzcHWy/icItGiMPkRjCvNwFOdaoLo
 f873eLN0ASRaaNGjMTvAbSh0RKzGlkm4cIrW4auH05DjTN0DqrvQeU7wZ
 q2Z3IftfVqVGqGTGExtPO5i2jec/rHF78rFBBb7N4R29qxvTsAi6e92q5
 Bq9LAA36vEtUfsaQfsCnfKVHBvb50mIq6DlrG3n4Zt/JfCEc+bi1jQo9p
 8nGC9h7yEJRz1YwIhLCavH0tcD99AfFHs1ZAn3etyUFyvp8YrYRols/6Q A==;
X-CSE-ConnectionGUID: bx8Vqdf+QQO7KWTb+jLwwA==
X-CSE-MsgGUID: 1qUZnd2rR326GGUNQVzAqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37266446"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="37266446"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 04:46:04 -0800
X-CSE-ConnectionGUID: 2y8CdA7ATTuMUbDYrgyHqg==
X-CSE-MsgGUID: 8McV6JynSTuJ6vujGYuDig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100385237"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 04:46:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 04:46:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 04:46:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 04:46:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFeN0QMxCgbamTZK/iuLy9MKdF9qy3WHieGoFsur770Jkr5OB4tIerSemmy1n4lOJohqLhLCkDiMeogg/2ZBhq5BCd064DJ2U2lqpULkol6lsbhzmNGunyly11k53NJF1smkDgEK8oSPIFncwgKzEz7AmwiMgqLZ9a8A1opSnbJ0laFVHQhqS9QS9tfIhmWKPQeEe8vzBLaXjpvduGxVJ7sZkkXKsDmh6uLUE7FBs9sPpwJ3IZcskgjoFKB64kM2V+S1lqMMxT6mstvNfZxNer07Qu3o3sH/Ud3Lsi+yEDSwxTbo9Bm/i8IkDIJ8L0PMpAAgpu5qr7Ptlfa5muw8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUN53v9Db4PVvbdF3TduwU3C7iI2Q9360TwPuX951co=;
 b=eZDmoatuMfujzyXH60dYJ1WFxnSh6OZHGsCB5PpxuKr82jbmzXfQX2o7jO8/9zawyCuJoaJsFvDFRXDHHxwyXvbvpD/Fz4AOeOAD9O5rsX8uU6Wy2Ei82NLnhBc1NqsBn+EzZfdx17kHt3vRMalZfCU9+EqmqHIogdBOst7ExXuCqKF3C7m4kyvFBVBle8y/T09IeXZOpmYu92c7wcaxZSWRbOpgzF51FKw/IgiuRyPnlnIYpHJURs5p7V+LQ688XLWniPVge7J3Zd1jnHLOkxuT+wBVdp97LEWjm/QLCUwSiUfD7LAF42lwlQJ1X5d0dJaaCK2L6pVCBYFswuVtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 12:45:18 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 12:45:18 +0000
Message-ID: <5d86e98d-c015-431e-a07c-8a8c02a0400e@intel.com>
Date: Thu, 12 Dec 2024 14:45:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Make irq enabled flag atomic
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <piotr.piorkowski@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
References: <20241210173506.202150-1-ilia.levi@intel.com>
 <Z1nWXdfn_azp1KLK@intel.com>
 <b6x4mamnsw2ljm7n7tl7amqmdwqnihjdnufiowudm2i4fxowun@wa2y7s2t2kke>
 <Z1ogPhzM1eD6VtlR@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <Z1ogPhzM1eD6VtlR@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::12) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|BL1PR11MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bc738c-5e61-4408-3d88-08dd1aaad515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejlQSVdjbDFFT3l0M3N4S0lyeFpnUjFqZjMwN0FJa21QZi94Sjk2a2lySklI?=
 =?utf-8?B?WGpEWU5vQmpDN2s0MGRJQTdZNmhyOTl2YXdYS3gyZU1xdzI3Nk15SGJHQWwv?=
 =?utf-8?B?RW9ZVDFQZGgzdkVGL0MwbEp1RDJhcUhvNmgwaXZIT3BNamVBZzlZQlkxVlV3?=
 =?utf-8?B?WVBTVU9rSG5FOHRUbVYrL0o4KzRUUGxiWkZac25TS3ZKelFadDFNUzdJRGZl?=
 =?utf-8?B?S09WNW5oYVlYL0JPZ08ramRHdVZXUnhMb2dybmpWTG9OcDFsZXFELzFnODM3?=
 =?utf-8?B?QTl0dUNJMzFBQlNXc0tUNlUxNEh2Z2pGMldXOFVPYVlIMnBCQjVQUDBOR0tE?=
 =?utf-8?B?OWVCVjl5YXpXcEozWFpZbUk2QkhieGJTTExVNHJoZEhvUFE0R1E3ejYrbnhJ?=
 =?utf-8?B?VVB5NDZlRHBPN1B0KzhIZVFPamhRK1VPN2lxbHlOdXRsdVdVUkxHNlJwYU95?=
 =?utf-8?B?eWdKT0h4TGYwN1pwdE9PQy9Ia2EyZ21RaGdRUi81WnVqWk9iWTNna1dyOXpk?=
 =?utf-8?B?QU9WSmQyd0dZTDkrMmlhdjZKOTBpN0lHREJmZU9Md05EYjJtaUZMQ2k2RUZS?=
 =?utf-8?B?Q0lQSWpyWGhwWFFpdWdFZnlqazE1SEJGNmRjQUJWbVJPSTVvdzRTUzVxc01O?=
 =?utf-8?B?bDB6T0Vpd1FUYVk4N2dOUmRnRUJxcWNzeGpDeVlPU1ErOTduS2t2ME5iYkpS?=
 =?utf-8?B?dWl1L2g3SE02d014ZFBCTVdtMFUvdlhoWjErRW1SZGd6YWZpUTdwRjZtTElm?=
 =?utf-8?B?cnNuNGhIM3FvMUs2em9SQXZRdU15WDh2RUF3T0UxYmZ0STRLZmVPWmRjT05j?=
 =?utf-8?B?bkNYdTJmNGpMckR5ZVpxYnRlOEhQQVpOK3Uxd3l1ZGNOaUxldS9WYWc2WFhq?=
 =?utf-8?B?a2ZFak1nYmpFcjRnb0dGSVZHejJXRmxhbUFjSVVGV0pIbmNlYTlURWhpYm1N?=
 =?utf-8?B?TktIeENCOHBPU2liRGd0ZVBsazcySnQ2TzA0WXNZLzF3ZGRNamFyNDdrUUpr?=
 =?utf-8?B?WVZDeW1zZHBSU3B2TFZwNVFVWWdablN5L21TNnBHeURKbzUxUVQyZThYTkx1?=
 =?utf-8?B?U3lZM3NWUFN3RXdhcWsyeXVvbUJSVG9DelhoRXo1OGtJSTMzZVRiMUJRV3ln?=
 =?utf-8?B?TUdpR1plSldnMFVJcXRBb2VLL1FuWldtQlZ5Zm1qam9mNmo1Q29GRUh2bmJn?=
 =?utf-8?B?MGI5ZE4yVXNVc0NYK1d5RGF1QWN3RGZjclpKMDdJL24rT2o5Q1plNDlNajQ3?=
 =?utf-8?B?dk1LcUdONTRFWVVSVkNRY0MxeGpUR0x5UzhwcFppUzkyTlpnUG1XMGFnZmwx?=
 =?utf-8?B?TkxzbEc4aGkrM0lSMXU2bUlJVllUR2pKdUl3akRXYmt0bkV1ZlFadFJkMCtF?=
 =?utf-8?B?YjdBeUUvUHlaK2JncTVYV3N1eHhSTjlnenRtTmNJYzJYOTFsdnFub2lOeTFu?=
 =?utf-8?B?UlFLNXhrbjJUdURLYll2Z21YV3QzNFlqaEFEMmVDeFgzVXRpTURwT2RPWVFo?=
 =?utf-8?B?UDlyUERKZk9YSkNkUFdsMmpGaE1WODJ5K1NWU3kwMkY4N3VLeEltckE2anEr?=
 =?utf-8?B?NWo4dFM1cnF0eTExSE15MmhQMlIvQ3N2ZFo5eno4b1UvbllTN0R1aTVzaXFU?=
 =?utf-8?B?dGhxdkMvYWhaR0VBdlR5QVZUOE1sZ2xGMUhsaDg2MHduRjJYblNNRllVTkhX?=
 =?utf-8?B?Q29ZWUh3eFBBWVNuL1h6dy9GNjA1YldPak1RUGlGbHRsbXFCZUFiTVJ3T2JM?=
 =?utf-8?B?b3RwOFN3Y1hhNFZQaDdGR0dpUC91MDdIWVhudFBxUGJvcXJiK0lZaFo4UDIx?=
 =?utf-8?B?NDNFNW1kWHdaQjdkdEF1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGlseFR0NTBvTFBYSTlzRXEvdUl2SndaeTV4K3Vzb21rdHZ0VlJnSjZxWVAv?=
 =?utf-8?B?Zyt4U0NBM1JIWXRqUnFEQzlGVUx0RmR0M3VhUkk5a2hjRkV2cnIxQTg3NjY5?=
 =?utf-8?B?dzZTK0QyZWhZQ0syQ2NhOXZ2WW9nWTRCbG8vRXdCVGd5K2lsVFZkTEJ3NTVV?=
 =?utf-8?B?SzNGa3duZTZVT0tDYnZkV3VxUkltZWd0VUZvMndaYTM0bUhhbm1WRWRwc2lS?=
 =?utf-8?B?Tkk5SDZkWlZPcDZsQzliZ1ovZzVJR1I5YklVeVpYc0JQcEZzSlV2cFQ1dGo0?=
 =?utf-8?B?bHA1b0pmZjNJRTJrMHNrSlR4TEQ2a3d2TTRmSmErdlJENVdLd3ZpQmVNTUpG?=
 =?utf-8?B?WFlISnFIek5iamlsMk9sK1Y5NytyRjlRUWw4d3pYNGQxcjN0Qy9DaWpPa3dV?=
 =?utf-8?B?WDRwSG9SK3ZWYlFnRkNYdjQydXYxSkJVL3VuSUFFaWJiT2gvOEE2K3dXZnlG?=
 =?utf-8?B?cHp2aEV1dDB2Vm5mUzJxZlladGtQUUt2M1o1dGZCYWE1TEIxOUFNUHFDam9k?=
 =?utf-8?B?OHErbDVlY3F2clRMUjFMVDArSmpxYzhPTEoyOEZYUW9kZ3NIOTI0eXZaeHhS?=
 =?utf-8?B?YUMyVjVobnQ2WUVhMVBLV2ZIeDU3UE5BdDhzc21jRzFVWjNnRWVwVE1BcmJE?=
 =?utf-8?B?MnByL09ub3NXWGNvRnJIUm05dXp5TkpCUFpqdTRwSjIzaHdIVDMwNjduVW53?=
 =?utf-8?B?cFdYY3lXS3Y2SjFIb0dSMmhnUnk3K3p2b1hPQThkRWFHVzVZQW1UTVlqc2g5?=
 =?utf-8?B?M2lOVFV1OTFRUVlnSHdYWFJEN2UvQXVnbDlzdFpkR2dJVzQ3ZTMwWFRNUHQv?=
 =?utf-8?B?alRGWXhFTmUybFJoT2ZsOHNIY2o1bk40K1Q1WExmWSttTXRGbFpjckZOVmJW?=
 =?utf-8?B?QndBaGhNNW1pVVgzaWhXU1MvVStybWF4YmlvcktERVl2Rm01S2ZKK00vcnd3?=
 =?utf-8?B?ZVFuQmFPQ1hqK3FRQldoN1ZQNW1VV0YyaE9POStBbDZvNmo4U0tnWW5GZnF6?=
 =?utf-8?B?d0NST2tXdStjQ1R4L25yVk9nVGxDcXpRWlByYjArTkZTa041YW9vbm45VFpu?=
 =?utf-8?B?YVI2akYxVHpIcEhHelRJR0NHOUYrSEt3OE9iOVFvS1FlOWJGUlNJc2k4ZFdG?=
 =?utf-8?B?c1RTUkpJYnhkbU4rVzBFNzhURTBWUEVLTDlOMExnNVB4UU4xSVdNL1BTYmIy?=
 =?utf-8?B?K0ZpUFlmRk9YamxqM0FJaU9vMEV4K3ZTai9SZW5zMWU4cTNoUjU0WlVLREF1?=
 =?utf-8?B?NlJheW00b1J2UUZtVG9oWWdWZ0ltdGRNZTJvTlVOSkFmQ3lQNHBodUdhS0ZO?=
 =?utf-8?B?QmZiWmdIY05PMkRKWDJTSjdYdzNvSVZoUm5XZi82S1lwdm1Tb1RwRE5TNGNH?=
 =?utf-8?B?dVpHVlhFVnFTUjd5dEtpWnpHMGRjV2tPVm1rdWV1bWtSY3EveGdWZWZraE9G?=
 =?utf-8?B?ZHFFdFNBSUxNdVhrQVA0VnB1TVBXcndaZFNmSXNHN04yZHlBVTRTRU5EWWF3?=
 =?utf-8?B?L215UkNKYXA4NEh3anZGYmVPN2dsT0VQd0RlalFxaFduMlJDYmMvSUxpY1p6?=
 =?utf-8?B?N2FFcE8rUWRmYklzem0rVTQ0b3Z1VURaMk40NDVRaUZ4Tzc5MGxJMENEOW5l?=
 =?utf-8?B?NHU2RnZ1MFdtYVFoSy9JTjJZSklaR2NOMUV0R2FuZEtuM3hRV01ia0lTNmpU?=
 =?utf-8?B?MGNZSlZ6Nm02N09LWGwrclhXOWczb3p3YzhEaitoQ3ZFUTYxYzAzTjZLNCtD?=
 =?utf-8?B?VDd2YUlodjdRSnA4S21ObXdPMnpNNkttczlGTVJiMFMxdlRHejhuUWhzRHFX?=
 =?utf-8?B?NGU1Y0hhMXdvUXFHM0ZHVG5lSXY4dHEwRmpzTjVDK0txdTZFdUI2d3k1amdn?=
 =?utf-8?B?eXh5U2dzS2pxWWUwT3dwY3NERE1JeXJpdXlCdDQyS1oxR1pVc2x6NExiU3ZU?=
 =?utf-8?B?dTBHcVlHcStndzhsazdaM2t3YStEWWJzZWdaTW5uK0lCdm9zOTJISWpURFRI?=
 =?utf-8?B?SHRVT25Sai9OS3ZmZWhGTGtsU09nRkJONXpTci9Ibm1qZjk1RVpUNVZUZjlw?=
 =?utf-8?B?M2tKRXRvZzV5V1FJQ3lhTVA1WC8xc0d6cWkrQXNiV09wTmRiRFVhRHQ4ayt1?=
 =?utf-8?Q?9kkck4KCewe//pZ9jY2vNmbBT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bc738c-5e61-4408-3d88-08dd1aaad515
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 12:45:18.0709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHAQIs2tvjkoWLQ2Lv8oOn8cmgLY5Uzw4nRzL/V/qtevx4R8m6bVq8KTKosmEa6cXr5uaxTsgNkqhDTYtQm9rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
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

On 12/12/2024 1:29, Rodrigo Vivi wrote:
> On Wed, Dec 11, 2024 at 01:58:08PM -0600, Lucas De Marchi wrote:
>> On Wed, Dec 11, 2024 at 01:13:49PM -0500, Rodrigo Vivi wrote:
>>> On Tue, Dec 10, 2024 at 07:35:06PM +0200, Ilia Levi wrote:
>>>> The irq.enabled flag was protected by a spin lock (irq.lock).
>>>> By making it atomic we no longer need to wait for the spin lock in
>>>> irq handlers. This will become especially useful for MSI-X irq
>>>> handlers to prevent lock contention between different interrupts.
>>>>
>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>
>>> pushing soon to drm-xe-next. Thanks for the patch
>>>
>> I just saw the commit in the tree and was wondering... why exactly do we
>> need that flag checked in the irq handlers?  why can't we simply do
>> a) turn off irq
>> b) synchronize_irq()
>>
>> kind of like xe_irq_suspend() is doing, but in the opposite order. It
>> seems this was just copy-pasted over and over or am I missing a
>> synchronization here?
> A very good question. We likely don't need that check there.
> Ilia, perhaps you could give it a try along with your upcoming MSX IRQ
> series?
I think turning the irqs off while a handler is running is problematic.

Specifically, the thread that does suspend will disable interrupts and the handler will re-enable them:
Thread: xe_irq_suspend -> xe_irq_reset -> dg1_irq_reset -> dg1_intr_disable
IRQ handler: dg1_irq_handler -> dg1_intr_enable

What do you think?
>> Lucas De Marchi


