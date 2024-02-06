Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1555EC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 21:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC38F112E67;
	Tue,  6 Feb 2024 21:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJS1d1Ak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE38112E67
 for <Intel-Xe@lists.freedesktop.org>; Tue,  6 Feb 2024 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707254799; x=1738790799;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EdzQDJnBhXVACd6XE0jI8ceUZ9IDr70m4gp1r+1t9cc=;
 b=WJS1d1Akoa6xwJKsb9T8Q7ObFTP8c1yOLswoOzKJGGse5iJAHcA3vnW+
 yJ6s01YiqmibeWohJXSfbc1+vdbdySevxBzy4u73cj+T3Ohuw/SpaxCwq
 ANCZQONxPT81PDaFgJMu6eN0dFLCTxQv9guop88zTEIZV9KA8xP4+1PUl
 02/eWTewASZ38ujp5tD1RacP9zfrhNmwMWGyLMZUVrmwy203PARILYbHS
 kqhkqDdEZe7CuVy8FszeS0obFm6GBwmb+//K6+jhoEWclAiB9o4aE0hmX
 bBKZA7W7FVb87gcWZSSaUUqRX1o9pfNNyD6+UlXNnmzei5eK3lgeWBnFQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="26293207"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="26293207"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 13:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="31955716"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 13:26:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 13:26:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 13:26:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 13:26:37 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 13:26:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2HRbY5oSzE30UTtnvhRvgPRcUu4CfIWUxuNALzLas9nAJD+zXwXOFSKo+e8oSMCJB3YMH+Qptb4DxlXpBVcUFur84AZFkRg45hya0GUwf1vcfNTzoovtgaHB8WNmpSPgjndM9Wn+QCwn+T8ftEwLMFrA4o67F1n+xob+0vPg40Kj5EUlewAXTOHNyNDDEp3li9ByQV8SdKJsel0PKwu/VliHBBnyjV2Wtac5icPo1seZKxvuegrwUQztQ6Ymhxzm+WuOTl3BOh1vpiWhQ8fanatFnuYdg6xFg/IchVSupHmzS9h4gXwMKN0uv9J4qJUU/olme8DZOME4WWOoa+32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXpX88gUp1a1aggG/sfz9Is5LYePG1qm3tP5kZNMSIo=;
 b=QW9+Dbqhv31P8QAl4P8s3xsM0xcrk3CCcStEgB5wCD5NoqUtZ77gbd1nBWdzIKAgJEolZQVVwHcKdVOMHELEoULbKmgCvP3uaJpIp8NOCu1VmDUtbFbgfOa/MFGRejwDANE6AgYVqaK+OP1HXZduQ1R0SY3o2nu2BW+cbs+F+ciNyyb0GkL1IdgJbhglign61auW0EVqOhIodTV48RzMHisWosOHKaDXFxDBs+UQzwPaxiVko7KmX6NH/psjSo5owUGyzl/P8N/oFcJQmH+rqo0Nh9FC0ZiJylGblPuO0+CGkMf2AXCKQkuhnAZC4ZUg23LJLGn3q7A6PTLcVbof9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 21:26:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 21:26:34 +0000
