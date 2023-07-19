Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B16EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 13:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7AA10E4A7;
	Wed, 19 Jul 2023 13:21:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D851810E4A7
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689772893; x=1721308893;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SJxxbmY1Pv+clga3tBjaQpEZS8bWBi4t9XFBtGWfLcQ=;
 b=iwfuDNuu90qoRdk/hWejz8VtSwk97jKPErbq1HST+Oy+kjxCo16Pu4dw
 Ysf80OiTc4MXjYJ/HEnxGd5xO1DX/yAFgodfaAztFEF0XrR0pBxQ+I7Ba
 Ne+8B0sirozfCuu5tQJuexUZXh/RT2u7/ydYa8yGU95mVxVa4JqUsR/qp
 zr1/kBJb9vkLdey0GotwTkK30pGhKZzLIdNKj00r27xM+K3vBd78zY1On
 8z5h7l0vSQeSNgiyGrrAXg768VT3jmed9/6uVnxEBadHT3l/riYxAq7Yf
 Uc8V1DNrp80Ea/sxJuqHixxF+jY7M9b68BE80JM1lqQpbjBLUKmHR+yTR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397319163"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="397319163"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837720044"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837720044"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2023 06:21:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 06:21:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 06:21:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 06:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGa83dIsxNHpFncckrb8tlFib0U3RRzzGHp+2qdHt5C6Fc2EFG7mtvgoM4JDKurPqNXgpVMvMKlHX38i6nvo/45YTZyQP7+Ez/pP8Q9eqtJXMlRHeaGOi3pAe0nMWp17yInFf3rqSQ9zaTW9BkbI6l9jlx1lTzaon+htgnbQCW07M5quHJw3SdBjq7kPkR+ph2PuobXOv85fnrFjwI6Z4wCq5C9bDb3gCuL03fKOVwquR7HoTonNmjce6qtViP3TjlYgwvggSByk80q23Ac+zcGP6skAo+8Wfbhzk80iVZ+UwraYFHM9VW1aRdBOqCDge5viZiGMx5FgCU5a4Kmckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1a/qJh5uEeQLPMhLw9yoX5xQ+nNaPU2jfT1DVMNEbs=;
 b=n8im6BUm1WMEHWjivXqLEFm2z5OTec03ObBZO7f3+f4QSOJ9N34dcOgrKtr8hVFJ82TC81wIAFg4FrLPa5UgQc/wZsbPGser8cHZNbOHi7B8OyJ2n3e06RbV8nCNo5dlOtSoERtTveYt+mNMq9zSwPp4U2IAzRFGzEhwHKET/Zu5Qwqe8dOaxN1P8LZtp+nAoNo6qDHSxno/ziSG/YWo1mHrV7ZunSIaDMd/dWSDyDARnY1/1mkSyJjHQXB3MVntvnA5CC6QNTQvykrDWjAq0YcRuRFs8gneVzwKxEN6Pd0TYJ0+OTdxCrje+/+XKaulgmogvSB3eQmAaOkUuu7dQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 13:21:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 13:21:26 +0000
