Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DFCC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABC510E1A8;
	Fri, 14 Aug 2026 18:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQ3WJTjk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C196C10E1A8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786732926; x=1818268926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1pqJCExLkgDhEsdp5dQk19ubDDVfzezCgCkwwmpMO3I=;
 b=HQ3WJTjkpxU4f8nAN5I4Nsnl52fUzmsDUt5KMkp5GeS+zokftmgwmFZO
 sQDNdOWbFiPBSceX3aGdQ2dAAenuWhcvIx9Kn427zDLdpI5MRR0Gc0OuQ
 ZAGu0FRoNZnssSAIu+z6BaPn09OVoshtvgcqRrm9wGcFc8ymxYQYdQqIA
 eQCsq5gJYxQTM+2OEpkDuRhYiJAr0JDLJyquntAsft12ErE4NYkm7KDSY
 hfRKBHvuyEDQOTU3fLfXJeBFSv3ean3lkTMIpvDrqnalrXsDNz6+HgiEH
 bdOmoyjJ1Sibc92iK/BiisK3vtDeVVkZoQnKJye4iDrdH3JUCzNi2SZz/ w==;
X-CSE-ConnectionGUID: qIyK6nzuTeuBwrgZsGukkA==
X-CSE-MsgGUID: tuqhpzFPT7+zYPy3uIn+ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97904694"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97904694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:41:58 -0700
X-CSE-ConnectionGUID: aEYKA04sQeKCWLhf+6M4BQ==
X-CSE-MsgGUID: 5r1e0l2BQOCamgNfy7qt7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="264912758"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:41:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:41:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:41:57 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk0HWUeIbPizzaItQHXfZeG+4uPLZGCdHuhSf/tiN1vK8agat4cEh4yYfNnpSugRcZA8jpedXr4TmZXOSsG6iQB+45ud7kRz9QQhyO9LJjHHMF4fAhh2/QQqHi+o+vXgl1POUN1rUr+xGuNQ0Gr3kZqrDLcdlzOte53tTrmwDfZuqAtPy2ZhTeqSH6L0KHe354vrSppnWo0wKW+EKUyew3+SeU7lONF7IJEpC+r2133nUjoHbi4KC2FlpYvCk1esc6IHxNzHwBcIqJVLTPYqKZeEjipe0Voaun3gjl3TD6fV/Xx83nRTKivv29oeqnIoE8+fijMO1gdrcjWBNvS2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoxOj9Zp5kTy6FenFlIzfdUwdsdnDlt21ST77IhY0M4=;
 b=cGbLNSm47u/gwa3Pmdo/HuEG3YlhWLaKUpbje/zstPTZ/BZRqIVfDiVxMcDpT/Y+rsvZXqsEDHPfkXRpR4CZVVBZ+/EvGq+T0DnDF/uIRcx6fTRBseWROQ1XPNup6ztYtT5NzeYZ2II83itGbjQAEQPF12KV78WXiQnzFmCIYCIKf2GKw3Tz8vFy2D10eGgVwzvI4l/+lygXY8lN0971JFCjYZmUchfUH0MyxY13TWXOLgkd7HmuFN8oUlFihB8dFwIkNNWSamt/z1BLUZeG/Nr9VhqTocLmLHIgYSUYbQPG2V7lk51fip+ajO2QKBSaLZ8GNE41Dhsrv7bD7j/SZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 18:41:44 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:41:43 +0000
Date: Fri, 14 Aug 2026 14:41:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 20/33] drm/xe/survivability: Report 'boot status'
 using SIGID
