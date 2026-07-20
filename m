Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22132C4452B
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 10:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95C510E844;
	Mon, 20 Jul 2026 10:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.b="NFOWe+Rt";
	dkim-atps=neutral
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A2D10E844;
 Mon, 20 Jul 2026 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Reply-To:Content-ID:Content-Description;
 bh=VrAlCPX0F1OIbDW3QqV5pnMEMC62myW987PYItxT88U=; b=NFOWe+RtK7qZJXlI70Cdw/CUpg
 WTu4wwTOIboyjm2+F5KSX4mHR+hPTnEsVxMYj91C27VjnUH4KVvOksATaG0jijbROwipaa4WYGG91
 vk6b/TZhfh6F+eDSQwk3MGN5UyqEdRGZ7awp4LBNiHoi4HNhPYZSjNwwm6QH0/URkUAyC00Y2lJVL
 nzc4kBjMiHuQBmZTlhHerLzNbp1zIXI9BQEKyQ2cSCIxWBUbieMrYMsZXCIb9HCdpNFVnMe60EsnR
 1+YVrKkhN4TMId7JcbjQEv152pPWmNc9hkY8JKpZ1m5RI6/ylsFs9fJA/B1kkd74IqBoM9B41uvc/
 1gqhxigw==;
Received: from authenticated-user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <leitao@debian.org>) id 1wlksm-001MTm-1H;
 Mon, 20 Jul 2026 10:05:56 +0000
Date: Mon, 20 Jul 2026 03:05:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
 Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dan Williams <djbw@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-coco@lists.linux.dev, linux-acpi@vger.kernel.org
Subject: Re: [PATCH 5/6] configfs: Allow the registration of const struct
 configfs_attribute
Message-ID: <al3y8c0bTJu4bq9r@gmail.com>
References: <20260716-configfs-const-base-v1-0-c545a4053cb5@weissschuh.net>
 <20260716-configfs-const-base-v1-5-c545a4053cb5@weissschuh.net>
 <alnrJJNb1hwDrAxI@gmail.com>
 <91f5e9dc-1ba0-4e20-9f1f-5100aaaf0a88@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91f5e9dc-1ba0-4e20-9f1f-5100aaaf0a88@t-8ch.de>
X-Debian-User: leitao
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

On Fri, Jul 17, 2026 at 05:35:27PM +0200, Thomas Weißschuh wrote:
> On 2026-07-17 01:43:36-0700, Breno Leitao wrote:
> > On Thu, Jul 16, 2026 at 07:09:30PM +0200, Thomas Weißschuh wrote:
> > > The attribute structure defined in driver code never need to be
> > > modified. Allow them to be marked as const.
> > > 
> > > As there are many drivers which use these attributes, prepare for a
> > > phased transition by using a union of const and non-const attributes.
> > 
> > How many drivers need to be migrated? Isn't this a mechanism move?
> 
> The actual constification of the attribute will happen with a central
> change to the CONFIGFS_ATTR* macros. But all users of the macro
> will need to be prepared to handle the constness.
> 
> I have a branch with the full conversion here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git/log/?h=b4/configfs-const
> 
>  73 files changed, 241 insertions(+), 248 deletions(-)
> 
>  Most driver changes are really trivial. But a few do more interesting
>  things. My goal is to heavily reduce the amount of patches in this
>  branch by merging patches to the same subsystem.
> 
>  The last four patches will be the finalization going again through
>  the configfs tree.

Oh, that makes total sense now.

Thanks,
--breno
