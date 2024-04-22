Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA316C10F15
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 21:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E43112D73;
	Mon, 22 Apr 2024 21:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMmrJHSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D42112D73
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 21:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713820221; x=1745356221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=beGFriSOzc4//729XnZUDf5xMWeDt/O4EpS7tHO3DmQ=;
 b=XMmrJHSlmKSLn15FeSTW5mIK34CB70dAtV4lTVFlHBQBUdZMT1IYjmXo
 qOhX4ONOQAOEBx5B0lxvJ3HCOdEmcoXDS1zAz2otBNPaTdxr3DAXazxKL
 FxkU+oyABGG8koUbfNhO80auTH9gFkAohJB8CXn6NoUD/1cca8kGIGAhM
 E6uBBXypPd1qI3NrhqZSwQ9johihTDDGg2uUiVeOnZF1gPB/CcUXqMWfy
 ZA00dM5zozWfdanrZ6d0ywKhkeAN3KFlzkx0rGKgdhANcZTAcnvemMoHP
 L5RExmP3QZ2VeyXms9FBwttBnaJQbvZVubs2iv9PYeZtDQ3lUNUV0sc0W A==;
X-CSE-ConnectionGUID: xp/1hy7QRruF9outmMQ6wQ==
X-CSE-MsgGUID: ChJjVDUxRG+lVrHV2dzNww==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9504953"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9504953"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 14:10:20 -0700
X-CSE-ConnectionGUID: 9DAbgNcfS1i+aJN+KhqQAw==
X-CSE-MsgGUID: DnxCvdH6SGejtPCMvAV27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24649071"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 14:10:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 14:10:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 14:10:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 14:10:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 14:10:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUupv3eX5dn+SXcBvMc5CzlFoNk7kVTc+OmPXoZDQvqJAzp1NE4Y60oUw3hAdJzKbQnP0fUDQ7aTRwCty+Ygl9gkSblfOclbuqbYcUtZpL+WDXj4dJmxydxNyVaih9L5i2LvNH9uG583OTHL9zvjag4pI7PpfB+cvcIWCZnOfljz7i77o0uqlFsOfbDw2l252/Li4n6UJDybVjjx+D+CoY85SWURDsVppZBdNAP7xMGMXhhz4Lec8+AmAPvRaHQXZU6weOV2Q+5XIeP8YsIN5nm4o2cWSXb3DIhqOU+hFE2M86KZwEXI8kAGAngP2RlxOfZiRPg9nG3cGImX0v+Y9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvLc47V8fvY/AIdU8+jAwh/+eEa0rZaQbKYCsUgnHus=;
 b=l/nXfl5s/StSr+dGkwjuFB4fz9eXvA1ZN96FsNWnpM94JmqaatGA1Z+B1MVud67XZwgJBZvaVb7O1pNYaRyVFa1iTnTZjFo3QZSzXQwzvZzP70TxFkLSM339GIj90CqYV2WgZDhmzsmEMS/7ct/nelFtlXNcNt6s0QKdffSrvQEbqYFbxPMCnN4roMCxn3iHmep+UopdGyRIHeNyyt52ljQ484upHbgKxsKMDUwBeQ/dV+4g4KzOBBc44iFwbcKUCUZrYZZ9dDhyYi3FdlN6KFZFzooit7imyuIxXWEA/cUESAB+TVErPDRGH5gTdrGp5m3/b6JytxuPIVWf1UzNxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 21:10:17 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%6]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 21:10:17 +0000
