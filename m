Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A07CA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 12:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2742910F556;
	Wed,  7 Oct 2026 12:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8DGhKcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21BA10F548;
 Wed,  7 Oct 2026 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791375600; x=1822911600;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TIjuGHnOsnKe6YpSsBEWlIGYqh6gr8uigH+aonS911c=;
 b=e8DGhKcf+M3ZM4ALCK3qgS+4SwlaKdxmj8LAtsavzLtn7NilLk72jG4j
 c0mvfUbo4p7B865eUIEDSqt7IQGfDnbtzVt9NLNPzrvEov7gSyktQIl+u
 RG0rwg2KH/NVi4l0c4WW7Ux543BMllJ5Lya3BI+I1+yWh0Sijc408kQak
 FZBoHMdMg6myXB94ZlawayjSNrMWQfHMWnWbFpKZw3zZryz7+X9NmrepQ
 pXdXYED/YPrmIAXtjUVN1vBX1hmmDvjPzxYLOQiMvFAoKf4NSUo81DtZX
 g5CnI1eW1e/ABWPsmEpDqIeWNZ5XjZjG1JSkikB8SSlh6IMJqif3iNm0J A==;
X-CSE-ConnectionGUID: P8ww+WkrROS+3G+U/7ctIg==
X-CSE-MsgGUID: e7CKPQBCQv2gCl1epunXkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="17720"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="17720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 05:19:59 -0700
X-CSE-ConnectionGUID: MQ4HoILCTS+wUn9TlOlSlA==
X-CSE-MsgGUID: 0EeyA1NJSPCCdPnkJe6XsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="303726666"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.231])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 05:19:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Eason <1836949523@qq.com>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [BUG] drm/xe: WARNING in intel_bios_init(): "Port A asks to use
 VBT vswing/preemph tables" on Panther Lake [8086:b081]
In-Reply-To: <tencent_F0B7A92DA405622129C8AC48F3CF490B9B07@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <tencent_F0B7A92DA405622129C8AC48F3CF490B9B07@qq.com>
Date: Wed, 07 Oct 2026 15:19:55 +0300
Message-ID: <721437b18fe84aef08d5d13782e4da1be5ee7c66@intel.com>
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

On Wed, 07 Oct 2026, Eason <1836949523@qq.com> wrote:
> I would like to report a WARNING that appears on every boot on a Panther
> Lake laptop, and that is also visible on screen (before the desktop comes
> up) when resuming from hibernation.

Please file a bug as described at [1]. Please include the VBT.

Thanks,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html



-- 
Jani Nikula, Intel
