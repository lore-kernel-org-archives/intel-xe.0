Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E7CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 20:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A3E10E981;
	Fri,  3 Oct 2025 20:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOQhZV6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8FD10E980
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 20:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759524522; x=1791060522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WY6+ZiV/TCjuTrosP7zxODAS445YU64dCFdutqsNw+Y=;
 b=OOQhZV6yeI6KusdVapiuuU10l9th/NH55UmqpyvgNs6KNw/G3EtfNBYw
 NBXIFFH68pyBHFtEBZe+b4ZxttRnJT2ShEC7YsFsHDp8teca5KhOJfHkl
 ghDly38I7unH0ZYs9CpjuJKs62exiFlChZnOqVZ9lyIR20fN4lmhH6ozM
 iCS7vzT0Mq5Cb26l9csdd4Zbc0293ZGrg0mS6+/r308Jpvz5Cb4sPt8BD
 6gPvVmIA6JiWCP66cdCWCEYye3e0hhelpZv4Yooy2t+eQGydiY3XYcW06
 8Ysexb9CrHQCpAgetuTCwz+h82l40HEHBhJjLjEeoCrnal6kW21WhDQBx Q==;
X-CSE-ConnectionGUID: gCXRqtxxQ9myDfQ1CX+sYA==
X-CSE-MsgGUID: jbUUnX6qSNmoMT0XWUEzUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="65451776"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="65451776"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:48:42 -0700
X-CSE-ConnectionGUID: LrTG2mu/SCGJlE9uMDw7xg==
X-CSE-MsgGUID: kFL3CbMQRUmKdtHcng6Vzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="184568724"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:48:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 13:48:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 13:48:41 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 13:48:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EC3uc96awohaAkkDGWfbudW62uE0YrAgxYnFGy+oYypjukEm46nDA6OeOlPh77aGxhrrxbMO5KHtwnnuUtWnKWTgLCLz2RVLQoXsDtITX6ZZJV2AB6akiE+802Ds5CGKp4eVbrju/bNXkQfB1EFmbWrsqkcKBB6J5e73vdRlWI3S9poc4bzlWN12e618uLntWiOw9+Del0GgQz2fhv9vq5anXT2X5bKS/GGPEIhu64GleT7eaU9bOhAh1kyuKkcbf+k7u7HckoKFvK07JCA9V4J31a67T+lH+Ot7Fld1/phTPkVCH00wR+jVJB0c+eISBeQpyeQuHUwEkPfs598m4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMI55MRu1y4yd1lvPWqxwEJGtu+wzuWL96UjTGE3oj8=;
 b=t3onHS5HHsqsnv56iHLQ9zZwxxW/XI6IT+TjHpx8J19Tib6l9kTHBnsaW6hMkMmiqv8NWyMAzLW+1vOnzqDaORYg+FymK86NyQEnss/CEkdMKbgiDz8DJZIbVfNSCen+LSYDbygRLSlv8bOt29nMNA6C6Nk8yuJZVls4NQSCjoenp1l7mLEA2ipuSc9Ae8qCmfVvnNfOgKcrM495Bsy+WPtmzeV+qgRljT2nUdXr2kyJCQCM1box1ydmJPZ7mhC+LYvgb2lUcP/oGLsaZgD8/RdddRsALR0Zg41MeoNB81V0ThzUkD3E+8izCOpukJ14Y2t/KuL/2iQC4jV2X77GLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 20:48:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Fri, 3 Oct 2025
 20:48:34 +0000
Date: Fri, 3 Oct 2025 16:48:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Add max_vfs configfs attribute to control PF
 mode
