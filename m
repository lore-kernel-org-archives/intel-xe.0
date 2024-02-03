Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DABC4828F
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 05:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECAD10EF7A;
	Sat,  3 Feb 2024 05:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmGTiMa4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F91810EF7A
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Feb 2024 05:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706938631; x=1738474631;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kZAWlk8dKoGzzoXCpcVV5XDiP6kHItYQ94La8y1B5Zk=;
 b=SmGTiMa4XKJmx9VGb8WexffXcB/Rk3DvHN6GS2PUauBbwnjzG2f8eAl/
 OvmCNuyzcl0Xp09LYPT8TaWy7qbdTgRHAbAIDF3y4NKTYi8WyYExu5OzY
 VAn2CUXATHYi5nEVimj8xQYiTcdPeIaPdCKbbAIszRa65cISNBm7DU63M
 gP0nNS/Jez4xml2v2NEL2UzfKuk/K67/RwADvUX9vQrRBHHEHMeQcBxqL
 St6U5T6kJbrkUTPhqd7musnK4xEB6gSHvFIXPUcw0cqEQLyXZvtAhj9BV
 67ELsGUvegF6wAGeIPNDrkEGkuSW8Az5atSRJm916ke0gjyrKKTACvxZg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17707320"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="17707320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 21:37:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="573912"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 21:37:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 21:37:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 21:37:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 21:37:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 21:37:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hd+MmMwiIxuwT2pDxNAUXlbiBn6SzQn1kKO9gYnVu/zbP3GKbuP78CwULOz/shuTWXlu+6BAE0ycQdZq+f066V4Pbj1IKOHDyykqvHcoi7pUjkPY0YUe2n/EN8fqpm8g1YhoaJCuJ/jrO3lmWp0rFAWFlVg+leW857ZRiRtpHQDS7kt7v46cVswWaCV6VzeKKSiOWAmMC7EgsAx2ifL9a0yxnffIkhPQgXIqGO+GPNaQZrRbju7Jcr/RWocaAwcMFm2qGVtnZoEgI5bviQ8S0dGiiJRenQ/jns4/tqFe5EGMSo2FE6fUMI+qE6isoD2vadC8kTGv+B63jOUTVbnbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6IRaKfIh/txggJClecKEOgkQyV0TrHtZKVQrWUkyA4=;
 b=Gc84z5WeT/qlJfdawrDLh1a5M1JZJPUgcSedkstQwDqphsphrfSEctgIQuYoIUaeERzpEDJkAvdPF6NRZysRYx7waqit1JGN6QwWUlnMfqu8Nar3XsjmZbyk4AdZLFnkbzzKVLZC3xgv8DJoq4wMVtuc5Evy3IybZUd/ORIhFRJVgr/NVIRhExufcFk6D/Pbmm5MykXqkdQTQYCbSmurKDcMVfoeQlPEkhDPNLQCjgKGbFS62tRfjlqwPhuqOqARMZtBHt9ZJfDWP+7LOPTtu/ALGS1MrK2Xg1RQ/3VzywGJ1MIfFR8bMQYTcwbmBVwDRTDQAxiP11zG9LoJ2FkzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Sat, 3 Feb
 2024 05:37:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Sat, 3 Feb 2024
 05:37:00 +0000
