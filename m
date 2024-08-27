Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA15C52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 10:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABBC10E2CA;
	Tue, 27 Aug 2024 10:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkW8q4PX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4EE10E2CA
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724752997; x=1756288997;
 h=message-id:date:mime-version:subject:to:references:from:
 cc:in-reply-to:content-transfer-encoding;
 bh=QxVIaaMW50PmEqYeM0sWDlII4Y4SlzPPrWbMlHoeqJw=;
 b=nkW8q4PXLSrhobB8WxZD4VCXgGGNqxj5CoUVi4z9OM5HBbD57m0zpsdf
 2INpStwhkBDtFV0CzjBckI38oo2eurm9y9QUua91x9i3TXXNXKGxBh4Qn
 H2AeoYqTtuLXBfCkoADVTPcFblgha1y+o+A8A8qOjmZ96LLyDcPBAaPoI
 xkyCKShPrvYZaU3WNWwD6o/1XkOfeXAhdjBWChtapZcufwbYGp1pvEQ9K
 cJvPHDHcKxQy6cuzDogFP7asAE3ndbMXRGbs5+mMHiYIXxyWMcz6hDcCq
 1Zf/nCrS85oOvKi/7qMUIfJ0FoS7MYGiuRd3vFnytUdeqLUjcOlZMvXmQ Q==;
X-CSE-ConnectionGUID: j8l1nty9QPaqQ010AC8r3Q==
X-CSE-MsgGUID: k06Age3CTcG37WZukCKFDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23185826"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23185826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 03:03:16 -0700
X-CSE-ConnectionGUID: J9tbc04IQ3Gm6+gRRCNrPg==
X-CSE-MsgGUID: /HiFYOrBQWa+i+Q/biMvPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67686600"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.40])
 ([10.245.244.40])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 03:03:15 -0700
Message-ID: <175bd1a4-41e1-445d-ad56-c47d785d7ab1@linux.intel.com>
Date: Tue, 27 Aug 2024 12:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe: Replace xe_device_wmb by wmb
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
References: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Brost, Matthew" <matthew.brost@intel.com>
In-Reply-To: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2024-08-27 kl. 01:41, skrev Ashutosh Dixit:
> CI ONLY for now
> 
> In xe_device_wmb(), it is not clear what the purpose of register write
> following wmb() is. Replace xe_device_wmb() with just wmb() to see if we
> see any failures in CI.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
After doing some digging, I came across it was originally added by brost:
"drm/xe: Add wmb after updating page tables with CPU
    
wmb is a MMIO write on VRAM devices."

I think removing it would break discrete graphics as internal caches need to be flushed.

CC´d Brost to be sure.

Cheers,
Maarten
