Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82D1CCD199
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 16:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C94C10E0E7;
	Wed, 15 Oct 2025 16:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9//X0s9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC89610E0E7
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 16:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760544477; x=1792080477;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P15namWdUQtXQUyvWlcwBUp/Kvd8gXeJpeFMaOxn1oQ=;
 b=Q9//X0s9IVqPIywoTCHyH8bfvz5bBOYkyjGQB8npP9nZSzIJmoyvJuhV
 up9dK71NI6EWXbsOtcN7pszxUE/8n/Y7rP9ngzKqWOSfJEGas8ni6CsQa
 D4+wF4cfCpIZQ6RtxN9FZtllAoCrRo/tP9eNnYFpHAlJy/WLXaGVxgHLQ
 azfpl2gAzCVnvdY3gGTtbQrGA2k/Yp/AAa1M2e6sUrNW21GQUPQgue9fC
 uXJvPTAyiNZh3oEW8VShil1EqmUr9yYaa7eUdlD6U4C6yy/Xb4GAgW+wT
 RP8oWsMUv4hK1BjQ2k3ToPzm1d2/T8krsr0rpcxeEhAaQLXQZzM/Ep55B w==;
X-CSE-ConnectionGUID: 6LjyEEIbS8momgiOV70WPQ==
X-CSE-MsgGUID: RyiyCbMdTrqrNnMAAuixrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73001244"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="73001244"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 09:07:50 -0700
X-CSE-ConnectionGUID: YFgNzw/fQ4eNEmpdtNBhUA==
X-CSE-MsgGUID: AODSdXCBSTOD7R6VhzPtIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182672100"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 09:07:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 09:07:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 09:07:48 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 09:07:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcPj05oltvueU6aM2ojWMbi8eXoWV2rawcxcNtoKxiz2hhR+Sn1Kz+skEibIy/Xj09XRGE6RrP85XYpxDKJwq9LFtuvy43nftTA06sXccx7OVS0tyvvD2qKHB4GMAeuIuXoOepnRxTrZ28mVAb9Dy4nut3G9wFrgiujxqoBuXuEsvK8g7QirwhlhVl5x4Nq0VbHJLC1aNqzEqKmQzb2izk9YvIGRY1LOJQwtYvN/lF4n68eF3zYCrkOF+L5whgBGDHE2r9sxGwVj5nPWKAhtnEd6fGp0OanibvTG88EOvOXkvXTBzYAFadfmswOC+YtUREH5A8ifMH1Jf6x6VpxYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7Q7sCFM0VBt7GgJkW88p8Kk7fLJYZmLp6P2SBLXOm0=;
 b=eGXKzEIvs3P3CaWQvI5Xf7HbiFqmvKrxOZyDbITD1xlD1N81zOKSq8jN9otSVsH59TE/0oXf5G/gQ5dj3kCCBlslEe9XlSEFtBE8pAZz9Nuv2th4RJfEMsTaoKxj+d68t/VYU7tvbmU/eTa4siklAJSwAlOntfpyuqYnzchk9bPDZqY/VEl0l+lPjr7nIFHiYbk2DdHf8crhO+93YSGR/ug22oasHkBZCSQ19KLHkyzXeCSrALMk5B0LUZeTaiB7y7+868RuHIpQLxT9WS3dGLUu3Dc+qYnpy5p8lgOILm6SsyEVi3CW3x2RFyorq63XS+AJaV63LCet+W0PERgcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 16:07:44 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 16:07:44 +0000
Message-ID: <bd3b5e8a-0961-4bf3-a79d-fa426627ed25@intel.com>
Date: Wed, 15 Oct 2025 09:07:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_guc: Expand guc_g2g_alloc error hanlding for
 future change
