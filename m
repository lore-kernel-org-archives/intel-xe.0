Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81B0C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 15:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9F510E783;
	Thu, 25 Apr 2024 15:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYR0aEs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01910E783
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714059817; x=1745595817;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CyL1s2aetWKAvgLYzmtth1aWxc447IGlhWYMzEM5rMk=;
 b=mYR0aEs8u7peiZXa+N9x/R/3PY2OHrYt3uN0rz/RNDido9Y1p9FcE7hs
 AwViLq5S2JeVb8Ph3R8V7VRfYivbVDO2xbl1Hp2JAG/ehCDE/cXe3ag2H
 USY+gvRqQ0hCSU/m1hRhjcFmx0DDy6QzH0rIkVUrZTDyaooNP9s3EDA5i
 rqJflgIbEBXVM88IusJEUimDcPIZWVedcLA9DgxeQ4xpHcYjhJ/OtK3gl
 VhcyN2hPOZr6ZTUdgVjrzJg5dmLy5kbiMqc8x3uqEglqODTUlxwfMG0cJ
 ML0xCO9/gHhKQ6fF07nSpH+UhYbgRi48OiKgxR1SdJhZRhpfTPg7cgDqM g==;
X-CSE-ConnectionGUID: sZ7VD/jwT6isbVg/tMf0eg==
X-CSE-MsgGUID: i0Ke8D83T/q9Ti+aIFBuog==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20369780"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="20369780"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:43:37 -0700
X-CSE-ConnectionGUID: s/BnMV4dR4GmWN6/6i7SPQ==
X-CSE-MsgGUID: i2qWMy3BS02UtA4ZBJoClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25733956"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 08:43:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 08:43:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 08:43:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 08:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTzj4kN3OBewsWdjDYhoixNT/F+jyQF6TRbTbEZ15vTtgXrUvTRQnR2x96q3NIB6t4VtaBWW+8etY7ATT308Pr+HpjT+Xs3Pd/qOSADS7byhszVIcxNHUcLCjEHEYYebfSoPngxOSm2HtUzcCpDjZkwunb9UyINZTsb/Uclud2RSmuG43Oc80f03ClY0/z9SLNywuh4MLZVVuISbniBG1biDGeW57uYUQPE0o6UBQUYUB3g8Y1uHtUV+3qpeuXddXtQhibwH8Hvp489Qcq3otQfGvA5rI/NeL6x6Hysmw3hFAzCFMn56lKD2omMiCyHcYEkz7DTgzeDtPGWuirPG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Uarh2LnuAPFoC3Y+MD9la8yG2e/kWn/b+IWG8cSaVI=;
 b=fXhmSU+sVgwVxG1OsWCW7NRuHqFbctcDsg1XPh6PA3TrleJlkvT4MCA5jGiBdTBLmT4PVb6ZHk1fVOMje6A7gwWIy3fQMN9ywy2u55StEHqKeK6FnKVtCSSVC1Wd51QocjFeM64i+tAEmhu6E5qy7oitDpQ01ztJ6D2NaaTWd/DzoL1uhtfiieCsTxae5KKKdYdXNxdSi9cegkBok5Quzp8dkLM1UJ/2vn/mp9aMbTbOkjAVPlWJTa7CoGPXglC6+kQLC71S0f3MqaiSccwrfNL4zmojDDTFe5gl2arHQSZki9ie/SAbzsgqie7oX6x7FXjjVvG6Hk+w7RMp7tkV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 15:43:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 15:43:34 +0000
Date: Thu, 25 Apr 2024 10:43:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLktVbml0OiBmYWlsdXI=?= =?utf-8?Q?e?= for
 drm/xe/mocs: Add debugfs node to dump mocs (rev3)
