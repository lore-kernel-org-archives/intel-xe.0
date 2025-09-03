Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441C4CA1007
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 03:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD9A10E091;
	Wed,  3 Sep 2025 03:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtBa6jGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD64910E091
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 03:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756869351; x=1788405351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vW3kLHk2RhmZnFyrv/jZq0NXq7eW2OxX+s6UyzXFhqE=;
 b=jtBa6jGLLX5qZpPUrk71mPxodTx01OEIdiMX4KFgMg8fbdQXqsdslGRN
 bGQ6G17jNXAwKqxeYpM4USuCy59QQ8754PiuJoPo74Rm+sjTXbrl0Mhnr
 rFM4yMxRu3Dl6T1NhowUJM+Qna8/liSWcaCbwcAWzh+dWW8eu+E7izqdC
 je+ZYmzLFAPnZCptEA/N0XVzKZT5ceHHomWivp7aDADS12SUQkjxn0ntb
 06i2SlDpmzU4hkoDfXMcX1X03Ol3vpLCSUjULKLNcO71LGxs0DmHiTcxK
 8A3Kh6ovPq9O6H8wxjZPThZ9Gs8u84xtW1lNL3gBFnf7KFC1wcif1sIxP A==;
X-CSE-ConnectionGUID: RPQNzFDWR/+4Cg2fVQCfjQ==
X-CSE-MsgGUID: h5k1LeYqQzW1fLTupnhnkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59085066"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59085066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 20:15:50 -0700
X-CSE-ConnectionGUID: EY5GzgF3Sgavy99pa/CEEQ==
X-CSE-MsgGUID: WCsopxfeRfirJ9wgYZl4Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="175609414"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 20:15:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 20:15:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 20:15:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 20:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WX3xUo2ffZ35I9CM+4xZK/FymxgC74n2C/U+YOh4dnUBm2o3o9M4FaA021R7HdG4QyZiyp/N85kQ7ROmjIWml1OWBItKfqRiL79mduckjFALPyKUN/JA6Q68h/lW5zhAg+i4qwSwdP0JOcc9UcN9LAyK1X6jzIxC6I2B8pDrjKLVN5EsTcvtlYscOfZfMMqqGwEJv142RDcJ1xHwBg9vdHVl3vb3s4OpSLCwGgQwlWft1G++QPpoq4x3qK/dwn+ThmBbiZIDf37VKCAuR2MBDP7ytnQnGY9tNPR4ijlHAqHWOMkDCobJQPYnyoaIH//KnBTVUXNKeM9YLJ/vJq9F8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm6amMKthYKQc6ZQtY/Fd30wO7Hg0wvN8J98t8/pmkc=;
 b=QYZearNtipfxy8d2918GNSkOtshl28L1EY6yvNeXXKVUfEb8wqBeQ5UHeWfkQkuj0zythactMA8GQxcYO7clSjurlu5K2oczvbrZ86pQlJIQQViBvaCTYwJZlbGSBcUafHqJt/Z9m3EAnevC3z1HKpA3Vzn1pVA7WEixTXxhbpIczVXwiU4R4lVD59cGKG4nalD0IzT7ln5sYIpCQ761kPA9EQcfQvmI4sEuhqCErXd31rQ2GxgjXZ44pgk0CDPBJilxUDBLVM3psQbmFv0DV7KRtZmgmc5dcE36fap6cNyzKOOIpJg3AhlCYsPvAC752CVfayNUsoSy6BA1V5dw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 03:15:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 03:15:46 +0000
