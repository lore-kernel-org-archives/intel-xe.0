Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF224C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 10:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AC710E6FC;
	Tue, 15 Apr 2025 10:36:16 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7FF10E707;
 Tue, 15 Apr 2025 10:36:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Imple?=
 =?utf-8?q?ment_wa=5F14024400148?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 10:36:15 -0000
Message-ID: <174471337551.5768.8103046673101968261@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415094633.2465122-1-nemesa.garg@intel.com>
In-Reply-To: <20250415094633.2465122-1-nemesa.garg@intel.com>
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

Series: drm/i915/display: Implement wa_14024400148
URL   : https://patchwork.freedesktop.org/series/147745/
State : success

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
commit ea92911fe86fa9e51ca57d5efeb33af426bbf33f
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Tue Apr 15 15:16:33 2025 +0530

    drm/i915/display: Implement wa_14024400148
    
    Workaround recommend use polling method
    for pm_demand to finish as to avoid timeout.
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch 4e52f6bddf99cb28ed0279d56bb8286a8bbfda65 drm-intel
ea92911fe86f drm/i915/display: Implement wa_14024400148


