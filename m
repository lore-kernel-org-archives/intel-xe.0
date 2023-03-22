Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725FAC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 14:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1AE10E38A;
	Wed, 22 Mar 2023 14:20:40 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DA610E38A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679494838; x=1711030838;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ReaMd6BTebTGCYJm/phw46tQDVMM4lbaQayCwKcSPHA=;
 b=m0Ct98Lc8FDRg+Er9VzNgOBs4p8RoFlmy+dQLS9WzuGGbHc+tfMnMYZ5
 DKb2/2EZhgloBBwbfw6v+RWI2Q1gqHBrfbA82RD1UrAJUuub6IxcqAkgS
 kVN2q/EP6222MP678cdLkihUHVdlKtn3QwJvciDa2dK6S0aM4gQ6E6FLu
 60NsUD/FXa+2fQX8rKdyI5brNo5+dmPmIermfaOYQQlNYfrlrKpqQaxn2
 1SBSsdZcDMPLlTmSZEvHOpaWmBX5R6ahs52b2E8eOWcwEeMtGXvZhlMyi
 iDEXyzjwzjRb4viY5MQY0QvXYQTyoOKie6PB/QvNjRX07svNGRafb16Ee A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336727370"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="336727370"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659201145"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="659201145"
Received: from ftbyrne-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:20:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Mar 2023 14:19:33 +0000
Message-Id: <20230322141936.297612-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] uAPI bits for small-bar
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

The remaining small-bar bits. Add support for requesting CPU access for VRAM
buffers. Also expose this to userspace, along with various bits of related
accounting. Finally turn on small-bar support.

-- 
2.39.2

