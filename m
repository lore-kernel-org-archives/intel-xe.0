Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CFFCCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 16:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5856910E606;
	Tue, 28 Oct 2025 16:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ccq7PxWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5151310E600
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 16:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761667434; x=1793203434;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xfBykBMnYwloHv8AuepN7lKtf3+VpDmvCz4taMQdKeA=;
 b=Ccq7PxWr9NLbcnEFZPFVJZ664LWzJu4ZlSKU8Rm5ipoz97hCt/1uS5T+
 w7MQfz4GHK3AdmLFEtZC+H/Cvva0Ncq1vmRYDvpLlaGvVlBlphT/og/pj
 xNgPu1UtpuPoQzh68llfS9GhoVFkXoPOTTCqfL8c/sxMB325EP6ZxxZZK
 P+4TWFDKlycxXfslxd7Yf5eaQz4nerSm7g8QVbt+VY1z9kl99KENfs4uL
 tO6Ty9P6x4jX8W2YSbmhCr6zAke9zEEbz1O0y99jSOCmEellCaB5pkrKf
 kGPqn93gB7KQmu72jXZ/Y0BBerfreCjXmeTkM5An+ynEp9ccnaLsHliDh w==;
X-CSE-ConnectionGUID: Fb0UH28lTSWcHJ0omJFXWQ==
X-CSE-MsgGUID: Rx4zKTSKSiqBeBYHw5Wg5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63659515"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63659515"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:03:53 -0700
X-CSE-ConnectionGUID: QuCOFttcSoeGUzq7AHTTYA==
X-CSE-MsgGUID: eodvzojkRlWcMufa3UzvCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="216266961"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:03:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 09:03:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 09:03:52 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 09:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YT3Dkt0k52IKkBz4mInNgYPd16YgmRZH1gwSOvVpvURMg/wDPwm2QckG1ZYop1XXESAlZI+QLbx9KI8He/rl/WmvLeW4+OWSkBN/5dNVPPPzk1pI1gJahGtYCvR0Wmm9j8khKpbOMU6LNe8QiDts3LXzZJFT8dB7q5q0VarFstQUVQsRMLpaLs4n9ECr2G3mNIS3El3o4E7gUbRZ9gsH2t0ljz0M6RIdM6thxJPtjZk/eJCCKlOqk+Dl7Mcy/+rUuKa+tIeKoUD33++7glwh8PLXgRQscIFFN1nOMqLLtY5WXIFsCso+pSXRYWZP1moxlQf2NgZdsIJHNDt7h8UuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSnqIp5Zt2Wi6gdju5vLEduPU1fQYwxAm22sKRC1L2w=;
 b=yDcIp8CbQfgZV4mtb0vYQhC2+Xxn0ssft/IPadXEUNO7a3kI+NS8UbH5D2y56du/x2fJ2tWls+k41EiCT75c/hhUsSa3EP2DN6vyoSuq44DkwaeIEbzwqG8Ix7Br2ZAovJd1OiOAsSGoJPNgzasJ0EVGR1XsJb5csMyZ2WINefFtfl4QkuctjvZP5gKToDfy4nFzHLtHtXoDU4IZrtioeM1YFJpYsu0SLY2j6Zud1LIUd5x8WWUnAmNwQPB0p6WnvGuU5/s0UCOO2bupbOBlhqFW7lUL4t+iKUrAQ55jMQ2yIDh//kNIlzDyvAVQ2CbpK8yVIxH+OtRXFGL+h7TTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 16:03:49 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 16:03:49 +0000
Date: Tue, 28 Oct 2025 17:03:44 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/14] drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
Message-ID: <20251028160344.6lkaoeabwf2bvyeq@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-12-michal.wajdeczko@intel.com>
 <20251028095734.yfyfszbo53xdlgeh@intel.com>
 <fff931c7-f60d-4e14-a01c-1a4291d352e8@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fff931c7-f60d-4e14-a01c-1a4291d352e8@intel.com>
