Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF5EC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 04:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C1510E7E5;
	Thu,  2 May 2024 04:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mu1ikOlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4530E10E7E5
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 04:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714623505; x=1746159505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zLQ6MyNCDQW6HdxNnjLWT+NE8Wh3KFsEVw+XWeXO85Y=;
 b=Mu1ikOlCdzB/DU9doEF60tHyTiCcfkRJz/JhTYHWyC/GxpvJ6KczDcaG
 uq22M5W882lH2DHNt5RVT3pQrrtKCRfNLINToHwpw5gKne+OeaOZd/2ig
 3whBuGATzltUnd/bhP334idZD26mXBPJp3/jOUkUN5DMy7U2z4RfhxYSG
 5KWKBwDqosbrZ7fnSaW9DqrvL9MtGTGSBqG5WPdkFGQ5bvZqWCK4IUNeA
 QoQNtEv3SZe0WbzEaZ/2FvjeUuDQ3pbLEBXvEA1SNPu74dww90TgL7k55
 2Cpyi904LJGDV2dzQwyL7/zm5467Bgn1veT2nP+x1D57+ctOUk2PjEBfe g==;
X-CSE-ConnectionGUID: cp6pPX38SZeGOK/LkVmYuQ==
X-CSE-MsgGUID: uu3q3cLARCSzMPthrysEnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14155792"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="14155792"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 21:18:24 -0700
X-CSE-ConnectionGUID: AqBLaG2OQi+gjVrOSQXixQ==
X-CSE-MsgGUID: TLS1dzUZQ3uIRpE+BgfabQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31611116"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 21:18:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [xe-for-ci v3 0/2] LNL GSC FW support
Date: Wed,  1 May 2024 21:19:16 -0700
Message-ID: <171462351410.3723520.7559381849375007157.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
References: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
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


On Wed, 01 May 2024 16:18:27 -0700, Daniele Ceraolo Spurio wrote:
> The flow is the same as MTL, so the only things we need to add on the Xe
> side is the FW definition. Due to the FW not being in its final state
> yet, we can't push it to linux-firmware yet so it needs to be in the
> xe-for-ci branch.
> Also, the mei patch required for the mei driver to run on LNL (which is
> needed for GSC proxy) is not merged yet, so it has been included here to
> be merged in xe-for-ci while we wait for it to land in Linus' tree
> (via char-misc).
> 
> [...]

Applied both patches to topic/xe-for-CI, thanks!

[1/2] mei: me: add lunar lake point M DID
      (no commit info)
[2/2] drm/xe/gsc: define GSC FW for LNL
      (no commit info)

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
