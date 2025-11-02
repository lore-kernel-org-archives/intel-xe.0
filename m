Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4277CCF9F8
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 00:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4110E04D;
	Sun,  2 Nov 2025 00:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFS1Pm9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF7710E04D
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 00:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762041934; x=1793577934;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fyf9+BXA5cjCAL+U1QqfGpmyyEmoygyMB1QxWidJN/o=;
 b=JFS1Pm9ZnJ2OSRC7BkbdyJ3ydVOogyjz2PfpfgNFWans4N5ZZA/gk8TB
 NjXlc0x9Z0s2cehyDvZn9k09eihTYDVNgDdvoRnPylKRG1/uaN/eiMdMA
 6qdBYwVrZ4FkKCjlkdD/PYADkTEKLb05tjbOI0EZl6+if/1xqwuwvHU8D
 q0McEZykMl2/Gj8NnCc/tKLXpBiZgTHPW8Nbtmmz6FS6roYyZTczConHk
 83lR6C5BPwa4pWVo+Ra0q/jwjVmqTjx+auMaWEicIaK4/IrPEaNEgEjgH
 wMlGut3WuhhD/toQSdimhKG3Lz35fmp9RhXEwCgB/QkfauNQJm0x8EMJv w==;
X-CSE-ConnectionGUID: T0Z1IOHDRpKMlYEzQi2lwQ==
X-CSE-MsgGUID: ffwlnMQRRP2ZPHu8Erqg3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74841737"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="74841737"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 17:05:34 -0700
X-CSE-ConnectionGUID: XYqCpdM6Tu6pNVh/YbFRTA==
X-CSE-MsgGUID: /pXeDA03SeSUMK3A3HzMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="186864743"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 17:05:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 17:05:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 17:05:33 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 17:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RE+Lm/LHSqiCV/7umcgxc+F5phrjmbDzRPrxS6K9QSW8b8LpXn2th+b016Nua0ompa1OsOKgCs31lkPhn4PMLD4/u2746Zo59bapjRbE/sVAok10eGglEvtbVYdgYtCgBS67wIzuvOnqWA8nDUezJ2nv7e4QSR2quEUOM4XXh/P+AmCLIbVcrkhv/gUcaKvwE+8X9g8b0rAuqLON1jzf7Pd4G75txF1e7L07pRec2x9hBfOZitqNTm7dqP4+F1qKakaFT6HBmqWl1QtbLy3+pA4VT/7HQtEek8HNorC56h6e07hfj5Jhto7p0xnpqEB9ux1ri2uK+uYUogPD7MjJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vexnsV0WHFyS9Y0LsIrC6veEG4TwxY9PvNLI+sBzxrU=;
 b=dKTNuhIMXP+NX9eXkNr5MK6c5Y5Zq1RfecRAR7vfuwFDJcn9EXA7XF7eNoN9xYYOvb22aopEzvJBLWlyaB2nvF3xs0wz73gM2mx4XPQDE0sA6q5U9tf96lDVHb2H1HvXovH/7ValfQ5NvQOUdPIpU8UOQGAf9z1b4/xIPibkZfR6GGyEruWqZXyDnfGB7E0MwPn8314e+03h5BzTIHLGV2LcdY26Mx8uL0hYLUekM20ylwOO4Dn+ck99LH5MR29ODxYmtjY49mEmFFDiQCqFFvi8tLT6kp8Zlsd41Wsxrrsp+d9QvnqrSlMMtFcs1E4G31zuUpB84yR7eLxAYQtxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 00:05:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sun, 2 Nov 2025
 00:05:31 +0000
