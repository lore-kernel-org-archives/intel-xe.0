Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556C2CAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 13:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140C010EA69;
	Fri, 26 Sep 2025 13:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxfLikb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA81C10EA69
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758894829; x=1790430829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ylXvV8/wHTQpGpcbyDKh148jswH/32AjrwtW4cD7tqQ=;
 b=OxfLikb5XYePb87dZKGhD4IqU9lwmBtSt+J6ZfUGZS2syXNw0bsouGeP
 n/LToHGCGci6WF8weQPj3YgcG21LmC6gw2uf5Tqqsbaemlg4mVsIqhoVQ
 ywcxu+1rUxBmVg/Tmvl6NeWE8b5sWyiSi6HwRixoNiZK3BS8VUDBZd+3u
 w5kmX3ZPqUBanH8tZI0hqtMxNj2BKAFJr9w+ZIWIKD8niihgj5ni7PZJU
 zN9IWxfVkal5cjR06ijZyLgYAddgZ23hjgHqP3Hohokg5uJ7ZQ2xBRiR5
 VyBnJyrlR4WFsuLxAqeWVHhg+0cgMa3hJB2KgqTKu6vYsS/BuSnTF2HyL Q==;
X-CSE-ConnectionGUID: a2iy7QVWQD+EO0tU0KqZUQ==
X-CSE-MsgGUID: 2N/y5SbsQVqA41heQVm+yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="78869675"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78869675"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 06:53:49 -0700
X-CSE-ConnectionGUID: qkyWiWIdQ/KlPaZPz//D6g==
X-CSE-MsgGUID: O1dVL7KiQjKKpszBahJ8Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="178002785"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 06:53:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe/hw_engine_group: Fix double write lock release in
 error path
Date: Fri, 26 Sep 2025 06:53:30 -0700
Message-ID: <175889479849.2301993.6910058737926110609.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250925023145.1203004-2-shuicheng.lin@intel.com>
References: <20250925023145.1203004-2-shuicheng.lin@intel.com>
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

On Thu, 25 Sep 2025 02:31:46 +0000, Shuicheng Lin wrote:
> In xe_hw_engine_group_get_mode(), a write lock is acquired before
> calling switch_mode(), which in turn invokes
> xe_hw_engine_group_suspend_faulting_lr_jobs().
> 
> On failure inside xe_hw_engine_group_suspend_faulting_lr_jobs(),
> the write lock is released there, and then again in
> xe_hw_engine_group_get_mode(), leading to a double release.
> 
> [...]

Merged to drm-xe-next, thanks!

[1/1] drm/xe/hw_engine_group: Fix double write lock release in error path
      commit: 662d98b8b373007fa1b08ba93fee11f6fd3e387c

--
Lucas De Marchi

