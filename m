Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E014CCD6E4A
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 13:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9C810F1D4;
	Thu, 28 May 2026 13:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=leandro.ribeiro@collabora.com header.b="YsEWBvJn";
	dkim-atps=neutral
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C008910E6BA;
 Tue, 26 May 2026 19:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1779823986; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H+03uf04wb1kpMPe0hNp+nB0pL1vGbOxtXFW18nZQLIRHY7BrERuLljnlXNFKvL0NT68xom9Gha24rgpXMZDafmq9v7TrbOypbgMQF6V2jsUXOjmvMkHOnAelcq4H2RlbcUcYwBeqNUf1leDv9eEYA6WQltul7Wsz31aBQtwyGs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1779823986;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GtcuprZ94UHAcAaoXrOE+xI/bhw9j8o4Bjc4rnleg1Q=; 
 b=Ugo27+AATavxX1RaKEWHlWrBAnYQXsrEMJ+Dh03NoghcJrg3QeJYLYP8KcEiqQef0teOxpP1YJPKXknw6Vyg2Q70BcLj14wBt2sbzYBLq4JnsDCMVOcpxzWwD0SBmMjBiLzP3qMAX3y1Xa+mJdYCGWWnbkz3/zyhHtmEnaMWAmM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=leandro.ribeiro@collabora.com;
 dmarc=pass header.from=<leandro.ribeiro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779823986; 
 s=zohomail; d=collabora.com; i=leandro.ribeiro@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=GtcuprZ94UHAcAaoXrOE+xI/bhw9j8o4Bjc4rnleg1Q=;
 b=YsEWBvJnqBqRwkYMZ2aL1E1RRSf/TbpxrXuUtZ0y8immSBoLTXm848mx3y4OwIWP
 3dd3BH68/eDGzmewYBDtX71oOqKbbOyeDcWyIKLBrvrqpORUafc4Y5eT89kkJehs8Rg
 7ewJJ7osDK5zu0qg5L5aDLfNU04UpHX4yS7v8of4=
Received: by mx.zohomail.com with SMTPS id 1779823984185292.3656549840649;
 Tue, 26 May 2026 12:33:04 -0700 (PDT)
Message-ID: <128ff48a-bfb2-4163-a721-3625b2e2af02@collabora.com>
Date: Tue, 26 May 2026 16:33:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add the blend mode property to all planes that
 support alpha blending
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
References: <20260522194935.27411-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
In-Reply-To: <20260522194935.27411-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Thu, 28 May 2026 13:46:27 +0000
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 5/22/26 16:49, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Currently only SKL+ universal planes have the blend mode property.
> Assuming it now becomes mandatory for all planes that support
> alpha blending we need to add it to cursors on all platforms,
> and VLV/CHV primary/sprite planes.
> 
> TODO: For VLV/CHV primary/sprite planes we could fairly easily
> implement DRM_MODE_BLEND_PIXEL_NONE by remapping the A format
> to the corresponding X format, and on CHV pipe B (but not pipes
> A/C) we could probably even implement DRM_MODE_BLEND_COVERAGE.
> 
> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Ack, looks good to me (with the caveat I'm not familiar with i915 codebase).

> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c   | 4 ++++
>  drivers/gpu/drm/i915/display/intel_cursor.c | 3 +++
>  drivers/gpu/drm/i915/display/intel_sprite.c | 4 ++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index 70734d32a409..490908f59141 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -1108,6 +1108,10 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>  						   DRM_MODE_ROTATE_0,
>  						   supported_rotations);
>  
> +	if (display->platform.valleyview || display->platform.cherryview)
> +		drm_plane_create_blend_mode_property(&plane->base,
> +						     BIT(DRM_MODE_BLEND_PREMULTI));
> +
>  	zpos = 0;
>  	drm_plane_create_zpos_immutable_property(&plane->base, zpos);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index 52347668f27d..344cee13ea97 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -1078,6 +1078,9 @@ intel_cursor_plane_create(struct intel_display *display,
>  
>  	intel_cursor_add_size_hints_property(cursor);
>  
> +	drm_plane_create_blend_mode_property(&cursor->base,
> +					     BIT(DRM_MODE_BLEND_PREMULTI));
> +
>  	zpos = DISPLAY_RUNTIME_INFO(display)->num_sprites[pipe] + 1;
>  	drm_plane_create_zpos_immutable_property(&cursor->base, zpos);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
> index 6a65f92e8a03..3e38960bbbd8 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -1722,6 +1722,10 @@ intel_sprite_plane_create(struct intel_display *display,
>  					  DRM_COLOR_YCBCR_BT709,
>  					  DRM_COLOR_YCBCR_LIMITED_RANGE);
>  
> +	if (display->platform.valleyview || display->platform.cherryview)
> +		drm_plane_create_blend_mode_property(&plane->base,
> +						     BIT(DRM_MODE_BLEND_PREMULTI));
> +
>  	zpos = sprite + 1;
>  	drm_plane_create_zpos_immutable_property(&plane->base, zpos);
>  

