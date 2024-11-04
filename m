Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F568D132D7
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5727610E44B;
	Mon,  4 Nov 2024 14:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atQtl4bW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60C210E44B
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731625; x=1762267625;
 h=message-id:date:from:subject:to:cc:
 content-transfer-encoding:mime-version;
 bh=sgUbYp9AbIuvqxadmIuEZVNDP/EnDtICCFzRWn9zoUo=;
 b=atQtl4bWfS7bWBE21nbVnGajfp8+FWSHlqDwiuzE4VeeTnQf3qgjjDXe
 HpDHzbivkmjIDjvmCQ6NtuDHa5l9VHbP6T4nuzNb3eIR7HydqMEcJisE0
 cWuiwyR3CSmyqA8lzVgyaJx+858yKxOV8LztPEXEbUgsWkVPPHsNhZTTa
 wqeX48c6tp4N4H0BgQ7tX1Htwbv1eZHbHa/4nPLM/23LwZjHtubOOIUzY
 TJrpn8HAN9iJUl+K2JM5Z9TJnTjlF8qV90jS5U6Q5Viv4T3KSVItaS/Hq
 0abMY05vRqssQlDDaKO7MYgbJdJwlknNaFvatcXmO8KF+JF5hQce82nab A==;
X-CSE-ConnectionGUID: KkPYQh3CSZalB8ratnPGXg==
X-CSE-MsgGUID: nqGn2GHoSPaidrq1LMKnUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30538904"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="30538904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:47:04 -0800
X-CSE-ConnectionGUID: UsJTarUOTS27q00byFPYyw==
X-CSE-MsgGUID: UznsDUBySje/kSGuHmCruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83787302"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 06:47:03 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:47:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:47:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:47:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcFjuHraI0czLOSz3072yLL3uuyBCMV2c6ScnY16E0VEERVa8luAjAuf5azyUtW9Qt07qmE64jPf7cpGG9HpKZep0L04O3m4AVJ6TeOtFp4TOwoeasXedqay4wQDqYDliARk7DMLVgBW0A80vHl0xkUwwCdz4yiXYddUweOs5zo/D21pn746B02jM19bS1sIvKCdYw1i0v1nlgZ0OOkO5s2C4Sk4ks/zYAn+CCiDkDrRF3egEQbYOgVJGItNb7gFWUR50NMRUemn0l27apI7QjyTVe0tDgSEBx0n/dXKD4T+EEfSUxXClgLEmvFjIZ3JQRKHVYGz4bDamvnTQ4Z1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yszsmUxcN2GT0qdMpLhKpGeRG9Yh42T4JABUYmHxag=;
 b=wTY5E6k6kI8A7g8Bzq3zjHxC5JY91ldnovRLXNM5PQFLYH9+95Z7yveXP4f323dIWwpmbqLsKUxoJ8/3zdsHLgX7h3TmjtMYEZCVp50/i/oWl6w30U1lJZ2pFaxn6SJlELbTFHQVZ3ACibopztytk06ywdYvKt9pOZhJ4nEju1cURVTubRjoMFWcnwhNKzBZwMnPMTQMwbYDdnfRWNGRZCCNn747KRokj++Tv8SM7MCS9parOE9ispklA4MfHSz1QXW5bdYoDvno7E3KTClyjMGYVo+t6dc//EodhH/DgId38rqa8huhUjA2W3HAIN895aXzcDM7NwVfopd+LhLV4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 14:46:59 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:46:58 +0000
