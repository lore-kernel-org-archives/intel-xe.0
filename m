Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA1EC636F0
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 19:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B939410E5BE;
	Wed, 28 Aug 2024 19:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQcn9Rza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2C810E5BE
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 19:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724873650; x=1756409650;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NDbsB6TWHF5UXzXmR56yF1XJWq93KHwMRsywg5mdz0Q=;
 b=NQcn9Rzaw2ntjySA8NvbrSJ3mx0THMvFt4h0fxu3IahFT0uidnqKYi/X
 UC93g2mexIik+HOoYDE6m8BAbmymmDAgjWFaw0uH8+0nDODRBDe9TEyPP
 b9qJSlwh0uWZsCNzgbGwLIQ5nPY3+8gkTmSt2xwOFtOQP/ucbbdBwvlRe
 YWJLHH9JVtvSKN+IpphCHngwu4fxItZxE5cYM+ki8NeDxQkwEOUbq9p/9
 4DNIcdNvPAjuQU0YNPFqL63cGfjyhVDNvWd0nbFO+0p2dlQv5eUzGA1Nz
 L2QfyPUGNrsAbJTYSiJixXbSTJLqKAYNVJMfi+3kCgAdRc1FNp6jcgs6t w==;
X-CSE-ConnectionGUID: mWGoQY2zSYSVbira9AiYeQ==
X-CSE-MsgGUID: 3i00lI07QfarpV0TqaJKcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34047903"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="34047903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:34:09 -0700
X-CSE-ConnectionGUID: sD5ZPwgtTHm20KG3YlU/hw==
X-CSE-MsgGUID: PtaHASsQSamvsk3XhcUHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="86526696"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 12:34:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:34:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 12:34:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 12:34:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWgy0hZ/v1EdU0o0yRxL+9DF8ZRK/beEnbyIEiBqsMnjov/wxjZ3R/logyRBCyoW6cCJefxYJ9J1qZkHUTHgo6THMYUq8YT/OZ+fjh0ls7wIJPFdgFF6nv19JI3OTKsrcxv2UyHDZsom+IyFqpi2OXo9hiVbZxr4OWA9j5uarceBrdWE7uwmNLMjokkkmE6FaxWHSjAU04lT+938NVBX6izidmTqjJ2Z7FyeMa4hI4q6RRjBT//i+jHMy/loGEn0utdh8JpHoSxWDTvEkHUZgxiqs2XQQWAIuvu4uQIsH4+RmebZkc/Lqod4yMpVK9/skFm+80gmHQHEGsHqChxeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6Q+oxFDn+DBpxAIq7aY7/ee8TMd3STOV1B0x+ofafg=;
 b=I8Q/a2ucI4vpjjlK1YAImx4FEn/eaoBA4Bf3tC4bRRNQjhwTl0ClboxL/8uTYd2jKrYGFZKD21D94iTs5DmZsrnXtsX/p7UuTIHINqFoS98nLgjvWRsi7QoDI/Kk/Lm/vz3QMrgCH2M+oRg6AoVD/yF1ChTozJnHHU0PVBA9FkcV+W5y5owAE/o7MQaTy3yibv8rqFPsKnQeTU5C1DrpeMsGYwXc69dTywlv686a4sUPrZM0OYk/N1KX5lr9214oSrKNINfG5vn3PX60BHqQJk2fmasficdIQDNjJvrWklSe3DeaMfPOdlY/ImE1T6u2tiwx54mVRp65Br14HjbvzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 19:34:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 19:34:02 +0000