X-ClientProxiedBy: DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 810ffa5e-79e2-40e6-996f-08de163b94c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGxCNG5heHhhbE1QNUdRUnFJQWlSbjFoUlRBUTRZNG9MM00rTUIzaEVMbGRB?=
 =?utf-8?B?TlJvQWlrcS9KdXdrdHF4ZlFYYnc3NmlNcllTNWRMR2ZIc2dSOFJkcklIanZt?=
 =?utf-8?B?SFBEVnRYZXVwaUgwOEhyZ0JRcWNQVGl5MmNlUWc4aG1QeHYrM1VVZFUrTzFV?=
 =?utf-8?B?L0NISVpjTzI1LzlleDVaTFAveDArZ0VSS1lDNFRMRlh6d00zSjFHNFd0VjBs?=
 =?utf-8?B?aTJINzR1NzRpeUNZeDc2N3FaVTlNQk45VGRiREc3SWsvc1V4MXFHZUk4RHdM?=
 =?utf-8?B?b1paQkdCbDN0Z0RiNHZxV0UwQWprd216bitBSlkrMUd2TzI2ZzIyM2s3ZitK?=
 =?utf-8?B?UVZGa3dBRHRBeThOZDhneGpiNUtsaXRVckxuczBZM3M3US9WN1M1anRtSkEz?=
 =?utf-8?B?NmVQeXdzU3J3bUVncWZ3bElRbEJlNWNPY0U2V2lHMlZ0dTFLckM1WVJPejA4?=
 =?utf-8?B?TGNpaFdtQ1hrT3ZtdG4zVU8xK0EzOGtyUmVkSjJmeUZ2VXcyVnc3UzJjZ3lQ?=
 =?utf-8?B?MjhCM2dJZzNvTHpIbnpUZ0lUaWdzb0tqTlQ4R3NEV2Nsa2Y2QzVyQVdGUjBS?=
 =?utf-8?B?VGwvUlJxaStqNmNjVzFKSW8zT2tlRm1tQVpDeGQ0MEhrajQ3L3lvSFcyWG1m?=
 =?utf-8?B?TUgvZCsxSXpyQzJteWlkVmh5S2U4NDErdXA5VnRTOC9mU25PYk11S3VTOE1U?=
 =?utf-8?B?RERoRWQ3VFE4T2ZwSFhQRWJ4NWVoUkYyVmtKVXVSQlZiUEE2NHZEMkxnU3Jm?=
 =?utf-8?B?b2ltZUd1dkI5LzlJY0c3WUNQUDlpejVUV3JpUGZSQ0phVDIxeHpvVEd1aWxW?=
 =?utf-8?B?aEFXaTN0eG9YOExnd255YWJadXZHOUJMdEx6R1hiZlVvbWx3QnFsS1ZTdDhU?=
 =?utf-8?B?WDVBTUJjR3Z1R1J5RnpMWEpOeVorcGJERkcxeXZCZGJ6RWlEVFZjak5mM3F6?=
 =?utf-8?B?T1BNNlYwNjh6YzRQRmc5RUx1YUpsMkhQWHJObWhtU3dlUFNYQ21jdDBRWXJr?=
 =?utf-8?B?Qi94SkhabDZ4bE92M3NIa1lBelhuVHlDWnllVFl5RVdvZHBWWGFiK0diRnVm?=
 =?utf-8?B?MnB0NTdVZkF5ZnlPVXRrTm0yS1N4ZGtaOVdUY3Q2U3c4a1FnUW1GeDVtbHI4?=
 =?utf-8?B?V0VITENVVk5mdWJOajJrazV5d0VYWHE3TzluOHlTOUkxM0tKYmQ3REZPYk9F?=
 =?utf-8?B?YUliZ1Qydm51TXVaOXdkcklPUE1PWjA3RjlBRXJzRnN3VDN2YnVyajhWSjNU?=
 =?utf-8?B?d2Q2bjU1bE5RZGQ4YWl6MnpuVmYxNnZNbEZ6NmpGcVRrcS9kRjZETnRnaEI4?=
 =?utf-8?B?cFhhM000b3M3dWtwcVNqdHdsOGIrOEhtNnJqRGVtUzEyUWErUGhockdoTzFu?=
 =?utf-8?B?ZGU1ZEVTZ005MnZnU0phS1RKaVovV0RJUndEdHpLWnNhZXN1UWtIRTFnUW9S?=
 =?utf-8?B?bUcrMnZKS3BEWlB4SlEwQ1l5TVBWalcwNTBOZGRKWkM4eEdIZGVxMEFvdEt3?=
 =?utf-8?B?VXdDMWRacTBOZWFMTGFjNW1TVFlnZzUxVi9jSkpNOXpNS0R3M1poU2RxTGxo?=
 =?utf-8?B?eVpXVG4rQ1RLOXV2ejNNemRvdzhIcWN6UlNZVjAzOHJKM1VkL203MnA0NDlw?=
 =?utf-8?B?QnpMR1gvK1dPcVpDRTBrNld4K05ldHJTdEFWOElNRDdZM2J2M3BBUzJPUDh0?=
 =?utf-8?B?d0NiUTMvWTBHckkyd1JreUsxZjFncUtRTVJZQytGUmpqd2hBSnZyTExNU1hx?=
 =?utf-8?B?VXFockxDU0xyT0RGTENkTkttQWUycSsrQlNTZEZtbVQ4MzkraGlNaS9pOG9N?=
 =?utf-8?B?RkxuV3R6NEpRRjdDRDZYYy9uU0JIMXJBdnI5cXVTaUkrU0NMU1djQm90R2Jo?=
 =?utf-8?B?REpQVVQzbWZFeThYU0REWHJJMURCZWxpWWNwWjRSdlBhZUtpMWJCeXJINUFO?=
 =?utf-8?Q?lyt8x8FBsl3tLFEtlLht2imOzL6YhiCy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXhtb3NBQXNhNDByUkU3dkpscjVQcG5yMWJDcDFkc2E2OUpNVWFWWmJ2MVRt?=
 =?utf-8?B?SWJhKzNGYlFtci8yYUJ6Y3EramtCQmNUb2U3U1M3UCs5bDMzdDZWMkRjWS9U?=
 =?utf-8?B?bUdKQmZmT2N5MVlod3hBZmFDVGhLVm11eWFtVjVobHZCbU1lZmJsRm9BNEN1?=
 =?utf-8?B?bTJkdUFnWFhqQ1NBRlEray9jQk4vYXVOODNoQlhlVXZaK3g3Q1VYVFJSb2VI?=
 =?utf-8?B?YmU3NTI3U2tNUmRSZCtSZkI2YTIzbFJBeWl3ZDd1L0szZmlVWnlMNHBFZ1JC?=
 =?utf-8?B?Q2tCSzJ3elhCS01sZEw0U0dyZVdWUGVXUW5HRFBGRTVHL1Y5ZmE3emd6WkxG?=
 =?utf-8?B?Ym12TlV6NjlCcTRMaEpORFJ4c2h3V2o1MzJhVTlsNHJpT3NCa0lLbmRITW9o?=
 =?utf-8?B?aXYveVpLU1c2TDV5Y2EwVjhDNzByNDVreHNHSXE3b0N3TkxzUXF3QUNUK3dD?=
 =?utf-8?B?L0x4VHE3emZiSTRoL0JXU0hDbnllVHpHT1hNY21zQXNBZzdvRTNOb0oxc1Vx?=
 =?utf-8?B?S2c5OUFrS0owS1RBa1RLV0c1VjlwVnFiT3FQcGcyaUdzVUJqVWhsWkhWbVJE?=
 =?utf-8?B?MldWOHB1QWoyTllFbWx0YXY4cFBVUUt3QmhzN1M5Tkg5TUJBR2FNSFdHSXVz?=
 =?utf-8?B?VzdEUUFCVXVvT29oSjdrN242T1A3WGE2TW1MNlFBSzlaaXZWeUtRdCt6ZjFh?=
 =?utf-8?B?VmplSXZlREpOZC9vcWhROVZ0TWJ0ZG9GbjlaYmtnODBxdHJyVHQybUsxRTRn?=
 =?utf-8?B?R0lNai9Jcm03Um1SbHZZK3JuRGV1akpHZWZLK0J3azJMNHR6bHE3L0VHR015?=
 =?utf-8?B?aWlWeTA2dnlRaXBTS1NhT0Jhay9aYksxOTA3WkxmMDIwUEZudDRnVmI1dWZL?=
 =?utf-8?B?NjNOS0pPampTeHJQaFdoRkRXODNUcEpLTWJTTEVtRUkweHkwUnRHVmx4NGZG?=
 =?utf-8?B?TmdaOHBIc1NiR3pZdW1KRTNiNGlZdUJONG4yeWNzVU4wYUMrbDNGbTB3bTVi?=
 =?utf-8?B?ck9qblgrUUU2cmlLWkVxQi9Rb2M5QVk0UXlueHl0MXNZVXQ0OW9HM0JTaE9z?=
 =?utf-8?B?OHIxa2FIVEFPYlBiT0o3Q1RINVRVV0M2SVlhVWd2aWNKY0I4SURUSEMrMWlQ?=
 =?utf-8?B?UFh2ZEJacFJSZU1UaTVIcCtDdDJqT3BBZW5uczF4allPVE1nVDZvK29PYW54?=
 =?utf-8?B?MnJSdkhFa0tRRWZDYURXUmdSYTJ0eXcwYlF5UWczSVI4R1hmK2xxUk9qemlS?=
 =?utf-8?B?SW9zVGMzWlBIQUNKL0g1Z0s0ZkdQZnhKR0tWTFVQbnJESm9BS3lPN0xYSTRu?=
 =?utf-8?B?eEtleFJWYUhScVV0d3dyV0ZaMDhMZ3V3RndwZGFKOFBocmUyRThEL0Uya2NK?=
 =?utf-8?B?MWNmclJ6UUQ4cGpPTUwvaE5CZ3djVkRXNEdBUW8wdlIxYnRLaWw4OWFZdjBk?=
 =?utf-8?B?TEt3SUQwUmcvd29MWmQxT0kvZEpjUWQyallMeWRPUHlnZUZrMERzSnNYdUhG?=
 =?utf-8?B?bzVNaWY2akhOSUNXbDJhOU9LNUhGeTdLOE9TUFVqZGRTUlJUNDBWNVd5Q3Bh?=
 =?utf-8?B?ZThaVDhlSDd3cTBvUHkySk5YaHAyQkI3SVRDR2lyWUxEYW1rdFI3M3Z1RlEw?=
 =?utf-8?B?eUs2b0xPRmlLSGlYYUx6RTRMaHA0emh1Z3BuN2RGS3E1Sy92K2pTTjhRR2I1?=
 =?utf-8?B?WFArbXIxTHREUEE3Mk9vWXRVeDNQNVpRdVlmZC9zbUVUMGxvdVF6MmltQUxR?=
 =?utf-8?B?UzBBOEZTK3FVekd3d1UwVjBNWjh5OGEwWUJoNXV6NTNBYnhhN1ZlcFI4TWpG?=
 =?utf-8?B?S1hLc1psUXlYRFJtdTNBVEI5QUxXQXQwc2FDU0VUdHBKVzFVNGloTzl1aUdF?=
 =?utf-8?B?NDM1a01zNnJTbWJiM04rcjdNN0JGSDM3WnVBVjZoWmg4QW5pWjBlUTNtT3NH?=
 =?utf-8?B?UVd1OHp4Q1BTeWxxVzNHU0RPSXZJWXJBdC93TVdzV3BiWXV5cWZzMDg1eCtp?=
 =?utf-8?B?NnBSRVUraWN1TFNJZ3VDaUFvN3VtdWdvNUI2ZUVFTTI5SUU3L0ptWCtBZDhU?=
 =?utf-8?B?Qmw2YnNWcUJqY0YyUmJVTlNzQXVoNzRtZEw1VExHUzBTbXU3MWZzTzZnUHZk?=
 =?utf-8?B?N1lhT0dyY3IyUzIxU1FyNkJpVU05eTRkT2tXV296S1QvUWNDTnc0Z084b1gr?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 810ffa5e-79e2-40e6-996f-08de163b94c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 16:03:49.2574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smzKr26n5R4g8g42jOowJq6jvAJt/LjRGNO4jc+jCCdrsFpS1gKB/Sl9WZs4VnW+1FCNk2hEivSrhrXtMSaCSeNj6sB0VVbTgNkosDoG4ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 13:22:08 +0100]:
