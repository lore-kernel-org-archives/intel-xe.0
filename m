Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D9810F2865
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 19:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801F10E068;
	Fri, 27 Mar 2026 19:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DD3Qiq//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9823510E068
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774641295; x=1806177295;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eejPXa5dpqK9vi8UHiY8ofTVpWq5/PNvt6klwjYVO/g=;
 b=DD3Qiq//H8hDnLNTcQT6pAqjKHgVY6VRxn2qIERc1HlIIX/Eq7tl90y4
 CVVR1mQeupc799PoSTuOau/lR3d3m28GoSo1Khfcpl0KfIqlPgJNgplK+
 QZIu1xlpDSUOc/9F3o81yGW7HrjV29Ts+h2O1rkhHEuEBSFUZhnsIcf8t
 /1SetVyiRt0FLDa3h+DDIYdgjfV8LMxzRkMXYtaDlCcNDDkMR1NRdFj8q
 em4pz++9rTGlgA+41lPtc3hv0DSjD0pqjsoUvFqnKrrpJBox59WRym0Em
 1gh9PpgS9LDKITNoWani7a5wRMaEeWyLqf5XBKX54d9mp2FsCUfcwsenC g==;
X-CSE-ConnectionGUID: lmOpZhHiT0usUAFieFe83w==
X-CSE-MsgGUID: psyYVvMCT86kbU6r0PF4Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87195093"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="87195093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 12:54:55 -0700
X-CSE-ConnectionGUID: KHpfcuaaT5GEaxJqDNIK4w==
X-CSE-MsgGUID: J0gUTpvkQi+MGf+BLm2ppQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="248444897"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 12:54:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 12:54:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 12:54:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 12:54:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ke/CgDAkYVMaVVQ1fLYel9OjPlpKjvFMTZerFnavmP5FNvCiRN1tEGV0cliRF6uAU08lkKkyHfoAEHK3d4LUQaHoR8oQkgjfZHRPoO+mfSa1rhyx4Qo0bUJIuykF5mJ2GNG44B/FKfWvSy6l7LA/fWxbbGbP8DiBjqp1831cNkQhe4vk10TC6SnD/JnSinG8G/Juf+JNyFr+z47K/bEDTOtGjtecviE63fpjFU1yyjubs4LoRBM7QpCk8EDE0oC0FVi+lyoTX6wKK8LhCnXL7HZf7dL9ZGj+InIt+lEHQnhTrfDYsWh+Y1TlSoVNIFcMI4Ecmkw/eMpFhRDSVXkJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuC4fXRGpmZEvR4GXNnVw9oJ6OFdK0vLiuhvY/M++BA=;
 b=Jd6ylnFs4MCA35jGB0sr9Gq3Zu5bhZSpKsDoQkDOm1KWiP+uKXClOlyiBphxUjv67bxdceU1h4b5w4YCaRBkdk156rnkETtuPXGW7YELnmC9RQG5HtLI4oCJazY71+eRo60lvP1EBQWValCrz6F1ELh8D1seBc2cJ69xdJ8tTJA999rtNkI/hmSnTZnEU/uKa6MgT9SEt5jJoHEYNVQGXOdpEU/Ba342ZNG+P7+DaczL3z0eqR1rQ0O6/2Ji4dOCCxOFK8QsBxDTg3b6aEtUhJ5Y1m11ipI2AakulrQqokdoqxuhMLrGrzWs5my8j1r5FFbxxoOZT3BW12t+N4wZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 19:54:52 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 19:54:52 +0000
Date: Fri, 27 Mar 2026 12:54:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, <intel-xe@lists.freedesktop.org>, "Maarten
 Lankhorst" <dev@lankhorst.se>
