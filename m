Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DB7ECD980
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 16:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FF610E91D;
	Thu,  5 Feb 2026 16:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVvN16kM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEA610E91D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770307426; x=1801843426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xJpAFBu7JPwIak2BVooop5wEFsbdUFIODT8lp22OeN4=;
 b=BVvN16kMYIXkqpWOzGswXcwheDlcXtenqxPzIlc543qlsLGAG90nO/dG
 uk8b2OPsIvb7mftCP3xpmRcoYBcYGBmvFjEA9v6kKlkLKihPFG2t85t41
 O0VMkIgrHET2fLfuG8jzdQ2XV1ezPBAKAR67wi0D0SNZA7w/WqgFg5qDQ
 bkXU5PsrlqW6O+u2CxCwgRLGrKlISMLs5NL6dO3FP/fhkdnXGF/uc6eBd
 wRNteXBJG8uLGZRXAki07Q8by7p/4+ZPBw794NeeFdK2lh8kvlcGh5let
 dLdNAYLxcQPcgqxI7z+SLYBkOsgPHpfsJFbTOr7Z4R8wqMXC5P6GnnQwB Q==;
X-CSE-ConnectionGUID: cdG4RJXxTJW4squjlPMrew==
X-CSE-MsgGUID: pn2XcPoeRJiI38XT7GUxAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71499915"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71499915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:03:45 -0800
X-CSE-ConnectionGUID: hm+Em2vfSE2DFlpikik+Ig==
X-CSE-MsgGUID: v9Awv/QoSp+8bV5m4msSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210373759"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:03:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:03:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 08:03:31 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:02:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUPWXTinV4saYioTDiP38E2sXIckfeAfvEx2tESRtj4aawY5r/rozWNDN9jfu67LYkbGcmCyDQQZyR2vVcIVGW7MD40ygnZ91Vc29XL7tKQ4brw0GzEu+YCGvWqIKPNWmsy6vUhAJcwAGhH2/KSzNFN3wA4V4Ny4FsqjSaQBnm5VlByqq43nouRbCDFAU//CEkxzOT8tAC0l5pz6ALxZXQIfj0rqP+qRa9fDvk2sHinQfiC4THFx7STJ30/GxBi1YNIRTsIy5zQGm//HW4fhCbqGAokHGapjzc72BqbfJ5Tfwb541y99+4FxqV8qRYxjCVLTiNQ7NC87/Eys0l2BpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PIUzmkKwfnB3XaB6gmaLcyZ1E6a8stZuB7UY0ZfT2Q=;
 b=Dh7N1VabgdMOkAVk+rdt7smMl6wwRPWiHzZAKHeOT/xGXZdUlFMSxVJkKTe4wEOhJ7iCfwx++I5WFfHN1G9EANocZnhEqW1v6Xv3woLKM5mACfxTMwWY2Tsqt2FlMAeAcZYywcw0+GyqvIIHsiW55OD495IWHZQ99iu2BqFw6/0KY//XPqrUa6aR1yo2dvHPrQYg5NbW8+WytrMQ3NWUJqWji39HmMFXDskBkNuJudL9NL9KwfF9l35FS1GE3VtFS801vg/gXzQv6wO52PFVGjo6SwXddVk+8a6d33mqHnowZ4A0pzrI7/a4MHBCRc301GhOJ5aEexYuofVKAw1ZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6142.namprd11.prod.outlook.com (2603:10b6:8:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 16:02:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 16:02:41 +0000
