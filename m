Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD26C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 15:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA29D10E098;
	Tue,  9 May 2023 15:27:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6410E098
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683646024; x=1715182024;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LMH9NsDsytPxS0TtnI4hW/mWfP4GwqWfB+FS8UH35rk=;
 b=QZ6mdJPjKDQhvY49T5DBzAtXu+JuYMmRIhg5NQRobnvsSopFyOVjh8ZY
 8PrvMsXNWD4DocFQZuIstWZIo4t1Tl5pdInEivOay1CnK3M+2UR7YS7a0
 Lx4kQP2rwvPG2/9tZhYF6ip+dX3H+79G+chvwtVOcb8P54piyAA0i5+3q
 A/QlDJNfY/sNSk9mYR6G0AGB8nugv2OxbgIoZjyaL4vUaat+kjS4KxTvy
 WiN3pFaktkXUa+8BxSjbPU45ipCfIPNPkXnEWnwcASsioNxYP3ia0zzxM
 Hz92kuzHkWYZdn2Lk8x5VYqbo8JjCEpDWjozHuaCY5Be1tnH2jGbt1guY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="329584708"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="329584708"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 08:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873223057"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="873223057"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2023 08:27:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 08:27:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 08:27:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 08:27:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mduP86m1rtS6/g9WQf2K1gTmMrjUhsIf6oQJh0kd4aI0u7ak6KUAljo6Aqph+tmsWK3sX6BKkRVRBeXnjaAGkaXsYtSaqv/TQW/b5G80SawLWDYvwztcT+cdVBipC8sKmZpOR1pMuyMNZRsCx31n0pzbGGeD62HvFAZmWEFsl9M+Gp8hlFn83d4PPVVS7dcVTx5UMaO2uS466Tv6b3khIU9iKhlFx6IhDLSM71SPdW5xaE2a2+aP+ftw2uNZYMsMK6lx0zdzhYsQlpDjqYv5iImIT4MnFgbjXQq7yPSvLtMbxz71GjNuw1mQmjOOEg5U9YueT8D7vV/+LYwpfQZmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWQ7YtNkmkl0wogfnyAUHcYTfXYiAoNQpPksudSca08=;
 b=PZUPgsZWlIh5h3jNP1C7qfVs70of0LCMFVeo46Hx27NWsqHi8bhJbMkNm7eMm3SjANV4t0zgsqHr4WEgVYrH7POdc4zmkwQt0Oux0RJ+Ez6FB6kQa+I5Ss/cCdXAOvYf+8G1vr80tEwPgBnqqDbvBKlJpadP4oEmk7cHOHu9F+yVmJGKjHSS8VqoVbOwUVB7xDvOnCtbUzlHDIV6gl1bfF0MnhncU8iBOJFZBuFWURotDgs4x+IjXcloJq51gjQuaG6dzF9l/BCOc3eq4te+beFQiRq7eW2Rwh/4gC3qudyO4XXTlrdkGG5wwp5faJBoqOHmyugoV/fPM9AQLvdbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7841.namprd11.prod.outlook.com (2603:10b6:610:121::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 15:27:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 15:27:00 +0000
Date: Tue, 9 May 2023 11:26:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFpmQOxiO1DGB5/b@intel.com>
References: <20230508225322.2692066-1-lucas.demarchi@intel.com>
 <20230508225322.2692066-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508225322.2692066-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 967f2472-35cf-4c6a-2408-08db50a1d530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELOGguqFutE3OQGMtc5JuB2G+505Cn7RAqGYwYisBwv808j+14ulGjNZBwulivE+o55uQpzqU2aV+MnRnM21nQwMMPbyYP18dtDYlygJZ4L28Y8NZuYWbvlzSCMyKDC3DhwWF7F+hVkYtHGuW4+7LGuRfruOX60egcqno2ilCFdVzYPIqoKrS+iz2k/6h2wFJSHB6pPYfkQ4d7pDpNd64GSpojR3QSSHkazb5zJ8CMeDEhJWJMYJnBDEz1stQfkC6ZKDfXx+iRDl7NJ7fuT7t54R8BYB9Mlar9G/nfwjzQqAf5wgMzUs9KfxdpEumjEYfTkQLs8VyLaw07DXM6hD8Jd9vHNW4f97LgOajga2mnOC8X4e7z8+9TzJlkvugda8Pk6mcj5qo+zh8XktYqsecc65lTIop0/MY7+g0brb7CHxMsu4IZC0ZDQpuwJ8M0cqN5Z0wDYILNGH6mjbRDvqBJi+m6KauoSgNWuyLKqHRUjuipf/BgCIXkvDqQstX7Kzo6R/BO4/Evbc6KV8T/EVmuhA+sgeRDlzx+gkjj5X1pbxcgy1lMLY4KkozO6yhbA8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(186003)(2616005)(83380400001)(2906002)(36756003)(38100700002)(86362001)(82960400001)(6486002)(6862004)(8676002)(8936002)(316002)(6666004)(41300700001)(5660300002)(478600001)(66946007)(66556008)(66476007)(6636002)(4326008)(37006003)(6506007)(6512007)(26005)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkX+vPqM1bt/b3z7shHh+c91XaqPejr0z5zPPlOhfUhupoN2Z6KS37+LWNly?=
 =?us-ascii?Q?MWMHo3/iyCgMn4UZSX/hLwaHITcossGeFTUfl1tjJPjGcY0KrPMJL6L/PIvr?=
 =?us-ascii?Q?M2UX3j2esYXs2wREkY2b8YyXJCHO236Ykmzl2PQnyygWLzGHEECamTRJkeD3?=
 =?us-ascii?Q?fyYSBiwqQ5EO8BNH0BPc3WY3olQvQvcrT/I0eKlG4WFK2Oj6wpq+I+p5qxOm?=
 =?us-ascii?Q?IgZtRCcUYNzlv4hPH/dwj5O5HWexJJ/+UjTQGz8lXGmVDeSG/SahhMKrGGqU?=
 =?us-ascii?Q?cXQdPlolh0nnefLlUyoFck/OcRNKneh0/Ua5KJyTOFWC2pi1qyaDeup826X4?=
 =?us-ascii?Q?gpRMp0q0NRi42r49TbT3gY/FNe6rpm38APWACzMoBkO286Xmg49rGKieFp+F?=
 =?us-ascii?Q?+Tp9gEkXizJTSJlF3VC8XrujWmXd96gN8CwatRTjGjv8K06i1tNpHW8foHIC?=
 =?us-ascii?Q?ftxCmBFjG3bHQ/eruKKpI6+u161NLBWIPSTouZn0cQGRgbIiKqeemt+RJc6A?=
 =?us-ascii?Q?faveiR2oRg1fcoK7XYR1UIy+vG7/aShtgI5dZrulzGT92o5q9H3Hjpil+0Lc?=
 =?us-ascii?Q?ioIUwpudON7+OUbxgZKW/YCJ5IGBHW0ir8c2ZoGG1dtUddkBrw8gvBDmUI8a?=
 =?us-ascii?Q?jDV+XSaW6wK5Qc6P/brf9T7nsbiym8aluUrU9NEFvJTRHn1ULMHRJym/Ovhx?=
 =?us-ascii?Q?lUrQ1HFBKVd99L9F79ggBk6zq5DkqrFAzndK2Ul4lLrVSOeH1YoXZvADdYW/?=
 =?us-ascii?Q?pvoW0MfoLEb0ufax83aV2GqjTNTqjLyTzgeIfLADcOlOuUxyOVCQ/GYFGrQf?=
 =?us-ascii?Q?oradDWCgS8fE5I3v1CtSgt/FxjDBgF8prEtsG2VmL0Vn45Nglq+Zf4S5eaps?=
 =?us-ascii?Q?ZEPZn4CkChqMQNhCbtcivimzJGyspTOD57VIPWn92YZfOSSIQ18bcRmO6q+0?=
 =?us-ascii?Q?ZeY1tsJztCp1NHzIVgfsaxdSEcpv7nB8qN5Y/Z+1kE9ApRIw5xNIa0DLIpyM?=
 =?us-ascii?Q?8jcKI9KPLUbgUQbQUdX8IS4Mg3A/TceZIV9W9OmyWDp2OacploY+x0CSmvpS?=
 =?us-ascii?Q?QkWLuj/V2jCj1VHZ7GQV22/YLaGHvbcipFHhPW7rF0KTAJR4xXod8sYN8jXc?=
 =?us-ascii?Q?PRnP34Ye+itkDoDvJvs92gO9Ug3XCvRoy31Izm25ltecl49kxByGJ0PP2zVT?=
 =?us-ascii?Q?RPH17s1dxUcMu4OAl8fDOeEin0ZwJfA/evV2xofQ/JLNqlx3qqGgltsdjEbz?=
 =?us-ascii?Q?cAomApAg+q4tdaOAQo/JDQMiOSR8MiQ/q9cHAS1+FAy8NS6UG15akXP1q8cO?=
 =?us-ascii?Q?kC8URib8sP+6/hbksJmut5WqYmMTYDeBpiORL/ABdyn8llE8PUoxKT7q4owd?=
 =?us-ascii?Q?9FTyyMjoC/c34s94JVYrWBbPsUKZLpQ9fQ3T9nUUp0fF+omKNGxvEM7rTqDG?=
 =?us-ascii?Q?M7E+PTZn+ZfNwxpwpTCO9ww8D3etHvdFgt0wLbpThLZgaaqnJwcaZv3Z48PH?=
 =?us-ascii?Q?55aFkSZtvmtGeMzltwZuJoZTbQXhev5VzPIEplLZzZ0G27DlppSbZs8eYkjx?=
 =?us-ascii?Q?Z+tk0suD8dNMYkSb0Jwh4N4u4SpF/h8FOOE/Guf2W+UOjpMx6LVQ7tsvPMk2?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 967f2472-35cf-4c6a-2408-08db50a1d530
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 15:27:00.1995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGKjH7xfjBCSe/RCMk32hrkxLNfZU8HcFtMCNGdJknfhD48VjUrGRvbZqE3T0nv+2YDFCOrZHidRg4TKD9309Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7841
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/4] fixup! drm/xe/display: Implement
 display support
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

