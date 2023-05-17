Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13815C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 17:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A2B10E1FD;
	Wed, 17 May 2023 17:11:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BA510E1FD
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684343493; x=1715879493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M0/tdvLYBB7zxVtMjNj9i+mZqy/YmwUR8tLu+J7bAxI=;
 b=LhrDS3VlWthwdP+Wc/XwWAkaXYBjE5YMdfQtnxbj8IZsk63d/PISAHoV
 +d2O1g70HcgUWgot0HU1WFJx09WrpeIS7VhcxNXqfaKg/jf5Vt/Sme4gz
 Oo/wUtelOm3mgXE8ien58Kcz2i9P1GYOXfarH1zBayH8FqQBB3DnilUAM
 nCAWuByshtINdKGBZC2mVvkp3oSGyoF9YxEprCMTz2JOZ5fI7nE0XCeeq
 leUrU58dMj4NJKYjNuop24DUcUt/hqwR0QO9Pbrc5yuW8IrldBnYcqpVf
 IgMfdskuYYzo+CqGYOvaVd8hZ7MLb38OFPoPW4bhigG/MWco8NTcYCG02 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="332187977"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="332187977"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="766848420"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="766848420"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 17 May 2023 10:11:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 10:11:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 10:11:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 10:11:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9i4+HKZfMP8GFIAHQ9FiM/XmA/W22ph6afX60lU8mle/Tp9v9yqYalZ4QSjlRRCCcAHhe4KxKtyLKjp/mrYxRYt0YapK1t3SCMrpsbNWg/2t4EnaJXwvyDcAchVTxixRAc9CUS9GoDNaVtIGfUJxU/O8lFN5CYoUTHf6nqi/BK5U3SOmfNlxMsrVKrd3ayoqRGS1p1Ysip8aU/wfzMy+Xop97dEOT+aJ49xzj41S/FDqPxqEfPL+dQzFWOSqgkhp2LHeN8zaAtHHpDJHY8wREb/BrwpRBHM+z2px9HahmeT7EGvOor/VLTCfI9brt41uepVuaUPrEiYD7NG2InXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I+g8I7IOJIA7h/44bi/qf+zHW9jnnGUeZ7r8krBsfU=;
 b=Y0NXB/IWhY0lw53h9nXi4Hty1wWPdq4d/DZuUZu7P1ygvgpqQZVNh+NG+yHGFSE6XpjhPFMQDt450Y/TdobxfIVVDdL6oHrvWjcaZ7IvNyrV3VujYAduFqSa2hjXQGzXbsy7boogPitrUXw9AI5zkzuuDYrjHKHvUOpGHAyKHkxtbyVO8WirD/VeZmGyeB9GfzdgWpUOw4icG6pyfuKVkga9H3amLTGF9e/Gmit6bSEVp5W6ah3qIjVgANimoCi3aswjNJitXno+0E5ToXYuVN5jbT1omlVaruOQZB1SCBknGPiBSXsztnlUYjvqwNySIYaxOTS889woFAPvFGGYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.33; Wed, 17 May 2023 17:11:30 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 17:11:29 +0000
