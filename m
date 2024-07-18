Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E8EC3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 18:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5886F10EACE;
	Thu, 18 Jul 2024 18:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7Rq7HQR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C9A10EACE
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721329079; x=1752865079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=63Lnyt5GvirMM77DyW+XoXBQ8CNg35wTVHucGgkAcpo=;
 b=G7Rq7HQRN3BP1WTufPZY10lfWQjXvo8Sys/EWEvU6ZJYrbYriWFkQ6ob
 g0MB5pTS9uP19dHe43FIGkBuBap54WRmDO6dtv3LT7cgohSUEpSJst0kQ
 SFm81uHKTrZaNHoVgDcSXwTJ8iEdib/f2RCkEhjGKpkB04UyKAy81FU3V
 1JOpFC58z6InGgBLwxMxON5jnUMJeRIMxuVR1taz+ikqV+vgVOugAX8gx
 DI44u3OxDSf3UH7X0bH2iVZwIKcuCmOoKOLy9mjkBzHBRthdN2mhKhp/h
 voS4WyA/eMmq2MtKw9k63ZtUybv0Zjtak+WORl68BLl8qdlZ0DbSexlN0 g==;
X-CSE-ConnectionGUID: 9i5ZpBthRkeO3120+Wm96Q==
X-CSE-MsgGUID: jMUS0W3FT2Cr4JNjmzKaJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18623012"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="18623012"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:57:57 -0700
X-CSE-ConnectionGUID: x0L2lBfcSBqc7UO0DPzx0A==
X-CSE-MsgGUID: +sAcn0e4QPSvJJLeVdRbJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55396878"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 11:57:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:57:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:57:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 11:57:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 11:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzZC1CQzGidRYQvTLmCrsVSGHwF1JFRIvQmr9czRFDGCX58ZWKTdULruY1OOedeXecAbBSTaac0EQgHIPO9qOU5RYe8NPhibeOKuoqgI5rZS619owX3E+mzRqGzXC5QWfRmrBvNwzBL6tsNrd2f9IPmkIS1GjluMXs9/SSmC31ed2jaLhic5U9XCri2biwLHWt9ww8xCgP41BXocIsWV8v/xC+iKi6iaiyi4zG6oOC35NOx7WakIUBUy9wshU8MR52Xr2dEzWC/sPMuuQoFrJPZfF+qPCl3ylyTUuStrmjRih0xF2Aq8KJQIKUFLf4B7ssUDCwYWZSFdCVpuIMDzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8OUK4s29v9gCLnnPW0OFRLhXoc+KVJbzjR/UghZXF4=;
 b=CnlTB6yMmXv4hy7TtYmB4GYobBOxtq9JgZbFPGCe4wmtJwuGnpEyMVRAIkPFqFfmASU/pldf8pA5K/zmUiWDW+W/RoXNSPm+wFV7nRUk8pi2p9ulylbyyvnv9/XKj98SsDgL6VF17qgvqeQSSU4rE21hdY07EHhVj9UrnlBEf//MTobt/gMYQKENJJ2G8mUmB8P5ODh1SOCIfmCxc0aSnanHvXsB8lTon8fSjfNFy0w0ySn0SnmFDYrPF3sWVXL+sqd/98oe6gf2lU6S/mvWzstg+iLirrcypoPQG3SCku0d08SFCPv5+eZK2RwauI6ejOJeaQsPwU4JEY8Vrdqzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 18:57:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 18:57:52 +0000
Date: Thu, 18 Jul 2024 11:57:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe: Add ref counting for xe_file
Message-ID: <ZpllrlkHgzUsnFOH@orsosgc001>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-3-umesh.nerlige.ramappa@intel.com>
 <Zo2gjQmp3ISF0fbo@DUT025-TGLU.fm.intel.com>
 <lp4tdx4qyguivat3q26d7yut3nxveqeakfnc4d5epe7lklmma3@uhs6eqhizoqi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <lp4tdx4qyguivat3q26d7yut3nxveqeakfnc4d5epe7lklmma3@uhs6eqhizoqi>
