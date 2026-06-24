Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70E3CDB471
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 11:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B36410E081;
	Wed, 24 Jun 2026 11:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZj4h7yZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9190010E081
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 11:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782301138; x=1813837138;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8vTDzBvH8fHTaXxLS2VDubnIwBP0dgXeZ9X+qFhACt0=;
 b=WZj4h7yZx2GyAUYogYmH6NhVxYC/X8mIjajAjVJYXoMH91dDWiTRoo0g
 u30DYtIQiU9Po9BIMK1wJ3vTFGPeS7cIhj/VpJYIQXpKjvPoP3EmMeFUU
 sTYkrpFFluycuDwb8KXTaXkKa4WDoPavqP4CCLLO2Qpgetff8tKPMh+1I
 MuYnWDAaiE8JvHbuezzYgoyUvJRUBmEOi02W8DDN9YSplAKDmLzBQGqsU
 Oq1xxpDxF1pXi+zNRNeuO9T6SYV44X8F3K+2xckkQkFJON61cXBFeT/kd
 /7a1tTvjQvTqwK35lho+7fyGohg4RlxtulxCmDxtaZOkEjlvmrrMZqcUZ Q==;
X-CSE-ConnectionGUID: zydYxssjQv2iE0L4Yon6sg==
X-CSE-MsgGUID: sWShhwPbR6OWovEJp4ea/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83109450"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83109450"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:38:58 -0700
X-CSE-ConnectionGUID: T8XpYSwESOOIB+BfHUop2w==
X-CSE-MsgGUID: Dgib6KQCQ12Ijq+PS2unyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="243443556"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.217])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:38:57 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Couple fdinfo improvements
Date: Wed, 24 Jun 2026 12:38:38 +0100
Message-ID: <20260624113837.342961-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

-- 
2.54.0

