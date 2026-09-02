Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCC1C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 11:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E38310E647;
	Wed,  2 Sep 2026 11:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikf2WZDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC2310E008
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788350079; x=1819886079;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WeUlgbnCL5A0SHoR9Tntun6ANq39L4sACrexSlHb9W0=;
 b=ikf2WZDBfARCjUR73m5zABDZHdwyq+sIwRKXvw1XyGlIKcwLD/ogKxW8
 +9o1ZK4D/oAIDzj2MSUFys3xJ5LeMHUGbFEOiSluBqofJhPXmmmJ/kjUy
 LG6nYx7JojtmSkXEx5agHLmBUmZ+3apgnc5c4kepo8mCb26S+SXQRl49U
 Bn/39M5RhXC8jyuMiKvAWg4P4BVaP58NFwwQaR+pvuat3zvxO1xpwbIrf
 vKWkfnLnmb91R9GwPyBPksEvCgcYYLQ2YBaDMbCQYt+SFXBUqFIwl8NSn
 gHe4KmfdiVx0/ZGeFPr+2y8kBUAPO8kt1/QcuQFpcGUsL6alJnMQZG8Ox A==;
X-CSE-ConnectionGUID: Z2/weyIZSbCLJ6+GDeTKFQ==
X-CSE-MsgGUID: mbqhK7vsRm2nul9IXAXJrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="89013198"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="89013198"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:54:38 -0700
X-CSE-ConnectionGUID: o4OvZ4moQdCE2E4RDtktaQ==
X-CSE-MsgGUID: bBu43laOREWxWFYcUHiKGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="266778443"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:54:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 04:54:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 04:54:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 04:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOKK334+HQZwiS8lTOXsBRH7T82kUPaCUnZpPpaMVi/ylsXkh1YzUtYSrYaz7mmY2Z593Bsjg65+Ucloh9ZdAGuRIYApa1MSi09IQYNZdU6r4vjOVB6/QLo7OeKQ33W36nwHlpMutE1K/9EhVT6NRgYhlYW2UsCLWzWPCSihbKXLPTTY4AFV4TOtlKN1H59EQ6rhJFtVCxjK24Qgfp6MoLvpTocc8toiZ4XZyJhzJTE5g7/+UMGE4VqejJlwiMoJl0wsf3Y36Z6oRKjjAxLvSuVEgZuvFofGUyTP1QikfP5L8+1i/LH6XQmGX1Qg1KReTNxPvEsgyXDf9xnJpT2mXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSqKHVXLbNJtaaRcAEFbjYE6UVjUwARTqeLlB9uuo7w=;
 b=KcDhniXRyrXPUod/XwWih/HXOINjIcQ3RznP5OZUivD5Fu24EACWTi6+zarBSmNdHjo3Mt4kFCegpHrVGoYRjL3mg0EqaXb35qP5h7xxsHZJ3gR7JVE4xVcxUYlrU9bEmM4S9CsEqXbfRm6L96uNJVESzvMFjABZ0rRQ5t77J3edzW9yXsDrqkC5GmR9m/WJvGDqOgj22ImzfpRXEOoD931Cgpjp1RzzOZwQ1ic7P53nT4vojPFABo546I5owpgTOED34cgzuyaTK6pwmSIoD/9G7vXzaOrHEul15v2g/SI5RY5HIKCIAJ+IxGmtIdaatckdc2+Sqa7GpT2VmBdc/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB207987.namprd11.prod.outlook.com (2603:10b6:610:364::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 11:54:29 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:54:29 +0000
Message-ID: <8e04d8ff-4bbc-44b0-ad21-f2756f7dff45@intel.com>
Date: Wed, 2 Sep 2026 17:24:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] drm/xe/svm: Report terminal page-fault failures
 using SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <michal.wajdeczko@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-4-arvind.yadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260901063059.2547247-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0347.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::19) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB207987:EE_
