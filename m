Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C16CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 19:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F74410EB8C;
	Fri, 22 Aug 2025 19:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUPuRsaX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA8E10EB8C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755890553; x=1787426553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wE0sRKowQnicyEn+Q0jdMeWSkNp6t4LXx/MjrdmEzlE=;
 b=jUPuRsaXvdmqbz87gZAFBYdiQpJhguKNWpKFEcby5pb2GFEIT3YN5mGr
 hGsDo585USY3bfAn+eC2FII3j5009OnXzMerEQWqKUEdcwwXweOlvfaiN
 9vtj64ZB+dcOSi23ikFSSGyxUnXIX0nJvwktUyNEBQA8Pe2RUWR26Yv8S
 Z6DFRcQNR9PvkH37Qn3muZ7Cwy79b4jkTMm7cR7Hf7v7SQlL53U6HCrbY
 HxMHaAH8VjDdmcOMGsrNFzjR7v3yqdcaMVaZ0Bzhuk4xCjrBF776VOrEs
 vo3i0JSlTNaj7pq/q7fXPnRuYgw2CPg1zRIbspBLk+dLgjDbPI/jpZGwt A==;
X-CSE-ConnectionGUID: zYEFFQ9NTXGCIAHBZ951UA==
X-CSE-MsgGUID: S/4tvj1wSpG1MXR0iY9bow==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58130977"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58130977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:22:33 -0700
X-CSE-ConnectionGUID: nTBGOeDMRKuFiI0NeSyHuQ==
X-CSE-MsgGUID: g/TxQExdTX6iXivGOMWvNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168680947"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:22:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: prashanth.kumar@intel.com, dnyaneshwar.bhadane@intel.com,
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Brian Welty <brian.welty@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 00/12] drm/xe: Add psmi support
Date: Fri, 22 Aug 2025 12:22:16 -0700
Message-ID: <175589048874.1922806.5425406806255824379.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
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


On Thu, 21 Aug 2025 09:17:55 -0700, Lucas De Marchi wrote:
> Add PSMI support to aid debugging. More information about PSMI is in the
> first and second patches.
> 
> Expose the toggle to enable it via configfs, which allows to debug just
> one of the possible cards attached.
> 
> The buffer allocation request is done via debugfs.
> 
> [...]

Thank you for the reviews. Patches applied to drm-xe-next.

[01/12] drm/xe/psmi: Add GuC flag to enable PSMI
        commit: efeb036ffd2a0d1c1afba3d74bd5965825d1a646
[02/12] drm/xe/psmi: Add debugfs interface for PSMI
        commit: aaa0c1f50a3d3fc1624360eaeb7fe69af62f7107
[03/12] drm/xe/rtp: Add match for psmi
        commit: d67b1dfad00d7c28155a434b2a8a0012adc1b458
[04/12] drm/xe/psmi: Add Wa_14020001231
        commit: 29042df3acdc7364af1c251b2a05f7c1c8fe0401
[05/12] drm/xe/psmi: Add Wa_16023683509
        commit: 95b3899b4d25a49abf830ee1bc97940a7c1c7e97
[06/12] drm/xe/configfs: Simplify kernel doc
        commit: 49245b49614870a0a135468be1bd0a6e0006a128
[07/12] drm/xe/configfs: Allow to enable PSMI
        commit: afe902848b417da81f60b3d15cbae40a67286dbf
[08/12] drm/xe/configfs: Use guard() for dev->lock
        commit: 734197a933cd2fb4adac7213fd1fc4df284cae14
[09/12] drm/xe/configfs: Use tree-like output in documentation
        commit: 3eb2280f6aa424bc99d59ff91ca741d6e240caee
[10/12] drm/xe/configfs: Improve documentation steps
        commit: e2b33fce5eb08b37e38188b219a32c105cdc606e
[11/12] drm/xe/configfs: Minor fixes to documentation
        commit: 66b21c338e6f05a980fae76c221d7aea4f1538c2
[12/12] drm/xe/configfs: Dump custom settings when binding
        commit: 13dda74a164b570d93d412e812dc80549506410f

Best regards,
-- 
Lucas De Marchi

