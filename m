Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9185C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 14:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A553210E5FD;
	Tue,  7 Nov 2023 14:11:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E0810E5FD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 14:11:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5941BCE0EAC;
 Tue,  7 Nov 2023 14:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34139C433C8;
 Tue,  7 Nov 2023 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699366276;
 bh=ipLY44jql33d6wfFrPt7YcOzhZm0V3DcoEWXrrXmYKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2uHQ6kMCDh6WjgFy6QERZY/5WiQMGzQzqziHGTwHeetWXhDcG4o1TtdieEgqLg6k2
 RmZSrM+THi+9xFO+4MvergHtx5I8zoDyqlCwJh+nTdT084eGu+NiWdiuPFTFJ3SIlf
 DSORhZvGvgY2NJ6CDCTjfPvk8+fFx2Z7+JENhvN0=
Date: Tue, 7 Nov 2023 15:11:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Message-ID: <2023110700-emptier-retrain-08fd@gregkh>
References: <20231107134606.316651-1-alexander.usyskin@intel.com>
 <20231107134606.316651-6-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107134606.316651-6-alexander.usyskin@intel.com>
Subject: Re: [Intel-xe] [PATCH 5/5] mei: pxp: add dependency on Xe driver
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomas.winkler@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 03:46:06PM +0200, Alexander Usyskin wrote:
> Optionally depend on either i915 or Xe drivers.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/misc/mei/pxp/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
> index 4029b96afc04..d9ae5483567f 100644
> --- a/drivers/misc/mei/pxp/Kconfig
> +++ b/drivers/misc/mei/pxp/Kconfig
> @@ -1,11 +1,10 @@
> -

Why this change here?

thanks,

greg k-h
