Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D39CF64B1
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 06:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F4010E178;
	Sat, 22 Nov 2025 06:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4hBkjQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A624110E009
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763791743; x=1795327743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8ADDYg/gm/oy/8v71j0MsFWwEbZATKDgEIaXWrDtFCU=;
 b=a4hBkjQ51CHHzzLuroD8gi0oZjIluo8U63Qmvagmqe3tWDqkTjbaM1Os
 VIi7za32IPwEnwRGLAWMZa1NaneBD72/ZURSv2lSlHxwHRSb/Auy1Q787
 akSdvQ0bWwmyXaQxOCZ+ALw0ybNg2UnCSPeij4tuSN7wyuiprEe3IXUos
 JubRhyTTyqMGyNV0j9CVU/hG0y8dacwKX0hvKpYMv3TVIdwsu8oQS3EKE
 MpCxaG5l2R1rtstPD7VGpIrhnZ7fR7x9qgaULk481vWo+EIF3Z/uhBqXh
 grmP5GFv1ht5dM0Z8UhtdGSKUP/IkOOaU0B0Y2MRAMn5sgMqluqF+wVMg g==;
X-CSE-ConnectionGUID: f9sY1CohTOCdb9DjMkK6DQ==
X-CSE-MsgGUID: /BbwiAufRj+xAOXWkQFfIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65831922"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65831922"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 22:09:02 -0800
X-CSE-ConnectionGUID: 80HJiYpNSMyUvCsVoHV+jA==
X-CSE-MsgGUID: A5lWS3XXTA+OVWyT8ippAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191543145"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 22:09:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 22:09:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 22:09:01 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.52)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 22:09:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWNYcaTyrhevH3Qowotwu4asFcXF+xJhJKf0Vk8u1YxY/cXQcQH1xpOYmicKpiBEtxnaKQol2wSTgGoLHRZmCsLvwkFqmT3qtexqyW+NfbeBE/J8THof3NMdcMqCAOsnunTwmzlPHLAigwPfT6rRSOfVpzUMR+4z7+CDKAB89i4TqDgWvdnqo2lPlpvWdm8oM09i12L/Ih+h3d+cXLnQ5efdBRIAbFx5PpEnnS1h/iHTElzEetDULpY5H9tCJJyHtF91n2HjSZb/lbi12pT2umEvqaIuZQxtxxmYUu9iOv3akW9XAXU3CQjXanCwbYR2HceB5o87RS1sv6n8+Pjp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QnEgAECjklrDh1eghkb4knkEDxla4WpjX/NK4MGqeI=;
 b=GMxSlx/76I/xM4vUG4Mw/2fbfBL7mRISjSd7JXioHjZ6HG22+wpeWtbpKvijdmLy76EG6BkYKAOXj1/DYdP/UqqQlWPy3WV+koLsNP7SoZ4jqHdFAZyC7UPUCm7ZQ1szc0ROjI8Ir9xuFR1eSvyOtBQet4yPs3E1Xt2QHiyXeVggAYmGTx5Zfj3tgNjOX/20wdfga6+kcqDq5m5h7jTEAew8eJfcMx9SGm652siE7K1IgazNxcpX4ca9YxgrOyPgivsqU3V38jDZKqr5zMz35XLChbT75lgtZejnxqYmPzwRD+GMePgFdfWn2dcI0xWuXIOFYyyoTOOV3B9X76PAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 06:08:53 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 06:08:53 +0000
