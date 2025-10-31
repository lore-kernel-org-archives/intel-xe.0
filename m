Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8495CCF9FE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 12:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830F310EB51;
	Fri, 31 Oct 2025 12:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z99vUJcR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E5910EB51
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761914149; x=1793450149;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u3okgePggWDLPAeLc1x8ueBEoVPxqe4ncX2xJ6rTJ/8=;
 b=Z99vUJcRgEfyX3uVg2dxE4uwC0vFDdKrCPTOmXIRNevmD96FhknsGXmx
 aMFCvD2ddrKBPHL5sQPkiXqXYd+jmOmnCAqdRcMEmjKAlt3Y1rbXw0LrO
 gmrR5kHBhnhzV17p04frad2Bno1xOzBuQBBxV4+17rASpkeHiXUyeu/CV
 g2dx5Su5AM7QiXSxdQe1YJiMJ0RwWeF65yh7+8i2SYm2ORu9ivQJvARdq
 oN8D/98NbuVcN48k51NuAnTKTa/8bAX0m51FJCgcBgMfvy7n6VgeRF+b9
 YW8+YJHmETlpGY8P/HaRYn2fGjIzQwNzAv2qQklSiSMDLO9x2N5GOF9uv A==;
X-CSE-ConnectionGUID: DmOFX6j/T76wVLsTZsXNMw==
X-CSE-MsgGUID: wcUI7Q7YTUKsaAxegVFUCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67912137"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67912137"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:35:49 -0700
X-CSE-ConnectionGUID: AhJ6AfbXR1mWfTyfB82PCg==
X-CSE-MsgGUID: Hb3BHaZsTQCjapRiQPUutw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186968502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:35:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 05:35:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 05:35:25 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 05:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEPLDzvg4uR9tEOpw/ynXr0Dl6j4B/W+IABFlfsHE0UaqSqUNKY3OUlP6RkC2T11e5Dgn+nlck6mta56uEa3k+e041XLZDK409CWYUEhpYahyCEwD97SZ4v5GzK9WCDB6ezI0JcpFRHhyD38lorkQvNvA0C86Qure5ofLZ+oJrMbONCNgg2fVlrNNFZT4j6j21dAqOv1e7p7uofbQDuQy8zSoYnZ4esGkrgvD2hy7wFcOuOC4SjiEjF7kDSkvJY6a6teJGvC/dPwdJ8uCJGB7slPKTQ0M0Q0bfBHSq1i78vA5lLrh1Y9Z67SUeqg+puP6EKVkX68RNKzJhC+CwtvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbQ/ETFQtMYiZfXQlZrBG//zrAKTljlgMM1Hqad0jJM=;
 b=pY0qovgqIeHz3G/7Wxht7vdv0v0SrerWZPOZXAYCsJvxjx4hSVMHFVQMJKDwjVod8FzRSJ9JUDG5gEjOoPjyt1GGFM26gjjAGvKSQ+b+OcZO1UyLsG1SRsYvEJaQaRL4p/mIIqCPyE7XzIoIki/laI37jE5jLECivWV2lHF0NRwI0ZiO8D2mLsaPB31xjZQ9wW1E02wooZj0XUw3ot/yo54pmWYVmrXAirAJI3INEYfXE+ks0+La5Rinodhw6IZxjqbNShxZD1s407xqqfdUEWRyskXC5WRP1O/8Cx2D6X1YK+M3Ebp8BAErkym/JbxUWQ9+YLSq/hkpmqRA/uqgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB9473.namprd11.prod.outlook.com (2603:10b6:8:258::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 12:35:23 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 12:35:23 +0000
Message-ID: <448e82a4-49d5-4200-a474-d61b56f81ccb@intel.com>
Date: Fri, 31 Oct 2025 13:35:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/17] drm/xe/pf: Add documentation for sriov_admin
 attributes
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-18-michal.wajdeczko@intel.com>
 <om52bqvbzzsw53bkrxyan5l3jribcbxg3sedwesw2exgsnyx3g@xqiy7tgg6w2z>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <om52bqvbzzsw53bkrxyan5l3jribcbxg3sedwesw2exgsnyx3g@xqiy7tgg6w2z>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0310.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e1a030-f991-4dc3-97c1-08de1879f64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUNnRVRVbXNMSm81TGQwUnVNd2tranlpV3BKMUdIYTZiam9QclFGb2JCcStX?=
 =?utf-8?B?UWlsQ29FSUNqKytOdWpuSU5EcEhFcE4wZWkrUDlsLytpam5ObnJ1dDZVWTYr?=
 =?utf-8?B?U2RydTFJelRZUXFWSGRDODZEQzJPUTI5SmlmVDNQWXlXM01xOHZRSWx1eVVO?=
 =?utf-8?B?R1htbzd4UTdqdVNrN0hUTS9Xa0RnMmtJNUY4SkhRd0ErRWx2VVB3Nm5RYzhh?=
 =?utf-8?B?MEczOS9ITC9QSFZPWFdzUGtxOW9ocm5zRlpYcGR5azVsVzhkT2cxV3orTC9T?=
 =?utf-8?B?bmNtQzFJZzVpc1hqZ2F5NnVSZFlQcVJxNGZJcUorRVhCemlveVdkTjZlaS9m?=
 =?utf-8?B?VWRVYkxWcU16a3I1aUdENG9OVmpmc2pnZ2haOHlGUkkxRFhEMVdzb3dxZncw?=
 =?utf-8?B?MlFGek1QZGdVNWR3RGpCcDFWRzQ4VXA2Z3NabERhSGlHV3FKTFhUd1U5cXJB?=
 =?utf-8?B?dVZjT0hVUHRzelFockZQeW9jUDRuUE05azJ4ZEx4b0RsOW1uTHNtOVQ4WHFY?=
 =?utf-8?B?cENpZ2c5eW9PMDNmdWxubHlrM3BhcEY2cUdsZmR5Zzd2TGIrTnFDMGR5aTJu?=
 =?utf-8?B?ank4NWFrSFdNOENYaStuR2JYaGM4TUJheW9ZT1AvbkYxZXN1eUFFL0kzdkNK?=
 =?utf-8?B?MGpLREFJQlZrdWY3aW9UcU9uR2RWQmdrNy9HREQvQmhwdDhlbjVyMmFmVGFl?=
 =?utf-8?B?NkhIOENRZlpRUXlEbzl6QzMwODUveFBnQXRhQUJGM2RrelU4SGQ1elpmb1pH?=
 =?utf-8?B?Z1llSU8vTlY0MGk5UlB1Ykx1emlOS2hWYXlVTTg1djVNSENDMDFkWitmeFcr?=
 =?utf-8?B?b1VNcDhaNEx1Q2ZjZEpPR1VUNWFoRXdWa1k4MVZMSEpaRDVmK3l3V01MVTRq?=
 =?utf-8?B?aSsrUmFLSGRqem5vWTEyK2c4dk1aSVZmRTBqQXdsQzdBTjU4dmVQNkU3bEZX?=
 =?utf-8?B?M1pDeGRyRzkxc3NJTzdDYnBYYVh4RHZ1enRWbjZYV0V1Tjc1cEUwOHVLdkJw?=
 =?utf-8?B?b1ZBWGgyci9GTWVFWkZKVEpXRmVSVDFuWENWL2RPeW1MZXVyaGJHQWxOOXRH?=
 =?utf-8?B?YWwvbGd0TTRzMGk5V0tqV0xya0JHSDZWazlOYnFsanp1d2Rxa3VCanV3VnNV?=
 =?utf-8?B?dDdDeUNSa3BRa3lyKzBDR3NWZVBBQk8xenhxUDlWdTVyNU5ldHpvM25CNVF6?=
 =?utf-8?B?VWZYa2tUZFo3RE1QZlE0RVVHSXp3bmRyTzhycXFhOENPa3BJckxZQVp5Um5r?=
 =?utf-8?B?Smx3Rnd3bVpjUUVtdjFraklaeUNwMGtscEZXK3ZTdFAyaWMzVTVuUGwvc0ZI?=
 =?utf-8?B?TUJzeVRDODVoN1pRUjVqZlJHV2lXeVdCWDAxQXhRS3o2WTh2U2FDdE8yeTIv?=
 =?utf-8?B?U0xqOXNUUzRXYUF2aDJpdFlYSUF1emY5eEVMOGVLbGVsUCszSldZTDZSMVFG?=
 =?utf-8?B?Y2hhVUNpQlZmV1ZVVDlNdzNwZVVxeFRGUmR0TGRDV21NOGZ4c1RLZGFLeWFP?=
 =?utf-8?B?R2V6Y3I0Q2FFQVk3bk16UWExWXNzSHVEUVNNa1VkT3VmUkZ4ZjFoNml6SWF6?=
 =?utf-8?B?YTJVRm9RYmNSZUxpVFk1NGNNcytUS3dNeHJ1aDBYVVZPdmM0VS9kdjVicHpW?=
 =?utf-8?B?UVBsT08zV0Z5M2dsazRzVnZTbkVGcU9zNzN4ZGxXcVFuOG5TNDNiWTUvYlRE?=
 =?utf-8?B?K2tOWlVQQjRsQ0RXemtlWDFnN0NjbmxtT29sN2M4ZGhFTTBCN0cyVElDU3VU?=
 =?utf-8?B?U3JIaUZzeTUwQlZCcVJNK2Q4ZkIxQWtMV2hycmt5UmhERnczVTBiU0RtRFVW?=
 =?utf-8?B?ZGEzSlFZOE9WSXgyMUIyaStMam1XOVljeU1QMmE1MVJvM0VQWkc3eEdJTVN3?=
 =?utf-8?B?K2grMGhqcjVIdXg2cU1hMHJLTXlkdyt2NTAxNCtXRVQrUUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjI2TnR4WGN2dlBxQUpkNVNEUTMrKytXVGFiT2U5bE11UE11RyszRHo2S2J0?=
 =?utf-8?B?UmVTQWNuMGF2TnQwUDhBMHlLb3ZjZHh0aW5QL05JSHd3aGp3bWdJWlBJNTBS?=
 =?utf-8?B?WGJ5cy9jZUxOS2hQc0dkVTArQzRMdXRUOUY5S044Mmw4alNaR1UycGs5QlhC?=
 =?utf-8?B?d1oyRnJNYU5DbndRRWs3WlZIaXRsN3h0TS9wenN3UWFIWjZyTlVMTDJPckw5?=
 =?utf-8?B?SlBnekVFWXdqMDNBMjJFZXZxcTducmpzaEkrU2ZWb1dDNng3dGtaaStLTE5C?=
 =?utf-8?B?N09iS0x4aVFENGJUc3lWU1pJM0xTZGUyUlFEN2h2MGIrbVFDUnliV3luSEQ0?=
 =?utf-8?B?SzVXRXFoK1AzRUdYL3krY0Z4UzRKS2JaOWNZVVZoS0FwTEtyVnFjcURmMVcv?=
 =?utf-8?B?Y3V1bkFyeXFERW9od0hlY2J4TUo0dnB5OVoxSG5aZUZXUGdjZXQzbmZLWEJC?=
 =?utf-8?B?MjRLV0hYeW4rV002UzhIbFZwM0Uvd0Z6Rk1GSk5yc1VmZWUxRTVlNmRQcVN1?=
 =?utf-8?B?N3VpZmlSR2N3d0l5T2VCdG5iMFRNNyt3M2xCSWhqN0VIU1VmTHUxTzFpVmor?=
 =?utf-8?B?dmZVV2NDRW5UK0J0OVJyaU1LMFlEcnpWU2hOSDFGM0FMa0gzU3B4WG1LUVpx?=
 =?utf-8?B?QVBodTBBSXhIbVZpYjN0NnNidlFKTUVOQ0hNNTF1QzN5bDE5UEpBQ3RkMFFp?=
 =?utf-8?B?RVJLV0k4TzV0V0EyZVNNckpJM0pYaXNnMW1SNjZ5dlVIb3JLcWpUeldjVUY0?=
 =?utf-8?B?ZWcvRmxidGNNb1RGUzdYMzMrakJnYTd3SzMvdFFRcEpYZHI5RWdWTmQ1MVFn?=
 =?utf-8?B?b3RIVFlXeG9OYzAreFRTZGVldUJBV3pBaGdLclcySitoWDQ4RlFRd293VS92?=
 =?utf-8?B?aU0zajRKK0h5cngwVlMzekg4eXlPelhJa3NEUHhoRndJcVdHZ2RXRGkxVWlG?=
 =?utf-8?B?WFlOWllXdjZMRGI1VmYyZVhZeWVaZUpjRmJMMS9BS0hKYm1IcFR0M3p3OW5X?=
 =?utf-8?B?TnpidkZXTm9FQ2M0cEZGNWZSZ282WWF6cmhMOW45VmlQWEJqeWYveWlaR3d0?=
 =?utf-8?B?VFhJdXB6V244TnpJYThHR3Q2SUJBcG9OcHd2OWxtUXkvYkZHeVMzWHA1dE4v?=
 =?utf-8?B?N21QWTRXMkM4cUlzR1RaaElXQW1OMHJHVFFVTWYrOEtOQUJYeU1sakhRL1p3?=
 =?utf-8?B?aG5VNFNQZjBqM2JWaThZLzVISFR5OFFPVEh5M1U1dEloeHdyTHVjR1d4UE9x?=
 =?utf-8?B?ZDV0ZnFqdXR0TkpKZ0hZRWdISm9hSndkaHM3UGJ3TU5uK0VqRFlsWUg0aDh2?=
 =?utf-8?B?bk1EV2ZlTERaVkpHb1FsS2tMelpmdFZ6aUFILzArUWtRQ1M1U21IRS9NU3cv?=
 =?utf-8?B?VlE4NnBGcktrbjhMNTRUbmJiOFVhaVBrNjd2TDdNNjlWcjEwQzR6cEQ2MElR?=
 =?utf-8?B?bmpPQzhGR2NKdEZRRG9nMTk1YUtEK1pWS3NKSXdlZ0YzbkovMVdhcFl1cFlW?=
 =?utf-8?B?RzRKYU9abzVXZlh2WVh4WWRTSXFqUkpMbnp5SlZlNnVmZ0FHMm10L2EyOVRi?=
 =?utf-8?B?cXFMSkZuUlgyNngvV05CWkRhb1QwTVZRM1dxWjVaOCtEdHgrTGs3OENlZzh1?=
 =?utf-8?B?UGZ0NWxhOHN2TTBxK0NmOVBuMWxYME5PYzlTTHdSVUl4c1hqMHhXaVhQa3FF?=
 =?utf-8?B?ck9ma29SVnVZT2FDbUVNbUZMcXhERXBxUXpRZG56Kzd4V1NCMGRNU2xrakIz?=
 =?utf-8?B?T1R0dXVsMlRLY0ZLQVNFRWthekJHK2VZTHhIWlRkYmJGbzJZcDMzVWVmRkxa?=
 =?utf-8?B?bEVlU054VnI2VndIWldOeHZlWmJjUXpRaFlqVFlWWkxYYjZCVVJHdFVOcDRK?=
 =?utf-8?B?emh5QVlLdUE1L1VqTGZVSExQVFZLUWcyK0VXVUkxZ1QyVFl6QkRhS3k5clIv?=
 =?utf-8?B?Zi9GZjhmYXlIZFB3QlJKdUovTUZoSmYxbFJqWjdUTjEyL1JwUlZLV3MySnJ0?=
 =?utf-8?B?QVF1N2V2TmY3T2pmY1B4Z3hrMjlXcFB3eFNBN05qNyt3dldJSlIwSHR6enlj?=
 =?utf-8?B?aVRCRXkza3hzSER1QVAxNk5BQUVrak9YMVkzMVdNanRzMExiT25oTzdzdURL?=
 =?utf-8?B?ZTlnQ01qZWhmNEpDbnM3cnErcURDM2NQSy9iY1BTS1EvVWRvb2NEbEsxdDQ3?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e1a030-f991-4dc3-97c1-08de1879f64c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 12:35:23.7011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +X251QOgLho4k6lrh8EU5x5ykOw42RvD2VhQZJnmqx74YCAyzHtx5sFh+v7stuog6YARgY1ZXg/I6KZC5NxjFWpe0T4d/2w8fKBBwka/RNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9473
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



