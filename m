Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED536C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 22:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C2310E070;
	Mon,  3 Jun 2024 22:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1ciO1W6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77F610E070
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 22:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717453729; x=1748989729;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EUmjUCAQ+s/o5xoyhpBM9BmgzbQWNsFQ2rXNp9Tx7tk=;
 b=V1ciO1W6gB70Ipo676Xvd0sfsLEvfWf7Q3Td3GbBCSmOXMbzqvJSK+mx
 oxd0QyEz3Jyh9RjQfD7vy4jI5ufOcgHm+mtVwQxvcuM08JbgF+EfiNTSd
 EjTOXIMJ4eQYXUekpz18aCqsQtXfc5nn+kLVGECDmx5J0zGzT6JfQky2I
 qBccEVP7mDimvnsjURWD9WTsujGOG/pEl4DjFdXgK2ZWqYi9e5Vr5AksT
 SgE7HlzoV8Fruh+IdPMHj3UPseQJJpd98O6SzUY8DU0/Jj8VBO47otbpM
 DVLfiBVBHDFfog3S5taojUBJC0DHzVTXx2zkkVXGaIyGrLUeL7SPCpjN/ w==;
X-CSE-ConnectionGUID: jyQkaXqwQr+RjWieq4Q28w==
X-CSE-MsgGUID: xAsHh06bTSuQLoPFHkHZTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14094307"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14094307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 15:28:48 -0700
X-CSE-ConnectionGUID: ZAbrB0IBSP2hKCkRy9iwwQ==
X-CSE-MsgGUID: qo8HmU7gSH63xi60fl6Q+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41949712"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 15:28:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 15:28:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 15:28:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 15:28:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 15:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNPEY01BcFqz0XBMEYRb4qAB+VnX3gjYKElrf3FQ8J9s/zysMUs2tOUuIm3+588aslCC0vkSxDXX6p2MvDOP603MqzVh8gwUMaOLd/PyDDntH6nl+u2OXMu5IBWQm4hxSjw5RJOS+t9Ea+TGYyVYP2ISx1D0qgqre20jCYXF6QXFNiU50k1HSWn3oQFM7nPgaN2mxQfPhphteWdQry41wwvRQA4nM6ToQe5wyFqbULObenYfUBwqWhpYj0qdyBcOMW/YzMuQ9+3+ZGO4rPqY3lYUSlpzkPu+OmZK2o4a+MZJT9B9eLPvy/R2vzuNVkPNz10LCfxaMUcViCSO3QiGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cS7QqKShlZPvrwpUwG8W8hIMeo64Y95FLKMOHuSFsM=;
 b=N6QRv4DYU05HhSQgfegenIlJnHhfRLLMstgUgci/zY5u/cBqEhoBNMawNWJpr81WIkF4FO8s4rwgkgkmv8t+Y1Ko7pQk+SOLHzP/gpbTt4TOgiB0HGVTQiyD8cdNuNisA2C+D9rB6wQ9/661NZUgWazVfd/bYRzi7Vdv8GTjeIA3HoLicfvLzEkKc0y7mmK03dpayS3EOVCHIxWEWa3r4ib0abPGWZAbq78N5K26T9E/I/4c5JMxeWIdNwgVWn7C8JDEl/pJ3e6fcLf2lQJJIFLriO6c4TQ0GozzjNgvia2HkXSX4DxYf+Vz9F4DFpxD3QcYZdqmCkm3zecULBp76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 22:28:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 22:28:45 +0000
Date: Mon, 3 Jun 2024 22:28:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe: flush gtt before signalling user fence on all
 engines
