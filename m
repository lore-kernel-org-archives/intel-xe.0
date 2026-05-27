Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24299CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 23:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD4B10EA8F;
	Wed, 27 May 2026 23:00:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F130310EA8F;
 Wed, 27 May 2026 23:00:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_complete_perf=5Fallow=5F*?=
 =?utf-8?q?_trio_and_use_in_drm/xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 May 2026 23:00:56 -0000
Message-ID: <177992285698.17309.6294997032345130334@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
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

Series: complete perf_allow_* trio and use in drm/xe (rev2)
URL   : https://patchwork.freedesktop.org/series/167137/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bd78a392d12d1dbbd442fcf2ee71d528d4e37fa9
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Wed May 27 15:55:07 2026 -0700

    drm/xe: gate observation streams with perf_allow_cpu()
    
    xe OA and EU-stall paths open-code a partial copy of the system-wide
    perf CPU-event permission check:
    
        if (xe_observation_paranoid && !perfmon_capable())
                return -EACCES;
    
    This open-coded check skips two things perf_allow_cpu() handles: the
    graduated kernel.perf_event_paranoid policy that an administrator
    may have tuned, and the security_perf_event_open() LSM hook.
    
    Introduce xe_observation_paranoid_check() to wrap perf_allow_cpu(),
    and convert the open-coded sites in xe_oa.c and xe_eu_stall.c. The
    dev.xe.observation_paranoid sysctl still acts as an escape hatch
    when cleared.
    
    xe observation now consults kernel.perf_event_paranoid and the LSM
    perf hook on every open. Sites that have already configured an LSM
    perf policy or tuned the paranoid sysctl will see those settings
    extend to xe.
    
    Signed-off-by: John Hubbard <jhubbard@nvidia.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 7570b524ddecbe5db4af0c493a047e21bab6b3d6 drm-intel
c2703b5f953a perf/core: out-of-line and export perf_allow_cpu/tracepoint()
-:48: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#48: FILE: include/linux/perf_event.h:1794:
+extern int perf_allow_cpu(void);

-:49: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#49: FILE: include/linux/perf_event.h:1795:
+extern int perf_allow_tracepoint(void);

-:61: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#61: FILE: include/linux/perf_event.h:2016:
+}
+static inline int perf_allow_cpu(void)

-:65: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#65: FILE: include/linux/perf_event.h:2020:
+}
+static inline int perf_allow_tracepoint(void)

total: 0 errors, 0 warnings, 4 checks, 67 lines checked
bd78a392d12d drm/xe: gate observation streams with perf_allow_cpu()


