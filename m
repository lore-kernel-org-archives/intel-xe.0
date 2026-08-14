Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553AEC5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B7A10E1A8;
	Fri, 14 Aug 2026 18:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAyAG9ie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A243A10E1A8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786733046; x=1818269046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6MMDI8HqP3o6E6QVvtU+s14s/UG2CzEmikNp/ebrb0o=;
 b=UAyAG9ieYUxh7cMCgey03FE3RTm4/8zcaoSlw9jgQUWRlax5jJtlbkl3
 r/2GgH/Nga8tIO6XJAw8KfCusRyeLGj5HCdvYIJIb2KF1FkmarAaPUU9f
 hGykHkFyTLewy0npFDjU3dOiECFal2f9U4l5JvWniNcVEgxq3sjKkK9dU
 c3ct1rFBPMwRtoxT5bbnerHdetak0KxoXbxF1MfKPUIRGuZW/z6I7gvTN
 5SQUEVmf2sL0TbRtCISVSbvOPmUEcdJh3KOm4umBHAWg8ZrhLGrdL3k69
 wYmWViDnMPL7e4vKNSXcqTP6j5s/CkDYDWsJmu0/aJ/og5pTcfqNRRqBN g==;
X-CSE-ConnectionGUID: iJJcT2cEQCC0Ay8qqvAlMw==
X-CSE-MsgGUID: uWGMgdU6SlKKFynvyEx5XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87445502"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87445502"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:44:03 -0700
X-CSE-ConnectionGUID: tv+3DCLESVGcx2wLm5YW6g==
X-CSE-MsgGUID: ADBwikl3QA+3BICnMq3hIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="261652894"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:44:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:44:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:44:02 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:44:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlOqQ/eup6tOOz0jWPjSRxXa+bdUP380LQc9o8z2ElU2TjH2r3cfiAWY41WCeqxiEsCfZTMiO9OVbVOEYLGsbR0V3XqY95rQ4lF4AAOT15YxwNpWphxCjTOfd/6+pTTqxMZoysGwNWrBk4bPetCWVlzmd3Y3Wg/F5Gg9wzFfJQwVw9RAk7L0RlvXSTSpdPAu4Qicsk+9UW5ET2q7QsCmyjVzp2yjPqON+H3wfw2o4ScgOX3OWUbx3kmfaK4YfTmLcTz1NtjhO9JsSVTTUwVz1SehRfDfotGw0Qi6y9ETnJNxEI5WenVcUoSH5hgpUqOoa3m3yfzTD4Havc1imRaklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcUTqCSPo9dhpBVXSObOHGAZlihIr6KOGANthf3B+fY=;
 b=VwZqnRYynCeefRwAHK8Hg4tAvfBDsQZMTjHi056IZNpOo9qi8mnj8iZRH+yQjJ9H8LSHd9KK+bqiaZnz1jdmwOvRUysbCYSyNsKVqo+C8F+zFpZ6jcQlf7hlTrW8pAlAYZbeo0fVp5suFC70vQ2pdHqakN0+agu2dSWpdDTPUK4f0fejt5n1DE+2i9IPi/prReLpCb9J7rlii6hTwE5Bbqg9nqDpyT954vOuc4rqJo8z45pVju0KfssIm/+nuMsVRZliMIXXmkHric+G4+xC3DdbXDKX0lkgFPb1DeRWL6HARFbLz659aZTecfVaVtbP0fuuVbAQw9JC5JB1P47r4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 18:43:57 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:43:57 +0000
Date: Fri, 14 Aug 2026 14:43:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 21/33] drm/xe/survivability: Report sysfs failure in
 one place