On 10/30/2025 6:25 PM, Lucas De Marchi wrote:
> On Tue, Oct 28, 2025 at 06:58:31PM +0100, Michal Wajdeczko wrote:
>> Add initial documentation for all recently added Xe driver
>> specific SR-IOV sysfs files located under device/sriov_admin.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> v2: update version (Rodrigo)
>> ---
>> .../ABI/testing/sysfs-driver-intel-xe-sriov   | 160 ++++++++++++++++++

...

>> +            Actual quantum value might be aligned per HW/FW requirements.
> 
> Is the aligned value returned on read so user can know the actual value?

yes, while GuC does not tell us about any specific low level alignment,
the PF driver clamps requested value based on the GuC ABI prior to sending
this new EQ settings to the GuC, see [1]

[1] https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c#L197

and you may also try it:

$ echo 150000 | /sys/bus/pci/drivers/xe/0000:00:02.0/sriov_admin/vf1/profile/exec_quantum_ms

[ ] xe 0000:00:02.0: [drm] PF: Tile0: GT0: VF1 provisioned with 100000ms execution quantum
[ ] xe 0000:00:02.0: [drm] PF: Tile0: GT1: VF1 provisioned with 100000ms execution quantum

$ cat /sys/bus/pci/drivers/xe/0000:00:02.0/sriov_admin/vf1/profile/exec_quantum_ms
100000

> 
> Does this need to be expanded to mention what is a GT execution quantum?
> I don't think we have it documented elsewhere.

we have small kernel-doc for the EQ KLV [2], but it looks it could be
a good candidate for a section in the xe_sriov.rst ;)

[2] https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L257

> How does a 0 in one of
> the functions interact with the others not being 0?

that's definitely a not recommended configuration, but still may work

please note that currently there is no synchronization between GuCs,
so engines on those GTs are utilized for the VF WLs independently

btw, there is one problematic configuration when EQ/PT is infinity/infinity
together with VF priority set to "normal" - I'm wondering if we should
somehow try to reject such setting over sysfs ...

> 
> In the scenario below, I was expecting the functions to get 1/3, 1/3, 1/6, and 1/6
> of the GPU, but I'm not entirely sure:
> 
>     cat sriov_admin/*/profile/exec_quantum_ms
>     100
>     100
>     50
>     50

with VFs priority set to "normal" this should work

but if VFs priority is still at default "low" then if other VFs are
idle, the one VF with active WL will get 100% GPU (it will be just
sliced at its EQ)

