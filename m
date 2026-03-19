Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034F210854D2
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 17:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC69110E94C;
	Thu, 19 Mar 2026 17:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QH+6mQ+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1090710E94C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 17:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773941250; x=1805477250;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5FKIL/1l8sxlEKdZIK6Vyqrs0p8UH2RwwyjvnnIYqWQ=;
 b=QH+6mQ+CSqENag0+Vuprz7kH/1Pp1BK4A1HyOxSRTSJ7AvW/c0MBuzC9
 8bxXTTEG7rlR9mY9HCeRWvuyNcwGgu5N3Yl6yqWR8+5j4YCXAZv5KhAOT
 69BVkDjjf945v+RoHDDeyL8VUlqS8dE9cM8uINsFtZ8i8g63m55HVSlzu
 J+aMa5i3Lv12dwUr7eIlwGnGeJIM879jLfcTZog+45lHkyyHr53bDpZdB
 BQF3JRN23oOfqLqI4aL1ZszOCSN3PQXYYbPfZmnMPVfRm04SkkCpqnmJZ
 V723Ng3F6JiXKOInG7PhVXUX1SSU3BDFg9SIBnnyEDhSI2k9PywmR5sms w==;
X-CSE-ConnectionGUID: 9bq0ae9MTl2L8EPNQ3ilVQ==
X-CSE-MsgGUID: WAA+AJ0fREKl4EtdxENjSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78626427"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78626427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:27:29 -0700
X-CSE-ConnectionGUID: 2Zw6GA3dRjGf3pCvHy0EwA==
X-CSE-MsgGUID: e2UMVjifSOWqZiVVAu/NMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="218462396"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:27:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 10:27:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 10:27:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 10:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3e7kZRoBYzQOcP8GRkyuWdEG1Jjc9Yf0MxuuDLEDNHQELXJwKrGuMEhozPtki4j9Rgne0abdajltepJWZlQqlhx2Wj1d/Hw2LateguuGi4ZD7lQrHrJcfNYTJUb9LvkYEzZHOYzphdO055MXEnv8Vhc/81I87RaOxqt4Uc6jMEm3nBISvWzNDk0PTiuSaaUG/544C5Xbqr+XFNy5BjNJswdGzS31DcrJPDnmJ9YYsxuVzK9rsoJkybO38jUCuc8wtwLFt6fZdl3nC58aWodaDieathmkS5U38DXQg+rE9CKUjS3A5cOcc77nrV6kHbrG73yhLBi1KvBgyh3kPmUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiHuTp0FWCTRu2m7h+H5Llog6zvQ3qeiYjVGuFZGT7g=;
 b=XMt5DfImNemiRt6oOWcHt0IKGh1s6MvU6Asy5caZdpeFIgnC6cfTpJANDM9pnMLPZwBtXshiNa4r4eW96BpsXxiEhqXzBb9zKKVcsemueV94GOEhF78rdg4fVSzF6MPnPjY8rGT9bNahV5zy3Nip4k9lKKHSUKcfHmEA94GzWEuEr2lhuOOZFheYtzES3hhpOGlcow4J0SgswNXphJ7P2T2T51phnw+zzVDOF3TPLMe7Di+cu+uw+hfrhyprBUUbWno/7V1dcoc4p6DF5Ap3LwyCZUmB5xpl24SLUDaqJpd3s7G2Hj7rJqlZN73MgEunOSS0Quk7+xTUlvuoiUgghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 17:27:25 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%3]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 17:27:25 +0000
Message-ID: <c0a1bfd9-7cd1-485f-865b-f626cb663916@intel.com>
Date: Thu, 19 Mar 2026 22:57:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] drm/xe/xe_sysctrl: Add System Controller types
 and device integration
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
 <20260313143303.2441609-10-anoop.c.vijay@intel.com>
 <abrQh7xFVqy1pYPe@soc-5CG1426VCC.clients.intel.com>
 <abrRKwCpLaUHILAc@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
