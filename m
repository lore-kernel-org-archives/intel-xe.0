Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE674EC1122
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 19:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39B410E43E;
	Mon, 23 Feb 2026 19:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWxXKLrW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028D710E43E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 19:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771873922; x=1803409922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=blprb33EpHhVadqhWzKQijqz/RXqa7FBHkPKt/TlSIE=;
 b=GWxXKLrWUpjwE57Abnr5t0HoN54X1kk+4AGgaxnprKEcKujc/41ZagSk
 CgeKHRMpZMRz23Q6snZgvpY6L8DhUuwCfHP2vvga5ECuAud5WFJgva901
 0emZI6Wo84nAjJ3YDnex6Pzk8BQaZTIsooe8vJVNh4JXZASH4tp2/ylGt
 wusQiP5FqhWVndiPwHRf3orrWCqRqIVffgwmu4Uh/lDCLf4/e6SEYbi5D
 0OpzDd96CHLr3rOfZmfYhcr4vXJF8R77FXwVLv3GsKITt/EduJmrv0D15
 fn9MqLa8y/W7gde9RCrSHgSMgUuczhOdNX6tgoJiaA6HPb9ACxZrmi0wD Q==;
X-CSE-ConnectionGUID: uNtVKR7qQPC6PRbqRtU46A==
X-CSE-MsgGUID: c93je7ChTNqsr7IuctGFHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72943587"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72943587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:12:01 -0800
X-CSE-ConnectionGUID: iX5bxaFsR52x0UzbvKJSng==
X-CSE-MsgGUID: CNP0LmbdSvGGa4pGXA6UsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220214786"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:12:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:12:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 11:12:00 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:12:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY8HVNoTFGTHQQyVkuGhDjnrgSN/phGEKLRRe0LijvGfQV0OM6LdxLL17kC7K5JjN3el+e+Zgh81KuxA42pqSx4gu2an2SOj2Zb4sNPS355gmZ6EFZlhTpMd/y1xz6Hgi16DNoq5XEhwlXr0H+LS9tUiFThpwtVbiF/iKHu0Wf+hVne3rae+MmORSPzFu210J/esFXuGklx606YC8YsudQbKX+6JhGyqAlalpXBWkkMmiADoSbCbys4c4F4IyX4hS+1dYl4TXEyZ6cWALtVhAwW4mDVZUY77vXdnXK8Wp4+vsoz7IWH7C1+Gtzgx0cPc49VXME5z0o1u/7ri3/kkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blprb33EpHhVadqhWzKQijqz/RXqa7FBHkPKt/TlSIE=;
 b=S7u6FIAFy3dDj4Q3B4/F3URNcFP1UexXKOw+KE72zNSqn3N2AkUAy6YWCw+JrChA/9SXl6z2w1iIM1jag86LWEQe+NHo/X22pULzMABpj+eMeaffMPFPAudeGr84FWin4pKikUv4dhFcgRzROJn6oYumW4a2+C+IxeAGOENI8h+ke+Rd2FIRvjsc8jh44nnQgSCmic5UIjUW7MIxuhAbGrZ42XklHC/8FOZiq0/XN3K4JuEW1Lq/5CcTFj1Ts82M8cTY5PqfI0/tJRut6lX/A7eDwYeKS7UkZaT39hJ1iAomiSoKmqlMatoF7VgcszryTMfJQeKdVsSoHkHtHfu54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:11:58 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:11:58 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 17/23] drm/xe: Consolidate workaround entries for
 Wa_14019386621
Thread-Topic: [PATCH v2 17/23] drm/xe: Consolidate workaround entries for
 Wa_14019386621
