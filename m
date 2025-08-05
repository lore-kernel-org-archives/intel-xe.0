Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40F7C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 15:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62AB10E6BB;
	Tue,  5 Aug 2025 15:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6hP6cU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF7910E17C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754406339; x=1785942339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UvFt325H2ddHYG0zwhrgV+7iVtxapQS/yRuF4LCyWs=;
 b=V6hP6cU4SO78EE+5ldB65eUhbuNt/LZUE53jgPLXLUvamQaKuSKPmf+V
 Lq8tntWeBl/Oui+9NmLDjVFcWLvlGCdX9vctomUFdtyKfQuDtF7cuqP5g
 8R3J2q+Du3/LlKC/+KZzqmancktPwmRHV1xMKrHCMnU7vLL1mECgdFz5J
 /l2CL1OtvGQuWQb2vTStsO/DVtpZ32J46HpCtrxBC1nHkA68kNzlBw1d3
 vyvFw2OfW74eCTAh2yYQ1FHeT/1kIPCvLSKTyud8U9l8lZnLLHbmh1W0t
 Q52g+dGiAyfO/g1eKhm38613e3XkOI6XVlpYggpNnHDXN+VZ1ao+5QzWz Q==;
X-CSE-ConnectionGUID: MX3LdqY+QT+MZX2fqWHkXA==
X-CSE-MsgGUID: yE9iMuIFQbyt9aRC+iCfNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56839670"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56839670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 08:05:39 -0700
X-CSE-ConnectionGUID: FmNjd+pPQHq7txAuRufSzg==
X-CSE-MsgGUID: ElHvbJc1RWqe84WUjaaXPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164840756"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 08:05:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, shuicheng.lin@intel.com
Subject: Re: [PATCH v5] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable
 functions
Date: Tue,  5 Aug 2025 08:05:22 -0700
Message-ID: <175440630682.1510368.8995388885204263222.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728194806.68176-2-jonathan.cavitt@intel.com>
References: <20250728194806.68176-2-jonathan.cavitt@intel.com>
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


On Mon, 28 Jul 2025 19:48:06 +0000, Jonathan Cavitt wrote:
> Presently, multiple versions of the guc_waklv_enable_.* function exist,
> all with different numbers of dwords added to the klv_entry array.  This
> is not extensible, and more duplicates of the function will need to be
> created if it ever becomes necessary to support 3 or more dwords per wa
> in the future.
> 
> Consolidate the disparate guc_waklv_enable functions into a single
> guc_waklv_enable function that can take an arbitrary number of dword
> values.
> 
> [...]

Applied, thanks!

[1/1] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
      commit: 7c9de25efa7677acd4feae905165571be05b6f29

Best regards,
-- 
Lucas De Marchi

