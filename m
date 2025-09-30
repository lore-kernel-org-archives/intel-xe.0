Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC05CCA468
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 11:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7944F10E59E;
	Tue, 30 Sep 2025 11:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWXqMCg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B6D10E59E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759232632; x=1790768632;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LDxLabYaQd8waFAqQrO8u6qzmBwdvO780dViilzQABQ=;
 b=UWXqMCg/P56GExFJyJ4eZKrSSNKaaojw68+marhAh+SFOYe/yQ1OlgHM
 3XyqXjUF3mRWm1DSQqXmBiOHGFtcse38F9VeAg6YNMACsf6Tpf+rmhzZJ
 yBj6p/545QZSUEHJ/SbhA/u3oRQk48/1iMWiDXlWNpNTefe1d6ENIdj1C
 /IDeS+cI/bh5C78DPCXA8CpFkbAcylTsAcSn6EuPKwt0dm7SP0UL8rd77
 FszMZinsXRfDPfbdWsErD9MS8sIrrPSr2wivO4JlKT2aNYLR2QJqpTEBY
 hpcpwIMHfICIugva+gAXRvsFC2IxdmZXtaSGl+0A6sQx0Zd6NfXnggGRl A==;
X-CSE-ConnectionGUID: BEaGI6vPShm7DHAkxN0UZw==
X-CSE-MsgGUID: vh3blEopT12b5EYmXDrUsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61594456"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61594456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:43:52 -0700
X-CSE-ConnectionGUID: B+FIZXG5Qn+T+TW9kfBVXA==
X-CSE-MsgGUID: 8lrmIpnNTpadaoNCtuDegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="209214065"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:43:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/debugfs: Update xe_gt_topology_dump signature
In-Reply-To: <cf3dcf02-e213-4339-b356-efa8056f84bb@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-2-michal.wajdeczko@intel.com>
 <275ae979fdbefb5e6f4fbc00bf183eb0b7d336c1@intel.com>
 <cf3dcf02-e213-4339-b356-efa8056f84bb@intel.com>
Date: Tue, 30 Sep 2025 14:43:47 +0300
Message-ID: <1bdb6f5ad557a144f402c106d80a319248028bbe@intel.com>
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

On Tue, 30 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 9/30/2025 10:45 AM, Jani Nikula wrote:
>> On Tue, 23 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>>> +/**
>>> + * xe_gt_topology_dump() - Dump GT topology into a drm printer.
>>> + * @gt: the &xe_gt
>>> + * @p: the &drm_printer
>>> + *
>>> + * Return: always 0.
>>> + */
>>> +int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>> 
>> What benefit do the formatted kernel-doc give us? IMO it's just
>> boilerplate with pretty much everything being obvious from the function
>> name and parameters. And the functions aren't significant enough to be
>> made part of the Sphinx build either.
>
> I'm just following the (unwritten?) rule that in Xe we should document
> all public functions, and while in some cases such kernel-doc does not
> bring anything new, also like in [1], IMO it's still better than no
> documentation at all, as sometimes, like [2], function name isn't
> telling you the whole thing

I'm not arguing against documentation. I'm arguing against excessive use
of kernel-doc formatting for functions that will never be part of the
Sphinx documentation build.

/**
 * xe_gt_topology_dump() - Dump GT topology into a drm printer.
 * @gt: the &xe_gt
 * @p: the &drm_printer
 *
 * Return: always 0.
 */

vs.

/* Dump GT topology into a drm printer. Always returns 0. */

For non-EXPORT_SYMBOL() driver internal stuff, in most cases the
parameter descriptions are self-evident, and repeating the function name
is just, well, repeating. The formatting doesn't buy us anything, it
just brings overhead and extra maintenance, because the format will be
checked.

For EXPORT_SYMBOL() and the more important functions, or generally
things you might want to include in the Sphinx build, or anything that
might benefit from the formatting for readability, sure, use
kernel-doc. Otherwise, I wouldn't bother.

Anyway, I'd solicit feedback from the xe maintainers, and go with that.


BR,
Jani.


>
> [1] https://elixir.bootlin.com/linux/v6.17-rc3/source/drivers/gpu/drm/xe/xe_bo.h#L239
> [2] https://elixir.bootlin.com/linux/v6.17-rc3/source/drivers/gpu/drm/xe/xe_gt_throttle.c#L241
>
>> 
>> BR,
>> Jani.
>> 
>> 
>

-- 
Jani Nikula, Intel
