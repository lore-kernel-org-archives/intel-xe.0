Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D0EC64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B1310E73A;
	Wed,  8 Mar 2023 22:08:20 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B2010E736
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678313297; x=1709849297;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3PZwslypkmUI8p6J64eF+cw0xlcPaUmkOiUo4ieHXU8=;
 b=GIlk3V8L84OsJ7RN3Ep7SWdTBbOJc4hbMjXn+7paWtlAVpK5u4KqVwA3
 VyZPAcV52Y9zz/ulhNXXhk/S56ju+eFOxLgch03ux5xT5Aq5saJgwar75
 AUGUHKXBL4wNpPldG41mXPK8ZlxnphhBGAUgdLCp7U4OoF8xJqwtKSq3M
 XP6k/0CkJvC5IuEH0O/eat4j/8aryYSzN5j+LsU/FquCjCFYY1Ym9tXWC
 zgUSjYU9JkvcQ8EoG2O0Y9fCshtuxdT9LllfFgo8vtGCaDPANPBn0hR+W
 iKI+hEmOlJPbzuTx3ma2cJwQA5GuOj6fVWCHfRRlhBLQyEookzm7FO1C4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398868762"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="398868762"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741278444"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="741278444"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 14:08:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:08:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:08:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:08:15 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:08:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btfTOhs9t+m9TM8jiQftDk24Esh6JMJdZ48x+wvjgWjdwPHAwTeP3Kv1rFSznuPCCDaQ3+bWhWZjMwkBgwjDEwntam9hYCGMicfDy4HDAkE8l9vBdDYJa1Cyf3AWjnxlJ/m1DfOBy3PxDKznu3BW0rfNN0CETEh/MSzK3tkiX1aKQGV3dtqwtdtxUgDLXzu3494s8Ie0WgeliTPmgIy45kiTD8yQMEM5kp4AjuC4Nxqiu4Brl4+2PMh9AF7CE4e1pB1MRp8dUBq4hIIdHBvWBB3LetIOFZVa8oT77D1f3e/KL+p3jiBNrQLn+zcmsB60L0v17+LlZkM/2/6IT87ezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkzi8oJumTPmtuVYkZzrLbIfIv8ZTgGg4VV+mrW30FE=;
 b=ApFUtyv8yQLfUUyXbAgagvoV8i0QddVmGJtnT7/8Ii6R/9/eKoEaxP2GfQK7m4XsPGhEuPyPPghAv1+KPc5MnXkd3rP9765cEjybpZyslEHzcdEFUtRyzNRs9mSrIkIUie51uWY+3z1v/SdRU/+k4EyiMAzkCNBMBJNZCaHLDLWvt3YRK5uIr47Hfi/KDXLU5ClYhYElCEMLek1zT/1Q0+77nGiOsGcQZwqb/XM+Pm5v1qgc7evEhANiufm5tX7Axt1Frsjo5a0meUUg2+yhGYxurCFcHLbu9E5NJqc5rN0otmSBXjKiM7DiqtshbJ9SLOTwIIp4lVLPd+tl6XDm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Wed, 8 Mar 2023 22:08:12 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:08:12 +0000
