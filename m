Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7AED68BE8
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 21:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A62310E8F7;
	Fri, 15 Nov 2024 21:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLyTDt6M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA56110E8EF
 for <Intel-Xe@lists.freedesktop.org>; Fri, 15 Nov 2024 21:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731705772; x=1763241772;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5MgoetyXTK/EuvrmbAtu5O3yyXjI+fPxyAMqe/dGy+8=;
 b=jLyTDt6M6KstXtGXU+REed8SGhN5p2oahyBNyV/MTGRKaoRjhe/vYkIP
 RxDuKDN/BaFX6snxhEnM1rgvOxB/XpeYCfnEdwOx59xKH9qrLZeHvval2
 JtGlweDzzxgdHeLML1U9IXGng4uUW8nzao3PWNzTOiuWzOqJUIE7quiSx
 AfubHFwHgL3xEKWfyhbHGtdP9oTtHh/X2asnQpFmaAl3jGyCWWWbkY5jw
 FNULVQ1IYz63NQ+clTJzlCUQ81XgYOfWMqhceEVWp6mDIuPOG5LqtfSYz
 0ssi8pd0+7NYWaVo3bvW/GzNWW5hfWW3txJ6AlgGIijAvKZWZPxf3RxmM g==;
X-CSE-ConnectionGUID: nZZcbL7+QLW0gxv4A6BMBA==
X-CSE-MsgGUID: Cw6dEDycTJytp9hD3/EK2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="49258501"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="49258501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 13:22:51 -0800
X-CSE-ConnectionGUID: 6JRehOvqTVSJXcdl5ZQJUA==
X-CSE-MsgGUID: 4p41b0dgTi6UsJJWM89llA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="93764164"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 13:22:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 13:22:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 13:22:50 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 13:22:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgXzrJJZRs6TOfS7P4dL3nzbNf8RVY2kKp0DAHhL6UoK4Lzn1nIt1ZgOXNnIUcc0AwK6zFjiLcjth688XMjEAMFNfslBNdAXUTHGDZgIPFGf5r7QQu9PY4Q9vm81d1wdoVB+9m/MQRN1w409YsV6iPDxaRqt9tBOQnfLyIvxbPMNVFhpIqW4i8jrx9dIu6HuLTIFEIamxLEtapLoZmYVZ10cv8iKro9lAkcmPiRqXDGrcgvJomUy1zL5hL7wxt1FAxi9jETiRY8zJ4ybeINI5N/zfnuFAicXXc0Z+e3cLKZoguYCPs6WHKzUrJNvb8w9FFwFu9pCZBbjGecL9w1Nww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcD0Sa1k7U+lo21bn9G519V2TZQ4jhLqYht16yPHMk4=;
 b=VLJ+Mj8W1h2rBdN0vDHWfOJE908vFG/LIrwHerN32Y4wPM7EGeg2R/93DreId0GZIJcc+qAm1BJ4gS5l3GVcfReqducJyCb9q/73CHdM8Hn3PWoceSXzMDZyHkwDal4u5Itlenba4+3gYtDbc7E8RkRiI8gSNSDP3AK1BqHtU0Dta1FAUZFpGRShvTOODIvece8cCmedhMRZ7Kh1ynOe8K0A2nlg74TCS35ooYfTpFPfH/hk1gzYOF6dAI2zqbvdMrR2YGUlI8qtMcUfkZvWS6vdVOnQltt5AH28Zra5lNavZYVO4r3P/gB6fVcyia4fr4Uhp27dB04p5q7zGWaL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 21:22:43 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 21:22:43 +0000
