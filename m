Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCEF606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cO9Vr4Td
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8200A10E7D4;
	Wed, 18 Nov 2026 13:23:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD4910E7D4;
 Wed, 18 Nov 2026 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795008199; x=1826544199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=orLhpNxWLsDTW4OXLwRPSIs9ubp8XtYvMJIKuWMl+YM=;
 b=cO9Vr4TdUJioBZ/4faNg4usY789DPw+QSOS8J5iNwYL6P4vVORe93EVT
 cF5Kw8Vj9EX9KekaEB1/knolO8bTSZcr6wdED9XFN9IA9LEhXR1frLOgM
 qlYXJv1TxZqSpnA6WFkQvhLHPKRgrxeCsrbnkR0XKJxyJ0bNtMo9Dchkq
 jsbVRIrG7eHUsWchlgp6Yx0oxmOh6aErLlDJRWhTCUKhEP6qdR9/Kh0qJ
 BtV03xfavQeTrQ8kSMcNOYoO+dH7TZITYpSsBgjD+0hGB9Fow/PXHCDIL
 suPKnCxkgd7jvirAT46q9gOnDIvTiSz0sf3/7ZcmC7NxVSUL2OxL7ZJZs A==;
X-CSE-ConnectionGUID: 5L7xTD7uSjSAOjzpH5X0TQ==
X-CSE-MsgGUID: OaeUWt78SuypTzZV+URdrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3665055"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3665055"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:23:19 -0800
X-CSE-ConnectionGUID: X3viN7QDSKOOnE1/nXFZzg==
X-CSE-MsgGUID: xWlqggESQU+c0h0hlyvarA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10152091"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 05:23:17 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Eriksen Xie <xiaolu.xie@intel.com>
Subject: Re: [PATCH v2] drm/i915/dip: Write the DIP header last
Date: Wed, 18 Nov 2026 21:21:10 +0800
Message-ID: <20261118132110.2024050-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <55f8ef22-9581-416e-a446-59660390818e@intel.com>
References: <20261113074849.30768-1-chaitanya.kumar.borah@intel.com>
 <55f8ef22-9581-416e-a446-59660390818e@intel.com>
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

On Wed, Nov 18, 2026 at 08:42:35AM +0000, Nautiyal, Ankit K wrote:
> Xiao Lu, the VSC_SELECT clearing is a good catch on its own. It can go
> as a separate patch on top of this one.

Thanks, sent it as a separate patch:
https://patch.msgid.link/20261118131441.2023100-1-xiaolu.xie@intel.com

It doesn't depend on this patch and applies with or without it.
