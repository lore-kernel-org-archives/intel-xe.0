Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AB1C5DF8C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 00:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E0910E041;
	Mon, 24 Aug 2026 00:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+/2sxXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4519610E041
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 00:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787533154; x=1819069154;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v3/f411WkdA6y6IhTMUpbCsukndDklzHx/BsOkjGqAI=;
 b=L+/2sxXqM0nkV+bwsfVReNxOXOa9KDkPThN87qiR/pDi+FpKFNMYKTCP
 ZFhbk9EhVmPz13PYpY2v2pt3ljFVNS/goY5qAO1i/DGzGs5f0ttOg/eoe
 fdNB+oaa7NZztWruIq+aum3TxwRvXYTTrh/Hs6EYLc9A1R0VgtnO7heNm
 56HDSXx1uCkwObWwT5zu/bPk1EMqD7EEG+vLNXjU9Ncu2FafkOBRqXBYR
 9uJI2G98Bqk/Ad7mSrmXQqTa4+o7hAqMxjWcAD90p7O1+3EnoHqhNBNUz
 5SVxBAFOCYS+RpycC52vjtDd/NhFn5UxPEMBJp1v+IebJZp4NXqWA00ki w==;
X-CSE-ConnectionGUID: MYeo+ZhFSSC1ImhvBDaHfA==
X-CSE-MsgGUID: Ehz0PXgYS8aYhnbqpHHcdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91791799"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="91791799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 17:59:14 -0700
X-CSE-ConnectionGUID: FdVmuToaSiCMcw/REcyt/A==
X-CSE-MsgGUID: fSvGJjgZQKCCjlr6QFBf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="291697057"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 17:59:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 17:59:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 17:59:13 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 17:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ot85dPG2XzS9Zz82L5r9Kl/N4QBVC2WrocqUNHULIC1mGuyJ5tNhF9Lu0iGTg1lcjK8t0spGEN3xp30B5/MBZY9gdsVFYQZ8PAm8vxReqvNOrp4rQJFYFfRxzflWYN8tNv2w0Naji/Q1JEz65DoEu35hi8NJFfqCxJ/YwFZEVkNd67+BzhW99b/M0VZlWLdkirfH6W3HUVsS4IFaPvWq5xvZH0CDUiSNYGMbOsgyAP/p2xkAVa1jbET3unvE/QO3TBkEcZfR8AujLeWJwcoWA52DCTtcnA865H73M26nhkJoqDsAAcYUpcrW2nesmcdnzcUePnCo21u5sstijRRkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/RHzlOxAQj9j6/Cg8ctpL6MZ+AXEEtSH+v7+ApVWGE=;
 b=As++mxBtOG16OX8dnmXR/1EYUiXQ5c63SYHY2KzzMBRfFscoJDlGEVNn05hRFRb7YZ60Y3TR07xvOX4Gt08jmaGlEABb5MKRLmrI6JWA4sC0uZvR4OyAOZkpSCdTSLjiipDYFbJxAec5PmRrS1WShT0QtxIIdJbn8gae0J/VT0Hx83k5pcDjNSducb+fKcffnRsR5GKX5ixwfURpeHB7BCd4JZ0oa0AucbGgSADKOyeFaOn9fsIn2LYVy09LbnwiwAOQxyU4uHdKy/FsCoMvijs7nOY7sWrBaYBy8UiSNd/CrG/jnZ/wTwasKH5v8qAiytA5PoKVyznbFQpc5rc3Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 00:59:05 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 00:59:05 +0000
Date: Sun, 23 Aug 2026 17:59:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add FULL_INTRA_VF GGTT
 invalidation helper
