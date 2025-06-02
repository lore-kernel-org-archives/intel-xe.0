Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BDBC54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 16:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B1710E569;
	Mon,  2 Jun 2025 16:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAJY+EpF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCD910E565
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748880981; x=1780416981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZwHtz+um4xvyi8fvmWf244f4yoiQW9pSaAV79ESBqXk=;
 b=lAJY+EpF1E1eOGIHd5a6Ub3W9FGR0hRE+okanWxP0QnwdFZ/0lroPHVU
 jyd88FEhe0vaF8/U8Mo9Q6aSmh24hm5Tk93BGRasUwM8DbUuw1Tj7jw8M
 uf7+T5iTxUzpnMWBpP8N5HELz8hdffOVcIfWUjT3m3SREBy280LcpT3X+
 V1wRexBm2gM8PoY26Aed8VZM5ZCwKmCYSF8lBagxAm1uixjNzKDGu/FkW
 hM3gznh1QImbCk7RwI/+HD8a4Izzz/xhVp/OEdmUJVBjpUXRi/4lm61dm
 3vP1wTeSf2gdQm/HeOkO6qcYYr4+djW0nAUmUIUpueH3pCpuTl03IU1hl w==;
X-CSE-ConnectionGUID: AbNZEZfMTAWqCyRLZ43d9Q==
X-CSE-MsgGUID: DbXf001FTo2NmUwL747v6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54691381"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="54691381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:16:21 -0700
X-CSE-ConnectionGUID: o4sfYY+GRrO7OQJ6A7pFRA==
X-CSE-MsgGUID: 1QaJwRCJQSmHXjx97AkbWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="148438693"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:16:19 -0700
Date: Mon, 2 Jun 2025 19:16:16 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: Simplify and fix 32b wrap
Message-ID: <aD3OUGCdihky6qyo@black.fi.intel.com>
References: <20250530-xe-hwmon-wrap-v2-1-ce653db7fe4a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-xe-hwmon-wrap-v2-1-ce653db7fe4a@intel.com>
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

On Fri, May 30, 2025 at 03:31:57PM -0700, Lucas De Marchi wrote:
> Like done in commit eaa287069a70 ("drm/xe/guc_submit: Simplify and fix
> diff calculation"), just use u32 for wrapping the value, which is
> simpler and more correct: when wrapping on 32b, the accumulated value
> was off by one.
> 
> Also, do not mix the u64 value from pmt with the u32 value used for the
> calculation.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> Changes in v2:
> - Rebase - now there's a u64 coming from pmt that was mixed as
>   "reg_val", so use separate variables.
> - Removed previous r-b due to the code changes. Raag, please let me know
>   if you are still ok with this

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
