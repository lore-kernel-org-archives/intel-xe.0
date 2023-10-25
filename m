Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB278C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9614710E6BF;
	Wed, 25 Oct 2023 17:28:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF1210E6BF
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698254926; x=1729790926;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D/meAZW87qnw0BiHRzMFJbmgBt+1hmR2ekFf4EKp9LQ=;
 b=NuJXxin5DE9bnYxmHe6INNspLCumdxbaK3ApJqZaZEzqi+a36F2Z6vFO
 QBlyjQfYUz2psfsFnzo7UdfCwpPwJZJTz8sIRJp6BUVKBmzWrLTzAPoee
 6UBcL+m9f1Q9GlaJ6Zv7X5QIOM5yWU3z3rBu27KNWYxlTpYvM27Fro9Wv
 rcRJ8DM3pDjByVXPkTDkPPl8sJmmZOheoAD219TnSjhVl8gtEuNR8l/vx
 5TFvXRIG8/4XLcz3ipb/U1HZj+IlhblU39NO13W5gWmXvGlFsUtJnbleF
 D3zTfj5wdNP6x30OZ5OK+W1dlQ4hrU9rQ505RnVs/Ma/izOmkcOI9Br2N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391230387"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="391230387"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932432646"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932432646"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.83])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:28:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 20:28:34 +0300
Message-Id: <20231025172836.770398-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] Replace "drm/i915: Abstract display info away during
 probe" with upstream version
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

This is a bit silly, but gets the job of annotating the commit done.


