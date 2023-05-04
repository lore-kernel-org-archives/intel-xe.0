Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB55C77B78
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2570C10E021;
	Thu,  4 May 2023 07:41:12 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBFE10E021
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683186069; x=1714722069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3wN5iR0bvYK+d0UKaj/w64QLGQvtN36IoZ1PF7AdXNQ=;
 b=PmXyIZ1U6jk9NDQrWVhvoAeFs+KfR1zskxll3by1j8Lnjhl3leoth1ah
 1Ko0FyeUgdJCymrfP8E3i4lCLInQSgpbhThxagsV2x6Icx2U0/tc9buc0
 WaaC+ZJ3mXgmbzTRb7UUj4AMMjiGPRlNVU8ofQNKKMrnJ6NWwLJvc3qH7
 LrOtxP2jHHtDtcYhhT4DZtE7ipeuGpXQBGmKFKLJDkavB/IJQn9OryBUB
 ZmynEvcCP/e0tmxeD9O2TJsen4jQsmwjJxmuaae1nVsKnsmT+DNurl1dQ
 YzmzX2oW4/vcme8kerCHIbzR8x5RY8KRrB1ScZAowLHqfesAjcXPEB+oH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348901799"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="348901799"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="1026825814"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="1026825814"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:41:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu,  4 May 2023 00:40:43 -0700
Message-Id: <168318600676.1440267.2640863935502798375.b4-ty@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503174922.252111-1-gustavo.sousa@intel.com>
References: <20230503174922.252111-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Include only relevant header in
 xe_module.h
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


On Wed, 03 May 2023 14:49:22 -0300, Gustavo Sousa wrote:
> Things defined in <linux/init.h> are not really used by that header.
> Replace that with <linux/types.h>, to have bool and u32 available.
> 
> 

Applied, thanks!

[1/1] drm/xe: Include only relevant header in xe_module.h
      commit: c2b409bb0d98257bcdf5edcb88ea41bfacef294d

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
