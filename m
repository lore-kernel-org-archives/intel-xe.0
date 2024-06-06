Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CE1C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 05:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6703810E165;
	Thu,  6 Jun 2024 05:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7P946UA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787F010E448
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 05:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717651851; x=1749187851;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=voWbJUUru6Ul9GmWbAd0eIfz+drdlNOUnTzgRo5rc84=;
 b=M7P946UAaPbdadb1lJZDC+KEJXfc4v98Wtm8aBcUyf/wxpzMOzcp055P
 bQUnMDHHOT//3sFVtOlmfIkG8BsGap8YQMqGs3lZ8XFqqYmeb9K/V0ahZ
 zI3QODB+NvYdHZ2WrM/6WAoauf9IZ+ayAJ5Cas06iio3APzYhhSWMEz0N
 Zb+sUsjvYCBVP1/cQbT7yqIf3u+cYZCFexhPjUmborXWnAqAmzYknY4ZM
 rN/5bp/PmLKENw3Wh11ibh5tv3eaGiBjcVKVYF5OfNYhNl0USs80W1VFM
 Wv1LpZljgnCqzAEsDM4RbWZDLhidk6UFWWr4BQKWeRsQ5LaGLpjg+gACT A==;
X-CSE-ConnectionGUID: ybp06B6pSAycBV8rZnHiuQ==
X-CSE-MsgGUID: Swak1fj2T9yFzRp8MFsWfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31797226"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31797226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:30:50 -0700
X-CSE-ConnectionGUID: xjRY2Fw0Sx246kN59HsVug==
X-CSE-MsgGUID: tTO/Dh30TcOxGuej2RCtDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37940715"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 22:30:49 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 22:30:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 22:30:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 22:30:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Our08AQaqLzzPad8ZjtUQOj/lOAC+2OjmNXAUZ7GSoCJcFlAdsZ4IHqheigd+VyPoFWhAWnBT3xIvXtovmD7bRq1Ae91ZKErX3ww3y6XkVNxZIbEE1ZpPTCNh2cOi2iwCPcfDrSpIyih70YPync8mrkpxWcTjDtN8T4UhJsfyjE/KrMhbaYDpOV8jAFTFUNWlRWGw2fJL57Sh6IFz8T8kO8iOI+j0/jpGIWmmZHE0xLfF1+XVH+Ur9XLF4qUfdG00gSvJUsbRthqNwmkMrt+9WJQ5ufV9QvzyRLzw2OdspYvUFmSuGOXVZ3VfSJ9KyzM+3Degx8I+X6fIMxzQ7V//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ru83mv3vO0ECOFjfxYZx1ExiktdTbO+ZzHGx2jsvSVY=;
 b=WMCCxbzzw1rxwMbUnltWZL9ryy73Omo+hxfPo5pWNyj1AP+B+GwNp7AxRfRoNJvYet+Lr7bdNolzgCzE5P5sJaUdyG/Hxk3SvSmMLcOX0lblOD5BS1mruBack5M+DT3tW94E7gnBfRzkXSYouEUEdN6ajFZ5/ucOMisl69iNYXXj3ZEirf68hHfv0d25yd0/wKt1WQifSt7hMRamcqVmKZ2774SJXv+2CzyTJJ5/bEjnmvPyX8QLYIbHy7r+2BW+8QY4DjEo9vlb5roeHiVutjjrdRV6iQ0BZzDMaQDfuFeKBZivpZxH5GEPkiCTB/Dlk7/KB7hOJgTVEjtuMbxDkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.33; Thu, 6 Jun 2024 05:30:47 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 05:30:47 +0000