Message-ID: <h2k4ge4ub2mb5qajpsm2ztbkd66jehfjgu6fgs4ie4smlhzout@waysj345xm47>
References: <20240422100550.1088856-1-janga.rahul.kumar@intel.com>
 <171388040608.1608578.16411915126041051402@8e613ede5ea5>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171388040608.1608578.16411915126041051402@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d45a5a9-c1aa-4512-4ab0-08dc653e7724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0FIZFdldkVvRjFBRDNrakhFb0VhNFZhdHhYNTFlWkdYMlhNaFRHajU1VHZV?=
 =?utf-8?B?ek5kTFlYckE4Rkwxb3ozK1ZjUjJ6VjFkM20vQk92Q04xTjR5T3R5ckZ6aUJO?=
 =?utf-8?B?UC90MEpGYlN4aTkzZFJPdVlFTCtKeHlSM0ttNE5CeWl2NVhIa1VIeDFaZHli?=
 =?utf-8?B?VVcrOThIRjZkbmZ0bitQOG5tSVJNTURNWEZSZDRhRkEwRzdrZHpQYmlOQTFt?=
 =?utf-8?B?dTE2YlBYS1VUaEVmOVkycHp0d0VOM21CNUpPT25RdHVBTm9jejh3YlpIc1Yv?=
 =?utf-8?B?eEhxaXJXSko0K1RzNnUzdjYxVGdJbEw0TjBmSXhmczdoN2NqUEx4Z1M0RHZr?=
 =?utf-8?B?ZWQvd0tLbm5zMHYxT2xmTCtlMnR4bTJEdmNBVnRQVjFnakt1R1NBWWZzS3hr?=
 =?utf-8?B?TVVPVG9CeERnbDl1R2ZhSVpXZ1ZqeVQ5TzdzMUk3RDJwaFdOVXhDdHRmYnpJ?=
 =?utf-8?B?UlQxYzJkd0JoWXE3VHRyYlN4Rm1qNmgvdGFiNi81WEdGK1FRUE10SG1PVE93?=
 =?utf-8?B?a0lSR1RkM1pZTUowTFdSV2E0c0JMUUF4NmJIZmZtZTBobGpIQkVUM0p0elZ2?=
 =?utf-8?B?S3IzZWo5cVM5bVMvVy9ZdFM3b05YdnBHdHF2VlBHZUVhd2p5RURzOVN4RFhx?=
 =?utf-8?B?L1c5dVZsVHZxOVlPQ04wWjNYcmV1Z0RJWEkzcmRpZU5kc0g5WG1YTUNFdFZX?=
 =?utf-8?B?OHdDQllFcEUrVU0zR3JtNTI2dHNXOEFmQTNTZzl6clVxaFgzS2dHNHZOSFdX?=
 =?utf-8?B?ZVdoRUQ3NHRZWFhUNjZwRkxqUkZRNHJXaWdRb09CMnE2RElHSDZxeWt0bEMv?=
 =?utf-8?B?VUUvaTJNRUFnaUowVWxiejltUlFFaHlRaEVtNFhiQW1tcXpyaGNvQ29WaUh3?=
 =?utf-8?B?UWJIVWhmSGVwaEhiNzBjVjdhbmcyTm1kY096WE04ZVJxT2hHaitKNUI4NTRD?=
 =?utf-8?B?VG5xK0R0T1pBTVFtVkJ4R3JGa0dNMlhGRXlzNys0bDNqMXJPUUJCV0I3dzh4?=
 =?utf-8?B?RHNvejBMOUxOSGZ5TzJKL1lwa05JQmVjSThySU8ydkJTVzZ2SXVndVlENFZE?=
 =?utf-8?B?dXZTdlBmeEdkdkJsVDhweHNLMURrazhrb3BLTFMzZWFWa1R4TjMyNVZPU2NB?=
 =?utf-8?B?dmoxSTdYSG15Z3E1N2NQazJWcTRXTEkyN05sYUlhNFlxaGVrM3BZNGs0TDlh?=
 =?utf-8?B?YkN1Y2dFVDdKbmxGTTc0RkdYeUVzZ0ppcG1hdkc1MmV2eW9RakNOVVVPZGVy?=
 =?utf-8?B?NEtvWHhXSDQrN0QvZ2xkQ1RsN3FUYkptd05rM3ZZRWlpM3ptWkY0MXdQNG44?=
 =?utf-8?B?NkxKSEY0K2hUQWVnRTNIUm45SHowRUoxN0tYTHJZNUpLUGNENUswb2hRY0Rs?=
 =?utf-8?B?QStsb0QreitaQk9vYlhuT3Fwc0g4enVBSWxVbGs3SEY5ZldQRDlYc0RlQzFC?=
 =?utf-8?B?aEwvR2I4eVNwdWNJSHNmUWZCWVNpZ1dsT1B5djRCR3lMN214LzNmVDlkQTFM?=
 =?utf-8?B?R2Z3R05xZUQ3VmJpeXJXSDVrbGV3aFdlV2pFdjdOcGJlTHdLaXY3aVIrZU0y?=
 =?utf-8?B?cUZCVUJ5SjdyQmJ3Vk5XWEhLalYyZmF6TmlhaktONWNNcTdvVi9SQm9XVXBz?=
 =?utf-8?B?ZmdpRjdVakRSUTh1bkp4L3Q4T0c3OGFzdmwwWjY1TWJnV1psNXpxV3hORXBX?=
 =?utf-8?B?MTlGSCtoWXY3TjIrNlVYaE45ZmlSZ1IyWW9UVTFFakZsZGFjYlBoRmZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWp2V3U2TXlLditWeVRhb1BCemJYVzRXUlFsaWJ2ZlRVZEZBSElGVVB5WG5j?=
 =?utf-8?B?Uk1pb0xENFlDNExudVRaSW1hbVkwTlM4bVVGNk5BWHhCRkt4VFF6K2U5RUNV?=
 =?utf-8?B?Wm1zTUsrYUJWRzBNQytvWGk2MVZORnlJZ0NOblkvcGNSN2lJbVR6MHhiNDJz?=
 =?utf-8?B?d2JaQ2prYXdWcTljK0dUUjFqNkNXUEVKb3pXeHArcjhjQVQzUitYY1BRbmY4?=
 =?utf-8?B?Y0Q3NHQ2L0RIdHBWS1diS0UxYyt3OUpPUmNYS0dDbmhqdGluVjlNTkFUaVdB?=
 =?utf-8?B?WnFYcHZtTWJ2MDBFYlhEQnl3ZllDN2Q3SklzRFJxdTV1aVYrT3ZjMVN2cW9C?=
 =?utf-8?B?SjgyMTBGd3lQYktXempjUGZDc3dSdFppMXRENlBBNnRYSm5qZTFiR01mMjZk?=
 =?utf-8?B?R1RjeSt5SnJkRG9VOFd6MHJrUTJMN0VWQzVpa05XVWF1TmNyQzlqOFkraTIx?=
 =?utf-8?B?SktnTXZTTFp2SFBna0RWbkZlelNiODYyV0VYZmNFd0FYT3lPYXl6L1FDdVRR?=
 =?utf-8?B?SGRzeExodWNRczdmaTdlWTVvdTNwL0JGbmlGQk5BRGsraXVZZlV6YXlVc3Br?=
 =?utf-8?B?Z0Vsa2tUZG1aY2ZvUi9vUEFqTU9QMGtHc1g1bFQxSFpLU01sNzNRdG1yQVdt?=
 =?utf-8?B?UEtGcUtwNXJmVGpnd1lxbEs4d1huaWRGYnh2L0RjL0Npc2RNR1BRc0h2VEhM?=
 =?utf-8?B?UFg1TXNxVXpoMlVPd01lNHQ0NDEwc0QyYjdKMWlyZE0wWERwNzlhbnNqeGgv?=
 =?utf-8?B?T2VUN3Bnd3dBVjYwWFRVVlhoTm4wdmFMRXpaeDlJUXBCLzJXUk42YlMyUDAz?=
 =?utf-8?B?RjYwOEswVVlMOGYvRmdOcTNDMHNVRlFjWFhaQkxLRkkwUlNYK0t2ZEswbDV1?=
 =?utf-8?B?aGxZYVZrQTVpd3dhcm4zeVFrTnBJZVJ6dUhWaTY4YkFiOFNQUWF1VnRCOENN?=
 =?utf-8?B?VDdnUkFTQklDdENKNnZQdXlUQjR0WjdzN1BaV2lpU0lxeEFuMUhaSUx5WWJD?=
 =?utf-8?B?bDlkTTJxS2hCdmtXUmlNeHB2dVQ2aFh2RHdwbGJJZnBQRkVHMFVnZVc1SVF5?=
 =?utf-8?B?dWQ5R2xtSytXRXZDWnNPU3JOajF1dG1nbTNieEVPS2E0S1NmU2U5TXRDQzhu?=
 =?utf-8?B?Wm9hVzQrR0ViZFllaFI4WksxTCtsR3FTbm5GNHhJajc0U3Vlbjg5QitWenhT?=
 =?utf-8?B?eTZiTVJLYlk0T1ZNZ0RWbyswSjFxOG8yTzlzeFNxbmZnamNpT2l3SzFyL2kw?=
 =?utf-8?B?MkNib0k3VkkvRkk3NXJpemoxZFpaLytmM3R3eGlwY0I2ZmtSV21YWldOekZm?=
 =?utf-8?B?QmI2YW9uU1hnUTVELzNwaVFVb0E2ZlBjQ1NRcnU2Q1FYeVkzUFd1ZFBaUTZJ?=
 =?utf-8?B?dy9ITTcwRkJSV0RhVThXYUV3MkxtejVZYUR2Qk04SU5yYUIySERKUzJsdVlH?=
 =?utf-8?B?Rm9jSEtpVWtvcDZrbWx5dkpPRVJNWGg4cWJUV2RzQTU5L0E5V2NHZFNjWlNK?=
 =?utf-8?B?a3QrMlFFN042WGNPL3lyMm1PWm4wNW02c3BtYmh3YmRjQS8yMVNSOU1xcUtL?=
 =?utf-8?B?Nk1IY0t0WlBxRGhvOTlQUGpsOHNHNEF5YTREV0prSDBXcE5Ga1p0dDMydEQv?=
 =?utf-8?B?WlQ3S0U0S3FYdUQwb2VQenpEQlc5alFIYzdOclRuaDBXMFk2UklhdzhQKzVK?=
 =?utf-8?B?bGxiQkdGT3h4OGdYQnIwaUdMckZCMEY1MXl1VzZPZ2ZuZHZWdGljbGNJQ0ty?=
 =?utf-8?B?TGZFMnFHcU02R0pOMlZQTlArN3ZNcmJYSFFjdmNtUVgvVVBjN2xGaHNWalBw?=
 =?utf-8?B?WmdNY3BnQTBNYnF5QTFQTlZjRzRlNWJtZHo4WTZHSU8rVGZyWUZuTFFCTUVk?=
 =?utf-8?B?OHphTUZwQ2lzTlVNRlBBWm5Sd25JNHJ5WW41UVc4QzRWVllnOWF2OU9UQUVD?=
 =?utf-8?B?NWdGeEF6bGZzY3Y2VlVqMnhjeWZXdk93VkFPd3hyOTV1VnJLcUJDeEJiTDVt?=
 =?utf-8?B?L1pSZ2V6YWJrRUZBSXJIcG5EV1ZMeThNc3F5MHlnTWpWZzNPSGZIWXBTaWJl?=
 =?utf-8?B?clptaE16aHdVZFlHM1lSb01nblhnck1nc3B0OXJaaUFHRkZ0QTRnL2I3ZCtF?=
 =?utf-8?B?bHEzTm00dEFiMFdwbFNQVFpwNFNCWUU2WGZDNDNZZDBabklhRUJ5WHRwUy8v?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d45a5a9-c1aa-4512-4ab0-08dc653e7724
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 15:43:34.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5d0zO2CTcDabVWA8uoVMNt6MOLeQrPikJrHTqETAn5l8GOsfWItcf4oWqc5XzBs2Psr6OG+J1IxV6Mx+gI3wTLGY36azdwGW/QCKeNsEPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5026
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

