Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E14CD5BBF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 06:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53010E04A;
	Mon, 25 May 2026 06:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3OfT230";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DAB10E04A
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 06:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779689871; x=1811225871;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dCC0sEESUb1etqoFO8rVdb2GRV7YZEMO8OkdS8FeKjY=;
 b=U3OfT230PE9OVCbBaMoLBx7GViYOMeBNDLYvL4W9isr30Bq9UFGbWP4D
 tqgL2siUbmibzp3iK8TiS3UU7UYuxupIK4b+ZCwVK4OeShh2SysZkfKSW
 EHx3+HuIkuxP2t8SZFC7FRP1M3643zTDSNms4hMe/Fi8G1CQbXXbT4Nlk
 CzdH2paJwm2SHIaV5M0d0kmx4kHHIBKndF40Ub+s3Y+GnlzO2b+uPp1iO
 +y4/rzUvM1WtsHOOUUdoo2VIgiZF7rB1LsSCeZwYfhspJid6DvMvEofbc
 H6KxoLFjUoKhpt7o5ynK5HRhVbr6baTam1hFQa19Z3pNteq7t39J4Jf6V Q==;
X-CSE-ConnectionGUID: xPUVSEFyQDmWD5rwshAFTw==
X-CSE-MsgGUID: 7NBaRhzXSyC9EZSdJGirmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80542328"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="80542328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 23:17:50 -0700
X-CSE-ConnectionGUID: zFSz3IguQ7SI3EH8b4uCKA==
X-CSE-MsgGUID: qE6FDQk2SqakjsFe3eNeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="240677197"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa010.jf.intel.com with ESMTP; 24 May 2026 23:17:49 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v2 1/2] drm/xe: Fix return type of disable_late_binding_set()
 in debugfs
Date: Mon, 25 May 2026 11:41:29 +0530
Message-Id: <20260525061129.2170333-1-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521060911.2112210-2-mohanram.meenakshisundaram@intel.com>
References: <20260521060911.2112210-2-mohanram.meenakshisundaram@intel.com>
MIME-Version: 1.0
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

> > Fix disable_late_binding_set() to declare 'ret' as ssize_t instead of
> > int, consistent with the function's return type.
> 
> but then it would be inconsistent with the kstrtobool_from_user() type
> 
> OTOH promotion from 'int' to 'ssize_t' is perfectly fine
> 
> so I prefer to leave the code as-is, or if you really need to touch it
> just s/ret/err to make it more clear about the intended scope/use
> (but we don't have such a strict naming rule in the xe)
> 

Yes agree, but i saw another function page_reclaim_hw_assist_set(), which declared ret as  
ssize_t and used in kstrtobool_from_user() return.

So thought of keeping this consistent across this xe_debugfs.c file and added this change.

Thanks

> > 
> > Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 22b471303984..9800e3fc4c07 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -528,7 +528,7 @@ static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
> >  	struct xe_device *xe = file_inode(f)->i_private;
> >  	struct xe_late_bind *late_bind = &xe->late_bind;
> >  	bool val;
> > -	int ret;
> > +	ssize_t ret;
> >  
> >  	ret = kstrtobool_from_user(ubuf, size, &val);
> >  	if (ret)
