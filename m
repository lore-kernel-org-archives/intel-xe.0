Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12DDE7E636
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7269910E3E9;
	Tue, 26 Sep 2023 13:32:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1102010E3E2
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695735160; x=1727271160;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dKzgNQ6ncwruhAn9GhlIs4JRqykNqILASIAbJ4W8XTo=;
 b=ZOCJoDbHu99SHhUdkQE1Z1erAoJNIp6tYrAH8iIm2wDJqohHyV10zlXz
 wn47YRqy4mQxG2cyxEnJcV843fDJsX/JLLAgwvxDFdPr+KJR7kwMT31rT
 qZjn/mEN080+a4upW19g8Ddh887W4pmbCRZl1uX6mNOqnKonc4HKHKVpO
 gCHVilBYTzDvLNNNTQqA7XNEuvJIQ7ZBSBimqixKyRld1DuRF3kL73CtI
 TCnxkxFG6TfHeXUwNb4RaJNIeALs01N8Eru/+WP/6Zpi3GRP9uShX7/VW
 5gRy6Fk/dP6CZNDpSN/hH89z2nDIyDikz7AcZ97fM8c5vW9hRmMIv0trQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361813960"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="361813960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 06:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="892186603"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="892186603"
Received: from wagnert-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 06:16:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230912064709.2802305-3-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
 <20230912064709.2802305-3-jouni.hogander@intel.com>
Date: Tue, 26 Sep 2023 16:17:28 +0300
Message-ID: <87a5t9kr9z.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v3 02/12] drm/i915: Ignore set frontbuffer
 return value on release
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> i915_gem_object_set_frontbuffer returns set frontbuffer pointer.
> When we are releasing frontbuffer we are clearing the pointer from
> the object and the value can be ignored.

Was this supposed to be sent to upstream i915? What's the story? It
depends on "remaining changes to make xe compile", and the subsequent
patches that are fixups to that, won't apply without this. So it's a bit
of a mess now. :/

J.

>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/g=
pu/drm/i915/display/intel_frontbuffer.c
> index a9a8c75b8236..629185e5a880 100644
> --- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> +++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> @@ -238,7 +238,7 @@ static void frontbuffer_release(struct kref *ref)
>  #ifdef I915
>  	i915_ggtt_clear_scanout(obj);
>=20=20
> -	i915_gem_object_set_frontbuffer(obj, NULL);
> +	(void) i915_gem_object_set_frontbuffer(obj, NULL);
>  #endif
>  	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);

--=20
Jani Nikula, Intel
