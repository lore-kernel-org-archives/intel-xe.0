Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204A9C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B067210EA67;
	Tue,  9 Apr 2024 22:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ne/qpm3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2421E112FBF
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 22:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712700920; x=1744236920;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=mHoAoQnL/xZx+K1Irr1h3XBA0Rg6qlKaEArmKVbjq/s=;
 b=ne/qpm3CMCNc7AYTmHEePL/7Gt/q50OT+Tzycd79Il+i6wUCIy0dTMAU
 nwW9fkmNbQzbDzt5BZBThQJZlMlAgUa0Qy7ilYpVw5YWhxcgUFh++8pwr
 8iv9ovP/+bZXb3L+oqRjRJYEUpuGH5rrpgcGjLjlQe0MuFYv1/JKx3BN6
 EAZsyWhu1v9P1f0ptRY2HTkwHSrBQHCu8ZThlPIvsFBvZyr5ADNeNKSVP
 C6S+haKhy6TV0t/fiNppJCy+gkt8Q8CpTw+CbYAWRGNSN1JS3Ixa4EbGn
 n0M8j6+FsmrP5d39tSKYVqgPG6ke3A4R7Y5t1sXQllLa5jivElOri8pEs A==;
X-CSE-ConnectionGUID: iVOj5MZxTIqVf7uZOIhAgg==
X-CSE-MsgGUID: nPnTHOQqQyyd2q5PkB4BAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8614413"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8614413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:15:18 -0700
X-CSE-ConnectionGUID: wR8wzdOqQeGrHloZglS/cA==
X-CSE-MsgGUID: zQL6uYUkRw+J/c7O68VHKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51562175"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:15:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:15:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgTAiwdjodfWpKBi6bMXqIK+bnMjqUzDDQs6LdByANjHOQDiynFS6w8l9lijy17Jc+xFyQApxcmIxLNMd2RlJDGlblfO1LcDet2Cyc0JJub2WHCkXLScFO3uhzTHbejPx7mo6RExqMck/GSexBK86/dXme4J/qDYDlZMtFtj9Ep2qP14evT5RWynJs5SbQLgoT5skKrQThFqYxD6A0y822XWaKzrMkYEBasM5PEzoMr1c/xc78uSRQ+du4a8EX1ih1HhFqpnXc5+6i36FBPLnORqQp4gxTshGcJqG/EAWjSLkoRNiaz+zJFA0xZJzUcA1u4KcbvT9eG8BhrAs+FD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuT2x7bjMG8G/EY73emjw1b3W6OhUQU5HB5w32BL5UQ=;
 b=DvHQaFyoOEykDt8x4cCS2qgmX3Ss52kDqPb56AVTE4xpdKs4FnrzKbclL4K+nHAGC9jkkQ2v/1H3ExwgxiLnHPy7iC7VuAQ6jsuuwO9vBh7i+WiJEIkPaD6mOKuYT+C6axn8JSe9kWhZtDx4mhuQyiTlHfb3G8gPYFTqpuv2hgBs6VPwIDfF1ZLGt5L3Hog+oKwOOLkEPjo1vLc1Se8t3hafvmabjyc6r/5I2e3sKZrV5ap8U8Slt659WJ8me5/yxfi2OcS7xC9gnbzVFSSGcOH2p16dv2JBCj/J/pNEs3S1ol+eDS3grWVFb6LkcOvIwp7Rp38ZyC+i33FRJuH3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8604.namprd11.prod.outlook.com (2603:10b6:408:1ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 22:15:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 22:15:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/4] drm/xe: Introduce a simple wedged state
