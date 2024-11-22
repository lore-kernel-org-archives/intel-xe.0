Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD4E69191
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 20:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3596910E096;
	Fri, 22 Nov 2024 20:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyR+NhOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60CF10E096
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 20:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732307896; x=1763843896;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GbrSYLMQKA0DJqhkSmEzYK81+wKCa9/AO/xW+EuoDT8=;
 b=nyR+NhOsibIoRB/AmnGndvjIx9OdPpdlezxWzekwKPTVqAa4kNyTlCOX
 AhiL12IMdxNhT+DvLdfcEnR5ydiflitXCScqIE1Xk7ZggEjskKqjBzvpE
 6Gbcr6ntQkrgoZniirMe2lt2WPViWn71o5SP2hxnSuDm9oSH90St6q2zP
 qdZpP4/7kSIJZciGkkRgm/f1kY+MVDBzPQTXGwJ7Tkz+KT/W0caxOWldg
 8Jv4LR4WD8uWZPT2zWk1RS97dm0dAiMstxx8v2sNhNWRE7TUEimsUuGH+
 9uPGd0+q4owe7XaxMJwNTqr6nJWV/+65ew7s5feTbw+LFuREsIKNBxLth g==;
X-CSE-ConnectionGUID: bDfeHcaATFWQGBcINAxlNg==
X-CSE-MsgGUID: jElGch/rSD+dpObKpb1xzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36251744"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="36251744"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 12:38:09 -0800
X-CSE-ConnectionGUID: 0U/+riscRlqAjF/nKipjow==
X-CSE-MsgGUID: i4OABZIySDGkO9iL5n4M4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90478123"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 12:38:08 -0800
Date: Fri, 22 Nov 2024 14:38:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 topic/xe-for-ci] drm/xe/ptl: Update PTL GuC revision
Message-ID: <g4fnwwuyczq5ocbpddxqdyg6ngkqga2a5ypbhzg4fshv3avvb2@ippavld7gwii>
References: <20241121225518.10986-1-matthew.s.atwood@intel.com>
 <5133b46a-f9e8-4d64-97a3-5016b5037f79@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5133b46a-f9e8-4d64-97a3-5016b5037f79@intel.com>
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

On Thu, Nov 21, 2024 at 03:11:41PM -0800, John Harrison wrote:
>On 11/21/2024 14:55, Matt Atwood wrote:
>>Update PTL guc version to 70.36.0.
>>
>>v2: Fix typo in commit message
>>
>>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

pushed to topic/xe-for-CI branch, thanks.

Lucas De Marchi

>
>>---
>>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>index b0deb082ab2b..9c14b0adad0c 100644
>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>@@ -107,7 +107,7 @@ struct fw_blobs_by_type {
>>  };
>>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>>-	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
>>+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
>>  	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>>  	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>>  	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>
