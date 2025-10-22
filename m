Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2B6CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5456710E14F;
	Wed, 22 Oct 2025 16:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/yJT83b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984CC10E14F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151190; x=1792687190;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hUu9wdWok5uh8vlEYiLnnKAErqM+1EazO0Fz5FpsxC8=;
 b=n/yJT83bLLvU3LyFjd3iVLa6Oo22edLfA5L0aIzOS0TyxCjnEJ8IIyO0
 uULufdkWYs0o3UoZR5ut+hS6A43W3LD4OkAMrkbWicXSts71JEdwK3Hx1
 27xtYqCzaUOel5WWNIdUfq+7zfACa2OdFU1B6URZhXBp/RSThorIzNxHs
 okfbqfldeH2FFIqbIzIxOQ10BrcSLI4PFLZK4Ij7att/oXJZs2Lv5BibD
 84NTp6xegCqy3+PvksyIPW+8AZL6Vz3iitOFggdG0IsomRyvpnxIzFHTe
 N3DcDJEKcFFc7hWXWXAbtdrRVyAnLMOcrrO5z6t7DLd8e/hCL4H+/sSFS g==;
X-CSE-ConnectionGUID: lShGkq+XRL+5LoZ8fNiukw==
X-CSE-MsgGUID: GSg8knOpTfC8PPqfqvZ3yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73911734"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73911734"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:50 -0700
X-CSE-ConnectionGUID: l5Bvq5/8S1KHI+LwRpeskg==
X-CSE-MsgGUID: eTiH+2zuQW2rvGW8xzQDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189043672"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/7] Some migration fixes/improvements
Date: Wed, 22 Oct 2025 17:38:29 +0100
Message-ID: <20251022163836.191405-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
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

Notably also cutting over to MEM_COPY instruction.

v2:
  - Various improvements from Matt Brost.
  - Allow easily switching between MEM_COPY and old path with configfs.
v3:
  - Drop the configfs change for now.
  - Properly handle pitch=1.
  - Various other improvements.

-- 
2.51.0

