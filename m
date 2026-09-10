Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DD7C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF7B10E287;
	Thu, 10 Sep 2026 12:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHbMlBJX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043910E2B3
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789043597; x=1820579597;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FMe7Du5zNnrzwY+XF/HbRSAv5Uu6K09HRb96LGIdKm4=;
 b=EHbMlBJXf/rypu3rVrNTH1nxKL1Z1n0ufCraq4+Plw1HEUyjI3bcEKEx
 g0qYV4kn5lOUpJafIpwnKX1aWHVLUCpvR1Go2QT0HhoCcpX1Z43zvESVc
 ZG5nFFVnQUbfoj6PAZtz1z/MhY3x29bewTPgD0czflWiZmyE0s4weofCZ
 R04rNXQd8baQN1jAPKXrG3gDzNFRM4+lGyVrMLcm4ohasrnGJpsNM5VoE
 xBU5o9MRA9Duo8Wuw/cp/3CvrL+X9hMPal5fpWImJoyoai7gHYV934KEc
 S5j6rWjnsmw5G1zc3tO3GaqngHBtyh/H3ZdyB9kOY+DtiZ74lld1fFuvo Q==;
X-CSE-ConnectionGUID: ZG+mNiy9QomOWkM8XEbkrg==
X-CSE-MsgGUID: co7mTj5fTn6g5f9FaZkH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93356866"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93356866"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:33:17 -0700
X-CSE-ConnectionGUID: V12PreupSIeBujGPzGF3Kg==
X-CSE-MsgGUID: cGdsU70sSJiIonEGlC5jow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="270269381"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:33:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:33:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 05:33:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:33:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpeVCEIBPG/fY1mx17UiZd+m4rd9ZUd3NuSkBvIEQSaAqIq8KG8QEvMfDxOimLXivH6cZ6WNEe0o0iOLddf1d2pUWSiRALo756LPTAKv8s9NSb6rwM1nkIENOJ+ZPxu+W18N1Yq+B61YVdRKOYlhRL0e/FGkC9aWbRNBYb00LDbvMpGUFKSjWeSwHCQ7B1CnsyoIHJk5EEH1/1kwiua8MCEllUGribaxY6fjfmTjPMY3Cucc1cXsJPTSM8Frx2MUQKuOt5FrGa7eVI8Hfbbiqq38S2kgCN91nrUFai2KpmnJhvlUtt89TZroa4CfTYRDgo9t/DM4+aoyaHqyec7/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0coaYMnZKyl6F+diHbovgzLhPxxMgT0MJYBuXZk53I=;
 b=efjJFkM2rcn9NDSaaWYc741IR9PDSUMnu4RgCgVzRVw4Dqtyc/sFNakkGcJ8XvWATT5bBVhQrani24ilBKaL7g5rz6JcN5L1E/vqzovdFCPAOYUgQTd9iGKmtvC4LLmBf4nZNar+6aQ5/vbK+5nWkrLxusfPZyy3hMBxmNTHKFt64n1enyPS5CzpVLDEHGJzatDZqEfavuenz/qSQOGvD6JzxgxXCXnK8E5ex/0PmPFdtrA+1eETtEuPdJA+fevS+6tRrVoh7IvdXdr6OjOfO7+QFmzic0hhGYLziMW+5yhR/GUqa0RowAFVj9p475Lf4L7lLTyDkEaSsI8ne/GXdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA3PR11MB7533.namprd11.prod.outlook.com (2603:10b6:806:306::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 12:33:14 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 12:33:14 +0000
Message-ID: <d0a29119-5123-4b4b-8b07-b78c2558868a@intel.com>
Date: Thu, 10 Sep 2026 18:03:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] drm/xe/cper: Hardware error CPER reporting from
 xe_log
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <michal.wajdeczko@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-15-badal.nilawar@intel.com>
 <ap_fjltTIY1mXyXF@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ap_fjltTIY1mXyXF@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::17) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA3PR11MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db30683-2cfb-4122-4c2d-08df0f37aebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|4143699003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1G/Q9GbDEMwyvSUbC6w0PalPhR0yJBsJ39bCnwAlmCvzjvfnBu6haXN8XNEb2ZNZS/bjAlPHVf6fChTjYx5E+gwobdd5quQPb7Q24WnezNIn4rC02oS+PxOoJuP9KuatTV/wK/aYBoEF3xAOmSloVYEKRVkTwIcLd/b2lab0dpxChgs8aL59asSBvmJECvRFwsFCl91bne/2e5pIVGqvtHafXeP0YosS2GbwQ5+KA5oVPYndLVbnEAQAmBxyTGBnkLFEofhyYSyIRHmkUunN7MCs+afM7e1yuM4XdKiCsvRtvYwateateCaV3kCJ1TI5XXMZegPhSPztbgSR2hggchJLRFx5JeSD253h4xFE3JDhiMtxdmWKUsaPR7jNSVzJaCUQPeGXLE6C0IJi+T76WpodvS7Y6D7xE3SRqGNu5lS3qlm2vMuJkV0RdL/Pjk1cSiatiZDIrfU5vXp+UirnqdNqUnO3MH2Qt0okkuf96Jveyv8dJ5ElS9iSuY4jY2st1hfkhSObfOMRlf7lU5VrcR/7PwQYsZ9JoQBzGCZQk8VC1JRGMBPvY85Y3HRKJi5KOUybvigYT/8jn5tAhSaF0UQbV2tQWMKT8cMRUk803LMcpFLrvmIgmu3+GSeXwWwiNSnIqQzgyFihZOvF/qN6arfSa44tYpLV6vbPTYtAtAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enkyUVFHOFRnZ1JLelk1a1NzYlM4bnZqSWxzTEJXVG4wVVZuTUVSR1ZsZnd6?=
 =?utf-8?B?b0NpOW1pRzZGa0k5MmtFZzBpajFLRzRZQlc2Q1d5TGQvWXFFcXZWenNVYll6?=
 =?utf-8?B?cWw1elhBUC9DNnBMZGFCdm42dzVsbURrajUvay81cDh1a0JjZHdKeE05T0JO?=
 =?utf-8?B?TzU2TElsSTYxZ2ZHZk5KZkhaeUthUnl3d3ZoZVhFUk9aK2hpVVQxb3ZKZHV5?=
 =?utf-8?B?aTdHVzZTUE9HTFZWZk9ONmF4RVhiYXBwbG55WGtiL3BLYWk2RXpraGZkNDlO?=
 =?utf-8?B?eWJNdENWZnVZc280Ym14RndEY1JxN1RCa0NWMmpjL1pLMHFUQnJuLzRqR3pU?=
 =?utf-8?B?cnVqamFjMThINGpLRk1idGpnSnpVV016eVo5QmhDVk0xVmhzd1d5b2xGU0I3?=
 =?utf-8?B?cE9EOHJGSm9xVTJDVEFocUNJRzJnV0hBTC9yWDg3RU1RZVRUajhyREJ6d3E5?=
 =?utf-8?B?VEc3UnR4TktENzlqNE1CRTZWZldpa2hZbGF0UzJZNnUwc2dxVS9Qb1VzVzgz?=
 =?utf-8?B?VWRLT3FpNnkvQ1pWVitTeHVHNFdPWXBFb2xPNHpOSXp3VXF5TzlKSjRKY0kw?=
 =?utf-8?B?NnV2RitzbWtZbTYzUzN0UTZqT2dCMU4wUjNTdFpDRFhzbGJvQkQ0NzhUelNE?=
 =?utf-8?B?YytTSUh0djVieG13SUpzaW90MC9WZVBtS0tuWStIMnI4c2tpODd5WnlZMWxz?=
 =?utf-8?B?WnNCZEo4YVg0d0V0V1dRZUNBVzZVdGpvT2NpNVdTNVBGb0lnVGV0dHN0b01q?=
 =?utf-8?B?b2xJZ0pZVWV5dFd6dk5PUzV1bGNmcXdWbnVUL0ZnZ2I5NmFuNlB6TGxGeVpn?=
 =?utf-8?B?aENuT09ZMXRPWm9hTGtIOHhzakRxQzNsUlJ4TFFUem40aWMwc2NKRXBsRG5l?=
 =?utf-8?B?TFhLSzZMeHM1bTR3alNyNlFudTFEVytpS2o5TE9OTmxKMGR1aVJyVytTMUE4?=
 =?utf-8?B?WWpZV21tUk5hbzZHVnV3VlBreFMyKzJFWmh0a1kwNjZYSzMyVEsxZjRwMmlh?=
 =?utf-8?B?a1owcVNhYThmVlF2M21KNUx0c1ZFN1RlaTZmUTN6bitZcDk4TDVxcnR3VWVY?=
 =?utf-8?B?QStMNTdCaENCcEFMNm5HQkhoeTFUNzRhNDlwY1EzTGZ2ZzI2U0cyVC9oWWlo?=
 =?utf-8?B?eEY3QXFXNzJrOE5jT0NSbVh5T0Q5UDNNa3JZdWp3a1hQWnFhVzhMdGE2T2h1?=
 =?utf-8?B?ZCtIam45MW9kQjZSTzd6eEl2ZjhRSUFBK3hjVWFoalJKOUhnYm83TUZhUnJD?=
 =?utf-8?B?bTdKQW1BWEJWNTFnQ21iN0dTTzZvQVBiZU12NDFEdjk3Y1lPTFVCR3cyb2xM?=
 =?utf-8?B?SkhrU2hFR3hyV3hSS25DbzZ6RmYwckIvWmRwNnhEOCt3ZVlzRzZySzkzTUlR?=
 =?utf-8?B?Y1luNytEOTFraFdOS2NyYklZaXQzNFBucGJKbU1XT2F0UVNzSCswQjRPaGNq?=
 =?utf-8?B?V0VSbXF4SjRrS1g0cmQ2SUNJSU5UMCtQTkZaVmhDcGlrNW1ITCsvVU11OVov?=
 =?utf-8?B?TTI2bnJ2Sm9VTjFhMFZwK2JFVmRSdy9rcG1LOGdXcWpwN2JzM1NsMTgzaGMv?=
 =?utf-8?B?U1NSWXRrRlFrMklrdUljbzl2RTRrMnA5UUxVVnl0bFVhRXp1UElZdVdrc0d0?=
 =?utf-8?B?MTVmVDR2QWk1azRWK1J6NXYxMEtFdUJGM1BXdFIwWUFlbjIvWXpibjBrSTlI?=
 =?utf-8?B?QWtqZW5GS2dVcUdzWHJ4eVdMOVVib2ZCTTk3b2FYYzVrQXVxc0MzQmgrUzZE?=
 =?utf-8?B?dnNBaVRhbXFtU0pNL3JyNFNSaXhuL0h1aFJSUys0U0tjSVl2WlpidkhuWXhq?=
 =?utf-8?B?RmJXYnRhc1pTSm5qL3kxQ2RhaHNjL2N4aSs4ZUY3WlhOS0VUVzd4bFZLR0ZJ?=
 =?utf-8?B?cDFqY3llTFRLelRjMHZ0N1BwYnExT0F6c3ZscW9QdVVkYVhqS3dxcXhtaUZV?=
 =?utf-8?B?cG5rRjJtSTlQUDJFeHJ5Qmxkc0R2cnRjR3doNERzTjRCQUltYVpwL0tZaWZl?=
 =?utf-8?B?bGh3cUNqSGMwckFsbkh0SDc0eTVxeGFSWThlUVRmaWRVVTR0dnRKZDFRanNt?=
 =?utf-8?B?R3BRakpFWFAvV1puaXBKUXAzK0hTVjZFYTVmc3A3Mzh4aDVZMnZ5WFNZNDRp?=
 =?utf-8?B?YjFhM3Y2VFQ1TXdueGo3cUZOV2Y0TUlSdkxzMVhyb1RsaUZmUXptaXhHSFpZ?=
 =?utf-8?B?MHRFVjdFTGtlMld5WFRVUHJZTWFWdUlPZzc5WEY3a2NCL3lUck5reHVSb0FP?=
 =?utf-8?B?VkE0b09rM0FXS1FCLzRhZWE0Yk94RURyeVVnLzhvVE5SWTF0UUd0bHllY2tK?=
 =?utf-8?B?RU5nK0NISjEyMHp0MFBrb01jS29sM1RLVEd3c3g0SUlDeGExL2J1dz09?=
