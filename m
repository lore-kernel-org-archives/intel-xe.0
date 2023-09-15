Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57724CD379F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 20:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB8710E678;
	Fri, 15 Sep 2023 20:01:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A18E10E678;
 Fri, 15 Sep 2023 20:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694808097; x=1726344097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CY85c841K+7/BkCtK6gsVBpf0krvtgaifAgvlpuUevU=;
 b=WsDqerKCJY1eX3RxMN7YVGDiRe0BygpqZFT8kOItRu+TMVry1njs+wIz
 SPhIId0lvcTEcHLhPMrBo4QLmkFLbjxKbRh6DcOLrqEPhzF3vi/V9pBd8
 INtRX6F6Rr0994+8HmAMkz16fdx8W4FQ1CBUt0ka2RAUeEmC5W6M+zLWk
 gRaLVdr1r2PgkwIAdn8rmNfoOBrWpCXipxcu+LpH9Q2BdT4FQiDUyLmTU
 OkeQT0Kr6QSH6SjIbahWAf2MscSMdVKAokTK54TFQ0J+wb+dR2B0Ddq/X
 Z8jy6tpDD3vbHWJQ74HnigbnngIgPUDVLLaHfM7nw0MZMOJtuKSbExtnx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358748020"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="358748020"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 13:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810636987"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="810636987"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 13:01:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 13:01:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 13:01:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 13:01:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 13:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l20gqa3f/sceg6xjQ+dMGkcuAtG+eXyjNLla3r+YWSYMFXiV5MyM2X9gSHC0Wu1x3xjoMFUv6zAPQPJacxL/ULVtVz+DSl/UZZxOTJ11SktlO1OO2bCJHR9LLZQrPmWqiaJwXrU92RrW8pAMh/0c1A/2jt0O/boSByNfKitbSLS6VrklZFvcwO76MJEEjEQemO39p85Nd0NFfmy/j6Su5eRy4gIJsdv/kM61q5H826rZGoP5xhUldNOBIM5NTgmX3dvGWLHs8GH/uUOli5FXCrMZCS+F3NeUzBUevl9R+H37oEpS4PTXQEvW5mGlplnullE/LyCceUSqjldEhcEMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1B+v+x6CA1y9Bo0UB3gHlh0+rAvQEcc5oqfxyAT6w70=;
 b=OfiWTp/GvY83j04cGEpRppm2j2eME4yAUEGRB3ND9sLE14hNInE0wrcRF7TNCpL1xXOtLh2CMR/fbs7UpEkQYtcRBWnFWeW0oPXM6nz58MDnxoe4fy0felyjJ4GzJqIBYeeM0jKITdgta69qt11VLgIQwZ8yFKIGJSNTF2EoWMBnpzzV6gGlY78fZ89uSzw+EBbvm+n6bqtSRlZWMEtj/nOvH6zDILjYR/HHPZlny4bH+nGKxgAhJJDra/EyHAIekaaeXwmM53x9a2SVtAkEEEZ5nyb3R/HO8ZKx55LxIezbxLBjQfXtvI2w6mjh4vdeqq1FlVbBhcQtXRZSLEBAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21; Fri, 15 Sep 2023 20:01:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 20:01:33 +0000