Message-ID: <Zl5DcuZeZiFgxVdJ@DUT025-TGLU.fm.intel.com>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
 <e28c1e17fd9a6b7153432ff204ada2102706fb28.camel@linux.intel.com>
 <Zljle1kB6gR51RX4@DUT025-TGLU.fm.intel.com>
 <93ca58d4cbbd37cd93ce82959a8da30efd91307a.camel@linux.intel.com>
 <2f068913-5010-41a6-b24a-2a8057fa8e1c@intel.com>
 <8c242b147e2bebb614ea145ccc1a799423114043.camel@linux.intel.com>
 <Zl4AbmvJs7REtG83@DUT025-TGLU.fm.intel.com>
 <9b4fb5ec23d737b30b5377d3b00fb59aa572e9fd.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b4fb5ec23d737b30b5377d3b00fb59aa572e9fd.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e83cf16-51d9-45e5-6fe4-08dc841c87bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/1sOJ6asc/gE9QWN0tVbjcNG8oXIllBr1Yjeo8lUQ5wBZcY2monuGMmrP3?=
 =?iso-8859-1?Q?8hEgvFYB418ggh3iNq2/CjIiBeDTC8wJENn0kzzqprtSbGH3Q9pbDgXNw/?=
 =?iso-8859-1?Q?cTaXfDtHNKBWuBq/qG2pQvPyPpw1g22lDF574myRu3UfOlymr/h9OmHs+I?=
 =?iso-8859-1?Q?C13Strh1JZ7YBBVrb+ejkvA8im1sEIIbRVH63mhflJfF+uhXWbUSqJpTWb?=
 =?iso-8859-1?Q?Fq/wPu1r0uxuXk1hN6F2u1vnMqX2gogXbnyBnSpxXUPaTcw++YUu9WUBoC?=
 =?iso-8859-1?Q?WKWR1XU1yu7elbI6NxMmcWJ8rps0T0J0wa+VaB7EnPYBI4GdOYTg1+17p3?=
 =?iso-8859-1?Q?hqLYFPQGAQaNeeNU1epk7qCjL+yLvqwo/cL7aAjIJGo4LqFy3LgXIpA834?=
 =?iso-8859-1?Q?iaFDG+BAFQiyXRY/bUyV+jMNGGGxea773xo5v7J237ntA+AFTdsIZPIPSp?=
 =?iso-8859-1?Q?SY5Oazg8vupcPgHP3aJXPS/XXLIrnJSQR03eCDocOQF7p1pyhxQSKSIFoi?=
 =?iso-8859-1?Q?OpjTkGbWzcNNqtEf+6RZGS67LCt987Rtr8H3E+fYS288URgzEHUgZZMxUt?=
 =?iso-8859-1?Q?KI8xgfRzgoadgvYLdLc1vlP95Bkj95hSS5/qR8hugkVh35GulVJoAR19yl?=
 =?iso-8859-1?Q?Iz0iqcX37LIUH4K9fAeONQETKhELgAAR5/pjImt06bKUDHINXDW7H+Fcjx?=
 =?iso-8859-1?Q?ggkKt2C6tUeG4M+sS3Y3ErVk/KldxZLUXi6ZlM9FSMz/WOeonSvwUAmJuY?=
 =?iso-8859-1?Q?CXhnDdldcjJMW6FlL8X3V7n0ApehFTCtnvkN64AXI0gwiRUVSOtKq5DNQR?=
 =?iso-8859-1?Q?IFHFfQOiSKg/UgIrOiqDYQBn+lwJxPXN3BkEgssDyCpsWtiWueheAo5kSL?=
 =?iso-8859-1?Q?4G4mEMKLGVmg+inXHIBYizW/NF4RGdJaNqB+ptSX0+ihilCEqx5l57gmMZ?=
 =?iso-8859-1?Q?glgBReglha2PyxI24EsZU3uuWhI49Ru7taJclDv8FgQQ7Y/L8UDf8/Ayts?=
 =?iso-8859-1?Q?Hus/AFIiclK+RVIEAQJlF6D2Khpdc+dPe0zoLyM7PLEyrdT/nrD/uHhhcS?=
 =?iso-8859-1?Q?+FYZMH8Ag9fbAoTY89azP4tmOOv1IBrgiAwQ6J092H9sqvaKblVbwqZBkJ?=
 =?iso-8859-1?Q?h0cOHXHSU2cKOFL/Ukee5dw8qhHpXpivrUqNUR1kiaNkBay78u+KAbVSoj?=
 =?iso-8859-1?Q?LDbU35YHvE6gS3th1ovz6XpHaYF5NLXKuZaH63FtjrhTOr1jF7fZvKZmmc?=
 =?iso-8859-1?Q?u7QbNQQsbmXBPcnPy3OTyeCy7/2XuaEkyDF2jcQHw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QwACql3hT5va1hTCIUCGSB1mf5Rs9DAM2Ul7cjWf7VkD1FH3JG/jI677/1?=
 =?iso-8859-1?Q?bH/zXVN5nuvMy4Xgt6BAaRLp4ryjfAa5+GyRQnHed9ax1+0/+9N1v9G7Ob?=
 =?iso-8859-1?Q?nxv6rb9qqH9M/BNloXcpLqzWpxDCKfo5euU69gnPv4juFRllj4QeDGKvPU?=
 =?iso-8859-1?Q?UPCIjrMiFHWwyXMh3IG/20IJxWx34d+UJeX8wDEhGHCPNYF4ibdcr5c2+Z?=
 =?iso-8859-1?Q?8KK9pAkNcz257PUG9rpAwB1A6kRdcoD6A34uFpzR4DIqp2Y9E7Qbj/RKMM?=
 =?iso-8859-1?Q?Hvs8XcgUCNVfPAcqq2OMRHARrObu2SmhS8JswO7PCaiHshsJ1j4+r+3rVg?=
 =?iso-8859-1?Q?urtn5ZtqP22hHfBP7ld0KdC69bTBayV901GzhHaSJzJtCu11ZHj45n/4U+?=
 =?iso-8859-1?Q?MUO5hM63nZ0fK3NGkcHu6r894gju999EpdyM+sYirDR+liSI82njJvWMFO?=
 =?iso-8859-1?Q?46/qVG+siyhrwIDo4JHnRuS58XNHNp5kI+ocu7oe2EddhevM7ZVDVqOkHg?=
 =?iso-8859-1?Q?SN6fJNyR+VFkN2rgk0wbFCSbD5bEVnXLsdbBkEPSzicHvCPZ8OzvkL9+1K?=
 =?iso-8859-1?Q?oDPEQ4RbsBOmWf/X8RCW3glyR37SBRGuLvrJk1iCLW1OAvvBhkH6fiFgW9?=
 =?iso-8859-1?Q?3+dQH8N29eoupoB4Yj7tMHFvdh7xg29bBOEPyVw8en0Hm7ylEJcJbk+swn?=
 =?iso-8859-1?Q?YgA4YPtboXkQis3pDTIpP0x5iCWg6OBsUIaKk9zTyHbiJjCMMKbgSrwzLT?=
 =?iso-8859-1?Q?bQt3audvQPgGb1VFoWKQeWCiRfuxXtW7fgPMowbQ5bm931eX5dO/F5/Eaf?=
 =?iso-8859-1?Q?tw60zw1UTLK8Lyyc02Gs9Vo1roJmb8wJCEexvcDjgfqp2TKkTGE3ROn/RK?=
 =?iso-8859-1?Q?sD/eQKdLlQ3N7Aw2dv2mdaMMj8U+jqQRxk+OQabARgK5MhrbJ7EpEa08CF?=
 =?iso-8859-1?Q?lY3UoJ2FP4Dq9OKDDVDGcJ3hNjExxRQ3hlUAmpVhZkwUcrDfrrgSizaNag?=
 =?iso-8859-1?Q?DRExxPjgPOFJXP8dkZ3ym1D9qPlI8uwVlR37paAhU5UoFI4Dex64fe5mAW?=
 =?iso-8859-1?Q?icCGaZnOqq7rtO0ykyvRJ90BLFJ6YJbfoW6N3ixKTiXTIeXvv2/2YPe3k5?=
 =?iso-8859-1?Q?l+BBHLePiSAyVKkW18nQF1v0/EvGx/R4UWxee0nKb/iIge40IiODIv8ZKq?=
 =?iso-8859-1?Q?pUO1cZ75PJyDSjvUyaUSLIaw6dG7AICGpUaZZkT2mi05PSgmS2bqTVhJUj?=
 =?iso-8859-1?Q?SShLOgS0XrPigtKRi6+ugnpa8PtxRjiIN/tdPc6Hs3QP10oZ2GhVHJ09UL?=
 =?iso-8859-1?Q?E40L/4YcC0bD9a0tuRqbqR7OeCGr64Yp1kl1+X9bbwjPuefhV8g0u9tJnv?=
 =?iso-8859-1?Q?MfpHvsDQg8HNT77bOMXoS+30iTGqpFrkNao08VaCJviwqUrERg3sJq97Dn?=
 =?iso-8859-1?Q?pAX7YlwGe6JPbRwbLekROk4VGjA3Tv7WKpM8VDIjlcl6ytsj8QeLH+Qxpf?=
 =?iso-8859-1?Q?QoZIeUUSZFuMh8/GYPodDgFG1ihd9WgrSThxG2sdaYQFwgsKLjLieE4vcE?=
 =?iso-8859-1?Q?WoC7iUsWjNywY6/BPIkazoE3cYuKi2VEInu9pSI44NNTbDxs1qxTVYw5YN?=
 =?iso-8859-1?Q?RX74HXxBEdvKx5Y/QLKLs0l8liFwXfK8oP1mTZHVMUVub3ZOP4MV44xw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e83cf16-51d9-45e5-6fe4-08dc841c87bc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 22:28:45.2260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnGJiOwUYMrWG2PGXSJJY9xAEKaIDzXi4UyNgcU55OfT1cQb9P2gZhtjE6+ri3d0msSfmIh94lmbLjwDwRU7eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
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

