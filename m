Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A686606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 00:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362CF10F0F2;
	Tue, 20 Oct 2026 00:25:50 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9661610F0F2;
 Tue, 20 Oct 2026 00:25:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/cri=3A_Set_downstr?=
 =?utf-8?q?eam_access_to_L3_class_3_and_write-back_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 00:25:49 -0000
Message-ID: <179245594961.43556.3489787842259701914@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020001513.1528267-1-daniel.charles@intel.com>
In-Reply-To: <20261020001513.1528267-1-daniel.charles@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe/cri: Set downstream access to L3 class 3 and write-back (rev2)
URL   : https://patchwork.freedesktop.org/series/175785/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c398ecd8058eb7ee05f2e5f0a5ba028e7b26ac29
Author: Fei Yang <fei.yang@intel.com>
Date:   Mon Oct 19 17:15:13 2026 -0700

    drm/xe/cri: Set downstream access to L3 class 3 and write-back
    
    Program DWNSTRM_ACCESS_MODE (0x144154) with 0xcc on graphics
    version 3511. Compared with 0x3c, this selects L3 class of service
    3 instead of 0 and write-back rather than uncached L3 policy.
    The L4 caching policy and coherency mode remain unchanged.
    
    v2:
    - Create a dedicated MERT workaround section/table instead of placing
      this workaround in gt_was. MERT registers are device-level registers
      accessed through root-tile MMIO, outside GT forcewake and GT
      save/restore bookkeeping.
    - Add an RTP helper for full-register device MMIO writes and apply the
      MERT table during probe and after pcode is ready on system or D3cold
      resume. Match Xe3p_XPC explicitly and skip devices without
      MERT and SR-IOV VFs.
    
    BSpec: 73603
    Signed-off-by: Fei Yang <fei.yang@intel.com>
    Signed-off-by: Daniel Charles <daniel.charles@intel.com>
+ /mt/dim checkpatch 11ca87190e543407eeda66ed693e9d55cbdaf842 drm-intel
c398ecd8058e drm/xe/cri: Set downstream access to L3 class 3 and write-back
-:168: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#168: FILE: drivers/gpu/drm/xe/xe_wa.c:828:
+static const struct xe_rtp_table_sr mert_was = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 1 checks, 143 lines checked


