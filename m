Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E2AE77188
	for <intel-xe@archiver.kernel.org>; Mon, 30 Dec 2024 11:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715A710E149;
	Mon, 30 Dec 2024 11:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9iU/lRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C0210E149
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Dec 2024 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735558742; x=1767094742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SsFPE5jt8ZITXyDYDfBNKBm+DZmDsVKo+s2hg1rwQ/Y=;
 b=k9iU/lRzSR3m5UV8DELfLIwNVXKDQ/nfImKrbMnlCd6jNwicWfLKpce1
 4nfT6n7NVpWdOUsIuTjKLeGtIz6vXkKHRUdbqviUw8klDNOa0iwwlMiOH
 e93TgdTxtic0jxU4+3ol/8xlo1hqF/51g5x9R2DD6Jys8smvJlDq3HFnY
 GfjEcFsZ7npgw7ddUJrdcY3ZwrNvhlLprHfQTNdqb424lXlqXfIOIhiSl
 ej9Ma5+TjLAnz/iyiAYtmIhKO2txbRoR36C0foUTQ4OJZXXGyUoP6/iQt
 9NfNBYRWrXa7xGjmUC9mXoBmpi1GmQyGEuezKlrwhpfqxMsYQnTkOBWM6 Q==;
X-CSE-ConnectionGUID: Z3p07JkcQsGK3cNM6RgoyQ==
X-CSE-MsgGUID: l2XFVV8zQTeLlyatmJ0bnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36066475"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="36066475"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 03:39:02 -0800
X-CSE-ConnectionGUID: XJuwh3zyTrOEtm49bSlv/w==
X-CSE-MsgGUID: 4RcboFhpTrKcGoftrmi2TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="100956918"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Dec 2024 03:39:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 30 Dec 2024 03:39:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 30 Dec 2024 03:39:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 30 Dec 2024 03:39:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oN83V7ey4cDcOP4GbGwi+tdYAckHOYY11GWrHwwUNJuNkNVB1smQ2/KD76snNl8b1Zr3OuMZ2SMgiKsh1nrMlrwJR/BXaVYMC75WrI1AiNy6z1VA37ouektur14SD1TSaOYvTpnc1AKcOqeN+SxHZ0mpKdaiIymKI2lNskVobFjvt29OHd1Odn8wyoZMxQATEDHJ/mChRB1WXo3kraEF93UPB9UH7fwD75JbZIjHl+tdjLiIAZOysfrPt1RfEeMuRiV9w7M3cPG9Wq2aGGS27FiDVtSCeJaYIH16yKP+eIryb5CW6EuTBGWmteggvWm3KWTgrwAw7BfxgscBoD1/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84Sy7trt06SlLrbDEw97DFViSLTg60vgL0vmK/Jlkkk=;
 b=VGyK4xCoApGGWJ0hN1O4pzO7WCFZbM8198LsOXi5u9J+fJhxPDUsJjrNZgLi88t4OR/QVll4cB/azM17mWjB0QU3oq18vAjK0xP76s0YMildTgs4JTkIEUBLnw0XG2lK/EKLBCKnsaL74+YwOrETR+2Vczan03Dg25pef5NQi2V7/Sl0HFN/Zu+clLYu4AwM2jkXFU9APcVG12TAXV44rUTCA20B1NZjGbtVtREQxPCQcQddAq4oJKgubq1KsjMxO0WqrqJl/RXOQWrCLhGm1JSDgUZf8klIZfiAkZ7TMMKsMBxrPJWDQtWTeCgu9FLtZy8xRoFojB5Y4zd9Yd4KBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB6289.namprd11.prod.outlook.com (2603:10b6:208:3e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Mon, 30 Dec
 2024 11:38:55 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 11:38:55 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH 0/2] Introduce fault injection for guc CTB & mmio
 send/recv.
Thread-Topic: [PATCH 0/2] Introduce fault injection for guc CTB & mmio
 send/recv.
