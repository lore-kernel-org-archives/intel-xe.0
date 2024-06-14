Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2090C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 20:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D8E10E296;
	Fri, 14 Jun 2024 20:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fn+P0U5a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCB010E296
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718398533; x=1749934533;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d5lmOod8MPwfuAApqbUIdxxIb/XbJCayMiI6Ftf1Szo=;
 b=fn+P0U5aGP/nBjYO6IsdiOggDRc2emTGjTpIPvSTZqAs70RKegKsPzx4
 53Rpazw7dlOcSUVJ8IkGnQ24X4EanXiVmGRnWQMDjaHfUWw9ybd25FkEI
 Fq4aiLoZ1l0cC/zqUX9FdxSioL2Nr4kuxM9mDmLxOZGWIe6G5jA/J/1bt
 F3gxrVIutmZBqdT2ZKksibCVua0W60VmczfJAMI+lpSWmhG3UyxJ0EFGm
 6NaZKO7ammRhSy+H8OjP1ISce9wL4cs9HBitfh6QXsrfbPtLQXRX5c2D6
 036Vmx5yrmAr6aimhQirM4FfGGlvmMkEYfFn1NoqXQjpcTrSrBX+8mmiM w==;
X-CSE-ConnectionGUID: C5u0+lPcTZG4TaW4Ld/nSA==
X-CSE-MsgGUID: ysmHa64eTWekdNqIyyza5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15533341"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15533341"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 13:55:32 -0700
X-CSE-ConnectionGUID: 3A/Q1kODSEy+TmTKz3rPeA==
X-CSE-MsgGUID: yxZqfXQIRPWoI2O7ThhgeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40485591"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 13:55:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 13:55:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 13:55:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 13:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3H98urE/w+uPCr/zXgz3M5G3peZnl70bh6h3xClagTY06R2OwsXg9dDLb63EDrpRipUaZ6obZOpF6CHKJ4xz4RhrI68Qpd+mE5L0XdaUmHhoIEPpn8xIcfQKRdoktfTY1T0i/SapccH6vcrJrUtahQJDYjRrQ9nUVwqhH2nCVziO6t2kt2edDKWv8KCuyewP+H7fj273RiBjeAuGi8HawK3ajUE/iQU6M39clJpQMlKMXuPBw0BbnZHofhzkBhxBPQUb54KqXmGU0KYgKu1kFjEQgF8Uc83zPKY6rddGA3iO8GM3MO0JEEam1feMdyfKPYrVAZcBNIBWxJwqNv45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NmZw4w8ZQ3h+HDr3GuNGZGAcVaNTpSpgmZuuYtt0rU=;
 b=WdjERAOzrFNuPNxOV4hFBuequP5+iebAUE+NP9aB5wmxiYtuZ5eP82N1B9QQd1qA3gekAKdOxYuGczMMZB4SGhdYqvVFzBGLZomRs5kNCOqc87Ni0/9K5/IyJxTdNaXKEdUABpIr8Wc/9bXkE8/jw5iDfo53WV10Pm1EPim7bHM0Ter6YOXAHyTRc4/8orTLmIrF9fhSnATZxTgrY8OQnzapebOAuJqnXP+7SKvUtENirhrtf4ed+QEIPXRy7XbEvnnz0aTyEgD0BWv8rYNwrY2wpbxXbEr/Eo9+zK1b42tQxbSK0VcOmwUFV3fy0v5PLOGxKRe2+dECLchP0r/x9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 20:55:30 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 20:55:30 +0000
