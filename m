Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D712EC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 15:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4384610E10C;
	Fri, 31 May 2024 15:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yv9W1C0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A0610E10C
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717169225; x=1748705225;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HYOS+z82OTCPOBXRt7Z4eNB9WCmiQ8g82atChexkRkY=;
 b=Yv9W1C0WMmkwYOTDJeqobF7slqMhe4qY5qactXYFRZ+d0Dbpk/9TMTkp
 cTETTF1XVJy1GkuC7O3eaB349E71mc9JtdxmqCPxsp50+kvqW/dSK2ajA
 tOfaqrpEIvZPbB8Qdq49oMEi1FgbczVf4k1pjtXeyW4hL/YuSCeF1e4vK
 0J/BW9IvonqheXP28v4fLzLvOcZvXlm8SVmvqJLvjRNjfH8T9UncJQNqM
 pbZwMn1S5icDuNZXpRfBUwjcwmxv/Rq/tXFb3NL7CmmvdiMMmxLRwIMbV
 1JFwvGke2WxjLxeo5/EM+p99hK8avPEDJidBFQBCbPF7lFfsbSOibEJO4 A==;
X-CSE-ConnectionGUID: ril6LR5GQbOjnVXVxj4JuA==
X-CSE-MsgGUID: EQNgRRaPQsKCUVlp0dhGbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31212500"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="31212500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:27:05 -0700
X-CSE-ConnectionGUID: T6qOTXGYQOeMtfH6xdaZzw==
X-CSE-MsgGUID: yUIOjrZjQZGbSJK2INKCPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="40626315"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 08:27:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 08:27:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 08:27:04 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 08:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfwDLHEiHw6l9q0EXTfpTLVBxE3XHTIhtszzLeEITVEcWIACsdIw3w2x0bYGhc6nOm8C+3j4i1rFxbw6WlEfV0sN333KV21MW3Reo4D03sKLyWVM+fgYBUYWApg60vCJQRismdT0vIOJAFBOVNBZCzCB4vhcAB3zjLLXydxeaydk1iCg9fgR2udBmT193xu4fBOBLrMEFX+7xsV868pdcef1fg8fQt63yk45HCk/FBIowZdLpHW48f/0rFuClVd/Armdvv00hXCuN+filPEJF9OXFXhMCUyxAOXL5XazCAnbceJvS4rosem3gAVWkR8aZHGERN/rtPja3/VAR3OmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+h4x4n0CYEdLtB54qK5AtvJVM3WMv9lVYr6QNg75LE=;
 b=FgxIc16Kw5zFwhwDP4qwqcdHVVQ4qxW/MBFoOdN/iG1ULe78qbi3xphHr319VksTaYGcq7jR9x+4ZMhpEIkxhZPODrXjgvomz64fD+Ti/ZcLqEZT7mdFTMCYlOmI1TG+CC7bpj/lEsX/NbO7reV0K+y5Hg14ZGidZSl+nn2jYCEg979ugqy2Oc3CoJecol7K2tmCVnxsXpQL157jqtVcyXGORw4yQHWfvsLJRTca9J1uFB48vRFZ/1PcmYvuNYB9gjrW93y2ryQ88LMTZik9FW/Tzlcy8F9eSTKv9oejbex4E8B0sWyKqE5BdYM+avIJ4eh7ScuEbXqWuDxAc966Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Fri, 31 May
 2024 15:26:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 15:26:58 +0000
