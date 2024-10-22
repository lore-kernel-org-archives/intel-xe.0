Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A95D1CDAB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 07:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D778010E5F2;
	Tue, 22 Oct 2024 07:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cit2ypH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB5110E5F2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729582559; x=1761118559;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=OtVZ4ypoJeHAG2exWaXKHlWGHjN2j+iDIPmxwbCFKTI=;
 b=cit2ypH4D95vj2RkoS+7zL2cvbah1IlGWKZutz8iRihz11xmo+ns8Qw5
 MTRMbYlGNDkR/kPYm8Nt2xp+GZHIV9+cWJP3Ot7gBguzDmUXqXi90jZhR
 byP0GtsVEqYmulF3opPyQxlT2saiqynfbqqCjY1vuU22e2UzxzTV5VF1/
 39XQcEwZFGYmux2rTzVMheLaWOYSjVAQcuL19Bwq4N9fBuFDFUIHCL+mU
 uIA1Yd+PjdYyNJy/3u1++OF9BJPP8GLJAMMeBiD46mPMSrGeuJyPpZVGR
 2qb1GrkGbwWEmgXj4TZoEOiWqp3PtYTUAaaMm7T37f+xHJ8xX9aTXET3d w==;
X-CSE-ConnectionGUID: g7nYiqXaTNSqovHoQQ/lXw==
X-CSE-MsgGUID: 9HV9/qEQR4e/TbkZc2fwwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39683155"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208,217";a="39683155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 00:35:58 -0700
X-CSE-ConnectionGUID: SlSObHqBSJWOWGbW+/k18Q==
X-CSE-MsgGUID: rO8MqY5ASG2G9d9aGofTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
 d="scan'208,217";a="117201945"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 00:35:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 00:35:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 00:35:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 00:35:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 00:35:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/Ut/5nPhXhW7V9EPiXWb3vPHWuYKMy1d0e62X9B6Tz6VzjfAev9VOTOGEzIJ6YECvJwB8voGQVosi74UAghEWsgbit4wKCV5ImxtybXLFvMSEtfsY+S8cIrOWtAFynKoQljDujINZ2/JdeKxlZ1zDpXdqeAnDNE/ty5/Xzct6vn89i+sLgyOx1Tn7c9hKFxLlPL3jqi9EMxi9OjaxDouM68G6LtJZSwj70mZTSmxpf3ILaXFovq0hXgpwqaDbR1K9rNIU2mOteFuwWJ+L69X7wfFCkOdSr1IYKgdkZ/tAKQNLzz4i4D9VpyuVTZJb6OB2+qpqRYmZIudcZ5wCZPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsbHKVdXWRtWwdCO8TlrbVAPyIP9GyLHrKSnTBZoqiM=;
 b=WciImjomB+Rwhf+O9hQGsijic95HYi+fV7Z+20skd5kBLe+1F7jZS1mC9j0h/svDRH37Oos3G5dawjcCamy9b7hdx9f3TimEp+mBA1yl2XTc9om5RODB+2Gky6RfHZOTNp8o+A5hZJHRfUdTA/Mgat7+F+3pQtWm7S+Km4Y2bikjaA3EtIV+m8MqrBrE0n+9HG7zo/dYAiM6zqA3Evw8DNscN5x4GcMzUTp8Qt4bdBvyE/UIswaa0c3Fal939ujMZiMZLjJipL2UM7VMTtnwdOB3LTyoWK6WJh7/1alhkDjKAThUEDNllsWQadHEF0lR6CGnYdcwGa61nW6eW28olw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.29; Tue, 22 Oct 2024 07:35:48 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 07:35:48 +0000
Content-Type: multipart/alternative;
 boundary="------------mtMgT3UgMEhJr9513jhCyt58"