Message-ID: <5f132c3e-2773-4018-ab00-46c0eac19156@intel.com>
Date: Sat, 15 Jun 2024 02:24:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] drm/xe/pmu: Enable PMU interface
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <krishnaiah.bommu@intel.com>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <20240613100411.1579218-3-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240613100411.1579218-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4608:EE_
X-MS-Office365-Filtering-Correlation-Id: f129d483-2d50-416a-5eba-08dc8cb4530e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFd0OGt2bktCa2ZySXpGK3E5TU1iS2hrZkkrK01XUjhpY3R3SnZ4TXhPUXdR?=
 =?utf-8?B?TzdJSlBicjBqeVd6bnNWR01naGpJNXRoVUh0MkVjZHZwNG5RaHVibWh5UTE3?=
 =?utf-8?B?eU9JM0JnU2x1WEExM3dWZWdwamduTWtBc05ON2RFS0syRkZxS2NRc2hzOGRu?=
 =?utf-8?B?bldHZ2lyYUhiRlptaGRGS3ZsT3plSGsySTB4NCtnR09BQ05CeERQd3IwNVpH?=
 =?utf-8?B?UkdYNzRFSmRvMUN4R283ZVc3NlFmVXpIa2RjR3l3bGo2SGJ1R3RPWEFTU1My?=
 =?utf-8?B?bTZJVGVWa2hmcm9ENC9lZ2RUc2NseEdFb2RwS2piNFVqcmgrelR5SGRvYmt3?=
 =?utf-8?B?OU9EQTgvRlRFVGdERy84SWRYUi9CdFNZVjhsNWFZTmJXMXh2WVpVZGgrSUFn?=
 =?utf-8?B?S3JFeDF0WjBjaTIzSUF2SU1xQ0RHMG1QZ09tSDZGbGVnSEMrMEZNWkJmY2tx?=
 =?utf-8?B?cC8rdmxnbFl5ajFxVC9WRlFEQ1I1V1JoRlV2NDB1dzRKRkVaZnYrc0o4Tmlk?=
 =?utf-8?B?anhGZytBbFpQYTFSdENBL0VZMUZZU2hmUEo3VFNCSW8vQUl4c3RnTnNQQjdo?=
 =?utf-8?B?ZjR5RkpDNkQxaTF6a2UveSsxaWlwb3p4cEZrdjBUeTNiZUdzVytBSFRZR2la?=
 =?utf-8?B?RXJpMGxlZXpFd1hxUEpseDc2RnlWTERiU3dsRFdKcmxGRVNwN2J3T3BoUUd1?=
 =?utf-8?B?YmFXbTJJNDFjbDVIYXFVb016TDFodGlKMGhKMEFyNEFrWkczNTNvR3RnQjdv?=
 =?utf-8?B?T0NZSE5nWG5YUkJtOW1wdlV3Ymluc2E3ZVpFanRQcnF4WmtRM0dyOGEraE1a?=
 =?utf-8?B?TFNTRmVaRS9kWXdWdDJheHVuMU1HVVFLYnkvQU9lK1M0N3JMNS9lU2lXeFhy?=
 =?utf-8?B?SWQ1YS85a2lFOXlIMGVxVEtGRnRySkRUZjFqbU5ZeVk2d0ZkL01PVXZ4bCt1?=
 =?utf-8?B?YjUxMnJzMXgxT0dndzg2ZE9iTzBMckNXY0hlamtOZWlaZUo3RzhUbTczWXdu?=
 =?utf-8?B?QktJZEZmQkRxTW9ySHdwU3JHZHZkMm5XMytSdlpWRG44c1N5RW1JYkI5MmhG?=
 =?utf-8?B?S2tIcEVCWmJjT0tjQ3QzRllIUDFka0NVYlV5bTBySVhzRldnb0l6Y01VNGU3?=
 =?utf-8?B?QkJsbWJZaGhsREM3QWhZNjQwdHM5MmdHMm5xenFIV3luS0ZZeFFyaWZIVExs?=
 =?utf-8?B?UlpnTzdnTDBrOXIwWDlLRTdWQ2hXV0JSY2VsYms1bFQ5dlhnSkZUcEV0Witv?=
 =?utf-8?B?am1QN3FKd1ZSK3Z0NFU3bXl0Z1FmUTNPV1VBNnluaTB5dFVvWlpqaDVHdW96?=
 =?utf-8?B?YmNpNEFBTjI2KzNuRVJTSlkwY0ExeHUxNUxSWVoxQlNHQTRYVmd3NWFJV0kv?=
 =?utf-8?B?bDdkSDdIWm1NQ2pGZmw2ODRTYTAxZ3ZUaUxWZmcxNmV3V3hReE5BTDFnbnY1?=
 =?utf-8?B?SmhtSExGb0JRSHdLZERMcUkyUEEwNHVUcktnL096SUErWUNHOWZUamhRRytH?=
 =?utf-8?B?MDBJNERxVWUxSDlzQ1daRzVNSUlONHR6TGYrd1lUaGgzMCsvdnN0V2ZQTFZ4?=
 =?utf-8?B?Vm5xNlZIQzVqY0Vtd3UwREd3OXVuQ05QQTZ4aUtDVDlYWjByNDdzTEx0MjRw?=
 =?utf-8?B?STdTYlI0UHF3MktGaXlRNklCdGdsZW90N1RXY2NxbmVqUk41VzluZVNwN2JU?=
 =?utf-8?B?QWI5MUxNOVppWERlRm1qczFRdy9pVnUxaEtLcGZhZFo1cGo5NEFaM3E3dGF4?=
 =?utf-8?Q?PVUDPvAf7zQFuAIvyDjmhp4veEf4IE9DQbXMQOt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFBieldLZkdVRU9xeS9mYUFwa2JaRlRXM3NoMnZNdnhhMEdvUjRLcjgyUy9n?=
 =?utf-8?B?ZS83SmdOTXBsTVVkTW41Rit4OXI3SStwZ3pPRzRVUG9EUTZsZnQvTUpMU3Fs?=
 =?utf-8?B?Wk5BUzVrU3NuZHVPbHNaMnFsRVpaYXh4d2FFTmhxN3RhL2N3KzlQemJxUXlL?=
 =?utf-8?B?WUhwQmJ6NXptSzZ1Z1h5VnQ1YnYyNm9jSUVUMyt0VDRVK1FwYkNjS3pmSEFm?=
 =?utf-8?B?eGNwUHJmWktlRW5sa0ZoNDBzbGlyUDdTeFlyZmFnK3hYTmN3dXppUU45Q2hH?=
 =?utf-8?B?c1dTMkZ0ckFzaFRUa2cwMlhRMjVIMjVDRXR4OEtxT3loZE12WVZFSWo1bGEz?=
 =?utf-8?B?eDNMcXpoN0RmSEZTSUQwakpmZ3djeWlaM3NaWFVrZmhCaUpkSVNveDdLUzFX?=
 =?utf-8?B?N0dlbXh0VmZmT0NKbXIraDlKVVdvbGdsR2NLd0pMRGl6cFNVOUpkWHo5Z1lQ?=
 =?utf-8?B?OHF6Q24vUVVHRStQejdCUXNwcXFTUmV3TEpLMG5EQUhZbWhyY3M0SThJT0VM?=
 =?utf-8?B?MmZqY0E2eGtXbzBkRitBQnBldytYaFFvZUx4dmNoV05mSUFMeC8rNVk4b1Jr?=
 =?utf-8?B?QWNENmg5UkxvYlcwNUV3ZjJnQmZkaUdDczZ3bk5LOXpGK0gyT0kyV2RBdjNT?=
 =?utf-8?B?V2dFcEdRUWhPV3ZTVWxEdXJUdWtZMG91am5xQm85QzRiblBkYUg1S08wMUdZ?=
 =?utf-8?B?UWFTdk8xTXhZdERvUkdzbEx4Ni9HQmVkTnRFeFdOandVVU5JcmhYLzZGOUI4?=
 =?utf-8?B?WjkwZ0xqa0U5SWhPRDZYWU0xVHNBWStrV0NIWEZYRHpTaW1mTDNkS2V2ZDEr?=
 =?utf-8?B?TXZHVUZJNy9QcE1QdjE2eThGcE5Qa3BwZ2E2NXJsVjRkd21CdzgzQUw1TmtW?=
 =?utf-8?B?RThyeVVlNE9RQnNzMjJMb0l4bCtxVlVmRXFzc3Q0bWV3OE1iOHI4VUNqdHVk?=
 =?utf-8?B?RzRidVZnQWVsQ0JZa1NJei9ha0dTanpqczN5NUJibnFWaFZIQkZuUnJYbit4?=
 =?utf-8?B?NXlIZm56SW0waE1hN3ltaU1FRitGUjUyR1QwU1dYaU1UMWhOVkdmV3J2WEVR?=
 =?utf-8?B?RU5PMmtUSG42OUlteW4yZ2d1V0Q0SFdnRE4xMUFZaTFPdXlLZHV5eUtHN2JS?=
 =?utf-8?B?TDZvZG8vOS9DMWVJRDJTdS9COFd0eFF4L0p1STZrTVZrUjBNQTBWVUczVitM?=
 =?utf-8?B?STVTTTJsRmlpK2VlcFNqQWt2a2ZrRGRKN2pRMndaZUxsVUFrK250akNBV2g3?=
 =?utf-8?B?NDlpVEkzcEVWRWNuNFNiNmpSL3VMQzF6WWpya2NXcSsxZUEwT2xZeFJYREt2?=
 =?utf-8?B?RVhtM1VOK0FPMFJJSFp5cnRYME1IOGhhOWpDSzZITWUvaHhIT0xYNE96RERH?=
 =?utf-8?B?VGN2YWFmNnEyU1ptMmdOaU9oL2l1TVQ4OWUxanJuUFI3T3o5UEs2amhhR0pB?=
 =?utf-8?B?ME1FMTVtZm80clVmSTR4R1ZxNlAvUTZqbjByS3hiUFhKRFZhM2ZqcEhvM0Zw?=
 =?utf-8?B?ZURubWYxeE02Q1Y4SU04cDVpUElELzU0d1JpcTYxR3lVdytENlhtREY4QU1H?=
 =?utf-8?B?a2dCeHRQQ2xjWXRhSXd2QlAzQW8yR3B1UXhFMGpraVg4R1VpSzM0MDNza08w?=
 =?utf-8?B?ekt0ODAwcFgreUF6TkUzT25ZKzc3UWFFTFhSRjQzanFaL0V6SFkxR2oyT1dO?=
 =?utf-8?B?THFlbCtod1IzOE5ISUFhZ0VSdWYrRktLdVlQZ205eG1GVUJUOFhYU2c2YnVK?=
 =?utf-8?B?WHliUnZlZFFzK09UcHRUZlBoTUw1eXUxQmllb21sOVVUR2QyRXhWZEg2L3Ax?=
 =?utf-8?B?OUtvWjh1NUNyNk5zRCs3bFpUdk9WSVlFRVpweSt0NG9uV1kvZUJZbkRaYjFM?=
 =?utf-8?B?ZDFWcHQ0cW1jdmZ4N21BYlRuU3E5djREUTEzc2NhUVVxMVFjcE5QMDVhNjNa?=
 =?utf-8?B?c1NCVVFyZXgveHdvTFZPK1dRclFjcy96LzMxaEJBckErbmZhdEF0RWpKdi95?=
 =?utf-8?B?WTBrR2JKTnNSNHFnWkxwQVg5MnYyRk53SzRQWTFieTg2dTFKazVvR3pFbVIr?=
 =?utf-8?B?citXdmdET1hYZ29va0NZdzltdkg1N3gwWjBuL01lQW9TRmNmOUpHME9aaTBv?=
 =?utf-8?B?UENSU0pDQVVpTEpJU1FhL1hZcFRDZDREekFGRVpDNkNabmk1ZG1EVnUra0Jn?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f129d483-2d50-416a-5eba-08dc8cb4530e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 20:55:29.8836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyD/uoJhXbu8s/c5YSKCXqFx04nXM1PQamMwsGVqVfD6AVYGgxXCm69CxIOboIuJMpLCS8pRibxVmNkJwCgV61eA3vrtl9UJw9Wm3jxZrwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
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



