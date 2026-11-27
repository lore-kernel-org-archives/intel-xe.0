Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407B0606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 15:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0161910E259;
	Fri, 27 Nov 2026 15:31:43 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5097A112BB6;
 Fri, 27 Nov 2026 15:31:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/multi=5Fqueue=3A_E?=
 =?utf-8?q?xpose_CGP_address_via_PPHWSP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Nov 2026 15:31:41 -0000
Message-ID: <179579350132.1013.11653859911283162399@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
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

Series: drm/xe/multi_queue: Expose CGP address via PPHWSP
URL   : https://patchwork.freedesktop.org/series/179874/
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
commit c1cf244c776a341eaee6d815369e8f2f7c2d41e0
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Date:   Fri Nov 27 18:38:18 2026 +0530

    drm/xe/multi_queue: Expose CGP address to debug tools via PPHWSP
    
    The Context Group Page (CGP) has the queues of a multi queue group and
    their LRCAs. Store its address in the PPHWSP of the group's primary
    queue, so debug tools can find it.
    
    The address is written before the group is registered with GuC and
    rewritten after a VF migration GGTT rebase.
    
    v2:
    - Use decimal PPHWSP offset, u32 address with xe_map_write32() and assert
      a single LRC in the rebase path (Niranjana)
    - Move the DOC note after the CGP GuC interface description (Niranjana)
    
    Assisted-by: LLM
    Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
+ /mt/dim checkpatch f1804f6542ee253c4bdae15dfb8a5a5a2469adda drm-intel
0a0dd8ef17e5 drm/xe/guc: Set CGP info only for multi queue primary
-:13: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#13: 
Assisted-by: LLM

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#13: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
c1cf244c776a drm/xe/multi_queue: Expose CGP address to debug tools via PPHWSP
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: LLM

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#19: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 80 lines checked


