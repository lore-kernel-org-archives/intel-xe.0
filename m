Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268F3C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 08:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E732E1138F3;
	Wed, 24 Apr 2024 08:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4+lBBIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AA51138F2
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713946625; x=1745482625;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Z0exStGG9Kv670G8kdEUtgV6UgiZXO/ruVntER3Zn4=;
 b=L4+lBBIZsb3OPnea7AbCOUIdVjBsnB0Le/JBcgMBsLcWZqq0CzoMqZNQ
 SeMeCdaTyhgDLzsIWlSVI2AeeRZIXTj/swQIuLK6nNvGUromsbYMSui5s
 1cDUoQQVmOXXAUxPIdFlxnjChtZ/rQ25QJMHiiKaE83JIS9UyQayHyaHK
 ofbzByL9i10IZlOYb8SbhEkhRCRma8JjsLr/yik38Ld8OQtB3Oyd+kBan
 4Zk1GlGDugg/jEyGknE/Dany4lP6A8Mmp2rVKmaU0YDBddU+6CuizJ88R
 zzGRz6nFK8/6KugR5Mg7An01fpp2qgDGdEHmI23g6GZy6P1N0Bl2OGj0t Q==;
X-CSE-ConnectionGUID: VFRn2XX/TGyqEvzddG4HOA==
X-CSE-MsgGUID: GkDy9V9ITcyVByzWNjFanA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9494349"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9494349"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:17:05 -0700
X-CSE-ConnectionGUID: At0WxeX3TFm2F2fxvmmNNg==
X-CSE-MsgGUID: JdYar0+6Rcy2TskAgJCdWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="25080093"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 01:17:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 01:17:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 01:17:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 01:17:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 01:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGwiX+iaRIT1lbqqfTnNl3+/O4s3q0v1iOGAs9rTbf87o8NxYgR6Y//9EEPb0Cjc1DMoqxuN7hrBGN0YqJcjwtPRH6Sl5dikQdnbOD4rrV/PJMPWF0SFTDgvmGoG2yNC8hyktCZt38tuLw5+okwJdzui6EdqO7dzlS+5nHTjWvXxNEh9Z6hbpoNVjEpMIUfpbqDPcSTBAR+RVUKvoOwjPSmvSHlCyrK/l9UoqURjHpIHUbUkIF67HmhdmCybuW9rGuie9bxTCLAqUSc95Z6YFNiKVupa7NQH2CHbPzjBc1rXlQwdfJGKehHA3NmN3+5MZujTIhTOLZAegF+4HrHT4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAAVv7RD6Q3rw1a0ozbKctA27V4+DgUjjiLf9ySdxAw=;
 b=P8RV2iewmWMU9pDfgjLpEqbohlvQJqFH/rtANddUd17p+NRYUNuyUwvmAG75wHz4iVWSx4Puw8OLg5o0iEfXaR6OLc0039Sw0Dbd63E4aeLDBgSp4/ctykfLl+EGT5iFMveFRCgXpWN1WiW7zTZB678aBNCsp2+mtwBj3FhDKmD/HMYux1iyYhZnOgN/nLXUP1x3SiyNuK27hiM1o88TxD/KiZb0bh1koYhm2dToH+UlY5HWsFFYvW9RY3yGVBV8vZDyGVgduEYMy1zegK86O45ca4pYSmjwXe5iq1HEvSCFUusYKgmAA9zAFGkrHD1Ufyg5y28hrVykH/VR0kBz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Wed, 24 Apr
 2024 08:16:54 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 08:16:54 +0000
