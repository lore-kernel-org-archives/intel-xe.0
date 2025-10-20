Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6AACCD19F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 22:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2250110E536;
	Mon, 20 Oct 2025 22:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRnfD/An";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6CD10E16D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761000530; x=1792536530;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RD0W4t84rrMLDT6io/uYQGUQyhUddXLwAkWVo7Xppks=;
 b=FRnfD/An1LhxIAGpXew1eH2ln+TlSZz20/KJjMKu4bm31oRyRcWNOBSy
 jg5IP0jxQ+tiRV66ohm8qw6VzAGd08Ncjjkp6RIfsCA07Yi2xgdgCLHf5
 PZ6GcbI+8ck/E9zKqCgVCrTYtaWgg0HiTqLBGRp2rtzCHAEO/McxmNUHK
 uw64HskkeVi/tCNbglpa8wLSNZGOmnLrVvpJKp6VS1dBjqfNvn4J2pKCk
 9PZ5HL2X3dX1EEfJWES1NQvEf0jQRxajqjZtRQO4K98reAMIMJ435pS5j
 so5qaz03U6Cv/e55+xEWBq/njcyN3ajnMgKYsWcjq/sjIS/hrOzZi1K35 w==;
X-CSE-ConnectionGUID: qNB/oml2Tf2OdeAIzzsPBw==
X-CSE-MsgGUID: b46B2Hw+Sb+UH8icYHRuZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63273104"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63273104"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:48:49 -0700
X-CSE-ConnectionGUID: 2CvK2Dd6S+a9AfAJF8ewVQ==
X-CSE-MsgGUID: j7K5/R9sQ3SIyZWm1b7K0g==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:48:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:48:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 15:48:48 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:48:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sw5tOO319NXOzjeH/sBFJUlwYnYyVzTVKENW7LlhYt60w5HwukcbCf0/R82xe+kC7VPmsg/G2DJZhJBn2eN1dReKkyLYBAF8lJBftwGi9McF6aLFgIPOm9FjYNQwC1eDVYLtl9U4bDCk2CD8m5VrRjvDVyxw3YZi2GSV3tb4Gmcg8Dx4bia59KNPjsXZa3c2QOnwBS1joTalWNDqRRmE/73yFqFuhnkoMSdtH62LLTN7CUsKH+jgmP7G6WlbGNXnFluxRrUy6xtPJiSLmJZvn2LfG3dLV+rtmNjKe6rQv5NR/xORs2yXc5Lf8kvWdLy18WG0fsHxbJNrWJNKVXIIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvv6RGe6PCLsdbaeKGbNbdrKGXC0nmXlw7p0h1Kv/0s=;
 b=JdWPDmoQCnQEytj0mrLZk2h3UgGOC68edw+w1YkSmdk6nd+JwUc/j7l0yHwy2yKDNvGeFiTHFTuKJrCfew+r/LsRY5R0s9ew9XPWSP2Od1bPk99nebE2x2EubiIrjCf5CLU0779uYxykRufRd6YUOeNa2FOD1Kd6qqFmBDjjpelSuv7JfOXlFXsE1Jz3rDjegOEYMMLKp/uolIG0YQT5UaHmVXr61lJhuzEUVkSix1XG9tDyVW8NtzAVN/as2nY+FiHJPESYL8KPi6FRhgbJsIkZELotc3VXxIdyo/XQJO6IVg0hniwYXQt6UUHEl/HrWvDmUTP3c131vqvgynqrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 22:48:40 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 22:48:40 +0000
