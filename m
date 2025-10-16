Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3AECCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 21:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5637310EA99;
	Thu, 16 Oct 2025 21:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYCD409f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3E210EA99
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760650098; x=1792186098;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZTztUcxK0QJRi8qZvsNvoW8HGZZ5A3AXPhe0MX8cBBs=;
 b=QYCD409fFHQ/K7fWVdJWtOJfTVbU7NIsyJFWRCqyTKUGoehg0JEYyOoV
 ByFt2kcnGVA9kjtHmBFWJnYlOzT17ZQrNzITpvBJznM6Xc2z7cSuj/yzW
 Y2H8F8d34otbTlWMsUjGmYFdm8Qy75FovK4230QmbIRSR2Oo5dvTuzKTP
 BSQdVNlj6vDy1wvX7KgftCrT1PIlbExECwCOMEGE20+P7tCuIa5yRX8ZU
 OvxZTBKwRti/uZ8cej3QqLvZz6oc+zxxpApiuiyLe30IjVkuv9b8DD9ez
 0Pe94y9HSsEw/wNWEe6MC4xyHJ2O9kb9vf8h5fsFNYGr4qX+w0iNcVtOf A==;
X-CSE-ConnectionGUID: AduqUuuRTh+xfR7H96z0mg==
X-CSE-MsgGUID: tTp+qgGqR/yCdR1NVi/9+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62067548"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62067548"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 14:28:18 -0700
X-CSE-ConnectionGUID: TivKyG90TCGV//YhJS4FhA==
X-CSE-MsgGUID: 0BtmlUe3QH21Q7BHpmsy7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181701796"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 14:28:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 14:28:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 14:28:17 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 14:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGosCSh7SV71bvrug0b2WxHzBvcuB3U8YtKxL5WeiWruIA5Xl7/Tz4whUvL5vlVFzmVCSP2g0YMYHbRO2uIhi6iM03lk+ZHhC2FgMJ7T4y+4R+UwOD6xHUvaxeHuPZdh6RdbIxL2+VUBF1uTUUj3J9oQqAOuMwNwAg2gufn+PRvwxPPHn/5U4Ypt8c52hbZ7UjjPRk5hWnkg5liaOddYsajXZhlKfkM5FaxuewwJ32jw3znJVOqh7EAnH0B/4m7aAUk45gT6zx33bgcN1H5J8n2ksf68WutLviuSf3qQgcaE67Qa0MqMcTobppGeb333U8DVk7/tNfECMIF5RBmRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSy6wWcPaM0GfaLdPOoUteRd6IF84LnfnkrNGOmJTuE=;
 b=ftPuI9BKMrZYl3+3Kqs9ttXCT1mT3LZV/+PFQQ0zmtrB2oEfRaAndZz7zGVEUkWXso/7YsM+BM+0v3hg2lyn1oWeno8T3rd5+Rjpi7vutf51bL7cxF9y/Fs7HtC7XaSGaysUvCM+xSIKSKXbykSuF9kb1u6l3FGwufrsij6v2SECYMb0ufTyLFLGyzu7GS9CQYhtXHDJTNqNeHVimF+gpBraUX3MmRa5E9Y12TplEVGFMoennLxkiXh+9PFjY5hWHHBHxgWFDVnIT4b2eKncv8vugd0NRO7uEU4mxBqkh53zVogz1w0njHrj8Vbl0ar7cC6MX8KjbBCzMMs5CkWV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 21:28:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 21:28:14 +0000