Message-ID: <551da6d9-cdf0-472c-a40d-ca2fb83a5b62@intel.com>
Date: Mon, 4 Nov 2024 16:46:57 +0200
User-Agent: Mozilla Thunderbird
From: "Levi, Ilia" <ilia.levi@intel.com>
Subject: [PATCH 1/3] drm/xe: Initial MSI-X support for HW engines
To: <intel-xe@lists.freedesktop.org>
CC: <ilia.levi@intel.com>, niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, <koby.elbaz@intel.com>,
 <yaron.avizrat@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c88aae-7119-4088-3f06-08dcfcdf88e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WC81SVJ1UHJzQ2JiZ2hUamtZNk9FZ0hwWFQzY1FEcVZNUWo2REh3QjRRR1RT?=
 =?utf-8?B?czRCWjJlTm1XdUFuY2FXaXQzeG56cXl4T1podXlIZm03TzVOTWxWWTAzYzhx?=
 =?utf-8?B?SllxSTJZN2plaVRpT0dvbFZPQnFub2Q0OU01YVZHL0MzeWF3V2lEcW1KNytR?=
 =?utf-8?B?eS9ubEExNG1Yb0p3WlFjOExxcWh6V210L3A5SzF6R3BOaHI0STZWZVdtMXpS?=
 =?utf-8?B?SitXLzkyN2VvWjVlK29ZZnFDZmh5QTJBMjJsa2x4NDNxWXQ2YU5XMlZQYm9L?=
 =?utf-8?B?bVVWdEJGL1pMR0lFSytGOStkazd1TFVnaHAzeEV4MDFZWWhrY0tiTFFvQ0Np?=
 =?utf-8?B?QWlwd3h6SDdlcXpnNk9vREFlSThvUHBza1ZYUkFkcFZieHpKck5HNGJWcU1B?=
 =?utf-8?B?cXkydVQvdytRd0FOTUhGRzdKanU2QTFpTkJjdEVqUHJ4N2JCSDJLMzVBT2R6?=
 =?utf-8?B?SEZyaDVWOGVMWjZ1TitNWWwrVlU3Tm5JNG85Vm4xdnE3Tk9CenlFazRyTk9R?=
 =?utf-8?B?RHprUWxKKzkyK0xpTUlEV3RybHZSdjdCcHVNSjNMb3ZFRm9jOEVqY2JSQXlW?=
 =?utf-8?B?VXIyR1pVMGtxblUzU3lvNDh2dXlOUk1XdXIxZnVlR1VNb2dmRnkxdGZ1Wi9o?=
 =?utf-8?B?MGxsKzg1NitOY1cxTzZCRjVFUmV0OUhPMWVobUZodE9JODVjTE9VdS9UaGwx?=
 =?utf-8?B?ZkVUM0lkNCtLWjhseit4dmRRK0JxK01od1grejZXZG9FaDUwNDR5TXB0ZDlw?=
 =?utf-8?B?L2R1Rm90NVVoenIvdThNMmZleXRvdHZlSHN3eHN1MU5IK2lqbEVwUUZxSFdW?=
 =?utf-8?B?RGl3M3B4MTRKalpsdWVqZUpaSWRvVDhWSURLNmhEZzkwUGZuaEdBcklUbUFE?=
 =?utf-8?B?OXNDNnp4VUlnSVBQL0RHdWg3VmlpaHkvWVorcWZoa0Y3cGpvbk5hZ2txQjVD?=
 =?utf-8?B?d1gzTDhGZHRmOXhubjltV3paem9JQ1RHOHduWjl3WWQyOVZPSyt2b1Ewa2RH?=
 =?utf-8?B?a3lEQzE1V0NQNHFaRzNqekhiTUdGTng5RDhQY1RHd1Z1bTl5cDBjTkNoMnNp?=
 =?utf-8?B?OXlVN3AwajYzWnNyWnM1VkZ1d0tzRlJsL3lEVUM1K1o4UFJBTXBXYjB5enFD?=
 =?utf-8?B?Qlp4bEZGZEJ4VTEyeVNhamFTelFoZ0ptSms4Q2ZmbXhQSzVMem1udEU4SlNG?=
 =?utf-8?B?NXI1WkxUV0J3dThCT0Q0VE4rU1ZxMnhtZmxydU4xeE1vdlV0cnZFWERCUGsz?=
 =?utf-8?B?RzdXY1lBdE5qSzV2dWl2QUlIQ3NGQ1RINHl6c0dXejdjMlJjcGNxWWpYbFN2?=
 =?utf-8?B?amltMEZjSGdMd3BKT2lsUHdFQzNpZEhYdE5hcFpSemczZFZ1ZHV4SFljcFVJ?=
 =?utf-8?B?UGgyOEs2eWVGeFVrQS8wdnZqd3ZEaTVxcCtTeUVlR0p0ZVNWSCtmTWN0cmJU?=
 =?utf-8?B?S2dONi9kU1NYOVdJUXdDenBQcGZCYitVNEJYb1gxenZSV1ZqbWwzUUZkb0pG?=
 =?utf-8?B?dmlZUEpVb2M0UmsvVzFpRTJjZUl5cXIzdGpsK2NSeU1iZUpkWGtsRzdYSGxK?=
 =?utf-8?B?aXUraDQ5a2JnOE5VNjBFc1ZoNjZoTG83VmVXeW8wYUI3NGJGK3gzRzNVaUNQ?=
 =?utf-8?B?Nk8rdzMrTVlabk1TdGpFbHVBazlTdUZsLzMzZmhBWDZJMDd2MUNZWVdkR05m?=
 =?utf-8?B?bUdDeURMTUtRSEJUdzQ3MDMzV3N4eE9ROWwxMWwrbFo2dUppZCtmbFBRcXhj?=
 =?utf-8?Q?MJnc1fvcSh2G5z9D7AYGaP6gIHy5OgaunjMmd9R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGRoSURVRGRZL1d1ZnlaZExIazRkbDlkcUNNMlVYNWZ1ZHNYODJvNzZmNWNu?=
 =?utf-8?B?MlpqZ25MNktPdWliaVpyNUliRGNxRWNlZWJKYUFoOHBHK0JyZGtPeWZESGJM?=
 =?utf-8?B?YjhuQUFYZlZ0NE5tNGc3WVowQW9WVnNGc1pGZFN0cUJWaXFINWJMZ2VrM2Zi?=
 =?utf-8?B?YjkzR2EyMVNQNnI3NFNSbUhDSUlWdHZiT3dyMzBkcnRaaUcxQ2xkbCtQcTYy?=
 =?utf-8?B?VmdMNVJiUEhSeklPYVAxVnd4WjBac2ZOZW9OUW0vNDNJQTNqeDlPT0Nob2Zp?=
 =?utf-8?B?S3lqbU9BZkpzVHEyRjAxZVgrNi9NUVB0ZFl6VGFRNElRRTUydCtiOWJERGhH?=
 =?utf-8?B?Q1RiZHFUeTdQTVNKcWRIU2lhdWdKTThHVkJYeHYwbGVuT3pEYStjdUVaS1dF?=
 =?utf-8?B?U0FWNnJoR1dGTTk5M1hwNGJGbHhZU0tWM3FzYUo1YzVJM2VYWGZudkZxdUpF?=
 =?utf-8?B?UG45RmtUZkVzUVVTQzRueWRMa1YveDd5eFpZdjNqRTVQQ2YrRGhDV3lZZDlZ?=
 =?utf-8?B?ZlFXS00yMFNmY1hOSlFVYmtWZ2xWdE9vd015REpGRm5ha1JjRFFEa3BjYjds?=
 =?utf-8?B?YndycGdoNW9oVDIwMWdZaFM5L2dQMTc0MG1hM1RiUno3WDNZUU1weUpuK0lG?=
 =?utf-8?B?MlEvS0RNby80OXJ0YzlKMHVFbkNlQzkybWF1aGY2ZjFQZFpPd3hHTEhPcjZO?=
 =?utf-8?B?eTFUVWlUQk9OSDlOb2NaNW9IeEFxQ0h3aFBPeC80b0dOUnVhRlBCK2ZUb1JI?=
 =?utf-8?B?eXo5dVRZRnJTQ250MFFjNk1qSnN1VFVJcVllMTFzV3I0TWJXOUhqM2JYWXRG?=
 =?utf-8?B?dXhGek50SlY4MlphbGhhRzczeFIwSWNWRWQvc1VkZDdDek05OVczZkxjbjhD?=
 =?utf-8?B?L2E5bG15cDhMenNDZStqeXcyWmc2OXpXUEdoTlhpQ1p6Q3VPb1kwOG1HLzJh?=
 =?utf-8?B?eW5aanVqSnZGenFZckQrQmNmN0J0elZhZjMrbkNXT3lsbCtMT29ZOWo1YzZB?=
 =?utf-8?B?ckkxSmZVWGx2ZWtZVzhabEFkVkdweVAvSjlHSmdweU9taUtueDhTUHJranl1?=
 =?utf-8?B?YkxXMnhWdlM4L2FzQ3A0RVM4MEg4b3M3Q290UytubUhqYW5uamsvSzBWdFk1?=
 =?utf-8?B?U2lqZ01MeU5ZVlpmU3lrSDlXZ3BXYkJYWGs0VURtK2daZE92Zjk5c3FWRkFR?=
 =?utf-8?B?ZVBGd3oreEVXSXJoVHB1V3FaZ2pzNVpuTWhuYlByL0tUWXhRTnVuYjF1MVc2?=
 =?utf-8?B?dVNXSTJCbXF2Z25DcnhZc2E3bmY4NUYxUlM2MmJCODlOcmxKc0c5azQwOCt3?=
 =?utf-8?B?VTJhS1pNV3hMbHFWQlVXb1doNDN2TFdSeE4rRjJ6NWx1RXoxWFE5dTdEQTNP?=
 =?utf-8?B?YUFEcC9HNFFDcUhWQ29hV1M0bjFWck0zY2F1dHZia3YzNWNFSyt3SzR6cnNG?=
 =?utf-8?B?Z1FqQXVDV2NBSy9UaDkrcGNZZGY5cWRHZHMxMWc5UEpuQnViYml2OUpvQXA1?=
 =?utf-8?B?QlpFRTZXOEg5WHpaZDVyRmpCZzkxUStFNDNDQXJreUF5bEFRQXZYTU9pSkN4?=
 =?utf-8?B?dGI2L1g0eTZlUlFORXdSMjI4SUJQeE5NdjJEemI3WHZtejE1UHZiN2tKWmhq?=
 =?utf-8?B?dkxDbUJDdmlzb0thdjlEOGppcTAxQmJLMkVnN0Uva3VSVUxrNWRmQ2JwODdI?=
 =?utf-8?B?c2RhVW1MM1gyUlJWWkpPNDR6amUyc0VjcTVSZEJveTRpTnJGQUp6QTRxWWpq?=
 =?utf-8?B?WEpIWStGcHU0TkxZc0ZWN1hCV3Z2MElpSXNCR0QvdXovSWZKM2dHVGRhVHVa?=
 =?utf-8?B?MndVTWwxbUp6aTVaYkE3alh3VDVGNTE0NTZubXJZcmpkbnpIYnI3UVNjWHJG?=
 =?utf-8?B?VVcrZ2hvYm1KWmkzaDhEblFMdEVMOCtyUlBvYml5TmN1eGNnZHF4cUxjdFV4?=
 =?utf-8?B?QjlYa0tzanVjUHA4b0ZzczVNb0FhWkQ3WGRXdVFWeXA1T0tDajBoblpiZktF?=
 =?utf-8?B?UTBJWEd4NTRCRmE2Z2Fjd3VXbU8yOTdCVUFzK0FoZHpEUnRmMnROd0w2NHVm?=
 =?utf-8?B?QVRBcWhsWEFxaFBVRHo1QzlrMWlLS0V1V2tqSDdsa0RaQldpMkowNSs3TVN4?=
 =?utf-8?Q?mtoF7lgmtcD8YzzxKY84tryz0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c88aae-7119-4088-3f06-08dcfcdf88e2
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:46:58.7126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Mkc1jXSzI13vImL6qHL1I6bh6m+o+Bx95vasvUxlT22UUgH6uuUQwC0JW3tzxeV1goAeLqw8mIFVpXxk3bX4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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

