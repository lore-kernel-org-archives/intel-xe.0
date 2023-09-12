Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C81EE3F38
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 21:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355A510E094;
	Tue, 12 Sep 2023 21:46:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEF010E094
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 21:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694555184; x=1726091184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YxcpMry4XvXBK+HFdR1GttWi93HTTzWi3VmEUJ0c0Ts=;
 b=adWVUxkpGoiVZD8gPpwgs4fKXHJVVWI8wX/rk5hQ6v/EVgJXhLnOrz6r
 kOXnpSQVa69nngbcmaKKSDgY6fjwJEPF/Rq0x4fbvMepTt1dxI0k616FX
 bXNmJ7WxuStpIw4TcCqZzmvZAUTRkfk3U9y5lJ2kPTYoXEmfyh/j+7ugp
 +q4As7ma3Sow76nH0HyarekWRDRg1g2wOaj4ugtD2jcXEEHDzDj1WAabT
 JA6rQs03VdQ4mbOGKHiufXQvJLStf7Wsnq2PnJbfNbMIqSNc9c6vllKTa
 Jz2zcNJTqJmN1hQEik65K1+3/u6NRTajOcNsyN2u8WZSi7hW0sY8DqkjC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409453200"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="409453200"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 14:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773202796"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="773202796"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 14:46:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 14:46:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 14:46:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 14:46:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 14:46:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPDbstIotKPb8QRkbdOD1cGxTLoMyIX/Hkc/l/t7eBjVvYWYxJyYw+zHc+cg7h7CeFatNWA9pRJF5Jy2zOBVvLfJHVx2D1UpvoC5XMxJQa/qXI+rU0TuooUnUmmxNJcMSK8+sGnqBwjpskiTMj+VHE4LLkgS1SDSbJ38ZZtSlIb+Mbtlp+1JR/BGBhJFyWoSxg8XqHUkgxywHVhABI/DzrQtdAD/HONr3rM85GnzS/JXYGUAr1QjTvgvbFhtUzHt6R+A+0tYq7hjYdk4ZgGrNEqQ31zp05hA4pJv9pEXV56/cf6b61nD32sU1RbvAD2WHZc+jInk7xSTQ97z+EJn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQF1bt/sA9i67aINsVPAxC7x8wV1RhXOOfHSst5/3eo=;
 b=mUffO6JNqrRl20bmemiXNcX9u9Se6qh4i/mZzx0TJZtklgK1IRAuprkbHTbWKLXyKMjyiWF2Tvu+gPo0Pf2V2mOuBATtN8x9Xd2o0EfZ8Z5xheIgvkLbGVQrTotIAu1tDBDu0Y/1UJQ0WCbYfO+82IhMbT9em3y6vktHZl21Od3r9wbo33urpKB32SduMw0i9e4XULIHs+//M1FqkpfbnoXVHtnYiV0DrqVMr8SjzKgLdl/9bLkgIJ6nQcH23z2vfqaX9BKynkPuJfnH/qRXMTfNmMxGl7ZkQO8hhzPlvw3EAfTF62faraC/FKJfRoKgAs923V4squryw3Cex1Xv3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CYXPR11MB8664.namprd11.prod.outlook.com (2603:10b6:930:e6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Tue, 12 Sep 2023 21:46:11 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 21:46:11 +0000
