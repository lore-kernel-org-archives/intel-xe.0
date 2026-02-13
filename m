Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DBEF99E4
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C16F10E848;
	Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVgFDXNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E23F10E327
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021957; x=1802557957;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=eJKcDPpeo6By5SG0PbRsXqHJ08RHZu3uOR4v8kk+BIQ=;
 b=DVgFDXNTFPXSjfAnEoqPT8q0IJB/90a+4aJ9ctGcli2QBlAV0EFzxokm
 kB2MTrH1AuOAWFL1XPr/H6sAbngA+E98s32I/QMlAuRunbSt7ZCdNDQhD
 EXteR2NaDxVh9vSlavM4vOI1J+dstpeKCDbljw5JCJXYRINKYqblhNCLw
 HewHEOosPGC/4JgoYQdjGKRPmhwKl8e/j3gBfTOZrHxBd7G2IFmL7xfsc
 JeFw7LJTY6ZGJEwK3eSp9WveVEPdZkaJ5IBu4GoLvJL1HejXAbmLLDg3R
 o+96bjExIHqoeAeSr8thIPrrBb/h+gBkI5s6rZ51vCdTSjMZRQLDN2HHq A==;
X-CSE-ConnectionGUID: HtPUSRBbSJqsdSi/4NaMUA==
X-CSE-MsgGUID: sY4aUaNSS+CMFaYSibU4vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654430"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
X-CSE-ConnectionGUID: U38mYwVQTNC0X80V1YPhKA==
X-CSE-MsgGUID: cZ5+f+t1RiCscgTznJqb1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705629"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:38 -0800
Subject: [PATCH 03/22] drm/xe/wa: Document new policy regarding workaround
 IP ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-3-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3650;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=eJKcDPpeo6By5SG0PbRsXqHJ08RHZu3uOR4v8kk+BIQ=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aBhUptiqS8aMbVWo3WfESt7vLoFFyVnowqJ
 yau+WyyYa6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgQAKCRBNeSQFyHKQ
 BLC6EACUBe0D///CqF16JipgkIbT9YtoMlHFouSBjliJjzbUBvUUZNR5tzir3Vq1S+5y3BmQ+Co
 OOZoDrxvfrmBkQO4/cXz5xqX/UvzbLQl/i9E91KH6InNe68SJFA5ElLqRCDV8BqETyoJMWowpbg
 3shO98HVzU7fqQ+sEzFAtOxfEO+0kmAuoeIhdgE44lnbvpKZHUBN7w+TolErQ+HVlaCeu2mb2sA
 MCEyqFFd/ALdj8dWEZuLc4dCBim7LxdqSAI8n1Z5zk7cjFeLDtReKGZc/TpDqMhFoI6QeWDK8Sh
 fQfk5dgoMzc4cn0o3fyIzBwU6GKxsh8KzooNZe1eQj6/A8SqzckyY/Yj/7pxbwyniwJUOJrqOns
 9QF778R31DLbNPqEIC4KGsr+f37BvjLiGTrOLTcGU7bTtyDNWpialMrwwD8Ckj5aJaok1CXkddg
 N+1SOOYVeKLOLQ03HyV3mVnxJ2HL5YI8QV6jQDzARV8DfZNO50hHBs7WgnGj64BKvNLgWesp4kx
 H0Aj2mUndJtpVVccvpdfsI6PIvHm1vLtIujRy90CoN07pEBLCzmo+QAfUhl8EcUD+WKbBY3+T13
 UujWNTmwrZqMaE3b3zEWCeFT9MxsR827m4iS92dNf8qGncdE9z2K3WL/oV/GxXUuUICsvTitSbW
 JVtjadd+1oXv6+w==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

During early Xe driver development, our policy for applying workarounds
to ranges of IP versions was to only use GRAPHICS_VERSION_RANGE and
MEDIA_VERSION_RANGE rules when all of the affected IP versions had
consecutive version numbers; otherwise separate RTP entries should be
used.  For example, a workaround that applies to all Xe2-based platforms
would be implemented in the driver with two RTP entries:  one using
GRAPHICS_VERSION_RANGE(2001, 2002) and the other using
GRAPHICS_VERSION(2004).  This ensured that if a new IP variant showed up
in the future with currently unused version 20.03, an old workaround
entry wouldn't automatically apply to it by accident (and we could
always consolidate those two distinct entries in the future if the
workaround database did explicitly indicate that 20.03 also needed the
workaround).

Now that we're a couple years down the road with this driver, the number
of IP versions supported is much larger (several Xe2 20.xx versions,
several Xe3 30.xx versions, and a couple Xe3p 35.xx versions).  When new
workarounds are discovered that need to apply to a wide range of IPs,
it's becoming more of a pain to create independent entries for each
non-contiguous range of versions, and the general consensus is that we
should revisit our previous policy and start allowing use of
VERSION_RANGE constructs for non-contiguous version ranges.

Note that allowing ranges that cover currently unused versions will
require additional care if/when some of those intermediate version
numbers start being used in the future.  We'll need to re-check every
workaround that has a range including the new IP version and check the
hardware database to see whether the workaround also applies to the new
version (no code change required) or whether we need to split the
existing range into two separate ranges that don't cover the new
version.  The platform enabling engineers are willing to take on this
extra review burden at the time we first enable a new IP in the driver
(see lore link below for one recent discussion).

Update the kerneldoc for the workaround file to make the new policy
official.

Link: https://lore.kernel.org/all/20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com/
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index fb1ce4479dd81a5fe91906948cd37a7e654b655c..8a9badb7f1085b10378ce410c2cb8ea495e53e7d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -111,6 +111,17 @@
  *    difference of how they are maintained in the code. In xe it uses the
  *    xe_rtp infrastructure so the workarounds can be kept in tables, following
  *    a more declarative approach rather than procedural.
+ *
+ * .. note::
+ *    When a workaround applies to every single known IP version in a range,
+ *    the preferred handling is to use a single range-based RTP entry rather
+ *    than individual entries for each version, even if some of the intermediate
+ *    version numbers are currently unused.  If a new intermediate IP version
+ *    appears in the future and is enabled in the driver, any existing
+ *    range-based entries that contain the new version number will need to be
+ *    analyzed to determine whether their workarounds should apply to the new
+ *    version, or whether any existing range based entries needs to be split
+ *    into two entries that do not include the new intermediate version.
  */
 
 #undef XE_REG_MCR

-- 
2.53.0

