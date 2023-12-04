Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15F4C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 10:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7062110E31D;
	Mon,  4 Dec 2023 10:18:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2B10E323
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701685096; x=1733221096;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bY1PNrj4UgzOXJHkhEItAJabHOL/s4SGi6ZAqf81xI4=;
 b=LMPIaK/9izmuaUzByLwMsA6cIJ2eCIx5IPRO11iz/vjYnJHgG/BeLblx
 sp2ExROEJ0F6SAHmcF9H9KswEr0/BQGLucn3nCk4ocwWZD2N+2T7yGy2k
 fQ1eeS1ZpX8gKZSTmmJtTyBYnlRw9Uz30plfJ5FKd0jCtJYcGzr3G6/uk
 GxBBAJpY9IBq62vzwMa9pBICS/AnBj4hMq4rxgzwSmW3UQ0Ay42PK9CJI
 2P0TnhOeVviSd/6TVn0DqA4nzYjx70JLk+gcXoJFWi4/GeAJ70lcfb7EJ
 sGToncYB9EEtAYnGl2Ll88PRtE30ltC7pTPnNofG+WZEjyNgUwyw2tebR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="390871416"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="390871416"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 02:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861330594"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="861330594"
Received: from shahmoha-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.180])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 02:18:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231204064932.869215-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231204064932.869215-1-jouni.hogander@intel.com>
Date: Mon, 04 Dec 2023 12:18:11 +0200
Message-ID: <87o7f62rvg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2 0/9] Intel_fb.c refactoring
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 04 Dec 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> This patch set is refactoring intel_fb.c code to get rid of
> ifdefs. This is done by splitting i915 and Xe specific parts from
> intel_fb.c into their own source files.
>
> Some ifdefs are tackled by adding definitions into Xe compatibility
> headers.

Acked-by: Jani Nikula <jani.nikula@intel.com>




>
> v2: i915 changes are now backported
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
>
> Jouni H=C3=B6gander (9):
>   Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe
>     changes"
>   fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
>   drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
>   drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
>   drm/i915/display: Handle invalid fb_modifier in
>     intel_fb_modifier_to_tiling
>   drm/i915/display: Split i915 specific code away from intel_fb.c
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_fb.c       | 219 ++++--------------
>  drivers/gpu/drm/i915/display/intel_fb.h       |   2 +
>  drivers/gpu/drm/i915/display/intel_fb_bo.c    |  92 ++++++++
>  drivers/gpu/drm/i915/display/intel_fb_bo.h    |  24 ++
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  .../compat-i915-headers/gem/i915_gem_object.h |  16 ++
>  .../gem/i915_gem_object_frontbuffer.h         |  21 +-
>  drivers/gpu/drm/xe/display/intel_fb_bo.c      |  62 +++++
>  drivers/gpu/drm/xe/display/intel_fb_bo.h      |  23 ++
>  10 files changed, 288 insertions(+), 173 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.h
>  create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
>  create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h

--=20
Jani Nikula, Intel
