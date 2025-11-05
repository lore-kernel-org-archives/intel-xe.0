Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F8DCCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 20:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3429110E2FE;
	Wed,  5 Nov 2025 20:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhGDv+rQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6DF10E2FE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762373658; x=1793909658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SPgNGLMa8X61lApLDTrfPNOdcI0YwK3xmShyyV/y3Ec=;
 b=ZhGDv+rQpqBuRjV0R9GcF44KPedKYlkVCz239sta7VV8ec9WeHu6+9i7
 /qHGD1/0NXjmGBwX8yo+eo7pcz0w3ZNfMhFGpxCvR2CwcIv/NX/WifHfs
 WMzwAMgo5IAcpOVOyap3fru/EuTwTG6f7VQQHDx3UwF3c879Qfig5b84x
 EPZE9UTLZLkTZR/jHH906/4iB71WrRYg4oHINgu+cDIugUpVHc5FP7+LT
 ltdmPXwM0ZFtdxeDPZdh8hiwRsMP93YmU/EGgygTzgHP83js22XQmvFbw
 LCeXr4VqoZFr/AtdABNThcyecstS0TpSotS0MR9ergYV8Sfy/knVBJhWd g==;
X-CSE-ConnectionGUID: E67waWNaTCuUPXirRcLG+Q==
X-CSE-MsgGUID: BaR1Mv1xT36pAV4H7tM1lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75182485"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75182485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 12:14:16 -0800
X-CSE-ConnectionGUID: e0Vm/R6tSfy0CIZ/jg3viw==
X-CSE-MsgGUID: A9Agd4LLRee+BkPAKb6zlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="218322722"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 12:14:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 12:14:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 12:14:16 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 12:14:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkBudtTeKTVpHLk0SMSarQG0aMnrQqnRuDh9VTo/G8pxZo3YCWTfqHVB+iIbh1KQySXGqhKB0KIQ9jVV/rLtDNb/1uFmkzscPIWwaI2ksfBcgvYbUvUToGx281Yyv6w7OfqAzNL/TRoXUE0ngdsk48AXU2R8iRn4OEWgVGZX0b6rduuYJkbPBtvPHHpVd5BwFA9anD4k/66X9mFa6Ik609/9SGsGDdbzyeFij7DG2XKzDVnDJu17XkGxKRF6e31m4JS+sgJwq/d8tAD09q4ZE4OZehTnLVf2X5LnagiKI7xUv7BLFyqU7RZV5qEt4zsXWXCnZNXDaTXQUAHRYchN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8SH1+xUM1oLcrn0ngwFberKI4ox3mWJ9Yq1lKuckJI=;
 b=uYfdnxR3xhtyvcfXVzzuepunI+LXvtr1TMhl/YyLOK7WZ+Sup6iZar9sisuwWVmqTn6NKvmzvgOGwIEMOgqjUJ+175bLhocxxbgxuF1oOny19mmDq6igjytmobPZeFYlduoLaD8LaAA+zkuTl7zN6RFGCCfSoWFRQ7hsQXkGYRl/w3r96YXrIgHM+aPP8e7qC7S9HtVeS6Zo8MsGum6JxDBWi7MtjtRNytVcLIivdedMLcnYSMXDECQ8HF2oYl1C5biRdSfJFs/nLJOrn13D4otBhpeWOYMURWPc+Hq8yrmsrFat1MSOHvpV8Eg9nYEh6Jy2prZ7HYE4B0Iyp3JmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Wed, 5 Nov
 2025 20:14:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 20:14:08 +0000
