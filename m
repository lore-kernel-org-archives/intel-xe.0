Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA43C3ABC9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 03:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE51310E4D2;
	Tue, 13 May 2025 03:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuj4AYfy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFB210E4D2
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 03:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747108201; x=1778644201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HMqeAVw09FfGcoFhrdR00qRYdsHpg9SMm3BzJhBm4vg=;
 b=iuj4AYfy9Op1CraDHYBZj50SUfydQJ246E+zrK6NwbaN1HhP2Pe4ofoX
 Sic2N/7TAqqSm57vsAXe8P/+0g5ciJora+QOC8+PZhVU5N2x0WPZsYZym
 jg348oTnf4hU/HytZMd0gO3llq0BTIkWCmoybQ+RR2yJlz5Ngbe93lmER
 iAvzS4VJq2ks7KraP7swNOYBhLIoaUXmYHQTxfKfhgQxnmARMyDiAyWhh
 PU6qIGjqzwMidojlszT5Z5U8OVyKFGa4u/NcF11VzuPNCU7A1WWo2oIOA
 5oowNAx2LNcreQUUSGCAKs6kGf2ZMjcujbnpD/sUfpk8V+Firs64CgDGB w==;
X-CSE-ConnectionGUID: fGR0TckRTWyfHILOoOjkSA==
X-CSE-MsgGUID: Hh5nZK0rTv2jTkZJ7TQl/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49055529"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="49055529"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:50:00 -0700
X-CSE-ConnectionGUID: TSulY27mRfSoE3qPPBqTxA==
X-CSE-MsgGUID: zztPadL4RUiTp3IPhC1WtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137417819"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:50:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 20:49:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 20:49:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 20:49:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND6AYa4IHqymP8MYBUX8nA/Ze4GsnF7yi3Uqkl+rb3wFEVmYYJas2pSTh6UvAH+7l0HjaXonxzM8BEt1QVYo2DCajBHTpYGUIPlMfclrjN6YSoKw9iEbs9p1RRvb3Ks0/1KGGmp41PjR6Q+TL3D5Jhf79jBAbIzrE+eX1gmub42l1FrxXgyHVdpM+M5I6wcHNoWq+RtMUqCAGynDRp9Zab4yVKbT/NDMabN5Gdk7Pt8VcsNlmegEUDkTJjJBt9tSvLRePQVNifSarlPyP6WD44k9HsUuWyQmDRivQNLVMrgvST4SPrs08a67EyzlsQ9zO1vXlKDH3mNBrJf1C4ktrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUr23TEwB9DZpVacRsHjRPs4gMHtz1wPeuE/S2vJPfY=;
 b=dYcZR+AJYVv6YNogqAiBX9XkH2SBAlEJYNPT06gEwVZDg7J34c4C3/LMTeUmhD0k23o+wtT99Pgrdvg9pNOBofuqwBK5LH5+QpGHTbYPGd2HNVcR2MZeFTesVw2E0FkjD83BB0P0PLF4OU+HqQG9zdrqVY9HfWTF6UVSISxNQOiyTb+vk0Uk2UlCb9w/OE9NEp+8KUtUIiemQuv18yzkyUz3wFMRVdJE1P90+RHDMc9lwv2NRipx1Ac/YSv+rKK9u+DkgGmpmBHsuB7LV5JMwJEP1UPMmXj1Hth5pp3FqIm4fPW7lmNqjmp5IcXSZ6ntjx3n2NPcD2LZ0+8kTCM0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Tue, 13 May
 2025 03:49:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Tue, 13 May 2025
 03:49:43 +0000
Date: Mon, 12 May 2025 22:49:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <nicholas.johnstone@intel.com>,
 <david.e.box@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/vsec: Allow for kernel context access
