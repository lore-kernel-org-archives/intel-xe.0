Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB50CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F2910E1B2;
	Fri, 29 Aug 2025 17:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxywFN2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD210E1B2
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756488252; x=1788024252;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MhFbnVtvbUiyKA8cidZPVHUW4P0Ohz+KaRhNbfEdK/Q=;
 b=UxywFN2DsN/VPFhXhnjXJuJCW3gqmg+odJc24QSWGvUx11bU+mhHYGX+
 fM2GX66RekHlNtgGLIAnWH8gfNgmkL8ecP55f30ed00woKiKMyKV6OoxO
 Y8WdmCbTKJPn6Gcd6dDeEGS8XsYvUDnjwSSVhr4C6rCfyuB9h/uJw/E6k
 bFRpxrOhIzJ+r4ko9qEre47XyCUVOCdx/VY7Gj8lqQRFZKRQEO4K4HtX/
 JvLJx2vt9ghwn1P5OOVWlOiUHY1yuhjpIva5EWVxOmkgnRMaKiMn9ZBCp
 SsEBg8QexH8xSUu7LGutCm5zEZun3uxof3YsyuaHKqWiIVDCYOvVKRUKM g==;
X-CSE-ConnectionGUID: TtmkXdqQRBqSnHMLzeoFDQ==
X-CSE-MsgGUID: zIltz/agSkKlKZMuRUmadQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69053781"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69053781"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:24:12 -0700
X-CSE-ConnectionGUID: i0RDRk0cSAKrBb7h6Qf/tw==
X-CSE-MsgGUID: XW/SJEi/Rb6op+dOexjuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169685317"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:24:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 10:24:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 10:24:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.51)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 10:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHh0mgQsQXCnYajGz3m/M8JOAB4EeHoc/BN3tQo5XpnWzKygVlyY43R/Hg1umx8XANI6wMxm2iY3YV3pmaenpiMd++HaCUfINCv27TFyDBFrf8/dnTMnBeT8htn6phm6dv1C3Y8zTofqA1UxR+c9k3/xnlp7ERENJmpS8eKG43AnNDjl52PXuUE2SmeDTmzWg7vCHZAS5dC1zpgV78vrUx17DCUxqzRdEcsAa3APzZ8gN31mTvDZQQbp6+svxZZKuqkepjPEjgRBmwYxTNTsWLIX+9mwt3h1VBG3XRkTE4pkxHMFKao45mOlgzBS1kSSiRHj95YV338NaJ6ZVlZbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kb7UjOaHNpIq3xvaHyLCc4aZ88uTwRV0LMfYIBqJy+s=;
 b=xGPoKe2t5XCZgMpYh5gVNh19d02SxNdD2ZEhwo+xPpwsU+RM+yctRzRlH44kiW3xfAwloZ78SBUmOeToPgKDRy9JEbLXGOTCIM1nB/6ZKDuEzi4Yt4gaEBENtDdyQFQMp3RRFduJ1m2719fv7XfIINAwW3xCbKp6F+509+syfqkp7+fKk82FaBNf+bPQJQM5hxMWBtaoVcH5Ke2t1CPsyEoXBLSswQRmOiKaAL5QS9n9YYRBzmIYOoRQvb+iz3f7ItATob8Iyxb88yM5FyJh34svJOsalIhVVQgl2NaDs+V6Dv7mW9wpLfKVCGiIE/Qhl2aINFdWFJjTmv6D3rHiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 17:24:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 29 Aug 2025
 17:24:04 +0000
