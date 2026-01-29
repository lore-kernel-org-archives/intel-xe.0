Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740D4D46C01
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 00:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10D210E78B;
	Thu, 29 Jan 2026 00:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwvPyK/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B802810E78B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 00:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769646453; x=1801182453;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2xwvGsyHkDe/h2J4tGKId8/0wG0QXl6F3gscZZIxEzc=;
 b=cwvPyK/s5bpB5HOweCskid2GRmAveoioJcM72dXtqtfZ4Sx4+TM2Tqo6
 Cx4iJFHp9T4xv5PDRk3PTTUjrgLsyQX0sklzI7iIEYjKnDvBfUwnogWv3
 7eZsdCxzBoH6m+0SdxGcdkr6pWDiF/c6w7Q/z9bSy5QjFdHmqtBUstXV1
 psJGzEmrYVGZpA6eTUlw/ozd2xGCg6xpskuvFMcx5pRv8mwbvj1xmSh3q
 8yYJM3UipQ6cjN6XmcWVz0ADvBVsSP5U9ICRHaue/cXCTcUL1jqwQDn1N
 mTCcq64LeKeJg7aGU2/USLXDwzbGYwAN/Vtp75+aorZYOo79t55kNlKx0 w==;
X-CSE-ConnectionGUID: lzeD5OoYRBeTEQw1VBeB8A==
X-CSE-MsgGUID: Mz+wz6l3SSaEX1N/5WVqSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74735722"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74735722"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 16:27:32 -0800
X-CSE-ConnectionGUID: haHbVI7GQ0i5pKujoNG8xg==
X-CSE-MsgGUID: a5JFbErxSpONa1et/sHCmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208651107"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 16:27:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 16:27:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 16:27:31 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 16:27:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuQvG32ps7lPifhjLwTfFYoU50JwmqZvThPM23+86HHmeuazDAeeNuD8ylFJO5ar2Wop7gJpI39u8aZZGpRrjaWUBFZ67/nyDOVxcXMC0hjEupb0qWZZmGukfVT+D4Ohd0fTL5lSUed62Xx/isMeiOO+mxas392d6WZlZtn++YF2fcUlG0ykla6seGk+3JboJ0ZyEJKHBMqM9IP1Y/rO0wjID12pxgO1ZNgpb+ACO4z16BO++Jh6o4tK9NUek1TVVhQm7IDHg1zeV9+PkHArionACy0BmvQtgGtwl0YNyMVTOfGX57xZWf6VcmwCAesmZO1KEat93+AqHS+nFktlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Rxk+EB0zo0izq+LBRqwx7iWN7Woh11IhHy6D5fX0eM=;
 b=FbvSNxmuMSDrm7tRwQVoRRN0EKIzIWh7PtiPxSTou1A8I9ptVJ1eIEpxGiJkl4ujO8sCJmvqKgTXu1o9i7ox5kk9hjf/YZXJa9vOPYLMjGEDCT4vJsmCQe0oWW4VYARpsEQbcEZVcgR5JFuR5DTkpIm0pbjflX8vZrnXdase5EjIMIFgqwx3J76mvOUkS9gwecwrsOEUhMYxzxuMFv5HaCE9+m6z3Ru9pOGxsghvjv7Tu4S5gemAUFLMxbKBh0r9bueyF0ZAJr3h0vqnNX6vQLuV1smizOfT+85Rnwk36FBR7qu7YmxOh1mg4qziXq/RSQmvymIjivIRg+/HdfVapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 00:27:28 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 00:27:28 +0000
