Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AE7C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 21:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A1210E0E6;
	Thu, 10 Jul 2025 21:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmBznZSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D48C10E0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752182348; x=1783718348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KD9RlNXmfgHYHA7VbvrhFSzlNdnzGZfTbydwVLIQ2dY=;
 b=MmBznZSMVf2iFfkiQG0JxGIXlQ2Ot0lkPB8bqqCqVuis+GzPdWm+cnhE
 SSxm+c2ELiC03bGIf7lA9vTO5dJUY3WsrmuYe7mvIv8WtrGlu4+VXddTG
 vpTXvYFFJW1/7A3w7rbRx86qnwBD6nzZlG9cOH2B8hzHfiO/tguoCdIPz
 hiInoCBmjh6kwzadZHh7mcSnQSrDdVdd9ieROodssq8BfDY2SVH+sh284
 orjpIAwcVfk4qo10mGRZ+CZtB03GUnpbCE0O1UhVugLg04D+kc4WUMqN2
 daZdrRf82PuBgH9wL20t4fHLnOvOOZiyX0VBh0Oxnb82A+QdJhLiwnNEP g==;
X-CSE-ConnectionGUID: f3aAVcj7Rw+IOtYKWg5SGQ==
X-CSE-MsgGUID: 0W34nacPTiOKBNg2LzuURg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="42110658"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="42110658"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:19:07 -0700
X-CSE-ConnectionGUID: h8KEHfi/SSOM3DgR+imoPg==
X-CSE-MsgGUID: B9283PeySHa8jklAPLq4iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156295778"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:19:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:19:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 14:19:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2kkD0Mz1sbTAdtELD8mUsWw3KS7xcGb/+VHGjNtNb6y/MT56fnIk4hwUsKqMl5+os+dAsOhE1bb08rm0Z0dQDeM6URfccZPDfNAZQ4+b003QacT7t5tDLABkUbnVQ68Xv2xq2kUL6DAfzCPsYahSCb0S6g1dqdPeMb5/BBca5AGzPSRO6z3FXPeXZ28qw793k9Gm5enRP4AVAT6+0sO2CAYkiHFPEZOSQ+J6TdR8nJoBah3H/GxX86sQmyPjyFfGZ7d+nr2ukoNoevIezNqIx9uRRzUos5qy4/o9knP5+xKwk2smP37ND0L675Ib7Yfm3COVregVH7VVdYyo2lYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOoQXM/3udAewIofpPxfevR0JERKHqYb2M3CjChwTec=;
 b=fELEiBJT6zP7TobBImfG1aUoNi9C0NgTh0Z2o0diU6rqxt8Z2COrqjPRxAsY/SMjR1sGcOwgl8WgFwMg3paJCHLKOKYXg+8B7VcAQ9nLv8pLS31kOHFCCQMXu1unFjX8fhbaalUzDKBWLopBCYUs/VwLMqu4Xqy3eF3JdqOBpiUoWFhia2tUccN4SZPAAXJIEVZZXyrBRRMZj+H9sAVWVL3aqJHxmOpxzxeHwPZFAiJJ5rVGAhmRbwMsQ+EGGfLXCL0zno+Ms7lvaTr6tlf0/iR5dAgqvK1ttyp+uCirbfYlXbZS5Nu5D9lsSQ+fvZTPciZPNwGAS9erj19JTsMi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 21:19:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 21:19:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
