Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85176CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 23:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C1F10E0DA;
	Wed, 15 Oct 2025 23:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjWCHRRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD1410E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 23:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760569569; x=1792105569;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=klCSJA+3kqdEdO46SVZh7aMTjQMFyRnf9eXhHxFnRKM=;
 b=QjWCHRRaiIPln5x7V8b21oRXjTeGHGvw3wCaLlb8EXkx/8EfyDxrYiGw
 rO7frH4HaOIdl4oJIAhAFZKVg7SAbFLZ9MTWnWpHiQDbEk4KFuT49YCpW
 QTBe0aUOU8++vO8igHnFXV4YzBJindgoxAZ/WK28PZH90W+RHrTg7g469
 lnQAUL9FR7TuGauOFSC/ag8L+WNhf+V0CVlzO7MbfGys8gN9Nhg6imjAH
 ifDK9VN+dzaAiv4gdFf1WMfFluXWMc6/Fzm6stL2KAGGpsCyaVqrpcWVt
 uxuTzn5Cy9YpE2lYHfoPhG+22BxmqEeEjJyUEmDhkABFxUdUNBe6Px/Rk w==;
X-CSE-ConnectionGUID: xgEan1f3Sa+AYKAXYx5j9w==
X-CSE-MsgGUID: 0fCjuW19RtmzvGDtlG9VgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62650861"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62650861"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:06:09 -0700
X-CSE-ConnectionGUID: 22aYB64PSXSfw/O8V0/s0Q==
X-CSE-MsgGUID: N2epB/+1RbK4N6QRc+aUXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186704558"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:06:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:06:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:06:08 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:06:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhUSzcq350troKD2zn22svmXppzWpqZv4i5cROiin7zKkgmqx9iHA1Y4hqCLI1fKXZWu39ey7o99O4s5JHTUdnn1m0H9b0QR4RaK2oFgymwg1u3Kkm+wh/q0QoqBGvYnsG0/fEk81j/kxvT0n50CVC0RCzwXLrvlowR3fdRD5IbN93rSIwlLXw/Yhx7YfwVXaWZ2Ej7frb5vWg6Bnv1X7I8N0Lt4rI/Jk4dADgQtDlP8yuw8vhfWOUiBihvfxM2Ob6e3T/iHcLAgefyyeHRICdLDXJAlxzSJKk+//jeHraYs0vefU3JXgeLlVHtvUdvzvWB/gcxluYQdqz9d1pc0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY7yqN+127zL3WCHmh4TXYltj3li2ozCRkBDgZvTSSw=;
 b=vCTkLnIRUw+lz8q0oYgUOD12TU4gBeWU000Bn8x5KyBTaHugsoPAYT9E4qs15HUYFbICQYzkIp2uPBgl0G53hcoLMVrBXfwV7JMFE5SvgwljBFbH8VtgalvCD7BCKEdx2v7LgOz8qm+9MPJy8aCSxgUpoB65ZyXNPryXhbVGt2Vlua4ivXP28zSxgGfF2Pu1+59f2mfPGjdUNxsbknaBf9vznvVmqeJ0uY76pxvpk4pY45ET3qxSuwFyIWdJevsA9w+aXVX0IET09NYe/1eM/bHhN6/F7NoT038vX0PA3gkbXwbflrIQsbwJj1VXKZgKVS6Kpl35ONVszpETSi1X3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA3PR11MB7416.namprd11.prod.outlook.com (2603:10b6:806:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 23:06:05 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.9203.015; Wed, 15 Oct 2025
 23:06:05 +0000
Date: Wed, 15 Oct 2025 16:05:58 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 23/23] drm/xe/xe3p: Add xe3p EU stall data format
Message-ID: <aPAo1peMIoiiEplw@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-23-bfb74f038215@intel.com>
 <20251014191139.GA5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251014191139.GA5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0290.namprd04.prod.outlook.com
 (2603:10b6:303:89::25) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA3PR11MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2f55e7-7fd5-474b-518c-08de0c3f6b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzZSOXV6SGhBeUdiQVRwS1pYbEdpRDFVV1NNc3JBL3VFTFhIV2JjOXJSejZJ?=
 =?utf-8?B?YWdNN2pscVlyVTQ0QjVPWlExL2NVcW5rZ3NXY05WdnlQM1czbG8zYlhjSUNR?=
 =?utf-8?B?bWl4WmZMUVhxQmlBVC9vUUkrV0lkMi9TRjFiUWRBQWRYWENJcVFvY1dOSHVs?=
 =?utf-8?B?M2p3S1d1blVaTjBrTkcyYXFVaExzVzQxcHRib1dZUEdCSTZXcmhCZkNJZEw1?=
 =?utf-8?B?VUI4TVpBQ0JEMlZaZytVZjBCSVloSWVPMWlrZkprWnNzYzc2b3k1VFUyT3lJ?=
 =?utf-8?B?VXZQQk1rdFN5SVphMi9YVkhtb1RVY3lUZHgvUjJQb2JKOVN6L1phb0tYYThO?=
 =?utf-8?B?blJDMnFOTk1aSlFhUW56TFd5WFFRaENqSUhpaTJjaVREbXg2U1J4NHhXZE1j?=
 =?utf-8?B?K0hHYmhuclliZG9ITXdmcjhYWnMvSVFqYXAybjcxM2pWZjVEb0M4Mk83c2JJ?=
 =?utf-8?B?S21aczlOUndJRm5tSVVlZi9QRzAyYTFpbHRmcnpPKzAzK3BweGNnbkVhTERj?=
 =?utf-8?B?OElRMkthTmZnVm5JVjdWRG5jeHZaeTI5dFRHZVVMNWxFSDNmM09TZVl0SjF4?=
 =?utf-8?B?OWlpNlEwSGt0OHFKNmtOMjFJKy82ME5XUnZWL1lIVlVwOEtBdnNGT1J2cUhD?=
 =?utf-8?B?QUluU2hDelJIYmNsek03Y3VKMmRCWUlxQ3kyN3h2RzByQWc2c1FQSXlUcVNy?=
 =?utf-8?B?emhzV1h6djVnNVM0cXVkYVlselFSdVp3TnFSaTRUdllSNXFBWno0WUFtcnBl?=
 =?utf-8?B?R0hQZllLQjV0a0dpbGxvQWlWc2dCVzN4WHIyQ3p2Z0NkaG00em0vZFFmeSt3?=
 =?utf-8?B?UXpKUkoxd3duLzVDS1NXTXMvdkhJZzE0cWFHWGhybFRyM0NiNTRjSTMvV0Vp?=
 =?utf-8?B?VWQyRG1oY0pBT2JnK3Nwd3czalRqeVFpWFlwcUs5cHpMdHZLSTNacmJNbk5D?=
 =?utf-8?B?ZXN2cFlQRGxVb1FaU0RvQXNUUHBWbnhFNVgvZ2hMRUtXaUdudzRMYkRCT1Np?=
 =?utf-8?B?bnZpN1BiL1pKUW55ZGIzeW1QYnBHdVROZVdpQmZwTExITnZoSnlxUzZrdk44?=
 =?utf-8?B?ZmRSOUZMSTJxSDNSaytXNGxUZWNGZlRKWTdOalh1d3dXbmRBS1BsdTZlc2Vu?=
 =?utf-8?B?VXhOMTBqdkhXNWJkVzEyd1VyZnZmcFJUMDZIRDdFaFpUZTRkbUxCeFFHWmxq?=
 =?utf-8?B?U09xZmplREdZNXhOY1QrM3ZzcnUrSUtmeDFDWTlCT3RHL3pTUEY2UzNybWFq?=
 =?utf-8?B?cHAxSXlSNTc3bUVhUVdaOUVWN0RYcUlSVFVVME8wSEwwOGdQMGkzN2lTUE1S?=
 =?utf-8?B?NGVQYU1UNEtERVZEWkExYWR2MDgxS3JFUUNRK2NSQnFibjRES2d4WFA1N0RD?=
 =?utf-8?B?dE9zaFpGV2lvNUQ2eGFiYk9DWU1QWDVSNjQ5dTUwYTFrWnNuSmtLaFV2VVc2?=
 =?utf-8?B?amg5OEJ0WGxpaE4zamdLeldaZFhKSEhvdGJSUCtCSVE0aXByZE4vYXZaWVJF?=
 =?utf-8?B?OG5UTGptd0FCM3R3SGZNWnJwQzd2K2RhUFpyNzFQYm5EYjE0TFZBUHVwQml1?=
 =?utf-8?B?dzdCT25wNW92dFhxay94YnlpQXdFcmErcGk2d0JLZE5Ra2VlZmtGYWduVFRJ?=
 =?utf-8?B?dXJQTkJTN0ZabFR4d2hoYW4zMjVvZzFxZCsxdHN5SE9zcVhkbE9RK2pYcVNP?=
 =?utf-8?B?NkhOY0lCVy9yZlhTYkNVejBYemtUdVVJRFJYNWFyZG9ONi9uelJQcWZGNE1P?=
 =?utf-8?B?bXN0elZLZXFZQmVEb255L3R4a01wZS9lNDg3Mi93Nmd1SU41SkQxenVlYTVE?=
 =?utf-8?B?MlZsK1ZLOGpVVU16enBLK2lLRkZVK2EwVGpsTXZjbEVnRVAvbytURUpMcG1D?=
 =?utf-8?B?UGlRb0hOYUpmbW9KNnZOUWladUdPYVY3MjVodzBscHFxdkJIUVJURUI5OFU3?=
 =?utf-8?Q?RfORCi/9cRFtneDEYEfiFXGRjIbpaCnG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHJrTDRReVlnMHB1VUdXMXZLS1BucmR0a3FLOGV4a0NLcFRraFlFRjBIeHln?=
 =?utf-8?B?Y3A1alk4dmZsZHcwRG9CZC9uTEhSaVBBbGZaWDVFcElQOVFCSXRxK0w2TjlR?=
 =?utf-8?B?M3hNUWNQZ1lDS1gzM2lJT1lySnZTM2JjSjRJTlV4cVVkTHlPaWtvamllbnNl?=
 =?utf-8?B?RzZ6aGJvelJ2eXEvZlFPOE14Nk91cEg0cFh0SzZOaUxxZlBtNVlPRWJDcWd0?=
 =?utf-8?B?VVdGTW9aa3VyR3UxODFRWVFnd1IwWG5ocHM3bWxPN01EZlNrdExQRUFMTEJW?=
 =?utf-8?B?SEJKVW9YcmM1Z2FWbUgvYXl3cGhzMXByOXpZZHlFNXVQSFVCV00zK1hiM0hX?=
 =?utf-8?B?WXlvVGNzZmNKdk9acnMyQkx5ZVYzM2FOQXZnWG94bzJtT1paRmZVWkpmbzRo?=
 =?utf-8?B?WW93SXArb1JGL1lMaXlQa0RWcXY3SHJPcHVYamFnbTB1NGhZWENVSngzZGRh?=
 =?utf-8?B?QUl2c0FndFJaNVpmbFo5c0REeFNiRmhjK2lqckdSZVhtK3Nkc21tdGVvU0RP?=
 =?utf-8?B?dDcwaDg5M0lrWlFqRlN0d01jVkY3Ylo3bVE4RHJOZW92QmxybTltS2Q4aHdE?=
 =?utf-8?B?OG1HeFMvSFZVMDg4a01hMzEzaVFYTytwUUlKaXFFZVlheVFpQVdhTHlFRkcr?=
 =?utf-8?B?Vm1TOS9oUzRpVkRJWlJLY1VZY0RsS1BPWXJnbkRUZGpmL0Rya3R4NGRzemRL?=
 =?utf-8?B?TUhKZVJLKzFkcW04bkNQTGhlUjJLM0k4d1pPUlhEeWJkOThLdzc2SjNIc0Ja?=
 =?utf-8?B?ZzdCSTZzbW0wLyt4THpIcDhkOEhQQVdlZzV1QlV2MmI2am91aFZLT0hoQ0VD?=
 =?utf-8?B?Qy9GM3cvM3JwL3NNVlVFRjg2b2pUdmUyRWh4dWJ5NWI3a3JEWndtRWFwKzQv?=
 =?utf-8?B?RlRUU2QxREJsdm85K3ZydGZ0bzJlN003VGZ4ZjJpTFZyUkJZSktJUkhtdE5X?=
 =?utf-8?B?ZGFmL3FWRmd2dkhzMVFMY0o4c2dzQlcxUlJZdi91TXRCK1ViNFRCQk9lakxa?=
 =?utf-8?B?UElQQlhpZStkbjdlZU11bkpEcHdaUWlkWHlRZFlsZXJxMEQ4YXlkQVdMeEMr?=
 =?utf-8?B?VkduczNZbXF5RnBySDFrT0ZMbTNVKzhCZnhhdW5waVYwT0gzVjRKV2FwSW0y?=
 =?utf-8?B?T3c0aGlleUhUSXczKzZpdU1PUTA4cWZEM2t4b1B4L0IxTnViUUUyNTduamRY?=
 =?utf-8?B?d2V4cTFveldIdDV1SUNEYStkNGV6VnR1T1FhdGlvQ1VZTnRNYW1YczZNbGE0?=
 =?utf-8?B?UEVZdFkxQXRJV1RlWW9BTTF0RHlGUEJwUGJqa29HOGpyR1ZDZ3NBZ1RoVkl6?=
 =?utf-8?B?Mm5DUGhNU3AvTFdlMkVSci9TZVplOXVQb0ZpNWVDODd2R2ZORFlxZVNkQmh1?=
 =?utf-8?B?eXRCYVVCSWEwQ1VCdzZqN3V3Mlh2NTdsZTdtVnBXM2Z2RVpMb1NvNXV5bC9p?=
 =?utf-8?B?QUh3OHliVUpHVXJIZmNBcWxtdU1KdDB0VkdrTTF2SW1mdHBsTWxEa0EvaVJk?=
 =?utf-8?B?alpmbFJWVUQxYUZEMTRnc096TGM2L1RTck9uKzRnM3FTbW9hSldLOTJ2Vkl2?=
 =?utf-8?B?OXNESlVNdWduV0djcnFlclBDVWtNQmFsOXJCVVFxdHpmaWZGQlQ5bmdMaWpT?=
 =?utf-8?B?UDZ3UWkzcDRWSTFza1VJSUFUWExMUXNHYUhJalozOGt5ZFg0cmcrTDM2dVhN?=
 =?utf-8?B?MnhtQldKQm1Xd0R0YlloSUpmQUxkVnQ1dmtlbWdRbVl1WFlNZURBR3QvZGY2?=
 =?utf-8?B?ODAxK0gxNUl3aG41aUhaRVNtLzJQd29yakdOYkZjbEhkYlNzc2FYd1FQaFpU?=
 =?utf-8?B?RmMxNmZ2NUxib3Z6MHhqSkNheExNK1d0YjREK0ltQ0czT05uN2hVd3BXQUll?=
 =?utf-8?B?MndTYkJ2bS9tc0dzWjdLcTRmbHVyZHlQci9TK3o3NTNVMVkwc1UxSU02S3BJ?=
 =?utf-8?B?b2NxSitVU0JMV3I0b0pqQkJ5d1ZqTU9rbm4zV3J1WTVWRXBtalF6YlU0bmlG?=
 =?utf-8?B?VDNWOUpIU0lpZ3A5RFVtSGRldmFLNFkzbUlIdWFoUVZkMU9mSi8rbjliTVdo?=
 =?utf-8?B?eDJxdGcrNFMzaHl6aGFQNzY0bFJvM0FESU1oMityQVNuL0FEOGp4emtjcTNE?=
 =?utf-8?B?WGd3NVBJMEE3d1g2QjdmOHRaVVIwaXdDd0ZyQkFDV01sdSttcG1ZSTB5SDdK?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2f55e7-7fd5-474b-518c-08de0c3f6b24
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:06:05.5153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc3ELEnHiE80Mi46rTJ4coEG0U3rZu8Hd81NKpwCIyIN1qhI8rR1OJTYqsi4uKD49Rz+0kFC+DkUvAC0IwlD8ITRxKoCDDg5X4No2L39KVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7416
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

