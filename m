Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EF6C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 06:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F1911A16E;
	Thu, 25 Apr 2024 06:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSwN754g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352F311A16E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 06:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714024919; x=1745560919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tog3qIVnt1VABZ+Cz8RyCWS+CmBTvZzoq8mp5mj1F1Q=;
 b=YSwN754gFzZGFzso9POqq3Ae9vmGWsAOkEkh3lEiHz0bHg2kvFLkvJ3n
 lta+pRoLpH0anka6UvK4SCGmpFqiNC/7iCE2i6oHtciuy/5NI3adHsU24
 rVs+whBhO+o86XbmwFO3D39Ja7mqa8neoZWhaRP1iiZoDo2lGVTrAUg9d
 qTpB3Qt17KuPAe9iaqSW2wIm0V8ByeELqkxx8OxVoanr+MJpn9yJYwiK3
 YTZbjvAzXjnXyKmt3lxUZ7YBLG/VmmhoQztLfAKz6d23v7dCZJIwgFWd8
 JlTI3WUD7PE0wDu+wHngi1FrK3M+k2/u9N509wXk7OI9CdVkz/NCaQC3x g==;
X-CSE-ConnectionGUID: 9EeB2mQrTYSwGVJW4D0MfA==
X-CSE-MsgGUID: 6MvIOaqmRRWxYsE6NJN56A==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12623834"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="12623834"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 23:01:58 -0700
X-CSE-ConnectionGUID: 3xP5Uoq/Qa6hX2p/54zkaA==
X-CSE-MsgGUID: NGX6WOW/TUGpn3KqOoWfMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="29591284"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 23:01:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:01:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:01:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 23:01:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 23:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9S+jVyTyKAHrYsGVOo6WEcRMC/z+vSuCLkJCll6e8Q7EkmDO8WPWKaDTCwL7tRTEG3FXRn+OJS18PzTgtxbsndp3SsbB5w/v6mga4pmJM3b96e0my1e2pBem9Dzsp3iuaAHkwDeA1RhATzQCSIfQLEARAmKPCKnI1CCglp6GyIM9E/DOZbhCGlgv+vw9NW43EWiXykc0E8efb1fRJwy+Z1SXZhma4bBgfpzpWabDHHrxolvpUlS/v5sT9gAUREHakd3Sln6SSHLP9k+E8KXWzmSvwp8FmWfdi3ArtQdppMrevW5K19pku8QRujK/AOjqNSDkVy9rob40ZkZhVZ2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtUnfFSlA7h7hQ+VekGtg4l/S6WF7hshDf+nJieSniw=;
 b=Rwmnc2DezD6Kfn6fT4i2Rj01nAUB7bHCViOnpFHVL6zBbfwjZQ5EdayoBJHSen5fpNwcsa1NMvUx9b62DbPrFcLYFEVo4nnDEvwKbhmvfhLrYdMf8Xy6MlwRuTxfp6VUizJ894NFnzqjb9Fwp/D5r9THjZ8qEnPiI9IsLGktIoImce7PfUOAWOXDNEvi0RkoAXRWJRbx2TU2QZ+WO5s+ISL0jGtUq3jxL/avCgIsuk2FHcJIHWaV8jAYa++lkzs1BbDmoeuDLgVmlBfB2wcqhYlYfQxlioVa5GzxRmtphwIujqk8FMogKEx4Yqr1m3A3lt4JeNEG2TX5td1i+lU/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 06:01:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 06:01:51 +0000
