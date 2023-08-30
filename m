Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1234C6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 14:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C1D10E52D;
	Wed, 30 Aug 2023 14:22:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BCAA10E52D;
 Wed, 30 Aug 2023 14:22:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 489C7AADF2;
 Wed, 30 Aug 2023 14:22:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 30 Aug 2023 14:22:18 -0000
Message-ID: <169340533829.15231.8468952668948664248@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830123722.6-1-francois.dugast@intel.com>
In-Reply-To: <20230830123722.6-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Us?=
 =?utf-8?q?e_Xe_assert_macros_instead_of_XE=5FWARN=5FON_macro_=28rev2=29?=
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

Series: Use Xe assert macros instead of XE_WARN_ON macro (rev2)
URL   : https://patchwork.freedesktop.org/series/122906/
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
commit 507a1295a0221d765299456ed20a1e96ba0da1f2
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Aug 30 12:37:22 2023 +0000

    drm/xe: Use Xe assert macros instead of XE_WARN_ON macro
    
    The XE_WARN_ON macro maps to WARN_ON which is not justified
    in many cases where only a simple debug check is needed.
    Replace the use of the XE_WARN_ON macro with the new xe_assert
    macros which relies on drm_*. This takes a struct drm_device
    argument, which is one of the main changes in this commit. The
    other main change is that the condition is reversed, as with
    XE_WARN_ON a message is displayed if the condition is true,
    whereas with xe_assert it is if the condition is false.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 7af4e65956a8d0346547567b534d49acf30085e0 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