Message-ID: <7e7e8ef8-98d5-4fe5-9469-ba3fe047d9d2@intel.com>
Date: Tue, 22 Oct 2024 09:35:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't restart parallel queues multiple times on
 GT reset
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20241021211146.3842483-1-nirmoy.das@intel.com>
 <Zxbdm8wpXQ8Iu477@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <Zxbdm8wpXQ8Iu477@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: TL0P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::12) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CO1PR11MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d0027c-1e08-4ef2-b337-08dcf26c255a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm1nQ1FhSmN5aDRkM3l2a3NGcHkxRGloK2VCTG91WkgxZ1UwU3BOUWhUM01m?=
 =?utf-8?B?b2xKa3pIc2NvNG5IUFpVcmNCV3l2RFdIUC9KR1MwYUFLSU1QU0pJeWsyTk95?=
 =?utf-8?B?OS9hYy9TYWppdWw2cWpsYzlLbDlUaU1IL2MyUS90ckRyTEowUHY3RFZFMzVP?=
 =?utf-8?B?M3V0WEUvOWJOaUlFV2Z3T2taWngvU1pBcGxQeCt1LzF0dW5PUXg4Z0ZqWXlk?=
 =?utf-8?B?RWRLODZaZUJmdm51cDJIaG9vYW9Rb2cyRXp5L1JmSVliV2NkeXFHTjU4VVNJ?=
 =?utf-8?B?UzJENzN3OFFTcGhZa0N6dTFuZEVvOUZVUWtFc1dIRGdIa1kxaWZTSkdkUTZ3?=
 =?utf-8?B?T0NrV3RwNUQ2ZC9QdG5scHpjY1hFQWUxcXRTbmpsVUxKRWFWMnVPaldZR2VT?=
 =?utf-8?B?QWxjRzMxeTRMZ2EyNUdYQi81RDUwT1hpVEs2cklPMFlRSUphdVZKUitIUnpB?=
 =?utf-8?B?TjVpc2cxWlUzNFRjdDVYeVJ4SC8wUWxHTW1VMno3bXBWQytWNVdxRnBrRG1m?=
 =?utf-8?B?RDhMa1ZINUtRaktBOW8reVhSNlFURjArVkJQN1IvSEJwMEQyempVNWdmOHFu?=
 =?utf-8?B?Vk5mSFVncEtHanU1alpXRGMxMkNvVjlINElXY2l6a2lEMkh4NnJYaDhERXox?=
 =?utf-8?B?VHg0MXZPcC83OWRPODJmSzN5S0t6NjltSlRHVThrZHNpNEhsZVZ3eUMvaGxo?=
 =?utf-8?B?WitSQnRtdEM2VDhhYjBQUGlSYi9JWDZtTnZINzdjVVlFalZQdTVCNkdIYkN5?=
 =?utf-8?B?RkNiUWxDblFYY0t4NkZhYjEyYnNLNW82bHdPL0VyWUFGaG5tZ0hrMS9aSXZ2?=
 =?utf-8?B?TnlJUURla3JGcmI5S2RnMzg4WXZxYytQcy9jSkd2NGs3dU5zcGhhZGhzTG9G?=
 =?utf-8?B?WlphZDJqdmllQTVuanczeVZDeUZpeXVLMzNid1JqbFkzMDhlVmlwZGVMY1Rt?=
 =?utf-8?B?QnRRV0IzaDk3c2JIbkxJZjN1b3RyM3Z6UmtPVjd5UjVuSGRDVyt1UWx2ZUl4?=
 =?utf-8?B?d0FYS2VCcjhLTEU4R2wxSFJOVkdVZ2Y5NmFENFRrUlhZYVZUVVMvMUk0VXF0?=
 =?utf-8?B?M3lUS2ttdDBybXcwRTlkdkVxUlpvVHRlSDNZbm15UzMwbXdDMWdsL1RMbTRa?=
 =?utf-8?B?eUlGUEVJQUQ3aDJUaWVvL0ZTT2NBZ0ZNZjRQWUdWUFB6VjR2UE4zaW1ET29H?=
 =?utf-8?B?WHI3dTRycjRicThMbENsU2pXVjkvZ1dhWWN1MDZxaWpySmtiK1pwd1BKb1ho?=
 =?utf-8?B?dERnTlJFUXQ0MEVVdll6cFhHTm90cEtxS3g3aGxuNTNCclJJejBQb2VpZ1R0?=
 =?utf-8?B?R3pGV1E4dTdzSXJpaHFJcEFKa2RxdkFZWmtFZkJCZllkcHE3T2hRTDNFd3Z6?=
 =?utf-8?B?aWZ1NzBHQ29KVTVMcEUvM05ISjU4YkRCWXVKcDhMZkV1UTZEVkN1amw5RmNL?=
 =?utf-8?B?Qm53ZlRnY2laQkgvUkRqd3BoVWRDM0pNdDdRZ09NaUdjanpoU2ZIMWdUNG01?=
 =?utf-8?B?UkxzSzBKbWgxS0J5eTNrZGJac0VaUC8rYjA2QkRpRCt6bkVYYzFNUTY1Y0s5?=
 =?utf-8?B?a2RSRnF6OHhDWDNzSkhoMlV6NzVxc2Iwb1E5S1crWTJ0S1NZWU5mYldtZ081?=
 =?utf-8?B?K3J4SzZML0FpVzFtTXNzSzVHbjhHSmJoN2pPSVMzeWFxQWw2d0JrQnovRFBk?=
 =?utf-8?Q?4/V+n6wt7ZV+Jfblq6TA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU9JSkJhN3hNdVcxdmcwc1FTNWplOUovNzNGZW1RdGc2Q0FEdnR0dFh1S3Jk?=
 =?utf-8?B?MUV1dU9vYXE1RUZUTUQ4RS9iVGp2V3lxMndudUpmZGJYa2xzTHE1SFVaOVBV?=
 =?utf-8?B?Zy9aQ2NPdzB4a2R5UC9iWXZLKzUwQ3ltakU1UVVtMzRIcVJ5Q2FMVkwyTnRm?=
 =?utf-8?B?TmtXWEViNytHY3R6d1hGZWJMNUZQeVh1VTlIeE9UK2o1andVdWFBd1RIMTFS?=
 =?utf-8?B?MXA2MFluOFhBZ05jY1Z1Q1E3ZlpOL3RVY20rVTVNUDJMQjJ4UGhLSlJsOStp?=
 =?utf-8?B?YWluUlFhT2Nxa0ROZXlJKzhXb1dRSjhXaGdnblY3dUluaFdIL1hFSmUrN3dZ?=
 =?utf-8?B?NklXV0EvZGdibmtqaTd4NlhCZ3c4VXJUck1SMFBNU2RJNG16VmJBbWhicWRz?=
 =?utf-8?B?L0djWnFMV2JiT1JJcUgxaHp3Vy8zMzhBMjJ0bDRKbTVpakI1S1ZlZWxvakJC?=
 =?utf-8?B?VFJmQ0ROTHAyN1ArRGR6dGtBOWY1Ukl1c0NVRVNDekRLVE9WV0J4MUkvUnhz?=
 =?utf-8?B?bGQ3NE4zYmpPcnJwVlRoUDZzS2tIb2JBOXdrVGlLRTV4MllqUVVLNmpOMzFv?=
 =?utf-8?B?d1ZoTmhjQm9tRHpSU29NdDd1UmFEZG1nVHNKU0M5WkxYWFJpYWx2RU9aU0NI?=
 =?utf-8?B?VVVNOVcwbWRVMUhCTGpDUko3ZG50RHFVOXI3V001WTkvUmpNdkg2UnJkcFJu?=
 =?utf-8?B?Q3Zqc2w3bzc2SXNERjFHcldKVUVoYzgzQVhlZDlIekRpUUhRbEs2VTZjeGUx?=
 =?utf-8?B?N21XSGJxSjZSdys2S3haZlRzRzZzbDBQbjJnTm5CSlM3RWE0Q3piZm1VTFIy?=
 =?utf-8?B?cHVPR2JNYWFOdVBWZk1DcXRQSi9VZ1IxRE5qNU9VY29LQWxweXl2Uk5JQ2py?=
 =?utf-8?B?cnU1RGh4ZmpTTThLWjNaUVlYQytubElNeGc2cE5oOU1VbXBZOFMrRHI1WjQ0?=
 =?utf-8?B?MXhIWHMzdFdvYlMvZ3VrbTI3YUduMkJWaEtHbkV1Z2JNZE1nMkYxSTZqeVd5?=
 =?utf-8?B?QklKVWZZMmR6TmFnNnM1bnFOa25KVWtzZHJ5cGRSeUpMdXlsY1JKY1JCNkFS?=
 =?utf-8?B?SFpQaTZzeDJyenRmdnBoSE04d3FQY0VMSndpR2hDVHN2Y244S1lXYWdsRjl1?=
 =?utf-8?B?dmh0QUlDR2FzU1oyWlJISDZpcWM4WVNQSUNUUUJrS3B3bDNnMGllbjJBTkdR?=
 =?utf-8?B?RHNiQ3hMazdranZLdzZ0dVpMazhlakV3WXdqU1J2NGZwK2ZjZEFQcTlIMWdw?=
 =?utf-8?B?SUVxTGpqckM0UzhKYWN6Sy9DSDU2TEhyTDltNnJpQ3FrazUvbHdyOVkzZm1v?=
 =?utf-8?B?dDlHdlhBQ3ZLbXZBaUNjUFNuNEhiK1lOSEZxQnJySmg5YlJDNmhwbG1DTHQr?=
 =?utf-8?B?V2RaWGNvVnZHZ21lek1wTCtJUWU4MXhGZTVwYzJZY0ZMNUN2VWgzN01JUlZ6?=
 =?utf-8?B?eGxlNnBibEN4SnpqTjBOclNpYjJEYXliSHh4NG1CNnFEbDZMUGhxakJLc0Rj?=
 =?utf-8?B?UTRZalEzWGQzais1MUprRkdEUUE0K2RZODdOOVRHZXc1eUxQYjZ1TkJVWDBX?=
 =?utf-8?B?SzNDcWhoNTk1L3pyMHBxY011VEpUL3JwRE5EclM2bXRSQ3M0SXp6UVBEOWxk?=
 =?utf-8?B?MkNQeklIK3ZRemtBT25jZEJPREVya3ppSnZZQVJBbVBZczFmemdKVnBsWDll?=
 =?utf-8?B?aWhGcmcyTDFwYlhxaGdvTFlkM0x6RXJCQUFEcUNRdEdyOE9mWnJzQnRsdmxq?=
 =?utf-8?B?RThoOU0zZWZkckNJZ2UvcThPRzJwcHdXekptR29xLzI5VmtLV2VxM0FHa3kv?=
 =?utf-8?B?YXh1MVJWVUpWUG5zenQzbjJ3YTYvTHlXRXRNVGNER09uQTViVlhoUkt5TUxS?=
 =?utf-8?B?TXI5S3FRaTBtakhQQmtDTTNxM2ZIdmhVSE5XQUVnWUxld0hpRGhJSENqMlpV?=
 =?utf-8?B?bHU3YStDNlhYdE9TVE5JK0U2K3lhM2RBaE52V0dTTUdydHUxck9JTzVaVGdY?=
 =?utf-8?B?eG5DQkk1dm1qb1ZhQkdZc1lmT3QrT0JiTkFiOFpBVHVSYkJyVXZOZXIyKy8v?=
 =?utf-8?B?V0cxbTNwMkRxY3Robm1CaFFpeDcrdFlBZUVvR2N3WFhpNnVkMlg5Y0JxbG5L?=
 =?utf-8?Q?egq7gcyzWRuiUbtHQ2IfKV1iK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d0027c-1e08-4ef2-b337-08dcf26c255a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 07:35:48.0298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtBiFEr0vIA6CuhBZ4Go12nu4E5Wl8jZVHY8uGU/5uWUOur8OA1C0jdB/Bhlaqs1G7Tkcb85d+SpHRcUCdHkWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
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

