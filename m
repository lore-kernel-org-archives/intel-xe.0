Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C71C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 21:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D7F897AC;
	Mon, 23 Jun 2025 21:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F86zUv7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FD6897AC
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 21:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750713807; x=1782249807;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tMoEG6V3BRaSV8tMef1qiJ9Cg3t9aEryFZ/3M5sLppU=;
 b=F86zUv7RoiPGdYMjBMmJ5Exqo0wrUbx33k1UrFkxExrcqprxaOhBLfyw
 1cSIQvr8+NDw9SHypWc22jWnWCsEbFKMG5B9HuRhd7QsILz/b0qgUYx3m
 X2txT2lwi+dicdYkihmAZufDsBZy8MFcTKDvlnqQe3AA4N3SllCO6+Zup
 xl//s9e7UWI8Bfcck4pXJTVeH+bZf0nbcSFGBjJEDaDfyg9ndf7AyLJ0/
 QS/ooRI9UFP2AmHBbDsBmZu8QMv4oTYEwEbAL/Jegx1mvYmbtB8DbMJx2
 VwAzmLThMJW2W5o33HEtjv3OoV16fbEre2/FF4fswM89donkkuwCVXUBX Q==;
X-CSE-ConnectionGUID: XUXMIBxLSGu9ZoLnRVhdvg==
X-CSE-MsgGUID: qxxcK//eRGCk2/zrzp1dNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63206190"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="63206190"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:23:06 -0700
X-CSE-ConnectionGUID: 27oghp+lQv2sjWVJqJ4A4g==
X-CSE-MsgGUID: PLSCy3D+R3ap2zL+76YTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="152230121"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:23:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:23:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 14:23:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p27jmID/tefGQ68E+7gOEX1wCXkYCsbZzBkI9fhlRp9XTzNnEWwg2fixCoaYTO/ooj8j+01jP0S1lxeSK75zVRxssu4LDIfnpjRgH28urvUrvlijNULSxP8jOxYqmRT2dD6SOvkq/Ah4NZLqLGVLepzp3A5RPLQuMc3dQG7UL863oPYxjJXscSanjBpmKxp2E0ZEcQ4hA9gWhNOb464MczBKzBi5pYx/hAbgUTVF63AGmGaPieLtYZd1XhWYikaq0zCBfoDY+NxIQm8E9NWEUS4AzvITBuVElbSdIw4Sm9n5shf5f+KDFSp/wgg8fQRm3lXQ+lFoUQALnnF0KvPwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkNhEsDMd21d2pv4FjX4hHtlBeFumTa9cURWY1zmBiE=;
 b=p2GYR/l4mE8tMQbiG7jr1fAlXBeS8s7qP+VAra8h0kv1Rj/u9JV62rrg9A+ztcsGkS1Jbqczf9axsZUU8OMFzADo+qnS1W0SpvV9RkZDyDZiOmNJA+BiYQi6oSZXYPIXXv5bjqQhku2GBtng+pek5uPpFzaKw38g/qoNaj2IDEe1yyZO+kVhuNw0nFMIAUXxKn57Ge3A21kbijHiHDt7jgemwM8Ip0ytDkWfwJ3+qSBWrnodCXLEtn1q1OCZ67WVoPfTCcyWhQ2jmbWlOvGQQYFKu2FmwoiOdGSsyZq/bXwFsyITPWeSx/6xf+arDYIw2DYEAKoztliVhZWBm76/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9010.namprd11.prod.outlook.com (2603:10b6:208:564::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 21:22:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 21:22:44 +0000
Date: Mon, 23 Jun 2025 17:22:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Process deferred GGTT node removals on
 device unwind
Message-ID: <aFnFoO-E_m3UJmBL@intel.com>
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
 <20250612220937.857-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250612220937.857-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 8212c6d1-fe2e-4e91-409a-08ddb29c17d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yjXeqpqkchQtIWFz92DHwi2+yairYgl05AZj5w5N8SVNpIGRlZKFgfxCrB8B?=
 =?us-ascii?Q?XPF9V2kDHRmBSJldc/sjS9PJbrSK8Mrs0I1K9n68kq4rT+tOw4zr/RjvrT0w?=
 =?us-ascii?Q?afObL62p/i3pjYzmCA0zSP6mI7jbVIQkDpY763GAqIifKTOvybc8Gq+rptfB?=
 =?us-ascii?Q?98RKDPcBJMVRzvTFenrdymPfmeP3Y7rn3oXGhEWKoyh54pt5cw+iHG42KAiR?=
 =?us-ascii?Q?7CviAevtTUykZJ7deJ5keB6v/lndwhvvU5uTmyt0PH+jwb6hKAYaXySrFlJh?=
 =?us-ascii?Q?oWxUZmR2K/koRIT2F93Ki1jZOCr7PEz1M727WtgmiwBpjacFPfN4fcXMiOjE?=
 =?us-ascii?Q?6Gjq1cJqf2NG6aMNV0jbB6KpsbHtT+jXcpaI4VlXg0AaNrUDaZQGER4kzCwW?=
 =?us-ascii?Q?QmEbwuc/8LGV4N8nTsTZB8VDhwthc3RntTw3tu9qfJzZ3w8F43mNftMDQvPe?=
 =?us-ascii?Q?O7aUw7gMkyz8hJj5WYXbRqj7QfqTD/i3gkMGXz9wjkCXR9SN7Cx3DtRjj16T?=
 =?us-ascii?Q?crvnon/G7uqXdAudtKNX4U46mJE9+/KwtQ2/2LwqSqgAqaGEbHhblahP3xfk?=
 =?us-ascii?Q?0/uaUmL/w3pLaQ6tkefAdBxRHlxlibz75On7LGo2ICkMNoDpyKvlq/NKxo0F?=
 =?us-ascii?Q?kn6WNk4yqeRBNCtGa54U8kLqOblyNgDAMugF0i23GExjf2SciJwbItkJ2Dkq?=
 =?us-ascii?Q?1wuzxf3aT8iEnz98PD99Pujaq9kR+Q4Pjo4WGb5bzSyctcI18js/4zuRnRp4?=
 =?us-ascii?Q?V6Z/7SYal+86tb/N/c8bj+UIJHCBM47EV2ECQjrbLSS5Relvz3qzLkGAIzAk?=
 =?us-ascii?Q?uVp0zDOU3WWJmqIeMHlfFyhaIIluomViDTdsRpH4tK9eEVdBiSo+AcaZ35Ul?=
 =?us-ascii?Q?j1yn+32/T4u/jtNMh0z1T6LfpGRtgHoJMzzwhJMVFfKoaIhuJAJ+3AozkkgK?=
 =?us-ascii?Q?nOIlIcSg/TlpwXgQzby1Xi0nqlCDAfSru3sMCWhomKt9+r8gR97D1q6CEmFM?=
 =?us-ascii?Q?UT93lmwW11exUnoowWceCb/lCdo8g+2t0flq8mGhELKSTfsUSrALowo00FTN?=
 =?us-ascii?Q?TrYPPnV/8Cx5b9sLKMbWh58n66UyHjVBYJCdf01Nq80TjXNI6eP8jVclEyMA?=
 =?us-ascii?Q?7SYNn3mfrB0uu3jo361B9UV9PSZi1x40oycB/XV1V55ptj2T7SU0ME4w1v4l?=
 =?us-ascii?Q?WTdjiErNs05TzcdEhJFBh0BLDLjVUu+gkkFw1PQJWcz8oLm/cQazOai2rYzt?=
 =?us-ascii?Q?0XJNk6XIPtQZ7ckj/NuklRFftONU3DgDF3DhhdfmH8EbVTJOt2MztyinTqLq?=
 =?us-ascii?Q?rzbQYf+f+rxLtgQBRK9Nej1F0UiAc8d7peleLvHWPWsdKVwsk2Hddw3TSQfg?=
 =?us-ascii?Q?sDYatxtTJZcQOTzgDffLARVJfD66spaRD5JKxfUCmtvjDSwk1YGOJRv/ZyBZ?=
 =?us-ascii?Q?CSCkP+oKEGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aQVIICL1MCGtu2Qiwt47iQ2dRuvV0wm2nIHZ7Tvj88aW8hhea6qYlXaeFsvB?=
 =?us-ascii?Q?XOpOMp/p8BZOlGOA5uS0dNeSrTHgZjh48FT1lEqGvbPWf8vfBD1S2OvS+YEz?=
 =?us-ascii?Q?gP+zfzo3LmakxV/bojErEOVjooBwxrqPvaTI7hzzKDi+mXuj+Qu2aIbpnD01?=
 =?us-ascii?Q?na/QIMuVby8Hjh8P9qlTIY3mZwgmis3WzS2YztsweRpPlL3MnWP6zIJigKVW?=
 =?us-ascii?Q?TRPQF4DpCPgY95To2DXmljJ8gJuck0O67QrryNWVa11MH2D5h+8PYLJMBbLZ?=
 =?us-ascii?Q?h6MN4KPRB97LfJKny0tBWgeaxUJxvzC7Zss6ZCn+4/zAVs2ZskGsgOSRqctf?=
 =?us-ascii?Q?JeH8I6qeDfaSwXIlYMF41QnNmBE/jEuaghz1ht3ZlBLXCUv4gWivh36UaVM1?=
 =?us-ascii?Q?XT8EsOodvked5Yxji8Oe/u7TqrRqjCYKsBtCp3OKy3KGsbbdcGbrXeLu8ZWB?=
 =?us-ascii?Q?Kz8YVDlwXn9roYkbqwfurEUH78wtYkzubfqWByGHd83TrTBhngpX+EyW1LDB?=
 =?us-ascii?Q?FEWg0SXYFydqAIK0+UPbrg9qODCgzsRaFmqDiqmgWx2Sfi2YJRUmmNHa9lDm?=
 =?us-ascii?Q?X0VC8N9/FrLm2WENMyZV5TFwnBWzQmMnG9BPGVL3qDjGwFhSG7zFN4lf2pxP?=
 =?us-ascii?Q?AdsA9su9JNu6g27pNwbiwsvF4a1Unrnr9DZWREVwz+jBYyc3c24JWrmumFC1?=
 =?us-ascii?Q?crA7xjNeIvEtvxvA0dZuPr0POVtpJpu7g7gC4ThjS+v0L5q9eKyArD8fLUL4?=
 =?us-ascii?Q?KXlbzRjqD8Q/QsCXxTQoXRo5lvIG8r87DVrTETtbj/IDcYlbgMfSC/lhZxMf?=
 =?us-ascii?Q?G8/ib8BME9+/BPuUk14JqgjGpnXvJdqWsP9Nb7d9nohGBkTJv4upHo/HpanE?=
 =?us-ascii?Q?0N8txFAco2oEiUP2uyq0YlubcOcGg2ToLG4tOG7AyitqexTGN0gyi6ps34un?=
 =?us-ascii?Q?elEDYalKTy9IAGbMa58qGc6VJXkRZaOuIet0mLZlZ6NYXHsX0R2fq0T3jIuw?=
 =?us-ascii?Q?K8j+BQS4YiQ0j0s1GgIB+C1ItZhi3TCGpLrXgEsoMwnfytS4bl+82tsirKUA?=
 =?us-ascii?Q?g7AjvKNZMhSEcEE1mrW4rGfdCWnfI7kfOQlVgQ+2DddRHGQpDczfOqC/2Ye8?=
 =?us-ascii?Q?31y88XGGev19KWEbGLYxiEvaI36+wA2ZhgR5VUiJ16eUAIpQidc9ABNellHU?=
 =?us-ascii?Q?0lbsB55sq4f6tCqYJMrIKaSzIMELL3SUyWG3bFC0st/R/Bjlccrz8yDGnkAg?=
 =?us-ascii?Q?jSOKDs/Y2P450hsZdpT7p/+ow0IkszxGTew/NnJKSw3ihFXo9OmF/iHqu+oq?=
 =?us-ascii?Q?CQD5s/UVuFtWbj2f9VN+6u6ECZnqieGffAb1sCOoShCn4fs4nzwxh8k9ahot?=
 =?us-ascii?Q?3tyV6vz+ssg5P2Rp/GBjobos0hO1b3+Vl1JIsarLLw5MG+2KRn4ZAvJht2P4?=
 =?us-ascii?Q?CMRtLkfiq66EUT9pO8u742YEL2LpLasNR5cRBd5e4hK0R7aHSXMonqS7hBkk?=
 =?us-ascii?Q?aO8T76P1EH9nLjIx+KO7Jjrb0OBRmOVJWMVL1009uviYEpN5RPdeO/Pr/WDT?=
 =?us-ascii?Q?17MEIiNmMkrjLAS5K8GKNwowf/nAEZseSR6fXTpu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8212c6d1-fe2e-4e91-409a-08ddb29c17d6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:22:44.3552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkcfZJ9t8nPbbcIlxZ7rQ3yYuvrhqbWTEArC2zwwIpvashrLYm5e1ycBDKxMVA7su0HofKUHdu8pQp9uLa9Wuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9010
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

On Fri, Jun 13, 2025 at 12:09:36AM +0200, Michal Wajdeczko wrote:
> While we are indirectly draining our dedicated workqueue ggtt->wq
> that we use to complete asynchronous removal of some GGTT nodes,
> this happends as part of the managed-drm unwinding (ggtt_fini_early),
> which could be later then manage-device unwinding, where we could
> already unmap our MMIO/GMS mapping (mmio_fini).
> 
> This was recently observed during unsuccessful VF initialization:
> 
>  [ ] xe 0000:00:02.1: probe with driver xe failed with error -62
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747340 __xe_bo_unpin_map_no_vm (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747540 __xe_bo_unpin_map_no_vm (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747240 __xe_bo_unpin_map_no_vm (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747040 tiles_fini (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e746840 mmio_fini (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747f40 xe_bo_pinned_fini (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e746b40 devm_drm_dev_init_release (16 bytes)
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] drmres release begin
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef81640 __fini_relay (8 bytes)
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80d40 guc_ct_fini (8 bytes)
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80040 __drmm_mutex_release (8 bytes)
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80140 ggtt_fini_early (8 bytes)
> 
> and this was leading to:
> 
>  [ ] BUG: unable to handle page fault for address: ffffc900058162a0
>  [ ] #PF: supervisor write access in kernel mode
>  [ ] #PF: error_code(0x0002) - not-present page
>  [ ] Oops: Oops: 0002 [#1] SMP NOPTI
>  [ ] Tainted: [W]=WARN
>  [ ] Workqueue: xe-ggtt-wq ggtt_node_remove_work_func [xe]
>  [ ] RIP: 0010:xe_ggtt_set_pte+0x6d/0x350 [xe]
>  [ ] Call Trace:
>  [ ]  <TASK>
>  [ ]  xe_ggtt_clear+0xb0/0x270 [xe]
>  [ ]  ggtt_node_remove+0xbb/0x120 [xe]
>  [ ]  ggtt_node_remove_work_func+0x30/0x50 [xe]
>  [ ]  process_one_work+0x22b/0x6f0
>  [ ]  worker_thread+0x1e8/0x3d
> 
> Add managed-device action that will explicitly drain the workqueue
> with all pending node removals prior to releasing MMIO/GSM mapping.
> 
> Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for ggtt_remove_node")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7b11fa1356f0..a8830cdb185f 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -238,6 +238,13 @@ int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
>  
> +static void dev_fini_ggtt(void *arg)
> +{
> +	struct xe_ggtt *ggtt = arg;
> +
> +	drain_workqueue(ggtt->wq);
> +}
> +
>  /**
>   * xe_ggtt_init_early - Early GGTT initialization
>   * @ggtt: the &xe_ggtt to be initialized
> @@ -290,6 +297,10 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (err)
>  		return err;
>  
> +	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
> +	if (err)
> +		return err;
> +
>  	if (IS_SRIOV_VF(xe)) {
>  		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
>  		if (err)
> -- 
> 2.47.1
> 