X-ClientProxiedBy: MW4PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:303:16d::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b777e7c-3467-4ec2-0d2c-08dca75b86a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjRZMEdhVktKU25UQkM1RDJBWW43anVRR01jb1NsUHZxa1BmYWZmYXZCQXJv?=
 =?utf-8?B?OVAxM29Wb3FUaTVWTVR0aWhaQUVnUGs3T2UrU1lYbmVwcVZIN21HdUF6K3Q0?=
 =?utf-8?B?OVhidHZNa0w1NXBJNE1UbnppZHF6VGQ4VWpkMTFwb0tGREd5QU93bXVHNmhq?=
 =?utf-8?B?eGx6R1E3ZmdjajZFNG04a0VJWVJPblFUTXRQV2t0VXhxenFVYTk5blVwUHBr?=
 =?utf-8?B?YUVYZXNSUUttVU82ekc3RDdZVk94UzUvUGVPNWc5SFB1NEcwODNEaTZZWEpE?=
 =?utf-8?B?Q2w3ZXNhY3dMeThRZHYrbWFmSDhFZ1MwOGRNYTFaK2d3cFAvcHdiSFBhbkFZ?=
 =?utf-8?B?MVJvTlV3OEc4eTVDcERRdXJZVWxycTZZaWZUcitZK3pUSjlCS1p1REJNTmVw?=
 =?utf-8?B?eEg5cHhsaXp2STBwTFArdmFXUHpEL1VGTmxaYUVnSGlCREk4SXZHd3FETDlq?=
 =?utf-8?B?SG1kNmhPSXp1cEJTV3dhaUM2aXlFNnNCNDNJRFNIanNocDlaUk9Ydk5zdVhj?=
 =?utf-8?B?dmw3NXpNdW1HUzFWNEhwOWh2Qk55Zk1JSXlmVTliUEcxYkxtUlFmcTlLZlNQ?=
 =?utf-8?B?ek0xdzBGTHRwaVExZUE5RG5xeUlQRlM0R2FUc2V1dUl0YnhSbEd6bytJdVpj?=
 =?utf-8?B?N0Zkd3ZuMEVKRzNTQk9yWTNETW5sa0R1bzFKUDJnRzJlVHhiV0NkSHB1b2JE?=
 =?utf-8?B?anNXWUszV3JHVzIvdkRESVJGSm9DeVdiTDRwM3FZL1BNc3U3K01qVm50ZFMw?=
 =?utf-8?B?UVFpRGkyNC9jaDNjL2grQlBaYnBTeFJ2bEVCczBKekxDZFNXSGFiVVpyZTVI?=
 =?utf-8?B?WGZDTlorWnVFeW1aRzE2bU5KL1NpdUFaayt0RnpvajBnbEVYbmROY2VnZWV6?=
 =?utf-8?B?a0owZVVKNU1UclV3ankxL3p4elV5WGREZW1NRzFIcnZST3FFYWxRUmFERWY2?=
 =?utf-8?B?R2lOb3dTdmU2akk3NjlTSGUyQ1dyQUFiUm1yZHdNWllFZ281WnN5ajhUb21O?=
 =?utf-8?B?WmpKR2hRanhDSTkrV1FROEFzdzh6cFVXdXR5eGRDb2J0OTZKK0lLNTF0eWdY?=
 =?utf-8?B?b08yblpyZk1CSTFrTVRNelBRaTV2OTBFWkFIV3pPQzRrMzBVVGNudG9CY1Q1?=
 =?utf-8?B?aU9UT3UyaHFGWGt2c3pueGNOdjQxTEdPcjM5TWNyVVU0Q2x0bUo3NGJRaXRB?=
 =?utf-8?B?WUt2WUtTYXh1Z045T1Zvdld6aWVKb2pkc1Z0L2JITXYzNTdwVnIvL1hJRWtM?=
 =?utf-8?B?V1RPRCt5QUpoMktlWmlibFRua2Z4a2Q1M0dVOWhlanJrU0lvL25FazQzOWJv?=
 =?utf-8?B?KzdkVHc3RUtBb0FCbWJSKzZSNWVPdkNDR1UyUlN6NlpYWFQ1UUprZTNlKzNu?=
 =?utf-8?B?MDgvT0RwbGxOVDllTkxqa2pPdklpSkJtZWNZOU5hSU4zN1o1UWhralVBWXM3?=
 =?utf-8?B?d1IvMzVPdWt5R0REL2hpb2pxTmZxU1FhdkFaS2F0Zkt3SHFndU1pMkZzMngv?=
 =?utf-8?B?Z05uUjdLZStZbkFqSFVmN3BQYkZVbFZBZ21wV2ZtNXJ1Q09hVW1xbVBVbDlj?=
 =?utf-8?B?aUZWMFE5d0VhTmFzRENQTlhWQ0ViWnY4c0ovWGc5MFFzVHFpMmp5b3l1ZVRC?=
 =?utf-8?B?UkEvYitRcGt5Wm5xVzRIenNubFRGcmtIVGJOUXlVTCtaa0I0dHZzOEdwYWtt?=
 =?utf-8?B?N0pXdHphRFR3QU1ZbzZWeVFKNmFsaFVkR0h3amNEM00zODMvdU5FTjBXRkcv?=
 =?utf-8?Q?FcOu910a0stNEH1718=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTZyandyYytHN2phaVZsOTZQUEQ3emxmM3hQVVNFcVpyNG9BUktYcmpCYUNu?=
 =?utf-8?B?UW1wRjBHY1U3TEd4VzBXcWFDVGJGNGFSTVJWS1NiMjJucVlUWnBKU2FIeElB?=
 =?utf-8?B?bytPVUw4Uzhac0VIQ0l0ZVcyS3p1czlRU3Q5b1lCTnNYV2RWK2phZ3pSd1Q5?=
 =?utf-8?B?dzBqbHI4bFZuOGd2NFBZQWx4MHFMaTFNL3lsSlExTXgwcUR4ay9RWUphOEFO?=
 =?utf-8?B?K3BsS2NUQlgyaEVxbzUyMXQ0T0QrYk52ZHlDS3k1TU5qSHdaU3lCMWYvWkI4?=
 =?utf-8?B?cVJGU3grVEExN1VkaWZyZHd0MGR0QVZ5MFRnQWJ2WFgvSjhER3dMY2tZVmNm?=
 =?utf-8?B?Vnp6dWl0VDVZWHBaL2hibkhoK1I2dm9CdzZSbkYyZDdpb0xRSDNzMHZXQkhS?=
 =?utf-8?B?S2plNnNYUFlxNnRVcDUrbCt2NER0NGsvSFBkaGpwbklZNlc2QnZvazdROHBt?=
 =?utf-8?B?bmpRYkR4R0ExV1VoRUZiOHF3cUhhUjUvZEd2cVJBRmRFQXIzU3plNStuRkor?=
 =?utf-8?B?MGxlUnNCUVZ2T044dmpFVlpuK0wyTFJLSkdaaTFyWEYxVzhxekl5WXVEWnhI?=
 =?utf-8?B?eDFabmtKdUkzdXQramYvbUtPWExXS2FFYU4xQ0RRZFZvOXBRU0NCNU94MFJX?=
 =?utf-8?B?UnVCSGVjU2VJRSt3K0VPSlNINkE0eFFNNWJTTWk4bHNzWVMwOWVZZ2tPZ0Va?=
 =?utf-8?B?SzFjZDgrNkFXa0ZOalhsV0FCM3l3QXo3MFQvMHg0VVFHUDgxS3Y4T1kzbDVD?=
 =?utf-8?B?czJqbU9hNnZHYVh4aDNiR1laNGhvR2tiODRxV0Mzd1BqcmRmNnJ3WUtPQ0NE?=
 =?utf-8?B?UEF3TUVkYVkzclYwbW5paGRJeUUyRHhOYUhGY0JkVmhHZ1UyZlNhMmd0V1pO?=
 =?utf-8?B?cmpScEJVbVNPT0MzU1dzQkcrSlNnSVhOTjVUTzV6eXFEYzlZWkttZytGYTlk?=
 =?utf-8?B?SG1HQjViKzJoMzZnYnJXV3pYeTEwWGo3Q0ZYSkFIN0hMNzJDUDdMSXh6YmVU?=
 =?utf-8?B?OWdaMUZGbjk5NXVpODFSNU0wV0dhbmw4UmR2NGRhN2E1ejYySngyQ0w1RXYx?=
 =?utf-8?B?SnJ5QkJHSWRuK0RFWE9XMkJNUjdCakZ2WFJHVmx6dXppbDB3SzZROEZvNWox?=
 =?utf-8?B?eXJ3aVoreUF1bGJyZU84amJFMktKMzJPTjlHVmpKSFRjMjdpMHFoeU1ZKzNZ?=
 =?utf-8?B?ZkNkMjBDMG5tQ1RDNy9XMUJxODdQeVRSTXNvcVRIYXBJY0Q4VjJCVDFTUlFX?=
 =?utf-8?B?VnJGV1BTTkl1cDB0VThhd0I4OTFCYUtWSm5ydTRmSHl0TklTU2ZJVXYwbDdn?=
 =?utf-8?B?RE5WOXZMMys2WklVaGhJTW9OYXR0MVduSEgrRkhudjRMZDBtMHVIMFpuYjIv?=
 =?utf-8?B?RWllY3ZGQkt0MnpuTFoxT3duNk80WGZReWovZnV0d2hnSGcwOFAzbHBEbk9W?=
 =?utf-8?B?TnltY1pacXA2c2ViTm84ZlNueFFIS3FYOUtiaXFCakxSbHpibkZxNURTM052?=
 =?utf-8?B?NFNjZmw4cCtxRFUxYmMxWnEzZjZYTG45ZU52OWZMVFBmOGR3djZwUW1LTzRL?=
 =?utf-8?B?UU5wRHZoZkVkOWhQMng1RlBseFMyckh2aVZrT1BYVHF0L3JiVTlpalAxWWRC?=
 =?utf-8?B?UG01UDBhTitUU2Q5Wll2eDR1RTNCN3AxbXZnV092MVZ0cEVaRHk4WFVsSUxG?=
 =?utf-8?B?czR0bEJvWldXUlFxeWZsV2JKY1hqd3MrR2hRc2dDQTJnRG1qNTBsNUFoV3lG?=
 =?utf-8?B?clRKZGhHQXg0VHBxQTNoVUJObW5HdkEzdDJLVytuTGYrY2R5SzZBRHFmNURp?=
 =?utf-8?B?amJ1WjdkY3I3N1JWb0NwamVUWVRzaWxJM2V6V3VRR3ZCMWpGelBTRXJaK3dY?=
 =?utf-8?B?K3BLK3FiYWxhOWpxYlVNZ2JkV3JUclJ1MytuWmdFc0tyYU4xRzl4UFpXNi9p?=
 =?utf-8?B?NjBzK2RLcDFFblFuUWl4WU10WGpMZWZJNG91VmxZUUE1RWlkZ3lGT29ncDhU?=
 =?utf-8?B?eFBiUHkvVVdYWDVUQlQvZEZUamo4V21UaitLMW11MkNiOHkxSEF5Wmd3YWNh?=
 =?utf-8?B?c2FsMnoybkJJVU1pV0Nvb2ZOUWdzMlhCN0UvbDVVUmxJeFVLU05NNUFlbFN0?=
 =?utf-8?B?b0toWG4zaTc3V2krMnllSFpQWkYzM2NiWXBpcElSSGZaWFBXaDFMRTV0b2lN?=
 =?utf-8?Q?Pw1k18skbLonJyzX1Vy8PYg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b777e7c-3467-4ec2-0d2c-08dca75b86a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:57:52.3927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiofrvBNjTE02Ks6tV3Q89g4oqqxMekff82lUmdJ0kuN/1cFQ1UWSECl+qc2Q8sBaOsqPwEKcReIWTSRwDagB3LWqhw9KZoqyCrr7iAtv2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
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

