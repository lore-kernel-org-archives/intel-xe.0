Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F363C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 17:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5FD10E765;
	Thu, 29 May 2025 17:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWAIXEkI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99AB10E765
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748541585; x=1780077585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kVdAnOeoj85mR4tsYJyR3HojgvK5fO08ZYEjq3MZdfo=;
 b=IWAIXEkI8sPtb9/EEYaGjMCodwt2m72xxrlbRB2ko2gEZTPTjn8tUiHu
 8NwLgZYoOXSo63sEpWpRZnyd1z1NQoYYAWXSTTgHlMPP/J+rTQgAe56RA
 VXdcVTz0eSz3cJkHB19RTQNvb65SnuT40IwsoBaAdnacAH4dPI6tJPMqD
 IsNGQIBeMB1NRCRQenQvkCFjuxfpE2q4YwN7EEdbkmAx0H3xJWX1WZw1W
 lAefl+5QjdNy1e0iJ9VWTQYbalZgnkuhx71WgbPA0YZ6yZ4iDcXkGaTjM
 fsLBKUsDIgvEQDZE8ZVBRXRk5Sgv7yA0YLRen3aZa29481V2WYw18wXbv Q==;
X-CSE-ConnectionGUID: HDAkNfKWTS2Yz51y8+tnMA==
X-CSE-MsgGUID: bkUd8i0LQISpYTEgdGZKuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61281906"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="61281906"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:59:44 -0700
X-CSE-ConnectionGUID: xonEvXZwRuW0/cKANvqEHA==
X-CSE-MsgGUID: YoYEEycAS42d9bCar8b2cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148922630"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:59:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 10:59:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 10:59:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.67)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 10:59:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phlvW1S1ZLqwhZtHTecYXeRXwSDGj1GFrfBKA/5gkXyqbzFqIJ/0XRP7Jvx2ePSuP1eMhRG5SlJeF5lhw0t52sIH5/J/LXm6uwnlX4JwUAGTkJ8Od7LhVxbrwIh9z2+LvIDxkPwCMm5Ttwg56ueW10l/uRk1lbQHE11Y89sMFBWrSx9LqPv+Q69XH5GXKb4fFTjnbgr3dv/yIk9Nf5g4+la3zX7XZszoPcyJGv7LndGlWAFyBxNzAE/EG1zmoIWHvw4APdr8BKZQQM8QUUXkm79uA6j3bYGwvv1pplZAK7CoAR/qw1vhGzKaJZHsLmqByOSJ3oZo+LuK5K7i9RRFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDkzdpzvpsXF9gZP6pBLhAMXTRhtZDYFflceG2P2AHY=;
 b=RNhlnXAYYEAkZnz8iZZvPhmtj3CZTODfU36mp9KXh9tgMaS1lwsUb7H1kKdTLMkpWTD803ChU5QdKoC41RqNIJvd6WXzrv8lLZmRXwMfnEPHed96AcOxeCNoOWaze5YXqADTAlKAG5Mrh6OGblcB1Bnqv9ByIoMlIYec9PIdKVoTjW0QVBjANgiLu1QkPWpx65FyuLOjpjqt/s3tl9ShFDAl6CFNSGe5Jc0dq9IKYnXhr4IJ98OMTANwgBFQYwjY/xRVE1X65CGv4cvdhcb3nPhe6HJvd3Xqe+2bVU0E7FXhnNRxlE6GSPN4kz62UWBXE3TyEnL4kkWFRct9lQkNSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Thu, 29 May
 2025 17:59:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 17:59:25 +0000
