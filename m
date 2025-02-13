Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E9CC02198
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 01:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829A710E11F;
	Thu, 13 Feb 2025 01:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iy/tuIOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12C710E11F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 01:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739409958; x=1770945958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=evSp1DOKANB4kHlniQIg/uIvRcOSo9BlGwAZ8A3LtHs=;
 b=Iy/tuIOKRk6CBybBSMK+y9Z3D8yp0hJrPyMgIyF9A8BHoenTCeSxH0eo
 373jPWAu4cneshvbrhVtaUIA9IcxvShN4knHQqp83aCtGY9jZ8YGxvKnU
 qKZk9jZOpeOO8Z62zDORRTGbL7MMVOIU38Wv1/e+8qToKA7HUgtVGl0G1
 d2MWjhQ2qDgQJSHa6xzF4qodCOJnTrIRILqFvbXL9pHteg9I77JVaOMx/
 OfsnERudeG5ufml38TGBvv929sA184aeX1XrBzOlvl/lQvpWx4xSfB8fs
 DWJPkR43B9iKKk3haPtGXSIMWCHPk+Wc/k51CMEAbXSh/Q6KuiNPAVXUL g==;
X-CSE-ConnectionGUID: uUUr/NK9Tz+XZGKtlq/fAg==
X-CSE-MsgGUID: XmR0zOVrSAGtbi4L+Y9LfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40220301"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="40220301"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 17:25:57 -0800
X-CSE-ConnectionGUID: tjI/Yjc+TC+OS3W6u8idTQ==
X-CSE-MsgGUID: kJtc+nUKT+KFf+I+Q3bQnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="143832957"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 17:25:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 17:25:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 17:25:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 17:25:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMAdkrcuS4r+DAYrwiAMLpBdbq94bD3Qf7wezDaYFXLA2VIXKuv2myfvF2gccECunSnpsamV0DsiqDGwmXQ0pZ1wMTxnmtR8W/Pyn7M8olzwYF3L0sqO87XfGdmSbVUgZFA4mMd4IB/guHfxHdG9cKq8QXk6aF5th80rZaTI62hkbCTPErY7zpQfZRMS5hyqeplDRQMsn/uvUQ8RdpNwrpwO+2C+beDw8hEnkUMj/3dMZou6OgKwkDHEa0+5s5va63D8+l+oR3uaWWWuAaReNGPaYWV+a3hAyOJ4H9eVFP+zpIW0+KyxaEp67PnF41BUAun6SpNyew1rkCrzaMF4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQtxLd+gvhOjIzuFF9N+RWZMD3CCqZdmKgVyjlPONxM=;
 b=a2wjq6EVyUE1j5/ANQpkyw+0bquzn7ugmSFLP/opdJhmTUMxZH76FvLxyCNTFu1ffO8U46dxl/nMc7MaEOvBrZFjYfmchFjRtNYZRrsSvgiUfQ2GSrOidzfW5/JelHD4zutYmqiH0v2+f5ZnF+Snir1ksUcsCePcSmCESZsk4xXDqwTSes33aOjYJucu8/3YDE22ai9eG8NGe9uIsuxnOPZOL8K3JA9y4zcm8+y0xwTMVN5Wdak8HV0J+xIOjQE6apOUSBtnrtyqwck/KGSVHhXofXiY6y/3uY6NbNAMzVPGb3I3IZFCGtcuNIdpCwkx3TaclM0CaPpzSIx8Zzb0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 01:25:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 01:25:54 +0000
