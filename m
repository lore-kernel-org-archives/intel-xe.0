Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D182ECCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931BD10E11C;
	Tue,  7 Oct 2025 11:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8LOMLwH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE1510E11C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759837657; x=1791373657;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zvNt+89099qc5BiuqjZFuHrpN72UMPCe8yCCiY0hmRQ=;
 b=T8LOMLwH35seTkU6FExlMhSBwKqvLvewsHTal2hSzJdm4vPeya40IX2U
 TNUsE1g05QiZwPY/uNIGLIZQDK6In+JSR4a+BZDzr8cTVOqVgq+qPKPN0
 GtsMCJDGav/BGoYvxmiMp+AqbsHU+tFjy0+b3sZx/3y4kf87ZWoK1PHKb
 NiyXTteEV0P0tpIZWMSa6a6Og3oiyPLMpGH1Pba1JK/CL62ZYrCImISuD
 Jk8HlTR7k22jB8IUoTsd8vgbOec26x8jJQ+6O7xTu53z+S0WvE3pCB/v5
 dS+hNAEHIyQ7iQxHh31vgAp21S+H/hIxR+BQHoTxx0wdA3CviYri6V9MQ g==;
X-CSE-ConnectionGUID: Jot6P7BvSnqKtTVWmFl4IQ==
X-CSE-MsgGUID: C7nRf57UR+eIHJP+APxkZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61051773"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="61051773"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:47:37 -0700
X-CSE-ConnectionGUID: efAKCRRNR7WvgWfd1rJkKg==
X-CSE-MsgGUID: IFIj8AH+T6GROi6eByVg7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180057208"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:47:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:47:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 04:47:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXgSgaEqfGQftNa3OzsRbN3Ox3SotOLqn1dvfp6mb+FGy2hMomNjPOWDkZv6YEAggaLD8NyKR3RsRlaxefrqVjPU3TJ2VF218OK0UCencBg55dLM0yk5vLFEkjZxSAkynJYKN3dWx0Z5AL9Us3kzFysk0BEa0fwVa9auO7+dW0r5ofqvHpoFc29ja1K1Np2oIRddGY1TNHkn5yNJawmvIYpHKD0vgpi98QbXxp43qPfRdtCVY6uDGWsL7o5lMcQfQYgKwgRM+MskzFH5TumAMypO0RzyEp4Y7R7Tzjvxf/8f3Ueid9bhvwy2cwBaCp/aEuH8YrJw8bU5AJV0pS0ohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyJfStbICtDmDdd1tuOvGvXNohxFrXIvVsauOT+E1Sc=;
 b=juUaE4R/L3+ichspzM6ozj/ZBc3RRrP/++xG9UzE+RUE/XLLFVizUK+FALY6uOPe9uDqtY7PawZStNz72R/FwV5/ADKT4y/JeFYah9C2dGi3eH/j8+dW1ShgaTRP8+RtIU54yGFTCewKlBOAmhtdDqxZRTuk286YCIS+Mc1K0yYvS/Hu3nSy0W1NUtJsPAzUKUUm8xDtdjy1uaWM0tLcPLwulIWJUaw3vPeTKPAlWN9X+4NXFh5+dBnPVUkrKWkLQZwqkKRLGUH7t8Ofehq56THE62w06NWEbHQ/xllUi9p0474cwR0n6hkYn8wKGEy4he7ZQFEWJi8nPxlDGuP79g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 11:47:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 11:47:30 +0000
