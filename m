Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0EAC83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 17:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DFA10E17A;
	Tue,  5 Sep 2023 17:19:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042A10E17A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693934375; x=1725470375;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=57Se1bRceKwpWGt2kl7L1+GHcQ4V6sXwGx7k3933g6A=;
 b=NH32Cwzp8JAPL7vGVaPcj5sA/7U+bFCzn9BbVVEdn929TDX3xBZH+9Em
 Y1JPLE+67EyiKYQFQqwdfgxi+ONt1X0XUN9S9SAwAtPKYtFw5vKGo9ZWG
 KyL428spovalCGW37r83GCyPNZEUsrWcaHiaBfUQkHTCS/rExwa3mmIFH
 9my4NNogAXIO64A14C8VdHKPaMYLU3uDVHA+5M88wPOm19gQVVoUX4be3
 jRhCPLYxqlSh+yDRTQJ5Yzj+HSVBRWNlkra4A59ESv9WX8yF+FS6NVuYk
 uN4ERfTcgQImJXHF6BN4xsGD1pSPNC032TSsQFj41xlXcbpE8jBPJxVSg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="443244842"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="443244842"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 10:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="734726674"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="734726674"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 10:13:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 10:13:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 10:13:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 10:13:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 10:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vxn2VjuCRV6Tcy/HRRDmWihdYylGunvmQs+9bELJnY6RNwvUvkUaq8g+WSNu3jW9NUuhf5Qy2dMOqqXJDGgVYzfFrb0V3wmDES6GxzWSsufRaitRWdjOqkG7edHpg3XWbTbYzjBg1ZNjSEE7YeTiPIUU2SKsfTnirdYGryHrnYmQ249HHsnU5XTG7ky7Zq9W08IVqtuW1oLObC4oBxVwgeiNoMTulwRXjWbavLxOqaOOVDctVYOOOWYGz+FK5U7xIGkmVqzASqcLp73CPrv9isgCdk9UZUNt8/JyIJa4wvYHqrPus5d3oTlhDkjN00NwNxRMWYJYMS3RJ0+hFv7TUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BjUPVYjJSjdQWDxpeLNiXR1WMzXgLQ6DxY9POFJVZU=;
 b=XJi7FdvNOV7V6f0SHaEmuVcPQbWvbIVYw91WG0Q1GzI/3ZVN3eCl6FIWeZx1mE6J9SGEUDXKYujme6NVj/qG52PK6VeZO/Fux1AQcOlk21cgvemcvVYXN0EL9bi1HSv3wAA65mWA07evp8kH3qN0SlF93IlLpKqS7EfUCcf0bhrRFar61t6yxrO/sIzKbDdwZAWp+3iVWjS5SXiXbUEO+xdZ7RK6uqoT+gK5TUAsxtAgpnhQWHf1W9qFiqP/Ma79Y/fM3M0IC8Yv2ZyUj9S9wdM0lDGOlKj7zdw+Xso1pIVqtEpvYbl4ZoNS9jMRS5VLNnuKCxjHyqn1+PWsKKUWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Tue, 5 Sep 2023 17:13:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 17:13:50 +0000
