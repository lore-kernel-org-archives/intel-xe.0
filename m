Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D224C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C1A10E181;
	Tue, 25 Jun 2024 21:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVPoD1GB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447FE10E157
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 21:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719352526; x=1750888526;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mUwhJMdVTXGeMknyNLyDnbgXM+mk8ZFkxoC5R0Wy31w=;
 b=DVPoD1GBNxscZX9MPZZoAdEMULnNO7MmAlOxCEImLX/UNF0btcfRGDlR
 i2QXhorQUXQ3clAl68uYhdU7f7vszHy2f+tYl+eNWJ9dsyMeMI8Sq5YeE
 QWKdGBs8PzGVhZKXnmb1fPRDtZDVHV4yYTHG4ieEp1WjywmgBOHuHfJBG
 M0SHkVU8BxptLyiOlmdnX/mFSBoaQjUi0DvrohFrdpfK8gCT6WYLfov+l
 Hof3dz1Od/akZc/h7yXoeF7iCtWulhVKKluSCd63yPNsRCaz7NXE8TXFS
 4p+bKqFUlgrP0txDymxPk1fLSH2d+yiK5jUdtM+lmNGSFE7aifbQBBE9I A==;
X-CSE-ConnectionGUID: xpBDaSUAQBCKLFNM/NF8cw==
X-CSE-MsgGUID: 02LOFrmGRUWhpZ72rE7nIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16275083"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16275083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 14:55:26 -0700
X-CSE-ConnectionGUID: oObgegzRR8yq8g9QtlOkfQ==
X-CSE-MsgGUID: 1+YBV5YWTEGDdQmrY/3RMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="43653806"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 14:55:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:55:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 14:55:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 14:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBqfJy3irI/4lm8Gu3Eb3NWaNvLS0NxCvbyZXZI303qQDXw5ZF0FqSzxwPZhe5kzdVo+L5Dm/HvYXmQn4Nn+SszzNoxD6Ze/zXiwW1aQ9oUP1y+yjAZsxZg1jbxUc4bFWDRqWQKxBKewzBW0J415fVGMEd4GKAC6FuiF5rLF5Vkd1a6Dg8LTzHmFKrQpPaDpjREWtILmptgxIScma5o1ajhjvvc0e0OB6DKJQdWnXEaLY6rRJnms5V2JoYeomvGgo8JgcapiozR7bzcloDH2Fo8Hhl7k1crhRaWO3VnGK01ps2k18sUYoE/30633EHP8O4hX6QyByhx98/gbBeRZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVCAfEoOlgs96B5L5Jmzb8SiaULhMUSZPK0ZeMg0YvU=;
 b=BQ0K0T+/4khefuIENIv+qrUVlXieDjVXzlgo3lKKSntykZ7P6rnaMrzcb44qDRbJ7dHqm/SGYhYpxjHkG9YIbxEvSOhTsb57liV5Dkc4g7sNYf32o1QfHWcoFsR/oqOQ1lrULyAOwGR3v+5hQBrddqDtpZCGXfolkPPylxDl6KCwp2eWYYprycSvGbgyLs8hQQYhk9yk4zhnEm5D7IeAch91+sbmibWGe3yb6JFKAwb/t3clvRHUTSxPz3YxOGLcIfthspsdM1iMu6RnRsOKwDlDKItG0GQRrAvD2tgI3yodgA7NypNxX0Hynh1Pq/EUK1WGvol0NxPYO6cvGF9Uag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 21:55:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:55:22 +0000
Date: Tue, 25 Jun 2024 14:55:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Jose Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/oa: Allow preemption to be disabled on the
 stream exec queue