On Mon, Jun 03, 2024 at 10:35:00PM +0200, Thomas Hellström wrote:
> Hi, Matt.
> 
> On Mon, 2024-06-03 at 17:42 +0000, Matthew Brost wrote:
> > On Mon, Jun 03, 2024 at 10:47:32AM +0200, Thomas Hellström wrote:
> > > Hi,
> > > 
> > > On Mon, 2024-06-03 at 10:11 +0200, Andrzej Hajda wrote:
> > > > 
> > > > 
> > > > On 03.06.2024 09:35, Thomas Hellström wrote:
> > > > > On Thu, 2024-05-30 at 20:45 +0000, Matthew Brost wrote:
> > > > > > On Thu, May 30, 2024 at 01:17:32PM +0200, Thomas Hellström
> > > > > > wrote:
> > > > > > > Hi, All.
> > > > > > > 
> > > > > > > I was looking at this patch for drm-xe-fixes but it doesn't
> > > > > > > look
> > > > > > > correct to me.
> > > > > > > 
> > > > > > > First, AFAICT, the "emit flush imm ggtt" means that we're
> > > > > > > flushing
> > > > > > > outstanding / posted writes, and then write a DW to a ggtt
> > > > > > > address,
> > > > > > > so
> > > > > > > we're not really "flushing gtt"
> > > > > > > 
> > > > > > So, is this a bad name? I think I agree. It could have been a
> > > > > > holdover
> > > > > > from the i915 names. Maybe we should do a cleanup in
> > > > > > xe_ring_ops
> > > > > > soon?
> > > > > > 
> > > > > > Or are you saying that the existing emit_flush_imm_ggtt is
> > > > > > not
> > > > > > sufficient to ensure all writes from batches are visible? If
> > > > > > this
> > > > > > were
> > > > > > true, I would think we'd have all sorts of problems popping
> > > > > > up.
> > > > > It was more the title of the patch that says "flush gtt" when I
> > > > > think
> > > > > it should say "flush writes" or something similar.
> > > > > 
> > > > > 
> > > > > > > Second, I don't think we have anything left that explicitly
> > > > > > > flushes
> > > > > > > the
> > > > > > > posted write of the user-fence value?
> > > > > > > 
> > > > > > I think this might be true. So there could be a case where we
> > > > > > get
> > > > > > an
> > > > > > IRQ
> > > > > > and the user fence value is not yet visible?
> > > > > Yes, exactly.
> > > > > 
> > > > > > Not an expert ring programming but are instructions to store
> > > > > > a
> > > > > > dword
> > > > > > which make these immediately visible? If so, I think that is
> > > > > > what
> > > > > > should
> > > > > > be used.
> > > > > There are various options here, using various variants of
> > > > > MI_FLUSH_DW
> > > > > and pipe_control, and I'm not sure what would be the most
> > > > > performant
> > > > > but I think the simplest solution would be to revert the patch
> > > > > and
> > > > > just
> > > > > emit an additional MI_FLUSH_DW as a write barrier before
> > > > > emitting
> > > > > the
> > > > > posted userptr value.
> > > > 
> > > > As the patch already landed I have posted fix for it:
> > > > https://patchwork.freedesktop.org/series/134354/
> > > > 
> > > > Regards
> > > > Andrzej
> > > 
> > > I'm still concerned about the userptr write happening after the
> > > regular
> > > seqno write. Let's say the user requests a userptr write to a bo. 
> > > 
> > 
> > I don't think this is a valid concern. User fences should be limited
> > to
> > LR VMs. We don't enforce this, but I think we should add that
> > restriction. It should be okay to do so unless we have UMD using user
> > fences in a non-LR VM (which we don't).
> > 
> > I'm going to post a patch for this now.
> > 
> > > 1) The LRC fence signals.
> > 
> > In LR mode, the hw seqno / LRC ires unused. We signal LR jobs fences
> > immediately on upon scheduling.
> > 
> > > 2) Bo is evicted / userptr invalidated. pages returned to system.
> > 
> > In LR mode if a BO is evicted / userptr invalidated either we kick
> > jobs
> > off the HW via preempt fences or if in faulting we invalidate PPGTT
> > mapping which causes a recoverable fault.
> > 
> > > 3) The user-fence writes to pages that we no longer own, or causes
> > > a
> > > fault.
> > 
> > Either exceution is resumed via rebind worker with valid mappings or
> > upon page fault we create valid mappings.
> > 
> > With this, I believe the original patch along wiht upcoming fix [1]
> > is
> > correct.
> > 
> > Matt
> 
> While I agree with your analysis that this is not a concern for LR VMs,
> I definitely think we need to take a step back here and we should *not*
> rush in a fix for a fix that involves changing the uAPI, because if we
> have to revert that, things are going to get really messy.
> 

