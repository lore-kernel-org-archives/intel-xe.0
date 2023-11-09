Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4EAC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 19:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDDC10E22A;
	Thu,  9 Nov 2023 19:09:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCB610E22A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 19:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699556939; x=1731092939;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PJoEg4RKkOcmSqG7CYGaIyRmvubO0dE/ZLJ/Kogt7Pc=;
 b=Qyco5SdbzUyaGe8aDQEazhpRusPx5JdabKtV3Lge8BVHWvMvxq7BsBmF
 MCtGeQT7Ju9HUqr3N+Y9w8ITE+eZup+wWWVTcVVD1uEO77TZIsW8O9+tc
 MAUDPctaf5bBqYF0rfvnhDNMHyGcoxUS6JVjpxCtLd1nilB6HtaMWCY2k
 BsbMXVtZBe9zqrVJBt5MNJOsGLSasMOLAGUyd2pYhjjPhRqnakFCDU8v7
 RXfeWtPII+jZUWeIQIsT8Ga06xWairZqnrB16YlTVgiRM71xmEFH463V9
 3ZWppOqM4CKgvULLWTXkK1Bgl0fu9EG7TWStWiQ/VBc+ozdg+5r0+VfjS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="476286532"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="476286532"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792643732"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="792643732"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 11:08:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 11:08:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 11:08:41 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 11:08:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZsYV5qySZP+9CBFLYlqbYBuec/3JwuAQYp0/2269J5++8ZYfIYKYXlEQrxqgCD5LyI/HPBINWb1gqlZPRVJfM4H7/UTs+9Ld/5igiduoLkgqK6U4ywk+2OebAdSOwQaPXPm6Mu5fFsrYkIFKagYrhK8sRjKdfGKuBYPbBbLSAs8Cai7SU3SFdybsBu2r91nuGUSUOCdr1AJrKjAwkZbFoAGc3lSc/ggMUuppGDMFEBlwBics2Gdb7Zm6LiY/0Gh1n45jJPUYmwsfkDGugAxuadkyX1LQ66R/EWq0ojtWIUdC++c+QfExISA95x8TNtoyyVcLEjnhfwPGHbsqI7bKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0npAD47GCATQUwE8bektFE7qzO5vdUbzdJXuXuyv1A=;
 b=ADP24et3p11FZflCQnENP4EmEvgTNc24YqNESzS4wbvq3rQ4kmXk5UhiDQqBISmVzfY3oaG/k+RQzG0v6euyIfYHrZsbArmnOiWC1dkFNdC9eu9Ob4W86bKAjadFC4bP7gJZPlH7RrvxPjeQNfSRY0O0I1TfcXo2u3OPxeCY6xpz5MLR4vtAaHgMytbU04KUyQidrTLjh9//dOkwBm70TBFMzMGxFn5SRk9jh+v+F0fxNPUeDwO0QvosbwRyoJlFWaPJbbxB1Q8IRolIkYLnsYqbakrer+mbZjiqNzpyVX3gGGlBSSQWtH8skq4J37Xo7+YdFSSEB9F0xRLxUo/o/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 19:08:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 19:08:38 +0000
Date: Thu, 9 Nov 2023 14:08:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZU0uMlkDYWI60x52@intel.com>
References: <cover.1699546565.git.jani.nikula@intel.com>
 <f64007a104d52c769e19da0fcdcb5a2b6e1f9d78.1699546565.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f64007a104d52c769e19da0fcdcb5a2b6e1f9d78.1699546565.git.jani.nikula@intel.com>
