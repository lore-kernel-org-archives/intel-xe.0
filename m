Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E261C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D1B10EFED;
	Thu, 27 Aug 2026 12:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hq59AwYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D99910EFED;
 Thu, 27 Aug 2026 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834199; x=1819370199;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oDS2QjN9hWxZn7rKosqeUtDU7i5zvkrOkBuyX09xqqo=;
 b=Hq59AwYRKsdzhlpWfcMM5lUwG/jmcrsxeDBihoPhA/cQYDkfs0XSO6Om
 mnMWFdUSOjrBBX7bcOBWwj5QoDyGv/3P/2slHPAW+m9fCUQrFOPnV9Cit
 veKJJUCFoVQN51dJ/k/9Z2x1jKPyJOa4LM2SuvQIEulCTNHJ28gSPoeIL
 s/IqeO+0pTgHEMn/NlYF5gZM86bTA2AUJuILKRDWkrQR77AxKr6PIqsWS
 nkd5smZUdVmCRDYAxr17FWPxa2woi46rfzsW6bmFsx3GxL9Gwmt5t0Iad
 CTaLpBMoSn9q0WNd7Fy8vBt/yQ4JJSS/cTyYtNr/fsFe7stUfsDvcgQER g==;
X-CSE-ConnectionGUID: 6uuckyRFRHidV6hGG6vOSg==
X-CSE-MsgGUID: dDoJZ4N4S6CImGn2n55dLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99849846"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99849846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:36:39 -0700
X-CSE-ConnectionGUID: QkZNlqDqSGismowkqzYOTQ==
X-CSE-MsgGUID: S4EgbDBSSYie0ULF8RI9rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="267902599"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:36:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 4/4] drm/i915/display: use fixed 10 second timeout for
 fence wait
In-Reply-To: <859cb981-4039-4f0e-801f-c9f8cd630ded@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1787148235.git.jani.nikula@intel.com>
 <f61a3a828b0c0159d63d132f8f557a546a6f9ced.1787148235.git.jani.nikula@intel.com>
 <859cb981-4039-4f0e-801f-c9f8cd630ded@intel.com>
Date: Thu, 27 Aug 2026 15:36:34 +0300
Message-ID: <d6d85707e57f06d7980bd46a7e36c26a25450ddf@intel.com>
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

On Fri, 21 Aug 2026, Maarten Lankhorst <maarten.lankhorst@intel.com> wrote:
> Not waiting on fences until they're signaled is an existing issue in
> i915, and was added as a workaround for a deadlock when GPU reset has
> to reset display as well on old platforms. This requires a modeset to
> disable everything, which may hang since it could wait on a fence that
> may only be signaled after gpu reset completes.

Thanks, I've used this verbatim in my v2 commit message. ;)

> Can you test if gpu_reset_clobbers_display and
> force_reset_modeset_test are set, and if not set the timeout to
> infinity on i915 as well?

v2 at [2], fingers crossed.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1787833879.git.jani.nikula@intel.com



-- 
Jani Nikula, Intel
