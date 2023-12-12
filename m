Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9150AC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 05:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475ED10E557;
	Tue, 12 Dec 2023 05:09:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34C310E557
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 05:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702357768; x=1733893768;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3qdHBJCpNLaivmEWG5uprI6rCxluiMl2L8tBmfJgJds=;
 b=mW4gjyEAyrKv6oEE+lOSkkyE7KtWSmxAuKhdEG8eRN1iLiZDEDIwQjOX
 bqZEQDUNE0crgAXmvdqV1XV3LRya3qbIYCYyfqWa5taptPsHZOJRPsPed
 5jX+olbgArq86gFoQkWlqBHldkbqwVpcGx0ff5H5/MCxGug3B2M0SQVQu
 kU956SWeTxp/Iur9IDCXLWPPiTEIoClGOBQpmyNDnQ5YdJw85fNnpDyA0
 6T6hy6dx56516QblzeoHNuzZol7eugO6iZ4qYpypRD9Vcho55jUVlKEob
 5896jQa8hsbJm/8qX5Uj3B9FtBJmtILOo4oeUxLa/KPIha1buRsU0Kghv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8115662"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8115662"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 21:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104761056"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="1104761056"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 21:09:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 21:09:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 21:09:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 21:09:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 21:09:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjygU4zwgDNaQfmPC0AiaUILKTCVyXIE8xDozzxKDLrd8/6ycKoUHaHOOPpbZAszeKpd6iUWlgf8lm7n81o72ttS6ITGir51OqOLUdoOkCWBibRJ+xLf+GfAtUmwnsbB5TrdHsfMoTwWyalrQvwKyuGHGjZQWQKXyHbnlLDe4n1V2pRwmPJrHGeS93DUSeIE+v7zTq+6gAr1zeRQCVup2LoJ4lIitraaPkg9+6hNoKch8meam9M9laGVzUbqumREt0eaFf1ipU1Ox1BmgQWL3XR3X9bJxp4AxN41cmxDIaxEjBkY+dsaEKbGnJ99D1+HMFVrPEBAwtYRu4HHoefULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBWhyzyWOzV0y0Nf5G75QN9dJwHJd8wN018GeaIiutI=;
 b=R8KrhpCyByv/9YY9c0AfkakNJIIhHtvDN2YpCecN70D6EGcryPjUw9rPDbYvD4CkvHK0ZBbDTCYpGqbhpUmMqeA8ye5b7b6WAnPniMn18WnfJmI0YIPWX6q4Hg4gKHldNkcoJFtqFW1OVs+xEyQ+5I8IvvP8MJ0wfPllOmQ/T7yc0n/T/AmhawTqkItiU8VJZv6w5mkPRxBNKhdXFs8uJvCsvTntYFCJNJDbuQfl7VJR5Fj7o8R+oR1bzFGHe+oFQxyeI0vMUaeG9TMw4qlpp04TBifvRovN1ODeIGkxPVX7RKTcOfbUdqO0N3PThTU58X6qIbIbG7uoE3L1oYxGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 05:09:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 05:09:17 +0000
Date: Mon, 11 Dec 2023 23:09:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 5/9] drm/xe/kunit: Define helper functions to allocate
 mock device
