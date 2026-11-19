Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D349606A32C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 05:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SyrsisQB;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cu0ijhD1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654A210E21F;
	Thu, 19 Nov 2026 05:14:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E494D10E21F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 05:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795065257; x=1826601257;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pG+Qqgp7CQv4xRC2CL4QFNhxgfuOVxwBX01lWCrbRAw=;
 b=SyrsisQBEhBesyyQQdF+oGHFfjvvXoorLawWobOD8WYJw2//Q90hk/SZ
 fQZ54Z85eiM9u04YZ6DF5UjOATjFDozzHHCZMhK/uTjAGJW96FKko+7UC
 ged6AtsQZGwLRqnf4SnmAf3ylPIMJGXwCxASDx6MmMgaOtreiuKGBnnRE
 PJhx1S7WiWQSiug/s52KNxKDY9E5xebwiTFC9prlpJ1wjNrkmPC586soG
 LGf0ilOg5Z7iubBwkbTqUruSTV7vIEMfk6oGUFC94uG9l9hEY0bodUINk
 +wKVD7QEpVb60udM0M1cnRFmHa/4+ne86TBQUl8YHBCU5v2AsulEr/6sd g==;
X-CSE-ConnectionGUID: tLCLAiR2T3OL2sMQb5SYUw==
X-CSE-MsgGUID: wn7ABZVSQKOyg9fIOCTpjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3895009"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3895009"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 21:13:42 -0800
X-CSE-ConnectionGUID: eRV2KvsPRSaTPyOOoNKaaQ==
X-CSE-MsgGUID: yK9dsgqORruPmZpLOvOGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10672066"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 21:13:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 21:13:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 21:13:42 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 21:13:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCVCV8ngPd9NyaKf70VIGZF6pOQs+Y8FLemERZ6jM3cpMcAouu2lW3Z//3ygeGV52OR+qOc/D8F1G7x78d75hcdb94SjFIUjGvavQB5OdulTIUIxN833OWxenMeqtBLT4Aqu1eUnHveyUfjnX9L0tmuB5Zjnme/+Ja6jdMMBfW9X5SfuYkDEEodrTjx804jKNXnXZnlWp0cqpunni2Woa696Z3CzrR62WF9o3qYjKM4rZEyEdoI1PQOQCAVPWQb03BqRSEsxl6qRNH3Sav8rgHY9vkXCAwkP/eLV+M03raqsarmR6fEeU3rvC92DBPyibWofVIoD+ajSBDq81fLZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO3c/jcOwFka6qKzZIJnJEUgxABgRD7kWObx/7JE8m0=;
 b=RZrqm1McxdbHOVBAxTk3GpT4gKKJAWrkdW7jHMLtqmnfoVyarR2lrU6JsAdo19Av/sA/LyOxz7ZCZwvYEnFGUq3SlZ3NyHAKSfZbntfbZ2qd/r0qEv0abJ+m9fMeC7FJ6E5uOwaZZc3FcX94sws+8l1vDv0ySZg+RyOAaQZ+966jLpELU+vX4gLn54oslK8ufLmMIxgx//mFgW9LGgWc8fLjvG8/ZoP5w4PDEYihgH+zqfptHbUF26bQlQTmJLrwuPWH9jFQI8zINOOPVXWLOov+zvk4zTD7r1AEjmBCwDGvLZr6hnW0jvzSrRB+eLvd1uXZuJWYjNRrSJhn2bAMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO3c/jcOwFka6qKzZIJnJEUgxABgRD7kWObx/7JE8m0=;
 b=cu0ijhD1lRvkLPcS0zI3Qj8Qdj6YRdPKzr+eKwIUvmN+XPWrLo1B4yiSJlYSWLbTc9jJ3oZIJC1e+EqNM4liPVYACdZN2e2mN8TmsZwT3eHvtijqMWrAK0gLEKqcmdPxEYh0n9fx4mO9rfbpXUR6w2PfX5sCKpqgvQ1m2V3WPtQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8585.namprd11.prod.outlook.com (2603:10b6:a03:56b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 05:13:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 05:13:39 +0000
Message-ID: <962829df-c38d-4dfe-8881-d80236ef68e3@intel.com>
Date: Thu, 19 Nov 2026 10:43:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/survivability: Fix infinite loop in aux info
 traversal
From: "Tauro, Riana" <riana.tauro@intel.com>
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>,
 <badal.nilawar@intel.com>, <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <karthik.poosa@intel.com>,
 <raag.jadav@intel.com>, <soham.purkait@intel.com>
References: <20261118185015.3164387-2-sk.anirban@intel.com>
 <4abcbc50-5014-4e1a-a22c-4ab9fac32a57@intel.com>
Content-Language: en-US
In-Reply-To: <4abcbc50-5014-4e1a-a22c-4ab9fac32a57@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a489914-d8fd-4ad1-fe23-08df45fbdf19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261022113327099003|10067099003|261102123227099003|4143699003|56012099006|11063799006|18002099003|261009223027099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8VlanbZ2OlmsMO839dnHXZsEfipDKKFee/Km2dM6xec/kfWo4mO1eauKPXv91upFuacrF3MIkllLAXIeda4k1GnPlbHIzgsOsH9pRfjpb0BARL1ksYwAdehSUQUzkCwcYg1iWe3qAFOun0DHz7MnWkoWfXnH5u/2Wih161kB2HhM4ZAKXi9dwtfWNk5sCXeUE00NKRaDNJv5RChk3b82U86WrR09jkJwgPlBU9rIYbeS/wuFlbLiblidN3wSq1E1PvNAa2Q4GeraARpYVxZIKTBBWSPx4zQyHwVZzhUxGVBPBxoZn8zKkHinn8AfK25+rI2Cnx16JjRrBitaHXaVB6f+U7lVNxbVednNj1k1EkKCS2CBNjURYGCJ9br+2hipni7jUoPj/HadluBcJcn5+/q8cX8Mpq9/jkLwmgHqLIvIaN3bPuWromqzXGwL+dzW6JsjYXUpk0N9QKZrAZ57uOu0l7seKtHlR0lFCbb02ubS2wPm/oBa10MIJ3hcUHgyfNn/pyXRW/tsnTgg7yQmty0ApUbYQ3jwZGT1kzrc5rTVmIzaYJQqf8q6WHxMxE5fymQzROzZGvNzlcQKlXNG5R9jmXx/eWc8L6UZld7d2cn6ZRhkMKMtoRE7DwaQVBQR7icY89z8X2KYvQq3IIjhgoMs8UYEV+Axuqa6bqnd1to=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022113327099003)(10067099003)(261102123227099003)(4143699003)(56012099006)(11063799006)(18002099003)(261009223027099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVHbmZrVkZwNjJRNDdZSWNlaE1sTms4M2xka0loL3hZN2tzZUwrZjNrMXBs?=
 =?utf-8?B?Z24rOG83enpwNDBueU8xYlNrejZrMG12TUp2enJsZiszYkRxZXBDUVNPVUts?=
 =?utf-8?B?ckp5T3NRUjlibTVMRHZCN1JtYi9tNEI0RG5OUloyWGFpdnUyTHZUM0tjdTFQ?=
 =?utf-8?B?eWdkNDhjcUo2VVY5U25IZzByMGg3Zjd6dHZHODM1UFhGTnRnNllzTjhCQ2Fx?=
 =?utf-8?B?UGtMSDJiNm90Sk5kUUpVNkl3c0dKSVRlVk9MbXI4ZlN3K0FmWU5ycmdncnl6?=
 =?utf-8?B?ZUluN3kvWGZjbG1hYldxMFZRS082Y0F6aEYwT3hRcUpHWU82V1I1R0krL2JG?=
 =?utf-8?B?MG9yeTB6RktEdFZBeDBPT096ajA5dCtvbXBadmpXbEVvTmNOdzhXOXFxdERs?=
 =?utf-8?B?UEVOOGdjZ1ZyMEVXRVFLcFJZay9tZjNCOVRWN0k1RVpSU1JuazlwRlJhTTNn?=
 =?utf-8?B?VVpKR1piOGdkbmFZN3piVjV4MUtRS3lUakpMVzhta1RDVEk0NHIwMmpGUTRu?=
 =?utf-8?B?SG5DbFhpTmRvZldVc054YnF3Um9ZUlV4TkN5NVgzbWVwQnM1S2NrT2N5c0Rm?=
 =?utf-8?B?M0grZGN2MjhDLy9KTWp3a0tHZG5DZmVGMzloT0E5Y3RVU1JVREZ2eXN3cUQ1?=
 =?utf-8?B?ZGx1UUpPOGtVZ0NseXZhWlBqTkZodDE4VlNLVW5RVUdJbjVmc0xXcU9UZWQx?=
 =?utf-8?B?Mm9paFhEbXhzU1MreFE1SGxNak9UWmdVUE42bGZoMVJkcmhqaWlnVk9QQXZS?=
 =?utf-8?B?WmNkcWlLTDZtbkMrOHAxampuTXdEeE54R0RoMmhraFQyb2ovNCszWGpkY25v?=
 =?utf-8?B?aTJGTXNoL1JMZGU2WXlJQVB1TW5sUEFUZTBkT1ZqOVlJcE1KLzB4V2xhRHA1?=
 =?utf-8?B?OUJXOGh2MXdESnVEcnVSNVZ2OTZackpkNkRZVjZCaUtMS1kzd2M0UktwT1gy?=
 =?utf-8?B?bHVHRG5KWmhzMDBySDFycHNncDdKMitkRU8vN2JHSGt2SGhkY1JpU09NV2Qv?=
 =?utf-8?B?Q0RuWEwrdC92bWZlbGNhaE9mdkJ5d1U0bDJiYlpPK0JXU2p5MXoxSE1IejVG?=
 =?utf-8?B?SlBGWWF2UGFZejM2cm41bzdHZWNtL1oyZnFBc2FjMXN0cG5MNm9Bd3c4ZzhY?=
 =?utf-8?B?cU9jbG8wbThoWHgrWE1YWVJNTmxZbjN1Q004NGNzM21SV0dLM3hkZC9Yemcy?=
 =?utf-8?B?Qm9mNklRdFVxd2E1eVA3STgrL0tUaWhtdkNwRUs3eXExVW03bmlRWURpMlNW?=
 =?utf-8?B?anVidWduYTJ3NkhIZTh1ajFsUVZ1K0xBSzVtMXJHOGw1Q29OWmlxREtCbGZn?=
 =?utf-8?B?bnZ5U2Y2M2NRVVBmOXBDcnJJR2xlY3NGNzBLbmc4Q01yS1UvZ0htWHhEcEs2?=
 =?utf-8?B?blpNVW42bHRvSHFMTURzWUxMaDAwVnFIeXJJTnIwR0kzM0FBSXFrU08wa3hS?=
 =?utf-8?B?R0szVmtQOC9uNzFtR2szVnFSRTRTcmdxaWt2UUQyaWVFcEc4VXNWQ0VnVlB6?=
 =?utf-8?B?QmgwVjFmeUtzb3VKazVXdm5pV1BqMFZPSEdYU1dSaUw2UzN1cnVMazBFb25W?=
 =?utf-8?B?Q1BTRWlKUng4Ky8vR2xDYjlIKy9RcHl3d0lYcytxeDg3dFN3WkVWTVRZbkhs?=
 =?utf-8?B?S094NUtmN2ZDbWZWVXV3bDMvNkNNc285cG0yeklUaHR3cDVpSFhPYkN1OUZx?=
 =?utf-8?B?RGlzR1daaTFXWlBpR0pEcExEb0NIdFN1bDQvK2VGZDJ4WUpoT3pOMklSejhn?=
 =?utf-8?B?aVVQa2tnb0QrY1lhK0pVdzZaSWhaZWUrZXZwcFhoZDVJUC8xTzRyZXQrUE5W?=
 =?utf-8?B?aUlGdklXWlJ2Q1dXYkZJbzJlSVkrY0NJaCszZy90VVpzSXByTFBIRTdJZU1J?=
 =?utf-8?B?QUhEeVo2ZXZ3M2FtNmV4bGpjSFlkZTlPQ3UrNTlMNjAzSEMvL0NjckFmNEFG?=
 =?utf-8?B?UDBTTnVPdmRTaEdWQTZuYjYyMFk1S29GOVdhSERleXZPNlNhTHhDQ0JnTE9h?=
 =?utf-8?B?QVNHd0N4ZHp0Z0loSlhtVDBINVc1dzRPVFBpdTc5MHFpT215ZUR2SU9vbzNS?=
 =?utf-8?B?b3NjSEZvem8ya0MzQWg2MkQrNmxBbzFPYjNvODlZVWw1b1NJalR5b0xEdW9m?=
 =?utf-8?B?YmFybi9CVXNDZkFsWERpQW9sZ0lQOW94Y1ZFU3Z3UmI2NngybXpEYjc1UWht?=
 =?utf-8?B?VHhESStaRHVmbGdXZTRxa1JaRTV5NjBOS3RLS1ZzNStmUklBRUliT1VCWVJT?=
 =?utf-8?B?ZzBJNllqZ1VjLzJqaEtabGNRVGlkU0RueTlNK0RzZlJ6QSs1MnhlUkduY1RX?=
 =?utf-8?B?dk00VlU5YTRiZWd1cHRtaDQ1a3lBYmVqcWVSaFpSVHRqUnhkM1c0Zz09?=
X-Exchange-RoutingPolicyChecked: r/n5YP5Xyg0QDOJwAyitKx6IdCY1R0XLms26rACQFEwUYkYEEwbNiitEvEBHNzB9EFjQkW8Nf3yfu4/Cx9Gi3g2TdJtybXyuoao46gRkhVw+eF7cXR22VyCWkh2nslU2fOVqd5IPcJpTcFTAsbvSbPRFuxRc2rMrZ64hQ+AwQkUX5Wh6VX5mKEYZbjjSc8BTHaK2atexn7baoEkbc17h+pDLUyFu4mwWmNkrvFnfh2W5ChLhpLAX53Um2nwSh9gyFgrFg9QIq2VfGgoCCgbEhreiCqYfH2lRU+eUA4YSgl033MOTQXOtVqjLCr0f46dhVuquZCX1RwhZ/sA5nH7yMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a489914-d8fd-4ad1-fe23-08df45fbdf19
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 05:13:39.5572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNOJp3Ok8K1HzbQ+AUnddJTAA7PUFMtazpdfSdOso7MWKsnrGeimY7N9nb0PW24CGxYgcWfpr08Ytq5oTnL2yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8585
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-11-2026 10:42, Tauro, Riana wrote:
>
> On 19-11-2026 00:20, Sk Anirban wrote:
>> Stop traversing the aux info linked list when an entry references
>> itself, preventing an endless loop and soft lockup during probe.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c 
>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 91a0680e449b..34d39e68ff36 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -172,8 +172,14 @@ static void populate_survivability_info(struct 
>> xe_device *xe)
>>       if (reg_value & AUXINFO_SUPPORT) {
>>           for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>>                id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
>> -             id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
>> +             id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id])) {
>>               set_survivability_info(mmio, info, id);
>> +            if (REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]) == 
>> id) {
>
> Thanks for fixing this. you can add the fixes tag
> How about bitmask ? If there is a bug in fw where 3->5 ->3. We would 
> be stuck in loop again.
>
>
>> +                xe_warn(xe, "survivability: %s points to itself, 
>> stopping aux info walk\n",
>> +                    reg_map[id]);


@badal/mallesh Do we need sigid for this?

Thanks
Riana

>> +                break;
>> +            }
>> +        }
>>       }
>>   }
