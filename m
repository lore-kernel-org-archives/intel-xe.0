Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D77C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 11:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9A010EFBB;
	Thu, 27 Aug 2026 11:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvJ4NdN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB49D10EFD7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787831250; x=1819367250;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qRaYFaQ9Box3dZykDCxNLHppjbEvq87R/JRJAZhY/Ok=;
 b=QvJ4NdN4POGx2LJnnLjVkouhhB7MbXcZ3Fh3ijhYM+kEtiuXwyGXqjMm
 seWHfrScxG1A5Lar6pNj6cOXR4sOf267dOSzsoIkau6FaNqacqoUUjtpD
 IDak4SxKR+2fC2O5Nv8Uab8kC5GUH/hMtI+smhGDIIGjIUkiXJMQfEv5M
 HN7m0354q6kpM12bvWYj/y6xG67K7RZEgDIAZ4+k17Yi0d7rvItqzqVFV
 +aEq7RFt4n5Yf5w/TPzh9woVqopOaOEORnYiWBdCu97uCtSiIcfYXqXet
 otY3GlBkfmxkj8+sPqOkBdrzlSsCciAhHSjgf912NY7qVZ98rlgOw17ao g==;
X-CSE-ConnectionGUID: 2mtOd7s3RGWKmi8QE+QmZw==
X-CSE-MsgGUID: md1mEpzSSLyLnQZfjdJR/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92145147"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92145147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 04:47:29 -0700
X-CSE-ConnectionGUID: C8sLLEEJTc2z2PqIS29sAw==
X-CSE-MsgGUID: cb90YQzsStC0wNjkrK9ZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="271651634"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 04:47:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 04:47:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 04:47:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 04:47:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYuZBgZ8/A8e6wEBz5YhW4Z01zVHZOxf6E+hJkJVGBTe3E3LxM6U3zCxScRH38exerxgf+YJEPQLVa3qaPGl+1jRJjpv4beTjdLsSpD36vEI7uFaZQ/nEEqfzytAAbbaZPhM+35IDSFeyXIXShYvlHvLnDIa0T+h0owCHS6wWhOz9Zs91XhXqiisaa/mjK6rBJ7K4YF2/1j7rZU5kwbuoJihtn3HtxDdGA4JDAF148vclgcUsJKUiXgD0vuYIpf0+NQxm+Cndp3vbvzz1X/S0LRP1TZ8rpAhInI22RwvK7lD7UeYave7aBp5g4Hbc6YFrkC4NNK+pF0z30N53PFw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xV1y3kpUlgFRvUXjY62uYp5uda/QvbFGDlH8VquH1RM=;
 b=A4jNobBQzXV6p+OyGkVZcr7nvFam1lKOwYbDmKnT8EwK38pQfsRjcs4AJyJqm7FGYYTITYUmYKwZ+tSp0ku1An4DxXCwueb5CY8en639t3qaOOv7n+V2DyE5wisr2nNS/Uq8HTNuvuIjyc3+9pSngiTKDXh/4+Txnxs7oXWcBSJeDVDab41rjuKNRwyIsLmYExsHYSbMVhZNAqlDtD18OWqxWsHsdmA7pOG5qy9yWF5KtxgfAL3oc5DS9ZMA8aicDF0a4z/UAYQyE47WQ0ycCF0xsQ0iWatbJXXhwJ9bMIukrkofu13OUtjXuJGC+ArBRkQDeFhnCdirLJ85FPgU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 11:47:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 11:47:26 +0000
Message-ID: <87cb2591-f4da-4d05-b650-39b0d62ff1f3@intel.com>
Date: Thu, 27 Aug 2026 13:47:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc: Report major GuC failures using SIGID
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Alan Previn Teres Alexis
 <alan.previn.teres.alexis@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>
