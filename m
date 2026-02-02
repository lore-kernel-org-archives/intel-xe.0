Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020B7D172DC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 06:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64D010E26F;
	Mon,  2 Feb 2026 06:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1z3oqML";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB87810E26F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770014313; x=1801550313;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qHJ2QoAHwdMCnnDgUDz3kTNXYEoo2eKBs87qypHwJgU=;
 b=Q1z3oqMLjCM0FqsfKd28TM8gnp5YafPNL2Cozpo/yz7teGMSbNTGgKga
 n3ecuUt3xF9DW5jQWC5I/H3sLG+DdPnDnW2eJ5IM7rigJB6YmLkyWz1gq
 eV77zqctE3jBE4jQQiIJJN59EyJ8h3AxHrWbu7yyspF3vlbF0ibvwURDo
 m+7lxQcK6++cAi+15dGrTMWmjQXi8KGc8PvshikqNtFTfSMjr0GEIkbRS
 ARD8XU/ej5lYD/hU4otovCRKtEbAhbIzmcmM/1B7kWMVZUnhWX6PghKdC
 Y1ubO1s8litJvNXGpAfr8wVf4Iu9FGx2GNmLgOgBHggmZGHgX5o3RaewZ A==;
X-CSE-ConnectionGUID: E2SH0dUER8Sx4DwrncsSCg==
X-CSE-MsgGUID: xpbH6KGJTXy3rd91JB0zcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="81482257"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="81482257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:38:33 -0800
X-CSE-ConnectionGUID: +/AvGHpzQOGdajwCi7eSMw==
X-CSE-MsgGUID: AsdnuHAeTROx0nye3uf2vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208691973"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:38:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 22:38:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 22:38:32 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 22:38:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPMsQmjTnSg0ylsQxpNM+JbaJ0pV4U1vkdLySGuF2jnZxVxtvn3LyPgE0V9wQRw82aEZ1vXGg2GdqQj3pZqSKw7XU3xwCQ3P+qImEZq/sW5+yIivwtJ78WUqHILwA6sOqR1/1B8dodvwrVmfFjc7bitMXgAV38Im9gWESHysmUDxs8wFyjUf+OgYqDpBXOEaUj43hIb19c6pBc9REf2ErkxY0c0ksJBU3clC6cnniOa2EOG664qAQg4odsGE8Oi7IajqVfYhfQdLa6pUdklT6RcH+RUkHtNI/typsP0ddn8SjmCJ2jRr77rtuHrgFHvE8eH5eOnXQOmNIkE8qP8uAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIayBpg4dTpePeL1Wz+N15WOYmIFoYiU1RyuCIGEiqw=;
 b=Iwnh/FIVg4uZZ5KymCsGuIm87V4Fm5/D12i2jyhawhJnYfF1kLtDbqKa0gtyeJXeTOILd2nrHpmmxYjvI0B+ExzyoSaopw7D02QWWKsUGaD4nBkYmMVygrxxaAhIzRsJO3p26RBPfFuVjr5Qutbc+D+d7wabe4l4s1HnrmMc95bdUVFtLgIVwn+Zp8LtmjbynRn8DnHAUOSyEmZV85HbGZw1+sKjgod/4co0XO0fxJkf+PMOm+dF4l14MfKhUNbXcRiqvXgd/j/7OfUfgJNQ/ZhMSVxmf0c54XN7BvbVGUnzBHRlv+E+Ryg/UiOG+6EkHsbC1JAsELg0bmVXGulWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 06:38:29 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9564.010; Mon, 2 Feb 2026
 06:38:29 +0000
