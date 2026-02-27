Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90637104891D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 22:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA4410EC49;
	Fri, 27 Feb 2026 22:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Laj9Ih6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9435510EC49
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 22:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772230357; x=1803766357;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q4zIDb8HBzndNthOgGFds8Q5joc39ZuTd2ciHdPhSqA=;
 b=Laj9Ih6X5OrbwGQ3FaOLZiheMXGmsFC0kJ1DF9VeaD1V9ImFy4tMOYli
 GL+zU1mpq2ie0s5BN9PFWC0MznE5Zl8BOXVdlOrCGfnrfFxmg7cP6ziHZ
 HfvyiUkv5t+30RZoEhdLlK6A5reWj5Sjg7r7CGhV7L2FsQreAG87br08R
 PyDwyVTzvbELZvyeqF2vJQzFnrBoNPnMxezoXlWZfcJ+fHwLT93eGrOzx
 lR7jLTGCkvnHVO+3gwLt3/Fb3sDy9WDDuTnyWA/fknNBpX2/0zM+n5Y/q
 UzlZv44ZZOgvua4OvIkfN5o5ifnOcoihBHxoT4jVaGRaKU53+ga/0Smcn w==;
X-CSE-ConnectionGUID: FLQiOnwYQGGX32ZsFjMMvw==
X-CSE-MsgGUID: NiK8UyhtQr+Zp9hfLN4Cbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77163424"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="77163424"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 14:12:36 -0800
X-CSE-ConnectionGUID: J9j3vYBxTS6u7eB63U9bOQ==
X-CSE-MsgGUID: 0LRW7YQORwO/M0Rq7tUZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="215159780"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 14:12:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:12:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 14:12:35 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 14:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzGyB2tHcCkCUpNIo23h+X0yD8JmcwxlUMlPO1cGaqy72rn7ipy9L+toZ0LZca+RZ7Bhk/3RQqQYIAY/lcGanfT6HEufGzczzp3ZgPoIlldNODy7mlYHIQWyFSNRYm7SmPg6nzvZ+wi2XzTjW2z627HxZpqyM+Cx05zywjeTwAq4S6KpRsYQRaHa4qsvI4GduCx8U2dmiFAuTnfgV7m9tysxyS9ofYV7MhEEltFFNdDfx2PbZ0ztsfpYjZn29m/EhvFFNuO0EVELBrhldVWcxsnTU8h6wDyawGLiBcin4APOGTRq25BIf02fme9a2va1z5Ez44RMCaMYLa8ZAc1H6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHwuhrahZJmqu1f9rk0x7WUawqiYG4s36Lx1OFtMpfU=;
 b=gbJbgCeiZhwu/HQnm4kcuB5A9oYZDw3K+hUYEB5XRcGWW4zRGY7W52/07xJT4RG4x0/t6mVW5RczqPrSqgWkYo2hDxw0oCz3QBjCTHxj1NaupL1QHu1MU6qezq1KpUJkrXMV4kfv1zsa0+/jcpGdQ7HDQW8EEg9SsQlitwGc8/0cmGWMniYJORBaLyTtXmMwHK9XywOsPP7O4+NS8A1KteypZ5oq4F+qZisF9XYt3q8EaAgpGye8DjoBtpUdMRAzDzvzHA9V/RgvCMBBzQhDYspeRXdR3RaCN48e2X+0phZGuCIh1g87jLHfNq6HnR9D7n+JXWZqkkKVAyGr81B1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 22:12:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 22:12:33 +0000
