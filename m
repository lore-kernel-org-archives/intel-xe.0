Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C786C001DC
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 14:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B17410E14B;
	Mon, 31 Jul 2023 14:10:43 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A36E10E14B
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690812641; x=1722348641;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cIATUXInxGxZEI9CkHoFgtzIfgpUZveFhZ20OMNCXNQ=;
 b=bP7giSUgmLyyybXltH1QG43kUGjnOmlVXZFddGmCQNNK0RTsgi+Gu7h1
 a+tJh6/+naaBdFwIuov3+tmp5cVKPy3NcCF+4YKlNR4gtsJCQaPq+Lf6R
 9b/Xl4Zm+XNgWRxOz5W9SwAaoP/B47yWqdFjlf27iSYdVnKSbX4cy9A1s
 0MyF2fQBDmPe2hgFiujEMIECX2VZ0CTQ1zqQ/FHyyn3gJqDyPtVcNuLau
 S6AtyjV7ACKmKEQZfl4GUFCd3WiTGgV8vFYAcYxOMoYP4dDckBf40sYKX
 I+hNWwpuoeMWlbHJirK1zO0Vic7vUGK3KhKzDoyXb3iBApheG2Y/D2r45 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348624943"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="348624943"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763402636"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="763402636"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 07:10:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 07:10:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 07:10:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 07:10:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 07:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlYfw5uaVINsFQCLOgvPxS3/O/gTu9KvWuAu5gNagiGfVnFVGopittpsyHL0MXHHPLFIwDVO3uKyjELgUruCaCvq+xW/OG9FhdtOmvYtV36FOkwxjEmGuB9fr2U7C+x455xXEZNGhUmgqB/GTyKK1SsKVmFB76KpteWHArPWlpRhav6XCWSfhj4h3EMGhwGj6A3eBtQKOLcYWE1ik+NmMJ9Fy37Sbgpm9NxAsxnzWHV6N1KWtkrw8JLGHd+U50UfCrmqeG+sG56Z00ki/D/mmFt+Gz2E1FuahlUiVQKU2SJfp2rSDQKiqb9PWSxRO7UuLYR5kd/MrLxIPJaEiUuejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW+wFc9UwV/CGlu+J95o8Q9uOBCX58H9kCGTBQstoDE=;
 b=b4LGK6w2WuwpGBTOt6fqOZ6As4PVZRHLv/wBsDC89DNpmReRVp+fN/jPXNX1OV+CRdyWgzWBIURYGqA9ANDQ93/xcbaED9TumGWXPh4Dg1GINMGkbN/xGJM0VYLsDE+lWvI97CnYKdgD0isR2BZ+W181Nfl6EWMqTbnAhP1qwGwzPwBAKRaZf5BTTusyQ9TfhS0s0JHMcJEIdUplFK1KlgePlwIz1SnrFEJzhXXOXGZtbSVWIDP00GQ6jYFbaxoE/G3L1dPOff3+hEI1YntMxNGBgVQfBb88DjHCZ5bXzzROwk68vVei2P5c/FDHUOe/+/EfR6n09jGcPsb91FjUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 14:10:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 14:10:36 +0000
