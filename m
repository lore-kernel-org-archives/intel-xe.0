Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E89C369D1
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 04:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109B010E27D;
	Fri, 25 Apr 2025 04:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tb70ghko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3D010E27D
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 04:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745554483; x=1777090483;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iW6AE9EFAu4jVmSFGKBAUXEHWyLEZsYZ+Ury09R7FMg=;
 b=Tb70ghkoV0AFCYfg4Zu1xIv1qnHwOPcoOv4Z83iQePW9CFQoK/gxjXZd
 aRgqvWqu1zy68na/+vp560115h6kK9BvhYeuO7P+nuVQJGcp2N7l4etn+
 sD4gmMADrHOMs9kaYbHspjQCXAC3XUYHiUtAx3qi/qDStrpc5PsLmZwBJ
 BsvO9jkFAK8kM4ctjNBaHleZWeSy09rD1Z159Lj4T+zadEeZIdVpCDquG
 k/xR9INvtwf3x9BjLYsVIBZTgeE+IRc4OKyKDtyrKytTSiGzLQmLXONhh
 xd9VymHTndVRDH2g+AEyfDrP0r6OhpgUFXKcU3UPCzbkP6tLOzYNeFOkP Q==;
X-CSE-ConnectionGUID: PQT5ES1TTXKsTaHCvrT8/g==
X-CSE-MsgGUID: lSrvb0+8QdeSNUISxSyT0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="49867544"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="49867544"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 21:14:43 -0700
X-CSE-ConnectionGUID: rZTN8INnQqan49y4jHnkrQ==
X-CSE-MsgGUID: goZSeAMNSCyAReTO3XsZPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="163762184"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 21:14:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 21:14:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 21:14:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 21:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIw0xQPoolr86lLEHXNqTUvq2p9AsKxy5raFT4i1yElj2+1DCJWWrhGVC4EUuE5hwW6oAAr+vZ4AUHYr97owxPjTP4YwkUZmk4uBOr89kv2OjMLpc+HkCB+gf50T01p9DNnlNJJ7vnN21MxXCJOSu5xsWJR/TGz28l2EU89GVosi2OJEMiUCwBSCbY56vuLN9Jg+QxXSLBd8QUra1eXxn+twU8MZYArQ/hSDOT9cNTTY2bhhYzDfZTysJu0NtZGZvNlDEEbAughoZzwpZAZY8n4FCy/A6L7O4djz5Rg95CTV4z4Ob9a3mPj0f/z4FYLR2a3TM4KYTNBN/VZAQ7o//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up41MxckcqlwYf353EZ9alwDTi53L/2qVJiCmZJh6JQ=;
 b=jyj+qdno+/Kb6YxkUPDCuA07p56UrX3NnUgWlRowGM+zqJOIpjvNDMV1MaQOmtGTSt36T5ol37HFUuj8gIc+QLEUsEp0Kd1k1ljgii25PUjXE6eHgbN9O/RhOK/3Uy9/MlxKk4qdYHc5CF0OoqfP/Bc172S+rOvtXsI5OHTWq2YxXuy+zyx7zQqick9zFIMaGfPbXzCzOXULw5pXJrtzzN3FlwDBUappjuinYm2DmaAfNz5IY78vpaT6UDZ3EBLA4ugFHiiyuMPdS1JyPpIvsOjv9itGOnDU9pVGMizPRf8l39VF9344ia5kvcgKATW1Yh6WYFhJKNN/ya+jyZYHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB8026.namprd11.prod.outlook.com (2603:10b6:806:2dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 04:14:39 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 04:14:39 +0000
Message-ID: <7e74e4da-3985-4e97-bca3-a129987aa53d@intel.com>
Date: Fri, 25 Apr 2025 09:44:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/xe/hwmon: Add support to manage power limits
 using mailbox commands
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>
References: <20250423191320.3599837-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250423191320.3599837-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::31) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9d7953-5279-437e-d790-08dd83afb26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmwxczVMYmhpcjBqTWxJejRQbnhvbWRFL25PYk5FQlVYSk04SGhmaUtoWFpP?=
 =?utf-8?B?UnN0RVFldWNHREtFblpxcmN6bWVMTlAvN2h0S2h2TWcyTC9XbE05Y2JldHJw?=
 =?utf-8?B?OWxDT05lV0pIK1RldG5rcm94TW5pNzd6MTlZUGxmMjE5cTBjUGNkbDhENjU5?=
 =?utf-8?B?V0NvUHFGalU2VkxsUDN5WHE2cFdXYTBsV3EzZy95cTNkTVJTcWNxY052S0RN?=
 =?utf-8?B?d1FtcE5rQURhNTlsWXM5SHFSRTc3cytjaGZsampDMVJlSE9uLzFnSytvbFda?=
 =?utf-8?B?dXNpdjVia2kwQzlnd2F6VjMrWVdUZWdCOHVjbnVBVnNybnFwVXB3WWxDbGFh?=
 =?utf-8?B?bEJ5OGlpWCtIREpRc1ZQTVB4d3JyUnpiLzVPNzlhN25wUHhJQ1VHVHFwY0ZG?=
 =?utf-8?B?b1oreldVcWQ2alRrTjFkZk1va05ZcldmM0xTTjVuM29taHYwUzhXV3duaXdY?=
 =?utf-8?B?aFBkZ1pQN3BKeEp5bEJweWJqN1VtSGhUU3lPemd0SGg0NzV0QkdaTXl6Y3JZ?=
 =?utf-8?B?TWpOTXhvclROV3l6SWk0bXRsU3ZwYlpJZHE0aVlHWE41Q0ZGZkp6a0ZnZ3p6?=
 =?utf-8?B?cGV1ZjEvbndRcktRWFRPcmpKWndra0RRcmVuZlo1b3BUODJjWjJuN1NISGF4?=
 =?utf-8?B?eGVSa29uVGZORGYzUzh6bzljUERpdUNJVkxzY0Q5V0g5ckJEeVp4b056Mld4?=
 =?utf-8?B?U2hEenpKN1RDSldWbzZheUEyWS9qeWxFN2FkZGxzQi82cGMrNmZEanNGMHlm?=
 =?utf-8?B?dnJHdzEzakJlVUh1QnRaL2xLK3RLdEpoa3VDSm52dS9IdWF1MUFFeHNKN0tp?=
 =?utf-8?B?Wng5MmFlcjUzL3JhUzhZcEtHc3N6V1ZFSmd2V0l0OEJqYjRRM3ovL2pqZE5Y?=
 =?utf-8?B?dmVQVDd5YVR5Ty9DaWVLQlh2d1NtMkc2ZWlJU01PNGJ2eFZaeXgzSWYxYXox?=
 =?utf-8?B?eGsyeU4vN012SDh4Rk1IUnk0MlR1VTVXV2x4N3oxd3FYcWxCM0tRc0U2MVA5?=
 =?utf-8?B?WStFb2U2M2x1RXIvSHpIajZITW84clNOQkFrQThOKzBtWHlnR29yMnUwSFZS?=
 =?utf-8?B?aWhWa1hCWXJSL0JnUEFUQnVuSGFZTlo5Q2k3YjIrNW1VMVBCdmpTREdDWDQ3?=
 =?utf-8?B?cGh0SjZTREczZDl1US9KZHhrbnZsbVYrQytEVEs2MEdJRUpxSjFiM1BKR1ZU?=
 =?utf-8?B?S0J2L1Zzd0NwRFRWSjFHd2J3bW5xdUdqS21wYkJMRGw5UnZBNXhGLzVMcEZw?=
 =?utf-8?B?SkN3OStBV1dXSXpsYzBFbWt1elJxRkZ4NlJ4Z1BldnUzMktmdkdVZmlkY2RR?=
 =?utf-8?B?OTlMT1psQk5QUjlrWm53R2l0T0NSSnhNRHNoTUhKTW9oaEpCaWk2L01qY0F1?=
 =?utf-8?B?WFJlRURHclpLT05OdXI5RVRZVDNxVUo1TmNOTE40Nk1ONVhyejhubEYwTW9L?=
 =?utf-8?B?VGR0SjFlU29FbnVWcGkxZlBkZzdXTW1rN21lR3p6UjF3VGNISUJ1cjJwQnlp?=
 =?utf-8?B?S1J1RlRQNmJCWHNVYnRteFZ2V1JoQ1Vrc3dBWGVaRTFGWkQ2SEZXMUpQRmZE?=
 =?utf-8?B?OEFNM0t0dnY1VDNOallkWTR4Tzg3bmtuc0RQZk9VLzlYQUM2NU4zQW4za2ZO?=
 =?utf-8?B?YWU1MVhiY0pyU3NhMGtZOFgrRDZSRWpFWGhQR1drV3ZaUWJSSENQTkFWeVpJ?=
 =?utf-8?B?NTA2bkVIa3lLSEk1N2lFWC9MVFNEanI5cWUwdTdJWWZXWUNtelJna0NZSS9I?=
 =?utf-8?B?SzFtOFJsVVp4bGhWVk0zbzRBbUpLNGJsOUg4bmY0T1RCY004bXI3c0JYclpG?=
 =?utf-8?B?Sis0OS9xT0phSjdNTTRjZDZieThnWE13T0Ira0NqRUxKSjZKRnZtMUZ6aisr?=
 =?utf-8?B?Y1FyVGFFMlRiay9rcFlLd1U0N1J0SU9uT3ZhVFplSlk0QVhKVHNjT05YOHVy?=
 =?utf-8?Q?gTgSuYYKp2w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG1XbzIwYTdDenEyRmwrYW0vZnpnY0w4WDNjMGRqRktsUmNHOWNTUk1sa0Vs?=
 =?utf-8?B?eDFXVVprWXJGdHorN1JOZ3BOSU5yeVV5Wm9sKzlVeVFxRWdGOFV6OGhrZkZI?=
 =?utf-8?B?cGIwaVpvTHFnSUJJaVM3QVR6blZ6NmFCenI3Sjg5Yis4MnNxbFhTcit2R2pR?=
 =?utf-8?B?SVNEL1ZjTTdOM1J1Q1p2MzdQeGlwQXM4cW01bkxER3B0Snc4T0FQOUlYRGUv?=
 =?utf-8?B?MUhRU0V5TFJOWDJUWG9hZWRpM1A4VDJOU2QvdUM4Zkd0Ukpud2RzejcxKytO?=
 =?utf-8?B?MmpRZFVVK1BLMllaWWx6UEhvRCtBQlk5U05BRE9ZeUpYZkJ3QUlIWFZlNlUy?=
 =?utf-8?B?bnM3SThlcnNvWUpyTDc4NEdaU0dOZ1IxTkRoS0wrS3JkUkt0Um9qTXJESG9T?=
 =?utf-8?B?aUVHRGF1NGFoZ1E2UzdsOHcxVEtOenlac0phQ0kyRmRxQ3c3R1pjNVl6ODNR?=
 =?utf-8?B?M2hQRzBVNkFObUc1clJ1MXVSMk52bWw1Yk5qazNZUUZ6TW0ya2RoRU4za3k1?=
 =?utf-8?B?Q3YwNDE2eEI5ZU10Mi9HTTJHeVZrMEVWMDlxZHhWak9zYkg4WVpZV3hkZjQ2?=
 =?utf-8?B?MmRXL1NFYlJTZVhlT282UUR4bldqWWFWVTBpcUwxNGZnVXJwU1VCRlNOUGd5?=
 =?utf-8?B?NHlBY29jZDF1Uys1RDJHN1Z2K2NxY3FucXNFZUpIT0N0Wk5YVmVNV3JTaE1T?=
 =?utf-8?B?akJBTGhITFJ3OHVQWURQdEt1NnBwY1VsWjE2SFgxTklBbFBsNUduZEM3QTJq?=
 =?utf-8?B?WXhzbGM2UENXcXIrUVY1b2pNSjY5KzYyZDZwdG1xeXppOUZhWmllY0pDYkwx?=
 =?utf-8?B?Uk9mVlJuRFFla0FIT3k0eGlPSEtOS05EQjNIL2NvWVdVWFA0Ni9BRjN3WE9U?=
 =?utf-8?B?d0xaZmY1ZWhSOFQ3K0lBWWJSbEcrQlR0dHBXN0RDcVZaZ1Y4TjZuUHh2NGdP?=
 =?utf-8?B?UHcxMHZRbVJTVEFPUVFLaTY1T0tRNGxUN3RnUlV2YkVNWThIVlVnV3RWbFFs?=
 =?utf-8?B?OHF1dld1RnYyK2kyVmQ3VFRmUUp2UllxSkM1NjhTSWplUFFhVmdVRG1wTzVQ?=
 =?utf-8?B?RDZjVUNDS250Z3lpelB5ZENxQlNvWWJjbVFtendoMkQ4dnBOTzdiNVRxU2ZR?=
 =?utf-8?B?dUZuaFpDeHllZkFuZU1hQytYOEhIeTNpSjhiL1lSU3ZaeGhkQ3BDcWppajA0?=
 =?utf-8?B?aVBpWjVXcnBCbS8xejU1S2xIVUFQb29QWGhReTVna093eW55RmhiajJDVno2?=
 =?utf-8?B?ZlpqcW8wdjFoRVJVQ0l6c2hwVnpkNUwrOFV1aFFoZmNVbTFhUmI3bUUzZzc3?=
 =?utf-8?B?Y2pqa1M3eGdlbFhYUWF5QnYyWkdYcUI0RUFPT1Nyd1hmbkhwMVplVWlRWHY1?=
 =?utf-8?B?Tm00dmNYaWRmMFF0WUl6U0w1alQzVWpBWUJyTjJrbXZrdWNKRnZRUlhsM3ZQ?=
 =?utf-8?B?amhvSmdoWjlEaVcrRFhod1ljVXhhWkZXNVNIUllJNGhTTGo5TkpvakxRMGFC?=
 =?utf-8?B?TzQ3Q3JrNmloTXlORUxDMHBPOERnZDhwcWhtNmVJQXNxNkFOZUl5M0YyYW44?=
 =?utf-8?B?VHVjNjVna0NRVVBQVTNiU0YwUW56cWVIdnhkSnd5aE5SNWhJNG9ZcWh1WTRH?=
 =?utf-8?B?a2FBQzBsWktRUHBCQlI5bXpJYUxHdVVMSjVNZGxpRHZaMzQwc0t2RnN4bFc3?=
 =?utf-8?B?cDBoTFpUQUR6WXRvVkUwRUtoSno5KyttRklhSi9sYWVUeXQzaXpyL2NJL2V4?=
 =?utf-8?B?cm5naXZYZ1dhRVRJZkkzSlZ6MmU4dmZyWi9SUXFlck1OTWJUV0h4MksrV0Z5?=
 =?utf-8?B?RWg2MjlVMFBZamtucXFtT1RpSFJSMTdlbytYdkswY0VlN0E0TXhpYU4zbHAx?=
 =?utf-8?B?ak5VK1d5RVNOakJnZFpmL1N3UjVlUC9KMTB0aCtmMDhYSUxkR0ZUeGVzSUdZ?=
 =?utf-8?B?RzJzUktTbm1tOVNjSUw2dDVZZEVXV1lJbk4xdE9UMURsd1k5bk55MThEL0RG?=
 =?utf-8?B?Y2trN0I2T21UYXVhVGxHRXl0WVZlVXYwY3FETXhVNEh1cVVxKy8wRmhPOFQy?=
 =?utf-8?B?WmVzVW82MW9BVTNsd1RISjk1Qkk0V3l0ZDkwdHB5bGlZd0p6SlY5aS9iSXpv?=
 =?utf-8?Q?g3z6luRIEE7aK99V/uqHTZeW2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9d7953-5279-437e-d790-08dd83afb26e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 04:14:39.6050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shhQEIDil9KyIKJ+iaD1zc5jNS/NWUDMTEhkSHpPWKNxU2ggqVE0TE4gsY7+q0IJkURK4xjVsfKaQvo/yxPNuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8026
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


