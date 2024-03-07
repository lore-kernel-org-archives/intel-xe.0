Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ADCC54E4A
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 20:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB4610FFA3;
	Thu,  7 Mar 2024 20:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/qfRYah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDEE10FFA3;
 Thu,  7 Mar 2024 20:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709844426; x=1741380426;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pAc95v/l7aqoKFV6lHImQIf+HmMamMCH9vQmSgGI8XU=;
 b=D/qfRYahLP8ugMCoPsKf+iZ0T1JJ2JlFssyJJZu+zQws3TS8GwbH19NO
 bdIYvQCbpUoO4OAXhk8A2cUJSssSldpIW+/+TL14pVBQ8r9QVDeVk6PaN
 3zawmmG8YVBI+U/EJkA9KHE46gBy+sTAiFjyAypxYbC9AEsA5CqydtpSA
 8OSwX8MOqTEBdW1WijHllnVrmvq4JrUfQ31UJZNfTBqsaLHoJBngcJCZF
 LNtq3M5ZRxACkFfMmFTwlg415nZhZ5eWKBz6XeMP6g5VIuzqMouSoTXvO
 +xX/u82QEG8/KO/gJBIVIdt5e89uU/cNNe282ovjRgrlATyVJka8Ar6Jh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4387864"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4387864"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10125242"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:47:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/client: switch to drm device based logging, and
 more
In-Reply-To: <f580f7a20bdea45178cef3940b636d491ae3dd92.1709843865.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709843865.git.jani.nikula@intel.com>
 <f580f7a20bdea45178cef3940b636d491ae3dd92.1709843865.git.jani.nikula@intel.com>
Date: Thu, 07 Mar 2024 22:47:00 +0200
Message-ID: <87y1atvkfv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 07 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Switch to drm device based logging and WARNs, and unify connector and
> crtc logging formats. Pass drm device around a bit more to be able to do
> this.

Forgot to mention that I also stop logging about -ENOMEM, instead of
converting that over to drm device based logging.

> @@ -813,7 +824,6 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  	offsets = kcalloc(connector_count, sizeof(*offsets), GFP_KERNEL);
>  	enabled = kcalloc(connector_count, sizeof(bool), GFP_KERNEL);
>  	if (!crtcs || !modes || !enabled || !offsets) {
> -		DRM_ERROR("Memory allocation failed\n");
>  		ret = -ENOMEM;
>  		goto out;
>  	}

-- 
Jani Nikula, Intel
