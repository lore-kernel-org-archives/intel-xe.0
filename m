Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE75C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 14:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AC410E4FF;
	Tue, 31 Oct 2023 14:22:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8511810E4FF
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698762114; x=1730298114;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=syhVFeZuOs0nBIbK82bx7Qlkc2OMb4sZ4W1DoxSkigc=;
 b=KEfhLq942J3vvx95TaJ5apShFTRkZgZPz1spzvngLrEXPqru4DC0vBC+
 ISUORHGW/v4hQpKLcC3I8A/HxpibiENbNi9vGQcDxoetn9uQ5doTiG6N2
 b+5BF3pn8Jfo0OEnNdbtJh7Ib77bRg4iauGeDPtkptdKfVB5LVUN6SCZe
 p9ucW1LbUSl+lGyaJ1UhwfdPgGBi8CWC0DCWkNWschqqRcnAgOl2WLbx2
 5XNeWM1xWVNk3WyOIkeGI+ybjwIzdHWREq3fqRQKRDjoZIqwOlrgUtWvu
 jlv3qOI47VOQV0o2sU1chlCNAmORszAy7fxRhzFC4xx/kPEAAddr13w5s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387183170"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="387183170"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="934126094"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="934126094"
Received: from olindum-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:21:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 15:21:33 +0100
Message-ID: <20231031142133.17129-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031142133.17129-1-thomas.hellstrom@linux.intel.com>
References: <20231031142133.17129-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI HAX 11/11] drm/xe: Disable panic_on_warn for testing
 purposes
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 kernel/panic.c                 | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8341acf66e5f..5374c548b61d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -278,7 +278,7 @@ int xe_device_probe(struct xe_device *xe)
 	u8 id;
 
 	xe_pat_init_early(xe);
-
+	panic_on_warn = 0;
 	xe->info.mem_region_mask = 1;
 	err = xe_display_init_nommio(xe);
 	if (err)
diff --git a/kernel/panic.c b/kernel/panic.c
index bc59531848e4..1c8057027f20 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -59,6 +59,7 @@ static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
 bool crash_kexec_post_notifiers;
 int panic_on_warn __read_mostly;
+EXPORT_SYMBOL_GPL(panic_on_warn);
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
 static unsigned int warn_limit __read_mostly;
-- 
2.41.0