Message-ID: <df4db3df-2a2e-49de-905f-a1c51793b8b9@intel.com>
Date: Fri, 15 Nov 2024 13:22:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20241108202216.2020164-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM6PR11MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a6295a-cace-4678-878e-08dd05bba471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFpJMWVvUHlwbHJ1RllrbDBWUjFDV0szdzZIcXZaTEdOUnJWNG9OWnh1WmM5?=
 =?utf-8?B?SkVjL3FSTE50T0tYejhJRjRVTTNHeW14TWFlWEo3ZlR0azJuZFVJWCtUYU9J?=
 =?utf-8?B?bXVlQnNLL0huVTgvekFobDNTaUN3a1BXV2U4RlhVWlF6cDh6RjdjdERWYTBK?=
 =?utf-8?B?QWpqcEk5amZHMXpVOTJBYVZBZS9TRGJPTDRhdFFnMmUwUi90QTZTOWJkTE5u?=
 =?utf-8?B?bUFFMlprZ0FQK1VnYlM3ZkNsa2plc254ZWtGVU41bFQ3aXgyRlBMSFdGV0V3?=
 =?utf-8?B?d3VZT2w0c3JGckNmMWoxTlVVc2Y5eDFKL3g5Z2Q3MURuODd3bGRoR1RMSlYv?=
 =?utf-8?B?M1pIT01tLzVpNVUrRmhVcUFYTDUxazZUZ3lQek11T3RadjVhaDdMNXkvUTJL?=
 =?utf-8?B?KytWVTEzRFRaUzZ0QVU1U29VQmxaV3lMYTZzMjNYNFRSOElCM0F0czNGeXZR?=
 =?utf-8?B?bVJpYjNrUGtnS1R2WjQ4YjZNNVlOczlmM0YxMWxLekt3UmRNenJNQjE2UG9q?=
 =?utf-8?B?ZGs0MzMvckRYY21tNThzM2M3cjZ5YjR0YXBmMWh3ZTg2WGVOWnRBSHZ1OCtj?=
 =?utf-8?B?WVhtNjRsQXp4enMraGtMaURvaU1XQzMxRFVBcmx1N1BmWUx5Y3JQbnZIL2F1?=
 =?utf-8?B?K2lUTjM1NkVrcjlrWDlwQlAvTU11cUhSbldiSzI5OFlVdlpmZ2pLRjI4eC9X?=
 =?utf-8?B?VjJWWmtHSGhzMzN5aDB0cktKNzF4Z3JRTmNZd0ZLa3F5RGNLWnQ5YjF5S3d6?=
 =?utf-8?B?T0NxVEIyc3JyTi9Fei9BT0xuTXpkc2FhM0J5TCtIamdraTZMNVlobWFxQjR4?=
 =?utf-8?B?emtVNEZUQlVYTGFDa1I5dFVrSEVNKzRDOUVxU0tBa0dMS1VDazJwb1dzMHBD?=
 =?utf-8?B?TTFUWDlVUkdoSlNDSUF1cFV1VU1aWmdPcWd1LzVZT09LUS84cnFPdjRuUmFM?=
 =?utf-8?B?cTJxNVdDc0tPNUZsNzJMSGZjaVUvbUhiOUFtRmdhak1qNUswemJDTk1SQWJJ?=
 =?utf-8?B?c0pNOEc0M0duWEswTmdmZHNBbEwyRVhXSjRWVlFmUlg5QVpFc2wzVmQ2NC90?=
 =?utf-8?B?T05MZ3ZaM2VRbmdCZXZWZW1VSjJKZ3JaMEk4WFpxVTl0d01Sd3VHMnVidlNp?=
 =?utf-8?B?VkFOQ3BvS2Zhd0JOMTUxeWFudTZBYWZRS3BYMVd6RytmcFJGci9uWEt1Sllh?=
 =?utf-8?B?UXZ5VVhiWGZaVG5XdDZ1UWFtSTU2dS9VUEowZDMrWm5YWU9qYktVdGIxWVQz?=
 =?utf-8?B?ZCs5ZEk2dE8rcG94Q2x2TTdWL3h0cGdMVEk4K29PY3F2OTJCd09ONGd6cU5Z?=
 =?utf-8?B?Z1RJT1FpSHpWZ3lQWE50Mk1ndFJmM281Zi8xeXA4VXloMm04aDdzdy9HVGxw?=
 =?utf-8?B?OEdLbjlFNUFjaEZ0bUtadWRWUXhiQlpHRDZoWG0xcHRWdnFQZ01vMVg4bElG?=
 =?utf-8?B?SVQwQ0lFY0JiT3JMQ0NkTGVzaDdyQ1VTZGt5MXpPZzJEaFp5WlZZYVhuZnRE?=
 =?utf-8?B?L3NLWTF6bTltY2RWKzg3OWlMVUI2OFQ3YTE5VzlJaWI3WnlUcldzNTQrQXNV?=
 =?utf-8?B?UVVTUVF1azg3MkhlSVBGc3VseFFtako4eFhsazdiVWpEdlN0R3hGWUhMdTF2?=
 =?utf-8?B?ekdWQWFHQTlTdWVCR0VLYXFacG1SbXFrcWtPWFZraVFQeGUwNXJGRkpwVXNx?=
 =?utf-8?B?b3NhRU53RVp0RUwvN0FpNWhtWDd0dFlFSXl2VGIvMUxPUHRjVzJvUXM0dGlq?=
 =?utf-8?Q?0g0JV5m/OwT71Hnl0wWA1Zk92g0ENoqZ5ljiulO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFlQNzVBMktZQjRLQ3gwVS9tT0ZPa3VQYzE5b0x3Z2J3NGFqeXl1Z2FzWG5Z?=
 =?utf-8?B?MFBpVm5MemZiWnBEYzNsMU9nazF5MjNIS2kzbkxhbUJVemZXM1ZGMW9mVmZ2?=
 =?utf-8?B?SWlVWC8zNHl2UEVMUy9FMzhCa0xuTGRPbmRRQm44bTg0ajZBaTJYVWNiVVpt?=
 =?utf-8?B?WFVISHIvODlrQlE3a0RZR0Y2L1hqU2tRU1dxUkpjaUM3S2grbDRjOEc0dUdk?=
 =?utf-8?B?a1dualJZNUd4dVo1TFo5ZHFySDkzS3lBTkQ3MGNhbUJNTDlNSVJRN29naDNV?=
 =?utf-8?B?YUtKRWJJM0RKMkJwTTdkMXNFVlV2WE00OFkrVW5hOURRSWJtbS9ETzZQdmxv?=
 =?utf-8?B?ZlV0bW1JUENiUHhFS3FXM3lHRUJWUkNOb20zLzRuRVM1emRVTHhEeTlMN29V?=
 =?utf-8?B?VEwwaC9pb0dzS1BuY3RsN1VabFB0OEhJbUhHckJ3aFVXZ01aajNhWkpTWGZj?=
 =?utf-8?B?bVNDWWhRUGZHS1J2QTJEcFgrejdjT0liL1BCMzVtRm15d0xDU0k4K1ZWbVhE?=
 =?utf-8?B?RkJEVzVObFpzV1lEdnk5R3NnZXNBT1VGajlsc25XSTJ2VHRiWFdwbnplbWdq?=
 =?utf-8?B?bklCQ2ZKSTJTQ0VKR09iNXdjQ0pRYk4xT3lWL1pRZ1NVMDVaK0N3cFU1b09R?=
 =?utf-8?B?VzlkRzVqVzdGbjBqa0JMTUNuaVBrR1pEYlNHT3Bhc0RPMzkzWmhOcEFSYjg1?=
 =?utf-8?B?SWtFQ0o0azlMNENKc0lqRjZGUHl6SnRDTm1EazEvazJOcE9oU28yczd3Zytu?=
 =?utf-8?B?aER4bTV6OWtkQm1vYSsxamVQUzc3a1NJRW1pWStaSTZpUVZadzE5NWJGeUFL?=
 =?utf-8?B?U1ZXUVkyY1hqRTIrQkdXNWwzeDBHTERYNHplalJZSlUwcUtzQWpXT0VuUXJy?=
 =?utf-8?B?d2JaMmtUUEFYTkdub0RHVkNvSjF0Z29kQTBKTGp5MUlxK0hNamRNMTFYNVRW?=
 =?utf-8?B?Qkd4M2FiL3VsTUVXMURCcTgrdGh0Qmxac3ljL0JwdFdlK0dSdnVlaWdqMTdK?=
 =?utf-8?B?SkpFYnBMb3o5M0dlUEdvZkk2SGxpT25CZUkyUFRrRTc3WU1jTHhHRXFPNjFq?=
 =?utf-8?B?Y1hMRnZuVUU4TEYxRHorUXhZQU43d2hQS1Z2WWRjNlFJalU0ampnVDBpWEtK?=
 =?utf-8?B?eG5ZS1NBMmRZRXB1enN4UVIxNWFucXpXVFBhRys0cTkrZkxTMWlnY3QyVnND?=
 =?utf-8?B?VkFoMDNiTHZLUy9IUmtUVG13TFdZOE5BR3Y2Qk9OWnR1ejI0Q2g2bWpiMXJr?=
 =?utf-8?B?RUhsd0k4ekR2dFV2bFJEczdCU2FtYkpQUHRwbFVuWFF2VkpVeC8vOGpYVGVz?=
 =?utf-8?B?WlVsRzlIaHg2Vnh5VGRWTnpuaGo2U0FERFVMSmpXWU9UZE9WME5oS2VGcEtx?=
 =?utf-8?B?bFBWTDZaclNvQm5pQ3pZbHdaMDhHT0U4SlR6b3RpbWhQUE9FOG5sUytxbHln?=
 =?utf-8?B?TmRUYytSdURzOFpBaS9neXZORzAvVDF1U25VNGZaTEo3bDdSc1RVT3p3bVVG?=
 =?utf-8?B?ZTdIdEpZOWpUYVJ5VFlxajNualJFWGJhZmJmK2tFN3Z3SllsVnhBRmZoZVhl?=
 =?utf-8?B?eWt2akVUK1RERFVNcnN0SEhSRnlPdzJZKzVXV3FjcGVEc0xsQjd2dkVGSnkr?=
 =?utf-8?B?T0laaVVNZWE1dHltYm9BNHJqa0hyRm5aWGdkL3VuVjg0OTIyRnJDZk42Znp6?=
 =?utf-8?B?eHJLSWJIRWxyWnhGZlZad0VXMm5DVEJ2RUtPcjNmWFFDV05oTXJuT1FPT3h4?=
 =?utf-8?B?Q1EvOS9DV0Fra2lhWGg0cHRjT3U1TTF4N3NMeWxKTExqZ0tQdGx6Y2tLTCtB?=
 =?utf-8?B?YmgyUE9qY2pJanFFWHlZM042TmZTaWFjMTVQWENzY2owR1NKQlRFMmsxWFFP?=
 =?utf-8?B?dTFSR0F1UndqRmNBaHBEc3oxbHM2Nmxsakk2OE14SFVqUmpMUWx5OW81VVFk?=
 =?utf-8?B?MlBRS2tMRFhLTm9ZVXpSRWx6a25NT0pISC9rUndSUWV2ZHorb1hqQ3dvekps?=
 =?utf-8?B?Z0JjZGpqU3VER2lDQ0Q3ZGI4R0FrbUVodHVndXk0N3VDRzd0aDRNa2tmSmR1?=
 =?utf-8?B?RFI5SWN2VEIxUWk4bHpESlNsb2pjM3FDYW9OYnJhOENaMUlPWnczTDB3bjB5?=
 =?utf-8?B?akhZZUozOXZiQ0tUd1NLQ3dVazNTSGxjV0M0b0VGd2hodXRTY21HbmpjbmpQ?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a6295a-cace-4678-878e-08dd05bba471
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 21:22:43.4054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iFTg28/Gj4SAJfYsjnJdzaNYfLsn0zPEjtUPChn2THEQBETyGhacxLM+BpU8nFMgxkhSuR2IpzaafE2WITdg6zxVP5RHPlEKdqAHoKTzro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
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




