Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B7EE9A04C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 10:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFD010E26E;
	Thu, 19 Feb 2026 10:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YOewamJB";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75AB10E26D;
 Thu, 19 Feb 2026 10:16:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0F6A560145;
 Thu, 19 Feb 2026 10:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EB3C4CEF7;
 Thu, 19 Feb 2026 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771496181;
 bh=ahTTzGQe05BykWqkiErkwRk28dx7gIUNx526iahBdFU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=YOewamJB7KP2buRsshqahhop1503bGopXarhfeolNHGDWWf7PpphN/cXIInm19d4j
 mdl1NZ/B70s0K1W3c6pgNxNTk20uKxpVObeMfuSkKeZKUwNic3LuTYVUvx5gn1nVXy
 TzwiqV4Ork/JARXH4MOc+xTwqzTbVVJq0CCOlikq4nHhb9JX9jA98aU389OD/2fN/S
 7dWceDuZfOcnt9Gnh09yvnTLku+vtoOb5tj95o6PsMWxZDyW+Lq1hJl8iWbYMDuuq8
 dDdmsxNCTWq1hLY6fflO415MRi75EvPHn1wYWyaoe4BQa+W6fVMhik7m4/oqzXi4e7
 uNwv75DDYG9Sw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 11:16:18 +0100
Message-Id: <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
Cc: <dri-devel@lists.freedesktop.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, "Matthew Auld" <matthew.auld@intel.com>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Koen Koning" <koen.koning@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
In-Reply-To: <20260216111902.110286-1-koen.koning@linux.intel.com>
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

On Mon Feb 16, 2026 at 12:19 PM CET, Koen Koning wrote:
> Use subsys_initcall instead of module_init for the GPU buddy allocator,
> so its initialization code runs before any gpu drivers.
> Otherwise, a built-in driver that tries to use the buddy allocator will
> run into a kernel NULL pointer dereference because slab_blocks is
> uninitialized.
>
> Specifically, this fixes drm/xe (as built-in) running into a kernel
> panic during boot, because it uses buddy during device probe.

I just noticed that this patch was sent twice, and I posted my feedback on =
[1]
-- pasting it here as well.

> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part tw=
o)")

This Fixes: tag seems wrong. How is this code move related to this problem?

This should rather be:

Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common d=
rm")

Also, please add:

Cc: stable@vger.kernel.org

> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>

[1] https://lore.kernel.org/all/DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org/
