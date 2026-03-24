Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFF0F532CB
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 03:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489D810E089;
	Tue, 24 Mar 2026 03:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFZlXnWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D4A10E089
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 03:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774323338; x=1805859338;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j/Js9/TJhcwpYasgawPg/d26ojkm/2e+AXg57iVQYtE=;
 b=KFZlXnWwhfEgZwGjYuA7cRd/Y4dpzTnjP3qmJEU45hVQMDBefHQfzqo/
 sMHDtu4IjRlbiSvq7/+dP1nkXCQsDkl0AC5KbPY9OWP+zmgw5+NN2XmA5
 Rgjr6FwH0QnEKUMApadF+FJgq53anUex8eEeYFnkYxwV+ZeDXg1F8R+/c
 S1IWf15MaYMRMdcKA5joCRE2hqZk1v1Bbqiq3fH+T77ed9jOTF6531R0a
 YxGsTKaQBUnRN2Cv5XGYCwRii3g+P8+K4WECtv3z8PGwhUcmmifJWGGoT
 Nu9lVmb4zTgRFAmQm3vOUahs3F1+J9TZ1nJUk2YYflPqxk4ZZ6iDEL1k7 Q==;
X-CSE-ConnectionGUID: pyUhBNyzQF2T7DRWwzddRw==
X-CSE-MsgGUID: zK0N18P+ST+zelz7p9Ps7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75451930"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75451930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 20:35:38 -0700
X-CSE-ConnectionGUID: cck8y9JdSZGkP96kX+e3dQ==
X-CSE-MsgGUID: srssWc4LTX28I2Jh0Ht37A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228972679"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 20:35:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 20:35:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 20:35:37 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 20:35:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWqQfRRHlFMKbgKWDdGrOlQ2BMC7b1uKe99cgYueB28SToXPj92WRpkHNKL45ZllelOXEDYl0zNaqnE1JoV+XIZmtejuHGdfY4x5WV4u0U6v+vPJQOr+Ffwo7oQ1sztd070Wf3Qb8vV9zPSOV90yN2a2L11NoSdsghxjdjg+psl7r3pm20l36Rbj+KEUA0KbWmekuXLza6BFkvWL9qaD64/vlYal+ZwElaFwNdmwmF653cU40iCf/MHObCiyNne6gpdU28IQzUmISBBYloj+3VD9HAwJeVPkFZZgd0Z/NMpzsZtN8H9xEFgOx+zydhqIbk4la5DCli7y1KwAMcEMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+mC4L74ezO5XYjnz82atwQoIY8NRbrVYR6ac74lkWI=;
 b=ko4v9mEnb6jIXQrbDs/84FtUxZEfOI4SLEGoaE84lAYg4Cav6HqUNLNyqp9CT4QAyMqa2Iac7CjQT/+4lkSVtTzO8XR4gS68Kvn7+cmI6y1fEduBvX2GWeGYpNKbWOMTfIy+5Z431+sl0dZkyVxPokYcVPpIxmMG83Jn+vbLn0U9k23ooYk/vO9nwxQ3RJLKaD4wkCwcqHJxgah6DzmcPH1lzbQ1k+TLOe0bIJn1APP7z3ZP0qjHwXzKP+zp2GsP8I2tiKp17maOTP5BUXlz81Ha2p087dsIyRgHXtJkkU7Aneb+8H2LESeb3Yb2POgXZhxzfcr8HJTnMA1waf6vIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 03:35:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 03:35:35 +0000
Date: Mon, 23 Mar 2026 20:35:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v7 12/12] drm/xe/madvise: Accept canonical GPU addresses
 in xe_vm_madvise_ioctl