Date: Wed, 17 May 2023 10:11:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517171126.GO10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516221950.3512818-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: e6455d9a-0b12-481f-f2d5-08db56f9c10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dsIU457gvMpU6jXGBNTzAzRdNGVvPTozEPMwo7a3XdP0c3sIdjkVCo00LG8KK0shCBt1wmLNx19sFV4fksdsiRT/FYBWdzTvYTHiFsJvF1ia8kYooTKgrxneyDKbuozqV+XTrGmASx1ndigfy5wDf3sqJoBgIoV6Z8xZwG2iFFBDHVyAbeXq/hChsaSdw/JSSCQpElXa8XDNMW8f9F9zD7X4Y6ZhQGSjrWKQVBuf0/Vuak2fBIx/MNasLWA3nXzuH5op9UcV4AZcqtOz3z8dtNNQs/I58ZTY43oSeIb5Ifwqd0ua4gx0flEzCmClCLsQ9t5IA4F78AHQzMefSs+k/lqHsN2OO41rSTVDb4OvJjwkE//fNYLhvuNukg2ZCKiQvlW68eqVj8VnBuOCoOFVlJkN13NqNMs07RJAw27Qzp3TeBYl0kOAknAx1vxZVo/zlyTXaCat4fax3dCH4NrY+fn0c4LjxDxkqL32YuJzqE/T9mpSJzjIUtKBhjuz/kPeqZ9V6f53SlZPF2KP3ShJgehiMYoEBw+31MRNmx77iG6rsB2zhyH20iIZgu6tn3w+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199021)(4326008)(2906002)(30864003)(66899021)(6636002)(6862004)(8676002)(5660300002)(8936002)(86362001)(41300700001)(66556008)(66476007)(66946007)(478600001)(33656002)(6486002)(316002)(6666004)(83380400001)(6506007)(1076003)(82960400001)(107886003)(6512007)(186003)(26005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4zl49GEHWQbNyHFt8GkHhifKXhERDk2fpuyOL4N/70C/Kuex9FiXhYJgP0/H?=
 =?us-ascii?Q?ygXTLE8f9GwV60sLSJSM3eH8aJDiajswg6FshZK3G0G1Dqb4MQKRVDlNqjmR?=
 =?us-ascii?Q?F+qW7M78fGDyhnCz8WtptZe7t8DEormwBOWpgSxCPrt8r8IBhBPJLHh3V7io?=
 =?us-ascii?Q?+qXbqlhyl5iKSl2EEl4HdO/TUKNoAyYivr01f3n2J9Vlm5iDXKAzNqFkvLZ3?=
 =?us-ascii?Q?DU82YCV2ufwQ1pWxbw7aCXVfNSOmESaxhElLqARLfFPKVgHy5hnGVoJDr+Xa?=
 =?us-ascii?Q?w0JRpzwTpSLxwZ7iCrga0d+BwxD8e3x7Gj6zwENtTXImRRTBShMoTLfJSHFv?=
 =?us-ascii?Q?JP5CG+FRQnzOjGWf4zIHYv0JvrQuMP0yXwgSOdZllsQHvnpQeTNycwwGEWOd?=
 =?us-ascii?Q?VTZCEOG95kBfTihfhW+lWpgKt7GAfsQqhcKm1fCEFlc0bIqWgTXBrYl+U97D?=
 =?us-ascii?Q?26Kb7qipgH1Je1FZScJwlVtNREjpwPewU3WjSpmjl7UPcUn7VgRTG0vgghOg?=
 =?us-ascii?Q?o99TxYjdcpz5n67NFbjzeIvnFDpavJOSgW0cuoBYzThBJ7Y66sMxtTWMqRnS?=
 =?us-ascii?Q?loSXoSW2zUUF363am+ixEHLJCYTa1jVeLaHdu7qY/KpZEn9DGGKayma6Emfe?=
 =?us-ascii?Q?HbeZjDsP61qZBVTnp0bHR5nag7yyVPm+qPsp104AWEZTtGbAFYtRW9OwTYar?=
 =?us-ascii?Q?pi1wBDOIeJJJbrrKNSf3TBMM0e7AioRR3yNGFHDK1Qk54aEj7sPBC8r8EeMu?=
 =?us-ascii?Q?hsawKjQUh6xz2bfY5frAFUh+2eTGmiMjucSTXeMyQex/MJC4qJfPm7Cj4PAo?=
 =?us-ascii?Q?1gTDptLuqUV9bueJTZn6xgCDSEEKC5JAS5AduwzSoEGUzpOQQZYanf38s+XK?=
 =?us-ascii?Q?PEzMB+paubF0WvcsK/HI/faSG+IIMd99xeGDZpulTmuXfunxDNdRUd9ajZqR?=
 =?us-ascii?Q?2cQWoGQaM305BGGLz5NR1A+B/afiPt2PxbAYAoSO3lXnA5QGQxx6wlRPBnFY?=
 =?us-ascii?Q?6aPBhM9g801GMsoUn7qv0c8r8OvtvyzjQMEl/Af7vwI1y/nrhvSCpsz21bGs?=
 =?us-ascii?Q?cJCCizFirAlDRW9kYg0sgpU29ny/8Sxd41iv2Cxkkh6us+UkqL6fBPNJC2W3?=
 =?us-ascii?Q?8N3EjPX/mc+JYZU7hUKUNA3hroFiKtsya0CBMdKK5UysvsZ5xSzq+nKS/WVh?=
 =?us-ascii?Q?4FX41OTmCh71JvXSN4JbqsX23JLwCCQiTbcFS7+ubxaaXHHnYNZ9nVw1ZLf7?=
 =?us-ascii?Q?DObxurI62dc+TEi8fwuvryv1ARg8c1nQNCYyAhGHun753FymwXj2KkN5gRhm?=
 =?us-ascii?Q?KRijOcnXqg4O+3tRVG4e0WXEDVgf+Shfg7ErDX41XvnZSdV0Qk0HzFSFF4hx?=
 =?us-ascii?Q?KPYlDQqvI/N89/k0TJ4KJTB/RGO7E9bRZ68mFXsln85dWt4Z9k14jH0vdw+F?=
 =?us-ascii?Q?R5VTnTtsTB53yu/2O6ZB09brsnN+q32E+1aiMQU5bDf0g51p7aAG7KgN32gc?=
 =?us-ascii?Q?uVIz5vPDuWenODU4WOA3eTlLoiQB3pYnPXUltk8AOMQxQEx7iLmFPVex/tsy?=
 =?us-ascii?Q?Wp8FeUwVsIGxXrdeToJOXo5zyBBpNKKA9OUlsXDCIhz0FxbF6/yzk8cp7cpx?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6455d9a-0b12-481f-f2d5-08db56f9c10f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 17:11:29.1658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGlsQRcNFd8wKA92M2znVKXhOFE0UR5dLNXKgfk+8FJp+dE90Q7E8POQ94/b7bmndRKNMl4gElo/nhtlB/pKBbvrO5q4wPa1s4z1IXyd8/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/9] drm/xe/rtp: Split rtp process
 initialization
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

