Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96F5C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 17:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFCA10E8F1;
	Thu,  9 Nov 2023 17:51:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5851010E8EB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 17:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699552263; x=1731088263;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rpt6/FX1pi0UdHwofC7YhLG0hXd4DXGH8+VE0F44aa8=;
 b=gUyyH76uVXO++lYf6cgmGyssNoxFnP49JVeiSJrYkAccyEiNhbVeSd+F
 1K8CXF3V8SXgzvkTlwNRlPC1xYXZvQSAe4mzgzbYRNw7yxL4QwkKrNpuT
 YpkGLm8jjf+bAQiJ0q88OrdphFTpDU8JPHBz9NvyIKzQhqKXXWqZ6mCvm
 c2+hwajGdM6dgmpMFxq8tUgFdHU++HWyGhFpH9nvtU7RPtwoVdPcNepG8
 E9ktpMACNj0jQ36OGSTZNvxqmk8r5giwkuqhy4KsntvF9Je6JkQND1ha6
 6qw0uvuhZyqgrncAU3RqxQ7FUsid9qZFvYaRRjKC88cUBqIWVPQ91Qmnf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3012958"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3012958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11219297"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:51:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 09:51:30 -0800
Message-Id: <20231109175132.3084142-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Fix builtin vs module configuration
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

Do not break the build, allowing allyesconfig and randconfig to stop
reporting issues.

Lucas De Marchi (2):
  fixup! drm/xe/display: Implement display support
  drm/xe: Fix build with KUNIT=m

 drivers/gpu/drm/xe/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.40.1

