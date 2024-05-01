Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A5BC4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 21:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC1D10F625;
	Wed,  1 May 2024 21:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFlMqjvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647E410F625
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714597497; x=1746133497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yPFfAthq3vmgPUbF3vc3QvVOdf2AbY3VsrVunfpVX34=;
 b=HFlMqjvkJ1ic0c/+7ndb2vP73CUBBXch8ZT8UI6U7xsD/JUFMvuds1Tc
 XLxSTprNb5KwF2qIljyk3X9OxVuWG7ZHKfPgUhzHnDMtvtPy6x2fKMTGy
 M86yBKjmeQlaYTOe7PUZqBGwtIbB1ecNYuh2QTW3L/ucLGYmE5K99TSMo
 wUJzyouqEaMTw8uO6cJRd+inGNpu9e628L6eIwXQO6L9HBA9iHPLfu+zP
 QwTjWmA0sID8PZq5atusIB2ArBlh+r5kG+YRQj7kN4GbxdtsgwG4BoM+6
 F7+TFAbW6c0PIA9dTteACTfkvzHpbtTOsBh58a0042NgRxtoLGX2Pj2cs g==;
X-CSE-ConnectionGUID: IS0TrjTHRdy/f84WVio0ww==
X-CSE-MsgGUID: 3lmqbtdzSaKmSi8QbkNSKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21764432"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="21764432"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 14:04:57 -0700
X-CSE-ConnectionGUID: G12N+l7ZRum02s9Y4SY78Q==
X-CSE-MsgGUID: nxuiELerROOMuR6jfHqMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="27403268"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 14:04:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 14:04:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 14:04:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 14:04:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emRi4x/CFJawAypJLI5wAOPEl5iTEB+1o0Aj5JBbrQTRXhBJEUStGsb9JcYXmRwFPgBIKAykiLkoI4XAQ+a+XLiW0Y/cCAiH0qO0MQQbEHjTO4l+7O8WlUhuby3rULHfldVQylThQkOf1ribQN6POzEku4UzDmnfOwl2qkSHijet9e6CK41pfRb1HGvDvoOSSRMW9W5pHhVQ8hcOhHi2i0LsCMaSSq/a81DexhkDtua+miP8Z4ZTdXQhChVDu8dPMwCr8ODIhMXJJkhScd4hIfYVbN1SZnRKgE8utqIptukL9oTUOXMjlDI0ynHwI/TznxE2ktxOYj1JWeMnnG0rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKh3ELT7EnPVbVw3AHR7jbRGgrW8fkFxfYHs2ABbWks=;
 b=Q7WPTc7XOo2XGcDRoJsV+HPHfHCXz91WjvRmYocEcJixqFDchEUsY/D1Y2c0izMUw2IfjAkKTH2TQ7fGi5j51hvE0ZHqCSpNGxJHUE67HMM5S738gx8BwTM91ZcJy9IvHYCg3UK6FvVoVDb7IZbQTYMovwZwkI4ysIGUTv+8B6JhDjN7kv07CO4nn6roQ1ZaIxYvL4QqjlPolYz12J/VFpB3Phn6KNYuRqD9aUDlcuLIictoN0gg/4TLV3T72bnJ20UM9suF0mt8KLJIRcQ6rU3D2rtPSyn8QpjsRjEZiJhjZoUoX4ZJQ+wYdtlQgcI2NHEyh3Zjy7Klc4UZ6DcBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 21:04:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 21:04:53 +0000