Date: Mon, 31 Jul 2023 14:09:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMfArZcYV3gL0dWu@DUT025-TGLU.fm.intel.com>
References: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
 <20230731131337.1100068-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230731131337.1100068-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d982f2-b45a-4927-cbce-08db91cfe934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvTps9kIbC7q9KNd2/Uej/BKPcpM1r0ZXsINhM3R6ThQJO2IFeMjgMlg62vV9D4qjXnINWCZ7qO8+wXJRH7wafQck6a05Vekd2iTnENGgksWPmWMT7wYWTU2y9Jct8a1oiAxt/SBuCzQ//bb75bdrxUjD7p8yVz4DV8/pQhMaFLynHFxzdoBUNIpwUuKNfVH9sVAqMOceDjwQ8yfJynT1KwagPSsI1x2+2x8Zt5Mq/0LMQZqk8sTah2AlwTWA0Hy2JL94EA+49QQwQJQRZoL2FwOKKjcw+TqPec1TEH8rxNWoNmTCWbVNwVfg5r9ki9DKp5rIw0piuwrFyxrodM7cN9kpDn58qFJFIZs9kFIMX2v9ROgd1s1EeCB1aDY4acnB6VLODoO760GWNKYGNByrMtgPccrFB+y/4Yz5t7EMjYmLPhJoTFGJE2AbFBzNuIZQQk4U2IpR5oKf8gvlePr+7ZYKnHr1AI58fS9IYj8fjH8/WcpEnf62hks/kwhzOPaIEdplIplq7JT93xuvQkCXVhZt9G3G3G5/705LNMK649N7GT46C09f7+CICJeEyAiwgUtFxIA0EwpOJ5nGyQPa2ys8BKkNlQhtYlb/Q5pCwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(2906002)(5660300002)(8676002)(8936002)(6862004)(44832011)(316002)(66476007)(66556008)(41300700001)(4326008)(6636002)(66946007)(26005)(107886003)(82960400001)(38100700002)(186003)(83380400001)(6512007)(6486002)(6506007)(6666004)(478600001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q0lPE8lAKIpgGRCIyhjq0fQikAznrYndl+0iFhIhtuerebsINInPhjF70X?=
 =?iso-8859-1?Q?oCdvum7kTO/zfNNZAaqri3iQ38YSPMwYZTyABB3ptdsNURHYXRsPE5rMsF?=
 =?iso-8859-1?Q?174Too5TetAwAZy35RklUy5Szur6xeGKzi3wlpgFHGseheQaVgvCTymNZy?=
 =?iso-8859-1?Q?qAzagyR2UiBJuuZaZ9fPM+yQAG1RQTAloWznjnsoJOLiXJjECp1a/zNglN?=
 =?iso-8859-1?Q?29nF5jRrcHqguDWDGCTe215T4GNFr/MQ+/q4rosTEiPQKXDH6Tw66vq+YK?=
 =?iso-8859-1?Q?shNlkGhWUJNahataShO3W4buJOvwRUsyzKBcHtN3NfXw79CxxpXxvOmkBX?=
 =?iso-8859-1?Q?B3ZnZOjJIYSS1/fTRHoHEJO0mYq4tvkZ6bQOq+J+cv+v281g2GpJ0/ZOqP?=
 =?iso-8859-1?Q?XoeefIQZzOHKqqX/iJYoewiftARkBM2HLzbSg8P87z52LEkatt1xZR3AXy?=
 =?iso-8859-1?Q?3V9ssJoaFnophgpxIOBtucVNIT89gON5/6/jjg3SqCToq364ajk2fp6YMv?=
 =?iso-8859-1?Q?HF80DUMf0miJ6pebARRFa9npdpBmZTpGN8WuSvW+icdo6CmurxYLC/g+P1?=
 =?iso-8859-1?Q?OgzZ1eVOYFv3oKgeOXsNFuUyV4qvbnwFfM3Ob8O7+ITk7f6v3c7C7LdJeJ?=
 =?iso-8859-1?Q?/2H9Q1DvMzbEVEJL8gQh2BDUT5XaqUi+C/UHvxWg2dcyrJYNy14fATGpAS?=
 =?iso-8859-1?Q?U22xZvYkgLu+ppMmRDvdzQhoc5uyGN07q2lsXhE3Kjqxv01VN0h4EYjkdF?=
 =?iso-8859-1?Q?xKXyuKHSkALzAMjVEf6Z2tB7qZzzyfeoCqbKyvKepC1nh0shjKOCk9yGUu?=
 =?iso-8859-1?Q?xaUX7AdPVoSqWbN36Y2S3VYR7bw2bnohjHL9nxHcN/IL8QNEzQ2yABVkih?=
 =?iso-8859-1?Q?2kKmT7PVNFH6oRnZw5eb2G1CTRGcl57v6tpPgHTRQrSS8H9fg3rWxadaH2?=
 =?iso-8859-1?Q?5prsqbKTmWUDNDRrRpAyW6YfqL/P3cKJR3OP6JiKCxniYPnTTzotNiewqx?=
 =?iso-8859-1?Q?jgN33VgkLMpCqontcYejxnBJONjB0Mi9qKJnIrL2q0iRyRT5cQBUEO56Mm?=
 =?iso-8859-1?Q?iFflG6BJHmwAqaEExrv+lqxMVP7z7mK9jl7LoQ+Z7Rvgso5ZYzCFXQuu8t?=
 =?iso-8859-1?Q?tZxuFsPELxveyI0r1yi1xnHLoqCtokQipRQWNkgN3Qn6sInb7oHO0HwHRS?=
 =?iso-8859-1?Q?SvSrVlU/1GE53fAM0grP3j+vZfRjAETMsoEi4GkmflJWeE5gegunpPHJU4?=
 =?iso-8859-1?Q?qe7bHxB1miB6AH5QioHGQAMgOj22QuvRaxzwzmvn2kkBDZosFaY44D+hLb?=
 =?iso-8859-1?Q?6wM2GnNec25j9FWogPY1a0rvQpBAhpwEI6nBVV0ZCk6z8nyzeMIErtCWAb?=
 =?iso-8859-1?Q?m0O7Twsj9StGuhumTdsqSJX1zpOyLepbbrif3g5ZB2gKoASk2uw4W5m75+?=
 =?iso-8859-1?Q?4kjNAIiqe3m34ZB4YOACIrtwdZf9Gkez1GcNVHkeRDx7e7PoNyNUGGWjz1?=
 =?iso-8859-1?Q?9HQErm5GfCu3CnliILfsKPlxNmyx+4TcLHTROY+aLP79i2WOZrrqyojudd?=
 =?iso-8859-1?Q?I1BaMmEdV95Avm9ICmEGUcybKwFNPQqAcuYI+l3x+HBzAYOI/7GqMVsQy2?=
 =?iso-8859-1?Q?zco8klTAIJBrl7QimAeC3YAKRSxqGUML+51N5jkjU8NlXKZ1vqaMpw8g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d982f2-b45a-4927-cbce-08db91cfe934
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:10:36.0596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8/cOoxOdVA5sVTw6eil5Y94KQd+U42EbB0Q2HTDzZ9Yjwuhk6xQXxJcIDdOPl9mbdw+HnJGulz64lCb7dtQJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V10 1/6] drm/xe: Add sysfs entries for
 engines under its GT
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

