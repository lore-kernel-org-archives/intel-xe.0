Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60101C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 19:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A0210EA8F;
	Wed, 19 Apr 2023 19:35:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF0710EA8F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 19:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681932911; x=1713468911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VV3bqpqawSLk7lRYaQxfa3YmRYYUOkNeSeZBNWixR0A=;
 b=jQqDK5mdoaoVT6hhrnaNbtIuhJ7LB2dYJ9lnj3E14ay6wN7XsqArrH1g
 gd/uz97m87l8t32d+aAF6U6o5yVlmd+AwKL4oFmdXB3BGNHhj6OiMb2VJ
 wTZ/9iVLU+3aCTxz7G5sk3FL36+zXMtF1LIB9jaGfW9tjqiUNyurD7CcS
 jf2Fo38T5QPwlQ7XxUXUjZo4czb23E/FIZUYcb14WI/jLGFZqA+SAICq5
 IFu6zBPXCKWTY+uNSIXaGLkQM9I3HSWUzBgndCdUnzZoR0QzuYtnVBYXg
 I4PvmwmXV47rTtnJ4fpIIYlyktSEpL8yXwfvjfe+hE/fj8b92M66v6ezz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325154434"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325154434"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="865955346"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="865955346"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 19 Apr 2023 12:35:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:35:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:35:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 12:35:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 12:35:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lChBChPt50NOgcVrEVJ31zH4yZWda22ZIevveeBYunD4Vfh6Tc9g6ylrmBgkuwJD17krdEkPvp9ehw4jkzyefrWV1DkozvyrtOqlic35mtrT5N5viTfIS9JfrGkYs/2yGYTbDGnSHIMxqrSzUtiFvOHIlR4aXHO3iagjBdPJPqSamgH1vH0EytEMTjO/xrR56NOCkeMnhYFMCQl9hCBSFR9j2qUG2Rj7Nsmbia9Y9EEEBV1vO1dJD/jRtPihE7Sl0gTD9LjDVRel/txNLQDjrWLGMLEGEw8mK/SBQ3kgOZLc9qUFzr9KOnkW1De8wpnCpsRb2erNN/AsdpniZur5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo1mueZ060PUEju9n7NWnYRgNRfpbSoRv4vu0NCzCVM=;
 b=EHirJjst2t6yUr3O+sRxKg57D/KN/GnrcM0A/Hk3dGdS3Yq8AFSu1m9asi7IGMjm8rxtjT3L+fSZr8nyHl4WmxpnQ0ohRXOvOMJIWeXFQXV5SKk9L6lS2zdP5cGqm9/5kzZJ8Ehg4KB5DaBwx6S1smAX12afqfDCWPWPD7CInvwHy+DLx+vj3NNLZGw0u0L1bMLHkACBkYpNDHZCuTzaVk8Tjq+yV72mS2jcxuoMhjgoB5lzubzOnvLVmUcP2jAiLt3giWRxvmZ4HW77i0Zh/KhsIyOoOd+RW9L0WmFpJSM0U+SveJzqZ7iFb+n+6ymTqPfKae+qsYNfgNsMGd2tFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 19:35:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 19:35:08 +0000
