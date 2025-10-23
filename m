Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06424CCD1BF
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 20:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C151510E1EB;
	Thu, 23 Oct 2025 20:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7ZgD0wt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D1510E1EB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 20:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761251862; x=1792787862;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9zNG0H9y6blED1XnX/T3zD9ZkdvyhhlzTGBclBpDn0Y=;
 b=B7ZgD0wtRu0Fg+Ty+TcHn3oZrE2jQ6Ml+Qf3/bryS8EbLsN0GLB9UX5m
 2JJ043V2rVXKc+E/W8cl5JRaT1R1qk/c39BQyimnqSUOq+td8/Zp9zhqS
 N1cYh+aq3SFdjVCDFYHbWaC5t9uo8GgzW5QdxIpBtjEeiRySHnk9IUkLw
 xcGEvgoPch33YZVGDLhT3TfZAas8rOmcIubWU+0CREW1Hn76qyyL5euAT
 l3TpDwyqQvUj1KkL7/IOBBQQWJRJs2Y7FBHHTrveBYG6wnXPM4ntsEXzo
 AVRLdd35aaABj431ysq+ksatQ40cJXYuloKzST+l8pXVuezmJII68G39t w==;
X-CSE-ConnectionGUID: CMJ2KdBQQDSO+adydARNNw==
X-CSE-MsgGUID: u+KP/KSnQtCHcfKlgp0xaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80869279"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="80869279"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:37:41 -0700
X-CSE-ConnectionGUID: dvwVE7sARwOE0m0UBHxrig==
X-CSE-MsgGUID: q4Ub76VhQoic43x3yRgZlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="183961401"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:37:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:37:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 13:37:40 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:37:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJK3Im0ctxPkXx3KZBWYKoW6C46TVObKoau47Fi59V6iFZ7lTySdL7gxwNR6vcyt+JyNkUoRvSlJsZdsl24TXMXIQoFmWB4wZ88HiO4PCLOAONb54X9y0x3Tg79nrtsVFIJWxU/MDrtXnmeWTo/thoTzc8IBQfxE+loQtDxrAk170kS3pV/Hcn7q1ZWc7KsGuipK6+GlZinQfsgT1ukrt2oGKhGVaJezgo8aUQd4jA5Kk1fpLrOEIn84X10NUzVElf8+oiTbuC3Kt72vhxX42dbuIxwcg85KqI6dZw1YcECf46Tkm8eqsQ8nYeoI3nd0vxaZz84SCo3x4r0nY0sfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THlJW1YJdDezVDvBGyraA30+Oxd+x2BmEyyk3OceDTE=;
 b=EQlOWpP8Ylck3HiHeAehukcVDcRktuiavK7Odh5QVRAmE7VpY4mK5nsackIlkgomMX5jx6j3lRTq8L55Y+Z+O/MMDa+TBYOiptCXqFzQmS3OEnBwvkUNsth2xebzTEf5uvw2xlRD08w4xg0Nl3qjnhj3m286uTfujcduoG73HB6VCFAEu34sUYnV+kJZAP4wowKD5HrpHeFjxKa1AfGO6poLBnbpYfZOdp7stl3VNDe2UIgpKl3mk3qt0sdT8l2C2KQ3zQ0VIM5qVl4LzzEtvFjOjnuRBik4Dr6lzWv873Uh3jlkLai25YJ559q4VgoZldev9CM5hWSquoIs7s2FKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Thu, 23 Oct 2025 20:37:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 20:37:36 +0000
