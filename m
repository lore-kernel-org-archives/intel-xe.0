Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A74CCA471
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 09:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC7910E53E;
	Tue, 30 Sep 2025 09:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ns+WPQyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C85F10E53E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759225325; x=1790761325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yZz+4zFLcM0yKTy02AJKHEC6KQpa5O43Gdd0nttCqgI=;
 b=Ns+WPQyfCfWrLDAWieo6mcVQKix3/+uXZ2FKJGNC3lnky3aH2ezhvvqu
 IOUrZcznyNn1MxUPAZlAOv288CKPSE5nOVzy0hIMvRfJ8BtVpstr6MPkJ
 COzkLHcPrOQfNzUSsED7XNNiUQDMqlHxDoiVXfR74jbZus+0feL1t0C0q
 fflqNFv31Qd8FVW1Oab50n1+zSxQVw4z64SbYUie7fJgxp6f7bPgEb1AL
 3najG4RPGPnynfs49+wuAXN+D3p6ZLHBp0Qk9K5CPikDqWZmLKmouhIlh
 nQ3EjBNgxnyvlCzO9tLqgCoIYNpm94bKY/a1vmxOIt0vBQnBEMy4XOLLk g==;
X-CSE-ConnectionGUID: dpZ0ULFCQ5aeP7WAPkQuvg==
X-CSE-MsgGUID: S9QpZ2fqRuqQ+P4aWGvXDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65116217"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="65116217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:42:04 -0700
X-CSE-ConnectionGUID: 445eCDMlTsOqKn01/ZrTOg==
X-CSE-MsgGUID: l7zocNUcTPKKGO03UfWoEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178860836"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:42:01 -0700
Date: Tue, 30 Sep 2025 11:41:58 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2] drm/xe/i2c: Don't rely on d3cold.allowed flag in
 system PM path
Message-ID: <aNul5umIUh3tf49g@black.igk.intel.com>
References: <20250918103200.2952576-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918103200.2952576-1-raag.jadav@intel.com>
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

On Thu, Sep 18, 2025 at 04:02:00PM +0530, Raag Jadav wrote:
> In S3 and above sleep states, the device can loose power regardless of
> d3cold.allowed flag. Bring up I2C controller explicitly in system PM
> path to ensure its normal operation after loosing power.
> 
> v2: Cover S3 and above states (Rodrigo)
> 
> Fixes: 0ea07b69517a ("drm/xe/pm: Wire up suspend/resume for I2C controller")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Anything else I can do here?

Raag
