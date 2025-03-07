Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7B3C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 04:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE8610E08B;
	Fri,  7 Mar 2025 04:06:09 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B2910E08B;
 Fri,  7 Mar 2025 04:06:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_Drop_sentin?=
 =?utf-8?q?el_from_xe=5Frtp=5Fprocess=5Fto=5Fsr=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 04:06:07 -0000
Message-ID: <174132036778.70897.8160087847384016631@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306-fix-print-warning-v1-1-7bd961d2cfef@intel.com>
In-Reply-To: <20250306-fix-print-warning-v1-1-7bd961d2cfef@intel.com>
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

Series: drm/xe/rtp: Drop sentinel from xe_rtp_process_to_sr() (rev2)
URL   : https://patchwork.freedesktop.org/series/145960/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 548127ed6209654cdc244cba51216297f50a84c8
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Mar 6 20:00:05 2025 -0800

    drm/xe/rtp: Drop sentinels from arg to xe_rtp_process_to_sr()
    
    There's a mismatch on API: while xe_rtp_process_to_sr() processes
    entries until an entry without name, the active tracking with
    xe_rtp_process_ctx_enable_active_tracking() needs to use the number of
    elements. The number of elements is taken everywhere using ARRAY_SIZE(),
    but that will have one entry too many. This leads to the following
    warning, as reported by lkp:
    
       drivers/gpu/drm/xe/xe_tuning.c: In function 'xe_tuning_dump':
    >> include/drm/drm_print.h:228:31: warning: '%s' directive argument is null [-Wformat-overflow=]
         228 |         drm_printf((printer), "%.*s" fmt, (indent), "\t\t\t\t\tX", ##__VA_ARGS__)
             |                               ^~~~~~
       drivers/gpu/drm/xe/xe_tuning.c:226:17: note: in expansion of macro 'drm_printf_indent'
         226 |                 drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
             |                 ^~~~~~~~~~~~~~~~~
    
    That's because it will still process the last entry when tracking the
    active tunings. The same issue exists in the WAs. Change
    xe_rtp_process_to_sr() to also take the number of elements so the empty
    entry can be removed and the warning should go away. Fixing on the
    active-tracking side would more fragile as the it would need a `- 1`
    everywhere and continue to use a different approach for number of
    elements.
    
    Aside from the warning, it's a non-issue as there would always be enough
    bits allocated and the last entry would never be active since
    xe_rtp_process_to_sr() stops on the sentinel.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202503021906.P2MwAvyK-lkp@intel.com/
    Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch f02ab9f6e182046bd0df9b5e50e968bd57ed290f drm-intel
548127ed6209 drm/xe/rtp: Drop sentinels from arg to xe_rtp_process_to_sr()
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
>> include/drm/drm_print.h:228:31: warning: '%s' directive argument is null [-Wformat-overflow=]

total: 0 errors, 1 warnings, 0 checks, 174 lines checked


