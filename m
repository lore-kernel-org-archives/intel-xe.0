Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14635CF395D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 15:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F8A10E0E6;
	Thu, 19 Sep 2024 15:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPlcXeDr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1EA10E0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726761249; x=1758297249;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FWpe6dPAe1EaCwjYxAWYOtraWtAywUiNPc6wCWshh/0=;
 b=jPlcXeDrfa3sE+jp+RVqeOygqqXCK22E+HZTtSYhfVJh4Hsz5vBTKuYQ
 3vG4dV8gg2tQkk009SNHFGVaAVq2GLoiGz6Zxi8tPSjFnc1Nw/B/P/k1G
 Ed9xkeEqYQTeiqcZK6Xs5lW/7BMsH6PB8klGRDMgs4neRiRYUSqoLCGPR
 u+jGa4OwfmEAV+9lUnVan+w67BPsp4Sh5ub/ROY95DFa60vXEwbeLmxIM
 uz0lVDQ2X9CJmikDrytyVuG2FsOMhZnQeuMT5l409AXzitdEGy/XRIPtg
 1tceZnZ7Eom/tejlHmeTribPR8yVhRul15nXg0gPh3eLNnx4TzUc5JJ4d Q==;
X-CSE-ConnectionGUID: HXMS0pw3Q0qZCHfK9w+KUA==
X-CSE-MsgGUID: W+Pu1nfqTqegqFW8jyMiBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25612948"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25612948"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 08:54:08 -0700
X-CSE-ConnectionGUID: dMGsUw4JTk+AXaykMMjoWQ==
X-CSE-MsgGUID: dKu/8Fw9Q62zeREtIGH4EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="70012592"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 08:54:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 08:54:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 08:54:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 08:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoV/ExZHnLKKN7am6SUgMUF/JEwudyco+nlsovTUJX+LdiGz+dC9TrEVtQjZfEAi/x19bM9dxqOkBT/S+ZmiT7XG4K/RNHPCHzCD+0TsTtBHpciw9oKvTomHlNo3d9TbepO9KMpqIXYUGxZCzARD9b10l9nBmG3KsbycUajQJLhwgRHHQW0e8+6iPqG9SPOOan9bFybJTzYenGcVAs1lHnS5AvjgF2ibZMYh4TBQhhgoL0YK9O5FVhdVXGCuvVsEKkBSIvPquxFXPlKmfn4jdqLhnoOUaWrTTEMRfR1xpvM45+fPg3cHOF3VFoB2+IBk4AdzfdwRFCWDzySp5Uij8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAz9QNprzYEkpV1YY4/k3cvxos+be/KmvlczV0w6cHs=;
 b=NU+u/D4itA9Fl/6PaG5CJNg8+CqRwJG65VsAsuuQ3rhc+szyaQAHYyfXEDpeb8MAOhuozCJAcUb3HEAf6aaHwobUT7SkcV63WJU9sqymlKW41k+iUY9Fp5QbXaVgKzFZ1caFwa8HkQGdQtlrXYvuw5GMp0IwQ04dU/KOmT1k0Yo/5lzoTYgn/YBtxDUnq4Db8yGH8+mRuVrpFJN42YEYsKxwQeQPxNcb0T7ZqE80oU+tYWUII1LXNe+DYFT5P9JRpguntScCfbqSM3Fux9bgVCFEfzHkWxe61BLMATXksxCrPdPili18r9fBFM5lixj/uAbGVM1vOTbwY+r2Dyfjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 15:54:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 15:54:04 +0000
Date: Thu, 19 Sep 2024 15:52:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gwan-gyeong Mun
 <gwan-gyeong.mun@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Do not allow scratch page on long running jobs