Message-ID: <f5d2328f-8069-406b-bda8-1d98803fa568@intel.com>
Date: Tue, 7 Oct 2025 13:47:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/32] drm/xe: Move GGTT lock init to alloc
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
 <20251007112641.2669655-12-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251007112641.2669655-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f1638b-ea49-4796-a2a9-08de05974b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFZUWXNxV21nK3ZBVnlYQ3JkYm50eHNlc1d1b1NiejFZV1RCSnJFeU43cytJ?=
 =?utf-8?B?eFUrTDhTdVFKa09qYnlES3hJWDNma20wWnYxS2szbStMcG1JaDR6K1d6cm1G?=
 =?utf-8?B?ajN1Rk5GbFAxUlJOQTFZRG9jL0l0MTZpOVZjd25zN1hVTG5XaXF5UGpKdWZp?=
 =?utf-8?B?azJOVmwyUXEza1BVWjlVTVFERm16QzBraGFwY3hqWENUSy9zQU50c3c4cWtB?=
 =?utf-8?B?Ly9NNk9Qb3BwWW1PL0I4bTJQSmVZNm13Q3dCb1ovV3RHcmtCWUZCS1F3b2F2?=
 =?utf-8?B?YlU4Z0pyazNQTm1obEx1a1VKTmltbU9MaWdpR0Jid3NGb1daNEExYUlOK2Q1?=
 =?utf-8?B?TDJYSEk4aXFOM051TG14SUZmaU9hZEJHdEtjWDZISEZGa21JSUV4ZXlNc2RM?=
 =?utf-8?B?a1VCdlFOVk04dFZXVjNHZTVMZjd3aVRrbnVBcFdwNW13cUxkZFpoNmxIZ3hv?=
 =?utf-8?B?RmI2V1hxQkpYb1M5NS9JdHFwMnVSanlZbmhaY1FhRFhiWTg1Z3VQZFU0SzMr?=
 =?utf-8?B?WUN3a29NK01ZM1dWVm1GWGUvRmVaOWxvVHBBUTNNZ1RQaCtRb3RoV3oxZUp5?=
 =?utf-8?B?ZnNzVDgyS0FqMjJCQWFwK1BJNWFra0drcngyaWQxclFQVGtXNkZHSFltdW14?=
 =?utf-8?B?djUxdzJ1RWVQdlY1UkIzS3djSUhCb3UxS2kwSjgxVmY2WXFQNWJFTmVEZ2d5?=
 =?utf-8?B?OEpKZHRiUVRhZU5jVWw3MTFFbzRvcmtpdkxIMkczU1VEZ3FDWTVjUFI1TVFH?=
 =?utf-8?B?N3VpTkZaWEVnUkJrQkFUUFkydGM1OW8yZDNGR0g1cldXNFV5SG1JdVExMzJa?=
 =?utf-8?B?em9PcXZ1cWVjb1FRYzU4UncrVUR3NWd1SXR0ZSs1Q2FXa3pHMXR0QnFrYjV1?=
 =?utf-8?B?Zk5KQlBWYWh2bnBaRXNvNDBzVTJPbnR4SHVoT1kyTnE1S1BvT3Y3eE14TVpW?=
 =?utf-8?B?WlFXakI0WG9oeEUrL1l6eFhyWE9WY00xMnFUWkZ4MzFNNnMrWlROWDRVMjk3?=
 =?utf-8?B?WmRLUlRKV2NHbmxzWWw0ME1lZmZzalBmdmI4R1dsdCtwR3pRNWtTN2Z1NUhN?=
 =?utf-8?B?Wm9vUjJ3c3pVOGRoZGdtdFM3c3ZCYmQraEozYVhhU2c5RmtLZXptY1JqQ1lX?=
 =?utf-8?B?TTE2S3ZYcEFzMzc2NHlubzByOUVOWmdFM2ZtZzkxdUtHMlkyQnhnR3JDRmhK?=
 =?utf-8?B?OUZ4WEkzKzMrMEdZRkg4d0EwaExGNjR6VnQ3bytabmg2NS83ZnNyUnpPUVZK?=
 =?utf-8?B?ZXY4M2pnTU9MdkVjcXZzMmlTZWpZUVpGLzFQSHk4MmlTRGc4OEZwKzhZSGNx?=
 =?utf-8?B?RkxUWWxVRUhBa3dtbVhJVC80V0FxRVRNUEMzb2g1MCtDc3pjQmhEOSthYTZj?=
 =?utf-8?B?aC9qelFYN0dXczJGQlJlTmNHVC8vS0c3WW0weEFaeTJ1SndvSDhFOW5wNFhy?=
 =?utf-8?B?NkFPdlNnU3ZoQkxoUzdJc1YwVGZBb1IyNXMzOWM5K3d2WTdBVDJPVzRpa2pr?=
 =?utf-8?B?S0NCbXFidDlhUUJmdzdTMXFNeGxPZlFaVnlXb3pQNkVjbXNaKzgzMklFV2Uy?=
 =?utf-8?B?NUVsZUk2VS83eDd1bmtrTTlvVUYwcUN4ZWF3dWFmQUpjWGs2SVpwOERSOEEy?=
 =?utf-8?B?VTRhbEYwOEpVNGhjSDcyMDRPV1BwWndHcjVpVURPVS94c3NxaWs2R3FxZVBX?=
 =?utf-8?B?NHgyaEpuOHpteHVIUDJQS0tPRHE1QlNzUlFNNHVxNzRiT1NzQVh5Rms1T1p4?=
 =?utf-8?B?YTkveU1kZ2hXT1pmT0RXdUVzZTNyRzROMWlpOHREVUJRZFdMMFRYcTgybHpY?=
 =?utf-8?B?aGYyRkJiM3JIN2hXTkxOR3VySWFkRGJCeEJxa3FraGZHQlZIcytLOVd5VEJ1?=
 =?utf-8?B?MHFYdWowckxpUnIranFGNjAwYlM0YVoxNVN3dGh5Mk5oZVl4QmxoN095ZVZn?=
 =?utf-8?Q?HFs3Qcddbfvmpm6LLHkO/GFlkO5k4sGM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXp2dTFaTHMzRVRnOVQwclpFaDhzTVZ1RzdlZ3REZ3cyRVNyZnVVUDhjZVZR?=
 =?utf-8?B?bkg1bjJNazRsbjB1dDFvaW5FTUlpanlVOTlBc0ZxSWNjNU9XcGJOL3dLR3lP?=
 =?utf-8?B?amEwVk1BWUVtL1VDQzVjT2RaTFFWUitybnN0c0hpUTk1bEoxYWNyQUthcHc2?=
 =?utf-8?B?VlIzNlJZYWhURHJ0VlorN2lYSW44Umg4R0Zubk0xakFWMHh4MEYvT3puSUNO?=
 =?utf-8?B?RUpmTXRCdWhyYncwRmNGUVZmTW5EVk1saUxTTnVENUJaQk9uK254TXNvTVVX?=
 =?utf-8?B?R2gxK0dGZTJoVHpxWGlOdzNId1BiaEZJaFBwQXRMdkJFUU0zeC9yT2hnb3lR?=
 =?utf-8?B?NHdVM3o3RElMc3YzcnBaOEpyc1BjZW4ySTlvSzRqUkRWSEFHQ2xpbjlCMUJB?=
 =?utf-8?B?M1BNQ2N5N2MrZWlEU25QTHhVTGU0eUFsUUtxa2hGQm9DRk1xUXlnRjRYa0JE?=
 =?utf-8?B?L2d2NVIxeXFsaU83MkJ1U29VeTNuMFF4akJuQVRrT0ZXdEo5MWdEL1pDQm5E?=
 =?utf-8?B?UHlHcWtSQzJ3TDY5QzFsQjgrQUtLY3BJWWR1ZkptWEIzM3J5MGRHL2didnJT?=
 =?utf-8?B?WUxoYTdhMGcvam1FNTF3ZTBrcDg1bnlmY25WMytXdWNmVXBudlpMSURwRFVs?=
 =?utf-8?B?SkpwYkhyL1BUZklyTkZNWStGUEtoNlNldVR5SWgrRXdmdlFtK0tzSVR5dFdU?=
 =?utf-8?B?Mm1KSjJMWHc4RUp2RHVvak5Xa2h6TW83UG1KQzZkUmdKVWFwaURQQmNMTndk?=
 =?utf-8?B?SHB4Ukw3ODBXRERvQlphbHNsaXhwbTZoU0cwSHBOc2lpbWx4MzJucEZ3Rmo4?=
 =?utf-8?B?NmdYbjR2bDFlR3lLRW9uVzBGbUZCUE4vbllpaGFFNm5oTGNCRkt5TTlpYzYv?=
 =?utf-8?B?ai9XQWRVNDB3WlRVZWlyZ2RzaW1Uam1DSDZxZjIvWkJiNHVxRFZKYXlLQTJ1?=
 =?utf-8?B?TjZhblFjNEVSK3MwNVkxMEErQjJ1NUhuNGtLZlJqMHdRNFAvbTFjZUEzbTRh?=
 =?utf-8?B?STZONkMvL215NGt1TVBjc0o5WXVyR2doUXlaT2dCdkNLbzMxdmVHaTlKMStG?=
 =?utf-8?B?RFc0Z2pKNklYVngraE14VkN4a3RqVFRDSTZ0NS9yR3E0VzRQOTBZSzVVcTVF?=
 =?utf-8?B?YjhPd2Izakh2ekk4TzRrVzAvUkFoai9hak14RTUvZXp4ek5ZWnpLZW9hK0Fj?=
 =?utf-8?B?VHV2QmJ6bU9CWVYvZkpDUU5OUzVOdmlkVHlQNzAvcXVZdlg0aCs0RVh1cTZX?=
 =?utf-8?B?dDN4azJSclIySHRtZlMvSW4yay93MzBQQ2p2M1FtREw5bDNWQ1o2R0NFU0dP?=
 =?utf-8?B?cE5USUVEYUFNendCS1ViVFpXRHFnZDk1dWtLYkw1OGtRKytFdG9GelBrSUFt?=
 =?utf-8?B?MXJUWStzYTZMOER0ZW13MFBjeE9FWDNRb3cyUEtwcVduYnpBNmVIeXVIYlB5?=
 =?utf-8?B?RDY4dFdQcFRoYWYwL2wwSDhvdGlnNWpjVXM1MVhHaDd1ZkJpc0dkV0VleVZ4?=
 =?utf-8?B?WkNiTitSYTRXa3NUL0NzQTlsdWpOQUZHaGVZcnhEQUtSSWhrSVZnQkxEa3Iv?=
 =?utf-8?B?US9Qa212dldETG9Tb25YekVibWloK2NQVUMrWU9RM2oxMjJpLy9PU0VxM25s?=
 =?utf-8?B?aEY5R1RVemR2Rjh2dWMzNmNhNTBLUG9kZ1hrYld2OVJoSHo3M1FRVVZ6UGwx?=
 =?utf-8?B?K2dURDRYVDB4UVBFajBSZnplUkVMc2pxTitic3R1MGh0cDRJL05yTkpJY2xL?=
 =?utf-8?B?N09DVGs3V2RhTS81ZTlQS1hsZWVtejVGZEpZQndNS3hNQ2V1NkhQY0NvbzZ4?=
 =?utf-8?B?L3BVeGs1TDBvbEhRZFRHNDVMV3lvTG9SWWJvNVRsUkdsVndHbGkxRXErNDd3?=
 =?utf-8?B?VVVVRlpNaWUwN0J2NXIzV3pUaUp1T3JreTIwV0NvUTlVZ2oxejMra3FHb1l4?=
 =?utf-8?B?TTYycy8vZERHaG5lUWVSWkFFc2ppTFVZYWNqUTlBVmRkUHp5M0JTRVFaU2pz?=
 =?utf-8?B?NmFTNWJicTN0NXRWbEhtMWRkZGlFVldXTDg5Rm9xM0l5c1JxZVQrZEtlME5h?=
 =?utf-8?B?ZEwvblpGYnRIUDhWTDUvYVhyYmVTMEJWdGliVGpwUDJNZmN5SXlGelptUUJ2?=
 =?utf-8?B?Z3ZBU3JxeU8zQmJSMjE4cHhIak9pM0NBaGVieXM5bTVnNnY5Y2MxQUZjTFZT?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f1638b-ea49-4796-a2a9-08de05974b90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 11:47:30.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKHfk6j+KXqq9iK//EfNDR9uVZ8PeRVOxNrPMwFyBrnZ+giwOEPG3JDve7qnEmDlLnPdxpP18lMdjLuYPZ1kKgiY17JsPUWOxjh37F4kzlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
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



