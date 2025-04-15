Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6308EC369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 07:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A36610E66C;
	Tue, 15 Apr 2025 07:03:46 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF10810E66F;
 Tue, 15 Apr 2025 07:03:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Add_fault_injection_for_kobj=5Fxe=5Fhw=5Fengine?=
 =?utf-8?q?=5Fclass?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 07:03:44 -0000
Message-ID: <174470062484.4136.8607697464939179052@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415064211.2889970-1-sobin.thomas@intel.com>
In-Reply-To: <20250415064211.2889970-1-sobin.thomas@intel.com>
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

Series: series starting with [1/2] drm/xe: Add fault injection for kobj_xe_hw_engine_class
URL   : https://patchwork.freedesktop.org/series/147729/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f607e5a4c63472457ad2001bda6c8e23e4ecfda8
Author: Sobin Thomas <sobin.thomas@intel.com>
Date:   Tue Apr 15 06:42:11 2025 +0000

    drm/xe: Add fault injection for xe_hw_engine_class_to_str
    
    - Added fault injection for `xe_hw_engine_class_to_str` to enhance coverage.
    - can be tested with igt@inject-fault-probe-function-xe_hw_engine_class_to_str
    
    Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
+ /mt/dim checkpatch 08045a4121ee058ead3c4483e6c217be20ab86d4 drm-intel
7bc5939dd5ea drm/xe: Add fault injection for kobj_xe_hw_engine_class
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
- Can be tested with igt@inject-fault-probe-function-kobj_xe_hw_engine_class

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
f607e5a4c634 drm/xe: Add fault injection for xe_hw_engine_class_to_str
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
- Added fault injection for `xe_hw_engine_class_to_str` to enhance coverage.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


