Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82F4C001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 13:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFBF10E216;
	Tue,  8 Aug 2023 13:54:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48AAB10E216;
 Tue,  8 Aug 2023 13:54:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 45052AADD7;
 Tue,  8 Aug 2023 13:54:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 08 Aug 2023 13:54:41 -0000
Message-ID: <169150288127.13862.5628992833252072435@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230808091903.114939-2-matthew.auld@intel.com>
In-Reply-To: <20230808091903.114939-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/guc=5Fsubmit=3A_fixup_deregister_in_job_timeout?=
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/guc_submit: fixup deregister in job timeout
URL   : https://patchwork.freedesktop.org/series/122147/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7276754eae731ddf9b127c7a6d52d69f7f20562f
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Aug 8 10:19:04 2023 +0100

    drm/xe/guc_submit: fixup deregister in job timeout
    
    Rather check if the engine is still registered before proceeding with
    deregister steps. Also the engine being marked as disabled doesn't mean
    the engine has been disabled or deregistered from GuC pov, and here we
    are signalling fences so we need to be sure GuC is not still using this
    context.
    
    v2:
     - Drop the read_stopped() for this path. Since we are signalling
       fences on error here, best play it safe and wait for the GT reset to
       mark the engine as disabled, rather than it just being queued.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 958ba208e7f87b2055481d49aa77c3842357f412 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


