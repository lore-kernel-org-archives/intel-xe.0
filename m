Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F240E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE8110E333;
	Wed, 18 Feb 2026 22:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHu5P+Lf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6F410E333
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771454391; x=1802990391;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nB4vnBhnkX4EHlJfyjcX3o/GL6Ktto0R8Gi0VW/BaU0=;
 b=XHu5P+LfXRXsXtBcycgSQCBqXTPz2ho+JeXKFLuJuFv0bwu7bxGf0V8z
 Hjk16+yFO7cN7afaSHJQPeln4Nuccrt02M3rUXWyaGC4JlHr6ZxHZmNy/
 wrbjIWrq5TaXMV9u/6Q+6wqqKJR/cIMsjOuoXjYfDJSndwesaUOtCH4eh
 unHLNIuj8f7KB9e/kZFF25i0wzlMPAEsp7Df/deSHCqHx76RVCWTnV0/X
 pI5u4GfwKfgLNAEnb5rA2BlG1vGDVDtggyOITYCMJoeJMu0U5k0IPEK8x
 PcrudH78mFOIQ/cgw4eEKAQgCauHYWH4zwJzldsLD7hNGdsKHQ13D1o74 Q==;
X-CSE-ConnectionGUID: KJ82l/JtR6an3/7pbSpJvA==
X-CSE-MsgGUID: hZ5Q8bhZQ06/b+OB7iW2hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72632025"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72632025"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:39:50 -0800
X-CSE-ConnectionGUID: ACd78+p6TU+ouyzpcg/FEw==
X-CSE-MsgGUID: SW4K89a6Tua9YvArjGr7pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214186935"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:39:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:39:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 14:39:49 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:39:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUf+yL/E2Ga+/+vVI1vv5HuxGjuQ9Bxwbyax66aPFSWgpKzveQKHrmoUIyERO5cwZTEte8c/k6HwcDKOm8BaVJcZ80u0FSNGGizYuAt3+SundEIOrivErnRf94FkVNdGYVEYyA+W8ksnWz+4VkXaQZ4XLsIU2cAmj0+k/tK2qGLuddUjcR7+3A2sbm6M0Y19bUCRLOnqL7vKW7ZhzmzHVd4HzJjPxzK9WlILjaRfjRzHfUKQ084zozq6W6JcnGu14zczswjc83XA1sV2TqDElklYBHPnFjDF8aImtPlkgIWic+Otj30GRO8k9EWrQlL0Tkk6QvRoCDCBa8NPCAhVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc2H83JA0YFqlmOwo67JwOF1pI0YM9leE3YSx5HQzog=;
 b=u4Ju5ihMMp9Rz/kqElx/W4yZ1M3+JvXxoTZ57hTuZc7gOFid60HigPUHEXNoKN5B9C65QDMbBABtsfyvzL7qxsA72K2vKA2RiYzvLtoB219ENkmnZU4M6mkg7+mzvSbPi1iYb2i77l1yIr/R3/rFCVIpc/PwRzUUMe+I6x5g1Rh+wq87nU9sRjWoaxw8m4Y06VoT63B3yWjiimnKkZQWX0Fxe+FqDjmFEoLTDs5dfdxe57Xk0+yRt4UtZjFD3jrc0T8KVok02MVLXEmwugwW/IUw3HMlC+9vGEZp6Br++pam32Z1jw2hmsi4q1rrWL99KdG8OXMIAFz3R7BO57A8Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 22:39:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 22:39:42 +0000
