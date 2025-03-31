Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC50AC3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 12:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F5810E3F0;
	Mon, 31 Mar 2025 12:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PI8YE7bt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01C010E3EE;
 Mon, 31 Mar 2025 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743423972; x=1774959972;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=fBfsnzaz9aBea/aKQLmlFYbMaSkhsqPBs1/F3k4HZLY=;
 b=PI8YE7bt3lrUzRk5q0J5VGPmKR5KnDytBRYn6Ne+pABGhk6RytKq8Ydh
 3xFZZg48NvEErJ6Qvv8EpourMlhd9Cs3Aop1X7Wjf+//jFTTTJLD/NxTo
 ttwgkmkL4WVUX7KerEY5s4axH3PyOLsR/LpZrp/yqUmCS1E/YzL4YoG+g
 MY6xZc/RzEcrgitG0rR8U2HQEBYi3mfnxukyL7sgDvwfFRyNmbm7f9eSc
 I9O0fyT8pZHjx9ZmTmi2rskDqPGn/YX18A89voPb3eWykK3qBwtdHE0t0
 v/WITbB36BGVS3OJsgdEVrBcLOy16NjgFloweobv4R+Pp1CgPOkr3JtWO A==;
X-CSE-ConnectionGUID: cwPJcEioTEuyf95JAZVXBQ==
X-CSE-MsgGUID: Gqf1owMJQ8OSlp4PxdPGUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="67187259"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="67187259"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 05:26:11 -0700
X-CSE-ConnectionGUID: hCpXZpVrTgiYgEl7IhdJSw==
X-CSE-MsgGUID: EPxOcyzTR/O52sf97dvR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126303101"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 05:26:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 05:26:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 05:26:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 05:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5K+uyuUBo5/iMp1uMbX3zaJUOxWCfzDyHd7emv86jzKbjDTKhEn2XH3+OopsJlpLKNITtktD58WsTRPUAFtuEhcxdqxSE+Rkbahzso0G3QEn193PTgP6/eEIAvSSWMWusRXpDSU1HOFopxk7dDpWj2yV3YRs+sgDbad47zxSIBjXkgBpLuj4vj90uRwme6sfVikaWLOAcZ/eeZLCEP5BEVZKincHD4my79ERggT3djdK/WrtIfkfkABuyne/45sxl/6eQMyeQTHTC2ZcHf0xCzc4+/KOH8iboF0MqnvbqnxImnHWm9YIGkEKLBbD2JB/NtpRTnM2DTbx5P9zheh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sakm0cDUn2zjuZq+zOcsj2YfeFBLQ7pxcPPXsYU07ek=;
 b=ej7kSEhqsW78kNMi1A8ntmoYVgEAhjc8OwNhntNHOIBJzrHZFuZvo808QZ5T1ZmfSCwM/5SKQYCSJ1SvtheeS2yPYChEuq5YFKMAvNCvTLB6kR8mH2zIiynPiTTP6gsryQ325gMfvnXcQmnF8Ia/tnJcA2GiHBjchrFpkKJ5+WeS+86cvZ4bW+rzxjCc0Q24WyUoMWOQ5XvDJ280M3BVjt/k3zJgl9pTfGAUhTodgvX18Kvc2Dk0pfTsve6Zr1S/TqMDw0oWP5fOumSyL6TmX0DZ5zwnw5ZbA2FbU29BUo/Kcsrx8A/jJ5F3Mv/Ivs7TqWOxeZF00LerWYGOAu90/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 12:26:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 12:26:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174324046232.17810.2186731408193589187@e6b6f09ec485>
References: <20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-v1-1-ceb9ce7c8bc1@intel.com>
 <174324046232.17810.2186731408193589187@e6b6f09ec485>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/xe: Make PPHWSP size
 explicit in xe_gt_lrc_size()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Mon, 31 Mar 2025 09:26:01 -0300
