Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33983C83F12
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 19:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF62510E359;
	Wed,  9 Jul 2025 19:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QO/yvDCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F75410E359
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 19:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752088076; x=1783624076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D/pNysOOBzcCpmfLiY7y7sXbOH110K9iZM0L2scmeeo=;
 b=QO/yvDCRUyFo6/2uW3mTI1ixjArvv/8rFPcHezF+qHeaDgSigTUBjIlB
 1OKpkmoNrWUg7tNJQtv7/pXhiLGwPYFHN1CQuiNuffMr7yEMSH0OXgt7l
 1KsLTRfmQ4P5PreJhE+Veewh3eH/rkGGMymijjeZZQhdqBj/y5lBiuN+1
 xWI8bVDVWCldRXBMRaqZ719rmlDxY7jRyqzb3PRTwJqY1bd+kWINDcUBa
 L4an7+ood/zBwTNloR0/f0a4IYZFydRlFwcxqlEowyus8a9605Fnk61DZ
 rabye7gfFogXT4NdjaAvgM8ZlAzXLIpqF7V5K6sZyjgYuZ8xjh0gMgi3y Q==;
X-CSE-ConnectionGUID: XsclgYfDRuConoXgusAfLQ==
X-CSE-MsgGUID: ZOtyfqI7SBSnkqWomWfd1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53468961"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="53468961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:07:56 -0700
X-CSE-ConnectionGUID: zA++mSOKSeqMwDAJusAKSA==
X-CSE-MsgGUID: Uo359P+FSxadDSplMIZlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156340788"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:07:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 12:07:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 12:07:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 12:07:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulW8cUubpS36gViW9pvol1IRfhq4RboTLuG7iCZ2JeUKVcrfSUWIeZ/1gyGzy76lauSXgv1vf0wMz67L5UdHtTUYPsORRvs2Nai3IcXBg1kOn1iPq47haGCeMzAS4RgqUYUUc5F0LvJboeCDmv3v/kqSwRPNeDH2N/eGlPsPtZdv5DlWh8rGYZDcFuR6eFF/38kVn5AiwxCxav+rFhW41xBI7zaalAvLuD48+b4UOLwyoh5dWMaLANeNLfgI3CI7ygTvKdBfIS7jkcsw+O/WEuNcnFq9U9xuRvX0vEgk1Ha6JpnNNmoJ7/IIcL/PUSCsSPzy++V0MFSTDS7iMTjUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLQEyhynqeVveaoEz10YkixNqocvmHHtJRf6P9hH1U8=;
 b=YLCXt8sifuBFj7+BGiZxi65ZHv3WS+u3ha7ILlA3NrzFHs2WASfptLIGkdEqQNZzoY4jDxGbCANUjs0zL7iG3GgzEt/NoJUVd/hFMjocJDBOi7lKkkg/2Pzt4LDQnFQ3gzl46KnQbQrMDJK/n4huniGrMWuo1BYislIK1nNMLMTHB8I/XwcHjPad9tQVrsM76o/s4/2IDH3qo49ADHBEgzWEtr8B5QMdELs6sLsO1hudxU4ITQYIS1btO5HTdQH474UoMVDGA9fm1/Tf+tQUEpwKDdXFum3GlhUURo1KI02h0TYdzRZqgfEWsBQXE7gkG+5j1FDak24Qw484+kJzHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 19:07:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 19:07:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/guc: Cancel ongoing H2G requests when stopping
 CT
Thread-Topic: [PATCH 3/3] drm/xe/guc: Cancel ongoing H2G requests when
 stopping CT
Thread-Index: AQHb8Piq5SFhg+f4XEWjvhEASM6LIrQqJixA
Date: Wed, 9 Jul 2025 19:07:19 +0000
Message-ID: <CH0PR11MB5444F7EFE57232CCBFEDD0C3E549A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250709174038.1876-1-michal.wajdeczko@intel.com>
 <20250709174038.1876-4-michal.wajdeczko@intel.com>
