Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD0BD711CA
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 06:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D59C10EE21;
	Fri, 19 Dec 2025 06:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zvu82QpV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E5210EE02
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 06:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766125085; x=1797661085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8IQNtL12yrTkCb8xXqb00omtzNMtgtY5eFNpRv2aW9A=;
 b=Zvu82QpVzZMYH/ohgMIqI9EVbfoyQ5FabLGit7/rW9Zkb8SrKSYrqubQ
 7n7dNZlHa8/FzPiZQPxIc9H31H/8zMJtpGueUEWD0whS5gDIX7Ob6aied
 jFGC5UeClLwhRrbp/pm9nn8RUc7TOvScQdpUtrXcl4OPh2O9kqgUzf2Hx
 KQVZspn4WIJ38xo4NsSdF+v75Fux9UGOh8iKoy1B/LtIDz3xRUdd6HZLQ
 3zi9e9YcxXgfQR/7qzwe35xNl7WkxeS3j37yhpU6UwA/lhjNpu+LtU5KX
 FkrJmu6wLSgyLNgOIa6wsQMTYRydkUOJFA6G/wlmv9fvV5XqvippFQBAa g==;
X-CSE-ConnectionGUID: q3VhVpTORMWx6VlGPW2MlQ==
X-CSE-MsgGUID: U2xLrWbGSN26EOqYQ3YXhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78402562"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78402562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:18:05 -0800
X-CSE-ConnectionGUID: p1Akh8nhTQOXeCAW2tVJuw==
X-CSE-MsgGUID: +jul2c8PTLuNVzWh3TCkMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229819053"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:18:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:18:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 22:18:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:18:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvRvpCWYFW/FTNUXHGJd8izvhQgmIWXG5OZXujLrk0pWp9bC86hu/Bhetgol59/g57I19HW4CjyWDGZgVTCKZGnnD2T/r77nS70z/rKGocrw+UHyKVW1W5vc+MMfPAq13yb2xOl8Hx43IBhZhp3Yfo3KW/tLEn6Wb/OUu3Z2ueZpfvR3Z6BkU+MeKdGvJDRM4jnFemMV99nlIgRUVe2OBXJaU4Eb5WVTMrLLJ5BJnjBzoEDf1WcS6nw9WVoDJh+TxxDpGjDuLA/rHe8vf4CG0gNiYMWBhyPLEKzYU19rZaxI67JXwtoQPEnyZ545u1rVQXKKSgwHCaXHn+0koHE4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gt2eEPh6OBYIvNq8eNWjohGOQDAs2HFvEaY9l3ncuE=;
 b=aS/1x2/sHyo432oNfudrpUkRlw3PX7QBAoJLkTgP3dl6zCS+nbVN4mUXJBCh7HASXC6oRxngyf9YGABIAOoWARSbK96ylMyUno8BpX9MkCjILJYBmZJaoPqBleosoGPjrVIxqKbChTF7PlMS+uQ/3bRpdPH+yySaxMUAvwVb8QPCujkzVeRvR+1nQxrdVLmv/fzIvbqYizI49BGvwJeufx3qlR0mrVtRf29p4LW96wckOJjyW220xOzJ7iwcBX7CvQd73HqPDg6+K+KEdXxrLgVYWwMcT/1Q4V5DerMEC+QbOieYaoWIoz3BlHBWEi3QaHfyVsuelHtUnoctD9G8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:18:01 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 06:18:01 +0000
