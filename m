Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D15FC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 07:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F0210E6E2;
	Wed,  5 Jun 2024 07:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYh/bDYE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F21810E181
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717572615; x=1749108615;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=36+YiNEXSHADSDvXa9EuhOAIml4/tcApwiYgCw9fW0U=;
 b=DYh/bDYE5OarmTe2CoZHD2hxfF1SlLBnQ7NXTcLGePQrDR1EN/QUCUSM
 wsYqpJxvH76Ogz+uKFNYZDCX73+4ebtnN9y2eXecX8SI0qfRNTI7LcmUr
 L6HNNp8u/Dt16j/fo5zUjGO/Ue5EH3sAOEifRc5Lq5HrIchwvQ4hRC2wh
 fN/i7qmxdE5qqO1GdBzZ9oEORujtI5DfHS/TA3nEPuq7xQJnW1TCCLOB0
 o+Lr2oC6Niak0X4rVOnhZzw8nh1ETRBFx9iU0zS0nw7VK7pkY+DoAu7+7
 cKyfigf3artDbz4NmCqNrtJBPwQk5RZ6wmDImLd3baxN/MtvDMVxlQ1rG w==;
X-CSE-ConnectionGUID: 5gzlJzZsQz2WwYSABjKkgA==
X-CSE-MsgGUID: TdnKDJ8lSLySwKq5Rijs7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24789015"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="24789015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:30:01 -0700
X-CSE-ConnectionGUID: ROhnOT0lT46MWueXFswI/Q==
X-CSE-MsgGUID: cnU5f7p2TuSoclQFJBgBIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="42453165"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:29:59 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 0/2] drm/xe: flush engine buffers before signalling user
 fence on all engines
Date: Wed, 05 Jun 2024 09:29:46 +0200
Message-Id: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoTYGYC/4WOwQ6CMBBEf4X07JpSsARP/ocxpCyLbKItaSvRE
 P7dwkkPxuMkb97MLAJ5piCO2Sw8TRzY2RSKXSZwMPZKwF3KQklVSi0L6PnZPFKp6ckiNaMLkTp
 Ac9BY1Si1ViJ1R08J3LznS8qtCQStNxaH1db5O0QeV3LgEJ1/bQemfOX/bU055KBzrDT1ukYyJ
 7aRbnt0d7FuTerTUv6yKJBQqyRB6uuq+LIsy/IG+zhirRoBAAA=
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=36+YiNEXSHADSDvXa9EuhOAIml4/tcApwiYgCw9fW0U=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmYBP1/KWWQoNoUHmq5F+JAcIf45Zbij7Hk3djNJJ6
 JHmcNiuJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZmAT9QAKCRAjYrKT3hD919cTDA
 CSJogxojnv1daZzBrlJJkNv3/yI6d+dmxIjxIeC2bRI+AKjooFbKeIvNCLgf6uJAA53eGs9HhYioJT
 9Y2BqLi5MUYx3+MUOgjacJZJqpKfV+Ht2vfVgnd5df0qlXAxmUDSOXeApC2bLQzbUCVfhx3PLQff4D
 frVrJK4DhbEWycS1NP8LonCwVa4f+enBt2HdAGd+HQp8FkGc8p/XgwjfBnGQrxuRftrL+4xbQPJWAu
 pMq+CIFU6WNI4FSKxG0PQvm0rXajJcbH1tpJUCZQiIxY1aeVExy89nPQcAm8y74RKL8mO0JDa2SYD8
 ZL0bHhS39PbtnWKZ2EQzWoMfsSQIBTsa8bCVPBluECPRnYnjv10ZVymh6cdNaFiqg0ZXsOyShYiuV9
 gmPBINYLcXOMqqgP1rjxnugpmWv85pq6xz8DzkrVPZYppQxUK3JoZxhzLta86QRA5KrX78eQQdSkDH
 mToIQr64LoUx2jZHZkuz+ii92dPQaICtV3zs8B7AHGyw0=
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

According to the discussion result on my previous patch [1] I have prepared
new patchset, which reverts previous patch and adds barrier before
user fence signalling.
Tested on LNL.

v3: added fixes tag to patch 1, and r-b to both

[1]: https://lore.kernel.org/intel-xe/Zl5DcuZeZiFgxVdJ@DUT025-TGLU.fm.intel.com/T/#m0b4420045908bac70426728d460108c0b2b65dca

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20240603-fix_user_fence_posted-v1-1-61c76ef69cea@intel.com
- Link to v2: https://lore.kernel.org/r/20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com

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