Date: Wed, 12 Feb 2025 17:26:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
Message-ID: <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
References: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b9b126-aed7-4498-f123-08dd4bcd5bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OgY711jSlonYJS7BMTal34d245c8O3mK3fWw5tDk32Kzn+bR4IgSf3WxNj5O?=
 =?us-ascii?Q?WEjkhfQHihDIvoPsOlhlJWlryr7M0gQAyi5O9Kz/Q2HvjKJkP+m5a5p9ojzf?=
 =?us-ascii?Q?baVtrG8dZM5dQDfeLJJZkYSQIWrWLAljEDoOJZuPWfwxZrGnuMc2OXBPtVda?=
 =?us-ascii?Q?JP/knKRPBBM9I9RnZh+RDQfFm/icSiqVVZYFrShGQ9zJqF/R8rHfI5yUtEr4?=
 =?us-ascii?Q?qxuS37P5/XWEktcpG6kRTKek2znFRiE+8EJ9gtoDjsBFKTwRR0db9Apjlb9H?=
 =?us-ascii?Q?856wKthQ5e1ICLOSF/mlLtQTbIRzhpu4DTYJZiURxksdKOEQflob+d4vYv6Z?=
 =?us-ascii?Q?TEBkNoSUQYiOfZXJ5NstkKJJ8Mev9C1a0mPTNQmHahU/SPbLJ/kewN3PcnK7?=
 =?us-ascii?Q?Cds9eLPUlL/DmosHyDQWL4j15aTS0nP4CqrctJmD+tHBohW5aG2BcpRQX+cA?=
 =?us-ascii?Q?8D7L6e++t4OL/FlsL5ImwH/iaX/n+mAop91iaYeAnz6rBDihXGggvaBIymic?=
 =?us-ascii?Q?Wuhk/m1VcwdetyeYVUbnPQpzqeuM8doFAhm3MFSUKT9xHuTW9YWV9g9hn6X9?=
 =?us-ascii?Q?WAlzvyY8CMYRzRBYY5qeaq5GLdzY3zlS3d7DU0T3qwYER3ZxN8mWpGUjSPJe?=
 =?us-ascii?Q?4kYNlW+DrlG3uTWRnSkmjeHHjwDK54aN6ctShNmTsRPZp4c6TcOrXf0skQ9P?=
 =?us-ascii?Q?+dNwgDuR+uxJJCUaxFPgUs4f6fRoOjgsWxUyVQAqIbHYrUwxIKLUwEVdKJLI?=
 =?us-ascii?Q?Sn+duoLbZ+5JTOXsmhmVYH78ksEzwvWcT5pU2HvBEI18x2ncNK2YL+exGygR?=
 =?us-ascii?Q?pCETikcEM/1F12xX9crHeQtoAyQB3TpeUuFAN7PI2/Z8O/FLgPOfacm0mkNJ?=
 =?us-ascii?Q?D66HnYACIpzHcb4i/HQqfgAJhPzDxeqO63WuNWRelwVp08gkk7M5mGMeCaAC?=
 =?us-ascii?Q?CCXsxDMq34mKerWFj3nku8rj2y+QOcTCV/NDwK9Ot92PlVSWZF5pxCsdjHip?=
 =?us-ascii?Q?Is5wHJwz2+ZKEHBH7Oazybsh8Vogx6Eu3P8RS9803265O9IeDgzfRo+SF7E5?=
 =?us-ascii?Q?bjCtGU/lBnep3yoMSrIADh+12BlndcVYbMqpMxldJPvjQ2Uttp5VwZDDbANs?=
 =?us-ascii?Q?ncqE4uM4fqYqfKdQ0u/4mKYo7JF6S6MizefaOCmNKJOo/7x+OEZIP2WQwZz9?=
 =?us-ascii?Q?Tq49x25XcXccFld/7HqyQh2Pw6s/6Xm81evYJUeW1dVmlj0+UFU3i/j0VuLU?=
 =?us-ascii?Q?m8lsnwHAaw5nELvwM8uGzrfZxUds011usD5IjIG8CjYaDHw4PVHhCw8rRP26?=
 =?us-ascii?Q?NO2sbqXktNAS/ZBBvnDV7wpSN49Ek0Llu5WoSXZIZtKCTsV3yQESonwcuZcQ?=
 =?us-ascii?Q?7drcbE+AumxQKAie5nHT+aR2qlJH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zf0VrIzoCZR5o1eFHulIHGZj78TcGlVwzlv/jwmls8W3lCDBe88CFCiiQFQ7?=
 =?us-ascii?Q?UvO/6quueuH+Au5V8CmfHTyhl0r7/PNdotDEvtKxJ+b4/TSAUjMl2nHAl6DU?=
 =?us-ascii?Q?QmOAb4SQyOKBDfGrhkP4zu6CTWZv5CN9tH4l2b/6GgAV2YmtandiIJscPgZk?=
 =?us-ascii?Q?e2kVCFsfUXuilR8wud5QYPJybqx9ixd6by6CglWywfdMxzPTRjyuymEnzv1l?=
 =?us-ascii?Q?VULjOlT+jSKsxId7uLPYJt96f6NIzzUbcRtRiV52YPFTJgn/2oG/ouphY9Ks?=
 =?us-ascii?Q?ei8OYBwvh3Efwstyr/FSjtNVfEqzBCea8r+DsX+B2Fp1rX8rYb7ePy2duYBH?=
 =?us-ascii?Q?M75iOe9QA74H0JuJ8BhSC1nMpskc0yQv1luSYDbwiZYiht0lTkp26Ppi6drp?=
 =?us-ascii?Q?ZsVLEwt7BviXfe4GJC6wtRqMViKyV9DD1b5aj2uV+viaJ+L83YysvkJFL8OQ?=
 =?us-ascii?Q?1PbTBvo7nl3rJAunYnHVvU4z9tZ4+9zw1Dk0wDu8+Y4uTaMagdouZ0cOQyYu?=
 =?us-ascii?Q?t0tKZuKAjzRFF5VHQb38h4F6wY5gsoPzMki4A64Zo8sqyUSMRKmQQ2cGO1WZ?=
 =?us-ascii?Q?FnTbWlepRw6pyYw7mJryMOXdtxZ1KWzqukPD7d/A2tXJz0DP6X0ZI1SQEMVP?=
 =?us-ascii?Q?QBgmOobF0/LIxCAjzS7Bv3WueqSJ8ax9ul5uQDJG3QGN1aUJ7ee7672hfBE3?=
 =?us-ascii?Q?iAZeZcSumrzZW1MznQYwT7/oAbpeRP35Q4fmbfumFiJlXXA7F9wuVKhZI/3Y?=
 =?us-ascii?Q?7xkLxcxfMVlT1xb7/Xvc7fYrtaWt+XY0HzCAaXDIMBoVM3d+NXnn2xtIrcTI?=
 =?us-ascii?Q?BALuzVBMXnfsD7gazBlHTg0yqhYzaG4EikepgM6UjJc4nDd83JHOSAvXNKOz?=
 =?us-ascii?Q?sxUtxT6wMboJOsGte8qUe1FNQHFSzwzdBHaWAdpqH4ihq7tY96TmNpxQM6xT?=
 =?us-ascii?Q?2/Vf6C/39/0NbfT9DbQKB2fuOTX1HRJ9ctba0GfOdHgSZJRDVhWf4NuRdKjh?=
 =?us-ascii?Q?uixcaNXwRwS4C/MGfGLRXLfSwBBO6tuYncxmNxtdkHH0X7gGILr11FaZNebw?=
 =?us-ascii?Q?3//C1IeCikeXpzVttYFvxgSq0dJg9g7ehZam1wHo8vgrE03AA9tieCZuabx9?=
 =?us-ascii?Q?fLtl4CYw5ymWBvT+cUilBc2P4uDBswLFZNahUNN5qHzUoq3q3y34p3N/hcaf?=
 =?us-ascii?Q?ykFce8s7dHkHKG7G0SpkWd4Vx5AcZJuqy6Efm475C4kUQv2rYFNhrEgT4qdG?=
 =?us-ascii?Q?E5N4/OfDobOOIrDNlWEK60YlZEOaGyHQwwGHAKKA6kwjieVFm55R7sW0ix92?=
 =?us-ascii?Q?VYUx+E/sT0Tnuo4xg1m/UNAetygPL9I2R3vfmGwlGv04WrXi8BEiKTEwxs2v?=
 =?us-ascii?Q?U6z82ahjISSA8ySs4ILrGql+ZBdTCWG5LAjhN14maB6SpRo3UNOdCDYLNfka?=
 =?us-ascii?Q?cBLQzt6ULPwpCwHwnxKyZ6Ul2Ro7J6MM1Ig/OSBfISqXCT6Rw51qQ16bOK3I?=
 =?us-ascii?Q?7eWOPO8Ch5LM30O2CNiR7usyZbVQLbNftUvKqeYRpLrrXBzYyx+wR0TrIJIJ?=
 =?us-ascii?Q?+gcr5yLZeHA4uU3kao/agixen18qjtuvLvOECyYHyiNsgQGE+9FTWtdPi6oh?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b9b126-aed7-4498-f123-08dd4bcd5bf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 01:25:54.0968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSn+LaDoyNaRjQ2vH3GlNQFCUXMAWslIy24JKynNz0Krafce2DVuIt5cAGr6j11/EMm2jMjjYC5FleMM5CWLFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