Organization: Intel
In-Reply-To: <abrRKwCpLaUHILAc@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|CH3PR11MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: db013e0f-ce87-4cf2-f46b-08de85dcc931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: AksiyDrTnaXCL+FKQab4Ks/ECLpCyfmi3QT0PKZPE0DcB8wNJLtlNjEkyinWJgN1kTd0FzZ1Ur3JVRK5PcSPmZ1YhrNifRw6HQylpNp/5KxJ/VNNTnyEv/PQYbbnwhTOnG8RPvc3xXO3kF6IWXW/UfL/C6fIn4zZSjXWETrE7PgikW0ntvPnaB03OfCWtVxWCD9j1G5HDfssMbITTfCiW+k6qMdqb4NAZLpVooITxqAKkcJJfWzOiQQXhPnNE1rL04t5LRZ3SKxhg5YFNfgIx2A03HT5aMyiXByOB7YeVYJ+IzC98ZTyk4Rm7YNcT1+ovAiWn4Who1zgKCXqhno7b0J/liYwjHHrtBVT3oFo5lIeZddSLY9rzTV7zSLPr994uOouDAYIYrRNyz3d9LZahdQt7zOXWd74Irua3Gv0BHjLoL5wMUPhSrqRxwlxpJamRbA1M4dWEJVcv5bz2CYSKovaisxtXrPFn4BRFe6D0Hx5wnWYeLeRq1J0rjAC2kZ3ojQAV5f9dblE34NWkZxY0UmiCM0oC/THEro5d+y/adFxDqyOt7ZFYZlFPgCSC01IScwgtR+URe6ueOGZlhrM+s5VzAW5O/by6Km2CyT9cfoOLNbgFjnIGLIQP/rTkPI5OKjN6BRySP3HiHS/7QamfRHZZP1PezF1YHC1S2sjJrnB8i/yNyVIt9hqj0TcDB6j/KfGCFEtvNqc5QwtmoSuWq5GOtFw5kJ61L9M40i7OCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHRHK1pNdlFYcytYY3lnU0w0WThlTXhxbXdxOHVSZHFBdDNCWUJObEZRWGVx?=
 =?utf-8?B?c2JaVy82WnFpb3JuVFJmL1RuVHZJUXRET2VLaTl2c2tvc1hOSnc0R1RCMUxT?=
 =?utf-8?B?UytrVDVPTE5RSEFkYVIzU1Y2Vk9NZ3BKQmNqUzlXNCt4SExORXk3ZDFHMG0x?=
 =?utf-8?B?eXFGOGh0Q1JYQUpCajZQcm9PTldWeVZyYkZjZHNvazhDZXhDRm9qeTRPeThv?=
 =?utf-8?B?UW1MVmVFMXRSc0I2S29mUjQ4TXhMdVZWMXBWS0hmS01UampQTVRBdzRheFBX?=
 =?utf-8?B?bnAwOUtLOVVhLzVZdW9yZDE3ZUgyUUxsdmpIR3dSOUR4anBXbWphaEpqaUtX?=
 =?utf-8?B?akNkREhBcGlyWC9FUVJOVGZuMHhra1FCYW1ZSnQ0MUM0RzV5b1pTZnVjRlhu?=
 =?utf-8?B?ODc4Zy9ibCtBYXBvREtzMDVaU0lzZndwalhNWlZDd0RGUlI1SzFWaUwvZFVF?=
 =?utf-8?B?SjhRVHlSbHRHTW5iUkxTU1JnRE1hRlV1SzlHQzRJZ2hiZ3hiYzF0YXBTNWRK?=
 =?utf-8?B?R2o0dmpPTHB0Wms0YStUazlOTGZ4Lyt2L2ZCbURGZTBMdm9xcSsrbGRoQjk0?=
 =?utf-8?B?cmc5QWJ2MFplSVNxQ1pOdTJqKzh4cDJDeGJyWjZaLzM3WEhES0wwYXRLdENN?=
 =?utf-8?B?OGFZaE1PTWNHajRkeVh6d0gzRERoNzdwK3ZIY0FWMGtjbG5EaUlsVnJEWk5v?=
 =?utf-8?B?NkJoY2hzVEltNk94SDYwZnRJTWwwK0tLTVJkbXJJZ2hBUSt6bmhHUk5sU2kv?=
 =?utf-8?B?V1lUeVJmeldROXlJeVlsREEzZHhqMk9uSDg5Wk1SNk1YRFZnb1FpZXNCaGFq?=
 =?utf-8?B?VmZwemRNWEJYNHNNdHlrQWlEY1J4REdFdlRER2R0YUJWeUJBWFgvYW02bVJS?=
 =?utf-8?B?NGJyT3laZkVVWGJGeC82WWVUNzFzTG9Zb21MTDBNSi93QWcwQ0FhbUFaVXpj?=
 =?utf-8?B?RWF3RFNoMVh5dWs3K0g0TmtUZS9vV2NMeGZ1OUFMUVhHMTBmUmVhS0xsR29z?=
 =?utf-8?B?S0gySnBOUUIyLzdDK05iVnpLTWNyMU5FTW14aWZnMkgyVDREZEFwc3RXc3F5?=
 =?utf-8?B?OGVZTlM5djExQkFZb1M2S1ZUUXBWWnpNNzUrcHpiejM2MkI1K3p0azIzR2R1?=
 =?utf-8?B?d1FyRW4vOEViWU01YmxQWlZ0dEs5dS9wMzB4My9xYm9KN2VvcTEyQm5aSzdN?=
 =?utf-8?B?eUJRYVUzbnFtaXkza2tUYlY2cVVOK2I0b3RjOTJqMW01ZXBSREhUUlhhOFRH?=
 =?utf-8?B?aGQrSXR0d2VuYXNhdW5PRWZ0eWszQmFZT0ZSUUpEVVYyWUZsVDRNVThOUStU?=
 =?utf-8?B?MCtudVRjdGVxSW1wZ2FjT240Lzl1eHJ5RWVXcnpoTHFSVDdNN0FIZzJlZzdO?=
 =?utf-8?B?L0hJY21ucXd1SlpWTDdNV2dMQzkwcG9hL011c2dwSzZtckszczlmWkJNZG42?=
 =?utf-8?B?eWNhQnl0a0c0RWdIVUFtNTJ0Z3AvZTF5RHJ1RjZVUjBXY2NlajNVNkFsdnBh?=
 =?utf-8?B?NktJRzBhb240NWFqR3BkTDVKR2tTenVCek1BbDR3aDk3REtLYisrN3RHeUtJ?=
 =?utf-8?B?TWJZMlhYVURhY0NEd3JoVTNHa3Y5ak44WTBJVUs0czB5QXNDMEFrYWE2elgy?=
 =?utf-8?B?OEIrRWtsVmV0UWUzZU9nZVJ6dldEQ2VhNHdPRVF4K2gzT0J2b1o0UXRROVRv?=
 =?utf-8?B?TmZ6QWlqcnlwT0xFM1hjS2NMMFVQZzhIT1BpYTU0L1cyOFJORGo3Z0ppZC9V?=
 =?utf-8?B?WVdzNm0yY3Rod3pTSFlyVUhxSzRaUms2SlUxVXFUbWhIRGxJUXlHSnlvNkJN?=
 =?utf-8?B?aHlTZGJBaEpDMGdQVDNCZ1pyWm9VcU5QNWRBNmRuRmRoT1BSaFhqRm9QbnlO?=
 =?utf-8?B?N29Cd3NKdlJ4Qk40Q0doUE9vWTY5TFFPdkV1VDlBV0lGUHpKZWxzMjFzMlor?=
 =?utf-8?B?ZnNUV096Q1I2emhRTGZ5eUUwdW04Q1dsSVZwWlovRVk5ZDkwNlpjV2FqSTd3?=
 =?utf-8?B?Y1pQYkJHRHVHbmwxMTRncFlaWlhlMjlYQ0JxZEE5TjMyKzZqQ0d6QmdJN0Jx?=
 =?utf-8?B?djB1d1Q5RVY1cTA5TXNCajg1Q05WQkdQUWpVTzkwSks4cGhRQ3VEeXFoMnVl?=
 =?utf-8?B?R1JQcnFvRnA5TG5MU2RFV0t3dVZhN0FObU9keCtVZGtNbHFUUWtqaHZXM25Y?=
 =?utf-8?B?UEg3TWdjS01LTEkrOVBsOUhJQUdaUFJvV2dtNlNLQktodXpKT25ZOE4zeHhw?=
 =?utf-8?B?K1VMUXZBWlJhdFRZT3NveEYvaFBseFdKWnphZlRKV1JEMkxhY1ZXbzFVUm5M?=
 =?utf-8?B?ZnZVNkNKT1NGanpkQlpCM3NGN0JwdmM1OWM2Y2lMNzJIZXhsa2J6LzhIdjJK?=
 =?utf-8?Q?LZyB/17Zeq8Zukn4=3D?=
