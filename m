Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32A410BA445
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 08:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374AB10ECBE;
	Fri, 27 Mar 2026 08:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyIRewyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F112410ECAC;
 Fri, 27 Mar 2026 08:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774600892; x=1806136892;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=HFgcy7Z638hjc1aInlFTQ5VhFty/UW+Zg+A3T+qWuNQ=;
 b=YyIRewyRV9Y2SUBTXDfVk2nbBkt2tWmi+BReKgNEbapKsMaQGV+AQZGi
 3xfADP6dPSQIpyh8TFAzMAcXKWYGkv8xrwD6D+WeGrM2VfynDc5TT11ge
 GNY/KfFFYdKt5gHnrQwKF/nONKIRm0Q4d+H8rUu0+tZDRF23pZTcbXYWe
 qsD08PUnHhjc8aTbM3KBFQaK4tW2u2//e+d3iBWqnOxPcdxx9o+2wF7aY
 ZgWXj57J2TCTXeSq39uMwgDJ1FyzMBdvjirCqZK63Ea73oeroytzMpqms
 mryzSpF4cgR3pVjryPh/BlpFyzo8VEyeKahb+iPWm3HeAqYnnudkh4YXx A==;
X-CSE-ConnectionGUID: /6OAVKM1TJiRFVVw5rOgOw==
X-CSE-MsgGUID: dfCn5BtdQVeQ3QgM1UfMMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98287837"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="98287837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 01:41:32 -0700
X-CSE-ConnectionGUID: siTYrnXWQb2SwuMaD0EtgA==
X-CSE-MsgGUID: eMQKunQIQy65fxKR/rYYtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="225259019"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 01:41:30 -0700
Date: Fri, 27 Mar 2026 09:41:28 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH 1/9] drm/i915/casf: s/casf_enable/enable/
In-Reply-To: <20260326223139.19116-2-ville.syrjala@linux.intel.com>
Message-ID: <348bff74-1e3a-5cf7-77db-52378a0232c5@intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
 <20260326223139.19116-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1440914840-1774600891=:330621"
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

--8323329-1440914840-1774600891=:330621
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 26 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The 'casf_enable' boolean is already inside a casf specific
> structure, so drop the extra 'casf_' namespace from the bool.
>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał
--8323329-1440914840-1774600891=:330621--
