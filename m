Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9A1CCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 11:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5BE10EA75;
	Fri, 24 Oct 2025 11:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXVeDK4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BDA10EA75
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761306762; x=1792842762;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=olzi7Cqwxgk87Ewh+uDryW9G8eFIMcFuaRZMnC9+EPs=;
 b=hXVeDK4yBSkviM5QfTyOaQcum67+fZDXU6Dk9FcLwCGCNh59VNJxOG5C
 2oFE1e2gSivtJmmmUoDEkE6wWsKOwTQx55djOekekYhYuN4WAsDfWo3ec
 OGJgtx/h5GZQ7bT2OF7QDMsWpr4+455vIjZpdKec2ZTsoQ+ixCfZBtRCY
 nO76l1eiH1z5II0h78TgfUPqdnFPEKQruF0Lg2lNEG4U7JpSxLBtZIH0R
 YiPdowuIX+Tod4Gmleg/FOLxv5yT3q9Vei3Fl3PXo+AwShWYWGskvPSqC
 uzDumNO0nwdP5ZEWvFmqEA++39lvyYw3CUqjnSs9hpjyDdxPfXXxle3Ea A==;
X-CSE-ConnectionGUID: YdhkKgfrSVml89gOreIwmg==
X-CSE-MsgGUID: gg9xusKZQpOrjfNKYFVcxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63583623"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="63583623"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 04:52:42 -0700
X-CSE-ConnectionGUID: uqZeyeFCQUKJd0PmDq2hJw==
X-CSE-MsgGUID: JV6cTtDMS4WZrHDeNlMuug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="215334413"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 04:52:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 04:52:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 04:52:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 04:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toB/vfnY9SV6tHS5VkVBP9gbCsQR0eNuFRe9l7jKqEWIERdI33JLCNyFrN2WP7U8bYq5nxVE5ZP7TFu8rkT/DmtjfZDZRoZ5pqZ95MNNBGU9m14UH6sU5TNwBU7r2JxuQ4JM/A+sRS5AyaOgSQW0zkpXvOooO8YLlzkDykMUt3dKu31MLlxqKtREpk2FjOG21gdwh3FPPdyhB2lnLSjX5nSLRIHZPPXsV4zZmJ37tUKmkbem3yZPqEICMGVboKvhVgQU7nDY5yn9kWy0OTQt3eRF+VSe/G4MhRZLD2kZFtn7PG7aY1CW6qNduPXYRmo6LvFHGby0eKnNkGX6TBk6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOFRY6uNVZInS9ZsmHiygJdvMcsCXwuY22UWD5wiA1g=;
 b=fLlat4EpO35De1umtC8rB6hy4FWz46QDGNbkz+NN4AyEWe/ngvxnhIIDfL08HM2KUNtjrCv/FJmZTLJyiKLokrvN5lRKipbXAX+0eVYgHIi02f9Wgc7XOOssavfbbPfZ1QlT/1NPYp11i8HEHsN9eEXlQFu97QvJjnxHjvhJ7V6+LWv92KAgcurEvnAZlW1a3jyeK2jcd9dy4J4LdGGirhiCKvbJlKRJ3SeqONO7RHhZe9Z2RzVG3Ye2Wqr9Y4P8p6U5hIn/DbrAW+qzkcLskVV2Q+B4GAcIoAA3wLl11JH2tVJ5H1iqb3Vp5QF4aqSlEdrPA9K4sHPKTKrSW1F9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 11:52:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 11:52:33 +0000
