Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E848C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 14:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EF910E65B;
	Tue, 25 Jun 2024 14:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzrrkUBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2418E10E655
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719324793; x=1750860793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hNix4HZIH+UvrWsuMWMt2zZghQqKCbb8rws3FzZFCok=;
 b=dzrrkUBq6FYk982XWq5RjMFFlpwIPdd5ZYKq4TMsFeFz+GubVqxlui19
 YHU6T80H3yH9ffoCFf+irt+aX6kMCLmnmaxSNLcczJnr7vttk8yLWyCz8
 cgBIGIMKIKjEUsJSOe/97/+DSr0VBS7e0OOkq34KZzT8Bym7pm2oaLNH5
 DHC8WA5eyUfOwdPv4N/gWcbtL3g8hTGcLnvEXItEZWbUyG5JQTjMLxo1P
 FLFwNImpyvQvJYOFJwzW75jpnnFpA57uKcuNjRXlEPTe1+ijRh3GeuLWi
 BDbY4otArqYhs1jCpRiNPVtPTg8bhFqfzzLdKOveLDNRbSp2L0GxwZ8Jy A==;
X-CSE-ConnectionGUID: cDzL0MciQY+4xw9vphmo6A==
X-CSE-MsgGUID: 8zYGXEPaRqmzvq+FrIPqZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16477095"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16477095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:13:12 -0700
X-CSE-ConnectionGUID: +Jy77rlFRJen7nmcgjvGpQ==
X-CSE-MsgGUID: OmKZ9DFCTHy/sU7KD0YPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="44319338"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:13:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Small GuC improvements
Date: Tue, 25 Jun 2024 16:12:55 +0200
Message-Id: <20240625141258.1257-1-michal.wajdeczko@intel.com>
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
  drm/xe/guc: Demote the H2G retry log message to debug
  drm/xe/guc: Add more GuC error codes to ABI
  drm/xe/guc: Print GuC error codes as hex value

 drivers/gpu/drm/xe/abi/guc_errors_abi.h | 31 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c          |  6 ++---
 2 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.43.0