On Tue, Oct 14, 2025 at 12:11:39PM -0700, Matt Roper wrote:
> On Mon, Oct 13, 2025 at 08:24:55PM -0700, Lucas De Marchi wrote:
> > From: Harish Chegondi <harish.chegondi@intel.com>
> > 
> > Starting with Xe3p, IP address in EU stall data is increases to 61 bits.
> 
> As far as I can see, the EU stall format isn't documented anywhere in
> the bspec (which seems like a major oversight!) but the early
> architecture document related to this change seems to indicate that a
> full 64-bit IP was supposed to be written by hardware now
> 
>         "Bit filed[sic] 0-28 is now 0-63"
> 
> Your structure is only using 61 bits (which definitely makes sense if
> the addresses are aligned since the lowest three bits would always be
> 0's); is there somewhere other than the bspec or architecture document
> that we should be looking at to confirm this?
I agree that EU stall is not properly documented in the B-Spec.
I looked up an HSD for Xe3p to confirm and make this change. Also
checked with the architect to confirm this change.
> 
> If you've been working directly with the hardware architects on this
> feature, please poke them about documenting this clearly in the bspec
> (with proper tagging by IP/platform) so that we can verify this is
> handled correctly and also notice if/when the format changes again on
> future platforms.
Sure, I will follow up with the HW architects to make sure the EU stall
data formats are properly documented in the Bspec and are properly
tagged.
> 
> 
> Matt

Thank You
Harish.
> 
> > 
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index f5cfdf29fde34..2bc6b593ff172 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -124,6 +124,27 @@ struct xe_eu_stall_data_xe2 {
> >  	__u64 unused[6];
> >  } __packed;
> >  
> > +/*
> > + * EU stall data format for Xe3p arch GPUs.
> > + */
> > +struct xe_eu_stall_data_xe3p {
> > +	__u64 ip_addr:61;	  /* Bits 0  to 60  */
> > +	__u64 tdr_count:8;	  /* Bits 61 to 68  */
> > +	__u64 other_count:8;	  /* Bits 69 to 76  */
> > +	__u64 control_count:8;	  /* Bits 77 to 84  */
> > +	__u64 pipestall_count:8;  /* Bits 85 to 92  */
> > +	__u64 send_count:8;	  /* Bits 93 to 100 */
> > +	__u64 dist_acc_count:8;   /* Bits 101 to 108 */
> > +	__u64 sbid_count:8;	  /* Bits 109 to 116 */
> > +	__u64 sync_count:8;	  /* Bits 117 to 124 */
> > +	__u64 inst_fetch_count:8; /* Bits 125 to 132 */
> > +	__u64 active_count:8;	  /* Bits 133 to 140 */
> > +	__u64 ex_id:3;		  /* Bits 141 to 143 */
> > +	__u64 end_flag:1;	  /* Bit  144 */
> > +	__u64 unused_bits:47;
> > +	__u64 unused[5];
> > +} __packed;
> > +
> >  const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
> >  
> >  /**
> > @@ -169,6 +190,8 @@ size_t xe_eu_stall_data_record_size(struct xe_device *xe)
> >  
> >  	if (xe->info.platform == XE_PVC)
> >  		record_size = sizeof(struct xe_eu_stall_data_pvc);
> > +	else if (GRAPHICS_VER(xe) >= 35)
> > +		record_size = sizeof(struct xe_eu_stall_data_xe3p);
> >  	else if (GRAPHICS_VER(xe) >= 20)
> >  		record_size = sizeof(struct xe_eu_stall_data_xe2);
> >  
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