Message-ID: <ZuxIuCF+dsxOT253@DUT025-TGLU.fm.intel.com>
References: <20240919104704.3591977-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240919104704.3591977-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4dce2f-6f63-4413-98ac-08dcd8c3498d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jgUHdFccbD+38R57E3oPjv86/9N7x7m4ys+8kB4zAu1jyZko4IRrHI8htv?=
 =?iso-8859-1?Q?mEf/ZU49RmRcy9mLRtUrDJMiTbpza2IvM3Z807LVXwrD40LcfeqikXubER?=
 =?iso-8859-1?Q?E+WXy6pAVGxQ/hHiyCJD1B+uhmSelOwAiDlg4gNFjTKMdN+qXllLN+IHRs?=
 =?iso-8859-1?Q?aiSnlGrGkFqdDNexeuFvaE4YyeucxHFwjQO2eBGOxp+i6uDgMV9GmKm2Eg?=
 =?iso-8859-1?Q?gzBJ+Ud3nyM4Hu+XbypRUVj3fYrbh7/LhkEjNE4NnDhWQrXBXEP0dAbUkW?=
 =?iso-8859-1?Q?XO7H3J6hpw3JkBDnlG6Ac2lvdRGuwe1E0yyyJiO2JZLGSSncmuRu5WgZ3n?=
 =?iso-8859-1?Q?heQnkPY1/Fv5BvJdDHbmABqGcIhZowdLdU538sVQxdMD53Wfumi1Tkyiu+?=
 =?iso-8859-1?Q?+hDws7iH0AFrbEhIhF7LuAhWCsX53oGmeHfYN+kZBaSJ2vu+6VN6gd9m1r?=
 =?iso-8859-1?Q?xIhvNntoIm2aIlnRYHy5BDZyF04xRdcBMuaDgdVFA72gRPLQZlAEA7LuQn?=
 =?iso-8859-1?Q?huxkgnV9yyLfAkaLVpfon9PaN4obIsuSPYzqhdVCFSmGEueyHXgOfECeF1?=
 =?iso-8859-1?Q?asGSirUloqCX4xv+jZU5d88pU8WvpjlpRLbnnzn9GgySio33HSXlPAwDoI?=
 =?iso-8859-1?Q?kSt7tvoFsPV0Yn5pcFfu1yUc5rSmJQ8apBKn7rl6IBucYznZO3PPHNyiXn?=
 =?iso-8859-1?Q?kzmRw0MFFWpkDC2k4N/ljgF2GdNVRXO3oU5F9zBdgk1Ro0w9HbbjK/hjzE?=
 =?iso-8859-1?Q?3L4xn5QOzaRkv7m3eHPpFTlCDSWIzKP6NPft6HPf7JdKrSpwb1EmohrGWF?=
 =?iso-8859-1?Q?B00xCm9rSVqSa+e+HIjXyy9IIxfqhamcmnd3vZAHlbq6meaNuzPkD0/b7F?=
 =?iso-8859-1?Q?ETywW/QFpK1gOj2m1ANQjV+rk4GWljwdL/ZA46bTYmFj2FVB9rp42OD4a+?=
 =?iso-8859-1?Q?pN2mLF8fKiGPaqNkNAPzJTpowteOk4C2OOXw66z0WQK8xHqf5eswo4AN3v?=
 =?iso-8859-1?Q?cfWo8tVqaSkROEzZXl9L9O9oYk47rZ+RMDeqq+LmsoLrSvmMqXJSWPUlKP?=
 =?iso-8859-1?Q?M8euM+edP0HwaLjRRTY5f01Lia0FVOJV8G0vE5CVCK9J+zLrAHrbopiUHS?=
 =?iso-8859-1?Q?ZRPFsWLPx0lRgvRWa3K4SaFd/1PoSMG9sddHowKXhYl6M11KiTyzUgnrBJ?=
 =?iso-8859-1?Q?sHobcrVMWzvRN975Dbn4AZQbEqC6qTNPeNNk0n7xyZfo+xrx+TM5A284SQ?=
 =?iso-8859-1?Q?C/1dZpaHv3wX0UR+CvhCAjBDSWhCcsr0WMpeJV/+laNRUWduuBEIGClPv6?=
 =?iso-8859-1?Q?IQgcuV4hINdiXJNYSrVCgWMU++J/Y+97+1/3E7/L2+AE2WSQLIrVJXU8AK?=
 =?iso-8859-1?Q?ej2z5jYl7aowPp9S4hMO/hU4XwwSi43g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?C8Az/BiyAJ4NnuqZXqiQ1ik29iJ3xXIXzTLMptTTGuO26L6psBj/utpEZk?=
 =?iso-8859-1?Q?XP0RLmI3YuvfVxgwBt8dThOLYC5jgjglZvtobgMRm1Co8SlALWeH1hIqVF?=
 =?iso-8859-1?Q?WZx8xTs2iD1U/X7mOedkW1J2vFtdFwTge9Qsd9KLxWK70csDhbhMUCbskd?=
 =?iso-8859-1?Q?BnKAUkItK7dLhAylP1pRwZjee2P7fslTlBmR0ERA3MlNBGXZ3vdZxErfj4?=
 =?iso-8859-1?Q?Q9qqYn9kX28aW44MkAwNTQWheay/pRAkY3vzB+9vnH6QRYzDdBlvRn9XFK?=
 =?iso-8859-1?Q?s5+3xKiqvuge9hPxiEgRIFyH4KNs0e4456Q0BDjxaVj1YkLUq0d95RcHxw?=
 =?iso-8859-1?Q?T8r0nHRqvinpVb6I2wTP6EbvZ8wDQh89M6fS+LDdo8I67KMlFBsmSEkLOO?=
 =?iso-8859-1?Q?TaRXLU/5bTQHoX3D61jkud5yq3CAj1Mndc9AuDR5k0rpNPXstOVtoOyjno?=
 =?iso-8859-1?Q?fz3HMEsg/PwQWkL7TQuRzn+xmA4P2j6O7oo///Mi4SbjS8eE8fJ91n0qCt?=
 =?iso-8859-1?Q?C3hJkZbbSgqzOORkOvvQz2hMDcBnPzkkYr9yfLKPTwcck8jJd1qdx4j6n/?=
 =?iso-8859-1?Q?qqcEy2VF2m6bfqHFVbLiv5zT2pxFnrHK4fkaBXkItZHrDGkSyFHT6zyCm6?=
 =?iso-8859-1?Q?G4r0FUGAmmD4kiroKFub3qWvx5Xf0CQwWxEl966fmwW3mp3IVdEGdpePRx?=
 =?iso-8859-1?Q?yMHmer+yGaez1rJ/d2TiZSKs+JYl/20q8sIp5iw6uyjxNHPchroyGmB3hr?=
 =?iso-8859-1?Q?Gq0NXE1sEYUGkoPP+o4oORbkxWcZcooNvs7m3nFfRDXImNtIoKOIZhVZu5?=
 =?iso-8859-1?Q?YQmG29L4AJBC0BFlTifjYQm3diq9VkZIuda0zsfTGod4127If8m5MKZobg?=
 =?iso-8859-1?Q?enCpX/a/AQOQAJtPy0TcWK0Z+OkHIym0hzpzBmYdp8Dkg0BE4WRSnG9lc7?=
 =?iso-8859-1?Q?7KASJd++d+R8Tw/OgfEwflyEBlU7O5vNRP1MBb/3pnpdnLTFyjEhR07dOJ?=
 =?iso-8859-1?Q?fGfvvsQ2oz9ybIPtV0fpc48cv/U0BrsXVxfFbLmIeOt+VKN8zsnVjRn8hf?=
 =?iso-8859-1?Q?kaa59DmnuVOL3z6L8z6WhzsL49ezJy28WjDWqxT8hQaLQhg/vhGu1Utnda?=
 =?iso-8859-1?Q?WQ+yOhJ8Qyy144PFYU4njySGoGEFMG2XGyYOI5Xpiy1nzoKcp+Hjb89A1W?=
 =?iso-8859-1?Q?msNQhlT3cfGhLgNEiYtLQN6n5qvgg3lPjmnSqvjBnafqWWT4gx9VvGOTcA?=
 =?iso-8859-1?Q?NAH6BOi4La+dcg04O3vXqr9gesO0LiexflP42dhlf6VDYtWPmULP19u8WK?=
 =?iso-8859-1?Q?g9KMndcI/uIXeXssQGybyN9ORg8GssZV3M/4JmEM3ZkgSIaeMbsKTFPtuA?=
 =?iso-8859-1?Q?UaQTjqwyY/5Ni60aG8VHhXUxRLPpxl1hdaKlmc7AP6qTwJKjiAcWRMMEN1?=
 =?iso-8859-1?Q?776OvGl4wB4otiS6UUEk3Dylc3YTPCsf0k9hvoyRPHnVbAlpGKI9lEd7MS?=
 =?iso-8859-1?Q?IcHrF3QpSZ/ijaqtGlsNSMZSDMR/HEi9V3klln20KPXF4m/cOcnXUy/J00?=
 =?iso-8859-1?Q?UcyW3k++QCVOfbOQtKT9L7LFGqiw5RXdLvgolcbJmUAc42fsvJHDcSIwuA?=
 =?iso-8859-1?Q?SpIhtngipdFLkndKq/iDxVNJzAwpkGPtqXy3k/CY+XBx+wvrlSpt3SwA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4dce2f-6f63-4413-98ac-08dcd8c3498d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 15:54:04.5153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b10lfS2u71z22ch+jMoBDavYomaRLnClobcuHYZsnw9J7JVbbjPyUDg309CIMdfRwjG3Yp3GgSEqd2YfA8lKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
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