Date: Thu, 16 Oct 2025 14:28:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/xe/migrate: skip bounce buffer path on xe2
Message-ID: <aPFja3rmfhb/TtfQ@lstrano-desk.jf.intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-14-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015141929.123637-14-matthew.auld@intel.com>
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 253c2fef-e692-492c-c23e-08de0cfaea23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t0a44PyQtgn+s4c0haRbbHOdHzr8/877jTtjsRlpHebIPo0ppskjp/ilQb7H?=
 =?us-ascii?Q?BCKAYxmy95jpGibSxbv/6hoQpMuok12jkwRWiyNE5kfVnXp+m6d/HmAM4h5U?=
 =?us-ascii?Q?JLBu2nHxEXWtgfU0CbIBd6wOMSEM7IYAPAjrs2oMKm0kajoarNJdyIKphbr+?=
 =?us-ascii?Q?Q0yoZNpIKJLJYA7vJDWYVwVgFGAApb2mIQcm5clgpi3znIMlIgDSdJLm9ipQ?=
 =?us-ascii?Q?mX/9S0tQOxuqcJVS/IpXQv3T0wNwdPBgi8+6VEbNGy/Rls+AJl/O8r/Sk+ha?=
 =?us-ascii?Q?3UTxdpKOmc7zvxJ4E8PorCgCniTXKAAgTT8R1gLqLELJ0T3D47WDrUDvLtPd?=
 =?us-ascii?Q?bgEy9DVSH7nIJYBV+H5xmqiLz32uerwQsB/iqqxnXKceNS61bil30HHt9OVH?=
 =?us-ascii?Q?gaWAM2HOVqJWJKak7uqITezNXbphcswCyq5zVebNzuOLvgczYstRguHKsJNQ?=
 =?us-ascii?Q?OlkewFOfkllLdF4KvgUy1xRz7JrC75Lpy1UC40OVNfKB1izC9uFCKzVkLrXL?=
 =?us-ascii?Q?4549Cq1z7zuWNpsu4F/pAfttaSUDiYP72Kn/f22HiiUPpKrb0au8U837QCWF?=
 =?us-ascii?Q?We7Y5kFphGkoNJn+QSGWQgcW5ahkX0x4267w+KbouUYOWnJIptGxuLYSUznX?=
 =?us-ascii?Q?H8DB+8M+Hky+vSXmIlthb3TvhhbGAPjUbnlRUHsQ7Pv7pdGRQggVdsA20y1r?=
 =?us-ascii?Q?pb18SnJZm+KW3Fejeiyj8iHf2OJpJFP5xI3NlnfNdf6Af4fMKB1pAHxddfKf?=
 =?us-ascii?Q?Ds9s/szujo935gCQ1xY0GeS/U6c5jtdwZE2MgWhqs5JmSKgRxzJgSJb+h1+V?=
 =?us-ascii?Q?j4B0I2wGl1ojqpBSxfG+RDs9k31iZ9dBrdSgTu5VqIF6CEdiNDgpcPvRFaLP?=
 =?us-ascii?Q?yJSFxHUr/XJ1l2OCPMgHx0lMFiA74F1acuRZ1hOFgKtPR4arlIoJSN5oZzc3?=
 =?us-ascii?Q?pDcrexyBtXtGyDnh9YIbHf/bje6pPu8mi84WRBztr7gPzHr9VxAsW45nEqRB?=
 =?us-ascii?Q?1oN5FVk9K6QtNI8CSp3O2AUczhHCdSyoNV+xrMtIjZPcMjHVUqJ7HSvHVpok?=
 =?us-ascii?Q?OeE34kqcNMEpjAFrm4mldoWoiWKmUWkTCeVm5ffQJ+mulgEnYSdUbejvaLaK?=
 =?us-ascii?Q?AmuuXt1h48pEP/qUDj3irO4duBBnBC6lGw86NCVJoa+vmkzMzyWe0xwh0KDA?=
 =?us-ascii?Q?2OrewFhK8/pkh1B0Cu3KzWEe+re573QGOF3YDGm1uHJhl5/YK7rsMwTct4J2?=
 =?us-ascii?Q?uFx3z9MB4ZllA1cCkpjgO7DJmjjCsew1nXiSjI71YtI2374QODPAYfEefzSX?=
 =?us-ascii?Q?qOga2DLBeQAgblXEsdmegEEuHmDTwpByMAV+4T7xIXWjrJbphZOCe23poges?=
 =?us-ascii?Q?008KXzp3Pzg3dFXWGxe+bOp3oYudC/eArJpkLUtKCVSyYWGs1Iq4skpZF4cN?=
 =?us-ascii?Q?kIKBV5p33Ik+z9mm/EV0iCcxpoU8DUs5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QvCDSnmNKyqrlGQ5PWYDirbYeavkJsbmr53EhvscZIgEXobBr1xd3zPEuAgK?=
 =?us-ascii?Q?imLJmHdMijRNTeW6WorHc5MdF1aZWtxYGA3VYKvZ8vwCdfaGGpAIxPn+YKI/?=
 =?us-ascii?Q?RfMlGCv8UOZ43QLI06QpJoSJwF1t8pwqoeLtYdS9tZg3m2qT3uoDe83J/RnN?=
 =?us-ascii?Q?SF8J6BdEvEmrZo04cjT0a+FZXhecRLaxY8mYChUKJq6dDuLHWIGwurMAn6KW?=
 =?us-ascii?Q?1cqIVj3EW5TMSIJYUyZdWoBR1L0TD6SXezj0yFjWsmZZGqc7j/Wi++tRSN0l?=
 =?us-ascii?Q?kg3fZhhg2NC1imd7J2llLMyvEzDqsgTbl+YwvjmBUKZHgzpbdcR3W4wnDHX0?=
 =?us-ascii?Q?iMFEzilYHZmO+A2NHGj5SWnMGvBWs3wSO2paJ3jV5qVRxuh8tnTuFoHYwCUK?=
 =?us-ascii?Q?rh8SbNKuLZQR5kYt4QKq9G0mSXcMCtQNowUlWy+T4OiQ9Vo4pVBJ59gDPURb?=
 =?us-ascii?Q?2OpeSzLPcqFdzcFaDUwuADE2B0gp5NrTBk7cxY8svbjK8Ol5pbxg8UydqoUC?=
 =?us-ascii?Q?ozP1VPfbUqqDbNlVKZFT6UIG9Gpa80zohyDPgoiJM32JqzMjqVITzHipMrlX?=
 =?us-ascii?Q?mf9M932iYvFKrEzL7rspmBJERtUjztsO+kmCQhesfPvoP5W2oXToH/itgin8?=
 =?us-ascii?Q?xd3UeLdfA8w1QCTZA+JHIJfQ9r5mDhzBQ6TBVsYWsMwzGbhlFrqQEX5GbJA0?=
 =?us-ascii?Q?JbEuHjgTp3ndIbNFZMr9Q98QdU4pLIjXmxNeiZPLEGy2B7rQPR9/OIVDm+mY?=
 =?us-ascii?Q?U7S8gW/tRd4rUOdBgZqD/crxFieESKu6X8XeiJYREfpx+n+TKUYZwWw23gvc?=
 =?us-ascii?Q?j/cnX2BAUV7DdKC+ucXacYOswlobJm0L3IF6Qw8Ty7l8wAPB8fSETPSCQvTh?=
 =?us-ascii?Q?H1Vo8cEFZlpIWFkNIX1WU4DGCr8k+nfhdoiOLJmqlBfKBcIDPuT+j6GVDc60?=
 =?us-ascii?Q?6FV5JXZV1dwdqgWSbuPjpjMQE9oXSmqRq7WELGKdeYtpezNTn8BQKh4DE7Hf?=
 =?us-ascii?Q?2yj9mwGVKeVS8/Rb+T+apgw1FYauw4It1XRiv9PiqIsuEruFt1jRqoEDOf8b?=
 =?us-ascii?Q?W4fWy4PxsjGbDiPXPXuE/OytYvlOhS/R5eqRg/6SwtC2wrhNfdYUabmy60lt?=
 =?us-ascii?Q?L+bqHH08NTH/zqsAwJL+5HQnhG2HicfkwrMua60wqjyA5G9kvOF3GmwPPnqm?=
 =?us-ascii?Q?fUlLhoBbUFVYUO6vewT8P5hS1HqriSl0cWKv6QUmiPmmq08JWsxOggkFE1x8?=
 =?us-ascii?Q?CzMrl4h8+SfMm9VTyr3azoY8OiadgTEUPt23JCOkBGzBhiCaywF2YVuvDblx?=
 =?us-ascii?Q?B6r/q5x0+UM4KNtafv15xK9HY6qWOCcwDu3ExPXBrkgI+u3Z1gFF4utxqRJ4?=
 =?us-ascii?Q?5042A1gsq7iY+1CWoYftc/MhEeVr0ResgYdsQ1RZ1DP9u43tg1oICaRiwRf1?=
 =?us-ascii?Q?MiIsXtVUVL0DhL6bImf9nnaR4T8QYtWir+uBeftgG+pFkz8qJsXANGi2Q207?=
 =?us-ascii?Q?Nu/yPzmng1/quGbkDhnC0xQJca+IvBYc9//sIpfdbWbmLOGyBPIKer2TYqdL?=
 =?us-ascii?Q?VGVvHXqptKDj8aeeXIKY0BNo1aospwRvAnRFHjFzMGd7egq00WpYCoqBLwl/?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 253c2fef-e692-492c-c23e-08de0cfaea23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 21:28:14.4382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3TssufZXqFGKAOGmVqliOBMDoDshDosoZXB1iFktLsGYYncsCzh01cMjvHdtYqwQR5qArDuP2tTCAjy6XSgQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
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

