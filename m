Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E55FCDD560
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 00:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459CD10E15E;
	Thu, 19 Sep 2024 00:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Waln+DNr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DAE10E15E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 00:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726704748; x=1758240748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g06CaDslFP7O7RnWiW22rykrnzxorckWP/5WnRxMqM8=;
 b=Waln+DNr/mWB9EPTSZx0rhmUIF1jMOHB6S9wlDBY0LDnJEzYGn4Iwg/X
 M66f1y1RxkQ14079+nkON9tM6IGRrGHcqlJwDc1VNumBha/Lf/+Av0Ykk
 pgJT7TUYBU4+KIHomnvOR3sSuu8Op2CId+z5ppTE3vmyN6J0tSJrwodWe
 0Kh1L1J2UL/y5j+aW9aGevxB9J8XGUQ9AFW7tbw2PUvDGXsozJcaOvAd/
 TFWr3evOnkzzT+4W6zF7yM4U4wWBanFl0Pgps9xjyvaPmNu+hShi3cgkZ
 XfCfsK+r51fZaFCpaOxbVdSnoHEWlsYXdjPLXQljGid++BZ0/iyu3MU8e A==;
X-CSE-ConnectionGUID: e2WnVIcOQC2PiEH5y9WUNA==
X-CSE-MsgGUID: uPKIroY/RCilxYv5dwf5cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25791966"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="25791966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 17:12:27 -0700
X-CSE-ConnectionGUID: 0DB3XbnhRkK3+9mvVLjf5A==
X-CSE-MsgGUID: +DqIkEhJQOOaEcz14rWXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69870959"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 17:12:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 17:12:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 17:12:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 17:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+tqfOcJmHkHbJUUMyYt5r2SDZvdjGfnpqpK77jONPCZ4mAF4QC2gd1LMiVPxaWSqh6i2J++88VPoCozeMDFVfV08ZFL3+9TrbjuIsIomz7Dnwe3ClQ71ONjCGg5EJhPpcZwKcd37Icr4tsJjHGLvdYYT0zLFziqo/BUlWrd4SZqQf/U7i2ORVmxgY0eamsa/7vPh9msBnSmyRDxMVOc2smTtJVpDpC+E1V+eNqikUOOujPbxW8++jifpdpUKPKLWDGx/pqpwga4AJFoZy1EagzadthjAF37nB5FgKYXDpVMJr0Stt2pCbNDw2niloKL6m/duhN07+9qZlDgyVm7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Pgg+8vZKa7JYu/FMt3Ke5+iAw7ucUWi8tfZWiS9dMg=;
 b=EzoFKG4YYSc14Fq0afN5zMIVDg+DLFer7F9Sc6dG+a7+DDF2bj6hpCSG1Tmj7UgiI+8LaPp0W2KOuj121lOZV09ucMgy4pvyJZcQ1HpOdTgp4sp3RS5fUvbLjs7Ay9QC7xM6VyxRs6IZkxIARFsuPlaJZeurX+F+De5YBtJaeqPzlaa5jdEv+VldpNTBYBkhWgfSpMIwPyu2VloGh+F8ppl3gvzZ3kDdZ2eCaXPHldQHKy5O/noAlWj7RPkaygcVvy0/xeA+ZjdY2i2p7hAvgaRagsyrAx3mKoQVptXA4iLHyXZqTl4ugT9HWp6U/Vl+5LohLqra3wrNczgCKSlzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB6984.namprd11.prod.outlook.com (2603:10b6:303:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 00:12:24 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 00:12:23 +0000
Message-ID: <ba4d854e-81f7-49cd-8723-5967d7404e32@intel.com>
Date: Wed, 18 Sep 2024 20:12:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Add null pointer check for xe_migrate_copy
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240918221000.1124248-1-zhanjun.dong@intel.com>
 <20240918221000.1124248-2-zhanjun.dong@intel.com>
 <ZutVzBOBcklkarY1@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <ZutVzBOBcklkarY1@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b9ef37-4655-453f-7cce-08dcd83fbc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmFmdmVqQlZUTm03ci9ZcHZBUlpsV3I2TFV4Sk8vckdpWWVlSlNtWk5EQ3Rv?=
 =?utf-8?B?c0kyWUZWWTZFMm1pZWsvYXJJRnZzbW5pWFVNRWtEWmtaU0hoMEZReDk4cVUr?=
 =?utf-8?B?S0VRakgwQWM3RUJRaVdZQitmYlJPT09uT2dtWXRBbFEycGFmUmdwNVpMRFJD?=
 =?utf-8?B?TnZzd2tvVUltZHA3N0J4MnRZejI4bFJKWUxXY3JLNVFLWXZka3liMjRlOERq?=
 =?utf-8?B?ZmxXTVRhN3gwaDFIcnZEZFhqa3h4NmhGN3MweWwxSEVMT0ZjT2dCRTVJVjZG?=
 =?utf-8?B?MjAzVkxNa3NkMHJ5ekJFeUZEM0pYcXRlYTE4dzQzbjdrbFRwZjg0Y3h5UFI1?=
 =?utf-8?B?L1V2b3FoN0tvL3hCWkhUZTBjUStOMGJzaTR1WEF1Z0d4SWtCSDRQV2RDY0M4?=
 =?utf-8?B?Z0hoM3A1NWpiL2c0MnltUUNQdldWbkpxVWxpc0hKY0t0V1JWMlVZVldUdkQ3?=
 =?utf-8?B?bzBMeGlFVCtUQk5KdG93ZkZYOTZwejExeVBJWXdWREV4Y2YydUtrSzlrSW1K?=
 =?utf-8?B?SXZyMVVNenhNTXNTQ1M4dHdVUFIvWGNVcFBZVUhVclJSOUdqd2htNUNkRDFR?=
 =?utf-8?B?SldQODJPN2NCdXVpWjlzZXFyOElwak9VaDJ6UGJZZDZPV0V2SGt4SEhySTk1?=
 =?utf-8?B?U2lXM3duVUJ4cmtpcjBPNVZUTERrbnFiVUQramxuUG90VXhZQ2gyajVDQ0ls?=
 =?utf-8?B?eE9NMHBqZGdKNG1qUVJpSGl3ZCs0S2k0eGhaZ3Y1ems5WllpMTFRbng3eWpX?=
 =?utf-8?B?VThxWVN2R0ZaUW9WQjNYYlByWWlxdGl2QktwdGxpYnd6VXZhSkVjZUNnWmJt?=
 =?utf-8?B?M3hCQ3N0ckJlbXk0cEZ0dGVyMWJjUkdzRk1jUEVHOWxpNzhsczJncTAvTE9o?=
 =?utf-8?B?aVRqejFkam5saCtUaWovdDVNdGhvVWZQSVU1OUxMOU5MTk1FcG1xQUJ2M0Nk?=
 =?utf-8?B?Y3JEWk0rWjRmQ1RQY1FXalhucUY2SEFiTWJ3d2ZFKzNDeWI5b1JvbUVEQnNN?=
 =?utf-8?B?UDVFUDliTUhXUTczSWVHbHM0RVFDTE1BbnNwZ0lMSkx4RnlZTEFWd1VUYVNV?=
 =?utf-8?B?MytyWnJycUlHVy9rKzRMU2VVUVExOENUd3JGeUtoM0VENmJXWUQ5OFJnSDNT?=
 =?utf-8?B?SS9vcjFWYWIzNkRvOGFpeW0veUF0Wi9VYzc0ZVAxMTBNd1BsRytGYUhDVWlO?=
 =?utf-8?B?Q0RPTXpUZjZPMUQ2TC91R0c1QlprVllYU2hNcHE3QkoxWXRoRWFBTWkxTVA3?=
 =?utf-8?B?aFhvSDdRYkFEYnNNcmNWWjI4TXdHWHNYK2lPTit1bXVKVnFhU1p5b25GajVn?=
 =?utf-8?B?T0NOQ3YrNlQ0T3BlaHpQMWVmTisyRnBrZ3BkaWhOc2tBMDBFNjRxMjlBNndU?=
 =?utf-8?B?SDdUMldTUjZLRm9GbjFhSDc1dG02bzhxZkJpYktqb2JQYk9hQVQrR1F6OUxT?=
 =?utf-8?B?VE16cGdrVzJ3YmNWMDJ0c1VQQi94WGNWZVBPWlJFQW1xeE9lZ3JHNnM4TW9T?=
 =?utf-8?B?V1U3eHV4ODNoU2dobDhFZ1NRVjFBYVlZbjU4UUxlMW1KUCtqK3J2a0F2UHd6?=
 =?utf-8?B?azR2bFBodVBwYlowazNPTW9kU2xTVTZJQUZBMXhYTDFqVUNwc2lzcGtBckxX?=
 =?utf-8?B?cjB3NjUyM1VOWXVlV2lFL3VLM0UrMmV0UGd1SE0rT1duZzlrTWhJQzlHZ1NJ?=
 =?utf-8?B?UjJUS21vWUIyS3Z2cnFrVy9halJXOHhDcjNjM2E3enE5aHNVMUZwWU5obW51?=
 =?utf-8?B?Q2I1eWw1WTg2bTF5YVlVdHo3ekhadkl1c3lZY2pjaXF5MmF2ZXB5STAzdEs3?=
 =?utf-8?Q?6og49Mq/4YXi3X4PHL6rZfaZk1y710zdtxpZw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWwvNHppQjJrR0dQY1pNVTkxR05VZDdSeVhGZ2NkVXpIZU9rRjU5K0c5RGZy?=
 =?utf-8?B?Wkh6RExNYXpkU3ZHMVBER3ByeElsY2o5SHY4bGlQeTNqdXBqRTlNdEl6a3Mx?=
 =?utf-8?B?eTMxbnE3RStlTUpVdGtabTlHQU5iNGRveHdWWXFPeDN4eDlwSXFXd3hLdnFX?=
 =?utf-8?B?OXFsSmI4dHNzV1BiTWRwMTlHVFpFZHFFYU0zMHhzNFFWZmpyelBDR0M4OVJY?=
 =?utf-8?B?SmptdGlOclRsRyt0ckhURHkwbXNOUGtHTW8xSUZKRmx6MGF2ei9Jakx4SGhx?=
 =?utf-8?B?WStiT1VGS0tQZVJlTDhZT1NudGFYMHJvSWx3M0QvTWEyR0hWUnplc2lWeHFa?=
 =?utf-8?B?OHhyVmVXMkh3dzVnL3VnTU1Gb2ZqZWFqc0R5eG5CRVF4dUVqOFZHdEFCTjdp?=
 =?utf-8?B?c09LSzQrWHFXZC9ocmVkNUQwZGppQk9FbHNPSnVXWnIxNk02TXJzMTBXWEwz?=
 =?utf-8?B?TVdUVHl3Q0pNMWk4dkkwdGdBcW5VcHdRNzB3MTMxVjNQSGhnS2lWV3JsVjkz?=
 =?utf-8?B?cGRLWmJ6THptK3hVQkZobjIyMHVWYWtqTWNPME1FcmptN0ZwaVBrOTRxaUFS?=
 =?utf-8?B?ZG5yZ1IzQ2RybTlUS3NWZnJXT0FzQ0NHNlFTSDNhUS95a1BWbk5jVFlRTTZ6?=
 =?utf-8?B?cUhZRjRMcDhLakpJdXB3dkNFWW92bGhuZDJrRk1XVDlxT2VjRVMvOWVWUW93?=
 =?utf-8?B?NEJHMC9XWGhRK3puZ3A5ZjlqTEJRU0NFeXhRZFVoSEVXTlFwUFc1RCtDQWJN?=
 =?utf-8?B?czRGYzd6Y3NjaGN3VS9UZ2FLbzBXV2hmTFNnaU82Uys3NWRxQzFmMUlXeEhx?=
 =?utf-8?B?emxkR3JhS2ZwZzhGT3dscTVVeXhveStTMzFMeFBnbCtVTG1FdVRsb2dYS0k2?=
 =?utf-8?B?TlZ6NlZrbXYyNit0ak9PMUVzTGRTTy95SUtlNExBU2FuSlZpVTB2NHR5QUhV?=
 =?utf-8?B?azI0eUtPbUdvZVJsRXkxZmdhdXoxQnJ2eTNPN1gxblF3ZFpndHUvRFRteGtE?=
 =?utf-8?B?YllDVzY0QnVmYnBXTmFhWnphc2dQUDFYUUZoM1lxOFZKOERoc0V0QVNaSDk1?=
 =?utf-8?B?ZEVLa3JxaW5yMFlUclpqM09HaS8vTTV3WURrWEo3QzhjN3NZRVhHUFg4Q2Zu?=
 =?utf-8?B?ZkNlb1hkREgzQkEvSlFvQlVsL3ZocjdsRmRrMG9xck9oUFlFMmIveElBc2Jl?=
 =?utf-8?B?T1V6QjdGNXg3TncxT0JuUTdkRm9CZEJLZXNpSnU3U0VONXBPN0xIdUxxVWlV?=
 =?utf-8?B?bzlJbzA5QU93TElYZHRGN05rRnBVV0ZTZEtPV2ZiY1R1OUhNWm9vOEpodlVK?=
 =?utf-8?B?allCaEF4Y1ZFa0xhajZ0T2NvVmJHN0t1UXJ4WVlSOXlFek8xNjQxWHRSMDUr?=
 =?utf-8?B?VUxaOFZjZG4yeThVM25tSkJsWWhrNlM0emg1SGM1cUxsWkFmSjVWelcwb0Fm?=
 =?utf-8?B?aGE2bG9GTzRyYlhuNXpIR1Bqa3haKzU1SWl3aFhDYmJmNTh1Z2ZMd1lrbXFJ?=
 =?utf-8?B?Q1c0UmN1dDIrZmIxSndXdU1DNHNoV2dzdXJjQWRIMmNMWXZLdjZKY1JkTS82?=
 =?utf-8?B?ZzZNZEF1amtlZ0MzQUVxQXZwVUJ4VGRnSTJVeC9JbWNubGgzQ2pRZ25vY2hE?=
 =?utf-8?B?eXlPOHJDd083bGUwWnRsUDVQVVJjdHZvWVpZUTcwRWNuOVl6cENQOGx5V2tK?=
 =?utf-8?B?eVExVlNhZXdzSE5PUDYray9CMXdhb1JUOWZ3ZU9LaDZHc2FWdUZEaGtqcUg1?=
 =?utf-8?B?VXBCRG0xME1UMkR4YnVkU09EYmR4emhuU2NjTklJTnJFSUU0cUk4d3V1eHY2?=
 =?utf-8?B?NGZQcXVUYUNCZ0VmQmZ2R1F5eUpQSVExR3VBWEtDeVZ4MHVRaXFBM0hvOU0r?=
 =?utf-8?B?ZEI4bzE3QU1YRGxhanFONDJ1QWk1L2NiUDhJRWgwU2EvWk1oZHVIdkJ6V3Uw?=
 =?utf-8?B?UXBpZFZoUkpjTTlkckJjWkdyQU41VmZRQ1AxT0hLWXQ5aHIveXpuVi9mUTNQ?=
 =?utf-8?B?WUxwOE0yeGVPNWkwY2E5Z2FWR1NtakQ4c2NheDA5K0k2L2xsQmVIME5VR2tN?=
 =?utf-8?B?cjR6Q0QzZEc2LzNrd2JqN29taEdob0JndjhGMnBFZXl4RkJIUTVwTytlT1Ry?=
 =?utf-8?B?ejVQWFpFODdPRCtzWUlzU0g5bVlYQXMrUFJLKzZxcnVxVURtVG16dnZNemF1?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b9ef37-4655-453f-7cce-08dcd83fbc1d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 00:12:23.1786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KBgu2cpErMImjKT3Q85pjKX4z/Xm9COOiRHe/pSN2jgk1lkmXyDn16QqdsflF/xIW9+zPdqxZxI2kFgn4WZSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6984
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2024-09-18 6:35 p.m., Matthew Brost wrote:
> On Wed, Sep 18, 2024 at 03:10:00PM -0700, Zhanjun Dong wrote:
>> Add null pointer check for parameter src.
>> Update lack source flag to include resource is null case in xe_bo_move
>> before xe_migrate_copy called.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c      |  4 ++--
>>   drivers/gpu/drm/xe/xe_migrate.c | 24 ++++++++++++++++--------
>>   2 files changed, 18 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 5f2f1ec46b57..761130f0e9a9 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>>   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>>   
>> -	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>> -						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>> +	move_lacks_source = !old_mem ? true : (handle_system_ccs ? (!bo->ccs_cleared)  :
>> +					       (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> 
> I'd write it like this:
> 
> old_mem || (conditional)
Sure
> 
> But I think if old_mem is NULL this condition always evaluates to true.

The NULL ptr issue is found by CI:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/bat-lnl-2/igt@xe_live_ktest@xe_bo.html#dmesg-warnings5406

To get there, 2 conditions are:
src == null
And
move_lacks_source == false

> 
> - old_mem_type will be XE_PL_SYSTEM.
> - ttm should be NULL (I think), thus handle_system_ccs should be false
>    and tt_has_data should be false
> 
>>   
>>   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>>   		(!ttm && ttm_bo->type == ttm_bo_type_device);
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index cfd31ae49cc1..45bba0d731ec 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -774,14 +774,22 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   	u64 src_L0, dst_L0;
>>   	int pass = 0;
>>   	int err;
>> -	bool src_is_pltt = src->mem_type == XE_PL_TT;
>> -	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
>> -	bool src_is_vram = mem_type_is_vram(src->mem_type);
>> -	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
>> -	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>> -		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>> -	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>> -	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
>> +	bool src_is_pltt, dst_is_pltt;
>> +	bool src_is_vram, dst_is_vram;
>> +	bool copy_ccs, copy_system_ccs;
>> +	bool use_comp_pat;
>> +
>> +	if (!src)
>> +		return ERR_PTR(-EINVAL);
> 
> Can you explain if this function is called with src == NULL? That seems
> to be problem in the upper layers if that happens.
I agree, the src should not be null when this function was called.
The previous move_lacks_source change should prevent it being called.

Maybe keep the xe_migrate_copy not changed here and only keep the above 
part in xe_bo_move?

> 
> Matt
> 
>> +
>> +	src_is_pltt = src->mem_type == XE_PL_TT;
>> +	dst_is_pltt = dst->mem_type == XE_PL_TT;
>> +	src_is_vram = mem_type_is_vram(src->mem_type);
>> +	dst_is_vram = mem_type_is_vram(dst->mem_type);
>> +	copy_ccs = xe_device_has_flat_ccs(xe) && xe_bo_needs_ccs_pages(src_bo) &&
>> +		xe_bo_needs_ccs_pages(dst_bo);
>> +	copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>> +	use_comp_pat = xe_device_has_flat_ccs(xe) &&
>>   		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
>>   
>>   	/* Copying CCS between two different BOs is not supported yet. */
>> -- 
>> 2.34.1
>>
