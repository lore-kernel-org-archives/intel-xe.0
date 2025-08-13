Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A266BC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 17:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2610E77E;
	Wed, 13 Aug 2025 17:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="je5qOmm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F5310E77E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755106727; x=1786642727;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mcDFcLuz1cNNN/Lxc/wAjTysLACIHWmpYUwYNoU5owY=;
 b=je5qOmm1U2QzOAIEKV2lHhgedd8HH+JiF4GpPNdtpIoK40Wtwy2w7Rtn
 fOXCaYth6uq9d0rur95JUSkS1s3140pD+VucDAo0plPsTNUZYrOLvB7Zf
 8QQeTeJlE3dyYkCG+jxh66KbE+Jl0MMKiLfOMu/kG3H9/KsLOMJvQ6wpt
 nNraqrrMnrMpQ0avhPP2yhMm2j4F1moyWyDygTyTMkIpxEkCXigrjpFsB
 2+F9PIfmjRitgbOPOTpqsVyuaW4FfVxh6Mhc2Qwvyg9V5j4bzEBpylmyE
 dhMnrPN88fsTviskhEpg50DqpsrIS71yexdkAR57k5z1gYvkCwgXCgyHi Q==;
X-CSE-ConnectionGUID: RLaw5ATDQAWefs98FWDshA==
X-CSE-MsgGUID: mp2h4SuHQzG69UoVTlj7vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68790787"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68790787"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 10:38:47 -0700
X-CSE-ConnectionGUID: 31ryWYg7R5uR3LLvOW9WTg==
X-CSE-MsgGUID: YxYA0oXpQ4e9zsSo/2qBmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="203705711"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 10:38:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 10:38:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 10:38:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 10:38:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6ZPCMzr7PE2yi2iHZHga/qyd4CSA14mIu8sDd5lC3p4z0Kbh/2Q6xj8EaGR+OI+YCbOM9CM8+7MyL9UOFflChVz232j42ezzd2vN8NrNU9jZkFaSh5C6WtnLu4WYjyvOOoMds+m+pJWleCieJ8ftbCf/wHMNVgmvj8CWt4LsQTIDUpHO7b6jXDcZ6CLCC5eD/q2n2q5+VwYNu+DMD71EfGhf8HZKqF0o/9yIPIXya7It3msEI218BLJ8knMrjoBHsWbRseHEof+jxtUol/F1o0F+0hkRNYI8JEhruRYrWgMVpOwgrvueddWRF1QDxeWQXsctidX9R49Ncc+DHbciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdZ0vUULWEFQhTdgsEMizXHKEu4t6Jw5dvdUnuqGGpk=;
 b=KGBeahD9tt++T096UdBKQcih2fjPygWZ6MrcEDrM4Ki7k2zqmmPcGG5KcNfsCp9eIhgrlm2YWCG9lTY7wN5rxTdtu0KM2u3fKyyQR2pxRFd+3EcqeymfJGCt/Xxc/XakZL8gAiYi3Ib2qv4R5luyNDdBYevLi6rSt7IiWXkulxramehN/EH8bgYnoSGYQoWD/x1KTyFAIGYdX8MJrXKPJACAktHMrCFV/Hn7Isei19qLqGtT+354JYwTXEoY84mauHJq7Jngj/mmnfPCRjNSVpZ4IyP2RcDIUlRBwPm1H1Jj+eGcBPS8mggZKQ4Zj9vFvUmDJCjc6n/p1bs5lKLCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM3PPF4C5964328.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 17:38:43 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 17:38:43 +0000
