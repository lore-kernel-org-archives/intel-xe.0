Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEDBC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 02:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2919110E21F;
	Wed, 22 Mar 2023 02:34:48 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411B710E222
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 02:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679452487; x=1710988487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X2fIEmDvWylxQYiux5OUGlevayncoww9Bb6clTSaWdk=;
 b=d1zhMtm8XE3op9DxqrSk36W+rL5kCem57sY76fqxgCQvJjzbi4kGeR8I
 z3uK63k5+XuhBC60bp5GyQHyYCDDxx3JwBbdA3NIA+qtAUY7rdVsonPep
 gRM3S9iW02XPmgAb2oyCydSm2RXNdBBBuWp5zs2sLKo50mAYe8c/gsFfO
 Q3Z66Jy0dfmfVDWEGJh6owErcVK2jScyPGKPWsfXKTeZ3q7xlj3OvmcSh
 oZW9pbCzpZpJrbamP8FhfjRD8xHhwL5o10if7CMISzDtlWC+a5aWR4pz1
 ndLlS8AZ19iuQ8hF5tI5+tF9x+Gl5Z4/+WSN99bw8TXNiEBLgQbga22US g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341467521"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="341467521"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 19:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="712062214"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="712062214"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 19:34:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 21 Mar 2023 19:34:49 -0700
Message-Id: <20230322023450.797598-1-matthew.brost@intel.com>
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

v2: Forgot local changes on the patch

Matthew Brost (1):
  drm/xe/uapi: Add query engines uAPI

 include/uapi/drm/xe_drm.h | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

-- 
2.34.1

