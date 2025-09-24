Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2FDCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 21:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A1910E7F4;
	Wed, 24 Sep 2025 21:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjp7Ivx7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959BB10E7F4
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 21:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758749118; x=1790285118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z1tEWoRo3KabPxwzAvaQ2COqBW84ItajNF6W08XpSQQ=;
 b=fjp7Ivx72TYzZU5+AdDyLuEfIN0uUAg1+xPj88VqFZP25VWRP6Usbfyu
 5xXYGXSZPoWwPuiFAf4FUxC4LyppI6NZ3GHWmIe2N1UABXuBOGIF6Beki
 jGVj4R0eUe/aaaAS5RY82UsJKcpVisCtRMpCb2DYy7/0O/wGWDAMq9i+o
 qeTBRum+IoXQmxv2d/BIAUk7rYVQ2zxnfhPgPlPXmtXiPcLzeaq1BYqo4
 FyX/cLwF0unWwjk1l779AVY0koCC9SXT8vKgHMe9VQZ1biBRvVeVD+Fok
 rtXWaQ4mJXbAgkqe3LrpKiqmzB61lwfezfasOp0zVgYMSaw5IZCYDUkNe w==;
X-CSE-ConnectionGUID: g9h6PsBnRJKPha8ZkJ+6Jg==
X-CSE-MsgGUID: yxOWaBMOR8KBclN7eqK3zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60761322"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="60761322"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 14:25:18 -0700
X-CSE-ConnectionGUID: RizSSYK5TGC/cC2834lA8g==
X-CSE-MsgGUID: toLmtZn7SpS/hFPD+2UbeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="182294479"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 14:25:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/configfs: Fix engine class parsing
Date: Wed, 24 Sep 2025 14:24:57 -0700
Message-ID: <175874884196.996894.10735989190886270500.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250924152709.659483-3-lucas.demarchi@intel.com>
References: <20250924152709.659483-3-lucas.demarchi@intel.com>
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

On Wed, 24 Sep 2025 08:27:10 -0700, Lucas De Marchi wrote:
> If mask is NULL, only the engine class should be accepted, so the
> pattern string should be completely parsed. This should fix passing e.g.
> rcs0 to ctx_restore_post_bb when it's only expecting the engine class.
> 
> 

Merged to drm-xe-next, thanks!

[1/2] drm/xe/configfs: Fix engine class parsing
      commit: dd797967160b79cc0ca2d2eb05fc55436b66dce0
[2/2] drm/xe/configfs: Improve doc for ctx_restore* attributes
      commit: 47ca7acff4011fa322853a3612f464b959e88210

--
Lucas De Marchi