On Mon, May 08, 2023 at 03:53:20PM -0700, Lucas De Marchi wrote:
> WARNING: This should only be squashed when the display implementation
> moves above commit "drm/xe/mmio: Use struct xe_reg".

I wonder if we should then try to move this patch under the display
instead waiting for the next round of moving the display up...

Also, could we change the subject from fixup to future-fixup so the
a git autosquash doesn't try to move this before we are ready?

> 
> With the move of display above xe_reg conversion in xe_mmio,
> it should use the new types everywhere.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  .../drm/xe/compat-i915-headers/intel_uncore.h | 103 +++++++++++++-----
>  1 file changed, 74 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> index 90d79290a211..14f195fe275d 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> @@ -17,82 +17,127 @@ static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
>  	return to_gt(xe);
>  }
>  
> -static inline u32 intel_uncore_read(struct fake_uncore *uncore, i915_reg_t reg)
> +static inline u32 intel_uncore_read(struct fake_uncore *uncore,
> +				    i915_reg_t i915_reg)
>  {
> -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>  }
>  
> -static inline u32 intel_uncore_read8(struct fake_uncore *uncore, i915_reg_t reg)
> +static inline u32 intel_uncore_read8(struct fake_uncore *uncore,
> +				     i915_reg_t i915_reg)
>  {
> -	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg.reg);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg);
>  }
>  
> -static inline u64 intel_uncore_read64_2x32(struct fake_uncore *uncore, i915_reg_t lower_reg, i915_reg_t upper_reg)
> +static inline u64
> +intel_uncore_read64_2x32(struct fake_uncore *uncore,
> +			 i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
>  {
> +	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
> +	struct xe_reg upper_reg = XE_REG(i915_mmio_reg_offset(i915_upper_reg));
>  	u32 upper, lower, old_upper;
>  	int loop = 0;
>  
> -	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
> +	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
>  	do {
>  		old_upper = upper;
> -		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg.reg);
> -		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
> +		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg);
> +		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
>  	} while (upper != old_upper && loop++ < 2);
>  
>  	return (u64)upper << 32 | lower;
>  }
>  
> -static inline void intel_uncore_posting_read(struct fake_uncore *uncore, i915_reg_t reg)
> +static inline void intel_uncore_posting_read(struct fake_uncore *uncore,
> +					     i915_reg_t i915_reg)
>  {
> -	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>  }
>  
> -static inline void intel_uncore_write(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
> +static inline void intel_uncore_write(struct fake_uncore *uncore,
> +				      i915_reg_t i915_reg, u32 val)
>  {
> -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>  }
>  
> -static inline u32 intel_uncore_rmw(struct fake_uncore *uncore, i915_reg_t reg, u32 clear, u32 set)
> +static inline u32 intel_uncore_rmw(struct fake_uncore *uncore,
> +				   i915_reg_t i915_reg, u32 clear, u32 set)
>  {
> -	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg.reg, clear, set);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg, clear, set);
>  }
>  
> -static inline int intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
> +static inline int intel_wait_for_register(struct fake_uncore *uncore,
> +					  i915_reg_t i915_reg, u32 mask,
> +					  u32 value, unsigned int timeout)
>  {
> -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
> +			      timeout * USEC_PER_MSEC, NULL, false);
>  }
>  
> -static inline int intel_wait_for_register_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
> +static inline int intel_wait_for_register_fw(struct fake_uncore *uncore,
> +					     i915_reg_t i915_reg, u32 mask,
> +					     u32 value, unsigned int timeout)
>  {
> -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
> +			      timeout * USEC_PER_MSEC, NULL, false);
>  }
>  
> -static inline int __intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value,
> -					    unsigned int fast_timeout_us, unsigned int slow_timeout_ms, u32 *out_value)
> +static inline int
> +__intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t i915_reg,
> +			  u32 mask, u32 value, unsigned int fast_timeout_us,
> +			  unsigned int slow_timeout_ms, u32 *out_value)
>  {
> -	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask,
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
>  			      fast_timeout_us + 1000 * slow_timeout_ms,
>  			      out_value, false);
>  }
>  
> -static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore, i915_reg_t reg)
> +static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore,
> +				       i915_reg_t i915_reg)
>  {
> -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>  }
>  
> -static inline void intel_uncore_write_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
> +static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
> +					 i915_reg_t i915_reg, u32 val)
>  {
> -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>  }
>  
> -static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore, i915_reg_t reg)
> +static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
> +					    i915_reg_t i915_reg)
>  {
> -	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>  }
>  
> -static inline void intel_uncore_write_notrace(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
> +static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
> +					      i915_reg_t i915_reg, u32 val)
>  {
> -	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> +
> +	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>  }
>  
>  #endif /* __INTEL_UNCORE_H__ */
> -- 
> 2.40.1
> 