Message-ID: <aOA2n4npjuprZ1hD@intel.com>
References: <20251002232648.203370-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251002232648.203370-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 79234462-e226-43bb-12da-08de02be384e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NtnjbSrfSFNvvcN6Ki1jW75TjE9cTGgTO2DhOv3KkvkEcJd4Ls7SPfj3Xkji?=
 =?us-ascii?Q?sKPdeqJC+QHpGSLOTuCU1cqnVx7s+KpG3cXNuDfXtXi94FU5U45Z2XZSOgTl?=
 =?us-ascii?Q?kj7GN20UySTUMZ+oQShX5Q7vZVgtPvql5KXbXLhTXRa5sun01fmlg1Ltpliv?=
 =?us-ascii?Q?Xu+AdCqBUqrDJh48hVluchPtQ+qYWL/BvjjngiIdD2ana+SXhH2XV8L6VFBY?=
 =?us-ascii?Q?TDmicK9bchoACDQzm/3V+F5w0ua9zwsU4+W6zYM64xNIapNGj9E0JUlqZ4AL?=
 =?us-ascii?Q?V788ihCJiriKU/rT/pONhNyNgV97FF509X++8IwGsGiQCkqet7xbz0d0DUuR?=
 =?us-ascii?Q?AgtZEahXjtZIsclztbo6mh6XaM+6at6OfWHTIbycVm92Pp2pI32gDhXYyG82?=
 =?us-ascii?Q?q5PXETT6S2wFeJSemXu0wiMHZa4E494sSW+oBXhJpD5dLjMhq4t0HR8pgjxk?=
 =?us-ascii?Q?ND93gnimC8DxQYUO+ABrnMZcVPsL8kkQvr7RbO3V9GZKWD4CLcvBjQyqqLkw?=
 =?us-ascii?Q?/f1aHBQxYVf0+s9zBdd1YxZa9fNgcP0YKKWj9JQ3ro8mkZsKqC1FHqF6cD0n?=
 =?us-ascii?Q?CyYzgMPhPypw/abYLYUAc3h8U/RvVp8igJbPEkUW0wekI8XL9JTV3+xi5XDT?=
 =?us-ascii?Q?dsQD6FTkA63N8CT4XJGq+DdeHlzd8ko8oL1eUHp8rYr0UZk7gZlHwZNj2szk?=
 =?us-ascii?Q?5jLnn7VjKYRN0irWTrPUkhvFe5xOF/2jOq5EBe4QdSkvZ3BEiYxduJErPZOP?=
 =?us-ascii?Q?5+Sb57JPGEobHRFyNe2uPjT8alRcWLk6k2htiD3BRU2DbAl29UUmIdYLNjR6?=
 =?us-ascii?Q?tNpfbFE1yWvFaMUT8lmCyd4HOEN5qidjLCNa8gVmtSYOyxRo13mHEUDGk2uu?=
 =?us-ascii?Q?M3sG7J2J/pPwui/fY0+KF9+b3n52cXLoRDxt2ywJBYzr6l3akzA46/IUsHu2?=
 =?us-ascii?Q?8nmG+2kRNDlzpIo7gVH+/GXBdhCGAYUc9jNNWqDD6LNHQcaoILxT7zA7DtYi?=
 =?us-ascii?Q?mr2pVP+8zuTPRAHuE7yo87KuSqHlo8OG+LL8MJQ6NfmBmhBoTZWukTTFaHCX?=
 =?us-ascii?Q?l7d2/oNSplWYbJ0Jju+RC/B6Gyo6NWqZHbNr8BJ9DM/dm3i5cjZo0DwPLoQS?=
 =?us-ascii?Q?GrG5T8YWorXDrgbOMv2Kl/yW/ei+PVeyCN4VkkzFWWu4lXYZ2Eiwo9E3KjM8?=
 =?us-ascii?Q?nS7zNIFe/cWEgOQQgTM56OLNJ8GgXODpSmgNwUwbvs34GLPAt8QSnyiuLhBo?=
 =?us-ascii?Q?F8DJOjykOzSqCZNd4FyRU3WyZ4zCQowFwla7G4F7hf/qVzBg9AUJQYYQ70jr?=
 =?us-ascii?Q?22hiBahKspiYAsbyzq6R4UXj61LaDmhS5wQ4BERFn2whV7Y+Prvi5RSMm1/o?=
 =?us-ascii?Q?qcTFF7TtCkfHr73JEfGMs/cEagnO4Q5oxKwYbeMV7q/L6/dZOpfFFg3mh8ef?=
 =?us-ascii?Q?51AdyYE4iIfs71g0BKFnTBsqEYr9AJvV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kKvo6rCFzm5QAofv55xqLc3DLnRQqL9Jo7I6l9+2VGQd5YRRVyrX/PPc7xAk?=
 =?us-ascii?Q?Qm38U93OhtyvelJzOB/En4QQ9kaIIb6nKBdVnVXqDwjU5p9kUMiEjYvn+jSA?=
 =?us-ascii?Q?bTfknwL3LbuPRn/rX0mU8e85N+2XrmNUnLOqExbUWhYhIz1K09FcWe1LYCw+?=
 =?us-ascii?Q?pU/CGJ9rN9oC12S2piouK/im+O66ecEFp35Py6eQmYyKO45zG0YmOq1aujWI?=
 =?us-ascii?Q?ZNQUCm8NcfvbLO7XZdFdAPTWQlK5dh2HL7HCc5KIgSPETTjNiX+GphoreD/0?=
 =?us-ascii?Q?tneLCX4vyP8Q8iM61hMOzJ05o8gaWvOlCURCQBu8aBzqYSND8R1Wi6rhDWay?=
 =?us-ascii?Q?nc19AOvaWRcULcNaXJxohB0PzO2OhSGhjJAeSRk6GqTuGRRnCcQn6/N3Dzkw?=
 =?us-ascii?Q?LOmyJL5shnRXtK65oXBUCQElWLqwrtmu0Icg5Z6BtZ9UVse0GSnAoOaE8tjI?=
 =?us-ascii?Q?IU/RTJnT6JHySR5wuUNSymh7onYGs3LjhVp/R35/oiAhB+bcQPZrny4rQr3/?=
 =?us-ascii?Q?axpe4R8EzPZWlsUoBtfBulPihem7IsKlwFyrGBCCUKS8mqNOupDMr0e6wUrK?=
 =?us-ascii?Q?z02fWh/RLiZHqpR8a1xWeG+V+v0AaU0grjhpRL4ji9a0opVDJ8z4daKjaxuH?=
 =?us-ascii?Q?exUwgHVYxPZBuT6RAqWdkst0ShSC9AQYZjCjVicAgUOiExL3FdIjJUUIGlrC?=
 =?us-ascii?Q?vqcbJWL7KoBI9dqjC3+4oHdeS91Qu/x3gOvxOSDQz9eOXYsyHSA2S1fWu8r2?=
 =?us-ascii?Q?jJ5yupCo5kR5APxDCiwSlaC0FHMbiy+u7LjpczrWNdvrcDfemX3Y95hOaeNx?=
 =?us-ascii?Q?SpsyGDJyow4yn9U+QSlSjY0WULs7DVSGgA3cmYlyFYbJ4LUBKQN3I14Igs08?=
 =?us-ascii?Q?qnfsR4PxYCzo8QT+W7eoPy1XZwYZxzULqeRPKC9+68gvQEE6g9xX9QE6ZsZ8?=
 =?us-ascii?Q?vKhU2aMzUg9rBnQTc5HC0PhVbnDpakOTQpgLm7XnjuD2V32N072dfXRYfVIB?=
 =?us-ascii?Q?ihnPo0sbvGknYegjyqmZ0lf5gYE9nexw10ennAVT695dnXiZSLKniuHXPhVQ?=
 =?us-ascii?Q?zcBfqcHKMnXATABzcVEdcUNhMPqWix3W+28ZE0tf8nfcSs0PDNSrjdcdrewp?=
 =?us-ascii?Q?OwbsWu5f4KzIldqct8tfaTSc8zB7r+qHDY9khwBJY3W3kw91MAKJfPAwzmxo?=
 =?us-ascii?Q?I95yVA8tbbVZf5+LdoAN0B0FWV4qsPSygBb/5vl+EmSXlpiyduzXuXqdacoj?=
 =?us-ascii?Q?Fr7jNbhce2rupr4m5MEEuon8JkehpkVX37tfqZO3RmLGagJjbu1gnm429Yv4?=
 =?us-ascii?Q?Ojoa1D+oyxgM5e+cBqp1i3MLhoulMfZCa8tzPKw6UKprgW5dDQ5/PNNgBF+G?=
 =?us-ascii?Q?kKqdETqR12c3IV2w23nMgoH8DCNpjETDTUgNxzGJi1dVLjdMPKsP0L7Bd4B8?=
 =?us-ascii?Q?G+Z3+vF5SdrOyM8y+Z5csMfUWA28XQKTLhzzZCv+OlLllRn6qKpjE44B2hXa?=
 =?us-ascii?Q?dHkrJJOgIySTa4oJkpwYtOmRMeLwEP+gB3IzFnarPLry8va7oM7W15MYi5GC?=
 =?us-ascii?Q?07iVVNofs3qRYaqiMK/XQ8vOS7EsdvJVZg6RI2gKifIJ5VqLsx6SX3J04fGt?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79234462-e226-43bb-12da-08de02be384e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 20:48:34.6850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5dq0d3RAxr/sS9ok1b+sgm/vQsMDrGJLBLge2gN8t/Ak22phonm91ljKlYzkMCfEbmnlpdveLsu2+cFlMRN+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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