Date: Fri, 21 Nov 2025 22:08:50 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 14/18] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <aSFTcvJjz6NGS4In@nvishwa1-desk>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-34-niranjana.vishwanathapura@intel.com>
 <aSFQt7V/R7yjVZhR@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aSFQt7V/R7yjVZhR@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a5bd1e-144b-4cfe-7875-08de298d9ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DDHU3bFtJlLX7s73/umk1uiYn5mioxLWCbf+Qx0WERJoDgKOjUG8Dbvq5QYq?=
 =?us-ascii?Q?34Kpo8E1A+6UleBWarRSZmb7Pg48ntMuWDNWSt71kSuEjFDQgPtBTkHWLXZz?=
 =?us-ascii?Q?hQNPJvFnu/YoZSVP/yb0Ml11pixnw9OhOIhWBlGm944F/Fw4sc/3P1UOS54J?=
 =?us-ascii?Q?EnCr+6q+MaU1Op8/vewVmgGUsN8R7TkqhQdQZ8Oq/9IOEt7FMK+3GAyhKvbL?=
 =?us-ascii?Q?s9b2fzGWQxETg1QZrDdvgpDNNP0iTmq1KEaxBMkJr718559OwuQKfGD899qF?=
 =?us-ascii?Q?GtOumTvps6v0yWTvT9I34of01mPvoFmoJ3brWjxB+w2420Rogqkdyeo4edyu?=
 =?us-ascii?Q?xU+QvV5ugsrtbcrwYj/fvva/3DiqTueF9DWsNGfzhtB4hu18D8TIRaSMPrSn?=
 =?us-ascii?Q?tOAID5KEkJZTpuDY7xHnXs8mnsIt+8Xrr52LTeTLFRhkTef45S6iOL4EzXjW?=
 =?us-ascii?Q?aZBuTGAFctaUYhoIcyWSNdjfhYC3jcE+4rl2+ZufWn+Ydnbn3VBFlpLXkXDP?=
 =?us-ascii?Q?B4KB/DFnZArtgmGzJFJ7VclAd3gzh9zxNpivS/7v1QdCyIxr2tWp5GOR+pUc?=
 =?us-ascii?Q?876gcR0v/WH+UA0RckA7T/sZWNsSALjbkDnDfqglBU7Yflye30gpxVFz5/Tv?=
 =?us-ascii?Q?5xJbCP02sLdds2gjI8R4zUN1EWLrtsYTfbWHV4qD3N4vaQ44Qs5lb/lUyZrN?=
 =?us-ascii?Q?gIOzPuXB6sxgFaEuDEMgTb132QeL1yElCjriT1rOJp0pKD5nCOcD1MX6JtW+?=
 =?us-ascii?Q?/snrvKWxtTPmifHihMLZ/7Isszq/TN/VprK3lnL0IiQOAbunomaGSO7IwJDG?=
 =?us-ascii?Q?jUGUfCfH/tMHG5dc01Wh2s72vkAraUaSpC4qim6tvLKQ+HfyEhQnE9mjUNun?=
 =?us-ascii?Q?E65PydkXuf1txj5Jk9p3GZziV3js4yYMU7eA1haHBBGYiMhD5xlww8eip4XF?=
 =?us-ascii?Q?4+eWr1WxqlFSA2lRA4tVRsJZHqzDkIeu9auLigmYstWPGjvZo5dw9iXYqere?=
 =?us-ascii?Q?3MI63ojEYmJItsHBlAtmRbZYu7/Omqd5jfdvz2GVtCJH32yMMdtcoRHcKNt2?=
 =?us-ascii?Q?Z2Nk0Lzusf6rn64Y3mxiEWskkb3WDz+wgh+qYeWWWtMYaYpEAsqBggjb0Dqg?=
 =?us-ascii?Q?7v7+vsMnJ9cNXGgOmsRt1xnF8Viy91pi2dQPS5fGT1Z75BaiA7KTGfMXAQD2?=
 =?us-ascii?Q?R9nOCltu7r0hukagndpsEpxGhE6fv/QW606ewbNmmgcOUg1J9+aWFAXppvu0?=
 =?us-ascii?Q?Qwc2NqM9zkalL5cWBeWTlgkzv/bpvrfyfvr8KquwHBMYD3sAK4ZXuX9oDFRa?=
 =?us-ascii?Q?D+LqN4VHA1iefoC2fMADCmiLVMZpZ/xNp4RD2U0umcKL4e6RU6LKCuJHYszB?=
 =?us-ascii?Q?iJUGH/xHUE+W1kOyDlqdYMf+VtZ6opXr6akhIBs69Fsi3Ywgveja3FWxBTCJ?=
 =?us-ascii?Q?MOFr7XogRx/ETytrSoQpg9x/uTGHujlo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dx5OxGiNl5D17EJ+liAJuyRaqxvidSKoAmV+pwSKlgxmhgElMfsyqCU288tr?=
 =?us-ascii?Q?/BmuL+KTo3fzB9hgej/LvkEcBGRaUAvgO+/Bc5xqhjHL1JgKksfdYS25mJ3C?=
 =?us-ascii?Q?3W4H4hoGvBEVWDuXHx+/SBkZWrQ6WdOyxLPFEDSn8vTriJsy1BfM+9P7Pp82?=
 =?us-ascii?Q?F2OVujdyIxnLAdEyz8P7VI0nEbUS17z4HtpmQZeam/24vNTXdICQKX1g/44C?=
 =?us-ascii?Q?tswkjE7fFd6umEontXm9LTfNNnm/grqbDXa9aBw092JMs9VLEVoNlmohysZj?=
 =?us-ascii?Q?DWM5AEe3hr4ViFI4N7VXT7W0yp5eUtOJR7yi19zIdHnDpaB0VDr9CVDKxloJ?=
 =?us-ascii?Q?TvYrs89SYsRsL0NWNwsk6DIuu2st5lNkMI2T7Y96IcHsH0rLLSMx0nBKOy7+?=
 =?us-ascii?Q?LwkQrikxIhAHfP9Kbg7UBUOQ7iQqebAmZWdSj1QEjgbUOwGM56Pq9XrX0+Ps?=
 =?us-ascii?Q?UBv2+dhutzyq+J26/5oA+4N632G9Dm7J4ev/u/qK+XYO7rCHClCs2nCZXOt8?=
 =?us-ascii?Q?ZuEBF9kLWmzi52PtTV6ly7Ti31AYK80BaQboUyb+qFhgSXotRbbVA8DlKVk/?=
 =?us-ascii?Q?oPC7GxGaqhKPZRUbHTDaZRL4WyrQQcWK5vO8OSfmeBfB1fM5SB1op7agk3jP?=
 =?us-ascii?Q?U6/37p+XTXwDVltc3BiG2VgRSNXQlcI6xBcwT3tjYXmPWE5zBsuysxMIBK9Z?=
 =?us-ascii?Q?TQDfwRmre3v0oNNUO4mrDJXs7UB446MRnUXfMQLCiItqcpmr8eQwBR7LtyCu?=
 =?us-ascii?Q?I0nhTZKMI5QMo7D5hCBK3FeF0r3NvCfaE/ZQnhR89LKDRtvEGIUm8umv7ofG?=
 =?us-ascii?Q?dt8GeVq0DTFhWG7yg8/Q6gVU0wA8M8427NWhMPRICiBUO8Mj3k/mggVNkS79?=
 =?us-ascii?Q?yYXPyWIFspqJRlWhHmCfIgXc5pw6AQz3GpA+OQMm6QPEISWFzQ+lfozEimCO?=
 =?us-ascii?Q?WEz42Hcxd5RQ9I8HxzbFHCr7xuR3DGybwh/tessRxFJrUvg41vLhN61M3UU7?=
 =?us-ascii?Q?KXW1lQU/dyjorm51HuFHZjgy5fEy49MT8iiIXLhIc0WJ8jBpWzEQeD2gQETV?=
 =?us-ascii?Q?+HSPSLNZt+hGEd0yqdgcC9hruKMomczuU2i9mULcgpsgPTbnNYWs6ygEd6nz?=
 =?us-ascii?Q?ub0LA26Yfn/Jpic7TqyTkCB+Px1VQWHnLuiyS/zHJTa4wNnVRX5+IG9Rj0JK?=
 =?us-ascii?Q?O9xn05RTb/ElF4/2d4khDaSwZZDjOg4OwaL/tWcVHD0yA5mFMuEkSHWFxm3M?=
 =?us-ascii?Q?vSFbYGDlVa5QN0JXsfcxgslHpNN2KdrrGwJFmzk2dfyLP11wA7ytAZJGqHJn?=
 =?us-ascii?Q?oURaS1SzfKIT40bzAQ3EATUD+76bAvAXGpx6SgS3AjHqGr2ZC2UuScqg9d2r?=
 =?us-ascii?Q?4V6YWhvrysXgdkVgMCwj5amjuNfp4h+3ydSxEONYVJEAN49ET/wkR9hqA8Vw?=
 =?us-ascii?Q?siPXK849MqokfCh+bg6q0pS7ko9+eukASd6NAetlzwymZQd12J0LPi8qBU/K?=
 =?us-ascii?Q?xoayQ8BApxTHXky00nTy1ulq4S+beVRDVb7Nzi3Dz76hBXiMYVoJq5jacKun?=
 =?us-ascii?Q?xuCvRSIabNwbA5+J1F5wcZErmxPP3S2Li1RUxLqfD7u9NQTdn7iMXcG5UaxV?=
 =?us-ascii?Q?pqFQxX1z+EpZUu/AwSYYtsA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a5bd1e-144b-4cfe-7875-08de298d9ca0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 06:08:52.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLFORoQwt0VnTJVp5Hf1wquSB9XAaSqmmp0U1c2P87XiOqqfcdDkG27lGmIg1X/3fRBK16CWkn5bxTwFhOUDZCumvB6ti8KHZeDywCQwwtsyS9XOZ0eTao2JG/JloWSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
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

