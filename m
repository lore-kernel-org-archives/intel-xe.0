Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307C5D5B87A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 05:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACE010E59A;
	Tue, 29 Oct 2024 05:32:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE10710E59A;
 Tue, 29 Oct 2024 05:32:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe3lpd=3A_Disabl?=
 =?utf-8?q?e_HDCP_Line_Rekeying_for_Xe3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 05:32:34 -0000
Message-ID: <173017995477.1357639.3401803935884649168@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029052603.215853-1-suraj.kandpal@intel.com>
In-Reply-To: <20241029052603.215853-1-suraj.kandpal@intel.com>
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

Series: drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3
URL   : https://patchwork.freedesktop.org/series/140625/
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
commit 5f5b0853055e703bdfea3e4624b89ffc931375e7
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Oct 29 10:56:03 2024 +0530

    drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3
    
    We need to disable HDCP Line Rekeying for Xe3 when we are using an HDMI
    encoder. Also remove the Wa comment tag as this follows the bspec and
    does not implement the wa.
    
    v2: add additional definition instead of function, commit message typo
    fix and update.
    v3: restore lost conditional from v2.
    v4: subject line and subject message updated, fix the if ladder order,
    fix the bit definition order.
    v5: Add the bspec link and remove the Wa comment tag
    
    Bspec: 69964
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 79811c7809c46a23b7cfceaf36d4994792c850da drm-intel
5f5b0853055e drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3


