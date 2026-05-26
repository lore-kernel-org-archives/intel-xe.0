Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1D8CD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 22:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC11810E516;
	Tue, 26 May 2026 22:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT+2CnrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C35D10E516
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 22:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779836392; x=1811372392;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lbx3sWXlbkWq2kzsK0b2ujOcuIe9hJlFQYOSAd8us60=;
 b=cT+2CnrONRJo67Utx/ZflsPuziBUPBE0BpEgL72ExMQpOJQNYaKo7zJD
 HczP04Ac2AdiVjJHw20dP6CDqQfWgYx3oNnC4wVQ+thI/v9nLRTq3Lzr/
 jpB4v3e1FJmf1kLDOwsgymNxdbL5diRCFhlY6ABvgYk1sNwyZcFedqHxb
 BPGK8uGTxiuAFsQ6t2QkQ/1eW317CKRlmVMyjpx+hJDTsJrt769aUqdZQ
 MRysfMaCVmpAkYZ5hqaYbOHrEPu/oYRH9wUE3HitrPR7N1ZOBLfvWlUrS
 7ypn0sh6pAr04zMti0csUNQPHIukRatrt47C4hs2WBZkPhjk8+tQ5OmPd g==;
X-CSE-ConnectionGUID: eDQ3SnnxS5i5dkfacDIi0Q==
X-CSE-MsgGUID: aUCJlHXdSjuLTf2zacIXMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="92050525"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="92050525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 15:59:51 -0700
X-CSE-ConnectionGUID: sBqwCEmhRnqHcfxWF2LJKw==
X-CSE-MsgGUID: eJqa6xARQAOI06ltvIL4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="246086916"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 15:59:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 15:59:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 15:59:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 15:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4dlQiaBHBgLc4JZihf16YSbQRwLSYsmb4UNM7gERnacuIqEIymmMJeNGmP/CsK979dp7/9PPX4EXbEHl2XBP9cVAK/Dlx2MiWIRstDpVjj6dfQ8DcdWfq4SmgLp2oRPFJGJ4a3XRRqcyWQgy9G7FQbEqxaigSrCdFc9Ywlm+uZrPN7JMWQ/jJwdAFMPmunVCON5MVEhUrga0ffUlA/06Zh0x0dI9BrQQeEbKQQBZTXgLcNE72cCCmcMgMfbajYON35V+7PhvM7TH5cx4VARRlwzKudptmZ1/1Pd8CNtF0rdBYDnL+PK2aTh8IkggSw6OZffG33OS+e3QTeyLvALmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udiS1y81H5NyaLa3G9mEKKu+bJ3S+qklYThXIvBzrXg=;
 b=H0tmy6Bhd7Pm3sl9EahY6uu4OAscpCv5DZ2cPH/HjyXlffDQzRQLbqtSva01CrSY+VPJ1aDrMYwRBg+E678sIwn62UCouuxeYJAEjI2b2rp61U841oZUsuY3T/m51RUcFxkZuwHXm0aYtT5Dz14VfvCjn6AMBvhYdYYLnxdPJvQozDtLKv8n6IW2EAY0NXZb3g3ig6UBxPVykxLnSlN7p0pLgAo6dPF5IltH1gnlmPhzjySsMEl5FXHrfUdt0TZRX+1OwgjmbsLmQL66fBKAUN6q5k25rOw2FuslEYf+0l41dPYBOxpQXpxCut+lVDdEkyuG2/KGn54+LuMBcry6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 22:59:42 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 22:59:41 +0000
