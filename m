Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE93C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 20:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E89C10E554;
	Thu, 18 May 2023 20:45:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A4010E554
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 20:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684442713; x=1715978713;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=L8PYSQnBo5UZJ87i2gtRy8ovHYK0aFeZW8YeRK73g5I=;
 b=R9JMiXNfyhA/68QKct/xZmmx/zDvAaQvUVORyrsMybcPOrpedFl/azFx
 /MzXW7RLvRaaFhrKxRPYSp58NoDPyYnHyB6GABHTYStB0rq1jeC9o1FNg
 DzLN7m6Jd3zuCiMi6RE99vA70JLY3Qc9F233okkawRi8CzDeFHZ8Xc0nl
 cdZjDc0nJHlhTNcBJbSS/Kb9fRppPRJUrf/52JFYPF8zpm0qGXKScySku
 eSl4TDZR+VQJHBzpOLwpqzcfuoOQFfOexCHUYEqaP8pVo355PmBew5sOf
 Z8W036IeC7zXAFYv+JJLYRvJCOHhL/prJabXc4trzy/pqfU/RXyDKvteY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341620523"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="341620523"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 13:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="702266338"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="702266338"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2023 13:45:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 13:45:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 13:45:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 13:45:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 13:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A79k07VhaZQSnp9XTwbX5Sz02dvOhuiYF1EQJ+sXANYsjxIMBArv9wxWX6/12IlV2XLFJ7YHJQwg+G1P7wCHnyBQTav0SSZr+KGtAS8H9H2WdYNjxM+z6gWGL5/n2JAzGJGRqsUts5ZNMMEDgpRJtdr9YSenTVziaJxKijn9/tVYj6EavPNEalbN9G+BAuQiRBs7cTCHORKR9jDLVav0uAPB9Wywla+DExOhTZNSiyW7VhH9Dkv+XRha6+7m80Tvva4+mgaIM1qnDQIdam6J5FIfT1LrCfgkBagTE3EX3n2EKh2Q9sToq9CGKutUupikWWyX7SkCuKbwmfVoPksJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTJl/2vAkwDQbUKeKSPgi4mYbKVvzzyEctnoh4gPqDU=;
 b=XS6Awwh/sGXCmwGdCzT2FYmwvTW9N100j9eRPJmLpp8otxSEQGMu+nzo4x9CIthjj2O/M+AT/A4kjwfOTgenTnWPzoZrjkiPFqOibQwp+7FcUTybPL4ok0dy71FJQ1qe7bNrYNeNBqW3zS+EecDpLxZ4xChFi+o5KXAGQ6GLfi6j+isPt+mdZc+qkwA7W1/oTSHahc7CgqPPvSze9YRHGx/5NxMUXzDV4FnxA+WH7tb15IDvSsveb/4EjDElC6wi2SdIkjMcxv07LbKuMC+I2G/FH3NPVR5AuSWv9oZELWK1nhKXEt2h5WNEcxScj0bvqR39CoyxACbdkoTm32Jrag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 20:45:09 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 20:45:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230518201500.420190-1-gustavo.sousa@intel.com>