Message-ID: <f4e2aaf2-a4e5-497a-8b35-7044b29dc48a@intel.com>
Date: Tue, 21 Oct 2025 00:48:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/xe: Assert that VF will never use fixed
 placement of BOs
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Piorkowski, Piotr"
 <Piotr.Piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "K
 V P, Satyanarayana" <Satyanarayana.K.V.P@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
 <20251020205808.1187308-4-tomasz.lis@intel.com>
 <8c9bf95c-e650-4035-a5a4-3c6b1d353851@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <8c9bf95c-e650-4035-a5a4-3c6b1d353851@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BEXP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::15)
 To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: ec63953d-ba78-4d10-569d-08de102ad02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXVWUEM3ZzBEdGlLSHJ3b1Q5N05yYithb0tzYlVaVytZTSs0Mlh0eDJCZ2M3?=
 =?utf-8?B?OVNDUVlHUVEvdmFyNktoZC9UUlYwQnlBNW90RUFjUU13cGprRDdrTStQUUdK?=
 =?utf-8?B?YzJDR0VOZXhNckgrT2I5T1BOY3ZScjJHMVNKRERmT0tuRW90MnJERWl5dUhN?=
 =?utf-8?B?bkVNeEJsR0RDWGRieTJNVHhpVThmWCtGb0t1dXVCSG12Vm54WS9MTUdkV3Ay?=
 =?utf-8?B?QVNGeEdwbzV3eS9HSGdxU1JMSzY2VDFPTW01QkRUbVcxS3dkMnpFYys5WUZx?=
 =?utf-8?B?TTRidERsVGpUN09mUVlpOFVtckpQdXVZYlpFTnBTYUlaZVEwRGFYR0FRRzNr?=
 =?utf-8?B?RzNDSlNVV3dsTWtPZS9HVlFjUjc0eU9SQVJTeGo5cWpVb216bTE1LzM4Z1NS?=
 =?utf-8?B?RERXY2dPdmpvYm9jS0dMOWFmYm5pbks0RG9YQmlGNFFNbHZjZSt0eUlTMHZO?=
 =?utf-8?B?RnAwTy9FQzBBUEZmOVMvQ0VSU1VBbHpPOTFHVkhyUWorLzVRTHlpTjJjRHcy?=
 =?utf-8?B?VUtldGlBbWprMkZiUE00a2hCZ1pJOUQrcDVmSy82N29sM2tmUWFKalFyb2Ft?=
 =?utf-8?B?ZzZhVHR4WnV2VFd5dExNZWxqaHRraVk3TUhFQU5ESHV3SFFDbHk1dHlZOGh5?=
 =?utf-8?B?QkZUZUw2Z0RjSTVQdVNTdlRCMjlTdFpxQ0FqMkc1YVdTelptNThXdU53dDFj?=
 =?utf-8?B?bW1hZ3F1OHlNUnhJMTJhaG4zenlQVFE3UTZySDNtU2F1dzlnTTFJeU5XL2JU?=
 =?utf-8?B?MzNBeGttcW9WazBraDNHOFFNM1RzZW4yTU1sZk81RC96c0Z4czlhbVNoWnd0?=
 =?utf-8?B?bVFiZE1yOGJKSVNIWDVPeVNDc2doRDVvWjVvbFRsbEU1Ujc3Mi9Ud2lPSzg3?=
 =?utf-8?B?QUxONU1sUHJqSngzUytqaVdxekpmQmJEQTFTQ2ExeTVqbWhuRXdwUVIyUmZS?=
 =?utf-8?B?UWh5TmREVHlLNkhQYXRTOFl2bnlJSDNHRkNKaUUrdWFKSytBc1IxeHRZSCt3?=
 =?utf-8?B?MnpIQmpVUUQ2Y1RuVVp6eGhOdXUrV2xTbnk2eE1LNGwzRzhqOXFZbzlCcW13?=
 =?utf-8?B?RkdPc0wweTh0S0dOR2Y1clJIclRVaFlsUFRrT0ozSGIzcUFCRlBQZTNRekhl?=
 =?utf-8?B?aHRmakdsR0xIUEVUNkY5Rm9XSkdJbnZBSzBTT0J5Qm1VYUE3a2huQ2ZEblVJ?=
 =?utf-8?B?S0kvWm85NjJYc2ZwYXZ6RDJPdFZWV01mMzdmS1BRT3pjVGF4WDBhTXAvd25O?=
 =?utf-8?B?UmtyT0VaUnRLTW80ZjlLanFycS9rUzN2bzhaczV3WTNFOUFwTlVNaW5EenN6?=
 =?utf-8?B?NjVFWm9RMlZqZmVFQ3YrcXIwS1RWU1hsT2F6cFI4LzlUa2hsZ1M2VXNibis0?=
 =?utf-8?B?ZmorRE8zYmVnN2RxTC9lY01OeFYrLzJQb2FibTg2Tzh4TTRUVFlIbjhHM0pv?=
 =?utf-8?B?UFhhUzlac1daVmdYU3poME93bElRYVlYUGZqdW5SMzlrN0t3ZzdyVGt3UzB0?=
 =?utf-8?B?V2xkc3gzNEtEMWZVM3l3OXhqMFJ1VTQwK0RVODdqenVSbUo5b2tzSlBkNDNN?=
 =?utf-8?B?ZW9nTzdGRnJ6Y3B5ZUF1OGZvbmdVZ3NaYXZqa01senM4QnJ5Tm1GVUVoWndS?=
 =?utf-8?B?Z1JhRTZvMlNjR3grQ0MvaFZlMUIxaTliZlRjN2JzYUpGL3loVHRQVWF5Wk8v?=
 =?utf-8?B?NDV2S1BCaHpQRHJRODJwbXYzNFdOOVIzSWhnVVowemlUMmd3a0w0ejMyK3dm?=
 =?utf-8?B?eml6bkJEcVZ0R2IxYXM2QmRVbG1CZGp5cDRUaWVkQjNFZ0dKaUFhNmYwdks4?=
 =?utf-8?B?K080YUFkclNjZHJBWEw4MzE3SnUyYnQ2MnRkUGduQ2lCUCtnYTI2ZDk2NEtK?=
 =?utf-8?B?bW1DQjBMN3JFT3NPbVZ0VThGT1Z0MW5GTkRYTnJVQzg5VHozUWxoaU9hdGl1?=
 =?utf-8?Q?O4dNPXRjlnaYLCRGHm+nEeqju0kcSQjw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2orNlJGZVo5eFpkeERDVG8vT2ErYUZoWDdKOGhEWFoyWlVaaEJyWTlhYlFG?=
 =?utf-8?B?U0N5T2V3ZVRDc3VDWkUydnNFSmRnTVVVOFBCN2Z2VkFhMHFMTHc1alROcDVB?=
 =?utf-8?B?VXkxZmZEM2NGcjFaL0YvM1M2VXNRdlhPbmlyWW5oUU1YT2NXeVh1RVlWWWI3?=
 =?utf-8?B?aTJteW5QV3A4UVhudENYeHNuNXdDL3pya1VqRWJXeDkvWEVTV0dtRU9Ldzh4?=
 =?utf-8?B?SWNTN1MzRlM0OW1JdHFMWGtsMXE3b2MyWEFWZTFxWUduZkZsTU1SSWV6ejJC?=
 =?utf-8?B?c3AwRm5oTnZCLzJIZ0dpS3BvT1dKVmFpeDFYN2ZzRTJYK1RoeW9sY3BxbHJS?=
 =?utf-8?B?RUhUZ3ROeTR5VTd3Y2tranRQNVJ2QkZ4NmF4VGd3SVNoNEc5UlFGZDg2MXQ0?=
 =?utf-8?B?RDI1VmRIbDN2a283MkNBdFpWZ0NGZ25qcTFuR3c2anh1T25WNEZ2dXRhMDV2?=
 =?utf-8?B?K0pkckttTG0wdGJoNUNkK3pobWE0OFRmT3lNemRxd3Bucm5RYWI0NTZiSHRR?=
 =?utf-8?B?aXh1bXFwZTF6V1VoZ1kwbUhQTGkrQlFNaE5oc2pEdjVmckVrWW9DWjVnSjlo?=
 =?utf-8?B?RzNWZTJTUEtheFhoZHBnYkRXM25NVk03QVFHU3NaYXBaL3d2QUwzcDkvUHV2?=
 =?utf-8?B?bzk4ZEdXOUZTSXJBNUZNUU5OckErZ29GazgrYjA0N0dJOFhCeVY1c2N3U016?=
 =?utf-8?B?QXV1T0JqaElXVlVCc2J0M0VzRCt1WXJnRFFpZXpvSTVUUFV1UUdneUZuUEIz?=
 =?utf-8?B?SzVrcG9UbEJjRWU3V21nV2c1ZktwdFVpYlB2ZnFwSDJFRlc5WkhqTkZDWVJ4?=
 =?utf-8?B?Z2tMWlo2a3g2dUhGYThMUHJpSXZPQzBtUlJ3OElOT05kc3RjM05jN2lYNUNB?=
 =?utf-8?B?UktPcGRYejEyQjFCK3I4WjdveXFNdlNCd0lVa2Z0MXkxZUVyQ2lvTitpNDdL?=
 =?utf-8?B?TjFrM3MyRFRVOVJiNUtvUkx2UFZuNm5qVFk0UW1udU1uWW9JRk5pL1hPclN1?=
 =?utf-8?B?MU03M211TjZ4UklSWlY3bFBGVGMyKzlSWDJxeXQvMVpPMTlHMnNlRitTSHcr?=
 =?utf-8?B?SStWbVBIK2hIdmgvVENqdW11N2tsN3Fic0FaU1pBdEZZdlQ3V0RMbm5wZEhn?=
 =?utf-8?B?Q3l0bWt0ZEVValZtS2gzOWkyZThlenZ1aWJhdFdFdU1oOHE0Z1pHckNJVzY1?=
 =?utf-8?B?cENtK1pLaGI0VmJib3ZIbDhVcjRTZkhodnVENlFYV3JFMHdEN3VtUmxSK2dQ?=
 =?utf-8?B?VVE3cmVpM3BxYUdibExFYUt1UXdFQ1VyZXpTSk5HVGs4bkRzWStuQWNLNVMx?=
 =?utf-8?B?MGN4K3dEK3lTeWJOUDdtMk1pNzZKemJ5Z2hVNWtLd1BTQVExamtFdkV2YkI0?=
 =?utf-8?B?RXlCMEpFaUlyb1pWdCtoc0JGYkk0YUlzVmsxWFFLVlQzZ1Z5RDBPd3NPREdj?=
 =?utf-8?B?MDVod2szOGhlWDhsU1RiMVpNZlN5SlBwYWlKVXJRcW1jOWZaSlZVZlFoaEMz?=
 =?utf-8?B?ZUlBTzRtbmF1dlNkc3ZmeVVjMTl4NFR0NmZSVHIwaEJIMCtBQnd6SUR4OURZ?=
 =?utf-8?B?NW9PVTUrL2FvbkJaa2ZnVGJWak8ycWpoWDRuTDVLa2FpVDF5MnZyaTNvVUhT?=
 =?utf-8?B?cHVqcHYwSms5RGE0SWNpRk9PV1p0NUd1YzdMb2NDMzI0SkUvbGxaSWVnTVRH?=
 =?utf-8?B?d0NQU2xpODVROVJaR1pyZmFMd2owbkR5bDRIbTJTbWllaVNrMm1MMWVWSlJK?=
 =?utf-8?B?UElLcnN5NzdXUGVabzZCQkNUWFI4RWZvS05nZndIT2YydFVHOHV2cVpEbGEx?=
 =?utf-8?B?eWcrOU1WZU9PeUQ5R3hySWRxS3F5VWcySUUrQjA0eGJKT1cxcWx2M0RCMnNq?=
 =?utf-8?B?ZlJCeWM3V1AyNEo3TVlBY3c1RFFLQWtNY0hDcnBFK2pnem9vZTFVRmJLV1hP?=
 =?utf-8?B?UDJ1Sm1BTWpYL1daaVVoQXFxQ3RWeUtCL2NPKzBJRitKWHZMSk5HT2UrdGpY?=
 =?utf-8?B?azhNTmNTc213L2wyR1RRTzV2S2pyRWdqVHd3eTVFOXNBNHJCWTJhWUU1cFpH?=
 =?utf-8?B?OEVmT1B0d2ZxSE1oUGUxUEMxVUFDR3JsL0hzc0hpQ1FiY09YY0lscEJFdi9y?=
 =?utf-8?Q?SsuNqVif7+6fltR+1cG1PEDI+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec63953d-ba78-4d10-569d-08de102ad02f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 22:48:40.2957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXcMdtA/SN9fRusg5BPsnX7QtcitRgNT7W1xASg5SUI83MbM2k+Anl/0MTv+RP9ujIk1760hadfuSRsWOtpACQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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


