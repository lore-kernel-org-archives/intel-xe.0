Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8FCC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 16:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6366110F0D2;
	Thu, 21 Mar 2024 16:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dv0vo6vv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D3A10F163
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711039947; x=1742575947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I4mh/xHDZUR2w2oD2ZNfM1ncFWhJnR/kla5iKk2ihCc=;
 b=Dv0vo6vvxhoU757pkcirHb6l2JI7ma90rbzRu3DeMPQYVKdaQeW0mRMj
 eVBa2DAlE3FG7W3ifDmxxjnCZ09az/RY4yo2sO4PTSmioJnA8W+HSVla4
 z4rgCsIwUF0IkdEm4kA+ddynpvtp9/tVk7BwRf+zzzkSSiyJ4AUJ4Nanf
 8xruMKAz9Qxziv5b4ZmwH9+Vi2p+m/l+izjQCV7NUqhlgBbo24q6PsgVs
 SntfSil0m3teR6ps0gPBeY/XcMK25OuEQMkH69TemL3VSn3O2d88snojY
 vk6jW4VpxU5veU3AuvOWMm1LMTddZ8X3ZfM9mWaDDUhyvn0TlXeqw3xPP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9833053"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9833053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 09:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19222434"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 09:52:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 09:52:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 09:52:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 09:52:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 09:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKiHLIDdtdjnBgiUqFl7gDzsJsBDC1cLcKpa/tAM9l5UyN+SydSfCfu3T1YPo3DvPc7kdKwT7RXx1t0B8sj/xUhNbrzi3r6Ekxdt/wHBXCjV1GEyLjMBBW7O+DWH4i6+8Ouy4Wk/U3Ee3tnBDQeSrqCWPcXg6KLdL25KEhxNaVE7FNx1CYcxIplHqn5M91xee0prpjZScrlHZZXw3mcJLTYaBcjqVsjn/95WX+LkIezGFloCabtOlnngn7sQiYQoWxp4BayDax1YKX1WkLh+cH/7DMhmikxlpYUac74WYxsNF31FzjswI+uN6qZJGzak/mz2tZCK9muAVRsr6dH8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3EsxJDfn/s/oEySGGAbcwSEggDhDBMIHqSWug88KsQ=;
 b=Hl4BiSMelqSUP7M/pcII7O13ZsAnt+kYn+z4NKUdPDnbMXnY/XkuJ5oIyTb/gyabhUKRgKz/0l4djKvPpZ6seAWZvBT74mNpRCvjk9wlPvt4OqbZKko9lqablnomTdXW6kKKzidKUBgJ9Kendx4mZBEu5e801Py/loFXUxXDH49NcaPsoYAiSmiYxxwkNWw4w4NScydtUQLCqb9dduqv40UzgceWqI3d6HOtyRYOlQUuCU47aiYKJ6beZEacyPdMIM6B4pTfEKzW0sBWq7SCo+58MzcBbiJ+7J4TUs9MGueJdcKDT6n+qbIimmZqqvgcT6W+Nl37xnpesMYrv8zSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 16:52:23 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::a223:8cc3:d822:d2c4]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::a223:8cc3:d822:d2c4%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 16:52:23 +0000