Message-ID: <an9h6RCniyWkzmDH@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-22-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260814171801.13347-22-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: abe191f8-705a-4836-96e3-08defa33ff63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 4HaixkG6zhumu/Zkl9bm6EMWkDSwyUkgUrLYB7mKfI77QkQRn0avruynkGOqnVmxVoSqHMJjnPE0CuH7bQRjeNSUBhz6KquHZ/jicgvDATHJpW5ePcqco0/f0qDxSg536Z01cLkbZ4k4VAKX0IY3wtvU9vU5TwRw/sC+9agkkgnVSwAVi/OBN4y/pyZBQf6rthQE6h8VaCBiUrTqfjEJO9FPLlXelJjBNxZc0KhuZa8eCGa60RHKzUjFOi8Z5Nri3a67jxqQfHFXQjWPWPUK4oH7sRnSKq6bAZtrUQTjTqYzW8SKYsq4O++IiuqGiD28AO7slXPD6WZHTQtfojb++p+MrbkkFu0OKL6peHeoNJuBbGfVNgjGH3izwGRPfJyjXkZvTGG+X8u/AMUBbgTcGU/kRHtCNHU/QtNDX/rquzyusYYsDykI/8Ux9aAnWYW3vrcjOzxhGaYDoXq1XAn4cRi3HF3qVnMHWlwIznb/lTnJg2z5NJYJVoioHoJSy/u9MonKGuQDyFwBHUy1wGqB8wYZmgGeWkKIZhQkSOCmZ0fDTQYrPUYPzZ8soQV2FsZ94vqmPM1k4efxDn3wbo/hU8MTKO6pb1VuCs+yibWeE5vinsEpMxaLFmPHrH77TRRBy7x6P+2YRpd7xIFQMOJ47joyZws/xeRMV4nvFZPPTXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d9g5hNSN1iOTZAD+eY1Zb+YAimVpPpqfSYlRtgl94HbvIp6U6AngHXq5hlGE?=
 =?us-ascii?Q?YbhNA6bKp1l+v1MQnhRvmkzR0iimixOvwivipGpiSVfGVQAZPmhSYPXWk0KG?=
 =?us-ascii?Q?PQQkaP20BJZQPLb0FNP3rkWWgHULCsWvhx5n39PpnxYLflqZftNqWmhpVYty?=
 =?us-ascii?Q?4bFmEJPE2OPEEqhp4KSA63n+IcsuRgSM+xcuM9jF6IjGdjNu0pFmXX1D5RUB?=
 =?us-ascii?Q?rP3MnJ78RjvUetG+Psm4+Paa/c6zenAxaqcd/Npts0bNhsnvR/d3EIOCPmvW?=
 =?us-ascii?Q?wMfG0F1Xjb08Bm51EzRgcBWId4u5c/+iZxtbbJLANSOzhFkoim/BwW10f2fy?=
 =?us-ascii?Q?JMQRFbAP6QXoNP8FyzrF/dmqSIBgYoGQtyq+bnz66ZZWnMgRMVJwhKwdOtAz?=
 =?us-ascii?Q?KyN6/IJHogWP7Y/TCjVVqD0zdYpMgYSZD6OKWgqfwedwvNSULSNNSvXTs4TI?=
 =?us-ascii?Q?1kUAypy92iUMTakXANREVve9HVxyB3RbuPsrY4oJVBxy6gDYgXcAHfvQdVQI?=
 =?us-ascii?Q?5uyFumG0ppjuzaaBsjmw0vfv3u1jK06FxUHOw3pGPgjzXJXIZ0AnE0B3VZLo?=
 =?us-ascii?Q?l/xSTOcL0lR5kjfKNA8IJZ3uqQ9W2lOUUxWhKMPUjTLLwsrku5crY3UTlcrz?=
 =?us-ascii?Q?oNI/J5OLgpmBeZffv34vBZkAQ28JK4pASzR9J7Vs9hLj9VqWY4DNgv4LRS8G?=
 =?us-ascii?Q?kiJnFdC3FxGfOpf2PGjPJMzQGSMzanS+HEbk5t/XC0CMrbiVU/aSkbKDTW/A?=
 =?us-ascii?Q?2g93YKIKOysLL05tgKp64NpEH/jPQA/9475VybDCEHU23hQmjeBsSpvDDbtA?=
 =?us-ascii?Q?CwoLtccX7cfeXASVr5Wk7ZL9PvpE80j83n2a39VaKqPduIZrLOd7UtvO6Giv?=
 =?us-ascii?Q?RPTDefalR61ei4J0f0zb+1NIKLtEYtSdsA3lS7In5sHmOncuwFQH6R3byRMW?=
 =?us-ascii?Q?EjJXBrn1YyXS05SbEAvPkHvd3ix17+UTh1e0qOdo4+MkabKoOsWSUEycDpvd?=
 =?us-ascii?Q?zzK7bJIz9vFKmfmcpAv18ICcKvpsbvrl1UrgBnvFzpg8PiaQcPA1y4wahUv5?=
 =?us-ascii?Q?KMIEAhoifwXIU6usawZPXsqwdIqNTn3VQR7NcNuTp7P2xjfUxmHEl0BbuI3w?=
 =?us-ascii?Q?b2Oa5cW4c1hsdBR5+Clkq6R2Xi4PbJMbHdQcixEXVbsIpfVHayu/qcf1B0mZ?=
 =?us-ascii?Q?YldwEBwmMopskJw3TeyxxXFoTIcL0uyXq4bTAStZq8M2Ct5sc3wyEy6JHxKl?=
 =?us-ascii?Q?E4JBS9GccQlqc6pFlbrkjS3ow0jHRvl9uVoe/3h5WQVfF9siFjc4H8njjPKm?=
 =?us-ascii?Q?181sVA03wymhu4JZQ4vj+4U5DWahaXAN8bxxI3bXLkpGmo7aBYuCwRpvYXDb?=
 =?us-ascii?Q?QeIhjhDTbBQK8O4aS3St0ynWcUrsi9L48nnLESa+BKqSQznmYWZ1LXw+Y52l?=
 =?us-ascii?Q?VlQaiRhg1laCCxTEyIPDf2aUMW5gSvRPye0/pJMkYYvL/V/8pjYUl/mVCMWZ?=
 =?us-ascii?Q?EZRv3qhKvhgfmnTUHCe/HSqxKLJBF5auG8UpaJx1sdD21EDdPrcIVevzvljX?=
 =?us-ascii?Q?29owKYLGXGojRLrX3YNAV/Mwg1rRxYgdZj1HbDgsF+j/BarPCylMHM8M88PJ?=
 =?us-ascii?Q?w24eMdPFVWECt3aLt8cTLOIMn901/jrAajqit6EjgsgOoXfQuB2McPoJMurl?=
 =?us-ascii?Q?7d3q53pkrd0dHo1IgZqgNm997Si7U1cwPfsIlD/VGIpcHIueV81Ca5l4fwcY?=
 =?us-ascii?Q?1jxBOdi90w=3D=3D?=