On 10/20/2025 11:59 PM, Wajdeczko, Michal wrote:
>
> On 10/20/2025 10:58 PM, Tomasz Lis wrote:
>> Most BOs do not care at which offset they will be accessed within
>> GGTT or PPGTT. The few which do care, should be only created
>> on PF, and mapped within GGTT. On VFs, mapping at fixed offset
>> would be problematic, as each VF is granted access to a range of
>> GGTT address space.
> it's not a matter of being "problematic" but this is just prohibited
> as there is no assumption which GGTT range will be assigned to the VF
will update to "prohibited". though that's a simplification. Fixed is 
not the same as constant.
>> So, since fixed addresses of GGTT mapping can only be used on PF,
>> we can add an assert which makes sure no attempt of fixed placement
>> will happen for a driver probed on a VF.
>>
>> The assert will also ensure that VF migration can be properly
>> performed without a need for special handling of the fixed placement
>> addresses.
> this last sentence can be dropped
will drop, though I can't say I agree.
>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 7b6502081873..8e826a4aa574 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2259,6 +2259,12 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>>   	struct ttm_place *place = bo->placements;
>>   	u32 vram_flag, vram_stolen_flags;
>>   
>> +	/*
>> +	 * to allow fixed placement in GGTT of a VF, post-migration fixups
>> +	 * would have to include shifting the page ranges
> it's not about implementation of fixups, this is just not allowed

"not allowed" is not an explanation. That is clear from the assert 
itself. The comment is here to tell why.

Having only a range of addresses is not enough of an explanation, as 
then we could still have fixed offset which was computed so that it 
conforms to the range limits. Fixed does not mean hard-coded. For such 
computed fixed offsets, the explanation in comment is correct.

-Tomasz

>
>> +	 */
>> +	xe_assert(xe, !IS_SRIOV_VF(xe) || !(bo->flags & XE_BO_FLAG_GGTT));
> but the assert is fine, so with commit/comment updated,
>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
>> +
>>   	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
>>   		return -EINVAL;
>>   
