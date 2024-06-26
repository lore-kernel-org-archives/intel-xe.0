Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94DCC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 11:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8286910E02C;
	Wed, 26 Jun 2024 11:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVOjxCUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3AE10E841
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 11:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719400719; x=1750936719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kAmc+iZZI5kxPvTqfijwFvSkXtxtCy298HveHvwpsuQ=;
 b=hVOjxCUjNf1jTYMjSvXFWS91n5U0kSQrs757ouua39vrx1fMC0KqCwde
 dI5sWVRtmOeqJ3ZO3pFcbL+D9zQkSZGu5fwJayChtMpZXVpLp1jTaLCVu
 foIAPckdZhaaW6eIwFgBU+gqPUxV68xni0xdqoOzSF5Nrcnhzr5gba3Ne
 cSAKbeywCaymYw3mhFoDBdNbu0JUL82nJD6ScGWNdZdaNOCPhHQQy767g
 yCFgdl4zM9SfY4WOA6E0JaoSryZCvSWDAPllonoSVN8V92husWm56GwD7
 JygWNPdBawBCKFJG19x+gF+AgGECqroP3ccvlXGSizoGA4JEU/mjkytAX w==;
X-CSE-ConnectionGUID: VpkcW+2uQfyvkbD2y3eLFg==
X-CSE-MsgGUID: cXhDJ0jbQkKpDmf1OEnY+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16149284"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16149284"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:18:38 -0700
X-CSE-ConnectionGUID: hxQHkXoVRbCzgMzOXfzjbQ==
X-CSE-MsgGUID: +Ai1w5ChRQil6rBvdwVpFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="81510184"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:18:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] drm/xe/pf: Disable VFs on remove
Date: Wed, 26 Jun 2024 13:18:25 +0200
Message-Id: <20240626111827.1389-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

With the HAX to actually test it on the CI.

Michal Wajdeczko (2):
  drm/xe/pf: Disable VFs on remove
  HAX: Try SR-IOV on ADLP/ATSM

 drivers/gpu/drm/xe/xe_module.c | 3 +++
 drivers/gpu/drm/xe/xe_pci.c    | 7 +++++++
 2 files changed, 10 insertions(+)

-- 
2.43.0

