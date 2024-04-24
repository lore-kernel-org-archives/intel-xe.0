Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD7EC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 19:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57782113D56;
	Wed, 24 Apr 2024 19:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A74ZOO/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BFE113D56
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 19:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713985230; x=1745521230;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+HVnMbTP2knEIMxP0nTcwELPUnn3e+7pxdRsIPdqqhM=;
 b=A74ZOO/sDEnnTKUu32KPhW8bia0RCwKe1S4hmikSdb/88dtrslGjsxrY
 ifi7My5AULjqfPvZVyRLK0E7q5KXUFVRqn1usG7xJF8X12c6WeZj041tK
 n4Cp4Bf+1Ga1cAQKad65LmpviireL1H55c/6rNeJiDNMFyQ8faZ/ZRLLQ
 kAxfQI+5k8DmN39888w4dWmGwLvWP+qr0bsTkMjBHtbfX1YLM+7ByuPrR
 TrIr/e9IgEYzb8Q94IzDqW4buydCGxFKOkn151vdUnaSD3i2jSGQdzbg7
 464aVECewVd/oxVfKA/YmROFbf3iIwV3MiS+8dlkfp1RTqevswmSQIYRO w==;
X-CSE-ConnectionGUID: ioVimx1WSrmJAabhsSrF6A==
X-CSE-MsgGUID: ZDSAbZn2Qya2ePP6c/ZQ7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9750898"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="9750898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 12:00:10 -0700
X-CSE-ConnectionGUID: ZZD4E6eZR1WZKyMwH7Y43w==
X-CSE-MsgGUID: uYuVm+cJRQif13xadj6fmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="62276953"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 12:00:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 12:00:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 12:00:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 12:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtlMoVi+pQWpLJzWoau6flUKxKm+sbPCXN5klm0bEZzueDDnUpARhaEduF2E2RjxWUZexBYYGVf6dOuY+VEp7qVz/F4bHZYWZKZs31Uj8wRBW5Ntdw/O8COnR0dj3wvLZvO0finLxxtJASP3Ad2NYkgVWCzogQ8XTRzTa42Nwmo8Ys0V6lUhWSuNMO3ISKrWSBidqDljdC+kwfaLSFZdUz1KNe5zGjVy+ilwoV8+36aHEMjBXpUz3UacEHP59vevejFBxJB6uS3u5Oc4a3vbyGa4PaMVmFACGIDVy1qmiCwoK6WWfgD2kjTZ4WdjNmWUGjPovbCQOULEV3hBWf1XLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWxfp2pje0vqCvX8R6ig5y7iStEbASTLZwOOWNGpRrU=;
 b=Hebzk5o7nGb+Pgkhxfmnpt/kgFJQJXmEr4Sqgns9EJQIxnSu/SpsNVzVkTcLR6DgCtlp+rELbr/FSaO2u3XYFWCfpLGLJTUx154p1dlfC6UatC+An3HHB30rR1Kwf+v+S7o1JUSiZvTIov5kofT3+66JZpX3gKJ3stM+FKSudFTz8lADnSnTQf2t6fvWBaEFN4qfr51OnA+P6U1Wd9yXDXVALyagIoXjaQPInP4rU3ITtXNTwbuEkEGF6W5dxseBzUs0xYKdl5K08jmBHtPSqvgCgE1SVWyiGg6B8lF15oCAJb7FP5+Dx+n1YzEQ25pCYHwTXEFYJH2aCQVtC29ipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 19:00:07 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 19:00:07 +0000
