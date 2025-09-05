Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D3FCA1013
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 12:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C5910E0CD;
	Fri,  5 Sep 2025 12:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDhCoOi7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B434810E0CD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 12:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757075699; x=1788611699;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SHu9rgmZ2pclRoydrYT+CQ+CmrJqxSU/i6NDxiH5Pfc=;
 b=hDhCoOi7dIbkPrhE0K4ovrvNSrXnWbp7ZjOKphOPSfHAVJS138TINa66
 rHfhDUFDXtjhvKJMhZEOXtAIJ3/v+6x4MC0v31aqoHkW0VIcw5Coz9X7L
 2TciixD+9GJayxzL2mTN4LzgMLOYDcESBvmoVBqUYXj9nNVKvdIBIDrFy
 3Up6c+xkqqVwG2qwcP5zbjKznstSFRz3pRadWHmrBlF5aAZVYGjRFisoi
 EbX2udolC+NFVUT4t1gdJrDQrDtKoMC3RlzWgkguoHYRBQTvYW1fGrjs6
 2ty2h9txBVynzZQsRMO6UiLb4Hh0rmjcwTdYbsmZqlnew3J1ZRIf1rkcz g==;
X-CSE-ConnectionGUID: PYz2mSncTRK8orKUjS4r1Q==
X-CSE-MsgGUID: gxWnPou9RouUm6Eiq71T6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59497647"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59497647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 05:34:59 -0700
X-CSE-ConnectionGUID: k4fToodlRau0Oxspgi1KVA==
X-CSE-MsgGUID: jokP/6r5TFussUtlXmGmpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="209328591"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 05:34:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 05:34:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 05:34:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 05:34:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNWEzwvSLyByQQ7taQudC57ahTcFekMXF/36vKv4+SdGREQODrYSdZ+6yvQeH5k5mp74Dd7nlJM8tAVhp0xFVu8CuLVUPK5gz9nVdhgp+d5LxVuk6ruzC++qMQc8+4vNwwGW+aLILnAuDdp97qDhxIuToTnmTdbJuFoeWqtRHPKrNgIYILfer7SVoQP/G/frWud4WVyr+U0bFXsTiN5AWaDbCm/hbQLFAMqgkngydraBFLBQiEzg71WoepevdMei1MMm6/zU5PqOjN71IYnVlgdRsSRgOYUsHXGP6/LPi+fIBMk/IiqjCyQ85N+60DxsZCjHG8GPeLo/2IAiEGECQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7dLXGQRfUX23Jc7ukicvRt7X3nb9XWPOvZVZOLIbOw=;
 b=Ct5qDfGmVeiFN1MldrSgJ9xQBy/me36bW9FvbjeRUb+mJmYXhUDE21cDfoKCMTnJyP/2os9qv+ZTOtX7QADCr4CvjoA9gFgpDgEIflk+AL1y2jMJIifTMGkcAXkuQi8HS1ttlNecUrMSIdh/DYpmroBAwNilpSQKbhxg6eMCwBE9tV8A+FjikwvEDDht3ysJ/AvuvlQ2IAVqBuVdfcPJC1RPPqlq0D4WnwBrrEUwgrlSza6n6xoPZxeh/I66fm1bFIeIBXx8b5xlwzXUo5NwyGp0sfZQF2dFaNVEqjsZlLGbvg730uvluKe9mBT5MictBCQ4QW6ubvwNR4eQ0RI7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPFEF71E136E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 12:34:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 12:34:54 +0000
Message-ID: <d301379e-ccfb-4240-b131-e95f9fc99657@intel.com>
Date: Fri, 5 Sep 2025 14:34:51 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Small_impro?=
 =?UTF-8?Q?vements_around_VF_CCS?=
To: <intel-xe@lists.freedesktop.org>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
 <175707334761.307021.5869805195968242012@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175707334761.307021.5869805195968242012@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0086.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::39) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPFEF71E136E:EE_
