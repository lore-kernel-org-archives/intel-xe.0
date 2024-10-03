Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCD8CF34BC
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 17:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FE410E8C7;
	Thu,  3 Oct 2024 17:49:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B8910E8C6;
 Thu,  3 Oct 2024 17:49:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Remov?=
 =?utf-8?q?e_kstrdup=5Fconst=28=29_and_kfree=5Fconst=28=29_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 17:49:06 -0000
Message-ID: <172797774613.1169840.17424777291147651520@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727977199.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727977199.git.christophe.jaillet@wanadoo.fr>
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

Series: drm/i915/display: Remove kstrdup_const() and kfree_const() usage
URL   : https://patchwork.freedesktop.org/series/139523/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 75f581193957d44a074de2e27a726d068e3a371a
Author: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date:   Thu Oct 3 19:41:08 2024 +0200

    drm/i915/display: Remove kstrdup_const() and kfree_const() usage
    
    kstrdup_const() and kfree_const() can be confusing in code built as a
    module. In such a case, it does not do what one could expect from the name
    of the functions.
    
    The code is not wrong by itself, but in such a case, it is equivalent to
    kstrdup() and kfree().
    
    So, keep thinks simple and straightforward.
    
    This reverts commit 379b63e7e682 ("drm/i915/display: Save a few bytes of
    memory in intel_backlight_device_register()")
    
    Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
+ /mt/dim checkpatch 17c0158bdb239d8b6d23834db5595ea422b69915 drm-intel
75f581193957 drm/i915/display: Remove kstrdup_const() and kfree_const() usage


