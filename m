Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F90E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 13:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7116D10F0E7;
	Fri,  6 Dec 2024 13:46:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8840010F0E7;
 Fri,  6 Dec 2024 13:46:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Allow_VF_dir?=
 =?utf-8?q?ect_access_to_extended_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Dec 2024 13:46:57 -0000
Message-ID: <173349281755.3357417.15325363350303743083@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206133929.891568-1-piotr.piorkowski@intel.com>
In-Reply-To: <20241206133929.891568-1-piotr.piorkowski@intel.com>
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

Series: drm/xe/vf: Allow VF direct access to extended registers
URL   : https://patchwork.freedesktop.org/series/142230/
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
commit 0281831558445704537a84844d1bac0098e05bed
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Fri Dec 6 14:39:29 2024 +0100

    drm/xe/vf: Allow VF direct access to extended registers
    
    While VF by default does not have access to regular registers except
    allowed ones, the rule is reversed for extended registers - VF has
    access to all except forbidden ones.
    So let's allow direct access for extended registers by default.
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 2e90353f058f2487798ad9236f0926df4ea54f02 drm-intel
028183155844 drm/xe/vf: Allow VF direct access to extended registers