On 24-04-2025 00:43, Karthik Poosa wrote:
> Add support to manage power limits using pcode mailbox commands.
> Add PL2 support for platforms with these mailbox support.
PL2 is new attribute being added here, please add it in separate patch.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |   6 +
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h  |   4 -
>   drivers/gpu/drm/xe/xe_hwmon.c            | 412 +++++++++++++++++------
>   drivers/gpu/drm/xe/xe_pcode.c            |  11 +
>   drivers/gpu/drm/xe/xe_pcode.h            |   3 +
>   drivers/gpu/drm/xe/xe_pcode_api.h        |   7 +
>   6 files changed, 341 insertions(+), 102 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index f5e5234857c1..144c66e4e97d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -44,4 +44,10 @@
>   #define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
>   #define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
>   
> +#define   PWR_LIM_VAL				REG_GENMASK(14, 0)
> +#define   PWR_LIM_EN				REG_BIT(15)
> +#define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
> +#define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
> +#define   PWR_LIM_TIME				REG_GENMASK(23, 17)
> +
>   #endif /* _XE_MCHBAR_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index c7d5d782e3f9..c556a04670ee 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -18,16 +18,12 @@
>   #define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
>   
> -#define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> -#define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>   #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>   #define BMG_FAN_1_SPEED				XE_REG(0x138140)
>   #define BMG_FAN_2_SPEED				XE_REG(0x138170)
>   #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>   #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> -#define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>   #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> -#define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
>   
>   #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index eb293aec36a0..909722d32b54 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -51,6 +51,21 @@ enum xe_fan_channel {
>   	FAN_MAX,
>   };
>   
> +enum sensor_attr_power {
> +	SENSOR_INDEX_PSYS_PL1,
> +	SENSOR_INDEX_PSYS_PL2,
> +	SENSOR_INDEX_PKG_PL1,
> +	SENSOR_INDEX_PKG_PL2,
> +};
> +
> +/*
> + * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
> + * not supported and below are SKU units to be used.
> + */
> +#define PWR_UNIT	0x3
> +#define ENERGY_UNIT	0xe
> +#define TIME_UNIT	0xa
> +
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    */
> @@ -60,6 +75,19 @@ enum xe_fan_channel {
>   #define SF_ENERGY	1000000		/* microjoules */
>   #define SF_TIME		1000		/* milliseconds */
>   
> +/*
> + * PL*_HWMON_ATTR - mapping of PL1 and PL2 to corresponding hwmon power attribute.
> + */
> +#define PL1_HWMON_ATTR	hwmon_power_max
> +#define PL2_HWMON_ATTR	hwmon_power_cap
> +
> +#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
> +
> +/*
> + * Timeout for power limit write mailbox command.
> + */
> +#define PL_WRITE_MBX_TIMEOUT_MS	(1)
> +
>   /**
>    * struct xe_hwmon_energy_info - to accumulate energy
>    */
> @@ -100,8 +128,78 @@ struct xe_hwmon {
>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>   	/** @fi: Fan info for fanN_input */
>   	struct xe_hwmon_fan_info fi[FAN_MAX];
> +	/** @use_mbx_power_limits: Use mailbox commands for power limits */
> +	bool use_mbx_power_limits;
> +	/** pl1_on_boot: power limit PL1s on boot */
> +	u32 pl1_on_boot[CHANNEL_MAX];
> +	/** pl2_on_boot: power limit PL2s on boot */
> +	u32 pl2_on_boot[CHANNEL_MAX];
> +
>   };
>   
> +static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> +					   u32 *uval)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	u32 val0, val1;
> +	int ret = 0;
> +
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> +						  (channel == CHANNEL_CARD) ?
> +						  READ_PSYSGPU_POWER_LIMIT :
> +						  READ_PACKAGE_POWER_LIMIT,
> +						  hwmon->use_mbx_power_limits ? READ_PL_FROM_PCODE :
> +						  READ_PL_FROM_BIOS),
> +						  &val0, &val1);
> +
> +	drm_dbg(&hwmon->xe->drm, "power limits channel %d val0 0x%08x, val1 0x%08x, ret %d\n",
> +		channel, val0, val1, ret);
> +
> +	/* return the value only if limit is enabled */
> +	if (attr == PL1_HWMON_ATTR)
> +		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
> +	else if (attr == PL2_HWMON_ATTR)
> +		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
> +	else if (attr == hwmon_power_label)
> +		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
> +	else
> +		*uval = 0;
> +
> +	return ret;
> +}
> +
> +static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
> +					    u32 uval)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	u32 val0, val1;
> +	int ret = 0;
> +
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> +						  (channel == CHANNEL_CARD) ?
> +						  READ_PSYSGPU_POWER_LIMIT :
> +						  READ_PACKAGE_POWER_LIMIT,
> +						  hwmon->use_mbx_power_limits ? READ_PL_FROM_PCODE :
> +						  READ_PL_FROM_BIOS),
> +						  &val0, &val1);
> +	drm_dbg(&hwmon->xe->drm, "%s, pcode read ret %d\n", __func__, ret);
> +	if (attr == PL1_HWMON_ATTR)
> +		val0 = uval;
> +	else if (attr == PL2_HWMON_ATTR)
> +		val1 = uval;
> +	else
> +		return -EIO;
> +
> +	drm_dbg(&hwmon->xe->drm, "writing limit val %x channel %d\n", uval, channel);
> +	ret = xe_pcode_write64_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> +							     (channel == CHANNEL_CARD) ?
> +							     WRITE_PSYSGPU_POWER_LIMIT :
> +							     WRITE_PACKAGE_POWER_LIMIT, 1),
> +							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
> +	drm_dbg(&hwmon->xe->drm, "%s, pcode write ret %d\n", __func__, ret);
> +	return ret;
> +}
> +
>   static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>   				      int channel)
>   {
> @@ -122,29 +220,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   		}
>   		break;
>   	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform == XE_BATTLEMAGE) {
> -			if (channel == CHANNEL_PKG)
> -				return BMG_PACKAGE_RAPL_LIMIT;
> -			else
> -				return BMG_PLATFORM_POWER_LIMIT;
> -		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			return PVC_GT0_PACKAGE_RAPL_LIMIT;
> -		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
> +		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			return PCU_CR_PACKAGE_RAPL_LIMIT;
> -		}
>   		break;
>   	case REG_PKG_POWER_SKU:
> -		if (xe->info.platform == XE_BATTLEMAGE)
> -			return BMG_PACKAGE_POWER_SKU;
> -		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			return PVC_GT0_PACKAGE_POWER_SKU;
>   		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			return PCU_CR_PACKAGE_POWER_SKU;
>   		break;
>   	case REG_PKG_POWER_SKU_UNIT:
> -		if (xe->info.platform == XE_BATTLEMAGE)
> -			return BMG_PACKAGE_POWER_SKU_UNIT;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>   		else if (xe->info.platform == XE_DG2)
>   			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
> @@ -181,7 +269,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   	return XE_REG(0);
>   }
>   
> -#define PL1_DISABLE 0
> +#define PL_DISABLE 0
>   
>   /*
>    * HW allows arbitrary PL1 limits to be set but silently clamps these values to
> @@ -189,67 +277,88 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>    * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>    * clamped values when read.
>    */
> -static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
>   {
>   	u64 reg_val, min, max;
>   	struct xe_device *xe = hwmon->xe;
>   	struct xe_reg rapl_limit, pkg_power_sku;
>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>   
> -	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> -	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> +	mutex_lock(&hwmon->hwmon_lock);
>   
> -	/*
> -	 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
> -	 * So not checking it again here.
> -	 */
> -	if (!xe_reg_is_valid(pkg_power_sku)) {
> -		drm_warn(&xe->drm, "pkg_power_sku invalid\n");
> -		*value = 0;
> -		return;
> +	if (hwmon->use_mbx_power_limits) {
> +		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
> +	} else {
> +		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> +
> +		/*
> +		 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
> +		 * So not checking it again here.
> +		 */
> +		if (!xe_reg_is_valid(pkg_power_sku)) {
> +			drm_warn(&xe->drm, "pkg_power_sku invalid\n");
> +			*value = 0;
> +			goto unlock;
> +		}
> +		reg_val = xe_mmio_read32(mmio, rapl_limit);
>   	}
>   
> -	mutex_lock(&hwmon->hwmon_lock);
> -
> -	reg_val = xe_mmio_read32(mmio, rapl_limit);
> -	/* Check if PL1 limit is disabled */
> -	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> -		*value = PL1_DISABLE;
> +	/* Check if PL limits are disabled */
> +	if (!(reg_val & PWR_LIM_EN)) {
> +		*value = PL_DISABLE;
> +		drm_warn(&hwmon->xe->drm, "power limit %s disabled for channel %d !, reg_val 0x%016llx\n",
> +			 PWR_ATTR_TO_STR(attr), channel, reg_val);
>   		goto unlock;
>   	}
>   
> -	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> +	reg_val = REG_FIELD_GET(PWR_LIM_VAL, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   
> -	reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
> -	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
> +	if (hwmon->use_mbx_power_limits) {
> +		/* No MIN_PWR defined, using boot PL1 */
> +		min = hwmon->pl1_on_boot[channel] & PWR_LIM_VAL;
> +		/* MAX_PWR is PL2 on boot */
> +		max = hwmon->pl2_on_boot[channel] & PWR_LIM_VAL;
> +	} else {
> +		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
> +		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
> +		max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
> +	}
> +
>   	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> -	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>   	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> -
>   	if (min && max)
>   		*value = clamp_t(u64, *value, min, max);
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
>   }
>   
> -static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long value)
> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channel, long value)
>   {
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	int ret = 0;
> -	u64 reg_val;
> +	u32 reg_val;
>   	struct xe_reg rapl_limit;
>   
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>   	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>   
> -	mutex_lock(&hwmon->hwmon_lock);
> +	/* Disable Power Limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL_DISABLE) {
> +		if (hwmon->use_mbx_power_limits) {
> +			drm_dbg(&hwmon->xe->drm, "disabling power limit %d on channel %d\n",
> +				attr, channel);
> +			xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
> +			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
> +		} else {
> +			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN, 0);
> +			reg_val = xe_mmio_read32(mmio, rapl_limit);
> +		}
>   
> -	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> -	if (value == PL1_DISABLE) {
> -		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN, 0);
> -		reg_val = xe_mmio_read32(mmio, rapl_limit);
> -		if (reg_val & PKG_PWR_LIM_1_EN) {
> -			drm_warn(&hwmon->xe->drm, "PL1 disable is not supported!\n");
> +		if (reg_val & PWR_LIM_EN) {
> +			drm_warn(&hwmon->xe->drm, "Power limit disable is not supported!\n");
>   			ret = -EOPNOTSUPP;
>   		}
>   		goto unlock;
> @@ -257,26 +366,38 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
>   
>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> -	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
> -	reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> +	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>   
> +	if (hwmon->use_mbx_power_limits)
> +		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
> +	else
> +		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1,
> +					reg_val);
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
>   	return ret;
>   }
>   
> -static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
> +					  long *value)
>   {
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> -	struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> -	u64 reg_val;
> +	u32 reg_val;
> +
> +	if (hwmon->use_mbx_power_limits) {
> +		/* PL1 is rated max */
> +		xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
> +	} else {
> +		/*
> +		 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
> +		 * for this register can be skipped.
> +		 * See xe_hwmon_power_is_visible.
> +		 */
> +		struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> +
> +		reg_val = xe_mmio_read32(mmio, reg);
> +	}
>   
> -	/*
> -	 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
> -	 * for this register can be skipped.
> -	 * See xe_hwmon_power_is_visible.
> -	 */
> -	reg_val = xe_mmio_read32(mmio, reg);
>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   }
> @@ -330,20 +451,35 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	u32 x, y, x_w = 2; /* 2 bits */
>   	u64 r, tau4, out;
> -	int sensor_index = to_sensor_dev_attr(attr)->index;
> +	int channel = (to_sensor_dev_attr(attr)->index > 1) ? CHANNEL_PKG : CHANNEL_CARD;
> +	u32 power_attr = (to_sensor_dev_attr(attr)->index % 2) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
> +	int ret = 0;
>   
>   	xe_pm_runtime_get(hwmon->xe);
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index));
> +	if (hwmon->use_mbx_power_limits) {
> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
> +		if (!ret) {
> +			drm_warn(&hwmon->xe->drm,
> +				 "power_interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
> +				  channel, power_attr, r, ret);
> +			r = 0;
> +		}
> +		drm_dbg(&hwmon->xe->drm, "power_interval show ch %d, attr %d, r 0%llx\n", channel,
> +			power_attr, r);
> +	} else {
> +		r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
> +	}
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
>   	xe_pm_runtime_put(hwmon->xe);
>   
> -	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> -	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> +	x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
> +	y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);
> +	drm_dbg(&hwmon->xe->drm, "power_interval show x %d y %d\n", x, y);
>   
>   	/*
>   	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
> @@ -373,7 +509,10 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   	u64 tau4, r, max_win;
>   	unsigned long val;
>   	int ret;
> -	int sensor_index = to_sensor_dev_attr(attr)->index;
> +	int channel = (to_sensor_dev_attr(attr)->index > 1) ? CHANNEL_PKG : CHANNEL_CARD;
> +	u32 power_attr = (to_sensor_dev_attr(attr)->index % 2) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
> +
> +	drm_dbg(&hwmon->xe->drm, "power_interval store ch %d, attr %d\n", channel, power_attr);
>   
>   	ret = kstrtoul(buf, 0, &val);
>   	if (ret)
> @@ -419,14 +558,20 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   		x = (val - (1ul << y)) << x_w >> y;
>   	}
>   
> -	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
> +			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
>   
>   	xe_pm_runtime_get(hwmon->xe);
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index),
> -			  PKG_PWR_LIM_1_TIME, rxy);
> +	if (hwmon->use_mbx_power_limits) {
> +		xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, r);
> +		r = (r & ~PWR_LIM_TIME) | rxy;
> +	} else {
> +		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
> +				  PKG_PWR_LIM_1_TIME, rxy);
> +	}
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -435,17 +580,28 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   	return count;
>   }
>   
> +/* PSYS PL1 */
>   static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>   			  xe_hwmon_power_max_interval_show,
> -			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
> -
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL1);
> +/* PSYS PL2 */
> +static SENSOR_DEVICE_ATTR(power1_cap_interval, 0664,
> +			  xe_hwmon_power_max_interval_show,
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL2);
> +/* PKG PL1 */
>   static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
>   			  xe_hwmon_power_max_interval_show,
> -			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
> +/* PKG PL2 */
> +static SENSOR_DEVICE_ATTR(power2_cap_interval, 0664,
> +			  xe_hwmon_power_max_interval_show,
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL2);
>   
>   static struct attribute *hwmon_attributes[] = {
>   	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	&sensor_dev_attr_power1_cap_interval.dev_attr.attr,
>   	&sensor_dev_attr_power2_max_interval.dev_attr.attr,
> +	&sensor_dev_attr_power2_cap_interval.dev_attr.attr,
>   	NULL
>   };
>   
> @@ -455,10 +611,20 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>   	int ret = 0;
> +	int channel = (index > SENSOR_INDEX_PSYS_PL2) ? CHANNEL_PKG : CHANNEL_CARD;
> +	u32 power_attr = (index % SENSOR_INDEX_PKG_PL1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
> +	u32 uval;
>   
>   	xe_pm_runtime_get(hwmon->xe);
>   
> -	ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;
> +	if (hwmon->use_mbx_power_limits) {
> +		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
> +		drm_dbg(&hwmon->xe->drm, "index %d, uval %08x\n", index, uval);
> +		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
> +	} else {
> +		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
> +						       channel)) ? attr->mode : 0;
> +	}
>   
>   	xe_pm_runtime_put(hwmon->xe);
>   
> @@ -478,8 +644,9 @@ static const struct attribute_group *hwmon_groups[] = {
>   static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>   			   HWMON_T_INPUT | HWMON_T_LABEL),
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
> -			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP |
> +			   HWMON_P_CRIT,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> @@ -491,14 +658,18 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret;
>   
>   	/* Avoid Illegal Subcommand error */
>   	if (hwmon->xe->info.platform == XE_DG2)
>   		return -ENXIO;
>   
> -	return xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> -			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
> -			     uval, NULL);
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> +						  POWER_SETUP_SUBCOMMAND_READ_I1, 0),
> +						  uval, NULL);
> +
> +	drm_dbg(&hwmon->xe->drm, "%s reg val 0x%x, ret %d", __func__, *uval, ret);
> +	return ret;
>   }
>   
>   static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
> @@ -506,8 +677,8 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>   
>   	return xe_pcode_write(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> -			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> -			      (uval & POWER_SETUP_I1_DATA_MASK));
> +						    POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> +						    (uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
>   static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
> @@ -603,20 +774,27 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	u32 uval;
>   
>   	switch (attr) {
> +	case hwmon_power_label:
>   	case hwmon_power_max:
> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
> +	case hwmon_power_cap:
> +		if (hwmon->use_mbx_power_limits) {
> +			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> +			return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
> +		} else {
> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>   				       channel)) ? 0664 : 0;
> +		}
>   	case hwmon_power_rated_max:
> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
> -				       channel)) ? 0444 : 0;
> +		if (hwmon->use_mbx_power_limits)
> +			return 0;
> +		else
> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
> +					       channel)) ? 0444 : 0;
>   	case hwmon_power_crit:
> -		if (channel == CHANNEL_PKG)
> +		if (channel == CHANNEL_CARD)
>   			return (xe_hwmon_pcode_read_i1(hwmon, &uval) ||
>   				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>   		break;
> -	case hwmon_power_label:
> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
> -				       channel)) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> @@ -628,10 +806,11 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_power_max:
> -		xe_hwmon_power_max_read(hwmon, channel, val);
> +	case hwmon_power_cap:
> +		xe_hwmon_power_max_read(hwmon, attr, channel, val);
>   		return 0;
>   	case hwmon_power_rated_max:
> -		xe_hwmon_power_rated_max_read(hwmon, channel, val);
> +		xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
>   		return 0;
>   	case hwmon_power_crit:
>   		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
> @@ -644,8 +823,9 @@ static int
>   xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
>   	switch (attr) {
> +	case hwmon_power_cap:
>   	case hwmon_power_max:
> -		return xe_hwmon_power_max_write(hwmon, channel, val);
> +		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
>   	case hwmon_power_crit:
>   		return xe_hwmon_power_curr_crit_write(hwmon, channel, val, SF_POWER);
>   	default:
> @@ -965,23 +1145,59 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   	int channel;
>   	struct xe_reg pkg_power_sku_unit;
>   
> -	/*
> -	 * The contents of register PKG_POWER_SKU_UNIT do not change,
> -	 * so read it once and store the shift values.
> -	 */
> -	pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
> -	if (xe_reg_is_valid(pkg_power_sku_unit)) {
> -		val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
> -		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> -		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> -		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
> +	hwmon->use_mbx_power_limits = false;
> +
> +	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {

Introduce has_mbx_power_limits flag for BMG platform.

Thanks,
Badal

> +		if (!xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
> +						     &hwmon->pl1_on_boot[CHANNEL_CARD])) {
> +			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
> +
> +			hwmon->scl_shift_power = PWR_UNIT;
> +			hwmon->scl_shift_energy = ENERGY_UNIT;
> +			hwmon->scl_shift_time = TIME_UNIT;
> +
> +			if (xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
> +							    &hwmon->pl2_on_boot[CHANNEL_CARD]) ||
> +				xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +								&hwmon->pl1_on_boot[CHANNEL_PKG]) ||
> +				xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +								&hwmon->pl2_on_boot[CHANNEL_PKG])) {
> +				drm_warn(&hwmon->xe->drm, "Failed to read mailbox power limits\n");
> +			} else {
> +				/* Write default limits to read from pcode from now on */
> +				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
> +								 CHANNEL_CARD,
> +								 hwmon->pl1_on_boot[CHANNEL_CARD]);
> +				xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> +								 CHANNEL_CARD,
> +								 hwmon->pl2_on_boot[CHANNEL_CARD]);
> +				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +								 hwmon->pl1_on_boot[CHANNEL_PKG]);
> +				xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
> +								 hwmon->pl2_on_boot[CHANNEL_PKG]);
> +				hwmon->use_mbx_power_limits = true;
> +			}
> +		} else {
> +			drm_warn(&hwmon->xe->drm, "Missing support for mailbox power limits !\n");
> +		}
> +	} else {
> +		/*
> +		 * The contents of register PKG_POWER_SKU_UNIT do not change,
> +		 * so read it once and store the shift values.
> +		 */
> +		pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
> +		if (xe_reg_is_valid(pkg_power_sku_unit)) {
> +			val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
> +			hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +			hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +			hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
> +		}
>   	}
> -
>   	/*
>   	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
>   	 * first value of the energy register read
>   	 */
> -	for (channel = 0; channel < CHANNEL_MAX; channel++)
> +	for (channel = 0; channel < CHANNEL_VRAM; channel++)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>   			xe_hwmon_energy_get(hwmon, channel, &energy);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index cf955b3ed52c..9189117fe825 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -109,6 +109,17 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
>   	return err;
>   }
>   
> +int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
> +{
> +	int err;
> +
> +	mutex_lock(&tile->pcode.lock);
> +	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false);
> +	mutex_unlock(&tile->pcode.lock);
> +
> +	return err;
> +}
> +
>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index ba33991d72a7..de38f44f3201 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -18,6 +18,9 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
>   int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>   			   int timeout_ms);
> +int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
> +			     u32 data1, int timeout);
> +
>   #define xe_pcode_write(tile, mbox, val) \
>   	xe_pcode_write_timeout(tile, mbox, val, 1)
>   
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index e622ae17f08d..8c8be7c5f47b 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,13 @@
>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>   #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>   
> +#define	READ_PSYSGPU_POWER_LIMIT		0x6
> +#define	WRITE_PSYSGPU_POWER_LIMIT		0x7
> +#define	READ_PACKAGE_POWER_LIMIT		0x8
> +#define	WRITE_PACKAGE_POWER_LIMIT		0x9
> +#define	READ_PL_FROM_BIOS			0x1
> +#define	READ_PL_FROM_PCODE			0x0
> +
>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>   /* Frequency Config Sub Commands (param1) */
>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