On 13-06-2024 15:34, Riana Tauro wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> There are a set of engine group busyness counters provided by HW which are
> perfect fit to be exposed via PMU perf events.
> 
> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
> 
> events can be listed using:
> perf list
>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
> 
> and can be read using:
> 
> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>             time        counts unit events
>       1.001139062            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       2.003294678            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       3.005199582            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       4.007076497            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       5.008553068            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       6.010531563        43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       7.012468029        44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       8.013463515            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       9.015300183            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      10.017233010            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      10.971934120            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
> 
> The pmu base implementation is taken from i915.
> 
> v2:
> Store last known value when device is awake return that while the GT is
> suspended and then update the driver copy when read during awake.
> 
> v3:
> 1. drop init_samples, as storing counters before going to suspend should
> be sufficient.
> 2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
> dropped helpers to store and read samples.
> 3. use xe_device_mem_access_get_if_ongoing to check if device is active
> before reading the OA registers.
> 4. dropped format attr as no longer needed
> 5. introduce xe_pmu_suspend to call engine_group_busyness_store
> 6. few other nits.
> 
> v4: minor nits.
> 
> v5: take forcewake when accessing the OAG registers
> 
> v6:
> 1. drop engine_busyness_sample_type
> 2. update UAPI documentation
> 
> v7:
> 1. update UAPI documentation
> 2. drop MEDIA_GT specific change for media busyness counter.
> 
> v8:
> 1. rebase
> 2. replace mem_access_if_ongoing with xe_pm_runtime_get_if_active
> 3. remove interrupts pmu event
> 
> v9: replace drmm_add_action_or_reset with devm (Matthew Auld)
> 
> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |   2 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>   drivers/gpu/drm/xe/xe_device.c       |   2 +
>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>   drivers/gpu/drm/xe/xe_gt.c           |   2 +
>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>   drivers/gpu/drm/xe/xe_pmu.c          | 631 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>   drivers/gpu/drm/xe/xe_pmu_types.h    |  67 +++
>   include/uapi/drm/xe_drm.h            |  39 ++
>   10 files changed, 783 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cbf961b90237..83bf1e07669b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -278,6 +278,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/skl_universal_plane.o \
>   	i915-display/skl_watermark.o
>   
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>   ifeq ($(CONFIG_ACPI),y)
>   	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   		i915-display/intel_acpi.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 47c26c37608d..22821dcd4e1b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -390,6 +390,11 @@
>   #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>   #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>   
> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE		XE_REG(0xdb80)
> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE		XE_REG(0xdba0)
> +#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
> +#define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
> +
>   #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>   #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 64691a56d59c..bb00c8c9ec9b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -668,6 +668,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_hwmon_register(xe);
>   
> +	xe_pmu_register(&xe->pmu);
> +
>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>   
>   err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 52bc461171d5..a5dba7325cf1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>   #include "xe_lmtt_types.h"
>   #include "xe_memirq_types.h"
>   #include "xe_platform_types.h"
> +#include "xe_pmu.h"
>   #include "xe_pt_types.h"
>   #include "xe_sriov_types.h"
>   #include "xe_step_types.h"
> @@ -473,6 +474,9 @@ struct xe_device {
>   		int mode;
>   	} wedged;
>   
> +	/** @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 57d84751e160..477d0ae5f230 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -782,6 +782,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>   	if (err)
>   		goto err_msg;
>   
> +	xe_pmu_suspend(gt);
> +
>   	err = xe_uc_suspend(&gt->uc);
>   	if (err)
>   		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 3edeb30d5ccb..26f814f97fc2 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -11,6 +11,7 @@
>   #include "xe_drv.h"
>   #include "xe_hw_fence.h"
>   #include "xe_pci.h"
> +#include "xe_pmu.h"
>   #include "xe_sched_job.h"
>   
>   struct xe_modparam xe_modparam = {
> @@ -74,6 +75,10 @@ static const struct init_funcs init_funcs[] = {
>   		.init = xe_sched_job_module_init,
>   		.exit = xe_sched_job_module_exit,
>   	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>   	{
>   		.init = xe_register_pci_driver,
>   		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..64960a358af2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,631 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +#include "xe_macros.h"
> +#include "xe_pm.h"
> +
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
> +{
> +	u64 val;
> +
> +	switch (sample_type) {
> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
> +		break;
> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
> +		break;
> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
> +		break;
> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
> +		break;
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return xe_gt_clock_cycles_to_ns(gt, val * 16);
> +}
> +
> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
> +{
> +	int sample_type = config_counter(config);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_device *xe = gt->tile->xe;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	unsigned long flags;
> +	bool device_awake;
> +	u64 val;
> +
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (device_awake) {
> +		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +		val = __engine_group_busyness_read(gt, sample_type);
> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (device_awake)
> +		pmu->sample[gt_id][sample_type] = val;
> +	else
> +		val = pmu->sample[gt_id][sample_type];
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
> +static void engine_group_busyness_store(struct xe_gt *gt)
> +{
> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
> +	unsigned int gt_id = gt->info.id;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
> +		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +
> +	if (gt_id >= XE_PMU_MAX_GT)
> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +		if (gt->info.type == XE_GT_TYPE_MEDIA)
> +			return -ENOENT;
> +		break;
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
> +			return -ENOENT;
> +		break;
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	ret = config_status(xe, event->attr.config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const unsigned int gt_id = config_gt_id(event->attr.config);
> +	const u64 config = event->attr.config;
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	u64 val;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		val = engine_group_busyness_read(gt, config);
> +		break;
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (pmu->closed) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +again:
> +	prev = local64_read(&hwc->prev_count);
> +	new = __xe_pmu_event_read(event);
> +
> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
> +		goto again;
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	if (flags & PERF_EF_UPDATE)
> +		xe_pmu_event_read(event);
> +
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +	} events[] = {
> +		__event(0, "render-group-busy", "ns"),
> +		__event(1, "copy-group-busy", "ns"),
> +		__event(2, "media-group-busy", "ns"),
> +		__event(3, "any-engine-group-busy", "ns"),
> +	};
> +
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	unsigned int count = 0;
> +	unsigned int i, j;
> +	struct xe_gt *gt;
> +
> +	/* Count how many counters we will be exposing. */
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +
> +			if (!config_status(xe, config))
> +				count++;
> +		}
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_alloc;
> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_alloc;
> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_alloc;
> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +			char *str;
> +
> +			if (config_status(xe, config))
> +				continue;
> +
> +			str = kasprintf(GFP_KERNEL, "%s-gt%u",
> +					events[i].name, j);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &xe_iter->attr.attr;
> +			xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +			if (events[i].unit) {
> +				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
> +						events[i].name, j);
> +				if (!str)
> +					goto err;
> +
> +				*attr_iter++ = &pmu_iter->attr.attr;
> +				pmu_iter = add_pmu_attr(pmu_iter, str,
> +							events[i].unit);
> +			}
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +err_alloc:
> +	kfree(attr);
> +	kfree(xe_attr);
> +	kfree(pmu_attr);
> +
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (pmu->closed)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
> +
> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_slot = ret;
> +
> +	return 0;
> +}
> +
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_slot != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_slot);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_slot == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +void xe_pmu_suspend(struct xe_gt *gt)
> +{
> +	engine_group_busyness_store(gt);
> +}
> +
> +static void xe_pmu_unregister(void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	/*
> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
> +	 * ensures all currently executing ones will have exited before we
> +	 * proceed with unregistration.
> +	 */
> +	pmu->closed = true;
> +	synchronize_rcu();
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	pmu->base.event_init = NULL;
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +
> +	int ret = -ENOMEM;
> +
> +	spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (pmu->name)
> +		/* tools/perf reserves colons as special. */
> +		strreplace((char *)pmu->name, ':', '_');
> +
> +	if (!pmu->name)
> +		goto err;
> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;
> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
> +	if (ret)
> +		goto err_cpuhp;
> +
> +	return;
> +
> +err_cpuhp:
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	pmu->base.event_init = NULL;
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);

