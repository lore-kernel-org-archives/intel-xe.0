Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FD4C71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 22:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B974510E740;
	Wed, 11 Jun 2025 22:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vx1SJ7Ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD73E10E740
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 22:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749679680; x=1781215680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+fwgPYyKVVTC8pqrQXsNNGCFX+N3p2U8eMNaUK4gXNI=;
 b=Vx1SJ7Tipk+wkWJSQNC/tA3br9ZhUXC+v1F8hbeS7K95akI4N6oenjlq
 TXDh1/i/K4iLnc1HvGDoAwT7t3xL9NDm0EbWA1VIDADSbB3k19DoR6pi1
 kb8ca6AUVMTY9eRRuFgK6O1HnvroZ+KfWoc0a2GWwb2Mkcl7GICnmgEXL
 giCxrLScvKY1qUvM69C0qbnfhuN0mhNL528BLPDf69Pzsgmt2F1rxbTW8
 Eya3uX7xuSWDpVxPgYjtOU+UfMF4U9mOVACy+4S8rc1pIEwTLzQmPIl9B
 IUd9wZciyVdRCKO9Fj2JVvwkY/5+K86Km27vqKbQTGxaAKVGQHon99zvU A==;
X-CSE-ConnectionGUID: 1E23T27ZRMufOYIUz62CWA==
X-CSE-MsgGUID: 8FZT3+sWTiGO6epI3/utQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51828928"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51828928"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 15:07:59 -0700
X-CSE-ConnectionGUID: QoM2VwqqQjiin6MYvSDOAA==
X-CSE-MsgGUID: 2ioKvUMBRvuQEmTXn1cJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152314942"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 15:07:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 0/2] drm/xe: Fix and prepare WA BB for more users
Date: Wed, 11 Jun 2025 15:07:48 -0700
Message-ID: <174967961592.3784523.6503128270645157040.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
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


On Wed, 04 Jun 2025 08:03:04 -0700, Lucas De Marchi wrote:
> WA BB fix and preparation for more users, split from original patch
> series "drm/xe: Add user commands to WA BB via configfs"
> (https://lore.kernel.org/intel-xe/20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com/).
> 
> Intention is to also use it in another, replacing the first patches of
> "More missing XeLP workarounds"
> (https://lore.kernel.org/intel-xe/20250602111956.14854-1-tvrtko.ursulin@igalia.com/)
> 
> [...]

Applied to drm-xe-next, thanks!

[1/2] drm/xe/lrc: Use a temporary buffer for WA BB
      commit: ef48715b2d3df17c060e23b9aa636af3d95652f8
[2/2] drm/xe/lrc: Prepare WA BB setup for more users
      commit: 0ed4b3c21c5013842b7e661dd1c4aa5b75c9c5db

Lucas De Marchi

