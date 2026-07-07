Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22D1C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 12:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC2310ECC2;
	Tue,  7 Jul 2026 12:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OT9Sy5uC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D06810E4C5;
 Tue,  7 Jul 2026 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783428608; x=1814964608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WA7i9saaEkHwJMC0FSSCwiHxa1nHCsYWv66JSEIz794=;
 b=OT9Sy5uCEjq4ACOxdbebFes3VJohvPSG7jl1tOwY1MGpCJQArF5AZSxW
 a3+pVNDPgYXJYw6baPpt4EhUUuDSxUjVFFxThCPIcbyIfE6P2Q0INuYs9
 Ru+u1F0T7GE2Z84+aLNlON2S3u/0/bKWjXDU3lrSz+iREn3VGlTyJs6Jx
 CWJBGUIzqC5tyrDy6z4V1k0L1nvz2PRr+b8o0qhaB6gE+MlfiQwh7wTwI
 t1jtc4Th/mVgxwNW6PH6CIB76269XF0haGqgoWjOPjYGiQnHMXkv152UC
 8SxxGTYZ5RPsd7aOXala6Em9D0LUBTDOW1XMlGa75Hj1yGeS/mco5FQJr g==;
X-CSE-ConnectionGUID: QW8uSOqZRNCK3AOVj/U75w==
X-CSE-MsgGUID: 041FbFRvRJ2LlV48Kiv3rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="94718666"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94718666"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 05:50:08 -0700
X-CSE-ConnectionGUID: Yh/fnaGKSRiCsEZ2rHNkhg==
X-CSE-MsgGUID: KV4QH6Q1TYiiX9k5KBkL3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="292159405"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 05:50:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 05:50:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 05:50:07 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 05:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=No5j60o59dTuJrj4gYfqpagzaKxD0Yhb7g+vSbDhNQkL4OmC0Kkxf05bNfdwenlGqAul0ZtUb3osjzY+EoHnA+XVxvzMiObdgbdwurWwPOWp1uMPDm2pwolcQC+PtMI+QX9ipRuOYWTZX9Xv1vrYKL/ikwcXomF1uzVwuYqn5RD1M5PWOsau/hKP64BWBtZvj5cb7tW4rRLhoYBRp6IOwEhdTu1MZARJQB76CpPdZt1MhiMi7cTf3ln5ZXbOmIFmhD4+yRDFx1LV2wGuEh9j6DKCMaWmDHCUl7Dz7PRgwOBfwtb7ekBxVwWgJCgIRF1izNAlOE2zbwmK9IC1ESnXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Re2MYGv0yj8hfhg9R+4erASIm5Ti2U0GnQKVcn1JF8=;
 b=Cd6JCpTfFKTHrgf0ieVVBqA//XRmq9DPgMJfxufgPNtgvydHiwPJYlsuz7VOtmWRT59rgHrLSLqrULEq6HAbCz8sh70000gVZazpWsqTU5rKojFCsD1yRkMOv7Zsks8Wii8Y3KQOboA5pG9Ypsn7/ywQwtyl6ORKpPyHIGU2ooBFJwX1nm2oeSy9qyxvy8NIzNmpqPfkyMFHPpnJaHAd5x+msMflKJ4w8k9K8wHddHoSszDUKzUUPzGZO7VXo1lTFnBMYAulI9xefvUUePpYWC2piAGeIxo6oPXWQ6ErkJR1XdOrvgACmnPHhsjAuDyA8ikBTFhYD9by2rzy0OjbBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 12:50:05 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 12:50:05 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 32/34] drm/i915/kunit: DP link: add baseline fixed table
 reference test
