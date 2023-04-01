Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CB7C76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 18:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0747210E05C;
	Sat,  1 Apr 2023 18:54:25 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C3B10E05C
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 18:54:21 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a11so26368738lji.6
 for <intel-xe@lists.freedesktop.org>; Sat, 01 Apr 2023 11:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20210112.gappssmtp.com; s=20210112; t=1680375260;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0MfYBXrR9z2iuik85L0AjHm8U01x8Q21V03BGwM41qk=;
 b=7l/fXzlxxEzDCPY4OdOCZvJofWTgAYUfJpolx36ZytSpXSqqMCSuaxsKpRIHslLa6W
 8gfxFg8lASIyaYCTqwQNyKDhMZX52evTJyKYuWiQ67f0o6IMEdBacQaVYxuL2fKvbuNE
 MYfeic56xtqoDbh9G0cfBR2o5Kw7LQgI387/qbF4s4xOTDFhdhQku71famQOqCEEJF9U
 9y8Q+UKR5X7AgJxkBXYMFL2XLVCtyPbVZYS9OqE+j6ZzmcGvHNHzGkd2Cfe/XZA1330R
 Tf8w2TuX+7Diy4J4Xmujb8s6WCjvlAH99cocabPhQTfUKBBQ2kTfcJWSOfe37KfGSFF0
 KEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680375260;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0MfYBXrR9z2iuik85L0AjHm8U01x8Q21V03BGwM41qk=;
 b=QZSakmU8UukeyGTE4oFSafLiOSJ2G64iEJziw8yUJuQx83bT3Y7oksa7NGLzKkejuA
 F2mDfcUukK6RtHJ8ePf7SB5mRSjWjvaGhrnrzOQigYKgtla0LJbuC8aLZ45mXnmOnDjW
 ItsM60rNvzhj88E2F+7gBYmcdMtlOJck2sR9dldh2ArEzD7VTZczfcj6yZIPKf7DxQaP
 5rxXNfZhd1tnx0Pch7Z/FtfwXf+h/CadujN1TN7qbCvVXb3aGru1y8dc1xRt33kVsPjF
 ITe2M6QycJBC9jGWbAxqaizLRoJ8TVcv46ULkYIdPhboQFSkDd5rm+iqBwDNMwFpr8Ou
 tRCA==
X-Gm-Message-State: AAQBX9ct6o8q2J4R7D/SwpyDK3y2flvpAsoo4lDOmZAs/GR1ADUaBBeN
 GkreqCVlnP5VsLnhszHlf5xyNA==
X-Google-Smtp-Source: AKy350ajae6zruO/c9495Pu+Cq7sHWm3cEEs9Oll8ThPcK8+/VxKjHUoG8eogjzuziqf9SOyrGXGfA==
X-Received: by 2002:a2e:998c:0:b0:293:4fff:422e with SMTP id
 w12-20020a2e998c000000b002934fff422emr9643062lji.16.1680375259640; 
 Sat, 01 Apr 2023 11:54:19 -0700 (PDT)