On Thu, Jul 18, 2024 at 08:01:14AM -0500, Lucas De Marchi wrote:
>On Tue, Jul 09, 2024 at 08:41:49PM GMT, Matthew Brost wrote:
>>On Mon, Jul 08, 2024 at 05:28:33PM -0700, Umesh Nerlige Ramappa wrote:
>>>Add ref counting for xe_file.
>>>
>>>v2:
>>>- Add kernel doc for exported functions (Matt)
>>>- Instead of xe_file_destroy, export the get/put helpers (Lucas)
>>
>>Won't get into this bikeshed here.
>
>in the previous version I also pointed at other alternatives that would
>allow the inlining you were talking about. Anyway, as we said we may
>want to make the pattern uniform across the driver later
>
>>
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++--
>>> drivers/gpu/drm/xe/xe_device.h       |  3 +++
>>> drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>> 3 files changed, 35 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>index c5464ad5d908..61dc0a37a4d0 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>@@ -90,11 +90,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>> 	spin_unlock(&xe->clients.lock);
>>>
>>> 	file->driver_priv = xef;
>>>+	kref_init(&xef->refcount);
>>>+
>>> 	return 0;
>>> }
>>>
>>>-static void xe_file_destroy(struct xe_file *xef)
>>>+static void xe_file_destroy(struct kref *ref)
>>> {
>>>+	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>>> 	struct xe_device *xe = xef->xe;
>>>
>>> 	xa_destroy(&xef->exec_queue.xa);
>>>@@ -110,6 +113,30 @@ static void xe_file_destroy(struct xe_file *xef)
>>> 	kfree(xef);
>>> }
>>>
>>>+/**
>>>+ * xe_file_get: Take a reference to the xe file object
>>
>>s/xe_file_get/xe_file_get()
>>
>>>+ * @xef: Pointer to the xe file
>>>+ *
>>>+ * Anyone making a copy of xef must take a reference to the xe file
>>
>>s/'Anyone making a copy'/'Anyone with a pointer'
>>
>>>+ * object using this call.
>>
>>
>>Returns: xe file pointer
>>
>>>+ */
>>>+struct xe_file *xe_file_get(struct xe_file *xef)
>>>+{
>>>+	kref_get(&xef->refcount);
>>>+	return xef;
>>>+}
>>>+
>>>+/**
>>>+ * xe_file_put: Drop a reference to the xe file object
>>
>>s/xe_file_put/xe_file_put()
>>
>>With the nits fixed:
>>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>agreed with the comments, but the kernel-doc ones don't appear
>correct... we document the functions like
>
>/**
> * xe_file_put - Drop a reference to the xe file object
> * @ .... arguments
> *
> * ... additional doc
> *
> * Returns: ...
> */

