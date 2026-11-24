Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679A606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 02:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AvSGVIx1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9C510E2D1;
	Tue, 24 Nov 2026 02:27:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B6110E2D1;
 Tue, 24 Nov 2026 02:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795487268; x=1827023268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l29zmfhzIH4DD46Q5W7pw0sFlgDyNXXejKb81Dfpzy4=;
 b=AvSGVIx1mojXQPAwoFRx8KcT1fOjDTJNicEgDd0My0cQZnuV72hU4aGg
 mdPQapvJh27FKtu3R1xoL+1GvYhP2DybCB/mvrSMn/2lQWdKIfOXhl4MI
 odiS+WM0WgzflM3tT9+BHxOw+TdIsGmqnHgZ6EoBv6+t0SuJlhqZA6tnt
 wSTCYBsjSpvXq2Gn95dOt5JirLETBNB1Td32If0oPIM+IGjbhs/F2Y4QT
 CkeffJtGNmcxTxL9+zkY1tDRWBnXfY0sDFIgWEtDjNbblX7v/4WGc422V
 FjceVSTbQKRDkR6JkUcLTT8bp6RipP9izOWe80GAWfauTtmQlbNVKxaAs A==;
X-CSE-ConnectionGUID: Kwtp4sF9TdWtQrBHHIfsXg==
X-CSE-MsgGUID: nlxi1FE+T/OCnLwUrIG+ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4204709"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4204709"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 18:27:48 -0800
X-CSE-ConnectionGUID: gQ8gAWHXRQmyjaztwDMhkg==
X-CSE-MsgGUID: X9V8hW/KQ4K/Z+AMzOCoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11762678"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa009.jf.intel.com with ESMTP; 23 Nov 2026 18:27:45 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Eriksen Xie <xiaolu.xie@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v2 0/2] drm/i915/lt_phy: Fix the ML to TX mapping
Date: Tue, 24 Nov 2026 10:25:41 +0800
Message-ID: <20261124022541.2524385-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <fd03c9af88037c78b8bf6d1b49d38157adf16729@intel.com>
References: <fd03c9af88037c78b8bf6d1b49d38157adf16729@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Mon, 23 Nov 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> For future reference, please don't send whole series in-reply-to
> previous version of the series. It has a good chance of confusing both
> the CI and the people.

Understood, thanks. I will send each new version as a separate thread.

Please ignore the v2 that was sent in reply to the v1 review
(cover.1795156437.git.xiaolu.xie@intel.com). It is superseded by the v2
that I resent as a standalone series
(cover.1795157860.git.xiaolu.xie@intel.com). CI has passed on both:

  xe:   https://patchwork.freedesktop.org/series/179181/
  i915: https://patchwork.freedesktop.org/series/179182/

Regards,
Eriksen Xie