Message-ID: <zytknjhoazflwqm23zjuf7akzgjsrmuys3lqemv2btuuj3xayc@vlqcscpztg2f>
References: <20250512182012.181644-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250512182012.181644-1-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BYAPR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:40::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f99495-fd04-4f5e-3a6d-08dd91d13244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xATQLiUDjKCwcEv1jPvMxjHcLY1ebPvx3ZIKRmZiL4sOFC/mjL4jX61Vj2Hy?=
 =?us-ascii?Q?xeLQUFXHSx72pdPW7db8/tw0lrZp5acWkJuR1NJueZJITJAOTqcguIBQsdS5?=
 =?us-ascii?Q?pn5dLTd4WnlwP4e6mml9Vrviz2/raC4493fAGIfdWOg8UK7haAUttkFo38P2?=
 =?us-ascii?Q?EIrB+R01b3aFFjjYq79R4V7NoJNeCTSiZAFCt1Rt8nXSlNjMK0ujuCfl3czj?=
 =?us-ascii?Q?3jgSgsuqL+0KwTzsvQfL63du1USre58tZtu+LkUVOgS6G8pEFcW+k30kkCAE?=
 =?us-ascii?Q?4g7f4QPSq/1s79UgdCjZjAEb/58+ZVQEfm4eV4pzawj8Vt2acnoi0KNygDbb?=
 =?us-ascii?Q?UHaQiQCkSlhkQRNgneTOmrd4al4jMJxvLNduCu4iHr0XIXVBctPVaqb7lA7W?=
 =?us-ascii?Q?khfflwdl4yTSKBI5kVk5QEyQ21hGCOA3KlZtQvHansE8ZsbywUgRWcLF7ih0?=
 =?us-ascii?Q?um4gPCzh9+h/jL5L2LbUEv0WDLQyi02gtLErRJRBydqq4GgyH/W0F/th8oE5?=
 =?us-ascii?Q?Z9EZkqWa6BXzE1ePw/bvd27uXMTRBzy2N26BOgkRYwdqAuk/GNahrvzgxaKx?=
 =?us-ascii?Q?s7AImCThKnd9OE2NqlHz9ocMXDG2ndPv6y8QhGze7hF+AnmwUoXDxAHYbyiW?=
 =?us-ascii?Q?2PyW8E2BvNQw5zVNkm+h+boy/1dPL86zZTgSuDw+e8M44PVindK0cSg/UGW9?=
 =?us-ascii?Q?Rlx6nbtBC2XV2Z8XAxFCE3M0vEk6JN5ji1oWXC7mWB6+yfRaCVFgNnQAMR3B?=
 =?us-ascii?Q?Dgej6MBshzvVOkRDBDLjzn6nK4/2BBMv3UNi+k+xK6u3V+v8druzSS9TOzWv?=
 =?us-ascii?Q?NdPH7k5N8oBtuXJS+mmGUBjg+Q82HP3pbd004hT0hXPdHHW66Z5Lva/jgJe5?=
 =?us-ascii?Q?0dMfC6OsPRDGNgWXU9nj2L+3tn+MC0cEH4hENxVhJ9sG9Zh8OQpvVWPIVx0R?=
 =?us-ascii?Q?8Z80tQasg++TGlbPw5SfLPrqcofXWS9SWcSyLZXH6rC3ynFW4imOdVfujGun?=
 =?us-ascii?Q?MSU+BxX+VBVr0CdUaBK+nGx5u+y/uDHPhC4HGun3DMJjGqFCFKQe9KtjjFLM?=
 =?us-ascii?Q?dNCAj7fG/tgSoFEc10Phk8duFyeJXkQYKW52McBJuaeZsiDTc8BWueUR40J4?=
 =?us-ascii?Q?WdI8c7kLqjhAFBIkzrOP+dGeR97L4pbwA2avFA522GDffML52a3DxALYTjMY?=
 =?us-ascii?Q?hUVW9QQ/6e4VFSxoB8b6pDxyHQlGhiLte6keW4jOEhODbRmxkkiQXDWVBXoH?=
 =?us-ascii?Q?KCKhk0ZsC6YMOVau6tb2B2lNwB/LsxS5wXB592F4Mr9kYFa2lcx37IbZ87j/?=
 =?us-ascii?Q?dPZZCDMLHOx/qL5rS/QePNGMrfKB3LhWnEoA+L8G+FS9leFlvDIkuIpNMQKb?=
 =?us-ascii?Q?APG/lOJgt1vA2vGXlknj1Bf591alyUgEnueXnsQHUvt7qQLZant6se9OCWVO?=
 =?us-ascii?Q?2UCoH3EdNRo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2xK73EdEV3MIFWPkGHd+GoCnlt7rJm6p5byBMuMckJ7aI7k4mrUVeM5BcwTo?=
 =?us-ascii?Q?ZalJLhladOwj9JENfBflTQI7EU7xbafd+avfUKDk4wKjLJq/Rc1NzB9spm2B?=
 =?us-ascii?Q?UgnIvRF8sP+2nRQPnBvtvzhIFN/A5RhHuyfDYrUk9NkYBrOmadamwPbGjY9a?=
 =?us-ascii?Q?Hj+HELvypthKIU8WbpnJZpMCg7c3d71rR1weo/DttWLH+WQgEWpXHjI3uQov?=
 =?us-ascii?Q?b0kBbeygy1LC0ci7JdV+4U8Me6MBpVoB5pUdy6cTssp5E78mpBSc44jFtMSp?=
 =?us-ascii?Q?MPt0WCS6r0TAZl1qLxZC2F9a8ouixCKsHFmVi913KLx5GCGYSa8mJEJ1uJT6?=
 =?us-ascii?Q?e0t/p+DDMHdtdaOWDP4XiKbO6ICKjd0ORdVsN76LxJjEifPAOslDx7EYNtM3?=
 =?us-ascii?Q?KUbiAgW4xTv86douMKsic0rykxkaGRIyMuqexA5XFX2Fs4hO94ZBDkV6ralb?=
 =?us-ascii?Q?krF/4BFqTmFnkJ5Foy2nM3zMppUDyON3uErmlBgcYJppOzEbbgRk/H+qQ1oK?=
 =?us-ascii?Q?ugFNiKBgvgAyENLwUdpnIGkNTxP93Eap2TNk3sJx5VZ5ve1/lGrGf2363Ov4?=
 =?us-ascii?Q?9Fy5SYthkdEDpl+9UwVnqPm6perXRUuBL2JRN0RP2YNU6KDEDW5ubBXxDU4Y?=
 =?us-ascii?Q?82Z3ZOWX3j2SEE4jEVgWIbTKqmiYmVufPmbyaCnPsgtOS8gWW7BdH0sjC1T7?=
 =?us-ascii?Q?F9wLTxLjVotFR8iA9BnL/hywuNwDyaWxPEzeodPx83syX3M1v1YyW0txonU7?=
 =?us-ascii?Q?cTG1UEf5aPxzuw8VmK2xkHXzTcxM/fmiKAav48XpOkAnaoFRofPKpirQvYB/?=
 =?us-ascii?Q?+L2D042SOxq7UgtiZSFvKFW85edOINz7lbyo71iEE7ulgF2WfxQVc8nAidWq?=
 =?us-ascii?Q?b1sJ8fx2frcy/W1Vm5yHhvKbV8ESgOqaau1kBEfhKyiMzYid9noQuzE+jpYl?=
 =?us-ascii?Q?1CLvcpdo3v+KsOb3Y8GVOxBJK40Q5MXeDz8t8Lt6P+55tSjGdbQ824zMbo5c?=
 =?us-ascii?Q?pfmfYXiBZoMniBOfKup4o/5Ty7LqhRfLyrNl/ngOSTrJClMkIjSPTn6BfN+H?=
 =?us-ascii?Q?KQpnbJjUkujthQVg8xGqq08UU77brUlJNJiZ4CDO2EnsAlqcBrpr+bXynEeQ?=
 =?us-ascii?Q?aC4XPYM5K5yRI/FqSPJHkfHTz+5EbfskIHHWwLnqqSC7BQ2hzrzaXX6tuTjy?=
 =?us-ascii?Q?a0xT5l9f/Jguna7W8RiynBgSLcn5JuOgq69SE+5WBx+5ojkI7uLm5sBuqaaW?=
 =?us-ascii?Q?FIk0c/ikdlCMDmAshJonrnSMlOIly1nFMU89dijbMDiy1kED94YBBuMMaedP?=
 =?us-ascii?Q?NkbwxQdmgXOfuquBKpmaI3BcdpdL0fOQjE5gPkR+c/55OwUZGaKU1nyJSaoV?=
 =?us-ascii?Q?kWIOq0125qVhxZgftZCBDA6ZIfudItH5c4femEhUg8nGahQlNxInOMPLyu1d?=
 =?us-ascii?Q?clLNygzoKm87g38UssaX6fJyBhjsW+U7+EDnX7Gm6QmwzRMSlZ1eTZEMd3SN?=
 =?us-ascii?Q?KNHSr0AF2/tfBruzQ0Fe7bpSUKfPNlr1FkLPz1CkiQ3UTL5ED9uIdllZz5PY?=
 =?us-ascii?Q?6iFBbPzGt8iW8pfAW+Wc7cNKnf7tj4zieP3vQy7MClleE+OHWpeMLWnRlvL3?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f99495-fd04-4f5e-3a6d-08dd91d13244
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 03:49:43.5851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5moDvGdRb3nTdjnDB0uFpNtN2Tn5Hywco1klsNNOIgYMc7XEMhBBqkAtX71L1dwsZddg41TRph0eWjHWEjUeUAUV1VqWJxLKCkYeL1nk1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
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

