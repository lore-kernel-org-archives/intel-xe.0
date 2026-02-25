Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB72FD45F3
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035AE10E0E5;
	Wed, 25 Feb 2026 20:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OztBY6DL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A993510E0E5
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772052781; x=1803588781;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j3+4lWAf4JkuObd1P07W52oLPWQFI1Q9eAMkf/heLpE=;
 b=OztBY6DLG0h8KNzszrCjqOqudIYa60N8cIv8pqUFfm5IxVvf/9uS+P+2
 jVGX8Urls4e7KbVQAubJzR/tjp+QZScxZRaJ+k/tVUV5qwtwFj9UMkbsO
 4ccaaZ6iLdLHxnYiqiQP2C8LxWdcBZZDjV66dPEHXiNGqvk4SVuSHBQu6
 ABAvNQ4Q7ZtnrLa5DYIapR/M6g0XUKOw0V+9SBPiI+H/Rj+IXcMSzh6Ce
 x5J+GDtAhAMdd1VQsweZx//NNU6ht7xocJy0wqo4I4DC0QuWw9sxtHe+2
 WoPDEz0pVVUgchX5Q7tfTglnnEbv7aNunayp6m3VhsIVc9JgZ4o3fHf7S A==;
X-CSE-ConnectionGUID: PIvHELcwQ9WA3A34iyIvig==
X-CSE-MsgGUID: 5tgDTWn/QjKnkoauZSN20g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95717755"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="95717755"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:53:01 -0800
X-CSE-ConnectionGUID: vSOTuzxhRlGCUKmYUo11bw==
X-CSE-MsgGUID: nM47sY9GRquWtNwCZ93Ipg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="254107242"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:53:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 12:53:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 12:53:00 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 12:53:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Inw9SvoEB8pjjjGB6J+kF/LGCQU4tQqpEqLYvlJSDOtMNwnOmJZx4rzyU5ag0tfE6hEJ7B1TbEfX+deOBisv8nc7WG93H6m5J3VBnqcogu/b2MFUB7AJWC0tWI/YmKcGSgVACViGVNw6AYWv261GAhtFibuUXu+X2CzBe5kPXmtdDE574pP3nZSwMa3HCCMYq/Gf6C8btBwatPwAvjm910G7FXX9eW+hg1m+okMxaid42WRicvmMQzd4OyIV/M/pubXRigh5FihjMnnTk7yrcz0vNZmIWRbOUROwMpz8s/0+u2x52lIe+7V09G4B7m5HCkXYFiUPHC1q9efg/PUvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ddv9cmaeByNlZz1dnBmmKnDSkA+tB5M7bK8wDI1puKg=;
 b=dN1NW/o0541O1EwMuHqJozJSTVfVqb2h7rOmbfiKM7PB0YmYPLHOt/RL1qF/oOEzj/Y6IuxQNdE7NAIgDzbtQE7SgrAl0RqJ/vzsxX57aiTkEiAwfwkXntN06mMRUBGFGEAnsPVMa3JpI8VZZLCz3QqWWK7DMApOBbi67GxYuhfD9QmnyLQbAOhyIQvv9+uoxqv2VZYIhCyvT/Gc2pZqkiLmpmJgECVn8ZrMOG4ollWhobu0UaMn9WtQrIAdSon8cXI0sjdLqnyF2GmOk/z8rL4pPTGcDAnYnQ/DH4xCamsYc+MkuMSqSCwhKQHpPt/S9BA+rLo8cS1jEpfA9MH9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 20:52:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 20:52:58 +0000
