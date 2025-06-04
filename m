Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6B8C5AD49
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CBE10E236;
	Wed,  4 Jun 2025 00:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OR0KgxzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781F510E236
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 00:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748996238; x=1780532238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xqtYgGRvjaTdsrj2TdlsolAUMJaX5JIRNkvyYaWok+Q=;
 b=OR0KgxzLpn+FEt7mfi7215R0G3onxMHB8XRmyFSCnHgee2Zlou78Ykp8
 9GJAO1VZ2NlR5JCmfnKRS3FbdtaMMZOxLsOA+qtKJuPHrYD37jzgqlaGt
 S5qNq++yuP/tEUOp4zxxH+xSwdZVAW84ULWn/5Oy6JaNFFJjC9Rsr9nz7
 VdDTv6601/wodEOJUnvoYrmD1n+8jvx4IqaLcfkzo+qLHkFDe8Q/DIe+B
 y7g4N4lnYkNJnpurGVQDbkSQKf032psDmWoJpscp3+kNVZLFfwIHvJdq9
 0O2ZEEzBZt7w1MkzPTFCUB4iCLa/TRf2Fr6pAXmThB6puz3UFspNQo2lD A==;
X-CSE-ConnectionGUID: jizIdCZpT9KWt8NeFII1uw==
X-CSE-MsgGUID: xrThj1pDQpOANSfdPDmjxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68493723"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="68493723"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:17:18 -0700
X-CSE-ConnectionGUID: 5V3OdlDrTuG4Ucvy0zD/XA==
X-CSE-MsgGUID: pKhZwaM0S+SBvVbE2za+4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145033526"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:17:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 17:17:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 17:17:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 17:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpoUL7YQ46jGiC+pkfiN94bc2OtXxIQM9B7gFTs0jj0o768rYu7N64JYvMW6jVq/mhVlezGsAGOWq5eF1I+goqp//JiabTaKBu0oI9aYCQ2TuNvz2DRt9P9t6MLnbDfMjdkk1NcO6o6M7k6QMwUbvme78EwKhNglAvmQGWroOUH9HsZrYiVsAKaoQYBGZmAjgZwb4RrGAQxPX/6Z6uygZtzX0dsf4wU4y0iPS82YS/HRLCgZG2WaMnTYWWo+s6HBY0WoAgrx+wQuGV1N4pt5d0A/9RN2/vzqbh8S+tNRz/pIZIEGnaHyw2S5v/soPsc4vol97VH/iWrEA1AdD/7m4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqtYgGRvjaTdsrj2TdlsolAUMJaX5JIRNkvyYaWok+Q=;
 b=LGAJ0UF4QRW1SLtI+Z3fFyiPK08txP+HQpUt0w5afW3eXStRg+3kpN+cEutM8TOoRnHUspFWN3J8PHdPJY5GKHnCinja+2M+Lht8Gezt3mbMmWYLZxuUniNYwgNgQe8kHA5GEI/l/UEWi5bZPXo5XNdg1Ci5xmC68PJrA2xz2lUzE/RLUbsK3LZjDfYphaPN+yTmLsGpv7Wk2JV8OshIzbVOhXaXBEXZbBQ/kc3xnhgFT919LsifrnphJTjor8qMBVIS4CelltboQIrz9ji6ue96OsYOP2pf25yz/D4dLkRX8l1yJj8R6IIIkhtTfpK9Ad3BYxrDACBqcQCegp6wWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH0PR11MB8236.namprd11.prod.outlook.com (2603:10b6:610:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 00:16:34 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 00:16:34 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Promote struct xe_mmio definition to own file
Thread-Topic: [PATCH 2/4] drm/xe: Promote struct xe_mmio definition to own file
Thread-Index: AQHb1MYn6kbYEIL1K0WehA6i+fgB2bPyIkwA
Date: Wed, 4 Jun 2025 00:16:34 +0000
Message-ID: <c4cc7c13fef1385b4f030dd7830a80e541931cdb.camel@intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
 <20250603202826.681-3-michal.wajdeczko@intel.com>
In-Reply-To: <20250603202826.681-3-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH0PR11MB8236:EE_
x-ms-office365-filtering-correlation-id: 7ca5c4d7-dec8-4bf8-2d91-08dda2fd10c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MytoTko1MlNyWXp4dFNhWGh4bmk2cWJHUldSOXhDWXFBVWFvaHExK2kya1ph?=
 =?utf-8?B?L3Ywc0lvaTBkd3VJK2t2a3p4S3ArMG9GT1JFYWxjUDRDMUZNSTR2WmlVYStO?=
 =?utf-8?B?cjdwUm9rUFk2WVZxaE5rMmlHeWJhVTQ5UHB0eUluNnVvWmZYbXdLbzJsN3Uw?=
 =?utf-8?B?Z3ZudkRVMFcyUXVhN2d4bndQZVFLaUhQWjNYaGYrenJndzBEaDRMS3ZRSnVi?=
 =?utf-8?B?bFg1Tk9CRFBaNzBRNDQvSm9LZDFsWFgxVFpRaVpERmU3bHlta0JoUXB1QzhO?=
 =?utf-8?B?RWxDTDVWOEdNZ1RQTGFneFMxaWF1aTBwR0ZUcnB2RnpRSUVKTXVPVXZVN2tY?=
 =?utf-8?B?S1BYbDlBRXkxdVBmRFROMXJ4RjRZL2tsNXBaTjBiK2R2NDI4MlRKbVQreGdM?=
 =?utf-8?B?ZGFIam9GSzU5dXRINDk0OWw3dEJxbHU4c0xwdGI1ZXhOczhyNG00MmNIb2VJ?=
 =?utf-8?B?UDVyYUhsM1dSS3QxR3VoTHFkRm5aMW1lQ1RpUUJiWnU2dDh4QUd6ZVA0RURm?=
 =?utf-8?B?NEwyWGdEaDVRZHVPckJOc1UzeDdoRUpDWFh4WThlNVhCTEp1U21OcXg4bHZ5?=
 =?utf-8?B?K2RUTWdzOFg1Wk9rZ092eG9DMzVpWGtvMmFGdDBVOWc4ZCtsVXpSZG1ZN2Nv?=
 =?utf-8?B?QXYzdWpqMVNoVHd6S0xiQ3p4MnVWQzJ3V1dPREpMWDVsOGdxa2Q1ckg2MVBP?=
 =?utf-8?B?Q1pWbjRUU0x5VzVRTGs4K0JwbnNwZlBUMnFBRUhlM2lYVlRTN1d2UTdFamRU?=
 =?utf-8?B?b1dVUWN5SUpRQi9velgxQmlwR1J3bUkrdnlIUk5Wby93UzRuSDJVZmhCaVA3?=
 =?utf-8?B?bC96UEdUWDc0OW5lZUROMERaUk5KeXpXZ2xnRHY0NE1Td1B2RFUrd3Yxelhx?=
 =?utf-8?B?SjNHOWFKbFRCTVpVWHUyQUc3UzVPV3RERjE2Smx5RVRDcG02SWVIRTRZTHNx?=
 =?utf-8?B?a3N6VjdjYms0UkpzTEErdEs5VEdMaVdtVEVPMHQzSWt2SllNNXBOdmc0S2p6?=
 =?utf-8?B?YkFyOSt4YzdoZ01nc2NtYzY4YW5qMFd5dzVFNmNmSTRVV21TVU5STEtpcE9D?=
 =?utf-8?B?TGpvd0NnRHJSa3QveHA4K0x6ejJLSGNFeWJ3Sk5wRjlab2oyWnlpNmJ5Nk94?=
 =?utf-8?B?R2YwVm1DdGJ6VUR3WVhxNXlPTTYrZDJwZjN1OVVsU2M5YVdaSTEyR29RWWtO?=
 =?utf-8?B?eXdsQzFSbk5ZUENQeVA0dEQyNzlpSEdaU0lzQ0Z0aDR1QmJMcVBWSmFnNWlj?=
 =?utf-8?B?ZER6ZlYzUTZEUmpiaTJnbCtOeW5Ua2hvSElLUjV3K3ZTd3FjMklxMFkvczc5?=
 =?utf-8?B?MkVVVFhUNXhtbVo0TjJOS2I5RzIyVmQyTXowVzl1VUkyallubXBjYW03d1or?=
 =?utf-8?B?NGI1U29wZ0ZTbFZ2RmdsT2tPaDBBZXFiQmFEbUhJR0x0dUZJdStsUWpZYVI5?=
 =?utf-8?B?NXJQb3VnOE5TUWUzaGhzeDIrRnd2dmI1cVh4c2N1QzhleS84SjVDNWtHVU9X?=
 =?utf-8?B?bkhlL3FqRkxHRDkrR0o3bmE1aFlObVdUQVQ0d3FQUDhuVmRiUGlsNG1Gd1ZF?=
 =?utf-8?B?UDBNRUR0TUxmSkc3QXpCUmo3K0FYVXk3dkZsWkpqbTUrSFBXOURUdmN4bW1w?=
 =?utf-8?B?Wk1Tb3Nua2lBdUJXSytHa0UrdWhEMTZHdGJwVWtUdkF2TVptYXVWV1Zoc1BM?=
 =?utf-8?B?b2VPaFNiTUIrNmt4Nm51WTdkRGNiazVuTFRVZXZjTGxjbTlmdTYrY1Rtb3l4?=
 =?utf-8?B?RXpYaUdRSU16NGcwWUd0c0NpeWg5RjY0QnhDL1NWNWN0UHRPVkJqMWZDYWx1?=
 =?utf-8?B?UFhQbmsrSFJCdHZaRjU1VkVJelY5SklmUXNUQkduek8zMjVUczB2V1NNK0Rv?=
 =?utf-8?B?SW1RYS9BRnNuUlZpaWdBcFNjb0Yzdk8wQkFEZTRLSU5LQmlhdmUzaWkyVEtl?=
 =?utf-8?B?Q0pvbS9TY0VZUXFWdTMwV1o3ZHR0cVF5dFJqd3doTTdZU0NhZXlIbDJBVk1j?=
 =?utf-8?B?SFEzQ0FXbEFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXZQWlNuSDFEMWRRa21Jc0pnalU5YXpPSUJEL3kxRmJjRXhyb0JpQU52QkE0?=
 =?utf-8?B?QWZxMkc5cGpPSzdQRVdtb1ZzK05tRDVJM2xYZVZqSnRmRnFENi9RTDVIY21B?=
 =?utf-8?B?UzY1Y2tYTUMwVXZqd2E4MHNmVXgyQ1F6NlJQaWZLRVRmWTV6YjZhNmJGZEp0?=
 =?utf-8?B?VytRVXF5S3JSb09YS1ppVnorZWdFN3VFeE1pMEJmTlZ3bnQ3bXgyVHdIa0tq?=
 =?utf-8?B?MDlDS1VQNzJzNzYvWFV5V0lVOWxEUTZhaVdMeWZkMGI5d0dsa0FrMWRBRDJQ?=
 =?utf-8?B?TVNyVG45VDJDbFFIMXZJTk4vM2NqRCtQQUFiWXBGYnMvbFVDT0dSN1lHU2l5?=
 =?utf-8?B?S0hhdSt3czFrOURlV2RCOG9vVm5NWVJNSlRIOC9ETmw3TXhEWmI0amY1em11?=
 =?utf-8?B?UGhCMDcvKy9BTDRCbzVsZlo1My84TXkrWnJ1ZVlmL0NsTXRGUEcrdDRFdnZs?=
 =?utf-8?B?MXdCd1o5TkJaSDNQM2dHMmVXaUNjQ1o1RncwZ2NjelhyaVNPUVJTc3kxdDBh?=
 =?utf-8?B?MGRJU1NnMzI1cWFkNHhwS3NsYkFvc2FGMVdUa3B1ejJHMDc1bnNQMkJyYmc5?=
 =?utf-8?B?L1JvWjI5eEVyWE80MUpyYmpONmZMWEdzQVhabmpibktZZnAxL2xVQXVwTS9D?=
 =?utf-8?B?T0x4KyswaGlFRFlXSnVNV1dRY0tMMlQ5Q1IrdERRZ3QrNjltckY4aDhsZjJt?=
 =?utf-8?B?cDJRYklxSDFnN2czcHI5bUplZVRRRzk0dVhyUStidHFRZm5hVEhyS1ZLSGJY?=
 =?utf-8?B?WHVnNW4rbW1SMXh4cGg0bDZ5QkZhdHRoem5XNnZqU2dvenlKWVRIVEhJWVhu?=
 =?utf-8?B?VlVpaG4rSlBUQ0ZJUk0xYUFSU09JWmZ5MEV2TzFYY21HR3JWai9iSml2T3Uy?=
 =?utf-8?B?aUVRT21LcDE1a0lvNUtLVzByd2lZUGxEYzlIcHd1QUtsK1drdFNFWFUzRHBo?=
 =?utf-8?B?ZklxV2x5Ri8vNG1ZWldjVElPVkxPWjVSbzNtMXRFVVRtR3d2Yk9jTXM5RHpa?=
 =?utf-8?B?VFZTZ1hVeWIvNkJWWlZDdDA0TWRuRlZlWWljS0FIM3hhQzI3NlJVd0o4MXBz?=
 =?utf-8?B?TVdMaytPWktPQ3hrU284d3NkRE1vMGZlT2E5eXY1dmhVNjhuWTZuY1B1czBy?=
 =?utf-8?B?ZzlONytmQnd2UUswNldta3NpR3A0Z0hBNnF4RTNhK2pxV0llNm9TMHhOcXJ0?=
 =?utf-8?B?Qk9Kb0JLb1JLU0d0Y2x0a3dvdUlpakVINDRHREc4V2gyeXlFb29mZldpNG9H?=
 =?utf-8?B?MlpKNzc1T0VzWE1FWVE5ME9pSnU0STY2N1RvbXNwekw1K3hZTEROZFU1MFlH?=
 =?utf-8?B?Q0tnV1hTUWRTQ0hReXZob25MMGNoZXZHZkZ3WVR4bER5UmtyYk1RSXdMckds?=
 =?utf-8?B?cUlTeFVKUXoraWtOTncxQ3lFQmpKUFhsejB1cXdycmwzOCtSTGp0RDVYTG9O?=
 =?utf-8?B?N2ZMOVVhcnc2SXBud2F1Qk9CZmZrdDZPeEl3Uk9YL1VEamxSTnUrZ01FeHdp?=
 =?utf-8?B?a1BXUkdsbVZjelcxRzFudHFoMDJ0UnNXM3VCSXhzcmNWa1U1QVovTkc0aDdW?=
 =?utf-8?B?SWFjaXFXem4vUlNqYUFWc2lVbmZjSXNteFBjMitLSXdENW9NT0ZHVCtmL2Z3?=
 =?utf-8?B?OXNkbUtIZnlxMTRVT2lDUG9aUEh6MjY2SlpLOERYQ0o2MC9wbFd4WERUbTZl?=
 =?utf-8?B?eWpUOUJydWFIUThacVo3ZHVxcjBIYW9DalcyRUxONHU0Y1BhcGRpUHFYK1lP?=
 =?utf-8?B?QUFPQVVFbitiMWtaNHFNSE10V1ZUZlFocVVBUS9zc091VENTQjluR2Q5d28r?=
 =?utf-8?B?OG9oU1kxcGZFMDFnT3ZWRElCeSt4YjQzNkFZWmlENlBQbElGMjhYbk9MdVRl?=
 =?utf-8?B?azZnNDhRaWFtZXlLbkJTSFZtcU9ENHdPb1YzdWJhUXN6VFVIL20vcHZvbFJY?=
 =?utf-8?B?QXliVFhxT3c3UTVUWHo1RTltYm1HTGp2QW9oQUZSQy9xU3pCWnpQdGc0L2p6?=
 =?utf-8?B?Unh0aFRreEo5RE1VMWQwRUhVVkxFajhxb0lRV05LdHZKR0RxeWJYSE1IeVJm?=
 =?utf-8?B?N0FyRTJCUjloNWdyZXRPNW93OG5pNXZPMXE3aDVwR1NFVnpIK3Q3REJMdzBG?=
 =?utf-8?B?WmZNTjRJb01IUTZtcHRDUlRGWk5zazFHaUZKZ3JEcnUzVExiSUg4c2xORm5n?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1462CBCD13FC4E42B9755F5E775EE388@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca5c4d7-dec8-4bf8-2d91-08dda2fd10c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 00:16:34.7896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2kW0lrGfvLjkZpoZh2gPw45R2nBhVG7RnqgOo2noa5+ic8z7drGTaiq7qLid2uk5tUd28B7xZcxVchOkPMsJf+sN7Bya9kisEyN/59gqVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8236
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

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDIyOjI4ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBXZSBhbHJlYWR5IGhhdmUgc2VwYXJhdGUgLmMgYW5kIC5oIGZpbGVzIGZvciB4ZV9tbWlv
IGZ1bmN0aW9ucywNCj4gdGltZSB0byBpbnRyb2R1Y2UgX3R5cGVzLmggdG8gZm9sbG93IHdoYXQg
b3RoZXIgY29tcG9uZW50cyBkby4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXYWpkZWN6
a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBDYzogTHVjYXMgRGUgTWFyY2hpIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9w
ZXJAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1t
ZXJzQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
X3R5cGVzLmggfCA0MCArLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfbW1pby5owqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9tbWlvX3R5cGVzLmjCoMKgIHwgNTMNCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25z
KC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvX3R5
cGVzLmgNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5
cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gaW5kZXgg
YjkzYzA0NDY2NjM3Li44MzFkZDg4YTRjNTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlX3R5cGVzLmgNCj4gQEAgLTE3LDYgKzE3LDcgQEANCj4gwqAjaW5jbHVkZSAieGVfaGVjaV9n
c2MuaCINCj4gwqAjaW5jbHVkZSAieGVfbG10dF90eXBlcy5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9t
ZW1pcnFfdHlwZXMuaCINCj4gKyNpbmNsdWRlICJ4ZV9tbWlvX3R5cGVzLmgiDQo+IMKgI2luY2x1
ZGUgInhlX29hX3R5cGVzLmgiDQo+IMKgI2luY2x1ZGUgInhlX3BsYXRmb3JtX3R5cGVzLmgiDQo+
IMKgI2luY2x1ZGUgInhlX3BtdV90eXBlcy5oIg0KPiBAQCAtMTIxLDQ1ICsxMjIsNiBAQCBzdHJ1
Y3QgeGVfdnJhbV9yZWdpb24gew0KPiDCoCNlbmRpZg0KPiDCoH07DQo+IMKgDQo+IC0vKioNCj4g
LSAqIHN0cnVjdCB4ZV9tbWlvIC0gcmVnaXN0ZXIgbW1pbyBzdHJ1Y3R1cmUNCj4gLSAqDQo+IC0g
KiBSZXByZXNlbnRzIGFuIE1NSU8gcmVnaW9uIHRoYXQgdGhlIENQVSBtYXkgdXNlIHRvIGFjY2Vz
cw0KPiByZWdpc3RlcnMuwqAgQQ0KPiAtICogcmVnaW9uIG1heSBzaGFyZSBpdHMgSU8gbWFwIHdp
dGggb3RoZXIgcmVnaW9ucyAoZS5nLiwgYWxsIEdUcw0KPiB3aXRoaW4gYQ0KPiAtICogdGlsZSBz
aGFyZSB0aGUgc2FtZSBtYXAgd2l0aCB0aGVpciBwYXJlbnQgdGlsZSwgYnV0IHJlcHJlc2VudA0K
PiBkaWZmZXJlbnQNCj4gLSAqIHN1YnJlZ2lvbnMgb2YgdGhlIG92ZXJhbGwgSU8gc3BhY2UpLg0K
PiAtICovDQo+IC1zdHJ1Y3QgeGVfbW1pbyB7DQo+IC3CoMKgwqDCoMKgwqDCoC8qKiBAdGlsZTog
QmFja3BvaW50ZXIgdG8gdGlsZSwgdXNlZCBmb3IgdHJhY2luZyAqLw0KPiAtwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgeGVfdGlsZSAqdGlsZTsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKgwqAvKiogQHJlZ3M6
IE1hcCB1c2VkIHRvIGFjY2VzcyByZWdpc3RlcnMuICovDQo+IC3CoMKgwqDCoMKgwqDCoHZvaWQg
X19pb21lbSAqcmVnczsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKgwqAvKioNCj4gLcKgwqDCoMKgwqDC
oMKgICogQHNyaW92X3ZmX2d0OiBCYWNrcG9pbnRlciB0byBHVC4NCj4gLcKgwqDCoMKgwqDCoMKg
ICoNCj4gLcKgwqDCoMKgwqDCoMKgICogVGhpcyBwb2ludGVyIGlzIG9ubHkgc2V0IGZvciBHVCBN
TUlPIHJlZ2lvbnMgYW5kIG9ubHkgd2hlbg0KPiBydW5uaW5nDQo+IC3CoMKgwqDCoMKgwqDCoCAq
IGFzIGFuIFNSSU9WIFZGIHN0cnVjdHVyZQ0KPiAtwqDCoMKgwqDCoMKgwqAgKi8NCj4gLcKgwqDC
oMKgwqDCoMKgc3RydWN0IHhlX2d0ICpzcmlvdl92Zl9ndDsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKg
wqAvKioNCj4gLcKgwqDCoMKgwqDCoMKgICogQHJlZ3Nfc2l6ZTogTGVuZ3RoIG9mIHRoZSByZWdp
c3RlciByZWdpb24gd2l0aGluIHRoZSBtYXAuDQo+IC3CoMKgwqDCoMKgwqDCoCAqDQo+IC3CoMKg
wqDCoMKgwqDCoCAqIFRoZSBzaXplIG9mIHRoZSBpb21hcCBzZXQgaW4gKnJlZ3MgaXMgZ2VuZXJh
bGx5IGxhcmdlcg0KPiB0aGFuIHRoZQ0KPiAtwqDCoMKgwqDCoMKgwqAgKiByZWdpc3RlciBtbWlv
IHNwYWNlIHNpbmNlIGl0IGluY2x1ZGVzIHVudXNlZCByZWdpb25zDQo+IGFuZC9vcg0KPiAtwqDC
oMKgwqDCoMKgwqAgKiBub24tcmVnaXN0ZXIgcmVnaW9ucyBzdWNoIGFzIHRoZSBHR1RUIFBURXMu
DQo+IC3CoMKgwqDCoMKgwqDCoCAqLw0KPiAtwqDCoMKgwqDCoMKgwqBzaXplX3QgcmVnc19zaXpl
Ow0KPiAtDQo+IC3CoMKgwqDCoMKgwqDCoC8qKiBAYWRqX2xpbWl0OiBhZGp1c3QgTU1JTyBhZGRy
ZXNzIGlmIGFkZHJlc3MgaXMgYmVsb3cgdGhpcw0KPiB2YWx1ZSAqLw0KPiAtwqDCoMKgwqDCoMKg
wqB1MzIgYWRqX2xpbWl0Ow0KPiAtDQo+IC3CoMKgwqDCoMKgwqDCoC8qKiBAYWRqX29mZnNldDog
b2Zmc2V0IHRvIGFkZCB0byBNTUlPIGFkZHJlc3Mgd2hlbiBhZGp1c3RpbmcNCj4gKi8NCj4gLcKg
wqDCoMKgwqDCoMKgdTMyIGFkal9vZmZzZXQ7DQo+IC19Ow0KPiAtDQo+IMKgLyoqDQo+IMKgICog
c3RydWN0IHhlX3RpbGUgLSBoYXJkd2FyZSB0aWxlIHN0cnVjdHVyZQ0KPiDCoCAqDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5oDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX21taW8uaA0KPiBpbmRleCA1NDBiYWRlMjQ3OTAuLjRlNzk0NzU3YjAyMCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbW1pby5oDQo+IEBAIC02LDkgKzYsMTAgQEANCj4gwqAjaWZuZGVmIF9YRV9N
TUlPX0hfDQo+IMKgI2RlZmluZSBfWEVfTU1JT19IXw0KPiDCoA0KPiAtI2luY2x1ZGUgInhlX2d0
X3R5cGVzLmgiDQo+ICsjaW5jbHVkZSAieGVfbW1pb190eXBlcy5oIg0KPiDCoA0KPiDCoHN0cnVj
dCB4ZV9kZXZpY2U7DQo+ICtzdHJ1Y3QgeGVfbW1pb19yYW5nZTsNCj4gwqBzdHJ1Y3QgeGVfcmVn
Ow0KPiDCoA0KPiDCoGludCB4ZV9tbWlvX3Byb2JlX2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvX3R5cGVzLmgNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pb190eXBlcy5oDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNjdjNTM1ZGQxMjQ4DQo+IC0tLSAvZGV2L251bGwN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW9fdHlwZXMuaA0KPiBAQCAtMCwwICsx
LDUzIEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0KPiAr
ICogQ29weXJpZ2h0IMKpIDIwMjItMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsN
Cj4gKyNpZm5kZWYgX1hFX01NSU9fVFlQRVNfSF8NCj4gKyNkZWZpbmUgX1hFX01NSU9fVFlQRVNf
SF8NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICsNCj4gK3N0cnVjdCB4ZV9n
dDsNCj4gK3N0cnVjdCB4ZV90aWxlOw0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVjdCB4ZV9tbWlv
IC0gcmVnaXN0ZXIgbW1pbyBzdHJ1Y3R1cmUNCj4gKyAqDQo+ICsgKiBSZXByZXNlbnRzIGFuIE1N
SU8gcmVnaW9uIHRoYXQgdGhlIENQVSBtYXkgdXNlIHRvIGFjY2Vzcw0KPiByZWdpc3RlcnMuwqAg
QQ0KPiArICogcmVnaW9uIG1heSBzaGFyZSBpdHMgSU8gbWFwIHdpdGggb3RoZXIgcmVnaW9ucyAo
ZS5nLiwgYWxsIEdUcw0KPiB3aXRoaW4gYQ0KPiArICogdGlsZSBzaGFyZSB0aGUgc2FtZSBtYXAg
d2l0aCB0aGVpciBwYXJlbnQgdGlsZSwgYnV0IHJlcHJlc2VudA0KPiBkaWZmZXJlbnQNCj4gKyAq
IHN1YnJlZ2lvbnMgb2YgdGhlIG92ZXJhbGwgSU8gc3BhY2UpLg0KPiArICovDQo+ICtzdHJ1Y3Qg
eGVfbW1pbyB7DQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAdGlsZTogQmFja3BvaW50ZXIgdG8gdGls
ZSwgdXNlZCBmb3IgdHJhY2luZyAqLw0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdGlsZSAq
dGlsZTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAvKiogQHJlZ3M6IE1hcCB1c2VkIHRvIGFjY2Vz
cyByZWdpc3RlcnMuICovDQo+ICvCoMKgwqDCoMKgwqDCoHZvaWQgX19pb21lbSAqcmVnczsNCj4g
Kw0KPiArwqDCoMKgwqDCoMKgwqAvKioNCj4gK8KgwqDCoMKgwqDCoMKgICogQHNyaW92X3ZmX2d0
OiBCYWNrcG9pbnRlciB0byBHVC4NCj4gK8KgwqDCoMKgwqDCoMKgICoNCj4gK8KgwqDCoMKgwqDC
oMKgICogVGhpcyBwb2ludGVyIGlzIG9ubHkgc2V0IGZvciBHVCBNTUlPIHJlZ2lvbnMgYW5kIG9u
bHkgd2hlbg0KPiBydW5uaW5nDQo+ICvCoMKgwqDCoMKgwqDCoCAqIGFzIGFuIFNSSU9WIFZGIHN0
cnVjdHVyZQ0KPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X2d0ICpzcmlvdl92Zl9ndDsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAvKioNCj4gK8KgwqDCoMKg
wqDCoMKgICogQHJlZ3Nfc2l6ZTogTGVuZ3RoIG9mIHRoZSByZWdpc3RlciByZWdpb24gd2l0aGlu
IHRoZSBtYXAuDQo+ICvCoMKgwqDCoMKgwqDCoCAqDQo+ICvCoMKgwqDCoMKgwqDCoCAqIFRoZSBz
aXplIG9mIHRoZSBpb21hcCBzZXQgaW4gKnJlZ3MgaXMgZ2VuZXJhbGx5IGxhcmdlcg0KPiB0aGFu
IHRoZQ0KPiArwqDCoMKgwqDCoMKgwqAgKiByZWdpc3RlciBtbWlvIHNwYWNlIHNpbmNlIGl0IGlu
Y2x1ZGVzIHVudXNlZCByZWdpb25zDQo+IGFuZC9vcg0KPiArwqDCoMKgwqDCoMKgwqAgKiBub24t
cmVnaXN0ZXIgcmVnaW9ucyBzdWNoIGFzIHRoZSBHR1RUIFBURXMuDQo+ICvCoMKgwqDCoMKgwqDC
oCAqLw0KPiArwqDCoMKgwqDCoMKgwqBzaXplX3QgcmVnc19zaXplOw0KPiArDQo+ICvCoMKgwqDC
oMKgwqDCoC8qKiBAYWRqX2xpbWl0OiBhZGp1c3QgTU1JTyBhZGRyZXNzIGlmIGFkZHJlc3MgaXMg
YmVsb3cgdGhpcw0KPiB2YWx1ZSAqLw0KPiArwqDCoMKgwqDCoMKgwqB1MzIgYWRqX2xpbWl0Ow0K
PiArDQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAYWRqX29mZnNldDogb2Zmc2V0IHRvIGFkZCB0byBN
TUlPIGFkZHJlc3Mgd2hlbiBhZGp1c3RpbmcNCj4gKi8NCj4gK8KgwqDCoMKgwqDCoMKgdTMyIGFk
al9vZmZzZXQ7DQo+ICt9Ow0KPiArDQo+ICsjZW5kaWYNCg0K
