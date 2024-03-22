Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637ECC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 18:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A271126F3;
	Fri, 22 Mar 2024 18:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNlckUe7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEB81126F3
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 18:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711132553; x=1742668553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y8XfjzWdwIMEo6ajt9CCYNR++ghedVa7jSnPvJro3MQ=;
 b=lNlckUe7xcYk0VMZ+pclwCTZ+48qkiIl77j6EKH+vyoiPrJeYaQq9Ebw
 KYNQcoD2HPYnsobYIs+gXE6EmpDsVLEkVNeIeT1UTPoLUPT1xzA7J+HR5
 NShiVhlrhIKr0uKO2n62T+LUlGDqd8LDPrusdTjBgrdFV2qRZWhVcXuSr
 O+ItEMTKgK9pa3i9CxWUehK0p0weM7AJqofQm9lSShXUApoDJf8ny2HwY
 a6lBOQM/ML0OLwcGAeHUWnOWoTWB5Bz3pG9n6Ms6k/sjf2WQdWQyZOXSQ
 6Znw/+CCAuHQn3Td8nlgu3dDRk/d95A4FjtnFwdIvOojg5dL2TVmFFG2+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6135193"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6135193"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19693200"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 11:35:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:35:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:35:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 11:35:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 11:35:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMq2NV064On8SIIpfLmpUBpb1sfMvWymAyCi7fdi0JO+gG+fMrv7ELrBDpkKPnf9ciGjXV+0KC1m59WQo4bFqalgOHhf3siZlNfw4qbBrmX52k469FhFdjgl1nIf64/ycQUTxA+ZyHjEdYrUGxSBU5FCT3ndpWjHP7g7d3DqHbGVFT7oujkzyLnHu2OLTQfyNoG6ti0WzkLpcoYPxV8mskgxZVQx/PTAjrEdtyCnofoqBSr3FRtdqMoSE93FPRg28dKx+tcN1pQaTgHSewi+HNuv+/9//ZEjKSy31T0m1zDd3GpX9WFyBWPL+Gem4P+sqfZAeKLLqGKyf4j9p/jAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8XfjzWdwIMEo6ajt9CCYNR++ghedVa7jSnPvJro3MQ=;
 b=d1SgMjAVx927OvYxUtqTHbVEXN4gOt3+KRDS1AjW9zOAmE2Z1ovY0S3kCjz+UUbppKKGTFCuGe28ANywilw70qvpk1/RXyMQiozembVAmsJB4Wq+H1cg8bva4u825LAvN544dCRvNCDPy+LdVzIQzOBlfIi3zmlWUXqMbz5saRYCfhSdBvvqQQ3dMb6Mv/Zh5PWC33Wona+gVhbuu+eO7/83JgiipKodJQOTs57J49A9o7PTfj1LdeDytRmgv1LtgOHOm9ktcp8i4cvDELoqeKAyKPB+iSUfI6dCKYKabHfJgMkVLK6mZltn6yF6fsieA6OJvAT94GiKyeMY4jbvrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Fri, 22 Mar
 2024 18:35:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 18:35:47 +0000
