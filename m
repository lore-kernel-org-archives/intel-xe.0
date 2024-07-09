Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99913C3DA42
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 19:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676AD10E640;
	Tue,  9 Jul 2024 19:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWxjTPKA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486FE10E647
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720552119; x=1752088119;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q3QyLWsbnIeMiJfAybl9RKs3Rtjw58k6sFDWdas+u6Y=;
 b=OWxjTPKAiZ9Ge9IerhU0g1zgtWX2htWEgr/T6nYhY4dnc9zndlQhqAd/
 Tj+8CdCspZhuJ+OExAS9xBRHxbOZ9b98ucVkOvepBKx4iAFFzeoF+C/st
 +TGRRfyn+Cn1cnssxUUAVZ4jZJTCUheZgiZgKJVdQCs1M3bbMmvBhKIri
 inwKRqynxvIRjEO/cUGz/D07OggcqZ0IWqXXBJio1Mdz3yC0jDLAE5BsK
 QFVnLi52jwjUoJ8uq3kgzqRiNy8QaBsREBmDCH/9WBK2exJXIfnMjnkmN
 Kl8dSsI1r9o7d8ox1XLdaXaYy8I1OXCiZiTctiVa8Oqi6UHjbMvxrb5Hy g==;
X-CSE-ConnectionGUID: 3/igTKEwTDeJ5tBpEC2kVA==
X-CSE-MsgGUID: eIFCKIHVSfiZdXPFdR3zmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29228380"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="29228380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 12:08:39 -0700
X-CSE-ConnectionGUID: jwwKPW2fQKWgHQkMVSvGNA==
X-CSE-MsgGUID: 9SbruiqLRbi/+QB2eMlM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52557697"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 12:08:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 12:08:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 12:08:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 12:08:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv4AE5OAqgjHecYYa8pBH7l5tf7dRnlEhUZcTd6ltBmngKeRuBufTXv2eRyaTXR7/PtDPk28+1FfjYcA570AmpShsDGKUTUZKjTGYzuNKvlb4e01vgM0QOmROQJIj7H5DUU0e36/7zbp+NMZES03N4GPZgzLgQY/R5B9/HmvFSznLi/J/TD4QC7cNmSjEBVn/r9ec/b1ZemI1/YmCcgaZXCdG0yTy/wfHrTGXvgQKXt73lsShPojCbCoUSjgI1a0FvsXAB/iBgUL5k/4PAu92wSzZUyAC1J5kzjlM9SIXb0Qnpi1aygrk3w6jT18MrAMYU3juk5RQGSGBjL3yecIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHgw6GuZ7zph/Yw1X1a0S5GzIDjsx5TMR50m/gAoKf8=;
 b=E+6GugHaTWwamEcASPf15lMfA12xUlRa9/BYtv23BOAAJgG0Y6FwFQyT9fwAukepHga1eM4LkvM2QN7ElGVAbHH8LcQPiS3EnPQwtQm6TTha+Bzl3jEXZcb7AeYTOlFt/eTp+cZtI09gg964ElScnowjviS4IGdc3b1DP6jUYcxSZ2e4kkDiAVpFXSmwW8PhR7r03ETP/WSANLEX53pnvkSxLnucTWhHoMfiR24xRPr1VaMBeSf8/H7t01Rcm0C2JJTdSxLRxyjKAmfRYyQyQIkyssBpuhFCmNwTAv6UPYL+v79r5iDcMZE6zpjzuXglShBjKNYKGyJmibBw8Gy2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 19:08:34 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 19:08:32 +0000