On 11/8/2024 12:22 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Some features require inter-GuC communication channels on multi-tile
> devices. So allocate and enable such.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
>   drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
>   3 files changed, 305 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index b54fe40fc5a9..fee385532fb0 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -134,6 +134,8 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>   	XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>   	XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
> +	XE_GUC_ACTION_REGISTER_G2G = 0x4507,
> +	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>   	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>   	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> @@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
>   	XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
>   };
>   
> +/*
> + * GuC to GuC communication (de-)registration fields:
> + */
> +enum xe_guc_g2g_type {
> +	XE_G2G_TYPE_IN = 0x0,
> +	XE_G2G_TYPE_OUT,
> +	XE_G2G_TYPE_LIMIT,
> +};
> +
> +#define XE_G2G_REGISTER_DEVICE	REG_GENMASK(16, 16)

I'd call this DEVICE_ID like in the GuC specs, or GT_ID if you want a 
shorter define. Just DEVICE sounds like it's going to a different card 
instead of a different GuC device. Not a blocker.

> +#define XE_G2G_REGISTER_TILE	REG_GENMASK(15, 12)
> +#define XE_G2G_REGISTER_TYPE	REG_GENMASK(11, 8)
> +#define XE_G2G_REGISTER_SIZE	REG_GENMASK(7, 0)
> +
> +#define XE_G2G_DEREGISTER_DEVICE	REG_GENMASK(16, 16)
> +#define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
> +#define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1cbad8a91798..899094423291 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>   			    struct xe_bo *bo)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
> -	u32 addr = xe_bo_ggtt_addr(bo);
> +	u32 addr;
> +
> +	/*
> +	 * For most BOs, the address on the allocating tile is fine. However for
> +	 * some, e.g. G2G CTB, the address on a specific tile is required as it
> +	 * might be different for each tile. So, just always ask for the address
> +	 * on the target GuC.
> +	 */
> +	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>   
>   	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
>   	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
> @@ -244,6 +252,263 @@ static void guc_write_params(struct xe_guc *guc)
>   		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
>   }
>   
> +static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev,
> +					  u32 desc_addr, u32 buff_addr, u32 size)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 action[] = {
> +		XE_GUC_ACTION_REGISTER_G2G,
> +		FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |

This needs a comment somewhere to explain that the GuC expects the 
number of pages minus 1, because otherwise that -1 is confusing.

> +		FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
> +		FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
> +		FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
> +		desc_addr,
> +		buff_addr,
> +	};
> +
> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
> +	xe_assert(xe, !(size % SZ_4K));

