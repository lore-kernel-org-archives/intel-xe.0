Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99DED6A25D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 00:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B95210E021;
	Fri, 15 Nov 2024 00:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmO1Tauj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A02F10E021
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 00:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731629345; x=1763165345;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nAlKnBiTMaHr76ym2Q7PNGfBkIvQsAR9we9k2XWDjK0=;
 b=MmO1TaujOWVVQpqYrgyArxSLLwYIzpKCXKxtpXygFO7g3xiJB3SMXOuX
 Bz4sjWdz4tAI59LNXyeAPwW/SW8vuP+7Fpq0Jo5slFDpcJGUU5ZwPzpEQ
 J1qTzNLmgK9zaCKE9RKeXU42IBNuFOMegoDMMh6xZMtbvBdj80HFWMvrY
 4UVLolr37QCrJN6P2QhQFG01b4KhRWRU1N5FcfdBDP+5cSKebRcdlz//c
 n8gu2vaJzCAX6PKc++p8sqccKzATW/5oVOa5xAJVLjR48d2G3DvDj1K5Y
 5FbswDiJxEsOPMV9vEFLsXPENuH32gxEnTPIQeidOB0YA478RvtIF1t7Y w==;
X-CSE-ConnectionGUID: PmLawSweSTi+wrOe9ywY6w==
X-CSE-MsgGUID: gS+H39q2S4O6wyaNxiEXAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42998625"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="42998625"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 16:09:04 -0800
X-CSE-ConnectionGUID: 9UmJsqeuRPOv9eyHIoWIzQ==
X-CSE-MsgGUID: REA4S3cNRUC9dcgD0Pt0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="88779331"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 16:09:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 16:09:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 16:09:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 16:09:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ti9YTk7en27a6sDgIHe16riuS6e9aghp6HuQwrG63sq9K/GcES904B6B7yJ2nq5vSB1mN1Cb0OFl9XOQkHXF6e8fPy36ksFXap+A7Oe2oP+384PuxOSUa0qk6XgJgCAtR0Z7aMJjXF+VGzQIYl5ZU8Srq6rxFtU8fvJIxAJ88pbJPwncg3Ja2klqX/HDiEdrRXj6S/kNuYhe7KIlh5NcenBzTWwSOORsMiINm4yy2QyzCgd3N8HbTKhC1Af9h7/orXzxKbFOaK9L8LRdJZ9I7ZvxsDL98PhRN24Om5jNbBPktSsOdLKfl12NV6/Y3wE0JcM85/b93CfIFdTIfqK9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gR6j6VNbXkTmDnRqmEJLw5XA7C0jJwAH0Z4g+SNVY7Q=;
 b=cVkZNd4tEFzl3HRKKy78+1s1y7yY+mxPW4sKhIXKqr94J/j2pGqhsWGi9Nmbu5J5TOwNiAP6aiz4XcbkjKpH4edJr+y8IL5y7dW6Cq6Df1IdedyiFpQPyzX7Sg4mFkFkcavry3sLNExTsECERCiqKyUDUMOm+hY5VF1gM8NDpdMxkht/PV0D96ocVreffaOacGE+B4L9Yzfx5R2YhKGfS1o6+LJ7R7QBO6CBcuImDLqW9IImrgP3Yov4nbjA8lnLDEF+4hykWzTAlmB2IdZcW9OdbgduyK6ylq766ZNp+UeWw1rjrm42mAartZrrE65QwvLNcJpLYPjy9dy97QZBzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6700.namprd11.prod.outlook.com (2603:10b6:510:1ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 00:09:01 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 00:09:01 +0000
Date: Thu, 14 Nov 2024 16:08:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 5/7] drm/xe: Add single engine busyness support
Message-ID: <ZzaRGn1I7rQaIFSq@orsosgc001>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241113045549.2390980-6-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b9a7ac-8172-474e-57bb-08dd0509b517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1JUQS9IcFByb3BZUHFLeFBMdm5Pb3VOWStycTBhTWRuN29pQW50ZWdsbWhp?=
 =?utf-8?B?V2txdm9ZUVQ1bUhra0JKQlgyQUlONElxUHNKUDZzUUFPdFp5NGEzMEl1RnFJ?=
 =?utf-8?B?bU8xVHNiZ2xuakI5K0dtYWhka2NpRFRNa3R2WVh0eHN4allKdlpHcFZEbzB2?=
 =?utf-8?B?YWpmOFJSYnJsTGc1ZCtFa292cGtETitCQzY5WE5Zc2RxblFic1VZVGUwWlE2?=
 =?utf-8?B?MDhMdURmRDl6UXR1aHBiRnhYR3VNNWNid3J1ZXBsRzl4STNpMS9sS0xzZzAz?=
 =?utf-8?B?Sy9LUlFDV3F4bE9ueUV5clVQL1ZzbzNWUzNBN0E2bGFiV3dwNVptN1FLWVpQ?=
 =?utf-8?B?cWlDejk4emVtR2RPK1VYTXNmdlhxejFXU0Jxc1hneU5YSEFqZTM4WHRkZXJj?=
 =?utf-8?B?TmMxKy8zdmg4eGMzTE1yRGZhTytUZ1hjVUJTOHh3Vk0xL3FWcys2VWMwcjdU?=
 =?utf-8?B?QWt0MG9mOXBGa2xKMG1yb3ZrRVF1blUvaWhSQXpLcWo1cHV1ZzZxMXVEWC90?=
 =?utf-8?B?U3BLR1JoNVVrb0JqNmZqMkMyL3pVTVpDM0hjcVAxV0twQmVQdXNVaE1ET2FZ?=
 =?utf-8?B?cFdlR1FHWk82VTc4UFE0WmN1NnRCQmpNTjhQY05ESEN3SFVqWCtEcU4xZUIx?=
 =?utf-8?B?YVdMMzRkemI5RUtxQlkwSlR4YkgvWkRhNEIycmFXVTVYeU1JTTdldVlyeXlt?=
 =?utf-8?B?QXdHdUZrLzBpMVV5cjB2ZVV2TC9RZGJaNVc4NE1DVUdlOWd1Yk84N0tIK1ND?=
 =?utf-8?B?dDZ3SmdIMjVLYzREVUdCcW52ckVrUlJzZVpDYkFnYnVkTmsxbVJSRnliTDJY?=
 =?utf-8?B?VFBtTFBITUJVS3hCK2o3Y2tWcEk3SXJaQWFlSWZkMjQzWDhjL0lyVVJ2UHl5?=
 =?utf-8?B?R2xMUHQ1V1hubDRiZzJqdmNVbGxIZGVtOTd2dTlGeFdReTJmcmNyV2REYW9w?=
 =?utf-8?B?TWtZdlpHQ1hTY0I2QytXM2Q4Rm9xd1ZPK2s3SnRvMEFML3R0a0NIbkc1RG9s?=
 =?utf-8?B?WWhIK0pJUjNTZFFFeERXTC9LeUtSYTdZemNLQmtxelRhZEJkQnNrbE5pZTJu?=
 =?utf-8?B?MlRlZ1dGZ042aFBkVkRTdDFIT3Z3Y2lQazAxVjloQkpsSjFiWFVvNmtHSElh?=
 =?utf-8?B?M05Rbno0NWJYR2NjK2NTaEZ6d1AxYmV1SHlISkNnVE5ydVB1cjQrSHNsNy9F?=
 =?utf-8?B?d240cjZCVkZFOGhIQittUHlrUWdJbXI3azc2MlcwZ21mVzBLRHFWdDVrUkUx?=
 =?utf-8?B?d3Zld2tvYjlCK0MrQ2NVRzZOVUo2Mll4WFluOGhKa01NMUx5RHIwelF2NXlj?=
 =?utf-8?B?akRUWE8zZHQzQmxVSnFhSXljM0FxZlVacVgrY0pSYjQ0anZtcmFIdnZyYTlh?=
 =?utf-8?B?dExGaW1nR0N6dDRDVGxSc01KZ2tQVlVPdkNMSEljZ0M3NTFwNVZCcUs2VUNq?=
 =?utf-8?B?Q2UyeU9Deml2bkVJK3Q2R1M4YmFIQUp1QldSNGllRWdnMlFYMVdpNWFGeXNw?=
 =?utf-8?B?SlpzbFNHekVIa0daMlBUbGttcFdyZy9BSERhMFh5ak9yVU5SWnZXZDJ3UzdP?=
 =?utf-8?B?VmY3NVhEc1hiNVR4T291ZnZXdmlEZENpbzY3VXNEaVRtcU41a05aR2ozbDdw?=
 =?utf-8?B?czRzcEduZEZqOWdxYnd4QVk0T2VGeXNFemowZWV2NUpKSG9IcC9SdW4zbnN4?=
 =?utf-8?B?V1dFUmZaNzhqd0N6bnZtamdFeHVtZmZjWTRKcTNwVG4xNzIyekdVTEJhU09J?=
 =?utf-8?Q?pNTKaHGGMRSdZl+0Rw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZmZHR0dUhDRFhINDBTVDB1YTNDcjNNT3p5UndhMDlSbVU5L2NPUXFYUzdC?=
 =?utf-8?B?ekNITHEwUmtYTzFpelVqSE5zTXM3SEUzay95V2FWQ2tjUDBKNkkvMEZQMXV3?=
 =?utf-8?B?RXdIZnk3RVRldGVrOUVJK2VJNzBwTTZLK0JZQ0ErbkpEUTdsUm5Rak5yc3hU?=
 =?utf-8?B?dG1FR1hoQVJmUS83SEJPbEtWRllZdVAzcFRTdkl5UmFmOW9PMnpOT1hPYWZP?=
 =?utf-8?B?aFp2MGtIYU1PK0xYd0NWc1B6bUdoakhTWS90UWVUbG56QmJOOWVQSjgzWE1u?=
 =?utf-8?B?YnJiazY3Tkt5SVFrdzdjVHpTM1hxWkVYT3Y1a2xmU3dTcHNKN2pmdjBKeVZ3?=
 =?utf-8?B?Wm8zVUY1UFBlY2d5SmZuWnR5YkR5dDlmQmtRRHNMMWV6Z3FOa1ZIVENIK3FG?=
 =?utf-8?B?VjhCRHhiUENzYklwWGgxTzdOVWluL0JwZTF2bm9FSFgxa1JyMFpDU0FLQ0VK?=
 =?utf-8?B?dzNYc09QTDNXWFBGMElhUkJpS3R3WmJjNWQ2cy9RRFEyekQzenpJaW8xN05x?=
 =?utf-8?B?QUV0U0s2V2NRWUhGN3Q3eld3Tkd3Z0x4S0U3N0ZNUTlBZTVwTk03SThmRnJr?=
 =?utf-8?B?anlOWHJSQjF3dFV3bkhyVzZkSWlpUHdPVHVPeEtJR3ArNHRHcVRkNElGMUhU?=
 =?utf-8?B?RkhBZWtXT3FKT25haGticzZvMzYwWTBxZldxSjhod0FTVUwrZ3JWNDVEWDdz?=
 =?utf-8?B?b2I2RnFQUGhaclIveGpFbjBWb2gyZ0FNMHllTUVheElKZUE2RXh1RzNCcXRC?=
 =?utf-8?B?NklBVm9wdFh4R1lkSitQNzh5UmtRTEM0bTJ4UTRPY25mT2FuQUhDS2RNaU52?=
 =?utf-8?B?bU14b29uNkdYNHJvM212K3pZbm1UY0htU0hxS2FjeWxsZzNxRDd4Ty85bDV5?=
 =?utf-8?B?YkQvdWtnUEs0aURYTG12SlM1TS9MZUtoa09VREpuN2F0ZlE0RW5qUEptaUoy?=
 =?utf-8?B?SWQ3U2dmMGZvZmYrckRjWXJSR2F2WWgvK0drQkttWjN5eHNZNXA5TkRQOERJ?=
 =?utf-8?B?YWdOYmZPbXEzN0RyTDcrMzRTVmdMbXJnRmlzQ0ZROXZWNkU3K2FhdUg1MU96?=
 =?utf-8?B?QTVQZ1lKYlB1WVFremdHekVpdjI5SWU0REREYU5QUXh3ZllaNklvb0hMdTJW?=
 =?utf-8?B?T0lzcEpCUmRkUmJ3NWh6SkloYWF3OTBmRzUyTTluRGFrdmhqMTI4T1YvOWJw?=
 =?utf-8?B?RVNzSEs3THdXQzlWYTN6MnVoWE5uSys0czNnRzIrL0NZN1RDMjJaN1FRajUv?=
 =?utf-8?B?QnNFN2tkbGVwNWp0dXp0dkVLZVJ2YUh1ckJLR2lwaE0wUGRTZkNuRlpmZUc1?=
 =?utf-8?B?WHhySTBleEgwUm5PT2xwMzJsaHFya2thSEExSVJSUUY4YWtpeWRTTHRrV1Jo?=
 =?utf-8?B?VmpKdnEyV2FaakdpL3JSOUI1eGl0UmNJd1NVZGE4a3J3SjhDVnY5VFJ4aG5B?=
 =?utf-8?B?VGYzSDFvenh2VmhTemlYUEdYV1dyWlV4ZlUrMEJhUVdtUENneC9mSjRJTDli?=
 =?utf-8?B?cUh1NEYrMmtDZHowQ1JjRjlObWFIQmVRSTRjTlpBYk1jQjFyMlFwWjVGamVq?=
 =?utf-8?B?UTBJVktXK0FZUUlRWjdwak1CQ1dCc3dkN2dBYkVURWVvdmEzUXhWNzA1TTM2?=
 =?utf-8?B?bHgvbW40NUc1bzRNQjZDSGF1ZEdKVEwxNHlFN3c2eE9sdTEvMWl1QTlPMFlR?=
 =?utf-8?B?Y1hYUGtLWVFyVjNScE5tczJaM3B3WnRKQWFuYnZrVUVFOTRlc2pGUDI5dFk4?=
 =?utf-8?B?cU8yNnJNeEh4d1Iydk55SnMrQWhmcy9PUWlZbTcyWW5oU3VYd1lHT1ZvUmt5?=
 =?utf-8?B?R3lmaWlFMFcwWnA3WXF4N3RKVmUyVkNNT3NEOGtSZVkvNm5UKy9nR3ZCZE9t?=
 =?utf-8?B?bkMzTVdYUGE2VVkyanJ4OVJXL2pza3NrUGtMczA2OG9KTU52REwvaDN5MEtW?=
 =?utf-8?B?Vkd1MFRYc0E0elNnVlJxRkx2UnFvdTUxMUt5QmM1UjIwbTFwblZJanVDMTF6?=
 =?utf-8?B?NTAvY0ZiWGpIOFhMY2lWbHMzMEozd2IrZVh5WWhDMXZRM0kwWXVvK1hTWi9z?=
 =?utf-8?B?aWZZTXg3UHhnUHdhcmdIQ2ZNTFkzdHVnTnU0TVRoZmVrekxFNUNMTEJqc1dS?=
 =?utf-8?B?a1FIbVNENzg2MENNdThMQ3hwTUVqRTJpYTJFbVJ1ODJDeWRMN3J0TWVtMmVW?=
 =?utf-8?Q?ZOkOg5bGHY5oWfQGCWSXZt0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b9a7ac-8172-474e-57bb-08dd0509b517
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 00:09:00.9396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkQ3hhs/ru7aMwghO3MEFNdejic3O4RBY7QXvNagmsOuuBXwcIjn0oxJ6JfmW0ec0+4LnFDebGFiwX1DxkwBncJeMBzRtyiJmzgQB4hNN/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6700
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

