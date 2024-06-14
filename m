Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D60AC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2D410E2AC;
	Fri, 14 Jun 2024 21:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODAwYeoz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B563210E2AC
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401244; x=1749937244;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A67Jj60cGmQOg/odImkNbh/sBbG65cQyu+dA9apLroo=;
 b=ODAwYeozhcPjH+251zNGyRQQTIVZXFKAxBxy/GGzqe9TkFnTqilwt3vz
 ZNl1kAmEuuLouWXRkUZWQUDbSStsXI9QMQwnSgCd9plWCPXA1yUB7FmVe
 Nf1Axvhx1SL0juwPH0a/oYlAA30uBZCHRuDUx1hHaohNAakTSm2w8zQ3Q
 /R/ShC294K7gfilLRMptCI8U8atMBX6eaDguMKWayMKg7stYCmIyxZrFF
 DdsuyL4Tr16ytSgReu5Ug/ZUXAf7FZZaLgFUjlRydMKxEf8bYBgApI04S
 UVns0LNaPUrE41eyDKJXtBjT+9hJ6G+ZY0kEABZSZNrU9OkwlRrzfREiv g==;
X-CSE-ConnectionGUID: WcP4ZjrXQhKMvojl0U48TQ==
X-CSE-MsgGUID: T2o8VnAzTWWc7AONskT54w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15184465"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15184465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:40:43 -0700
X-CSE-ConnectionGUID: 4yN2NVT1S6yhFUCv+V3gjg==
X-CSE-MsgGUID: MIZF9CCTT2KhR9Ho74Jr8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="41334019"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 14:40:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 14:40:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 14:40:42 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 14:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fa+SdtQEAnHXNliAFaHo9rXA6X8OXp9evcr17HphhPzPjjCbSzicHjEoOaMO0jPXqqQczqfYV6VtIasBhBCPgWPmXCVN9sXeCbnH4PEgq24/DZxhZKm1FRhqbCKGmXItUvEAYw7qEJpWl5s6ExaqD6JGLEMSdKr9N8ZAKhIT3xbfc+x/j4zaeF9vVBVE3sG1XwHoiLW2vj8bk2rTOeAV3AWJpGKauUJL1eZVi9h9UYkDi2eSVziVXA9PTxpdCi0Rr7IzFTACdbV07bN9bAs6vyroC4bB8s+EK44Hb4Yf0YRb6tmTmrYSahR/MNUCqkd6U1KxVha+BSSjoYl+cEGjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyvbBmE2ROLvMxvh4GsMjSl0Weja/xXANYDo7QvY2fQ=;
 b=AMVUILJp6y+GtiLxrONiPTo/AB75kGvXkqktWRmmZOYTXZ0nSrbIaMOnC/KFtYwRsvukcbdW5skg5KKyV2a0XNu5Up1YkUcxX3D1+LHliW7MFbee5V0XliIRAO1XHLGV+9SFxOKNdTzXeujllzbcUEJiaAGdwFsmpF9UMg8ZyPYu8c7zUeZ+wscwamGhfOi7KH2GtKCqbECe8LQlmKgeGEmB2W0ljPOWUuPdShWsGUkAKFsGxH+fUZ+14qAB1LJYkCsbmQcH/1Wdk6oTFy5nYPIBlhz/0ysHtUYLziyChjfGqBvXiBh8b0hVR2u2WnpbGlZVwygw06A9DqtOWiD2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 21:40:40 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 21:40:39 +0000
Date: Fri, 14 Jun 2024 17:40:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVyZSBm?=
 =?utf-8?Q?or_drm=2Fxe=3A_Fi?= =?utf-8?Q?x?= missing runtime outer protection
 for ggtt_remove_node (rev7)