Date: Tue, 9 Apr 2024 18:15:04 -0400
Message-ID: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8604:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IY4rYdFSO0OHeJeyQrPnbBF8s9HRj7oaxzLH2yp0cjXHA2FbENdjsKqEu+Pbx+ijX361GmxM3uXSHcbrjXVbs+JXCI6+N3kDXFPtV+WxVJdh2BhnfprUh3QUxItlnUI5YGzQyxIubIZgFPhRWmgtJv9AfXy2QG/f2I9D2GddN+RR+xyM7mUc8DMLw/HrPwLUiehNyo00CQ9Ot8milmlcWIqd/3UysVEhBa/CC/O5Z/svHO26ZUf+wUgtoNYAMy/p9fyVtRrTnN1k96ft1cmSnckRr+H/5Z3QCySRi68WML3FlfgHEh6Lz5Qp5Qhx/TQ9DvpyOu/xFvgzbN5lU0v2BZlfSxjkl+fUsXQfrx1Td2dsqpEGTYFe1c9zZ+82zPFysLbj/C7v1eZWAjuQAwvg1PA5vndcQRiMaYnma6kwij5aOlrHVggG1NbtDSTO2jWIKOUdGrjJjU+o+y+Jc9ySvZbzykiGr/dlwUsPp/I4qMYaHsnlTluoPsBrfMH/t5Jxd876Eq3A9oUEL+4CiViMe5GArtsSL9KEGvabgh8xBmShumBl8F5Oy0bE6YD/FAufUmtm0axdJdHuGb/DFWsnZAioEaJKNAJsGzDXL1i9o0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXozL3VtWUhTNDVRdnVqMkMrbG1kM1BQUURkZlhRaDdDZ282blp6cFR4SE0y?=
 =?utf-8?B?MHdiNkg5eExtSG01THlGR2gvNGFNbFNVd0VyMWQ4d2wrVUVYOS9hbzZZV1h6?=
 =?utf-8?B?TXQ2ZHJnenY5U0c3eFF1QnIxMzNKakdNMWJiRk41NG9yWFkvVmpmNjBIdmc5?=
 =?utf-8?B?N01leWlGQzFWMFYwdzEvRTBZVnlTQTN6QzVHdGM1RWdzREZCNkhiUVBZNWJh?=
 =?utf-8?B?MmRWekREdno1Y09la2s0cTRkMk4rMG5Cbzd3NFJ4c1o2aDFNdktNenllWFFq?=
 =?utf-8?B?bWc1ZDBVeUNFMCtUMHZoVERWUFUvdFNNcVdjN0Mwc2c4TUUvdDZMcUQ1UTdU?=
 =?utf-8?B?VjBjM0NwSTF3alJlbUt6V2N3dXlPSGMrbmFXRzZBaVVuQXl2bGJnZVlQNHcv?=
 =?utf-8?B?cHFGOGFBU0dhVjRNTlNBWGozd2daMjhXeFcrQTkyWTdzZzhCTVJ0cEVWbVFQ?=
 =?utf-8?B?SGZJNjduNCtrdGVwSllRV05zcWtRZjBZRlRISHQwQ29Na0hmb1g3V3R1aWEr?=
 =?utf-8?B?U0V3SkNrbTVDamRsMGNLQko1WWUvWkYxOStSbzdxamJmVnE3eHZpbUp4UDJz?=
 =?utf-8?B?bTNLV1I1ZjJPdjFkRTBWY0xoNGQ0RGc5WVVPT0F3VFhGL2cvYktSL3lsU1FF?=
 =?utf-8?B?eTRuOWRyS0VrYlErTkNOSjJzWS91V2QzaE85UGpYUFdRNFZSZ1E2NUJ0N3ZL?=
 =?utf-8?B?VTNKUEVpOVZodERhaXpzdVk0NzR6Z211S3lYaURNNStuNit2bjFLRGtzSU5O?=
 =?utf-8?B?dUlUTDBJbGg2Yy9sd1pXMzFHWDFFZTB2SXFSeWRBc0s2SWJtR29ROEFuaDZI?=
 =?utf-8?B?NmhVeXNTT3pGWGNzOW5IdmdDZTFIMTVWeloxUnhoWGFMTExGMEt5NHMwVnQw?=
 =?utf-8?B?OTdUeDZOclFHWlU5VkR3RjJUQTFHV1hVRDUyZGFWTjRqaEZublN6aVVuYTlu?=
 =?utf-8?B?VGltWnNaTFhTOVZWVXZ2QzJvaEF3cnhKb2VRT1ppR1JNTzNsQU0wN2k1Nmd3?=
 =?utf-8?B?WDdENEVQOEpoZUk3bDJJNEwxN3NyRVJtNGhXd3B6cTZTaDl6c0MvMXRBMDFr?=
 =?utf-8?B?c1g5TEQrQ05ReFNQaldjUXpNNElaRlZ3ZGNUdm4vV1dyc1FsNnBuREhGdUhr?=
 =?utf-8?B?bVBrM2dBNnBmUWdtL1JJdzR5aE9OUHpyZ3VoR254bkJmcXN1RlpPWUM0V240?=
 =?utf-8?B?eFRRa24yaXFKUHdaV2swK2xZUDBPVVFaZFNjK1pGUzdoV0pHRmFtVmI2TndZ?=
 =?utf-8?B?WjZkbjJ3Y25HV0xJb21mRVNQdURwK0tvVjNKRlMzNXdDOHpDYkhXMGl3eEVi?=
 =?utf-8?B?anVJdG9HbEFIWGQrTzJHRk41enhRdG5UN3FHNXplY2NPNittUEhyMVBNUllQ?=
 =?utf-8?B?L0xHQWFIU0JmNXZvMVNnOWR1Nld4MDJWdGVUMDYyRVRXNlkvZWpJTFdXSkI0?=
 =?utf-8?B?aS9paHl3cUJ3d29qZHR4Z1hLQzE0d3RrbG9Ddi9CaUtXcDNGVUhPT01zK1FU?=
 =?utf-8?B?aVV5bkZPZEVLczdWZUZoZlVualRSUHJDUE9aNUY4Tk5jdHJDS0FFRk85L0Nw?=
 =?utf-8?B?a3lVWHJKekNpKzVkcHBEcTFaMFhueG1SZGNMd0MyNlpsZ0NnY2psSUZnN0tw?=
 =?utf-8?B?Z3J0UC8wVmw3ZDB4Wk1WQWdzMDZNUUZPUmtUWjlLRXF6d2ltbk42TGNUNHBM?=
 =?utf-8?B?Tk5pYzh5Q1Nuc2dETDVkY1pVTjRvZVFpZlVtREFKMXgwS25qalI1V1hyKzJP?=
 =?utf-8?B?SytBd3pyYlQ4SlVUNFF1cDZ5TGhDSVJkZGdEc0N1WDhiM0RNcmZvaVMycDQ4?=
 =?utf-8?B?R09tc2g5Nk1YVVNrMmFqYlBSckljblJlMjU5S0JHUjNPeExqK21NdGh4YUpM?=
 =?utf-8?B?cSsybVFuNDBVWmx6R0x3SWdGb1VDdlNCUllGRk1SRTJXYWh3SmtVQktTNU1l?=
 =?utf-8?B?bkxhR01SZ3Jqb2JzSE5WcjV5UFQxMjBIYVpNR05vdnZYbG5CdWhLZ0tNZTZa?=
 =?utf-8?B?YVJhUEZFZi8xWkw5S1NYclkydEtFZjIyK2EvOW1odExHSmFOZnJGK1dHTVAv?=
 =?utf-8?B?UG1iWkFPMldseE5KZDI1Uk1qK3JBd3RuT3d1djlBdGlaajJzNFVRZXFJSUdJ?=
 =?utf-8?B?dHZ4dGtxZTFvS3RhNjdVNzdTTTNHZmRmdEJubHJ3b1FaV243aGN0THRIN3Ax?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0992ce58-6713-4790-8485-08dc58e2871a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:15:13.5563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwM4J+Jar52FiH/HHeOcWLJrLNQsCSCgF5aTjbRYqTNcrhGwTmmnDxmWpFiLYd1WMKpmiPm/WyYS5T2OXn8J5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8604
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