A new flow is added for devices that support MSI-X:
- MSI-X vector 0 is used for GuC-to-host interrupt
- MSI-X vector 1 (aka default MSI-X) is used for HW engines
- Configure the HW engines to work with MSI-X
- Program the LRC to use memirq infra (similar to VF)
- CS_INT_VEC field added to the LRC

Bspec: 60342, 72547

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   4 +
 drivers/gpu/drm/xe/xe_device.h           |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h     |  10 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_execlist.c         |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
 drivers/gpu/drm/xe/xe_irq.c              | 119 ++++++++++++++------
 drivers/gpu/drm/xe/xe_irq.h              |   1 +
 drivers/gpu/drm/xe/xe_irq_msix.c         | 134 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  16 +++
 drivers/gpu/drm/xe/xe_lrc.c              |  23 +++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 16 files changed, 292 insertions(+), 48 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index bc7a04ce69fd..89ed48e11e43 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -72,6 +72,7 @@ xe-y += xe_bb.o \
     xe_hw_fence.o \
     xe_huc.o \
     xe_irq.o \
+    xe_irq_msix.o \
     xe_lrc.o \
     xe_migrate.o \
     xe_mmio.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7c78496e6213..d86219dedde2 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -83,6 +83,8 @@
 #define RING_IMR(base)                XE_REG((base) + 0xa8)
 #define RING_INT_STATUS_RPT_PTR(base)        XE_REG((base) + 0xac)
 
