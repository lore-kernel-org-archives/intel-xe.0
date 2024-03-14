Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99EFC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9EA10FC2D;
	Thu, 14 Mar 2024 17:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEM3ZN14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE0310FC2D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710436949; x=1741972949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=enY/BTsO/4BhZ9K/qrzdyHvdbW865cKsCy0FygPrS0Q=;
 b=WEM3ZN14aVQUUjvQG00KObVkPEAySJcb4nfzos09mlCIuRCCSTWGXzY9
 vZvith7o9cTfAqShPF8gMN4xrCaXf4F7nuR8FJ0Yr6CQNqkI4tFa4C9cr
 x2c971e99CmQmaouYD2/lCWLe5qh7Na9V91sJeJruhINwWSMRgdcvYqAA
 vIOC61gxkPepBWD62oswFayhBTq4T67urLoJUsFbhEEI75C+7quQHMmkO
 cWtPfJSlOLiCCmmsZoJvoajjEGcwUe7lFvlBK2TJVw2xpEg06qtTjFDgb
 7EXS8G036WzsClaD9NWCnmaErxynpl/EhhifLQQsDfytrl0zJ5nA7Npdb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16669890"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16669890"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16969797"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:22:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/guc_submit: use jiffies for job timeout
Date: Thu, 14 Mar 2024 10:23:00 -0700
Message-ID: <171043694365.2642980.10120097497494167712.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314121554.223229-2-matthew.auld@intel.com>
References: <20240314121554.223229-2-matthew.auld@intel.com>
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


On Thu, 14 Mar 2024 12:15:55 +0000, Matthew Auld wrote:
> drm_sched_init() expects jiffies for the timeout, but here we are
> passing the timeout in ms. Convert to jiffies instead.
> 
> 

Applied to drm-xe-next, thanks!

[1/1] drm/xe/guc_submit: use jiffies for job timeout
      commit: 2c5b70f74d61438a071a19370e63c234d2bd8938

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
