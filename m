Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A5C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35CE10E1C4;
	Tue, 29 Jul 2025 04:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atYeo/tu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2828210E1C4
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753762808; x=1785298808;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UAWFLBpoVif3MAonWfKdmGUhjB/U6N54kvlp+9uKqDw=;
 b=atYeo/tulaHIl95D7umSNjA5Y7ee8yBA71fHx+jRVXqF27ughkZDryoi
 Kwro43fNn+cJUny6UvUsOjlAIkF8Eurhn+oC+WDX3haRps0SXMvXGse6B
 do2WYozQEEj6eXw7ijBCeZ+Inasv7k0VsT6sFIpJpceOjXx4MyCChNCa7
 mxlUP/xn/7AqgF3lt5nJGzjLwtra4Q7OwmcHqjdqMSiMLwZppzHVfteQ7
 1sQw0n9ED8onYtlsq/qzSBgVb0/LbK7bwAR0LrmpsuViXxpVMXXYHVnlI
 pRAaiXhxEVhk29TgQJEx63aAlDZejyjQtJoAD/bYbZmQpdzqQKFaT5LBr Q==;
X-CSE-ConnectionGUID: oT97o/7sQCar8JzylAg7AA==
X-CSE-MsgGUID: QrHkx8crRyaWhW34uVHHSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59847826"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="59847826"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:20:07 -0700
X-CSE-ConnectionGUID: CrknF7u+QP6MG5rhTkc3KA==
X-CSE-MsgGUID: kIX1GdKsQay937RGzOvvmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="199735831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:20:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:20:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:20:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZ8s0s5x65hCVnD5fiXxcru2x4ENdRbzYnt08VE/GgD48ncSC7JAxfHUkwxSy5iYLgqi4krqxUbwQLBPWIeTOZWD3jWKOSrx2EKo1JHseiNynNnijyi7g83VZP6/qAhvigcv7YvkiXh3VXFuvdjxlrGfbOJbhl890XLxY4EBWNB9n5YYjxsjrXKzHjdqeguG4jl4fhwV1K+yikpNJ+IBdY5/Fr5rTqWbhD6TPnb5YaGQArtXmUx4YuQz9ATbTcNqANzd0GXyEgtZbUUpb/C9X0SfvofcKuYVWE4BvAUcVQK2spkI88P++GYuK0Ccewip6GKJUPAWiBn/hneMed4C0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPVc/IA4mmPFjhsCdbbjKsK8rp99CvRCjR6Nonr2IOQ=;
 b=IzvK8epg+obkCJKFRpJYIetXIC4SJMm3Q5kCTLbnPQaOUvH6R5qypyGyEcS06s1bkHdq6ugWWdmf1MRtpY61lFI6IYHpq7P4Rk6KSDOJv8ln5H4FDZMviI8lbdn3q8p55CtkKoYxcdygFWWRrqSJ04Y55B+ZtbOd3+7SHy+5zCVqwb2f3hcLaPCXqAm+me1uMBGEe5HicAlJJyOmMwtJZUPEiTADMb0TPs98isC23LvW3ORiquqj5lTq/QFPfWfhBRdioaKu7TtYv4U1dX1CnHbSdK+vnUn0w8IySSo2ZVctbWz+Fq2k8B+fx1QOusYNpEnqR8gaQ6ftoTsp3aJ2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 04:19:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:19:50 +0000
Date: Mon, 28 Jul 2025 21:19:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 18/23] drm/xe/madvise: Skip vma invalidation if mem
 attr are unchanged