Message-ID: <aouXVvYtDzpJFDF4@nvishwa1-desk>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
 <20260821074238.3000501-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260821074238.3000501-3-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d3b19d-d3b3-431d-7a27-08df017ae553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: czLMFif8rPxbvdehNvg9SQb8KzyExwEGjirhb+uUoqrJ9ninbWrwWwr99pJtN6/WJtAwY0Je1jdfJmmXd+d4OiCm6CTryj6ThACjYDojFmhyrs49SdEEtGO2/3/UZBohXpdswXpmRj2FFOX83NWQ0IF+ePCZzKI9YBICWkID0vXtqkwk+ENp00WRgqAqv3fnJpWB6KujR4BWhOSGIPYb+eqN1NkxGlHYZwqb4I54T9F16xlHrjCbOGWQoMM3yHGyhkh3RxCdU84263wbTf560vGP2heMQEmFtuOM2+fU1iTSZa4XUoydVi22LYDwUR+cjz6wh7vGAGza2szSErxvIUj5ilXcJblGGM7CXo3EIh2wNCUHmWjZgLVH3UrdCw+UClSD0DBdP/bNxhitzeeQHjyrgUlPFGLNRMauuuOn5UIHPlbqoGVS/0GoF0Gj4ibYtcYLfnC9kRISmrZKw/wYNneAJ4jqysELCmB5oEgVwIGGqpjsxyextKApP3wMCDToXi97NUffxpsVTFuXTIsd+fnN5oypdKRc66fdaZXCChulK7CLFadzhJDV1B1nhVNQoTNpto9B4dHaxwBvXiFDJikhKjI78sSRpYVGhMcdsl8mwaJYmV5sapZjC9AlFowzwSBKgNM2A9gxLdFy3y6+ZIavl+YfcbLOSLpZcmF7XGI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zk6dEsYRDIhYXEg8t2mjtXpKwhGMv014kOEP8FQMU2i2w5l2KIvzrlyqCQgE?=
 =?us-ascii?Q?q/h8GybLiCOCNQOIxwivGhRCZ+9mTmkWm5YaNsNoSkV6a6orcWB4JLjKuSd4?=
 =?us-ascii?Q?+qsFRwXHxSvlXP/7u/K9oHCZejAMwBnw4oCviZ9aOVZc/vAZcQLnhoONzNoF?=
 =?us-ascii?Q?HcxxN2tEObDKWO6Jcoi88FCljRkWycBAa2LJoh38wVBUdE8f76GTAjkEG+Ut?=
 =?us-ascii?Q?2hEXqyzAkJ9N10LTfary4wCSEt/IcA21JwH47b5YbhKv5hpBK6rZQdywQEPX?=
 =?us-ascii?Q?URU3g2wB9dlDKXcG4m9SxF4KBi5yWq12oaKm9GEEpRTIUOSXvNCQVYKYKRgE?=
 =?us-ascii?Q?JPJnaQBguM8ZM7VO+wrLS4JMX7zBbDTCc+AJ3XDLe9OBR6cVQ+a2a/t8EDsv?=
 =?us-ascii?Q?ut40tq+ifAx9jacvINYGRAe7i/TiONnVseWuhOVeb2mK41meTWmGq0t45yt2?=
 =?us-ascii?Q?St868NrScw4CBDTM1mRy1mlqdLntbmLbXi5Gghj8cjnxtmKLGT7lbmj3lTmT?=
 =?us-ascii?Q?sjLnDBpdlcCIsttr9OnKKiu0fu4lpV9BFmVTQohUwYFpVuv+5RUOJlJ3LIE6?=
 =?us-ascii?Q?FdkpZSMj0xd0QgEbSktQ8GSg25gsR19tT6iHuwxIR1L2dYxa3aQffGkQzIqW?=
 =?us-ascii?Q?e+4KTN9Rd5QxZ5YaQGgSTYB+LHarf2uDvnAmSy6EcnKdnwccJx4JybZUXA5X?=
 =?us-ascii?Q?I4VBjB/0eybm7aFDy9Bwpg2tBoJW2jzOpyn5Wkv0YgBf7Ar7QPYTnNjf5JQh?=
 =?us-ascii?Q?2desMYjELJ6nkCcvgX/VzKzIbqcRwvZ5ybvPWTcwV8laWKFWzf/Y5wcvRa61?=
 =?us-ascii?Q?HpEH6xRiNUYS465Zh9tJThxyzVDFD1w/1Ta7l0yo4qGyWg3Ye2Qj9rWvh+sE?=
 =?us-ascii?Q?uWJ5YQ/tCfg0Ldd4YSocI62ohSKTOjzN6HIt2R+QT6AkIrvVAVeOLQef7AVl?=
 =?us-ascii?Q?x4FyLO8M7Kmb9wVzP59G+lY1BBDsfURt3HmxhIXDiopDqYuXDDy5iBUZnNKu?=
 =?us-ascii?Q?ThJTBJKqKeUCqnNqlUdUZcI+2hdbrt6N4M2GjHkleJ2FzNNssTQZvhrxV3gk?=
 =?us-ascii?Q?RkJNri+mBajT6vy8ZBL0gTcgcXvr7alJFRomkz172p6i20yOicq7947WE31S?=
 =?us-ascii?Q?Z3NiWOGMhiOBlnizGk+bXzZ/TgUn+xeffmrSdJvCSyGeGgwjsD9lG6SYgzAd?=
 =?us-ascii?Q?bpIV38xoXC1vPwfKqbkCyHBxayupE78OTA+pn6qG7939L+KlJckH6V4SGhgN?=
 =?us-ascii?Q?QvCuMf50B52/1tbAHpMreAYvJyEUSrtp57/dsVg8KjhmWUDgv/xHYF0dsvfN?=
 =?us-ascii?Q?YCHiN8XGaI+xEYzfeE5d5gh5lXmfR1DnN8F9IoZZM4+J+Bu7U+soITO2BoRS?=
 =?us-ascii?Q?cYo1qIj0HUZi6DU2MpYmyX0FNjg5iKdbVGtI7eSyYyQuxz6fqovDCUKb894Y?=
 =?us-ascii?Q?q3l18uEjVlvzmcLYAvyW5NPsE1U3Bk3dLDaOcO1OqvcugInv8d4bwf3XlCsU?=
 =?us-ascii?Q?xVrwZ7zL7poqOj8dHGWcGhRrU1VN86awhg9XnALgd9CTrrRQ7iBfmBhWG8P1?=
 =?us-ascii?Q?O3a3Mbhw/zn2x7GR61DgFUSY8AWNYGaNMlkoGRe9Cm0aE5Wvd5Xcu3BpfzoW?=
 =?us-ascii?Q?g9kc1cjQnj462ltGMsuo3WfuWknqjHbguc8sZBl+hroIkLpYCVDqr17nK/BC?=
 =?us-ascii?Q?6KYqV1XPhdQ5iS7ZXnjBCxD6Hn7Z9ISuwP6Bv7dC11ncJL+GBsjA36XvTCiv?=
 =?us-ascii?Q?nMgtqPTPa6q5Ih9EcLcO3ljJVLxtLKDz2imdaisWTd5MQSV2hpGE?=
