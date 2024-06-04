Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4108EC25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 09:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9A810E1F5;
	Tue,  4 Jun 2024 09:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJhSZ8WJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEFC10E1F5
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717493966; x=1749029966;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=HwNHr1ogwn7tN5b9xxU5yJ7aRrzO0pgNLJojS4M1SGI=;
 b=PJhSZ8WJRldTpLUpFkUQGvjgMzNVzxsHPd+i3yBRQ+8tUbd1FZWD6ltZ
 dZ3IZSDFZn+A4YXB8dLBytjVPKLj1Jlmsznvf2Sbc7Tai+Lgl9kE9oihp
 dg5nbfMm3Bqq53prU1Al//TJUZuhEpS7iZzbdLksQVWYW3+fh8EGmWCPd
 gczrCvY0kIFMSKmADeT41wyv39hAllM3z7/m/gfqmsj18lYopRDn+loBm
 O9woIPsuE00yEYv7W0sKjO9hfXgwglaAaZL+9GdwRQItqkKwKvaGTHEaz
 +FwQLIJ+G62/4x2FjFnSNvC3VYy56UfjzKU1hyEzEQ1qeRJua+Hd7zLpU g==;
X-CSE-ConnectionGUID: FvjZV4lsQu25rHkHedWmDw==
X-CSE-MsgGUID: 14K97/btTr+nrIxmxauSPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14185547"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="14185547"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 02:39:25 -0700
X-CSE-ConnectionGUID: H5sSCmzsSN2bswnRBQcPaw==
X-CSE-MsgGUID: 1BJXgVFiS9eNSrFLZn1bXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37764216"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 02:39:02 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 0/2] drm/xe: flush engine buffers before signalling user
 fence on all engines
Date: Tue, 04 Jun 2024 11:38:50 +0200
Message-Id: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKrgXmYC/4WOTQ6CMBBGr0JmbU1btQRX3MMQUoZBJpGWtJVoC
 He3cAGXL3nfzwqRAlOEe7FCoIUje5dBnwrA0bonCe4zg5b6Ko28iIE/7TuH2oEcUjv7mKgXaG8
 GywqlMRpydg6UxaP30WTubCTRBetw3Nv6MInE826OHJMP3+PAonb/39aihBJGYWloMBWSrdkle
 p3RT9Bs2/YDv7Q/xNQAAAA=
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=HwNHr1ogwn7tN5b9xxU5yJ7aRrzO0pgNLJojS4M1SGI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmXuC0p0vFA/xN3aPRzJ08QcY7bnbWwteZihLh48lX
 UMClU4uJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZl7gtAAKCRAjYrKT3hD916NjC/
 9GuQ5GAkwLgssfbOGBE26jq25HaLpaPz+rjXh83XIKsS1QVpK4Ms1z3xzJyfKspGhiPAw0eOii9iUV
 iNS7CE9Cop3ZTaG3UgyUomV9lVDIsANwFxM/ciVH+eUODX5PpBwyS9Z5SHVbvNYZ5ov7EoVtInoOGe
 1LsDqUsr7O0Fhy4VPpAoF1Vt/TbyzGe1sqdDjyeYGfgwxUOoWXErVFAipjA2L91tUscIj4e3QMW0zg
 mH3wKh854iOJwGUGjHqZ+AvyTZEG/4LX+7GMyqDZAHMt5zZSp0XqbhLPDAzEa4xe+L5Q3jiDMiOJr5
 b4Mc0hSQadUBvjV9Ckzwq1PzINqq5kBSdBiRyexlHdpKyYOyGkt4dvCK5P7K6r3U89kqpk7kfvHI8z
 DO7bPfg5udR2TvQAxQllNMwOJDA4D75cdNbW0VAJh3iaspMXriYM7yanBvYsLv2vFo5KVjFxDkjSaA
 bFTqddpIYZUZk+tpkhKQ1x180rDjAddO5kysJBkgdTAzg=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

According to the discussion result on my previous patch I have prepared
new patchset, which reverts previous patch and adds barrier before
user fence signalling.
Remarks:
- I was not able to test it yet, hopefully CI will do it and me also after fixing LNL issue,
- I am not sure about MI_FLUSH_DW flags, bspec says:
  "After this command is completed with a Store DWord enabled, CPU access to graphics memory will be coherent"
  Shouldn't we use "Store DWord" then?

[1]: https://lore.kernel.org/intel-xe/Zl5DcuZeZiFgxVdJ@DUT025-TGLU.fm.intel.com/T/#m0b4420045908bac70426728d460108c0b2b65dca

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20240603-fix_user_fence_posted-v1-1-61c76ef69cea@intel.com

---
Andrzej Hajda (2):
      Revert "drm/xe: flush gtt before signalling user fence on all engines"
      drm/xe: flush engine buffers before signalling user fence on all engines

 drivers/gpu/drm/xe/xe_ring_ops.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)
---
base-commit: fe3d637a9c72b22297da0c731fa5e217bd182d2d
change-id: 20240603-fix_user_fence_posted-ca56c79c0662

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

