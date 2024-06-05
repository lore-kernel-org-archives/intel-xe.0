Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B75C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 07:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF6910E6ED;
	Wed,  5 Jun 2024 07:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mF6w4+D/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B309510E092
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717573436; x=1749109436;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EV1Cy/O7dnj+u+PepeBzeAucyWgBo+ZGZRsmAJCcog4=;
 b=mF6w4+D/xVMP+AGLcP+iKrFxFDfW+4Fx55SRG1dZ5nAyFhKNDBfRW3Xm
 8djMeIbFxIXzODrzISHJcyFkVx0rJziWUE4ptr+jB6qJIzDIUGAhrTUU6
 7peC85nNn7lrt8DbBds8C5x4RQhMwvec1yQkPC6QEuWUx4YY5/NQfmBpl
 cWE9Rotd71siH4GkegckPoVNcReaAGoHPRf0MgZGU6CcRmjH1PmaORi5G
 PEfKtCBbpbB70eJ4BNB/dPCeezFtnM/T7nygiNubqUb9HENhddwzY/jph
 MBJBGF1vzQOnRtmBAgxnxzqOtjA9cn4isoZOAqle1W0XzHYzYfrFQ3yvc w==;
X-CSE-ConnectionGUID: 8VGlG3EpRF219fTDRDpBtQ==
X-CSE-MsgGUID: jRy20tzgSAeq+fMEkOcSUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17985011"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="17985011"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:43:55 -0700
X-CSE-ConnectionGUID: 6ryq5/TyRuybL5R0N4p1Mw==
X-CSE-MsgGUID: OP4LJiPATuuEvtXuxggOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37390541"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:43:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org, gregory.f.germano@intel.com, Vitasta
 Wattal <vitasta.wattal@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Add PCI IDs
In-Reply-To: <t3iomfnitxsag5zzgphoo2bdw2zqnfjrb65ql7dd23dsgaqlny@grzcncimpr3w>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240603145430.1260817-1-balasubramani.vivekanandan@intel.com>
 <87mso1cexk.fsf@intel.com>
 <t3iomfnitxsag5zzgphoo2bdw2zqnfjrb65ql7dd23dsgaqlny@grzcncimpr3w>
Date: Wed, 05 Jun 2024 10:43:47 +0300
Message-ID: <878qzjdebw.fsf@intel.com>
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

On Tue, 04 Jun 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Jun 04, 2024 at 11:03:51AM GMT, Jani Nikula wrote:
>>On Mon, 03 Jun 2024, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
>>> From: Matt Roper <matthew.d.roper@intel.com>
>>>
>>> Add the initial set of device IDs for Battlemage.
>>>
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>
>>Please note that since commit 54836ee194f9 ("drm/i915/display: change
>>display probe to identify GMD ID based platforms") you'll also need to
>>add the PCI IDs to i915_pciids.h and add the platform desc in
>>i915/display/intel_display_device.c for display probe.
>
> that was not the plan when we started xe_pciids.h. Now that display side
> will use pci id to find a static desc, I think there's no point in
> keeping the headers separate. Should we unify them?

Plans changed... and I agree we should unify. Though I don't think
there's any rush. The hard part was done when I switched i915 to the
same type of macros as xe uses. But do we want to have a single
include/drm/intel/pciids.h or split by some criteria?

BR,
Jani.


-- 
Jani Nikula, Intel