Date: Thu, 5 Feb 2026 11:02:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <carlos.santa@intel.com>
Subject: Re: [PATCH v2 03/22] drm/xe: Store exec queue in hardware fence
Message-ID: <aYS_Hk5sHqcA9r4i@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
 <20260105040237.1307873-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105040237.1307873-4-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 946d7be5-093d-4587-d867-08de64cffdc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mFIewJC5lmDpqOQcVxsQbYqI6IeDlbN69U4Q2VTbv16bvuj5M0nKrwCdWcid?=
 =?us-ascii?Q?NpG5QClcLPGmPUs7z6wnnuQi48jaVgtUnyK3SdtS6O2pucjzlvif/L6lMNGl?=
 =?us-ascii?Q?ZkQbnf4uEG8lxeaptTdfZUneDkYybtQ57mO2R/HyFgRv22JHc5TNQJK+AyXM?=
 =?us-ascii?Q?+tN5Qll6KuZxmCsr6p4boZPSzoj60NQQyxLHWEAUMumVS+5t6sDg/Lz12/KO?=
 =?us-ascii?Q?VO9O3PJQXeEnQDvzl1FOgRVJVKCmHaUPJSjc+Y1js+FtAMM0UvgrDTTY+PPO?=
 =?us-ascii?Q?sMhR+lVx4vCFo8TmoVV1mOTFBLuOZQLHxzqNRdlUcelKBUIqogKYRUU9/fHh?=
 =?us-ascii?Q?FnALqkDcNjESd8IwZqYLXBqdS2xAVHiXbzaGOVxATKJhyRLJnkziV8TfMDJh?=
 =?us-ascii?Q?82esQt7x79TbJbM5aO12VRf7SvEKgG4e2yeEWMXEFYNWNHZqnauKdsafPjJ/?=
 =?us-ascii?Q?fLV0hQ5wEgJFfxOMVk3TO5kyTwdjcOwe05+sQHQFcfHrPivjwsr+Qh9h0XTU?=
 =?us-ascii?Q?ReV51vP4zzT9a1CX1Tug5nuc7J99S9PL06urmGQQh1aRfYEaKRPUeSS7qe9A?=
 =?us-ascii?Q?ojSAbYGiA09rUFP0CzqESS/FnV/q0eGnYk9UiVi3Zidg9LLi9gqdwFjhufXq?=
 =?us-ascii?Q?8+51J/hwgxykRrPSTfWAe7ml5Z5FftWqNyGrB6hztTelC4bqgfU1Tn8LBnxD?=
 =?us-ascii?Q?K61bhEL1HhsCwLC6Q78ZfCFZmWDGJy+tUWh77sAYOXrMtD8AyIiPwe8nmEXg?=
 =?us-ascii?Q?3Qg+TR4nAY28+rnmKreMp0FNW2xwSbXFhsALnc6R1/HI+K+v/dgv0PElTHVP?=
 =?us-ascii?Q?LXsjlkrfNgfc4n//d4v80EAUvpbkP//6MevVIuGG0MPK0zU38xcP8Bwp/0Kd?=
 =?us-ascii?Q?NoZTFpiIdRwCWG+JW0mlTM98SL2M3/I91+I0BaiD41glgV+2zW+8nRlbwp11?=
 =?us-ascii?Q?c6ta2Et721AW0V385wYKjC8mh6beFYZXWKxKkJ3H91wSl3LXWRP3ICqhy4qz?=
 =?us-ascii?Q?dorgbF5TLsW2HwFtGoBourRzL8tf0JAbPMLnMdSO9tIfn3YJuly+ZWcN5BDJ?=
 =?us-ascii?Q?s5MJcnc++JeJkSyI0ZgsRGf883wb4G9wbLsKk86hA+MeSCFQY2Lc/dC0Y6Pf?=
 =?us-ascii?Q?wbK7FWaE6/dsiyx3bFpS3x/WYI10StTKGQq/xb3Sr8yFaHIwzvjU05KnjZIm?=
 =?us-ascii?Q?xSzfdfbL+ZwtT//ZEzFasZu78rAn5YIvWC3e29PwteS0JpclDxiKSft1EyaB?=
 =?us-ascii?Q?+oNXgrXUUgVaHVH4w8IDWzUmn6H1RhA8hhU/FPchmOVh8asF1ZY+XgaxKCfs?=
 =?us-ascii?Q?Z1ktmxE4wBjyrFdD7OS9LDoU91ESLNcrSRLfVrdxI12etnSdSxEdRpcdb6kb?=
 =?us-ascii?Q?9CvKI2Go4Av0x8RlFxTM5UhCLuNQwIeitG5xlU0oFvpnsv6sOnkROJ5FtZ1g?=
 =?us-ascii?Q?W7JbTbesQpGIEfaYZCeitu2CNl7NFNDba+e/y0Q2ZhyIjOX/AEc45BaKV6Py?=
 =?us-ascii?Q?EtxrpeBZagliwapt9yd5Qv6+BkP7s0QY9Nm1A5J3YqZE1wsxoSREQhXzHN+S?=
 =?us-ascii?Q?ox8Yy5j2fC0hY7Fc6MI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yG9mpEdPbe6na1h07zQnFjM6+d2e4Ib/JyL4Fv+JeUebPoY/BhB2LDdVOFFw?=
 =?us-ascii?Q?5BdXPJ1DSjyr3FLcOtSXRy+RCGqnSpJfqLjCUYQxnrP0BW0GWn7ORcMieOMh?=
 =?us-ascii?Q?nIZjz2Y1fmAb9fBbavApbxaZ17E5Tx/fthNrRzSKeStXCHB3Ft4lMaqM1SDS?=
 =?us-ascii?Q?rvyTLWUxjPrrG2iQhDwdqvNaPQicpH2hs5mE0LemlRBmLyWp1s/Q0L9qz5o/?=
 =?us-ascii?Q?9a7GdGE1+gqdNKWkq2AFs0ZoW5mn+DW8FYlSoP/MO88OvkL1sWz3BoQQqA12?=
 =?us-ascii?Q?1Q9XWfsQQpgn8paRNMZFua0SZeLleSdQUrhwoVQFhu1cbNJDSMqm5/XZvaEq?=
 =?us-ascii?Q?c6sE+E55GIp6IooUYkl57BDTCAxTiTEtT2I8qX6eitEEWe1S1/BdLX/Qjgkk?=
 =?us-ascii?Q?4AfcUK5IKrSUKpH7oyZSFjKqh2cJmq+ncSDt7N7aKtc5H40ego8t8bEj1huz?=
 =?us-ascii?Q?fr98/K6Sit/9+Bnse6ZOpxMZFUYEwY/IU2y/+O1zrjMW9tb7tO8LrVbiyQzH?=
 =?us-ascii?Q?YOv4kUyTasSTUHfewn0OEPnB7whQEPJ8izJ1xGdVAyCa558usoRNI50Wnwp3?=
 =?us-ascii?Q?JKAX3+RDelqckyVlsSfZzlJi78VDM+0/qsbFe8ivfH66UyrdteUJqKLaNyUt?=
 =?us-ascii?Q?NUuS4hMbzVo8MS/UUNcCbhn78nl58icWxoQPMMerXNh/NC6LYAC67nJ9Pc/m?=
 =?us-ascii?Q?MigMmzoQb7FdbVJ0uVftyi4zz1++aXmEse4aNz7H0WAQFy7bbc4Yd2LZvnVP?=
 =?us-ascii?Q?uFdk29mEMVkgvKZYU27VzhGYlZrZPb2zY89wjHPo9TByaVTQNglG47OGQXGE?=
 =?us-ascii?Q?kQHA0KY/u/0CNhVRzqWkU7OnLYfuHrUPK2YNOwYSJaBXCvugmxeJ84Rr7Mep?=
 =?us-ascii?Q?K7aKPjVUDT6fHCe2JWvwhYr1FGyuRxaB6cRKCjn0ewVvqk4ffEe1Qwqx0cNi?=
 =?us-ascii?Q?sodfN0/JKd+zJ68UKnGLxzlVfMz0QH3LvISaOPZkb6wdyggL4FfFBeXw1UBU?=
 =?us-ascii?Q?jviiAotcAF+BNBkbjLIotL+4tbzbnZK7/tmgvTG/sUzCxEQkixJx0Idmo+ZG?=
 =?us-ascii?Q?zIVWLhIz/fm39BlINe1DWq5fUz9LLhGgaqKf0m5OZiPnOFDVhzkQYBnbsOBt?=
 =?us-ascii?Q?bSibfvw2RGgFinyZ6tt9K+PdpsgoIveooAUvDvCe8qSBO79pAqYkvfE4tGPm?=
 =?us-ascii?Q?8wilBdpEy/IF+kRjqlrax9KQ0dYVYdganaKmT2nftb63fANj+XfczEGVQTvO?=
 =?us-ascii?Q?0wXYQwIrLIFoY9ybeYlat/UdwmYvoMMl11C7pJo7NEJXgrxrj3VGKmpk6cQ0?=
 =?us-ascii?Q?o2PnSbVQnwmvjROGhKe4aptzAcWSnirD3cjyBb0lyVN6afTGQYB/0j6HSyBu?=
 =?us-ascii?Q?EPquc9leEV9w9jKP1al+Sv1lSZoc83GlDbCdguJeL7zSodab7TWNG1kXo7ZR?=
 =?us-ascii?Q?Jk2y8Frzooicoym63R0S16EXg1gTNTfLQ6YGymNbwyuzkboI49J34+yQuRc7?=
 =?us-ascii?Q?tjOisEKPWUZxFrcsSZTUaoj06c6Ut0ONTJPZWtie1HyEkAHmVOv6ssVD0jcM?=
 =?us-ascii?Q?mTDXXPZ2DLjt+uulNANmZFiAjUaSrH8ZyztCscxJe0Vj7l0dxazMPJNQ19pt?=
 =?us-ascii?Q?ZaTcKmy8nkPF7ygGQXYWEiKhUE9WQ9ywbO2TVUZgEBJhaVCVkuNvHasDISQu?=
 =?us-ascii?Q?6+3UtRoD1tg7kjMKYqAF6TKDojcsrul61ayUNLmMboxGzJbwtvZZ9A1O83M0?=
 =?us-ascii?Q?CzRH0VIC3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 946d7be5-093d-4587-d867-08de64cffdc6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:02:41.4797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTamYrfR1LooSmOnHk6BAFv7qnFH49vTrpXw/rENmc6/9HB+0lyfkvuaVzeVGPcLRBCwb2x+gNNpttBx3Lb+kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6142
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