Message-ID: <acIGhP36TAvjAR4x@lstrano-desk.jf.intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-13-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323093106.2986900-13-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 7545ddd9-0cd2-4465-0c60-08de895668d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: PBRRAI4daeJxzuAj1jhITLKqe+14ZmBYLN0Yhfux8oZuAxNs8/K0xOZdPrNrN7hX/UO+zP+8Wst/15g05XuMIq0Usymc7XZ29ZIH21Tr7Ih9iKYZIenXoNGHm42MXVfzemHIg+/NFTtM+sVy8bJpXoYhIXEQt/uP2u5LmEg4VM8bL2VJMEO1age8v+mc1fik05Ow+Q8+kJk8b2y8BCIMvcj7zisX3k/VV9t1QSAYquqTfzvv7Hf0+VXVtsinExk29xw12x3QRc9B6kjwhd8RSjdr+iGnKIwxavd1EOQFn8o5gvTbrimMyi4e30RJ/IBPRiNi5rkqqQ3NdFcn2TY3RB5k/8Im/aU8gK01pMkewtmWZSthAshS2twqOFxaCiPk9P3LyTIO2Mlauh7C7pCj54N5bu40D8WhwHbZQM9WTV9SLG/G4mgBOl7HDHNsJq9W8pBzz1VnvCG+iZ0q4Q7JA5jzzlrqpS47lBrNvnwbd+Iat4Gbedti7VSlP//6T0H2Qa3vz9Ae2eU3bXwhQBoiY3u5wwsD2RjCt1rFNGX+MAUhAn6Xc8IJSR5a1uSdN0cXEpixTzCghvHGiDsVB2phV5nrqFDzFwBhcOoYCMd2YxPXoIpYoEvwIoy/hDa43sKtK+KEVRCjSYbCc9ubfp3rkLuNOgbY/MYE67yqRunF2YIxsOxkkydyT5PdSd04LA46GJw+XeBqK5InVjmIzwsgqhiewxdtUGM3DdDSsdZh8fA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iXQjUDHPz3PBsteS1PHeSjGbfDGMyAvyHiFvAwAc607X02Mykx7e7WvWgP?=
 =?iso-8859-1?Q?2T51PsEpaO7ZS8+OagOT1/PM9+YtUtjEeKIScDwRV0vTeAMIADHUcZ5TtO?=
 =?iso-8859-1?Q?/LYhwifYOmbntprBLo3I4kw3PwyWDAdZczCgKitBQyoAP+C2H0QhZtK8tV?=
 =?iso-8859-1?Q?Gb4koq4VOm1chz11vFioNLRySpCzIrRDH7QCQXclejr6VIP/gYPhlF3GmQ?=
 =?iso-8859-1?Q?PcIvocZVqcHv9ovrkm0HnEzzBaD3Svgbry06iB4uCxhVmY06a5uE/XWl9h?=
 =?iso-8859-1?Q?2fOVcPkscOJnz8nATjlYgTCv8DxU5aw3PXGLezU9drt9Snsg8phVy9OwBB?=
 =?iso-8859-1?Q?hqMA0+Y/GYJVdE9hKzf43RMa5UQQAVlAdZFvWTxsuyA3WFxqjdQiazVH7/?=
 =?iso-8859-1?Q?iex8tubrLK3nH6NzlJtlugBCf+5P6GRnxgW7BEPt6c7wu+GCPnI33Y+D4W?=
 =?iso-8859-1?Q?/S10p801DFWW+0ByU7VDBjYruCAQMBW6QfYUPe6aS+vqTFuCCXUliiain6?=
 =?iso-8859-1?Q?eAZp4Sfc0nhYYHeS+FpxfWralbowuVJJLB5Y7Nzqi9CfBZYYxydqgPTNwU?=
 =?iso-8859-1?Q?Mfd0l0pMoY8SjqJLJqKEi5IhHn0BqadoCSUI2Hf6jxwihVuyJ7kikRegat?=
 =?iso-8859-1?Q?c145LmRNVRpm4HEvnC2n8A3RPvxmdT58NVcIu4Q4USaeLXdm0e/4j9Ntnu?=
 =?iso-8859-1?Q?3KvCAKzUm8RUNgO4ZaBHQuq1Ml6J7nSiyxWeG5AYqupm0gI1j8Ye3FBRWu?=
 =?iso-8859-1?Q?O4TmHiRUTOz2/X1oh4EmXEmDJLlgbEJ7Zxp7hQJY54oYMTb25j8Peo0Jm6?=
 =?iso-8859-1?Q?4f7WB6MUu27lTwyaRd9dukIHlK/v0C1K31rdUsvyQVjrka357Fci6RrvQm?=
 =?iso-8859-1?Q?oV+Vp3J2dfQRVyZpF+9RtA8m/LPND/9Fd0HKCksRllbjqWPXZsrELUfSV8?=
 =?iso-8859-1?Q?zjW6IEac52UbVglRoO1KzzN3/r5E8AvkMsh8ZhjiNLWCra7Ge7i6QJbbRy?=
 =?iso-8859-1?Q?aZzrAD3MIcmZ1+Hk4mv//7DrJcg9v5sEEHPXrILcouf2Th+bTdjo6My1O2?=
 =?iso-8859-1?Q?n2hjuzd/RXzi8CQAiZgWhdKY93pWnrDUuwALQHVXp80nlEVU70gNzARN1O?=
 =?iso-8859-1?Q?+b2eL0XXCRlzRm1O13BkCucYIt90Nc20gxoK7KJV0zADBpBiqkQ6mmPvBG?=
 =?iso-8859-1?Q?HzFeucY6e/TJdy+PjS1bGnPaqT0V2iHLNkP/wjg6e6hAn3DiAIcjjjpC/Q?=
 =?iso-8859-1?Q?RDjBJk2J3kyWQ30FMlRLHIw8iJghrGx1z90e+ZQUSe3EJfb1jgQRpLGGcv?=
 =?iso-8859-1?Q?FFdLPetWcA5iYR5vwLY6eAS/xpc+58EsNvKGdCLYTkvRdUGOOOXUiF/3bt?=
 =?iso-8859-1?Q?TungFP08S8apbmFsBBmauH8f80fAbcyhFLuBtAzNXFcBLZVnLi9kmn+cCP?=
 =?iso-8859-1?Q?GWQuNsJ1Hslmdd4QZMkMm8OymQqiBCfzMMXNsDaMC/J/BoZfAKrCkayUft?=
 =?iso-8859-1?Q?pue/EyQeRNlvuheHEDMT+kVfwLW+O5FE3B2th673e3zUoFMJASfuSTiRHD?=
 =?iso-8859-1?Q?JmUExCYg4Y3cbXnBwjZ1Jjh4H48QmllzeT5a40fxI/KOof8hMrhoSitrO7?=
 =?iso-8859-1?Q?HU5MJR6x5EzsF8qdaVpDIQGzTLuS5eakKaLGC8xgYCjB75NWjytBNgMjPt?=
 =?iso-8859-1?Q?KC7N+8MvM85Dkz6Yd0sUEd4ZvgCEF7lySQnJTBvDay/mQwKaZ2XuTgg191?=
 =?iso-8859-1?Q?f+IY/uRFa3CQ/1PWjcdQCH+UNZ2nubdw24b1yfcxqoWW6wHSFBF/ZBDE6m?=
 =?iso-8859-1?Q?Xa1y6RtjqzKBPyldVvVf3Y3RWYLv03o=3D?=