Message-ID: <cef7f186-c9e8-488e-bcbc-7537ca3a289a@intel.com>
Date: Wed, 13 Aug 2025 23:08:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] drm/xe/configfs: Allow to enable PSMI
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <John.C.Harrison@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-7-a111e9f1e4b7@intel.com>
 <531d08f5-7a3f-4f47-9c60-e55eed1088bc@intel.com>
 <3qcwjxyskygb2dofcy2p7vozyar7v5coou2me7jmpehutif6kj@vrqx7s35274m>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <3qcwjxyskygb2dofcy2p7vozyar7v5coou2me7jmpehutif6kj@vrqx7s35274m>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM3PPF4C5964328:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e009985-a12c-454e-3c8c-08ddda903f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEVrRUVnK2Jqb21IWFlDMjZOWDEvQlB2SW1oQWpRaDduSG1rOFBZcFdIWkl6?=
 =?utf-8?B?S1VkVGF4Y2lQSjdoanhwSFZVczZKL3QzVnhCcFpBNHJBMWEvTCtiU3RXSjZ6?=
 =?utf-8?B?TmNndlAvdHl5bC9sajE2THRoVGpMOTNFM0NpcUhPWkVqaTJ3OVN2QkxjeExM?=
 =?utf-8?B?ZUNSNVp3dnNXQ1oydVZmV0EyNFRaWmVDUyt5WHpIM2N5L05VakY2TnFabW5N?=
 =?utf-8?B?LzNnQ1pvY0VOZ0VvWTRXY3dqWTVoeHkzQWZKaUkvd3VRd0ZJcithblhLZXJ6?=
 =?utf-8?B?dmlRVmZmenhQQTZHQWJTSzhKeHRtODVzaHd4N2xMN05Sd1J0Si9GaWV4M1Iy?=
 =?utf-8?B?a1NOQW42alBSNVNjSmttMWNJL1NIWTBYUGp1ejRKZGlNeEM5eDhnN3gyVzhT?=
 =?utf-8?B?a2lHNUdIYS9PK3A2YjZoQTJSSnpiYVVIT3dCeWd5MnJRTXhvOGVQU2VNNkFl?=
 =?utf-8?B?Rk05dzZsUlIvaTNSaytrM3BDaXo5UjZlZVVSRGJCMytyeXdOblpwRnhFWUZj?=
 =?utf-8?B?MzFyeHBvQWpGektSSXhoTzNBQUFGUCtSbDJKb000eDl0RCtndXgycFRaZTA2?=
 =?utf-8?B?d3pyc3lEb2FmNUJTQ3ZHeGwrcktZVmQ4a2tXWWhpbGNhL0UrRC8wUWFzdEpl?=
 =?utf-8?B?TjcxVWJUR3lYM1kwcFN6N1pGenlVckR5Zys0QkVOMkFWdnJLV1BVK2VxWFA1?=
 =?utf-8?B?Q1hhY09UWlhhQWNSZGdOcFFxTVpFZE9SZHc3OVVzajdNQytKcnZCL1FYTEZB?=
 =?utf-8?B?anl0SWtsVFVwTmk5MWREK1NxTXhDNVUvZGdMZkJ1YUphczI5Tit0NHdQenRw?=
 =?utf-8?B?MUFiaWp0Snh0a2JpZkxETDlPUVhQSWNtdm8wRTZMeEY0TnVKZGRLdUlHYU9T?=
 =?utf-8?B?dmNTNnFwT0pHSnQzeWhTa3JLWTM0NmFraThTeGszOHdUMU91NExEQ3BZWWlZ?=
 =?utf-8?B?Vy9WaDZhTUJSUmF4eUtiWFRpWklVV1Axek1NdURieEgxZ21kbS9WQS9tSUZl?=
 =?utf-8?B?UlI2aGxwMGxmbll0aHdpam1RL0F1RU9lYmJJTVd3SjZ4eDZkNThSK25vZTRG?=
 =?utf-8?B?emRFYWhtQ3BITVd5Z1htTG5kUnM2Q3kramNUYUJrcC81cnJTd2tYSExHaG9M?=
 =?utf-8?B?cVBxeWdaSEVkNDJvT1VwZ3UzRzJsOXlCYXdvSUI3OGh6M0FkWEl2clVlbGIy?=
 =?utf-8?B?d1UvVzNSa2QvQUt5Z0dqQXpSVDJhYkRNZS9OdmMwcVp1dUFOczFicHcwd2NG?=
 =?utf-8?B?WUludDQ3TUltOGFIK0dPZW1YdlRid2FmNDZlSWw3R0VVcGtXU3BTLytOaEZE?=
 =?utf-8?B?SUFZclpLNHJGREYrWWtZL0sxSGlPVlFYWE1KM29rOU5FQWNlSFQxOUM0b09u?=
 =?utf-8?B?NzRYOG1NWXpDek90L0xQdUsrUkgyRU1QVVBwUnRwWFVwa2NkT0JVL1lBOFM4?=
 =?utf-8?B?RXh1NXNKZ29IMndPRVhEdVpiK0o3bUd2YzlpS1drckhzR3hUWDhXaHIzYkFN?=
 =?utf-8?B?WXB0THlYRU9JQUlsRnZsUk0rTUh0YzlYUGYxSGZsOFh4ZTBQZzJtMHk5WjNh?=
 =?utf-8?B?Qk0wZldMR1dqbXAyeDVVZ1VmcjY3ZjhRZ1VFR2hzMVJ0RWRLUGhqYTNFUHJp?=
 =?utf-8?B?K2xYUnRrR1hsSXNuK1NaN3Q4YUs4QWN4M2EvdnRZdWNneTRQNVpmcUdES1R0?=
 =?utf-8?B?azhhMVJGWDA0cTJxWDNsYUpZbGpIYkozQVdZdkloZzFxWkJid2puSzltM2t4?=
 =?utf-8?B?Vnp2cHJrMVI0Q1JNaUN5SHQvTE1YQUY5dlBBcDBqM3EyUGk1UnptbEFUY1A1?=
 =?utf-8?B?WVZBOXI0dmkwTEhUdVdOanY0OVZZQlJFSklITlM2bGpRZU51Z3J2N0E0UXdI?=
 =?utf-8?B?cW9NTXJWWkF6V1lsNGFNNlBibzJ2aGx0UnM2VjlVYUw4YVZ2Zk1ncXgxYXBR?=
 =?utf-8?Q?MuC+onk/3DI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUFFdHRkNVdWV25ZNGE3UTVPUEZXbE1BekphQkpnNDhxYXVXTWxCaStFS1Aw?=
 =?utf-8?B?aFN0UFJMZS9Mc3FCeFQwMDQ4NjhhejAyRnNUT3F0QURKVnVjdXlSa1VLdXla?=
 =?utf-8?B?R3RRc1BtRkdCZnJRT1lCcU4rV3RNL2tRdks2OVl4bkNIQ2l1WVBPMVI4UWJQ?=
 =?utf-8?B?SWNkZE8vaWkxTkdxMEtkZFE3TW5sWSsvY1FBTGF5SlpqTXNEVlFZQTlrT0VB?=
 =?utf-8?B?L3QraGsxRnVrNGxmZHBQbGkzd3hEenhvempBdHNPZ2VIcUZqOVgzZ1drNjI2?=
 =?utf-8?B?WDdVZVVDRWVCQTFCYW1SdWtkcjF5VkVuTjNxaTBGWWkwVDlYaWc5b0QwSDIw?=
 =?utf-8?B?UlFsdHNhN0tXSDlQWUxYVnVQbmo1R2RjeDdKbzdObFNNTnF0aUs5T0wvL0tR?=
 =?utf-8?B?R2I4SWY1SkRzaDhTRnp4VGN6dTM5MVpnenRKbXJnYmdpSkU1MkJLRE01bjl4?=
 =?utf-8?B?NzZzb3BEbi8rOTdsd2VtMjN0aFNmZnlaMkJhK3FyTTZUMXRBVDRtWWQ4SkRC?=
 =?utf-8?B?WXp3cGE4S3lnSnd2czdmTE42Rlc1bFpOTTA3TTV1d2gxQWNoZzZMQncwNERr?=
 =?utf-8?B?Smx0eEI0V2xjVTBYbW14WkxhY3hnNDNlV3VhTHBZVDdUT1phUjJjaGU0Mnlp?=
 =?utf-8?B?WUY5NDZyRysxWkI0T1l3T1RHWUhxNkd3RmZNcWJDcGNQQlBZNEZRbjNQZUEz?=
 =?utf-8?B?QnVXeFBnYmZUSU5UQkFEeVJBS01LUUVpNDFhcjloWE5YVTExa0sxOXc4MnUy?=
 =?utf-8?B?ZlI5VjhodkM4MlEyQ1p1ckk3L3N3Rk8zSlcxemQzQ3I0Rmw3dGNBWUJPTGE0?=
 =?utf-8?B?K3MzNjB0TUMrZHcyMStsdStGdm9lbWp6enN0K2FyOXJRRWQ0WFhrTHVYbWNI?=
 =?utf-8?B?cE9oYVdPTHZNOE5XQ2VFYVdjNGlBNGhnUEpKYTBlS1FtWDh5ZXdudUxjZi9G?=
 =?utf-8?B?SmkxbzZtL0M4VWtwRnBSUThXVEw0TjdKOWhab3ZGSzVPeTJEckhxbE1raTd1?=
 =?utf-8?B?MlhZUW9oK1ZJNFlaSDFUTkdVZEFhalpzNWgvMm53MHNMMEM4bEtiK0h6bVEw?=
 =?utf-8?B?a1hDM3lTVFBYTFA0SGNKUTJTdEtVUklyUnZ1UjN6THRMVkY4RUgveks0SU12?=
 =?utf-8?B?eS83QVJMT1RxcG1LYUY3TW9OUTZkSkFiMUJzdGY5VjZxbXlhdEpSTCtjTVU1?=
 =?utf-8?B?ODhkK1hKYllOQjBZa1NIK05qa3JpNkRmdmFEU2FXRVJwM214QXMwVklTZkNS?=
 =?utf-8?B?R1pIU2cvQldzNXEwR2RJQkYrcFpDVkM1VWlYeVRwY0g2aG85WEZ6b1BBVTZv?=
 =?utf-8?B?RzVpTFlRd2o5UUFGKzdwY3J6cmV4N1hEMTB2ZzdsNnNqTGdOQ292RzBjMFU1?=
 =?utf-8?B?MnFwTnc2ZDdNckhYVk5ORWZ5aG9XZFdoaGIyNmFnZm1BMDBDQ0FOVlFpUHJF?=
 =?utf-8?B?YjhoY29HTzk2VGlJK1B3dUNDaHlUUndHcFIyR0Jzc2pMakYwM0pCa3JabmhF?=
 =?utf-8?B?eFA1WjMyVW5XcVNCNVN4L2dwU25IN0E3UDdHTjR0WU1TQURhcjZIMUloUytl?=
 =?utf-8?B?Vk9ZdmxQNVAwaXBYUzc0eW1qYWpna01uM2xodFlvNldyaWpIZkdTWTFIS3Z3?=
 =?utf-8?B?enlMd3hWZEl3YmlTNEN3cmQyTFB5VUNUeTdQY1J0ZzZBS2p2Rk14NzBScmRa?=
 =?utf-8?B?OXZZZGY3OERYTmVOYStNaWFJcitSY21wMmZlTDVXbDNPdzhHUHNVblZEZXdR?=
 =?utf-8?B?N0J0SkFqSWdidGlScm9nelFQYXRqVWhPbkFjbm1QOUhNNDBQWWNHcnBxY3M2?=
 =?utf-8?B?dWdmbzJmTHdreUMrSWpxSTNuUytJb0R3WERMOC85d1JqM3JkdDJ0MWJUMGFX?=
 =?utf-8?B?b1Iwa3F2dUp5dUlCK0FSOGJuekFGcGhrYzlsUnRaZWhpVDkydkt6bkNyamdw?=
 =?utf-8?B?UnJ6U3ZubElLaXRja3YxTGVIZDZqTU4rZExqcEIyVHA1OW9iT3JIcUlSVFNj?=
 =?utf-8?B?L29oTFl0Q3ZFOGlVT0VJV1F5REs3UVZPeWFwZkJnZXRqd1JCN0huSnMwVi9Z?=
 =?utf-8?B?M3FickZlbXkzOTBYU3dncTA5aUNhVko4NUdTSW1mVkc3LzlzMnlhUHJPNldv?=
 =?utf-8?Q?u/VCjz6ZG3OzirJccZsY+XCEH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e009985-a12c-454e-3c8c-08ddda903f3b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 17:38:43.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJGaqv94P9QP1nXeH+H2L2lzeA35/iBuv3JBBpK6Q2YnbJIk0mfWYYkFs/HOwaNhoWszTrXk3X42M79tw+EYzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C5964328
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