Date: Tue, 9 Jul 2024 15:08:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Generate oob before compiling anything
Message-ID: <Zo2KrYfuRcnowOZs@intel.com>
References: <20240708213041.1734028-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708213041.1734028-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:74::22) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 961aeb32-d053-4e7a-89ca-08dca04a8690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M7O9cCECQTLHJCRKswMLgEDlt5kTzxg4pr0qbiKftCMdufU69QbP0UYYd4fb?=
 =?us-ascii?Q?D0O/peTo5wHOShehBNdHl30JwkCvRW12Ho25iZad413kCBB/P+O0id0nEm63?=
 =?us-ascii?Q?FWUchJJQFQicNd3bNWHeTm5ZCNPqpzHfdIvPWtuKz7fRynzyxktgESFStBf/?=
 =?us-ascii?Q?jDPIM0E1oOtHcziTgKF8gkJbJetUaRGb5utmAdPyYvPvLVcc1TUOCrYG5blL?=
 =?us-ascii?Q?BbC1qXZRktlsVn8h5hxxVq861vZtL3gdvvoOXum1LqJWLUCjyFEjySQORWHs?=
 =?us-ascii?Q?bfGXrWxwAdC8r0//PlPvhFLVJvmALYqJi3Dxx7wwM7e7Oe3Sg+g6o98t+iTX?=
 =?us-ascii?Q?5X5GlhXT2JSSoGD3jnRR3+CAF/S8Z/uQR/opEtm0le6Iq2ROYPyeWxeANq4m?=
 =?us-ascii?Q?2k/G+wlghP7dME/LDEJdjwsvpNi+5QLhpJFua3rXe9Jexj1CEdh/IQCdii96?=
 =?us-ascii?Q?kWDrCnvJfb3F/v7KBJiGxV1CZ4LOX8UMS1kdIoQUhHSuozdbRy6d5VhD2Tbr?=
 =?us-ascii?Q?8sVubevGm1aTKLb5ouOB+MfSsqnPrZTPCE8j9YutDTIhqROdet95U5GphFgh?=
 =?us-ascii?Q?KIFPMO2vJJ5rUAddewMp0QQjyqvGeiWJT+fmIuciYlM26RB7A45x7tVGm7yd?=
 =?us-ascii?Q?mq0QqUwk3V+/webOQqDIDsfiqi0M+STPcDw7MHC2iAMDug1wN+OBfh9FxW6P?=
 =?us-ascii?Q?rw1C1GP6oVdByZHfMDSIudcu17Q5pss0Q6Dfu9BzB4DZ9WdrDRHnnb4pS4m6?=
 =?us-ascii?Q?CZR0h06b9PkQdawo422lZBdMVDXDQ556qlIFBnkXfgNn4aArqHhZLV9OE3Zq?=
 =?us-ascii?Q?mQK3UA96HXB35YmCuTYPGYSsOvzlt0wGhwtCodbcwCzM9pFNZpU4JsAEwhQd?=
 =?us-ascii?Q?h9xpkUbLS+zIZps4oLAAntKqH6Kse/P0AWNwlCSNrpFGaq/7Xk2p3egDszIr?=
 =?us-ascii?Q?HQn0ocP6zPszPZn/RVSaQwHkFiTTDo6Nr9uWe/eq0v/eGVDrSsUS/UEG6BxA?=
 =?us-ascii?Q?JugaMR3xL8m3heOVsHWywNH3GHU1Q37nijtW6xa2yB+jcNnYaVctW3a9rmwp?=
 =?us-ascii?Q?jbF7TDSoL0OcFhT+zwSaZoyQFaOGdSPpPAZp2EedfOb/NNZiJvMVcHkx+eD2?=
 =?us-ascii?Q?a6P9HX8gZVpFEI99zUhKbE1RtNr6P+RYRr9zWtnNMaJB2thAZAKBfiV2LlWc?=
 =?us-ascii?Q?FwdK6bRI2kMKYB0Cvm8fiQuyWbrExkjUzRlD9QkUgEfttbbCvOX69ThthDwP?=
 =?us-ascii?Q?b19nTPjAfkvGEZ0vTbwHqxi7SSEp7OOQHXaZoTCziwphaCrljuhPMlJDfkmh?=
 =?us-ascii?Q?4gH4MguM3LkQbrJP3Iee2tQxfwX+q/7bQWi+e7UJZIkvjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PyyxcOR8LiDaXExmNZUJ0/cJikYSrU8TUhn+9iEuGNbQNoavomV+gWxDwfsd?=
 =?us-ascii?Q?vhQ8sD9wSX6PpuvqQ4BmPNCuxt1g5RHzlGa4Fi/iZEM7alqCF0GInG1yOMDD?=
 =?us-ascii?Q?4meqZzMSUJs1tAYgJHQfs/VGsri+GZ3GzSOm1sxcwVcHRyxoiZIFa1EgtW8r?=
 =?us-ascii?Q?pEN693+x6ZripiUYRVYkupQ/n6nlgwt8/a94ayDGfSdja0PTfsVfPCs2PzNE?=
 =?us-ascii?Q?7cHUx2k2xK27mMS5Z/h/38EndJMoOiLVJA7rRux0lhX5lznCvnT9DOPa1rpO?=
 =?us-ascii?Q?TGD7OCKiT0+qZRIfzciE28x97nPP29aXo9wZvIgi1/0jiaYK/U3JoSopO8Ye?=
 =?us-ascii?Q?rS3D+NU8h1JCTNGhcyyGsrXT9U80s6GjDrevq4Z6XyLb8sopKHS/F/vFmyPY?=
 =?us-ascii?Q?hpFZ2Ikausl8e+3kcQCNeVKCanzOJFF9GEhzTs83JuJns/5ZJrM4qN6B2ksD?=
 =?us-ascii?Q?oy6kmvUhjpF7vSkjuigTNrhrEtyg5XE4BmECZ4LwbSYsUb4FTuYkuQxHEYyX?=
 =?us-ascii?Q?K4jyw0urq/rK3TMZYHBsQrQiLh2OecFpV/MnJeG301QqxvONQo2N5TOaCCyr?=
 =?us-ascii?Q?4ORhJWze5l2yQcH0xwORTrQmjrl2HlyfQCC7Hl8pmJ/bEErFB3fAvRdxwBZ5?=
 =?us-ascii?Q?2ra5rvqC+ixDOp3qi1FUO8SZ69zbTSQeXjU/Wa07+v2STcYSTK1Ua8XoeU/y?=
 =?us-ascii?Q?/dDzhPoHHlvyv2O0yvP3mpjN6LhLdeNqcyKe4NE6YUrrKipT4/aGrvoxRwJk?=
 =?us-ascii?Q?5U4OXpadVESovMufsm3i4IofMvIzJA48vcCMqeLIAc+EeuCrg6d+d/valxU3?=
 =?us-ascii?Q?kJHgGhek7UQZg68Y4B7+VO6/uErONwXWINTRLec0wOv4u9mzZ0WZwciwt5zK?=
 =?us-ascii?Q?by4ee4f8goCg+rJWj/xM9dbuw2tdZLnbh3NhLpfk9CbDsVQERwwgV0GSVnCM?=
 =?us-ascii?Q?FnYj/b5fr38WmlVO+5PqcIucvOUdcFwbmZm04Nlpeu2OXg6fUFih+qPZStFV?=
 =?us-ascii?Q?7xO+k3f6NLglRIxsQ6U5eUXHnaVSKUzYCtbiTeetqBJH2BFkVXu595IEN0cY?=
 =?us-ascii?Q?NNSjdQWSvKWqiM5P53vqQdBHtbOk1VaICUJdOXjzXLkFsAwYD6nSiU3kJqwD?=
 =?us-ascii?Q?wef0UCTCJyzJ0Wn95seRC0+DWrUBqHdVeNxiXf48FxnS99gu8MLvL/KoVzge?=
 =?us-ascii?Q?AnIIZnsL17/y1GTJc2LEecB70NhYwhtbIiA+37Ur33lGHcFQvsix1To2uwTT?=
 =?us-ascii?Q?LyS7cFz+qfvu2lQCzBGd2kGPl056goyY6X+JXlJxsroii5tLTHseMl+FTlNt?=
 =?us-ascii?Q?zaPNRAqvRF7O0ANMQYc1mgsxItY0JBe54B4IEw8SOGNE1qkiyshl6lgRJvY9?=
 =?us-ascii?Q?OW+LTJVjsu+7MXQq1+3DmSNtV9SrChr/JsKaIAZ2kJd87n9VTknKgajTUMs5?=
 =?us-ascii?Q?pEW3ptYFVsjbza5cxDIRHyJfJrQlio2OFV62hUoMjq90atze60dWKwZ3wt3v?=
 =?us-ascii?Q?9X0SS6VfQnfbVr8QoOkWoMBvoyFQcgH0LO1+pPQjUC28KTUj4N3Q6VscSvAb?=
 =?us-ascii?Q?WNfPPGr4gIrZzwf9JHCJViW8Yk+RwXcKVTMaUTldy70ia+7+2o1OW1gtdmGn?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 961aeb32-d053-4e7a-89ca-08dca04a8690
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 19:08:32.8183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrQgYvCGEauJ4S1Bfk+8iaRP6cH0UF27r+QCqV5ByDZonBkrg9NJL84AbOrA/zaI+dpVCMJd0ZHmB6bGgzhtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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

