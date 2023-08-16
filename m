Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB10EC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 23:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A079810E122;
	Wed, 16 Aug 2023 23:11:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B1E10E03C
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 23:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692227500; x=1723763500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dQRiq3M7swtx0ZEwm0rp+VMJiiRXQUoJxl6s1jTmhOc=;
 b=iqrnONwWm/C19Tth5aZghWSon9Ct9oVEou6RL1LqwmFDKvGDS0jvJl5o
 Shapi5N6KnVk7Rr1jC3BriLuE4DOgejzqNDs/lHAG0u2tbNdR5nLq+oVG
 t9NEFnnE6YsERj7/MYQD6I5BL/jL+Mr/CH01d9z6gk+hJRZOXSoIpxYmW
 JmCxOZTkN8kVBkVyXV37UygeabwaFDllHhOfI0DcZlRiFGZdER97IZqoj
 GwLHw7wb7GgW29ap+rE3FxVD1IRsRS6oXluT2xSrJKn2uihonhQb3FQof
 CgDxR1ItadHGR96pBME4tym8wziQ+pHRBn1q8L/zM0CtOToygUksmtpNE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459019919"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="459019919"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 16:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857985248"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="857985248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 16:11:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 16:11:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 16:11:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 16:11:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 16:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEXaohwkd8in56X2r5MnSZvi98tIG6CzYWM2EIvYx5e4SuM/RyayklHsRU68TUk+k0FONFhkXRtvhiN+DIuSgyCVOj4Wc75pI6E83Y0p/9WIt8rkDFSBHzCb/Nx/ob3MMp3wYaTJMzOGGl62Rb5ZSIQ5Rf9oPNZhrIDuqcDWpJ0QvSA/Lc7e09CdqLe7GXHWljasMmSKGxxu4CEz7WKWygz+IQxdY7m3UgRS9siLPvqxtPl0oZBjo7CuL6lD3RVE5hQtmmvxBq6BPEvHemV063mXeesYXyURdBHrQYE1Kjcv8Whm56RUeVE3MG4ZZ7QEW9wagHS0fgGos3H0OrhPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSQWIBqKTolFxv/DHAmVYZjv5jlfchaOFBHC32J5YE4=;
 b=WsCsHbat7WcAbbG8q3RZX+SP7vm1tFrWADGh+Q84+vWYP3weqN8isq7v9Vsmv7tZPTozOcSjzWatQluv4k9AzRM/myyNu9tzF+eHnJSZTgneyvD3yR7KOLZWWvOTb1mJ4ZUDTxo/DeNW2is7YwLt9Hx9W7nC4VKD5bfafRDhd5OuoGbu/K4IMZAsdXrIfQlKFsX4oJHdlL0xo0VonFpB9iG6raGpsJa40YVcfknFTe5RiqM17EoNh58fUpfqbZCUlTF3a0AIH7W3Gvxuc9f8jv45EhupnaBc9Cwietrr/ubFbLGodoo4YBwpGpHiM25tuEa13wJqHBxWns2ZYWwDuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 23:11:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 23:11:37 +0000