Message-ID: <a5948b67-4145-46f6-b83d-3831d50ba879@intel.com>
Date: Fri, 24 Oct 2025 13:52:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/vf: Use fault injection for testing VF
 double migration feature
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
 <20251023153616.3790-6-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251023153616.3790-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0038.eurprd09.prod.outlook.com
 (2603:10a6:802:1::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 0340a62b-b0e6-4c6d-8781-08de12f3d124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDBEL0E4b2NNMTRGSVdEclRyL0V2THRMMHhFOEY1Rk1XNENDc2F0UVJybldj?=
 =?utf-8?B?ODc1T01sUFZEUXcvSEFJVXZ1cmQvcTV2Rk5QcVlqeDZNT2RLdmZIc0VKNlFO?=
 =?utf-8?B?N3BUYUFEbUVnUWlSdDJvWHZlR1IxOEdJbFdteWRyZ29uUDdrTXhPSUhSUjY3?=
 =?utf-8?B?dGpnNDB6ZHFCM2llWit2VkJMa3BzekRqVXplVndldi9NNC93cWxsbFRrK3dC?=
 =?utf-8?B?KzBEc3JLTWt0bktXZytaU2luNUZLRjd6NjVQTXMvbmpaLzZPRXpreVcvN21E?=
 =?utf-8?B?ZU1lcTZSUGhzaDloQWt5NnhxVVFNd3poZHBxR2tJZGJjbTFLMmoxNXFGUVNq?=
 =?utf-8?B?eVRmTmRDdThMMWxHVUI0d3lXcm9NUWt1TkdRQU55SFZHZHd1MFduMnRFMnJR?=
 =?utf-8?B?dGFpcGgzR0xhcEt1QWY3SXhUNVlhU3AxWlBkM2x4SUk0QXVLL1g4US8zSXB2?=
 =?utf-8?B?RGw3UmorNFQ2eTAwckNIRVpEWWU2L3JkWUFiUXRRZURCTUFiREdnR2p6cFV1?=
 =?utf-8?B?ekEwZU9nMi9ncFZBejNTQlhjWjZPVUtxczdzRTJpcXRBRFBuaWxJRWNVNFVJ?=
 =?utf-8?B?S21vSUV2aTYrdFdXaXFraWxWQVhvV0wweFdkQmJzZEd4WUM4VGJQOW50SFFW?=
 =?utf-8?B?SVR6VDZmQW9ZclprNHVNT00vb29WeGNQUFZPU1BsN3BaOHlEeTlDZlpNR1dS?=
 =?utf-8?B?K0pGZDdtMHVLakc1QnNFVEMyRi9CK3c5eFhQQlJFNlc5cUdrUUE0NEt4bi9G?=
 =?utf-8?B?MGdBa3lJaXFzZEdtZk5SKzNmQUZZOHZ0MklzQ1BHMk8rekRJRWpCMHk2Qlhu?=
 =?utf-8?B?QTJDK1JZWm1KVUlpRVZJbzRJOXMyM1NvQnJpY0dKdHZlemFuQlFkZVhaemEx?=
 =?utf-8?B?dTBJMlo2bjdMWmlkWk5UcS95ZW5CeEF1VkpTY21kZGNJU1pnNTdXZHpjU1FU?=
 =?utf-8?B?UUg1dExHOElvbkVwdllyN1ZKdkNxcjNSVnRycndvZVh3cHZCVkNFemZsVXQx?=
 =?utf-8?B?Q0Y1dnhBZ0g1M0FtN2RmZDZlKzJWS2xRV3kydHAvVmpPR2p6WkxlbGlveFNh?=
 =?utf-8?B?NWsxZjBWRzBzUGJ5a1ZVdVJ5Y0pnSVZRVS9nV01GdkltUm5JL05BN24vUEpN?=
 =?utf-8?B?ekk2M0JxNktabGgya0YxZ0srUjFuZjRVTlk1bjVZWkRHSUpMUnpPWnQ2TGYy?=
 =?utf-8?B?Zmh2MEh3UnljLzUwaDk0TCtxendSKzJ2QXJqUkhMWUpuVGJwNFNIdXpHaWYv?=
 =?utf-8?B?WkdpZEVKOUsxSkpCdFF2V3dDQUl3Q3JVbHd6VjBWaXNucWNibEdXeStxYVFK?=
 =?utf-8?B?NDZ3QjBKZU9TaGNoZGpiQmRWQ3lNa3RFSW1PbHR1NlBFU1FvSWFyZEp2clpI?=
 =?utf-8?B?emluLzBjUEFxL0M3eXJUMllvbXNHeTlHaFlEUUZyRktJVWRIUTB2VkpyZnVs?=
 =?utf-8?B?OWJYWU4yNU55NFUyOUF4TklweitxSnhDS3Zrb3hJdThOS1RrY01zdjlOSUtM?=
 =?utf-8?B?KzNuQm5waGQ1VTIvRUc4WWFQT213TWk0RnJXOTk4azZtNFZLUjVobzFYODAr?=
 =?utf-8?B?cjI5dExHMEJSUHdsMFJ4SDhSd1FMOE5qWUZtQlF5eTZocHROWDRZSXA1NEJM?=
 =?utf-8?B?NG83bWJvMFFMVStVMGE0RWI5RHUvcTI1d1dNSk9yYWZtS0xhclRPYXZoS0RC?=
 =?utf-8?B?MEZ0RkNlRlhFSklySGJESzBvUFJjS1Z5YXJuMzdUTnhJRGcxMnVDdnRxSjJF?=
 =?utf-8?B?aHJoQ2JkSkFuK0M1S1JDbzdIQmZqdFNVcEtLUCs5bnF2dW11N1pPUWkwNzlp?=
 =?utf-8?B?NkN2SnFmbHhwTWZQclVvSlNRZFI3ejFzL0lqdWNneGVvRUh3cTFsRndLbW4z?=
 =?utf-8?B?ZXI3ZjFtTEY1MWhjNEE5VVJvYndqTVhIZWpzUi8yT3pQdnZqY3FvdnZLdDlz?=
 =?utf-8?Q?fhTx84dtVUdmEzTEFA7Ciet2a0pNGQhY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zi9SWjhJbzVYQ2xzb3JHSTYrV3djZmFvNE9zTVlLSTVuOTN3MUpWcXlnUENj?=
 =?utf-8?B?VVFiSFhTemJyRjdocDVaWWFRbmgxRFdOMW5zYVl5Tkc0Sk93b25wcW9DY2R5?=
 =?utf-8?B?anJxaDJwTTFxMURHQ3VlRjFaTGZBaFpyd2ZlRURSNXB4dmtrc0pBT3RRZzhU?=
 =?utf-8?B?RWFnRC8vOUlITGJKVTgyRDZKcGVhQXh3cTkrL2tYbzIzVURXT2hDaDJPeTZ5?=
 =?utf-8?B?dWdQcytRL1cxVU5UZUI0czBHL3l1UzNINTZyZDI3UmtqRytycEtnakY3L1RE?=
 =?utf-8?B?Qi93R1lPUGFYSnFMVWtyMGhkalRPZlQzdlJsUDBndmFFdHpScHAvdjRTeTh5?=
 =?utf-8?B?b3A2VlQvc1N4QlRQdldldFZmWElIOWE4LzJzbThlUE9qcG9OcDFTRDh2cWJF?=
 =?utf-8?B?V1RNTWdwbGNmUEgrMkg0bk8ra3llUy9KWGZ4MGUwS0lGRXFJVG0rQlZqUkpq?=
 =?utf-8?B?bms1ZjRyY1QxQk1TZUFWWlZ0L3c0SndoT1czOUdyQWNHb2N6TkgrL3hybXZO?=
 =?utf-8?B?VXRZcW00SzB2cU11SmhjUnhTejNpa2ViYkJuTUF1VXRNZlBPN0ZPZ3FvK2U3?=
 =?utf-8?B?V25FKzlQc0U3NEpXd3RaUCtCRzlvKytmZkxHZlAzSzJFZ2FlY3JjaHBnQ0tu?=
 =?utf-8?B?QjlXZkttNHZjdVpRWWs5bUNWWHU4RDFtVFpDcklGblJ2elZSRTd4Tmg4dWoz?=
 =?utf-8?B?emR6Mkx2aWl2YmVKM2ZQY3VuTjNWSyt3NkpqckMyNFpwTjkramNvVGRGc3dF?=
 =?utf-8?B?bnJoK05aNllEUlVhcDZvTy9NQ1pZQTBuV0cvN0thelNpWlhiY3FoUUZhTmEz?=
 =?utf-8?B?TVNSM0VpTmYycjBsS1RwL1drRlJ0WEtDc0pzdnp3cEtXVEh0ZUxTa1dhNCtN?=
 =?utf-8?B?aXJIZ28wMGtodWZXU1VqcTFDWEt4dDdZRzUvNTN6WGdKSzhmSEIrNUloQ1A3?=
 =?utf-8?B?R0laRXJYaGVmaGtGUmJuVTlKZkxFV1BCZ3h0eEUrbEhSdVVCQXJtVGo2ekIw?=
 =?utf-8?B?MDNiVy9iZEhaSHdtZVVPTGc3RmZkQTg3TmF5eEZNL0kwOU1UNExTTTE5UVU3?=
 =?utf-8?B?WU1vYTk2L2p3RWZST3ZxcGd3SWF6ZytSdWhhbkYxSGNkenJNQml0US9IS2dX?=
 =?utf-8?B?R0hmRElKV0RCVXJBK0x3cFBucE9zV0NIWmJJVlRXRlJmWCt4SEdkMmRPTU4y?=
 =?utf-8?B?eGM2U1MvbytjZ3E4S0VHRDBwS0JaN1FLbTZpbzlZS1VMV2N3MjlRSHdteTFM?=
 =?utf-8?B?NEU4NmtjOEtabHJJbEMwQVRZL0JiMVgxUGpqREdYNU1BRm9HcURZOGpEd3VO?=
 =?utf-8?B?KzRqWlBaSVNnRnAyemZLUmtwU0ZXODdNYit0Zzc0TmhTVk9udFAxVEw1TVZa?=
 =?utf-8?B?ZS90VE1QY3lBV0JUbFJoTU1ibE9wOFZiY0xsWU56aDV6anVWeTlkVEp4K1Ru?=
 =?utf-8?B?UEw3TFplYkJWUmhMZDBVTjRlMW9VV1FTVEJzc3JEVm5DZEk2QkkxSC9OeHhZ?=
 =?utf-8?B?REVaNEtML29kZ0Y5aEdNNVFJbmcxTUZhSWpZeFJqSXMxSVJzR0hlN1ZNcGdN?=
 =?utf-8?B?NDZEbmNJTlhBQnFoSkgwYm5nMFdoT08xd3JSbStrZjhGK3pmdVM0NjJ5YThJ?=
 =?utf-8?B?MHZ6cDdoVGMzbWIvcEVrcDMvZlJySDZlSjZOZEFJd3QwbWlCc3cxeGVwSUw4?=
 =?utf-8?B?MlJxTWZJWEpLVUtNUjNwVWJmdDZsN0hMNVdsL2ZKc0NhY3hldVh6VFAyVzFu?=
 =?utf-8?B?bWp2K1h2bC9iYkF4T29lQU1PbEF5dFBXdmxGZm1XR1NoNmdsQTR2M21yQWNX?=
 =?utf-8?B?UFlHbEZFYitmd2lsVDJmNmIxdkZydGtORmRSQTZ4RFJvbjJjUmlRTU9IS0Yw?=
 =?utf-8?B?ZFpONVZUMkswdzVSVGdZVkh5YS9wK09reTZZUzM0clJSQjhjaUxEZmFtQjdu?=
 =?utf-8?B?NjJKellETllSVE9sSUxEYVFZOGRyNklxM1Fvd0RYeVRVOE4yejlnUGdCbHFr?=
 =?utf-8?B?N2gra2kwS2MxcmFjdzdnd09pM0RZMGdoRFJFS2RWdklKQ01QWVhRRFErQzNR?=
 =?utf-8?B?ejEyekFDbHlsMDFleERqOVFrbnM5VkFqemljU2hlVkhJZGRKME8zMTFSMEVj?=
 =?utf-8?B?dGxuMnhQQTExQ2ErRTl0SCsvSktISFMxN3dUZDU2UlAyYnh0azFjNFRBbHJP?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0340a62b-b0e6-4c6d-8781-08de12f3d124
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 11:52:33.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFqMwjG9jUH1SX9E6S0deY0Tp+RrS2DgZb6w1A3teCkAaKESOXsgbKd5wDugFLkmfjsY3dHMKyGkCUX4BDEqbdKbDANYMatnkYzZg563zBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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



On 10/23/2025 5:36 PM, Satyanarayana K V P wrote:
> The VF migration process sends a marker to the GUC before starting
> resource fixups, and sends the same marker with the RESFIX_DONE
> notification. This prevents the GUC from submitting jobs to hardware
> during double migration events.
> 
> Testing double migration requires triggering a second migration while the
> first migration's fixups are in progress. Since fixups complete quickly,
> this scenario is difficult to reproduce reliably. Use fault injection
> framework to add a 10-second delay in xe_should_delay_vf_post_fixups()
> during the post-fixup phase, creating a reliable testing window for
> triggering subsequent migrations.

I'm not sure that we should abuse fault-injection framework for this

can't we simply expose some debugfs entries that would point to the delays we want to insert at specific places?

this will allow to pass different delay values, without updating the code
and will actually require less code, with no tricks, to implement:

gt_types.h:

	// gt->sriov.vf.migration.debug.resfix_done_delay
	// gt->sriov.vf.migration.debug.resfix_start_delay

gt_debugfs.c:

	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
		debugfs_create_ulong("resfix_done_delay ", ..., resfix_done_delay );
		debugfs_create_ulong("resfix_start_delay ", ..., resfix_start_delay);
		...
	}