Message-ID: <Zmy41cNwz61-mvvV@intel.com>
References: <20240614183758.77736-1-rodrigo.vivi@intel.com>
 <171839676261.80112.4617375707876106202@a6498e030952>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171839676261.80112.4617375707876106202@a6498e030952>
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM6PR11MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: 606a2680-2d79-4488-1820-08dc8cbaa240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHQyQlpESVNoYnZZM0h6Mzc1cjFsUHBNTTFIYVdEZmJQUHBIaUpVbnhSMjJo?=
 =?utf-8?B?WDhaWVY1aXhYeHF0SGZUTE53YTBNbWxxQ2h3Q0JlelBzZHNEWG5VRytWMFAr?=
 =?utf-8?B?YXhPcjVBb1hnRTN4MmN3U1N3SlY0YU5URmFBSkFmc3JxTWxjdGFoaWVHL0ZI?=
 =?utf-8?B?U3g4VzRSdXVZWVN3UXlzSTNCQ0kzR1o1WWtOQ25BQnk0aVR5OTVScjdVa1lO?=
 =?utf-8?B?MitLdWs0cm1VUWVVU1o5N0FmZWcycXAxVDBxaHp0MTlBWDVIMHRpd1dObFBv?=
 =?utf-8?B?NkVUOHN6SjJIUHdrQ1ZzZFNiZytycVljakpjTE9EY0ZMWnE3YVh1Ukg3d0Nq?=
 =?utf-8?B?Mm5YSDNmd0FYUWhsSnN6Y0Q0YmZUMVMrSHkrZnI1VXZNZUg3aE5PcnVaNHgr?=
 =?utf-8?B?a0gvbkdaNmwvNExvVHo4MG1xYnJQZUROVEFVc2NVV3NRb0pnVmNkWnBBNUV4?=
 =?utf-8?B?WHJ0bDRVcWxRVllxblNEaDZ4dktDMTBzMzJES3ZCNUJZVjd6VWRaKzI0VUlD?=
 =?utf-8?B?cjVma3lPQXczWm5ld3NXOVlWVDQ1VzFHVk1nMnMrTWZ2OHo2U2pkSGIrK2t4?=
 =?utf-8?B?Z0JicDl1dUQ0VHhUY1Z3ZC9NNVRtbnpMN01wbFZCQzY1VmdRL2pCNWZJc2dJ?=
 =?utf-8?B?QUdPREVJNTA0SGR5cEhwOW9GWGpBemlOZjNQZ1F6ZG9HYTQ0OHc1eFRVS21q?=
 =?utf-8?B?MnRzSHZyaFExR1NKNEoxQzhoVU95SStzUU5ZTE9ZbWxUSGhScW5wdWc3UFhv?=
 =?utf-8?B?ejRoUHBnSXQ1dko4R2haQW9ycHB4NHA2TTVpZEphVW42Y1NQTERMOUpXU2JN?=
 =?utf-8?B?WVlJRGpzMktmVTVVVjkyTjM1MXlUUUhBSzNaaTMzNkcwWmdNeDY1cVp1d2Fl?=
 =?utf-8?B?NEFRRElPV0F3cHVBSndqYjlmMHEyS2VDYXZXaCs0NDI5TjVDMXM2cG8xbXpU?=
 =?utf-8?B?bWlQRUx2VTA1TDlvV0RoMzhseUV6bUo5YVNHL09ZbXh4WDJzY1U4eE9PWTZB?=
 =?utf-8?B?Ylg2NStldHZUY211TzFvWC9pNk9HR0NqaWJiUDIvdGtyQ25uUTRPbzlHT2NL?=
 =?utf-8?B?aHl4a2g5a0VBZS9HdTZoY2JjMzFVQ1FIR0k4ZkEvQjQxY2ljZG5IQjRBT3VE?=
 =?utf-8?B?bU13OFBUN1VNUjdCUXU2cXdQd3hIOThmT3AwazBwbE1pQ2l1VkZZcU1FZzBm?=
 =?utf-8?B?THd5eFMxcUVPZFl0TWtxYi85dkQxZHhsSXF1ZXFWbE03cU9odnRuTm1zVzNG?=
 =?utf-8?B?MlNCWW1vczlPeFVCTjdtUnE4cDk1YnZFSGhnbUpsYXBINnVNYVROTFZEaFls?=
 =?utf-8?B?MVRQNEVhTVB5MzZlMS85Rmp0em1jZnR2WVhmc2U5c1MrNERJUmVOTEdXR1Mx?=
 =?utf-8?B?QmJiQmdNckRhNzR2RVZCTnZPYmJmMjNEekJKaTVERnVlSEoxL1BCZ3kyTXoy?=
 =?utf-8?B?MDFZOWJSUFVWd1dsK3ZObGZ2SHhHU2dLaVg4UEZYRnZITVFNeVdrdzBtcGJ5?=
 =?utf-8?B?WVpKS2JCSUJuQlR0R29xcmowR2NkYUxIa1BnZXZicVhEbklwMEUyNTAxa1da?=
 =?utf-8?B?aGNVbnpaLzVHazV3YUpHMUxRejJOaUg0WUZmRjZPRkdQc1d6WDlsdGhlVnZv?=
 =?utf-8?B?YURIUC9XdW15RWI4Z3ZJdlQzV1FLL2tqT0dlY0xTbnZ2djVrOGdPc1RDZzIv?=
 =?utf-8?B?WDJLY0FjVWJNQkE4VXhDTEVtSHZncmYrK1RFZ1pGbVZMSzIrTlROMnR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pheENvc2VUd0NJakNGcU9QNXlCNjZSUkVadG51UmZpMGhDZHd2TEFvV1dy?=
 =?utf-8?B?Q0FWM2xWSmk0cnJsMjJVdjJ3bVByWi9CcGpOZVl2RzRHSFJ3cGh3QWQyYjQ4?=
 =?utf-8?B?TjJGYnBCYmtWTzc0VWFsVDB5bWg0WE9ERGdkU1hUZDlxMkJYaWtUZUplSXRl?=
 =?utf-8?B?bnUvSk52UmxWeThMVkE1Y2ZZem40QlVESHNhZVArak50VDhHNTFlRHViUWVx?=
 =?utf-8?B?SWk0aURSNDRTOXIxZjJOclRSbk5iMmFvMW1hY2w0N2xjY1FOYzV1VWYwb1F4?=
 =?utf-8?B?Y3hpOHFrMVgwZXZGT1RONTV5a0NrSFNrQXF4SkFVb1pOekcwMWJ4L2ZwYyt2?=
 =?utf-8?B?Y0Nyd2NuWDJHQmdReE5oN1FrdlVDUWM2U0ZtUlpGL0NaWnBTbVRDeG5jYkNn?=
 =?utf-8?B?R2k0eTc0TTFPcUcvWkxqOFkwSUoyOGRROWVWeURaSWVwajhtanR4S1N1a2o3?=
 =?utf-8?B?SW4vNm11YnRIUldnQmJBZDlXN1VBdHJkbGN4Y1puYVZKd29BeGwrc2g1TDd3?=
 =?utf-8?B?K25kUm9SdTJ0WWNuWjg4ZEsreVFwNWtLdHRvSXpIbWpGbnI4N3lkdk00eU0v?=
 =?utf-8?B?bW1mSlhZZC9ySnRISDVyeXhJbHRIaVdpNHNRck9wLzJWdjJ5bzBuY0JzVkdl?=
 =?utf-8?B?TGpJYVdnYVpxT0tkNEhsRkt6UFNGTHU4czZ5RUtaU2pheVBVNlI5YkZ5Z0c0?=
 =?utf-8?B?VldjVVg2SWRMOGR3TnprNml5OWFqdk9DSzBqMzJ5SDNCWk5MYllLSHRNV3R2?=
 =?utf-8?B?UnlVSG9JRlh2QWdOcStkTkRkNXN0b2QyV3BocFVFSWQyS1kyV2JpQUdrbEJF?=
 =?utf-8?B?YTlSYVN0SVZocE5VUnJjZnJnd3FXbFJWR252YUJ5bEVUcXI0SWxHam5qOWlB?=
 =?utf-8?B?dWQyTDloRDFkdDRqSXdKNmd1SGlyNjIzSGlxRTY2Wnp4bUQ1QW5kOHBWY1U5?=
 =?utf-8?B?OTJXUjllVEJpQUNUcXRNWk1weUdicHlPd1d3dmltMjNheTBnRkxZMFBsY3hx?=
 =?utf-8?B?WGNzaWVmZXEvR1JwZ1hQWUl0L0lJOG5icXVjbGpJQjNnVzlJTk8rUlpZOGFU?=
 =?utf-8?B?L1ZxSUx4cWN5RTNJVktOUzRmL2xJdU11b1VhVWhzK3BXaEdEdVRKdjNCY3J3?=
 =?utf-8?B?V3p1TjFuY1FZNW1DaUNBem5USFJUMk9FeUVqOTFlK0xVVFZQamVSbVB3RkhT?=
 =?utf-8?B?c0hWZjJkUktnZWRtR2FRZC9rMzllT3phWit3RHQxWFNEdFNPRzcyKzM5aGUv?=
 =?utf-8?B?WXhWT2l6dzFOL1RIa1VZTENVcTZIY2gzK1NzdkRoWklmSzlLbXlscytoVFhU?=
 =?utf-8?B?UW85T3R5a1BBanRGczVFTDRQWWJTNGNLQTFKMmwrL2QvRWlVbDZZdlQ5MTl3?=
 =?utf-8?B?WmR6bXV5amJNeUpSVmQ1VDQzaDVhVUdKaERKMjJNRXh5cExZaUhvTFlvdEQ2?=
 =?utf-8?B?M3BxVkR6OVVITzAwKzhhYWlrRTdNcktzTjR0dUpMdmRZaGJRMFlKV0JleDlK?=
 =?utf-8?B?cFh0Rjdoa1hMUnhVRnRoNlVqMnRST0pZYVFzalovOElFazlQK1Z6L3c2MExM?=
 =?utf-8?B?azA2NDRJK3BJeUJPZHRHL1pDUVplSWhKS0p0MG9IZ2NZSmFtYTAxbUZ0UHl5?=
 =?utf-8?B?T2dCd0diOXdkZnpDVktVQ09kd3lYSHlKQ1JyNTF3NHZBQm9ZWDJNQjJKblJt?=
 =?utf-8?B?UU1Vc0hsanRJQzFYTUV2ZjFOdlpTT0lCSHNHQ0tiSUxKL0hvOGIwMUYyaWlK?=
 =?utf-8?B?cncxWkErM2ZWMTl2OUFjdVgwd1pkOGRhaEc5OFhnQVVyR0F4UHYrMVZYa1Bp?=
 =?utf-8?B?Yml3cTJTTTEwUkNkMHdrNWUwVzRFNXJuUmtSWGhtMjh5ZFQ4SXZ6bEczcmc1?=
 =?utf-8?B?aTA2ejhsaFdSdFdpMXdMQmhFRnJjSzRvcGRoekp2YVUxT0tyMUJZTGdoNy9L?=
 =?utf-8?B?Y3RZVks1dVlQV3dNSUVSU0R0dWFpOGRXdTZLUktBQzVVMjNWUjVGSFpaWjM4?=
 =?utf-8?B?QWljTkFwMkhjRHJURisxMTFhOFdYTnBaUGJLS1pQbUN3MXhsNWtmOG12Q094?=
 =?utf-8?B?YzI1dUY3TGFKOTR3RTVFS0EwN0xmVEJVMEtyZzdmaVZFTVlZbmMxem9uaG92?=
 =?utf-8?B?T3NwVXNUNEcxcDVHV1YrbUpkYjJVV3grY1VCRzFMeUZxcGlLaUx2TjdYcElV?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 606a2680-2d79-4488-1820-08dc8cbaa240
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 21:40:39.6111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05YYXKR3NF7APV+g+Hf/8md4yTunHKAsd0AO12LlOIblgA3YT91ixLmm2hrty3KI5EKRrxYy7tIa20sPk/cYGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
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

