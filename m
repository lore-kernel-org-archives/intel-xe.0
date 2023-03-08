Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BF6C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C4610E740;
	Wed,  8 Mar 2023 22:33:58 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B24410E0B5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678314837; x=1709850837;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CPosoJX9u/Ci3K38cyioIrJNP1Exa/4kfDHHGM9uGIk=;
 b=ARmwicEsqKXW7E2X1TFCc3o9/21Nzp93NoOYjCOKFJczKNLjgglVEozD
 U4a+3grKdHX43IBNWWoYrVn48spvde1dsaX1O5ttx8Cb/+X5c/VWi8KUC
 lKa47NTMGeAQK2FxnbLQmv9iSOQZHgBZV/Gzv/hPxIqg3PHGWCgbsbkaf
 o6qmeSiFoxhjX7x/vyQOIoex7Y3p108QnmuDFwK2pVXirzzXrwUlExktU
 WB4ZeVokKdNgEShThzEgXH0uzKOOLalAezByrY2BURvfm/rzVmE1DlCjj
 gdLLFASYTlXfUCfmtKfuJW9+t2T7A1QuuA8K+7PeivtTs0KzYcrv32LeD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316684949"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="316684949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:33:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709608667"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="709608667"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 08 Mar 2023 14:33:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:33:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:33:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:33:55 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:33:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYtw8EMR/kxKBNq9Z6leyZd1JvM7OsTQZ6DXAjlZOSutS2kinkG8ebYuAD7KsKIs2IzgTxjK2p1coBHTY+IGUfA3poYZktZL+7OqSrCMRCDEXFzMhWIQdh0Idor90VurC9r21O0MCQ/cc5tEvwDLbL2+VC3vuZm/p8GhFjj10vOyIZSMh4rhKeveaeqUoAuugH1OqBQTPQniZc456DUhN0ZpRg8Am7KJxygvziZnk6eGhXCZeewmfUaaJy0CjeuK9aPlRyjBCqa0wLh2YRFbm1Nj5Ht1VK+3eT434WPtFzmWGCG4NcgrDFi/ol/Y5SsGCEW/n+PgiWhg2xa7u420bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H14HGLgr0tdgslsFd/hfe74k+pfEBm1/VuZK8eypAq4=;
 b=CWeEcixjH1nIhzC14TOt1KyLvUUA72cQ7l6aCmfVcKoYVk/h383mfrDTzyOn7BLngaBUXG9ScIbLeCcIi1fpQ66bzlGKtfNl7jO+M640gFn2J5g3xD0MAOh5g6+4EMOwuxKaqb0afmoOzuWPV/LeQJETA9C5PaK1iC8vwraH/N9P3WfWACsw9EKbX8aqZvbBRwDJP3XabWV+D6kExVC7G91pHitq/txgCeGC6WI8gP0To6QUwr4ITwNVys/o/cox+gFVRjS3xGnkHaD2SJsCzveUnXy7psu8uUDgbZwS6j/Gw2K/xWXEpX2IUQX1bkbQjMk8C4vkMrFalACS2g1G4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29; Wed, 8 Mar 2023 22:33:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:33:53 +0000