Message-ID: <0fd9811c-e68a-4eb1-953a-6ae653cbf5cd@intel.com>
Date: Mon, 22 Apr 2024 14:10:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
 <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com> <Zia_KMGV8RSqUL_Y@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Zia_KMGV8RSqUL_Y@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aea43ec-d721-4419-c120-08dc63109c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3ZIRmgwRE1jclJ3ZlJvMTlvQWRmY2E5RGxpZ0VoVjdYVGJabkxRNUxHcmxT?=
 =?utf-8?B?Z3NnYmQxVE9NSkIrS0Y5Kzc1d0ZteVl5YzBranA4R1NlTWdwV1A2Q1hIUkV5?=
 =?utf-8?B?a2hRNjlVdUd1WmVnZUxiZ2JyWDdXNEFITjJIcWtaeFBYMEtSUkNTd3BOSE5x?=
 =?utf-8?B?eWtnMmdRSGF1NjJrRHdCQWM1VmE5WkVxM1B4blNxSWU4UTVld2FxQXlNU2xI?=
 =?utf-8?B?R2ZPbXZaUWRvSDNUQUl0bGgvYllLNnhPU1pWbUh5bTd1bHhXSlFFQk5WbXBE?=
 =?utf-8?B?K0tkNTRZK3RQL0wwV2lrLzIrNnF0S0JXTzNPeEdQczc5ejhaQ2pyRUN1RDcv?=
 =?utf-8?B?ZmZEL3k4RTl4UTVtOVhOS0RQaWNabzFnMVNHZXVJWW55cERuRnlodVFWcE1Q?=
 =?utf-8?B?a3VDTVNVN3hOYlZzT3g1azRxNGtMUFJJTWxTSXJQTXdUalhTTnVyZ1ZXdTJq?=
 =?utf-8?B?elRudGpqNzhUSDk5VUFqWTNZZTY2NFk1RjZYdzJtaXZRMG9pcUZDRWhRNW5h?=
 =?utf-8?B?QmNGaFJ1RHNIZTU1MkJIKzBQdy9lZW9lelZIMW9XUTM0SGpXNzg1ZldDTVdx?=
 =?utf-8?B?Yjd0TkFXV0dEakd3djRVdnUzTXVKL1ptVHhQOFVidkVkdjViclR5QmI0SGlG?=
 =?utf-8?B?b0dWSTU4TUxCVTdyVXRwbmtkcFI1MHNwK2RuUnJpaG1tcStiZis4ZEZuYkhS?=
 =?utf-8?B?aFp1NUs1ekFVUGYyM2NKTGpyQ2NnbnVGZTh0dGd2OVcvZnRhWDlHMW9aRno3?=
 =?utf-8?B?UGZ5SHgxaHQwbjNJaE8yd1BZU3dxdGk4cENWcktSb2sza3RDeUllS0xCU3ZH?=
 =?utf-8?B?T3pnUjVOekN2dklnOXk3bmEyR0tFZ1pkanc4Z0x4bjA5d2x6enNUb096eC9r?=
 =?utf-8?B?d3d4U0ozQUNTT1NlOFN5TjJTOWluNnp5M011RG04a3F5OUc2aUN4Nm1qWFRq?=
 =?utf-8?B?cmsvZHJJZUoxZ1RXMS9keDVlTUdhckpoR0dvRlMxV0o2K3hBZXptN0huMEh1?=
 =?utf-8?B?RGozTXo5dVI1OElVUU5WSDRtbVBKbnZUdm9VbGk4bnEzczVueDZDSHArSHFm?=
 =?utf-8?B?V1dHcDNKcGlDUG8wczh3YklBODV3QVdJS201WnN2VHI5SU1kQlA2SnV0UldF?=
 =?utf-8?B?c2JLektCOTNHYWw0SlZCekRrUkJOaGFDWXZKNUpMeEFXZE1FNG93Vm1hTlZD?=
 =?utf-8?B?VEI1OTRCT2drL3NkaUdQa0lvc1dzOVlob1JFaTBxbE9nTDkzdXhJV2UwRjZI?=
 =?utf-8?B?dE9Va3hxa3pJRzdGNWZyWHI4ZFlodWNBTWVhNjZTTEZLTDljaTIwSXFScG9p?=
 =?utf-8?B?d3hxNzVXR3lXN2VKQi9HV2x4a2dHcmtob2o2OWZxdyt5YUxWdkJuMUJEVlVa?=
 =?utf-8?B?bTJ6VmtVUlJTR1BBMDdxdFpJUUtSWWpXR1FLQjdvM3c2bTc4amZQOWpBYjlm?=
 =?utf-8?B?eEhtOWd1WVhpbFY0QkxKMVlXWnVsNm1CQnA5MVRYZ1VQT2hqQ2hyOHVwVkM2?=
 =?utf-8?B?K2l1YlZGOHFUaTZPZ1Rvd2ZJa29SbndwcG9lcUZCOGVqYit3SHFmSm1ja3lz?=
 =?utf-8?B?aEw4MW54eENvYWE5cFRNTzhQNFU4eVZycHZWUHRadEcwOFUvNDRpNmNIcjlO?=
 =?utf-8?B?TkVWR04zNWdsdTdQZ0xBRzltaHA2YjlDQWh0OFV6dWYwS0dxMmRFQ0RNaWNh?=
 =?utf-8?B?WUdTWTFWS0JVUFJ0b3VBaVJhdjNPV1lnbHdacjk0SVMxVEJKT3E4UXd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGllMnNEVDBIWis4R2ZYdXNuT1RIS0Y2cTRnZVVHemdocG1GRUY4ZVZvanpr?=
 =?utf-8?B?V2ZSN0pZT2ZPbkJrdlBVYUI1bVdMb1I2em91RGNlUE8wUVN6Q1lNRm9MS1NF?=
 =?utf-8?B?VVdzSjkzYWNOMU1mUzZ0TmhNNU5JVzZpblBzZTBWKzFYRGVFd1gxVlh2V0py?=
 =?utf-8?B?RmJ2R1dIUTg4WEp4dTJmeldIbTZnaitoRi9PZ3ZYaTIvZnliSzF6VHdubVZi?=
 =?utf-8?B?OTRqS3BxNzFsTE1OVnlTY1J0a21aWFBXUFovTFFMa1hydnRnK0dkeCtzSTFj?=
 =?utf-8?B?VmFrR2hRaGJSbkhSTDUzUFB2Qlk5bFpqb3c0SUcwb3hYQ0lLaWtLeGxiRS90?=
 =?utf-8?B?NHJNUXdGWGkzaUxwOFRHYlArSVFndGdMc25oc2ttbFhDcXczNCtUMzZLNUxP?=
 =?utf-8?B?UmtxNmdGMVJPUkNPTWFVQTVldjl5UGhEK3NBeVk0S0tMOSt6Rk5oTFZpMm1P?=
 =?utf-8?B?bmkwUGh5OWM1dHBGUWJvTVIzVmF4S3lWbVR1ZnhWRTFOQjRKaFN3eWpuTEdo?=
 =?utf-8?B?TEtGR2FKZUsyK3phZUVUdEJmMW83SWV5OHlHM0NMZXlrWkpIZmdpYmdtWGZv?=
 =?utf-8?B?VjZwZnBMdkduWDZORzViOUdJaFlJSTRlNGVTN3hCTXMvK1FhQkpqdGpBMnhJ?=
 =?utf-8?B?OUxvY0ExUk5MWVp1emtyY0l1UWhxbVlPeWJrKzVzNFFZMkJaK1lMK012T0Y3?=
 =?utf-8?B?dXNXTDJHcWNNTVpBa2JuSkhBbXB3NTU3RzlkL3ZELzhkaWowUTJhL1hTamxw?=
 =?utf-8?B?WEk5S1p6MU9yVDRqT2NPUHB0M09pQ1FSclNuRUdiZ0pYaFdNdVhRajc5TWxE?=
 =?utf-8?B?MVRFUlZzbXZhYWVFZGNzQ01IRVNsQjVPSVJBNDF0Y1YyRFVaK2xJSm9jaGhH?=
 =?utf-8?B?ZEV6Nk5iZGtDNDhXdGk5VWlIa0hvSnMwbnc5WnREU09DWHRkOEFYK2wwYU5L?=
 =?utf-8?B?VVJRM3JqV2NUb2Y0bnA1bW4wR09DbzRmNUZXMk5CYTgzTjFHS01NR3lHZW4w?=
 =?utf-8?B?NFdmbTlWaXEvSVJWbTg3aDg4WHJzaWhGT1RaejFuNHFRQkZOYUJJRjFoZzJy?=
 =?utf-8?B?RnFjU2tlaUlVUGJTbzBCeXJ6QlVzM3J6ZXhrNmFqRjY2eWROdTJmL3l2bUZ0?=
 =?utf-8?B?S2tsSXdaNjRNZVg1bGpRNDlsZXpZakNCNE5Na1dxeXNnU1NrMzd0bU0wM2to?=
 =?utf-8?B?YmU1cmV5WVNVZDRjRlN1TlBxR2EwdFpicUZpOWZxaUI0U2NKamp1Sk1LZm42?=
 =?utf-8?B?OHFBZkxrRU9IUUpTSkxWMm1zbERFQ3d0U2g5RW40a1J2Sk5KektURnVnSmor?=
 =?utf-8?B?Wiszd2d6UVN1b3VKTWpVMUErL2Yvd2o4Qzk3YmV2UlphOGZrQ1VtVXk5ZjA3?=
 =?utf-8?B?S3BOSE1oS1JsbTUwYUVXQnM4RG13NGVqckt4dC8reXZoNmhCUkpVY000Ujdj?=
 =?utf-8?B?VzBaQ0FsWUlnOEFrd0x5ZVBDanVEZ1VXSlJWRnI4aTVjK04rQ093cGxGeG40?=
 =?utf-8?B?eXk3anlkRGo2YVl4WER3Qi8rTlVSOXFHZGZpcGlYeXd4M3dkdWllZDZwSXNG?=
 =?utf-8?B?OHlOT0ZHUzgvaFJWV05jdlRJT2ExWXBnYXNRR1Vad04zbmJ0bXlCNSt1a3hP?=
 =?utf-8?B?UFk5d0c0dEZBZ0srSnMyeXZlUnI2SU0zREk5ck5mVUhmWVo5L1dZanpLM3RE?=
 =?utf-8?B?TkZvSDkyOTF4OEtRZkFZaUg0Z3pOcFh6b3d1VkhWTkJGVnFGOTJxYkpoS0dT?=
 =?utf-8?B?TExUMm0rTjNjVnJrRjNtNHBIRTQyVzVLMENLNFdUcVdRV09yUE5BTkh4ZlRQ?=
 =?utf-8?B?ZXB3ZXdtWFJjS3BLMGVvV0xtUHQ4c2RsUVNucTZpYmVjYU0wU01ScnNwM2tk?=
 =?utf-8?B?YzVsQkF3dEhwR3dMd0ZaVDI2VmFFK3VtTkUwK09WRy8yYk5VR09TbVd4V0ZQ?=
 =?utf-8?B?U2hNV1ZzSzl0SHE4a0FHY0N6ZitKdXNHRWZCa3A2MU1sdW5kOWc0eGw1Ynkx?=
 =?utf-8?B?amtyemlVb2wrWGEyRVpHMkZzS0ovL2hrNVRFeldFNkV5V0o4Rjd2NkVWQXBB?=
 =?utf-8?B?SGFtaWprWk91MGpGb050Q2pLTXdlNlI1OGVDSjcxcmt5aG9zeVpUajkwSVd3?=
 =?utf-8?B?MmZReFcvUFkzQlRCNHVqR1VZSjk3a1dtdGs4bmZVWDhLYjk0SUhkcjRTa2xn?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aea43ec-d721-4419-c120-08dc63109c12
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 21:10:17.1068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0cAvIONAF4r6WV80UE2zF1z4o2AXfr3oRG3evapT7bqFQk2jxZD5+1RoZT/+1WGpBClH3suGMJIH8zFdUlQhDqt+WcxlXxcFcidRYo6uNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
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