Message-ID: <d33c69fb-c84a-4ef5-a28c-b0190b8fef65@intel.com>
Date: Wed, 24 Apr 2024 13:46:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
 <20240405130127.1392426-4-karthik.poosa@intel.com>
 <2rghstrxzerqq74k2papk3nwafptzsfzgli7ceyf4shstmejy6@n4efergznjwb>
 <ZhWOV9puU8o3-qZM@intel.com>
 <yow562hwodxuhhobwndyphp52espvswyecjzzcncpo5xvghjho@f6tly3xklwjo>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <yow562hwodxuhhobwndyphp52espvswyecjzzcncpo5xvghjho@f6tly3xklwjo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::33) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aad6b56-5b42-44d2-3599-08dc6436e670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0pqWmxYdk5UazQ2azkrb0RybEhRZlNZYXJwV1VWZnBaNWxUeUw4OUExeThI?=
 =?utf-8?B?Nm1ZeWJLeEtHckd2NHlLelZOMTFMaCtpN2pGazArS0RZWFkzUG9XbEY2WWlj?=
 =?utf-8?B?RElzV3J4UFErUVVDYjhSaEtYVHFXcWxUOWtGSmppSUEzUlVjRFRoVVFmbWpT?=
 =?utf-8?B?WEdJKzNnYjN0ajZqQXVjWWJnVFE3dlZUNFl2b00zeFA2OEJvU1RMS3V1b0VN?=
 =?utf-8?B?Umx4VjdWS2RROG5YY1pkY2RnNDFMR3ZsUWV3bVo5ZGR0eGY4ejRNWmMxYzVh?=
 =?utf-8?B?Y3pIbTVic0pKVGxsUkZWN0JLZE9QK0pHdkowS05CR1N5WTJPdnRxRGVOTkFD?=
 =?utf-8?B?UlRQekNPY2YvWk9rN1hUS3VGeGRqZFdCYUkwaVVlQVI4SFJaU1FDL3dhdVNB?=
 =?utf-8?B?MmNocmhCK3JNbFdVRHk3WFJLWUpISUZEenlraTVKTkZ6QzdBb0ViK3ZDbmhy?=
 =?utf-8?B?M2tJYjJwWE5oZmd3WVlZdGZ3RTNva1N6OW11Y3dLNU01Y1U4VWZnOHNEMFcw?=
 =?utf-8?B?T1ZxZzRNeGxZSDF0QzNGK1NHV09IWG5QTVBHZS96QitmV1BwNEFjdVFib2cx?=
 =?utf-8?B?YlJKOTFiWHpVMEhyQWtEMHE5ZklmYms5YXVVeGQydnhMVWh4OUFJWENIbVFS?=
 =?utf-8?B?bCtjenp5QzgvWmIybGU3VzJBT3Z0bzl4blU3RjQzRUNqSGNXTi81NmJLL3lK?=
 =?utf-8?B?em5YbHFMR0tiMkQvWjhJK2tPN0RiNTY5UFlmOTh5N3dUeTc2d2VPZjdKNjF0?=
 =?utf-8?B?ZWdSL1FRVEduaUUwQ3l4N2FXbjJ1NWlRVjJGTDlBK2w1MXVCdWhuckZSWC9n?=
 =?utf-8?B?cjc2aytrZVhFdmZtaW5BTnZCNWliYWhnM2lEdXVPSmxtb3NQTERXZldUalh2?=
 =?utf-8?B?U0JsQ1AwbjI2cW1Fcm5rc20zQ1hVVUtTMFhKLzM1T2MvbHJ6dlhwNjZGUk5o?=
 =?utf-8?B?ckNTZmlXZmt5OU1DazFpVG9WRTNmODZFZFJFWmFBNU4xT0lBTzN6M1pHdGsv?=
 =?utf-8?B?TlVmNm1STUtlSldJWFpZTnNzRU5Fd2lhUnRqS05aSW45MjBMZzVuMndHRlNW?=
 =?utf-8?B?djBhd2J0aG5DeVkxaXk1c2NKQTZOdm1zK0tlMlhLTzcrZ0paYWFpc2Q1U1hJ?=
 =?utf-8?B?NGN5RDlMR3QvM2E2QzI4MDlkOWFLdTdyRmJiY1loZUQrU3A5Q3JWeXYybFJn?=
 =?utf-8?B?VDNaSGpWQjVQd2V6d3JaeFJmRzU4Q0piWVlLN3hXNTNQd3lPTVRobnhYUWg2?=
 =?utf-8?B?L0R0elNPYnFTMEhiRFdLTjlxeDl6a0dMM1E0ZEZlU1g5dmlaV05RNmFBR3k3?=
 =?utf-8?B?eVhPaFJFZXgwNURjcTQ5dVJBWWpnMytZR0R5eVFsVGFuY282dmdWY0VnMVgr?=
 =?utf-8?B?dUVQUXFxNVVFQm1ZTXlGZnk3U0paRWMrNzFTWlRsR01od2lLcHpYTENKWEpp?=
 =?utf-8?B?ajV5OHdOZUUwaW93aUtscGtMMEJtSG5TOEROV3pzQWtOYWFiMm1MNmRjOTV4?=
 =?utf-8?B?LzlLTkhqR2RpanhKVk80MTJxVWMzbk4rK3V2M01zTTRpa3Y5RG9GUCtBR2Fq?=
 =?utf-8?B?SFV0QW5SUDB4d2dnUUJwUzV2WHpvdVhqMGZaYkJjSXBkY0xMaVl5SnNlSTgv?=
 =?utf-8?B?d3cyNXlIS0tqdlFsWndEaWVnTTVPYjlzV1M0NUtSTjZ6eGZxaUtWRFJCY1hQ?=
 =?utf-8?B?a3pSQkFGcThpcDdBV0xyaW1VTUpSZkVhZi95ZXpuT2pLV2ZxRW9rbit3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkxCV29mbElOWnhNL2s3d2hMU2Yvd01oREFmd1diYVNwZGxzNndMWTFJSlVN?=
 =?utf-8?B?Nk5VQ09sRE1ZbUtVY0EwTnZvT0QwL2EyNFpMZXB5SmVLZ1kzM1lRN3lwVDk3?=
 =?utf-8?B?UTNoT1dQMWUvd3BNcjEwQTJmOWtSajEvRGVNSXJKMjRjbWVsbmx6MUVacXRN?=
 =?utf-8?B?ck1SM3FnUjNUU05SYTRXM1BpMUJ5L3hiYmNiNDN0UlJxbXJDVTNMOVpUT0Jt?=
 =?utf-8?B?TFZsV3pmbWh3UnUyS2c0R3ovRmcxMHBKaGg3OEdRQTJoMmFRVDhiakEwQSs4?=
 =?utf-8?B?aXpsbS8zSk02SFRNU1pnNlFGVStlYmcyM1JTTlBFT3ZVT1JzSGpDTjQzcE44?=
 =?utf-8?B?MFkzdCtISmZMdDV0K3orbVVXWjVLQmttOXhJOFVTSFg0SC9qaXVSU3pldGxv?=
 =?utf-8?B?Y1pVTFhKQ0hHUWhxamZackl1TmViL24rS29OR0podzVmUzh0b21lYjBNOU9i?=
 =?utf-8?B?SmRzZ2xHU2FRKzhnUG0yS3ZVenJZVE8vam9NVWZIYVhOZ055RjFZaWdabXBx?=
 =?utf-8?B?czVKM2FBdkxZdHMxT0xXMzNMcDd2RTg5SnZVUUxYWTFlL2JwOWZpc0hhUUFM?=
 =?utf-8?B?Q3B3ZXo5M2hQUzJGbWQ1TmxkcWFYRVUwSnZxZFJGcE5RbTRSWUNtWjZhNzQw?=
 =?utf-8?B?ZjFrMUtCS1dVQWdzNGZUMGdHUytNNkg0QmJpYUxueE9xVHlWS0VoUXVCUE44?=
 =?utf-8?B?M3h6SkxoZEU0OW9IQmtxTU41a3Fvb2cyUFozY3hRcW4rZkhKSk92QmFIODdM?=
 =?utf-8?B?b1B0YjNOZVpGS2g2OHFEbjU4cFFCTnRSVG95NkoybEtjTXVxc0F3QlozRXJl?=
 =?utf-8?B?L1NYcGZva2hadTRMR3dEaEFOTWdtNDFLQUpOMm5DRG5mL3JqYlVpM0NMeGl2?=
 =?utf-8?B?OHdFNzZGb0RnYWxZdStZNVpIVDJmOUdWZUNRYXNwZXV0TEpoN0pOTTdmRHdq?=
 =?utf-8?B?aEdhQzhrbUxOQ2RkWmFwK1JIM09jRW1hSldVeDdFWmloaE1uUGhqL1ZhYVU3?=
 =?utf-8?B?UThkWGNDWHdNOGQ1Y2NYTXF6VCtOSjNRTHh6VitFb2NKaElDVGUzVkx5a3Ji?=
 =?utf-8?B?MXRGUklYM3JOUmYybGxGUGpDYitTenFzeUlqOFJ2dkVHNkJSM3NEbEc4ZXAy?=
 =?utf-8?B?VklpRytka1hVMkVTcXFOMjNFanV5dU9JaXNqbG91T0ZNTnl3SDVaYVNOM3Jx?=
 =?utf-8?B?RmVhMVVpYmdTeDcxcGVOSkc4VnNiNGxPMnpOSVV4TUJqeU5mQWZRdUh4Wlli?=
 =?utf-8?B?MXR0eG52bEJYaW5ZTFZvVG9aYVBMK3RQRVh0Wk1aaGtmdEZUWG0vUktxQ1lG?=
 =?utf-8?B?U0RKdjVKYWp6elRRTjVjcGdVcTB3WURTenMwVzFhZzZmeDNyUVZkdTFzeHFh?=
 =?utf-8?B?L29uRzd3Q2g4NkE0dFluY2J6ZUN3a2xhY2g4OENTM044WnpIRU9nWEU1RUs5?=
 =?utf-8?B?UUp6RDMzamxNYjRtYTdoVE5hYjhwTzB3NnNJa01ybGJlZUxLK3dreEJVaWlp?=
 =?utf-8?B?aml0L3pVSHd1MzNQVmxTeVd4U1dJYkpQQXN2c0RnYi9Wd3lOd3dmaUpNUDRp?=
 =?utf-8?B?RUdCb3hGRDlaaXQwSEJKU2RCdXNCdlgvR2lCelVtMnNJeWhYclZKQ1Jsbmtj?=
 =?utf-8?B?bmYwcVhWYmVQY3BmeDZITURHOVFsam40SGFoT3U3cjBSQzF6THdUd0hIZmJj?=
 =?utf-8?B?MlQ1a2U2Q0VwYTB0TUdBM1ZTODd4czIrRDNsNmxWYTl1YVBSN0JpdllOdEFJ?=
 =?utf-8?B?WW5la29YOEd5UW5mWmZzUWJPdzhnaGJ1RHBSMng4cFBxV1V4ZGltNWZoZEQy?=
 =?utf-8?B?Mk04L3JpSEp1Tm9BTGQyU3YrSlFsZFcyd1d1VFpYbUJMRk9BYzE4UHRESXgv?=
 =?utf-8?B?WGxWNW9lanlUOTJyc09mTUp1NkF0Zkhtd3pKR2tZdE96cGdOSDc1QUlUSVZT?=
 =?utf-8?B?YjlXMUJnaHI5Z20wRVJIcTNxcnFZL2NQZ3lHNEFIRkVTWmJZSUlqaThwckk4?=
 =?utf-8?B?L1RRREpCSm00SFVKZEU5ZVozUmVhY01NQlJ1c2Nkb1RLR0VHd3BuTXVUTVhk?=
 =?utf-8?B?NDN0ZTIwYjZHS28yUzh6RkdkRHY0cWVMTE9YT1VpdDRTMU1FbjV2Ry8rWjkv?=
 =?utf-8?B?UHdWNi9xdEtneHRsR3Z5cndMSkhIMHl3U1dmZ3pmVHgwemVCeU5WVWtPdDd2?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aad6b56-5b42-44d2-3599-08dc6436e670
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 08:16:54.0737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBSz701AqOBRGZ1heBzc4zHjGinQNyId+jtcjss+SluWnkBzKdIRsJbPFk6SYTMeh9qGIk/L2tFNaWEMqnRRDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
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