On Fri, Oct 03, 2025 at 01:26:48AM +0200, Michal Wajdeczko wrote:
> In addition to existing max_vfs modparam, add max_vfs configfs
> attribute to allow PF configuration on the per-device level.
> Default config value is still based on the modparam value.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 139 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |   4 +
>  drivers/gpu/drm/xe/xe_sriov_pf.c |   3 +
>  3 files changed, 146 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 139663423185..464a79c2a903 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -18,6 +18,7 @@
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
>  #include "xe_pci_types.h"
> +#include "xe_sriov_types.h"
>  
>  /**
>   * DOC: Xe Configfs
> @@ -169,6 +170,32 @@
>   * Currently this is implemented only for post and mid context restore and
>   * these attributes can only be set before binding to the device.
>   *
> + * Max SR-IOV Virtual Functions
> + * ----------------------------
> + *
> + * This config allows to limit number of the Virtual Functions (VFs) that can
> + * be managed by the Physical Function (PF) driver, where value 0 disables the
> + * PF mode (no VFs).
> + *
> + * The default max_vfs config value is taken from the max_vfs modparam.
> + *
> + * How to enable PF with support with unlimited (up to HW limit) number of VFs::
> + *
> + *	# echo unlimited > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
> + *
> + * How to enable PF with support up to 3 VFs::
> + *
> + *	# echo 3 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
> + *
> + * How to disable PF mode and always run as native::
> + *
> + *	# echo 0 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
> + *
> + * This setting only takes effect when probing the device.
> + *
>   * Remove devices
>   * ==============
>   *
> @@ -185,6 +212,7 @@ struct wa_bb {
>  
>  struct xe_config_group_device {
>  	struct config_group group;
> +	struct config_group sriov;
>  
>  	struct xe_config_device {
>  		u64 engines_allowed;
> @@ -192,23 +220,34 @@ struct xe_config_group_device {
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>  		bool survivability_mode;
>  		bool enable_psmi;
> +		struct {
> +			unsigned int max_vfs;
> +		} sriov;
>  	} config;
>  
>  	/* protects attributes */
>  	struct mutex lock;
>  	/* matching descriptor */
>  	const struct xe_device_desc *desc;
> +	/* tentative SR-IOV mode */
> +	enum xe_sriov_mode mode;
>  };
>  
>  static const struct xe_config_device device_defaults = {
>  	.engines_allowed = U64_MAX,
>  	.survivability_mode = false,
>  	.enable_psmi = false,
> +	.sriov = {
> +		.max_vfs = UINT_MAX,
> +	},
>  };
>  
>  static void set_device_defaults(struct xe_config_device *config)
>  {
>  	*config = device_defaults;
> +#ifdef CONFIG_PCI_IOV
> +	config->sriov.max_vfs = xe_modparam.max_vfs;
> +#endif
>  }
>  
>  struct engine_info {
> @@ -721,6 +760,68 @@ static const struct config_item_type xe_config_device_type = {
>  	.ct_owner	= THIS_MODULE,
>  };
>  
> +static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (dev->config.sriov.max_vfs == UINT_MAX)
> +		return sprintf(page, "%s\n", "unlimited");
> +	else
> +		return sprintf(page, "%u\n", dev->config.sriov.max_vfs);
> +}
> +
> +static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +	unsigned int max_vfs;
> +	int ret;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	ret = kstrtouint(page, 0, &max_vfs);
> +	if (ret) {
> +		if (!sysfs_streq(page, "unlimited"))
> +			return ret;
> +		max_vfs = UINT_MAX;
> +	}
> +
> +	dev->config.sriov.max_vfs = max_vfs;
> +	return len;
> +}
> +
> +CONFIGFS_ATTR(sriov_, max_vfs);
> +
> +static struct configfs_attribute *xe_config_sriov_attrs[] = {
> +	&sriov_attr_max_vfs,
> +	NULL,
> +};
> +
> +static bool xe_config_sriov_is_visible(struct config_item *item,
> +				       struct configfs_attribute *attr, int n)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +
> +	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
> +		return false;
> +
> +	return true;
> +}
> +
> +static struct configfs_group_operations xe_config_sriov_group_ops = {
> +	.is_visible	= xe_config_sriov_is_visible,
> +};
> +
> +static const struct config_item_type xe_config_sriov_type = {
> +	.ct_owner	= THIS_MODULE,
> +	.ct_group_ops	= &xe_config_sriov_group_ops,
> +	.ct_attrs	= xe_config_sriov_attrs,
> +};
> +
>  static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>  {
>  	struct device_driver *driver = driver_find("xe", &pci_bus_type);
> @@ -746,6 +847,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  	unsigned int domain, bus, slot, function;
>  	struct xe_config_group_device *dev;
>  	const struct xe_device_desc *match;
> +	enum xe_sriov_mode mode;
>  	struct pci_dev *pdev;
>  	char canonical[16];
>  	int vfnumber = 0;
> @@ -762,6 +864,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  		return ERR_PTR(-EINVAL);
>  
>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> +	mode = pdev ? dev_is_pf(&pdev->dev) ?
> +		XE_SRIOV_MODE_PF : XE_SRIOV_MODE_NONE : XE_SRIOV_MODE_VF;
> +
>  	if (!pdev && function)
>  		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
>  	if (!pdev && slot)
> @@ -796,9 +901,15 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  		return ERR_PTR(-ENOMEM);
>  
>  	dev->desc = match;
> +	dev->mode = match->has_sriov ? mode : XE_SRIOV_MODE_NONE;
> +
>  	set_device_defaults(&dev->config);
>  
>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
> +	if (dev->mode != XE_SRIOV_MODE_NONE) {
> +		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
> +		configfs_add_default_group(&dev->sriov, &dev->group);
> +	}
>  
>  	mutex_init(&dev->lock);
>  
> @@ -988,6 +1099,34 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  	return len;
>  }
>  
> +#ifdef CONFIG_PCI_IOV
> +/**
> + * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
> + * @pdev: the &pci_dev device
> + *
> + * Find the configfs group that belongs to the PCI device and return maximum
> + * number of Virtual Functions (VFs) that could be managed by this device.
> + * If configfs group is not present, use value of max_vfs module parameter.
> + *
> + * Return: maximum number of VFs that could be managed.
> + */
> +unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	unsigned int max_vfs;
> +
> +	if (!dev)
> +		return xe_modparam.max_vfs;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		max_vfs = dev->config.sriov.max_vfs;
> +
> +	config_group_put(&dev->group);
> +
> +	return max_vfs;
> +}
> +#endif
> +
>  int __init xe_configfs_init(void)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index c61e0e47ed94..16a1f578e4fe 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -23,6 +23,9 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_clas
>  				       const u32 **cs);
>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>  					const u32 **cs);
> +#ifdef CONFIG_PCI_IOV
> +unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> +#endif
>  #else
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
> @@ -34,6 +37,7 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
>  						     const u32 **cs) { return 0; }
>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>  						      const u32 **cs) { return 0; }
> +static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 4698348c010a..428b1b62cf48 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "xe_assert.h"
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_gt_sriov_pf.h"
>  #include "xe_module.h"
> @@ -19,6 +20,8 @@
>  
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>  {
> +	if (IS_ENABLED(CONFIG_CONFIGFS_FS))
> +		return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
>  	return xe_modparam.max_vfs;

I like the idea of the configfs, but this here is strange.
shouldn't be better to simply remove the modparam?

>  }
>  
> -- 
> 2.47.1
> 