Message-ID: <aIhL5O5mvYuDcVz/@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-19-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-19-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:303:b4::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa9a4c8-c9cc-4501-1ed6-08ddce57294b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X2bwfdFIHxXeflq+BqRg9kT/zNUqdnxo3OUwdYXYINox3Xh3SvaerFidYx6a?=
 =?us-ascii?Q?6H3blIFKdfh3t/stwQBuTjouSqwIylOXB24vuYz1ObPp+IlAMcKPGxgTAYgD?=
 =?us-ascii?Q?ey6oy2a6uz/akrnz9Izq+0OAEnwcPETkcY2PCOwQwunoIxL89xb5SdXp+xY8?=
 =?us-ascii?Q?s677VF1hin+Mhgaxe6FTDtouAnHMEctcZup/+krq9EKMzZFiDMfJweckwYwd?=
 =?us-ascii?Q?tqG0GQI8iI9/hiRIPREfCjL3p3bQJt2tk+KBS5Bj4gbMYaiHlitLd3xV8/6q?=
 =?us-ascii?Q?kCQVDla1Us7Zu2l5W7XtO7++qe0e7hWjzW9AdMalKigp5kdoSd57XIKQWuJS?=
 =?us-ascii?Q?RBQc/uxOKheXwirKsc859JdmV+NFWolk3fjT1VTk/Q7W4/LtPamTtbe6Kcv/?=
 =?us-ascii?Q?I8cMv6odCCgKB6HLnxEpan23hwaozb2/wWFZCf8+DDvZsvkmR+6iAz0OZYHS?=
 =?us-ascii?Q?z6DtsmcNrqZ35140OOErqZyrxt8BSkt1I+0noRdHUX7slZr+JNLLtrp/kseP?=
 =?us-ascii?Q?X0X72f+RZ+OuOKMl2sZPn9b7M3Pcjd0OcSh2dELVVP40MNZ94x6b7Pg8/VRb?=
 =?us-ascii?Q?MwE5CurwmZLWOKZemqScVehuD2WZs3apc0K06Z8gKper4YdU94MnmPvVYBQl?=
 =?us-ascii?Q?2sA0jfmbk4VTikg14DUp2DEV5DzHuoFTVnphwzRLxk16+9Q/6+49eAcvIUqg?=
 =?us-ascii?Q?guurrs56wtKwmLqqYGnO47VLGqfewtbXRvc+MvCUeC7TTXCsVOFcFQqpb5yx?=
 =?us-ascii?Q?KaK+5+ach0M6k+coJSsxKQx/vH1Nvt2sIDl6t4qunz4BS2OCyXTb9qXZBJmB?=
 =?us-ascii?Q?iS1FQRzPv9mMzV5qVBLUOLOBU+OfqqDcf+fIz6ffLK9zKPQAQBIoX92myKof?=
 =?us-ascii?Q?/VeGu62fouhyanDjRZ6KyO2vzRHkPvDoLVcIBYCibZHvqvM2Us38vzHjflMW?=
 =?us-ascii?Q?xX8X9Bxy5Nh/FFzBN5vcPGAZJ3sEsoWyLVWCTV/DZVYYLovnqoJ5WxByg9PC?=
 =?us-ascii?Q?iooH/PiMqLpki5Lfn3D2moUs+VUydU1A0t+qqfDJVWmDCUxzWH1tYqLL7SwJ?=
 =?us-ascii?Q?qhGH5SIQdxVRQDQ3sZu31kG/shks/R1MfEPK2rD8+K6hKITxuR80RXsZjfKB?=
 =?us-ascii?Q?1cx6bZH32hiMHNXYcirvzYMS+hiK9uo63s/vnemvurCaRq9LqEGVWNyVj8/7?=
 =?us-ascii?Q?qv88giPKTXtRiTXphEZJ5vyhchLig2YwzhtHKK+zD6FCsH52wxCXRS2oRUlU?=
 =?us-ascii?Q?wrzNn8YUPUXmBJdIl3l0HPmcLWBVUwCepklvnKDGwz8JUGethrGopnPeFIJP?=
 =?us-ascii?Q?0dthB45yLXQ1Ri+iEWjC0uA8YUDoJ+/v5qjcGRTrMbyEQnG4wpuxLDSv0X4o?=
 =?us-ascii?Q?LIBSTcPpovP6AkAeOCp3zHfVccPjNVn4oi1hz/8ZRFk0N+N18Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GtCNJtqtAx6PVxvtIR2zpq0+XGQa59KLPDtWbP2udW+V9fKRrvUSlZDAD78O?=
 =?us-ascii?Q?YDrOwDGzVQhmi5Jh8UzJ3Iqps21KlG2nKkPW0mZCugtGCdsZIpqaCTocbH9m?=
 =?us-ascii?Q?0D7tBrCsDlLGuIQEuSt+TQ+3MRTjfI7p3ZiSUTAFSshKeooSH5xezH4zyPy5?=
 =?us-ascii?Q?ogsNrLl50dHjZNjrAPLggNc8j57mQjPScug3qLv+isEefamyHy5qyUX3Nqev?=
 =?us-ascii?Q?GvZUIeh0+0rhVwpBWw3W8iXVQrBLKGQ0cKjFBkNOCJJWgc3qDCARDUwKKv1h?=
 =?us-ascii?Q?9k8p556fG5zYGYo31sG5Nr9mn5foNqD5D6fO2Xm5wjgWge7cdo84PQsjlR3X?=
 =?us-ascii?Q?GUv+CYxkXULDUPDAY875FMqT+sDcoWtEl8uVkThFpnJqGu3+YrarDynby2+H?=
 =?us-ascii?Q?7O2maz3tB4v2rorcP5C4T3/rnb7YE1vDmYxTnj9MMjyk9zAzpHBBAYdSfrwf?=
 =?us-ascii?Q?BfPMl+CTOLMg9ScHi7Yh/IMO7B10EnL4UhfYnj6uxt2Gu2gOMPf6X/W4IF1f?=
 =?us-ascii?Q?wpvVWii9DvQNf6EDF8DAIou8JRNiO3f7QIBB/Z8KDGEiLyAcraJr+qMLsvW1?=
 =?us-ascii?Q?hiI/8QBrEZsr4HNohGrRXK1H4niBMGFYuUPXoqKtr2SsP5UESWbd26qV0MZz?=
 =?us-ascii?Q?uXyc1ja32RpX1Mw+FP+/k8pax8aIimQsNIqE3ANrtj6ETg27zAW8OmldPhfn?=
 =?us-ascii?Q?LzK8j25DN4i/ikI///CvHJUQyi+eU+C5rHDK+3KRAqBTbSladMg02+7ArZQ4?=
 =?us-ascii?Q?Tqsh9ktP4vU6AunF8feOMQZCdBgrWR6bxPgJFH5D70pLGw23T/aPhRXcaQ1i?=
 =?us-ascii?Q?ujVzV6Y7PMvNEHyru2ilMuZG9ag58MzsCfhYR0+fWlJ28LsNsvme9zOcjG3e?=
 =?us-ascii?Q?GM9+STFjmjkIMvGEuzCtlnwk2hZHcZw8hwiVGxrLg7/JWtezJ10QUkrtG8+8?=
 =?us-ascii?Q?ioDd2wtqZ19a+YDv4exiL7C87RE499n0NY07V5lj8in0cMbTDL/alLEo/ZBa?=
 =?us-ascii?Q?bH6iWIlK5GCQUuGqtwIQvi2C3YwBH6dV6GArM7x49Nip08USMAiI+izbnPqc?=
 =?us-ascii?Q?d+5fXxWtQlnAs4ZulPBEQttf9/u+pFwC4gQHWyMFLMmR0g8mvpo8tjxNAHEt?=
 =?us-ascii?Q?XSNTzwd7/whFPTqqDNyeG3hKpkablQRv+I4bQQ/0e3zI5Z+v+xUuKIj5uEPG?=
 =?us-ascii?Q?BAoXC+XuIUAbB9tcQHwmC4kdTN/bM5SGGuXgTxjZmAT02NnsMjamiCIsqToZ?=
 =?us-ascii?Q?63OMzxDpiRZ8Nb8oYbWRlBeAqZuyXkpGxTfsMP8ZTaW/Aezl/f9sZlzntPoz?=
 =?us-ascii?Q?ThcAtbBk0SegiUItx0oYJDcD8UR1HOqSXFx1oLhk2begnfmHILkZ7iTnhyd9?=
 =?us-ascii?Q?TmLy5X8Were4jm4zET6KWcMZKkOJqjd1DQ3XdxXunmzEeuiJZMWh082zgf2N?=
 =?us-ascii?Q?EAtdlDka2XnnrApDKdCEFw9lPLpVNe3J1/pGgn2UNK/ERtYFTEb41aXSdA5u?=
 =?us-ascii?Q?cHQ3aiF2vAR7ODlVU6OCQ93Rc13VAA2hkDkxoOcwZNSZg0rGAcPOiME3iaU7?=
 =?us-ascii?Q?7/rqzrWH81TCJF6BHQKyjptEx2dW1J7LXWePfvXeWmgMQdD1LcCoWEy5j4rS?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa9a4c8-c9cc-4501-1ed6-08ddce57294b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:19:50.8493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbU8E8tVW4BdSP/hVtZYnpuiOZmmXe9F5H//qGa9W6ko+CLFogDnynK8gfQcdCa4UdyRlVF/Z/KWeVPGzFIiJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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

