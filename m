Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D38ED172DA
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 06:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D35210E034;
	Mon,  2 Feb 2026 06:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlxmkLgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD61910E034
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 06:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770013683; x=1801549683;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HOF4lrsStlxa1SbFLBTfJL8oAFTqYJEjtlOXBAZXtSg=;
 b=SlxmkLggRJzCsTzBqh52WzQ0CWCEIegTyn63oolPmeEPnkbJ9ric/zX9
 D4FU95rueyzxtAuhgTvrDAtM2sp9j1Gi6O4HZb6rY5ZL8b51FKEqdhrYN
 Oq5MVik1D9Bkk9+73K8NUpT7Eb0FzNyXGmGaLCj9vBzVWyfQn9PATBNn3
 dNQ5gsNU1NeD2L8vtoUucyQE4v6jMvYmojZTGr8HlLWJEBMlk/Xvcr4YI
 j3MdRy0s4bANp1wZKbz05jxTDk/N0v0x0k1W0q4q+5XRlKwLJborWq+sk
 SNuMGl/8/QPFn4EEKb/f8nhmSmw1xb19OYXSjsb2cLJzWyTjtY5Mj9TOS A==;
X-CSE-ConnectionGUID: pghyzApGRXyMFEs8b9r4ag==
X-CSE-MsgGUID: 2/QDZYTcSaOLF1wREpNvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71223019"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71223019"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:28:02 -0800
X-CSE-ConnectionGUID: uMTL28K9TNmrRr6yx7+ecQ==
X-CSE-MsgGUID: 8opb22z9RkKKAUC/n2A8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209434934"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:28:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 22:28:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 22:28:01 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 22:28:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cn9se4QKfdrNNsxMWF1qklyG+LvNKA1F0+Ns30VvW3aJSm7+kcTwD2NlDsmazNluuJ5mgwGbGYJUhH8B74KsxgmGPN6IDnhXQk847H6yaNn26JWAadG5XMwwbQgn7v0Kzjdo5f3O4U6FC3sIuiAaW+DbLCvgj7t8/1CKnWbkPWjHqk7apAeb/by0mI995fk0XAzFPqJZ7Wga8ArTu/JIYZoHbBsgDvYmb1N5knr3TlJjWKsomkHSKBFVi/dVzD5H9Q+oVeOxXnRGqzGGKcQcD25vYmmC05qE3yYw62dqTkZnxFTUVaxjP4k/QedgG/2QL0rc7jW9Cn2FFzDMFlAIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6c3uf/F80AM19KVXkRjL6V7rBsWtW7u3T795r2E5dg=;
 b=UqgrlqLn0RRuNlrbZzrs2udQoevjz2ILD/gOO0ITFzIx32SeeLGJ+OJlz4Q/Rv7OVEgoatwx6a3W6QRuOx9nEGGhnR+2uGGSupyeeBzpBOlppG8tDRNi9q4/VPFAIJVJV0x2Kp/bUr9GpZFGDfxPUhve58B27dqKMaoFBQkLp0wvUne+wcRTVAuXmnXq7IFloHcSGAh9lk08Blho7iKd80Fc8pjD/bl7NqMpS2C9wl2T7hwSIr6SmNsPz1yIA4DZ2SIBVewmSslvRJjRmoBqNRKHOo9ZN1ixqXlVegFSxCsEPiUZBcDaAmcyLsFC9CHHNqu/X1uQM9auVtgkK5odDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 06:28:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 06:27:59 +0000