Message-ID: <0e2427b6-e58a-492a-b025-1318fd81ca15@intel.com>
Date: Tue, 26 May 2026 15:59:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/xe/guc: handle guc logical instance for
 paging engine
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260526141901.62207-12-matthew.auld@intel.com>
 <20260526141901.62207-18-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260526141901.62207-18-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: d034a4d5-5248-42dd-652d-08debb7a7891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|6133799003|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: FYvsQOdaRYORfDDxqW2F4qQIUm7d7OlopiuJlyYD7+SiQhWTneCJtL+G7MBL6ajGYMqAIXzvlfEVXdjAEnn1MyIkt27cQ9aE2YKYyUg45QSeKXZ+07w2BeDEqh/lX9qsRbCQGcnpG+hIcXtVUhNWG1HIyUVvdpHhzCVpwiTVOijukNpteharVOVfF01g3GiCA3XhM+BiicVpPBvw7So/fBJ/lmAmN5YBgseGebWKRgg4Lu8sdhUgqEAoEIrqZKwGlSY7Opy5cubnWEWz5LTPGBMOMJRvpCQnRomsl4fBaG3OR4+CEQPWOm2LAuEiSnHHyMdc6FIViHvnS/48fFtQKz6d6aqym4PKq0LOctlSpiEqrMfiMkir6qr2rdVUv7ONNX3rPbsDAqS4n6lLR6MkBseCAuTsHlkNULgTVsNyDRu144im75UZcbq4ZlZs+yOVXb9h2l4P6OXwVYX0MrmZTTxO1yxu3k2+fYJPZBilxP3RPgbuH8M0FQvGIVaynZylHKkYNoeti9uV1Sd2Uum9rXWF2Rjge2/puDaf/eT1lVV7u485MHlOr7xI9qyHQY7wfFlt5XWlyORIjezixeOEa1/lyZye+LStjJZOS9ghdKxnvpCLZG9tLmR/n+1ttv8IMGuoFWaUCJrXGdbQThya7TxCbnWZZS3wEHHAChIoptFGLugF5DNmJn79nymZNpCU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVaajlLVU9DSXdWb0NDYk5uN2paZWlDQTVCWTh6OVRjQnRSV3BLZjJuVHYr?=
 =?utf-8?B?dHEwN1ErZFlJa3YvOFFSdCtLTlZxNlNUaEZFSjNJUnFLSU0vd1VYVWJLTGdO?=
 =?utf-8?B?c1hGRUF1Rk1ZK2FJSFlnWnl2VHp2N3F4czFQVnBNU1BHNTFWTXArUUQrWEZ6?=
 =?utf-8?B?QkU5a0RWWVNYeUh3TG5DTlE5REFRMHRRbFJHY1dUc2hpZEpSMzdCUU40VThZ?=
 =?utf-8?B?T0ZCWWYyeCtJdlFDR09BVzBqQS9oUmJyU2NXL3pGUFZ3ZWhpOVpmV1MvUy9n?=
 =?utf-8?B?UUlPQXV6blFGbWFBMm1vclFKbmNESnpwdVRzNm5tQUdjSDBXK3NzNUI4MjFH?=
 =?utf-8?B?SlJGVnNUZ1V1Vk5NalpPbEtJYVFuYS8rNGN0YWtCT1YrNWNOaWZuZXJQZVRj?=
 =?utf-8?B?MlY2NnpRbytrbERaQmk2VUhlRmhpT3gwVy9pME5QYVFyWWwwU3JmajVLRjFz?=
 =?utf-8?B?Q0F1R3dCcXIyLzRrOTVMRWhMYlhrNWNTVWFxdURuWlBCbjZTYWJEekt3bmVL?=
 =?utf-8?B?MDZQSFcwODBIMEltVFc3VkE1bVlxQndsMy9FYkw2b1Voc1ZFRG1paWxwOEVZ?=
 =?utf-8?B?VWVORElKbjBTS01qV0lKNUJmbTZzekF6eUpOem03a2NDUGxXR1VjeTZUb215?=
 =?utf-8?B?N1lJamJFUkZnOUlhclVCeWVub2QzN0EvVzUrM2UyQjlhRko3eWE1UXh4KzJv?=
 =?utf-8?B?Zlp0T3g5Wm40dVdDZTdNRWhKUkJjTjlqWkdSRnF6QUxIYS90TCtURnpoZjdC?=
 =?utf-8?B?eE0rditUdndjZ21lMEVzUzVUUVNuZVVhSk1BWVJjUmVubENTeUxRdXduRmpt?=
 =?utf-8?B?eUVRNldGYk1QZ1p4R2dQeFpLSFR3SHJEUEwwVlJzb3VRYm5JV3p3Y1dwcVZS?=
 =?utf-8?B?dWpoeEx0enI3MGZXNUxtcEJBcjllMmRQODN1aVAvYmF2OStnTDB5UzRnTHJG?=
 =?utf-8?B?K1Juc2J6WElBS015L1crOHUrSFZsQUpkQ0drc1p6RkRjU05leDBRZG42VEdV?=
 =?utf-8?B?SU9HN1RIK3lFd1pHakRiN1dManE3NVo5R2Y5OGlUU09XUXhUcUhaRU9LYSt4?=
 =?utf-8?B?cjRDdTBjbVlGVzY3NFVtaHNrNUVSbVd1TTNHbkhMeXorMzJFTjZ3a2x5VGVN?=
 =?utf-8?B?LzVPeE95Zi9NYmdNelZZcVdTSkRjdHpPYlVMQUtIbEpBVEgvZHZpZ2lWa0JH?=
 =?utf-8?B?V2YwMmJiK1lFVDBFbmw5Sy9ham1XbHh1TnQxSGw3YzAyK1dNNHRrNFZvcEdP?=
 =?utf-8?B?RndzOUZpTXkvNDROMDhoNC96cFRKb3lKMXk2bEVtamo5RWNSOEpibWlTcFZX?=
 =?utf-8?B?cjFyekdkeFVxd09OeC8wS2lKT1ozS3hJWTlScFNTeEJSVU4zeG12NlMwTG9N?=
 =?utf-8?B?TmkzeXFkaHZJa0MrMkRudzBuNHFzdW9DUTRWL2RKSll1TTgvQjlNUVdMNU1K?=
 =?utf-8?B?Zlg1Q1g4OFZydnhVM1ZSUHZkUHBvM0FmZTY1OC9KMzZMYy9LWWVQN1pmb0N3?=
 =?utf-8?B?bkt1dk9uVnk0Q2ZmakJsclRhdytJZmMyRElHR3FnV2MwYXVhVDhrWkdTVndI?=
 =?utf-8?B?RUl5MUF6ZW9sUVpnWUM3eTdzU3N5Ym0yN1FIRW5Fdm9uTjdteEp2dlVlVzJV?=
 =?utf-8?B?bVJpdTg5U3VWbHBuOTgrcWc5bG96eGl1RTRkb05nM25BTlZ1d0FsajVzOXJ5?=
 =?utf-8?B?UWpSUnQ3Wnh4d3FvNFFXWkI5M2xxQ0s1YkVTV0NtT0NueHI0QU0yU1p6RFBE?=
 =?utf-8?B?cUl3R20veE9VQWZQcDVsZythYlNRQTA4UGhCL3dqdnArTU1iWlNwMmtSV0Zz?=
 =?utf-8?B?SnhkWXpyQWhFS0ZlQnhtS2Nrekl5OXUxLzg2Smx4RjE4M0lVL2VvM01kSDA2?=
 =?utf-8?B?c3U3ZGRzU0w2YmJINTdZa3FmZUMybVpSOTRVVXlRQ3R6Q1BSWWpHWTJFZ0ND?=
 =?utf-8?B?Tk9hbGtwaXM3allGekc3ZTEyU0VKS3J6NjRBaDBPRmcrejd0MHFQdXhYOWM4?=
 =?utf-8?B?eGhVcjVqZ3FTUWlhTGZlb2c1RGtxdnNYQk9UMktTaEV1QTZKYXhDaDF5cGsz?=
 =?utf-8?B?OGxBd1JHaFpTUEJvc201Si9tK0l1WXlCWUJkcnFVVkx0bUJEanBxVVQxdUly?=
 =?utf-8?B?U29vK28vbyttMGlxTEZIenlOc2tNRkVvWUZ6dFRmSGV1eW9YeWpwdHNrMHdM?=
 =?utf-8?B?QklUcEJscUhRMjJFWm9mbTRPUjdrcGNUR0NrbjdKUFhoZmpmNlBrSkNMTTRk?=
 =?utf-8?B?bFVGaXJuZ1FydTR0K3M2UlVlSERmRUR2MnBuNEN1YUh5R2hwUUE0ZDhtQUti?=
 =?utf-8?B?d0tjZnIrUlpmdVBDd01qNmNRZFJQb0lyVjFGOXgxZUtsVU01QUVUN3g5SmZi?=
 =?utf-8?Q?5N1SxVWKoi6Wl950=3D?=
