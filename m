Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276F8C5DF87
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA3E10F1D2;
	Thu, 20 Aug 2026 22:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixZ2Nsl7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712CF10F1C4
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 22:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787265016; x=1818801016;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PnfahMPn+fEVB2aeoT8g/v3GoIUWHbAIskbGlaJXyR8=;
 b=ixZ2Nsl7KWaWxTLmqSFkd1J7zrRaOr8M0K75v2L5LfdT2GkB/m0KP20b
 q4WkF0HzexFsQbwHpGINcwLpXpCoa69wyDzEx2Npd/HbB4uwu7dC1XoRI
 cKka9OwKB5WYZscgb9KOX2GHdZ0rM/YCROELLFxr1v0xBJdYmlYCAe/gp
 m0LcMJVtPDVMHQi8IM+1T9ef2Cn/a1uTd6rF9zc+IVngXUSgBih9tuOKw
 0cskNXBewO4OQgi5IlFU/UZNMjT2H4tQT/+ZBW9VEppvEUEzSlU9n0IE3
 2AdGdELiEog5S9ahuzJTSP1h1LPd1KVyJHg+VzcKjhtwIts6JTpG7G6Zz w==;
X-CSE-ConnectionGUID: 5OSyL80vQ+ChFRI5tlOu5g==
X-CSE-MsgGUID: MZuxM6gGTjG+es4go8qj6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="88016761"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="88016761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:30:16 -0700
X-CSE-ConnectionGUID: sKT5jroEQFezXNEl3oBWIQ==
X-CSE-MsgGUID: 3ATUrJ5mQr2+n0xYI8zzNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="270397563"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:30:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:30:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 15:30:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:30:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9C848MA3hzi8JWHeRbbmjCTkz8SedmfJZMAmkc+6FV9CDWYXwSSrKIzVznkfEI9M+L6sGkNnWJfxywAULtIEGb2XGonGJrvvtiHpekS+4CYy38vP1DJ+rBGBFy3+WRVFjCOJi76ALypnnEM1O0v3kkRhYwH3iTzWyFQ6HfPjNIsC13Z8Dj9O/kMVck73aAr7+o4twUik5nd7m0PusW6Qj1+LbrXMTewIjkM/K/p5EKsNVOrDFxWNGlzj83cPu7o+OcAfqAjNHiqRnWrhUm5oAly8MEpBVXTSPeGXj0vYKhPMkxiVXRga/q7sUQ4KuFrXBKDqqbiLXVeOpL3qLKbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qD4hiv7OqxOBl7ybxwP8t9AlShyAkxpyrkzjLke5tEw=;
 b=uy/eeMuuymr8risqoViIrgcJ7etO9xCGoNf1VgIRmBygs7nynKAqgXQUfnce2f3f7NULmrHyfEEKGmO3D9SQqezx2mGBbjrSld6llfaKS5Whva/muNe+8vUD7F+UJOkst2YsuJEbDuxNoP0A2G4X+vuGzyIULiocDRK7IBcYz6PqCSN79v6M2x70jRc3MzTGojf/zCrUgs4VKV86hp44l9eYozmCnX4FuOtTUdmuftZLWoLYaaieM7KRpa7lAd3Qz3eTq/oK6YuAyCoB//BfryKaCQLuRugJgxr+46uaI3NhfmjTHEhPB9Lud50HOdXXZuMLB4Jbhv7MCc3ZLqiOFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 20 Aug
 2026 22:30:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 22:30:11 +0000
