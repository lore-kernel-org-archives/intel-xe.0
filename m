Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A83606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 16:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C48D10E07B;
	Fri, 27 Nov 2026 16:17:25 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80810E07B;
 Fri, 27 Nov 2026 16:17:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/nvl-p=3A_Add_Wa=5F?=
 =?utf-8?q?14028564128_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Nov 2026 16:17:24 -0000
Message-ID: <179579624464.1299.8313247724364436859@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127132613.3957154-2-tejas.upadhyay@intel.com>
In-Reply-To: <20261127132613.3957154-2-tejas.upadhyay@intel.com>
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

Series: drm/xe/nvl-p: Add Wa_14028564128 (rev3)
URL   : https://patchwork.freedesktop.org/series/178936/
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
commit c7c495225590443deb5539b56038cd25dd98ca92
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Nov 27 18:56:14 2026 +0530

    drm/xe/nvl-p: Add Wa_14028564128
    
    Wa_14028564128 requires all 2-way coherent PAT entries to be programmed
    as non-promotable 1-way coherent entries with L3:UC. It applies to all
    steppings of graphics version 35.10.
    
    On Xe3p LPG this affects PAT indices 2, 7, 23, 27 and 31.
    
    V3:
    - Apply Wa_14028564128 before Wa_14026539277 and document the ordering
    - Drop xe_pat_wa_14028564128_safe_userptr_index()
    
    V2:
    - Add missing pat indexes to no_promote as asked by WA
    
    Co-authored-by: Nitin Gote <nitin.r.gote@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch f1804f6542ee253c4bdae15dfb8a5a5a2469adda drm-intel
c7c495225590 drm/xe/nvl-p: Add Wa_14028564128
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#19: 
Co-authored-by: Nitin Gote <nitin.r.gote@intel.com>

total: 0 errors, 1 warnings, 0 checks, 60 lines checked