X-Exchange-RoutingPolicyChecked: Z88uzR/KjlwRGC5xNh4BvP045jMxcTvH8RQaHD1CDzNRIPRr5vZenANPpx/Hn3vatzGuSW5AnIOmPYg1QyBx0K66UFYFikp4agIp707sEzFPz4JeEk5IWddfXosKpo7dQi0tpvu74fHPfTtvR4NqG5vDM9ml9g45jBbbTVxdFDynwLnJnfL9HiSP323trgVj3Mg3GXaRJu8KCKQIn9BHX9TtgxmmtxUM8KQctQyE6tpHp5KU4jXW57Gyk3c/D7H0764YAkQU4/+0Aawp4FseA5F/WmEJN/6SUhMUBPKPK0MqTAQAjJtd29vTy0QwC/By304IdILo9MzJRBDtOUeNig==
X-MS-Exchange-CrossTenant-Network-Message-Id: d034a4d5-5248-42dd-652d-08debb7a7891
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 22:59:41.7994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzYeaVjUirabZSHTVaDe8cZ8pzyC7zVFuF2rqt0UyybpIw/xBqamrg3dpbqID2MmB75sltzVJjqU94uN48P80N6Dfn5QfsCAkQ8Cxz4tVW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
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



On 5/26/2026 7:19 AM, Matthew Auld wrote:
> In the GuC backend, we need a different logical instance when referring
> to the reserved paging engine. Under the hood, this is still just the
> same physical BSC engine, however from the GuC POV this is actually
> re-mapped to a separate GUC_PAGING_CLASS, with the logical index
> starting from zero.
>
> The idea is to not leak this into the upper layers, since this is GuC
> version specific, so the changes here are purely on the GuC side.
>
> No functional change.

