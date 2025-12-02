Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00017CFD376
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 03:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01EC10E360;
	Tue,  2 Dec 2025 03:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvHUgqJy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D8B10E360
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 03:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764646942; x=1796182942;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KUXEK9lnwYMGKXVl+ZNiHUJUZqWeqDHVUjJB70qH4rs=;
 b=IvHUgqJyyY/yNLAtDteFOaILhfmP80F8NU8tYWwPNYyPJRAoSr5vNc5n
 b4PYq0wlPjJc1Pr4KLrSsIov9R8kWLV3Sl3R+C2gv9NYWIvwzx4owONjd
 L2rxGZRfrf0TsFkYjXmNMw8eQSAsO8h/sSJaJZsTqmeFAwGaU2RSddgjs
 LEIpGP2ZT6w2toNJTDqrmacEAOGPpCEKdnbg86dc44hujlpS5Z3oCIJlM
 VD/pft1R4LlW3SGtFZsCAaTYErANP3SgvtymL/wNervY7ftgvGpkmfjT2
 Yns+Bhqw7N4XjUFzmTeLneEq2Yl1Lb8PvOb4URryxkYEFQe7EK7AdEsQ5 A==;
X-CSE-ConnectionGUID: zqym8MGhTWWc5fAVKffC8Q==
X-CSE-MsgGUID: qUylNXQERJ6EjhIrxd6a1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70219026"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70219026"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 19:42:21 -0800
X-CSE-ConnectionGUID: tG2nREr6S6ehlLblnIap5g==
X-CSE-MsgGUID: 71oEYXR6Tj+jwSPhzWbBEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194686454"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 19:42:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 19:42:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 19:42:21 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 19:42:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/3tEfzttkmgGCSAPQ8OJ5j8jwU3O4LF65xxGGjJSUD3HcY7yKPaP7XVN7Jwz3E8mw20ECYMITqU+7toKyiDrvy9UprANe8CpTa0sfGyX4CXCLI6QOkKOeQC74UT91ZMZ1UguaImofZzKz2f2R4U6LbhFvrlGeK/m1epn/GUEJmDDMeq1vG+0BqIVfX6NsHl+9CsMJwnoXg8h0cCivClIUVfkUPb9lKl4aGSPUkAm0GEML6adoz6EWS4RmQS7E+g2sYUqYqOxoGgUwYcVfiAiQqgHZHmeR9iFosOKbwq0m+ZjCyH4XuqgNx6OvOx+dWXQD3xhMTBSxX1SDwJRcQ3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uZKtbsvorDXXvUjrIg64pSN3Cb3Kkit2xMz9/1xwJY=;
 b=Erc3rd59nOeb3vIetE3Hyb1EfYLn/FWlaABGE3e+EiOLRHMimpOTa/8O6m0ms7Llxu0T26iIRlyDFF+I6kaCsobr2fU32Dd7xcNxcGeC3B5RagIEqkwbWuM1QeFPPpsCLeKr7lyrScFEQvftavyHHz8AVMl00AJwiaGhjJHPNJWeyHx0vyuzfiu3loayUdWxtuiN9KRHOAJcVvDti5QWV8LFLt7ve33XLktawpOrjgpTpE0QYkCJx3zt5mFE33rTp0wX6JP33g+8DfAuBzmPvt61EzNcqLlewCm+RNR7HbqTda6eZG28l2T+8unWULi2C2q/V2UzCD91CNQ9e8N3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by IA4PR11MB9277.namprd11.prod.outlook.com (2603:10b6:208:55d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 03:42:19 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 03:42:19 +0000
Message-ID: <6c3ed737-3dd5-49ca-a78e-593d8e187220@intel.com>
Date: Tue, 2 Dec 2025 09:12:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 3/9] drm/xe/bo: Prevent purging of shared buffer objects
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-4-arvind.yadav@intel.com>
 <aS4geyZDuwlcyc9R@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS4geyZDuwlcyc9R@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::8) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|IA4PR11MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: d98c6e3d-e441-4d11-66bf-08de3154cb49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1orOTR4RGJiQWhEeU9ZMjFnMmRCSXduUXdFWEFTU0VFSVhqZVJmb0tmWlFD?=
 =?utf-8?B?dDVSK2c4ME9OTVp0WnM3Y1JHUHVPQ0w4cDRxZURTbEIwYWhPRlJLNFlQNkJY?=
 =?utf-8?B?TDlySDk3bXlCRFZhUi9UMSt6UEFmMUlKVHZMTlY3U2lQcWl2dVBSTkFTWWJo?=
 =?utf-8?B?cnpRS1hZZ1dsV2ZmODV6MGVYTjlueFhUQjRKYXJTcTBrTmZkQzI0ZG5QMTBa?=
 =?utf-8?B?RmtpNjc3QTBwY3lmSkpZTFJUdWQrTTdZUnBrL2RHRmVpVE5VMjl6ZldPTFFL?=
 =?utf-8?B?NVFIcUdXM1Q3dVBoNDhmRFkyWFZycFVSRjZNNHZSd0FTZU91dTNVYklLNUVq?=
 =?utf-8?B?bHBYODVSOXgwMGEwazJIWGxXVTRRK2FXQmN2M3RJY0gxbEZ4T0I1eFVDZWZo?=
 =?utf-8?B?YmIxSmUrdXh2eUxnMHVnT3FtUHV2RTByQ2RxNkJZTlJtNWFKbzVuekEvTHI3?=
 =?utf-8?B?cU1qUnV2TkZCa3h3WWw4MDRCYzVidlQ1d1BoUVdzZm9UaE4vb2M0Y1ZvekQ0?=
 =?utf-8?B?L3M1NmVjUk9CTk1pTkZHZlVqeXVJaXQzdUJpcHFpc1I2cXJyMm1XaWpiS3Y1?=
 =?utf-8?B?aXBHa1BnZk9zQWl6R0UxNmlwUWdDY3hXbVcyUm5BdzM0QTFmVXlQdkk0REhR?=
 =?utf-8?B?N2pZOG9VbncyZHlmaVBLMGh3ai9DOHRsbE1OelIvNGtGb2lEOTFZNDdIQUlZ?=
 =?utf-8?B?NDNLRXlqNFRYK3JReGVjNEF5YzVxa2hDVklUNWRJdTJpaUptOWFlTVRmSmo3?=
 =?utf-8?B?ZjlyNVZDYnJ4M0RoUzFYSFBGcmJXNkRtRCtUTkxUVURzVG50c2xOZGllU1pa?=
 =?utf-8?B?Y2lXeTN1OE1oSjVNZnhlNnkzekdiTDRZMjg3NWR1endMcys0THZyb3Q2amp1?=
 =?utf-8?B?NC84cTFJMjVLS2w1OXQ5U2FkTDc4VEVXZUk0akpCZ3hGZHE3b3h0ZHdxY3hk?=
 =?utf-8?B?M0xIWnh1Vjg4M2plc2lUcHJXbkxsT0JUNW9HNHZzNnVUY1dROTYrSzU0Ry9k?=
 =?utf-8?B?cndHY3Q4Y2xTVWphbm9KK3pGTWNzc1gxVjZDLzMySHJQVDVCeS9uR3MvclNl?=
 =?utf-8?B?WXc5aEhlYTFieXVZK0dQS3orUjdnWDRCR1RSYmhrUVNxVE1aNDhVc1lGcXlG?=
 =?utf-8?B?VFVscnJCNExrVDh0R2htNHV3enFWbWI2L0ZLYk8wWjgxVGk5cHgvT3p2NU5P?=
 =?utf-8?B?RXVOVkpRTE8yVTdKaDVVYkFPM05yOVQ5YWMwSThkUm5leGFaaGxNZXpJYm5L?=
 =?utf-8?B?TzBXNlVKdkFJVmZSQmVZYmJ3aEZqN2w4ekVLK3ZnQy8rdlFMTVRRenlIaTZm?=
 =?utf-8?B?QWM2Vm9oMjJQOTZXRHBiZWFMTmdPaXZISmxTS0tXQ0c5Zm9uTzFRTVVsc0pW?=
 =?utf-8?B?WGdXYkdsSGl0bWRIdDVlTEhNWWtKWTRpNGRZa0Rpbk10YjRpeTVSQVRkVWhu?=
 =?utf-8?B?Slc0cTZhc1Z6OTlkSWhjK3ZjdzdBNHV3TWYvYkpuRXAySUhNRXJPUk56Z1dM?=
 =?utf-8?B?a3NiMVh1TjhaRVVJODVWYTcxYkRZdmlha1FOT0lIa1BFcjlmT1lNeEUrRFVz?=
 =?utf-8?B?SnVlUWExdUxYdjl3VkF0V0dmMzRYQTl5aGs3akJNeVZFVlRsY01PallxZ29E?=
 =?utf-8?B?b210RjcyMGhxWWNoZTRTOEFQeHpibFFTclRjUkxKbjh1c09LWU40SXJqbHVt?=
 =?utf-8?B?emNvOUk1SmwzTFdsQTluK085TUM4aFBkQlplMnJzVWVzSWE4ZWx6V1dKN1VI?=
 =?utf-8?B?MEkxaGNJQ2w2OEMzeGlOcFI2cnNSUWFSa1ZFczJhWlpDMjNocExwSHpxb2F6?=
 =?utf-8?B?alJDZzIwQVo4Z2RXdk42YkNiR0RVc29ndzVCbHpFb21SbURpQzZVY2JtMFpZ?=
 =?utf-8?B?czR5aVdNdkhhOGVJRGVCUEVwVHFLaEJUVmFOcmpuMjBZNVVKSjlERUNIMkE3?=
 =?utf-8?Q?HgLiXhwqx7MO2vbZf6JJvjrz950ny9D8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZzc25LQXUvN3U1bTdTbXNhbWZ0eVMyMEp3ZWV6bUtnb1pPVUVhWW9xcitu?=
 =?utf-8?B?VS9NdGNkRkQ3MkVWTXFickVDZ3FSZ2dPZnhyRUZnK3plQUw0UEV0SE1LU3dq?=
 =?utf-8?B?UUJRK01lQUdyLys4eFpRTzdldVA4VlVCTDFiZXFOQTZTMU8vUHBtRDlENysy?=
 =?utf-8?B?aDd0K2JwTXRRekt3VjU3YkZLYjBBY21idThOSFczWmVsNWV6dlgyblFxcmJw?=
 =?utf-8?B?ekhheitidHJUeTdSRTlGamtEUHB5RHFybzBYRVphRXBUTTM3aGQ3SzhtVkdI?=
 =?utf-8?B?bTJ3WTBsUnFmZ1VtM1RiTy9VREI4T2ZYMWJIL0J5c3krRjFsTnZhTFFZVnFT?=
 =?utf-8?B?SnRqc1VsckJ0Y056dW1tRDd1bTgxM1ZtMko4YTAzQThiQXpUbzVUTU5GY296?=
 =?utf-8?B?TnI5SjRrWW9TVTRwand1SEtjWjBVWElnL2d2RGNmYlBRd3Ywamg5a2x3Q3VW?=
 =?utf-8?B?cVRad0phQUdqaGJDNnA1eUdSQnpaTWFKSEllTzhXRDlWckpYcmVhRVk4MWpz?=
 =?utf-8?B?SXBvMm1ScHdhYTdtUGh3cmxpdi83ZmI4K3NkbUtlaHhGSUpqYmFDaEZpZGQy?=
 =?utf-8?B?OEthT3grcmhXSURpTSsyemdIUVhrWjRldEtLSnAvOEVyL3BDZk1kL3pFaUtL?=
 =?utf-8?B?SURQN21LR0RYc29aZTBKbjh0RHc5Z0gwR2hVNU1ialZ4NEJRSlZidE1Wajkx?=
 =?utf-8?B?dVl1anBoY3hRdUZiQStaTVV6RHZIN2ZmUzNqcWtTbm5URm9nUkJuNUdQcjFI?=
 =?utf-8?B?OVlwTHExOEVqQzBTbFhVMFQwMWVyUlJhc0o2MmpnS0NYSk81dDlZdmFPRE95?=
 =?utf-8?B?V25xcEtPeXdYY1R3SytHRHA1aUNLd3NSYXUzcTBaM3BRWlU5U0ZmNE90a0ZS?=
 =?utf-8?B?TWgxK3JnY29EZkZMVUdBcHlTR0VpalZVT3dpMzFrQS92TGZWMGpRemxVT0NS?=
 =?utf-8?B?RHlhMkFVVTF2Rno3VzBNek1UMzFDMXZNaXE1d2tBckUvVXBsVENRUnVrUGZU?=
 =?utf-8?B?dTEzRWxUZnk1TS9Qdnc1MXRLelhOa0k0OFBPK285TGNTeGJRb2NNY0hPRmc1?=
 =?utf-8?B?K2lodTZkYTQ0YnFESVVBanVScE9XSDgwMXdBWjNtUXFVZExwMlRwQWdlZGEv?=
 =?utf-8?B?SXFKQU4wUmVzVkxPZWlCYjgzblNzRnozWEgybWhJelRpQWtYN0llRDFham9V?=
 =?utf-8?B?Z2Zsa2tGcDhDU1QrSVJPeU84VUhmLzg5QldDOFhVbmVRS0Rjdi9DR3huUDM4?=
 =?utf-8?B?SDhxYk9yV0NBZlNUWnEyOHJiTjFFcFBGZUVnRjlmRU1pZU1TR1Q5emlBUXZr?=
 =?utf-8?B?QU05UFZMQ2sxcGtXK002VVgwaDFqeTh0RXdCai9HTkh1YlJSOGxyd0ZyWlhw?=
 =?utf-8?B?S2ZrWmhGaFZrN0xlMDJZQTJtT09LS2xUNTRWMnR5dDloQy9UTUF0emJSb1Q1?=
 =?utf-8?B?dkZLalBjNGZkWXJtN2crdzgvSVBndVZERTRqWXdrdGtWbWJtTTc4T3dkc1du?=
 =?utf-8?B?TVFaVWxVRVhwdVQyckYxWk4wZkVzVlNNeWJOcjFzc0Zpc2ppSm8vZzlvbllO?=
 =?utf-8?B?L0IxSXU1UE1Xd0dYSG1PWjNkUlJjYkVlMlBXRHRpeFNRbEJDNWhUNEMvOGhO?=
 =?utf-8?B?amhyUlJXZHlVK3ROUFpET1M4MGh4eDBTbnBWditQRWlLY2lIV3RmUFhJRnpO?=
 =?utf-8?B?d2ErVXRoNzVaZENSanVYbC9mUUxIUm54WkQ0Ynk2ekNrSjVFNzI1Um9XZmtt?=
 =?utf-8?B?bTJ3NUlBQnBTZGZtT2NuTjZUNEJrRXE2aGt2NitUeGxOTEk3SzFqRkttS01L?=
 =?utf-8?B?OE9xVkR4czhjODdVd2tzTHBRczVoRTJvYmlsTEtjNnp5eXFDbFJvazdTcmM0?=
 =?utf-8?B?NFJvbFFLc29KM2RTSmRKMkpFbjNvVG1oSDR6S2VpL2p6T2JhK3RYdFhYWWFI?=
 =?utf-8?B?K1B0S3laZ2ZsWTNjNzZJdW9lajlGaThDN0lvWVBCMjVhT1JhWXVRTGRzU3B4?=
 =?utf-8?B?ZXgrR1lPbU15WXpUVjdXYmNjdk1TWEV6U0Q4UjZtQjVnc1lSVmtWY3FHOGpv?=
 =?utf-8?B?M2ZqN0wwRnNkaUhERVYyaldtanlRdnpnanJFSEM1dCtEbmxLVVNxS0IwTnZ1?=
 =?utf-8?Q?qzfGIeHXeSbQR4I0DwqND1cLo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d98c6e3d-e441-4d11-66bf-08de3154cb49
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 03:42:19.3969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2x8VaaZRcqwyPjcQZBmc0r5tB8wCbSpuugAnREx1Zd8n4OwTfbo1+C6jV9TKKpgaBIjMSnaXJyzrNr7oNdsnVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9277
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


