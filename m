Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED227C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 15:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F82E10E2E7;
	Tue, 28 May 2024 15:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LphNAIvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2460110E2E7
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716910993; x=1748446993;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y2U0R2EGjV40P1Xtwh+Rt1OiirER9BR3ICmrd8WKe+o=;
 b=LphNAIvFHsDojy52Oevqo9teRqcm7jp3l25BvrIszDov+M7RE7jUljW6
 l8/9s1td0swwrBwQufkt0xlRjc6KwHZ57XF2Mak5RFvA9vwGv312YET90
 AwoyfhxZzHUM0S3hWdqfjRIxnqdA7y1Sy86GNQlLmjMqKPFMAfEqPHTHL
 ABl4056LJ/5fP6HiyoxT+PFsdJHfrMAgqhi8espw4h1qfjHiIo5/CbAyb
 zcAw09dsLvGFgnmE8jKjqGQWO4TkUGC3N3wusTQ5I8NqvIEHL/oEcugfw
 lP88P00RwWPTohSuV8pRYea+lGUxM6sulYFNUW1WZlX0ZB71ry70SID0h g==;
X-CSE-ConnectionGUID: Eqk+PBdfTweVIad0PxTkBw==
X-CSE-MsgGUID: 9Az5EiyhS1+vI9FHJ20fmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17099583"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="17099583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 08:43:12 -0700
X-CSE-ConnectionGUID: qzyBjJOBQ+m6FInySB5b9A==
X-CSE-MsgGUID: +uhyTRbpSLmJYT5fiQM4mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35022690"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 08:43:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 08:43:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 08:43:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 08:43:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 08:43:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUSLBhpUbKtziFNBJJfdi3rtDUk15tr7aLFgxCqat3MkM4pt2EoIKOqFraBBK0VIQh51Rxty4eKr3btIjtOr0pPjU2WVSS+kuHQs6QWima2v6OwoNKqBHWmdHcKdLDGy2gDryJneCUTxXWkHsV4HRhzHHvmH2jQinNg4kQyQFwhgsoZCPmkUzwaPl6YxkPmZCvy8DHrRlJlXduxxFxZ3WkFpF/N6uue6VxfixXbiW+W0J6EuyqmedZFKJvyFgFOX9vY/6O8yqRMxNIiFvlDRcoUZn15/tDIzVUqGo+RvzUQ3HKWtuEYv07fITIUs8ecKWHYU+HVx7jdT1OFWP8YO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fBcjrvsV2bmuNQhbj5AD6YQqBP9Dzdbgv0M0oEIMLM=;
 b=cdB4cm47UvVi1XynjK0htK+QJj35WvkySaN1RRXLT7kcR0tzS3mau0sxqbv3SomkD3LXH0xylPHSyD31XZQ+4TuJHAMDu74AX6GoMasIuBR4z2T/dO+SFsBAJA57CmBy0VGqlEvId8+dIR9V/tF8iQDKc9ulgVW4gEfnVcGOBLFcgA2kF607PODQvhvc8VtN+ot6/554LB7cDfIsGOHotjyiwxfY0mg1kUcjKxsBXSpMxRK5KC8sZ6pyFkxXsUy6OBjQKAILF6l+eycgxphZ6JTotBqKcXIWoxTmdLqyNmeAAMLkF3QRg2lqLcEJt5F8//ApDZ+v86CwKWMYedS5ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) by
 MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 15:43:06 +0000
