Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2994C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 20:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A86910E54A;
	Tue, 16 Jan 2024 20:01:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E6610E449
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705435312; x=1736971312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j+NrnR9AK79uhyv80VQZXc0pEzX1R3A/ywsDD4XT9PE=;
 b=m+ffTb9fWKWYlFDdtq/Y0DNAK3+stPWf0LehBnVRK0cLX23dwKDzjJC5
 pRh+KoMFhPvarxoD8h/FeBp5k2CwJosJab1xCi2Rk6TrR8dpoIFuYFWHZ
 ayA29PWEXEm3Z1We5ujjKVbt8KQzEb0iV/XqKrTW2l+it5ftMpg92dH9S
 YkCUIckLDpxlNCv7jp1DgwaG0N7WRonPYsRYqBCCrZuH+CgHZ6MYSCPfk
 ywEHDKxOkagtjVLQ8433r9/997ZN7ntwusiIgkQ8+I/MxgPlcRBEhYZSF
 Ke3okMIJEgcc+IyvxhEiPCIHb6jiVoOXILYpFFRLSlfM4u3Z2bO/NvCer w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="398840652"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="398840652"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 12:01:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="26245262"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 12:01:52 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/1] drm/xe: correct the calculation of remaining size
Date: Tue, 16 Jan 2024 12:04:23 -0800
Message-Id: <20240116200424.651661-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Fei Yang <fei.yang@intel.com>

Fix a bug in function write_pgtable where, in case the number of
PTEs is more than the maximum of one MI_STORE_DATA_IMM can take,
the caclulation of remaining size is wrong.
Also update the dword length calculation for MI_STORE_DATA_IMM
according to specification.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: correct the calculation of remaining size

 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

