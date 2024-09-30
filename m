Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33237CE8347
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 14:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F416210E0D9;
	Mon, 30 Sep 2024 14:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mD6CfBhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8E210E0D3;
 Mon, 30 Sep 2024 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727705409; x=1759241409;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gxYeSRDBkf05nz2/putIeYkJ1WdIwCNg8wektl65DEc=;
 b=mD6CfBhMEZD+x+zCTfIAFj/c6I4xwUST3LAA5MqjZp3EUSmdb7U1YGLj
 lBokGdHKu5uuatt92bi2MnBSTwSO+InshQmvjLivGNU0jrmH5za+/DOxL
 2fcZXZqytINY4wMZ+hsVq3Xyau/PRHEHCjBzNcVLd4l76/GNkzoWDydsO
 dREEdKr3rZJGhwNls5OccB1mLfLBgb8lu1nAsecNs8AYRSqpspt9RQqu1
 TBMVyV4MUkA4MkGyqZDLLuIRbHlJ9nwlfaNuMDDXeUtQ0iFV5uEmAfTq9
 5vOJ6rWF882xvaUtZGOFjFbhH7Ror6G4oLlgcodu0d2JMXBYc+IQTV5Cs g==;
X-CSE-ConnectionGUID: lEjfY3p/RhuutDdnQDLyPA==
X-CSE-MsgGUID: GS+vHpXpTKWUs2cZX4LylQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37940004"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37940004"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 07:10:09 -0700
X-CSE-ConnectionGUID: Et42Lu/dQGGG3qUlNxp3jw==
X-CSE-MsgGUID: wXov1RQ8RCO5AxZWUtsK8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="78278849"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.136])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 07:10:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Gomez <da.gomez@samsung.com>, I915-ci-infra@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, patchwork@emeril.freedesktop.org,
 tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
In-Reply-To: <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
Date: Mon, 30 Sep 2024 17:09:54 +0300
Message-ID: <87msjpw7v1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 30 Sep 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> Hi,
>
> I sent this patch [1] using B4 web endpoint and then I received a
> response email to the wrong address: To: "Daniel Gomez via B4 Relay"
> <devnull+da.gomez.samsung.com@kernel.org> instead of To: "Daniel Gomez"
> <da.gomez@samsung.com>.
>
> [1] https://lore.kernel.org/all/20240925-macos-build-support-v3-1-233dda880e60@samsung.com/

I guess you're saying the replies should be using the Reply-To: header.

Oddly enough, even my MUA doesn't respect the Reply-To: header when the
same address is already in To:/Cc:, as a way to handle mailing list
Reply-To "munging" [1].

BR,
Jani.


[1] http://marc.merlins.org/netrants/reply-to-harmful.html



>
> Is this something that can be fixed on the CI, patchwork side?
>
> Thanks,
> Daniel

-- 
Jani Nikula, Intel