Date: Wed, 18 Feb 2026 14:39:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Add Wa_14026781792
Message-ID: <20260218223940.GZ4694@mdroper-desk1.amr.corp.intel.com>
References: <20260216111141.90541-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260216111141.90541-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec1b2f1-e0f7-4019-01ba-08de6f3e9b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/VYiHSQH0WQWBE1L9CQqJdvO5aRP+9JyboStcrLNgcujQOTnwnKCHDyrmFrd?=
 =?us-ascii?Q?HEx3OXtnOlnV9y542XlTw6XaAinGD+C/kwybPizXyr8SqcUVLK9e4HFJFhYQ?=
 =?us-ascii?Q?P+xsPwbZRU5PncdglTcrc6GRdx++PIBKmHXzb88mWMY5jSDnzVDiehw+ZjX8?=
 =?us-ascii?Q?FKtrx/T+tbkpEyq0xDP5rZffCoMGLsyMJ7I5NsPie7mKIkKNN6q0hUZHi7HN?=
 =?us-ascii?Q?2l9XNdGvd8fofMSo3bbKnbVbEb0apfjcOtRUBuAe89k94ga5jlIvYXyXD7lN?=
 =?us-ascii?Q?ixRD7/KZY52QlfdBzED9ICaERDd/LT5eWtVIZTBxnxsdwXaS+sMPTVyXqru9?=
 =?us-ascii?Q?UDJPwVL6Z935vXwtrYq6xJ+LMOB9dAEAvrlf4mNMD+Lyg/ROcN6vGLdRes5y?=
 =?us-ascii?Q?mPF2uPfC2ow2WqYWpoq/0vds4t2iL6BJrlkB929TPkW0WgGsee6FtiK8vYzj?=
 =?us-ascii?Q?JOuhDbbKd6KkvPI4RCbpxkIN2oQteC5yeyRpoLkv5kxIy49X8DUCY6MC3AfK?=
 =?us-ascii?Q?ETCB7/uuETx+EPBnLdO35EyLozeuL81mQ9t1IvuGuh0SheyKI2ab6xQALJqC?=
 =?us-ascii?Q?dxARXpK42+fUnNt1lZhD+/NGd6lVK6ow6ERr+bzlahMp8wIH83IL1YJjq8gb?=
 =?us-ascii?Q?G2mJXkZo4xxKAetMrpzYBSLv91/3QHQ0YD0DNRWGjSsEP3Z8LF3swchMqyZ9?=
 =?us-ascii?Q?KFwkpq1JtglySHz4OWCkGt3O6HDi4lqncDEW2A+93e8fU81LUUCkX3+y1l9w?=
 =?us-ascii?Q?bloVBpl7gilDWKhkshYi6I/vTBedCA3fzpIybv+GcKRzg5QtMpRXovwMVyKb?=
 =?us-ascii?Q?k3uNJrGlbBqWiBDw36Z2M+SQpRSYp2jvtCeNOpla7EzayjNnNoxuQlhjaI9f?=
 =?us-ascii?Q?AIra5o2XC5Jb4dHYfUlq1VobkhU7NuvnuppXYV1MsTHS9wXJF3L55By0nZJs?=
 =?us-ascii?Q?Map5RmSsVvq7Uw0tYqljZkMQSFGaaOjCm5/gYse/edEy9dzoICUgpOI6aVqN?=
 =?us-ascii?Q?O+MzY2H1YNxKuIKo1uIsxB0yOLCjORcKfq+8cVE0v0CK4EuxZwo7Vov4ZzZq?=
 =?us-ascii?Q?QifGth18JCPKg/xByGDW0gZTPpvLsY7ZlTmGpycXhvxo8DknMRFyA2QHYSmH?=
 =?us-ascii?Q?dBW/ZRLD8flkAEcicKG09e9ZT6qH284fHibiP4sWVPERt3N7mPSAht5wqqYx?=
 =?us-ascii?Q?M/dBAuH8MprluSuaW0/VgoyhYfVUZ24MKH9TPVfQ2RhzwTy55233oRse59uc?=
 =?us-ascii?Q?iWN5KNPu1/sNwQb/1JS6aqxBVqfacSnOpPMdoOUFFlNPN9a1e9GIGQpSrH20?=
 =?us-ascii?Q?vQ+xHeo5oBDdyZV97+W5nRAQR2WykwecHevbjIzd4GOjFb0TWhi9a2oVDRUP?=
 =?us-ascii?Q?9UpXNvgh5x7iRzSO88hgId4P5ZV3MpQRaCb+yjKCE1CdeZEmcioRZs9m8Rj6?=
 =?us-ascii?Q?NI8TGDSAa4p5YgdJpo1aZ8hV7ZzMykXtlYRuiqJ25YwUuhQVf/VH72f+ilsg?=
 =?us-ascii?Q?et7anhcuC6JWvG6lsiPGkwfe4tv4pFQJa9NAxCUL5Sl/n3Uw7lYJS8g1u+m1?=
 =?us-ascii?Q?MldIhskpHhy+rqdCbJY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1WI3IXbwWESE2iD3lNpiCYUj/OI5T5fxXyj9lOG5ET2Ei+HPEKJlY133/Rkk?=
 =?us-ascii?Q?6kQ89lvNZ08A92SzLHs+O6OWoWZcd0FtXWA37hBq7XAxvmPxEjPN9TnN38Uu?=
 =?us-ascii?Q?hU9QeR9DfZhr9vMQkop8Xtrl9lh9zRgeL0omlW6sKH+cTKF+hJo2iIYmbF62?=
 =?us-ascii?Q?KjruNm8Uu8NHX1SDzb04FeywxqZEEap6ZvWRzYE2jRgVe3onerXwCivbzNpe?=
 =?us-ascii?Q?hGQvanlDTN0HmpRwtBaNbSYXumfy1D4F1N9OXQxoLneILtmIhqna7GUAUU5I?=
 =?us-ascii?Q?TzzjEias1J1FWRIKM8VZ46D/MjUujthVoIrbRzMpzz4ea1Xsb9CxIQ4+5HAh?=
 =?us-ascii?Q?9A0Tm1o9/8EQkHj588BRoEvKYkQPSmhHIHxrb3OpeZS26kI0FaWB8p1UZa6L?=
 =?us-ascii?Q?jTRiWVIVWDHJmBweN99UPOFWlgntryoqgc2a6mRDZ6tCDKpcTE6eUhqcFOq+?=
 =?us-ascii?Q?dO+NS08ogCzwEL7QV5Dy2g6PcX5TH+wy3oEyV++mSAkT1xJdiSfgsSpsJMVT?=
 =?us-ascii?Q?+oQJITHuUuBz/GuLg9H30rN2Y2fdJeVqaO5ewe/2OK4Kk8wkbAukw/uHe4aT?=
 =?us-ascii?Q?QfwxmlqmsK1rCe9KFbzUH6hQHFoJVbRgEJLN6BxioQkDax14+MIIYB4EITUR?=
 =?us-ascii?Q?6orkjAXI/uktqWpMEqNFZenIxNtmJ3PEQJfeO8zV6llommd7BYgXZgf2DnXI?=
 =?us-ascii?Q?9OSzxUG/4cjL6/mYJa6oqTEI5nr4N7Rm7vEa5cPuQBqsBLUxzNfZu5k4OXSW?=
 =?us-ascii?Q?5g+b+Hiqi+CDzEifu2E7WyUIzn245wpEkRyyY9uEcqhO1pLKFdnIT3bdZhuY?=
 =?us-ascii?Q?32znEivZwQ7pQ+fLAU9SW1lDzyvfIjnvxk1sCIRTopyVq26UI5b1OONQlMFI?=
 =?us-ascii?Q?l8tUpY2Xxio8jDbIKKGnhj4/vGHXJYFZw9xMq954E/feSr1C33N/5RsuIsmF?=
 =?us-ascii?Q?feoDOsYG0XZfAhqgnX/X5B5GP+MbcegQeFvsmgUn3xTq21PkOWhzqedXbkBB?=
 =?us-ascii?Q?BE9z758Ghl4o2XXO5skf/Uv2AN8/viITgSzpDKvBZ120EqfFTzh8aDMxCB3w?=
 =?us-ascii?Q?htmpp1lBtKHiYn+ucCXeJFu/4nZ1326Mj2GgNyy1ZocVSH6zZy5oBAdNRTzB?=
 =?us-ascii?Q?Qc2poqGlctnSbiTUi6PCdalkLqYB4yfqdOz9NglcqgeLZIvMi6dDELzUp8zj?=
 =?us-ascii?Q?z5lrjoQKNB5Y7bxF24xnPGP3vf6Fm43p4aBG2UHr5aY2RJvcSDIsnnNwQFxC?=
 =?us-ascii?Q?hoVFqDnlEUx22aO4dBfhAZs9iDpCsNdelW1tNrsUEeccYU0+jkLS3ZzzxU6S?=
 =?us-ascii?Q?8JZs8VyLBClb9Cq4xGkwft/FppD0jHNk1cH7G/U4JzGTEpfpIychq9+ZBzvu?=
 =?us-ascii?Q?fKy3Ul4VPdkdwfuf84ej8QBW5GrSYQxDP5Pk4vcdGS0MR2c19/UdWDFAv/SB?=
 =?us-ascii?Q?/eBrDFDidE/UDtGkasBr6V5RKxUL+WXzL1Ddl+MtVmsiEb0UJMsaIiyPsrxj?=
 =?us-ascii?Q?deiy9aRV4vU9S3rdyMMpFUqvZWYknXSNrfCqn3cHTzS2g+x3zh7ZOF3hyVk+?=
 =?us-ascii?Q?fRlcTcQRmU34HzZ0F5RIGgQ+VGVb+WyIM1mybCb0Az/L0jRNKLRVcHcYJ1KH?=
 =?us-ascii?Q?S4dGGPt0EkXlkGuW4OJEVqfmDjZtGA02t9PFPQr+2idBxvWLfg0MJ5GeRc1u?=
 =?us-ascii?Q?dsrklAU/T4v9KraNBE2f4cisXSGaoIIwM8VwS9bJ9CPQV2ASQe0qFFXukqxN?=
 =?us-ascii?Q?nim1txwcppL9uLB+dBabM1qDk/96bDw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec1b2f1-e0f7-4019-01ba-08de6f3e9b93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 22:39:42.3552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0htU6QBt9Yapoeb/cGoc09DboskyfmH9foRehK0MmYEcw9vx7eANSLaRtWzwHueEqp2TnHSNl5o7o2/u+wX5p9wcUFRVmvfQ9H7DiYxsIuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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