Message-ID: <855a551b-3275-4697-a816-2ca8ab86a284@intel.com>
Date: Wed, 28 Jan 2026 16:27:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
To: "Mishra, Pallavi" <pallavi.mishra@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
References: <20260116002529.951176-1-pallavi.mishra@intel.com>
 <84622a42-64c8-4712-bfe9-374e32cdd4b4@intel.com>
 <SJ5PPFC0624F2CA292F70351251505F39D18297A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
 <4e39ee05-0767-441e-b193-c05fba770740@intel.com>
 <SJ5PPFC0624F2CABC96211C6507CF372CD68294A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <SJ5PPFC0624F2CABC96211C6507CF372CD68294A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ2PR11MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 662fa0b1-752a-4c73-503c-08de5ecd2f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWlHVklJMWIzVUtjUWNoMXpkU2xuTWtKZ3BoZDFFMDN4SnhwanhyQ2FadThz?=
 =?utf-8?B?RWh6b1Axd0FpVkExem1telVmeDRjWmZkelVweHloYUJ0TW5YWGl1Nm9mN1or?=
 =?utf-8?B?b2NIQ1JyVjBkWmQwTitUYXhnZDlDREI3NVFpU2JXaEp3dmJsOFJuSEh5T2Rh?=
 =?utf-8?B?bDlJOGVkSUlXbTBTNGVuSUczcWphbDRtVFFHYkJFd1pQUUNubGhmRG1rRTY0?=
 =?utf-8?B?eG5BNEdER1hyS1FIcmJoaytPM2hZam1yWWlyK2hCQjE1U0JCQk5kNDhRVm9P?=
 =?utf-8?B?ZEE3REZpOW1sUGJ3WkhSY1gwamdGMXp4bUhESHpwQ3JmTWEzak44U0g4VEdR?=
 =?utf-8?B?WFRudjdzNlJnSWh6S08yazZDaURGRWkvTURNVFpxUlY1QzF4YU1OU1d2TVI1?=
 =?utf-8?B?cXFTRG05WFFmbzkyS2lHcUxCbWo0MUR3b0dYVFdtQjdjN3VRaEhqS0JCdEV6?=
 =?utf-8?B?YjJXVXZZNUZpc2lJa2F5L013MTQwamFLQmUxTTkvMVFFUTlzd1UvTC9lQ0hY?=
 =?utf-8?B?OXVSM1RBT0J2YkVhcFppajNXczhJVUQ0WWVXUS9PK0lEMDRtaDlwNHFITTMx?=
 =?utf-8?B?Rlp1QkJnWUJId0c1YUFGNklqVjNER2tSbnQ3UUMrU3VkOVRRWS8wT3ZvZU96?=
 =?utf-8?B?SUJDS1JLa29tTjlrL3QzNW85b3cxM0RPdVBTTVpudzM1QUdzRWFFbTJVY2ZF?=
 =?utf-8?B?anZhMkRMR3VQZ0NLZWMxOFpRZkNCN1JlMkQyUGRSOXNYUjFQSmU4YlJkRVV3?=
 =?utf-8?B?N3hwYksrS2JhVjY3UU4wSXFSZ0YyTmVMbkViYkluZnErWEpGL3c4enpkdGJG?=
 =?utf-8?B?OGF0Y1g1aWlIRGloSk1BVENhZ05zaE41WXBKdnlxRVBXMGhvb2FUT1B6Q3E3?=
 =?utf-8?B?Ylp4bDAvbEhlMWg1TmJuQm5OM2puZ3Q5V1B1MEsyTVBnMTIzVEQ4SW45WTl4?=
 =?utf-8?B?Q0h0VWVTMmZyTHNmOWZyVUVoWGpNVnZadFFtTk16K21rTFJIL3BOV3NRVTFv?=
 =?utf-8?B?aDhGRUNLTWpYSUJFWEg3K2gzSStyaUNSMHQ1T1BHeDhrVGZOVzlWZzUyQWpW?=
 =?utf-8?B?cy9mNlJwZ3AwVUFiTFlXbGdQQnZzbFkxV1JTMkg5azcrdHgxY2s4YnliQmtm?=
 =?utf-8?B?a2NFVElySVludzhoSnZ2QytSWnVZbUFML01XMlUrT0MvTi83bTZPZlI5MEIy?=
 =?utf-8?B?QnhsNDRieWNRaU04ekhrL3RLQ2xtQTl0Q2FFK1JQcUlMVkxKRnhmc2NXYVJq?=
 =?utf-8?B?dkx5VUFCSENtZTJTQUJXZUl3TVdtU0tjaEJOTFlaWGVoUHVRTU13SUtDSTIr?=
 =?utf-8?B?SGpyQ3NXTUNIZ3o5YkNFaDNSSzQ1OEUvOTAwQUhCQkhZQkFnK2FkUFA4V1h3?=
 =?utf-8?B?ME1NdVpDVTdvNHZsVFFsNGlnMTVaNkZmU2VTeldoSnkwUEpqaXVZNDdueUgw?=
 =?utf-8?B?TXBsTmxkZHRQVE5zejF3MG1BRGFpMkVsM0JRSEw0Nk84ZVZDRlg4cERaN0tI?=
 =?utf-8?B?ZEFNMzNCYnhadDViSXI0ekROWFQ0WjNrbUxXSU9rUG9yL0hTMjdvdWhTcG4r?=
 =?utf-8?B?b2I0WTI4bnp5OUdueDlvS0xuWndDMUJnV2hIZE4raTJzb1ZUakZFdlZmajRz?=
 =?utf-8?B?TkRORlF5cjZGUmpUeVRZYUNZeTZwWUNnc1luOURoTUt3SkFnRWQ3MWlQeERM?=
 =?utf-8?B?MDkxdFJ1ZUhKTDlESnBkblVoRGp0WlVHa3FFV1BrT00yTDM0UWRhLzIyUXBj?=
 =?utf-8?B?bWNXR1M1anFmUzg1YWdSV3F4U1hwc3NmMDVzNGh5b0hzRlY1VUh5RFAxUkYr?=
 =?utf-8?B?YXBvWEJyd0U1VHVGdjljVnpadU1IMi9yWUw4QkFNeGpMOUY0Vk5RcEQycU10?=
 =?utf-8?B?RWdQVnZwTlJuRFpybyt4WCttZGlOODZ2MlRHdWUwUlVXWlBhaEUvc0dIK0ZC?=
 =?utf-8?B?eW9DU2o4VlJBOW5HSkZENHp0VUNsUDBkbC9HZjFoajI0SWQ2MEZObVF4cElE?=
 =?utf-8?B?RTE1U0JsRFdkT2RHZC8ralNManJRSlJmZTh3Q1E1VEdrTjdDYncwU0JzOXRB?=
 =?utf-8?B?WlRIdDk5bmNZVW83Z2hBdExUZE1SaGtUZExkWjMzMlowWlNTeE5MOEdjemQx?=
 =?utf-8?Q?Aehw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ny8yQldlUlRCUkVEZFc1Wk8wV2VXQ01pOGlVTHUwazY2WlBkZlZrcGdlTUc1?=
 =?utf-8?B?VUhLTHB1R0w4am5lWTdUanNNSlYrR2tkU0Z0WC96VklZQWtpZmZFYi9wWkpi?=
 =?utf-8?B?Z09NZVVCbUdpejA4VWF5WTBWZ2dlSHhFaCtFMEovVjA0SllqWnUzbld4VTFa?=
 =?utf-8?B?TXZKRzIwU3NQVmJUTVk5VXVFWlpGSGgybzFHdTl3UmVyazE4Y0o0aEhjQjhW?=
 =?utf-8?B?VjR0UTdvNVIySWlTMEJERXl4RFV6eG5UZ25GYXpsdnVHNXh1SGY5OEIrUDFs?=
 =?utf-8?B?ckJWK2owUEpFSVFLR1p0N1FDL09VZko2Ylh3cERSL3BXeVVVVUtVWTEwWGZV?=
 =?utf-8?B?czdRL3NoSGV1R0lmOWUyUFpXcnAvelhabWhFOElRWTlKM2EwL1Nyc2ltVENI?=
 =?utf-8?B?aHhCZ0htTjBzS1NNM1haeVI1TFZNblVWNklZK2JpcnBHeXRqb05tenUxeEFU?=
 =?utf-8?B?V0F1Nm03Rml1K2ZibHJmSTNoMkh4MVM4S1RqNUlTdklNYUZnYmpoOXlEelVz?=
 =?utf-8?B?cGl3RTJPd0RIb0hBNUY2Z2RjS3RZcjBDOHpOQ3BYOVJBRkw0TE1mUElZTTcz?=
 =?utf-8?B?QndTeFdYQ2hmYUNQUzVYYlIzVGJYOHllVlVydFc2OU45NndibFVMNy8yaEdK?=
 =?utf-8?B?bVB6Y3VmZSttUlBtZWpZdVhJWnNFejlGYkFLUDdXS1NVTFl0aXBqTFNBUktm?=
 =?utf-8?B?bzBWOVRMRk9jaDNtU0lkc1lwUlJ6dzlraTVVTXEzMnMrRFpJN2VDakY2OEs5?=
 =?utf-8?B?d1I4TSsxdXFia2RHQWZIeStQT3FEcWYrb083Q3E2Qjh3NERlK3lDUHhGM2hS?=
 =?utf-8?B?NVZGeXJjS1BBczhUdGhMK3h1M1o0dyttMnlCS0xaNlE2RzJEOVJMTlp5cmFG?=
 =?utf-8?B?ZHV3Y0U5OUU0UE9SR0VUQmdPd00zRjNhTmNWRnZWaFRqeldpb25aaVFSN0NY?=
 =?utf-8?B?OFExWThiaWxDWFRUL3IwVUNTUWp2eFRPZzVhMmZQbG5tMkZzQVdBcnEyTlNk?=
 =?utf-8?B?YVZHdWlOT0s0SDdkV1ZLYXhEaTF6c0VJOGdOV3NHMHlhNTRObFBnMzMxNlpw?=
 =?utf-8?B?ZGcwTlRadEhFWlBHZWZPUHhiWG9VczdOZmlOUXFjRWdVUFAzbmtRUFh5aGJH?=
 =?utf-8?B?ZmF5SGhGM0RQNERTVWpON016US9vMnpSbEVkd1ZNWGtoUlFRTS8wcDRQMHdY?=
 =?utf-8?B?Qnh1c2h5TjU5MTQvRSt5SmNDQWpoeVc2MDhyQmo5TlVtRWtHa2lraE9leDZm?=
 =?utf-8?B?a2t0czBpaHRPNmk3STZtTEZNdnp2Rk1UcmM5R25STThJUCtDZSsxNGxxczY0?=
 =?utf-8?B?NHNSWXgwS1FuVE1TL25TK2tkMFAxNXVyRzB2Q3lZSWdHMVo5N2Z1TkZSbDVW?=
 =?utf-8?B?R2ZNTThsZzFvamhiZHpURUEvOXRBMml4RmNaVlozLzlRcE5zTW9jKzl0dGR1?=
 =?utf-8?B?T2x5RmdLOFhVUkhMdDB5UCtlQzZOL09DMC9tS1NjT2ZBQmxtVUF4WDlHTlds?=
 =?utf-8?B?NmhCcmpBdkUybjBXTWc1dE0vYzNwQXJ0aUlFWm1YS25SaVppd3YrN3lOK2NV?=
 =?utf-8?B?ZTlLdWJUUFUySVlFeVM2TXpFQmNNaGZCUGp2RVlaS2RqUkRhelV1TzUrMHhq?=
 =?utf-8?B?cXRES2dEOGl3RVU3ZTBjbFJiMmJwZG5rblV4UnFxTExHZ0JMTUQwaFNtSmM2?=
 =?utf-8?B?U2hTS2owM0ZxdXhNYXU0SHpWNUM0NTBTMWI3V2k3VjRELzBDNDNyNDQ3TWxP?=
 =?utf-8?B?ZzhVdThVL2x0SFNlUnNkbXV4QkNObFdnMmszSnBjaFJlczJQWlA3ZjE5aTh0?=
 =?utf-8?B?ZzR4WURjSStaRzQ2L3Q3RlZXcUpqV0toY0dHTW9EOGRzSFV4ak5LZDQrc3Rk?=
 =?utf-8?B?d0MzTEgvTVM0dlJ6Ly94QlA2R2RRdHVjMVpQdE9KQUZjYVpXR3hOaVFSOFJ1?=
 =?utf-8?B?bk5qaGpYTWtxSmQwSythYXRyZVdOWXkvSmlvY0JHSTh5aHUzR2RiR2lvbU1X?=
 =?utf-8?B?aFB2Qk9UenkwOVdzNjBYSFZSbG1QNXVuOUxobmhtd1JSallRYmV6VUZCU3FD?=
 =?utf-8?B?YzZneXFkT0NHbVg4MldFVTdmM1Y1OUwrSWJ6djgxMjFvL3Z6cXlJS3dtUWo1?=
 =?utf-8?B?cGh4R0hHRk9hK3NZdUNCaFBNTDY3anJ1UnRXTDdGck1qVTNoRGRzazdMVndW?=
 =?utf-8?B?WmRGWGpSZWQ2R0VmQWwxdTNYSExPT2x5Z013TXg1bm0zQ0w3ZExzRkk5cVN0?=
 =?utf-8?B?ZGFhK1IxUU5CbGlvY1ZUZ3pFZExpMFE4bkNJOFY3RDl0T3M1Y0ZySmpjb1Bk?=
 =?utf-8?B?QVQycTc3c2drWXA0dHZuQkFkeGxqUjZhdEJTS1dBU1hGVUMzM0hvekdBc1ZB?=
 =?utf-8?Q?Ud65km+M7qN0+z9c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 662fa0b1-752a-4c73-503c-08de5ecd2f2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 00:27:28.7737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zts/U1rkHyLkXhRyLlrfk1WSg9uSbefuovAmDHh5Zx6hC2CSuKbxCOFNMEpfgKAQjEW7IDbQZNmyPYNNKJKd4YzpK41dnYiZlvpZxLjNK0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
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



