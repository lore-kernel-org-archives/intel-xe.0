Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C02BC54F5B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 06:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D8D10E789;
	Fri, 20 Feb 2026 06:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fipWH8sZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455C110E351;
 Fri, 20 Feb 2026 06:06:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0069043592;
 Fri, 20 Feb 2026 06:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A889C116D0;
 Fri, 20 Feb 2026 06:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1771567597;
 bh=BcVh7QoITwEkqqlbvdhlz2tR9z11qLDn4GSoqYaFwDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fipWH8sZRf3blBBr14Z0J1HDAQvkwKKq+SbkPTI7laBCmWqEm2A+KdFMqtLeQGGw1
 zvGLwjxWJQyhrHM1GXnQc28s0t6e0WDY+3vLeTyEaNYPimI87222dHAPsdnec3CkDi
 C7TqEGbNP5T2mroszFFx1dmc7dKFiMCI48FFNW/Q=
Date: Fri, 20 Feb 2026 07:06:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Koen Koning <koen.koning@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Matthew Auld <matthew.auld@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Message-ID: <2026022016-creole-limpness-6ae7@gregkh>
References: <20260216111902.110286-1-koen.koning@linux.intel.com>
 <20260219213858.370675-1-koen.koning@linux.intel.com>
 <20260219213858.370675-2-koen.koning@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219213858.370675-2-koen.koning@linux.intel.com>
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

On Thu, Feb 19, 2026 at 10:38:56PM +0100, Koen Koning wrote:
> Use subsys_initcall() instead of module_init() (which compiles to
> device_initcall() for built-ins) for buddy, so its initialization code
> always runs before any (built-in) drivers.
> This happened to work correctly so far due to the order of linking in
> the Makefiles, but this should not be relied upon.

Same here, Makefile order can always be relied on.

thanks,

greg k-h
