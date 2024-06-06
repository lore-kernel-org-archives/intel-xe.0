Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DE4C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 06:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7610110E848;
	Thu,  6 Jun 2024 06:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3O+cD49";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE92810E851
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 06:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717656011; x=1749192011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5EWpKF/FbfWo2J2RwO8feUWdiUKkO+5WyyCgBtoSEVM=;
 b=T3O+cD49ngCBv8atJe/dUeSMsqq0FB5repG+jj72BcJVIICJmI/AlRfP
 BGepCegDB+N9D6+IABp4fl/A5qbfq+VaAmZzIG9Nh5nrLGfbNuEDPrtpJ
 bBhcBqg48CZlBM7BCCWKVaqh+h4GpgMJkYQvk3LJfzb0J5ZDkvsQeOfzq
 9Ip+qXYC3EUa6ZHbOTu0+1KqNSvf7pLYMf5BX2snrp/P68jvykyO+TVNl
 IvfmZkvh+oHiL24DMlE6J2Z2dd0MNAFf6XZGJ+uQrW6QT3jHxOUiHl9av
 spd2x9JRXtVK6JC4NaY/jBXdbp+7M5pHZmgHgUf0PsITFba00ixMrZSGf Q==;
X-CSE-ConnectionGUID: ZzkVblPHTGKDX6osAnXShA==
X-CSE-MsgGUID: Ly8kN+uoRNqwRXaqjFYFTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14046539"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14046539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 23:40:09 -0700
X-CSE-ConnectionGUID: 8OVtuuzZSFSnYPclxiXpRg==
X-CSE-MsgGUID: b9cgHG+fQRiRut+9TT0pbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="69016451"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 23:40:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 23:40:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 23:40:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 23:40:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 23:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qqjdk423ylEgy5WQqzinEAkOAkwdofxH+go5F4RK7FfP6RkcuvOeEsEUaxpTIC0Znk9VPddQ8dGmUKEiDQIukdx19QNdGvaD+ICLNQi1M2n6yuHPPpM31evNFhbPnkVmZBHD+lmbQSLL0sWIvyV4oYfVqWSW6u+Ixrr+TRFtW5y+Fhvttmxid32te4vAWl5uVgYiMGwMBAB+uxesIcJLrWwcHUPZ43EVaiadhFqTop+JxcK4wdvGcKTlFbE2LmU23kFeno3gkkQ+jPM4y2UFQ6+IicGX/aULXdlGS79aUkzHZKyOMHTCVm10LrD94jJxn2OwPi5t/RxCml9NirpcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dna5VQC4UzVxxwQTUf78VgoJy0wWTnty6JhF4Ct7eU8=;
 b=gfJWJ1ll95kPKW7nhFv+odciYdxuBEReASWcbKq0pt9ZgZ19k4HHcI+jYKVvkJT0uLi+gEIrx489aX89cUDRcukCzm/iJzC7YSjRstdHLDaB6pyd4KDYuKtedlHVIX1yzdJCYc3gVqj8QbugBaWnVEWgPlV9wYvqqYHoO/oOr9mX/5kiubXZ8jf8HJUdLmqcfSGbPuAPFBiekmbO+hkCZRP7z5ezc4WhxB/ZqAdtzFKWE91QMPOlgFswz+14G/vwZHgj5DJ2YUv7aUFECAOcyfr9+PiTel17uXyQjfxyo3l7+x0IbPx/XEfCWF6MaQvQ5YzDkPOSdhMC8KShEqYRWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Thu, 6 Jun 2024 06:40:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 06:40:00 +0000