Again, this is not consistent across Xe. I see some files following what 
Lucas mentioned and others following this link (like Matt's suggestion):

https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation

I will follow the format in the link above and hope that we standardize 
that across Xe.

Regards,
Umesh


>
>Lucas De Marchi
>
>>
>>>+ * @xef: Pointer to the xe file
>>>+ *
>>>+ * Used to drop reference to the xef object
>>>+ */
>>>+void xe_file_put(struct xe_file *xef)
>>>+{
>>>+	kref_put(&xef->refcount, xe_file_destroy);
>>>+}
>>>+
>>> static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>> {
>>> 	struct xe_file *xef = file->driver_priv;
>>>@@ -132,7 +159,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>> 		xe_vm_close_and_put(vm);
>>> 	mutex_unlock(&xef->vm.lock);
>>>
>>>-	xe_file_destroy(xef);
>>>+	xe_file_put(xef);
>>> }
>>>
>>> static const struct drm_ioctl_desc xe_ioctls[] = {
>>>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>>index 0a2a3e7fd402..533ccfb2567a 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.h
>>>+++ b/drivers/gpu/drm/xe/xe_device.h
>>>@@ -171,4 +171,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>>
>>> void xe_device_declare_wedged(struct xe_device *xe);
>>>
>>>+struct xe_file *xe_file_get(struct xe_file *xef);
>>>+void xe_file_put(struct xe_file *xef);
>>>+
>>> #endif
>>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>index f0cf9020e463..70115fb8d806 100644
>>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>@@ -578,6 +578,9 @@ struct xe_file {
>>>
>>> 	/** @client: drm client */
>>> 	struct xe_drm_client *client;
>>>+
>>>+	/** @refcount: ref count of this xe file */
>>>+	struct kref refcount;
>>> };
>>>
>>> #endif
>>>--
>>>2.38.1
>>>
