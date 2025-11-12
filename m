Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660B8CD343C
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 18:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CD710E78C;
	Wed, 12 Nov 2025 18:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2FmFrt5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8FB10E78C
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762970931; x=1794506931;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZtNOaxBdVKwIwanNsICeRyxgJhvR9qzFE/dxmT+lmfM=;
 b=V2FmFrt59ZrNqhkp0x7QZk05JL5CxbUFr30nHNw75x0gaRPhaOEyyFm6
 A9BzzeZZHzd8ebXsV/5181ZS/ztHn7qKOST2sABFSIB+0ZIPOLFh9q98b
 ZsIyNbvPc6zQK7GfKEH5JLZ6p/OzUWLkON6G+JwXQjb8Bzs5F5sVpVVfg
 HBIL+1sNP+R+r0kfCtGq007xxsQAzhFe9H7DRFXlB70CXNrrbBDI4hywu
 tBr12WzmTWbmqKymbODsynocCiUDlTcQE6N7qSVCjP0OVLik07Fp0vL+7
 5nMn/10oDf6mPNTQzKmB35wR20KQ0kHW1sujeSbLnuR/bm3MLQoKN9RBT g==;
X-CSE-ConnectionGUID: UQhwhw8uQJaYlwiHoAwDkQ==
X-CSE-MsgGUID: LNeP/vrjSDebPN36g0q+8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64051254"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="64051254"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:08:51 -0800
X-CSE-ConnectionGUID: Z1sp52F4QuC6upWKnCW6Tw==
X-CSE-MsgGUID: dYRRp58CQ5ixujf6tYLlRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="190022443"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:08:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 10:08:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 10:08:51 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 10:08:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiypsdN0/sD1G3XtkHLOcJLLZoeHsW0GzAeTFDHkkZoBQUw7CknQh6hLsdQoGQLrR/Ob8zAOxzl4XTLkhwcIgnku4ja0MYDekVsRoRU+MQ6xyqkxuU3RU5OW3xRCSKhkRD+4L9xY/rKjEBkBWftGh2muL1nqAKIbzZn5qaGuVj46aJw1ZHCYeTxXJGgfiAcQrzy6n2OYIHhFYXhiQJYu2OrvJ6b1xYWQlTmlK8qiJ3Ehpdy9vxcwAh76ZRw6OaUD7UrPBtikCGMIi15Qkox1nAhB8aQ2oHSopg6yuHpG+x+feAhf6gcYzdbmzuYm79HyCB1++khD4xeZJx2VJprvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZH/LJIM/u61sqAU9QplPFLfYqzW2FC3tK9KXoWwuXU=;
 b=kf3QiN2htx3ow0PCBaNVbeE3l8hWW7UhyBtbIOERaXWPao5hTguYGCY4Du3q54Jls8KM5PsaWHCs/HDfzW9b46kgAnF4VCIgmLMOTmf69/T3+T5qs4B4LJumWU0rj1y9orWdVa2opdKJpe6yBnIlWDO7WCrSogEYfUej5cRuVfZgIAd/33YUgN2YLT1Me2vLpQQubwyygGyuefNi2lsFCLeEBE+QC3uBHsPqV3enjvtjFyAGWV3XvlshxJPO9K3whWnxm6gTBuXd3k+jCXnunenQjw1X0fzobNATMMnUhWo5zUNKuLodHl3GPTBxGY+Ev/wWEFavsMmoFBvIk7Wghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 18:08:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 18:08:46 +0000