On Wed, Oct 15, 2025 at 03:19:36PM +0100, Matthew Auld wrote:
> Now that we support MEM_COPY we should be able to use the PAGE_COPY
> mode, otherwise falling back to BYTE_COPY mode when we have odd
> sizing/alignment.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index da1fefb96070..8bd8e8179313 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1933,9 +1933,11 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  	int err;
>  	unsigned long i, j;
>  	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
> +	bool has_byte_copy = GRAPHICS_VER(xe) >= 20;

See my comment in previous patch about maybe storing this in xe_device.info.

Whatever we land on there, absorb into this patch.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  
> -	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> -			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
> +	if (!has_byte_copy &&
> +	    drm_WARN_ON(&xe->drm,
> +			(len & XE_CACHELINE_MASK) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
>  	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
> @@ -2149,13 +2151,14 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	struct drm_pagemap_addr *pagemap_addr;
>  	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
>  	int bytes_left = len, current_page = 0;
> +	bool has_byte_copy = GRAPHICS_VER(xe) >= 20;
>  	void *orig_buf = buf;
>  
>  	xe_bo_assert_held(bo);
>  
>  	/* Use bounce buffer for small access and unaligned access */
> -	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
> -	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
> +	if (!has_byte_copy && (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
> +			       !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES))) {
>  		int buf_offset = 0;
>  		void *bounce;
>  		int err;
> -- 
> 2.51.0
> 