Date: Tue, 2 Sep 2025 22:15:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Message-ID: <burj3mqwij6g6wbaijovq6x43hxupbmqprwqvwqoxbwujaiigy@acmsc67ltegi>
References: <9dc621a90880f62ac8e2951afea7952277f7eb0e.1756855529.git.harish.chegondi@intel.com>
 <b6a631a13a9fb7360e89d679e0797fae42d5a09e.1756855529.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b6a631a13a9fb7360e89d679e0797fae42d5a09e.1756855529.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 63718509-7668-4645-c311-08ddea982cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z8BKe6gQJq+17GBayPceNm76ALHksSHwDHT4KMeh0ax2B5ZTzleysozaT9Xt?=
 =?us-ascii?Q?8bBJokt6PcWL271tOqAJ3HSFhXdss8MQ13qVqg5a2suBpeDur0F4VSGYU6PC?=
 =?us-ascii?Q?/415fK8mEPL8Yl0cHhO9qgm4YiTrNy3ujPwcF40DvVnOWPKddmi67cHQ3i1E?=
 =?us-ascii?Q?YEK2/unPEtyIhPDOhtlL1uz5JO3NQ9uY26nk+cUAKJ75M+R1ugca+uximKrC?=
 =?us-ascii?Q?Jhik4/tTs95/B7GvOBBOhFFuqZOElmqAOqyOgYGpF+fWzd1kZxGcaG1QDahC?=
 =?us-ascii?Q?+hng1dSyFfyMIcS6JAhMEmdg8Jju4c5HfRre2EZux7KnOZSQztcj4rSGcjux?=
 =?us-ascii?Q?Lov76t4mpMm6++WPuJGWwYKuqfq5p7D49k8v1mb/KsTgOGVETspVtHvVTOuh?=
 =?us-ascii?Q?Gb7Un1wb4lO6XSic+NfdWJjg1FFyX9K2gtJyRA32VulBSfL0F16Uwtbx/0Ne?=
 =?us-ascii?Q?fuBykrKCpilYHq67gc92WxpwMEyATcuQjfRM8JqB3rbeuhm+0S+YfnrHFUFQ?=
 =?us-ascii?Q?9wLWNluHC+1RxssgusXE6rniyW3ItygVDpfsB4kVxE2nPqDCITDNfnQx9A7W?=
 =?us-ascii?Q?94DZ/+xZgafCWEqC1u28J2589d/QEX4GAJTjCQKxzDd0DySJqLjlOrA4gKtO?=
 =?us-ascii?Q?/iSiNuJqAg1b0hEWICUB7HJlEUR/FMjL+IPjd866pZ/Ts1VvyF/gxCL2Zbdx?=
 =?us-ascii?Q?hrrBZBBk6tkMA5ecS1gQmErjmBbpfNuD7t65i0RBQuDRRidWuhrA8sKLW03A?=
 =?us-ascii?Q?6+OEZXONbhskcxbx/ZL8LpgVYbChy+6B953joT2kDL8+eLuO8rItzE8wucR+?=
 =?us-ascii?Q?BfZme/InpQ+HoNG8ACmDO2d/B0a3MZkxYQYUgbOapF541BCQ2ucpQ31IvcGG?=
 =?us-ascii?Q?PUsFUNRgLHUp/tQzBiPZ8dygAbG9qbxgvfvPH9f7QTxO2aG9FL4Z/Fljtd/P?=
 =?us-ascii?Q?8hNdLBQ63hmoUbidmoeMimSyZo7k4OgMSyJPI8J9+FoMjCPdd21SFtuWwRIi?=
 =?us-ascii?Q?ctHc5IVFrb+tUfS1faLuu6CA1EiBLb/KKNvIwDm3ielTLXHozjen/nfJ6yrf?=
 =?us-ascii?Q?GCt+uVF02Uq374eyJVt2FbA55QD+eVW7ygYIahiduIDQmqTn5FPZY5dNSXmt?=
 =?us-ascii?Q?MpWNgMa0W8XbPWCMEbqB68T6JkgKizkgir6dVCi02kV5+/IzV8GdQiIEHkr3?=
 =?us-ascii?Q?tjyFb/SJnJqR2et+ByBWqorHdtNiI5GDgSCVHUdQtfZuQNrR6PTZNHFbGCpQ?=
 =?us-ascii?Q?+wsvQkJpvnbjg1+UxsO+tjQIM1gHzsFakqeTnbdev4tU8QGvfBYysuTuLHIR?=
 =?us-ascii?Q?QPdLnPb034cV9CC2fYpUMpE1l3f+WSxzoxn6bKlDvrsI03X46PqgEaTR4Tc0?=
 =?us-ascii?Q?8U6A1B5zxldUbzurtE/o1f3muuRsPGqstuM0SOh3JCQkLlLIhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8/F/TkTr0CxGPwst1hKkDmSq5xHX/qO4Jgaq3+nN5B1yGzYr6q7qUJpjr2Ky?=
 =?us-ascii?Q?kgW2/Tq9aKI+X1lpysiNiq0OeqXcIsPRVJdCPd1Fv4qBZ/zCTOpYHYAj+fyr?=
 =?us-ascii?Q?rfU+eMOECDrPoNujIO+iGGCogxkO/A6mg0XEHd+jRcoTpTSFekn/AQskv7+V?=
 =?us-ascii?Q?US+505IGUB7EKg+DsMDi3HDyobbvqcTal/XD7EVACW5vt3WBIxaw+suD32kq?=
 =?us-ascii?Q?SjhTfMX/IkoNB3w+w2+pAefMlPKH09gFB86zOxsNkPIF6DnRZsn6q8EFVtzL?=
 =?us-ascii?Q?irhMIFC8qUWQkDBx/7GMX56G4XTRJc27iAPz3oG5ydEe0PwwfPVWK7oNC/RM?=
 =?us-ascii?Q?TGYhPgzDsSm6f5wv40GrHl1fNYDO1dXYFs85/P5iVWCueH+IrXpCCFvTQk7z?=
 =?us-ascii?Q?ORx/Wez/MQb8kIVItizdqi7eKjHClwa4NLnKifn42ke4GPTnAU76wcx9QYpE?=
 =?us-ascii?Q?L9iTWt78J+p8Cam04kE88drHQxn3ghYoycTndTF+4KjIjHE6qk47xQprGqXL?=
 =?us-ascii?Q?PeeRUzGy7VrYI3k3vaqMPYw3laOJijiyemwAzGKGZSOct47rOAyq8bHH5eon?=
 =?us-ascii?Q?MP9n1FTaxuQNsWAoFTdf66cujalmWwwq5vspEwWfC9+b26RBT8c5EUqWL8Ue?=
 =?us-ascii?Q?fQkMltrDxk3t/9h6tYyhHMDePZspj5YFO/SQwzn254IId64zXdOtjN8TFWex?=
 =?us-ascii?Q?fwxD+IvpjXPe4DaUqarmNY/yPlgUHgYNrjG79F50IgDU8uwAMIySA783kNMC?=
 =?us-ascii?Q?lD3Qyfr5wutAfsZzOFEAySko2tdy/GcivJfA2HWk1H6C8PG5dnWmILxhsFGI?=
 =?us-ascii?Q?VXn5A3AO5Gz+ri6ekpyndrBcRxDj+c6eElqIbj3FKNwDPHuqmUvsQdorWTfd?=
 =?us-ascii?Q?NZtPSoo60q78Qydvc1X5TYQP7rVPyYoOuIepMNvwfhDFIcCazT7HrSO54RPu?=
 =?us-ascii?Q?X6pIZUv1xyvkeGqLqnWV02xYx3LR7pQDIe1m7pq3cw7a9S8jp6na3QhKAFpL?=
 =?us-ascii?Q?iOnIM6d4OgbL0JqgEvqGGALYG9e29oUD5qJRmVHKwZGEadLDB7YBhWOcuGEs?=
 =?us-ascii?Q?bu1tLKBmU8zCODqNi4vYu53czN086av9Z4IWhHBNjji19yutX5iE8XWeKb8X?=
 =?us-ascii?Q?XtWVeTKNFKxURQZGxYUFZgELsIWGbovrbqcOzRthkOYS6uLgxVyHPitx3nMO?=
 =?us-ascii?Q?hcavJqvLxzoxa0LWxvyRN/UJZXRIMYA+WqUDK9+Y/4nqilz0iDgMI+nBgJnk?=
 =?us-ascii?Q?6plQARlUeb8iF99Mlab2E9aT60HP2Ce7qO9ezPHDAYCBC0b/vIfZUvZ+y/Km?=
 =?us-ascii?Q?nFxolRLTElU2eyyuciW+CaOPd3iUuKImi9jZK4ieBZrxYflwks20YPJ0UaQj?=
 =?us-ascii?Q?YEZrZU90X0EYF/ogL7DIjT1ZcCbF0cpyjjoocRCjq7F48K+EH5VAqgVvMT/p?=
 =?us-ascii?Q?GD7ahNAcxRQUqW4Ms7IVTeQUYXG7K7G2nYDgrxGVlKkCLUm9OnQGpBvA6i7Y?=
 =?us-ascii?Q?TP2PxokGDkOTQD7JgtsgAbUfT0N+9O5c4Z1CEuQ2rtsSpwP2xM6YihKdBNXv?=
 =?us-ascii?Q?3A21g00tbhEOMubvAZy8HPMlU/oPCJyZMM1TjcPCl74H3mzyIt6gyVamoAVg?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63718509-7668-4645-c311-08ddea982cbe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 03:15:46.5597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qw1GscKtfmAcvfz/HmsWMQCDJ0GAtYPwyzWB5RX73s8e3nAXSCOokxNfvPp+zn8pizjCeEtIwDkTlegwnmB3UW2d9fyc+4NnJaFO//G4pbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
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