Thread-Topic: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
Thread-Index: AQHb8dyXaz9qLbEg7UyjnRiJIZILQLQr1q0Q
Date: Thu, 10 Jul 2025 21:19:03 +0000
Message-ID: <CH0PR11MB5444A2EE452F111723C4635CE548A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250710205413.1105595-1-matthew.brost@intel.com>
In-Reply-To: <20250710205413.1105595-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8773:EE_
x-ms-office365-filtering-correlation-id: b1559d5d-714e-420c-f5ef-08ddbff7659f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?36xYN1HcZbzrnqFFPoc4asDrU4fhAE7YZ/IMGRi0rzEktSCTVlVmswmH7Pu6?=
 =?us-ascii?Q?GMC2Ewr+Q5V6KQ2QrPkS8fTRmHcHXA+j5raE0Z9n1OuRo2tu5I0iGyyP4pY/?=
 =?us-ascii?Q?3TMMA+uOi9vNgj/dATVlN43WRNbmFN2wXD+/OnOFtWNee1hL0+zh8yBzc24D?=
 =?us-ascii?Q?mwqSZBqxbJdS8iXdoiqWV88Xkz8so3zUoQHFPqfbmoXezZuCV0eqpucPANqD?=
 =?us-ascii?Q?3arMeGWyVFiUXaifUoftopeZDRdC79F/6neWDtXYsqXybp/Uo6k9StW96M37?=
 =?us-ascii?Q?/PdBR7kF/BuFjjZ14JExe/ZBMM+zqLqDolFPXpHpUhDg1N48F31wf04QPtAE?=
 =?us-ascii?Q?FeRrOFyIgXlhd4+sWVvpTdqE5h+xTLIhDMF6LRjmWVSaZlx2haWCu79e8yyb?=
 =?us-ascii?Q?NMZ7byH2moTAiLMoOylWF4tzA9EdxZ59fIzjKIT+RKNRnP8KLPKGZYgz7nsp?=
 =?us-ascii?Q?EzIVg0d51iDKcOhA3cpu+Qy0s6oe/8SXhZX+ZeBTMdeg/xXreDoA3gIGV94Y?=
 =?us-ascii?Q?al/1/L5t5ol2qmIiTC6wgd+6kEOAv9tLoxtuDvjDZuouRnd74Ee/uu9s3g23?=
 =?us-ascii?Q?URUcaxzAF7Vwa/4b7I0hDiUVAEFpfkhyWH1RBR2rPtK/+A1VOHgtHVNhZT0q?=
 =?us-ascii?Q?JtDtTfOSNiQ61rNDQwVSFSveSM5BYZTDTHPcskbKkKHtyLVWMikB2n1kyI9M?=
 =?us-ascii?Q?pvSy6ajk98WbFdS4TDCgJ4Hgj/09wT2FvYN/uj0MervW20KWrQrwR5U+GIqd?=
 =?us-ascii?Q?24f1qq0BIKYvk0WRRrLuKqWf96E0H7XHn+z78i3LHd6ChHtU7bI0QgpUpEmJ?=
 =?us-ascii?Q?+Fb6DpfSq14ln6ZV7cgABjQ30SsmVzO9Tvh8nDY33mvrhgbgsVBHgjVAhLpl?=
 =?us-ascii?Q?sdDAFGcQtTbsekvD/kPzC3VwoBEKDk/jFohVndJrXpKnskDKzWNRhQh1q+lh?=
 =?us-ascii?Q?5p5kA9TItQ+IYCFuSKfmfrX3+hoPsO+cIpHtofOURx7PWYC7y+XnZ3T1ZdNG?=
 =?us-ascii?Q?Q+CYOsrh0NINZlQo4s9DH8HqSHn6VqrxrKSx3cGfzNkbPd+cVxyYlxi2WJv5?=
 =?us-ascii?Q?1PcXD3q9I6gsY1DIHTjqGQAAdZEfJkAXTHJrEm/ZN8ZsgV8ApnKlQ8OBZ3SX?=
 =?us-ascii?Q?XId1Cc4fDSlRSeG4KLLKyfFk3qDIMWx26c5d0rkTRzlog9sud69fr/TXd6+f?=
 =?us-ascii?Q?rql6D3UOelBhnbh5bizGtYFGVJ4eqCbNiWlpZQp9Xsrws9kkyTxfaC44Dx3m?=
 =?us-ascii?Q?V8LOiURyFJDxtaST/rrn3MKNTqXwitahAu0G6AVrixUuepnauw7Zn50Wa3rE?=
 =?us-ascii?Q?wY7SA4D5EK3tye+6pszejM7VFZl9ZAMd2LhSWjsyZad+Ac1zJBCraQrexLlD?=
 =?us-ascii?Q?FEibNVTI+G8riWLvWRu1i1/8ve+hpk7deZvg03z08exKviE48A02SgoVEBCe?=
 =?us-ascii?Q?o2wdruE3oxpUvlLkH0iLtRR42H7hO9+I68C8Rko1ssyK93UxxItjqg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vIrxUiOf/R743/IgjBCV3UQ+Sk+cwWRBvvbvMoQs0LE9iXP/LNO3++8qn6jV?=
 =?us-ascii?Q?b0z2W3OJ+4AuDioNXPQ3Rs7qPSEcV3EYGjf7TEK4y/TCe5wdw92UOoONlqv7?=
 =?us-ascii?Q?xOjEggRz3f/BiGh56ssw/4SzHBeYE652/pQhWAqmUX2ZC6xUL6uTRuieNyt9?=
 =?us-ascii?Q?Tp68GEnIE287a1B19VblwZw2BibsCfDvF/YYtZ9bH/gFawGF8OfFhKdj93Fr?=
 =?us-ascii?Q?wu4FwaO/Et5GPUDXHZA33a1wamm4cWOKYswgUxeKTzRr+SzMsfPzgvTgsTWF?=
 =?us-ascii?Q?JPTOxjW9CFQ/9CK2skaC7mXo9iL5EoMzVvNd5/oCxhnrczRR6Wg+3u4Q6TAu?=
 =?us-ascii?Q?atZs68Uk0AUhOK3j9pii8wRrTvW43xA3ur5uPuYPAqptuYBLGunkqSLU44Bf?=
 =?us-ascii?Q?86CNyFQ+QUuTJAjUFP6KAJzEp4sfhRp3rvRhF1YqaKZX2M6UqyNFj6VZPJMF?=
 =?us-ascii?Q?0dsDgUE0ohrr0nLDM6WAorb/7ecCBohAdi3YN8dUvXCKoGIVOj4cm37D5eHF?=
 =?us-ascii?Q?Gg1xkFnyb77rnDXY4zeJFTGs+EXzv161p+NZHYdJc4rhcQx1UB0jtxfSNyrI?=
 =?us-ascii?Q?WbDpzMyWJ0MWosWDSk2zsDrSrGvauj2nbPYf5WSJLFOwFUAaqlAScYchaAsi?=
 =?us-ascii?Q?U4i+CSuzsmgvUkaWeR3GwSeC2wrK7bLVNA4OYbEpoCT2aMoUXnhj7GiOnvzv?=
 =?us-ascii?Q?si09Jidw+ZpJZs/nQJ2H9zxGgGfgqpz2mmtU77sb96agrNxnJFB3yVHNELBT?=
 =?us-ascii?Q?eq0ddXzYdtm/AL2pDQvPHSebsKB+1IyBO8kKbnQCcsxuUjsssBDllCxfhkkF?=
 =?us-ascii?Q?pKKZPm7DhLlEDiiDG24XBI3KCvgartYbkvqZIKFCaIBdNN0GLERozJxpa96T?=
 =?us-ascii?Q?4N+ExtPODU6S6R+wBwvMASZiBvgqya4APTMOE3nqja91Tbhke23Ff0u53XHA?=
 =?us-ascii?Q?8lBV7OiFX1A7wNKZHCuOvwNIlrkohMH9xuMnAtuxUIRTfQEBj7ZqIpg5tuNE?=
 =?us-ascii?Q?UjYL5cpmDEWjSKA1tN0mfPgE+kjjcj6HGNqfx2TaX+CKxl1eHpzUwF52eXYG?=
 =?us-ascii?Q?pa0EUXanr+OIO+LiPyIBkIYI8Nox+1ZlHewallI8ElIP6tL8Hnc89UGNOWyZ?=
 =?us-ascii?Q?dI8oL1uyQAblQb4XTyD72YWL4eX/Vv64lDbfrjLIWBIDIqvmYv8spM7Ld0Qy?=
 =?us-ascii?Q?csInjp/A+Il1QHUPnFGigj5WF7oL2QnoQYhpeMNo2Xz4irk2go2A5T5QLVF/?=
 =?us-ascii?Q?rq85uImYlQ8SqkWjl71fEaQB4GYJ5cR9r32i8iRQNcCE45twZEch0whVbmqX?=
 =?us-ascii?Q?nlR5PHnbclEFrbrVfZwkYaCwZNRQ8F/kibYePwo/920SF3bssVRHqdlRlqyJ?=
 =?us-ascii?Q?AKprTqM83Tk0/tHygN1XMpEypHV14YeMdSzA+iOJUZuc9MqRSlqsdkHR+q/W?=
 =?us-ascii?Q?f/1V4+ry//uTyfb2qk4pXIenyDUtMRsrpelW4ULKi3WbfDKzpHvmh/Hu1aTT?=
 =?us-ascii?Q?/vmFezHfpuo0GgEuNeRn3arMGsv1kAX8VDhinRIqtZF0GcMZVytfM57xP/6Y?=
 =?us-ascii?Q?dQPZgfof2Q+DEbcxrKel2nFZXMZz9PwmMlrJxSpjUOrcRJi0VlVIevmCYf4n?=
 =?us-ascii?Q?UHySThM2Swce5xkq3UBNBwMP/su3i1wAmujF/KY+K7Jw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1559d5d-714e-420c-f5ef-08ddbff7659f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 21:19:03.8976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYRZQFGPImNUPzQwlBgV4fRtsZfkfMIQ3cstzs5gAncCkiiOFcvPLqTKTGE09Zq3JPMlcAfa5hdxTkpW0fU23dxzs9wd5VgXsp+umNkqc4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Thursday, July 10, 2025 1:54 PM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
