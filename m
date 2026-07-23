Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17903C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 18:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3DC10E5CB;
	Thu, 23 Jul 2026 18:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X22+BseR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F2E10E5CB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 18:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784832788; x=1816368788;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M5zymFXnzM7qeKV7IAqHu8ofuZnDjFVJ1V3LNDLv4yQ=;
 b=X22+BseRgVb0270cfEm1FsvBJ6Xw1KIJ7c6Q559wnKjmi8zyo0aw5VGk
 1LLXyN+03a2fuFvH6usiJv6h9ZrdsKUNBfhSifCmaeRnORDjyhb69FLAH
 cTMZQIW4dp+OtiwVUpB0pkNU3Xj2zUAHz9tFtl+Sz1y3zVjjvnOr0GKmi
 E72foiRoO9z+hbpguextue/xxZAX2KptMVCU0oQT7kk1y2pZ2va8x4pyU
 b16edP4OL1/9ke6Cgyi7283ovf49FToXDaJZDAKpS6gbUv3Sa3olg+aZB
 o0QIde90cgG41978qaW7nxCod0hk0Y1B6MVjberoFmhrpCPe7PbDw9I0k g==;
X-CSE-ConnectionGUID: juU5jFtLTdiuzY4Wstq5Fw==
X-CSE-MsgGUID: xoADvFIVTpm15yzWPJk+2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96870067"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="96870067"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 11:53:07 -0700
X-CSE-ConnectionGUID: qIfHXveHTXOX1T8NsXnO2g==
X-CSE-MsgGUID: UcHez7KfRA2vo1Fe6f5Nog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="256707781"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 11:53:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 11:53:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 11:53:06 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 11:53:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgwfrj2rWyhIB4i+CMLEXz8dvC0t2vEo6C2A4AQMfkGLjQ85WWN7I9Sy7a651njJymcvf/OYo6zr7M/ys/beOqiYkBSxQuRjcGYO5L/o4PT45kuM9qMnWD10CQgYJKZdvP9zO3/NlIc6hI8WYSVV713Wyy67a9pCy0MMSJ8nh0i2UFGkbe8PxpSZQOeCa+yb9nb/ixgta4Yv2M79IqXSl0OgEi5CUpb1Ip+yMtWumt3Wy+G8YbQyI/wmBkf27Z3dot9xEkqLK0DCsuwsIcgHqBed1gfL+5qwUgvQnqIbUvZ49dPrDJ7Zf/ylerAtmstwKm+D6VSV0MLJ+wY5xyYB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55/kZDW3X/59LPnMgM4H7Qg9Cv2S2W6g1lVwCWZ/5UQ=;
 b=UaBtOz8u+ysLbiW5NIbyFUq2rZBM9yXm28POYejnpa7NiKGC7RAc51dz/1ajxl/OOD0aotlI3ETOU4ZfeuWIQqBJceM0kGWeGWCVyj24Rs7qsWJ6IH5GdSZ0skdPStnRZ9VdTVm6sw7p9oh0loPpWsgKl4x8OpBRTU0CUooFKDvsF1sFPwAz9+tzz+4TuJF1/pbvfa/r1s8CUlE8LdTa3qM62E5hXyeo6A0cSnEyZ4OI9L8Nh/0UMfY4PxBv1BNIsHyBLu8Oy8SpnrzmaUsRMz0Dzd7x47IFz6TKBMRk2j9erExYtwd+jO/NCg0es/8dHKkzFnpWqcAmSy5xUrRvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by LV2PR11MB6069.namprd11.prod.outlook.com
 (2603:10b6:408:17a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:53:04 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 18:53:03 +0000
Message-ID: <989b2e0b-6d74-4347-b043-13ba67c0e7c7@intel.com>
Date: Fri, 24 Jul 2026 00:22:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] drm/xe: add page size allocation control state to
 xe_device
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
 <20260722143759.1718600-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260722143759.1718600-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 548f3291-5a21-4dce-40a9-08dee8eba018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 0b9wug9NgCq0MJ7fF14s+vPDdjywGSEU5baEMXugaoo++MEzTSfAMzI5y5O74Oo9Mw4oumWMnxHyvC//Aj7g2SWSC99A7JL3I1rOq1pAsWyRcGEy8bQSGqDhsp3s+oEuiQj7flp6Rggo+4q89a3D3/vbU1mTBSdTWAFO6wEFHGhnrA0rsrSGRQF0sMaZECL+2Rq3b8Ga3kYq0foyGnYNelCzCP9lUOILxxb+gGPfZJhyTiWUTevWxsy5bs2YuEg6jaCuGnyONZ9sJVn2xSR7IcDnkN28Ync7SqeLCfgWYaJAXT4Zp+mpeQ7CZC114lSLNEFiyFTKdceTY6P1q00Po1urUggb3/GBScmk7cZyi/XZOev3r9kDyE2NHQ9Xg78eSSjrZ+tPFYFAKXnF2Bm31Nxiz/X3rjapEou9ROh0c0JxWLAJlUmB3R6dLW/HrT3x7jEjr1vyBl3/sF8HbN2GhFry4VZ2RsX+GT0m5rEvRnwTc/zbSXDHf82brEYnkev8YB1UPJ9znYiW5NVYQH2NkGN9NSx6AUI4WvBgfmk8DDWQE3h4pGBiNXFQR3cwBeq8FyWc3IDmzp0vjDQbswSIUSEa8uCJAsRUF3LwGi9mII6ke2rlgGuhCzHx4XAi1BRhwnJIGmuQNICgQUyn+s2IweuIH94ofAyN3P1iQzkWJ6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFzcnR0bndydVNkcXBKWUVzUjc3eWxzaitDYW9kOXVPSXpPN2hpSWVEM3FI?=
 =?utf-8?B?TDBNRTV6NTBCYTkvZ0I4blZwb3gzL0tQaGlyKzZXZG9LQnNsek9NSUtiWEVK?=
 =?utf-8?B?Z2VTcHYwck1pV3drSU1tN1ZsUjBwaHcwejlobUpJUzZSNTltMzZWMTFLUEVF?=
 =?utf-8?B?ZndlYysyU1JKMUVFSUxBL2Vqckc2RENYU0hZVVhTY3ErcGlrdXBsNlFidmIw?=
 =?utf-8?B?TDZQU1orYkFsNG56Z2JIbWNzaVB3VStpWmNVc0dJZ3o0dXVFMVJGQmIxOFR4?=
 =?utf-8?B?SjEwWTFuZ0VTR1FrV2RZaW1xSFVVcnp4L0F4U2ZBbnI1ZlhZVjVHWjlWV1B2?=
 =?utf-8?B?Zlk3dkpLTkZEanNoS2ZzVW4xamdtU1RrYUpsK25xbnFXa2VWclVTbVJBYjU0?=
 =?utf-8?B?MDM3VWRGb2FuOTVJLzhvQXdNNFVZT0Fva0cwTkRnUFFlSXF2UWs0YlJZMDZD?=
 =?utf-8?B?YXQzRzA3WDl1aVBWa3pFQVhhbmhKRkl1d2dxMWkrcEtLbUxkQ3BNd3BVT3RW?=
 =?utf-8?B?K1FKenhERGo3N3hzblYrUnpubEhjaUx5Q1NVN1gzM25ObDduTDFMNkN2dGVn?=
 =?utf-8?B?cGhNN0lxMzQ3TmNyWjA0akN3cE5MZXo2aE1VWlpVaDBrWkNXSG5qLzFBRmNq?=
 =?utf-8?B?aTJOTDF5dWlpY0pYVnJ6V0Y2cUFqdUdYUGl5TURpcEU0VDQ5YXpZeXV3K0pT?=
 =?utf-8?B?ZXZnTWZQU3lIOG0vaXNNUWdFRFpGY2VlRVArODkrQUJHZDZhU0hxamwyOGtX?=
 =?utf-8?B?cGkzQ2NKVDJHTGZmT3JSeDR4djhCR0JnVzU2a25ENTNnRDlUTk5hME42R2JP?=
 =?utf-8?B?YlBrTTBWdDVrWHd1YXpJT0NEUjdLbWhZcUExb3E5NWpvTXJ5UXdoa1p3V0dn?=
 =?utf-8?B?cnNUTlhMNk5aY3BLbmdOenEwWmpINWFTUmRlQndaVjJVcFREWHpEREtGcXRY?=
 =?utf-8?B?R0xKRTdLNndUNGVwcS9UNHdleGZ1NlVGbStRQkllRnBDeFlJd3ZvQUVINlRL?=
 =?utf-8?B?dFRaWlZaYmdxSDJlcUZYd3p6RVR2NjEvMVJnR0JEaDdTMGJ4citHUVJ1Yk1m?=
 =?utf-8?B?MDFMWXhPZmNRdXA5eHZ3ZlExNGZJTlFIWUZUN1cvSzluZjdDcHh6UmhLZmFv?=
 =?utf-8?B?bHljYmtMSjA3dERyOEtvVWptVjNvSGRGb1pyd2wrU0JnTlUxaTFtTitqZ0Zy?=
 =?utf-8?B?ZDhSZ1cva3NwQXVqVzhiUGpCbkdGTTZWaTh4dkhxcVorY3NzWkI3NUhPeStq?=
 =?utf-8?B?eHdkRzU0cjJLWVZ2UDI0ZC9kV1N0dlR6MCtTVGJhaXIyaE9MTzVKMnAxR1Rp?=
 =?utf-8?B?MDNDSjJtVG95ZUZGc1FlUFRweTRIRktYdnMrZUMrVEF5eU1hZnBIWGduVGI0?=
 =?utf-8?B?dFJ5Sk1RNXlXVitlK1J3UkFMNXp5SGc4RTUwdnlpVVhQSllPZ2xBUWUvdWwy?=
 =?utf-8?B?TTFmNUNNZGNqMFkwTmdtRzZSZ0pQRUdOL1dzTXZaVStNeVFtcWpVbmpSN0ZQ?=
 =?utf-8?B?R0dPcGpCTGs4TWZZY0xHQUE2eG9rZ3pqM01QYjR0UjFOWFNoSkpEd2RGSTFk?=
 =?utf-8?B?OHNNYlBjcDdsQ3lzNk8rOFN2ZlA3ZFhsRmFYMnl1elltM2hkc1VGL013K25N?=
 =?utf-8?B?TzNaendyVndIN1NEclYvbnRLTVdWeHhGUjN6OXpmZ3JSeW1oWUdzcGt4RHdz?=
 =?utf-8?B?MGlLR1dMUW96ZjZwUWRHT1hTSHFZOU5CYzVCd3E3dDRva3hxM0YxTnF0ME1s?=
 =?utf-8?B?ODdJQnRiK09SQ3BDV1ZhUHhnQkJWL09TSThJd0gzN2JwRUVOdXE0Qk9qUTE2?=
 =?utf-8?B?VU44V21aem56UGp2NEFOMnFWWWRoQk5aTnFzcit3ZU1semFrcFdZMnJNazgx?=
 =?utf-8?B?YXczVlJDU1BPN0UrOFpiWWN1aHkxK0NkREtNa2l2TGVTZHpaR2VaY0x2WEZa?=
 =?utf-8?B?WXBncFdMTEhvTzdzNmFJS0o0a01tVUlMNWZiQWFBZWdISVBOMHB2VlVJSDJ2?=
 =?utf-8?B?U2Z3b0R0OXhFVjg1aERjSS8xRmVsdHFMdDNFb1ljbWF5bmRrdlhDNVdUQ2lk?=
 =?utf-8?B?NlZZSDdYa1lUUWJmR3ZESW5RWURnaWEyREwrKzE2SXErOWVXQzRwc0dWR1Jr?=
 =?utf-8?B?VkVQbU5NR0lVN3ljWVUyTWFYU09odm9BcXRUdzVzZXowUGxlTkRKSnorYVg0?=
 =?utf-8?B?TTd0czNrL3g0dUZOS29uUjR3RFM1aEZqN0VGczk0V0NjdDFVUGRNblltcExy?=
 =?utf-8?B?bnA5eW1ReDl6ZWVWZEhJRzZSV2o2SEtBZjJoZ0xIZlJHbGlCYmVPZXE4bGZH?=
 =?utf-8?B?ZjdHVDUyZEVGYmh1aUMxRW5xNnkxZW5UZTlyc2VRL2JkbHNLeFRQdUhjdFBC?=
 =?utf-8?Q?vNpU5bxY/UNL0YvA=3D?=
