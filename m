Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D34BE77188
	for <intel-xe@archiver.kernel.org>; Sat, 21 Dec 2024 01:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74EA10E032;
	Sat, 21 Dec 2024 01:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7+mhx25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1DA10E032
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Dec 2024 01:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734743257; x=1766279257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rLAD17uaw6RIbYeIx8Rz5yPwfhPTxOJyq7rwF9fqHsA=;
 b=j7+mhx251oPeb5J5dWF50aWw7Pz5ZgJrxJTM5/QIV/QyeqkrcdkMCtPg
 hm+rSwez4zKI3U9sf7uyJCCS05RYhCsMoCIjoJDuPeG4um8bji1mHeyAm
 pijJX4u33QJB4W3za36Px5stxDz529F6GZ/BQnOi6Hc2A6avsRLcTF7y+
 zfqMsr38CWZOGXDMlzRUL43iRMVEUEJcOgdkB+b20wglrVGkAB65CYYXH
 vbFm72skEXP+I0BIoUxQUZFNiOD+1hGOSjcS1abwXboQMS3Ot48J8zKWK
 8ZfisIUwmSSiS1gADhZ2Juco7DdFn30/rve5UWPMhNND2ghFcWYgwx1lO A==;
X-CSE-ConnectionGUID: 5dDDg75qRSifRFRAN8WWeg==
X-CSE-MsgGUID: 7dpeLdJKTgmsy31HoPXLLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35445303"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="35445303"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 17:07:37 -0800
X-CSE-ConnectionGUID: CqQ+jf2bS7i2RdX0maGxDA==
X-CSE-MsgGUID: ZdN9QeMURAmpGedUWJbYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98497986"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 17:07:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: matthew.brost@intel.com
Subject: Re: [PATCH 1/2] drm/xe: Fix fault on fd close after unbind
Date: Fri, 20 Dec 2024 17:07:22 -0800
Message-ID: <173474304519.3276912.1429450769619137751.b4-ty@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218053122.2730195-1-lucas.demarchi@intel.com>
References: <20241218053122.2730195-1-lucas.demarchi@intel.com>
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


On Tue, 17 Dec 2024 21:31:21 -0800, Lucas De Marchi wrote:
> If userspace holds an fd open, unbinds the device and then closes it,
> the driver shouldn't try to access the hardware. Protect it by using
> drm_dev_enter()/drm_dev_exit(). This fixes the following page fault:
> 
> <6> [IGT] xe_wedged: exiting, ret=98
> <1> BUG: unable to handle page fault for address: ffffc901bc5e508c
> <1> #PF: supervisor read access in kernel mode
> <1> #PF: error_code(0x0000) - not-present page
> ...
> <4>   xe_lrc_update_timestamp+0x1c/0xd0 [xe]
> <4>   xe_exec_queue_update_run_ticks+0x50/0xb0 [xe]
> <4>   xe_exec_queue_fini+0x16/0xb0 [xe]
> <4>   __guc_exec_queue_fini_async+0xc4/0x190 [xe]
> <4>   guc_exec_queue_fini_async+0xa0/0xe0 [xe]
> <4>   guc_exec_queue_fini+0x23/0x40 [xe]
> <4>   xe_exec_queue_destroy+0xb3/0xf0 [xe]
> <4>   xe_file_close+0xd4/0x1a0 [xe]
> <4>   drm_file_free+0x210/0x280 [drm]
> <4>   drm_close_helper.isra.0+0x6d/0x80 [drm]
> <4>   drm_release_noglobal+0x20/0x90 [drm]
> 
> [...]


Thanks for the review. Both patches pushed to drm-xe-next.

Applied, thanks!

[1/2] drm/xe: Fix fault on fd close after unbind
      commit: 4ca1fd418338d4d135428a0eb1e16e3b3ce17ee8
[2/2] drm/xe: Use q->xef for accessing xe file
      commit: 2054d38ccf708e1add482c6345f7f349059b56e0

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
