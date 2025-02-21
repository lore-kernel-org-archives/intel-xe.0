Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97003C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 22:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BB210E0B1;
	Fri, 21 Feb 2025 22:23:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7216A10E0B1;
 Fri, 21 Feb 2025 22:23:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Allow_oa=5Fe?=
 =?utf-8?q?xponent_value_of_0_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 22:23:34 -0000
Message-ID: <174017661446.585683.1410221255249739082@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221213352.1712932-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250221213352.1712932-1-umesh.nerlige.ramappa@intel.com>
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

Series: drm/xe/oa: Allow oa_exponent value of 0 (rev4)
URL   : https://patchwork.freedesktop.org/series/144685/
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
commit 50a083e4d8ca0229dda08bdb5f0090ee6f764986
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Fri Feb 21 13:33:52 2025 -0800

    drm/xe/oa: Allow oa_exponent value of 0
    
    OA exponent value of 0 is a valid value for periodic reports. Allow user
    to pass 0 for the OA sampling interval since it gets converted to 2 gt
    clock ticks.
    
    v2: Update the check in xe_oa_stream_init as well (Ashutosh)
    v3: Fix mi-rpc failure by setting default exponent to -1 (CI)
    v4: Add the Fixes tag
    
    Fixes: b6fd51c62119 ("drm/xe/oa/uapi: Define and parse OA stream properties")
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch f2a2bd676bde0942c9dfe5c55d54eec298260f88 drm-intel
50a083e4d8ca drm/xe/oa: Allow oa_exponent value of 0


