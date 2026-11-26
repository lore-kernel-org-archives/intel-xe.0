Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84884606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 21:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8NuqTak
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444A511271A;
	Thu, 26 Nov 2026 21:27:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43D910EA98;
 Thu, 26 Nov 2026 21:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795728463; x=1827264463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z5NoL1Q6BkGELc7kjqjq0vRgaTSgjkm4D7V0lJs8ZbQ=;
 b=l8NuqTakjWrWuEkSbGbvg0xlCnDB1kCsYAbwGAkARNCZKxc6YFOe9nEA
 RQQJWj3fB5iXYlx9vNAwDG+lU11PdV2PlIrNGdwC6fyaIPIU90IWXcSy8
 5m1TRTlrWgsYlSmOluXW/WBI8O/baYoON7hjeIbJsL0GNDlqvaMRKwFQo
 xNsBwtY8ITfkb/bEb3dVIzIaT1WJcS8HQVdjMtgwqaUFEZ1dnmT6Jfn5Z
 J5nDSHhG5XwA5usD/na5t1RQPe3IEFrAqSnPWfWvBYbUJNoeEKpkzTSGu
 WCYo+a3SJXOuEr8pdcBHZwrwn2UTpJR0E/QRCAFgIQ3k5nsFpBG2pzKMh A==;
X-CSE-ConnectionGUID: mymNe3C1S2uns6UPu364pA==
X-CSE-MsgGUID: LrvSWVgrTsuuVB4Q7fhieQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4531797"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4531797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:43 -0800
X-CSE-ConnectionGUID: QnWqDt1QQaiR65g4wLtHwg==
X-CSE-MsgGUID: smrZpccFQy+G6kkc3DK2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12037774"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:42 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/de: Pimp the intel_reg_rw tracepoint printf
 format
Date: Thu, 26 Nov 2026 23:27:23 +0200
Message-ID: <20261126212728.9034-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make the intel_reg_rw tracepoint prints a bit more pleasant:
- Make the "read" vs. "write" field the same width so the
  following columns all line up when reading+writing the
  same registers
- Zero pad the value to the full register width. Counting
  hex digits to figure out if I'm looking at bit 26 or bit
  22 isn't particularly fun.

I was also considering making the register offset field a
constant width so things wouldn't shift around when the register
offsets are in different ranges. But I don't really want to zero
pad that as it makes it harder to see which register it is, and
all the other options would add extra whitespace gaps into the
string which doesn't seem like a good idea either. I guess most
of our register offsets are in the five hex digit range anyway
so this probably doesn't matter all that much.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_trace.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index fe69d203549b..0cd1eed0bccf 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -978,9 +978,10 @@ TRACE_EVENT(intel_reg_rw,
 		__entry->len = len;
 		),
 
-	TP_printk("%s reg=0x%x, len=%d, val=0x%x",
-		__entry->write ? "write" : "read",
-		__entry->reg, __entry->len, __entry->val)
+	TP_printk("%5s reg=0x%x, len=%d, val=0x%0*x",
+		  __entry->write ? "write" : "read",
+		  __entry->reg, __entry->len,
+		  __entry->len * 2, __entry->val)
 );
 
 #endif /* __INTEL_DISPLAY_TRACE_H__ */
-- 
2.56.1