On Fri, Nov 21, 2025 at 09:57:11PM -0800, Matthew Brost wrote:
>On Thu, Nov 20, 2025 at 07:51:48PM -0800, Niranjana Vishwanathapura wrote:
>> Add support to keep the group active after the primary queue is
>> destroyed. Instead of killing the primary queue during exec_queue
>> destroy ioctl, kill it when all the secondary queues of the group
>> are killed.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c           |  7 ++-
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
>>  include/uapi/drm/xe_drm.h                |  4 ++
>>  5 files changed, 69 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 037206c8b543..e72294a7d4b1 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -177,7 +177,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>>  		if (q->vm && q->hwe->hw_engine_group)
>>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>> -		xe_exec_queue_kill(q);
>> +
>> +		if (xe_exec_queue_is_multi_queue_primary(q))
>> +			xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +		else
>> +			xe_exec_queue_kill(q);
>> +
>>  		xe_exec_queue_put(q);
>>  	}
>>  	xa_for_each(&xef->vm.xa, idx, vm)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index ab161b74fef0..839fb08f09e7 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -417,6 +417,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>>  }
>>  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>>
>> +static void xe_exec_queue_group_kill(struct kref *ref)
>> +{
>> +	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
>> +							 kill_refcount);
>> +	xe_exec_queue_kill(group->primary);
>> +}
>> +
>> +static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
>> +{
>> +	kref_get(&group->kill_refcount);
>> +}
>> +
>> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
>> +{
>> +	if (!group)
>> +		return;
>> +
>> +	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
>> +}
>> +
>>  void xe_exec_queue_destroy(struct kref *ref)
>>  {
>>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>> @@ -629,6 +649,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>>  	group->primary = q;
>>  	group->cgp_bo = bo;
>>  	INIT_LIST_HEAD(&group->list);
>> +	kref_init(&group->kill_refcount);
>>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>>  	mutex_init(&group->list_lock);
>>  	q->multi_queue.group = group;
>> @@ -704,6 +725,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>>
>>  	q->multi_queue.pos = pos;
>>
>> +	if (group->primary->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_get(group);
>> +		q->multi_queue.keep_active = true;
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> @@ -717,6 +743,11 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
>>  	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>>  	xe_assert(xe, lrc);
>>  	xe_lrc_put(lrc);
>> +
>> +	if (q->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_put(group);
>> +		q->multi_queue.keep_active = false;
>> +	}
>>  }
>>
>>  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>> @@ -735,12 +766,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>>  		return -EINVAL;
>>
>>  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>> -		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>> +		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
>> +					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
>> +			return -EINVAL;
>> +
>> +		/*
>> +		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
>> +		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
>> +		 */
>
>Is the compute UMD ok with this? I really hope by the time multi-queue
>is enabled in the KMD the compute UMD is only using faulting VMs. Not
>blocker, we likely could actually fix preempt fence mode to avoid this
>restriction, more something we need communicate to the UMDs teams / keep
>an on eye if this becomes an issue.
>

Yes, compute team is fine with using the fault mode.

Niranjana

>Anyways patch LGTM:
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> +		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
>> +				 xe_vm_in_preempt_fence_mode(q->vm)))
>>  			return -EINVAL;
>>
>>  		q->multi_queue.valid = true;
>>  		q->multi_queue.is_primary = true;
>>  		q->multi_queue.pos = 0;
>> +		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
>> +			q->multi_queue.keep_active = true;
>> +
>>  		return 0;
>>  	}
>>
>> @@ -1286,6 +1329,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>>
>>  	q->ops->kill(q);
>>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>> +
>> +	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +		q->multi_queue.keep_active = false;
>> +	}
>>  }
>>
>>  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> @@ -1312,7 +1360,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>  	if (q->vm && q->hwe->hw_engine_group)
>>  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>>
>> -	xe_exec_queue_kill(q);
>> +	if (xe_exec_queue_is_multi_queue_primary(q))
>> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +	else
>> +		xe_exec_queue_kill(q);
>>
>>  	trace_xe_exec_queue_close(q);
>>  	xe_exec_queue_put(q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index ffcc1feb879e..10abed98fb6b 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -113,6 +113,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>>  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>>  }
>>
>> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
>> +
>>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>
>>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 5721fb4bad1a..c6b80977ff4f 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -62,6 +62,8 @@ struct xe_exec_queue_group {
>>  	struct list_head list;
>>  	/** @list_lock: Secondary queue list lock */
>>  	struct mutex list_lock;
>> +	/** @kill_refcount: ref count to kill primary queue */
>> +	struct kref kill_refcount;
>>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>>  	bool sync_pending;
>>  };
>> @@ -159,6 +161,8 @@ struct xe_exec_queue {
>>  		u8 valid:1;
>>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>>  		u8 is_primary:1;
>> +		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
>> +		u8 keep_active:1;
>>  	} multi_queue;
>>
>>  	/** @sched_props: scheduling properties */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 71a851615876..74cbebb24aa5 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1260,6 +1260,9 @@ struct drm_xe_vm_bind {
>>   *    then a new multi-queue group is created with this queue as the primary queue
>>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
>> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
>> + *    set, then the multi-queue group is kept active after the primary queue is
>> + *    destroyed.
>>   *    All the other non-relevant bits of extension's 'value' field while adding the
>>   *    primary or the secondary queues of the group must be set to 0.
>>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>> @@ -1307,6 +1310,7 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>> +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>> --
>> 2.43.0
>>