Date: Wed, 19 Jul 2023 10:21:19 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <3uxgqlm36dmsmdyo2hc5yggl4wmxsvw2bhe5ftyru57sviebxo@kzezrsgzdjym>
References: <20230719120958.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230719120958.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: acf5a303-4db1-4cf5-3bdb-08db885b0d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UaaxgqxHTW2cFM2Iv5qCtrpzWP/GxvU2SL11mPNiK3PCxg6HbeKFJU9J8kyS5GAyIOCvOdMEqF36EqUK6fDBmf0mquYQNbjMxxW70HsFd3h8hM8TUxKGhLnZKOvBn1CBNHwnt91yaoRy/kQCtTxNQ+Bu/EGQ4G/gJKr7C8SEbV7X+s1xiKic+PPVHHxm91HcRzbi6YAlUUgMbETCFDjTnnOXM192dCmxAw54dT7IUzzJnexM6X6h6RQXVEXAer66F/OZWBk7ZRPPuCt89H+tysMUNVTYQPlVSG5bLIEia9J8urqQbjgNMRc8QYVmU2Sjj6dB7uFKLv++sTTFRlUPXRPoQPRSOon+K2FwlLiB9yAN8MMdyTXu28r6HnRsH94UmlHFXqxqVhs5Eg5zTU5pyFlDjKSQLCMCOlmcM28p5hZkXRHIqN9kXY/lXq8pVth+heiQKL+gVMpflUA6g+Accc0+JsnY64xRMVhQdJQTb/6HjJ5Zq9AzBnzHzL4hyRCswgqsK7iK9AfpFRBb1LGGAMFrRzgNhzwrWpvpg9pRO2ltzK0/o9ZsAEOYwz66A4uFPOZzBUhNIQSAhLZ4I2mFHtlwBeeJz/Aw4mgmNIr9CdY8GBXHNiKO9fxMSG2BAa6o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(41300700001)(6862004)(8936002)(8676002)(5660300002)(4326008)(316002)(6636002)(6486002)(6512007)(33716001)(38100700002)(9686003)(6666004)(66556008)(66946007)(66476007)(83380400001)(30864003)(2906002)(86362001)(478600001)(82960400001)(6506007)(26005)(186003)(27246005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eqhx1rYghgycBuqMA29b6wr2UjzZJhzfwQcwSs/wCQrs/azHdNQ3KkXLeq?=
 =?iso-8859-1?Q?kATL9ijCwPSp36aG+84YHf2FVqmRYlQ+4n3RjzgVtSbhJ0JG4DGTFAwC1e?=
 =?iso-8859-1?Q?R5eAaEv0yW1HBpKKBGuySd4yNgysID4I5QAAYFzeh88qUCY+RqWM/JfL9N?=
 =?iso-8859-1?Q?BWOGpT99CLHXjCXFFUIU1h59r2FZPMyEJ8ThJftDmlEAfHlhZdIU0crghH?=
 =?iso-8859-1?Q?2vwhUi0jDVmfIT8da5xT8RVbo60m7Bnq9I/yIH81rJGTE1c2pmzdsjHm8M?=
 =?iso-8859-1?Q?JmzhyPALPzicAhCZVC48nmhyrIdxm64sekumvYovoEQZs2GnLuIbdsESSP?=
 =?iso-8859-1?Q?8KJ9Z1fqZRwCKWgzAhVbU197ndu0oraqR8lSTJLINloKUoRbTiK4k2myHe?=
 =?iso-8859-1?Q?MfBbAIXeMuRGtldB45Rn4Sc7Jh1BU/4uhWT7hXeb3XdCmLTXWNxmOKEgYj?=
 =?iso-8859-1?Q?r45HZ/cIoYQiurxmSdCkTnN94pJjsOpqWaycRi03vpSqlfSbENAj8dLF30?=
 =?iso-8859-1?Q?il3XLv4AtuOCchDZI8vp52Q4MsUT2hfxepEq5sBYxYqLvgx9pWT1pg4L+9?=
 =?iso-8859-1?Q?HzjAnMiUnND0dJLI4dbp6Re2CcxssX+EHWghR43shRxSi9M/XuMMztdo6U?=
 =?iso-8859-1?Q?OGlba8Pv4mbWWUw5fMvpYE0KStb3IWfkTGa1YofXdYiu/7iPtDwENElQ0i?=
 =?iso-8859-1?Q?rnZDvFn5GHuMk+jrqfJXwyzpJTOq4DKZ9v2uy85kcOyMGd31VNj07BaiXJ?=
 =?iso-8859-1?Q?x1lq7rClgAcqC42ZRrKNFwAR4a9umKE855lPhaqkiHBFy817+gYU9z8EH8?=
 =?iso-8859-1?Q?MgjMnQy0aXFMdrCFvMhzieSgqkwf9tAbnpZCTKop/RHK9aQw/37pE61cx0?=
 =?iso-8859-1?Q?SBCD4IfAdJlW3zbEPPcdLuxnwWPpG2aq26GcEQDFQ1LlshYn30s988b+1B?=
 =?iso-8859-1?Q?J6hy+AmZ2vaflPTs+podqC2IsYJFuIIXvtEDM6dn+AF3g7Cy7qGeRr/6Sq?=
 =?iso-8859-1?Q?U6bPrqAXtxaDe6ISjlcLXb3q4/7BLSm+HMqdeLv8DSkxLygsRMGv8acl3O?=
 =?iso-8859-1?Q?ZrURWEUpiwNZIWWiSsgW+1qQJSJDSFSfajFhFtdpNe0+morhVBxlymsQk1?=
 =?iso-8859-1?Q?nzTRdB35gM7ZIug+3BTJj00N0j3M43umIchjw0BfvilJCtnaa1HnbmaULj?=
 =?iso-8859-1?Q?h6TJSVC092wF9oPJqKVEdi6/NFpzuct4PofwQR98h/UhJwttVJo2WmxME+?=
 =?iso-8859-1?Q?PjAxV2EMptra0T8/Os7OmqmGRDuuXLpaXqhtWqcMzosypiGVfGimprZrXQ?=
 =?iso-8859-1?Q?/nUp/njd5dArMw708kukVd6ZK76J3ZP7dd7QzgSR/6qZYXV5RkazE0ZESf?=
 =?iso-8859-1?Q?6I7iINyndYTYqiSfkL+6sEeH5ZbryoERdRZv3B5mtJMde27fylWObwWxF5?=
 =?iso-8859-1?Q?jjHCIOTt8q0yEcljyz/ZtOxLxJzqKuzL64UdLBpgXVCLto8MszO7Yimviu?=
 =?iso-8859-1?Q?T5bPSCcplp1pzbXLf8PSbARiPdAwJ27Yb+G8PBqjXruyLtnY3JTHVsgnJp?=
 =?iso-8859-1?Q?Og4nq3zz/rg3wQh41Ai5m2tcQ3ZpybKuowCxrMRzj2fcQEkXUexLqYm8Ir?=
 =?iso-8859-1?Q?ZGtI27oul1Ggs/H4bpp71zGxVb3OvZxOWCwEt9jXBXsRbpyP5h4eHAUw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acf5a303-4db1-4cf5-3bdb-08db885b0d72
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 13:21:25.8101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaR4JVPVz5fdrNGSZWTV7oYb4RpRKuSriWmtqjtEvnHMjqm80XBZCnC/H7ddftuZvQyPB0qaPOyCiTdYtk63QS0Qm4vKhCFz6wzflKjP8RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Cleanup style warnings and errors
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 12:09:58PM +0000, Francois Dugast wrote:
>Fix 6 errors and 20 warnings reported by checkpatch.pl.
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> .../xe/compat-i915-headers/soc/intel_dram.h   |  5 ++++
> .../xe/compat-i915-headers/soc/intel_pch.h    |  5 ++++
> drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 --
> drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
> drivers/gpu/drm/xe/xe_execlist.c              |  4 ++--
> drivers/gpu/drm/xe/xe_gt_mcr.c                |  2 +-
> drivers/gpu/drm/xe/xe_gt_sysfs.c              |  1 -
> drivers/gpu/drm/xe/xe_guc.c                   | 14 +++++------
> drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +-
> drivers/gpu/drm/xe/xe_map.h                   |  2 +-
> drivers/gpu/drm/xe/xe_migrate.c               |  2 +-
> drivers/gpu/drm/xe/xe_reg_whitelist.c         | 24 ++++++++++++++-----
> drivers/gpu/drm/xe/xe_res_cursor.h            | 11 ++++-----
> drivers/gpu/drm/xe/xe_wopcm.c                 | 10 ++++----
> 14 files changed, 50 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
>index 1532ca7e0af6..65707e20c557 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
>@@ -1 +1,6 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
> #include "../../../i915/soc/intel_dram.h"
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
>index 823803f7e853..9c46556d33a4 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
>@@ -1 +1,6 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
> #include "../../../i915/soc/intel_pch.h"
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>index fad4c66a8226..37cba91be10d 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -250,8 +250,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
> 	 * pretend the BIOS never had it enabled.
> 	 */
> 	intel_plane_disable_noatomic(crtc, plane);
>-
>-	return;
> }
>
> static void plane_config_fini(struct intel_initial_plane_config *plane_config)
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 8e086c9bd309..828a9fea420b 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1821,7 +1821,7 @@ int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> 	XE_BUG_ON(!ww);
>
> 	tv_bo.num_shared = num_resv;
>-	tv_bo.bo = &bo->ttm;;
>+	tv_bo.bo = &bo->ttm;
> 	list_add_tail(&tv_bo.head, &objs);
>
> 	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index 46293c9bb6a8..202789482be1 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -47,7 +47,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
> 	struct xe_device *xe = gt_to_xe(gt);
> 	u64 lrc_desc;
>
>-	printk(KERN_INFO "__start_lrc(%s, 0x%p, %u)\n", hwe->name, lrc, ctx_id);
>+	printk(KERN_INFO "%s(%s, 0x%p, %u)\n", __func__, hwe->name, lrc, ctx_id);

