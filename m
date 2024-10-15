Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4219D216B0
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 14:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0ED10E06C;
	Tue, 15 Oct 2024 14:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhtkC0SJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2704710E06C
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729002935; x=1760538935;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+nZ3OGvNxdKzHsVHFlV9Xmek3qG7y8OLgNpXaLDH+Ok=;
 b=YhtkC0SJ4l6iPPSt6wU3D0xo8fZdjTE3Ak/Bcv08zmBAt5iPi0ch0NuJ
 qkiRi52HT6p8jxiFUQAxch+L4rrA8dcNYMb+srdF0MMlIXiInLJ7ZhWiP
 SCarMnNcuN5BksggZ8gGKsbVdyw8Oo2iK3ScnwlFvg3hCABOOC5UlzrED
 fgyHQO7Iz+CfM5t4lLZfdVY4NTVEm3RvUSz6w/3OH9o+fIo7Eyltf4Zqr
 PkqIr1Ni2oVjeI6CxdpQCPzuZfr1fOPycpVf0lmY80GH6DsTZDkYFMmrx
 yHUQsSSCgD7p5EZ3OULDh2yciZOCxl26S8ifEbrT4pXskOGt7mA/WgDfV w==;
X-CSE-ConnectionGUID: 5r96kVOPRJGHhe5hVSnY2A==
X-CSE-MsgGUID: sSn+fWNJQKKuB79A67NeDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27846193"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="27846193"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:35:34 -0700
X-CSE-ConnectionGUID: 2EjQx0/nTimSMCuiRvC1JA==
X-CSE-MsgGUID: OANmyMSoQ7aRGUpHbVgoYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77579870"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 07:35:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 07:35:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 07:35:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 07:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4ZbiF3wWHPFFe9lMucELKCAvUQlVaw9mrk1ww51qQYCcVpAZj2Xuyeook3CU/GQiSVh6kUTyAXQZXQJ8BZu1jyy5CsG5Hg4hZfumOatXUMAyBZm2WBkTTEwkvO3k0Z0lXtqq6Dd4o6a+Il/vWH45x1278ClpxPue5n7BBd5pm2HoAYeOOv4nlj2HV9Yhsi46/liKPR14aIo3DW2yjONggP6nLJm3Dikrw5p3cWL3i7ymsooCIIv4U+Ga1R7kb5N+Atv0EXIIqn9DU73ZTlgRBKfZRvQ5rfh3jvb/DfJcHNIpzQWrPX4COHyoyTJLd2taowkjsnOW+k20IIPYq69nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfIKtM6gQnz0Oxfkq3aHJpFfx1MW40plZZ0U0z6MaKY=;
 b=rVsic3CWelTcxcHNNcZjmMZl/EBart1g+H+SeofH55Z0eX9LWzaQmBBl2T3X3sFzXwkS8u5s/Nr00Qz+XCaiQbpsfHJAPzNHnqy6o6U9wsIzLJi0Kt6VNnM9Wfucj5h7PCq9o5R50QIk6+Hdqpm9BT8Mlreucwdu7k38J89YRBX4XV8qKWG9Dk1tllX8lbCqnlDYgZP8cObkVW9O50kAx+br2Ihn6XA9ZzRtJllAAotUtmTm3tdiAQnV9dMfUwbbwwakLQe6eE4z6VzKPiiTjMJo+k60XDlHGFOhN4O+Rls5OzPVxf6SCCMEfNcOBfw4M+31cot1zBlYisvv9goNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 14:35:30 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 14:35:28 +0000