Message-ID: <Zns8yGvoUSSLpZQe@orsosgc001>
References: <20240625201518.766925-1-ashutosh.dixit@intel.com>
 <20240625201518.766925-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240625201518.766925-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: a1af428c-2a16-4ef5-7c19-08dc956182e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eCtwT0VJYitrUUN5SktzODd5R0FXZmIwYUlRaG9zeVJZaC9CTHJxbUU4VnUx?=
 =?utf-8?B?blZPaXZBMHIvN29HaHlFREVYKzg5YmRBSDZNTnBhSFJhRStyZkpQQVF5STdY?=
 =?utf-8?B?SDcxeVY2WmQzUU13K0xkK21LUWdNamFVZ0dBRkExdEJEWWl6cGM0QjMwQjkx?=
 =?utf-8?B?Q1ZxekRCbnVMZDlzKzMyM1VmQVBmRS9WcFBSUG1jZklQSERoeFVuRVdHTzFp?=
 =?utf-8?B?WkRYdnRuR1VnNmkray9xQzJGUmtwRTdqelNyYTVEZE1OTmJTVmdYODRJRUpO?=
 =?utf-8?B?TzNUTUQ2Q0Z5VWdEdFVOaVJudXZiOHZFb3NMVXAzd0FyTGlLQWxyTXVHaE5j?=
 =?utf-8?B?czIzUGx5blpDV2JaN3dSQ3BYVG1wQytVKzlBN2ZsUXdKbjZuaGxrZkwzZnBM?=
 =?utf-8?B?Mi9leVFTbXlkMTlaYlN5U3RiY1dYQUVxM1NkdmhQQU1LMlJUVUJCYkd6YVZH?=
 =?utf-8?B?OFdvRFFzN1cyaTdKUjRKUlhVdWFreTd5NmU5dkdRRGZwdVkrWldHSVRZYmE3?=
 =?utf-8?B?MWV6WlpOT29LTTBreGxaQUNwSis5bkV5QjRyRlVGSGlUN3hkM3p2cFlnN2Nm?=
 =?utf-8?B?UlhEelRpUkw0S05VTXZ4S1VNdkpSWlVZWEIyckhrVlk2czZiMzgrWVlmSFc1?=
 =?utf-8?B?VzNUSDhmcXI3bldhZnZOeGxkR3VHdzU4OEI1K1BYOVU3UmI5VS8yMGMzeTcz?=
 =?utf-8?B?UGw0SUFlWHVMYXAvV01qKzV1ZmliWmRkUjJyeFFRWlBQa21NdHYvdzY4dm9S?=
 =?utf-8?B?MndFY01lanlDbmFxeTNoRXpVclBCdUo4R0ZRVTUyd3RpNGZQTlBpNCs4cS9o?=
 =?utf-8?B?RjYzQzRtOUJPdlpTdDRobTlWN3ROZzBUaFlZa0trNFdIaHc5RnEzSlE1bWFM?=
 =?utf-8?B?MWdjdXR3akhnL3lhYWtkZUpNaGNtVlB3KzhmWHcvcC9GaDVMTWdSTFlwMVYx?=
 =?utf-8?B?UG1ic25kM0hISXFSdklXYXQ2WlpuSnBBM3pRYUI2NXltQzE4cXpBZlZUY0FY?=
 =?utf-8?B?OGlleVU2K2dKMEFvMVlCZFNoUjlVZjNPVUloZ1VFclVIajhoMlNGcVAvWi9y?=
 =?utf-8?B?QUFiYytkVVl0cWRWK1JOOGZvdFk5ck00TSszcEtNUCtRMWV3c2tBWkFUcTla?=
 =?utf-8?B?UWgwZEN4cExjRkVnMGNtT1lrZ2R0aDF1ck5LVTYwb0ZES3licyt2WEJCYnVx?=
 =?utf-8?B?eU1pZksvQVFKZlJGd1VSSjU2TkRhZit2d1pFOWRXRG15cEdpa1M2ZnpudnVQ?=
 =?utf-8?B?YXdjak8vQ0YyODR5NEx3ZU9KWkg4bkJWbXRhcklabDh4NVNGclpLNnJ2OUth?=
 =?utf-8?B?N3pvZ2kyTkx2eDhORE5xZ2M0WWgwSk5qVUdOVytvZlgrTWFXSWdOQVh4N0tw?=
 =?utf-8?B?NEt0Y3hqa2NKU3Qrd21SUm9IZ2NnYVVhUi84YzcyN1JpK3pzUUFtUk9xNEQv?=
 =?utf-8?B?NGlVVmhqTXphQ3VVYzZ2ZGMweDlSTEJTbWREN01zZlFBWjRGQ1RqdjRNYXdS?=
 =?utf-8?B?WW1tTjhtZGt2OHI2emMzbGlWb3VXbE1jbU5ZeXNMaVYySEluWDJtT1VxeTZa?=
 =?utf-8?B?MnR6bWRGRUZDd1pKblVQU0djTW5zSlhNVm1yVk9uZW80S3lsT1RVUXllVGpB?=
 =?utf-8?B?NkdyS2tadjBtZEd2MzNTbWljTER3cTZuQ3R1MEF4RXB2ckVEVVJtbUhJL3ZZ?=
 =?utf-8?B?V1NnRkVHOVNyZ1hHeUtYRHVZNGVucjVMNWtmTzlpeWV4NTdyQTY3MzB5VWh2?=
 =?utf-8?Q?w0rTSxCqk3N7sZJJpf9EkzHcaDPpMJQ1k+hjfNi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVVrR1FsMUZXWVE3T1VzRmRwUG9CL1R5ZktyaGhDYm9RNm5wWUhtYVVtemVY?=
 =?utf-8?B?Rkx5THdKMFUrUk9nY3Z6My92NjFwamNHNWRGUXhWaTdyTC9ueW1GQW9KSWxR?=
 =?utf-8?B?bjV6dVJzWko3NUNqN0ZCcERVbExpV0o4SytZcWlreHhwNng0Nm9kcDJGNlJQ?=
 =?utf-8?B?TG4rUUNtamROK0ppK1U5WnpOUW5JRW9IRCtNa1FndFB5SDgzUk1iWml5NktQ?=
 =?utf-8?B?R0d1SmsveDhnR3B6T1NxanR4b0dLM1F4aGkwWDhTNTB0WjdTUXg3K2Z5VmRO?=
 =?utf-8?B?amtCKzlCN3l0SUVFa3FtUXlRMU9zZjQzUElWWGRPMHgxWHVvNnczQlVuaXYv?=
 =?utf-8?B?NFJWWkJHcUFNVDBZelhjOVVpeG92YTBkMzVUem1IWkJOR2swWVQ4TkJ5UVU2?=
 =?utf-8?B?MzAyd3JXU1pOL1ZIVVA4NmVvWTM2R2pReHRQY1VxZmZheWMzUnVBZFRiUWpO?=
 =?utf-8?B?dGloNzBGSUhlNmdRZ05OOU52bWFXMmRzeGFjTHMrZms5Q2xwVFVHc1V5cGV6?=
 =?utf-8?B?UkdpdVBiaGlDbnh2bU52SkV3RDVDTitxUHUvRi94enRYQlNOTFdaRjk5N2Rn?=
 =?utf-8?B?S0ZOL3VSbmhaZmJIQmlLd0lmUnpwMUU1T0d1MmxtclFNRlNSRU1mcWVjZUVi?=
 =?utf-8?B?NVZ0QjVuZEpUTDJvRktsY0ExUVZrZi9HSkgzWTJWOUpSNHZyQUlqRURIejJi?=
 =?utf-8?B?S2JmRzZZaGVpRWVTeE05cFI4V2hCZnRpdUlmdGVtd0JGV2tzY2VKcFE2M2Ny?=
 =?utf-8?B?RjJGMWx6QWNwVGVlVldYWHU3TVJpNDdHc3ZTODk0c2g3OTVQU2UwNDk3Zk1Z?=
 =?utf-8?B?S0ZjZUp4VHBkQWFwK0xTWjJRcm5zeUx4bWV5d2pmK2hSZkJXUUx2RmF5Tjda?=
 =?utf-8?B?M0ptakd2eVhPb2xwRGxZQ09OODN6cVQ2ZHpVOHZyRE5iYXN3MVR2S1QySU5K?=
 =?utf-8?B?SXg3anhSU2FCQTdaZytqMy94TU1pQXN6SVAySjhOYjFoajBVdGkvUWdIcUVt?=
 =?utf-8?B?QWhlQllZMUVLS1YyQk5BYWw2QWhUcDg5ZWoxTDZ4SHMrSjhldWJiVzgvMjQ2?=
 =?utf-8?B?ZnhrWDMyMWF2M285MEdsMzBBdU5BQXRVZTRReGJ5WGt0NE50TGttTHpjOXNU?=
 =?utf-8?B?ZXhOb2lQQnNueHB1TTVRRDBtQlZpNzV2WW1QQVZrMmxUbzU2TnREV1lMWWR1?=
 =?utf-8?B?UFZnYVNpekhaaGFJeDEwbFJiL3hOWDVnNFh3Yml3RlpPcklEOHIwREpyY0NE?=
 =?utf-8?B?UE9wdzhkbUFNV0pWaXlqWWN4Qi9zeWl2bjhpUkpYVGxoemZNK0cvNWhWZUpK?=
 =?utf-8?B?TnQ0eHhJNkZ6enVlbG9IUG5EUTcwQVZVOFdQQzc0KzJaL3lzd1dXbDBiWVFt?=
 =?utf-8?B?WHNjN3NURU82RmJLQnpvVkpmM1FwWDRNVHNDSTlEYXhrSkVVOC8vUElyQVlJ?=
 =?utf-8?B?YVdsRUpDS0ttTW1DcENLRkNYYjcvU2RJMHdweC93RW5wYnRXN2ZRakcwYi92?=
 =?utf-8?B?TTh1bFpTcU9TdE96TFBHc0dvZWI3am1CVXBLKzNkTitYRExvNndDM0RlOHd2?=
 =?utf-8?B?akdEdE1qQ3lIWXc1RTJGOTk4ckpQN2kya3d1ZGZVMVd2cVZPRlNSUHFFa21Y?=
 =?utf-8?B?MDQ4bEFibElWNUVyb3BEV0NiM3hxT0VrMUJRTjgvV0VTM2Q2ZTRHa0lha0o5?=
 =?utf-8?B?YVArT29GSWRRUU42K2taa3FhWDF1NjJhTHVscm5zZjNhRWJPYUszc1NPM3JZ?=
 =?utf-8?B?dy9sS3JaTmdmbVF4Y2NxcllMNzFiN21oMWZiaS9EbkdpUUZoYml4cFBrVG1K?=
 =?utf-8?B?Z1ZGb3NiVXJ0UjdZeDhyVUtRVkZrOE5taHVEZWZSa1AvRUl6TkFxWWtUUnRj?=
 =?utf-8?B?SldtcDVmUXpkbVBNMFVGTUtPTGJqTlI5Z3FZRCthUUdock1aSktFMFU0c2pp?=
 =?utf-8?B?YVV3T3NqSUZoeHNnRXozYW95ckJCUXNIT0xjM21IZ3FnY3R2SkRXbUc4cGJG?=
 =?utf-8?B?c3NrZnFoMEd6QjlyR2V0NmZmMllUelJSVzZ0Mng2cmtMMS9jdnAyOEFSVzlv?=
 =?utf-8?B?QkpCUGZuTk9kREQzeTUzZ0hCbnJ3Si9HR3R2SklDWDZlTXdqM2FXS0kvVXJB?=
 =?utf-8?B?MEx3RGJPQUZSTFZsZ2FVbHhLakl6Ylc3elg3UEpMTnBKVklZQXVJcjE3dlYz?=
 =?utf-8?Q?xuP/bnKBaTmFVZn1xEqaKOg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1af428c-2a16-4ef5-7c19-08dc956182e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:55:22.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZzOLYUlP1ylMcN6DBpTiyZznjFZ9Tll2lfHuHm1nt3rzDqXGgQX3bkyT754tev3GC8xgwGl4pSU4tnswLwu05n0mHXGS2Quhzydf/0HkgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
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

