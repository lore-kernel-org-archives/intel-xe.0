Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A82E6B272
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 11:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D1B10E215;
	Tue, 23 Dec 2025 11:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nref2PHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B741810E0BE
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766490732; x=1798026732;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=eS0UqilldqqGZMSQh0g6tjrmNawy48KbCQEf8LPU7/A=;
 b=nref2PHFVvxXbeJu7qKvc9BtVLSZmNrirKXlp4dVaYtep7zQ203CRBJh
 tSj3qefUfXKIl8JqCYIrW/ALpP8J17TVClJSRtBykI0g4BSj65pjVzdA4
 izgPOFsKkW9UJIZ3cGSlTUkAp8yqZNnthWtIf+nOXX66hlAo9rZpKqfW4
 S5S9inPSKqB89RjEwjkwfhpVoIxR5RccFBetEkETcB5uyduJTeRcgeF+U
 NElWQDvph69kQ4rngXArNjjYtPaGYNp79ZclKVNMvIQbksaW3gtti+ZEx
 ccgad2NkaigDpDTkQPWsu2cpXLrR3jIHTMzgKnI4GjTk+1y/KkJ88pcjS A==;
X-CSE-ConnectionGUID: BSf7GVBYTTCkAqKXsgGbxg==
X-CSE-MsgGUID: /Jstyr/BQKqQdd3e32upBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68094331"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208,217";a="68094331"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 03:52:12 -0800
X-CSE-ConnectionGUID: tpmNcxvpQuGManPHD0noQA==
X-CSE-MsgGUID: TXAyaxEjTaqvTuIUWK9OVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
 d="scan'208,217";a="199529185"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 03:52:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 03:52:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 03:52:10 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 03:52:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeZCYZuQVctr2C8iszOgwlaSl+b9Wf3mJvROtspfVfJjl8DBHQ6Wf6bRLG7BtFnJUZvcl8RG/B+MzRSMBUvqUE0NW7YkvgH4foASM5z0773AHYVpUWvUzptLAAAB/GHcluhd/veCY0aopVzn5RD2GvmsNr9bFW8wKS0ymzUuJE1kgZ8cpXJftDoFdwtTgNiBwlplo/rqK/ggqQfu2Pn0fCYpcy7vkEJyaK3QETejmNXJ8jNfwCZlOGbBT4EQZtBdpoKSDo2C05+O+b0LquQufjJpf27SnBBeLowDcAmNhdeUIYbwTd6dm+wjDVC0XR0CCAR3bn4yY34W244fZVckTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQtVeGb9cOYxGackMzuPDa6NEEu5U7biLbn5ruUpDcE=;
 b=ZCGBeDymU/ftIqwXDQDlmUgzvZ3otBlo8WXLeCfCYpWWxgZpv/BgdJsuHpB6dufcJRuRB5ND878YTXG4x1imppuhsRXxy437MOHv2CZiBObLbD3627s+6F2XDiSaRWpWXz0Y+hrLyPANEZX0rgP3sSyHRI6h7zIfbPUM0koKxG3otAlziWvFXJb8/FBImiNT0ztBPFiTGNvGOD2MIDJppT2wBUhqmAfRpBe3nN+kebcbLvZgvZJYoxtHz4TlIWFzN9A60Xy/OdYCbpTiovs/Ezl8Jo1mKr6nIXfJzgU3qRBWBA3R1XvvfOi/zAnmXCe901ayzpkbiDRlWewlC4beIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 11:51:58 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 11:51:57 +0000
Content-Type: multipart/alternative;
 boundary="------------Nzuw5fe6hejtHbcNklsq9fuL"
Message-ID: <40726758-16d7-4f51-b0b4-3cc6489f915e@intel.com>
Date: Tue, 23 Dec 2025 17:21:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/hwmon: Expose individual vram temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-5-karthik.poosa@intel.com>
 <aUhB3E2JyXQDY_kI@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aUhB3E2JyXQDY_kI@black.igk.intel.com>