Date: Wed, 8 Mar 2023 14:08:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308220809.GC1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 4caaecd3-54df-4ba6-8100-08db20219bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jY+p+cqlGd6SB5wxZTYtwoV/qTwAQ0iBONivs7XYpEg0Epb6AwZuNaMTSfrRf8h5wva4wuOxVjL6RVN2L1gteH1JkbqorfcdLzuQz6skXBczCNuRO14V/S1ahw3un8aKZd6c+pGfNnfnsNhoqy0lpH2s1nQHMp1W81E6Y1tCc4E5IouXM00h9hKPa8mScD2/HrmMVM6vy8emLXbMsKMLC5rjwfpU4vXfrcW3ILD5caHWDAF3FmtiZhYHRleUH9VmTJ1YeNdiLkt8L5Rw3oFQWwe72Rry5YKYlVC74gHCLQrGWjr5WkKIi4Ddzy1nKKtjmXSyNmb27W3D5cRNPI31XnRqNlXWtDZ7Iec/T5bMh0lpB9XZo0viPzqB4ScKUy8mz08MzMKS4IzcbnJ47SxmxJPMR39YBVhagRe+kelV2e2Lz1mR/55n4Id0sNQNbHWdPPbvaCHlZd7qNFswB+SqwKC8q6rBFXmh+In7Qu1dX6om6Gdla25L93M+HdSEB5RCmUBzJ7AEw0Q81+DoltJIaVs3I2tQKDzq/2V7M5qyD5nk+dkiklc5QsBuCKAXKoi50qZO5TbBHDb2STtYo4AqNUwkXaDGtXh/ybzFmEAN2lbx8zNJdznb+3zzMaUiLWsJ1MePq8QkUOBMd3bqKZsJ0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199018)(83380400001)(26005)(38100700002)(33656002)(8936002)(5660300002)(6862004)(82960400001)(2906002)(478600001)(86362001)(6666004)(6512007)(1076003)(6486002)(186003)(66556008)(6506007)(66476007)(66946007)(8676002)(6636002)(316002)(41300700001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kzusMD5srWOexEXv4ojPXZPu1v94hchDWX3mx00ID4f3a0eJcb+o3nRH7FrZ?=
 =?us-ascii?Q?kcKIvrjnWmyAC4IhyWCrJOhA2uHumAmu/yNprsp6IsTB448Vv0AtFuX/Akh9?=
 =?us-ascii?Q?sjRL18wJj0Pm75+fvJkaO2ZlGSChv4dTEGgTmoQY1WRCax02wMg5/AWU9YwH?=
 =?us-ascii?Q?HR6IuGLRznSaSi6KB/lKxdRR7oq0i0T7t2KpHC+n/3benPkxuu+6h8qTmg5S?=
 =?us-ascii?Q?Yrd4DcC7xF1uBNEZleSFO7MUuTDc0qNw47dAgj3QBG9tjb3aqwLm7rBAPmca?=
 =?us-ascii?Q?k6hcQyT76f9dtX6Y7W/ZpmHNtliKl8f/H9qQj95KN7PVFTm3GLXha1AXJfk5?=
 =?us-ascii?Q?AODbq+T9aurjWgAJSdD8vLvZShhJZ/1O0uVJVX5DrL6rEe+QVMDittAiNF/0?=
 =?us-ascii?Q?LUxP0NHg9xudba6yIm+dFbMJakvVDe8LCOtEOcveO2zZ+fyijHGC0DHZ0Syg?=
 =?us-ascii?Q?UPHF90cc4kUvH3V5rfLLe1v7ssNejvzgIdTT0238/liQyYiC565G2uMFNa/G?=
 =?us-ascii?Q?Pbug6ohdLQ7q51GTz77UyX5q6DnuLPVmHr9IWyfJ98GP2u3u83D3VYrK2RdO?=
 =?us-ascii?Q?4BAA6N30imLNTBnLbUkmdB6WjmAbOGy2wnu4GyvAffo7rxvngOCpPiKCEhmu?=
 =?us-ascii?Q?Px8J7smrdWF3dOS0KBKKPgTuQmw+nlFkEZiemYehQQq+Eh7yvS7D9B9GbxGN?=
 =?us-ascii?Q?X95ONbsgmRo2T2a0tIr34pmvgQcumKDY6uaM+cE7CATnrJplQNymjdA//Ka3?=
 =?us-ascii?Q?g7V6d/bGLnrS8bPnPVp6hi8qLjOztFTNA0U9yVl8GWwFtwJVjDp3mrTlK2wc?=
 =?us-ascii?Q?5osDCoCmOY9vzocBFUYKefM76FIFurO6X/ulYVlI8yRKXxgUJx9zKH9BjR9+?=
 =?us-ascii?Q?F2GkbEygUjWezSSMB7Bx/VmJ1s18EMUKVi3Ra/Us7cg8OpKKkyoXPYpeWcoK?=
 =?us-ascii?Q?0DOlztdQH1TTBYVaObo/bAWd90KyfKmEaLtyVy9zW9LGRPwrfFEoOPTPNRUg?=
 =?us-ascii?Q?5AlnZ9B6FQVWcu6JKQkf6kIy+RpbIe/qrpSXR6swKldK+DUz9G4BAOmG19Lq?=
 =?us-ascii?Q?vMGs6TD7yFDhiUF36+lNwC7EyVZEMHDUHStETR0Z2p+srTJB3hPGrTgem7GF?=
 =?us-ascii?Q?2xkTz9yPOAjC4a2sFjnsKWcHMH4x6EWZhndLi28kex2RHu4NWXKZepCxJhh2?=
 =?us-ascii?Q?cVt3BuRTaO75r/xo3vnl1OtCTKbLK2x2TdHHwnfKmKX1FnL6No38X18ewmJA?=
 =?us-ascii?Q?EWbKv9onTqTE+AH+nYt8QT1r5i6zOPjPtKPubsVgohXfYNaveIQrMAMTEaVn?=
 =?us-ascii?Q?1RcPyyhATcC+bsKdnvLEL6EbRRYLZ4sL4BH9Galx8C/3O+z5/LYvoduE2Ghk?=
 =?us-ascii?Q?snejBdoUVNk2Dr9nT3ZlxoYFjDqBfIQQ2eRBwEhkAgLiI+nwudu/+37rOVSB?=
 =?us-ascii?Q?b9N4pxfJRGZKnViurD1xg2KsS3X5VtCNf0ZE0NxQ81HVo06Pq3O6gKwqT36M?=
 =?us-ascii?Q?Th3YIGWltP+d5ZMANNawKw4llI0eyGZSRc0PP70sRrq90Hu1Od6BBP80NHxP?=
 =?us-ascii?Q?SL83dqN7IdSnvSLyoBA/uqC+V8y/VZalCkiCtMVI5xbpM0OwuMq8dgRLFkSB?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caaecd3-54df-4ba6-8100-08db20219bdf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:08:12.6370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmC6aQh9zWfiHnz1mBOa/605qPywKy6BUwyO2/hKq5gF3eDCxHdV5ljQlFeYngiYoPplPGiUYVs1c5zNkSgeuLzN8n/Zbv1obaIL3gTAbHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/19] drm/xe: Remove dump function from
 reg_sr
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

