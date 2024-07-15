Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08FBC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 10:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB3910E32C;
	Mon, 15 Jul 2024 10:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8QUW3VQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3E010E32C
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721039936; x=1752575936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5f7L4yW7PFy8mhq0cORcZi2O53vzH/x+ze6NbhenyFA=;
 b=W8QUW3VQqppSctiJdqvL1eAhJcWoyPApxaKxUY76Nhe4T9wVZjwDRhmz
 prdbFRQXWkHGPtq493AyVo8Kgz3eu7Q6lmxx3JQOOu+Wc40QV+Xi4TWbK
 wM0wUIpbD3v0Lh3UKZI0U8mP4v2PQZm33RkKCA96sVDYk8/E9BmvrmlN1
 pDV8uxWkxYMq1onQUHifC56S3ocgvf7nWUcQcMXt3FlungmeNxEge9NvA
 H4QhIi0Z4RnTNAFuVektu7e/vpoA//5G3pm617VJLW9OEz6AlwsEkpj/P
 KaIBape0aRQAsgUTA0hTmPS9iZYPK0qZ8qbuJO0rf5B4hLT4VLJHqyWMH g==;
X-CSE-ConnectionGUID: wfKJF0ZsR/6j3pb7LiFn2A==
X-CSE-MsgGUID: s2M0JobBRra+Zid3si5kLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18025536"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18025536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 03:38:56 -0700
X-CSE-ConnectionGUID: aqOqb3O0TteRod27Qj9NyA==
X-CSE-MsgGUID: wiXG9zz2SAO2USFJUM4yAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="53954484"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2024 03:38:55 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/2] Minor cleanups
Date: Mon, 15 Jul 2024 16:25:53 +0530
Message-Id: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

Removing unused regs and function in driver. No functional change.

Himal Prasad Ghimiray (2):
  drm/xe: Delete unused register from xe_regs.h
  drm/xe: Remove function xe_device_canonicalize_addr

 drivers/gpu/drm/xe/regs/xe_regs.h | 2 --
 drivers/gpu/drm/xe/xe_device.c    | 5 -----
 drivers/gpu/drm/xe/xe_device.h    | 1 -
 3 files changed, 8 deletions(-)

-- 
2.34.1

