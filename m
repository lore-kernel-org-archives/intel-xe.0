Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9313C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 14:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4A510E06A;
	Fri,  8 Aug 2025 14:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVrtOLH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B115210E06A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 14:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754664533; x=1786200533;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oyZl5UBtDRKJGDr8SamCy3HwbS9SwKIHpJebKyyBRrk=;
 b=mVrtOLH/gP3iRmlA7kVytZUwWj/lDsmqH212IJVfYJuXtyAHPrea9PsW
 ufES6Owy/zzzeQnVD/jtiWyRr2nbWFixOVzGxLlNVkxh6EIBaheaprgUA
 YdhONuqoflbaaBi5iDfs7gMGhFGo8LyULic2S7YXWzmA2401bHiXjsDe/
 UBvoJRqqcoUNdGNCopd95If4PXuSP+Anxz3dsc95ZH6hMCSIPT6iElNty
 2+vQjnvthv9o4wEY0tavLpz61++8HyrzitH0YUh85JGxgp+KWDA1siXPK
 b2Pmz4w1Kg9VysGAVsIbICyZpUJ36zFS9VLE4HNpq/uK4JzKx3FR59YrQ g==;
X-CSE-ConnectionGUID: /AUOKBTAQLeQtyci0hBGWQ==
X-CSE-MsgGUID: AHr1sk5hT1Oueh2dgXpUKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="82454438"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="82454438"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:48:53 -0700
X-CSE-ConnectionGUID: sVj1QyOCS8iioLUQQYFd9w==
X-CSE-MsgGUID: bqSdj/GWRIqIHPpyNCHWpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="189027894"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:48:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:48:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:48:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:48:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN0oibxSh0uxj8y+a8JGr6CZ2rTpgPT8dktSdUjw0hH8QIk28tsDPKfNULRSQZqh+bk8nf0Z+HSN2w2pJhGNRDSR8kR1ZA+lmhXDS9dto3rSnE8JMXhFPYPzpv3UisoBlQrz1VIRo78fT4+8xJxA3n6ROWTJ570Kpj797cjgMYmpCVtosRk6FhTCSX9T3ILxsZLdXQKo/8Io+3WAdFYINQusjzRU4CeqG2L6Iujd3ZpSCwAn0S58Ck/Pz1IDPqZ7eVqgl63sg13ZyuFIXum2HriuVCngsrpVxRFUPwQZrCB8aT5Dc0ZRyXiq739N4B6jtDd52e+ZB0LLj6rWvFwK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erPKU0a9hdD/UEKNBf3EqYGae2hYWvQt34tAomm5shg=;
 b=boI0i679H4/iN+j7ZRFWncf2pCPicvawUPwa0kMYvogCayF4IrfnV5SoOYTRW+A9hmq2cwy0du7IKp7E77H/k4wUqTBllJ2vBP/A0bMeg5ElBI8y1ZSLTJnwW0onUY0CbWr9fn8TtN+ztvn+qEWt2r6fHMupfvAZtM4KVLB9JBA1y8gL0JtjRVadq2PffA8SULKSDQXNW31bI72o2fqbompEymiNCE/x8jbcA0HT4a+ZOnvyrPMyR/VJCHLYARjecT7qpe/3OnkoMGFigwPmIcodDNFcagf4JJ7TNCMvD2/LQdQvswQ0zrcq12oMvk9Obm3MOlOK8by5TYVCtCEIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 14:48:50 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:48:50 +0000
