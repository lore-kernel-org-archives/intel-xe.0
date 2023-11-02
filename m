Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2494EC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 12:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A7710E869;
	Thu,  2 Nov 2023 12:52:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDBE110E869;
 Thu,  2 Nov 2023 12:52:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CB082AADF1;
 Thu,  2 Nov 2023 12:52:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 02 Nov 2023 12:52:00 -0000
Message-ID: <169892952082.28155.7295739836686635630@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231102124855.1940491-1-lucas.demarchi@intel.com>
In-Reply-To: <20231102124855.1940491-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Add_Wa=5F14019821291?=
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

Series: drm/xe: Add Wa_14019821291
URL   : https://patchwork.freedesktop.org/series/125898/
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
commit 7300f7966e57b9dd8bd2fbabd7ef490185995fe7
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Nov 2 05:48:55 2023 -0700

    drm/xe: Add Wa_14019821291
    
    This workaround is primarily implemented by the BIOS.  However if the
    BIOS applies the workaround it will reserve a small piece of our DSM
    (which should be at the top, right below the WOPCM); we just need to
    keep that region reserved so that nothing else attempts to re-use it.
    
    v2 (Gustavo):
      - Check for NULL media_gt
      - Mask bits [5:0] to avoid potential issues in future platforms
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 34a82567688cfe0c7e63e9cda15b6da4b449abfe drm-intel
7300f7966 drm/xe: Add Wa_14019821291


