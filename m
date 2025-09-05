Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F46FCA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 10:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A267010EB77;
	Fri,  5 Sep 2025 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/MnJV9Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3061510EB77
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757068057; x=1788604057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t7hqC0OhZPjfKal3NAGPSLT+p4RXXk/1GrPZPTD7Xj8=;
 b=M/MnJV9Q7HSW66jYHemQ0kruUHOaewwt5II9dzqer+txvL49aSnj6ks4
 3SmFbBpzA1vKGVxb4IFMRgmlAfXxG1Q734De3p0R5Ye8t0tRXNbcZ0jsv
 ZI7TX8V007Wh6JD9wHeKOuVMJYH0kvu81tAFdhKkDY/kHie0pI/fM4/67
 +zSSiql5yoQY3fHy5vE+F0alQhH9MsmrVpU3Lk0It2szMnlY1F52dmBK8
 y2Cv9VjqE9tdv7EEsUwOnXGhuM5f1lwpmbTF+0ClH2jTJWU+BWwOGOfUj
 F12Zh8Fu5A5SYPCCvjl3Ckc/iFfE5S1cP+p6fvI3qNiG1SA5piv0dUKJz w==;
X-CSE-ConnectionGUID: TwRuuSJXRbej4a40U2bIIw==
X-CSE-MsgGUID: pLyZZU5yRXOUxBbxP0XMYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59490428"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="59490428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 03:27:37 -0700
X-CSE-ConnectionGUID: 2p/X55dsRNCu/fXDOJWSYQ==
X-CSE-MsgGUID: Pa4R5jOPRW628vIO8+2pcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="171700945"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 03:27:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Harish Chegondi <harish.chegondi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering()
 input gt a const
Date: Fri,  5 Sep 2025 03:27:01 -0700
Message-ID: <175706800362.503172.4564161396020441087.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <9dc621a90880f62ac8e2951afea7952277f7eb0e.1756855529.git.harish.chegondi@intel.com>
References: <9dc621a90880f62ac8e2951afea7952277f7eb0e.1756855529.git.harish.chegondi@intel.com>
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


On Tue, 02 Sep 2025 16:41:59 -0700, Harish Chegondi wrote:
> Make gt, input parameter to xe_gt_mcr_get_dss_steering(), a
> constant. This would allow xe_gt_mcr_get_dss_steering() to
> be called from functions that have gt as const to struct xe_gt.
> 
> 

Applied to drm-xe-next, thanks!

[1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt a const
      commit: 6ee8adf124102aa679d13b8c3cbe391f544ba90a
[2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
      commit: 5952d80514054d12d2ec72aa111c2e09eb70e881

Best regards,
-- 
Lucas De Marchi

