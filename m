Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AADC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 10:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D9C10E6CB;
	Wed, 21 Feb 2024 10:02:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE4F10E45E;
 Wed, 21 Feb 2024 10:02:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_replace_=27grou?=
 =?utf-8?q?ped_target=27_in_Makefile_with_pattern_rule?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dhirschfeld@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Feb 2024 10:02:06 -0000
Message-ID: <170850972645.178729.17712717670932053450@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221095556.1635644-1-dhirschfeld@habana.ai>
In-Reply-To: <20240221095556.1635644-1-dhirschfeld@habana.ai>
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

Series: drm/xe: replace 'grouped target' in Makefile with pattern rule
URL   : https://patchwork.freedesktop.org/series/130190/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b69866973f8d00d6125a3f430747d3bb5307d458
Author: Dafna Hirschfeld <dhirschfeld@habana.ai>
Date:   Wed Feb 21 11:55:56 2024 +0200

    drm/xe: replace 'grouped target' in Makefile with pattern rule
    
    Since 'grouped target' is used only in 'make' 4.3, it should
    be avoided. Replace it with 'multi-target pattern rule' which
    has the same behavior.
    
    Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
+ /mt/dim checkpatch b895612a4da69e73804cd5fc2dedfa44fda1da99 drm-intel
b69866973f8d drm/xe: replace 'grouped target' in Makefile with pattern rule


