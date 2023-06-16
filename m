Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC658EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 10:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC1510E5CE;
	Fri, 16 Jun 2023 10:24:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3BD10E5CE
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686911050; x=1718447050;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EiP/SkaNmVW3dwq31gfmMZScNm5I5MSyI/+R7xr6nb0=;
 b=i2sx4Oy0if9i48Wbf3i/9koGFfu34c+vLmMc0lL+p5IBR9G8+begPNVD
 oa/8H7fDbzqDyN2YyZZ4EhEd1pKNvr0qzZQnHXeQTH7iZHVwbiswbYpXd
 ZrdCWp/3S8RoO/RxQWGPEGYV1lHjMMyhmU4byyXoHNcy2eLft3mRMy1cp
 xb4SLFmZteR3EYO+i3LPahDDd9hZKrMwIEQ1vkkCvFdaK/K1XzxQgJHeq
 FoMkMDIQXdfpbpSpbli4qpf3ZOcHT89DB2a2+3e9k56vRaHsv7Nnes4gV
 fLDZ/3LWz82X7u2+KoeAnGATNCFcBycEtUzn+9cETcJJYnErSL5cgC1J6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445562129"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="445562129"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742620958"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="742620958"
Received: from jmaksymc-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.12.207])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:24:08 -0700
Date: Fri, 16 Jun 2023 12:24:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20230616102406.klskmif6thctfgxd@zkempczy-mobl2>
References: <20230616053727.134130-1-zbigniew.kempczynski@intel.com>
 <ZIwaG2tlLQIpposb@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIwaG2tlLQIpposb@ashyti-mobl2.lan>
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Use nanoseconds instead of
 jiffies in uapi for user fence
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 10:15:23AM +0200, Andi Shyti wrote:
> Hi Zbyszek,
> 
> On Fri, Jun 16, 2023 at 07:37:27AM +0200, Zbigniew Kempczyński wrote:
> > Using jiffies as a timeout from userspace is weird even it theoretically
> > exists possiblity of acquiring jiffies via getconf. Unfortunately this
> > method is unreliable and returned value may vary from configured in the
> > kernel config.
> > 
> > >From now on timeout is expressed in nanoseconds and its interpretation
>  ^^^
> 
> you have a trailing '>' here, maybe a copy/paste error.

I've checked in the patch and I don't see this character there. Are you
sure you haven't inserted it unintentionally during review?

--
Zbigniew

> 
> Andi
