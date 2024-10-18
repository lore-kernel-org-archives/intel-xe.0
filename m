Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CBED30015
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 14:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B1910E94F;
	Fri, 18 Oct 2024 14:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWXLwN+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7470C10E945
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 14:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729262448; x=1760798448;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IUpopr0ECeDs3AwxiBz0sZN8dxS/8Ukj2B5+IyzVDI8=;
 b=eWXLwN+BLZ2l+NPT+qNrPGCH6nrdc3rF3UW9NE/uw02rSVbHqZR+Q1WB
 Y2whQRP1OwEhztdVIrad7Ayd719bMpkqQqBW5jzS0Fh9erlKCrMZrS18Z
 gjW+UAJcxi/MCzz5Y9SsPofqBth5uFKWCZQ4WUA6MpbDZaBZBxPCy3pci
 bPIrZda11QKBHu3Oo3DJItn+0ZS9KKif8uNZPrGNe31MMK5O7D7J1Jh8S
 Tw9mAl5Q94THXv/RG1GVYWIS2bOD7cPs63lM/myI349TLroL71VNjodHU
 tctKUj8xC+FV9mwlglNrP/X6ZCslz4JND9QwSbmnNbpxHA6bnt8impKcM A==;
X-CSE-ConnectionGUID: FK+l5pB6TAqo0z5tt2h1Ag==
X-CSE-MsgGUID: KbGuLyLBQy6fhQaHzrmPRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28901627"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28901627"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 07:40:47 -0700
X-CSE-ConnectionGUID: uH/qX0upQ4mSt7ScUjstgQ==
X-CSE-MsgGUID: 9bYm4LOaQLKFyHRmKVFmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="116345867"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 07:40:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 07:40:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 07:40:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 07:40:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 07:40:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 07:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5FEFzXpeaM0OF9TYJ1s2DSs6Gg74JTQIeCR44CX+eBHRg0wJilsxcGt19+272W//3NidcMKioWNN+ZsLhVPMIfr+sIA2LAuXza0w48I4tnAg03s3jyybWFfYHM0dgUGbwOJ2c+DhggvQol0OUuGzsX3okhZKO0CQZAGUTD2k02Wy95uxU0aezbnd0d+tr9gleI4MebHl/sTiftXCDcCeyP3BdffQXtByYAfC3T592EJ6QzKJrFqK3GB7b1uDjTrYvTmwY70eIc6OmPYAGhGpF9uzvUguFtOEOps9Htf/RRG51MZNcwUkNnwXKIBORrpUz8pUXCnuJVRaTcsJDORdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUpopr0ECeDs3AwxiBz0sZN8dxS/8Ukj2B5+IyzVDI8=;
 b=nhuhkHVHr0VbVFMZi3ht24dlV51kuTSJ/74d/vxiSWxnQY7YYAS9i1p2QWdUBUo+ObEnKMGq9rEfWSjxRUj+HvVIoM9Owugwxft4Vl9fod1cvDptmOTyntANz4yoGTUZdogOInge02exmM0baui+JewDjeCYQD+FJhFM3C1rWZgYNOJxOxcEr8bI4vAvvxQuBc9vJFEG8Nhz7RI649lBIXuUYZcIy+8lSur5WYX10eigf9sJjJ64QNU8/JTMI9gYUZLNmjrYMv4XZZIxkvn7YlJCiNptcb4KAjE9BXRxOa+7ZgCV98XSZxhkic22iAgKp5j1ORHCA18nngHUmBoyzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.24; Fri, 18 Oct 2024 14:40:43 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 14:40:43 +0000
