Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1B4C25B7A
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B87C10E05B;
	Tue, 21 May 2024 14:53:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A29310E13A;
 Tue, 21 May 2024 14:53:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uc=3A_Don=27t_emit?=
 =?utf-8?q?_false_error_if_running_in_execlist_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 14:53:41 -0000
Message-ID: <171630322123.2162685.14370492970939853216@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521114857.712-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240521114857.712-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/uc: Don't emit false error if running in execlist mode
URL   : https://patchwork.freedesktop.org/series/133877/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f1cde4f6fe3fe96b9e9fa6b0b96f1072ef026b43
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue May 21 13:48:57 2024 +0200

    drm/xe/uc: Don't emit false error if running in execlist mode
    
    When running in execlist mode (using force_execlist=1 modparam)
    we incorrectly select the error path in xe_uc_init(), leading to
    an unwanted error message like this:
    
    [ ] xe 0000:00:00.0: [drm] *ERROR* GT0: Failed to initialize uC (0000000000000000)
    
    Fix that by doing early return like we do in other similar cases.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 413686054e38d01eb91dfb49d665d1ab7d004848 drm-intel
f1cde4f6fe3f drm/xe/uc: Don't emit false error if running in execlist mode
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
[ ] xe 0000:00:00.0: [drm] *ERROR* GT0: Failed to initialize uC (0000000000000000)

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


