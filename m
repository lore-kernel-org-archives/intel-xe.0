Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E530CA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 19:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9910E292;
	Fri, 15 Aug 2025 19:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhS6+4zn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D1110E292
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 19:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755284494; x=1786820494;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fGTK12ftZ/I7TsvtCpJbf+gkKHXG9jBIHHWvwiKIcUg=;
 b=RhS6+4znfBbs22/oB7utKnjdo8Io67H/FO2SwllzQlbQoK2Td/Rkm0xd
 rSt1i69OeFetuy4/Qedpb5eM9wY7jqCDuqSjByFd7OOVKaLakZfrPPgTE
 lML7g8CuSOIh45iKLyzqbSgkDG0SIdUREu3HrzdGXm28NEt7z1mxo5fn8
 jFA2Toahqoe/4ZvZdcpek0VYqP+gN5K6WD937ep5gc1G3YfebXbAVu2I2
 h8amEU5w9Dw3T/nw4v258kTlQ9pFXNP8aRvRldudSaSU88WtwvVtbLIiu
 2ftNU/AfkYU9KcZqh48aj9GBQstTisp/Nt7QDNGdtswuSN1zcsbNrhxwI g==;
X-CSE-ConnectionGUID: gMFPZuYyRwWuycsebx2F5Q==
X-CSE-MsgGUID: DZT34O3rRcyjQ4VTaiFvmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68979496"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="68979496"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 12:01:33 -0700
X-CSE-ConnectionGUID: U6FCsfsdRkeCfswpDAEuAg==
X-CSE-MsgGUID: zHKszbUmTR24qsDLvIY6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167425069"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 12:01:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 12:01:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 12:01:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.74) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 12:01:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPyUUpZSnv0iqSFnhmkEOU5YL/B357mWjTITwEQSnPSBiD3I2O0Mkz8bq7Dtv9A8bJYys2IJSkaQB7LvQIMkdBFaHwn9IDmtvr7Br3YbCAAQd+CRFwRkjXgJC+RTOEq5z34vkafICK2Jwhg2h1VIAJNkbCBl5tHHs2TzTayIAuRgXAHcqhcZGL8ajJNjHvKdxULEfn3vZis9Ykfo8IShJrEGbO7PG/+KeGd+R6MeIIQHajGug4EImrMU5RlZzUxQYWV6RTSQCf2JrNBVUTZ/hagT81f7sfIfU6ttOl/lMrtVmAtkiACZCohVHxTLwBy6dz8YBSFBD5Adgwxs0MBv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwIpqs6Cn7p1pz7jTXZAabMnBBJTMiIOE2OsCT/huAM=;
 b=F3LIYwbRKpF7fv+X7EQkydYT0pMG35YA9+ckmIE93/Ijt63bFfs2PbYij45V2TZU/zU54l9NdBJIT93Gv6YeGz5XHD7T/zr96rB0qhte+l6gtNlg64i8mGJzatEbxC2DW+xsvf6wG8KXy8SXnH5RENg8cxKMGucgASG/yJ5uL3Cdbl4Oic2SnVn2/UJAsUx/oRnRIQbpFFAFjmFwVzZk8x4yytENV2LR3VhLDKX0V/0nKJr9q34gCosJiktYdr4U3+lIuLbEfSe19hw2L4XKkc8L+tFm+HnXuOuBojEKxdyEPhvOHXh8RsMSVSzRIhcoVRdZAu1uhQofWuGutQPcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Fri, 15 Aug
 2025 19:01:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 19:01:15 +0000
Date: Fri, 15 Aug 2025 12:01:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 05/15] drm/xe: Introduce an xe_validation wrapper around
 drm_exec
