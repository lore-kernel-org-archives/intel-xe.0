Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C14C77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 07:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A751A10E4E4;
	Thu, 18 May 2023 07:38:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACA510E4E4
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684395537; x=1715931537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dtsfhM5vbcsMjoPZAB2HK0rAkzIjrBmc0TVB5GGkFH8=;
 b=Y1viHtWSdmJOcWutV0MarVhNawOrGkPfvFHoHSp59CwjG7qnkbGvdkFJ
 y6xtVXKY6xHoIIcE4E0YH/sJPN7sMWlyVasvEKh6uznP9kYIjqtd7a/UJ
 EVZB3W5nZw5Ro5imMK4y2xkfh7frVTC+Gv/LGIHBt8MUVtc9CcaSmQhTp
 jaAy8dxeiHRuC8m86EQbJJGGptOJaXShzrwOyZJqzTSjAV8j9Scr1fYm6
 FpNkNPCk9Wpn5ZIZz5xCITGtQWAl1+H0bc5qpqUdlJGuuYHre206F1uOK
 Xydp8Zp3BOexqJQkefOLM6v0FhFvqQ+TqLuCvwEVPwnvvte96zQSlRiNo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="355188572"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; d="scan'208";a="355188572"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 00:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="679579078"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; d="scan'208";a="679579078"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 18 May 2023 00:38:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 00:38:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 00:38:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 00:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO9jLK7Yp9ZJ5J5X/U/LNSXOz0bHoVPQ3nUGKPFV7gtge9URollKOxRf4+wDrYSqx0gojgif3eu3ibhGOGTNeJ/37W8b5a19grmTeSNTFAB/kBuHLyky984VJK6yPfct8kqOHfuyofMcn5eTBt8K5EneakGszHdQ/YNLXH5NLFnRSr/AstuakfbuY/tIKYCkooG0+qemGQMTQBuE8AclscnqwORFp/EhcckClECBf4uTYFoTDpKqoQpoLa1heSXt7S14Xn1aF5X3tbmOcKKDYPyIBRcJhhmJKcPDAj/ovN+a3KUz9d8mOUquQhjzGBRzRCjTp7figlPy/rh7tv4/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXz2gRWJLCLjA/06krTNufKMM03ghpO4kjntuhU2MrY=;
 b=l6cQ/qc+dtf2VFiG3qoE5XdWmJFDZLFuBl4J49TP08MBlzsV72ckzr5TaWvBDBNMmhTYy9u85ix8Be8RUBSAvPlQNxyPyDXbbVAk9Y8jF3k8zfsP9fg6CJGjX4rZXHV4J5x5iBnqRQZhQAZkRzoEBlFbsJSlSonqQfoF0G7YaWrP178OHMJYeEhPIpFgy0KvonKEZ/TfCe7Me4ZGPPK7tL/7YIy+EYxol8eL33R7llxyZg0uO5C/B2T5VA3u+FUMj+11+YNAmPldtevipfyzEOvFvHXkQDddXKz40OijF8E1rQDIEYJ7U+66pbalZqq+JWm+c2b+zdezuV7yFK6wMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 07:38:53 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 07:38:53 +0000