On Fri, Jun 14, 2024 at 08:26:02PM +0000, Patchwork wrote:
>    Patch Details                                                                
>                                                                                 
>  Series:  drm/xe: Fix missing runtime outer protection for ggtt_remove_node     
>           (rev7)                                                                
>  URL:     [1]https://patchwork.freedesktop.org/series/134308/                   
>  State:   failure                                                               
>  Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/index.html
>                                                                                 
>  CI Bug Log - changes from xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4_BAT 
>                              -> xe-pw-134308v7_BAT                              
>                                                                                 
> Summary                                                                         
>                                                                                 
>    FAILURE                                                                      
>                                                                                 
>    Serious unknown changes coming with xe-pw-134308v7_BAT absolutely need to    
>    be                                                                           
>    verified manually.                                                           
>                                                                                 
>    If you think the reported changes have nothing to do with the changes        
>    introduced in xe-pw-134308v7_BAT, please notify your bug team                
>    (I915-ci-infra@lists.freedesktop.org) to allow them                          
>    to document this new failure mode, which will reduce false positives in      
>    CI.                                                                          
>                                                                                 
> Participating hosts (5 -> 5)                                                    
>                                                                                 
>    No changes in participating hosts                                            
>                                                                                 
> Possible new issues                                                             
>                                                                                 
>    Here are the unknown changes that may have been introduced in                
>    xe-pw-134308v7_BAT:                                                          
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Possible regressions                                                        
>                                                                                 
>      • igt@xe_module_load@load:                                                 
>           • bat-dg2-oem2: [3]PASS -> [4]ABORT                                   
>           • bat-atsm-2: [5]PASS -> [6]INCOMPLETE                                
>           • bat-pvc-2: [7]PASS -> [8]INCOMPLETE                                 
>           • bat-adlp-7: [9]PASS -> [10]ABORT                                    