X-Exchange-RoutingPolicyChecked: g8mFZKhKCFKewuiI1E6ZTI3/vQzRVLrR3KNWDslBhypOeHnH7UHe5VJ4mrt8ybpgcZFVZi2hv37L9dr/ul2deaKtRrcd4SvPYQXcozjAuitI98MzP/bT5e4pISVxFOTN3rqua3WWpbaMc24bGJ2DSWQRP9MTuK7wwqk6ggBa+bReqelHva5Qfx0UI+ArrMyiAQFbvmBFn0iE45+qUhFjz+vHmaNmtxMYc2AMzr4jLxE0KYv2fVI+spZzx/RCFHMROgwtI/X3Lvf69tLwqLsh/bRtZ/KoDri+oTmuWaDxAHJvT6gLgQZZ13I5cekgxS452LNlfmlGvPwB9UYqGm8Btg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 548f3291-5a21-4dce-40a9-08dee8eba018
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:53:03.8102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqqm+2DXS77d/ZG+sDRmeby5Zt6Lp1xIfkYD5GwS0FRABZAY8aa0w9WB8de8BvjVroZTymvOZvGrto7o/0dkAzAWrZA237fyVRBSYJ/9MCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
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



On 22-07-2026 20:07, Nareshkumar Gollakoti wrote:
> Introduce xe_page_size_alloc_ctrl_mode and add page_size_alloc_ctrl
> state to struct xe_device along with mutex lock.
> 
> The new control supports forcing user BO allocations to 2M pages,
> forcing them to 1G pages, or using a mixed round-robin mode across
> 4K, 64K, 2M, and 1G page sizes. Track the current mixed-mode index
> in xe_device so allocation policy can be applied consistently.
> 
> v2
> - make cur_index to atomic as update need in later patch to
>    avoid race/concurency (sashiko)
> v3
> - reworded comments
> - protect mode/index updates with a mutex for proper concurrency handling
> 
> v4(sashiko)
> - move xe_debug_page_size_alloc_ctrl_init() before drm_dev_register(),
>    so mutex and control states are initialized
>    before any userspace visibility
> 
> v5(Himal)
> - Guard all the debug page size policy code under CONFIG
> - Squash Kconfig patch to have Kconfig entry for DEBUG_PAGE_SIZE
> - Add inline to check debug page size support and exact mode
>    configured if it is supported.
> 
> v6 (fix CI build)
> 
> v8 (Himal)
> - use drmm_mutex_init to avoid leak with mutex_init
> - call xe_debug_page_size_alloc_ctrl_init unconditionally
> - Add missed mixed mode check on xe_debug_page_size_mode_not_none check
> - Add xe_debug_page_size_mode_is_mixed() function
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig.debug     | 16 ++++++++++
>   drivers/gpu/drm/xe/xe_device.c       | 19 +++++++++++
>   drivers/gpu/drm/xe/xe_device.h       | 48 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 31 ++++++++++++++++++
>   4 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 01227c77f6d7..79118d9efd93 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -86,6 +86,22 @@ config DRM_XE_KUNIT_TEST
>   
>   	  If in doubt, say "N".
>   
> +config DRM_XE_DEBUG_PAGE_SIZE
> +	bool "Enable debug control for user BO page-size allocation"
> +	depends on DRM_XE_DEBUG && DEBUG_FS
> +	help
> +	  Expose a debugfs knob to override user BO page-size allocation
> +	  handling for validation and debug. Supported modes include forced
> +	  2M, forced 1G, and a mixed mode that exercises 4K, 64K, 2M, and
> +	  1G page-size paths on platforms that support them.
> +
> +	  This is an unstable debugfs interface intended for development and
> +	  validation only. Its layout, contents, and existence may change or
> +	  be removed at any time with no regression warranty.
> +
> +	  Recommended for driver developers only.
> +	  If in doubt, say "N".
> +
>   config DRM_XE_DEBUG_GUC
>           bool "Enable extra GuC related debug options"
>           depends on DRM_XE_DEBUG
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65..c715bb1cafcf 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -921,6 +921,23 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   		xe_pm_runtime_put(xe);
>   }
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static void xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->page_size_alloc_ctrl.lock);
> +	if (err)
> +		return;

