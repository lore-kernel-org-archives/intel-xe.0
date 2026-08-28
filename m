Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B86DC61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F0010E14B;
	Fri, 28 Aug 2026 15:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9/wMQUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C2610E286
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930458; x=1819466458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ygBOAPQ2aX00jLT20PEQkGMT3yNBxd2JVpSekqWyZNQ=;
 b=Q9/wMQUNJY1zMI5QkCOkCwpL7qUZTNdvPsS0pWiUozDtyswn/dbgvXFZ
 yR2FUTva9mcpXPWpKuUDjO8QyMzBiNo5VWix1wz4HMaNwAmOde+Z8Jbqk
 2M6vTOGIJbMrblwXephsw/z4hNDf5Bp8e5uHSkYozxKCrz+ZhcrcuJasP
 aepZSKK4R2n1hd6kKZTVDC6rN7UhMhvWTzwjFJwWeKcXsMVRBBPoP93T+
 4oXBAotGknE9URDk3K5Ze4xE+8ugubdk/L1PMKryQ817AYERFbLXU7JKh
 tGMzkxot65NV80/ShaV2hapyqa449Lv1OEftSutG4+fB2vg4PmSeD/e/l A==;
X-CSE-ConnectionGUID: wIGx9kVQQCmYpxK6hkMcAQ==
X-CSE-MsgGUID: 5qoKNbS1RpKN2PmC300irQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="113976206"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="113976206"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:20:57 -0700
X-CSE-ConnectionGUID: WZFoM7EGT1uTRTNiomEhVA==
X-CSE-MsgGUID: KVpFl5QvQ+yYGRCG1MVQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="270129897"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:20:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:20:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:20:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.68)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyTI4zCd2ROmSEcVyIBU9B8dGR5OHXYWr1OkmfTQm0EYCun5en9uhYyg2TYOy7z+vApoLP85mKuk1JE8/4U7DhhIWRk0Uoc2UR3Wyvfb0NFRCFXQ891dkq1p7v+0lzYBF0u6sn4E4R8XPfjLh4QPmZdZ+LnvwNxlaSlIdQ10yjkoKpwefaYkG1CO1BzpWm3HLx0aR5nzQdHpr1jFPvFXtyvbva7O+nQ8GKhKo7xehGtFrdP4EoE6UlnMgwYe/nSNSyKFM7ydJ2tN5ce2JnsGkNME/Wmm7dF9i2GS1cOLIMe0KJrv1N3K34ZQK7Yy3YVpLILgF1B4Bv/VJBL+4+y4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B70y1z7fS2+dM+5iClyT76o+VTF2tS/1svQemtKRiIA=;
 b=seuYDspOvKnqVH5KOg+gI78Xv4DjYC77/WWZI3efUZxioGkbh4CmHDxIcrTE+uxf0uR2CsCNAHRLNnUNeZF77BMVvWgA3l34Gr4AfKLBLDP2TT2p6JZZU503M6LJXAtcND8tXgMeDIg2wey6vZF/P4X2E3l27Ib0izM5DVmd040QfyR0t0B2H9FoMhg+PWNbVmfaMh4UZBWUtAa8wUsqgmhLRqqaT7HPQP40YczwNfkR4/L+ceCl4dQitNfxZVeeEuyrg+6X3R3p2Ykmd+PpYA3Lk7RbnRm8Shb84tBnfw6wJUeL3p0utd2b+rrhejf96R8CGFj295/wH6s1HMeTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH2PR11MB8779.namprd11.prod.outlook.com (2603:10b6:610:285::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Fri, 28 Aug
 2026 15:20:46 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:20:46 +0000
Date: Fri, 28 Aug 2026 11:20:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <michal.wajdeczko@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>
Subject: Re: [PATCH v2 10/11] drm/xe/ras: Report soc internal errors using
 SIGID
Message-ID: <apGnSZrLVbtbTa0Z@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-23-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260825175916.1103841-23-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH2PR11MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 43abd8ce-f04f-43a5-c6cf-08df0517ef0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: MApXuysEdMRD5W9eWFs0Cg99RTCG0aPQgewBZzNEmZClc/QdWsh9S2mZ7I/FHPMznzKQ2t+ALvNjWBjWpF34xK2D0ygJrBIfLf8RNjrROxVhEj3yxvuJe8JzAwPJlKLa7IyHrlV2E+lHac/pykeZ8bsUZy1qEcOMlG7+U2teFnlZwYEnFDGUA/2dudTJlibhTfCnQN6FRcDetdPHNqvfoWShq4nBm3se7fFKHoFannnIVFaYtD/G/VKuIVnhl1AqB4AcK4PNiaWGN+KztHZZ48dtt7bHO+UexphFGkUdO66thqDQpFGF/ME30aQmT1zf3QN3ao1kIkSkLdiRjq6CI/L1GlfKWmO+cpNxdv2k1D7FXT9Z7/Zf4y6pLJqfpy9/0Vvff4LDkWw5PySRfpjD3XQATDndgnOOhKS7DfdzpZbqONVXNbxyaqbqvAEwKYoVoS77xRLzzHP3jjFJe4UTV03bSDpntjzrPHRTtBBdijUXkhxgCqb0pON24lIzGCg55ND5k73yD1gvsbInPBhp0u9ccl2m+C3BNuwTUIsjiuB3ZSzg7pDYZ+u0Li7ngbpyXQJEUctSushaqhdEI9P0TElGlu/4g6TRcET7lTaxKJJboz8geucnfLa6HNiWj8QJ5iySo70qmJX1mmeskW+XtthrFlaKgZVvWnKzdmtGZVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LLpaUZH4BniNdLFevFn0DXBzIJxPt+feYyqkTkQBDX87e23R8/t9NiKfMnMy?=
 =?us-ascii?Q?T39+3Yo3th32xYhQFQrHD1i/dzHSsJz0kAfQXsO3Aj2IkxWzZEVqNd4XKDmj?=
 =?us-ascii?Q?er3MP0TOtKBy0+oDLE78dLUNMTDEAgMNqahwrtUlt8wdHo+Lkgwui+m0kkkj?=
 =?us-ascii?Q?ldY177sZo26ejRiOqILw4RnA8xVbGmwCOaVvi8OvmOmTLAfuEJCEKdwxFSkc?=
 =?us-ascii?Q?gFbaEf3VP7LzDfc6iQG9U7sK+M3Ys/ds9dRJ0XoQ7lNfm6h/7uvZhoX8HBDO?=
 =?us-ascii?Q?HltP9Y4HDqMHmq+B2uZLuapVufCtJLpgHuTsW8lznLwxdf9ZpHN4IuepMsW2?=
 =?us-ascii?Q?jF98S4BSN/hj74jBLAApayQ8DenIRBpL/OFVi1RD4rUCJe88m7+G2ZUPsffw?=
 =?us-ascii?Q?p+2cMbR5eP0iBeciGJ6g1T5ZnSMp0Y4iGJlI5VP4jvVnwzz6RNxwb/R2Kh5t?=
 =?us-ascii?Q?CG2BvjSAJ35hxpoTRTqXuoyD+U9aMfjeiAp3ORB6rZVJU7rXxGeKh+qs4EnO?=
 =?us-ascii?Q?chC2JnB5cpHCrQAx4lR8xF5KPEff9O1kfSzyshYme0TNTQ0eqidbXkWiHWdg?=
 =?us-ascii?Q?F6kxVvOMjNQHL+26SI8xnf9KyxODP/dl3s5NEO408o3NNCiFhX+IYQkH/Yx2?=
 =?us-ascii?Q?A6NI9bPRWKMWzYDlSDl4uRxAe6cpyVv64pZCTzgt9IWfDsEAu/FuZVWr5ucM?=
 =?us-ascii?Q?VJDWVulwc99liVTZ/VolXng7kPDsRAJxqNBregEUBN7hQZUXGWCmy/ezHkoB?=
 =?us-ascii?Q?uE71RXLD37Kd6lJIpa2meEVHPfoUMTP4AEZA7d7vQEvbud9OaRiQty0Q3F4p?=
 =?us-ascii?Q?p9/lL5KD/E13KF16vu9eRa4vS8HK2wlLVcJcgTmj45WP6v7Bb+CRT8QhGxhS?=
 =?us-ascii?Q?2dVyiK1Q6F58MIGlyuEU1vMriHcyShben/N6J7bFqZiDZ7u0+kpz6cXiQnfH?=
 =?us-ascii?Q?knW+mzoPNEQ684zXc/OFSc/dYRc+YqcBNdoRsX/N0ptbff5CN9VB82aljl2Y?=
 =?us-ascii?Q?lXZdi+1KgAYUx4WhEJJUyhbwEKriAijQcSzJeFhNQwgUmFN3X295Crx6r6+K?=
 =?us-ascii?Q?GlUXOPK3l7CuNF/0GfFP9X9D4plLEIp6mFoFbyJPJfyN3k03UwGVWcws+LUT?=
 =?us-ascii?Q?+4vi7F9RfFdjs2DO9zjS/XOZaYBzLBrwHfu6euewX9Nxi5TQpblx0AOOOT5K?=
 =?us-ascii?Q?8V6xVky7r3RxOsGfi65wJ93rsDucD/P4Vk9lOyjrVUIEGt0Tmmf+SdE3A7SX?=
 =?us-ascii?Q?UXKy6j5mb5qNB0NsBOlCRBdqxT4wUr0OzlIHOnlPNZauikl6Lo87rGOLGtW2?=
 =?us-ascii?Q?mB07uyZQJqmauaT0MgBZPs5EyWVPDlaWKv786bCn33VUSIf3mErW9gN04W+s?=
 =?us-ascii?Q?0lWIBYqTFkLML/4dgFNcLvYT5h2FsJArCL4kqS2Gn+bKVAK0/+VP2gaEpDae?=
 =?us-ascii?Q?ydlaGXFsjNmu9qeGcMJtHmJ8heU51S6rby1zrZOcZNhhXc8FQI2jCy/qoYc0?=
 =?us-ascii?Q?Q5wu43VIO6RiHnMIOTj7beaMc8b3gf/hs9cWA66gWLesJKF8cAiPMaeb6rTg?=
 =?us-ascii?Q?Rm132bzVvzDi8U3YTyEPDSXdHiR1rpAU1n56mGD/HZDZTRIb33b+6q8nng+J?=
 =?us-ascii?Q?L7bbHlmUGmquUToq4kvjr3wqHxJq/Tsj1+EnkyWN1nyjV3OFrCMQqA4uabr6?=
 =?us-ascii?Q?eO7WNZKfEXyYct4iQcjGW87Zbszxy4QeBPjKKBFC7OY7lp2rF0bHpz0wbXcv?=
 =?us-ascii?Q?uiSIP44gRQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: AjdU59loEd83IrqISegzGzVbviJ0XdhKsSUENzLnx4w7/z8jOTTtUx7NWlz6yD6JQ76HWG4ngrGNgE6R2m2cMSQYm+h9OkcR9+oa+p5ls3T+TFZkaO6CNRK9zOVIYpcKUT/aU6y/eSqvuSSgekR7x8gmx8GxjtfFLttRx1pSwIU+fMdIb9T1Os8bom3au2u/2e+83Jncu8NR7teFSvN+23ENa2AMO5oRkRpOQG/3irOYHXs57iAXq/EEjBqqiymATngBEzvJO0bVAjuHw8l44qlqGCqd00J9U3NQzPHxAgsxBVFP7d8pAekgSpGDBwzojALlWG2kUkylsN9kOWvA+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43abd8ce-f04f-43a5-c6cf-08df0517ef0d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:20:46.5323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gem7n78qcPkYKtwWFjHPXbd6dldJJzWTLiM34UymrO+pptT8fHBjO8PsTLvk2IS1S1aKfBRvXffCNNo5xzClQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8779
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

On Tue, Aug 25, 2026 at 11:29:27PM +0530, Badal Nilawar wrote:
> Use xe_log_* helpers to report soc internal errors.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 3b43d363d5de..4cd1d5eb75f4 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -365,7 +365,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  {
>  	struct xe_ras_soc_error *info = (void *)arr->details;
>  	struct xe_ras_soc_error_source *source = &info->source;
> -	struct xe_ras_error_class *counter = &arr->counter;
>  
>  	if (source->csc) {
>  		struct xe_ras_csc_error *csc_error = (void *)info->details;
> @@ -379,19 +378,18 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  		 * is required.
>  		 */
>  		if (csc_error->hec_fw_error) {
> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       csc_error->hec_fw_error);
> -			xe_survivability_mode_runtime_enable(xe);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "CSC error detected: 0x%x\n", csc_error->hec_fw_error);
> +		xe_survivability_mode_runtime_enable(xe);

please fix the identation here, this survivability line change cannot appear in the
patch.

with that fixed: Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>  		}
>  	} else if (source->ieh) {
>  		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
>  
>  		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> -			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       ieh_error->global_error_status);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "PUNIT error detected: 0x%x\n",
> +					  ieh_error->global_error_status);
>  			punit_error_handler(xe);
>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>  		}
> -- 
> 2.54.0
> 