X-Exchange-RoutingPolicyChecked: MIONY25VKtMoZbeUA3fLHn3hSP56RC2aEpIaKQTEuLRY3gSHsM9PppOrHKgs/q6Q7/DymNHT3rlKvfG6dud2+SQQuqa6E39qqAPxgGeyCOyNIJnLa6/LITCnJnTz8i2LnInry1GLPi2zGLgGjtvCpg4B9NhE5NDMcn7HGYR+duYTGY8ovn+tcXgyN0aN0sb2w+O+8O7xOBL5QTaUrQV8wxkrfQGv2bhYkYxd8G978JFXN+4KF1jaLLqWmlgwMliJnSjsH7EtNwr4pMHnpVdI5JE2j9rdGY4R3LrUK5Nz8Sa+z32mkpe8fi4BjZXmbDaRW/FaHsWrTnnk27bgI6jaMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: db013e0f-ce87-4cf2-f46b-08de85dcc931
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:27:25.0355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2G1U7lLX7PptzmOk6huj/DeNWmfweTo01la+uxg6Pzi9BsR0Us1uJGAPeCNZdV5ppjNMKv5XnYbAg5fi3FIIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
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

Hi Umesh,

On 3/18/2026 9:52 PM, Umesh Nerlige Ramappa wrote:
> On Wed, Mar 18, 2026 at 09:49:19PM +0530, Umesh Nerlige Ramappa wrote:
>> On Fri, Mar 13, 2026 at 07:33:04AM -0700, Anoop, Vijay wrote:
>>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>>
>>> Add foundational type definitions for System Controller (sysctrl) 
>>> support
>>> and integrate them into the xe_device structure. Introduce a capability
>>> flag in device descriptor and runtime information to record sysctrl
>>> presence on supported platforms.
>>>
>>> System Controller is a separate firmware-managed entity responsible for
>>> selected platform-level control and coordination tasks on Intel Xe3p
>>> discrete GPU platforms. The driver communicates with it via a mailbox
>>> interface for delegated operations.
>>>
>>> This commit introduces core data structures required for sysctrl 
>>> support,
>>> including MMIO region definitions, a command mutex, and state tracking
>>> required for mailbox communication.
>>>
>>> No functional changes. This patch provides preparatory infrastructure
>>> for System Controller support.
>>
>> IMO, this ^ sentence can be dropped.
> 
> If including the above comment was a review feedback, then please retain 
> it because I see it in other commit messages as well.
> 
> 
This sentence was added based on earlier review feedback to add more 
context in commit messages for preparatory infrastructure.