Message-ID: <7a7b4693-8a28-423c-bbbb-8b16b4ee2de7@intel.com>
Date: Mon, 2 Feb 2026 12:08:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add forcewake status to powergate_info
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
 <20260115224040.2668209-3-vinay.belgaumkar@intel.com>
 <a5187a5e-f74e-4d8c-a435-131a86d5f649@intel.com>
 <c07e167c-33cf-4497-8a31-e88c5a0414a8@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <c07e167c-33cf-4497-8a31-e88c5a0414a8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 831343a9-5610-48c9-5334-08de6225ad4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0xYMkpaZjdmTXpUclNZWWVIMmw1YlYyd0VqREE1UVFEakVkdHVjZVQ1ZDRW?=
 =?utf-8?B?dmt3c2dtaVUyVjJubHNOVy9pcHI2TjhoSW8zRmZSc3NuSGZGS1kwWjM2UlZN?=
 =?utf-8?B?eTB2YlNRYlV1UllSSmhKS1BDc1JqM01CU1lVaGtuUlp4aXY0T2Fnb1NsaDZS?=
 =?utf-8?B?RzNadGtaMVlRRVVTWGpNYXozWjBoZElWQkFFSGJuTkQ3S3VwbWhvcjI5Tkcy?=
 =?utf-8?B?NmVKWHd4bUNaZnNvbllSd2RkYk5ETlEwUTFpam5qUzlCWXF4UVVxQVJJMFZi?=
 =?utf-8?B?aUhFVGxsM2FvU0VDQk16eVFvRytEY2FnNHpXK2RTWWgxZHBXSTNkcTA2VWdp?=
 =?utf-8?B?KzBFUFEwcjhLT1F3WjdKU0RGcVQrVWZBZ1piMFo3SXRya2wzYk00V2c1M0Rx?=
 =?utf-8?B?ZTFaMmErS1dDZGcvSmtLR2FxcUhJMzc0MzdwLzJxaW5iK1djdVkrTUVsd21E?=
 =?utf-8?B?djZUSWcyOVBuQVNoTHF2N0I2NG9OaUlpVU9QYUlUSWplSmNYR2tJTlZRVFBB?=
 =?utf-8?B?bmt1WnR2SFg4VU5ISmFkVG1CZllIcnNDOU5QRDh0aTdJMDd0TE1IUThZSzh5?=
 =?utf-8?B?S21LdHJlWCthcjRHOGlKcEF4dTVNZVk4bkZTOStIMDJPZHNkei8xVFptdTVW?=
 =?utf-8?B?MDFJVk5UazlMUTJmMDI3bzkzcm9yaTdlMUtrUnJtcUtreHYrQUtFWTZHcGwy?=
 =?utf-8?B?eDJPUW53OTVEbUJhRjNqQnlUcVFXUUFSNUFVQWgwNkpCeVdmWitVbW9kc1hy?=
 =?utf-8?B?N1ZsVjdhSU5HYW41elJudE5LdG04NFNzSHpzZDZqek1QdXc5UlhiVmh4ekh6?=
 =?utf-8?B?OERjQVFOMXJoazBLcFBhTkYrWEtRSllwQ2RJN1ZGZmVSTS9McnRRWDYzVWF6?=
 =?utf-8?B?dVNKZ0hyRWJJbFJNVEZqQTh6TE5OVE5HM0E4OEd0a1c3OG10SDFqajRqK1hY?=
 =?utf-8?B?TDRDajVyTjUrR3J4SUVQMG5OckRsQ0pqN0FmUTFtWGE2c1NFWmRXWndiODFG?=
 =?utf-8?B?elhhVUdoSVJXeGNKUkFDSEZDZzdtc0RtZmdNOTNRek1qTUt6ampOMlFkN3F3?=
 =?utf-8?B?dmhYR3k1Vk9JbExFMnU5Nk50d29wbGx1c0I3ck94WkVuRGQ1b2JsODhzWlVM?=
 =?utf-8?B?cm4yOWNsUWR1ZFFjenl3c2hwSTRGRm5Zck5tcDlUdDFtMXNtTXM5Q1F2WlZl?=
 =?utf-8?B?TEtpM2xES1NjZzJPakdGT0xmVWpzOHVnQ3V4UnJndVRERGkveXM2QXJzSmFX?=
 =?utf-8?B?c1EzUkVBTGlXUDlqQ2xmS21BckRVMVFFL0pIbC9QRi9hMDUzWU96Z3JUK3JJ?=
 =?utf-8?B?K3AwcTduSmVLOUZiT3ZhY2dleHBnOHF4WlRSZ1Y5SWZSRWxyN3FHRThhcGxP?=
 =?utf-8?B?ckNUVjFPWGwvM3c0RFMvVXBZYnA3K08zRFF3ejJFUVZFUzBZV0xHUmlJVUFO?=
 =?utf-8?B?cURnMlZPZ3pwZlJ5VDFVUDVnOGZ4QTIrWWZjU20zdGtTaXA4WXRzYTBKUTFY?=
 =?utf-8?B?L2pXa2QzcFY0Z3g1UUlZU2VKOTlCSVZrWkk1MHp3M0M5K3VVcEMzSmUzRFZu?=
 =?utf-8?B?N1BkaUpKblhWNCtEdW51YXRtOHprQ1pWRFhoMXFrYjBheWd3dHVQL1k4c0J0?=
 =?utf-8?B?U0VFdzcyL1RMVUFsV2g1Ry9EVG5YNGZ2bTN4UVp3TlR2TjBKL1dHSTZ3Vzgx?=
 =?utf-8?B?QUY5TXVJMHFYb0hSalZmOVBpNk9sYnFkTnJCMU9DWkJWMUU2NVp0aWt2b0Vy?=
 =?utf-8?B?V2phZkRFWXNRQUhwZWtub1prU3NKdGZqckpCdVpnS2pDL0FaNXpoang4RDlm?=
 =?utf-8?B?QlAvUkRRanJETDA3V1hBVjcveXQ2bVBpRHU1VldXVGFHdFRFWHdISjZiK0wr?=
 =?utf-8?B?WUpqMFZBTE4rOTJXZG1tMkgrWXV3TmtYTmtxalhHRGd0aTR4L3FpYkVYQ0JS?=
 =?utf-8?B?eVNrcXJpU1dyM2gzNS9XUzJOWXZ4NUd3R1BIOWRSUTM4UTJqZml4VVcvQmVz?=
 =?utf-8?B?S2gxbTBDYzVxMk0wN1RmZGhua0Q3U3ptN2FGUnF1cXlkdmIxVlI2MVEzQ3JG?=
 =?utf-8?B?cEZwTjZGTmlUZzVGN29VbzlOUjNBOXBWWFVuaW5YTU53SmRScG1pZUNGRU04?=
 =?utf-8?Q?zWPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG1pczFyck1pOUVrUWlYTlZtd3hYNnh0OFdjeUo4L1pQd1RWK21ucXNKODFT?=
 =?utf-8?B?YzdIZkhkRHROeHRVWGdWZHBvWFd6SGFFM2txd3JxYm1VejFZdjhxT2RkUFFV?=
 =?utf-8?B?bDRaZWp1cENSbkR2ZlRRVkRLdWdWOVRIMHJDQkRzVWtlN2drWVpmK05rMHZC?=
 =?utf-8?B?YlNzb29Sai9LdUg2R25EdU00aUxkajBvTHhFeklFbmJYWHNSeWt0QjdCV2Zm?=
 =?utf-8?B?Tm5Gcyt3Z3NTUTRSMWloTWhjamlLMytoZkpXRGZiQjdHTTFvUmhmbTNMRzVm?=
 =?utf-8?B?KzJTSGR1QWhOL01iUEdIUEJpa2kwcS9aZzhrS1RwdU9STVFKRGNnTjh0WWlB?=
 =?utf-8?B?Y1BicGlyQW5veGsrbkdRVHFzSXdVUGp4U1BNNVpkYXFWSldKcnJ4R0I5RjMz?=
 =?utf-8?B?RVQ0a3JMM2Vhb2hrTW5RUUp1a2k4bzlEWWpkcUJnM2NnVEZxSlRXWHVGVk83?=
 =?utf-8?B?U2Z0WjdDZWtKdFMyZ3o0K3l0ZE1CUEJzVFJkWXBVRTJxKzVmeTlmUWFKNEpZ?=
 =?utf-8?B?a2RPay9md0syUFdncXlHODFCb2ZpRmlieU5mbGlCRm5JU1c3T2lWb0xCUUtL?=
 =?utf-8?B?VGc4ZDd2TDcvQkp1NzE1d251ZzZ3Tm5YWjlzYnFUMUVQbXppYlpObk5mTzF0?=
 =?utf-8?B?T2hXd0ZIdU13WDdJZ2orancrSG4yekVwR0gvQ0NzUFpXaGJOVWxCZkZFcC96?=
 =?utf-8?B?UEg4MFNTTTRxT2tTd1hvYkthMjd6ZW5ud3ZoRm9OdzJTSWx0RHZRZWJaMVZR?=
 =?utf-8?B?MGltcmFSelhCTEpDRXJJR1VLeTRJM2tQRXZXMXE4djhEN04zSTFoaHFPSld0?=
 =?utf-8?B?elBoemJydVpaamZGNXo2V082SWhtSjBTdndaNlFwdTNVb1BXUW5TQlFGNnVr?=
 =?utf-8?B?Ni9GRWE5OUhuRWNhUEhmUkthT2cvc0ZnVmVHT25VQmwxUU1iaE5zQW9SOHgw?=
 =?utf-8?B?ZFM1eitIOTBMNUhkZWM0ZFI3WWtKUjJra1FuRGFXbnJHdFB5aVJMTkwzTjBt?=
 =?utf-8?B?VDJUWkFLOE9kOWVLYml5bnVBQnJ4REVNbFJRU0RKOFJHK2kvdEYxaFY5bnhQ?=
 =?utf-8?B?aDk3emFIWFBQNTB6VG1CN0twdFNITkdEVVV1Y2x4SURZZ2syU3NRcVRqemV4?=
 =?utf-8?B?V2lkRVNjUm1ra3BPU0NPeDEvd0JnTnd5V1Z1Vi9rbTdKaGtiRE5tT0dJNHVp?=
 =?utf-8?B?N1pKMjk4ak8wdmxZRDV3ck1sUzA1bGF1aHJlTkh4dDZNTE1XcnNSSkdITE1E?=
 =?utf-8?B?aE5PeXp2aXY4WnNxS1ZyRlRPK0tETFBaQjRkWlRMSTlCUWdVQllWZ1JVNGZq?=
 =?utf-8?B?cHhDUnlOYWozM2lZWW1FL3pza1JhTGlVd3ZodUswaEh3Z1pkajBUMjdGVDhu?=
 =?utf-8?B?bFpub290b1kxamtoSzZtM3B5YU1mdENWZzUyOC8xWldCZkZYUlFNbC9RQnUy?=
 =?utf-8?B?YlBkc0lsYVVmekZIcWFtWGNLdGR3WnNTODRhUzYyWWwxUnlRMWFtTGh6MHdL?=
 =?utf-8?B?SzVPUHRrTGExZUkxck1vM2xLbUpmYWZSbVVtNnNmM3VRUTc1RHdYNGlJb1l4?=
 =?utf-8?B?dVJJWnZXNS9RdGxUNmYrbVplbzBDUkh4TU9UM2EyaDZHMEhiV3VKeWxTZnBF?=
 =?utf-8?B?THZvVko3UjluMVNJVmFTeUpTMlVhUUc1aDlGamROemhnUXJ4YjBycTBaSWZs?=
 =?utf-8?B?L1crK0RlODJDWUljZWdHZWdNTlNCOHlTS1VyeFJQczlUeG55RlJHRkhjTUpE?=
 =?utf-8?B?NTVMaGU4ZlR1Uk5tS2FxdjZCK2lxRXpURkE2RnpWR3kvM2s5R0RHRmtFaXpO?=
 =?utf-8?B?dGRRWElpUFFCTHZxL0xZYnlNZTNQMDI1OVllcWZiNG1zY2xkazZLMWhya0cv?=
 =?utf-8?B?Tk1tQ2JFS1A4NmYrRkFTcFNMeThTdll2U1hRLzFpeDg5WmZKRmxuSlZkQXZQ?=
 =?utf-8?B?MmdQbC9aYnIxVHFDTEVKV1c3OGIwQW8wcTkrVnlaR1BGQmM1SnROWXhmRFkz?=
 =?utf-8?B?S1k4Z0NMendLYWxONjFZeUlhRG4za3VNSVg4cE9WRVZGdDJWd0I2di9CZ2p2?=
 =?utf-8?B?MlhIaWFKeDVMb3NyR1Q2RUQzaEJCdDl2d1RVeWVTcUwvRUFCYUFnMlNCTWpu?=
 =?utf-8?B?NUwzNWRGOERvQlcwU2c2UUh1SXZLQTBUYTR0dXhNaU8rVklQSEtRVXdUb2ZN?=
 =?utf-8?B?RW9RM3RwakdIelNGM1RJSWY2eDlJNlhrdEE0WmlpZXdablBTY2dzUXl6YUV4?=
 =?utf-8?B?U1JONTFKUGhSZUJ0eHM2MmdLaUhNUWlxMVBWdmVuMyt1Tm5aeDQzVi8zVjNP?=
 =?utf-8?B?Y2hRVXFPdEhVd2JFT3pHTkt3Y1dNL08xbGpxU251eEZNcXg5blJoZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 831343a9-5610-48c9-5334-08de6225ad4b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 06:38:29.4909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEANsT08Kg/tsWA6UxDYj80IfiL188kecti69azapeE2jZZD0GZkiESTasCd4m3FKiGddviZZKTlcDYi/De9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
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


