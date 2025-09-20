Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85158CAC5A7
	for <intel-xe@archiver.kernel.org>; Sat, 20 Sep 2025 23:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1217D10E13F;
	Sat, 20 Sep 2025 23:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p477SXld";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F8910E13F
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Sep 2025 23:17:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F2B1344530;
 Sat, 20 Sep 2025 23:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A78C4CEEB;
 Sat, 20 Sep 2025 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758410276;
 bh=G/KVEA6ViEWnKvN1kHms/3KktEfZIelB3DdtbCJIg34=;
 h=From:Date:Subject:To:Cc:From;
 b=p477SXldWwo2M0sODjdZxFK6EMik9VbIfWdFl263uvQtZcyjIVfi9+SxvDmRzHw+E
 2+qtD97oCZjP3CVp9vOCwToOJTHdcWzMzdHthiycDDEDjiVTh0Ha214NXh8IAKVtDN
 WICQXr/XZxIPqLTGYMiQY96I584WwhjclK/zLgoxfY691p2XtHTN2zWZ/abxjNKqKY
 HnIbwNaXGeXzX3GFJ0bOOGUmOgBcy7ndY3ScDoAjoahWjd8QzbjPXFpPyD8g2Qia8G
 mrxCWlzHtQzy6wVWC19ksPRJoCAyZ6UgdNMP604+OrMLgKWTG2hR1jdfe+rZVhVsp6
 fYwsUWfiAxVeg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 20 Sep 2025 16:17:50 -0700
Subject: [PATCH] mei: late_bind: Fix
 -Wincompatible-function-pointer-types-strict
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-drm-xe-fix-wifpts-v1-1-c89b5357c7ba@kernel.org>
X-B4-Tracking: v=1; b=H4sIAB02z2gC/x2MywqAIBAAf0X23IKvoPqV6FC51h4q0agg/Pek4
 zDMvJAoMiXoxAuRLk587AVUJWBex30hZFcYtNS1bLVEFzd8CD0/eLMPZ8K68U5NZI1xFkoXIhX
 7P/sh5w9pLI6lYwAAAA==
X-Change-ID: 20250920-drm-xe-fix-wifpts-58fd1be433d4
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Anshuman Gupta <anshuman.gupta@intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235; i=nathan@kernel.org;
 h=from:subject:message-id; bh=G/KVEA6ViEWnKvN1kHms/3KktEfZIelB3DdtbCJIg34=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnnzZQm7b9X9GQT44VEbi8DbaWy7E5bhuanT5bycma45
 ArvUVndUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACaS94fhr/xyvfoNTNo366oV
 Hz/h6PrefvTA/40rxTfvES75aho7w5nhf9Ksk96rEr5ElZ0PU1w/MfDNiTjbU+Llf/89s7u3SFz
 EhR8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

When building with -Wincompatible-function-pointer-types-strict, a
warning designed to catch kernel control flow integrity (kCFI) issues at
build time, there is an instance in the new mei late binding code
originating from the type parameter of mei_lb_push_payload():

  drivers/misc/mei/mei_lb.c:211:18: error: incompatible function pointer types initializing 'int (*)(struct device *, u32, u32, const void *, size_t)' (aka 'int (*)(struct device *, unsigned int, unsigned int, const void *, unsigned long)') with an expression of type 'int (struct device *, enum intel_lb_type, u32, const void *, size_t)' (aka 'int (struct device *, enum intel_lb_type, unsigned int, const void *, unsigned long)') [-Werror,-Wincompatible-function-pointer-types-strict]
    211 |         .push_payload = mei_lb_push_payload,
        |                         ^~~~~~~~~~~~~~~~~~~

While 'unsigned int' and 'enum intel_lb_type' are ABI compatible, hence
no regular warning from -Wincompatible-function-pointer-types, the
mismatch will trigger a kCFI violation when mei_lb_push_payload() is
called indirectly.

Update the type parameter of mei_lb_push_payload() to be 'u32' to match
the prototype in 'struct intel_lb_component_ops', clearing up the
warning and kCFI violation.

Fixes: 741eeabb7c78 ("mei: late_bind: add late binding component driver")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/misc/mei/mei_lb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/mei/mei_lb.c b/drivers/misc/mei/mei_lb.c
index 77686b108d3c..78717ee8ac9a 100644
--- a/drivers/misc/mei/mei_lb.c
+++ b/drivers/misc/mei/mei_lb.c
@@ -134,8 +134,7 @@ static bool mei_lb_check_response(const struct device *dev, ssize_t bytes,
 	return true;
 }
 
-static int mei_lb_push_payload(struct device *dev,
-			       enum intel_lb_type type, u32 flags,
+static int mei_lb_push_payload(struct device *dev, u32 type, u32 flags,
 			       const void *payload, size_t payload_size)
 {
 	struct mei_cl_device *cldev;

---
base-commit: d9b2623319fa20c2206754284291817488329648
change-id: 20250920-drm-xe-fix-wifpts-58fd1be433d4

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