Needs fix. double free incase of devm_add_action_or_reset failure.

> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..8afa256f9dac
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_pmu_types.h"
> +
> +struct xe_gt;
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void xe_pmu_suspend(struct xe_gt *gt);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..e86e8d7e0356
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +#include <uapi/drm/xe_drm.h>
> +
> +enum {
> +	__XE_SAMPLE_RENDER_GROUP_BUSY,
> +	__XE_SAMPLE_COPY_GROUP_BUSY,
> +	__XE_SAMPLE_MEDIA_GROUP_BUSY,
> +	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +#define XE_PMU_MAX_GT 2
> +
> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;
> +	/**
> +	 * @closed: xe is unregistering.
> +	 */
> +	bool closed;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 */
> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding device attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d7b0903c22b2..07ca545354f7 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1370,6 +1370,45 @@ struct drm_xe_wait_user_fence {
>   	__u64 reserved[2];
>   };
>   
> +/**
> + * DOC: XE PMU event config IDs
> + *
> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
> + * particular event.
> + *
> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
> + *
> + * .. code-block:: C
> + *
> + *	struct perf_event_attr attr;
> + *	long long count;
> + *	int cpu = 0;
> + *	int fd;
> + *
> + *	memset(&attr, 0, sizeof(struct perf_event_attr));
> + *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
> + *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
> + *	attr.use_clockid = 1;
> + *	attr.clockid = CLOCK_MONOTONIC;
> + *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
> + *
> + *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
> + */
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (56)
> +
> +#define ___XE_PMU_OTHER(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 0)
> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 3)
> +
>   #if defined(__cplusplus)
>   }
>   #endif
