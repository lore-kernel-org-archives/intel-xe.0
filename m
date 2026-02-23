Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89979EA4FAE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 11:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473B510E365;
	Mon, 23 Feb 2026 11:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X29kwMHh";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71410E158;
 Mon, 23 Feb 2026 11:20:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D21E9432BA;
 Mon, 23 Feb 2026 11:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1EFC116C6;
 Mon, 23 Feb 2026 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771845626;
 bh=2C/VCJimiVdTaBfL0HoBVbkMhA9/OE2zRznQChuRiIo=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=X29kwMHhegwowdYJcdWmMhKxeNisTXffgUKi72QPcZk2HvXxu/o1X9kbdBrlVsT3Z
 joFiZ2u2K7UcnQ5FbhihaZ9Fmn5YBTGP2Yc0OeIvrCtqqOGtRLr0KRcwONfi/XyuWM
 9aE3UeOCjl4qQZvcZTSpvorvI36rTUh2LUloqemDi1HizRxPezNhwHbqMoZ49SWuUl
 YQ68XsYYptko7pDjlJjci3XlTgz+5wvYd/wUqrcdyVCKhzF+hw9LOzEYUWUPomQxYf
 w8z0lDGifpcHfmrz+wjzUi0erDUMHOr5jnSw/FHj5Hi2rfAnF8s8VI3GU5EzGPYzu+
 fhHiQp7iqVR1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 12:20:23 +0100
Message-Id: <DGMAUQLZGPZB.FWELZM9GYP0Z@kernel.org>
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Greg KH"
 <gregkh@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, "Matthew Auld" <matthew.auld@intel.com>,
 "Dave Airlie" <airlied@redhat.com>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, <stable@vger.kernel.org>
To: "Koen Koning" <koen.koning@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com> <2026022156-citizen-shredding-5d6d@gregkh>
 <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
 <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
In-Reply-To: <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
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

On Mon Feb 23, 2026 at 12:17 PM CET, Koen Koning wrote:
> Thanks that makes sense, then let's just stick to addressing the current=
=20
> regression with gpu/buddy in the drm-tip tree.

The patch should go into drm-misc-next.

> Joel, could you grab the v1 of this patchset (or the v2 with with=20
> subsys_initcall, either works) and try to get it applied to drm-tip?=20
> Since this is my first time submitting patches, I'm not really sure how=
=20
> to proceed from here, and it will probably be faster if you have a look.

I think we should land your original v1; I don't know if Joel can push to
drm-misc-next, if not please let me know, I can pick it up then.