>=20
> The prefetch code was referencing CONFIG_DRM_XE_DEVMEM_MIRROR, which has
> been replaced by CONFIG_DRM_XE_PAGEMAP. As a result, prefetches were
> limited to SRAM. Update the code to use CONFIG_DRM_XE_PAGEMAP instead of
> the deprecated option.
>=20
> Fixes: f86ad0ed620c ("drm/gpusvm, drm/pagemap: Move migration functionali=
ty to drm_pagemap")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM, though I will admit it's a bit weird this didn't cause the kernel to =
fail to compile
before, as CONFIG_DRM_XE_DEVMEM_MIRROR doesn't seem to have an official
declaration in the code to be referenced.

Maybe that's because it's "just" a config declaration?

Just thinking aloud.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e875ea4658a9..2035604121e6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2380,7 +2380,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct x=
e_vma_ops *vops,
> =20
>  			ctx.read_only =3D xe_vma_read_only(vma);
>  			ctx.devmem_possible =3D IS_DGFX(vm->xe) &&
> -					      IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> +					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> =20
>  			for_each_tile(tile, vm->xe, id)
>  				tile_mask |=3D 0x1 << id;
> @@ -2887,7 +2887,7 @@ static int check_ufence(struct xe_vma *vma)
> =20
>  static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  {
> -	bool devmem_possible =3D IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DE=
VMEM_MIRROR);
> +	bool devmem_possible =3D IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PA=
GEMAP);
>  	struct xe_vma *vma =3D gpuva_to_vma(op->base.prefetch.va);
>  	int err =3D 0;
> =20
> --=20
> 2.34.1
>=20
>=20
