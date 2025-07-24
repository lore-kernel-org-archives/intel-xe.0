Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA666C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 10:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33E310E148;
	Thu, 24 Jul 2025 10:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2t2zUnh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657BC10E148
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753352094; x=1784888094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DhYODp6Q1lviBZPcE73yF4MFiymaG4AJfygKbtumpeA=;
 b=S2t2zUnhbbsGRdyiaPNV/w76NCO2Iw4tm5kOIdi8E2JROEdhF2J4YsjI
 glszOMIhZcUoOh7Zkwv/KHKIuhKcrU9PkAFz5YUiBT058rLu88Q7vvaN9
 utsLGWDUfhJH6BJcthvrZzplLfL2MKSMisUJ3rBRGG3GyLEOH2My4XmeJ
 wZagIxGcCMWkU3T2XfU4RR3TG2CxHSe5L+PCeegcQd4eTkmCNa9kUscEy
 Q1VecLFTN4MYuZXyU1t6fM7tPkrbKQyC27fJakXtz4kP5KIgoUlTg5da7
 9OuViWoSfKzkSFOrDz8J2EIoOLQkzwJMw+amSB7IJsDUC6MQMWtK+gu2M w==;
X-CSE-ConnectionGUID: u8dXXrgQQWmakpY8fVD6BQ==
X-CSE-MsgGUID: tsiu2LC9SWWcC3jxfzxQcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59314937"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="59314937"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 03:14:53 -0700
X-CSE-ConnectionGUID: n7nnkWl3R0KMqeK8zpCHSg==
X-CSE-MsgGUID: crx34C9IT1aG26Gj9y5nBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="160127706"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 03:14:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 03:14:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 03:14:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 03:14:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSGQGkW1pfi7LaDyrr3aNhxrU5aoOGzrKX2CH2vpIct1kAyo38hwlB7CsMxnFvj+ADy5wx5TZ2rKl06Y87zDVbxXXkzlwJNhcSprqzIwYef/i19obFFSUOTOQMwBHG+nccXLtGE2WvCc1303FF89jO7nTlTrzF5eIrXZxHyOWukImfbRV6dUh/aN2m1p37VbTbp9d5FrNAKCTXNA/qlAz6qW34WwlTwfrOxhhXZNnkBaFf3j+3gsHrw4Qo32lQyp3S0X9InGqpG3wL66cNDosTBM72DNe0OuZkrEcrsmi2ypzvZOSQGwZ7zvWcCqGZ34IguXWS5AgdUpygb8b6rDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34bLCHuJoik8BDlk1spocTVf7aKjkcTCxR88wMI2rVk=;
 b=mLwtl7IlfPldeS4ZZrGW43JakJXV/7eu/qI9pwZP4qW78V+zuxNg7SpfX7FY6LAadc/WGWGMiKQkXjfqT1hQs6V12kktIwiNC5BNxdHnZ/q2FDHyHPYtoEcGKrzVMq8RBFrwAl0DmJdnW7kup1iOM/mnv6tcUa46BC2InI1Dy1xLtaOD/knsl9y0Unp+N1jOW8OZRbeoidnM2GTdGEngQlUDmXMR61fAnBXiryhR6oMMY1JmTQFWpdnHLolY+1jfAlKYXJT1kRO2qZ/YbPrEM4xVrNIngc8gQnyCAl2lQ2j+eYFo+b0tW8z5cWbzhwEf2NFyg4ChQxNspBidFgwQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 10:14:09 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 10:14:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
