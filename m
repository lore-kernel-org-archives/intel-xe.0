Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF7CD3B7E1
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 12:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6530E10E09A;
	Mon,  8 Dec 2025 12:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hk5Na76c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B111D10E09A
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765198736; x=1796734736;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hg5P2ArXefS7HNNbfKS8hyB/7g/VhQoVthHLX41cfkw=;
 b=Hk5Na76cP1dPir3D3Kaf+a6s+NWekP6ApQtllRJAy65G5ZI7ZI8CRT9N
 rQCROFBK0qOUQQbbdeQ49yB3C7SFkiR2t+PtXTpkGkGhW+zMNFRRcDIrq
 Vj8hFP8tJLzesyWe6o3LEEsGfZ21Fzrsu4KZNbqpmJ3uCBNA0A7We2Mdw
 L/pqzNo3mwKMw7vWSSFVPtltiklfD7LQNCfwrO8rSO4eV5+AbmVEmKiPc
 1uiQwEQoiHoclD4QrF2tx3m3fSrNCHD7ZnTVuBXDOcsryYG9LdFDC8Igz
 M30g/npQuIZRrnXiGSx9OCZJjkVKQZE81ObqfVSkz0yPN9L1gE5FR7feJ g==;
X-CSE-ConnectionGUID: HI81yyIXTpmyVaDMvI57vQ==
X-CSE-MsgGUID: PqB9byhfSYOqe7ovbeNxYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77461069"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="77461069"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 04:58:50 -0800
X-CSE-ConnectionGUID: cFUICJMaR1evtftWaeC2eg==
X-CSE-MsgGUID: G1sL2u0uRZqkVimvOTIzwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="200397514"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 04:58:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 04:58:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 04:58:49 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 04:58:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgsYWR+ugnpA929tpy/0VwD7fHLG/+RBoq9YLxzh4h4vIrvzSmGw5OH8WZe4x/KyHgAS/rZEVkb4SkeW91tpZQktfmdZMQTPiiwlSHeWfd7X+SxNg+ntJ6WZlmbgXDJV48gcKo5+kph5jJUFWmPOLAWP2fj3o+KHM4iNi8Zj2QKumiNzwApRP1lA/CsOw3aGH2BXS13KHf1N1lKlBllDu5PzJ4/3Yg+BlZXxDFmEr+HqUJL1elIVy08+WZKyb3WTTmPpkOLA4GLVV2Cheu0Fbq1WKKV9dzJ+FlqzUWs3YSVc23i4qgx3NsNHRHSaW28DT0rkc8ng53js4VkST84GtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlPf23R/mdIYKYXM2nxnZrfY6get5rMdEiZLCtY1uVs=;
 b=qvM7ps5981u+sewnDt5LvsOOBAHkDdWY7q+9VlMBMPFNOR/qgJkBlvwm+rj29mGnxFXxsJLTSWDLdCyDDlhFRsPGALRgPeqM+Yx0GBTLlIWotWvO73BhC7FTuJteuMNIlqF250Vx7pLTCPO6/CMtGDpLnQeVGUTfJ6t24zYyW/pfv2PCRKdhPJHGiXquxoXwtCJZnEgboxmByhB9CizBfoYR+KvnWStoyBPzAspidrjS+9ByPE4B3k6+6DZYBPwckLa1k6K5UfpNodf0yHSicjlz5WzZ7b9Gv64QtGmGQziH73nfW+BR/wZ9uhzRHfPGXErFtTgPTuRQIzsiAqeUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 12:58:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 12:58:47 +0000
