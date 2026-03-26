Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12305106F2FE
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 08:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16AE10E8E6;
	Thu, 26 Mar 2026 08:27:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C06110E8E6;
 Thu, 26 Mar 2026 08:27:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_use-after-free_on_fra?=
 =?utf-8?q?mebuffers_and_property_blobs_when_calling_drm=5Fdev=5Funplug_=28r?=
 =?utf-8?q?ev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Mar 2026 08:27:39 -0000
Message-ID: <177451365961.400393.15814142865267701054@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260313151728.14990-3-dev@lankhorst.se>
In-Reply-To: <20260313151728.14990-3-dev@lankhorst.se>
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

Series: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug (rev5)
URL   : https://patchwork.freedesktop.org/series/162134/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 73681c3564e3cee535999de6d1545ef9b59b2da4
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Mar 26 09:22:18 2026 +0100

    Revert "drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug"
    
    This reverts commit 6bee098b91417654703e17eb5c1822c6dfd0c01d.
    
    Den 2026-03-25 kl. 22:11, skrev Simona Vetter:
    > On Wed, Mar 25, 2026 at 10:26:40AM -0700, Guenter Roeck wrote:
    >> Hi,
    >>
    >> On Fri, Mar 13, 2026 at 04:17:27PM +0100, Maarten Lankhorst wrote:
    >>> When trying to do a rather aggressive test of igt's "xe_module_load
    >>> --r reload" with a full desktop environment and game running I noticed
    >>> a few OOPSes when dereferencing freed pointers, related to
    >>> framebuffers and property blobs after the compositor exits.
    >>>
    >>> Solve this by guarding the freeing in drm_file with drm_dev_enter/exit,
    >>> and immediately put the references from struct drm_file objects during
    >>> drm_dev_unplug().
    >>>
    >>
    >> With this patch in v6.18.20, I get the warning backtraces below.
    >> The backtraces are gone with the patch reverted.
    >
    > Yeah, this needs to be reverted, reasoning below. Maarten, can you please
    > take care of that and feed the revert through the usual channels? I don't
    > think it's critical enough that we need to fast-track this into drm.git
    > directly.
    >
    > Quoting the patch here again:
    >
    >>  drivers/gpu/drm/drm_file.c        | 5 ++++-
    >>  drivers/gpu/drm/drm_mode_config.c | 9 ++++++---
    >>  2 files changed, 10 insertions(+), 4 deletions(-)
    >>
    >> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
    >> index ec820686b3021..f52141f842a1f 100644
    >> --- a/drivers/gpu/drm/drm_file.c
    >> +++ b/drivers/gpu/drm/drm_file.c
    >> @@ -233,6 +233,7 @@ static void drm_events_release(struct drm_file *file_priv)
    >>  void drm_file_free(struct drm_file *file)
    >>  {
    >>      struct drm_device *dev;
    >> +    int idx;
    >>
    >>      if (!file)
    >>              return;
    >> @@ -249,9 +250,11 @@ void drm_file_free(struct drm_file *file)
    >>
    >>      drm_events_release(file);
    >>
    >> -    if (drm_core_check_feature(dev, DRIVER_MODESET)) {
    >> +    if (drm_core_check_feature(dev, DRIVER_MODESET) &&
    >> +        drm_dev_enter(dev, &idx)) {
    >
    > This is misplaced for two reasons:
    >
    > - Even if we'd want to guarantee that we hold a drm_dev_enter/exit
    >   reference during framebuffer teardown, we'd need to do this
    >   _consistently over all callsites. Not ad-hoc in just one place that a
    >   testcase hits. This also means kerneldoc updates of the relevant hooks
    >   and at least a bunch of acks from other driver people to document the
    >   consensus.
    >
    > - More importantly, this is driver responsibilities in general unless we
    >   have extremely good reasons to the contrary. Which means this must be
    >   placed in xe.
    >
    >>              drm_fb_release(file);
    >>              drm_property_destroy_user_blobs(dev, file);
    >> +            drm_dev_exit(idx);
    >>      }
    >>
    >>      if (drm_core_check_feature(dev, DRIVER_SYNCOBJ))
    >> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
    >> index 84ae8a23a3678..e349418978f79 100644
    >> --- a/drivers/gpu/drm/drm_mode_config.c
    >> +++ b/drivers/gpu/drm/drm_mode_config.c
    >> @@ -583,10 +583,13 @@ void drm_mode_config_cleanup(struct drm_device *dev)
    >>       */
    >>      WARN_ON(!list_empty(&dev->mode_config.fb_list));
    >>      list_for_each_entry_safe(fb, fbt, &dev->mode_config.fb_list, head) {
    >> -            struct drm_printer p = drm_dbg_printer(dev, DRM_UT_KMS, "[leaked fb]");
    >> +            if (list_empty(&fb->filp_head) || drm_framebuffer_read_refcount(fb) > 1) {
    >> +                    struct drm_printer p = drm_dbg_printer(dev, DRM_UT_KMS, "[leaked fb]");
    >
    > This is also wrong:
    >
    > - Firstly, it's a completely independent bug, we do not smash two bugfixes
    >   into one patch.
    >
    > - Secondly, it's again a driver bug: drm_mode_cleanup must be called when
    >   the last drm_device reference disappears (hence the existence of
    >   drmm_mode_config_init), not when the driver gets unbound. The fact that
    >   this shows up in a callchain from a devres cleanup means the intel
    >   driver gets this wrong (like almost everyone else because historically
    >   we didn't know better).
    >
    >   If we don't follow this rule, then we get races with this code here
    >   running concurrently with drm_file fb cleanups, which just does not
    >   work. Review pointed that out, but then shrugged it off with a confused
    >   explanation:
    >
    >   https://lore.kernel.org/all/e61e64c796ccfb17ae673331a3df4b877bf42d82.camel@linux.intel.com/
    >
    >   Yes this also means a lot of the other drm_device teardown that drivers
    >   do happens way too early. There is a massive can of worms here of a
    >   magnitude that most likely is much, much bigger than what you can
    >   backport to stable kernels. Hotunplug is _hard_.
    
    Back to the drawing board, and fixing it in the intel display driver
    instead.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reported-by: Guenter Roeck <linux@roeck-us.net>
    Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
    Fixes: 6bee098b9141 ("drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug")
+ /mt/dim checkpatch ddf93a5c967d452d7c3ab937818c20b95498842d drm-intel
73681c3564e3 Revert "drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug"
-:45: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#45: 
>> @@ -233,6 +233,7 @@ static void drm_events_release(struct drm_file *file_priv)

-:120: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#120: 
Reported-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

total: 0 errors, 2 warnings, 0 checks, 35 lines checked


