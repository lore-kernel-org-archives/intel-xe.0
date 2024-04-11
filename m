Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A70CD128A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 13:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7033910E244;
	Thu, 11 Apr 2024 13:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iwZdG/k3";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3664C10E6F0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 13:08:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22FA462040;
 Thu, 11 Apr 2024 13:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64251C433C7;
 Thu, 11 Apr 2024 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712840910;
 bh=bFpB7CjdyxbHBi3wk8bYZCHC5r/SoLdaY1Md6Y4Pnww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwZdG/k3VvzOyEZQDJISQWZsQx46KwVYYPdFPjiOXBPLs+Bq3nvjJe13/SuUszHlM
 cDibYKrs0b9bApshafKnGNXqb+Xn3n9OT99m0h/9T35OJyr8qCAjQJqSh3ACMGQPk5
 KNoeccftA47doxzyc3xrGO32oAYINY+74DPmRlFI=
Date: Thu, 11 Apr 2024 15:08:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v4 1/2] devcoredump: Add dev_coredump_put()
Message-ID: <2024041121-flirt-chill-5356@gregkh>
References: <20240409200206.108452-1-jose.souza@intel.com>
 <ZhW_5Yctai75qvT2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZhW_5Yctai75qvT2@intel.com>
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

On Tue, Apr 09, 2024 at 06:23:33PM -0400, Rodrigo Vivi wrote:
> On Tue, Apr 09, 2024 at 01:02:05PM -0700, José Roberto de Souza wrote:
> > It is useful for modules that do not want to keep coredump available
> > after its unload.
> > Otherwise, the coredump would only be removed after DEVCD_TIMEOUT
> > seconds.
> > 
> > v2:
> > - dev_coredump_put() documentation updated (Mukesh)
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Mukesh Ojha <quic_mojha@quicinc.com>
> > Cc: Johannes Berg <johannes@sipsolutions.net>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Reviewed-by: Johannes Berg <johannes@sipsolutions.net>
> > Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> 
> Greg, can I have you ack to merge this through the drm-next?

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
