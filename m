Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FC6C5478C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 19:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F7110EA59;
	Thu, 22 Feb 2024 19:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N92BjzhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ECD10EA56
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708630543; x=1740166543;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8GTGv2gUGv/UZv2UCt5wZgapVn65BQbUUZhpQTfPKyU=;
 b=N92BjzhWhNbpwy6/eKosxKhTQFpds3XoMmucDLe/gFP3oZvm3t9gYrS7
 G5venUs+Djq2f9c6tSMRvc8QuejI+x+k8VAvBuMg4u+G/uczJ/6RSrFJY
 NZ6hFk5eDcHKKKz0GaM2qHuRtiMkdUvgDAP7w2Wcfihyt2nYAqYVo84l1
 mgFsdAWmeGzj0ZRhC95r8zIOZMh4Yqgg3bwHQfbwGDZ1mfjUM4FbhyW3d
 ci/xxeH4x16TrQXWaDU1TLawcRK7rN/GbZTQZm8n4LTG4OYk40kbd53My
 0y69csBIyN6L8fRYx67mPPAGiEq5aclibOFg/T6GsGqXubUdAaC4a8o63 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6712135"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6712135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:35:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5789722"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 11:35:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 11:35:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 11:35:42 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 11:35:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWQbOp0/vwC79+dIOCl2XEzbCJahXY7EZPcBDQ/TRdh+v+8Rbxr8cEyOTAQd4++XATiEZq3UhOy4jbnGjjyRyQ+kZppX+vgoKT4mgpD4RWVVWr3ndfip0rV4F0fgUqa4Lrwmd823mmHPWSxRgKwpyizyY3AD9B6Oldjw+2Qpn7rZpft07oMDgW2lbTCmw1xYeB7I6rV408NaysvWcdqIW2jGwviykenr3aT/po0urlZWIDSaklTQVpI8tZiyTRFUhV0zxbWk0NOB72VGqGFaC9A+Wg7lk9IjjyvlhT6GR1DxjtXgg+e95nuCOmidg178cugUQGn/cTypJsq3YQxYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obEHK35uG5XT4nIj5xg6JtBi07G8IxV9C0pXYB/jOn0=;
 b=jQxT4qZcW44Z7PtGtBjthBv5dGvEhJF+z040wWffSfTs/ce4zlbxM3wG6mne8luNlHFEbbslrVCCTFvdIqGDKO0di1fhybc8hk4tjPOybc5u3P5SbtnQuZJJmbc4xbswfpj72019u6BxrouMkXf20CXLBDJzFWTiBiD8/h+5AwPjkJC9/Fpsxd16DxAASbxyupJ0E05bGWnUZIiZMYiZvZoAiVvbnvEJWyY8rz/HSjv5JCeI0T0534QwTXnLQ6X8fyc5/ylspA/Mh3Cid3r4x7OYa2Xtu1WzAR3ALvWMuf+kAEoMGdh836G2D3uuxvqfqGks5RWVrF8vKX7s6mZ49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 19:35:39 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 19:35:39 +0000
