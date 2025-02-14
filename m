Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E278CC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 09:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04E710E273;
	Fri, 14 Feb 2025 09:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQY7jZDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542CF10E273
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739527099; x=1771063099;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3UqofXHRKEvU+gnfhvad9zAiCWJiyCey9fdEsMho2PM=;
 b=NQY7jZDAwV9tM1RWp5qAQwEXX1Z2wAgoeBw/bsqcoM0bP65uqlThffJf
 yNPkhN1OcsaD5p7LQy54RIUt8c2VZ67MYYaXOtf2FyFrl0ZW9nsVQSAOf
 FMKVE7BYr4gbbHGudCMaMvkVI2ciwNOTm4J2utv/kpXW1AC0F8Ksaqxbn
 qSfmZlF36QDPF0IaInQOWBJVoHG0hieF2+i+U49HazxtG95YVCVLuY07Y
 ninRcFcLKSe9lbe1F2Q1ZBMEkkZSDvXh6L2eeU4TpmSNZE1drwaL2Aajs
 QaYlSS5YNkKVWfmBJbPjOSSnYCTOXjh0Z7DvHxnaAS6rHR95jTAVDFVGC w==;
X-CSE-ConnectionGUID: ILr7aJCtSIKPrYopl0p3dA==
X-CSE-MsgGUID: RIV/MgtzRQupJLozvFisiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51245210"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="51245210"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:58:18 -0800
X-CSE-ConnectionGUID: JBvf9r/WQTiLixFODuAbdQ==
X-CSE-MsgGUID: 7MfyEGnnSMu0Z0TV/PR5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118346865"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 01:58:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 01:58:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 01:58:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 01:58:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtVtVfSaKRPxYIEgLNMAAGENpAACW2mTL3SZ5UBf60Z9Ab9m9oFsey34AUU/9u14cdX4mtfpllcpYzfhzxwj49RpvQIEjmskol7yrkEIeOi/5uEHzjP0g3QEv6vR2+XTFHaYVIVTBRT87oauj3eT/V7OaUr2RMQFyRbujk+BNJQ8KdRy3GsKc6IiKrSEvHneONqGpDfKl0gVpEuqJN/mKs79ooA94blArw5n+zdxVH9qq0CQX2Q5kTdtYMFfvr+SBHOD2fXnjShxe7hjN5+CPop0LP9rAC3sDRxHa/jVFzSLQnlPEnNNAGyaNeBaXFHvXjOIxk9uCN9/+Vd6+17Jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqF0H9jSvd343ASSIKIkckLbxBH+SKS1gphHr1SZoKA=;
 b=huIj3lCCQr++Z7I9QdnFI/iEY2W1r903HHSFgiMGDpB5Ef5b2S+DUBrURQr3cqBbyX96uvZlE+PF06dtxRuCV666k51zWtHXIEBDy6N1MMIjyfBkj7bdy8eiqh5DURPsorMb6UVdtiPyphepwP9H7/skJ42ywbcE56zt14nPAF9jy1osCZYyt1Xb4M3FWaXBiaQlXqdpC/GOtK8HTZBzR3B6e//8UuQW52/2gZ0jZHE/cv/XKMSLtM3G+wLIuOg62178cwMXqg7urdqrPw0nzv3dUhGRWcA8LYmdZ+AgT+BwlgXdwue1ve9Y9I1GZ/VcI9LE6dhQvleuYfTBLtbieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Fri, 14 Feb
 2025 09:58:15 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 09:58:14 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "K
 V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2] drm/xe/guc: Escalate GuC load failure immediately
