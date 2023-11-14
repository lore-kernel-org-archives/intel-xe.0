Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E19DC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 17:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249E010E49B;
	Tue, 14 Nov 2023 17:24:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53DC10E1D4;
 Tue, 14 Nov 2023 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699982696; x=1731518696;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IhJmPulxr/ycbBs+CqXg6pJzufI6ps1PzmIDiWD79MI=;
 b=GAI67ELStRPib7p/KS1Gh1jwVl8c75xxLJWfS+XtxxXWNblygFt8hh9l
 d3lmhS05IF5eOwLrPFHAblh95CpjRYjyxAV7LTYtWhFsNG1+RP86SiM6O
 nm0i+WVPHCcXbEjG39gZEDyeVylKGCA+WVK6KfTEdYtyUY+uWfyBd5LWW
 XRhuBOr1uKJDgSbPz26n9C7u9S5PlUsd0kC/dIM73gAxAn2+mRC8iSykw
 7Lj9Mb8bvO2Z8/OcnNpkaRbgECMpR1p6o5LmoQBYl8tzLkp5mhIU0eQFv
 Z8mMquU9uXghoFDVq4TiKImFGJoZXWLh173OhBeB+1z7baDup/WRkiT/O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381099051"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="381099051"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="741154705"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="741154705"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:24:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, "Saarinen, Jani" <jani.saarinen@intel.com>
In-Reply-To: <87jzqkp99j.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
 <ZVNUxZzCGcxQzqJX@intel.com> <87bkbwsebl.fsf@intel.com>
 <569f8832-25f1-45be-bb60-50f5a76d8e44@linux.intel.com>
 <DM8PR11MB5655518A6F21A2E4CA2E76D3E0B2A@DM8PR11MB5655.namprd11.prod.outlook.com>
 <87jzqkp99j.wl-tiwai@suse.de>
Date: Tue, 14 Nov 2023 19:24:51 +0200
Message-ID: <874jhos0ws.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move
 snd_hdac_i915_init to before probe_work.
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023, Takashi Iwai <tiwai@suse.de> wrote:
> (Also thought that drm-tip or whatever tree also drags the recent
> changes from sound.git tree for relevant part.)

We've dropped the sound branches from drm-tip, mostly because they were
repeatedly rebased on Linus' master (as opposed to tags) during the
merge window.


BR,
Jani.


-- 
Jani Nikula, Intel
