Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90470C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 20:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406F310EF6C;
	Fri, 17 May 2024 20:49:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6E710EF6C;
 Fri, 17 May 2024 20:49:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Per_client_usag?=
 =?utf-8?q?e_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 May 2024 20:49:28 -0000
Message-ID: <171597896863.2144079.860899783813510904@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
In-Reply-To: <20240517204310.88854-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Per client usage (rev5)
URL   : https://patchwork.freedesktop.org/series/132477/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4984ecf1d08e399ca3b5ceb65cdc23f7a1fb9dd
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri May 17 13:43:10 2024 -0700

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
    refclock, just read it once, using any first engine available.
    
    This is exported to userspace as 2 numbers in fdinfo:
    
            drm-cycles-<class>: <RUNTIME>
            drm-total-cycles-<class>: <TIMESTAMP>
    
    Userspace is expected to collect at least 2 samples, which allows to
    know the client engine busyness as per:
    
                        RUNTIME1 - RUNTIME0
            busyness = ---------------------
                              T1 - T0
    
    Since drm-cycles-<class> always starts at 0, it's also possible to know
    if and engine was ever used by a client.
    
    It's expected that userspace will read any 2 samples every few seconds.
    Given the update frequency of the counters involved and that
    CTX_TIMESTAMP is 32-bits, the counter for each exec_queue can wrap
    around (assuming 100% utilization) after ~200s. The wraparound is not
    perceived by userspace since it's just accumulated for all the
    exec_queues in a 64-bit counter) but the measurement will not be
    accurate if the samples are too far apart.
    
    This could be mitigated by adding a workqueue to accumulate the counters
    every so often, but it's additional complexity for something that is
    done already by userspace every few seconds in tools like gputop (from
    igt), htop, nvtop, etc, with none of them really defaulting to 1 sample
    per minute or more.
    
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5e9e7440f7d7efd64079148c738fc83600fb477b drm-intel
cd44d9aae2d1 drm/xe: Promote xe_hw_engine_class_to_str()
1edb11f722cb drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
4f7a5f485b9b drm/xe/lrc: Add helper to capture context timestamp
60feaec3b7da drm/xe: Add helper to capture engine timestamp
d0d6fae30924 drm/xe: Add helper to accumulate exec queue runtime
79e4ce71cdb1 drm/xe: Cache data about user-visible engines
fdd53e087abc drm/xe: Add helper to return any available hw engine
a4984ecf1d08 drm/xe/client: Print runtime to fdinfo
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:106: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#106: 
new file mode 100644

-:156: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#156: FILE: drivers/gpu/drm/xe/xe_drm_client.c:34:
+ * ^Ipos:    0$

-:157: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#157: FILE: drivers/gpu/drm/xe/xe_drm_client.c:35:
+ * ^Iflags:  0100002$

-:158: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#158: FILE: drivers/gpu/drm/xe/xe_drm_client.c:36:
+ * ^Imnt_id: 26$

-:159: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#159: FILE: drivers/gpu/drm/xe/xe_drm_client.c:37:
+ * ^Iino:    685$

-:160: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#160: FILE: drivers/gpu/drm/xe/xe_drm_client.c:38:
+ * ^Idrm-driver:     xe$

-:161: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#161: FILE: drivers/gpu/drm/xe/xe_drm_client.c:39:
+ * ^Idrm-client-id:  3$

-:162: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#162: FILE: drivers/gpu/drm/xe/xe_drm_client.c:40:
+ * ^Idrm-pdev:       0000:03:00.0$

-:163: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#163: FILE: drivers/gpu/drm/xe/xe_drm_client.c:41:
+ * ^Idrm-total-system:       0$

-:164: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#164: FILE: drivers/gpu/drm/xe/xe_drm_client.c:42:
+ * ^Idrm-shared-system:      0$

-:165: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#165: FILE: drivers/gpu/drm/xe/xe_drm_client.c:43:
+ * ^Idrm-active-system:      0$

-:166: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#166: FILE: drivers/gpu/drm/xe/xe_drm_client.c:44:
+ * ^Idrm-resident-system:    0$