Date: Fri, 31 May 2024 11:26:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Message-ID: <ZlnsPgvMTx_iiPqc@intel.com>
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
 <20240531064845.930740-2-himal.prasad.ghimiray@intel.com>
 <ZlnOVvmtsrWS80Ff@intel.com>
 <41051b48-6217-46d2-afca-ba3d11c61daa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41051b48-6217-46d2-afca-ba3d11c61daa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8382f3-86dd-4865-f22c-08dc81861c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bafHcYPswPlW9z5H3n3EvYBk05RZHXtacIov4PvvXAX7uBQKJo0l1bXM3c?=
 =?iso-8859-1?Q?Xp2S62ih+7JEnQuYYETmuK5boNxj7RKBz3dbpn3Ijc56O7efeoDiCk4LWS?=
 =?iso-8859-1?Q?yYxPaWajfyCyzVUOuvmH/VntHAJ3/qe4F8SKfhQOEVpJcXjnws+uRhXr64?=
 =?iso-8859-1?Q?XZ8tW52Bj46yC6xOd3larJhzE2SRpT7NDjv/iWfMAIKi5TcS0MhWeFxG9M?=
 =?iso-8859-1?Q?N3i8d7D9dEhVKOm3MlWjaw6opTLf6YYvV3PFPWrbiDp7J581PEHdepYrvv?=
 =?iso-8859-1?Q?yaabNJaEo03Ao/k0S5ol2H18zQ1okfyJTyD3QcdUx4bZo9Wq6+ydRRzu/4?=
 =?iso-8859-1?Q?4NKkJV7HXKT6ia19mKkqZNzCO06K6SBjKOZU+AEF5inwDm5Kco5B3O1UK4?=
 =?iso-8859-1?Q?vGFD9fhITDZHh0HKftx0iRGt9tcH2sQB09Y1mL3xCmEZl5KYuO4FLJxIT4?=
 =?iso-8859-1?Q?paC96gMz6HrI1IocCcpHMQDDokk0OmP6dE51LXQp7EnRQRM6FyKki5po61?=
 =?iso-8859-1?Q?a0B4iSyPPR6M2qaofkCTSXPpSEQK49U8VF8QnjPtONTeorxkJXYgPTEu+D?=
 =?iso-8859-1?Q?QfqEp/Z7N2n18jdqQb8uyY5ADkyp/UXdpZiTVXyldi6ilcz5vMG7CKbZqc?=
 =?iso-8859-1?Q?cZObcGOM/k4PuXm3LV/rqYyrtC4knRZAHr7SP1hlBvf9K54X+3oTjB5C5J?=
 =?iso-8859-1?Q?pg/wYD+nZ7TzAfJZpUeEs9vTJu8m1m3MuJuTe4Ms9/HvDa+E8be6++YP/y?=
 =?iso-8859-1?Q?V3m9ddQ6RQp6m/68ptPrZFb9ortzXlFcSHVariVc1Ln+HKMAVS+bLijERN?=
 =?iso-8859-1?Q?dxqjRj7QEgZsjmmHNwt3EzbrR/NsCVKUdr3y5wpQOz7SXQAu552N9c+Ex7?=
 =?iso-8859-1?Q?ICwPHi07p9C4XiP1tVVUfiYc0MAVSznXM04JlZllTcFH+CnsrhCBvV/i55?=
 =?iso-8859-1?Q?qEfwFZdz+2JLIPc72hYLUdLQiFbzX2gshhKKW6XfgO1z9+kqFeGSHXI9Xp?=
 =?iso-8859-1?Q?2ojpFLb2o/IcvtYACpB6fYu0VC1xtoBYcQqaVLOlQAtY6Bh/1WzVi/58K6?=
 =?iso-8859-1?Q?pqCtEf4bdkBXLqXKoCo5TcOmbQS8uL1ifkq8Q5Y3sE9FvSwya+FJv/47uq?=
 =?iso-8859-1?Q?Y6bJVZ6NWrwGVXxQzvmAy/jnA49NzYQRn8HbHqFDi6S3c0RT3UIW9IfL4D?=
 =?iso-8859-1?Q?CR30Ci7T5YiT8mwtWNmkjt4d+FQdFhDDIUVqzV8vB3Asp1IvObK25AK73r?=
 =?iso-8859-1?Q?sq9GUkKlgR5Ej8+yEnMsKhY8yrDSglfEL9kVH2+StigwnprKEwOgeNYELR?=
 =?iso-8859-1?Q?DArD4pPjJXZaoTtynqOcEyeZBw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UEViNv0tHaa0LkX4CoFEdLrP7VjT2nmvpjvA0h4194A0gNZ9X3ciC2VzZv?=
 =?iso-8859-1?Q?/KbWdItN1wxIVO3Gh7Woya8Zrla24PN2e5oWm7SOJtv+K+AbWDP0cAQSNW?=
 =?iso-8859-1?Q?8pLn9/PFxNtSXhjbPrq2fztdNynYCog7ILpeLvS9PkVi3EoWCUjiKpwCHh?=
 =?iso-8859-1?Q?6CRtWX1n+iiDDcflR9DwjQcEOOBIJpZQ/GaWkeJrv+CmGjIDS5ZTVtLaDh?=
 =?iso-8859-1?Q?0RO1LxEW2mSo83H2yNsuchYcPUnMKNmIqT7xJpKRTZQkQEsFuKpyqmNyt2?=
 =?iso-8859-1?Q?VsEbElOtp77ab38X8SEC4Ji/Ox+QUAJpxSROcCouQPLtT+8XW15QMnjZJr?=
 =?iso-8859-1?Q?L0bOPHyzSRHzyXDKRCDRWhnTRYvz8cNwNw2tiBEqDDgA30I1hKMzdrFM7N?=
 =?iso-8859-1?Q?n4E7jUKj+jv1g1pCa2wrYQZ1o+dnAqKuPOMqPULQGl9vfFENW1im+4hGeT?=
 =?iso-8859-1?Q?RlGorcVUxJqPoTSzPBKEVSLannETM3XkaqX5deHfjFIL3fr+XoYAkj1SP5?=
 =?iso-8859-1?Q?FmZOiV4tI79cUQI6iZNeH8ucz+kR5VpF9R/xJ08jsOgmMKwtaHXbr/tA7T?=
 =?iso-8859-1?Q?mXIrYhcrNwGcYlEwz1twv8ZQNQBjPVFuJGaNpdBTrsiIcEcSRZN9bfu2IP?=
 =?iso-8859-1?Q?cgTb6nkx83TAdEnOnL+DNDXMoo6MmLZSFSZ4wLVwd/18O+KEWk3IAAxGxc?=
 =?iso-8859-1?Q?RXq1jugEyfURxYy5YyBjo9TtJ5ZmsABPFmtNBo2hbJ49FaABJ+aAedopuu?=
 =?iso-8859-1?Q?weHwFAZlAiOwO/cHzlYgTUFmJFKmhxmafKbhBS3BE6WBrwy9Ns+zvbe6+O?=
 =?iso-8859-1?Q?BMMtotVoPKE+FKjpE8MZDltNwcAZeR/RuCklA9BG4QLjObsDecEj0AZme6?=
 =?iso-8859-1?Q?KVhn9m4g3QwyyIWIXCjuL28l2M6l4qRmLiHsy8bMSglRTM10n+L9XgOubc?=
 =?iso-8859-1?Q?hFckqHpXVZlYM5wyc1cnzQzids9Hnrur/g6lAic74chau1bdvrN+dEM1qa?=
 =?iso-8859-1?Q?9q6uAYTEp5K9Y0eLl6qeL7pzuGMFyH+UU2+1H2DqWGpWANrC9liW/hU+BY?=
 =?iso-8859-1?Q?7uAtxE9szY7RDvDqNuuKg25eTp5V12DkwsxDwsab8mRZz3wiZuie55+Cx+?=
 =?iso-8859-1?Q?aIJaaCRT8E2wmuON5xWGYmm8Qkul60bvuL/UWvzpwsdN+nXjcV9DMpgFMk?=
 =?iso-8859-1?Q?BStciD2rPaB8w5ZuzoQYHmpryJ5i/CJXgGgs6uPeNVL6/j5F7HcjWygNuu?=
 =?iso-8859-1?Q?4NdzYOfwVjAzSp5EZjLC/aLTEEFp21AILhbI1KJMHg50z397HD9cm8kVC8?=
 =?iso-8859-1?Q?4DrxxtRtkdWDgWSm1j7Ehcew3FzQPm76eET+Qwj8295Cdj99vbQTc95FQ3?=
 =?iso-8859-1?Q?oU0LGHA0W/S8MGyAuZeRCQedxBML4zoqlmojAXF2xq9UJjcfYXN5Cf+Njr?=
 =?iso-8859-1?Q?Y7PE1wbXtJSisqVtsQ+Qm2pGwDJPs38k9zHV500FztaDv1+H5UN3Fd/SNs?=
 =?iso-8859-1?Q?Einy7V/o54LuZNocARv5gP1vVywrA6OrvGInAa9A2N+8Z4rKR6brJ7J+Go?=
 =?iso-8859-1?Q?HXxOJZ98HM1Kxaz6TZTAeeRRhzomN6C4nkZqMxM9XySoZxBDOidb+f0DMu?=
 =?iso-8859-1?Q?wikzi4+fF1ZiUvZwkKluoC7Hhmw9YheZXs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8382f3-86dd-4865-f22c-08dc81861c29
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 15:26:57.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eVJRBknu62WQRBjRchSA3u96Mu/ukyU7qTwopT2Zr46N+264xzmOjBfzPyv0Hyadr+jcTIHjBYY+qt3N6Kl8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6718
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