On 4/22/2024 12:48 PM, Rodrigo Vivi wrote:
> On Mon, Apr 22, 2024 at 11:10:43AM -0700, Belgaumkar, Vinay wrote:
>> On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
>>> On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>>>> This WA requires us to limit media GT frequency requests to a certain
>>>> cap value during driver load as well as after driver unload. Freq limits
>>>> are restored after driver load completes, so perf will not be
>>>> affected during normal operations.
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_device.c |  6 +++++
>>>> drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
>>>> drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
>>>> drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
>>>> 4 files changed, 55 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>> b/drivers/gpu/drm/xe/xe_device.c
>>>> index d85a2ba0a057..e29c152a6c4e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -30,6 +30,7 @@
>>>> #include "xe_gsc_proxy.h"
>>>> #include "xe_gt.h"
>>>> #include "xe_gt_mcr.h"
>>>> +#include "xe_guc_pc.h"
>>>> #include "xe_hwmon.h"
>>>> #include "xe_irq.h"
>>>> #include "xe_memirq.h"
>>>> @@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
>>>> {
>>>>      const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a
>>>> 3s wait */
>>>>      struct xe_gt *gt = xe_root_mmio_gt(xe);
>>>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>>      int ret;
>>>>
>>>>      if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>>>> @@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
>>>>          return;
>>>>      }
>>>>
>>>> +    /* Set requested freq to mert_freq_cap before FLR */
>>>> +    if (xe_guc_pc_needs_wa_22019338487(pc))
>>>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc),
>>>> pc->rpe_freq));
>>>> +
>>>>      drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>>>
>>>>      /*
>>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>>> index 60202b903687..556e73fca813 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>>> @@ -19,6 +19,7 @@
>>>> #include "xe_gt.h"
>>>> #include "xe_gt_mcr.h"
>>>> #include "xe_gt_printk.h"
>>>> +#include "xe_guc_pc.h"
>>>> #include "xe_huc.h"
>>>> #include "xe_map.h"
>>>> #include "xe_mmio.h"
>>>> @@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
>>>>      struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>>>      struct xe_gt *gt = gsc_to_gt(gsc);
>>>>      struct xe_device *xe = gt_to_xe(gt);
>>>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>>      u32 actions;
>>>>      int ret;
>>>>
>>>> @@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
>>>>      if (actions & GSC_ACTION_SW_PROXY)
>>>>          xe_gsc_proxy_request_handler(gsc);
>>>>
>>>> +    /* Revert the min/max freq limits as we're done with GSC/driver
>>>> load */
>>>> +    if (xe_guc_pc_needs_wa_22019338487(pc)) {
>>>> +        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>>>> +        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>>>> +    }
>>>> +
>>>> out:
>>>>      xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>>>      xe_pm_runtime_put(xe);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> index 521ae24f2314..7f82b6c2ad3c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> @@ -40,6 +40,8 @@
>>>> #define GT_FREQUENCY_MULTIPLIER    50
>>>> #define GT_FREQUENCY_SCALER    3
>>>>
>>>> +#define LNL_MERT_FREQ_CAP    800
>>>> +
>>>> /**
>>>>   * DOC: GuC Power Conservation (PC)
>>>>   *
>>>> @@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct
>>>> xe_guc_pc *pc, bool enable)
>>>>      xe_mmio_write32(gt, RP_CONTROL, state);
>>>> }
>>>>
>>>> -static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>>> {
>>>>      struct xe_gt *gt = pc_to_gt(pc);
>>>>      u32 rpnswreq;
>>>> @@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct
>>>> xe_guc_pc *pc)
>>>>          tgl_init_fused_rp_values(pc);
>>>> }
>>>>
>>>> +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>>>> +{
>>>> +    struct xe_gt *gt = pc_to_gt(pc);
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>> +
>>>> +    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
>>> that's what xe_wa_oob.rules is for. Why are you adding it as a separate
>>> function that won't allow debugfs/.../workarounds to match reality?
>> The workarounds are not initialized at this point, this is early in the
>> driver load process.
> So we likely need to change that. or we will start to create a mess in terms
> of handling the w/as.
Ok.
>
> But another comment on this w/a is that it is incomplete. It is just part
> of the w/a here. We need to count the GGTT page table updates and with
> a threshold update another mmio reg, or something like that.
> also drop the freq at module unload, and other stuff, no?!

Yup, the GGTT part needs more clarification, so will be added 
separately. Will mention that in the desc. This patch is dropping freq 
before FLR above, that will satisfy the module unload part.

Thanks,

Vinay.

>
>> Vinay.
>>
>>> Lucas De Marchi
>>>
>>>> +        return true;
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>>>> +{
>>>> +    if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>>>> +        return LNL_MERT_FREQ_CAP;
>>>> +    else
>>>> +        return 0;
>>>> +}
>>>> +
>>>> /**
>>>>   * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>>>>   * frequency to allow faster GuC load times
>>>> @@ -684,7 +705,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>>>
>>>>      xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>>      pc_init_fused_rp_values(pc);
>>>> -    pc_set_cur_freq(pc, pc->rp0_freq);
>>>> +
>>>> +    if (xe_guc_pc_needs_wa_22019338487(pc))
>>>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc),
>>>> pc->rp0_freq));
>>>> +    else
>>>> +        pc_set_cur_freq(pc, pc->rp0_freq);
>>>> }
>>>>
>>>> static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>>>> @@ -715,6 +740,17 @@ static int pc_adjust_freq_bounds(struct
>>>> xe_guc_pc *pc)
>>>>      if (pc_get_min_freq(pc) > pc->rp0_freq)
>>>>          ret = pc_set_min_freq(pc, pc->rp0_freq);
>>>>
>>>> +    if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {
>>>> +        /*
>>>> +         * Setting min to RPn disables use of efficient freq
>>>> +         * which could otherwise interfere with this WA for media GT.
>>>> +         * We will also bind max to MERT_FREQ_CAP until driver loads.
>>>> +         */
>>>> +        ret = pc_set_min_freq(pc, pc->rpn_freq);
>>>> +        if (!ret)
>>>> +            ret = pc_set_max_freq(pc, min(pc->rp0_freq,
>>>> xe_guc_pc_mert_freq_cap(pc)));
>>>> +    }
>>>> +
>>>> out:
>>>>      return ret;
>>>> }
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>>>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>>>> index d3680d89490e..25fe693c7ee3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>>>> @@ -27,4 +27,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct
>>>> xe_guc_pc *pc);
>>>> u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>>> u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>>> void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>>>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
>>>> +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc);
>>>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>>>> #endif /* _XE_GUC_PC_H_ */
>>>> -- 
>>>> 2.38.1
>>>>
