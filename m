Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C090FD1813A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 19:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8833F10E4B9;
	Mon, 14 Oct 2024 19:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDcgns4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1335010E4B8
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 19:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728935776; x=1760471776;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KkxMkKmtQFXFduWrvQanXLYNTEBDbP+/CNJawULFvQo=;
 b=dDcgns4ah7YmhSN4XKvTfp8KHURkz3mI5jygfBB1zWWXXiknZnQdsD3C
 DkhhoIwkuu+qcRFsni6fbwFbR/juScst40jIdx40zaDBn5Kw1SplZpDI2
 ZZO+NoERv1X7MkqLb6Ch1kZNq4fJ0ZtgorpABJhnONhjzy22uyjo4fCbK
 uQXry79FnNtquziawoMA4DJ3XsDPuPPGwPMV65COvW0SI94jcmUDV6DyD
 5EYCqFV7BsMiI+iZ4HO1I+52r4naJ5Fu5/CguhjTzRnfdkiWYtNvqHwel
 yPcV3lZYg/bnUjW7ydWg2MytBlzvq5hgEhOUVTrscP1tfntri9NlCoS+L g==;
X-CSE-ConnectionGUID: FyIN2KSmSwun7f0eooMDzQ==
X-CSE-MsgGUID: O+s+5cglTOaOeex5kAW5tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31184598"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="31184598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 12:56:16 -0700
X-CSE-ConnectionGUID: +33XH6CRRaKmGj0+aqUSzA==
X-CSE-MsgGUID: U9fJtmO9SQijkQOAr2BD9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82235007"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 12:56:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 12:56:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 12:56:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 12:56:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 12:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4xS0Kug37g6WUIJpcJdSo2SDLkKC92HoHORJoibtTFjeKvy9r0tNpcFQhJBFbT9mttJ1fnAc1U3YdY78W/DQRSC4mDSTteTun7D6jjYEu4crX8nMSUl9kf8ciu63ot8ymnyhl9jg5db3unJ8o0K1mgpFcLgstl5WX8eSlaYlwkb74TuLeYmt5HraRuhbFKo9XIcXSmQ2qZXrYilv+ynIqZYkDSLOt9y/IJwHe6wTbq2nW5T4h29vs+QCItKstpT6i44vOug4I8C3MpaHdEGW/YUj3RFq9XMxQ0NpCoPgKHd0f8VwzCch6/M0hw3yOPsEwWUZetEDrjBEU5OXE5M1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UplU7Lqq4YERG0dwpq2vqKPqUKHMmZzUCIcrPrFti0=;
 b=WyiNxjmc8WlrNsrjuJWY3SvTLoGGJ9YEm4MZECDfpZqXzgG7why8aqRrqyMGY9cakSQ7TzOWlgVfOUBfQC6f1duTFkySNLMwJ4tGxMmJhsS//XqRbroDzQRCobLt2nEzFstWh5vKri2Fr9eOxzRiKtTe9OBf0/DN3EmhWFe0vIknjItgzTpXenCFhKfBp1bWLswN/s5npPLDBFaMhfeokICo680K3crmB5oBtI6OkvGtmx5pxDxWbzGMH6QUwQ+2dw3/POY3p+SeWznG+fUflFYOg+LVIn4NPrVKXrb4RXb4lZ0l0vOvtI9h59iBiaHQAEZnesdh7kCFC+V34Lww/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7481.namprd11.prod.outlook.com (2603:10b6:8:14b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 19:56:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 19:56:11 +0000