Date: Wed, 28 Aug 2024 14:33:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240827164107.47034-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:303:dc::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e453e0-0fc0-43bb-60d5-08dcc7985ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tY9k2p2ybv6lHfiy+5gEb5oCP5A+MBVI/mZADW4dLIDH9HjUBRV2qWSlC36a?=
 =?us-ascii?Q?ArKNnk689dzAEq8Lx3B2RaSNFjycAoi90HQktIvArDmB4cofClHrzoEH6l0J?=
 =?us-ascii?Q?DTX9ppFTpZxDAcKSsP6j4YPoyclMU01MDvLJd7EwI8TtuLshrreA9grPPBuW?=
 =?us-ascii?Q?WdCA3wDXzt+pvIZqgUOtsI5+64+AxVFh6H2ndh8C0N+X2WS/SzDPGy+D/klB?=
 =?us-ascii?Q?4KhRNmEvRQjfpWU5l6KeQ80n4kEemhiaJWd/P7aKHK3z2qPQ/UpzTBubmVrR?=
 =?us-ascii?Q?DIRsWQBiBDuLNIdGivDSdLe60vjDiR0LjkJA5RA9I9jrcp78nP693t4fe5/6?=
 =?us-ascii?Q?ypFs9PsR+lyUWc1LHSQGU8gGiuClDtYvisOUE9jNt8jye5aHijr2cWUGrpEJ?=
 =?us-ascii?Q?F3ZBA/4RqLPGCQvMGllercxP6ForTo1TaypgPPxAzwHYnyHRSk3Keh88azl7?=
 =?us-ascii?Q?Ns1XQDUloXHH0ykJ6Ks3vJrTjvHgyyQLcV4c2281EWtcwsvonUoGKmnV6A23?=
 =?us-ascii?Q?HrNvVowmb4Kn+U0mF9BeJVBvuwxutE6CbzIn2+pYGt1sW0pFCxNIUaeLFAp/?=
 =?us-ascii?Q?4lYqBo/4IslueYuP0cKi9oC3Kx26q0d9kG1hFDXjilelVFmjnwmeaa97l52m?=
 =?us-ascii?Q?Yx+E5uS+zwI3yfUezkv89ApcSv9KsX8nTJQDkrwxVqYsu/1ApHd8LAmmm4NF?=
 =?us-ascii?Q?vS2bq0uYGH6JfP7yeUbDIaw/9RFWETjsBOKF2sWD1L7znkpzqJCMFiiLW/ua?=
 =?us-ascii?Q?NlWojn87x80RKLhfs4GTyyG8z1/nP7ww/3MGveRWdVD+TP6OXyCRnKcK4UxR?=
 =?us-ascii?Q?eLbKOSSGQhAYoKo5/nk5iIccAuTKokFSJENHQsIW2Dz9NNGTTCw9sgh1gdsg?=
 =?us-ascii?Q?sOfS/Z4bWXY3U1GFusUcTjZYNhDXo9pOfwTtkRWnTvG/TEz63JxemR3lWpT+?=
 =?us-ascii?Q?AKKwj+NmOIiQudaNeQIDnjPu5DU58ImekY5Mv0KT3zcYTCQv6vYsJtFCB0Rj?=
 =?us-ascii?Q?/m6fRa6aJTvlvmiidaIkMVXJxZXBXCZdXVL9HZ911T8u2FRDs0s60PIbXpF8?=
 =?us-ascii?Q?092evOJPg7GBaOtKU5p1HPCKplE/FtAti+cMMmVwJvgXv8zwBsyBP0r5soMC?=
 =?us-ascii?Q?jXOn9Pr37F9rIKor5VRsogGOvoUpSTQuNujzlhK3K9qHmcVO/rj5FiezHsXC?=
 =?us-ascii?Q?/9Rqt9EywJsEfFN3G/6AmNAhAnAAswxR9j8TlD8zjSFliC+F6kt0JTyJr9F5?=
 =?us-ascii?Q?qAPIiaNUa0YV8l4Ssydg30oe1dOt1bFozm9BYFvQxlyFU1epwkAfOmrQSPn2?=
 =?us-ascii?Q?laMzLOzH7Lpra7FhT36nXyXAJLclz/448LCRTJUXCaV2Kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IJ/UctPD9MnmuzAuLUQ3r1ipn6c5i34uAD0J19Axxgks6TbCaH43ZyFRmAZL?=
 =?us-ascii?Q?zBS5SMGsru5qlJKKk+EA6osj8XMkrv9GQORg4gP5TvcjkLXOa+Wo7j/8IsJL?=
 =?us-ascii?Q?3a1+4A4qPtBkmOBye8dcH0buxEHJ45RYGzk4aUOqBTDQQXeq74GkE3qxgb56?=
 =?us-ascii?Q?ReDM4sHVtWIV4zKAgSnj/hQZX9lHnjyg09GromIxgnLqaHo3Wd1TUAagLXEA?=
 =?us-ascii?Q?BG+H9epaG9h3/YT0reeZ1Xz9e/UMIJYqxHNoHUkQBaKujSCfDxJgIMYGQKBK?=
 =?us-ascii?Q?Or5L1+b3EgPGw3p8HEICLn1ViI1sddAx/IJYymCNAvt8zHfYn9wm006Rl3Td?=
 =?us-ascii?Q?HZlFUWuPR5bQCwBJ7PuuBFTTZ9ZyN499kK+u4P5GDou3G72mh529xMHAPvgO?=
 =?us-ascii?Q?6ZV6rHPHSugIHbbT3GrkRfNAW/36PNEqE8BYnSRP68AgERN58ZV9ZTP17HJe?=
 =?us-ascii?Q?svioidVGkNYKGmxpjngTzahjOsCWXUZyKk/IsM9MFOWb3qeVjBkeA5pJJZPb?=
 =?us-ascii?Q?lP+NkJlP5I35063Pw+nAdnvaPXXVj5OMqEGlaSivgJqMkxQneds7a92ggdtk?=
 =?us-ascii?Q?87rKAP/UhLnS0mQbpdf0pnaNgm1mkOXr4Ny2QOKoEz1FuxWsPeuK7Laa9c8T?=
 =?us-ascii?Q?Uq2Z0YjeJZNp7+8uOFYr3Xd8esHYNNXg5OrtH2msiL1cBn+lQmrdK+frS9e2?=
 =?us-ascii?Q?mx7I0eDtMLFWZlwieoqyeJxyno6u3t1+CwyxKuXvcU2n8729+oNH8rWDVXYt?=
 =?us-ascii?Q?qzKik1oohfJHLorc32fk4qJjuYRk2h30dcXmJhUgeDl+DM5UGalbBBDmhcy3?=
 =?us-ascii?Q?dzyi+VZ582HbfQ0UqxL9QA4S/WahDcGEiWP734Gx1/e7LpkGAa78J2Ct1Fg+?=
 =?us-ascii?Q?UfYOygn6KYIHdOTf5mobzKVw7rKNqv1pdCGj8lhRd6OfDr4RTJYo/u07+tRz?=
 =?us-ascii?Q?ZyAyWRKPEJ8GNEMtq/exVZmV2i1aRl855uxHv+22WjyzevDM75PHOyTqACTE?=
 =?us-ascii?Q?6iujVxMtFwMzkfjB9hqScI9MaSBR7/UJzIorVJl37l1eamL1Zij/YrSpMhdo?=
 =?us-ascii?Q?jmzjExT5Tn/sSvmZ5DnOVxf7RiKhoLV1dsrC0cJD2vpkguzjExzoT8cwI+no?=
 =?us-ascii?Q?K0aNqKTcqqIf9pWHos+AUjA9pF30trYzj6c29qp67r1Q1nRvzwMYRzDVpDMi?=
 =?us-ascii?Q?Id/m3Z9wR6MttfEizYzcfvcHFXl8d14VnRJySs0J5NXFy2cNmjKStqXhiQGZ?=
 =?us-ascii?Q?oEeANQHsl+NCVP/zCZxhkSPKNmFlx6PpxwZiGg1oALI2MxGCkP3fy3zm8Gw7?=
 =?us-ascii?Q?IUc4hTO+Ufal2zJnju5W8O6PAgQ930w/6zvnf7bjRP7dUA4ggiuFMvN9Fn3U?=
 =?us-ascii?Q?Xe6x0AnbneLUXvo97v5i9B4ZGaNin0rcxT/kTYSVrYegPWfCSUgqh9nxfl5B?=
 =?us-ascii?Q?DtGz8X5SuUYatTFyPit1TWCiFAtN7t4Lk8hJZ+rIkjFzuF0we0/BADbbdAvj?=
 =?us-ascii?Q?F88qqt7vBIDcxjBTd+al6+qQQ0tiagLllPDh3QjR4qxV5fOkf6b1+S77ejMQ?=
 =?us-ascii?Q?of36svwbbzzsQvBs71puak8Ky/bpaIIMIXKDy86L8Aul34iS9S2WEREeB+oW?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e453e0-0fc0-43bb-60d5-08dcc7985ec0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:34:02.0492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SS/QFf3L0hoxf6KSnR9WQ7AI9DgTgGoYxbZHUrvrqbQ2lU5/dh1HlODGV8witI6qSxgvls6cigX2xih30jdoQDk3dD+vzL3BgVabBF1eb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
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