Message-ID: <efe0b528-46b4-4073-ad8b-d9906faeaf63@intel.com>
Date: Thu, 6 Jun 2024 11:00:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
 <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
 <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
 <20240603210336.GA2906448@mdroper-desk1.amr.corp.intel.com>
 <8cc78563-5b65-40b7-b5d4-49fed52c6b88@intel.com>
 <20240605210915.GD2906448@mdroper-desk1.amr.corp.intel.com>
 <722e0474-dd1c-4925-8e44-f385d3fd0e48@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <722e0474-dd1c-4925-8e44-f385d3fd0e48@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: da0c1dd5-61ad-4dc3-9370-08dc85e9d15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFNzQ1dla3lHVTVBUG9RY0UxdXFXQlFMaEIrL1gyQTN1cmpuVW1aMTlLcWFz?=
 =?utf-8?B?N3pWNTdhaE9jQzNSbjdKRkZQL215Z21DdDFlK3NPUTBKUmxXeDU1TjdPMUxQ?=
 =?utf-8?B?SlJ2azZDdUVLSnJDcjF4S0tIUi9KbitHUGZtUHUwTWR4R2NvRStzNUNKZXRi?=
 =?utf-8?B?c281NVJsVWd2dUkvUEJzSWNXNCtGUTd1TzBEL0MvSkwxWU5hMXQ2V2VMSkJq?=
 =?utf-8?B?dVcwTXpoK0VkUnlUVUdaVVV3dlhhMFdXVFYrR1RFL29KWjJNcHlhamhCRnh0?=
 =?utf-8?B?UDFGbjBaQUZrOXVLeWF4ZWpteG5LVEd6L0ZmWTR5NGdkZHJlSXhKN3dYWGJU?=
 =?utf-8?B?M1RtUXM1c2cxT0NvZXNyYWViTVFVTkRuVWxjMWJhb2lueWpkSDFPSFNlNm82?=
 =?utf-8?B?aVRxSXpSODZJelFkWGpPYTV0ZzJjQjdPc202MHdQdEdINkdoRUg1L3RTTjJX?=
 =?utf-8?B?V3ltemU1S0srSk40RFBjNEMySDNMaWNIK0xDVVpwOEZVQk1xdjZvb1Yya0hF?=
 =?utf-8?B?eTE2Mk8xYWtUa3JVeHdEN1J6NWphb1FFanhYckZSRGhXcENHcmlvMjhVWFh5?=
 =?utf-8?B?a09LL2NqU2IrNWI5TmxVMkJQU3lraW15MHVLVnp0YjVQUnBHZjBZYnZLM3Zn?=
 =?utf-8?B?SVc3ZTNER3Y1Smt0RTVMY3pzY05KdkNSaDhUNStmV0hXT09URnAxZ0V0UGNk?=
 =?utf-8?B?eFJTdTlWVGp1VU4xc053a0FoYjM5aEtEMXVBeFVhVFdNaWlMUjlNWnVmcVp2?=
 =?utf-8?B?dGdZeFJwQzJWbmFPRjRvbzEwczdSb2h4TVdWaFVFZ2NFS1JtdU5KZkEyV2dp?=
 =?utf-8?B?TWV4blZCMVVSUWh6Y1ZRYWNZc0psaEU1cG4vSUhVeWxHWmh6clp1Tm92Uk5W?=
 =?utf-8?B?TExINFREOWc2cEN4MDNnUDh5MXA5ZFRMM29EdFlQTzQ5ckQzUU1idVhkdzQy?=
 =?utf-8?B?WS8vTG1SeFJiNVQva2RMd0FXQTUxdGg1SlNsZWJxU21sdE45WE5VK2g2Q1U1?=
 =?utf-8?B?YXZTQ1VSaXAxWUo3QlM4dzUwNTlXYzF0OUJ1OGNLdFN1L0dSTXl6cVJwWG9C?=
 =?utf-8?B?MUdhZTI3UEk3TFhnVURGa3NmeWd2dlRZaThxUHFpalpYQWVYdzhrSnBRZ0kz?=
 =?utf-8?B?d253UldMZ1BZNTM5UVRjOU1aclFFTXlVeXhYc25GWEo3TVRYRFRpYnBXUGM0?=
 =?utf-8?B?UmFaUmZyTWhsRkxkVkd3NU52aCtpRyswWk9CbGxnR2hMMmdXSW1jZGZTRm95?=
 =?utf-8?B?VWNxUndaS0U3RlNyMEg5azdleERHdXMvbWQ4YWpSVXF3dEVzc3FwZlJtT3RN?=
 =?utf-8?B?ajJ4NmMvMUNxODdxNGlRR3IvUnhQVERocVQ1RmV5K1g2d1B1R0REUDZpb2Vn?=
 =?utf-8?B?ajQzdTh5Vk9TTnBPNUhzSDJWeEx5SDNhOHowSnpUT2pxbFB6TmVRZEFZemtN?=
 =?utf-8?B?MVJXZ09xVmlsMHB6ZTQ3Uk5SZUVTL0g4YUo5UlJSakFWeFg1V0x6blh3Tjdt?=
 =?utf-8?B?K09hNTlXRXZXSEtXVzNvY1BKUjg2SHByT3p0aWIwczFoaGpiRGplTy84Mnh3?=
 =?utf-8?B?QWdjclpkY3JOWVQ3VXlZbGpXaU5RcENmRUV0NjBFY2pJVTFsNFg4aXdqdGNJ?=
 =?utf-8?B?Q0tsdmxxai8vbkF3Smd5WHdnMjNkWngwSGo4T210a3Vva3BSV0ZvYVE5WWUr?=
 =?utf-8?B?NTdnRXJzN2tFTWFqa21RVnRrSkRUVmhkak84ZHRlOGF4dkNEMEZheDRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dBTHJWQ2lPWUZ2cHNOcmJ4ODJkV1Eva1MraW1NMWU1ZUllK05peHQ3WE53?=
 =?utf-8?B?dkxKdGxCa2hrTnMydGJBWDlkQUJYNC9wUmtKdW1YRjg1UGpBZUJiMERFVzRQ?=
 =?utf-8?B?TVplUzJ5Wm9Xc1J3YVJOb0pIbE9QaWNQTzIxOUpDN1cvbGpjek5Rb2x5SVdo?=
 =?utf-8?B?TUY2VFEyeG9TVTB3VzlHUGNPb0NYMFJZTkFsa1BLSDM2MDNENnVYQUd2bHQy?=
 =?utf-8?B?aXlxTTd3cG91VGlqUGw4OVRrT3I4S1BuRjRNd0NJeDNON2FnYU1GdXQrVEN0?=
 =?utf-8?B?bHJ4Zy9IZUhMVXZ0bC9UTUpGLzQ3UVNwOCtTOVBGYTkwZEFyMHNjcHc5Yi9z?=
 =?utf-8?B?TG1YYjJ6NDJpaWp0bFU5VFQzUWhydTJsamNoOEQvMDZoaXVlcnhqU3VieGhP?=
 =?utf-8?B?QmowMWQ1Y0x0Y1RlSXIyMUVmT2pqZjROMnZrTWJnWExrdXJabHNYNWN2dk4v?=
 =?utf-8?B?Q2l1VlA3MmlBeXlpNVVSWU9GQ2tZZERWQTRWbXFXYjZnd29JbDZKdkVFbDFG?=
 =?utf-8?B?ZkpUSVRzTTVVTTZSZnpiSmRRZGZjMEE5VVNWOXc5UWJkR1RPYVcrZGZONmcw?=
 =?utf-8?B?UEtmeEM1RlRDYmhkSzZoL1orTDhVQmo5UjQySFpsMkFKSFdPZjQ3ditVU21G?=
 =?utf-8?B?RmZ1enp1ZEZqRk5wY1pRc2JtcTFGZ3dPekxhem5TK3BNK0o1Yzh5dHlxdCtl?=
 =?utf-8?B?WTB5c3I3bWVITktRR1k3SzB4aVZ0MVVHOUVMSHVuUTVNeXZIU3I1R0VjcTY5?=
 =?utf-8?B?alBPbXMzcFhucDF5Zkh3UHhOVlgzU3QyRDVvcW5ueG5taXM1NStGc2czb0JK?=
 =?utf-8?B?V3JyT2lWc1Bja05lWm11ZWp4NUhCaUFtOEZXQjVWeE9SNVRyV1JEV1JHTGo4?=
 =?utf-8?B?NnZvMmRpcVM5OEw2RythdlZ4eDBnL1lhZUsrNFdQM1c5dmkydUREeDJXRFJR?=
 =?utf-8?B?cXJRU3ExenIxa1haMUJOQVcwVGRxZHR3Ujh2L09wMTRBT0ZzU1VRQjRhS1dR?=
 =?utf-8?B?ZWJLNEFiY2VPYlNvUjZBRXV4KzBpaUMwVXpHeWRvNkRtTlV1WWFCSW9iaE9w?=
 =?utf-8?B?M1RoOE05WCtZYUVHVzM0eG56SlRod2lqSDRwQmt3MVBDNGFOS1p5cmlyVlpY?=
 =?utf-8?B?RVBDNUNTQzB2ZWl5N1FpWEdwK3ZLVG1LeFM4YjNPSEt4d0JZRkttdnZNcTE0?=
 =?utf-8?B?REdtUndVWU5JTEJtbW9rOXEwMjdhSGxZQ2NETytFUUk5UWV5cnlVOXVncGZn?=
 =?utf-8?B?YUswNXNHeXhmSHN3S2Nmc0ZGeDlkQjRYUGdObnVnYkxsNFZFNkZNZFNZUEla?=
 =?utf-8?B?UkQvV2x5K2x3bHQybFR6cjJiWGhLdU5TMlJXVUduelhjTGpQQWRmVmt0eHk0?=
 =?utf-8?B?Q0FhZ2dMOW12bkVBOFk2Q0pIOHMzdTRpeUJsZ1liam5rZW41M0dUVWlBaFNG?=
 =?utf-8?B?eHRWNFA0em1tU2xUNjQ5Rjg4c24wMm5tbE9CWFVWTmxhc0drc0VzcHFLa1ky?=
 =?utf-8?B?cXhLdVVUb1hIUHlKM05CQktUK0YvNHdGNU9DZnFaekcvOS91aXRDODBldlRV?=
 =?utf-8?B?elRubVo1OFdvV1BQaDhieXIwTExqNU1VK0NrQWtnT2ZYVFR2MmdmRFlJYUdD?=
 =?utf-8?B?MnBYQThidlhWQXlicXl0OXJQaUpMb3pXNTJqbXBZTWoxRW9Tb3lzZ1Rnc201?=
 =?utf-8?B?SktXTlg3UWFNdnVMbnBmT29iOXJjTVBobXl2NGlpeHQycE5LUXBIbkRsU1Jy?=
 =?utf-8?B?NEhMSFlpMFNITXNKL2FFcTRBUHJBbDlCeFBqTVJFZUlkNU14bHZYbFplKy9V?=
 =?utf-8?B?NFRoNGRUOERpZjBhT2s2TG1jZzRRa2x2dngwem1wWURnM0dHNGR6amhKVmF3?=
 =?utf-8?B?eURkRGppVVRKRFlxdDJJRW9LOVZmK3JweWNlTFAzKzVxaDRmSXBPNmZmdGNZ?=
 =?utf-8?B?enJnMjBJNHYwY0JzbURxKzZ1a0hRNXVVNStXU1ZWMVFqMmdpbzZWRTZhc1B1?=
 =?utf-8?B?SEJ3SlY0OEsvdmdiZmZzVmZiemtLWTFDTHg5dVU4SG5uelAyd2p5VVFiTDJ1?=
 =?utf-8?B?RzBUN3EvY0w0ODFKUzZCZXZOaHpQbjVsUC8wcEEvR0t0VW1NWFhGMU9sUkVC?=
 =?utf-8?Q?DZMoeBXJx5tDqJ5V0kxu5VmOs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da0c1dd5-61ad-4dc3-9370-08dc85e9d15a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 05:30:46.9033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNazsWtTBcUTgFQW2UmPjQQWDxiMe/kgCyuvPG0zHctuMIDFNgiDasTVCaEt3X7dElHDygs6QfyMxkNQcHoZ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
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



