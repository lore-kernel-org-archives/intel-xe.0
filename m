Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A3CC04FF9
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 20:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E915F10E021;
	Wed, 20 Sep 2023 20:06:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FE210E554
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 20:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695240411; x=1726776411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=amjA3dLihzpECUeCArgDsNgrEhyRIMqy2TWJPjjbhjQ=;
 b=TX2MZHd5NFCZz7j80FTwJ5SSTYC5M1BGseDJyFLrb7oUcku8yv8kvKVP
 BLZNsZ6p8RrYG4HyCBRTFWE61vZxKhohbCYKlLiA4aRiEGvrr8uqxcl+H
 wGNgQUPX/nzQRuZEzyaXB4MRqNzGVoqgmfLGUhDg4z8ZlOGX2NIzG44yQ
 Pc7V2OEyKfkU2f3scQTUlYLU9umcu06K8LfozYoyL75PpNNJPiJS4HUMT
 xoDUwTd2MNdVbc8zzWdcUHYN5LDy6C7W4za6cqtgQt+1/a9k+IVHP03nf
 57akoZFEDfdQPdxj8GCB+dfCP8mx+p9b8yK5kzKz030CUGLXMIEz+XhUa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359711030"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359711030"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 13:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696458888"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="696458888"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 13:06:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 13:06:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 13:06:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 13:06:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajBTJEvcQq6idfxSn4tnnsN4u9IlruXP8qA9jIFn1zPl9xMXBFRaCRYU+aMyY7MJc3VdHXVkv0swjolU7vmwJn8FunCBisFqoj4YNrwuIoCHoSe4Y3s07g7mW8ch3Gs66GD5fa5c/v7e2P/tq1B44WiPnaFwOAljAqOaGhXfOkzcei5pTgl4K+3sCczKIfrnOrHJXAIzi6sYTTtAiFL8MqFa+dN17Zid0pSX4vP/3alNEMfjk6/PoeL6xj159VkozpzUDyg/PQRxD5fpUNn7A6eYRm9snme3HgPMyfYtaIwAXaib8y+JVNU37eKrIMi9T+MY4BRtpDsY+yA0D4PxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s648JKNRxZzUavTKL15BgOsNC0Yeujtu+URMu+X6YW4=;
 b=GF7nbKiB2N49PTPJmWSgS8INRxLNh9K6N0ftjDXN+7ZOXz/LvT5EIpg+hKzkZtXm/kZxUdrTX0DO72buAInKac4szN1OtGY73FUpxgFHMGVMMmY1ZPyTtQThKfzqaXB0UEi88sVXp9eGGVocA75iZJ5s0EU9hWN9Nyg0DI34DoeokCLNDSmH9xeZufSWkZ5gtwCxc9LuJ0YKFF/8QtXwtYflt90YHp5lYh7J83zL8QkgwpfYPXgCBrRiGcO3ok80cszjZSrG7POdwSCK7EYUl4GB09Ci0bYKyHy7bvm1s1UAyEJ7f9EuQ3c4ih59GmkKAmW0umhpzpmyypH+yJoUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6234.namprd11.prod.outlook.com (2603:10b6:930:25::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 20:06:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 20:06:38 +0000
Date: Wed, 20 Sep 2023 16:06:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZQtQyjMZmtzuVmKM@intel.com>
References: <20230915173646.116724-1-maarten.lankhorst@linux.intel.com>
 <20230915173646.116724-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915173646.116724-3-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: a05bb88d-bbb9-4906-f0f9-08dbba1518ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K//hudZ6qMFOA5jManuoen/bi3pIVTVdEiMkXnbzLEI6uN3wAEbLtL1icqt1EV8uZYf505hI4PF/mf4svKFQH+prQn1i9yKr0To/LCS/XjFeJdc7vvrVfsWDnXqZz3guwau6eLwuw9T7/ebBfHXze1sa+ywTDeBz4mdSIkUPeKxnULBHiOAnop+/ydU4hpgTjAW9yJh4BnTlNU7kZbsBGXUjHhx3Ixaru8dNwIIUUgxA1v2IqBav9VmXeWgT93V0Ko6NlWWJKKK8GoXjy5Zi7joncQg4ZafbwZ48/9lb1whtpQQWxVf4TBUI5mNfAItebz3NAOGqQgjAe0opz7CuvbCCKG1iBTuhuQsymWmamX0nv/50IioWM6i6Oo4y1RxYZ/rYOAr02zeuWVUyG2tndmkSlAi1Lw6Br/lMSbN0gomZHQNsOdievbVsFz271DZIGH26pM7likZAdmWPC1klwZBpaq8zRbjI8D+3lOsH1NvCgUqAQKbcKeaX3gQgkJsJ2105b0vk7VSQFdqJAB7TKOxhqYmy97l1nknCC9BYN+x3Z0RfOqCEhXkKbM4gSQPZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(1800799009)(186009)(451199024)(6666004)(6486002)(6506007)(82960400001)(36756003)(38100700002)(86362001)(2616005)(2906002)(15650500001)(6512007)(478600001)(26005)(4326008)(83380400001)(5660300002)(8936002)(41300700001)(316002)(44832011)(8676002)(6916009)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X0ril/Yvn0kAn7qXV7VLQy89dHjCaX19qz2oCfx1n7P3nVWGgh+9x2SpWTh6?=
 =?us-ascii?Q?WjQkJYWFICI24kMPVkNbqqRxXfMcDrJJA8Crmten29q8BYb8zBE6NbKXIs8z?=
 =?us-ascii?Q?Xew54EO9IAl5KPHMJvcvnlkBNiK4LnZE4EkXEjxwJggaG9FbaWar0jhPBzH+?=
 =?us-ascii?Q?siEb/Vk76glXBSWrKNAyufL6oFRGYFZHQyVBK0OGehkox1JyF6XTT1GksXaX?=
 =?us-ascii?Q?AG02yr1GSXVLomnp32+h6kzDBkxo/5eP0OEUnJ8/xxTeadSLK7/HtD+DRRfJ?=
 =?us-ascii?Q?qU8fVLRog613GolNaUiyh5NCxm2BquaoUmu2MN3WKWMCDcNZoGxaoKkYX5sD?=
 =?us-ascii?Q?hwB7KwF6GNlhHIPIKl0qEs8kOWyrZoLWAgZI/ltQnXYTo2MjmgP/16tIFVX9?=
 =?us-ascii?Q?mM7ve+SLyeaBe/DsAKj6n693fQoPs8AaJohkY1w/qLVr8O/3mNuqjxSYFYk0?=
 =?us-ascii?Q?v36yve1IYmvqkP4Y+Kz6PYCrzXkte894/P+2/wXbMTegrIa/C+UYb6Tdwu9A?=
 =?us-ascii?Q?CRe3xq2ANHORhHdIHL5dOFrCiNn4saYyHlJbDAIYKD6wJFs7waT4/mOZiWgI?=
 =?us-ascii?Q?nSUHrTO2VSSeOyCWdEODwR+Hyq6p7soH/lq1KiiLP2fHdP/WZvtqDT/QwRsP?=
 =?us-ascii?Q?jzf5PWCxO7oSaROBwqMZQx+iF146Pr7323GacBGPOmRPfraZQ3MPtgaJU8cR?=
 =?us-ascii?Q?jpiDDv7/nSApZHvJnuGij5CaQmJGM895KfXMom1XCMdIjDwHd0L05k31j8wG?=
 =?us-ascii?Q?mqqx3ym3vjDtHG/y9gBOVzIyuuSLa97Jdt3a4fWU8lscWyUaUyV5V1mUBGkr?=
 =?us-ascii?Q?Sm9qkdTkEvWZjJhMrslfI4ScTdiddJ8dQkTKEmni6oie/9GEn8mwZ8FoyPc6?=
 =?us-ascii?Q?Kp/t2PxF6AF34PwFI2cQJc65ZcfAkDIN1dS2/n6+X0vjh7iMKLVWGgC7nzjV?=
 =?us-ascii?Q?Ot42qfduHF2ILnhXNcCaHngaOUofsulCnI+YIF+plmTCPC/dlzr/UYpwAMmk?=
 =?us-ascii?Q?urNHZ4pnXfhqqK5on9HV8PeCyQ+ijx/B9B3tJFscEL8sALX9n/qKbhc9ARHI?=
 =?us-ascii?Q?x28g+aDBCd6vxrYwgKgCjaAQdqDBbKTTdk038XCVxxpBeALO6OwnVbe3vNld?=
 =?us-ascii?Q?XtcERDl04mq9a3UIKVwTYpt8yyDze5QsV9e9vbej26ppDk8S6A1fQ0oFY+rp?=
 =?us-ascii?Q?QEWJEhEqLitj+aCd8PVKcg7t2TzVGcZjp1ZcrwXdQiRnKm4G7EESVIOcDHz0?=
 =?us-ascii?Q?JzRxxNkDQ4vDoSi7NiN8nGrapFyKoIyL4whq5GrLb+gJEJ5PUl3XM+8CyhPQ?=
 =?us-ascii?Q?3+DJ+Ww7K4/ddAd1AJ+yPjYK1gZhrRM9X5JeEVpOh6D7UHQFG3j0aNZ857/j?=
 =?us-ascii?Q?sZLFF92V55yxOM+OgqPOvEPNAAGuBTGR44mViYxeKgYTcKgQtAjeKzzLLX3b?=
 =?us-ascii?Q?fGo7usmkGwwkemeGIA3+9jL5BoHs0rJ09shh3+sGjmTTf46GHq6NGW3gPl4c?=
 =?us-ascii?Q?y/tf6or1idGfZWm1sbwlBZYamHfne36T9t+2e6gcF3IvlABHm6e9+i1n+zYz?=
 =?us-ascii?Q?ce9lKdRWWbt3+saVvZUafUy5lvRNohOky2teS9ELkJwC7lQUaWaFV7c/IQkv?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a05bb88d-bbb9-4906-f0f9-08dbba1518ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 20:06:38.0660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HzyxRqUO845l7PROwuCarAZH67oc8dtBsLnwxxB4lm42ysnO76r4273+PPIFjq84ArDtwZIZ7dnXdPsB3ZN4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6234
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/i915: Block in cleanup for legacy
 cursor updates
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

On Fri, Sep 15, 2023 at 07:36:46PM +0200, Maarten Lankhorst wrote:

we need a commit message with justification for those. and probably
better to land them first to i915 and then port to xe like Jouni
is doing.

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c | 18 ++++++++++
>  .../gpu/drm/i915/display/intel_atomic_plane.h |  2 ++
>  drivers/gpu/drm/i915/display/intel_crtc.c     | 36 +++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_crtc.h     |  6 ++--
>  drivers/gpu/drm/i915/display/intel_display.c  |  4 +--
>  .../drm/i915/display/intel_display_types.h    |  5 +++
>  6 files changed, 65 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index cb60165bc4156..ba9e6c7809bee 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1167,6 +1167,9 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>  	intel_display_rps_mark_interactive(dev_priv, state, false);
>  
>  	/* Should only be called after a successful intel_prepare_plane_fb()! */
> +	if (old_plane_state->unpin_work.vblank)
> +		drm_vblank_work_flush(&old_plane_state->unpin_work);
> +
>  	intel_plane_unpin_fb(old_plane_state);
>  }
>  
> @@ -1179,3 +1182,18 @@ void intel_plane_helper_add(struct intel_plane *plane)
>  {
>  	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
>  }
> +
> +/* Completion is enough */
> +static void intel_plane_cursor_vblank_work(struct kthread_work *base)
> +{ }
> +
> +void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_state,
> +					 struct intel_plane_state *new_plane_state)
> +{
> +	if (!old_plane_state->ggtt_vma ||
> +	    old_plane_state->ggtt_vma == new_plane_state->ggtt_vma)
> +		return;
> +
> +	drm_vblank_work_init(&old_plane_state->unpin_work, old_plane_state->uapi.crtc,
> +			     intel_plane_cursor_vblank_work);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> index 191dad0efc8e6..5a897cf6fa021 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> @@ -66,5 +66,7 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state);
>  void intel_plane_set_invisible(struct intel_crtc_state *crtc_state,
>  			       struct intel_plane_state *plane_state);
>  void intel_plane_helper_add(struct intel_plane *plane);
> +void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_state,
> +					 struct intel_plane_state *new_plane_state);
>  
>  #endif /* __INTEL_ATOMIC_PLANE_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index f06b987f55582..e3b8ce6072284 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -470,6 +470,7 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
>  
>  /**
>   * intel_pipe_update_start() - start update of a set of display registers
> + * @state: the intel atomic state
>   * @new_crtc_state: the new crtc state
>   *
>   * Mark the start of an update to pipe registers that should be updated
> @@ -480,7 +481,8 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
>   * until a subsequent call to intel_pipe_update_end(). That is done to
>   * avoid random delays.
>   */
> -void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state)
> +void intel_pipe_update_start(struct intel_atomic_state *state,
> +			     struct intel_crtc_state *new_crtc_state)
>  {
>  	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> @@ -500,6 +502,19 @@ void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state)
>  	if (intel_crtc_needs_vblank_work(new_crtc_state))
>  		intel_crtc_vblank_work_init(new_crtc_state);
>  
> +	if (state->base.legacy_cursor_update) {
> +		struct intel_plane *plane;
> +		struct intel_plane_state *old_plane_state, *new_plane_state;
> +		int i;
> +
> +		for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
> +						     new_plane_state, i) {
> +			if (old_plane_state->uapi.crtc == &crtc->base)
> +				intel_plane_init_cursor_vblank_work(old_plane_state,
> +								    new_plane_state);
> +		}
> +	}
> +
>  	if (new_crtc_state->vrr.enable) {
>  		if (intel_vrr_is_push_sent(new_crtc_state))
>  			vblank_start = intel_vrr_vmin_vblank_start(new_crtc_state);
> @@ -635,13 +650,15 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end) {}
>  
>  /**
>   * intel_pipe_update_end() - end update of a set of display registers
> + * @state: the intel atomic state
>   * @new_crtc_state: the new crtc state
>   *
>   * Mark the end of an update started with intel_pipe_update_start(). This
>   * re-enables interrupts and verifies the update was actually completed
>   * before a vblank.
>   */
> -void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
> +void intel_pipe_update_end(struct intel_atomic_state *state,
> +			   struct intel_crtc_state *new_crtc_state)
>  {
>  	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
>  	enum pipe pipe = crtc->pipe;
> @@ -687,6 +704,21 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
>  		new_crtc_state->uapi.event = NULL;
>  	}
>  
> +	if (state->base.legacy_cursor_update) {
> +		struct intel_plane *plane;
> +		struct intel_plane_state *old_plane_state;
> +		int i;
> +
> +		for_each_old_intel_plane_in_state(state, plane, old_plane_state, i) {
> +			if (old_plane_state->uapi.crtc == &crtc->base &&
> +			    old_plane_state->unpin_work.vblank) {
> +				drm_vblank_work_schedule(&old_plane_state->unpin_work,
> +							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
> +							 false);
> +			}
> +		}
> +	}
> +
>  	/*
>  	 * Send VRR Push to terminate Vblank. If we are already in vblank
>  	 * this has to be done _after_ sampling the frame counter, as
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
> index 51a4c8df9e657..ca7f45a454a0a 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.h
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.h
> @@ -36,8 +36,10 @@ void intel_crtc_state_reset(struct intel_crtc_state *crtc_state,
>  u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc);
>  void intel_crtc_vblank_on(const struct intel_crtc_state *crtc_state);
>  void intel_crtc_vblank_off(const struct intel_crtc_state *crtc_state);
> -void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state);
> -void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state);
> +void intel_pipe_update_start(struct intel_atomic_state *state,
> +			     struct intel_crtc_state *new_crtc_state);
> +void intel_pipe_update_end(struct intel_atomic_state *state,
> +			   struct intel_crtc_state *new_crtc_state);
>  void intel_wait_for_vblank_workers(struct intel_atomic_state *state);
>  struct intel_crtc *intel_first_crtc(struct drm_i915_private *i915);
>  struct intel_crtc *intel_crtc_for_pipe(struct drm_i915_private *i915,
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9df8081f78d97..ce493ebbd9b93 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6610,7 +6610,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
>  	intel_crtc_planes_update_noarm(state, crtc);
>  
>  	/* Perform vblank evasion around commit operation */
> -	intel_pipe_update_start(new_crtc_state);
> +	intel_pipe_update_start(state, new_crtc_state);
>  
>  	commit_pipe_pre_planes(state, crtc);
>  
> @@ -6618,7 +6618,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
>  
>  	commit_pipe_post_planes(state, crtc);
>  
> -	intel_pipe_update_end(new_crtc_state);
> +	intel_pipe_update_end(state, new_crtc_state);
>  
>  	/*
>  	 * We usually enable FIFO underrun interrupts as part of the
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c0931d89d0dd9..20620ae074069 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -769,6 +769,11 @@ struct intel_plane_state {
>  
>  	struct drm_rect psr2_sel_fetch_area;
>  
> +	/*
> +	 * Unpin work for cursor fb updates.
> +	 */
> +	struct drm_vblank_work unpin_work;
> +
>  	/* Clear Color Value */
>  	u64 ccval;
>  
> -- 
> 2.39.2
> 