Message-ID: <98cf3341-f6f6-4330-b76d-b52218e4656b@intel.com>
Date: Fri, 21 Aug 2026 00:30:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/xe/sysctrl: Use xe_assert() for payload size
 validation
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-13-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260820101632.527214-13-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0299.eurprd07.prod.outlook.com
 (2603:10a6:800:130::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba8dcbe-019e-4da3-e7f8-08deff0a98aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: FjCEqG6Knsm3tPc/P0if8HQtfVHEzzbB4iDIFDQjBoOohVEhQE2sjZTTS46ApE4WvHMYg6fjUfbogjkmYvGDY37O64HkOjHDvna6Pb5zC0Vm7+cdmN+LZdA9vl5HXzKQExiK3zo8tQA2AGue8C1RuHz9/i4M26r4lA4LTukRqOMjqLtPZ3a1av35OKMRAfYcU9K0WA+p4PaReGDhUxU8hKC4XXfqMxf1ijdHmrRgCkpRvjXEX+cygcIBTewoD9SmYEmDFbiB5KRcLYmoj8R0T4L2BgoV/PerOa4IWYupG4hpHHW3b0B9jsp4L/S7YDPtmLBt5ULl1URirNuu4SHRSpXnxXQFRYGU54UVst/pmF7IBlDts+dp8pJSS44xQ3kHvvYmmFMSPKWxL854MlJPfpI5GfoCludOPbPHFpbSO2qDE8R8VSd4tSpeRMptNh3U7tVanuNs8GfUUX1HwH2F+ugbIiPh/NTR0AJ+Ay6+YzCt11jWDHmxTgM7lfTlawabZ9guL4RwpGHYiv2zjU0qUGR6/nqcapXuNpoNMcXtRpK48cCldj1aUyKYXJVJFPKEWxCDpGD0FtxxmBeT5WJL6hA7VNEIUK/jtBi5AIu9G17XClAxldl+U5UHRczAkthuAF5uLSiyySm4QNRaQry+luxCiBX8PhRFdBOtcLXfCcA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1JyZnZBWTlodDNDcG10V2Y2MkZ0U3gzaFN6VGU0Z0R4ZkVvMUpFYURENytk?=
 =?utf-8?B?UWQwTW9WTkEwK0hLeWtsZXFIL3pRQUIyMWRjWDJqQmYrVlJWbzNPYzRXNmt0?=
 =?utf-8?B?VlRtVXB3MVc5UVQrTk1VMFkxV2lhT1orSmlPNld2dk1HSUpud3k1RzBqT016?=
 =?utf-8?B?cGp4UW51VGJodkd2dXNTcmFoUGhMQU83Y3dmVC9PMjNYdzRnbjJlQWRqZEtH?=
 =?utf-8?B?cGU2S0VJRTdjRERPMjZHUGVRamdlU3hPc0FPQjBEeWJqSXB4YWZidVkxLzF3?=
 =?utf-8?B?Z2ZyNWxiaDBWOUViS1puU050NWlTb29DVmxiYnZSektXY0FEU1kxNmNSdFg1?=
 =?utf-8?B?ZW5udFBNdUlxWTcyM1VaMHB6dWZDc1pWM3FuUUltRmROWDJ3MFBFMkJOWC9R?=
 =?utf-8?B?YzA3Wk11YVAzejl0YjJVeU44ditKamdUaG00Q1VVUGEvUFZBYWEyRDZOMWRr?=
 =?utf-8?B?ckJGYThTTjFkSnZIbitocS9iNGJVbGxuZEFoUUl0eHNBUkZmUGVlUzN2MEs1?=
 =?utf-8?B?Z2xhU3MwVjREZUkyMFlCdGhCMnl3dllNcnZvbHFjUzk2ZVVEU1lvVFQ1SHFo?=
 =?utf-8?B?L21pbndlNDgvZWlOOUpwZWROSDhkWHdOQktQZ0svRkpFbWhVenh2Z3lDV21F?=
 =?utf-8?B?RFU5TkVIeVdzbzBHTG0rUUdNMU1VWjBIQUVNejA2YWREYUFGOEZIeE54NFBY?=
 =?utf-8?B?cjRIdDk5WGM4eldBeklvMEdFVnprVDZIN1ZlNVh3WXpoSVVydEdTeEgzbHFX?=
 =?utf-8?B?dnJWeEcxU0xkVWdPYlhiOUQxVmhTV2NLd1BYeHZreHlGVyttSFJYMlFpaFdz?=
 =?utf-8?B?ZkxKUXFTeEx5bEY4L3dwbXNQZnpsb2krV1FjaGRBSWJHMEpLazhxc1ZBbUxy?=
 =?utf-8?B?b2ZGdVBVbzQ4VU1TTkNXZ2ZMT2xMeGRDdlZsdGJsTHBuSmYwV2Y0cGFoVDlV?=
 =?utf-8?B?VFlNdG1tRHNvYllvNzBRblhzREdNZFZIcmhTRW5HOERucmZQRVNXVCs4Z3c2?=
 =?utf-8?B?WVNBeEVVRHp4VjRaZVhIbkllMG9yQVBjeG5ham9URitMT3g0cURXV2M4QU5B?=
 =?utf-8?B?bDcrQ2dCSFYxMFoxNEQ1VmV6L2ZReTZsdW5QRU9pUTUxWFEwL25FVmhoVSt3?=
 =?utf-8?B?Ulg1OHd3TDhGa3dOUEgrVU1RbU1oalE0OHBSaUZoTEU4cGFBN0VuWHJ6R2dV?=
 =?utf-8?B?MENnUk1PZ2pDUFN5dWRFdTNhUTlkYXcya2QrK2M0ZHEyYk4zemdmbEh3b044?=
 =?utf-8?B?aUI1Uk13YTVmdEJPQkh4MW9XbGp2VVBJK3RpUytSbUhqU2NoMnVuSGhwcURR?=
 =?utf-8?B?enFycDRpM3RTaHJ1dDBTMGprblkwVDExM3NqSGlDQU9LK3pKa3daSnpESEVa?=
 =?utf-8?B?VWM5Tm1GTEZ5U2VNRDlHZHoyM2FJek50eHZBMlRWejNVZUlUbDNFYm5IVXo2?=
 =?utf-8?B?UUVNTFdoR0dqZmlWYllMVzJuTllUTi9XNVUvWXlPWjBjZzB2TUNGWUN5L3BS?=
 =?utf-8?B?SkJvaC9FOUxsejRvVnhCaDAzREFKTmVNUUtObWdBTHRScmI4SG5DWGdTTzhE?=
 =?utf-8?B?T1l1N0Vic0JmYW1XeFJNTUswcmhER2pnOHQvWThUdXNhc2xOU3h0aS94eHNv?=
 =?utf-8?B?d3NEcFlBdmpUUWJOdUFmNVg5S0Y4NVd5ZFI4Q2Y5RjF1VW04dHhWL0xFb1R1?=
 =?utf-8?B?VDd4M1Z4dEN0S01Wb1pnSmNaQUZPU3Z5ZEt4c0hpa0U3b0QvNUtDWklya21K?=
 =?utf-8?B?aWpMVFBOM1c2OXYxVU9HTFREd2FSWDRPdnoyZWpxcXhINDJ5RXdaL0g0MTFF?=
 =?utf-8?B?aWtTY2tTOEl6eENWRlNGeWZwWDVvdldHRy9nV0tjbXJpaTQ3M0hVMDcyUUky?=
 =?utf-8?B?b0tEOGEzQldBcmRhdWxjbFpwZmUzUGJPcllDWlhna00rUHZGN1ZwZ09PcXkz?=
 =?utf-8?B?OEkvNEhDYjZiZGdlZnI2bkc1b3FpV1VRZmt0L2hLMzgyMVVrSXF3Q0lOUEFD?=
 =?utf-8?B?OHlqdVBObGF1cDVRYVA0QWd6TUVpMnBWbWszRnpoSXBMNUJSeGpDNXhXUEpz?=
 =?utf-8?B?Z2JjcEVRaGt3UXBHVFYveVRPakhSSG9lZ0l6VnFwbHhlUXBSdnZDdHBxeXhO?=
 =?utf-8?B?ejVWbnY1MFNuQXFpWHpKRmkvS0ozSlRuVEh2UFhrYStZMmZHakhqSEFJeWUx?=
 =?utf-8?B?WEF6UXUyZm00cnpLU1EvYTVqcERoR0JINWR2akQ4M0ZXMWZjOVpRK0FoSG5K?=
 =?utf-8?B?cTIvUFFVOTE0dTBVaEV2RjR1SzdyaWNuKzNLOWVydzlWdEJLSkZOWVJvY2pN?=
 =?utf-8?B?NHl0amZjU2NoRkJHK1JBS2pxNkFFK1hPRW9QN0VKL0lkME1LMmcxWHFwWGl6?=
 =?utf-8?Q?8SY0ceXyxv3y0zVM=3D?=
X-Exchange-RoutingPolicyChecked: Y5ZZC5dE3nFKF7yLycbnr7F+5rZKtiy/Wav+RX3CR5jaqxQBEBp/YMM/2GrzqDlEjWwcV5knTrwARsAd4ZCG+vTBF2AJ1MgrEnuHI/lQnrVYPltFDmIdIaNMYBGOI4qK1RgX78HjUDf8HUnDgQpglTJhyp/jkf1mqGBxEiNXhn9HnZ32f/f3rHZ1ND6gAprtlaDeOAZaxNQ7M7UF2rd5ykZMmgesNLqEdDR8GrGm0g+dNfvNLcaofNRixMZHRf+0UlN9IZfoHWU9677MSfzckIKBmPuj0pCVoFJHxqAp2xwdq0OunCEGtmZTXsLXhmXHEur3imkSdN1pRzI8GuKe3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba8dcbe-019e-4da3-e7f8-08deff0a98aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:30:11.2157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/ZzByLb5a7uy2qt6uhfhxcIoXaiVSRLdoWkVfuugiNkiHGgseioimvB22hjiG2MlYdgoUDx1k0/LhHkxL6ufK9VaROz8YdN+bwfELpcuI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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



On 8/20/2026 12:16 PM, Mallesh Koujalagi wrote:
> Replace the runtime payload length check with xe_assert(),
> as oversized messages should never reach code path.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index ac58571f2a43..c043b51cacc8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -105,10 +105,7 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>  
>  	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>  
> -	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
> -		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
> -		return -EINVAL;
> -	}
> +	xe_assert(xe, data_in_len <= XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr));
>  
>  	size = sizeof(*hdr) + data_in_len;
>  