On Wed, Nov 13, 2024 at 10:25:47AM +0530, Riana Tauro wrote:
>GuC provides support to read engine active counters to calculate the
>engine utilization. KMD exposes two counters via the PMU interface to
>calculate engine busyness
>
>Engine Active Ticks(<engine>-busy-ticks-gt<n>) - number of active ticks
>						 for engine
>Total Ticks (<engine>-total-ticks-gt<n>) - total ticks GT has been active
>
>Busyness percentage can be calculated as below
>busyness % = (engine active ticks/total ticks) * 100.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Some minor comments below, 

>---
> drivers/gpu/drm/xe/Makefile                   |   1 +
> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
> drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
> drivers/gpu/drm/xe/xe_engine_activity.c       | 317 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_engine_activity.h       |  18 +
> drivers/gpu/drm/xe/xe_engine_activity_types.h |  85 +++++
> drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
> drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
> 8 files changed, 447 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.c
> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.h
> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity_types.h
>

[snip]

>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+{
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct guc_engine_activity *cached_activity = &ea->activity;
>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
>+	struct activity_buffer *device_buffer = &engine_busy->device_buffer;
>+	struct xe_device *xe =  guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+
>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>+	size_t offset = offsetof(struct guc_engine_activity_data,
>+				 engine_activity[guc_class][hwe->logical_instance]);
>+	struct iosys_map engine_activity_map = IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
>+								     offset);
>+	u32 last_update_tick, global_change_num;
>+	u64 active_ticks, gpm_ts;
>+	u16 change_num;
>+
>+	global_change_num = read_metadata_record(xe, device_buffer, global_change_num);
>+
>+	/* GuC has not initialized activity data yet, return 0 */
>+	if (!global_change_num)
>+		goto update;
>+
>+	if (global_change_num == cached_metadata->global_change_num)
>+		goto update;
>+	else
>+		cached_metadata->global_change_num = global_change_num;
>+
>+	change_num = read_engine_activity_record(xe, &engine_activity_map, change_num);
>+
>+	if (!change_num || change_num == cached_activity->change_num)
>+		goto update;
>+
>+	/* read engine activity values */
>+	last_update_tick = read_engine_activity_record(xe, &engine_activity_map, last_update_tick);
>+	active_ticks = read_engine_activity_record(xe, &engine_activity_map, active_ticks);