Date: Thu, 29 May 2025 11:00:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/19] drm/xe/uapi: Add madvise interface
Message-ID: <aDig2SBgYWmgglcK@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SA1PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: f90d2946-41cd-4c03-5302-08dd9eda8c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qMRcinmYdQ5SkcvE5Wr5UGx2mH40F/TklU5SRcl2IksodssldFJb1t5F9MRL?=
 =?us-ascii?Q?sZw0El/SvrWdLLzFeu0nCJw4On6jTnZSA/QjH8zaRsVg3hNVg/5ZvRYjnjUC?=
 =?us-ascii?Q?XL8aQLGzShk29izxZK43MAZVue0QgCwCNoK/7I6JmYq35FhVe1PTGEWwXgbS?=
 =?us-ascii?Q?EAdD/Afv1FZdy2CUc8RHOOkfy1LdebG9tHqPeBY6Vv6kHwdakxTXeoLOgU8Y?=
 =?us-ascii?Q?NxJNgH/vc98MVscX5Q0jdJImaWwnL1K3mLt8Lf2tx3+uc+wByMS+D6ehStPo?=
 =?us-ascii?Q?PzBDjvb29JWd6zlNAiZbwvz/Hd/01MXNbpdk1R1mq7oEIV5eYjjWI2Fmsiyi?=
 =?us-ascii?Q?6QZoEm7zg/S5vn6djv1HkCTBQqi7xmSyNjGGu27O4EMrLb2aQxLR2l6A5vHN?=
 =?us-ascii?Q?qWoepmOTWYMTwnIjwSX1F4x395ERMqkd/98K1rYEtt99gsRthZi35VcDKmG1?=
 =?us-ascii?Q?092onjABMuJoesxlgEXDEfiwYL3lBdCl7tYt5JJn2ITdJzVIK51Xt3a43kmX?=
 =?us-ascii?Q?H7fUwHJNWybl0n1ZAZY5PHFOwTs1ZYyz1FBwnv6f90wHDPn/L5g3kpEWRdcL?=
 =?us-ascii?Q?NGxg058W7xRoPcJ05OpAjpyPr+bcUSPMEXNU5EJd5j2x+1r+fdUl//JAo5Tb?=
 =?us-ascii?Q?ZfhxEjyF5s+kmuOAaC+XsmsBh1TuAHmJ+2Q/MkzHiwk5tDwJWX6QgRNwzONO?=
 =?us-ascii?Q?Y3Q/AY4tkeObGipgu5vMjL39cCBYVt9ArkOvmS/q1Nc5WDqLRi6Mg4IdEhhL?=
 =?us-ascii?Q?vkZwc1JiYrS2Bof7YwFefFvgvnsBQYSB5+imXVc6D6pGUMMD4XPnPgUBw5aL?=
 =?us-ascii?Q?5AY6BbErdcPN51quPkPencpk20oyMKEa+iqv5c2wryemPcU2YQCCTaS7QKvr?=
 =?us-ascii?Q?u8ZcvBsbRGD1LmEzLsl3dPzYLxAGtBfGVWJRmiJXLFSsWE0xzz5j82yd8gse?=
 =?us-ascii?Q?pZMBE/PhkBYOBmRW8g2wTKgbfZaiVRnk5psC4Es/9feZBJLN9wDYv9N3EvbA?=
 =?us-ascii?Q?BdZXtqhf5exX7gCkVjaLEOmMIC4VzjPQX5blugOeKUWhP4BxXtY9KNF++x8n?=
 =?us-ascii?Q?NAnwTe1MbjCtAYELvlDXtANrx3BthYv9KofFpMBc/NwH3PGilbudgLJozogN?=
 =?us-ascii?Q?gqfGaaRD5o5NDe+pV3Q53LMxnI3Z9qQnlCAPLP9wc/lOQZ2MVoc8N8YC514a?=
 =?us-ascii?Q?C/h85K/BFSQozKoG5gm+HqkIdniKUYz5iF7XSzefBNb/4FodqROmFTcXfBGY?=
 =?us-ascii?Q?KfX/jNodfd95jIODk5IEJa2Tz1VvwTX3IQvoT0hgKZuDgC3NKebxeLHUe9si?=
 =?us-ascii?Q?fNBTnupnt+2Dj/o9Qbb87KkcrcFGYME1L6xnSA/ZKKk0ceyyabzgZLBzlgXg?=
 =?us-ascii?Q?AGwvs0pmYuCF2pGtcUV3r9DpvkmWwjOUaPS9KoXm8SCFAMympYw9NdY1i3hx?=
 =?us-ascii?Q?ou4Gt3qC7VE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I/cfV6T+XVfYK22w3UYzkRW0d8OQp6X+w8YaZSpWewT2XAYpMb7ojY/0mLms?=
 =?us-ascii?Q?4dS4D9+88iKmN7C0deZPWfXMSF+X3YcEKktqs1H6rvH1P4jYmOY0n9RKEUh7?=
 =?us-ascii?Q?5CGIFHf6awBa4JM6APKZpFngIzGQrTwIJYUee3DdBmDl0u8izDnw39iH59+6?=
 =?us-ascii?Q?ZNG3Tlt7fdT5w78SHqnkSUSz2nPiE1X1Mzmwl4VG7E4PGv659GXty06QT+R6?=
 =?us-ascii?Q?P0M/kfLpJF2WEu1P1TO4gUlsFeoysjO8QdYUIRO9ZpvpASYvu3/PO6k7U8/V?=
 =?us-ascii?Q?wOJyqxtJjwsVTA1l8D+Kpx4qpRSBaRWpicYwxfPqWA9TNzUb9o1MqT0dXLAX?=
 =?us-ascii?Q?A7Q78Ev60YEQ+zMtHicukadBAi4jFvyFTgqCR1sWG0YM4G4Fd1racl6FwGJX?=
 =?us-ascii?Q?b1/bMx4xMahxAwiFGdvmU9vgwX2PLBLF5e7uSvz/hfSgJugnLOU3S7mnnGPQ?=
 =?us-ascii?Q?K/serOYi8VkCDxMCTZeTiPfePYr9rtQfW+u/Xhxm9ee6dgXKQvSRJNo9spWG?=
 =?us-ascii?Q?qSv4ID4kprxlAel4JY/JIvIsZxRKR6/MiExpvVR7885ngWk7XQxbglpP6jZW?=
 =?us-ascii?Q?Ny1FFuZkckrFz85+S0dbzVL0XgisC37trnqBVI+3gzfs3NYY6vMW2WVzHuxY?=
 =?us-ascii?Q?PjCiU7YQRJRBrZiuPvN3SXJ6QBVoOfphxrKJQkx0t1HU5MnM7UXeIo3xolOm?=
 =?us-ascii?Q?rvg8O2IuIOTXA+zY6aFmgr/IxNnvMHcvNKUvWvyZjfEkg+zERrHSuRSrSrtJ?=
 =?us-ascii?Q?O9LIgrU08NkxEA3nnw2oewtuBsTazevPNd1+86zqgEEjqm8cM9I8gBoUrONA?=
 =?us-ascii?Q?E8FB+aziZdfcOfvPw/SODaQ801NuuzkRvwmFY/fMjF89Ntyv6cFfO7ll3eHm?=
 =?us-ascii?Q?Md5N+tuc9B4gyFsd1Acd4va7ztRZi1C4Cu5vcuAbRe0qNf6O3Ios2Fug0eeN?=
 =?us-ascii?Q?6Iu4Ku1up0x3REhv7/3aTuvtf8CQJVJ0qCMLb2LHh+nrFxdRF0swstcGKSfu?=
 =?us-ascii?Q?aipvGRKbZK9rVZ+kXJYX9fhv80vu9TPvJmS7CGetIOhUi/VDGXpfacpysjHK?=
 =?us-ascii?Q?dp8L5namrC8UFWEkqMFLUlvOtDz9nxYy5rk4okakX11gBjuaoFXRY8yUPvpz?=
 =?us-ascii?Q?f67l2y+URzswOMK56ccHdQeEXkC+3TtXesUM0FHVAaUSU8e/VofkH2JkH+MH?=
 =?us-ascii?Q?VT3ugat8vcjhrW9JyH6GLhrrqAXZT4QuyBCW95AVu/2UY64furSPl15+CqnD?=
 =?us-ascii?Q?kp+gUKeYKHlx+VoliF5wJvi42xwctY9IzWmU9mGX8zM17Q5YElFKqDPb2Dic?=
 =?us-ascii?Q?NHFMaxEMT9l+vLAjoaeanqxXEqG0Gq4B+GR5NCJlOmtbFqQQ3YWSZOSUX8/3?=
 =?us-ascii?Q?yrifR6xQvav+1bxL6DgKlhBI4TQPhkffdp8C14i3knAFEcWIHafXbp5GPT+e?=
 =?us-ascii?Q?82W3dfBY9tT4T0UztnlLfN5xbttJvKxiLaVF97MLEYQnOCJTPCS/L4LYiAMe?=
 =?us-ascii?Q?WlAPngRmW0Dwi9usvcythbgrRSRhi/3j67t2O1MavsEzMprhiIKoS0mSbcga?=
 =?us-ascii?Q?+mVNSNbBeskyD2d+OpE+6Cpmt4RPWHhatLylLvJuEpYcFqKpaL6rT6l9wJP8?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f90d2946-41cd-4c03-5302-08dd9eda8c72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 17:59:25.5350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+JjOKN0vgHsNAXTB3UTxzp30eaIXyWYSqlyGtbfQPAdNgE1jpEmD929BTpk/OCykLkVNAoGq+tojxUMnpT3qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
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

