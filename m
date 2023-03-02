Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF1C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 12:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5D610E168;
	Thu,  2 Mar 2023 12:43:27 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAE610E168
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677761005; x=1709297005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Aquj9XXq8oF1jvBB1z6ygMlbZs8KcdgNzHQ/0DgeTDc=;
 b=Azz6393+jSghCyWgFdlf8znyYLbwDkUdYEzM0F41/yiOP6pm4PVRVH/j
 vr6EMACqcooyx+ANtZtFaQ+pdz1DLmjZrl/Ut7fKqY17wwseT+zoDQZvQ
 qpeHfGQItfra2G0ibSEcUg+cnKnWJFrbL47IxE0YsEHboMTH21OzbpfdO
 lnkLmnTnKqaCcEHAjE1B3iH+fy3U+k72g1qaCV8A/NixYVmoM793Au1sq
 5Hp9/erGv5s9axr9Cbcyktw1XKXfK9fZuLhLZyIfS/4UxmPvlUF9BB6vO
 TUi+EYqHmCMA6jtg+jy4RViPqAJs5i6WgvJnDTYDPVrBJq1S4X0ln5nto w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="322982397"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="322982397"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 04:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="707403001"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="707403001"
Received: from fathuddx-mobl.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.102])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 04:43:23 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 13:42:56 +0100
Message-Id: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Fix kunit test building and missing memory
 reference
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

Two small fixes that should help us run (some of) our Kunit tests again.

Thomas Hellström (2):
  drm/xe/tests: Remove CONFIG_FB dependency
  drm/xe/tests: Grab a memory access reference around the migrate sanity
    test

 drivers/gpu/drm/xe/Kconfig.debug      | 1 -
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.39.2