Date: Fri, 22 Mar 2024 13:35:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Remove redundant functions to get xe
Message-ID: <iki74coxnyfxg25putjbhja4kfsyfqrw545zhgjubwqpliaooe@ti35ppz6k6ao>
References: <20240321213818.72311-1-lucas.demarchi@intel.com>
 <85il1f5hwl.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <85il1f5hwl.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ec790e-bd2e-4af7-9450-08dc4a9ee457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BGbT08nTJPqwNApONEDzLzTwZsiUfITPlL1Q1jSYRXqM2iqAGH0XRyeTjjoP3J89NE2XL9sQa+yMuP1xOjnvO9JUUQ6NBmoy127VY10dJ4nUmidIBJu1p3tTvz90316Y+41BYnZj+UFGEyb4ZX0Cy4foX5NXakjJQUBse9RVjYC7x608zbVIqJgqoUObeFrxuTpTvI+D/du8qy89S8q4Jr0Z9Iwcu1J6ZJeCmxbRpCTQq0mKIFVdk3cXLmovbUm2dcR35AGJnNKdUytxVZYkhSfKa/AjepDgFAysT8z9NmNRMZR/eZ5htJR/uAW9AMh+sQjEEi+WuDqm0iGY5p4FXnXSVDC8GZwR/4mPRPQMUevH2fH/IoyEaLqsW/kgHV1cVyXnEIfYc+7WIHQYbmTvDLVO+wQvy9OCaNeLhMqoVhFIoV+XUEvaL1t9QuDTy+VuCEh4DTQvsrFdnHWBlEGKbmPzHtaN78lxmTFOuTSI8LDiMfRZ5kOGrYlnEN0F6Nzx4aULxYfPDLHs1uOW9qp8kWkC17Ozchd4RjLqI1fo79L3Seex3OLfgtx8/w/T8coKlUe2haIB25f8/On3ChuGxezZOsAAA4iS1PletteXS03GI63vPuFmJfc1Unmxsklr0/lIS/ZzBsebeUM8S1tJKcP47LLUvxI8qP8j9DE6ZTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p/TTZM5e25VAQfX/+3i0Iv8V0yAAfjkWnw3IEJm2BkjdMeP072sQSk8tR1Pp?=
 =?us-ascii?Q?P6CeFhs5fH2qXYZJzscZQryxRO7JpymvlVNtvmQBl/KLKqKdQLaF+dPAOfX5?=
 =?us-ascii?Q?LB7TbKrEqUtXdEvK9Ab03oqPUmNieLnFwLPWpmCNvcSV0Nol/s9L+NRfSrUZ?=
 =?us-ascii?Q?8tZdIJHJBAb/yY9Oekyv9Yty8yvu1KuY2dBbUgKo3Dr4tzkEWe3d1CKUJ7D4?=
 =?us-ascii?Q?7oWgVnUPxY9tCRZtlPzaJduCGEw2C6kHqm1uAv5kyglgVtJRcXQpdkshGPX0?=
 =?us-ascii?Q?btAqNUPyNtWDn6cCbbj5nxJP8hRgGdd0j/89X4GSIvn2nw6HzB3wSuXqVblD?=
 =?us-ascii?Q?0EsBdmhWa06i+smypZS87ctd1bPTdMZEfVaKG3tI5FcXq5JHGlbkqJNay7Op?=
 =?us-ascii?Q?POFYXaHqrBhlGughnnUTnn/CYR3lyz/hR3dY6gj0plnZn3lrzLiDwOQTbCCc?=
 =?us-ascii?Q?0E459cd1wg+nduBRwhl35bEY3xZ9hwwaRN986TQMZe0EBmF5OgyRiAGg0hWq?=
 =?us-ascii?Q?dBvQBJj+RjBzZ2c0Vmdzp55ifar4Z04+IpaO6Bxu8uBT6AmeaZ5UAq5yGZtS?=
 =?us-ascii?Q?rWX4P7ZQu+ir8gCyHR8N2af1Gm9nvyYbThgHBGeJT+COx80k3+B3J1aohllw?=
 =?us-ascii?Q?KpbKLHeedIxsPbNmNYry1tIEatWX8kpI2Ms1SjyzZq1Y2JU3/ZIDfvsOH3pR?=
 =?us-ascii?Q?5Du6bcpl7OJJMsU5CtSQ4mzgMDYhZekoyq/6YawJ60rfmrVSJTQhiLtV1cyK?=
 =?us-ascii?Q?hsscAqt4MPdHCO90GyP6iQA/M2QTT3TMZpEXfmLvugdlBrl9FfbZsxmnQxXz?=
 =?us-ascii?Q?LgUBAOLVDp+/OdneZ0Op6FxYIu8PpdkPNhYQlXnE7iudlh+ct8lVCqQ1OsW0?=
 =?us-ascii?Q?qxKcHCVdSVihovo1GpnEiIGKrGb6YOw3ZCmfqHcUstWXa/67yzB2TtLEBOfc?=
 =?us-ascii?Q?7LdA0pV8cLRJshnGnjvqF/sGIJNEmRUsn6HlM7E8/szsmQyYaFvvnCYCMgyb?=
 =?us-ascii?Q?2QcIU7A9/gIsSN7OQPZ3dkxIXqvfr4U1Ff2x3boPp9PhW9SErSsaiyxuHHK3?=
 =?us-ascii?Q?QlhMOc+/nWya6QIf6v7Mv18n+khKSo+lPAr9dX8uMnrkn2XqjkqCC+VoPjum?=
 =?us-ascii?Q?+I15OwnUUvt/1goV36XGgLRj0TRrkx9dKEjRWj+7e51nMjBc4kfoY76THPko?=
 =?us-ascii?Q?3QJPEfbhkrBBPyzM1W6iHhfa6/3pIVKlMvqSpi5ABgOPrfOuMTXWnLdowf1K?=
 =?us-ascii?Q?ehweCqCfcbHvmHQ7TavxeHaQzyjDlYxmNnQe5CuIiF8uylvJi4kr0g9MgGws?=
 =?us-ascii?Q?3r3Yb1o1dyfrz5uzFK297aIUldbl9uhuB3fnN1Y/e//iQgLateqtlyU6uQ6Z?=
 =?us-ascii?Q?UBPtRsAmlr9QXMd/vaETABRi0WWduH3PgcSL30aL+AlfCsWM1mTojz/Nd3nF?=
 =?us-ascii?Q?PdjtbZvDCnLRsgU98DxYTHSr7qF26DtFkoaaZ+IoQvZt6NzPP45heiYczJCz?=
 =?us-ascii?Q?yeJ8ckyS6RDa16YCQcIo5ixweUpljU6rMiq5CIfboZffRyxJYoPAVCgXW9l4?=
 =?us-ascii?Q?wFqEKhE8ctlikKChUeHbIBzyAQDSiy2W+WD9h2rsCt88u76Xe8/TA0zrwRDK?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ec790e-bd2e-4af7-9450-08dc4a9ee457
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 18:35:47.7827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gXCXLwFqRFdVyjprWKBjOmhjseTUN8Hr498z50yIEzrG63yQhtiXWdDvF0f6y0Ep7iCf8Nwp1ieIHpC14XnSYU/bHHs4vQHfiasDuQpKU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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

On Thu, Mar 21, 2024 at 03:39:22PM -0700, Ashutosh Dixit wrote:
>On Thu, 21 Mar 2024 14:38:18 -0700, Lucas De Marchi wrote:
>>
>> xe_device.h implements these helpers, just use them.
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

applied to drm-xe-next, thanks

Lucas De Marchi
