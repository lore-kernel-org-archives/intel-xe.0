Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06902ECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 06:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19DE10E023;
	Tue, 10 Sep 2024 06:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVc02vec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EBB10E023
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 06:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725949009; x=1757485009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XhDMuJKrro2conFZKFM+IiEfh/xZrQduoHxCM8ThNXo=;
 b=QVc02vecsiBVaFh7SHc7UW1+c6C0qjXi6lAF3y+bdT4SJMWTgVm8RNIJ
 9qxJ7+DeNSgl6x6tiHr7nVfrou9aufBpyZvlxHSQCJg8TqHG2fsS+Zmq5
 4Usx3hwrtrw5ZJBWgfgm4F5bx/9RJBQ8Bzg1lEhMVFTcZCCmqMYkVxRNZ
 EZqy2UVt1BcGTmWgaBk4W/AQK7kkWrKRrkfA3s7dVrY9c7RH0SsyF5N/F
 KFW5J/377I6oS+NTH47rwtERI2LlkzwTygh+bLEvc7/UBbMKrYksTr02X
 G+cNve3mEhY2eXLOqaQaAhDEkfyWXyBSgp6NWJe7xHCdC1ZlWA6QNswd1 A==;
X-CSE-ConnectionGUID: WbRT+R6RT0Ohwr84zt1Xtg==
X-CSE-MsgGUID: ql8/ZQ7dT/eA0mX/cY1FvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24784428"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24784428"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 23:16:49 -0700
X-CSE-ConnectionGUID: ZEXu/79YQV21YKQ21EdkyQ==
X-CSE-MsgGUID: CMLZcZHWQ9Sbu+Szong8MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="66871611"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 23:16:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 23:16:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 23:16:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 23:16:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 23:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHdNuHGTneOrbxy1vPvN0Lf+GF05CW19VBJAe1RpaQqHqsziHVAvuhBLzuTdX02XgYXPPfVbp28TCS+AFxUvYmeu/1PAfGoyU0POXvgig0nr0+G3FH/i1j5jIG9LtUMp52hfhR3wTV+i3ravfdOHF1iCtP1mAVN1COu6+xNY9nfYj+2XIsK250fyaYuYneXrIud22p0QUn2lO19SsUcQBwxgoMftR67A8U9DyEbZnV/NxU7ofBG9O3oAQlsOHqhKTnndoFr6tIZU7fIo7swpHW9nVu5oN3c0zjCggGU4ahpRHCERqSqdDmyJ9hxrRGZwGcDhWJ44dnAvKJi0uOvFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxalhT3i+TWECSjb5z0xpDTiKqKZMGo331M2j2UnPR0=;
 b=zBlQp0BHNxHcXdykcvLc66IAmnsMd9qfLy8wq0ZcuAEYN5p14GFXN61UgE5VN6n/O9Wi/lk17FEKJHztjooF/v/KrLjekP7lnFvHllpS+Dbu4ZxwG2DyL3+LRHNtE7wAo1cPcD2I8WbuE98LFX3UIl69Fqf57FtkbQdmz5X/Xu5qGr1i3rhQVGcU6rajnT6fTJhXe0DpD9Ga04DnmcLWDmGR4KJUNguBIFFfHRD9sPhNmnI+oO/W9SqN24BbIXljDR0iOVs06izvY7Hbh02qX9AFEiTq9/vA6aFrHt+SgBjIKrIDqko1FoTSphvMQtsFNsVv4E4JWo3vqbgXG4N4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY8PR11MB6844.namprd11.prod.outlook.com (2603:10b6:930:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 06:16:45 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 06:16:45 +0000
Message-ID: <6835f633-d7c9-4058-aaa0-bfc4055b13b9@intel.com>
Date: Tue, 10 Sep 2024 11:46:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm/xe/ptl: PTL re-uses Xe2 MOCS table
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Haridhar Kalvala <haridhar.kalvala@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-8-matthew.s.atwood@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240906215153.31210-8-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY8PR11MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e50267-7fc6-4cbf-7b28-08dcd160251c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnpNOXUycWd6Vit2VkU4RDV5QTFhdHg2MDVXb1NScXdkRUFVZEQ3N09KcTZK?=
 =?utf-8?B?RS82TFROUzZMQTVMSGp0OG5wNzJmWWwwdEx5c3ZIL0JucXBQei9PS2E1c1ZJ?=
 =?utf-8?B?eWswcnhnalpZNnpJNXFEMmdJdDljaUhLdFQ2bW1ES0F2ZUFONVIzMjRUYjNU?=
 =?utf-8?B?ZGN5dU5lb0ZMRXQzcmtXcXRJd01NUWh6RXdyVmVZTnBDdmFqeHoydnhiWDZh?=
 =?utf-8?B?a0h3WXIrVU1tYURjSWdwbjQwZkwyOElWcEdjcktic2FYd3ZISHhYcmUzTHlo?=
 =?utf-8?B?Wk1xM0ZGclMyN1VCc2twNjZQQlR4b216S2hHc2ZnVFUySlN5N3ExanVTL2xs?=
 =?utf-8?B?Z0JjRzUwZ0NsSnV1eTRNbDI1WHZjTHBzKzRSRis1cnp3a2pXWG9LWjluOUYw?=
 =?utf-8?B?MW1XVGwwcE1TeFB0c1BmR2loUjFFYkxLMnZKbFVvcVFmUWlEd1ArVGVqUGE2?=
 =?utf-8?B?YS9ObEo4T09FczkzajV4WE5YZjlHQm1OUFc3aXdaandyLzV4eEVRenJJNDdJ?=
 =?utf-8?B?NW1pYmYvQmhGdzhmaDl6Q0JOVEErTllzcGdVbzlPbWZHbVY3d2hPMFBjOEha?=
 =?utf-8?B?VVdDZXMvdktXWUhBU0wxdzB4OTlMM2tzeFdOU1kzZ0JOSTJiT3VpMnZBYXNH?=
 =?utf-8?B?QlAvUEw1ZTJFM1pYVUtlT2FGMENaMVpDSjJOTmFSakFzd3ZtNmxxL3l6Smhp?=
 =?utf-8?B?WDhPYm1Sc3FseWFZYlN4dkdjYXdQZlZyT09va05jOFQ3ajgwMTZMelU0azBM?=
 =?utf-8?B?Mm93OWQraEhzcjlMc2ZtMk1nT0EyYUlmVWtjRU1odWhUNkEva0RGbUVMakM3?=
 =?utf-8?B?MlF5akQrdXB0cVljNC8vc3BKSGFqa0JwNFlteXJMdEFRYkxJcS91T1dtVC9i?=
 =?utf-8?B?V2V1clZtVDJ0TkF0S2k0ZjR1SlJPL0FZdzJSVTVSYVNBcVR2UmJ6Z1J1b3Yx?=
 =?utf-8?B?ejBPWStISXRyMHNKK01EeFVxdmNhYzVURzJuN0xIL3ZuWEFDc0loNTYvbmlv?=
 =?utf-8?B?bURNMVN2Q1dLSEtCNnpGQnJZSHRSSFFXaUlOUkFJY1BuQzZUSlo4VXZOMTdw?=
 =?utf-8?B?RTZMc1VwWW5EVWJyUENwYzJjQ3B6dG9TdXlEY3RxNEhhZ3JhTEYrTUhjT3Q0?=
 =?utf-8?B?YTF0NENKS3p4b3NKMk56OG11UVorS2FmdU42N250bGlmUlNGM3ZmVityZHc3?=
 =?utf-8?B?cFFRaUZLMVo2TGI5cW1TUEhQR3o0ZzJEOTgzbng3ZENxV2JkbGtsRTJod0Ur?=
 =?utf-8?B?d2x1ZnluZ0JsRzZTZTBFYnhsbEF4aUhzM3ZneGRRS00yQlZVSE9BUWEwMTBq?=
 =?utf-8?B?M1FhRU5NWDF5em1YYlFjd2N2SEJZZDlTWmdzUXkxaTFRd0MxZENoaWJYQ3dT?=
 =?utf-8?B?bTJsMmNsRUdUU2NxSlhEbzBvTVhmZHRTelVWcG5wVXBWcFd6c3d4RytKNWto?=
 =?utf-8?B?cmY1ZlM2Tmg3ZWxxOU5leW4wckRDYjhOUFRmL09hQzJOYUZETzJOSUF2NW9t?=
 =?utf-8?B?eHM0THZTcVgwa0V4dkpFNVc5bjcraDB4Zlg0WjJMSW8rblNFS29nYlFraVJK?=
 =?utf-8?B?cldKTHBzQ2FqMktrenZZclFNWmUwTVdQNGJCYXFqRXFRcHc1bVJJcjRSR2w3?=
 =?utf-8?B?WXJNTUR2OGFDOWhPbXNERjZCSkVmVW82ckwzVGVLaysvQy9ySGxDV2NFSEZh?=
 =?utf-8?B?ZkZKdFlqM1J1Y3l5OWk4MWRGVEc5dnBTRUJmcThIYUQzWjIxcjVINVJQaHA3?=
 =?utf-8?B?T2VQL2pQbmlCcU0rNFJRT1Z1VS9aMjJ5WGtjbTJxRU1JUmdSbENBQlJ4d2lx?=
 =?utf-8?B?WVVYYktOMGNPOC9UK055dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGJrYUkva1cwT01NZHE3dHhIZndxTThzSDJIL2MzajBlaU92T01lNThyVkFR?=
 =?utf-8?B?SzVuUXpOVkFNVVJJOVFLQWU4STkxbytjRkhnSnllSEltSEFGUG5oeU50Rzc2?=
 =?utf-8?B?RHBoS3JuU2Z4VVRmZmNXNmNCaXVHenhsMUwrbE9sa2F4WVpldkFkdTF5RjFn?=
 =?utf-8?B?bU85c1psanp1V2xvdk5LNTdlWXVoZy9zVFRadHBYWlpRUmtTZjJEVzMrL2Er?=
 =?utf-8?B?am5aNTIwR3Yyc3haVmFYVFZMUGhUdGtyS2FqNGhMeUpLY3I4d3dlRFQvNjJW?=
 =?utf-8?B?TTNwZjBHZ3hVZklieCsySkZ3VUFEWUcrSUhKRkt6T0FqWG83bkhEWjZxZUR5?=
 =?utf-8?B?YlFLdnNZR016T0lFWUFROXl0UWdmYmZCZ2JNOGRwYXc0MGlCamMxOEp5amN2?=
 =?utf-8?B?cG5zZEhHNWJVK3ByWUNGcFdnUUdjcDhVRGlnellicUFHRnpuMVVxOHVnK3pa?=
 =?utf-8?B?L1lqKzdDWFZJRXJSNFJFaEdXNzRWendSa3JKNkw4MThzYlRxQXBYd3VodHl1?=
 =?utf-8?B?d2cvQ2poZFRJR3F1cERKdXJxN0pWWXJwODZyTDZvMm5BOHdIQWt3RmFnNER3?=
 =?utf-8?B?NFBWbzJWRWhhS1U4U2NXUjFpalpCZVZSZTQ4Q1piNmFHekVIUGRnblh6eE1P?=
 =?utf-8?B?b2hxWVc2OUc1ZWFUakZpTm1lVnFTSXVwOWhESmFabmwwcTU3c3JkSDd0YTdJ?=
 =?utf-8?B?WGZHTXRGWU1VZ25jNDdQcVR1L3dORGdwVXNtSDlreEhTUlNjRkhDK2VsOVFI?=
 =?utf-8?B?NmFrSTZnSHlTaG9DMWhJV3VCZ0s1NTVQUm0yQUxxamhZejlDT2FoWVBRVUZZ?=
 =?utf-8?B?amxBbWpsUjRabm95bnNsZEg1RTRjYXZOQUU2Yk5HQnhsSnd1dTc5dVlIYVdU?=
 =?utf-8?B?cG41eEg4ZzFDd3NDVkFXcUxNdlBvdFl3VmpHS2dINStBcDE0L3IyZUJOUTFr?=
 =?utf-8?B?dDlZTXN3RlFkeHA1ckw0OWlHeUxlMGJnVDhCRkRoV0FGMFNkY3cvRW00SWZ0?=
 =?utf-8?B?MmtXbmZGdURTcm5SSU1mSjRCdmUzUjVxaFlzMlEveUdsQWN4cXJXRzNwR1FW?=
 =?utf-8?B?dTRhVFZUNytLd2FmY1dZN2FPVkN0M3A0M2xybjNJem12amR0eUpmOUNkTnBR?=
 =?utf-8?B?OFlHSENNeUJ4UmJKRndBYWV3VnBWMVhsYnZ4NmhoREgxTzczMTBQZU95cTRs?=
 =?utf-8?B?bDBKbTF0OENkV3BoWHZBTzdPZ2JMRVl3VlhOeDBqVE1iQ0lyTGlWMytVNVox?=
 =?utf-8?B?NzRtbTJKTExqalhpUVNRUVVXV1B0QXZQRTZwMnJSOThNakFaMTJpR3FsRXRj?=
 =?utf-8?B?UzdubXBPamhVZUpkNUVlVlpKUStOM3hXUE5KVHh6OE9VZjhEWm93dGd2TFoz?=
 =?utf-8?B?aFVobDdvaEIxQ21BU2xPTW1kVjJ3Zk84NUpmMTM4VUQ3akdFaTJpS3lGb1Br?=
 =?utf-8?B?TzIzZW05WGtpZ2twa3dVbU9wWVkvMzZMYlZDZ0dheXJuSTYxcUhJYStwa1k0?=
 =?utf-8?B?Z0E0eDFKSHNWRHkwZVhUbmJqbU1INTMxV0F3QmY1L05jSHRncjFlUlJLcStz?=
 =?utf-8?B?bXQvbDh2Tk1pVjhTMFRaa2tkbzVWMWVqRDVZT1lrd2VuVFRXa29RUUxwWHBF?=
 =?utf-8?B?MS9hS1MxN0l1QW54QVBzRGhzVDY2Z1ZMcHFERXI4TnFpcGsySnJCcEczN25O?=
 =?utf-8?B?Z1hLSUNOTlIvZUk3VndJM0ozWWVJUGR6U2dHbEhwNTIyYUc2YkJYdng3cDRo?=
 =?utf-8?B?RDRYd2tRYmhKL3VBcmszZG9UY01EZGZwc0RNYVVHQk1IV2oyTzFCa3l0S0E4?=
 =?utf-8?B?NFh1amFvWmh5QU41WXc5TjVUQnVZMHdBS2p0SC9DVEphWittNkNvOGNXU2VM?=
 =?utf-8?B?VVhhTjJ1dEtncDhWT2VRV2xaZGNOdnVZNFNOZXR6NGhETE1FSDdQeS9BOWFL?=
 =?utf-8?B?ZFVCaXhXUmJsUnJnTlNSQ1Awd2dnMzR2RTFxN0hERUtRL1UxZE5LVTE5cjBX?=
 =?utf-8?B?NGRpbFNyZFdrYURFVTlKeDVENTlYenlEQWE1cTQ5QUUwK09BTjVFVUVZcmVl?=
 =?utf-8?B?SnplcmNhM0VNR2ZCYnFMcStHREZ1aE9yR21sT0lyRzJSUm05aHFkK0FvQjMz?=
 =?utf-8?B?c3FoSFJzekFwMmgydW1LNG1ScU9sK2tETjgwbjd3dkhYN1VobEVJQXRmT0Rs?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e50267-7fc6-4cbf-7b28-08dcd160251c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 06:16:45.2439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaESHFg9wbBZ0wYdDd8xB8+bG1bHK5hRykTwYBwpep8UvAZYbmYiftfDJtT9BMubwNRxaZHiPqD9O6a1pmWEHwovlrtCqhCryVH4UOSkyT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6844
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


On 9/7/2024 3:21 AM, Matt Atwood wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
>
> PTL is Xe3 architecture but there is no difference between LNL and PTL
> in MOCS table.  So, PTL uses the same MOCS table as LNL.
>
> Bpsec: 71582
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mocs.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 7ff0ac5b799a..51c192f3fdfd 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -576,6 +576,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>   	memset(info, 0, sizeof(struct xe_mocs_info));
>   
>   	switch (xe->info.platform) {
> +	case XE_PANTHERLAKE:
>   	case XE_LUNARLAKE:
>   	case XE_BATTLEMAGE:
>   		info->ops = &xe2_mocs_ops;

-- 
-shekhar