Date: Tue, 5 Sep 2023 10:13:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230905171347.GB2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230905143144.1706967-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0068.namprd02.prod.outlook.com
 (2603:10b6:a03:54::45) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO6PR11MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1e65f0-27a1-429c-5d93-08dbae3378ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lQVWpUqM2/vPZkNvrYkmgVCHcvAv4i+Z2Eo6wdKeh1kAm7oV/vmn3a4C4px3oslCFUleco/zDqmzE7FQKg0/226FY0jDcfmzTIuwaKQ3+oGePZdphNro58ZK9kd03eiCS48bx8hutnTo9ryBU6uE6J4T8wRDD7qFty5hVzwTE+MkTOJgSBHdbPx8rBgNWtIwjqvGDWHxCbZpCplzYXJ5II+59K0w/yBX0m4WZ8YKiUc/D9kGB0fWlTb450vmRlayHn5vDsEkuxPlqeL+Lh0PeFrJ7nDxxJPd8IgiYYe3qZlrHaRnM/w/CYN4VQiv16nvvPjuO47GefVfP28bcp6YFpqRW8lwb+jL1QSIMshA9islgVIMGazk6hWf3LdLwtt12wcylr6WLv3U3+LdRg4V1l9Nvg3zapJVyVZzIcJ1lCUj0JkvGa5lPOAqg82ypkrXMzoP9ZVi9/EJtS1dGfZnqA0W+Z7/wVM1VIuJ6XoTljFrWOU8kIzv23vVxedxmbirLHKtGRLwmMXmD9iVyBcwZJsoeendEtn61h1HmUJSJENAG3dYxj2LKly2w/ev+cf/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(396003)(366004)(346002)(1800799009)(186009)(451199024)(5660300002)(82960400001)(8936002)(8676002)(6862004)(4326008)(38100700002)(2906002)(6486002)(6512007)(6666004)(6506007)(107886003)(6636002)(316002)(66556008)(478600001)(33656002)(83380400001)(66476007)(66946007)(26005)(86362001)(41300700001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O4fBxyajhjRbE06aI7W/NerFHUO7zROadRWlqJAs4Z5s3bgTrwcaHcw4kSJQ?=
 =?us-ascii?Q?PYWR7qnXO3FMiaL9K+h57d+NT5pu+tmzHj+in2Ukdx/qfh+Ht2l9ojFoDxuk?=
 =?us-ascii?Q?vSACas2DiatF3SnPsKllJ7pjqus4SiTC+fjAqIgI8K9hftvBxVZps1TkmTq5?=
 =?us-ascii?Q?v+/QezuiARqsTAkTkM4JPHMHN5fWQnwSpGS34bDYF0s/Wa+L78trYbGKWy3E?=
 =?us-ascii?Q?t6CWElZ6zf6IzLhoIDzs6IXpOf/k7S6Mi0HB9Dxdtgwp0LmdH4nHjpvfi2ee?=
 =?us-ascii?Q?VuFnAa/OXtCcLRao4se76WUS42mhMkO8pWPdBDw6kHjo29w24CHitAWk2XqC?=
 =?us-ascii?Q?6eq6EOFWH8AD3y0DTAYXNotQ2d9kI29vdlbY8App1wI6VOyXkSYEHrLCu3Gn?=
 =?us-ascii?Q?BY+X/3mBOpzr1nOciCy7qGmI/KMS6K+w6AxNPNoIP4NL94ciwiFv0IkZZiYd?=
 =?us-ascii?Q?yop/KZjdkiF18AsrwQK7wfVPsEMc4HI9Wv0amm/4XAnPqfybEHViiFpaUFfU?=
 =?us-ascii?Q?vVIKeBikQLagPIcH+VFmyKdadArXRVYsAvd3j2JN326cFPSAvrztFCFbccas?=
 =?us-ascii?Q?u8sGIz1N5OY+pIjmOXIvdQrf7FjlmaTBe6ZXL0GZgE5ByddtIM4DsYce4lmo?=
 =?us-ascii?Q?RkX/TB5aNBhhTTiGdkb2RVBeOK5FxmCUDcqBjtrWsxgi4L9XbWujwDq39RXt?=
 =?us-ascii?Q?tCexVcFHsxirIGYmsAP4ADDUzwypgTMhU/VpwvTeMhiskhQ+plLDMhd2Fu/G?=
 =?us-ascii?Q?XzJTxu4RfFMgRPWQ+8EiuDKCulyW6AdoCO74xSpSLiES+ZilsYs4YVRqjWhI?=
 =?us-ascii?Q?BymbOYU+BFfLSH4omkYc/f9yu7L09evDbVg2sdeLrO2Eow/Ht06KaKMiakVr?=
 =?us-ascii?Q?zOXUKy9oWLAz30zHaMsexf3EhR8ptVwvXEIHRKYtAx3MC0VdK+g8CRKPET17?=
 =?us-ascii?Q?HRO+ybagXvIY9bhQ//LFULULINmvzRwDvpSB631htN/S9ZvKm//HuKcVkehC?=
 =?us-ascii?Q?HtqlggFuFhrvgG1wKFqBuMQkpFnpLJlNB10pdg5K+VMAyTc+/YO69KAJWsfC?=
 =?us-ascii?Q?Vvwx9VHOMrXVA7JH1gL7wII5oG59fLqvU/gQmbhPpI9wgbob7668EtIUfGb2?=
 =?us-ascii?Q?sSwVuvKFFNltEvz+Hxa0NPDOqJ3pExTMRwdn8HA33ucmhgFH+hQyH5QwXVfO?=
 =?us-ascii?Q?jGEnlzcyaHlZaNcIObTGBn8Pok/donm4QfX++3DCvmrVMVL0BZmAwe/b9vjb?=
 =?us-ascii?Q?aqB+QIp8lsdODtug/hlzU6lLecgj/JpVekzfdGv8Pjz7Mtl6d6Ww+pJ0gd4u?=
 =?us-ascii?Q?v7gIdjTouREM1E0f4PT9EnBy3FSlrMC6aSfx3Tok5cldU2dtUCyHJaGn2y2W?=
 =?us-ascii?Q?WnQMP9cXjzxMsogutjMwI5ySY2w08n16e12QLYqPv7NACfsvgt46+SzTSMRf?=
 =?us-ascii?Q?YZOVIljOeAmM3QsVio8xT0HRHS+rKEEA2oRYt+jvHaY++guqnq+wn4YG1fSY?=
 =?us-ascii?Q?k0zzIWjErS9VNNgDSzRvv+CPn9XrXi93lbO7P1QLZB2lyHo5+MFQa031SP1z?=
 =?us-ascii?Q?ovjwyuxYaAheGYI+aeqcXZzy4/QVx8/FafhXi8h6+Ayh7WZkmOqV+7jGRAAM?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1e65f0-27a1-429c-5d93-08dbae3378ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 17:13:50.1212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgunceT2y19On0vu+5Z0feM8pu2eT8qO+udfeWMfJuZ/Mv30s5rIeN3qX345NYj425OYNFBymd89vNFQo3NHnahCSgdG+2bNG/tPDKJuZVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/reg_sr: Simplify check for masked
 registers
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

On Tue, Sep 05, 2023 at 07:31:42AM -0700, Lucas De Marchi wrote:
> For all RTP actions, clr_bits is a superset of the bits being modified.
> That's also why the check for "changing all bits" can be done with
> `clr_bits + 1`. So always use clr_bits for setting the upper bits of a
> masked register.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c    | 8 ++++----
>  drivers/gpu/drm/xe/xe_rtp_types.h | 5 ++++-
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 7c88352636d2..264520015861 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -153,15 +153,15 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  	u32 val;
>  
>  	/*
> -	 * If this is a masked register, need to figure what goes on the upper
> -	 * 16 bits: it's either the clr_bits (when using FIELD_SET and WR) or
> -	 * the set_bits, when using SET.
> +	 * If this is a masked register, need to set the upper 16 bits.
> +	 * Set them to clr_bits since that is always a superset of the bits
> +	 * being modified.
>  	 *
>  	 * When it's not masked, we have to read it from hardware, unless we are
>  	 * supposed to set all bits.
>  	 */
>  	if (reg.masked)
> -		val = (entry->clr_bits ?: entry->set_bits) << 16;
> +		val = entry->clr_bits << 16;
>  	else if (entry->clr_bits + 1)
>  		val = (reg.mcr ?
>  		       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index d170532a98a5..637acc7626a4 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -22,7 +22,10 @@ struct xe_gt;
>  struct xe_rtp_action {
>  	/** @reg: Register */
>  	struct xe_reg		reg;
> -	/** @clr_bits: bits to clear when updating register */
> +	/**
> +	 * @clr_bits: bits to clear when updating register. It's always a
> +	 * superset of bits being modified
> +	 */
>  	u32			clr_bits;
>  	/** @set_bits: bits to set when updating register */
>  	u32			set_bits;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
