Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEF4606A32D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 13:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3B10E7D4;
	Mon, 23 Nov 2026 13:57:58 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA57C10E7D4;
 Mon, 23 Nov 2026 13:57:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fras=3A_Hint_a?=
 =?utf-8?q?t_application_page_fault_for_local_compute_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Nov 2026 13:57:56 -0000
Message-ID: <179544227688.70035.16053001925069203698@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261123091356.1877750-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20261123091356.1877750-1-ravi.kishore.koppuravuri@intel.com>
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

Series: drm/xe/xe_ras: Hint at application page fault for local compute errors
URL   : https://patchwork.freedesktop.org/series/179361/
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
commit a58d09a04737b6a3a48126aa4f94479887a8d1f1
Author: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Date:   Mon Nov 23 14:43:56 2026 +0530

    drm/xe/xe_ras: Hint at application page fault for local compute errors
    
    Unhandled application page faults are reported by the hardware as local
    core core compute uncorrectable errors. Users reading the resulting SIGID
    203 log treats it as a hardware failure.
    
    Add an additional log to the core compute error message for local uncorrectable
    errors that they are often caused by an application page fault.
    
    Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
+ /mt/dim checkpatch b8e68d05659b6fae1eb6b4883565786fbb15ef45 drm-intel
a58d09a04737 drm/xe/xe_ras: Hint at application page fault for local compute errors
-:8: WARNING:REPEATED_WORD: Possible repeated word: 'core'
#8: 
core core compute uncorrectable errors. Users reading the resulting SIGID

-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Add an additional log to the core compute error message for local uncorrectable

total: 0 errors, 2 warnings, 0 checks, 17 lines checked


