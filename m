Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FDAC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF5010E18D;
	Wed, 28 May 2025 23:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCMfBgEg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177C310E18D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748473225; x=1780009225;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WwSuYpP3FcCETVo8u2rF+16eSFWXQqDcaQAmSjN9B0U=;
 b=mCMfBgEgqfgHUTQ20mjtmEl6S0/3M6NtI+REvUJam7SjFs5Xo/boVS6G
 Pq/rFVvdNVAnx1Xps08HcNzVwTyaPNN/AOCyOzeeHDdOFxCO0QIEMGRYn
 hP+P7lK7AyWmRmlTMvR1DFjM9WOwlZjq9GbKMAXpg3i7afYfD6v+D8722
 87GS0gRs68FIsWk+BtBzjYqtkt1/4Lf0U+W/ieD6Mmiqvk6at2TDrDyJM
 bPrV9WOO1eJH7fO0Jeqdk0fTKJAmbd53jfrdNS76pRWaWV5LrSm8z7iAi
 20re5e6g0r2memcg1sYQUlKhNBmdcaJghAwN/uj6hcn3esdCB83Ai3hLf w==;
X-CSE-ConnectionGUID: U5tE/I92T+62GetFO5seUQ==
X-CSE-MsgGUID: dSDagX0OTbSITDfptjDLWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53144871"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="53144871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:00:25 -0700
X-CSE-ConnectionGUID: yIQky5UGQoWcypna/+HfPw==
X-CSE-MsgGUID: PW74W/GpSwS876i63KXcXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143357003"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:00:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 16:00:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 16:00:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 16:00:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIvGxKdcCzpBXTB+VoiUzAMP6kZBJKTv2G99PQkgy7OaZkMund1afnnOy6hgUSb3mVex7XUklzGzjNvud6QFiXTHxCa/EwfC2MTnesL7d/Fkgqqfj6w49IrO2R4G/sejPPf2n7T9AztTRgNkzGbyu0KPE+JotsXiNXIz3hIUerh19Av3qf9NsO1aCubnIMQb0HOa1Qg9s6AnvPQxz4nGtBlwZcdc2G79yatByfpyjQ2s4zB32QKhvrYt/+1AISXSOeK1RWbqRMzk4rYLtfRcvvyCPYakWB32hkRotPhXcnSzPGda2diebxWkUFRlCNm1VJtf8dKe6RLn46xNhHOuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqC6Ijjw9YPie161QQqcQNIGi36jwDZEl63MoX2DpUw=;
 b=Z+QmOLdEKXi9TRowdmdEP3jBeJk9S3AMQgtxppE1CCQNMquSPCWgjmgGUT1IlappIxvSmtQBVfIsord3+kV1myi+MI/6nLX5X295MsSn5UJ8Ttpatdz7pSjpWZ8LPKXWZhA2h5/821/T9OVibLvi7/ZBhakwej/9If2fotXAm+qxvcMSdbVZEKmq/8L8y+6V3OlVo6r1XSeQN6uUxz77zd1j6e/wEGEy+rafq7usulqacfjpmVagfrDq9COdzqchXcTC9KrvPUW9T8nsRCITuH7oA5zKpE3HhrLKGtAReauxMrxcCx72ladIcqTn+rRjnpKv0ELtbd5DnB+kO8aNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 22:59:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 22:59:38 +0000
Date: Wed, 28 May 2025 16:01:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 06/19] drm/gpusvm: Make drm_gpusvm_for_each_* macros
 public