Thread-Index: AQHcoo5wF6P00cj7XU+BXvSKIuOHR7WQqpWA
Date: Mon, 23 Feb 2026 19:11:58 +0000
Message-ID: <DM4PR11MB54567ABE9E7DD032B2C5B2BDEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-17-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-17-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB6425:EE_
x-ms-office365-filtering-correlation-id: f2c052e2-8e48-4146-219d-08de730f6a83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T2lUQTBxYTRBNXdvTEJtVnpqV21WRG1ZR3BZS2w4UGdmNWJKOHNjcWRoRGZH?=
 =?utf-8?B?dVFxa216RnFmRGhPdWk3YlJRYVI3VEw4Q2gwbVJlbDRwaGNaMDBjUlhJaFY4?=
 =?utf-8?B?TzlmTXFBZnYxSU4zUzNQN0drZURScHVPT3FpdHBzbHh1VnZKOC9qRUlGbWw5?=
 =?utf-8?B?ZVBtUmhhdE1aU3h1ZEpNYldYbjdmdDFRR1R6aGpQSnROZzZ2Y2lmVUdIZklJ?=
 =?utf-8?B?Y04vb244U0xxckluTCtINDdSWnFHWEJtWm00czVZdHhzZHdaM2s3b280VmFx?=
 =?utf-8?B?M29kZUtHSnJzenlXVjlHMFdYSFNaRkZWeXJZTWNyNE5tRGhpdWRQL0hjbHVl?=
 =?utf-8?B?NVd3aEwzMUFuZTRITFVjajk1THlUTGpxT1VLWlhTdDZSZFo1NExPY1RtWlRT?=
 =?utf-8?B?ZEhVeWcxbThCYnkrRktGL1h6VVl4dGJaT0EvamxYZWpOSlc4S2Nlalh0T2cr?=
 =?utf-8?B?eTdXSkRBdWZIY0FwYTM3c2FsNDYvc05qbER0SUZBK1E5VkJkZkhyQjZxRFBM?=
 =?utf-8?B?ODdBa0t4MHFJdHVpUzd1eTVzb1dlNnRMcEl1WXdSajVxbWJ1cU42R0orek9J?=
 =?utf-8?B?QW0xVjRtL0sza1phMTZuQkpkbzhwVTVWTVMxbWxHSmp5RVZtNEdkL0p2Zjgx?=
 =?utf-8?B?OXZ2UTFLNGZUejVSd25DZzQ4d1VGMy9BMW1OL1BsSnJLdk5pazVqZTNTdE90?=
 =?utf-8?B?ZStKK1hLbXlqams1ek8rYmFia1pGeHJNYlltUHhocjJaRjVxQ3kvMFB3SWlB?=
 =?utf-8?B?TUVGOU4vSTUwcXFyRVRLQU1vcGdNN3Fpb3NRckMxdWpaajdxellwYXZmL3dz?=
 =?utf-8?B?aFNWc2U1UEpMdUh6TVZKRnRBM0NOelptZDBUM2Y5aElKclZzQisrdmFwSDIv?=
 =?utf-8?B?bFJjVkJJblVNaUlsbzQxalc4MHlYcVA1SkxmTmcyZkYxWFpQc2FPQ2dGeEdF?=
 =?utf-8?B?UVczRUVZWFJPODYwM2NsTDM4N3RNdE5TeVB6S3dzSVZ5T1MzOE4vVmZSL3BR?=
 =?utf-8?B?Lys2ZE4raWw2d2tQTWpPOTF6ZWYxdGxWU1llSkliUVphM1haSWVkd1YxeUo4?=
 =?utf-8?B?NVVlbTkzdm1ZUWVFeEs1dlozUXdDeG9sakJOMHVnYlhEUjZueHNnTE9mUVdM?=
 =?utf-8?B?VHp5dkFRKy9SUTV6bUwvamZXcnUrenVNSlhuaWdzMWlGTDlLZ3MzSE1BTDNx?=
 =?utf-8?B?MG9aYlRINk9tSUxVUVRUbjNLUjN2WlEweHhhOE51VmR6MnlibUthUHpPbVly?=
 =?utf-8?B?d2hVZ2tHQWVoZWRtS2p2N1VxZlMwTjdEYUdrVmxERzFycUxTc3BWeWpMVHBO?=
 =?utf-8?B?cXdSdkY0ZXBPMzJ6OWdtZVRYc0ZybmFQZUV6bGJFT1RyNGgrbkplMlMreFJM?=
 =?utf-8?B?NlZJSTJrR1cvY3hGeTRaV0orc0N1UFdGRExTK3RSU1QxVlNoblo5NU5wOG83?=
 =?utf-8?B?anYzSWJzdTBqeFZ1UW1EYjJYbzVuQTNWSEppL2tFRHduMXhRMkpLMFc2TitV?=
 =?utf-8?B?ZmY2OWhxUEYwQlRRa3gxTXF2Tkk2RDExZC9ibGZGbjJ0dFlzU3YrVXpSM25o?=
 =?utf-8?B?di9HMXJzbm9rRk1QNy9zZjVQbzNvbk5VaElkT0c1L1FiV0VaZ3BKMDA0SG5G?=
 =?utf-8?B?VllvQTFPMXp4ZStCRFdjd2t5SVV6SkpPU2dobjZCOVNiQmFBV2JLNzA3ZnNj?=
 =?utf-8?B?MzVtamNNc0RaNFV2NE40L3dmZEtlUkJOUXlRN0hkV1g5cVlpc2lPQzM2eDdL?=
 =?utf-8?B?Uzc2RzFnUWFmZ3VvMy9nU3FvZnVFZjZPQ0Y4Z3c2NE5ucGZWWnBpTzh3NFV6?=
 =?utf-8?B?RURyelFJNGY3N3pKZ0w0NEtialNZd3hRa2l1elIyMU1mRzdsSXo2ajhTTE5D?=
 =?utf-8?B?MGczc2xwR2wrM1JIK25CQ1l5OEY1bTFGWUxvYjltcnZuK0N3QVNSVHllc1o4?=
 =?utf-8?B?SjE5RHBia3R4bE40VHIwVEVyeU5tY095OXVSQmJLZkRTQ21jV2luTkMrdXh2?=
 =?utf-8?B?SmFjTDFNeWhNb0hCN25yMzVGajZDZHlHSDE1dU4rbXVicnJmdHlya1pFMENG?=
 =?utf-8?B?L3JFdHQ1QnUyalBPekpFRy9sdHh0RjBSVXN4cXBqVURqVFMreHBWa3E0SlRp?=
 =?utf-8?B?Z1YrbDczZ1Z1TjdjWDJQZDBxb2ZOZ1NlMUF3MXdtbHZDYVVKSTN5NUFyRDBE?=
 =?utf-8?Q?pEmVZC+RmdovWskwg1SCdd4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWt3ekZseU1lb282amswMnREbGs3c3BRSmd6RVV5UXFsUUZZOEo1RFIxZUtu?=
 =?utf-8?B?NkNvTFliWGlza2hVZWwwNnFjeG16ajNNZ1N5eTNsMUc3a0daRXl2OEN5VEFL?=
 =?utf-8?B?d3creEhPelM2NGFsamRpWnk0UkdKUUpsSzRFUmlOR1IxRkdEaVprbnp0Y1Qy?=
 =?utf-8?B?NzlrYnp6ZWN0YUczeE1maHNHSW01V2MvWHBCdElwam94M0VQRVIxdjNSWWxQ?=
 =?utf-8?B?K3l3dVdYblJmRytRUEYyYURMM1JSU0FwUTFQRlZiRHB5cjhLcXRLU3pVMUV0?=
 =?utf-8?B?UDhQYnU0K3I0a29VU2YyQjBOT2txZDYyR3NyL2dTeXRuRTFtdmNWVHVSd0Zr?=
 =?utf-8?B?ekpCK0ZOUGVyVGxvenBuSWN4MzdPclRDUW5jVXc5QU8rS1pRMnM5ZVRLNEd6?=
 =?utf-8?B?TDI3OGZRbkhHYkxGRURSRWdpWjBlWEFJeEdMT1BNUUFTdHhORXV0WFVidkJZ?=
 =?utf-8?B?ak9rK1d1N2VKc2F5ck1YSENQb1dyUlVjVDdrME9HOHZoOUhNcmZVaktjMitR?=
 =?utf-8?B?RnkwWE45eGdndW1BUlIrWHpJVURBRnNMU1FhMDR6d21tV1ZJZlpyRVNOelda?=
 =?utf-8?B?QlhIZkNjcUFNd3RmN0pqcnhISFRTbHhpc2NxVkp4TlAvWnhYS2hsMmlFQzNj?=
 =?utf-8?B?c0VyNWlyelJFWVcxT2FZeEtvTERXVzNCRHo3MHUyYUxRL0FJNU10U2NxWmQw?=
 =?utf-8?B?TGVpODZLdHJWNWhmejlrUDhkWjZCMGxyb2tyOXQ1TGp6NkZra3FZaEdrb2dv?=
 =?utf-8?B?Uy9LWU1TSHhkVkNwS0xyV0hiUlMxVmd2OVQzb1R1a0J3V1MzMWZ2VUVoSDAy?=
 =?utf-8?B?K0dQNC9tS0tldHNEZnVRUndrWkN5SG43YXJWb0l6QlZScXBBYTJkSm5oS3RN?=
 =?utf-8?B?bGRHWTVqUWk5ZVdzTk1TM3ZqN3UyZ0ZpbUYrOTRSSGc4WmFrT3U1QzRNbTBN?=
 =?utf-8?B?OFBwS2oxU00rbkR5N0ZjQ3VTR20rWXpIcGl6ZUlNZEI1ZkIrMzRMQVYvUlpB?=
 =?utf-8?B?eEczSVZCZHZ5R043OHNjVWh3RFNvUUxOQkhjYnFUSG1JSVlaSVVLdzIwM2FS?=
 =?utf-8?B?YnRqR29CcWhOT01VaS9vVkxoOHA2dnUzWVVQaHFKVitvR3JnT1FRb0FzVkZ0?=
 =?utf-8?B?WWg2djNsK0lwQ3daNGF6dnN2NXJ4U3hUSDdvNzdpbU5CN3F6L1BlN3ZNdjN4?=
 =?utf-8?B?UGJQdndPUmZncCtFNmh2V2pQZnpPOTdVVUs1enlVNU5tL2gwaUhXOE5vcElv?=
 =?utf-8?B?ak15aFJFZlorVndaVGxGOEMrVEYzY3FLUWJCcjE4cGllSjlHV2dXcGtFbHpn?=
 =?utf-8?B?aGVLZ1NSQjNLc1I2MHA4YjcxZkoyTnhNRWZyYmt2dW1qNndibjRHaERqNXdW?=
 =?utf-8?B?dEZlUGRZT3owRUQ2SDE2Qk9na1pJTzAxUUZ3bjdIMXFXbXZVVEdIMlp0Tm1a?=
 =?utf-8?B?THF6K3dIYS9GYUQ3ZnV5KzJBVCtRaGFTMDJDRHAwMGRaa1RXQmN4clJTY1hk?=
 =?utf-8?B?YWdmV3gxNWtVZTl2d0YrK0dBTURpTkl5NUl3L3lMcDE4SG5OeEFrQXlvbnlz?=
 =?utf-8?B?YVlGaEI3YmtOa3FaT1RCOXpJRS9xYVZ5NTdBb3BsWHJFVVMxNW0ydnVBQnIz?=
 =?utf-8?B?Rk9nVUViZE9Vdm5nV1NLTFBRV3UwbEorTENiMytyemQ4alRMeGNmT1BNSG05?=
 =?utf-8?B?K29Ed0YybXd1enZqR2I4NUluMklPS0V0WGpIbFZHOGhWend3Q3UwR3huN3g5?=
 =?utf-8?B?K0FWN2o5QnpMN0t0MUtBU2JIUXlrN0dQNk1wSmdSVkZCWTN5OWRrcWZuZlM2?=
 =?utf-8?B?L2REeGo0Z3lHRFYwZ0FJMVpZdXdMR1h1RVpYQVBJQlNMUEd6Z2pDSVFuUkVu?=
 =?utf-8?B?aDI1Q2lidGVVeUNjNVhUSnpUMHZ5cGQyMFFPazNkb0IvT1hKclZSVkg2QWNN?=
 =?utf-8?B?Y0ZVaXBNMysxSTJjUmVmL3BGY0xTc2JNckZKZERNSDhSRVpsQnRKTmkwaUxL?=
 =?utf-8?B?R01FVkVnR2M2TXd0eWhoeXNneHBabHJISnRUQ29XWXRxQjNTS0l5akl5aXA4?=
 =?utf-8?B?em5oTHk3VTdsTzQxUTczSVdHR2RWcDZmQXc3MGtMSmdLR01QNVAvSDRWRllw?=
 =?utf-8?B?NEpPNUZ4dHZSVVdQbjF4bW42bWJFVk0vRmRGZzJGNTk0cTgwQVpTbzVFSGVC?=
 =?utf-8?B?RVArQkFwTTkxMEF6eUNEQjRUd01XMTFMa0hETUpIaHNrQVIzZ1JrNkpLQ01Z?=
 =?utf-8?B?Y1N4TXpJRkl2bE1Lcjl0U0pWcjlKcHZ0NmJPdGtxS0orK2NGdytvU3NuN1M0?=
 =?utf-8?B?alpDeHNRL3NuUHJHKzdQNEh2K2NxVXByeGVKZ3EvWVlBbnczTytHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c052e2-8e48-4146-219d-08de730f6a83
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 19:11:58.1774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcKO6bggaT3VEEmyAo/mI+Oy9P6D6xZrzsB/QEDheVj0iX3LwAwQ5iP2vE/DPIrvgdqInEUtLSdhexb2sfmqsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xNDAx
OTM4NjYyMSBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDIwLjAxIHRocm91
Z2ggMjAuMDQNCj4gKGluY2x1c2l2ZSkuICBDb25zb2xpZGF0ZSB0aGUgUlRQIGVudHJpZXMgaW50
byBhIHNpbmdsZSByYW5nZS1iYXNlZCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQg
Um9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTog
U2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDEyICsrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGlu
ZGV4DQo+IDIxYWY5OTc0NDdlNzg5NTFkZDZkNDBjODc0NTRlOGVmNjkzNDMwMDYuLjAzYmVmMTEz
NzBhZTU4OWQxMDM1DQo+IGNmMmNiN2IwMjJmZDE3M2QzN2I1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Eu
Yw0KPiBAQCAtNjQxLDYgKzY0MSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRy
eV9zciBscmNfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9S
QU5HRSgxMjU1LCAyMDA0KSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAgCSAgWEVfUlRQ
X0FDVElPTlMoU0VUKFhFSFBfUFNTX0NISUNLRU4sIEZEX0VORF9DT0xMRUNUKSkNCj4gIAl9LA0K
PiArCXsgWEVfUlRQX05BTUUoIjE0MDE5Mzg2NjIxIiksDQo+ICsJICBYRV9SVFBfUlVMRVMoR1JB
UEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCAyMDA0KSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikp
LA0KPiArCSAgWEVfUlRQX0FDVElPTlMoU0VUKFZGX1NDUkFUQ0hQQUQsDQo+IFhFMl9WRkdfVEVE
X0NSRURJVF9JTlRFUkZBQ0VfRElTQUJMRSkpDQo+ICsJfSwNCj4gDQo+ICAJLyogREcxICovDQo+
IA0KPiBAQCAtNjk3LDEwICs3MDEsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRy
eV9zciBscmNfd2FzW10gPSB7DQo+IA0KPiAgCS8qIFhlMl9MUEcgKi8NCj4gDQo+IC0JeyBYRV9S
VFBfTkFNRSgiMTQwMTkzODY2MjEiKSwNCj4gLQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJT
SU9OKDIwMDQpLA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVSKSksDQo+IC0JICBYRV9SVFBfQUNUSU9O
UyhTRVQoVkZfU0NSQVRDSFBBRCwNCj4gWEUyX1ZGR19URURfQ1JFRElUX0lOVEVSRkFDRV9ESVNB
QkxFKSkNCj4gLQl9LA0KPiAgCXsgWEVfUlRQX05BTUUoIjE0MDE5OTg4OTA2IiksDQo+ICAJICBY
RV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTigyMDA0KSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRF
UikpLA0KPiAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKFhFSFBfUFNTX0NISUNLRU4sIEZMU0hfSUdO
T1JFU19QU0QpKQ0KPiBAQCAtNzM4LDEwICs3MzgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhl
X3J0cF9lbnRyeV9zciBscmNfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1Nf
VkVSU0lPTigyMDAxKSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAgCSAgWEVfUlRQX0FD
VElPTlMoU0VUKENISUNLRU5fUkFTVEVSXzEsDQo+IERJU19TRl9ST1VORF9ORUFSRVNUX0VWRU4p
KQ0KPiAgCX0sDQo+IC0JeyBYRV9SVFBfTkFNRSgiMTQwMTkzODY2MjEiKSwNCj4gLQkgIFhFX1JU
UF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsIDIwMDIpLA0KPiBFTkdJTkVfQ0xB
U1MoUkVOREVSKSksDQo+IC0JICBYRV9SVFBfQUNUSU9OUyhTRVQoVkZfU0NSQVRDSFBBRCwNCj4g
WEUyX1ZGR19URURfQ1JFRElUX0lOVEVSRkFDRV9ESVNBQkxFKSkNCj4gLQl9LA0KPiAgCXsgWEVf
UlRQX05BTUUoIjE0MDIwNzU2NTk5IiksDQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVS
U0lPTigyMDAxKSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAgCSAgWEVfUlRQX0FDVElP
TlMoU0VUKFdNX0NISUNLRU4zLA0KPiBISVpfUExBTkVfQ09NUFJFU1NJT05fRElTKSkNCj4gDQo+
IC0tDQo+IDIuNTMuMA0KDQo=