On Tue, May 27, 2025 at 10:09:46PM +0530, Himal Prasad Ghimiray wrote:
> This commit introduces a new madvise interface to support
> driver-specific ioctl operations. The madvise interface allows for more
> efficient memory management by providing hints to the driver about the
> expected memory usage and pte update policy for gpuvma.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9c08738c3b91..e0d75226a724 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_MADVISE
>   */
>  
>  /*
> @@ -102,6 +103,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_MADVISE			0x0c
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -117,6 +119,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)

Missed this in prior review - DRM_IOW as I don't think madvise returns
any values to user space, does it?

Matt

>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
>  	__u64 sampling_rates[];
>  };
>  
> +struct drm_xe_madvise_ops {
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> +#define DRM_XE_VMA_ATTR_ATOMIC		1
> +#define DRM_XE_VMA_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
> +	/** @type: type of attribute */
> +	__u32 type;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		struct {
> +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> +#define DRM_XE_VMA_ATOMIC_CPU		3
> +		/** @val: value of atomic operation*/
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} atomic;
> +
> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} purge_state_val;
> +
> +		struct {
> +			/** @pat_index */
> +			__u32 val;
> +
> +			/** @reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;
> +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD 0
> +		/** @preferred_mem_loc: preferred memory location */
> +		struct {
> +			__u32 devmem_fd;
> +
> +#define MIGRATE_ALL_PAGES 0
> +#define MIGRATE_ONLY_SYSTEM_PAGES 1
> +			__u32 migration_policy;
> +		} preferred_mem_loc;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> + *
> + * Set memory attributes to a virtual address range
> + */
> +struct drm_xe_madvise {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_ops: number of madvises in ioctl */
> +	__u32 num_ops;
> +
> +	union {
> +		/** @ops: used if num_ops == 1 */
> +		struct drm_xe_madvise_ops ops;
> +
> +		/**
> +		 * @vector_of_ops: userptr to array of struct
> +		 * drm_xe_vm_madvise_op if num_ops > 1
> +		 */
> +		__u64 vector_of_ops;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