Thread-Topic: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
Thread-Index: AQHb+9gzQGqAcec7rkifY430OLWQCrRBD0oQ
Date: Thu, 24 Jul 2025 10:14:09 +0000
Message-ID: <SJ1PR11MB620476B175FECA4862219CB1815EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250723141039.3848390-1-nitin.r.gote@intel.com>
In-Reply-To: <20250723141039.3848390-1-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7846:EE_
x-ms-office365-filtering-correlation-id: a44c2002-fae5-4682-643f-08ddca9ad465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wJWsfQ//wbv1zcZfgL4XwlLArYWHIxXaIV1P0ERinMBMJDXDYC4tnBA4hFOE?=
 =?us-ascii?Q?ZF6dorW/N16NKreN6eV39yOGd9H4lBg6PRZ3T6fbAIRKFxIz5XY00jYbIJ4X?=
 =?us-ascii?Q?SUmumeA8oAvDhDFrsqsrlFUchNr93SWtLH0OnTeLopKHDnfjbU13dl8mDtP8?=
 =?us-ascii?Q?vxajvZUmCpgYg1zXVAKqDGlBsW+/DBbaqP3jmzAAAfaNIX4ZNXEsJTv/C1O4?=
 =?us-ascii?Q?qZJRNc9FeWunFm06DZ0DMWYYF13sfPNht2XlX+hEvmqw7U3dCGgbabvcpTjg?=
 =?us-ascii?Q?ThzdQOn3WgPCMtUVSy35VEXnn8LcZh/RdAghLsHJJoTtNcfQ7MHdjL753KDp?=
 =?us-ascii?Q?vroYdABasUW17fQ+0ip2NXLh5uKINLa56EDKwcI9/QdUd6okc4Hi2XkBfi0o?=
 =?us-ascii?Q?Ls7ASefIdO0gvDpZSNSYeKWT/uNuBYud1jPGdjgGce0ckaVtLWMuXb/ztTaB?=
 =?us-ascii?Q?5Gz827MRcVatxJ0odBMOy4FaokDVbr/32axvj0BTe1CU5hQ0oxWdZs8bMuig?=
 =?us-ascii?Q?ftCNf6kSJOIKVYry22P1BATfeVN+tV+m6XD5XhW+T3R9NSMSQWLcdqjZ3cCB?=
 =?us-ascii?Q?y0saUO3BDMyy94UlXrvu1w2PXAPP78ujF2f/X+A9ss2q/Eq1gho/CCEUrvOf?=
 =?us-ascii?Q?kb0/jf1cP6rcK/kZN3Hb6ECmut+6112jaVohIBl5rN7iN2Qbynl9PN45Vhyy?=
 =?us-ascii?Q?nyCvbeN5JkxMigKi6KIV6HWlNMdpbFNAYMzMbz0jg8Gd92+tajWp6q8M0xkZ?=
 =?us-ascii?Q?59zjrybcXkJMcCdIiJcJedDBJmoJCEmbSm3uXmXyl8bp1UFAC3ckdouUswcy?=
 =?us-ascii?Q?NMj8S0SBctZe28YwW7bcr8qzyUtFiqPj+Ub6qCsvaobBZP9feAf6WuLkMFoU?=
 =?us-ascii?Q?dh5LvUkmxLI0HXW3B+VX4TiGsTP7l5+YiH/u7BY3W50VGwo5wpuy84UGU7Tx?=
 =?us-ascii?Q?/E67OFKMfsfQTH0M65sWe6Nsjy4r1abgebQcTE2CNTARgUEH87wFXPA4rMVO?=
 =?us-ascii?Q?qUHOnJ20EapUOlFbGkkzbOMeiigFbNw2L0Z9SW9fH4TutrbPiHg2/tqBsdP0?=
 =?us-ascii?Q?nCxX+s9A5I3hlWU/q3qLu1Cweo42msEhJnN8Sdiuv0YuaZc4AWPxip62UzvP?=
 =?us-ascii?Q?rf2HesSvXjTCvCMKOiCOYr6T7RWjm3dbPOFtdbvD+ySbQOE3Xup1MN21r7t2?=
 =?us-ascii?Q?1kCs2S23CwNaE8wIg5JbP/qHgG122x0Oo+rZXUoswph9G31Jugm0gd449jvE?=
 =?us-ascii?Q?q3WBNw9jIBFVXeHDi6pEHBmmB3eVPS+zCGSmPh5qVZsHRw8V1HBFRJsAamLV?=
 =?us-ascii?Q?tuGE7ndqURyyEWuyAfYeze3IwLYVpypT2unUB6hI3XNJ1jFk2ElxTfm2txHC?=
 =?us-ascii?Q?bdWTGYGled2Ac8G005IbCNsrHyKl4au5wGRZhUqhOY2wXVG6Hmf/nenz9ocp?=
 =?us-ascii?Q?cDCZSC7vbcK4uwwVAVuLKY7gWVIUqCzgehVWRQEguKZStHw996tTLQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EnJRVdBRbCRGrc29qCMzq1S1OFgTyuyUQr7sKnpr/12sP4z1GxKqCb5poSRq?=
 =?us-ascii?Q?FFm1cfOinW6+YgfAP+1g5+5oQ7ferYPQ65eDxYtmj8lyZ+kaYflo/xrI0krM?=
 =?us-ascii?Q?cjXy8Lutia92d+QQplv8NNUwcRdBP5OEemiMnyqBoytY5sA6G/+ZDES8fyi0?=
 =?us-ascii?Q?DlVH3HwWBorftYo7SKVbJCrFzfnNAvjgQYEO+T0UaYd78Xmyj5HAhWEDGN+o?=
 =?us-ascii?Q?3JzlbkHM3UmruTcc71sPK6pcpk1t5VuSUIooU/wM9Tl/nG3Ne0aZF1n9ItIV?=
 =?us-ascii?Q?icUrOFj4WHucXz97xBoqxW+ImY6iKkaOahgD8ZPsCUNV6/4fILEQMMMWYO7U?=
 =?us-ascii?Q?8Mfz3E24RqZlr8XrlgR+800WIFsLtnrx/hP/zftcGTSIfAptUVHIP5DuAljY?=
 =?us-ascii?Q?eZ5Bdy0+fqObZtt5QiA50QSiNuHFPyna6Ku7VzLEaYhbumKNlUAcRYXY1rl5?=
 =?us-ascii?Q?bFdp+1gpKI9taDr3nvGlh5HFvENE+oGavglf43I9YqTokrlAT0Qi0fiJNwfm?=
 =?us-ascii?Q?2bECrYIR1FEj0woGhC7GL5yW1rI+o+C77WiLdDCPF4O1/VAJLA1RxySaPG7O?=
 =?us-ascii?Q?XlkbpCZOnpD8zlObN7VyhCvMhoYYSrKn4UZJUMYKXT0JT5GiCkRK21Ee0nNT?=
 =?us-ascii?Q?GO8sz+iAP4keQueFr/udk9pVRjmuRAyYT0seWqn74hqaXLGsWeXQwg2NLaf3?=
 =?us-ascii?Q?lYP9xQVDhJP5ktiG/zu+snFcqeDv1ky3kiY3CRj4eX70GkNL68SRZ0Zeoepn?=
 =?us-ascii?Q?KHJyEYTPq6weEy97RNtuogo5Sda4aAGElqxup+8GBJ8/8KuPQt+XrEMHEeYl?=
 =?us-ascii?Q?xOUx7xoDMHIfqcDef3AVHmS1rMiFXPWQKoXnCxXdmavDKiZWT+ccKJHBO+m6?=
 =?us-ascii?Q?z9s5lLxjSXM/LKlfhPmHC4b+0PW5i2lHRa8lIWFcWPOsmiLissGUwDv0+oe3?=
 =?us-ascii?Q?zmWv3CoXMVDPPUqlpfsOolM/ZMTgwICiQX9gfUyKyr/j23iuJDbR4oMM+sOU?=
 =?us-ascii?Q?gVBrG5tzfVVadEAxEgMmU55W4HFUnPeGBlOVAfs2HtxvzfDtf7jmtA+4HE/d?=
 =?us-ascii?Q?W96OVlp4HcOXHCKKJfkxXAY1tSOfF4zFJz+BYww7oyfTTPDCNBlIzCgWRibV?=
 =?us-ascii?Q?VqKfURGEmTKJ5/2Sdjl46bhUXfy/ExMSLIMzyzDRNzBRnTYDRyaejIIj15St?=
 =?us-ascii?Q?i5MeGtmsAx7Hw3gkc1dbokxkgl2ljNOgUEXfedIM356R8Eui9Rqf7GTsEIUy?=
 =?us-ascii?Q?nc/kARgHEXhh0BZZ/f4xm5fxN+JBYBu3AGqc8PSPLnWodD1X2LxJ4SGAEQLG?=
 =?us-ascii?Q?ltORMpgImArScWXTs/rKBzwEBwjZn+WHBC72SRguawb+/cxNy19erlw2tI1m?=
 =?us-ascii?Q?Ah8ShXtsXo137p2rzD4Y82VXwieutXTV83y739vEyDF8VZo2FXOo0XCQBdx5?=
 =?us-ascii?Q?q/VUzZf1SFUQI0EO+dqOTdLLYpgV5fafD7YjioT38DZEGz6LU2eLl2qbF7lo?=
 =?us-ascii?Q?MMHcHFwrm73WxnU7unkELJ8ZgKA5Dj6of3qCaCYVCkOSNEgKXnIJ/+XB0x8m?=
 =?us-ascii?Q?PrFq/Wmqq5hzOCJrfhtKo6g0VdVd3JLWHEBOqsJu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44c2002-fae5-4682-643f-08ddca9ad465
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 10:14:09.3135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFdAn56OOl09hz42tJSKz4abhfansA2ycZAdGl87bOyqXGKauujd4mgSJAYwCuyTN0c+AHf0cu/4LvmZqU7W2D9zJKXq8kwbOOmzXLdBnuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
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
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 23 July 2025 19:41
> To: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Gote, Nitin R
> <nitin.r.gote@intel.com>
> Subject: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to
> STEER_SEMAPHORE
>=20
> The register at offset 0xfd0 was incorrectly named MCFG_MCR_SELECTOR,
> likely copied from i915. According to the hardware specification (Bspec),=
 this