Date: Wed, 1 May 2024 16:04:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/mocs: Add debugfs node to dump mocs
Message-ID: <jaoehxup5clkhhe4vzlmvghsdwirt62bdy3s5iuutjuhigoc4q@rsbaoj4bhzoz>
References: <20240430170427.1808136-1-janga.rahul.kumar@intel.com>
 <20240430170427.1808136-3-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240430170427.1808136-3-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfd71e1-d56a-45fd-17c3-08dc6a225919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yR0UXmM1bMaqDvLl0z2N07QgAvO7e1ewYZxB1i2cZ60Hds7L8ztVkbU32Ppm?=
 =?us-ascii?Q?/GNRHhe6PLaK1k0pIi5FV0njbZbThZkJBOgg/sisusrR47gW0CXTiklL31S9?=
 =?us-ascii?Q?Bq8t9UlnP1A6n5QgUDtHDoP/GipZrUXovjWCTzJirfLcR2t5FoKXuEGQbjPh?=
 =?us-ascii?Q?Ovr0EhEazuz9LmS0tqEynOUb9k58Dhi9scsREdNpijck5ogZGmuGLvwCba9w?=
 =?us-ascii?Q?jRjrOP0ZiNXdmnh4yy2rYyxZN3vbXTCWFwj5XPvO3IiFZeAf9jw7H1Np3pKg?=
 =?us-ascii?Q?4GRR4Y+e8OnJSPavDkwsA/ev7L4UiavB4ABUtGmXcaZuxzTURIS1y3w1WntX?=
 =?us-ascii?Q?hBPuIKzAfKtYX54iyHqgsuOom8zawPs0IGO9g3ndNC1vaUdAGVTfTglMYugg?=
 =?us-ascii?Q?kjORImEBqVWHHdIC6SY6VDnclVmmfElI4iBI4XTkRrOJ14+a9F/7bdtuXIfz?=
 =?us-ascii?Q?6DN934BurgH7EekWTyxKA8boBumedA8c5Svc7tn/kJqVkD0ZaYNS3vssYgpf?=
 =?us-ascii?Q?loVgG+GftZOCKjFIotjqKgL7+G71k9Ksx0z6Mb/cX6TKaoQjUycHrqzP7GGT?=
 =?us-ascii?Q?D0W4QygFOFMG/uivISyBJfNu6d82T/ij6xVd6M5ghJnlZdH959IkoCNjGCQA?=
 =?us-ascii?Q?NBGabK8GVKGrZvCrwFmiYRhaAJ16Jixo04mvELwnzRqHBaQnQKEDJkkdZ0or?=
 =?us-ascii?Q?GPbDutBBZNG7IzcbxtYnVQALq5jBwqqLG28/HmC94atjRnpFnSfmjmOAE+sC?=
 =?us-ascii?Q?Yw8l7tq0/LbcFjOYEho4UT/VkEKM4cVhrnFpARczj1mMelde1lnKi5va3fUB?=
 =?us-ascii?Q?1HkBa3Mf6m6OUIXixITS90JoXypx9kxaIXbkwJ2c/KxrjiA5leViWjd4iJ2T?=
 =?us-ascii?Q?bcXqj31tVVNw+TVGRKeX8Yt3++oL00Xmsn1R+kKfVwJsVeCKsweNmUIcc2bH?=
 =?us-ascii?Q?EJgHY+WFP3v8vdhFpyfEv2TSeYqpq3jHnE2vDBJneYnqhDP5u2lyiRE+diSY?=
 =?us-ascii?Q?ogRX7jdQPDRrKVG25I3KWfM0T1Ad/AFqv4L/JoqttUl6EXomU3OmJackWEvK?=
 =?us-ascii?Q?XSnS+4RqWqEf2tPlF04I1mB8e0WIE7LDDvp/K/ZWdFIsT4/JnWhNaRiiAX29?=
 =?us-ascii?Q?rwmpTqk7cl4Apa5Y+w6R12NIYd68Yp2t/0xsDvVjg7Leta5InO2OGfRiVuVB?=
 =?us-ascii?Q?aCcZUX6bpikMekv2bemin01L32Gu9bM9MEQNLc7AsqsVz6GJSAKJfvyVkPg?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IAa+vioD7fvyAuu04UA56IWw13WdAIAwkRJLOg2yx3IQ/zXkP2CpelTx1huM?=
 =?us-ascii?Q?YD8Xzy9YuL6EWccOw1mCrYzeV4agyY6dqCIU0XKvUy5uMT8FbYQoqrtiVl3X?=
 =?us-ascii?Q?Z8YZwZzj0xhawr5CqESfumV1vPmCXjGMNqVz8l3HJW/9pTGqPG+wKCqmY3Qv?=
 =?us-ascii?Q?in9Ed/vaGtDgSP2NENs50XtnK/eb9GGeY0wabH/ENp6Pz7XMmMJPp4oyN6h3?=
 =?us-ascii?Q?qMAR9rsqOdmMWWeNlQvaSojrvdtRY/Wghy9iE6tsCXA+AN4G7QCVNg7+Affx?=
 =?us-ascii?Q?byOXB90Fd0kL7PgS8irGCX+YUtKDrFhw1hxEPbHbgpWsUV24SmPhQ/VGolgo?=
 =?us-ascii?Q?M6a1ujKBXp2eQTaAxxeJ0ZKE9o9JT/8K4IgHCtS+j7cZGxa0b/Vm2kpQ2is0?=
 =?us-ascii?Q?JpaWX3JZUWop8FJuwXNU+pYce7mGzSU4hlyFiaX0dlXthh664ZdIgg4ugFC3?=
 =?us-ascii?Q?STqyYyoZ0chbyhDS0UKvr8gfAI6tayMk9hWa/PTXx+ChptgfNye2SnwgbzDe?=
 =?us-ascii?Q?03hcrxchNRTCI282O4h3qqRkIPZ5q3A1zF8bxWZiyL5gMU6lWOI+WqY7qVqC?=
 =?us-ascii?Q?eAe3yQzGQ059FJhvpTExu+t+LCdNODV+A/USHRJ4QOgwe2K9aA3jaD81/w/l?=
 =?us-ascii?Q?SXBJa4cqL/3IGTN4UQG/wTUJ+9tfkiNZDmvEXJZT/bKjqHNfPZPrB+odQU0N?=
 =?us-ascii?Q?QRBypKViYWZVk5weYnvSkFk85HH1cYnm06KaiWy78r6EoB0qz1897Qi2wrUa?=
 =?us-ascii?Q?LS4nz1mDZWer+0rok3+CkQvFqDPLx8v0Lht1HsJxDEwoSQRpglnOit5L42dt?=
 =?us-ascii?Q?x6JuyvuabJlFzl4RRcKiTLM22jsbhT4dpfFd3LCBBNGprTetshwAjpx4EDUA?=
 =?us-ascii?Q?shudw7TreHRHzDAr/F04H+kectRBgBakcPzcQcLyR0809XWIFeoXSjCqUncO?=
 =?us-ascii?Q?oaRYcuIwkGjtLAkGfdegTMwTYmutv5/eCs0yRS0ymnSLQoZnYCCEWyl07WkR?=
 =?us-ascii?Q?+KnxJq8sSxjBxwEzIP5Po3c6e2R387kViLuLfJ+SKLeui/VnOSVSa4gjdm+j?=
 =?us-ascii?Q?tsO86c0wwF/O+eQMbN1b7vsWv4bYI5FBnT7TYpPVWo1qAO6E/9bfqRygTyjP?=
 =?us-ascii?Q?VrWrYnODoEoFbL2qgc3LtuwhhK45+QraFXE2PKa7/Euek8HFAGZ450QXi7Nf?=
 =?us-ascii?Q?IWI8CENqJkASCtu726JMBe+LIRy9Z29pWLjZVeGxLtAGQyMyY7TF4Pg5WRCC?=
 =?us-ascii?Q?7Th7evuVXeAi43mNOUZ7rxx/xhau4/XYjpGA7ncK6DwDY0Jue3McRZvkroxi?=
 =?us-ascii?Q?Q0h0Y4ee7qrqRJTRu8Rsvlyz3SpwN8dmv/3Y8BCfLOrdmuhdOAB6Qg7NzjAK?=
 =?us-ascii?Q?0gz0k8ErUN6LuOGo8i9fSTu2hDlSw0VfPAVq3CABk/WU5puxC4PbmlgEgftE?=
 =?us-ascii?Q?eEvD/oAiS4wd8px6Z6vePdptM1JbndwaTnmFjClSolKiWtkdu6FzeD8XHk5I?=
 =?us-ascii?Q?1mM2+GDsMYw3Zy61Lplxd3WJcuSDQ16G7zotmUfhPJPlqqpz7TpzfK6sQNlP?=
 =?us-ascii?Q?U/2Bo8WPLUEDpn+bgQNqIbFkZDA3Em9QxFeVor0Iuo91+Fa6TU8KWwuAoewK?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfd71e1-d56a-45fd-17c3-08dc6a225919
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 21:04:53.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXY6nGmoKPcsk8+h0T1k7z0xfwD4quGwIcq1Tn+pzIF1/CJZgNytg+wBMi+v20XgQHtC6sI2dm+/IbMGbLTe6aWQ7S8PVvdcDha11U+I3Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
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

