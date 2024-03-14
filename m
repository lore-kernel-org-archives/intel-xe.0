Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37709C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EB510FC73;
	Thu, 14 Mar 2024 17:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJaU3spl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6597F10FC6F;
 Thu, 14 Mar 2024 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710439093; x=1741975093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o/PjpgUGmf0jFfdfeVti6FCU1Ca+JUer3Ue41mvliUY=;
 b=oJaU3spl4rTd+e0Or+LJ49zajijA75/Apfy5uIwLBrI/yhOB1rDytoaz
 cOieTGJxin1lJTG/ASGnSNHdlZxE/3NRIlvKrpM5fsm6BNekDZxmk/stO
 PuX27IzGfSrB0bEoVzNr7fr0sSPQRQD5obD19izHYlxqWcHITjKFH/g7U
 5Dy+28aeDfjRUpzDu0QBdpzGU32FezG20OVRG/DSaGkZjYgbSpKYCnfzC
 3LGOIYxT7Kt7y4fT5Cngqr/0BykVsfevR+qsP5LtnSO/QMSCM19RRRbK+
 3LQIA2ZyTPdbKwuzVvrPQL244q4ZsFR7VMpZgzjpQxFEsd5iz1/xhd/G4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16005008"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16005008"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="17040901"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 10:58:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 10:58:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 10:58:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 10:58:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 10:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJcJWwami5b9O+9E13pIllTT+yKqMOxFX8gBniouPiFQ/L8nDfVYtYvSXziPrQL+GHZawSOW5SbsWdVncRLaSQ6p8LhkQ7iSjQhhBe+p1jgG3Ombv8CRZLbaYPgOKaeVsyt7PuYgkWHUpt0bc110OlEHXkbBwML8XV9E037cF6z0314gdQUtfAqRwa3Sejo7CP8kQ1W/GfxmsgAr1jsb35AZ1IMh7EiFCqt4wShUTj1T7mTQgh7mmxARPv9vj26XeQ1wXjZJKERk6TbAApU9YDP9biMJLcGLp4xdJGKo5ULvod4+uviknDi7js0lDY3lAG9DiYYGwJpu0y7fAq9OPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpSbFW9NkDDC+au5Qz3p2+KaGUC4dfp0kfk2sFWnsGY=;
 b=mfvolUWTuVwgxI7QHb8jvsCIANVcaXR120YSbSwu8CC3AnV1KO9SV9jRkVOf0ZZZPTuHdYX8tdNFpZqhS29INLgq+qFQhRUAoOUoMRtNiF/W0SRQ+Zu3+4RzEwQFvrasfVCSwqqug/XPeKrk6j25WSlHYPHR3TImXSMbTRRjtgYqPnCHAB6BRtc03ZFKcgB6DjEAhzt1mmMBJGckOsV4UUC8iz8pI/41nC6X5TYNIv+hxWlIPf32g6buc8hsEAkNP6NmVAatOVtUWh/JYU5YIQtiSIS3ujVfAPr4OGCAf7KPuetUFDdPyPAcLdIIdg3i2I78Q9DFZG44zgEcCWqTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7438.namprd11.prod.outlook.com (2603:10b6:806:32b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Thu, 14 Mar
 2024 17:58:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 17:58:03 +0000
Date: Thu, 14 Mar 2024 13:57:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Introduce a new test for Xe
 device wedged state
Message-ID: <ZfM6ogyMbRxQwMkS@intel.com>
References: <20240313195530.141586-1-rodrigo.vivi@intel.com>
 <rkw7vdk6fssletnevhneqciacoq5rxgbwfb6engvpf4yuqvmqb@x5koe4zreiwo>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rkw7vdk6fssletnevhneqciacoq5rxgbwfb6engvpf4yuqvmqb@x5koe4zreiwo>
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e80618-a54b-4984-e7e8-08dc445048d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlxBrs1wgMPqGfpuNqWcDpTh13ass70hymK0u26jXOnIju2vcSIqABQKfelstoPpxBC+Vvd3S1JtDaxDts8cbRwNujs9xMIweWkEJmuQsP0CUJrLRhMDfEmS/7fNNpeTRPpkxHADPFZ/TnvpXaH+egtzhoH/wUo55S6kbqjiUc6rBqaGqIzQJiwTZqWIUP49EWx1Tf/jSXWSq3gBeLdAJVZVzOW0TBFA6r/096zCO1le/0hUh0KXh6eG4/QNVKkOmYaTCnfah4fVWg5bfey29YXKNdiQqP4jDrn+l0YZ2HTMJoa/NRZXtYzTRhia3D8eAs2NQdqZD87ZP9JTilT+UMPEsoijr+Q7wYpUP5naI67os5i5+2tPi15NsptmUwCIjuOpY/hQ3A4KcMZqxdtfKp4frut+1SJ1NCxNC7d3m1c9VzEiYi/XMEc032US7FmhO5Gb5xn5zSERT/ipZ+ibRyLcqWPYOEIhDfD4tr9+ZsX0uuKc2y7IiD6fCSJFN3NxkPxCr91q7s655lTxBf8QmSoiin5LKLKAbjU3bhdjIyXxJ3uXozjYWrN+fO4Zn6uK1NUy7h7fs0un4EVyel5ECS9ZVgTW/+TtFxmWzhkAy1TnE2OoDr8do8V9mYS3H5Lxtt+O5BCcKq3+P8Uwy6ueGvfj/mbvO8jGuUdLEnxejL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0rDvFX/vVXtjFWVBY0sLJnPSO+Ymy/ZAkBOz1TR6yCLd/oTohV5RLL/4nS?=
 =?iso-8859-1?Q?vu7VdKQXiFwj4wBkhvQtKlUsMDKagK/LZLU3e8wKEabeznT5QUFMfqj7Di?=
 =?iso-8859-1?Q?s69P0bMDkloL+HdvF9dJb+Iz7Z8BFaEvOku3ljCJDlp5PDTHaYBfpB2SRX?=
 =?iso-8859-1?Q?E+4lFk1z1JnKGf+kKIes5pNlksBNaTY8OugQS3wi3Z1//ggF8p1m5BmNbp?=
 =?iso-8859-1?Q?w0/rFjPYVXGmGsGsR44d/qnVIHaRDN6pchLajQSoPXQkkF9+jN9KJKFjx4?=
 =?iso-8859-1?Q?ocVlFFjp+H+r/X0DQMOajFTEqoMCVohDi5tLudeYT1PsEDqbKuaS1306f5?=
 =?iso-8859-1?Q?9ykfpSHZ8ucOy/nUv/gwahbiIUm9K9WrQB7KTiCV7pGvVaqzBFDjGrvOxY?=
 =?iso-8859-1?Q?vXxBqVx7hdRue1E4BK3p8oi+4zM+c+F55DSExZBsXRjbhFHOHAp7TLnZTy?=
 =?iso-8859-1?Q?1siENY7YbgLzLh+UmIKyoJwekoLQkEfN87MZgrNPZG4VNyTx7el4TESav2?=
 =?iso-8859-1?Q?KDJSzwUctQkJ7hx3ItpQWZwwB3laPMkOAQsGeNdGzk6MctbGYBuGe5+zoK?=
 =?iso-8859-1?Q?g6iUOM/xrRVxVkuqsKuCBqJVIN+FLVPoIJpJwRUcGJ4Yp46AZB6pnMgMLz?=
 =?iso-8859-1?Q?9QXZf47M0kqIGsTDfr4N+8ftkBTloe8Mhl08P7K3IWuOIFQggZQXe4JrTk?=
 =?iso-8859-1?Q?3AURFQx91AXa5tDLleHDdwMqJq1zEfxmlHDtD045p3WDHlbyL0GrCrHtyS?=
 =?iso-8859-1?Q?kPzdfBDG/eBkseaUlsNZ4mNhev8l1hMaSkOGLoZdHzgLDVkqKLo3SVnwX0?=
 =?iso-8859-1?Q?mBKwJ+DktBPFlR3vTM2JH3S3rgu1rZo1CHJkvRFzfgC0SPtNyPZR+4o4J0?=
 =?iso-8859-1?Q?H9IkyJlFWwHQeZoYN0zfAorXio5JxbnJ7RIokp5G3fulc5FE+VwlLMknXS?=
 =?iso-8859-1?Q?OwpWd5Ev8Xb/g5ZJGCo8Izcso47ZmX3kKiQTbxzdDVSgAa3p0zmwimzw96?=
 =?iso-8859-1?Q?yV2sWi3Loz7DI+4ZCUVyR4EAQ7i8NSS9Lf1xlxaQADcKqcXF6gaVoVgEgr?=
 =?iso-8859-1?Q?RenBORkg+oiHay3Av8+WeZ6Hyixac7vGbhFYBO42bnJ4zZ0PzDs/iHqKP3?=
 =?iso-8859-1?Q?TDFAuJsJE0xPUx39k27L8mdEB3q5x+4Xs2sUitSDDVX89jIBfLg82yDfkt?=
 =?iso-8859-1?Q?155A/MnLUwF9iOPpElYM67k0Gp45aaafevCtOzR6zgP+xboslEz3Xs6tvR?=
 =?iso-8859-1?Q?0yFngvxyMhP2WaY5xOR5xTbdQAgMNB0XuVefFhnxnSGKN8O+XxmkQZa3Kq?=
 =?iso-8859-1?Q?ew7dRGPylue4rT5iOCGBasHhvdZ2QYePeEgc7DMCmESbJamQDfXuDveVFA?=
 =?iso-8859-1?Q?UvWSBEI42MY9FneHxOGuRhB5KV47P9X1pNmiaRvyHV5Deey01vnA58ENx+?=
 =?iso-8859-1?Q?MnUhHWSZU9eSDFcD/VTWeTBTExQHc5K79onRDkLjAkCV+Ko5Iag4Y73ey7?=
 =?iso-8859-1?Q?A4evbudN/tKd5qmGG46iqfCEqfxg9jQlfHSqqsaf12ZXRscUeFqKa5j4Ab?=
 =?iso-8859-1?Q?KZvYRa9gBPikt1BDJJDdG443aTnDe26Kpb0NNCyMAA9wugYDgOl6Og5yCH?=
 =?iso-8859-1?Q?qD7YS3ggfxawRCmQ0UxuIb85/iQo6wQDwY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e80618-a54b-4984-e7e8-08dc445048d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 17:58:03.1984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBSAMTtij7bd5dr/3Z3uwPczxS4a27bBiAKdzJcNJm5H32f3hb5cy5iMf2WeIcqcnt5r8lumeEser5UXJYdBhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7438
X-OriginatorOrg: intel.com
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

On Wed, Mar 13, 2024 at 03:07:44PM -0500, Lucas De Marchi wrote:
> On Wed, Mar 13, 2024 at 03:55:28PM -0400, Rodrigo Vivi wrote:
> > Let's inject a gt_reset failure that will put Xe device in the
> > new wedged state, then we confirm the IOCTL is blocked and we
> > reload the driver to get back to a clean state for other test
> > execution, since wedged state in Xe is a final state that can only
> > be cleared with a module reload.
> > 
> > This new test case is entirely based on xe_uevent provided by
> > Himal.
> 
> /me confused... I don't see any uevent handling here.

the uevent part is gone, but the failure injection came from there.

> 
> > 
> > Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > tests/intel/xe_wedged.c | 91 +++++++++++++++++++++++++++++++++++++++++
> > tests/meson.build       |  1 +
> > 2 files changed, 92 insertions(+)
> > create mode 100644 tests/intel/xe_wedged.c
> > 
> > diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> > new file mode 100644
> > index 000000000..f767e2511
> > --- /dev/null
> > +++ b/tests/intel/xe_wedged.c
> > @@ -0,0 +1,91 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: cause fake gt reset failure which put Xe device in wedged state
> > + * Category: Software building block
> > + * Sub-category: driver
> > + * Functionality: wedged
> > + * Test category: functionality test
> > + */
> > +
> > +#include "igt.h"
> > +#include "igt_kmod.h"
> > +
> > +#include "xe/xe_ioctl.h"
> > +
> > +static void force_wedged(int fd)
> > +{
> > +	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
> > +	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
> > +
> > +	xe_force_gt_reset(fd, 0);
> 
> humn... do we have to check the writes above did anything?

unfortunately the debugfs_write is a void return...

we could read it back, but I don't believe it brings anything...

>  I also don't
> see the kernel side, but if it just resets normally, the test would
> still pass afaics.

nope, if the reset works normally without injecting the failure and
declaring the gt busted, then we would fail below

igt_assert_eq(simple_ioctl(fd), 0);
force_busted(fd);
igt_assert_neq(simple_ioctl(fd), 0);
fd = rebind_xe(fd);
igt_assert_eq(simple_ioctl(fd), 0);

notice that the middle one is != 0,


but I'm considering to change that to

igt_assert_eq(simple_ioctl(fd), -ECANCELED);

for clarity.

> 
> > +	sleep(1);
> > +}
> > +
> > +static int reload_xe(int fd)
> > +{
> > +	int error;
> > +
> > +	drm_close_driver(fd);
> > +	igt_xe_driver_unload();
> 
> 
> what if we are running on e.g. MTL with a DG2 and want to debug one of
> them? Rather than re-loading the module and possibly causing unrelated
> issues (if e.g. module removal from the other card crashes), why not
> just unbind the module from the card under test?
> 
> i.e. the equivalent in C of:
> 
> rebind() {
> 	pci_slot=$1
> 	echo -n "0000:$pci_slot" > /sys/bus/pci/drivers/$driver/unbind
> 	echo -n "0000:$pci_slot" > /sys/bus/pci/drivers/$driver/bind
> }

Thanks, that indeed is a better choice.

the only caveat is that I need to close the main fd client for a proper
exit before we can rebind cleanly. But I could finally get that working.

> 
> Lucas De Marchi
> 
> > +
> > +	error = igt_xe_driver_load(NULL);
> > +
> > +	igt_assert_eq(error, 0);
> > +
> > +	/* driver is ready, check if it's bound */
> > +	fd = __drm_open_driver(DRIVER_XE);
> > +	igt_fail_on_f(fd < 0, "Cannot open the xe DRM driver while reloading xe after wedged\n");
> > +	return fd;
> > +}
> > +
> > +static int simple_ioctl(int fd)
> > +{
> > +	int ret;
> > +
> > +	struct drm_xe_vm_create create = {
> > +		.extensions = 0,
> > +		.flags = 0,
> > +	};
> > +
> > +	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> > +
> > +	if (ret == 0)
> > +		xe_vm_destroy(fd, create.vm_id);
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * SUBTEST: basic-wedged
> > + * Description: Force Xe device wedged after injecting a failure in GT reset
> > + */
> > +igt_main
> > +{
> > +	int fd;
> > +
> > +	igt_fixture {
> > +		fd = drm_open_driver(DRIVER_XE);
> > +		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
> > +					       O_RDWR));
> > +	}
> > +
> > +	igt_subtest("basic-wedged") {
> > +		igt_assert_eq(simple_ioctl(fd), 0);
> > +		force_wedged(fd);
> > +		igt_assert_neq(simple_ioctl(fd), 0);
> > +		fd = reload_xe(fd);
> > +		igt_assert_eq(simple_ioctl(fd), 0);
> > +	}
> > +
> > +	igt_fixture {
> > +		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
> > +			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> > +			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
> > +		}
> > +		drm_close_driver(fd);
> > +	}
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index a856510fc..e590d4348 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -312,6 +312,7 @@ intel_xe_progs = [
> > 	'xe_render_copy',
> > 	'xe_vm',
> > 	'xe_waitfence',
> > +	'xe_wedged',
> > 	'xe_spin_batch',
> > 	'xe_sysfs_defaults',
> > 	'xe_sysfs_scheduler',
> > -- 
> > 2.44.0
> > 
