Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989B1C47422
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60710F961;
	Thu, 25 Jan 2024 16:59:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D629410F951;
 Thu, 25 Jan 2024 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706201950; x=1737737950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R91APdknSS5DlsR/+WgyJtBCXonuMZ4947/EIdzC3Fo=;
 b=TzDCJGGIB1wCx6XLplzkrzV0cRivv1fLvG7yepDardug7LERdoLGxZAD
 jkNb2eTAIy79pTFzaZAi1cTUn3fu/4fXmnS0SxQvQnv/n9tiXCDEvD6MH
 mP+D0WbcclT8cfEZEPJT7XzIuRc+VKagBhVjoh1cSUoYijXOab9aYnQ0R
 7xoZryO13UXvYox3wUMDjfMvUfOtcMKIOo766McQPEEpTrLwXRrQK1Xra
 l2rJpXEfENVoRdlTks8ViGhygcYbwNGGyjWnti+kv/j7TmtX7cB1vjpsT
 Xvk4/WePBp4GaF0IcIo9GGEk/HQgmx+JlUW4KA6zQgQyuJwDgImOIzMo+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="23682470"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23682470"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="786819862"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="786819862"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.20.225])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:58:21 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] lib/kunit: Support writable filter* parameters of
 kunit module
Date: Thu, 25 Jan 2024 17:52:09 +0100
Message-ID: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of wasting resources on reloading the base Kunit module each time
a different set of filter parameters is needed, try to write the required
values to sysfs representation of those parameters.  If that fails (e.g.
on older LTS kernels with read-only filter parameters), fall back to
reloading the module.

This change also provides a workaround for the issue of impossibility to
unload the base Kunit module on Xe platforms, available as soon as the
module supports writable filter parameters.

While being at it, fine tune processing of skips on errors during test
case list collection phase.

Janusz Krzysztofik (3):
  lib/kunit: Support writable filter* parameters of kunit module
  lib/kunit: Report early kernel taints explicitly
  lib/kunit: Process module remove error after list errors

 lib/igt_kmod.c | 152 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 110 insertions(+), 42 deletions(-)

-- 
2.43.0