X-MS-Office365-Filtering-Correlation-Id: aed71bbe-49b0-432f-edcf-08ddec789dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2lvZkxheFFJYllzdkxPZStzRVFLaDl0akJYK2o5VlRLalZYcVFhKzl1a0R3?=
 =?utf-8?B?K1Zaa0ZQZ01jRkJSSlVURlZ4NnVsWW13UExqcGYvaDNqOFZta0I4Z1R2Q0gy?=
 =?utf-8?B?TitQd3UxMHM2Ym01bFBuVUF4NjlPTzhQU2dwTVcxb0p0MGFLaDZBNi9GaW9H?=
 =?utf-8?B?UG1BaThObkpVQ0xlWlVyVUMvYmpKTUZTc2VBNFFCRDNuWTQxOU5VcG9tNmVM?=
 =?utf-8?B?RGxvWXNqMk9UOVZNTDRoM0pMOHdNc2VlL1Nlckt4WmkwUTNQdnRSR3FCTEZm?=
 =?utf-8?B?RzNodlovNVd6K1A2UWZ4cjM5N2xKcjRmU3pRUHlrZUx5ZGtxTEJ6dmgrcmdh?=
 =?utf-8?B?Qjlaa08yUEVzeDlEYm1hUkVoek1lNTVZMm1NREtxV0xFZm9YRUlVREhVeHJX?=
 =?utf-8?B?cjkwcnJZSTgza213ZjRCNllYY1N0dTlRM1VldEtsUFJtMnNIbjJlMVozRzd6?=
 =?utf-8?B?aGdIUC9wYlZoUjRVVytKUHNRbTB5TnppcDZSbDlZTlY4Y3YvOHo2eDdQNXZ2?=
 =?utf-8?B?c3Z5SzlhV3pWWDJtcm9aRDRsNVFZTTJuWXRwU09sK3VnaDd6TTk1OHhzOWRQ?=
 =?utf-8?B?Wko2eVB4ajA4emRJVGQwdDZRemtGQWZCcDdEVUE3blVkTkozelA1STJyckpn?=
 =?utf-8?B?WEdTeXhEcWZieTk0ZGVnN2R2MUN4R1pMR3NqSjVzVithYTdDSXVZYm9PNUNZ?=
 =?utf-8?B?RVU3YnYzbVJWckJPZmMrTEYvdWZRcWNFOVFoOXBkZmNnRXkzck45aGJ4Y2l0?=
 =?utf-8?B?MzFwQVVFNmlsVjduemZRQjhDMUxQcVIzMmlwN21tdlAzdWc0b3kraDlMN3JW?=
 =?utf-8?B?T2ZMc093bkNpSmh2eDRyaVE1TE12WUpuUncwd1NRVGtRV1owSTJGZEtnN3hy?=
 =?utf-8?B?K0hPTVB0dmVrbWp0VXRXaE41VEpFWEppTlM0dUVkUnRNeVlMaksvcDlRbDFu?=
 =?utf-8?B?eTlvcThJTHN2UEkvYVVMNXp5am9vdTRMQ3NlbmxSWlMzUGY2MmI0Tmx6Qk9D?=
 =?utf-8?B?Z1Q2QW04R0VQTEY0S3pzUkVOa3RqQU9POXAvTDFscUZnaHBRY21YWHFSNnRj?=
 =?utf-8?B?MlR3bUl4enB1M09RRE10cVhmTVhSelBMZm9QMGthQXNXR0pZMGFZWkxzYmVl?=
 =?utf-8?B?aThBWEdieEo4R1ZqdVBQNEFLaU02dEdDNWRQWUpodkZpNTRrVHkzS2tVY0lo?=
 =?utf-8?B?VWJwZDFiTzdSeDVRWk1LVGVXWDB1U1Y5dlNRZlZZek92N2VPeWJDcnQ2WTVm?=
 =?utf-8?B?TUVXc3RncGh3RDdyN1BYekFYZmlJZG1YL2RkbTVjb3lpNkd1MjJQNk5ZSFhs?=
 =?utf-8?B?KzBFaHVJejNNTGMxbEloTmdxNTBNbStmU2dUQVZYSk9ySmk4b0lzbTBDM3BH?=
 =?utf-8?B?bmY3R0hrWGdzZG05NFIwQ3FzS09kYWFhazZRMEU3MHY4Y3g4bXVJUi9SQ1Yy?=
 =?utf-8?B?UmZUUmo2UzRFQVh0VDdvQWx0aFRid2FDZ0Z0UUNGRWpKZHovK0x0RDgxOVo5?=
 =?utf-8?B?RzNnc201OVI3a2hXMTBpQWFFV1pJZFZOL00xd3FGTXloUTZXVEhYNVVvekxE?=
 =?utf-8?B?cFZyUFBueHVPNGEyOHBTYm5UZTJHL2Q2Y05MNTJVU0ZTVGF0ak5wS2Z0Z1Vv?=
 =?utf-8?B?anZzNGZscWwyOHdkZ1BJNHhFV1RSVEdEZVB3T3JLL25PNGlsMW8xeGMvbCtN?=
 =?utf-8?B?Uno1cENtV1dDSnRqT2RkN2M0UzhMWWtLM05JWTEya2ZQaUFoNkNZT2JNWk9v?=
 =?utf-8?B?cGJjMU9wQ0dwYkU1eTR0VEhsZy9yUmx0aEwrdE5TQkFwaXBIa1BPb3UyT1d4?=
 =?utf-8?Q?luaSHLVjpc6Ev2kw9ShLWYj1viMi3imu/2G5c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUlmNUJkZHBXRDRCMlBicFAvNC8yTzhXc2IwSlYvaVRhRjJ4d2VZN0N4VnFC?=
 =?utf-8?B?L0dDVGc5TmFvWG1rN3lGdStpbXV5LzdwaTdSeldvTTc4ZU16dnh5SW42cUpx?=
 =?utf-8?B?aGNEQ3IvbzEwY2lHNlhLTU9SMjdTOUFXclN0SXhiTXRVMERxZkdCV21TRVIv?=
 =?utf-8?B?Z1Q0TkdZSTFIRkJxMC9yV3Ztd3QrY0tuOUFBRm5CUjM3NzI3QjBqVHVWbU1t?=
 =?utf-8?B?dHNKVUhyMjF5YmZzWjdHaStSTjdTWWo4MU5xK3Z3UHRHU3VpSkdhYmthSDM1?=
 =?utf-8?B?Y2RxWEEzcFgzNUpiQkwrT3pHbCtaU0dJbEtVMG9WRjVWVm9KUzVBZ21XaTFM?=
 =?utf-8?B?bFhuWGRNZlM4Umd4cy9QdjRTNHRlNFlqRTFVTXNQeUh4STJVcVgwRU83OGd5?=
 =?utf-8?B?Zmp1dHFSVXA0Vjd1eVF4eW1YeHNUUUhuNHhRSkUrVnp1SzNOeU9LYmZ1ODI1?=
 =?utf-8?B?ZkVXMWtGZ3V3RUF0VGxPU3RkQ252ZmREWkt0aE5EUEZEendaOXJ0a3F2Y2VU?=
 =?utf-8?B?dG9RblluVDhIYnhWdzZsNGN4Q01jUzg4Q0tPek9MQTJ1eUpZaUFSamxrSUhM?=
 =?utf-8?B?YTZIKzBjNWNNbWhDalk1UVlHdW5CdUFWaStkMjl1K242b3hhOGxrZkF0YkNE?=
 =?utf-8?B?UDNMYmxpdDNmZTd1VWE1dk5HaG9Kd2htbTArQjZyZDBjdmJsaU1TU2MwdHpk?=
 =?utf-8?B?ZmdoVVdlcnpEZGdCU2xKOHc0enhhejBwZjh5S3FQUkpOakxEWDRuMkhFREtv?=
 =?utf-8?B?SURkV1dESkFaRDJxWTFNZ1FXaTNVNEZFWFFLNkkyVkJORDBhaTZzWXk5a1hs?=
 =?utf-8?B?enBiWTBmS1htb0JISGcrQkI1RW5WdktTY1JhVUU5dk1mdHJZcFo5VXFGOTYv?=
 =?utf-8?B?QnF0WEJtYXpNeXJQdE53MktQSk1WM01jcUg1TVdza1AyMk9ScmQ2Q2xMS2N1?=
 =?utf-8?B?NTAwUXlZcXdXdzNhOWlNYXg3Z04wTEVJZHBPa0V1a2lZOE9weDZtcXpFMUQ2?=
 =?utf-8?B?QjFoSHk1OHpCaWcvY2JkZjZkV0dZVDFHcE1wVkdqVzVOOFU0aEJ3ZzZDeVZH?=
 =?utf-8?B?eG12WEZHc2dQRDlJS2h2RnJQWUxxNXJZSkR6dlRreWVuVVROQVRFUHlkNzM3?=
 =?utf-8?B?NWs2S0RaTU5weWtxS1FmWWdRalUzTnQ4Sk4yb2dvSmIwMTJPZFpvcDM4cUdx?=
 =?utf-8?B?Z3loZ0hFKytseEtsVmppQXRnSU9HaE5LbkthVExrQVFxSU0xOG9UdjkxMUNP?=
 =?utf-8?B?eWdWbUI4T2ZvZEJxOEpxWmFWQVluSmowSU1rZnVuZ0tYVnRHUitaNEt1bmEv?=
 =?utf-8?B?YUtZUVFUVkVnN1lUNlB1L3dYY3I4aVRJcDRYMm8wNlVLYmROUEtVV2ZHODI0?=
 =?utf-8?B?N0JpLytWWXZ1M0FVU2lZMzdWajVsUWN2a3k2bkRkalZCV3hzVG4wTWhrNi9z?=
 =?utf-8?B?MmExMDBsV3AwSlJhTjkxNzVGa1lUL0VTNGFEMUkwTy9uZi9JSnhzOG83TDJZ?=
 =?utf-8?B?L3hKVzBsOWw1ZUVGTlBOZ0kvU05ETWxzK3VlK05FaVk1Wm13WVM2cERMTElR?=
 =?utf-8?B?MkdTemFrSlQ2WktSVit0YUhLbU5jMkxIRDk5bkpjaGFvbjRsWDQxVE8wemJU?=
 =?utf-8?B?eHpZUFdDVytRdmpjOCtuYmNxTFFweWdWa0lpSmhGUVBhek1VNXRIclIrdjg3?=
 =?utf-8?B?M1JwdWxFYnBOMS91YTkwVUVYaU56TlhMbUEwalBKcElTT2hIcm16d1BDQ1Na?=
 =?utf-8?B?RFJpK3cxa2tsQTJXaWtPbVhVQmtKZENTdmRXd013bHEzd2J2ZGg3MkNVaDJW?=
 =?utf-8?B?TGJzY2JUbmo5RFd6bW9jblJDSjhWZ01VSTJrZEJLM0Z0cDNhZmNyTEFxeWtu?=
 =?utf-8?B?WmR5ZkVQcVVTcFZJYmlrMFI1STNUKzdFUFZwYW56dkJzOER2ellpdWVCNzdZ?=
 =?utf-8?B?cEFNd013VU95cVQwbUpDQ3lNOE9MM0JzbUhsbVdHWnhBaDRmUlltVkVIQ0NY?=
 =?utf-8?B?UGt2dGFGckhrNFIyVVN6dDBNc3M2ZHJnS1lCZldUaGlia2x4UDE0bzhlelN2?=
 =?utf-8?B?Q2VYeUVuYkNqaW53K09wSThEWlNVS0hpL2Q0K2YxQ0R5OGNVV3dCUkxoZENS?=
 =?utf-8?B?TUxxSGozZi94UGd5a09iV2VjVlc3YUFaSGRTYk1maTFMeldYVnFQR04vb3Vo?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aed71bbe-49b0-432f-edcf-08ddec789dbb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 12:34:54.4465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N65cBDNEUe5Gw8OoI778zoHc7zVOuQcc82Af6GO7atXOdwfIdKpqET+B6W3VP7YFQ925ZvOHTwGAdeKnsm+PFrTE5dH86TKav7nFHjYVxY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEF71E136E
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



