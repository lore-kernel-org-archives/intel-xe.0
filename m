Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AE1C27C65
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 12:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683D910E316;
	Mon, 10 Jun 2024 12:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTfEyv6Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3119B10E281
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718021061; x=1749557061;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HWWNUj41BsIPbKEddv+3GhBNZDtWeWkYaAVXiA2BFPM=;
 b=iTfEyv6QEtcjgFcSOAtOY+N0TnW+LxWsbatv8bnw8nQKE1ar9MQ0wjuD
 PlzMTbZxl1PXTZq0+BHJFZUGqr7WJnF6fDABx95DqaUTSv1uhUN+h64Mj
 Axy0nkrgZ0dIhn3mx5oRMPqrDczq2znxfRLqGpl9d3gUSiiQXLG8MMN8Z
 UQQ3JJgkmIdN7u3MU9jlpiiJduebXCfZxLEyjVbdKY6VbnKCUeziViogj
 oUJoGytnwfIkLaR5Cd9GCKLtwKjoUUwVWgW88edKEphczCh4zSX1nZwkl
 sIYLaapuE/qD3JKrsZBJPLPZnMB7FnvaV9cD/Neqa8ZpagWRgC2zmAmqh g==;
X-CSE-ConnectionGUID: lN/3TxINROybt7QEjbq0dg==
X-CSE-MsgGUID: P2N15GqNTHyQ3XelKjZBYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14830933"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14830933"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:04:20 -0700
X-CSE-ConnectionGUID: sBgoL7+QRamgXv44lcJh5w==
X-CSE-MsgGUID: agyyVSm2RgKqf8tuwV3GMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39117383"
Received: from mmanski-mobl.ger.corp.intel.com (HELO
 mwajdecz-MOBL.ger.corp.intel.com) ([10.246.1.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:04:19 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Fixup GuC ABI
Date: Mon, 10 Jun 2024 14:04:09 +0200
Message-Id: <20240610120411.1768-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe/guc: Drop unused legacy GuC message ABI definitions
  drm/xe/guc: Add kernel-doc for HXG Fast Request

 drivers/gpu/drm/xe/abi/guc_messages_abi.h | 41 ++++++++++++++++-------
 1 file changed, 28 insertions(+), 13 deletions(-)

-- 
2.43.0

