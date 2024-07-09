Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049B2C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 20:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF41010E113;
	Tue,  9 Jul 2024 20:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sb7IUfHu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF69210E113
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 20:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720557762; x=1752093762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zJRvUoRMGjmbjBXSU8rk2hUpkUsqH0beSfI9v4i4Pnw=;
 b=Sb7IUfHurRuvwjywrIjvXZ/z0As0J45n+iAU2qwUXGj0Fq4UShV6gHEO
 qDPj1KCgrE+YJY1eriOAznwD9a+aBVBL3cje++gv52iCW4o7eNqS9yJ5n
 I0H1hw/ddzum9ixMo3bnG7QjbdE7XWXlM2NG6rNmxR+QM+y/SydWBNue6
 MxDA5DcgTWZlx3Gub6+2y/ngJGTJ9yzVShup0x5BRjU5vbZ88Ee1fRrcQ
 EgV4VIbXlhylGQNbciQNw6C+g+2Lc7ExwJG5X+wx746przN0g523MLwvc
 XqK/qwXt8D08QtU1Q6279RJicZI6t78jUws0e8Q++T548UeVt+Vn3SDQi w==;
X-CSE-ConnectionGUID: zCsLJJY9R/+/UXzdfHtq9A==
X-CSE-MsgGUID: mHPI0CGjT8eyEruyV8Qgcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28450827"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="28450827"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 13:42:41 -0700
X-CSE-ConnectionGUID: ThBqq3xmSeO+sbS7LUbaEA==
X-CSE-MsgGUID: 9+JMm9pxQNesGfYa1LQSLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="52576687"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 13:42:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:42:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:42:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 13:42:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 13:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb2i0de7pwamoT1e/B2nB1+1BbJ/XpmHszKBoniCpeRrZg2ljhu5KfLT5MOXgpc/o8fGzl5NwMFlB99895BAqu/o2plcUR7n+CIH/5vOFgAneqhDz+HjI1f7/8xBsQAsdshQj/ObDbEztqOu9A9GDwrlPnpThV6mA2ITTLY5fS02zZgVbWxjyXdE4dshyLHP5xHrgG/w9eq2noOk4f5WNdDmKytxGpO5ZVwqEod4QBrlx5YPmlTNTce3Uk0eZmPy4jcehibMQpxvyJ/mt5DLwRXdrxOsa60gbMMxTOZdWz0XDG8uhfe8tmSFbPltSw+Zf0Dwh7W7Gpncew2g3nCH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ie+rUFZNdif/bPqYnm0ENJp+x5F1UCA7bAIlmkp15zc=;
 b=b92deuzeE1Lk+KHoncge4anzC3bJ7T92zNgO2xpIVuxeC1wAc/m+OgeGkJEa8eTGapQigiZVClEqVOfyDAxmFJdgWIM/5+iOtw6Z/8B3/v2MttULaKwl5TlaWJouRMgERLaXIetN1PuzxYuG9AK0fij5Tc4i4buqTfOHTQ2KT7kjxqjjkhPLvHgpt7aAGBnIMGT3bH9d3tkUNEDwpN6TUNkCK/W+PNXgTuN9xZj8bcWAxtNYjLkgw8mpPhasAkkIcQk4R7WBzc11OPRt2ZPLZaimMvhba2gQLyJCxIT26wkvbbY65P9Ujjgr/9CDwGk0FYkkMBDUklDHzhO1K5T5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 20:42:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 20:42:37 +0000
