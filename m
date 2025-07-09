Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D51C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 17:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8CE10E355;
	Wed,  9 Jul 2025 17:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhmLbpLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7D610E355
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752082849; x=1783618849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k1JMdI1h5HkSaZW5G/DFv+23gr5HCtnw8hEBS9c9ngs=;
 b=HhmLbpLkG5MVDf6Kn3rz5yIcGc8h1WQiJ8U/Ps5vAim/fmF1m7vS3E6r
 FH76llFzZSiXNuzUInFTy9hw+408Cug+LadxSZU6GSLKgy5ZPgioh4zW2
 HkC+9AxtYX0KsFQUJ6b1l49rJoFVYSXGSM2/jqQ3ryWQg1a7vT7EjcFhp
 I0dBDZazN/bABVsCGtz1kh/Vf5EFDqKTlRdN24HgpTz4B+adPelbdcMse
 LHxo6VFb3LaFHDCS9AEnVps0ChHPCSxTeMxkU1S0Jmg7rQzMSqGFJisnd
 jt6kPqf79y7nLPPwLPaZ8eBFWWsAeUTThSjYet+gvPOqOmsL/njiM4fnW Q==;
X-CSE-ConnectionGUID: BxU5M9K/T6m7KnSAoFUFew==
X-CSE-MsgGUID: i5CsoYrvT6OqaiqB+WyZHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64932178"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64932178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:40:49 -0700
X-CSE-ConnectionGUID: 0nrm+kvQQ1WwYohAqRCbRA==
X-CSE-MsgGUID: V3/x4ZRKS4+jR+njkeXmYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159863311"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:40:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Cancel ongoing H2G requests when stopping CT
Date: Wed,  9 Jul 2025 19:40:35 +0200
Message-Id: <20250709174038.1876-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (3):
  drm/xe/guc: Rename CT state change helper
  drm/xe/guc: Move state change logger to helper
  drm/xe/guc: Cancel ongoing H2G requests when stopping CT

 drivers/gpu/drm/xe/xe_guc_ct.c | 39 +++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

-- 
2.47.1