X-Exchange-RoutingPolicyChecked: SPWCAjkURldrkS2yPZS1sueq8xAULX3BBBs9k1qfgT5SbORGjxHIRj/uPjlQrZ8EaIqnbQgzYjW9YM0ulfwdSqoHnkLKEiv+293s1RdXYCTXXTISlWzc2RCiNli0DcQil2ciDtwUsQ7MNOjqZhnS4aKfC/l7Mk/lfUxIXTltNfVmWsy5ugwREqloTYR1SPAGlUTqapc4ra0gCqC1JqF0+sMQ+vvzE9EHHAF8qo3Ejl8eCaA+fmgroq7u+ADzNmLFGDT2b4lLlXH9wjZee/FNDLkBn199kp4Wwi8/+w/iQAxR62PHaviUgHUwdBIOI1HhAW+9J2pZgeyi+oTuEFXCTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d3b19d-d3b3-431d-7a27-08df017ae553
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 00:59:05.6051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RDrlrmM2KcnnsIMg/nC6XlqLadPYKeSrz+KyU7zslFvQYgC3qgh3Mpm6PdvCMuVnQ6UtMxz7xw977sGdxZj+Ev4xJAvIjbeeyKICfBB8BhJX+KL+Iq4IOQAR6TwoW6X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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