On Tue, Jun 25, 2024 at 01:15:18PM -0700, Ashutosh Dixit wrote:
>Mesa VK_KHR_performance_query use case requires preemption to be disabled
>for the stream exec queue. Implement this functionality here based on the
>new set_no_preempt and clear_no_preempt exec queue ops.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c       | 33 +++++++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
> include/uapi/drm/xe_drm.h        |  6 ++++++
> 3 files changed, 41 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index a68659fd5386..6453c36c4539 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -80,6 +80,7 @@ struct xe_oa_open_param {
> 	int engine_instance;
> 	struct xe_exec_queue *exec_q;
> 	struct xe_hw_engine *hwe;
>+	bool no_preempt;
> };
>
> struct xe_oa_config_bo {
>@@ -1018,6 +1019,13 @@ static int xe_oa_enable_locked(struct xe_oa_stream *stream)
> 	if (stream->enabled)
> 		return 0;
>
>+	if (stream->no_preempt) {
>+		int ret = stream->exec_q->ops->set_no_preempt(stream->exec_q);
>+
>+		if (ret)
>+			return ret;
>+	}
>+
> 	xe_oa_stream_enable(stream);
>
> 	stream->enabled = true;
>@@ -1026,13 +1034,18 @@ static int xe_oa_enable_locked(struct xe_oa_stream *stream)
>
> static int xe_oa_disable_locked(struct xe_oa_stream *stream)
> {
>+	int ret = 0;
>+
> 	if (!stream->enabled)
> 		return 0;
>
> 	xe_oa_stream_disable(stream);
>
>+	if (stream->no_preempt)
>+		ret = stream->exec_q->ops->clear_no_preempt(stream->exec_q);
>+
> 	stream->enabled = false;
>-	return 0;
>+	return ret;
> }
>
> static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
>@@ -1307,6 +1320,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	stream->sample = param->sample;
> 	stream->periodic = param->period_exponent > 0;
> 	stream->period_exponent = param->period_exponent;
>+	stream->no_preempt = param->no_preempt;
>
> 	/*
> 	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
>@@ -1651,6 +1665,13 @@ static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
> 	return 0;
> }
>
>+static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
>+				struct xe_oa_open_param *param)
>+{
>+	param->no_preempt = value;
>+	return 0;
>+}
>+
> typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
> 				     struct xe_oa_open_param *param);
> static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
>@@ -1662,6 +1683,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
> 	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
> 	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
> 	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
>+	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
> };
>
> static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
>@@ -1766,6 +1788,15 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> 	if (param.exec_q && !param.sample)
> 		privileged_op = false;
>
>+	if (param.no_preempt) {
>+		if (!param.exec_q) {
>+			drm_dbg(&oa->xe->drm, "Preemption disable without exec_q!\n");
>+			ret = -EINVAL;
>+			goto err_exec_q;
>+		}
>+		privileged_op = true;
>+	}
>+
> 	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
> 		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
> 		ret = -EACCES;
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 706d45577dae..540c3ec53a6d 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -235,5 +235,8 @@ struct xe_oa_stream {
>
> 	/** @oa_status: temporary storage for oa_status register value */
> 	u32 oa_status;
>+
>+	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
>+	u32 no_preempt;
> };
> #endif
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b410553faa9b..12eaa8532b5c 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1611,6 +1611,12 @@ enum drm_xe_oa_property_id {
> 	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
> 	 */
> 	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_NO_PREEMPT: Allow preemption and timeslicing
>+	 * to be disabled for the stream exec queue.
>+	 */
>+	DRM_XE_OA_PROPERTY_NO_PREEMPT,
> };
>
> /**
>-- 
>2.41.0
>