Is it worth having asserts for max size (1MB) and for dst_dev (0 or 1)?

> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEREGISTER_G2G,
> +		FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
> +		FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
> +		FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
> +	};
> +
> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +#define G2G_DEV(gt)	(((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
> +
> +#define G2G_BUFFER_SIZE (SZ_4K)
> +#define G2G_DESC_SIZE (64)
> +#define G2G_DESC_AREA_SIZE (SZ_4K)
> +
> +/*
> + * Generate a unique id for each bi-directional CTB for each pair of
> + * near and far tiles/devices. The id can then be used as an index into
> + * a single allocation that is sub-divided into multiple CTBs.
> + *
> + * For example, with two devices per tile and two tiles, the table should
> + * look like:
> + *           Far <tile>.<dev>
> + *         0.0   0.1   1.0   1.1
> + * N 0.0  --/-- 00/01 02/03 04/05
> + * e 0.1  01/00 --/-- 06/07 08/09
> + * a 1.0  03/02 07/06 --/-- 10/11
> + * r 1.1  05/04 09/08 11/10 --/--
> + *
> + * Where each entry is Rx/Tx channel id.
> + *
> + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
> + * be reading from channel #11 and writing to channel #10. Whereas,
> + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
> + */
> +static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
> +			     u32 type, u32 max_inst, bool have_dev)
> +{
> +	u32 near = near_tile, far = far_tile;
> +	u32 idx = 0;
> +	int i;
> +
> +	if (have_dev) {
> +		near = (near << 1) | near_dev;
> +		far = (far << 1) | far_dev;
> +	}
> +
> +	if (far > near) {
> +		for (i = near; i > 0; i--)
> +			idx += max_inst - i;

The loop can be replaced by a single line with:

idx += near * (2 * max_inst  - near - 1) / 2

But the loop is probably easier to understand.
(I've spent way too much time trying to find a better formula with 
little luck :P)

> +		idx += (far - 1 - near);
> +		idx *= 2;
> +		idx += type;
> +		return idx;
> +	}

This needs some comments, because otherwise it's very hard to parse. 
Maybe stick with to the table example? something like

/* Count all BO pairs from the rows above the one where the pair we want 
is */
for (i = near; i > 0; i--)
         idx += max_inst - i;

/* Count all BO pairs on the same row and to the left of the pair we want */
idx += (far - 1 - near);

/* Switch from BO pairs to individual BOs */
idx *= 2;

/* Select which of the 2 BOs in the pair we want */
idx += type;
     return idx;

Same thing for the other one, just swap rows with columns and left with 
above.

I'm also ok with a different comments as along as there are some.

> +
> +	if (far < near) {
> +		for (i = far; i > 0; i--)
> +			idx += max_inst - i;
> +		idx += (near - 1 - far);
> +		idx *= 2;
> +		idx += (1 - type);
> +		return idx;
> +	}
> +
> +	return -1;
> +}
> +
> +static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 type, bool have_dev)

