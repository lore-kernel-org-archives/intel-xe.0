Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCDAC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 18:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242C910E0C6;
	Tue, 28 May 2024 18:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCo+iyxO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A297310E0C6
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 18:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716921103; x=1748457103;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S15R6a9xqULEVMvL9Ngl16hom4J7t3Raoxy2FWr/fPM=;
 b=KCo+iyxOZyHMfnic7Py+RXT2/jasFdCDM2m708QLx9IqxyBrBPkxHKFP
 rSzEVm/yIxv01DjCHTU01BnOwWpAFVbWSVG1782v2TU6zPwbP9o+U/UV2
 G19SRP7GuHierpG2Qd3y0BHxgYabn4DTvqfhOJwf9WRRNdxya4jerGWVT
 CXJy4kQw9kO7j7GOo62pOrUQULcazoLD80+qxlr5SG21pv57+EfuN19Fs
 qz4HLPpFjSrFYG9mQhtqlbP2AS912F5NQdqYWsW1CMX/FDJCGw6io3LCS
 cEQN94CvWrPvPc+fR+PPaEP5+HEzyedglWPnP9Ldqh4XF/77g2XX4+PN9 Q==;
X-CSE-ConnectionGUID: nYKPSaBDRceVZHv18tnaTA==
X-CSE-MsgGUID: 11/2aROMRuiWIdn5wVZfQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35809931"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35809931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 11:27:39 -0700
X-CSE-ConnectionGUID: L8mw+PQiSEyVvvVLiWSL5w==
X-CSE-MsgGUID: cmqHuyz4QlSU117XpjQEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35231668"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 11:27:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 11:27:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 11:27:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 11:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKJtuBnU95y3zEJuMoFv5kCrYc8q86Wr3T2SpInwtm8r2tYfvYEgy58+inlk0gW3uD1ovTufuCBh+dyLoR1J5hczOj9MBnQiAfUhtblfNhK4Tcb8HcbBozw1IWT+e8wrRPbkIgGb8r8eWEPAg/87UH1N+nlzV2thcAwVbWo7556XI1Obzqewd/hdWp322AZKHy0tCJnJ4eY2ocAuXOSnTaTEGGlordQPE7JI5z+xT+qodArOkd7iR7/H0KBOfi46uvuK/Oxac1FkP7BVOGlAoWkTAA59Q8PwxgNccS2pWpz+w/9pyizCd8AF9EgFnyQOtFaBZEeBoTYTCP/6XDVN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjO/vR5NBk3j17dTUyl1LNVWNiKPLuGAs5CkYUA7np4=;
 b=Fx4J/M4M4h8xumFW4GpmlTzeGsv8nnRpDaMRtX/6Bn1X6TRU2gLo5JC7pqokbpF63bIDycPfq99yCHU/ja7pBiqG1us9WjDj5m0Vj0Z7Jt1LfCt+vBXyftogIC3CDRRMq4hkUO4AsKGxzGRKbT351C8pEkhzvUGgnexT1YDT7ox73fOzc08c8sRT69Fnfxy1+zwUD6CqSNDDZ+8kRNxgBT0eA5yQQqZ6wumuZ/oUO1prg9gIB7JKgMTmLVdfAqzzjBSoQZw+L7w7ofT7Jyn68YAPFhglvuWMZ/tcuKNecVn3ZD+m5nEco0gVr2thMfiUjxtPWU92/3d7yuxANlO+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 18:27:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 18:27:34 +0000
