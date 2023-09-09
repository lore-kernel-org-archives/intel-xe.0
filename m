Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2E2EEB57F
	for <intel-xe@archiver.kernel.org>; Sat,  9 Sep 2023 05:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2948210E259;
	Sat,  9 Sep 2023 05:24:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8AE010E255;
 Sat,  9 Sep 2023 05:24:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A4B4DAA3D8;
 Sat,  9 Sep 2023 05:24:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Sat, 09 Sep 2023 05:24:43 -0000
Message-ID: <169423708367.13821.14706760096026896377@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230909052153.1669790-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230909052153.1669790-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/uapi=3A_Use_common_drm=5Fxe=5Fext=5Fset=5Fproperty_extensi?=
 =?utf-8?q?on?=
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

Series: drm/xe/uapi: Use common drm_xe_ext_set_property extension
URL   : https://patchwork.freedesktop.org/series/123471/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 15df84889f6f5f14b1f6da077c6e2961c5745a1d
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Sep 8 22:21:53 2023 -0700

    drm/xe/uapi: Use common drm_xe_ext_set_property extension
    
    There really is no difference between 'struct drm_xe_ext_vm_set_property'
    and 'struct drm_xe_ext_exec_queue_set_property', they are extensions which
    specify a <property, value> pair. Replace the two extensions with a single
    common 'struct drm_xe_ext_set_property' extension. The rationale is that
    rather than have each XE module (including future modules) invent their own
    property/value extensions, all XE modules use a common set_property
    extension when possible.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch e51e857ffad411e1b78821866e9f02187345a11a drm-intel
15df84889 drm/xe/uapi: Use common drm_xe_ext_set_property extension


