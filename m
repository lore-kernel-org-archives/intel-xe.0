Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DD6C636ED
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 17:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2475410E59F;
	Wed, 28 Aug 2024 17:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCxsX6tU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DB610E59F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 17:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724867755; x=1756403755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EGp115N/IcnfIBR7JNAF6zpEOD1FHrXEPW3NoY0d3z0=;
 b=FCxsX6tUygRg3A3WuGUWDGr2sZk6hUTp9wFowVEBDdDf7dKwMrBy1bN9
 KZpZzFWwUl3bpcN20351VWboTumulI6Ltt1gaArVuS+Bgmnzmhpucs+eR
 IwkQ+nFpGJyb+bL0QgUqpdB33xJ9ryOR6K9v24fzFzDc275fHQ6tHQh/g
 FbNGTt/Gti66V1OqtBGJ1LOrEKBkjVbKAbxpuiaoEfgAIxwkbiq7wOyuD
 qHixg3S0c2uo+81UT0FYWpAfK0zsumtmAURTXnH2Tswe+H5DuFaa9Bj6H
 b/U4KcnqFEzOWP5Y4EGkBGJkKUZOIWr295l9AWEpcAWjtO+w15P5NJEVk A==;
X-CSE-ConnectionGUID: E1UjoyMmTLKRsrUvymTIoQ==
X-CSE-MsgGUID: V7sNi4FcSDKVARyPxe4X4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="22997102"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="22997102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 10:55:55 -0700
X-CSE-ConnectionGUID: M1dAutmSRdCwtLwsd2oGQQ==
X-CSE-MsgGUID: f3AgOH53S2aJv7afVYDXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="62946293"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 10:55:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Drop force_probe requirement
Date: Wed, 28 Aug 2024 10:55:44 -0700
Message-ID: <172486767170.1824650.486558494480690230.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
References: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 28 Aug 2024 13:51:52 +0530, Balasubramani Vivekanandan wrote:
> Battlemage platform is sufficiently tested and found stable. CI is also
> pretty stable.
> Removing the force_probe requirement to enable the platform support by
> default.
> 
> 

Applied to drm-xe-next. Second platform with official xe support.
Thanks!

[1/1] drm/xe/bmg: Drop force_probe requirement
      commit: 3adcf970dc7ec0469ec3116a5a8be9161d17a335

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