-:167: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#167: FILE: drivers/gpu/drm/xe/xe_drm_client.c:45:
+ * ^Idrm-purgeable-system:   0$

-:168: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#168: FILE: drivers/gpu/drm/xe/xe_drm_client.c:46:
+ * ^Idrm-total-gtt:  192 KiB$

-:169: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#169: FILE: drivers/gpu/drm/xe/xe_drm_client.c:47:
+ * ^Idrm-shared-gtt: 0$

-:170: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#170: FILE: drivers/gpu/drm/xe/xe_drm_client.c:48:
+ * ^Idrm-active-gtt: 0$

-:171: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#171: FILE: drivers/gpu/drm/xe/xe_drm_client.c:49:
+ * ^Idrm-resident-gtt:       192 KiB$

-:172: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#172: FILE: drivers/gpu/drm/xe/xe_drm_client.c:50:
+ * ^Idrm-total-vram0:        23992 KiB$

-:173: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#173: FILE: drivers/gpu/drm/xe/xe_drm_client.c:51:
+ * ^Idrm-shared-vram0:       16 MiB$

-:174: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#174: FILE: drivers/gpu/drm/xe/xe_drm_client.c:52:
+ * ^Idrm-active-vram0:       0$

-:175: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#175: FILE: drivers/gpu/drm/xe/xe_drm_client.c:53:
+ * ^Idrm-resident-vram0:     23992 KiB$

-:176: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#176: FILE: drivers/gpu/drm/xe/xe_drm_client.c:54:
+ * ^Idrm-total-stolen:       0$

-:177: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#177: FILE: drivers/gpu/drm/xe/xe_drm_client.c:55:
+ * ^Idrm-shared-stolen:      0$

-:178: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#178: FILE: drivers/gpu/drm/xe/xe_drm_client.c:56:
+ * ^Idrm-active-stolen:      0$

-:179: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#179: FILE: drivers/gpu/drm/xe/xe_drm_client.c:57:
+ * ^Idrm-resident-stolen:    0$

-:180: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#180: FILE: drivers/gpu/drm/xe/xe_drm_client.c:58:
+ * ^Idrm-cycles-rcs: 28257900$

-:181: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#181: FILE: drivers/gpu/drm/xe/xe_drm_client.c:59:
+ * ^Idrm-total-cycles-rcs:   7655183225$

-:182: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#182: FILE: drivers/gpu/drm/xe/xe_drm_client.c:60:
+ * ^Idrm-cycles-bcs: 0$

-:183: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#183: FILE: drivers/gpu/drm/xe/xe_drm_client.c:61:
+ * ^Idrm-total-cycles-bcs:   7655183225$

-:184: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#184: FILE: drivers/gpu/drm/xe/xe_drm_client.c:62:
+ * ^Idrm-cycles-vcs: 0$

-:185: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#185: FILE: drivers/gpu/drm/xe/xe_drm_client.c:63:
+ * ^Idrm-total-cycles-vcs:   7655183225$

-:186: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#186: FILE: drivers/gpu/drm/xe/xe_drm_client.c:64:
+ * ^Idrm-engine-capacity-vcs:        2$

-:187: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#187: FILE: drivers/gpu/drm/xe/xe_drm_client.c:65:
+ * ^Idrm-cycles-vecs:        0$

-:188: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#188: FILE: drivers/gpu/drm/xe/xe_drm_client.c:66:
+ * ^Idrm-total-cycles-vecs:  7655183225$

-:189: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#189: FILE: drivers/gpu/drm/xe/xe_drm_client.c:67:
+ * ^Idrm-engine-capacity-vecs:       2$

-:190: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#190: FILE: drivers/gpu/drm/xe/xe_drm_client.c:68:
+ * ^Idrm-cycles-ccs: 0$

-:191: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#191: FILE: drivers/gpu/drm/xe/xe_drm_client.c:69:
+ * ^Idrm-total-cycles-ccs:   7655183225$

-:192: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#192: FILE: drivers/gpu/drm/xe/xe_drm_client.c:70:
+ * ^Idrm-engine-capacity-ccs:        4$

total: 0 errors, 38 warnings, 0 checks, 196 lines checked