References: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
 <20260827002801.837731-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260827002801.837731-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF00000158.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::874) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 49366624-7132-4b6b-8515-08df0430f737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5KpOC2Kc+EjXX9WwlY5PkXCEnkOTyPLKXJw/lUEFgObFpAxNlirsO64qHor0eU4rHSeOnAURM97DAoceRqcnbJyGOrtSWv9pT+nMtCxSm1JGOcSHUC35230Bn30vAT7nll8XPCdQin+9qHznlNjFFV206MXe1rOSM6eRvTBPMnMVtlUI3LasPFjac/c673yyp5QmIl6VoN2Rh16moR9ZiZCwl5nThOoiR0DYT2/5ZgBc9ZRnhmuPmVbIXJUjwoTBkV+oc24+kdm64P3K4cb6Z8zRAB1I3WNEfL1wFhcS861ImuWTB/ecCErzSXykaiWcxgJuxrhVXdnN61q4wW3zttlVTJ54QTj0m/Ru7p7SPoMPjcWuZ3VbHFTequYc1+yfVR9PAklY+nBnKm7GB9U6HlBlJuT7riqlAOsX8qYIYKRavAWUfDUaRsH0DSKG7LPRIgYQsgQAWKLIpB0ZoeOasVaBJrUzNzEAESki9AH0Ya/NRILQrP+4dZ0Z8HxYHKHGK2q7jBOAFj+nY5AYk8fzCCTfe8Qy28pCnA74U7+KTvb9UUo8Q9wujicbmneP5p/HFV2u9je3Zqf+LV9L/Z8mpXxrSVuyfBpUP+Wrebx/+xJ6jCTZygubmwe7gGM0ddasOn/J1r59OZoAGQakI7FVKtuVY1LX3zXqgYOCdBPW594=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0J0azdNSXVXMzRRTWFWdHc0Z3lPc0xHMEozVWxZUVdkZVhCTDMxYmpOZDZ1?=
 =?utf-8?B?SDl3cU9mS1p0YUFoVjlWVlZwS0Z6Vy9HMXV6NVpJUHp1eXdUZncwWFhTSlZX?=
 =?utf-8?B?d3dtQnpPbmxwOVk3QnZpdG5yTlpFMS9ydGJZY1JZdDVjN1MxOXRpUmdTVjdo?=
 =?utf-8?B?L0prNVZuT0RjcHVaV0s4WDZ0T0ZjckxVekp3aTZTWFhRd0lHV25VSndORzVP?=
 =?utf-8?B?Q1ltUnJ6ODg0Ymt1b1UybGFmQXBybUZaK1FKaGRiWE41WHdZRFVQSzZqa1pP?=
 =?utf-8?B?M0hvNU84SHpLWUhMY2EvNGV0c2ExMndBcjhxM0RXVStYUUxoR1dpM0J0Zjdi?=
 =?utf-8?B?cmd2emRVTlM3cEpXc3NsZ2hpdHoxSW01ZVA1UWFDdEwyYW9DYVp1enRpeGM1?=
 =?utf-8?B?QWhEbjVqSGhXQ0U2T3llWjMzN2hmeHo0WXFvSUNGSGRnc2xySGdyTHpDQzVR?=
 =?utf-8?B?dVlPZEZzYnhLN3dRYlNjei8xaWdQSkRIZ3g3NFUrZS9yc3JVTkdLeXY2S2VC?=
 =?utf-8?B?ZWpJZ0U0d0x5YWtIUnhBY1IyTWlJRGRqN1JaeUZab0ZOWVd1TjRwVjBObjhm?=
 =?utf-8?B?SXZ0bXhQZG43TlBNSFAvUjc0WUFxOUZwa3o3WUFHbkUrRGNQM2V2Y3ZtZ0NU?=
 =?utf-8?B?QTNQa2VPeEE2UXd1emFLSGNJOEd3ZUo3QWRYdjFiSElXSUF2QmpTN0MxWVRC?=
 =?utf-8?B?a0w2ekFxMDIrWlBkUUJhSmQ1ZGJScmR1STdCM3pFNkVPUVdvVVNkbVJCRE5j?=
 =?utf-8?B?VVNQVGtVSGJjcUJhK3ZEaUhJaHFuUnRYSDMvQ1ZwL0dKTUEwT0gvTXBZbkdT?=
 =?utf-8?B?cm53OVNoRVJoK09pYkI4eWdYK2o1TW5mODZvSnp5SUhKbjlsZzAwYVRXcERY?=
 =?utf-8?B?b0JoSnpYZHFjQWRSU3RpNWM0MUZVR25uZ2lFeEhzRTNsNVFheGEwTFptQ3lX?=
 =?utf-8?B?V3pFb0ljbk1PQ1RSOFNpOHowWHA5bWdtVkZqK2VsclhyckN5bHZSeXgvaDRJ?=
 =?utf-8?B?RXBGYVg2bG9XQ0lOTlJYSTJ1bWI0VXpOUGJ3Z2h5dXNJU29GOW9Ib1NvUWlP?=
 =?utf-8?B?emJlL3BRTStseWtLUHFDekIrMThlOExPZnJKRjRya3V6anM0RXZJZ29GL3Ex?=
 =?utf-8?B?aitaQlJrMW12SlBSbnU0ZHIrOS9tbWhtWXNIWWQzbVF1NFlEd1lDQ3VYTVhH?=
 =?utf-8?B?Z0hCOFVxczY0cXpJcEhlTEptTVFuc1N4S3E4S29Lb0RDVGxPVTBsNHFHUjBy?=
 =?utf-8?B?U3ZCb0tETDVLaXNsL0JjTVRwellmNW5uOVRQWHNrc212WG1NY3JxSjFyM1pl?=
 =?utf-8?B?YkZ6dnlGMVpteHYxOGNScFdnUldsTVBQRFVpUngwQ1FaQTJjd0ZwcksvKy8r?=
 =?utf-8?B?aEN4aWRyb040blA5clQ2TThBUUUzNlEwYnkwWEVGNzBKWVJpV2pBZm9GVEhK?=
 =?utf-8?B?WmI2YkdDV2J0WHB6MVdRck9BNlRoS0pDazZISEZEUDJoVVA2eXZJZjVqb1p3?=
 =?utf-8?B?eDkvcndReHRUb2RiQlozN09MNjFjVGtCRDM3WVhIVVVBdzZHbTR4Z1VVVXcz?=
 =?utf-8?B?NkVnZ3pNcitLMTJFbTcxdHVjZUFIVFdURFZtZ1FnRm5FYmxKdm9aT1orcjRR?=
 =?utf-8?B?S0tLRFlPM0xSeXJXRmk1a1N1V2FBS1pkWm9kaTVNQXJLT1JTQTR0T0VuenlD?=
 =?utf-8?B?WGFSQXlOd0hMNDF5Z2FVa21QUUNXNTFNcUZYU0tiZnZ3aFhoaElsdmhOYVY2?=
 =?utf-8?B?alNaUFRtMnNtWmRmTmYzdTJzcSs5VEpWYXJaZHJ5dERjbFlBYXUyOUVwY2xV?=
 =?utf-8?B?bDgrVGtBVnJUS0ZtMTRUamhEcVZqb1NFamRTdiswSEEzOGE1WDdmZEhjcGln?=
 =?utf-8?B?dklMZFlUNHRzd2ZyVStOOEE1MTVuY2ErbUdIdjVDZEc4cjJBdUdKeXBPMEty?=
 =?utf-8?B?dEs1K0ZLZFdqNVdDRjVkNG51U2ZoUVlHSzl2WE1kVGZUc3lmMGlkL2R2b01I?=
 =?utf-8?B?TnlHZXZKVXNDckxNWWtqcTQyemw4TWtTQjQxc0M5TzdLVGNOZmFJdUIvWlNh?=
 =?utf-8?B?cWliUHJrMTgyZjRVT0lYd25neFZhOUlBY1VQKzhuTUJLdmlydStiTXRuVVFF?=
 =?utf-8?B?RzJ1NVlMRUt5VVV2KzNRelRWWHZ3NkpYR1d2VEZ0dTlmZENtN1ZHR2g3R1Rk?=
 =?utf-8?B?dXU5bFRIRlR4aXV0WlBGdEMybHhkU2VYVko1Sm5VMmxjZHljT3ZMQzE2UjMz?=
 =?utf-8?B?dVVYZWNCRnN5MUVBMHdOamJiSkNpTjZuTEJvbWE4bUY0OUVNYVB4RklocGc1?=
 =?utf-8?B?KzE3ZEMwRmQ3TEVha2NUSENiM3dBRUw0Q3VudnpKNjNCWnVORjBLZ2gremNs?=
 =?utf-8?Q?DqpPSHDp12fnR9ks=3D?=
