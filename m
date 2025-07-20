Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF65C83F1A
	for <intel-xe@archiver.kernel.org>; Sun, 20 Jul 2025 19:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F5D10E0B5;
	Sun, 20 Jul 2025 19:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOenICJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532B210E0B5
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Jul 2025 19:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753041107; x=1784577107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kjHgNEni/PydewXAVmYqUbB6a8G/YbJ+4y3TGy/m8n8=;
 b=SOenICJU0yfT8GPjO4c2rgns3+Nz3B/CjX2/grZU1e3j22eFNWeHxx5l
 A+l9vdGwCtrd512vR34oEms7IABb7VLtcrXJifTm57duPgdnR3BJg4j0c
 b6dRiyTrhT5s1HDkTXQZh09qoOBy39FW2ol7UPrpsXQ+afMW78H72/Lid
 7PWnEnbNzDJlzQPfn3MKzt55sH31n+HF3xwZPHY2vNdAivLn2k/OkpsOR
 60Q3R+APQgfZHFbrrxKOTnN4EmnFcrntOEWiYQrR5P2LBL1Uaynln7a0+
 nqK8F8u53GoQrzt7xTSjiRHVwC2phymSEMxlZjEz7bfwJ27N5G3wzQFfb g==;
X-CSE-ConnectionGUID: oyLJhE1YTVaS4NFOQL3p9A==
X-CSE-MsgGUID: TDYRPh5ETtGvdxwNft9k0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55347282"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; d="scan'208";a="55347282"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 12:51:47 -0700
X-CSE-ConnectionGUID: n0cWR94dT5uxDeOsn5+WFw==
X-CSE-MsgGUID: XAhg83n6QimlHCSzcUhOjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; d="scan'208";a="163207864"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 12:51:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 12:51:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 20 Jul 2025 12:51:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.47)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 20 Jul 2025 12:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLKjCpMJTBIWptnR90TpNk2KvPsGiMRCAAEaUc4pgeS/2cKHwG3cBP/JCE8/foqn2xA2vBWmFI9yhyW9vaeZVS5fmlW6E0urL/gmfcI9xL0jG8lxVgjOFUALYxXEKPSqMCA5ikWLmRwJje0AkM6xgDambg+ihfNf0tyx5x/SOLEQmASGZISsPwNuKnugBd1t6q2W0YeuhNRU7bkorC2r26kc8Z3h3ykTqW1GWw5vc339y/uSp1hvlwTCTaVNsPbFU4sgK665EsT9a92gMOkACyq2E6P+Uhv9w2GQFCFQi3hmg5xA25FjldWpcxOi8/OtqF1vN04FZ2RjXxUe+VPKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LqvLaw7JsnqYXI0SJ1vxWmAndxhP/XXqYb9aQGH52M=;
 b=VGWjlfgE+uOzuQowryNkFqMX1PMd1UPTS+cjiKbDr1Dh4OloTCX6pjQEy62F9QDvf+OK//k2U27DVJMPsdLmGk9Fknr1bFmDeR72A7Z/iCSeMw+GXCuhHv2CzgwyZP0LO7lRGSssU5upEYVYgz/nlaYSz914arLaVTkmPkRv9NYCttcj3cpk9F2RRIc8Yn+NwyuuN/b74Bc8OQRSVVxBaQKPs+mjJfrmxY4rffYJ8wtr9MZk/rRB6xPcfUPBcflX4WRp+uXuF3oL88plcqyCQpnjyaNrFv1VCweC6Y9nNliTrWmltCiaU3aBePWxGJlrgVATqq75cjqG/TQTd9UMnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA3PR11MB9040.namprd11.prod.outlook.com (2603:10b6:208:576::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Sun, 20 Jul
 2025 19:51:44 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Sun, 20 Jul 2025
 19:51:43 +0000
