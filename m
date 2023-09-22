Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0AFCD4F49
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 10:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C787F10E650;
	Fri, 22 Sep 2023 10:59:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B7A010E650;
 Fri, 22 Sep 2023 10:59:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 17555AADEB;
 Fri, 22 Sep 2023 10:59:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Date: Fri, 22 Sep 2023 10:59:17 -0000
Message-ID: <169538035709.5199.5780222408394640286@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230922082909.334085-1-suraj.kandpal@intel.com>
In-Reply-To: <20230922082909.334085-1-suraj.kandpal@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?move_Stubs_in_HDCP_code_=28rev3=29?=
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

Series: Remove Stubs in HDCP code (rev3)
URL   : https://patchwork.freedesktop.org/series/124093/
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
commit e7a8705d8c96ced1834b32ce116a0ec877b6cb50
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Sep 22 13:59:09 2023 +0530

    drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe
    
    Define intel_hdcp_gsc_check_status in Xe to account
    for changes in i915 and Xe.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 6149acb947f2f8b65ee1a058982a5d6fce3124ec drm-intel
78f1ca621 fixup! FIXME: drm/i915: xe doesn't have gsc hdcp interface or something
9d75839ca drm/i915/hdcp: Move checks for gsc health status
e7a8705d8 drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe


