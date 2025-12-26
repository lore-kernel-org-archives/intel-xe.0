Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E39E8FDA7
	for <intel-xe@archiver.kernel.org>; Fri, 26 Dec 2025 17:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13FD10E1F0;
	Fri, 26 Dec 2025 17:11:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C6F10E1F0;
 Fri, 26 Dec 2025 17:11:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=3A_Test_Xe3L?=
 =?utf-8?q?PD=5F3002_DMC_v2=2E28_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Dec 2025 17:11:15 -0000
Message-ID: <176676907585.117957.7234871383231387712@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251226170510.73508-1-gustavo.sousa@intel.com>
In-Reply-To: <20251226170510.73508-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc: Test Xe3LPD_3002 DMC v2.28 (rev3)
URL   : https://patchwork.freedesktop.org/series/159473/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b845214099153b47a3078b4cbcc0cb337890e34c
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Dec 26 14:00:55 2025 -0300

    drm/i915/dmc: Test Xe3LPD_3002 DMC v2.28
    
    NOT TO BE REVIEWED/MERGED
    
    Hardcode path to DMC firmware for CI purposes only.
    
    This failed to find the DMC blob in the previous 2 submissions ([1][2]), due to
    some technical issues.  I just checked that CI should have the required blob
    now, so hopefully now this one will find it!
    
    [1] https://lore.kernel.org/intel-xe/20251224200401.47180-1-gustavo.sousa@intel.com/T/
    [2] https://lore.kernel.org/intel-xe/20251226133354.21333-1-gustavo.sousa@intel.com/T/
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 1f54dd2842aef5f10d953775d27df05c2dda4655 drm-intel
b84521409915 drm/i915/dmc: Test Xe3LPD_3002 DMC v2.28
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
This failed to find the DMC blob in the previous 2 submissions ([1][2]), due to

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


