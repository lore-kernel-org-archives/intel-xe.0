Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3908CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 14:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CAD10E1D3;
	Thu, 18 Sep 2025 14:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZEIylB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0BE10E1D3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758205930; x=1789741930;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wHZxxuWw0o4xFpAeGdhGidcHYjbTAbu0QrpBbrL2+Co=;
 b=nZEIylB5TBrDXLbQ/Bvu44TR02iRPfTxtaTkA4peHJGYiLv+xK4Yu/tM
 /xrjnpE5RLgI24kzQ4xaKLuCOQy3w4+Nh/hWTGf00s1gyRr6L230W9Ccr
 Ru0RkXAwKqhiW+REnsU1zjMgrXPmo33sDCXJjY/3/OlKpUIjGbU2NFQIx
 ZtYjSgDBwJmurzokM0vXS2Yzl10LEgP512eUGIQWSy2AiylTsrGUcGi72
 GJKFW9Fp8AE/HKzxwr6DUaoCPFql5kpoiOGPWW0PWKJ90uBKzwfgFszyD
 RJ/qg4r4kxPKpjTcSQshbyzmJxlC1SI2ZREYgfbu4FOVK/UByCroXnxzO w==;
X-CSE-ConnectionGUID: lfs3jDI2SfSRatZ30JhP5Q==
X-CSE-MsgGUID: lYGfMVTUTnuJO7AJmbb5BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78138678"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="78138678"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:32:07 -0700
X-CSE-ConnectionGUID: zt7P5WF/S56VpxTnYVFYTA==
X-CSE-MsgGUID: ANy4bcShRhKvzP42ggHRkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="206509555"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:32:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 07:32:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 07:32:06 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 07:32:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+syqh5+HO3fJWb/wEVWzOTzipKZrwRruF5HKmQPZUeSlhiYWHrPaglDz56veMVLRqJR7DFIPGPdzy6/w0c2uDRMv8rGraBB/uQ7TQK9MmVR0kL5XNS4w6oq3Rv2u1tkRHXJOq8sn1R3dEou5i0QyXBhs/Tq5V9Iq6SK6Dmnl0sD4Lc9Oc8CP2zbDAH+2zJKbeg7bx+4eD0gui9kstWKZBJ5F5Ls5q0o0AQEFThXQSwYUMm+mtCkXFnVgw324YQ2WEHeHbbK6otd7g/YA+u/08KU8iZhWvD5Sa43tRB1HYCbOZNUW2oxPcBcGj+MnRBAl6FF2bCc9pGBcT9fUWsjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STYmchxFzKv3XTcC2lw1wlAgpQoRcC0GsaXMV7prCWs=;
 b=oExDhpi88jBpjzgkI0ppxZFYP1G/O6LfwkOu9gg329Oq9lpzfTUelZGo/w78J5xI2G2PlbHCe2jo+e/e1Wn8tJlDw2t6sxTgjbnc4MxVjqDfa2BLQJogpjrWZYGXIwzR2gVU0RoI3wZlaJDHqqm59w5qapT/DO57koY7tyCQQ9VpgO+Rd6pAgwsjeaxWiTIEobl5nF1aGaHtCxIxVo+0u4Rp6SD4znLqBzfeY4LJUFqF5n9T9Il7KRiaKCm6N6tWQ+EqOXLnFHFj8ma96lyxnNBsH8KWR731RqdNVct+vptimDiMlIqkJfliNK6dRwzP4895JMa6nJmXYLEbDAs/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW3PR11MB4618.namprd11.prod.outlook.com (2603:10b6:303:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 14:32:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 14:32:03 +0000
Date: Thu, 18 Sep 2025 10:31:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe/sysfs: Drop redundant runtime PM usage
Message-ID: <aMwX3xgNcmLa_6C0@intel.com>
References: <20250918114804.2957177-1-raag.jadav@intel.com>
 <20250918114804.2957177-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918114804.2957177-3-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW3PR11MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: bd81027d-c4ec-4174-b8d8-08ddf6c022b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XylCdgy+SGPK+hRId9heG94vO94Kc+GAZSn2LOCyRXg2NXOw2fV1iuK2TrQi?=
 =?us-ascii?Q?6ObsX18FqzLAZrxl3tKanxC9SyjtM6yPwWPMRc78+Iqn6r70WC/xKikNxF0u?=
 =?us-ascii?Q?/PjzmcKgtWGM4KUhUtM9KClsiDSu1h3/Ii75BLiZ+Q+eDhm4q6qJf3ia3KrQ?=
 =?us-ascii?Q?V7JbTzCKFaO/sS1NFFBY3lUKTwQcXSPHv2eDKeRM3howaH2q70BM0y0Z1wqd?=
 =?us-ascii?Q?HAlAF3CbXcUXRC3eMnvTZkVVLq1xi1aR8pFZllq+y9hnmVn4xuu6tm5vyWA4?=
 =?us-ascii?Q?blEwk759cOiPkgZUvNlVNiAKADK2y5wq7shLjq5aOrPvlxOrfwhLTbc5hiwz?=
 =?us-ascii?Q?K8izii5O6ahnbQNvb6A6x3g/Ir1a5hhuShhvAYE1QpYaLym3xJ6F8Qz+FMTd?=
 =?us-ascii?Q?DhSUO6IKJe/NVnjzUhiMbBgapOFxcXaXSpJgR2w/b1gXcDEMw4d50TJXynk4?=
 =?us-ascii?Q?lwKOy3P5/2MRz9EWQsFVHm1bFDlfmjee/kshpiXeoIOZjVmei06OZ0CkvzEP?=
 =?us-ascii?Q?1zQ8Q6N72NPEcca2FmfdmY8Rx1Lel0N2eKuXvJGvI0PzVsleHMmCH2AVBqdh?=
 =?us-ascii?Q?jCZmMTM0nPPgv4MKLBGUm0R9WgUCXgY1d8s3kK5GCW32CTjwm/LcrspxL5Bh?=
 =?us-ascii?Q?kBv1dFhUf3T0eZoJPP9Dhr2a7Ar5q7uNL8WGNcRT8H6V2iuRmcauFCwoSXnh?=
 =?us-ascii?Q?aECZiXQsQJtipGXYgplGs++KGCGIm+6+yQFyx1fhxOhrh/Qggu81ebywZ5FZ?=
 =?us-ascii?Q?sdQm1aOv2uQnU1ZaJ5qsMtO8dKK2mY04xqrmMkE0Fp744LaruJkYD5qLJXsS?=
 =?us-ascii?Q?hoZ/q/0kk6usQoThVC6uU2RaXjPpeoj+4j7ZyZwZ8EIG2MCqMxwhox3IkKfL?=
 =?us-ascii?Q?59O3itgcO+Y/BulztOjNbOTZAv7cRtmvUsWkM+JQCUg9IkSLNhemLJWRZzTO?=
 =?us-ascii?Q?yHdA5GmV6d2S6j0oIXNvxBTAGJVbCuHq7P7RNZ4hAc4uhBvr/qUOhCkSVtb0?=
 =?us-ascii?Q?7btRKTnVXHE/dPduyAYQPM6LQocch2SK75asGMv4AR5YnWBlrD/LcJhtcvx6?=
 =?us-ascii?Q?MQkYw4COVM9aKTyidtUBT/CotJ5tfJyh5wfNSwtpDzeS1uYDl+iodBbXI0iL?=
 =?us-ascii?Q?95iEdtvePyS04LqhTAVZkNOS1F8w0emWouCmwaEQkDCpb2DfKuO9HM5ntjKU?=
 =?us-ascii?Q?LZyh82YHJNkC+81SWlsiizB73lkU/J0AW6Qo1UewtBsFEGnUYn0ZR5xWJFZ+?=
 =?us-ascii?Q?VKwdIm8wDww7vKr44U+GBzezGfFoQqN9xBinHfEHtwUx9I58+t4AhF9I+xFu?=
 =?us-ascii?Q?tvFDdIStBUmbeUcJUQ8xa3hjWebwmgrcOwte18T0oLFlpqCp5JFyjwjIGw1N?=
 =?us-ascii?Q?r83tHkuxDro45UN3P/Vs/0WXJAIyECBp5KoUkGckhFkzl309VbYKNsCbUuT7?=
 =?us-ascii?Q?oMsCpSiCgTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uSeZ9/CXc9dy8EUG/2nGlqY6seJL/8HA2BGCrfrxYa1wwT9KsgpA4qxI+qLv?=
 =?us-ascii?Q?XqwHa2w2w24b4JYlR/pXTSeZiX5F7BAwXBMnyVDZjrSzEfWPPNP7HzzLpFiM?=
 =?us-ascii?Q?fEN/YnuBd0Kawgu5J5JYoCq1wrQ6MMaMW2BYn7Ba0+UZ7bflA0GiwgfmO0Ag?=
 =?us-ascii?Q?+YQ8wjoIWMYghl6wPkRD1SzZ6PTdrJp3RdFZMJRqZyn4RdDP9mHu27m8xXaN?=
 =?us-ascii?Q?6PqaKzz8TKrYlBSHndR+S0M1B1+I3++FaxxO+hXtTRtRSC4F8nhVm3doXKbz?=
 =?us-ascii?Q?MAOrSSOyZhAcCv67xfuc4huA9GebkSnarPhEUqkl298NSqcMq/MZRuNa7Q8F?=
 =?us-ascii?Q?DWtfZLFiau42zGjqKDYSFlcmWi9oDyExkjxPdpiiJGsBk/HkA+1YULuNC8QO?=
 =?us-ascii?Q?kZqkMTKux4jkjUuZS3Efxia8uWFE1VdFExkZi3yw2sUft8MdohWYgbWpM64x?=
 =?us-ascii?Q?ZDdaAUc1E636r08azkuCPxCxr1duPIsFG/RMed0iBZISSC1RbOCCLLJALli+?=
 =?us-ascii?Q?9clVUDzh1Z0S2ToqDRx56nM6AQCp/xqB8y/5htQRV/xM0KoLiHm76scGcFIM?=
 =?us-ascii?Q?Bmu/FpppPj3qW/Rq/ks8s+syUog8aBqxwnNOweGMdTspgbhnKovvD1bQoljH?=
 =?us-ascii?Q?8yGO5Cm90uM6iJ/Sp2TdBDoArIcc1lZGfrNnChkyPQlA1NXmxr+FPMgOb7zu?=
 =?us-ascii?Q?kfsP8npUcmiBie+MXA/zLRTgQAbrfiuYkZ87JHkszCqx83UxBME2aRgpWKfw?=
 =?us-ascii?Q?qdlRsKgyTzmrtGtYsDhf280rTbrzfQ5zpAdzHXTKw4wY8+xhrgcM5sMNYKdI?=
 =?us-ascii?Q?9xP5XBjV985ORZUZODJB51M5GuccQmkbYZ21i7KEqgX5gF/y511KLz8I3Jcj?=
 =?us-ascii?Q?I3yYOj9NFC1yxNDZTOb77kd6YMBQFQ1lkXDkoiN/qgo2nPomV4uTo3VqFo2c?=
 =?us-ascii?Q?0QoLT0ilth6FP0nQHZg5SveetnyCIuF9ww4yo6Iy4U84gB6dPwiPEpVxUwIV?=
 =?us-ascii?Q?0N4vIk3GboAAE9LfIb8o6pz8kUJKTFGevetrZEbM48OTRdBylb6Qhnl6DvfA?=
 =?us-ascii?Q?TPoeoZS3KUhhlflAYdELRwGMUe1KvHLzmLKyswQpGa1NuLodnZ+ym+L4ZBLR?=
 =?us-ascii?Q?9qXnJEeX00RAYccnu1Od15EYHEauEGxvLzebb1UTYl8MBAmaS9SYAs4hcObY?=
 =?us-ascii?Q?jzSWhxpX2csnyBg6NVocmBcaaXAAKk/uF9XhX+xhpCxiap3DeF9pQC22jRVy?=
 =?us-ascii?Q?x/kDxtiqKtugfobwA52U3/4QT20+3Bj06xUx23pJXU2SxkQjTqyPmglLY+ED?=
 =?us-ascii?Q?wDXokaD3ufq3WwhMCPPIFLYi7Sen79Whyovz9tZVEbpCALaeWLV0jJsT5cQb?=
 =?us-ascii?Q?FrsfxjAUPEU99JXMGRAoAMMSpfUp1FN3O2fd2psL2ttc/c9HuvWzpsiQAWQH?=
 =?us-ascii?Q?hrJqqs/evX4wrPnjQScHALCd64PJuTeRY1sEPfsjugoSPU0yp1KDEZwZhua7?=
 =?us-ascii?Q?NRUM1xYAIyDz/umLi7pK/glvTAtJaQzrhj0KCa8J5o2Ey7RYQ+bUbD7OM/QP?=
 =?us-ascii?Q?dMJZv8ulwWH47e3bSOWWgvEi15QaNBqGJeNi/icw0g3N4MvMBLGM8msJNywU?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd81027d-c4ec-4174-b8d8-08ddf6c022b8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:32:03.5320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14Fj7DR2uHjZDXs+taB6RHHFvh+7f6e2QZmo0p7GKsd7KBL/YrYX+RER7H7YVtFs2s4Ntgui824jx1RdmDt4dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
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

On Thu, Sep 18, 2025 at 05:18:04PM +0530, Raag Jadav wrote:
> The device is expected to be in D0 state during driver probe. No need to
> resume it in ->is_visible() callbacks or non I/O operations.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index c5151c86a98a..ec9c06b06fb5 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -38,13 +38,8 @@ vram_d3cold_threshold_show(struct device *dev,
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	int ret;
>  
> -	xe_pm_runtime_get(xe);
> -	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> -	xe_pm_runtime_put(xe);
> -
> -	return ret;
> +	return sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
>  }
>  
>  static ssize_t
> @@ -173,11 +168,8 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>  	u32 cap = 0;
>  	int ret;
>  
> -	xe_pm_runtime_get(xe);
> -
>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>  			    &cap, NULL);
> -	xe_pm_runtime_put(xe);
>  	if (ret)
>  		return 0;
>  
> -- 
> 2.34.1
> 