References: <20230518201500.420190-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 18 May 2023 17:45:04 -0300
Message-ID: <168444270443.28967.5196907904146040415@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: d258fa0e-f669-4d64-ea0a-08db57e0c512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVCBavVJdV+6OoZvePJFY8bYvL2f5iul3uvtAlCs164ReeRhVRT8MqMFvMqrJs5CfStrI12FLkrgYplsbHpmSCOIYM2Am+ASEwIDUuzjI8OLSWlK3BuxkNhDJOQQYxZVSyoNRpvOpbe3nisA1LhY1lWF6DIv8vbbEu0FtxlBWI6gd6Sli4XCZ07uKbcecJyJy3ATwqtph7zs9/ONTzB1++KNM28bv2diMMLk/ORurrGUIgAYPjaOq9oVJ1NMault5c5GG494UYNyMfeDAH2RzefCmtyutXQYgor9kQE2wYN05P3vQ73EJYFugE2l058w4/UTTg8JhsdwwHJKQ/E8Q+oYCQ1h300z/pNNJHmr+9vJ/CV8vQKdN9mS9hJLHY1JBskxGttt7nHGQUdYGx7yIjorROJgGvkwSGzenXRHmcDjCanCnKAev3m4n3VLsfNkpCIXd+T/ZZrTdU36SlqXrl4C7udQK9CUtGLSXH0mqWRFxUMHtWNexm06wznBefPkeJKUpw0gm1uZNNhHd0wbV7XfaL1miqaGq2/+Q8YgKsfViFVTIyBrVAJpyrCnIgrq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(26005)(6512007)(9686003)(6506007)(83380400001)(86362001)(38100700002)(82960400001)(186003)(33716001)(6486002)(44832011)(5660300002)(478600001)(2906002)(316002)(6916009)(8676002)(8936002)(41300700001)(66476007)(66556008)(66946007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHF4cWVad2hIak9JcGRwL0g2M3VFK3VEdHlhVUZvcEhUWmJMZHgrMzhHK2l5?=
 =?utf-8?B?bm9ML1RvVTR1N3V3RjF1SzNDS0ZWSWVrUEpNYk5hWVFPNzQvTnJWejZWTXJJ?=
 =?utf-8?B?MXhQTzRjRzV0Qy9DVmh0ajlTckl1Unp0L2pIVDRTcXhpZ3M5VkJ5a3BMNmoz?=
 =?utf-8?B?bm5JYnFKbU8wdExBRGg0L2lweC9sRTJEZ2FhS2ZIV2J2SWhoN1JXTmZxZGdy?=
 =?utf-8?B?dG1nRk9iT2llencrN254RkZSenBDTXFUR3V5WkZBb1ljTzAzekltR3E0YWlt?=
 =?utf-8?B?WmtucTNYMStzN3pyUDJLYmFhV3hERHdRYVNVbGFRVGRhTlNWQlIyVTdSYk5S?=
 =?utf-8?B?eUQ2ZEgxN1V5bnhQcjlzaEVKYmNyV2c0cGZocVdLVjB3OWFyRktMWlMzVklO?=
 =?utf-8?B?aGNWRFlJZFFoQi83SGVDbkpCaFpDbGExdVlnZC9nVXdDSllvallnSnVZT0g1?=
 =?utf-8?B?VFBRcmliN0lOR1A4TkorS05sU0Jtd0tJNVBXdEppcndlSWNHTEhUSWw2ZlJR?=
 =?utf-8?B?VjNYTXFXeVJFT2lqSEhBdFlmZWgzdkpDUm1lWHVmTEdrd0lyUXNKOEszYnkx?=
 =?utf-8?B?UC9oY0toNmxtdmRIOVRvak9kQU91RUN0RHZ5UXZibWVlM1E2Rk9XZzIvOVY4?=
 =?utf-8?B?OER4QTdCME5NYzhJcjBKalN1MEFmMXZiTVJIb1AzeGZWaHBvRkFrZkpESXEz?=
 =?utf-8?B?T0lzVzRPbEw5akZKWStYT1pudXF5N0IwNFVzdGxFdy9jSHFOejRCQUR5d0xS?=
 =?utf-8?B?WjFCS3Evd2JEeUNlOUQ5dVgwaTd6V2hZWElhRVBuNnNlaFpqaVZBODU4NmxN?=
 =?utf-8?B?ZWlQU3Q1SXZNSmZMUHJhSWJSRXVEeG91bkZya1F0aHlIUmdoQ3hIYWIrUWl0?=
 =?utf-8?B?THZ5eU9GeFczZGZqZk83WTNYNzAwcW1qdzBtNGJYRG0rWFJWd0NibUxsMU9I?=
 =?utf-8?B?MForK25YcUdHRmxwcDh0UTBUNGtSNDFaUW5pUHc5aUFkOE5TYjYwWXBodHNY?=
 =?utf-8?B?ZHVWZGlLNzBFTHVuT1h2RXRlOFpTN1BXb2VXbDkyeXp4YU9adjg5THlKSFlT?=
 =?utf-8?B?eXhzclJ4akdSb1NIYWUvcko2YkZOZnQrNjdieUIrcjlTMnJSM0FnVHRIQTFV?=
 =?utf-8?B?T2JPTmhDRGkzaHBrQ3dUWnlUUnZVZG1rakNnRnAzZ1BmRElqc0lkRVZoN216?=
 =?utf-8?B?bWp1VmZ5TEZYMVcwQUpWQlhIbndoSUpGMERCR1NXZysvclBaaW1tNnptdlJM?=
 =?utf-8?B?MGNlSmRYZHdOdGgwWFYxeTBpV1NZdUxrOGtta0cvYlFoU1NDY3JYSHlCUGxp?=
 =?utf-8?B?OUxrZVF0c2IwcVBQV3FBTUdzZEhjTVA5Y1pVTFhWYzFxbFVWUjhuQ0w5c08y?=
 =?utf-8?B?N0txbTBrNVZqS3dvaVZ0dDNPSWRjZGRoaWV6ZlR6WCsxQUdjVm9vbkJCTytH?=
 =?utf-8?B?R05ZbXIwWEIyK2x3blhkN3BuZGhNbGlDUnVPbGFvQkFkNWtTWVJETXp5YU90?=
 =?utf-8?B?d0ZUU0lUNzFRUWRUY1hobE5HamRXWllQdFBJcmVBQzJsL0N6MkgrQzdZQkZX?=
 =?utf-8?B?dHdOVHJ2d0p3YWVlNjVFaVZ1MkZRSU9SOURUNWtyRVJTeGo5bWNUbVEreW56?=
 =?utf-8?B?ZkRqWTZGMEhUTVRNMkRiMjlZQjJIcE5DMDF6dHQxcEprdi9BZTdRU1N3bjA5?=
 =?utf-8?B?ZFQyVG5hVVhFUEVzakdVQzY3WGFFaVk0NDhERGtWL2pOemRpMmZLcXViNDMv?=
 =?utf-8?B?RDYzWnNyU0FNN2pvWC9ZR1pMTnUwNkNDNlIrMG90NzRQaS9PU3pKVEthTWF0?=
 =?utf-8?B?YUxBUWxmOXNkT0s0T2dvYjJUakVPcnB2S2tGNThZVUZlYXZsd1ArV2RzYnk0?=
 =?utf-8?B?R0s2dmJ2TTdTUWtaUFdTL1Z2ai91WDQweWRYYW83OVp1RkRWRHBHcHoxK25o?=
 =?utf-8?B?aDRJRy8vaEU1aWNsTW1uWHRKYzBFZjRzK1U5dHNwVzVPVGd3V3Y0ZERkdzNh?=
 =?utf-8?B?NjBVTitlM1dpa1ppRlZRbUYyVGZCYTZaU3NVNHVLNS9JK1Z1Zk5TQUVQNkFP?=
 =?utf-8?B?REZkc2xqNWk1L29JcGRhWk0wQStVeVh1U1NMZjJJK1kyMHd4QVRzVTVhVkNl?=
 =?utf-8?B?L2lUSXp6a2crb0tNdS9tejlwdDdoekZJK3c3VktVMDE1cVR0Rlp6bFEwelJB?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d258fa0e-f669-4d64-ea0a-08db57e0c512
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 20:45:09.5136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QAyNjmEZRcvBBN3FUbGGEMF7nFpkOkkv5vbOrd8cEBZtgpNzcDK1xsNIuUSv22glE9/BE+omPfxAxjIxqMhuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fail xe_device_create() if wq
 allocation fails
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

Quoting Gustavo Sousa (2023-05-18 17:15:00-03:00)
>Let's make sure we give the driver a valid workqueue.
>
>While at it, also make sure to call destroy_workqueue() only if the
>workqueue is a valid one. That is necessary because xe_device_destroy()
>is indirectly called as part of the cleanup process of a failed
>xe_device_create().

Hm... Just realized that xe_device_destroy() is not called in this case, be=
cause
we goto err_put, which skips the call to drmm_add_action_or_reset().

And I think I have found an issue with this: shouldn't
drmm_add_action_or_reset() (or rather drmm_add_action() in this case) be th=
e
first thing we do after calling devm_drm_dev_alloc()? Otherwise, if anythin=
g
fails in and we goto err_put, no cleanup is actually done.

--
Gustavo Sousa

>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index f7f6a6a97757..775a2940c916 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -10,6 +10,7 @@
> #include <drm/drm_gem_ttm_helper.h>
> #include <drm/drm_ioctl.h>
> #include <drm/drm_managed.h>
>+#include <drm/drm_print.h>
> #include <drm/xe_drm.h>
>=20
> #include "regs/xe_regs.h"
>@@ -161,7 +162,9 @@ static void xe_device_destroy(struct drm_device *dev, =
void *dummy)
> {
>         struct xe_device *xe =3D to_xe_device(dev);
>=20
>-        destroy_workqueue(xe->ordered_wq);
>+        if (xe->ordered_wq)
>+                destroy_workqueue(xe->ordered_wq);
>+
>         ttm_device_fini(&xe->ttm);
> }
>=20
>@@ -207,6 +210,11 @@ struct xe_device *xe_device_create(struct pci_dev *pd=
ev,
>         INIT_LIST_HEAD(&xe->pinned.evicted);
>=20
>         xe->ordered_wq =3D alloc_ordered_workqueue("xe-ordered-wq", 0);
>+        if (!xe->ordered_wq) {
>+                drm_err(&xe->drm, "Failed to allocate xe-ordered-wq\n");
>+                err =3D -ENOMEM;
>+                goto err_put;
>+        }
>=20
>         err =3D xe_display_create(xe);
>         if (WARN_ON(err))
>--=20
>2.40.1
>