Message-ID: <174342396193.1873.13338596709689658292@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:303:b8::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 966024fc-5ed7-4614-8c99-08dd704f368e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0JJcFNjc0tyem5BZTkwaDBaYldRaTFFZndvK01pMlJ3MWxEdE9IeVo3TGtu?=
 =?utf-8?B?RVpnc29BNmIzMmJZcmZqV3JnMjJQYVpFcU5HYWlYc0NIU2RSV2NyTC83UDFU?=
 =?utf-8?B?eTNYK1VlazlxQXp2WDdXSWVETDNYbTU3MXhhYXc1WmlKWk1teS9TZEMxdUdY?=
 =?utf-8?B?ZUVhbFUrR05DdU43Y3FxdTkvMVBkUTBzS082aDI5ZThsYTVib05HcW8wazZy?=
 =?utf-8?B?aytmZGRER3JTTnlGRnBiOUZ1eUt6dy9kMEFVMW8wUXRsZ2RGNThrSHJWblZm?=
 =?utf-8?B?WmpaSEYwZms4ZVEweGpadU44anlQL3UwK2Z1QzAxb3JXRFRaWkEwQ25reStk?=
 =?utf-8?B?MU4rTG82ckVWTmpMQzY3WmlUUHVXZjR5Qi9pU0ZCL3dMcWx3RTlBOUlzLzdC?=
 =?utf-8?B?dHdlTi9EN1Q0MDFiKzE5MjNVVUJGQ050dCtLTTR4OHlZTHV6NWM4U0xVM2Nh?=
 =?utf-8?B?VDgyOGYyMm9FSDhxcFp3NWs2MVlsT1FTT0dCcmt6QzBSYkI5alRDTmhGZGNW?=
 =?utf-8?B?R3pSTnY2cVRpWDdlTlB4cDRjelNOdE96N2tiaHVQMk83eGRLSHdKdnBtM0gw?=
 =?utf-8?B?U05NclRXZmJSR2hML1FpbUc0Rko5V1M2T1VDWFdkZWJTMC9ZbXBra1RaU3Fl?=
 =?utf-8?B?Z3VnZEpCeUYxR1p2UnFzU2szaUgvY2VvbktvMkpWU2k0bGpUQ2hsTTVtZ2NU?=
 =?utf-8?B?RXVkMVQwczRDdVhqNmdXR0pVTHlSa0I5WVRORFduKzgva01tN1NXTnZ4WHBO?=
 =?utf-8?B?bG5vdkkxS3pjbUtQeFpIUk9zVEtOMElWd1NydTMxRkZKaUgyWVVZQmVscHF4?=
 =?utf-8?B?cHRycEJISFViNkNQRGErWkI4ZXZHc1ZITTVpTVBCZFZlUDJMaERhR3hpRG1j?=
 =?utf-8?B?Wnl6U2YrSnNwQmptRmEydXgrbkl2dW55MTRaNnpQZ1NXVWdGUWpRZ3BmWHRh?=
 =?utf-8?B?WjRXdjhsR3JMNEdDM3JFUmRUb2orMXVvdWxXM1lVcG1xbWJWR1o5YnEvQTJx?=
 =?utf-8?B?U3NkaGpxTjk4bjEzNE90WGxzek9Eb2htM1B0U3N4aUtqUGh5R2NDR3VySjht?=
 =?utf-8?B?Q0Zkays0Wm8wMURuVVVMbzdNbnllMUkxcDZYYzB2aVM1SjVvSjhsd3MzM3cr?=
 =?utf-8?B?bUpKVWtMNkV2WGF3OHpnQmFQK0REcWlzV0w5SXZ1d2x1dmNNN1BQZ0wwTlUr?=
 =?utf-8?B?a3psZlVMNFBFVnU4RkJQbUcvNTQvOHlVQkNpY3FBTXlrQTZVeHZDbjd0OHlz?=
 =?utf-8?B?ZElxMUV3Z0hDMTVibFpIUGlZU0dKZlBtNnlGbmJiSTE4dmRzYWNSb0V2RUFX?=
 =?utf-8?B?cG55TFhXOW0xcDRXSVdzYTMzdnJ3NWw4c1lzVUNzbFBHcis4R3oyUmp1VW53?=
 =?utf-8?B?ZG9qNnlEenNON0djdE5Gb05jd3lyRkRMUytSekpPaDJTdDZ2SDRCdVNoUVEv?=
 =?utf-8?B?QVAxNXNFczhiV0UzRXY3L3BUTlZMbXVBNVFCUmhDSmFvZTNQcVozSi9aRFlH?=
 =?utf-8?B?RlpJMVUyeStKLzdyUVlpZkZMRW40SWZHaWFMd2MyMzhuOXlyNEdFaUIxQ0gx?=
 =?utf-8?B?VWtObFBhZC9LdlRNeU04QkRRdnlzZjZMOG1kZkZJSWozNXdVbitxMWdQc2p4?=
 =?utf-8?B?azRESUZURER5OEJVVUVMQkIxaUJLSU4xeldXV1RGUDVwWmFIV0RkTjBzKzRK?=
 =?utf-8?B?ZW80NFVqZTdYajZZVG1TTkM0dXJsZSt0ZFJrRGpGZ09aSEhhTXQ1WDhGOE95?=
 =?utf-8?B?TzVTdGI1UndMTWdWOEUzK3I3akVPeGdxUGpCRmtWYkUyNjZPN1pWM3lwRzEx?=
 =?utf-8?B?dGdSNUM0MldRaEg1QURRdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U09jWHFHUWl0Mk5WVVhSZG9mMHBDcDBzTTFOMlgrdUx2Z1lXa2krbzJIWGxl?=
 =?utf-8?B?bmN5Wno3V3owUzdoMGxCa1JQQk1JclVBWWFVL3NOSDdKQXF2Z1U3QWpFdzF4?=
 =?utf-8?B?bXNaMzNqd0xuN0c2ZUhPNWxjem1ZU2x2Y01QOEJaNkJ5QU0xQ2hDbk5za2Rp?=
 =?utf-8?B?Q0k2ODRFazU3UC9VMG8wTnJIQXNWREFiWDI5Qm9tUG9lS3BHQXhETmxSZzFD?=
 =?utf-8?B?SUs3Qi9XTHpuOTRPNWdOOEJ1SG0zU3k2RXpELzJNMTNpaUZvUHdGK3AvR3dW?=
 =?utf-8?B?UFZTeFJ6cytVUnRCM1pKeWEvSnFWczZuTzVKeU9LbXZQVXVNREh5bUVEU0N3?=
 =?utf-8?B?Wi9UbUM4VE5uNkhRU25oWVRKRDFFTlN4d0x2WDgyTTJ4WS94aktvNUcyY1VM?=
 =?utf-8?B?ZzhDc3BLT3lqTmQ2VHhzaXYyV1dGY1FFZWZpTmRBem9takJWREk2U2xJOENx?=
 =?utf-8?B?WWhtNkY4dEh3NjdKNTduVlYxSTVhVThVeDBDN2tIZ3czUUVpampEMmh5OTdt?=
 =?utf-8?B?L0tIRGVTVC9lb0JnT3dZNVFxMXpTRVhCRlJtR2xKZXpESFprUlBNRVliaUx1?=
 =?utf-8?B?ZHJxaDUvTWNOdmx6NVNWRFFGbm4vbkU4dmhNY3N4NTV2VVUrTkpOY25PSFd4?=
 =?utf-8?B?blMxUDAyRGprYzZIVjQ3VTl1c3JOZ2pTVmVOQ0hQcWxRMTBNZlJreUI3Wkkz?=
 =?utf-8?B?ZXBXUVdpelRGV2ZnUzlMQmVPc3UxKzNmdnprNzZpV2d5QllQaURVS2FYMXlj?=
 =?utf-8?B?NnV3VHdhUGt3Y3ozNERKYVdNUTE3S0pOMjdNZmZ3S2JSeWt1RGV3MlkzR0I3?=
 =?utf-8?B?QTQ3NU9mN2NqVUJzR0JEblQ3TUJITUhFdlVRdngxdVliaUwrdm5HbTA0R2tL?=
 =?utf-8?B?SXZjdGdlTHJySEYzcjdsODdqMDByNXNYQVJGTEdTaGhlSjdKcnZTTE5wc1pR?=
 =?utf-8?B?V0tWNEFhMUkyelVVZzJieEZyM1NrRGJJWVdxSUliVFJwVzREam4xN0RCSmhV?=
 =?utf-8?B?K2thTStrOXNtWFlFMzVtS3lrOEU0TUF1ZVNja3NoVkVub1pNUHluTVd0YXpT?=
 =?utf-8?B?dmRibUtmWmFjWDhmd09ZL2JERCt5MWRpNDFXVHQ2U2dDL2RGTm1KV1JON0pv?=
 =?utf-8?B?RGttbjlKZjBOeWNidHMyT0FLUERSQndyOU1HTWtDeVBJR3ZScmZ6UDgxNTR5?=
 =?utf-8?B?TnMwY2FLV29zWEhDblJ0Y213Qm9tbUVxazE0Ympqa1ZVRzVPV05YYlo4UW1I?=
 =?utf-8?B?eEV1MHA0djR5TlpzcmlkaU9jNzFFMTN2elN3cGJnSTAzKytvdGNUeElCMUJx?=
 =?utf-8?B?Y1Fsc0VOSTVqQ0kvaGdHdHZWazIvdXBacDVVSFNUcVlaalNZcFp3VWUrb1NB?=
 =?utf-8?B?RG1RbDdmSFViRTRGcVRxOW1acUM0YkxaTlUzRTQ2RHZOU1IxbFRRbW51SVRj?=
 =?utf-8?B?VE0vLzYrU2xNYWlDTzE2UFVGNzFQMXJQRFR0dDFJaGw3TnhVUlljNUw0K0tq?=
 =?utf-8?B?bDMrSmN5MTVvclBHcVJOcTJ4czlOUXMwb0dYaXNWTUNHOUdmaldvRVVWRmJT?=
 =?utf-8?B?TjNMT21MM2JpUWNYY0tEc2NsSUpQYmJBZVI1SzNQUEw0QmEwNTEwaE9XMitJ?=
 =?utf-8?B?dmFHTFNlYXBERjNRVGxPNm1iTHRPK2xjWTg0MDQ3SFFZU1NQazR1d0lMekpp?=
 =?utf-8?B?MWJ3WHdoZy9RditEbjVWRDJuTVl5cnhmOU5sOS9wRVBMeHh5alByclZjU3VI?=
 =?utf-8?B?SFhVUHowZllVa2g3V2ovOGlwRjJhYmRBWHloMXV6YWRpTXNoQWFtcnhXeGhV?=
 =?utf-8?B?Vmd6MmFJVEVYNzJ6aEZ0MVJud2hvd0d4Qm1ydXZxazdGWmJJQ1ZSc21OeFUw?=
 =?utf-8?B?UnJFVVhaZ3dVQmhOMmVoZWRBcjdLYVYyam1RT0RVcTJmZlczRHdYVEhTVXRJ?=
 =?utf-8?B?S1pvQnF6Vk1EOGNFcHM5MnZCaGUwVjBSRDE2dTFBWENkaE1RWE9RYTRqMXhr?=
 =?utf-8?B?ZXgyUWp6OElsdEorNkVnUUVqMzVuNCtKb2ZneXMyYTY2WmpjaCtmUTRGWkJt?=
 =?utf-8?B?Mmk4SFJKZjA3eVV3VnpQaTFRSU1VWGNTOTZ3S0RkS2NvK1JQU0NCVk1zYm1i?=
 =?utf-8?B?RXNBSXAyK01Ibmt5MUZvMDk5OGRjQ1RhNEVGQm1TQXdiUjd1Y2R0dzN1UVpV?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 966024fc-5ed7-4614-8c99-08dd704f368e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 12:26:07.9268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mHXsX1NLyBTCqRQVkKMlvOfSjkewBoVgHTzSZCKaZ91A6HRvaLjdWK3TAOhyvbhi/t1oGa7qNdObinzjGbKnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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