Date: Tue, 7 Jul 2026 15:48:48 +0300
Message-ID: <20260707124849.135319-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260701153204.4124150-33-imre.deak@intel.com>
References: <20260701153204.4124150-33-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVX0EPF0005F6F2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::255) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dff6084-2057-46c3-2586-08dedc2644b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2aoNbv1RXXbnyxaYkGXdcgquNgdgBXAhEoRo7TGVFw6RVOGZnIygCXvNlRabiy6c3z3pTc6Sm2zZ1sc1TSrKwEGdmdhSntHXs3fru/t1U9+keOzkOpCDDHF8Q2EtUeckqAYl4OsnDZFlTRndaYl+VDFjA0JbNHOCFWcWqhL9lHzku6YUXaXZVzcFSi5o8WBXx4mM/0AxyXDsndqoV2/AAbA7CVo4SOq/NWGUNUq1sSmWFDNjpHkxOS7ApK6BdHIyAccbElfYM6emyR4W3znA43B9EJohIXLSOIJ/cl1z/hkPudHXvHns2iAB+mL6YNrKW73y604r3s3xwLf9jlo2HXf29P1kpD+Ji3NUyjkU5ExzCEMp3QdmvW5znvA8thpWZSvbLarx4zZ7z3zlJWq5couwhmn7O4588N+xRw8fvGrbgVUmoRW0pJUWgG6ejf74fVk6/sVozYcevit9gNBvyr7sDMAgffiHUc3HfmdgonMspIp34n+ERSlurKKhd1HdErT/KPCCl+ZFQicDfLiFB9RP57QtJEiPF2KtwPA0WH3hD2fUULlklk1zxD31XKKSny00h0NVFeGnkNTuy76kcCwtC1B6rhqZdCHqZAZ2+c+OVn+Hyds2ocCaGqOi23pzxeYRmgr/oNpOXzQ8UDLIUpoFL7obSWHFsnr4MXETQnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWt6dERYMmVSU0Zvd3hVQStrSHpmWmM5cW5TUG1ET2tqc2pObGUyb3RmeUh4?=
 =?utf-8?B?ZXVzQ1hYRzhKTlFacVNhMXhlUEIrbmhJZUxpbTZZZFhCby9yYThNUGE1ekdX?=
 =?utf-8?B?RlhOTFdJY1RNdllCa3RqRGtDd0tUQmNCZEdZYmUzZ1M4cXdJak5tU1l2ZFFr?=
 =?utf-8?B?b1RFeGJhOGJ3MW9yeTJkcDN3d29NalhzNUhKY1FWTFV2eFBGTHZINHNjU3lJ?=
 =?utf-8?B?eHoxdHFpNVBZdlRrNkJjSDgzRkFZcnkxaUZyREh2NkRSeHd1NWUrVEpMRFBz?=
 =?utf-8?B?U1dLam5DZm1YakduS3puT3dKNU0zOUh0TFB0a1RWa05QcEw3bFNTYjBIbnlN?=
 =?utf-8?B?TTFDMHJnaURUYlhVellYajY3NE0xcEx4Wm1pR05WVCtQTStBM01sUWdrR3N5?=
 =?utf-8?B?V0VzTGtzaGFJaTNua0p2Z3BucSszTk05ZzBiQXhmOEYzWUlodGhBc210cTNK?=
 =?utf-8?B?MWhiOEVHR0dtK1I1YUtZWmROZkFxalMxVVkyOGtCeTJZaHpCY0NoWS9zOWlD?=
 =?utf-8?B?aCtQWGRuYmdZZXp6aUV4cllpOGVqaWtaeWZabmFKTUc2ZElRRUM1TE54SVk5?=
 =?utf-8?B?QXYzRnlFajNFSFY5L0lvM1REcEQ5bmdrR2lwVDB4bExxNUNXODdZUjVIZktN?=
 =?utf-8?B?cEdhS1lCcXhEN1AzMUFQeGV5anUwa2ZWa1FocnEvajJ4dFpHckVjS3E3alg0?=
 =?utf-8?B?REtpQm0rdTRwS2pjaGVRZi8yaHlQRWVSeU1zaWNLNTRFczdjb2pKN2h1N2xv?=
 =?utf-8?B?c294V042ZGVSU0FPT0pzN2NFc2FFaGJrajg1QmlEY3hFYzA4eVp5dXB4TEFu?=
 =?utf-8?B?Q0pwbnQvcW1ydFVTamlWSGh4SUQrQ25OWEdzcGRPaU5VVTZZdEhCKzNnSnFF?=
 =?utf-8?B?SWNteVo4VGlqWnlNVlJqOWlMd2FuaWMyeGhzMlN3dHZQUDJLODQvQnpEU0hp?=
 =?utf-8?B?VFlYU0xvWXc4K2YzdTIrcTR4U2hJd2crWFRHbGRBVmZLY2NxQ05WbStNUWdW?=
 =?utf-8?B?RkpLVFBsZHJ4ZVRreU1UcEllbHBWQzRSTjI3Mk5EWm1yd0s5cm4xZlVWUmJu?=
 =?utf-8?B?dkJ3eUJQeDBwMk5xb3BwdWc3SDZaVGQvOEJaNko3Q3RObVgyVng2TVVrellB?=
 =?utf-8?B?RzVFdzUyVFdLWkVDd2RwZUpiWHlWcGVPdkF3OU4zSjZHWG1JN0ZBdklCYUdL?=
 =?utf-8?B?UkJTM2s1L1Q2L0ZRaUlLMTk3SVdXZVBWT294SU9TcTk3UEdpMDllMGF5M0hW?=
 =?utf-8?B?em5pbVBwUm1xNzd3MGtrd3VBTkZlbnN3S0ozWm5rWk91ZXZ4MHlWdmhGYXUr?=
 =?utf-8?B?U3F4aEV2YTFta1VpNXZ1bXFvekxrbHAyeHc1UW1SblhQMU9RdnhJWExiNHp2?=
 =?utf-8?B?SGxETlRVK0N1SnhXczVqT3huaVMzdVBYSlhMUnhBZW5obFVPUUpLYzJNUFNp?=
 =?utf-8?B?emZzRmh6ZzVKd3BkQ3Z2Z2ZzYXFkMmlLNDdEWlArM0w5NWd3TC81L3o5R1Nu?=
 =?utf-8?B?TnQ2b0UvS0UvODNiYnEzNkk5UzN5NXhaNitvWEtPbUFBRnJWVnhWNEYraDFk?=
 =?utf-8?B?dERmUTJvenRDdWc3TUQzT2xUZ2VNQnJ0cUFBb3RQaGd1Q0d6MVZQRE10em45?=
 =?utf-8?B?M1FLMXFDZVRna3QzU1kxR1RJYy8vWUVBNnZ1eGJPQnd4N3ZqWUdnYU1xWGNP?=
 =?utf-8?B?eXloVmp3UXk5ZzJFVU8vY2lvODE4b1l1ajBQMUx2NDFScVdtdS9SMnREUkcz?=
 =?utf-8?B?TE96VGwyelE1UHBTdlNZaWwxYlNNb2RUbUlzZHdRdi8vSjdqK3RyN2cwazFF?=
 =?utf-8?B?dG0vdzFLZEVGcWJrRVpmeE5CcGRDK2JTTzhYMjUvcXM5Z0lTZEwyV3FCdnpB?=
 =?utf-8?B?SzBlRlF6T1hjRmhIc1N0NU12bC9ac0ZMWUQxZEc2VU04K01VQSszZnlyUmtm?=
 =?utf-8?B?cjdVeU83d2tzYmtuWFJTellZOTNpWkJzSDlMWHNWemJXZjI4V1BzV21NaUkz?=
 =?utf-8?B?TURqQmVicVFqN0dWYlNKaE5rc2pWb2hZOE9QbGJ0MjFWQlNKYnBQcDlDN3hG?=
 =?utf-8?B?Y0xOQ0lSRmQ3R290cWZFSUVLQTd6STkzK25JV3llZGdhWGlmTjdtb1g4cUhy?=
 =?utf-8?B?UDJLOFZCT3AyWm1Ob1R2ZW5kNEM1aXJFemdRZVZFL2ludmh6U1ZxRHFwNHYv?=
 =?utf-8?B?bVZIOStWeFFqVlYwUVNQRW9ncWNTSGZqNGRkSWNQOFNjV2lEc0xWUURCdFdv?=
 =?utf-8?B?TGxUb2kySWdJVG1zS0pHa0gycTB5U1BqRGl2REd2UEcyWFlybnlweUFaMHNQ?=
 =?utf-8?B?VWZqMU12em9VWU5DenhuUTZGSkR1ZG5Ocjl1NDQ5T280RkFWbmxsZz09?=
