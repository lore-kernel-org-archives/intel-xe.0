Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215F9CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D630C10E351;
	Mon, 25 May 2026 18:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mpw9RbKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18D310E351
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779733355; x=1811269355;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j/49KhxzIYQAlj+JRF3a2HxEJVkAAJvniAFnqIs2Flc=;
 b=Mpw9RbKenI/e4zrETO5xc/86EBnSeG6hEdqEqAxQH2XOD83tXuT0WAoA
 +e6mQFX0igjlnzPlPgc7ZsVJgQvSKHtKYZt3SZOdoD1Xn1mIMBCMJc/h6
 qtxg2F3+V0HZGqRdjF/jWiTYwltTCd2kcaBIhjezn+XeHxdbXn/o7Hkxe
 MbCVLDjE1cyOlO/h3taaw/kR+gE34esgypPwJQ41y902cfvg1GDSmgQtb
 5EFBFevgpyRVA3xaRbfgL2G3jhld8vwVc9dBlecDffBDrl6nLlh09maM4
 v9QUeTfbHnn24lQ72JhuFuo+UDzoS0wXP4j5SbkkbYptZI65YM1xpz/Yu g==;
X-CSE-ConnectionGUID: hyvT+0GbRtSRncyEo31n9g==
X-CSE-MsgGUID: mlq1FU6zTdao1I931VrjYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="83133056"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="83133056"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:22:34 -0700
X-CSE-ConnectionGUID: tADZAf4TSU+Es0qqJHRg5A==
X-CSE-MsgGUID: l7IsZ3qMQG2nWXRaFlVTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="238646074"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:22:33 -0700
Date: Mon, 25 May 2026 20:22:31 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/xe: Separate early xe_device initialization
Message-ID: <ahSTZ-C2KnpPCCLq@black.igk.intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-5-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525160529.15890-5-michal.wajdeczko@intel.com>
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

On Mon, May 25, 2026 at 06:05:27PM +0200, Michal Wajdeczko wrote:
> We would like to initialize more of the xe_device struct also from
> the kunit code, as it should be safe to use most of the generic drm
> or xe components without doing any additional tweaks. Separate early
> xe initialization code to a new function, so it can be reused.

Even without kunit explanation, it's fair enough independent refactor.

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
