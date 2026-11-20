Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF54606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UG+WhhjW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4168510E573;
	Fri, 20 Nov 2026 07:05:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1766F10E149;
 Fri, 20 Nov 2026 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795158294; x=1826694294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hSt3Gyok3sQciV+F6Hc6wTqoQP43I6rVgbKlBqqkpkU=;
 b=UG+WhhjWjUHSBZDdsSb3RYMUtzay6tJiVftPk3o0ZN8h7bU4Qs7bkUg4
 6SxHmd4jRmcp0Gyd9EHjPKNc2WO/+T27sZ0vTZESv52IgAFCSpDUT7NWa
 g+BM6fRCxfSNuxr8d1sBrYdAVyiRphNw+F9g6agHAhIQF20qJat9WXOy8
 JigPKAY/5udshLTTxcpBITe0u/zTNDf4Ywauoz6XmDRvmHA2lrs8uZpyY
 Zqe9kJn0hok7rOr1Be4cgmTSbqUOy2OITMLRCHX2oTDXP+d7R0CqoeRyz
 puxZmEqwKNzPjarId6Goxma1EpmkK4s0T/jSO8Kyx8EWWzbrqW+I3sqzG A==;
X-CSE-ConnectionGUID: ssj7dzWwTvie4hu+7MaTag==
X-CSE-MsgGUID: tVmw4VBfQHydyA0OuulsWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4023936"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4023936"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:04:40 -0800
X-CSE-ConnectionGUID: dWKUpHKJQ7itJXMGMKkkSw==
X-CSE-MsgGUID: K0srfLfeS0ig9epeljfnEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10971739"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2026 23:04:38 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: Eriksen Xie <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/lt_phy: Fix the main link to TX mapping
Date: Fri, 20 Nov 2026 15:02:32 +0800
Message-ID: <20261120070233.2339748-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DS4PPFE901A304FFE20F33BBF2CAE5C4009E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261119070444.2106229-1-xiaolu.xie@intel.com>
 <DS4PPFE901A304FFE20F33BBF2CAE5C4009E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 06:06:23AM +0000, Kandpal, Suraj wrote:
> Please break these commits into a 2 patch patch series, one in which you
> Add changes to intel_lt_phy_enable_disable_tx and the next one which has
> changes related to Voltage swing programming

Done. The TX enable change is patch 1/2 and the voltage swing programming
is patch 2/2 of a new series, please review the two patches there:

https://patchwork.freedesktop.org/series/179181/

Regards,
Eriksen Xie
