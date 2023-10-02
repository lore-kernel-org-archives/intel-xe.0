Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E5E784B2
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 11:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E5B10E28E;
	Mon,  2 Oct 2023 11:03:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDD610E289
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696244592; x=1727780592;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=OA8ulvk82sNCJ2AZVB9Le+6G8YD3n7fjA7m6tJ53jd4=;
 b=MOA9woc7rPaJcrc44rk77WR0R/3vNd+IMrDUHn27n/Q0V4R7ELtFmeQC
 Of5MSikj8qh+ynr32TmCYGGR6uISlSAWnzp6VruMl1u8zpcjtW9Wybxhp
 Y5pAqvtVE/Z4n0qzofN1fNy97I2jIhUmE+79rW174/ZgbaF+ZhrVDUhZs
 +5CzH3NtD9IwZ1LHUlvg9JQNpR0BVk1EX9VQgFX3Lae4L1JEnLh/nKSzY
 ByFpKb49lgRVzKdIZz5rc6pVcqpqH1p98qA8iMctNcXKJMfLUGK0hQDJh
 OzONUozyy009uR1LhpI9lazspKk69+TrsfKDfh8bGlwT+R9vbiRpXG8yF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="413532686"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="413532686"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 04:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="1081606064"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="1081606064"
Received: from svandens-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.151])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 04:03:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 02 Oct 2023 14:03:02 +0300
Message-ID: <87leclguc9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [Intel-xe] separate i915 changes from existing commits
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


Some commits have slipped through where we modify core xe and i915 in
the same commits. They'll become a problem when the commit order is
modified for upstreaming, core first and i915 (display) changes next. To
that end, I split them out [1]. The commit messages are dumb, but act as
fixmes.

Rodrigo, can you pick this up and push out? There's no diff to current
drm-xe-next. If you need modifications, it's not a big deal for me to
redo this.


BR,
Jani.


[1] https://gitlab.freedesktop.org/jani/xe/-/commits/xe-i915-commit-split-2023-10-02

-- 
Jani Nikula, Intel