Agree, sorry if this came off as rushing a uAPI - that was was not my
intention. As mentioned in other thread, yes the uAPI is an orthogonal
change and should be discussed as such. 

> First, I've been holding the original patch back because I think it
> isn't correct. And it obviously introduces a security hole with the
> ordering change here. I think this patch should be reverted so that we
> don't have to add a "fixes for fixes" patch, and I can leave both the
> patch and the revert out of the fixes pull.
> 
> Restricting user-fences to LR vm's should be a separate discussion.
> I've definitely recommended using user-fences for synchronous vm-binds
> because of their simplicity, but those are cpu-signaled so a different
> story, but if we don't use user-fences for !LR vms, I wonder why does
> the first version of the patch attempt to correct the behaviour of
> user-fence in the media ring ops? Are we using LR vms with media, or
> how was the flaw discovered? In any case, this needs to go the proper
> way with uAPI change discussions and UMD acks.
> 
> To fix the original issue, couldn't we use something along the lines of
> (if I don't misread the MI_FLUSH_DW docs)
> 
> 	if (job->user_fence.used) {
> 
> +		dw[i++] = MI_FLUSH_DW; // Utility function for this.
> +		dw[i++] = 0;
> +		dw[i++] = 0;
> +		dw[i++] = 0;
> 
> 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> 						job->user_fence.value,
> 						dw, i);
> 	}
> 
> So, in short, from a maintainers POW I'd like to see
> 
> 1) Revert of the original patch. (drm-xe-next only)
> 2) Proper fix (drm-xe-next) pulled into drm-xe-fixes.
> 3) Any change in uapi discussed introduced the proper way.
>