Message-ID: <aJ+D+DhtWTvFqxkB@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
 <aJ1LFsjFmjAY2Fcn@lstrano-desk.jf.intel.com>
 <4d5c63f723a1c95bc745ff139882f22d54a01210.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d5c63f723a1c95bc745ff139882f22d54a01210.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0348.namprd04.prod.outlook.com
 (2603:10b6:303:8a::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: bf80846f-d3b9-44b1-8167-08dddc2e1bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVpra1dlbGJCRXNuVll1SFRRVnVjVEs2NFl1dlJVZWVZZENpSFl4ZHN5dUEr?=
 =?utf-8?B?UGFDaHRJdk1UeGFEdkp6M25TM25Tam16YUdnNXZrdFRFQjZ4NnFaVGJsbGJt?=
 =?utf-8?B?dG5BR0Y1aFkra25mOUtha3JhRGNwZ1JNWUxhblhZREtZd0dpQW5qMWUzNDFB?=
 =?utf-8?B?dzkyODNDaGJQTFIvSldlSXl6UFEyYjhsa0tHK25BLzJNTFlsdUgyU0tkZlJl?=
 =?utf-8?B?a3lOazhSWS93Ri9XdEFiODVjTm01aU05Y09ScjRaaHcyekU2TlBWRlMzV0RC?=
 =?utf-8?B?VDI3UFNnWllCQ2ozUjNlN2pHcWRPT3JoL3JsK1UyVW9rMkZCNXJqcHIrSkkv?=
 =?utf-8?B?dkJoaEVWdDlZWXdDc2Jvc3RnUWZvbXR3QTFOUXJrVjU2T1BZWDd2b0dwR2Jo?=
 =?utf-8?B?RCtIS0F0a1FadDJOVnRSaWt2VFJDMGJNbllpS0k0eStUVTEyNUlBbVQ2a3Uw?=
 =?utf-8?B?SXhhaGJTQkJReFNabndpNHBISGhEbjhkYlEwODN1QmtML2ZyNFQweVhXWEg0?=
 =?utf-8?B?dVlZQVd4bUtSalMyb3lSTVVsQlRKbElLWVRsZ1FVTERCS0NWcGN4MWMwUnVH?=
 =?utf-8?B?ZCsxdVAzdjRlSG1iTVdKOUQ2aVRMa0dPMWhTVDlKbUNYZ0tkTFpwY1Ewc1VN?=
 =?utf-8?B?K09DUFVLb2dSWkxscENwN0FNUnNzYVk0NHFEa25xZEdCdVFFZzhERldNTWVk?=
 =?utf-8?B?MGhOaDdKSUF5dFVnelFYeUZWRXMvVnVVbGlRaDgzZzUxQmp5Zm9SNkI3Zjhk?=
 =?utf-8?B?WExLU0krMnVHWDUxMVBoYlUrcWFCZ0JBVlphOS9kTG5LclB6R2Z2dVhsbktO?=
 =?utf-8?B?SkV4VUNuTjVlcHJxczVVVU1sUE9iMjJ0VDZBeXFkclJ4M3hzdUZmYTR4QjA0?=
 =?utf-8?B?K0xraUVURUR6U1FHREYxa01aQTRJT0RHZEc1Q2t6SFIrQXVIeVBsWW5EVC9p?=
 =?utf-8?B?c2VRQ25Qd3ExdEkrVVQwOHJMZllvV3VSTDVQOFlORnc3dTdCRkNSK3dybkgx?=
 =?utf-8?B?bld4TlNrVDRZdGdNbmJkVFI2MjdXQXpOSEkvVytDdDI3NkxFTmJZWGtYejZ6?=
 =?utf-8?B?QjFVK0tpcU9UYnhjRzhHR1BpNFpmSkxObThNNnpZRnFQRjEyUTJGMGJoeVFl?=
 =?utf-8?B?TkF4NHpqSUhrQkwrT0FNY2x3U0Y4SUNnRC9hWUFwSE9zMUE0clVVanBIancy?=
 =?utf-8?B?aFN5K3NuUGxFcElCL0Fua3lkOHJTanppbG8zbnNtWWRsYlRWSzcvYUoxNk01?=
 =?utf-8?B?Tk9WQW1IWVZvQ0ZVTFhQRjc0WGFaNXJKd0lBdnZoc1p4ZWlyeDhkQWZ5aW91?=
 =?utf-8?B?TnVDcEs4dGtFdDBpdHR6Q3BpSG9EQjBaVlN3UHJkNGdteTQyU2E5UUZLTnVY?=
 =?utf-8?B?MFVuUi9uM1RGODd4OWJibG5pRCsyWTRjZTljM0NtSHJZdnRSc2VJZWs0emds?=
 =?utf-8?B?V2tBcUFyM214SzV2ZEEyNFhpbTYwUFhEdmxXVTg5R1d6S3pEM2RydWlrSE9N?=
 =?utf-8?B?Mm85ZWFyaXE4Kyt3VVFLNFpqMVNCTWZnRjhQTGhLU1dQSVlsVWQ4ZlBnUXRJ?=
 =?utf-8?B?YUFHLy9MYnBacG81Zy9iNjVCQmFLVTJsOUN5YjdreHE3T3F5TExkVzNnNG9B?=
 =?utf-8?B?LzhvVitBRVJjQUZNa0FpdHdsdXM4d1plc0ZCa29kQTVQWnh3cmNxQ2NsRE9Q?=
 =?utf-8?B?S1RzcC9UT0xINUliR2xZQm1DMCtYMm9jL1B5SzNMSGNEY1lVVnBlYWlPTXhw?=
 =?utf-8?B?clZUU2dySHFiV25SZGh2cmNKNWFBQmxPZm9MNkFMRGtNdTR6TDU0OUwvTGxI?=
 =?utf-8?B?Mk4vZzhWVW9xN2szcnR1bk1tSDFYWm16VkxSRCtkaVMxT0dtSVcxTGpaQnBR?=
 =?utf-8?B?ejlOUTFmMlNNZ2pxUzlMYXgvV2ZPSERRUnZzM2pYdnVwcytycUM2MEpqRjVU?=
 =?utf-8?Q?Xt0qD6hQHOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M01qYUJIZXpXbHZPTWV1SjNBa0ovRXkyNmdQUGVjSVB2dnd5L1hzWWt6N3c3?=
 =?utf-8?B?dkpoUW1EZi9UZndBTGJ0cUNhajBhdWRNbHZFcXZSQ0J5RjMwSmlCeGI0Z0Vi?=
 =?utf-8?B?djg1anRXaHlFZHFDYVYyaXBMU1dhWlFxNWNoOEEzNkF4cnl3VUNFakRPaEVK?=
 =?utf-8?B?Mk1IRzA3ZE5Ob3l4SERkWkgvNksrbTZXVzliYUx6Qk5ZSmZiNG1LT0dmOTZE?=
 =?utf-8?B?R0pHejJhMVBlVGxpbEhKaFNGclVXSVVMQk56VFZ2NHZnMVlNY0Yra3hHY2RB?=
 =?utf-8?B?RGRYMzdKK0lmZ1dGL3d5a0l4SVdaUkF3RnhRR1FJeGZ4NTJHSkd6ZnpoK3Rt?=
 =?utf-8?B?eE9ydFo5c0RqT2pYUlZTTXg3T0NyVVJmR21yTmplSkRTekxPbGR0YXBmVDl4?=
 =?utf-8?B?M1FFVWpSekI3anVBSWUxbU9vdE5QV0ZMUHF6M011MDMxZjUvY3VkU2xnYXpk?=
 =?utf-8?B?S1k1VGlQU29rT0pQQU9GazJNUU4xZmhveXNvTFBtSUxTWENXVGZGcHVhZGI2?=
 =?utf-8?B?bExlcGRCN1JJTUE5TEpwcG1XSDdVUUxraERQSlRGL0xmRWZMY1F0NjdhQ0t6?=
 =?utf-8?B?SzR3TGlMSDZjcS9RcFlJSy84aDBRQmd4Wm9ZbjZKOGdQSWJROFpoR3VKNlVJ?=
 =?utf-8?B?V3BqM3ZWUlM3RnV3NFZSbFQxNWh4allmdjA2ekwzY2JSVFR3bmVkRmNyeE82?=
 =?utf-8?B?UlIvckJLb2xTRzBjZFlhYXFDSzRxWjM1Sy9aYkZ2bytTdHYvWWlvRHh1bW04?=
 =?utf-8?B?NmViRVd3RUo4YXlwQU9mRzFjZ3hSYjJWeUtlcmhtUlRSeGRSdXNlMTBUUVdQ?=
 =?utf-8?B?MXJPOVVhZXk3UjVFMjhrSThabmwzVC9yNUJPbEFtNTE3NHFDckx0SG54Rmwx?=
 =?utf-8?B?R0NHcnltWDhvVUlzN2llQzJGK1hvR1ozUVBqTEFSYXVFQTJlMTh4SE1RUFFF?=
 =?utf-8?B?MkttS0FtQVEyaGg1RFBsZ08wQjhLZk83aFFyRWo5RGg3S2FUN0NXWnNyb1BZ?=
 =?utf-8?B?aXo4NjFuaEFJTGZvYlZhYTFHUXBSeWFyTnk0Szg1dyttY0haRmNKdEpLN0NS?=
 =?utf-8?B?RXVwVU1IVHhTQWsvT1FkZTlUdHh1MzROYnVnbjc1QVJsQVZlblJMNlA2bDRL?=
 =?utf-8?B?aE1pNnRmR05tY2lHSmJRM0dJNnJ2NDFmTXVWKzlGRlBxMWphMkhER1phZ2Y1?=
 =?utf-8?B?MGZJTzIyUzZGSEl5Vm1ub3JyZmZNaDVwcjNVMjRhRDZLdndRb3o3dmFVbmFH?=
 =?utf-8?B?ekR4a1BDeTRuejA0dDFCU0wwV2xPb3kzMTh2UEo5Uit5NGdmUHd1SzcyY1Fi?=
 =?utf-8?B?bVRmeHY2b2s0V1pmS3dlT0dCV2RJYm1sTEZsTHZGbjJkcTBoeXVqWFNwZkJK?=
 =?utf-8?B?SFhkRWJ3NDFtQ3RrdkthNlB3ZUl4SHRPbFFSN0lOdFNPdi84dHcwU3llSkls?=
 =?utf-8?B?dEZzbkJHOWhQQUpTWTROUEJodVVRREp6Z3BYRm95Q2tZR1F6bUs3MEtNVEJt?=
 =?utf-8?B?ZkF5cmpObm9ML2VDOGJlOXpObDJaa1RkSk11ZlVPcWgxYmxGQ01oRUg3YTFR?=
 =?utf-8?B?SXdrNTN4bENxV1gxcFdheFNoRFFYbFJRUFRVUStTRVg0VmZOU1R2N0kwRnJq?=
 =?utf-8?B?WEJRM1N0RUhCYXJqejlmak5RZ2FwK0NwcDlhYnFNM282TFVSR3huV0pMeHk3?=
 =?utf-8?B?dkxLWFRmS29lK2JSaUhXUVgwRGF0SE1IZi9GMGJ6eGVWRjBTeDZreVE3SHM2?=
 =?utf-8?B?d0ZOY2huTW1kN3RueW9Fc0Rab2cyN1ZEeUdFR2VxdGdpZDVTSXdZcWczeTRs?=
 =?utf-8?B?c0VWMVdiQ1BxUnh2cC9VSDhaNFNzZmNYTXc5WUlodUkwakw0Z1J6YUx3ODBl?=
 =?utf-8?B?M0J2dk4yTmdOeGxFeGUxSkMySVR1RkE4UjhyQkl4SHRUcFJZaUJmR3hUZ1Vv?=
 =?utf-8?B?UnJna2tBYnRmNDRtdVY4ZXBkSEtyNGhFejYrUnVmWUwxb1JlalB4eVJLdlV2?=
 =?utf-8?B?YktQRFpoQnpNUExEN2lCL2tOd0NHN2RuYU9IVFpoTHkxN0Fta1NNUis2ZmFk?=
 =?utf-8?B?RWFoTEVVNmxyTlVaL0VXdEJiRmhrYitiN09qNm85NWpVNW9PRXNqVUJSQ25S?=
 =?utf-8?B?Z2N1MnlUTEQ4U1hmcjYzRVB4TDNSQzdtaGVLejRwL2QvU2N6QXZvRFhZbWRL?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf80846f-d3b9-44b1-8167-08dddc2e1bec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 19:01:15.3158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSx3RwyvsoR5luPUAr8VnE8baLEuaDgSYA9NyewJLt+JQeu+3Y01J+yUcqKQ+iqRTriSlmx8J35ihj4Vao4ueA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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

On Fri, Aug 15, 2025 at 05:23:41PM +0200, Thomas Hellström wrote:
> On Wed, 2025-08-13 at 19:33 -0700, Matthew Brost wrote:
> > On Wed, Aug 13, 2025 at 12:51:11PM +0200, Thomas Hellström wrote:
> > > Introduce a validation wrapper xe_validation_guard() as a helper
> > > intended to be used around drm_exec transactions what perform
> > > validations. Once TTM can handle exhaustive eviction we could
> > > remove this wrapper or make it mostly a NO-OP unless other
> > > functionality is added to it.
> > > 
> > > Currently the wrapper takes a read lock upon entry and if the
> > > transaction hits an OOM, all locks are released and the
> > > transaction is retried with a write-lock. If all other
> > > validations participate in this scheme, the transaction with
> > > the write lock will be the only transaction validating and
> > > should have access to all available non-pinned memory.
> > > 
> > > There is currently a problem in that TTM converts -EDEADLOCKS to
> > > -ENOMEM, and with ww_mutex slowpath error injections, we can hit
> > > -ENOMEMs without having actually ran out of memory. We abuse
> > > ww_mutex internals to detect such situations until TTM is fixes
> > > to not convert the error code. In the meantime, injecting
> > > ww_mutex slowpath -EDEADLOCKs is a good way to test
> > > the implementation in the absence of real OOMs.
> > > 
> > > Just introduce the wrapper in this commit. It will be hooked up
> > > to the driver in following commits.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_validation.c | 199
> > > +++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_validation.h | 107 ++++++++++++++++
> > >  2 files changed, 306 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_validation.c
> > > b/drivers/gpu/drm/xe/xe_validation.c
> > > index cc0684d24e02..cd1424f04237 100644
> > > --- a/drivers/gpu/drm/xe/xe_validation.c
> > > +++ b/drivers/gpu/drm/xe/xe_validation.c
> > > @@ -5,6 +5,7 @@
> > >  #include "xe_bo.h"
> > >  #include <drm/drm_exec.h>
> > >  #include <drm/drm_gem.h>
> > > +#include <drm/drm_gpuvm.h>
> > >  
> > >  #include "xe_assert.h"
> > >  #include "xe_validation.h"
> > > @@ -47,3 +48,201 @@ void xe_validation_assert_exec(const struct
> > > xe_device *xe,
> > >  	}
> > >  }
> > >  #endif
> > > +
> > > +static int xe_validation_lock(struct xe_validation_ctx *ctx)
> > > +{
> > > +	struct xe_validation_device *val = ctx->val;
> > > +	int ret = 0;
> > > +
> > > +	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
> > > +		if (ctx->request_exclusive)
> > > +			ret = down_write_killable(&val->lock);
> > > +		else
> > > +			ret = down_read_interruptible(&val->lock);
> > > +	} else {
> > > +		if (ctx->request_exclusive)
> > > +			down_write(&val->lock);
> > > +		else
> > > +			down_read(&val->lock);
> > > +	}
> > > +
> > > +	if (!ret) {
> > > +		ctx->lock_held = true;
> > > +		ctx->lock_held_exclusive = ctx->request_exclusive;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void xe_validation_unlock(struct xe_validation_ctx *ctx)
> > > +{
> > > +	if (!ctx->lock_held)
> > > +		return;
> > > +
> > > +	if (ctx->lock_held_exclusive)
> > > +		up_write(&ctx->val->lock);
> > > +	else
> > > +		up_read(&ctx->val->lock);
> > > +
> > > +	ctx->lock_held = false;
> > > +}
> > > +
> > > +/**
> > > + * xe_validation_ctx_init() - Initialize an xe_validation_ctx
> > > + * @ctx: The xe_validation_ctx to initialize.
> > > + * @val: The xe_validation_device representing the validation
> > > domain.
> > > + * @exec: The struct drm_exec to use for the transaction.
> > > + * @flags: The flags to use for drm_exec initialization.
> > > + * @nr: The number of anticipated buffer object locks. Forwarded
> > > to
> > > + * drm_exec initialization.
> > > + * @exclusive: Whether to use exclusive locking already on first
> > > validation.
> > 
> > The last two parameters of this function are always passed as 0 and
> > false in this series. Is it worth keeping them? I don’t see a case
> > where
> > nr would ever be non-zero.
> 
> Right. I'll remove that from the interface but keep it in the struct so
> that if we ever need it, we can just change the interface.
> 
> > exclusive is defensible, but it’s still
> > unused.
> 
> Actually I think with vf provisioning and in the pm notifier it makes
> sense to set it to true.
> 
> >  Maybe drop both and reserve a bit in flags for a driver-defined
> > “exclusive.” That would make the call sites more readable—long
> > argument
> > lists make it easy to forget what each parameter means or to
> > transpose
> > them.
> 
> Problem is that this is drm_exec flags. I'm not really keen on
> overloading driver defined flags there. We could add a separate const

Yes, usually if you want to overload bits we have an explictly defined
user bit value in the base flags which doesn't currently exist.

> struct xe_validation_flags, though, but then we'd have a translation
> step?

xe_validation_flags would make it more clear at the caller what is doing
rather than 'false/true'.

Matt

> 
> > 
> > > + *
> > > + * Initialize and lock a an xe_validation transaction using the
> > > validation domain
> > > + * represented by @val. Also initialize the drm_exec object
> > > forwarding
> > > + * @flags and @nr to the drm_exec initialization. The @exclusive
> > > parameter should
> > > + * typically be set to false to avoid locking out other validators
> > > from the
> > > + * domain until an OOM is hit. For testing- or final attempt
> > > purposes it can,
> > > + * however, be set to true.
> > > + *
> > > + * Return: %0 on success, %-EINTR if interruptible initial locking
> > > failed with a
> > > + * signal pending.
> > > + */
> > > +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct
> > > xe_validation_device *val,
> > > +			   struct drm_exec *exec, u32 flags,
> > > unsigned int nr,
> > > +			   bool exclusive)
> > > +{
> > > +	int ret;
> > > +
> > > +	ctx->exec = exec;
> > > +	ctx->val = val;
> > > +	ctx->lock_held = false;
> > > +	ctx->lock_held_exclusive = false;
> > > +	ctx->request_exclusive = exclusive;
> > > +	ctx->flags = flags;
> > > +	ctx->nr = nr;
> > > +
> > > +	ret = xe_validation_lock(ctx);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	drm_exec_init(exec, flags, nr);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> > > +/*
> > > + * This abuses both drm_exec and ww_mutex internals and should be
> > > + * replaced by checking for -EDEADLK when we can make TTM
> > > + * stop converting -EDEADLK to -ENOMEM.
> > > + * An alternative is to not have exhaustive eviction with
> > > + * CONFIG_DEBUG_WW_MUTEX_SLOWPATH until that happens.
> > > + */
> > > +static bool xe_validation_contention_injected(struct drm_exec
> > > *exec)
> > > +{
> > > +	return !!exec->ticket.contending_lock;
> > > +}
> > > +
> > > +#else
> > > +
> > > +static bool xe_validation_contention_injected(struct drm_exec
> > > *exec)
> > > +{
> > > +	return false;
> > > +}
> > > +
> > > +#endif
> > > +
> > > +static bool __xe_validation_should_retry(struct xe_validation_ctx
> > > *ctx, int ret)
> > > +{
> > > +	if (ret == -ENOMEM &&
> > > +	    ((ctx->request_exclusive &&
> > > +	      xe_validation_contention_injected(ctx->exec)) ||
> > > +	     !ctx->request_exclusive)) {
> > > +		ctx->request_exclusive = true;
> > > +		return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +
> > > +/**
> > > + * xe_validation_exec_lock() - Perform drm_gpuvm_exec_lock within
> > > a validation
> > > + * transaction.
> > > + * @ctx: An uninitialized xe_validation_ctx.
> > > + * @vm_exec: An initialized struct vm_exec.
> > > + * @val: The validation domain.
> > > + *
> > > + * The drm_gpuvm_exec_lock() function internally initializes its
> > > drm_exec
> > > + * transaction and therefore doesn't lend itself very well to be
> > > using
> > > + * xe_validation_ctx_init(). Provide a helper that takes an
> > > uninitialized
> > > + * xe_validation_ctx and calls drm_gpuvm_exec_lock() with OOM
> > > retry.
> > > + *
> > > + * Return: %0 on success, negative error code on failure.
> > > + */
> > > +int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
> > > +			    struct drm_gpuvm_exec *vm_exec,
> > > +			    struct xe_validation_device *val)
> > > +{
> > > +	int ret;
> > > +
> > > +	memset(ctx, 0, sizeof(*ctx));
> > > +	ctx->exec = &vm_exec->exec;
> > > +	ctx->flags = vm_exec->flags;
> > > +	ctx->val = val;
> > > +retry:
> > > +	ret = xe_validation_lock(ctx);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = drm_gpuvm_exec_lock(vm_exec);
> > > +	if (ret) {
> > > +		xe_validation_unlock(ctx);
> > > +		if (__xe_validation_should_retry(ctx, ret))
> > > +			goto retry;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * xe_validation_ctx_fini() - Finalize a validation transaction
> > > + * @ctx: The Validation transaction to finalize.
> > > + *
> > > + * Finalize a validation transaction and its related drm_exec
> > > transaction.
> > > + */
> > > +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> > > +{
> > > +	drm_exec_fini(ctx->exec);
> > > +	xe_validation_unlock(ctx);
> > > +}
> > > +
> > > +/**
> > > + * xe_validation_should_retry() - Determine if a validation
> > > transaction should retry
> > > + * @ctx: The validation transaction.
> > > + * @ret: Pointer to a return value variable.
> > > + *
> > > + * Determines whether a validation transaction should retry based
> > > on the
> > > + * internal transaction state and the return value pointed to by
> > > @ret.
> > > + * If a validation should be retried, the transaction is prepared
> > > for that,
> > > + * and the validation locked might be re-locked in exclusive mode,
> > > and *@ret
> > > + * is set to %0. If the re-locking errors, typically due to
> > > interruptible
> > > + * locking with signal pending, *@ret is instead set to -EINTR and
> > > the
> > > + * function returns %false.
> > > + *
> > > + * Return: %true if validation should be retried, %false
> > > otherwise.
> > > + */
> > > +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int
> > > *ret)
> > > +{
> > > +	if (__xe_validation_should_retry(ctx, *ret)) {
> > > +		drm_exec_fini(ctx->exec);
> > > +		*ret = 0;
> > > +		if (ctx->request_exclusive != ctx-
> > > >lock_held_exclusive) {
> > > +			xe_validation_unlock(ctx);
> > > +			*ret = xe_validation_lock(ctx);
> > > +		}
> > > +		drm_exec_init(ctx->exec, ctx->flags, ctx->nr);
> > > +		return !*ret;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_validation.h
> > > b/drivers/gpu/drm/xe/xe_validation.h
> > > index db50feacad7a..a708c260cf18 100644
> > > --- a/drivers/gpu/drm/xe/xe_validation.h
> > > +++ b/drivers/gpu/drm/xe/xe_validation.h
> > > @@ -7,9 +7,11 @@
> > >  
> > >  #include <linux/dma-resv.h>
> > >  #include <linux/types.h>
> > > +#include <linux/rwsem.h>
> > >  
> > >  struct drm_exec;
> > >  struct drm_gem_object;
> > > +struct drm_gpuvm_exec;
> > >  struct xe_device;
> > >  
> > >  #ifdef CONFIG_PROVE_LOCKING
> > > @@ -66,4 +68,109 @@ void xe_validation_assert_exec(const struct
> > > xe_device *xe, const struct drm_exec
> > >  	} while (0)
> > >  #endif
> > >  
> > > +/**
> > > + * struct xe_validation_device - The domain for exhaustive
> > > eviction
> > > + * @lock: The lock used to exclude other processes from allocating
> > > graphics memory
> > > + *
> > > + * The struct xe_validation_device represents the domain for which
> > > we want to use
> > > + * exhaustive eviction. The @lock is typically grabbed in read
> > > mode for allocations
> > > + * but when graphics memory allocation fails, it is retried with
> > > the write mode held.
> > > + */
> > > +struct xe_validation_device {
> > > +	struct rw_semaphore lock;
> > > +};
> > > +
> > > +/**
> > > + * struct xe_validation_ctx - A struct drm_exec subclass with
> > > support for
> > > + * exhaustive eviction
> > > + * @exec: The drm_exec object base class. Note that we use a
> > > pointer instead of
> > > + * embedding to avoid diamond inheritance.
> > > + * @val: The exhaustive eviction domain.
> > > + * @lock_held: Whether The domain lock is currently held.
> > > + * @lock_held_exclusive: Whether the domain lock is held in
> > > exclusive mode.
> > > + * @request_exclusive: Whether to lock exclusively (write mode)
> > > the next time
> > > + * the domain lock is locked.
> > > + * @flags: The drm_exec flags used for drm_exec (re-
> > > )initialization.
> > > + * @nr: The drm_exec nr parameter used for drm_exec (re-
> > > )initializaiton.
> > > + */
> > > +struct xe_validation_ctx {
> > > +	struct drm_exec *exec;
> > > +	struct xe_validation_device *val;
> > > +	bool lock_held;
> > > +	bool lock_held_exclusive;
> > > +	bool request_exclusive;
> > > +	u32 flags;
> > > +	unsigned int nr;
> > > +};
> > > +
> > > +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct
> > > xe_validation_device *val,
> > > +			   struct drm_exec *exec, u32 flags,
> > > unsigned int nr,
> > > +			   bool exclusive);
> > > +
> > > +int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct
> > > drm_gpuvm_exec *vm_exec,
> > > +			    struct xe_validation_device *val);
> > > +
> > > +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
> > > +
> > > +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int
> > > *ret);
> > > +
> > > +/**
> > > + * xe_validation_retry_on_oom() - Retry on oom in an xe_validaton
> > > transaction
> > > + * @_ctx: Pointer to the xe_validation_ctx
> > > + * @_ret: The current error value possibly holding -ENOMEM
> > > + *
> > > + * Use this in way similar to drm_exec_retry_on_contention().
> > > + * If @_ret contains -ENOMEM the tranaction is restarted once in a
> > > way that
> > > + * blocks other transactions and allows exhastive eviction. If the
> > > transaction
> > > + * was already restarted once, Just return the -ENOMEM. May also
> > > set
> > > + * _ret to -EINTR if not retrying and waits are interruptible.
> > > + * May only be used within a drm_exec_until_all_locked() loop.
> > > + */
> > > +#define xe_validation_retry_on_oom(_ctx,
> > > _ret)				\
> > > +	do
> > > {								\
> > > +		if (xe_validation_should_retry(_ctx,
> > > _ret))		\
> > > +			goto
> > > *__drm_exec_retry_ptr;			\
> > > +	} while (0)
> > > +
> > > +/**
> > > + * xe_validation_device_init - Initialize a struct
> > > xe_validation_device
> > > + * @val: The xe_validation_device to init.
> > > + */
> > > +static inline void
> > > +xe_validation_device_init(struct xe_validation_device *val)
> > > +{
> > > +	init_rwsem(&val->lock);
> > > +}
> > > +
> > > +/*
> > > + * Make guard() and scoped_guard() work with xe_validation_ctx
> > > + * so that we can exit transactions without caring about the
> > > + * cleanup.
> > > + */
> > > +DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> > > +	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,
> > > +	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec,
> > > _flags, 0, _excl);
> > > +	       _ret ? NULL : _ctx; }),
> > > +	     struct xe_validation_ctx *_ctx, struct
> > > xe_validation_device *_val,
> > > +	     struct drm_exec *_exec, u32 _flags, int _ret, bool
> > > _excl);
> > > +static inline void
> > > *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
> > > +{return *_T; }
> > > +#define class_xe_validation_is_conditional false
> > > +
> > > +/**
> > > + * xe_validation_guard() - An auto-cleanup xe_validation_ctx
> > > transaction
> > > + * @_ctx: The xe_validation_ctx.
> > > + * @_val: The xe_validation_device.
> > > + * @_exec: The struct drm_exec object
> > > + * @_flags: Flags for the drm_exec transaction. See the struct
> > > drm_exec documention!
> > > + * @_ret: Return in / out parameter. May be set by this macro.
> > > Typicall 0 when called.
> > > + * @_excl: Whether to start in exclusive mode already in the first
> > > iteration.
> > > + *
> > 
> > Same comment as above on function xe_validation_ctx_init wrt to
> > arguments.
> 
> OK, let me know what you think given the above.
> 
> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > + * This macro is will initiate a drm_exec transaction with
> > > additional support for
> > > + * exhaustive eviction.
> > > + */
> > > +#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret,
> > > _excl)	\
> > > +	scoped_guard(xe_validation, _ctx, _val, _exec, _flags,
> > > _ret, _excl) \
> > > +	drm_exec_until_all_locked(_exec)
> > > +
> > >  #endif
> > > -- 
> > > 2.50.1
> > > 
> 