Date: Tue, 9 Jul 2024 20:41:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe: Add ref counting for xe_file
Message-ID: <Zo2gjQmp3ISF0fbo@DUT025-TGLU.fm.intel.com>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240709002835.3372618-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0197.namprd05.prod.outlook.com
 (2603:10b6:a03:330::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW3PR11MB4698:EE_
X-MS-Office365-Filtering-Correlation-Id: 36590a2e-7db5-4a58-f1a1-08dca057ab56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XKfwcJlKOrv3qMtY4uNfcfuKcKvo5GWUJmNfRIt3ffaF4kxoDVk+Fv+zh6xS?=
 =?us-ascii?Q?Esd1QU1keMzOpOwos+FhSbRwgfnqddy4nV7j9eSnvQAC5fHQCSgUPORMNl5u?=
 =?us-ascii?Q?0iNKIbosFwqs/vkyM3zfrbdijlQJTsUL827C257NQF/5B5WQ5ffGFKCjTvIb?=
 =?us-ascii?Q?aG42+Lw8yyPnfwRsSveEbaHPYeUPFfu03GSc8N8uwEXWlIFMbEJTlH1FxO3u?=
 =?us-ascii?Q?6zt3SZTnrwyqoJ9UR3Q67rjdG23b7pp+asoQZpKNEbraP/f+GYrnElJJUMlw?=
 =?us-ascii?Q?AvWahCMKyFjy8UbzryZ+SW0RRNTopCcq3++jNlwxJLVUArQkCHtDUUP8IqHM?=
 =?us-ascii?Q?3A2fORK7/H0WAe/z6jBTLlDuLi5syh7UGSUyQ2dIAYpY9BipIwbln+Io5beE?=
 =?us-ascii?Q?l1ZxE0DZVwxB2Cyfj1BVdbFlS4Wlq8ATSe8s2hRC4+33pXGo4VLVxuyUiYFc?=
 =?us-ascii?Q?bN1DmiGGpYVrU5A0+FiuZvd0SJFIRJnFykFaiYyLp6grUPPCJuk50Q5yDGrs?=
 =?us-ascii?Q?THiOmqBxEWkV6IyWOf/+swVnwliAfYTf2zBhdjuagX8RGltNf/HFkH4MRee5?=
 =?us-ascii?Q?J+Vct800DhqrB4VqZ1BE12PC9rtDRBV5mVxmlDWCroYV5kTC2WNtXcQCJLmK?=
 =?us-ascii?Q?82txwD1cg6WSkDkjzVasmRpuEQI9/+Tm/udTOgSIBhS5gWEKintiX1eZcEGq?=
 =?us-ascii?Q?dYfxCqc4E+LmdY86Wdi3MgKMUxvmZOUiNM8arcp+uT0Zg+9xWhGFnnKdeXJy?=
 =?us-ascii?Q?A/tWIFnfF88xJU21SGRZNYcikjXe3hLMs7kgUMLUdLM9HkMqZXPk/KIHnzch?=
 =?us-ascii?Q?vREHo0ZnXXhDsUPy62OqwyEUIMYdAWHRW79xpgSU46QJDC5etKu1ykDbW6bb?=
 =?us-ascii?Q?a9kGqdneeFssQJjCoPw5PG7JfrDD6tjqpiB79nUy2ZNoaWu3Mk+cEDsReTdI?=
 =?us-ascii?Q?p/fLR833WzeQdcFwRaDqzWYDyeIbk7ScZQUmaM8DAdWV1jqSqcsq4eaKp1Gx?=
 =?us-ascii?Q?TociNNBYq258bQH5SxcK9A+JMwtGRJ2cVXSu1dwcCbUOtrfXurp9MUk04snM?=
 =?us-ascii?Q?2zFKK4p8GbPI1rI8P+P5JF1yFhkp+bhQELorvRjgx+aAyhY4Kcbh55k+H3FV?=
 =?us-ascii?Q?XuCX6lynjJnHBWHQiQxMtqFE0tcfzJT2WrMtmD8xVSQfpDNxaNv7EQVmKAkU?=
 =?us-ascii?Q?T08rPF6lCxffV5Y+K4PgItFHZivJmiZFJvqxP5JkktDKHu2BIpz3l/P5DN7q?=
 =?us-ascii?Q?5uFS3FBaDP3qpetmIoKKvgrBqa84AFdVctq/IlBkt/lht7U4J8fcb9TBAqIN?=
 =?us-ascii?Q?td0dHFuY7rHYSd+VN8NugqA0vOI+Amp7FUoOMDuCKJ9eMg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cenn5n8gdlSQ5V2kthrP51Vw5eHhqCWsCUnjub7Cmp1m+1WBen7Wjv3f7y6Y?=
 =?us-ascii?Q?KMDrd1nzXU8s77RvOYqmuh6q20q+P242RzeGJTtiGl49MafEU+LAAwudgQ6Z?=
 =?us-ascii?Q?8NG5M9tPbct/s1boPVH16NG2bYC3hd9nkci00OWFvQ+0BEAK/PKvy61tgVmd?=
 =?us-ascii?Q?lZCHLGr09LQjsOlDfsKhAlUAsOMZmuFT4wwKykSkhS5efg46FlvQeKOkHGSC?=
 =?us-ascii?Q?wamWpDxuchDeU5+S84kWrTKzVS3aNE5dtf/K+82+FdgIfgrUyERwdWiSDOhG?=
 =?us-ascii?Q?iLRU0haX9FecBO2Hj9OpkWms1n89ZW0IoPM5DxNsmslz4fVkha7Dy8p89GvS?=
 =?us-ascii?Q?xDEqnsBOCQoR7vPVxqUuzsp6rOI/vq5alwMa75OeK3r4EljP2Prhz9uHYHpV?=
 =?us-ascii?Q?3lwemoKWop4ATPIMGkEJvEV3c6RmPeIiGdSsHe8cnrjJF2eFoDSCB4zSy6/K?=
 =?us-ascii?Q?a0SvOamCw6HO6hob10j9mNT+i4CW3oZZY5rnJFc+yNJ48o3wpa6W8IMXkCv2?=
 =?us-ascii?Q?P/6QTA6R1MA6ShVhsGIti9vvwvzN7C4uMECEAm6t/Iy8BX3EAZkaEAyHVvVp?=
 =?us-ascii?Q?TajKS72Arem5n0Zp18Rv9yF065/bB/Vgdv5q5KSDW/SH7pP4pQ5cmmT4/lGe?=
 =?us-ascii?Q?wVZm6ST+7xWAbY/DI91dHiCNRmVGIALW+82hyZaTqE2xMjKzRTbQH8MqzVVh?=
 =?us-ascii?Q?CGEW55dGWnQZoJWxJGeBZorSBcE4vm4n2qT9h0S11xc4cdWXbfeVBOQUIGz3?=
 =?us-ascii?Q?VPR13ZMiJGtSQ2FCYexlUddScpO6kQGTxLN2wtzv5dP+A6VE9zZSs5I/dxNU?=
 =?us-ascii?Q?cGhfI1+uxi0/A/56zedI76S7x/G1XwpCzjBwQFgIgJA/IwT/f/R58PjUiMXA?=
 =?us-ascii?Q?7esLauiRR5uStopxXQV+F7GZJ5DAcApPF9dCgfo4tChQovYwtMj5rgCFcvvE?=
 =?us-ascii?Q?8biKgTpJb63ZJMiaISFmadzpCX1XWXoHk1J9P1NkETaM0fJKXJhT4+OfC7gB?=
 =?us-ascii?Q?nqDm1v2AuH1nIP82y0zXLcHTL7UeXNtQtcV2NZnb4mlQKOqqLHKPxivxSbRF?=
 =?us-ascii?Q?N0uylZVpCgZZw5kPM6ERpuiczmmk4W9bIEZokL54cIfCqt8+dLtZiE4nKhhg?=
 =?us-ascii?Q?iGdsGsVIYyO4Q6lAhwWwzDv6atMPDasEP5i8MDYYvR4Vaigo4yqoqyge2lkN?=
 =?us-ascii?Q?u8/qU+sQDXC6zC+NBdVHdTNA+fB0u7DZ+0ir7yvszCul2E+tVmpKsznYx2Ew?=
 =?us-ascii?Q?aJ0h4jJKKa4PpYd9rfeVXvt+vAmeg2wn2HKsUAH7paPbwWy8cmTx5A8G/R0E?=
 =?us-ascii?Q?KTApJgljO8zy4KWjNJCGyGqKtDcPE3IRZQaj7vt4L2xNAdZ15kTRVK7vJPgw?=
 =?us-ascii?Q?vjM/H2TxCv/m1x3omXOJ9Yv0rzOnu/cszU/oh8rP+eg51SfkGATQ7W1d4bcv?=
 =?us-ascii?Q?8uEtkWT/6C6uifz8zJafP6ie62QmLuxmeEPUmbPNnQePoupL/RigYNtSNY1W?=
 =?us-ascii?Q?6aCUhK5/0zqCYJ7W2V+paa/pnE9ImThah44BdXDScj83sQLac3co1aRucTLU?=
 =?us-ascii?Q?PfDw3pM6X1exH65ASTd6C029H4RpSbgFQZYm7dZIva/X/VwQJkCiPJpg9kbW?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36590a2e-7db5-4a58-f1a1-08dca057ab56
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 20:42:37.8680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKPNKKncc55MlXydVO5MyEKwGvjriyhbGbJqzvWGxm36z//hnx/tfOsD2U7fVOIbtoYq3YLvTQpqQ8f8M4EJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
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

On Mon, Jul 08, 2024 at 05:28:33PM -0700, Umesh Nerlige Ramappa wrote:
> Add ref counting for xe_file.
> 
> v2:
> - Add kernel doc for exported functions (Matt)
> - Instead of xe_file_destroy, export the get/put helpers (Lucas)

Won't get into this bikeshed here.

> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_device.h       |  3 +++
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  3 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c5464ad5d908..61dc0a37a4d0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -90,11 +90,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	spin_unlock(&xe->clients.lock);
>  
>  	file->driver_priv = xef;
> +	kref_init(&xef->refcount);
> +
>  	return 0;
>  }
>  
> -static void xe_file_destroy(struct xe_file *xef)
> +static void xe_file_destroy(struct kref *ref)
>  {
> +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>  	struct xe_device *xe = xef->xe;
>  
>  	xa_destroy(&xef->exec_queue.xa);
> @@ -110,6 +113,30 @@ static void xe_file_destroy(struct xe_file *xef)
>  	kfree(xef);
>  }
>  
> +/**
> + * xe_file_get: Take a reference to the xe file object

s/xe_file_get/xe_file_get()

> + * @xef: Pointer to the xe file
> + *
> + * Anyone making a copy of xef must take a reference to the xe file

s/'Anyone making a copy'/'Anyone with a pointer'

> + * object using this call.


Returns: xe file pointer

> + */
> +struct xe_file *xe_file_get(struct xe_file *xef)
> +{
> +	kref_get(&xef->refcount);
> +	return xef;
> +}
> +
> +/**
> + * xe_file_put: Drop a reference to the xe file object

s/xe_file_put/xe_file_put()

With the nits fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> + * @xef: Pointer to the xe file
> + *
> + * Used to drop reference to the xef object
> + */
> +void xe_file_put(struct xe_file *xef)
> +{
> +	kref_put(&xef->refcount, xe_file_destroy);
> +}
> +
>  static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_file *xef = file->driver_priv;
> @@ -132,7 +159,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  		xe_vm_close_and_put(vm);
>  	mutex_unlock(&xef->vm.lock);
>  
> -	xe_file_destroy(xef);
> +	xe_file_put(xef);
>  }
>  
>  static const struct drm_ioctl_desc xe_ioctls[] = {
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0a2a3e7fd402..533ccfb2567a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -171,4 +171,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  
>  void xe_device_declare_wedged(struct xe_device *xe);
>  
> +struct xe_file *xe_file_get(struct xe_file *xef);
> +void xe_file_put(struct xe_file *xef);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f0cf9020e463..70115fb8d806 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -578,6 +578,9 @@ struct xe_file {
>  
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
> +
> +	/** @refcount: ref count of this xe file */
> +	struct kref refcount;
>  };
>  
>  #endif
> -- 
> 2.38.1
> 