Date: Fri, 2 Feb 2024 23:36:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Drop redundant newline in name
Message-ID: <d4gva7kobelqwu42jwkh2xcmxuk33t6m3isusugjcwdrhawco4@gmoeozpspw6x>
References: <20240202225623.3225443-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240202225623.3225443-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a10680-5142-4b1c-c21f-08dc247a24ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFDonE+HAQ1TwXhzHFPHDiy6VpC41zxPlSY/wDmC/FfyoZA4gXrZeOp6QCeMVusrC6p3Sqf1E3T2sFJsNcDiwkdv1JA0OILdOjkEDnBi8P8PDnEhy3qswb7/cd6Bclv+9xHcehqlUX50iWa0q0QbSMLDyeWcWCWQhAFrvc+katS58IqOwizKoTq+uOOYH0CjNaVt9uzN6wMqqAhHHlFQqdldtMZeudt9qOGvuthhF5C3rOOHfgdpaBlfWQBx3CSTwi1Kcniw9r6SIF3885yQ3dydeQyYO2ZnnLHpzxehKIVtjCZ8IKCRu8JaA7vLVTD+vwqt/M4U7vYPdICJxEt17WPTdBLREI8lF3y3IlQ6M+4EckLs96whejAYJ2zBe9yNqsQogUK3K2tbqmJB3/gNE7DhMIG6/xyxYgqJpgvVSKrwt15GmyIHYu/ML6HcPOZAIRGFDHRW22ClqzEC6byrTrtZ2DfZC90huGob+lwo7zsITEc5o8W/YLNaM+UUfucM3RND6ZENDZb3m9OCGf2Rv10w8rLMe1PHkruiEM9DpeHyZE+EeFwCE2H52weaviZh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(33716001)(26005)(107886003)(6486002)(41300700001)(478600001)(54906003)(316002)(66556008)(6636002)(66476007)(9686003)(6512007)(6506007)(38100700002)(82960400001)(66946007)(5660300002)(4326008)(2906002)(8676002)(6862004)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YxAHzOpIE/mNli0FcT/j3HLCXXvtLth3nrzx5KP9/dMzrjHPAGyCKN2Iv1vS?=
 =?us-ascii?Q?G4SfrDgeHBzENKgiSy3j2N+GQvFfEjNgNEq7BBVOn+GyCE/09NYDApmZycM7?=
 =?us-ascii?Q?pafUbuZKHRaLLiyw5fKqp/q44hqcMXANk+9nNALbQiwHf10pzAH2KRtivG2m?=
 =?us-ascii?Q?aak38ot9RtTHTJVlj9px/DNf3IBnXhAPgBmSexeZE8vZOHz01ro2CZGKwf5W?=
 =?us-ascii?Q?s+Eav3F8yC11Of0n8f1oYHyRiLPlqikke1lsKBy7zPaYV2MIu76bMciYpMMe?=
 =?us-ascii?Q?MdhKLe5iEIHrFQhL31B6RLhAE3x9xYa8AvbxFA8THh3/mqzCbqrlsh926q0g?=
 =?us-ascii?Q?T/UNsdqp8cWkVDH6J20ntdxCS87d70K36NwwK5idgQq41DTksN0EMz3Knf8S?=
 =?us-ascii?Q?Mk7WF4HMrXDMdkOswPt8WIxqMgSibMtfvsL+KY2SCa6N1RWIqUoWF+2mJCPv?=
 =?us-ascii?Q?VuuIa9jENzanVyYoFYCnMrCWgvrznDbu7FzQugtoA59jlkJ6QFDDqiKiOKTV?=
 =?us-ascii?Q?b8HyoLFmZWBvBfJizqsZDWziiKfXdRmNtPvYMWUCiDHz9SK6apYMUZNmgDsp?=
 =?us-ascii?Q?Wirhw4mZQ7Sb5G4JyaTR6d6YiccWkWtxqFZGGnyHwENFnsQJwYo+pZmbtJhm?=
 =?us-ascii?Q?57UZCsZBEpiRfLsPP+4fC0FWPUCP2H2m++lnvQiwQ5x01E0O2847GFg/pmwH?=
 =?us-ascii?Q?DyPf0oavCsjX02MZW55ZZn+1cvBTeLEwLglyhBp2Q46AHzKSf1JrfcVVtAg7?=
 =?us-ascii?Q?fprf+0W8IGgxisbEEu4p/YnZbAahMXhzSmZCV+uCu2xQ35084DDxFAoEXVVg?=
 =?us-ascii?Q?XSOywzQ9l7lv3fsSCYKVtBLKIncG3AI+eN2rdBHwZ+u7q0IG7j5b9sI2s0Il?=
 =?us-ascii?Q?iNtaF6M/jOpveJbTcQQ562FM7pW8DHwAbTQnCIq0Rhi4z8zovKNwFDXaVKwz?=
 =?us-ascii?Q?VDbzKWywtWzg4a92zbu6kh5/7NurImnuDkDad+6wbe5+0i/WMdx+NDLQfe1e?=
 =?us-ascii?Q?Ywslt6HDvcWsIDZTFUhHvIWcERwp6zphaTAPgfUcgkEmVu0ZrwhkSM8AF/Ni?=
 =?us-ascii?Q?O+iwAuUbRIdSfJCX4C16cEv9WVWCZh3C4IPNnHw0QRGCaNVPVqJTYrCclMnw?=
 =?us-ascii?Q?4sK3b4mMoZ9YaczaiO/aVfASJ64uZglPhoFcYQwjgzXvz2RN8a4YRgzfU0Ca?=
 =?us-ascii?Q?+HuR7saU3PrjLa7qzBmwJVNq5ysWlF6aUa4YowTRrpkair5cq9WFGLftBvPL?=
 =?us-ascii?Q?uF4qvuTcr2sFEplfGXIuJHJ9zAgvEobGwt8rTW9DC0UlYDlV33+9D847TV7o?=
 =?us-ascii?Q?RvE23AQvu65caDllSz+UtT5+8KpeO8QLt79Cvn/MCcmJQck5DCm0DEuM9DE2?=
 =?us-ascii?Q?kYN6SK1qQNpPM1P5j4fuytygyMdJ1zACtRsHN4YPXSWKfd6vQ1OXvYJBjfNw?=
 =?us-ascii?Q?HaIU32akH7Zgm8oxdbKY2QmWg+sNlZeNQ+Yd6zJJaDZ3wWyBdiE46QiRdmS7?=
 =?us-ascii?Q?YRgBDQFaRAvKQgjYZz4pyD4LqXphSHoI5PCh+Ft08g7cJrGUiC+h613CR3Fw?=
 =?us-ascii?Q?9FpvYJuA3b6OjcTQ77mB9jilil1npMj8rNKeGkperoXHA6uCgr22j5TRwIoy?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a10680-5142-4b1c-c21f-08dc247a24ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2024 05:37:00.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9g5pl9J4VehMkc7DoFpQziSOKYiXS2g0pXkAeKm7ZJGn67s8AoCgCmIsS3VC00H4QfKSMvYoaUm9pkrwgnA5i2R9lqDIR93/IOc+AM9SZDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
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

