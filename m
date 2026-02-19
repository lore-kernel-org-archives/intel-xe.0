Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E37E9A04A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 16:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8964710E708;
	Thu, 19 Feb 2026 16:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ce/eLZSL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917DF10E6FA;
 Thu, 19 Feb 2026 16:08:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A680C61863;
 Thu, 19 Feb 2026 16:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC83C4CEF7;
 Thu, 19 Feb 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771517293;
 bh=+ZzOdxSS5ywcUSM/cEhofj+s7mNQ5F/MXbRThmvVe5Y=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Ce/eLZSLn/AzWO7HhsQgQOslqJI5BbIK+8sfYW6HR3HqEwAw4d9LYmUwD5c/c7f38
 6OZf0Pxlz8/a+qhoFGGadA2g4lyZgdQeurRpJGm735D7117Vhqp5NUmONdQr0rfvQb
 PhtuBHb7svN94aQAJEJa93cLPoGBF6jMVe3GHtlk6+VUFEJI3w1cUt4D017U6aVLo3
 hEYUVCqPwAdhXQjPvXkhfYPGgDGjO8BoHhvyU70tPqCNqvLTj8LiDTCWasPtu4SVYW
 DC4igbIhcEZkqzks0eKNgkLcvAb+g19bXgqSrCqpXswpVc/MJGe9X3h+XLixL+WISz
 +n5kzp2zh4Oeg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 17:08:09 +0100
Message-Id: <DGJ2GW1O3XJ7.2HOJLV0UX78Z8@kernel.org>
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
Cc: "Koen Koning" <koen.koning@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
 <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
 <318f1dcc-bc95-473e-bdb3-7ea03708395c@intel.com>
 <DGIW8FA844O0.3AWFSWJRVZSXR@kernel.org>
 <1243e2a5-02bd-4b44-9008-6d18a706e44f@intel.com>
 <DGIYEDHZTNJL.VJVC0MLJWRN9@kernel.org>
 <06687482-f94c-44fd-9e8d-e7eadaa0833a@intel.com>
In-Reply-To: <06687482-f94c-44fd-9e8d-e7eadaa0833a@intel.com>
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

On Thu Feb 19, 2026 at 4:32 PM CET, Matthew Auld wrote:
> Koen will send something.

Sounds good -- thanks!