Message-ID: <aDeVs89hA6GQAFIA@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: QB1P288CA0022.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 1241ec48-e9de-4881-fc02-08dd9e3b527d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PPG6PcAObKoCYpvQOKyRaAywqvElULkskiC2zMsuw8h4eiEnQem02VI1+cIg?=
 =?us-ascii?Q?3cF3TFCx7R2JQWNeoMuN8whQZ6EtW6Ek7rYbsN8nPAKp3S97mB9QUwlImiEz?=
 =?us-ascii?Q?e3MBg+Qmg7gnp829ykDkbqELNsnjUb7XNBvEwFA2sV6C4DZMxxskUDnHVQWw?=
 =?us-ascii?Q?Z5xGpwbDnT3urFokwsJ6RGhi3BTVaFX9tpHNrmj12kH2My5HbYTH6KFTbEWP?=
 =?us-ascii?Q?ZVrvuglNaLU75lLIKita+DQIWHU885ZEQosZPfXHMnnWSuKOYxbk7Vu8Q0LJ?=
 =?us-ascii?Q?tqAFfOUkOaKuJwFpQCPRVQYB9ohzkt/knlPvRaL4bVaBbnULvskF1AW4wB6f?=
 =?us-ascii?Q?R6iBtEoztaiovJllxpcIIcLcIl9gTls/vuNaw4Y0VA7Qu379TcG6m/QnrKFG?=
 =?us-ascii?Q?dhHdRiCjQmP5Dr2NOXagQizHV8pDgV2n7OzjezwGjGq2Pryqno0ZmjdOrgl7?=
 =?us-ascii?Q?bEvj6Ta0KeQziYvHcCZO6BvY/F4EcFJTPvghzcSNAe10q6T+mwLSCbgk97Jx?=
 =?us-ascii?Q?iXMJv5ROw2ETyPEtXl2Ro9yLkTH7tUIotwl51tPt/T42537B0quw8x3Dj28T?=
 =?us-ascii?Q?+9ZkqkqHI+oB8EIq5w5TMy3+LxZFRH9ZluMg0YmEsWu/Nv7F1YU54pYnHXQM?=
 =?us-ascii?Q?OuKMAiACE6UMY8Hq8Fn7AACNOS8TFQGn/pv23DHRaKqcG0/guVxUkGgkC4wQ?=
 =?us-ascii?Q?RkrKxalChJPNvKYFHu7J9+8czy727MadmBjean3AkbFqDunCv3KklLc5bVsm?=
 =?us-ascii?Q?7EQhHZpME1rW8aL9E/3caHmnP6F8i09tVIdyyKAt/JoAWTNspW5BHr6Izk1+?=
 =?us-ascii?Q?eomoh3f/BJGAfshEYuhMgjozpc+UH9h9LxFPf+0lEFARhOxo8y7pKDFYBeUg?=
 =?us-ascii?Q?4PQ8dkJfZcCogpuIqdRIOIgo4Urqinj5OIIjhlyWJzPf7qYzXoxqC2ZWJcuB?=
 =?us-ascii?Q?sOicJzN5MBZxceal2WzGLhVj1z2bi1gn/06xKlwf/oX5Rdg/Kmz7wMd4vIkd?=
 =?us-ascii?Q?YC+mrnioXnij8k7DQPoEtGqS+5xprvgIMsZCpP9Eo/gZJdUKga4AJ7VWi48R?=
 =?us-ascii?Q?PZ94FlXA8g8L0raLayNJg7FqdboV587ZYePmAxEBkgGLUzxeESSGBls/3ksb?=
 =?us-ascii?Q?j6aGSKE2EMjRTqEoZywAgeM10WCYRHNWXxnRFMgIa3iuphRZSftUF2PVnctQ?=
 =?us-ascii?Q?S1r9qy/lniwYBMXf85Xi5DBoPtuFA0FCLyO6RVv5UfTYfe4K08pU3sIV/PSR?=
 =?us-ascii?Q?5VMVnqDBxVraFhCh4oMxM5HtBu0MHM9Ol9FIphmZ8BI3gi2siqP2IICvYxTu?=
 =?us-ascii?Q?XMzeQt+zA3Pkh6LNaOyfyjxP8v9CD2wIEKzE0wlS8D22vUVu7GtPFBnwGtfB?=
 =?us-ascii?Q?I7scPuEJdUuKJ1ZIhJxBdHjB8tmEz8YsWJFBG3XhrkznQWYDavznvKgKnTHG?=
 =?us-ascii?Q?MOO1gcw7+Mg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+bCGt9YZvOq+51aYn/F1HnuDRVjAZ4VRB6U2z4QoJweZHHzW4n8OGQ2rMnXy?=
 =?us-ascii?Q?hr0kfBuvtJjchvqTFyk6Uh8/DRfVu6N4c2Suwjedq2neBh1nTw7AkX0PucND?=
 =?us-ascii?Q?Gg/enzBW+jEuSxQD044sxwelnmET2Bl1fs5N3P5nlmapKidL2BKvsDW0IvtX?=
 =?us-ascii?Q?c7eJeuwjWVMRNy6fc+BWZIjCUJ3NbBg4bywhlWvFfzQwBh0Z5mUEv0y4BkwF?=
 =?us-ascii?Q?mMdVgA5/VMd8rAg1irW/Isun+66AGVeT6G5KRigmAkmAzOLzEII7i5lPovGf?=
 =?us-ascii?Q?o2UGlu0zjAYLlwQGCADDIVRHgXe+djEeoPsVYwAK80Hzrm46wwe8Y1YS+vsw?=
 =?us-ascii?Q?2CWkJ1I7Aam6FBRmgORW9HK8AurissQrvNmTUcb7Uv5NzPEVHm1sHSTmaEoa?=
 =?us-ascii?Q?Y9L863s4DZYH+mGrX1jw+h5L4zU31fMb/n5u4IpIcS83bL6Oe3HabvJ7FAtm?=
 =?us-ascii?Q?+mPYJ0J9vCELTaJF4Ho79YdZhZXDTPQs2Vo1fYkDL+ZNjZcAcBzJ97S0K+gL?=
 =?us-ascii?Q?pTX5+zs1c5A0sUW2AbEOIU+ZMeams/wzndplkbZeA4vJFTgdcJaFmGqOCJHU?=
 =?us-ascii?Q?05IEtzM7HY/fWaexDBWkxjtsmQLaVcV3jS/eEd3Mqe92AZmip+5JhaEQpTwt?=
 =?us-ascii?Q?mdjxMi7y9KTegybCT0C2g1st0uAAN5DIUgpRVDuG5oE6VdhOI3E61oPPxG3b?=
 =?us-ascii?Q?tqVVapxMMVHSYL1V1cdpIUFjQw39PlV+3ILlYTXDk51bG8asdXx0RiirrG5h?=
 =?us-ascii?Q?JpTFqJWSqzeik4Afuys1dqqdY/2deHYBpnA8cvoDNkQy07O87ioR/Q/0IAQ1?=
 =?us-ascii?Q?npk5015UEI4YbyLCSU1YKNGryPhdoKyu8OiQ+SosYH+KJ9LK+MQu+/zyZbGm?=
 =?us-ascii?Q?08QrEHVCuW8O1Caz6b4CoTePWCi8Li8gbYUGQ0cFKVNLCcIuo4GvV85L1+QD?=
 =?us-ascii?Q?syCTFlLMlubZFdUtJ7wYfvvSs/REePYL7s0O8MrZqVhB6tXezZIPdO/Yx74I?=
 =?us-ascii?Q?Lkh9Jj51wcXTnfyeSe+ebxfXnXTmIcwkCqhf4GnMsrKk/yCJglxXAALo9aDV?=
 =?us-ascii?Q?3g68SdeGrNm46Eb+9D2rPxYXgLVHB4j7Rq3Cw7QiTNz3iH3CSfIRqHIxt3Ey?=
 =?us-ascii?Q?QByec4u3BQ7AcNioutmA9zV+gLyqUQBWXOZi59sNBj/ahFoCEsqu/rf3iOpU?=
 =?us-ascii?Q?P65dLt+cbP6SLdFISEImhbzC33jrlWA6WhJp2S4G8iysGyvTBom5CO8Lz1LS?=
 =?us-ascii?Q?Qkl1+xFwzXt0nyQXJDrk9/MCtEq/WsMBmrNiOldTZ9xOkRu0oCGVsCqyZwPW?=
 =?us-ascii?Q?hTQxmGTnhLX6kLvZrEaIdnopGr7I0zc5gp1YtvCHT0DIWbhiHlfGelVOnIe0?=
 =?us-ascii?Q?wMIsxRWMKNnODWpcFNGGmbsHIpcuAEu27UgW8kEzav0xKNByWJVz/Sg3gsOM?=
 =?us-ascii?Q?S4PNM+HxSELNw6nWzbWTjhZuV2E0DiPBXHd2GKiHadFjkQfbLdc0n2aJGbSe?=
 =?us-ascii?Q?RBufX3Iu2aHR7LrZMGDwhb/ogpR/TbMIy1wyO2X4mMwV9OSu3kOOsN2DA/1+?=
 =?us-ascii?Q?kQHDmty7LsnjHHd6Oo7uGGkEilTiQlo5o7bIyxEjywrHIf+GJSGlawUs7B/i?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1241ec48-e9de-4881-fc02-08dd9e3b527d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 22:59:38.2588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8qM7B/9W8ydVqrI9uN2Y59Z110Td6uB5fKGNKE9ySQuOniRRkOFGEUCNI0SJkK2qnrZQBvwcSNx4hNodw6Y+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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