On Sun, Jan 04, 2026 at 08:02:18PM -0800, Matthew Brost wrote:
> Enable hardware fences to set deadlines for exec queues.

probably worth expand this message to explicitly say that
this is to be used by a follow up work that is introducing
the deadlines...

the patch itself looks good

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> v2:
>  - Fix kernel doc (CI)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_fence.c       | 4 +++-
>  drivers/gpu/drm/xe/xe_hw_fence.h       | 2 +-
>  drivers/gpu/drm/xe/xe_hw_fence_types.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_lrc.c            | 6 ++++--
>  drivers/gpu/drm/xe/xe_lrc.h            | 3 ++-
>  drivers/gpu/drm/xe/xe_sched_job.c      | 2 +-
>  6 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index f6057456e460..5995bf095843 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -242,6 +242,7 @@ void xe_hw_fence_free(struct dma_fence *fence)
>   * xe_hw_fence_init() - Initialize an hw fence.
>   * @fence: Pointer to the fence to initialize.
>   * @ctx: Pointer to the struct xe_hw_fence_ctx fence context.
> + * @q: Pointer to exec queue tied to the fence.
>   * @seqno_map: Pointer to the map into where the seqno is blitted.
>   *
>   * Initializes a pre-allocated hw fence.
> @@ -249,12 +250,13 @@ void xe_hw_fence_free(struct dma_fence *fence)
>   * dma-fence refcounting.
>   */
>  void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
> -		      struct iosys_map seqno_map)
> +		      struct xe_exec_queue *q, struct iosys_map seqno_map)
>  {
>  	struct  xe_hw_fence *hw_fence =
>  		container_of(fence, typeof(*hw_fence), dma);
>  
>  	hw_fence->xe = gt_to_xe(ctx->gt);
> +	hw_fence->q = q;
>  	snprintf(hw_fence->name, sizeof(hw_fence->name), "%s", ctx->name);
>  	hw_fence->seqno_map = seqno_map;
>  	INIT_LIST_HEAD(&hw_fence->irq_link);
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
> index f13a1c4982c7..7a8678c881d8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.h
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
> @@ -29,5 +29,5 @@ struct dma_fence *xe_hw_fence_alloc(void);
>  void xe_hw_fence_free(struct dma_fence *fence);
>  
>  void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
> -		      struct iosys_map seqno_map);
> +		      struct xe_exec_queue *q, struct iosys_map seqno_map);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence_types.h b/drivers/gpu/drm/xe/xe_hw_fence_types.h
> index 58a8d09afe5c..052bbab1fad6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_fence_types.h
> @@ -13,6 +13,7 @@
>  #include <linux/spinlock.h>
>  
>  struct xe_device;
> +struct xe_exec_queue;
>  struct xe_gt;
>  
>  /**
> @@ -64,6 +65,11 @@ struct xe_hw_fence {
>  	struct dma_fence dma;
>  	/** @xe: Xe device for hw fence driver name */
>  	struct xe_device *xe;
> +	/**
> +	 * @q: Exec queue which fence is tied too, not ref counted, lookup
> +	 * protected by fence lock.
> +	 */
> +	struct xe_exec_queue *q;
>  	/** @name: name of hardware fence context */
>  	char name[MAX_FENCE_NAME_LEN];
>  	/** @seqno_map: I/O map for seqno */
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 70eae7d03a27..eccc7f2642bf 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1783,15 +1783,17 @@ void xe_lrc_free_seqno_fence(struct dma_fence *fence)
>  /**
>   * xe_lrc_init_seqno_fence() - Initialize an lrc seqno fence.
>   * @lrc: Pointer to the lrc.
> + * @q: Pointner to exec queue.
>   * @fence: Pointer to the fence to initialize.
>   *
>   * Initializes a pre-allocated lrc seqno fence.
>   * After initialization, the fence is subject to normal
>   * dma-fence refcounting.
>   */
> -void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
> +void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct xe_exec_queue *q,
> +			     struct dma_fence *fence)
>  {
> -	xe_hw_fence_init(fence, &lrc->fence_ctx, __xe_lrc_seqno_map(lrc));
> +	xe_hw_fence_init(fence, &lrc->fence_ctx, q, __xe_lrc_seqno_map(lrc));
>  }
>  
>  s32 xe_lrc_seqno(struct xe_lrc *lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 8acf85273c1a..3d72b4c0da8e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -118,7 +118,8 @@ u64 xe_lrc_descriptor(struct xe_lrc *lrc);
>  u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc);
>  struct dma_fence *xe_lrc_alloc_seqno_fence(void);
>  void xe_lrc_free_seqno_fence(struct dma_fence *fence);
> -void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence);
> +void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct xe_exec_queue *q,
> +			     struct dma_fence *fence);
>  s32 xe_lrc_seqno(struct xe_lrc *lrc);
>  
>  u32 xe_lrc_start_seqno_ggtt_addr(struct xe_lrc *lrc);
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index cb674a322113..6099b4445835 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -270,7 +270,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  		struct dma_fence_chain *chain;
>  
>  		fence = job->ptrs[i].lrc_fence;
> -		xe_lrc_init_seqno_fence(q->lrc[i], fence);
> +		xe_lrc_init_seqno_fence(q->lrc[i], q, fence);
>  		job->ptrs[i].lrc_fence = NULL;
>  		if (!i) {
>  			job->lrc_seqno = fence->seqno;
> -- 
> 2.34.1
> 