Hi Lucas

On 8/13/2025 4:53 PM, Lucas De Marchi wrote:
> On Wed, Aug 13, 2025 at 12:28:07PM +0530, Riana Tauro wrote:
>>
>>
>> On 8/8/2025 10:59 PM, Lucas De Marchi wrote:
>>> Now that additional WAs are in place and it's possible to allocate
>>> buffers through debugfs, add the configfs attribute to turn PSMI on.
>>>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_configfs.c | 66 ++++++++++++++++++++++++++++++ 
>>> +++++++---
>>>  drivers/gpu/drm/xe/xe_configfs.h |  2 +-
>>>  2 files changed, 63 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/ 
>>> xe_configfs.c
>>> index 17b1d6ae1ff6a..8cf6b1375b7d4 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> @@ -77,6 +77,16 @@
>>>   * available for migrations, but it's disabled. This is intended for 
>>> debugging
>>>   * purposes only.
>>>   *
>>> + * PSMI
>>> + * ----
>>> + *
>>> + * Enable extra debugging capabilities to trace engine execution. 
>>> Only useful
>>> + * during early platform enabling and requiring additional hardware 
>>> connected.
>>
>> %s/requiring/requires
>>
>>> + * Once it's enabled, additionals WAs are added and runtime 
>>> configuration is
>>> + * done via debugfs. Example to enable it::
>>> + *
>>> + *    # echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
>>> + *
>>>   * Remove devices
>>>   * ==============
>>>   *
>>> @@ -89,8 +99,9 @@ struct xe_config_group_device {
>>>      struct config_group group;
>>>      struct xe_config_device {
>>> -        bool survivability_mode;
>>>          u64 engines_allowed;
>>> +        bool survivability_mode;
>>> +        bool enable_psmi;
>>>      } config;
>>>      /* protects attributes */
>>> @@ -98,8 +109,9 @@ struct xe_config_group_device {
>>>  };
>>>  static const struct xe_config_device device_defaults = {
>>> -    .survivability_mode = false,
>>>      .engines_allowed = U64_MAX,
>>> +    .survivability_mode = false,
>>> +    .enable_psmi = false,
>>>  };
>>>  static void set_device_defaults(struct xe_config_device *config)
>>> @@ -243,12 +255,38 @@ static ssize_t engines_allowed_store(struct 
>>> config_item *item, const char *page,
>>>      return len;
>>>  }
>>> -CONFIGFS_ATTR(, survivability_mode);
>>> +static ssize_t enable_psmi_show(struct config_item *item, char *page)
>>> +{
>>> +    struct xe_config_group_device *dev = 
>>> to_xe_config_group_device(item);
>>
>> To have consistency with other functions, we can use
>>
>> struct xe_config_device *dev = to_xe_config_device(item);
> 
> The struct and function got renamed a week or so ago. I think you don't
> have this commit in the codebase you are looking at:
> 

I do have that commit. It was again changed in

3c643f621621 ("drm/xe/configfs: Reintroduce struct xe_config_device")

It is trivial so not necessary and works fine.

Thanks
Riana

> 88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device")
> 
> thanks
> Lucas De Marchi
> 
>>
>>> +
>>> +    return sprintf(page, "%d\n", dev->config.enable_psmi);
>>> +}
>>> +
>>> +static ssize_t enable_psmi_store(struct config_item *item, const 
>>> char *page, size_t len)
>>> +{
>>> +    struct xe_config_group_device *dev = 
>>> to_xe_config_group_device(item);
>>> +    bool val;
>>> +    int ret;
>>> +
>>> +    ret = kstrtobool(page, &val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    mutex_lock(&dev->lock);
>>> +    dev->config.enable_psmi = val;
>>> +    mutex_unlock(&dev->lock);
>>> +
>>> +    return len;
>>> +}
>>> +
>>>  CONFIGFS_ATTR(, engines_allowed);
>>> +CONFIGFS_ATTR(, survivability_mode);
>>> +CONFIGFS_ATTR(, enable_psmi);
>>
>> alphabetical?
>>
>> Thanks
>> Riana
>>
>>>  static struct configfs_attribute *xe_config_device_attrs[] = {
>>> -    &attr_survivability_mode,
>>>      &attr_engines_allowed,
>>> +    &attr_survivability_mode,
>>> +    &attr_enable_psmi,
>>>      NULL,
>>>  };
>>> @@ -443,6 +481,26 @@ u64 xe_configfs_get_engines_allowed(struct 
>>> pci_dev *pdev)
>>>      return engines_allowed;
>>>  }
>>> +/**
>>> + * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
>>> + * @pdev: pci device
>>> + *
>>> + * Return: enable_psmi setting in configfs
>>> + */
>>> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>>> +{
>>> +    struct xe_config_group_device *dev = 
>>> find_xe_config_group_device(pdev);
>>> +    bool ret;
>>> +
>>> +    if (!dev)
>>> +        return false;
>>> +
>>> +    ret = dev->config.enable_psmi;
>>> +    config_item_put(&dev->group.cg_item);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>  int __init xe_configfs_init(void)
>>>  {
>>>      int ret;
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/ 
>>> xe_configfs.h
>>> index c14588b86e833..603dd7796c8b2 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>>> @@ -16,7 +16,7 @@ void xe_configfs_exit(void);
>>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>>>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>>> -static inline bool xe_configfs_get_psmi_enabled(struct pci_dev 
>>> *pdev) { return false; }
>>> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>>>  #else
>>>  static inline int xe_configfs_init(void) { return 0; }
>>>  static inline void xe_configfs_exit(void) { }
>>>
>>