you don't really need the have_dev passed in from outside, you can just 
check for tile->media_gt being not null.

> +{
> +	struct xe_gt *near_gt = guc_to_gt(near_guc);
> +	struct xe_device *xe = gt_to_xe(near_gt);
> +	struct xe_bo *g2g_bo;
> +	u32 near_tile = gt_to_tile(near_gt)->id;
> +	u32 near_dev = G2G_DEV(near_gt);
> +	u32 far_tile = gt_to_tile(far_gt)->id;
> +	u32 far_dev = G2G_DEV(far_gt);
> +	u32 max = xe->info.gt_count;
> +	u32 base, desc, buf;
> +	int slot;
> +
> +	xe_assert(xe, xe == gt_to_xe(far_gt));
> +
> +	g2g_bo = near_guc->g2g.bo;
> +	xe_assert(xe, g2g_bo);
> +
> +	slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
> +	xe_assert(xe, slot >= 0);
> +
> +	base = guc_bo_ggtt_addr(near_guc, g2g_bo);
> +	desc = base + slot * G2G_DESC_SIZE;
> +	buf = base + slot * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;

nit: I'd reorder this to have G2G_DESC_AREA_SIZE before the slot, so 
it's in order to how the memory is actually filled.

> +
> +	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);

nit: We should be able to assert this only once at alloc time (see below).

