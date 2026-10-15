Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFBDCC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 09:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44270112286;
	Thu, 15 Oct 2026 09:55:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D92B112276
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 09:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792058129; x=1823594129;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vkSdXQrvUWdbAScim5jEgVuDosRx0Etu0Q6PdCqYAlY=;
 b=A91iiUhzKxyYFkm5zYxcAdsIByFN5qEMOF14gCKldWr+02Ue4VJfaeQA
 to86FHGyr9NWzMA0e2GIryZMuLYFEouPXcjM+Ho5i90ZDi8J4bvy1cfYI
 HTpw8xF5IY71Vdi3BJPFLIXTJeu6n+f62Ojrcp4MEAJ3NFwmRySQtGXap
 IW6ItKHIOmwq8YfAfFoqp/+qVjnU4iR6rhhX7C4hOqZNrW6k1aRPTUwYa
 1RjbVU5nJ0yz14EQYjRKoTeBNydPAt56l4c1SAIEn4USB7zDNyTXpR+6r
 1ZrcRmbbEZPtFO8gaO1yMniHPvTdHJEeSQU2SeYI97mhiCSHrisuA8S4M Q==;
X-CSE-ConnectionGUID: 4RTP7mrTSGWaelsJCZtg/A==
X-CSE-MsgGUID: 9pb3iAWbSW+cvGQPaw93vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="814941"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="814941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 02:55:28 -0700
X-CSE-ConnectionGUID: GZ5JbsyXRUKjYZmybCaT2w==
X-CSE-MsgGUID: LpVlsehtTfy25ya9jOum+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1674640"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 02:55:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Improve hw reserved PAT checking
Date: Thu, 15 Oct 2026 10:55:17 +0100
Message-ID: <20261015095516.403932-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
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

This came up recently, where there was some confusion around the
!coh_mode checking, for hw reserved PAT index. Series removes that
completely and just uses pat.valid.

-- 
2.56.0