Date: Thu, 18 May 2023 09:38:45 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230518073845.GA158639@kav-xto-001.ka.intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
 <20230516145416.1851984-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516145416.1851984-10-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: LNXP265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::20) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|CH3PR11MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 867d61f6-7b42-4f3b-dd5d-08db5772ed2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UVBNhMDodI+VegzelbsCJJpx4Wl7QqqgqfFAducZgX4HzTJ0ruxRLYGHfaXAAFN6UsTt/JohHy0mmACFv07LxmHu/c97hBdKqGW7JWc/3V2CmLNYUdu1s4Tnqs505WiAkeW5alCttoOyB0lS89xZmD5PE5kARJDdOulzT+0LQI9yxbz/+ytOyhqaG/njdLbIz24Rifk1U6Re7Uv9ydhggPqSfv4rzQtXlycNo0+bwmGo1CdWpBynCZbwZbCT+dBngnp/jQtOpCvbSP9IeD2nP/dZ6mRi1WT2Gpq+1Bc2200JOuOR8DSREPqmYfbCknzfDyynG0JJpiZHLbR9vKto3DeZKzHWyrSUNrHmoE+BxP+81Rx3vx0eZBKTXoxpvUim9oDcwM2DFEhHQE9zTN2qzFhnyljuZ2//WL+2gQjEz36Ix47ehiB+4Hc4OpWTwW/SJH77rNiSnANjODbiKd4sq9pLm+6V6d5Mav1e9XUnrVBnbvMdML4u6e8H36kMlVneRe0dSgq4G+EuFbieGHEhTgMMvBObnMnpymYP1STiVaFbHfidvDDiGG3/Rxxvmh1h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(26005)(6512007)(6506007)(1076003)(107886003)(36916002)(33656002)(86362001)(38100700002)(82960400001)(186003)(6486002)(44832011)(478600001)(316002)(2906002)(4326008)(8936002)(6636002)(8676002)(6862004)(41300700001)(5660300002)(66476007)(66946007)(66556008)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a0A+04RTL1EdXmghrBYNjcqKfzLrU6CbP1pdGhp9oQ36bwmCuY3EMkHJiinl?=
 =?us-ascii?Q?ItM0yv+YYI7hGjBQlM7iCtxukQT3K5Gta4UXKMTaV2T9JCQh6XUMnAJZTRye?=
 =?us-ascii?Q?Pw6GqgVFMH/NSXZ8KlWrKJQHu3Vpe/c+xbC/PB9FVSO0l+YCKRcmWoyQqNKt?=
 =?us-ascii?Q?I2Aw/HmOK0K/2k8zy+xIVGky6nC9/tTj+0Kn4rDGcsOhSJslrmpWBpwEAXX4?=
 =?us-ascii?Q?Sq7V7YIT0TU58dYdHDACKwUxKzWa/lq+nun9J/HA14Zu8KUcG0jewjKRuqrK?=
 =?us-ascii?Q?xd+QGLqNLl/lG72dXPdariTkTFfbor7Ay5RlcODYc/sjiRqpKRo8vuF6ZQ7+?=
 =?us-ascii?Q?F/Q+YFFOIu7vOEYoj4c/xDdzYq2r9NkqKNvUUEhrejjlxALC4VLV0eqHenHG?=
 =?us-ascii?Q?2vgEPbrmZuL4tbz5oXMmUfeG2pY2fQPNzKUhI8qU7WFPH7uMtdDx/kLBAoaV?=
 =?us-ascii?Q?x0mm86d0fdLkszftNVa+5YzV34QMbXi2g2y5TXh4npUOPiwXDUDfwliOUrpV?=
 =?us-ascii?Q?r8i1a11vGLuL6rYvUk36aD68xbEgjc689cYZ14ECYLmHvccVMsGc+XTQ6uLp?=
 =?us-ascii?Q?t18d8zrp890yZ0iFtC+mRng9bYVp5d7SOdfgqLRC077DaZsIOAwgwiBEJSd0?=
 =?us-ascii?Q?Ou5AcnzbacoiRn9HPeBbdLT6fk91n3PZN1aq8z7o92ppK7+RuAJdUH0BtudD?=
 =?us-ascii?Q?O/gO0comkFqBDuGg+P+wBy1GMD9aJyYJ9hARV2KftUGvGwuhY0/jlOqr0ICV?=
 =?us-ascii?Q?XbI9tATdPYEYKH5OXnvAmYECONGT0yUmHJOo8gwk/QaCa6ldiAu1nbw4nQAT?=
 =?us-ascii?Q?cV/sGQgDcnGfw1IAoxHT6f4JU/UPLB4G4t82SusmlxUGyjDV8PYNYdnyJgyD?=
 =?us-ascii?Q?CDzzzUj/3Xdv1vDuaouzjOwLRV3srKHWeVIxoLzvSZWr5DglJBbv0W7NsfrB?=
 =?us-ascii?Q?8eiFpj1h9ukY/po1CjIhvyw90CEHZlJA197pe7VYWUh7H/wAZSYwo1ELdklj?=
 =?us-ascii?Q?yqLFKxdvfkJMh05MsPqg9jnlbQwApuj50JpwsrXe3Ychmoys+Z6XAkRfnIRd?=
 =?us-ascii?Q?/Vh3mK8luF6vhtLivbPj/sb92Du5QB3wPVURVOrpTRdXvQCBJ9GyGhd+Ree7?=
 =?us-ascii?Q?VDeycynCE5Vr9E3mKtpWoJZYq4E4ZpUOSO8WbtjF0er/8Wxfn6h85SDOPca9?=
 =?us-ascii?Q?16bert6OjVNXJ10ulzR+E/y1QxtdTOSVDPKDxt1ikAxH7Um6wK/ry3eaqE5p?=
 =?us-ascii?Q?vtHYpMpk3LeLLgvqzVLBH9Amta8Hsfjyj5FD4TByfbLYKrXJD5ctspVqpyV9?=
 =?us-ascii?Q?uv8+O02s2ojw+Nni8OJLjkfrkJZaFZt4QaruYEKJZSFrwgPHnhHfU4M9bEN3?=
 =?us-ascii?Q?46zX/UYGiRlVAuwtgMlO46yaMlKCf7ZtYgsuUdz8ww/cVf9gWJc+gItIomSy?=
 =?us-ascii?Q?KS3CajRTo0P52FBHOwe9Eg4wWy8w/nR1uSgSsNawh4HcaxD4LMPECbvjLyuv?=
 =?us-ascii?Q?emt55f8/Mx1toysvpvC77dkaTXfGomsTItKckXRM46j8gN0kY4TVWT9epbr2?=
 =?us-ascii?Q?bZ09UGUJcPwxTTzci0I89ddZJpDmMdIphl4RMbpUN7Dun3z33VXW7NEvh7PZ?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 867d61f6-7b42-4f3b-dd5d-08db5772ed2e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 07:38:52.9241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/lqEk+yu1F9/+tNHtKISnOBF6G7XzD/QlyV9se34AFJGkJJTWVp+kw9LRlecIG+e8k7YusvN0T2xzjWm5v2PrZvtM5H3KgkignFoj7JViw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 10/11] drm/xe: Add HW Engine snapshot to
 xe_devcoredump.
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