X-Exchange-RoutingPolicyChecked: eoTqqy7fskwCDvUtLGvosY2jJdPzHb9FJVtl0Iovys8oqHjmAtcHZ2yqasjGttbwNZQHXmSjSDNyXjyVszkO7+tkrRUBZB+kCQ6iCHgTAcpF3ogbPw5w1hcCJcYsp/v0+ZtDtglLOIUUy8Uz29CFRFCSthMGSQTuckVm8egxw7UVZxY2WCd35Mly5vP/tvyqIYYHn0jHXU/FTJ3oN/Qt0gYaCqvdRiyz8lHAT2cRxScgYwHSrziLUL29jfprbnKvJ4X+VSMJIaJR0aWAeynT3ychSi5YJBCAZBb4LaNjqzEDK6nds9QjdHUuBulRU72QmzTadJaxFXmp+Gs9v6cp3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49366624-7132-4b6b-8515-08df0430f737
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:47:26.3367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sEasIiXxDyKMSFHhWcFg2wrwFI4UNGRuK654lpXvEHwTgwH82Y+FYhbqnzM29o/UA+hjhfQo8EIaZwglXvx/tdSy8Sgaqok/jJVGtIjKfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
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



On 8/27/2026 2:28 AM, Daniele Ceraolo Spurio wrote:
> Convert errors during critical GuC flows (init, load, reset, suspend)
> to use the xe_log_err() helper.
> For the GuC load failure scenario, the possible failure modes have been
> bucketed into 3 different possible error codes to distinguish a bad
> binary from a driver error or unexpected HW behavior.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c7f8bbd4cb92..484cb47fbc81 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -777,7 +777,7 @@ int xe_guc_init_noalloc(struct xe_guc *guc)
>  	return 0;
>  
>  out:
> -	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
> +	xe_log_err(gt, GUC, ret, "GuC init failed\n");
>  	return ret;
>  }
>  
> @@ -845,7 +845,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	return 0;
>  
>  out:
> -	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
> +	xe_log_err(gt, GUC, ret, "GuC init failed\n");
>  	return ret;
>  }
>  
> @@ -998,14 +998,15 @@ int xe_guc_reset(struct xe_guc *guc)
>  
>  	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>  	if (ret) {
> -		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
> +		xe_log_err(gt, GUC, -EIO, "GuC reset timed out, GDRST=%#x\n", gdrst);

IIUC we want to pass error codes as-is (if available), not to
replace them with some ad-hoc different errno

>  		goto err_out;
>  	}
>  
>  	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
>  	if (!(guc_status & GS_MIA_IN_RESET)) {
> -		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
> -			  guc_status);
> +		xe_log_err(gt, GUC, -EIO,
> +			   "GuC status: %#x, MIA core expected to be in reset\n",
> +			   guc_status);