On 6/6/2024 10:04 AM, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-06-2024 02:39, Matt Roper wrote:
>> On Tue, Jun 04, 2024 at 04:22:00PM +0530, Nilawar, Badal wrote:
>>>
>>>
>>> On 04-06-2024 02:33, Matt Roper wrote:
>>>> On Thu, May 30, 2024 at 10:09:30PM +0530, Ghimiray, Himal Prasad wrote:
>>>>>
>>>>> On 30-05-2024 20:14, Nilawar, Badal wrote:
>>>>>>
>>>>>>
>>>>>> On 30-05-2024 19:51, Nilawar, Badal wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
>>>>>>>> Make sure that the assertion condition covers the wakefulness of 
>>>>>>>> all
>>>>>>>> domains for XE_FORCEWAKE_ALL.
>>>>>>>>
>>>>>>>> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of
>>>>>>>> XE_WARN_ON macro")
>>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>>> Signed-off-by: Himal Prasad Ghimiray 
>>>>>>>> <himal.prasad.ghimiray@intel.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>> index 83cb157da7cc..9008928b187f 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>> @@ -32,7 +32,7 @@ static inline void
>>>>>>>>     xe_force_wake_assert_held(struct xe_force_wake *fw,
>>>>>>>>                   enum xe_force_wake_domains domain)
>>>>>>>>     {
>>>>>>>> -    xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>>>>>>> +    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
>>>>>>> This will always assert for when domain FORCEWAKE_ALL (0xFF).
>>>>>>> Not all the platforms support all the domains.
>>>>>>> e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use
>>>>>>> case only bits for GT and RENDER will be set.
>>>>>> I think to handle this correctly in struct xe_force_wake you can 
>>>>>> add new
>>>>>> enum xe_force_wake_domains supported_domains to hold bitmap of 
>>>>>> supported
>>>>>> forcewake domains. Use this bit map to check appropriate domains are
>>>>>> set.
>>>>>
>>>>> Hi Badal,
>>>>>
>>>>> Thanks for taking time to review this. Agreed the check should be 
>>>>> based on
>>>>> supported domains.  Will look into this.
>>>>
>>>> I guess the real question here is why we'd ever be passing
>>>> XE_FORCEWAKE_ALL to xe_force_wake_assert_held().  That assertion is 
>>>> used
>>>> to sanity check that we're actually holding a necessary power domain
>>>> before performing some operation that relies on it.  Nothing in the
>>>> hardware should ever actually _need_ every single forcewake to be held
>>>> at once; we just tend to grab XE_FORCEWAKE_ALL in some places of the
>>>> code because it's simpler to just blindly grab everything at once (even
>>>> the ones we don't truly need) than it is to figure out the specific set
>>>> of domains that will get used.
>>>
>>> In the save/restore code path, both at the top level and in subsequent
>>> levels, xe_forcewake_get() is called with XE_FORCEWAKE_ALL, as I 
>>> believe it
>>> accesses registers from different domains. In my opinion at subsequent
>>> levels we should
>>> %s/xe_forcewake_get/xe_force_wake_assert_held(XE_FORCEWAKE_ALL).
>>
>> We just grab FORCEWAKE_ALL because we're lazy and don't want to add the
>> code complexity to figure out the exact subset of power domains
>> that are actually needed (which may vary by platform).  We usually do
>> FORCEWAKE_ALL in places like device initialization or suspend/resume
>> that aren't in a hot path and are only going to take a couple
>> miliseconds total.  If multiple levels of the call stack grab forcewake
>> redundantly, that's fine; forcewake is reference counted, so the calls
>> lower in the callstack just increment the reference count and return
>> immediately, as we'd expect (assuming every get has a paired put).
> 
> 
> Agreed, the subsequent calls to xe_forcewake_get() and 
> xe_forcewake_put() merely increment and decrement the reference count. 
> However, if we are confident that the caller is already managing 
> xe_forcewake_get()/put() properly and the function operates 
> synchronously, would it be reasonable to acquire spinlocks solely for 
> the purpose of incrementing and decrementing the reference count?
> 
> 
>>
>> xe_force_wake_assert_held() is intended for places where we know we need
>> a specific forcewake domain and need to make sure the function never
>> accidentally gets called from somewhere that the domain wasn't already
>> held.  I don't think calling it with FORCEWAKE_ALL make sense since that
>> implies you don't actually know which domains were necessary; if you do
>> that it will just impair our ability to do more focused forcewake
>> acquisition in the future.
> 
> I believe this is the gap: After xe_force_wake_get of FORCEWAKE_ALL, the 
> assumption is xe_force_wake_assert_held can handle the enum 
> FORCEWAKE_ALL to confirm whether all domains are awake or not. However, 
> this is broken: the function is written in a way that it can't handle 
> more than one domain at a time.
> 
> For example, the caller of xe_gt_idle_disable_c6 uses force_wake_get 
> with all domains and simply relies on 
> xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL); within 
> xe_gt_idle_disable_c6 to proceed with register write, without actually 
> caring for actual domain it needs.
> 
> If we see no real use of xe_force_wake_assert_held with 
> XE_FORCEWAKE_ALL, I will proceed with dropping patches [2/3] and [3/3] 
> from https://lore.kernel.org/intel-xe/ZmDhQJLrleUjetIX@intel.com/T/#t 
> and will add a BUILD_BUG_ON if the user calls xe_force_wake_assert_held 
> with more than one domain.
> 
> And from BSPEC, it looks like xe_force_wake_assert_held inside 
> xe_gt_idle_disable_c6 should use XE_FORCEWAKE_GT.

Hi Himal

xe_gt_idle_disable_c6 issue is fixed in 
https://patchwork.freedesktop.org/series/133519/ and RB'd.

Will push it

Thanks,
Riana
> 
> 
> BR
> Himal
> 
> 
>>
>>
>> Matt
>>
>>>
>>> Regards,
>>> Badal
>>>>
>>>>
>>>> Matt
>>>>
>>>>>
>>>>> BR
>>>>>
>>>>> Himal
>>>>>
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Badal
>>>>>>>
>>>>>>> Regards,
>>>>>>> Badal
>>>>>>>>     }
>>>>>>>>     #endif
>>>>
>>
