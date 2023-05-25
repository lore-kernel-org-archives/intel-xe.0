Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19FDC77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 22:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A92C10E776;
	Thu, 25 May 2023 22:30:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F36310E776
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 22:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685053803; x=1716589803;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IHAWBtgelr1vrY3xO0rH4TWvYwCMYG1QOp7JpQ/Ya7o=;
 b=ROuP7PNlZ12ZsVJ8+5q6m0hYUed7xVqwDdGOpZZmXL/7yWv2zRWvMQf0
 qM9i8MPZpEiEZe511iXbjdVmYfclxlb9jhhE5ZF/XgyJYSzR6lesETshJ
 ZhsLnlAs4Dg2CtZmWGrj1/2RdLMs0IsryUrTcMLvapDF7U0d8QLQnEpp0
 efGR9KxrNT33+2dU4ugNsFEIQDhhDdC0qrk5QqivRTeyEXQudkpKDQXvg
 3ffJoideWDL8azVCuglEkvl7aKvV0Cefq//EN23jIcf+0K1C9wSRtTP5i
 1GdyDab2plVrlK6ESZwl2qp3B85CGwSsE3+sW2GXKd4iCU5aOuWXI2tpt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417528661"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="417528661"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 15:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770106730"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="770106730"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 25 May 2023 15:30:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:30:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:30:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 15:30:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 15:30:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jqf2KzM7v4YttsfCbjZXA/nh+A+5MAC6uavhR8sfSoKwCWY7zceLOcwwkl7QseATlp6mpzjZvsYB8kestx8ePeP/7i33oTBz9WRdPUVxL7JhxSqskODNydYzIvyhivUgkKAAFulwfJsxj7pOK4P8y0aavTwVxQQ3M2NRCpZPywEgaY49W5Z/syj6txzFMMAxneWAcNbuti6yCtcdrr2BhGQw2nGQjaPHvw24Llua8TdWH/fJx6UI7DhKMIK3a9MZrJy4rqriPpianxbm/CatpEw6P3p7JLjLth5H8eeS180z9x9M34pppfq90sE5T4nMR6CIpXhZxiHfrTPmP2ba5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68utK4GRiQelghxyXSu9UQjNLTzNPSdAFvyghttEoO4=;
 b=CQm0gEnilVV/4cT07eAOxpCCsvwH9T7MpxRwaopReslcqMEwJzBJjsTe8BP/49/JwqVmoXjWLkrSBqmmt4BuG2BKiefMnJK5oU2yYZhna60SM2vrXhcS7WySvc8TM9xPZ0lLFAZZ0GDExuqPyYUxoV39H1JKhmZaFOhEnpxaqdBiS8X3Qn3MmU0on+Mi/7eWCYIyObv/233Yz7U+2J8usY+vwy+FaZ0Gz0lU4Lnxis6qBtkHg1ErUwd8fwWiSignqWoSX4KAxOEv3JqTV/dCC4U85CtP98cELSgawS8tnkNyjR5lbBUXJlNx360puy4YW4uvtcYVuKiLxKhm9qL8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Thu, 25 May 2023 22:29:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 22:29:54 +0000