On Tue, May 16, 2023 at 03:19:43PM -0700, Lucas De Marchi wrote:
> The selection between hwe and gt is exposed to the outside of rtp, by
> the xe_rtp_process() function. It doesn't make sense to pass a hwe and a
> gt as argument since the gt should always be the one containing the hwe.
> 
> This clarifies the interface by separating the context creation into an
> initializer. The initializer then passes the correct value and there
> should never be a case with hwe and gt set. Internally the functions
> continue receiving the argument separately.
> 
> Also, since most of the rtp rules match against device characteristics,
> add support for processing rules based solely on the device. This will
> be used by follow up commits to process some workarounds.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  3 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c      |  8 +--
>  drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 +-
>  drivers/gpu/drm/xe/xe_rtp.c            | 71 ++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_rtp.h            | 10 +++-
>  drivers/gpu/drm/xe/xe_rtp_types.h      | 15 ++++++
>  drivers/gpu/drm/xe/xe_tuning.c         |  8 ++-
>  drivers/gpu/drm/xe/xe_wa.c             | 12 +++--
>  8 files changed, 102 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 4b2aac5ccf28..f96ef1987719 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -238,10 +238,11 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	struct xe_device *xe = test->priv;
>  	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
>  	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(&xe->gt[0]);
>  	unsigned long idx, count = 0;
>  
>  	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
> -	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
> +	xe_rtp_process(&ctx, param->entries, reg_sr);
>  
>  	xa_for_each(&reg_sr->xa, idx, sre) {
>  		if (idx == param->expected_reg.addr)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 751f6c3bba17..1bf28b1ad319 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -281,6 +281,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  	const u8 mocs_read_idx = gt->mocs.uc_index;
>  	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
>  			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  	const struct xe_rtp_entry lrc_was[] = {
>  		/*
>  		 * Some blitter commands do not have a field for MOCS, those
> @@ -299,7 +300,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  		{}
>  	};
>  
> -	xe_rtp_process(lrc_was, &hwe->reg_lrc, gt, hwe);
> +	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
>  }
>  
>  static void
> @@ -311,7 +312,8 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	const u8 mocs_read_idx = gt->mocs.uc_index;
>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
>  			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
> -	const struct xe_rtp_entry engine_was[] = {
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +	const struct xe_rtp_entry engine_entries[] = {
>  		/*
>  		 * RING_CMD_CCTL specifies the default MOCS entry that will be
>  		 * used by the command streamer when executing commands that
> @@ -332,7 +334,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  		{}
>  	};
>  
> -	xe_rtp_process(engine_was, &hwe->reg_sr, gt, hwe);
> +	xe_rtp_process(&ctx, engine_entries, &hwe->reg_sr);
>  }
>  
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 7a2bb60ebd85..98f678d74445 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -63,7 +63,9 @@ static const struct xe_rtp_entry register_whitelist[] = {
>   */
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>  {
> -	xe_rtp_process(register_whitelist, &hwe->reg_whitelist, hwe->gt, hwe);
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +
> +	xe_rtp_process(&ctx, register_whitelist, &hwe->reg_whitelist);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 0c6a23e14a71..648a38bf8f0c 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -23,11 +23,11 @@
>   * the values to the registers that have matching rules.
>   */
>  
> -static bool rule_matches(struct xe_gt *gt,
> +static bool rule_matches(const struct xe_device *xe,
> +			 struct xe_gt *gt,
>  			 struct xe_hw_engine *hwe,
>  			 const struct xe_rtp_entry *entry)
>  {
> -	const struct xe_device *xe = gt_to_xe(gt);
>  	const struct xe_rtp_rule *r;
>  	unsigned int i;
>  	bool match;
> @@ -62,22 +62,30 @@ static bool rule_matches(struct xe_gt *gt,
>  			match = xe->info.step.graphics >= r->step_start &&
>  				xe->info.step.graphics < r->step_end;
>  			break;
> +		case XE_RTP_MATCH_INTEGRATED:
> +			match = !xe->info.is_dgfx;
> +			break;
> +		case XE_RTP_MATCH_DISCRETE:
> +			match = xe->info.is_dgfx;
> +			break;
>  		case XE_RTP_MATCH_ENGINE_CLASS:
> +			if (drm_WARN_ON(&xe->drm, !hwe))
> +				return false;
> +
>  			match = hwe->class == r->engine_class;
>  			break;
>  		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
> +			if (drm_WARN_ON(&xe->drm, !hwe))
> +				return false;
> +
>  			match = hwe->class != r->engine_class;
>  			break;
>  		case XE_RTP_MATCH_FUNC:
> +			if (drm_WARN_ON(&xe->drm, !gt))
> +				return false;
> +
>  			match = r->match_func(gt, hwe);

Would it make more sense to adjust the signature of match_func to take
xe as an additional parameter to allow general matching without a
gt/hwe?

Actually I wonder if we should just split out the addition of
device-only support into its own commit later in the series closer to
where it gets used.

Anyway, not a big deal either way; up to you whether to make any changes
or not.  Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

>  			break;
> -		case XE_RTP_MATCH_INTEGRATED:
> -			match = !xe->info.is_dgfx;
> -			break;
> -		case XE_RTP_MATCH_DISCRETE:
> -			match = xe->info.is_dgfx;
> -			break;
> -
>  		default:
>  			XE_WARN_ON(r->match_type);
>  		}
> @@ -105,14 +113,15 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  	xe_reg_sr_add(sr, &sr_entry);
>  }
>  
> -static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
> +static void rtp_process_one(const struct xe_rtp_entry *entry,
> +			    struct xe_device *xe, struct xe_gt *gt,
>  			    struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
>  {
>  	const struct xe_rtp_action *action;
>  	u32 mmio_base;
>  	unsigned int i;
>  
> -	if (!rule_matches(gt, hwe, entry))
> +	if (!rule_matches(xe, gt, hwe, entry))
>  		return;
>  
>  	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> @@ -126,23 +135,51 @@ static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
>  	}
>  }
>  
> +static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
> +			    struct xe_hw_engine **hwe,
> +			    struct xe_gt **gt,
> +			    struct xe_device **xe)
> +{
> +	switch (ctx->type) {
> +	case XE_RTP_PROCESS_TYPE_DEVICE:
> +		*hwe = NULL;
> +		*gt = NULL;
> +		*xe = ctx->xe;
> +		break;
> +	case XE_RTP_PROCESS_TYPE_GT:
> +		*hwe = NULL;
> +		*gt = ctx->gt;
> +		*xe = gt_to_xe(*gt);
> +		break;
> +	case XE_RTP_PROCESS_TYPE_ENGINE:
> +		*hwe = ctx->hwe;
> +		*gt = (*hwe)->gt;
> +		*xe = gt_to_xe(*gt);
> +		break;
> +	};
> +}
> +
>  /**
>   * xe_rtp_process - Process all rtp @entries, adding the matching ones to @sr
> + * @ctx: The context for processing the table, with one of device, gt or hwe
>   * @entries: Table with RTP definitions
>   * @sr: Where to add an entry to with the values for matching. This can be
>   *      viewed as the "coalesced view" of multiple the tables. The bits for each
>   *      register set are expected not to collide with previously added entries
> - * @gt: The GT to be used for matching rules
> - * @hwe: Engine instance to use for matching rules and as mmio base
>   *
>   * Walk the table pointed by @entries (with an empty sentinel) and add all
>   * entries with matching rules to @sr. If @hwe is not NULL, its mmio_base is
>   * used to calculate the right register offset
>   */
> -void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
> -		    struct xe_gt *gt, struct xe_hw_engine *hwe)
> +void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
> +		    const struct xe_rtp_entry *entries, struct xe_reg_sr *sr)
>  {
>  	const struct xe_rtp_entry *entry;
> +	struct xe_hw_engine *hwe;
> +	struct xe_gt *gt;
> +	struct xe_device *xe;
> +
> +	rtp_get_context(ctx, &hwe, &gt, &xe);
>  
>  	for (entry = entries; entry && entry->name; entry++) {
>  		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
> @@ -150,9 +187,9 @@ void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
>  			enum xe_hw_engine_id id;
>  
>  			for_each_hw_engine(each_hwe, gt, id)
> -				rtp_process_one(entry, gt, each_hwe, sr);
> +				rtp_process_one(entry, xe, gt, each_hwe, sr);
>  		} else {
> -			rtp_process_one(entry, gt, hwe, sr);
> +			rtp_process_one(entry, xe, gt, hwe, sr);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 8bc946694bfc..e7f254fb1b31 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -358,8 +358,14 @@ struct xe_reg_sr;
>  		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
>  	}
>  
> -void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
> -		    struct xe_gt *gt, struct xe_hw_engine *hwe);
> +#define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
> +	struct xe_hw_engine *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
> +	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
> +	struct xe_device *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
> +
> +void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
> +		    const struct xe_rtp_entry *entries,
> +		    struct xe_reg_sr *sr);
>  
>  /* Match functions to be used with XE_RTP_MATCH_FUNC */
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 12df8a9e9c45..6d9ab9eb91ba 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -95,4 +95,19 @@ struct xe_rtp_entry {
>  	u8 flags;
>  };
>  
> +enum xe_rtp_process_type {
> +	XE_RTP_PROCESS_TYPE_DEVICE,
> +	XE_RTP_PROCESS_TYPE_GT,
> +	XE_RTP_PROCESS_TYPE_ENGINE,
> +};
> +
> +struct xe_rtp_process_ctx {
> +	union {
> +		struct xe_device *xe;
> +		struct xe_gt *gt;
> +		struct xe_hw_engine *hwe;
> +	};
> +	enum xe_rtp_process_type type;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 5fc6a408429b..c2810ede3a65 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -59,7 +59,9 @@ static const struct xe_rtp_entry lrc_tunings[] = {
>  
>  void xe_tuning_process_gt(struct xe_gt *gt)
>  {
> -	xe_rtp_process(gt_tunings, &gt->reg_sr, gt, NULL);
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
> +
> +	xe_rtp_process(&ctx, gt_tunings, &gt->reg_sr);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>  
> @@ -73,5 +75,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>   */
>  void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
>  {
> -	xe_rtp_process(lrc_tunings, &hwe->reg_lrc, hwe->gt, hwe);
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +
> +	xe_rtp_process(&ctx, lrc_tunings, &hwe->reg_lrc);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index b0bb2f4438f4..4b236b6f4c8e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -579,7 +579,9 @@ __diag_pop();
>   */
>  void xe_wa_process_gt(struct xe_gt *gt)
>  {
> -	xe_rtp_process(gt_was, &gt->reg_sr, gt, NULL);
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
> +
> +	xe_rtp_process(&ctx, gt_was, &gt->reg_sr);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>  
> @@ -593,7 +595,9 @@ EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>   */
>  void xe_wa_process_engine(struct xe_hw_engine *hwe)
>  {
> -	xe_rtp_process(engine_was, &hwe->reg_sr, hwe->gt, hwe);
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +
> +	xe_rtp_process(&ctx, engine_was, &hwe->reg_sr);
>  }
>  
>  /**
> @@ -606,5 +610,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>   */
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  {
> -	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +
> +	xe_rtp_process(&ctx, lrc_was, &hwe->reg_lrc);
>  }
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