Date: Wed, 8 Mar 2023 14:33:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308223350.GE1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b796d7b-4e4f-4b96-dea3-08db20253232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fe0sMu8o8Aj0SDWePU7LWLFyMPcjw390zoxJQ8pefcXZfhwOLSS0iOFp3q7ke6WKVk8LCK+RNpxbBTxDxCuX2BTCNCExowGFzXPUiI4ghYiyGJ7ythUi62T39QSzPxGVoa96XEHVSHvTGcPSGhRbbOyCzXk9YAeWfwUhlJIWnMDFTXIRyu+y2CbxqkxAfSaK5yxi/A7+QOwN+3FyJ9FjyVhkOvf6ovYYWuukJB8VTLCakDlwAjxTgMGkJBORg4wt6c4bx3BTvktz/B0GTzIBzZy7T+K16ljGKOFri0ufzNZsBrE90j5tBdbgcQcHeHrUO9DgthmVt+ODAurisN/RPFQerIiBtcL2JC2wCPN5RMAemQCN/p+OjGWdGXR+e3jBXj5MQ5e4hzjHQTJ3gx+d8k4POF2jjEIvS7uzmfV/Q/Tln4BphxyDkSKEe0pzVG6F9Yuz/uufAbNj52P7J1GPpc7xgUaMy45pEnbyNM9PRpLZGs5B027op1IQ4iF6JNuImUF/rjZ/YEzMOB9KfmKxd3Sd0zURxddJaY6bGn3h9z/pqPe0dydqKdkKPvaEl07n3g+N2A4KhRKF4uwiTmcB5bcUAm4z84o1H0RNUK/ejaXS/xktlNK5id0PlTYhi6Nldk0lu0nFzNW0RFeAz4jEow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199018)(82960400001)(6862004)(4326008)(8936002)(41300700001)(8676002)(66476007)(66946007)(5660300002)(66556008)(2906002)(38100700002)(33656002)(86362001)(6486002)(26005)(6506007)(6512007)(1076003)(316002)(6636002)(478600001)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aKCyItDuRRo8yHL2cNGD3ytCRlJl0F6YIJ+yPdfOiNnfZVajjPL7C/aos/nO?=
 =?us-ascii?Q?Wuls5fQHomLttOmTFa7WUmX28Tuz7Gls1NiWvNMZFgWbtUZFaN+JsX6loZlX?=
 =?us-ascii?Q?b6oZuy1GaENJyXG/ahl4KeMOxQr5TYhpLHtQsYxmQZiegX1ErtBa7gh6eOiY?=
 =?us-ascii?Q?pWseJT6I1GVuwbSKDuOfbQBm5JtfBndkFVphx0q1GWq9NMSbIqZ7x5Qzy1TS?=
 =?us-ascii?Q?0Pm25Vk/zkoe6v6JV3touMI1AiCQeDZBXMWVWIo7BzvChlQht2bZK5SO4xsC?=
 =?us-ascii?Q?MsrNzbBauypT++ygJGGwFBcaBuWC2g/yWpRGVjFqBx+gDPuka+p+nzJvtYXI?=
 =?us-ascii?Q?OqWS2MgDSoIoseTsE6wTKAmyUPezImNN2dz9eetDjnwvQ9y2xczPRv0PV6hC?=
 =?us-ascii?Q?RcW9HXI1goCOjNbkKCkBOl4ncqGXF0HGi38hMlgZ6cuf+g7Mrp9v1X8KukrK?=
 =?us-ascii?Q?vsvg0pQiJ/AnWvnWBMFtwyzPXQ6P8bcboDVDALTJ5hhzUWbNDgWdbbBKApts?=
 =?us-ascii?Q?sWHDamGOEo7r0PkdQwpDj4l/OqB60X8jW/gvRs1+xE9vIMFWn8KB0x+QMjoc?=
 =?us-ascii?Q?PI9APZ91PX1++dnL1FUfNznWPDUNI9AkhcCOhsBf+YOmk+m2im2/jgbslBwd?=
 =?us-ascii?Q?iS6Qfdq9eLUuks3rHaGD49WikzOcN9QBTcG6zIG1b5kMCjhBjyeIGkVE+odj?=
 =?us-ascii?Q?OOmAJmN2buHcWzsMC3ZfJya46CKy50reI6g2rEjulzOgKoSOxmFRMUJr+w2C?=
 =?us-ascii?Q?NfoWWGJmwlX/Hd++MLSu69dPQIqv02w3yWoXlTDEMA6zlACnp6NBzUcc/cMc?=
 =?us-ascii?Q?2ibePl1KZOdsTf0drs1LCJIwa78/V50qMVBgnNEr6LSgKn8XVXsphmjhUbx1?=
 =?us-ascii?Q?ylh6CM8ZM2MwS7LRDGXmy7H0E40+dOla+bcH03trZfQM/tCb4Tt5TtzAC46B?=
 =?us-ascii?Q?xye730sElKM1tF7Ifr9YZZoeehzfjLTbeq+ruCInksksBYdlwYEiYbMpLEBX?=
 =?us-ascii?Q?WqRwHX+wIX1LAnj3eWYWPyMLblkRYe9azLpLm76dpT25F75mIycVxick1DP/?=
 =?us-ascii?Q?ae8BonJqaONQUn8n2ldJBKi6BZ1x4gyBxLdeebObIagaJf8It2ovowuTEuz+?=
 =?us-ascii?Q?aQNUM2sBwGVTldlT5Gxlkl23MNx+Db7yb4erZ5J29jCVFGqbwhjw7LxSA4sU?=
 =?us-ascii?Q?cYhHbEaEfYtY1MR2W/6fQPFLHE5+EXAjWyJ8z39n2TaLLejlJv/uSpOJ91Ux?=
 =?us-ascii?Q?StxZv3Lq5ypTnrPrqcnF0lFGJhBaaAhpnCrdKbxIhqzvYiT1j9CipOLkT/2X?=
 =?us-ascii?Q?yrVzRvg6sq3TZ+ki+p7IAEMf6zC5Nq+jlA+hsw+gdbWZJoeET8esbo+37CFV?=
 =?us-ascii?Q?HZu9M2ZVchz0S5H3d97pnZ6w7ZmN5Vf1NF9mgoQd1DzuX+UCozeiUyldYmjw?=
 =?us-ascii?Q?PcYyP7YTEoZS54qyZb0UUoL4IWupzR9BiJ9YWMD9HqoqrVJfwdVSlHCP1yJI?=
 =?us-ascii?Q?HMIa+MisZC55R7eiFkV0SWw4rfUP3ah3nzQ+KAMextLc1L4f7017H9/wA6cG?=
 =?us-ascii?Q?e5vLC6WNbIPn7oeP91S5xe+UpUwaTdbH2KK/DO1V4jeUdYMqwJdk7tk15GrC?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b796d7b-4e4f-4b96-dea3-08db20253232
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:33:53.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sTlQy/U1IUCyDYyIIkb4268oD5qYOzuImCaqQIa6RgFwzxblVns13t0b/iXiYZQ1V8bnIupsscqJBghr17qIE1QECiEj1301Lj/u7t38+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/19] drm/xe/debugfs: Dump register
 save-restore tables
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

