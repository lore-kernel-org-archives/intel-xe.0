Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C253CCDE001
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 15:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BA710E216;
	Thu, 25 Jun 2026 15:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKTBk47y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16F210E216
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782400872; x=1813936872;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PWfhdGO4pmNheQgnWAiPSEeYdPE0VAqWK5vHUtSVOAw=;
 b=WKTBk47y2L6h3TiUGhsEBN7be6U2ZaUidPLVBDECcCbFubmLTjrMRzVx
 doaKmIKxMU8wNHWx40lmXV6LnHdNEF2jBSV2Hl9I/2hZVosz3PrcNZAGf
 S2I51Mf4BsgdpyhQH3VAkB9kgGbdi4oFqwymfLVc43EL72uordfGi9qBw
 xeTF1iLHhzPqweiHW+n/DmPBNvVRDIh5nrDzUB2IspA+RZcJiwwYPsc13
 Uqez5TnzP2j/wt+A/OoK6TkmyUOn8dP2MsEYiMOy8L+M8Ig+4RF2irZU5
 J9bu6qgf7ZA7xT9DpA7+515wICAsIvEkswkY7XuARlBFpqgMrlxmGyvkR w==;
X-CSE-ConnectionGUID: UMLgplFaSUio8845d5bN7g==
X-CSE-MsgGUID: 09Hm7rQAR62IW/ZpzunTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94576331"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="94576331"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:21:11 -0700
X-CSE-ConnectionGUID: +OQkW48BQBmnKqvn7OuB1g==
X-CSE-MsgGUID: 476w7gOFRAKE4C8J59lCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="249734547"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.127])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:21:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Some fixes for purged BOs 
Date: Thu, 25 Jun 2026 16:20:55 +0100
Message-ID: <20260625152054.450125-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
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

Same as https://lore.kernel.org/intel-xe/20260624113837.342961-4-matthew.auld@intel.com/, but
pulling in one extra related fix.

-- 
2.54.0