On Fri, May 31, 2024 at 07:26:33PM +0530, Ghimiray, Himal Prasad wrote:
>    On 31-05-2024 18:49, Rodrigo Vivi wrote:                                     
>                                                                                 
>    On Fri, May 31, 2024 at 12:18:45PM +0530, Himal Prasad Ghimiray wrote:       
>                                                                                 
>    >Make sure that the assertion condition covers the wakefulness of all        
>    >supported domains for XE_FORCEWAKE_ALL.                                     
>                                                                                 
>    The most important part is missing here: why? what issue are we trying to solve?
>                                                                                 
>    Hi Rodrigo,                                                                  
>                                                                                 

Please avoid Outlook...

>    AFAIU,  xe_force_wake_assert_held is designed to trigger an assertion if     
>    the provided domain is not awake, which works correctly for individual       
>    domains. However, the assertion condition becomes incorrect for              
>    XE_FORCEWAKE_ALL.                                                            
>                                                                                 
>    For instance, if we assume all domains are in sleep mode, invoking           
>    xe_force_wake_get(fw, XE_FORCEWAKE_GT) will only awaken the "gt" domain.     
>    Subsequently, another function needs that all domains are awake and          
>    utilizes xe_force_wake_assert_held(fw, XE_FORCEWAKE_ALL).                    
>                                                                                 
>    In this scenario, the condition will inaccurately return success because     
>    fw->awake_domains (0x1) & XE_FORCEWAKE_ALL (0xFF) will still be 0x1 and      
>    Ideally it should have asserted.                                             