Subject: Re: [PATCH 1/3] drm/xe/mm: add XE DRM MM manager with shadow support
Message-ID: <acbgiP+4bo+9x5p2@gsse-cloud1.jf.intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-2-satyanarayana.k.v.p@intel.com>
 <94b2be9125929696f64c1637c2eb160a578a0a6d.camel@linux.intel.com>
 <6ad46836-1b19-4a06-81ad-ab835f3d91d7@intel.com>
 <a1cc476e605e291762178b297a705ca0423949f1.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1cc476e605e291762178b297a705ca0423949f1.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:303:8d::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1f6f13-395a-44e0-e26b-08de8c3ab5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: +0sakFpLWzuJ1k2gZFslXLnJNoS/m8UG/ipABiEDoj0vP31FbuUjDBq67KrlMbReaCGyRvV+vtW0DsCplTDWOKmR+QRmQ15zQNfdYJxVSBOSl9idfuhaQmh4Y4KCEmMKEWpUvdBzT2wd8RuNrnd5wOXeT/nbqy3RHE/yPbq1xudlPaEYA6Izn0rZ1xKFu8UbZUoxTXko+mF9D/64/eqL0BLa1GWq7DTJrmeGQPU3L/X1+baLo2ZBkYFr9dldbYiIzM2Q3YCDiWRsmDe+r/UL9V1fQiSzOZwzHZWFfHalFOwhXFmq6i7OeObbwuy3O5DpFtP/+Kp5jBKumOkihQi8yrB8y/BA/Z4qG6FOCqPuBTdvu3Z85I63CBwiLHKOPkLGOiZhthvlCHI4PZHfyo2ICCMLahKh/NgeQ6luDGybzjsSbvMji8msVNz+arIh0u1YDdQz6Yl8ElNUWD1ZjZkkrQatFrNCe6a9KbPWc9NZ4Ao5Jo6457cz/W6P/xPI8a5nXY5p8SOqzCfRG7Bu97zatRZ8T4tP43+nqtCtnmr4MUZQW/b8lSpsUyWvBh62dQn1VyVItFTODt18IapOHTvLqK1oB+uzfbCYz7hSlmoWWvrZvVxBQXBQDs7xnrAIzULxkQOGVi0Ef8IrakruKQxa59QlgpYvLI4KXxqg0w4KKURUCXQm29ieGkzukZ6MzqEqBfGjPFwx7r4sSQkgoEWO95gMhKNjo6oYzLhgrKL8WTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vkEdcbV1p4NyqfBvnLonl53E95kje6Ik2pSIq3+Xytv1BT8V14LcKTpsep?=
 =?iso-8859-1?Q?YbVZvaWO8zF5ULLJlR9G10Vm27Qlbbj+8ukcztcUzp0ofqV0v9AlsNpax0?=
 =?iso-8859-1?Q?M4OoUKoshVajAQj2kyTDnMZCr5//R6X0kH8XdUVqRzTSpW/fSxN+Yu4SpI?=
 =?iso-8859-1?Q?Z/S/ru/wWnueSLkcKx7jXgniktZsTnTWrwHleaLW81ePeIr6r4o0zRTie0?=
 =?iso-8859-1?Q?iTA+VHzfvFeUEPNgLUvqcR8SYuljetA1sjtdmTUZfohFhmca3Tcw4/jVth?=
 =?iso-8859-1?Q?hBW31jYNesNPG6mFlfbdwG0FA6V79tuVIl/nZPh92kCvgn4OwrCx10ofTZ?=
 =?iso-8859-1?Q?GmQodzQ+OCb47Vl85AU3e8a9tXRpJuLH9YyMd5DinL+RuAKks1wYYl6wfC?=
 =?iso-8859-1?Q?McvacBv+dpnrLjB0vHt6OaKzld2JgSRHBdGl6PyA2wFO1qyZM1lupQsd33?=
 =?iso-8859-1?Q?o7nu0T3jTif/79JzJkwVaq4hlC+tLcFq1ddcqH7LYRAnuPl4JnSr4R7Bk0?=
 =?iso-8859-1?Q?Q1ZWT3aYpYP/XYC2nt2WY9hI+Yaa8M9ZngAlYR7nUS6fhMt2aT3LsjIxF3?=
 =?iso-8859-1?Q?KB4NkRU+n8K5zjEkeqE0MTZsmh7L4nDseoiS3c1b4pNn9KEpSyvyCkR/9I?=
 =?iso-8859-1?Q?nR96LPkU4gWG0FyB91TdJMfQ+D3vhjorbKEGq5Er7PXxt1Q4Bg+XE/8DXH?=
 =?iso-8859-1?Q?ekjQdEqCK6O3j7+D75IjwBtjuz4WVvsLgFFKK4snVrSB8KUDfebK7XxAyX?=
 =?iso-8859-1?Q?Y44DWP4minoJw+QimwU2adqu2WcSgw5FYZH6apAgYNfrTArxuZshyohtmk?=
 =?iso-8859-1?Q?G/aVx15UIQJmAY4abvmtKpLwV1a37dtQ7dK8qyaDDE5Kk4Ar7bNtJ7f+yz?=
 =?iso-8859-1?Q?9tcNwoYWr2BxgfPpQZgNqH/mTcdyPZbYBCEy9RLUuLef2tWQUhHuwUl4ny?=
 =?iso-8859-1?Q?1weqd0O9/uTQvrkizAPxhDK31yxA8eHIoaf0xN2iqEhUZrBFQtHD/1q2B2?=
 =?iso-8859-1?Q?2RfltfWQuRcRJYxgK0ciRlLNeUMZGohHVuEuSuTrux7KlGlHWlPom1mK4O?=
 =?iso-8859-1?Q?d7VZkN+I4Bjs0Z6OHvQuP7B2coIZ+5NSfWVeHXxIkefF7/lyQK0vvnF9hn?=
 =?iso-8859-1?Q?7r54rMlge/DB4Y7pUJCXmJ9ftjN6wuFA/0Ikv7hhhRn8bcBD1F8cRaPtv7?=
 =?iso-8859-1?Q?5/60eCo5CRVSzrTy838Z3bVyzu1aWCJhhafZGSDqmlY+hxC6vheeJvy9tN?=
 =?iso-8859-1?Q?LO4SppB8gwIoISy6ctUVU63W1ry293M8BOLkEHdj6b0he+4YJr4oL8SHSi?=
 =?iso-8859-1?Q?3HX2w8gNknjjDJWlQdPBGYG81/9pr/nTXakq8NQQ9fu6pU6XVceAj7vsPo?=
 =?iso-8859-1?Q?1Xb+Z1vkzYeleqw4N8hWdtvXGmHj/IiKjsB/rpxtsjQdy/rac1fmUa3CdA?=
 =?iso-8859-1?Q?neWwNZOL5pjUZ57yw5Y5l5/xUev0CUVhALUF6PQTqmM4zM11t0y+Pwr15J?=
 =?iso-8859-1?Q?TkvZ60mtMgDJpySwwNbK32m9yb9mXhRzREpPbkJpGdcbezhck+mM2q/8t2?=
 =?iso-8859-1?Q?WB7jCSS7Pl3cojZ8/BymAsJbqmcI/6vmAtoDCMEaDkrWIjpSC48JjH+l8N?=
 =?iso-8859-1?Q?nZZCY7DHwo97MBnMYOrouSSpYRFI3mZYxWnXoYQsccQQ8SqxCKv4+om33h?=
 =?iso-8859-1?Q?tGEvAem1JYHh+zqJQJuWQNz18+jbAtgW2F8wxxxRB3dPKM3iUHrM+YMQL2?=
 =?iso-8859-1?Q?xlMXHuK95LAcTy7aHFeaAN26oxrxN8fOTjbLuI3sFVp/p94BopKR53PLC+?=
 =?iso-8859-1?Q?Grbd35AI9ITVpa13Qjm0nxfM6C2Rcv4=3D?=
