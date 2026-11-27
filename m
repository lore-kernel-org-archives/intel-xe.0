Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05144606A331
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WLShR/I1;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=dZc0riIl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECFF10E045;
	Fri, 27 Nov 2026 11:28:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4353610E045
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795778884; x=1827314884;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9m1xeXnoK3tP/B6KSMCOyo51FJv1jKGj8gN40DvvXPw=;
 b=WLShR/I18gHN+Uo28c6FsDwMYPWUxgg30lK0saDCP0Faqy5S4vYqAYTR
 s92PwcGZmzbtZ+jZ0pwCv8zHLS90/sYlizVFIHELp4marTF4q4bDyxsuG
 0/Qup2ybbm9jmANxuADNwNeWbhH5tW3nMrdRbADqhcnqqSOBixvI8PoWZ
 ATGcGU1+3yIVMGR9cdUV7p1fR/ipO9Qf2yHOxdo1JkX8D2rxMpg5bt4Fz
 k9f8YhPIoIh8n74oAr+LM3pUQNd5GxzrsiZUzjQuyu8gkT8DOPBE7lrxB
 ehUB1CMvPNpERkO1iTYzMcNksFIKhU0aulAGxMa6Cw2cOxxqjJB1UJqtT w==;
X-CSE-ConnectionGUID: PfkxFaBwSfuQn/Tp1p7t7A==
X-CSE-MsgGUID: 36H1OTkjQVKZ4bYL3yAFJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4701262"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4701262"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 03:28:03 -0800
X-CSE-ConnectionGUID: IaFOAwIYTP2a/B3SDWCiow==
X-CSE-MsgGUID: 6l1prnXFQp+nTf0vzXOIeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12416914"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 03:28:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 03:28:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 03:28:01 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 03:28:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5WviS3rHocjBJKj+6xSKkMWd9zenH0/4553edSVt3zqVPs25gmtwFfOukh6itzScn3QPY+dtz3HCGCHO0VpmQK1dQLUQhPl+IXyPoQLsQ/rtTE78ahmxlrhN6JfoxWnz3uSIWbU3x+NG22k3b4ggEW3PfIuwXAExp/fMq2tfKqkRhIcEA6CuYEThEYeG34BiY4PuLO8wrEILJZXu2Y/qvOGTIToe2I9Ss0RWpuuSfiTxHO0vyeN+oyK18HFRlWafLb3Ijwj0hthd8tWFFYZHXmfRXpEE0t10+zNzUF1ehWd5GMdflFCbJAovuY93hnC4r9H396FlcpwrzHv2j0siw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc0F/7aa87zvU3ytXIABYvus9tRY4a4ZpN+zzuJPJ/s=;
 b=NW6ATiN4yQG+xF9gFx3YXPEvmv/V/4+hDC1KMnT3GN3iqw+F6lOImYShwGmHLMjvOpoOk7MM8LjS8svhgdJnIN+tR1wVklIoFtyDzIcp4iUhNz8l3NUphMBswDwiqGtguKDzhe9wvqH9PcCIwGNHlQ4K/cgmKQjIMc3oiMLSHaCcnvnp32O0HNidEcnhTAxffZxFH4R7hv6uFyAIhUtL0bcG9LnVHyj3++3wI+Jg/WAz5aYrkoerdp54tnj0hNR08lT682WwV/ibYMYGLF4Fl5lgKYX+i5uxakkxYsDc5LfrvzNAqCNaV82yCsuGCJGYR7KcoGttjLA+lKulnbs4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc0F/7aa87zvU3ytXIABYvus9tRY4a4ZpN+zzuJPJ/s=;
 b=dZc0riIlf7Q/70EzeQ/lsXkk8suXRIxyQQcB/QZS1nHphKR9vBt/oOE9//XQWy4aEyHhnJlZ0WDrle3yvf76c3dXBXSRENMWwGiItnJ4dqO3GWzM6G4yWpjeHfiUDoNFNamwydSQ+SrVbvZTIKL3NXtC7CJpUeewdSihyVBc+rM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:27:59 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 11:27:59 +0000