X-ClientProxiedBy: MA5PR01CA0239.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::16) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS0PR11MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e46271-81d0-4007-a364-08de4219ac53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sy9iSEVJZGQ4Z2tDZmcrYmpxKzE2bEZzWTZhbEhKNXhzVGc4Nlk1cDQ4Vkg3?=
 =?utf-8?B?eEVqNGRXdUZiU2VmWEhVTFFZRitKcXY2WVF0aUNCaXpQdlBjYUJRWlNZem00?=
 =?utf-8?B?MTkzMWpBUW0rd3NNSnlwcVUxekdiOGlLQVRzdWZ5ODR1VUVmbVU3dFFqdXd1?=
 =?utf-8?B?SXd3Yng5S29MeHozVjF2R1hINUs1M2l2TDk0NEFtWk81Qm5uMWMvZ09KQWRr?=
 =?utf-8?B?N3k3aHZWRTNWRUlZN3g2OHBIYy9zZ2FHek1la3VRSmJ3VHlIYUZOWCsxdUov?=
 =?utf-8?B?SC9pVUNnOWJhcFNoUE1GZ2J6L0dLVE9BbWI3WlJGd1VhRmVOV2JYTE1JSHdF?=
 =?utf-8?B?cFh3L1lDOTdKa3M2ZmwwOEVlVWdWaWdtQzdQSldRcmpHdG43d2pwU1pQMFRF?=
 =?utf-8?B?ZDdhS1ZBV0hlUThZUFNFdVB2RzI4cTY2WUdyejZ4QklPSlFNZ0hleHN2ekx3?=
 =?utf-8?B?N1pibFViWWlVUEUvWWN2ZnZ1Z1VNRU95YnRCam1jN2RqRi9BajZHZjU2cFQ1?=
 =?utf-8?B?MjlPWWZzdkpKMktPTzR4T2JGb0hJT1Zxd1RiWHEwbndIcEVuUHpra1gwNUFh?=
 =?utf-8?B?dHlQR2dNUlgzQVhPVHZNeVpKT1JNQ3FhQXJNcjYyTDRRZVZOdCtucUV6TG5D?=
 =?utf-8?B?WTJPbytJaGVoUzlRa1dMN2VaZWJFVnFEVXRpWkFxeUlLYkNWemRFeUJINHFx?=
 =?utf-8?B?UDR2eU56NXRKcFRadk11TkhQRGdaVkt0dmhpS1RNaXQ4TzB4bWl3YWRCMENY?=
 =?utf-8?B?Z1VYckxzQVo3SFNlUEI5K0VmMWtxay9zTjJLYStiMGhlb2c4UG5ETWlkSTM5?=
 =?utf-8?B?M21LMDlsZ3UxWlFlQzdhN1A4dmwwd0hMbllwbU0zd2tPd1AvRHVNZXBUNEZy?=
 =?utf-8?B?UzBBeCswak1SRzcvUGpMdFhwbldiTHBPVGROOG52S0FKcUpub29SdlJ5ZWRE?=
 =?utf-8?B?dE9GdWdjRWZKaVlsZjBmem1HRmJpZGdzVGVzYXk5RHB6clc1bEJqdmg4SUV3?=
 =?utf-8?B?a2M2NWRRVHB0QXJ5bjlydmVSczAwN29PZVFsZUdhb0hhMFVnQW5uVzVzVnM0?=
 =?utf-8?B?ZVdEcitkSjJLNE9RaXhLQVFTRkl1VXVUV1Q1Mlc0U1dhMS9wdmJPQ0h6d3Vq?=
 =?utf-8?B?b0lJMjRPK1VMSDA0ZHJvUXhXTVpZS2lEbGtDN285UTdyWld5NE5pTTlkcXA3?=
 =?utf-8?B?VDZzc3BKL3ZuQWc0dTJFUm9zMk5oVERMcjJkU2lNRWNBVURhbkJob21XajFG?=
 =?utf-8?B?dTNBSDJabTE3d3gzcWNPYUNOVDJ1VDRBMzVkVFZLSmtRWHlHanpBU3VoQUhv?=
 =?utf-8?B?ejNNemlJbklwSHM5MSs0ZXJlSWpubWhPbFlYNlgwSXBVN1NnazkzU2l4eGo1?=
 =?utf-8?B?NmcrdkhHa0lFcUlPQ1daSmhmL2k0UVl5QTBUbU9OYmZmYUhVQjlDamFucDB4?=
 =?utf-8?B?WDNZOUdaa2lNRStBeEJGUFVaZlFJUnlZMVVmT0N5aEpMWnNsR2VCY0V5Sk5O?=
 =?utf-8?B?MTZRRm9vM04weU50aTlLVy9CYUFUWk1FbmpKaWRxYXhsU0NNRlY3SndZeFlL?=
 =?utf-8?B?THg4dTBHMktrUjVwRXc3eFF5azVNWHpPZjBSdXcwWkxoSDQvSGNlV0dudDhm?=
 =?utf-8?B?ajBvenhaYWtwSllsbzI1YTVEUUpyS3pJd3JHaGdjNGFXd2Y5S1hTVjBqLzdT?=
 =?utf-8?B?VHBBZE92alU5bXBjcUNseWF0R1dreVNwdldmT2xOVVQrRlVFN1hhbE1ZbjZ5?=
 =?utf-8?B?TCthZlpJT0hvekV6bVIrZStpZmdFRU00eW1mc092VFY3RERPSjRPVCtCMGtI?=
 =?utf-8?B?eWdONVkyblhESjZvV0JNc0RBM1k5ajdabUZWWi94NFdGakYxUTA0b2xka2g3?=
 =?utf-8?B?bmZZOGJTYUsxcHRoR3k2WC92d2N5TU1QWU9yeXdYWDNqbjRtWWRKTTNvZ1dh?=
 =?utf-8?B?QXduZEN2NVUxMXd0ZENvT2wrdkNVZHV3TWRmLzZvbmpWcjNoTTZEeW1acnFn?=
 =?utf-8?B?Y3Z6WlZZVTBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEVuSFFOblkwbEJiMnR1aGpyMGM2ay9GNVM5di9PUDg4aVU2RVNTSERaMkhY?=
 =?utf-8?B?ZjZrY2p2N2owZWxzM0NRbUNvUXNFb1hwZzQ4d1BFSnAwNG1PeVZKTjBFWXF4?=
 =?utf-8?B?ejhKRU9pMXkyM2VHRHdVVll0R2s4VWhTNzhnS3lwZlFvcUlSc2s3ejNacWhF?=
 =?utf-8?B?ZTVVaTcvamNhaEVZOW42UWFFUnNtbzEvUzI2UE5yYnRHU2Q1NlpEanVyUktJ?=
 =?utf-8?B?MnUvVkZjcU8zT0ZDVHhTMy9ZZHY4NGhFdmRSbzBzblJJTndJK1JvbkV5bkxF?=
 =?utf-8?B?bHZjMnQydDNVdGZpbUJvSFk4VWVlNnlQbnlUMkRMMmxSdFZxNm82WlY4V2pa?=
 =?utf-8?B?bGJnbEZqVkpyYzNnZ0VrMEZHdzg4WDlCQ2xSSllGRjNhRGt0YlVBOCtwVHo3?=
 =?utf-8?B?VkQvdE04dlFhY1Q3OUNpeldxSjJ5bFF6cU4yWCtOaGVkWE5YaWx0Y0NLMGtj?=
 =?utf-8?B?RkU0MUp3VSs4bjRPRGhKTzM4Y3dyc2NHNG52Z0tPbkVHUTBHWWpYNVNBb29x?=
 =?utf-8?B?SmlSbGpLZExySWdQSTJseVR3SVljMWUwQysvR3NsQ2V5L3Zqc0VDVkpXSFBQ?=
 =?utf-8?B?S2VIWCsrUExyVlM1ZGtzemkyOTBMUnBkMUtwUGgvSzF3UnRsOXhCNWdtM3lU?=
 =?utf-8?B?cWlvc2dJNnFBNVU5ZG5ZNEo1ellOczhRWElIUnRkbG1MdVZoS2VtMXRuYVhs?=
 =?utf-8?B?L0thOXN1ME9FemJqS2tJOUQ5L2J1bnUzNXIrWjZMSWJSQkEwWnJIZWhiWXVt?=
 =?utf-8?B?RkV6bnJ6WkM5djJhMHY4MDBYdVNua0RJQWloY1VJZjhON1oySzhYM3Ara3N0?=
 =?utf-8?B?YXJGZno1cVRuamt6M0ZEZ2M2bHB6cTJTS2ZWS1dONktvNVhYT2dMeVdCL0tV?=
 =?utf-8?B?bldiT2ZzMU5XSXRpTWF1TjBYaXdqZVJsanJ0d2lSTmJYbjZReFVQUzRMSFM4?=
 =?utf-8?B?U214ZWlqWDIrNXVsRTF5QnozcStaZjBENjljcTQ5SXQwMGhza1plVTQ4OHdP?=
 =?utf-8?B?S2cyRndiWVBQMTRVTS9lZVJid2VRVGxVeDEzUVFzRnd5Sk05bHR6RjNWeFhJ?=
 =?utf-8?B?K0VCYVJsZjU4M21WVTVhQk93Q0Y0Nmd2V1JBdlVvR1JBUVAxbXVaNURkdHlI?=
 =?utf-8?B?VWsrQVZSVVJoaWN4NEdmTWhUWmhEOVZFRncrYTJyZ1NrTDd5cGhvbXViTWJj?=
 =?utf-8?B?YkdER21wenlWU2FTajR0S3Q1T0g5WlM4L256Z3ptMHJRZnQwSFUwMFg5aEdl?=
 =?utf-8?B?VHVOQjRLV2dGaVdwNGRzRmxFcGdzZ0xDV1hYQnp1UnVuZ2VqZVlqaFhGMVhD?=
 =?utf-8?B?eUJHZ0hOM3J0dFpqem9LWUZmSXdEUlJaVVRXVGw5MHBlRm5BSjgvU3Zteldh?=
 =?utf-8?B?WTBtTkFTMWxldUk0WTNPdmhFK292T3JQNG53Ly80NERiTTM1QVc2U1Bja014?=
 =?utf-8?B?YnJSU2F3anNJVGpseDdCNzFscEthUDM3WjcxcGpobVZqeVlnTHhnRU5XNTFI?=
 =?utf-8?B?eU9ua01RMy9XSnVVUjF6ZTJWWW8rSmErdHlFQXpDTCtIUk9JWU9hUHlVUTVk?=
 =?utf-8?B?TUdQc3k2Qk5tK0h6eHNFb0lxU1M3dE40V0I2K2hNZWU1NmV6c2U5K1NEcHlq?=
 =?utf-8?B?RFhpcjhVYjg4N1pTckxkOWxnWkpXc0M3WDBnT2piV2xNamZ4cDFnRHJET1lP?=
 =?utf-8?B?RlRzc2M3aU43ZHZTbW12cEVCSStjUjRpWFBCb3QzbTVtWVdpd0QxUlF6OUZV?=
 =?utf-8?B?WExRYk9haDRrVmFWd0JuazBLK25oWHRaZTlGaTJPNGx1aEpKMEJ6MDc1M2kv?=
 =?utf-8?B?U0gxVjNPMWNGeitEV0MwaEU0UjE0UmduQkVkcUxEZjJFTGZSZlNFbGhoKzQx?=
 =?utf-8?B?bCtUcU5FYWNKVkhhYWtUY25LbEZSOUNoVC90OFphd3VkUVlEZEpyS0F5NDVk?=
 =?utf-8?B?SDRUMzhCTUZIaUFvYWFKVFY3djZJdzd5MWVWWXdzMm1ENkRoS2srVko5VkFu?=
 =?utf-8?B?K0ZFWFIxOXdzQTJxVldVTzQ3TUZhU2wzTG1xd29PamxLaGh5UDFkYW91OVNX?=
 =?utf-8?B?eWZ6N2tPZkt1VWcydHBqbnd2czBjeEtZZVVidlAxVkNlQnFLR0dwUkprR0px?=
 =?utf-8?B?YjBZT05CMWsxUjk5U1piOTh1OERQUGNBNHRveTlWMUdYR3ozdkZSVGN5cHd4?=
 =?utf-8?B?enZtNk9ta2xBaU15T1k5RDh6R0pkRmd4bmVaZjNqK3RRR0F1amNnZFptZVlQ?=
 =?utf-8?B?bEgvT2ovQ2R1RDlwclpFcTljOXZmVU5CUGc1Y01RS0ZLOVlSakpnenR6YXR6?=
 =?utf-8?B?Mjk2SUV0QjFURWFJQ2xLTExEYlhVRjZobkJFUXlsV1dXTWJoM2Q4Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e46271-81d0-4007-a364-08de4219ac53
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 11:51:56.9667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhtdJgCJ0a78kGwQMmJYh013LvqyUOVlbgYSbTO2kHfQcCG1aHq04qOvUE0krqhUVgfaJm55tI2mauDRi35yDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
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