Thread-Topic: [PATCH v2] drm/xe/guc: Escalate GuC load failure immediately
Thread-Index: AQHbfl/B+tHNsNTaOk6XBbSdpKyPe7NGkOwQ
Date: Fri, 14 Feb 2025 09:58:14 +0000
Message-ID: <LV3PR11MB869535FE8BFE7A1FBD180AE3F9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250213213901.2191463-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250213213901.2191463-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SA2PR11MB5113:EE_
x-ms-office365-filtering-correlation-id: e7633c49-7691-4f49-3d6f-08dd4cde1963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oxLmgZjjpxOY4sxxUl4PW/tg7tY7hceZHjpV062zQBlHsgpqB8KDvtC1MSBW?=
 =?us-ascii?Q?3Bwea4gsj1i5U9MjGmGXGll66Xz7tXVrHIeZvBVJvyKUctPuET5iesF6eBQG?=
 =?us-ascii?Q?PSArqCpxhncdFPGHvgT/YneoGsxVZ8UMbbgRuDmVa8FC5uWlH3E35z8D8kYh?=
 =?us-ascii?Q?dqKC91gH7MQtOBxyAv97iUeeI7j3T5dT8N3XGx/33SyBYdi95oxIBG0D9s3m?=
 =?us-ascii?Q?LHnyHcy2rDuCBALfqCLeGDrz+DOHmOUP27CgYhKdJqQMfa4vDvnQ2yLEgVIp?=
 =?us-ascii?Q?lXsmIbbVZCuNyhTFoQlqVw5WOaYOVgkv+pagNxAOTx78A9WAU77uxV0FF0NX?=
 =?us-ascii?Q?doi6fP6LtRDl6wGeXbbV53dHehVA5T8WBPXWozh2jn8Rm2P0Rv17hExheWw2?=
 =?us-ascii?Q?8zYXD5HNMt2JXwR1jPLgI0PlT0aKmRnokPqQuQWvi3qkvHJtpJ1sOqDovfWS?=
 =?us-ascii?Q?octDSbHCFN4375daXjT79ZVekxk1l6EYKRbgHXQ+X6sxyN61Yw2WDwLLvvNX?=
 =?us-ascii?Q?R7z8XWmf7mbYoaHjVFKM8HYfugRD7nN4v932JDz9Yh9xAx8k9cNaopMHl70j?=
 =?us-ascii?Q?nMq6CF38CILEP85/COrFBgqEXqrwmMkav6WvC7TIUnHScFM/guOCNQ4jrMo+?=
 =?us-ascii?Q?dDBRQhlrMV1xsV+kLUtbwFKPyKQIwl5oMkOUllWZrE+anICKAhW4VSgFaZRU?=
 =?us-ascii?Q?+1RKgNQbFraI4tLD+7izStbw4vsLXq0ufiHUNx2YkPHjOQf7xnsy4Emvf3i1?=
 =?us-ascii?Q?b2GQZNhOcyXrbpAVEU0CR+j0qvc+8f8OiENvIdMjlKP/pXTHd+yyuqj6rbjM?=
 =?us-ascii?Q?l5ja488HIsmzFYixWV22MbZLurxCwkMAINr5Qh/XcuPigJlHwneS/mrfrL87?=
 =?us-ascii?Q?t1aIEkwT7hjNWIPFZPG3kyM2Rfc93NErYPHzOSnqRIe7S873M5Msh0DFaRMZ?=
 =?us-ascii?Q?FKt1v+WV+QHNSYwBTbDPqjmbNy/Wa+5Jjus/Nom13deHIcJLBgrJ1dV75xtF?=
 =?us-ascii?Q?jE75wbrxLo3bYCrpNcrRNWvhs2yiYcFySY129t8KfgRjjtu+mZ6T2kasW258?=
 =?us-ascii?Q?v9h46beScbAxWpoJg7oB9ITp4cX2Y+QLumHjpaUIoRUMw708e0bRUpeen3gj?=
 =?us-ascii?Q?d7hp9y7NwLlCyoVXvlk0KAgrn/Ggvcbu6dawU6RO2AZ1zQxqlNni6L2Vvux+?=
 =?us-ascii?Q?p9Q/LDYTRxvdL/NmQ/seWrY3fK+qXRNvlRIc6zODrQaxWOmaryb0YHwNgGAG?=
 =?us-ascii?Q?eOboiZ34lv6+Z9TFY2L1uPAzVlpaZZ5T2zMO8PKLxK/d7B04fvm2/6eES6WQ?=
 =?us-ascii?Q?oWyROtP4hqMDx/g3xMzrTDvM8zBAX0W52pF4yqfx7M2i7IZfP6t/ABKR+C1/?=
 =?us-ascii?Q?H59PwyS9lHyuU1tVH2WbbfIOJ3CqwQnJyXJPtuqhQ2bdnLunLAabuQ+QVnLK?=
 =?us-ascii?Q?ZGyH9RmTvfwJMEY2CJZJLQK3UFzlX5uD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bm7xcMDPYPd6d4X6y4TgqrKY+UZFnbUkQ1lkK4BFAHCOk8rYuwsf3/8SfRIb?=
 =?us-ascii?Q?mZqLOOsnNYd9YHkdJYXCm3nTQx9HevODrq9V/PRYjjVS1zWUX5z2aqGNL5j2?=
 =?us-ascii?Q?lzX+VIC2WsqfnYfwcha3ySdF400+2pAs2lmVjTlhX+VpHsJ8ZZY2yW7+x6Jm?=
 =?us-ascii?Q?nuHUghFcXQTONJjrVtZ9S6OIugcFP3PlpQEi5R8AINflC0/L6/VoEBO2U7w5?=
 =?us-ascii?Q?JWSHnMQGXLdIs+xT166fH6JudM6hZNtgI5revEOKsS0mtiJIpGMabGshgYtY?=
 =?us-ascii?Q?JDETMStSJy3Ppcz084vxwK0dD6+N9zU0OuN5/BZ4SmlEj/6VRKb0LEwEBQLW?=
 =?us-ascii?Q?EsGvv2o7Gb9ivKAxj7AwjyA8gv2974Q5WOe+sfAnF4cS/IuTLUakGAIb/ZOz?=
 =?us-ascii?Q?cKxptkkles43TGBpWYkCciKIkDOn3/5N4FN0ae0jNh2XG7XnG9RIPJvn8rMw?=
 =?us-ascii?Q?cEll6fkLCd8tWO/jwiacku9PlbGx/tGZ/xBj8Vbs1tNEiU+8XDncDxlsNCqA?=
 =?us-ascii?Q?mjUDJWRXlx01PU7v12HVmxeHX2h6KbIlsWOSFpaM9N0j3Vsz84Sszcr79LcF?=
 =?us-ascii?Q?56PYpOYFRXdTs+BAqu+w4AdVNfRxn1GNoXFhrD/kxdwEoomKZwlP+SPQ9WJt?=
 =?us-ascii?Q?DLGiZHOKYJY8hNSetk7LOPGZ6AS13eNXsY8QNpvw15H0QykgxPMsk5gCHPPf?=
 =?us-ascii?Q?mHtXjpWg+VFxnPtxAyRMx5VYfym3hAjCEkLINqob77wiS4pbur8fwGSQRZY2?=
 =?us-ascii?Q?pGjtY/XXuqM/e0kWO+tVTgwu5wZh+k5nuf77N9CBogDjdYJlCihxGJLkXTnY?=
 =?us-ascii?Q?DLNkGO1bL1aTw64RgGd03io7CyxViLQcagWxDKksP1C4yaZhuwRm7L9FsbGZ?=
 =?us-ascii?Q?8jaEoTWDZwWkoD1AyB8SaoXDYaULqpRhbyyoBg3CWw/9ApUsF7Pc27K2ufRY?=
 =?us-ascii?Q?QmYGZeC/T/NZSf86XtJb9ZAlkWzofF+i5OwKL7YzxMtiPL1hA0ZaY8WymTOc?=
 =?us-ascii?Q?dDvQguuPQM2BkpOlEfpZqp1ZikxLLe0h8aypJesh4/Oe7u8NZdAEsNS+pWj/?=
 =?us-ascii?Q?eIp7ay8aUgv0xlrO8oTWrn+m8ghmZdJ1k04vcR39ZtiKunPauEdtXQyGZwZl?=
 =?us-ascii?Q?K5ECLI9UT6EKqClOhyOX6d1ju+M2FfKznYlCwlrKZWPSSqX55lHK3QZXhapr?=
 =?us-ascii?Q?qRQaYbGTb9Yl3KmPq0QFJzDe5KhwIyhRKOL3mzIZ8DEb/G5/dbVGrPl7v3D+?=
 =?us-ascii?Q?3CqqmrjLShGi6uwiFfEXGTPCgfwsI2jihU2byA0j+vL3PB70NesztnzdW3YW?=
 =?us-ascii?Q?Ql5d+EERQy6hZK2DsgRUM2FWSWqqMXp712GJ3tfugwx5mHWYCUDiPWa7NXXT?=
 =?us-ascii?Q?wICDY4iHyTn7e5CR/HpP6Vs6gRkArWTdBKRMAMWBncCeE9QxsyxBmBMQPMxB?=
 =?us-ascii?Q?4kfZTzxDmXF5aX005F7sQcSNUPCu1S3iyKHE+hV1+cD1Tjqd01asCTBBIUTc?=
 =?us-ascii?Q?nR5L9FmIYLNAnVDbD4KaLmpxF8mNtTW7BZ99WPDt5RoTByyyh1SmZWBmTCao?=
 =?us-ascii?Q?XCl19r46v7zwqmpShRJnlxiSiKufHh+gBteVXDvK0ULvMkfrBM1oXM2T8vod?=
 =?us-ascii?Q?TQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7633c49-7691-4f49-3d6f-08dd4cde1963
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 09:58:14.8314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: llHmMHZoJHxcw2Bezxw9HOtZYa+5EB6IEqlgivTrDdRXULz0e78AYoiSQL8kDeCaNndbK+oidV+Yb8nvtK7RWB3r6A4pF++aPdI71B0EuJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
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

