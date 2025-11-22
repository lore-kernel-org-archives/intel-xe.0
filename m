Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86ABCFC518
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 01:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA2A10E043;
	Sat, 22 Nov 2025 01:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIGJwcon";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DE810E043
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 01:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763776683; x=1795312683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AZhJyeSrdAHgGl0Ub9/7jhQZ32MlsSHGFWUY03AHB9Y=;
 b=WIGJwconwgso5q/q3EDaoCGBdYc9oUGy24yz/H+yiQB3cck88zb4jmEp
 Z0T4elgKoJmkzv9X1UOYLH1epNqiP/r5sbxNO0d/pHEwAnCHhmXvPLPGy
 zLF/+moOnmNs/szPwkHUcxmqtHByMQJhdAhXm3w4WWfNFibAEsHgtPiqa
 7FMlzP+V0LpEpNkkn/KRWx7zs4xMbwmT2zlibI45fhcRngAID1/TUIJ+E
 0cdstv/oboFTUpwwDxgQG0/XuvHU2YGeVtKSL74DxR90Sdj/rV+ZgVFHN
 26AZ9c3of1KnA1pd4FfV2Z9SNp9q6Ajcm2Pv/9JajC6ob1NxBymmwGjUd g==;
X-CSE-ConnectionGUID: 30G/a5CQTEeCZptrnMfL3w==
X-CSE-MsgGUID: O5yQN81TQP+dgAMycAHEyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76484694"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="76484694"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:58:03 -0800
X-CSE-ConnectionGUID: q6quhk2KTMyqpQ9QhnjXRQ==
X-CSE-MsgGUID: m2J++Nj2RZ+Z9CYkyXs9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="196128811"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:58:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 17:58:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 17:58:02 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 17:58:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=op8dV3fYd/XTVyXJWf9oxpcPnXepVXE+YvjlMDcdLdY+QKA1BS8Ly7fAJco08P/vpWykB2Ad+HaFItoPQs6XnVDmFE/4nZlV4crKQuIKT5jDe8mqFsiwMuCLYnx4s67wnnvj6m81eDuPIYmpIyTunD0Tvpsvm/ePV1GyukmKrfv9p9Y8sxlp/8Ro5k9ApLf0jM1hezph6G7kkBL9wWjafez1c48L5sH+kyzkhmKGlMKIF81W0kKm854/ivp73u/diMhy6wYL5ge591TyCnyakPhebXE9IQwTihZqmdZ//i5/UjqdZ7ac24xnrn/DiygVF+IewVOE4Oof5QAmRS/ecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPY7S6K97hmlodXumkw4ZQlmNXegD1clnFfR7K3LiFw=;
 b=g5rPWNz/jUFGQcZ3mfhjgJVJLaaXAy6m0b0F3ud75kAsRWbqSBGOdlhCepSH2l9i+ft0vtKu+VipPLxD9drHBBt/iGVHPLs4pG/3SHtiommtjKCvDqJqINUENj43l0lp3kSsxVZyRVibwODKM2Blp3EnLq0LBhPefe2Go0bZbDW6Bp3+iT/SAYE00fdv60sVuC/mA9N0cCE2gxoFKtyS7a38xES/gaGm7oeef9pfLCtXpBQ9VQx2nSBr7jCDP4UdW/WFw5fJv1yS2fFIHO6yW1AVqRuh0Sd7epX5LWaBS4acuTfGunhs8ItbXQgaFnUUK33QvdPlKmz04jKFRj5oTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 01:57:57 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 01:57:57 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Topic: [PATCH 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Index: AQHcWGqhdmF0jhHRK0+peF9Ai1dOPbT9vI0AgAAkPuA=
Date: Sat, 22 Nov 2025 01:57:56 +0000
Message-ID: <SA1PR11MB8839882A2300E2EECA405A0CAAD2A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-12-brian3.nguyen@intel.com>
 <DM4PR11MB54564110FDF041964B4411A8EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB54564110FDF041964B4411A8EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|DS0PR11MB7788:EE_
x-ms-office365-filtering-correlation-id: 23dd01bb-3698-423b-aff9-08de296a8ead
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?SWjIPNOZ2KZj0+TfGTsEbkJamrlypHBInpmC2vLbnSX/1kWHhd1BXdOicipR?=
 =?us-ascii?Q?61tp5YFm09AkOj9FwAwVyyuv7LmKxr2Bkwx4FrSUakI9tHkzcPvT36Kvpv7v?=
 =?us-ascii?Q?uR7HwmEKmp8WmcFzQb8aUE/5G5yhIV8o1FDgoGMHybnAuUIzQW4ySkECEZRJ?=
 =?us-ascii?Q?pCJHEnIBMi/x++SFF2shKEwsBDRexKcOxxMeQoCmepw5RpRQuqbKDVBEoNih?=
 =?us-ascii?Q?azxbKg9VMLuzwhix2z1WsDSX5HuZUmi1fLJU3JrUnzoIIwRFqI4L3gSgaK1T?=
 =?us-ascii?Q?x6FRyfZDaYVTMXCoCx6anaNjTDXt3NkK/GY26t7Con416iaiBvo2JN7DKCtZ?=
 =?us-ascii?Q?gv9TfsPAzSxyRguvHD+Fy5kkayBhqrKmCZOWF73KKeGU8ca6JHkZdDJrDnaC?=
 =?us-ascii?Q?hVFWmKA3CF7oatPkI9gPdkrTLgZoioDyyZg2eHKdPmLwSsk9C3bIEfe4YDT6?=
 =?us-ascii?Q?eV8DY39ZzN9PQBD3n1vUCze3Ewn1870xATgRRZq0I9Yc9S3fr34rxDoD5C5C?=
 =?us-ascii?Q?uDa9TVz1CHIqLywU97GHwNnTiekWJ/+se8iAMjRoNn4OiQXJVVtua+QmEj9P?=
 =?us-ascii?Q?4K5YAkieuqoBa/I7RwqbcS6sYDMPrNaDMdqsDd3SBWzl64qRL3ZjxZiuqVdw?=
 =?us-ascii?Q?QepjVW8aFWc8SP8Jg8MefEUEysuD8TiLhBWt3CJk/nrCf0hwZTuwcbsho5ut?=
 =?us-ascii?Q?E+egfmtWl38aB86HreuxC1hIPRcFdWpyWf/uXfmpy0q+zeFr5kMHK9H2Wg/P?=
 =?us-ascii?Q?DKvL9x/NvATQPXFbl9Ccshscv9yXMcYUoi2UmvQXEd5XjV8FSdOwa3trb9AE?=
 =?us-ascii?Q?nWuwtP7K15scVMk2aP8iLPY/TbHsXjTAQN8/E2UKrD85pRAHWAZ7WdMnRmu8?=
 =?us-ascii?Q?sgJgUGB68NOZ9m2enV5mavehlZACulc7GWllE+LX6hO/Ww6sjCxLRg0tK/35?=
 =?us-ascii?Q?e0HbEk3/zVNXwh7TX1phs7bK6mjgYl3TpjCErBWPWaBidDIyP4sYkubESj4i?=
 =?us-ascii?Q?ReUcudB7RQvQvo9xB3JmzB+w//xvdXC3zM41jnWTWm9xUXPVGULe0qy2RqI8?=
 =?us-ascii?Q?dQsdlzPbn4QX9qNUvkJxWQrbiwxMAkIzPPODbSvHGEXbaNmVzOD9SeyfH7hB?=
 =?us-ascii?Q?YWMny8CLp22nd18GwCdfihFXG05FbNm5JP6XtcnMdAkG073bUF/rNGsXdMXf?=
 =?us-ascii?Q?CK0pQeNZZUKWUdG75bTTLb+U9TdprE98UN5skW6/nOwXUI6TgkdUFBQmDkCi?=
 =?us-ascii?Q?ulSXNPmgcQS46I4pUJO12ZxWncksehTrLUXC3ijw4JbpFZr4oVUB/wtTVWks?=
 =?us-ascii?Q?seg5UoAoExlOOdJJD0hoqFPICILNGpfC/jC+6/apasb5OE27ldsMCvcm1gpU?=
 =?us-ascii?Q?NDNlIstV3p9JYiQWs3A7Q/qYUSeORQpIRyayz1TdJ8w8ASVpY3Bub7a6/7Bm?=
 =?us-ascii?Q?4a+jxf3KxlWhMUk9SnUcGXI+DEwoIzz0NQpm+343xkKB0MA4PPyGCez36iYD?=
 =?us-ascii?Q?fnoP7QbR8IN5FE6lTNR1nFgtcqRm1gYLbRi2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4OpI+M/21JcZIo7FdeEztk9Ar4C2Zqtz/pmlMN3/ueHEVVj8S+hvG8amTxfD?=
 =?us-ascii?Q?EZ8JxoUptJXuIfgjwAjCEHg26C1+mI6aQvtGSaXw4HgpxKYjPxhSy7D/tFSO?=
 =?us-ascii?Q?hWnnyp1C9JmvTQXcJsoJF1MtW+OIQ54D17ltO7fb72f5zsvrHy3+H3gkQFQF?=
 =?us-ascii?Q?lSXBU2sfnfJXW9Jfwt5AwTvZt4XkM+L1UcoXsI0kvTFxTUP1xNt1rTpqt9Gu?=
 =?us-ascii?Q?Su1CZiZW6iEaP2Al9EpnZg+LBDp9msSQphDzZi73x+Z5mqEVvu/L23RK6J1U?=
 =?us-ascii?Q?YLfGO3JASaKNP8D9MYpy0+Z3QGG1K5qeq584wYtggExk91kTx63BwWunamYO?=
 =?us-ascii?Q?ROkFnIIf72/VePs0gAlByTFZtDNIwEV6wD5naXbrO3EY0taq5IrJQj8maB+E?=
 =?us-ascii?Q?bqTkBjNj8bytCbO6pXwIKQLJKqaxpWuz0vwf94OoeEiXewnZld2yL7nnzDPo?=
 =?us-ascii?Q?K6jNV+z9Tg4JiZgJo93ar2Caemz7GmhDA5JYaapv1x8eYTPATtk0nAicFNE4?=
 =?us-ascii?Q?xvkiG9kmPaoPjFtHhCNM1pida+sfrfny8RE0kQjNgcVy64maX8/dLHQqEcS6?=
 =?us-ascii?Q?RZjmShLBWM4lKTH4tSIdI0tbieJk50wp68eVWnh5A+EoFN3awg1drf3ZaSkM?=
 =?us-ascii?Q?4HwRsQV0gf4I29vPgL3GqxSPPlaT1vpIs0Inx2cqWkm4QD+m7Bvyhj7kcclr?=
 =?us-ascii?Q?/zLOB+R5VW7MuJIvHF/lKSsComhmktSnIMOxwoDDilfd0XrkX5XjECEADIwh?=
 =?us-ascii?Q?huNDyqhUnk7QMN3qjpX005GatqPobghwZzmxbxuYIllxooyWk72seWuyNVEJ?=
 =?us-ascii?Q?iwGDeZr97L+ymWFOMie+M8yD4Cfkzr8RutQCHRpGZqnwISj3WfaPJ0l4t8iJ?=
 =?us-ascii?Q?05UsQuctVN/7qA7cBzWEsapqCqgWuc7S6GQGgfZt8UrME5BIbV56MkHGKdIo?=
 =?us-ascii?Q?FnAJ3p8GQAR4lNVVnWpKAmE+q/GvlGE2l7n6k+UFaRZzsyn8GoLSKudJSWPU?=
 =?us-ascii?Q?aZ1Ga7E4EW2wigUgFyy9n2YLEyxQXOfHrKMlFFDXdnSlLwAtR0gS15MTmyn/?=
 =?us-ascii?Q?tn8UiAnxIsTgU8lZ4rNwJ5FmHrD/5BdcqjN/rZPou2jJmUWO0wWZYz8j+pMB?=
 =?us-ascii?Q?3xciJZ1XTuA07aQmuC7DsXklxqfsn45HFDldcYeBckfI650Gp9FJUxTunMbN?=
 =?us-ascii?Q?hYT+Kikt8jtb6ra+uCbedc6wYf1KbY3tE803D3eA15e2acVsKo7V5k2tA2jx?=
 =?us-ascii?Q?j2828WjYYxIjAncI7+UFLdb6D80R1BiNZguoPSnQlURsLvnU0H9BJnv3uTZH?=
 =?us-ascii?Q?MPfAXaIUmDwdsOq4Xjj3g9IdVFVynx4GrbopAXC0rwLA8qo4SpZYAk1xnLyJ?=
 =?us-ascii?Q?qkpCk6NAz4BeazdysK/EGLBfrWRWmP3vAEGHF2cE30sASo6YUjohhzMe2Olc?=
 =?us-ascii?Q?PF1DQ5uXEOvMqWzmzU9nYywmSU627m2E1WyyUEOHvQv8g6AILwEP5oFg5Ran?=
 =?us-ascii?Q?EAuAfzbnVykuP9jWaBo4Z2Medhk88UjHkZyPMGA06Iz0NaSWOgGQ+IqMXqzS?=
 =?us-ascii?Q?0hP76j+OqTGF4nmAbVA3a61c5NanhHpe5Yfq/ktO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dd01bb-3698-423b-aff9-08de296a8ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 01:57:56.9785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+xts29osgyGiIPhG7ASiALeVMBD8GSPvzxUbXCrexdaVtpdENvuBdRvFMQ8OxiGmHOBLZMM1tm7u9U9F9Z7EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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

On Friday, November 21, 2025 2:32 PM Lin, Shuicheng wrote:
> On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> > Allow for runtime modification to page reclamation feature through
> > debugfs configuration. This parameter will only take effect if the
> > platform supports the page reclamation feature by default.
> >
> > Move xe_match_desc to common header for debugfs access to read default
> > device values of xe driver for current platform.
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_configfs.c | 11 +-------
> > drivers/gpu/drm/xe/xe_debugfs.c  | 47
> > ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_device.c   | 10 +++++++
> >  drivers/gpu/drm/xe/xe_device.h   |  2 ++
> >  4 files changed, 60 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > b/drivers/gpu/drm/xe/xe_configfs.c
> > index 9f6251b1008b..efc6d0690b27 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > @@ -15,6 +15,7 @@
> >
> >  #include "instructions/xe_mi_commands.h"
> >  #include "xe_configfs.h"
> > +#include "xe_device.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_hw_engine_types.h"
> >  #include "xe_module.h"
> > @@ -925,16 +926,6 @@ static const struct config_item_type
> > xe_config_sriov_type =3D {
> >  	.ct_attrs	=3D xe_config_sriov_attrs,
> >  };
> >
> > -static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev=
) -{
> > -	struct device_driver *driver =3D driver_find("xe", &pci_bus_type);
> > -	struct pci_driver *drv =3D to_pci_driver(driver);
> > -	const struct pci_device_id *ids =3D drv ? drv->id_table : NULL;
> > -	const struct pci_device_id *found =3D pci_match_id(ids, pdev);
> > -
> > -	return found ? (const void *)found->driver_data : NULL;
> > -}
> > -
> >  static struct pci_dev *get_physfn_instead(struct pci_dev *virtfn)  {
> >  	struct pci_dev *physfn =3D pci_physfn(virtfn); diff --git
> > a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index e91da9589c5f..572c61ee1e29 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_guc_ads.h"
> >  #include "xe_mmio.h"
> > +#include "xe_pci_types.h"
> >  #include "xe_pm.h"
> >  #include "xe_psmi.h"
> >  #include "xe_pxp_debugfs.h"
> > @@ -297,6 +298,49 @@ static const struct file_operations
> > wedged_mode_fops =3D {
> >  	.write =3D wedged_mode_set,
> >  };
> >
> > +static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user=
 *ubuf,
> > +					   size_t size, loff_t *pos)
> > +{
> > +	struct xe_device *xe =3D file_inode(f)->i_private;
> > +	char buf[8];
> > +	int len;
> > +
> > +	len =3D scnprintf(buf, sizeof(buf), "%d\n", xe-
> > >info.has_page_reclaim_hw_assist);
> > +	return simple_read_from_buffer(ubuf, size, pos, buf, len); }
> > +
> > +static ssize_t page_reclaim_hw_assist_set(struct file *f, const char
> > +__user
> > *ubuf,
> > +					  size_t size, loff_t *pos)
> > +{
> > +	struct xe_device *xe =3D file_inode(f)->i_private;
> > +	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> > +	const struct xe_device_desc *desc =3D xe_match_desc(pdev);
> > +	unsigned int val;
> > +	ssize_t ret;
> > +
> > +	ret =3D kstrtouint_from_user(ubuf, size, 0, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/**
> > +	 * Don't modify if page reclamation support isn't normally
> > +	 * supported by the HW.
> > +	 */
>=20
> Nit:
> /** is reserved for kernel-doc comment. So it should be /* here for norma=
l
> comment.
> How about "Don't modify it if page reclamation isn't supported by the
> hardware."?
>=20
> Other code LGTM.
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
>=20

Thanks, will revise comment on next patch.

> > +
> > +	if (!desc || !desc->has_page_reclaim_hw_assist)
> > +		return -ENODEV;
> > +
> > +	xe->info.has_page_reclaim_hw_assist =3D !!val;
> > +
> > +	return size;
> > +}
> > +
> > +static const struct file_operations page_reclaim_hw_assist_fops =3D {
> > +	.owner =3D THIS_MODULE,
> > +	.read =3D page_reclaim_hw_assist_show,
> > +	.write =3D page_reclaim_hw_assist_set, };
> > +
> >  static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char
> > __user *ubuf,
> >  					    size_t size, loff_t *pos)
> >  {
> > @@ -403,6 +447,9 @@ void xe_debugfs_register(struct xe_device *xe)
> >  	debugfs_create_file("disable_late_binding", 0600, root, xe,
> >  			    &disable_late_binding_fops);
> >
> > +	debugfs_create_file("page_reclaim_hw_assist", 0600, root, xe,
> > +			    &page_reclaim_hw_assist_fops);
> > +
> >  	for (mem_type =3D XE_PL_VRAM0; mem_type <=3D XE_PL_VRAM1;
> > ++mem_type) {
> >  		man =3D ttm_manager_type(bdev, mem_type);
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index c7d373c70f0f..16afddc5e35e
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1295,3 +1295,13 @@ void xe_device_declare_wedged(struct xe_device
> > *xe)
> >  		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> >  	}
> >  }
> > +
> > +const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev) {
> > +	struct device_driver *driver =3D driver_find("xe", &pci_bus_type);
> > +	struct pci_driver *drv =3D to_pci_driver(driver);
> > +	const struct pci_device_id *ids =3D drv ? drv->id_table : NULL;
> > +	const struct pci_device_id *found =3D pci_match_id(ids, pdev);
> > +
> > +	return found ? (const void *)found->driver_data : NULL; }
> > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > b/drivers/gpu/drm/xe/xe_device.h index 32cc6323b7f6..a66e8e4b3e01
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -193,6 +193,8 @@ void xe_device_declare_wedged(struct xe_device
> > *xe);  struct xe_file *xe_file_get(struct xe_file *xef);  void
> > xe_file_put(struct xe_file *xef);
> >
> > +const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev);
> > +
> >  int xe_is_injection_active(void);
> >
> >  /*
> > --
> > 2.51.2