Message-ID: <56278e87-01d7-4d2f-bb90-35ba436a3f24@intel.com>
Date: Tue, 15 Oct 2024 20:05:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/26] drm/xe/device: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-7-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: bf722fbf-cc9b-491b-e449-08dced269d31
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFNsYjU1QU4vTHJSdi9DNktzN1g4MnVTUjFwOUt2MW1XK2hkb0ZxcjZkaitO?=
 =?utf-8?B?NC9zRjlmR0pzeEhWWjU1SFpFem5UbkFJTWNFdis4TnUvclI0RzNCNGFOVmY3?=
 =?utf-8?B?U2FyYWxvdHNkWkRPUVFUNE95SlF3d1VvQmxSUG9NMmtITlB1elRDaWNWamt4?=
 =?utf-8?B?bDBHWndsbFE0Q3A4TE9pL2NLdGdZdU9qYUFKOUxBeVdKTEo2ZGYzeFFINUl0?=
 =?utf-8?B?bXovOE1yaWsyOFFYaTZmVnUzM2ErVW4vWU5maWF4Mm84OHlLczMvRlZrbms2?=
 =?utf-8?B?Q2gramVMdEpJMGN5TG9oM0tCNDhGSUcxZis4c3lMM1FVL1V1cU1zeGNxK1du?=
 =?utf-8?B?a2QyNXVOc0ZsN1h4OUJud2hNZUhPUjJ5WlpJaktEdHBkM0VLTm9zeXZFUzdr?=
 =?utf-8?B?bkxIVnFqWHdSWFlSWXVSUHYwbnZFNkNzVVRjTE5KUjNVUGtkamt6ZHQweW04?=
 =?utf-8?B?ajd2RWxtbjBWWW9xbFlucWgwZlNUSW8xSkQwK2JjRmNGQWpXU2gyOW40czV0?=
 =?utf-8?B?NVJBSWpTbHZTZUl4NEwwRDZMY1ZZQVJMOXpyS1RTSVp0YXFyeG9jQ3IzeFZ3?=
 =?utf-8?B?cnpUT1RpanR2V0ozeTIxUi82SkRYaEUyNmp2MlhjQnE2THF0YnBDNWk3WCtD?=
 =?utf-8?B?Q29wdVoveHJVQUxkN1FhNHZ4bTJJMWNtZCtPUnVRaWFPaHNMUFNkZE9SbUkv?=
 =?utf-8?B?VUdWMVhGa3JBS1crMkJtV0VzZ3p1clRFSmRaWUk0cW5tbXg1YTdQbTBZbzAx?=
 =?utf-8?B?WTZOQUwwcHZsaExOeUVWa2dXSE5UOHhJRW1ldFYxUlJJTG45NkloUUM4U0RS?=
 =?utf-8?B?YWlxWmFzM1R2QlFPQWhFaGFUNGFaN05PVURDdHNVRmVhek8wT01WcWk2V0RG?=
 =?utf-8?B?bFNTWitNY3FQOFkzZEx6UEJlZ0g0TUJVaDlXWFpQL0VVcVYxcGtDZHVJZzZY?=
 =?utf-8?B?bmNTUms2TDBOd3RmdlpmcTB3MWIxVHRpem9OQWlWMU9vNDl3UWZDSjcvZ3hM?=
 =?utf-8?B?RDdPdW9DSDdIb0c5OXRuZWNyNVFkL0pzWVVnSEpZa1B1VU40L3VVM1NFVjNP?=
 =?utf-8?B?blE0MmJrclZLWmtneDd0OXVWTS81N3BrQXNoOWhYbkpSUGdubVRmbE9zZkty?=
 =?utf-8?B?MXhDVWxhRkJ1bWlubFBISnJnd2Z3MnE1SzVsR0lPK20xbks4SURPcXpTSm13?=
 =?utf-8?B?Vk9SRDI2ZW9VQzVaVmkveWtPbmZYWkJKWUtCZlM2N3JaMWt3ZmVPWnFvRDIx?=
 =?utf-8?B?SXpIZ2JoWHJ1YU9IZlpCbVcrRzlGakNwc0FLQncvenFLcXZJWTJMeUZZOHox?=
 =?utf-8?B?RUlIYUFnY3hJZHNWamNCbXlTczRzWmlic1FCVCtwSVRraHA0ZERCM3c4VzVW?=
 =?utf-8?B?N1kzYWNreFlaalBwNHZYR3JlT2F4TWdTRk8xMnpzWFlVazN0d3pTVnhITUNS?=
 =?utf-8?B?VU1lRHhuYkNxL0dkS041NkptTjFCZW9DendsZlZRUjRWa2N0bUJxcE1IUU5z?=
 =?utf-8?B?NFVQNnkwaG85clRXRnpiaW9xRE05YXBTWkIzM3d4bm9MSE1GYmdLL1dxdnVs?=
 =?utf-8?B?MzJDRGZENWkvbVVyU25vU3g2WVo2VkZZL2JnWExIRmhQSnFia2NWdzhNMGFo?=
 =?utf-8?B?emJmanRKVlVkUHdhRC9RNVZJaUlHVElIK2VVazZvZVl1SUZJR25ZbndjN0Fl?=
 =?utf-8?B?eUtpSXVpUTYvOHdUYjNqS3U2S1ZBb1dQQWhab2pvbE5VdzJ0ZDFhK0p3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEZMcDdOWHhka2xxeGcxL0RqSTVrSFlxNko2eWpMVmxBT0N1dkZERGo2eEMy?=
 =?utf-8?B?MHZQWUl4S2hRUk9NNEduUmFGWHcrUjZOMHg3NzZQcFlJVkRBVDdObCsyd0pK?=
 =?utf-8?B?UTJMSWxmZGdYQlFqc1FSRE1qR09jbm41N29jUG9QaEgranpYTGZHWCtjL2x0?=
 =?utf-8?B?MmZDVHkvYlJpcFo1ajFkaldmd2VOVGh0Y21jREFRZVRQZ052K0lWc2h2VFJt?=
 =?utf-8?B?ZUM3Ujd3L3ZOZmZCeThlZ2dNNzBFOXQyY1JpOGJaei82UlJKcDU0YThlbTVm?=
 =?utf-8?B?RGFsSU5idTZjR3hTU0YzbmdBZHhFUHlwRDU0RlFPOGhZUmhJMjJGYityS3l1?=
 =?utf-8?B?SG55VmZYTTlxdkh2RytDZHNkSzVXTnY5QUxRZ09sSHdVZWhOVm80TnJic1BC?=
 =?utf-8?B?YTZOb0xHdlQrNGt1RXVwcXNGbkJiVStPKzNLcDJVSmZDSXlNTDVsajBwa1V0?=
 =?utf-8?B?cW4veWVHNTFlaXpuc0J5Kytyakp2U3dPaUl5YnhqLzhFSVdiQ2V2N1JiTVFs?=
 =?utf-8?B?NFRMcjJ4bGIxcmJpbldCU09LZzRJUWhmQ1Z5cmNmSkc4R2F4UTAvaFgwSW5u?=
 =?utf-8?B?NjdzWFBBcHRIeTJ4K3VQQnVvWWZqbGtUNmVGanI4U3FrdVZGN1E4b0o4dlFZ?=
 =?utf-8?B?ZXVFTXYzbHJOZmh6Q3BFWVoxbUlOdzhyakJ4WWdqa2NCT0JsWVBuQzZTWXBJ?=
 =?utf-8?B?UnBZTVpwZjBwUEpJdzdSbFVhS3ArSFBWUWJicjZlVjQ5bEZiNTAzU04rS1R4?=
 =?utf-8?B?Q2VUc25saWxRVVJPQ1liSDBWNUV3eFZ6Z1pqY3BGdkZrZFZuOTQrRmZRZElm?=
 =?utf-8?B?WktTaC8rWnFTV3RMK0tScm9XVmxhWVpDajdMQmFqbGUyM0lhQk1zSmdQb1o0?=
 =?utf-8?B?RlI2NDh6MEJaZ0JNZ1V2Mjlia2dRNVhPZStVbklsbjBUZUZMYlQ1NDBRZGF4?=
 =?utf-8?B?czhrTm9iQTNHRERkNXFiUTBLb09paEo4VWZmUUMvZW9KRmJ2dGFxVk1tRWhs?=
 =?utf-8?B?Z0dLUDZCVlVFMmo1dFN0dkt3eGxaSVRyYm85RFZNYWZRL0VBby9HVEN4M2dr?=
 =?utf-8?B?ZE9adVpTVXQ1L3pWRnRad2RVSVpvNUlBYjBwek4wNGZINVV3Y09wWUxpaWUv?=
 =?utf-8?B?eGYwcUpDZlhETkduSzZjeXkzOWZsQUkvYnBsc3BqcWkvWEUvZTlURllIRXpV?=
 =?utf-8?B?VzM0YkZkZXZ4bGtzeE9uV0QwSmY4NzVQQUNFK2xBQ1AzMzMrdnVBWGtsR3dv?=
 =?utf-8?B?V2ljdmtpMHJNSFdrbndVcDdDMTRvNHV3Q1NtcVdrS3RkZ20zMGZBYzhlRkVl?=
 =?utf-8?B?TlViZEpIbEVuTE5XWWJUTm1mcVh5WGw5VHA3dm1hVVJ3ZmhGaFhGeHZSNWdp?=
 =?utf-8?B?S0NXanZ2K1dwSTQwME5XNzl6VWw4RHk4ZXZIa1RiTmhxb21iSGZhUHY0U05C?=
 =?utf-8?B?NzltbjdudTN4Wm81elQwS1RiUmJPeGhDZTZrQWtla01XMXhvU3BHR3dheDJq?=
 =?utf-8?B?N3ZEalFzb202VGFkaGRBMCtsN0NGREgwOFQ2ZDlFSHQ2UzlGeGk1ekFsWUVy?=
 =?utf-8?B?Y2RIUEsrT3ZxVVNuK0lsS28zYUdNUlh1MHhHZXhNUXRITHRiOE10VS9sTzNt?=
 =?utf-8?B?TVVZRS92ZjdFb2svSXVZclQ0bmtscS96dXk1bmN3ZXJrU1FYM0Q4Mlc0c29V?=
 =?utf-8?B?ei81QStsRm40NFZMZGtER084emlwYWZKdUs5cnhtU2dwNmJkazlORmJBOUhD?=
 =?utf-8?B?bjBxU2hYa3pZNnpqMjd2eUwzTE9GbkpxSXZxWkhYSU1LeGlBSTZ1ZWNBNDVa?=
 =?utf-8?B?VmZ3eURBdFBlYVRIT214bTB4UmtUVUxCMnhHdkMxVlBacCtoTXRzZHV5Uy8r?=
 =?utf-8?B?c1ZiOXlPOHpoT0pBOTRPNGoyblBMSTdGMmRRT0VSL3pJOUJpdmpGUDFDcWVq?=
 =?utf-8?B?cVZiVWFFSFljM3dQQTczRjBKREltejZyK2hrWDlCYmgyVGp5R0RHVm53Y0lr?=
 =?utf-8?B?TVd4TURjeFZtT1hOSTZ6MDg1YktQT0ZFUHpsUjJJZnNxZXBGYkdtVThJQ3JR?=
 =?utf-8?B?NVV5cGRiN1pTMjc2MHF6ckl1cWcyVG1XK053N0wvczdCRUgvekgwY1M0WUdB?=
 =?utf-8?B?WXJkaDZsaks2dzNGc3VPSG9hZFViMDFZY1BaQkEzUGlQQ0J4Y1ZoSXM5NlRR?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf722fbf-cc9b-491b-e449-08dced269d31
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 14:35:28.5316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MgQY3OCtLmUob6ikCufgBne4lny2owmXgugoTDe7/PxGWqfXQ+79BjkywPe7lqUncAfz8xyc+9F07xSL19CRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5981
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be escalated/considered as
> probing error. It internally WARNS on domain ack failure.
> 
> v5
> - return unsigned int xe_force_wake_get()
> 
> v7
> - Fix commit message(Badal)
> 
> v9
> - s/uint/unsigned int (Nikula)
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 962751c966d1..16b10bbccc6b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -604,8 +604,8 @@ int xe_device_probe_early(struct xe_device *xe)
>   static int probe_has_flat_ccs(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
> +	unsigned int fw_ref;
>   	u32 reg;
> -	int err;
>   
>   	/* Always enabled/disabled, no runtime check to do */
>   	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
> @@ -613,9 +613,9 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>   
>   	gt = xe_root_mmio_gt(xe);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>   
>   	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
>   	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
> @@ -624,7 +624,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>   		drm_dbg(&xe->drm,
>   			"Flat CCS has been disabled in bios, May lead to performance impact");
>   
> -	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>   }
>   
>   int xe_device_probe(struct xe_device *xe)
> @@ -875,6 +876,7 @@ void xe_device_wmb(struct xe_device *xe)
>   void xe_device_td_flush(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
> +	unsigned int fw_ref;
>   	u8 id;
>   
>   	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> @@ -889,7 +891,8 @@ void xe_device_td_flush(struct xe_device *xe)
>   		if (xe_gt_is_media_type(gt))
>   			continue;
>   
> -		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref)
>   			return;
>   
>   		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
> @@ -904,22 +907,22 @@ void xe_device_td_flush(struct xe_device *xe)
>   				   150, NULL, false))
>   			xe_gt_err_once(gt, "TD flush timeout\n");
>   
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	}
>   }
>   
>   void xe_device_l2_flush(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
> -	int err;
> +	unsigned int fw_ref;
>   
>   	gt = xe_root_mmio_gt(xe);
>   
>   	if (!XE_WA(gt, 16023588340))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		return;
>   
>   	spin_lock(&gt->global_invl_lock);
> @@ -929,7 +932,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>   		xe_gt_err_once(gt, "Global invalidation timeout\n");
>   	spin_unlock(&gt->global_invl_lock);
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

>   
>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)

