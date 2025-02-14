Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C46C021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 22:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9A210E0A6;
	Fri, 14 Feb 2025 22:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnjScEnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2502C10E0A6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739571651; x=1771107651;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SJTyPwBghBpmrVJza//sp4GLHFyvHn3ebWuj2KBJ9PM=;
 b=nnjScEnRgYRhCBHtah6a6q+VVODtHOA4tR60Ufa95xkPvKbgBChpFUul
 aFX/2fpvG2JniWLGaZw4MBdZHHf/JT1Voit2edZWKNg9iWy8CdJlusQp6
 cOPx5xHZWzfM1+zPZDMCA8E2ohTw1E1daj6a/jBtIIlMhtNKENJO0vKMn
 ALStlT1Oc1AjJWTb+MOPXNkj9iGGCc8k1k/2KMxDZOgah4geG0D0Oe/n/
 UFgZUDejSQ07N/RjZjHhUBhMQElDQVT/ZrgzyOxWimpmVsEmQhfuVwHkI
 9MoHKHTdwlonYXk2K73ov3M4xfEhWwCuYS8A9KAI6Pe6NHefp3DG/uDky g==;
X-CSE-ConnectionGUID: YGVimPhyRTGs8ISJ4Td8Xw==
X-CSE-MsgGUID: jpofjpIVT269GIhg/QxHlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51746417"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="51746417"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:20:51 -0800
X-CSE-ConnectionGUID: 9+f/unDLQNOyUr1iqXVaHQ==
X-CSE-MsgGUID: tzBJ/DmqQsGOz74//H1B9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="114085609"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:20:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 14:20:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 14:20:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:20:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlCf9W223/Kuvo0VMiUoM8M2EpEt5dW/x5XzBEXV4grUYTwtOdqVV50mllehmDtcKB2hOhm+g/yX/Su3WaxSbgome/TA+DP5XXIrVcIlWkPufJQ23dHSRjTE30smWiqsWRD+wA+D/3iqXI/U1WNE5RRVGwq7II8UvrinIT7xYvAXjbk4zW8yikZ2DuMeDf5JPgcB6rak0pkmiTMi8+wiG/pnCEFzZgzdDiblJ1x05UyhWnlJIvKNZAmHS646fQU6rML9uOWkVP0IdHJxFvS6HmpZOEFPgV33E5kH8Pqmt1Z7KdVV0uOJB+01ZXEek6SWpYVBhH8ykh4UVQU5+iKFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA3BS14B1AQvLnR7FaoVQeVOxhSQ+zAuL2A9rIcmMQI=;
 b=yGMHl/0BNpFBzb4sOUQzOMvpPFXYW13OATcxz38mIqtLC+/ALP8s4v60mNYmlZfqtC1OrZYWR9F+NM38srnG6H4jZIuLSEjHem5NMbpzuLZGYfFkwsSVUycbVyx8UyY6+B37Wc5X0MiFQJrY2CQ7uIBPKsWM8z9JlC96p4nvj0vaHI4imQfjwIKUROqnWKm1kQG2lM7zWLB7vEZQx6YQ3TMn63SO2OxrQav0oIzaRjLd3HlrCWMUQweLbaGmWgz39RZ7hYSKbTMsmvP6KGP63NMD7COOWqpUlxjv52JlP66xFcsqpsHWvESzK69nea0Zz2RQy/7+7NKvPISJVggRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 22:19:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 22:19:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