Date: Wed, 24 Apr 2024 21:00:05 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Fix typos in VF CFG KLVs descriptions
Message-ID: <20240424190005.eavg5mlvhwgwa77m@intel.com>
References: <20240424140506.2133-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424140506.2133-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6429c0b7-25f5-4670-0e89-08dc6490c235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlJPanV3eHV3bTVXKzcrNkY3U1VTLzI1RW9vOFVTM1dJUy9CNG9zOEpHQjR1?=
 =?utf-8?B?eUFLWGcvMTI2azBNQktydTRQNERwZzRKd2hGVHYzeXR3YzFhK0lXVEs1YW95?=
 =?utf-8?B?YmFITlR6WE56Mm5henBoRHpLUkE0eEZQU0FmTDlqYm9rQzI0cU96eUpkdlh5?=
 =?utf-8?B?cytZcGpPZFNiKzdNeTVic2swWWdqMmdmTVorV3VaZCtTMXZrb09DdmtPMVpv?=
 =?utf-8?B?bnhwdnpTMWZGNXZmWGwzbE55K2hwU3RvdEM5cnBHL0orMlVQdUpUblZEVGRq?=
 =?utf-8?B?ZzJqSzZLT3JKNHA4MFdVV3k5MXVRUXhabFN6TUFqbmxqQWFyaWlZSUpCUmU4?=
 =?utf-8?B?YUY4bTRiQTZ5Zm5hTFh1R3FOZHR2aWV3VXhnWUNKUmMwWXJOMDROUU53ekwx?=
 =?utf-8?B?Z2pGNEdDUXdvR0R5QUtEbEErQWpweUY3SlppeWFGZlhqUlljeXE3QXRvVkZW?=
 =?utf-8?B?dXpucHNsY0lrd1ZDb201V0xQV1dGMXdOQ0hVUVBzMlNubmtRREZOT01haWlG?=
 =?utf-8?B?UnVrUmhDMVZzN05WYjZpdndMSzZYZzFxaTgvcGQxbVRuU05NZTRiRXVkNlRW?=
 =?utf-8?B?UDFPZTlpNzEreVdRcXhqSGJMaCtCQ1V1MEZTRVZPNFhMYXdhWm00a1JmbXNK?=
 =?utf-8?B?aGxUQ3I2TWlzd2VNOVhLME1pSjRpdXhVR3BDZEh3OFEzaW1mQytCcmEyNjhI?=
 =?utf-8?B?YnZmRi9CaFdPeUdYOVVrcXBoM0Nrc0ZFSlRBemtscklyZnYvYjZ3UWRlRm1Q?=
 =?utf-8?B?Mm01dDBHWXZnbEpLNlgzRHFLS0l6YzFsUFlHYmJuYXlNMEluUW12ZlRXMU5B?=
 =?utf-8?B?bU4wakhETGErUWZaYVVueURmN0wwTXZuZnQxMVRFR3F2RXdyYkFRQkFpWTVI?=
 =?utf-8?B?dWFiY2NlVzFzZDd0NmxtOFN1MnNQbnNMKysrcjRZWjFUSTRHY2dRQ1J5T0VC?=
 =?utf-8?B?eUpJSExPeGtpTUNnMHpUbW9VQ3F2bDZNNVlxRVRXajdrZGtwLzdhN2lqaGpO?=
 =?utf-8?B?TytYM1FubkgrOXZXZWJPdXhZOERvZ1hBcUdNZ2orNmFzTWZvdENpY2htL0or?=
 =?utf-8?B?NzhDd1kvK3FKOHE1U1M5elIzbWkrUjlSYllZekFJd0hCVCtSTTR0VWFLcmxH?=
 =?utf-8?B?cVJlSkVCbHBmcjlkWER6ZEZYWkdHMmY3dWRqdDltTDcxRjNqVHdMalZPWWo2?=
 =?utf-8?B?Skg3eFpiOXM5Zk5QMC91bU00Z29yMXdvUE9RWFRmK2xndVhzYmlFeExzWEV3?=
 =?utf-8?B?TTBQN2JBOEdOWUd2NTdMcld5TUxCaVU1REowS0FmcUNMdFVQOHpBVFRIZTdl?=
 =?utf-8?B?N2ZKWm5GY1pPRWkydUNFdmY4VlBMQVV4Q2w2NTY0QnFldWxQWUNWOVhaRFZt?=
 =?utf-8?B?b0xwTThHS0ZKdWZLL2J5NXJCT0VrZWR2d3Uybm9rMFNuQWlFQzFWZXM3eTZY?=
 =?utf-8?B?azVTR3dVa3VWRTVGRkxBSTlnRENTSnRQTGlZRElndkFLak9nQUJScVhuUXk3?=
 =?utf-8?B?RjJUOC9tV2RMUlF0YTZXYUNlV3B6ajFoN1RkUWd5M0E3M0lxZW5kaDFScmYx?=
 =?utf-8?B?RVJQQW5obmtJamdEYWN2bXpaWVFQMXBMZ0UxZkw0bUU1WTU0R2c0K3FadnJj?=
 =?utf-8?B?WTNVYU41eGxlQ042Znd5amtUaXhNNEI0TGZpNkpnajduc2Urd2oxVjZQZFFF?=
 =?utf-8?B?MEx3eFJ2UGtmOSt3L2FxSVlZb2J0VkdrTm11QXJ0NEFYQlkyc3BZRnV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjhSQnllWVN1T1BxTHk5dmtBbXFiOExnbzJQYnNUTzhJMkc2cDBPRW4wSjkr?=
 =?utf-8?B?dFVWTUhubGsrUkVHdXk5SlRpb1lkYWxmSXpDR2l0L1hCZDRDY2taUHhLT082?=
 =?utf-8?B?L1VRUEZZZHM5Vmg5UVpTMDBvRlc4cFpoOGVFWmR6c2J6ZFd5ai82Z0gvRWNP?=
 =?utf-8?B?R3NyOGwvN1dITnI5N3RuWDdtU2pxZUZ2SFdFVE1jODltSEovendleHR5aUVs?=
 =?utf-8?B?VzE5OVcrYzNSa0E0Ri91RkdJNE5WSjdJdzdNQUxCcEo3K2pDUllDREpsZ0Nt?=
 =?utf-8?B?amZMdE0ybE9TMXhheUxyZ25CTVpCaVE5eWVWNkNEanlScFg2NVVYQlg4MU5D?=
 =?utf-8?B?S1FwL0RMcFdMN2lLZUxhcE9ZWWUzWVpYM1BZNkllSzdmWGsrUDhNdmxxb3lw?=
 =?utf-8?B?UzlEbkh3YklxTkdEaXJkbS9WZVVCQkprTHRMYi85NHZnb3NiUlhlSUF0b3o2?=
 =?utf-8?B?S0wxVFAvVmtRRmxhWUVSWEtNZE51cDhLeDdvc1g0WURCemdiMTR4OWVUZWUw?=
 =?utf-8?B?eGx3dEg1K2dtVC8rTVdKMjl0dXBESER6a2dUZnUzeFpjVndaTUg2dEs3NWNW?=
 =?utf-8?B?a1Q1YXdQYkdyUFd6cDMwT080b1BvdlQwQThld2MxSnBrTDFtc2MvRVQremJ5?=
 =?utf-8?B?OU1wTWF6TXZVbFVCcFF5eG5YUUk0YUg4dng1NmMwVStTUEE5cUxtcitqbWxJ?=
 =?utf-8?B?bGxTL3ovK0gvTjFwN3R3RnpiUkR5M21lN2RWM1BtOTBRNmtJaXA3ejFRajFD?=
 =?utf-8?B?OWtaTmFHcVJpaHozWUNONmlVVm1tMW15VXgweEZ6b2ZkaXNtYUxjdU5jWmdB?=
 =?utf-8?B?d21DeG5hRUVlcGZpQmVjMDlJRlhFaGkyOEtFRjNKMjYycVpTMld1RlJ1dVRU?=
 =?utf-8?B?dVNwd2lRK1N4MlNlSmVMeXgxMWMrTHVzT0daaG1UM3l6SlNhcWcvTlRFQVdM?=
 =?utf-8?B?eWVKVTZRMEJLZk41S2FCdlhmQ28wME8yRTM5ckVwM0t6YmdLNkMwNjlodnRs?=
 =?utf-8?B?OWMreXBkQU5leHRIajRNSlNnUU9xd1pZRXpzM0tDSFpRYXUxN0FGbG54YXhx?=
 =?utf-8?B?Zyt5L1ZPV1pLZVRzTzRKenpLeVdsb0tESDUzdmR4Z05KNVFhcUVjcmNOQ2V3?=
 =?utf-8?B?WHlEK0JYck5uSXM5QUIyYWNhRXRXV0VKVFpDREhVN0Y2TE1rV3Vlb3V1Q1B5?=
 =?utf-8?B?Z0l5Y2hET0lWWVNYMU1hVjFMSDRQWjJqU3JRc3NqOHZKbC80cVNMOG4ySVVK?=
 =?utf-8?B?QU5KNzhvREswVXZIN1dBOXdTNDN1TmptZXhvR0VlSFpYM2QwYU1CVnlXT3dQ?=
 =?utf-8?B?Tk04T1RDYW1XYXlwaGE3dFM0TDdRbUhnOElFU0ZJSVV5NXZsa0gyVXc2eERT?=
 =?utf-8?B?WmFyUDdsUEpYS0NNUysrNEE1dTVWQW9UT2xVK1JreTBHQmxhSzJldmM4NWVu?=
 =?utf-8?B?RUdtMTY2ZXZ0MkZDaU0vbjZNK0gwdlh1ckR4TWFXQmFSK2FUNTNibHQzVHJY?=
 =?utf-8?B?dE9PWE9pQnpnalA1YVZ4ZkhyYzFZUkJpRHJkaTBaNHI3alcvWEMxVXRRWFJT?=
 =?utf-8?B?UDFtYWRxaHdLZjZuQkY0VXY2OEZlWmowbTA3cHBLc3VlMG5iVFRhY3grUEd3?=
 =?utf-8?B?SmhEallZR2tITXhvbjhWUlVqQmdhWWRpL0M5TzFBTlVMVW43eS91WVJiMEVH?=
 =?utf-8?B?QUVLVkYvYis0am1CSkFBVVROVUVIRE0vT3p5WFZYVDgxYXJXeVdNRitDV09L?=
 =?utf-8?B?TDl0ZTJZK3RNcTBKR01UbVJlVU5YRDdtN1h6MStnRHlucEVEOVZmb1ZzaUt5?=
 =?utf-8?B?cFg5cklabHpjYmFWN3I2cG5FT0syRUtVc0ZhMHBQRjRHTDR4Q1IrZFEzdTBR?=
 =?utf-8?B?cHRBblFYeGowU0xzQVBhNDlDWVlTSW5rWnRhT3BaUldXNzBMOVE1NmkweGZ5?=
 =?utf-8?B?SzhwL0NQbnFleEhyWC9xdEM0ZDR1Tm5IdHB0UUF1NmdLWENNRVNWdUEwRVBz?=
 =?utf-8?B?MVQ5N0l4T1NBSjd5d0tIWHZoSlhxVDMxZUc0ZWpyNHB1cW91ZVVXOGNRd3U5?=
 =?utf-8?B?ODdUalI2UHBuUStxVWZjMGFJNDNqWmdISlp3MlM2Q2lDM0R2NkoyNVRQS09j?=
 =?utf-8?B?ZFI5QVAxWk53ZTh1ZlB1djVwNFdmYkh0QW1tWlFMV2hWYVh6VXdxWWR1L2c1?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6429c0b7-25f5-4670-0e89-08dc6490c235
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 19:00:07.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loRkwsuBmMb1WCpBS6CbHgmsDxBSV3nj6NosLaBisgoqtvBxrKXhHzMNnJGPI/64liSsdiVuBy71EzmOp011lgkgIeYOFXKe8oX0QcmqzcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-24 16:05:06 +0200]:
> Apart from the obvious spelling typo, use the correct values for
> infinity quantum/timeout settings (it's 0x0 instead of 0xFFFFFFFF).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index e53ffaee2fcd..5c1d40432ca0 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -194,9 +194,9 @@ enum  {
>   *      granularity) since the GPUs clock time runs off a different crystal
>   *      from the CPUs clock. Changing this KLV on a VF that is currently
>   *      running a context wont take effect until a new context is scheduled in.
> - *      That said, when the PF is changing this value from 0xFFFFFFFF to
> - *      something else, it might never take effect if the VF is running an
> - *      inifinitely long compute or shader kernel. In such a scenario, the
> + *      That said, when the PF is changing this value from 0x0 to
> + *      a non-zero value, it might never take effect if the VF is running an
> + *      infinitely long compute or shader kernel. In such a scenario, the
>   *      PF would need to trigger a VM PAUSE and then change the KLV to force
>   *      it to take effect. Such cases might typically happen on a 1PF+1VF
>   *      Virtualization config enabled for heavier workloads like AI/ML.
> @@ -215,9 +215,9 @@ enum  {
>   *      different crystal from the CPUs clock. Changing this KLV on a VF
>   *      that is currently running a context wont take effect until a new
>   *      context is scheduled in.
> - *      That said, when the PF is changing this value from 0xFFFFFFFF to
> - *      something else, it might never take effect if the VF is running an
> - *      inifinitely long compute or shader kernel.
> + *      That said, when the PF is changing this value from 0x0 to
> + *      a non-zero value, it might never take effect if the VF is running an
> + *      infinitely long compute or shader kernel.
>   *      In this case, the PF would need to trigger a VM PAUSE and then change
>   *      the KLV to force it to take effect. Such cases might typically happen
>   *      on a 1PF+1VF Virtualization config enabled for heavier workloads like

Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