Date: Thu, 25 Apr 2024 06:01:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
Message-ID: <ZinxxqKiG/q22i6d@DUT025-TGLU.fm.intel.com>
References: <20240424043910.2190376-1-himal.prasad.ghimiray@intel.com>
 <20240424043910.2190376-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240424043910.2190376-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc8d1b4-7803-4941-cfb2-08dc64ed3397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gjhW0yggVOAeODvDJafX1HhfAJm6FO4aIi6aLhJ6dxbQAlLH4MpD9Zaa++ap?=
 =?us-ascii?Q?HbgKst1VvM+mqxA74ZA9614khlsfqxcf8DH0Mr1Z3UppheWeynYKrhYdEjXK?=
 =?us-ascii?Q?57mE1NHS2fH5dVy8Tjlnmkqlz/nHptEJxVHMd/TwdbjXhw0XQqrD0DkskpBW?=
 =?us-ascii?Q?9xZgYwWVaaXr164/zd8VG/ciYbYK4XzVJ400RQ0rVEtf8FnQ6HbODVC4331t?=
 =?us-ascii?Q?Kp6V8uQpt+Or25LaBDXAZHsUx7lYCkGsh35koc7NI9Rn6yfVZT+iKrTVJA6N?=
 =?us-ascii?Q?aRd4j35pjZ24GAxrKH/iWY49fA6vmic9URpMz/MOSrdUNgFqEAI2BPV1qidV?=
 =?us-ascii?Q?esUD/YkRYLPvaSgHtkW6GwB0k+FHelboq21wqzDOAJmZXC0WU9PrDwSy4k87?=
 =?us-ascii?Q?hniaBLlpyCazgw17GtiVyDnU87H+BoxXfAaBa0lrYF9nyhp/TOF4KuUwDXRk?=
 =?us-ascii?Q?tNNQ0yeNMdlz64kLEW8t+tHwaav1i0JNIgWZJzNJu4JRh2TPTBjGja7hN+rw?=
 =?us-ascii?Q?YdfsiRjnxs7LLDKON8FncLVEdbozc4VuQTx7VHJUSPTsHdZ/rMM08GizOc4Z?=
 =?us-ascii?Q?AQs7hbnUEWlqJWt6an7i7CmT8YVh0QzgQFWgNA7klWRfnihCX6yACh1rBRvQ?=
 =?us-ascii?Q?cmEYreY96K4wpxe1DgsNV9179NltZ73/YNhb85PGIAGZ2Jjw5opYyThWSla3?=
 =?us-ascii?Q?dYKoaDEMK9MwzYJ6aqY4TqiPQpesOKkKOWH6EtpxnS/TMbAWxSi5+kn3JMKs?=
 =?us-ascii?Q?RtAEId4JfMIOeCca1PpKr8+RBXeJXVafByUZ89Ai5Ly4j6LG0dxHgZDJwDn5?=
 =?us-ascii?Q?jPGjzooyt6gM9SzSZAaGK1AuNh3MKKLQoBVxFtwmGidlie8qh1gY+xUI4qUt?=
 =?us-ascii?Q?NrFfyfs+vnjWx0E2sEaXvFMs3orN8pzCtrWRtxrp2w2c/sZXji6N3d86IqoM?=
 =?us-ascii?Q?ouskLw4O+9fcAiV8LbbAEJWAmGXnNLKFmfantPW9+cpSum3vcaeDC7ddkkYa?=
 =?us-ascii?Q?Nm/bbymSbv3SGERka41tZwu70QvTtpG0Yly6wbyohS2uLz0r08heEa0cXGjy?=
 =?us-ascii?Q?JiWJTnUGeQz2NtlXGri9gtBgaMbfVk6VKq4n5RhUQuFMU6OsAB4QzhXqT+Pl?=
 =?us-ascii?Q?5qO1YGPKzwMMPBBoeSB1DtYh7cyX+hrBXJFrtb2rPxfgA1Zx459eu/pV5T0z?=
 =?us-ascii?Q?6CJwRBlwzUKtP7sUMPB6aviWdXSwEiWD7BAVe17t3pe/YNN6PDwXbJJXXF5c?=
 =?us-ascii?Q?m2EFKlFFKo+/Wcp6C04/YeDJE2AqXlUy6/JrquQAtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Of8MWSqhT2O4eJ6d4vGpXSOxvrwe8T4ipbgy5TCX9icPKHfXD1aeDooQXeIe?=
 =?us-ascii?Q?r4IzK0tCqvKGDWSTWOWeXYa8VZwt7W1RvvzPynrFklDh1obK2E/tYYjlh1ys?=
 =?us-ascii?Q?b772Wvfsh0DKwICbLpPIdPKiZ44bLrUfbA7RTgQzepzk9V6sIrm/EQIKY5N3?=
 =?us-ascii?Q?OtbRv9BZzCORHB6YfexlHFeiezIPhJrt6/JaxfGXoWv9RiQ/5putvEHQUaHv?=
 =?us-ascii?Q?MnWXkrYGGvBEI8oHfReEPqlVbqK5MfgBN0dcsf5hnVHXDjuott6JyZIdZQJc?=
 =?us-ascii?Q?df4wFu77YSzAQgfQJX/Jb1mfnZIYcztiUUrJE2Wk3tIB3H4eNkclUSk5JBKf?=
 =?us-ascii?Q?eXiT8kSumHfunJJ4T0wRahmbEBEECY9G5rcHO9SdW0UH3HG6Z0M1Fchce1rn?=
 =?us-ascii?Q?RrdJajmT7drnUo/7rLm0y1zUCiOpeF5zB0hLhKw9kUg1tE87yvkSIoQ6dM9m?=
 =?us-ascii?Q?6v5ccCBmlf9tXZamF6OMfblBDb1AByEjTV1Wg1PkNe4vYpuWuHncpT8MzaXo?=
 =?us-ascii?Q?lLQ5CC18rWKuS2UX4LBcitQBZYA6vSXDzu76wbRT9V2rTUe88R+Z9yWI2w7M?=
 =?us-ascii?Q?I42Z/50J4rihnIAqs+gxqR8TI7Fz3dU4o9OPu41Ox1lODGRRDsXEw3FB1Cid?=
 =?us-ascii?Q?PGRydFraUi9vS6urW7ExQX6ORVo6k57PrS1h8X9fdyHaiSQuwCp6HhbpUtXN?=
 =?us-ascii?Q?Txt1eELdME+oYN+rS5gDTx1P7MLA5VsbKzdTEmjDMJtSeaJozQTJrWr1iGLD?=
 =?us-ascii?Q?ALGs94GYjf30XdenTT38eY4G++6yJ/LXSNNC+5x8JM3B3BWue2sRGB4QChFT?=
 =?us-ascii?Q?NwdsLVmeRywMAC/ekSPXxrGnFhwCKeeorF3TyjzMPcXiD44ojAbjwhWVgo5n?=
 =?us-ascii?Q?5IlQd6b6CXGdHXKpWeDILyM1qrSw9Ko3ZS1CAsnf4/AygRGnA5rwUKByaAsm?=
 =?us-ascii?Q?BVLhcnBnq//QiCygf2Qq2BrfnEiXYadNTEXEr0OHgNSZaP6SPGXcvmlGJN7l?=
 =?us-ascii?Q?yWE4HuHXpmfFvgZ+pKC8Hv504Cip5/QqF6tul84EQcS4OXwCp0QpTfMN9n21?=
 =?us-ascii?Q?f5giqhOnKM+hMPkHSNQIz3E727ApzLBKZm+rG3jmgLU6UY0iLAXoxJ3OXNkZ?=
 =?us-ascii?Q?lLHdYrzJ5MLBDU/kyzYVL3ITpHMXKzwQyPm8qn39wmn0v6fAE+foxW/0+OW8?=
 =?us-ascii?Q?Va/ry26D6iMz+8h0INXl2BX3rAxkX8IzbTPt+n7ywVrzzjW/0Jcz8qxEK00f?=
 =?us-ascii?Q?/Kxdk1f1+UuCKwJBa+rr78c4ZcGUsIKq8qtP4JqfWH63AVUlp+TUG9PuNLWG?=
 =?us-ascii?Q?1qbWZyYguIujc+9Q5lK6CV2uvb6gUMze7mbHFy4wSTc/KGbJ505UF0uShyGT?=
 =?us-ascii?Q?BDcxQv8OeoDE8ipPFyVUJ7F2Kq7b5bfHy8+D42PDTo5LahF00qEpFuoJKvK8?=
 =?us-ascii?Q?/AtSPLmp7usSNpCE5cssxrSzs9UIs8BJY5hin9QHljPqq1OZcmKyQgyuFbpk?=
 =?us-ascii?Q?XHDcHXBiHZEDDAjne/PhRef1zwj53qCTf2w3jEJU62AcrccTdsD9bvk9N2I5?=
 =?us-ascii?Q?c3qNILvSw33tROxtB7B3BVT31vYZ0pCbIcwMNrD65C/w2Z7p38oAFicBs/ES?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc8d1b4-7803-4941-cfb2-08dc64ed3397
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:01:51.7485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI/8wyr6S/Fq33JG5d4INkx+v/0/UAwGUh4Hr6WN/jhrLodu4PVazE9nm6d+JzZQP4Mec/BAqUuGFI8wYnJZfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
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

On Wed, Apr 24, 2024 at 10:09:09AM +0530, Himal Prasad Ghimiray wrote:
> There is no change in functionality. Using the helper function
> defined within the driver.
> 
> -v2
> Use xe_vm_unlock() (Ashutosh/Matt)
> 
> -v3
> Use xe_vm_unlock() for error label too (Matt)
> 
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 85d6f359142d..5c9d48203d73 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	drm_gem_object_put(vm_resv_obj);
>  
> -	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> +	err = xe_vm_lock(vm, true);
>  	if (err)
>  		goto err_close;
>  
> @@ -1323,7 +1323,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
>  	}
> -	dma_resv_unlock(xe_vm_resv(vm));
> +	xe_vm_unlock(vm);
>  
>  	/* Kernel migration VM shouldn't have a circular loop.. */
>  	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> @@ -1365,7 +1365,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	return vm;
>  
>  err_unlock_close:
> -	dma_resv_unlock(xe_vm_resv(vm));
> +	xe_vm_unlock(vm);
>  err_close:
>  	xe_vm_close_and_put(vm);
>  	return ERR_PTR(err);
> -- 
> 2.25.1
> 
