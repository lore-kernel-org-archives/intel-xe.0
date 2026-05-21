Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43387CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347C10E450;
	Thu, 21 May 2026 06:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OK3a1fre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0AF10E164
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 06:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779343795; x=1810879795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZBprSOJoNizGBuY3dYS0ahkU+mr0QCB1FQj8dqoM1Cg=;
 b=OK3a1frenTvuY8jbs6tSk0K5gCBDaOtDSNQvKMW9ldACq3d+FTUgWVAt
 aJXmov+IJ8SSV2sEvICyTDLDMZTNKqE4gUVjJo8QtNt0sIlebxF99Yw5s
 sgSe7bg43C4KZRfYWLP7eG1lJC94hEEnREXsiTRlkEItmR60In3VvR4uu
 bY6b+OQ6ws2qd9WqCNvSyB1CPdRaQXoUJnUEHLQgD13UMvv2U6Al7qP/D
 EBCdzcJnPfYxV3Q/1RcgIJL00m+9Ibs+EroWE3YmDQElr15wKrKQLhadF
 nGfDuYjBp/O43ZACA8u8VhU/k31/M0c4oJYYrTA6telq0Qxx+Dl2LS7+P A==;
X-CSE-ConnectionGUID: FYJ41vfXR4mQo+6qpYUPQw==
X-CSE-MsgGUID: c7lzOgdsQY+crEFBwUHkHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80288817"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80288817"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:09:54 -0700
X-CSE-ConnectionGUID: FWUVa4TqTX2E5LqX+SEz7A==
X-CSE-MsgGUID: rp/qGZMcSievOtn7ANSXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="278552305"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa001.jf.intel.com with ESMTP; 20 May 2026 23:09:52 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Cc: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Fix return type and adjust variable
Date: Thu, 21 May 2026 11:33:36 +0530
Message-Id: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
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
> > 
> > Also remove '0' initializations for the 'len' variable in
> 
> If you do both in the same patch, please adjust the subject/title
> line to something like:
> 
> drm/xe: Adjust variable initialization in xe_debugfs.c
> 
> or something like that that is generic enough.

Yes agree, created 2 seperate patch for more cleaner, Please review the V2 patch

Thanks

> 
> > four debugfs show functions (wedged_mode_show,
> > atomic_svm_timeslice_ms_show,
> > min_run_period_lr_ms_show, min_run_period_pf_ms_show).
> > The variable is updated immediately on next line by scnprintf(), so
> > the
> > initialize to '0' not required.
> > 
> > Fixes: 62519b77aeca ("drm/xe: Fix memory leak when handling
> > pagefault vma")
> 
> I can't see how this commit 62519b77aeca has anything to do with this
> patch
> here....
> Please provide a proper fix or simply remove it.

Yes Agree, Removed.

Thanks


> > Signed-off-by: Mohanram Meenakshisundaram
> > <mohanram.meenakshisundaram@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 22b471303984..675cc0ddd83b 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -282,7 +282,7 @@ static ssize_t wedged_mode_show(struct file *f,
> > char __user *ubuf,
> >  {
> >  	struct xe_device *xe = file_inode(f)->i_private;
> >  	char buf[32];
> > -	int len = 0;
> > +	int len;
> >  
> >  	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
> >  
> > @@ -411,7 +411,7 @@ static ssize_t
> > atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
> >  {
> >  	struct xe_device *xe = file_inode(f)->i_private;
> >  	char buf[32];
> > -	int len = 0;
> > +	int len;
> >  
> >  	len = scnprintf(buf, sizeof(buf), "%d\n",
> >  	xe->atomic_svm_timeslice_ms);
> >  
> > @@ -446,7 +446,7 @@ static ssize_t min_run_period_lr_ms_show(struct
> > file *f, char __user *ubuf,
> >  {
> >  	struct xe_device *xe = file_inode(f)->i_private;
> >  	char buf[32];
> > -	int len = 0;
> > +	int len;
> >  
> >  	len = scnprintf(buf, sizeof(buf), "%d\n",
> >  	xe->min_run_period_lr_ms);
> >  
> > @@ -480,7 +480,7 @@ static ssize_t min_run_period_pf_ms_show(struct
> > file *f, char __user *ubuf,
> >  {
> >  	struct xe_device *xe = file_inode(f)->i_private;
> >  	char buf[32];
> > -	int len = 0;
> > +	int len;
> >  
> >  	len = scnprintf(buf, sizeof(buf), "%d\n",
> >  	xe->min_run_period_pf_ms);
> >  
> > @@ -528,7 +528,7 @@ static ssize_t disable_late_binding_set(struct
> > file *f, const char __user *ubuf,
> >  	struct xe_device *xe = file_inode(f)->i_private;
> >  	struct xe_late_bind *late_bind = &xe->late_bind;
> >  	bool val;
> > -	int ret;
> > +	ssize_t ret;
> >  
> >  	ret = kstrtobool_from_user(ubuf, size, &val);
> >  	if (ret)
> > -- 
> > 2.34.1
> >