On 30-01-2026 23:04, Belgaumkar, Vinay wrote:
>
> On 1/30/2026 7:20 AM, Nilawar, Badal wrote:
>>
>> On 16-01-2026 04:10, Vinay Belgaumkar wrote:
>>> Dump forcewake status and ref counts for all domains as part
>>> of this debugfs. This is the sample output from gt1-
>>>
>>> $ cat /sys/kernel/debug/dri//0/gt1/powergate_info
>>> Media Power Gating Enabled: yes
>>> Media Slice0 Power Gate Status: down
>>> GSC Power Gate Status: down
>>> GT.ref_count=0, GT.forcewake=0x10000
>>> VDBox0.ref_count=0, VDBox0.forcewake=0x10000
>>> VEBox0.ref_count=0, VEBox0.forcewake=0x10000
>>> GSC.ref_count=0, GSC.forcewake=0x10000
>>>
>>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_force_wake.c | 46 
>>> ++++++++++++++++++++++++++----
>>>   drivers/gpu/drm/xe/xe_force_wake.h | 11 +++++++
>>>   drivers/gpu/drm/xe/xe_gt_idle.c    | 20 +++++++++++++
>>>   3 files changed, 71 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c 
>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>> index 76e054f314ee..197e2197bd0a 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>> @@ -148,12 +148,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>       return __domain_wait(gt, domain, false);
>>>   }
>>>   -#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>>> -    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>>> -        for_each_if((domain__ = ((fw__)->domains + \
>>> -                     (ffs(tmp__) - 1))) && \
>>> -                     domain__->reg_ctl.addr)
>>> -
>>>   /**
>>>    * xe_force_wake_get() : Increase the domain refcount
>>>    * @fw: struct xe_force_wake
>>> @@ -266,3 +260,43 @@ void xe_force_wake_put(struct xe_force_wake 
>>> *fw, unsigned int fw_ref)
>>>       xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to 
>>> acknowledge sleep request\n",
>>>              str_plural(hweight_long(ack_fail)), ack_fail);
>>>   }
>>> +
>>> +const char *xe_force_wake_domain_to_str(enum 
>>> xe_force_wake_domain_id id)
>>> +{
>>> +    switch (id) {
>>> +    case XE_FW_DOMAIN_ID_GT:
>>> +        return "GT";
>>> +    case XE_FW_DOMAIN_ID_RENDER:
>>> +        return "Render";
>>> +    case XE_FW_DOMAIN_ID_MEDIA:
>>> +        return "Media";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX0:
>>> +        return "VDBox0";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX1:
>>> +        return "VDBox1";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX2:
>>> +        return "VDBox2";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX3:
>>> +        return "VDBox3";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX4:
>>> +        return "VDBox4";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX5:
>>> +        return "VDBox5";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX6:
>>> +        return "VDBox6";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX7:
>>> +        return "VDBox7";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX0:
>>> +        return "VEBox0";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX1:
>>> +        return "VEBox1";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX2:
>>> +        return "VEBox2";
>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX3:
>>> +        return "VEBox3";
>>> +    case XE_FW_DOMAIN_ID_GSC:
>>> +        return "GSC";
>>
>> How about creating static look up table.
>>
>>     static const char * const domain_names[] = {
>>         [XE_FW_DOMAIN_ID_GT] = "GT",
>>         [XE_FW_DOMAIN_ID_RENDER] = "Render",
>>         [XE_FW_DOMAIN_ID_MEDIA] = "Media",
>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX0] = "VDBox0",
>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX1] = "VDBox1",
>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX2] = "VDBox2",
>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX3] = "VDBox3",
>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX4] = "VDBox4",
>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX5] = "VDBox5",
>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX6] = "VDBox6",
>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX7] = "VDBox7",
>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX0] = "VEBox0",
>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX1] = "VEBox1",
>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX2] = "VEBox2",
>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX3] = "VEBox3",
>>         [XE_FW_DOMAIN_ID_GSC] = "GSC",
>>     };
>>
>>     if (id < ARRAY_SIZE(domain_names) && domain_names[id])
>>         return domain_names[id];
>
> I was trying to make it a little more dynamic where, if something 
> changes in the FW table, we don't need to update 2 locations.

Ok, but even with a switch-case statement, you’d still need to update it 
whenever a new enum value is added.
So, updates in two places can’t be completely avoided.

>
> Thanks,
>
> Vinay.
>
>>
>> Thanks,
>> Badal
>>
>>> +    default:
>>> +        return "Unknown";
>>> +    }
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h 
>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>> index 1e2198f6a007..f7690cb34ef7 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>> @@ -19,6 +19,17 @@ unsigned int __must_check 
>>> xe_force_wake_get(struct xe_force_wake *fw,
>>>                           enum xe_force_wake_domains domains);
>>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int 
>>> fw_ref);
>>>   +const char *xe_force_wake_domain_to_str(enum 
>>> xe_force_wake_domain_id id);
>>> +
>>> +#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>>> +    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>>> +        for_each_if((domain__ = ((fw__)->domains + \
>>> +                     (ffs(tmp__) - 1))) && \
>>> +                     domain__->reg_ctl.addr)
>>> +
>>> +#define for_each_fw_domain(domain__, fw__, tmp__) \
>>> +    for_each_fw_domain_masked(domain__, fw__->initialized_domains, 
>>> fw__, tmp__)
>>> +
>>>   static inline int
>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>>             enum xe_force_wake_domains domain)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> index 52436dcb6381..8e36202f1a4f 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> @@ -169,6 +169,24 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, 
>>> gtidle->powergate_enable);
>>>   }
>>>   +static void force_wake_domains_show(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>> +{
>>> +    struct xe_force_wake_domain *domain;
>>> +    struct xe_force_wake *fw = gt_to_fw(gt);
>>> +    unsigned int tmp;
>>> +    unsigned long flags;
>>> +
>>> +    spin_lock_irqsave(&fw->lock, flags);
>>> +    for_each_fw_domain(domain, fw, tmp) {
>>> +        drm_printf(p, "%s.ref_count=%u, %s.fwake=0x%x\n",
>>> + xe_force_wake_domain_to_str(domain->id),
>>> +                   READ_ONCE(domain->ref),
>>> + xe_force_wake_domain_to_str(domain->id),
>>> +                   xe_mmio_read32(&gt->mmio, domain->reg_ctl));
>>> +    }
>>> +    spin_unlock_irqrestore(&fw->lock, flags);
>>> +}
>>> +
>>>   /**
>>>    * xe_gt_idle_pg_print - Xe powergating info
>>>    * @gt: GT object
>>> @@ -260,6 +278,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>                  str_up_down(pg_status & GSC_AWAKE_STATUS));
>>>       }
>>>   +    force_wake_domains_show(gt, p);
>>> +
>>>       return 0;
>>>   }
