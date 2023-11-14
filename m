Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E907C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 12:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0215310E214;
	Tue, 14 Nov 2023 12:12:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5582710E214
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 12:12:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7281361228;
 Tue, 14 Nov 2023 12:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E1DC433CA;
 Tue, 14 Nov 2023 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699963973;
 bh=8kXJWWj+IxMhyzIH21g9tcu4B65dLiehTI2WpsbUmUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xMrrslAQl5utdVE7FIYal8YJYkaw75FUkKBTtqY7SeeB8JNS6CdN3gYzJ+FERe4K/
 7iFlWgcgjB7mW/DIhDtDj+DbI4UZLbbkelY5hey3tMfkwS4In2goqLE3A/WdLrll3D
 /HN5W8lDwWwWHDW6Szf/08aeeojoin0SQsevW41U=
Date: Tue, 14 Nov 2023 07:12:50 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Message-ID: <2023111451-campsite-eaten-b8e3@gregkh>
References: <20231114100843.1923977-1-alexander.usyskin@intel.com>
 <20231114100843.1923977-2-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114100843.1923977-2-alexander.usyskin@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 1/5] Revert "mei/hdcp: Also enable for XE"
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

On Tue, Nov 14, 2023 at 12:08:39PM +0200, Alexander Usyskin wrote:
> This reverts commit 62db7d00efe48c614b006086f306d5addedf8f83.
> 
> It will be replaced by match without driver name.

Again, you are saying _what_ you are doing, but not _why_ you are doing
this.  I have no clue why this current matching is not acceptable.

And did you just break the existing code if only this patch is applied?

> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

As I asked this same question last review cycle, I'm now going to be
very picky and say "You are not following the documented Intel procedure
for Linux kernel patches that Greg has to review."  Please work with
your internal Intel kernel developers to fix this, otherwise we can not
take them at all, sorry.

thanks,

greg k-h
