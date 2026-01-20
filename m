Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D524CD26284
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8532B10E178;
	Tue, 20 Jan 2026 18:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xq7MZ0z8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EFB10E178
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768935059; x=1800471059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TsQc1EQytMR2Kwjx3iDFUnnZNC1314RVmZ9WH02Bqds=;
 b=Xq7MZ0z8ssbC52MS5PvhaVNZuK5hZyfaPQGYAqgdN6j6Rn3kJzakJA2y
 fBCgtwXdMof6l4VKSRD5Mo30rBa0xr8tRzij1hGPxbgCTa2lIPUWukUL7
 zKuS1EfqUdaGLE+3fYJ2WlEdbbbi534NoqKu1blrUJ9nP9ciNDhMJu5IS
 I6JEj4lCHWRaRqeSN4puTn92Ovun3oYfwlDi8ZePeQ9QTBOx5/k3GAqO/
 EhBYuwS6nc9nUdfyLbVaaBscktmq6GXYA9y29xROKzb0zNc1JIoBo9hOH
 e4/gO16uhtGbax1UR0f5q/GPTCUSQGGNaWVGKYBE0kFMAo5j6FePeVKbk A==;
X-CSE-ConnectionGUID: HU+1twwVR3eNBOKf4LfexQ==
X-CSE-MsgGUID: R3nocHu6Q6G0uHWkYHOcHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70245718"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70245718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:50:59 -0800
X-CSE-ConnectionGUID: XSDqvrbrRVSMbNajVtYBqQ==
X-CSE-MsgGUID: rGP401ajS/6zDx9365vZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="243776613"
Received: from amedve1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.156])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:50:56 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 0/3] drm/xe/guc: Make MMIO communication more robust
Date: Tue, 20 Jan 2026 19:50:44 +0100
Message-ID: <20260120185047.593-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Michal Wajdeczko (3):
  drm/xe/guc: Drop redundant register read
  drm/xe/guc: Wait before retrying sending H2G
  drm/xe/guc: Allow second H2G retry on FLR

 drivers/gpu/drm/xe/xe_guc.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

-- 
2.47.1

