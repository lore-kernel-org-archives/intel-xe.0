Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7B2CCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 05:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A12910E15D;
	Fri, 24 Oct 2025 05:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NX6eKUK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3E410E15D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 05:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761285355; x=1792821355;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UNC0PRd8cmeRbWWYmLJbLeXHdK9AjD+Oo4aEeFm//f8=;
 b=NX6eKUK489gqJjx1+HKJYVqMIeDmNbMiuhYxt1oXqltvaLDer7MPPhih
 dZfOv5oE7UX8U3wD6GrQhaGJWBJAvr+Zbkvf4miQEkTbg0bcbhTivYB16
 UK+xrC0zP4ndbHyOnNKfNhC5CDvl/3PquD+cRnNRLmmWY1KSZjIHMmG1V
 kSH5/Qs1OoQtytzHX4FzZTumzMnoD8BYj4QIZqyL9QHyLXHWk3dwFkihL
 xQYYzrNrvHri8B6r3dFbATCO+3r4CHOw6BIGelZUXvgYwViPufhXk1g1O
 olEvq74SuE7nrXKmF/FGz9WWjNsuSKtpLPvg9MQG41m6bN/8+MvGMuqT+ Q==;
X-CSE-ConnectionGUID: JN1CST9rSEq+rDOCcoHZHg==
X-CSE-MsgGUID: icJHy8iuQgW7Pp79aKwPrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88931372"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="88931372"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 22:55:55 -0700
X-CSE-ConnectionGUID: 2IyFdtfYS3KZ6b0h1Pgsfw==
X-CSE-MsgGUID: +KD7z2/tTQq31ziD6Avkww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="183523673"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 22:55:54 -0700
Date: Fri, 24 Oct 2025 07:55:51 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Sk Anirban <sk.anirban@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/cri: Add new performance limit reasons bits
Message-ID: <aPsU5xX7se3Q8rCO@black.igk.intel.com>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
 <20251023-gt-throttle-cri-v1-1-9f36f3c8861c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-gt-throttle-cri-v1-1-9f36f3c8861c@intel.com>
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

On Thu, Oct 23, 2025 at 09:56:54AM -0700, Lucas De Marchi wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Add support for additional performance limit reasons in
> GT0_PERF_LIMIT_REASONS register.

This gives the impression that we're adding new bits for the common set.
Let's spell out Crescent Island and how it deviates from the common set.

> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
