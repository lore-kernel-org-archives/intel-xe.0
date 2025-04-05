Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8485C36010
	for <intel-xe@archiver.kernel.org>; Sat,  5 Apr 2025 08:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E45810E04A;
	Sat,  5 Apr 2025 08:27:08 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C8310E04A;
 Sat,  5 Apr 2025 08:27:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_xe=5Fhw=5Fengin?=
 =?utf-8?q?e=5Fclass=3A_Add_fault_injection_and_improve_error_handling_in_ko?=
 =?utf-8?q?bj=5Fxe=5Fhw=5Fengine=5Fclass?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 05 Apr 2025 08:27:07 -0000
Message-ID: <174384162754.40302.17622749464334340881@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250405071703.2255259-1-sobin.thomas@intel.com>
In-Reply-To: <20250405071703.2255259-1-sobin.thomas@intel.com>
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

Series: drm/xe: xe_hw_engine_class: Add fault injection and improve error handling in kobj_xe_hw_engine_class
URL   : https://patchwork.freedesktop.org/series/147290/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b693f3bf099c0a46c37123b0a1fcc288574217ea
Author: Sobin Thomas <sobin.thomas@intel.com>
Date:   Sat Apr 5 07:17:03 2025 +0000

    drm/xe: xe_hw_engine_class: Add fault injection and improve error handling in kobj_xe_hw_engine_class
    
    - Added fault injection for `kobj_xe_hw_engine_class` to enhance coverage.
    - Improved error handling by checking for `IS_ERR_OR_NULL` on `keclass` and
      propagating the error using `PTR_ERR`.
    
    Can be tested using inject-fault-probe-function-kobj_xe_hw_engine_class
    
    Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
+ /mt/dim checkpatch 60b7ecc2c5c979cfb8863272348bd6724559b5be drm-intel
b693f3bf099c drm/xe: xe_hw_engine_class: Add fault injection and improve error handling in kobj_xe_hw_engine_class