Whatever we read from the metadata record and the activity record could 
be added to a trace call so that we can debug issues using ftrace when 
needed.

>+
>+	/* activity calculations */
>+	ea->running = !!last_update_tick;
>+	ea->total += active_ticks - cached_activity->active_ticks;
>+	ea->active = 0;
>+
>+	/* cache the counter */
>+	cached_activity->change_num = change_num;
>+	cached_activity->last_update_tick = last_update_tick;
>+	cached_activity->active_ticks = active_ticks;
>+
>+update:
>+	if (ea->running) {
>+		gpm_ts  = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>

extra space after gpm_ts ^.

Also, does the mmio read require a forcewake here?

>+			  engine_busy->gpm_timestamp_shift;
>+		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>+	}
>+
>+	return ea->total + ea->active;
>+}
>+

[snip]

>+static u32 gpm_timestamp_shift(struct xe_gt *gt)
>+{
>+	u32 reg;
>+
>+	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);

Does the mmio read require a forcewake here?

>+
>+	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>+}

[snip]

>+struct engine_activity {
>+	/** @active: current activity */
>+	u64 active;
>+
>+	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>+	u64 last_cpu_ts;
>+
>+	/** @quanta: total quanta used on HW */
>+	u64 quanta;
>+
>+	/** @quanta_ns: total quanta_ns used on HW */
>+	u64 quanta_ns;
>+
>+	/**
>+	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>+	 * per the quanta_ratio. This remainder is used insubsequent

s/insubsequent/in subsequent/

Thanks,
Umesh