X-Exchange-RoutingPolicyChecked: f45o1O1gb7MH5+b1ssPThNO96l4bV+9E3ORowy0tRQbxphsJyU1DxcTHDH0LEejkFSoczalXpnADDHjtbbuIQoGS0Bf6L6NaK4JcO5LmkKKray5/+YyKfWftoE/3TDtkuCQGHWq5RaAwwjUREAxVs09AuYfa0zBqi6sc9W2zN0QrObVHlKMzWaw7dwLRe6eTwKEpicFvzaGnhmvddf31D2VgNHPzCt8THnLSi5LfnF+0Je3ZM8AerxtmRNwHfPxSFzxVH0MI/vZbjecs9k8r4v6akXQvXXwY2XSbrRyPZmdMdR7ivRcN19+vpd2JXgFRCMASgDZfFI94nQe1J9VD0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dff6084-2057-46c3-2586-08dedc2644b1
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 12:50:05.4515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ix6upaBkesIVlsA10XAQWmpVGBarH2nPVtYf/4j3pgyvmP3vbIWtPiEhkoo3a4kV0OwfUPtEgwdE39fOkL//MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
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

Add a simple baseline test for DP link caps iteration using a fixed
standard DP configuration table. This provides a minimal validity check,
independent of more complex test setups, verifying the iterator returns
expected configurations in ascending and descending order.

