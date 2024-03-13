Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D8EC54E60
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 20:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90D410F863;
	Wed, 13 Mar 2024 20:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdGRvwMD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40EB10E53C;
 Wed, 13 Mar 2024 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710360475; x=1741896475;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rT+W2hg8Oa7Ch/0+fyG3Pc2sDK6XZyw1B7tokqSq/Ko=;
 b=GdGRvwMDkdCRY62bZ0VbgBBTrAv0AV/fqg5c38s3VD2opi0beMln65+U
 fNZMqWz7wv+csDq7OupcvA4OU9osFwryz+t8NQunkk1Vsds0QFOH+kt1t
 DKw050CRsdQUwFmsuQN2y7hMwLl5OvSHvPNzj1dCM7JC85NgG+4qyZBG9
 iLc0REOkaTy6evGJcEYXf1IT7GD/LD1KNPm0hEPbidDkv7tUIT/AHQJEI
 Q3yOtS7+mmwBgTgT40+eDrKPCpq/y3QOe6N89+dgvI7aB1q7iB5DPqm0n
 sFmfRYz0GamoxGmZFLZ8PvcmL9JiSJyx17MgMBpHbxxQBf1JAo668Wd5L g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16602937"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16602937"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 13:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11976585"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 13:07:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 13:07:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 13:07:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 13:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XioFzfqT2o0eHAycvfBpsX4Zk0Xm3U35UfGMxB1sDCA4PPmq2hVFptB/FFW5eKcbThxlcN6F5z74fLAcEexRMa2IUHm5dV+uFjafbvWdnpYPzEvwqP/qcXdSAmOKGJ7TkIkbMAjfNZS0B9yU3XSZSuwyfXAY4SeT+D20cfoZsZC15ab3SWKjhVDgGM0RfBtPmSM3LS1GQ9tRArlXXoOPUejMVS1mz86s+Il4U8Kl/S4UpnfXkxcrEA0+1G1Rma1dr2NjbXYpDTXEvQUtpRBBupcdfoynd1pjaOykgJpT6sVf5QkDsHMKH3T1GKAf00BDJ6b3j0uJ9OTSCsQg+XBDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnvguIhBHUlful+3IMfzcxei8utINnCpSXZQRUF2g+c=;
 b=ct6iG2LM4Cen1WSQs/mEQI2WXbiMCAC4ORtYwGX6Yb6Amd8dtIscFkM9pDJDZewYDOI3hISvFS4VfW7f55LG2qeLXLsiBCrJeVOXsAcItQhOPptZ/zqOhgv1ALQZguM2LQpBJg0QAev51/e6mA1BvX40XZ4Imd/DqNrx1HnzYI/xxhFjD9QRDLEBEuGBlwQWHVyjOxEMtNToyQdC3rNxpkp/zUI5iwoZPlGZ9H3VFtNm5Dmnwd2N0vSzex4nfT8S83UPUAEL+of2tUEhW0Z/0OjKMxPUEHUhUAVF/trrRU+K9gSVupqpavxurYnStxmDp01G4akF0p6LW/LARcFTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7650.namprd11.prod.outlook.com (2603:10b6:8:151::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Wed, 13 Mar
 2024 20:07:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 20:07:46 +0000
Date: Wed, 13 Mar 2024 15:07:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Introduce a new test for Xe
 device wedged state
Message-ID: <rkw7vdk6fssletnevhneqciacoq5rxgbwfb6engvpf4yuqvmqb@x5koe4zreiwo>
References: <20240313195530.141586-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240313195530.141586-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8bbccf-bec7-4f37-5792-08dc43994023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlBs/6Ye3oq9ozsEpTKdByY2Q2lSWEaPGhQClUt5n19qgUK3j0tYaEwPDKcFDev4lfwcwYqUMZHs3CI0Q762x9d+MGWD+Z4+4fEhV4odfkZiEsiXi/7IgzUY3fCQIsWXvLcAgcKmvclyHsnkKVpArrfQoeAj6h4mhwA++lK0jD+1cCtVO9t8yAJgaOYjocVPaFBmvjb+TdkwRRDXvU4T96BP9/TGAQgs6KAMt0rsUXV5r0qR1Qc3D5jOwiQDIpaKRouIhI/WJJEUkEHCFUHUYBSoLFf1kTWMicRQWGy81z1LCrkVl/IwiRMCg67apLnSHeSDRf+93WZCnarQrYNpFhQ7gKlVSEiKXG4iVNRUToYVAZkODNHMbTTyaoP+KgwNpJJmBoSUD1xPSX25RyflyCwycnA8uHr7O4dCxpQHww9yeTC1WwUg5s8fKBtH+9RcvYzgHz5z6Vq00KM6+UldnJwUZpf0MucSGdI4nBj1O35cqG4WFPBHF7kQ53pvFaq7b8jWd2PlnX+0z+xLcJ5R/lTLEnEpTGlkn9Pf6VDMekCY10xQgtlkOwcCj1NZIP9Ex5YrNcS+cpu+VCQ9Asd1he8UC35jHeLbbaf/3hl2LnCREtnKv+n6pnvFIRqx4WdYVrbztNi7byvakzg7fLk7F3xJxTJD2WivbKBTPxoYl4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?k/5cJkfRVy/JfeTWwn2kBALtMnq7k/fBGjH2sFtxJ67i4xiT5xGpjMg4Se?=
 =?iso-8859-1?Q?bo4TlDXSxtJeqf8eFl1FAMMy8AWZ7lEIzgF+yrkiEIlt7ztCfJVZDwdmsJ?=
 =?iso-8859-1?Q?Rt4/P/0D4aNT5bULzDJ2fv/ovEc6mXS6sfjKM2Wze+nfBEJppAiSOcS77G?=
 =?iso-8859-1?Q?/b0fMErbpg0z98d6Rv6YlbB3d6ISrAmpcBYBaXUWV6MOYluOppcTceUmDd?=
 =?iso-8859-1?Q?mbfTfR9v7JfVuTE0yEPHwlsg6YJ5QPWuqve99quboKP0AxI5w3rDGdkVxO?=
 =?iso-8859-1?Q?V9NOuSJD+OSWWkliW4gJ8HE/ypmCNe5igkbSwX/E+C9uxTchDooF8pLsFt?=
 =?iso-8859-1?Q?frzO/3ZgOWdnvkpx/gFzK85cqDN2Buza8T+qM/QIAxzUTSro0OwfY3RsCe?=
 =?iso-8859-1?Q?M8COW9oh6ALvaIJkV90n0jLDyt3GyOInLn+TK5Xvdo/PNdddLXDz79/3A2?=
 =?iso-8859-1?Q?1wdGaA2YqaZqucVdI2qMwBEnImNox93hkd06eaC89r4Ual56lmb78OcACO?=
 =?iso-8859-1?Q?wSVJI+KDyzFPM3QFOgxPdmDCwVhcnbVf4qNeZTdB5n/1xbDXYX40A0yRs7?=
 =?iso-8859-1?Q?a5mKLH8rzqHE6m3DK/Ezj+s4TRBDq7vv7rI7a8IOO6LoN5yUF1Qyzv3N9b?=
 =?iso-8859-1?Q?uHR7KVdluaz1zsFLejg2Ito9s+yHFXL6GvvzWhO+Dv3Z2Uv7ESKbmLtfX5?=
 =?iso-8859-1?Q?hDvJKLC8AFoQcC31vVD3YM8zJ8MsfVvCtFGZKWiJdcOvPnrxjNTZEWyuxs?=
 =?iso-8859-1?Q?B5oZZVuZID5YzYjLGLTnpIkq2NPT0bsufOI8lnkJ118C2Pvuc+/tcA3y1f?=
 =?iso-8859-1?Q?evqZnYXh2yKTv+sijnSa2uzC46MTIf8SAW3FUVkC0WJ+fAIbn50zYRNuIK?=
 =?iso-8859-1?Q?XP3gahmNM7pNZjxPBJSRHGSXPeoAhcGtK70JiK0UFDgnSNdsqlveCXfiKu?=
 =?iso-8859-1?Q?TJ0HHEiyFjaf0mx/Ydre1NZuHkEN1Snzq2ANWAIwavV25NyunoPwquZ/G2?=
 =?iso-8859-1?Q?TPnDwZJRIC7S1qRcmuIMAkIzTEofFvkS8eptcYsYkfpCn2eb+la9Y0kOV+?=
 =?iso-8859-1?Q?74yNrdc+8+usU90PZI999S+Ccu1LFnmaMDNL8J2SlLz5S9huWzTB9nm3jm?=
 =?iso-8859-1?Q?wIsss9T6c4R2GTJj+MDNeijywMe666weMNBtOjIUVdduN0Uci04nZUMn1j?=
 =?iso-8859-1?Q?C1QPcd8nk/ZAV0nlvSU6T3DguOd2hQsqSqqxAYBClNxb0tZEPq+E1dZyXs?=
 =?iso-8859-1?Q?KEWK3rMD+xZIyijKSY+C+AuwAI0X87eN0tL4wbVhojpx3zi8V3HUnOStLM?=
 =?iso-8859-1?Q?r65nHpjjkyJr8kGMyaGK4tLhkluCX6HznLvwmv/ssIm7Y2l+aqB5vTvK+4?=
 =?iso-8859-1?Q?4wuNBimmGwvdpSPN5FOHRFaxWWIJ84SWEpu7bP0UO/daq9Rn9n7PBRcyGC?=
 =?iso-8859-1?Q?w8miyjjaVq/lUy3xCM1ZLFh6WWh5d/7ysot6/Zg0ccxfX77V74ryVuwwzZ?=
 =?iso-8859-1?Q?5sb6L39TAWpuMOIXypllxrZkhsYjLORtZj30VCWreGGItYWqytOVGcm4B+?=
 =?iso-8859-1?Q?uDqz3F+WtZ91oqKkT98WVd5oif4PNPJ3y8CPvJ4wsPGGXVoHr43w7wLIJN?=
 =?iso-8859-1?Q?GeqjQN3TYC3SIMmjc3nBEJoeLQPNT/nY9QqB/9Fdxp2M0o32G4BtKxzQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8bbccf-bec7-4f37-5792-08dc43994023
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 20:07:46.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkwM2x6TnANSFYSZHu47eQ0OqjQPG/pYEXi8ZDvCxfYCC1sFz1nJGgjRSWB0RYFj6G4RJpKY9ATJ4fmbNx3NXSkzwLNcRDCoFzJ7VeNSa0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7650
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

On Wed, Mar 13, 2024 at 03:55:28PM -0400, Rodrigo Vivi wrote:
>Let's inject a gt_reset failure that will put Xe device in the
>new wedged state, then we confirm the IOCTL is blocked and we
>reload the driver to get back to a clean state for other test
>execution, since wedged state in Xe is a final state that can only
>be cleared with a module reload.
>
>This new test case is entirely based on xe_uevent provided by
>Himal.

/me confused... I don't see any uevent handling here.

>
>Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> tests/intel/xe_wedged.c | 91 +++++++++++++++++++++++++++++++++++++++++
> tests/meson.build       |  1 +
> 2 files changed, 92 insertions(+)
> create mode 100644 tests/intel/xe_wedged.c
>
>diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
>new file mode 100644
>index 000000000..f767e2511
>--- /dev/null
>+++ b/tests/intel/xe_wedged.c
>@@ -0,0 +1,91 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+/**
>+ * TEST: cause fake gt reset failure which put Xe device in wedged state
>+ * Category: Software building block
>+ * Sub-category: driver
>+ * Functionality: wedged
>+ * Test category: functionality test
>+ */
>+
>+#include "igt.h"
>+#include "igt_kmod.h"
>+
>+#include "xe/xe_ioctl.h"
>+
>+static void force_wedged(int fd)
>+{
>+	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
>+	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
>+
>+	xe_force_gt_reset(fd, 0);

humn... do we have to check the writes above did anything? I also don't
see the kernel side, but if it just resets normally, the test would
still pass afaics.

>+	sleep(1);
>+}
>+
>+static int reload_xe(int fd)
>+{
>+	int error;
>+
>+	drm_close_driver(fd);
>+	igt_xe_driver_unload();


what if we are running on e.g. MTL with a DG2 and want to debug one of
them? Rather than re-loading the module and possibly causing unrelated
issues (if e.g. module removal from the other card crashes), why not
just unbind the module from the card under test?

i.e. the equivalent in C of:

rebind() {
	pci_slot=$1
	echo -n "0000:$pci_slot" > /sys/bus/pci/drivers/$driver/unbind
	echo -n "0000:$pci_slot" > /sys/bus/pci/drivers/$driver/bind
}

Lucas De Marchi

>+
>+	error = igt_xe_driver_load(NULL);
>+
>+	igt_assert_eq(error, 0);
>+
>+	/* driver is ready, check if it's bound */
>+	fd = __drm_open_driver(DRIVER_XE);
>+	igt_fail_on_f(fd < 0, "Cannot open the xe DRM driver while reloading xe after wedged\n");
>+	return fd;
>+}
>+
>+static int simple_ioctl(int fd)
>+{
>+	int ret;
>+
>+	struct drm_xe_vm_create create = {
>+		.extensions = 0,
>+		.flags = 0,
>+	};
>+
>+	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
>+
>+	if (ret == 0)
>+		xe_vm_destroy(fd, create.vm_id);
>+
>+	return ret;
>+}
>+
>+/**
>+ * SUBTEST: basic-wedged
>+ * Description: Force Xe device wedged after injecting a failure in GT reset
>+ */
>+igt_main
>+{
>+	int fd;
>+
>+	igt_fixture {
>+		fd = drm_open_driver(DRIVER_XE);
>+		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
>+					       O_RDWR));
>+	}
>+
>+	igt_subtest("basic-wedged") {
>+		igt_assert_eq(simple_ioctl(fd), 0);
>+		force_wedged(fd);
>+		igt_assert_neq(simple_ioctl(fd), 0);
>+		fd = reload_xe(fd);
>+		igt_assert_eq(simple_ioctl(fd), 0);
>+	}
>+
>+	igt_fixture {
>+		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>+			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>+			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
>+		}
>+		drm_close_driver(fd);
>+	}
>+}
>diff --git a/tests/meson.build b/tests/meson.build
>index a856510fc..e590d4348 100644
>--- a/tests/meson.build
>+++ b/tests/meson.build
>@@ -312,6 +312,7 @@ intel_xe_progs = [
> 	'xe_render_copy',
> 	'xe_vm',
> 	'xe_waitfence',
>+	'xe_wedged',
> 	'xe_spin_batch',
> 	'xe_sysfs_defaults',
> 	'xe_sysfs_scheduler',
>-- 
>2.44.0
>
