Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2156AC3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 09:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB49010EA28;
	Fri, 16 May 2025 09:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JK7J8e11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1694A10EA28
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747389587; x=1778925587;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=p8dDQArQolCL5ZIhRBTmvbrxtem/saw/ATHcm/Y4L2A=;
 b=JK7J8e11hTThTdddLH+aYLIIO99R5gbrzt1RkDHKOSKRaIZ78KsuuUHe
 T8G6fy5KLapm1dNXIxfFTl6kotatdMLJcUdQQYJfjv3V0ooO0fOJM75LD
 0r+3ISr8Xbluhm9DywPCMfAxqptfjxhwf/i9nn4px0hXkegNJbOsmSrtC
 HZXBzRdk6VnijjFTZZyOFzrec/j7hjITQtXHJSvUG4dI/s6JoaEn2JC1h
 JC61B5D/AIMUiE+ZB34RyWcsqFTSUwLNlYGsstDvhgBFudESo28cVX/JI
 bSptSUgvYidXyB3PDnLBIzbMdyhur88ebv4i0X/ZCvorXJzqCnSBtiVrA Q==;
X-CSE-ConnectionGUID: jenKomaATJeFN5aeh2XW8w==
X-CSE-MsgGUID: cGhqjOWGQ+6lZY/etzrRsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66906342"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="66906342"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 02:59:47 -0700
X-CSE-ConnectionGUID: x460jHuqSRORFo4QllwxNw==
X-CSE-MsgGUID: CZ59QiNXTOGCyj+OFH8BGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="169583794"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.176])
 ([10.245.245.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 02:59:46 -0700
Message-ID: <f005f4ce-1371-48c6-98ff-1668dc264b1f@intel.com>
Date: Fri, 16 May 2025 10:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: drop duplicate display->fb_tracking.lock
 init
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
References: <20250516095514.398320-1-jani.nikula@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250516095514.398320-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 16/05/2025 10:55, Jani Nikula wrote:
> The spinlock is initialized in intel_display_driver_early_probe(). Drop
> the extra init.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