On Tue, May 27, 2025 at 10:09:50PM +0530, Himal Prasad Ghimiray wrote:
> The drm_gpusvm_for_each_notifier, drm_gpusvm_for_each_notifier_safe and
> drm_gpusvm_for_each_range_safe macros are useful for locating notifiers
> and ranges within a user-specified range. By making these macros public,
> we enable broader access and utility for developers who need to leverage
> them in their implementations.
> 
> v2 (Matthew Brost)
> - drop inline __drm_gpusvm_range_find
> - /s/notifier_iter_first/drm_gpusvm_notifier_find
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 122 +++++++----------------------------
>  include/drm/drm_gpusvm.h     |  70 ++++++++++++++++++++
>  2 files changed, 95 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 7bb9eb71c9aa..e50a25fe1079 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -380,107 +380,50 @@ static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
>  }
>  
>  /**
> - * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
> - * @notifier: Pointer to the GPU SVM notifier structure.
> - * @start: Start address of the range
> - * @end: End address of the range
> + * drm_gpusvm_notifier_find() - Find GPU SVM notifier from GPU SVM
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @start: Start address of the notifier
> + * @end: End address of the notifier
>   *
> - * Return: A pointer to the drm_gpusvm_range if found or NULL
> + * Return: A pointer to the drm_gpusvm_notifier if found or NULL
>   */
> -struct drm_gpusvm_range *
> -drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
> -		      unsigned long end)
> +struct drm_gpusvm_notifier *
> +drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
> +			 unsigned long end)
>  {
>  	struct interval_tree_node *itree;
>  
> -	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
> +	itree = interval_tree_iter_first(&gpusvm->root, start, end - 1);
>  
>  	if (itree)
> -		return container_of(itree, struct drm_gpusvm_range, itree);
> +		return container_of(itree, struct drm_gpusvm_notifier, itree);
>  	else
>  		return NULL;
>  }
> -EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
> +EXPORT_SYMBOL_GPL(drm_gpusvm_notifier_find);
>  
>  /**
> - * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
> - * @range__: Iterator variable for the ranges
> - * @next__: Iterator variable for the ranges temporay storage
> - * @notifier__: Pointer to the GPU SVM notifier
> - * @start__: Start address of the range
> - * @end__: End address of the range
> - *
> - * This macro is used to iterate over GPU SVM ranges in a notifier while
> - * removing ranges from it.
> - */
> -#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
> -	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
> -	     (next__) = __drm_gpusvm_range_next(range__);				\
> -	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
> -	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
> -
> -/**
> - * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
> - * @notifier: a pointer to the current drm_gpusvm_notifier
> + * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
> + * @notifier: Pointer to the GPU SVM notifier structure.
> + * @start: Start address of the range
> + * @end: End address of the range
>   *
> - * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
> - *         the current notifier is the last one or if the input notifier is
> - *         NULL.
> + * Return: A pointer to the drm_gpusvm_range if found or NULL
>   */
> -static struct drm_gpusvm_notifier *
> -__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> -{
> -	if (notifier && !list_is_last(&notifier->entry,
> -				      &notifier->gpusvm->notifier_list))
> -		return list_next_entry(notifier, entry);
> -
> -	return NULL;
> -}
> -
> -static struct drm_gpusvm_notifier *
> -notifier_iter_first(struct rb_root_cached *root, unsigned long start,
> -		    unsigned long last)
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
> +		      unsigned long end)
>  {
>  	struct interval_tree_node *itree;
>  
> -	itree = interval_tree_iter_first(root, start, last);
> +	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
>  
>  	if (itree)
> -		return container_of(itree, struct drm_gpusvm_notifier, itree);
> +		return container_of(itree, struct drm_gpusvm_range, itree);
>  	else
>  		return NULL;
>  }
> -
> -/**
> - * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
> - * @notifier__: Iterator variable for the notifiers
> - * @notifier__: Pointer to the GPU SVM notifier
> - * @start__: Start address of the notifier
> - * @end__: End address of the notifier
> - *
> - * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> - */
> -#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
> -	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
> -	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
> -	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
> -
> -/**
> - * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
> - * @notifier__: Iterator variable for the notifiers
> - * @next__: Iterator variable for the notifiers temporay storage
> - * @notifier__: Pointer to the GPU SVM notifier
> - * @start__: Start address of the notifier
> - * @end__: End address of the notifier
> - *
> - * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
> - * removing notifiers from it.
> - */
> -#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
> -	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
> -	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
> -	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
> -	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
>  
>  /**
>   * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
> @@ -581,22 +524,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_init);
>  
> -/**
> - * drm_gpusvm_notifier_find() - Find GPU SVM notifier
> - * @gpusvm: Pointer to the GPU SVM structure
> - * @fault_addr: Fault address
> - *
> - * This function finds the GPU SVM notifier associated with the fault address.
> - *
> - * Return: Pointer to the GPU SVM notifier on success, NULL otherwise.
> - */
> -static struct drm_gpusvm_notifier *
> -drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm,
> -			 unsigned long fault_addr)
> -{
> -	return notifier_iter_first(&gpusvm->root, fault_addr, fault_addr + 1);
> -}
> -
>  /**
>   * to_drm_gpusvm_notifier() - retrieve the container struct for a given rbtree node
>   * @node: a pointer to the rbtree node embedded within a drm_gpusvm_notifier struct
> @@ -1052,7 +979,7 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
>  	if (!mmget_not_zero(mm))
>  		return ERR_PTR(-EFAULT);
>  
> -	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
> +	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr, fault_addr + 1);
>  	if (!notifier) {
>  		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
>  		if (IS_ERR(notifier)) {
> @@ -1216,7 +1143,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
>  	drm_gpusvm_driver_lock_held(gpusvm);
>  
>  	notifier = drm_gpusvm_notifier_find(gpusvm,
> -					    drm_gpusvm_range_start(range));
> +					    drm_gpusvm_range_start(range),
> +					    drm_gpusvm_range_start(range) + 1);
>  	if (WARN_ON_ONCE(!notifier))
>  		return;
>  
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 6a5156476bf4..cdd89e5af4f8 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -373,6 +373,10 @@ const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
>  bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
>  			    unsigned long end);
>  
> +struct drm_gpusvm_notifier *
> +drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
> +			 unsigned long end);
> +
>  struct drm_gpusvm_range *
>  drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
>  		      unsigned long end);
> @@ -530,4 +534,70 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
>  	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
>  	     (range__) = __drm_gpusvm_range_next(range__))
>  
> +/**
> + * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
> + * @range__: Iterator variable for the ranges
> + * @next__: Iterator variable for the ranges temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier while
> + * removing ranges from it.
> + */
> +#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
> +	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
> +	     (next__) = __drm_gpusvm_range_next(range__);				\
> +	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
> +	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
> +
> +/**
> + * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
> + * @notifier: a pointer to the current drm_gpusvm_notifier
> + *
> + * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
> + *         the current notifier is the last one or if the input notifier is
> + *         NULL.
> + */
> +static inline struct drm_gpusvm_notifier *
> +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> +{
> +	if (notifier && !list_is_last(&notifier->entry,
> +				      &notifier->gpusvm->notifier_list))
> +		return list_next_entry(notifier, entry);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @gpusvm__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> + */
> +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
> +	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
> +	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
> +	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
> +
> +/**
> + * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @next__: Iterator variable for the notifiers temporay storage
> + * @gpusvm__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
> + * removing notifiers from it.
> + */
> +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
> +	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
> +	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
> +	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
> +	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
> +
>  #endif /* __DRM_GPUSVM_H__ */
> -- 
> 2.34.1
> 