> register is actually called STEER_SEMAPHORE.
>=20
> Rename the register definition and update its usage in xe_gt_mcr.c to mat=
ch
> the official hardware documentation.
>=20
> No functional changes.
>=20
> v2: Add Bspec reference (Tejas)
>=20
> Bspec: 67113
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c       | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 5cd5ab8529c5..f96b2e2b3064 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -42,7 +42,7 @@
>  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
>  #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
>=20
> -#define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
> +#define STEER_SEMAPHORE				XE_REG(0xfd0)
>  #define MTL_MCR_SELECTOR			XE_REG(0xfd4)
>  #define SF_MCR_SELECTOR				XE_REG(0xfd8)
>  #define MCR_SELECTOR				XE_REG(0xfdc)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
> b/drivers/gpu/drm/xe/xe_gt_mcr.c index 64a2f0d6aaf9..683ac021a06d
> 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -46,8 +46,6 @@
>   * MCR registers are not available on Virtual Function (VF).
>   */
>=20
> -#define STEER_SEMAPHORE		XE_REG(0xFD0)

Not sure why it was added in here.

Anyways, LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> -
>  static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)  {
>  	return reg_mcr.__reg;
> @@ -533,7 +531,7 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt
> *gt)
>  		u32 steer_val =3D REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
>  			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
>=20
> -		xe_mmio_write32(&gt->mmio, MCFG_MCR_SELECTOR,
> steer_val);
> +		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE,
> steer_val);
>  		xe_mmio_write32(&gt->mmio, SF_MCR_SELECTOR,
> steer_val);
>  		/*
>  		 * For GAM registers, all reads should be directed to instance 1
> --
> 2.25.1

