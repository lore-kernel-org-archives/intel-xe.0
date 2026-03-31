Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A29E1061B2F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 03:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6093A10E85A;
	Tue, 31 Mar 2026 03:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7SPIuUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3029410E854
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 03:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774927797; x=1806463797;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=moLUYfon8gkRaHtzD1khh5ki0Riw7ias/PXPXKMwapw=;
 b=f7SPIuUxvmLM+lqyj/qY81mCfCtaWonq5TPWs/8K6eBVG8+/vj+E0DkS
 6IvhBLDxngrpoOSXSBN5KgWU7EcEGM13A5ItrfUHFOQMvzV7cqiWVHVlN
 Sb9BXl+6BwrXv0FjHNloFO9MHdrc46Uz7UTkRc+7ojGsYKHoXeaO3ycqt
 0oxcdg2As8cMNIaWr3gxFSJfsVytsvIJTGxmF7QUTEDOtDQuS5mVgNwwl
 nLpvU8KsjvXmdV7+PhTImjFC7swOzLirsvL30rfokelxw0jEOM1I4f02F
 8uYOerAMNAG6KGFalGvL9CKzd6j7CpUFz2le6KnsSDBJdkAchHQl01OEq g==;
X-CSE-ConnectionGUID: O1ZHkscZSM+XP+BAIGJS7g==
X-CSE-MsgGUID: F3Jah+qLSPCOLx9ed/6yCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75897749"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="75897749"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 20:29:55 -0700
X-CSE-ConnectionGUID: b8svSmqLTSOrihlGyWSfig==
X-CSE-MsgGUID: 0UY2vdN7S5yhougEeHmsvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="249461609"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 20:29:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 20:29:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 20:29:54 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 20:29:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rnld8ux9jteuhjjhlZUxqDmIRhBidb/1utK49vI3sL4Bp2/kvnDBpU061biq3aMG2O0Igy46FHpf5yaA0+Kjv3miju6ub3ezdX7GqemxNgkyjDwx15KFwAfswL0/cVrtbbsFCADKb7QXP/BtuoJiPKrNUGlxZr6inPpvBIIdgv8+wh/Y5yD5N8JMGAo59y1kQUPPa5xJeoQdecmCnLVnZMLnMezw6588Xn8s1PRzrZdxDDlu6XawrRYy7mB826LSDJQxjv8Ukg51IK61iq6GY+xmiqyFGzBEq4ZH+0Sz7JaMQRrVUgeZSLjKGD8tqhmNfWqmNiGHcwpoKFAbkefjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjBShPe0sSw1Ps4OM5500uz/1ai8MjcmGLpBBU65ROg=;
 b=P83KdVH+E4WZXlLVsoqePnmZyJWrVlDXaMGP7b276ZJ8A48I12B6FjlYTV9FyiMMppmEOStkQxd1K5MNX+V3iUYav5Viu1//wZRr+SDvvNT2WhOnKrgtgPtzF5rO26KLky42oc9cKA81XseU8ISRXtKqYO5ikuEb6diXCDkgTOoo0v9GDiVTdpa8+q0mIB684+IZbVucVTk/o7mkEa54bLXxfNBCpbp57MMeq/r8zL1QAOwWcg+YqzslJAyMs9g0UqRZe9rwIiqr1Q13/vY0vXUJHvbmGCoFWUH6oPQDAdKSqojfXzMatehlnTOh/nklrEOlmA+Q5KnV20r+aTVztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Tue, 31 Mar 2026 03:29:49 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 03:29:49 +0000
Date: Mon, 30 Mar 2026 20:29:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe: improve readability of debugfs info engine
 output