Date: Thu, 25 May 2023 15:29:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525222951.GV10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR01CA0032.prod.exchangelabs.com (2603:10b6:a02:80::45)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 6149d075-d4d1-4dbd-8a37-08db5d6f901c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8EUCd0xtuEnyopHlp61XqcQjz2WB4UCOxrL5EH/GpEmSplK9h2kPgCoQ5Sv6K8RDu1kmVbMtSQX12NGnMVA6pstCpi0yNo6OFkV5WaRohUjzuliJmzRpVB9QJiD034beP02oI9krgOkW8fe+BDx47ADGhKUGCqHIBZl1P1chVkVvw0+36emgd1agmrnE9Lmi27ZdPZk9izTl+BeYXL7ElgQSDdK+qRsxnFslzrEkT9Rxe4hnVo0bPuk1Y+kY8Vbfozuw+mMAFjH4btOzwshRmgBiMGOrlwa6Qdrf3bRny6twsTKOqJLaCykefzXDDQhkmrcWPzjBA2Rvlspm99KJk4UllGTaUAs0reMYVIOICaKEmT9j+Aup7+a5Nl441EnW7i+kqG+6VUhp9B3J9/sX6W93VnodSW+xEoUSqTwkv1r+aRqsmYOP40clvT3kTxpabFpUuqYeZJpLyuiw8EcMUCOd1du89GyCUGIHGhoPvRQfSlOG86JjQnSumwC7BMFLhd8H1z8rSPmUhW8k8B1AFmSvl81Oa7rr6V6KeEsjhFUPmiTfnpmwee+9jp3IuMix
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(33656002)(86362001)(6636002)(4326008)(316002)(66946007)(66556008)(66476007)(478600001)(6666004)(6486002)(6862004)(8936002)(41300700001)(5660300002)(8676002)(2906002)(38100700002)(82960400001)(6512007)(186003)(6506007)(1076003)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C/PlHRULWGj9WuBLzJTsUezi7C1ILfihchPCbTnyP1qAq0u5mTMr1+L7Gu7l?=
 =?us-ascii?Q?UytSr3EJhUgZgnf3kuLG1GsC3JCGWl2Es9MQOHnV5jxc4uKfa4ne8deeIjiW?=
 =?us-ascii?Q?IvoT8uP/GfawZxqtuV56qCILIqlvevw4LfErdGy/KZvvXq3IBS+Y9pUtg8AN?=
 =?us-ascii?Q?ZhiPNu/ZKlJKek/AtuGXhkHjwf+yrrkUrXx7JYvEo2Zx6M82PH1gX4VslXSB?=
 =?us-ascii?Q?HpwaPGUbFtuylXNUfSoOltsDJ7ob6qOwxPT5GdQyRLl4d+HU0tBygFui+Z2+?=
 =?us-ascii?Q?6I4JCbr21K4Uxl2aMGxyE4BbvW3L+Hu8e3+4vBXDCQZbAdfctIkoG4UpLgDM?=
 =?us-ascii?Q?Jzt5wPYG++BvHQfPyrQzp25t9Go1q1MG7YAi8MzTcP2XFbkAGaZxMlnJz57s?=
 =?us-ascii?Q?sh9q6EuqaxC/GlXMoLhvYtNglZS0sgSM5cPe4S8khpoNF08TZ+V5ZB7yZIC/?=
 =?us-ascii?Q?Dq6YLk7jGjE4be6/vCicg1cr6F88OAqkVth9/2nt1LZXbGSfm1RJ3eKJbQpp?=
 =?us-ascii?Q?AveXgRKxfHQNdLn5zxGEeRILEtpT/xJRPFca9Qf5OTE7X8qglo/Gnwl9L6w9?=
 =?us-ascii?Q?Xijq4QyDMRJAFvcT2d+ca5s1qYQjcjDEAkKkVZk0SmnDU+SFPrShNFwirxR7?=
 =?us-ascii?Q?e6HM2Aae3o7OczGwtA1GReHdOE0XELgCjRr6m2ySIlCuZKl/k4uzX7sKvOXx?=
 =?us-ascii?Q?tpWEDCFXua+Ok88ODw8JmE9UHsifVBf+KZLSbKxWijaevqcYJKrQpJ9d8OQk?=
 =?us-ascii?Q?G0vgTL0ZhDpW3E7NymTQCFPHIK/Kjbi9sYkm2m61PYDz5+slbqHSS9JlAtxT?=
 =?us-ascii?Q?MPkRw0QCdE4OPha5DUre5Tbf9iMZBhHFQdLODC42T1sdk1Aw0TmxlCdKwlln?=
 =?us-ascii?Q?OODPIBRV6qEYPq/ig1FpPSvI0Nao8Wvu1FnvJBCzfpSxWow4TxFAmZROxUZ5?=
 =?us-ascii?Q?FZgSsDWGQA+tciUBthoHZup6Rp83IwhN6xv74kdVa2YynPo8bCHfQ5hnGXnJ?=
 =?us-ascii?Q?Nsa//wjHsn8WmGtiTnNr3m4TRwjKe0/lcLzIm6rM0JhWdqM8EaNtbAvg/q9G?=
 =?us-ascii?Q?45mQN5yqYakpRLLKAYyifg1HBk9nl72YM/V4DPP2wNjfoMBrXxGY3cKiNwAP?=
 =?us-ascii?Q?3p2n9/s4qeuBiHKQMg0+HSojdgtHc6qflO+g+SxYTWsCCx0kBU/nxNBnDl2K?=
 =?us-ascii?Q?0eQMPBpC5rckiFIQlpYmkYAVpGCwYfeUBfmSpxxWgWT7KV60DaInaB8+PE/F?=
 =?us-ascii?Q?Qpcqoczo16lMBH9O5ZCX+Y2vtAWoeE6xR8zKV2ZvHUkmJOJNrfTIcpqQxFwZ?=
 =?us-ascii?Q?j4/tYXNiEkwqZzAM2oM2/SwvmdUQh6nLfN2bTxQjwx8fAtUGKipyEnTy5CfI?=
 =?us-ascii?Q?uQEHhmP6A3jAuNQRNBvxmsUTtdY0YQH71IC4l9qEYa3qlJgcUU1TJxK7PUsl?=
 =?us-ascii?Q?/RAaBSe/JGpf00lENFoADOTyH1mE/R6YXBHVrDTLXT0hdnyml3zDxj3T3T1D?=
 =?us-ascii?Q?Txr3yztlg4VMjp58Z+ymVwkVWVz9jGC4Xf8IWNKGQUaYYIB/qjZYFa/Tnf2M?=
 =?us-ascii?Q?24QnMXjh7pbST3z5F8RaoWM2VplbY2IOHS5IDqeU8+s1WIW0PHQpD0XkPGFs?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6149d075-d4d1-4dbd-8a37-08db5d6f901c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 22:29:54.5849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqsWrJtn4YEuujBqAhmPqX8HOBBtyYhQ3MoMedmTCJYv9kTMintZUOOE46VpfXQm/gN2Rpec/il8xXRIcIAx97T/6td7QNVYNUgUEw4OM9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 07/21] drm/xe/debugfs: Dump active
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 02:33:53PM -0700, Lucas De Marchi wrote:
> Add a "workarounds" node in debugfs that can dump all the active
> workarounds using the information recorded by rtp infra when those
> workarounds were processed.
> 
> v2: move workarounds to be reported per-GT
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c         | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h         |  2 ++
>  3 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 8bf441e850a0..339ecd5fad9b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -19,6 +19,7 @@
>  #include "xe_reg_sr.h"
>  #include "xe_reg_whitelist.h"
>  #include "xe_uc_debugfs.h"
> +#include "xe_wa.h"
>  
>  static struct xe_gt *node_to_gt(struct drm_info_node *node)
>  {
> @@ -127,6 +128,16 @@ static int register_save_restore(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int workarounds(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_wa_dump(gt, &p);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -135,6 +146,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"steering", steering, 0},
>  	{"ggtt", ggtt, 0},
>  	{"register-save-restore", register_save_restore, 0},
> +	{"workarounds", workarounds, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 3e2a3f678f36..f578544c7646 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -651,3 +651,20 @@ int xe_wa_init(struct xe_gt *gt)
>  
>  	return 0;
>  }
> +
> +void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	size_t idx;
> +
> +	drm_printf(p, "GT Workarounds\n");
> +	for_each_set_bit(idx, gt->wa_active.gt, ARRAY_SIZE(gt_was))
> +		drm_printf_indent(p, 1, "%s\n", gt_was[idx].name);
> +
> +	drm_printf(p, "\nEngine Workarounds\n");
> +	for_each_set_bit(idx, gt->wa_active.engine, ARRAY_SIZE(engine_was))
> +		drm_printf_indent(p, 1, "%s\n", engine_was[idx].name);
> +
> +	drm_printf(p, "\nLRC Workarounds\n");
> +	for_each_set_bit(idx, gt->wa_active.lrc, ARRAY_SIZE(lrc_was))
> +		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index eae05bcecc68..defefa5d9611 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_WA_
>  #define _XE_WA_
>  
> +struct drm_printer;
>  struct xe_gt;
>  struct xe_hw_engine;
>  
> @@ -15,5 +16,6 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>  
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> +void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