Date: Wed, 16 Aug 2023 16:11:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230816231134.GA3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
 <20230816180425.1481448-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230816180425.1481448-7-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR01CA0012.prod.exchangelabs.com (2603:10b6:a02:80::25)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bcb88c-d813-4630-39b7-08db9eae2436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+/8gFnNMROAZG2bzcxRtG4hX4iBWNrUmxKtp8pBQ7sR+CeWEc7uMehl411EmZc70rvC1zfx/aYAomP8/d+CBeL741uCkl67264FxqHJW5FSHrVV+8H2xqccvSOwB1OQpEJkBMIeteOeLpJfKEoIq4D3PSmCbpRnO2RqYCsek3uMguKCtku3pdDVJ9o31WC6toNJmjCu9tw14P8nVrfb86Vv4JYzkBCZzHAbKUEoHHtFH8MvPGfQSPG65EHk7XlF9oAiANtMMnbLljFN1enNfcR0ShZMt+WjeEU9bpinRlA0w0G7fXPGwvZ0ZYUY7AP73UlmDF91OzN2vcWABHNS1ypCYYSZ6O2vD8XeIuDp0zxcKZs0+cKv2V5UhTyQ3MBLCQHfkKQgmiw6IZ7itBCKgWd+nw9DoKfFQw5dxAMjZi61gCr+is5GTmF1dxAjCTf3exYq7fhNHMKXapQZBOxYxl6T7PlUTGNDDsaJj3JmmCo4D6JvvQH5/WeE/eDV6nZ264bJHTVyImRfTBaxgWN3pV0oSqODhkZ/sdeKk7/eCougmxa22nctFprMd+4zewQjbBT9/WoqnBX43IgyqPMm7geJInj2+j/HVySD4v5JrYvZCdYjA561wa7hdC/SBu4WiBoI4NAjZ9RoBKBZjFFZDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(6636002)(66556008)(66946007)(66476007)(5660300002)(41300700001)(38100700002)(8676002)(6862004)(4326008)(8936002)(82960400001)(2906002)(26005)(478600001)(86362001)(6512007)(33656002)(6506007)(6666004)(1076003)(6486002)(26730200005)(19860200003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WaKqg+J0IkJcT+dkzCeqZQDMXYEbAII0nCElkzvGy7Jt82oCx+9N/b2V8Vfw?=
 =?us-ascii?Q?ODSIHeySX5CX083ucl1V42Ebp2izWv/uJheoB4bNbXA63AUuTq7t+brDmFxa?=
 =?us-ascii?Q?WP0zNvA7xRdVqEI1h/ZXgBQrJUskTrwVc90RdvNzrP5XqsQR/ihu3p8Nkt+q?=
 =?us-ascii?Q?kCkLFnpYWxEV9cn9Bfjiw6eTbDiU3IWkkTsZSwDfhOCdkYv+XOjaH1/sctWE?=
 =?us-ascii?Q?crLL991b7/HTZUXZB0grE4XWS7X1wDmO/TaclxHlDItWSWnXFnOMLQFLGH0i?=
 =?us-ascii?Q?sTwwzMJLba3VVIVgLklmQOE+H8/E0ZatLynnmTjSis/xOU3gMCENrWEY985c?=
 =?us-ascii?Q?P0A3YmAQfIgbIAlI/cf6kMsMoiMLB5CTX6ABEPSjEH9k11t44JmsLhhDu1vP?=
 =?us-ascii?Q?n3UdvLR2LKBShSQqwh4bsDK8n6VXwDIjDSj261HSawcfOaKITchY2SbfO0kD?=
 =?us-ascii?Q?P2SMURRuQFCvLtZrtZLqDfaxXsVcvjpnI2mQ9S3Kt/xtpjTgUHXEVEX/aiv1?=
 =?us-ascii?Q?AMD009AhHK077a059VoHqbF+Q4iQMpdRe8rNVtwN3DHzSWLk87U8nXlX99cP?=
 =?us-ascii?Q?BjECKJZZDW8PZDOMi7HALiV0x7D1Sdac53Mo/Q/7JUolg8qKLmuZA23tQEK+?=
 =?us-ascii?Q?mHJoIq0AwUMO5gzmBeOpn4EK5GhskiBmBtEOrOaCDZSN6eVzHEgBg+LpGCwv?=
 =?us-ascii?Q?YP7nDCK7vGaKVGMNpRiMZf3nhso7A4EMM8mSOhAkoZGc7c1v/3roIiPpHwov?=
 =?us-ascii?Q?d1UkEdhBFJ9Gcts59tS5swV7qHYy1dLsRYkz4D3DmYkjoksXJNwTh+VfnV6H?=
 =?us-ascii?Q?2S044MfMGHWLigjxZkaGIp2DNzVjtDSDX/6ArQbS6wmOBgArIaiyL0GZ7XVO?=
 =?us-ascii?Q?/7BBwvbEcbQ4ibLDRj+QGd0m0xEH+2ht1sg41qs4xW/ix0R9mY7btiYTDZnp?=
 =?us-ascii?Q?at6eBgOLnqLfF4Rj0mDeUvX9Df6qVb2yKBM0yxkmIXPkbQsUk1f9Ix8EcR9+?=
 =?us-ascii?Q?w7O6R2+Z9Uqoa+98Fgwrz63Lw8w6rClWp7BDWT+mqXN27BCqt9cxkCM6K8H1?=
 =?us-ascii?Q?kQCa3Vgs7mpSGmkSKnoQt+86ZLc8wQcpU1nZqRUSUmJHtC/t0UfWOmWNd/lC?=
 =?us-ascii?Q?4UphM/kQ6c0c3m+oQOWrCp2oD5yxkURjfEfhQgMcK+4de7hatIfJ45giLh3d?=
 =?us-ascii?Q?q/k+7N9QwBSvBmFKPGHe4GhBYlCouIDCz4RBloCYjKn/Qoq099JIRweNUGkr?=
 =?us-ascii?Q?Ho4XqK++cl6gqOsVGBKX7C8OLVY8Z9hMHb2Zkkkuh2YfYg+YMC9FemOB422u?=
 =?us-ascii?Q?hjtc/OmH+SAdvXQUWmDvZJrkDbAOJFK67Rr8j4mYVYPGE5EsOKeYza0PTVZM?=
 =?us-ascii?Q?DWDqFXWRu5JPE2wDOgiJ0ZIRJHM0W636Yv0ThAkL1cjxxHNSMxGnRMJH8u4O?=
 =?us-ascii?Q?Gd1KQ5duIKPLWTuD5s6PVMWPSo3yMasRJ75spa7ReyTunY1imc0hcRugvJci?=
 =?us-ascii?Q?/ouzrDljBoHQgpQEhcC1UBtd+OOUF10eHDgOsEbuCRAbu8EKXRRSPQDIpltE?=
 =?us-ascii?Q?+Jb2rU44OnMNOmz0tZmqWNlpNylX7U6DGBeXnXTFnl2M1+UTcbY2VNttbACc?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bcb88c-d813-4630-39b7-08db9eae2436
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 23:11:37.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OY1a7IcG+0Yq/lb8J0ytoLCDwL3FnsP+igPhD00G+Hi3pJRgyDhxxup2jAk9k5m+zd3/ToJIa2MWBx3U4wUmRfW/t9gSa7Lg+WPofHcW/xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: don't expose the GSCCS to users
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

On Wed, Aug 16, 2023 at 11:04:25AM -0700, Daniele Ceraolo Spurio wrote:
> The kernel is the only expected user of the GSCCS, so we don't want to
> expose it to userspace.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 7ce3e740c508..ee417b7aeee5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -794,6 +794,9 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>  	struct xe_gt *gt = hwe->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> +	if (hwe->class == XE_ENGINE_CLASS_OTHER)
> +		return true;
> +
>  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
