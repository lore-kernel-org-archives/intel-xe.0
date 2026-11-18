Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24CE606A320
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 23:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXtnjRzO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613EA10E5CB;
	Wed, 18 Nov 2026 23:56:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E3A10E5CB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 23:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795046159; x=1826582159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/1uWy9AurfXWBeCWra9coZiFg5B3vvvjOtctXAAdETs=;
 b=NXtnjRzOys1ny6wsu8mUTd6C+PzWSg6H6oFfDDqXsdemwjy/cCHBxG97
 hZ9Q/7jHtMd39qm5Iaqu+7IXyNunjEflQ3WSyJK016SKbD1HMbk/QVY0s
 MiJ7iUgh6G4uenee/bNSRpC7P+gnL9OTIJw4lxCPg6DZ99UXl4E0LMlpc
 8XScAm+zIzzFfKyJ907lyk/857eAyFdVTXvYO8Yj5gWvDxf3zXR/wAdcD
 bb5nrsMqK9JMrErXN6j5HG/yav1Jda1pVNGwzmfZ77uRZIrhyT+o5ZZoZ
 meZ6nhLKSFKl9ZwfLeDDbtjrZwx79D6V367jMHl9ip4q3GcSOS6ViSqz0 g==;
X-CSE-ConnectionGUID: AYbBaT48QW61JEZ6cKsNww==
X-CSE-MsgGUID: 61uZniohS+CDAfSbMDxLzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3917045"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3917045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 15:55:58 -0800
X-CSE-ConnectionGUID: D9FsMCthRimkgBtkF/COEg==
X-CSE-MsgGUID: u9bFk3tnRIaw/cwZ7LzH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10205357"
Received: from fvishwan-4tb.jf.intel.com ([10.54.60.87])
 by orviesa007.jf.intel.com with ESMTP; 18 Nov 2026 15:55:57 -0800
From: FNU VISHWANATHA <fnu.vishwanatha@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 FNU VISHWANATHA <fnu.vishwanatha@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Restore PF config before resuming submission
 after GT reset
Date: Wed, 18 Nov 2026 15:56:38 -0800
Message-Id: <20261118235638.295939-1-fnu.vishwanatha@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233946.275114-1-fnu.vishwanatha@intel.com>
References: <20261118233946.275114-1-fnu.vishwanatha@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adding Daniele and Tomasz to Cc for review, together with Piotr and
Matthew. The patch moves the PF configuration restore in do_gt_restart()
ahead of xe_uc_start() after a GT reset.

Patchwork: https://patchwork.freedesktop.org/series/178984/

Thanks,
Vishwanatha