v2: Unchanged.
v3: Test config iteration in lane count, rate order as well.

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com> # v2
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../i915/display/tests/intel_dp_link_test.c   | 206 ++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
index b77472e9bbe12..f49903433d60f 100644
--- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
+++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
@@ -7,6 +7,7 @@
 
 #include <linux/compiler.h>
 #include <linux/device.h>
+#include <linux/log2.h>
 #include <linux/prandom.h>
 #include <linux/random.h>
 
@@ -20,6 +21,18 @@
 #include "intel_dp_link_caps.h"
 #include "intel_dp_link_training.h"
 
+#define LINK_TEST_NUM_LANE_CONFIGS(__max_lane_count) \
+	(ilog2(__max_lane_count) + 1)
+
+#define LINK_TEST_NUM_CONFIGS(__num_rates, __max_lane_count) \
+	((__num_rates) * LINK_TEST_NUM_LANE_CONFIGS(__max_lane_count))
+
+#define LINK_TEST_MAX_LANE_COUNT		((u32)4)
+#define LINK_TEST_MAX_CONFIGS			LINK_TEST_NUM_CONFIGS(DP_MAX_SUPPORTED_RATES, \
+								      LINK_TEST_MAX_LANE_COUNT)
+
+#define LINK_TEST_NUM_RANDOM_ITERATIONS		50
+
 struct test_ctx {
 	struct {
 		struct intel_display display;
@@ -38,7 +51,200 @@ struct test_ctx {
 	struct rnd_state rnd;
 };
 
+struct link_rate_set {
+	const int *entries;
+	int size;
+};
+
+struct link_config_set {
+	struct intel_dp_link_config entries[LINK_TEST_MAX_CONFIGS];
+	int size;
+};
+
+static const int standard_dp_link_rates[] = {
+	162000, 270000, 540000, 810000, 1000000, 1350000, 2000000
+};
+
+#define LINK_TEST_NUM_STANDARD_RATES (ARRAY_SIZE(standard_dp_link_rates))
+
+static const struct link_config_set standard_dp_link_configs[] = {
+	[INTEL_DP_LINK_CAPS_ORDER_KEY_BW] = {                        /* MBps    PBN    */
+		.entries = {
+			{ .rate =  162000, .lane_count = 1 }, /*  162.0    3.00 */
+			{ .rate =  270000, .lane_count = 1 }, /*  270.0    5.00 */
+			{ .rate =  162000, .lane_count = 2 }, /*  324.0    6.00 */
+			{ .rate =  270000, .lane_count = 2 }, /*  540.0   10.00 */
+			{ .rate =  540000, .lane_count = 1 }, /*  540.0   10.00 */
+			{ .rate =  162000, .lane_count = 4 }, /*  648.0   12.00 */
+			{ .rate =  810000, .lane_count = 1 }, /*  810.0   15.00 */
+			{ .rate =  270000, .lane_count = 4 }, /* 1080.0   20.00 */
+			{ .rate =  540000, .lane_count = 2 }, /* 1080.0   20.00 */
+			{ .rate = 1000000, .lane_count = 1 }, /* 1208.9   22.39 */
+			{ .rate =  810000, .lane_count = 2 }, /* 1620.0   30.00 */
+			{ .rate = 1350000, .lane_count = 1 }, /* 1632.0   30.22 */
+			{ .rate =  540000, .lane_count = 4 }, /* 2160.0   40.00 */
+			{ .rate = 1000000, .lane_count = 2 }, /* 2417.8   44.77 */
+			{ .rate = 2000000, .lane_count = 1 }, /* 2417.8   44.77 */
+			{ .rate =  810000, .lane_count = 4 }, /* 3240.0   60.00 */
+			{ .rate = 1350000, .lane_count = 2 }, /* 3264.0   60.44 */
+			{ .rate = 1000000, .lane_count = 4 }, /* 4835.6   89.55 */
+			{ .rate = 2000000, .lane_count = 2 }, /* 4835.6   89.55 */
+			{ .rate = 1350000, .lane_count = 4 }, /* 6527.9  120.89 */
+			{ .rate = 2000000, .lane_count = 4 }, /* 9671.1  179.09 */
+		},
+		.size = LINK_TEST_NUM_CONFIGS(ARRAY_SIZE(standard_dp_link_rates),
+					      LINK_TEST_MAX_LANE_COUNT),
+	},
+	[INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE] = {
+		.entries = {
+			{ .rate = 162000,  .lane_count = 1 },
+			{ .rate = 162000,  .lane_count = 2 },
+			{ .rate = 162000,  .lane_count = 4 },
+
+			{ .rate = 270000,  .lane_count = 1 },
+			{ .rate = 270000,  .lane_count = 2 },
+			{ .rate = 270000,  .lane_count = 4 },
+
+			{ .rate = 540000,  .lane_count = 1 },
+			{ .rate = 540000,  .lane_count = 2 },
+			{ .rate = 540000,  .lane_count = 4 },
+
+			{ .rate = 810000,  .lane_count = 1 },
+			{ .rate = 810000,  .lane_count = 2 },
+			{ .rate = 810000,  .lane_count = 4 },
+
+			{ .rate = 1000000, .lane_count = 1 },
+			{ .rate = 1000000, .lane_count = 2 },
+			{ .rate = 1000000, .lane_count = 4 },
+
+			{ .rate = 1350000, .lane_count = 1 },
+			{ .rate = 1350000, .lane_count = 2 },
+			{ .rate = 1350000, .lane_count = 4 },
+
+			{ .rate = 2000000, .lane_count = 1 },
+			{ .rate = 2000000, .lane_count = 2 },
+			{ .rate = 2000000, .lane_count = 4 },
+		},
+		.size = LINK_TEST_NUM_CONFIGS(ARRAY_SIZE(standard_dp_link_rates),
+					      LINK_TEST_MAX_LANE_COUNT),
+	},
+	[INTEL_DP_LINK_CAPS_ORDER_KEY_LANE_RATE] = {
+		.entries = {
+			{ .rate = 162000,  .lane_count = 1 },
+			{ .rate = 270000,  .lane_count = 1 },
+			{ .rate = 540000,  .lane_count = 1 },
+			{ .rate = 810000,  .lane_count = 1 },
+			{ .rate = 1000000, .lane_count = 1 },
+			{ .rate = 1350000, .lane_count = 1 },
+			{ .rate = 2000000, .lane_count = 1 },
+
+			{ .rate = 162000,  .lane_count = 2 },
+			{ .rate = 270000,  .lane_count = 2 },
+			{ .rate = 540000,  .lane_count = 2 },
+			{ .rate = 810000,  .lane_count = 2 },
+			{ .rate = 1000000, .lane_count = 2 },
+			{ .rate = 1350000, .lane_count = 2 },
+			{ .rate = 2000000, .lane_count = 2 },
+
+			{ .rate = 162000,  .lane_count = 4 },
+			{ .rate = 270000,  .lane_count = 4 },
+			{ .rate = 540000,  .lane_count = 4 },
+			{ .rate = 810000,  .lane_count = 4 },
+			{ .rate = 1000000, .lane_count = 4 },
+			{ .rate = 1350000, .lane_count = 4 },
+			{ .rate = 2000000, .lane_count = 4 },
+		},
+		.size = LINK_TEST_NUM_CONFIGS(ARRAY_SIZE(standard_dp_link_rates),
+					      LINK_TEST_MAX_LANE_COUNT),
+	},
+};
+
+static bool link_configs_match(const struct intel_dp_link_config *a,
+			       const struct intel_dp_link_config *b)
+{
+	return a->rate == b->rate && a->lane_count == b->lane_count;
+}
+
+static const struct intel_dp_link_caps_order config_orders[] = {
+	{
+		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_BW,
+		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_ASC,
+	}, {
+		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_BW,
+		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
+	}, {
+		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
+		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_ASC,
+	}, {
+		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
+		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
+	}, {
+		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_LANE_RATE,
+		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_ASC,
+	}, {
+		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_LANE_RATE,
+		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
+	}
+};
+
+static const struct link_config_set *
+link_caps_config_order_key_to_set(struct kunit *test, enum intel_dp_link_caps_order_key key)
+{
+	return &standard_dp_link_configs[key];
+}
+
+/*
+ * TEST: Baseline with fixed reference table
+ * -----------------------------------------
+ * Verify the link_caps config iterator using fixed standard DP config tables.
+ */
+static void baseline_test_for_order(struct kunit *test,
+				    struct intel_dp_link_caps *link_caps,
+				    struct intel_dp_link_caps_order config_order)
+{
+	struct test_ctx *ctx = test->priv;
+	const struct link_config_set *config_set =
+		link_caps_config_order_key_to_set(test, config_order.key);
+	const struct intel_dp_link_caps_test_ops *ops = ctx->link_caps_ops;
+	struct intel_dp_link_config iter_config;
+	struct intel_dp_link_caps_iter iter;
+	int pos = 0;
+
+	ops->iter_start(&iter, link_caps, config_order, INTEL_DP_LINK_CAPS_FILTER_ALL);
+	for_each_dp_link_config(&iter, &iter_config) {
+		int idx = pos;
+
+		if (config_order.dir == INTEL_DP_LINK_CAPS_ORDER_DIR_DESC)
+			idx = config_set->size - idx - 1;
+
+		KUNIT_EXPECT_TRUE(test, link_configs_match(&iter_config,
+							   &config_set->entries[idx]));
+
+		pos++;
+	}
+	ops->iter_end(&iter);
+}
+
+static void intel_dp_link_caps_test_baseline(struct kunit *test)
+{
+	struct test_ctx *ctx = test->priv;
+	struct intel_dp_link_caps *link_caps = ctx->dev.dig_port.dp.link.caps;
+	const struct intel_dp_link_caps_test_ops *ops =
+		ctx->link_caps_ops;
+	int i;
+
+	ops->update(link_caps,
+		    standard_dp_link_rates, LINK_TEST_NUM_STANDARD_RATES,
+		    LINK_TEST_MAX_LANE_COUNT,
+		    true);
+
+	for (i = 0; i < ARRAY_SIZE(config_orders); i++)
+		baseline_test_for_order(test, link_caps, config_orders[i]);
+}
+
 static struct kunit_case intel_dp_link_test_cases[] = {
+	KUNIT_CASE(intel_dp_link_caps_test_baseline),
+
 	{}
 };
 
-- 
2.49.1