KERN_INFO with __func__ doesn't seem good.

>
> 	lrc_desc = xe_lrc_descriptor(lrc);
>
>@@ -125,7 +125,7 @@ static void __xe_execlist_port_idle(struct xe_execlist_port *port)
> 	if (!port->running_exl)
> 		return;
>
>-	printk(KERN_INFO "__xe_execlist_port_idle(%d:%d)\n", port->hwe->class,
>+	printk(KERN_INFO "%s(%d:%d)\n", __func__, port->hwe->class,
> 	       port->hwe->instance);

ditto.

Probably just remove them in a preparatory separate commit. They look
more like leftover debug and these are not even being used. If they were
real debug/info should be using the drm helpers.

>
> 	xe_lrc_write_ring(&port->hwe->kernel_lrc, noop, sizeof(noop));
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index ff4075387564..c56815af0686 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -273,7 +273,7 @@ static void init_steering_inst0(struct xe_gt *gt)
>
> static const struct {
> 	const char *name;
>-	void (*init)(struct xe_gt *);
>+	void (*init)(struct xe_gt *gt);
> } xe_steering_types[] = {
> 	[L3BANK] =	{ "L3BANK",	init_steering_l3bank },
> 	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index b955940e8dc6..fa059326b2f4 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -38,7 +38,6 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>
> 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> 	if (!kg) {
>-		drm_warn(&xe->drm, "Allocating kobject failed.\n");
> 		return;
> 	}

need to remove braces too

>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index ed90d738d673..8ae026838702 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -396,14 +396,12 @@ static int guc_wait_ucode(struct xe_guc *guc)
> 		struct drm_printer p = drm_info_printer(drm->dev);
>
> 		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>-		drm_info(drm, "GuC load failed: status: Reset = %d, "
>-			"BootROM = 0x%02X, UKernel = 0x%02X, "
>-			"MIA = 0x%02X, Auth = 0x%02X\n",
>-			REG_FIELD_GET(GS_MIA_IN_RESET, status),
>-			REG_FIELD_GET(GS_BOOTROM_MASK, status),
>-			REG_FIELD_GET(GS_UKERNEL_MASK, status),
>-			REG_FIELD_GET(GS_MIA_MASK, status),
>-			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>+		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>+			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
>+			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
>+			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
>+			 REG_FIELD_GET(GS_MIA_MASK, status),
>+			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>
> 		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> 			drm_info(drm, "GuC firmware signature verification failed\n");
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index d788e67312b9..803d557cf5aa 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -104,7 +104,7 @@ struct xe_hw_engine {
> 	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
> 	struct xe_hw_fence_irq *fence_irq;
> 	/** @irq_handler: IRQ handler to run when hw engine IRQ is received */
>-	void (*irq_handler)(struct xe_hw_engine *, u16);
>+	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
> 	/** @engine_id: id  for this hw engine */
> 	enum xe_hw_engine_id engine_id;
> };
>diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
>index 032c2e8b5438..f62e0c8b67ab 100644
>--- a/drivers/gpu/drm/xe/xe_map.h
>+++ b/drivers/gpu/drm/xe/xe_map.h
>@@ -1,4 +1,4 @@
>-// SPDX-License-Identifier: MIT
>+/* SPDX-License-Identifier: MIT */
> /*
>  * Copyright © 2022 Intel Corporation
>  */
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index f17de52b51f9..444127f37103 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -475,7 +475,7 @@ static void emit_pte(struct xe_migrate *m,
> 			bb->cs[bb->len++] = lower_32_bits(addr);
> 			bb->cs[bb->len++] = upper_32_bits(addr);
>
>-			xe_res_next(cur, min(size, (u32)PAGE_SIZE));
>+			xe_res_next(cur, min_t(u32, size, PAGE_SIZE));
> 			cur_ofs += 8;
> 		}
> 	}
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index ea6dd7d71b59..e83781f9a516 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -89,18 +89,30 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> 	deny = val & RING_FORCE_TO_NONPRIV_DENY;
>
> 	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
>-	case RING_FORCE_TO_NONPRIV_RANGE_4: range_bit = 4; break;
>-	case RING_FORCE_TO_NONPRIV_RANGE_16: range_bit = 6; break;
>-	case RING_FORCE_TO_NONPRIV_RANGE_64: range_bit = 8; break;
>+	case RING_FORCE_TO_NONPRIV_RANGE_4:
>+		range_bit = 4;
>+		break;
>+	case RING_FORCE_TO_NONPRIV_RANGE_16:
>+		range_bit = 6;
>+		break;
>+	case RING_FORCE_TO_NONPRIV_RANGE_64:
>+		range_bit = 8;
>+		break;
> 	}
>
> 	range_start = reg & REG_GENMASK(25, range_bit);
> 	range_end = range_start | REG_GENMASK(range_bit, 0);
>
> 	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
>-	case RING_FORCE_TO_NONPRIV_ACCESS_RW: access_str = "rw"; break;
>-	case RING_FORCE_TO_NONPRIV_ACCESS_RD: access_str = "read"; break;
>-	case RING_FORCE_TO_NONPRIV_ACCESS_WR: access_str = "write"; break;
>+	case RING_FORCE_TO_NONPRIV_ACCESS_RW:
>+		access_str = "rw";
>+		break;
>+	case RING_FORCE_TO_NONPRIV_ACCESS_RD:
>+		access_str = "read";
>+		break;
>+	case RING_FORCE_TO_NONPRIV_ACCESS_WR:
>+		access_str = "write";
>+		break;

these don't look more readable now, but..... ok


rest looks good to me

thanks
Lucas De Marchi

> 	}
>
> 	drm_printf_indent(p, indent, "REG[0x%x-0x%x]: %s %s access\n",
>diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
>index 2a6fdd284395..dda963fe3300 100644
>--- a/drivers/gpu/drm/xe/xe_res_cursor.h
>+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>@@ -51,15 +51,14 @@ struct xe_res_cursor {
> static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
> {
> 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
>+	struct ttm_resource_manager *mgr;
>
>-	if (res->mem_type != XE_PL_STOLEN) {
>+	if (res->mem_type != XE_PL_STOLEN)
> 		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
>-	} else {
>-		struct ttm_resource_manager *mgr =
>-			ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>
>-		return &to_xe_ttm_vram_mgr(mgr)->mm;
>-	}
>+	mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>+
>+	return &to_xe_ttm_vram_mgr(mgr)->mm;
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>index 35fde8965bca..d9acf8783b83 100644
>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>@@ -47,12 +47,10 @@
>  */
>
> /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>-#define DGFX_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
>-						   for 2 tile PVC, do a proper
>-						   probe sooner or later */
>-#define MTL_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
>-						   for MTL, do a proper probe
>-						   sooner or later */
>+/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
>+#define DGFX_WOPCM_SIZE			SZ_4M
>+/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
>+#define MTL_WOPCM_SIZE			SZ_4M
> #define GEN11_WOPCM_SIZE		SZ_2M
>
> #define GEN12_MAX_WOPCM_SIZE            SZ_8M
>-- 
>2.34.1
>