Date: Fri, 27 Feb 2026 14:12:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [v2] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <20260227221231.GQ52346@mdroper-desk1.amr.corp.intel.com>
References: <20260217083436.1101287-1-lionel.g.landwerlin@intel.com>
 <20260217235140.GT4694@mdroper-desk1.amr.corp.intel.com>
 <5be3aeea-9822-49bc-a9f8-e28c64a1db80@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5be3aeea-9822-49bc-a9f8-e28c64a1db80@intel.com>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d1d058-dedf-450e-add1-08de764d4e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: bMRS0YQ931FIx8tZICs8K3HJW1k0Cd5TN/E+jaNfcBzu2Mg33o0Y162lUn3Sq/8khJ6EYFvNXlKiBEvrALKx7bs/odkysgpd8YLRTiPKBuSYpS6gj+SSAz5y3rMD9nmPLRKMIxRaW8koKkaeRxsYCbHJ6Z01HEysVA+EybJgz0/VkpCI8I1L8Vx9W6jU4JZxsJg+nPAYTbz3iSa80y/Q7VFkVyFJ4F5MzGXtdfIlLT0EqKzF6AdDTq/mBgcUDv1NVj4nnIpaLmNZS4HQpj4xFMdM8+A71Q+H9hpGkjO+yS0zqY/YbOWW2Oj3TlQR20sI4D7uCTT7e7tv31gt3rhtKEuwcUJS8K+up2rsEcvjUwpgSYRj8AAG6mF6lirTygSdbeLpsHnUE1CDHjjxldieHyvJRDlEVBbvGAUvZxpt6XdqFrphNBqdvrVqRI44f/3tRSXCI4lfG4LX80B1IPeEBGpdg4PHTT6prk6uASfiTe0LFC+5pTSvvWjer1bRw2qz3rVLY+GfF0kYx+D0oWeDqef0sZ6xxqwo7UyWsGOEaB5SSncS8A2g997THrJepv62yq4hJlcKc4JRfF9JCG6pBxSShdftFhNZGtsXdqsUDDtZHyaj0iPoVAX6b0gI/MTEgGlJzI4u0HsJJjSB4qLqZQQ3vPYUJXtv0H9+rBFs4gdB8pcAUJi9DKs74GnEM3QMUjIJGyIJ8lVgo/0EARjtN5DnLIc68+3u/lLzIThG+8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVhVZWRvWGVBdStmak5XcUttbVBUVjhNcy9tYzMxV3JpT0l2cUN6aWZyRW5E?=
 =?utf-8?B?LzBZSUJzZjgxUG8zUEQzaVc4bWJPdlB4azI1M3hzQTdpYmRzQzlIUXhsNDA4?=
 =?utf-8?B?QTlHVWx1ejIzZERhd1ZYRVNKeDZpQ3NLdUFnek1WQVZQd0k0bWV4TGp2V1lM?=
 =?utf-8?B?NHRtLytxT0pweXloZ0RDM0IwQ1p5TDQwY2dKWFMrK0NLVW9LVFRkc2JSOGNM?=
 =?utf-8?B?aXlCRTJKY1paaHVDTU4zMWRUSTg2V0xoTVRXczhiM2pzdlY0RUI0MVlBNTky?=
 =?utf-8?B?NzU5N2NjbTlpWEsxSXlkZG9NRjF2Y1lRSVFCY3ZFRUVrSWZIUitJMWI0Tm1K?=
 =?utf-8?B?ZHNqQ0J4WFNQN1hvNXZ5a1lJUGl4S2dLeGY5SktEVjlFVFNDcUpzVklveHhV?=
 =?utf-8?B?RU5makQwRkFjaENTL0p3Y21OT2tpM2JSK2xnalNtVEpmTXlvK2pESG0zZFhJ?=
 =?utf-8?B?WGQvdkNWU01NT1BsMUowUG4zdzBWOS8yVTJTWmpVaVY3UUZyYXNhS0c1bWZt?=
 =?utf-8?B?NVBzY2RTK3Y0MnVSZGJ6QjZZUTVJQnRZK0FaL3dISGZoa3dyb2J4NnhYRGx3?=
 =?utf-8?B?dDFydDhZUmdFYW5XWEk5cGhQUGxVYmpSMm5iYXhPMGhGbGZtN0hhMkFYMGcx?=
 =?utf-8?B?dHhMNFF3cFlmdnZ4cTNlTUhGMkZlV0N5Y0VkdzNMdlBPZEdkRDU0bHlnQkty?=
 =?utf-8?B?bWpUd0ZkYnBoVGFRUXBFaDRIS3JxV0l3dzJFZnhXZkVEbVEwaXVrK2RlSEhW?=
 =?utf-8?B?QTBxendnaEJ2eEM1eGZaNk5pbEVmYXVEc05IK2QrZCtjdEoralJRNzBQMG5v?=
 =?utf-8?B?Yy9WSksrZlZoc0NzTDlCRXpWZSs4ajhiVXFFOWw2cVh1d3k1ZGpONmgwRHVN?=
 =?utf-8?B?UWRKb3dhUCtXcWNOeVlpYkRHMVY3MnlJZTVRcXkzczZDcFVyUEJncGVpaHE5?=
 =?utf-8?B?YWoybnd6SlpLU2dyejM1bGhROHlnc3hXaStkYi9PbHc1M2JqQm96aFQ0Nm9t?=
 =?utf-8?B?MUdoaDZMWHVUOW1yVGRuWHgxWW8yd2s5R0lXZEJCOXJlSmVubnNBVUdJb0U0?=
 =?utf-8?B?U2krdUlIa1o0WHB3MFZvRG12SStXRStoUXFwZFhRTFBTTGNJK2c4NDRNajZy?=
 =?utf-8?B?ai9taEVuMUN2U3dNYm12TVlBeVdCbTNEV1hHN3FENUZuSG9pK1g3UzVjZmhs?=
 =?utf-8?B?ZWFDZGFvQzdyaFpQZ0hpQzRpWmpDSGowcW91TUdwZmI2NTZhZ2JhVU1MdU9y?=
 =?utf-8?B?aXJDWlJnblZVSXZWK08rZjBUQ3VVV1hiS0pHM0VxMERLcHpya1YrNEZVV0s0?=
 =?utf-8?B?eTZETmZlUmpIRDRFUEE0bUlLeUUzZGpLalluQUxYSzBKQWpqZXVsWmMwRnIv?=
 =?utf-8?B?Nkt5U243SVlvQTlqcStsbmtsZXpraGxacUJDRXN3dnlRMFlMR252NUhuMUs1?=
 =?utf-8?B?K1plMFo2MlFENjFJK2kwc2FJMVR4c2pSUFdrREpzVnNWcUhicUxzKzFzRzJT?=
 =?utf-8?B?dnljYlh3Y3BtOUtobWg3dWZiZi9ZdWh1bk5Rc0pmZW1zWGUxSkdHRUxnRkcr?=
 =?utf-8?B?R2kyUG5TUU1HZkthaytOWWxFWnp4dFZOQ01HK0t6NzV1aFBac2tLdEgvZ21q?=
 =?utf-8?B?Q3FxZnNNQUVRb1l4QVAzNnRDYkgrNStMbS9EMGM4dzJGTjhxZW9kakFMMW1P?=
 =?utf-8?B?K05TaWVZU2ZBOTVCSkVoL0ZYODBUd0NXK282dG9ta2RCQUNpYUhMYlNyK3Nt?=
 =?utf-8?B?OTlndzNadUhvRkordktLZ0xLcCtzWlYyVHJvNkFDMGlTQWdtRkZMOVZkTXVQ?=
 =?utf-8?B?dEtia05xZXByUkszN3RDdEpTTXMrTE5RYTNCeFpYdVhiN0kwRW83RmZ3YWd3?=
 =?utf-8?B?a3Q1Y3dIRlY5eGlUWVJyOHYrUmpJZXFuRDZxbk5RQjdkVVVodGxIVWVsNmxt?=
 =?utf-8?B?eStBWjdJWklMQS81ckcwbDNXM2J1N2hWUHpOSXlWZE93Sk5ZVVdPdk9EcmQx?=
 =?utf-8?B?V0VGSTQ5VjZUc0FpNm1JbnFBeXhPQ0UrNFNmTkwvTmVIdFVLUUs0MmI1bFYw?=
 =?utf-8?B?N2JIbjR6SmhKWnBoSlFVZXVISTIxYlQwMmJHNE9HOUpxWk1SSXlNWmZYcDFN?=
 =?utf-8?B?cWFnMGYzUnI4YmYwME9FZmxzdUVOVUpiSFk3ZUVtcGRGRkU4SWJoc1BObUZm?=
 =?utf-8?B?ZTlqbkViUklCQTlKREp5ZHBPTVN6MFNqN1NYaEphbm9KemFLdFlKTHBHYjVJ?=
 =?utf-8?B?TDN2U1o0NVB4VC9jcHRsR3Y0ZFJYaFYwcGdxNEIxWi81MXdsSEZNS2lPcmlk?=
 =?utf-8?B?SEJiZFl4akNHTDFBQk1oM2grNlFRVFhKWGJYb1lkeVpwU2NpZWNBMlVwRUxR?=
 =?utf-8?Q?ORM6cCrRA/IAWjDw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d1d058-dedf-450e-add1-08de764d4e9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 22:12:33.8948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyXpzVsqWj1w+I5thpMGqu4cANg+PIZP0er5a7LzVzPZvDIp3fVjEIU/dyvnd2bStGEgeih7NeedR904gReq8e5eRJN3v8+ztm9TcOSqeOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
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

