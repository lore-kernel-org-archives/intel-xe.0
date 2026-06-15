Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8FDCD98CF
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE98510E5C8;
	Mon, 15 Jun 2026 18:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9BXk2qX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9D110E5C7;
 Mon, 15 Jun 2026 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781548502; x=1813084502;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=tIqShrw2AkycU/sBpl7flrPkPK1aeu0qDk1kf7bzwmA=;
 b=L9BXk2qXMmhLSeLe5l/4/N1IiBt6aSV06nKNSPY+EwmZBZyb/py5Djis
 BdcVcdSuJbi1QeitHl7GvdoYWKi8fC6O8nVNR2Rva47MrQH6JzFPI9fke
 0Quj4MV7QmfBZvc/7eRiLhzJ+Q5er1AQlkstBof2Bg709oPBjZVFtEX1s
 Qrm1oOAExIXwjYaVxntRFE4pG0Co9ABjmPNSnId7bHt4+2BtbW2hN2Lyh
 tG+Ce08MSrNbrqxDgMaI2L+EumZJUd2Lxs9t5GSAkJcREgIL809/624aj
 PwsWaRRmir+8tndL2qygRTP1YsJuapt+0GsI9ANPStIC4zj910eA0kjdZ w==;
X-CSE-ConnectionGUID: 6vBEIikcQc68UTz4HBQnDA==
X-CSE-MsgGUID: uncW8eMyQcCXHHt8GS99Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="104970331"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="104970331"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:35:02 -0700
X-CSE-ConnectionGUID: YXNJd21GTBqg5tx1zV9SPA==
X-CSE-MsgGUID: cFRSDmr9SCK2/n4gdasV6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246650222"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:35:01 -0700
Date: Mon, 15 Jun 2026 20:34:59 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/intel: drop driver include from mchbar_regs.h
In-Reply-To: <20260615152837.1898991-1-jani.nikula@intel.com>
Message-ID: <4c103455-61fe-eaa7-b5d0-72414ae4995e@intel.com>
References: <20260615152837.1898991-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-542677916-1781548501=:605841"
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

--8323329-542677916-1781548501=:605841
Content-Type: text/plain; format=flowed; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Jani Nikula wrote:
> Headers under include/ aren't supposed to try to include headers from
> driver directories, such as i915_reg_defs.h. Remove it.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-542677916-1781548501=:605841--