Date: Sun, 20 Jul 2025 12:53:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 3/5] drm/pagemap: DMA map folios when possible
Message-ID: <aH1JOtDYUH937/DQ@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250717133928.526111-4-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA3PR11MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: 90220746-76f4-4e08-7a45-08ddc7c6da25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ObppGaDkeydGPZs7EaxpswjyqUdFTZ4Fju5TMAXlzJ+f/OJDKhtmdB66xbO?=
 =?us-ascii?Q?Lnzd77LCrT7dYrtfSUDdvCzGBCPrYDMpRh9upfX7uQb8q8FR718KbefB8SO3?=
 =?us-ascii?Q?Ebgu/KyrUrCZFhNnAqG57BtBx+7gcKGJQrhwAUyHTQJeAgLwhM6U9TYXqyNd?=
 =?us-ascii?Q?4sZv/e1TakxpoV1TvMOEAPGe3Y1TwfP+Urt2TePkO5XhYDKRAyQGGfoTStEP?=
 =?us-ascii?Q?xJqmYJrkKNewj07WCsD7u7iKCuuLFtv1yUDRMWObWeOhYeS+agSw7J4VXiab?=
 =?us-ascii?Q?6H616oeXZMBadVBc1jhVHD0uy4H4Tm61xY5SLJFsRjx7yDiFCfCpQKFjBAmW?=
 =?us-ascii?Q?vbTn9isIYLWg0kGifjehJ8r4UaBIBLliAxhD21rZCDDQOEA4GgJQQrFPLISJ?=
 =?us-ascii?Q?j42jvp9bzMyD6UYsp7rmvyTRIQPD3LjGcKssmlwq/QLDytsnBRxWf3OshqVF?=
 =?us-ascii?Q?HH930GrZJ4EGRIDHYy9yuNM4SRAo27ywobLCfZpuo+BoCVajQILmB8HM9/lH?=
 =?us-ascii?Q?8fjc6rNvEOD/Cfo4NQeXeYkQ3X900PNhVjxkQGuW2e592/lQiqmOxSx6ki0C?=
 =?us-ascii?Q?a3ao9TC/EX67Yt726kokK5aUnculgMpw3Ln1UC8iTj/uHnUCVK8KLgqEcrAQ?=
 =?us-ascii?Q?fNtWYXy/Ohez2iY4QmJ13hNgdbzgwTUA0XNMjSB5OoA2jwDXgladM31GlZNx?=
 =?us-ascii?Q?mw+cOkip0U23kD3Bf5cIAuZqXcwrTd+rbQFlWurGJtATSvDG8jZCKMGvkslT?=
 =?us-ascii?Q?j/PLb09laI3HBaypCvbeDdn6wZVasZbPAgz6vHXBElfE4dyyjWzti5/ujt0r?=
 =?us-ascii?Q?HL6cC4dqRUk/ZP7qrRQc0QGhq+E0eB1Vl7YGn008SeRRMDP8H/wUkTd4zX7p?=
 =?us-ascii?Q?AcQ5CKWU07A6U6l7Cy9OO1+pRwqlD+wit5GkY+Uqjrhs3cx1l0iOekuzKRq9?=
 =?us-ascii?Q?GCkNOfkkt6aVYAw5Wo5+EOESHF3H0OnijTgbaAUz9W432SLhF3UdH23xC+UX?=
 =?us-ascii?Q?enxDqMWBIvtygaIBCkDP46Ztz1pi5vE4ZA14MmXXIV0zKO0xh9GDzf83vH3V?=
 =?us-ascii?Q?urXhj6KQ5fttpuXTfLLViTl1AGarrd98lZ2D/mZiqyaz7OzCch5+WWtCVo9Z?=
 =?us-ascii?Q?pwD/tGP/uzU0vpA2T2IuM2CWhe1ASKYBQWgE0qx+BtSb1Kvg77g6LMH8vRPf?=
 =?us-ascii?Q?mdwj0uIa/qtbVlfO8IyuLK8sLPp9wG1A79i4cauJG/Wbjkaf8c3TkSvUAnsa?=
 =?us-ascii?Q?Uq2azvdTZ3xk000B1/Fsz9E9cQIVDZzrlPbmxJKgb4zkWHw4m+VFqmDFUl7Y?=
 =?us-ascii?Q?6t1vPW5IgnjK8Dcd61qJKR9mIloPoZZzbSMe9q8FpOQMQdgGo0p3Pt90m6n5?=
 =?us-ascii?Q?LuM5MLqfK9nlVJdSD6B1pzMFoWOAAsuL33GXV8+uHtxVW0vVZWPGMoojSyAo?=
 =?us-ascii?Q?J8hrAI3RM1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JDYK7rdBbkZ1eFosUvzXGzPifY0tjVkfAt351kf1CBULDC64LejI7HoUER6Y?=
 =?us-ascii?Q?6HgG8Ek+fvt/WXWY7fL4TelUgfqHYUWucX++UG2qkdlAPT+ezLbjngr9DRoU?=
 =?us-ascii?Q?3BhG7L96MCQEXJGkyfjVSRJYqe45gjH/MhubVZWqUpDM8SofNFE+mXa5eBD0?=
 =?us-ascii?Q?oQradmtlN+DJd2s9+3qfRxh6V8MQjj6yw4OY+DG80kasaSjRu2gEZylDKIDv?=
 =?us-ascii?Q?bdpgpxFrJPhvUL6prumdfH29ELdX401VTkkWCbwaT1DsoCi0k4S/v2dIA6lg?=
 =?us-ascii?Q?N9ZLpV0cuOlaZtHwmj5+Qs65AtZld/tuk/FSGz+nLxoJqiQP9lcJQGjgm1ii?=
 =?us-ascii?Q?fpgCBf4ajS6sKm0Z9P3kZ10ohlQR/DH3BCUeMmtbs6j88QujkQnEbtpL5Vo/?=
 =?us-ascii?Q?RMmFyM69irQAchWWHkBMkSgtw0EW4axUZLr2+NhVh2CDSekfOV4bccrffngl?=
 =?us-ascii?Q?VmWG3T0CJeEx4bGQOFaBulYl7Z3EtCsuy7DQW9X53scQ09puylaB9Oafj6QU?=
 =?us-ascii?Q?fm795ntdMbLJ9XQUZxPRhwkUtGsT0wNnkbVyCiLpmoPFem4HNE3Khydv/Wu1?=
 =?us-ascii?Q?eu0Mu9NVee1AQ4gpwvUJ8SNEu9tLw6887tLlXJmeqcvyA7fWvV25dr4VXD/O?=
 =?us-ascii?Q?n92gGemulwO2as5TlKsIXGQ5I0a5csw7OeWF525HKlKeATkLibuLsNGJuTPF?=
 =?us-ascii?Q?mbe3QHxQJPHDloZRNkoW4ij9ugxFL5qoLiBqewucqJO0F8TZEywQwoW3ZVLY?=
 =?us-ascii?Q?kzRtLDPOnNBfj8gZexklw34dUJDpckixYpVbfAJGoSq+jOXrs7XJaFBOmlnF?=
 =?us-ascii?Q?EDm6qr5jCjd6FO+IbgpXoxPBUSEx+RrU2an+EPDqQCFlWlLFlCAx8s75+2Uo?=
 =?us-ascii?Q?qZcXI4y0Os0jOgr54AJxTLDrBP8QNvGkUdS0R+CwbgE8g1eO+oAaR1UFa2of?=
 =?us-ascii?Q?KPn7bPcR8tzu8byYcMcROX6nfEXF5vN7fbweCHzQ70lVL8b8FYg/GV46bkwE?=
 =?us-ascii?Q?L2/i/+uDbSZwT2iZkz4BYQ/vtij/SKGGEgfDAoi/dReInPWF3Lk6Y2pJqZLP?=
 =?us-ascii?Q?3QA1SdONAyIQfw4JsyhF6fUQVEdYuKK4Pwt6bkEbQtvZuQEIf/KXhniXXWSP?=
 =?us-ascii?Q?v0VQ3XFNvspB9wg3qLSW3+I87xrVA2GrpeqgxEXQBZi7oVxxDq0PhCreJnPh?=
 =?us-ascii?Q?TEcnR5WkW4DB9k2CqqSLZu2Ru+nUyicOGpLMPS5UgnCSCkwjALsVuYYakXCI?=
 =?us-ascii?Q?9Hv9DIXVBz4MuMvfGks1GIfGu1Q/VZOBlc1as1n5TJqV7IY/c3VMX91pfIgU?=
 =?us-ascii?Q?/Ya5hDYwclQxo1A7TBLDJfTrCVPZAx3OGEX7kkr1W3/VwdpFP94PIqWIZTJo?=
 =?us-ascii?Q?5I8vHjd/5GNbSEeVfOD6OR1jo9WLl/fz5CvItSb68cTa+4eVQiaWEMJCLToW?=
 =?us-ascii?Q?L0aln3Y+uxs8RazngxRjuK/tO4qfN/tpkHmpC1UAz67knfijiZH7VOWbTGgv?=
 =?us-ascii?Q?DpObfsu9VlMKsgKBd6PHVxmDv1J5BdKNNRqMPqcY4B30Ybg4mdgON0ZMls7N?=
 =?us-ascii?Q?yJnj1SxxuXhkhAJNmBwdCi6uy0nQjsrqDmUU8kxUvNgvGSS2yDYiaxaToQ6m?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90220746-76f4-4e08-7a45-08ddc7c6da25
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 19:51:43.8418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOcssQmuXBwwYdssOEMma6HDh9Eg07QjNBlLLJV45AkQjsb3mnGONxEQj0JyzdgDCIFgfHwYjloIqm0Go4uFew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9040
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