Message-ID: <an9hZLBIjLr4kT6F@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-21-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260814171801.13347-21-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: ef086d82-6175-4946-0474-08defa33b00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: v7HtCYowkhXNk2jA7jdFVe3HMycWGSEtZPuOZuEAR+66JbFUyHus6R9qMjAJk+uvBHlJoHDsEFQbH0SssyvtvKjcL0wAgUcdoHzmAGlwJGIteGJW4iYbVZPYlsAQEIuoeg+xl5fA54KsmI4CjzfYZz42ZQ9jwARlzTrsYLl6SOZpifd8ivyFZAqTJnp5QwRTNxyFx6aDuug2oMcPgBny74ijV4RaSlP7vwrVFhn0SsHKUrV+SM/AmX/HSZJtlh3q4bw04LdyFVQoC8ycyD9dggV5rVS+39xP26ZyQnjonos4D36MV6N7HKTZBwXw0iJDyO04fuEyA50LKvSR1l6LnwwB72g4vj3sBxIREqy3RIV3f+UEqHq3grhhipoSw3b3wOj2M93/U4MLpMWtMgRFFguXSDPsO6NoSGEBDBW8cAGRBjUIPEXrI/n6P6B5mpx+/JGPSfj2hdqWZ9SrqJv2Y1fM4TinlTNOBhaXLgv542zmd8iWpl8+B7P+LkCcRZg389tFU+Kh0xhnNaUF+mJvY/xZ72ITpfCEgEo+VCHwNy78lQYYZau0I8QoFzGWg4kNucCg2ATJs2K4R/hoFXSRB5Y6BzmIgDjtPDDdwYRAfiINaSXQ3Jf0GgkficRiySE/WHKcyS/7Ph6fb/O/eXoZqHKfXd6501m8OoCDxApdw2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UHNL8giexUjUzoHSesVMlQzfupInjGEguZkdtDJX5xGctPTunknNsmhvhKZ+?=
 =?us-ascii?Q?tM3w4HXdQlulBvoT6RNGHnPBeCmhktz8srXTVaOPRwFBLWNzwTX9pe96+N46?=
 =?us-ascii?Q?+V8BXFVg5p89K/qUiSZ5hcFD+DTE8/XS4p/5UTYkpf1bA4eM2QcD6VHnRVyy?=
 =?us-ascii?Q?f74m8E5rUvcZOf3HnIVJUQ/nIal+vjmo3WQwsRpb/EN0Bv9BjRXWxh3fTcXs?=
 =?us-ascii?Q?2y4SQ5qHtYUK+eLVIyKv8JtMFFcNU75Q0t/JaXKrPByfkSnYsTowHPLOOev0?=
 =?us-ascii?Q?ByDVfP77LixhLgIcXdgxZtIx7FTanWCqaDk+vRJANLb0pUzCPFgiyTYDtVEX?=
 =?us-ascii?Q?V8xUM724Mzdec1X2aZnpY0Z61IS1uy2L/hpqYDVoPrAaZ6RDAi5uQzEU1PZn?=
 =?us-ascii?Q?a6a/rUCuqDb6b11nbyko0nMzUHh6X8fHrcH16fkHB9NJdwI4qbJ52kJhvfgS?=
 =?us-ascii?Q?RJtfJ1AGPkYKquThEDcqX12N4YHxFO/dmlymCs2IuOun/xGCQllbrMjtVqSD?=
 =?us-ascii?Q?EA8M2R+Rat0jqXPJE6Lr5QBuFRIVY95onV9DPXidSb0uIEDeHWyo15igtOJT?=
 =?us-ascii?Q?zfHkLYTgm0JOR0oN7qs5SbIu6B3fi5fcK4Raz0sWdssSzY6o8hodjYyFYgeP?=
 =?us-ascii?Q?haTVgW4NYQ6+HH8VAK9IG3ZSdMJKQ9dczgcdjXujpM4Mld2fJOfgOlC8IW8Q?=
 =?us-ascii?Q?Jzwsxf9p/EBkiG55k72S3Jn0dop1J/k3EaarOl//gJbwWfpQyqmFXlNeWFTr?=
 =?us-ascii?Q?apFJGpCHhb1HezXqXPdMxNft/DFn93/xgEZYtSfbyfwzGkYRe+L3chCUCpZa?=
 =?us-ascii?Q?wUDqV1sauBK1d8U5YR/mzOiCYoPcWn6ntNlrG8VVP0Z6SQYCjPCRDi/bkffo?=
 =?us-ascii?Q?f/9o+nyPJY99fL/6pzNl6EZklR8dsgwoLk0p7ykkjD8JQKj7DHKid0UdlO5a?=
 =?us-ascii?Q?3MwHA3O2dv1GyaOrTUuEGGM9FVgwJ6OngJShi1L+kjZwuB0/rIydJMkNpLfV?=
 =?us-ascii?Q?U9JIiHnkoUBiR9YCQKlV/IFpxyuNjUyZmyou/8LQUB9uL4kqjLnyRfnb24CB?=
 =?us-ascii?Q?Ast25fLGuBd+1kHnxngdWJ/Ge4QexQMLOGh5jRCnKgaZePEzE1EbndILamZ8?=
 =?us-ascii?Q?kSR8s5jDBPZhDSdaCAN3Q8ESqNcmaNFx6akPYSvVO/FsbyOR2HpzeiQj86OD?=
 =?us-ascii?Q?FND1ZWzQy36yh9JaqaIEC840aYB1jC02OtjDhxJ+tvBBHRXhqpPTUBiVfGVO?=
 =?us-ascii?Q?UBM4VTO+XpnHBWB2UJJ+w+5CUvQ4sadTJILNs0t06VOa0aAOeWgYHlMugzwZ?=
 =?us-ascii?Q?IIIA3moUCTRpGIztLa12GjCbPMA3aYGADvDMTE3IrQjuoipnUZSpSgq8hk/+?=
 =?us-ascii?Q?bvpaZwqtzPsZJ6J7bYp5B6KR1hoWclgKsYY5iiozqI6A7odbKu0BvoZwavuH?=
 =?us-ascii?Q?RGXs4kRt/1DDXNN1zhkvVUnqL9ad7JCPtqEqCP8a+xXG7fc+hy9KLc2UrZEI?=
 =?us-ascii?Q?wGvYwMmx5RuAemhjf/Jc8f+b2HmVCPlZQDGnYSawgdStxxxsiuYQh92g4JRB?=
 =?us-ascii?Q?PgDxiE2cEt692M6EIdLiqCQo8Cac3ChmAOnLHWB9eNNFVcOcAFQI+2pLSPyl?=
 =?us-ascii?Q?DxYAf8SZQoUYbzVo6WPqB/QrwBhWdT/LTIUEourRG888TkEeJFbyQ3pzGANQ?=
 =?us-ascii?Q?2v9/ijrce8qzNx7ZTlYF/G/WYrKt/JjJSHZchmJ+pR1Y+Kp2/3bbHD53mbYF?=
 =?us-ascii?Q?IQSUFgoUyA=3D=3D?=