--------------Nzuw5fe6hejtHbcNklsq9fuL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 22-12-2025 00:22, Raag Jadav wrote:
> On Tue, Dec 16, 2025 at 05:10:30PM +0530, Karthik Poosa wrote:
>> Expose individual VRAM temperature attributes.
>> Update Xe hwmon documentation for this entry.
>>
>> v2:
>>   - Avoid using default switch case for VRAM individual temperatures.
>>   - Append labels with vram number.
>>   - Update kernel version in Xe hwmon documentation.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++++++
>>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 47 ++++++++++++++++++-
>>   3 files changed, 72 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 51a35fcfb393..b58a96b1857d 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -284,3 +284,27 @@ Contact:	intel-xe@lists.freedesktop.org
>>   Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
>>   
>>   		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_input
> Brace around channel range with '[]'.
ok
>
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Individual VRAM temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_emergency
> Ditto.
>
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Individual VRAM shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_crit
> Ditto.
>
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Individual VRAM critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> index fb097607b86c..7c35e2605d2f 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> @@ -23,5 +23,7 @@
>>   #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>>   #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>> +#define BMG_VRAM_TEMPERATURE_N(n)		XE_REG(0x138260 + (n))
> Is this the correct ordering?
We can move this after BMG_VRAM_TEMPERATURE
>
>> +#define TEMP_MASK_VRAM_N			REG_GENMASK(31, 8)
> We usually have spacing for masks and bitfields. Please refer to
> xe_mchbar_regs.h.
>
>>   #endif /* _XE_PCODE_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index b8519c734b4e..8eb1dd8f4b2f 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -39,12 +39,16 @@ enum xe_hwmon_reg_operation {
>>   	REG_READ64,
>>   };
>>   
>> +#define MAX_VRAM_CHANNELS      (16)
>> +
>>   enum xe_hwmon_channel {
>>   	CHANNEL_CARD,
>>   	CHANNEL_PKG,
>>   	CHANNEL_VRAM,
>>   	CHANNEL_MCTRL,
>>   	CHANNEL_PCIE,
>> +	CHANNEL_VRAM_N,
>> +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
> Please consider the future prospects (or risks) of this approach. We're
> writing ourselves into a corner here, because now any new component will
> be id'ed after CHANNEL_VRAM_N_MAX and with that we can potentially hit
> scaling problem with MAX_VRAM_CHANNELS.
>
> I have already mentioned it once[1] but again, not my call.
>
> [1]https://lore.kernel.org/intel-xe/Z5SPWwiB15ptK4hR@black.fi.intel.com/

what is your suggestion here ? to have separate channel enum for each 
sensor type ?

>
>>   	CHANNEL_MAX,
>>   };
>>   
>> @@ -256,6 +260,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   				return BMG_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return BMG_VRAM_TEMPERATURE;
>> +			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
>> +				return BMG_VRAM_TEMPERATURE_N(((channel % CHANNEL_VRAM_N) * 4));
>>   		} else if (xe->info.platform == XE_DG2) {
>>   			if (channel == CHANNEL_PKG)
>>   				return PCU_CR_PACKAGE_TEMPERATURE;
>> @@ -715,6 +721,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   			   HWMON_T_MAX,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>> @@ -921,6 +943,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>>   		case CHANNEL_PCIE:
>>   			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> So this means we're exposing them all but do we really have 16 VRAMs?

we have support for maximum of 16, we don't have mechanism to detect 
VRAM if it is present,

we could check returned temperature is non-zero, but if temp is 0 C, it 
would be valid.

>
>> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>> +					       channel)) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> @@ -935,6 +960,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>>   		case CHANNEL_PCIE:
>>   			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> Ditto.
>
>> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>> +					       channel)) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> @@ -958,6 +986,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>>   		case CHANNEL_PCIE:
>>   			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> Ditto.
>
>> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>> +					       channel)) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> @@ -986,6 +1017,12 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			return get_mc_temp(hwmon, val);
>>   		case CHANNEL_PCIE:
>>   			return get_pcie_temp(hwmon, val);
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>> +			/* Temperature format here is S 31.23.8 */
> I'm not confident if this is translatable to human beings, could you
> please elaborate?