Received: from localhost (83.8.67.91.ipv4.supernova.orange.pl. [83.8.67.91])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a2ea178000000b002a61bd34f63sm927646ljl.84.2023.04.01.11.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 11:54:19 -0700 (PDT)
Date: Sat, 1 Apr 2023 20:54:18 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <eboeoenvzefqll4pb6c7ligtoypwttqwolmztrl7dydcjlxh4v@g5iuj2exe72x>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331134334.x5u5ixt7nnr666mc@ldmartin-desk2>
 <20230401085932.g6d3zn5th64hxdya@ldmartin-desk2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401085932.g6d3zn5th64hxdya@ldmartin-desk2.lan>
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 01:59:32AM -0700, Lucas De Marchi wrote:
> On Fri, Mar 31, 2023 at 07:43:34AM -0600, Lucas De Marchi wrote:
> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
> > > > Add some basic unit tests for rtp. This is intended to prove the
> > > > functionality of the rtp itself, like coalescing entries, rejecting
> > > > non-disjoint values, etc.
> > > > 
> > > > Contrary to the other tests in xe, this is a unit test to test the
> > > > sw-side only, so it can be executed on any machine - it doesn't interact
> > > > with the real hardware. For that a mock was provided with the minimum
> > > > initialization needed. Running it produces the following output:
> > > > 
> > > > 	$ ./tools/testing/kunit/kunit.py run --raw_output  \
> > > > 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
> > > > 	...
> > > > 	[13:46:14] Starting KUnit Kernel (1/1)...
> > > > 	KTAP version 1
> > > > 	1..1
> > > > 	    KTAP version 1
> > > > 	    # Subtest: xe_rtp
> > > > 	    1..3
> > > > 	    ok 1 xe_rtp_process_basic
> > > > 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
> > > > 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
> > > > 	    ok 2 xe_rtp_process_dup
> > > > 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
> > > > 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
> > > > 	    ok 3 xe_rtp_process_incompat_types
> > > > 	# xe_rtp: pass:3 fail:0 skip:0 total:3
> > > > 	# Totals: pass:3 fail:0 skip:0 total:3
> > > > 	ok 1 xe_rtp
> > > > 	[13:46:14] Elapsed time: 6.800s total, 0.002s configuring, 6.682s building, 0.073s running
> > > > 
> > > > Note that the ERRORs in the kernel log are expected since it's testing
> > > > non-disjoint or incompatible entries.
> > > > 
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/Kconfig.debug       |   1 +
> > > > drivers/gpu/drm/xe/tests/Makefile      |   7 +-
> > > > drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
> > > > drivers/gpu/drm/xe/tests/xe_rtp_test.c |  64 ++++++++
> > > > drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
> > > > drivers/gpu/drm/xe/xe_rtp.c            |   4 +
> > > > 6 files changed, 290 insertions(+), 2 deletions(-)
> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > > > create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> > > > index 93b284cdd0a2..11bb13c73e7b 100644
> > > > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > > > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > > > @@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
> > > > 	depends on DRM_XE && KUNIT && DEBUG_FS
> > > > 	default KUNIT_ALL_TESTS
> > > > 	select DRM_EXPORT_FOR_TESTS if m
> > > > +	select DRM_KUNIT_TEST_HELPERS
> > > > 	help
> > > > 	  Choose this option to allow the driver to perform selftests under
> > > > 	  the kunit framework
> > > 
> > > But now we're mixing proper isolated tests with HW-interacting ones.
> > > Can we move the HW-interacting ones to a separate Kconfig which is not
> > > included in .kunitconfig and doesn't set its default value using
> > > KUNIT_ALL_TESTS?
> > 
> > I'm not sure moving them to a separate kconfig is good, because that
> > would mean people building without one or the other. The only case it
> > makes sense to build without the hw-interacting ones would be for when
> > we are building for UML.
> > 
> > I want to make sure the kconfig from CI includes both and people can
> > run under !UML both of them.
> > 
> > On the positive side for your approach, we'd be moving the
> > *HW-interacting* ones to a separate config. This means we can create the
> > split between the true unit tests and the ones just using the kunit
> > infrastructure. I will give this a try and see how it looks in the end.
> > 
> > I've been advocating for a split on a name-basis, calling these unit
> > tests as sw_* and the others as hw_*. Then running just the sw ones is
> > simply a matter of passing it as argument to kunit.py
> 
> I will leave this for later as I don't want to stall the tests on
> something that can be converted later and... this is not making the
> situation any worse: actually running this in CI will provide an output
> a little more useful than it actually is giving: a skip on all tests.
> 
> I'm almost convinced we can make it work with separate configs as you
> suggested, but we will need to sync with CI to make sure it fits
> everyody.

Sure, just something to keep in mind for the future.

And it's not really about architecture (UML or not).
.kunitconfig and KUNIT_ALL_TESTS are only relevant for kunit.py users,
and so we want to have config for non-HW-interacting tests in
.kunitconfig with a default value based on KUNIT_ALL_TESTS. Adding any
architecture dependencies here would break kunit.py --arch=X usecase.

For HW-interacting tests, we want a completely separate config, that's
not part of .kunitconfig and does not have anything to do with
KUNIT_ALL_TESTS.

This way - kunit.py users won't even notice the skips (unless they build
custom config), and for HW, I expect CI to be using a custom kernel
config anyway (KUnit one is very unlikely to boot on real hardware), so
.kunitconfig and KUNIT_ALL_TESTS don't really matter for HW-interacting
tests.

-Michał

> 
> > 
> > > > diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> > > > index 47056b6459e3..c5c2f108d017 100644
> > > > --- a/drivers/gpu/drm/xe/tests/Makefile
> > > > +++ b/drivers/gpu/drm/xe/tests/Makefile
> > > > @@ -1,4 +1,7 @@
> > > > # SPDX-License-Identifier: GPL-2.0
> > > > 
> > > > -obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_bo_test.o xe_dma_buf_test.o \
> > > > -	xe_migrate_test.o
> > > > +obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
> > > > +	xe_bo_test.o \
> > > > +	xe_dma_buf_test.o \
> > > > +	xe_migrate_test.o \
> > > > +	xe_rtp_test.o
> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
> > > > new file mode 100644
> > > > index 000000000000..92e2c2b8b44d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
> > > > @@ -0,0 +1,201 @@
> > > > +// SPDX-License-Identifier: GPL-2.0 AND MIT
> > > > +/*
> > > > + * Copyright © 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "tests/xe_rtp_test.h"
> > > > +
> > > > +#include <linux/string.h>
> > > > +#include <linux/xarray.h>
> > > 
> > > This test is not using xarray.
> 
> it actually is. See the uses of xa_for_each
> 
> thanks
> Lucas De Marchi