> 
> 
> On 10/28/2025 10:57 AM, Piotr Piórkowski wrote:
> > Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2025-paź-20 20:24:11 +0200]:
> >> In the upcoming patch we would like to use this private helper
> >> during preparation of the sysfs links. Promote it.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_pci_sriov.c | 37 ++++++++++++++++++++-----------
> >>  drivers/gpu/drm/xe/xe_pci_sriov.h |  1 +
> >>  2 files changed, 25 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> >> index 735f51effc7a..678e76703cd8 100644
> >> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> >> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> >> @@ -30,18 +30,6 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
> >>  		xe_sriov_pf_control_reset_vf(xe, n);
> >>  }
> >>  
> >> -static struct pci_dev *xe_pci_pf_get_vf_dev(struct xe_device *xe, unsigned int vf_id)
> >> -{
> >> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >> -
> >> -	xe_assert(xe, IS_SRIOV_PF(xe));
> >> -
> >> -	/* caller must use pci_dev_put() */
> >> -	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> >> -			pdev->bus->number,
> >> -			pci_iov_virtfn_devfn(pdev, vf_id));
> >> -}
> >> -
> >>  static void pf_link_vfs(struct xe_device *xe, int num_vfs)
> >>  {
> >>  	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
> >> @@ -60,7 +48,7 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
> >>  	 * enforce correct resume order.
> >>  	 */
> >>  	for (n = 1; n <= num_vfs; n++) {
> >> -		pdev_vf = xe_pci_pf_get_vf_dev(xe, n - 1);
> >> +		pdev_vf = xe_pci_sriov_get_vf_pdev(pdev_pf, n);
> >>  
> >>  		/* unlikely, something weird is happening, abort */
> >>  		if (!pdev_vf) {
> >> @@ -228,3 +216,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> >>  
> >>  	return ret;
> >>  }
> >> +
> >> +/**
> >> + * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
> >> + * @pdev: the PF's &pci_dev
> >> + * @vfid: VF identifier (1-based)
> >> + *
> >> + * The caller must decrement the reference count by calling pci_dev_put().
> >> + *
> >> + * Return: the VF's &pci_dev or NULL if the VF device was not found.
> >> + */
> >> +struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid)
> >> +{
> >> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> >> +
> >> +	xe_assert(xe, dev_is_pf(&pdev->dev));
> >> +	xe_assert(xe, vfid);
> >> +	xe_assert(xe, vfid <= pci_sriov_get_totalvfs(pdev));
> >> +
> > NIT: You already mentioned this in the docs above. I don't see the point in repeating it here.
> >> +	/* caller must use pci_dev_put() */
> >> +	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> >> +					   pdev->bus->number,
> >> +					   pci_iov_virtfn_devfn(pdev, vfid - 1));
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
> >> index c76dd0d90495..b9105d71dbb1 100644
> >> --- a/drivers/gpu/drm/xe/xe_pci_sriov.h
> >> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> >> @@ -10,6 +10,7 @@ struct pci_dev;
> >>  
> >>  #ifdef CONFIG_PCI_IOV
> >>  int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> >> +struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid);
> >>  #else
> >>  static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> >>  {
> > 
> > Shouldn't you prepare a variant for case without CONFIG_PCI_IOV for the function
> > xe_pci_sriov_get_vf_pdev ?
> 
> not really, as it will be only used by the PF code (which is already under
> this config, and without PCI_IOV config this will not work anyway ;)
> 
> the only reason why xe_pci_sriov_configure() has it's stub is because
> it is called from the core xe_pci.c (twice)
> 

ok

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> > 
> > Thanks
> > Piotr
> >> -- 
> >> 2.47.1
> >>
> > 
> 

-- 