Date: Wed, 25 Feb 2026 12:52:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
Subject: Re: [PATCH v8 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Message-ID: <aZ9hJiLocpYr+9gi@lstrano-desk.jf.intel.com>
References: <20260220055519.2485681-5-satyanarayana.k.v.p@intel.com>
 <20260220055519.2485681-7-satyanarayana.k.v.p@intel.com>
 <aZ9etVe07ZvkXQoL@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ9etVe07ZvkXQoL@intel.com>
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ed33d4-a242-4b45-3fdb-08de74afdb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: o6nfH2G1+TPlxxUQgNEvhEjs+hK/Irbr/mYEAtKEytFeZ+KluNZXkEouD9wpQftFCUYj+EN5zrTv8U3ZY4EWcCB21f0xa0X/fr31vB4XfSU5h4U81oU5LDi9AhV22rPmbGfNxYlYxY0JYE6u2+T9WlCYQmDSK6D3/kZbuGqEXx6qLyD2Rj6sviN5iK6yoNqydMpklbSlertKhhBewfULKA75GH93vts3hj0NDACdi4fnzODSTwhwxs/5OEvsixpUhxqSde4yaUj2ySaqZek4O3hEcLwo/v57MrhCVO2sn+A8dAImUOOpG76mXKJaPoKWfcZOnhJe9/00hlHaG5DGgIk8XR76ZSo9caxTyATk3m2VrHMJMo/MwXOq4C2T2KuX48sGG+tn4Y5l9StJGPH1LR0ohe1dKqACrFHyKqcafwtG1n9IMKO7idCwICy87myXjbhnx6SXyv3FolCdg8FKUUZLYihDXl4Q3DwLOshj0UZ5NEN7isYfmahv3gmsP+8iUmwM7nRASoRvNz3EDVaPdXfkLPoICHEbO8DsNr4TlHLVe+QiFrS8TYcb3/FBGYyd/o/oXLGWC3vbQm4AS4U747NdImslhkGmsUHpCs3ltmnQbcJjV4WDRd+Bg7wNk2gP/iteyTUxZLqd8pBenzLqpkKLuUcdfIJT8t4byC8HZROMZcchuTaaY2nJl5zFtCGK0Hcwx56PIZ7GJzAoAoF3CZiMbwY4L6/rKosZ87JqGb8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnVMMGR0eGsxNFpnelgyeU9zK1hXbzdES25rUUNuaGNyUGlIVVplMWNzVklH?=
 =?utf-8?B?cGFRelQ0cis0ZUhOenZ4VVo3Zkx4NDEvU2lYZ01nVHArckt0Y2FNaVRHanc3?=
 =?utf-8?B?R2RZR3NWaDhPVXJKakxkamZ3ZXp1REZpR3B5Rm50VkYwK3VLazgxNU5EOUxy?=
 =?utf-8?B?TS9TK1NDUDh3dWZoSWlHOS9WRzl2NXlQYzRURWpUb2hYWnM0ZlhYZGNlclhq?=
 =?utf-8?B?WlpKNXhOcDJOLzlsSnE5NWFEbitWREM2UnMzL1g0Q25DUDBXYlV6TkpETjFG?=
 =?utf-8?B?UnNZVjNRU2RvVEtrNGlIWjkwbzA3QTFYVnhtVmhoTUgzcW5Sb2tmcWt4Y0tH?=
 =?utf-8?B?aXRyYjJhOFZsdDZJbHluYTU5eEN4b0ZPdUJ3ZEJSeFhlK3lJTlBxZVdNL3N5?=
 =?utf-8?B?WjQwYUN2bkFtRVJJTHN6SmRGOG9QdGhmQXFhbmsrSnhjTjRLZ0R2MmM2TGpP?=
 =?utf-8?B?T3ExYlB1MFBmeTlWQUVlR2szc2JHQmhDaEFPUmk0UVhiQmo4d295QXJZNHdu?=
 =?utf-8?B?VUJRazZBNjFlMzRWR2x2UEZMeHJIcjhHWlNPblBXWTNDRmVoMEJkMkU1bjcy?=
 =?utf-8?B?OXE0b2taMEljU1V2SDliTWt2MndXMnp5SFdvb21zWjIzWXlQQ3U0WmxQMFJu?=
 =?utf-8?B?TVZ4eTJNWGxPeG84aHcrTkttU2NpdUVDendnbHNqMGNRWDRwT1Y2MitQTlUw?=
 =?utf-8?B?SmZxWkhDQmRSNGxoVUNvam5IQjRiR2ttdlpIbEdzUDNVb1djT2FTWTJOYVN2?=
 =?utf-8?B?eitGTU43OHZoQ1lEc3VJVkFBK0RhUVBpaVhrQmdwRDNsSFBHbU1ML0VOWnIx?=
 =?utf-8?B?RmlBMlc4QlZueU45SzMxYmdESWtPTWZqVHF2dll4Z2d2a0F1SkxWWnJyUTd5?=
 =?utf-8?B?U0ljamEwZ2VsZEFwU1RFYXpDdy9RSlZjelZXb0l6d0VsRy9Ecnl6dUREVndJ?=
 =?utf-8?B?VU1wTFI5TXNKczJqTDlpM1JjcnZiVjhQdmJnUExTSmtrNXNqWkc1NXlLNGVh?=
 =?utf-8?B?V0ZXVjl0dXlrY243MkducHNzRVJoZitCRVFZRlhUQ2V3KzdwZCtmREpvYUsx?=
 =?utf-8?B?QjVqcmNxeEc3Mm9nZmJ6MUc5TlpUWnBHMG1WT0ZDcnFqNVRzUGh6bGJ1Vmx6?=
 =?utf-8?B?NmRaSGJDSUdBU2RSME9EMG5tYXhRVUQ1OHgxazV5NFVCUWRLQVdRcXpWZVZR?=
 =?utf-8?B?VkMwcVZoZTNlQUxGL2MrVExKRDNUdnJEejZHZXRJU0FMbzJDeVlQWE9LVnlm?=
 =?utf-8?B?dFhPZ3pjWWJyNEl3TkhybTlBNnJ1dHhoVHA1eG03cFNjTjZyQU5tTkdZalVa?=
 =?utf-8?B?SENxSmQ2eUl0WldnY3p1OHB1bVNuNk1oU1NHSEg1L292YXY0TVNOQlgvWWg1?=
 =?utf-8?B?dENaUjNKTWVaVmhXSVY4S2RiR3lLeDlyMys3blJTQnNKVzJzQzZYNE8zRU4z?=
 =?utf-8?B?WWR2blM4dFJGNmI1NVFkdXBFbzJsZnVVc0U0MDQ5N0xCbnBCWHd4SW84dzVK?=
 =?utf-8?B?NFRmVXA0a0ZWQXM0ZU03NWVwK01YdzBMckh3ekJZdnlpYm5Obk96ZUFiWXRn?=
 =?utf-8?B?Yk1Bek5tdnJrdFdzMHdtaUZ4Rk5IMDFVTE9oSUNZWGtsVXRkdzI1Qk5aQVFt?=
 =?utf-8?B?WmdsdDBHZzRGcnNWQk9KM3BsSUxJRG5xdDFHck1HWWxUNlNER2hUckwrb2Qr?=
 =?utf-8?B?d0orajhqenNEY0pOeDFINisxYVU3MWNSd1A4MzcxZjZITXFSRWREUWpPQktO?=
 =?utf-8?B?YWc5eEVXL1RGb1dKd2haZVNDS0cvRURmYlZoQ2dXTmtybFFRWS9hMXpZdGpN?=
 =?utf-8?B?MnlseWcycTdQU3FDellSUjlrTHF1cXBacXdUSnJwWmVLTmhPNXViU3p3L0N3?=
 =?utf-8?B?b2hkSDlvVlRiVXFJdjZNZyt2V3U5Z2pOa0pVcTdScWVDK0lGVmhjWUdlZWh2?=
 =?utf-8?B?emFMay82dGpWbklPSXRjMEprRWVoS1ZOMmhMNlpsdkRqb3c0NHZDWWZSSjZ1?=
 =?utf-8?B?VnBOWUtObmh5bElpL1FSQjR6Qnl2d1lmWHdwbWVpR2hFQUZGdVJzYzRrU3ND?=
 =?utf-8?B?RWtFZXhNa29VRURKQ1dvME9DTGVKSlM2cU1GM3Ezd21ZY295UEVhZEw4OE5h?=
 =?utf-8?B?T3ZEc0orNW81MmRsUVByQm8yQmlnaGVaQmg5Y3pqYXRxU0dxblNzd0FWaGRs?=
 =?utf-8?B?M0I1YnpCOEtid09wWk9GWmE4UllUY3I4SjZ5ZmdVcHpTOGZMTGlJMUlkUFN5?=
 =?utf-8?B?QXQ1eHprMEswZTE2bjBiOEdYVHFDTlp5clFBTkwzZXhrbUU2NWNqK0lxTDlN?=
 =?utf-8?B?VkN5Si9EbzVidEI3RjRSTExTYkgxYUdLVWk1ZW0zcGFCbVBSZTFlVlo4MFY1?=
 =?utf-8?Q?IwZ9uo0Rv+C8hREE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ed33d4-a242-4b45-3fdb-08de74afdb43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:52:58.1385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IolkzR5lXwXDA+UoIgn7lYza0NURlbX0YwcekjTj3QI3bFFzrBji8yPE4QqcacUWedIhF927mHbQWI51+mZ56w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
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

On Wed, Feb 25, 2026 at 03:42:29PM -0500, Rodrigo Vivi wrote:
> On Fri, Feb 20, 2026 at 05:55:22AM +0000, Satyanarayana K V P wrote:
> > CCS save/restore batch buffers are attached during BO allocation and
> > detached during BO teardown. The shrinker triggers xe_bo_move(), which is
> > used for both allocation and deletion paths.
> > 
> > When BO allocation and shrinking occur concurrently, a circular locking
> > dependency involving fs_reclaim and swap_guard can occur, leading to a
> > deadlock such as:
> > 
> > *===============================================================*
> > *    WARNING: possible circular locking dependency detected	*
> > *---------------------------------------------------------------*
> > *								*
> > *      CPU0                    CPU1				*
> > *      ----                    ----				*
> > * lock(fs_reclaim);						*
> > *                              lock(&sa_manager->swap_guard);	*
> > *                              lock(fs_reclaim);		*
> > * lock(&sa_manager->swap_guard);				*
> > *								*
> > * *** DEADLOCK ***						*
> > *===============================================================*
> > 
> > To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
> > before taking lock and SA is initialized using xe_bb_init() preventing
> > reclaim from being invoked in this context.
> > 
> > Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> 
> This patch fails to apply on drm-xe-fixes.
> 
> I also tried to apply the first one in this series as the dependency, but
> that also fails. It would be good to get a smaller fix before a refactor.
> 

I was afraid this was going to happen. I keep seeing comments in Fixes
patches along the lines of “let’s also fix up existing style/layering
issues.” While those concerns may be valid, combining them with Fixes
patches creates situations like this where we can’t easily apply
changes. Just calling out a pattern I’m noticing and the unintended
consequences it causes.

> If we need this fix in 7.0 and older, please consider providing a
> ported version on top of drm-xe-fixes.
> 

I think for 7.0 we should get this in since it’s still early in the
cycle. For older kernels, we can likely omit it, as SR-IOV customers of
PTL are probably using a backported kernel anyway, and these fixes will
have to be pulled into that kernel manually regardless.

Matt

> Thanks,
> Rodrigo.
> 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > V7 -> V8:
> > - None.
> > 
> > V6 -> V7:
> > - Dropped R-B as some release sequence is changed.
> > - Dropped xe_bb_release() and used existing xe_bb_free().
> > 
> > V5 -> V6:
> > - Updated drm_suballoc_init() to drm_suballoc_insert(). (Maarten).
> > 
> > V4 -> V5:
> > - Removed enum xe_sriov_vf_ccs_rw_ctxs from xe_bb.h as it is not used
> >   any more (Michal).
> > 
> > V3 -> V4:
> > - Fixed some nits (Michal).
> > 
> > V2 -> V3:
> > - Updated commit message (Matt, Thomas & Christian).
> > - Removed timeout logic from drm_suballoc_init(). (Thomas &
> > Christian).
> > 
> > V1 -> V2:
> > - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> > drm_suballoc_init() (Thomas).
> > ---
> >  drivers/gpu/drm/xe/xe_bb.c      | 59 ++++++++++++++------
> >  drivers/gpu/drm/xe/xe_bb.h      |  6 +-
> >  drivers/gpu/drm/xe/xe_migrate.c | 99 ++++++++++++++++++---------------
> >  drivers/gpu/drm/xe/xe_sa.c      | 30 ++++++++++
> >  drivers/gpu/drm/xe/xe_sa.h      |  2 +
> >  5 files changed, 132 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > index 8b678297aaa2..b0aceaec2685 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.c
> > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > @@ -59,16 +59,51 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> >  	return ERR_PTR(err);
> >  }
> >  
> > -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> > +/**
> > + * xe_bb_alloc() - Allocate a new batch buffer structure
> > + * @gt: the &xe_gt
> > + *
> > + * Allocates and initializes a new xe_bb structure with an associated
> > + * uninitialized suballoc object.
> > + *
> > + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> > + */
> > +struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
> >  {
> >  	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > -	struct xe_device *xe = gt_to_xe(gt);
> > -	struct xe_sa_manager *bb_pool;
> >  	int err;
> >  
> >  	if (!bb)
> >  		return ERR_PTR(-ENOMEM);
> > +
> > +	bb->bo = xe_sa_bo_alloc(GFP_KERNEL);
> > +	if (IS_ERR(bb->bo)) {
> > +		err = PTR_ERR(bb->bo);
> > +		goto err;
> > +	}
> > +
> > +	return bb;
> > +
> > +err:
> > +	kfree(bb);
> > +	return ERR_PTR(err);
> > +}
> > +
> > +/**
> > + * xe_bb_init() - Initialize a batch buffer with memory from a sub-allocator pool
> > + * @bb: Batch buffer structure to initialize
> > + * @bb_pool: Suballoc memory pool to allocate from
> > + * @dwords: Number of dwords to be allocated
> > + *
> > + * Initializes the batch buffer by allocating memory from the specified
> > + * suballoc pool.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords)
> > +{
> > +	int err;
> > +
> >  	/*
> >  	 * We need to allocate space for the requested number of dwords &
> >  	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> > @@ -76,22 +111,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> >  	 * is not over written when the last chunk of SA is allocated for BB.
> >  	 * So, this extra DW acts as a guard here.
> >  	 */
> > -
> > -	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> > -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> > -
> > -	if (IS_ERR(bb->bo)) {
> > -		err = PTR_ERR(bb->bo);
> > -		goto err;
> > -	}
> > +	err = xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
> > +	if (err)
> > +		return err;
> >  
> >  	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> >  	bb->len = 0;
> >  
> > -	return bb;
> > -err:
> > -	kfree(bb);
> > -	return ERR_PTR(err);
> > +	return 0;
> >  }
> >  
> >  static struct xe_sched_job *
> > diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> > index 2a8adc9a6dee..231870b24c2f 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.h
> > +++ b/drivers/gpu/drm/xe/xe_bb.h
> > @@ -12,12 +12,12 @@ struct dma_fence;
> >  
> >  struct xe_gt;
> >  struct xe_exec_queue;
> > +struct xe_sa_manager;
> >  struct xe_sched_job;
> > -enum xe_sriov_vf_ccs_rw_ctxs;
> >  
> >  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> > -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> > +struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
> > +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
> >  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> >  				      struct xe_bb *bb);
> >  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 078a9bc2821d..333af7b57ae9 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -25,6 +25,7 @@
> >  #include "xe_exec_queue.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_printk.h"
> >  #include "xe_hw_engine.h"
> >  #include "xe_lrc.h"
> >  #include "xe_map.h"
> > @@ -1148,65 +1149,73 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  		size -= src_L0;
> >  	}
> >  
> > +	bb = xe_bb_alloc(gt);
> > +	if (IS_ERR(bb))
> > +		return PTR_ERR(bb);
> > +
> >  	bb_pool = ctx->mem.ccs_bb_pool;
> > -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> > -	xe_sa_bo_swap_shadow(bb_pool);
> > +	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> > +		xe_sa_bo_swap_shadow(bb_pool);
> >  
> > -	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> > -	if (IS_ERR(bb)) {
> > -		drm_err(&xe->drm, "BB allocation failed.\n");
> > -		err = PTR_ERR(bb);
> > -		return err;
> > -	}
> > +		err = xe_bb_init(bb, bb_pool, batch_size);
> > +		if (err) {
> > +			xe_gt_err(gt, "BB allocation failed.\n");
> > +			xe_bb_free(bb, NULL);
> > +			return err;
> > +		}
> >  
> > -	batch_size_allocated = batch_size;
> > -	size = xe_bo_size(src_bo);
> > -	batch_size = 0;
> > +		batch_size_allocated = batch_size;
> > +		size = xe_bo_size(src_bo);
> > +		batch_size = 0;
> >  
> > -	/*
> > -	 * Emit PTE and copy commands here.
> > -	 * The CCS copy command can only support limited size. If the size to be
> > -	 * copied is more than the limit, divide copy into chunks. So, calculate
> > -	 * sizes here again before copy command is emitted.
> > -	 */
> > -	while (size) {
> > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > -		u32 flush_flags = 0;
> > -		u64 ccs_ofs, ccs_size;
> > -		u32 ccs_pt;
> > +		/*
> > +		 * Emit PTE and copy commands here.
> > +		 * The CCS copy command can only support limited size. If the size to be
> > +		 * copied is more than the limit, divide copy into chunks. So, calculate
> > +		 * sizes here again before copy command is emitted.
> > +		 */
> >  
> > -		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> > +		while (size) {
> > +			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > +			u32 flush_flags = 0;
> > +			u64 ccs_ofs, ccs_size;
> > +			u32 ccs_pt;
> >  
> > -		src_L0 = xe_migrate_res_sizes(m, &src_it);
> > +			u32 avail_pts = max_mem_transfer_per_pass(xe) /
> > +					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> >  
> > -		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> > -					      &src_L0_ofs, &src_L0_pt, 0, 0,
> > -					      avail_pts);
> > +			src_L0 = xe_migrate_res_sizes(m, &src_it);
> >  
> > -		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > -		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> > -					      &ccs_pt, 0, avail_pts, avail_pts);
> > -		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> > -		batch_size += EMIT_COPY_CCS_DW;
> > +			batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> > +						      &src_L0_ofs, &src_L0_pt, 0, 0,
> > +						      avail_pts);
> >  
> > -		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> > +			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> > +						      &ccs_pt, 0, avail_pts, avail_pts);
> > +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> > +			batch_size += EMIT_COPY_CCS_DW;
> >  
> > -		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > +			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> >  
> > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > -						  src_L0_ofs, dst_is_pltt,
> > -						  src_L0, ccs_ofs, true);
> > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> >  
> > -		size -= src_L0;
> > -	}
> > +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > +							  src_L0_ofs, dst_is_pltt,
> > +							  src_L0, ccs_ofs, true);
> > +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > +
> > +			size -= src_L0;
> > +		}
> >  
> > -	xe_assert(xe, (batch_size_allocated == bb->len));
> > -	src_bo->bb_ccs[read_write] = bb;
> > +		xe_assert(xe, (batch_size_allocated == bb->len));
> > +		src_bo->bb_ccs[read_write] = bb;
> > +
> > +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> > +		xe_sa_bo_sync_shadow(bb->bo);
> > +	}
> >  
> > -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> > -	xe_sa_bo_sync_shadow(bb->bo);
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> > index b738102575d4..c7ee952e8914 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.c
> > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > @@ -175,6 +175,36 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
> >  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
> >  }
> >  
> > +/**
> > + * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
> > + * @gfp: gfp flags used for memory allocation.
> > + *
> > + * Allocate memory for an uninitialized suballoc object. Intended usage is
> > + * allocate memory for suballoc object outside of a reclaim tainted context
> > + * and then be initialized at a later time in a reclaim tainted context.
> > + *
> > + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> > + */
> > +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
> > +{
> > +	return drm_suballoc_alloc(gfp);
> > +}
> > +
> > +/**
> > + * xe_sa_bo_init() - Initialize a suballocation.
> > + * @sa_manager: pointer to the sa_manager
> > + * @sa: The struct drm_suballoc.
> > + * @size: number of bytes we want to suballocate.
> > + *
> > + * Try to make a suballocation on a pre-allocated suballoc object of size @size.
> > + *
> > + * Return: zero on success, errno on failure.
> > + */
> > +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size)
> > +{
> > +	return drm_suballoc_insert(&sa_manager->base, sa, size, true, 0);
> > +}
> > +
> >  /**
> >   * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
> >   * @sa_bo: the &drm_suballoc to flush
> > diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> > index 05e9a4e00e78..50218b0d1404 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.h
> > +++ b/drivers/gpu/drm/xe/xe_sa.h
> > @@ -38,6 +38,8 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
> >  	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
> >  }
> >  
> > +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
> > +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size);
> >  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> >  void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
> >  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
> > -- 
> > 2.43.0
> > 