X-Exchange-RoutingPolicyChecked: hOTfC/qi+i88Mm0f6jw4l/eWfJE/53daO9rQPj0AZshh0TrumQjDOk/YK1LKelOuy0Tk8QFhlAxduBTvhZMU+esxCsen0lExEa4WJRNs4wR7UNuLMikF3Pi1TnPlpyOEsS6F5T8i7rC6rlHxKI2rA4hIv5JeZDWySbR6+HJTHSnwzYQJflXW1OMytErpHDjD3WHEU6urLvkIZgmyRcuuF9x2cyRU34nuv4zTMuEchcFDebP13MPjKgPKX8zNbxFwJ+BbMvl6FwSaY+4+KdJyQCeaZ5qzBY8izbG0Jj/qEn1o94xdFQQ21cyfAeBdBspbXHK63y7BTriNLmZ1Dm+0UA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef086d82-6175-4946-0474-08defa33b00a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:41:43.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFeJuXF1KhVD0mvXDdtPqLhbZ0OO03aaCYbaA4VL9Ky9JHTlL4YHzOtE4lj9Bw9JYKRGP+nmtU9I3XylQr4YUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
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

On Fri, Aug 14, 2026 at 07:17:46PM +0200, Michal Wajdeczko wrote:
> Report 'boot status' and other scratch registers details using
> the xe_log_info() macros. While around, add helper to decode
> boot status code and change pdev parameter to xe.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> #v1
> ---
> v2: make helper more even flexible (Michal)


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 29 ++++++++++++++++------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 4c506027fa94..0ace10ae500a 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -14,6 +14,7 @@
>  #include "xe_device.h"
>  #include "xe_heci_gsc.h"
>  #include "xe_i2c.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_nvm.h"
>  #include "xe_pcode_api.h"
> @@ -172,18 +173,32 @@ static void populate_survivability_info(struct xe_device *xe)
>  	}
>  }
>  
> -static void log_survivability_info(struct pci_dev *pdev)
> +static const char *boot_status_str(u8 boot_status)
> +{
> +	switch (boot_status) {
> +	case CRITICAL_FAILURE:
> +		return "Critical Failure";
> +	case NON_CRITICAL_FAILURE:
> +		return "Non Critical Failure";
> +	default:
> +		return "Other";
> +	}
> +}
> +
> +static void log_survivability_info(struct xe_device *xe)
>  {
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	struct xe_survivability *survivability = &xe->survivability;
>  	u32 *info = survivability->info;
>  	int id;
>  
> -	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
> -		 survivability->boot_status);
> +	xe_log_info(xe, SURVIVABILITY, "Boot Status: %#x (%s)\n",
> +		    survivability->boot_status,
> +		    boot_status_str(survivability->boot_status));
> +
>  	for (id = 0; id < MAX_SCRATCH_REG; id++) {
> -		if (info[id])
> -			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
> +		if (!info[id])
> +			continue;
> +		xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
>  	}
>  }
>  
> @@ -452,7 +467,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>  	 * v2 supports survivability mode for critical errors
>  	 */
>  	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
> -		log_survivability_info(pdev);
> +		log_survivability_info(xe);
>  		return -ENXIO;
>  	}
>  
> -- 
> 2.47.1
> 