On Thu, Jul 17, 2025 at 03:38:25PM +0200, Francois Dugast wrote:
> If the page is part of a folio, DMA map the whole folio at once instead of
> mapping individual pages one after the other. For example if 2MB folios
> are used instead of 4KB pages, this reduces the number of DMA mappings by
> 512.
> 
> The folio order (and consequently, the size) is persisted in the struct
> drm_pagemap_device_addr to be available at the time of unmapping.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 0ed66aaade14..de15d96f6393 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -220,20 +220,31 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  					 unsigned long npages,
>  					 enum dma_data_direction dir)
>  {
> -	unsigned long i;
> +	unsigned long i, j;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +		struct folio *folio;
> +		unsigned int order;

order is unitialized and if page is NULL, loop increment (next lable)
behavior will be undefined.

Matt

>  
>  		if (!page)
> -			continue;
> +			goto next;
>  
>  		if (WARN_ON_ONCE(is_zone_device_page(page)))
>  			return -EFAULT;
>  
> -		device_addr[i].addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		folio = page_folio(page);
> +		order = folio_order(folio);
> +		device_addr[i].addr = dma_map_page(dev, page, 0, page_size(page), dir);
> +		device_addr[i].order = order;
> +
>  		if (dma_mapping_error(dev, device_addr[i].addr))
>  			return -EFAULT;
> +
> +		for (j = 0; j < (0x1 << order) && i+j < npages; j++)
> +			device_addr[i+j].addr = device_addr[i].addr + j * PAGE_SIZE;
> +next:
> +		i += 0x1 << order;
>  	}
>  
>  	return 0;
> @@ -257,11 +268,14 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		if (!device_addr[i].addr || dma_mapping_error(dev, device_addr[i].addr))
> -			continue;
> +			goto next;
> +
> +		dma_unmap_page(dev, device_addr[i].addr, PAGE_SIZE << device_addr[i].order, dir);
>  
> -		dma_unmap_page(dev, device_addr[i].addr, PAGE_SIZE, dir);
> +next:
> +		i += 0x1 << device_addr[i].order;
>  	}
>  }
>  
> -- 
> 2.43.0
> 
