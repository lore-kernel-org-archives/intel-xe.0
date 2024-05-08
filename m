Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4097CC19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 01:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFBD10E100;
	Wed,  8 May 2024 01:34:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA62310E100;
 Wed,  8 May 2024 01:34:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Per_client_usag?=
 =?utf-8?q?e_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 01:34:24 -0000
Message-ID: <171513206476.1963161.7325068166315008480@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
In-Reply-To: <20240507224510.442971-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Per client usage (rev3)
URL   : https://patchwork.freedesktop.org/series/132477/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 62d75efcaf3b2ababfe9f605d2cb8532de4a3b3b
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue May 7 15:45:10 2024 -0700

    drm/xe/client: Print runtime to fdinfo
    
    Print the accumulated runtime for client when printing fdinfo.
    Each time a query is done it first does 2 things:
    
    1) loop through all the exec queues for the current client and
       accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
       that, being read from the context image.
    
    2) Read a "GPU timestamp" that can be used for considering "how much GPU
       time has passed" and that has the same unit/refclock as the one
       recording the runtime. RING_TIMESTAMP is used for that via MMIO.
    
    Since for all current platforms RING_TIMESTAMP follows the same
    refclock, just read it once, using any first engine.
    
    This is exported to userspace as 2 numbers in fdinfo:
    
            drm-cycles-<class>: <RUNTIME>
            drm-total-cycles-<class>: <TIMESTAMP>
    
    Userspace is expected to collect at least 2 samples, which allows to
    know the client engine busyness as per:
    
                        RUNTIME1 - RUNTIME0
            busyness = ---------------------
                              T1 - T0
    
    Another thing to point out is that it's expected that userspace will
    read any 2 samples every few seconds.  Given the update frequency of the
    counters involved and that CTX_TIMESTAMP is 32-bits, the counter for
    each exec_queue can wrap around (assuming 100% utilization) after ~200s.
    The wraparound is not perceived by userspace since it's just accumulated
    for all the exec_queues in a 64-bit counter), but the measurement will
    not be accurate if the samples are too far apart.
    
    This could be mitigated by adding a workqueue to accumulate the counters
    every so often, but it's additional complexity for something that is
    done already by userspace every few seconds in tools like gputop (from
    igt), htop, nvtop, etc with none of them really defaulting to 1 sample
    per minute or more.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 703bc96550be8cd9f4995bfa5126ca8a2e98c58c drm-intel
0e581f24ae59 drm/xe: Promote xe_hw_engine_class_to_str()
f90b2d51606a drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
11294dbb0160 drm/xe/lrc: Add helper to capture context timestamp
187c54795475 drm/xe: Add helper to capture engine timestamp
3d8ecf1d30ce drm/xe: Add helper to accumulate exec queue runtime
62d75efcaf3b drm/xe/client: Print runtime to fdinfo
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:89: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#89: 
new file mode 100644

-:138: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#138: FILE: drivers/gpu/drm/xe/xe_drm_client.c:33:
+ * ^Ipos:    0$

-:139: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#139: FILE: drivers/gpu/drm/xe/xe_drm_client.c:34:
+ * ^Iflags:  0100002$

-:140: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#140: FILE: drivers/gpu/drm/xe/xe_drm_client.c:35:
+ * ^Imnt_id: 26$

-:141: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#141: FILE: drivers/gpu/drm/xe/xe_drm_client.c:36:
+ * ^Iino:    685$

-:142: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#142: FILE: drivers/gpu/drm/xe/xe_drm_client.c:37:
+ * ^Idrm-driver:     xe$

-:143: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#143: FILE: drivers/gpu/drm/xe/xe_drm_client.c:38:
+ * ^Idrm-client-id:  3$

-:144: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#144: FILE: drivers/gpu/drm/xe/xe_drm_client.c:39:
+ * ^Idrm-pdev:       0000:03:00.0$

-:145: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#145: FILE: drivers/gpu/drm/xe/xe_drm_client.c:40:
+ * ^Idrm-total-system:       0$

-:146: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#146: FILE: drivers/gpu/drm/xe/xe_drm_client.c:41:
+ * ^Idrm-shared-system:      0$

-:147: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#147: FILE: drivers/gpu/drm/xe/xe_drm_client.c:42:
+ * ^Idrm-active-system:      0$

