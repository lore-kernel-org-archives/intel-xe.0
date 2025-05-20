Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0480C54E90
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 22:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD0810E0C3;
	Tue, 20 May 2025 22:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SX7mk9B2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC47810E0C3
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 22:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747780750; x=1779316750;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PaUTEoy5DWtW32lrvGjJF5w9ZwM5oAIh/Vtk9jd+6mU=;
 b=SX7mk9B2ZnwKJTATuPDD+KsDuhxS4rNNpPmvOTzAfcdLqkvumYb3yq8U
 e52HBTh1CnESrK8vrXVroPAfGpU1SfFLpNJE/7zp8HJnJyv3JfEAUl71N
 JG7mMF6qR/3Qt7nztsgfymnk02+pxJzFgOQz2EXJSTiXKKJb4NaXe3Pxl
 RcO6CJG6ZKEHOWCvPD8e7oQFS71O6UY4w7CSAQj4Q0+J1qViMf7zzgzBq
 9JY8ZSoIk24GuOBsmEqPZvdRfvWw6t3WsZVqTN2mLQBhMB9CnP1+3lglp
 yiOHBiuVK6iVL2ldzwbF+3VmttOsNvLKIejlR7Zkv3vd+GTkv7PooAxZk w==;
X-CSE-ConnectionGUID: R6T76z4iSsS9MOP/nALqIQ==
X-CSE-MsgGUID: xwYsa2ciRUq7m2vf4Ujy0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="72255933"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="72255933"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 15:39:08 -0700
X-CSE-ConnectionGUID: 8irBN7rRROKfyZmdwJ60zg==
X-CSE-MsgGUID: yY8AUr+xQheEoRvumvkNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140243492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 15:39:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 15:39:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 15:39:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 15:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKAd5blwlSbLAs4Pf8LEyb00Gd6Qrw7jMU/hz+IBBpFvYv8DNfMeh48LIXEt3rWcjeeoIUO9chDS9YKPQrAAAgHBpkkZWEAn+j/Q7HsNf0noKUPVAvcG0rGOynuJicBm/Ng9VnpVBkrlAqvY59JfOVvFPaLFDzIe0rFPMIeplBNGSq3sqursp/f8qIsepP62HrOo+KvkVQmCIqgmBWwNmziQvXqguyLIjSdGf99Mtk41aniIOvREuV8s9SiLZtF+SkQxC6Sw7Rw8hF+M2dAOdTy2S934w+p0WZW+RKDw4iMedecV/DvKr3OzfUYvFb+u6SXs942PP8WoRHppexhK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF8Fd84gDBdnEnCTJaOw5T2Q1hWFM22nfySD74cvakk=;
 b=ERkwNRaM79kjHWfmcC0YCd4MbteQknjMg5L8HHAib1ywXhjY7a8E8tfO8yim+mLtoMrY4pUEO1G0Cm+Ge3xzyaCtPtxc4VEu+OVcN3rVlNsrByfbp13Vob9gPXpgcJBmZV99KC35CZ1/vcNJD77/s/u30gnV1pbrgE9fYCdvSUpxeISt4Xhj5X4ncsA9yOIqE1HskpORaouSWLRrWXzDfpOqFTxmDXC6cBi/EAFnmO8VL6vZNNfuTMHqlHxugaqYzyRop8roEh9AErsrb1+inXhjvWQ0kkYvbhMkNhq5yBUMknQ9dktYCHUqA2/KHS8iQ2CfqE6CokrX73fbKQODlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH3PPF801A91A7D.namprd11.prod.outlook.com (2603:10b6:518:1::d34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 22:39:05 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8746.029; Tue, 20 May 2025
 22:39:05 +0000
Message-ID: <4f4457de-c05d-417a-a306-30160aad850f@intel.com>
Date: Tue, 20 May 2025 15:39:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/vf: Store the GuC FW info in guc->fw
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
 <20250408213146.793855-3-daniele.ceraolospurio@intel.com>
 <47ffb406-8d68-4ae9-a59d-78bebdaedfdd@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <47ffb406-8d68-4ae9-a59d-78bebdaedfdd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:40::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH3PPF801A91A7D:EE_
X-MS-Office365-Filtering-Correlation-Id: cc56a6c8-9407-48ab-3622-08dd97ef2034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHdkVmZhN0x0K0MraGZBc3dsTTRRZjQ2endSSEtLbENXZDA4T1pTNHRsNVJ1?=
 =?utf-8?B?clJZcEtWR3pmN282QkJmNitlbWlseUxXV2pCdGsrZWcwcFhlVmpIbm1ld25x?=
 =?utf-8?B?ZG5HeFJHYjhDM25CUi94Q1pkZmJaSHB4ZlRwVS9aR0VYQUZCU1k4cFNtUTBH?=
 =?utf-8?B?R3BnYlZUclRHODhjSGpLK1pLMHNWZmxjUGlVamJaSzljVExleEs2a1RNV0No?=
 =?utf-8?B?dk1leU5XblIvWjBhUkVLR2FKRm9xVWZHdjhldGNkSzFyQ0x2bHhxUnBkS3Fa?=
 =?utf-8?B?aFFycmtrQUtoQ3MxTUdrc29KdmNuK0VOZ0NSazRsT3UvNm5rUGdnY0Y0bC8y?=
 =?utf-8?B?d05EVng1Sk4vbTVScUs4VGswaXZabHdNZ3FCUnFpYnNjQkw3S2pvbSt4aTNN?=
 =?utf-8?B?SC9SUzBUeXp3cVdVMzYrcFdYNEhxSm5MNmpCTnJ1RWthN3ZzTFZreGhZUVZa?=
 =?utf-8?B?OVIzbWo0cXJLQVpsaDBDajIzQll0ZktsZHVhaVlOV2pLR2FYdXRUMnV4UnVo?=
 =?utf-8?B?QkRuRWMrOWN5MEdBKzhiQVhOdC9HeVhOVjVpenBsSXZvVkxFZFYrb1FvUU1u?=
 =?utf-8?B?VTVSdnJkaWhMZEo0TThNQXpuN1EyMzZYT0pmckxwTDZQbk41YTdnRytrT21v?=
 =?utf-8?B?QitmK2lnTXFuQjkwRFBJNTV1RGRjVjRRL2ZWcTBjVUpZUlduK3hsTktub0ZF?=
 =?utf-8?B?TXJlZDBXMmlJUUVieFozb3RuVjhNMmpxamJBd1NhaGtsM3NONzk3RlpKa2tC?=
 =?utf-8?B?a080M09oY3FSdDVJV1Y5TDd5cTc4d2hFcnFHdWpFWDVWaGxVU2pqNkwwTldP?=
 =?utf-8?B?L2lKaGdIanlxQm10V3A4U1Q4aGtOQUptUWpxR1pDMHpDRW1EQThoMDFhVHh4?=
 =?utf-8?B?S2I3MllXdjNFRFlIcGpIM0lXdEVIUHY4R0wyRC9XbEdEV0pLbXNTUnBJT00x?=
 =?utf-8?B?WmxxSUNHbjQ0aHRTZVYzanRjWnFFelF3QkVEZWQyMDFkTFJUZGtnUzlVdi9S?=
 =?utf-8?B?SWlHWVo2alVURVI2THU5bUZ4bFVHWEN0QUtMck5SQSt2dFFQZXE4RWtrajVF?=
 =?utf-8?B?QjU4UU5sOHVNOWxiM05KUU1VWVBIcFNhWUxFbzR0U3Q5Nkc5dTcxeTdXQXc2?=
 =?utf-8?B?WXJtOW1ZaWtUMVBRSHhINExVSEN3RkdvcXBLbk9qQWQ2eVZpdzl5bWo1aEZK?=
 =?utf-8?B?cWxuTXFKR1lkR2ZYeEtybTIzM3RYQnI2RUpUQStRV0dITXZRb29PSksxbUpT?=
 =?utf-8?B?T0pUU21rYUdrdTgxRGw4T2ZibEJWQXhPaEtUTHdjSEl0S1AzZ1ZJQThTb1hQ?=
 =?utf-8?B?UTk5dGlaNVUzcXIzbXFnZnUydVZLM1J5YUtrWUhDRkRSVVhwZ25lSFpxR2RP?=
 =?utf-8?B?aFVxTTVrUDdNRTBiWkNReHMyMVlWNGFUbVJoSTgzQ3kvK2hicmpuamtxSHl4?=
 =?utf-8?B?UnRBV2szOFVsbzF6YnZDTlAvcW0wT1NucVcxcURjRVlPTFAwSy9BS2hTQkdE?=
 =?utf-8?B?WWZxZTNxMGxxeXg2dlAwcEs5OExwc3h6L3ptYjhLR29NblYyaG1YdGoyWXRL?=
 =?utf-8?B?OENubzZxR3VPTW0zK1RaUTVkT3lGNmlNOG1IMGZmbjQ4MlQwd3lqWVo2NENK?=
 =?utf-8?B?blR2MzNaMm5xTUJBSHloOENoa055d25tUUt2c2E3SzBPT3RVR1R0RnBDcmxF?=
 =?utf-8?B?YWE0bldsTTU1cmRwSDVMS0tWcEp0VFpZc0gyVzRtaWY3WThpeGdibzZlL1Nj?=
 =?utf-8?B?c2lEMlI2c21mTkVpMWFzUXp6TWtCMUJoRG96ZDlnWHFJazdFdUpaam5QU3VG?=
 =?utf-8?B?ZE1VUkFLdDVodEFEWUJFcjI0OU9URWdlc0lXMGpYdGxXOGtBSElkaDhSdDZY?=
 =?utf-8?B?OXo4V2lmTm9VaUxEQVdCUEZ5L09sWDJkWkdPNHY0SzJxbzFVNTBTalJEYkwr?=
 =?utf-8?Q?tsdVdDx1fJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU9LZzhmNVJpM0lJTFNzUkJRTnpZMmh1ZmY1K1VWejFEZEhnbytsdXpKcXkx?=
 =?utf-8?B?Z0NRT2QrS1FGTml3bGo1TFdiM1NiSjNFdlpqOTFNdjFaRGJrN0FjUjltWnRC?=
 =?utf-8?B?OUpLOFd6bVZrWTNDSXk3aUJ2ZGdMYmVWSFNVYXNzUGJoaEVXTFhJRmdHc1Vk?=
 =?utf-8?B?QVYrVlFyZDhEU0RaaHpNSUEwbXh5a0F1ajBudDFtaE9FcFVwLzZtTmJxc3d3?=
 =?utf-8?B?RWpWeGpNenplUlAyTU9HS245SG1PUmNYWVdOaGw2VGtVNmVMbEUzQlIxbWdB?=
 =?utf-8?B?SGEyWWlUTnhJUTJUWkxXT2o4Zm9qRCtzeUlqOTJmcEJQdm5pSWY1Y0g3OEdr?=
 =?utf-8?B?emI4T2FGTHk3L1d3amhBZ3cwWEllM1BoMjJCcjhGbG52c3djNlk2ZXIwOWE2?=
 =?utf-8?B?QkdEOURhTEpBVmNiL3BTdm9mR24raUVUd2Z0alNpdW5UdjVXUDRLallrOU5w?=
 =?utf-8?B?VS9nWDVsRC9nWkNHcEp3VUNXTEdGSHhkRnBYZ25tREtPUlNzc1RUeVJNQkxY?=
 =?utf-8?B?WlAxQmpobVRoNjcybldPNFBRdGdNODIza0ttTFVnZ2dKQi9PT3c3amtXV2Ft?=
 =?utf-8?B?UmdGOXIyamZvYm5YaU1VVlhBSjhTMk1BcXVHbFNlMm5pRWlNZG1seTY1VUhr?=
 =?utf-8?B?QmFXL1RVYk0zM2VhUlJOdWtsVnFGajkwQ1hhWUdZVGdHS2V5UHV2VzgvWWhs?=
 =?utf-8?B?M1NDZS85M05EQWNycFZNNzdockhyemJoS3dRcE5EQldOZnRERk5ycVFpT2VP?=
 =?utf-8?B?Vmx0azhHWVBYSEJSQi9nWW44TDhhcFExUGczWU5sTTE2eFlOQkM0ZTl0a1BW?=
 =?utf-8?B?UFQ2Rkp0UHJibUNIdEZXRTMxbWFrbm45OEhkZkcvNGt5VStFY1BzSHhvYVRo?=
 =?utf-8?B?dkdNVlVtc3hEQnFyampHU0JkdU1mcXRhb0Z1NkdCYXJ2YXB4YW1OdUJsSnN5?=
 =?utf-8?B?ZUJvSjlhZEtnUFJGeHlaYk5sK2dKbHBLSTRNeG9ldmRlNGJta2pVQ1BJU0tE?=
 =?utf-8?B?UnNBMEVZUUxPbE9tTlNzb05WTEwvU2hHZTVTMmc2VUJWT3BpajlmZ1duL1Ny?=
 =?utf-8?B?aGgwYWxJWnNHYVBjcjB4VUw0dDVtSVdtSVZxL1hhOFRCVDdiL09zRDBqNGwy?=
 =?utf-8?B?V1V1WjJBSFA2emxPeWxzYWhBQXhvUHI3T1AyMndTdXVjeGIzZGc2bmsxQS8z?=
 =?utf-8?B?REIzYXYvNnpPQWQ2TWFUVVdFcVR2VlFDWTZVMmZvS1kxdXB2WHdQSHJ3K24v?=
 =?utf-8?B?allEaWdiYTVJd2twTEMvbHdOS0MrMDBYeGpPODAwSW5lMVN6cm1zUFN3OWk3?=
 =?utf-8?B?ZjZOV2VvNnZmT3RDaFcrVEF5Unh1dXJQVnNUNGJBbkpLZVBJVDVnenZaSWto?=
 =?utf-8?B?VmUrVFNEbmRnM3c4cmtOSC8xbDNQclpMUHVRSkkzK0tHMGpzUVlSazVXWVhJ?=
 =?utf-8?B?L0ozWmUwVXA1cld2VmNLSmRXU3FwT2J1Sm80T3M4RTlyZ2dRKzFqcVlwRWFV?=
 =?utf-8?B?WHd1eTZCeWVGWFYrMk9xNHdUb0t3MWtZbTkwSWp6Nnl4UnFJYUJlU3E2cEY1?=
 =?utf-8?B?S3pHUWZsT01sRjRMZmRuTWNDQ00ybDBjMHRtaGQzZjJnZ2krWjdyNUszajlM?=
 =?utf-8?B?Vk9qaTlnMnBDUExkVjdFODc4bVByZjJQL205RVlYUHBDdDRlZWpnY3ZnbXpM?=
 =?utf-8?B?eG5XL3hhVmV3MS8zZk16Zm9KaXNIdGR1UVhEWURrL2NleC9XSDdOdmxDOG9U?=
 =?utf-8?B?LzlNSnljdlhZays3SGRaL2d6bVJyVkdjZm0zNHB5UXR1cWRDSEZEUFM2dkl3?=
 =?utf-8?B?YWFOS1JHYUZnWk56aSs0cXQ4TktVemRzZlgyeEFFd3BNOFl1QlZtUlk5bEd0?=
 =?utf-8?B?TVZQUHBKbS9UZStZdXpXNGtkc0dHM3NSSVI4clNrWGhRQTBMajJQSFdwcHFE?=
 =?utf-8?B?R25MOFVmY050dUVjRjR2WnpqUkRCdUE5MGxjRWY2R1p5cUx6U1FSQW9wOStx?=
 =?utf-8?B?Y1ZsMUY1VG5lM3dvTGs0QmR4K1c3aGhmY1V4QVB5dCsxSXRRZ3ZJaWZWZTZG?=
 =?utf-8?B?akt4a1g0eFFLc3lWdW9QNmxIUkxxWnBGUUZnZUV6bTIvblRPeWpxb2dOZWVK?=
 =?utf-8?B?RFZFVXg5ckc0RFcxUExIOWI2aXRXaEtKT294MHpBNk8vTXVLc09wYnRlcG4w?=
 =?utf-8?Q?XPyjKyu26QQEQXpK3R0FZVw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc56a6c8-9407-48ab-3622-08dd97ef2034
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 22:39:05.1308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iU4DTHSXs41aWAHCsrMNkuDGWCxtB8SYWEO0u57FW1vT8SI2BFglA4m65tKXGGLqGWFkAaZidXiQPMptw0OVy1NiLubOwsA0r3YCrxu56nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF801A91A7D
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

Sorry for the late reply, I thought I had already sent this but instead 
I had it still in draft :/

On 5/8/2025 2:26 PM, Michal Wajdeczko wrote:
> Hi Daniele,
>
> On 08.04.2025 23:31, Daniele Ceraolo Spurio wrote:
>> The GuC compatibility version that we read from the CSS header in
>> native/PF and the GuC VF version that we get when a VF handshakes with
>> the GuC are the same version number, so we should store it into the same
>> structure. This makes all the checks based on the compatibility version
>> automatically work for VFs without having to copy the value over.
>>
>> For completion, also copy the wanted version and set the path to a known
>> string to indicate that the FW is PF-loaded. This way all the info will
>> be coherent when dumped from debugfs.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 42 ++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  4 ++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_uc_fw.c             | 46 +++++++++++++++++------
>>   4 files changed, 81 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 68714e607b10..a1c025d7e6a9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -173,6 +173,9 @@ static int vf_handshake_with_guc(struct xe_gt *gt)
>>   	} else {
>>   		vf_wanted_guc_version(gt, &wanted);
>>   		xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
>> +
>> +		/* First time we handshake, so record the minimum wanted */
>> +		gt->sriov.vf.wanted_guc_version = wanted;
>>   	}
>>   
>>   	err = guc_action_match_version(guc, &wanted, guc_version);
>> @@ -558,6 +561,40 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>   	return gt->sriov.vf.self_config.num_ctxs;
>>   }
>>   
> it looks that below function is put between
>
> 	xe_gt_sriov_vf_guc_ids
> 	xe_gt_sriov_vf_lmem
>
> which serve different purposes are both are related
>
> a place just after xe_gt_sriov_vf_bootstrap() seems better