X-ClientProxiedBy: MW4PR03CA0329.namprd03.prod.outlook.com
 (2603:10b6:303:dd::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9dd57e-c063-4ea8-a7b3-08dbe1574798
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dk0pZAn/BGg/pq7dGJOAdRcYX+6+av01yQ59ujzRAPHPvWAaPZGFYRc0G82cPgkZuICZwGoZjfwP7OGq6wdyP+Hfrqd0wORCwjxKjMLJ5cb7egANpYKRMNqwMZdWEbem1kFLHuM6yS8uvAvvcM5AGtqpd0U+Q4j2DVXu1saHbsyiGeDwYwG0N5YtXhI5C7NfNf+Q7Hlln74FwBTrb9CpsQWxNcPL0nlKIjlyE+kWFSMM/iN29S07B/sZcZSyHvU5iwkuofXuBPq+TXfJHxi7xbKw1LcvNJuVRGxQNiBgo7Ld0Mm4D1PobnL/O+Jqx0iaMKrysBnJXHf841QIv55bh9fHt5QnafEk7WHvUn91pGCQUyCHMTcd5MLuN1lVFmL9/itxArCtS1giZyO0sbqOthfCqDwIhMogZ9h4uYUedokIVBkfc6caeuGg9FaruZNSGazjcU3FHDsjZatzSsjJEpyXwMD/0aR3J8euzvA8M4o8HGrZFnFFU4amaxiaX0EFn+/Wbx7hyH9lRO3A5S/dVSLRVsToet+q8OnPzuo8e9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(6512007)(2906002)(66476007)(37006003)(316002)(6636002)(6486002)(966005)(26005)(66556008)(66946007)(478600001)(5660300002)(6862004)(8676002)(44832011)(4326008)(6506007)(8936002)(83380400001)(41300700001)(86362001)(82960400001)(38100700002)(6666004)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YtzyfMvfbaggloGaEr1zBbVqxhJdNcPjlAmIZ6qV2sGWTly7yyswFe7dLhqE?=
 =?us-ascii?Q?19e70apZXMPQoxcY0bs98KrxIXGnE70HgkVoK1wJpBGQMBnmpfMvl1GPrOid?=
 =?us-ascii?Q?lzF54e0xoqTJiELBwyDJMLYkPXv18N2t+RlP+JGUDTVlN1qpBX2yuZQC4/+h?=
 =?us-ascii?Q?+qXGuGKzuaqFSMZBJ2RYlyPEqS/qMrLuov5v8envrspH+4CtgW+6dy6jYZC0?=
 =?us-ascii?Q?QPky1vTAmfqbfeg6eC9zdipF5dTGsCEgOGsw0ov59t35rt+3tl+17lOzhkyA?=
 =?us-ascii?Q?5aRm3/OTrciRrSEE3iOI5IfQ3wr/kK0HNuQ7BL/mAUJXCRyQm1VdsW17OLhv?=
 =?us-ascii?Q?ZwWqLqhWOZ8DcQOCtQp/nJdWaCLc3QTm9qWjr4mf+xaWD8S0OkqcPI0Ty0uq?=
 =?us-ascii?Q?aMo3J22pz0Qeq20ltRcMBkpcyujvx4SCkBBekxHMDlfOIfkTjgbiBFyUzLuh?=
 =?us-ascii?Q?NB0v3GIWADzDh4Zi7X1JOwk4RPwoO89yjCRLopnM37lKHEboyePsby/tJRy4?=
 =?us-ascii?Q?XA9lZulGVpZMjPWJD+zhUva/BVDpjpmWOOi8QEh2V78FnTyzlAQLPSgFRt94?=
 =?us-ascii?Q?gjVlrnxlEsZy+vhlht/7hCTMO9uGRM+YeqKpPv51QMD4PZHSPH9VQD2IWC7e?=
 =?us-ascii?Q?CDFBged09TXWLwj8E3TTLPBbIMvojpSYavQFP85oEEa0EwPwcwT6+qXhjGB/?=
 =?us-ascii?Q?/tkYXqSAltJqWTqMZGHEe1NwFDYUEfE2XTnZ+vc1ksfrhC086c3WLjppxRaC?=
 =?us-ascii?Q?VMeXqT21mvDfweudVOMpc8jyvh9IXIOSpD3LYmB5THRMy8zPnxpTIzn0jkYe?=
 =?us-ascii?Q?+kiTllMLVTGSZDAHY7aXNNV7DYOuM0Hbw1EXr+2slrOC+Kf/cCCp6QZaIoEM?=
 =?us-ascii?Q?7ooaW6YnvHvOc5HAhlvhtaRLkGQk4Lp523mcU94vyqJLyqK3vi5HXZyqvdlq?=
 =?us-ascii?Q?G7TKf+/0RF7b1NaxOKptfqqcm5H7XL/OnDvmjYzcqpL8Tc0Quc6PTifUqn7m?=
 =?us-ascii?Q?29LOjJ4VtL3LEwqDKiAq5oN+5Jb6LZb5tKYgTnmzo8y6EsctjRqIlcye9uLx?=
 =?us-ascii?Q?dog+3QzXosIn/kcukMsnUWYUN3VmWcvhl4ufPvX8b//IJFn0jDCoWffWqorn?=
 =?us-ascii?Q?Ipt/5jDGgNGR9V1gclXWxz0HU6HA0R1A2B5fZxEQ2nc6ZMEmIC3haOn2HrLF?=
 =?us-ascii?Q?0LyiAdzJHi3gzduAtZklHD+NotFgt+DhuVeps5szH3aZ4jJTB4RwX6Q3wtfF?=
 =?us-ascii?Q?0S+5g5ibK09YYAhpYtBYQVE5K67V4wLg2If4ZcP9ceWPf9YATmBwmDdQCjvZ?=
 =?us-ascii?Q?oHm2iR8EJ7czFcagqWXgIjuP56zby8DPmz6MPS0Coqy7Cu1zLeCIo8EQdccL?=
 =?us-ascii?Q?P+w0xwYRqkoeqcEgvf048gWwkMloYuNt6FiKlHEDj8UHozSB5kiU5M/xVe03?=
 =?us-ascii?Q?srylrQht3Jani96l5aBuPpi3o2UKgFO4HwtrVSKbNLbaDu+5nwW+p+LwX6Vf?=
 =?us-ascii?Q?UrxYBQ0DMh2n9EhO7JdpNrY8Ouv5KvTKwYRDxWZMIVtIdZ+3SxIElPoaVbpk?=
 =?us-ascii?Q?1Zamt1hNbQloS8IlpHzZFYLQ1wAPW7TCYrlCf+UKDf8MNJOYXiMkbltQ+1zF?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9dd57e-c063-4ea8-a7b3-08dbe1574798
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 19:08:38.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hb0cwLTh4Ub0y8CQcjL8b1+RwZHy3xSg8am4kknalw4mKwHhutUMiioHxPC0v3fs0QDJQEK+Tb2PGeG4rt4utQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/i915: abstract plane protection check
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

On Thu, Nov 09, 2023 at 06:17:56PM +0200, Jani Nikula wrote:
> Centralize the conditions in a function.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20231109160722.3372379-1-jani.nikula@intel.com
> ---
>  .../gpu/drm/i915/display/skl_universal_plane.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index a4d0e2ede2f7..c1d426dbcc62 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1870,6 +1870,19 @@ static bool pxp_is_borked(struct drm_i915_gem_object *obj)
>  	return i915_gem_object_is_protected(obj) && !bo_has_valid_encryption(obj);
>  }
>  
> +static void check_protection(struct intel_plane_state *plane_state)

only not sure about this function name. maybe something with content_protection on it?!

but on the lack of a better suggestion:


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(for the series)

> +{
> +	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
> +	struct drm_i915_private *i915 = to_i915(plane->base.dev);
> +	const struct drm_framebuffer *fb = plane_state->hw.fb;
> +
> +	if (DISPLAY_VER(i915) < 11)
> +		return;
> +
> +	plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
> +	plane_state->force_black = pxp_is_borked(intel_fb_obj(fb));
> +}
> +
>  static int skl_plane_check(struct intel_crtc_state *crtc_state,
>  			   struct intel_plane_state *plane_state)
>  {
> @@ -1914,10 +1927,7 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
>  	if (ret)
>  		return ret;
>  
> -	if (DISPLAY_VER(dev_priv) >= 11) {
> -		plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
> -		plane_state->force_black = pxp_is_borked(intel_fb_obj(fb));
> -	}
> +	check_protection(plane_state);
>  
>  	/* HW only has 8 bits pixel precision, disable plane if invisible */
>  	if (!(plane_state->hw.alpha >> 8))
> -- 
> 2.39.2
> 
