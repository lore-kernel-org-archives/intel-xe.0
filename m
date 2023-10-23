Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2457DC001E0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 06:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AF1891E1;
	Mon, 23 Oct 2023 06:34:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A9A891E1
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 06:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698042884; x=1729578884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6gYGsuQN/+UAQAkSuCEGlkg0zKXBrmaZm/1T4RRS5j4=;
 b=K5FlSOWC66xISznwm0ofSJxFaAaTaV3rQHIAnV4nc3TW1SEsovtTDTUR
 c8VsBnaxRWDw9ZJQT6Q+8CYGwTwtnmHpqQYegKgq61pWtazQ2XqWRS9Gq
 BBQypXUlyNW22Ni6pFizTQSobpAe6BKO7aND/YePmfDGHNF5kP318u0rx
 SawYrC63b4g/platTt9z4BB5LJmQZKAIIlkNTT5UJ5eaJv0eE80GFZGr6
 KSm/p9vuYXQVt5yutOFKTRHgKg4c3kuCts7dCidTTb2H/6TR82RQmaYai
 j4LtdLwfPKngL/c96CKaPh8l2h77TivkCK5GtClXNJA6d7kUTjY8UYhdY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="472990950"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="472990950"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 23:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="901704623"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="901704623"
Received: from spalanis-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.62.239])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 23:32:25 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 09:34:16 +0300
Message-Id: <20231023063420.3298731-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] Revert remaining local fb tracking patches
 and backport
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are still two local frontbuffer tracking patches. Revert these
and backport same patches from upstream.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Jouni Högander (4):
  Revert "drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base"
  Revert "drm/i915/display: Move releasing gem object away from fb
    tracking"
  drm/i915/display: Move releasing gem object away from fb tracking
  drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base


-- 
2.34.1

