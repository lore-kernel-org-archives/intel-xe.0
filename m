Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9923CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 07:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB0910E315;
	Fri, 26 Jun 2026 07:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7djw8vZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD4F10E315;
 Fri, 26 Jun 2026 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782459259; x=1813995259;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=O9dH4ojG9lPX/6oTzX84/oLqiKHto3jfieCo0L9/Fxg=;
 b=k7djw8vZuV26xQuR3LZq2cb4515wIs3B3mPMICJ9VBevPsjhc1qXrwSo
 kw/74PrbSrhPz+XUCOGMqNCdsDp38SG+iDM+WunWOQK4EI4px+LvLFZtN
 us3UsNoYB5+qJakNQdNyTtFuZerthS45qeP5po8tlrjC0QZDO7fqiBNR8
 A2BOjutVWRPeABUIkfrADrc8zwzTImr5W0Ryej1bJzzBEd8RSXEghLPHc
 ufKi+prQ642emk0/vFgKNs88Gf/RI8+EOlmP1lJ3/QrhyzArYuLfQbzwj
 uyA0aT0ig56s7OWPmlupWHC6K4y35PgdmAD6l2SzrUDSjybdN2X4wCqSt Q==;
X-CSE-ConnectionGUID: svHFpMCKT0qsZcnz9gVe3Q==
X-CSE-MsgGUID: YVcbWOfUSHuurNPoV+fhWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="82243753"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="82243753"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:34:02 -0700
X-CSE-ConnectionGUID: e0rkSpU4RxiZ+UmWPmb1Ew==
X-CSE-MsgGUID: bKKzX8RtReOh8MfpKj9vFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="250200622"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:34:02 -0700
Date: Fri, 26 Jun 2026 09:33:59 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/xe/display: change order of
 intel_display_driver_remove_{nogem, noirq}() calls
In-Reply-To: <afb11c4e11cc4d946f0360aaad1664d004a93f41.1781549229.git.jani.nikula@intel.com>
Message-ID: <eaf57d9c-0dc8-8690-a962-e0d4de447c52@intel.com>
References: <cover.1781549229.git.jani.nikula@intel.com>
 <afb11c4e11cc4d946f0360aaad1664d004a93f41.1781549229.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1720987744-1782459242=:605841"
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

--8323329-1720987744-1782459242=:605841
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Jani Nikula wrote:
> The display driver init and cleanup calls are slightly asymmetric. The
> cleanup order should be intel_display_driver_remove_noirq() and
> intel_display_driver_remove_nogem(), not the other way around. This is
> also what i915 does. Follow suit in xe.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> drivers/gpu/drm/xe/display/xe_display.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 4a621779fc53..0d93784754c1 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -82,8 +82,8 @@ static void xe_display_fini_early(void *arg)
> 		return;
>
> 	intel_hpd_cancel_work(display);
> -	intel_display_driver_remove_nogem(display);
> 	intel_display_driver_remove_noirq(display);
> +	intel_display_driver_remove_nogem(display);
> 	intel_opregion_cleanup(display);
> 	intel_display_power_cleanup(display);
> }
> -- 
> 2.47.3
>
>
--8323329-1720987744-1782459242=:605841--