On Tue, Jul 22, 2025 at 07:05:21PM +0530, Himal Prasad Ghimiray wrote:
> If a VMA within the madvise input range already has the same memory
> attribute as the one requested by the user, skip PTE zapping for that
> VMA to avoid unnecessary invalidation.
> 
> v2 (Matthew Brost)
> - fix skip_invalidation for new attributes
> - s/u32/bool
> - Remove unnecessary assignment  for kzalloc'ed
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 52 +++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_vm_types.h   |  6 ++++
>  2 files changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 727833780b4b..fbb6aa8a7a5e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -84,13 +84,19 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
>  
>  	for (i = 0; i < num_vmas; i++) {
> -		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
> -
> -		/* Till multi-device support is not added migration_policy
> -		 * is of no use and can be ignored.
> -		 */
> -		vmas[i]->attr.preferred_loc.migration_policy =
> +		if (vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
> +		    vmas[i]->attr.preferred_loc.migration_policy ==
> +		    op->preferred_mem_loc.migration_policy) {
> +			vmas[i]->skip_invalidation = true;
> +		} else {
> +			vmas[i]->skip_invalidation = false;
> +			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
> +			/* Till multi-device support is not added migration_policy
> +			 * is of no use and can be ignored.
> +			 */
> +			vmas[i]->attr.preferred_loc.migration_policy =
>  						op->preferred_mem_loc.migration_policy;
> +		}
>  	}
>  }
>  
> @@ -105,7 +111,12 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
>  
>  	for (i = 0; i < num_vmas; i++) {
> -		vmas[i]->attr.atomic_access = op->atomic.val;
> +		if (vmas[i]->attr.atomic_access == op->atomic.val) {
> +			vmas[i]->skip_invalidation = true;
> +		} else {
> +			vmas[i]->skip_invalidation = false;
> +			vmas[i]->attr.atomic_access = op->atomic.val;
> +		}
>  
>  		bo = xe_vma_bo(vmas[i]);
>  		if (!bo)
> @@ -130,9 +141,14 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  
>  	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
>  
> -	for (i = 0; i < num_vmas; i++)
> -		vmas[i]->attr.pat_index = op->pat_index.val;
> -
> +	for (i = 0; i < num_vmas; i++) {
> +		if (vmas[i]->attr.pat_index == op->pat_index.val) {
> +			vmas[i]->skip_invalidation = true;
> +		} else {
> +			vmas[i]->skip_invalidation = false;
> +			vmas[i]->attr.pat_index = op->pat_index.val;
> +		}
> +	}
>  }
>  
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> @@ -158,17 +174,20 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>  				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>  		XE_WARN_ON(1);
>  
> -	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> -
>  	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>  		struct xe_vma *vma = gpuva_to_vma(gpuva);
>  
> -		if (xe_vma_is_cpu_addr_mirror(vma))
> +		if (vma->skip_invalidation)
>  			continue;
>  
> -		for_each_tile(tile, vm->xe, id) {
> -			if (xe_pt_zap_ptes(tile, vma)) {
> -				tile_mask |= BIT(id);
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
> +								      xe_vma_start(vma),
> +								      xe_vma_end(vma));
> +		} else {
> +			for_each_tile(tile, vm->xe, id) {
> +				if (xe_pt_zap_ptes(tile, vma)) {
> +					tile_mask |= BIT(id);
>  
>  				/*
>  				 * WRITE_ONCE pairs with READ_ONCE
> @@ -176,6 +195,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>  				 */
>  				WRITE_ONCE(vma->tile_invalidated,
>  					   vma->tile_invalidated | BIT(id));
> +				}
>  			}
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index cd94d8b5819d..81d92d886578 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -157,6 +157,12 @@ struct xe_vma {
>  	/** @tile_staged: bind is staged for this VMA */
>  	u8 tile_staged;
>  
> +	/**
> +	 * @skip_invalidation: Used in madvise to avoid invalidation
> +	 * if mem attributes doesn't change
> +	 */
> +	bool skip_invalidation;
> +
>  	/**
>  	 * @ufence: The user fence that was provided with MAP.
>  	 * Needs to be signalled before UNMAP can be processed.
> -- 
> 2.34.1
> 
