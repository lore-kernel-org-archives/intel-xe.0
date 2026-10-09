Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67869CA601D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 16:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8C610E0F4;
	Fri,  9 Oct 2026 16:42:08 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B7F10E0F4;
 Fri,  9 Oct 2026 16:42:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/i2c=3A_Fix_use-aft?=
 =?utf-8?q?er-free_on_driver_unload?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 16:42:06 -0000
Message-ID: <179156412681.4433.7132114973117874646@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
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

Series: drm/xe/i2c: Fix use-after-free on driver unload
URL   : https://patchwork.freedesktop.org/series/175858/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ed32c9bfcfbbed5ddb8fa6db38767f975c83c08
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Fri Oct 9 22:12:42 2026 +0530

    drm/xe/i2c: Fix use-after-free on driver unload
    
    The kernel crashes when unloading the xe driver on CRI:
    
     Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
     RIP: 0010:platform_device_release+0x80/0x90
     Call Trace:
      device_release+0x44/0xa0
      kobject_put+0x9b/0x250
      put_device+0x13/0x30
      platform_device_unregister+0x29/0x40
      xe_i2c_remove+0x80/0xa0 [xe]
      devm_action_release+0x16/0x30
      release_nodes+0x3d/0x140
      devres_release_all+0x96/0xd0
    
    This started after commit 0f485f88656af ("drm/xe/i2c: use
    device_create_managed_software_node()"), which attaches a managed
    software node to a platform device created with platform_device_alloc().
    
    Comment above the device_create_managed_software_node function cautions
    that the software node created by it should not be shared or reused as
    the lifetime of the node is linked to the device.
    
    But the DesignWare i2c driver which creates an adapter device as a child
    of the platform device reuses the software node as its fwnode.
    (device_set_node() in i2c_dw_probe()).
    
    During module unbind, when the adapter device is deleted, it drops the
    reference count for the software node and frees the software node.
    Later when the platform device is removed, it tries to dereference the
    software node pointer and results in use-after-free.
    
    Instead of managed software node use a static struct software_node
    passed through platform_device_info.swnode to
    platform_device_register_full().
    But we have a blocker which doesn't allow to use
    platform_device_register_full() simply.
    
    Currently the driver is using the two step alloc/add sequence while
    creating the platform device so that i2c->pdev is set before
    platform_device_add(), because xe_i2c_notifier() needs i2c->dev and it
    can run before platform_device_register_full() returns.
    
    We can fix it by removing the dependency on i2c->dev in
    xe_i2c_notifier(). It is using it to match against the right adapter.
    Instead of using the device, use its parent to match.
    
    Fixes: 0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
    Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch a9079e63263acdef3db9b768ef47cfaf779a97aa drm-intel
4ed32c9bfcfb drm/xe/i2c: Fix use-after-free on driver unload
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
 Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73

total: 0 errors, 1 warnings, 0 checks, 69 lines checked