On Tue, Apr 23, 2024 at 01:53:26PM GMT, Patchwork wrote:
>../drivers/gpu/drm/xe/xe_mocs.c: In function ‘xe_mocs_dump’:
>../drivers/gpu/drm/xe/xe_mocs.c:820:2: error: implicit declaration of function ‘xe_device_mem_access_get’ [-Werror=implicit-function-declaration]
>  820 |  xe_device_mem_access_get(xe);
>      |  ^~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/xe_mocs.c:832:2: error: implicit declaration of function ‘xe_device_mem_access_put’ [-Werror=implicit-function-declaration]
>  832 |  xe_device_mem_access_put(xe);
>      |  ^~~~~~~~~~~~~~~~~~~~~~~~

looks like you're missing a include?

Lucas De Marchi

>cc1: some warnings being treated as errors
>make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_mocs.o] Error 1
>make[7]: *** Waiting for unfinished jobs....
>make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
>make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
>make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
>make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
>make[2]: *** [/kernel/Makefile:1919: .] Error 2
>make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
>make: *** [Makefile:240: __sub-make] Error 2
>
>[13:52:57] Configuring KUnit Kernel ...
>Generating .config ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>[13:53:01] Building KUnit Kernel ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>Building with:
>$ make ARCH=um O=.kunit --jobs=48
>+ cleanup
>++ stat -c %u:%g /kernel
>+ chown -R 1003:1003 /kernel
>
>
