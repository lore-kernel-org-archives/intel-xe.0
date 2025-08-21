Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6F2CA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 14:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F4910E9AD;
	Thu, 21 Aug 2025 14:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMUymSHi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF3F10E9AD
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755786880; x=1787322880;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dbASVfXuaBv64r8d4qhCvRUNbY+6CrnmvP+rYsomx9A=;
 b=bMUymSHiEfk3DcS4X8L2plkD7og1m2JjmhCjwQOOPRjLh2ZyCqUJuuvz
 blDSozE4fjbARIzYCnR2tZoOK/r29+FIKFA+94cazfbY5H+jSz6qNwhOl
 Wg3D0jtLaDHAFkwQTluMh397EfGuwIYsQWXuZaXK1AIjBwBfIlSeWWsYJ
 I5s+aD9oBkbKJMSQusLFGZzP+IF26dPWERbn4sQed1sBI4jtZ+B5mP9rx
 3pi8O7V0GmcWLNfOcaHrgdiB0DX2PvAdvgq+/ALdmZ2lGpV9whh+DmY2d
 MJi4SrmBKpf1BDu3WT0eehE5ia5UUqC4iqmz5+/6VkN/8ljqvIpCg5/m4 A==;
X-CSE-ConnectionGUID: X8cGN5T0TxuJN101ew2K0w==
X-CSE-MsgGUID: 8Lp7NKm1TR2k208fwwecww==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61908148"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="61908148"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:34:39 -0700
X-CSE-ConnectionGUID: 5tGF8hHxS1+bGZWhOZbtZA==
X-CSE-MsgGUID: oUXcS2+1Tg+2OrctyWMhGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="169233494"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:34:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 07:34:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 07:34:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.40)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 07:34:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy+vHN4h0ZvXfjTl2a7aE5eLOq5LuOD+fNCSSkYSGBQuUKmQp1jGlXMI0+obj6GYD1C8VXianYx7TWHdRKSbntvJAevzCo7d7cufgk6guSFfD0CpPEhkYhlaB1ugBMWwt0uNaaSzE2pVDZKSDFw2hSHcnFjD4XlMBLG2N+55n09E6n0zd6ZGBNN+NJSvu6NvdxCaNa/PKG+l361vm43szZC6Wex6rN52IL8ZGBFSScAr/jpnkHG4nIIDYR4fakU/W2VY9gUSVxF3J+mw8amqLI+t3Kb1KbnVpGP7Arppu32Sj/r+EaS0Gr4j4eJkLymLkWlh7MXMPQzGZ+KJUrP/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOfMtZWtJQG8lLZbgks8DvfLVDX1MuivVDh2XNpW80o=;
 b=om+khTeGS7BUpprqIXl5AIiT2vE7bV4XIbxADtMbnHtxTtsKNG/ag6rho+uqcujI7k4Y6H/Rx/iZbpPgLH6XbBrIN7taWYEZq6B2rKmwLRClGh5F7DV4das0jelrH/6PzYhNgBORltnZ9til5rNweVJ7nxvgCVWWbJUVjAEqOSX1xU2EqMls6+efqTiqqfth4xOxi5my9gs/8fmrVECxzOPErlHlr+pQazuQMFzm9B+dqLpbOQLe0bLMaCRqEVlu1kMSYRESETh915we0Ifqa9e5k5bb2rbtRjvkfLOG0PzVdsMw20hLK7/sZOAAmleYA7kEfJxUFE9hxFYHq4WHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::853) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 14:34:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 14:34:36 +0000
Date: Thu, 21 Aug 2025 10:34:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe: Assign ioctl xe file handler to vm in
 xe_vm_create
Message-ID: <aKcueVUyHRQbnayC@intel.com>
References: <20250811104358.2064150-1-piotr.piorkowski@intel.com>
 <20250811104358.2064150-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811104358.2064150-2-piotr.piorkowski@intel.com>