Hi.
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Dani=
ele
> Ceraolo Spurio
> Sent: Friday, February 14, 2025 3:09 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH v2] drm/xe/guc: Escalate GuC load failure immediately
>=20
> When the Xe was first introduced, we intentionally avoided escalating
> GuC load failures, to not abort mid-probe. Xe is now mature enough and
> we gracefully handle probe failures, so we can start escalating
> immediately.
>=20
> Note that even without this patch the probe is still aborted because
> the attempt to enable CTs after GuC load will fail and that failure is
> already escalated.
>=20
> v2: only return success if the load_done variable is 1 (Tejas)
>=20
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---

LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

>  drivers/gpu/drm/xe/xe_guc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1619c0a52db9..407399cc4764 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -938,7 +938,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc
> *guc_pc)
>  #endif
>  #define GUC_LOAD_TIME_WARN_MS      200
>=20
> -static void guc_wait_ucode(struct xe_guc *guc)
> +static int guc_wait_ucode(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt =3D guc_to_gt(guc);
>  	struct xe_mmio *mmio =3D &gt->mmio;
> @@ -1045,6 +1045,8 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  			  delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> guc_pc_get_cur_freq(guc_pc),
>  			  before_freq, status, count);
>  	}
> +
> +	return load_done =3D=3D 1 ? 0 : -EIO;
>  }
>=20
>  static int __xe_guc_upload(struct xe_guc *guc)
> @@ -1077,14 +1079,16 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  		goto out;
>=20
>  	/* Wait for authentication */
> -	guc_wait_ucode(guc);
> +	ret =3D guc_wait_ucode(guc);
> +	if (ret)
> +		goto out;
>=20
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>  	return 0;
>=20
>  out:
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;
>  }
>=20
>  static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> --
> 2.43.0

