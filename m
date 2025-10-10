Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF925CAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 08:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEFA10EB82;
	Fri, 10 Oct 2025 08:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsbFahQR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E69310EB81
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760086099; x=1791622099;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gAmmnW/DyHSxQZXiFf90WftgRn10my9lcz1435cf78A=;
 b=KsbFahQRB6fWiXpdh3/Ni4KrelPHKLtH+7Sq/s/1au8KW47zeDMdsd85
 FFwvQF+kNuqEWUrHMuSpBODNuOdkJTwH0FyvQh2k2YyCTDrT3KbHjZKrY
 dY05xmU3070B1pFFUvf2LwltJUSM8Wc0paaKZYmjSO12/NWcFH8L8Axeo
 mRWU1Y7nmd/s7BiGnguSGydER5onWxs9u9GRpz2QZjE3Q5PVb4g8F8wIB
 N57kmqMCmqS0lTrx5Uumls+NM1sWazgrVZFK9Iz+5wfpXrQqGGXWXjRKL
 wSW9pZCVDVQ0X13scviEKJBMuAzQV3h6JHJj7pO6Dudnzz4lZbsgVvpkd w==;
X-CSE-ConnectionGUID: 3ZCJNFSNSG6G+8a+5iasiA==
X-CSE-MsgGUID: nmREY8BCSLKx1vdHoAoGhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62346758"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62346758"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:48:19 -0700
X-CSE-ConnectionGUID: 2iPrtnR/Sru9SEGGYT+WNg==
X-CSE-MsgGUID: Z+9mHYYESIWKozaz22fuhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180516762"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:48:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 01:48:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 01:48:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 01:48:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaAIWydqXwanHvkaGRjOXu7Yt6zYbtT29fKHLS1Ay9+HbKjNqGBZFVeP3jY/SUtHOdqzdJChzg7OV302kA5kIsUVzogug45bu70I0SYSzHROwOmX3wfmMN7ALmPk1QX3gFkqISl5V5Uu/m8bu5I0p0MdK/a+kPa7p/Qo5tZQ9UwXb7qJm6/igsqSX97M/EXkwua/VSZreVMu0GlkU7H3rU2o/nayq7IWJbIMMSEO0TNF4fm83koGc5vTAHl40sATmRjHUFQ9X1moSk0ihhaVCr0mhqoUAmufVz6fegMx+lVXexxyFJfe6vjaIg3AaWLxP+afRgEKqTXkIUXsPvQzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWQrIxlE8jx8qwsObjZCROfAgOYpHTQddE7pkNHx4/4=;
 b=ssGk59X9RsSidoKEP90QBpazIBQuBmFssD00genYLy/9n9FIt/DKXZFL3jT61O8mogrN9WDCXv+54P4MABnD/MRU27jsaujzgvW+JLw/prwFq0CknVUINnQTS5wyFJagBUyCR5WnOkMvW5b9jucUjN9zNjwj5iKHfmZJOEoKbPcPnwIZL1UQa0WD53M/pP49nytIfRtsNben+I2gQ5ODjBPnjwkqmKeXSDzSdTys1cfPaVxvXReh1M57e/IkLax3dmTsowh4E6uorl69p9Ls8Lurye4Re3puPvwuHixB4lPc+ZDoC3f9o1x0cK8F4dIENhX+mFexqOLS/Abd5sWA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB6268.namprd11.prod.outlook.com
 (2603:10b6:208:3e4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 08:48:15 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%4]) with mapi id 15.20.9137.018; Fri, 10 Oct 2025
 08:48:15 +0000