On Tue, Sep 02, 2025 at 04:42:00PM -0700, Harish Chegondi wrote:
>Add Wa_18041344222 for Xe2_HPG that requires disabling
>the perf mode for subslice count for eustall sampling
>when the enabled slices are discontiguous.
>
>Bspec: 79483, 56024
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>v5: Add newline before #endif in header files (Lucas)
>v3: Skip the workaround for SRIOV VF
>v2: Add Bspec references (Matt A)
>
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> drivers/gpu/drm/xe/xe_gt_topology.c  | 17 +++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_topology.h  |  2 ++
> drivers/gpu/drm/xe/xe_rtp.c          |  6 ++++++
> drivers/gpu/drm/xe/xe_rtp.h          |  3 +++
> drivers/gpu/drm/xe/xe_wa.c           |  7 +++++++
> 6 files changed, 36 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index f96b2e2b3064..06cb6b02ec64 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -522,6 +522,7 @@
>
> #define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
> #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
>+#define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
>
> #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
> #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index a0baa560dd71..0ed7dc9044a5 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -12,6 +12,7 @@
> #include "regs/xe_gt_regs.h"
> #include "xe_assert.h"
> #include "xe_gt.h"
>+#include "xe_gt_mcr.h"
> #include "xe_gt_printk.h"
> #include "xe_mmio.h"
> #include "xe_wa.h"
>@@ -328,3 +329,19 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
> {
> 	return test_bit(dss, gt->fuse_topo.c_dss_mask);
> }
>+
>+bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt)
>+{
>+	unsigned int xecore;
>+	int last_group = -1;
>+	u16 group, instance;
>+
>+	for_each_dss_steering(xecore, gt, group, instance) {
>+		if (last_group != group) {
>+			if (group - last_group > 1)
>+				return true;
>+			last_group = group;
>+		}
>+	}
>+	return false;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>index c8140704ad4c..d95cdd6e45be 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.h
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>@@ -47,4 +47,6 @@ xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
> bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
> bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
>
>+bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
>+
> #endif /* _XE_GT_TOPOLOGY_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 47ea1521dc80..b5f430d59f80 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -370,3 +370,9 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> {
> 	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
> }
>+
>+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>+						  const struct xe_hw_engine *hwe)
>+{
>+	return xe_gt_has_discontiguous_dss_groups(gt);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index 7951fefdbe04..ac12ddf6cde6 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -480,4 +480,7 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> 			       const struct xe_hw_engine *hwe);
>
>+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>+						  const struct xe_hw_engine *hwe);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 52c7df4c3afd..1d4efaca110e 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -612,6 +612,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> 		       FUNC(xe_rtp_match_first_render_or_compute)),
> 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> 	},
>+	{ XE_RTP_NAME("18041344222"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>+		       FUNC(xe_rtp_match_first_render_or_compute),
>+		       FUNC(xe_rtp_match_not_sriov_vf),
>+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
>+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
>+	},
>
> 	/* Xe2_LPM */
>
>-- 
>2.51.0
>
