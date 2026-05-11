Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302A6CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 15:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AA310E1D4;
	Mon, 11 May 2026 15:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxg7ndTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB5B10E1D4
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 15:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778514387; x=1810050387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kB89qdXOyZLuTbG6QgzINZW54APg6GSemzWZ4Yl4oTQ=;
 b=cxg7ndTwNrqGlWXlTTCYH25Q5l0G+DXwNk4Tdqjosr1Oax15y1XD80ds
 d0W1gV9e+g9eJYxv1MQTUtKH5Z3FhdTRY/UwUREz1IYLS78XD+4PCBRJj
 eirC6V6QBe08kJLrL0R1rDr6c/q/q+m8q4j4TfrlSCbcwk9p4rvmM4cb0
 W53WwXH+0TFdDPYxLLR035GXulVF2Rnmz83nGrsDK4Ne+XOIP8HZuGGLV
 LoY6okUq8NyX66LNKmzJrZNt7v2wtgMs9VtC0dr4x8WHejo99ZZnm5QUk
 QCdLlvND9oRiwTs6kVvIsoQGuTzGXadTV2XhAXuMaxB4/sV3VXSTxHE+h A==;
X-CSE-ConnectionGUID: Zw2YpNdxRV6MoAJNCh6aNA==
X-CSE-MsgGUID: 0IjVxBlfRJiPmuXauEuNvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="102067667"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="102067667"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:46:27 -0700
X-CSE-ConnectionGUID: x1oClgffRMGzoC/YJYkQNg==
X-CSE-MsgGUID: no4WJUhGSwybL0Pr3uxQpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="236513812"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:46:25 -0700
Date: Mon, 11 May 2026 17:46:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v5 6/6] drm/xe/xe_ras: Control xe drm_ras registration
 with a flag
Message-ID: <agH5zTCLhIaJTTsp@black.igk.intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-14-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504065614.3832331-14-riana.tauro@intel.com>
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

On Mon, May 04, 2026 at 12:26:21PM +0530, Riana Tauro wrote:
> Add a flag to control xe drm_ras registration.

Technically we don't control anything, it's just a matter of preference :D

But nit: "Add drm_ras feature flag."

> Enable this flag for PVC and CRI to support exposing RAS error counters via netlink.

How's checkpatch happy with this? :/

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