This is signed format, 31 bit for sign, 23 bits for whole number part 
and 8 bits for fraction.

I shall add a comment about this next revision.

>
>> +			*val = REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
>> +					     ((reg_val >> 31) ? -1 : 1) * MILLIDEGREE_PER_DEGREE;
>> +			break;
>>   		default:
>>   			*val = 0;
>>   			return -EOPNOTSUPP;
>> @@ -999,6 +1036,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			break;
>>   		case CHANNEL_VRAM:
>>   		case CHANNEL_MCTRL:
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		default:
>> @@ -1014,6 +1052,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			break;
>>   		case CHANNEL_VRAM:
>>   		case CHANNEL_MCTRL:
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		default:
>> @@ -1386,16 +1425,22 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			       enum hwmon_sensor_types type,
>>   			       u32 attr, int channel, const char **str)
>>   {
>> +	char temp[16] = {0};
>> +
>>   	switch (type) {
>>   	case hwmon_temp:
>>   		if (channel == CHANNEL_PKG)
>>   			*str = "pkg";
>>   		else if (channel == CHANNEL_VRAM)
>> -			*str = "vram";
>> +			*str = "vram_avg";
>>   		else if (channel == CHANNEL_MCTRL)
>>   			*str = "mctrl_avg";
>>   		else if (channel == CHANNEL_PCIE)
>>   			*str = "pcie";
>> +		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX) {
>> +			sprintf(temp, "vram_%d", (channel - CHANNEL_VRAM_N));
>> +			*str = temp;
> Can this be done without temp?
>
> Raag
I experimented with different methods; this one compiles without warnings.
Do you have any suggestions ?

>
>> +		}
>>   		return 0;
>>   	case hwmon_power:
>>   	case hwmon_energy:
>> -- 
>> 2.25.1
>>
--------------Nzuw5fe6hejtHbcNklsq9fuL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 22-12-2025 00:22, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aUhB3E2JyXQDY_kI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, Dec 16, 2025 at 05:10:30PM +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Expose individual VRAM temperature attributes.
Update Xe hwmon documentation for this entry.

v2:
 - Avoid using default switch case for VRAM individual temperatures.
 - Append labels with vram number.
 - Update kernel version in Xe hwmon documentation.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 47 ++++++++++++++++++-
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 51a35fcfb393..b58a96b1857d 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -284,3 +284,27 @@ Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
 Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp6-21_input
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Brace around channel range with '[]'.</pre>
    </blockquote>
    ok
    <blockquote type="cite" cite="mid:aUhB3E2JyXQDY_kI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+Date:		December 2025
+KernelVersion:	6.19
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Individual VRAM temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp6-21_emergency
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+Date:		December 2025
+KernelVersion:	6.19
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Individual VRAM shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp6-21_crit
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+Date:		December 2025
+KernelVersion:	6.19
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Individual VRAM critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index fb097607b86c..7c35e2605d2f 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -23,5 +23,7 @@
 #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
 #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
+#define BMG_VRAM_TEMPERATURE_N(n)		XE_REG(0x138260 + (n))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this the correct ordering?</pre>
    </blockquote>
    We can move this after&nbsp;<span style="white-space: pre-wrap">BMG_VRAM_TEMPERATURE</span>
    <blockquote type="cite" cite="mid:aUhB3E2JyXQDY_kI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#define TEMP_MASK_VRAM_N			REG_GENMASK(31, 8)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We usually have spacing for masks and bitfields. Please refer to
xe_mchbar_regs.h.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index b8519c734b4e..8eb1dd8f4b2f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -39,12 +39,16 @@ enum xe_hwmon_reg_operation {
 	REG_READ64,
 };
 
+#define MAX_VRAM_CHANNELS      (16)
+
 enum xe_hwmon_channel {
 	CHANNEL_CARD,
 	CHANNEL_PKG,
 	CHANNEL_VRAM,
 	CHANNEL_MCTRL,
 	CHANNEL_PCIE,
+	CHANNEL_VRAM_N,
+	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please consider the future prospects (or risks) of this approach. We're
writing ourselves into a corner here, because now any new component will
be id'ed after CHANNEL_VRAM_N_MAX and with that we can potentially hit
scaling problem with MAX_VRAM_CHANNELS.

I have already mentioned it once[1] but again, not my call.

[1] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/intel-xe/Z5SPWwiB15ptK4hR@black.fi.intel.com/">https://lore.kernel.org/intel-xe/Z5SPWwiB15ptK4hR@black.fi.intel.com/</a>
</pre>
    </blockquote>
    <p>what is your suggestion here ? to have separate channel enum for
      each sensor type ?&nbsp;</p>
    <blockquote type="cite" cite="mid:aUhB3E2JyXQDY_kI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	CHANNEL_MAX,
 };
 
@@ -256,6 +260,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
+			else if (channel &gt;= CHANNEL_VRAM_N &amp;&amp; channel &lt;= CHANNEL_VRAM_N_MAX)
+				return BMG_VRAM_TEMPERATURE_N(((channel % CHANNEL_VRAM_N) * 4));
 		} else if (xe-&gt;info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
 				return PCU_CR_PACKAGE_TEMPERATURE;
@@ -715,6 +721,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 			   HWMON_T_MAX,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
 			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
@@ -921,6 +943,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return (!get_mc_temp(hwmon, &amp;val)) ? 0444 : 0;
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &amp;val)) ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So this means we're exposing them all but do we really have 16 VRAMs?</pre>
    </blockquote>
    <p>we have support for maximum of 16, we don't have mechanism to
      detect VRAM if it is present,&nbsp;</p>
    <p>we could check returned temperature is non-zero, but if temp is 0
      C, it would be valid.</p>
    <blockquote type="cite" cite="mid:aUhB3E2JyXQDY_kI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+					       channel)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -935,6 +960,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return (!get_mc_temp(hwmon, &amp;val)) ? 0444 : 0;
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &amp;val)) ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+					       channel)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -958,6 +986,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return (!get_mc_temp(hwmon, &amp;val)) ? 0444 : 0;
 		case CHANNEL_PCIE:
 			return (!get_pcie_temp(hwmon, &amp;val)) ? 0444 : 0;
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
+					       channel)) ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -986,6 +1017,12 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			return get_mc_temp(hwmon, val);
 		case CHANNEL_PCIE:
 			return get_pcie_temp(hwmon, val);
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
+			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+			/* Temperature format here is S 31.23.8 */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm not confident if this is translatable to human beings, could you
please elaborate?</pre>
    </blockquote>
    <p>This is signed format, 31 bit for sign, 23 bits for whole number
      part and 8 bits for fraction.</p>
    <p>I shall add a comment about this next revision.</p>
    <blockquote type="cite" cite="mid:aUhB3E2JyXQDY_kI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			*val = REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