On Tue, Mar 07, 2023 at 01:24:37AM -0800, Lucas De Marchi wrote:
> Add debugfs entry to dump the final tables with register save-restore
> information. This has a format a little bit different than when the
> values are applied because we don't want to read the values from the HW
> when dumping via debugfs.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_reg_sr.c     | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_reg_sr.h     |  2 ++
>  3 files changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 78942e12e76c..2db4863ba57e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -16,6 +16,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_macros.h"
> +#include "xe_reg_sr.h"
>  #include "xe_uc_debugfs.h"
>  
>  static struct xe_gt *node_to_gt(struct drm_info_node *node)
> @@ -98,6 +99,28 @@ static int ggtt(struct seq_file *m, void *data)
>  	return xe_ggtt_dump(gt->mem.ggtt, &p);
>  }
>  
> +static int register_save_restore(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	xe_reg_sr_dump(&gt->reg_sr, &p);
> +	drm_printf(&p, "\n");
> +
> +	drm_printf(&p, "Engine\n");
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_reg_sr_dump(&hwe->reg_sr, &p);
> +	drm_printf(&p, "\n");
> +
> +	drm_printf(&p, "LRC\n");
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_reg_sr_dump(&hwe->reg_lrc, &p);

Should we include the whitelist here too?  It's not technically a
"save/restore," but it uses the same xe_reg_sr framework and is equally
useful to dump from a debug point of view.  We'd need a slightly
different dump output for that one though.


Matt

> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -105,6 +128,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"topology", topology, 0},
>  	{"steering", steering, 0},
>  	{"ggtt", ggtt, 0},
> +	{"register-save-restore", register_save_restore, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 194a5060f1b3..855d86a6c43a 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -8,6 +8,7 @@
>  #include <linux/align.h>
>  #include <linux/string_helpers.h>
>  #include <linux/xarray.h>
> +#include <linux/string_helpers.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -220,3 +221,19 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  err_force_wake:
>  	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>  }
> +
> +void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p)
> +{
> +	struct xe_reg_sr_entry *entry;
> +	unsigned long reg;
> +
> +	if (!sr->name || xa_empty(&sr->xa))
> +		return;
> +
> +	drm_printf(p, "%s\n", sr->name);
> +	xa_for_each(&sr->xa, reg, entry)
> +		drm_printf(p, "\tREG[0x%lx] clr=0x%08x set=0x%08x masked=%s mcr=%s\n",
> +			   reg, entry->clr_bits, entry->set_bits,
> +			   str_yes_no(entry->masked_reg),
> +			   str_yes_no(entry->reg_type == XE_RTP_REG_MCR));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> index 9f47230c8ddc..3af369089faa 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> @@ -14,8 +14,10 @@
>  
>  struct xe_device;
>  struct xe_gt;
> +struct drm_printer;
>  
>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
> +void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>  
>  int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>  		  const struct xe_reg_sr_entry *e);
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