X-Exchange-RoutingPolicyChecked: jyIjrI70k08nXMepmSyW0hsVT3J9JYe8Svho6VjzqYGcEFUSlYdI6l5uXYO4Alg3kt4+sPK2b1UECkTUFMf1RwAZHQrMbc09s9P/v2jd/TmFeDNVcUp/Mi7nKMgi29FxA3Z4U9KX4x/3RHRzxdPNhgy7odPuhYHlcMcpWT25Vdd2cti+8g09hZ2UGrIO0l+AgFkY+KQRXhnCB3BvL2bLZRswjZiW7CejNEltFZn2LGe9YlSqmgyS7hZM5QStizLJpZswOVxeGapE9aNgAdOGwViXvFzBwEwVbz02mGQCY2fqR4prsrTyGW4rtJIRX2oCqFnOL5oQWtrBIANvmkrTJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: abe191f8-705a-4836-96e3-08defa33ff63
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:43:57.0634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIK51xRk6/JcZeamOBWxTQJ8hNPyWVhZUK3ffuOkXkzRY1ZAVFddpM76sP2bClXngdpypaWh2fhVU3o0+mJq7g==
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

On Fri, Aug 14, 2026 at 07:17:47PM +0200, Michal Wajdeczko wrote:
> If we fail to create any of the survivability sysfs files, actual
> error is reported by the caller. Move that reporting to sysfs helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: don't use SIGID (Riana)
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 0ace10ae500a..8b74bbc96390 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -18,6 +18,7 @@
>  #include "xe_mmio.h"
>  #include "xe_nvm.h"
>  #include "xe_pcode_api.h"
> +#include "xe_printk.h"
>  #include "xe_vsec.h"
>  
>  /**
> @@ -309,24 +310,26 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>  	int ret;
>  
>  	ret = device_create_file(dev, &dev_attr_survivability_mode);
> -	if (ret) {
> -		dev_warn(dev, "Failed to create survivability sysfs files\n");
> -		return ret;
> -	}
> +	if (ret)
> +		goto failed;
>  
>  	ret = devm_add_action_or_reset(xe->drm.dev,
>  				       xe_survivability_mode_fini, xe);
>  	if (ret)
> -		return ret;
> +		goto failed;
>  
>  	/* Survivability info is not required if enabled via configfs */
>  	if (!xe_configfs_get_survivability_mode(pdev)) {
>  		ret = devm_device_add_group(dev, &survivability_info_group);
>  		if (ret)
> -			return ret;
> +			goto failed;
>  	}
>  
>  	return 0;
> +
> +failed:
> +	xe_err(xe, "Failed to create survivability sysfs files: %pe\n", ERR_PTR(ret));
> +	return ret;
>  }
>  
>  static int enable_boot_survivability_mode(struct pci_dev *pdev)
> @@ -432,9 +435,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  	}
>  
>  	populate_survivability_info(xe);
> -
> -	if (create_survivability_sysfs(pdev))
> -		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
> +	create_survivability_sysfs(pdev);
>  
>  	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>  	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
> -- 
> 2.47.1
> 


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