On Thu, Sep 19, 2024 at 12:47:04PM +0200, Nirmoy Das wrote:
> This was agreed upon but not enforced, so enforce the limitation
> of not allowing scratch pages on long-running jobs unless absolutely
> required, which is currently the case for a DG2 SKU.
> 
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I think this type of change we will need a maintainer to bless and
likely someone from the compute UMD.

It does LGTM, with that:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a3d7cb7cfd22..92dc55f3479b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1711,6 +1711,11 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
>  	return NULL;
>  }
>  
> +static bool xe_vm_device_requires_scratch_page(struct xe_device *xe)
> +{
> +	return XE_WA(xe_root_mmio_gt(xe), 14016763929);
> +}
> +
>  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
>  				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
>  				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> @@ -1730,7 +1735,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->extensions))
>  		return -EINVAL;
>  
> -	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> +	if (xe_vm_device_requires_scratch_page(xe))
>  		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
>  
>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> @@ -1747,6 +1752,15 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> +	/*
> +	 * Scratch page is disabled for long running job unless absolutely
> +	 * required as this can introduce hidden bugs.
> +	 */
> +	if (!xe_vm_device_requires_scratch_page(xe) &&
> +	    XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> +			 (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)))
> +		return -EINVAL;
> +
>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
> -- 
> 2.46.0
> 
