Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7020FC54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 18:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1222B10E0A4;
	Fri, 23 May 2025 18:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NnWaS0Ap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C6D10E0A4
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026498; x=1779562498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3FnQfb5N9ZsP8XdPhKi6lodOR/4T/RFHDF67eDDrRsU=;
 b=NnWaS0ApHe3zY9otqzJmeV38CV/T0hBBf4s1sR0gyDDAo60gNGfuiOVs
 yLY9Vl9m0jD/QQc9Qk268iGoU7YI9p9bRWBsRd5AhnAlsxLkQlmDPks3g
 9vXNwm8DFDlnJxbWrnwolTaHlro0xN1hd9G06MFgYPjF+Y7fJ6dzapR/6
 bJ1hsSXhex0zh4eoT6+Y+yOM5qwylqnm3PP0By+klqr2MMXPCBsyG2lCN
 NCCd/jz5oKJ/Ie4zD/tyanK8UlFs+V1Yw4nh4JEeNJKYzRRaWebZTt0D4
 aN6zVyNFzL7n7y4RKlrYB8Y+qAChE3R01tti3bJs8Ykj+lAHCgIc9UVyn Q==;
X-CSE-ConnectionGUID: +Q5uzsW0ReG6CwK70p9YLw==
X-CSE-MsgGUID: R9qUq6EbTe+oMhZz9ESZcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50145862"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="50145862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:54 -0700
X-CSE-ConnectionGUID: terpDLacRXCJnUVQrNqaOw==
X-CSE-MsgGUID: fQbCNbiRTiOz6Aqpnu83KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="164491718"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 0/5] drm/xe: Add user commands to WA BB via configfs
Date: Fri, 23 May 2025 11:54:34 -0700
Message-ID: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250523-wa-bb-cmds-2a81a7121fc2
X-Mailer: b4 0.15-dev-f7671
Content-Transfer-Encoding: quoted-printable
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

First patch is just the squash of patch series sent at=0D
20250523-engine-mask-v3-0-11817dc6eb63@intel.com.=0D
=0D
The other patches refactor the WA BB recently added in commit=0D
82b98cadb01f ("drm/xe: Add WA BB to capture active context utilization")=0D
so it can be used for things other than the timestamp keeping.=0D
=0D
This is then integrated with configfs to allow validation to experiment=0D
with the GPU, executing commands on every context switch.=0D
=0D
This received some limited test on BMG. The interface works, but I'd=0D
still like to extend it in the next versions. It's good just for a first=0D
round of review. Things I'm thinkging about:=0D
=0D
	- Extend the dump functions in xe_lrc to interpret the commands=0D
	  from WA BB=0D
	- Double check commands are actually executed correctly in igt=0D
	- Support another interface to write an mmio - although it's=0D
	  possible to pass the LRI command directly, it would be good if=0D
	  the user could simply pass the register to write (taking care=0D
	  of it being a write or rmw.... for that we should probably=0D
	  re-use what's done for the ctx workarounds when priming the=0D
	  default context.=0D
	- The WA BB executes at the end of the context switch. If it's=0D
	  useful we could also allow to plug the cmds and mmio writes to a=0D
	  buffer before it (or better, in the middle) by using the=0D
	  indirect context ptr. We could probably spin that off=0D
	  20250516190000.GL5080@mdroper-desk1.amr.corp.intel.com.=0D
	- Fix the use of iomem before building on top for the WA BB.=0D
	  There was an issue pointed out by Tvrtko with the BB WAs=0D
	  simply writing directly to the vaddr, without considering it=0D
	  may be iomem. Here I completely ignore the issue and just=0D
	  build on top. However it would be better to fix that before=0D
	  applying this. See=0D
	  https://lore.kernel.org/intel-xe/cdeayuczdl6ncimrrdjdbrbxn27cantuafsyike=
vqn7v6ziwf6@q7kowyi4chuw/=0D
=0D
Finally I'm also not very happy with the bound checks in configfs. From wha=
t I=0D
see it guarantees to NUL-terminate the buffer for the write method, but=0D
for the show() there's little we can do. Right now we have a big enough=0D
buffer that will not overflow. However I think it'd be better to double=0D
check how it could be improved.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Lucas De Marchi (5):=0D
      FOR-CI: Add-configfs-to-load-with-fewer-engines=0D
      drm/xe/lrc: Extract post context restore function=0D
      drm/xe/lrc: Sanity check bb space=0D
      drm/xe/lrc: Allow to add user commands on context switch=0D
      drm/xe/configfs: Add interface to wa_bb commands=0D
=0D
 drivers/gpu/drm/xe/xe_configfs.c  | 320 ++++++++++++++++++++++++++++++++++=
++++=0D
 drivers/gpu/drm/xe/xe_configfs.h  |  16 +-=0D
 drivers/gpu/drm/xe/xe_hw_engine.c |  20 +++=0D
 drivers/gpu/drm/xe/xe_lrc.c       |  47 +++++-=0D
 4 files changed, 391 insertions(+), 12 deletions(-)=0D
=0D
base-commit: 5ed61f4a36b342006a85c561ce0d1ccdd035f9c7=0D
change-id: 20250523-wa-bb-cmds-2a81a7121fc2=0D
=0D
Lucas De Marchi=0D
=0D