Introduce a very simple 'wedged' state where any attempt
to access the GPU is entirely blocked.

On some critical cases, like on gt_reset failure, we need to
block any other attempt to use the GPU. Otherwise we are at
a risk of reaching cases that would force us to reboot the machine.

So, when this cases are identified we corner and block any GPU
access. No IOCTL and not even another GT reset should be attempted.

The 'wedged' state in Xe is an end state with no way back.
Only a device "re-probe" (unbind + bind) can restore the GPU access.

v2: - s/wedged/busted (Lucas)
    - use unbind+bind instead of module reload (Lucas)
    - added more info on unbind operations and instruction on bug report
    - only print the message once.

v3: - s/busted/wedged (Ashutosh, Tvrtko, Thomas)
    - don't assume user has sudo and tee available (Lucas)

v4: - remove unnecessary cases around ct communication or migration.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v2
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v2
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_device.h       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_pc.c       |  3 +++
 5 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9083f5e02dd9..67de795e43b3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_ioctl(file, cmd, arg);
@@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d413bc2c6be5..c532209c5bbd 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,24 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+static inline bool xe_device_wedged(struct xe_device *xe)
+{
+	return atomic_read(&xe->wedged);
+}
+
+static inline void xe_device_declare_wedged(struct xe_device *xe)
+{
+	if (!atomic_xchg(&xe->wedged, 1)) {
+		xe->needs_flr_on_fini = true;
+		drm_err(&xe->drm,
+			"CRITICAL: Xe has declared device %s as wedged.\n"
+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
+			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
+			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
+			dev_name(xe->drm.dev));
+	}
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index faa32407efa5..b9ef60f21750 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -458,6 +458,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @wedged: Xe device faced a critical error and is now blocked. */
+	atomic_t wedged;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cfa5da900461..0844081b88ef 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	if (xe_device_wedged(gt_to_xe(gt)))
+		return -ECANCELED;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -685,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
-	gt_to_xe(gt)->needs_flr_on_fini = true;
+	xe_device_declare_wedged(gt_to_xe(gt));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 521ae24f2314..f4663f1b0a80 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -902,6 +902,9 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 		return;
 	}
 
+	if (xe_device_wedged(xe))
+		return;
+
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
-- 
2.44.0

