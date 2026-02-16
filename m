Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E51E81A23
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 13:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A790510E124;
	Mon, 16 Feb 2026 13:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1lYRxdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E68010E055
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771250246; x=1802786246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zpXpoeli51XHNqmT37CLb9Xubq3aAblCZ+KFFxh+TRQ=;
 b=k1lYRxdRuYgcdyaO7lJDdAPPdrYYRC6vD/lPqckZkeJSwQLmwvEXBxJS
 IfZmo62d7D5lwtaBAaiF7qyvwZZIcNYHEmxuX+mg/a+tVc8FDQ1oRAde8
 XWnJh2gi+bJIdAeimUDtJlIVzfVmHLjZklIjv9sGp9NLUfQbvWdXuZZjD
 xMQgf/HRQk7Tx/nWM40C+yngXnZZIP94YIYPiJSSF/oWVkghYli1u6zqb
 vpjb9MenB8WfH9k0lPHVVvmPX1uzsxo6c7LObC4D+AFjIvArg0nK/xAzc
 ZYkibuGG2VrmTUCP4/mEr1XKP7VU7x3kToFvnNY6MdlkNiijmMrTGvE00 w==;
X-CSE-ConnectionGUID: EO1qwe/pQsWK9i2TXN1BgQ==
X-CSE-MsgGUID: uSV52vOHTwKCm+T0tPNjNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72238316"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72238316"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:57:26 -0800
X-CSE-ConnectionGUID: ZXmfVkEZS/ivw3cLBluJKQ==
X-CSE-MsgGUID: FmEqKXkwQze8Tdf/s82ggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212593033"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2026 05:57:24 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 0/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Date: Mon, 16 Feb 2026 19:21:08 +0530
Message-ID: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
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

Performance degradation occurs in multi-BMG GPU configurations 
during Peer-to-Peer transactions when one of the two GPUs remains idle
with no engine activity.
The root cause has been identified as frequency downscaling:
the idle remote GPU reduces its operating frequency to the minimum 400MHz,
which negatively impacts the bandwidth available for P2P transactions 
initiated by the active local GPU.

To address above problem this patch ensures for the platform BMG/CRI
the default GT rp frquency min set as 1.2GHz to ensure effetive P2P
transaction bandwidth.

Note: 
While frequency boosting improves performance, 
it also increases power consumption. In single GPU mode,
it causes the GPU to operate at unnecessarily high frequencies by default
and as of now we do not have any mechanism to limit this for single
GPU.

Nareshkumar Gollakoti (1):
  drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI

 drivers/gpu/drm/xe/xe_guc_pc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0

