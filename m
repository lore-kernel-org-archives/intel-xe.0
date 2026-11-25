Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F31606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 00:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646C510E8C4;
	Wed, 25 Nov 2026 00:13:58 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FABA10E8C4;
 Wed, 25 Nov 2026 00:13:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Implement_Dis?=
 =?utf-8?q?playID_based_VBT_panel_type_detection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Nov 2026 00:13:57 -0000
Message-ID: <179556563764.81475.16326418611589726155@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124224621.6506-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261124224621.6506-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Implement DisplayID based VBT panel type detection
URL   : https://patchwork.freedesktop.org/series/179566/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9918e6d792628a8321a05c942ee53a2478002690
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Nov 25 00:46:21 2026 +0200

    drm/i915/bios: Attempt to match the VBT PnP ID against DisplayID first
    
    The Windows driver policy appears to be now to first match the
    VBT PnP ID against the DisplayID product ID block, and only if
    there is no match (not even a partial one) then attempt to
    match the against the EDID base block vendor/product ID.
    Implement the same policy.
    
    We also need to implement the same weird scheme of just smashing
    the first two bytes of the DisplayID three byte OUI into the
    old EISA/PNPID field of the EDID defined structure. That is
    then matched against the similar old EDID style structures in
    the VBT.
    
    Smoke tested with a firmware override of EDID and VBT:
     [drm:get_panel_type [xe]] Panel type (VBT): 255
     [drm:pnpid_get_panel_type [xe]] DisplayID manufacturer name: NRA, product code: 16826, serial number: 0, year of manufacture: 2014
     [drm:pnpid_get_panel_type [xe]] DisplayID raw product id: ba 41 ba 41 00 00 00 00 00 18
     [drm:get_panel_type [xe]] Panel type (PNPID DisplayID): 3
     [drm:pnpid_get_panel_type [xe]] EDID manufacturer name: SDC, product code: 16826, serial number: 65441, year of manufacture: 2024
     [drm:pnpid_get_panel_type [xe]] EDID raw product id: 4c 83 ba 41 a1 ff 00 00 00 22
     [drm:get_panel_type [xe]] Panel type (fallback): 0
     [drm:get_panel_type [xe]] Selected panel type (PNPID DisplayID): 3
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8969
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 59b46a8902d6416190f72ddc25ba74881639af3a drm-intel
463dbe5ea665 drm/edid: Introduce drm_edid_get_displayid_product_id()
9918e6d79262 drm/i915/bios: Attempt to match the VBT PnP ID against DisplayID first
-:24: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#24: 
 [drm:pnpid_get_panel_type [xe]] DisplayID manufacturer name: NRA, product code: 16826, serial number: 0, year of manufacture: 2014

total: 0 errors, 1 warnings, 0 checks, 127 lines checked


