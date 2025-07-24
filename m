Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F597C83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 14:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F07510E95D;
	Thu, 24 Jul 2025 14:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJfTkCR3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5029B10E95D
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 14:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753368182; x=1784904182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1rM3l94zK9ZHy0ztKQsylPTkIw2JVk/sEJg5oRcDg6o=;
 b=ZJfTkCR33fTjczsA7M7G2uOpxKpiu7M3OvhmJ6Csq25lOFZZ6sX+r5+K
 l9c31br+ynmdP4cCtIl3haVB28etXlEfsOjAOfShAw4f2oVyRFMS82980
 hwyOUvqhRvnL+JCZpcaEXVxDSH6ZpDnyFm8cs7ujJX7SaXSpnk1tUnZlf
 ba5wL8UBe3IjyxZUbNhQcygiFXyjV3OkRfITRJz+r/A54H7e9h6nJXFCz
 04F7BggmtzdcaPXdh+jLZfKDufOBv4CCHZ0kCOB5WlIngHwhl0xf5KuIx
 hGo0Ca2eCpI9hKohUWiJ9KWoTBCe3hP+oPzqfb5s2/mRqZHL52Vk8ErDw g==;
X-CSE-ConnectionGUID: AT2qg1ZsTYW+RBbgwq20Zg==
X-CSE-MsgGUID: M4NqWiuYTxCAuOYwgHk9xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55840337"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55840337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:43:02 -0700
X-CSE-ConnectionGUID: Di7de6kvQ0WFxd62NIOJzw==
X-CSE-MsgGUID: zbaXdsisQ1WGPzBaUM3Y1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160795718"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:43:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, tejas.upadhyay@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
Date: Thu, 24 Jul 2025 07:42:47 -0700
Message-ID: <175336815153.734859.2755358774009895608.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723141039.3848390-1-nitin.r.gote@intel.com>
References: <20250723141039.3848390-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Wed, 23 Jul 2025 19:40:39 +0530, Nitin Gote wrote:
> The register at offset 0xfd0 was incorrectly named MCFG_MCR_SELECTOR,
> likely copied from i915. According to the hardware specification (Bspec),
> this register is actually called STEER_SEMAPHORE.
> 
> Rename the register definition and update its usage in xe_gt_mcr.c to
> match the official hardware documentation.
> 
> [...]

Applied, thanks!

[1/1] drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
      commit: a313d9059f00adefdadc6c5612c104bbd78a4808

Best regards,
-- 
Lucas De Marchi