Message-ID: <52c18f08-0d8a-4419-ab36-9f072c54f9cf@intel.com>
Date: Fri, 18 Oct 2024 16:40:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/ufence: Signal ufence immediately when possible
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241018124710.1536948-1-nirmoy.das@intel.com>
 <2ef62119-1b98-4e5f-8218-0c99b4dbce36@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <2ef62119-1b98-4e5f-8218-0c99b4dbce36@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::9)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH0PR11MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c22af4-11f2-4278-fd47-08dcef82d7df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0hXV1lQZ3B6MzVxMFFadk9RejdzUnJzMzRXRkcyaitqczBKSmNuV1hjMzhQ?=
 =?utf-8?B?V0tkMkZIUnJsNHprWUpNUjR3dmlPcDBkOUtBbmdtTm5VZEs5Y0Jkdy80QTlT?=
 =?utf-8?B?bWJUOFA0Q3VGbURBNnNSTHlmWS9uTlVWOW4welhuTUtodnA4N2xSUzhqeit0?=
 =?utf-8?B?a0JXanVNYThyOGpxK2dtQ3RrVlVFYW04alIvK2RyaTcvbDIrWDVFSDJPTDgx?=
 =?utf-8?B?UVFGd2FrUWhoTlJGWkFGMkRtelVKb3RQYjdHRWlOMEg2Vno3QUllNWptNkpy?=
 =?utf-8?B?NVk5ZkIvNzhSb0EwL1g0TStNTkNMVW9MRVQwT2FEM21rUWQwaXJ4YmJQdjlo?=
 =?utf-8?B?aHVaM3VISi9mNmlLTnFtQTNHUlBST0NVcGp1WkJ0alJINVdvQUJ6a3FwVXEr?=
 =?utf-8?B?SXBvU2dsRjU2YkQyQ0RNNEthZXlmQlRoc3NxRlNyYmg3VTlBbmtvNnhJSk9n?=
 =?utf-8?B?Z2N3OVA3VkpyQ1BmNzRiTVF0QWdTd1QyQzMyeTQ5bmJycU5BY0FvMDdkTCs3?=
 =?utf-8?B?YWFLalhlWXFWWjF4MkhPTDBhaTJGV3BVQzhDYS9FNzEzazlsNXRxYVhpRHp4?=
 =?utf-8?B?bFZJYmwyVGJxcVRaMFV3Wm1McVQ0NllVKzg1ZU5vclFGa1lVdHJzOGhFZ0JB?=
 =?utf-8?B?YXVwVFArWFNheVdXVjZsK0I5dUMvTWtjSE15Nm54MEd0V1JZTEc5aXc2K0sr?=
 =?utf-8?B?VWtnZW9ycDQyTGVyc0RKZUVzVm9zQjl5M0FnaXFkS3NERTJMZFNLY0RML3FV?=
 =?utf-8?B?ckMxWk02YUFvZWozQjhlcjJjcTJhWThleVA3RXJmM2FuK2hBMG03cXl3dC96?=
 =?utf-8?B?RWlqblgxd3dOM0szbjNZYjZnTTZteHFKVVBma09WU1JzZUQwZEIrMGo2bGh0?=
 =?utf-8?B?Z3J3bXF0bkUxb1MrYkVEbWwwSHFDcWp1UlNFS0Y1UDAwOGxXc1RwcFlQRGdL?=
 =?utf-8?B?VDRSWTBCM3FVZ05MQ2xVZzZGSjNpZ1h2T1JveVlIbWtnNnBwV25icDJTUEJV?=
 =?utf-8?B?MTRWa0c1ek5ic1F4MXRYZzhHV0ZtdVBva0QwMzc3ckVubW80cjRvTHc3eThx?=
 =?utf-8?B?UHVRdEI5VjVhOWhQdk9YSGphQ04rQmY0clptNmJUMnozZStEdGExcTF2NWcw?=
 =?utf-8?B?RjBJM2lkRjRFWU53MzJrMFZwaUwxQ1pGV1JqcHE3Q0RDejI5LzlpZFdIWTNB?=
 =?utf-8?B?TzB2RUVobWtXemR4Y2tqT3J5SkcwcU9hMXNoUGNJbThzeXpydFVva0NKWWx3?=
 =?utf-8?B?QXZSdWdoblhSSjY5am95TzVwSGpqYmpNYzlMSVRJQ1ZGVlZ4RFZmbWdhYml4?=
 =?utf-8?B?eUhHaVkvUzFpV2gxS3BXcmY0SkdHdFhYbVN4azRvQ3FvZm1NSEJUcTV1c1lV?=
 =?utf-8?B?cUlZZEtydnZ6bm1UcFlNblExUTZIQ0tjTE4xNGoweUxIb2tXekYwRVNtdHMx?=
 =?utf-8?B?dTZ6QTJCRmRNQmRzTjQwWm4zdkdjcFRWaEpCVjVWSGlQZFR1UUxpcWYwZ2Ev?=
 =?utf-8?B?eVdOazBqT2FWT2YrUHNXT2M3cTEwNW1tM1Q1bEpVeWhkM0xhZlgzV2tMaCtj?=
 =?utf-8?B?VHdQSWFxYTVoMm9HSVdKdDRnMjFPbWkrVzhmMk12d0hmdXNybEduSlZiZzlv?=
 =?utf-8?B?N3FJYmVuZUJaSVR2Qm5Wb1Z5M3UxcXZSOG1aMlBFREYwaTVlWGNpcUtIVTRq?=
 =?utf-8?B?d3UzVXNsNkloczdaYW1DVGFGREo2U013N3RpeEdUalh5VFUzb3FCR3ZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDVsTDFQV0o4eFhZZ2tXaVZvTkhRY3Z1THBNdklidkxkY3lDVm9uUjE1dU83?=
 =?utf-8?B?K3lSUzRwcGRaY25QbzlLU1VuaUVMdFNSa2V1OTNpeUczcWFXeElNMWhmVTFR?=
 =?utf-8?B?K3ZOcktIb0RvRGlBVFV5MDdWK3liOWdUOTVRcDNHaVZqRGtOMEJSZVZ6bE5p?=
 =?utf-8?B?WDJ5aUJ4MnZyeFN4V09ITFc3ZnN1aW0rcmlrV1ZSZXNaWk82SktMSTdTaGtp?=
 =?utf-8?B?QkJiL29TdkowWTFDSzMwZjdhcWMxdUZQUWowazkxdm10MkhWYy9YMVFvTHFS?=
 =?utf-8?B?VjU0OVo5T3dGMVMxc1NPWlpsVlM5c2J2MWZmMmxLZFQrSE12c0hubmhtY295?=
 =?utf-8?B?SmdCQWRwOWthV0tkaWNWWVpUbk8wOGtHWktVTlR2dDNyaU5zMTlhcjZJKzVB?=
 =?utf-8?B?ZmVzdE5GNWRGK0JHM1FqZ0MrVjhjY04vZXBYejZnTmtydTlGZjkxbExSWjY4?=
 =?utf-8?B?NVFmanFRYzRGbndCTG9kOCt1REE4K092RUlLanlUbGc3L0pOWFpsS3hRY3RW?=
 =?utf-8?B?SjJ4aS8ybWROQjdDNWpmSXVkeld6TVpCMjBmQm53Y1pYS3J1K2U2STdINHdv?=
 =?utf-8?B?YUNRWk9QNDZXMmZiaU5zVFp6dEJOR3VOdzNWcjNKeWNTM3BGb1dzWlp3QnQ1?=
 =?utf-8?B?d0VDRmRQRitDZFFFZFkwTGl4YWljWnNVclJDR2xhRHNkd1hyc2ZoamNsREgy?=
 =?utf-8?B?dTJsd0QxR251eWJGSDQxdGNZazZqellEMlBHQ3NlNHo3a0RxRnZlaWdJZlll?=
 =?utf-8?B?b2VFcytidjdpbkR4bmFkaEc3T1NJVTI5NlYybGZrMUtlclpodHY4WWRkREFL?=
 =?utf-8?B?R2VhRXJ0MVlrbHdSRU5YOGRmRXpVOFMva3luTnBMeEVjWHRIRVo2UjJsZUFB?=
 =?utf-8?B?MWtVRU9xWjZFcGw2cWU2cG9EOXM1K3hkYWVHcCtFZVdaRENYMkRVUldCdTRP?=
 =?utf-8?B?ZWpTYlAya28wRHQ1ZmczQW9TVTYzMGhGM3ZtM3NNUmJqemthaFJFSlZWRnA2?=
 =?utf-8?B?UTVlK2tlTmdJQy9CRlB6MDlLWC9od2gyQWZsdFdQazcyVWcxOGExcWRjREZn?=
 =?utf-8?B?aDAwbEs3aTF4U1NscVN1aUJzTy81VHg3TWFRVm9VR2pMQ2dRZTdRS25wdFpS?=
 =?utf-8?B?MlRGdU9XQU5GMmoycWdQTldscUF0bHJvSTRheGVjeUVFdTlERTlHaDBKL3FN?=
 =?utf-8?B?L0xjT1Q2c1gxL1RxK2txd3V3V2ttQ1hicG5CQkRDeXhsUzkvN3Q3cDNTUURq?=
 =?utf-8?B?Q09DZUU5TVpuNDlrT0UwbE9Ja09GSks2ZE5jN3VFVW9YU2p6ZmE4M2RIZDlK?=
 =?utf-8?B?dUsxN2k0dldwamsrZFNLNmdSUHNKNWxWTHJMTUltWS9haldlVGJaaE5ySlB3?=
 =?utf-8?B?ZEZyRER4ajBIMloxVG9BakEySU9RVzZ6N0piRWhvQi9heWkrdXhiZmEyWkxV?=
 =?utf-8?B?RFFyNlNWcDJ1RzZxd3RQNndsM1FRaXpDT2RpRDhjLytRL25RcnBWR0Jpa2w4?=
 =?utf-8?B?dlo5UWRWWDhWOG1PTktxb0owQVFQaTV6U1VoOVR3bmxOOGZ0S293TVBCSVFF?=
 =?utf-8?B?Z05tSGtqTFBLOXE0ckpIblZZYzdXSEM2akpocmN6bHJTZmJROUFFNzdFVXp5?=
 =?utf-8?B?U1dxVHlseDdJcmF2SVMyaWpJTm85L2V3YlVtUnBVN0xZb1VKQlpaQi9yL2Jv?=
 =?utf-8?B?dVFoaHBISUwwZ2tzV3lld2REbXU0WDhQTU01aSt5eFVQczdVcGV1bVZ3eTRY?=
 =?utf-8?B?ek0wY3oxQlVORjVJY3VrV0Jkanh1R2xZRmhGQTE0VnZjSkx5aVIzR2pXTUtr?=
 =?utf-8?B?SUcyb2lLcVB0TUdzSFJJYTRzTWJPL256YUxEUzZUZ3Q2V1dnc1BRaXRTd3dY?=
 =?utf-8?B?b1h4cDlQRktrVnNlV2cxVVdjdHYyRE53OGdDelBSUVV1WkF0QUxQM0NNK0Jr?=
 =?utf-8?B?S3ZVLzJYREdtdk9ERm1xd3Y2aHg2UkZFVG1PMTZwU2Z5dTBvQ1I3WnVSa2FO?=
 =?utf-8?B?djBXQldGWVY1VlZ5V2R3NlJidzlYVTBDaUxTbUMvZ3Vadjdmak5HbGJTclZG?=
 =?utf-8?B?SGNiVVZ4WlJtMzQrdVVESmZBNTU5Vkd2VERSbXlMeEVwUFB3Zjk3M1ZqTnlr?=
 =?utf-8?Q?g9iWJaZxt2OUcGVzj7y/uQYRn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c22af4-11f2-4278-fd47-08dcef82d7df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 14:40:42.9208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tz5tZ1bN2zkAyuulkT+sJmRNxQU9Y5xK4q6XibSUqUVp8rgw5jFCJjCuSHrn2/v2P7g6kzdTDgbndeXRlJ4Xig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
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