On Fri, Aug 21, 2026 at 01:12:37PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Add xe_tlb_inval_ggtt_full() and its GuC backend
>send_tlb_inval_ggtt_full() for full engine TLB invalidation
>within the requesting VF partition across all engines.
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.c       | 25 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++++++
> 4 files changed, 57 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>index 046d0655122f..9c7a02827902 100644
>--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>@@ -98,6 +98,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> 	return -ECANCELED;
> }
>
>+/*
>+ * Emit FULL_INTRA_VF to invalidate engine TLBs across all engines
>+ * in the VF partition.
>+ */
>+static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
>+{
>+	struct xe_guc *guc = tlb_inval->private;
>+	u32 action[] = {
>+		XE_GUC_ACTION_TLB_INVALIDATION,
>+		seqno,
>+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
>+	};
>+
>+	if (!xe_guc_ct_enabled(&guc->ct) || !guc->submission_state.enabled)
>+		return -ECANCELED;
>+
>+	return send_tlb_inval(guc, action, ARRAY_SIZE(action));
>+}
>+
> static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> 			     u64 gpu_addr)
> {
>@@ -346,6 +365,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
> static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> 	.all = send_tlb_inval_all,
> 	.ggtt = send_tlb_inval_ggtt,
>+	.ggtt_full = send_tlb_inval_ggtt_full,
> 	.ppgtt = send_tlb_inval_asid_ppgtt,
> 	.initialized = tlb_inval_initialized,
> 	.flush = tlb_inval_flush,
>@@ -354,6 +374,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
>
> static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> 	.ggtt = send_tlb_inval_ggtt,
>+	.ggtt_full = send_tlb_inval_ggtt_full,
> 	.all = send_tlb_inval_all,
> 	.ppgtt = send_tlb_inval_ctx_ppgtt,
> 	.initialized = tlb_inval_initialized,
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
>index bbd21d393062..aa12c7d95448 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
>@@ -321,6 +321,31 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> 	return ret;
> }
>
>+/**
>+ * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within VF partition
>+ * @tlb_inval: TLB invalidation client
>+ *
>+ * Issue FULL_INTRA_VF to flush engine TLBs of all engines in the
>+ * requesting VF partition.
>+ *
>+ * Return: 0 on success, negative error code on error
>+ */
>+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
>+{
>+	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
>+	int ret;
>+
>+	if (!tlb_inval->ops->ggtt_full)
>+		return -EOPNOTSUPP;
>+
>+	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
>+	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr,
>+				 tlb_inval->ops->ggtt_full);
>+	xe_tlb_inval_fence_wait(fence_ptr);
>+
>+	return ret;
>+}

NIT...it is lot similar to xe_tlb_inval_ggtt(), may be abstract out
common part?

Niranjana

>+
> /**
>  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
>  * @tlb_inval: TLB invalidation client
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
>index a76b7823a5f2..665072b4b81d 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
>@@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> 		     struct xe_tlb_inval_fence *fence);
> int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
>+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
> void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
> int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> 		       struct xe_tlb_inval_fence *fence,
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>index 3d1797d186fd..02a356bfef47 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>@@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> 	 */
> 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>
>+	/**
>+	 * @ggtt_full: Full engine TLB invalidation within the VF partition
>+	 * @tlb_inval: TLB invalidation client
>+	 * @seqno: Seqno of TLB invalidation
>+	 *
>+	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
>+	 * failure
>+	 */
>+	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>+
> 	/**
> 	 * @ppgtt: Invalidate per-process translation TLBs
> 	 * @tlb_inval: TLB invalidation client
>-- 
>2.46.0
>