Date: Fri, 8 Aug 2025 10:48:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: rename XE_WA to XE_GT_WA
Message-ID: <aJYOTuYXiWPD5KpA@intel.com>
References: <20250807214224.32728-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807214224.32728-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b50fba-4b2f-484a-30b3-08ddd68aaf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DiKcVaCbX2RHpPfwkB8xTjMdkv2TKHhwPnVmK9UNckN1HlEPyp7n7hDJzaID?=
 =?us-ascii?Q?PpkPJe3Qg+mnDB3T13FdDsQka9+ulTDQhPpasDZw+u1bOCtfRUHAcsHwvvyW?=
 =?us-ascii?Q?Mk5TpsbXnUjTYmSW40WFlUR2shmas7Eg/mflTW1V2KQVqhJ+1BNaobUpAkFw?=
 =?us-ascii?Q?AkzonOkI/+EMvwD1MIff4l59WYtu0bsPB9ZMvjuSOaknq2P6AI1snaiVnrfO?=
 =?us-ascii?Q?ujA9/P2giikBLWFvZpsN9zqsf0iAYtWvn+RfFeEorsYEBqxndt/JTZ3+dPAx?=
 =?us-ascii?Q?RRSWXXrJxcz03aehPbuoLCuvPFDssDMQ0tikiKwjQeBMxNzUOt/vP5mOJydY?=
 =?us-ascii?Q?jR4N/OIojEDbknheCdh8bl0Gpi2LORG3R7Sp7rRyQbl5zM2h6qn5bYp+qiWZ?=
 =?us-ascii?Q?Ju4W89U/2FogNmplWNZNJFAX2wI7ymJSWJEXUtjCBHzv5uIMGgccBZtBk5bE?=
 =?us-ascii?Q?e9ZAHOI2w91+vPbC4gz0argwfl9xWJpr56IHIOwjY1u3PfdZxLEOR725bgOz?=
 =?us-ascii?Q?KQZbq8On7suBnpn7IIAM1oeih0fPBF0yhdTsKytYLk4nBTHJcjtXJcij5/LG?=
 =?us-ascii?Q?bOzZOc7khA+UMSWKTi+v0As6kmqAOlvs+0d/N5QiKUXcxwdIqNPIKRSkIxqP?=
 =?us-ascii?Q?OYzy4YGuZ9EmrFPKcXPeJN7bK+FIzqXWqdL05h17JcYXRdKZIsSUT1JhDz7h?=
 =?us-ascii?Q?SMeOp0Hr1rPH9s7RFbGNk5gbv1AGPzBclDrlBa9nWRcVh0tSvcGVijkCcu1h?=
 =?us-ascii?Q?pWA04CPXf99D24QF9De7m0lCPxog4SqpAG/hllwDrrEwMWjTA8DBtX1rL/g0?=
 =?us-ascii?Q?VKz0OiK7fb50xM7btAMQI6vTjquHU+nroO4RG0qqk/mOwXJRJc7Vf6YaGs8V?=
 =?us-ascii?Q?7zv3IrVzXbzFEMvkIpJLxpm6eU3QxOWJXwOVcw4PfS3C768YMzQyQoJ1HJLB?=
 =?us-ascii?Q?mhAds85LZ+5FGF6XlrhMLCcGr9H/TQGVv1yquQT5fDMG+L1zybTDqmdPO2Ri?=
 =?us-ascii?Q?hJPp+q6f1Uc6Re7my83YAgjwKo08JHZpC1g0S5GeThU9jZlhW2llKYdmJB6q?=
 =?us-ascii?Q?a+WzAfJy++VwuwJTNVfqb1FtgacJDWv3+/ohbdpimvFLmZqWesItz56Otluq?=
 =?us-ascii?Q?NeC83FBGLr7XuH3QTEs24QnZTt/dK9r7IagcGB6sTeA3VkZeMAB4szoFAMxn?=
 =?us-ascii?Q?u50mXpm8py2kB6/jx/UkO/sJgF2Jzf4lvT/wWk1ZBj5+PwFIeR26ShgWxjnU?=
 =?us-ascii?Q?ZpuDeRrJ4cNLSFaDAXWdqW1S0smrgVbnY85XHN5FcjY1VPOV/cyic5Bt89aQ?=
 =?us-ascii?Q?Wpy5nHFB13vRaSLoQWETMm8jKxUeCpe2/isxOJP/FIJ/mYTOFVt2zanXOZiw?=
 =?us-ascii?Q?Rb6m0bjBFTfbXo6sVvtgpUTJ+X3Ul+UoWeVIjqMjs0RW4wn04g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gOUavHfLdiZYsgvpe7y+ArhKthqEKFiUQCX+px4ifiwOho+i5/BDuMG9/qPw?=
 =?us-ascii?Q?CHP+9vlz2Kbr6ghXLep8c2luARkjCk1b/hCxPbI6JnwwbAeQZ+m1XmNXCMY0?=
 =?us-ascii?Q?nzOF3Tnp13wixQ+Ba3+XQBDb69RkGit+AmLvmMo/ktyCC+muiPX4Uj1116lA?=
 =?us-ascii?Q?1lhNxhgTtlKy1V/51uBWz59CrviwDhhbqbhX08BgfFXfJJkWO6IAuqRwLrpz?=
 =?us-ascii?Q?TsHqfwQU1ZxPon4/y+JoaZa6FVxvkbQr5ancmZE82Lxk/O3Qv8JljSa4M1uR?=
 =?us-ascii?Q?K51/caPCwftbNlOu3gJ2OEKKC1SuioXsXvzUXPsOxjG7UvfkoRhvQjckXYjk?=
 =?us-ascii?Q?tpFa+zcmqBIpVYj+PFQ1P/Zl35cjOKYVlj7sEv5IffrFZlcjoQYnjLgwHWgz?=
 =?us-ascii?Q?71zrpuvBvzRw50kjGXbHklAg82hA1Dj278RGgbSp6Som1N4svFRqDOYOUFMu?=
 =?us-ascii?Q?QfTYL3dCwdFNAduBYEHYcQVOtFnKyVu7jX2sVI85fgf5L7zB/1iFMwfv7+5e?=
 =?us-ascii?Q?dUOuOUhG8LmrdTpU6pXOg8xFH9K2f6e89CT4hCZUCHOvD9kl7qgx653haJs4?=
 =?us-ascii?Q?roS2nQ9iiQXQbjSTdy7fMCcsgK3kVU0AgWIdzF8uGK+sN5zs7p4Yvu3u5jm1?=
 =?us-ascii?Q?C+gAaPbBcoLHm+CjpzPO4kkSuyoMwrvg0MybCZ8kZBE1kBya830rqiIEs9uh?=
 =?us-ascii?Q?CC8dSY/rMLUTBG3i5g3sUz2hInTrT7NX8nL24NzDiGAVPkWuZDs1KrmEnEDK?=
 =?us-ascii?Q?cKCKy+pN6QSi0n/lBDBmw873R/93lffJSDUSzoc8jwsZ73o+8gjRCvl4oiba?=
 =?us-ascii?Q?nnHrj1+C8omzaVAN/wMzFYXJl+m5+C064ex04RKoWvRxtKrYQiVkTCHZXqQr?=
 =?us-ascii?Q?kezxDQzSDKWHH7v/cWDau1/Zg52/ENCSprS48sJYy7GjqLIWTKcyLFmZ7Vly?=
 =?us-ascii?Q?iQsA042K38pmt2oBCeKiG7rX8xFd4ir5nqrislyP0wpikbrObKJ89g1S4zxT?=
 =?us-ascii?Q?XkcrCbo4kMcJ0KBAoFdWLrZ8Syzy7zFt3pq/L0zBAoIqVRg7Hvrn99rOqwiJ?=
 =?us-ascii?Q?aMdq9QzBb9aDJynVsaalNx8MT6jMCWmhoSj6iQANbJhWHe/r/vtoWDD4l5j4?=
 =?us-ascii?Q?U8USp/ect1rgXmbmUVTmnMLHeggAiC/OXwJNUcnMDtqP6DgsxnOrcEgpkuuR?=
 =?us-ascii?Q?qwFAqnVlu2LQ6nLjuwelHJ522gvW1C7SNxfCvZZh6kzidyGZs4cZ6n9F4hLl?=
 =?us-ascii?Q?KbUNF3sfbkTG1Kn61OrePGdOoMFsSGbEls9AKHEbouqZnGZmibX9P2uyN05d?=
 =?us-ascii?Q?yHoUcYxsYceJi1GE8Fj8jGL4b+U4xGnyZf9UsBikZQVaKqApxjZ0L1tC/AdE?=
 =?us-ascii?Q?BNT5eFx6gZgrs/eIj0tPnzqoDMdJEk58pjQ1adxfeiIBQSCQwtCFiVEKw4NV?=
 =?us-ascii?Q?WKB4IzkLNqR2kt4/8OID4ep88GtbbEvxsy/wBt5YWvpCYaculZCZaPiNHD5w?=
 =?us-ascii?Q?kKDc8sg4iekO8NPh4f+FSLuk5Zqsl66JwwzIeoYatKse+eOR+FCLToP5cV0r?=
 =?us-ascii?Q?eR4WhU+JDW979McZ3j9y4YNLbBaxK4RcHu3HuFLL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b50fba-4b2f-484a-30b3-08ddd68aaf99
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:48:49.9664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Go7fubqTJz2CYlqhgpZhxL7Y9s0HwPcZOjXWP40HPhBXu61ViN4t77mKiOiEpojmlt49RymXhLdbr34atDUPVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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