On 10/18/2024 4:23 PM, Matthew Auld wrote:
> On 18/10/2024 13:47, Nirmoy Das wrote:
>> If the backing fence is signaled then signal ufence immediately.
>> This should reduce load from the xe ordered_wq and also won't block
>> signaling a ufence which doesn't require any serialization.
>>
>> v2: fix system_wq typo
>> v3: signal immediately instead of queuing in system_wq (Matt B)
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> gc: Matthew Brost <matthew.brost@intel.com>
>
> s/gc/Cc
>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sync.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index c6cf227ead40..069c1e4ebea5 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -72,10 +72,8 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>>       return ufence;
>>   }
>>   -static void user_fence_worker(struct work_struct *w)
>> +static void signal_user_fence(struct xe_user_fence *ufence)
>>   {
>> -    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>> -
>>       if (mmget_not_zero(ufence->mm)) {
>>           kthread_use_mm(ufence->mm);
>>           if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
>
> This can end up in a CPU fault handler? There might be some locking issues if caller is say holding dma-resv. For example the caller in xe_exec which is holding dma-resv. If it can indeed hit this path, then we might get some splats/deadlocks, I think.


What is the connection between writting into ufence addr  and dma-resv  ? Trying to understand this locking problem.


it looks like I have to use a worker anyway to do kthread_use_mm(), https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html


Regards,

Nirmoy

>
>> @@ -89,6 +87,14 @@ static void user_fence_worker(struct work_struct *w)
>>       user_fence_put(ufence);
>>   }
>>   +static void user_fence_worker(struct work_struct *w)
>> +{
>> +    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence,
>> +                            worker);
>> +
>> +    signal_user_fence(ufence);
>> +}
>> +
>>   static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>>   {
>>       INIT_WORK(&ufence->worker, user_fence_worker);
>> @@ -236,7 +242,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>>           err = dma_fence_add_callback(fence, &sync->ufence->cb,
>>                            user_fence_cb);
>>           if (err == -ENOENT) {
>> -            kick_ufence(sync->ufence, fence);
>> +            /* signal the ufence immediately if fence is already signalled */
>> +            signal_user_fence(sync->ufence);
>>           } else if (err) {
>>               XE_WARN_ON("failed to add user fence");
>>               user_fence_put(sync->ufence);