Message-ID: <acs_d0N23eOVtwTI@nvishwa1-desk>
References: <20260324212348.4142888-1-x.wang@intel.com>
 <20260331002944.601231-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260331002944.601231-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: cee75a0c-74f6-45e2-42e3-08de8ed5c3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 2RHRW5dd/FeabpHoLVip5XulVMyJks/vxXUUHfmXg15eOTtKYveHLA2r4clb0GHd2wjGDuxA7cPnxYlFabvQdVy2QKQbovyKsM3W7ckbIZibpSZqw4BUzpYHzg7kQXaSBQVYyYSRdFyD8xUublmMN6mmvI7yCLDRPgT6l/hM3ZH4kGMM5/iRfrwtpieXqelzYfRhCmNvf40GvFR7K+qF8waY7Zro0fdTH0obU/KkE/FV8+78HacozJ2OcMFicpxva4pj5jhoLOY490vfLdvP14qxP3f4zP5iPCHXqa2udwaA2rxWCZxWjDVgOX4QJHNnKDBBPChfD7L5Hf3QS4UMOAa5hAsxGzNFu/UwF2/rdOeYXdxVyqNyzCVVGKCDedzP3BtZXIx99nwtTBNQZksW3LKZ+2jk5tnfqnXQy1Bj6zfCbTJUpMmYETER1GhZnvIP+cRkVEw50gfAPblnZufOUAbBn/Odap7elLnVH/n/ETkMhEovFbUsIf3VgsuCQwx8SRBp9k6YXpij8ufITogRnryD2Dc9ql5iitUfqvfunfvA7JF1vUZfTaFcNgbIOro8mvjF+7QeLWDcVlg1xiR/jXjAEUqqbUQzaSIjONumw3g5poxthIWtajoYIFE49BN7jeqpGqckK/1ylBzJpCbwXVpIID4a+a3g6SKfMTCh4LVboPVomh/dKzCthbl1UnSKyXBmH17q4GBwS7wNAOOxkG2hheOJMnwLZk7w9Wbsp/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lsSkQMPjGS1wBKeAKa8MZdEfBAEbn1HM5cUpdrE8RxZFObkoL9cU+j1j2kdx?=
 =?us-ascii?Q?nW+RlGlisn15zsiNCRmQZWgDC8xEw3B+U4rH1yk353rESWZ0uDkdd3gYqXOz?=
 =?us-ascii?Q?3o75+CqDRVxSoqPHZPgfKvM6+7ucd2wNL4kTIKJhbxnfO9yKK2ZuPqvyBRYj?=
 =?us-ascii?Q?eAWnaRK/5NUUtfyCkXCJeMGHRRtvPAtO7DNz1K15jQ/3HlzO7ZJRBya4SQqD?=
 =?us-ascii?Q?+lhoRzMo/GCJo0QnB+QIdic/SLxm+/tYhTJC+26oocwF+cm3VsfBSURo2xIz?=
 =?us-ascii?Q?qzFGt79EPImFcAA5ZRc3pi8B6QMEpMyTEIKH1/KfFJhqEpOvuCC+iehChZcr?=
 =?us-ascii?Q?5vQ1dRIZIUgTwKdmx+Eg8tz+1JGbqatiAbVNLFDYUdV5KeX4S4dFho8PFx4d?=
 =?us-ascii?Q?RFlJVbYVu9oz2IOg/BmUOO57cxylO6DfBl6dt5z80TC4kaiLl6rOu6wzIQfH?=
 =?us-ascii?Q?fzakIfaPjsWlbv7AJ5nPSvv0cp2kBjs+BoAIpn3rmln+fYt9zUYa0KNWyITc?=
 =?us-ascii?Q?RXxRK0XIGDnvv+mSs4QkJQ8ozHZxxLjChBCf0uku0REG8lRqUIlo4poKSQNL?=
 =?us-ascii?Q?EFWTtR8pIs2qUEuWxMEgKYeEQMAFFVueuzGKr7vH0FDil+0lZbyGIwO016Nf?=
 =?us-ascii?Q?Sy4ZMlvoPgqD+vhGdy8GnEyWrPwk/1XGFZpdJ2N1uHvpZTQYpyEu8IwozYqD?=
 =?us-ascii?Q?SKi+qvaxjXjFCYxyWx1VRY2IIjzcG4AXuP2dFPhH+iag3LQ7mX7jq59f04JR?=
 =?us-ascii?Q?iG8DHIz5t3oDNf1lPGhJFBlxqFGNiePQnZA9qEWd8pZ8Pc7ul6KAiV16CQ66?=
 =?us-ascii?Q?CASBDhm93+P5Rtqa5UMlXrfAdNFMTISitq5NAJINp8/O21y3+mSe7PR+krng?=
 =?us-ascii?Q?vQxqcnFy/GGV28k5ZhL9p0L32+3TC3AdSKC4mXnhIIWYRv7UC6AMVXzCKnkU?=
 =?us-ascii?Q?9b3YBuEgD1pdgqzz/F6UJ/daVzZTSCkZMP056JFeecGrg/ArlDq7s3/d/jj5?=
 =?us-ascii?Q?6iT2UNC6SRf72YnhipTs2FYYBi5uw5C75KXtW2hZwLFbnhJCQHnanrtecx2U?=
 =?us-ascii?Q?q4NvmUoFuNxnBp9AcMFGtrDX7PGfSTBIDzFu/6GfBwLP4V2iHZ5yD5UHeiAy?=
 =?us-ascii?Q?IC657qWQmm7Ar3C8Gz2iHsez6w4rCGZRmQ73TbbGMNBAGNBVI3j+AALmsJRe?=
 =?us-ascii?Q?GuGgh69TGAdyWj6qY14OvUo241dBAtn/PnyCCbdjVCbW0V6K2mL91pqaZmdn?=
 =?us-ascii?Q?BlKcSMzCkfWzw5aCrfa8f/PrQexrOOAXNnViN9CLdMcgbFBhc9Hs50ei8GBW?=
 =?us-ascii?Q?6QgLU+VJgNculpbT3kCavCJzAAhcG715isjx72TA4VLvgyf+6KtZLh43kqsG?=
 =?us-ascii?Q?0sLqImgdYw/tJpe+cnff97vmnoax+7NThzUNTgfijvL/0a7PifKWE0oGoz55?=
 =?us-ascii?Q?0mWwKuM59uPASXKVjfPwf5gM1VVHTSWqlrxSJ/01terFLlXg/LpgJfTmxFnC?=
 =?us-ascii?Q?5arb1AF45wezvSIQ18nC5wpjtzUs1dvT9OcSGD7M2/rMUbfT8tTMytuoFLv/?=
 =?us-ascii?Q?J7V3SuTXBS6yhrVcn1mqmgAgaAx8t0i3M70m/GoudciG09GJCXVD/Cssr/bV?=
 =?us-ascii?Q?OqrLv3bOAPqJbVa7Ksnj308zkUPAYJbaWZWRCzbZHuPHrH2yccyVOAeFKPYu?=
 =?us-ascii?Q?shYGNgdBx9oua23fhBKyJ5HxEkXvYHGaIvi1+yL4mtzlYOMf4vUmJDG61+xt?=
 =?us-ascii?Q?6I5OK+62lhysAzolzTOtv0Ec932+WlT1OB3TIJKAMDcx021maYy2?=
