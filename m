Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D8EEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 21:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D8710E25A;
	Mon, 26 Jun 2023 21:22:47 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4D710E25A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687814565; x=1719350565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J2MeT3D0pSrqRY9hcbbJcCAB2N46ki7ipPlaOq0OZbk=;
 b=UwZM/JkTpZCOWpsqvVJtkqE5oOH9GG9cFLQqq7ke1C14R5tYkKJsQJnU
 oFWIQJnpvglDeI3awjqtUo3klHm4DxISf0SygJ60tysT3TtY+lXaRaMdL
 UcO69b9n579jxuqf9q1xjLYqf9nhjpWcIaz35FTcgPmIH7r0k2t39BDAn
 FNU7Z2tT1MmVl3GH1RzsmVzQ1WzWrqGHylMLN8QUjQer2ZbaLmNp+MA8f
 2dyKkSfJ12FRuUs5oOZynQUkXfMMkwFyurmcCtfUyfOLMq4d9892YDNbr
 dtzToMGpzcgLoMO/zLUzyPdnoPsje6zvJVAnwT06wp2UtazxvyPTY6TUf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="351175986"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="351175986"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 14:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="716300863"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="716300863"
Received: from swalke-mobl2.amr.corp.intel.com (HELO
 przanoni-mobl.amr.corp.intel.com) ([10.209.112.16])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 14:22:44 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 14:22:21 -0700
Message-Id: <20230626212221.136640-2-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
References: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: properly check bounds for
 xe_wait_user_fence_ioctl()
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

If !no_engines, then we use copy_from_user to copy to the 'eci' array,
which has XE_HW_ENGINE_MAX_INSTANCE members. The amount of members
copied is given by the user in args->num_engines, so add code to check
that args->num_engines does not exceed XE_HW_ENGINE_MAX_INSTANCE. It's
an unsigned value so there's no need to check for negative values.

Fixes error messages such as:

    Buffer overflow detected (54 < 18446744073709551520)!

Very simple reproducer:

    https://people.freedesktop.org/~pzanoni/wait-user-fence-bug/

Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 3122374341d6..098e2a4cff3f 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -121,6 +121,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			 addr & 0x7))
 		return -EINVAL;
 
+	if (XE_IOCTL_ERR(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
+		return -EINVAL;
+
 	if (!no_engines) {
 		err = copy_from_user(eci, user_eci,
 				     sizeof(struct drm_xe_engine_class_instance) *
-- 
2.39.2

