Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855B1606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E2F1121B3;
	Thu, 26 Nov 2026 08:43:27 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F561121B7;
 Thu, 26 Nov 2026 08:43:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_sysctrl_event_for_?=
 =?utf-8?q?page_offline_full?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 08:43:26 -0000
Message-ID: <179568260608.90725.1545969961671011278@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126083516.1932195-5-riana.tauro@intel.com>
In-Reply-To: <20261126083516.1932195-5-riana.tauro@intel.com>
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

Series: Handle sysctrl event for page offline full
URL   : https://patchwork.freedesktop.org/series/179718/
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
commit dae873e972b8e00dae0c27ce38bbc5f0f91f021b
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Nov 26 14:05:20 2026 +0530

    drm/xe/ras: Skip offline queue processing after device unplug
    
    The system controller worker can drain the offline queue at runtime.
    During teardown, devres runs ras_fini() before sysctrl_fini(), so the
    worker can still run after the offlined pages XArray is destroyed:
    
      CPU0 (teardown)                 CPU1 (sysctrl worker)
      ras_fini()
        xa_destroy()
                                      xe_ras_get_offline_queue()
                                        ...
                                          xa_store()
      sysctrl_fini()
        disable_work_sync()
    
    Wrap xe_ras_get_offline_queue() in drm_dev_enter()/drm_dev_exit().
    drm_dev_unplug() runs before devres teardown and waits for in-flight
    sections, so no queue processing runs after ras_fini().
    
    Assisted-by: LLM
    Reported-by: Sashiko
    Closes:https://sashiko.dev/#/patchset/20261124134323.1529876-2-riana.tauro%40intel.com
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch e377ccfd8caff03e7aad914dbd9052cc9a291cd9 drm-intel
d5118882070e drm/xe/ras: Wedge the device on page offline failure in all callers
0affb63343b3 drm/xe/sysctrl: Drain page offline queue on queue-full event
dae873e972b8 drm/xe/ras: Skip offline queue processing after device unplug
-:23: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#23: 
Assisted-by: LLM

-:23: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#23: 
Assisted-by: LLM

-:24: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Sashiko'
#24: 
Reported-by: Sashiko

total: 2 errors, 1 warnings, 0 checks, 24 lines checked