X-Exchange-RoutingPolicyChecked: TdGeFHORRlE7lNaDEvGi+hR3qmEocuTaxAdiATQ++HPqVVU5xJkLY6DnxAD0W01PLtj8l7a29w7Zue9sxUYfLmgopusarWvuF6r4r3kgTl8n3um7jHNwDX6/k0InmyOuV/yn8zGFihldm74ewENNu/tgsT+v2RpDwOkj0bFM3Fz4rLg5MD5c6wK6dXHqGWHtTHEtStaSxRsZOi72iYpLcYGN2yBtD2M7oixa8PqyQsAchGdhuSmS4v/pLFe0+czsHnH0mOKBO+HTsdqg8diLUlA38cNapHq2MlXAwl6Q/hQQeehyK68eg4FRpP4BSrnFzs4OddJBFtbCMwTxA0yZ1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: cee75a0c-74f6-45e2-42e3-08de8ed5c3ac
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 03:29:49.7101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yD59BuwzJUGKFaHwVYiIO97qNHep2w/xeXTKwzRumZOLfiMuAq0p8nnKoZVwpq17lp7axN0nXKT4Hcf1J15pwCgidGCwA5jIUXmkXgMIWPSHngyL2EfC85vxk4KeE43W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
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

On Mon, Mar 30, 2026 at 05:29:44PM -0700, Xin Wang wrote:
>Improve the readability of the info debugfs output by replacing
>raw numeric engine masks with human-readable engine and class
>names.
>
>Also expose multi_lrc_engine_classes in the info output and print
>per-GT engine capability data in a form that is easier to inspect
>manually and simpler for userspace tests to consume.
>
>This avoids requiring userspace to duplicate kernel mask decoding
>logic when validating engine capabilities.
>
>Signed-off-by: Xin Wang <x.wang@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c | 44 ++++++++++++++++++++++++++++++---
> 1 file changed, 40 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index 844cfafe1ec7..9d1c388054e4 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -15,9 +15,11 @@
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_force_wake.h"
>+#include "xe_gt.h"
> #include "xe_gt_debugfs.h"
> #include "xe_gt_printk.h"
> #include "xe_guc_ads.h"
>+#include "xe_hw_engine.h"
> #include "xe_mmio.h"
> #include "xe_pm.h"
> #include "xe_psmi.h"
>@@ -61,6 +63,37 @@ static struct xe_device *node_to_xe(struct drm_info_node *node)
> 	return to_xe_device(node->minor->dev);
> }
>
>+static void print_engine_class_mask(struct drm_printer *p, const char *label, u8 mask)
>+{
>+	drm_printf(p, "%s", label);
>+	if (mask) {
>+		for (enum xe_engine_class ec = 0; ec < XE_ENGINE_CLASS_MAX; ec++) {

If there is one usecase, there will probably many that follow :)
Can make make this a macro 'for_each_hw_engine_class()'?

>+			if (mask & BIT(ec))
>+				drm_printf(p, " %s", xe_hw_engine_class_to_str(ec));
>+		}
>+	} else {
>+		drm_printf(p, " none");
>+	}
>+	drm_printf(p, "\n");
>+}
>+
>+static void print_engine_mask(struct drm_printer *p, const char *label,
>+			      struct xe_gt *gt, u64 mask)
>+{
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+
>+	drm_printf(p, "%s", label);
>+	if (mask) {
>+		for_each_hw_engine(hwe, gt, id)
>+			if (mask & BIT_ULL(id))
>+				drm_printf(p, " %s", hwe->name);
>+	} else {
>+		drm_printf(p, " none");
>+	}
>+	drm_printf(p, "\n");
>+}
>+
> static int info(struct seq_file *m, void *data)
> {
> 	struct xe_device *xe = node_to_xe(m->private);
>@@ -88,13 +121,16 @@ static int info(struct seq_file *m, void *data)
> 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
> 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
> 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
>+	print_engine_class_mask(&p, "multi_lrc_engine_classes", xe->info.multi_lrc_mask);

May be add this as a separate patch.

> 	for_each_gt(gt, xe, id) {
>+		char label[40];
>+
> 		drm_printf(&p, "gt%d force wake %d\n", id,
> 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
>-		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
>-			   gt->info.engine_mask);
>-		drm_printf(&p, "gt%d multi_queue_engine_class_mask 0x%x\n", id,
>-			   gt->info.multi_queue_engine_class_mask);
>+		snprintf(label, sizeof(label), "gt%d engines", id);
>+		print_engine_mask(&p, label, gt, gt->info.engine_mask);
>+		snprintf(label, sizeof(label), "gt%d multi_queue_engine_classes", id);
>+		print_engine_class_mask(&p, label, gt->info.multi_queue_engine_class_mask);

Do we need to pass the label? We can probably just print that here? I am fine with passing also.

I am bit concerned about it breaking the ABI. I did not see IGT code relying on these masks,
but it is better to check with maintainers also.

Other than these, patch looks good to me.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

> 	}
>
> 	return 0;
>-- 
>2.43.0
>