Date: Mon, 14 Oct 2024 19:55:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <Zw13OJPfibziUQaU@DUT025-TGLU.fm.intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
 <20241009172125.1539-2-michal.wajdeczko@intel.com>
 <ZwnV7WFgRw85mdxZ@DUT025-TGLU.fm.intel.com>
 <66db813f-a475-4043-bdef-25be321e18c3@intel.com>
 <ZwwDq++SAOxI7mbz@DUT025-TGLU.fm.intel.com>
 <d047a927-d94d-43f9-8e1c-7c08e742b897@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d047a927-d94d-43f9-8e1c-7c08e742b897@intel.com>
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: b6335c73-c55f-4f1c-9b38-08dcec8a40d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OhDPva/SEW4jHiAMw2Ynq8LbKzhbnaSMmKq09rZZEZaXAMi452+a9y6X0B?=
 =?iso-8859-1?Q?VdTsqcgkKRbyfKO6xor9uuK8cisGuCUWmkIRlx2WBUYTGPs1VqnwTya28o?=
 =?iso-8859-1?Q?DrtpiEB0bAfiBbotvPQWx+HnJwT2IlrxP/xFN4cbLizypTARqQd0Iv0r4g?=
 =?iso-8859-1?Q?Kye51JJt8XHiQxPJFCTYkCY2cBGEcsAxlkfmKH1uleel71FtsoJ/GnbkXR?=
 =?iso-8859-1?Q?OO7HiLyO3hi2qZC8a9TPyf+sCLWtkJQk/euLrbO0gwsYOpBCm5dr7CAr9L?=
 =?iso-8859-1?Q?jRQ4+uu2fAvoFaM2Evu8fp0SNcuDeVju9J9TQPsm7S0+FzJLYyUB5joDf4?=
 =?iso-8859-1?Q?XuLWdu4rb+7Sd1wg1CMJS5tK97+oVhpXjNJapdTfjFw8sqzS+gpCAxC7Rx?=
 =?iso-8859-1?Q?41UoF48DvRO7vY11pt00N/knc8g67588h16Qf0Xgnxqbk5egbNcWDEoJOj?=
 =?iso-8859-1?Q?V7GfBZEnK+wYCpOmgL16DMvcMgj0gEBvqL3WfSA0rOOt4Kdk4lsvoqV/MN?=
 =?iso-8859-1?Q?4hKUx7kd7irvTH4tBt7JK8R72x7gSDTyBkpoYdf7fa4lU6DI9ppgZEPIK4?=
 =?iso-8859-1?Q?ObnN45rKS5o3HC0oL0HAI5sFWagfO5BmnOJjM+noRAY32NvTiUuRHFlIpG?=
 =?iso-8859-1?Q?0lJha6195ZRUUS4LTqwkVMPV7jsmZrk3QttJ9ruwM4aJlDp4VXzSnIT2GW?=
 =?iso-8859-1?Q?L4IvpsBRqD7NOOgCyuHT8OiE8xtuFWl62eiWGRUYCnt7aYiL2JHPHPaFh3?=
 =?iso-8859-1?Q?73q7cAt2WlSh+81mSWsB85YUJ4C2OB/yGG5cD2eVtF7ELLva+z6vvGsj9M?=
 =?iso-8859-1?Q?u5r3HLC/VWJtXPyKvQ/D11cwMDa232WLG5E13TBIWCZEYFQFp8Ifz3nifX?=
 =?iso-8859-1?Q?8WveQtnPKgFOA18CRMJzGjapOpKvTveEuqzNSgcjbJiHlpAtoV7PzFIQK5?=
 =?iso-8859-1?Q?S5XSMxssWcxWzO4LkKsBQS/pukX+19d8vpFGu+fNnbZrgvZPMI9MwMxZSW?=
 =?iso-8859-1?Q?EzEQYjO1tWxrA3lHtYBc3rCJA+oXBijIdBcuRcwaR8Xj55s9SYHF8X8pnj?=
 =?iso-8859-1?Q?DOJp16w26GZwxhJAH6l+c6VW3o+6/plfYBa0qvDaUrrMgAe8JkFKIYygJS?=
 =?iso-8859-1?Q?InU+x/9KaMG96hYdTc812qq54N8JtHhns0WGKmzRtLmoZYznBnuT9qRCjz?=
 =?iso-8859-1?Q?M+gyNuW9K7Rf3YNtzDA5wPb3mtK4ZHJNjX47PrRsBo+LLnwAonIEEJG5XK?=
 =?iso-8859-1?Q?coIU4gO/YHHPIb+ThwxcwPANG40/eaiRfIh+lVGUslnvzTY71CAyMzbNU4?=
 =?iso-8859-1?Q?OhF+kR0k/FQjFNMxekXecAQJZg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vmMkJeefdg7epicLmyxDDang/KUKdiY3oRMlI37FWqBWLa7nfm8GXQ/3Fc?=
 =?iso-8859-1?Q?yg4wCNzp0BL6j3UxOFGSLCyhGv+xeLVhkonhKHqMUBhBGg7/U8WhQUVeeb?=
 =?iso-8859-1?Q?npWQZ5lWBweeBr0jaHI3jfpSGK6O/vxRnXBdZ0U/8ppDfDgkObAL98qZaa?=
 =?iso-8859-1?Q?y1Gmlz6wPSn3tQBHQWOjnD8mAO5wXd40a7JtkR7nVTyuclBqPU2Lw0gNsl?=
 =?iso-8859-1?Q?T64UXQdJ9K3RgdhMiWZ+7eDadW4QLgxL6lXVkXOggJ4RzpkHP3AdkL0CMQ?=
 =?iso-8859-1?Q?hxGt1NsP8holTWpoYlDFZUVtQVSDkc18SYRqChZxnoEQU9XbPz6Kb34GJa?=
 =?iso-8859-1?Q?w7EDUC7T2zeTKd04vPTCGpSgPBAQCKNtSz0SHA/EngVuHUuGRV4KmZILyn?=
 =?iso-8859-1?Q?p9uR1g/2lFlKlXXw7ERIHAL20nypNWq3li0coV248BtIuSQ5ZBBt8gar9t?=
 =?iso-8859-1?Q?jx7eRWUX73z7BHbfEU8Qc0o6sKInNlhjvk7zsPdBo+38lWBadgaMBuZTDq?=
 =?iso-8859-1?Q?gczvdDFF7UGcWdmfrYcVnjpnwWXppPOX/WLznpq70++HcU4iDzBAnCzSPQ?=
 =?iso-8859-1?Q?AB4/kTOSwYbaQh4Vy8IUWAy2Dkt71CIVAxU94VgOiMEhRkki580UhUpcPy?=
 =?iso-8859-1?Q?QBUkCIxpWbcVFWrjQbl9ioyURNq0gJjvQ1kI6Yp6FQN7O9qNjeYt4Qi+wf?=
 =?iso-8859-1?Q?zfRTDhIDFNic/PQ6HFKxRXXRw/ZWfzsSHt6DKvD74v0Ht9nHbnVEkm2NtT?=
 =?iso-8859-1?Q?RibluiTmN4O15SkecJicC5daqKGK0uh/KcoJX1hx0oAryE7XKcMDG/Lp1S?=
 =?iso-8859-1?Q?Q7bbZxh2R/V41k/D7sE0O31nz82rwoS0ud1fbj2TLOpPpMPx2Nr5SVe6tv?=
 =?iso-8859-1?Q?82H2D3AgZqrbTm4w8b/MyYZvOX5/KjxvjZL1fzxyOVnefR9p9Cj/0X1ESM?=
 =?iso-8859-1?Q?t79by8/ZmS+4DnTawXIQOQO70F4BvVcsKo+5E2XZJLXEBZgvdMcUQH9u67?=
 =?iso-8859-1?Q?Bts18rrkZ2jx8Js2WIaB8kKKrlO/6c0VFEKLThL2niyAsHVNVlJWZ4zBHH?=
 =?iso-8859-1?Q?/tLT6a4Pmjv8YZqnRFHoKaBxYF2Gr5L6Q+kys3JbjgcrXy/OJo8zjWBLJx?=
 =?iso-8859-1?Q?sFzAq1BVDdn/oyF1rxZKeOsFOQoRpAgFSL/7uDMAXrwK3NPE/NxDGUYzmj?=
 =?iso-8859-1?Q?8e+5xW5UfXyxYNnLoGJhs0+9a5kP7R3ubMOnfoQEvqtwpBn4Ixvr+2gM66?=
 =?iso-8859-1?Q?Z8FeiK7jTYYcyH0/j8ygK5RXllEqOqHvqTGo+AWWVFRjbG0dcpQ/Xy3ex5?=
 =?iso-8859-1?Q?kE9+8xN/Nop3mtuiZixeZZwsbNQG4ty2QcvJNvnGRDU0x+tRW7mQKajRAd?=
 =?iso-8859-1?Q?ImlX8H5yQE0/R38/6MXY5bgKpMRH/9eW/Fj+iUmqPj7u6VkURH0HFdYhNp?=
 =?iso-8859-1?Q?AZna8rr43GmMtsyUa6Kq4gkXm2T0VI5tRssQSfGDjZAsEUSzgxfqz+VPDZ?=
 =?iso-8859-1?Q?Q66gNFQNUiwia3ZgbS7Lp47/RMTvy+LKiNPzBJl2PFq8/3utzeMrF1dJJD?=
 =?iso-8859-1?Q?psP3R4wMyk7tkG8Vr1AtIugs9NofMJ6eC7H0EI2uK7LRIoRYT6tf5j87Hr?=
 =?iso-8859-1?Q?+QM9wcPo7PtZo43kIKHuaXBQfgxIdlE/e6qNKhyIViUU2kOB0TilhOtQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6335c73-c55f-4f1c-9b38-08dcec8a40d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 19:56:11.8115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNeV0+lKyPY1p8V42gyqtzEUyKPCXSEGR0CMzAKrmbGAyockVTUvtArmymVtQalxgFR0FeXgOYTe3OAzPMI9ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7481
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

