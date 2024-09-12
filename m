Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8943EEB56F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 09:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7545710EB26;
	Thu, 12 Sep 2024 09:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIZ1HD79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF00E10EB1F
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Sep 2024 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726132615; x=1757668615;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3L3jmutoiYZ7szm+HANjhoT5BdCu8eQ3O2YMEHak83E=;
 b=fIZ1HD79akxG2LOJVAUV3PrEjNYU5gKX11492sIIqD7y1aajuVHAWu3q
 tCdJzzU0xJJ5w4uoda/0AJgygs2EQCj9i3vlNXBxm5gAUWLoh068x83oq
 7yBC7+kQa4JvkpBQOzYLD2Gx4R/Pr8DOilK1951qxOCMaA6kBeovLiQyJ
 cfKvdwbqjDTs4HfXRvNZlFqGOQujCEtCkauU/5EqTYOeAfu2EXK3DBgdL
 i9oXPoI+KPzgx10/u2YxHpJVt+wUtWAZxBQZA1+gtkRhoh5a8IMc2FWIU
 QXqLuQznxk8decp4LNCaRgX7+uXDC7Ue0c/nBE2C9y1tJH5wULId8Fykd A==;
X-CSE-ConnectionGUID: XHryLkYUQSOvvFbPjNw4zA==
X-CSE-MsgGUID: su4cLOYlRkySSJk/AcHiVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28750622"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="28750622"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 02:16:54 -0700
X-CSE-ConnectionGUID: bKzaGIWNTzCODopUYW7Qkg==
X-CSE-MsgGUID: /hapHk0uT6Kh6+CXXbX8KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="68429015"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.253])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 02:16:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: Re: [PATCH v7 00/10] drm/xe/guc: Improve GuC log dumping and add to
 devcoredump
In-Reply-To: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
Date: Thu, 12 Sep 2024 12:16:49 +0300
Message-ID: <877cbhi64e.fsf@intel.com>
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

On Thu, 05 Sep 2024, John.C.Harrison@Intel.com wrote:
> Michal Wajdeczko (1):
>   drm/print: Introduce drm_line_printer

Given the discussion around other parts, it might be prudent to just
upstream this separately via drm-misc.

BR,
Jani.


-- 
Jani Nikula, Intel
