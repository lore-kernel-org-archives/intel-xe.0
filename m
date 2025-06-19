Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED15C71159
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 05:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338C210E997;
	Thu, 19 Jun 2025 05:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/p01qZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8691D10E997
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 05:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750311121; x=1781847121;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GjJ+LgHC+/C54gKgtNbmjaJj937HAwBg3cIup4sD4Zs=;
 b=G/p01qZIH7fBCSGPCT4bFcb54eOVym67d7Wf9S35FR/bE7KiqsEFDVNt
 +yg/4H/CeUxuSBIsKHgZiviwIWj29/sOUQg2RPOrV3CuynW5bQ29EO7Sb
 Fb+HuBxC7/nvM82dd1/9PuAonZxNWhHCl2k2+F5ZUi3aCOrVSGl4GfcIg
 a1/Jgf1NzFE12nt1o80Zxwpa1DvrdW4/tu1o9HJGXEHvXh5yyr/vDjWsY
 WOnYLS9KKCczWaoARhYFT/A87w4L56mbN4Vz+FfU5v/nwjxnQHYg7+tqf
 wBH8OBxxibVh3y6MwlZTxfTL2K+oCe9qAEyplnpTWVriM4d+z646n5bvn A==;
X-CSE-ConnectionGUID: s6ge1N6+SDqtqHGGzTb9iw==
X-CSE-MsgGUID: 1d46MF9AQT6QJrrQedHqtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51785657"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="51785657"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:32:00 -0700
X-CSE-ConnectionGUID: +XTt9s5QTjCEKQ+75FCD1A==
X-CSE-MsgGUID: vkKm+iC9QVmlkArLmoSzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="151114852"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:32:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:31:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:31:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:31:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5wyu790u4PFw3PVkL1CRKXTbf0fxujynk9Jc97MLDh53HadvFi0jFvpGZeOT17P3arBGk3YZTLaq8TCf0iZ5W2VHnsebmLdQu2RRNTS9DY6WgFIAzPQTsma85tjWOxaCJuj5vqmrTtvdZFMDDrrZfPk9F+s4dbBAmcIGbas6nqpTcFqg8onftxcxfMiE8RaDtQ3LRvxM8OYtnm4b28tdy+ewzAzk9cKkP0A53li71Bh23HKrNVJHy03HZ9MNKLCaZln8gtur14XZJGhE15yms5ghBfg0Ka+BPf+7+zwrnT2pYw426AUdskhPckJCLDxGgCqqnf0TLLcqx7BObRF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPy4kRBWt9JWJtETdIWDb+Pn8zVPQWuMofRuq3cM5D4=;
 b=gOjt/IX7MGVMPrL1hEJCdkTiebapb20aj/JCtZyvZEOsVGQ9zrMl+vsYli1IUxh9RMJB4a6dECP1u/XcwNXnRpePz7bhp7I4BJd+uY7DvM+b0yhquTFDd9iQZk/gAFB7fchvSTlRnx1+T+OhcQFrk4+mkx5N2RLuQVCO0pkblSyGm3vQvE83P+EpD2vnVWia2uka2WixMsQbYO4I1lrl96Qn8+sl92RP9obRHerY3DiH5B7JWLb0HHfq3yi101SthsMCVp9OSXnwLAUUbOq9AMqoS058NBf6GakIJhc3/A8Rzjrc4X5UiDjRI5G0SIwcx8Zu449WNQcYltw9QRrFzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 05:31:55 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 05:31:55 +0000
Message-ID: <5f982dc6-485f-4c84-97fd-c2118284c91a@intel.com>
Date: Thu, 19 Jun 2025 11:01:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ptl: Apply Wa_16026007364
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <karthik.poosa@intel.com>,
 <riana.tauro@intel.com>
