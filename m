Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EE7C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 13:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C782410E0F6;
	Tue, 19 Mar 2024 13:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCtAGwKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D585B10E0F6
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 13:02:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5898045"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5898045"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:02:55 -0700
X-ExtLoopCount2: 2 from 10.252.36.139
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13850236"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:02:54 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Tue, 19 Mar 2024 15:02:51 +0200
Resent-Message-ID: <87edc6nzlw.fsf@intel.com>
Received: from orviesa009.jf.intel.com (ORVIESA009.jf.intel.com
 [10.64.159.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7DE04580D14;
 Wed, 13 Mar 2024 23:52:46 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12209294"
Received: from fmvoesa107.fm.intel.com ([10.64.2.17])
 by orviesa009-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 23:52:46 -0700
X-IPAS-Result: =?us-ascii?q?A0ENAAAZnvJlmLHS/INaHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBgjgZAYE4gQmMcl+JBJgWhVuBQDIbAQEBAQEBAQEBCS4TAQIEAQEDB?=
 =?us-ascii?q?IR/iAQCJjQJDQEBAgQBAQEBAwIBAgEBAQEBAQgBAQECAgEBAQIBAQYDAQEBA?=
 =?us-ascii?q?QIQAQEBAQEBAQEeGQUQDieFLz0NgjcegSZeBwk4AQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBFAINWwEBHwIEAQEvAQ0BAQQKKQECAwECBgJEBAgDAWsFgnuCYAMFt?=
 =?us-ascii?q?WGCLIEBggoBAQaCZq46gWEJgUgBjHmEZHongih6hAOBUoMGOIV2gheDO514S?=
 =?us-ascii?q?oElA4EFaxsQHjcREBMNAwhuHQIxOgMFAwQyChIMCx8FVANDBkkLAwIaBQMDB?=
 =?us-ascii?q?IEuBQ0aAhAsJgMDEkkCEBQDOAMDBgMKMTBVQQxQA2QfGhgJPA8MGgIbFA0kI?=
 =?us-ascii?q?wIsPgMJChACFgMdFgQwEQkLJgMqBjYCEgwGBgZdIBYJBCUDCAQDUgMgchEDB?=
 =?us-ascii?q?BoECwdSJoM/BBNEAxCBNIoiggyBNiqBd4FhAwkDBwVJQAMLGA1IESwWHxQbB?=
 =?us-ascii?q?iIfbwekUAGBDoJAxg4HhBWhJxozqi0BLodYkFmkG4RhgWQ6AoFaMxojgzdSG?=
 =?us-ascii?q?Q+OIIN6j3tBNTsCBwsBAQMJhUYBAYNZAYFHAQE?=
IronPort-PHdr: A9a23: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
 1XUMMRHf0587cR6dVvQyGam7Iz5ZMPZabou
IronPort-Data: A9a23:hBKsKamSfGXdlebYYbYpeQvo5gxmIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWm6FP/zfZ2P0fdx2bIrio0MAu8SEnYdnTgdorCtkFC4T+ZvOCP2ndXv9bniYRiHhoOOLz
 Cm8hv3odZhsJpMJjk71atANi1Eii/nQLlbbILedYnkrLeNcYH59z0glwYbVu6Yy6fChGQSBp
 NjulMPWPV6hylZcP3kdg065gEoHUM/a5nVA4TTSWdgR5AWCzyJMV8pDTU2MByKQrrd8T7bSq
 9nrkenRElPxp38FFt6jm7DnRUwGKpa60d+m0SI+twCK23CulwRqukoJHKN0hXR/0l1lq+tMJ
 OBl7vRcfy9yZ/GRx75NO/VvO3oW0aVuoNcrKJUk2CCZ5xWun3DEmp2CAKytVGGxFyke7Wxmr
 JQlxD4xgh+rnfq4/Z7mTMpWudkedtHvZcQPnEhN5GSMZRomacirr6Ti6tZS0XE+nM1DEfvFZ
 NYecXxodhuojx9nYwxOTshjxqHy3yG5KmIHwL6WjfJfD2z7zQpt3byoP9TFP9aNWMNek12wo
 mPd43+/DAsXOdCS0jmZ9WrqgfXA9c/+cNJLT+3kraQCbFu74ncVER0GckKCp/STt2uxXMxVL
 3QG0397xUQ13BX3EYisBnVUukWstxIVXpxVEvYo4xOEyYLQ4gCEFi4FSCJMbJots8pebTUs2
 l7PhNP4GT1HtLyTVGLb97GIoDf0Mi8QRUcAbCkFCw0E4MTnqak3jxTSXpBiFrK4ipv+HjSY6
 zKDqjUllfMQl9wazLen+l7GgBqop57UXkg04BnaWiSu6QYRTIyiYIqh8h7f5PZcLYCUSHGFv
 X4Zi46f6vwDCdeGkynlaOYEHfe36vaAOTvRh3ZrHp8853Ks/WKuecZb5zQWDERgN8cAPzzuZ
 k7eshFX9bdXPX23fel2ZZ68D4Ihyq2IPdHsX+rIY9wIZpF3dw+A5jpyTUqR2X391kkqjaw7f
 5ycdK6ECH8RCKlliiK/W+oZ2q06xQg6xGXOVdb6yQiq1fyVY3v9YbIMKlCPaKYz4bmCqRnS7
 NdUJeOOyhNCQKv/ZDXa9cgYKlViBX0yGIrx7cdXe+6KKCJiGWc8G7nQx68sf8pumKE9vuLJ9
 XG0V0tvxkfXgXzBNBXMa3Z/ZbepVpF6xVo+PC8le1W13GA7aIKmxKMecYYnO7gh6OFni/VzS
 pEtfcSaB/NeDDjO4BwZbJ/gvMpjcgimgUSFOC/NSCQ4epd7VUrM+8T4dxfH8CgIEzrxtM0ir
 rnm3QTeKbIfWR5+D8GQdei00lewu1AZmeRvTw3JJMVefAPn940CAzLwivs6ZdodMxfKwjKy0
 weQHAdepO/Rrotz+97M7YiWr4qvAvZhNk5bGXTLq7ewKSTeuGGkxOd9vP2gcjnXWSX64qiva
 ehOzO37KLsAhlkiX5dA/6hD17ow2veyoZxg8RlZRm3PNhO7LIpNCyzTtSVQjZFlyrhcsAqwf
 0uA/NhGJLmEUP8J9nZMfmLJiczej5kpdinu0BgjHKntCMZKEFevXkxYMl+CkiFQILZuM58i2
 aEmosF+B+2DZvgCYoruYsN8rjrkwpk8v0MP68ty7GjD11BD9726ScaAYhIaGbnWAzm2DmEkI
 yWPmI3JjKlGy0zJfhIbTCeUhbEA2cpf40AXkTfuwmhlfPKY3JfbOzUMq1wKovh9lH2rLsotZ
 zUwaSWZ243Sr1+Ee/Svr0j1R14QVUTxFr3Z01wTiGnQSUXgTXDEMGB1JOCM4k0D6GNAb1BmE
 EKwlg7YvcLRVJiphEMaABc9w9S6FIwZ3lOZwqiPQZ/ad6TWlBK42MdCk0JS9Uu+aS7w7WWaz
 dRXEBFYMvanZXNB+fFqVeF3F904EXi5GYCLetk4lIshHGfAdTX00j+LQ31dsOsUTxAW2SdUw
 PCC6i6Cu9pSGcpOQv0m6XYwHoJJ
IronPort-HdrOrdr: A9a23:tVH6oag4LEMHMHnDahNLpqNc43BQXjsji2hC6mlwRA09TyX5ra
 qTdTogpGbJYVEqKQ4dcLW7VpVoLkmsjqKdi7N8AV6dZniuhILFFvAE0WMNqweQbhEX2IZmpN
 BdmoJFea7N5WETt7eP3OFTe+xQtuVviZrY99s2rE0dMT2CFZsQlTuRUTzrYnGeLTMubfFXZf
 nsgvaviADQMUj/Bf7LfkXtMdKzweEiVfrdEGA77lkcmWuzZDWTid6KdiRwpi1uLg+mTt8ZgB
 n4emHCi5mejw==
X-Talos-CUID: 9a23:M0LusWGOye0Ojw9sqmJ97EApNp0jUUfi0UqKO0vhTnZPcZC8HAo=
X-Talos-MUID: 9a23:2Me8SgSTLdNnJ5qyRXTInzd7NNdP+p2oBWowtJoBpcOADT5ZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8138432"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="8138432"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024
 23:52:45 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id C97E310E339;
 Thu, 14 Mar 2024 06:52:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D12610E339
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Mar 2024 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710399162; x=1741935162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bd6gOSmqFNlHUS2lGal5yp+lrXJlI67Mc6Mhq4esAuA=;
 b=mCtAGwKEMMFILXilIPPPG6lB715wUInq33Ow6/eslP3ldkoepZ9kdXU2
 1mnMijbToZTZBdeNjbJ0haZiVLSS5DpBBmx/4gFlNG3d+XZjOM4cpuv+j
 vwjZT8KSuwUl4UwuiJTJv1RvTTOvDka+5t5VQd/lrGltjorExNvkb9CFO
 6/NNBBR6nAn4MaXEsjJhtWTH9EPzMqNr6/pKdo6ZrIEFh/6yQOey2ZInu
 gR6OjKY+QWmELiljZAp2mhMS+y9L9IZ0toDLdeI0jv21cOOF72C+WVD14
 iAjoekSQBd3/DVMQlEJ+KRxlUjfPyiH2hthdEu2HvcJc9VRrE8y82gHfe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5805899"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5805899"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 23:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12076481"
Received: from rscales-mobl4.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.251.209.110])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 23:52:40 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: luca@coelho.fi,
	gustavo.sousa@intel.com
Subject: [PATCH] drm/xe/display: fix type of intel_uncore_read*() functions
Date: Thu, 14 Mar 2024 08:52:21 +0200
Message-Id: <20240314065221.1181158-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
X-TUID: F053ms9/aiaP
X-BeenThere: intel-xe@lists.freedesktop.org
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

Some of the backported intel_uncore_read*() functions used the wrong
types.  Change the function declarations accordingly.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index cd26ddc0f69e..ef79793caa72 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -25,15 +25,15 @@ static inline u32 intel_uncore_read(struct intel_uncore *uncore,
 	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
 }
 
-static inline u32 intel_uncore_read8(struct intel_uncore *uncore,
-				     i915_reg_t i915_reg)
+static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
+				    i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
 	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
 }
 
-static inline u32 intel_uncore_read16(struct intel_uncore *uncore,
+static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
 				      i915_reg_t i915_reg)
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-- 
2.39.2