To: Matt Roper <matthew.d.roper@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <michal.wajdeczko@intel.com>
References: <20251015151053.66931-2-jonathan.cavitt@intel.com>
 <20251015153440.GK1207432@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251015153440.GK1207432@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dab054-2def-4293-bb1d-08de0c04f9b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHNBY0Q5dWQyRHBuWXlBSzFIc1M4Z3U2Mm80MHIvZjIrSGFReWZYQnRmY2Fa?=
 =?utf-8?B?YXhqdDVFTFdkd25IVktLb0J1YUhjU243N1B6SGZqbHg5aWU5RnBkbEtURXdI?=
 =?utf-8?B?bm5xNCtSQ1ByaGRFMGVNRUJNSk4zcHVuc3pvSUQyZjlOb3VrVlRiU3BkZncx?=
 =?utf-8?B?cEgzTXhLbjN6ZWk0U1hBZWRFeVdkSkdKRGJFd0M3d3R1aU5hT2hmdHA1UzdS?=
 =?utf-8?B?Y2FTc3RsL2ZQMWhaMGRVbENnQ1NLNmhKUmxTUFNWZzYxZlUrTWZIeW92TldQ?=
 =?utf-8?B?SWdWUXlCUExWYk9MT1ZRL1UxM29RUzJKVEVxTmZzQXNETHBORUxDTzlxWjJ2?=
 =?utf-8?B?ZjRYa0liaEpHaG5GbHBlZ2VDT3lNdnF0NDZKbFRXNUFOYUZPVEZJUTAyRWhn?=
 =?utf-8?B?cDhmMXFrRnR5VE9xZU1NcDlTTGFidUJmV0QwcXJqamx5M1ZqVUpDWFlNQkxY?=
 =?utf-8?B?RkVCb2U1bEdIcm4wVmZPL3d6RHU0b09yY3RaekxNUERFUDdMOUhlNWtUU3kr?=
 =?utf-8?B?VlY4M080MEs4VUkxOEROQUlrbmJxRElqQzZtTDg1ai9USVAzSDZOVHVTV201?=
 =?utf-8?B?REVvMzJRbmdkUUlRWGx1MXFOdmJNVno1Q1dmaTlxUzk3V09GalVTWCtSN1R5?=
 =?utf-8?B?amFvaGlJa3pKcWNmTkgwdUYrZGNMZ1JOMlVQa3B1ZHJJV3RPYkM2cU9sMzVN?=
 =?utf-8?B?K3FuNWJyMjVDTTRuVlZIV3ZFajVSd3Zpa2pYdTFqeXBUYUlLdWJydm9MTGpw?=
 =?utf-8?B?UzlXMGRQejB2dGZZc2QwNzI1dkw4YzRBUDVFWFAwdUpPaWhxMTFXTERac2p6?=
 =?utf-8?B?WjhZS1gzanBCTStBTTNGVG84K0Z5dDhVUy8vbFlRUUxIWnBWWXN3cmRVMlpk?=
 =?utf-8?B?UldqdFBEdnhTcytRZUlrYjhiMXFBWFJ3YW55ejhvYldkUHdGTGFhcGxEOW1X?=
 =?utf-8?B?aWZGNjg2OTZyd0hWQktGWVZob2VicDRrOFowQjE2YnZxdGp4b3R3VkZqNDJw?=
 =?utf-8?B?YlErRlpjNlpzUG1sd0FVMHMyMHhJcWNNQ2oxVU1ldE13clY5V1hsa1d1Z3E4?=
 =?utf-8?B?Y0lsL3FWSEp5RVQxY1Z3eElpdHFZUUxHZUxmOFZXbHhBbkVobURDYThydkd3?=
 =?utf-8?B?NzVhdmVhcENwc1RIZXhoZ3NESThwRjh0b0hTc3ZzZWVSSm5BOEtuMFFSbE1O?=
 =?utf-8?B?MzJJVS8zVDI2eXY4bWowRXozT29wMVZsMFJtYllFNTBQeEc4K0JwRlJZcW4w?=
 =?utf-8?B?WWo5RkR2bTBWaFV5bTM4dllDL24reFBkNmdiYWs4Z0E3dFZCN3ZTdnYvWWph?=
 =?utf-8?B?MHV2akh6cmNSTzZiRVl4eXlMNEY5bHYxS0lFbG9pK1grR25hWmZrUEZOdFZt?=
 =?utf-8?B?VUdLdEwxc1ZlQXBNYlNCWERiQU5XdmtWZ1NsY2c4NTBYN2l0cDBibUdoZXBJ?=
 =?utf-8?B?R1paQ1hXOUdwK1VjV0tNU2ROd1BTZTBQTkZ4S1lEUUFVQ0hGeFk0V3Fzcitn?=
 =?utf-8?B?Y1hnSFkrb2lsODdxSHFCNXVOR2hQR2Z5MUlZOS91WkRQRGNJV2xXSXk4RUx1?=
 =?utf-8?B?RVBrWTBvazlnV0t3K0szZXJ4OGlzSDNIeGxiTHZVWHBzdVY0Q1VVUU4rSllJ?=
 =?utf-8?B?N1Z5Y2ovSUdQWTRXMTNLNnB0MGEycE9qRFR5YXFNMXFBMVNaV2NKS28rb2lC?=
 =?utf-8?B?T2J3R1RhV0dXRnFQVHpKVUtWUDFtM0x2SjkrMFN1Njl1VmcveVhQc21RenhK?=
 =?utf-8?B?Z01mcDRMZ2dKWmxacEJPKzYyMUNGSGRBcHlFMkFhaFZsMG9lNmxSZlorL1U1?=
 =?utf-8?B?VGQwQjNDS09BRE5Tams1eXBQT0tFS0ZkVktrN3FNRm5YaU1yNTE0MWtZVTdr?=
 =?utf-8?B?ek1Qc3dIMEZjY2dXNDRBMk1sREFvV09TQTdUUjlFQjFqVzgvenJFUVQwWDdz?=
 =?utf-8?Q?VaWp1YHR1NIHaNYbfNa91HxJvBVBMsqU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG83QTR4S2c0R2xJNzV4c0h3U3YwVzJSK0tDT2VRUElEckQ5SG55NDBvV296?=
 =?utf-8?B?WktkdE9UbzRzcGZ3WHVmMko1Mmd2WmhLWEdORGplcHZRbEVpb2c5K24yanZ5?=
 =?utf-8?B?aHNEbFFTL3IvbHF5OFArWENZQ0xUNHlkSDdGRkl2dExiMkFtenRjZ09xUGRE?=
 =?utf-8?B?YkpOY2k4UmlPWVk4Yyt4Nm84YTRqeitTMEp1U3pmd05GeW9DcHNHYmFEYzNV?=
 =?utf-8?B?YUhGUFBKNVloN3JCTk9CN2REQjJrQjBqd3gwUzBQM0wrQ3cxSHRIQnkrQU5k?=
 =?utf-8?B?ajk0RUNEMTdaRS9XN0VvM0JBa1hRNDF5amxjRnpNTml6SVF6M2F2ZnIvRCtC?=
 =?utf-8?B?emw3RGtXZXZOc3JySjdyQllhMHl1WTVKM1dEM0NsTjZXbWtMOWhQaE5NZzRi?=
 =?utf-8?B?VU1naW02Y08rb09BQmk0MWNoK3hxbTJDV1Vha0IzZDdna1JURmRmK0JnZGpp?=
 =?utf-8?B?dld2TldLS3NOeVhVS01DS1A4U29kS2Z1c1ErR3RlQm11SWtNZHFYRW1nM0xj?=
 =?utf-8?B?MnVaYXo2cGJEUm42YjdKQ3J2VXlpVW9aMXg0eG1aNHdqcHF3ZEJtNW1KSXZo?=
 =?utf-8?B?RHgvUlYxOEpIR1dVdTNqb0RYYVZNLy9OaXR6UnlMd1lGYkhXakNqd25CVDlF?=
 =?utf-8?B?OThiTDRkakhYSmpPRDQ5dHFsMUxvaEhUeDZpQUpzZHhzUlNOblFJRGxBMk1Q?=
 =?utf-8?B?YmhrZDBodGRWbUxveG4wSjJrQmpVZlFqQjU2S1dZbG5GaEFJVGRWMmhKcFpi?=
 =?utf-8?B?TTlFb1QyTFVySjhBODJ4Z3QxYjFiT3ZOMUxjbmg5cHNneWVHKzZKNjJmQ3Zr?=
 =?utf-8?B?Zy9rTnZ0NUtPZEM2cHJIbWZNRzAybzM1b01uMGRyazdMenpDQ3pKdS9TMEls?=
 =?utf-8?B?bi9Hdm9RNW9GVVB0TTJRNW9EYS9mczZIOXBZSFNDUTNaN2o0T2F6bWxYRkhT?=
 =?utf-8?B?VCtlMXk3cmJUUmxxK3c0QWc1bmhzSTZ2QkhFdk4vekk5VTNCalRTNFNvNnUv?=
 =?utf-8?B?QkJxOTRKL1MybjdtQkQyVlJrckRJL2Y0MTVxUHRtMUVqbjhOWmxGU1libTZi?=
 =?utf-8?B?Y3RiVmd1cUh2aE9QRVNPcjNna28zd3lwcnFUQ0xaMUN0K3NzU01PZllGZEla?=
 =?utf-8?B?YUdySVBtRzdQSys4UmNjd3BrZll3YzFzL2ZEMWxCTFlpVGdENXBncy96NGtV?=
 =?utf-8?B?Rmo1bmdZcDdTZ1dDdW5nWktyVWxDTEhacEpoTGlEYTY3b2ZOci9mZXRDcFky?=
 =?utf-8?B?SFBpeTlNcVFLb1g0cDV5NW5ydnplQXNDVUNGL1ZBTit0NjVvVlZhYXRVY3Q2?=
 =?utf-8?B?ZmNRaG9mZ1hqVEFTYXZSMi9uTjYvTTFqcm9lQTVLaWpQdHpQdjdVOEtlS0VU?=
 =?utf-8?B?MUZuRnVQenR1ajdRaHg5a0ExRkdQbVpDLzNybTBCVk9LeUN6NWh4VkNrNllN?=
 =?utf-8?B?cTRqRVJtOW5LZDFUd3VET0Z6c05TbkV6bEIxbHI4TGJGWTdSRldoVnpOdi9O?=
 =?utf-8?B?M2d4UWNkUjRLelNUTWJROXlUUThIU3pINzhLSllETWFaMVl6anNDTVNnVk9R?=
 =?utf-8?B?b09pUUwyT0VZZ3pIeWIxdzZjNk9SUzhtdlJRcFJoSHFWOFFlK3UyaFFSOXgy?=
 =?utf-8?B?Mm1EYjc1Z3Q2N0ZpdjJnY2NKd2JuUXpsWHdSOG9OZWl4S2FmbGpEZFpyWTNO?=
 =?utf-8?B?eGVCS1FOOTZrcjBLbm9ESGN6Q2NkejV2dXBlUGNsM3JFbmNIOGNzWjlVSDhC?=
 =?utf-8?B?enR6Smx1bTU2Rmkwc1BKSWYzT0ZZcFUySjZybnlBeFhGaEdBcVVCRVNKYVFC?=
 =?utf-8?B?WnpFY0ZheGRYeG5ib01oZGJIWkpIWGo2QlU5UEk0WFJuWGsxc1FEb0JNUlZp?=
 =?utf-8?B?VngwK3UrNFBUcWNxSVdpcjB2MjdBNTNmMjByUTQ3UHlxLzNGNXpkbEN1dGNK?=
 =?utf-8?B?d2l0QmhWcms4L2tyR0ZTV3gwdzAyRVNxTUxXVWZvSGkvZUJVcHpXcXg5eDVQ?=
 =?utf-8?B?LzNRdjE3TWd6OWt3MTNrUW5xS1g4UzE0T3dPYTBtT01yZlpGU1h4ajBWVURr?=
 =?utf-8?B?bFhqWGU3ZFB6ZDZCNXJ0TmpUVHlwS21icm9uL0FRNVVNaytISlpGek1ibzAw?=
 =?utf-8?B?cmRDSW82Um9Yb0t4VGFTU1c0NXd6eGwxdWIwV3NNalBjTzliRStRb3puelhX?=
 =?utf-8?Q?bep7A2eL3nzOGmxthdW9eVc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dab054-2def-4293-bb1d-08de0c04f9b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 16:07:44.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2bIdWsmg/VDiwCSy05Xlj5QdG7yq4p8NU/ji4OOXLtVOVDiFHaLkU1OQ7V+irwZ3F11lWVQSPr6yCWdQWRsolsF9sdVVgvUW6NJQf1MXnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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