Do we really need to continue with driver probe if mutex initialization 
fails ? IMO fail probe.

> +	xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE;
> +	xe->page_size_alloc_ctrl.cur_index = 0;
> +}
> +#else
> +static void xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
> +{
> +}
> +#endif
> +
>   int xe_device_probe(struct xe_device *xe)
>   {
>   	struct xe_tile *tile;
> @@ -1073,6 +1090,8 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	xe_debug_page_size_alloc_ctrl_init(xe);
> +
>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index a03760d0ce38..6c4cfaebc44a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -212,6 +212,54 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>   	return atomic_read(&xe->wedged.flag);
>   }
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static inline bool xe_debug_page_size_supported(struct xe_device *xe)
> +{
> +	return IS_DGFX(xe);
> +}
> +
> +static inline bool xe_debug_page_size_mode_not_none(struct xe_device *xe)
> +{
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +
> +	if (!xe_debug_page_size_supported(xe))
> +		return false;
> +
> +	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
> +
> +	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M ||
> +	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G ||
> +	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
> +}
> +
> +static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
> +{
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +
> +	if (!xe_debug_page_size_supported(xe))
> +		return false;
> +
> +	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
> +
> +	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
> +}
> +#else
> +static inline bool xe_debug_page_size_supported(struct xe_device *xe)
> +{
> +	return false;
> +}
> +
> +static inline bool xe_debug_page_size_mode_not_none(struct xe_device *xe)
> +{
> +	return false;
> +}
> +
> +static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
> +{
> +	return false;
> +}
> +#endif
> +
>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>   void xe_device_declare_wedged(struct xe_device *xe);
>   int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 860ad322237f..03a7bb08adf7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -61,6 +61,23 @@ enum xe_wedged_mode {
>   	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
>   };
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +/**
> + * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE: Use the normal allocation policy
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M: Force user BO allocations to 2M pages
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G: Force user BO allocations to 1G pages
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED: Select page sizes in round-robin order
> + *     (4K, 64K, 2M, 1G)
> + */
> +enum xe_page_size_alloc_ctrl_mode {
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE = 0,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED
> +};
> +#endif
> +
>   #define XE_BO_INVALID_OFFSET	LONG_MAX
>   
>   #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> @@ -478,6 +495,20 @@ struct xe_device {
>   	/** @late_bind: xe mei late bind interface */
>   	struct xe_late_bind late_bind;
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	/**
> +	 * @page_size_alloc_ctrl: User BO page-size allocation
> +	 * debug control state
> +	 */
> +	struct {
> +		/** @page_size_alloc_ctrl.mode: xe page size allocation control mode */
> +		enum xe_page_size_alloc_ctrl_mode mode;
> +		/** @page_size_alloc_ctrl.cur_index: Round-robin index used by mixed mode */
> +		u32 cur_index;
> +		/** @page_size_alloc_ctrl.lock: Protects @mode and @cur_index */
> +		struct mutex lock;
> +	} page_size_alloc_ctrl;
> +#endif
>   	/** @oa: oa observation subsystem */
>   	struct xe_oa oa;
>   

