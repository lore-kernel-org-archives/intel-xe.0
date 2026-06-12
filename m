Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A31FCD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 22:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A895E10E33A;
	Fri, 12 Jun 2026 22:50:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521A710E33A;
 Fri, 12 Jun 2026 22:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/1=5D_drm/xe/guc=3A_Handle_GuC_local_uncorrectable_error_not?=
 =?utf-8?q?ifications?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 22:50:03 -0000
Message-ID: <178130460332.75226.15908112169214159796@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612224447.184636-1-zhanjun.dong@intel.com>
In-Reply-To: <20260612224447.184636-1-zhanjun.dong@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v2,1/1] drm/xe/guc: Handle GuC local uncorrectable error notifications
URL   : https://patchwork.freedesktop.org/series/168465/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b0922cb816682d868e5dd1290d6f3d843c6be396
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Fri Jun 12 18:44:47 2026 -0400

    drm/xe/guc: Handle GuC local uncorrectable error notifications
    
    Add support for the GuC uncorrectable local error G2H notification and
    opt in to the feature when the submission ABI exposes it.
    
    When the notification targets a known exec queue, treat it like an
    engine reset request and route it through the existing timeout cleanup
    path. This keeps the queue teardown, pending job cancellation and error
    capture in one place instead of open-coding a parallel recovery flow.
    
    The timeout worker also needs to cope with this externally triggered
    reset path. Keep permanent or wedged queue destruction asynchronous when
    the timeout path is already running from a scheduler worker.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 5fc0f82c971ea3b4e1c58602c0be573a802a8670 drm-intel
b0922cb81668 drm/xe/guc: Handle GuC local uncorrectable error notifications
-:81: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#81: FILE: drivers/gpu/drm/xe/xe_guc.c:651:
+		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION);

total: 0 errors, 1 warnings, 0 checks, 167 lines checked