On 10/15/2025 8:34 AM, Matt Roper wrote:
> On Wed, Oct 15, 2025 at 03:10:54PM +0000, Jonathan Cavitt wrote:
>> On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
>> Hardware-wise there's always at least one tile, and every tilie has a
>> primary GT.  If something went wrong during init of tile or GT and we
>> couldn't create/initialize the structures, then we already aborted the
>> device probe immediately and we'll never get further on to places in the
>> code that would be chasing a NULL pointer.
>>
>> However, there's currently ongoing work to allow the primary GT to be
>> disabled via configfs for debugging purposes.  Once that lands, it will
>> be possible for this query to return a NULL pointer.  Expand the error
>> handling code for guc_g2g_alloc to manage this in the future.
> Rather than blindly adding checks to any low-level code that calls
> xe_device_get_gt() (and then raising errors that we hope will do
> something reasonable when propagated up the call stack), I think we
> should be putting more thought into what these functions are and how
> they get called.  Functions like guc_g2g_alloc() are something that get
> called deep within the callstack of GuC-to-GuC communication.  We should
> be thinking about what the purpose/use of this code is.  If GuC-to-GuC
> always requires communication with the first tile's primary GT, then G2G
> itself should just be disabled at the higher level so that we never call
> down to this part of the code (e.g., in xe_guc_g2g_wanted that already
> has other "is this possible?" checks).  Or if there's other feasible use
> cases (e.g., a media GuC on one tile talking to a media GuC on another
> tile), then we should be changing the code to remove the hardcoded use
> of "gt0" so that those use cases work.
>
>
> Matt

The use of gt0 is purely for convenience here and the code could be 
reworked to not use it.
A single object is allocated for all G2G buffers and to make things 
simple the object is owned by gt0, so the logic (simplified) is as follows:

if (gt_id == 0) {
     allocate buffer
} else {
     fetch gt0
     get gtg buffer from gt0
}

We could change the ownership to the first found GuC instead, or move 
the object outside of the GuC structure entirely and into xe_device.

Daniele

>
>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index d94490979adc..fbe66722e852 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -467,9 +467,13 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>>   
>>   	if (gt->info.id != 0) {
>>   		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>> -		struct xe_guc *root_guc = &root_gt->uc.guc;
>> +		struct xe_guc *root_guc;
>>   		struct xe_bo *bo;
>>   
>> +		if (!root_gt)
>> +			return -ENODEV;
>> +
>> +		root_guc = &root_gt->uc.guc;
>>   		bo = xe_bo_get(root_guc->g2g.bo);
>>   		if (!bo)
>>   			return -ENODEV;
>> -- 
>> 2.43.0
>>

