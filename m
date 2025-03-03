Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B50C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5872410E4C2;
	Mon,  3 Mar 2025 19:27:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8878110E4C2;
 Mon,  3 Mar 2025 19:27:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Escalate_Gu?=
 =?utf-8?q?C_load_failure_immediately_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 19:27:42 -0000
Message-ID: <174103006255.231733.12373270755075740765@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213213901.2191463-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250213213901.2191463-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/guc: Escalate GuC load failure immediately (rev3)
URL   : https://patchwork.freedesktop.org/series/144637/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fea7e1b44c71c80cbd4829ed00c0b2f12bfb0029
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Feb 13 13:39:01 2025 -0800

    drm/xe/guc: Escalate GuC load failure immediately
    
    When the Xe was first introduced, we intentionally avoided escalating
    GuC load failures, to not abort mid-probe. Xe is now mature enough and
    we gracefully handle probe failures, so we can start escalating
    immediately.
    
    Note that even without this patch the probe is still aborted because
    the attempt to enable CTs after GuC load will fail and that failure is
    already escalated.
    
    v2: only return success if the load_done variable is 1 (Tejas)
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch 1fc9fc137d77154d162674c1648f148e29858725 drm-intel
fea7e1b44c71 drm/xe/guc: Escalate GuC load failure immediately