In-Reply-To: <20250709174038.1876-4-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7685:EE_
x-ms-office365-filtering-correlation-id: 89008ab6-3ccf-45b9-01a0-08ddbf1bd4e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PWLwJvB4OXUXopKZ6pNhp/bvO6aw7igZh613Tbsz7AYp7AGGsKok3aBgQKbr?=
 =?us-ascii?Q?OF8RpNdYf+btCkckp8wr9GrkQ+M/jkoKD+6bZtJ2xdHXwdIfzGKxVY4TX9dw?=
 =?us-ascii?Q?bhSVhuOhqr+Zu3/ii05QDFMWQdIhcXd0by3bDSDOdsXF5+irQ5EAXjOHr8Qq?=
 =?us-ascii?Q?OBwhaxdG4AXFA+GgfD738ZBUaU9cJ2++F0xblJdmNt25ocP5wrbOpV8LRH9P?=
 =?us-ascii?Q?ByUmAyHfDNrqvG7wcSFq8mCj9c5j6ByfoplIWQEImpUCMpcb0xbExM9cPSuG?=
 =?us-ascii?Q?Fiyq/GKp+tl7p07MiHuxzdBJheWxKjQo8fe1C1ef4zZccVFagLDDuIJGxeyx?=
 =?us-ascii?Q?gltr8m3YkqV/DIiT4TqByr3U2Y00tPf7u3VO2eHq2hiW37BThuq343l1hHsQ?=
 =?us-ascii?Q?aWEQ35ccZkKcr7tbfjYgs56cEtl+omPfqTv6eIkZvtTtvQC9xoOv76zsZiPv?=
 =?us-ascii?Q?h8NNh5+UCkPhACdSkpV2QFZ9mxHtHdajwGi/YelDpoYd4X7+3seQuY+1ixUi?=
 =?us-ascii?Q?vxT6VNFnSkv8jK3cOzEHaagxRoN4wM6rMhTl7DZ945XyvutALQJDbIE1zvm4?=
 =?us-ascii?Q?aCP4Bhe10PU8vqU8d8zHTVhdjTOL8tQBxjWF18qyU9txXfxWVlW3zChTCPNL?=
 =?us-ascii?Q?CugNClj0Q4ox7g8qNZVknE22ITQtDPD3mWhrusf8aMoyKeJPcPesyaUz9u8R?=
 =?us-ascii?Q?pgcQOf/mycujoQ8l+pLJq3pJlcztgqTY2z4bnTuD/hkpS9s3H7VHx5LnEvvh?=
 =?us-ascii?Q?yIq9M+v9wSaOnGHaHTiLlu9AcgDnz74O8CuCO1C7FrXdIehuJ8Pr4F+qg8X5?=
 =?us-ascii?Q?7Uf0C7SJnpHHnzbxOTShvFSAvV9/BR0PTv+sw2Qpw5MZjTYCAmGDsukNU9RY?=
 =?us-ascii?Q?mHEoq5HCKroGs0bUACQvbnsliGGfzcPIi8BW0hFMZJym0k+gOl8MH6UHYPqY?=
 =?us-ascii?Q?UeUlorHuk44JKLQ2b/o8oCGubecr8FI9VC8+ZGJYjzdbDiGQh4hJGWS9e2Dg?=
 =?us-ascii?Q?wTRpXGgX+CgK6nHv5hgxALLH3hetEEZA3vBXo1k4eTySkN3uWd6zwjKsJL2A?=
 =?us-ascii?Q?95wu9YgFCDg7SA9lKmL5URiKA4SeruABmbao+4nYHxsGBU7hoSEwCzY5pbZo?=
 =?us-ascii?Q?QAud0NU+/HZtVh8Gl6bWy/0ZdQw571VAslcd6PJ1pleYYwXNj1ezoq+Pp6EX?=
 =?us-ascii?Q?u2fqt/t/He2GElYmMqibwOttd7WfQA4/lZdiW0UtOIZjQFYV5SfAO39FhVI4?=
 =?us-ascii?Q?HXYkL9pfwYE+ytkcUP8XIlg0WfNJregn/mv+MY2/i5Fw6X4SogzYuU3xVqxZ?=
 =?us-ascii?Q?Y5I4DkIoPlxTB1B+b+DWdP6Dax81hp7gfxK0opvRtcu4LmppIXRa2crpLpEY?=
 =?us-ascii?Q?uYxUDlQj/1ghaOcsy/w/YnALWjCAV7Ik8nZHF7+TGRAFmS84kep0BghGZ/j1?=
 =?us-ascii?Q?HC5l4kWRUupfgJqnYpIUW3NV17/ztotZa4OVtq2w4dOty0ppCsXetw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JhXrTjXPM584VMQQ5Q9pmR01vRuMRh5aKD4G6EF0aWIGw8eCTh0NBu2HxJZj?=
 =?us-ascii?Q?u0hlYKQCMmsI8BpeJFGKxPtkx9111Nk5amA0NxnEmv1dizecCV4HWP26/SSL?=
 =?us-ascii?Q?OWGlB5L4F3QtYSQ4O2VPGvvciqYFAf/POSPlu0Q7QxX5eI1mmEgvuCxqS1qI?=
 =?us-ascii?Q?xV3vYS9kCUFiNoB5EPsNRzB8bCVWL8vrEPUSwDXX7pqN3fZfv/YMuvza4xoa?=
 =?us-ascii?Q?7TJUE/IHy11exxcPsjqd6/D9uyowFHqYS9WJtsyWiqGRQBD+LIEOLCYBNM6U?=
 =?us-ascii?Q?xpX1U7U1vJSZHQbhMYa/4DNqsp/vv9KhLcQ6Xopi8CXatnV/wcm45D/Lo+KE?=
 =?us-ascii?Q?4Jtq/qvYf1mx35k733pexhFsKWbwIARwfDGovHaQdHPJMXQOqkcWpfqqE5Xn?=
 =?us-ascii?Q?oYFriwzpclZkXYiOxwIAROH7PWgGNzEahbIj6f7QrnzxJmmFvX5filmBfKxu?=
 =?us-ascii?Q?NMqBqejfAc2+kJy1iV44HsB+ba2+rlPVkOrLXwvQzNaEPeKnwqUnuQvkfBQM?=
 =?us-ascii?Q?+5dI5NzLiCU1FW/GpS7fcoVOt6LQ9oQobdBOEWcHMO8bs1QsDemGKuYNELFE?=
 =?us-ascii?Q?IZpKPIge7InQfyh4mzwZy3rTQtupltFEmflakjGUK1BwfQc2L/vhM4xXScm/?=
 =?us-ascii?Q?X+4kW/U5rulLa1cI0AoNwAep6O6KeQQW4sAinriJqNwG8JzETP3Fp+l80LmY?=
 =?us-ascii?Q?z8hrJAtNMISlqdD98tZ24IwUFenAYkWXNKpb8TirhQCe5yuTkHfx2usRnWhm?=
 =?us-ascii?Q?zHru3OoNX0UFcQz26uidYk1RNagb03eVyXDn0BKRmFLd9TKPCZrAnPFS32Im?=
 =?us-ascii?Q?Ys6ob1cPHnaEq8MjSGvkN6bJ+ff9gn9xdOkYMR6udxqzXn3ry5xhMPLvpb6X?=
 =?us-ascii?Q?HKfVWv5MCQXLY0NMS9rrgXFN2BxYPWup18tTd3FznK0gzghtvl4Rxn+DOL6P?=
 =?us-ascii?Q?E0leozkpOMB2bxXnX1N8wPqLCldh/fuIAcO4Jl9qe+l/6//P4oNoatZNfmrq?=
 =?us-ascii?Q?Gljld1Fx+dPkt6iE7jxsZSfdM02ZxI73R3vYEnTRtrqNjB4bad2iIFXhSjfs?=
 =?us-ascii?Q?RNRUZ1lK9p+KBksaF5527thz6xaXBjCihCRjajymVpCo134DPwEaz4p/UvlZ?=
 =?us-ascii?Q?M9/Zd5Lf3Ufr297ZYPQ+cMdLodAqyHHGyznw2laYQUzcDQ1l7CFsAU1jWQpG?=
 =?us-ascii?Q?YeG2qLus2DTa5W/bmefklbDj0YXr63PT9a/FAPGwjSY4bCtJiFIfRBXLUtz1?=
 =?us-ascii?Q?Amw8tqyvOagQiS+7/RtEqqMTK/eQtxYbKONBXncaIUHMhcH+jYZAZfbUEx5W?=
 =?us-ascii?Q?/e/TenQ0uTMf+S0DBIGQwh1zat1yE6vs5VImJzuklClaxC4e7ygfy7Ew0jyn?=
 =?us-ascii?Q?jVvFet0YTKhTdQ+/wQMi2HgwchPSgtSgPyQt/0uft0VNpnJBEz9kil6gOh35?=
 =?us-ascii?Q?jPaWrGLkI5Ls6JcgAzpAhTWpJ8n2RCxzObTR8ALUFvJCvj0AOxfzdMrnQCuJ?=
 =?us-ascii?Q?yItiRo2SEGURpJy+B2lHywDgKdHuhqgxuu8kFTvhR8kU2QbrGqpjZI2qWDo3?=
 =?us-ascii?Q?gU5vsIqMoKhkIfOr1OgJEbSNaTx3hbEZQjxcZDTFwvmhQV8bO1tTlk+ohlt6?=
 =?us-ascii?Q?il5fHh1z+Qhq5pMC4Zapba0e3RPUTx90jt8QiB9qELlv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89008ab6-3ccf-45b9-01a0-08ddbf1bd4e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 19:07:19.9168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Ldc58oITyUqAKxlw/IYKCL410ibzXZuHFvgRQypryZnAReOnCBSYXYuSLREJOnev5T/N1cd1/wr69OwXpexpyFU8K3W7oDpEqK2VttJZy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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


