Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FE7D6DDDB
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 07:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1075010E06D;
	Fri, 15 Nov 2024 07:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmOESHgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEBA10E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731655236; x=1763191236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+v40QWwzqjgOF9PHdOT3ppRljrj30AkK3obH0V0pT+0=;
 b=KmOESHgwuWLHl+8e6rcgBzC5INJHOM+Tzav4AON2HXyDz7EmvgydxFpe
 XBzvD67Uj2/ZQf0yG07DRXB5CW3SQyjS5edhMQ26ay7vNqQ8qi3N3chyH
 iVMW+7QXKFFkZbMQTS0jH68TK/7R4oJVFJTDk9NUVaK2r6SY0URl+tvG0
 lTvug1/iBRuLAbb6TDKL1wfgcqa+M6vbCkjjX2GRlyZ0SqDEXkKH85S7t
 leMLGxRumEPP1a7H6Xb79qRtAhDGOr2MBY7FS8E166ev6gCfeXl8S/mMT
 GmDQY3tWYygpmzwYOdjM71uB0dxeqTcC96faqzSK3eaiY/+b/U2LJHy2g g==;
X-CSE-ConnectionGUID: 8nThVtn1QaGdZBxxMEJ0bA==
X-CSE-MsgGUID: eSTq/5tIQemROY7UoYRkLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42178375"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="42178375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 17:42:08 -0800
X-CSE-ConnectionGUID: ypy2UzzqTCe+fZhR9PNuoQ==
X-CSE-MsgGUID: O8eGypDUSZW5D53s0AZKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="88145657"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 17:42:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 17:42:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 17:42:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 17:42:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnMAZCz5V+wYGnmxKJUTchS/c4V9HW7BTDvaFCmIHhgPRhSbAMXdWtHpZnaw7OMfoPSTD8FmTakKEsT1jBKbcRgGxY9JIs1x2aRYTWdJ8svBytHezFK+bON5yiLyP3tYKCV5b5EGjVgjk+xZDW0e9fA9oM0IssWV5c7ywJDdU63L4zPMJVEyDeNd6e8yWhgkGVQW4L0Zv5uGJh59LDOVUfxl9SeEI4o0fschdKPXeeMCk+p54UUeO9u+lqk2c82+Qm9/q6sbMIUnE/IR0uuepLhPh8lAoImuMd6u4wpqeRbWntV9EgeIJVT7PNIUZOLzluxEiN/CUr/wPeQZyjwpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85Za8b2ddfHhFhgq8HGvkuP7rfCmpPTE8x7KoLpnKpE=;
 b=AdCvxezvoUrHxzq8zf6KyFs5MVqGPlEKjjB2rhabXk9+xDBaVq1wQrYW5pcOKRpuObZnLi6sRpW1vu49KaPaRlJNDOlBtxxrRxVBFOtgusart8ObBgDKNpEwI+j+Fmf9EwVRwJevD/qtObaWO/ZicFVIZ2ZyDJYW2nyzQJi8iN0tVhgaVjKqTvhwA8f9UPWRElsA+7vxYWJbVY3HX9xAu6gR5ES60ukLcTDR62m6eLP813wKGLuwb0MIh+YCgTDG2WM5I/jWP3hupWOodcbSfdneFxhTmCYKduijrqX59ozpsxfKWhvTKd6YuKWSMqMER8ApVuRrELyW/t9VpDDYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 01:42:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 01:42:05 +0000
Date: Thu, 14 Nov 2024 17:42:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Ensure GT reset is complete during ccs_mode
 change