Message-ID: <3b26tu2pci5pqzb3ykmbnxt4uhixpieo7px2onfbdalmq42bg5@ff36snad3tkj>
References: <20231211200424.1703-1-michal.wajdeczko@intel.com>
 <20231211200424.1703-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211200424.1703-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:a03:60::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bade5db-b7d9-4a18-71ee-08dbfad07db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eeSxHBCI8zuDkmNhDbjPfznwIXY6Ga8doHHHbLHo8K2qLoL8gA7l2DD0HLxmHx/pFR1vicfVrJeTPjbJvt3NQzn6T1tm2C4MWt69O7gVMhsjUtPtv50EcY7p0fkWVi5g6gL0/Fn5JuyGYNyVV5E5Mf681voTKICxKymQGM2LcE6Pw9vpKvWg0Er0PTUBnn2+TuhCHFJ2qFYVXnAARBA8qQacZr3TXhTsY6gqdig1ezNFlx0A4+DJoOpJskBiZtpsO9T1f1dz89N4Y/RwXDs0DCZ+AFB33yyHgmYD9ENMBad975duLonG0sqORggzm8o170yDPMB9+MRMXhHNK5+izMl30f8gmbL8krWvCo/QM+tleUpiyVsP8vPo3/0aGMLIzyHIYUrir9hKV2NSeoEOB6myQCUXTtWLDfLZ6lxcceVn/FnQNVK2sUb63GGbELNcgTDXUvziJKKgONW1ykUkaUqoOtLlf0/pPxbvRnk8nvEuebKVpuGIv8SuqiEztMcazblhEo9X5eKCYUviIJ+TWsPJKOMGhh0et/vl926WPNcDmYwUton8PYhkvrzSt9kR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6512007)(6506007)(2906002)(6636002)(66556008)(66946007)(66476007)(9686003)(86362001)(38100700002)(8936002)(8676002)(4326008)(6862004)(5660300002)(316002)(478600001)(6486002)(41300700001)(33716001)(82960400001)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CZGV4fqeiVaitSNTL5t+ap8zFnjAR+HgnigTcqQLGb70Fx+0jSGvRkQqjb?=
 =?iso-8859-1?Q?+EfzlUQdqQqSNfsPRQUjtdOUaqubh22+SgzJAUrfPZlZ1yzt81Tyx7MMNl?=
 =?iso-8859-1?Q?O6KPAagQn3nRvIo20XGinLBlI9UliXtAjutYQ5sxWMXzhUMxpl0RfUKtH4?=
 =?iso-8859-1?Q?oDZyZCR9fRRhGhkj+djZGMCAW+qYqYZkG3K5Isfw6Z8OepQQMVPKHFgmVy?=
 =?iso-8859-1?Q?Man1N/8dub2OcNR+xuTJ2vHNqPNjNHm6eHrvVZ4taIrxeQ9iG7RXI275LU?=
 =?iso-8859-1?Q?mn7axW3hIBP8FiYQ2oRR4fxNiomAZBz/2Me9kxIrRr+Hhbk6lF6/AhdpY3?=
 =?iso-8859-1?Q?zu79zy34mNRxUpT/p/s+7ssEt8CR8uB3RDkdaYw1rglcgsw19fLgVgRsn7?=
 =?iso-8859-1?Q?entnIIJ5gFabMI6wGP8VmAxRlt9DsDif9qnlStsR0rrmvduMIzV/eE3fwW?=
 =?iso-8859-1?Q?SFbqsxcIjNTeZeczqwGLp62ZapRPsiRCXg3N9rXo8n17/H9QuLeHs1GB0z?=
 =?iso-8859-1?Q?ku7cWwUpWMf8ZbVc1bLLXOklFCyQHyiNOTPFAhBqKqSyx22u/qzs7wjeL+?=
 =?iso-8859-1?Q?6/w/mK2Zq4caumGgMGD5w7rt0TjVenjxejr0f97tt0rZjCaUTyZIvL541k?=
 =?iso-8859-1?Q?VIyNfCbwGQLoCQZfEdLAu6Q7bvpZKrJz1jbjrrSEjY4st90UPpdC3LfCHH?=
 =?iso-8859-1?Q?p4OxKA1ZZYsrXGUK48wbCKXCLqh+jSD59V8LGPaxhBFfGJiKCqm8ce9Ofr?=
 =?iso-8859-1?Q?RteCF+XmlMykiazsWjAupO32JvKcDPipYk8ptkpBa6XBxmp7lVRwegNDo2?=
 =?iso-8859-1?Q?3f8dcKZagWTS2D2fmHYEPN1dGiMIAhYFKKtDUMEZ/xF0eECtNMGZm3U602?=
 =?iso-8859-1?Q?+IlZwpM/EKnmYuSkzmrjBoZB/ECQtxSwRlRbdYXzXeSoF3UEbYazARazNT?=
 =?iso-8859-1?Q?NtlX7wcMbYxA+n1I7dHhjNvulSGxHj0yVPY7flGZaPpgGGkrJjWFXBvG7o?=
 =?iso-8859-1?Q?8yhsqZQiJWIhiFucO3QrbKodJrRU+GF6RRhj22PBaR9tb9PkSfyo2B+TXT?=
 =?iso-8859-1?Q?AUxzGd7Ua/D1NetpiM+oj4mFq1P/A84ixHIr9ndEh6O4uaaeyAD7UbDDLm?=
 =?iso-8859-1?Q?P2ipYZ9zeLSB/7IRFtwLfoGckZ961Rmf/h7uxFliEym6So4q7TjYijCKV3?=
 =?iso-8859-1?Q?KFtX2pz4eM5AU3SlmdhNZFyAQJ9EQr+ih75O4VlbRx+cmFlwbqXxL1+Hn7?=
 =?iso-8859-1?Q?VjTu4bYMmPZGyQyFg4uBcFFOgI3TufBSc4wrg/RxKBYSdjErZFZNoPEcyr?=
 =?iso-8859-1?Q?FvLovVxcnCmNazkT9vD209C3aNdWSLE3WNelNZ/wIkR1fj8JwcGhHkpjPA?=
 =?iso-8859-1?Q?7eyQ/VfzF5ZPps1crl13+3+t4NBmMfqfu2bAZ7UiEx3QG6+nteqp7BhZi+?=
 =?iso-8859-1?Q?ehxMISUXzVn3EPiD6QPBVSTg2hi9hkokErrg/fQUaQjS/g2fE7FTxmvN6i?=
 =?iso-8859-1?Q?hUubjRjGxqKs9+aoWR3eI3p/L88iRRdUUrnPYufvQxdq8A9+VwDQgqpxQ/?=
 =?iso-8859-1?Q?fLS53AREFIl591P8xDPxf5BZYboAb1ns1cmtO1AyqW54ofEVc8AJTa5xNM?=
 =?iso-8859-1?Q?NQxGx9v4wR1BranrUo4RLH/1nPbLNIRHd9eS58sZ5TvYneSWSHYxilxA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bade5db-b7d9-4a18-71ee-08dbfad07db9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 05:09:17.4617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95m1HzwY0Aigpb7AoIbZz6ILqv/m8Ov9U98LzDQe9nFXCOGPNO/mRFuiSqmFbjPKoMpEwg90QpB68igKX2vtY9NlEt8iiNA/ZqHluKjoQMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 09:04:20PM +0100, Michal Wajdeczko wrote:
