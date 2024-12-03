Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6950E74AC4
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 16:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842A110E253;
	Tue,  3 Dec 2024 16:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JADtg13I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35B710E253
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733244544; x=1764780544;
 h=message-id:date:mime-version:to:from:subject:cc:
 content-transfer-encoding;
 bh=EWU/+3DHWR8ViZqLDfbSfb2axfZ/36XLQ017iKg+n1o=;
 b=JADtg13IRc0EIXSJ+CBIOO3plnTKzu2v1X7b4s016UM01frD+CgMx3Pg
 v3S+yD+qMpGj4uUd7Dlka+pX0s6RTkqWFIq5gssVHvXOse/jIsRelZmX1
 7ieMnoKBHPUPMJyNSm5UGefz+tULb/o5Fn0QVr9AnSpDwJY7P3QobSb8S
 Zmmo255kFheil3eWacB+5TTeXQNKe6TQ/7srhYXt0VClER/eqVoMD8QD/
 fTJD1HvVs/1D/YIsULhlpOGKIrfxPftkxs80bJXk8ANY0QzBS+wbc/jdq
 gsxre5CxmNUYCglkcU2mWi9u6Lru2IvcSdV7igo2jpdQ1DjiXT/ocVibN g==;
X-CSE-ConnectionGUID: jZ+S7PPKTiC2MQPmu3RsOA==
X-CSE-MsgGUID: /SFBpOQxRT2jEyP0HNXhqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33529536"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33529536"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:49:04 -0800
X-CSE-ConnectionGUID: FJD2rd6iRCmHQSgtLOdINA==
X-CSE-MsgGUID: 5nJ+kzP0RbKoliWUdtmnoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93901730"
Received: from tponieck-desk2.ger.corp.intel.com (HELO [10.213.199.186])
 ([10.213.199.186])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:49:02 -0800
Message-ID: <734868cf-2f46-47b5-9f77-869164d50bb8@linux.intel.com>
Date: Tue, 3 Dec 2024 17:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-xe@lists.freedesktop.org
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: kmemleaks and our CI
Cc: katarzyna.piecielska@intel.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear xe kernel driver developers,

I am looking into sane ways to integrate kmemleaks with our CI. By sane I mean ways that will help us find and fix leaks while not overwhelming us with noise and our DUTs with unnecessary load.

It came to my attention that we may be running _all_ our CI tests with kmemleak enabled and scanning. To me this has two problems. The first is that it slows down memory allocation and freeing, no big deal.

The second problem however, is that if all our CI tests are indeed running with kmemleak enabled and scanning, it means that we are not testing our drivers in a kernel without kmemleak. I don't have numbers, but I assume that a large portion of real world use cases will have kmemleak disabled.

Is it a problem to run all our CI tests with kmemleak enabled and scanning?

Thanks,

Peter