On 02-12-2025 04:40, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:20:13AM +0530, Arvind Yadav wrote:
>> Introduce the `xe_bo_is_shared_locked()` inline helper to determine if a
>> buffer object is shared across multiple clients or drivers. A buffer is
>> considered shared if it is exported via dma-buf, imported, or has a
>> handle count greater than one.
>>
>> This check is critical for safely implementing purgeable memory. Purging
>> a buffer that is shared would lead to data corruption for other clients
>> that still hold a reference to it.
>>
>> The kernel cannot safely determine when all clients are done with a
>> shared buffer, so shared BOs must never be marked DONTNEED or purged.
>>
>> The new helper is used in two key locations:
>> 1.  In `xe_vm_madvise_purgeable_bo()`, to prevent userspace from
>>      successfully marking a shared buffer as `DONTNEED`. This is the
>>      primary safeguard against incorrect usage.
>>
>> 2.  In `xe_bo_move()`, as a final safety check before the kernel
>>      initiates a purge during eviction. This ensures that even if a
>>      shared buffer were somehow marked `DONTNEED`, it would not be
>>      purged.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.h | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index b0a31c77e612..97edb38bf1ed 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -478,4 +478,34 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
>>   	xe_bo_assert_held(bo);
>>   	return bo->ttm.resource->mem_type == mem_type;
>>   }
>> +
>> +/**
>> + * xe_bo_is_shared_locked - Check if a buffer object is shared
>> + * @bo: The buffer object to check
>> + *
>> + * Determines if a buffer object is considered shared, which includes:
>> + * - Exported via dma-buf (obj->dma_buf is set)
>> + * - Imported from another driver (obj->import_attach is set)
>> + * - Referenced by multiple clients (handle_count > 1)
>> + *
>> + * This check is used to prevent data loss on shared content by avoiding
>> + * certain operations like purging on buffers that other processes or
>> + * drivers might still be using.
>> + *
>> + * Return: true if the buffer object is shared, false otherwise.
>> + */
>> +static inline bool xe_bo_is_shared_locked(const struct xe_bo *bo)
>> +{
>> +	const struct drm_gem_object *obj = &bo->ttm.base;
>> +
> It seems like everything below here should be a new drm gem helper.
There is a DRM helper 'drm_gem_object_is_shared_for_memory_stats()', but 
it's
specifically scoped for fdinfo memory accounting and doesn't check 
import_attach.
>> +	dma_resv_assert_held(obj->resv);
>> +
>> +	if (obj->dma_buf || obj->import_attach)
>> +		return true;
>> +
>> +	if (obj->handle_count > 1)
> So this covers the case when we prime fd to handle but we resolve to a
> BO (i.e., we don't do a dma-buf attach, rather just take reference on BO
> as the BO is from the same device)? I just want to make sure I'm
> understanding this part correctly. If so, maybe throw a comment in here
> or update the functions kernel doc a bit with a better explaination.
Yes, that's correct! The handle_count > 1 check covers exactly that 
scenario:
When we do prime fd-to-handle but both processes are using the same xe 
device,
we don't do a dma-buf attach. Instead, we just increment the reference 
count
and handle_count on the same xe_bo.
I will add and update the function with comments.

~Arvind
> Matt
>
>> +		return true;
>> +
>> +	return false;
>> +}
>>   #endif
>> -- 
>> 2.43.0
>>