Date: Mon, 8 Dec 2025 07:58:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v10] drm/xe/uc: Add stop on hardware initialization error
Message-ID: <aTbLhN9UCZt29bMJ@intel.com>
References: <20251205180642.4005099-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251205180642.4005099-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c63bb6-4caf-48e3-79ce-08de36598692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dbjv0Y4t2ZVBGew4eMjP192L1GBOpGsgVEo2PCCiMduIOJlB4yjxcdz88zxN?=
 =?us-ascii?Q?fPLgjesya0XYPDqAmCEWut9iy4DYPFG8Pl4JUWb/HSRx29rIyHRwxpnZyctV?=
 =?us-ascii?Q?kawaurSkLeJos2POSW9ukLGdjhBuXqDibiVT1kPXYKm8bgACuCZEtUIAbOoi?=
 =?us-ascii?Q?OXkuFqQISSi5y3JJ5OhvHF/qcTtjD8R41Mq3Y2LTY2dHFC+bT+cbCwROraNs?=
 =?us-ascii?Q?itFXSMi0/xjcMK0PTgneYPugL8+2WQB1qIOQvKTREfbguBUj0sanY/GA1r6m?=
 =?us-ascii?Q?p+MZ8VVRZSbbbrFLFS2tRtFbBe/BXfBH2l12u+U2So0naes/bXStaV65xXa5?=
 =?us-ascii?Q?WQTF+VxzUNGmihvmR+c2u0RiXxsuO/ZxigWQlwQmveoXNywOgdrkjXhfF7Z4?=
 =?us-ascii?Q?cL+93DEJIQ6OLWQ28I+O7RbXZQyNxi90tFTCNGFTaAHHxUW2eMExIrNCZud+?=
 =?us-ascii?Q?jwWSDDAQsz4fKaHyw/9bxGQC+7nJlXaQMsLiU2Gz2HNuUrteLHddtzoswSlX?=
 =?us-ascii?Q?wXaBEPmo3oqWoj0nZ+hwcyV7hL6l09rqNftFea1Z+gxLcxrv9VmWwBpSNARs?=
 =?us-ascii?Q?9vqOlNyHsMNxcRWrruCyjtk8/AJrKb0nqqmYA8x/amuIqgC8pJdBSQ12iI4r?=
 =?us-ascii?Q?zEEBLmFamzzv6mO8kbn99UH11GtjbLh20P0m+hV4by1O6w7MlxmZ7DPAtAr8?=
 =?us-ascii?Q?hsS2zj/TlYajUiPGdDFtryfHG4p8oG2VIc1q8MdwjRevMGoD5e3CaaNnRXB/?=
 =?us-ascii?Q?4wJxMdJu/yspAHF/t8ZoT7pyTmYoHtiCp8Qo3r0s/ArJxwnmBOjGIYWRZvoJ?=
 =?us-ascii?Q?6uLERZqI7vMNJHeOygghWeD3EfMCV+D4aMTC1MtXKJSvlQa3+itWIANtHP/V?=
 =?us-ascii?Q?36cQAm73utTelOaXUvlIdWh2MUVo8u7qhmhzBzUBUUdWxeG6RN9S/YAx/iOr?=
 =?us-ascii?Q?DIZDOBlH2+M2YIgt1ncfXXTt/BHge2/fqCnmxt6Qzc6cBS9ywRv5Pyru/WVz?=
 =?us-ascii?Q?GzFhkRBVtyjkB6jxv5+9bYfq05gzg30A35f930DbRfUeE6XwfXVRVxyQGlvO?=
 =?us-ascii?Q?lOII9Q7SxQy8tojZqbfybrtmkJ3gyjuupGUIVv3Ouu9z4ymzPFfmzUJDyzv4?=
 =?us-ascii?Q?ZcyA3DqMOyBeGg5QUImXbFNeB1i5l5jNHSdsUyfV3qsSOBbZbMDJlhxMnZbq?=
 =?us-ascii?Q?In8asbjebxp2UweuVZ2bnQdmsyHum5u6tzB2Z3NqxYHxmFtHQwAll5S5z9z8?=
 =?us-ascii?Q?bmo+21By05cpgqpwOHCkeU2EVBA1EYF6pM+isczJOohhBCICIEOpGxWRL1ja?=
 =?us-ascii?Q?tkby7JqvbsvfDl/RWKBjw8INyGVe3z8e9faBIwONGhTJSkMg08jTgGCMn4Hg?=
 =?us-ascii?Q?rMgQGOY5m8fqwe3DcYOvtlmE0WX15KCYyfdEr9FhYkArphe0JF5EX2EDuJ5i?=
 =?us-ascii?Q?8p+x6JqOJS7jpJI6I1Afh5WP6MPUjTs4MMxylHrIOrEWoIcr+MG8sw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qj9TiPFqVLJ39jAcCwNLOiTZVMlmCLEGCjl3URJNdBNDgg6/YA9ynzr5DDkD?=
 =?us-ascii?Q?rh1yTSExEWHAs4awX4QxkYbXuNJ8xRLpI6QCDdkYWz9gLGIeqJ6gtSruteyK?=
 =?us-ascii?Q?P5ea+vExvAGPHZjCGp71rfBMatACDen1GcZB3N3rZPu3b42XQPj4yDnKTVEX?=
 =?us-ascii?Q?asv14YqVGKN28jUx0/RQWaHjTVjweng1dL7V6NCtGPECwrtV5oaMYpqRMYTn?=
 =?us-ascii?Q?AFW9/158X8BZFi3jcqIBWydk93gFmXDSoAT77As+WeK7nMAq/n7BmjEXfYzt?=
 =?us-ascii?Q?aYgE3y08YQR3A9wc0Adt5jUvCm3zlQtOmL6yW/RWzmbU9OkRt+QWG/KRJbX9?=
 =?us-ascii?Q?fiy4ZjbyExeVKd1hSR9ltsl8XRou1njVzWLkO7QyU7SpvQmJ87X8q0Nq5Pwi?=
 =?us-ascii?Q?BmExukgCqj0Z6kOk/ADTQsJbe9X7CY6VA5qbZc14VABq7bQXA3ZWAixnoNQ5?=
 =?us-ascii?Q?5pksfCueVty2O9DKj8r6KvHGxl9V4rAXAwJhiptLzfboGdK1emOcrdmHwpQO?=
 =?us-ascii?Q?9/E3iOaJYQubTN6ugzXt1BVQHcx7D7G31hMOADWmPrwJtqeE9OKRyzLgqEbF?=
 =?us-ascii?Q?80tt4tDCniiIje99A/q9I+Si6/6TDUA1A1ySRV6rx1ZWMgT9s+2OoRFw7AmQ?=
 =?us-ascii?Q?xSojAU9mlPnsvXdnW7bb7QxFhs0PzMhVgMPxL8zO/uzn/HJdMLeOF8GtJe0W?=
 =?us-ascii?Q?PN9WqT00Q694jVIDVMSSR/3zBr2ubVsTpvvUbuYjfQAw3YelqHiqsLgp2gLX?=
 =?us-ascii?Q?+umV7PjDFvIS8007r6amUo8Y4b1lNsxZYkf7s7VKUTOOg83ecgdWqm0iUc+C?=
 =?us-ascii?Q?egdluKEh26C7d/gBC1V/xarh1enYlJUnDwGiOAm8m21Y774ZH67ZdtqbflDq?=
 =?us-ascii?Q?xGRblEu2UJx70zrqV2tDxQecHTSgHAenlCvIinlYsgOIPxKTgy9+S4T/rWCj?=
 =?us-ascii?Q?/UHv94zXl3ILQ4D5lTjrtQU8ldpoIFiLf1navHs2xZU8kpGHjtvptei4sFo2?=
 =?us-ascii?Q?vLQY+wfFxz1gzJnEv/rzuRk9ryev65X0LesVmU+E3+stmSaLy1ip3FwHDCWB?=
 =?us-ascii?Q?UbteRg4Ctz+LZA0my9t/c3xtVbeEbxdHoGCvaPxf0YbRc4jCyc2vt0wgs5XQ?=
 =?us-ascii?Q?1fzYFZ++mBA+TbZtdlzWlWM93nyya6gYMUyRFaX/qsUIld+/hk+D78C60+ff?=
 =?us-ascii?Q?xDXA+SI3Jk3+ZNAhFgnD9oMfxNuG25SSuFktlo3XaJKW3sr/aE6OMkI1kTut?=
 =?us-ascii?Q?FtOK+TsK7aQteTs9E73yW+37oajhROMBZWwhRZGwK8ojWeEgmQZcgzAV446O?=
 =?us-ascii?Q?9c/Txib8PzHNyYAoyV7mFcmoLgwxFCMRyWv3mLzct1Ie/+VGZKg+z0r9jrJb?=
 =?us-ascii?Q?pk7nU3SWKu20tyO4zoMgVwMrGGQstuyhHzuR5t5oYCu4r173uU45wWTdfMND?=
 =?us-ascii?Q?BMyWSxOmQo/N879TIVZshxoU/BL6pfoKQcnil9j9qO5ISFtWePgz1rHwK4FT?=
 =?us-ascii?Q?GIsRmMqWcf2fMpRSRp4TeLRUafobdPqHYvDbDVVJrtd+eOtyT01dpJ+MdlQQ?=
 =?us-ascii?Q?+CzAprwSejxAGwMjNs+wfs4gelticv/GINfeP0RL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c63bb6-4caf-48e3-79ce-08de36598692
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 12:58:47.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I942VuVFiL4gSxzWO9s3IHJo4YrmsbhIzAV/xY3KQmKiaScER4z/ysYA+i/x8+j6BCcsgUtkGpr2pAYacWD/mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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

