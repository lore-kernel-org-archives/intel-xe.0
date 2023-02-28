Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BE0C64ED6
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED50510E03C;
	Tue, 28 Feb 2023 10:41:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A2610E03C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580918; x=1709116918;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Py7E5mIPu7mGyLZSj0SiNgv1uj3R264UdWzAx5pKXrM=;
 b=TjPUSpRsaWS4c1fOgSgJKsBx9zsHB6IhdMRRwLyXeVoMhwuc57+yNCsp
 uNSZHVxftsGFiZYP0yH9N8zSqLIA9tJL00PecPWBO6HBhxGupUqnnGYKl
 9gZ9f18xzCUInqh8oGX8SbGG+guKH/mZKg8r1528gRx1pOLlAT1IuIi+I
 yYIc2HmCjdM/MHHN746TKAz0Kp0/iDPjXf5P0RYRb86OPtlF+nr/I//q0
 Sx9L564kfC8+B2iZ4rNIjxLbCMs7OU5fhoHoS8UWBpCDqVyXl4rzrKe9I
 rM0g+D6vNorZESVA+sYyqxbbTaxR+xzCYCerNd9gSUJUBk+htl2dHUrsK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884671"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:41:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108942"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108942"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:41:57 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:23 +0000
Message-Id: <20230228104137.80965-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/14] small-bar support
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

Still needs Mesa changes to consume the new uAPI, however shouldn't be much work
since Iris/ANV already support it for i915. IGTs seems to be passing from local
testing. Most of the prep patches (and semi related fixes) can already be
landed.

IGT: https://gitlab.freedesktop.org/drm/xe/igt-gpu-tools/-/merge_requests/47

v2: Rebase

-- 
2.39.2

