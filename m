Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4DFC88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 14:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AB310E250;
	Mon, 12 Jun 2023 14:01:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2F510E04C
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Jun 2023 23:36:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 070F460B9D;
 Sun, 11 Jun 2023 23:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29F4C433D2;
 Sun, 11 Jun 2023 23:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686526571;
 bh=751T4sWTUh6L2ZtM7VJEZHuZIQqGnQyX/kDhhRAkTcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzIcMGFaFQp+niTfFYwo0R5kjKZd8YxsF/5huYTzj1THAtvBTYxCTEDm7kvIZk9KT
 O8r4wSY+LHi/2r3fVNQA5w/ePoJ/Mh1cqMgNBpTzkSwXmL6+VPCB7Ntg4GS5EVhjG7
 bmp59idLVVc7bOiZhzZeM8O/spvCMLCPeYIicB9aEs4gwtDdko4tcQxGFSi9Wf1hwC
 tgk3JrbrxZ0nQPH3HZt1S5HNkwvU/UzTBBWdJvsLOZQqBedKyrhD2/V6CMNWxc2akh
 GVEZtJ9Gd5e7zStTiO4GLuMIiabt36Ygpl91JSSbplvOPDxMpSCtWugOURQYXI4bUh
 ToHVtMnwII5Ng==
Date: Mon, 12 Jun 2023 01:36:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230611233608.lcpdftk4t5bncu22@intel.intel>
References: <20230602104747.72015-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602104747.72015-1-zbigniew.kempczynski@intel.com>
X-Mailman-Approved-At: Mon, 12 Jun 2023 14:01:43 +0000
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use nanoseconds instead of jiffies
 in uapi for user fence
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

Hi Zbigniew,

[...]

> -	/** @timeout: how long to wait before bailing, value in jiffies */
> +	/**
> +	 * @timeout: how long to wait before bailing, value in nanoseconds.
> +	 * For relative contains timeout left. For abstime keeps its intact.
> +	 */

Please improve the description here. With this:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
