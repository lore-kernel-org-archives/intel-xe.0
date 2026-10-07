Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F37CA5FF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 12:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA06810F548;
	Wed,  7 Oct 2026 12:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlfUPS2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62B610F548;
 Wed,  7 Oct 2026 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791375557; x=1822911557;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/py5O80Tvl0nKRH9feW+iyRbpk5dznORVWL8g21spp4=;
 b=TlfUPS2hePqjaotfm7Re8IyOL3AZ+p/8yWN3K2irisiiNwnCBLfRS56S
 kkuLXx9e15FoPu5sd6LXUfByFirMDZDXk/nWkQ7JLFoDdWXNXfliamieO
 Xv4MVryky1hHP0F2yCG6ZcYqOF0kAhwXqoeMwuQTAZxMWXYWYaUrIo4Gf
 iu4nEXiZfM0NzdDzZ2tyUOfBP/I0jdHIwQZzQoSt8OvoFF3EtkXDXEObq
 Jw7HoitWgptQ43TuHafX7IP7YNLT2Ica9OAyk4wlFx2qjENXrLzUu5/1j
 LsverdNcqanwKK2xFAMZs+w+k/etUjpjd+ZFdYdXhu0lmj/50FmgSMOyZ Q==;
X-CSE-ConnectionGUID: P3FbZOl3THu83+/5h8ZKow==
X-CSE-MsgGUID: FKDGRuCUQXSwnB11kiJPXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="30225"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="30225"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 05:19:17 -0700
X-CSE-ConnectionGUID: MQMbrqYITpKZVTMZRKjr0Q==
X-CSE-MsgGUID: +qpxkkZITCKANeEfcE6RVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="306914645"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.231])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 05:19:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jame Jao <jaojame6@gmail.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support, Xiaomi Book Pro 14 2026
In-Reply-To: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
Date: Wed, 07 Oct 2026 15:19:13 +0300
Message-ID: <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
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

On Wed, 07 Oct 2026, Jame Jao <jaojame6@gmail.com> wrote:
> I would like to report a WARNING that appears on every boot on a Panther
> Lake laptop, and that is also visible on screen (before the desktop comes
> up) when resuming from hibernation.

Please file a bug as described at [1]. Please include the VBT.

Thanks,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

-- 
Jani Nikula, Intel
