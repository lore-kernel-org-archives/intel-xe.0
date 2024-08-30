Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B02DCA0EE5
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D0410E812;
	Fri, 30 Aug 2024 06:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMiXsRb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3960310E811
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725000357; x=1756536357;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H+nKRHG9yZMFPY5/Wm3nxpliPmUQWHW6mgF7QBHSwHc=;
 b=IMiXsRb7j+3/LllhCWEX3NmCBHlXmv/04cEczyxbZeWQFKWps+jEyivz
 0lALxziUv+wngfMBati2VcX5lqfagvynQfoJz7Vc4bhHjpqvtfUJIpLye
 E970pofSq6IgysVP4dN9LsmxwSJ7fwk6HdECqjt0gDfJD0322++5coBIs
 twFtj/9EuEujvKaDfR2/TV28vLhIe1SxwiE/U8i1x4u4OMhsrSlTVqgPp
 kvtIAfhr4Q3/gAjFH0MRg4r+y3/0o1UtDwzHZByTxUnZlmEYpBGIjGr0A
 EkW6g2UmbsmwU9NneeotbGRUAO27Ykm7mwPVLVWBsDnCSPXPYItrH+YGM g==;
X-CSE-ConnectionGUID: pxTojV0iTbKIMWxmWvp4bw==
X-CSE-MsgGUID: FnvrmRMIS6Snoc6S7LiGaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="35003738"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="35003738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:45:56 -0700
X-CSE-ConnectionGUID: 5KjmSaIRTO2W3/bHEuTkPw==
X-CSE-MsgGUID: A9ue/fRlTOKkZINymEvymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="94631545"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 23:45:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 23:45:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 23:45:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 23:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGd+crYyq7GLwkzWXXxC2wa/cqomBeiTNlNgV1DxJd0evXEGrYC/nKWNOIq4zYC5aaM+uVcQH98RFDUSEDPVt4Wl2IFoIJB41yENPDj6kEmteOQkPD8HF4UU0hQ6cHyEvVDYECz/Iv3YKAI9j/2lLIIsQPGNWFhMkBVHg2vCdY+QbdtbfVESQEFQctgsPa2fLBXEr7yM8a97sn134JNMwqUkNCgDX6Zuf++Yuic2BRONe/dYGq2VmrK8/pca+9urW9ld09Hz0q6zGMd3PiWKotxElyX5ad+/e8x134+kcp+j+cZX0DbGhT3Mgl36yf85mvYwn2q4dBd754dWhmXfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tz+Z6vUSEKmJENLCM5EN/B8LaKiZek8YvnWqhSJGm0=;
 b=FIdrupmeVpNFxEeWSfztAhDqhUcKT45jJXoJS96DhIPmyueZbbDdMqO0HYEIiEX+iGCyV6j5H85d+hMNPYVS/wuAuYSHXyaMo8k/H2scHVkh1eto3WZ14E0r91FaanoQLDACgvJV5ecIC74xYZ2BJE4dK1PgjktyqJiQYISzkvAgbI/TO7EY+GHejYE063mJCk1162S0yegEvHTGzxv1rK7R+lglSqkptDY1kUWxD/Sk8rMhCetPOG6XyAcfQ62AkUKku9VBr6UJefUWNOqNDAfCuR0oJxXAeqnlJdNXPCJuwtcfRnYhB4vUeeu78nSAbGGmX65OahPSFo3E4W0Wdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.29; Fri, 30 Aug
 2024 06:45:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 06:45:46 +0000
