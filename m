Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B2C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 12:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B299910EB8F;
	Thu,  6 Apr 2023 12:25:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502C010EB8F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680783947; x=1712319947;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wlJ2zu6jetYdn8hOCR7yEx7wysL8Rz/hS1dTCqZo7LM=;
 b=XPdBvolIoabsQLu1A+ITUiOEBWb+2ELMPEnXA9M4qG+xJOL3AVNJGvqK
 zZbnfHGU6RN51m9X9Knr2KJCFIVDKH71se0NQ34O450/iw1hlw/49xtXR
 s8huUydBgP1LXJ/I+QIpuSfcFMN6UDqX5UjSZ5hqqG1xx9xMmSxj78gz3
 iT0OETKPmTU9Ib/KReF8PnWpcofqVqA6d44+tJCEYTc1KVA7CpwnInyTp
 KlVjCtCceQsAwnhNwsrD8kleXJoEoNsxAnxpSt3w+nq7jj9c0Sd2Ce2Ai
 oFZ+l+PT3ReeWYIQhjOuRywpSPph94UID+QAxuQ/H2L4Bksofj9OPV2iZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="323096913"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="323096913"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 05:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="861383772"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="861383772"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 05:25:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
Date: Thu, 06 Apr 2023 15:25:39 +0300
Message-ID: <871qkxyz7g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE.
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
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 06 Apr 2023, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
> These patches in series are for adding Reliability, 
> Availability and Serviceability support on xe.
> Patches provide the infra for various hardware error
> counting and logging. These error counters will be exposed to 
> userspace in subsequent patches.
> In current patches:
> 1) We are adding support to handle new interrupts bits.
> 2) Counting of GT errors.
> 3) Soc/SGunit error counting.
> 4) CSC HW and FW error counting and sending uvent.
>
> Akeem G Abodunrin (1):
>   drm/xe/ras: Add support for reporting CSC HW and FW errors.
>
> Aravind Iddamsetty (2):
>   drm/xe/ras: Log the GT hw errors.
>   drm/xe/ras: Count SOC and SGUNIT errors
>
> Himal Prasad Ghimiray (1):
>   drm/xe: Handle GRF/IC ECC error irq
>
>  drivers/gpu/drm/xe/regs/xe_regs.h    | 244 ++++++++

Please don't recreate i915_reg.h in xe. Please add separate regs files
like we've been doing in i915. It's pain to split a monster register
file later.

BR,
Jani.


>  drivers/gpu/drm/xe/xe_device.c       |   6 +
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_gt.c           |  30 +
>  drivers/gpu/drm/xe/xe_gt_types.h     | 105 ++++
>  drivers/gpu/drm/xe/xe_irq.c          | 824 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c          |   6 +
>  7 files changed, 1219 insertions(+)

-- 
Jani Nikula, Intel Open Source Graphics Center
