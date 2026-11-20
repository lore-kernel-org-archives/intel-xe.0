Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59CF606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 01:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798F510E322;
	Fri, 20 Nov 2026 01:52:02 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B2D10E322;
 Fri, 20 Nov 2026 01:52:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_drm/xe=3A_Disallow_freq_changes_while_mert_cap_is_acti?=
 =?utf-8?q?ve?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 01:52:01 -0000
Message-ID: <179513952121.55773.84773351769094229@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119222958.1239889-3-vinay.belgaumkar@intel.com>
In-Reply-To: <20261119222958.1239889-3-vinay.belgaumkar@intel.com>
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

Series: series starting with [v4,1/2] drm/xe: Disallow freq changes while mert cap is active
URL   : https://patchwork.freedesktop.org/series/179144/
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
commit 82048f98c40ce4bbd34043f61a18773286c63a06
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Nov 19 14:30:00 2026 -0800

    drm/xe: Add sysfs to disable RPe
    
    When SLPC is initialized, GuC sets the GT min freq to RPe(efficient) by
    default. This frequency is desgined for optimal perf/power ratio. However,
    certain use cases may want to run at lower frequencies. This sysfs allows
    user to disable use of default RPe behavior.
    
    Efficient frequency will now be controlled by this interface alone. Setting
    min_freq < efficient will not disable RPe. When RPe is enabled, GuC raises
    min to RPe and lowers it back when disabled.
    
    Update pc_set_mert_freq_cap() to now disable RPe before stashing min freq.
    This ensures we are saving the real min freq instead of the elevated one.
    
    $ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
    1
    
    v2: Address Sashiko comments.
    v3: Disable RPe before stashing freq before mert cap (Sashiko)
    v4: Disable RPe inside pc_adjust_freq_bounds (Sashiko), make use_rpe a
    bool (Anirban)
    
    Cc: Sk Anirban <sk.anirban@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 9bf864cd53c8e7651a038b9be01b2b0dfc67b420 drm-intel
293a37a11d4e drm/xe: Disallow freq changes while mert cap is active
-:18: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#18: 
Assisted-by: LLM

-:18: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#18: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 146 lines checked
82048f98c40c drm/xe: Add sysfs to disable RPe