On 9/5/2025 1:55 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	Small improvements around VF CCS
> *URL:*	https://patchwork.freedesktop.org/series/154054/ <https://patchwork.freedesktop.org/series/154054/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154054v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154054v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3679-13f87d5402106b321a373222c64c5a56a05aa3b6_FULL -> xe-pw-154054v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-154054v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154054v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154054v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

unrelated

> 
>   * igt@xe_exec_threads@threads-cm-fd-rebind:
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3679-13f87d5402106b321a373222c64c5a56a05aa3b6/shard-adlp-9/igt@xe_exec_threads@threads-cm-fd-rebind.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154054v1/shard-adlp-1/igt@xe_exec_threads@threads-cm-fd-rebind.html> +1 other test fail

this was not a VF run

(xe_exec_threads:4450) [thread:4454] xe/xe_ioctl-CRITICAL: Failed assertion: __xe_wait_ufence(fd, addr, value, exec_queue, &timeout) == 0
(xe_exec_threads:4450) [thread:4454] xe/xe_ioctl-CRITICAL: Last errno: 62, Timer expired
(xe_exec_threads:4450) [thread:4454] xe/xe_ioctl-CRITICAL: error: -62 != 0
(xe_exec_threads:4450) igt_thread-CRITICAL: Failure in a thread!


