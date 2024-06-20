Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44423C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 09:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AFF10E2EA;
	Thu, 20 Jun 2024 09:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0w44fh+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6365210E2EA
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718876332; x=1750412332;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=50RHqPbvtPxBIkEZ++9zcE03FuD5jdGjdOGpQxKYwF0=;
 b=i0w44fh+/NqkJAwri1Us9ymKi29ZMtC2OrtWPWWVcmKvKk8I+rqG0s5p
 nqwgt94WrnkzmbOqArfl42T4xx8ctKgWtLKj1W8BLfswvX7JxfYCFzqJP
 fV4YyubzCwUJBfRu2pxSrZ+v4oU1GyNzHdNOSx+FmyPLjzUgf7bOCdYxs
 bVJi9ukmPkSXri78A+fG2rJhuupU1tPTGp06X7fwOBPfJE1qPshvoNmUs
 3G/9tbMrWHjFui91awbSvmHiOIRbqxAbobPuTzE/CJeKdQk1Q1eT/JBnA
 Jqj4jcnUn3J5aBHVWpvugOE2A+WJ7jdRF3Qwsgh3EJNRdwSsQO1optth+ w==;
X-CSE-ConnectionGUID: NGULhBH9QmGLvOs6aafO4Q==
X-CSE-MsgGUID: VpPqZDXPQ7Cx6Fe5Du6bHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15961464"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15961464"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:38:52 -0700
X-CSE-ConnectionGUID: Cb6AkCegSSKHxvUUMmEj3A==
X-CSE-MsgGUID: sWe7oCeITmyI1OYmvx36+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="47095730"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 02:38:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:38:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 02:38:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 02:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6DFCa5QFkpkVeY9irUCHowBseJnAuOHqJNUcmxOMCHVjx4m8L9VAs67ATbLWUCOjs/oF6kAa5zeZ97jFtfNoBhLFx3Cq7t2xB1fbJNbKQ2xU2P1tSixuStoMztPBlvd78QlMRJnIYCXHt5i6jcomDBhziq2sT7RTTXYtu2nYNtmSStaZjqoaYAyqQ14bmtHr+vBvkf2BzXIXWCmuHpkiALY6Z+6zzr9WHMWdIvXxthPZI3HnjLkHQBAYVNCi9dyTeIHSBg/XusiXr89e7ZlVlFD3M0lYYo1vsD++v+4Y0hxl7ulsHdTmliJL88DJUCY1DkTVz7QBFMTDfgy2l30mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xPkFfP8JoIInCIjTFCkkToGdNtLcEYyQG/ShQaR23g=;
 b=kM3bfdds6dyhecjqUO9h8f2wuOzilKmIzUD14vIBN25Vzi/omSTE6rqfSJJBgtUDy4GybpmFksQWFQTPvuWYndCWbaiKDxg2MWMQhcgVeMEWmiVnacJAj5Akk09SE+/NSt4V8Ao1M5omxgRVdmxrw2q/kSwRvAXdjil5A3ZkWj2GmyWO8fRCKtuC3xsc8EXtqVp8YMkV+yte8z/KFQuxhH6/krZl399pE55tKq7uihVTTHz6ywewkG40c3i0hMgCq7a4W+obeZ/qssI6WvwVw7gGeuakyTxwfqtfqTssnzfruVOlB/IrtSFT/h7XiE+Z4W2iW/ynlQaRHfrdkDQGPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7765.namprd11.prod.outlook.com (2603:10b6:8:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.35; Thu, 20 Jun
 2024 09:38:49 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 09:38:49 +0000
Date: Thu, 20 Jun 2024 11:38:46 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/9] drm/xe/vf: Don't support gtidle if VF
Message-ID: <20240620093846.piqucigqc4fjlbl5@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619214557.905-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR2P278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 1932fa8f-6385-4886-e4dc-08dc910cc9d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0JyMUtzMk9EZHVJcGpYcnFXOVZjN3lHaDdNb0xlK2xmNDhEQzZSazNndncv?=
 =?utf-8?B?V0lPc2NHMkhGV0VTaWY0ZiszdjVnbFRDYVRYczNtY3VZWDVjZlFHLzdHL2pt?=
 =?utf-8?B?VG0wakQwYXBOMjZGa1FFV3JwaFRpdXNqOFNCb0xPTE1Sakw0ZytyZkNvNllN?=
 =?utf-8?B?WGVnSVk0eHlkTFJwc0VKNnFJNDhBWXR4UkdYNHFLU0pLakxMUmlmSGxuK3pG?=
 =?utf-8?B?YmtYNEtrdXRJOUVXb09Ic0o2bHczc0YxSitPR3BIS1QybHR6bG81akkzanNR?=
 =?utf-8?B?Z3JIUHlIOW5uZHlyMDFSMUtIWWl3SmM2cDZCQkY4TjB4SzRyYnZkY3duT2JT?=
 =?utf-8?B?cmwyRWZGc2FMa2pNSks3QzA4NVh3eVk1L054V3pYMlRZNkhzdEN5blRqR254?=
 =?utf-8?B?bzBEYWV3Q2NtSFlZT3NWZGlmV0VWTWNHRlcyVVVpL2krVnB5TWZtbnhqSXNp?=
 =?utf-8?B?eVI3Nm9IRDFkMWY3UWpIczBkYXF2SDJYenZicitrSDd6dFFHZzViOXhSSnNK?=
 =?utf-8?B?dnpxNXhMZUtyMWJhRTh2bEp2YktGY0VrT2ZKWFdGejRHSG9EclUxSlI2b2Nv?=
 =?utf-8?B?T0xmUW1RU0V3dHBUTmh4T3FHc2Q4NThHRi9HaVk4SEIzQUdGZGNvVUpSU0ZK?=
 =?utf-8?B?Ni83OG9iMWE2bDZ6YnB5VTdLalFJOTBmOHdEYVJ2d3RFYjE5c3JtZ1dKb2tF?=
 =?utf-8?B?ZjNCaXJTUE5LUzc3YzNSTWdqOHFkcHdLVnhURnpnNzAreWRlNktHaE56SkND?=
 =?utf-8?B?WXc5bTVqWHBRUFhFcmZacTVjdngvcFhSN29NK3RJNmE0R2Y4UEs5R2MyS3ZR?=
 =?utf-8?B?WmxxZjZtVU1aektabVRsdmVxVVhiZSt1d1Z6dlhycUpaT0RmSU1BdTVNWlVS?=
 =?utf-8?B?V09Sdk5uYktvQ29UVzZLSk95UHU3bElldXNSTUdkZk0zMSsyaVBtZzdYUUNE?=
 =?utf-8?B?U2ZMUUxkQ1d6UnRJd2lIY2VuWFVYbUw5WUhGOGF1V3R1TnAzcDNxQUVKMXJR?=
 =?utf-8?B?R1ZEaFdZZ3JmQ1lhQktDU0Zkc05xUmttTVRPNm5PRjZQclZEVWtDNHAydWpX?=
 =?utf-8?B?VGpPVVZsSzA5L3VKMUkydmhISG0zYzJFWk5nVkpWMGt0SytMU1hMZ1ArRjFk?=
 =?utf-8?B?RXh2NDFneFlEQzVIYjBEUnNCTjFjR0E1SGV4bFI4Lys2M0N5TS9FcEFEaFZS?=
 =?utf-8?B?UERsRTJUUzdWWGdZRzdCVHMzdEI0OHowM0RKeVdlWlp2ZXlNeGVkeWRvOU9n?=
 =?utf-8?B?ajBzbGdkOVFsOXNxZ01nN05QSThHdS9aZkJ5S0dVYXp1YTlmVFN3SlpjYjcw?=
 =?utf-8?B?ZHdmb0g2cjNYNTh5bVE1ak0zZTMxcE81cDkrUGQySFRhdXI4UHMyYzZVamxH?=
 =?utf-8?B?R0RKTW5pTEc1TXlmZzF6NHAzK3NVSEJ5S0kzblA0SUxtcHRZM1Z5ZHZ1d0lj?=
 =?utf-8?B?K3RuaklnWTZxNEczZUh2WlNQbXJnUVpZOTZBVlFVbitsWUFyeTNQWFZ0YWZQ?=
 =?utf-8?B?K25ROVFxWnpBOEhXY0RVdmIrN0FtZnRrNms4cDVtNCtETDBSdDU1dmdhU1oy?=
 =?utf-8?B?a0hrQjBxK1RKVTRJeFk2ZUREeFZJZTBQdFA2aDF2Q2JsMkxTaUhiUTRPT0I5?=
 =?utf-8?B?b1Z4SHR3RVVoKzZoaThVc0Nxblh2YkFIMm10dlJiNlZZaHFWajY0ZXoyK2RG?=
 =?utf-8?B?YnJnM2MyMDNybU9WNEZweFVITjlUREI5NS9EaUpJV1BUOFZXbkx3eVczbmRU?=
 =?utf-8?Q?stLuXMU0zSek3WlUrQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFGZjZ5RDVsYnF6dGRtdU9wSGY3SU9JbUxqUVRMQ0lWdS8yNDNVVVA0U1dD?=
 =?utf-8?B?cUJOWDIzNTdFT3l2NStMSWYzRUJKVDY4Y0ZOb2l2VTNxbCtpZ1grY3BMNVVL?=
 =?utf-8?B?TGtqZE1Uc3VRMytzdnlnZ0RaR1E5ZVNrSkxrQm44Y3V2U0F0OFZVSnBlK0dC?=
 =?utf-8?B?RG03YVhxSjhpSTlGTDljZytnYlB4MlZGa1NrTndITHhCTEt0djRjZWFuZHIv?=
 =?utf-8?B?a0FqVWVGNzRFTjBoRjdEMDZNODRMdnpYcTFRVmRPV2lTWWg1SGJ3bi8yMk0x?=
 =?utf-8?B?bktYY0l1R3BQNnd6WnZ2UklSazNRS3dqczJtb3I0VUhicllRK1hnOFRwRjYz?=
 =?utf-8?B?blJ2Vld4bzh4UzBQVFRFbEJqTG5EbEVwQ3dGMUk0MFZxUTR3N3lDMEhWVGhQ?=
 =?utf-8?B?YkVkVmQ5ZStnMUdnV3FIU3RlUzN0Z3dZUVRaYWlySnVTOXhzVy9mYzhWcEtU?=
 =?utf-8?B?cDFvNGJWdnFQdUNGYUczNjlYejVvRDlJVDU3dm40bExYMkJyRUl5Q1BvbTdl?=
 =?utf-8?B?QXo1Tmw0cmxkYjY2akhuNlpLSkd2MDEwR2ZJdTlVM3JrVGdqalRnQk9ta05F?=
 =?utf-8?B?cjBpbjFHUVQ3VHZnTTRUK0hMZ1BPNWZlcGZXMGhuMnpEeEZEbktIMG41TjVu?=
 =?utf-8?B?WGhtZWdFTk9FSWRLRExpYUtCV2pPTjJ6eHFTZ09VOTJobldzMnlTVUpHNnJG?=
 =?utf-8?B?OU1RSi82Umo1K3g4b0trd2xsVzJsMEpybmI5Qk9rdnpBZHk0YTBUamg3b0xT?=
 =?utf-8?B?YmNmZ3pDNE9SdGdwWEFySXJCemVHWjZxQk5ld2V1T1QybzFjZGttMlc0K1RN?=
 =?utf-8?B?emltalh1YTdBcXVpOHhPNzcwblo4R0xJM2hLOUxJS240UmRuSUFPRWlxY3Mv?=
 =?utf-8?B?aTkvOEtlVEJMdnVMSW9ld1F4aUJ5d1d5QmQxL3ZtUDBsUzdxV3Nzby8vL1Jx?=
 =?utf-8?B?YXlxYUNNckRCU3lmYXZYRE1IOXl5TUxvUktXZ2pkVXFncWNuUmhJVTk2VUIz?=
 =?utf-8?B?TFdtZ2hBaE5xc2dSVmRTTWRpS2FPa25NTExPQVQvNzdRY2w4WUdaWjVQNWw2?=
 =?utf-8?B?Um0raXdMcDRXR3FhdlFVc3ZEU0dVS3ZzcjNCaGx5eEhjTC91bHVLL1NXS0hu?=
 =?utf-8?B?WkFrUkJFaW9PdzBhL3QzTzZ5Z3FNUm5TMUlnL3dlNmp3MWZkVUZFYTA5NGdV?=
 =?utf-8?B?empmWitEakUwYVFxVTlPMm8yNjl0cXBOdHBUTThrd283ZnlBRm5tS1AxUmE3?=
 =?utf-8?B?ZU5rOFhuQnNzZDg1L0Y2N3VxR2Z0blFMUzhJTEpMalY4V1NPMW1UQndGQ3Fm?=
 =?utf-8?B?N2VrTWY0bnRlcUVQWkxhRmlVTU9iWGJqa1QwQmlCS3pmU0g1bmxqeEtDcG9R?=
 =?utf-8?B?aFo4L3Jab3JueE1aR3R3TDFLR2k2cUdiNGVEdmxZNEZ0L1JPd0tFSUlnL3Zj?=
 =?utf-8?B?bGNyay90d1RpR1RkNU11aDh3VVg3Zlk3djQ4Q2VPY3JIcHNMRlN2OG1JQzhm?=
 =?utf-8?B?SWlpN1M4YmtLalNJRndpempqdGpveTlDVTZocDlLYUtlaVN6VHUwcTB2TzZN?=
 =?utf-8?B?MithMHpRaTN6aDROVXRFWTAvU01ZVkl0WG9aN3lRaHluYzNMRW1YdTNjdmZK?=
 =?utf-8?B?aTYraG1EVHd2eTlhRmdHWXF5aVNDTlc5S0wyVnd3VVR2Mlc5akVoMmxmNERB?=
 =?utf-8?B?WElSdWxueGwyOUdIV3Ezeis4dS9ybFM3S0xkWjg5RmE4SWptVUxpOHF1QkFj?=
 =?utf-8?B?MTdldXVjUXd4R01kTkRiMjRnL0h5N0ZBOUlFUXBXWlRaeDVXZUJ0bTIvRDB2?=
 =?utf-8?B?QUpxUXJaOER4ODkrWi95c1NkZ2N2QU1JUi9nVmxsdSttVis5RkN5VHJSS0V0?=
 =?utf-8?B?Z05PaDVpQ1VmZkFVeXNHcjQyOE5lYlZrSE1iYWd3TmNuSFUrZ0pvKy9DT3dz?=
 =?utf-8?B?VlhGQWlkdDBoU0Npbm0xaWFaRXRjU3NtS25xSGtSU2V2MGNHR01HS0VjTTh0?=
 =?utf-8?B?bFZxK2tlUXdTRURBVzdLKzBJVkxFbnVidHRhR1JwRjlWUlppTkNSQXYrYzFW?=
 =?utf-8?B?d09KVFRSUVRuMGt5eUlBVExXVXFQSjh2L2QwbkIwenNxa1lCdWF3aUVEUkFT?=
 =?utf-8?B?Q3Qwb3VGSkduMGVkcFZnSW9hbGp0SitKNTl4RTBsRFVQWHFud3NlOGU4R3BX?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1932fa8f-6385-4886-e4dc-08dc910cc9d3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 09:38:49.2369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkDpNdXBqlWAzJ/XzIsbAH/vlX2ZB70NuwlqRKsJySYO5ioOq2NrbLZtVjZpwxw0SKQ/Ef8sG1SLQhq6TDxhZEV6Zb9af4a3i6zFn4HrF0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7765
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-19 23:45:54 +0200]:
> VF drivers can't access any of gtidle control registers as this
> functionality is owned by the PF driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 5d6181117ab2..67aba4140510 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -15,6 +15,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> +#include "xe_sriov.h"
>  
>  /**
>   * DOC: Xe GT Idle
> @@ -100,6 +101,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  	u32 pg_enable;
>  	int i, j;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	/* Disable CPG for PVC */
>  	if (xe->info.platform == XE_PVC)
>  		return;
> @@ -130,6 +134,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  
>  void xe_gt_idle_disable_pg(struct xe_gt *gt)
>  {
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
>  	xe_device_assert_mem_access(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  
> @@ -214,6 +221,9 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>  	struct kobject *kobj;
>  	int err;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
>  	kobj = kobject_create_and_add("gtidle", gt->sysfs);
>  	if (!kobj)
>  		return -ENOMEM;
> @@ -246,6 +256,9 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  	xe_device_assert_mem_access(gt_to_xe(gt));
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
>  	/* Units of 1280 ns for a total of 5s */
>  	xe_mmio_write32(gt, RC_IDLE_HYSTERSIS, 0x3B9ACA);
>  	/* Enable RC6 */
> @@ -258,6 +271,9 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>  	xe_device_assert_mem_access(gt_to_xe(gt));
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
>  	xe_mmio_write32(gt, RC_CONTROL, 0);
>  	xe_mmio_write32(gt, RC_STATE, 0);
>  }

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.43.0
> 

-- 