Message-ID: <a77ab4c8-05b2-442e-a754-dac9b886e449@intel.com>
Date: Wed, 12 Nov 2025 19:08:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [CI v5] drm/xe/pf: Allow to lockdown the PF using custom guard
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>
References: <20251109162451.4779-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251109162451.4779-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:803:64::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee8cf18-7db0-4cbf-1837-08de22168579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEtZWlZaald6OWNPdDFSRk9uYnRtSTFGZ0NGNlFYcXVERERTNGRWRFIwTUs2?=
 =?utf-8?B?bUYyUUFFNVBJZDVXb3ROaVR1WnFyMjE2eWtaWnJ1VnQvc1RENFdxMTFQZDRI?=
 =?utf-8?B?TG9ocHQzTXVDRFYrZTAySWNkdFUrRnFUWGRaNi9vSTVjM1JHU1lBcUVUMlZj?=
 =?utf-8?B?MnBoQVF3T0RoM2lnM1RKUEtYQ3FzT0lsTVo4TWZMTFB4TU1uZlc0UnQwS0Ez?=
 =?utf-8?B?Sm5qN1hVdEREVEZld0tZUGl6T21WM2xLT1VyaS9VS0hmUVNpOVVUZDFHMjRU?=
 =?utf-8?B?KzJ2SVlabFZXNEl0bE9PUzB5U045OSt4bVAyNFdjMnkzcU82YlIvdFZHWVlm?=
 =?utf-8?B?OStXR0lqOFFJSkRHQ2wvRzdwVUkrT2ViTTNtL2Q2Y1JoS2NwSndJQ0lDZ3J2?=
 =?utf-8?B?RTBwamRpMmkrSlB6Vm5hUk1FbTR3VS9DN2dRS1crSXpRM1BHbzRCZkhLaDdp?=
 =?utf-8?B?eGlKRGhSTTRMTCtmNjJ0V2tWenNHTzNxb0Jhb2Q1dzZmTFVtVnNDOVoySmll?=
 =?utf-8?B?MVE0Q0IyVGEwTy9YckNybXNQbTUrUFlzNm56M3hiQzlMcjlZQk5RRHpUUnMx?=
 =?utf-8?B?ZWk1Vm1sQTF6NE5ZU2oxVVRwT2NDTkVwdjNqSFBlZ25BcUxUNk9DT2FVazdD?=
 =?utf-8?B?TVdUQWhldldPQ0p6ZmJVeHdtWlNVenNRL084UjMzc1MxclZPbDB0MFBzMmxV?=
 =?utf-8?B?L1BGUHgxbUJOVHYxYW9id1A4SGxQTHBlMGRGckpkem1US2sxZzJNUzEwSEtt?=
 =?utf-8?B?cXVWdXJvZHBiYzB0TkczNU1XVFNrbkcxaUpBRmZtT1hub3RkQzRKam1LUnBa?=
 =?utf-8?B?N2hrTHVxbGRKU2JzVEFmWjFrbEZ3ZXdrUVFQeGJKK2x6ZUhRQU15aEU1OGtw?=
 =?utf-8?B?dXFONG9VOXhPN3pOS2wwY3RUd3MraWVXVUp1Yjh1OHJqMm82Z1hpdzVGNUc3?=
 =?utf-8?B?NkRJVjdLdVM1c3hKanlqc2VyMkgzYXMwQWxmNkxTUTJHT1U5RW56MGFkdWpK?=
 =?utf-8?B?blJYRU9QbGNVYksyQWFSQVY0UysxOUY3aWFKUFViaExZTmJJQ05oekU1cWE0?=
 =?utf-8?B?K3pXN2NQa2FwT002U2pSdjJZZHBkUmJBZmQyNGp3cWFpS1VLVXNodFY5NlVQ?=
 =?utf-8?B?VjJLekg3VjE3VW0rS2pkVkN0SlBQNklwZ3lHbVdvejZReHh0TXRtODNRcXNk?=
 =?utf-8?B?RVdqdkZMN1BENnhzSXM1aE5BdldYRFJmWkxINXB0VWFUVXlrOEE3MnUvSWVO?=
 =?utf-8?B?aVJhSnNYYnQxM2IzMzloaFN5K1ArRm5JZXNzS3ZubWFHa1R0bllhL01vdU5x?=
 =?utf-8?B?WjVtNXVtK2VJcUF0a0xYeVJVTWw5TXMreVZEUWdVSDFZTU9pbWVTeFhlaGRu?=
 =?utf-8?B?UW05UGI4RGpZd0Z1czdOUTQwR3J3dldFUnRoSTFERVJibnF5SjB4eDZTWDdk?=
 =?utf-8?B?K3dtcmhGNkVWcXdIajN2bUMrNFBzNFo4aGVKUk9BeC90aU5RNTFsQmxxb2Iw?=
 =?utf-8?B?d2pqb0crZWZxNkUwOVZnRkVHWWFrTHRvMnpwa3RZUTArb2I3UmswLzhnN3pX?=
 =?utf-8?B?VUs2c3hJenlwK0VHaStCMHo2ZXlFWlV4MXZLbURMNGtFbThHdUlqdm1Xd0pI?=
 =?utf-8?B?Mi9LT2ZWeWlyQy9XemJBVWRHU3RKTXE4TDI5OEJibXYvVEE4KzQ1YUJHYkJj?=
 =?utf-8?B?bXM5YU5taERYZG1tUzJZTUIwR1Jid1RGRTZaZkk1UitMOFRCUjl0OE56MnNJ?=
 =?utf-8?B?b3dtck1IL2RCZGc1Y0VUMEJkOVV0aTZLZXFtdEF5YytCQ0YrNGdjSGF6bjBW?=
 =?utf-8?B?SnNLeVhqa0I4YkRxTjFiQmtiZGowVCtURUI1blRPc0RQclV2ekxqbHhOQmtB?=
 =?utf-8?B?em13dTJWdUFpZTYvTDV3N2Z5YkZ0Qm5mdjJMRVhTaUlMSjZZamFrdkhuZDhn?=
 =?utf-8?Q?gzINdjCKChHXrtztYDmR6CKTQFCoeZDG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFicllzNFFFOVpFaFBibnBRTjM5RWV2ZndRRTltQ3NSTnBoa2xJcHUwdy90?=
 =?utf-8?B?WEJLUjV6V3FaaXV5dDdCN1FnQjdvbHJaWnFuOHB1UlY5ckNKOFJYOVdLdUVq?=
 =?utf-8?B?MlU0bDFiOW5rWnd1VmZ5Wkt3NTJmNjNLR2xhczRlRU0xdkVMMXRuL1R0STc3?=
 =?utf-8?B?YUQ5aG5iT0FRRzN5ZHlxa3ZMamVERSt1cU10YzZkdytoR0lwTXc2N0gxbGE1?=
 =?utf-8?B?TkVsNFZJYXhGMFhVa0pIaVRlM2tUN0szeUNRZXdLdnNsVEVvSlZ0NkRjZjZy?=
 =?utf-8?B?SUo4a2Q0WmN3SHREWGxvWTFEYytZSUx0bmZZZGVZYWdia0FzNUZ4c2pxTVhP?=
 =?utf-8?B?QXVhV0VUSXdUQWo0RkpFb3NwSlY0Qlkxano0K0U3bkIzRGRXOWYwaUZEcURn?=
 =?utf-8?B?aytyYUZXZ0NLT1I1RXhCLzFxYzlKT3FJZHlXUjhrZStMRjIxdkpkejdYNjdz?=
 =?utf-8?B?VVVHQ1YyOEFkdDVDUUVaOVgvMW55MC8rY1RwNlQydmdDb1lNd2tvRW5FcFg0?=
 =?utf-8?B?ejRLZWFZcWYrU3I3OURmckcwWlZJR0xVVVlGT2ZuNFJLNFFJcC8rVzd1NGhJ?=
 =?utf-8?B?cTBNKzljZndjS2huZ1g2NkV1a1FEL04vNm5OQXhlSGluOFBIMmFsQTFLbEIz?=
 =?utf-8?B?WkgrVkZLN3J6bE5Xc3dNQUNDbDNTYXoxMzMvRXYrc0t6c3NlVXQ0eTFhbFNM?=
 =?utf-8?B?bXdJWnQ3M3pkNHlPWXRqM29FMDBNUXlXNUhiZmk5WVVHdEwxODlGb3ZUQ2l1?=
 =?utf-8?B?dEVZTHB5Qm9qVGRaT0pGNlZrNnhIUDBaZCtucWtVRHVneU4yTzRobnFteXF3?=
 =?utf-8?B?a2RzWEZLakNaOWdKN3N6N2htNnRwMVlSSEJ2L3YwWkFqeE93NkFtMU5qUHdP?=
 =?utf-8?B?RWl4eWRFRlcybWRRekRXTlo5QTR1bk1NSjl2dG14ZzZUNzhpaUh0RjNFNVJ3?=
 =?utf-8?B?eEVhc04rZ2RxUGIrZmtoblhISTdGejJXK1VxaWR2OFBNeGwzeXppVzFQNjhy?=
 =?utf-8?B?T3d0cjRiK2ozVENJZTFXMlpxOUc3R2lja2tiMlhheVBua1JONTcrWjVZd0hL?=
 =?utf-8?B?NmYyQ3NnYmxUSXpUQWVrWCtvVXJpSDJnVUxRM0xYNENuZnhxdlVnTWRFZzhK?=
 =?utf-8?B?QXNxU0tWQzY4bkNOQ3hvZTVwRXBwVEc2dmVINTRGei9XS1d5VDltSTlxOWZl?=
 =?utf-8?B?TjhoREx4RGZzb0dMOGR0b0NLWEJvUTV3cmZDSllYaHY4S3JONzJaRy8zMzVP?=
 =?utf-8?B?L1czZmNEcmxndTUzcU42K3RxK0tiZFNYMk5jK09JZjVhV1dETWlXN3o4a1hC?=
 =?utf-8?B?YnZnR2JrbXVBYW1VNFQ2K3UwMTAvamhZQjFkMGN2ODVRcTlndVo0aUlOeGpm?=
 =?utf-8?B?VlZ5dGZhMEZDV0FBalZOT09YbmI0azBMUW9KOVdxZU5IMmIyV01nWFc1VHhk?=
 =?utf-8?B?aWtFUExkdm1lRm42RzhDb3ZEcTNKeFBqaUU3R1NBQk9CUGVDVTdNRUdwbnht?=
 =?utf-8?B?ck9xK1hoVnRLRDlPaHUwSlA3OVc1TnJENXg0eDQzRFZRazc1dVV4LzlyYjlE?=
 =?utf-8?B?cGtuU2lHb290L3dWc09CQ0FyOHNuUU5YQjM4SVBpS2lodUdNYTBISWNMblE3?=
 =?utf-8?B?UEFId01ia3AwNTA5bEQyMzdqNnFSYmE0MjIvMVlHQmo4bjdHMktYc3NOWFls?=
 =?utf-8?B?UlhjcDZNd29sTWtJUkRrbGlqcHJTNnJKMnlOT3lTcUQwMi8wbDNlbmQxRnhn?=
 =?utf-8?B?VjJkT3ZoWGlXbGRsN1R6NzB2NzBWWktBbXJtWjFUUFNIOEV5TW5Yd0VSNUJE?=
 =?utf-8?B?T2xjdkQrckM1czNKVjNQREorZnNKOW1aU0ZmNXBHMWdiUlNUTjVoQ3NGcFFM?=
 =?utf-8?B?L0tDa0xMRWFXNTZSeGkrbTgrL3ZuTEh1SW85Y0MwUFRsaXZKMFhIeG15WWFy?=
 =?utf-8?B?QnF4Z3JIVm93aTB2RzE4STcyNVRrWElycUtybGp2TXJmdllYZXZBeE1jK3VG?=
 =?utf-8?B?Mlp0akgxcG9iV0oyZENMZytqUDd0ZnZzUVoyWnRaWmpsWStZMkN2YzNPTDlJ?=
 =?utf-8?B?TkhFakFZb3VvMmxjS2FQL2gyUHNPYnNSUWg5bUVScEZxL2ZOTmxiL3lUb2wr?=
 =?utf-8?B?Vk9UT3ZrVE8wK3A1dkxyYUsxUHhpaTJ2NTVyMjJyRzFDRWxLSHBXVmZKemYy?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee8cf18-7db0-4cbf-1837-08de22168579
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 18:08:46.3545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YjmeRZ4bYVI6tmxZ+c7atAkW4IlIiqICCTa4G8x1xE6+dN7ft5PZhbnovysBndqhSeFR/VOYD+tWtmxs2KtLhzzGx9o7aU5D8gLzzT4b3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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



On 11/9/2025 5:24 PM, Michal Wajdeczko wrote:
> Some driver components, like eudebug or ccs-mode, can't be used
> when VFs are enabled.  Add functions to allow those components
> to block the PF from enabling VFs for the requested duration.
> 
> Introduce trivial counter to allow lockdown or exclusive access
> that can be used in the scenarios where we can't follow the strict
> owner semantics as required by the rw_semaphore implementation.
> 
> Before enabling VFs, the PF will try to arm the "vfs_enabling"
> guard for the exclusive access.  This will fail if there are
> some lockdown requests already initiated by the other components.
> 
> For testing purposes, add debugfs file which will call these new
> functions from the file's open/close hooks.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---

removed one stale comment and (with offline ack from Matt) pushed

   459a0ce8dcb1..387aba39b7be  drm-xe-next -> drm-xe-next

thanks!


