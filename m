Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92535C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103210E0E4;
	Fri,  2 Jun 2023 17:55:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6B410E0E4
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 17:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685728501; x=1717264501;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p76rhV0W0yakN9/EvllyHiWowSSwmlvPwXOzUYD1lBg=;
 b=WpHJO37GNGPqTc3TtnGLHBhc0AmrixYqiTa7AhmIvFvFAQTejQLpr/9r
 trh9R4TPsKXN9ctg9eH9MgbUWnurrHiQDVrIF77nmncDabH/dXKonyB/j
 3g1FxHuq9f4KYaa+3LsdINtn0JcFWkjvP4BnJ7fnFHlQH9873bKmTBTku
 DFHL0fxyMTWzVa5MfDK4KpZ25Q5m04LTbUuAsEByxEC+bXkDQJtWLsZTN
 gOESN+bM2yYOnszjiC381YDOdqYWYCwZIp2XEJRmVzVkCXt5s0d7thgLg
 iybD0OQfGkpINN2z6hJB/XNs7kVv9s2diDK7mhkkhYPk3Y/rFDZuOktm2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335543384"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="335543384"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="740897735"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="740897735"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:54:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 20:54:40 +0300
Message-Id: <20230602175444.3511273-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] drm/xe: replace commits with upstream backports
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

To hopefully to help with rebase, indicate which commits will be coming
from upstream.