Message-ID: <ZzanDvPKh7a7lQ/f@lstrano-desk.jf.intel.com>
References: <20241114133738.2125717-1-balasubramani.vivekanandan@intel.com>
 <20241114133738.2125717-3-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241114133738.2125717-3-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: MW4PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:303:b5::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d628699-10b4-4515-ed72-08dd0516b588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?njKLjkmlw1H4Xf5XgwGNl3YBRrIXFjXOT0bl6xi7V0U3h21NAZIyoB8OEFwd?=
 =?us-ascii?Q?FTaNY7paPV/9A8SlCOHVXwFytXEc9PbBIrKx7mRQ/22cebSl5S4Wz+NPtypV?=
 =?us-ascii?Q?WNy6dGdF3sxrrksSGGMI1Iev8Rt/kNCzNbJ36giQKFAnMYhgByre1l7adoGe?=
 =?us-ascii?Q?rATAl5C1KnIlRxnTcwENwh3sy3fdHLtwXMvnFJKtAWVITqGMt5D6JXhVNkLv?=
 =?us-ascii?Q?4+6xY0wTwctNzFes7f53Nexb8SqANB7ja4WnvFvKDnzLZoJdH720eE257RQn?=
 =?us-ascii?Q?jc7b4sWnBzBD38a7lyIVxeHstFarcB8w7Hai64cKJrJgTGkkpVatMhyuaBLJ?=
 =?us-ascii?Q?AqL9Ww69UN0QzdWP5mJUdpcUurQdvDxIKAg1XtPF/SFRV+OCPEtMbfOrt33E?=
 =?us-ascii?Q?xoBTXr5JmkDUFPYIQlW5BtlFd+Ottlkm9SyRWW3u/21fksTGrfCgCs2EArBp?=
 =?us-ascii?Q?5VIB1iRg07dj5btOkTVryaU7/eDnH0a6qAjhgjoJEkBKltxo3wtfk9NhMD2O?=
 =?us-ascii?Q?1v7nzFtIdpGw0D5eEEaD/2ThLSh/5SXzqBgNLnmEt4HKyFVwrBmJ5zJ96QPw?=
 =?us-ascii?Q?w6HiJMbpPrpgOAmNc/Mshm2OOJX7jmHqRtGis9wujGb2SKP5iy5g1NvrUkmO?=
 =?us-ascii?Q?fFUUnuFDkyn7lvXZhakxklfrCU+/HQDbi9s7tlbA0Mp1nlc0I6mLhJkOdOvX?=
 =?us-ascii?Q?a1db+co7nLw5FU2R9msFIztr7vMj1uPuH6XKv2DhCNt4afvTU1j7koBLg+nH?=
 =?us-ascii?Q?pFsav9EAiEp0ZdzMPxrWItVDBacfjqLpneo8Vaup765Qm8PFXr4Vz94rMAOL?=
 =?us-ascii?Q?e30oFKHMgoWRJiwol5Y7vZAtTtEZMkS0ZmmGhDOyu0m0KuP23Z6pzpweZVNZ?=
 =?us-ascii?Q?gglLiqS9yIBul/jlWnJ+A75/umVmrz01WbPQO7phZeZwUXR9GuJRDRhyQGWH?=
 =?us-ascii?Q?FPJvujST1Kd9CrSI9DdXzffBP0Mgz0esrMeC1UVjr6tQI8Ja+LcE7YAu7vCg?=
 =?us-ascii?Q?JXrtt05meDV0vZ0GcC/TTRsHul3Jq+MsoUjQo8nx7ciR+wbSoPVa9yuGGVy0?=
 =?us-ascii?Q?XO2JxpmdgjqGz2wMUVXZIEHLyQvUkAFTzU3Z4gCN9RdLxYVR0z4iAu+EQmeh?=
 =?us-ascii?Q?vhV3G80hYE+MaYUTsEJoYtNXRPsagsKjcOU0V0Hi5er1MxvvtjV9Ty4PUW+h?=
 =?us-ascii?Q?mRzekJTYuO37f6tjwcU9y3nM1QVVUAP/itff5CCR91dw5iy1/vBbkMiMk504?=
 =?us-ascii?Q?LlwDZvQBdt+rGEHoalQYVebeDG9tsBpL1SnM4zs8+ymtnTUyZP4witF42TX3?=
 =?us-ascii?Q?jGnmOv8EjUrzCmxwKk44UjaL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kb6yb7ixtUS6KRAes3lK/L+ioe3xBiXAE23GDIXmVc8Y3gs6UzVeDMsGl7lP?=
 =?us-ascii?Q?V/mKrzLX2YCQXq18t1jVW1v9ZsONcU8HZoZO6l2P3B0obUXSTXqc3J2gh7VQ?=
 =?us-ascii?Q?U5PPJhufaepxZNJcEqBAP5SvgIVedzX2adz5wQJJBNojCDiNCfBZllY1HH2x?=
 =?us-ascii?Q?/uVbvUPbedDu4OdlfykUMr3lK+uF2Oi9XD/G0Qvjg9AwABSIYJ3s4zKWwkRG?=
 =?us-ascii?Q?Bu/fE20xozGN+2jVhf/FZ44RSiToTQ8gXQzaWDXyqhTO6xxNN3yahXPiaOCv?=
 =?us-ascii?Q?lmmF9j11kQtKO4BRHzsnr1NfSHG/CXEiKjqfwfFNCOueTKiZocBHvRdJ77Ya?=
 =?us-ascii?Q?eh9qhLpIEN75u817ju2Lb9aUwAUGx+bn3O0w/LTeFg8s4mAMApsCSKIiig1n?=
 =?us-ascii?Q?NXhTVIMGvQdXttxw9lzsFLC1qT0XFXENSzp0DYEU1lnBp+3LZvhK6dU04Gfd?=
 =?us-ascii?Q?QxNO7Yfa0Erhnw04Ceu/vWCewJ8QeJZj4hOh3u5+xITUa1fV/4syWj7RXVb6?=
 =?us-ascii?Q?WLxB2kqlhdq5gMOyaOfSZVkGsiQa6txJRSXzijb7QnOH4kter8z0dxMIqEnk?=
 =?us-ascii?Q?V/uRvRSzw1IO206vrG86Bsdqr/0c1TjlH0P1pzvpsfMX186mPhiIeYPdAWHz?=
 =?us-ascii?Q?ZF6NvFWWEOzk1CARuc0fQuB6s3ihFLv2/qMcuYHtXqb9+8ofRgA6l4yjZXwW?=
 =?us-ascii?Q?9S/tpD3I5P70X56zIxiwj3fMM09+nuynACDPFnNFyhOfhlIuOfn3Tr6jY251?=
 =?us-ascii?Q?6JNkFF4uZYtXGuD0ynVolt8a3zfk0VvLX9h+9zuKoWGQC/QgERSPoa0HQ/mv?=
 =?us-ascii?Q?gIdM15u7WhTZ3gCIyPgGe+wIG4egWYuCz91bfWFotRHwuy90tpgYA6aZOc/h?=
 =?us-ascii?Q?W5yFY1HQj5BD5uABbnAIS42MLJJTUjaUwYkoGK2bvcWlY4COYA9Dy6sPtlhC?=
 =?us-ascii?Q?0tRFdd7D4r4nm9IBwIe+hWdHNb6nkDUhfDeeVBqepu6dM9aTaCr1kKHU9it5?=
 =?us-ascii?Q?K7YeYGOTRHgMcuGqZ/p8UjWzL3dP91FlDTvbywT6D0xTw6gZgDw4cUYWLlT2?=
 =?us-ascii?Q?QB0keMGX9Qq22uh72bPLatlRPjPbijT0M20WhjDkWrYujiRAzHAubURrY8xX?=
 =?us-ascii?Q?oaDqcYkO9QT3HouAqlnmTlMS6hF7aaVTnoc4D2Yp2mgkfRK1p67xcTTwzx4A?=
 =?us-ascii?Q?B8RV25oexsXSL3Cst2nKTrsA4ZUYzb9bwZVWmeWuBj2k6XD7fdoO3V9VH+kN?=
 =?us-ascii?Q?ahvQf4atY2qVSHwRTjEMLDpfopPAGlB4RbyG5nEl9au6OlUPXgbn91Ir6r6p?=
 =?us-ascii?Q?Oj1EwhsxAQYh1u68uBHKAHdgLz2WJV1/BLXpkqJv8J0be5wV8Z7DLri05Zet?=
 =?us-ascii?Q?CEy21ckbtnXiAKIrNRv0D0wLqpXN+YADLXG7omuQo3UDDvFGP2y8UjbYaO0/?=
 =?us-ascii?Q?WjjD/+Ay8wiWTy5bxt475VVBqFEuDTYvJk/645/7rSYzIjrzIXpuD7pZUsEx?=
 =?us-ascii?Q?saw+Qt2fNCPLiGhkG7mu8pBxk8gIa39VWYY5KB1KJg5FZswRlhdTu7rvfpjD?=
 =?us-ascii?Q?yxROWKvMX0CgQ75yn6uXK/t8xlOWhbrdw87NyADpc6VcsYYRgT1YxnstDdyE?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d628699-10b4-4515-ed72-08dd0516b588
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 01:42:05.1188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoPu1/mCP/LbmLuk/q97K9NJH2zpzp7+viXsxUL0xwAmwbf3Rvp36G/guMg+5MEUmF57WqWM78oEjRtwbvPaVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
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

On Thu, Nov 14, 2024 at 07:07:38PM +0530, Balasubramani Vivekanandan wrote:
> Driver returns from the ccs_mode change request soon after initiating an
> asynchronous GT reset. Userspace may submit GT workload while the GT
> reset is ongoing and may see unexpected results.

I missed this part. It should be fine to submit a workload while a GT
reset is ongoing. Can you describe the unexpected results because AFIAK
this should work.

Matt

> Make sure the GT reset is complete before exiting from the ccs_mode
> change request.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index b6adfb9f2030..9b6c15239487 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -150,7 +150,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>  		gt->ccs_mode = num_engines;
>  		xe_gt_record_user_engines(gt);
> -		xe_gt_reset_async(gt);
> +		xe_gt_reset_sync(gt);
>  	}
>  
>  	mutex_unlock(&xe->drm.filelist_mutex);
> -- 
> 2.34.1
> 