Date: Thu, 22 Feb 2024 13:35:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH xe-for-CI 2/2] drm/xe/guc: define PVC FW
Message-ID: <w5o6tngvqfb2er36azlfwgyfhnp64kkx6whytghb7sfxebfsnu@pydlg3vozih6>
References: <20240222190606.724747-1-daniele.ceraolospurio@intel.com>
 <20240222190606.724747-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240222190606.724747-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR06CA0063.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::40) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9015c3-6d31-431a-437e-08dc33dd7337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ML/BxfgSZ+R13LckM5Bf1xoINaYyRpXq/i1b6UwMYH+oFsQISb8oMWBrEU5zxRT2n7S5TOzp5TiAhXE19T1iju51oGAcvd8zihP7XMlkIYx8jkmUbNe7NM1fCfRVwTi8IrzniiW7KfUdouToOYQRDYwVomzI97ABAqipEYXcnqrRbUxXLnUQUwtqm/91TBQatBi6eIIWUlpt7Ay3sVrs0iMtw875YqMf6rF+kC6bGoFUgdxA998SCG/PRCiMiSf99wruqoAZoC0KlSziGjqynpt4fmx1bBcZ3cDYN3zNrBAxcpK/BwofzuKY+JXu3wr4CWP48jpJcYJrDl8qwjJfZwQOCMqxYexkYf+UBMzc5N/M490MSSu9rqEB2mGvxMDi5+3BjYzmX4JK388b1XLJnYy0jALdiJnFXaED9hTH3i3d8WPsZU9tnftolO4cpUbM+kMaR2CO9/GicIWMIUjLtdjJCa0UEXvVFtXTTeX22UzDrV289YMsvKe+VCd7hTZj/Dt63NMGf1MUGfk4Az6vMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zKGOD3mL1DQhxmEewhRL7h2q3X+oqnEVsGmClykqy4gnyP5YbG/DSb2h5OPm?=
 =?us-ascii?Q?GMAwVl02TyPUi/xJykV/1dbeNs0fcXmLXfToPorliGm4UIYDX5gs9bCJoD4B?=
 =?us-ascii?Q?fAx6mP30Bb03j4+QP+Xmqk/E90UuJBlKXiZXqIFXrbw5Gq5RUfBXJOHi1KI8?=
 =?us-ascii?Q?ISPUxy42LUmasa2TXZw6as3Pp/8QpAETtna8P9i7FPTRhA5EWpXz78CqzPm9?=
 =?us-ascii?Q?DGKhofjjqMZ4wq6xfFFfk8GuZyX3kPUdYRmuR6XwnoGkYK42r23t5sQ2Eoty?=
 =?us-ascii?Q?JJJ0eK0eO3zMSiMXDWWR331BILwn8412OD36Dc5uwotbh1pPleH+G19qXMmG?=
 =?us-ascii?Q?oppZM4wyxW9WFyvljjGkDTbK3e/gk1M4KJx64TkOJN5dXeJABzCnPqSlP62Q?=
 =?us-ascii?Q?uxieS64BupSsfONVQApTJZjP96czMHpObgDZNihT6DLRObZzmS2E3WcWLzuj?=
 =?us-ascii?Q?wkIP7TZlT0lH1Z1GECYjj3MUPYOk78ccso2RvbOf72AbDbbj/Xy+Pz3Er5gQ?=
 =?us-ascii?Q?FocG1BCExqvMwThtFqPccWH5DkLFBmTeHcE6SLOSJy0gyyGmaXyFwAzSI6fB?=
 =?us-ascii?Q?+DJInhFDs31lKpjnYAFY2Su1+/hJDKzsLG9BA6U7RJityI8rN/PqDHLXuTQo?=
 =?us-ascii?Q?SPF5ZBdMunqdOSz+s8bj4x/rQQcv5dKWTYgiIVWZJQyUeecJ2AsJLpV4fjVz?=
 =?us-ascii?Q?KWMwVmWUYXxTcDCFFsCraSdTfuZ9isWLOEVOxZrP7qG4p3uD74kXc0LDDDrp?=
 =?us-ascii?Q?dyWUgpmtIrJWY5LvttPm1wpRKcpLYRPcywAnmNXjCa9XAU5vFnPE+/dH4U/3?=
 =?us-ascii?Q?TDHbx9F/wrYa2AtndQO6SngdFuDxktww4y3ojhtY3dNlcXPTh6qUbODkqhFU?=
 =?us-ascii?Q?XUpjC+4Q1Tu7Oolj2zX5mUemXv1gdmqcyKgTkd9DBuhC5kKg2Q+of5pqy5BB?=
 =?us-ascii?Q?uLIrbDHxl2/i0+sG90TKXU4w0KTHUUvYhAFtA0fcnXU4UP/YWwS0R1NviN3d?=
 =?us-ascii?Q?5vf1xvuiTti1pdi3UDsmseGqCoRkAcPIEeyNmA+Rfovf1BDoKoewwCBkKMOd?=
 =?us-ascii?Q?3rAPsu0X+VN74TmhEhnY5fdl+DD9AF8POHzvCGP5susXy1rA2dIsZqxAj6ZX?=
 =?us-ascii?Q?WfK54VXSpiulkdrHBeNI+lgBZ+su2oj9kogipZNPZuAurLWXxWVQrpPYtksU?=
 =?us-ascii?Q?6ROdQCU3SJBc0PO7MsJTGazU45Ag+gG3Odj0cvAKFey9J+IeUkvlm9kxr6nh?=
 =?us-ascii?Q?MYqHdgx/E5tuH6In9TPF/TCenpeC86MP7VmE5KU7BWxPR9Lf9LUf/oTqyGgB?=
 =?us-ascii?Q?sUjtuqAwD8pllAfVr4V6x/657LFSCA6hrfAOneQQrQ4WTSAzT7pnr/i6gjE3?=
 =?us-ascii?Q?pUt4W2yj9aEXepU5AGKAqZLdyg6qAXAwCahmW/1rr9HVLsftFd54ekwhzTNu?=
 =?us-ascii?Q?vQ5x79mK3yk9f1p3gy8t8po1W9FHGAKeVnu+97J2vyXIWXfq2yMHDts457Dl?=
 =?us-ascii?Q?SY3JJGhqmxWBjj+nqwKhIxjURvYtzlujnEq4v/I4QNQOjhzF1Zx9xbVw0bs7?=
 =?us-ascii?Q?5rLycHCQJGv/L/D4cheZzWtPrIT0nOVMFJexSowhrTp0AdX1CChmuBwAaidg?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9015c3-6d31-431a-437e-08dc33dd7337
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 19:35:39.5877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzdR2BDwQ5qvzgHsCEZ1hsGAcTovSnWJgUcvd4l5D1L1lI9WVRmNQYJeMqDoa8ywLO8j5cgKjBQSQZa2ZNtXVJNZ+V0bhlqEvwCRkM7IIxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
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

On Thu, Feb 22, 2024 at 11:06:06AM -0800, Daniele Ceraolo Spurio wrote:
>Add PVC GuC FW definition. This is patch is for CI-only and it is meant
>for the topic/core-for-CI branch.

it's actually topic/xe-for-CI, but I can reword that while applying.

Lucas De Marchi

>
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1155
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index a9d25b3fa67c..7751d6ba6ce0 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -105,6 +105,7 @@ struct fw_blobs_by_type {
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
>+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 20, 0))	\
> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
> 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
>-- 
>2.43.0
>
