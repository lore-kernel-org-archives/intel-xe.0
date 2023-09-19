Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B781FCD5BCC
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4CC10E284;
	Tue, 19 Sep 2023 14:24:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D218310E284;
 Tue, 19 Sep 2023 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133489; x=1726669489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dINM9jfHZjTRy3RVZNuqPfRRQPJpdzN/FddO19Hy04A=;
 b=YozQhcfv6zmy3z+o2GGiXv5SsVynvO3codjVvyjC8WORpGucNscDT0Dh
 W4mCM+8iZk8FkiyxYD+huwXlK9J+B/TWBh86f7+j3VaftiSfcuB1zQQYa
 bXxsh9fc6Zx0gEslKwySanwRIVA+faINajeYMZ0dvZL96CTDSqc+1Vm8Z
 RZ7F676q29H6bpQKh6HSQQLGn4Q9dxo0JZohHFBdiwo4kASflZnqlxq14
 BLcOX8PcHtNl/xN7ElArxoW/LcMtbhvGETN8AjJu2naO1DteNMoEkA3rx
 2Zw+uWRKB0UdAuB6i2YxpueuRQvlMj6RX8/UAX1+ys/eOUMaduWIIR7/n A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278284"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:24:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924247"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924247"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:24:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:24:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:24:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:24:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:24:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh3/7L5+i030pFohICG0Y3GOXvHM+USB6fuvAwhCO1pF/ov8vTUNMrimhi2uvpo09a7UqIyuGlCPquXep/ThmlMyck6dOfrgfs8LLf/x6enBwE+r7Eq/gYarz5SClFDAzA6MWVOEGp/dv7j7nhgNeCT3zKIf4j9P5xhTSBweAcqZFz3rxyKpGenat3Jlyg/lCqY8kvwEHXhN3+PQ9hVnjox3Z9xDXwG60F5Us3rfkgaf1ToEQHihcNJe+YKidnWDM4NWz+55J/TdV7SgjvqJ6VeLbdkSvzFhVOg9m0wXLRS8WY3oGndfmeXKTRqya84pWb+NQhc7e1KA3a0XJMKRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QYcOvLVIpqa1tyGL1IP8iBs7rSoPpAaKHcHLNuCv9w=;
 b=bXaOjpnuKia4KBhqPu695xO+NQg+c6trr6BSt90gjFOLPyc3bqqR4ZkvNNh1ZMJ1cjB1p63cBqfiDxWslHNe/Q7WIPT6qs9yZB7ZwRYere1qJiAAcfCNKO+oD2qHmAGlm9feP5U8nRErgEzV73OlGwRVKZhjqMP1yHG4pXMGvY0ZZNcw+sirRAg9qaVWKL8g/zmotOHSb/PqQMJA0lY0nge0Dg2rJ16i0vrRB/yFlQ4fY4rwlt1cZCJV8M0BdBKur9MTX+yIcGgYtQxo8Y/PaOhrBjqrjnxWeZUkEuS5+3AV7ndooe3VvNDqszkk4COut3gzazVa3yBy4rhOKNyBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:24:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:24:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:44 -0400
