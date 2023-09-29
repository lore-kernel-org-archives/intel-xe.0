Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D01E7F154
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 11:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E1010E118;
	Fri, 29 Sep 2023 11:05:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2875110E118
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695985507; x=1727521507;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=EWz4OXmDGcU/jE9/BVHit9rfxgx9ZO+Z+1XyYgsullY=;
 b=Q69V6jLE8bQbGI2GQqs6POO1JYvW3W/AR1jgFvko5E/SJQPWP2lnScoX
 f0LhU1KEddbX7M+8Yuz3F0S8DDBEZ/jJe9PpsmihzC+tgh/z6xB9QBo50
 xf6aC/26ZdyU56RCPqvStS25/wS1qYIL1rnUSqJNnL3+ow2RVpY0Qu5Nw
 k7FA8+5ZKK6MKQuW01pSq0bgjYpGmwyFQ20E2YRPZEShwwzpof8GpLTgZ
 lCOlEtxg5hsp0KgAgbnObuE6pF+hgHzrSpg6ieUVEJv7cMQEMx4kz7Z/t
 jNYzckF/i5GWDquhSwYh3qzBIecxMtUvjuq0AJgg4gR9GKLZLrUVB8R62 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379547245"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="379547245"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="1080897567"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="1080897567"
Received: from osalyk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.237])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:05:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230929105030.1132290-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230929105030.1132290-1-jouni.hogander@intel.com>
Date: Fri, 29 Sep 2023 14:05:02 +0300
Message-ID: <87lecpi6jl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 0/2] Backport set frontbuffer return value
 check
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 29 Sep 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> This patch set is backporting set frontbuffer value check patch from
> upstream and reverting similar patch we have in drm-xe-next branch.

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Cc: Jani Nikula <jani.nikula@intel.com>
>
> Jouni H=C3=B6gander (2):
>   Revert "drm/i915: Ignore set frontbuffer return value on release"
>   drm/i915: Warn on if set frontbuffer return value is not NULL on
>     release
>
>  drivers/gpu/drm/i915/display/intel_frontbuffer.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

--=20
Jani Nikula, Intel