Message-ID: <c2b23ba7-5c46-4ff3-b9fc-121d2558f131@intel.com>
Date: Fri, 10 Oct 2025 14:18:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Handle mixed mappings and existing VRAM on atomic
 faults
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251009130629.3531962-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251009130629.3531962-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0199.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 6447fa0d-7663-4145-5633-08de07d9c074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjNDdHZuaGh0Z2lSYXRSOTUza0E2Zmk5eHBvZ3locEM0WjVmRnZpMnFoRUlu?=
 =?utf-8?B?ZXBvTGUvQWpTVWEwSFFOeWthQUFzWllYVDlsTHdSeWNJeFlQVERKTnMwcXFl?=
 =?utf-8?B?VjFYWW45MkFGcDhxUTZYWG41L3Fkcll6eXpYMkZuWnk1VlJCM0tDNUgvUWht?=
 =?utf-8?B?MEtNZHhGTTdnOVgzbzVZV1NnYUFIYlJYMHI2dnBQUzJwcnpSVzVtam9tWEJN?=
 =?utf-8?B?d21ZQWV3bTRVSzdseVhnVWl2a2wrOWhxNGRCSlMrdmtQUnlQeExYc0NqOG04?=
 =?utf-8?B?cTRYZ2pMRERxQkc3M25talFDMjVlNFNXc3RtWm9sQ1Jaa1B5MlIxa3FrT3gx?=
 =?utf-8?B?RkY4NWRwdk91VmFFMWd6OHY2N1ZGc3R1eHNGdHY1dUJkaVp1ck5oNmNDNnNt?=
 =?utf-8?B?S2d3RTFwTXRraWs1Y1p1MU9mWDQyNnJ3R0lERVRqemdGeGJpVTF4Z2k3Y3J6?=
 =?utf-8?B?WmlWa0RMYjVXTVE0bnRsL3hWd2RJUi84R0pNSXNFZyt2RlFKU0VZVWJvK1dO?=
 =?utf-8?B?K0JXTWoyNThHVkdnVlhHc3lsazJjcG0yWTdQNWF0UU1NbldLUnZnZ2xyNCtQ?=
 =?utf-8?B?T1BvUXlRaGVQZkFUeVVIdEFTaTNFaWhxVFlpekh1MHd6RHU0VFdUcjdJdHcz?=
 =?utf-8?B?RWRtRlJTRnRzYkhKdmZFVm0vN2tmL24vdXFsSVF4b3VlLyszcTRkZW5VWkx6?=
 =?utf-8?B?MndUc1k4SjVmOW0rVVpUVGxJWkNUNzZLL0xxbjRCSnpXNnUxcGEvZmdDS1B6?=
 =?utf-8?B?MUIxQ1FWSXY3dVVxZklubUVkbUlwSldNZ0dDeWk3QVdyVDdUMFIrR3VIZE81?=
 =?utf-8?B?WnRQeWFQRzhIWE1YNGF2djEranFsWGNtb3dlOS9HOGlGTUcrRUJSVUpIVlQy?=
 =?utf-8?B?UHF3VUFhSE5NTFdMYUVOYjAwOVc2RTM5eEtFZGlVV3dOUEZwdGFvaXpQblRP?=
 =?utf-8?B?V1l3c1d4N2VQNVZVRGtHNkpEK24ydlRrZjBZTStsS0h4dHI1MFNBZlg4YnBy?=
 =?utf-8?B?N3BoZ0FzUWdzRmJRUlBvRFdmVk5JdHdmU1lEVjVIZFlVeVp3ZDhJZWZlWTVu?=
 =?utf-8?B?elFnTnplQVB4TDFteHZGYjdZODk0aU52VDMvazdmdUpiNU5OcDU2cjdxSUNN?=
 =?utf-8?B?SnR3OGRMaE1CQ2VmbzBxeFNoYXZGeHJUVndNNEROYi9pWTM5UWdZWncvTWpG?=
 =?utf-8?B?OEFLTzE3K0FWR25CbHBRRW5yUXc4ZGRtLytvcU9NOHZ3azdxcmF4RGNFdTJR?=
 =?utf-8?B?eUQ4OXNmaUZ3M1UwbkNBeXlZMXVuR1liL0ZHNkYyWjhCMmxCV1EzNC9vZDZK?=
 =?utf-8?B?UXhWUStQb0FSajZISS9kTElIVWF0bGdncENlZlMvWXQrcFkzdmZiSjRwcFBs?=
 =?utf-8?B?SXh0SVZnczFGMTcrTlpycFZpTkVXYjN6ZUlMRDJSSE5OeUNBaXcvd29tUWJJ?=
 =?utf-8?B?ZDMya2sreENLUTRrTlFuQWpDOEhCZFJOaUdLUlpQTnJ6NERGek5ZMjFqMTBZ?=
 =?utf-8?B?emY3eWtlUUVQWGY3WDhaaU1BdElxdjNuMHd3ems4V3ExYkpWeDlIdm5UWmNC?=
 =?utf-8?B?bVI4eDBqdjdsYU1tdERTUjlaZ3p6RmRGeTNlcHZwT0VtTENxQjhMZ2psZEgz?=
 =?utf-8?B?TGtoRHJKWC9wNi9NR1FZMmFmY1llRWxJSDN0d3lDUzJnd1Ruc1FTb01oWlZn?=
 =?utf-8?B?dC9GZXBMdlpnazBKK2Zja29ZWDF4aHA5VytNUHJWY3E0QjZISEptZ1ZwNXJL?=
 =?utf-8?B?R0ZPVDl6cjhueC9HTjdpb2l6aDR2OHMwMXNuNHpMUFVFN05sK3l2M1Vjbjhj?=
 =?utf-8?B?NkRKaW93UGs2ZzM5QWs0V0tXaDRkRzBXdVNqVXd2dHEzRml3cGdCbnI5THp6?=
 =?utf-8?B?ZHp0cFR3NjBFK254Y0NGZDJaNDVOOG5tR3BnMTB5K0hYUVdVR2U4ZnRFRFdS?=
 =?utf-8?Q?QS92gYS6zWwPbO3lJPXxrOQQtBUvblpt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTNudzFoeDVkYWovVVlqYzkyWWtZMitMUDdGNTNLOG5SaENJYmlJUFEvVzV4?=
 =?utf-8?B?bnRjeVBqRnJpTTg5c0pjeWFUekZpY2UydnJEOGhteEN3Z2FxQXVGOGpFYTEv?=
 =?utf-8?B?ZE40Zk1LZ0RMOW1KOWJ6MkNRemVRcC9tYXBKZlZhM1NTZU0wR0JQY2QvT3ZX?=
 =?utf-8?B?MmY4U3QySVJCa0VZbHNOcGllYk5NSWFIQkdyVUY5eTMwdlBqa1Brd1VQMHRP?=
 =?utf-8?B?QzlxS01BSUJXR0Q4MHBZTkRTdVhGS2puTml4eUNBYjlHT0thZWZnaEhob1hU?=
 =?utf-8?B?Vnh2WmNXZUFkakxqRHdTRnlDS1h2bWtaMmNPTXdKaFNXUlgzOGdCYnZEd1pE?=
 =?utf-8?B?T2J5WTZyeFVyNHJUMXgxTGRmVmk3a1ZIZTQ1d2wvV1NDRUdaMjFSTmQ2VWtV?=
 =?utf-8?B?NktkK0k2OEUzdVU2NnlVSVk4Rng1QVVYYmVOamZ5WjVRRUxLTVVwc3VFWlNu?=
 =?utf-8?B?algxMFVuU24zNVZQeWFiVVFRdmU2NFRtN0tjN0lWYTRac1BremJhV1k5dHhX?=
 =?utf-8?B?YTRPUTNhSU5rQ3oxVFBaVU4xak1qOUlTK2FCTktLT0Z3cVNHR0dBVll2VC92?=
 =?utf-8?B?cTVDYjFkc1R2VGlCL2wzT0svOE1Rd2pnNWVkTFExMjlqanRmWWdNajlUbkZP?=
 =?utf-8?B?TWtSVjlrSWJRbFgxWmE3QTlTR0JJcXEraTFnNm83SXFQTzRVbTNpckM1VWlK?=
 =?utf-8?B?ejQyNGFNU21YV3JHT1U4T1Fyc1M3cTZ1TEdjYUdyY0VEK0ZTSWZNdkxWcDht?=
 =?utf-8?B?WEg4b1dka1N0Zm9hNEtVaDhLWTlra3lSOXV4UmtJaEw0amphN0VBcHBDSE1t?=
 =?utf-8?B?dlY5NUJqMi9JUVFZcHdWdDNLL0I2RFpIL2RMbi9SQ3R5amUreE1vNm9haDV6?=
 =?utf-8?B?YzNic1c1SFpkYlplVUpOV0M5QlZnOHhaOG1VQW80TUE2QUovSEphS2toWEsy?=
 =?utf-8?B?Q05FTC9uLzhoTFJMeHFRMG1xYWV1SGwzQ1ZoTXRRejhIUk9BbUVZQVJpcjEy?=
 =?utf-8?B?UmtIbU14d2lYZlJpd1hITFdUWFFpUmdaa3RqbnpMaHcrMzRYcVNmRXJoOVIv?=
 =?utf-8?B?M0FvakdFN0pvcS9JcWsyZFcwRkduUndlUVI3S05tVWxKS1ZhQUJNKzByUXE1?=
 =?utf-8?B?QU1Na1FxRkNjbHdBcmYveUVhN0oyeFRYVUJHd3pJUDcwTmxjMmxiTkhQSlR2?=
 =?utf-8?B?MTRmcnJHNFFoUmZvQzFESEFBNkV4WGV3WmtxL0JXWmg4ZzF5dW91NWRYWWJI?=
 =?utf-8?B?MWE5cU1HTUxEdmwzVDJsWmFDNG5HWnJnTlNZS2lXNXY1Uk5UWGVBTFRXOWhr?=
 =?utf-8?B?U1ZaVm54ZXB1MTZxZDV3eWdKVXNFbnM5Z0oyK1Z6dStrSFJRMUxqT0JjT2d5?=
 =?utf-8?B?RVRpaERON3BHaHJHKzNYUFRHQlVVKzJkSThEeDFsK1MwTWd2MnprQ091RW13?=
 =?utf-8?B?K1VMNXc0V3dqQ0g4QUx4QUw3TklaYXJOTGJyNlVldVh5bytKaFAxbDc3cnFa?=
 =?utf-8?B?cnRaY1dGWGhuOVhNV2FVeXZFWGxCTWJVZFVCZERmSXQ4cDZHR3pnQXZnV0VD?=
 =?utf-8?B?M3pXdjVRMWlXcTE2bHJHTWRtd0NRNWowTk9kMit5NytaSWJOL1ZxbUhEd3pn?=
 =?utf-8?B?NjN2VVZJclcxSXNWUGd0d0szWTEvWmF0dlJ6WkVHZ1Rrc3BGT1VEWmlXWlZh?=
 =?utf-8?B?VWFTTlNMQ3d5TFFHWHJjQTIreUpxaGVzOUtmcVBmUFBSZDRJaHZqQm9vcmxW?=
 =?utf-8?B?cCtkRHEvRUtXK2krczhLWTUvNzNicXpidnlqbStnVHljV1owK1dNOVRpTkZH?=
 =?utf-8?B?Vy9Cc0l3aGFUdzQrNmFGU2lGTXVXL3YvRDNrbjQwUHMrSURWYkpic3dlSGJN?=
 =?utf-8?B?ME1ESnMycGN6bk44NkNCWXJoNFZCN2wzV25WdzBpMW1GaWxlR1RzdGRUVXUr?=
 =?utf-8?B?bE5IMG1wWnFYYlk1dlJNaFYrbEUySm8wZk5sa2VOTGQrM2lUSUZHNFFHWkRo?=
 =?utf-8?B?WlhRSytCWWpHc3M2Q2E1ekszanplVFdBaVNjMzB5ekdSQWF5OFd2MzRqa3JT?=
 =?utf-8?B?QnhuaEZpQ0YrUG90VlNNNnB6MU5PbEwxZ1puZHlFdU5KZXZFQkozM05ZZHdE?=
 =?utf-8?B?R3l6d1JHNm5BQWRzeWpua1V2L2pCc0FrYUVERWN1K3Bpam9RMlB5cVV6LzdN?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6447fa0d-7663-4145-5633-08de07d9c074
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:48:15.5500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JefkGh7bWtWasWgSLpULl+T51gr/WuuWO/CDfhFgEDeDn/qHhX6GlRa7KS+fEN/S5v6Obx9vVhki2pJ2UZI1JIBCrcWjP+XjSiRTwaSA4TQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
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