X-ClientProxiedBy: BY5PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:a03:167::48) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: 94be4fe5-fcd3-4573-8954-08dde0bfd9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LAzulBx4SofdeCk+ty9q4M/ZIXn+5fZf8Ceq7xJ2mr13RIu/xXV49fkclG?=
 =?iso-8859-1?Q?9qGVY3Wc0vddWQYEHKsRzH4eH6ehT1jkMM7jpJshqti4tVp+mGeU9sZTtd?=
 =?iso-8859-1?Q?WwR9iYr+BGi4F5BS83Y9p2XQXTmGkQIrpdvbyWYr90OXiywokwCQm6EBaE?=
 =?iso-8859-1?Q?MAk7gwoMWGIKIqTh3jlOcxD7v+X9b+C3iZOJW4PpIvEf8bKcX1irRlN2y3?=
 =?iso-8859-1?Q?9Pg6ueaM9T+ZdxCF6vupXMMbUR/cEFHmI17W0MjJ5XDP0tAm7/Xfmqf4qb?=
 =?iso-8859-1?Q?RJyQy4lKL+8kUdGv4nsWU4yqFf0CNRMh0VpyQKUDKRiOrzHj38DbVRhEY2?=
 =?iso-8859-1?Q?Xmbgln9fG7rbUziExHr/Nkqu+rXU+cE3iE4l8Loq3sJ8c/MlVr/JFMoy1d?=
 =?iso-8859-1?Q?GJj10hxAfcb8XijWKmV64j9GLduwBktX228AURIBl1ar+Pmta2keN4Hbcv?=
 =?iso-8859-1?Q?DLSEb4hLTFBxGXdszQAbePKbGVtBLN6SmikD09NtCAGi5Zj1P+PfwjR+9D?=
 =?iso-8859-1?Q?mVNpgul2qZHaJfwQNb0hkqKV/hMXV6OC5B2987ztNvmVHId3iPzZj28ykz?=
 =?iso-8859-1?Q?rR0N++Nf98mNYy4jsh7hRZGC7a2/hrrT8rNEggwE9zGXxFCxtV9BPADrm/?=
 =?iso-8859-1?Q?Nhwy/GaYFkiHtREStnLDTVbYiMBwRPCKklOWXzxIuDFyvCPWyjqO+wPTTD?=
 =?iso-8859-1?Q?sNGaRFvShEPajr62oLfp2tfEr5EXJk6m4010+NNlw5A/Nr4XY9fhK2khSZ?=
 =?iso-8859-1?Q?a7Bq0yLaQ0U2uQxbNTMMggCygKEeVVz2gX+9s2ximod4nqri3lC80t+V5+?=
 =?iso-8859-1?Q?d0cRDBXea4sRe7gBmDCHWoxq5/7oWKY/5N1friu9TMXAyIglGGjGJAdHga?=
 =?iso-8859-1?Q?pEVQvGurs52qKkH1PGVfg59jxRiYePm6ySATkpBMwYj8MpltbkJYReFnVA?=
 =?iso-8859-1?Q?CkpO9k9wuJ50w1Zvu11hl/1StRLeA9IJX8IxpCB8apqHyWm43b51jLOlTK?=
 =?iso-8859-1?Q?R7Z6y4ZjvEauoVAUCBDG5gfJvvPxK7CG7MiBt1920n+JT8WtYpfbMhTlHj?=
 =?iso-8859-1?Q?8dnXd14vk5is7NC4D83t1KOOnq8DK5QCkZnLt5jPKqWAcVN1ZaxgHPiQIw?=
 =?iso-8859-1?Q?vTQLiIgD+KoSvWTdZebfe29US1v3UX06LSpijy1Cs5fLYYugczBM5h8W7P?=
 =?iso-8859-1?Q?DX0v+4FoYav4srnRyFA+8ydOtybQuafsCpB5Yn3N1hRdKje5gekohVzthx?=
 =?iso-8859-1?Q?Jo4HzQzO41XndKL9eKzIzdlX8D0wyvFwJcsD0Dah126RdkmIP6DjbE9d3R?=
 =?iso-8859-1?Q?Pl2CdPQh1x39HW2pnFOqSp1ayZDHwenwdg/QwhBwdCSnuPQIaPDa8z06z0?=
 =?iso-8859-1?Q?pz6Q4ayc3W5B9NaXMq6cwQ336HVw1K1LbGjXy4o8ZgtE0qFAfIHsGnMiz2?=
 =?iso-8859-1?Q?XY1byYsAlJKNsxA4lQUhnYl/A+DWI/uIlnyQtMbboPAGtFaDzAFrzp88MZ?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TPcr4warOCFbmtWZH4NDpWLFbfqYHL4qpOneyu1rbjs78MH0P1+OGlILlg?=
 =?iso-8859-1?Q?Nyg402bRveM2n5apkaIp1V5OVIOVRTbp0bJB5k0doVFzRXMMBt4l7tXe/4?=
 =?iso-8859-1?Q?732rqdII55JB6YwY2aoU0Mqt5Y4D/N9mD+dFxF+0TJEINRm1d8XbvKwLIf?=
 =?iso-8859-1?Q?1UIkSKJkpRp3nGX/o+KROutGLfRV5R+DvWO+h0VTpLgkGuuuu0nfK8Gxh7?=
 =?iso-8859-1?Q?9sw6CtpGEMMNZNZtHJ6fKGagONeEBk+7/iB/JKfYNyu9jcqANlFytkCbTJ?=
 =?iso-8859-1?Q?K+V55eSLK4s54+gQw/SXrJpuUwwVTIhisDW/R/hUfqnxHHtaP1Wu7gnyNe?=
 =?iso-8859-1?Q?f5M252OrZyWOLxZQLTlCBoZw7xl2GwNZkRlqMEuUpQukOCr5gRMsw/YXLn?=
 =?iso-8859-1?Q?6ZblFCe5J/2joC3Ttb28kcuhr3MbGMWSL6czZrfIXgDRLm+laUp1jQlx7J?=
 =?iso-8859-1?Q?bj0qZKnlFLgEfwHDrM5By08DHSL7vlZOnOu2K08a1EZ+K/WESETBb6U+qs?=
 =?iso-8859-1?Q?Q6ZkpmwXX61cS/2jc2RAhKsj9MAov9sP/Wj3zZezQmFnDvLoabK6pMCDGQ?=
 =?iso-8859-1?Q?dFkL+OIJ24j3jufXQbAzLqrgRqscrta3u7xmkBdTTiaBYMq72thpCBrnWk?=
 =?iso-8859-1?Q?6hRDhFLK+p5K9A7lEaxMpJ/iFQkPaprlcQFMNS45vgIdlxFNf9iahd81gn?=
 =?iso-8859-1?Q?1I8YNUDywFH6Fp5VKvFoYC9qO3y6p57hpzSutCElnc5G8qIddnYD3IdWD4?=
 =?iso-8859-1?Q?UZ5EdcijzvR2MKIn9OD0MbSLDx7FxAkYFr3ds9lDqCje+kyEs8C/q1+Sl+?=
 =?iso-8859-1?Q?ep9SXxHsJyqHM6c0xhOg56obwOs9kg66kTGS6C1CCRn9gBaoq4oCtMdsat?=
 =?iso-8859-1?Q?/MNmWAuTu/VBCRzR64PrX7kbqt5jfrpNMjwic0MZ+atscwGbxcY9spEyqk?=
 =?iso-8859-1?Q?HM4wDGCfaKCJAjcm9ZL+eq7tb+fsoDArdGgXvENYk/K3H4q9SrEEEmHBpI?=
 =?iso-8859-1?Q?3/nH2qeUY3jx0XPKYtA/9xlMVgReoxedlkVXfIKBx08QksXvON5lSFrg2v?=
 =?iso-8859-1?Q?Bluq/eNm7pH64wSVZKU9iM3Y5uyN8QCjdodwglN5mtTMQ6frQjpIiFGaAo?=
 =?iso-8859-1?Q?r7XkLVn+zvwMuhYI7tKMWw+MslGYwSehtu35cWOlw+jJuEhWaHlh0cexSZ?=
 =?iso-8859-1?Q?JlNYUOa5GLHGELNLBRFEWNocszGDqSJ4gs+W2YUltJd+l2Aakb6DprZhjd?=
 =?iso-8859-1?Q?btBop9bLgkNSQoUvDsF+6GZm6r47L7CjxeMpdIxUAKtv/wSRtM0wa9OGK6?=
 =?iso-8859-1?Q?0kwKTA5cNW464pGM4nOI0ZlsF6yrp0zu+uFfpcPKA8Y0dVJz7HJZ3Tz997?=
 =?iso-8859-1?Q?E0zoKuNXau1fjdtyLPjO9bESZlxja3xZ7d5r7JjsqGmKlgdmnMVKa55tuu?=
 =?iso-8859-1?Q?4wdyQnS+s1KavNuAUmBCqwBlvY+2qlqgHVWi8RyhPPb9dqnGHdcC2VOUDQ?=
 =?iso-8859-1?Q?qgQ6xcE/MU8nf7v62Ly5Byd696qX8qmsPP4x7qhoxmc0OVgdUaNy+5BT32?=
 =?iso-8859-1?Q?AD4afA9cV4m53TvsZ9RlE0q0uMBd4vMJLT8xC0dSijYhLJuYGaiROdk97q?=
 =?iso-8859-1?Q?LpRJ8JYVEDdZxlXAIPR3NabP7yP4jdsFnD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94be4fe5-fcd3-4573-8954-08dde0bfd9fa
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:34:35.9797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Vz34rDJPjvgidTsAYOJjLe74f0UeSjn2txfMZqjYTz9Jtt6jzimU+PCZ43FQk0yoi6J0P73qnwXsiDoG0Ww/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
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