Thread-Index: AQHbUeAzb9OYekurKEGQDf4q4P7xnbLtuuiAgAAPgwCAEO/VkA==
Date: Mon, 30 Dec 2024 11:38:55 +0000
Message-ID: <LV3PR11MB869501F81AD1DC01B27E5193F9092@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB54444C11555ABE33E9EC8D48E5062@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Z2RQeMoXByoOU/+w@lstrano-desk.jf.intel.com>
In-Reply-To: <Z2RQeMoXByoOU/+w@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|IA1PR11MB6289:EE_
x-ms-office365-filtering-correlation-id: 060f5d87-d832-4dbb-f4ca-08dd28c68abc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kmkrm3zFtD7yKDZFc1NZrNfpPXxgK+2D/0VsZob9mxVDeJyCAR+nguEBbzbb?=
 =?us-ascii?Q?/+dZLFNpCzik4a2lFQMH9lr7UeIOXdIG5bjFZc8E1+0HI2MhEERSjOM6ZFNF?=
 =?us-ascii?Q?5wiPHYQ1Mzm3WlYITGdGnYNMIv0MqmKR6mDGTNseo2kOM7QdQ9oG7R6mHc+9?=
 =?us-ascii?Q?SsZAfux4LAsPbQ7q+MPKbD1J0p8pwrceUc18jYFJK0bpxtgUo1YCfDUZYeoI?=
 =?us-ascii?Q?lYSqtl1ZdN1eVhRC2fjHWsnK1/UNgYY/97C06Rl/K9Hes/S6WZUJXgWe+yaT?=
 =?us-ascii?Q?dyZDOT5bOnZ7+Q66sgkJbEaGuLLIlKE1bUQkCMLeaBsTovBlJFp4d/q7y2d9?=
 =?us-ascii?Q?QCu0O/nCYB3gBR/fPBoBZB3SA/HuPLuVN9WeK7nyPAVHufgegoXogVw0kMOf?=
 =?us-ascii?Q?dkr62+cZbEEEMO96J+nGpvADkbuZGH1KVlXrTZ0i2cwqPwZZKRblyH+k7ifc?=
 =?us-ascii?Q?AIzIQ44KWnUHHU6B9WshIBQDt3+UpBQzkOUH/sLJGJ8lpIIAMG92mmbpwabm?=
 =?us-ascii?Q?3kRm2qy/5NgTsamBv3DxDQd2CrxUdtq7wUCxhKNZyMBelZKC8E4ZQ/V7lhA+?=
 =?us-ascii?Q?t29xRPwiU9FTfcYcRsMreXaHPSABFwvP316ZYfYGFQ/wd3hywQXYrzxeguH1?=
 =?us-ascii?Q?ZQBcdNxiVByklWYs836MNkEoWnSs8h4MI6cI0dBzcJtaRQKrthMapsSk2eXG?=
 =?us-ascii?Q?NOe4wtZdRaKe92re6aUrMlTL0zK0vZf/aZwrm95jc/I+0nfkbSifuawCMVDU?=
 =?us-ascii?Q?Aqihmc81daApEkGKa5y5WHY1ILYF1M5nKYM+L8oTAvPjkt+ESGUZi2gAGRwp?=
 =?us-ascii?Q?6ueqnl/0YGEYcRl7sPBt6ZVCjDDoKqorXhr8ZfrD+AawM96Eg+cmMRTm4ImI?=
 =?us-ascii?Q?sEumN+zC0x1JXjNCoTl+jwbZGDf0AUSN95h0H24yPi7aTARAE9MJiCzMktyl?=
 =?us-ascii?Q?xij8RhTqrDYzerrApSwh104afBBJuP9/NcY7ddPl2GErak7O/u/ZEs1gWkbr?=
 =?us-ascii?Q?BAusuoLHjGD7gZJTumS+az8Y4mlr0E4QuW6erjbXhCN8gO+OBRo1neVmQFsF?=
 =?us-ascii?Q?Y29AW/z9wywRQtYohVp6lNyvqe/Wdik6Fn1S2gjtc0cvWi4T/lpI7uosQTa2?=
 =?us-ascii?Q?YyE0QYcZ3fsrhDTW28mACtVtV0lZQU9fIWhNnRSLXzPY2xo594unWf5W+RoZ?=
 =?us-ascii?Q?rIkTJnXkrrHt5rA1d5KpGxbvy/X2U4OwRCaPW/ee+MHJyXnwxGesusWKBf8f?=
 =?us-ascii?Q?c65FP0eAd9d5flATCm/yz0NmTZdMetUp5qoR1TZ2kEVdzX3LTD0Tlk1DTmTZ?=
 =?us-ascii?Q?ZcA3SN8982EqfRfEiFl1OGNwiwsOIJINbmbTwQAatZJwgeHNtVBEc2pDmFG+?=
 =?us-ascii?Q?bJf920fLVws2x6jEC3GGZ+YcEhW61ru0lgV98Ix6A3HvAy1sUQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Va9TZmfqz/5MuhPlhDMsx9gA/82ss9iYdK2lXUAdw4dhwl/DYTmsXtGfggvK?=
 =?us-ascii?Q?yxd8lBsiYPLwQQeoc/yk8dXF2IH9UumZYIjMF9pvx7+OflO/2plDOzabyFqR?=
 =?us-ascii?Q?fbW6/rmT+brEf5AA2sPwvG4OShkfPpJGwpaakaupvevXExH7oTqORacfnUAn?=
 =?us-ascii?Q?yHUfPngmxfrdwdPaUPHvMtXlpPZjvCkX2gt1imInwiiSuESHeOeFStNX5PR7?=
 =?us-ascii?Q?strhk80YtUxiIjouP4L8Ik33xHlYuN1+PPF6JEsTvHXwiRRvfVOfJeOiYZ8v?=
 =?us-ascii?Q?04UWS10SWHuq+rzgfV+QykYUnENVotlis0q+iZ0+xYklJ2sMi92dgR8z+Tao?=
 =?us-ascii?Q?bamnyAfrp1oKVu67gm8seOIUDIl1vLGXp6tORwkqpgoh2ntIPvpWQ7OE57fy?=
 =?us-ascii?Q?ZgSGx/U/I4CBjK7LEKDNmABhXM0wI79FOkMural5B7KHFpT1koFAPD1d237z?=
 =?us-ascii?Q?6CoXl24BoAqccUtAfHz4hwaKt7WdktczddAWSp+TP+z6OcbAC0CMLtHgGw6J?=
 =?us-ascii?Q?c890eG9kROlgQYpcq58pv4VenFQU62KNAqHxTZK8kiMhQsGIsZUK4vHByTrR?=
 =?us-ascii?Q?Ee/b9NdnsjtWtAuRDvLeScB5S4u3ZAURz0/yqWgyHkmD0BSc18jvcolk9W5C?=
 =?us-ascii?Q?U0DJcXdPSjhJzvToRNr72ga4KmBjtOgRBJhFtptb/PGjhas6SLRhLqcNmNGI?=
 =?us-ascii?Q?CC4D97tIDoFHFTMJ96fOMcDz4cmdapLhGFXpP5arxiMzdIOp4XVwHAm1Ya+w?=
 =?us-ascii?Q?mp+jInPk2yWyttBeXE4xdzxou2LOSecKTSkbdgORmJ3u3GpQ3N6B4LCyu5AK?=
 =?us-ascii?Q?YV9bkUHGX/skwBSi/WupcJd4DYDRy4MiznCaT+z5VEoHUwO1uXoxZv0x7fvH?=
 =?us-ascii?Q?Eiej4Mbhi7jc8M7rdTUHQYy/sKz2Jwcl6sCWt16wEMFkoohmSGws6wMW4vKT?=
 =?us-ascii?Q?Ba0g3jePGDpLlT4pJSdY2CGMwE/4kFx9ARF2is5gXhKY51eHgidQkGGcVfxN?=
 =?us-ascii?Q?WjVy/CjOqSOKalvb5LCXctVU13SdnVTdFIphSgJBOTCEUOgb3fbwPrHzoVcL?=
 =?us-ascii?Q?OuPiPCCDa2KTQG5F1PfjouhcZLa242s+0Tijl7jp90n/P8PMY9K+RoIOqIHZ?=
 =?us-ascii?Q?1m82cJVN/X1hovQFaFeiF4FqDJj3CFmkInFXdG/WBxwblzRxJAdYgpd39YfK?=
 =?us-ascii?Q?wxrrPlityWwDr/1MNgKOlMFZNcw86PxDZl6bxGRTaGddOn/N7xYxd/KPNzwT?=
 =?us-ascii?Q?JeaNkbJ1QUVN6fcqHdXiYOsaJyuAitvkH+iBkHuWZ3sfVW/SS1oQccIVov3+?=
 =?us-ascii?Q?WvqqRZxwrvK++CCXVL0gUdWxvM6/dyWwTBSshV78xQP1ZRoQ7q3QRmmE34qj?=
 =?us-ascii?Q?iRBoHc/XwCIBpiYV+aAsVs/wKgdQSjzjrzckAD7VREKzLMnlH7NEFCeQGbon?=
 =?us-ascii?Q?40YVcQQXmR+IzkXH1l9RCWm4qR81HLPtzUzyIEOtJXVwBGdec7xnH9XE8Z4B?=
 =?us-ascii?Q?E6mUWwgTVdKocOntZw/10OH9KstnTOh9/qZPusjmCJM5GM4cp4ouXxpAaKJ/?=
 =?us-ascii?Q?xqJ2RXueHJf9VMBAGHff2bt+E2vnAcaDfdHTc9MH4EBmqtI0/0/GfXpuGwYZ?=
 =?us-ascii?Q?ZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060f5d87-d832-4dbb-f4ca-08dd28c68abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 11:38:55.2361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7IxiCv1Ta1pM6IlqkobbByP11MbnLwUKo9SGuFShupjmz3MegX5Sniv1s4/QmAMd5kOvVKUaHNoRsW7v+BGzsObmSrHUcn6nRM3YKIAI0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6289
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

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, December 19, 2024 10:27 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; intel-
> xe@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: Re: [PATCH 0/2] Introduce fault injection for guc CTB & mmio
> send/recv.
>=20
> On Thu, Dec 19, 2024 at 09:01:57AM -0700, Cavitt, Jonathan wrote:
> > It might be a bit difficult to get approval for this series if there is=
n't an
> associated IGT
> > test ready to exercise the added error injection.  Namely, I think the
> functions
> > xe_guc_mmio_send_recv and xe_guc_ct_send_recv need to be added to the
> array
> > probe_fail_functions in xe_fault_injection.c in IGT before this can lan=
d.
> >
> > Once the tests for IGT are submitted for review, you'll want to use Tes=
t-with
> to
> > exercise the new IGT functionality: https://intel-gfx-ci.01.org/test-wi=
th.html
> >
> > This isn't a NACK, by the way.  I just figured I should give a heads up=
.
> > -Jonathan Cavitt
> >
>=20
> Agree with Jonathan, we should have an IGT which uses these injection
> points.
>=20
> Matt
>
Added support for these injection points in IGT test and resent this series=
 with references to IGT test.