X-MS-Office365-Filtering-Correlation-Id: fffe7cb1-9b26-4040-0da3-08df08e8f1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uaZpkc0V4ZGZKdttadSpeooitITCxHIzgGlk97zt/7azXfsvRWMiILow9LXYI5/PPeLtkAsMMAsG+z8nohi3v4Iy+T0uy2fvinJQP2JstMMvnNnDt39q4C0iXrfXjfskgPLnTwxRovsw9U/ykwzlWrtRgTT3U/jjLUd7VpCR6jFOR2ii62f81v7R5ZGYtZ3RLg33zrfasnNaWBJV41SdONAXdg07QcUqhRGUMlYw2gctq461UJkeLhxlRYnkQqNFjGsaC8fFrICjjrZ2INDX+V80VXCH/LLsG9hkZfZ03+yoPXDplmn1pY4oB0CG/vi6qb///jB3ToZaKGdDdxZ66nQMdlrJAYcUvIneAN+lUayj7i/C0kbCcud0dd7ckXZjN5h/1DcSdOHK3QAOnGi7F0Gb66P2I3jhU2iFssmBOlF+ZQzRkBAs7L/djkePfC4OthKlGBGWFMJ4qy848drbz7HCgcNumW20VBL6lAY4jmbnz1jWfLBZt2e6G+TbAcqrfrG6xB/2ob9o3hmmgplZ/nhlhAxbUtcN8eZB3XH257Fwrq5YAzj+2OFP/i/VwjtntkSx5hQ7QUZVd1tOpiTV7TQ14cgGSlWky7zT3EP7JjR21ZHMiH6L6phV4Cya0dZNDaI6flv0wsq6RSHDYiv3/5VwyrBgIR4bwp6TMA2PHvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUcxUnh4ZXE5eHRWb0gvUU5WZFZMUGpEdEFFOG1SeGZRN2hHYnBGSEtuU3Vt?=
 =?utf-8?B?RHlxNURxN2M5WXhiZHVrb21mQkpaQk5CMnZwUjRDbzJBcEsvSXhHNGlVNzYy?=
 =?utf-8?B?Z2poWFN3RlVCS2d4eHFkUklWREtiemVmLysweFdneTlnNTQ5UDlRU0I5dzdr?=
 =?utf-8?B?T1RVbEhtY0NXNnR4SFBKdWpDWE5hRUZDeHY0TUxhTkdzTVlhbW9yWGk3MXJu?=
 =?utf-8?B?ZmJ6eG44d1VoWGRxTXpPVVhIYWpHNlovREx1STY2TW00QitqK0FmcGFEemJS?=
 =?utf-8?B?ZjNMWXBWTGhNb1FNd3MrcmhzWDBNdm5yTW9VVStGS0ZwOW9MT0I5RnY0T0Fw?=
 =?utf-8?B?TDZQZ1ZhQk84RnZndDZzRmJya0toVjZpdndmR2NBRFhISFRnekFMblBFWmpD?=
 =?utf-8?B?OTFBT2lMdWZaVlA0dFRpczJPZHlieXZnSm1mUHpXQTBoRDJJZGhySlMzOU1k?=
 =?utf-8?B?b2t6MGgzUEpJMndxTTlMcGMzWFBmakFDSGVOM2NHSjlpYXdsKzA1d2M4MEZJ?=
 =?utf-8?B?YWZFMi9JT2FNcmZmcndNandIM3BWbHcrN1RtTHhpOWRNMzV1TXh6Z3NNejM1?=
 =?utf-8?B?V1JQUk1KcFVtSk5sUkJONzA4REdsTlgwOFV1STlOemowV3l4WVhpaXVvVlFo?=
 =?utf-8?B?bXV0dzBZOG9QWm82Tk9vL3A4S2hPTEdkUFBZRUhGUDEyeHorZjFXUTlCTDNO?=
 =?utf-8?B?RGEwOTZ0LzBVZnJtOXlDNVpubTZHL0wwdkxoTGdXOGlIQzlPM0RybWxxOFdB?=
 =?utf-8?B?a291QzVPS1BSd2F6YXJBcEtweWcwVHUvcEo0NFJnWVZGM0hpQmw4eTc1UDRD?=
 =?utf-8?B?SW9TWUdqY0pZbmxMRUpBSmwwRzFLVzZmV3NIWktRQi9QVUNQdjV2VlRiUXBm?=
 =?utf-8?B?WDQvZmUzaCtWNmFIYnlSMHUzV3JzMDI0NktwZEFyUTU5NXpEUC9OUWRRZkZ4?=
 =?utf-8?B?U1N4UE9QalFzMkY1ZFpGYzZzc0xlaUg0VktuMzFqS05YdGh6aldxZ1hLYXlm?=
 =?utf-8?B?SjM1aDkxZlV2VHR3M2ViNEp3bDFhVzYwOXZxSVZ0ZW1BWFM0RDhUMVlpT0Np?=
 =?utf-8?B?UHB0TVVVRnBMZDM2elFLRHlnSGZqd0xhdmlaK0Y4T21mVUdhOThpTDY5d1Vw?=
 =?utf-8?B?RGd0dUtkYmhjMFJxbnRqQ29MVzFsQS8wNXZyTGg2SDhkWjZLT3N2UFRFZ244?=
 =?utf-8?B?ZnI1TFEzajdHM1hvTm1KbHV3TnJOb1pQcnh4d3VrMW9uVk8yQ2hacXlBeVN4?=
 =?utf-8?B?YU1PaThpVDhUUStEelJFV0wxQmdBZkRFYm5hRjJaN2RlMzhqY2orTnZZUWtT?=
 =?utf-8?B?MnIwNFJOOTFrbGFFR2RJL01sNVVQTDFzRlRpcm50K3lKWCtNSmVuZ2NZSm9k?=
 =?utf-8?B?M1pjL1BDZWxPMWt3OXpFc2dUNGRFNFpWTmp5QVlDdDdoM3d3QUl3b2RpSTRo?=
 =?utf-8?B?VUpSS1Z5ZjQ1aHEzUmEwWlQyeGNYMisrL21lOXdvVmU1dUtSZzBONkNpcW92?=
 =?utf-8?B?NDkrTG52dnk1b3REK0JUTFpockljSVI1MDVmN1RsMHBaNDk4WVc5U3RodllQ?=
 =?utf-8?B?SEpBWnQwbjRvUWpuWWdxb3orVktaMnU5bkhUU0JYWHg5c3czazBQdGFZWkRp?=
 =?utf-8?B?eDl0VFErcFFFVHBiQXJzMVdYSnY1K2NIZjc0YW5TSmxFdUVDNXA5b1YxSG85?=
 =?utf-8?B?ZmsxY09sb0Y3SnFEQzdzZ0YzNHZlcitxOVNPNW9Pd3RIY2dyVXc1aWwyZG5v?=
 =?utf-8?B?ZW9pcWU0djhJQytrSkh3NTdHd3VmalVNdnZjUjdEUzVKZ2grejRTWmlxSGdy?=
 =?utf-8?B?c3lTOW5qcnlMRmFhS3hJNHoxQTErank3ZTdSSGpHZ0EyVW8yajRDbnFZcHJw?=
 =?utf-8?B?RXVNUmgxdlo1dHdQL3UzazFjVlVyNGxtd1J5S1h2R1lxYzJNZFVGcjhiUnFJ?=
 =?utf-8?B?Vm9ZdjdTOXEvNGhsSTIvVGlsRWkwY3Y0N3VQbi9tbThBbEtVM3p2YlFGOG5t?=
 =?utf-8?B?R1VwbktibHVxaVNnWDYxczVMdkNDUm1LMDIyQlg4TE5KNWdmVTYyb0RtY3cr?=
 =?utf-8?B?THJWbmFMUHpFTDdmWGFZb3VQZm5lTDNPbjJ2Q3ZpTi9BZjgxcnNWY1M1ZmlG?=
 =?utf-8?B?a0JTTC83NXNocFRUdG0rMlhVWnpldzN2TjJsR2VrTTVDNkhZKzBmWmRFczZG?=
 =?utf-8?B?aGs4ZzFnd1d2ZFdjRzlBcGtlTWhOOWdGY08wR1lYOXJSdUF6TklVa3ZZN0V2?=
 =?utf-8?B?Q1pZN0Y4MXVnd1MxcVRMenVaYlZ1Z0JadllGYVBTdnJwNGl1MEF4ZHFSUlR0?=
 =?utf-8?B?V0xnd05GWjBtVStIRlA3ZEFralN4bEVsVEZ3WmlZbk5qZ2g2Nkw0clplRDlt?=
 =?utf-8?Q?aDhBnChE/Yk582Jo=3D?=
