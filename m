Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5809BCD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA84610E830;
	Tue, 16 Jun 2026 19:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtgD1m/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40F710E665
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781637755; x=1813173755;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=dWRL0J/UticS30mx9aaMRIR6HW29rUup6GHZHm0mhfs=;
 b=MtgD1m/VBbALNOu9zcTcO8jV16bL2uD/VF8wUc6NKKkNwikHp3O+BVhr
 zpOX5CSMGcZ/CGlAaGv/QyBuWOdz6rmXwV9Z5f7IeHv5whtbH//a5Qys+
 ABk8OcjKS1k8LeZSPIcHBTLZqW9QULi05nyk6ZvVvyfip+GJYoTdQwh4c
 WkaYhZQ0vUGasROPhLswGwa7PSm+GuZo+9Mnjh6qQb4BRUzAYNjQScbNA
 G1dvQcfMuSzAYWxH3SgPua0miUoQl3byFauRbt/L01kb8LQXJ4Tq0fi5N
 7XWGGzL8vDW1l4MvmgbMGMhLauYPT28QfQOgEPKAYw06huqjnthcSfn2l w==;
X-CSE-ConnectionGUID: rPZuA9SdTGC70LAdAH7sJg==
X-CSE-MsgGUID: sTp7cxrnTU6nRN2AH13NFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82483220"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82483220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:22:34 -0700
X-CSE-ConnectionGUID: M7XJpdeDSp6wP3cnEBmnKQ==
X-CSE-MsgGUID: /cHfPtMaSJKNVyseXUz8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247940023"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:22:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/4] Move RTP tables for engine init off the stack
Date: Tue, 16 Jun 2026 12:21:50 -0700
Message-Id: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBOaSKGuEiGSYw6UhUY/RHdPW
 n6L9x5IFJkSdMUDkQ5OvIYMLAsYvQkTCbbZUFe1qhRKEfdNn7x7be9gFh71YeYkHCpslWwkGge
 53SI5vv5vP7zvB/IMSqJnAAAA
X-Change-ID: 20260615-rtp_with_dynamic_vals-f161965451af
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=dWRL0J/UticS30mx9aaMRIR6HW29rUup6GHZHm0mhfs=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMaJ4Qsn5DHuZXP1DWJwRyw9jeShX4wjwK79CH
 cAMWAwGH0iJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajGieAAKCRBNeSQFyHKQ
 BEFRD/kBS7FccsM/nDVNWYq3mD4piig+e1Ww/5C7quv/z6IjrMUXfGRQZKiN58369DyaD7I6FaN
 JL2LfdggskX/LT5QOI2SxtnoF6xpEI/LQXNdMP8HEEc8HZuAQLjUNOgNFEYh3Woh5QLbol+lxRR
 jJz+mxnxacHAxJN7FBMtig4LMvyVYlO8BFgeWFG0fB+JHCc6IxkFspAmpaV54cM4zIKN5IoayEE
 UZdd2/7CsERxLJR/Od3i7R1kleysiCd1HdXREM25Oi3WqS4fwqw4LRarf3wBUorGIb6K1SLeOVb
 4Tvq6gwFLPyibMc1sGg6xVSl8hCZkfKuuudy0D0G8u73vYvdQkmbBAYQDDZrB7K3j58ZDB6hwKb
 BRwRRVMVZkQIvIOjPh6XbApWsbcIBXKeUZWq4PIuFnn7P/VqyXhNYyeUkfVuUu/GrtiMPzKk0mb
 vylAeZtDUTEr1MZhtse/AbzSe9oZ+jduKAeOKxF6O5DFRqwwtY+1cZyw6Wb5A42jXbhxBUt5vLn
 MCuYqsm0CzEKhxdFJ9iMh2t041fK5+S0+XUIbvOT7WvpkBNpww9t0FwqfR3pVLStszQgxCAYHZp
 ZeuzeKqIMaQvwbagcOTQ6KDonz7D+fI5Io1QB8YEXFy3X71hSFROh9DKQeu4IlkyK0guNfRr0Wh
 emStrelK8sgb6zw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

There are two RTP tables used during engine initialization that are
currently defined as stack variables inside of functions because they're
not truly constant tables and utilize other values calculated on the
functions' stacks.  We'd like to make those tables truly constant and
pull them out of the function bodies.  Doing so should make the code
more readable, avoid compiler warnings about stack size as these tables
grow over time, and potentially allow these tables to be tested with
kunit in the future.

Let's add a FIELD_SET_FUNC RTP action that acts similarly to FIELD_SET,
but indicates that the value to write should be determined during RTP
processing by calling the provided function pointer.  FIELD_SET_FUNC can
be used with small static functions to calculate the cache control
values at runtime.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Matt Roper (4):
      drm/xe: Reformat xe_rtp_types.h
      drm/xe/rtp: Add FIELD_SET_FUNC RTP action
      drm/xe: Move engines' LRC programming RTP table off the stack
      drm/xe: Move engines' non-LRC programming RTP table off the stack

 drivers/gpu/drm/xe/xe_hw_engine.c | 218 ++++++++++++++++++++------------------
 drivers/gpu/drm/xe/xe_rtp.c       |  10 +-
 drivers/gpu/drm/xe/xe_rtp.h       |  21 ++++
 drivers/gpu/drm/xe/xe_rtp_types.h |  33 ++++--
 4 files changed, 169 insertions(+), 113 deletions(-)
---
base-commit: 0984dfdee2a4f9e1922fe919a6b469e115e23360
change-id: 20260615-rtp_with_dynamic_vals-f161965451af

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

