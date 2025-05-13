Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE0BC3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 15:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE94B88697;
	Tue, 13 May 2025 15:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTofpuWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ECB88697
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 15:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747148400; x=1778684400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=su+oYff06JEXsUFyDNPsaaq51KE5alEN8AL/PUYhgs0=;
 b=QTofpuWfyFxQG4IznFOs+EZh2igSD7MmzJnIHb6s14GYZ9unKN/rLyKF
 IDV/2bZZgS+ior2QoTpRlDe8q+SJaPeC2p6RnEWbcs3NGX/kN/noqjHio
 KmlY2MgbdLjNL+kho/roQFCfIFO5hH2q8yfEzaiO6nGX5n+EmzndOMpTJ
 vA3SH7xD6QgyPmlNtYtcrMfKYyjp3Y+3fFtem0dr+AWhnbxpL9bAYp8Yi
 hmUbTHsxbsfD3J0OcBaG81uHAcQTMongej2S3HrUMecP1Dy/wls09EaN1
 z2rgt1G9/kz2BVCky2AxmukN4aU4lFZyXCGAGzSvsg84qfcc+Dny0PSV1 A==;
X-CSE-ConnectionGUID: K+0up/IcSfqM0YsJi0qltg==
X-CSE-MsgGUID: qyYJP9h8Qj2bPDyC/w3MJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66407077"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="66407077"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:59:59 -0700
X-CSE-ConnectionGUID: EQa1bgDIRBK/nyE6wxmmHQ==
X-CSE-MsgGUID: FwGTAm01RzWQV/pEOeJY2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="138653426"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:59:58 -0700
Date: Tue, 13 May 2025 17:59:54 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe/guc_submit: Simplify and fix diff calculation
Message-ID: <aCNeatXnJUUgJYle@black.fi.intel.com>
References: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
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

On Tue, May 13, 2025 at 07:25:49AM -0700, Lucas De Marchi wrote:
> With a u32 type, there's no need to check which one is greater: the
> current is always the latest and if it's less than the previous, it's
> because it wrapped: just do the unsigned calculation that will lead to
> the same result, or better the correct one. It fixes an off-by-one in
> the wrapped calculation, however that doesn't really matter for the
> timeout calculation.

I remember coming across something similar in hwmon as well.

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
