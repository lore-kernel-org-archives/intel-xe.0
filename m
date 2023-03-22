Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FD5C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 02:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A96310E21F;
	Wed, 22 Mar 2023 02:29:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FF710E21F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679452180; x=1710988180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IAVHjue2dEpWX6OFzLbFBYJrra/pyy/qsaB1NC3f0NA=;
 b=DQ5o3m8Ypw+53SQDpBo/jqbxaMQV2j65/7kNKlcT7eLUe1qT6Syaq0Pq
 WL688tb6RgDCcgAZQIZwfjfm4yqBrXQP9XrRgPH7+LMtPRly0Av/g5BtU
 nvHCDEEJe1tk3ND/gnGPmVv4QdZHyTgVN6J2KeNv1xvyurNOpW7rZMGHK
 BZjzOtNEjKzJ2D01OyC8YoJDY35RGm+AIV1p+oDuweO4vY1bHv8SHLy7B
 sKTPY8b2Kc4+QTfYqUxwm8OGtwvg/3cnHDtM5Fzgz5CTOv1c+smQ4U10b
 sCs3Dm83/svxddvYWbuJ3Ifm029UxTCB6n54SVtuxqBL4hkZ+D8HxF0X1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327489613"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="327489613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 19:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825210982"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="825210982"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 19:29:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 21 Mar 2023 19:29:34 -0700
Message-Id: <20230322022935.797427-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/1] Proposal for engine query uAPI
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

Adding a new IOCTL rather than reworking the DRM_IOCTL_XE_DEVICE_QUERY
IOCTL. Reworking that is an option is people have a strong opinion on
it but I personally like what I put together.

The media UMD needs something like this.

Let's agree on the uAPI and then get this implemented.

Matthew Brost (1):
  drm/xe/uapi: Add query engines uAPI

 include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

-- 
2.34.1

