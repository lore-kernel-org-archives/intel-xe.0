Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214DAEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74B210E46E;
	Thu,  6 Jul 2023 16:20:49 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7877610E46E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660448; x=1720196448;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kOwsNuVg5cI98ZOdFmfY/8xjGVs2GSzoOi6duw7/qGI=;
 b=nMaXkvy/YSPJ+W1IuOn1Viqgf+/goEpsHPqR7F5+MAxvs0EWvEKSYMk6
 6IXngX3b2QPa8nYZiNJABJKXqrbjVEAouPb0aLuYJRdj43QzyTe63Z8Nf
 dPpOpAeRPgAdKTlFGIe3Dp/mYdRLM34u76Fn8sCmmAwK/M4g98ZwqnaZw
 CMEYnQisBjB44JE4Mr5/k7CIMwKbo5eDtpbJFe5/UUbpgdYJUK5BwTiWp
 Njri8Q/69q5MYplikgRuY+x7CZ9cR/ocJsmX4N4JzrhmacQWu6JKTBQeo
 oKOalpvgTY6JuIF7RqzOc8Wn7rUmg/m/LnsKntDdShTN6kx+0QFvPjACA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409292"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409292"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722849830"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722849830"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:04 +0100
Message-ID: <20230706162003.427026-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 00/10] Try to handle TLB invalidations from CT
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

v4:
  - Various tweaks. Big thing is to make sure we grab the fast_lock for the g2h
    reservation when doing the CT send, which closes one big race with the CT
    fast-path.
v5:
  - Various improvements. Fix the race with adding a fence after its seqno has
    already been signalled. (Matt Brost)

-- 
2.41.0