Date: Thu, 6 Jun 2024 01:39:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 6/6] drm/xe: Add reg read/write trace
Message-ID: <mnfj5ilnunmmtapigqwoitwmewduv57s4ztwcx4wj2ypvrmgqa@4h6rpwsubmrr>
References: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
 <20240606001814.3460974-7-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240606001814.3460974-7-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: MW4PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:303:16d::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 0191d2fd-a816-471c-acbc-08dc85f37d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O1yrsFyumZU2cYFDYjdnB9tq5ABILXYC+uC1/aMwlUz9veHHQIBKkAxtEZ0G?=
 =?us-ascii?Q?QgcHjvqsFuDSAcoQYVDpUfSnDo/tgmWAAvytsPe7v8poWRPh04khYK79MabN?=
 =?us-ascii?Q?ME00F6wPNnrisEzYHksFIlAdpQDk9OqjICEd1sBlzmESoYJtBGBuJCqcsCVw?=
 =?us-ascii?Q?gEZWOFgC/f+ycJDr54WBUwL9ZX2tURIseuAppWE8UgweXSLjNsm69s47OQ2A?=
 =?us-ascii?Q?tFfAkRTnCyOfLR0waIfc4VBpJWqXNzu/L+PeeKhe1o0GdcDtKbvT6MsUTmKD?=
 =?us-ascii?Q?/Ol9iWUc9zjG/S1nMNvPfh8WFvFgGsIpjSlidlFylbNAantSvd01q1iKVuP7?=
 =?us-ascii?Q?uaNVuSJVnHEd7YbE34n9orNq2Q2hM0U8CNW/ygRRr0qforJn4zmQje8WQM1d?=
 =?us-ascii?Q?XSt3y7ZP6A4dyGpxYMXQiMf+nnxgQOUI9prdQrmfkRGJLhkg4FtMMPpkcvDd?=
 =?us-ascii?Q?ls7IjA5tHUyMX6JmzhOcmACDl+QuSilPHsM+pME4zm9KzJjXtgMDqfmaDisu?=
 =?us-ascii?Q?AhISou4xg4d5yYk/cL3S3/h2orY4Oohjn3wGgXKOFqRMZqKXgabF8BHdd+t5?=
 =?us-ascii?Q?IdbZduTPhCr544W4nsmFO8iixMdxr9dQ5R9MrCZi8Gq8v2R7+6Jip+w1BVH3?=
 =?us-ascii?Q?g/kzNIK8QukgK6OpSDvhBuGgis9S2Bo1dXaq56nhVeJMY7qI8eHcLv4WS4zr?=
 =?us-ascii?Q?21RwAkXUcgDvzUeasCN6xygtHc38tsG8IwsJoOHIcOefYr7Niuy31h2Qb7KC?=
 =?us-ascii?Q?N/aHBcGFogkg+QobHOLB1nIpr0lqD3ro9iAN+iNBHBZ9KRmdkmr5AjPr62C+?=
 =?us-ascii?Q?O0j1oQmCkS/9ZOxIjjo8V87E2fOxgqG6Ps3bKsvVC3HCDJ58iW1oPYclOJpm?=
 =?us-ascii?Q?Ihpf4I38R64qfe3GH9hZwzmjLSHJsaFnMkcuwMW6QwfWgMg9tXCoBLzi7mUQ?=
 =?us-ascii?Q?A+QU2R2SwH8rDCgsMK4wgWC1MJr2e8Hn5lFo6G0+xvT6P+hv6hCBcqYm9Bzb?=
 =?us-ascii?Q?VarNu4Y8idQon6FR+J1p37ExgcAur5DUHEYmJ3wW9luTpAaliRX20RZTz03I?=
 =?us-ascii?Q?IZb6FtMH6fUQmqmFiiyhE89n3KcTrrO+Dk5jmrn89G/yc8xfIKX+CrlUXDms?=
 =?us-ascii?Q?45cegsIGCNgks2IazP8VNuBTu78AHcmslCOTe4thWyClnR72OdGOffYoMIy/?=
 =?us-ascii?Q?S3ONra227mAEhFSgkiy2SzHiuoyP7hmOMT1Bt6F388plG/qe5YVuyuGH2TLd?=
 =?us-ascii?Q?l3SUDr7NA3wLHjgILR/8TFKNhlfXJzMTHmuDTTEI6bIc43GEo5dIXTczkoSA?=
 =?us-ascii?Q?UbJUHnLNvEZqMkaQ73b1r531?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lJCHhuOXhuKVzmRRMZvo/DbGW/8RMHufE3zD4t41yD6Q7VjfL91hS3ScaDdN?=
 =?us-ascii?Q?94SQlrIeGOF7rzWWn8axV7oWkpmm/2TMP2yq70zARBVGtMUMbztH5iNqYHrc?=
 =?us-ascii?Q?f02JD6N662Gq8pZrEK+6Rjvo7aYpd+eG5NqVR4tv5YgOGWXTzCp16GnMhyLN?=
 =?us-ascii?Q?QLWmdQH2u1jATcOVQQ1fjiiJyrYHAHACpr7oFdbFBHg9f1qLAMaPzbSrdi7p?=
 =?us-ascii?Q?0+mlZZ+1WJcYSrtB5i92tTDUtpUbxpVcQQNZm3fm1DyHUNP9322jEmNqbSMK?=
 =?us-ascii?Q?6k5OQ0i787+H/csaorLCpkOR5oE9PWa4e6iXkIOEfUJpGMnVI+T4k5OTgvWg?=
 =?us-ascii?Q?0L84AP+xqNHvrKhv+dfoi/kfL9fjT4fuz+OJd3dtBBkYAdaSHSCXi9uDttNy?=
 =?us-ascii?Q?NezVIzXM6r0tSTUOKDK2Llj2SoRncN+LY1Qw2S3UEeCkua03ACbUm8x55eXb?=
 =?us-ascii?Q?OGlocST7uzjDJO019HxXoPdOGnayR4BfVkdrl4W5b+Kxrf9HU3GNfwU+q9U+?=
 =?us-ascii?Q?j7UrtGpROdhO4KU7LbSG5ySJ3xiD1DDtpvQ+Lv41kWy3dqnskPj2VUlq7GgR?=
 =?us-ascii?Q?tVtj17SLgEuDy2koVmMALuGg4Yys3cehWLhAQKVHvs2R1zqO+zUINfNeK2M2?=
 =?us-ascii?Q?vzJK25U5aI1FCEHfz9Tydo+V21Y0icxO/yA1czRx5lb+bgcqBP05EWTtQ12R?=
 =?us-ascii?Q?fMV5K6fOcDW2smOEs1v2Gv0Wz1271C5G3aGJ0cjpvT/rXo156IZByMa9bb78?=
 =?us-ascii?Q?Rp7xMzgZPntZFQUdbsG2WFuLwb+lPRqgfFc4G95dmXsSDz2oQSCp5/P/6vOk?=
 =?us-ascii?Q?sUw4/tyQNJQCGPV+yn100Jd/GCie3k+aLUPlTGlBww+Q0mLW3tBxKeeGcZ/N?=
 =?us-ascii?Q?rgw0TuEcqCbHa+OiM4dce7e1zmvXKTNPIr0c34BuaPHvsk2qUwapwou4G/ha?=
 =?us-ascii?Q?EwRDM6cqcDDwPriUgFaZxyABygYyLfnp/S5b1PyH+mL5j6+vij6BcAvkIl4O?=
 =?us-ascii?Q?lTmxMtFikhq0poXkhHemtMAUC0wVhlDrq89wfwKA0piQ/cdGAYm9GLGezEhY?=
 =?us-ascii?Q?4YciZ3CLdzfwgzUHVpfGnfpmN5YMhkgq0INrjgMUnxKxfgGyjHNG4RalFKsk?=
 =?us-ascii?Q?Zw3+R2TOw8oUqDAH2ZTibdgy145r7+D4mu0dPG4t90FwM2ei7fArrAu8tlTa?=
 =?us-ascii?Q?k+Tzwk/rf3EJ3iXCIRGNhYAG0L+cGeGIRd0RfbFiU5XWB8sCBPIrUhq1ZIZ3?=
 =?us-ascii?Q?j7/CZNx8GMG26bz3TDTYrbNNJrzRIR3umkHN5Wj2RfPCGfDfGgEzmJCl28cG?=
 =?us-ascii?Q?1lMmuSm3uWEAWL7+cIOXpNczXGHoFCma538o03Gf0lDnDcdHBmTtyW0vmY+h?=
 =?us-ascii?Q?F2m07JVDm7YkcMoHd0iQkU2QP470IXJW5Dkoh0UQo+5hZb3kqX+s7KEDY1fA?=
 =?us-ascii?Q?iYwDfmRNMqtJEISZiYPM/HbzPGgEWpJa2zYC+cYCoKQUY27VvjX7M8y19mC+?=
 =?us-ascii?Q?XVGYe5sd7lS2s+lvQ0nD7NfRdseop60OArks3O+9F2wbuIbXnY7cBpPYU+lG?=
 =?us-ascii?Q?UinGUeroqAX1Hf6ESp32r0eeCn4qSD43cBXqo/P8oumI/Uum2GAggcdNlOGX?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0191d2fd-a816-471c-acbc-08dc85f37d0a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 06:40:00.3534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUCu9dYumgWPALZbvnhupcko/PbLAqTVoFGgH4Dpe9p++6Q/uw0vyor2kplJj4G44K/ReO7FODyBSjHAaGP7fkDok61ozzyAEfSrpZUTsEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
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