On Fri, Feb 27, 2026 at 10:42:41AM +0200, Lionel Landwerlin wrote:
> On 18/02/2026 01:51, Matt Roper wrote:
> > On Tue, Feb 17, 2026 at 10:34:28AM +0200, Lionel Landwerlin wrote:
> > > Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> > > ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> > > people have decided to not rely on putting the register on the
> > > allowlist for UMD to program and instead have context/queue creation
> > > flag.
> > > 
> > > This is a recommended tuning setting for both gen12 and Xe_HP
> > > platforms.
> > > 
> > > If a render queue is created with
> > > DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
> > > be programmed at initialization to enable the render color cache to
> > > key with BTP+BTI (binding table pool + binding table entry) instead of
> > > just BTI (binding table entry). This enables the UMD to avoid emitting
> > > render-target-cache-flush + stall-at-pixel-scoreboard every time a
> > > binding table entry pointing to a render target is changed.
> > > 
> > > Bspec: 73993, 73994, 72161, 31870, 68331
> > > Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
> > >   drivers/gpu/drm/xe/xe_exec_queue.c       | 18 +++++++++++++++++-
> > >   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> > >   drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
> > >   drivers/gpu/drm/xe/xe_lrc.h              |  1 +
> > >   drivers/gpu/drm/xe/xe_query.c            |  2 ++
> > >   include/uapi/drm/xe_drm.h                |  8 ++++++++
> > >   7 files changed, 40 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index a375ffd666ba2..80a438e51419f 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -178,6 +178,7 @@
> > >   #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
> > >   #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> > > +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
> > >   #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> > >   #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
> > >   #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 66d0e10ee2c4a..d3168353fcaaf 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> > >   	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
> > >   		flags |= XE_LRC_CREATE_USER_CTX;
> > > +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
> > > +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
> > > +
> > >   	err = q->ops->init(q);
> > >   	if (err)
> > >   		return err;
> > > @@ -850,6 +853,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
> > >   	return q->ops->set_multi_queue_priority(q, value);
> > >   }
> > > +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> > > +					       u64 value)
> > > +{
> > > +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
> > >   					     struct xe_exec_queue *q,
> > >   					     u64 value);
> > > @@ -862,6 +876,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
> > >   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
> > >   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
> > >   							exec_queue_set_multi_queue_priority,
> > > +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
> > >   };
> > >   int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> > > @@ -946,7 +961,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
> > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
> > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> > > -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> > > +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> > > +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
> > >   		return -EINVAL;
> > >   	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 3791fed34ffa5..f4f72d01eb8c8 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -134,6 +134,8 @@ struct xe_exec_queue {
> > >   #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> > >   /* for migration (kernel copy, clear, bind) jobs */
> > >   #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> > > +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
> > > +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
> > >   	/**
> > >   	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 38f648b98868d..a962ac2bb7ca2 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -14,6 +14,7 @@
> > >   #include "instructions/xe_gfxpipe_commands.h"
> > >   #include "instructions/xe_gfx_state_commands.h"
> > >   #include "regs/xe_engine_regs.h"
> > > +#include "regs/xe_gt_regs.h"
> > >   #include "regs/xe_lrc_layout.h"
> > >   #include "xe_bb.h"
> > >   #include "xe_bo.h"
> > > @@ -1447,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >   	struct xe_device *xe = gt_to_xe(gt);
> > >   	struct iosys_map map;
> > >   	u32 arb_enable;
> > > +	u32 state_cache_perf_fix[3];
> > >   	u32 bo_flags;
> > >   	int err;
> > > @@ -1579,6 +1581,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >   	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> > >   	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
> > > +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
> > > +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> > > +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> > > +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
> > > +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> > > +	}
> > This will put instructions in the LRC's ring to update the register.  So
> > when this context starts running, the context switch will load the
> > default value of COMMON_SLICE_CHICKEN3 from the LRC's main MI_LRI
> > instruction, then these commands will run to update the value, and
> > eventually when we context switch away, the modified value will be
> > written out to the LRC's main MI_LRI instruction so.
> > 
> > That should work, but wouldn't it be more straightforward (and more
> > consistent with our other LRC initialization) to use
> > xe_lrc_write_ctx_reg() to put the value we want into the LRC even before
> > it runs for the first time?  That's how we poke several other register
> > values into the in-memory LRC during init.  There's a
> > xe_lrc_read_ctx_reg() you can use to get the current value for
> > read-modify-write purposes (see the handling of the RUNALONE flag for an
> > example).
> > 
> > The only quirk of using xe_lrc_read_ctx_reg() instead of
> > xe_lrc_write_ring() is that we'll need to add a #define for the dword
> > offset of COMMON_SLICE_CHICKEN3 within the LRC since we don't have that
> > defined yet.
> 
> 
> I'm not sure how you make this work.
> 
> The current register you place like this from the host, their location in
> the image is know and doesn't change.
> 
> I can't say this is the case for COMMON_SLICE_CHICKEN3.

You'd find it by looking at bspec 65182, although it's a bit annoying
since you have to manually count up the values in the "# of DW" column
to find the proper offset.

Anyway, it's not a big deal.  We can always switch over later on as a
follow-up patch if we decide we want to.


Matt

> 
> 
> -Lionel
> 
> 
> > 
> > > +
> > >   	map = __xe_lrc_seqno_map(lrc);
> > >   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > > index c307a3fd9ea28..083a2167aeef8 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
> > >   #define XE_LRC_CREATE_RUNALONE		BIT(0)
> > >   #define XE_LRC_CREATE_PXP		BIT(1)
> > >   #define XE_LRC_CREATE_USER_CTX		BIT(2)
> > > +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
> > >   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> > >   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 34db266b723fa..5927eaf792efe 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> > >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
> > >   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > +		DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX;
> > >   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > >   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> > >   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index c9e70f78e7238..856838fcadd89 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
> > >    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
> > >    *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
> > >    *      This is exposed only on Xe2+.
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX - Flag is set
> > > + *      if a queue can be creaed with
> > > + *      %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX
> > >    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> > >    *    required by this device, typically SZ_4K or SZ_64K
> > >    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> > > @@ -425,6 +428,7 @@ struct drm_xe_query_config {
> > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX	(1 << 4)
> > >   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > @@ -1279,6 +1283,9 @@ struct drm_xe_vm_bind {
> > >    *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> > >    *    priority within the multi-queue group. Current valid priority values are 0–2
> > >    *    (default is 1), with higher values indicating higher priority.
> > > + *  - %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX - Set the queue to
> > > + *    enable render color cache keying on BTP+BTI instead of just BTI
> > > + *    (only valid for render queues).
> > I'm not sure if this is the best name.  The bspec indicates that
> > 0x7304[13] effectively *disables* "state cache perf fix" which was only
> > intended for DX11 scenarios and shouldn't be used elsewhere.  So it
> > seems like the name here should either mention "disable" or should be a
> > more descriptive explanation of what actually happens when we set this
> > flag (e.g., "xxx_USE_BTP_AND_BTI" rather than using the vague "PERF_FIX"
> > terminology).  The maintainers may have thoughts on what they want to
> > see.
> > 
> > 
> > Matt
> > 
> > >    *
> > >    * The example below shows how to use @drm_xe_exec_queue_create to create
> > >    * a simple exec_queue (no parallel submission) of class
> > > @@ -1323,6 +1330,7 @@ struct drm_xe_exec_queue_create {
> > >   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
> > >   #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> > >   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> > > +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
> > >   	/** @extensions: Pointer to the first extension struct, if any */
> > >   	__u64 extensions;
> > > -- 
> > > 2.43.0
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