On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b6fbe4988f2e..de6f39db618c 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
> 	__u64 reserved[2];
> };
>
>+/**
>+ * DOC: XE PMU event config IDs
>+ *
>+ * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
>+ * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>+ * particular event.
>+ *
>+ * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>+ *
>+ * .. code-block:: C
>+ *
>+ *	struct perf_event_attr attr;
>+ *	long long count;
>+ *	int cpu = 0;
>+ *	int fd;
>+ *
>+ *	memset(&attr, 0, sizeof(struct perf_event_attr));
>+ *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>+ *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>+ *	attr.use_clockid = 1;
>+ *	attr.clockid = CLOCK_MONOTONIC;
>+ *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>+ *
>+ *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>+ */
>+
>+/*
>+ * Top bits of every counter are GT id.
>+ */
>+#define __XE_PMU_GT_SHIFT (56)
>+
>+#define ___XE_PMU_OTHER(gt, x) \
>+	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>+

The perf uapi is self-describing and users should look up on sysfs what
to use. Example for i915 since it's what I'm currently working on:

	$ cat /sys/bus/event_source/devices/i915/events/actual-frequency
	config=0x100000
	$ cat  /sys/bus/event_source/devices/i915/events/actual-frequency.unit
	M

`perf list` works fine and doesn't know anything about this xe-only
header. Why would we add anything here rather than encourage other users
to read from the generic interface?

Lucas De Marchi