+#define CS_INT_VEC(base)            XE_REG((base) + 0x1b8)
+
 #define RING_EIR(base)                XE_REG((base) + 0xb0)
 #define RING_EMR(base)                XE_REG((base) + 0xb4)
 #define RING_ESR(base)                XE_REG((base) + 0xb8)
@@ -138,6 +140,7 @@
 
 #define RING_MODE(base)                XE_REG((base) + 0x29c)
 #define   GFX_DISABLE_LEGACY_MODE        REG_BIT(3)
+#define   GFX_MSIX_INTERRUPT_ENABLE        REG_BIT(13)
 
 #define RING_TIMESTAMP(base)            XE_REG((base) + 0x358)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 045dfd09db99..57944f90bbf6 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -25,6 +25,9 @@
 #define CTX_INT_SRC_REPORT_REG        (CTX_LRI_INT_REPORT_PTR + 3)
 #define CTX_INT_SRC_REPORT_PTR        (CTX_LRI_INT_REPORT_PTR + 4)
 
+#define CTX_CS_INT_VEC_REG        0x5a
+#define CTX_CS_INT_VEC_DATA        (CTX_CS_INT_VEC_REG + 1)
+
 #define INDIRECT_CTX_RING_HEAD        (0x02 + 1)
 #define INDIRECT_CTX_RING_TAIL        (0x04 + 1)
 #define INDIRECT_CTX_RING_START        (0x06 + 1)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae..eff7e51198d9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -660,6 +660,10 @@ int xe_device_probe(struct xe_device *xe)
         xe_gt_mmio_init(gt);
     }
 