On Mon, May 12, 2025 at 02:18:35PM -0400, Michael J. Ruhl wrote:
>The PMT driver API allows kernel level access to device
>data.  Because of this, the mutex lock use by the Xe copy

I already said twice this doesn't make any sense. Please stop sending
new versions if you can't justify it by showing the exact caller.
Here you'd actually introduce a bug with this patch.

>callback function turns out to be a poor choice.
>
>Since the context of the caller can not be known, change
>the mutex to a raw_spinlock to account for all use cases.

if you don't know the context you don't know what lock to use. There
isn't a magic lock that you should use for unknown contexts.

>
>Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
>v2: checkpatch fix, update email address
>v3: use raw_spinlock
>
>drivers/gpu/drm/xe/xe_device.c       | 5 ++---
> drivers/gpu/drm/xe/xe_device_types.h | 2 +-
> drivers/gpu/drm/xe/xe_vsec.c         | 4 ++--
> 3 files changed, 5 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 399ae5f40321..0caa77d24f44 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -8,6 +8,7 @@
> #include <linux/aperture.h>
> #include <linux/delay.h>
> #include <linux/fault-inject.h>
>+#include <linux/spinlock.h>
> #include <linux/units.h>
>
> #include <drm/drm_atomic_helper.h>
>@@ -486,9 +487,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 		goto err;
> 	}
>
>-	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>-	if (err)
>-		goto err;
>+	raw_spin_lock_init(&xe->pmt.lock);
>
> 	err = xe_display_create(xe);
> 	if (WARN_ON(err))
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 06c65dace026..8f680a89ddb7 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -527,7 +527,7 @@ struct xe_device {
> 	/** @pmt: Support the PMT driver callback interface */
> 	struct {
> 		/** @pmt.lock: protect access for telemetry data */
>-		struct mutex lock;
>+		raw_spinlock_t lock;
> 	} pmt;
>
> 	/**
>diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>index b378848d3b7b..3941e1760ea3 100644
>--- a/drivers/gpu/drm/xe/xe_vsec.c
>+++ b/drivers/gpu/drm/xe/xe_vsec.c
>@@ -6,7 +6,7 @@
> #include <linux/errno.h>
> #include <linux/intel_vsec.h>
> #include <linux/module.h>
>-#include <linux/mutex.h>
>+#include <linux/spinlock.h>
> #include <linux/pci.h>
> #include <linux/types.h>
>
>@@ -164,7 +164,7 @@ static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t u
>
> 	telem_addr += offset + user_offset;
>
>-	guard(mutex)(&xe->pmt.lock);
>+	guard(raw_spinlock)(&xe->pmt.lock);

you lock a raw_spinlock here,

>
> 	/* indicate that we are not at an appropriate power level */
> 	if (!xe_pm_runtime_get_if_active(xe))

then you check if it's active. That doesn't work. Down that code path it
does:

	spin_lock_irqsave(&dev->power.lock, flags);

If it ain't broken don't fix it. If it's broken show the breakage. The
fix may be in the caller or something in between.

Lucas De Marchi