--------------mtMgT3UgMEhJr9513jhCyt58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


On 10/22/2024 1:02 AM, Matthew Brost wrote:
> On Mon, Oct 21, 2024 at 11:11:46PM +0200, Nirmoy Das wrote:
>> In case of parallel submissions multiple GuC id will point to the
>> same exec queue and on GT reset such exec queues will get restarted
>> multiple times which is not desirable.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 0b81972ff651..6aeb007eaf06 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1784,8 +1784,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
>>  
>>  	mutex_lock(&guc->submission_state.lock);
>>  	atomic_dec(&guc->submission_state.stopped);
>> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>> +		/* Skip restarting parallel queues */
>> +		if (exec_queue_enabled(q) && xe_exec_queue_is_parallel(q))
>> +			continue;
> This doesn't look right as exec_queue_enabled can race here...

Ah right, just realized this happens async with the run_job


>
> I think this should be...
>
> if (q->guc->id != index)
> 	continue;


This looks much better. I will try it out and resend.


>
> This way we only call guc_exec_queue_start once per queue parallel exec
> queue. Also I think we need to add the same check to xe_guc_submit_stop.


I will resend with updated xe_guc_submit_stop()

thanks,

Nirmoy

> Matt
>
>> +
>>  		guc_exec_queue_start(q);
>> +	}
>>  	mutex_unlock(&guc->submission_state.lock);
>>  
>>  	wake_up_all(&guc->ct.wq);
>> -- 
>> 2.46.0
>>
--------------mtMgT3UgMEhJr9513jhCyt58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/22/2024 1:02 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Zxbdm8wpXQ8Iu477@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, Oct 21, 2024 at 11:11:46PM +0200, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In case of parallel submissions multiple GuC id will point to the
same exec queue and on GT reset such exec queues will get restarted
multiple times which is not desirable.

