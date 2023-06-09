Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC870C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 07:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9018B10E640;
	Fri,  9 Jun 2023 07:37:25 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FB510E640
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686296244; x=1717832244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DQjlkqS2++t+hSpa/itHU0Ff5CIs+VyLQTM3mJgtoTg=;
 b=CV17MiyjDOSAJHCwheYTlJGb88REkqB3RsQ9QDEgHiBD8nTTozdqJagz
 +7Xk0uKWvGzYxKLeNVqC0bEkM6c8B2JMqG2x6j5WGMWQG51YYb9JM8okH
 em/PY/bvVgX2AV3de+dq352zkdacSgxlWet0a0sNYwXEzvZgfWXAa/5rk
 REMJHu619lFJeIRGzav/MAUTLPq3vxaJaI+fX9a2NeWtQMu3294zFiyPm
 zNsh+IH3yjGDKVg+ygyfr5xFL2ktZYDsEUVTnZM53SIayWL+Yo8v2AUDq
 k2Q5lzcGo3SNjChIRrlAEglv3gMvZambPI6XVoNUvEMyE2BL0RdhQUXkV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337174996"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="337174996"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 00:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="822962312"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="822962312"
Received: from rotariux-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.211.8])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 00:37:22 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 07:37:11 +0000
Message-Id: <20230609073713.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/2] drm/xe: uAPI cleanup
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series addresses some feedback on xe_drm.h provided here:
https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html

v2: Fix ordering of defines and fields in uAPI (Lucas De Marchi)
v3:
  - Rebase on drm-xe-next
  - Remove some empty lines, add documentation to structures related to
    drm_xe_device_query, changed pseudo code to snippet (Lucas De Marchi)
v4:
  - Move changelog to commit
  - Fix warnings showed only using dim checkpath

Francois Dugast (2):
  drm/xe: Document structures for device query
  drm/xe: Move defines before relevant fields

 include/uapi/drm/xe_drm.h | 148 ++++++++++++++++++++++++++++++--------
 1 file changed, 117 insertions(+), 31 deletions(-)

-- 
2.34.1