Sure, will move

>
>> +/**
>> + * xe_gt_sriov_vf_guc_versions - Minimum required and found GuC ABI versions
>> + * @gt: the &xe_gt
>> + * @min: pointer to the xe_uc_fw_version to be filled with the min version
>> + * @guc_version: pointer to the xe_uc_fw_version to be filled with the found version
> as the "min version" is just "min"
> then "found version" can be
>
> s/guc_version/found
>
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: 0 if the versions are available, an errno value if the bootstrap
>> + * failed
>> + */
>> +int xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>> +				struct xe_uc_fw_version *min,
>> +				struct xe_uc_fw_version *guc_version)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> asserts should be after local vars list

D'oh!

>> +	int err;
>> +
>> +	if (!gt->sriov.vf.guc_version.major) {
>> +		xe_guc_comm_init_early(&gt->uc.guc);
>> +		err = xe_gt_sriov_vf_bootstrap(gt);
> hmm, this looks like we are trying to hide that we somehow missed to do
> proper init/bootstrap before calling this function
>
> so maybe call ordering is just wrong ?
>
> then either we can assert that at this point we should know the outcome
> of the handshake or return an error due to failed previous handshake

The issue here is that for the primary_gt we do the bootstrap first 
(from xe_device_probe) and then we select the firmware, while for the 
media_gt we do the opposite and only bootstrap when we go and load the 
guc (from vf_guc_min_load_for_hwconfig); there is also a call to the 
bootstrap for the primary_gt from read_gmdid(), but not sure if that 
counts since it is before the GTs are initialized. I didn't want to 
change any of that so I just added an extra bootstrap point here, but I 
could change it so that we bootstrap all GTs in xe_device_probe() if you 
think that's cleaner.

>
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	if (min)
>> +		*min =  gt->sriov.vf.wanted_guc_version;
>> +
>> +	if (guc_version)
>> +		*guc_version = gt->sriov.vf.guc_version;
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_lmem - VF LMEM configuration.
>>    * @gt: the &xe_gt
>> @@ -1095,6 +1132,7 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
>>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
>> +	struct xe_uc_fw_version *wanted = &gt->sriov.vf.wanted_guc_version;
>>   	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
>>   	struct xe_uc_fw_version ver;
>>   
>> @@ -1105,8 +1143,8 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>>   	vf_minimum_guc_version(gt, &ver);
>>   	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
>>   
>> -	vf_wanted_guc_version(gt, &ver);
>> -	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
>> +	drm_printf(p, "\twanted:\t%u.%u.%u.*\n",
>> +		   wanted->branch, wanted->major, wanted->minor);
>>   
>>   	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
>>   		   guc_version->branch, guc_version->major,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index ba6c5d74e326..32ac8fa0d5fb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -11,6 +11,7 @@
>>   struct drm_printer;
>>   struct xe_gt;
>>   struct xe_reg;
>> +struct xe_uc_fw_version;
>>   
>>   int xe_gt_sriov_vf_reset(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>> @@ -23,6 +24,9 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>> +				struct xe_uc_fw_version *min,
>> +				struct xe_uc_fw_version *actual);
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>   u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index f1b5e523ddf0..da97e3351a13 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -58,6 +58,8 @@ struct xe_gt_sriov_vf_runtime {
>>    * struct xe_gt_sriov_vf - GT level VF virtualization data.
>>    */
>>   struct xe_gt_sriov_vf {
>> +	/** @wanted_guc_version: minimum wanted GuC ABI version. */
>> +	struct xe_uc_fw_version wanted_guc_version;
>>   	/** @guc_version: negotiated GuC ABI version. */
>>   	struct xe_uc_fw_version guc_version;
>>   	/** @self_config: resource configurations. */
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 70d7b542f665..d913440fabf1 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_gsc.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> @@ -665,6 +666,38 @@ do { \
>>   			  ver_->major, ver_->minor, ver_->patch); \
>>   } while (0)
>>   
>> +static int uc_fw_vf_override(struct xe_uc_fw *uc_fw)
>> +{
>> +	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
>> +	struct xe_uc_fw_version *compat = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> +	int err;
> rev-xmas-order?
>
>> +
>> +	/* Only GuC/HuC are supported */
>> +	if (uc_fw->type != XE_UC_FW_TYPE_GUC && uc_fw->type != XE_UC_FW_TYPE_HUC)
>> +		uc_fw->path = NULL;
>> +
>> +	/* VF will support only firmwares that driver can autoselect */
>> +	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>> +			       XE_UC_FIRMWARE_PRELOADED :
>> +			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>> +
>> +	if (!xe_uc_fw_is_supported(uc_fw))
>> +		return 0;
>> +
>> +	/* PF is doing the loading, so we don't need a path on the VF */
>> +	uc_fw->path = "Loaded by PF";
>> +
>> +	/* The GuC versions are set up during the VF bootstrap */
>> +	if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
>> +		uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
>> +		err = xe_gt_sriov_vf_guc_versions(uc_fw_to_gt(uc_fw), wanted, compat);
>> +		if (err)
>> +			return err;
> on this error, shouldn't we change status to:
>
> 	XE_UC_FIRMWARE_ERROR, /* invalid format or version */

Yes, will do.

>
>> +	}
> shouldn't we set uc_fw->path and uc_fw->versions.wanted_type here just
> before claiming success?

I thought it'd be better to set it earlier so if we want to dump the 
guc_info in dmesg or something we'd have the correct info even if we hit 
an error. Depending on what we do with the bootstrap the error might go 
away entirely.

Thanks,
Daniele

>
>> +
>> +	return 0;
>> +}
>> +
>>   static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
>>   {
>>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>> @@ -683,17 +716,8 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>>   
>>   	uc_fw_auto_select(xe, uc_fw);
>>   
>> -	if (IS_SRIOV_VF(xe)) {
>> -		/* Only GuC/HuC are supported */
>> -		if (uc_fw->type != XE_UC_FW_TYPE_GUC &&
>> -		    uc_fw->type != XE_UC_FW_TYPE_HUC)
>> -			uc_fw->path = NULL;
>> -		/* VF will support only firmwares that driver can autoselect */
>> -		xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>> -				       XE_UC_FIRMWARE_PRELOADED :
>> -				       XE_UC_FIRMWARE_NOT_SUPPORTED);
>> -		return 0;
>> -	}
>> +	if (IS_SRIOV_VF(xe))
>> +		return uc_fw_vf_override(uc_fw);
>>   
>>   	uc_fw_override(uc_fw);
>>   

