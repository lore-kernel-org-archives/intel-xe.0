Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CFCC4167D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 14:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FF610E5FF;
	Tue,  7 Nov 2023 14:11:05 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F99610E600
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 14:11:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8FA9ECE0E9F;
 Tue,  7 Nov 2023 14:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CDDC433C7;
 Tue,  7 Nov 2023 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699366260;
 bh=2p0nrUpO0muiskZfeFQI+ja53nbp3CmszJSoIJKWGAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z9WodZKNQxI0vyw5sEhlHkwCCoIOKWNRtezB57cZ/GhUG0j+bq4pUmY/0JKVNL/i3
 dWIFcr5LPFynT/MXVjEdnoMaVhHkT1rj3F8jl+RM68GQqPJoou7EZ/eylZQq3HnALJ
 KdiMzMb4uow2T6fAFa6yiq+ad4KnyPN7aCYJhit8=
Date: Tue, 7 Nov 2023 15:10:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Message-ID: <2023110740-sensuous-sedation-dbd3@gregkh>
References: <20231107134606.316651-1-alexander.usyskin@intel.com>
 <20231107134606.316651-2-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107134606.316651-2-alexander.usyskin@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/5] Revert "mei/hdcp: Also enable for XE"
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

On Tue, Nov 07, 2023 at 03:46:02PM +0200, Alexander Usyskin wrote:
> This reverts commit 62db7d00efe48c614b006086f306d5addedf8f83.

That says what you did, but not why you did it, which means I can't take
this, sorry.

greg k-h