-:148: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#148: FILE: drivers/gpu/drm/xe/xe_drm_client.c:43:
+ * ^Idrm-resident-system:    0$

-:149: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#149: FILE: drivers/gpu/drm/xe/xe_drm_client.c:44:
+ * ^Idrm-purgeable-system:   0$

-:150: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#150: FILE: drivers/gpu/drm/xe/xe_drm_client.c:45:
+ * ^Idrm-total-gtt:  192 KiB$

-:151: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#151: FILE: drivers/gpu/drm/xe/xe_drm_client.c:46:
+ * ^Idrm-shared-gtt: 0$

-:152: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#152: FILE: drivers/gpu/drm/xe/xe_drm_client.c:47:
+ * ^Idrm-active-gtt: 0$

-:153: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#153: FILE: drivers/gpu/drm/xe/xe_drm_client.c:48:
+ * ^Idrm-resident-gtt:       192 KiB$

-:154: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#154: FILE: drivers/gpu/drm/xe/xe_drm_client.c:49:
+ * ^Idrm-total-vram0:        23992 KiB$

-:155: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#155: FILE: drivers/gpu/drm/xe/xe_drm_client.c:50:
+ * ^Idrm-shared-vram0:       16 MiB$

-:156: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#156: FILE: drivers/gpu/drm/xe/xe_drm_client.c:51:
+ * ^Idrm-active-vram0:       0$

-:157: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#157: FILE: drivers/gpu/drm/xe/xe_drm_client.c:52:
+ * ^Idrm-resident-vram0:     23992 KiB$

-:158: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#158: FILE: drivers/gpu/drm/xe/xe_drm_client.c:53:
+ * ^Idrm-total-stolen:       0$

-:159: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#159: FILE: drivers/gpu/drm/xe/xe_drm_client.c:54:
+ * ^Idrm-shared-stolen:      0$

-:160: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#160: FILE: drivers/gpu/drm/xe/xe_drm_client.c:55:
+ * ^Idrm-active-stolen:      0$

-:161: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#161: FILE: drivers/gpu/drm/xe/xe_drm_client.c:56:
+ * ^Idrm-resident-stolen:    0$

-:162: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#162: FILE: drivers/gpu/drm/xe/xe_drm_client.c:57:
+ * ^Idrm-cycles-rcs: 28257900$

-:163: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#163: FILE: drivers/gpu/drm/xe/xe_drm_client.c:58:
+ * ^Idrm-total-cycles-rcs:   7655183225$

-:164: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#164: FILE: drivers/gpu/drm/xe/xe_drm_client.c:59:
+ * ^Idrm-cycles-bcs: 0$

-:165: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#165: FILE: drivers/gpu/drm/xe/xe_drm_client.c:60:
+ * ^Idrm-total-cycles-bcs:   7655183225$

-:166: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#166: FILE: drivers/gpu/drm/xe/xe_drm_client.c:61:
+ * ^Idrm-cycles-vcs: 0$

-:167: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#167: FILE: drivers/gpu/drm/xe/xe_drm_client.c:62:
+ * ^Idrm-total-cycles-vcs:   7655183225$

-:168: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#168: FILE: drivers/gpu/drm/xe/xe_drm_client.c:63:
+ * ^Idrm-engine-capacity-vcs:        2$

-:169: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#169: FILE: drivers/gpu/drm/xe/xe_drm_client.c:64:
+ * ^Idrm-cycles-vecs:        0$

-:170: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#170: FILE: drivers/gpu/drm/xe/xe_drm_client.c:65:
+ * ^Idrm-total-cycles-vecs:  7655183225$

-:171: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#171: FILE: drivers/gpu/drm/xe/xe_drm_client.c:66:
+ * ^Idrm-engine-capacity-vecs:       2$

-:172: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#172: FILE: drivers/gpu/drm/xe/xe_drm_client.c:67:
+ * ^Idrm-cycles-ccs: 0$

-:173: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#173: FILE: drivers/gpu/drm/xe/xe_drm_client.c:68:
+ * ^Idrm-total-cycles-ccs:   7655183225$

-:174: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#174: FILE: drivers/gpu/drm/xe/xe_drm_client.c:69:
+ * ^Idrm-engine-capacity-ccs:        4$

total: 0 errors, 38 warnings, 0 checks, 200 lines checked