Date: Tue, 6 Feb 2024 15:26:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Message-ID: <4tyazvyh5rc42ethjxv7lotzdkzs7gbthzen2j7uyxfo32f6lf@ialkyb6nybvn>
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
 <20240206201153.2773996-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240206201153.2773996-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ab5398-a736-4236-2907-08dc275a4b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zbesXGYfqh6zLKGk9qHcBZKTpc2aaFYMgvLsBcPpHiaADTnQCc3l73/t7rYhFAtcHxACxsI3jHDPQSvahV5P+uRcOrAByrI6ZavAHL+VVmELRrXRBNGDxSMGUHXQou+0zyylFao896vVwk3CMoXSJ3Tisr+DaVj39R5PDkwj732zpGyyS4bGCHkxyw8sEvb9PhwXfCElkKqdxv/jPWv90+iDdAcJHsT8VpVvZ6CYIUFZk6lxCD1nUAXOBPhJ39tIR9pboMKteeUJGCbueZuOVIgMqvq8SywWH0136tX39ZfKhgirTckNqAXQ6RrYTxwFekeqvKZj74dQ5ItUPRFawpvE1wYPKDg2k2OX1QVFxBADHaREcrsYjKsBxrQpKVYEFPjoPu24VlB0lQKVj3BVH9ZHZbKd5tHP5lr2THmaxmbMAHLDSEyxOOEbi9kCtXsuVqEOBqqa8MAH2E3wxGWEtQoayrE677GITUkZN53O9FM8pLEsALqc2lIgEgiEcaC64bT2xTr32ReH7kZvUqd2AFzon3F5rSamm6LLXOzHwW0fe0njAGU2DoJYHXhgOPiS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(5660300002)(2906002)(26005)(33716001)(82960400001)(86362001)(38100700002)(6636002)(6506007)(8936002)(66946007)(6512007)(34206002)(66556008)(66476007)(9686003)(478600001)(83380400001)(41300700001)(6486002)(4326008)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I5PIA+tYFpDJwg5m7uZvuVNLYOJA66c3gXjFqlkAYqXTVW6Bx5ZZXLunXD?=
 =?iso-8859-1?Q?Yn1TZf8y2bouVWPAa99yXfqkZ7bPSs5pJysyKuQ7jkY8ClfAttGO5sBLNi?=
 =?iso-8859-1?Q?9IgcqazAoo1ETrQxVZJTVAc94gwJ+9eABvFQ/65o9kk4kDU/ECP0/maBRP?=
 =?iso-8859-1?Q?rj8yr5pa8smKQQHIjYLUHdvGh2VZR14/Q6EjRCc2yccMBNNQ/WNHDKLuM8?=
 =?iso-8859-1?Q?pwvaQWcT6n+3XfuHy7Weg39dCBJvKPXi4wwTV1t1YFNOnBWGLfVqt6N7ix?=
 =?iso-8859-1?Q?ruSDah++qdmTXRq6jkUdKta6JGmJvC6ChXP2XeHsdM+Zxj72rQ4CbdJRWt?=
 =?iso-8859-1?Q?Wm/0qk6zF4B/zY1cQkTu07Toasdo93EcgSLr16o9MkGfGzil4ZoYb1UZiC?=
 =?iso-8859-1?Q?BWqfTAlCzgxA7iQiX1GLmSQDn5fEPM0ywYwFyu2MdoNU8tFgnimHbxj/nn?=
 =?iso-8859-1?Q?hRvzwkDp/3bvM7ajHi32M9sNfNd934vCY30RKMETcYXq2Jfq9pea+DBXC+?=
 =?iso-8859-1?Q?Q4PTAlyckw+9CsCc1W+33wl0VMltwO9JYcUM8R3sQWsiZ51fAOIVu+w33V?=
 =?iso-8859-1?Q?pX+99SoDqhw/ggVcoXFC2BYY/6NW3KQ5w44kdJdKbnD2EMD/3K9dUD2tcT?=
 =?iso-8859-1?Q?Z2NgGllsvwSheo3ayjEyR9pm5/HSsKgl+0t2klZJ5HTviqP8VxNrBIxY/2?=
 =?iso-8859-1?Q?0SYBwt4/cD7Ta5Xc60uw14mife23YKML+cRfz/5Njh2jlQuJwZ+1GdmAwf?=
 =?iso-8859-1?Q?UfzIOrJrLI6b3q+mnhpioN5XIBXRdRTMzGUdPlIoVSUjZbDv7f+0GWaNy4?=
 =?iso-8859-1?Q?SFaDCmI6Jh5VQP4cEFG630CZDj0P31MJ/2HsYNjqbG2M9xs6Z4+wuTBGQF?=
 =?iso-8859-1?Q?TOx9LKTbsm2yNK537ix1TcAmKNqxRkFZDbW5pkrqnczba8hX6aO0fgzlWL?=
 =?iso-8859-1?Q?n0El+6ai0iXHqwaN1EkfADH2Ikw/2OJjenshTl2gUYojMKTnsaM+p3Mk9i?=
 =?iso-8859-1?Q?/iJ2d0B9Qhuj6C5ePXquw050mgyA5TC3LIToa7vClnNubDs+OBMUycLF/g?=
 =?iso-8859-1?Q?HmPog+iNV74yo0gxcoLNhzuUIDgFAFzYuIVzI/NcVd3lJ8kUDCr+iE3gj0?=
 =?iso-8859-1?Q?vd0M1OlBeelw95nR22u+87APGSFrjqA3omCp0g/gxLjtKDUWhJ8WWWoQ8J?=
 =?iso-8859-1?Q?r+w+XkUlkqcA2Vle2DbNRUPayoS/CImakKv33Q4eyS56jURJZJqedDoi2Y?=
 =?iso-8859-1?Q?nW1HOrv+HVDNoq59Iq68OZ/5mVyEqf8ihXUiJcRtJaozgeh8myXdm49aSL?=
 =?iso-8859-1?Q?sitHpjhhO8SshlygLXr661LajtwCzlxMD1764O4kBCs81NCs+D1ljBTWCN?=
 =?iso-8859-1?Q?vzWVcMb+umaCuNk5x0pJvdnju0Xyg9/zUPWnHtzxA/DEnqpJxXKeuv/e6y?=
 =?iso-8859-1?Q?c/hkM4uFFKDTl3WaQXFHoYRrv06E4BqVNkY7i0bemWHbtBJWjIMeVbTrZD?=
 =?iso-8859-1?Q?Ljg5rm0G02mKWQPHF1x/IR7hGy54rdmOehE3c85wtukD2rezo0lz155k1R?=
 =?iso-8859-1?Q?uh/dUR1RQO0tiU7tl7njPDoXzLA2kpZLj78xb1l0rUmBxtoP+M8HqSyPwG?=
 =?iso-8859-1?Q?+f+BUfqWr0QtJybjlOPKtVGUnqOxb+IBleiparL0QT2XIOnivsY2O+TA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ab5398-a736-4236-2907-08dc275a4b7c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 21:26:34.9263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LvCKGnXGUZ/mzQzX15Skg+JL8xGbJSiQWwzaDNfqNZXUgWc0V6xX+3+1euGxxxPXu2r5iATIwRWNcdDdUse7zQBJXKMnRvkGM0cxbHGNeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
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

