Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDB4C04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 00:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6123A10E0AC;
	Thu,  9 May 2024 00:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exyTr4B0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CE110E0AC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 00:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715213101; x=1746749101;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2p14F/Bojl+qOu9J9B9sObY9dGQojwg40lwTDkQUK6c=;
 b=exyTr4B0BHYK4PW1uNU6mfDQ50Jb0rV3xzK10opYAbrAhWts261Ka5zN
 bpK1YyYqcxqml0/Ouu1JUoLhFikx9rpGlQyMG9mywijtN3tJ/HO1IrJlA
 YvASQylEawrMWPNX38lBGcw+HBCP6VaoPeRfjbq7MkT1ct7d7dVixXnv+
 HLLoLQCWxnuaCqP2syFRR/FZamzIerhYBO9diqNmkef+sEnmF1lBQ8Iro
 eiBpGl/4b/LJQx4GYXIOgs3mOX965g533wwXwZf2NaaETM+NhXv1S8OnO
 uOjP62oD45N+4IUUpRW1Jt1gvlNAlr1+X6qmW9dJs0p0OJZ2IcuyoxCQH Q==;
X-CSE-ConnectionGUID: IwQRnTIoSRK7iHmywsBqTw==
X-CSE-MsgGUID: ZbCsXPM+T4yXUiHfNtDRqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11232505"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11232505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 17:04:55 -0700
X-CSE-ConnectionGUID: IxiLOJ6GQcS6WD7XLR699A==
X-CSE-MsgGUID: aggkNdWHTaOMQEZ9MsslVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="29434480"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 17:04:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:04:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:04:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 17:04:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 17:04:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEc7/DNmW2yRVYwubnnTtEHSPnJQrpkgbyLwV5i+2b1fiP+4F7L2w8/xpea/pnJP+lGBsZ5ydHCNDwHAlvhR3wezMY5NEqGtMkRemzOJHNbEXfY4oOYFJhFOXdZYcXgncbc2cWTJzDLbf+hQNmhwgQmQ3KBhws+q78tq9ZWIhCw+lPhXV6xZPV6ATslOVKNlGH6BoENqubgt0Xgh/ZDRD7pISzIUyhZg1wblm5NAi5MOkF7acNCvmc4+WFMFJ9bJKWr8a/LEnL2zCttLMLzNbCOELogoi5FVBjhTXUqsRCqSRbrBomjVEy5Id8mpopSXa8YAYCVjc3squ9lU0CWBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LTT3qY3kuPY9jOuSjYzV/26Ev+ARrupAiO+j7MVY44=;
 b=C4Dl7ulVqMyE8BbrmOKbNiG91GB/gPHZGP7bwdq1Ve96vJHGYiut0avn4ULhCbcNHTROb5Vc/Ehj7O+vlpfsF+TSEB49MwWQs9on/xgzsGrAueQ03Y2i3h2XXfW6zPcWybuGwOtfrt7/jplHaE/W3pR9B100+in0goJ+Z/LrynlkegslQ1iZ6TUB+e8UaZPr8AXuA368KDPkGT33Q+GrJKbIkyGMKGAM10MZSHsfh1kjx+46wSEOeCl+Mma4iBZJxSNHe+/Cf2hCkVYSDNoIfDA6jkYbN7OO2NRvcVR2xzKZb75FAqA7xQDe/Cjv7riCg7VZuFRVCSiqFCHIDDGzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 00:04:52 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 00:04:52 +0000