References: <20250619051057.206253-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250619051057.206253-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 41506fc3-6b26-4bd8-482b-08ddaef29a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aktYK1hVRGtpbGlvK2tWQ2tVQkpHUlpvZjIvMXFzREp6Um5lYU9wekhnZ0tS?=
 =?utf-8?B?alpPVjZld3ZxVm9mR2dhTjdSTW1PRU9IRUd2RUFMRndWaTVVcm9MVUIrQ09v?=
 =?utf-8?B?cmRsUXdTS05UTUt4SmlFY3haUmVHVFdlY3gxYUxlejhLRkJxTC85RUx4Yjlw?=
 =?utf-8?B?dnNCZy9mK09ZdS9MamJHdjY1cmIwMkdLYVZtRTVDTlFDRnFHNVVZaWdHOXNC?=
 =?utf-8?B?ZUxOMzl5S3Q2ek5na1lFZXRMeDRURmlROEpSNWVHM3JNNWZvRCtSUjlaLy9G?=
 =?utf-8?B?c3pjeitIY25NRzVPN3B5eC9CRFQ4SzJ4TGxoR3VodFlkNTNYNU9QdTg5d0JT?=
 =?utf-8?B?YlM3bEgrampGS2Ixc0tiMzZzd0dQeTRnNEVnemtiVjhTeTRxNVc3VGJ6aEpZ?=
 =?utf-8?B?MUtlaWpxeGoxdnR3a1E3UnJ4ZEJqdkcvUmlSclBpcmh4a2hqZ3gyZGNCZEk2?=
 =?utf-8?B?WktJSHdpNFpYY0FZc2kwc3FqNUsrQUZROXBkZ1lDT3hBWjJuUmdUQjhpTU9o?=
 =?utf-8?B?UXpIMUpkcTByRlNacWFZWGVKMHdZeDF5TGlIVXBIRE5PUDJndTdBcFFFK2FU?=
 =?utf-8?B?RGJQOUpleEtJcW52Nk5IYnpQL3dnekNycnBjRFV1ZThCVnUyVHZHUzJhajBB?=
 =?utf-8?B?enBadDllWERoY3BSb0hFQnd3OHBVV2NnM0x1UkNCc3ptcUtuMTNOZGUrYXg2?=
 =?utf-8?B?ZHB0cjAwRllkc2RMcE9PdXNaam55VGlhTnF5aVJtMVJJSVdaWCtKbmkxY3Vm?=
 =?utf-8?B?ZlNBeVdIeGw4TDhxZUdjcUZxWW5seG12YTFJMzA4OVdkTGxyK245SXBEYlZm?=
 =?utf-8?B?OWZTdzRhUmhIcS9JaHNNNWNLUGxXRUcvZkVsV1lPcSt2cEMxcDMrcTVONEVL?=
 =?utf-8?B?YThmM3hpa0FpQnNOcURSYk5QNGNvOCtDZWRKYTZZeUZQOUJxbkxONk9VRGx0?=
 =?utf-8?B?Y0FPaDhPZjg3UGN2V2dGdktOR2xRQXNxdkFOL3NlU0RVU2oxcEhKeEI2N2pY?=
 =?utf-8?B?WTVuRkZaTXhHeko1UzYwZVp0Y2JWUC92N3N5OUt3MVBTUzNKV1ZvRTU0cW4w?=
 =?utf-8?B?Sm95TXR0RVIwaVdVLzVzUGJDQXhRdE5vYlZVTUVtNnNDOUxQRXpEZFJlK014?=
 =?utf-8?B?aGNwcWMyOStzYzBnMzlmdTlyWWc4TVlpeHBmRDI5M1ZOUHVDdVh1YzVoLzVm?=
 =?utf-8?B?RlRKektDUWIwdjdyQmlBaVAybm11TzdkTjlUc1MyNnR2OWdsVTJzeDhkMVdE?=
 =?utf-8?B?MG5yVG1ScG5QdTlmWnp5dUE0Znd5M3V6OEpUVHZONUgyc1J4dEdyYXR3NmR6?=
 =?utf-8?B?VlJCSWZsWE1HcG16Z04reU9RdElrTU5WcnJ3eTlvaGNGWEs3cFc5cFgwaDBx?=
 =?utf-8?B?MVJNTzQzK0lwdFlQMGlrM01Yb1hiTUFsTUI1UTJzY3NhSC9JcjNhRll5OERm?=
 =?utf-8?B?Q2pHMUkrOVNwaW9vMTd6eXdmaDNYUml3Nmg3MGpZSzUzZ2IvM0JSKy80MnFK?=
 =?utf-8?B?bjRqTzdVbk1QR0dWUkJRNTJweUtOSG03M2pKdUV2MlZRT2lxNGdWVTBJMko0?=
 =?utf-8?B?YkNQUmlDaGhLM2NKZmhMU21IRTdWT0hhVjh1TFRBVWVqWnpWVS83OXNIODRz?=
 =?utf-8?B?UGlRZVpHeEVjKzY5YnVkbHErRHFRWnVyODRMTklUMXRMc042aDRPYTJ1Slla?=
 =?utf-8?B?ME9mdCtQMlJnL2g4UzBEaTc5K3pkSHE0eUw3aGcrR2hVUEZ1K04vMVhHazcr?=
 =?utf-8?B?V0U0V1RjQW9EbjR1cGRac2cvK0FndXdZRm16ek9icUM1NlVVelN4eHFFalNw?=
 =?utf-8?B?bmVIL3QvcE5sOER4ZkdFYllJYlRtYXhFTmhqUGpuNWNqSnQ4dTIrM01STDl3?=
 =?utf-8?B?aW9CWE9XWC82MEI3NG1uNFNMcGcwTzcralFjTEhwejQ0cUI5a0VCVjlzbFla?=
 =?utf-8?Q?Or6PeONU4/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDQrZmhsZXI5cGZRSDY3UGMrZE00cWZoNUhwOTg3LzNvZWlLeXg4UUk3NVI2?=
 =?utf-8?B?cjRzWC9na2RudFZhb2IvcnJ5MzZEaUd2UmNYL04rVktHNnJDWGVjbkpMYm1E?=
 =?utf-8?B?NythL0JQQVdSZnhuL3l4Qm5SRkFGTm12S3VLd0pqZGEva3pSOVpCRDdYNm1t?=
 =?utf-8?B?UDdzWFIrYVFDR3doUXhIa1RBRkFKUzBVZWs0Wkl3ZC9JSHhOL0x1UG5WWTJI?=
 =?utf-8?B?SmxpSFl5R3llUEluaHEvbW90OS92YlEwSE5pUko0UWVEUDZaMXM4Skx3SHNI?=
 =?utf-8?B?U1Yzek0xczFrcEZVNW9IeEdxUnFNbVJzclhmTWI0SWNCYno5dTVMNVlBTStt?=
 =?utf-8?B?d3poemdJOExNVTNkTGJZcGtsWHVEWDI4Tnd3dUlad2hoVnhCa1grVFVKRjVm?=
 =?utf-8?B?UldUYnltSG5QaGFjak5Za3NLYWVWN1dHVWk4d2ZIckRXYWNyRTg1WUxqdlJi?=
 =?utf-8?B?R3psd0R3N0M5NllnaHptYy9qYlR6Q3dVbTZDSXVLaHdKZ0dCWklDY3Z5L0Y3?=
 =?utf-8?B?WlFBQlE1QS8yY29KQ3ZIZ1dFY1BjOFcxS3VGSVQyY01RdmYyWDhKYUNpS09M?=
 =?utf-8?B?TG41dmRNZ3Jvc0srdUp0MkNOTG5FMEQxYXN5am1XWjkxMkF3QnJmUjlQKzZo?=
 =?utf-8?B?VTVyTmoyUHhoVHRxMzlaQ2laakg1Z3k0aFpwbXdvN3V0dTFCamVaRGdRZzJn?=
 =?utf-8?B?YXVpU0JPVUo3RUhDdnhpNGlrOWZDOXhOU05GTElEZGJpdlVxaG5IdkpGakwr?=
 =?utf-8?B?ckFYQ0hGZkxWVEZDWWVscUsxTEpZSVlVeURFK0lpb0NyNTBtdmFTdCtTalJD?=
 =?utf-8?B?RjFVeWZ2SzViVXRpTVdBQXVlS3NuK1BZUTZ4Y093WXorTnhMcW93amQxc0JU?=
 =?utf-8?B?VXlIcEJXQlRPd3JhUFM1SmV0aDdXR01zNUJkZXE5eEIyemJLY3JlVEJtcXlq?=
 =?utf-8?B?ZlVHLzVnSmFHODQyTXFsako1V21kOENmNFhRNVYvM1JrK2o1TFhzWVRKa2gr?=
 =?utf-8?B?VW1JT2lXanVsWm4xcGd2Rm1VbE05aTFmM3YyclN5elM0Y01IMVhINjNaV2sw?=
 =?utf-8?B?ZGJ0YktsSTJobEI5ZWhKcENWbG5VQ01RWUZKRjFjM0J6UXhqWnRkb2h2Z0t0?=
 =?utf-8?B?bWs2TEJQMFdTeSs2RmpmTUFUY0VTZHJpYThGL1g0REI3K3lHblI5Q3d4TFRl?=
 =?utf-8?B?N01tMHdnUmdRclh4Tk5RZ1VvTWc5STh0S0tlU3UxRmE4bjBlTkhxV2RnazNx?=
 =?utf-8?B?TDVkcTBNd2tRQmZzM1AzTlhtK1VYenhOUW9hK1QwaG1BeWdRWHBDU21GdFlm?=
 =?utf-8?B?UUx1Ulk4WXdnSk5peUJZVm1DOW81R1NpTjNQOWQ0QVBYUi9ubVhobjRqenBm?=
 =?utf-8?B?VDByWnBZejRReTYxQ1cxanhmdytKWG5QSmJScDhZdG1qTlZzaVNEWVA0Nzc5?=
 =?utf-8?B?TExLUzJMSjdHeEZIQjBZd0J0WC9lSWtKeFlxVEZRZFNHdmFqS0g3aDBnSjZB?=
 =?utf-8?B?aTlPWEpWRXUzcVVKNTZmbHlsL0JXTUx5QnBKSHkwdEpXMnhLMUgrTXErT1h2?=
 =?utf-8?B?QXlHaEJXNHNkSzJTQ2ZtQU12ZjN3dzNZUjRtZHIxeCt2dGxCaFpNMWYzT0U4?=
 =?utf-8?B?aXB3Y2pOVU5TOG80c3kvcWtvQ1I4KzU4bUxXb2M0VmhtWkpuSk83dGFZVUE3?=
 =?utf-8?B?UXV2YUFLNURIdlBQNHBNTENzY2JVd3JMY3J1OTZ0Qkt5bkxzSndSNWJIMUJD?=
 =?utf-8?B?dFd5cU1ncE9IY0dBQS8weDM3UXFlMHhRMThUL0pEZ0x0VmNnL2NJVFg4aVIz?=
 =?utf-8?B?bjBmK1BSdTg5SlZkd0hYNjFGendCZDVMR2lzNFpmbzBrZ3VGdHBpb0xQRlJj?=
 =?utf-8?B?VzVHN2NnSlpRcitzU2wwZG1JRGxDZlIyRDl0RXVaZzJ6K1daVWlCZENPamhn?=
 =?utf-8?B?enp4cDBwZHQ2aGUwanhEZE9IaVZkWm5ib0EvUS9JaHoyQ21DalNqN1A5VjF6?=
 =?utf-8?B?OVZ0Wkw5cnlPVjQ3UkhHa3ZaQXh4ZTR3d2Vqb2VYOEI0M0ZNUFZ6ZGpOMXlT?=
 =?utf-8?B?cDM3Vkg2NmJiQmFqSFhldkt5Z3I2cjc5UDc3OHFiYlcvYnIzV01iMm9tU3gr?=
 =?utf-8?B?Z05OMDdzTS9NNXVLcHJhWFordGl3Mkh2Ni9LREhtVjBuS1JIbFoyWkVzUFNH?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41506fc3-6b26-4bd8-482b-08ddaef29a3d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:31:55.3317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpnwkMzmeG4y+uS0de2UScYxx2dHs5ObfK8yQxwdOVwqUibP+Or/G7b30GaBZPAJYv2RNd/vd7qLXysU3ml4Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
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


On 19-06-2025 10:40, Sk Anirban wrote:
> As part of this WA GuC will save and restore value of two XE3_Media
> control registers that were not included in the HW power context.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 +
>   3 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 7de8f827281f..c4aebb7a9dc6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -368,6 +368,7 @@ enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
> +	GUC_WA_KLV_OAM_CONTEXT_SAVE_AND_RESTORE						= 0x900c,

Please change the name of klv to 
GUC_WA_KLV_RESTORE_REG_FOR_OAM_LATENCY_MEASUREMENTS. Rest of the 
implementation is fine.

Badal

>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 07a027755627..27668cc25ef9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -382,6 +382,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
>   					&offset, &remain);
>   
> +	if (XE_WA(gt, 16026007364))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WA_KLV_OAM_CONTEXT_SAVE_AND_RESTORE,
> +					&offset, &remain);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..4bf0df0ed663 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -59,3 +59,4 @@ no_media_l3	MEDIA_VERSION(3000)
>   		MEDIA_VERSION_RANGE(1301, 3000)
>   16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
>   		MEDIA_VERSION_RANGE(1300, 3000)
> +16026007364 	MEDIA_VERSION(3000)
