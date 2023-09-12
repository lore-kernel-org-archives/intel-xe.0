Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6E9EE3F3B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 21:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979C210E094;
	Tue, 12 Sep 2023 21:54:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032C210E094
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 21:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694555659; x=1726091659;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=73GaYtw7oNgOpY6w9ydRoB62or4s3ZlYmbOSwencPe4=;
 b=juWPHedEfpUSMOAJaGmagejQma6OtOOSL5x0kuaMf4lPcv/81YVFMzuk
 rfPdPOERcp0jKHkMX0JAWgM5KMTxkZTH/jlKYkWAxTU4FTHEHQr7ty597
 D3vJfUphkFu9I0rBDQNFo3VbTqp4PrUWw593B5RsYgH+dGCTnnulYWRXH
 9Pm1mxNPAf20ZJbmEEhZMfhxvNwlYpAVCqluSHS+aZ49fsFL9ALwiLGoK
 QIeBPA3khWqVttK6WFO+JIMOQQOB74lG9yy3kVk1pNp0eENQKkRmyIv7z
 YQyTH8VDsF1jGiT/x18nTmKAg99K2Vn3aGUeY8koGLEi6135tZCpSjvMS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381200942"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="381200942"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 14:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990658775"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="990658775"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 14:54:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 14:54:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 14:54:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 14:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNca/K+m56mdAFoDM/fAxQgsyUGukPmH6GhTfDVZQ8cOZvngVi8x3l4ItIRB7lXVuE6RGv3zyZtuLX13MhhWLP2Mz0pgSaQHXlEeYNA5TG27uexMkYIpq6e23W9VqTpWbnyiqw+Mb+VGpHn3JedVE3FsTNrxkrdOlQKVBb89KSKuU2JhrtNN58AdZ/rZUWUEInFQ0OWVsCU3MXxchlTIZY0lc0fHSXU/6DLzRYbId+qwt3M6LfwPmhot1YbzMC3/KFuHP30dIaWymHFHHJb0ApNhEz6+RpQwKy51mwHj/OENW0h7qBBdjD9zyOfofvbaQ3ZPev1zUVUBThtHPIe1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEpXHRPPpfkBsurEwW8PDmGFJExIH2Xwj8kQhBAwQFQ=;
 b=HwU38+aMlklTv9EVImrrQjU2L/ZD59S6xVulaspBVSGjp8Asjr/WUerjzzO2uUDby45oMoRjHzDq5u+1vSLX3pmI3HuhTvcJb9FF9N2CDFfLSyaXwRCA5llTQE9tuPu3Sz1OFFXiJYWNtL35LXYFmKrZPOXjO9K/A/k/D6XvmGwC09l4UhO9bavdTtw/5n1+pldSowbRaDTa+EoFWwcH1xX2ChMr3wnIaFXlp3TUaIJyj0sMTT0J9zuxxVBlELTo9390BXemn7Lay6k305N8dz+BzENoOft1v6YdpGulaE51xHmUc7MLj9QgBQyYpNDSc/S1gA1Lg5fiZxuAbmJ0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Tue, 12 Sep
 2023 21:54:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 21:54:14 +0000