Date: Fri, 29 Aug 2025 13:24:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Add SLPC power profile interface
Message-ID: <aLHiMRvKPWQU6gPQ@intel.com>
References: <20250829164308.1346909-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250829164308.1346909-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: cc496f85-3baa-4b93-ee0c-08dde720da30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pE8DzI7sLw4c7Y8DkSoZIikgUnP0W6VFxpt9BUnJiyAy+quZQxevMqBtRr1y?=
 =?us-ascii?Q?dYTMv+9wJ+rD88biMJQH7OgYqJUujriigbTrDWbiOP45QttJMPCxCAGsEfTX?=
 =?us-ascii?Q?klx5O3U0W2lWomJrC2UTEKay5eJa44aPsglu5dOxkVZM0Plm+Easd+EkzT9h?=
 =?us-ascii?Q?AauWIVvWJ86k8CzUl9D/qlBJQdG+WOYjHcJbe8RWdzpkPKkmeOScqSlkibvd?=
 =?us-ascii?Q?Yv9+9j6EFfRNq4FTKYz6PuFNocsXP3FSwFj2YvMNIypNDt6je4KVtwvIvveu?=
 =?us-ascii?Q?/SjejGZgY9IOR5+kbvwM1OEFNzEKupVFU6jPm167yfpnHF3RtLFvE7Fdv0ie?=
 =?us-ascii?Q?9k9772SSG6bTIe2+ydUpX9Lj/8IqxDaehUE65F9Ik8ZGVo7ZoHJEVXkze22x?=
 =?us-ascii?Q?73GW8M0HSgnRNpaMeiAqrqkYNsA9A4qUHyoqtwj0EgQybmCAhI7g6Z6YFZzS?=
 =?us-ascii?Q?7D+05Gz1AIJVpKXtxQP8bOB3aAQNp6fBQeYReq0b8KS0ShaESJxa6LmyWTG/?=
 =?us-ascii?Q?/v1LU0Zqv7JjNAmzSk9VdMGUlh4k+DpiWXzpUrDp25Bi/De+3M4numeG0tya?=
 =?us-ascii?Q?RoBIgZcxMHBpP/FaDD6rYlf8/A2Wbig1wLyxzSoPtprD5fiZ2gt8co9x4zN7?=
 =?us-ascii?Q?kluN5N3iVLr5sGELBEORZSHXwj0KIQ4bVu+ONJ4iWrffA68rK5IRExljc6xc?=
 =?us-ascii?Q?xTcB2FkNReKAXfiyLprlji7ECnvaTtLBKGcZsCsl0uQJ5rwkwKzV3pJj35bC?=
 =?us-ascii?Q?+GtJcA8tGhfQri1k/oJ5R+EdB6duxUas4Lk19pwGBqFV7YJ/rGDmNT+RVq3F?=
 =?us-ascii?Q?v3QxWyBjs17P4g0/RM/rnO7X3hrW+SmnJN11eGahIclRkFZlMYFddPF5kiQ4?=
 =?us-ascii?Q?jgdtV8zgNQZ14PL8QOLqX11z5ZWKO/ye15Ik1Qnp3if8H12Gr75xFh2f/6eu?=
 =?us-ascii?Q?7S88FgojvEj3t/d/Qgpf8LUZmOfichG8mMw8204vUB2BqWxT11l7VUPaShOY?=
 =?us-ascii?Q?V4k6N0DWiN1w7pfa1J34k/iyQ8dOVxT6++f4r1iwnvvCD4KTE0xY9NNbqlat?=
 =?us-ascii?Q?0BXS2QBdDU1Se/eQDGhzI5yYgFGHOtZfLlCoQQJlvsh81P0MCcDUdTA45o3J?=
 =?us-ascii?Q?rc7g4oSMEuy4kT23Un+Ixk4/e8SfkuwZi9OOGnD3l4/ZrTEYSaL07CqkaPYh?=
 =?us-ascii?Q?iWeYmK5Xhobokep7F6zPXV0ofUDnyqsP1h/PW1/MvbdjTz+byrcJo3jKkHaI?=
 =?us-ascii?Q?k4yQIKls0+qNt/dngNNhDzWWSBRvg2PkJrSRUjm6ODGpq6Ogu/nMdWOjQ08W?=
 =?us-ascii?Q?kiwNkUSEbIIAOwmKxIO9ZdZq3PGOCSM8tw2m3hJBw+v3/bXyhe62LY5nBTHG?=
 =?us-ascii?Q?CqIoU7Pmm9g6tFRlAwB0L5phDwPLVws3ba+Rg9smrvRCV4zYF+1mKVT02fE4?=
 =?us-ascii?Q?6kR+P7i/uGQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZmswXksg+7hy77rGz1mTORu86WxGxh4HMQfXfJLtBy/iuim00L20KAbJrTPn?=
 =?us-ascii?Q?KS/Dwb7zm+LJ3cHJuR7WQIn+ZWdLgRWVbT0jw2Vkr0cKA+OQoS4dV2qlaCb2?=
 =?us-ascii?Q?Z7BcRScCeCD+w+sSCM7J7SrXYlhvHWSBD0BhIGm4nKahqC0EgXoCnP6qx90H?=
 =?us-ascii?Q?ekowSlgXNcshFY23Keo3JRCt8eK8ZPNJPf8MykrHCtlc0+0D0s+wAAxM+wh2?=
 =?us-ascii?Q?YlfFrC9+U8L8UFH7LLazQpaT/exelLDfOCqt8wNEHjIz9FLwPEpXdyzMw1/j?=
 =?us-ascii?Q?JT7chaljuDdMlz0tYb6ReK/aZ2NHPQgDOGfmuXm7WyS3ElEvNfsaIFLh0eN/?=
 =?us-ascii?Q?hgqupIje8hPzmR9H2fn4ZYnH4LH8qlN+LaEJO/zDe7JoA2zQdLjhsoLJYCDi?=
 =?us-ascii?Q?VVa5qehpRmdO1JoFKhv/PDp9jO6MP08d/7KD+pm7t+8pwV6YhK8id7uFKV2Q?=
 =?us-ascii?Q?adVmxse77vaxjzjnA6SheD6pBHtdpi/74cpHJxM0S6e+Q1+slfglpYch6ThU?=
 =?us-ascii?Q?fAq78M5qrWzyUSafDVTy/LKbjdRjj6WSN4dn/P/Pvpyau01nZ28+6irUwCW8?=
 =?us-ascii?Q?oRaduU5QGMChQNnetLMS+Fa97uCMcypfw0kSSWPrQmbgzrnvix9mjIdOq96H?=
 =?us-ascii?Q?XGV92RnlRn+IieKjXYslDdUIzZ0PktYCy+pnj7fVkjsLPUy5M7REyCSZA7/N?=
 =?us-ascii?Q?KousdsTKD8vTXFuHgQuVvBbgYkrlGBtTROYIYaPTeTJ/7AbnCTF0gTh/nm7w?=
 =?us-ascii?Q?5g7h5gn1FgGmauMd/FwdLfNx+rrJmhQzfHaFKTLqb72ZIyKyNB6n5o/eKyHV?=
 =?us-ascii?Q?jK7y8skTP/vtnpunXz+qzVUXv1DO4MfAm0AgPRiq40hMwAq9tCZIOV1QHy26?=
 =?us-ascii?Q?2CB9NgZEICXcYBpw8zHT5FKIek1W59lImj+18uhgrRBpd0uA/TuTBFYttJB0?=
 =?us-ascii?Q?VP4cEJsmujBH9IFJ3+CLH2YG0Vpl3aL+ULbGRG9+gOc1iMic5F5xf/VBqJyG?=
 =?us-ascii?Q?MsHvN/00PbWtzGgDtlFMnc5KUAK6atFsctNvel5YJq7PNrMDkLFInpJLEDQj?=
 =?us-ascii?Q?1aV3L068CA7rrFsn+C5dMPtGPV7T1a14YPvCA8w2SGyAqRPyE44pbqoa1/Hr?=
 =?us-ascii?Q?o4EzprE1zYPGKUgizs+yQzAKdrr+L9fzS8Gl8+m6On3XwdX+hFF4qZ/mg3pB?=
 =?us-ascii?Q?s1CXRZZ1nGCR+YPwtKOrJYyYgH40PpbnfMQVyEXKoOR7ddcODIIYdZRxY883?=
 =?us-ascii?Q?e5VZpiZNUpC/MSM0/Ezigv9hBTfiC/DLvKgrqb5njeSkJrUchif6sT07Zblv?=
 =?us-ascii?Q?9cE2lgWyEzKqxN6vECYYjD1TfBHjF6/cPDTzv6ji6qnvU7XTBuSikFdAeEad?=
 =?us-ascii?Q?TBq+PqKKm1IDETNkwXh75I2+eamAKZeNeZ/58kI51SMeIgwBmNSzSi5c372R?=
 =?us-ascii?Q?vgKejUFqnoVpSfeCIJMafwMDdq9Dp9dX6+Jx2/la5vjbMkxNpshOeW6SOzjI?=
 =?us-ascii?Q?3hZhjtNwbiahEmofN2397gSCJS6zZ/KeRqzOATcAVYmaQTgnz5jGRhtNQSO2?=
 =?us-ascii?Q?KGh6djXE4voUdMXS3gM5ZGp0xLfNfQI59um3z7LkgI3qpx5j4ongAOc/ugHn?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc496f85-3baa-4b93-ee0c-08dde720da30
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:24:04.4337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H85PMpX48W0n8U+SE9R4E9oofRTSJCKXLWQEZ6voggDXbqV/mfh3W5OJEDjpVNOB9zfXavx2iIxiGquEOjlkjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
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

