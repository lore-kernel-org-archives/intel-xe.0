Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4C7C41513
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 09:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC5D10E5E8;
	Thu, 23 May 2024 09:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUNopUrj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FF210E39A;
 Thu, 23 May 2024 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716457541; x=1747993541;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v5aWB1SDw8pt6mzIkhaWOP4fPOr26k+12SpPNmMJE+Q=;
 b=dUNopUrj4Y879sAPlaAdIhCjaps8jSkqpGMQV8lvUmyBfzqTLczhrv0W
 CU+/0GkEkCdlQB9p/s7Y4QIjD25eHtE+FKQfTwIl83W/Po1wAczIDusft
 2QGavyfxEstZf4rNJs8/S9at/gGeLfJNj42J5XbQi/jXlF48TJLl7FfCh
 OE6kNsbZt/KNwMT2ivFzXPrWjdXqaGvcHEvxpnD+JaJaNs9yuSy1zatlp
 tBkHDFwD37bu+5+IfmvfUn/kVkiSgscEe4BaGBEoqu3QUt894wokKItHB
 +3GXbm9dUgLJVTuYiZjzSyycvOaoiZhYTFacwOQB8+Z00iHFQMP9zv1Hq g==;
X-CSE-ConnectionGUID: wL9kA9XdQpuuFVijezGt5A==
X-CSE-MsgGUID: UpwOCLfhQrGohFx62gRucg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="15711124"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="15711124"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 02:45:41 -0700
X-CSE-ConnectionGUID: qk84aH2ISr6fN9MnRVZqrQ==
X-CSE-MsgGUID: czMGrZQ6RU65DX/KhJKzbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34073542"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 02:45:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: XE tests on Tiger Lake
In-Reply-To: <20240522141822.bJcQDijH@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240522141822.bJcQDijH@linutronix.de>
Date: Thu, 23 May 2024 12:45:34 +0300
Message-ID: <87bk4wq2td.fsf@intel.com>
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

On Wed, 22 May 2024, Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> Hi,
>
> I've been testing v6.9 with the XE driver on a
> |  00:02.0 VGA compatible controller: Intel Corporation TigerLake-LP GT2 [Iris Xe Graphics] (rev 01)
> (8086:9a49) 11th Gen Intel(R) Core(TM) i7-1165G7 platform.

Thanks for testing! I suggest filing an issue at [1], attaching dmesg
from boot with drm.debug=14 module parameter set.

Cc: xe driver maintainers.


BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/


-- 
Jani Nikula, Intel