Date: Thu, 21 Mar 2024 09:52:21 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Use FIELD_PREP for lrc descriptor
Message-ID: <ZfxlxXA4D93tHmpl@nvishwa1-DESK>
References: <20240321054715.10440-1-niranjana.vishwanathapura@intel.com>
 <qgx6ibhvazmqh3ymgi4l55hixs6tyx4yut6aoozu2erhkkq3or@y4yvbsupmu6x>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <qgx6ibhvazmqh3ymgi4l55hixs6tyx4yut6aoozu2erhkkq3or@y4yvbsupmu6x>
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a93385-da0b-4629-ec9f-08dc49c747be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /V1SsrMMGMNAo1K8dscsFYE/+MMTyMNBxpqpW1cKolVfS5yfRnra2WJxg8Xv0SPKWF2s6DD/MNGxOESD4H+x8gZ9CF88Wtwp4jpiafs7746UqhtEUbeqFdxKQh8zmy64cVgTm4nvm8gjsBHXoGjBB+TWgaEoV4GNMzVUbr9Vp9iZzrwBrxMglP5y89ytbbp71MesiBStQLH/018jV0kxvJp+nEJPBWObdDP/HP1RrepX3LKK0by3Fpd0WWxlyBmAAzoJjGKT9c5Js8bm3L8kTAgQVqeMWotK586ze25UAheGiS5ZPwUDmKbuIcsDemFQuDwIoTaX8YVmoJ1Vd+yBihNkCAmXNtf1HzlW7ndoKoDIERs4/4AdKRQP5YJk6v+wNgjIteMvSLyPDxSnj7IeiVdvcjMajAxmmomq/9DLPugR+iz+r0hXbMleQWuRyw3/ZEE2PFrTX/l6YQ6z94OUe5TykHR4dhgTtiENMC3+7qq16tTVV6LXADp3adERAIzoZ7f8KveV6ipg0dBwo0b+b9fsYazmEbBOz4kA4Zcv5vshqoKoqE6lxPHv5Nu2XPV5Tk5/wis9SctvVRED+a3wt0bNuyP45jN5vGklbp2vMAEP9zzopV2IwttGy8hiwlrz8aYJS2eJzynEowcmDIdnxeoi67+KEtznXeTM5DhTlZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZjTqcn6qu7IKxBmTApVxbqwr2YQVUcdOX5iZoK9jVnf6MdLUkbhfZ4Z9IbHL?=
 =?us-ascii?Q?r0oMcIk79K+S8Jdbk0YtPxNOzkXyX1hkrK1mkT8o41OvaKE6x8JrHAyhwCIL?=
 =?us-ascii?Q?dtolb4n6tZSLecaf2vZDxtM5SKfbAPhAaEwMumrJ/4uKBaBFED0QZAfM04k6?=
 =?us-ascii?Q?ia74PjXh0JUos2xIYbCo9qU729c0EL4foQwlOkZxVrxrJ4DH8a3Uh/Ely2Yi?=
 =?us-ascii?Q?rLZQQJ4AZ7iOlEMgwSYUGFz6J1YoFqBt4OxdHD+oX9JFVmlGUvLxyWV9AeTD?=
 =?us-ascii?Q?I3njSpqXvmpvOxhuMfNjYJ1y0ZGZI6oUYDpcbspoKn8tKDhLE68APF3xpcRx?=
 =?us-ascii?Q?A2totQ2kKOMgeTL2iFzrEUdh2E9hsMgvlP+7j/VCs1fZhNpyiKYR5EeR8RGq?=
 =?us-ascii?Q?c67bWszBnc7FqM6w2eMPGRP7XqXOBnFW6d5WblgabfDKqy1qLIZbggXQh0FA?=
 =?us-ascii?Q?Z7dtDkmQ8UzzakhQKrjo919jxltQza+J4QgxWXkP0JM4T6p2WJcrrpn/pZOW?=
 =?us-ascii?Q?YTUpspuIJPKlEAVmM68qLblrP7TjH/OrfCzpQNZQBtuZYu0eqU9tKvjKRwjD?=
 =?us-ascii?Q?SCgnZ7Q/tv3ISOsjjLTl1kxAJuS1mriDVxmHKInx3KkjKzVbu1ILXRT8BYqu?=
 =?us-ascii?Q?JuhK2xqlipQpTYFAhcf1VCTLxtLNIr39ZNBllvlOFS7xcGASqdrMEQ3cYXjI?=
 =?us-ascii?Q?70FKePBQjsQSXxTvvKqszm4TNiwWB+7Iy3w3nICzKrUqdj+VB0eXGoJ8FeAC?=
 =?us-ascii?Q?sc1TDNE1RkgdRNXo06R5V1vpg9nuJV+Z1hjzivojN5SnKVanlJ4tfgDelw+m?=
 =?us-ascii?Q?LEW0o9MJ7VxIqP+v2WYCJADhVDCAfiJfPg6LbM8lQ6kXfZkQ2haT6HeUKvk/?=
 =?us-ascii?Q?V3s6ZUzXGHyHMZkO8p3hVDpKjRaUtks8iO4eWPkd8BaiRe1a8Z2Vpla/ICaU?=
 =?us-ascii?Q?c1NDA2sUNQnOorLBEKYzczwuxQamw8ThEWlxWLWPdQXgwIZZtLp/jn7FnOCg?=
 =?us-ascii?Q?rtoobxz+6MZUXhQua7YqSqwy9dR8Ee5qOnuYf9mUhOrPS7ZpTwXoujEuDEl5?=
 =?us-ascii?Q?jT+NVwfcEZ06c72wN7Q+yXHh9ImpVajIKil1g725NfAZzZ4bkZvpaUbF0thm?=
 =?us-ascii?Q?/1szqdtNn5V7P3wOrPIv+XoxSRGxa+qIRIfhv+jyPakNZnGdAHu4ej+x5KKb?=
 =?us-ascii?Q?r0g5tAVQElCapt0xymaKLgwmpJoDJk33jo564ppPe1mDDFklh9b4rfnJm5pw?=
 =?us-ascii?Q?a+/RrvILsL5mpNiqTWiSWxYX0dLrn8jAqSGj4NmUlF3iT903+NVSN5VndzDa?=
 =?us-ascii?Q?hFi1y4vAJuzVRfQY2Yuel/UdZ4KQe/1Mz83ALyFat9RXvkIerUDk2pDjN5sg?=
 =?us-ascii?Q?5RPkF0SUBMJUY/FI/Saiy7XnYZFAxA7PAHOfINQKYPZDpwY8dXPrYN4gljgG?=
 =?us-ascii?Q?qcBZiaev3lBNHEAtBSJYWs+PdNHdD9hSKGvnwWlrV5V+9Mha0qJ4xPRFtBvE?=
 =?us-ascii?Q?zabR/0E48r7rlwI/OwMwd1Jz2oj/NRZwwinwVFbklJ8SFLo1jKUsI+qzl0VU?=
 =?us-ascii?Q?B2CDbmrsc1ONB7Cv8v27ErlqMEoVeaubKQsKwly2rrRBgCqD5bYfFeEPGw/l?=
 =?us-ascii?Q?3Pp0oQn/Kx8hxpgFsErC2mo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a93385-da0b-4629-ec9f-08dc49c747be
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 16:52:23.2291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhKyHfdIXsuVBRQ25wk6n/3QyCqL+XYPQv8Qrni6i2WVGg+OoovHOmPjlex+lArCa/gjAwZ1mP5isBjcg0yfEUZjMA6CaA/cPNg4Fqw51FN0gYGlx6ix3inXDp1topa+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