On Fri, Aug 29, 2025 at 09:43:08AM -0700, Vinay Belgaumkar wrote:
> GuC has an interface to set a power profile for the SLPC algorithm.
> Base mode is default and ensures a balanced performance, power_saving
> mode has conservative up/down thresholds and is suitable for use with
> apps that typically need to be power efficient. This will result in
> lower GT frequencies, thus consuming lower power.
> 
> Selected power profile will be displayed in this format:
> 
> $ cat power_profile
> 
>   [base]    power_saving
> 
> $ echo power_saving > power_profile
> $ cat power_profile
> 
>   base    [power_saving]
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  5 +++
>  drivers/gpu/drm/xe/xe_gt_freq.c               | 42 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.c                | 37 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h                |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h          |  2 +
>  5 files changed, 87 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index b28c8fa061f7..c1d16acbb732 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -210,6 +210,11 @@ struct slpc_shared_data {
>  	u8 reserved_mode_definition[4096];
>  } __packed;
>  
> +enum slpc_power_profiles {
> +	SLPC_POWER_PROFILES_BASE = 0x0,
> +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
> +};
> +
>  /**
>   * DOC: SLPC H2G MESSAGE FORMAT
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 60d9354e7dbf..cf26004b1efb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> +#include "abi/guc_actions_slpc_abi.h"

We should think on a way to keep this only inside the xe_guc_pc component instead
of leaking the guc slpc api to other components...

>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_throttle.h"
>  #include "xe_gt_types.h"
> @@ -227,6 +228,46 @@ static ssize_t max_freq_store(struct kobject *kobj,
>  }
>  static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
>  
> +static ssize_t power_profile_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  char *buff)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	switch (pc->power_profile) {
> +	case SLPC_POWER_PROFILES_BASE:
> +		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
> +	case SLPC_POWER_PROFILES_POWER_SAVING:
> +		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
> +	}

perhaps encapsulating this in a xe_guc_pc function, or perhaps having this
outside of the freq sysfs dir?
or finding a way so the guc_pc can register a file in this sysfs but
keep the entire flow there?

> +
> +	return sysfs_emit(buff, "%u\n", pc->power_profile);
> +}
> +
> +static ssize_t power_profile_store(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   const char *buff, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	char power_saving[] = "power_saving";
> +	char base[] = "base";
> +	int err;
> +	u32 val;
> +
> +	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
> +		val = SLPC_POWER_PROFILES_POWER_SAVING;
> +	else if (!strncmp(buff, base, sizeof(base) - 1))
> +		val = SLPC_POWER_PROFILES_BASE;
> +	else
> +		return -EINVAL;
> +
> +	err = xe_guc_pc_set_power_profile(pc, val);
> +	return err ?: count;
> +}
> +static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
> +
>  static const struct attribute *freq_attrs[] = {
>  	&attr_act_freq.attr,
>  	&attr_cur_freq.attr,
> @@ -236,6 +277,7 @@ static const struct attribute *freq_attrs[] = {
>  	&attr_rpn_freq.attr,
>  	&attr_min_freq.attr,
>  	&attr_max_freq.attr,
> +	&attr_power_profile.attr,

we should not do this. We should only show the file if GuC PC is enabled.

>  	NULL
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 88557e86d637..c71d95959dd2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -79,6 +79,11 @@
>   * Xe driver enables SLPC with all of its defaults features and frequency
>   * selection, which varies per platform.
>   *
> + * Power profiles add another level of control to SLPC. When power saving
> + * profile is chosen, SLPC will use conservative thresholds to ramp frequency,
> + * thus saving power. Base profile is default and ensures balanced performance
> + * for any workload.
> + *
>   * Render-C States:
>   * ================
>   *
> @@ -1171,6 +1176,31 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
>  	return ret;
>  }
>  
> +int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, u32 val)
> +{
> +
> +	int ret = 0;
> +
> +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
> +		return -EINVAL;
> +
> +	guard(mutex)(&pc->freq_lock);
> +	xe_pm_runtime_get(pc_to_xe(pc));
> +
> +	ret = pc_action_set_param(pc,
> +				  SLPC_PARAM_POWER_PROFILE,
> +				  val);
> +	if (ret)
> +		xe_gt_err_once(pc_to_gt(pc), "Failed to set power profile to %d: %pe\n",
> +			       val, ERR_PTR(ret));
> +	else
> +		pc->power_profile = val;
> +
> +	xe_pm_runtime_put(pc_to_xe(pc));
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_start - Start GuC's Power Conservation component
>   * @pc: Xe_GuC_PC instance
> @@ -1249,6 +1279,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	/* Enable SLPC Optimized Strategy for compute */
>  	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> +	/* Set cached value of power_profile */
> +	ret = xe_guc_pc_set_power_profile(pc, pc->power_profile);
> +	if (unlikely(ret))
> +		xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
> +
>  out:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	return ret;
> @@ -1327,6 +1362,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  
>  	pc->bo = bo;
>  
> +	pc->power_profile = SLPC_POWER_PROFILES_BASE;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 52ecdd5ddbff..5242bfa8aaa3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -31,6 +31,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
>  int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
>  int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
>  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
> +int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, u32 val);
>  
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index c02053948a57..5e4ea53fbee6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -37,6 +37,8 @@ struct xe_guc_pc {
>  	struct mutex freq_lock;
>  	/** @freq_ready: Only handle freq changes, if they are really ready */
>  	bool freq_ready;
> +	/** @power_profile: Base or power_saving profile */
> +	u32 power_profile;
>  };
>  
>  #endif	/* _XE_GUC_PC_TYPES_H_ */
> -- 
> 2.38.1
> 
