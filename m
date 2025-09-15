Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A32CAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 16:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B2C10E501;
	Mon, 15 Sep 2025 16:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZJff+kD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7858F10E500;
 Mon, 15 Sep 2025 16:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757952853; x=1789488853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fIl4EQm8X53vLKnGyqeYKDusxTRNzKa1zEs/PJI+TCg=;
 b=SZJff+kD2kgR4y7AXRnqy/1q8LWOoPTcXGEPmn/SKrjM0UsOx6LdFDVZ
 M84Q6I8M465u3sb6mvB1YG+tGc9gqaIS7zSOduubmREMskS/wkmxq0AWc
 e7xZopTrkdwX2t/gxeJdqIJAU/WHnHgMB1lnjlrS/w49B4+k2Uur5z2cK
 FFlZdNgSscAejsRBny+qRvkKAqMyR3olaIT2oPDut7cl94DcbaimXtP3E
 v61Y2tUOFhbtYh8wHqVXDuF87N9KjkaIbRb6zqJrm+LCPTYT8mHsc0H4r
 0K06wkUQwibI3Rn6RqCsIhNn4uCaKm2nUpVU4iWKnOnnT80AZ4IPnZ766 w==;
X-CSE-ConnectionGUID: 6gzkagaESdWa3fFg+cb41g==
X-CSE-MsgGUID: PcFCg0ObSPucvJe5qJaMqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59258695"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="59258695"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 09:14:13 -0700
X-CSE-ConnectionGUID: jOgNHchGSa6ClAris+8UYA==
X-CSE-MsgGUID: vEDc43SbTIii3zhOeiOmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="178984435"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 09:14:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, Fushuai Wang <wangfushuai@baidu.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe: Use ERR_CAST instead of ERR_PTR(PTR_ERR(...))
Date: Mon, 15 Sep 2025 09:13:54 -0700
Message-ID: <175795281719.1169271.2201520306552068189.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250914101630.17719-1-wangfushuai@baidu.com>
References: <20250914101630.17719-1-wangfushuai@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 14 Sep 2025 18:16:30 +0800, Fushuai Wang wrote:
> Use ERR_CAST inline function instead of ERR_PTR(PTR_ERR(...)).
> 
> 

Merged to drm-xe-next, thanks!

[1/1] drm/xe: Use ERR_CAST instead of ERR_PTR(PTR_ERR(...))
      commit: 84afb84bcc28b08e6d8a4e36865959d770e2643d

--
Lucas De Marchi