Date: Tue, 12 Sep 2023 14:54:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <20230912215411.GQ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230912212843.681802-1-matthew.s.atwood@intel.com>
 <20230912212843.681802-2-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230912212843.681802-2-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ccdcb8-f2e8-44c4-655e-08dbb3dacdf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c05g+hNAM8CRsPAJ/09w+olK2rLUj0uZE2acIlZfamHD7wNUDTcFFgl54X5eeIOOkf15PugZoF8+7ITrpUOdlOJFZLuyHWLamOY2xjie6Vn7IXhyW98Rprz09L4R13lN99rmu7RVVEP6u7p2l2wZ0qljqFZ8aOylmOp5ISm4W2Qpbi12Tos88NS8i2yXQJOYMFzoX5jeOjdPZCp5FnVB/kv06+QJSS5UQcPlromuHnsbOZrUKk0hpKowKikmLf9IjqTm6RlpQcvuukLq4bzTv9zmv8LNn3rjXQ4z1k4QCQ242gFd0+t3lL5lDWKxDxLAW2jEv/pRTXqbeJzD2Uur/NR3TH1l5Tio83w5beo+R39ScRgGHMlicukmPSkJ7wwPqJjF1d+XTxIFjjMUdBe7Vz8Rups545LUzgeW29ZtaXv8mFOtxCLW8hqldO0tQTDJ9ncT0eVMweJMPkDkoEVR95dcnqz9j/LXNj6DpwwE6KhcMYcIkBiZ/o1SYsd7LgQrb3iVSaR9aZ9A29xHGiPkMr1nGRJF4eNP+n6EzY8fbu0fMEaUa2fXgfJkQ2wTi6hC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(5660300002)(6486002)(6506007)(6666004)(83380400001)(6512007)(478600001)(26005)(2906002)(41300700001)(66946007)(6636002)(316002)(66556008)(4326008)(66476007)(6862004)(8936002)(8676002)(82960400001)(107886003)(1076003)(86362001)(38100700002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lap8/rZTriuTYdLABUFUffFa5PKnN0Sr2HYlWYEt2wtdCESI6+dJ8MbBVqsT?=
 =?us-ascii?Q?PkAWymSOREM1bO4P34wcRHMKknKYx0Whd5BaesjeRSyWCyRV8sdjJInNqVH2?=
 =?us-ascii?Q?4XgyYRnKH+M4dqMB7Dkpyr6CbD5S/dYRk6HXF9AjQUvDVHHYbE+OwSCzOpLQ?=
 =?us-ascii?Q?AhibDnNq4TZ/UDSmF9C2h0Omafgs5sF6VXHFcA1OX0A5skXVZ0AhNpMa4Xe9?=
 =?us-ascii?Q?OgJ8rdJZhJmETCQ0yKNgh/RE8KVKOBjikvhZYWus3kVYe1f6LcEHO8bYcwhP?=
 =?us-ascii?Q?8lz2owdps7fSSSQZYlD7f9Us+J92QD9gP649WHfCzTyqChfQJFblIU/uwnHg?=
 =?us-ascii?Q?de0VKJ0WXJLfds3DlbDMhVe58Fl7itmUo9IjNF+KqRsv1dB+wAtyoqItAkqn?=
 =?us-ascii?Q?lVcAI0dkHRyarGyo+zyWyxNC+iOfyGluYZjTjAVst0ViEalCvtvP1n3EgjQg?=
 =?us-ascii?Q?TepckLefStClSkRS9mdxb5gW2lWtL8SD1nwSkvZw0FUnq8ejbL13KE1XcTSc?=
 =?us-ascii?Q?8GguLHEmMNlRUKx6hJRElGqRsPEXiolzJjRpIGAY90fPsCskZ7DWa5xKGSsL?=
 =?us-ascii?Q?KYo0xHt3pmJMmbMwSHx/1rXK22VYyY91QLL6d17uGCgEsK7fz9GuEiDnuoGO?=
 =?us-ascii?Q?2XDx/o4MXo/fya390jETnCdBr/NcwQrUpKYa7nptpG/eSHP4YDJIk/rNM2cu?=
 =?us-ascii?Q?/V+KoV6FNRikHajrudHmWaN0vR/5d8RavEaSIKwduQ9vyUStqdRAWVXcHMLp?=
 =?us-ascii?Q?cyQojdBcy9mx+jEvg4rZWWV373X5WDQtiZvBj1y+LXmoe298eKA+ZYLH2jV3?=
 =?us-ascii?Q?4aPdTX1e7YGtt7eQSRUb7nG3qPhMFJk8eH14TWs6W+aq1BZdh9lmAlnJ8nHe?=
 =?us-ascii?Q?Mq3jzuO0jzBfOpb3BeAO6oo96kWn7qQ9R+macKOaqWWEF65OC++bKfGnTIxp?=
 =?us-ascii?Q?AxyVU14D/94yiUNgbfsnStSz/zybfWvG282eCtIUosfAecaYlrrsIANBxQ1R?=
 =?us-ascii?Q?ZOBE7xM33ejma7bulElyus70m3F7JixuBjIM/zJ5zwG4zbf4ut7+iWaQp8lU?=
 =?us-ascii?Q?gdnyiEbV3o9mwEzFQJ26GIcTYsIkJjNGiVfUUSL4I2Qj479yY3jipaWiOOHI?=
 =?us-ascii?Q?8zaUrLvj9+Qp5PKItkoLJq0hhBbLY8P0Prm2mnLvse1BHFAbGSF4QB238jWy?=
 =?us-ascii?Q?M4KSnMNPejf0Vkzf/A5/gbrfD1MJVH5OIjXtT1FShj8RqEjygEAae0xVMxGe?=
 =?us-ascii?Q?zmTWVcwQEltdRv0eKEe/Msk6FPYCusLGOHu1H5bUP00nUhPp0zUruOIdFz6B?=
 =?us-ascii?Q?/UqGKsUsSrwi7gpTuEjisSARNhfQru+7JoU7uwfOCQzCP1BWQljcLEwOfsob?=
 =?us-ascii?Q?Unwlgw9QGg0r6NSqP+JqTHWin6wMgiXrVEZA/lIR75WguCa8XdxcnGFWFWEn?=
 =?us-ascii?Q?Ty31Tug+ASxk4O44cTpSexGN8Nt5jRXRir//h59q+7/EFzaDyDkd9RbM7pdB?=
 =?us-ascii?Q?h/mLI/Ow5kBfeYToMv7eW2mOOufVUO1OlGq9y0lzfs+415wkSXBJnEOT/A+0?=
 =?us-ascii?Q?spryXAEkb15WJXuoao2mJh7dFPNDqWnLXYUbKoRA35MeBS7hZacbdWDxe3OS?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ccdcb8-f2e8-44c4-655e-08dbb3dacdf7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 21:54:14.4244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+Us4XMgo+bcj3L5Y0NDdTNLAtj0MSgoiDMEBDd5HIm8TEwaVgbReexHr9m570XdZ3Um+3a1hH9j8k1zUItjk5RV4PiVCV13XC5Ef7ungMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/2] drm/xe: add gt tuning for indirect
 state
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

On Tue, Sep 12, 2023 at 02:28:43PM -0700, Matt Atwood wrote:
> Force indirect state sampler data to only be in the dynamic state pool,
> which is more convienent for the UMD. Behavior change mirrors similar
> change for i915 in commit 16fc9c08f0ec ("drm/i915: disable sampler
> indirect state in bindless heap")
> 
> v2: split out per engine tuning into separate patch, commit message
> (Lucas)
> v3: rebase
> v4: Change to match render only, g.ver 1200 to 1271 (MattR)
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

But you should still get an ack from the Mesa team before applying this
to make sure they're ready for behavior the change on the Xe driver.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 271ed0cdbe21..b456a7617883 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -298,6 +298,7 @@
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
> +#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
>  
>  #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
>  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 266f6ac38e37..2ae73b599f52 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -28,6 +28,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  };
>  
>  static const struct xe_rtp_entry_sr engine_tunings[] = {
> +	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1271),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> +	},
>  	{}
>  };
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