On 1/22/2026 6:41 PM, Mishra, Pallavi wrote:
>
>> -----Original Message-----
>> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
>> Sent: Thursday, January 22, 2026 3:01 PM
>> To: Mishra, Pallavi <pallavi.mishra@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
>> Summers, Stuart <stuart.summers@intel.com>
>> Subject: Re: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
>>
>>
>>
>> On 1/22/2026 11:33 AM, Mishra, Pallavi wrote:
>>>> -----Original Message-----
>>>> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
>>>> Sent: Wednesday, January 21, 2026 4:20 PM
>>>> To: Mishra, Pallavi <pallavi.mishra@intel.com>;
>>>> intel-xe@lists.freedesktop.org
>>>> Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
>>>> Summers, Stuart <stuart.summers@intel.com>
>>>> Subject: Re: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
>>>>
>>>>
>>>>
>>>> On 1/15/2026 4:25 PM, Pallavi Mishra wrote:
>>>>> The G2G KUnit test allocates a compact N×N matrix sized by gt_count
>>>>> and verifies entries using dense indices: idx = (j * gt_count) + i
>>>>>
>>>>> The producer path currently computes idx using
>>>>> gt->info.id. However, gt->info.id values
>>>>> are not guaranteed to be contiguous.
>>>>> For example, with gt_count=2 and IDs {0,3}, this formula produces
>>>>> indices beyond the allocated range, causing mismatches and potential
>>>>> out-of-bounds access.
>>>>>
>>>>> Update the producer to map each GT to a dense index in
>>>>> [0..gt_count-1] and compute:
>>>>>        idx = (tx_dense * gt_count) + rx_dense
>>>>>
>>>>> Additionally, introduce an event-based delay in g2g_test_in_order()
>>>>> to ensure ordering between sends.
>>>>>
>>>>> v2: Add single helper function (Daniele)
>>>>>
>>>>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 56
>>>> +++++++++++++++++++++-
>>>>>     1 file changed, 54 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>>>>> b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>>>>> index 3b213fcae916..ec18086b98d8 100644
>>>>> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>>>>> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>>>>> @@ -48,6 +48,38 @@ struct g2g_test_payload  {
>>>>>     	u32 seqno;
>>>>>     };
>>>>>
>>>>> +static int slot_index_from_gts(struct xe_gt *tx_gt, struct xe_gt
>>>>> +*rx_gt) {
>>>>> +	struct xe_device *xe = gt_to_xe(tx_gt);
>>>>> +	int idx = 0, found = 0, id, tx_idx, rx_idx;
>>>>> +	struct xe_gt *gt;
>>>>> +	struct kunit *test = kunit_get_current_test();
>>>>> +
>>>>> +	for (id = 0; id < xe->info.tile_count * xe->info.max_gt_per_tile; id++) {
>>>>> +		gt = xe_device_get_gt(xe, id);
>>>>> +		if (!gt)
>>>>> +			continue;
>>>>> +		if (gt == tx_gt) {
>>>>> +			tx_idx = idx;
>>>>> +			found++;
>>>>> +		}
>>>>> +		if (gt == rx_gt) {
>>>>> +			rx_idx = idx;
>>>>> +			found++;
>>>>> +		}
>>>>> +
>>>>> +		if (found == 2)
>>>>> +			break;
>>>>> +
>>>>> +		idx++;
>>>>> +	}
>>>>> +
>>>>> +	if (found != 2)
>>>>> +		KUNIT_FAIL(test, "GT index not found");
>>>>> +
>>>>> +	return (tx_idx * xe->info.gt_count) + rx_idx; }
>>>>> +
>>>>>     static void g2g_test_send(struct kunit *test, struct xe_guc *guc,
>>>>>     			  u32 far_tile, u32 far_dev,
>>>>>     			  struct g2g_test_payload *payload) @@ -163,7
>>>> +195,7 @@ int
>>>>> xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>>>>>     		goto done;
>>>>>     	}
>>>>>
>>>>> -	idx = (tx_gt->info.id * xe->info.gt_count) + rx_gt->info.id;
>>>>> +	idx = slot_index_from_gts(tx_gt, rx_gt);
>>>>>
>>>>>     	if (xe->g2g_test_array[idx] != payload->seqno - 1) {
>>>>>     		xe_gt_err(rx_gt, "G2G: Seqno mismatch %d vs %d for %d:%d -
>>>>>
>>>>> %d:%d!\n", @@ -180,13 +212,17 @@ int
>>>> xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>>>>>     	return ret;
>>>>>     }
>>>>>
>>>>> +#define G2G_WAIT_TIMEOUT_MS 100
>>>>> +#define G2G_WAIT_POLL_MS 1
>>>>> +
>>>>>     /*
>>>>>      * Send the given seqno from all GuCs to all other GuCs in tile/GT order
>>>>>      */
>>>>>     static void g2g_test_in_order(struct kunit *test, struct
>>>>> xe_device *xe, u32
>>>> seqno)
>>>>>     {
>>>>>     	struct xe_gt *near_gt, *far_gt;
>>>>> -	int i, j;
>>>>> +	int i, j, waited;
>>>>> +	u32 idx;
>>>>>
>>>>>     	for_each_gt(near_gt, xe, i) {
>>>>>     		u32 near_tile = gt_to_tile(near_gt)->id; @@ -205,6 +241,22
>>>> @@
>>>>> static void g2g_test_in_order(struct kunit *test, struct xe_device
>>>>> *xe, u32
>>>> seqn
>>>>>     			payload.rx_dev = far_dev;
>>>>>     			payload.rx_tile = far_tile;
>>>>>     			payload.seqno = seqno;
>>>>> +
>>>>> +			/* Calculate idx for event-based wait */
>>>>> +			idx = slot_index_from_gts(near_gt, far_gt);
>>>>> +			waited = 0;
>>>>> +
>>>>> +			/* Wait for previous seqno to be acknowledged
>>>> before sending */
>>>>> +			while (xe->g2g_test_array[idx] != (seqno - 1)) {
>>>>> +				msleep(G2G_WAIT_POLL_MS);
>>>>> +				waited += G2G_WAIT_POLL_MS;
>>>>> +				if (waited >= G2G_WAIT_TIMEOUT_MS) {
>>>>> +					kunit_info(test, "Timeout waiting! tx
>>>> gt: %d, rx gt: %d\n",
>>>>> +						   near_gt->info.id, far_gt-
>>>>> info.id);
>>>> Sorry I missed this on the previous rev, but shouldn't this be a
>>>> failure? If we don't get one of the previous messages then something has
>> gone wrong.
>>>> The patch looks good to me apart from this.
>>>>
>>>> Daniele
>>> I think marking a failure at this point may be too early. Seqno check
>>> validation happens later on in g2g_run_test() and also in
>>> xe_guc_g2g_test_notification(). If any notification is missed or out of order,
>> the test will fail at that stage.
>>
>> Then why wait for it at all? either waiting for it is significant (and therefore we
>> fail the test if the wait times out) or it doesn't matter because we have other
>> checks later (in which case we can just avoid waiting).
>>
>> Daniele
> To provide some background here, the while loop and wait are primarily added to pace the test and avoid sending back-to-back messages, which previously caused the test to always time out waiting for notifications. Introducing a delay/sleep before the g2g_test_send() resolved this. During internal review it was suggested that a fixed delay here may not work across platforms, so I modified the same to an event based delay. So the wait here isn't meant to validate correctness at this stage, but simply pace the test. The timeout message here might be confusing, so I can remove it if preferred. Please let me know your thoughts.

Ok, then please expand the comment to reflect this. Maybe something like 
"Wait for previous seqno to be acknowledged before sending, to avoid 
queuing too many messages back-to-back and causing a test timeout. 
Actual message correctness will be checked in 
xe_guc_g2g_test_notification()".

Daniele

>
>>> Pallavi
>>>>> +					break;
>>>>> +				}
>>>>> +			}
>>>>> +
>>>>>     			g2g_test_send(test, &near_gt->uc.guc, far_tile,
>>>> far_dev, &payload);
>>>>>     		}
>>>>>     	}