On Tue, Apr 30, 2024 at 10:34:27PM GMT, Janga Rahul Kumar wrote:
>This is useful to check mocs configuration. Tests/Tools can use
>this debugfs entry to get mocs info.
>
>v2: Address review comments. Change debugfs output style similar
>to pat debugfs. (Lucas De Marchi)
>
>v3: rebase.
>
>v4: Address review comments. Use function pointer inside ops
>struct. Update Test-with links. Remove usage of flags wherever
>not required. (Lucas De Marchi)
>
>Test-with: https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-2-janga.rahul.kumar@intel.com
>	   https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-3-janga.rahul.kumar@intel.com/

only in the cover ^

>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c |  11 ++
> drivers/gpu/drm/xe/xe_mocs.c       | 258 +++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_mocs.h       |   8 +
> 3 files changed, 277 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index 599aed47f2ba..84068acbef4b 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -18,6 +18,7 @@
> #include "xe_hw_engine.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
>+#include "xe_mocs.h"
> #include "xe_pat.h"
> #include "xe_pm.h"
> #include "xe_reg_sr.h"
>@@ -200,6 +201,15 @@ static int pat(struct xe_gt *gt, struct drm_printer *p)
> 	return 0;
> }
>
>+static int mocs(struct xe_gt *gt, struct drm_printer *p)
>+{
>+	xe_pm_runtime_get(gt_to_xe(gt));
>+	xe_mocs_dump(gt, p);
>+	xe_pm_runtime_put(gt_to_xe(gt));
>+
>+	return 0;
>+}
>+
> static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> {
> 	xe_pm_runtime_get(gt_to_xe(gt));
>@@ -255,6 +265,7 @@ static const struct drm_info_list debugfs_list[] = {
> 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
> 	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>+	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
> 	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
> 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index aef09eb423e9..a7caa9df0470 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -13,6 +13,7 @@
> #include "xe_gt_mcr.h"
> #include "xe_mmio.h"
> #include "xe_platform_types.h"
>+#include "xe_pm.h"
> #include "xe_sriov.h"
> #include "xe_step_types.h"
>
>@@ -36,6 +37,13 @@ struct xe_mocs_entry {
> 	u16 used;
> };
>
>+struct xe_mocs_info;
>+
>+struct xe_mocs_ops {
>+	void (*dump)(struct xe_mocs_info *mocs, unsigned int flags,
>+		     struct xe_gt *gt, struct drm_printer *p);
>+};
>+
> struct xe_mocs_info {
> 	unsigned int size;
> 	unsigned int n_entries;
>@@ -43,6 +51,7 @@ struct xe_mocs_info {
> 	u8 uc_index;
> 	u8 wb_index;
> 	u8 unused_entries_index;
>+	const struct xe_mocs_ops *ops;

this creates a hole in the middle of the struct. Better move it near the
table member.

> };
>
> /* Defines for the tables (XXX_MOCS_0 - XXX_MOCS_63) */
>@@ -57,6 +66,17 @@ struct xe_mocs_info {
> #define LE_COS(value)		((value) << 15)
> #define LE_SSE(value)		((value) << 17)
>
>+#define   LE_SSE_MASK		REG_GENMASK(18, 17)
>+#define   LE_COS_MASK		REG_GENMASK(16, 15)
>+#define   LE_SCF_MASK		REG_BIT(14)
>+#define   LE_PFM_MASK		REG_GENMASK(13, 11)
>+#define   LE_SCC_MASK		REG_GENMASK(10, 8)
>+#define   LE_RSC_MASK		REG_BIT(7)
>+#define   LE_AOM_MASK		REG_BIT(6)
>+#define   LE_LRUM_MASK		REG_GENMASK(5, 4)
>+#define   LE_TGT_CACHE_MASK	REG_GENMASK(3, 2)
>+#define   LE_CACHEABILITY_MASK	REG_GENMASK(1, 0)

sorry for not noticing before: below I see you're doing:

reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
or
reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));

so these defines should be together with those registers in
drivers/gpu/drm/xe/regs/xe_gt_regs.h

>+
> /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
> #define L3_ESC(value)		((value) << 0)
> #define L3_SCC(value)		((value) << 1)
>@@ -64,6 +84,17 @@ struct xe_mocs_info {
> #define L3_GLBGO(value)		((value) << 6)
> #define L3_LKUP(value)		((value) << 7)
>
>+#define   L3_UPPER_LKUP_MASK			REG_BIT(23)
>+#define   L3_UPPER_GLBGO_MASK			REG_BIT(22)
>+#define   L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
>+#define   L3_UPPER_IDX_SCC_MASK			REG_GENMASK(19, 17)
>+#define   L3_UPPER_IDX_ESC_MASK			REG_BIT(16)
>+#define   L3_LKUP_MASK				REG_BIT(7)
>+#define   L3_GLBGO_MASK				REG_BIT(6)
>+#define   L3_CACHEABILITY_MASK			REG_GENMASK(5, 4)
>+#define   L3_SCC_MASK				REG_GENMASK(3, 1)
>+#define   L3_ESC_MASK				REG_BIT(0)

ditto

>+
> /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> #define IG_PAT				REG_BIT(8)
> #define L3_CACHE_POLICY_MASK		REG_GENMASK(5, 4)
>@@ -107,6 +138,8 @@ struct xe_mocs_info {
> #define XE2_L3_1_XD		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 1)
> #define XE2_L3_3_UC		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 3)
>
>+#define XE2_L3_CLOS_MASK	REG_GENMASK(7, 6)
>+
> #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
> 	[__idx] = { \
> 		.control_value = __control_value, \
>@@ -265,6 +298,74 @@ static bool regs_are_mcr(struct xe_gt *gt)
> 		return GRAPHICS_VERx100(xe) >= 1250;
> }
>
>+static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i, j;
>+	u32 reg_val;
>+
>+	drm_printf(p, "LNCFCMOCS[idx] = [ESC, SCC, L3CC] (value)\n\n");
>+
>+	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
>+		if (regs_are_mcr(gt))
>+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>+		else
>+			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>+			   j++,
>+			   !!(reg_val & L3_ESC_MASK),
>+			   REG_FIELD_GET(L3_SCC_MASK, reg_val),
>+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>+			   j,
>+			   !!(reg_val & L3_UPPER_IDX_ESC_MASK),
>+			   REG_FIELD_GET(L3_UPPER_IDX_SCC_MASK, reg_val),
>+			   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+	}
>+}
>+
>+static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>+			   struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i;
>+	u32 reg_val;
>+
>+	if (flags & HAS_GLOBAL_MOCS) {
>+		drm_printf(p, "Global mocs table configuration:\n");
>+		drm_printf(p, "GLOB_MOCS[idx] = [LeCC, TC, LRUM, AOM, RSC, SCC, PFM, SCF, CoS, SSE] (value)\n\n");
>+
>+		for (i = 0; i < info->n_entries; i++) {
>+			if (regs_are_mcr(gt))
>+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>+			else
>+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
>+
>+		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u, %u, %u, %u, %u, %u, %u, %u ] (%#8x)\n",

indentation here is misleading

>+			   i,
>+			   REG_FIELD_GET(LE_CACHEABILITY_MASK, reg_val),
>+			   REG_FIELD_GET(LE_TGT_CACHE_MASK, reg_val),
>+			   REG_FIELD_GET(LE_LRUM_MASK, reg_val),
>+			   !!(reg_val & LE_AOM_MASK),
>+			   !!(reg_val & LE_RSC_MASK),
>+			   REG_FIELD_GET(LE_SCC_MASK, reg_val),
>+			   REG_FIELD_GET(LE_PFM_MASK, reg_val),
>+			   !!(reg_val & LE_SCF_MASK),
>+			   REG_FIELD_GET(LE_COS_MASK, reg_val),
>+			   REG_FIELD_GET(LE_SSE_MASK, reg_val),
>+			   reg_val);
>+		}
>+	}
>+
>+	xelp_lncf_dump(info, gt, p);
>+}
>+
>+static const struct xe_mocs_ops xelp_mocs_ops = {
>+	.dump = xelp_mocs_dump,
>+};
>+
> static const struct xe_mocs_entry dg1_mocs_desc[] = {
> 	/* UC */
> 	MOCS_ENTRY(1, 0, L3_1_UC),
>@@ -301,6 +402,40 @@ static const struct xe_mocs_entry dg2_mocs_desc[] = {
> 	MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),
> };
>
>+static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flags,
>+			   struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i, j;
>+	u32 reg_val;
>+
>+	drm_printf(p, "LNCFCMOCS[idx] = [UCL3LOOKUP, GLBGO, L3CC] (value)\n\n");
>+
>+	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
>+		if (regs_are_mcr(gt))
>+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>+		else
>+			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>+			   j++,
>+			   !!(reg_val & L3_LKUP_MASK),
>+			   !!(reg_val & L3_GLBGO_MASK),
>+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>+			   j,
>+			   !!(reg_val & L3_UPPER_LKUP_MASK),
>+			   !!(reg_val & L3_UPPER_GLBGO_MASK),
>+			   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+	}
>+}
>+
>+static const struct xe_mocs_ops xehp_mocs_ops = {
>+	.dump = xehp_lncf_dump,
>+};
>+
> static const struct xe_mocs_entry pvc_mocs_desc[] = {
> 	/* Error */
> 	MOCS_ENTRY(0, 0, L3_3_WB),
>@@ -312,6 +447,36 @@ static const struct xe_mocs_entry pvc_mocs_desc[] = {
> 	MOCS_ENTRY(2, 0, L3_3_WB),
> };
>
>+static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct xe_gt *gt,
>+			  struct drm_printer *p)
>+{
>+	unsigned int i, j;
>+	u32 reg_val;
>+
>+	drm_printf(p, "LNCFCMOCS[idx] = [ L3CC ] (value)\n\n");
>+
>+	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
>+		if (regs_are_mcr(gt))
>+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>+		else
>+			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
>+			   j++,
>+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+
>+		drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
>+			   j,
>+			   REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
>+			   reg_val);
>+	}
>+}
>+
>+static const struct xe_mocs_ops pvc_mocs_ops = {
>+	.dump = pvc_mocs_dump,
>+};
>+
> static const struct xe_mocs_entry mtl_mocs_desc[] = {
> 	/* Error - Reserved for Non-Use */
> 	MOCS_ENTRY(0,
>@@ -363,6 +528,36 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
> 		   L3_GLBGO(1) | L3_1_UC),
> };
>
>+static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>+			  struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i;
>+	u32 reg_val;
>+
>+	drm_printf(p, "Global mocs table configuration:\n");
>+	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L4_CACHE_POLICY] (value)\n\n");
>+
>+	for (i = 0; i < info->n_entries; i++) {
>+		if (regs_are_mcr(gt))
>+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>+		else
>+			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
>+
>+		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u]  (%#8x)\n",
>+			   i,
>+			   !!(reg_val & IG_PAT),
>+			   REG_FIELD_GET(L4_CACHE_POLICY_MASK, reg_val),
>+			   reg_val);
>+	}
>+
>+	/* MTL lncf mocs table pattern is similar to that of xehp */
>+	xehp_lncf_dump(info, flags, gt, p);
>+}
>+
>+static const struct xe_mocs_ops mtl_mocs_ops = {
>+	.dump = mtl_mocs_dump,
>+};
>+
> static const struct xe_mocs_entry xe2_mocs_table[] = {
> 	/* Defer to PAT */
> 	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0),
>@@ -376,6 +571,34 @@ static const struct xe_mocs_entry xe2_mocs_table[] = {
> 	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
> };
>
>+static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>+			  struct xe_gt *gt, struct drm_printer *p)
>+{
>+	unsigned int i;
>+	u32 reg_val;
>+
>+	drm_printf(p, "Global mocs table configuration:\n");
>+	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L3_CLOS, L3_CACHE_POLICY, L4_CACHE_POLICY] (value)\n\n");
>+
>+	for (i = 0; i < info->n_entries; i++) {
>+		if (regs_are_mcr(gt))
>+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>+		else
>+			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
>+
>+		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u]  (%#8x)\n",
>+			   i,
>+			   !!(reg_val & IG_PAT),
>+			   REG_FIELD_GET(XE2_L3_CLOS_MASK, reg_val),
>+			   REG_FIELD_GET(L4_CACHE_POLICY_MASK, reg_val),
>+			   reg_val);
>+	}
>+}
>+
>+static const struct xe_mocs_ops xe2_mocs_ops = {
>+	.dump = xe2_mocs_dump,
>+};
>+
> static unsigned int get_mocs_settings(struct xe_device *xe,
> 				      struct xe_mocs_info *info)
> {
>@@ -386,6 +609,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,

this get_mocs_settings being called over and over: we may need to
redesign it, but no need to worry for now.

rest looks correct so next version we should hopefully be able to apply.
Please confirm the platforms this was tested on.

Below is a (untested) diff with part of the things I mentioned. Feel
free to use it to squash the changes.

|diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
|index 83847f2da72a..8f44437c8e02 100644
|--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
|+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
|@@ -59,6 +59,27 @@
| 
| #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
| #define XEHP_GLOBAL_MOCS(i)			XE_REG_MCR(0x4000 + (i) * 4)
|+#define   LE_SSE_MASK				REG_GENMASK(18, 17)
|+#define   LE_SSE(value)				REG_FIELD_PREP(LE_SSE_MASK, value)
|+#define   LE_COS_MASK				REG_GENMASK(16, 15)
|+#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK)
|+#define   LE_SCF_MASK				REG_BIT(14)
|+#define   LE_SCF(value)				REG_FIELD_PREP(LE_SCF_MASK, value)
|+#define   LE_PFM_MASK				REG_GENMASK(13, 11)
|+#define   LE_PFM(value)				REG_FIELD_PREP(LE_PFM_MASK, value)
|+#define   LE_SCC_MASK				REG_GENMASK(10, 8)
|+#define   LE_SCC(value)				REG_FIELD_PREP(LE_SCC_MASK, value)
|+#define   LE_RSC_MASK				REG_BIT(7)
|+#define   LE_RSC(value)				REG_FIELD_PREP(LE_RSC_MASK, value)
|+#define   LE_AOM_MASK				REG_BIT(6)
|+#define   LE_AOM(value)				REG_FIELD_PREP(LE_AOM_MASK, value)
|+#define   LE_LRUM_MASK				REG_GENMASK(5, 4)
|+#define   LE_LRUM(value)			REG_FIELD_PREP(LE_LRUM_MASK, value)
|+#define   LE_TGT_CACHE_MASK			REG_GENMASK(3, 2)
|+#define   LE_TGT_CACHE(value)			REG_FIELD_PREP(LE_TGT_CACHE_MASK, value)
|+#define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
|+#define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
|+
| #define CCS_AUX_INV				XE_REG(0x4208)
| 
| #define VD0_AUX_INV				XE_REG(0x4218)
|@@ -314,9 +335,24 @@
| #define   XEHPC_OVRLSCCC			REG_BIT(0)
| 
| /* L3 Cache Control */
|+#define LNCFCMOCS_REG_COUNT			32
| #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
| #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
|-#define LNCFCMOCS_REG_COUNT			32
|+#define   L3_UPPER_LKUP_MASK			REG_BIT(23)
|+#define   L3_UPPER_GLBGO_MASK			REG_BIT(22)
|+#define   L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
|+#define   L3_UPPER_IDX_SCC_MASK			REG_GENMASK(19, 17)
|+#define   L3_UPPER_IDX_ESC_MASK			REG_BIT(16)
|+#define   L3_LKUP_MASK				REG_BIT(7)
|+#define   L3_LKUP(value)			REG_FIELD_PREP(L3_LKUP_MASK, value)
|+#define   L3_GLBGO_MASK				REG_BIT(6)
|+#define   L3_GLBGO(value)			REG_FIELD_PREP(L3_GLBGO_MASK, value)
|+#define   L3_CACHEABILITY_MASK			REG_GENMASK(5, 4)
|+#define   L3_CACHEABILITY(value)		REG_FIELD_PREP(L3_CACHEABILITY_MASK, value)
|+#define   L3_SCC_MASK				REG_GENMASK(3, 1)
|+#define   L3_SCC(value)				REG_FIELD_PREP(L3_SCC_MASK, value)
|+#define   L3_ESC_MASK				REG_BIT(0)
|+#define   L3_ESC(value)				REG_FIELD_PREP(L3_ESC_MASK, value)
| 
| #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
| #define   XEHP_LNESPARE				REG_BIT(19)
|diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
|index a7caa9df0470..7c75b827cb82 100644
|--- a/drivers/gpu/drm/xe/xe_mocs.c
|+++ b/drivers/gpu/drm/xe/xe_mocs.c
|@@ -48,53 +48,12 @@ struct xe_mocs_info {
| 	unsigned int size;
| 	unsigned int n_entries;
| 	const struct xe_mocs_entry *table;
|+	const struct xe_mocs_ops *ops;
| 	u8 uc_index;
| 	u8 wb_index;
| 	u8 unused_entries_index;
|-	const struct xe_mocs_ops *ops;
| };
| 
|-/* Defines for the tables (XXX_MOCS_0 - XXX_MOCS_63) */
|-#define _LE_CACHEABILITY(value)	((value) << 0)
|-#define _LE_TGT_CACHE(value)	((value) << 2)
|-#define LE_LRUM(value)		((value) << 4)
|-#define LE_AOM(value)		((value) << 6)
|-#define LE_RSC(value)		((value) << 7)
|-#define LE_SCC(value)		((value) << 8)
|-#define LE_PFM(value)		((value) << 11)
|-#define LE_SCF(value)		((value) << 14)
|-#define LE_COS(value)		((value) << 15)
|-#define LE_SSE(value)		((value) << 17)
|-
|-#define   LE_SSE_MASK		REG_GENMASK(18, 17)
|-#define   LE_COS_MASK		REG_GENMASK(16, 15)
|-#define   LE_SCF_MASK		REG_BIT(14)
|-#define   LE_PFM_MASK		REG_GENMASK(13, 11)
|-#define   LE_SCC_MASK		REG_GENMASK(10, 8)
|-#define   LE_RSC_MASK		REG_BIT(7)
|-#define   LE_AOM_MASK		REG_BIT(6)
|-#define   LE_LRUM_MASK		REG_GENMASK(5, 4)
|-#define   LE_TGT_CACHE_MASK	REG_GENMASK(3, 2)
|-#define   LE_CACHEABILITY_MASK	REG_GENMASK(1, 0)
|-
|-/* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
|-#define L3_ESC(value)		((value) << 0)
|-#define L3_SCC(value)		((value) << 1)
|-#define _L3_CACHEABILITY(value)	((value) << 4)
|-#define L3_GLBGO(value)		((value) << 6)
|-#define L3_LKUP(value)		((value) << 7)
|-
|-#define   L3_UPPER_LKUP_MASK			REG_BIT(23)
|-#define   L3_UPPER_GLBGO_MASK			REG_BIT(22)
|-#define   L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
|-#define   L3_UPPER_IDX_SCC_MASK			REG_GENMASK(19, 17)
|-#define   L3_UPPER_IDX_ESC_MASK			REG_BIT(16)
|-#define   L3_LKUP_MASK				REG_BIT(7)
|-#define   L3_GLBGO_MASK				REG_BIT(6)
|-#define   L3_CACHEABILITY_MASK			REG_GENMASK(5, 4)
|-#define   L3_SCC_MASK				REG_GENMASK(3, 1)
|-#define   L3_ESC_MASK				REG_BIT(0)
|-
| /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
| #define IG_PAT				REG_BIT(8)
| #define L3_CACHE_POLICY_MASK		REG_GENMASK(5, 4)
|@@ -111,22 +70,20 @@ struct xe_mocs_info {
|  * Note: LE_0_PAGETABLE works only up to Gen11; for newer gens it means
|  * the same as LE_UC
|  */
|-#define LE_0_PAGETABLE		_LE_CACHEABILITY(0)
|-#define LE_1_UC			_LE_CACHEABILITY(1)
|-#define LE_2_WT			_LE_CACHEABILITY(2)
|-#define LE_3_WB			_LE_CACHEABILITY(3)
|+#define LE_1_UC			LE_CACHEABILITY(1)
|+#define LE_2_WT			LE_CACHEABILITY(2)
|+#define LE_3_WB			LE_CACHEABILITY(3)
| 
| /* Target cache */
|-#define LE_TC_0_PAGETABLE	_LE_TGT_CACHE(0)
|-#define LE_TC_1_LLC		_LE_TGT_CACHE(1)
|-#define LE_TC_2_LLC_ELLC	_LE_TGT_CACHE(2)
|-#define LE_TC_3_LLC_ELLC_ALT	_LE_TGT_CACHE(3)
|+#define LE_TC_1_LLC		LE_TGT_CACHE(1)
|+#define LE_TC_2_LLC_ELLC	LE_TGT_CACHE(2)
|+#define LE_TC_3_LLC_ELLC_ALT	LE_TGT_CACHE(3)
| 
| /* L3 caching options */
|-#define L3_0_DIRECT		_L3_CACHEABILITY(0)
|-#define L3_1_UC			_L3_CACHEABILITY(1)
|-#define L3_2_RESERVED		_L3_CACHEABILITY(2)
|-#define L3_3_WB			_L3_CACHEABILITY(3)
|+#define L3_0_DIRECT		L3_CACHEABILITY(0)
|+#define L3_1_UC			L3_CACHEABILITY(1)
|+#define L3_2_RESERVED		L3_CACHEABILITY(2)
|+#define L3_3_WB			L3_CACHEABILITY(3)
| 
| /* L4 caching options */
| #define L4_0_WB                 REG_FIELD_PREP(L4_CACHE_POLICY_MASK, 0)


thanks
Lucas De Marchi