+					     ((reg_val &gt;&gt; 31) ? -1 : 1) * MILLIDEGREE_PER_DEGREE;
+			break;
 		default:
 			*val = 0;
 			return -EOPNOTSUPP;
@@ -999,6 +1036,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			break;
 		case CHANNEL_VRAM:
 		case CHANNEL_MCTRL:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
@@ -1014,6 +1052,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			break;
 		case CHANNEL_VRAM:
 		case CHANNEL_MCTRL:
+		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
@@ -1386,16 +1425,22 @@ static int xe_hwmon_read_label(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
 {
+	char temp[16] = {0};
+
 	switch (type) {
 	case hwmon_temp:
 		if (channel == CHANNEL_PKG)
 			*str = &quot;pkg&quot;;
 		else if (channel == CHANNEL_VRAM)
-			*str = &quot;vram&quot;;
+			*str = &quot;vram_avg&quot;;
 		else if (channel == CHANNEL_MCTRL)
 			*str = &quot;mctrl_avg&quot;;
 		else if (channel == CHANNEL_PCIE)
 			*str = &quot;pcie&quot;;
+		else if (channel &gt;= CHANNEL_VRAM_N &amp;&amp; channel &lt;= CHANNEL_VRAM_N_MAX) {
+			sprintf(temp, &quot;vram_%d&quot;, (channel - CHANNEL_VRAM_N));
+			*str = temp;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can this be done without temp?

Raag</pre>
    </blockquote>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I
      experimented with different methods; this one compiles without
      warnings.
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
        <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
          <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Do
            you have any suggestions ?</div>
        </div>
      </div>
    </div>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <blockquote type="cite" cite="mid:aUhB3E2JyXQDY_kI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		}
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Nzuw5fe6hejtHbcNklsq9fuL--
