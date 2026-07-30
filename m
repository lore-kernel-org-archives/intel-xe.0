Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2956DC531D0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 05:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC3110E645;
	Thu, 30 Jul 2026 05:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOFoZWxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A4210E645
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 05:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785391159; x=1816927159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5nk2yKu7lILQsblPwFu5ummSHou6MZvLXc3s1PB/HlQ=;
 b=bOFoZWxrWuVsSVk0WrauNco6dcr4KuJzzufziRetsj1mu8be5O93KXpn
 3YsGBAlLCXF5s0r+u+vofgq5bP+zanl1WijTTip7KDyx/ospn1aK1tyNX
 o8P4VkJISDlTm7g77HXTaA9wOWRd2fjZ7iCoyRJ/9Dpg6VicSs2QtMHpN
 mzX4FDG6t6EPkTAEEAKidf77b7Vkv5vAL34mCrd1wCi4ae5z/dOXrlTD0
 ivRRfYS929cRHpczDr8P1we/4WhSZQaLBnJEZejIZL9z7MY41qsfpVhrS
 a/Q2VxLKd6FqY+w+aAJ9aeP/GdxT4qqDzrCBaSTBJOHDIGOcEO6twh7wg A==;
X-CSE-ConnectionGUID: j91nKeF/RCixv6L7CLSpCg==
X-CSE-MsgGUID: Gk8kCRIuSrakTObkUAJlLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96363898"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="96363898"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 22:59:18 -0700
X-CSE-ConnectionGUID: 1XhtGOscTfei0Z7UzrUf2A==
X-CSE-MsgGUID: 9BCBgXPgQUK5PHmgtCx71g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="262162980"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 22:59:16 -0700
Date: Thu, 30 Jul 2026 07:59:13 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Message-ID: <amroMZ8MF0PrF8dh@black.igk.intel.com>
References: <20260730053635.1515929-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730053635.1515929-2-nitin.r.gote@intel.com>
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

On Thu, Jul 30, 2026 at 11:06:36AM +0530, Nitin Gote wrote:
> After hot-unplug, device_del() disables runtime PM. A deferred fd close
> can still run later during process exit and destroy remaining exec queues,
> which may call xe_pm_runtime_get_noresume().

This sounds like could cause many other side effects. Why not make sure
the exec queues are taken care of as part of hot-unplug path?

Raag
