Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA264606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 16:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9010E5D3;
	Fri, 27 Nov 2026 16:58:17 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9403F10E5D3;
 Fri, 27 Nov 2026 16:58:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Leave?=
 =?utf-8?q?_the_PSR_frame_change_to_the_joiner_primary?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Nov 2026 16:58:16 -0000
Message-ID: <179579869660.1531.11594924324216890042@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127160235.3208777-1-mika.kahola@intel.com>
In-Reply-To: <20261127160235.3208777-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Leave the PSR frame change to the joiner primary
URL   : https://patchwork.freedesktop.org/series/179885/
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
commit e31ce7834db6cea4de6af0dbbcf044b05f07f0bd
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Fri Nov 27 16:02:35 2026 +0000

    drm/i915/display: Leave the PSR frame change to the joiner primary
    
    With PSR2 on joined pipes the secondary's DSB also sends the trans push
    and polls the PSR2 status of the primary's transcoder. The poll gets no
    response and the DSB times out:
    
     [CRTC:354:pipe B] DSB 0 response timeout
     [CRTC:354:pipe B] DSB 0 timed out waiting for idle (current head=0x140, head=0x0, tail=0x180)
    
    Both are per transcoder and the primary already does them. Skip them
    on the secondary when the primary is in the same commit.
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 49d98d4e9c54dfb3650d39a80c2cd95e0a9f1b61 drm-intel
e31ce7834db6 drm/i915/display: Leave the PSR frame change to the joiner primary
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
 [CRTC:354:pipe B] DSB 0 timed out waiting for idle (current head=0x140, head=0x0, tail=0x180)

total: 0 errors, 1 warnings, 0 checks, 31 lines checked


