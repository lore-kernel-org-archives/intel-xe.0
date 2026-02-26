Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946BFD8FE4
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDDB10E9DC;
	Thu, 26 Feb 2026 17:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ynbm4YCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37AA10E9DA
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772126819; x=1803662819;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bBcvwkLCDqql613QF+wDgF9KA9xHEnMCJ+TemUhEqag=;
 b=Ynbm4YCKj1R1cb5McUKlXF3kzMtzsA0oMyu4YvH3E+pATvnQvEMjMs7t
 4+3XkRrHmfNEH2mkC2j/xQSZ2F/h7SwI7FysVUd8bwVtzQvOhlSYEKin2
 dAenRd2vKUyANufxwu9WN9rPWpibwwoLZKjSH+wx3fePivYToc08+AiP5
 1IQDTCZllXftaSLbU8KkRbgWLKNz+zEMuNQJJNHxbEbYT+SZFm4q0iUSS
 TF5KnQUKi4RfMwbsGmshDVzr+6FxXNY6LbIkLvuoA0nv/bInDNdEISIrP
 LkhiejGeBl2XhCk5ewITL1kCOMow9vtjj5c32XJLq4ZfW1umBVJSuTPCf Q==;
X-CSE-ConnectionGUID: VE4PsREUQky+xVt34IQpQw==
X-CSE-MsgGUID: isSWu3TVR26ZiI6n3KJ3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72897728"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72897728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:26:59 -0800
X-CSE-ConnectionGUID: sbfCJKtOR0GQpCoRbIWFIw==
X-CSE-MsgGUID: 1Lx3uJI0SlmQ1edPz/UelA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216760261"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:27:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:26:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 09:26:58 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:26:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGXevm8N05BJTUucA0CdxVG9n69OCw8GNouHBG+5fbbg8tbBK7OQuK01qUwnBLlN7/7WLa1TceUaXgrEKzN1sPbrqcQXYD1eL+mADq/tUnZgdt7JE6yeuT9o/LdEExNQiJyOK7y/8660ye8ZDGO7QC6QQuuVapWbcnXqvjzbE7FkBeY8AFgtxEThZj4JgeGXKqBOlmvWyyCmPtGG6ZbPr6/tirMV1JvNr/Snw8VS+LiiNHEoLC1cu2d9fyrJYE83cB9VKnp1U71FBk0u6nLlctMLC/t1tqS2hyzoSwuV+OYD1BMiVN1tSu0oh1bygSn1lIwFGb8TusiCXyoy+AThrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aGHTKK8n0UkEX0FnBS7W38weMTn0F3cJPbn/lqmezI=;
 b=Ow69YfLsvA2qHJFaflYmnVueqJ1E5TCE69YnTiZTySP0VofcobKcj4iE11+Q7SQAxS7MIX5C86EHnLsKWVK+U1S/1ktzsyAbL7QN/tO7NMNYSj/Cdhs1jy/5vd2pPwhR9a9eBjrKC7SIfE6n6dVf33lbcOc8c3OlsLxjHZTddRH1WWNMgxczbJNydyGqzDyNQC5kHFWb9x7W5aPwRxtSxPP0/HuUNjDhWeG3i/XkfSK5riSTF/e8DWvMLY6IQojOC8J2jvS1uAdI63LXSMzeC52qEx/kC+zsXPD0adbeBe6eTMld6IiCihbb5NRBarMoEUyp4MT0WBkozp1HyX37qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6500.namprd11.prod.outlook.com (2603:10b6:510:213::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 17:26:56 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 17:26:56 +0000
Date: Thu, 26 Feb 2026 09:26:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Move LRC seqno to system memory to avoid
 slow dGPU reads
Message-ID: <aaCCXVt2RTt2uuSq@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-4-matthew.brost@intel.com>
 <95ad0e5b8ed775c2a8948a09ebab75c7acfd1a74.camel@linux.intel.com>
 <aaB+uBE28cSkeuBv@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaB+uBE28cSkeuBv@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:303:6b::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: a71641a7-4bc7-4ab6-ae8f-08de755c3d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: D+N9FvzzO/FeFoUqAqBU+o46b7+AQNWS1B2LLxJBW2pwzXHOrUE6Z4wdCXOb5vFV05/QufJpS000/DXaSgrYGuriLoTdwjNyLbs9B54F+KZcNPMn6YqP3MJmZ9zimuyM//OQXiyFHQxSMklqcAxJCxCWFeWeqwRarIVHj2xvKwVj5/btMrsUtMfh1l7Mx8PKy8iEaF4/HMXVfLgybsVdpFjdNqjq9IdX6y1B7bnilFVTz/ZkqWaufR2AEneyeES49Gmm3QRbdSJG3s6QoZ65lRNkv3Q+nBJQ/q7F7hs8Nxw/EWtzcnv0G7dPJJZGLwl5nY5taIpJ6jebP8NT1C1QmELoigTavElWSEHyxvlCL7DkJjIzvhEAbfSSz9nwpBrYrPjI9E0UE1oLxmNaqVQcsXKeQED4ORDrk7gd1s+TaLnvv9UfdrVVGYsuc+hurFd4SKtzLqPVqYQVA23HGWTKG44+dCQX281vGMpeK5R7BFp4Jo3GEYMjCXL+wmVKsQKg6c5TH6sJoy85zzNPm2a4/0yjJxkCTcVUbLt48E55kLWpnlteUg6oyXTc6aK/zsSIztw5dKnKsvSqOye6NKW3CZWvBmwU8Q+0OUCJioQ0lZquhzsgkbLgjHg6+3jA3JhyL/8DZskQ7QhpmgNH38uYvpOOWvlqMowonRZOxqaXIqABY4XpTUeqtlP2WsU9ZirNp4CMTATAmm4RAPhwx4+nLGhv0VrJiQwdoOqWUQyVW6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzRobytPWmp6Ym5iNU1MTlVZZkFzYnl6TUZBUFgrU3pyNHdxdG83b2c5YzNp?=
 =?utf-8?B?U0tHT2VtM3UydzVjMklKZyt2eEdHTVlVbDliR1A2bnNMUVcybTAxUzBVZm43?=
 =?utf-8?B?anRmeWozLzBiQnhJVGRXNjI0ME8zR2JUdTdSaWNYV3NwYUlRM0RhclVSVHBG?=
 =?utf-8?B?VmRBdTJlcS9NRDJjbFBnSStGM25udTdNUXlzb2xQZ2pYNEpvY0QvT1Y2cHE1?=
 =?utf-8?B?OStqYkJWOWl3Y2hPT3pIL3B0VzVJZUVWVWo1MFB0dEVLNENMM3V6MmxITG5k?=
 =?utf-8?B?aUJ3UjF1OTNjT3huMFhZOHVyZk1IVmdzREs3SmtwNHdGR1MwMmxSeEJNR3VJ?=
 =?utf-8?B?NkF2bmhaVkdoZzFCV2VHQTgzSnROVFc0U3FGSjZuZTRDejh6Q3A3NXB1YnBm?=
 =?utf-8?B?M0dWc1JHK0hDYWF0S1NuaktUSmQ0c0ZkUU5odXVUS1QzOXlTUHhtNDZheVh1?=
 =?utf-8?B?U0dtaVY5ekp4a0NKcEhtUXVhUTNKZjgvbDFlbW1nSW1TeGsrOEtVZHJ5L3B2?=
 =?utf-8?B?WDVFb3RhL0xHOHVIWEhuMjZNdkZjaWVxYzFrZFJBRGVyYTNKSWZteDdZVnRX?=
 =?utf-8?B?K0IxeHQwd3dxMGFqbVQzb0xUNUNSS0tqUSttR0NiUHNMUzR0UFpabGVwd0dE?=
 =?utf-8?B?MFJOUlB6N1hyYVVEWHErd0lNcVNXejBwYTFKeDFBOEs5ZG5Cb3NCQk1uM3RK?=
 =?utf-8?B?c0Z1K0VmMTllRVROcEZtejVFVmhEdnEySENyekJ6NTN5YjBKdW5iSXE2d2dp?=
 =?utf-8?B?MUduQ2kvSU90bE1ORnBUaGlZbUxKRWJyVGlkMjdMbkdJZTdnWUx3d29lamx2?=
 =?utf-8?B?WVhZZHZOTDVUaFZiTjJaVDVOV05LWU5zYnVUd0h3V0NtellYMERSeVd6K3ND?=
 =?utf-8?B?MmFwdEMvYjBPcGZRLy9RSit5dDNUZXZwMzlnaExXMmZSb2NnNDJsR3Nkc2pn?=
 =?utf-8?B?U3dRMmRuallzT3ZYRUxJZUhyUUg5TlZJWk93amZzdTN6T0tjcXJJeGNQYXBI?=
 =?utf-8?B?Ly9Iamkrc0RGQlRnOVNaY25uWVozbmErb2pnYTVRM0FYTlBPNmhnUVg2YXcy?=
 =?utf-8?B?bk81b2M1NHVNR0E0eVE1WVlaanlsVnpMa0RGNXlwbm9saWJWa3Nxcy9oMHFl?=
 =?utf-8?B?R1RaMUdETFR3dEM4dkowSEk0MituekZxR2l0bXFpUk1jemh5RTFWMGs4VXNB?=
 =?utf-8?B?ZnoxM3JCRzBCL3RGMEJnWUpVeGFMTlFMdEFEK3hmRC9kNnpMOExEL0F5SFVI?=
 =?utf-8?B?a1dMZDBWVGdRTExpdVl3SGlqWVFLb1I1TWh4ZEp6OWhERExJN3djWFYwcUp0?=
 =?utf-8?B?aWNiZ3JtdVdVVnVaQ3U0R29pQkcxT2UwV1JicXBYZkFtL0VtdE4yejlxa2R0?=
 =?utf-8?B?Qk9TdVc0TEhGcFJCc3NZUzF2SCtvTE9hYzlFRHlEaFNCQzFGVFVUZG1Gc0w5?=
 =?utf-8?B?SEVQMDZ4ckZtWmRBQlR0Z2pjdzFibHZZZ0Z4M0t0cG9JdzRkS045RjJ6M01Y?=
 =?utf-8?B?ZkVaZURWM0dYV2pycDFkQkwyc09BVTd1ZVNYZUp2cXg1TVJHOVYvSmJJR1Fw?=
 =?utf-8?B?S1VvaXVQbERhbytnVVVrT0d4ajRaMk9MNTlNQmZ3N1d5S1VzbjNya1ZVbTZC?=
 =?utf-8?B?eWorQW1xeGsrbDZOclpVQ0xPUUU1UmxoZWRrWVNOcHc5UFczSGVvZmhQR2py?=
 =?utf-8?B?WURrcHJxR2pDOEMrNk5JSm9Bc3Y1cWZwZ0d4RlRUclczVEZtREQ1VmJMblYz?=
 =?utf-8?B?TWVSWFF5VUdtY3VXVlAyUFE0K0p5UnZIaWpXL2tMRVRTWmgvaWtCQklxQnF0?=
 =?utf-8?B?d0F2Z2FYUXpkTjVtMGdIYTRiRXBabTl4My9zVTkyelVTZHMySy9pTVVGUHhG?=
 =?utf-8?B?VmorV0dJeHh1QkdhbXFzNnBoMk8zN2xuSTJXVGhMODhmMFptQThieFdLMENN?=
 =?utf-8?B?RWRHZTlyT0Rsa2tDUUJaMTkzUGk2UmhMQTB5c0RYdWROd2N4d245OG9CT1NT?=
 =?utf-8?B?VU5UMU1YbkpJcWZMdTU3OVB0eTNLUFRXU3NBTlM5WUVrcEEyaElwZFhiNmdW?=
 =?utf-8?B?N3hNTFJlMjZGdmVlYUMxSDNrMEsyV0hTRnorcmw1U0dmczVnd3kycnZDcS8v?=
 =?utf-8?B?TDdudGhFR1ZDQmRUTEE5b2lRMEZ0bTdDQlIxcm91eThhK01Oc3laaWRtYlpC?=
 =?utf-8?B?QkU0RjNXTGRTT1RGZkVVbmw5cEE5WFZZMFY0VDB2bnEzNW9IYTRjSVJCQ1hs?=
 =?utf-8?B?Y0czVDFlVXlDVm1HbTlzMkdic0I5ZmlKK1pablJWT0o5WnFJbER0cTFHZXdB?=
 =?utf-8?B?SG9VdGZFYnc4b2xDTDB0MDZpSk1aZWFXSHF4d0hqYmV6UndmNmJCcnR6aElP?=
 =?utf-8?Q?daRVoWkziP3GvXJY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a71641a7-4bc7-4ab6-ae8f-08de755c3d9b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:26:56.5491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PspgLrgWBduXTp3Y/+VlEE9h1+rzaboWtGVJdNRKv1t5bGELXFBRoEv+nzox5xmZbT9F8d7OXckLURm5mMN3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6500
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

On Thu, Feb 26, 2026 at 09:11:20AM -0800, Matthew Brost wrote:

Missed a comment.

> On Thu, Feb 26, 2026 at 01:25:19PM +0100, Thomas Hellström wrote:
> > On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> > > The LRC seqno is read by the CPU in the fence signaling path. On dGPU
> > > that read can turn into a PCIe transaction when the seqno lives in
> > > the
> > > main LRC BO, making the hot-path poll/peek much more expensive.
> > > 
> > > Allocate a small dedicated seqno BO in system memory and map the
> > > seqno
> > > and start_seqno fields from there instead. The GPU still updates the
> > > values, but CPU reads stay in cached system memory and avoid PCIe
> > > read
> > > latency.
> > > 
> > > Update the LRC map/address helpers to accept a BO expression and use
> > > the
> > > new lrc->seqno_bo for seqno mappings. Unpin/unmap seqno_bo during
> > > teardown.
> > 
> > I remember this was discussed also when enabling discrete for the i915
> > driver but we didn't have any timing information at that time.
> > 
> > Whether this is a good thing depends on the amount of cpu polling per
> > seqno bump, but I figure that's typically always at least one CPU read,
> > right?
> 
> We store every pending fence in each engine class in a linked list, and
> on every hardware IRQ we walk all pending fences to check whether they
> have signaled (one hardware seqno read).
> 
> We do this because with virtual engines we don’t know which hardware
> engine instance each submission will run on, and the GuC is free to
> reorder anything. Thus, we can’t rely on a HOQ check to short-circuit
> this or look at individual hardware engine instance. Perhaps we could
> make the logic slightly more advanced to short-circuit redundant checks
> on the same context, but let’s put that aside for now.
> 
> In bad cases, there may be quite a few fences we need to iterate over on
> every IRQ. If hardware fences are in VRAM, this can add up quickly.
> 
> I arrived at the 1.5µs improvement in fence signaling by running
> xe_exec_system_allocator plus a script that parses GT stats and outputs
> the average time spent in xe_svm_copy—comparing the patched and
> unpatched versions across 10 runs. Each run does roughly 2k copies and
> provides very reliable data; I’ve been using this method for a number of
> SVM optimizations I’ve been working on. I believe I also had
> clear-on-free enabled in this branch, so in this case exactly one
> hardware fence should have been in the linked list per IRQ.
> 
> I would think this is always a good thing given the disparity in read
> speeds between SRAM and VRAM.
> 
> Matt
> 
> > 
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_lrc.c       | 57 +++++++++++++++++++----------
> > > --
> > >  drivers/gpu/drm/xe/xe_lrc_types.h |  6 ++++
> > >  2 files changed, 42 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 38f648b98868..d72146313424 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -715,12 +715,13 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> > >  #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
> > >  #define __xe_lrc_regs_offset xe_lrc_regs_offset
> > >  
> > > -#define LRC_SEQNO_PPHWSP_OFFSET 512
> > > -#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> > > -#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET
> > > + 8)
> > > +#define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
> > >  #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
> > >  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> > >  
> > > +#define LRC_SEQNO_OFFSET 0
> > > +#define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
> > > +
> > >  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> > >  {
> > >  	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
> > > @@ -747,14 +748,12 @@ size_t xe_lrc_skip_size(struct xe_device *xe)
> > >  
> > >  static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
> > >  {
> > > -	/* The seqno is stored in the driver-defined portion of
> > > PPHWSP */
> > > -	return xe_lrc_pphwsp_offset(lrc) + LRC_SEQNO_PPHWSP_OFFSET;
> > > +	return LRC_SEQNO_OFFSET;
> > >  }
> > >  
> > >  static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
> > >  {
> > > -	/* The start seqno is stored in the driver-defined portion
> > > of PPHWSP */
> > > -	return xe_lrc_pphwsp_offset(lrc) +
> > > LRC_START_SEQNO_PPHWSP_OFFSET;
> > > +	return LRC_START_SEQNO_OFFSET;
> > >  }
> > >  
> > >  static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> > > @@ -805,10 +804,11 @@ static inline u32 __xe_lrc_wa_bb_offset(struct
> > > xe_lrc *lrc)
> > >  	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE;
> > >  }
> > >  
> > > -#define DECL_MAP_ADDR_HELPERS(elem) \
> > > +#define DECL_MAP_ADDR_HELPERS(elem, bo_expr) \
> > >  static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc
> > > *lrc) \
> > >  { \
> > > -	struct iosys_map map = lrc->bo->vmap; \
> > > +	struct xe_bo *bo = (bo_expr); \
> > > +	struct iosys_map map = bo->vmap; \
> > >  \
> > >  	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));  \
> > >  	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
> > > @@ -816,20 +816,22 @@ static inline struct iosys_map
> > > __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
> > >  } \
> > >  static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct
> > > xe_lrc *lrc) \
> > >  { \
> > > -	return xe_bo_ggtt_addr(lrc->bo) +
> > > __xe_lrc_##elem##_offset(lrc); \
> > > +	struct xe_bo *bo = (bo_expr); \
> > > +\
> > > +	return xe_bo_ggtt_addr(bo) + __xe_lrc_##elem##_offset(lrc);
> > > \
> > >  } \
> > >  
> > > -DECL_MAP_ADDR_HELPERS(ring)
> > > -DECL_MAP_ADDR_HELPERS(pphwsp)
> > > -DECL_MAP_ADDR_HELPERS(seqno)
> > > -DECL_MAP_ADDR_HELPERS(regs)
> > > -DECL_MAP_ADDR_HELPERS(start_seqno)
> > > -DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> > > -DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> > > -DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> > > -DECL_MAP_ADDR_HELPERS(parallel)
> > > -DECL_MAP_ADDR_HELPERS(indirect_ring)
> > > -DECL_MAP_ADDR_HELPERS(engine_id)
> > > +DECL_MAP_ADDR_HELPERS(ring, lrc->bo)
> > > +DECL_MAP_ADDR_HELPERS(pphwsp, lrc->bo)
> > > +DECL_MAP_ADDR_HELPERS(seqno, lrc->seqno_bo)
> > > +DECL_MAP_ADDR_HELPERS(regs, lrc->bo)
> > > +DECL_MAP_ADDR_HELPERS(start_seqno, lrc->seqno_bo)
> > > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
> > > +DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
> > > +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> > > +DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> > > +DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> > > +DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
> > >  
> > >  #undef DECL_MAP_ADDR_HELPERS
> > >  
> > > @@ -1036,6 +1038,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> > >  {
> > >  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> > >  	xe_bo_unpin_map_no_vm(lrc->bo);
> > > +	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
> > >  }
> > >  
> > >  /*
> > > @@ -1445,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > > struct xe_hw_engine *hwe,
> > >  	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > > +	struct xe_bo *seqno_bo;
> > >  	struct iosys_map map;
> > >  	u32 arb_enable;
> > >  	u32 bo_flags;
> > > @@ -1479,6 +1483,17 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > > struct xe_hw_engine *hwe,
> > >  	if (IS_ERR(lrc->bo))
> > >  		return PTR_ERR(lrc->bo);
> > >  
> > > +	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> > > +					     ttm_bo_type_kernel,
> > > +					     XE_BO_FLAG_GGTT |
> > > +					    
> > > XE_BO_FLAG_GGTT_INVALIDATE |
> > > +					     XE_BO_FLAG_SYSTEM,
> > > false);
> > 
> > XE_BO_FLAG_PINNED_NORESTORE?
> > 

Maybe (?), but this seems dangerous… Can’t fences be pending during
hibernate? We also check whether a job has started (by looking at the
start seqno) in the TDR, and if the seqno is in VRAM, nonsensical reads
could confuse those checks. Also consider the case where the fence seqno
is clobbered—we could end up with values in memory that indicate the
next job we run is already signaled.

So after typing this out, I actually think the answer is no to this
flag.

Matt

> > Thanks,
> > Thomas
> > 
> > 
> > > +	if (IS_ERR(seqno_bo)) {
> > > +		err = PTR_ERR(lrc->bo);
> > > +		goto err_lrc_finish;
> > > +	}
> > > +	lrc->seqno_bo = seqno_bo;
> > > +
> > >  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> > >  			     hwe->fence_irq, hwe->name);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h
> > > b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > index a4373d280c39..5a718f759ed6 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > @@ -22,6 +22,12 @@ struct xe_lrc {
> > >  	 */
> > >  	struct xe_bo *bo;
> > >  
> > > +	/**
> > > +	 * @seqno_bo: Buffer object (memory) for seqno numbers.
> > > Always in system
> > > +	 * memory as this a CPU read, GPU write path object.
> > > +	 */
> > > +	struct xe_bo *seqno_bo;
> > > +
> > >  	/** @size: size of the lrc and optional indirect ring state
> > > */
> > >  	u32 size;
> > >  
