Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9C606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 21:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB015112734;
	Thu, 26 Nov 2026 21:42:58 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1A3112734;
 Thu, 26 Nov 2026 21:42:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/bios=3A_vbt-rela?=
 =?utf-8?q?ted_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 21:42:57 -0000
Message-ID: <179572937796.95469.16308722310717365733@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126175033.181407-1-michal.grzelak@linux.intel.com>
In-Reply-To: <20261126175033.181407-1-michal.grzelak@linux.intel.com>
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

Series: drm/i915/bios: vbt-related fixes
URL   : https://patchwork.freedesktop.org/series/179785/
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
commit 7a08d188dbd6fa3785352cb425fd812bc6c41286
Author: Michał Grzelak <michal.grzelak@linux.intel.com>
Date:   Thu Nov 26 18:50:33 2026 +0100

    drm/i915/bios: check if VBT#57's tables are zeroed
    
    Turns out there are VBTs which have use_vbt_vswing enabled while
    their vswing/pre-emphasis override tables contain only zeroes instead of
    register values.
    
    Return from parsing of Vswing/Pre-emphasis Override if tables are empty.
    By doing so do not update metadata stored in vspeo substructure.
    
    Return from buffers' allocation if vspeo metadata is missing. Use
    default vswing/pre-emphasis then because of allocation failure.
    
    Fixes: a138a81d7805 ("drm/i915/bios: de/allocate VS/PE-O buffers for each port")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9602
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Suggested-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
+ /mt/dim checkpatch 436eec0ef1b65f139fa2f3c42aea97c29da57c8c drm-intel
ed1c4ab75365 drm/i915/bios: include whitespace into VBT signature
-:62: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Michał Grzelak" <michal.grzelak@intel.com>' != 'Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>'

total: 0 errors, 1 warnings, 0 checks, 34 lines checked
7a08d188dbd6 drm/i915/bios: check if VBT#57's tables are zeroed


