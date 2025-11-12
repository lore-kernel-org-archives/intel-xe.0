Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A418ACD3428
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 17:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E37E10E780;
	Wed, 12 Nov 2025 17:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4Udlytd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD3210E780
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762967620; x=1794503620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P74iJkk1uS/juExv6I0SktIfuNTqNApIc1xsbLqLt68=;
 b=E4UdlytdHpJI993/tNwmJfgB+NgzYZBR7A9516SO2uu+z6AWr0Fe5OGf
 VHx8cE82Y4HijnraHGrVJ9rM1JyYz/WdOrfpLYjJAYNrb1+IUJQihf0LY
 zsp3rrldT886c5H9kIjebzECUIebJIhzRZxsf80JE0TDaL/i86KzGzFnE
 tsQTjxzdUrtDiQchbzwwQFMRUWv85D3kfPexzD1g8/ZkUdOgYWeYGaHx5
 /avtjR2Jl/4rSczeSqIR3mz15dMbN/TI6N9BIl9CZfwWDJMBTXVO0y3FD
 gSJ4UpSWKNBTIkfv326qT/uS5ePLrZOOmFlq4X3/qWdu7q8wksgeVe6R4 A==;
X-CSE-ConnectionGUID: 6CdI7FG3RueIHNDKE98Dmw==
X-CSE-MsgGUID: MBP+LragSrShyTcDceIiTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75648774"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75648774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 09:13:40 -0800
X-CSE-ConnectionGUID: oZHuO/PyQm++UDdFowTb2w==
X-CSE-MsgGUID: +dqDSIYkQCqSNLAHQX174Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="220016093"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 09:13:39 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v2] drm/xe/pcode: Rework error mapping
Date: Wed, 12 Nov 2025 09:12:59 -0800
Message-ID: <176296756964.3565775.6049409359323932162.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110-pcode-errmap-v2-1-cb18c8f54238@intel.com>
References: <20251110-pcode-errmap-v2-1-cb18c8f54238@intel.com>
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

On Mon, 10 Nov 2025 08:41:08 -0800, Lucas De Marchi wrote:
> The sparse array used for error decoding from is unnecessarily big. It
> should be better handled by a switch statement that will also allow us
> to more easily improve this code.
> 
> Add a CASE_ERR() macro to keep the table compact and use it instead of
> the 256-entries array, which saves some space:
> 
> [...]

Merged to drm-xe-next, thanks!

[1/1] drm/xe/pcode: Rework error mapping
      commit: 459a0ce8dcb19edbd270d26b07fc9d72bfeece36

--
Lucas De Marchi