On Wed, Jun 05, 2024 at 05:18:14PM GMT, Radhakrishna Sripada wrote:
>This will help debug register read/writes and provides
>a way to trace all the mmio transactions.
>
>v2: Fix kunit error
>v3: Print devid to help in multi-gpu setup
>v3: rebase and use variable sized variant to display
>    dev name(Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c  | 24 ++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_trace.h | 28 ++++++++++++++++++++++++++++
> 2 files changed, 48 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 7962eeb9adb7..feba35ad6a3e 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -21,6 +21,8 @@
> #include "xe_gt_sriov_vf.h"
> #include "xe_macros.h"
> #include "xe_sriov.h"
>+#include "xe_tile.h"
>+#include "xe_trace.h"
>
> static void tiles_fini(void *arg)
> {
>@@ -124,16 +126,24 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>+	u8 val;
>
>-	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>+	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>+	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>+
>+	return val;
> }
>
> u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>+	u16 val;
>+
>+	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>+	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>
>-	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>+	return val;
> }
>
> void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>@@ -141,6 +151,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>
>+	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
> 	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> }
>
>@@ -148,11 +159,16 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>+	u32 val;
>
> 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>-		return xe_gt_sriov_vf_read32(gt, reg);
>+		val = xe_gt_sriov_vf_read32(gt, reg);
>+	else
>+		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>+
>+	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>
>-	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>+	return val;
> }
>
> u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index a22db52e88e3..be0ba5104e58 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -347,6 +347,34 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
> 	     TP_ARGS(fence)
> );
>
>+TRACE_EVENT(xe_reg_rw,
>+	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
>+
>+	TP_ARGS(gt, write, reg, val, len),
>+
>+	TP_STRUCT__entry(
>+		__string(dev, __dev_name_gt(gt))
>+		__field(u64, val)
>+		__field(u32, reg)
>+		__field(u16, write)
>+		__field(u16, len)
>+		),
>+
>+	TP_fast_assign(
>+		__assign_str(dev, __dev_name_gt(gt));

after commit 2c92ca849fcc6ee7d0c358e9959abc9f58661aea, __assign_str()
has only 1 param.

Lucas De Marchi
