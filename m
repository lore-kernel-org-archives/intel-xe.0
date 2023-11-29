Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3726C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 14:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC9B10E0EB;
	Wed, 29 Nov 2023 14:30:10 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 14:30:08 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45CC10E0EB
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 14:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701268209; x=1732804209;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=TKi/6J3ppJEibMzlZTSjjNDtrjy6y8RxALvO+K/SA80=;
 b=VRD7JHIApj5IepuACCbCeAQUSYtzQPtCCaIyygeFrhWRO1HIsP+1Dudu
 6P8+DKSMLBsz1AtQpC7GaR0pyGRypK2HKkHzCLRtrwwDthp5btAvq2drG
 tyxn43aSl5pd7PZ07K7ydPvW+k8fzOtHPbcWgrnMvju7sbyx2dUVs2WmZ
 L2sGFN2UmMyNA+gaCSuk0raWzEEhUOTwyGM0tJ3SF8mT54Fx1WbJemjZW
 fF4D2Qjm6N4qIWibli9HIIdbYpYqWJn3i7nFR8vxZCyF0BGRvDVecJyIC
 RH2nCVcC+5Z8R+HhNpvGpmVLkOmqDmlArQbspCBm6EMQ4KtpKtW1D6elx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="68845"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="68845"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="768931765"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="768931765"
Received: from dstavrak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.61])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:22:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Animesh Manna <animesh.manna@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20231129135054.564076-1-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231129135054.564076-1-animesh.manna@intel.com>
Date: Wed, 29 Nov 2023 16:22:56 +0200
Message-ID: <87r0k863lr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v1 0/6] DSB refactoring
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

On Wed, 29 Nov 2023, Animesh Manna <animesh.manna@intel.com> wrote:
> DSB refactoring for xe after cherry-picking DSB implementation of
> i915.

Please use git cherry-pick -x option for all cherry picks to reference
the upstream commit. This helps automation and upcoming rebases.

BR,
Jani.



>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>
> Animesh Manna (3):
>   Revert "FIXME: drm/i915/dsb: xe changes for dsb"
>   drm/i915/dsb: DSB code refactoring
>   drm/xe/dsb: DSB implementation for xe
>
> Ville Syrj=C3=A4l=C3=A4 (3):
>   drm/i915/dsb: Allocate command buffer from local memory
>   drm/i915/dsb: Correct DSB command buffer cache coherency settings
>   drm/i915/dsb: Re-instate DSB for LUT updates
>
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_color.c    |   3 -
>  drivers/gpu/drm/i915/display/intel_dsb.c      | 153 ++++--------------
>  .../gpu/drm/i915/display/intel_dsb_buffer.c   |  82 ++++++++++
>  .../gpu/drm/i915/display/intel_dsb_buffer.h   |  29 ++++
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  70 ++++++++
>  7 files changed, 218 insertions(+), 121 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.h
>  create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c

--=20
Jani Nikula, Intel