Message-ID: <7b5e79b2-1240-47e3-bd12-9feb45e255fa@intel.com>
Date: Fri, 30 Aug 2024 12:15:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
 <8734mmwm71.fsf@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <8734mmwm71.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ff1102-972c-4e2b-4fbc-08dcc8bf60ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1ZZWlVuWFE1MERLR3pEYUJBdzFocU8vb0xqUVJQVkFtMmNVMG1JSndSZ240?=
 =?utf-8?B?KzZlai9qdHhJK21TTnEycGpab21oZnJxbHNvdDF3N2pzTU41Q0diL2xWSTkv?=
 =?utf-8?B?aUFpS3Z1QkFvdndLSFBLWG0wRnNIeXVIUFZ4d1hrM0FxZXQrTG1QYW1WUks2?=
 =?utf-8?B?Y0w5TitYMnBWdnF1Tk50RFBObDhYNUJVbHlVUmp4WThMc0x0YzRBNVoxbG9u?=
 =?utf-8?B?dTdlTEZIYVcwM3NtaUFpTzBYM1Vabm0raTJkZmlsUFhXWEd1bklmQmpwaUJp?=
 =?utf-8?B?Umk4eksrcE9kbTBhdXZFZUxqMkFDZitqcU1VSnYwNlpSYmJUU05YWWRxSDV0?=
 =?utf-8?B?OFR6dkFYZzBneStNdjZIV0lETmhKdDlaSW1EUkJwMzVxV2VSckhjMUI3ZTZE?=
 =?utf-8?B?ZUt0TTVJQm5HaS9sM2p4SDMwbXBHekQvWHNVK1pYNTNjWjNVZytsWEVjWG81?=
 =?utf-8?B?MGxiUmNyb3pVbDZzNU9Bc3U3Y1BDMjZQSFI4RDgzZmZlSEtiVlRuSVZ1cmY1?=
 =?utf-8?B?K3RoYm84QktDWmVzVnlGS29zaURFM2dzQXhKdmhaTVpoeDdxaTdua3NVSlJO?=
 =?utf-8?B?RW5ycTRDY0ZqTzZ6emM0M1JIRk9ENWx2QmNYVTdXQzNWZ1lqUHBjU2pwZnZk?=
 =?utf-8?B?azdDOGJhTmhVTVFzb1RqYjFOMGVqL3lrbHZHZ2xlOXY4QkVRNXpYVy8ra2E5?=
 =?utf-8?B?RVlBRGY3ZmZaNzg5N0xXMUU3Mk83TzVsQTA1QVFtU2tzd0o3UFFjN1NXRURo?=
 =?utf-8?B?WVJrL1AzakR0NFg4SUxaVEJkZnVHVlErenh1TzRCanFnNjVaQkVFTjYzMlhZ?=
 =?utf-8?B?YWJhbFhibktFZm1UMkJ3a3JMY0pIbjlld2tDSkhEYXduUklQTmxMdVhJSFN4?=
 =?utf-8?B?NVU4VVhHcVAzZWRIbHNGWmtPVm15cWp1bjgxcElNMG5aeWl3V3hORlNkTEdZ?=
 =?utf-8?B?L2FoMTFQRUZ4NEFlTExrWVk1MnUrT3I4OE9CREExL2tjVXJrQUU5VXB3SnJz?=
 =?utf-8?B?b09YOUwraUNPWUc0aWhPRnpQeUQ3RjR3SHJ4NGNGNTZSTEpHYm1NVDZXb2Uw?=
 =?utf-8?B?ZHpQdGFpdldSWDFvamZDUHgyTTJyckViV2lmWjVXcHU0YktQR242QkUyTlVO?=
 =?utf-8?B?TGkvZ252WmU0Y0tBRHVRRjZTRzEra2hwVGthZTkwaWQ1cHpxajNsQVcyVDZw?=
 =?utf-8?B?NGtiODArVjFCcllrSnM3VVNjZjl1TDE5cVlMWnFqNURIZ2hOTDJwdG9KUS80?=
 =?utf-8?B?SzFNazlGRjdwRGZzS2ZjRERWWU96YTJFdktpVVZLWlF1anZiTjVBVjZJWlpk?=
 =?utf-8?B?MkdySmFXNDJTZ3lCRTJZOTNxWkhJaXlldkljYWJzUDRzZjFzWkxvMFhoV2tR?=
 =?utf-8?B?bzBaMHhJclJwVVpZL3JDSGZtY1B1NU5iczFScnhES1JMQlNVQmptYzcwbkY1?=
 =?utf-8?B?RGhBa0tHREVzNnNWM0VlV21kV2dKZHFET2JoMy95THE2LzhPUzdDYzFSQzg1?=
 =?utf-8?B?RDdURXBZcXU0NnBER1Joc2EzcDl4Um5UbVBJK0Z3NnFSNk5iMVltQmN2NWx5?=
 =?utf-8?B?VGJMQytGUWNWZXFBY0xXN1RqaVdBYVJUODBMenduVUpkQWdMOGUvYWVTMkkw?=
 =?utf-8?B?TlJ3OVNMakw1UlVZVDNDVmtnNnpSYTJXWGQrL2JHamkzWHp3K0dFVE1WTE90?=
 =?utf-8?B?RXBDbnY1N08vWWErcnhOR3kreE8yNUwxa0lzTTQ1TE1GM0ZVQ2pZaUVoOXhK?=
 =?utf-8?B?aDdJcE54N1Z0R0JLcmwxMnB4bWJuSGlUTEdSaGJzczZpZVZQZHlQUEQ2VXFS?=
 =?utf-8?B?QlZFckM0S3FPWS9EM25wdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJrZHdTc0ZRTHc1WXJGVFZNSVh0OVhjRUtUWU5VT2ZCNjN2WG14ZVVWdXFM?=
 =?utf-8?B?dDFvTi9tUGRDcDFWSXJ2Tk9zZU5heXFkZmIrc3JnT00vWGlsdG1EelU1ak96?=
 =?utf-8?B?Mkcrb1VKcndPWmJxaHNsbDEwOW9zckk3RFprUXg4cS9YN2NaOGZvcGV4SXdE?=
 =?utf-8?B?MVFHOW1RaG1UZ05HRDVkdnZQNWNsVlVwYis3ZjMwaFZkQnAyMU1mSkI4QVp1?=
 =?utf-8?B?MU0vaE1WRlZoVGFaZWczenptM0FiZy9ndi85QktvLzhlS1I4Y2JIRlh1U0lX?=
 =?utf-8?B?TW42L1lyS0hSUk1KYkZNbDdFZ2ZlUkM0MzF5cDhiLzg0R1czZmJBR0RiSzRj?=
 =?utf-8?B?YldlR2JZcWc2NmpqaWs0TzlzeE4xVUp5NENPTjN6S1EvZXBKdVYwTEhZbFdj?=
 =?utf-8?B?dWVVS29LeThacElhelg1U1VxdEhiZXVOLy9FYW5jR09TNjRPNi9ydHFDOW55?=
 =?utf-8?B?aXVPQlJqWjl5U2hxU3VSeW4ycE51VkU4b25uUm5TTUlqNDJJOTZGQ2FBYXV6?=
 =?utf-8?B?ZFFQcEZ4cDIyR2NQYi91K2c4d0FRb0h5Z3RIVWY3TEE0WHplWU95RlNFSXo4?=
 =?utf-8?B?UE1sLytKdlBJZEdIRGNjc2NzUEhtUktMZ0xVNkJHS1h3R1YwUGF1NDNwV1Bp?=
 =?utf-8?B?Vlpyb3I5QmRpaUNEMTVHdllqUVBXZDA2YXJocnVMNTdicHluTld3dm93U3Vx?=
 =?utf-8?B?SnU2eUR4Q2FidTh3ZVJlMko4NTFTSFFRM3VWU2FUcmZtb2VOaGxTeEZkQmI5?=
 =?utf-8?B?TW5wNWs5UDVIdlA5OTJPZW4yTGFVdUFZMmIvNzRMZUpqVDhXSm5md0c5WkZS?=
 =?utf-8?B?NnA3OS9JWGZuL2NVRFlHakdtWDdhQWo0c3RhRllvZWY3aUJwZnBPSThjZEhQ?=
 =?utf-8?B?dG9hTTJUUFAzQyt3cFlETGNrNE93TXZiRGI4ZGdwRmV6Zkg1YklQeVlkZ3hL?=
 =?utf-8?B?bWJ0ZnZHZFQxVjAxc1JsOHJoU0Q5WjJmNVlaVXpWU2hkOXE2NWI0c3ltM3hC?=
 =?utf-8?B?a3JUY0RLQXBBZVVZNWNKTlNldUthUWlEUzdLT3lWVlJNUFE3eVpkUlVIaHBt?=
 =?utf-8?B?NC9OTG5VNEs3UTJhZkNDR1o4MTZHZFQrZmc0b3dmaWthdU5RU0NremdSYkxE?=
 =?utf-8?B?UlVQeFFLOUJpN3N2WjFSNVBXQXFXOGxMZWNYVzhzYURlRSt4Vkw4UEdZSFJn?=
 =?utf-8?B?aS9iMkxSbUpCWjhUWWlzcnpNdWR4UmF4dnFxcUNQT21IMUE5dGZndjhTYzls?=
 =?utf-8?B?c2ZjV3ZDdno4OTVuYTJkZnlBRTVmcU1oMkVqbzg0aDdtUERzS0xCRzVmODhz?=
 =?utf-8?B?WlhrVmNNbDdob1VvbUp3aUkzeU40YVFaYnprakNXRkoyRFNMVyt1VzJrS2Yw?=
 =?utf-8?B?RjFKT01BVEdmcW84ckY5ZkRwZFpmc21zcGJ2REgyWnhIV3p4N05vaDQrM3pv?=
 =?utf-8?B?RUp4QnZYcVlIY0RwaFBFQWRReDVFb01jN3NIckdpcmpFajJraFJMYVZZUlFN?=
 =?utf-8?B?SkE1ZzVLUHBLTHRMc1I0c2pLNjFzVmNvaDhuM3dYQ0wySUxSSkNpR2c3SkFz?=
 =?utf-8?B?Rzg1cGpXWW1XeGpxd0JOYXpoZWpKQ0Q0YjJLSXRaUjhGQ1IyN0pIenJOclM5?=
 =?utf-8?B?cUNGank4QnJqcTl3cmJvcjdyWk1jeDZMZWh4SWhkVDh4eWw2TGlmTmhjbXE3?=
 =?utf-8?B?M2oya1g1c2lzK3VrTWxHYXZsSmZyVDRYWUo4TzcyK1NWalZ6eWVBK0k5V3dX?=
 =?utf-8?B?ZkJJZzVsb1kxalhYQWllYW9xSkFTc3FNL1hQUWxHanh6cWF4NWIzL3N0RjZn?=
 =?utf-8?B?bHBBdXRQUkdKVkZ4b3FqTmUvZkNPdnZ0M2owdUNicE96UlpXc0xlMHYrZENa?=
 =?utf-8?B?dUY4akd5OWJjSzRsM3ZYVzduTDRWZE5PMFdxZmlmbHNkWHB2cnE3cGFiTmFW?=
 =?utf-8?B?MlVBeUZrMVZwdDQ5bkFxaTdNS3FzNjdLeUs5b1NzMGNoQndSQjVCTTNBRlMw?=
 =?utf-8?B?dzB4UDBlTHBab3FMMldobDdmanlKMlJDdmN1Sy96eURiQ2w5cnFBaDJ5dDcw?=
 =?utf-8?B?M2hUVkVjamlpamFmM0FlOEUyWkJuemUrUW03cDV6Zmx3ZUI2ajVHYlh3bnZ5?=
 =?utf-8?B?dW9qR3JQcFlnMXZzNk4rWjRVcllob01iMWxOVkNFWmJqcGRTekFHaWxEN0V1?=
 =?utf-8?Q?Ahq4ylK5kmjj1sf5J6NkDas=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ff1102-972c-4e2b-4fbc-08dcc8bf60ab
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 06:45:46.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0fF7yE3OTpNreztUb3fceFUrlpiTeNfrh7NFkm9qm2zyLKOML2QhRU3lhMMRGjENBR+YGEVwr96//6O4dXpJanXCmKAzUt6CWm3TIfi4go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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