On Mon, Oct 14, 2024 at 07:32:24PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 13.10.2024 19:30, Matthew Brost wrote:
> > On Sun, Oct 13, 2024 at 01:55:45PM +0200, Michal Wajdeczko wrote:
> >>
> >>
> >> On 12.10.2024 03:50, Matthew Brost wrote:
> >>> On Wed, Oct 09, 2024 at 07:21:21PM +0200, Michal Wajdeczko wrote:
> >>>> The purpose of the GuC Buffer Cache is to prepare a cached buffer
> >>>> that could be used by some of the CTB based communication actions
> >>>> which require an indirect data to be passed in a separate location
> >>>> than CT message buffer.
> >>>>
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>
> >>> Quick reaction without to much thought, this looks like reinventing
> >>> suballocation which we already have in the DRM layer / Xe.
> >>>
> >>> See - xe_sa.c, drm_suballoc.c
> >>>
> >>> So I'd say build this layer on top one of those or ditch this layer
> >>> entirely and directly use xe_sa.c. I'm pretty sure you could allocate
> >>> from the existing pool of tile->mem.kernel_bb_pool as the locking in
> >>> that layers make that safe. Maybe rename 'tile->mem.kernel_bb_pool' to
> >>> something more generic if that works.
> >>
> >> TBH reuse of the xe_sa was my first approach but then I found that every
> >> new GPU sub-allocation actually still allocates some host memory:
> >>
> > 
> > I was wondering the purpose of this patch was to remove memory
> > allocations from PF H2G function. This makes more sense what you are
> > trying to do.
> > 
> >> struct drm_suballoc * drm_suballoc_new(...)
> >> {
> >> ...
> >> 	sa = kmalloc(sizeof(*sa), gfp);
> > 
> > Can we not just wire GFP_ATOMIC here? I suppose this is failure point
> > albiet a very unlikely one.
> > 
> > Another option might be update SA layers to take drm_suballoc on the
> > stack and just initialize it and then after use fini it. Of course this
> > only works if the init / fini are called within a single function. This
> > might be useful in other places / drivers too.
> > 
> > I guess all these options need to be weighed against each other.
> > 
> > 1. GFP atomic in drm_suballoc_new - easiest but failure point
> > 2. Add drm_suballoc_init / fini - seems like this would work
> > 3. This new layer - works but quite a bit of new code
> > 
> > I think I'd personally lean towards start with #1 to get this fixed
> 
> #1 still looks like a cheating to me
> 

Agree this is a less than ideal longterm fix but GFP_ATOMIC is used
fairly often in the core MM to avoid reclaim - e.g. dma mapping API
for IOVA allocation quickly comes to mind. 

> > quickly and then post #2 shortly afterwards to see something like this
> > could get accepted.
> 
> for #2 likely it's not just drm_suballoc_init|fini but also another set
> of functions at drm_suballoc_manager and xe_sa_manager level to handle
> alternate flow, that would blur original usage, so I'm not sure that
> it's worth investment just to cover a niche GuC scenario
> 

I do think support generic support for sub-allocations in a reclaim safe
manner will likely prove to be useful across the subsystem. It seems
like a use case that can easily arrise.

> and #3 it's not that large as you may think as series also includes test
> code and there few kernel-doc, and IMO it's more tailored for GuC (as it
> also supports reading data filled by the GuC from that sub-allocation -
> there is VF H2G action that uses indirect buffer in such way)
>