Date: Wed, 19 Apr 2023 15:35:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZEBCZ8ZhecK0bO4z@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-3-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419123947.543175-3-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: 150567f9-37ed-47bc-0fdf-08db410d2ed8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QzevemFwjugOe9bPSMY64+assQLjNUr784/znlWoiVwthfaJ2TDLDhYADFiRjgAB5MiFfXsBRuS0LIa+fKPGHAwidlDH4q70s+A1oJa6/0BT1GfsrnDw8tnknR8bbYeG7HEf3e9NLxcYGHcUk3xzcqvfYcq5rRlmHQAbq0MPzNzhJIPb1efLjafX38PanhMF4Tynf5PDA1jj3iTtV9JP2ddOvcKH55b3EGn8qU2l6831q/M40YyHJecg5+TqPemyMjh7qZbki4oMMqCgRiu+XQuLh4s3Yk39g4WovxbXP9jIQT+WzMzciuJ0lcjiKqYbpRbmem/Wh6a4OOZBc08wne6r1tPA+5NEJ1YCHZUTFj/yfmpOZOIEQBe4DHF5f5RY8bE36inpebB92M1hNkpQteQj6+DonblTB2bVGKOF1OU2plwdeBCpx4EZf1hLGwgJYa/AsMnzh5HqQJseaAvBrFXXGSuolhlBWQ3OklVX7DwZv4p3k82wUcG0ouz1Kc81K9CX/MI5zpY3Q0OgqMRLnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(316002)(41300700001)(4326008)(66946007)(66476007)(66556008)(478600001)(82960400001)(44832011)(37006003)(8936002)(6862004)(8676002)(5660300002)(6636002)(38100700002)(6486002)(186003)(83380400001)(2616005)(6666004)(966005)(6512007)(26005)(6506007)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKFU299Ym9Y9tIVFTWwbNfPblxI+esp5KthWsSJ9FQMqE3UxTu1zTVag1fB9?=
 =?us-ascii?Q?8KotgOkaLtPi6Cxp4enFgweLOjgUZzVOwbUg9+LQu1gW1PnuEhoSGUd7rrnr?=
 =?us-ascii?Q?bIt+i8IIkLFLmUzaa5Rs/naYKMHs4wb4naxzDtEsigiHB8JtoEjKKYGmN8Vu?=
 =?us-ascii?Q?iDzkG8BK6vG7ubP/XhIYivI9AGMJYCb9Op63JyEPqeDyJQlrLF/3t9tdgcUD?=
 =?us-ascii?Q?JH9blhvvS2uCEQogCxJeO7XV1mMBlov2WQjSs8EQHHSaSqDDl5wNYw0cBXnB?=
 =?us-ascii?Q?F+LHOYHMM8y7ESS45ODe497S1ddIG5fPhWDzGQe80rSBvsSfBdB4FM+r/TFh?=
 =?us-ascii?Q?Ih3F7518Rb6PYopGvf1RXS3MGKqBKToqqrBniZKvufg98RwKXYNkoFj+6A2f?=
 =?us-ascii?Q?iYobiM6JpGl7HIlADuoXGF3jBvHTmJ1I3ApHnvcgnfKY3gTjJkkzOoBBkbon?=
 =?us-ascii?Q?V+QODtIjIDGiHYVkVwhtOMn+svwcA4cRqurdiUKOQTksHJRiND66ibu4dp/c?=
 =?us-ascii?Q?pdQqOVJJfHwNeKFBkAKgzd3Yfbbc0cHazNO+XPI/5PcF1/yQ5Hnd+ERruXjG?=
 =?us-ascii?Q?U1xPA4WKuGj2Np5X/5lAa9JvTHF7bUYTxkd29lQTG6gLulI2xIuDekMcGFMH?=
 =?us-ascii?Q?BKP9Y2MeeT04HoZcuSCZ3XB1FevYuw/T+qam/5/WSdXcXtpzkhqp+dCS7EXb?=
 =?us-ascii?Q?LB4i1tJKxpUhYllx2OY4VYwkJXAuweeJyW37Tz3pV2PDbSSCFptYYbVOIM6x?=
 =?us-ascii?Q?P/lTqmWP58nzS7v3IKjS+H5yv1fsRrUuVLU5m5Hu5DX6qKch4KcpH5CZpZAy?=
 =?us-ascii?Q?bssLf7nKuYOUBRe4P3uHwB9vzu/qQwtBOi59Rb7JKZtRVmV0IY7dF3Nl3LxZ?=
 =?us-ascii?Q?TySq+/MghANFNGcz+0dwIdqp6feDfIVIUeIN5Nm7jN3IgSF7FdYImytx5+2/?=
 =?us-ascii?Q?1EXw9urYIb9JNlNgPsKz0V6s7hPFkvKTvNP18Sz5K3yheOXyEZgjiO7lW+3r?=
 =?us-ascii?Q?+WQkWecY5PcujjGQT3W/wYipce7ot2e+IokGIdmiFd5lFfDgw2s/wl4eMc4k?=
 =?us-ascii?Q?6PGzo8KZhLSidwxpRXsh2rRmtVDIgIGbFhiAQeV7LQBKcZ90mRqLnQ5Z35ma?=
 =?us-ascii?Q?Hf6iQC8aAZfodgCt1GppQEhR7gYWedg3wAhqlYMd7ZNg8HO49gNzxyC6hszX?=
 =?us-ascii?Q?VM2msCT04D+tbP9lvMfgye0YZ9A53T2wMCYUzrkUzhbLaj/2/4N4LZlWVUew?=
 =?us-ascii?Q?k+lB7y1lvWesaDKjAau9RjEycOc37UBrp5RZWVCQWDGwc4kEgE0HDgFq4H86?=
 =?us-ascii?Q?yCOWxIpfO2YeK2OfjSKUOcZ9GOHs2RtWEX6Fvdk8+0m+YH7XZiokhRv7Kvvz?=
 =?us-ascii?Q?WPefT08eKY52cyF2ERmzUFjm8iGgiXFaDOvq7mzZkj5u/iXRLIWwFVZl0pRP?=
 =?us-ascii?Q?08LvitJENsqwpRpenuZ2Yoxw2iJpJIsWJGEwyaMoIiUb8CmFAx12vRYXfU+D?=
 =?us-ascii?Q?99HTXIsMcQzuUc65UGYF8O/+AIxnhrYgHYJxQOGd+eDYoVWyunjSjuoh7hdX?=
 =?us-ascii?Q?U+oVZioJIWpdRi4voQ78hBquuDXjynBKAWx1LE3l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 150567f9-37ed-47bc-0fdf-08db410d2ed8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:35:08.2435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/6L1PSDrXsO0NMyOFMB1v9CuX7ABgK9zSQoryG35oThmbYBbYxCLoUggg5aHjjaKkJH+rn8+diCIM1tW7xxDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/9] drm/i915/wm: remove stale and unused
 ilk_wm_max_level() declaration
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

On Wed, Apr 19, 2023 at 03:39:40PM +0300, Jani Nikula wrote:
> The declaration was removed earlier, but got accidentally resurrected in
> i915xx_wm.[ch] refactoring. Remove harder.

Should this be a fixup? or a patch to i915? I got confused on this...

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230419115449.422214-1-jani.nikula@intel.com
> ---
>  drivers/gpu/drm/i915/display/i9xx_wm.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.h b/drivers/gpu/drm/i915/display/i9xx_wm.h
> index a7875cbcd05a..b87ae369685a 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_wm.h
> +++ b/drivers/gpu/drm/i915/display/i9xx_wm.h
> @@ -12,7 +12,6 @@ struct drm_i915_private;
>  struct intel_crtc_state;
>  struct intel_plane_state;
>  
> -int ilk_wm_max_level(const struct drm_i915_private *i915);
>  bool ilk_disable_lp_wm(struct drm_i915_private *i915);
>  void ilk_wm_sanitize(struct drm_i915_private *i915);
>  bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable);
> -- 
> 2.39.2
> 