On 09-10-2025 18:36, Matthew Brost wrote:
> Moving to VRAM will fail if mixed mappings are present or if the page is
> already located in VRAM. Atomic faults that require a move to VRAM
> currently retry without attempting to evict mixed mappings or locate
> existing VRAM mappings.
> 
> This patch fixes the issue by attempting to evict mixed mappings or find
> existing VRAM pages when a move to VRAM fails during atomic fault
> handling.
> 
> Fixes: a9ac0fa455b0 ("drm/xe: Strict migration policy for atomic SVM faults")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>> ---
>   drivers/gpu/drm/xe/xe_svm.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7e2db71ff34e..b268ee0d2271 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1073,7 +1073,17 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   				drm_dbg(&vm->xe->drm,
>   					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
>   					vm->usm.asid, ERR_PTR(err));
> -				goto retry;
> +
> +				/*
> +				 * In the devmem-only case, mixed mappings may
> +				 * be found. The get_pages function will fix
> +				 * these up to a single location, allowing the
> +				 * page fault handler to make forward progress.
> +				 */
> +				if (ctx.devmem_only)
> +					goto get_pages;
> +				else
> +					goto retry;
>   			} else {
>   				drm_err(&vm->xe->drm,
>   					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> @@ -1083,6 +1093,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   		}
>   	}
>   
> +get_pages:
>   	get_pages_start = xe_svm_stats_ktime_get();
>   
>   	range_debug(range, "GET PAGES");

