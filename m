Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C3CEB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 14:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB87D10E368;
	Wed,  5 Jul 2023 14:06:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA15510E1DF
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jul 2023 08:55:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA6BC60DD0;
 Mon,  3 Jul 2023 08:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992A7C433C7;
 Mon,  3 Jul 2023 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688374518;
 bh=XHIZAA3VfGV0YW9JdPaZfRVx0wZYNY6nr60WJt9d7Qs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bnq6Q8ZyOBcOw9VvcbYP8Jximz2znUwOBcFrhn2Yfy3AJaQNm0StPBCHiveECJ7hn
 wSsx+nH1CHC8gx9U+Xalgp8XudYnWjzU63KDvqfMvVu3x4Pm8G3qZP04Vvr2RM+4OE
 U+3W03qiY79xTpyw8uIrZP8LW6NEocwYehDUwEa1NF2KWVwTVmEiI56+klvrupma8q
 wryCIwxiV4sW7XZnMYxXfnmrP8QuUTCbZzUu70zI/s5SUFROcXcGYbTNOh/0bmjzPV
 CGkbeVme19OnmnZIM8flhVdf2QTV7r1W247n0CN4dZeF2TMW0hr8obkTSxVnm/yN4T
 4QcBKpP39MZEw==
Date: Mon, 3 Jul 2023 10:55:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20230703085512.kueuuueemcgfxqsd@intel.intel>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
X-Mailman-Approved-At: Wed, 05 Jul 2023 14:06:32 +0000
Subject: Re: [Intel-xe] [PATCH v2 0/6] Add HWMON support for DGFX
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On Sat, Jul 01, 2023 at 08:02:51PM -0700, Guenter Roeck wrote:
> On 7/1/23 18:31, Dixit, Ashutosh wrote:
> > On Tue, 27 Jun 2023 11:30:37 -0700, Badal Nilawar wrote:
> > > 
> > 
> > Hi Badal,
> > 
> > > This series adds the hwmon support on xe driver for DGFX
> > 
> > Needs some discussion but I have a general comment on this series
> > first. The implementation here follow what was done for i915. But how
> > "hwmon attributes are defined" I think we should look at how this was done
> > in other drm drivers, namely amdgpu and radeon. Look here (search for
> > "hwmon_attributes"):
> > 
> > drivers/gpu/drm/amd/pm/amdgpu_pm.c, and
> > drivers/gpu/drm/radeon/radeon_pm.c
> > 
> > Here the hwmon attribute definition is very similar to how general sysfs
> > attributes are defined (they will just appear in hwmon directories) and
> > does not carry baggage of the hwmon infrastructure (what i915 has). So my
> > preference is to shift to this amd/radeon way for xe.
> > 
> 
> You mean your preference is to use a deprecated hardware monitoring
> registration function and to explicitly violate the following statement
> from Documentation/hwmon/hwmon-kernel-api.rst ?
> 
>   All other hardware monitoring device registration functions are deprecated
>   and must not be used in new drivers.
> 
> That is quite interesting. Please elaborate and explain your rationale.

how about using iio instead of hwmon?

Andi