Agree it is not huge considering the kernel doc + selftest but also this
is more of avoiding the i915 traps we fell into of reinventing things /
handrolling solutions rather using DRM level solutions.

The use case you mention should be able to built on top DRM / Xe
sub-allocations though, right?

To be clear, this isn't strong push back on my end to merge what you
have it is more of just making sure we make the right choice here for
longterm health of the driver.

Let's maybe get a maintainer opinion here as it is ultimately up to them
for things like this.

Lucas, Rodrigo, Thomas?

Matt

> > 
> >> so it didn't match my requirement to avoid any memory allocations since
> >> I want to use it while sending H2G with VFs re-provisioning during a
> >> reset - as attempt to resolve issue mentioned in [1]
> >>
> >> [1]
> >> https://lore.kernel.org/intel-xe/3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com/
> >>
> > 
> > Thanks for the ref.
> > 
> > Matt
> > 
> >>
> >>>
> >>> Matt
> >>>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/Makefile           |   1 +
> >>>>  drivers/gpu/drm/xe/xe_guc_buf.c       | 387 ++++++++++++++++++++++++++
> >>>>  drivers/gpu/drm/xe/xe_guc_buf.h       |  48 ++++
> >>>>  drivers/gpu/drm/xe/xe_guc_buf_types.h |  40 +++
> >>>>  4 files changed, 476 insertions(+)
> >>>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
> >>>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
> >>>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >>>> index da80c29aa363..0aed652dc806 100644
> >>>> --- a/drivers/gpu/drm/xe/Makefile
> >>>> +++ b/drivers/gpu/drm/xe/Makefile
> >>>> @@ -56,6 +56,7 @@ xe-y += xe_bb.o \
> >>>>  	xe_gt_topology.o \
> >>>>  	xe_guc.o \
> >>>>  	xe_guc_ads.o \
> >>>> +	xe_guc_buf.o \
> >>>>  	xe_guc_capture.o \
> >>>>  	xe_guc_ct.o \
> >>>>  	xe_guc_db_mgr.o \
> >>>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> >>>> new file mode 100644
> >>>> index 000000000000..a49be711ea86
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> >>>> @@ -0,0 +1,387 @@
> >>>> +// SPDX-License-Identifier: MIT
> >>>> +/*
> >>>> + * Copyright © 2024 Intel Corporation
> >>>> + */
> >>>> +
> >>>> +#include <linux/bitmap.h>
> >>>> +#include <linux/cleanup.h>
> >>>> +#include <linux/mutex.h>
> >>>> +
> >>>> +#include <drm/drm_managed.h>
> >>>> +
> >>>> +#include "xe_assert.h"
> >>>> +#include "xe_bo.h"
> >>>> +#include "xe_gt_printk.h"
> >>>> +#include "xe_guc.h"
> >>>> +#include "xe_guc_buf.h"
> >>>> +
> >>>> +/**
> >>>> + * DOC: GuC Buffer Cache
> >>>> + *
> >>>> + * The purpose of the `GuC Buffer Cache`_ is to prepare a cached buffer for use
> >>>> + * by the GuC `CTB based communication` actions that require an indirect data to
> >>>> + * be passed in a separate GPU memory location, that needs to be available only
> >>>> + * during processing of that GuC action.
> >>>> + *
> >>>> + * The xe_guc_buf_cache_init() will allocate and initialize the cache object.
> >>>> + * The object is drm managed and will be allocated with GFP_KERNEL flag.
> >>>> + * The size of the underlying GPU memory buffer will be aligned to SZ_4K.
> >>>> + * The cache will then support up to BITS_PER_LONG a sub-allocations from that
> >>>> + * data buffer. Each sub-allocation will be at least aligned to SZ_64.
> >>>> + *
> >>>> + * ::
> >>>> + *
> >>>> + *       <------> chunk (n * 64)
> >>>> + *       <------------- CPU mirror (n * 4K) -------------------------------->
> >>>> + *      +--------+--------+--------+--------+-----------------------+--------+
> >>>> + *      |   0    |   1    |   2    |   3    |                       |   m    |
> >>>> + *      +--------+--------+--------+--------+-----------------------+--------+
> >>>> + *                                                 ||       /\
> >>>> + *                                                flush     ||
> >>>> + *                                                 ||      sync
> >>>> + *                                                 \/       ||
> >>>> + *      +--------+--------+--------+--------+-----------------------+--------+
> >>>> + *      |   0    |   1    |   2    |   3    |                       |   m    |
> >>>> + *      +--------+--------+--------+--------+-----------------------+--------+
> >>>> + *       <--------- GPU allocation (n * 4K) -------------------------------->
> >>>> + *       <------> chunk (n * 64)
> >>>> + *
> >>>> + * The xe_guc_buf_reserve() will return a reference to a new sub-allocation.
> >>>> + * The xe_guc_buf_release() shall be used to release a such sub-allocation.
> >>>> + *
> >>>> + * The xe_guc_buf_cpu_ptr() will provide access to the sub-allocation.
> >>>> + * The xe_guc_buf_flush() shall be used to flush data from any mirror buffer to
> >>>> + * the underlying GPU memory.
> >>>> + *
> >>>> + * The xe_guc_buf_gpu_addr() will provide a GPU address of the sub-allocation.
> >>>> + * The xe_guc_buf_sync() might be used to copy the content of the sub-allocation
> >>>> + * from the GPU memory to the local mirror buffer.
> >>>> + */
> >>>> +
> >>>> +static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
> >>>> +{
> >>>> +	return cache->guc;
> >>>> +}
> >>>> +
> >>>> +static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
> >>>> +{
> >>>> +	return guc_to_gt(cache_to_guc(cache));
> >>>> +}
> >>>> +
> >>>> +static struct xe_device *cache_to_xe(struct xe_guc_buf_cache *cache)
> >>>> +{
> >>>> +	return gt_to_xe(cache_to_gt(cache));
> >>>> +}
> >>>> +
> >>>> +static struct mutex *cache_mutex(struct xe_guc_buf_cache *cache)
> >>>> +{
> >>>> +	return &cache_to_guc(cache)->ct.lock;
> >>>> +}
> >>>> +
> >>>> +static void __fini_cache(void *arg)
> >>>> +{
> >>>> +	struct xe_guc_buf_cache *cache = arg;
> >>>> +	struct xe_gt *gt = cache_to_gt(cache);
> >>>> +
> >>>> +	if (cache->used)
> >>>> +		xe_gt_dbg(gt, "buffer cache unclean: %#lx = %u * %u bytes\n",
> >>>> +			  cache->used, bitmap_weight(&cache->used, BITS_PER_LONG), cache->chunk);
> >>>> +
> >>>> +	kvfree(cache->mirror);
> >>>> +	cache->mirror = NULL;
> >>>> +	cache->bo = NULL;
> >>>> +	cache->used = 0;
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_cache_init() - Allocate and initialize a GuC Buffer Cache.
> >>>> + * @guc: the &xe_guc where this cache will be used
> >>>> + * @size: minimum size of the cache
> >>>> + *
> >>>> + * See `GuC Buffer Cache`_ for details.
> >>>> + *
> >>>> + * Return: pointer to the &xe_guc_buf_cache on success or a ERR_PTR() on failure.
> >>>> + */
> >>>> +struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size)
> >>>> +{
> >>>> +	struct xe_gt *gt = guc_to_gt(guc);
> >>>> +	struct xe_tile *tile = gt_to_tile(gt);
> >>>> +	struct xe_device *xe = tile_to_xe(tile);
> >>>> +	struct xe_guc_buf_cache *cache;
> >>>> +	u32 chunk_size;
> >>>> +	u32 cache_size;
> >>>> +	int ret;
> >>>> +
> >>>> +	cache_size = ALIGN(size, SZ_4K);
> >>>> +	chunk_size = cache_size / BITS_PER_LONG;
> >>>> +
> >>>> +	xe_gt_assert(gt, size);
> >>>> +	xe_gt_assert(gt, IS_ALIGNED(chunk_size, SZ_64));
> >>>> +
> >>>> +	cache = drmm_kzalloc(&xe->drm, sizeof(*cache), GFP_KERNEL);
> >>>> +	if (!cache)
> >>>> +		return ERR_PTR(-ENOMEM);
> >>>> +
> >>>> +	cache->bo = xe_managed_bo_create_pin_map(xe, tile, cache_size,
> >>>> +						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> >>>> +						 XE_BO_FLAG_GGTT |
> >>>> +						 XE_BO_FLAG_GGTT_INVALIDATE);
> >>>> +	if (IS_ERR(cache->bo))
> >>>> +		return ERR_CAST(cache->bo);
> >>>> +
> >>>> +	cache->guc = guc;
> >>>> +	cache->chunk = chunk_size;
> >>>> +	cache->mirror = kvzalloc(cache_size, GFP_KERNEL);
> >>>> +	if (!cache->mirror)
> >>>> +		return ERR_PTR(-ENOMEM);
> >>>> +
> >>>> +	ret = devm_add_action_or_reset(xe->drm.dev, __fini_cache, cache);
> >>>> +	if (ret)
> >>>> +		return ERR_PTR(ret);
> >>>> +
> >>>> +	xe_gt_dbg(gt, "buffer cache at %#x (%uKiB = %u x %zu dwords) for %ps\n",
> >>>> +		  xe_bo_ggtt_addr(cache->bo), cache_size / SZ_1K,
> >>>> +		  BITS_PER_LONG, chunk_size / sizeof(u32), __builtin_return_address(0));
> >>>> +	return cache;
> >>>> +}
> >>>> +
> >>>> +static bool cache_is_ref_active(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	lockdep_assert_held(cache_mutex(cache));
> >>>> +	return bitmap_subset(&ref, &cache->used, BITS_PER_LONG);
> >>>> +}
> >>>> +
> >>>> +static bool ref_is_valid(unsigned long ref)
> >>>> +{
> >>>> +	return ref && find_next_bit(&ref, BITS_PER_LONG,
> >>>> +				    find_first_bit(&ref, BITS_PER_LONG) +
> >>>> +				    bitmap_weight(&ref, BITS_PER_LONG)) == BITS_PER_LONG;
> >>>> +}
> >>>> +
> >>>> +static void cache_assert_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	xe_gt_assert_msg(cache_to_gt(cache), ref_is_valid(ref),
> >>>> +			 "# malformed ref %#lx %*pbl", ref, (int)BITS_PER_LONG, &ref);
> >>>> +	xe_gt_assert_msg(cache_to_gt(cache), cache_is_ref_active(cache, ref),
> >>>> +			 "# stale ref %#lx %*pbl vs used %#lx %*pbl",
> >>>> +			 ref, (int)BITS_PER_LONG, &ref,
> >>>> +			 cache->used, (int)BITS_PER_LONG, &cache->used);
> >>>> +}
> >>>> +
> >>>> +static unsigned long cache_reserve(struct xe_guc_buf_cache *cache, u32 size)
> >>>> +{
> >>>> +	unsigned long index;
> >>>> +	unsigned int nbits;
> >>>> +
> >>>> +	lockdep_assert_held(cache_mutex(cache));
> >>>> +	xe_gt_assert(cache_to_gt(cache), size);
> >>>> +	xe_gt_assert(cache_to_gt(cache), size <= BITS_PER_LONG * cache->chunk);
> >>>> +
> >>>> +	nbits = DIV_ROUND_UP(size, cache->chunk);
> >>>> +	index = bitmap_find_next_zero_area(&cache->used, BITS_PER_LONG, 0, nbits, 0);
> >>>> +	if (index >= BITS_PER_LONG) {
> >>>> +		xe_gt_dbg(cache_to_gt(cache), "no space for %u byte%s in cache at %#x used %*pbl\n",
> >>>> +			  size, str_plural(size), xe_bo_ggtt_addr(cache->bo),
> >>>> +			  (int)BITS_PER_LONG, &cache->used);
> >>>> +		return 0;
> >>>> +	}
> >>>> +
> >>>> +	bitmap_set(&cache->used, index, nbits);
> >>>> +
> >>>> +	return GENMASK(index + nbits - 1, index);
> >>>> +}
> >>>> +
> >>>> +static u64 cache_ref_offset(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	cache_assert_ref(cache, ref);
> >>>> +	return __ffs(ref) * cache->chunk;
> >>>> +}
> >>>> +
> >>>> +static u32 cache_ref_size(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	cache_assert_ref(cache, ref);
> >>>> +	return hweight_long(ref) * cache->chunk;
> >>>> +}
> >>>> +
> >>>> +static u64 cache_ref_gpu_addr(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	return xe_bo_ggtt_addr(cache->bo) + cache_ref_offset(cache, ref);
> >>>> +}
> >>>> +
> >>>> +static void *cache_ref_cpu_ptr(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	return cache->mirror + cache_ref_offset(cache, ref);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_reserve() - Reserve a new sub-allocation.
> >>>> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> >>>> + * @size: the requested size of the buffer
> >>>> + *
> >>>> + * Use xe_guc_buf_is_valid() to check if returned buffer reference is valid.
> >>>> + * Must use xe_guc_buf_release() to release a sub-allocation.
> >>>> + *
> >>>> + * Return: a &xe_guc_buf of new sub-allocation.
> >>>> + */
> >>>> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size)
> >>>> +{
> >>>> +	guard(mutex)(cache_mutex(cache));
> >>>> +	unsigned long ref;
> >>>> +
> >>>> +	ref = cache_reserve(cache, size);
> >>>> +
> >>>> +	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_from_data() - Reserve a new sub-allocation using data.
> >>>> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> >>>> + * @data: the data to flush the sub-allocation
> >>>> + * @size: the size of the data
> >>>> + *
> >>>> + * Similar to xe_guc_buf_reserve() but flushes @data to the GPU memory.
> >>>> + *
> >>>> + * Return: a &xe_guc_buf of new sub-allocation.
> >>>> + */
> >>>> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> >>>> +				       const void *data, size_t size)
> >>>> +{
> >>>> +	guard(mutex)(cache_mutex(cache));
> >>>> +	unsigned long ref;
> >>>> +
> >>>> +	ref = cache_reserve(cache, size);
> >>>> +	if (ref) {
> >>>> +		u32 offset = cache_ref_offset(cache, ref);
> >>>> +
> >>>> +		xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
> >>>> +				 offset, data, size);
> >>>> +	}
> >>>> +
> >>>> +	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
> >>>> +}
> >>>> +
> >>>> +static void cache_release_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	cache_assert_ref(cache, ref);
> >>>> +	cache->used &= ~ref;
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_release() - Release a sub-allocation.
> >>>> + * @buf: the &xe_guc_buf to release
> >>>> + *
> >>>> + * Releases a sub-allocation reserved by xe_guc_buf_reserve().
> >>>> + */
> >>>> +void xe_guc_buf_release(const struct xe_guc_buf buf)
> >>>> +{
> >>>> +	guard(mutex)(cache_mutex(buf.cache));
> >>>> +
> >>>> +	if (!buf.ref)
> >>>> +		return;
> >>>> +
> >>>> +	cache_release_ref(buf.cache, buf.ref);
> >>>> +}
> >>>> +
> >>>> +static u64 cache_flush_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	u32 offset = cache_ref_offset(cache, ref);
> >>>> +	u32 size = cache_ref_size(cache, ref);
> >>>> +
> >>>> +	xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
> >>>> +			 offset, cache->mirror + offset, size);
> >>>> +
> >>>> +	return cache_ref_gpu_addr(cache, ref);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
> >>>> + * @buf: the &xe_guc_buf to flush
> >>>> + *
> >>>> + * Return: a GPU address of the sub-allocation.
> >>>> + */
> >>>> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
> >>>> +{
> >>>> +	guard(mutex)(cache_mutex(buf.cache));
> >>>> +
> >>>> +	return cache_flush_ref(buf.cache, buf.ref);
> >>>> +}
> >>>> +
> >>>> +static void *cache_sync_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> >>>> +{
> >>>> +	u32 offset = cache_ref_offset(cache, ref);
> >>>> +	u32 size = cache_ref_size(cache, ref);
> >>>> +
> >>>> +	xe_map_memcpy_from(cache_to_xe(cache), cache->mirror + offset,
> >>>> +			   &cache->bo->vmap, offset, size);
> >>>> +
> >>>> +	return cache_ref_cpu_ptr(cache, ref);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
> >>>> + * @buf: the &xe_guc_buf to sync
> >>>> + *
> >>>> + * Return: the CPU pointer to the sub-allocation.
> >>>> + */
> >>>> +void *xe_guc_buf_sync(const struct xe_guc_buf buf)
> >>>> +{
> >>>> +	guard(mutex)(cache_mutex(buf.cache));
> >>>> +
> >>>> +	return cache_sync_ref(buf.cache, buf.ref);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
> >>>> + * @buf: the &xe_guc_buf to query
> >>>> + *
> >>>> + * Return: the CPU pointer of the sub-allocation.
> >>>> + */
> >>>> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf)
> >>>> +{
> >>>> +	guard(mutex)(cache_mutex(buf.cache));
> >>>> +
> >>>> +	return cache_ref_cpu_ptr(buf.cache, buf.ref);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_gpu_addr() - Obtain a GPU address of the sub-allocation.
> >>>> + * @buf: the &xe_guc_buf to query
> >>>> + *
> >>>> + * Return: the GPU address of the sub-allocation.
> >>>> + */
> >>>> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf)
> >>>> +{
> >>>> +	guard(mutex)(cache_mutex(buf.cache));
> >>>> +
> >>>> +	return cache_ref_gpu_addr(buf.cache, buf.ref);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_cache_gpu_addr_from_ptr() - Lookup a GPU address using the pointer.
> >>>> + * @cache: the &xe_guc_buf_cache with sub-allocations
> >>>> + * @ptr: the CPU pointer to the data from a sub-allocation
> >>>> + * @size: the size of the data at @ptr
> >>>> + *
> >>>> + * Return: the GPU address on success or 0 on failure.
> >>>> + */
> >>>> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size)
> >>>> +{
> >>>> +	guard(mutex)(cache_mutex(cache));
> >>>> +	ptrdiff_t offset = ptr - cache->mirror;
> >>>> +	unsigned long ref;
> >>>> +	int first, last;
> >>>> +
> >>>> +	if (offset < 0)
> >>>> +		return 0;
> >>>> +
> >>>> +	first = div_u64(offset, cache->chunk);
> >>>> +	last = DIV_ROUND_UP(offset + max(1, size), cache->chunk) - 1;
> >>>> +
> >>>> +	if (last >= BITS_PER_LONG)
> >>>> +		return 0;
> >>>> +
> >>>> +	ref = GENMASK(last, first);
> >>>> +	cache_assert_ref(cache, ref);
> >>>> +
> >>>> +	return xe_bo_ggtt_addr(cache->bo) + offset;
> >>>> +}
> >>>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> >>>> new file mode 100644
> >>>> index 000000000000..700e7b06c149
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> >>>> @@ -0,0 +1,48 @@
> >>>> +/* SPDX-License-Identifier: MIT */
> >>>> +/*
> >>>> + * Copyright © 2024 Intel Corporation
> >>>> + */
> >>>> +
> >>>> +#ifndef _XE_GUC_BUF_H_
> >>>> +#define _XE_GUC_BUF_H_
> >>>> +
> >>>> +#include <linux/cleanup.h>
> >>>> +
> >>>> +#include "xe_guc_buf_types.h"
> >>>> +
> >>>> +struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size);
> >>>> +
> >>>> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size);
> >>>> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> >>>> +				       const void *data, size_t size);
> >>>> +void xe_guc_buf_release(const struct xe_guc_buf buf);
> >>>> +
> >>>> +/**
> >>>> + * xe_guc_buf_is_valid() - Check if the GuC Buffer Cache sub-allocation is valid.
> >>>> + * @buf: the &xe_guc_buf reference to check
> >>>> + *
> >>>> + * Return: true if @buf represents a valid sub-allocation.
> >>>> + */
> >>>> +static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
> >>>> +{
> >>>> +	return buf.ref;
> >>>> +}
> >>>> +
> >>>> +void *xe_guc_buf_sync(const struct xe_guc_buf buf);
> >>>> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
> >>>> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> >>>> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
> >>>> +
> >>>> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
> >>>> +
> >>>> +DEFINE_CLASS(xe_guc_buf, struct xe_guc_buf,
> >>>> +	     xe_guc_buf_release(_T),
> >>>> +	     xe_guc_buf_reserve(cache, size),
> >>>> +	     struct xe_guc_buf_cache *cache, u32 size);
> >>>> +
> >>>> +DEFINE_CLASS(xe_guc_buf_from_data, struct xe_guc_buf,
> >>>> +	     xe_guc_buf_release(_T),
> >>>> +	     xe_guc_buf_from_data(cache, data, size),
> >>>> +	     struct xe_guc_buf_cache *cache, const void *data, u32 size);
> >>>> +
> >>>> +#endif
> >>>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> >>>> new file mode 100644
> >>>> index 000000000000..fe93b32e97f8
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> >>>> @@ -0,0 +1,40 @@
> >>>> +/* SPDX-License-Identifier: MIT */
> >>>> +/*
> >>>> + * Copyright © 2024 Intel Corporation
> >>>> + */
> >>>> +
> >>>> +#ifndef _XE_GUC_BUF_TYPES_H_
> >>>> +#define _XE_GUC_BUF_TYPES_H_
> >>>> +
> >>>> +#include <linux/types.h>
> >>>> +
> >>>> +struct xe_bo;
> >>>> +struct xe_guc;
> >>>> +
> >>>> +/**
> >>>> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> >>>> + */
> >>>> +struct xe_guc_buf_cache {
> >>>> +	/** @guc: the parent GuC where buffers are used */
> >>>> +	struct xe_guc *guc;
> >>>> +	/** @bo: the main cache buffer object with GPU allocation */
> >>>> +	struct xe_bo *bo;
> >>>> +	/** @mirror: the CPU pointer to the data buffer */
> >>>> +	void *mirror;
> >>>> +	/** @used: the bitmap used to track allocated chunks */
> >>>> +	unsigned long used;
> >>>> +	/** @chunk: the size of the smallest sub-allocation */
> >>>> +	u32 chunk;
> >>>> +};
> >>>> +
> >>>> +/**
> >>>> + * struct xe_guc_buf - GuC Data Buffer Reference.
> >>>> + */
> >>>> +struct xe_guc_buf {
> >>>> +	/** @cache: the cache where this allocation belongs */
> >>>> +	struct xe_guc_buf_cache *cache;
> >>>> +	/** @ref: the internal reference */
> >>>> +	unsigned long ref;
> >>>> +};
> >>>> +
> >>>> +#endif
> >>>> -- 
> >>>> 2.43.0
> >>>>
> >>
> 