On Mon, Feb 16, 2026 at 04:41:42PM +0530, Nitin Gote wrote:
> Wa_14026781792 applies to xe3lpg and xe3p_lpg.

Even though the text description of the workaround indicates that this
workaround will likely wind up applying to multiple platforms / IPs, at
the moment the only IP that this workaround is officially approved for
in the workaround database is 35.10.  Unless we have some clearly
reproducible issue that this workaround is solving on Xe3 platforms, we
should wait until Xe3 releases get approved in the database before
adding them to the code.  Even if/when Xe3_LPG does wind up needing this
workaround, we don't know yet what subset of the individual releases
(30.00, 30.01, 30.03, 30.04, and/or 30.05) it will apply to.


Matt

> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index a375ffd666ba..90b9017770ea 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -131,6 +131,7 @@
>  #define   VS_HIT_MAX_VALUE_MASK			REG_GENMASK(25, 20)
>  #define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
>  #define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
> +#define   DIS_TE_PATCH_CTRL			REG_BIT(4)
>  
>  #define VFLSKPD					XE_REG_MCR(0x62a8, XE_REG_OPTION_MASKED)
>  #define   DIS_PARTIAL_AUTOSTRIP			REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 61c4187dc0ae..05d7a0eddbdc 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -939,6 +939,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
> +	{ XE_RTP_NAME("14026781792"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), ENGINE_CLASS(RENDER), OR,
> +		       GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
> +	},
>  };
>  
>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
