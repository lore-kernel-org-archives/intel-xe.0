Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F07EB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 13:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA6610E13E;
	Tue,  4 Jul 2023 13:46:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986A110E13E
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688478373; x=1720014373;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MlYH1vpo+wYopYdJ3KxP/vpM50b/0/TM9K812Gq9p94=;
 b=HAvTtah24SjqqZv68zjoejumAoUiIc9sWEnROpqon3+dcKFHn85IGI3+
 dQgvP8I8jJh1H5ElvGcS3MrJv9FJ0wQlYykf/6417xxE51vCocJVjy6vy
 ooh10A5lCTeH/He5vr9P3uWyLVNuppLpaO4/R+3gREiKp1Kn0Be2QKPIT
 m/BI2LcFCoKKcDKZObl85eUVB67qsOqi7EojUzLY/bFJBKHzWkS+QUiqd
 mmC482360zQqH6hAwehzMakElmnE8up2o1RonAMeNkRJmdAP2JI4EVeFf
 V8Tja2INf+uI0CTfmIxGw3v56gHyr64f2U9n/Po26kjw0/ueK76dHEJ0s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361989259"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="361989259"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 06:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712888680"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="712888680"
Received: from izharayx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 06:46:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 14:45:25 +0100
Message-ID: <20230704134524.138377-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/5] Try to handle TLB invalidations from CT
 fast-path
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

In various test cases and workloads that put the system under a heavy load, we
can sometimes see errors with missed TLB invalidations. If we handle the TLB
completions directly from IRQ we can see a big improvement.

-- 
2.41.0

