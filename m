Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C912C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 07:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658C210E7CB;
	Thu,  3 Jul 2025 07:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEJe4qzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D93810E7CB
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 07:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751526031; x=1783062031;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y6JtOLMiyo3NhRtTNUucPFDQdPRGgZZlHT1uS7lPxNA=;
 b=SEJe4qzVGZg45zyV4Fm/niojz92tX5iB+dqo1CND+Z2Bsjf5KtuNGw3x
 lDl0+r7TV1VEeMemSU9kqwsYGaEbnCumwTewb9Et85RUaeA4ES2yQ4rzO
 25WxCIEoPF0T77/h1XXRpD9O+uQCtyHerxcb8ZyithOKk9JLxuyM7fNW+
 6RK/3Hdw2SS5AeupYoV0BzDH3zL8/D+FkF30aQH5jAWKhyoH5NIEKiaVW
 y19c8NtkYuSU8gRXbiLHVDBVjqh4a+MMV1BmY4lTTATcLlaa2VRMVO68c
 pUjz3ANxfZy/PGyFFVG/xf2eSP0Q6abL0oZq0yGatx89D1b0ONIQEsLDT w==;
X-CSE-ConnectionGUID: MX3d/ZsGSPiR9xVT/EL/RQ==
X-CSE-MsgGUID: wE2OTD8cR+SeVwi3VhOC2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65295775"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="65295775"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:00:11 -0700
X-CSE-ConnectionGUID: hdSd7tC4TtWW/iEB6xTaZg==
X-CSE-MsgGUID: 8bJDk3DhRD+iJRrjibzzug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153699327"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:00:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 00:00:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 00:00:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 00:00:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAO4OlmTZwMmrBqX2xnUQVMNeaEXhJboPb2SEm6SQjJZ36uJk4IPVbp7aDbi9VijpycKiWd9SI1+FD8vgRz3SS28hzOV0nOBRPaWLDXaym7jX2q06BUTv/Vrm1A8J1eBZu3BIRdIrjYghMFe0jg7MtMr/wHk8vuN40XvWiX36VdU/sfIoJsAHcN2K2wdEANHK5CXkialw+uF0sE+ZswT4dvATu7rOVbXswQ5akW4xzgvz50NULu0gHjo08bvG4aryR8yhJ6GuUtLX4q6Ym9xxrCo9qS1Dbz6MR1cr/Gy66cDSps2ZQjnHsx9gqgd3sctsdU1YovITVnTN2q2W0Pfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qc0lERwBnZ9K6AnMHJd6eSw8iKfU0aOfeSOqxDAyoak=;
 b=s+9x73gEiXo2UMelC4N4CYubo6k0OVXOGOXzrjJQyQBiGGjipxDqDcMafis5UdVyChXTRYZUeLt90mgXksSEP0GSyX3CQLJC6yvEKMRFdInmD5z7bC3cJm00J+Cm2ZsmS2JXFZgmZ/BA7NdJ2c4xrB4DOE1DGWH4pbq4nGl3p6zmBZOds3Ym8NSQZ0SWZURaEUsC8W5oThvCGVaSq3eS1cQZa8JZlqbFfnvctBtfz/jBTA4k7SaUiG5zk4Jy7mrpZA7OXXlf54IoIBANMKNleokHcQRVmdUk3xqoTdh0cxyFoQAPGA6Ivg6y+FLpV7BvIezgPDblMXSfAoz8W3BqAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 3 Jul
 2025 06:59:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 06:59:27 +0000
Date: Thu, 3 Jul 2025 00:01:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Release runtime pm for error path of
 xe_devcoredump_read()
