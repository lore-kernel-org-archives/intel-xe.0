Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0378AD12671
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E2A10E6D7;
	Tue,  2 Dec 2025 21:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgZ1p8jj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CE810E6D7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764710674; x=1796246674;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/D4cA9U9nZuHvvQoS7s7t+txiOqnL/PgVU+ByP9q94g=;
 b=VgZ1p8jj8U+3G/HPPrhxTEV7UKdzhzhKmLx1st164hcBRrP5+SeyLHt7
 sVOlUMFH+EmRyxpL54Tlk5xSTaDj5Pe6A+XZJ4p1fEVod4pbL/2fz9W6G
 NrNXKmfrrd+oOHjUH3neF3cpfiVdRQdLWdsBNv9tVPoABnwpm5+djauzR
 Xg1mmijCp4LvYCmLafY3DpwrwExOLs0zZiOjeBChX3hLoZ0OT9QQzwohO
 zM+SdiFTzntpeEUwt6BPObmvqZbe0u56mwJQf0100UhIif0SukEqC0zD9
 Gg0sxN9fi4CVa5WvfumhSm6U70/zuLnFZp65zE3kTGkgPHJJMPUorTGj1 Q==;
X-CSE-ConnectionGUID: 8RyY1sGsRSCm+B2EUvPV3w==
X-CSE-MsgGUID: 6EIJFfsFTeCD1mEvcAa7Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66733865"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66733865"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:24:33 -0800
X-CSE-ConnectionGUID: P02rahjgTDqvKZh8Q5y9yg==
X-CSE-MsgGUID: 23g7uSw8QYan/EYSGLKvIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="225440113"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:24:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:24:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:24:32 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:24:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/7BT9aDMxd0cHsII+GNbpXd6gjrs+KU8Kt3QVa1RHKZNB1PU1evnBtzfc2DOtlIdG2dHl2IYcrPepdFevW8gy8UyQockrZGlzcjT7T4x7vQrulSLkzVqZRT0yehM43kFfCYY/9HmyLE9pm+FloXanR/U8ARXz87A6dM2bCaEhAkPrMODLd1h1VkxdWUIlzU0oybbF9svbShGvYULEa1ih7Rv5aFTnPh5foom9VbzOOR5JjAU/ctYlG6eRqc8YlALw9Gl29O/62phlvKTVsExA+V+NQeDbl9YLP6ELTJoutIWTG/RJ/BBXCSin1ftrS1L7xqgZMTi+dzO/tUCPUmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LU2QOSNf044MTQ923NykB2xmFuDf87UEZ8qd0G6Yr4c=;
 b=ruIw/SLVQ0bQS5F/uhz3k5VWdr11Py5dbPkcyW7wthotvmclkBFmXqiCfMFhT/l9rZHgnIv0+kaqJhsGVUsxL6JxYgRAlWMFHU19nI/q/hLPgroVIO+ljX9r9RquzE8sjUl0mv4QAhicCuYrHkxKfZsEf3iO529NTAPdU93deYVk9q+1pAQ7vwWyDFrvxJlp0PpmUFqrmG4ScQDtMfjwVte4jpAtmOq9M5Q1jDVKnhi7OszNkow6/yWZU9AHACeG5KlU1C8FW4BooqrI/U51LiXwILCdA526EKqIB4uL+hQ/ki/oMHH1Nxg2Bw7RQr00Ntf4Jke44wfh8yMGjnfvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA0PR11MB7815.namprd11.prod.outlook.com (2603:10b6:208:404::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:24:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:24:30 +0000
Message-ID: <a02f5ec3-2c77-40b2-a9a5-ff764fa1712f@intel.com>
Date: Tue, 2 Dec 2025 22:24:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/xe/sriov: Add debugfs to enable scheduler groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-17-daniele.ceraolospurio@intel.com>
 <e60a856c-7ecd-4e4f-9795-8ba327f897fa@intel.com>
 <cb02f698-b03e-4eed-9106-b593f66be1b0@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <cb02f698-b03e-4eed-9106-b593f66be1b0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0008.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA0PR11MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de3f8af-9c9c-4692-89ce-08de31e92e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEZqekJ2aEc4RWtreE1GUzNhZ29lcCtVZUE5VTdYRFBqVlNxcmF0djZtaXhK?=
 =?utf-8?B?b2JmUlgrMk5ZWEd2WEVHMEYxbFZYSCtOK0MyK0kwWmpybG9DS0JpQncyOUpP?=
 =?utf-8?B?UndNQVBCemhHNC9RditoN0JLNFZUeGJDdlV5ZzZtT3N1bERYSWNWU3ArOVVU?=
 =?utf-8?B?UURuamJCVTYrS1loTUdxbGoxdnZtTjZBNytWYVA5WjRub0pPeStuZjJEbFd3?=
 =?utf-8?B?RjdMaWVpTTV0UzBMTHZrSXdyaExYT1lVNXRXdlBzNFl6L2g5Q3NoRE9VYzhT?=
 =?utf-8?B?ZDBJYVZtek8rc2xObHZTRnhpSHNPUm9mQUxYbERVMzV3V1Q3akk2Q1RrckNa?=
 =?utf-8?B?S3p2b2liZG5yUjFMOS9kRTV2U0lLRTBTYUs4cUhLL3NrVEQ5VVRZU3B6M3g3?=
 =?utf-8?B?M2UwUGpaRVNndzYyNDJ3YzJrTlNOcm5jNk1RQWZ5RVV4cllRUWNLR05yNmRt?=
 =?utf-8?B?djcxTzg2S21NLzJrZXl5anBDWVk5eDY4aUwrOWhMS3BTbFRKVVhVWGEyV21x?=
 =?utf-8?B?c096TGlYb1VickhqdzNveDRkQTI4SUpHbjVrRkZ6OEJwck45ckcrWEpPSTNX?=
 =?utf-8?B?RU1BdXdYUnA4NVoraGxJWmpDcmJMdEZBSkxpdXJPZUJJK1lqT2s2VXJla2Fl?=
 =?utf-8?B?TFo5cWlORnQ3T1hnSkluU1lvZ3hhNGFaMUZTQnYwT1ZTV0M1MFFheW5PdWVS?=
 =?utf-8?B?QlNUY1BId3VpUWxCS3FubHU4M0NZRXlxU2wxbXlXL05GVkNvRzJiL3RScVVm?=
 =?utf-8?B?WUV1VkdmVTdRTit1N0lBRmJDb0FqNkNCMWZHQ2M5ckc1c0Y5dGZMaktESmt6?=
 =?utf-8?B?YzZ0cmNDMGVEaFAvODZkc1FuWkgzMkVNajRmS0o3VTFRZVNnRTVNdnZwRTB1?=
 =?utf-8?B?VHRXOFdVT2dqQU1kSXpKVi9vWXErNkQxV08wZlMvSElUY1k4dmVLLy9BZXJ5?=
 =?utf-8?B?M1ZTYUs5dWhwQ2FockxrUlJRc0ZPdm5wR2pSMWhyZHY2M0tHYXdpcGhGRkcy?=
 =?utf-8?B?V213eHVvdkRlQ2NQOUc0MHpFYnNsVWwwR2tFWFZtMUoxRktNRGQ1VzM0SkNQ?=
 =?utf-8?B?SHhTSXpaczVzbjBBdDJxZ2hza09yRlc1U0JOVkxraU91K1E2U0lQb25Sc01Y?=
 =?utf-8?B?MXdRMFMwRDZxQ3R5SFRLdU9CeVp2ZDJ5YTB4ZmYvZXBEbmhGSWZYZXB5dG9X?=
 =?utf-8?B?VGpERzdNWGVscDdhZVJPUUZZMkx4QlZ3cFAyL25mVENMYXMyd1VYZDVCVzdt?=
 =?utf-8?B?K1dsbHhDeVdYMy9jYU1IMUdYMVI5M0Z6dFdEUVN1M3BpQ2U0Q09mS1Fya0lC?=
 =?utf-8?B?U3EzcU1UWW9sYWFST1ZUTWhZU3F6OG05Y0tpZGk4M0t2Zms5LytrVEQvMFk0?=
 =?utf-8?B?VGFKaGtmTWZIZHlLcVA2bFR3TjZld0FJaDhiZnNoZWhPTmcyVENtemRzNFIv?=
 =?utf-8?B?aWFYRi8vVWcyUEpaWXNvcWNJUHhtL0orcnk3NEw3YWMyWlovR2syczFJdXhu?=
 =?utf-8?B?SDVaM3RJeCt0U3J2MDVVR2p3eHpDU1F1cEcwOTVBMi9PK2N2VnVTa3p6THpv?=
 =?utf-8?B?YnR0SHVsN1YrQk0vMk02aUJsUmhBbHAvTVZDZkNMcmpvdlJCSkplWHRSYzhw?=
 =?utf-8?B?cDdUR3o1cUVMaWJ4UldiU0U3amtmYUVqVHZWVU9GZmVSbzFJYndEcVJIMW5R?=
 =?utf-8?B?YmlVcXg2ZjcvdmpzK0FCNjNMNVhFN015c0FwSkk2OVBrOGlqTm1WTnhYQnZH?=
 =?utf-8?B?TmoxVFl0VnoyazdFUEtuNUtnWHhLMCt2bHdVZEF1bWhpNTZMaVVpWWx6bytP?=
 =?utf-8?B?aDc5RkZnT0ZnS2FlUEs2ZUNkQnFaQ1ZWblFUU1FrK01Va0xkdHhCRDJYT0Vx?=
 =?utf-8?B?MzdBVXFtYUI3RkhRNVlHblo5T2wzcm1mL25DN2xUUkFGL0piQ05VTXFFUEw3?=
 =?utf-8?Q?idyQVvhES2ruPT5PE7FA90Yb9s+0G2GU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0VZSDFwcHprNGNveVVIR0YrYlRFKzV3VGZpeWF6eEU1UVZoUUJHTE5YQnNI?=
 =?utf-8?B?dStFOEJJVnFmYkFNQW1OSkc4OG5VRytKUE9pem5lWGhvY2UwaWtXakkvaEFo?=
 =?utf-8?B?MHNxcDVwQTRKVnM2VmZpZHFQem42Y2FUU01NT2tjOVVySGkrc1VaZlc3Y0hZ?=
 =?utf-8?B?aEFQd0xlcEZRUHArMTFpdXhSMVljVG9sSkp0ZmlVWTlIZTdlMWVHUUhkMmty?=
 =?utf-8?B?UXBRSUs4ZWhLejFFRitHSzljRk9SQ0xuZXFiSTVLcFQ3VEU3QUo5QzY1bVFL?=
 =?utf-8?B?NmdMK0UxZ3FqQmlRRGpKajZNVmhyZzBkc2VnejRsL05mNVFxZDhDUzJwWXdT?=
 =?utf-8?B?dStlY0MxU3NMSnhUZ0tXeFhKOGRsYzhCb2M4cTBEVjRsQUxpZ29tbDRtcVpW?=
 =?utf-8?B?U05IWEtMbC9uaXl2R3E5QmhGZDFNT1pBZ2dOcm1aMER1ZUcwcHhROFBnemF3?=
 =?utf-8?B?blE2TlVMaUdOTzZvVEIrcStlRDJ4THlFRENFbUxRTFNKUjhVS2l1NXNiaDRp?=
 =?utf-8?B?R2JPb1BpcXVxTWFuQU53cjFDNWhJOStSNkZnR2k5Rml3dENxSlp0cmZSTm01?=
 =?utf-8?B?OEN6dWw4SmhvSCtGNTU4VUNKalkwUmJwOXdKVVN5Mnp0cmpDeHFheUtvR3h2?=
 =?utf-8?B?cjQwODh1QkpRVUFnb2FCejdVZkRkNGpGdnFTVG5UZDk2QXBDZHpNajRkZFk4?=
 =?utf-8?B?UlJSM2x3N1BWb1F3T0xJd0VNZytVZFNiR29ZdktRVHV0TU01T25TUmNHanNk?=
 =?utf-8?B?MlF5VGFDbnZ0N3JpbXYxbkl2YitocWRrSlFETnBEeVVTdzRkSWZIZDNDbWZD?=
 =?utf-8?B?WlFEZ3hqRlpCNDZVVHJidnBZOWE3dVhuUTFjR2ZzNFROSktOMEdWNzB1eWNO?=
 =?utf-8?B?SEpWeGU4cms1UXM4WVRtMjdjazFjY0VwVks5MFBMZTJ6WFR2WHJyN1RNNjBr?=
 =?utf-8?B?T2pSZldqYkFQTCtIOWl0NDZLUUJyK1c0YVNxQXlzMElJbU9vc09wbWkvY1k0?=
 =?utf-8?B?Q2hVczBqVjhFQXVJcVFDcHNGUitxcVd4bmNOSHdubFpMVXMxYUI0b0dwQlEz?=
 =?utf-8?B?MEhNTmNTd1hpaFBuZDhZV3NaUmpYZ2RNQ0lQQ3Q1YWdMQ0NtWSs3blU1QlE3?=
 =?utf-8?B?QXA1YzhuS25sM0VGd28rMzQzelJ6dzJ3T1ZvditsU3JPa25RWkpMVjYwK0Uv?=
 =?utf-8?B?RXZzWlYxUC9aejRSWm9hb3pvOXpxM25ya0psdWNPNXl4RmN3RWVNQTR4ZXRi?=
 =?utf-8?B?eTZ0SS9UZ1ZheVRlZy9TMkZ6OER1VDBDY3YyMlArbjMvcXAyRnRSZ2dJYitz?=
 =?utf-8?B?WUNDRzdmdk9xcUNDY2hhY0h6ejI5V2RsQk5UNEdPbDVwTzk0UG1YSk1yZ2dH?=
 =?utf-8?B?eUdUYUJTOWg2NnBYK3dsbHJpUWdZbnpjREtkZVJ2L2Zhdi8vWVgxbjdsQlZL?=
 =?utf-8?B?M0R0TjJHMThkbU9jV2RnUzZseHNDZEp1TUg0TnJEaGgzcEVoc3lsZTVFcG1W?=
 =?utf-8?B?elNnY0poYnZBUWlxNUNERkpoOStRSXdxbG83eGhSVDNhU29LM2J1QkVUSWs5?=
 =?utf-8?B?Um4yTTB0d2w0bThxdFpBZEpBcnVUOXdsaVdWQk5nYjJFa1FhK1Bad0dxb2Nj?=
 =?utf-8?B?YWZQV0lPTlpFbHg3eisyUTVTTXBQdXV5b0U1a1hSQm5CdHkzcHhXMUQvSlVs?=
 =?utf-8?B?WXFvaHo3K05VSFB5VzdrSE9uaDZNakV3VHdUSlFxYjBweHc3Zk5NWWtNaHd1?=
 =?utf-8?B?MFlQWStGZFNnRnpPVk9xMlBKQStJV3ZlMkdUVUE4NGNCQzdoOTR5ZVpic3Nt?=
 =?utf-8?B?eWszcTN3ejNjOEtrWGV2amt5WXRPMzRwRDdLd2JXQXhMUGRCY21jRENTdm10?=
 =?utf-8?B?NUcyKyt6MnNwWjVTTHo4ZDBEakJ0dXlBZkp2RGhkTEcxZDN1Z3lZQkh1OElW?=
 =?utf-8?B?aDNnbCtZalpFdXNCVFloZzJUbkU1K1pBcEg5a3FmOGRrbXRtcklYekdRWG9l?=
 =?utf-8?B?N2JMdmZqblVLSFZOT0gxdkg5QTJjSkxBSUJXK1JNQjZkRW44dlNoZTg2akpP?=
 =?utf-8?B?SXpDRWRrSUdzdXJCMDJUbW9DZmE1bTUva1hQMHd2ZTk2Sk9URmdnTmtKckwy?=
 =?utf-8?B?YWx2SWp4dGR0dS9BSG5tUVJldWxKc3VRNmJCeUYyNkVLd1ZEZm91dS9rVllY?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de3f8af-9c9c-4692-89ce-08de31e92e18
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:24:30.5461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BXNiqZLfcjirmC2bECzj/fodI//1cFh3eJx4mPcxRkL4QPKel5r3RUIu7MtJytzQL82S0fALHoowW60y55KtlwcVuSFo2cxSE5NXjFRyYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7815
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



On 12/2/2025 7:03 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/2/2025 7:52 AM, Michal Wajdeczko wrote:
>>
>> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>>> Reading the debugfs file lists the available configurations by name.
>>> Writing the name of a configuration to the file will enable it.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 116 ++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  10 +-
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   2 +
>>>   3 files changed, 123 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> index 0fd863609848..2953ef21a5ad 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> @@ -155,6 +155,121 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>>       debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>>>   }
>>>   +/*
>>> + *      /sys/kernel/debug/dri/BDF/
>>> + *      ├── sriov
>>> + *      :   ├── pf
>>> + *          :   ├── tile0
>>> + *              :   ├── gt0
>>> + *                  :   ├── sched_groups_mode
>>> + */
>>> +
>>> +static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>>> +{
>>> +    switch (mode) {
>>> +    case XE_SRIOV_SCHED_GROUPS_NONE:
>>> +        return "disabled";
>>> +    case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>>> +        return "media_slices";
>>> +    default:
>>> +        return "unknown";
>>> +    }
>>> +}
>>> +
>>> +static int sched_groups_info(struct seq_file *m, void *data)
>>> +{
>>> +    struct drm_printer p = drm_seq_file_printer(m);
>>> +    struct xe_gt *gt = extract_gt(m->private);
>>> +    u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;
>>> +    int mode = 0;
>>> +
>>> +    if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)) {
>>> +        drm_printf(&p, "no groups available\n");
>> since this will be used by the file read operation and user expects
>>
>>     "the available configurations by name."
>>
>> then IMO we should just return empty string
> 
> ok
> 
>>
>> and if we check for EGS support earlier, see below,
>> then maybe this could be just an assert?
> 
> sure
> 
>>
>>> +        return 0;
>>> +    }
>>> +
>>> +    for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
>>> +        if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>>> +            continue;
>>> +
>>> +        if (mode)
>>> +            drm_printf(&p, " ");
>>> +
>>> +        if (mode == current_mode)
>>> +            drm_printf(&p, "[");
>>> +
>>> +        drm_printf(&p, "%s", sched_group_mode_to_string(mode));
>>> +
>>> +        if (mode == current_mode)
>>> +            drm_printf(&p, "]");
>>> +    }
>>> +
>>> +    drm_printf(&p, "\n");
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int sched_groups_open(struct inode *inode, struct file *file)
>>> +{
>>> +    return single_open(file, sched_groups_info, inode->i_private);
>>> +}
>>> +
>>> +static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>>> +                  size_t size, loff_t *pos)
>>> +{
>>> +    struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
>>> +    char name[32];
>>> +    int ret;
>>> +    int m;
>>> +
>>> +    if (*pos)
>>> +        return -ESPIPE;
>>> +
>>> +    if (!size)
>>> +        return -ENODATA;
>>> +
>>> +    if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt))
>>> +        return -ENODEV;
>> maybe not needed - see below
>>
>>> +
>>> +    if (size > sizeof(name) - 1)
>>> +        return -EINVAL;
>>> +
>>> +    ret = simple_write_to_buffer(name, sizeof(name) - 1, pos, ubuf, size);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +    name[ret] = '\0';
>>> +
>>> +    for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++)
>>> +        if (sysfs_streq(name, sched_group_mode_to_string(m)))
>>> +            break;
>>> +
>>> +    if (m == XE_SRIOV_SCHED_GROUPS_MODES_COUNT)
>>> +        return -EINVAL;
>>> +
>>> +    xe_pm_runtime_get(gt_to_xe(gt));
>>     guard(xe_pm_runtime)(xe);
>>
>>> +    ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
>>> +    xe_pm_runtime_put(gt_to_xe(gt));
>>> +
>>> +    return (ret < 0) ? ret : size;
>>> +}
>>> +
>>> +static const struct file_operations sched_groups_fops = {
>>> +    .owner = THIS_MODULE,
>>> +    .open = sched_groups_open,
>>> +    .read = seq_read,
>>> +    .write = sched_groups_write,
>>> +    .llseek = seq_lseek,
>>> +    .release = single_release,
>>> +};
>>> +
>>> +static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>>> +{
>>> +    xe_gt_assert(gt, gt == extract_gt(parent));
>>> +    xe_gt_assert(gt, PFID == extract_vfid(parent));
>>> +
>>> +    debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
>>> +}
>>> +
>>>   /*
>>>    *      /sys/kernel/debug/dri/BDF/
>>>    *      ├── sriov
>>> @@ -528,6 +643,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>>>       } else {
>>>           pf_add_config_attrs(gt, dent, PFID);
>>>           pf_add_policy_attrs(gt, dent);
>>> +        pf_add_sched_groups(gt, dent);
>> at this point we should know whether we support EGS or not,
>> so we should create EGS files only if EGS is supported
> 
> We actually don't. xe_sriov_init_late() (which is where the EGS init is called from) happens after xe_debugfs_register. xe_sriov_init() happens too early, so that's also not a good choice.
> I thought about moving xe_sriov_init_late to an earlier point, but I didn't want to mess with the general SRIOV flows. Thoughts?

add dent at xe_gt (like we have on xe_tile)

and move PF GT debugfs initialization from xe_gt_debugfs_register to xe_gt_sriov_pf_init() ?

but will take a closer look if this is safe ;)

> 
>>
>>>             drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> index c7f1ea8eb9c5..3c5fc1b5f281 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> @@ -507,12 +507,12 @@ pf_policy_has_sched_group_modes(struct xe_gt *gt, unsigned long mask)
>>>       return gt->sriov.pf.policy.guc.sched_groups.supported_modes & mask;
>>>   }
>>>   -static bool pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
>>> +bool xe_sriov_gt_pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
>>>   {
>>>       return pf_policy_has_sched_group_modes(gt, ~BIT(XE_SRIOV_SCHED_GROUPS_NONE));
>>>   }
>>>   -static bool pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
>> public function needs kernel-doc
> 
> ok
> 
>>
>>> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
>> if in the single series like this one, we know that we will need some function,
>> I guess it is ok to define it as public on the first use, even if it was initially
>> used only locally - this will make smaller diff on next patch like this one
> 
> ok
> 
> Daniele
> 
>>
>>>   {
>>>       return pf_policy_has_sched_group_modes(gt, BIT(mode));
>>>   }
>>> @@ -553,7 +553,7 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>       xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>>>       lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>>>   -    if (!pf_policy_has_sched_group_mode(gt, mode))
>>> +    if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>>>           return -EINVAL;
>>>         /* already in the desired mode */
>>> @@ -588,7 +588,7 @@ static int pf_reprovision_sched_groups(struct xe_gt *gt)
>>>       lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>>>         /* We only have something to provision if we have possible groups */
>>> -    if (!pf_policy_has_valid_sched_group_modes(gt))
>>> +    if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt))
>>>           return 0;
>>>         return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
>>> @@ -615,7 +615,7 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>>>   {
>>>       int err;
>>>   -    if (!(pf_policy_has_valid_sched_group_modes(gt)))
>>> +    if (!(xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)))
>>>           return -ENODEV;
>>>         mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> index 89aa3af6cc7d..13550cff7c00 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> @@ -17,6 +17,8 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>>>   bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>> +bool xe_sriov_gt_pf_policy_has_valid_sched_group_modes(struct xe_gt *gt);
>>> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>>>   int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>>   bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>>>   
> 