On Fri, Dec 05, 2025 at 01:06:42PM -0500, Zhanjun Dong wrote:
> On hardware init fail, the hardware might no longer response, add uc stop
> to clean up. At driver unload, all exec_queue items need to be freeed,
> change xe_guc_submit_pause_abort to free all contexts.
> 
> This will fix memory leak issue like:
> [  189.997904] [drm:drm_mm_takedown] *ERROR* node [00f0f000 + 00007000]: inserted at
>                 drm_mm_insert_node_in_range+0x2c0/0x510
>                 __xe_ggtt_insert_bo_at+0x167/0x540 [xe]
>                 xe_ggtt_insert_bo+0x1a/0x30 [xe]
>                 __xe_bo_create_locked+0x1f3/0x930 [xe]
>                 xe_bo_create_pin_map_at_aligned+0x59/0x1f0 [xe]
>                 xe_bo_create_pin_map_at_novm+0xae/0x140 [xe]
>                 xe_bo_create_pin_map_novm+0x23/0x40 [xe]
>                 xe_lrc_create+0x1e4/0x17c0 [xe]
>                 xe_exec_queue_create+0x38a/0x6a0 [xe]
>                 xe_gt_record_default_lrcs+0x117/0x8b0 [xe]
>                 xe_uc_load_hw+0xa2/0x290 [xe]
>                 xe_gt_init+0x357/0xab0 [xe]
>                 xe_device_probe+0x403/0xa30 [xe]
>                 xe_pci_probe+0x39a/0x610 [xe]
>                 local_pci_probe+0x47/0xb0
>                 pci_device_probe+0xf3/0x260
>                 really_probe+0xf1/0x3b0
>                 __driver_probe_device+0x8c/0x180
>                 device_driver_attach+0x57/0xd0
>                 bind_store+0x77/0xd0
>                 drv_attr_store+0x24/0x50
>                 sysfs_kf_write+0x4d/0x80
>                 kernfs_fop_write_iter+0x188/0x240
>                 vfs_write+0x280/0x540
>                 ksys_write+0x6f/0xf0
>                 __x64_sys_write+0x19/0x30
>                 x64_sys_call+0x2171/0x25a0
>                 do_syscall_64+0x93/0xb80
>                 entry_SYSCALL_64_after_hwframe+0x7
> and:
> [  189.973775] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: GUC ID manager unclean (1/65535)
> [  189.981731] xe 0000:00:02.0: [drm] Tile0: GT1: 	total 65535
> [  189.981733] xe 0000:00:02.0: [drm] Tile0: GT1: 	used 1
> [  189.981734] xe 0000:00:02.0: [drm] Tile0: GT1: 	range 2..2 (1)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> v10:Add submit initialized helper function (Matthew)
>     Call xe_uc_reset_prepare rather than set flag directly (Matthew)
> v9: Rebase and keep xe_guc_submit_pause_abort name unchanged
> v8: Fix __mutex_lock warning
> v7: Clear all queue items by guc_submit_fini/xe_guc_submit_pause_abort (Matthew)
> v6: As huc not involved in vf_uc_load_hw, roll back to guc sanitize
> v5: Move stop flag set in guc_fini_hw
>     Change to uc_sanitize in uc init path
> v4: Add memory leak fix
>     Switch to xe_uc_stop
> v3: Switch to xe_guc_stop
> v2: Switch to xe_guc_ct_stop
> ---
>  drivers/gpu/drm/xe/xe_guc.c        |  6 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
>  drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c         |  8 ++++++--
>  4 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index f0407bab9a0c..3dcf078e111f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -662,6 +662,12 @@ static void guc_fini_hw(void *arg)
>  	struct xe_guc *guc = arg;
>  	struct xe_gt *gt = guc_to_gt(guc);
>  
> +	if (xe_guc_submit_initialized(guc)) {
> +		xe_guc_reset_prepare(guc);
> +		xe_guc_stop(guc);
> +		xe_guc_submit_pause_abort(guc);
> +	}
> +
>  	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
>  		xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3f2c8556a66..34c6e8a03013 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -425,6 +425,11 @@ void xe_guc_submit_disable(struct xe_guc *guc)
>  	guc->submission_state.enabled = false;
>  }
>  
> +bool xe_guc_submit_initialized(struct xe_guc *guc)
> +{
> +	return guc->submission_state.initialized;
> +}
> +
>  static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
>  {
>  	int i;
> @@ -992,7 +997,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	 * If device is being wedged even before submission_state is
>  	 * initialized, there's nothing to do here.
>  	 */
> -	if (!guc->submission_state.initialized)
> +	if (!xe_guc_submit_initialized(guc))
>  		return;
>  
>  	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
> @@ -1994,7 +1999,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
>  		return 0;
>  
> -	if (!guc->submission_state.initialized)
> +	if (!xe_guc_submit_initialized(guc))
>  		return 0;
>  
>  	/*
> @@ -2418,8 +2423,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
>  			continue;
>  
>  		xe_sched_submission_start(sched);
> -		if (exec_queue_killed_or_banned_or_wedged(q))
> -			xe_guc_exec_queue_trigger_cleanup(q);
> +		guc_exec_queue_kill(q);

I believe this could deserve some extra explanation in a separate patch

>  	}
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 100a7891b918..9308da2bd104 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -15,6 +15,7 @@ struct xe_guc;
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
>  int xe_guc_submit_enable(struct xe_guc *guc);
>  void xe_guc_submit_disable(struct xe_guc *guc);
> +bool xe_guc_submit_initialized(struct xe_guc *guc);
>  
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 157520ea1783..60430d56c79c 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -173,7 +173,9 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> -	xe_guc_sanitize(&uc->guc);
> +	xe_uc_reset_prepare(uc);
> +	xe_uc_stop(uc);
> +	xe_uc_sanitize(uc);

Why reset_prepare and not stop_prepare?
All these guc variant functions are hard to follow nowadays
and this combination seems strange and make things worse to follow.

Probably some refactor on the current names or a new wrapper function
is needed here.

And why you use sanitize here, but the pause_abort on the above block...

This patch is doing a lot, in a single shot and without explanation.
It is probably an indication that a cleaner refactor preparation
series is needed here.

Thanks,
Rodrigo.

>  	return err;
>  }
>  
> @@ -231,7 +233,9 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> -	xe_guc_sanitize(&uc->guc);
> +	xe_uc_reset_prepare(uc);
> +	xe_uc_stop(uc);
> +	xe_uc_sanitize(uc);
>  	return ret;
>  }
>  
> -- 
> 2.34.1
> 