On Tue, May 16, 2023 at 10:54:15AM -0400, Rodrigo Vivi wrote:
> Let's continue to add our existent simple logs to devcoredump one
> by one. Any format change should come on follow-up work.
> 
> v2: remove unnecessary, and now duplicated, dma_fence annotation. (Matthew)
> v3: avoid for_each with faulty_engine since that can be already freed at
>     the time of the read/free. Instead, iterate in the full array of
>     hw_engines. (Kasan)
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 41 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 2da27ce6e116..6057649f1d3a 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -9,10 +9,13 @@
>  #include <linux/devcoredump.h>
>  #include <generated/utsrelease.h>
>  
> +#include "xe_device.h"
>  #include "xe_engine.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
> +#include "xe_hw_engine.h"
>  
>  /**
>   * DOC: Xe device coredump
> @@ -63,6 +66,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	struct drm_printer p;
>  	struct drm_print_iterator iter;
>  	struct timespec64 ts;
> +	int i;
>  
>  	/* Our device is gone already... */
>  	if (!data || !coredump_to_xe(coredump))
> @@ -91,12 +95,19 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
>  	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
>  
> +	drm_printf(&p, "\n**** HW Engines ****\n");
> +	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> +		if (coredump->snapshot.hwe[i])
> +			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
> +						    &p);
> +
>  	return count - iter.remain;
>  }
>  
>  static void xe_devcoredump_free(void *data)
>  {
>  	struct xe_devcoredump *coredump = data;
> +	int i;
>  
>  	/* Our device is gone. Nothing to do... */
>  	if (!data || !coredump_to_xe(coredump))
> @@ -104,6 +115,9 @@ static void xe_devcoredump_free(void *data)
>  
>  	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
>  	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
> +	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> +		if (coredump->snapshot.hwe[i])
> +			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
>  
>  	coredump->captured = false;
>  	drm_info(&coredump_to_xe(coredump)->drm,
> @@ -115,14 +129,41 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  {
>  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>  	struct xe_guc *guc = engine_to_guc(e);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	u32 adj_logical_mask = e->logical_mask;
> +	u32 width_mask = (0x1 << e->width) - 1;
> +	int i;
>  	bool cookie;
>  
>  	ss->snapshot_time = ktime_get_real();
>  	ss->boot_time = ktime_get_boottime();
>  
>  	cookie = dma_fence_begin_signalling();
> +	for (i = 0; e->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> +		if (adj_logical_mask & BIT(i)) {
> +			adj_logical_mask |= width_mask << i;
> +			i += e->width;
> +		} else {
> +			++i;
> +		}
> +	}
> +
> +	xe_force_wake_get(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
> +
>  	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>  	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e);
> +
> +	for_each_hw_engine(hwe, e->gt, id) {
> +		if (hwe->class != e->hwe->class ||
> +		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> +			coredump->snapshot.hwe[id] = NULL;
> +			continue;
> +		}
> +		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
> +	}
> +
> +	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
>  	dma_fence_end_signalling(cookie);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 7c6453224139..350b905d1797 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -9,6 +9,8 @@
>  #include <linux/ktime.h>
>  #include <linux/mutex.h>
>  
> +#include "xe_hw_engine_types.h"
> +
>  struct xe_device;
>  
>  /**
> @@ -29,6 +31,8 @@ struct xe_devcoredump_snapshot {
>  	struct xe_guc_ct_snapshot *ct;
>  	/** @ge: Guc Engine snapshot */
>  	struct xe_guc_submit_engine_snapshot *ge;
> +	/** @hwe: HW Engine snapshot array */
> +	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>  };
>  
>  /**
> -- 
> 2.39.2
> 
