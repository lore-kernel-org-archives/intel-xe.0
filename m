Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053FCC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 13:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01F0113C0B;
	Fri,  5 Apr 2024 13:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSDGbChq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE5D113C08
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712323575; x=1743859575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=emRJwhnJ9+vaPRrVLDERJs0TBYBs8HjcfyT+haY5hj4=;
 b=NSDGbChqAqVZrFvzdmwBG900Nmsf+mikciTS+CmzXRIkxqRDms3eM79r
 T49W1VYeLxup6qPE/hw/OvPqNFOvN5Zo888NetoUXUx+iBjWNPkCwXg3b
 mlJaYFcIDoRB2iF8aqPAUnktoqZ5DSBHmCuwN3LHw52Z+AB1bvVjAPg3i
 dInwUYD34S2rgDL9e8iRVu4bmpZ1F/mwh55HCSVsgvbrJbsyLZUZu/pNS
 IZ/YU4RjQU9hUaT1g44+7ZzXztAOakX+hdA4bDEiKBJ1/EQsu9+xeR1ho
 8/QZ+cOxBub/XodcZaHBdIG3BAeiFT9w/4AM/gsgftLqgmcp1UT2/2mkq Q==;
X-CSE-ConnectionGUID: dGwnK2VVRPG4zHNItut6Eg==
X-CSE-MsgGUID: zq3AiKCyTeKUR2hvjru80g==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18261419"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="18261419"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:26:14 -0700
X-CSE-ConnectionGUID: 6FpgaFR7RBOMvHueu/rxlw==
X-CSE-MsgGUID: 6OeJkLqGTeuQ0mzNIllQpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23648016"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:26:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: fix multicast support for Xe_LP platforms
Date: Fri,  5 Apr 2024 06:26:50 -0700
Message-ID: <171232358794.2007704.14799312551208971848.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405-mcr_adlp-v2-1-2fd1e4325ef2@intel.com>
References: <20240405-mcr_adlp-v2-1-2fd1e4325ef2@intel.com>
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


On Fri, 05 Apr 2024 08:23:36 +0200, Andrzej Hajda wrote:
> Xe_LP has six sublices per slice.
> 
> v2: fixed commit message and subject (Matt)
> 
> 

Applied, thanks!

[1/1] drm/xe: fix multicast support for Xe_LP platforms
      commit: 788d2ad60d961f1f2713fa17856bce509a966d40

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
