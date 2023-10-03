Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8268AE75458
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D2D10E04E;
	Tue,  3 Oct 2023 12:41:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A17710E04E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696336864; x=1727872864;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=dJWCUyncaaUq/azhsBl/+WK+qxklstOwfE4ijCllLNY=;
 b=SqXP97zrYs/9+yZ7mQLImt/gg0uQiL9ANQtrIuZBn8OqXzvDb9fobuBK
 18kC57deKee0HjZp4rOuz8zEh2qFU5z4uvlaxnG2OeBDo+Se0h+RG6AeQ
 LWN9ecKRhstD+xDq1Zs7yPpd1p/2BgZej88Wp1f/QB7yCcUz31nsN+PwS
 2IYmfxzVwdR1aDRS7oT3LZpfhHjdem09inF9IT3xTFABTIz1S1LsMMKdI
 z8SMU1+ma/Ic8NPKLcK8JWeEmOJz5+9e305nuGMgoZXaLkFA406HfdV1u
 pZKkAt1H6SjhrS+VbOsw4J0bfqoOvcQBNGjLRDcewo335uuJepryeWWGK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="380140241"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="380140241"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="894456353"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="894456353"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:39:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
Date: Tue, 03 Oct 2023 15:40:59 +0300
Message-ID: <87wmw3g9pg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 00/14] Update sound patches to upstreamable
 versions.
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

On Tue, 03 Oct 2023, maarten.lankhorst@linux.intel.com wrote:
> From: Maarten Lankhorst <dev@lankhorst.se>
>
> The versions inside xe are old, and I've made several iterations since.
> Posting as series on the mailing list so we get CI results before
> merging it.

What changed since the version posted yesterday?

I was hoping to get the patches annotated to contain upstream commit ids
or links to patches posted upstream.

We can't expect these to be upstreamed as part of xe upstreaming. It's
just too much at once. I think these would need to be upstreamed first.


BR,
Jani.


>
> Maarten Lankhorst (12):
>   Revert "sound/soc/sof: Remove deferred probe for SOF"
>   Revert "sound/hda: Allow XE as i915 replacement for sound"
>   ASoC/SOF/core: Ensure sof_ops_free() is still called when probe never
>     ran.
>   ALSA: hda/intel: Fix error handling in azx_probe()
>   ALSA: hda/i915: Allow override of gpu binding.
>   ALSA: hda/i915: Add an allow_modprobe argument to snd_hdac_i915_init
>   ALSA: hda/i915: Allow xe as match for i915_component_master_match
>   ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
>   ALSA: hda/intel: Move snd_hdac_i915_init to before probe_work.
>   ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
>   ASoC: SOF: Intel: Move binding to display driver outside of deferred
>     probe
>   ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init
>
> Pierre-Louis Bossart (2):
>   ASoC: SOF: core: Add probe_early and remove_late callbacks
>   ASoC: SOF: Intel: hda: start splitting the probe
>
>  sound/hda/hdac_i915.c                | 19 +++++++--
>  sound/pci/hda/hda_intel.c            | 64 +++++++++++++---------------
>  sound/soc/intel/avs/core.c           |  4 +-
>  sound/soc/intel/skylake/skl.c        | 31 ++++----------
>  sound/soc/sof/Kconfig                | 19 +++++++++
>  sound/soc/sof/core.c                 | 53 ++++++++++++++++++++++-
>  sound/soc/sof/intel/hda-common-ops.c |  2 +
>  sound/soc/sof/intel/hda.c            | 60 +++++++++++++-------------
>  sound/soc/sof/intel/hda.h            |  2 +
>  sound/soc/sof/ops.h                  | 16 +++++++
>  sound/soc/sof/sof-pci-dev.c          |  3 +-
>  sound/soc/sof/sof-priv.h             |  7 +++
>  12 files changed, 186 insertions(+), 94 deletions(-)

-- 
Jani Nikula, Intel