Date: Wed, 5 Nov 2025 14:14:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Register CT fini action before mutex init
Message-ID: <lxbcsceplihkhaizpv2p5txgzyy5syres7ocndkeck7hm3vlpo@d6joklfteuaq>
References: <20251104221613.795865-2-shuicheng.lin@intel.com>
 <aQp+UTmOHkP0OB4l@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQp+UTmOHkP0OB4l@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR06CA0062.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: fab6c514-fc04-43de-67ce-08de1ca7e054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3hKcitiQjg4OGtSUTlST1ExMldEWkJwTjBZd0UxSmdkUUZraGVUNUhCcUk2?=
 =?utf-8?B?STFWWkdVNHdnQ29NMUxlT0wwbHpjcm8wVG5zZzNlWXZGYXZGTEl2WXdQUlpD?=
 =?utf-8?B?eVJqYjArMGxTdE93VGcxT3VvcGg3OUlPS0FJb2ZiVVM3ZTZRMTRFOWVXK3FW?=
 =?utf-8?B?NHh6UjFZMjAzNWVTQ216QWJqRDBOYmJsNnhuMTRkQ2xrVklDMU0vaFIwcERI?=
 =?utf-8?B?dG42VXpFMDd0TTNXeVBMQVMxQW5qejQ1cWZ6aGIzNWFWODU4bHJmQ1J5dGF4?=
 =?utf-8?B?QkVmTGhrVkFvSnp2YUcxbnBKL1dVN1B4ZVh4ZEhDdmhWbVBBVDZYazUzQm40?=
 =?utf-8?B?RVVaWGVKcER1WFRma0ZnUVFRQ2R6SXZkZEZQRjQvQ0lpSlNjNitWam9VK2xW?=
 =?utf-8?B?YmtRT09jYzJtYW5oV3cyUGI5YkRqRUNjUHA4Tjg1L0JDWGEwYklwMmRvZWFX?=
 =?utf-8?B?Y2xxeVVwT1JHaDFWTVd2ZW9MMWpJaWNmNVBlWFd2YzBiaU1lVVM1TGc3SW1w?=
 =?utf-8?B?bWdnRnBBRlRtbTJZMmZJUElkbGc4aTZ1QnlMVlYxdmxxWG92WGtzOHJuaGto?=
 =?utf-8?B?SzlWbkZDa0dnbzl3RFQ0UmdzemtveEhVS2l3QkpSU3R6dHgvWHBuYzZnQXM2?=
 =?utf-8?B?MUFEM0xSRUhKY2d4YXhSanJYZ2dKYjZ5aU9BSVdsVHoyMzFkdlhBZ2tCczdX?=
 =?utf-8?B?bWNsaUtMVDBRQlliVFRLNkVjeEhNbG5IelQ5SWhaS2ozYndhUDRFZytWbHRZ?=
 =?utf-8?B?WVF4ell4ZllzTXlKRmpPUzFuUUREZDYrQWx5TzEzbXRiUHAzcWVGcWZ0Zndz?=
 =?utf-8?B?MzEwYTJiTGQvNjAvR2lNL3AveE5ObE8wS1N5YktwbnRCU3ZtQStMNWZhM29w?=
 =?utf-8?B?N3VSQ0RsSTVSY2crc09WZ2c1Yi9HMVVKYy9ndExtNXd2cURaTGg0cTk1bDRW?=
 =?utf-8?B?ekx2V0g1RExna29adEVFSDFMZjMvUWsyd3djZmdwdUVTVzI3NUhSc3FhOTE4?=
 =?utf-8?B?NTRxRTVraldMVVZkMXNkOEtPSHRjTFdlUjVpRjYvQXNEVElSL01GNWNPZys3?=
 =?utf-8?B?L3ZHS0t0UWlsem1xVTErMWlTL2ppcWVCU2ZSZnpGMkNhdkR6Vk5PNXFmek5u?=
 =?utf-8?B?eG9LNHdLMzEwVnBkdGtyQU45MEppOUR4MVZ4RnpUOVROR2U1YUIyTWxadnBt?=
 =?utf-8?B?elZ6cUpkR2x6V2Qrc0tFV2dLZC9zckxDVVNYeVpSRkxxdVhka0xkcjJka2k0?=
 =?utf-8?B?eWUzWU5SWHJCc1lOcnluNHg5TlZSTEVoRWdsSXBHUEJHWlN0RDFtMXpRVzE3?=
 =?utf-8?B?Zk4xWmZ1YTFXUlpkNzJyc0cwM0FEa1ZIclEyOCtaWU8zSWVXS2lnMFRaOU1P?=
 =?utf-8?B?N2V6cFFqdHppWDVjT0RhRDZ3dmNqeWI4TFRRbTRPQkl1aWswTTlPcXVPS2Nk?=
 =?utf-8?B?YjJWSFVWRVF6QlFhYWVscy9iMCttZm1scVpVR3BLYm9TdGx2VHp6Qm5CcUFC?=
 =?utf-8?B?ZmRYZE12cHVKRHRzWWFlRWw3cmI2MjRTNGhVcmlOcTRENmIxSklIdG0yUkVS?=
 =?utf-8?B?amFwTVBNengxQVZ4UTZzTzRFOW9sYk9GcS91eU5sZlNGQnFRbEp4R3hsR3ZL?=
 =?utf-8?B?M1pKMW5ZcWh0T3kwZnhER3IzV2syTWNTeHFhdGxxNkQ1YmFxQThkbVo1bEVO?=
 =?utf-8?B?WEJVbjdVcHk5bFBCcnlMMEcxdlJmUWdXWVowU0RwZFphSmpncDc5ZUlhdmxn?=
 =?utf-8?B?QzhnWVVoWE5rOHRwRjJpQ3RTVkdGS3c3UHFnZ05nVTUrUXNMTk0vbFB1QW1T?=
 =?utf-8?B?ZHVCYWNGMXhBazMwdzVDZThBTGFVcjVIb1pKWkpCcTFWbitnTGR6dDdmWUZz?=
 =?utf-8?B?NjFLeXI3WmI3RW5CYlhWTDBhY1I0blQzZHVacjQramRLWE9NY0g4VnBHT0FQ?=
 =?utf-8?Q?HBzoH2VfNpwPJ/MAtmEYaIMRLxplZHQ/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkk2WHVrcVpNTGR1TCt6MFp5WEhKeGsyWWRhd09VYmZwbVFQcWN1b3R2WDRO?=
 =?utf-8?B?YlVXcmdseXBETG5yQnJTQVJjT0ZWTUFlZHRXcE50aFNiNzJUNjh4SWJrQlV0?=
 =?utf-8?B?MGhKSElXZDNPWVZ2ZmF4WDFNUGcvNU5KRkQ4MmpYWkM2UjY3TjhwbWxUOVlZ?=
 =?utf-8?B?N2tsdGhJejRwQlVkSmFjMUJSeGRTcTlvN2VINnpzMDh4cXFpM01xQ0hhZDJO?=
 =?utf-8?B?Qzdod3hTek9tNHg3dVcramdPdGRFaXNOY3hxR2NvWTg3bG5YWXAwWFFKR0VI?=
 =?utf-8?B?dXhYZkFHN2VqbnFBcmtVNFNTZnRqUGJwWkF1RFhPbXp0VTAxNWMweGo5cWFS?=
 =?utf-8?B?bVZQV1dvREs3NDRoQm1aS1N5ZWhYZTZrNlFhcWpFdzBwZ0ZiM05MeEYyK3Ry?=
 =?utf-8?B?Z0tOTmNXMThVMENxMnNXcmtDcUpzN1ZuZmFtbEpCa0p6RCt4d0FRbDlvb0ts?=
 =?utf-8?B?WUFDbDNxUVlKdzFYVWpOWnlEbFU4WUNPTUNZaHY4S2hMTTgrQ2NxUUlWeExP?=
 =?utf-8?B?RFlLcUZmaTRmZmhicGZwRWx5QkZ4UW1RZUFmM1haZVhRbjRCQXFQbFhIaVVZ?=
 =?utf-8?B?aUUya2VPbm4yVWFVUERyNG5XSFNVck04Y0lDZWxPNzN3Vkt3VUdMRkVkdkxB?=
 =?utf-8?B?cEY0ZjFFOWNrdGdoQ3MyWUk1U3RBTGhTbnlFR1lJcVpQeFpjS3Y2aENVVGtx?=
 =?utf-8?B?cy84a1praldURndVc0FUbEhuSGFTL3g0dUFsc0FHMmdtMmoxaXFoSm94NTVT?=
 =?utf-8?B?ZngyaWFvUFBGdGJCQ1BIcXlRQmZSL2lWL2FMNzRPdUx5cVR0M2JJeDZlWVZK?=
 =?utf-8?B?TWtsTEtQRW5JVnpFZ2NVbXZTeE9iOXE1b21UN3pxK1NYa0JyRHVUZklkTjFz?=
 =?utf-8?B?ZExsZGJxdVpMMzBGRnFvektvZWhLRG1DZUxLaUZ2dkxIOW9oSmh4dWNmU0hI?=
 =?utf-8?B?N1ZXSHNOcVE3bzRjaTlKdXV0K3JPMGtVdkxVcTFGU0d0NFo3SHptcmtWVVoy?=
 =?utf-8?B?ZWQ5U2JMNWhHM3NQdEFtRWk5dTlKSGorNFBDUWlPUnpzTThyRVJobnFzNklt?=
 =?utf-8?B?b3ljQXpTR2d4b2daSXl4d3FQbWNuWnVWNzUwOERCaEpYUUFFNXBUZU1jekFn?=
 =?utf-8?B?SkZLZmxMNVJsZWh6WnprbjNOTFg5V29aTHkvYkhWVCt0ZHZHZzFuNUtjUVFy?=
 =?utf-8?B?TzEzVkZhUWVUS1R5NDRYd3UxQkNiZnUrTkwzbEhWMm9JWmc5cVZ5MWRNSWpN?=
 =?utf-8?B?ZEZXQXBhTy9jSzN6TUZISVFvakl3UEdTbUxZUE9Fb1E5Y0pEeVcvSGEwQXNQ?=
 =?utf-8?B?WDFqaTZ1bVZEL0Zyd3hMaDhKUlpRdDM3dE0zZVhiRzhWWWtzRzdGaUMwNzZt?=
 =?utf-8?B?N0ZJZnd4eHUrVXl1OHp4WUd3aEx0N2pJNjZOUUZLRzZka0RWRkREVEFIN3F5?=
 =?utf-8?B?a0k2cnR5ZXpWVUU0aTVWRVRZbFBocE9SS2t6cGVvVWFOQ1kyQ2EyWVMyMHZH?=
 =?utf-8?B?QWxSalN4QTNqQkVjdno4dlU1czIxWnZrbTA2bkdQZ0JvWWtSTU1yekl1LzVL?=
 =?utf-8?B?VnpWYmRpaThuTHFCL2Z0c1daaEVGQ3plRTVrV1ZuRjErZS8zdTVSTHozZVNT?=
 =?utf-8?B?K1ByYjdIaEl5Zjc3Uk9jbEpsSVJKYVpBYy9RNDdvcmR3SWk1VGRxZEU0WTdR?=
 =?utf-8?B?eGVCTGdOQm0yKzVYN2xjTTNzV3lWSE15elYvcTVSWWRqdzVPR1lPa085Mldj?=
 =?utf-8?B?bTIrd283UmhldUNxd1hWVElPOXBrWHhKNkhjZEJHeVd3M3dtTHFBN2lCMUVD?=
 =?utf-8?B?K2xHdTV2bzA1RmJoMjQ4TGR1QTVnZm9HNS9sN24zeGxZWHFXSUQ3UEJma3BT?=
 =?utf-8?B?R0g4YWFhTng3TGt1aXl2UHZGSGdYelhjUUNjMFE1d1RxcmFsZUxLZFhIN3U5?=
 =?utf-8?B?aG0rTmFQcGZTRVc5b2s0cUQrbHYyck1yZk9SajRsRFNXVnh4OGE0Vk13aVM4?=
 =?utf-8?B?YkJyeEZPRkVQZHZGYW5hZWVocVRkakpjZFgrTklSd0M0SHV0RjFSOW80ZlVL?=
 =?utf-8?B?WThwcUZwQWZqMklEN0tlbkpmZXlxdTRCUGZITDJSbkQwY0NBWHErbTFZU3Nz?=
 =?utf-8?B?QkM5U2JSVFVTY24vSzJtOGhnTlE2MWFhWFduazhtNjZRSjZaa0Z1KzRheklq?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fab6c514-fc04-43de-67ce-08de1ca7e054
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 20:14:08.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC7wvtQql6dnMcT3p9V1jTkMHESiiyRFSWDLyJhcQxsOpPbELL204EQ8XlcY2gqLOb95esM0QIMjgUPM2q6MNjGj1Ximf1eBbrwMDNQLYbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
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

