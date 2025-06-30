Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8236C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 16:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B74410E050;
	Mon, 30 Jun 2025 16:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IeUBtg1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE2810E050
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301184; x=1782837184;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IxXR1ujwpfm+j5TmPM5yD/CFZlyqzLeMMMaxKM4bXSo=;
 b=IeUBtg1U17I+V8ACLXM9E5SFQNnSqTamVRZPm6IQhUT46pJe3SiSEGyZ
 lmfR8pzdeB25B83j0jiUBMOQa3sObR3I9J+pvMqSy9X85i8tUfWJAzIyK
 uT/Tm+4FOJNeYRMNEVKrxDXNpmvpShAsj9N/EWWOC+LKcs96+kflO2bcT
 zC7+yNlgHdkDWkdr3FceIfEArpHGhLclWknQzScFxb5ciczEw5etIPEwP
 IMYm0+pEA/E5HElwEo+pTp7s+/Ei5ttvIXisl5iFg2vFTGDCX8dLdA/3Y
 J/w/KgxB+/zjbfEp0TZwUMj/XjRtlfVlj8T0w2A1NLvbGUSCUrMvFmHDo w==;
X-CSE-ConnectionGUID: 8DTgsZokR3i7MQe15WPzHQ==
X-CSE-MsgGUID: pTNYsr4TR2yAIBT9rZZXpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64135700"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="64135700"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:33:04 -0700
X-CSE-ConnectionGUID: 1IOSxn2XSu6UwfWW76u6hQ==
X-CSE-MsgGUID: y46RMppcRKeEe0WzyB6dbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="190672880"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:33:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 09:33:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 09:33:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 09:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/7b8ju+F/eKKMTBJo2DUioU+kmoSYzGXrJ2PmqlX5p5b1jkcXNxTgPrS707MxR/arBAFpE46SEsIjf3YiF0E2ENERC4PJhD4qF6sb5zPcmCWUSyXRm9DHo55pdu9cfcs29yu5YuFMAeP673F9BNo6Td3NkzYcXR4sTHg0Us3k9P/ykiuJ8FRZqK1poCrhS1IPhkwhe77ZBqwS3AkqcBLyYoK8tIRRkD0RxqKeEwWquoZeY+MaPqQinxiDJcfFdC9OANDwrtCMrF6e9LFZ7DRlisNXLNah895Nka1x3cdFrsoP67Pr/ZaPUe+sUIirjSqP9f/03o6XM88dlFfXYMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VCD1wvHENOKjAQ6XlYIp4jjFKrxSrYkMDD9qdXISIk=;
 b=H6yQ/apFAWNn0RUjU/j3Xn9qFs4lRb2vcfI2Ly6SKyJX4xfcuysJpSYUJ/GUYqXtZpHEubj3Jj88HC72zNoDXlN+q/ldRCAY5zt3yBUilhfH8V55di0QWkrrirlWAaNvWTSTQJdeUIOchpaeNdCyAhGCDE7KndsxSbjYpCmhXoEZ7M0jejPf0Y1QODAblBtCeRQlQRnGU4SjWxVL1PxyymRV2D+kBKFMAad7ih2pmla7rXkrtDLxVcwx8nYJ4tEH+s9hu7rSb3/w7Q7FhrgHnPp3Cx2/i+I6v5YJW6t55w2O+qfgDBLFmLGaNu2DvvcmKLyQTMP+1oBQP61YTC5CgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.29; Mon, 30 Jun 2025 16:32:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 16:32:30 +0000