Message-ID: <7a949a77-88c2-47e5-aa19-773965181bc0@intel.com>
Date: Tue, 28 May 2024 11:27:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/xe: make gt_remove use devm"
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240528182354.1200424-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240528182354.1200424-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BN9PR11MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 810bb70b-ee18-4c97-c9c5-08dc7f43d84b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHFrbTFOajJyUEFyQjBwOXJ6bEx3K0FqaDZMVmpQSmM3bEN0S2VFVDFhYzhn?=
 =?utf-8?B?djFnNTlPbGhSckJ0YUdGRjM3R1JiOEVmVWdqZjkrS2M3YXNPZ1Nrd3ZBeksw?=
 =?utf-8?B?V1NHd2dUQytyM21aSlVHWW9BQlVRR1YwaHZtdVQxOWRQSnFCc1QwbDA3QTJr?=
 =?utf-8?B?cGc4eEh1K2xLN24zb3Y2dFU0d1lqNFpjVDNyZUd0eVdpUVZnWkhCOWlOeEtp?=
 =?utf-8?B?MWNqK2pBT1VoZldBcnZnWmdWdGJaUkNZZ0Zod1EvNjQ2VmhnOVFqUUdlM0hD?=
 =?utf-8?B?aGQ0OVRpZnMzYWFmbHFYVmV0NVA4dUFZcEhzVlFtUDZERUNXTmxjMzVGTnFy?=
 =?utf-8?B?c0FrcTZJcG1oNEJSVEpEMFQzb0w4c0ZIYkR5OHZiMTJ2QVpQYXU4VlIrU0hT?=
 =?utf-8?B?WjZwZGZ3dlMrNW5QY2pMVklBU2dEQW5aazBYaG8xdXJ6MW1yS2x2MEg5YTh2?=
 =?utf-8?B?ZDE1S2Y5Ym40ZkVJeWZFOXVZL2lrUVBhK3lZQlJmMzk0REh3ekJDcjZERCt5?=
 =?utf-8?B?K3podGxSVTlORnBoUUhUeDZmbmc5N2R3WlIwZFNGSFJ1cWtXeThsbWxtWjRO?=
 =?utf-8?B?WlFFSTJKY21UQkVHVXU2c09Vd1RKYkxPaWxFNTJXNHVNYU5vNmtGSjk2M0Mr?=
 =?utf-8?B?d1JCOUdYd1R4bTNabkFHZlNzSUFhSTJLd2pma1NmRXNxamNDTU9YbVdHRDNo?=
 =?utf-8?B?cVJqWGNialZ2REtvWVJlMXhIS2VNcG9MK2lHTW8xcmI5OWFuclIwV0hqRmNy?=
 =?utf-8?B?ekh5Ky84UkpiUTJDTnRnbEdWWVR5S21RMEEva3dhSnFOOFAvdmd2TTM0TWVP?=
 =?utf-8?B?QkFPTFhUZjFFdlZyekFNY1V1bXRkUG40aTh4eWMxMUorMXZCVUhNUTZSWEhj?=
 =?utf-8?B?TURXRE1ZN1RyS2hwK0U1ZldIOGh2STlsYzNDb3BEZXByVDk4SVZodG1wa2JZ?=
 =?utf-8?B?U3pVQ29rdHZMMlJUaHJkSytnUGZxOWxTZU5KYXJ4bi9EQVRUa3NzeDVXbzlk?=
 =?utf-8?B?TzRub2EwTjBsR0pqVGRZc0ZTSDZHNEU3azY2RTZ5UmxrOVVzRE41RFI0SEhM?=
 =?utf-8?B?WTMzT3Y5cVMyMytvY0d4NFlWMTNrUGxWdkR5V1VHcFVHUkdlZHo3UTZJV3Vj?=
 =?utf-8?B?NUdzQXRsNStsMnhSU0N5c1NGaHBMZkQ3SFlUR3R5ZDFiQzBnb2dJTmhoZVJS?=
 =?utf-8?B?SklQZTRDcXQ4RThrRUpaWXpFaitsOC9LbGcxWG51MWpvZjliSkswS2VZcVov?=
 =?utf-8?B?LzBhMVppd3ZxZjFjZVhqQ0haWUovUExnWWcva09oNGpzMzFqUHFEUnZtU25C?=
 =?utf-8?B?OVJRN0t0QWtUazhYTytQQkVWRUtyUXRmL0NDU0tTK0NYZWxQa3BTTkNQYTJM?=
 =?utf-8?B?MDdCV0grUHRFVE1mVWZFNG4zSzhWU0ZzUU1ubDViMkVwTGVXZTZQd2RoVWRK?=
 =?utf-8?B?UEpJcmQzOUJXcEVUeGdKVkxVMDF1cnpJaUFESXowcGRkUTladkROYWhHMWx0?=
 =?utf-8?B?TWh2OHA0eHQ1MldDbFp3Qk0vUU5TTVVxZHV3anZEcDZIb083K0NpalQ0ekls?=
 =?utf-8?B?YXp6Nk1HeGM5YVFBOFc0Qkx1cno1RzQ4aGxKVHNSUTRTTXYxQWlDVTUwNjhV?=
 =?utf-8?Q?dJQcL6GWmXwrzeqd0A5j25ltG9RLdPSsl0c0B7tKEoWE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlU4MHdDT2JieXJ4L2ltK0sxcDFnSHdOMXN1THcwblZvRHR3STg2VnlqbmQ5?=
 =?utf-8?B?Z05FQVNnanhUTGwybXVIc0VocWQzZnNxb1dMZ0s3WmN4aVEyTWpPbDFmSzZx?=
 =?utf-8?B?R0Qrc3dBaTU0d2hNRnVJZkhVQUk0NFE1STNKcjVTeENRQzR0U05kMUl4YmFj?=
 =?utf-8?B?N3U4L1lVTzRrOENOQlg0YnRtR2FCcCtQVHVjQ2R1Q3luY2FFUWJlMlhuaU9O?=
 =?utf-8?B?VW5Ed1lMMytMOHppcmx2NEgwV0RFcXFidnRmVGN6WUlIdEpSOGNNRXFEZWZr?=
 =?utf-8?B?WkltK0RVMDJyVmNMWmV4c3dRanFFam4rMWNJUlVkMUMzSk5WSWZGNnUzQjBM?=
 =?utf-8?B?NDNDSDlPZzJOQ0tBZlR0NHhqT1pkV2I2NWRqUGpUVzdlNElvQ0JLTkR5OXdi?=
 =?utf-8?B?a1JYRW0vQnZYZXlRWDFzcUQ5R0o3V09XN3YxVUd6QzdPMmlqQ3p2TFFoV2h4?=
 =?utf-8?B?QXZFNlRSdytSYmZwU3Exdm15TlVsdjJhbW1YR2paN2N1L0ViTTFlcXlpZ0xZ?=
 =?utf-8?B?TzVJMzJMNUwrUFZpZlY4d1E4akgzbDZpdjJWTE4weU9UOW4xb1ZhNXc1MWRO?=
 =?utf-8?B?MFNMU24zaWxQZVVxeFJqNGZUVnFsY3ZlSXhIWjdQRlJDdG9xaTJRUDFIT1V2?=
 =?utf-8?B?THJWeUljY1NjZWpZZkxudDV4SGRPVURwTit4WS9CMDNQLzVMaXZ1NCtidkZi?=
 =?utf-8?B?Y0dEYzhXMWlFbUxUSVdjRzdiTi9BUFdwTGJVQ3RtazRNenVGSjBENjdnV29o?=
 =?utf-8?B?aWNZeGJ6ZGowNmt6RU1uOWJRUENWV2dGY1RIUE0xQmhzQ21CRHU2VDFVZklD?=
 =?utf-8?B?SmVHT0llS054NVhvVGIrdXBqendSdkRJQlpDbHdEbmcyRGE5bUdFZzVrcytq?=
 =?utf-8?B?elZzZDU4dVpjbFV4ZnkvQjBNNUo1Y1pXSUtHY1Fic3Ywdnd6WUZCbUVZR0l1?=
 =?utf-8?B?RmJ6bDdVa0NTazkrUHhQQW5NNUVOOTBTRDNoL3JzSEk1SnlYVUhzV1FHRVpV?=
 =?utf-8?B?dEF1VjBvRkdjbms5VDRLSDhGSEdFV1RhSnVzTDErY1RhSjRWdzJBVzNIYUtw?=
 =?utf-8?B?UkJwWmNPcFR4N2tKb3VNL2NIbUUzR3BISUFoR0RKeDhNY0dWYjQ5bzM4UTBi?=
 =?utf-8?B?TTFYY1pnTmlRQU1Lb2Rad0lJeDN5cUdmYURZbGp3b21QSU9DblhuSVcyNUo3?=
 =?utf-8?B?OFRLSjA3dzRnY3RacE5NVE1RQzRqU2FQTHYrbFJWZWx6RVBIN0RFYXJtQmo3?=
 =?utf-8?B?UkZPOVdaWTJJRnBwTXlsM1JkQzVUYVBEYlB5WG9XRkxsNEx1ZHEwL3M0ditO?=
 =?utf-8?B?QWk0RlRMK29ROE11T2NiUkZUWTBZd1lwME5BTkdiVFkzZm4xRzdUNmZWQXpE?=
 =?utf-8?B?U0hZMldiU1FLRHdmSmNDUGtuUTBMMENMVXZ3eFdRKzIzeXBlR0dTckl4S1RC?=
 =?utf-8?B?MmlCY2NWUkllVVZBdzdmMkh0YWdNNVpxMkVmUkwrMHdlakR6WjB3SlFEaHNv?=
 =?utf-8?B?M3J0YytsajI5T0VnSkNIQUl1S0t6Wjc5d3IrS3ZtQXBRaW9oelY4ZUxEZDE2?=
 =?utf-8?B?TTNHOFpsVWU2QlNkcXNKYml0SWFNUzh3M2RCeDcvdFhybHk0RUttZnJQVU5q?=
 =?utf-8?B?azdkK0Z0dUlsNE9lWFZCaUVSZGoxRklxMS9INFUxb1FVVGNobjVrTUliZUp5?=
 =?utf-8?B?Z3E2VG15T0JCdlZ6c3lPQ3crZkhYVm94WGU1VGlNazIwbjlKT3psQmg4NSs2?=
 =?utf-8?B?Vm80OWhJNlRrUkVkWXlRT05sUzI0LzZYT3FDWnRrMzFic1VCcUUvNGFaak9y?=
 =?utf-8?B?aHVrRjhHQ1MxRmpmRklWYnRROGhjLzUxMXhvcC9mNXB1TTYxQWs5T3FrUGpE?=
 =?utf-8?B?SkI1MktXTTA1ZURVTlRvTTVlOEthak9YaUlXV2ZvWkM3cTFndkpTTndkQlJy?=
 =?utf-8?B?Vk9mYlVCU2Z4czNyM2duZ3huL1QzdExJRzhKWVg2dDBUYWlpZHgrYlFXRThn?=
 =?utf-8?B?YTFQNkFvNUd2SHJDNG1jaWhCdEFabHFHYUtUbFlObDR6QitkS2RzS3lIemNv?=
 =?utf-8?B?MWh6NW9SQytVQzYxWDhrSGQxSzA4TWhaYlpHSFZmTnoxUC90bzB1cGd0ajZ0?=
 =?utf-8?B?VkZCU0w5OGI0a3cwbkdQWGg2dDR3dCthN3JMMWNaNmgraGo1alkzZU1Ld2pX?=
 =?utf-8?Q?LiDkhB5FbpzxBlNjWAO/HPM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 810bb70b-ee18-4c97-c9c5-08dc7f43d84b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 18:27:34.9297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gi1fZ3pxL8ydx5gDaHl3qvmeCxqzHiNRqDZzQ6PMSsXsTBFRMeUwKXohv24+Uu/tlCz7nt/VbvWyjyv7VUHOndiEQj70bp54r+Xl3VQPEK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
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