X-Exchange-RoutingPolicyChecked: ifZBguJqhKxK8wkv5EVX8EDmZPHw8/bGWeWqar8BLWBm4/VgQJ84iuMgArTrZkPNXM7jFKUL3wmM+V8CChNj/E5Nm0nEPpe8NsNfLqIcYGSCkLB2J1CbxwVMBL8j8uQBLFerT14ZIm7G90i3DGqXG+WNy7sqrHpfP+YLlX5i9mteYY8x/ZSCpxspJGnfX0k2YRzDJODli7FVy4utHCTuEQ4iNp7r2YyXVMlKgXEOLhDJjUzYMifxY64c02CJFp8YpE9IE+//rFU6ukSvAYAWcSKksGiV+Hd647e8zrB0LeKGK0S2rsjmZANIRDEMwFSn/m7MZMXH8lgSq7KBT1HbPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1f6f13-395a-44e0-e26b-08de8c3ab5cd
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 19:54:52.1294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhnzBXOWXrwWwfzVtvf1yFEgKupUQ0sn8Q0ZtVfsLD/dD3iotp921D3C5x+Na24y50Jk84nYH/Sgh69uhlqaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
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

On Fri, Mar 27, 2026 at 12:06:21PM +0100, Thomas Hellström wrote:
> On Fri, 2026-03-27 at 11:54 +0100, Michal Wajdeczko wrote:
> > 
> > 
> > On 3/26/2026 8:57 PM, Thomas Hellström wrote:
> > > On Fri, 2026-03-20 at 12:12 +0000, Satyanarayana K V P wrote:
> > > > Add a xe_drm_mm manager to allocate sub-ranges from a BO-backed
> > > > pool
> > > > using drm_mm.
> > > 
> > > Just a comment on the naming. xe_drm_mm sounds like this is yet
> > > another
> > > specialized range manager implementation.
> > 
> > well, in fact it looks like *very* specialized MM, not much reusable
> > elsewhere
> 
> True, what I meant was it's not *implementing* a new range manager,
> like drm_mm, but rather using an existing.
> 
> > 
> > > 
> > > Could we invent a better name? 
> > > 
> > > xe_mm_suballoc? Something even better?
> > 
> > xe_shadow_pool ?
> 
> I noticed a new patch was sent out renaming to xe_mm_suballoc but 
> xe_shadow_pool sounds much better.