Message-ID: <169ac4ca-f6ac-4af0-940f-545a0cff6e79@intel.com>
Date: Mon, 2 Feb 2026 11:57:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20260128022320.1054591-1-vinay.belgaumkar@intel.com>
 <20260128022320.1054591-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260128022320.1054591-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0245.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: c8977108-c180-4627-3db5-08de622435ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnNRK05TSllNc3ZMWTNaT1h4Sm50djhYL1VVcWZ5V2F4aVY4OFIwbG1xUW92?=
 =?utf-8?B?MFRrTFAxKzBRM29ibUpsOXFadVptYnp3ZGkrYkh6dFFkWUlUNTVBR0g1citM?=
 =?utf-8?B?RVZ3NnNhZ3VDZVdoWGZqaUxKL2FwZGltNUVSMkttbDdqeUlZdDNhS2w2Qm9O?=
 =?utf-8?B?RTl0OVdaVkpTSW5oM290d2s4WG5kUDhaMG4xUm1DUWlrcUJMYytUdmt2ZStx?=
 =?utf-8?B?V0lmeXl3dWpWT3NSTWFMcU9OK3Y4ZHRqN3NTWGxOSFFZQjJSZ1o2YUdRdnZD?=
 =?utf-8?B?M0g0TEVLSG8rK3p2U0NLK0RabGEzckpyd2pTbFlMbVk3R3RidG16c2ZpMTNm?=
 =?utf-8?B?cWN3YTZ6dWwwd2xQa3VQM0k1ZWJUL2FkazlwKzRJbmMwTkdDeCtaUVlvY2ZB?=
 =?utf-8?B?OW5wK0dhNHVBc3lnckFSZDMrT0NtZTJiZmk4ZEtjQlU3UHl3Nm95WE53SWp3?=
 =?utf-8?B?MExuY1ZTWWxXSlpNbFB1cW9VdHVQckxWNmg3d0J2a1oxNGVEeks0SEV5R0FY?=
 =?utf-8?B?T0lvUUszSCs4ODIwUmRvWHpHdlRvclZzeUp1NTNUYzdvMUlqb05rVGdHS21N?=
 =?utf-8?B?cXJRaC9KUk9FOFhMdlVKejQ5WEdKOGhBYy9WQ0hENERSc2wyTDNYaGJ3L0gw?=
 =?utf-8?B?SzdIbDRHdEhadXlxcmdBeUUyd0dvRXlacytLYUFoWWE2cVFJMmJzL0ZuU1Bh?=
 =?utf-8?B?Nk9EKzhaeUdiTUFrZ0xRMHFzcDZkNlJSaGtlMHgzZm0vekRyLzcwWjRXODY0?=
 =?utf-8?B?b2RydEcxZVVOR04wUHB6aHllQitVRVFNZUFRNUwzOE1OcXFxWHdmbU9LMHlC?=
 =?utf-8?B?TXl4bXgxeWVxOXMvN1Y2V2RuMTg1Zkw5dFlxaDFqR1FEa2lqSzJ4VDhGcUd0?=
 =?utf-8?B?d1J2Y05UM2F0Sm8zOEJHdVE5NEJrM0grcWI2TTlSRHY0SHNHTy9GanhrenJ0?=
 =?utf-8?B?Mk92QjQwMkM5VkZGT2xlTXlBVjB6czJIVzBxMGdZMDlaOGdIVHVDbFB0dHJi?=
 =?utf-8?B?T2JkbDlqL3lLWUQwb3UvVnNWMld5T0FYQ25YcjBpbFcxRU1nL1Rjd04yMmlq?=
 =?utf-8?B?QXZIZzlzTDB3NUJxU2UweTdaeW44L0d0a3hOVVJtWDNVNFBTbGRCUWZjQmZl?=
 =?utf-8?B?WklKYzNRb0Ywd293NE1WcmxMa0VYZzdIR24yS3BQK2VJUFlsTUFya2J3bFFE?=
 =?utf-8?B?eFRIblJiQ0NwcDc1dStiY0VVRUQydUMzQVNLeVN1ejB4MzFCdmJGa3pDZUw3?=
 =?utf-8?B?ZzJ4UjZqVHkyS2NURFcwK3dBejBIcWRMbjg1c2dmL1lwT2JPRDFkNVFUMTJr?=
 =?utf-8?B?R1U1V3ErbzhDbnVYRVl3VTRHRm01dzVRL2pYSUp0ODhVNitES2hKZEVENmNT?=
 =?utf-8?B?RzRqVW9GN2lkTW8vUmFRU2E0eGw5VjdOTSs5SU1IT1BPeTRvcVJ1TzlsenVU?=
 =?utf-8?B?dWxOQUxPYTZNTThvSmcwSWpRWEY5cmZrYVM5aWxWOXZ6R1B4NHVOQmxwQzg5?=
 =?utf-8?B?aWxXdlI0WDF1SXlnUitpWmkxdzkxR2RRNEZWL3plU1JLZmZiSElvS1Fsc3JW?=
 =?utf-8?B?SXV5ci9HV0NtSkJFbFFaZ0o3ZzdRR0huL0Y3SGo2ckNtNDY5MUYzTkh0bXdY?=
 =?utf-8?B?U1F5MkFXQXVDaHdwMzNMcVFpaGtYQjcyRXluTXYzNFRraTdja3U0NEpsUnZB?=
 =?utf-8?B?THJScDZLUUc1NXpRS2NQUFVUaW5qMGpMY0Yvd2llMm44c1F2Y0pvUlJJMWEv?=
 =?utf-8?B?MVlQQ0lWdGlhNmhjTU9WYmROK1JtOGtHN1BWcUF4L24rZmpsRktqM0w5eW4z?=
 =?utf-8?B?dGUzSFN6cjgvTjZhVmkyWkdiaHpvbE1rN3JOcndoeHBDNTZjUjVscENJMXpM?=
 =?utf-8?B?NWZjMk1VN1NzZDZuS05VQ09hSk8rTUQ5L2p0V3BYR2VGT2xEcGNjUWdRNDln?=
 =?utf-8?B?TEVCQzIyVS9Eb1FLcFNoK2xVNkVLb0M3TlFJYkJtV1B3b0dpZHBhNXBtdHBr?=
 =?utf-8?B?TFI5dnpMdlAvUGxtYVpycStEaTkyZkdFV0tSckpTWisrQzBHN1pWVjE5NVVU?=
 =?utf-8?B?akc4d3NtaldhaGZTT01uV0M2S3U0NlMxWHBUc0RLaVh6aFcvTHZSYkVzZDdn?=
 =?utf-8?Q?Az2A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V056VGx4M2dydTAwQXhyeWx4Vzl3cnR5S2h0Qis3eVZ5VjRvWWRlTENZWEo4?=
 =?utf-8?B?YTRmRGtCRWhMaUJkMzUwdXR1Nld4MWJieFZjL3RxUTJ1UloyOHdDbEFTQmYy?=
 =?utf-8?B?SUlmVTZWMktCK1hzM084bEl5YnZwOGZWQk5semFvWFczRndIZE1KQXA4UEE3?=
 =?utf-8?B?MFVhM3FUa3JLeUtmL1B3czdqdnlzeHVlZStkUVJhMW9zdFJqUmg4a0tlT2xK?=
 =?utf-8?B?WTF4UittdGRCQ1JBQ01iVUlPQmFkYWxOb0dIQnlQVXR6cStLdFBRZ1N0MjA2?=
 =?utf-8?B?TFRLNjdoeXlpeDkvcTVLWFZpbnZvcGlGVlFOaHF2STlPd2pIQkNIdzUrbUtn?=
 =?utf-8?B?alpmRkpxaVJ5UW1NNmU2SGpPdmprSHVVd1lXaFV0R0lPWFAyNHM0QmZyYmVq?=
 =?utf-8?B?RFdweXdnQjJqdm56Q2hzbGNsYmpJTW5ydnpLY2oxUllqNEtrODFaRy95WFdE?=
 =?utf-8?B?aitwOTQxd0VTTVEwMVFCUkpxQ2lWUGUwdDlFV3Y5MzJ1Rmx1TkZYYzhvSG5C?=
 =?utf-8?B?U0JMelc2R2t3a3dMSDhXRzdUUkVsNzE5T0FxTFd1ZlNWUGowcHZBaStiZGxy?=
 =?utf-8?B?OWl3Uzh4bVhLeVhDdEVVcGhhRkFOa05aMUYyWUl1S1hWWnNxRHhFM2lQY0s1?=
 =?utf-8?B?SXZTUmFjYU5xSkRLRElqS2t3WS8yUXdnNlNVRXpQTFZBWjBJT3N3dFFuRWwv?=
 =?utf-8?B?bllLaUV3Y1hVNDY4aHh3VjJqdWI1Q2tieWZQanZUa3EyZHUrZEJieGh0UWVO?=
 =?utf-8?B?elBBTC95UEdBOWpBSnBaL2VwcWpJWk1IYkwzR24wNkFkWFBnYmVqVzh3Kzk1?=
 =?utf-8?B?RnFBSXdQbG5mYWtXRGR4YWFSclVZeWFOUXpDSkQyT3gyS2VRVWRhQWxheTFr?=
 =?utf-8?B?WStJVUVTOFNuV0Z3R25qcXBQOUZHZFBMcjBvZUEzZGhaZEpCdWZWOW8wRHpp?=
 =?utf-8?B?YjZ5R3ZFdisvUmNYamlhZ0tqT3ZXV2hvdlJ1bjdna3dpYXZKUzJmUXdacnRI?=
 =?utf-8?B?NUZUQzZvSkZCOXpxeGFxV3E2Z1IyMGRROFkyQk1Ld0hRenRYSU5iTjFqRWJ5?=
 =?utf-8?B?TDdNWnlNcFlFbmtmdjNLaUROTG1uaXV2OG1rbHlOdnFJNE16aTJybTJhVXBT?=
 =?utf-8?B?OFQ5YkZmZjBETzc4ak1xVjNrOGFUWFZLOTBUTGFQcHNpNzdwMEFhczlMYnVU?=
 =?utf-8?B?SXMwWGdGWkJxRWNFdEdaZFRnd3VtTXZhR2taTkRHUXcycGZvRU0rNG0yRTFV?=
 =?utf-8?B?c3RqcHNmTTNWR1VWS0pLZjBYWXhZcFNEWStONWMzUjlWODZxTldjemxrRk5w?=
 =?utf-8?B?WVdESVVleFJzWEVtNjVKTXZ1SmhkdGVFcDdwK3h4Z3gyU0pBa0tkSXZmc2Uz?=
 =?utf-8?B?ZHpYbVh6OHVzdHVzdk5Zc2N5S21zVlZhcE9BWm95WmNpMldkUmRZOVNJR1pF?=
 =?utf-8?B?NGFrRXNxQkZOVnRVRk0zUmppZUdZUHZ0TktIeWZZOFlYOEpjYXdYdHJyTEJU?=
 =?utf-8?B?K2Y0eDc0amZFY0w0QUNVV1FPZXdNdEhPQzBiVUFOZG1NSjVONThxS0VJK0d5?=
 =?utf-8?B?My9IZnJnVVkyaEpnL3RyZklWZ1FTT0x0VjhRRkltVW9ob0Z5ejNrcGx2bmNa?=
 =?utf-8?B?bkNMbzJTYXlDVzc2cHNWQlRXTWU5UXNMNlVkU1VYYkxnWVZncklxRDkvb1RJ?=
 =?utf-8?B?aXZxR1pOa3hUYzh1OTgxckM2Mlpad3VwSzZIaml2d2FqYkd1cTNFZVdMMkhL?=
 =?utf-8?B?NDZ1TVBXaXVmT0J0eDJjQXFMTlIxc1NFU0EzRklUOTJ6WS9wNGh5Z1pma0hj?=
 =?utf-8?B?NHZtUW5XS0gwQ3lLNDlhcEtvMEZOdlNZdjY0eFZJYjdMbDVmYVB1V1prdHhm?=
 =?utf-8?B?UExhNEhCSjZEQUNoLzZLbEgyWXhTQkxyZ2J5YVBEdWlSbW5jaCt2Y3FTbW0z?=
 =?utf-8?B?STJLckVRZmI3OG96cmEzbmZzSE5KV3VOUEttdFRUeUQ2eUtFTm5BVmJSQ05P?=
 =?utf-8?B?c0lnUHpVSmdJTkNSczk1ODQzaldXTyt1NGlCTm5jczArV3J3bTJsK2puejJC?=
 =?utf-8?B?Q1JkSmVzVFlNbmpRWjlTYVJrQXRQdGNQNkUwM25Odi8yaXVTQXU5VGRBNGxS?=
 =?utf-8?B?c1ZJN0pGaG9MYkxaMkVRMmxIL1Z6WkJKSjZ5SzBobXduYWUreTVXTElSeER6?=
 =?utf-8?B?a3RGWmpoenkyYkFqV2pxdENVWnJRVVRLT3AzV0F3RnZYUW5SVFNmcElVOHdO?=
 =?utf-8?B?TEZPa3NHZGZXM0Fyb2IyVFF4Q2g3SGJKL3RGa3dWbnhJYStqRVdpZ2ZMV0pn?=
 =?utf-8?B?enBQeFpqSUw1aG9uajVISXVBYzdpRXNBR2dzY0QxUytnSXVoZGVmQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8977108-c180-4627-3db5-08de622435ce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 06:27:59.8349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RArp1Qo+4jkbDxcZCPL0PGVn0579jM3MI/ZDYIYNoQSRVtC5fVTV7vlf+a88a8Rq9ZRXtS9X8S3UntCLtqccJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
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