On Thu, Mar 21, 2024 at 09:29:19AM -0500, Lucas De Marchi wrote:
>On Wed, Mar 20, 2024 at 10:47:15PM -0700, Niranjana Vishwanathapura wrote:
>>Use FIELD_PREP for setting lrc descriptor fields instead
>>of shifting values to fields.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_lrc.c | 20 ++++++++++----------
>>1 file changed, 10 insertions(+), 10 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 95e0f7b1ec3f..f07ee9d8b856 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -26,13 +26,13 @@
>>#include "xe_sriov.h"
>>#include "xe_vm.h"
>>
>>-#define LRC_VALID				(1 << 0)
>>-#define LRC_PRIVILEGE				(1 << 8)
>>-#define LRC_ADDRESSING_MODE_SHIFT		3
>>+#define LRC_VALID				BIT(0)
>>+#define LRC_PRIVILEGE				BIT(8)
>>+#define LRC_ADDRESSING_MODE			GENMASK(4, 3)
>>#define LRC_LEGACY_64B_CONTEXT			3
>>
>>-#define ENGINE_CLASS_SHIFT			61
>>-#define ENGINE_INSTANCE_SHIFT			48
>>+#define LRC_ENGINE_CLASS			GENMASK(63, 61)
>
>you will either need to use GENMASK_ULL() or wait us having
>GENMASK_U64() available. This will break the build in arch=i386
>

Thanks, I have reposted the patch with the fix.

Niranjana

>Lucas De Marchi
>
>>+#define LRC_ENGINE_INSTANCE			GENMASK(53, 48)
>>
>>struct xe_lrc_snapshot {
>>	struct xe_bo *lrc_bo;
>>@@ -797,19 +797,19 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>	if (xe->info.has_asid && vm)
>>		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>>
>>-	lrc->desc = LRC_VALID;
>>-	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
>>+	lrc->desc = FIELD_PREP(LRC_VALID, 1);
>>+	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
>>	/* TODO: Priority */
>>
>>	/* While this appears to have something about privileged batches or
>>	 * some such, it really just means PPGTT mode.
>>	 */
>>	if (vm)
>>-		lrc->desc |= LRC_PRIVILEGE;
>>+		lrc->desc |= FIELD_PREP(LRC_PRIVILEGE, 1);
>>
>>	if (GRAPHICS_VERx100(xe) < 1250) {
>>-		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
>>-		lrc->desc |= (u64)hwe->class << ENGINE_CLASS_SHIFT;
>>+		lrc->desc |= FIELD_PREP(LRC_ENGINE_INSTANCE, hwe->instance);
>>+		lrc->desc |= FIELD_PREP(LRC_ENGINE_CLASS, hwe->class);
>>	}
>>
>>	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>-- 
>>2.43.0
>>
