Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDB1C5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 12:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BECD10E81D;
	Wed,  4 Jun 2025 12:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ip7vbWpr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F6E10E74A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749041873; x=1780577873;
 h=message-id:subject:from:to:cc:date:
 content-transfer-encoding:mime-version;
 bh=Lro1+o8EvscNCCKlja2VLQaXrCfYpG5PrZGu2m5Z2hI=;
 b=ip7vbWpreQjWsvbs8vvPxdBTwcXJlHa7QsiiW1a0Lk22ywAy1utmMIgm
 8T41mUZNpVT98Fux1yS1dvyTCI++wW76SmrpK6xql6LKmetnoxxchJClZ
 2LKqjXND7kZEJMSOKRCTmflDzQqsMpV4Ad9ST2BSRx4j8bQybw1RiDPcl
 0Zz1QFfwQEoyPaNciV2n96mzSCj0Cdo1V+2qxczs/ZtHYt/dbaFV9w44z
 CggXl2rC2oQykIXMJPFKJO/U85Kk5V7cl2/oWTZWjqnu2UFpTbs0B0/LW
 zLG3AkhPoVNhVJRWHTNS7jVwfYIdjlW2M7pi9VtQ1C6Wtah9INnmpcqST w==;
X-CSE-ConnectionGUID: BaUREIkHRdO2ATYCKLIMPw==
X-CSE-MsgGUID: ti3K4gZvSXylHMPL7PN+Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50361740"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50361740"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:57:53 -0700
X-CSE-ConnectionGUID: rq4t9hh0QguF/bDo3nXnUA==
X-CSE-MsgGUID: PT6gpXinS2mRkORdCaR4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="146153681"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:57:52 -0700
Message-ID: <0e5a09490934b1332e13829c705af98026372300.camel@linux.intel.com>
Subject: VM madvise semantics
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 14:57:50 +0200
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

Hi!

I'm starting an email thread to move forward the questions Himal had on
the madvise semantics:

1) Whether to support an array of ops?=20

IMO the VM_BIND implementation got very complicated due to this and the
needed rollback support. Perhaps due to single op splitting turning to
multiple ops it would've been hard to avoid that. Can we avoid
supporting an array of ops for madvise? If so I'd vote for single op.

2) Purgeability. If it's not implemented yet we shouldn't merge an uapi
for it, but ensure that it would at least be possible moving forward.=20

3) Multi-device. In the spirit of the above I guess it makes sense if
UMD wants to select between VRAM and SRAM now to merge an interface
that supports *only* that. When we add multi-device support we could
perhaps add another op, or an extension to support agreed multi-device
semantics. Even if this means rolling back to Himal's original
suggestion of a preferred placement UAPI.

Thoughts?

Thomas