On 30-08-2024 12:07, Jani Nikula wrote:
> On Fri, 30 Aug 2024, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
>> If an acknowledgment timeout occurs for a domain awake request, put to
>> sleep all domains awakened by the caller and decrease the reference
>> count for all requested domains. This prevents xe_force_wake_get() from
>> leaving an unhandled reference count in case of failure.
>> While at it, add simple kernel-doc for xe_force_wake_get() and
>> xe_force_wake_put() functions.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 52 +++++++++++++++++++++++++++---
>>   1 file changed, 47 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index b263fff15273..8aa8d9b41052 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -150,31 +150,73 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>   					 (ffs(tmp__) - 1))) && \
>>   					 domain__->reg_ctl.addr)
>>   
>> +/**
>> + * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain
>> + * @fw: struct xe_force_wake
>> + * @domains: forcewake domains to get refcount on
>> + *
>> + * Increment refcount for the force-wake domain. If the domain is
>> + * asleep, awaken it and wait for acknowledgment within the specified
>> + * timeout. If a timeout occurs, decrement the refcount and put the
>> + * caller awaken domains to sleep.
>> + *
>> + * Return: 0 on success or 1 on ack timeout from domains.
> 
> Please stick to conventions on error returns, i.e. please use defined
> negative error values instead of magic 1.


My bad. Thanks for pointing this. Will address it in next version.

> 
>> + */
>>   int xe_force_wake_get(struct xe_force_wake *fw,
>>   		      enum xe_force_wake_domains domains)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> -	enum xe_force_wake_domains tmp, woken = 0;
>> +	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>   		if (!domain->ref++) {
>> -			woken |= BIT(domain->id);
>> +			awake_rqst |= BIT(domain->id);
>>   			domain_wake(gt, domain);
>>   		}
>>   	}
>> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
>> -		ret |= domain_wake_wait(gt, domain);
>> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>> +		if (domain_wake_wait(gt, domain) == 0)
>> +			awake_ack |= BIT(domain->id);
>> +	}
>> +
>> +	ret = (awake_ack == awake_rqst) ? 0 : 1;
>> +
>> +	/*
>> +	 * If @domains is XE_FORCEWAKE_ALL and an acknowledgment times out
>> +	 * for any domain, decrease the reference count and put the awake
>> +	 * domains to sleep. For individual domains, just decrement the
>> +	 * reference count.
>> +	 */
>> +	if (ret) {
>> +		for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>> +			if (!--domain->ref && (awake_ack & BIT(domain->id)))
>> +				domain_sleep(gt, domain);
>> +		}
>> +		awake_ack = 0;
>>   	}
>> -	fw->awake_domains |= woken;
>> +
>> +	fw->awake_domains |= awake_ack;
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>>   	return ret;
>>   }
>>   
>> +/**
>> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>> + * @fw: Pointer to the force wake structure
>> + * @domains: forcewake domains to put reference
>> + *
>> + * This function reduces the reference counts for specified domains. If
>> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>> + * and waits for acknowledgment for domain to sleep within specified timeout.
>> + * Ensure this function is called only in case of successful xe_force_wake_get().
>> + *
>> + * Returns 0 in case of success or non-zero in case of timeout of ack
>> + */
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>   		      enum xe_force_wake_domains domains)
>>   {
> 