Message-ID: <0fbc3156-c2e9-4900-b3a2-553f5152193a@intel.com>
Date: Fri, 27 Nov 2026 16:57:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/xe: Disallow freq changes while mert cap is
 active
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261120225325.1460380-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20261120225325.1460380-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::12) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|BL3PR11MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdacfd5-1384-4694-4228-08df4c797d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: B2RC4oNcDsm97RxfllG8+ScnAhSWAtNeMPHxFCazos57sGHqPxNGsvoGF2/Z7MDkbeCzULbE2NWSljQ7MQ7AoYcGUsqs03V+X1BGHrGAgfYswVEx5RIObl0rOFAcZIzLgNyii+Ba+f9uQJMLolTBU3lSYSv0vAjjV4noTxPO3ZnlvRnCBEwp6x0vnI/4Z9LY1vDjb0nlvpJWf7NwWnIN/fJ0cqBhW9DjfJ5xhuUPgegAjRS71d1LzTnf5M7D3B0zOUl+hsfEu+MozHfZM4S2DLFoMxDhTNu1SvsnBTqgAUKWuIPf3tH1Nv1soQHjZL187jsRE5NW6RwM5wjdwDLhpQwAYOLAtNP4LZckn0HaIHPk3JkBBqNE4QWQeAZE2YmibTVQbQVhbLW1QMsylbzZY+U2FKI6cYZm4Ec1ALlr1xVUSbEj+6zlXe6rMOY3omcZnP8UY99R10rheJFV2WoId0iKZPEdFAYN0TtMsurT2IftCskvmSMPhKUqJpZg6M0jC43tr9k6Gdn57uSOHCmAvIyHz0rCapiStC5qLpnB3fNV3d/CFsITa8NegmD/B7vCBvGF5Ymqjcae+tmoSQxCzXp69h9lfdZPwXEPJKhWFrGWV6c6RJAVsIvwrom1nZHla4rN8FgZkw0FnxhPc7NRqn3qejoReXT3Aite2mKM94s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmpBWmhtUkNLcHAzMExjUXcyL0QyTDBLY0pOZTQwQ2hwTk1oNmhEUm5NYmNw?=
 =?utf-8?B?K3UvczU5aGVPRXA1bWFIUHh2ZEliZkRza2F6RTZqRnVtbmhVZXpaZXVibmN3?=
 =?utf-8?B?eFJDMGdidW94RmZIUWdBRC9qeGtpTDI2bU9Da0o2bFQ3UVBlYWtVTk1QRE9x?=
 =?utf-8?B?UHhvSzQzWkdQZm8veDk3bjlJa01IVGJienlKNHRzT2Q2Z1IzNUFlaEU5dnNj?=
 =?utf-8?B?dy9Cb0ZtOGl3QkhEU1lMam9TMVAvdU9CZ01ycmNyRTNZeU43TXExZGpucmR0?=
 =?utf-8?B?RzMvcnpINE1XaUpMMVZ3eUdvdWt5cHh2b1U4WmNjTmV5c3RxVjEyTGtPQ2tD?=
 =?utf-8?B?V2NBZjVVQ0ZhQ1h1dWgyS2xKQU9uSEF1UlgwNUJPWFp4Rzg3d3hLazZOeHcz?=
 =?utf-8?B?TE52U1U5aHh0U1ZXalBxTnJmTm9vNkpTeERBamZ5RTA2dVM0cHM4dlFJSmgz?=
 =?utf-8?B?ZGVObS9UNXRFWC9UcTJMTStIRDlLcmdvM1dyYVNyVUZQU1BrWjlBY0l6ZVJB?=
 =?utf-8?B?bUNkOWd5V284OEdYa0tjeGh0Y3ZySWZPZ1FvZVhQYU9LUGRISUoxWVQvd0ZL?=
 =?utf-8?B?QXlqS1NRTzVlTGhLUVZhM1hDRkNjSFBOSEtGd1ZabmFzUVpPUXlXdm5BenFj?=
 =?utf-8?B?QmpBUkRBWU9KS1FsV0U5a3dkcExaMlVpT2Fra2xUeC9wbHZtVXFUZVZIREVh?=
 =?utf-8?B?cm4wdnNwNEtqNGJ0Y1pOWDJOdVBXczJkdU8vNjhVcmtzOFJXYWFYZFRiek8w?=
 =?utf-8?B?TUtKU2lPYWFVekVHOElFSUM0TmNtZEFrZmVISjdqZGVtVHgzTDVYV1JWbjhy?=
 =?utf-8?B?Z0EwTDZtRjNwTTVjZldZT05CWmZkaWk1dkdvMmxpMUNCWExjcm83amFuMG9M?=
 =?utf-8?B?Yld3dGFLZE5iYktHT0JoNjZFSlVOQjhwWG1JclZkSDd4RWV5cytIcFlEQTM1?=
 =?utf-8?B?UFZnTWErak1sOXpSRWFsdFptWU5GWmV4Z1B0eitEMERWKzBVSmJqa1NubEts?=
 =?utf-8?B?Zkl3Vko1R0lyNDR6M2kvUjFxWHdRTFE2b285SGZZdTQvVUJVUnNVc0hlTmpi?=
 =?utf-8?B?Mjk5UzVLMTd3dEhPTkw5K2JaNHo3TEw3b3lzZllxU3RHbmZRLy8va3ZlRUp2?=
 =?utf-8?B?dE5hV0puTmplbGJMZzV4d1U5VnB2a2FKRUhrMlFSVW9KZjM1UHFQQzdGOUlt?=
 =?utf-8?B?dHhpYzZxYmt6Z1Q5L2hLdUJnZWl1Q2pRaGNORmE2M2J5VUQzdDJtMEFlMEZL?=
 =?utf-8?B?SFZLMGF5Z2tySHR2Yk11UXAwVm93Vi8rdmRHbis4RFZneUlRNysvWW0raXIv?=
 =?utf-8?B?b0FVYzlhaHRmSVFCM0RKVWk3MUFzSHpiYmV5cCs5MUlYSTVVTi9NTmtPK2Jm?=
 =?utf-8?B?QXBPTkJwWGdWcFdQbFMzRXp0ZzZYQ1BuWGY1Y29ib3hUdlNUNnFmSnk1U0I2?=
 =?utf-8?B?UjRWM3MxYVRPU2NBMW9jZUF1ZVZpVkRrSkVLUDkwaG9DdkZYanB0KytPVS94?=
 =?utf-8?B?V2JaSlhOVHVTU2kwc2JyK2RXSUJpK1RHK0pZS1R6N2JtVERiZFRNNGpYYmNL?=
 =?utf-8?B?TnI5OUcyRllGdDBJWTVyTWd4dmRpRWdXUSszVjJzb2NvR3VtS1VpdjR3RUk2?=
 =?utf-8?B?RFRsL2FlSWcyVjMrbFZtVVFCUmc0cG9sTDd2V2NYd1Zaa015WmFnbE5IbUZV?=
 =?utf-8?B?UjhjNFRRYkNwZEwvL0hBNS81eXNtUVdmUllFcjVvc2lzQXRmMHlpYjJTdmkv?=
 =?utf-8?B?RFk2aldoaVZSVzIvT2hSNzV1WXNhQVozcVRCTHI2ZFpIMnI0L2hsTUdETTVj?=
 =?utf-8?B?eDJ6NmVtK1lsaElIamhoOUlxNy92ME1iV1Z5UGpMV0F3b1R1eU9LTXAxQWwr?=
 =?utf-8?B?emJFOG10UktVbDhWczNaejJhYnEvTDZVMXkwdmM3WjNrdlh4VU1ydCtHK0Jh?=
 =?utf-8?B?OXVIN0w4QXdSaUM5YUNIMm4raTZ0d3hEOWxyMHVrMlg4Wkx2S3p3RzlpdUp3?=
 =?utf-8?B?bWFObEExWmUvZ2ZuM0NGT0VUS2pHNHBOQmlLTk5MVGtmMHhBL0JzWmhxa1pn?=
 =?utf-8?B?dzNIY0d4S3Z0Z2dHRWNEL2UySkE0ME12M1ltWjluUFZ1bXhoWXR2MUtNblpS?=
 =?utf-8?B?dGhpTUZXTTBMcGxhNy9UajNRSzNiYW5LVlhhUERjZlRhQndyQ2djRG9EK1pK?=
 =?utf-8?B?WmhYOEpWSTIzNlVnem9NcWRodHVYc2xGd0tnbjdqN2lib0RWaXlFaDlyUmYx?=
 =?utf-8?B?QUV3VUV6WVFUc21tYnc3YitOSnRVcTl6Ynd6MFdtMnFLYmtiVFh3NDhxZDcw?=
 =?utf-8?B?WG1yb3dRV2J2a3V0SUI2VWx0aHZjTG1oaFVPZk5jdHZVZHc5SHNPQT09?=