+    err = xe_irq_init(xe);
+    if (err)
+        return err;
+
     for_each_tile(tile, xe, id) {
         if (IS_SRIOV_VF(xe)) {
             xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f1fbfe916867..812f24a34e6b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
 
 static inline bool xe_device_has_msix(struct xe_device *xe)
 {
-    /* TODO: change this when MSI-X support is fully integrated */
-    return false;
+    return xe->irq.msix.enabled;
 }
 
 static inline bool xe_device_has_memirq(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b9ea455d6f59..8237bb1474c6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -346,6 +346,16 @@ struct xe_device {
 
         /** @irq.enabled: interrupts enabled on this device */
         bool enabled;
+
+        /** @irq.msix: irq info for platforms that support MSI-X */
+        struct {
+            /** @irq.msix.enabled: MSI-X interrupts enabled on this device */
+            bool enabled;
+            /** @irq.msix.num_of_interrupts: number of MSI-X interrupts */
+            u16 num_of_interrupts;
+            /** @irq.msix.default_msix: Default MSI-X vector */
+            u16 default_msix;
+        } msix;
     } irq;
 
     /** @ttm: ttm device */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d098d2dd1b2d..73d71acd6c7d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -68,6 +68,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
     q->gt = gt;
     q->class = hwe->class;
     q->width = width;
+    q->msix = xe->irq.msix.default_msix;
     q->logical_mask = logical_mask;
     q->fence_irq = &gt->fence_irq[hwe->class];
     q->ring_ops = gt->ring_ops[hwe->class];
@@ -117,7 +118,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
     }
 
     for (i = 0; i < q->width; ++i) {
-        q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+        q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix);
         if (IS_ERR(q->lrc[i])) {
             err = PTR_ERR(q->lrc[i]);
             goto err_unlock;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1158b6062a6c..19fd66d59dd7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -63,6 +63,8 @@ struct xe_exec_queue {
     char name[MAX_FENCE_NAME_LEN];
     /** @width: width (number BB submitted per exec) of this exec queue */
     u16 width;
+    /** @msix: MSI-X vector (for platforms that support it) */
+    u16 msix;
     /** @fence_irq: fence IRQ used to signal job completion */
     struct xe_hw_fence_irq *fence_irq;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a8c416a48812..dcbc87a31ba3 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -47,6 +47,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
     struct xe_mmio *mmio = &gt->mmio;
     struct xe_device *xe = gt_to_xe(gt);
     u64 lrc_desc;
+    u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
     lrc_desc = xe_lrc_descriptor(lrc);
 
@@ -80,8 +81,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
     xe_mmio_write32(mmio, RING_HWS_PGA(hwe->mmio_base),
             xe_bo_ggtt_addr(hwe->hwsp));
     xe_mmio_read32(mmio, RING_HWS_PGA(hwe->mmio_base));
-    xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base),
-            _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
+
+    if (xe_device_has_msix(gt_to_xe(hwe->gt)))
+        ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
+    xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base), ring_mode);
 
     xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
             lower_32_bits(lrc_desc));