On Wed, Feb 12, 2025 at 04:40:32PM -0800, Daniele Ceraolo Spurio wrote:
> xe_exec_queue_kill can sleep, so we can't call it from under the lock.
> We can instead move the queues to a separate list and then kill them all
> after we release the lock.
> 
> Since being in the list is used to track whether RPM cleanup is needed,
> we can no longer defer that to queue_destroy, so we perform it
> immediately instead.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Patch LGTM but can this actually happen though? i.e. Can or do we enable
PXP on LR queues?

Also as a follow should be add a might_sleep() to xe_exec_queue_kill to
catch this type of bug immediately?

Anyways patch does LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pxp.c | 58 ++++++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 3cd3f83e86b0..bca2872ba07a 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -665,23 +665,15 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>  	return ret;
>  }
>  
> -/**
> - * xe_pxp_exec_queue_remove - remove a queue from the PXP list
> - * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> - * @q: the queue to remove from the list
> - *
> - * If PXP is enabled and the exec_queue is in the list, the queue will be
> - * removed from the list and its PM reference will be released. It is safe to
> - * call this function multiple times for the same queue.
> - */
> -void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +static void __pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q, bool lock)
>  {
>  	bool need_pm_put = false;
>  
>  	if (!xe_pxp_is_enabled(pxp))
>  		return;
>  
> -	spin_lock_irq(&pxp->queues.lock);
> +	if (lock)
> +		spin_lock_irq(&pxp->queues.lock);
>  
>  	if (!list_empty(&q->pxp.link)) {
>  		list_del_init(&q->pxp.link);
> @@ -690,36 +682,54 @@ void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
>  
>  	q->pxp.type = DRM_XE_PXP_TYPE_NONE;
>  
> -	spin_unlock_irq(&pxp->queues.lock);
> +	if (lock)
> +		spin_unlock_irq(&pxp->queues.lock);
>  
>  	if (need_pm_put)
>  		xe_pm_runtime_put(pxp->xe);
>  }
>  
> +/**
> + * xe_pxp_exec_queue_remove - remove a queue from the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to remove from the list
> + *
> + * If PXP is enabled and the exec_queue is in the list, the queue will be
> + * removed from the list and its PM reference will be released. It is safe to
> + * call this function multiple times for the same queue.
> + */
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	__pxp_exec_queue_remove(pxp, q, true);
> +}
> +
>  static void pxp_invalidate_queues(struct xe_pxp *pxp)
>  {
>  	struct xe_exec_queue *tmp, *q;
> +	LIST_HEAD(to_clean);
>  
>  	spin_lock_irq(&pxp->queues.lock);
>  
> -	/*
> -	 * Removing a queue from the PXP list requires a put of the RPM ref that
> -	 * the queue holds to keep the PXP session alive, which can't be done
> -	 * under spinlock. Since it is safe to kill a queue multiple times, we
> -	 * can leave the invalid queue in the list for now and postpone the
> -	 * removal and associated RPM put to when the queue is destroyed.
> -	 */
> -	list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
> -		q = xe_exec_queue_get_unless_zero(tmp);
> -
> +	list_for_each_entry_safe(q, tmp, &pxp->queues.list, pxp.link) {
> +		q = xe_exec_queue_get_unless_zero(q);
>  		if (!q)
>  			continue;
>  
> +		list_move_tail(&q->pxp.link, &to_clean);
> +	}
> +	spin_unlock_irq(&pxp->queues.lock);
> +
> +	list_for_each_entry_safe(q, tmp, &to_clean, pxp.link) {
>  		xe_exec_queue_kill(q);
> +
> +		/*
> +		 * We hold a ref to the queue so there is no risk of racing with
> +		 * the calls to exec_queue_remove coming from exec_queue_destroy.
> +		 */
> +		__pxp_exec_queue_remove(pxp, q, false);
> +
>  		xe_exec_queue_put(q);
>  	}
> -
> -	spin_unlock_irq(&pxp->queues.lock);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