On Tue, Nov 04, 2025 at 02:29:37PM -0800, Matthew Brost wrote:
>On Tue, Nov 04, 2025 at 10:16:14PM +0000, Shuicheng Lin wrote:
>> xe_guc_ct_init_noalloc() allocates the CT workqueue and other helpers
>> before it tries to initialize ct->lock. If drmm_mutex_init() fails
>> we currently bail out without releasing those resources because the
>> guc_ct_fini() hasn’t been registered yet. Move the drmm_add_action_or_reset()
>> call ahead of the mutex setup so that the devres unwinder tears everything
>> down on the error path. This is safe because guc_ct_fini() never
>> touches ct->lock.
>
>destroy_workqueue in guc_ct_fini can flush the workqueue which does take
>ct lock. So I think the correct flow here is at the top of
>xe_guc_ct_init_noalloc do the drmm_mutex_init, then initialize all CT
>state, then register guc_ct_fini.

agreed. The mutex init is a sw only thing that can be done as soon as
the ct is allocated. It's usually the kind of thing we would add in our
init *early* variants.

moving drmm_mutex_init() and primelockdep() to the beginning of this
function should be fine.

Lucas De Marchi

>
>Matt
>
>>
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 671d69958ce7..2680e9096c15 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -240,16 +240,16 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>>  	init_waitqueue_head(&ct->wq);
>>  	init_waitqueue_head(&ct->g2h_fence_wq);
>>
>> -	err = drmm_mutex_init(&xe->drm, &ct->lock);
>> +	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>>  	if (err)
>>  		return err;
>>
>> -	primelockdep(ct);
>> -
>> -	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>> +	err = drmm_mutex_init(&xe->drm, &ct->lock);
>>  	if (err)
>>  		return err;
>>
>> +	primelockdep(ct);
>> +
>>  	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>>  	ct->state = XE_GUC_CT_STATE_DISABLED;
>>  	return 0;
>> --
>> 2.49.0
>>