Date: Tue, 12 Sep 2023 14:46:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <20230912214608.GP2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230912212843.681802-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230912212843.681802-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CYXPR11MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 81515131-c52d-426c-58af-08dbb3d9add9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KF487Tn0NwaF/MBC3/sbx+9w7HXO08g1qx5DibM2UY+Aw+h4R83Mth1MKZ9M5ifW/rFk/BKz0kZGHIlX+Hmg1DNFE9ikVKf7JOwW6jKzYD82fXLwHV4RuQJ1sg3LqXByaT3BWTDT3duf9QRdNMA9vnJW6FKo2VeRjEZQwTMS2DbuOe4fa0pIICAaskR+b3rUHYs/0mWBOE12tkyzfNdgfGvNwDkdNAcM4xp3X6vNeS+7SkTkkIgu/MNigMO9zPVRTyjqDe6T+qwwuSVvyF+BJoSuZCJ2g/jTfe+S5espm2mURqmT2c9YTZtRONqp/pa6yWZ2s9HuxTAVMsfzrkuasz8r97RtEXtCloZGUbjUk7kB/GQvgIy54ODvF0F/D/zsrC6ngej0tCaDyBq/frnzjz0fHhlLyORleDJeLWGPeOYZCoPDG5qb51X5oiwM3ZgyJ625KEu0BdVMwVd+wD5QQivEuLbL+WTxgmrET1slSOdi4VwdZUFq9allY0nFo8EirSKplhj7qzxzrrIJ6Yc70N06Cv1W47ohwoJLSJ514iroPmM70UzRpFpzBLrHwcgB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199024)(1800799009)(186009)(6666004)(6486002)(6506007)(26005)(1076003)(2906002)(66476007)(316002)(66556008)(6636002)(66946007)(478600001)(8676002)(4326008)(41300700001)(6862004)(8936002)(107886003)(86362001)(82960400001)(33656002)(6512007)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gm+uU90wVN+sRzc45Ku4XDgQRioH6UN3/Ev56kqGgdIge4GsECHnoyOslqIS?=
 =?us-ascii?Q?uurW/W91AmV5a09RVuERzPPdXJQozAEFkOJPP6imQs/A7Zw3w9HeE0TwF1vm?=
 =?us-ascii?Q?+M4bidcPpiBCyRoPS0tAjckSJDcAtOsWzkzrra3cAf93JCkobEB7AEbGWTcH?=
 =?us-ascii?Q?I1XFy4khVrevfOpfXgpURRLBv+DOUyKcHR80GAVVe4zpHBCuNlpQ03yPOwa5?=
 =?us-ascii?Q?tbW7dHxWZPzVswPY18jqPsD0Z3a40rhciNenoKaxNPmaqawwS4YR2YcyIrhD?=
 =?us-ascii?Q?l6Og7Y62I6fT65xK8G+YM1Mu+0GcjQ+25xS4a5+ZfKe+R0m+JMkjf2/cbQ2j?=
 =?us-ascii?Q?EugF2i64kFhd6H2B6oN/fW5JzhSBgk5D/EXbuPz/Sgi9QQu5kzcpoAduBadl?=
 =?us-ascii?Q?XKTV7kB3QwsYDFi3xW85rsFgKOSQ31LkbSdFxOn2THhKAOOo5LLVjVlJPXKc?=
 =?us-ascii?Q?BgN/cjC38tLD1RiNnFM/Sg+jn+oi7K/T1NbWeK/xSAbrcu1O3D4U3bfKWsii?=
 =?us-ascii?Q?eWiuPynZCNJ9tbfGyutNbRHW6TthaetjX+IFszfPR76K00WQaWiTGRDt9lkA?=
 =?us-ascii?Q?IEteci2nh4YwIGafCjVwh46up7ovl+a+QMcr1T84AMs7AAyEBu1SEJKEJgUO?=
 =?us-ascii?Q?bMHRv3UlLO+qa+96a/VeJZgQZ6bAtuREEXQ/w9krkCJXtFEflXITNbpfzZIe?=
 =?us-ascii?Q?bb8VtNhHewSt2+sco2lbDLp3f5cl1g3CiqijOXrf0eVOd6Ika7qz+6Is6Bwx?=
 =?us-ascii?Q?fYL51PqcHVpfvggcW9xK6T4jYMuzPf5rxFeGknSqZ0MfxdIQFG2pS8KxtHwG?=
 =?us-ascii?Q?bIeOsNS5wWClf2n8IR4/wNfZc54/I4WFa2oNxUfdxz0ojVOCz6c9j2P8/qKu?=
 =?us-ascii?Q?SEZ/3SM+neIKklZsTbdXQi0QMeEmtW1tpfBnzc4IGDKGfOjjhEKMb20ozx13?=
 =?us-ascii?Q?2VHGaE0GjBp1forgfFrsPMBej8N9L2O6ENhzDAdoZm5JM4sJFdYdCirK/+BM?=
 =?us-ascii?Q?Fp31KgzyJJuhKc4G+uSjiOTo0JJXlFXa8zudZ398tyJ/t2GtYhMwSNxvvzAc?=
 =?us-ascii?Q?UvGdvWrwL8lB2r/Bu7jYtbQjjsG1Bw2NBEL6WQqNd2ezRsEBoRn4EIEdO7cx?=
 =?us-ascii?Q?TWseeOF6YQh6YsUFV9ikW3+NzjH7TBzZZ7cxkoeQL0IvNjB+QHSWMpnV1JRd?=
 =?us-ascii?Q?w7/4Z3VmxGgwPu73VaMqqvAgNbHLaZmHHmx9OLebhu6nAx81kjLlN5jkIZkB?=
 =?us-ascii?Q?d9uNQnXSbWvJkgNW9GjUhI1d19GUcj+LPKg+wHxis5X6rMNMzVv3eDoBditw?=
 =?us-ascii?Q?OpW3Lr04B3rAoLftZ4vRM/zIyaxsfqJF0CzqQHaNqnzxcqSOE87N7a2MLsEw?=
 =?us-ascii?Q?O2soHEfwkR8C2KRPCa3o9N1OogMbNSz0XC2SIxSxWNhJNauP/pNhlyLrVnUM?=
 =?us-ascii?Q?s3uX2sXrEfDxjN6khUm1Jey6gRQsSvUCkXvZvNG3285ObAQqTf/64L6kxObo?=
 =?us-ascii?Q?IqKpCzy0yzEHpWU6VDMo2JpgjnZwtBfUrLusLL6owEwM3FAcpItx04za2FBI?=
 =?us-ascii?Q?pNC76bJJ3GPh3lCfq3d+BA8+qgJmffYS8cBTjmWkOX9MOcwXYpLaSKpWq13m?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81515131-c52d-426c-58af-08dbb3d9add9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 21:46:11.0055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cb869s3Di0qj/dJ4YRmBSLkwBRTCbCg4HZbTs1jxB40qkJos0Szu10otlfmIHtgOaqTpRkXRCvsx2ndbiqpMwJCmmQHUncCn1eZtV+s2jz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8664
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/2] drm/xe: Add infrastructure for per
 engine tuning
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 02:28:42PM -0700, Matt Atwood wrote:
> Add the infrastructure that allows for per engine tuning preparation for
> disable indirect state.
> 
> v3: rebase
> v4: fix rebasing issues
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
>  drivers/gpu/drm/xe/xe_tuning.c    | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_tuning.h    |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index dd673a684b70..eff289ae09b2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -24,6 +24,7 @@
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  #include "xe_sched_job.h"
> +#include "xe_tuning.h"
>  #include "xe_wa.h"
>  
>  #define MAX_MMIO_BASES 3
> @@ -401,6 +402,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	}
>  
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> +	xe_tuning_process_engine(hwe);
>  	xe_wa_process_engine(hwe);
>  	hw_engine_setup_default_state(hwe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 412e59de9842..266f6ac38e37 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -27,6 +27,10 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	{}
>  };
>  
> +static const struct xe_rtp_entry_sr engine_tunings[] = {
> +	{}
> +};
> +
>  static const struct xe_rtp_entry_sr lrc_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> @@ -65,6 +69,14 @@ void xe_tuning_process_gt(struct xe_gt *gt)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>  
> +void xe_tuning_process_engine(struct xe_hw_engine *hwe)
> +{
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +
> +	xe_rtp_process_to_sr(&ctx, engine_tunings, &hwe->reg_sr);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
> +
>  /**
>   * xe_tuning_process_lrc - process lrc tunings
>   * @hwe: engine instance to process tunings for
> diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
> index 2b95b0c8effc..4f9c3ac3b516 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.h
> +++ b/drivers/gpu/drm/xe/xe_tuning.h
> @@ -10,6 +10,7 @@ struct xe_gt;
>  struct xe_hw_engine;
>  
>  void xe_tuning_process_gt(struct xe_gt *gt);
> +void xe_tuning_process_engine(struct xe_hw_engine *hwe);
>  void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
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
