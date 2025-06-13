Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C155C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50C110E9BA;
	Fri, 13 Jun 2025 20:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f07FII0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB7510E9A6
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749844847; x=1781380847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hH8XluUgRHrCzqqn9nSQ6B2YNtTtzv4i/si1nhji+bg=;
 b=f07FII0n1dOJbkM8IARa59df63SBdo8uyAfdXgelUrWSmnN9oMTvxP00
 81RywC5fjrR0B3fRHVi2ePk2VdoU49cAJGiKeCCOqlP9iEMcqtHWPCXWP
 GZ/Z3zubh8XWfhAlBXXEWwKFz/LgVQc4UR0OcW9gjgknTd0x5yF4uWGyh
 p6APatUeyvVrcs0lXIO+ND0MfQBkCbojx0QZsec1+KHfoBkBSr2RQIe/h
 gUyMrLIZFktCOi9uM4LRlAaYiz8oZFzSRhdO4iU99byHjHZxNcAtaimoX
 pIQqpRAos3qxHcrUpdhSJpaSgFJzl+n9O+NupleBXaP6po6hN6OMd2o8Q w==;
X-CSE-ConnectionGUID: OB7jrwNIRdOUEt/15s+uzg==
X-CSE-MsgGUID: iCqRiyEOQ6SjEbGYTWxzWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52054312"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52054312"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:46 -0700
X-CSE-ConnectionGUID: ss8Rhv5kR4evwCtu11wKtQ==
X-CSE-MsgGUID: ymFap617Qhu6elhjV4eqDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152875667"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/3] drm/xe: Tweak default GuC log level
Date: Fri, 13 Jun 2025 13:00:36 -0700
Message-ID: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250612-guc-log-level-79f87ca03396
X-Mailer: b4 0.15-dev-a7f9c
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Changes in v2:=0D
- Rework the second patch so the default is kept in a single place and=0D
  the module description doesn't need to be repeated according to the=0D
  configuration. Suggested by Michal Wajdeczko.=0D
- Add a new patch to normalize all module param descriptions.=0D
- Link to v1: https://lore.kernel.org/r/20250612-guc-log-level-v1-0-51f124a=
3be6d@intel.com=0D
---=0D
Lucas De Marchi (3):=0D
      drm/xe/guc: Default log level to non-verbose=0D
      drm/xe: Annotate default for guc_log_level param=0D
      drm/xe: Normalize default param values=0D
=0D
 drivers/gpu/drm/xe/xe_module.c | 49 +++++++++++++++++++++++++++++---------=
----=0D
 1 file changed, 34 insertions(+), 15 deletions(-)=0D
=0D
base-commit: 4d016d6e602638e0ebc3895331224e057508c07a=0D
change-id: 20250612-guc-log-level-79f87ca03396=0D
=0D
Lucas De Marchi=0D
=0D
