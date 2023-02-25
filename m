Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E518C7EE2E
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C7C10EDA7;
	Sat, 25 Feb 2023 00:21:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C5210ED57
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284515; x=1708820515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KtFJf+vIvUXJ8s7Blzup9gUxcxL5BochcIIMTY2hFZM=;
 b=AlrbumeW1E6uUfU/RF8MsiQS7xE1tGGxbtlrAjLSmdHB6PvuouNQC0Ww
 WktiVx6MvNFR4hROyhQeYysr4Yh1WtVnvjWmv7CENXpZVlXxrCJSAbPQG
 X2+sMKjnO1pV3UwO/+J7M5LtJMjVYaibojuFvBNphzQJQWoYRQR4vDfLD
 yxlun7GK6TvpX50mVcLTzBEeOoYw5ttTlqIe+Cyd5VhPOK9QaW9cWytdZ
 zEHibla0KOQjuYQtEzZhJ/wNlr6KqhQk87xO1Rkdtx3TBMHOqExDOUHlZ
 ViVOY6lzXfyM3EicFkPV7APaI5asLjw/TlrtCWlbKONqFggRgDX1mJM3p w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313246709"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="313246709"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:21:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918588996"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="918588996"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:21:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:21:36 -0800
Message-Id: <20230225002138.1759016-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Mutex/display init tweaks
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Small tweaks to mutex allocation and display initialization.  For the
display part I had a few more patches on top, but I'm unable to test it
properly as display is giving a lot of warnings on my DG2 systems. And I
also couldn't finish detangling the display init sequency and header
deps yet. While the rest of the patches is not ready, these 2 are simple
enough to go in by themselves.

Lucas De Marchi (2):
  drm/xe/device: Prefer the drm-managed mutex_init
  drm/xe/device: Let display init in a common block

 drivers/gpu/drm/xe/xe_device.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

-- 
2.39.0

