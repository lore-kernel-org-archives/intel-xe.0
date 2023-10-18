Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04161CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 13:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F6F10E0A3;
	Wed, 18 Oct 2023 13:27:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981910E0A3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697635656; x=1729171656;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Awv4LO8XICchBlb7oXlMAGT1qcBfqssacfbUV7CaEwk=;
 b=Co85GDzC9W+937LXnUCk398XJ/zzMF+wyX6hMYQYe+E8gcVapQoXQQK4
 Wq0w7kGKJ1DkUY3sgla03piqgGlsIU8R+9hns7pMEuptm1NPjE+fPDDdO
 e1yaSyppHy7BHtr/ldQumhxhrIENPgrECCnMq11N6drgKfWYyUxcm0FoH
 6lLWIlq2+kKDxigGwjj6nU5VgsXamIBFrDnGX6s79XcAfvxNmmsORMkJ+
 FKu35Y/xmFM0IWoKqyOFsyVJLSYSkM25/DPwxvDp/fHYVJA1p4Zxs6BHj
 FRmpCrzE511uJaGdksZnFu6LYJY+xL07b4clCTAGcbc5LqH3EQD+Bx5Kc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450235666"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="450235666"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 06:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="847269131"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="847269131"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 06:27:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 06:27:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 06:27:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 06:27:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 06:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itJaiyJkTM/kwNsFWCeRclyKp/e7PnxZti5inVFWXs5MpOlpd1G7CtQh6YuvLb3GZ0lKZzjY3E3skbisUn+pBadQdNC0QKYYNn2iyvPR05d6GwjbbvVZYNu5WCkQ2KkbTazp/m34k0uHhxOdxrjjbt6lp6tFlFfIjg6XLy6q/Iezibvff+Fse5oBfMM/7qApzzvRwsQsnJ8JCfgOmuYJd078+Nc2zP6DW7V2ooc3g6A4aEDrjxnxwMuADfe683Ze7/AZ2utkLcI55W8v9NjPFAJrK6U4sNdXnVd5XPoWbq0iTTex0/GViIRxQixgqw2N1LXkMWZJq9LQTF3QANlssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sg6UHNJ2TwNdNexOqw9roEz0X8P3MUmBp61AxX3W36I=;
 b=KqD8AtMnPlNlHvbrAdL4GQrjuwws+ywKJPZ7SQAU23Y27Rvm5eq7yPQ5ydnnxg9IAKk6VeuFDIc7Noexa7IUL2gD8arhqDGR+TO+bzsFieEpaoFfZMRXg57u6MUFxRBvVWoG90RdAO02gq18hjAUpFy5HIpL3OQUQcIMdLRH79XQPRFdDQNzTAO5XyXQw7qYFLcLl5LBiD6TG5aog+SZszBuKCHChevDA35YZGYBoMmbq8PJVb7ApewUWXqnhEo58uP33LIj9uIrQ7Jwjyklo9P2rwAJZfb9NM5t7pg2qRZ11zjY29NIl4LchByXGCeC4HlY1wy5/78BTRwnBcewMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 13:27:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 13:27:32 +0000