On Mon, Aug 11, 2025 at 12:43:57PM +0200, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> In several code paths, such as xe_pt_create(), the vm->xef field is used
> to determine whether a VM originates from userspace or the kernel.
> 
> Previously, this handler was only assigned in xe_vm_create_ioctl(),
> after the VM was created by xe_vm_create(). However, xe_vm_create()
> triggers page table creation, and that function assumes vm->xef should
> be already set. This could lead to incorrect origin detection.
> 
> To fix this problem and ensure consistency in the initialization of
> the VM object, let's move the assignment of this handler to
> xe_vm_create.
> 
> v2:
>  - take reference to the xe file object only when xef is not NULL
>  - release the reference to the xe file object on the error path (Matthew)
> 
> Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
>  drivers/gpu/drm/xe/xe_pxp_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_vm.h         |  2 +-
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ac9f4d4988d2..915fccea7aeb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -411,7 +411,7 @@ int xe_migrate_init(struct xe_migrate *m)
>  
>  	/* Special layout, prepared below.. */
>  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
> -			  XE_VM_FLAG_SET_TILE_ID(tile));
> +			  XE_VM_FLAG_SET_TILE_ID(tile), NULL);
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index d92ec0f515b0..ca95f2a4d4ef 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -101,7 +101,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
>  	xe_assert(xe, hwe);
>  
>  	/* PXP instructions must be issued from PPGTT */
> -	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
> +	vm = xe_vm_create(xe, XE_VM_FLAG_GSC, NULL);
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 148a2425006f..157e11bd2121 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1640,7 +1640,7 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
>  	}
>  }
>  
> -struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> +struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  {
>  	struct drm_gem_object *vm_resv_obj;
>  	struct xe_vm *vm;
> @@ -1661,9 +1661,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	vm->xe = xe;
>  
>  	vm->size = 1ull << xe->info.va_bits;
> -
>  	vm->flags = flags;
>  
> +	if (xef)
> +		vm->xef = xe_file_get(xef);
>  	/**
>  	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
>  	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
> @@ -1814,6 +1815,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>  	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
> +	if (vm->xef)
> +		xe_file_put(vm->xef);
>  	kfree(vm);
>  	if (flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_put(xe);
> @@ -2097,7 +2100,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>  		flags |= XE_VM_FLAG_FAULT_MODE;
>  
> -	vm = xe_vm_create(xe, flags);
> +	vm = xe_vm_create(xe, flags, xef);
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> @@ -2113,8 +2116,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  		vm->usm.asid = asid;
>  	}
>  
> -	vm->xef = xe_file_get(xef);

Please, next time ensure that this patch works by itself.

Removing this here, without removing
xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);

that is below causes a big boom!

[   16.485311] WARNING: CPU: 10 PID: 1650 at drivers/gpu/drm/xe/xe_drm_client.c:135 xe_drm_client_add_bo+0xb0/0xd0 [xe]
[   16.485416] Modules linked in: nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib sunrpc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ip\
v6 nf_defrag_ipv4 nf_tables qrtr bnep vfat fat intel_uncore_frequency intel_uncore_frequency_common iwlmvm snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common s\
nd_soc_hdac_hda snd_sof_intel_hda_mlink x86_pkg_temp_thermal snd_sof_intel_hda intel_powerclamp soundwire_cadence mac80211 snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks soundwire_gen\
eric_allocation snd_soc_acpi crc8 soundwire_bus coretemp snd_soc_sdca kvm_intel snd_hda_codec_alc662 snd_hda_codec_realtek_lib snd_soc_avs snd_hda_codec_generic snd_hda_codec_intelhdmi snd_hda_codec_hdmi libarc4 snd_soc_hda_codec iwlwifi snd_hda\
_intel snd_hda_ext_core kvm snd_hda_codec cfg80211
[   16.485452]  snd_soc_core snd_hda_core snd_intel_dspcfg btusb snd_compress snd_intel_sdw_acpi ac97_bus spi_nor btrtl snd_hwdep snd_pcm_dmaengine btintel snd_seq btbcm processor_thermal_device_pci irqbypass processor_thermal_device btmtk snd_s\
eq_device rapl processor_thermal_wt_hint iTCO_wdt snd_pcm r8169 intel_cstate platform_temperature_control intel_pmc_bxt mei_gsc_proxy mtd bluetooth mei_hdcp mei_pxp iTCO_vendor_support processor_thermal_rfim ee1004 mei_gsc snd_timer intel_rapl_m\
sr intel_uncore snd i2c_i801 processor_thermal_rapl wmi_bmof realtek gigabyte_wmi pcspkr mei_me intel_rapl_common pmt_crashlog spi_intel_pci soundcore i2c_smbus spi_intel processor_thermal_wt_req mei processor_thermal_power_floor processor_therm\
al_mbox idma64 rfkill intel_pmc_core int340x_thermal_zone pmt_telemetry joydev pmt_discovery pmt_class int3400_thermal intel_hid acpi_thermal_rel acpi_pad intel_pmc_ssram_telemetry acpi_tad sparse_keymap loop nfnetlink zram lz4hc_compress lz4_co\
mpress hid_logitech_hidpp i915 xe intel_vsec
[   16.485496]  drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_exec drm_gpusvm_helper i2c_algo_bit drm_buddy ttm nvme drm_display_helper nvme_core polyval_clmulni ghash_clmulni_intel cec nvme_keyring nvme_auth video wmi pinctrl_alder\
lake hid_logitech_dj i2c_dev fuse
[   16.485512] CPU: 10 UID: 42 PID: 1650 Comm: gnome-shell Not tainted 6.17.0-rc2+ #5 PREEMPT(voluntary) 
[   16.485515] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIOS F32c 05/28/2025
[   16.485517] RIP: 0010:xe_drm_client_add_bo+0xb0/0xd0 [xe]
[   16.485601] Code: 98 02 00 00 4d 89 65 00 48 8d 7b 08 5b 5d 41 5c 41 5d 41 5e 41 5f e9 bf 23 cd f4 be 01 00 00 00 48 89 df e8 b2 81 3d f4 eb 9e <0f> 0b e9 70 ff ff ff 0f 0b e9 7c ff ff ff be 02 00 00 00 48 89 df
[   16.485603] RSP: 0018:ffffc9cb4c14f9c0 EFLAGS: 00010286
[   16.485605] RAX: ffff8971c3582c00 RBX: ffff8971c324c3a0 RCX: 0000000000000000
[   16.485616] RDX: 0000000000000002 RSI: ffff8971e6453000 RDI: ffff8971c324c3a0
[   16.485618] RBP: ffff8971e6453000 R08: ffff8971d3c578e8 R09: 0000000000000000
[   16.485619] R10: 0000000000000228 R11: ffffc9cb4c14f940 R12: ffff8971c3582c00
[   16.485620] R13: ffff8971f2e56000 R14: ffff89720eb44000 R15: 00000000c0206443
[   16.485622] FS:  00007f9d9769b640(0000) GS:ffff89818821e000(0000) knlGS:0000000000000000
[   16.485624] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   16.485626] CR2: 00007f9d712ab620 CR3: 000000011dc48001 CR4: 0000000000f72ef0
[   16.485627] PKRU: 55555554
[   16.485628] Call Trace:
[   16.485631]  <TASK>
[   16.485633]  xe_vm_create_ioctl+0x152/0x3c0 [xe]

> -
>  	/* Record BO memory for VM pagetable created against client */
>  	for_each_tile(tile, xe, id)
>  		if (vm->pt_root[id])
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 3475a118f666..2f213737c7e5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -26,7 +26,7 @@ struct xe_sync_entry;
>  struct xe_svm_range;
>  struct drm_exec;
>  
> -struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
> +struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef);
>  
>  struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
>  int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
> -- 
> 2.34.1
> 