> +	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
> +
> +	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
> +					      desc, buf, G2G_BUFFER_SIZE);
> +}
> +
> +static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type)
> +{
> +	guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
> +}
> +
> +static u32 guc_g2g_size(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int count = xe->info.gt_count;
> +	u32 num_channels = (count * (count - 1)) / 2;
> +
> +	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;

Here we can assert:
num_channels * XE_G2G_TYPE_LIMIT * G2G_DESC_SIZE <= G2G_DESC_AREA_SIZE

to cover all the descriptors in one go

> +}
> +
> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
> +{
> +	/* Can't do GuC to GuC communication if there is only one GuC */
> +	if (xe->info.gt_count <= 1)
> +		return false;
> +
> +	/* No current user */
> +	return false;
> +}
> +
> +static int guc_g2g_alloc(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_bo *bo;
> +	u32 g2g_size;
> +
> +	if (guc->g2g.bo)
> +		return 0;
> +
> +	if (gt->info.id != 0) {
> +		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> +		struct xe_guc *root_guc = &root_gt->uc.guc;
> +		struct xe_bo *bo;
> +
> +		bo = xe_bo_get(root_guc->g2g.bo);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		guc->g2g.bo = bo;
> +		guc->g2g.owned = false;

It doesn't look like you're actually using the "owned" variable (which 
makes sense, because the BO is refcounted so it doesn't matter which GuC 
it was originally allocated for)

Daniele

> +		return 0;
> +	}
> +
> +	g2g_size = guc_g2g_size(guc);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_ALL |
> +					  XE_BO_FLAG_GGTT_INVALIDATE);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
> +	guc->g2g.bo = bo;
> +	guc->g2g.owned = true;
> +
> +	return 0;
> +}
> +
> +static int guc_g2g_start(struct xe_guc *guc)
> +{
> +	struct xe_gt *far_gt, *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int i, j;
> +	int t, err;
> +	bool have_dev;
> +
> +	if (!guc->g2g.bo) {
> +		int ret;
> +
> +		ret = guc_g2g_alloc(guc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* GuC interface will need extending if more GT device types are ever created. */
> +	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
> +
> +	/* Channel numbering depends on whether there are multiple GTs per tile */
> +	have_dev = xe->info.gt_count > xe->info.tile_count;
> +
> +	for_each_gt(far_gt, xe, i) {
> +		u32 far_tile, far_dev;
> +
> +		if (far_gt->info.id == gt->info.id)
> +			continue;
> +
> +		far_tile = gt_to_tile(far_gt)->id;
> +		far_dev = G2G_DEV(far_gt);
> +
> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
> +			err = guc_g2g_register(guc, far_gt, t, have_dev);
> +			if (err) {
> +				while (--t >= 0)
> +					guc_g2g_deregister(guc, far_tile, far_dev, t);
> +				goto err_deregister;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +
> +err_deregister:
> +	for_each_gt(far_gt, xe, j) {
> +		u32 tile, dev;
> +
> +		if (far_gt->info.id == gt->info.id)
> +			continue;
> +
> +		if (j >= i)
> +			break;
> +
> +		tile = gt_to_tile(far_gt)->id;
> +		dev = G2G_DEV(far_gt);
> +
> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
> +			guc_g2g_deregister(guc, tile, dev, t);
> +	}
> +
> +	return err;
> +}
> +
>   static void guc_fini_hw(void *arg)
>   {
>   	struct xe_guc *guc = arg;
> @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   
>   int xe_guc_post_load_init(struct xe_guc *guc)
>   {
> +	int ret;
> +
>   	xe_guc_ads_populate_post_load(&guc->ads);
> +
> +	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
> +		ret = guc_g2g_start(guc);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	guc->submission_state.enabled = true;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index fa75f57bf5da..83a41ebcdc91 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -64,6 +64,15 @@ struct xe_guc {
>   	struct xe_guc_pc pc;
>   	/** @dbm: GuC Doorbell Manager */
>   	struct xe_guc_db_mgr dbm;
> +
> +	/** @g2g: GuC to GuC communication state */
> +	struct {
> +		/** @g2g.bo: Storage for GuC to GuC communication channels */
> +		struct xe_bo *bo;
> +		/** @g2g.owned: Is the BO owned by this GT or just mapped in */
> +		bool owned;
> +	} g2g;
> +
>   	/** @submission_state: GuC submission state */
>   	struct {
>   		/** @submission_state.idm: GuC context ID Manager */
> @@ -79,6 +88,7 @@ struct xe_guc {
>   		/** @submission_state.fini_wq: submit fini wait queue */
>   		wait_queue_head_t fini_wq;
>   	} submission_state;
> +
>   	/** @hwconfig: Hardware config state */
>   	struct {
>   		/** @hwconfig.bo: buffer object of the hardware config */