gt_sriov_vf.c:

	if (resfix_done_delay)
		msleep(resfix_done_delay);

and in the future case, when we would need/want to delay some actions during the probe, ie. before debugfs is available, 
we can just add configfs entry with default delays to be used by the driver to allow test corner cases:

xe_configfs.c:

	/sys/config/xe/BDF/debug/default_delay

	int xe_config_default_delay(xe) { ... }

gt_sriov-vf.c:

	gt->sriov.vf.migration.debug.resfix_done_delay = xe_config_default_delay(xe);
	gt->sriov.vf.migration.debug.resfix_start_delay = xe_config_default_delay(xe);


@Lucas ?


> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V1 -> V2:
> - New commit
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 8c1448d6c81d..63d43553ae4f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bsearch.h>
> +#include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -1183,6 +1184,30 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>  	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
>  }
>  
> +#if defined(CONFIG_DRM_XE_DEBUG) && defined(CONFIG_FUNCTION_ERROR_INJECTION)
> +static noinline int xe_should_delay_vf_post_fixups(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(xe_should_delay_vf_post_fixups, ERRNO);
> +
> +static void vf_post_migration_fixup_delay(struct xe_gt *gt)
> +{
> +	int err = xe_should_delay_vf_post_fixups();
> +	unsigned long delay = 10 * USEC_PER_SEC;
> +
> +	if (err == -ETIME) {
> +		xe_gt_sriov_dbg(gt, "Delaying fixups by %ld secs\n",
> +				delay / USEC_PER_SEC);
> +		fsleep(delay);
> +	} else {
> +		return;
> +	}
> +}
> +#else
> +static inline void vf_post_migration_fixup_delay(struct xe_gt *gt) { }
> +#endif
> +
>  static int vf_post_migration_fixups(struct xe_gt *gt)
>  {
>  	void *buf = gt->sriov.vf.migration.scratch;
> @@ -1196,6 +1221,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	if (xe_gt_is_main_type(gt))
>  		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
>  
> +	vf_post_migration_fixup_delay(gt);
> +
>  	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>  	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>  	if (err)
> @@ -1304,6 +1331,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_fixup_delay(gt);
> +
>  	vf_post_migration_rearm(gt);
>  
>  	err = vf_post_migration_notify_resfix_done(gt, marker);