Message-ID: <eefdb543-5eb4-4907-ac57-f668bb0df4d2@intel.com>
Date: Mon, 30 Jun 2025 22:02:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/xe_pmu: Validate gt in event supported
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
 <c895113f-d502-46f3-8be2-7e5edec731e1@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <c895113f-d502-46f3-8be2-7e5edec731e1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f34679-0f37-47b6-e47a-08ddb7f3b552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2RVSTNsTzV0L1IxNzBOL3NsbVRPTXBrRkRNOTFOQXg5YldQVmlPWWJlTWNO?=
 =?utf-8?B?WEx3K2ZwdjFuQjdZMWJkaS9mZGlWb0J4eDhhcEhTamovbmYwSzZKVFNSRE0z?=
 =?utf-8?B?OVhGNy9YYUMyZGhFL3hSSVl6ZTZBUjZTRjE5S1FFTFNINlpheXU4eXlVaGRL?=
 =?utf-8?B?VU82NHhyajhNaE9IVzYweFBhWWRVT3NBRXV1VG44eUZkc3ZieTNreVdYcXkv?=
 =?utf-8?B?Uk9WT1RUeS9XVkNpYzBMUFFUN0JLOC95bit6ckRvWkVpbkJrRUF4dWtUQzFH?=
 =?utf-8?B?azBSUVJDemRRZzJkM1N4S2o3alU2MFJpcVlldXlaNElBMFVCTTB5bE5UOVN3?=
 =?utf-8?B?K3d2bFlWUzAxK0p2aVgvT0lMeVgxL2x5TmRndEs4M056Wlc0L0JNUXdTQXRC?=
 =?utf-8?B?eTRZL0U0djFjdHQrZ2lPdXU2ZHNYZFNyeEZsS2lyZmdjaTZjWFlGVm82MTNl?=
 =?utf-8?B?N3dBbUZCd2VaS0h3OEZtRGV1S2JoaGwzUTR5RkxXbEFpNkxHcDRMc2pxQm9E?=
 =?utf-8?B?SzYvM2VvVHhpNU9Ed0xVL1ZtSjFpeFM2SHkvS3hHd3AyTzRrMXYzaE5UbWk1?=
 =?utf-8?B?S2pLcVRMc0ZlMXNKUHFxa0Voc0NvMmt5K294ais0blJFZmNXYVlyR0RHeHd1?=
 =?utf-8?B?K0l2Z20zYkdMdmVtdnBUN1pqZUZYdjFvSHN4Nk5XSkRMOFJNb3htRnBtRytS?=
 =?utf-8?B?MkFpcTVka1o3RmM2a0RqVllQQXgvcjBGK1c4aFJaUWtxdGpqMSsrei9TRnBq?=
 =?utf-8?B?ZXlWa05oL0pHRDd5QUdDUEt0c1VGckxMYjNpbzRQVlJiVi9xbDg0Wnl3dXpQ?=
 =?utf-8?B?c2NQMFRhNVNjelMyMGFaZzVQMjdsTFZkSFIvdXhmaFljZlViMDZKY1NpYlpo?=
 =?utf-8?B?U1ZnelNVMzZueVNCL0laVHBKOWNuZWl5RWVJb3ExQVBlY3FZaVdlcEJUSG9i?=
 =?utf-8?B?T0h5eW9EQUxXVFMrTE9wZVpNYWpQSkZxZTA5Z0NCNU5QMEJOSEh5VmU1cnQz?=
 =?utf-8?B?VkthMy9hY1ZLTHVCMll3UTg4c2l1RVIwY1ZHRHJsd280dWhZaGpBVkc5TnB3?=
 =?utf-8?B?VUFsRjNRblBSVEcxSGdJZzVWL1RkOHQvcnFBREs2TVdxMlBLR3ZJUS9mUWho?=
 =?utf-8?B?dWp4TnhnZXFBeG13YnFXTEpxK3JhcVROMnVBL1k5clY0KytrRFVka0h0NW1v?=
 =?utf-8?B?dG9zelA1MlRjdXh4ejV6THhFaDRmWVE0NVc1aTJlUW5US2xUcGdtK0JreWlP?=
 =?utf-8?B?dTA1a2d4alc4cUhXbmpVM1kxTXluUVZwcDJKZFlucEc3Z3dzTDdrdlMwbklh?=
 =?utf-8?B?bjd2VkhmaHZjNThMeVlHa1VtTHFOZ1hJb1BpTVFleUZBUUJiWmFGa2NMZlk0?=
 =?utf-8?B?cWxQUCt1QmZmZzhSLzNob1JGUHBPbUhUZUpWL2IwOU15K2hSaWI0b2xWbUFK?=
 =?utf-8?B?dk9tM0RSNGhFZlJIZ1dyMUt6cTNEdEh4SU5NaG1RRVVDN3NSSWV2WjByRURy?=
 =?utf-8?B?WU04NkJwaUFuRTlvZnhKVzM4YmhjMzg1NkhEKzZ1TTFWaVB3b3pHUlhIM2Qz?=
 =?utf-8?B?ZFl5cmlEcFB6NWY5NUJTUUVoRUJod1NyaDhveVhpb3NGcEZybXpLSkFVTFgy?=
 =?utf-8?B?WCszcFpkaXdUcllRZWg3OHM2Y1lUanE0ditnZGxnb0NDeWNuUEg1Rzk4cjZF?=
 =?utf-8?B?amdlcnVNams1bC9QNkQ1SWtYZCtFRzB4aW53L1ZjTjI1OEt6cE1kem9wbitO?=
 =?utf-8?B?dmNTTXVSR3BQUWZUa2pQS1ByWVFaV2t0czFqNXVsOGoveWtYVnhtYXdiSzNY?=
 =?utf-8?B?aWhiRFN2UWdZcVVWYW1pb2hMOFFXYzEwQS9pQXVtb2NPdGdMUnJnalVtM3U0?=
 =?utf-8?B?UTFwZEpNUUYvNWxKdm5YUXVEaEg4YnhBZ0xKOXV2SlBLMG9QMFpwUENmT2xF?=
 =?utf-8?Q?WlnyRiOJKIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHdQK0Y2ZlJnYmVqM2p4VWpIZkNWYlRUWFFDUk10dTJ6QU9YOG5sL0Z6ZnYx?=
 =?utf-8?B?Y2NhRGFLTzU3Nk9ONzNPTVJxU1hOSFczTTBkK2xxaWtBWmozS2pVTEVOU280?=
 =?utf-8?B?MGtZT0Q5bDRtNVlybmxTeWpSaEpUaG9saHRDcnRabG9JbHZyWkRRVWtOSStJ?=
 =?utf-8?B?MjJEdDJzUU0xR2tSLy9uSzFBUHM0Q05RM0lTYTFYV0tKMkJjNElDRXlNV3U5?=
 =?utf-8?B?TXcwNjFTOUlEUXp1aEpOS1lTOEtuWmxKYVRCa0RBaDNwMU5vejRBSzlQTkdp?=
 =?utf-8?B?U00yUVJaRzhoRjRsMkJSaEZ5UVcrTEs3K29IWjJvTUJ1Y2VmaGtvZUFpQUZK?=
 =?utf-8?B?eHRsQXVDOXZSWTZkMzVSalByNzc4OVhJSGsrZ3RldDRjMnp2ZVR2WVRBOVgz?=
 =?utf-8?B?VjNmaTEyRmVrR1o4cG5nZkFTbHc0azF0anZqb1E4TElEWWZ1cU1XMTdpejlU?=
 =?utf-8?B?c1BWVE44ZEUwcytHbWEwZ283OUlzR085VUFTd3lqdjBub1dwWGlCcDNKdTNN?=
 =?utf-8?B?YnZnWUR2STZmS2FrOUFZOUdtaXlFUGRWQm1CQ2JyNlpnYmtmbXJMTC9jR0V5?=
 =?utf-8?B?UEozMEJZUTI2TWZnMU40a3dSQUxkdFZucTRhYmJvVDEwcE9YYkhjUTMvOEdD?=
 =?utf-8?B?WHhBb2VTVkJiL09ZLy9Kd3JWZlN2aWVFdUVCOUZGSjU2MmJYSzdXZmNucmVj?=
 =?utf-8?B?TjBnc2RVUHlQRE05SEZRSWdOSStnaU8ycDdBVnp6UytqSVF2eTJUL3hrS2k5?=
 =?utf-8?B?ak14NkMyYU41cXJXMlBnc3A5clIyNzUxTHVUdmhJUlhjeWZTbVJSanNQRExQ?=
 =?utf-8?B?U2h4LzRGSk93bEkyYUZiR3NNaDNoODNzSkY2Sy9hVWo1ZUl3QlpXcUdSZlAz?=
 =?utf-8?B?VUp5SjNFWU5aTnJqb3VHQzlRM3p0eHYxY2JVNVZaYWdjYlpzdlN1T2JTY2hB?=
 =?utf-8?B?RnN6aTVoYWN5Y0t3QUY3eCtMU3RwQWJYZlA5d2dyT1FvaVk0c0RBUGxGcjR0?=
 =?utf-8?B?ZmNYQzlRbGx2a0FSRXFJdnZtaTJOZGE1QzdQdWM2YUVnekM1NXl5QjFQQ3ZU?=
 =?utf-8?B?cDAwdFhFRzFZaWRTY2o1VXkrQlNCU2ZoaHBsNEVVK1BiUGlEU2dZMmlVSTRC?=
 =?utf-8?B?Rk5YT2RIS3ZTb3dHVGZxQkZrRWtMa0JNWE14cm5UYk9pUHpOdUkyY1JSSHdI?=
 =?utf-8?B?RmZPZzlXd2EvMjRqdGd6Nmc1UEJaL1I2MEV0RnJldUpxMWJYZC9KYi9YSmdY?=
 =?utf-8?B?cjVjcGJVWk82U1NaMUh2Vjl0Q2pqNHBDQjBxSjZwcjFIYlN4ZXcxSlVMZU9J?=
 =?utf-8?B?NVZvNzZjdElpdlVkM3NEcG5uTTNiQ1VkQVNwVlNVMEJTZ3Zvb1AvTGQ2bUIy?=
 =?utf-8?B?MjZRVGVQeEJYU25XUTVKOStQc1l2OGJIVll3RktMc3BIblgwT3o3b0lrTEw5?=
 =?utf-8?B?eEhpZC9nd0lRb0xpVEtLVnptSHhKYk9TcWJRUzExVStaWW9lTGlCOVhOaWtP?=
 =?utf-8?B?NERJcHkwQThFNlhvSEp1ZEZRL3Bnd3JJajNWRHZweHpLc25LY0UvWC9oY2Vm?=
 =?utf-8?B?UGRwcThseUc4UnRBMnNyanRpRWNnQ3JZSndlRi9xNFprZjgxVERlQURnWjdn?=
 =?utf-8?B?T1Q2T3g0SUR3Z3ExRU0yT1ZGeHJXM3dDWkNYQnNGK3pjUFJ0YzB6QVg4Q3E3?=
 =?utf-8?B?eTBxZ3p0elFNNjhKdFpaU2pydXNzcHhNTjZBQjR1bWpRdVBXK3ZVZEc0cDRE?=
 =?utf-8?B?UHByb0l6OWNIcmM5REIvQXdwc2hYUjJQVHRhZmNkUVUzdVpzOEJFb253YVFK?=
 =?utf-8?B?ek5OWGJmMnQ2VW1ZVmFMSHJUUlk4YmhIaUkrZEZLc1pOWUFCMGo3VFF5eCtH?=
 =?utf-8?B?NkpRYVd0clRFNlVEcVdUdUZlNlYxR1hraHFscU1zbVFxa25NVjRsK2w1MnM0?=
 =?utf-8?B?blZYNFBMYVY0a0xtaG0ybjNIaXY3N2RFZGJ5bHRrajFnczhHaldkTXJGZ0dC?=
 =?utf-8?B?cXdkVUxzY3NMMndEZ2phT3hsQkR1QjV3Y0M5S3ZQckYxeHFRVGt2cEd2QkZO?=
 =?utf-8?B?OTlyU2R3ejYzREVackpvcmVDcnhsRmVnZXpTSWhvNXBBMFR4ODJjTGdzZURt?=
 =?utf-8?Q?OWeWr0quPuZ5rg8sSeeoUQPBm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f34679-0f37-47b6-e47a-08ddb7f3b552
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 16:32:30.5162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cW+dNRjYu/6oAGozEOi9JTPszcwJAh8727g4RJBPSnftOt9v2DIRubCQU/1HX/LFILsPhFX4Imy8AqMFNTClDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

Hi Karthik

On 6/30/2025 9:03 PM, Poosa, Karthik wrote:
> 
> On 30-06-2025 15:07, Riana Tauro wrote:
>> Validate gt instead of checking gt_id is lesser
>> than max gts per tile
>>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pmu.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 69df0e3520a5..cab51d826345 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -157,10 +157,13 @@ static bool event_gt_forcewake(struct perf_event 
>> *event)
>>       return true;
>>   }
>> -static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>> +static bool event_supported(struct xe_pmu *pmu, unsigned int gt_id,
>>                   unsigned int id)
>>   {
>> -    if (gt >= XE_MAX_GT_PER_TILE)
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> 
> Looks like xe_device_get_gt() would return primary_gt handle, instead of 
> NULL, if gt_id > XE_MAX_GT_PER_TILE. gt would be always valid then !

Yes it returns the gt struct for the id. If its NULL then the gt_id is 
invalid and event is not supported.

Thanks
Riana>
>> +
>> +    if (!gt)
>>           return false;
>>       return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&



