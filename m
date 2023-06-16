Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727C0EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 08:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332A610E09A;
	Fri, 16 Jun 2023 08:15:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D710310E09A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686903328; x=1718439328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N3tvPg+BUcH8Pul3w9Pk2Ce7EGh/Ek6Emx1rvX6lT40=;
 b=QbpxBABh1cdaSPSapU2W/U568BZSdVnPE8C1pJSYtXvZFNHFmHh0TBF2
 VcszeVE5QUdrkgi4/BXZULTZNd3BF5BqSv/lNazrCz+So8OMsD8J3ZmIU
 JnEDer68PJIXB3/G+aUkkBbrL/7wRzeuexcYitRmXbk0PCxdcobTmdzrL
 sD27c3buLr+giBDCXMWedIDoP5jy3QBIw7jRuuJCn0E6tnNbPzVnRp3L4
 aeZ0Qzwiu2E1gYfdtnF9YUDcfPanerXE4izysx96DKMcqbNHdDT1MFob2
 FBv7yNOQ0eC0B7P6pTJhJU3KaujTO+vHWJ8XlJznUBa/1NWJ5nefvWyPE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445537836"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="445537836"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 01:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715919240"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="715919240"
Received: from vyashin-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.124])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 01:15:26 -0700
Date: Fri, 16 Jun 2023 10:15:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZIwaG2tlLQIpposb@ashyti-mobl2.lan>
References: <20230616053727.134130-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616053727.134130-1-zbigniew.kempczynski@intel.com>
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

Hi Zbyszek,

On Fri, Jun 16, 2023 at 07:37:27AM +0200, Zbigniew Kempczyński wrote:
> Using jiffies as a timeout from userspace is weird even it theoretically
> exists possiblity of acquiring jiffies via getconf. Unfortunately this
> method is unreliable and returned value may vary from configured in the
> kernel config.
> 
> >From now on timeout is expressed in nanoseconds and its interpretation
 ^^^

you have a trailing '>' here, maybe a copy/paste error.

Andi