>=20
> -----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, July 9, 2025 10:41 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Brost, Matthew <matthew=
.brost@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Cancel ongoing H2G requests when stopping =
CT
>=20
> Once we have started a GT reset sequence, which includes stopping
> GuC CTB communication, we should also cancel all onging H2G send-
> recv requests, as either GuC is already dead, or due to imminent
> reset GuC will not be able to reply, or due to internal cleanup
> we will loose pending fences. With this we will report dedicated
> -ECANCELED error instead of misleading -ETIME.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

s/onging/ongoing
s/loose/lose

And also, are we certain that reporting -ECANCELED here won't result
in some test failure due to expecting -ETIME in this failure case?  I'd
not expect so, but I'd like to be certain before proceeding.
Otherwise, though:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 17e5870baf33..b6acccfcd351 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -85,6 +85,7 @@ struct g2h_fence {
>  	u16 error;
>  	u16 hint;
>  	u16 reason;
> +	bool cancel;
>  	bool retry;
>  	bool fail;
>  	bool done;
> @@ -103,6 +104,13 @@ static void g2h_fence_init(struct g2h_fence *g2h_fen=
ce, u32 *response_buffer)
>  	g2h_fence->seqno =3D ~0x0;
>  }
> =20
> +static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
> +{
> +	g2h_fence->cancel =3D true;
> +	g2h_fence->fail =3D true;
> +	g2h_fence->done =3D true;
> +}
> +
>  static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>  {
>  	return g2h_fence->seqno =3D=3D ~0x0;
> @@ -388,6 +396,8 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
>  				enum xe_guc_ct_state state)
>  {
>  	struct xe_gt *gt =3D ct_to_gt(ct);
> +	struct g2h_fence *g2h_fence;
> +	unsigned long idx;
> =20
>  	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>  	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> @@ -406,6 +416,14 @@ static void guc_ct_change_state(struct xe_guc_ct *ct=
,
> =20
>  	spin_unlock_irq(&ct->fast_lock);
> =20
> +	/* cancel all in-flight send-recv requests */
> +	xa_for_each(&ct->fence_lookup, idx, g2h_fence)
> +		g2h_fence_cancel(g2h_fence);
> +
> +	/* make sure guc_ct_send_recv() will see g2h_fence changes */
> +	smp_mb();
> +	wake_up_all(&ct->g2h_fence_wq);
> +
>  	/*
>  	 * Lockdep doesn't like this under the fast lock and he destroy only
>  	 * needs to be serialized with the send path which ct lock provides.
> @@ -1098,6 +1116,11 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, =
const u32 *action, u32 len,
>  		goto retry;
>  	}
>  	if (g2h_fence.fail) {
> +		if (g2h_fence.cancel) {
> +			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
> +			ret =3D -ECANCELED;
> +			goto unlock;
> +		}
>  		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
>  			  action[0], g2h_fence.error, g2h_fence.hint);
>  		ret =3D -EIO;
> @@ -1106,6 +1129,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, c=
onst u32 *action, u32 len,
>  	if (ret > 0)
>  		ret =3D response_buffer ? g2h_fence.response_len : g2h_fence.response_=
data;
> =20
> +unlock:
>  	mutex_unlock(&ct->lock);
> =20
>  	return ret;
> --=20
> 2.47.1
>=20
>=20