Message-ID: <20230919142000.91363-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: e6349e04-69a4-4f9d-9994-08dbb91c2c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXH5T/ecGIZxZDgyzb/DKWBJVNPGhWU741GaodxxN7qYHeM9ytG+yDc4oEhD5G5EtMfUTBQi9t0YnGsz+1Ki+RdkGtFRZhzOeyOWjICkEJ0dmdtnqOn1Oicwgch0IWveHcR+fKldPurInxdbjT/+37GhJU2xHPHD1FST0zyOsQ2O6qB1NGLHoadEQBWBJP69VvRHABzhlp44+eQ0CPQ5Ci2L3q1OI3y7L6aShYZmUlBTg8FOM202jYvGb60f/nwyBbVCopBL1PriWsaRclsmJvMnNjElddWoqpgMJ2aSVsaaq8kEHqXiBjlkn53UpPf4EcjTVikubDg3W2evSqHAGhKQorg5aBLk5DdncEEpVGStiq09jwKaXpmFS9lio1sDYYr/ZpshCAy3jfmX0ZFuJpYZVLGBPCpELWZdZSb6NbzR2OTZL21K5kOoHS2xlj/pykMQseQf/pPRD3pCkrhO1e8WukHZg4O8cc9HbpyvgaYWk+BqbOXSnm4ya/NYiexCBrSre9mco5raOpvswuWZy/ZhQvNLwidc+QRUFSxbwdJcvaA3uOjpxvHUchlzK1lQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(478600001)(41300700001)(83380400001)(44832011)(5660300002)(2906002)(316002)(66946007)(54906003)(66556008)(66476007)(8676002)(4326008)(8936002)(6506007)(6486002)(6512007)(1076003)(26005)(2616005)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qwuMxgICZgCnbTKl5iUwzdY/RKkvlpKr/g6GQmZtFAosTw6/HalPUl7zlkhc?=
 =?us-ascii?Q?aTeTpXniQedYT/sxaByTOjFK+HuGsoaTREuwPH6NVrR+zhqtyLNc9Q5pQUT+?=
 =?us-ascii?Q?U0a0rUYjWjuxVieJGeJ0WNBImZBT7wBj8Tf2Q3Cf5hYyyPt60HTN+OAirNNs?=
 =?us-ascii?Q?+G3+vi6MhrF742DlgJgZus0ETMFv97Td0Afvimd1NnCDBFwCcYwhDqKc7Jb4?=
 =?us-ascii?Q?SiqfdXaqETWhF3jUJ/Rlovet7zBwQBfb0/VU9rFeMWAecox0I6LON3Qsb04Q?=
 =?us-ascii?Q?diA7QAwwoo/NTyHxW1Hj4/URM7Ifl6DJ0/T7dpAHKOhGqLAV4ljxMfUqYEDP?=
 =?us-ascii?Q?92DpAJdQHVSnJDk1FAtjs7cCH6p37gDwBam5hy0AX5ap6APecRS6O7uF3ESG?=
 =?us-ascii?Q?qlvj44VnMwEhvg58Npj2txjOO7vTIgAk4A+nBFss5c2vYPNbb6MEgW7AbSKt?=
 =?us-ascii?Q?TbnEDciF/XCz6WEBq8RnLqLwk/9ad2VFyQjOgfTmwz1JmCW/8XFWJUpXFY3z?=
 =?us-ascii?Q?Abr9N5eXcWT+4Bar9g0MN+6SMzDxGs1TWVMBtanoWCeLH7tlCjJmwTa1JdXg?=
 =?us-ascii?Q?Qfm+lZPE1ilLLeSOktctNbrTPtbRgprC+7nHSJaWgmEFXIdvQLNzyxQo0BM9?=
 =?us-ascii?Q?nxrUJqECkH4szmtjGEJt5vMwcoSDqlJOEQqQXoKquqEKiUA4/65CsjOPS7Qk?=
 =?us-ascii?Q?OVHGrR0jQhBWB1wTUssOELndwJYxaH6IHr2V8cABVEHRzpUqPgUj0RsbH+Xd?=
 =?us-ascii?Q?Rb39xI31tTVLgk88SrTi3gCzolKq8Innhu8LE+oh++huhmJ04VgqoK7+M7Gs?=
 =?us-ascii?Q?le4fRVIfyHCYqTfhTiAWRIXwb5hdz0HZ+NXwcvoQOEo2xYLe6ygA8ete8kqw?=
 =?us-ascii?Q?pLm8UbfzH46CoGeF36FLbnyEvrQ38fdLfJ2J5WqIK3BWwk9tNHM2x9Mu9jQx?=
 =?us-ascii?Q?3AbhMe0y4WDsiTmmOAsWuSwUe0A61IXzHJxoLQJrwRvFbqoPXKS/HgkSPSEU?=
 =?us-ascii?Q?7vnO9R76FaYX7VpmRk0Bxfzea1qSZ4GMuuVCxfNDQjTfXlu0wf2d5y3VSVDF?=
 =?us-ascii?Q?7ysbglHHVV68GE8tNUnI4FWrNJUjuxNZi3D96vEeTkwchzYOEgxKzae+EDrx?=
 =?us-ascii?Q?7Q9zfSMkbNz50JerfLMVymBxCzs1nvmjsVlpoGP7OY10W9oVf3IFH4VhaJy0?=
 =?us-ascii?Q?M2fdmgZAI0p9az1yFfZi0GOsK5f9J0fa5TUB3fwmPb0q3dSShE5RxfNGYXrt?=
 =?us-ascii?Q?6ZusQh2cs1++x8X+uySPkIiJibZ8aQYnymiAwB5HaJAKILu7xCBj4b0dbqHO?=
 =?us-ascii?Q?gPccNQe2XlGTHhjALoCjM4ab5SZJpdzbNzsHTiM7H2kPoWkdoktGP/kBFFTQ?=
 =?us-ascii?Q?wVXeqzC1aucVy4VdSfJywEl9Xl6LHWVwyTUpoxf8Ss4pUGGQbG6FznafYxZ3?=
 =?us-ascii?Q?nsiUwCD3fFE5SWtkNFRi6SweIoB5t3+WforMMo6hOeMvFWkdtcl/zLcoM0fa?=
 =?us-ascii?Q?yLHHkvWsNjw8KEEh9l0p9DHNiD0QUNC8eRIfsu9MkdXP8Sq1hsrVO+n3fWy/?=
 =?us-ascii?Q?yC+LY5DIhs244FCOQaIednXC3Qf2ZSsv8Ixl7LJQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6349e04-69a4-4f9d-9994-08dbb91c2c3d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:24:45.8019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdnvahHwDzUDTI2isDNmDAC7mXSG3IqvCcwt7tR2aZ+SBbohYG87FekrxPI9T8KANkpyxu+3OcdSJkeVJldy2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 01/16] drm-uapi/xe_drm: Align with new PMU
 interface
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align with commit ("drm/xe/pmu: Enable PMU interface")

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 804c02270..6aaa8517c 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1053,6 +1053,44 @@ struct drm_xe_vm_madvise {
 	__u64 reserved[2];
 };
 
+/**
+ * XE PMU event config IDs
+ *
+ * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
+ * as part of perf_event_open syscall to read a particular event.
+ *
+ * For example to open the XE_PMU_INTERRUPTS(0):
+ *
+ * .. code-block:: C
+ *	struct perf_event_attr attr;
+ *	long long count;
+ *	int cpu = 0;
+ *	int fd;
+ *
+ *	memset(&attr, 0, sizeof(struct perf_event_attr));
+ *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
+ *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
+ *	attr.use_clockid = 1;
+ *	attr.clockid = CLOCK_MONOTONIC;
+ *	attr.config = XE_PMU_INTERRUPTS(0);
+ *
+ *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
+ */
+
+/*
+ * Top bits of every counter are GT id.
+ */
+#define __XE_PMU_GT_SHIFT (56)
+
+#define ___XE_PMU_OTHER(gt, x) \
+	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
+
+#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
+#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
+#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
+#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
+#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