Received: from DS0PR11MB6424.namprd11.prod.outlook.com
 ([fe80::389:52e7:d855:a6da]) by DS0PR11MB6424.namprd11.prod.outlook.com
 ([fe80::389:52e7:d855:a6da%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 15:43:06 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH 1/6] platform/x86/intel/vsec.h: Move to include/linux
Thread-Topic: [PATCH 1/6] platform/x86/intel/vsec.h: Move to include/linux
Thread-Index: AQHaox0cVebIJmUyWEekHePRp+dP2bGs5PmA
Date: Tue, 28 May 2024 15:43:05 +0000
Message-ID: <DS0PR11MB6424F20F1C1AF1FB54D2D71BC1F12@DS0PR11MB6424.namprd11.prod.outlook.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
 <20240510205948.904409-2-michael.j.ruhl@intel.com>
In-Reply-To: <20240510205948.904409-2-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6424:EE_|MW4PR11MB7102:EE_
x-ms-office365-filtering-correlation-id: 9e3f13ff-47e2-4244-9435-08dc7f2cde06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?u6zFmzb8hZZtANzEiMUwLLSSodtfKdcjETHYdZ9zu3dfOji8qWWFCad8MPN2?=
 =?us-ascii?Q?gDIoJSuBn6vKJN8sAgl6pKMEVh8sMXuUGrqbCJudTzwtnRpZ62Ol8gwnn/jY?=
 =?us-ascii?Q?dTp65Ono/ITb1qpdW3UQ+eTTilEyiKaVaLckf/+hOWNEV2NyQ2juOdE3qlJQ?=
 =?us-ascii?Q?rHILXB17/Ziw6XGmhasvfvux8DB1EQWSrQaLReNgaMedZIYGWSwv2ie9ukGo?=
 =?us-ascii?Q?3Y0wC5mMxsdcqqz6H/tHajlCFJZKKm3fKTcS78VW+z0DbzgOtrLSVOJ9MooJ?=
 =?us-ascii?Q?mw2rup4OK80Q6y3ipsewEibA9qJSXNkvBKF2o+8GYV9+DBF3zHp4fUvMMLGa?=
 =?us-ascii?Q?hI1Ul4Ht1UiEyuQQampKXKSnxK0F1ARdtK/WxgGXObb0stxxs+0dqLhyjzId?=
 =?us-ascii?Q?Ey+2uT5Icasgrf6BmDGgiRM9umTjeCqVJlpfj+jG1KhBOYrCrKfV1jfocNjg?=
 =?us-ascii?Q?rDYn/m8BE3oC/RN6aRZkud/nGE4oSuC9OfZVfyPz8yKsEBv+DKbF8fs9LJ+C?=
 =?us-ascii?Q?yQBJrJo0dH01ZVP0Y4r7A4wbmG8RKNrARMd3YI6O6t0A1u7izKEpt5F6LgpH?=
 =?us-ascii?Q?C3nh2nGQ+4EgkkFt7ndPoYFHUHKGcThU/uztBU4PRctEulSXiXNNuuyftcUu?=
 =?us-ascii?Q?gMMlH9oCQrvxdhPjnr0eEpxKfTX6RH5W27Z3NcSiXOPUikgvetwtwtdfx6KV?=
 =?us-ascii?Q?nvL7lLwUVVM1wqT1wPCfMzeFWz8NyJWyz6IIXm6tuSd/HeuIpxXM1CxKIieW?=
 =?us-ascii?Q?ZzYGtnHWbyPseoxN2wSNkUPpvYLtwrgkU/TZquRe6lJJW8kve8OYxCUb0mXe?=
 =?us-ascii?Q?IqAz9ycYzIUew1A2T0sEI0uYQ/zmlz2+gitG9M/jipmF18OvO4FBncEXMfBk?=
 =?us-ascii?Q?DD6uT5ssks0RyKdfdyzHqRLm5ZDJp06+I9Tc2TvAAMgSoazb4ALs5Vq8+rK4?=
 =?us-ascii?Q?jPGHOe2TT0MDPSlRHZueFpHpqkkmZVQTd8JEI9XycpvKPCheI/JZLC+YMxIO?=
 =?us-ascii?Q?vAht6hdIgNQkiKjuIIQ6e+YYu0rjXdnuiJr2oive9XLLezAPDw5JJ84BnPnI?=
 =?us-ascii?Q?BAaIlA6m63g/murQ+vm3ZPIKlF/SkwuC4USqjbGJgJUXTt4Fh/KR7+lNYOhT?=
 =?us-ascii?Q?ngFnOUDDMVS9hoFgwlyQCHWDFeDrU0jQxnl8cbbKKbQhpeJOtV4Rat/oJuCc?=
 =?us-ascii?Q?Y3TSnRChGiPjR/rQyiovOTTtD227kza17valxcu7ubCnATtdlFWxvOJM3CEn?=
 =?us-ascii?Q?hycAlfdH3N+a8gBwKzLwMc68EHaHTmlREUE7DsPElecshdUS/50PuJRkk7Fs?=
 =?us-ascii?Q?OYBgrvi+KqcEu9E6nio0/oWA82u3GCed0vZ0tpb34uxLKw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QmO1Y7h0VcE8IfHoyYtaiVnGucBPGhaS0vFrXe17BvT2FIBrO7SwnRXVlK/s?=
 =?us-ascii?Q?wGfk3GJgxe2uBePvufwAzb6h6S1Dro210cdP9dv8bLxCIBB78rZxpDStg1Ow?=
 =?us-ascii?Q?kxE36GXNveXs5RIy+qm/emCG1xT5Ls23shx1Lymq5oOql6VqiZywHjQTUDLC?=
 =?us-ascii?Q?HMJD9fj3kwktKa1qR0gQWiPT239OhM/Ao9B5YFZK5JrfRt4vQkpTkPQpu0m5?=
 =?us-ascii?Q?XO+35MrfPi+snKbdyufFmnUcYaKb3tUIHBhDA8ZwfPAjwIYK7k4tx5ibkAp+?=
 =?us-ascii?Q?iyvxQAeJfBbzuIy+Ho/ZASTW+YU3ygD4J00ZooLMg6Q7x6HI6h4B4gwVwtjH?=
 =?us-ascii?Q?o1sbYAcqx+qJkJxiTGoa4Kap+Zqwv/iX29znWf6+Ltn0ffRo3x5K5iOaMXuT?=
 =?us-ascii?Q?9rKmx6jVi4d6VOm8oUzEYParD4jiaRZuke6UVgnrDMJp4RtsraSxqD5dimO7?=
 =?us-ascii?Q?mGjYPh01I90fVwZ0ShtndJ95TFyb6rsdbyTsegQ0MGbO3B4fUByiSVABkwnC?=
 =?us-ascii?Q?YJd6YMftdIU6p4hXuoNEiN2cvzYqsB7x4u/z7rI0r4wFgCdjAw8Gv2bK/jAO?=
 =?us-ascii?Q?pjbPV2FYDUXbSlZ1AESkBo3jtwBGB73fLFpTVyAsxLUA+EDVlB27B2rxvcxW?=
 =?us-ascii?Q?5U73MqK3jZiVkTA2kVjXXsi8iVmeinWpgfVQlYu1gb9G7PslYrxIfKVooNAd?=
 =?us-ascii?Q?XGIumRuh6ukch1Ndudhq5xlAxtUcPCKQUOOy4CzsJZxKZaqM+FKglVv1lezL?=
 =?us-ascii?Q?iTC5L+3wxFFthP6x7L4SUWwrP1R7pZ1jMzJ/5jYU0I8rZE5Vz8vlkbVA39sC?=
 =?us-ascii?Q?yoK3Kg6phkBj59gLyeiiPDX+cFmq+QJlN2/lkzv32ErkUeTONPjWgG/V5lXy?=
 =?us-ascii?Q?dwumgg+h5yeOmMlITp4blhi0SEmvvDxlwNX6ZG3v4bqESR9heksx5Fr/AiVA?=
 =?us-ascii?Q?w2/GfYUzBThOHJIXGanOi4ZSrX/9G+El3D8bopvl7sEB1wQNrSNdjk9rZn/d?=
 =?us-ascii?Q?PvWmxhEjScrEifLido5f8BUlOHV5Y+01lOWIK4RaMrqOMBjhLPDdi+41PbFQ?=
 =?us-ascii?Q?iNzgxVOTmxpP5RnD4ForcaH8troVMRhbwhGfqj6OkJFAuA1RzvVQi5j6H08G?=
 =?us-ascii?Q?8pgiQT/i9UpLf66cm36xftCUrbdsgSc5DMaVjUWSN8zbNrzU3gjWExWtOTbE?=
 =?us-ascii?Q?WNWvhAcyak8JxwoXU4uE6DK4g2LKJrGfXk29naM6cbDTPiIMieXN1a3X5vRo?=
 =?us-ascii?Q?fVBIpRmNUD2Zy7i3NYnYjny359EIdDpMaZapdlL2Zve/onbBj1ivAHzWe31n?=
 =?us-ascii?Q?+Ao1sSUqmQvZzbE04d/BIu2M6mcpbuKv8AxmSdTlNSKg1nSbPRPrfuKPubK2?=
 =?us-ascii?Q?/oZFVrpK5FRiaTtD9ILUQS6E03m2mnMy1frtg4Cdhp8Iwp4eA8EJsHdL5IU3?=
 =?us-ascii?Q?fCRut3AtKZBvkSwOlE4n+vWlaKqm01iVyY+Ubg/E/g/VjNrPRjTLbgxMZR38?=
 =?us-ascii?Q?ydC4IduWQu7FyxiexexPaCUIjDHX/zUXxpBLbV7ndKd/f+ZBMBFObuuw5MEU?=
 =?us-ascii?Q?cGhRGHVvXN+kzL8IFxDqWYA+yWpZ5zvbUpwYNIgS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3f13ff-47e2-4244-9435-08dc7f2cde06
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 15:43:05.9371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAvA9v0z4B7Vowmxv+XzCsNrC89Hv5y8gUjPVbdbka628Nkr0CRr54A+j9DCF+kAUNbrRZUWrDSXezjKhn0l7swrZa/GQ8tU58qnoCAdB94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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

Hi David,

Do you have any comments on the first 3 patches?

What are the next steps to move them forward?

Thanks,

Mike


>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Micha=
el
>J. Ruhl
>Sent: Friday, May 10, 2024 5:00 PM
>To: intel-xe@lists.freedesktop.org
>Cc: david.e.box@linux.intel.com
>Subject: [PATCH 1/6] platform/x86/intel/vsec.h: Move to include/linux
>
>From: "David E. Box" <david.e.box@linux.intel.com>
>
>Some drivers outside of PDX86 need access to the vsec header. Move it to
>include/linux to make it easier to include.
>
>Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>---
> drivers/platform/x86/intel/pmc/core_ssram.c                  | 2 +-
> drivers/platform/x86/intel/pmt/class.c                       | 2 +-
> drivers/platform/x86/intel/pmt/class.h                       | 2 +-
> drivers/platform/x86/intel/pmt/crashlog.c                    | 2 +-
> drivers/platform/x86/intel/pmt/telemetry.c                   | 2 +-
> drivers/platform/x86/intel/sdsi.c                            | 3 +--
> drivers/platform/x86/intel/tpmi.c                            | 3 +--
> drivers/platform/x86/intel/vsec.c                            | 5 ++---
> .../platform/x86/intel/vsec.h =3D> include/linux/intel_vsec.h  | 4 ++--
> 9 files changed, 11 insertions(+), 14 deletions(-)
> rename drivers/platform/x86/intel/vsec.h =3D> include/linux/intel_vsec.h =
(98%)
>
>diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c
>b/drivers/platform/x86/intel/pmc/core_ssram.c
>index 1bde86c54eb9..baddaaec25ee 100644
>--- a/drivers/platform/x86/intel/pmc/core_ssram.c
>+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
>@@ -9,11 +9,11 @@
>  */
>
> #include <linux/cleanup.h>
>+#include <linux/intel_vsec.h>
> #include <linux/pci.h>
> #include <linux/io-64-nonatomic-lo-hi.h>
>
> #include "core.h"
>-#include "../vsec.h"
> #include "../pmt/telemetry.h"
>
> #define SSRAM_HDR_SIZE		0x100
>diff --git a/drivers/platform/x86/intel/pmt/class.c
>b/drivers/platform/x86/intel/pmt/class.c
>index 4b53940a64e2..d7939b28e937 100644
>--- a/drivers/platform/x86/intel/pmt/class.c
>+++ b/drivers/platform/x86/intel/pmt/class.c
>@@ -9,12 +9,12 @@
>  */
>
> #include <linux/kernel.h>
>+#include <linux/intel_vsec.h>
> #include <linux/io-64-nonatomic-lo-hi.h>
> #include <linux/module.h>
> #include <linux/mm.h>
> #include <linux/pci.h>
>
>-#include "../vsec.h"
> #include "class.h"
>
> #define PMT_XA_START		1
>diff --git a/drivers/platform/x86/intel/pmt/class.h
>b/drivers/platform/x86/intel/pmt/class.h
>index d23c63b73ab7..d6f9ccaf28c8 100644
>--- a/drivers/platform/x86/intel/pmt/class.h
>+++ b/drivers/platform/x86/intel/pmt/class.h
>@@ -2,13 +2,13 @@
> #ifndef _INTEL_PMT_CLASS_H
> #define _INTEL_PMT_CLASS_H
>
>+#include <linux/intel_vsec.h>
> #include <linux/xarray.h>
> #include <linux/types.h>
> #include <linux/bits.h>
> #include <linux/err.h>
> #include <linux/io.h>
>
>-#include "../vsec.h"
> #include "telemetry.h"
>
> /* PMT access types */
>diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>index 4014c02cafdb..9079d5dffc03 100644
>--- a/drivers/platform/x86/intel/pmt/crashlog.c
>+++ b/drivers/platform/x86/intel/pmt/crashlog.c
>@@ -9,6 +9,7 @@
>  */
>
> #include <linux/auxiliary_bus.h>
>+#include <linux/intel_vsec.h>
> #include <linux/kernel.h>
> #include <linux/module.h>
> #include <linux/pci.h>
>@@ -16,7 +17,6 @@
> #include <linux/uaccess.h>
> #include <linux/overflow.h>
>
>-#include "../vsec.h"
> #include "class.h"
>
> /* Crashlog discovery header types */
>diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
>b/drivers/platform/x86/intel/pmt/telemetry.c
>index 09258564dfc4..3478f891ea0b 100644
>--- a/drivers/platform/x86/intel/pmt/telemetry.c
>+++ b/drivers/platform/x86/intel/pmt/telemetry.c
>@@ -9,6 +9,7 @@
>  */
>
> #include <linux/auxiliary_bus.h>
>+#include <linux/intel_vsec.h>
> #include <linux/kernel.h>
> #include <linux/module.h>
> #include <linux/pci.h>
>@@ -16,7 +17,6 @@
> #include <linux/uaccess.h>
> #include <linux/overflow.h>
>
>-#include "../vsec.h"
> #include "class.h"
>
> #define TELEM_SIZE_OFFSET	0x0
>diff --git a/drivers/platform/x86/intel/sdsi.c
>b/drivers/platform/x86/intel/sdsi.c
>index 556e7c6dbb05..322ada188ee9 100644
>--- a/drivers/platform/x86/intel/sdsi.c
>+++ b/drivers/platform/x86/intel/sdsi.c
>@@ -12,6 +12,7 @@
> #include <linux/bits.h>
> #include <linux/bitfield.h>
> #include <linux/device.h>
>+#include <linux/intel_vsec.h>
> #include <linux/iopoll.h>
> #include <linux/kernel.h>
> #include <linux/module.h>
>@@ -21,8 +22,6 @@
> #include <linux/types.h>
> #include <linux/uaccess.h>
>
>-#include "vsec.h"
>-
> #define ACCESS_TYPE_BARID		2
> #define ACCESS_TYPE_LOCAL		3
>
>diff --git a/drivers/platform/x86/intel/tpmi.c
>b/drivers/platform/x86/intel/tpmi.c
>index 910df7c654f4..be7ea557b72d 100644
>--- a/drivers/platform/x86/intel/tpmi.c
>+++ b/drivers/platform/x86/intel/tpmi.c
>@@ -51,6 +51,7 @@
> #include <linux/debugfs.h>
> #include <linux/delay.h>
> #include <linux/intel_tpmi.h>
>+#include <linux/intel_vsec.h>
> #include <linux/io.h>
> #include <linux/iopoll.h>
> #include <linux/module.h>
>@@ -59,8 +60,6 @@
> #include <linux/sizes.h>
> #include <linux/string_helpers.h>
>
>-#include "vsec.h"
>-
> /**
>  * struct intel_tpmi_pfs_entry - TPMI PM Feature Structure (PFS) entry
>  * @tpmi_id:	TPMI feature identifier (what the feature is and its data
>format).
>diff --git a/drivers/platform/x86/intel/vsec.c
>b/drivers/platform/x86/intel/vsec.c
>index 0fdfaf3a4f5c..5a1e964783cc 100644
>--- a/drivers/platform/x86/intel/vsec.c
>+++ b/drivers/platform/x86/intel/vsec.c
>@@ -17,14 +17,13 @@
> #include <linux/bits.h>
> #include <linux/cleanup.h>
> #include <linux/delay.h>
>-#include <linux/kernel.h>
> #include <linux/idr.h>
>+#include <linux/intel_vsec.h>
>+#include <linux/kernel.h>
> #include <linux/module.h>
> #include <linux/pci.h>
> #include <linux/types.h>
>
>-#include "vsec.h"
>-
> #define PMT_XA_START			0
> #define PMT_XA_MAX			INT_MAX
> #define PMT_XA_LIMIT			XA_LIMIT(PMT_XA_START,
>PMT_XA_MAX)
>diff --git a/drivers/platform/x86/intel/vsec.h b/include/linux/intel_vsec.=
h
>similarity index 98%
>rename from drivers/platform/x86/intel/vsec.h
>rename to include/linux/intel_vsec.h
>index e23e76129691..7f19a3d90abe 100644
>--- a/drivers/platform/x86/intel/vsec.h
>+++ b/include/linux/intel_vsec.h
>@@ -1,6 +1,6 @@
> /* SPDX-License-Identifier: GPL-2.0 */
>-#ifndef _VSEC_H
>-#define _VSEC_H
>+#ifndef _INTEL_VSEC_H
>+#define _INTEL_VSEC_H
>
> #include <linux/auxiliary_bus.h>
> #include <linux/bits.h>
>--
>2.44.0