Date: Thu, 9 May 2024 02:04:49 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Move sw-only pcode initialization
Message-ID: <qzdfo7nmhjt5i5xfbp37vn4647dmqmgr54rl2lra26xuv6i65y@qnacchhxwzo2>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425182410.2705061-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: c4619a41-823a-4908-aa67-08dc6fbba645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXBraVp3MVJmdVNoMUlVWDdTRTRCQ1kxUlhnK1dOUnp1cmg3dnRneUloblRP?=
 =?utf-8?B?SzF3SWIxM3pPN05ubk9ENU80UFBjSW9uSVJzTjREMlN1dXlrYXBaRHZlUUxV?=
 =?utf-8?B?SWxEWEVvR3F0UWgrQlZ4K1hEalVCdk95bHJGbTF4eTJIR2drYnowQmF1UTlt?=
 =?utf-8?B?N3VuaW0wZUtuMk1sc0hIeE1SZVFuR2dTeHdxYlMrTC9pQmNHRnBndVBudVEr?=
 =?utf-8?B?b0ZMRFVvUlB1aHJ4SFRORTF2MXAyanhuSm9VWTA0VUZ5UkZGRXJvSUx2d0lL?=
 =?utf-8?B?TitxcWdEUngrTlRUMFhNVHJVUHQ5MktXekZoMElGRDN2eC9XRjhnMUlnWnh0?=
 =?utf-8?B?aWhQaUw5T1hUb2NxMTJIK01NL2tEQTdSdGxFelEyeTJqZXV3VytQbUR4ZzB3?=
 =?utf-8?B?MlgrR0pEb082T0czNlV1Z0lZMnRMMElGaVMwdnNYaUhmMVdoWUk4b2Q1RkRI?=
 =?utf-8?B?RFhOVm1hZDRhbTRWWUVIRjI5cFNrVGFFSnE1eVpkeFRJM1RPK212SjBRTE03?=
 =?utf-8?B?K2p0UTRyd0c0MW9CdVQ2eU1zS2NHRk9TZjl3UnBDT1hNTUJ5WXZzSVl4T3pm?=
 =?utf-8?B?NzFLeHZ0M3BXaFlJWkpmYklpYmFFWmE1VkwydGIxNUtLdFoyYTZERC9pZ3dY?=
 =?utf-8?B?RmNjNGVkMS94eHM3NnJidVhIWUh2bGxjemdXRkNoSWsza3dYeUh1ejVXR3JE?=
 =?utf-8?B?czNNNjl1K3dzcDFmT0VYS0NNanl0OFlEdWw3LzMyaTVWQ3VlVzFwWU0rNzkr?=
 =?utf-8?B?QzN0anV4ZzRMaERnbnR6eU9QY0xFVGhYckpRcmR0dzZTWmlJbG5FZWlqVU1N?=
 =?utf-8?B?UklKMzBpaHIxUG9FbGd5SUVoOVNNWnBQUHVOSG0zZDZKalh5Tmdza2dkcXE4?=
 =?utf-8?B?VTluZjVLRGlmbG5DVFRzOEJhSFBETERWcGZRYUJNQjRkOG8yVWhmdWdpa1Ar?=
 =?utf-8?B?b2d3c0x3eEpWWXpnQ1Vvams2dit3a0JDUU85YzkvRVJBaWM2NnNJSkFCcmlV?=
 =?utf-8?B?aDNOVVNNMnA2SzQyMzRXdnM3UEpRNDZOOWpTSjI0bmhTZzVtRjA5cTcyM2tF?=
 =?utf-8?B?dEVtdG1XWXhnUm5KYUt3cUNwMDJLT1FNK3l3UmdXOHB1dmd6MXQ3ZlBQdHl2?=
 =?utf-8?B?cU4wKyt0eTYzSU96NjhGYUVtTEtJQ003cXJUVXJVSHBKaXZyQUVtYjVXUnNL?=
 =?utf-8?B?MnpJbldPSHVJbFprNTZubEk0aHIxakJkU29oemhrT3g0NUJkQTliMFB2VDZa?=
 =?utf-8?B?aEZEVnphK2FiYXRraitFRldzbHdPOFBHNlNpV3dlUjFRZWI4cWlwTGFnWnhL?=
 =?utf-8?B?b0NOSFVraEQ1WGRhMkZUR1ZPRWJHYzhhOEd4bGRTMVZjZWY4ZkVsaFY2eHRZ?=
 =?utf-8?B?ZjZKSXFHZkZqVm10UTlzYk4ya1RXVFpxSWR3empoaXQvcnNrS2lHZ1lLbXNW?=
 =?utf-8?B?RzkxWUgrOVBnYjg2S2dDcnh6SEE1dVhYRnhXeWVmeU50aDhJSmM2cjJwejdq?=
 =?utf-8?B?MWNibDkzb3hBbFlOcnQvenRRSVUvK3hHTFVDVVpCNHpvREltZGJJb2RCb2Zr?=
 =?utf-8?B?Q0VWZ1dmSWJpcGg4ZThvb1RBVkxhTlBYZm90clpFRUZJRnRpRU1hR0tOK0FX?=
 =?utf-8?B?T3N1Q3dMT3VLRzJ1VWY1dnI0dUEvcHI4NmFNWkdRQnVLWTZ0Ykw1YzhzTTB3?=
 =?utf-8?B?QktydmVWZlZOYTk1RE9zYmhmaTBRbmhoQlM0b3B3ei9RaHlEaHNJcTBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmNCamhBSTRjOEw5SXY4UmI4MCtwVjRLRENZc3NJZXU1VU5EdHpwZUFDOFpj?=
 =?utf-8?B?R2pVVnFYb2FVVUJsMGV3N0N4NEFIdGFUSjNVWnErSVhLNTBvMVpDUWlZR2l1?=
 =?utf-8?B?K1cvb2d4SXEwWDJ3OCsyeVc5bWR4UGFoQlZFd1owK0pEOEkxbDVIVnFRbmR4?=
 =?utf-8?B?M3dMcmlxd2FwWkRlYWZkL2MrWXorL0w3bU1LSmZiOEExOE5CdE10MGo3L0hw?=
 =?utf-8?B?djlDMUVVYTV0L0NBWXhOaWRidWZnb2w4aW4wcHRxeW9hMHpuTCtISm1JVzNB?=
 =?utf-8?B?RkV6YWkxS2JyYUxUNGcrTE1IV0lmVFJxNk1qWk5RNTFvcHlValZIT3c0cTc1?=
 =?utf-8?B?UkZTWHRmWFhFWFNkOWloeVcxZ0ZIc1ZReU5wTXdMU0NkWS9ScSs3dFIrZ2o3?=
 =?utf-8?B?WkVhdWJEZDFqR2JNMHo4MTVURk9iekU2aEpyajFJaWhCc09qYTNzOG9RaEo4?=
 =?utf-8?B?REZDYkN4Nm9hajNEeTJtRUFFdHdFNjAyTUl6cnAwdHNnak1FTEhyYkh3WVND?=
 =?utf-8?B?NlYvSjVUdHErTTVPbjlZMElFaWQxSFR2ZlBGTmdhc2hXK3RPclZvaDVudTRU?=
 =?utf-8?B?bmRKNGxnL0N4UlpRNUxwVld3bFM2T1pmZlBydTcrL1l6dytPTVBZS1NrYWdH?=
 =?utf-8?B?VTF2cVZ2UDhnNUZpSVJHRUFzRkRjRHRKM05sWEFBcE44UW5OcVNxVVUrWWlY?=
 =?utf-8?B?d1ZzUGtnZDRKdEpZV1Ixc1orQmhZRzdYTy9lVDRNWHc4cXgxemlDKzhUeUVV?=
 =?utf-8?B?cEtZbk1qT3NxMmtkQVpuUUpta3pFSWtPb1gyNENzT2hob3VlS1F2aWtKVG4z?=
 =?utf-8?B?RFVrTCsrd3Q0QTFpMWNyT2RkWThva1o0NkdJVGJLdlpQUDBzWUVjTW90ZXJk?=
 =?utf-8?B?Y0JwOURpWERranVOM2lXWmxrUG5pRU9wWURUZm9HY3ozd29DTzBmUGtsL1Fr?=
 =?utf-8?B?ZkhPeVppKzk0VEtXUzJ6ZjgrR2JoSHAyeXZGNFFSL3NqTUdxcm5ZbzV6YlJ0?=
 =?utf-8?B?ZEF5WTExQnhmS1VXenlSZjFyU3dNcThHKzY2b3FGcU9oN1VuU1kxa2ttZFdO?=
 =?utf-8?B?ZXZQeUJGNDVvK2V5Q2svZ3lsOTBJRW5jSldaUnZpajMrVzh1cjRyMVV4emFV?=
 =?utf-8?B?THVLT28zVWk4TEdPZGlocHN1dVRwWmRLTDNFQmNrMVhwYkhNeG40enVjL3F4?=
 =?utf-8?B?NGxPT3gyTFVnd1hVU2oxVkVLZVpHT01zbFN6QU5kUlZzWEdrNjJ4VytKcG8w?=
 =?utf-8?B?aEkxYmlrWVc4YlhBS2pHVTNMOTFiOTh0Y1BmMEdIOEVoOUdadFJBeVpUWE1D?=
 =?utf-8?B?dENTY3V4dEREVFZ5cU5STjdqU2VtZ1hiV1JIYlJDMDIwR2psY3I5ekZ5dGtC?=
 =?utf-8?B?ci9xUC9HY3pucFJhbzBtR3R0WVlGOEQvZXBjRVZvTEVjVFFyblZ2Vmltc2V1?=
 =?utf-8?B?cUg3eDdDWTVtMmZjdkZ5Z3lrbHdJRHJLN1JsY0dGRWRKNEhkYm5iMllweXNt?=
 =?utf-8?B?UzJvQW1wWFU0aTNwbEtSaXFRMENybzRiYmFMOFU1VXBVaWpXVGFndmNQWnAw?=
 =?utf-8?B?SXB5QkJQMFdtK3doQ2phS2RNRFd0SjJiUHdhc08xeit5dXJuVDlUd2VBeks5?=
 =?utf-8?B?Uy9KVlVVa09XdDVaRGFrcTUvazVQV3lYdW8vV2xxTHVuSC9aNFlXNGxLQkUz?=
 =?utf-8?B?cmtOMlBUaGtKRmRBM2wyeU53aUxJSVJzVzE2azRHWWF4ZzlhR0RBSTRyRG1O?=
 =?utf-8?B?SythRDZTcEhrMnZoWFBLUTgzQkxndmNKYzhWMmJTSzVZRmpHZ2REaTArWjY0?=
 =?utf-8?B?c1dHRUZqckhHUWdlVEYrMktubWdFT3l4MFZZWlZDREdTMGhrUkdHbndQSk51?=
 =?utf-8?B?aTBHbmVPN3RPdGxXOVdkakV1ZTRiYVhoWXVoR3c2K0tPUDc5NW8xNVFlTkVB?=
 =?utf-8?B?Ny84cWFFa2tHNGZVejc5QndwSEpGSEpVTjBQZTc3UUJnQ3ZCZTlucG03R29V?=
 =?utf-8?B?N3NLYlBFbERlMjQ3SHY1a2xJTElwMDZmbnh4Y3pNWnlEelhEWFlKOHo2OVFN?=
 =?utf-8?B?L0EyQ0JRQWR5c0dGTnRJME01UlgyQTZOWVdTVHMrdmpuTVBmMzFHY1huZEdJ?=
 =?utf-8?B?SmZWeE9MekFOWG80d3hOVmY0RGFjaWRxdlBreGlLa0VPdktPVUVIZGhnd3hM?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4619a41-823a-4908-aa67-08dc6fbba645
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 00:04:51.9970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKJgGdwhkicQI2S2oK3PfG3PI9W6wSbaHfAVq4KN1cwvyz1SVURlp0Rapsvq4iON9PTovblNi/S8e1u2ZAY8FFS3gI9Up7UXC1j+XgD6i3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
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

On Thu, Apr 25, 2024 at 11:24:10AM -0700, Lucas De Marchi wrote:
> Move it to xe_gt_init_early() that initializes the sw-only part for each
> gt.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ---
>  drivers/gpu/drm/xe/xe_gt.c     | 2 ++
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d090c4e7d57a..c0f2cf0dc006 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -596,9 +596,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	for_each_gt(gt, xe, id)
> -		xe_pcode_init(gt);
> -
>  	err = xe_display_init_noirq(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2e8efce2799a..b6ab3e0cfb64 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -44,6 +44,7 @@
>  #include "xe_migrate.h"
>  #include "xe_mmio.h"
>  #include "xe_pat.h"
> +#include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_mocs.h"
>  #include "xe_reg_sr.h"
> @@ -329,6 +330,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	xe_tuning_process_gt(gt);
>  
>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	xe_pcode_init(gt);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
