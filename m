Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B764CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 16:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDB410E507;
	Mon, 15 Sep 2025 16:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2og3tzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826EE10E507
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757954448; x=1789490448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wySYGM3mEJ4kC9iBQVMEz1JWNl7M4IJU/QbTIOkV0uo=;
 b=j2og3tzx76jG7tFxHcXMCCsE0WIvDWhd50T51vD2TKr1FH5MTaYGr8Nl
 KZTQ618q1ZhIYQDI1KPDn3yfxMp++OcW/M5ZqhtAiMKo4Qp9ZCEXfd8Mq
 VxyznnLGVlv0CbzoQsituLP3H203O7CB8//Qvo/wpKLRICQB0T7TzC/yg
 8P6P4ZO/+4CHf4OgjMWlvky3UK/tKT1CAY7m+x/83CYsn1BVS19vNI8gh
 BjaO8vlbba58KEDVuyfzPeM3jPdTAor0oWjj84BBO8Bcr8nutVVu73g27
 xBcX8BWNo79zE6Y9z6Eh4QIDV5wyGM55dC5vcVgv+9/XvO96/MYJ3MMmp w==;
X-CSE-ConnectionGUID: /JEkr8JLQn2dQAE7XXtElw==
X-CSE-MsgGUID: IIWLv9+FQKuiMSM9X65D5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59443965"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="59443965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 09:40:48 -0700
X-CSE-ConnectionGUID: YxD4CjWxR1eCavn8nLWbVw==
X-CSE-MsgGUID: y/7AvfKuRimyQ8RUN9TYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="178674502"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 09:40:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Use ARRAY_SIZE in guc_waklv_init()
Date: Mon, 15 Sep 2025 09:39:18 -0700
Message-ID: <175795433074.1173505.14096781273801891028.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250912-guc-ads-array-size-v1-1-a6555392a1f8@intel.com>
References: <20250912-guc-ads-array-size-v1-1-a6555392a1f8@intel.com>
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

On Fri, 12 Sep 2025 15:05:34 -0700, Lucas De Marchi wrote:
> Prefer using ARRAY_SIZE where needed and just passing 1 instead of
> calculating the size of one element.
> 
> 

Merged to drm-xe-next, thanks for the review!

[1/1] drm/xe: Use ARRAY_SIZE in guc_waklv_init()
      commit: 19baa830fbb60d712137dfbdf97a538f7057d100

--
Lucas De Marchi