Link: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0b81972ff651..6aeb007eaf06 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1784,8 +1784,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
 
 	mutex_lock(&amp;guc-&gt;submission_state.lock);
 	atomic_dec(&amp;guc-&gt;submission_state.stopped);
-	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
+	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q) {
+		/* Skip restarting parallel queues */
+		if (exec_queue_enabled(q) &amp;&amp; xe_exec_queue_is_parallel(q))
+			continue;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This doesn't look right as exec_queue_enabled can race here...</pre>
    </blockquote>
    <p>Ah right, just realized this happens async with the run_job</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:Zxbdm8wpXQ8Iu477@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">

I think this should be...

if (q-&gt;guc-&gt;id != index)
	continue;</pre>
    </blockquote>
    <p><br>
    </p>
    <p>This looks much better. I will try it out and resend.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:Zxbdm8wpXQ8Iu477@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">

This way we only call guc_exec_queue_start once per queue parallel exec
queue. Also I think we need to add the same check to xe_guc_submit_stop.
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I will resend with updated <span style="white-space: pre-wrap">xe_guc_submit_stop()</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">thanks,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <blockquote type="cite" cite="mid:Zxbdm8wpXQ8Iu477@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">
Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 		guc_exec_queue_start(q);
+	}
 	mutex_unlock(&amp;guc-&gt;submission_state.lock);
 
 	wake_up_all(&amp;guc-&gt;ct.wq);
-- 
2.46.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------mtMgT3UgMEhJr9513jhCyt58--