On Tue, Mar 07, 2023 at 01:24:35AM -0800, Lucas De Marchi wrote:
> The dump function was originally added with the idea that it could be
> re-used both for printing the reg-sr data and saving it to pass to GuC
> via ADS. This was not used by the GuC integration, so remove it now to
> give place to a new debug.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c       | 26 --------------------------
>  drivers/gpu/drm/xe/xe_reg_sr.h       |  2 --
>  drivers/gpu/drm/xe/xe_reg_sr_types.h |  5 -----
>  3 files changed, 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index e4eb18332a9d..194a5060f1b3 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -43,32 +43,6 @@ int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
>  	return drmm_add_action_or_reset(&xe->drm, reg_sr_fini, sr);
>  }
>  
> -int xe_reg_sr_dump_kv(struct xe_reg_sr *sr,
> -		      struct xe_reg_sr_kv **dst)
> -{
> -	struct xe_reg_sr_kv *iter;
> -	struct xe_reg_sr_entry *entry;
> -	unsigned long idx;
> -
> -	if (xa_empty(&sr->xa)) {
> -		*dst = NULL;
> -		return 0;
> -	}
> -
> -	*dst = kmalloc_array(sr->pool.used, sizeof(**dst), GFP_KERNEL);
> -	if (!*dst)
> -		return -ENOMEM;
> -
> -	iter = *dst;
> -	xa_for_each(&sr->xa, idx, entry) {
> -		iter->k = idx;
> -		iter->v = *entry;
> -		iter++;
> -	}
> -
> -	return 0;
> -}
> -
>  static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
>  {
>  	if (sr->pool.used == sr->pool.allocated) {
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> index c3a9db251e92..9f47230c8ddc 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> @@ -16,8 +16,6 @@ struct xe_device;
>  struct xe_gt;
>  
>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
> -int xe_reg_sr_dump_kv(struct xe_reg_sr *sr,
> -		      struct xe_reg_sr_kv **dst);
>  
>  int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>  		  const struct xe_reg_sr_entry *e);
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> index 0e6d542ff1b4..3d2257891005 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> @@ -23,11 +23,6 @@ struct xe_reg_sr_entry {
>  	u8		reg_type;
>  };
>  
> -struct xe_reg_sr_kv {
> -	u32			k;
> -	struct xe_reg_sr_entry	v;
> -};
> -
>  struct xe_reg_sr {
>  	struct {
>  		struct xe_reg_sr_entry *arr;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