Date: Fri, 15 Sep 2023 13:01:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230915200131.GI2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b75d7a-e2da-4577-5662-08dbb6268f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xU4wKXkSrHBBs8R0hvF99fF6vWCqASoQTt6NiyIRY1j0ZX2YEL9dLTux+JGC+CBpxzHXLSZY4Y5R0olILUBOPhrBsAJeEnmeMCasO0sL+yvisigEY7fzOggNQjDMnIgtvnqZF05xmIi+Jf1SyFFCZ4iFOK080AS3HMCpWPqT2OzM0pUC+w7/BnFHLpnKQkStRuABlYZR8GQ0D3fKBiiZQzyLriWAn/xPHx++IjaxmUnQ3p6L5TGLCvp4ON6L8mIW02XvV18C7y44gA1B26j+W9hJuY5NPqUPLzcl7nRGyvhCIvjhkmF6BOcRytQe54JQgD5s+M8Y/2aVd23jbFOiEjUwbKPob39rQ0WeXp82NRZNR6YgSerUJiqL2hpANobf7Qyxk4oJTbGujvW5ZWEOySc2p9WX99cPqto4kg8t3725IWe9VPVDLKeyU0Qe786TLB9kg24x4XqGyU0haiqR7TPSThIwoStqnAfTktHH8kJS4VAJAf6gLoig12jMGYUH2Vcz9+5ykvJWuA0Mo8/k9bb+1hDxXIubp6xqhrCSMlTFdltz1ea/LI43b5vHJ+ns
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(6486002)(6506007)(6512007)(478600001)(83380400001)(26005)(1076003)(2906002)(66476007)(66556008)(66946007)(316002)(6636002)(8676002)(6862004)(4326008)(5660300002)(8936002)(41300700001)(450100002)(33656002)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gLqofCM0AVJcQdofSdV+lZ1OGynMjWcTkHQzFBLwoQTc2O5/d744OHulYh9s?=
 =?us-ascii?Q?y8TQnE85qjqzssed8/klnJq2IE/hITgpavWCWCxqfyvV2CDvOJHgYvz/TdXi?=
 =?us-ascii?Q?AQ2xJxFuSiqKSLqHrJh3/D5+7ZknjxMLADlWBhoBM98sBDtFBvZjOzgERqPO?=
 =?us-ascii?Q?H13L3+tYyANIDzP8Ed/voAh1EO3uWKu8OuxkU0fr4kJSp+VGHIaCZobVFOBm?=
 =?us-ascii?Q?odh8OXlnzyoJ88twskMFDKhoGFQw2H9AkzdgplpUxlfYdGiqY0AA2tLcZWoV?=
 =?us-ascii?Q?6er7aUEfucY6VLe4N/1Pgxl9S/Fo8z0H0EgQxRaw87gxGVkfg7aw6uSu+NX9?=
 =?us-ascii?Q?d+YYAiSYX4mPYDRcpl4HURv8aaefvLVN2LQoFTSGE5O+PD9l5tTjWfMT8DTt?=
 =?us-ascii?Q?g8B9HDSn0lHg7HogFN19CwdnUDEH+iksWjNICf52veTnCOM+NNuEbY6EoD2R?=
 =?us-ascii?Q?b3ZWhNG6IdLApblqJGAcHNfhRTFY8osP9CCdcLa9tDomuwJBbcJHyf3xpNN2?=
 =?us-ascii?Q?7+TIA0culfGNbMMYS54GS2mNe2O66jtUIPONBTe4NCnx3XNufexGExYlKJlG?=
 =?us-ascii?Q?a9eVCgTRmDjjGlOMSXqXmQ+2uYf+740HlEfiTBLn+GebJVvxRExGgcy0f6bD?=
 =?us-ascii?Q?tn+P9UXZu7ulFt/ICoGhZaWHFcUZavpmId4Z9Opf8Sa77+y6EMdD05Sq7z1B?=
 =?us-ascii?Q?FShjAJhfWxYiZf1pHgkRfAlMBQ5zlOzu/8AufZ61icAgmycKMAH9AsjbWiB2?=
 =?us-ascii?Q?FZe8K0gu6g/4AgoyHfgTDLs+Vvvj0YAF1iHoQdOEB1Awy0CpHkIyRmaBzY6W?=
 =?us-ascii?Q?y/NMCamJQaPYSxTwrwkylg89JrEj2uVsckWX+VP/JlFnSidKPWwWn/dSQRxU?=
 =?us-ascii?Q?aUQT+8xGL1FgHbze51apl1x9SJWobiWJzzq5fbtSXIpvcQW6euCSN4fM0AZl?=
 =?us-ascii?Q?LudLkHRgfNtsBsWgD52wlMPJuqMf0GhzU1aKDf0+1DJkRkSLXYflQmPHpybj?=
 =?us-ascii?Q?lhxul2KJq+fwUKT7/jevOoCEkS7vhbC7+avi0Xh3q70d3DKLtpNERu2ViHsm?=
 =?us-ascii?Q?5rplSyn2As6ok+U8UOkFzg8R3v5F/vZyMdh2eupdWFDMz+XVXjMXYBWqVK27?=
 =?us-ascii?Q?nK8+8YIRHxh5K5Vkk8iX43Qm8oN/6LQ7nE5SIJFM93hfmwyZUg15InuRJPw/?=
 =?us-ascii?Q?GjtmOwi5V1dPbH41aCfaQZV4Ohdf1w7IWVx+cYdPVuvVZ/wGGXsUABpCTJ0i?=
 =?us-ascii?Q?bYjv4qgqth0245hBzniozBLFFjCdDTcAWFiGuA5kMCSbVASCnydYp5Aj/VqM?=
 =?us-ascii?Q?wfXm+MF88ixMGoKw3G4rn5aPJv4Tv8dMBJ51VI3r1mXcyXu9FCHG/MSMGyCw?=
 =?us-ascii?Q?LY7dnYuj3VsjMFwEgIsFjdmcdlLnSe/TyigtlJB1F9JaGe5pmDfskZ6C8MtL?=
 =?us-ascii?Q?S3JJD60RRmlD9jhaVw+r2QjhjqdE+kuP4VvMeQ8zv1uAGy0maxAuoZr64bUg?=
 =?us-ascii?Q?ALj8ITFHpN4vRh/a4SEMDlumigXuGTZ8oFW29bJ1QuIq4DNHh2odR2LiXOVB?=
 =?us-ascii?Q?gKVIdd3ZOuMbPP4VBWjlftU1raltlZqPjwX/KvB6lOiWnhQJAssANYUWoI8k?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b75d7a-e2da-4577-5662-08dbb6268f64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 20:01:33.4912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+xIA7AwVmUJ9MMi1Nbk5nNS7nsLzNRQM6D/U8w3p5ZbJpaOvBNEKWocAKwUaOxd5HbneXiX7Pn7WEx8O77De4EPtMEnNv0ENsrroRa5xGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 05/14] lib/gpu_cmds: Reduce scope of
 xehp_fill_surface_state()
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:37AM -0700, Lucas De Marchi wrote:
> gpu_cmds.h is the interface to other igt components: don't use it
> to declare functions not supposed to be used from outside.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/gpu_cmds.c | 8 +++++++-
>  lib/gpu_cmds.h | 6 ------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 83d2302f9..e53580e65 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -25,6 +25,12 @@
>  #include "gpu_cmds.h"
>  #include "intel_mocs.h"
>  
> +static uint32_t
> +xehp_fill_surface_state(struct intel_bb *ibb,
> +			struct intel_buf *buf,
> +			uint32_t format,
> +			int is_dst);
> +
>  uint32_t
>  gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color)
>  {
> @@ -873,7 +879,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>  	idd->desc5.num_threads_in_tg = 1;
>  }
>  
> -uint32_t
> +static uint32_t
>  xehp_fill_surface_state(struct intel_bb *ibb,
>  			struct intel_buf *buf,
>  			uint32_t format,
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index b7ed64f84..5ac007cc4 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -116,12 +116,6 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>  			       size_t size,
>  			       struct xehp_interface_descriptor_data *idd);
>  
> -uint32_t
> -xehp_fill_surface_state(struct intel_bb *ibb,
> -			struct intel_buf *buf,
> -			uint32_t format,
> -			int is_dst);
> -
>  void
>  xehp_emit_state_compute_mode(struct intel_bb *ibb);
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