changes coming on the next version:
https://paste.centos.org/view/aaafecff

>                                                                                 
>     Suppressed                                                                  
>                                                                                 
>    The following results come from untrusted machines, tests, or statuses.      
>    They do not affect the overall result.                                       
>                                                                                 
>      • igt@xe_module_load@load:                                                 
>           • {bat-lnl-1}: [11]PASS -> [12]ABORT                                  
>                                                                                 
>    {name}: This element is suppressed. This means it is ignored when            
>    computing                                                                    
>    the status of the difference (SUCCESS, WARNING, or FAILURE).                 
>                                                                                 
> Build changes                                                                   
>                                                                                 
>      • Linux: xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4 ->               
>        xe-pw-134308v7                                                           
>                                                                                 
>    IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @                         
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git                         
>    xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4:                            
>    5c623c9712af3170cc9782a10ed7360ddf8f8bb4                                     
>    xe-pw-134308v7: 134308v7                                                     
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/134308/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4/bat-dg2-oem2/igt@xe_module_load@load.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/bat-dg2-oem2/igt@xe_module_load@load.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4/bat-atsm-2/igt@xe_module_load@load.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/bat-atsm-2/igt@xe_module_load@load.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4/bat-pvc-2/igt@xe_module_load@load.html
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/bat-pvc-2/igt@xe_module_load@load.html
>    9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4/bat-adlp-7/igt@xe_module_load@load.html
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/bat-adlp-7/igt@xe_module_load@load.html
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4/bat-lnl-1/igt@xe_module_load@load.html
>   12. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/bat-lnl-1/igt@xe_module_load@load.html