>There will be more KUnit tests added that will require mock device.
>Define generic helper functions to avoid code duplications.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                 |  3 +
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 85 +++++++++++++++++++++
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.h | 19 +++++
> 3 files changed, 107 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 0c2e247dc188..14857923d217 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -145,6 +145,9 @@ xe-$(CONFIG_PCI_IOV) += \
> 	xe_lmtt_2l.o \
> 	xe_lmtt_ml.o
>
>+xe-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>+	tests/xe_kunit_helpers.o
>+
> # i915 Display compat #defines and #includes
> subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> 	-I$(srctree)/$(src)/display/ext \
>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>new file mode 100644
>index 000000000000..236f24d3ca17
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>@@ -0,0 +1,85 @@
>+// SPDX-License-Identifier: GPL-2.0 AND MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <kunit/test.h>
>+#include <kunit/static_stub.h>
>+#include <kunit/visibility.h>
>+
>+#include <drm/drm_drv.h>
>+#include <drm/drm_kunit_helpers.h>
>+
>+#include "tests/xe_kunit_helpers.h"
>+#include "tests/xe_pci_test.h"
>+#include "xe_device_types.h"
>+
>+/**
>+ * __xe_kunit_helper_alloc_xe_device - Allocate a mock &xe_device for a KUnit test

s/mock/fake/

>+ * @test: the &kunit where this &xe_device will be used
>+ * @data: the &xe_pci_fake_data with desired variant of the mock device (optional)
>+ *
>+ * This function creates a &xe_device based on parameters from @data.
>+ * This allocation is managed. See drm_kunit_helper_alloc_device() and
>+ * drm_kunit_helper_alloc_drm_device() for details.
>+ *
>+ * Return: A pointer to mock &xe_device described by &data
>+ */
>+struct xe_device *__xe_kunit_helper_alloc_xe_device(struct kunit *test,
>+						    struct xe_pci_fake_data *data)

no reason for __ here. However, my previous feedback on the approach is
below.

>+{
>+	struct xe_device *xe;
>+	struct device *dev;
>+	int err;
>+
>+	dev = drm_kunit_helper_alloc_device(test);
>+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>+
>+	xe = drm_kunit_helper_alloc_drm_device(test, dev,
>+					       struct xe_device,
>+					       drm, DRIVER_GEM);
>+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);

it's not a lot of code for individual tests to duplicate. We can always
add a level of indirection to solve the problems and make common code,
but then we risk having too much abstraction and people developing the
tests not really understanding what's going on.

The drm_kunit_helper here use the *compose* paradigm... there's one
function to alloc device, and one to alloc drm_device, and the test
initialization builds on that. What you are doing is *wrapping*
rather than composing. If we always have the same code every time,
then wrapping may make sense, but I don't think we have too many
users yet.

I'd take a step back, let the additional tests use their own init/fini
functions that are not abstracted more than it already is. Then when
we have more places we come back and try to consolidate.
Maybe consolidating it is not about adding one additional level
abstraction, but rather providing a xe_kunit_helper_init_device() to
compose with the drm ones.


Lucas De Marchi