Quoting Patchwork (2025-03-29 06:27:42-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()
>URL   : https://patchwork.freedesktop.org/series/146970/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2871-4cac9bb1b5db81d533be95f97dd30c03a8733871=
_FULL -> xe-pw-146970v1_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-146970v1_FULL absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-146970v1_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1469=
70v1_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
>    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2871-4cac9bb1b5db81d5=
33be95f97dd30c03a8733871/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-un=
tiled.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146970v1/shard-bmg=
-2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

Looking at
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146970v1/shard-bmg-2/dmesg1=
5.txt,
I can see the following line:

  <7>[  432.399076] [IGT] kms_pipe_stress: finished subtest stress-xrgb8888=
-untiled, SUCCESS

Meaning that this test finished successfully. So this is probably some
coordination issue between CI and the test runner?

>
>  * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3:
>    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomple=
te
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146970v1/shard-bmg=
-8/igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3.html

Similarly, the log in
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146970v1/shard-bmg-8/dmesg1=
9.txt
contains:

  <7>[  358.222106] [IGT] kms_plane_lowres: finished subtest pipe-A-HDMI-A-=
3, SUCCESS

>
>  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2871-4cac9bb1b5db81d5=
33be95f97dd30c03a8733871/shard-dg2-463/igt@kms_rotation_crc@multiplane-rota=
tion-cropping-top.html
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146970v1/shard-dg2=
-433/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

For this one, the final line of
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146970v1/shard-dg2-433/dmes=
g16.txt
seems to be the same as for the log presented in
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146970v1/shard-dg2-433/igt@=
kms_rotation_crc@multiplane-rotation-cropping-top.html.

That said, this should not be related to this patch, which is
non-functional and should be affecting other platforms as well if there
was an issue in the code update.

>
>  * igt@xe_compute_preempt@compute-preempt-many:
>    - shard-bmg:          [PASS][6] -> [FAIL][7] +1 other test fail
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2871-4cac9bb1b5db81d5=
33be95f97dd30c03a8733871/shard-bmg-1/igt@xe_compute_preempt@compute-preempt=
-many.html
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146970v1/shard-bmg=
-8/igt@xe_compute_preempt@compute-preempt-many.html

This seems to be the same as
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4278.

--
Gustavo Sousa