-Satya
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Satyanarayana K V P
> > Sent: Wednesday, December 18, 2024 10:50 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> > Subject: [PATCH 0/2] Introduce fault injection for guc CTB & mmio send/=
recv.
> > >
> > > Introduce fault injection for guc CTB & mmio send/recv
> > >
> > > Enable below Kconfig options.
> > > CONFIG_KUNIT=3Dm
> > > CONFIG_KUNIT_DEBUGFS=3Dy
> > > CONFIG_FAIL_FUNCTION=3Dy
> > > CONFIG_FAULT_INJECTION=3Dy
> > > CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> > > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > >
> > > Fault can be injected with below steps.
> > > FAILTYPE=3Dfail_function
> > > FAILFUNC=3Dxe_guc_ct_send_recv
> > >
> > > echo > /sys/kernel/debug/$FAILTYPE/inject
> > > echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> > > printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
> > >
> > > echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> > > echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> > > echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> > > echo -1 > /sys/kernel/debug/$FAILTYPE/times
> > > echo 0 > /sys/kernel/debug/$FAILTYPE/space
> > > echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> > >
> > >
> > > Satyanarayana K V P (2):
> > >   drm/xe: Introduce fault injection for guc mmio send/recv.
> > >   drm/xe: Introduce fault injection for guc CTB send/recv
> > >
> > >  drivers/gpu/drm/xe/xe_guc.c    | 1 +
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
> > >  2 files changed, 2 insertions(+)
> > >
> > > --
> > > 2.35.3
> > >
> > >
