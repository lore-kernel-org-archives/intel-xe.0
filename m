Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA6FE9A04C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 08:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531E10E69E;
	Thu, 19 Feb 2026 08:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKRtMeJX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C695710E697;
 Thu, 19 Feb 2026 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771488256; x=1803024256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kpmbeVGBoReassUVaSoXhfHBrPb7o8rJ4VqsUBVahQk=;
 b=iKRtMeJX8p7YwKEHtc8+DrhrrFmnfWzNpUKhH5/Ptz9nwcnEHvgor5Cr
 dnZArL4rdUqDqI/ZVWoCPe0TXp2D0VvyOg9CA80auASP6e1VIBghq5vRJ
 WFS+P7OXzRv78MNxtsVyfZ11y6QUYja6RBHukC9aHyJX1F8bkxJ/Y867z
 u1DoX8hLuKmPSQkY+FOh4gefQcbzS95FT+Mdqm3XugR2DM95yIpJjiUMU
 29tqb2X5hJnmXsUVCF4gmpKoaTwT9Ipv39+WBW+StinJ4LVenKxKerKrl
 mZRvJZxOfYqddJ3926TtSJYk4sQvN+v5amI3v6ZNwFFfl74pd570Yas5I g==;
X-CSE-ConnectionGUID: vlOxjlvSQSmzbPbQcnUe6A==
X-CSE-MsgGUID: UTZPqHRnSwuAVfSfNbrBkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="98031726"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="98031726"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 00:04:15 -0800
X-CSE-ConnectionGUID: 3TGRlSAeQB+VFxfRN1QvFA==
X-CSE-MsgGUID: hXHLsr7ISM2k3QzYHf2ixg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214458613"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 00:04:12 -0800
Date: Thu, 19 Feb 2026 09:04:09 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v7 3/5] drm/xe/xe_hw_error: Integrate DRM RAS with
 hardware error handling
Message-ID: <aZbD-YapPK7nACyX@black.igk.intel.com>
References: <20260218121904.157295-7-riana.tauro@intel.com>
 <20260218121904.157295-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218121904.157295-10-riana.tauro@intel.com>
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

On Wed, Feb 18, 2026 at 05:49:05PM +0530, Riana Tauro wrote:
> Initialize DRM RAS in hw error init. Map the UAPI error severities
> with the hardware error severities and refactor file.

...

> +static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_err)

Missing const, but can be done as a follow up.

Raag
