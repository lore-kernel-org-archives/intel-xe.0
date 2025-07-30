Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD11C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 08:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336C910E424;
	Wed, 30 Jul 2025 08:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OmEtZnvF";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4275410E420
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 08:00:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B850960007;
 Wed, 30 Jul 2025 08:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F0EC4CEE7;
 Wed, 30 Jul 2025 08:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1753862440;
 bh=/T5b6N58U6ei8Ijjniy8RRrNzgFVjma3N3puHvaEjh8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=OmEtZnvFuheB56qL+m0knG8vgMo6XeRZaxC6b7M2ZRfy0jIIPpP1MNPY+Dbvj6Saf
 L9fo+6XVvpNIPc3bBq3CcaywgzEV3yn8M+8Hu7+HDw8L7Tgo+ZAf+4ZWr5hn3cyb5b
 NmTJgTZcZhD15u0Fqj2/XvwK+0pMXAby/W30u7XU=
Subject: Patch "Revert "drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()"" has been added to the 6.12-stable tree
To: badal.nilawar@intel.com, gregkh@linuxfoundation.org,
 himal.prasad.ghimiray@intel.com, intel-xe@lists.freedesktop.org,
 lucas.demarchi@intel.com, michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, tomitamoeko@gmail.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 30 Jul 2025 10:00:20 +0200
In-Reply-To: <20250729110525.49838-5-tomitamoeko@gmail.com>
Message-ID: <2025073020-discolor-hypnotic-c719@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-xe-forcewake-add-a-helper-xe_force_wake_ref_has_domain.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-165055-greg=kroah.com@vger.kernel.org Tue Jul 29 13:06:06 2025
From: Tomita Moeko <tomitamoeko@gmail.com>
Date: Tue, 29 Jul 2025 19:05:25 +0800
Subject: Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"
To: "Lucas De Marchi" <lucas.demarchi@intel.com>, "Thomas Hellström" <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Tomita Moeko <tomitamoeko@gmail.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>, Badal Nilawar <badal.nilawar@intel.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20250729110525.49838-5-tomitamoeko@gmail.com>

From: Tomita Moeko <tomitamoeko@gmail.com>

This reverts commit deb05f8431f31e08fd6ab99a56069fc98014dbec.

The helper function introduced in the reverted commit is for handling
the "refcounted domain mask" introduced in commit a7ddcea1f5ac
("drm/xe: Error handling in xe_force_wake_get()"). Since that API change
only exists in 6.13 and later, this helper is unnecessary in 6.12 stable
kernel.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/xe/xe_force_wake.h |   16 ----------------
 1 file changed, 16 deletions(-)

--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -46,20 +46,4 @@ xe_force_wake_assert_held(struct xe_forc
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
-/**
- * xe_force_wake_ref_has_domain - verifies if the domains are in fw_ref
- * @fw_ref : the force_wake reference
- * @domain : forcewake domain to verify
- *
- * This function confirms whether the @fw_ref includes a reference to the
- * specified @domain.
- *
- * Return: true if domain is refcounted.
- */
-static inline bool
-xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
-{
-	return fw_ref & domain;
-}
-
 #endif


Patches currently in stable-queue which might be from tomitamoeko@gmail.com are

queue-6.12/revert-drm-xe-forcewake-add-a-helper-xe_force_wake_ref_has_domain.patch
queue-6.12/revert-drm-xe-tests-mocs-update-xe_force_wake_get-return-handling.patch
queue-6.12/revert-drm-xe-gt-update-handling-of-xe_force_wake_get-return.patch
queue-6.12/revert-drm-xe-devcoredump-update-handling-of-xe_force_wake_get-return.patch
