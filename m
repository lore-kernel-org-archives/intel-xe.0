Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52512C77B72
	for <intel-xe@archiver.kernel.org>; Mon, 17 Apr 2023 21:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25A10E60F;
	Mon, 17 Apr 2023 21:16:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7A710E60F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Apr 2023 21:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681766188; x=1713302188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0O+pKTNnZNTxGybvbtt5tED2ShoNrXrf+htB4+FiF2k=;
 b=CkIxpSUsWTTK3AkxG/1iI/AG6jhyyBPyxM6W/lskD6dMGP9bzXcmnyou
 W3nOvnuwZwm6J9aGfLaOwVUHVvbQbWWIuvJNNS2GidesfYOBkyj+1X1h+
 Wi5ez64W4QX78gWdWqSoR9cL6c3TVukz/xiF5yaBRIwUKDZS+VxKJW2CD
 Ubfjxf6ns3IHvgyf+hFjvjuOBIP3Q+Xwg7ZwSJySE/9esavBJ0CdKQ8+H
 xxmBaQZG7jwdIdavReFyk5Q/xrhlr2Ib1SaJl2idyIM5jlDm1sBCod20V
 sAXFL1Gjk6VxYj7VLZxRdokZHG3q+O9sAAgrdq5mgCpUmBV1GmhwCq10N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="431299825"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="431299825"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 14:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="723384547"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="723384547"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 17 Apr 2023 14:16:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 14:16:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 14:16:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 14:16:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 14:16:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KccJ6HWDL0PIPCBMwGEKaIxcfTyR5uVYuLRCSoWdksM8PAwpcQKgWRyWGmtCVnbRE/6+icGRoTBX8e1h4yuv5rloWEGpuH82oXVQj39ReSwwRXSuZxpPVmrIChYNFzZtEa2RQvfjktTCtxDzWY7VFEUotjDWfU/vKDhSSFU9vVP84dzODPzx89iJLqZYNx9w3QluWMwl0PqObPYsU2g3Nzwlhlim4rvN5pE7W2Hz6EV7L+1wRg1qUoXlR+ubeMO3YqDfUUL5Ucyhv/3SQ0rn/OsGCuLz4dXvps4wxhfy2hlezKQWEl0mSriaFN9wSMm/GG6FstPNP2WcknPe7J7KAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJr8zL2gMKyvCevKuVoeacjiOXcSpbP+0R4SuqdN8tE=;
 b=e1FJs6K22JABQG6RT8z+9xr099wjAhwC7/Yht0ujpEuia7iVMTJS0Ge2wbfkdGIaPFN91JMvIvuwCVIdPSDS2k9ryUQBMM87HwM6WXCisQiKMRfZ76YWVjR4U0UkrSypOWzzjwUIaiPeUgi1yCHRPe/wHDcS/H4JEbd2nwEufWoj0dHNFo2D29PIhDxKLHPQ6pxgJA8+uvJkxq/XmpwWmsOBLJuVJ2NhkLSpTWKU6vq7qDgYu3XgYehtYzLZDOsZXMD1gMKyI1IpBDlsYp30xIQba0oWwqd6xZ4Iuu4jUISAVn1UU2PAvdcU41RK7Ik92a5jeQ/+ZgMnlyVhhwQf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4733.namprd11.prod.outlook.com (2603:10b6:806:9a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Mon, 17 Apr 2023 21:16:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 21:16:25 +0000
Date: Mon, 17 Apr 2023 14:16:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230417211621.GL4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230412082054.3314568-1-lucas.demarchi@intel.com>
 <20230412082054.3314568-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230412082054.3314568-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR01CA0048.prod.exchangelabs.com (2603:10b6:a03:94::25)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4733:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d72c15-1b1f-4967-3cbf-08db3f88ffc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FGPYGBf+N7FtweFW+H422Yb59dvrqMRXXsGB8X/eMShQ3jL+qO9Zti+Cw3mf+q8oBfJBbjwxE4h1e3AaDUYJL+Iofv+fL5F+NE3xBxQk6jiK0JR7IcYb109kFkfEdujMh08Svwnn2AmBLuhgLBsSaVWlsckSF+lnhGkPKcKvnuCWhR8COJzsQlIhTAgJz1pcZzZpmr3WSx7Xf2hyh1i2GukA2AU+qsU2ZI/XsR09sx2QCisNbDJ2yfRxqVpodBbWXnO1Vl/ygSpC2Nw5aW94gJmxQ7lshP+UA+qr2pQx+/SIFudJeO/7zBzCLSNaChVwoEeUSiCMCYvG28ZEzRkS9uqCWZ1aAw2NnYgLYJvYBQPV40ymQUgjYAF+NEUE/Reb0ZXCookpapNj9NQeBv6L9kpsIoCh9iaU1hM8lxDP4bJgbFtdne+upq4Tm4z/m/+FPW6UW+sMrS1vR02bjGUpRz4u1VF26GXdCgvxZ764LcCpfNuwEyAvptyVHUySJOhihHrleLgi6ckXrduHZtY5WwM7z64/eTpzgDCF6aE0axqo8GD9WoaLPyY0n2hmbWuW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2906002)(5660300002)(6862004)(8936002)(8676002)(41300700001)(86362001)(33656002)(38100700002)(478600001)(6636002)(26005)(1076003)(6506007)(107886003)(6512007)(186003)(6666004)(6486002)(4326008)(66476007)(66556008)(66946007)(83380400001)(82960400001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z6fueYH8lw76Ha3CtesbXORe0VyuWnVcaW0/jAeA5f0BTg98nqEc+q5M1SmK?=
 =?us-ascii?Q?5qE8FJySYsbt7GstoelXhjVQenk1BBfS+ogruxo23iCnKzkeKOjLkGWvLLG0?=
 =?us-ascii?Q?cyRL/Gr1xSGmRP01VueyalcTeLA8CxTmB5MtjP195qmTGBiPnyyUMlsWfiHg?=
 =?us-ascii?Q?Fdwnz6NnhV5fMJDTZTjgHWjYiv8coYiV0iB+VdKnEA+hMwHmrfPrJVsKdJy2?=
 =?us-ascii?Q?aycopeInh30JjODCui+r7OYfN+IasTN80wqTEmQOpg2StisTKoBeWIkEFITo?=
 =?us-ascii?Q?W2nrcTfVMkddqr3UlCExzA46topTeKtF7ScJefkGtG6Xw32NOZUyLaUPOk6z?=
 =?us-ascii?Q?I9CNXOxmOXM34dJvpm9NJothTlwnMTket9FzwzoUZAmvcJ3RcLIXjPE2DlOv?=
 =?us-ascii?Q?c+Hqfttd9D//Mu2Ek9+619fLtQmTNHA0DmQRDk5nxWdk0yNZHjU66nY/pbAh?=
 =?us-ascii?Q?5n9AL36GUsd3rVITfER5qvnAV6Cw/EmW4wN0XZT3EtCzr1ykRa+tguz68UcU?=
 =?us-ascii?Q?Tk7D2cyWkzSWwwCkr9eiAwQqXjJHJBJUlpU9kK2D7d/cC9pvcHIs8d7UFHzK?=
 =?us-ascii?Q?ZeyvnvenfBYNW9I5khLibjJLgxA0GSjA0d3v9H30hA5DrgS5ECR8cGY6Fdbd?=
 =?us-ascii?Q?jTlb9v9V1YvczYjvna1zC1tzMcLAx5QEoILPQkoFdmmbDO+HVq4vqTHurjkh?=
 =?us-ascii?Q?6j6texXZMNUoCptWNv9A0zFtTpsWuB861GqBlCovXkhiokMMX42gqMiVkZWf?=
 =?us-ascii?Q?uv9b0YK+8OmfxmM326mEYg3WWU4iTJzXx8+ZZhsZUz7z5+1xpDaDEqF5ES7r?=
 =?us-ascii?Q?jn6YrQo2426PFdfYjg7Dby89yQ07CcQ3gyo9bdwphYTlKA2Q7+sZlciYWYpS?=
 =?us-ascii?Q?YrTB0cD+XJpJTOzTI9OEyGF2xjq8AUYg12PpJjKh0XsoIq9zgor4bODOY/Jq?=
 =?us-ascii?Q?/hcAeo3oQSBWRUH8AEXsO0isNjK+EnYVhfmSzeJfLRO9hY8hFNizGuVP5M5T?=
 =?us-ascii?Q?H3JJjDmJMc2mZS5CaorSIG4OCNaIT2765xyOFL41I6G3M4OtToPspPXZNa39?=
 =?us-ascii?Q?S4fmhRfZVfegXm7L+YgDd2pekfwHc1ysyaI3dpHNWxNPDIzd81/iuiDze4ZZ?=
 =?us-ascii?Q?tiiD7qb7RT0auag2TtfRNHVUsOYlL5+dcxbe1vVQzzgDuR/rXVZpPj6H+ciu?=
 =?us-ascii?Q?8cDPyFPwfktM6LvmVnUxpOFMmRXKjboaKIR7K87lb8TyGpq7hGxSLi5vlMfA?=
 =?us-ascii?Q?P/YmFJs3w4bCKaEpAxvFaO+oJA6DfIkk2C5SNX4Tg0J8+5Cw8onxZmkvYhN1?=
 =?us-ascii?Q?4dHXkDVcDMCpS8H6TEOu12ks8f6rT+ZaGA1WtXb2zvKV5JIhqk6cpJIbhhH/?=
 =?us-ascii?Q?uUDDVLoIkDDTX5VYk43zSagJkBET7uncg5/OOKzqLyahgdC3iFQCODIwj96R?=
 =?us-ascii?Q?PHhsqu/oYuXIADPcS3k/NbiMsmU21qoEKR6A6vA9m6COE40GlceF5hcrcnCi?=
 =?us-ascii?Q?W+Hnm5CA1btje8A7Dt9GYuGOcCNx33Ah2U+URifPIWLQLwKfqqNUJBY4vRrY?=
 =?us-ascii?Q?EibFqrCutlO23HdFCM6tTnwva0V1mkS305MpIgYToUagPBKDYYuT8FYE7KDO?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d72c15-1b1f-4967-3cbf-08db3f88ffc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 21:16:24.7151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ED+Xsr2d1mffIAt4KfZSQALajFm177+rVXvYHT1onWg/3zknxKj70Tto5vDrMDI4g1WvTwc2fbS/HnlPTjTxKAiT/ua9qHxWBBFFQ5yFMWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4733
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/2] drm/xe: Add debugfs to dump all known
 workarounds
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 01:20:53AM -0700, Lucas De Marchi wrote:
> Dump the names of all known workarounds known by the driver (regardless
> of the platform being executed). This helps to validate workarounds
> missing implementation. Later this can be extended to mark the
> workarounds that are active under this platform.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c      | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h      |  4 ++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 7827a785b020..ad1b1ab49e1d 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_step.h"
> +#include "xe_wa.h"
>  
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -60,8 +61,19 @@ static int info(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int workarounds(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = node_to_xe(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_wa_dump(xe, &p);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"info", info, 0},
> +	{"workarounds", workarounds, 0},
>  };
>  
>  static int forcewake_open(struct inode *inode, struct file *file)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a7d681b7538d..100315c03014 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -656,3 +656,27 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  {
>  	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
>  }
> +
> +/**
> + * xe_wa_dump - dump all workarounds known by the driver
> + * @xe: xe device
> + * @p: DRM printer
> + */
> +void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
> +{
> +	const struct xe_rtp_entry *entry;
> +
> +	drm_printf(p, "Workarounds\n");
> +
> +	drm_printf(p, "\tGT\n");
> +	for (entry = gt_was; entry && entry->name; entry++)
> +		drm_printf(p, "\t\t%s\n", entry->name);
> +
> +	drm_printf(p, "\tEngine\n");
> +	for (entry = engine_was; entry && entry->name; entry++)
> +		drm_printf(p, "\t\t%s\n", entry->name);
> +
> +	drm_printf(p, "\tLRC\n");
> +	for (entry = lrc_was; entry && entry->name; entry++)
> +		drm_printf(p, "\t\t%s\n", entry->name);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index cd2307d58795..97d104b7e566 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_WA_
>  #define _XE_WA_
>  
> +struct drm_printer;
> +struct xe_device;
>  struct xe_gt;
>  struct xe_hw_engine;
>  
> @@ -13,6 +15,8 @@ void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>  
> +void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
> +
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  
>  #endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
