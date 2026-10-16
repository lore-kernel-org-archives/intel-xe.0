Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E2CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 10:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059EA112743;
	Fri, 16 Oct 2026 10:33:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3C210E1E1;
 Fri, 16 Oct 2026 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792146799; x=1823682799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w+u2467kNCBKVIFmIwaQzyJSrvkTzGB5qKEoStlzKJY=;
 b=f/bb4fXKwiqHdJlMkFClGBteA2RPOthHb2ZKRQEiFYlIiJiUVW1lU3jA
 0G2sGa9AWl/nbxZsm5PtmAN5LiXrl2OHs1uvyMquoske9cr8BC9CKEMYr
 6Uhnx3tm8Y1NHOpQrF6D37mJsMXXjG6AVOcBbVAzAnqn/1uh2vLrpXKU4
 ik67ey2Ca3ux+aYkV74GWk2aaOm1w4tY6itMaAZQyA08jlGZt2rx0/A+v
 OoKbwquAreIiGA7Q5FF77dlfjW+AM54t6HssodoZW0c58MIlUPuKSd2Q+
 XdifOZANtlmjUwOgDmeaBM9MQBp2kt+Y4XFZt/Dfp0hCDNfUH94Xw7soE g==;
X-CSE-ConnectionGUID: dDZsv1JET1CiJY3Fth3cCQ==
X-CSE-MsgGUID: 2fCkjMJ+Sgi+95aYUlAkEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="930907"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="930907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:33:19 -0700
X-CSE-ConnectionGUID: IprljVF+SquKSUtP1aecdA==
X-CSE-MsgGUID: 72dKXW1zTzugUFywzScE5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1872395"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:33:17 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/2] drm/i915/dsc: Fix QP, RC parameters issues
Date: Fri, 16 Oct 2026 15:47:11 +0530
Message-ID: <20261016101713.230013-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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

This series fixes some mistakes in helpers to calculate DSC
range_bpg_offset and  QP index selections. Due to these, there are
corruption seen with few panels [1].

Thanks for the Reporter, Ivan Aslamov to find out the typos/mistakes and
root cause the issue.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9247

Ankit Nautiyal (2):
  drm/i915/dsc: Fix QP table index calculation for bpp selection
  drm/i915/dsc: Fix the helper range_bpg_offset()

 drivers/gpu/drm/i915/display/intel_vdsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.50.1