+1.

Matt
 
> Thanks,
> Thomas
> 
> > 
> > [1] https://patchwork.freedesktop.org/series/134354/
> > 
> > > 
> > > /Thomas
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > 
> > > > > > We should also probably check how downstream i915 did this
> > > > > > too.
> > > > > > 
> > > > > > > and finally the seqno fence now gets flushed before the
> > > > > > > user-
> > > > > > > fence.
> > > > > > > Perhaps that's not a bad thing, though.
> > > > > > > 
> > > > > > I don't think this is an issue, I can't think of a case where
> > > > > > this
> > > > > > reordering would create a problem.
> > > > > > 
> > > > > > Matt
> > > > > /Thomas
> > > > > 
> > > > > >   
> > > > > > > /Thomas
> > > > > > > 
> > > > > > > 
> > > > > > > On Wed, 2024-05-22 at 09:27 +0200, Andrzej Hajda wrote:
> > > > > > > > Tests show that user fence signalling requires kind of
> > > > > > > > write
> > > > > > > > barrier,
> > > > > > > > otherwise not all writes performed by the workload will
> > > > > > > > be
> > > > > > > > available
> > > > > > > > to userspace. It is already done for render and compute,
> > > > > > > > we
> > > > > > > > need
> > > > > > > > it
> > > > > > > > also for the rest: video, gsc, copy.
> > > > > > > > 
> > > > > > > > v2: added gsc and copy engines, added fixes and r-b tags
> > > > > > > > 
> > > > > > > > Closes:
> > > > > > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
> > > > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver
> > > > > > > > for
> > > > > > > > Intel
> > > > > > > > GPUs")
> > > > > > > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > ---
> > > > > > > > Changes in v2:
> > > > > > > > - Added fixes and r-b tags
> > > > > > > > - Link to v1:
> > > > > > > > https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com
> > > > > > > > ---
> > > > > > > > Matthew,
> > > > > > > > 
> > > > > > > > I have extended patch to copy and gsc engines. I have
> > > > > > > > kept
> > > > > > > > your
> > > > > > > > r-b,
> > > > > > > > since the change is similar, I hope it is OK.
> > > > > > > > ---
> > > > > > > >   drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
> > > > > > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > > index a3ca718456f6..a46a1257a24f 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > > @@ -234,13 +234,13 @@ static void
> > > > > > > > __emit_job_gen12_simple(struct
> > > > > > > > xe_sched_job *job, struct xe_lrc *lrc
> > > > > > > >   
> > > > > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw,
> > > > > > > > i);
> > > > > > > >   
> > > > > > > > +	i =
> > > > > > > > emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > > > seqno,
> > > > > > > > false, dw, i);
> > > > > > > > +
> > > > > > > >   	if (job->user_fence.used)
> > > > > > > >   		i = emit_store_imm_ppgtt_posted(job-
> > > > > > > > > user_fence.addr,
> > > > > > > >   						job-
> > > > > > > > > user_fence.value,
> > > > > > > >   						dw, i);
> > > > > > > >   
> > > > > > > > -	i =
> > > > > > > > emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > > > seqno,
> > > > > > > > false, dw, i);
> > > > > > > > -
> > > > > > > >   	i = emit_user_interrupt(dw, i);
> > > > > > > >   
> > > > > > > >   	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> > > > > > > > @@ -293,13 +293,13 @@ static void
> > > > > > > > __emit_job_gen12_video(struct
> > > > > > > > xe_sched_job *job, struct xe_lrc *lrc,
> > > > > > > >   
> > > > > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw,
> > > > > > > > i);
> > > > > > > >   
> > > > > > > > +	i =
> > > > > > > > emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > > > seqno,
> > > > > > > > false, dw, i);
> > > > > > > > +
> > > > > > > >   	if (job->user_fence.used)
> > > > > > > >   		i = emit_store_imm_ppgtt_posted(job-
> > > > > > > > > user_fence.addr,
> > > > > > > >   						job-
> > > > > > > > > user_fence.value,
> > > > > > > >   						dw, i);
> > > > > > > >   
> > > > > > > > -	i =
> > > > > > > > emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > > > seqno,
> > > > > > > > false, dw, i);
> > > > > > > > -
> > > > > > > >   	i = emit_user_interrupt(dw, i);
> > > > > > > >   
> > > > > > > >   	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> > > > > > > > 
> > > > > > > > ---
> > > > > > > > base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
> > > > > > > > change-id: 20240521-xu_flush_vcs_before_ufence-
> > > > > > > > a7b45d94cf33
> > > > > > > > 
> > > > > > > > Best regards,
> > > > 
> > > 
> 