Thanks,
Anoop
> 
> With or without that this is
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
>>>
>>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>>
>>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>> ---
>>> v4: (Matt, Mike)
>>> - Add domain-specific MMIO accessor
>>> - Change phase_bit type from u32 to bool
>>>
>>> v6: (Matt)
>>> - Add mailbox protocol constants
>>>
>>> v8: (Matt, Michal)
>>> - Reordered patches for logical flow
>>>
>>> v9: (Matt)
>>> - Extended commit message to explain System Controller and purpose of
>>> `has_sysctrl` flag
>>> ---
>>> drivers/gpu/drm/xe/xe_device_types.h  |  6 +++++
>>> drivers/gpu/drm/xe/xe_pci_types.h     |  1 +
>>> drivers/gpu/drm/xe/xe_sysctrl_types.h | 32 +++++++++++++++++++++++++++
>>> 3 files changed, 39 insertions(+)
>>> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>>> xe/xe_device_types.h
>>> index 615218d775b1..150c76b2acaf 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -27,6 +27,7 @@
>>> #include "xe_sriov_vf_ccs_types.h"
>>> #include "xe_step_types.h"
>>> #include "xe_survivability_mode_types.h"
>>> +#include "xe_sysctrl_types.h"
>>> #include "xe_tile_types.h"
>>> #include "xe_validation.h"
>>>
>>> @@ -196,6 +197,8 @@ struct xe_device {
>>>         u8 has_soc_remapper_telem:1;
>>>         /** @info.has_sriov: Supports SR-IOV */
>>>         u8 has_sriov:1;
>>> +        /** @info.has_sysctrl: Supports System Controller */
>>> +        u8 has_sysctrl:1;
>>>         /** @info.has_usm: Device has unified shared memory support */
>>>         u8 has_usm:1;
>>>         /** @info.has_64bit_timestamp: Device supports 64-bit 
>>> timestamps */
>>> @@ -508,6 +511,9 @@ struct xe_device {
>>>     /** @i2c: I2C host controller */
>>>     struct xe_i2c *i2c;
>>>
>>> +    /** @sc: System Controller */
>>> +    struct xe_sysctrl sc;
>>> +
>>>     /** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
>>>     u32 atomic_svm_timeslice_ms;
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/ 
>>> xe_pci_types.h
>>> index 8eee4fb1c57c..08386c5eca27 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>>> @@ -57,6 +57,7 @@ struct xe_device_desc {
>>>     u8 has_soc_remapper_sysctrl:1;
>>>     u8 has_soc_remapper_telem:1;
>>>     u8 has_sriov:1;
>>> +    u8 has_sysctrl:1;
>>>     u8 needs_scratch:1;
>>>     u8 skip_guc_pc:1;
>>>     u8 skip_mtcfg:1;
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/ 
>>> xe/xe_sysctrl_types.h
>>> new file mode 100644
>>> index 000000000000..8217f6befe70
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>> @@ -0,0 +1,32 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_SYSCTRL_TYPES_H_
>>> +#define _XE_SYSCTRL_TYPES_H_
>>> +
>>> +#include <linux/mutex.h>
>>> +#include <linux/types.h>
>>> +
>>> +struct xe_mmio;
>>> +
>>> +/**
>>> + * struct xe_sysctrl - System Controller driver context
>>> + *
>>> + * This structure maintains the runtime state for System Controller
>>> + * communication. All fields are initialized during xe_sysctrl_init()
>>> + * and protected appropriately for concurrent access.
>>> + */
>>> +struct xe_sysctrl {
>>> +    /** @mmio: MMIO region for system control registers */
>>> +    struct xe_mmio *mmio;
>>> +
>>> +    /** @cmd_lock: Mutex protecting mailbox command operations */
>>> +    struct mutex cmd_lock;
>>> +
>>> +    /** @phase_bit: Message boundary phase toggle bit (0 or 1) */
>>> +    bool phase_bit;
>>> +};
>>> +
>>> +#endif
>>> -- 
>>> 2.43.0
>>>