On Mon, Jul 08, 2024 at 02:29:06PM -0700, Lucas De Marchi wrote:
> Instead of keep adding more dependencies as WAs are needed in different
> places of the driver, just add a rule with all the objects so the code
> generation happens before anything else.
> 
> While at it, group lines related to wa_oob in the Makefile.
> 
> v2: Prefix $(obj) when declaring dependency
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> This v2 is now built-tested with the same container CI is using, so
> hopefully it's now compatible with make < 4.3.

with crossed fingers here and trusting more your build tests then my Makefile skills:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
>  drivers/gpu/drm/xe/Makefile | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 0eb0acc4f198..1ff9602a52f6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -12,35 +12,15 @@ subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>  subdir-ccflags-y += -I$(obj) -I$(src)
>  
>  # generated sources
> -hostprogs := xe_gen_wa_oob
>  
> +hostprogs := xe_gen_wa_oob
>  generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
> -
>  quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>        cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
> -
>  $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  		 $(src)/xe_wa_oob.rules
>  	$(call cmd,wa_oob)
>  
> -uses_generated_oob := \
> -	$(obj)/xe_ggtt.o \
> -	$(obj)/xe_device.o \
> -	$(obj)/xe_gsc.o \
> -	$(obj)/xe_gt.o \
> -	$(obj)/xe_guc.o \
> -	$(obj)/xe_guc_ads.o \
> -	$(obj)/xe_guc_pc.o \
> -	$(obj)/xe_migrate.o \
> -	$(obj)/xe_pat.o \
> -	$(obj)/xe_ring_ops.o \
> -	$(obj)/xe_vm.o \
> -	$(obj)/xe_wa.o \
> -	$(obj)/xe_ttm_stolen_mgr.o \
> -	$(obj)/display/xe_display_wa.o
> -
> -$(uses_generated_oob): $(generated_oob)
> -
>  # Please keep these build lists sorted!
>  
>  # core driver code
> @@ -324,3 +304,6 @@ quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>  	$(call if_changed_dep,hdrtest)
> +
> +uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
> +$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
> -- 
> 2.43.0
> 
