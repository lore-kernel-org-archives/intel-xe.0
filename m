Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30549CA0EC4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 18:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8D910E196;
	Mon, 11 Aug 2025 18:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7YavukZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C1410E196
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 18:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754938236; x=1786474236;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OD+ihN3iX1bgHzsAlTlMqMV8aUJmMp5wet0ZIbjoTws=;
 b=L7YavukZUdOdHc4ydXu6OyPxT3PzxnTVffhlaKH535JJf/q7SBDsvH87
 BBo+vP+4AhIJfw/7rAP+sQ6bZyBWwcX3mcRqBMhJ7iscPoKxO9ZTMm/vP
 05/PX32ThF0kSKZt7f7ZyLrVAz+4Vp+trrWKbj4TquFkUfoJzjGRGbnwP
 Rshqflr+UAgT89yuicZYW9JExMVVMZKi/f5gDERobp77k86z37XKdch/U
 +3BlNxmG2M/hMLAR3XkxLHESR6qi2eKH2B+EQFuobOrxllhkV9yduPExt
 +rJqRdfx75jpfZxnJQg0B5QPiQQIk54b7PbdxnsJFy/U5br8oGskXQkIb g==;
X-CSE-ConnectionGUID: yl9JPlRnR0KNkhlNIs5OIw==
X-CSE-MsgGUID: Xb59Oo58QtaikAZiLQqtLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57344057"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57344057"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:50:35 -0700
X-CSE-ConnectionGUID: nNThwOliSnyzAi0EDouc+A==
X-CSE-MsgGUID: 8ywpcWRvSDqVPrnbRFSvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165992658"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:50:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 11:50:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 11:50:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.80)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 11:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCo2Zx2w+9Wa6krrhnEJcGh8c+rIerexYXsVQQ0B3lfMQPGG6BEObC3oMEWo1nIYjdOT26usjy14mBIMVNEytJZ1yq3HMGOf4Kom+yzLGGyhjAw+tleeH3L4aWECq896QIQjN+IjsQ331DeI/n+2WVY9CZ4+l58UQ7MaRelhJmDGaX68VaRGGRV21FG7lUuknvYI7lQiK5/v8MJ53zcXhBWBzZ3xII1T4/RxDQCO/whkkZ90a61ROcHQisBSuhuOPxp3BvoHJlgxDKe89j4z0eGbbg+sO7Wxw6P441VnM4Bmbu5GHcXNBP0PeabtyNF78V8P6Iq1tn6hx8T7zj1E4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5civZro/VD8rB1WRLqGdBDgGA9mWOieyKr8J+xei0E=;
 b=oSvP47W29CPK1ACIY2ZQlNbB4kesYJGGAF2p9ZTAeBIsRZHIkesy9Qf0r86sP2LyGdHNOmQFLpQX23Qk7xOqjyvpKnwzO9ZfvQGnXJBdE66F415stWOPNcluUx+L23rj2upWt0PFK3F+XYZz2oxSLtmitMZg8fhmiy2IUJMb9pMICWTCLeBDr3g+2rSsP+avV7ICutfBaPqWKpkFEGi4u2VhvqZvVP2A/lVFnYWTVGOYnamC9DPkLp8uU1pd6Ytfc54jkDvvcDjkJ0H8ufxalbXQpiB6k7Yu4ng5Y4TSGtKC1mEclw5LSU9ScDdntyPOh0oQtyG4jek+4+fRiKjxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7028.namprd11.prod.outlook.com (2603:10b6:510:20b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 18:50:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 18:50:31 +0000
Date: Mon, 11 Aug 2025 11:50:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Enable 2M pages in xe_migrate_vram
Message-ID: <aJo7dQ/F2KCJGml9@lstrano-desk.jf.intel.com>
References: <20250808185902.1948431-1-matthew.brost@intel.com>
 <5e5247746c71dd69bd26a4ae689f998299abb3db.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e5247746c71dd69bd26a4ae689f998299abb3db.camel@intel.com>
X-ClientProxiedBy: BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ffb13b-597c-4897-1cb6-08ddd907f2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnNScXROMWUxeUU3L1BUWGRSUGVaU2FhVWxva05OZ3pYdjl2T2xlWmVMZER3?=
 =?utf-8?B?WUl5eVpyMVRTbEl1bnNMQnVXR0FzRVdWVGwrbDhuaWFOOExTb29UVTVaNWwv?=
 =?utf-8?B?Q2RoOVNxZU1LNEtSWVY2UVZyb2dEZ0kyQlJ4YUJyc3Rub1p1RWsvbXg4RlFk?=
 =?utf-8?B?VlA4SC9VZjIweUpJWVZtTGJxalR3WnVGYmk3VDRIYjJpSHd3TmtEZHd3Qnkr?=
 =?utf-8?B?WWQ1VXZHRnVwYXdkRkFMdEhFNzY2UnNJaFNYRjNtaHVYcTZYRFVDUzYrQUNx?=
 =?utf-8?B?NTBYY2V5QllldU9sMWFJREU0YU80V0tEK3FENzBoUXVCb3VuUG9BT1pwWTlz?=
 =?utf-8?B?SVRkNm5iS3d0VjhFQWlrbi8vaU5IdUt2YU9DbzArMXNZSVQvSEF3WjdiR1Zq?=
 =?utf-8?B?Ukw4djJHeStGQkxtc0ZsRG9TRGdsK1phRE1McW1QQSt1UkVQbG1IUS9yaVAv?=
 =?utf-8?B?OU9XVE0vOFAzUFQ0VmFxMVArQnR2NDBvRjNVU1NnMW1yQmtpRkh2SGsycnZo?=
 =?utf-8?B?NFJKTXk2N01nWUM5S2NWYnhRZ1BzZEUxSGp6OG9HVnNFUFp0QW5KS3RYYmo4?=
 =?utf-8?B?SG4wcG5TK1AyRzVJamY1WjVSUXc2MTNpd25IRVRYUmdRTVcxc1VTYmZsb2s5?=
 =?utf-8?B?Nkc0Ykg4TjZtbDBiWTlmT0x1SlZ5ZzZHWDUycmk4VEp2OEJPTW0wKzQ5T24w?=
 =?utf-8?B?U0hXSElkRytDYVA2d2tSVjJiWVB1cEovY0YwVzFpTUR1UVlkeTAzeFZQdnFG?=
 =?utf-8?B?MWVaYnpCdGIwSVZ3d0tqZ3FrMzl2Q2lxYmJwSGtVTEJZSndkZ2ZUcWdudTFN?=
 =?utf-8?B?V1NSU0ZpYnlsUnBoVkVOb3ZPMi9GMkg1S04zemFDVGxLN2RmVTFFWVZtbWxF?=
 =?utf-8?B?ZUk4MWM4bVcyUEFTSWpVZ1NlTWVESHZZZm85Q0IvckwvaFZoZ1I0ZGpZeHpj?=
 =?utf-8?B?Rm1weUNoRmdUR0VKN0g5Mkw2Nkd3ZjZyMVFmYXdmL2ZjZEtUYXJrcU9kb2xj?=
 =?utf-8?B?ejMvTWFtT1N6Tm1ndmVFUGVIbU1wSzFxcFBVNkRTeURXUmtWbFBSQk5OazdG?=
 =?utf-8?B?UEp6VGxtdlRoVWFqNTZ1YkZjSUxkZjZ5TkhTYmRaWU5SN1cyTkRmc1hPRlN5?=
 =?utf-8?B?QlZYbGhkOUhPeDNTdXVJclJyVXBwMVJoSE5mY012Uk9penFPa2ZndG9tdWRS?=
 =?utf-8?B?YUg5WVJCaGxaMDBMeUpscy9ramthMGcxaDM3NmJINTlhRDRhSjBIZjhnekZt?=
 =?utf-8?B?OXUzeVVTcTFTMjg3bCszaTErb2hSc3BKN2lLRE1vOWtYcy9DK0dXTit1VkJK?=
 =?utf-8?B?OVQzVTdnVU9JaXJiMnRubWcrRnpUd2xxTzZtbG1oRUJ3MFd0cXp1cDJrSjhI?=
 =?utf-8?B?ck50YUU1Q2QrUTBCd3JMNURDSWpSSFRRYmhPK2s3Y2Y3QzdxMmV4a2RjN2Jj?=
 =?utf-8?B?R21tN0VYbXZiaDBsSDAwTTk4K01EY1hGcFhONmwwNlJ3b2crMHNxVDM4OXdI?=
 =?utf-8?B?VU5XUWM1ejNLb1NkSkYzQzFHZkZaM3hzRXpSMEVpWTQ5M0J2WWFQQmVSTS9m?=
 =?utf-8?B?Q2x2VWRReUJaK3RtcmVPangxcldOdjBaenphdHF3SktuWDBWbExIMzRrcUZG?=
 =?utf-8?B?MzFEY05EQzRZeGhYMnp0cUlLUlJIUkF0SXBvSEhFVC8vN3dta0lCRFpnb0ZO?=
 =?utf-8?B?TXNHaUVCQW9NNHpXOHVDNDdyTEJiTldJcEZVNUd0MXFzSkZOSWo5ZmFjdmYr?=
 =?utf-8?B?eXBINjhsVEZONlo0NmkzeEdoZGw3Q2xNRTl2ZTBNeFoyc2Z0Tmlmc3E0eFNm?=
 =?utf-8?B?UWJYUkQ5WTAvcUVUM2taNVNrWU5kVHVLa3ErOEVONzVLUTVpRXRZVUo4T0Vz?=
 =?utf-8?B?bU5vK0ZsbWlvS1FRT0VTM0Z5TkdmT0tVTmhTN3hIZ3AyYkUzaFk1d3dhbGxm?=
 =?utf-8?Q?ec3+jnPvUHU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG8rcU1OQ0ZXTkRhRVpja2k1RjZUOUd6Ui9UV2dmREhPNzU3ZHBVVlltcGZy?=
 =?utf-8?B?T3BqZ0trNlBlRjJORnJGc1BNUXU3NWpMeEdnYkJESTlocWs3U3pDQkVZVzdS?=
 =?utf-8?B?bjk0Um1NT0prZVpyZkcxWElaU1dKY1EwOStNZ3RMbUJJQmdJUC9MdFc1bzBH?=
 =?utf-8?B?NFJnYm40c0VFQUJhNXAvbkxsNVZkWXYxeDh1N2pIMjFUUVZCZytjSU9SQ1Rj?=
 =?utf-8?B?MEZRSEJPNEFUWUZBbXl6UnpudEd1bTlQSFQxQzcrYkgrWUZubzUxMHZrQjN5?=
 =?utf-8?B?RmFJUVduS1A5aFJRNWw4VkpRdUdOcFZkS1k5YWhUWjFxNHM1WWlnZkFYNzF2?=
 =?utf-8?B?MlJCRzl6TVhQcFMxVUZJN1JOUWRSUUJSTE9SVU9TWEtvVE42UldSL0NHdEFY?=
 =?utf-8?B?Y0dlR2J1eEc5REdXS29WeHZ4SWJWczdJQlNzZy9sbjNZNzhIWHdib3BmcURQ?=
 =?utf-8?B?K2lwd2M4eGRzTkNLYkRBLzMwRVdYbE90QmUyaXNhS1h4QTFIUXo3YXh0ZEUr?=
 =?utf-8?B?VWozdkhUTVhtQW5kcTdKdGwydEVHZHphWkV0ZUR6eFhDQ3IzRFZGcEp0aXpi?=
 =?utf-8?B?cnVEZVQ3dnBXc213VDh3bkV3cGNzZ2RIQi9PZ2xUVjBqVmg0Q0pMRW8wbDlE?=
 =?utf-8?B?b0JKa3krTDI1SGVzOXNhUjIza1d3VXZOYldjdTlTSGtGd3lZWVVvNDhPMmY4?=
 =?utf-8?B?OUtKR3psUFphalRuZ3o2cWJzb2NHeEtjTE5EOEM1Q0pzVTlvTTdKWWt3SllI?=
 =?utf-8?B?cWFFeVVJTXF4UC9oa3cvcWxueFVDZXg1aVVFWTZSUjhHeEEvdklTK2NRc0s5?=
 =?utf-8?B?K2hrcGhGY01SK3lmdGd4aFFibmoxYjVYYXo1YnZaTk1vUUxka3RTbDV0eEVx?=
 =?utf-8?B?cGxmS2hBdlI2V2hRcWhFTDhYUEFTVVdLTXJvUlpHNnhkejFkRkZHajRCNng5?=
 =?utf-8?B?bW1RVUFjVE85MGRIR2dkMTNJY0pnMkFWMzBXWGZaYzlOWGV2Qkd6Z0Z5SmxD?=
 =?utf-8?B?VmV4ekhZK3gwOHphTTVkbXpvVHpoMWZZTGM4dW4zRnNzZzJRblIyQnBRdHlF?=
 =?utf-8?B?N0QwQUZqbSs3bWNQS1hDc2VzZm0rVklDaGJOMnVFRVpMZHorNHFzVlcxUHh5?=
 =?utf-8?B?cVpySnVLWnBzWkszRmlRMWQzVFNhYXNCNnJiU0wvTkY5eE55eGxBTmdBTHRS?=
 =?utf-8?B?OUNuNlJPRldPbWM4bld3WVJtS0tOMWNkSjVRTzN2Z29lc25rK2ZOVlpySHR3?=
 =?utf-8?B?b01JVTVhVGVSYWRubEVuVDI5WkJsYkJNUVVGakNlK0xsckFLYXVBeFFqWHhF?=
 =?utf-8?B?aGpkaFhsN2pXWVpRbzMvOXIreUsraVVXMlRtdTdORDBtdit3S0ZFV2FIN0pJ?=
 =?utf-8?B?RnNaaGhkMTl1eEJYUlZCSmVsMno4OG5FcSsyK0N4d2RpK2h4RnlDRm1scEFG?=
 =?utf-8?B?T2pEQ2k1WHB5SkRnZTRiZUtjbWcra2ZSakdnVlpvTEk3SnRCakYvSngwSkN5?=
 =?utf-8?B?aVJLWkZDQ2hYdndmVmV5ZEFPZE1ibmVYY2t0RGQyTG9aZFVOcDRKUGhLeUkx?=
 =?utf-8?B?cWo3M2NPd1BSYlJXK0ZrTWQrSjE4NDduVnQ5NVpURThYZWhnbkpnVmhnVG5K?=
 =?utf-8?B?NU51eEtNTER6Z0RYYldhMndPSDloUWVOWHh5VTN4d1BXdTVwVUVsYUJET0xL?=
 =?utf-8?B?dUhFdmN6TnR2SnB1Y2cxbVBpSWdyQlpxL2VsOEhKS241VFdXVUVBYUsrMkIv?=
 =?utf-8?B?b2Z1dnNlaEQ5M0VQZ3pqNVAxcnpONjZkME5Kb3g3SzU4SUpRSkhiRlpNT0ts?=
 =?utf-8?B?dzdhbUpMRFdCS3BIYzFOOG1oVXFiNnMxS1IvS0UrZjRZOG0rUEhLSHB2aklC?=
 =?utf-8?B?ZWJUZC96aU1CbDNJcFI5ek0zckFkdml3aEFJNjlFQVNZUjg1S1BzclNzUytu?=
 =?utf-8?B?SEJBSXdpUjZKcVI3dTgrUy9VaXBINHhwVjdER3hHRUlMOWtzWUNyQ3pwZHJZ?=
 =?utf-8?B?UHRUYmhwczFteTFNelluTEhiVDNXYnVNRnRGdGRNQkw0SC80M1cvY1IyWnlQ?=
 =?utf-8?B?QUdaRTJzbjc0OEQ0VTBOQWpYa2ZTbVBBTVUrek55c3JZSnA0NXpsY1E4dXJ1?=
 =?utf-8?B?bWpoLzY3SlhCaTRoQjFQK2YxY3Rzb0xYbkhHYllnWU9Rc00zOUtBNmN3Znd2?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ffb13b-597c-4897-1cb6-08ddd907f2b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:50:31.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPETFMtb2HdcsOustyMmvPp08XVkfJVuit3yb/eeZwHgNiFpiBT+8Y6wfBHDWXT8CYk8EzWtE+SIQuvDCOg1nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7028
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

On Mon, Aug 11, 2025 at 12:33:57PM -0600, Summers, Stuart wrote:
> On Fri, 2025-08-08 at 11:59 -0700, Matthew Brost wrote:
> > Using 2M pages in xe_migrate_vram has two benefits: we issue fewer
> > instructions per 2M copy (1 vs. 512), and the cache hit rate should
> > be
> > higher. This results in increased copy engine bandwidth, as shown by
> > benchmark IGTs.
> > 
> > Enable 2M pages by reserving PDEs in the migrate VM and using 2M
> > pages
> > in xe_migrate_vram if the DMA address order matches 2M.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Generally this makes sense to me. I have a couple of minor comments
> below, but I agree doing this on a 2M granularity seems preferable if
> the user is using larger page sizes. We could even add a 1G copy, but

Our copy chunk size is less than 1G (it’s ~8M), so there’s that. It’s
possible the target we’re copying is a ≥1G buffer with a ≥1G DMA map.
However, the ROI is much smaller in that case given our chunk size: we’d
issue ~4× the instructions/cache entries vs. 1×, compared to the 4K → 2M
case where it’s ~512× vs. 1×.

> this covers the most broad set of uses cases across platforms. I don't
> think we'll get that much more benefit out of the larger size.
> 

Yea, I think 2M we will (and I saw) real benefits of copy bandwidth and
I'm not sure if 1G would have measurable impact.  

> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 82
> > +++++++++++++++++++++++++++++++--
> >  1 file changed, 78 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index ac9f4d4988d2..9021aa3ac1e0 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -56,6 +56,13 @@ struct xe_migrate {
> >         u64 usm_batch_base_ofs;
> >         /** @cleared_mem_ofs: VM offset of @cleared_bo. */
> >         u64 cleared_mem_ofs;
> > +       /** @large_page_copy_ofs: VM offset of 2M pages used for
> > large copies */
> > +       u64 large_page_copy_ofs;
> > +       /**
> > +        * @large_page_copy_pdes: BO offset to writeout 2M pages
> > (PDEs) used for
> > +        * large copies
> > +        */
> > +       u64 large_page_copy_pdes;
> >         /**
> >          * @fence: dma-fence representing the last migration job
> > batch.
> >          * Protected by @job_mutex.
> > @@ -289,6 +296,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >                           (i + 1) * 8, u64, entry);
> >         }
> >  
> > +       /* Reserve 2M PDEs */
> > +       level = 1;
> > +       m->large_page_copy_ofs = NUM_PT_SLOTS << xe_pt_shift(level);
> 
> Can't we just re-use xe_migrate_vm_addr() and allow the range above
> NUM_PT_SLOTS?
>

I decided to it precalculate + save large_page_copy_ofs as its value
depends on what we assign to large_page_copy_pdes (i.e., the math of
both need to match).

> > +       m->large_page_copy_pdes = map_ofs + XE_PAGE_SIZE * level +
> > +               NUM_PT_SLOTS * 8;
> > +
> >         /* Set up a 1GiB NULL mapping at 255GiB offset. */
> >         level = 2;
> >         xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255
> > * 8, u64,
> > @@ -1740,6 +1753,40 @@ static u32 pte_update_cmd_size(u64 size)
> >         return num_dword;
> >  }
> >  
> > +static void build_large_pt_update_batch_sram(struct xe_migrate *m,
> > +                                            struct xe_bb *bb,
> > +                                            struct drm_pagemap_addr
> > *sram_addr,
> > +                                            u32 size)
> > +{
> > +       u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> > +       u32 ptes, i = 0, large_size = (0x1 << xe_pt_shift(1));
> > +
> > +       ptes = DIV_ROUND_UP(size, large_size);
> > +
> > +       bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(ptes);
> > +       bb->cs[bb->len++] = m->large_page_copy_pdes;
> 
> IMO we could combine this with the PTE version. I realize there are
> some slight differences, but if we, for instance, needed to change the
> PAT index for compression similar to what we're doing in some of the
> other batches in this file, we would then only have to do that in one
> place.
> 

Let me see what that looks like. It seems doable without to many if
statements.

Matt

> Not a blocker though.
> 
> Thanks,
> Stuart
> 
> > +       bb->cs[bb->len++] = 0;
> > +
> > +       while (ptes--) {
> > +               u64 addr = sram_addr[i].addr & ~(((u64)large_size) -
> > 1);
> > +
> > +               xe_tile_assert(m->tile, sram_addr[i].proto ==
> > +                              DRM_INTERCONNECT_SYSTEM);
> > +               xe_tile_assert(m->tile, PAGE_SIZE <<
> > sram_addr[i].order ==
> > +                              large_size);
> > +               xe_tile_assert(m->tile, addr);
> > +
> > +               addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> > +                                                        addr,
> > pat_index,
> > +                                                        1, false,
> > 0);
> > +
> > +               bb->cs[bb->len++] = lower_32_bits(addr);
> > +               bb->cs[bb->len++] = upper_32_bits(addr);
> > +
> > +               i += large_size / PAGE_SIZE;
> > +       }
> > +}
> > +
> >  static void build_pt_update_batch_sram(struct xe_migrate *m,
> >                                        struct xe_bb *bb, u32
> > pt_offset,
> >                                        struct drm_pagemap_addr
> > *sram_addr,
> > @@ -1777,6 +1824,22 @@ static void build_pt_update_batch_sram(struct
> > xe_migrate *m,
> >         }
> >  }
> >  
> > +static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr
> > *sram_addr,
> > +                                   unsigned long size)
> > +{
> > +       u32 large_size = (0x1 << xe_pt_shift(1));
> > +       unsigned long i;
> > +
> > +       for (i = 0; i < DIV_ROUND_UP(size, PAGE_SIZE); ++i) {
> > +               if (PAGE_SIZE << sram_addr[i].order != large_size)
> > +                       return false;
> > +
> > +               i += large_size / PAGE_SIZE;
> > +       }
> > +
> > +       return true;
> > +}
> > +
> >  enum xe_migrate_copy_dir {
> >         XE_MIGRATE_COPY_TO_VRAM,
> >         XE_MIGRATE_COPY_TO_SRAM,
> > @@ -1806,6 +1869,7 @@ static struct dma_fence *xe_migrate_vram(struct
> > xe_migrate *m,
> >                 PAGE_SIZE : 4;
> >         int err;
> >         unsigned long i, j;
> > +       bool use_pde = xe_migrate_vram_use_pde(sram_addr, len +
> > sram_offset);
> >  
> >         if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> >                         (sram_offset | vram_addr) &
> > XE_CACHELINE_MASK))
> > @@ -1840,16 +1904,26 @@ static struct dma_fence
> > *xe_migrate_vram(struct xe_migrate *m,
> >                 i += NR_PAGES(order);
> >         }
> >  
> > -       build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > -                                  sram_addr, len + sram_offset);
> > +       if (use_pde)
> > +               build_large_pt_update_batch_sram(m, bb, sram_addr,
> > +                                                len + sram_offset);
> > +       else
> > +               build_pt_update_batch_sram(m, bb, pt_slot *
> > XE_PAGE_SIZE,
> > +                                          sram_addr, len +
> > sram_offset);
> >  
> >         if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > -               src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +               if (use_pde)
> > +                       src_L0_ofs = m->large_page_copy_ofs +
> > sram_offset;
> > +               else
> > +                       src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> >                 dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> >  
> >         } else {
> >                 src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> > -               dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +               if (use_pde)
> > +                       dst_L0_ofs = m->large_page_copy_ofs +
> > sram_offset;
> > +               else
> > +                       dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> >         }
> >  
> >         bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> 
