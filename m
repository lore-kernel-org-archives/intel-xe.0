Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988C4C6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 20:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7846610E62B;
	Mon, 13 Mar 2023 20:46:48 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0421410E62B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678740405; x=1710276405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lHj+rP66dhGeeSP56fthm6kSIz4OnEEDHMOZS3HCyb8=;
 b=XaH5+Xb9nd/n5WO2bRR8utIl6NGQn5u5BvFLWZp1l9V81hfwUoI/GIEF
 VCSXTs8sXdE898j4IGvd2OqDQwN+wMliE8NmN2x71FFsOfE3bRIIShm1j
 1DMf0by6eYfcDwUiFyksmLn5Y+HVbu/nnK30w5Szw6lTfeqzPwr0LmBxc
 /NnP4/un3lXlxVYQb0D36g7JiP6CLYCEr10VsagAwPnA/ZMmo3lWTuPwA
 Ot4cV6D/tw/ZUZQ/ZmM2YDsoQ4lv7J0rpvskzRqvgeMapknL0hN9B4Xjd
 dQJaSnkOjEIRH+UYSXw5qBAybbm4oZEZ5nN6zfbDeBCPIusylLymtWKoj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="364915665"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="364915665"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747735032"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="747735032"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, jani.nikula@intel.com,
 intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 13:46:15 -0700
Message-Id: <167874035176.2485361.834993718735627741.b4-ty@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230309121746.479146-1-jani.nikula@intel.com>
References: <20230309121746.479146-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: make compound literal initialization
 const
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 9 Mar 2023 14:17:46 +0200, Jani Nikula wrote:
> Be careful about having const in the compound literal initialization to
> keep the initializers in rodata. Here, the impact is 1.8k of mutable
> data moved to rodata.
> 
> add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-1804 (-1804)
> Data                                         old     new   delta
> __compound_literal                          1804       -   -1804
> Total: Before=42425, After=40621, chg -4.25%
> add/remove: 0/0 grow/shrink: 1/0 up/down: 1804/0 (1804)
> RO Data                                      old     new   delta
> __compound_literal                          7696    9500   +1804
> Total: Before=138535, After=140339, chg +1.30%
> 
> [...]

Applied, thanks!

[1/1] drm/xe: make compound literal initialization const
      commit: 1528d94b95561c4407c65d5ef5754a988eef42dd

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
