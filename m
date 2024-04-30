Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F313C19F53
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 13:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECE010F933;
	Tue, 30 Apr 2024 13:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckN9+ONb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A5B10F933
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714482946; x=1746018946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fZDWymzEnQQxrPSwJ++ZMsxwDSCbTULq4ro1LLYTumU=;
 b=ckN9+ONb4o9Xi5buDt6evOHenhRv3aq0qzZaC99aAdA8uTXr+dhNfmn6
 h/u5NiGr3evIE0BAIwZDT2UiwN1yArPLkfA5XWNG6Ry9stS1VrCc217m1
 GfBdAs2Te6f/LxLQ77Vwq8BREJkc3Q2MlgXY1mRwOF/L6n9eMkXtqlxcN
 USkta0HG+ev/lTtdpoN2uPqWKSmnYM5MBHuw2XbWJiRuRLW7maDcm23lW
 JuSP5l/MNhufORrRpXyDGGt0riX7YiXiX5V1XbGjVQVKunrNT9Cp+k2th
 vL7oqPTIDUNqqHYuiI2MB3Qz9Rxm7zpq+cHA/gKGnFUJhoQdVMyZN6mih Q==;
X-CSE-ConnectionGUID: kT1KbsD/RXKVoPkIiEDsCA==
X-CSE-MsgGUID: ObbpeKnvRnud04l1fmzP7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10038232"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10038232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:15:45 -0700
X-CSE-ConnectionGUID: yQG7xOWvTV+GkMptb/vSPg==
X-CSE-MsgGUID: an623OjMR9W9PWJEUU2u3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26325317"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:15:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Nirmoy Das <nirmoy.das@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Remove uninitialized end var from
 xe_gt_tlb_invalidation_range()
Date: Tue, 30 Apr 2024 06:16:22 -0700
Message-ID: <171448296216.3547940.754154107261227666.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429203039.26918-1-nirmoy.das@intel.com>
References: <20240429203039.26918-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Mon, 29 Apr 2024 22:30:39 +0200, Nirmoy Das wrote:
> This fixes commit c4f18703629d ("drm/xe: Add
> xe_gt_tlb_invalidation_range and convert PT layer to use this")
> which added the end variable as part of the function param.
> 
> v2: Add fixes tag(Matt)
> 
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range()
      commit: e29a7a34c3cf140ceb2f994a8eae0b68d21e357e

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
