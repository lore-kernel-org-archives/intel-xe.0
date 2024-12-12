Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181BFE77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DD810E9B1;
	Thu, 12 Dec 2024 03:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BD40Dynu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51AC10E9B1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733972677; x=1765508677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ui49Pu0TrauamAbZDVc+4qt+Rv0sRzwMPwZhPrH7Dxo=;
 b=BD40DynuTwM4XbVDeirYfOIsbIIRK2+PmCgkPxGGHZYEpMU/kqyLEtGz
 QgIFTlzDI1PIWZiAwtRjKvyfPNvqJngBmMTZvmW3wfbGvI9d7utlSL1+9
 NbC6VTHtFpdgt2BkZSIwpmxiPnlX5+zqkFb22vJ9qgFw30gR5Z8CCw1tJ
 SaLgs6WzZhIsqz+I/z0HMmS2VVUmeNUeaZEC2EJ3bMDlOVWo0J4TDaWIJ
 Na0Aoff790/UQhrlstAUgjIdKDk8alQfw+XRgb/Xhs96BSjSeN6shjokU
 3Ass4g/CahWiN/R3ArHWFu9SCSeHaEEKWsS0/aJnS/01ABWMYkXqlJbnC w==;
X-CSE-ConnectionGUID: GkoM45rbRmKHyQ/qF/6uMA==
X-CSE-MsgGUID: Mu7crFmGRCaDyz9tS1PhlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34280131"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34280131"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:04:23 -0800
X-CSE-ConnectionGUID: vdwBq8aDTK+WBkMdJHE+nw==
X-CSE-MsgGUID: AKx1LcQQQTG8KHxuh/NJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127042844"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:03:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:03:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:03:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:03:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiqFMK6VT6D6ipjxdOCrP+dFWQ8ibW5+LtIwFkz+iS99MeTapgyK8swM2wZwihVYhBfn5xzuBjUHQ9nyXU3LojGxoZdMyk4B/RXpaluLrHTc4c7pnOrPjLYGjEQSaZIVLx2ydRKPqgR8ucAemnWJdhjdeY1lLyRcB7HyfLlkwRiS1DYX0dCHgM9rQSWL2gvgec+r53TpeHCOzEfNIvmg4rR/aOOpejMZPwKdAh3Mgr7p9hwqw67KBkkWCWO5HNN3zCvZ98nbaGXqzGXOuxMPQdBmwni+tQN5H4uAt6GF14xisGajj0vQ7cEJY4p/H1lKZFPLFEwP3hwUFuIPMAV2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEEJDKtDyN3JQPTxMxmU3gWAtxNkeZW6Fb6GfvxBpeY=;
 b=YW3o100K+MBdL58SyHNDYGoBSfYuzKyqCHoTEearmExveOvR/7acivBnM5z1ToPP3I6yNtDiL3mBxDKrxqPc86jnYVS/Hk4ggIurZEQ+7mM8SC7a1/+n0IQvJJ+aSK8OtAMHDlvCz3U8G5urBqvTG3/mSd8wQQNuiQzhpwyyx1B4YBndZNL7/9SO3shXV+8VOnQSawJCNFiQjFc1C3Prhqlk7RQk/mQtWa8bhaWilknrtSr8ftgAgwSHgwYkWqwxqq0GfE4FCgMacRISKDVmavtiVRYjDoL65CSf/ONXcCclxdpdlQ3n3EtreHCbI+ylhEu+5/mQixSdCN7ZEy1bDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8708.namprd11.prod.outlook.com (2603:10b6:610:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 03:02:49 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:02:49 +0000
Date: Wed, 11 Dec 2024 19:03:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/13] drm/xe/sa: Always call drm_suballoc_manager_fini()
Message-ID: <Z1pSgeL4HC0vzzOQ@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0094.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: e0347273-9a64-4fc1-952d-08dd1a5975e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h7nZszSLM4/GnSDdCX4fMhulCaWWHqVbPETgXAV8Q41WnOUm5TZUK/B08lar?=
 =?us-ascii?Q?LnyrkhF1EZX9lWrOMezLZ5khUfA8ovfuYVmXu6mwXJuEYkTrwTlObu+M7CD+?=
 =?us-ascii?Q?iH992x9zzD3pthc2fId/ZXjmZ7e5Yadu4sVkkoZabL19PPe8njBpOuyHxVHr?=
 =?us-ascii?Q?Wka/EzRAXkND2x7zZ0lGZ4D0hZ/Bs46Rgkg3sXWaWJWq8AHlZZZZFzIQcNTv?=
 =?us-ascii?Q?J1GuH+UvUD4H2yjQhdHwMXPxSM9WBEdI2g+s2weF3N0voGPn4hwDMBQK3boJ?=
 =?us-ascii?Q?YOGRlzuZDiiEXYwJxV3zGA0aP6qQJQS0brtrGQ0FWo5ossEuqXXZ1CWpPdGo?=
 =?us-ascii?Q?b5cQBv83E1fVJaEJCPR0+e2Ll7JEWu2M7lXlce/EQ+B99W0jxZ923cHf4+/O?=
 =?us-ascii?Q?m6TmSccuFcN6pifRpSs/ZMBCj/BDpj9kFDVrN1vAWXfoKl2GYoKUxg+Fw5ZI?=
 =?us-ascii?Q?ZwpOkaaWnVdK3phlUtwMA5m59XupmHci27TZiZg/Yosel5etOIFDU9b+L8nT?=
 =?us-ascii?Q?AjLj1rN4SRgbCw0EvJ2KWDgCx8TR8gBTuQ5J8Td1yU2c21S3NBvJ3idWbfgZ?=
 =?us-ascii?Q?CN9xTWIfFV2yiZu5SVA+oYXE80gEMrKjbq9x5rITiteaBhT6A3RXse4NJ25f?=
 =?us-ascii?Q?4LfngVpbSZV9CrheHk9rPbbMSXEF4+HbRVGFZ9D38YZ0go+C75fqs02/pAHN?=
 =?us-ascii?Q?QtnV5crqcOJfJV8B4bCKvk6hW9oKTCEI6KhjmwBxuIl8AbSoF0k1IrcFO6PI?=
 =?us-ascii?Q?ujvK47azB9mJ7KT/dIEbPnHfMCUSYAs1JGSpbMRNjNLKggSNTsOLk4+Lnm/o?=
 =?us-ascii?Q?QqotKXzZPrVrPwVpyJIxvMpY3gLHT/bA9e4zaMOp9m4pMeqH80CFty/NArsY?=
 =?us-ascii?Q?djOElXuIBVrfzeCnEtv8GwDX61wd4YJq8NuH+4qfVLouYEwPrAfjUHy+HkNo?=
 =?us-ascii?Q?O2iKQg7yclDIyuii8p2cQG1yknqs5ejpKK/mQoKVe+egVskwNnyPeWMUzHCu?=
 =?us-ascii?Q?VJZauQ2GA8MY018mBwMDAzHhGmbZSdpsBbia6Reqqo/5gVHWQoFqxUvgSfhS?=
 =?us-ascii?Q?0uSUnnTN4ZM0sC5NFXD+0BmHaGaSv5+MMIHWH3gFToEKCjGSRid5mFNxXroA?=
 =?us-ascii?Q?40BYxmunoWVW6t9r79vpv7AC1mDdUV/93id79btWNXWVVX0hqTLGh9CR0L77?=
 =?us-ascii?Q?u2RD73b3Mc5UBJB6GQUMQF8umI2QRCpNKJ5jWee7pfV4sVdj/AANG+OLCkWW?=
 =?us-ascii?Q?+I2NKED6rWa+bbG0tc7TXbkdM8Jon6JljF76mNlxnMxddEwLrwApe3+l1UOf?=
 =?us-ascii?Q?JHF6bJQVs4LW92b01Yb1BliIO/G3lmQYX9npPSd6PZL+pQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iyto1/twPONBhbdvKbPUhjdscg2UUB/Iy50pheqFBWbXvCMQRMlbtfECfDGV?=
 =?us-ascii?Q?syOHB3wnXbTPEx8q6uBStrLZKMCVGNiaOTfuX/MgUmdY5hqkXLKvSH+loVR6?=
 =?us-ascii?Q?uhVSJJmoStE3svBd0P7CFLO+sLubXN/YZH0XtIXLS6tN+QRzlN3b+pNdk62Y?=
 =?us-ascii?Q?L5osvjMJ7uJnXZ2x/hVvAmKHu0RYofrO1D6YD5dmPKGX25j9mK6H/LY5YvUY?=
 =?us-ascii?Q?lZ0GYzu2A12Qq6/B3i5tMen+2uFEp8kLRnHoN4jBKyRSPWQM8zdJpJkVFVnC?=
 =?us-ascii?Q?4aDjQRB2dPXvWvLAbbutvkg9ibf6KRyYiE8CZq/987G+y7QY1tHEUl974qrK?=
 =?us-ascii?Q?fPpAy0n67ifinHK2+nrx2Nj46gESv8tcSThWIipOCYD7+6yMFGsDhNlRJHbO?=
 =?us-ascii?Q?JokKV5foinpn2mUS0MHvxsbJxjU/OkDXn8zNdzWpwoAHgb3Jq8PkLPukqYs7?=
 =?us-ascii?Q?/hAnCMjWjsO1aGeLXbYQhY5/WrT1TfYzpiKCZ0OxvyDQQ4rqwGAEcRFfkyjU?=
 =?us-ascii?Q?I3guIBUm/Wsb2dMRnlxQ6/GTJ3jd0AlfsjsyBNCxEapoTpMHGUMwHiYy/qJ4?=
 =?us-ascii?Q?nzimCmybR5XU7mDEMq3PqyK7xpQ9Dh9b5PUG3j5e6lA/TS8E/wkKMHFP0QHI?=
 =?us-ascii?Q?o2UcqrN/NDiL4t2w7P99RO1d2QgZjoH+xY7yEDPvGMwOhByqzl5bUSb/CkPQ?=
 =?us-ascii?Q?Ciih7mVGu8j/9/LWCVtZDBGcYXqGygks7QxHIkeLk4ZAjr4a9k9t0U97sarj?=
 =?us-ascii?Q?XHZ+VeerWd0Ipw8zBB8BzO5sam9OSPzZ3XLo9LYznapuqjZ013N93nXqU8BY?=
 =?us-ascii?Q?zTmft01zBeuvESxwz4yFZkI9Jfl9XlGnSZu1A+s5/icefwItbQbKWNBdolRh?=
 =?us-ascii?Q?sWvyi/0S7GFzf/EIfkpIMNNx8p7vO6agH4ngc+/DukQNr47oFaTpQ5FE+b6d?=
 =?us-ascii?Q?dWymf/pClyF6MBIKUYDozwlNZCR78fJKp2rDSmCIumn7PPzutzzkQC6vR/wC?=
 =?us-ascii?Q?maP97rhdIywLNu+v3TV+VpQ3X+W8hAsniHKn59efVp/nS7R3X5OHYYPSL3Qv?=
 =?us-ascii?Q?ppClyLpBeeiuHmKGXnO2J5/WV4gMzCtAzuh92FWMgncZdYYwg5sGkef70Zu5?=
 =?us-ascii?Q?DuxLAi5LyM0Nmg7KErik0YWH6OpqIBy2EQtEb1MUUKjIuEkDPkZPEmetZ43N?=
 =?us-ascii?Q?FDv3POmR2va7Sl9f7oT7SVzTXcnI5lYIFCmynIPLc5LNiJrsPh7YTApyxxks?=
 =?us-ascii?Q?gI16U1q0VcaBZKODntv42dMoHF13J4cZgRO8LSz/jUZ3UoKonpzDMB7Ax8FU?=
 =?us-ascii?Q?VUZJlKVmMvzN57YH6cn63MuwecKhRDum2K8UQ9ToUWyqLjHX6MX6oDm6cQyb?=
 =?us-ascii?Q?E/pbGYSDGirMNHY0hBcULSTHZWqDdqw4mjSHmmb49z1qSTf7nSMhevH3HKI3?=
 =?us-ascii?Q?AobiOPy2CcjFRaQp62DNidFd8IbhiII5QI3P6GuVCibMcSetePpS4xULAveU?=
 =?us-ascii?Q?ngB5ncB0QPJ8ccMxuUdzwrH7zO6pZG6vn8Ta5drh41/to+NnrhNUbcerUddc?=
 =?us-ascii?Q?a3fC1LkonceLvYZv/8xgAskR0tcXP8dWAnT2ECb72ntbaMEMYSdZ5OMqu85D?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0347273-9a64-4fc1-952d-08dd1a5975e8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:02:49.0941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHv01l7yHViCgZZ1AELSzfwKYNhZorv8kck1m8p/63voD5FW0dMbb+iSSLNXFyxvzczbgmV7C5n1eWrDrhwGvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8708
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

On Thu, Dec 12, 2024 at 02:01:29AM +0100, Michal Wajdeczko wrote:
> After successful call to drm_suballoc_manager_init() we should
> make sure to call drm_suballoc_manager_fini() as it may include
> some cleanup code even if we didn't start using it for real.
> 
> As we can abort init() early due to kvzalloc() failure, we should
> either explicitly call drm_suballoc_manager_fini() or, even better,
> postpone drm_suballoc_manager_init() once we finish all other
> preparation steps, so we can rely on fini() that will do cleanup.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sa.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index e055bed7ae55..4e7aba445ebc 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -57,8 +57,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  	}
>  	sa_manager->bo = bo;
>  	sa_manager->is_iomem = bo->vmap.is_iomem;
> -
> -	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>  	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>  
>  	if (bo->vmap.is_iomem) {
> @@ -72,6 +70,7 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
>  	}
>  
> +	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>  	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>  				       sa_manager);
>  	if (ret)
> -- 
> 2.47.1
> 
