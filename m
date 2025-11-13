Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD2ACD4F57
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 08:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682CE10E5F0;
	Thu, 13 Nov 2025 08:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDVvd2R5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A313A10E5F0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763022390; x=1794558390;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F8kEsHX+BeyYBk7IXCXsNrPm6o/tEGvRM42a6RZatnw=;
 b=NDVvd2R5w2XFSpFXKDC0oIzMBcJeebi3Dz0Tf74FfHKmU8RcjWI4/zqf
 nfzCtsilS/Z0zGb+PgGSP2FFAHqkGTn4pL5hmQ7JaINhhkW/PejtGarjz
 +X3P8d8y0DtFL+bqppvm/ukN6uGmcMQ6xok3m7K+ceZd/jA7spZgvfL6D
 YDTTYG1BIiguu70F+4ofS3oV8Ap/Qw6tRrQBatBQpwNySHh6lgtdkoc6S
 gvFzbkXsyOAwQOhnpL9yjRfUYTLNtVT10sG57jn8GwnL0NNf8lnYofdIW
 tViCmUO5/qCntGQCnl2pliMwNgjWOQP7AHdt3kPjcvukgf+lfHJhBzLnM A==;
X-CSE-ConnectionGUID: RxEehmm9Sn61oHoDS2satw==
X-CSE-MsgGUID: i9AlYorYQzCqjdaQkyaTyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75410393"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="75410393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:26:30 -0800
X-CSE-ConnectionGUID: pLqE+To5RVmpa1wNG7j18A==
X-CSE-MsgGUID: rgDBBqsCSLKEvvneXMFLnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="220210169"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:26:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:26:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 00:26:29 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:26:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bt0MiwnHKwdLRaioiS0cL1RGe/rSL2awC0G+nPUIlGKCHYuSj4jXCFa4RA4DuqbG9zghW81oQkzjHvHpUaot8LgpMw6xItkFWnq2qViBD6hRDJuJhb/AwFANZQZwXPC1Erx7U27XtIRv6rQDRHXC34r1k8UJ0t8Clx6QWIo4QY67WMQW5LV7bIUoZvqvqcz0xlXNAReGyFHpa8bDxHOATux1WkZDY+/fARijk+7bOpX0FIM1jJ26ksCnNOk1wkzGu+wGuPWQTc43Gtj19CIuJLcwmEa0Ef7wISc85V+DvObcGCWNryJ2L7j0ciczsjmD0sEdkxnqLhmPYJcDwRkQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARFKnjmZ3AsY6QhecRELQXxTDiaO5MQPBEsv6/aQA5M=;
 b=Ij5dhAhuZYXXaTWbHslP8lIxLyBpyQFmGtXpJHF/R1ngxlHIdxxrMbtQ887N5f4PckYwqAcI3RUfqEXKopDqLevsT6r+XTJdOSEk5Dp7C9Ftk62HsLDVf4ulRqT/EFtjIvvK39OpmCC8A4h42lFgoGKh/4MNGsLH8b9HZfEcsbNqvUePjtbYszFkMvsOdvB7LQME+QfJ/0lSaU5fBd0Jl05y6cam4U1c7cyAEzNRFpb1Bgn3dpsnX2NcpLtPzCsCsjGlvXbFitPgkliuxpCKKrQ+pFWGrMBG3kOFAyhDrQVhuMtSfyclWrNpMesr4cz87kNeXKCaGFdFRIrwf9OyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7978.namprd11.prod.outlook.com (2603:10b6:806:2fa::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Thu, 13 Nov 2025 08:26:27 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:26:27 +0000
Message-ID: <291ca7a1-51fb-4f28-b1b7-1e4f9d12878c@intel.com>
Date: Thu, 13 Nov 2025 13:56:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/xe_survivability: Add support for
 survivability mode v2
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
 <20251112103336.1468261-6-riana.tauro@intel.com> <aRTQCoNGUf_D0f1F@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aRTQCoNGUf_D0f1F@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0141.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 98535243-380d-4a56-a910-08de228e5698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXZIcVUxRlVJZ3JiRGk2MGxISlFRRGNZek1PWHp3UGtJWm85MENxQlgxbVFl?=
 =?utf-8?B?amV4a3pVSUFUNisyVmt5ZG5rNlUxS2NLWTVyNjFpUGhpY1dnMWIzQ0FkeDM2?=
 =?utf-8?B?Q1U2MWQveitEMC9TUmh6K3NZYkVPbVpTS2haaENVWHdFQTd0RE9RNm5kbkc0?=
 =?utf-8?B?UjJaYXczekpSa0E5QklnNjZiVi83N1cyWDFCVldBRlhjMk8ySnB6cGtoQisr?=
 =?utf-8?B?N2hmWTFzKytVb0pBVXJ1blZLR1gxenN0QW1jTEV5YjBadDNYS3YreDRvOWlS?=
 =?utf-8?B?L2hJYUp3Tjh2NDBJeDNyUUlPdnJXTzdyUzdYOE9KT2pCcTVLNTR3cjRqUWtu?=
 =?utf-8?B?RlhyaE9qOEtLK3dLWnVlV2ZsQjBxL29OUXFuSE5zdzBJVERvc29SSFNzdFlq?=
 =?utf-8?B?VnRiOXVKNXVodWpFWDRVZGpvSmEyZDJSS0lyTERzMHE0clBoMFNUMHkrVng0?=
 =?utf-8?B?OVZPU01kYUQ5aGNyQ0pUa1Z6c0w2Qkc4S251VTAxUVBuWDdJVStoM29kNnhH?=
 =?utf-8?B?QmMweUhxUlNxNThGWFlWVm44eGttSlJUMUpnWE9UOGtvemlGN3hjTzZqQ3Vq?=
 =?utf-8?B?WEFUNmtBcU5HYWJqMTZqQU9FeVRoRFozRHhoUXNPelpveDErUHg2ZUNQQ090?=
 =?utf-8?B?ZVZDQjFUbTJXbHB4dC9Rd3dwZVJNbVg5REVTUWNicXdlYWg0T0FUUGlJMXhm?=
 =?utf-8?B?dTlKOUJaRmVXdUxlNkZ2dGRUT3Zud1AzMit4TENRNGpKRXNMdzdsR05SUEdU?=
 =?utf-8?B?dENPSnJwTFlVM0p4WVFrOTM1dzdXNWJHeFAvNUNmbjNQUUkwaTkyMHJoVmNZ?=
 =?utf-8?B?dlpBbDJ5aVBpRGM2Unp3azdqL1VFbFF2Ry8rQlFvNG9oODM2TXNMR20yUGFF?=
 =?utf-8?B?dDcvdkFtWGZycy8yWGwxZTlYNm9YVE9wZk1TMDV1RGhXWTBrMVFIZUhzWW5J?=
 =?utf-8?B?YkM4b0w4cXIrV3N5c0h0dXpSUVNZWTNwZDFocTl6Z1gzVXJrUjQ5VjR0VmxP?=
 =?utf-8?B?amhTb1c0cllZOW1IZXU5cDI0L210Y3lBc2h1S0pEdStnY3hSZkhBVThseXda?=
 =?utf-8?B?K3VDcFYwUjZPaEw5Mk4wS1NxWFRvUExKZUVCRHIyaDlZRDU5Z0pqMVBrak9p?=
 =?utf-8?B?d3R3bm9HRjAwc1FzckZrU2pRRmtEOXorTVc1UFhOSG80d05RNm9acGFxeW11?=
 =?utf-8?B?WWFOZFk2UVZ6UUUxeSsvenhIaWczU2FZK1luSmc4L2VwREszTHhENHdKa0d6?=
 =?utf-8?B?TTQ5Tzh5SWJoWnlxMTJQZHVvSElKVkx5Zk84VjRSN2RuOFNVMWlyeFZaTktY?=
 =?utf-8?B?VkF6c01SM09HL3dERmU5R1JZMjhXSHFrejhVMUxwL2p2aTQ4U1VVOHdXZmh0?=
 =?utf-8?B?cS9MUVZYZDhubzl0ZUl1c1ZwSTRydmNCZEoxR016b3dSVUZnejNWbTJHYXdC?=
 =?utf-8?B?MGhQcVh2dnFLRkRzcVIvVkM5anVIV0dncHNSM0lqQmRlVjlndjBDSDRuNlhw?=
 =?utf-8?B?TjQzNTZncUVjbGsweHNvSTIzc3Jhazl1OUVxeTFFaTdYY3Y1SXNDRUNCUGp2?=
 =?utf-8?B?SFluMUl5YzFQa2FMeHVnZEtKSHdsUFUreVE2ZGxXQy9lNUZoWlpaL0FrbG41?=
 =?utf-8?B?MitQZURBNDU2d2h5UUR6dmhDMTdyUThZYllicCs1b0dXTjdOMXhXNThTUlls?=
 =?utf-8?B?N1lWTkltbDhGeUJsSXBBZXI2N3hsOVg5YlhjOEwxNlkrenkwV1BBWXNSUE1p?=
 =?utf-8?B?YnBGcmlZa3BnczBjNmcwTE92ZFVPc0VYamI3cG56OHZOQXpRR3VNejMxSlk1?=
 =?utf-8?B?WlVGMzJHSnR1cU1SZ3BPdWVVTndVSllYOUtzaXErSmpxTU1PWTQwNFBIVmJ0?=
 =?utf-8?B?aFUyczdNanFEU3d3cnZ4eXVrZFZxMC96My9lR29rNmtodDF0Y2o4eXFOZUhv?=
 =?utf-8?Q?IkiXxTAluyM+dcYq5aW2xyZ8mfOWn+V2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVZPem16VkZjTW5OVWJJelQ0MzJCajYybHZLTlV6aDgxRmZPZ1NkY2g2LzBl?=
 =?utf-8?B?c0FRejFjV1plNkcyVW85R3NNdHlSSkx2VXl5Zkx5Z0FMUTBUOVZHVEJhOVFz?=
 =?utf-8?B?bGJOeVg0eGtoR01Sd1N4U0hiLzloeVcvTy9ISm9JQnpzQTY4MEExdGpIWC8w?=
 =?utf-8?B?R2pQem1JTzVMTG0zK2diTmtkRXFCQnZDbTJVUjZCSTFKQVQyc01Ca2hLOUVW?=
 =?utf-8?B?bUdwOUJ5R1cwTlJQRWluM1phWXpnaitkODlqeG10U0dIZXBSZ2V4TEk2eWYz?=
 =?utf-8?B?T1NVMytJVmxsNFlXRHoxckc3bzgrTWRXSzJqUVNmVEgvQmNiUHBJdkNtT09Z?=
 =?utf-8?B?ZEV1Mk0rY2NCVCtlU2dkUTQ3QlpETitLOGhoOGJkY0NQWEJ0d3MzM0M2VEZL?=
 =?utf-8?B?M09mQ3RFWFEyUjdyU2FMS29yNFU3UkU5SWM2eW9rTURJZ3lVTGF2UkJoQTVz?=
 =?utf-8?B?ZGlKTjNqOGMwWHRGbENyWnNtYXJRem54UFhGT0tVSm4yYzBsUjNOaGV1SDgv?=
 =?utf-8?B?UUsyVWVEZ2hVM3R5d2NzaEE1MUhPVGpGOFk5bXo1UzJOOEZ6UVpsSWVMaElF?=
 =?utf-8?B?OFh3eXJZY3FyWE5VbzFZOFRLTm1pcm9BRm1aL3JmT1dhSy9pUzdVd1ZhNmFI?=
 =?utf-8?B?N0JQZE5PUWlTYVk2eDl6d0duRTlSTXhIcFlRM3I5cmJXSmJFNnVYeWt2ZXhh?=
 =?utf-8?B?bDNDamhUY2N5SGZXZzFjMEdXUU85K3BSS1M4OWxUUk1ZdE10aUMrZ3N2RWxk?=
 =?utf-8?B?TEJiZEQ5d1FGbjc1K3c0Zm9PUXJ6dVRJMXBSNDBwRkVmck1WQ0VIMlFieDRu?=
 =?utf-8?B?QU94MlFhTkluc0ZZR2VXRGNrK2JEZlMvd1Q4SEZTSEpFV0tqN1hTUmZ0MkFh?=
 =?utf-8?B?Sm5yYjdqSUtsVXpTamlEUkJWS25aV0JIeGxyZHp5OU16MkV2c0NUVnpZc2VC?=
 =?utf-8?B?ei9VS3N0cGdPY0NPdmZhNC8wQ3JjS2tZTHdJTFVvSUJWMk85T0MwTnhOdDFY?=
 =?utf-8?B?dUNFbkFMVHVJRzE5elRtWlUwaDJMVm5ZOXpWcFJva1grbG1WdmJkN1Z3Y040?=
 =?utf-8?B?SVZJelJJTkZZQURNbjdxMzZZNkJTYm0xNlQzV0lJN1U1QTlrdnlGTGc5QUgz?=
 =?utf-8?B?VWkwc2ZYK2VZWWtjQ0JjZG1uWWY3OWlxMDh3enVOQ2pvZS9jY0xNWWNwaGVR?=
 =?utf-8?B?VXdVUERrT1ZMRHBTbmlnbkh3OEFQcEVYeXFVaVMrc2tscWxIbDlmSHBNTDNL?=
 =?utf-8?B?OXJBVFVRWGRiOFREdnlRY3VyZ2hQWEJmMWRhazFTMHV2OWMyaVF6SjZVak9M?=
 =?utf-8?B?cDFDZHJPaTJXK3hZOVQ3dGZ6RUsxV1lpSU4wUmpOVUFkaVJmbUN4MWdjUVZP?=
 =?utf-8?B?YUlJUXJkVVZXWnVXam5DUjhPZUtzL2JLKzNCVFB1UDh1L2prS3RFS0xNRWVH?=
 =?utf-8?B?MFA1bFN2SURQRFQzMkIxVVM2enI5RVQ0Z3hFRTZ1UjZLQlYvSkVQTkFNUzhF?=
 =?utf-8?B?WCt5M1JJYW4waW1Sb0lpTXBSS1dyWkJsNDBWZGE4RnJDbHNUY2FKRGlJUDN3?=
 =?utf-8?B?LzUrczJxZHdBekkrMTF3c0JLK3VnUFpQM1dUU0JDT0JCWFhJUTJWemdHSDJJ?=
 =?utf-8?B?WmhET3Qvb3Z0eG5TYmZEd2tQYWhlSTYxdHR4YzVhUTZycnBjUHorUG1OM203?=
 =?utf-8?B?WkJhMTdxSWpFOHQvcGJMWmZNMXdaUCtQb3JQSGYzbVFrYlFSMG44WG4zcDJq?=
 =?utf-8?B?VEsrN21vWGpBZ1VhN0RDOHUwU2NYNHhuVU9xREpvRkE2RHFWZmtkc082WGRv?=
 =?utf-8?B?STFpNm5lVFMwQWxTRlR4akZEaFZiK21LMVJZVFBhT1VISThvSXdIWmxadHFw?=
 =?utf-8?B?dU9odXpLQTBQbjVxc2dkWkdvUFBGY3JjanAvNUJjd1hoa0gxUWl6RnFMVEZL?=
 =?utf-8?B?ejFaQkpqdjN2Y0JxMTREejcxbmwzSWFpbTVuWVFpMlpZb0VidWdKdlk4VndD?=
 =?utf-8?B?RWVSSGIyeHJtYTk1dDZqMnRyZFpoVndjTFpENkw3dGRhU0ZEaEFaNERpVGo3?=
 =?utf-8?B?TnRSMUp6RmI5WEJMcTRweXo0TUV3M3VrbnB5ckdiN0JLeUt5bERDb3JPTXBU?=
 =?utf-8?Q?OL16eDTb4HtowjOEXe79x0hEh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98535243-380d-4a56-a910-08de228e5698
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:26:27.3026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DflZrrUaNUBFN0dar1k46uNrSTvgI3jB4Pn4Bi2qaH62F12tY9gqYI1hKZzSXeJelpyckMMqnTDC7hsH1qYe+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7978
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

Hi Rodrigo

On 11/12/2025 11:50 PM, Rodrigo Vivi wrote:
> On Wed, Nov 12, 2025 at 04:03:39PM +0530, Riana Tauro wrote:
>> v2 survivability breadcrumbs introduces a new mode called
>> SPI Flash Descriptor Override mode (FDO). This is enabled by
>> PCODE when MEI itself fails and firmware cannot be updated via
>> MEI using igsc. This mode provides the ability to update
>> the firmware directly via SPI driver.
>>
>> Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>>
>> Userspace should check FDO mode entry in survivability info sysfs before
>> using the SPI driver to update firmware.
>>
>> 	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode
>>
>> v2 also supports survivability mode for critical boot errors.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 41 +++++++++++++++++--
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
>>   3 files changed, 46 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 92bfcba51e19..d41f07f9194d 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -77,11 +77,13 @@
>>   
>>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>>   /* PCODE_SCRATCH0 */
>> +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
>>   #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>>   #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>>   #define   HISTORY_TRACKING		REG_BIT(11)
>>   #define   OVERFLOW_SUPPORT		REG_BIT(10)
>>   #define   AUXINFO_SUPPORT		REG_BIT(9)
>> +#define   FDO_MODE			REG_BIT(4)
>>   #define   BOOT_STATUS			REG_GENMASK(3, 1)
>>   #define      CRITICAL_FAILURE		4
>>   #define      NON_CRITICAL_FAILURE	7
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 3d9417911c33..d22fdd08d227 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_heci_gsc.h"
>>   #include "xe_i2c.h"
>>   #include "xe_mmio.h"
>> +#include "xe_nvm.h"
>>   #include "xe_pcode_api.h"
>>   #include "xe_vsec.h"
>>   
>> @@ -66,6 +67,11 @@
>>    *
>>    * - ``aux_info<n>`` : Some failures have additional debug information
>>    *
>> + * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
>> + *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
>> + *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
>> + *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>> + *
>>    * Runtime Survivability
>>    * =====================
>>    *
>> @@ -95,6 +101,8 @@ enum scratch_reg {
>>   	MAX_SCRATCH_REG,
>>   };
>>   
>> +#define FDO_INFO	(MAX_SCRATCH_REG + 1)
>> +
>>   struct xe_survivability_attribute {
>>   	struct device_attribute attr;
>>   	u8 index;
>> @@ -131,6 +139,11 @@ static void populate_survivability_info(struct xe_device *xe)
>>   	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
>>   	reg_value = info[CAPABILITY_INFO].value;
>>   
>> +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
>> +	/* FDO mode is exposed only from version 2 */
>> +	if (survivability->version >= 2)
>> +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
>> +
>>   	if (reg_value & HISTORY_TRACKING) {
>>   		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
>>   
>> @@ -193,6 +206,9 @@ static ssize_t survivability_info_show(struct device *dev,
>>   	struct xe_survivability_info *info = survivability->info;
>>   	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
>>   
>> +	if (sa->index == FDO_INFO)
>> +		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
>> +
>>   	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
>>   }
>>   
>> @@ -210,13 +226,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>>   SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>>   SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>>   SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>> +SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>>   
>>   static void xe_survivability_mode_fini(void *arg)
>>   {
>>   	struct xe_device *xe = arg;
>> +	struct xe_survivability *survivability = &xe->survivability;
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct device *dev = &pdev->dev;
>>   
>> +	if (survivability->fdo_mode)
>> +		xe_nvm_fini(xe);
>> +
>>   	device_remove_file(dev, &dev_attr_survivability_mode);
>>   }
>>   
>> @@ -227,12 +248,16 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
>>   	struct xe_survivability *survivability = &xe->survivability;
>>   	struct xe_survivability_info *info = survivability->info;
>>   
>> -	if (info[idx].value)
>> +	/* FDO mode is visible only when supported */
>> +	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
> 
> should we also make the version a file inside survivability_info?
> for explicit check instead of implicit?

Are you suggesting that we had version in the sysfs and let the user 
check both version and fdo_mode entry before deciding?

> 
>> +		return 0400;
>> +	else if (info[idx].value)
>>   		return 0400;
>>   
>>   	return 0;
>>   }
>>   
>> +/* Attributes are ordered according to enum scratch_reg */
>>   static struct attribute *survivability_info_attrs[] = {
>>   	&attr_capability_info.attr.attr,
>>   	&attr_postcode_trace.attr.attr,
>> @@ -242,6 +267,7 @@ static struct attribute *survivability_info_attrs[] = {
>>   	&attr_aux_info2.attr.attr,
>>   	&attr_aux_info3.attr.attr,
>>   	&attr_aux_info4.attr.attr,
>> +	&attr_fdo_mode.attr.attr,
>>   	NULL,
>>   };
>>   
>> @@ -301,11 +327,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>   	if (ret)
>>   		goto err;
>>   
>> +	if (survivability->fdo_mode) {
>> +		ret = xe_nvm_init(xe);
>> +		if (ret)
>> +			goto err;
> 
> should we really fail the survivability mode here?
> Or keep the survivability mode with some indication that fdo/nvm has failed?

FDO mode is only enabled when MEI path to update firmware is not 
available due to some error in MEI.

If initializing SPI also fails then user cannot update firmware in 
survivability mode. Staying in survivability mode will not be helpful
since both paths are unavailabe. That's why added the fail

I should remove failing on mei_init instead. Missed that. Thank you for
the review comment. Will fix it in new rev

Thanks
Riana
> 
>> +	}
>> +
>>   	dev_err(dev, "In Survivability Mode\n");
>>   
>>   	return 0;
>>   
>>   err:
>> +	dev_err(dev, "Failed to enable Survivability Mode\n");
>>   	survivability->mode = false;
>>   	return ret;
>>   }
>> @@ -436,8 +469,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>   	if (ret)
>>   		return ret;
>>   
>> -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>> -	if (survivability->boot_status == CRITICAL_FAILURE) {
>> +	/*
>> +	 * v2 supports survivability mode for critical errors
>> +	 */
>> +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>>   		log_survivability_info(pdev);
>>   		return -ENXIO;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> index 1ed122cf62f2..d887b443b397 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -37,6 +37,12 @@ struct xe_survivability {
>>   
>>   	/** @type: survivability type */
>>   	enum xe_survivability_type type;
>> +
>> +	/** @fdo_mode: indicates if FDO mode is enabled */
>> +	bool fdo_mode;
>> +
>> +	/** @version: breadcrumb version of survivability mode  */
>> +	u8 version;
>>   };
>>   
>>   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>> -- 
>> 2.47.1
>>