Message-ID: <34f6c44d-a238-492e-9707-a40452f671a8@intel.com>
Date: Fri, 19 Dec 2025 11:47:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/xe/soc_remapper: Use SoC remapper herlper from
 VSEC code
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anoop.c.vijay@intel.com>
References: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
 <20251216074159.2788534-7-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251216074159.2788534-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: af9f0d8b-4745-451a-7b8d-08de3ec65cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVJMamVjTlFFWnRGZGk3SEtmV3lZY3BwL3NRV3pCRzFQemlNczlvcUFNZXlx?=
 =?utf-8?B?MmxyS1Rmc25BN0p3L3g2VVRKbTM2bWEvQlk2QVpQeEhWNVR6VmVHaXFwNmFG?=
 =?utf-8?B?M21ZNThBZVFFUk0yaCtkKzUvWGVyS3ZTT09OeGR0ck5oWHRTdFBmeFZpNzBs?=
 =?utf-8?B?NG5RcjM3QUJwdU11amtDWGFMOFJaSS9XVE96WUpKeXdtcXZDbGpsVm5UcDhB?=
 =?utf-8?B?bDBheFdMZ3MyRWZUbkdyQVdpeDdMZ3IxRW5xOE9uMEw2YVlSc1E4TDQza1Rm?=
 =?utf-8?B?T0JadVNyWmlpTHhIQjVaS1h6dmFDa1NXQ29zdXVsSjlVTGFTZEN3bnJ2a201?=
 =?utf-8?B?bDBIVWZPN1YxTmpTVXpSWDUrQ2FKc2M4SHBzSUNIUmY4cWcraGE4cDR2WlVZ?=
 =?utf-8?B?ZkpldjFBUHFGOVZubG5qYU53bUZpTWRPUlN5QzdFWGcxWlF0ZUpqVkxTSkVT?=
 =?utf-8?B?bTJ5OExFT2dWRVQxRTI4Z2NpQnhqeURrc0JnT0tiUVlPSDhUc1piRGovb2d1?=
 =?utf-8?B?dXRLd0NnWU9uVDNCV1dMMGRER2hDQ3F6NUg5S3M1V0VVM3JnK2VsVTJQMm5o?=
 =?utf-8?B?UjhyY04wVnE0RndQQ21VdDM2UjF0Zjk1d1AzQURkYzBLTE9GQU5qZUpGdUI3?=
 =?utf-8?B?ZVBBdzU2a2lOVy9SdndoeGN6RWtKZXltTVRMVStoRkRGWmxnUjJDT1RyUlFm?=
 =?utf-8?B?eXpxQUZDWC9TVitwOGUyTEZWdGpGamhuRWV4aFRxRC9ZY3JLcEZCaDRiQzVM?=
 =?utf-8?B?S2ZjNE5Qa2hBZFBuYVV6TWpsMWJFN3NtQVAvUEFqK3FHYk00U3RwMm94dnVK?=
 =?utf-8?B?L3M4Q2lFdTdTMWN2NEhwS1Nrd1NraDdpVTlZT3FtQUVuUkJ1eEVXeXc1YnpM?=
 =?utf-8?B?Y2xBeGRmVHRnZGZjRkE5aHlFcnZPNkMvaU9PTllkcEtMSlhUS293MEdIWlpM?=
 =?utf-8?B?dll0bEdCZjlEOGVWRGFrMFdqY1R2VkQ4OEg5cUw4enNGbFFraWp2bDdJdDJ1?=
 =?utf-8?B?Y0pOcUFtM3lsOWdwTnluaVlVUytFQnJYRjlxNlFCZWcvbVZzZVNtWlhJZ3ZD?=
 =?utf-8?B?eW1uWkRXVk1wWmR2NTZucEpOK2MwMmVQQTVDRktaWmI0MU14VWlxTnRWbndz?=
 =?utf-8?B?L05wbmR1dGdBTFUzVkkwQmVUUTRHVmFXRW05bTlseU5ZS0FNdHRqUTBGcGRW?=
 =?utf-8?B?bUhnKzgwUHl1U2RGbU1NTUNVSlFlUnlFRHJpRFlueHdFd1J6b3cyaDh1bzFX?=
 =?utf-8?B?MXZtOTdzd0hwRlNDVFlQQlE0QVhjSURodmd5NGdWT1k2NWpYOFFaVmxCSlJO?=
 =?utf-8?B?K3NhV1psaEQzOHRWNXlpV0owR2h2S3JVQXg0VDJyZ0RxWVo1cmdKdFdTc3Yr?=
 =?utf-8?B?bDViU09WNERjK3JjSFFyWENsVW55U1pGdTZEQmxnTGNNMHhDSE94S2E1YzZZ?=
 =?utf-8?B?SkQ5YmNaWWRuWG9ZSjNObGlsaHlhZmpnSXpRbGhrQmdlK2hVakdCUExTTHFX?=
 =?utf-8?B?QXpTUWQrNks0bnhtZ1lTL1VhejBTT1pmNWJZalFlakkxcXIwYmhuakl0QXBY?=
 =?utf-8?B?YjZqUWw1NEdMVUJFWCsySmhwM0ZobXlpSjdsdXFxRllaMmZXUXpQNkF4a0Zn?=
 =?utf-8?B?T29mOXRxUUszSE82anNqTGR3a0dzdFovWUFHQnd0OGErVGN1N2ZVbTV5eHlK?=
 =?utf-8?B?d1BEQkpBam9uMFlSK2FPdHRZUkZOaHZXM3JzRmUyYjJwWnRHRDAwRlJNL1kz?=
 =?utf-8?B?eGlOZGZ0bCt5b2Y4MlBITmxsSnVQR01OTXpUeTFYUDcvWVBiU2ZlYTN2bWpz?=
 =?utf-8?B?WE1GaGJMWUhJRUl6cE9wSU9jTE8yaGpPR1Z3aWNGdjVPK2ZBNE1BTkNtNlpT?=
 =?utf-8?B?OXNxSDE4M01LZmVmbVlLdVNQVE1EdnJZUmRpUk1oRUNRcXoxcWJvcVNHSHNp?=
 =?utf-8?Q?MqC9hfCopAxQRH8X01KFqU8tj7Hg4DJv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDhCeFJOb3Q2SXFmZmFzd0VDcUEvbFliOVUvS05sbW8rckJOa1dkdDNnU3B1?=
 =?utf-8?B?WG5tOWlySjFVOHlwKzJKMjVkY3RCV1JOMXN1dDZ6Rmc4M0ZoRkN0VDFtajlp?=
 =?utf-8?B?M20wWXY3bWR0cUY2aHA3Z2wyZ0o3WjhSZVFtQ1ROQTZSdklLSkxTbWdNM01L?=
 =?utf-8?B?YVFLNjF1cFhEeTZka3JpaEFCSmp3SmJDY2hod3MwKzBaZ0ZNM3dqS3ZRVTVl?=
 =?utf-8?B?Nmp6bExHUFJ2T1dxeVV4R29ZUXRrVkxrLzl4aVFJQVJTeFovYklLa2ExL29h?=
 =?utf-8?B?TUpvdTFuSlFvdmhhMFRZN1paUGU2enV3eERJcE1jQ1pJT1pQenVUdURJWHRB?=
 =?utf-8?B?NFV5blJDMGxwNkZuWHpwTGdNa0tJVzZZVVBSY3hId2RYZnVlYmJONXRJb1RD?=
 =?utf-8?B?aTVWSzlkbVJmVmZsRE5GZ1VLS1h5Nlh4dFgrUHUwd3VmRFhPZzdCazgvTnZZ?=
 =?utf-8?B?aURrNVhwVmxVUkJEZ1g0YjV1U0ZaYUt1NFpEVmFCVGpWQ21UQk1jenptdUxV?=
 =?utf-8?B?cVdMV3JIK0VPN3RvOExZUWdyOVFzZ2lNVXRaOEtLbmtGQllWZ2hDMVRVNW0z?=
 =?utf-8?B?enVXei80UmdsdS96S0s1aFB5dzMrVlA0NXYvWmJTU0JSQVcxUVd3SEdZVTI4?=
 =?utf-8?B?blA4VkhLekk3Vm4rWUlwL3ZTK25zREFtN3dqVG1qdkJNQ21sLzVLWHZTdUdW?=
 =?utf-8?B?S2pEa2dFSGtlbXR4dEtRQndGZC8wYXdaeHdLbFFQMVp1Vmcvcm92ODlHVi96?=
 =?utf-8?B?cDJ2QjBZSmlhalpLdHpVMlgwaktEY2o2dVJ3SUVZQlRDcUx2S1RmSS91aC9k?=
 =?utf-8?B?eE1jNVYyYW12UmNxTXpEZkxHeEVlVHp3NHdYbzNNSVJhNU13dHBxb00wZkdG?=
 =?utf-8?B?eEw1SVg2cG1TNEtZK002VmRTUk11UUk3alV6cFNMeUl0dG5wd1RPTlk1ZGRq?=
 =?utf-8?B?cmJtZHAzcWdPZkVyak9iT1Z1UnZoMW9KRVRRcExlVkliVkxrTlNEc3I0SUJy?=
 =?utf-8?B?S01NWTFJM3czY3cxWWliU1hUeE5MeDRYWDEza1o1bHhyV2h3VEVBQkxNci9r?=
 =?utf-8?B?Y3pWenlGWXg4QXlPTXlSRWtBTHVKT0NGY1pSQWgvL0xuY05ES1FxeVI4ai9v?=
 =?utf-8?B?bnhKbEVObkx1N1hBbTB4V3lTZTg0enJaMWl6TGF2cmEyWkYvdC9pZ28rUWlp?=
 =?utf-8?B?R3NTY3hkTWpRNTlMN3RsL2ZONmZuT09qVDc2MWpsVUN6S0gwdzArQlp6aC9j?=
 =?utf-8?B?NE9iZUdVSFFnSnA2ZzY5c1djNzJjZHgrSmMxcCs1V0lNOEd2TzF3ZDc0SjRV?=
 =?utf-8?B?eWZTRkZyM0RXbTJ4Qlo1TnVCeTFXSzk4Y3BVU2VKUnczczhTNnJ6MzNEUHhP?=
 =?utf-8?B?Y2dtMmRSVDhwd2czaHRucjMwL2xtSmc5eUhVR3JsWFI2UVl0bUNtSUt1VjND?=
 =?utf-8?B?eGNlVTlINlVGSTVTd0Zyd0dZaEtRQWNKbjVPODNqM29qampaMVNxODhtTmhH?=
 =?utf-8?B?TWFvUUxMT1hIQTA0K1dkVmR1QkQrS095OFEyclV2ZWxVUW8xUk5zbFZVOU5t?=
 =?utf-8?B?dFFWMTR4UlRFQ3F6eGw5MUhMQWpudUdhRFZMSEhrdkJmOGlwMUtxazZHVXpQ?=
 =?utf-8?B?OGtEVnB2S3Fac2hnWkppTGFzWFZNVDQ2a1lJZVRQYXNkSUppUHE0QUthd2hI?=
 =?utf-8?B?aGhWNTNOa3hGRXhjSUwrK001V0tmNXMzUFR6azU0WXJwMDRvNEZMaldTWTll?=
 =?utf-8?B?Snd3dXdKREhiSTB0NzRWV2p2ZTVoRXJZQzQ4V0ozTWhoOWFna0c1Zkw2cTYz?=
 =?utf-8?B?c29aSXhaUXdaK0l0bGZWK2FsdXJtWmVRWXV4SzRLQVhCSnYva1gxaGI3SHRI?=
 =?utf-8?B?VVBWdjYwNFg3OThReXVVUW5xZWV0RjluekFDcS8yYUhGeTQzRW90ZndyaGgw?=
 =?utf-8?B?NjJrV0YvdHFjNUtjRnhMbk5xWjhCdXQrM05oNzZHVFpBR1lCOWI4NlkvKzcw?=
 =?utf-8?B?OE1FKzJZS0FwWjFrdHVIdDlhczlHYjFzQjZiemtLczdLU25nVlAvTW1aSFRm?=
 =?utf-8?B?TkczYW01RmloSmNaTVRqZFVkaXl3V1RTSVlGZUtQVEJuVkdNRGxPL0xCdmVs?=
 =?utf-8?B?QUZDdzNaaXpyK2VVNUdMYkpQS2s1WitFbFFDVll5Sm5MZ1FGQ3VEaTVPL0xB?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af9f0d8b-4745-451a-7b8d-08de3ec65cc2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:18:01.7201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2fVmoyB6cYVie1eTDlHgWyT9/tzVU+gF68wazgOHbTTAII0Estjg47lMCNi/KR+imlIoF93CqNHqF5J8gvfEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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