On 5/28/2024 11:23 AM, Daniele Ceraolo Spurio wrote:
> The gt_remove function was explictly added as part of the remove flow
> instead of using drmm/devm automatic cleanup due to it being illegal
> to remove a component after the driver has been detached from the pci
> device; the GSC proxy component is removed as part of gt_remove, so we
> need to do it in the pci cleanup flow. The function already has a
> comment above it to explain this.
>
> Note that the change to use the devm also caused an invalid pointer
> deref in the gsc_proxy unbind function, but I didn't bother to debug
> which pointer was bad since we shouldn't be calling the unbind that
> late anyway and this revert fixes it.

Here is the bad pointer deref log in case anyone wants to have a better 
look:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/shard-lnl-8/igt@xe_module_load@reload.html

Daniele

>
> Both issue were not seen in CI because the GSC loading is temporarily
> disabled due to a critical bug, which means we're not binding the
> component.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_gt.c     | 16 +++++++++-------
>   drivers/gpu/drm/xe/xe_gt.h     |  1 +
>   3 files changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 85c1b0c406a6..4c44f23e58ea 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -549,6 +549,7 @@ int xe_device_probe(struct xe_device *xe)
>   	struct xe_tile *tile;
>   	struct xe_gt *gt;
>   	int err;
> +	u8 last_gt;
>   	u8 id;
>   
>   	xe_pat_init_early(xe);
> @@ -647,16 +648,18 @@ int xe_device_probe(struct xe_device *xe)
>   		goto err_irq_shutdown;
>   
>   	for_each_gt(gt, xe, id) {
> +		last_gt = id;
> +
>   		err = xe_gt_init(gt);
>   		if (err)
> -			goto err_irq_shutdown;
> +			goto err_fini_gt;
>   	}
>   
>   	xe_heci_gsc_init(xe);
>   
>   	err = xe_display_init(xe);
>   	if (err)
> -		goto err_irq_shutdown;
> +		goto err_fini_gt;
>   
>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
> @@ -672,6 +675,15 @@ int xe_device_probe(struct xe_device *xe)
>   
>   err_fini_display:
>   	xe_display_driver_remove(xe);
> +
> +err_fini_gt:
> +	for_each_gt(gt, xe, id) {
> +		if (id < last_gt)
> +			xe_gt_remove(gt);
> +		else
> +			break;
> +	}
> +
>   err_irq_shutdown:
>   	xe_irq_shutdown(xe);
>   err:
> @@ -689,12 +701,18 @@ static void xe_device_remove_display(struct xe_device *xe)
>   
>   void xe_device_remove(struct xe_device *xe)
>   {
> +	struct xe_gt *gt;
> +	u8 id;
> +
>   	xe_device_remove_display(xe);
>   
>   	xe_display_fini(xe);
>   
>   	xe_heci_gsc_fini(xe);
>   
> +	for_each_gt(gt, xe, id)
> +		xe_gt_remove(gt);
> +
>   	xe_irq_shutdown(xe);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6f4b59a6e710..98c2228b51d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -93,14 +93,16 @@ void xe_gt_sanitize(struct xe_gt *gt)
>   	gt->uc.guc.submission_state.enabled = false;
>   }
>   
> -/*
> - * Clean up the GT structures before driver removal. This function should only
> - * act on objects/structures that must be cleaned before the driver removal
> - * callback is complete and therefore can't be deferred to a drmm action.
> +/**
> + * xe_gt_remove() - Clean up the GT structures before driver removal
> + * @gt: the GT object
> + *
> + * This function should only act on objects/structures that must be cleaned
> + * before the driver removal callback is complete and therefore can't be
> + * deferred to a drmm action.
>    */
> -static void gt_remove(void *arg)
> +void xe_gt_remove(struct xe_gt *gt)
>   {
> -	struct xe_gt *gt = arg;
>   	int i;
>   
>   	xe_uc_remove(&gt->uc);
> @@ -566,7 +568,7 @@ int xe_gt_init(struct xe_gt *gt)
>   
>   	xe_gt_record_user_engines(gt);
>   
> -	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, gt_remove, gt);
> +	return 0;
>   }
>   
>   void xe_gt_record_user_engines(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index d0747edfe020..9073ac68a777 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>   int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
> +void xe_gt_remove(struct xe_gt *gt);
>   
>   /**
>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the