Message-ID: <aGYqtfrXvL7NN3/+@lstrano-desk.jf.intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
 <20250703062024.3441918-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250703062024.3441918-6-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0377.namprd04.prod.outlook.com
 (2603:10b6:303:81::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ed8005-ece5-470c-b031-08ddb9ff26ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hm1saDTlDpVqgWV4kAlU7XwAhgtrURY4srdvMoSJRqF0FpZCe8yUBJOJUoYz?=
 =?us-ascii?Q?WROobRnZkBiJuH6BcwDEx2YDVKMBcEAyb69YpCCWwkx5FV9G/emnqPlUrFul?=
 =?us-ascii?Q?n+/9WUoxBWzS1yw3MH9pNUbnSQQB69OlW9/qMjTVXVryc0uOKZnuxWyamEec?=
 =?us-ascii?Q?KQZ2ZZb07Q09Y15Mi3T6JfD3qhWACnBAWzRo7kmY5nglcYFQvv+LWvSSIM2W?=
 =?us-ascii?Q?/pjzGyO+jFVrh0X+iVSOSGPC7oT9Z80uiPe4odU5HfB3e7w3lUDNQHR5riLd?=
 =?us-ascii?Q?gYmhMGt2Uwbdoj5Xt1twm4ixYtYcOl2Ek/7nt0fHaeVuCUGx080/w7W+binU?=
 =?us-ascii?Q?mIZd1W+VHz1tFVYMISikREgyMeAGw3ytWGI18FKpxEjQDdAKedbPaebydLlf?=
 =?us-ascii?Q?jmdFyaptYn3PMGnnMzBrtZt8BydPFJYP5msK1jV5lcPdwWHSIziJiDKeI4Ik?=
 =?us-ascii?Q?yVpF+ryJ1ZN0I21ib2yOYv8ML1F8q/D6Xj71YTz5j0fcThBPSNuOBYSdqx04?=
 =?us-ascii?Q?/ofaFZ6R2Cf02qh7MuEPLco2WJxHzbELywQE8YUWb2h2GrcRaKNsRBiPwFV8?=
 =?us-ascii?Q?CnkCrfjXgyqgy6R88e9Lf9ZHrrr2WHfIezpQDawr7LrVkZ7za6VQSxZTlBh2?=
 =?us-ascii?Q?NDRyPN79Qg3EG+cFDQX7M8qsD2QlbMF9GprxD3VYGDrfSuDH8DJC9MFV89cy?=
 =?us-ascii?Q?N6LiIr4HPq5tIpNSxEbEUjqnNLGCDe7EA6uh1zTsgsRxumM4Sz7R2qiyjiEn?=
 =?us-ascii?Q?EtNSmjI5sAZx6ttZFNq6GvKgRZev69HuAZLzDyFxuyx/2jEvzo6pjrEVgyRb?=
 =?us-ascii?Q?YFdGYSCDZKWPBS/z21GsnLsueUvB+FHKhMfU0i+62GrHZUI8sumTywiwHyrK?=
 =?us-ascii?Q?SSWSCfhOK/QZaQstYxQZVTZCH4wKncAt0sllyMMHVLZ+netA8eVff2+LEvpD?=
 =?us-ascii?Q?I2gkfCIk3p1VWIg/ls+Xm7vZvh1+/+Ryg/tJpZN33rUeRBra6gVgVqMlXvy0?=
 =?us-ascii?Q?Nt+qU5sx0OkhWGE1Io0S3I7my2l5vH6BmBkuAw3csINc/PobY5cCaHx4Rvei?=
 =?us-ascii?Q?OeNObLy3Aad2xkztYww5s7uFROWG3hd95j8W5r6SjDV80JCC9URU0NhStIn7?=
 =?us-ascii?Q?ZpksGrh2MLoUU7+qM5ePKOAEziyrUG9ZtOTg9CewJakG/dUfFbZX4ewuOu9s?=
 =?us-ascii?Q?u0+yDSeNeduVVK3T3b3AlNWw8olKLwpdjSYMTCmwaZD0hlLbl61lUWUViAn6?=
 =?us-ascii?Q?Khk+HY/LPzKSsguTtx+X6aurnAK/7pozBqvBMsR9HmAYX33XGtYUx0pDH4ka?=
 =?us-ascii?Q?cZ2kVZ3qCmNuT4ch1S4iGZQKQW0vX1DpILqvbG2oZ9NtZEDqgQCEh5j9p9rr?=
 =?us-ascii?Q?OoLM4VcZRcuCWGvtFfGK0AU+VhoH7ASwFjfV9qMnOaYqWbJBOv3u3R1eHgoy?=
 =?us-ascii?Q?PYIHCfDLShE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?loFbWwWk3p6eibpGPGzmWQe8x0DCPd19iZ+mXXxVrHsZC/M8U6Fwj4cuUOLm?=
 =?us-ascii?Q?mRNSwWS6gBrtPFLeiZ+0tR2xAhVH3yiwfJdc/IS+mSa4JPadosUYDJ3xr7wP?=
 =?us-ascii?Q?zXI3Zfvwbt+NI5zHu164iEpQIqjw8+p2KFIcpAXElbmd/freW5zSuXq7Q+o4?=
 =?us-ascii?Q?lOLzR0UgQCkHyDZY285nCd81rvMVgV2ZkF3vV+bWPgxN8C1lp9l5GM/DDm1a?=
 =?us-ascii?Q?jTo4u5Hs72+nrL3OOvq7EChb29YImQRL76Cbv10sgI3G58hgTRArdwCEC0KV?=
 =?us-ascii?Q?pBBgUeRtbTNh230GrsZHWokkGdH9Q8Mb3TTwUy7YHBg9Arg5JNmlj82Bj/MR?=
 =?us-ascii?Q?RrFOjV2UjUPWLg2kB+kWtQQ9lP9CeY9v8CVE8WkEsEzxrlHn3qXIdRSzTDoy?=
 =?us-ascii?Q?FSKAI3UbexYI+JU9ZI/fI+12d7NSPQeUPxV7vFD8aC077kS/SFFhbCEBvPZ4?=
 =?us-ascii?Q?ccsX/Ap0YniMLBUxrU+985CalT9dIjwbOXfQIEGdR+PJxCLns8R7wfb2m1Y9?=
 =?us-ascii?Q?PnrlZNpSwciZF3Uux/3Km3hbR7f4Vx+/EC9ZIvXd+t00G/j3s0u+boxwjXP8?=
 =?us-ascii?Q?pTl61KFwDxxN0MSlUbS0Wit4+WqSr6XGMTBUlPvkNMaQwlZlEcJN3fghZMxi?=
 =?us-ascii?Q?ewEJX6y5iQt+Slc2yAAd9VreZy6Km4OEKNHrLuC1rvqVFcGJhGA8KBMa4w+o?=
 =?us-ascii?Q?iIYkiu3DIe6/r5+2rE2cadZSeyn+k85fyGdur9BTY9k99ntpFzC50u6Vgi/6?=
 =?us-ascii?Q?hmJpMo5ZqX5ogO1wJTLw071tJ5Kt/F+B16mQJcEEmKWjt1d965QquZwF3Bx4?=
 =?us-ascii?Q?VdEmI7w8Sk6FN/fi1hcDPmGd3QTZbngDYoOVvSI6S20OevLPcM7cQnC/KZTI?=
 =?us-ascii?Q?LxpTCcyhSeD5QIPTIdaYQPxZ/un2LJ7y3nFy1oLdrpUmx3nZWdtXxXTEmSzH?=
 =?us-ascii?Q?54xGYypKVNeVsIsclv2uP08dtHbBwy/oVfTESDoKihaTgt7Uecb/+FM3y9K6?=
 =?us-ascii?Q?x90mvyFlM2MKYaIZFdDG17UI+w5evsBmOrTPWQV/gydtCFLIi28Quy3uU3Ff?=
 =?us-ascii?Q?CnwCrmVGVhmmkpuKkzsaRswlICCVbXRkjsGATanuH2ShgAvAnLK/HapAf2/t?=
 =?us-ascii?Q?iCzrPo8fXJuQJpOeyqXDfhbYOoZp3G5oTZJGZnWsQWp8wUYDmyKG8xFXpAoY?=
 =?us-ascii?Q?eXHcd7GSDlU6eW7wiaFrKYMFp4YS7p5AGk3PH3AxJOhR+smZ6C5Yv5+mHb/f?=
 =?us-ascii?Q?wavfeH/zMkTjd3JfRx3M9saCgU7R9occqLX+iKBXZA916ZfPIuiIZbDe+lEt?=
 =?us-ascii?Q?uFhvP8u4Mv3uaH6djXCDbdJu6rSA4iH7F6Y07nLm6l1h8b58K5i2gWEN+T5O?=
 =?us-ascii?Q?dEnM9oiKms5FZqS3pzx+WaTLcU9/7jA47Cs7JeWvK/pmtHbqHmP7kTDrqpt+?=
 =?us-ascii?Q?JhPd8Zf6f7MhrnE30ofUJPcC6Aipb3LqxnZCV+r2FFze9OJIwXJDKFVuKTaK?=
 =?us-ascii?Q?ST5p2X0FsHOBegeOqvvlMVj8IgS+5dmS7FrZw/M9AGFZR2pY2BFtoJsNKFFh?=
 =?us-ascii?Q?wEp7hHDHZZ+HSsS7U+8c30OEdQ1RGlDKBjUS4EjR4dTLUvhe3hvGw03OITA8?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ed8005-ece5-470c-b031-08ddb9ff26ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 06:59:27.4564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAXtMGJXXSJ7200O0rot5oK5bV5c3V6iK91Fv0zEi20hcvRKCErZGx0sGSVlX01DrgQrh9hp/nWEs2xN+fJJMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4904
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

On Thu, Jul 03, 2025 at 06:20:27AM +0000, Shuicheng Lin wrote:
> xe_pm_runtime_put() is missed to be called for the error path in
> xe_devcoredump_read().
> Add function description comments for xe_devcoredump_read() to help
> understand it.
> 

Opps, missed one more thing.

> Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 32 +++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 94625010abc4..701ffe6c8264 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -171,14 +171,29 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>  
>  #define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
>  
> +/**
> + * xe_devcoredump_read - Read data from the Xe device coredump snapshot
> + * @buffer: Destination buffer to copy the coredump data into
> + * @offset: Offset in the coredump data to start reading from
> + * @count: Number of bytes to read
> + * @data: Pointer to the xe_devcoredump structure
> + * @datalen: Length of the data (unused)
> + *
> + * Reads a chunk of the coredump snapshot data into the provided buffer,
> + * handling chunked reads for large coredumps and ensuring proper locking.
> + *
> + * Return: Number of bytes copied on success, or a negative error code on failure.
> + */
>  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
>  	struct xe_devcoredump *coredump = data;
>  	struct xe_devcoredump_snapshot *ss;
> -	ssize_t byte_copied;
> +	ssize_t byte_copied = 0;
>  	u32 chunk_offset;
>  	ssize_t new_chunk_position;
> +	bool pm_acquired = false;
> +	int ret = 0;
>  
>  	if (!coredump)
>  		return -ENODEV;
> @@ -188,19 +203,23 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
>  
> -	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
>  		xe_pm_runtime_get(gt_to_xe(ss->gt));
> +		pm_acquired = true;
> +	}
>  
>  	mutex_lock(&coredump->lock);
>  
>  	if (!ss->read.buffer) {
>  		mutex_unlock(&coredump->lock);

Delete the above line.

> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto pm_put;

goto unlock;

>  	}
>  
>  	if (offset >= ss->read.size) {
>  		mutex_unlock(&coredump->lock);

Delete the above line.

> -		return 0;
> +		ret = 0;
> +		goto pm_put;

goto unlock;

>  	}
>  
>  	new_chunk_position = div_u64_rem(offset,
> @@ -223,10 +242,11 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  

unlock:
>  	mutex_unlock(&coredump->lock);
>  
> -	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +pm_put:

Drop the above label.

Matt

> +	if (pm_acquired)
>  		xe_pm_runtime_put(gt_to_xe(ss->gt));
>  
> -	return byte_copied;
> +	return byte_copied ? byte_copied : ret;
>  }
>  
>  static void xe_devcoredump_free(void *data)
> -- 
> 2.49.0
> 