X-Exchange-RoutingPolicyChecked: FicValfDzfzY3RXfcWPkxDWmrUzMVKHztm3MXgIcZEXiLLNGPntOCSjPQn9DoL/g/k0qILjJZ1QRV9pIe0WzivuNiHhLKFrS32pD7FPf1EP5qODr4yEPvRUjHHHvkIiE3CGslhmHUNGqUd/FlcMN9v1o2yK5rYG0p90WlhUz/Leh/JOVNBRlVMAnJllx4PDvsPIr+Bz2dZaFDbIrOKrrMjhckWxzS3+eTLqE6ljTh6mLGW8CgjfEDO/ZHRKlh5lFPqWzNE3sVmNx88DHbjcfY296WHX91CPlROwpcswP5lzxA6yVQV+O4BomLHJd9aLYjweWfg1aoI30fK3KHThtPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fffe7cb1-9b26-4040-0da3-08df08e8f1c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:54:29.3149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aBFynFiQwCb92eVVTtj4b/ZV9POiqoCSOqUmzpjyj5UeW9CAnv+K56DnFj1OUwI+4pVWqT7cj806JChFj9CmZePI8iv6t/vhxeu4WaBBUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB207987
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


On 01-09-2026 12:00 pm, Arvind Yadav wrote:
> Route terminal SVM page-fault failures through the structured SIGID logging
> helper.
>
> These errors are reported only after the retry count is exceeded, so they
> represent terminal page-fault handling failures rather than transient retry
> conditions.
>
> Use the PAGEFAULT component, which maps to XE_SIGID_MEM_FAULT, and pass the
> real errno value to the helper. Pass the GT object so the report carries
> tile/GT location. The helper renders the errno, so remove the manual
> ERR_PTR() formatting from the message text.
>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 627a741293d5..349e307ca092 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -13,6 +13,7 @@
>   #include "xe_bo.h"
>   #include "xe_exec_queue_types.h"
>   #include "xe_gt_stats.h"
> +#include "xe_log.h"
>   #include "xe_migrate.h"
>   #include "xe_module.h"
>   #include "xe_pagefault.h"
> @@ -1361,9 +1362,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   				else
>   					goto retry;
>   			} else {
> -				drm_err(&vm->xe->drm,
> -					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> -					vm->usm.asid, ERR_PTR(err));
> +				xe_log_err(gt, PAGEFAULT, err,
> +					   "VRAM allocation failed, retry count exceeded, asid=%u\n",
> +					   vm->usm.asid);
>   				goto err_out;
>   			}
>   		}
> @@ -1384,9 +1385,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			range_debug(range, "PAGE FAULT - RETRY PAGES");
>   			goto retry;
>   		} else {
> -			drm_err(&vm->xe->drm,
> -				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
> -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			xe_log_err(gt, PAGEFAULT, err,
> +				   "Get pages failed, retry count exceeded, asid=%u, gpusvm=%p\n",
> +				   vm->usm.asid, &vm->svm.gpusvm);
>   		}
>   	}
>   	if (err) {
