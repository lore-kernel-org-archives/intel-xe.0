Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE3FCDB47C
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 14:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7883210EBB3;
	Tue, 23 Jun 2026 14:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLvgbIc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5313A10EBA3;
 Tue, 23 Jun 2026 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782225960; x=1813761960;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=NypFMR+sg4wsciPu2h9pzC81n7e01EZAMLcf+add21E=;
 b=JLvgbIc70X3DflaWpJvjo6mDuzqw1Ydi488vVRTq8tUY069YZ3bWx6SZ
 2xCGgLH0lDtdMqbfTKeT3t7uqp7TEooo1/v9aYJAceCsALIqxCiJEHsFd
 c4KzF9A0oE7a85QWxNhFOhaCP6gJsbufRkStpVBS1Dz7hgW1+C2e3CUbe
 2Tshz8/wAP4Wh6L8sBDCJjWH+N2hz9/vx/idMLlpIbLgqqUfKzsoGry1w
 jNq6UIb+0YknXyWslBq3IODAZcq+L5nxRyK6xYqrSHBDNph3XSnWtYffV
 nJw7HK3LGhwmW88kQ+dGamkfqScqYiep30T3m2KVf8EWeZyfXUOrvfE2E g==;
X-CSE-ConnectionGUID: Aeoc0cLvQqu8YQYAjrPEAA==
X-CSE-MsgGUID: 5DrLl9+9T+yCrY8khRVkfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="85525871"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="85525871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 07:46:00 -0700
X-CSE-ConnectionGUID: OkcNRZKkQyC/U0OgHe8XaQ==
X-CSE-MsgGUID: ecbj9u5lTcqU81tbwFqryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="248649691"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 07:45:59 -0700
Date: Tue, 23 Jun 2026 16:45:57 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/i915/hdmi: Remove CNP port F leftovers
In-Reply-To: <20260623125111.6632-7-ville.syrjala@linux.intel.com>
Message-ID: <5858a570-2bdf-d0a4-392d-4ef9bccba2ea@intel.com>
References: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
 <20260623125111.6632-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1517123360-1782223984=:605841"
Content-ID: <80d61cc5-0c4e-48d8-c404-bec809f09609@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1517123360-1782223984=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <c1757645-cbf6-8329-80e3-1b7ac8b68e48@intel.com>

On Tue, 23 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Since CNL got nuked cnp_encoder_to_ddc_pin() will never
> see a port F. Remove the leftovers.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> drivers/gpu/drm/i915/display/intel_hdmi.c | 3 ---
> 1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index f046918fd4bc..8a019d3574df 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2853,9 +2853,6 @@ static u8 cnp_encoder_to_ddc_pin(struct intel_encoder *encoder)
> 	case PORT_D:
> 		ddc_pin = GMBUS_PIN_4;
> 		break;
> -	case PORT_F:
> -		ddc_pin = GMBUS_PIN_3;
> -		break;
> 	default:
> 		MISSING_CASE(port);
> 		ddc_pin = GMBUS_PIN_1;
> -- 
> 2.53.0
>
>
--8323329-1517123360-1782223984=:605841--
