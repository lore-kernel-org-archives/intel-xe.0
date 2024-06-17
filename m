Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D7C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63B10E3FD;
	Mon, 17 Jun 2024 14:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gA3srQaV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DAA10E3FB
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718634880; x=1750170880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FbOKL5Q1USlG8iwY9GsTsrNPp7Kl2njGsstG0i+rdr0=;
 b=gA3srQaVaoJmDQfWe4VttASE18pJwyIvgRG71tX3QRizp/gr61Ia5rRS
 01Wcvz3xW3EqTDJ21MmUVX79QZt+H0BDYASOxqSM3og9yBdB1d3yd4h66
 o8WT1PriwWWTO42yoCPcNMQPmR373TCk3hLKNSvTqV6X3NK0NViyfXkxZ
 m401IfXeKMYoPvbRTy6LZ5ljruOyU0IzRd0GigxjZCSYXiiS20ZYvUmoo
 oyS/xSL3fIgejlgYsyN1exkAc8Oz5GsZSH7dcel4UQy3m720WEHnml/Er
 GXhSulOjhoH0QO0fmACMkSOKSsj5wjTt5+tr2woGrtQ8qaN4MUC2NFi7l g==;
X-CSE-ConnectionGUID: RJT0fbF+S1yKpM35+erOPg==
X-CSE-MsgGUID: WBIYPD5KRaCaDsw3wHqDKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19247185"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="19247185"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:34:40 -0700
X-CSE-ConnectionGUID: Af1+ezZPQTSwWLPnciUmIg==
X-CSE-MsgGUID: N80/+6bYQE209NL/nmcsBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45647192"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:34:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC 0/3] FW guard class
Date: Mon, 17 Jun 2024 16:34:27 +0200
Message-Id: <20240617143430.641-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

There is support for 'classes' with constructor and destructor
semantics that can be used for any scope-based resource management,
like device force-wake management.

Add necessary definitions explicitly, since existing macros from
linux/cleanup.h can't deal with our specific requirements yet.

This should allow us to use:

	scoped_guard(xe_fw, fw, XE_FW_GT)
		foo();
or
	CLASS(xe_fw, var)(fw, XE_FW_GT);

without any concern of leaking the force-wake references.

Note: this is preliminary code as right now it's unclear how to
correctly handle errors from the force-wake functions.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Michal Wajdeczko (3):
  drm/xe: Introduce force-wake guard class
  drm/xe: Use new FW guard in xe_mocs.c
  drm/xe: Use new FW guard in xe_pat.c

 drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
 drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
 drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
 4 files changed, 82 insertions(+), 50 deletions(-)

-- 
2.43.0

