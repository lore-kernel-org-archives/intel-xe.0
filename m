Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EE1E9270D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DF310E423;
	Thu,  5 Oct 2023 15:31:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DEE10E02B;
 Thu,  5 Oct 2023 15:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519895; x=1728055895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4VIDYakzTWVz1JJ0DdK/h02azo/pYTxBRqidh9s4a6M=;
 b=Gn/CElmKm5BEWfAMckOlc6LHP0vTEyygjuY+ElOov9kA7IF/M0p7n9Hd
 aQjOoiywP5ArRLRctaXh0XXn+4gDaDFFTW+Bnz56rcYqr1lNy6ilfQf/p
 rbPi3Mh/GONDI0S4F6kxTMu9kozmTO0z9apPYjytara/hs10GigoUmb+d
 QjRZu463CDqmdTMN6FlcfP3PiQoS1AWgnPlhVIyCtzraSBnF1A+puLD+A
 8+gziR1Kw5WPxLgdoxS3fksONpmNj0b8BxzhPyISnto7sKnW16MmzMgz6
 Sse4Q8ufgx+lY+o/y8bAD0RYu2xa7eVBH78zicUu94KQyX+IHJN6jcXhi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810901"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810901"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631267"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631267"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:04 +0100
Message-ID: <20231005153116.452319-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 00/12] PAT and cache coherency support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Series implements the IGT side of things needed to support the new Xe uapi here:
https://patchwork.freedesktop.org/series/123027/

Branch with the IGT changes:
https://gitlab.freedesktop.org/mwa/igt-gpu-tools/-/commits/xe-pat-index

Branch with the KMD changes:
https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads

-- 
2.41.0

