Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45D7D6D226
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 14:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7443F10E9FB;
	Thu, 18 Dec 2025 14:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBMES3lk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A180110E9FC;
 Thu, 18 Dec 2025 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766067784; x=1797603784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
 b=nBMES3lkGgqFlwPQ2Xd/cXqBrgkN4oOa9GeRdyff1X//WBZrLAn0wrAY
 eUoYZnEBEFl3XoaiYe5hiZg0yYm12yrDWahjSCF2CIy6wA0xhASxwCQA8
 7RvcBcv9wdCuniQZZyzMhjaIU+IGFoSrfoswZUudaxE6OQcYTPGiCVSyN
 avgI7jcHpo7JcwN3ZRHIdcNJNISMaKrK0a873evuhrZII3twhAe6xiJH9
 B6ktc1dLLahbt6nV2c30biMvGPbfkBhat3jSnH0XaRL//EiNaJ4YCZ14B
 e1ZetfNv5t650HzzZSYJxrBWCY050NOVf5gTHsfDrXSMXEMOi3Li7OMqj g==;
X-CSE-ConnectionGUID: 8geUUh7sRMqk78kbAnxLrQ==
X-CSE-MsgGUID: 6D1b9AHLR02HTjb6bpPaKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85438782"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="85438782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 06:23:03 -0800
X-CSE-ConnectionGUID: ayW5MYcRQbGzPvoDKtVygg==
X-CSE-MsgGUID: BaTTqvZjS0Cf8/W9xS5JGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="197849444"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 06:23:02 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: chaitanya.kumar.borah@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com
Subject: Re: [core-for-CI] KVM: x86/pmu: Don't try to get perf capabilities
 for hybrid CPUs
Date: Thu, 18 Dec 2025 16:14:16 +0200
Message-Id: <20251218141416.2277218-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1b409d97-4367-4368-9b05-da5c611750d6@intel.com>
References: <1b409d97-4367-4368-9b05-da5c611750d6@intel.com>
MIME-Version: 1.0
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
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