Date: Sat, 1 Nov 2025 17:05:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 16/16] drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
Message-ID: <aQagSfk0/es8LESp@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-17-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-17-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR11CA0049.namprd11.prod.outlook.com
 (2603:10b6:a03:80::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: ab12211d-1b01-40e7-4f3e-08de19a38981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b7B0nBBqsg8texYHkjwcsyfwTHIhgFDPvjxb3sEG4rDNXoFEyhiVwfJAE3M8?=
 =?us-ascii?Q?6z8RSSBDW7deTOaTS4dLVIGL0AnePZjrTtygnRTI7nLujmKOsA646UJJc+kR?=
 =?us-ascii?Q?cmox8XXHmo5j/5he1TId35PY8IyT5XmRUdxOcrR2zoVW5XTvV1CDMfxP6WKY?=
 =?us-ascii?Q?4+yMoBK90NfMbO3xV7OTNbYr3MXj6dULWEfJgTc7qJ0JPWoIwPGUNmAuv8CY?=
 =?us-ascii?Q?igIpwREHNOsI3aERWclDFGUJ/KlKG8UEXYoly3F72qxeoSv+7x85jLrsx4wE?=
 =?us-ascii?Q?hAcPB5oV+gz5BiaO+e6yZ5RfnwHl040edUaajL0+dqbjiP/ytT00ZuJanHZK?=
 =?us-ascii?Q?4Okfi4ck3sT+Qzg/Y+hQx4rvg8mUOdvSHebPqmSZQKcTUtw5HY+A+ocuCMEH?=
 =?us-ascii?Q?Pg+ywdLcKsf/uyRleTA3FZDdZf//mD18LarQVzyCVpxAS1dfXdWlYGKZZ07U?=
 =?us-ascii?Q?Z6KXMlPiGuU0qTXlGYCIVh3hjO46gdO5oCqyA+heX1fZcNO1KmJzRu6ka5KC?=
 =?us-ascii?Q?5HaNf1/lLYhH4itIuqU8oVkPpB7uZyQRFrfYGtbAvNAvCnwBV2PTWwFXQE0r?=
 =?us-ascii?Q?VrHZ5nN3NohJIgdNrvt7g/fjyLWwi6F5MA/9iBfbOV30KMUEZfBCy4Iyf08I?=
 =?us-ascii?Q?DBtslfGuZ/pVfgZ94VtwmPfnCct1DiEbaH3Pr3IIn2tRdhb6dnONCMxcCuhG?=
 =?us-ascii?Q?ZlRveNywUt5j08aCKOYhihAjM1v8eLXyUlRx+ExuBvNIFpj2HXBibAjYLN41?=
 =?us-ascii?Q?nG6Qz9IeVb6SgJdhOywrJsa4EKqZg7Esxu/PfRSL33fhbhxO/vUyVrBOFS11?=
 =?us-ascii?Q?rlWJTlhDSCjeyTsuzsPU7PXnTA6qLaKA+98DeANckD1j98f4+WfHup/BrjL8?=
 =?us-ascii?Q?JqbteJ63a+d3+sBKdi36LypmbbZAClmEGb68XmLDsmMUYMxVA1oiK4+MIcBD?=
 =?us-ascii?Q?jur+sX/gwmmaOKRSixPlgMEpv1yt2RnLnQarqc5qLu+PDq9ZJpjvdnr+npe9?=
 =?us-ascii?Q?ZjSm6xXNf1EhChhkfNs0T+o0VEzU+sevPK40CwLhbQi8zTYt2tuEfPeqDP6j?=
 =?us-ascii?Q?tiAiPNDPamAsYHS3Ateu9bUhiQG3egh3cSJC3MPWaYsF+//GqRGm/0fvGS8P?=
 =?us-ascii?Q?bZB6juzRY9Zf97UDvY9WOZWvhEXROeaUaf2tSV4kOk4kfjvBHRkrKu8nkr0a?=
 =?us-ascii?Q?vQSTDCLQLfSoCVRfsDQxpiJX0ZQEcdHxFnrT8VAaCep/lfGm0yHkwoUIA70W?=
 =?us-ascii?Q?XJndzPRhoY9FsKtuQ/Pg7ZIm2rNAzAQl5wVFT2l7Ez7CzBKgd7Td1sIbAolK?=
 =?us-ascii?Q?sjDcEWHcdl0L05Xiqwi2/XkSZ+RI1XM/IcwF76unTSLcXEhV3OUuL0zxKko/?=
 =?us-ascii?Q?oO3nSsI/WnpXzAyzUX983mKdtn7dfo6fIRKqZ+3tAgf6PiOyEwaYLV2Z6aKq?=
 =?us-ascii?Q?TfYT3A+r4/Ltupwcy5PH9tyjpZPoqS1/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V6WU4BEObBGOVmnDtVUm3enz4RPdG6eeQBVh4ffbvtU4ZDA5y0Tq9Md6eSVM?=
 =?us-ascii?Q?zrkzm7nErJ7KMIYK208lSdyWRFl6vMSBFVOYjXP5AwItYtSCvyIzRnHjyD2+?=
 =?us-ascii?Q?jF5iKh5CUACxBLTMmKcvOsvPAxdwx77F8jBewR8ngu/b5w2ow3QzAQJWveRm?=
 =?us-ascii?Q?gPpq6iMdaIE3yVBqYko/WxuKG+V2nhIt24C5Ki0metvhmAfadjvn2XHrPHNj?=
 =?us-ascii?Q?KcfyBpLBnOy7VLoXA9KsridD3AoTBEeI8pQRicE8Hzh2+plmwBqHJIOxR7AW?=
 =?us-ascii?Q?kyZA4hLdgwcyMzJP4P6iGH6ojL1bfAZIknt/NRY9DAp+GY6ug8qppb4bVmz2?=
 =?us-ascii?Q?/W0Oc1MnyeRv0npEfjA6+nhlFrhLs6GLBudqdlsy8BnR+OfTXobUlaDjpEjw?=
 =?us-ascii?Q?Wl+uZc5jVNGJRMqw0NPH2s6GXqmPOaYjuBcgGIVi7OFcJo7dRPuQNJiABm5p?=
 =?us-ascii?Q?X/OXdM+3e62Fv18ZmgFGB0GQk3sHFFwbAxkocuNPxK8sfSkF5KHq6iO3heT9?=
 =?us-ascii?Q?Oeve2G9Z1ZsyLwPxjpGJ6w4nYRzbtShqpExWZpaTBsXRxTQfvRGqQ5TGMXdU?=
 =?us-ascii?Q?jWQ+8sUuon0ADCboEek7C8nbqUrt24/0xVsm1Ajd34CgvPMEggJUPLVTZHtd?=
 =?us-ascii?Q?/MUNK8GAxeKReNcNG49j58Iq3QA8Brm2vXZ3mkxsgHDbmOnd+YCsUthIxuHy?=
 =?us-ascii?Q?EwADINEnGjt2QLZIe01O9tguS62sO5hcvsEy6x7BXbEbDhhz8p8XT4lyydjc?=
 =?us-ascii?Q?+d+8Iiy68NFAPtBV3Tb6SVXEYCRI8o/bV0WrSxleD2LKcbwHpOIWRaaV345t?=
 =?us-ascii?Q?phOHcYpNsxcWJoYmjRfSEOkStCXRhF0T03v3XzQXWxcgfb6hZhDJ2jrufaqx?=
 =?us-ascii?Q?d0jUlX5dAZ3QtABW7XPjZKPiCkUEkBMZm12c0TvtfXbnJp49DUpya6T8w7Mc?=
 =?us-ascii?Q?VL7qdA9sgjaq+IV8Voe66gZLn1XP/VP16OczfFg4zKcQeVT8c/oFxaz57VSy?=
 =?us-ascii?Q?Uri/yebhnL+hWjggZwvpAGNC9hCSqjjniiuaesDjYVyY2nXZssF53mVS7md3?=
 =?us-ascii?Q?oVNMBzJhQA68aDzd4dJGgjygx+lewS4S2aOq4R+eoHz7YCbeNKOXknyKbdBq?=
 =?us-ascii?Q?a7Bu+xuyDzsCUc3Fwn15rQ8zExw53SUHS0rku6ekJtQ9VfCp7eOm47gg3M07?=
 =?us-ascii?Q?cYzN5a3n4fSMzQs9lHTrRdeSpn6sk+4pqP4kKKxR+9tFsTF4mzkUozKcm0r2?=
 =?us-ascii?Q?pDFUEzHXN+wQE1OyMyp8NQEEm5YL35+kWcL0LEaHXpYQo/wnMk+neeH3p0YA?=
 =?us-ascii?Q?tKac3BQB+6Fuv388qI2ZSPh2t15Cc0e5+aFqeqSOXSrx0ooADhAOYVwdDE9e?=
 =?us-ascii?Q?9DVVu7AgUtZ2KXIDyLjm0gsrzeDwh6cIqX6A9+SftxpdCu2kE7v/n3Ik7Cq+?=
 =?us-ascii?Q?pnNv4rMLzbGOEc0FCK1mKeZLC/r+RQ2EoIjBjgkHm3hqgpoLH31Imgfx+EyO?=
 =?us-ascii?Q?fKuLnmMoDmW1uJSopFRnMHWOkPzhlFb++UWbsqPXSeTsLssa5UJDIzzyFiv6?=
 =?us-ascii?Q?xDL8P85jnl92y0x/qFBN4X7GWV/o8r4/srRSZPtNy7KXVTHjO5DVRddUPNUU?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab12211d-1b01-40e7-4f3e-08de19a38981
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 00:05:31.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAg53R2oXl1g83qmIzg4GXxzHRWiWf9Dc1S4HJRB1Gn5tEaqSsX8NZNLUWNQti/2ADrAPRZGmBU0TiwisgXoIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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

On Fri, Oct 31, 2025 at 11:29:36AM -0700, Niranjana Vishwanathapura wrote:
> xe3p_xpc supports multi_queue, enable it.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b5eaf0fc105c..43f1cc47b9b3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -111,6 +111,7 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>  		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
> +	.multi_queue_enable_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
>  };
>  
>  static const struct xe_media_desc media_xem = {
> -- 
> 2.43.0
> 