+1, tend to not look at naming nits when reviewing. xe_shadow_pool is a
better name.

Matt

> 
> Thanks,
> Thomas
> 
> 
> 
> > 
> > or if we split this MM into "plain pool" and "shadow pool":
> > 
> > xe_pool		--> like xe_sa but works without fences (can be
> > reused in xe_guc_buf)
> > xe_shadow_pool	--> built on top of plain, with shadow logic
> > 
> > 
> > more comments below
> > 
> > > 
> > > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > 
> > > > 
> > > > Signed-off-by: Satyanarayana K V P
> > > > <satyanarayana.k.v.p@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile          |   1 +
> > > >  drivers/gpu/drm/xe/xe_drm_mm.c       | 200
> > > > +++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_drm_mm.h       |  55 ++++++++
> > > >  drivers/gpu/drm/xe/xe_drm_mm_types.h |  42 ++++++
> > > >  4 files changed, 298 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.h
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm_types.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > b/drivers/gpu/drm/xe/Makefile
> > > > index dab979287a96..6ab4e2392df1 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -41,6 +41,7 @@ xe-y += xe_bb.o \
> > > >  	xe_device_sysfs.o \
> > > >  	xe_dma_buf.o \
> > > >  	xe_drm_client.o \
> > > > +	xe_drm_mm.o \
> > > >  	xe_drm_ras.o \
> > > >  	xe_eu_stall.o \
> > > >  	xe_exec.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_drm_mm.c
> > > > b/drivers/gpu/drm/xe/xe_drm_mm.c
> > > > new file mode 100644
> > > > index 000000000000..c5b1766fa75a
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_drm_mm.c
> > > > @@ -0,0 +1,200 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <drm/drm_managed.h>
> > 
> > nit: <linux> headers go first
> > 
> > > > +#include <linux/kernel.h>
> > > > +
> > > > +#include "xe_device_types.h"
> > > > +#include "xe_drm_mm_types.h"
> > > > +#include "xe_drm_mm.h"
> > > > +#include "xe_map.h"
> > > > +
> > > > +static void xe_drm_mm_manager_fini(struct drm_device *drm, void
> > > > *arg)
> > > > +{
> > > > +	struct xe_drm_mm_manager *drm_mm_manager = arg;
> > > > +	struct xe_bo *bo = drm_mm_manager->bo;
> > > > +
> > > > +	if (!bo) {
> > 
> > not needed, we shouldn't be here if we failed to allocate a bo
> > 
> > > > +		drm_err(drm, "no bo for drm mm manager\n");
> > 
> > btw, our MM seems to be 'tile' oriented, so we should use
> > xe_tile_err() 
> > 
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	drm_mm_takedown(&drm_mm_manager->base);
> > > > +
> > > > +	if (drm_mm_manager->is_iomem)
> > > > +		kvfree(drm_mm_manager->cpu_addr);
> > > > +
> > > > +	drm_mm_manager->bo = NULL;
> > > > +	drm_mm_manager->shadow = NULL;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_drm_mm_manager_init() - Create and initialize the DRM MM
> > > > manager.
> > > > + * @tile: the &xe_tile where allocate.
> > > > + * @size: number of bytes to allocate
> > > > + * @guard: number of bytes to exclude from allocation for guard
> > > > region
> > 
> > do we really need this guard ? it was already questionable on the
> > xe_sa
> > 
> > > > + * @flags: additional flags for configuring the DRM MM manager.
> > > > + *
> > > > + * Initializes a DRM MM manager for managing memory allocations
> > > > on a
> > > > specific
> > > > + * XE tile. The function allocates a buffer object to back the
> > > > memory region
> > > > + * managed by the DRM MM manager.
> > > > + *
> > > > + * Return: a pointer to the &xe_drm_mm_manager, or an error
> > > > pointer
> > > > on failure.
> > > > + */
> > > > +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
> > > > *tile, u32 size,
> > > > +						 u32 guard, u32
> > > > flags)
> > > > +{
> > > > +	struct xe_device *xe = tile_to_xe(tile);
> > > > +	struct xe_drm_mm_manager *drm_mm_manager;
> > > > +	u64 managed_size;
> > > > +	struct xe_bo *bo;
> > > > +	int ret;
> > > > +
> > > > +	xe_tile_assert(tile, size > guard);
> > > > +	managed_size = size - guard;
> > > > +
> > > > +	drm_mm_manager = drmm_kzalloc(&xe->drm,
> > > > sizeof(*drm_mm_manager), GFP_KERNEL);
> > > > +	if (!drm_mm_manager)
> > > > +		return ERR_PTR(-ENOMEM);
> > 
> > can't we make this manager a member of the tile and then use
> > container_of to get parent tile pointer?
> > 
> > I guess we will have exactly one this MM per tile, no?
> > 
> > > > +
> > > > +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> > > > +					 
> > > > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > > +					  XE_BO_FLAG_GGTT |
> > > > +					 
> > > > XE_BO_FLAG_GGTT_INVALIDATE
> > > > > 
> > > > +					 
> > > > XE_BO_FLAG_PINNED_NORESTORE);
> > > > +	if (IS_ERR(bo)) {
> > > > +		drm_err(&xe->drm, "Failed to prepare %uKiB BO
> > > > for
> > 
> > xe_tile_err(tile, ...
> > 
> > but maybe nicer solution would be to add such error to the
> > xe_managed_bo_create_pin_map() to avoid duplicating this diag
> > messages in all callers
> > 
> > > > DRM MM manager (%pe)\n",
> > > > +			size / SZ_1K, bo);
> > > > +		return ERR_CAST(bo);
> > > > +	}
> > > > +	drm_mm_manager->bo = bo;
> > > > +	drm_mm_manager->is_iomem = bo->vmap.is_iomem;
> > 
> > do we need to cache this?
> > 
> > > > +
> > > > +	if (bo->vmap.is_iomem) {
> > > > +		drm_mm_manager->cpu_addr =
> > > > kvzalloc(managed_size,
> > > > GFP_KERNEL);
> > > > +		if (!drm_mm_manager->cpu_addr)
> > > > +			return ERR_PTR(-ENOMEM);
> > > > +	} else {
> > > > +		drm_mm_manager->cpu_addr = bo->vmap.vaddr;
> > > > +		memset(drm_mm_manager->cpu_addr, 0, bo-
> > > > > ttm.base.size);
> > 
> > btw, maybe we should consider adding XE_BO_FLAG_ZERO and let
> > the xe_create_bo do initial clear for us?
> > 
> > @Matt @Thomas ?
> > 
> > > > +	}
> > > > +
> > > > +	if (flags & XE_DRM_MM_BO_MANAGER_FLAG_SHADOW) {
> > 
> > hmm, so this is not a main feature of this MM?
> > then maybe we should have two components:
> > 
> > 	* xe_pool (plain MM, like xe_sa but without fences)
> > 	* xe_shadow (adds shadow BO on top of plain MM)
> > 
> > > > +		struct xe_bo *shadow;
> > > > +
> > > > +		ret = drmm_mutex_init(&xe->drm, &drm_mm_manager-
> > > > > swap_guard);
> > > > +		if (ret)
> > > > +			return ERR_PTR(ret);
> > > > +		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > > > +			fs_reclaim_acquire(GFP_KERNEL);
> > > > +			might_lock(&drm_mm_manager->swap_guard);
> > > > +			fs_reclaim_release(GFP_KERNEL);
> > > > +		}
> > > > +
> > > > +		shadow = xe_managed_bo_create_pin_map(xe, tile,
> > > > size,
> > > > +						     
> > > > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > > +						     
> > > > XE_BO_FLAG_GGTT |
> > > > +						     
> > > > XE_BO_FLAG_GGTT_INVALIDATE |
> > > > +						     
> > > > XE_BO_FLAG_PINNED_NORESTORE);
> > > > +		if (IS_ERR(shadow)) {
> > > > +			drm_err(&xe->drm,
> > > > +				"Failed to prepare %uKiB shadow
> > > > BO
> > > > for DRM MM manager (%pe)\n",
> > > > +				size / SZ_1K, shadow);
> > > > +			return ERR_CAST(shadow);
> > > > +		}
> > > > +		drm_mm_manager->shadow = shadow;
> > > > +	}
> > > > +
> > > > +	drm_mm_init(&drm_mm_manager->base, 0, managed_size);
> > > > +	ret = drmm_add_action_or_reset(&xe->drm,
> > > > xe_drm_mm_manager_fini, drm_mm_manager);
> > > > +	if (ret)
> > > > +		return ERR_PTR(ret);
> > > > +
> > > > +	return drm_mm_manager;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_drm_mm_bo_swap_shadow() - Swap the primary BO with the
> > > > shadow
> > > > BO.
> > 
> > do we need _bo_ in the function name here?
> > 
> > > > + * @drm_mm_manager: the DRM MM manager containing the primary
> > > > and
> > > > shadow BOs.
> > > > + *
> > > > + * Swaps the primary buffer object with the shadow buffer object
> > > > in
> > > > the DRM MM
> > > > + * manager.
> > 
> > say a word about required swap_guard mutex
> > 
> > and/or add the _locked suffix to the function name
> > 
> > > > + *
> > > > + * Return: None.
> > > > + */
> > > > +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
> > > > *drm_mm_manager)
> > > > +{
> > > > +	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo-
> > > > >tile);
> > > > +
> > > > +	xe_assert(xe, drm_mm_manager->shadow);
> > 
> > use xe_tile_assert
> > 
> > > > +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> > > > +
> > > > +	swap(drm_mm_manager->bo, drm_mm_manager->shadow);
> > > > +	if (!drm_mm_manager->bo->vmap.is_iomem)
> > > > +		drm_mm_manager->cpu_addr = drm_mm_manager->bo-
> > > > > vmap.vaddr;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_drm_mm_sync_shadow() - Synchronize the shadow BO with the
> > > > primary BO.
> > > > + * @drm_mm_manager: the DRM MM manager containing the primary
> > > > and
> > > > shadow BOs.
> > > > + * @node: the DRM MM node representing the region to
> > > > synchronize.
> > > > + *
> > > > + * Copies the contents of the specified region from the primary
> > > > buffer object to
> > > > + * the shadow buffer object in the DRM MM manager.
> > > > + *
> > > > + * Return: None.
> > > > + */
> > > > +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager
> > > > *drm_mm_manager,
> > > > +			   struct drm_mm_node *node)
> > > > +{
> > > > +	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo-
> > > > >tile);
> > > > +
> > > > +	xe_assert(xe, drm_mm_manager->shadow);
> > > > +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> > > > +
> > > > +	xe_map_memcpy_to(xe, &drm_mm_manager->shadow->vmap,
> > > > +			 node->start,
> > > > +			 drm_mm_manager->cpu_addr + node->start,
> > > > +			 node->size);
> > 
> > maybe I'm missing something, but if primary BO.is_iomem==true then
> > who/when updates the actual primary BO memory? or is it unused by
> > design and only shadow has the data ...
> > 
> > maybe some DOC section with theory-of-operation will help here?
> > 
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_drm_mm_insert_node() - Insert a node into the DRM MM
> > > > manager.
> > > > + * @drm_mm_manager: the DRM MM manager to insert the node into.
> > > > + * @node: the DRM MM node to insert.
> > 
> > in recent changes to xe_ggtt we finally hidden the implementation
> > details
> > of the MM used by the xe_ggtt
> > 
> > why here we start again exposing impl detail as part of the API?
> > if we can't allocate xe_drm_mm_node here, maybe at least take it
> > as a parameter and update in place
> > 
> > > > + * @size: the size of the node to insert.
> > > > + *
> > > > + * Inserts a node into the DRM MM manager and clears the
> > > > corresponding memory region
> > > > + * in both the primary and shadow buffer objects.
> > > > + *
> > > > + * Return: 0 on success, or a negative error code on failure.
> > > > + */
> > > > +int xe_drm_mm_insert_node(struct xe_drm_mm_manager
> > > > *drm_mm_manager,
> > > > +			  struct drm_mm_node *node, u32 size)
> > > > +{
> > > > +	struct drm_mm *mm = &drm_mm_manager->base;
> > > > +	int ret;
> > > > +
> > > > +	ret = drm_mm_insert_node(mm, node, size);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	memset((void *)drm_mm_manager->bo->vmap.vaddr + node-
> > > > >start,
> > > > 0, node->size);
> > 
> > iosys_map_memset(bo->vmap, start, 0, size) ?
> > 
> > > > +	if (drm_mm_manager->shadow)
> > > > +		memset((void *)drm_mm_manager->shadow-
> > > > >vmap.vaddr +
> > > > node->start, 0,
> > > > +		       node->size);
> > 
> > what about clearing the drm_mm_manager->cpu_addr ?
> > 
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_drm_mm_remove_node() - Remove a node from the DRM MM
> > > > manager.
> > > > + * @node: the DRM MM node to remove.
> > > > + *
> > > > + * Return: None.
> > > > + */
> > > > +void xe_drm_mm_remove_node(struct drm_mm_node *node)
> > > > +{
> > > > +	return drm_mm_remove_node(node);
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_drm_mm.h
> > > > b/drivers/gpu/drm/xe/xe_drm_mm.h
> > > > new file mode 100644
> > > > index 000000000000..aeb7cab92d0b
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_drm_mm.h
> > > > @@ -0,0 +1,55 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +#ifndef _XE_DRM_MM_H_
> > > > +#define _XE_DRM_MM_H_
> > > > +
> > > > +#include <linux/sizes.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +#include "xe_bo.h"
> > > > +#include "xe_drm_mm_types.h"
> > > > +
> > > > +struct dma_fence;
> > 
> > do we need this?
> > 
> > > > +struct xe_tile;
> > > > +
> > > > +#define XE_DRM_MM_BO_MANAGER_FLAG_SHADOW    BIT(0)
> > > > +
> > > > +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
> > > > *tile, u32 size,
> > > > +						 u32 guard, u32
> > > > flags);
> > > > +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
> > > > *drm_mm_manager);
> > > > +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager
> > > > *drm_mm_manager,
> > > > +			   struct drm_mm_node *node);
> > > > +int xe_drm_mm_insert_node(struct xe_drm_mm_manager
> > > > *drm_mm_manager,
> > > > +			  struct drm_mm_node *node, u32 size);
> > > > +void xe_drm_mm_remove_node(struct drm_mm_node *node);
> > > > +
> > > > +/**
> > > > + * xe_drm_mm_manager_gpu_addr() - Retrieve GPU address of a back
> > > > storage BO
> > > > + * within a memory manager.
> > > > + * @drm_mm_manager: The DRM MM memory manager.
> > > > + *
> > > > + * Returns: GGTT address of the back storage BO
> > > > + */
> > > > +static inline u64 xe_drm_mm_manager_gpu_addr(struct
> > > > xe_drm_mm_manager
> > > > +					     *drm_mm_manager)
> > > > +{
> > > > +	return xe_bo_ggtt_addr(drm_mm_manager->bo);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_drm_mm_bo_swap_guard() - Retrieve the mutex used to guard
> > > > swap
> > > > operations
> > 
> > hmm, do we need the _bo_ here?
> > 
> > > > + * on a memory manager.
> > > > + * @drm_mm_manager: The DRM MM memory manager.
> > > > + *
> > > > + * Returns: Swap guard mutex.
> > > > + */
> > > > +static inline struct mutex *xe_drm_mm_bo_swap_guard(struct
> > > > xe_drm_mm_manager
> > > > +						   
> > > > *drm_mm_manager)
> > > > +{
> > > > +	return &drm_mm_manager->swap_guard;
> > > > +}
> > > > +
> > > > +#endif
> > > > +
> > > > diff --git a/drivers/gpu/drm/xe/xe_drm_mm_types.h
> > > > b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> > > > new file mode 100644
> > > > index 000000000000..69e0937dd8de
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> > > > @@ -0,0 +1,42 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_DRM_MM_TYPES_H_
> > > > +#define _XE_DRM_MM_TYPES_H_
> > > > +
> > > > +#include <drm/drm_mm.h>
> > > > +
> > > > +struct xe_bo;
> > > > +
> > 
> > without kernel-doc for the struct itself, below kernel-docs for the
> > members are currently not recognized by the tool
> > 
> > > > +struct xe_drm_mm_manager {
> > > > +	/** @base: Range allocator over [0, @size) in bytes */
> > > > +	struct drm_mm base;
> > > > +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
> > > > +	struct xe_bo *bo;
> > > > +	/** @shadow: Shadow BO for atomic command updates. */
> > > > +	struct xe_bo *shadow;
> > > > +	/** @swap_guard: Timeline guard updating @bo and @shadow
> > > > */
> > > > +	struct mutex swap_guard;
> > > > +	/** @cpu_addr: CPU virtual address of the active BO. */
> > > > +	void *cpu_addr;
> > > > +	/** @size: Total size of the managed address space. */
> > > > +	u64 size;
> > > > +	/** @is_iomem: Whether the managed address space is I/O
> > > > memory. */
> > > > +	bool is_iomem;
> > > > +};
> > > > +
> > 
> > ditto
> > 
> > > > +struct xe_drm_mm_bb {
> > > > +	/** @node: Range node for this batch buffer. */
> > > > +	struct drm_mm_node node;
> > > > +	/** @manager: Manager this batch buffer belongs to. */
> > > > +	struct xe_drm_mm_manager *manager;
> > > > +	/** @cs: Command stream for this batch buffer. */
> > > > +	u32 *cs;
> > > > +	/** @len: Length of the CS in dwords. */
> > > > +	u32 len;
> > > > +};
> > 
> > but we are not using this struct yet in this patch, correct?
> > 
> > > > +
> > > > +#endif
> > > > +