On 18-04-2024 18:44, Lucas De Marchi wrote:
> On Tue, Apr 09, 2024 at 02:52:07PM GMT, Rodrigo Vivi wrote:
>> On Tue, Apr 09, 2024 at 12:52:34PM -0500, Lucas De Marchi wrote:
>>> On Fri, Apr 05, 2024 at 06:31:26PM +0530, Karthik Poosa wrote:
>>> > Return u64 from xe_hwmon_process_reg, instead of a void return.
>>> > u64* input pointer not needed with this change.
>>> >
>>> > With this caller can directly assign return value to a variable 
>>> without
>>> > need of explicit initialization and pass by reference.
>>> >
>>> > v2:
>>> > - Fix checkpatch warnings.
>>> >
>>> > v3:
>>> > - Rebase
>>> > - Removed unncessary break statements.
>>> >
>>> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> > Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>
>>> Applied the other patches.  This one I'm putting on hold to think about.
>>>
>>> I'm not sure the approach in that hwmon in general is good with the
>>> xe_hwmon_get_reg() + xe_hwmon_process_reg(). It seems it's even taking
>>> some pm refs when it doesn't need (to decide if attribute is visible).
>>
>> I believe this approach is fine.
>> We do need to earlier get pm refs if we believe that there will be mmio
>> operations underneath. Better more then less in this case.
> 
> see this example:
> 
> static umode_t xe_hwmon_attributes_visible(struct kobject *kobj, 
>                                             struct attribute *attr, int 
> index) {         struct device *dev = kobj_to_dev(kobj);         struct 
> xe_hwmon *hwmon = dev_get_drvdata(dev);         int ret = 0;         
> xe_pm_runtime_get(gt_to_xe(hwmon->gt));         ret = 
> xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? 
> attr->mode : 0;         xe_pm_runtime_put(gt_to_xe(hwmon->gt));         
> return ret; } that xe_pm_runtime_get() is totally bogus. We are 
> basically doing a
> SW-only check, calling xe_hwmon_get_reg() and xe_reg_is_valid().
> It's only xe_hwmon_process_reg() that actually read/write/rmw anything.
> I think we are following the approach "upon any entry from sysfs,
> xe_pm_runtime_get(), lock hwmon, etc", which I don't like.
hwmon lock are taken only for write and rmw functions and not for read 
function. Suggestion was to avoid taking lock before rpm get.

