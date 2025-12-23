Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EA0E6F061
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 08:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B246E10E0C9;
	Tue, 23 Dec 2025 08:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HT93MLQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E8D10E0C9
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 08:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766477235; x=1798013235;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=6+Q/Io0Bp2xChwoQ3WA8J7Y70SdBW99kKhL7/437NOA=;
 b=HT93MLQMKKODXnHrfH+ptmiUkErnBVE+vOttkF61fYarWEONV61h1YpZ
 dEVwGVAaJSMzjJHU3gMtVBbX1cB6ktylCRpfVQNtOqH2Xq+2c8zR7vt+J
 WIUhdcEZOwvkNLDAGMRhlfcBVsm2Mr0Sy1xf7iAkQENg2uC4/vaJ+o+AE
 F/P8TFxf1b8A1AR2WOH3QQUIde8kBth5kiTOqt8uN4hLFKCWVj8TV+bm7
 9gCvnIGzZk3q/uFxVfmnsVPsn39B/kVWYyJimAOxW+D3AVRb1f27gnps/
 DNLi8NAhSlwDcX6Esmiv0E7/YCRfqfOd+eY9FQ79xS94No5Fb2Cjczqv+ A==;
X-CSE-ConnectionGUID: c0WJoGBqQiOaNdit54wD/Q==
X-CSE-MsgGUID: fogyxfIiRqWCZ8HXwUM0Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68370725"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="68370725"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 00:07:15 -0800
X-CSE-ConnectionGUID: 4OitO6MtSYuWDj2wwuT3bw==
X-CSE-MsgGUID: 99aN7XMKTq6IEpk0Fcd5XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="198971420"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 00:07:14 -0800
Date: Tue, 23 Dec 2025 09:07:11 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series?=
 =?UTF-8?Q?_starting_with_=5BRESEND=2C1=2F1=5D_drm=2Fbuddy=3A_re?=
 =?UTF-8?Q?lease_free=5Ftrees_array_on_buddy_mm_teardown?=
In-Reply-To: <176641887620.111846.10405228999571579709@a3b018990fe9>
Message-ID: <ec31c765-ebf7-53b1-e245-54e207e3465a@intel.com>
References: <20251219193237.1454565-1-michal.grzelak@intel.com>
 <176641887620.111846.10405228999571579709@a3b018990fe9>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-826269695-1766477234=:1979798"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-826269695-1766477234=:1979798
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 22 Dec 2025, Patchwork wrote:
> Patch Details
> Series:
> series starting with [RESEND,1/1] drm/buddy: release free_trees array on buddy mm teardown
> URL:
> https://patchwork.freedesktop.org/series/159312/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159312v1/index.html
>                           CI Bug Log - changes from xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7_BAT -> xe-pw-159312v1_BAT
> 
> SUMMARY
> 
> WARNING
> 
> Minor unknown changes coming with xe-pw-159312v1_BAT need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-159312v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> PARTICIPATING HOSTS (11 -> 12)
> 
> Additional (1): bat-bmg-3
> 
> POSSIBLE NEW ISSUES
> 
> Here are the unknown changes that may have been introduced in xe-pw-159312v1_BAT:
>
>   IGT changes
>
>     Warnings
>
>  *  igt@xe_module_load@load:
>      +  bat-bmg-1: ABORT (Intel XE#6818) -> ABORT

This issue was and still is seen on every build on xe_module_load@load
on bat-bmg-1, thus unrelated.

BR,
Michał

> 
> KNOWN ISSUES
> 
> Here are the changes found in xe-pw-159312v1_BAT that come from known issues:
>
>   IGT changes
>
>     Issues hit
>
>  *  igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
>      +  bat-bmg-3: NOTRUN -> SKIP (Intel XE#6566) +3 other tests skip
> 
> BUILD CHANGES
>
>  *  Linux: xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7 -> xe-pw-159312v1
> 
> IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7: 5f136224303e8b3130c6e2297fe52b44a77702c7
> xe-pw-159312v1: 159312v1
> 
> 
>
--8323329-826269695-1766477234=:1979798--
