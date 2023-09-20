Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D00CE79AD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 07:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3E110E161;
	Wed, 20 Sep 2023 07:21:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC4410E161
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695194512; x=1726730512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cv6V0p/EkzIAjmkEO4fhm4xgtfAB/RvHMs1z7AipsWk=;
 b=HsQfz+TmWZmqybN1gfs42rs3JTB70k/qyW0xQllZwgLyFRWwuAyzsSLv
 b7dhJZyb/T1xuVZmzhfNMdTvH8qFuIbBWLf3jOhsJsf/95zF7Um/S1q4u
 d4ZzFpUFzZZn+zXaYUSW3f7223Dd0FQF9HIAhEGZaADwOD3ZS+EBPbu0+
 OnqU7MVCSaCo/4jd60Y6snxPIxhofBBkp+sFXmBtjY2Ek1bBXCH0xsb8z
 fD+67vOa4vVV0g01PcR5HnEUpf8xyryoCilmOK6C9TQGgnrns5qVjUu3/
 nmULwPwgi+gt+/uKwl2ptzjXEKkG2Jojxw6RUot5WWB65z8WASNlnWRxW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383993961"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="383993961"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 00:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870264355"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="870264355"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 00:21:50 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 12:46:57 +0530
Message-Id: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/3] Use common wrapper to get step name
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

Use wrapper common for both xe and i915 to get the display step name.

This patch partially reverts the changes made in

commit 8c4154824537 ("FIXME: drm/i915/dmc: xe way of getting at stepping")

TODO: Find cleaner solution for rest(not stepping related) of the Fixme
      patch

The following patches are to be floated in intel-gfx and backported to
xe
	drm/i915/dmc: Use common wrapper to get step name
	drm/i915: Add wrapper for xe compatibility

Chaitanya Kumar Borah (3):
  drm/i915: Add wrapper for xe compatibility
  drm/xe: Add wrapper over intel_step_name
  drm/i915/dmc: Use common wrapper to get step name

 drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++-----
 drivers/gpu/drm/i915/intel_step.c        | 5 +++++
 drivers/gpu/drm/i915/intel_step.h        | 1 +
 drivers/gpu/drm/xe/xe_step.c             | 5 +++++
 drivers/gpu/drm/xe/xe_step.h             | 1 +
 5 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.25.1