RPM call may not be needed for above case but not for attributes 
curr_crit, power_crit as these are pcode mailbox based attributes. For 
now rpm calls can be moved to one level down but going further for 
certain attributes we might need to perform read operation. So it make 
sense to keep rpm calls in top level visible function.

Moreover visible functions are called once only during driver load.
> 
> Besides that...  xe_hwmon_process_reg() is an umbrella function for no
> good reason. The caller hardcodes the OP. It could very well have called
> the right function and just didn't because xe_hwmon_process_reg() also
> bundles getting the reg.
> 
> taking xe_hwmon_power_max_read as example, why can't we
> split the get_reg() / read_reg() like below?
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 453e601ddd5e..8ce8d9a66df9 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -160,10 +160,22 @@ static void xe_hwmon_process_reg(struct xe_hwmon 
> *hwmon, enum xe_hwmon_reg hwmon
>   static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int 
> channel, long *value)
>   {
>          u64 reg_val, min, max;
> +       struct xe_reg reg_power_sku, reg_rapl_limit;
> +
> +       reg_rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, 
> channel);
> +       reg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, 
> channel);
> +
> +       /* XXX could probably be xe_gt_assert() or add a warning */
> +       if (!xe_reg_is_valid(reg_power_sku) || 
> !xe_reg_is_valid(reg_rapl_limit))
> +               return;
> 
>          mutex_lock(&hwmon->hwmon_lock);
> 
> -       xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, 
> &reg_val, 0, 0, channel);
> +       reg_val = xe_mmio_read32(hwmon->gt, reg_rapl_limit);
>          /* Check if PL1 limit is disabled */
>          if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>                  *value = PL1_DISABLE;
> @@ -173,7 +185,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon 
> *hwmon, int channel, long *v
>          reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>          *value = mul_u64_u32_shr(reg_val, SF_POWER, 
> hwmon->scl_shift_power);
> 
> -       xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, 
> &reg_val, 0, 0, channel);
> +       reg_val = xe_mmio_read64_2x32(hwmon->gt, reg_power_sku);
>          min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>          min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>          max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
> 
> 
> Yes, it's longer, but it also uncovers one issue that could have been a
> silent error: if there's a programming mistake and
> xe_hwmon_process_reg() returns a valid register for REG_PKG_RAPL_LIMIT
> but not REG_PKG_POWER_SKU, we'd basically use the value from the first
> register in the calculation, which is wrong and with no
> warning/error/whatever. Btw, should we change the visible()
> method to cover that?
yes visible method for power_max attribute if we add additional check 
for REG_PKG_POWER_SKU above case will not arrive.
> 
> I's my personal feeling. I don't like the pattern xe_hwmon.c is using
> since it's very easy to introduce buggy code. If someone wants to give a
> r-b and merge this particular patch, fine. But I do think this pattern
> should be changed.
Idea of xe_hwmon_process_reg to abstract the register accesses. In i915 
we maintain register addresses inside the hwmon structure. During 
reviews that idea was not much likeable. So we came up with 
xe_hwmon_get_reg, xe_hwmon_process_reg.

Regards,
Badal
> 
> Lucas De Marchi
> 
>>
>>>
>>> Lucas De Marchi