Double-checked all usages of hwe->logical_instance and AFAICS you 
covered all the GuC related ones in this patch.
We'll have to be careful in future reviews to make sure 
hwe->logical_instance is not accidentally used directly with the GuC in 
new code, but I can't think of a good way to make such a mistake easier 
to avoid.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  3 ++-
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  3 ++-
>   drivers/gpu/drm/xe/xe_guc.h                 |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c             | 22 ++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_engine_activity.c |  6 ++++--
>   5 files changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index f28c7ae0e8c2..0f242db775e1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -382,9 +382,10 @@ static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
>   	if (group < num_groups) {
>   		for_each_hw_engine(hwe, gt, id) {
>   			u8 guc_class = xe_hwe_to_guc_class(hwe);
> +			u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>   			u32 mask = groups[group].engines[guc_class];
>   
> -			if (mask & BIT(hwe->logical_instance)) {
> +			if (mask & BIT(guc_logical_instance)) {
>   				strlcat(engines, hwe->name, sizeof(engines));
>   				strlcat(engines, " ", sizeof(engines));
>   			}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index cf117bf52d41..cdfe194926d3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -472,6 +472,7 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
>   
>   	for_each_hw_engine(hwe, gt, id) {
>   		u8 guc_class = xe_hwe_to_guc_class(hwe);
> +		u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>   
>   		switch (hwe->class) {
>   		case XE_ENGINE_CLASS_VIDEO_DECODE:
> @@ -490,7 +491,7 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
>   			slice = 0;
>   		}
>   
> -		values[slice_to_group[slice]].engines[guc_class] |= BIT(hwe->logical_instance);
> +		values[slice_to_group[slice]].engines[guc_class] |= BIT(guc_logical_instance);
>   	}
>   
>   	*groups = values;
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 0934927e8254..61e3ee19a59b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -69,6 +69,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
>   #endif
>   
>   u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe);
> +u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe);
>   
>   static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index cedab0e1f798..b7d7eb4f3296 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -527,6 +527,23 @@ u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe)
>   	}
>   }
>   
> +u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +
> +	if (xe_guc_has_paging_engine(&hwe->gt->uc.guc) &&
> +	    xe_gt_is_usm_hwe(gt, hwe)) {
> +		int shift = gt->usm.paging_hwe0->logical_instance;
> +
> +		xe_gt_assert(gt, shift <= hwe->logical_instance);
> +
> +		/* GUC_PAGING_CLASS:guc_logical_instance */
> +		return hwe->logical_instance - shift;
> +	}
> +
> +	return hwe->logical_instance;
> +}
> +
>   /*
>    * Write the offsets corresponding to the golden LRCs. The actual data is
>    * populated later by guc_golden_lrc_populate()
> @@ -595,11 +612,14 @@ static void guc_mapping_table_init(struct xe_gt *gt,
>   	guc_mapping_table_init_invalid(gt, info_map);
>   
>   	for_each_hw_engine(hwe, gt, id) {
> +		u16 guc_logical_instance;
>   		u8 guc_class;
>   
>   		guc_class = xe_hwe_to_guc_class(hwe);
> +		guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
> +
>   		info_map_write(xe, info_map,
> -			       mapping_table[guc_class][hwe->logical_instance],
> +			       mapping_table[guc_class][guc_logical_instance],
>   			       hwe->instance);
>   	}
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index 150d891d5a09..2feb87492312 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -28,6 +28,7 @@ static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_eng
>   	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>   	struct engine_activity_buffer *buffer;
>   	u16 guc_class = xe_hwe_to_guc_class(hwe);
> +	u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>   	size_t offset;
>   
>   	if (engine_activity->num_functions) {
> @@ -39,7 +40,7 @@ static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_eng
>   	}
>   
>   	offset += offsetof(struct guc_engine_activity_data,
> -			  engine_activity[guc_class][hwe->logical_instance]);
> +			  engine_activity[guc_class][guc_logical_instance]);
>   
>   	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>   }
> @@ -151,8 +152,9 @@ static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine
>   	struct xe_guc *guc = &hwe->gt->uc.guc;
>   	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
>   	u16 guc_class = xe_hwe_to_guc_class(hwe);
> +	u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>   
> -	return &eag->engine[guc_class][hwe->logical_instance];
> +	return &eag->engine[guc_class][guc_logical_instance];
>   }
>   
>   static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)

