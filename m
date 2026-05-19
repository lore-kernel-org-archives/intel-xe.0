Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF0DCD4851
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 05:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF6A10E0B8;
	Tue, 19 May 2026 05:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxlEUnof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD92A10E0B8
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 05:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779170104; x=1810706104;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wuh8UoL8NHXPwxj4MGv0Vzpmgo1B2aTTf3Ph3pP9LKY=;
 b=fxlEUnofNznm2eHpa1CWWDbAp5rk2Ly9rYPlmsV+a3AEOM5izg3HgWii
 GYMyJGg3MRj+io29FvxIAppo78J1DPQHocmsU/rBa2dZCfMki2z+Mz8cm
 A+DaRqcglV6flegH0Os6sEk2E9VfJnlMFM5tC0p/rjwdmEGltRJsgBhak
 09Hj6vOIwyzMz+mYdLq7Js4E0H2yRhYSx/Mi752Fh5oWBfl38bIS7kVFj
 agF8UPMSwU600L2SjcYICxlX02dI/2wWJCRNnnNBQq356KqXlzV/HghlC
 7WVt/03Zy9Jbp9xbLTRUvgp/cQWiCkZhdMyjm2cb0J51vAQUnpPIofQaV Q==;
X-CSE-ConnectionGUID: /qIqOprEQ+uXgHpvJxxLtA==
X-CSE-MsgGUID: 0zVaZ3SyRFiUqqpsyoSByQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="102714505"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="102714505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:55:04 -0700
X-CSE-ConnectionGUID: UDcFPFYqSLGAqaORSM+N2w==
X-CSE-MsgGUID: xN/D0K3ITcq9sKU4/QsWsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="277770563"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:55:01 -0700
Date: Tue, 19 May 2026 07:54:58 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v6 4/6] drm/xe/xe_drm_ras: Wire get/clear counter callbacks
Message-ID: <agv7MjwJE_hzzIey@black.igk.intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-12-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514052205.1340143-12-riana.tauro@intel.com>
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

On Thu, May 14, 2026 at 10:52:10AM +0530, Riana Tauro wrote:
> Hook CRI get-error-counter and clear-error-counter support to
> xe_drm_ras to allow userspace to query and clear counters if supported.

This looks like repetition of below and can be dropped.

> When userspace requests for a drm_ras error counter, query the system
> controller to get/clear the value.

... if supported.

> Integrate this with xe_drm_ras.
> 
> Usage :

Nit: Redundant whitespace.

> Query all error counter value using ynl
> 
> $ sudo ynl --family drm_ras --dump get-error-counter --json \
> '{"node-id":0}'
> [{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
>  {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
>  {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
>  {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
>  {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]
> 
> Query single error counter value using ynl
> 
> $ sudo ynl --family drm_ras  --do get-error-counter --json \
> '{"node-id":1, "error-id":1}'
> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}
> 
> Clear counter using ynl
> 
> $ sudo ynl --family drm_ras  --do clear-error-counter --json '\
> {"node-id":1, "error-id":1}'
> None
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

The rest looks good to me, but let's try to land the fixes[1] first so
that they apply cleanly.

[1] https://lore.kernel.org/intel-xe/20260514202839.1888688-1-raag.jadav@intel.com/

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