@@ -265,7 +268,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
     port->hwe = hwe;
 
-    port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+    port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, xe->irq.msix.default_msix);
     if (IS_ERR(port->lrc)) {
         err = PTR_ERR(port->lrc);
         goto err;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1557acee3523..080506b2c4ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -324,6 +324,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
     u32 ccs_mask =
         xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
+    u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
     if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
         xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
@@ -332,8 +333,10 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
     xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
     xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
                   xe_bo_ggtt_addr(hwe->hwsp));
-    xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
-                  _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
+
+    if (xe_device_has_msix(gt_to_xe(hwe->gt)))
+        ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
+    xe_hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
     xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
                   _MASKED_BIT_DISABLE(STOP_RING));
     xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b7995ebd54ab..a9dcee7d430a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_irq.h"
+#include "xe_irq_msix.h"
 
 #include <linux/sched/clock.h>
 
@@ -577,8 +578,12 @@ static void xe_irq_reset(struct xe_device *xe)
     struct xe_tile *tile;
     u8 id;
 
-    if (IS_SRIOV_VF(xe))
+    if (IS_SRIOV_VF(xe)) {
         return vf_irq_reset(xe);
+    } else if (xe_device_uses_memirq(xe)) {
+        for_each_tile(tile, xe, id)
+            xe_memirq_reset(&tile->memirq);
+    }
 
     for_each_tile(tile, xe, id) {
         if (GRAPHICS_VERx100(xe) >= 1210)
@@ -619,8 +624,15 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 static void xe_irq_postinstall(struct xe_device *xe)
 {
-    if (IS_SRIOV_VF(xe))
+    if (IS_SRIOV_VF(xe)) {
         return vf_irq_postinstall(xe);
+    } else if (xe_device_uses_memirq(xe)) {
+        struct xe_tile *tile;
+        unsigned int id;
+
+        for_each_tile(tile, xe, id)
+            xe_memirq_postinstall(&tile->memirq);
+    }
 
     xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
 
@@ -668,61 +680,91 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
         return xelp_irq_handler;
 }
 
-static void irq_uninstall(void *arg)
+static int xe_irq_msi_request(struct xe_device *xe)
+{
+    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+    irq_handler_t irq_handler;
+    int irq, err;
+
+    irq_handler = xe_irq_handler(xe);
+    if (!irq_handler) {
+        drm_err(&xe->drm, "No supported interrupt handler");
+        return -EINVAL;
+    }
+
+    irq = pci_irq_vector(pdev, 0);
+    err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
+    if (err < 0) {
+        drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+        return err;
+    }
+
+    return 0;
+}
+
+static void xe_irq_msi_free(struct xe_device *xe)
 {
-    struct xe_device *xe = arg;
     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
     int irq;
 
+    irq = pci_irq_vector(pdev, 0);
+    free_irq(irq, xe);
+}
+
+static void irq_uninstall(void *arg)
+{
+    struct xe_device *xe = arg;
+
     if (!xe->irq.enabled)
         return;
 
     xe->irq.enabled = false;
     xe_irq_reset(xe);
 
-    irq = pci_irq_vector(pdev, 0);
-    free_irq(irq, xe);
+    if (xe_device_has_msix(xe))
+        xe_irq_msix_free(xe);
+    else
+        xe_irq_msi_free(xe);
 }
 
-int xe_irq_install(struct xe_device *xe)
+int xe_irq_init(struct xe_device *xe)
 {
     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-    unsigned int irq_flags = PCI_IRQ_MSIX;
-    irq_handler_t irq_handler;
-    int err, irq, nvec;
-
-    irq_handler = xe_irq_handler(xe);
-    if (!irq_handler) {
-        drm_err(&xe->drm, "No supported interrupt handler");
-        return -EINVAL;
-    }
-
-    xe_irq_reset(xe);
+    unsigned int irq_flags;
+    int err, nvec;
 
     nvec = pci_msix_vec_count(pdev);
-    if (nvec <= 0) {
-        if (nvec == -EINVAL) {
-            /* MSIX capability is not supported in the device, using MSI */
-            irq_flags = PCI_IRQ_MSI;
-            nvec = 1;
-        } else {
-            drm_err(&xe->drm, "MSIX: Failed getting count\n");
-            return nvec;
-        }
+    if (nvec > 0) {
+        xe_irq_msix_init(xe, nvec);
+        irq_flags = PCI_IRQ_MSIX;
+    } else if (nvec == -EINVAL) {
+        /* MSI-X capability is not supported in the device, using MSI */
+        irq_flags = PCI_IRQ_MSI;
+        nvec = 1;
+    } else {
+        drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
+        return nvec;
     }
 
     err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
     if (err < 0) {
-        drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
+        drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
         return err;
     }
 
-    irq = pci_irq_vector(pdev, 0);
-    err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
-    if (err < 0) {
-        drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
+    return 0;
+}
+
+int xe_irq_install(struct xe_device *xe)
+{
+    int err;
+
+    xe_irq_reset(xe);
+
+    err = xe_device_has_msix(xe) ? xe_irq_msix_request(xe) :
+                       xe_irq_msi_request(xe);
+    if (err)
         return err;
-    }
 
     xe->irq.enabled = true;
 
@@ -735,7 +777,10 @@ int xe_irq_install(struct xe_device *xe)
     return 0;
 
 free_irq_handler:
-    free_irq(irq, xe);
+    if (xe_device_has_msix(xe))
+        xe_irq_msix_free(xe);
+    else
+        xe_irq_msi_free(xe);
 
     return err;
 }
@@ -748,7 +793,11 @@ void xe_irq_suspend(struct xe_device *xe)
     xe->irq.enabled = false; /* no new irqs */
     spin_unlock_irq(&xe->irq.lock);
 
-    synchronize_irq(irq); /* flush irqs */
+    /* flush irqs */
+    if (xe_device_has_msix(xe))
+        xe_irq_msix_synchronize_irq(xe);
+    else
+        synchronize_irq(irq);
     xe_irq_reset(xe); /* turn irqs off */
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 067514e13675..abc13412260a 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -10,6 +10,7 @@ struct xe_device;
 struct xe_tile;
 struct xe_gt;
 
+int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
new file mode 100644
index 000000000000..dac339ba5ed2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_irq_msix.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "xe_irq_msix.h"
+
+#include "regs/xe_guc_regs.h"
+
+#include "xe_device.h"
+#include "xe_drv.h"
+#include "xe_guc.h"
+#include "xe_memirq.h"
+
+enum xe_irq_msix_static {
+    GUC2HOST_MSIX = 0,
+    DEFAULT_MSIX,
+    /* Must be last */
+    NUM_OF_STATIC_MSIX,
+};
+
+void xe_irq_msix_init(struct xe_device *xe, int nvec)
+{
+    xe->irq.msix.enabled = true;
+    xe->irq.msix.num_of_interrupts = nvec;
+    xe->irq.msix.default_msix = DEFAULT_MSIX;
+}
+
+static irqreturn_t guc2host_irq_handler(int irq, void *arg)
+{
+    struct xe_device *xe = arg;
+    struct xe_tile *tile;
+    u8 id;
+
+    for_each_tile(tile, xe, id)
+        xe_guc_irq_handler(&tile->primary_gt->uc.guc,
+                   GUC_INTR_GUC2HOST);
+
+    return IRQ_HANDLED;
+}
+
+static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
+{
+    unsigned int tile_id, gt_id;
+    struct xe_device *xe = arg;
+    struct xe_memirq *memirq;
+    struct xe_hw_engine *hwe;
+    enum xe_hw_engine_id id;
+    struct xe_tile *tile;
+    struct xe_gt *gt;
+
+    for_each_tile(tile, xe, tile_id) {
+        memirq = &tile->memirq;
+        if (!memirq->bo)
+            continue;
+
+        for_each_gt(gt, xe, gt_id) {
+            if (gt->tile != tile)
+                continue;
+
+            for_each_hw_engine(hwe, gt, id)
+                xe_memirq_hwe_handler(memirq, hwe);
+        }
+    }
+
+    return IRQ_HANDLED;
+}
+
+static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
+                   const char *name, u16 msix)
+{
+    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+    int ret, irq;
+
+    irq = pci_irq_vector(pdev, msix);
+    if (irq < 0)
+        return irq;
+
+    ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
+    if (ret < 0)
+        return ret;
+
+    return 0;
+}
+
+static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
+{
+    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+    int irq;
+
+    irq = pci_irq_vector(pdev, msix);
+    if (irq < 0) {
+        drm_err(&xe->drm, "MSI-X %u can't be released, there is no matching IRQ\n", msix);
+        return;
+    }
+
+    free_irq(irq, xe);
+}
+
+int xe_irq_msix_request(struct xe_device *xe)
+{
+    int err;
+
+    err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
+                      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
+    if (err) {
+        drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
+        return err;
+    }
+
+    err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
+                      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
+    if (err) {
+        drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
+        xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
+        return err;
+    }
+
+    return 0;
+}
+
+void xe_irq_msix_free(struct xe_device *xe)
+{
+    xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
+    xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
+}
+
+void xe_irq_msix_synchronize_irq(struct xe_device *xe)
+{
+    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+    synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
+    synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
+}
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
new file mode 100644
index 000000000000..9c36d11f05fc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_irq_msix.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_IRQ_MSIX_H_
+#define _XE_IRQ_MSIX_H_
+
+struct xe_device;
+
+void xe_irq_msix_init(struct xe_device *xe, int nvec);
+void xe_irq_msix_free(struct xe_device *xe);
+int xe_irq_msix_request(struct xe_device *xe);
+void xe_irq_msix_synchronize_irq(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4f64c7f4e68d..3963c25599c6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -583,6 +583,7 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 {
     struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
     struct xe_device *xe = gt_to_xe(hwe->gt);
+    u8 num_regs;
 
     if (!xe_device_uses_memirq(xe))
         return;
@@ -592,12 +593,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
     regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
     regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
 
-    regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
+    num_regs = xe_device_has_msix(xe) ? 3 : 2;
+    regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
                        MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
     regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
     regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq, hwe);
     regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
     regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq, hwe);
+
+    if (xe_device_has_msix(xe)) {
+        regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
+        /* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
+    }
 }
 
 static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
@@ -875,7 +882,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD    (0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-               struct xe_vm *vm, u32 ring_size)
+               struct xe_vm *vm, u32 ring_size, u16 msix)
 {
     struct xe_gt *gt = hwe->gt;
     struct xe_tile *tile = gt_to_tile(gt);
@@ -944,6 +951,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
             xe_drm_client_add_bo(vm->xef->client, lrc->bo);
     }
 
+    if (xe_device_has_msix(xe)) {
+        xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
+                     xe_memirq_status_ptr(&tile->memirq, hwe));
+        xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
+                     xe_memirq_source_ptr(&tile->memirq, hwe));
+        xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix << 16 | msix);
+    }
+
     if (xe_gt_has_indirect_ring_state(gt)) {
         xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
                      __xe_lrc_indirect_ring_ggtt_addr(lrc));
@@ -1011,7 +1026,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-                 u32 ring_size)
+                 u32 ring_size, u16 msix)
 {
     struct xe_lrc *lrc;
     int err;
@@ -1020,7 +1035,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
     if (!lrc)
         return ERR_PTR(-ENOMEM);
 
-    err = xe_lrc_init(lrc, hwe, vm, ring_size);
+    err = xe_lrc_init(lrc, hwe, vm, ring_size, msix);
     if (err) {
         kfree(lrc);
         return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 40d8f6906d3e..6d1c2f6c0559 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -40,7 +40,7 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-                 u32 ring_size);
+                 u32 ring_size, u16 msix);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.2