X-Exchange-RoutingPolicyChecked: Qv3LjT3HV131jv/WHfrna2UDLd2YX/zJIySl0F48HUY4KjQP3/88kfxqRXnzwybLh96UI3CPtrJ02/x/oOUiSMUlOJFL8G6xpqQGpYmcJb6o0kWl9BrOhvHeZ3Bh11yd9qIISluJAdN6eSb4L/WdTE56jfIETZ07pTSbykYRJ6vTr2fClyuN2U3Uq1IZfnhJYpQdWeVvMq37yqhh3wevG+iendSBWjxfWIF0DXIDwe6fjvTW7ckRg3DP8nosOGXexEc754Ktf1M1eqwXnbvvaaNWxZkpPTS/47fHio+Sya1C7y19CDTypuhtGkqDmprD5YfckzkWuGU+Su1sHnsdpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdacfd5-1384-4694-4228-08df4c797d9b
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:27:59.2913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uj7uaAgN1D+f8NMm6j8nOoP7+m+U69hH/UjVAT/zlOhz3nCSfA8jDNOwhdnJ2Uc6/nqIvCTRi8/mvwU/KL76fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
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

Hi Vinay,

On 21-11-2026 04:23, Vinay Belgaumkar wrote:
> When Wa_22019338487 is applied, GT freq is capped until GSC load is done.
> During this time, it is possible that users can access sysfs to set min/max
> GT frequencies. Modifying the frequencies between save/restore could cause
> inconsistency. Prevent this by introducing a flag which tracks if the cap
> is active and defer user min/max requests until the cap is lifted.
>
> While we are here, fix the minor issue where mert cap is removed only on a
> successful GSC load.
>
> v2: Restore mert cap even after GSC load fails (Sashiko)
> v5: Return stashed value for min/max during cap (Sashiko)
> v6: Fix bug and set mert cap to false in xe_guc_pc_stop() (Sashiko)
>
> Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gsc.c          |  6 +--
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 80 +++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
>   3 files changed, 65 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 8edb8cee3cbd..d750a4c5075b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -290,9 +290,6 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>   
>   	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
>   
> -	/* GSC load is done, restore expected GT frequencies */
> -	xe_gt_sanitize_freq(gt);
> -
>   	xe_gt_dbg(gt, "GSC FW async load completed\n");
>   
>   	/* HuC auth failure is not fatal */
> @@ -376,6 +373,9 @@ static void gsc_work(struct work_struct *work)
>   			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
>   		else
>   			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_RUNNING);
> +
> +		/* Restore the mert cap now that GSC load was attempted */
Looks like the call does the opposite: it removes the cap and restores 
the original frequencies.
> +		xe_gt_sanitize_freq(gt);
>   	}
>   
>   	if (actions & GSC_ACTION_SW_PROXY)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 9558d7196a51..7cbdb7985843 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -344,13 +344,18 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>   	pc_set_manual_rp_ctrl(pc, false);
>   }
>   
> -static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
> +static bool pc_freq_in_range(struct xe_guc_pc *pc, u32 freq)
>   {
>   	/*
>   	 * Let's only check for the rpn-rp0 range. If max < min,
>   	 * min becomes a fixed request.
>   	 */
> -	if (freq < pc->rpn_freq || freq > pc->rp0_freq)
> +	return freq >= pc->rpn_freq && freq <= pc->rp0_freq;
> +}
> +
> +static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
> +{
> +	if (!pc_freq_in_range(pc, freq))
>   		return -EINVAL;
>   
>   	/*
> @@ -377,12 +382,8 @@ static int pc_get_max_freq(struct xe_guc_pc *pc)
>   
>   static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>   {
> -	/*
> -	 * Let's only check for the rpn-rp0 range. If max < min,
> -	 * min becomes a fixed request.
> -	 * Also, overclocking is not supported.
> -	 */
> -	if (freq < pc->rpn_freq || freq > pc->rp0_freq)
> +	/* Overclocking is not supported. */
> +	if (!pc_freq_in_range(pc, freq))
>   		return -EINVAL;
>   
>   	return pc_action_set_param(pc,
> @@ -612,6 +613,12 @@ static int xe_guc_pc_get_min_freq_locked(struct xe_guc_pc *pc, u32 *freq)
>   	if (!pc->freq_ready)
>   		return -EAGAIN;
>   
> +	/* In the middle of a temporary freq cap, return stashed value */
> +	if (XE_GT_WA(pc_to_gt(pc), 22019338487) && pc->mert_freq_cap_active) {
Do we need the WA check here, as pc->mert_freq_cap_active is being set 
as true at pc_set_mert_freq_cap() and
that function returns early if WA is not applicable.
> +		*freq = pc->user_requested_min ?: pc->stashed_min_freq;
> +		return 0;
> +	}
> +
>   	ret = pc_action_query_task_state(pc);
>   	if (ret)
>   		return ret;
> @@ -638,17 +645,26 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   
>   static int xe_guc_pc_set_min_freq_locked(struct xe_guc_pc *pc, u32 freq)
>   {
> -	int ret;
> -
>   	lockdep_assert_held(&pc->freq_lock);
>   
>   	/* Might be in the middle of a gt reset */
>   	if (!pc->freq_ready)
>   		return -EAGAIN;
>   
> -	ret = pc_set_min_freq(pc, freq);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * While the Wa_22019338487 cap is active, defer applying the new min
> +	 * to GuC; xe_guc_pc_restore_stashed_freq() will apply it once the
> +	 * cap is removed.
> +	 */
> +	if (pc->mert_freq_cap_active) {
> +		if (!pc_freq_in_range(pc, freq))
> +			return -EINVAL;
> +	} else {
> +		int ret = pc_set_min_freq(pc, freq);
> +
> +		if (ret)
> +			return ret;
> +	}
>   
>   	pc->user_requested_min = freq;
>   
> @@ -681,6 +697,12 @@ static int xe_guc_pc_get_max_freq_locked(struct xe_guc_pc *pc, u32 *freq)
>   	if (!pc->freq_ready)
>   		return -EAGAIN;
>   
> +	/* In the middle of a temporary freq cap, return stashed value */
> +	if (XE_GT_WA(pc_to_gt(pc), 22019338487) && pc->mert_freq_cap_active) {
same as prev.
> +		*freq = pc->user_requested_max ?: pc->stashed_max_freq;
> +		return 0;
> +	}
> +
>   	ret = pc_action_query_task_state(pc);
>   	if (ret)
>   		return ret;
> @@ -707,17 +729,26 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
>   
>   static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
>   {
> -	int ret;
> -
>   	lockdep_assert_held(&pc->freq_lock);
>   
>   	/* Might be in the middle of a gt reset */
>   	if (!pc->freq_ready)
>   		return -EAGAIN;
>   
> -	ret = pc_set_max_freq(pc, freq);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * While the Wa_22019338487 cap is active, defer applying the new max
> +	 * to GuC; xe_guc_pc_restore_stashed_freq() will apply it once the
> +	 * cap is lifted.
> +	 */
> +	if (pc->mert_freq_cap_active) {
> +		if (!pc_freq_in_range(pc, freq))
> +			return -EINVAL;
> +	} else {
> +		int ret = pc_set_max_freq(pc, freq);
> +
> +		if (ret)
> +			return ret;
> +	}
>   
>   	pc->user_requested_max = freq;
>   
> @@ -1094,6 +1125,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>   	if (!ret)
>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>   
> +	if (!ret)
> +		pc->mert_freq_cap_active = true;
> +
>   	return ret;
>   }
>   
> @@ -1112,9 +1146,13 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>   		return 0;
>   
>   	mutex_lock(&pc->freq_lock);
> -	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
> +	/* Apply any user min/max request made while the cap was active, else the stash. */
> +	ret = pc_set_max_freq(pc, pc->user_requested_max ?: pc->stashed_max_freq);
As now user_requested_max can also be used, we need to fix the function 
description as it still says "Set min/max back to stashed values".
> +
> +	if (!ret)
> +		ret = pc_set_min_freq(pc, pc->user_requested_min ?: pc->stashed_min_freq);
>   	if (!ret)
> -		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
> +		pc->mert_freq_cap_active = false;
In the event of a previous H2G call failure, the flag remains set 
indefinitely, which may unnecessarily limit the frequency.
As a result, the user could observe an elevated frequency while the 
internal limit remains lower. In my opinion,
it would be better to restore the flag unconditionally and log the error 
message separately.

Thanks,
Anirban
>   	mutex_unlock(&pc->freq_lock);
>   
>   	return ret;
> @@ -1345,6 +1383,8 @@ void xe_guc_pc_stop(struct xe_guc_pc *pc)
>   		return;
>   
>   	mutex_lock(&pc->freq_lock);
> +	/* GT reset could occur while mert cap is active */
> +	pc->mert_freq_cap_active = false;
>   	pc->freq_ready = false;
>   	mutex_unlock(&pc->freq_lock);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 711bbcdcb0d3..9a6ea2904e33 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -35,6 +35,8 @@ struct xe_guc_pc {
>   	bool freq_ready;
>   	/** @power_profile: Base or power_saving profile */
>   	u32 power_profile;
> +	/** @mert_freq_cap_active: Wa_22019338487 min/max cap is currently in force */
> +	bool mert_freq_cap_active;
>   };
>   
>   #endif	/* _XE_GUC_PC_TYPES_H_ */