Thread-Topic: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
Thread-Index: AQHbfybUloxE2ljunkK0OMhA7VtlALNHWjUw
Date: Fri, 14 Feb 2025 22:19:58 +0000
Message-ID: <CH0PR11MB5444BCA183CFA1EE115682A0E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-7-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-7-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: a4ff57bf-c8c3-4282-99e0-08dd4d45b761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dsKIJ8IPphdm0lO8c5I1uvM9ZDFaj1swD0S83a6uJD+qOd3u2OH9VbnKeiPO?=
 =?us-ascii?Q?O10SUamhvJXoVRc4XANNO1lf8uHSWet4cJ8bgtpdo7pJKeOvjyOGZoiQI+J+?=
 =?us-ascii?Q?WiRTxp0PIEFpQDklC+QtLbJHUdQJoAH5RgF6feML8vP4JwwKAnHlUbVQENDz?=
 =?us-ascii?Q?fqxM+3Fx8NMLuPx6emip9Rn80wGUP/WMVi/r+Yf8IDscEMzYeNNa4Z1PR2ns?=
 =?us-ascii?Q?xxvpTF886s/A6NPlFQgTsRJsitbI7qrkgXYklbjdpD9GCb7COayHQQ73Xmk1?=
 =?us-ascii?Q?cJNa1bmtaRd2pTXlhVVktaIB9X6Dqm1cYSsMZochfPARpIvIdPSEgqaiC6HY?=
 =?us-ascii?Q?zGvKhCjRnUzq7Hd6FP9jMilc6Z2nJbqAW5O15Wc9wg+atd7DdKAAcUgN1E4q?=
 =?us-ascii?Q?mqNuoRZuEaQtgqMWKySYWoS1Ub0SLOVjt/g1eWyqC9yWcK+QtWfNmzchIpcT?=
 =?us-ascii?Q?x5E9ZBN4BXvK+x9ntg0NTlrmPAHeDp92g/DfM4KPdmdf39OS1aXiwd9Vmg4A?=
 =?us-ascii?Q?Y5uUZ/PR7ZLFUp+OKv/w9WPWpEymCXRZ46h7ApDEoeQRCdJBO4sP0txfE4pe?=
 =?us-ascii?Q?C4uaQFHUz566a+mzukw7udJmKu9Y592XcskPLRxggQm0zLjCaCEtQ1e/H27U?=
 =?us-ascii?Q?T31N8ppzi2jjpbbWiNIq69sRc88JnuqUTWuz3a6Kz36czsXP2fhKX4pPtjoO?=
 =?us-ascii?Q?DRJVZeidabsVes96Bi4YEhoxI8X1I8uEYhFeqi3xqdwIaToptjHxM1r36UQO?=
 =?us-ascii?Q?VajvUcC/Kqn4WSrWv/7tddCPmRkadOlDhJ3Or9R5WhcATufSoD04tm9OpqIs?=
 =?us-ascii?Q?pn0Wcm/hZ/HSme1F0DORW2px5NedK7RsmwHG2PYU9BpoLMeCr6R7KJP8XG/O?=
 =?us-ascii?Q?rDWRmwgSQgmjCm04R2yZ+ralivgWKDZfP2S+xbdr5HUD+jz4l9Rb9AQoSJXT?=
 =?us-ascii?Q?pbBJaaa/+oLY6qPk86vloIMEDNpklbDwA+ZWUJAVu1Qgj5ZhKfUzRv5PXFft?=
 =?us-ascii?Q?x4RfEgfq4sItTHKSknug3jYn68DcUwO2gxAAiJAYqhocisBrVfGa1zcV+VTH?=
 =?us-ascii?Q?qWS2OzwZ2/Dhj6arXyc1e/ONv3ZL6+jDQGhU4hvmEcMbFCtNhVGr7B0Nmlst?=
 =?us-ascii?Q?ewC1x+hHbFlMZZ4HS4ch6xiNB36XVkZ3UwV9w9O172I0ezG5S02ajSS63JAK?=
 =?us-ascii?Q?uvqu1Y7nAUJzY7xa5W+tVkCTjNeDq0mdIDG0yHJjMmd4di4v0Uo9Ui1VoVbI?=
 =?us-ascii?Q?TBgq/9jPFOgmy+TdEoooYfRvoMfpDc4l76UTyns026go6SAcskvExIhMQFHv?=
 =?us-ascii?Q?8hAa29L062m0vblKlVKXDsCTQKlpHN6MCD0JqetHaGVw62fx1vI5667X+1LT?=
 =?us-ascii?Q?4rM/kpjuHrrsoUxx919qZpuK8xlQNr+aMuks/lFEcHEBYWT4xYDAV58mBn53?=
 =?us-ascii?Q?tv192yBf6+ke/Sc1mrjJSmp5oDapJ2fP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ozcze4+T09vqKkJrd5+q8Uc54pemCT7N2JnbSTbvNjTz43K9vMmYlRBBlNH5?=
 =?us-ascii?Q?X/UZQo73O54n9Qa7JKBrTsjcIojvhiFrqtio9bZYuql6cB39qJ3Lz0O37OQP?=
 =?us-ascii?Q?PrGtOCngjHr8/fM9iz22X3xajjbI7VOATXArpzJMZ53SCwmJFfK9b8EIG2J+?=
 =?us-ascii?Q?8PZecmRnLJ1xaa1SS95NMB4mDgVtk6SiYNZhl+hFLbYI2GIlnRQTYO8JwyLo?=
 =?us-ascii?Q?x6QuNRD7dx97bPqBFAtAUaJepF9Z42f2sbTJcFXRRreDgZpy+twqAoAgtBGo?=
 =?us-ascii?Q?to/WrUpXSCM8nX8y3ROsQOBh+3C/LI6v/Y+4mExCRiJLwo9rMgat+/hMMRhn?=
 =?us-ascii?Q?uWAnjTUq5/iJv4PM0FXBRzmTISI11HaAA2DLJJkbqDYUsUnxkqqvkNtcjad6?=
 =?us-ascii?Q?O2R2zeb9fLae3ZiQPrinEC6QvKMgjNjABljZx8sIXqSFiYM9e5cdPHXSkWNW?=
 =?us-ascii?Q?UB2jhdkEAH625ZNnoJ2IKO63lrZPSoNACJUNiC9MDAR+UJntIjMxevIHnTtD?=
 =?us-ascii?Q?/avWfvR000yjcT79gP9vxeiAx2rszlcIVBpSK3Ppqy1IE6NMAHbloe19Shhr?=
 =?us-ascii?Q?yX9AQU3HmXdESVFTrP3HeG1WsvC2amRXp5ZVXvzBAuEOVHX3vjbFEMDe2+K2?=
 =?us-ascii?Q?MJF3HmUTcurxNofrzMyutUplQRHTlFOFegQk0/Wxl7uCZ78425rTyIgWQ6PC?=
 =?us-ascii?Q?Dd/sx8oOUXMBmM+eTQ1whbCGmgz6Zi2WYN0h6oeSTcuUXzEKYTJilxVjNmcw?=
 =?us-ascii?Q?fRza6sxoF2gYl2vc2DkhPgDHtYOY2ksdcjmsLsfBgKGIT4ZxmZhY75DSWbYl?=
 =?us-ascii?Q?4CzKQqzzfs9+OXyfayZz7W86+NNnIh3GNEIir0qIzHsGCVMSTgTfXACMBCxh?=
 =?us-ascii?Q?4DD0YStNzrMMI9XHJ+UY1mW1/DXlAudiEtuQnlH3eVBl17igYKVxeBhZhqV2?=
 =?us-ascii?Q?HSuyF84+jFi04GoJXJ8cdw5+xwfKmubIqfmnTStdPODaHTpemtiAUTdUt9rY?=
 =?us-ascii?Q?7BmlQV61IoYgPIBrmRjM4UOlLeDyO3nA2fSEQIduVQygkOv3jV0Fb+boUBXT?=
 =?us-ascii?Q?W46Z21UfDezmbIUM8XjpB2B+RlWuNJ0jBwcV8f8U4o18SOaGiNS069xIE2z6?=
 =?us-ascii?Q?SWq9bL4suqscRvFHpFBv8sY1cfc18hrdt6kKqV7Kqd79G1q7xOq6ihF5l+w7?=
 =?us-ascii?Q?u+UZZ6Bzbl4cUSFDm2KtLkW1jYLWSOPEgm79SHTUhTqnF2/XE/+7b/8ami9M?=
 =?us-ascii?Q?3RDyHzPLUdoJ7p063hcaygh/+fevfyvuEIkJ3SsJRKtR4thQb7SfvA7eR1SE?=
 =?us-ascii?Q?drd+kQo09dTVM44SM2BSsLZc8whEPCir7c3pO10Ux/ORmVXpw6KN9iMCVeqq?=
 =?us-ascii?Q?E6pSvUkNZNciDwaAnpJuxVVeun5gPCKSVXIteNt34ABLB8eeAv2dtgAbj9U0?=
 =?us-ascii?Q?eUms9dyg14e9wsC1NJpcms9iL1Rznp9FAE2Sc2XkSyZLMMHgudPr0Lf6yiWi?=
 =?us-ascii?Q?7wiBoEpP6gIbFc8YpQR4gYUfH8pCZdXWcu1QYWM1pXblhf5OR22xzmKVAzyc?=
 =?us-ascii?Q?9GnasElEGznT/Jl2kanXhgGJ3E2y1/4qOHwAQrXp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ff57bf-c8c3-4282-99e0-08dd4d45b761
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 22:19:58.1064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFW6eQ+s/EleL60nvIdg8/S2vrdqnmKo2gIF+9YG41/dUgYIO1ogl6nCqp576UNJjFlqSskE4YSzx8nPad0TX2HZCT+Y5+/r2XxSbRbX1Jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Friday, February 14, 2025 1:23 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Tauro, Riana <riana.tauro@=
intel.com>
Subject: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
>=20
> There's an odd split between xe_pci.c and xe_device.c wrt
> xe_survivability: it's initialized by xe_device, but then finalized by
> xe_pci. Move it entirely to the outer layer, xe_pci, so it controls
> the flow entirely.
>=20
> This also allows to stop ignoring some of the errors. E.g.: if there's
> an -ENOMEM, it shouldn't continue as if it survivability had been
> enabled.
>=20
> One change worth mentioning is that if "wait for lmem" fails, it will
> also check the pcode status to decide if it should enter or not in
> survivability mode, which it was not doing before. The bit from pcode
> for that decision should remain the same after lmem failed
> initialization, so it should be fine.
>=20
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Minor aside below, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c             |  7 +--
>  drivers/gpu/drm/xe/xe_heci_gsc.c           |  2 +-
>  drivers/gpu/drm/xe/xe_pci.c                | 16 ++---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 73 +++++++++++-----------
>  drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
>  5 files changed, 48 insertions(+), 55 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index d88c0fddf0680..782ad564d0ba4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,7 +53,6 @@
>  #include "xe_pxp.h"
>  #include "xe_query.h"
>  #include "xe_sriov.h"
> -#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -695,12 +694,8 @@ int xe_device_probe_early(struct xe_device *xe)
>  	update_device_info(xe);
> =20
>  	err =3D xe_pcode_probe_early(xe);
> -	if (err) {
> -		if (xe_survivability_mode_required(xe))
> -			xe_survivability_mode_init(xe);
> -
> +	if (err)
>  		return err;
> -	}
> =20
>  	err =3D wait_for_lmem_ready(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_hec=
i_gsc.c
> index 06dc78d3a8123..992ee47abcdb7 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -201,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
>  		return;
>  	}
> =20
> -	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
> +	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
>  		ret =3D heci_gsc_irq_setup(xe);
>  		if (ret)
>  			goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 447eacb355d7c..c18c58447d9fe 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -775,8 +775,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);
> =20
> -	if (xe_survivability_mode_enabled(xe))
> -		return xe_survivability_mode_remove(xe);
> +	if (xe_survivability_mode_is_enabled(xe))
> +		return;
> =20
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
> @@ -851,13 +851,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>  	err =3D xe_device_probe_early(xe);
> =20
>  	/*
> -	 * In Boot Survivability mode, no drm card is exposed
> -	 * and driver is loaded with bare minimum to allow
> -	 * for firmware to be flashed through mei. Return
> -	 * success if survivability mode is enabled.
> +	 * In Boot Survivability mode, no drm card is exposed and driver is
> +	 * loaded with bare minimum to allow for firmware to be flashed through
> +	 * mei. Return success if survivability mode is enabled.
>  	 */
>  	if (err) {
> -		if (xe_survivability_mode_enabled(xe))
> +		if (xe_survivability_mode_required(xe) &&
> +		    xe_survivability_mode_enable(xe))
>  			return 0;
> =20
>  		return err;
> @@ -951,7 +951,7 @@ static int xe_pci_suspend(struct device *dev)
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>  	int err;
> =20
> -	if (xe_survivability_mode_enabled(xe))
> +	if (xe_survivability_mode_is_enabled(xe))
>  		return -EBUSY;
> =20
>  	err =3D xe_pm_suspend(xe);
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index 04a341606a7c5..7ba02e085b5b1 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -127,40 +127,54 @@ static ssize_t survivability_mode_show(struct devic=
e *dev,
> =20
>  static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> =20
> -static void enable_survivability_mode(struct pci_dev *pdev)
> +static void xe_survivability_mode_fini(void *arg)

Aside:
Initially, it seemed like xe_survivability_mode_fini
should have been called xe_survivability_mode_disable to mirror the
_enable function below, but I see now that it's actually doing something
related but different.
-Jonathan Cavitt

> +{
> +	struct xe_device *xe =3D arg;
> +	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +	struct device *dev =3D &pdev->dev;
> +
> +	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	xe_heci_gsc_fini(xe);
> +}
> +
> +static int enable_survivability_mode(struct pci_dev *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>  	struct xe_survivability *survivability =3D &xe->survivability;
>  	int ret =3D 0;
> =20
> -	/* set survivability mode */
> -	survivability->mode =3D true;
> -	dev_info(dev, "In Survivability Mode\n");
> -
>  	/* create survivability mode sysfs */
>  	ret =3D sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr=
);
>  	if (ret) {
>  		dev_warn(dev, "Failed to create survivability sysfs files\n");
> -		return;
> +		return ret;
>  	}
> =20
> +	ret =3D devm_add_action_or_reset(xe->drm.dev,
> +				       xe_survivability_mode_fini, xe);
> +	if (ret)
> +		return ret;
> +
>  	xe_heci_gsc_init(xe);
> =20
>  	xe_vsec_init(xe);
> +
> +	survivability->mode =3D true;
> +	dev_err(dev, "In Survivability Mode\n");
> +
> +	return 0;
>  }
> =20
>  /**
> - * xe_survivability_mode_enabled - check if survivability mode is enable=
d
> + * xe_survivability_mode_is_enabled - check if survivability mode is ena=
bled
>   * @xe: xe device instance
>   *
>   * Returns true if in survivability mode, false otherwise
>   */
> -bool xe_survivability_mode_enabled(struct xe_device *xe)
> +bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>  {
> -	struct xe_survivability *survivability =3D &xe->survivability;
> -
> -	return survivability->mode;
> +	return xe->survivability.mode;
>  }
> =20
>  /**
> @@ -183,34 +197,19 @@ bool xe_survivability_mode_required(struct xe_devic=
e *xe)
>  	data =3D xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>  	survivability->boot_status =3D REG_FIELD_GET(BOOT_STATUS, data);
> =20
> -	return (survivability->boot_status =3D=3D NON_CRITICAL_FAILURE ||
> -		survivability->boot_status =3D=3D CRITICAL_FAILURE);
> +	return survivability->boot_status =3D=3D NON_CRITICAL_FAILURE ||
> +		survivability->boot_status =3D=3D CRITICAL_FAILURE;
>  }
> =20
>  /**
> - * xe_survivability_mode_remove - remove survivability mode
> + * xe_survivability_mode_enable - Initialize and enable the survivabilit=
y mode
>   * @xe: xe device instance
>   *
> - * clean up sysfs entries of survivability mode
> - */
> -void xe_survivability_mode_remove(struct xe_device *xe)
> -{
> -	struct xe_survivability *survivability =3D &xe->survivability;
> -	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> -	struct device *dev =3D &pdev->dev;
> -
> -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> -	xe_heci_gsc_fini(xe);
> -	kfree(survivability->info);
> -}
> -
> -/**
> - * xe_survivability_mode_init - Initialize the survivability mode
> - * @xe: xe device instance
> + * Initialize survivability information and enable survivability mode
>   *
> - * Initializes survivability information and enables survivability mode
> + * Return: 0 for success, negative error code otherwise.
>   */
> -void xe_survivability_mode_init(struct xe_device *xe)
> +int xe_survivability_mode_enable(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability =3D &xe->survivability;
>  	struct xe_survivability_info *info;
> @@ -218,9 +217,10 @@ void xe_survivability_mode_init(struct xe_device *xe=
)
> =20
>  	survivability->size =3D MAX_SCRATCH_MMIO;
> =20
> -	info =3D kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
> +	info =3D devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> +			    GFP_KERNEL);
>  	if (!info)
> -		return;
> +		return -ENOMEM;
> =20
>  	survivability->info =3D info;
> =20
> @@ -229,9 +229,8 @@ void xe_survivability_mode_init(struct xe_device *xe)
>  	/* Only log debug information and exit if it is a critical failure */
>  	if (survivability->boot_status =3D=3D CRITICAL_FAILURE) {
>  		log_survivability_info(pdev);
> -		kfree(survivability->info);
> -		return;
> +		return -ENXIO;
>  	}
> =20
> -	enable_survivability_mode(pdev);
> +	return enable_survivability_mode(pdev);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm=
/xe/xe_survivability_mode.h
> index f530507a22c62..f4df5f9025ce8 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -10,9 +10,8 @@
> =20
>  struct xe_device;
> =20
> -void xe_survivability_mode_init(struct xe_device *xe);
> -void xe_survivability_mode_remove(struct xe_device *xe);
> -bool xe_survivability_mode_enabled(struct xe_device *xe);
> +int xe_survivability_mode_enable(struct xe_device *xe);
> +bool xe_survivability_mode_is_enabled(struct xe_device *xe);
>  bool xe_survivability_mode_required(struct xe_device *xe);
> =20
>  #endif /* _XE_SURVIVABILITY_MODE_H_ */
> --=20
> 2.48.1
>=20
>=20