On 1/28/2026 7:53 AM, Vinay Belgaumkar wrote:
> Move enable/disable GuC RC logic into the new file. This will
> allow us to independently enable/disable GuC RC and not rely
> on SLPC related functions. GuC already provides separate H2G
> interfaces to setup GuC RC and SLPC.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
> v2: Comments (Michal W), remove duplicate c6_enable calls from
> xe_guc_pc.
> 
> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
> (Michal W)
> 
> v4: More comments (Michal W)
> 
> v5: Remove rc_init and use enable/disable (Riana)
> 
> v6: Link to kernel docs (Riana)
> 
> v7: Don't call devm_add_action_or_reset() in rc_enable (Michal W)
> ---
>   Documentation/gpu/xe/xe_firmware.rst |   3 +
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_gt.c           |   1 -
>   drivers/gpu/drm/xe/xe_guc.c          |   6 ++
>   drivers/gpu/drm/xe/xe_guc_pc.c       |  70 +++------------
>   drivers/gpu/drm/xe/xe_guc_pc.h       |   1 -
>   drivers/gpu/drm/xe/xe_guc_rc.c       | 129 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_rc.h       |  15 ++++
>   drivers/gpu/drm/xe/xe_uc.c           |  10 +--
>   drivers/gpu/drm/xe/xe_uc.h           |   1 -
>   10 files changed, 172 insertions(+), 65 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
> 
> diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
> index 5d23e9f27391..9c15a300bc62 100644
> --- a/Documentation/gpu/xe/xe_firmware.rst
> +++ b/Documentation/gpu/xe/xe_firmware.rst
> @@ -31,6 +31,9 @@ GuC Power Conservation (PC)
>   .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
>      :doc: GuC Power Conservation (PC)
>   
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_rc.c
> +   :doc: GuC Render C-states (GuC RC)
> +
>   PCIe Gen5 Limitations
>   =====================
>   
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 51a9a531fb7e..41ec698b3cc1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>   	xe_guc_log.o \
>   	xe_guc_pagefault.o \
>   	xe_guc_pc.o \
> +	xe_guc_rc.o \
>   	xe_guc_submit.o \
>   	xe_guc_tlb_inval.o \
>   	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9d090d0f2438..c8a1d44bbf3a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -852,7 +852,6 @@ static void gt_reset_worker(struct work_struct *w)
>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>   		xe_gt_sriov_pf_stop_prepare(gt);
>   
> -	xe_uc_gucrc_disable(&gt->uc);
>   	xe_uc_stop_prepare(&gt->uc);
>   	xe_pagefault_reset(gt_to_xe(gt), gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2efc4678fa73..dc198d499da3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>   #include "xe_guc_klv_helpers.h"
>   #include "xe_guc_log.h"
>   #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_guc_relay.h"
>   #include "xe_guc_submit.h"
>   #include "xe_memirq.h"
> @@ -880,6 +881,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   	if (ret)
>   		return ret;
>   
> +	ret = xe_guc_rc_init(guc);
> +	if (ret)
> +		return ret;
> +
>   	ret = xe_guc_engine_activity_init(guc);
>   	if (ret)
>   		return ret;
> @@ -1620,6 +1625,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>   	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>   		int err;
>   
> +		xe_guc_rc_disable(guc);
>   		err = xe_guc_pc_stop(&guc->pc);
>   		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
>   			   ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 5e5495a39a3c..878eb273c3e6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -92,6 +92,17 @@
>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>    * all platforms.
>    *
> + * Implementation details:
> + * -----------------------
> + * The implementation for GuC Power Management features is split as follows:
> + *
> + * xe_guc_rc:  Logic for handling GuC RC
> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
> + * xe_guc_pc:  Logic for all other SLPC related features
> + *
> + * There is some cross interaction between these where host C6 will need to be
> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is currently
> + * overridden through 0x3003 which is an SLPC H2G call.
>    */
>   
>   static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
> @@ -253,22 +264,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>   	return ret;
>   }
>   
> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> -{
> -	struct xe_guc_ct *ct = pc_to_ct(pc);
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> -		mode,
> -	};
> -	int ret;
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> -			  mode, ERR_PTR(ret));
> -	return ret;
> -}
> -
>   static u32 decode_freq(u32 raw)
>   {
>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> -/**
> - * xe_guc_pc_gucrc_disable - Disable GuC RC
> - * @pc: Xe_GuC_PC instance
> - *
> - * Disables GuC RC by taking control of RC6 back from GuC.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe = pc_to_xe(pc);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret = 0;
> -
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
> -	if (ret)
> -		return ret;
> -
> -	return xe_gt_idle_disable_c6(gt);
> -}
> -
>   /**
>    * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>    * @pc: Xe_GuC_PC instance
> @@ -1247,9 +1218,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   		return -ETIMEDOUT;
>   
>   	if (xe->info.skip_guc_pc) {
> -		if (xe->info.platform != XE_PVC)
> -			xe_gt_idle_enable_c6(gt);
> -
>   		/* Request max possible since dynamic freq mgmt is not enabled */
>   		pc_set_cur_freq(pc, UINT_MAX);
>   		return 0;
> @@ -1291,15 +1259,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		return ret;
>   
> -	if (xe->info.platform == XE_PVC) {
> -		xe_guc_pc_gucrc_disable(pc);
> -		return 0;
> -	}
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> -	if (ret)
> -		return ret;
> -
>   	/* Enable SLPC Optimized Strategy for compute */
>   	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>   
> @@ -1319,10 +1278,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>   {
>   	struct xe_device *xe = pc_to_xe(pc);
>   
> -	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +	if (xe->info.skip_guc_pc)
>   		return 0;
> -	}
>   
>   	mutex_lock(&pc->freq_lock);
>   	pc->freq_ready = false;
> @@ -1343,8 +1300,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>   	if (xe_device_wedged(xe))
>   		return;
>   
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_gucrc_disable(pc);
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>   
>   	/* Bind requested freq to mert_freq_cap before unload */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..1b95873b262e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> new file mode 100644
> index 000000000000..55eeee7b1011
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_slpc_abi.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_rc.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: GuC RC (Render C-states)
> + *
> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
> + * GuC RC can be enabled independently of the frequency component in SLPC,
> + * which is also controlled by GuC.
> + *
> + * This file will contain all H2G related logic for handling Render C-states.
> + * There are some calls to xe_gt_idle, where we enable host C6 when GuC RC is
> + * skipped. GuC RC is mostly independent of xe_guc_pc with the exception of
> + * functions that override the mode for which we have to rely on the SLPC H2G
> + * calls.
> + */
> +
> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
> +{
> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
> +		xe_gt_err(guc_to_gt(guc),
> +			  "GuC RC setup %s(%u) failed (%pe)\n",
> +			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
> +			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
> +			   "UNKNOWN", control, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_rc_disable() - Disable GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + */
> +void xe_guc_rc_disable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	if (!xe->info.skip_guc_pc && xe->info.platform != XE_PVC)
> +		if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
> +			return;
> +
> +	xe_gt_WARN_ON(guc_to_gt(guc), xe_gt_idle_disable_c6(guc_to_gt(guc)));
> +}
> +
> +static void xe_guc_rc_fini_hw(void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	xe_guc_rc_disable(guc);
> +}
> +
> +/**
> + * xe_guc_rc_init() - Init GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Add callback action for GuC RC
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_init(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
> +}
> +
> +/**
> + * xe_guc_rc_enable() - Enable GuC RC feature if applicable
> + * @guc: Xe GuC instance
> + *
> + * Enables GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_enable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +		return -ETIMEDOUT;
> +
> +	if (xe->info.platform == XE_PVC) {
> +		xe_guc_rc_disable(guc);
> +		return 0;
> +	}
> +
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_enable_c6(gt);
> +		return 0;
> +	}
> +
> +	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> new file mode 100644
> index 000000000000..35fabb82cb0e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_RC_H_
> +#define _XE_GUC_RC_H_
> +
> +struct xe_guc;
> +
> +int xe_guc_rc_init(struct xe_guc *guc);
> +void xe_guc_rc_disable(struct xe_guc *guc);
> +int xe_guc_rc_enable(struct xe_guc *guc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3f63c2a7e86d..d9aa845a308d 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_guc_engine_activity.h"
>   #include "xe_huc.h"
>   #include "xe_sriov.h"
> @@ -214,6 +215,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>   	if (ret)
>   		goto err_out;
>   
> +	ret = xe_guc_rc_enable(&uc->guc);
> +	if (ret)
> +		goto err_out;
> +
>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>   
>   	/* We don't fail the driver load if HuC fails to auth */
> @@ -242,11 +247,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>   	return xe_guc_reset_prepare(&uc->guc);
>   }
>   
> -void xe_uc_gucrc_disable(struct xe_uc *uc)
> -{
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> -}
> -
>   void xe_uc_stop_prepare(struct xe_uc *uc)
>   {
>   	xe_gsc_stop_prepare(&uc->gsc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 5398da1a8097..255a54a8f876 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
>   int xe_uc_init(struct xe_uc *uc);
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
> -void xe_uc_gucrc_disable(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
>   void xe_uc_runtime_resume(struct xe_uc *uc);
>   void xe_uc_runtime_suspend(struct xe_uc *uc);