nit: we could try to pass 'ret'
>  		ret = -EIO;
>  		goto err_out;
>  	}
> @@ -1163,14 +1164,16 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)

better to move changes to load_done() into a separate patch
also update load_done() function comment which still mention only -1/1

and maybe to follow general api convention we should use 0
to indicate success and -EBUSY for in-progress ?

and then

	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries),
				load_result != -EBUSY, ...
>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>  	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>  	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
> +		return -ENOEXEC;
>  	case XE_GUC_LOAD_STATUS_DPC_ERROR:
>  	case XE_GUC_LOAD_STATUS_EXCEPTION:
> +		return -EIO;
>  	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>  	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>  	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>  	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>  	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> -		return -1;
> +		return -EINVAL;
>  	}
>  
>  	switch (bootrom) {
> @@ -1184,7 +1187,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>  	case XE_BOOTROM_STATUS_EXCEPTION:
>  	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> -		return -1;
> +		return -ENOEXEC;
>  	}
>  
>  	if (++*tries >= 100) {
> @@ -1222,9 +1225,10 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>  
>  	if (ret || load_result <= 0) {
> -		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
> -			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> -			  xe_guc_pc_get_cur_freq_fw(guc_pc));
> +		xe_log_err(gt, GUC, ret ?: load_result,
> +			   "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
> +			   status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> +			   xe_guc_pc_get_cur_freq_fw(guc_pc));

we can use 'act_freq' and 'cur_freq'

>  		print_load_status_err(gt, status);
>  
>  		return -EPROTO;

hmm, -EPROTO was likely already incorrect, but now we should

		return ret ?: load_result;

> @@ -1461,7 +1465,7 @@ int xe_guc_suspend(struct xe_guc *guc)
>  
>  	ret = xe_guc_softreset(guc);
>  	if (ret) {
> -		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
> +		xe_log_err(gt, GUC, ret, "GuC suspend failed\n");
>  		return ret;
>  	}
>  