On Fri, Feb 02, 2024 at 02:56:23PM -0800, Ashutosh Dixit wrote:
>Newline in name is redunant and produces an unnecessary empty line during
>'cat name'. Newline is added during sysfs_emit. See '27a1a1e2e47d ("drm/xe:
>stringify the argument to avoid potential vulnerability")'.

$ git grep sprintf -- drivers/gpu/drm/xe
drivers/gpu/drm/xe/xe_debugfs.c:                        sprintf(name, "vram%d_mm", mem_type - XE_PL_VRAM0);
drivers/gpu/drm/xe/xe_exec_queue.c:             sprintf(q->name, "rcs%d", instance);
drivers/gpu/drm/xe/xe_exec_queue.c:             sprintf(q->name, "vcs%d", instance);
drivers/gpu/drm/xe/xe_exec_queue.c:             sprintf(q->name, "vecs%d", instance);
drivers/gpu/drm/xe/xe_exec_queue.c:             sprintf(q->name, "bcs%d", instance);
drivers/gpu/drm/xe/xe_exec_queue.c:             sprintf(q->name, "ccs%d", instance);
drivers/gpu/drm/xe/xe_exec_queue.c:             sprintf(q->name, "gsccs%d", instance);
drivers/gpu/drm/xe/xe_gt_debugfs.c:     sprintf(name, "gt%d", gt->info.id);
drivers/gpu/drm/xe/xe_gt_idle.c:                sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
drivers/gpu/drm/xe/xe_gt_idle.c:                sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:  return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
drivers/gpu/drm/xe/xe_hw_fence.c:       sprintf(ctx->name, "%s", name);


it looks like all these in xe_hw_engine_class_sysfs.c have the same
problem. Can you fix them all together?

thanks
Lucas De Marchi
