Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48645D262AD
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 23:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0332510E66A;
	Tue, 20 Jan 2026 23:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSK+TPGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9E310E669;
 Tue, 20 Jan 2026 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768950247; x=1800486247;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=xfOAHI/TGNZi6ffuWcDBArFWSRli6KJ1IL9YJx+4dms=;
 b=nSK+TPGh6tO84TGJvLwcRHg451upjmhbx4Npiju0UWJkxLfuwvQGFW9I
 ZTJ54KUNh9GAf0RoOwyhhL9/W0lKTebAS6pbFvZfX/CxyiThOQsWXer7q
 fgCX9w1II2YSYkc8NpZ49Iw5FuXg4qZai4pXMp/uycOQWeYHfN1EaI48+
 w/xLdsSrviETw+Y/xi/RhrhgOJSEWmvTmJwLlwqPkfBYk9pSGxwRxpwsq
 JY11EPIm6iq/Xo6sFHF3yQqrVGqsmrVuEF5OTavRSL92yzyCEfpkox4Bt
 BEVBJCxIQ9TM0znwfvMivUKu2+dBz5uDgbzWs5FoCkPcuGQ7HIRbMtRw9 Q==;
X-CSE-ConnectionGUID: 5AepnhreTUeplV0JdzD+5A==
X-CSE-MsgGUID: peECODpVRlSKTPqJeketKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70082541"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70082541"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:04:06 -0800
X-CSE-ConnectionGUID: 2jOLw/vmSh2HcYpi8+ETWQ==
X-CSE-MsgGUID: NEav9xK2SP6V9563FWVvrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205388581"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:04:05 -0800
Date: Wed, 21 Jan 2026 00:04:03 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/{i915, xe}/dsb: move DSB buffer to parent
 interface
In-Reply-To: <df117c862a6d34dae340e4a85c2482b4e29c8884.1768923917.git.jani.nikula@intel.com>
Message-ID: <fa3f1073-b24c-9b2f-85a9-fd0aba801069@intel.com>
References: <cover.1768923917.git.jani.nikula@intel.com>
 <df117c862a6d34dae340e4a85c2482b4e29c8884.1768923917.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-1954757119-1768925435=:3959841"
Content-ID: <de78c688-88a1-f5bd-9b89-4f4bce201c63@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1954757119-1768925435=:3959841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <227e5ac4-3a4d-6624-b7e0-122e1712d2f5@intel.com>

On Tue, 20 Jan 2026, Jani Nikula wrote:
> Move the DSB buffer handling to the display parent interface, making
> display more independent of i915 and xe driver implementations.
>
> Since the DSB parent interface is only called from intel_dsb.c, add the
> wrappers there with smaller visibility instead of the usual
> intel_parent.[ch], and using struct intel_dsb as the context parameter
> for convenience.
>
> Unfortunately, memset() being a macro in linux/fortify-string.h, we
> can't use that as the function pointer name. dsb->memset() would be
> using the macro and leading to build failures. Therefore, use .fill()
> for the memset() functionality.
>
> v2: s/memset/fill/
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1954757119-1768925435=:3959841--