X-Exchange-RoutingPolicyChecked: BlncEDwhORNvVr7SOCnotzG7zy5DqrNe7/5CGXC1oNCdeTUtBrjN4P30GxYY8yOIAg2fxI9dJBHrej09aR8XaIrts593/hK6P85Lx3tSuRCy6DZjH9DGAnjyzuG0Hk2Q6Sff6iUruqvrA8vSxKmRqFc6s/voHxVa2XD3ezB76kt2bcakr9zvQ+Nb2SKrCDhIzL/VOfVnUzhKL4OkQYT6GllUQIkVX/DlLcVZ4UqMqdgca3EI7roCIYJLtGoid/DpIS1+5Lc3ATfXIBXwEAtDXrY9Y7xJo4hdGQCrhbhdra3UxfGuCFRGrF9yzzV2p2buhoa4lUtUvPxxTeQNbjWgqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db30683-2cfb-4122-4c2d-08df0f37aebd
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 12:33:14.0243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCFrajMTUAN80JY2XKVttFmI83m2MmBOLnJNuC6ta96PPjShF6KJJkTSs4meRKNDoMIGbN2Gy89yR2fLjxJOlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7533
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


On 08-09-2026 15:42, Raag Jadav wrote:
> On Sun, Sep 06, 2026 at 10:56:06PM +0530, Badal Nilawar wrote:
>> Introduce xe_emit_hardware_error_cper() as public entry point
>> for CPER reporting.
>>
>> Wire xe_log to route hardware SIGIDs through the new helper.
>> No functional change is intended yet, as the CPER emission logic
>> is added in follow-up patches.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile  |  2 ++
>>   drivers/gpu/drm/xe/xe_cper.c | 37 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_cper.h | 25 ++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_log.c  | 17 +++++++++++------
>>   4 files changed, 75 insertions(+), 6 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_cper.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 67b8b5477639..06b064add77d 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -166,6 +166,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>>   xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>>   xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
>>   
>> +xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o
> Why x86?
Will change to  CONFIG_UEFI_CPER.
>
>>   # graphics virtualization (SR-IOV) support
>>   xe-y += \
>>   	xe_gt_sriov_vf.o \
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> new file mode 100644
>> index 000000000000..e8017e3ee3a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -0,0 +1,37 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <linux/pci.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_cper.h"
>> +#include "xe_device.h"
>> +#include "xe_ras_types.h"
>> +
>> +/**
>> + * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
>> + * @pdev: PCI device associated with the Xe device
>> + * @cper_sev: CPER severity
>> + * @sigid: Error signature identifier
>> + * @error_class: Hardware error classification details
>> + * @response: Response of get counter
>> + *
>> + * Emit a CPER record for a hardware error
>> + */
>> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> Why the long names? Can't this be simply xe_cper_hw_emit()?
Sure.
>
>> +				 struct xe_ras_error_class *counter,
>> +				 struct xe_ras_get_counter_response *response)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	if (!xe)
>> +		return;
>> +
>> +	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
>> +		return;
>> +
>> +	/* TODO */
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
>> new file mode 100644
>> index 000000000000..c4be7f25a369
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_cper.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_CPER_H_
>> +#define _XE_CPER_H_
>> +
>> +#include "abi/xe_sigid_abi.h"
>> +
>> +struct pci_dev;
>> +struct xe_ras_error_class;
>> +struct xe_ras_get_counter_response;
>> +
>> +#if IS_REACHABLE(CONFIG_UEFI_CPER_X86)
>> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +				 struct xe_ras_error_class *counter,
>> +				 struct xe_ras_get_counter_response *response);
>> +#else
>> +static inline void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev,
>> +					       enum xe_sigid sigid,
>> +					       struct xe_ras_error_class *counter,
>> +					       struct xe_ras_get_counter_response *response) {}
>> +#endif
>> +#endif /* _XE_CPER_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>> index 5549ef6966fd..2957adec41aa 100644
>> --- a/drivers/gpu/drm/xe/xe_log.c
>> +++ b/drivers/gpu/drm/xe/xe_log.c
>> @@ -8,17 +8,27 @@
>>   
>>   #include "abi/xe_log_abi.h"
>>   
>> +#include "xe_cper.h"
>>   #include "xe_device.h"
>>   #include "xe_log.h"
>>   #include "xe_printk.h"
>>   
>> +static bool is_hw_sigid(enum xe_sigid sigid)
>> +{
>> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> Shouldn't this be
>
> 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_GPU_XE_HARDWARE_END);
Ok.
>
>> +}
>> +
>>   static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>   			  u32 component, u32 location, const void *data, size_t len,
>>   			  struct va_format *vaf)
>>   {
>>   	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
>>   				   component, location, data, len, vaf);
>> -	/* TODO */
>> +
>> +	if (is_hw_sigid(sigid) && !IS_ERR(data))
> Why not !IS_ERR_OR_NULL(data)?

Ok.

Thanks,
Badal

>
> Raag
>
>> +		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
>> +					    (struct xe_ras_error_class *)data, NULL);
>> +	/* TODO software CPER */
>>   }
>>   
>>   static const char *log_unknown_component_prefix(u32 component)
>> @@ -100,11 +110,6 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>>   	return buf;
>>   }
>>   
>> -static bool is_hw_sigid(enum xe_sigid sigid)
>> -{
>> -	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
>> -}
>> -
>>   static bool is_sev_error(int cper_sev)
>>   {
>>   	return cper_sev != CPER_SEV_INFORMATIONAL;
>> -- 
>> 2.54.0
>>