Date: Thu, 23 Oct 2025 13:37:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Introduce RESFIX start marker support
Message-ID: <aPqSDVJ4QR7kzT07@lstrano-desk.jf.intel.com>
References: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
 <20251023153616.3790-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023153616.3790-5-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0189.namprd04.prod.outlook.com
 (2603:10b6:303:86::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8f70cd-b344-4b6d-37ea-08de1273ffea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzl5N3pER2RibWtnQ1NwaHZySnFXcitFU1FnNXJDYUh6TEwwYU9JaFBpZEpD?=
 =?utf-8?B?YnhCZGNvWjd4czNjZCtnODRPVUxPV0NyVEpPdTZRMkphQkl2ZzVwVFJJNzhi?=
 =?utf-8?B?REZvRmlZc09KcFpFZm9VQWdqNDFiYnBRTTdYSnBEL2lXcW9jeHl0bGZmZlJi?=
 =?utf-8?B?Ri9XUFF1b01TbVJWWkEyZHk4T0ovRHY1N0MrRHZRMy9PWCtlS0Z4VGU1Q3pH?=
 =?utf-8?B?RmZ6MjF5b3NUcnRXcXpwNG1nbGt5YTJ0Z3AyQktyenJEUFpmRVFaeU1rMmUw?=
 =?utf-8?B?WWM0ZEhuNXFwc1JMbWtmSkJYTVdMSVE4M0VLVzB6OUlKNy9iR0lCUTR1ay9v?=
 =?utf-8?B?SnJSUEYrTDh4cGtwOFd2S3g5WkRxZzkybEk2dkNyR2RFc2piMmV2NkExM3RF?=
 =?utf-8?B?ell4L1dmUWJwSk9idGk4U1BYUG84WmNlT2ZsSW5SL1J0OUpyQUJWcHg1K2VU?=
 =?utf-8?B?Y0V5S1NtMmdkY200Y2lBQkg3Unkrblo0RUFzVDJqSXQvVCtLMmZqMFJFRGdS?=
 =?utf-8?B?SEJsWi9ITGw5TmNhdkZNMWhVS1E4a3BpRk9iT3JZNURORlNlTkJuK1BidC8v?=
 =?utf-8?B?VmNtWkh4SUc3eTJ2ZFBKd2ljcklvRml6RkdnblhVZVZ5WUVqaE4xbWFXZExJ?=
 =?utf-8?B?dmhhcWlPNUpjT0pOMzkyNzhIOE9mRzZKZDEzS1RwbmRiblRsVWpOQm1YelVY?=
 =?utf-8?B?cndYV0JPZHRRL1o1cUpaMGNkVjZ6WVlNN0h1aEhqNlNkd3F3NTRXaUlZQWc4?=
 =?utf-8?B?M2pwaHl3a25JbjV1R0lOUkQvWTB6Z1JzN2xwMlNQamxIcDRlei9QSDI5Nk5x?=
 =?utf-8?B?eElpUmpuejIyWWNJWWJNR1VjbHVaK1VxZ2lCS3FBUExITC9qSzVtWkxTZ0VH?=
 =?utf-8?B?TUVMZ1ZucXIrUitqZEdLcnBvb1IyTWF3SVZRTzJ0WTd4N3poQy9ObWgwc1Vz?=
 =?utf-8?B?R3JtWVpoYXZTNzlKRDhsd3B4bDZQTktuNkMwblVEQWhJc3E5VjFmbGJvNWVu?=
 =?utf-8?B?MENFL0ZYU2hXb3RGL2NJLzBNU0ZHWTN0TGcxTG9nVHNISjFXU0xWRDYraEdh?=
 =?utf-8?B?TkY1Vk9JdUUvNWN3SGg1Sk5XbjZCdDhMdGpZd05ycUp0V2xCdWs2S09DTC9B?=
 =?utf-8?B?SU5JTGVyL0EwT2cvN0JxMUFFaXdhVTNoR1JtZWVxaXZ3VlFLNkZJUktpclBT?=
 =?utf-8?B?c1lBcm5nRk1QNHRubHVLOGJ0eE1NY1VvTmNZM2tRV1pJMEVSSkxrdENYbUZ2?=
 =?utf-8?B?MFJpMGFmMWl2RUoxTmJQamRPU0VXOG1QTXZ5OFdXaGJ4anBpdy82NVdrUndv?=
 =?utf-8?B?cTg0d1B2c1NoNFpnU1FOSEhXc2p0Vzk2Y0hHQ2JhZ2dwSlJqYWx5Q2RPZ0Yv?=
 =?utf-8?B?NlVGdzNOcXBOdWtQOU9RelFralY0Ullqazd1Vk9pUzBsMUJoc0FEWG81U1p0?=
 =?utf-8?B?ZEl6OUFtSDRkUlRqV0Y0T1AzckcrcTFxbFZTOTVHKzFzdUJvNWszK0t2NFQ2?=
 =?utf-8?B?OTB1UGQrR29rOFNZVHNPVHdTMjlWOHRPeHpodnhtTFY5SXVjblR0c1ZOQ1d3?=
 =?utf-8?B?RStuaXYyUnJtcGJhN3FUQktWd2xIU1RtMWdJdDZGVGhrS0F3blpBNkJrcFNv?=
 =?utf-8?B?Nm5ZdStFVWdQVFlUTGE5ZDh0UkQ5Ty9iT1Rldk5YcG91UElkTmlDVm9iTXp6?=
 =?utf-8?B?ZDBFbmt1eGRxU3MzaHc2eE85UUo4R3o5T1BLa3Mvdnhkd1IrcHRsYTMxZXhq?=
 =?utf-8?B?My9nbU1xK0V4YXo2bnBuSDA3bUlCSmUwY0FyVDNubnh3MVJvc0dldnNYWGFY?=
 =?utf-8?B?b1huOW1RdU5HTWppVmNHSEkwYXNKZzJkRnpid0FSdy9US2RDZmlEb3pGN3Zi?=
 =?utf-8?B?VUN6WVdJK0FsQWpsMWhrT2FCSzZ2L1Q3N3NtWVErRkhDbVNSYVRPV0xLSWhu?=
 =?utf-8?Q?r7ii8eVOc9/ztqBCk80hOF01HphVGUSj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2hrZXBQTUM4dDJOOFMwOTBDUkJOdGhhVWIreGR6TnJRR1JHMEVUZ3o1eHI3?=
 =?utf-8?B?SUpTNFlVbVZwSVZSUXpObTR1N1ZLUi9taGJFaVhmeTJmQWRhUU1aZ2k5Mmdp?=
 =?utf-8?B?WDRJOVFWc0Zic1ZvSEV2NUZvY1E4R1V3bXU3a3pWY2s5VitIOFpJU1RlcXh0?=
 =?utf-8?B?QWxxMHQyOW1oNC9vdlZNMmdyR0pPNU9FcE5aTzMyRW9nVHF2UjRaZ0VkZGl4?=
 =?utf-8?B?NnhGTlAzYkdMMVFwTmVGWHhFMGZubnQ4QjNwdGtBSnNLTGZ0QU9wQ3ovbDQw?=
 =?utf-8?B?bEJDNlNIMGxwUGw1OFoxRnNGTTFqRmI1S3RyRU9wMVBYL01OVllMZU42aVoy?=
 =?utf-8?B?dDdZZnd5MlhVV0xDZEROYnh4VFgvNmZnM1B5NHVKT1hMY3M2akhuYWJLQlE5?=
 =?utf-8?B?b0sxVFZuVmo0dnNvYktJTVZoSkhIVW9OcGtZWEZkc2l6cVpFTXBxdHFYZmZI?=
 =?utf-8?B?YlhIUWt0cjV5RnNtdXFjNGFsbEhmUjdCZ1ZTZG1yL1A4U1VGK0dzR0srNlBN?=
 =?utf-8?B?WlU2aFVaYUNyYUJoWi9SZU1PQ1FPMjEwa3hJcG1jWmU2aVhoZzJ4N0ZtRFRm?=
 =?utf-8?B?Z09GMFZLTWRLRU05VWVzS2lnRHBNUm1yUGc3MExVZEVPMmV3Vkp3VWVKcGEy?=
 =?utf-8?B?WjVpV1pzRThKVDRybGVtTHRhMkM5bm9YNXRpcEFYM1hHWHRRdi93RzN3aDB1?=
 =?utf-8?B?ZnFYVXdJTTAwemYxWWd1M3pmSEpES0xIOWZDZmdtZ1dqQ08zRDJHTGt0YkNH?=
 =?utf-8?B?M2FVMXNyb2hGMVBnaFAxclc0UjY4VnNvaExhQWhmU0ViaGQ2WlE5cEM3QVZK?=
 =?utf-8?B?RW9aN3g0NFBPVTJEMjBhQzZJTFN6eUJqb0VZdDgyaGJ4bFNYSnNhT3VJWVEr?=
 =?utf-8?B?WHA2UnRGNnRxL2FJOVlPV0FZUXdnd3dQOStwcmRyL2I1UjYyeE9DUS9mTjlu?=
 =?utf-8?B?LzQwZ3BPN3JkaGZ3UkNBaExqa1JZcjJUZmFYZnpPVlExemxkeHZEbVV3RkdD?=
 =?utf-8?B?WGU1SXZBSW1aMVgwYURrRW4wTzNiQ3doNlhPVnJBY3NGVVk1RFR1dE93enhw?=
 =?utf-8?B?ZytsQjBlR3NTQU5nb3BXaGJXaStuMlNQZFY4UU9lVEcxd1ZRZGVpUEs3ckox?=
 =?utf-8?B?YnBSbTY5N3lJcWdQd0VKbFNyRnlOQmlobjR1N1FCUEZsZC92YzhicytMT20x?=
 =?utf-8?B?bG1lNnF0eXIvQmVPWkk0TUNINzZwc2Z0ZFpnUzIwUXh2M2lKU0dNWFpJSXhV?=
 =?utf-8?B?SElnaUVucGtpOWYrRzZEVGN5aGlqYzM1VjlTSUx6elFESGhBbEN4d1pBL3ls?=
 =?utf-8?B?MWFXUzRzKytGRHNwYUxkN0VadVM4OElOTjk0TUJkM1NLSVFnWnR3Y1N1emcw?=
 =?utf-8?B?VEkzc3V5MVpoM2g0US8zMHc3YVhzT0J6RklhYVhtUXBtSmZERnhGOVdCdkhi?=
 =?utf-8?B?Mm53eWYxZEg0T1k1WjFvQkdrdkR1RlViTkxFc05CQlVrdnR2U2ozRHJ6ZXly?=
 =?utf-8?B?bVo0bDFkb1FyUzdSNVUyK2xWcGhob1ZSOHRSMTVKWDlxdmw5YlJtNFNUbEZF?=
 =?utf-8?B?bzBzSGVMTXVPNURleTd4MkVoK1E5VFlGT0s1L3Z3V1hSRE1RVkl0THNUT29Q?=
 =?utf-8?B?S3hLRUJQbmFKdDFYZTV4VXdueHNicmNob2dRVXluMHFzays1ZzhuMnNPbmtW?=
 =?utf-8?B?SHFvWk93N0UxQVVLZWhaUVY5ckNpbmM3Q1ZQZlIxNUU1NzdrblpBSnJ3SmJu?=
 =?utf-8?B?YVFzdE9KMXN5d1lJY2dtbVJZS2Z2NmdFc0xWMkU1YnJLWlRZdi8yZ1FGdjd2?=
 =?utf-8?B?SXA0cHI5cWpTV3p4TDhtOGkvNmJWT1RNekw5RGtYaWlDVGVjTVR0cVlUb2h1?=
 =?utf-8?B?N0dGK0xCWEYrRlNmb0hHQWRWdmkzbDRHT005SUYvT25YR2ZmSm9TSEtwcGhz?=
 =?utf-8?B?NWZjWkxqZ1VYeE9aRmJHbzJzRytIWTh4Ui9RRCs0cmdERjF3SDgxYVQ2aloz?=
 =?utf-8?B?M1kzMkFyNWdzVW12aGFkWlduUzdTTVJxUXBDNXpxMnkrd1VwZlZXMm80OURM?=
 =?utf-8?B?SFBsT3hpdlJFL3pJa3pVUDNYcm5mK3JxMS9UREdMa2FiN3k5UXZOK3ppRVNi?=
 =?utf-8?B?QStqSXlwV3F4SGl6b0lrcHBQL1pha3FLVTFRRGdOekdybVp5cUcvNEQybHZG?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8f70cd-b344-4b6d-37ea-08de1273ffea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 20:37:35.9130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //NFhWCBma7qYqSxKr3R/46CGvWEGcgz9pV548EY+Xtwl15KB5rCVLpPp3eE6uU8B0vF+dG7CiNZQE6hZpfy4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6399
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

On Thu, Oct 23, 2025 at 09:06:11PM +0530, Satyanarayana K V P wrote:
> Post migration, a marker is sent to the GUC prior to the start of resource
> fixups to indicate start of resource fixups. The same marker is sent along
> with RESFIX_DONE notification so that GUC can avoid submitting jobs to HW
> in case of double migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V1 -> V2:
> - Squashed "Enable RESFIX start marker only on supported GUC
> versions" commit into a single commit. (Matt B)
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 ++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 87 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 42 ++++++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  5 ++
>  5 files changed, 169 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..b9141497bfd5 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -656,4 +656,42 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_NOTIFY_RESFIX_START
> + *
> + * This action is used by VF to notify the GuC that the VF KMD will be starting
> + * post-migration recovery steps.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START` = 0x550F   |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START          0x550Fu
> +
> +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_LEN     GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_0_MBZ   GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_LEN    GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_0_MBZ  GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d0b102ab6ce8..8c1448d6c81d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -299,12 +299,55 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +/**
> + * vf_notify_resfix_start - Notify GuC about start of resource fixups.
> + * @gt: the &xe_gt struct instance linked to target GuC
> + * @marker: marker to identify the migration.
> + *
> + * Returns: 0 if the operation completed successfully, or a negative error
> + * code otherwise.
> + */
> +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_vf_notify_resfix_start(guc, marker);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
> +				ERR_PTR(err));
> +	else
> +		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup start\n");
> +
> +	return err;
> +}
> +
> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
>  	};
>  	int ret;
>  
> @@ -316,18 +359,19 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  /**
>   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>   * @gt: the &xe_gt struct instance linked to target GuC
> + * @marker: marker to identify the migration.
>   *
>   * Returns: 0 if the operation completed successfully, or a negative error
>   * code otherwise.
>   */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> +	err = guc_action_vf_notify_resfix_done(guc, marker);
>  	if (unlikely(err))
>  		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>  				ERR_PTR(err));
> @@ -1183,7 +1227,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	bool skip_resfix = false;
>  
> @@ -1206,12 +1250,27 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));
>  
> -	return vf_notify_resfix_done(gt);
> +	return vf_notify_resfix_done(gt, marker);
> +}
> +
> +static bool vf_resfix_start_marker_supported(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	return xe->sriov.vf.migration.resfix_marker_enabled;
> +}
> +
> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	return ++gt->sriov.vf.migration.resfix_marker;
>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	u16 marker = 0;
>  	int err;
>  	bool retry;
>  
> @@ -1227,13 +1286,27 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Increment the startup marker again if it overflows, since GUC
> +	 * requires a non-zero marker to be set.
> +	 */
> +	if (vf_resfix_start_marker_supported(gt)) {
> +		marker = vf_post_migration_resfix_start_marker(gt);
> +		if (!marker)
> +			marker = vf_post_migration_resfix_start_marker(gt);

Nit: Maybe just don't zero in vf_post_migration_resfix_start_marker.

> +	}
> +
> +	err = vf_notify_resfix_start(gt, marker);
> +	if (err)
> +		goto fail;
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> +	err = vf_post_migration_notify_resfix_done(gt, marker);
>  	if (err && err != -EAGAIN)
>  		goto fail;
>  

Nit: You missed my comment skipping kickstart if err == -EAGAIN but I
think that harmless, in existing code, and can be done in a follow up.

Anyways patch looks functionaly correct to me:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..ccd850313328 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -60,6 +60,11 @@ struct xe_gt_sriov_vf_migration {
>  	bool recovery_inprogress;
>  	/** @ggtt_need_fixes: VF GGTT needs fixes */
>  	bool ggtt_need_fixes;
> +	/**
> +	 * @resfix_marker: Marker sent to Guc prior to starting the
> +	 * post‑migration.
> +	 */
> +	u16 resfix_marker;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 39c829daa97c..10d6e43fffce 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -55,7 +55,21 @@
>   * When the VF driver is ready to continue operation on the newly connected
>   * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
> - * CTB messages and scheduling workloads from the VF::
> + * CTB messages and scheduling workloads from the VF.
> + *
> + * In scenarios involving double migration, the VF KMD may encounter situations
> + * where it is instructed to re-migrate before having the opportunity to send
> + * RESFIX_DONE for the initial migration. This can occur when the fix-up for the
> + * prior migration is still underway, but the VF KMD is migrated again.
> + * Consequently, this may lead to the possibility of sending two migration
> + * notifications (i.e., pending fix-up for the first migration and a second
> + * notification for the new migration). Upon receiving the first RES_FIX
> + * notification, the GuC will resume VF submission on the GPU, potentially
> + * resulting in undefined behavior, such as system hangs or crashes.
> + *
> + * To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
> + * sent along with marker and when GUC receives the same marker with
> + * `VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF::
>   *
>   *      PF                             GuC                              VF
>   *     [ ]                              |                               |
> @@ -102,6 +116,11 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]
>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
> @@ -169,6 +188,26 @@ static void vf_migration_init_early(struct xe_device *xe)
>  
>  }
>  
> +static void vf_resfix_start_marker_init_early(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_uc_fw_version guc_version;
> +
> +	if (xe->sriov.vf.migration.disabled)
> +		return;
> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 24, 10)) {
> +		xe_sriov_notice(xe,
> +				"Resfix start marker requires GUC ABI >= 1.24.10, but only %u.%u.%u found",
> +				guc_version.major, guc_version.minor, guc_version.patch);
> +		return;
> +	}
> +
> +	xe->sriov.vf.migration.resfix_marker_enabled = true;
> +	xe_sriov_dbg(xe, "migrate: Resfix start marker support is enabled\n");
> +}
> +
>  /**
>   * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
>   * @xe: the &xe_device to initialize
> @@ -176,6 +215,7 @@ static void vf_migration_init_early(struct xe_device *xe)
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
>  	vf_migration_init_early(xe);
> +	vf_resfix_start_marker_init_early(xe);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index d5f72d667817..626c11a6dd1b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -38,6 +38,11 @@ struct xe_device_vf {
>  		 * was turned off due to missing prerequisites
>  		 */
>  		bool disabled;
> +		/**
> +		 * @migration.resfix_marker_enabled: flag indicating if resfix marker
> +		 * support was enabled or not due to missing prerequisites.
> +		 */
> +		bool resfix_marker_enabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */
> -- 
> 2.51.0
> 