X-Exchange-RoutingPolicyChecked: IQhWspXrcx6qe9fN3vKQoLvUPleiWeNQImBp4xGT30MjM/uSWQf0Vx8bWx6PscwbfDdiuup/XIjy3XsikdGOZsE8hFYYRiCaDr3U7rKUm2QhPri7ClNkJ5/8SssUSAJrXUm3mDtlmrCR1zI9cGo8aalEVMKr+nlZxZ0qdX0sSwlzWop6wTbGT/AjeVHeKmg0tfAJxP+XYY6EG7ho66wnIrobKR95hp5WXB1fPyzLtm1qsU6YvvtNXm+0DR2RTV7GC11vIPh6o31nb8DVcgh7sJiT2M4lCK4M1IjMsWgT65Guvjp3xcLjnlU8PI8XfbfDUEHtiSeF4ZnxS68rvgAl5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7545ddd9-0cd2-4465-0c60-08de895668d2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:35:35.4181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQaVK/l/hGCag4CdgWF8i4sbTuoK+r7Bd4uwzZMFcqa358ZcP09vCWnvBeLQbeN2HSQv7W4srh0ImInNsLZ5iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

On Mon, Mar 23, 2026 at 03:01:01PM +0530, Arvind Yadav wrote:
> Userspace passes canonical (sign-extended) GPU addresses where bits 63:48
> mirror bit 47. The internal GPUVM uses non-canonical form (upper bits
> zeroed), so passing raw canonical addresses into GPUVM lookups causes
> mismatches for addresses above 128TiB.
> 
> Strip the sign extension with xe_device_uncanonicalize_addr() at the
> top of xe_vm_madvise_ioctl(). Non-canonical addresses are unaffected.
> 
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 4a19da5e86d4..2d03676ee595 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -673,8 +673,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_file *xef = to_xe_file(file);
>  	struct drm_xe_madvise *args = data;
> -	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
> -							 .range =  args->range, };
> +	struct xe_vmas_in_madvise_range madvise_range = {
> +		/*
> +		 * Userspace may pass canonical (sign-extended) addresses.
> +		 * Strip the sign extension to get the internal non-canonical
> +		 * form used by the GPUVM, matching xe_vm_bind_ioctl() behavior.
> +		 */
> +		.addr = xe_device_uncanonicalize_addr(xe, args->start),
> +		.range = args->range,
> +	};
>  	struct xe_madvise_details details;
>  	struct xe_vm *vm;
>  	struct drm_exec exec;
> @@ -724,7 +731,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	if (err)
>  		goto unlock_vm;
>  
> -	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> +	err = xe_vm_alloc_madvise_vma(vm, madvise_range.addr, args->range);
>  	if (err)
>  		goto madv_fini;
>  
> @@ -774,7 +781,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
>  				 &details);
>  
> -	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
> +	err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
> +					     madvise_range.addr + args->range);
>  
>  	if (madvise_range.has_svm_userptr_vmas)
>  		xe_svm_notifier_unlock(vm);
> -- 
> 2.43.0
> 