On Mon, Jul 31, 2023 at 06:43:32PM +0530, Tejas Upadhyay wrote:
> Add engines sysfs directory under its GT and
> create sub directory for all engine class
> (note its not per instance) present on GT.
> 
> For example,
> DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
> bcs/ ccs/
> 
> V6 :
>    - Add kernel doc and arrange file in make file by alphabet - Matt
> V5 :
>    - replace xe_engine with xe_hw_engine - Matt
> V4 :
>    - Rebase to resolve conflicts - CI
> V3 :
>    - Move code in its own file
>    - Rename API name
> V2 :
>    - Correct class mask logic - Himal
>    - Remove extra parenthesis
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt.c                    |   7 +
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 121 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  13 ++
>  4 files changed, 142 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4ea9e3150c20..2ddae8e312b2 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>  	xe_guc_pc.o \
>  	xe_guc_submit.o \
>  	xe_hw_engine.o \
> +	xe_hw_engine_class_sysfs.o \
>  	xe_hw_fence.o \
>  	xe_huc.o \
>  	xe_huc_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 28bf577c7bf2..5436ce651076 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -28,6 +28,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_guc_engine_types.h"
>  #include "xe_hw_fence.h"
> +#include "xe_hw_engine_class_sysfs.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> @@ -323,6 +324,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	err = xe_hw_engine_class_sysfs_init(gt);
> +	if (err)
> +		drm_warn(&gt_to_xe(gt)->drm,
> +			 "failed to register engines sysfs directory, err: %d\n",
> +			 err);
> +
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	XE_WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> new file mode 100644
> index 000000000000..ad57faf69f9a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include "xe_hw_engine_class_sysfs.h"
> +
> +#define MAX_ENGINE_CLASS_NAME_LEN    16
> +static void kobj_xe_hw_engine_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static const struct kobj_type kobj_xe_hw_engine_type = {
> +	.release = kobj_xe_hw_engine_release,
> +	.sysfs_ops = &kobj_sysfs_ops
> +};
> +
> +static struct kobject *
> +kobj_xe_hw_engine(struct kobject *parent, char *name)
> +{
> +	struct kobject *kobj;
> +
> +	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> +	if (!kobj)
> +		return NULL;
> +
> +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> +	if (kobject_add(kobj, parent, "%s", name)) {
> +		kobject_put(kobj);
> +		return NULL;
> +	}
> +
> +	return kobj;
> +}
> +
> +static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
> +	.release = xe_hw_engine_sysfs_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +/**
> + * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
> + * @gt: Xe GT.
> + *
> + * This routine creates sysfs for HW engine classes and adds methods
> + * to get/set different scheduling properties for HW engines class.
> + *
> + * Returns: Returns error value for failure and 0 for success.
> + */
> +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct kobject *kobj;
> +	u16 class_mask = 0;
> +	int err = 0;
> +
> +	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> +	if (!kobj)
> +		return -ENOMEM;
> +
> +	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> +
> +	err = kobject_add(kobj, gt->sysfs, "engines");
> +	if (err) {
> +		kobject_put(kobj);
> +		return err;
> +	}
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		char name[MAX_ENGINE_CLASS_NAME_LEN];
> +		struct kobject *khwe;
> +
> +		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> +		    hwe->class == XE_ENGINE_CLASS_MAX)
> +			continue;
> +
> +		if ((class_mask >> hwe->class) & 1)
> +			continue;
> +
> +		class_mask |= 1 << hwe->class;
> +
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_RENDER:
> +			strcpy(name, "rcs");
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +			strcpy(name, "vcs");
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			strcpy(name, "vecs");
> +			break;
> +		case XE_ENGINE_CLASS_COPY:
> +			strcpy(name, "bcs");
> +			break;
> +		case XE_ENGINE_CLASS_COMPUTE:
> +			strcpy(name, "ccs");
> +			break;
> +		default:
> +			kobject_put(kobj);
> +			return -EINVAL;
> +		}
> +
> +		khwe = kobj_xe_hw_engine(kobj, name);
> +		if (!khwe) {
> +			kobject_put(kobj);
> +			return -EINVAL;
> +		}
> +	}
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> new file mode 100644
> index 000000000000..b96125443db9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_ENGINE_CLASS_SYSFS_H_
> +#define _XE_ENGINE_CLASS_SYSFS_H__
> +
> +#include "xe_gt.h"

No need to include xe_gt.h, rather just forward decl.

i.e.
s/#include "xe_gt.h"/struct xe_gt;/

Matt

> +
> +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> +
> +#endif
> -- 
> 2.25.1
> 