It makes total sense. Could you please ensure that the commit message include
this important reasoning?!

Then, the other commit also needs to explain why a simple
(XE_FORCEWAKE_ALL & fw->awake_domains) == XE_FORCEWAKE_ALL doesn't work so
the supported/initialized domains needed to be created.

Btw, perhaps initialized_domains is better then supported?

>                                                                                 
>                                                                                 
>                                                                                 
>    >Cc: Rodrigo Vivi [1]<rodrigo.vivi@intel.com>                                
>    >Cc: Badal Nilawar [2]<badal.nilawar@intel.com>                              
>    >Signed-off-by: Himal Prasad Ghimiray [3]<himal.prasad.ghimiray@intel.com>   
>    >---                                                                         
>    > drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-                             
>    > 1 file changed, 6 insertions(+), 1 deletion(-)                             
>                                                                                 
>    >diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>    >index 83cb157da7cc..4c986d72cba7 100644                                     
>    >--- a/drivers/gpu/drm/xe/xe_force_wake.h                                    
>    >+++ b/drivers/gpu/drm/xe/xe_force_wake.h                                    
>    >@@ -32,7 +32,12 @@ static inline void                                       
>    > xe_force_wake_assert_held(struct xe_force_wake *fw,                        
>    >                          enum xe_force_wake_domains domain)                
>    > {                                                                          
>    >-       xe_gt_assert(fw->gt, fw->awake_domains & domain);                   
>    >+       enum xe_force_wake_domains is_awake;                                
>    >+                                                                           
>    >+       is_awake = (domain == XE_FORCEWAKE_ALL) ?                           
>    >+                   fw->supported_domains : domain;                         
>    >+                                                                           
>    >+       xe_gt_assert(fw->gt, (fw->awake_domains & is_awake) == is_awake);   
>    > }                                                                          
>    >                                                                            
>    > #endif                                                                     
>    >--                                                                          
>    >2.25.1                                                                      
> 
> References
> 
>    Visible links
>    1. mailto:rodrigo.vivi@intel.com
>    2. mailto:badal.nilawar@intel.com
>    3. mailto:himal.prasad.ghimiray@intel.com
