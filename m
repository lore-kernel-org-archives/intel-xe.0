Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A07CAC5B9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 08:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D91E10E135;
	Tue, 30 Sep 2025 08:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfaKUZor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F50A10E522
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759221918; x=1790757918;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W0f1xZLg3xjy16reQS4aMXxo+A2WAL4UcIOAV7KLM3A=;
 b=KfaKUZordyQ1oETPWdGM/Sjoo8MPMdpZTKI4pZ3OjNcRbwCtkZYKWDv3
 2+VfiKZ3wwHDah3W1xu3tapxqieue49EE3imLxFNMiJR6jaRUkg2E/Jr3
 gMOSNZoGZ5/kD59P3ro4qCy1JjBND49OcrPi88iPlv+DqHOrk7X4FbTvS
 AxTUe4FAseBgyQGD2eojL8fCEi7IbPmiE91kKBp/QVcqjatsOeeTejwQv
 vLFKdWwCxm65dyL2R0IGtL5DPjcKwzDUfs6d79azF+sNS4EzAq76D5DnQ
 yX5jbJCgRNqG5K4duFOTfXLk4kyoPuNz1QC/elnBbfRKq3LehLldDr/HL w==;
X-CSE-ConnectionGUID: xB9+G2vOQmO/y3WqQwhLlg==
X-CSE-MsgGUID: CXmnQasyRBSPD77IsqimVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71719241"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="71719241"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:45:17 -0700
X-CSE-ConnectionGUID: kGKyASCHQ2mCbaOPhg01gA==
X-CSE-MsgGUID: wk5aPxaTSzSVc0RKIw7V2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="179237177"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:45:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/debugfs: Update xe_gt_topology_dump signature
In-Reply-To: <20250923211613.193347-2-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-2-michal.wajdeczko@intel.com>
Date: Tue, 30 Sep 2025 11:45:11 +0300
Message-ID: <275ae979fdbefb5e6f4fbc00bf183eb0b7d336c1@intel.com>
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

On Tue, 23 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> +/**
> + * xe_gt_topology_dump() - Dump GT topology into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: always 0.
> + */
> +int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)

What benefit do the formatted kernel-doc give us? IMO it's just
boilerplate with pretty much everything being obvious from the function
name and parameters. And the functions aren't significant enough to be
made part of the Sphinx build either.

BR,
Jani.


-- 
Jani Nikula, Intel