On 16-12-2025 13:12, Umesh Nerlige Ramappa wrote:
> Since different drivers can use SoC remapper, modify VSEC code to
> access SoC remapper via a helper that would synchronize such accesses.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
> ---
> v2: (Lucas)
> - retain comment
> - s/BITS/MASK/
>
> v3: (Michal)
> - Use scope based locks
> - Add kernel doc for functions
>
> v4: (Badal)
> - Prevent bad accesses to SoC remapper
> - Enable soc remapper for BMG
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 ---
>   .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 13 +++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h          |  5 ++++
>   drivers/gpu/drm/xe/xe_pci.c                   |  3 +++
>   drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
>   drivers/gpu/drm/xe/xe_soc_remapper.c          | 23 ++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_vsec.c                  |  6 +++--
>   7 files changed, 48 insertions(+), 6 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index 0f79c0714454..240d57993ea6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -18,9 +18,6 @@
>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>   
> -#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
> -#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
> -
>   #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>   #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>   #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> new file mode 100644
> index 000000000000..9edf234227a9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef _XE_SOC_REMAPPER_REGS_H_
> +#define _XE_SOC_REMAPPER_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
> +#define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6da897b9f006..fc121b236dd9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -333,6 +333,8 @@ struct xe_device {
>   		u8 has_pxp:1;
>   		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
>   		u8 has_range_tlb_inval:1;
> +		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
> +		u8 has_soc_remapper_telem:1;
>   		/** @info.has_sriov: Supports SR-IOV */
>   		u8 has_sriov:1;
>   		/** @info.has_usm: Device has unified shared memory support */
> @@ -577,6 +579,9 @@ struct xe_device {
>   	struct {
>   		/** @soc_remapper.lock: Serialize access to SoC Remapper's index registers */
>   		spinlock_t lock;
> +
> +		/** @soc_remapper.set_telem_region: Set telemetry index */
> +		void (*set_telem_region)(struct xe_device *xe, u32 index);
>   	} soc_remapper;
>   
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 673761c8623e..555a1c3b3841 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -370,6 +370,7 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_i2c = true,
>   	.has_late_bind = true,
>   	.has_pre_prod_wa = 1,
> +	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
>   	.has_mem_copy_instr = true,
>   	.max_gt_per_tile = 2,
> @@ -420,6 +421,7 @@ static const struct xe_device_desc cri_desc = {
>   	.has_mbx_power_limits = true,
>   	.has_mert = true,
>   	.has_pre_prod_wa = 1,
> +	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
>   	.max_gt_per_tile = 2,
>   	.require_force_probe = true,
> @@ -691,6 +693,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
>   	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
>   	xe->info.has_pxp = desc->has_pxp;
> +	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>   	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>   		desc->has_sriov;
>   	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 3bb51d155951..e2bd4c81b2a7 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -53,6 +53,7 @@ struct xe_device_desc {
>   	u8 has_pre_prod_wa:1;
>   	u8 has_page_reclaim_hw_assist:1;
>   	u8 has_pxp:1;
> +	u8 has_soc_remapper_telem:1;
>   	u8 has_sriov:1;
>   	u8 needs_scratch:1;
>   	u8 skip_guc_pc:1;
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> index 8a6749918436..1baf5d38e4cd 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.c
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -3,8 +3,23 @@
>    * Copyright © 2025 Intel Corporation
>    */
>   
> +#include "regs/xe_soc_remapper_regs.h"
> +#include "xe_mmio.h"
>   #include "xe_soc_remapper.h"
>   
> +static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
> +				       u32 mask, u32 val)
> +{
> +	guard(spinlock_irqsave)(&xe->soc_remapper.lock);
> +	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
> +}
> +
> +static void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
> +{
> +	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_TELEM_MASK,
> +				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
> +}
> +
>   /**
>    * xe_soc_remapper_init() - Initialize SoC remapper
>    * @xe: Pointer to xe device.
> @@ -15,7 +30,13 @@
>    */
>   int xe_soc_remapper_init(struct xe_device *xe)
>   {
> -	spin_lock_init(&xe->soc_remapper.lock);
> +	bool has_soc_remapper = xe->info.has_soc_remapper_telem;

This flag not required in this patch, please drop this.

With that this is

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

> +
> +	if (has_soc_remapper)
> +		spin_lock_init(&xe->soc_remapper.lock);
> +
> +	if (xe->info.has_soc_remapper_telem)
> +		xe->soc_remapper.set_telem_region = xe_soc_remapper_set_telem_region;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8f23a27871b6..eded4330584c 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -162,9 +162,11 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>   	if (!xe_pm_runtime_get_if_active(xe))
>   		return -ENODATA;
>   
> +	if (!xe->soc_remapper.set_telem_region)
> +		return -ENODEV;
> +
>   	/* set SoC re-mapper index register based on GUID memory region */
> -	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
> -		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
> +	xe->soc_remapper.set_telem_region(xe, mem_region);
>   
>   	memcpy_fromio(data, telem_addr, count);
>   	xe_pm_runtime_put(xe);
