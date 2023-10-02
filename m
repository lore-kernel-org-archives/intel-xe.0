Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F6E784A4
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 06:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED9410E21B;
	Mon,  2 Oct 2023 06:58:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D21C10E174
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696229896; x=1727765896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A9v3l+1VNHqQLRjqglXu3B3pLZH+L8EVXChvaA+jVDs=;
 b=IlVBsifEITIoK5p5FNOR4SNg0AF8CIx7OzrkTm6fZ3CR0mmMhYwk9wDL
 W3CRBPMIbaLfKO3V2fCtFYDlU5lGZFTJEEwJOCYsLMp/kmFcjkHFjWiWP
 V/zfy5EH0/0xZcP1wtwnLce0YN2eG6Xy6SPqV+3MGS8uiKijx9o0FEUb4
 GuvjU66VM4qWbGOLKTkcAEr0q3LSUT/ub9lrsNCpBkygXN+r+2MeePSg1
 VD8mgE+lrJIdnxRo5Im7ZPh/KAPafklHBY9XccjyqU60mOdv/vL0Pep4j
 lA3sGKFOxJlzZl0YClah5oOU/yvUFMjgFAUozSFhEDw/FCVyy7uMpuroq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="372942723"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="372942723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2023 23:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="1431340"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2023 23:57:34 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 09:58:00 +0300
Message-Id: <20231002065802.3609656-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Backport including i915_active.h in
 intel_frontbuffer.c
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Including i915_active.h in intel_frontbuffer.h is now merged into
upstream. Let's revert similar patch from drm-xe-next and backport
from upstream.

Cc: Jani Nikula <jani.nikula@intel.com>

Jouni Högander (2):
  Revert "drm/i915/display: Include i915_active header"
  drm/i915/display: Include i915_active header in frontbuffer tracking
    code


-- 
2.34.1