On Tue, Feb 06, 2024 at 12:11:50PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Other driver code beyond the sysfs interface wants to know about
>throttling. So move the query function out of sysfs.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_freq.c           | 18 +++++++++++--
> drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
> 3 files changed, 30 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>index e5b0f4ecdbe8..4cf7772c387f 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>@@ -3,15 +3,17 @@
>  * Copyright © 2023 Intel Corporation
>  */
>
>-#include "xe_gt_freq.h"
>-

foo.c should always include foo.h as the first thing.

> #include <linux/kobject.h>
> #include <linux/sysfs.h>
>
> #include <drm/drm_managed.h>
> #include <drm/drm_print.h>
>
>+#include "regs/xe_gt_regs.h"
> #include "xe_device_types.h"
>+#include "xe_mmio.h"
>+#include "xe_gt.h"
>+#include "xe_gt_freq.h"
> #include "xe_gt_sysfs.h"
> #include "xe_gt_throttle_sysfs.h"
> #include "xe_guc_pc.h"
>@@ -220,3 +222,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
>
> 	xe_gt_throttle_sysfs_init(gt);
> }
>+
>+u32 xe_read_perf_limit_reasons(struct xe_gt *gt)


any function available to other compilation units should keep the prefix

xe_gt_freq.c ->  xe_gt_freq_XXXXXXXX()

>+{
>+	u32 reg;

this gives the impression you are getting the register offset, not its
value.


>+
>+	if (xe_gt_is_media_type(gt))
>+		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>+	else
>+		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>+
>+	return reg;

does it make sense to share the function to read a register, but then
only return the raw value? What if the register change in the next
platform or what you are reading changes?

Lucas De Marchi

>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
>index f3fe3c90491a..89be518b4967 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.h
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>@@ -6,8 +6,12 @@
> #ifndef _XE_GT_FREQ_H_
> #define _XE_GT_FREQ_H_
>
>+#include <linux/types.h>
>+
> struct xe_gt;
>
> void xe_gt_freq_init(struct xe_gt *gt);
>
>+u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>index 63d640591a52..89d9f89962ad 100644
>--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>@@ -8,6 +8,7 @@
> #include <regs/xe_gt_regs.h>
> #include "xe_device.h"
> #include "xe_gt.h"
>+#include "xe_gt_freq.h"
> #include "xe_gt_sysfs.h"
> #include "xe_gt_throttle_sysfs.h"
> #include "xe_mmio.h"
>@@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
> 	return kobj_to_gt(dev->kobj.parent);
> }
>
>-static u32 read_perf_limit_reasons(struct xe_gt *gt)
>-{
>-	u32 reg;
>-
>-	if (xe_gt_is_media_type(gt))
>-		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>-	else
>-		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>-
>-	return reg;
>-}
>-
> static u32 read_status(struct xe_gt *gt)
> {
>-	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>+	u32 status = xe_read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>
> 	return status;
> }
>
> static u32 read_reason_pl1(struct xe_gt *gt)
> {
>-	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>+	u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>
> 	return pl1;
> }
>
> static u32 read_reason_pl2(struct xe_gt *gt)
> {
>-	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>+	u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>
> 	return pl2;
> }
>
> static u32 read_reason_pl4(struct xe_gt *gt)
> {
>-	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>+	u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>
> 	return pl4;
> }
>
> static u32 read_reason_thermal(struct xe_gt *gt)
> {
>-	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>+	u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>
> 	return thermal;
> }
>
> static u32 read_reason_prochot(struct xe_gt *gt)
> {
>-	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>+	u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
>
> 	return prochot;
> }
>
> static u32 read_reason_ratl(struct xe_gt *gt)
> {
>-	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>+	u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
>
> 	return ratl;
> }
>
> static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> {
>-	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>+	u32 thermalert = xe_read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>
> 	return thermalert;
> }
>
> static u32 read_reason_vr_tdc(struct xe_gt *gt)
> {
>-	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>+	u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
>
> 	return tdc;
> }
>-- 
>2.43.0
>