Date: Wed, 18 Oct 2023 09:27:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZS/dP1fdTtwUJ7Wd@intel.com>
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
 <20231018115826.3908905-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231018115826.3908905-2-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4629:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccab34b-da5b-4654-d874-08dbcfddfb13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1H1ZSzmxciwkyjKbRP4/0J7AAzqMWgPH3qOTZb9l1RYoadqU9ZRbATyPPKTHZ69pYjUiGbN0tHgne+N+E0cmXdCBzDVBX0sp1esdLy62+Wsi2NfhhyKeGLMmN7Qxg7FqMZb3UAYXT3lpNvIcAF4bPr7dy0M1XZ/CvM1ZduBI0d1b8xCelKF/gfdPWR/QCiJOWIZYHb2AzkZpHPoHHjG+Bf3BZOWAIN1/vypTBQhEv4Vh/gBWjmVxJ5M2uFsOh+bmfWVPIwQillWPgiZ40k3h0aae9881k9GzHFuRrK22HO5z/CS1RPggUYUri+AuF4kiggeJPSQw0as6fv7pKOAg4o9+aTP7NaoxR4zfWFjkW4E88APpRFZvXK7rYMPU0CpLAcn5lI2+rXgaobnZm8WkrY/4pUgJA4kHPNb/RqSPFfm/ulJ/l3k7KYXubKLVhNjGZhzgi+wXVUflbMGSKrV5y9nFm+tQvOIywrADlvCA68+F3minPx3KXQp8FnompPdqa1FLMMt2l5vM68l1MwKrXCh/u82UIeIHWycbDU57OL04fB6R/ZC6lvo+bTbP2NA+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(316002)(36756003)(6636002)(26005)(66946007)(66556008)(66476007)(37006003)(38100700002)(6512007)(6666004)(6506007)(2906002)(4744005)(2616005)(41300700001)(82960400001)(83380400001)(8936002)(5660300002)(6862004)(478600001)(6486002)(8676002)(86362001)(44832011)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlFscEVGc3VpUExiRTRBc2tSanpmeE15WUxDSXFFbVI3ZzRwZnVmODRtU3NS?=
 =?utf-8?B?ZS95ZEVab2V1Nktkd0dyeEd6RnVjK1RpeU9McWRqRVAwLyt5aTYvMWxuYTFK?=
 =?utf-8?B?cSt4Y2tVSFZZaGtTNkFldmJrZytlVjlyTWdzT01FMWxqbGc2a2twcXBsckQv?=
 =?utf-8?B?bFpFVC8yMWsxRnhCemNzUFRLYzU2VSthMmRVaU94R3FyZC9TcC9ld2F6ekk1?=
 =?utf-8?B?VFVmc1l6bStJS0RKeitSdXdPMjh5VFpnQTc4SmxRMWhrYXZBZkhLMDJsMncz?=
 =?utf-8?B?N3o4bm52NnZiMUQwZjNWT3NMTlhJWXU4QnNiRVNzb3ZZM0xleUZEYmNJQy9v?=
 =?utf-8?B?WVVKMXlpNitqTnhsSzJ5VXYrVWsyMHVPdzdKYkpBSHowM0NFOXJOSDJGR1hl?=
 =?utf-8?B?bXVnUFA5akI2NFlENzU5d3F1SVgza2V5d1pmSWR6RHZrNVA3WW5XNmVRZlFw?=
 =?utf-8?B?UlZJazIzMERsZ1JQaVB5djhNcHUyeVBSR2laY2JuaE9KdFUyUHpwVDBXUmdz?=
 =?utf-8?B?UUNESy9LRDc2U041Q0VNYTR4Q3FPaWs3RDl2ZTQyS3NYTzVycDVxSENvWEdr?=
 =?utf-8?B?VFVwY2lXY0EwTkZRTzQvZGp6WmQvcDNnVHNudHExdDN3NTVjZkkzaFZaOGlO?=
 =?utf-8?B?Z1NJOUZSMjZvblNKR3IzZGdKNVFZRU5HSWplUEl3ZjZScmE2ZXR0OGdqSHF6?=
 =?utf-8?B?M1NrY0xJb1dvUDcxMjMxZnpyYW9mUkFUbzl2UEZKU3IxQWJkOTZRekVZaGVE?=
 =?utf-8?B?THBwL083OXhLanpXQm1OeUxTeWxMbkVraUZHdEt1dW1ySWxaT1l3WWVRR1dz?=
 =?utf-8?B?YW1JYnArZnNDbjZuWGhCVHhPZG1BUk1NaXdKZ0VDQkRQdHhyV25sV2RUZ3Iy?=
 =?utf-8?B?blRyc2diU3dIT0lYd1loY1BNUmhVYjlRZmhlRTc1VE1ycmhtdGhRY2NhdDdh?=
 =?utf-8?B?aGFab29iZEdXenh1Z0JpUXliZDd0Y2hBUmxKV1E3Zm5TNzVOWEcwa1Q4OWQ5?=
 =?utf-8?B?U0kvclNDdldpakN1ODNTZHhOUWg1eFNSTlpDOWl0Mkt6MThCeG54U2ZUcEdX?=
 =?utf-8?B?TkJkdUZuZlMyS3dHaWJKVUFueXB6L0ZmRDRuVFlPVElPWEVmcTNaZTg0QmEr?=
 =?utf-8?B?clAxVkcxNlVKVkwvMDlEb2ZBbHMyUUVFVTFIdXNMeGUyUE1WNzk3bjJlYWtq?=
 =?utf-8?B?bjJQZFlpdVAvSStka1pNK2FIWndBVGQ4OC9KOWo5SUNZR1hIZjErWkFvQTdH?=
 =?utf-8?B?MERGbUdBcUp4NVVvU210RnNOWmwrZVpvemR0Ym1FMmpoRWEvOGp0NnNHeFAz?=
 =?utf-8?B?c2JkWHIwbDdvem1RT2I4Sjk0UXQzU1d0MldhZG1JS0RaMGpCUjhuT09aUTUx?=
 =?utf-8?B?Q3ErVGNQMk9iWlhHK0VPR1poei8rNG5ZV1VjS0J0c0tHN2RqRitQMW1Ua000?=
 =?utf-8?B?S2lMYlNmcWI4eDN4NjhUNTB4OHBPVnRhVmVCK3p4ckNIYVc1UisrT1FHb2l5?=
 =?utf-8?B?d1NFVUVudUFGUTVBMzcwcjhIQUdRRGtHSTBoOHl0ZVViL2Voa1ZsWWVEYTc1?=
 =?utf-8?B?OWhTTG9xSHVBOGRkZEswNzBnUGZIZTZiU1F6b0JUQXZvN3ZGRUlWbHZUUERr?=
 =?utf-8?B?ODRUL3ZHeEd1Mm1GNGF1WUZlOVVrR2ppVGx5akVJVlRCZ3d6cHRhL2krUVFR?=
 =?utf-8?B?VkN0UkhVeGlVenZyaWh4U1NMdHdwREFhZ2JCSXhQVklEMld4UE9La0NSOGt6?=
 =?utf-8?B?VTU4WEx3eHdoVGY4VzE0ZFhhcG54dlJ3Z2hya3hJc0h3bU9rdnN4TGZMNHFT?=
 =?utf-8?B?bnpUUTNKVzNlam4xRGVLSmFEL0h4aU1NZ0pJME9wZmREVXVPcWJ5dFRuTmpI?=
 =?utf-8?B?Uzg3cFh0UitlR3hCamxCeUlvN29FM2JSOHNEWVU4c2F2N2xvZ0dNSjhsbDE0?=
 =?utf-8?B?SGo1M2dPZWVVYngzUGN6NmxKUEJGM0h2THJjWDUzVzl6aFhiclZPWTM3UFdv?=
 =?utf-8?B?NDJadzFqNHAyMG5IY0FDOFQyZEpBNnkrTmYrVG1KL0tQaGNqVFdyWnZrTElW?=
 =?utf-8?B?SFpOZkdDTmxlek9rNGd2MlM2cWhxTzZHdk5kdTRkbzdGTnE0VURaTy8zeFRu?=
 =?utf-8?Q?kzv7XeA4vpAOA1lqJv22Hh8s4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccab34b-da5b-4654-d874-08dbcfddfb13
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 13:27:31.9544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKcWv5IKHJf8fAj0zeYlX8fbdGkCRmNbyby9tR0YZqNaGkqXbKCFc4Mhvkf6fRM4gkmJjMax4hzq5zG0oHTHZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Fix header guard warning
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 01:58:24PM +0200, Michał Winiarski wrote:
> Additional underscore in the header guard causes the build to fail with:
> 
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h:6:9: error: '_XE_ENGINE_CLASS_SYSFS_H_' is used as a header guard here, followed by #define of a different macro [-Werror,-Wheader-guard]
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> index 60469fde41478..ec5ba673b314b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -4,7 +4,7 @@
>   */
>  
>  #ifndef _XE_ENGINE_CLASS_SYSFS_H_
> -#define _XE_ENGINE_CLASS_SYSFS_H__
> +#define _XE_ENGINE_CLASS_SYSFS_H_
>  
>  #include <linux/kobject.h>
>  
> -- 
> 2.42.0
> 