On 10/7/2025 1:26 PM, Matthew Brost wrote:
> The GGTT lock is needed very early during GT initialization for a VF;
> move the GGTT lock initialization to the allocation phase.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7fdd0a97a628..f7717057cd14 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -159,6 +159,16 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  	}
>  }
>  
> +static void primelockdep(struct xe_ggtt *ggtt)
> +{
> +	if (!IS_ENABLED(CONFIG_LOCKDEP))
> +		return;
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&ggtt->lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +}
> +
>  /**
>   * xe_ggtt_alloc - Allocate a GGTT for a given &xe_tile
>   * @tile: &xe_tile
> @@ -170,8 +180,19 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile)
>  {
>  	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
> -	if (ggtt)
> +
> +	if (ggtt) {
> +		int err;
> +
>  		ggtt->tile = tile;
> +
> +		err = drmm_mutex_init(&tile_to_xe(tile)->drm, &ggtt->lock);
> +		if (err)
> +			ggtt = NULL;
> +		else
> +			primelockdep(ggtt);
> +	}
> +

all this looks over-complicated and against the rule to exit early on error, so maybe:

	struct xe_device *xe = tile_to_xe(tile);
	struct xe_ggtt *ggtt;

	ggtt = drmm_kzalloc(&xe->drm, sizeof(*ggtt), GFP_KERNEL);
	if (!ggtt)
		return NULL;
	if (drmm_mutex_init(&xe->drm, &ggtt->lock))
		return NULL;
	if (IS_ENABLED(CONFIG_LOCKDEP))
		primelockdep(ggtt);

	ggtt->tile = tile;	

>  	return ggtt;
>  }
>  
> @@ -180,7 +201,6 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  	struct xe_ggtt *ggtt = arg;
>  
>  	destroy_workqueue(ggtt->wq);
> -	mutex_destroy(&ggtt->lock);
>  	drm_mm_takedown(&ggtt->mm);
>  }
>  
> @@ -198,16 +218,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
>  }
>  #endif
>  
> -static void primelockdep(struct xe_ggtt *ggtt)
> -{
> -	if (!IS_ENABLED(CONFIG_LOCKDEP))
> -		return;
> -
> -	fs_reclaim_acquire(GFP_KERNEL);
> -	might_lock(&ggtt->lock);
> -	fs_reclaim_release(GFP_KERNEL);
> -}
> -
>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>  	.pte_encode_flags = xelp_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
> @@ -227,8 +237,6 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
>  {
>  	drm_mm_init(&ggtt->mm, reserved,
>  		    ggtt->size - reserved);
> -	mutex_init(&ggtt->lock);
> -	primelockdep(ggtt);
>  }
>  
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)