On Thu, Aug 07, 2025 at 02:42:23PM -0700, Matt Atwood wrote:
> Now that there are two types of wa tables and infrastructure, be more
> concise in the naming of GT wa macros.
> 
> v2: update the documentation
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  2 +-
>  drivers/gpu/drm/xe/display/xe_display_wa.c    |  2 +-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
>  drivers/gpu/drm/xe/xe_device.c                |  6 +++---
>  drivers/gpu/drm/xe/xe_eu_stall.c              |  4 ++--
>  drivers/gpu/drm/xe/xe_ggtt.c                  |  8 ++++----
>  drivers/gpu/drm/xe/xe_gsc.c                   |  6 +++---
>  drivers/gpu/drm/xe/xe_gt.c                    |  6 +++---
>  drivers/gpu/drm/xe/xe_gt_topology.c           |  2 +-
>  drivers/gpu/drm/xe/xe_gt_types.h              |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c                   | 14 ++++++-------
>  drivers/gpu/drm/xe/xe_guc_ads.c               | 20 +++++++++----------
>  drivers/gpu/drm/xe/xe_guc_pc.c                | 10 +++++-----
>  drivers/gpu/drm/xe/xe_hw_engine.c             |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c                   |  8 ++++----
>  drivers/gpu/drm/xe/xe_oa.c                    |  8 ++++----
>  drivers/gpu/drm/xe/xe_query.c                 |  4 ++--
>  drivers/gpu/drm/xe/xe_ring_ops.c              |  6 +++---
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_wa.h                    |  4 ++--
>  22 files changed, 61 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> index fba9617a75a5..d96ba2b51065 100644
> --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> @@ -41,7 +41,7 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
>  	size = PAGE_ALIGN(size);
>  	obj = ERR_PTR(-ENODEV);
>  
> -	if (!IS_DGFX(xe) && !XE_WA(xe_root_mmio_gt(xe), 22019338487_display)) {
> +	if (!IS_DGFX(xe) && !XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display)) {
>  		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
>  					   NULL, size,
>  					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
> diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
> index 68d1387d81a0..8ada1cbcb16c 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_wa.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
> @@ -14,5 +14,5 @@ bool intel_display_needs_wa_16023588340(struct intel_display *display)
>  {
>  	struct xe_device *xe = to_xe_device(display->drm);
>  
> -	return XE_WA(xe_root_mmio_gt(xe), 16023588340);
> +	return XE_GT_WA(xe_root_mmio_gt(xe), 16023588340);
>  }
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 3eab9a569661..826ac3d578b7 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -123,7 +123,7 @@ initial_plane_bo(struct xe_device *xe,
>  		phys_base = base;
>  		flags |= XE_BO_FLAG_STOLEN;
>  
> -		if (XE_WA(xe_root_mmio_gt(xe), 22019338487_display))
> +		if (XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display))
>  			return NULL;
>  
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f..3e0402dff423 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -883,7 +883,7 @@ int xe_device_probe(struct xe_device *xe)
>  	}
>  
>  	if (xe->tiles->media_gt &&
> -	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
> +	    XE_GT_WA(xe->tiles->media_gt, 15015404425_disable))
>  		XE_DEVICE_WA_DISABLE(xe, 15015404425);
>  
>  	err = xe_devcoredump_init(xe);
> @@ -1043,7 +1043,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>  
>  	gt = xe_root_mmio_gt(xe);
>  
> -	if (!XE_WA(gt, 16023588340))
> +	if (!XE_GT_WA(gt, 16023588340))
>  		return;
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> @@ -1087,7 +1087,7 @@ void xe_device_td_flush(struct xe_device *xe)
>  		return;
>  
>  	root_gt = xe_root_mmio_gt(xe);
> -	if (XE_WA(root_gt, 16023588340)) {
> +	if (XE_GT_WA(root_gt, 16023588340)) {
>  		/* A transient flush is not sufficient: flush the L2 */
>  		xe_device_l2_flush(xe);
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index af7916315ac6..fdd514fec5ef 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -649,7 +649,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  		return -ETIMEDOUT;
>  	}
>  
> -	if (XE_WA(gt, 22016596838))
> +	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
>  
> @@ -805,7 +805,7 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  
>  	cancel_delayed_work_sync(&stream->buf_poll_work);
>  
> -	if (XE_WA(gt, 22016596838))
> +	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 249713139f69..e03222f5ac5a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -106,10 +106,10 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>  {
>  	struct xe_tile *tile = ggtt->tile;
> -	struct xe_gt *affected_gt = XE_WA(tile->primary_gt, 22019338487) ?
> +	struct xe_gt *affected_gt = XE_GT_WA(tile->primary_gt, 22019338487) ?
>  		tile->primary_gt : tile->media_gt;
>  	struct xe_mmio *mmio = &affected_gt->mmio;
> -	u32 max_gtt_writes = XE_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
> +	u32 max_gtt_writes = XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
>  	/*
>  	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
>  	 * to wait for completion of prior GTT writes before letting this through.
> @@ -284,8 +284,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  
>  	if (GRAPHICS_VERx100(xe) >= 1270)
>  		ggtt->pt_ops = (ggtt->tile->media_gt &&
> -			       XE_WA(ggtt->tile->media_gt, 22019338487)) ||
> -			       XE_WA(ggtt->tile->primary_gt, 22019338487) ?
> +			       XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
> +			       XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ?
>  			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 1d84bf2f2cef..f5ae28af60d4 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -266,7 +266,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  	unsigned int fw_ref;
>  	int ret;
>  
> -	if (XE_WA(tile->primary_gt, 14018094691)) {
> +	if (XE_GT_WA(tile->primary_gt, 14018094691)) {
>  		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
>  
>  		/*
> @@ -281,7 +281,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  
>  	ret = gsc_upload(gsc);
>  
> -	if (XE_WA(tile->primary_gt, 14018094691))
> +	if (XE_GT_WA(tile->primary_gt, 14018094691))
>  		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
>  
>  	if (ret)
> @@ -593,7 +593,7 @@ void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
>  	u32 gs1_clr = prep ? 0 : HECI_H_GS1_ER_PREP;
>  
>  	/* WA only applies if the GSC is loaded */
> -	if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
> +	if (!XE_GT_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
>  		return;
>  
>  	xe_mmio_rmw32(&gt->mmio, HECI_H_GS1(MTL_GSC_HECI2_BASE), gs1_clr, gs1_set);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 390394bbaadc..43f2da27d9d9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -106,7 +106,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>  	unsigned int fw_ref;
>  	u32 reg;
>  
> -	if (!XE_WA(gt, 16023588340))
> +	if (!XE_GT_WA(gt, 16023588340))
>  		return;
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> @@ -128,7 +128,7 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>  	unsigned int fw_ref;
>  	u32 reg;
>  
> -	if (!XE_WA(gt, 16023588340))
> +	if (!XE_GT_WA(gt, 16023588340))
>  		return;
>  
>  	if (xe_gt_is_media_type(gt))
> @@ -966,7 +966,7 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>  	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
>  	     xe_uc_fw_is_loaded(&gt->uc.gsc.fw) ||
>  	     xe_uc_fw_is_in_error_state(&gt->uc.gsc.fw)) &&
> -	    XE_WA(gt, 22019338487))
> +	    XE_GT_WA(gt, 22019338487))
>  		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 8c63e3263643..a0baa560dd71 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -138,7 +138,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  	 * but there's no tracking number assigned yet so we use a custom
>  	 * OOB workaround descriptor.
>  	 */
> -	if (XE_WA(gt, no_media_l3))
> +	if (XE_GT_WA(gt, no_media_l3))
>  		return;
>  
>  	if (GRAPHICS_VER(xe) >= 30) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index dfd4a16da5f0..ef0f2eecfa29 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -413,7 +413,7 @@ struct xe_gt {
>  		unsigned long *oob;
>  		/**
>  		 * @wa_active.oob_initialized: mark oob as initialized to help
> -		 * detecting misuse of XE_WA() - it can only be called on
> +		 * detecting misuse of XE_GT_WA() - it can only be called on
>  		 * initialization after OOB WAs have being processed
>  		 */
>  		bool oob_initialized;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 9e34401e4489..433abc787f7b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -157,7 +157,7 @@ static bool needs_wa_dual_queue(struct xe_gt *gt)
>  	 * on RCS and CCSes with different address spaces, which on DG2 is
>  	 * required as a WA for an HW bug.
>  	 */
> -	if (XE_WA(gt, 22011391025))
> +	if (XE_GT_WA(gt, 22011391025))
>  		return true;
>  
>  	/*
> @@ -184,10 +184,10 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 flags = 0;
>  
> -	if (XE_WA(gt, 22012773006))
> +	if (XE_GT_WA(gt, 22012773006))
>  		flags |= GUC_WA_POLLCS;
>  
> -	if (XE_WA(gt, 14014475959))
> +	if (XE_GT_WA(gt, 14014475959))
>  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>  
>  	if (needs_wa_dual_queue(gt))
> @@ -201,17 +201,17 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (GRAPHICS_VERx100(xe) < 1270)
>  		flags |= GUC_WA_PRE_PARSER;
>  
> -	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
> +	if (XE_GT_WA(gt, 22012727170) || XE_GT_WA(gt, 22012727685))
>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>  
> -	if (XE_WA(gt, 18020744125) &&
> +	if (XE_GT_WA(gt, 18020744125) &&
>  	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
> -	if (XE_WA(gt, 1509372804))
> +	if (XE_GT_WA(gt, 1509372804))
>  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>  
> -	if (XE_WA(gt, 14018913170))
> +	if (XE_GT_WA(gt, 14018913170))
>  		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>  
>  	return flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 2ceaa197cb2f..d7da67637079 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -247,7 +247,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>  
>  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>  
> -	if (XE_WA(gt, 1607983814))
> +	if (XE_GT_WA(gt, 1607983814))
>  		count += LNCFCMOCS_REG_COUNT;
>  
>  	return count * sizeof(struct guc_mmio_reg);
> @@ -317,17 +317,17 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  	offset = guc_ads_waklv_offset(ads);
>  	remain = guc_ads_waklv_size(ads);
>  
> -	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
> +	if (XE_GT_WA(gt, 14019882105) || XE_GT_WA(gt, 16021333562))
>  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>  				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
> -	if (XE_WA(gt, 18024947630))
> +	if (XE_GT_WA(gt, 18024947630))
>  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>  				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING);
> -	if (XE_WA(gt, 16022287689))
> +	if (XE_GT_WA(gt, 16022287689))
>  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>  				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE);
>  
> -	if (XE_WA(gt, 14022866841))
> +	if (XE_GT_WA(gt, 14022866841))
>  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>  				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO);
>  
> @@ -336,21 +336,21 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  	 * the default value for this register is determined to be 0xC40. This could change in the
>  	 * future, so GuC depends on KMD to send it the correct value.
>  	 */
> -	if (XE_WA(gt, 13011645652)) {
> +	if (XE_GT_WA(gt, 13011645652)) {
>  		u32 data = 0xC40;
>  
>  		guc_waklv_enable(ads, &data, sizeof(data) / sizeof(u32), &offset, &remain,
>  				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
>  	}
>  
> -	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
> +	if (XE_GT_WA(gt, 14022293748) || XE_GT_WA(gt, 22019794406))
>  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>  				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
>  
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_GT_WA(gt, 16026508708))
>  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>  				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364)) {
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_GT_WA(gt, 16026007364)) {
>  		u32 data[] = {
>  			0x0,
>  			0xF,
> @@ -761,7 +761,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		guc_mmio_regset_write_one(ads, regset_map, e->reg, count++);
>  	}
>  
> -	if (XE_WA(hwe->gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER) {
> +	if (XE_GT_WA(hwe->gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER) {
>  		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>  			guc_mmio_regset_write_one(ads, regset_map,
>  						  XELP_LNCFCMOCS(i), count++);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 68b192fe3b32..0f8430acd16d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -722,7 +722,7 @@ static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
>   */
>  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>  {
> -	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> +	if (XE_GT_WA(pc_to_gt(pc), 22019338487)) {
>  		if (wait_for_flush_complete(pc) != 0)
>  			return -EAGAIN;
>  	}
> @@ -835,7 +835,7 @@ static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  
> -	if (XE_WA(gt, 22019338487)) {
> +	if (XE_GT_WA(gt, 22019338487)) {
>  		if (xe_gt_is_media_type(gt))
>  			return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
>  		else
> @@ -899,7 +899,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>  	if (pc_get_min_freq(pc) > pc->rp0_freq)
>  		ret = pc_set_min_freq(pc, pc->rp0_freq);
>  
> -	if (XE_WA(tile->primary_gt, 14022085890))
> +	if (XE_GT_WA(tile->primary_gt, 14022085890))
>  		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
>  
>  out:
> @@ -931,7 +931,7 @@ static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  
> -	return  XE_WA(gt, 22019338487) &&
> +	return  XE_GT_WA(gt, 22019338487) &&
>  		pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP;
>  }
>  
> @@ -1017,7 +1017,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  {
>  	int ret;
>  
> -	if (!XE_WA(pc_to_gt(pc), 22019338487))
> +	if (!XE_GT_WA(pc_to_gt(pc), 22019338487))
>  		return 0;
>  
>  	guard(mutex)(&pc->freq_lock);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 796ba8c34a16..1cf623b4a5bc 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -576,7 +576,7 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	u32 maxcnt_units_ns = 640;
>  	bool inhibit_switch = 0;
>  
> -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_WA(gt, 16023105232)) {
> +	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
>  		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>  		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8760c4c2ca38..8f6c3ba47882 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -75,7 +75,7 @@ lrc_to_xe(struct xe_lrc *lrc)
>  static bool
>  gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>  {
> -	if (XE_WA(gt, 16010904313) &&
> +	if (XE_GT_WA(gt, 16010904313) &&
>  	    (class == XE_ENGINE_CLASS_RENDER ||
>  	     class == XE_ENGINE_CLASS_COMPUTE))
>  		return true;
> @@ -1071,7 +1071,7 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	const u32 ts_addr = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>  	u32 *cmd = batch;
>  
> -	if (!XE_WA(lrc->gt, 16010904313) ||
> +	if (!XE_GT_WA(lrc->gt, 16010904313) ||
>  	    !(hwe->class == XE_ENGINE_CLASS_RENDER ||
>  	      hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>  	      hwe->class == XE_ENGINE_CLASS_COPY ||
> @@ -1108,7 +1108,7 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  {
>  	u32 *cmd = batch;
>  
> -	if (!XE_WA(lrc->gt, 18022495364) ||
> +	if (!XE_GT_WA(lrc->gt, 18022495364) ||
>  	    hwe->class != XE_ENGINE_CLASS_RENDER)
>  		return 0;
>  
> @@ -2093,7 +2093,7 @@ u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs)
>  	 * continue to emit all of the SVG state since it's best not to leak
>  	 * any of the state between contexts, even if that leakage is harmless.
>  	 */
> -	if (XE_WA(gt, 14019789679) && q->hwe->class == XE_ENGINE_CLASS_RENDER) {
> +	if (XE_GT_WA(gt, 14019789679) && q->hwe->class == XE_ENGINE_CLASS_RENDER) {
>  		state_table = xe_hpg_svg_state;
>  		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 5729e7d3e335..a188bad172ad 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -822,7 +822,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>  	u32 sqcnt1;
>  
>  	/* Enable thread stall DOP gating and EU DOP gating. */
> -	if (XE_WA(stream->gt, 1508761755)) {
> +	if (XE_GT_WA(stream->gt, 1508761755)) {
>  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
>  					  _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
>  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
> @@ -1079,7 +1079,7 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
>  	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
>  	 * Disable thread stall DOP gating and EU DOP gating.
>  	 */
> -	if (XE_WA(stream->gt, 1508761755)) {
> +	if (XE_GT_WA(stream->gt, 1508761755)) {
>  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
>  					  _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
>  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
> @@ -1754,7 +1754,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	 * GuC reset of engines causes OA to lose configuration
>  	 * state. Prevent this by overriding GUCRC mode.
>  	 */
> -	if (XE_WA(stream->gt, 1509372804)) {
> +	if (XE_GT_WA(stream->gt, 1509372804)) {
>  		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
>  						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>  		if (ret)
> @@ -1886,7 +1886,7 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
>  {
>  	u32 reg, shift;
>  
> -	if (XE_WA(gt, 18013179988) || XE_WA(gt, 14015568240)) {
> +	if (XE_GT_WA(gt, 18013179988) || XE_GT_WA(gt, 14015568240)) {
>  		xe_pm_runtime_get(gt_to_xe(gt));
>  		reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>  		xe_pm_runtime_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 44d44bbc71dc..4dbe5732cb7f 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -477,7 +477,7 @@ static size_t calc_topo_query_size(struct xe_device *xe)
>  			sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss);
>  
>  		/* L3bank mask may not be available for some GTs */
> -		if (!XE_WA(gt, no_media_l3))
> +		if (!XE_GT_WA(gt, no_media_l3))
>  			query_size += sizeof(struct drm_xe_query_topology_mask) +
>  				sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask);
>  	}
> @@ -540,7 +540,7 @@ static int query_gt_topology(struct xe_device *xe,
>  		 * mask, then it's better to omit L3 from the query rather than
>  		 * reporting bogus or zeroed information to userspace.
>  		 */
> -		if (!XE_WA(gt, no_media_l3)) {
> +		if (!XE_GT_WA(gt, no_media_l3)) {
>  			topo.type = DRM_XE_TOPO_L3_BANK;
>  			err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
>  					sizeof(gt->fuse_topo.l3_bank_mask));
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index e8f22ec5f9af..5f15360d14bf 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -179,7 +179,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>  	u32 flags;
>  
> -	if (XE_WA(gt, 14016712196))
> +	if (XE_GT_WA(gt, 14016712196))
>  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>  
> @@ -190,7 +190,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  		 PIPE_CONTROL_DC_FLUSH_ENABLE |
>  		 PIPE_CONTROL_FLUSH_ENABLE);
>  
> -	if (XE_WA(gt, 1409600907))
> +	if (XE_GT_WA(gt, 1409600907))
>  		flags |= PIPE_CONTROL_DEPTH_STALL;
>  
>  	if (lacks_render)
> @@ -206,7 +206,7 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
>  	if (hwe->class != XE_ENGINE_CLASS_RENDER)
>  		return i;
>  
> -	if (XE_WA(hwe->gt, 16020292621))
> +	if (XE_GT_WA(hwe->gt, 16020292621))
>  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
>  				      RING_NOPID(hwe->mmio_base).addr, 0);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 9a9733447230..dc588255674d 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -166,7 +166,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>  
>  	stolen_size -= wopcm_size;
>  
> -	if (media_gt && XE_WA(media_gt, 14019821291)) {
> +	if (media_gt && XE_GT_WA(media_gt, 14019821291)) {
>  		u64 gscpsmi_base = xe_mmio_read64_2x32(&media_gt->mmio, GSCPSMI_BASE)
>  			& ~GENMASK_ULL(5, 0);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..148a2425006f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2068,7 +2068,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->extensions))
>  		return -EINVAL;
>  
> -	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> +	if (XE_GT_WA(xe_root_mmio_gt(xe), 14016763929))
>  		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
>  
>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 535067e7fb0c..0fc73af1bb4c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -1090,6 +1090,6 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>  	if (IS_SRIOV_VF(tile->xe))
>  		return;
>  
> -	if (XE_WA(tile->primary_gt, 22010954014))
> +	if (XE_GT_WA(tile->primary_gt, 22010954014))
>  		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index f3880c65cb8d..105497c1d7d7 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -25,11 +25,11 @@ void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
>  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
> - * XE_WA - Out-of-band workarounds, to be queried and called as needed.
> + * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as needed.
>   * @gt__: gt instance
>   * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>   */
> -#define XE_WA(gt__, id__) ({						\
> +#define XE_GT_WA(gt__, id__) ({						\
>  	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
>  	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
>  })
> -- 
> 2.49.0
> 
