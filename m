Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA412C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 18:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D5810E2FE;
	Thu,  5 Jun 2025 18:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESTrz+RY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4E910E2FE
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749146770; x=1780682770;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pEQ3MpuysgIVjBVba3XLpo3iRMD50C6si9us9Foqh6c=;
 b=ESTrz+RYFT+HhX8DUFAu+D18KWn9orEgoSmx/Iakr/ZGL8QN9su2t17d
 qBz8xWn8zx9QULfJjYUk6mgl8PQ3didWsoEnTzyAgW7382Nan9PJpp5HK
 eo6HFNlZi5P2rl5+ToEbWctB6T3lDYXGMach6uDbcrL+/OWfgFonQIFAP
 OmR5t0ZWyuQRSgCXdmY1MrM1VaCXM8817UtEFMeoAVFTetmPMZysvJIF/
 +QtTPVJEFuZEPK0mTjPrZySpPLOvDo5RpNpbkW51VjkPKmfOPgo6D4c8Y
 +xhcEGkjNI6FLTtApRzDQOgvfQyuXWbUDM7uiCBdAsCvD6czMHuUHRTu6 w==;
X-CSE-ConnectionGUID: kaPtWavITb+jELZ9xcFsiw==
X-CSE-MsgGUID: 5tlJCz9QSTOnOuGguMfJhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68719365"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="68719365"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:06:10 -0700
X-CSE-ConnectionGUID: 1819vaHgRN2CR3lEUkf7DQ==
X-CSE-MsgGUID: RqfUEiSMSpOqxyqEnYMscw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145553118"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:06:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 11:06:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 11:06:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.42)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 11:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVIcLaozLHdCCkT1eGwznllRNo3TASmBQSsj9TEbhHx61N4HXrJe86GLFWstE9ioLZWtn7b1ZlpRFI/WauRD5gGlT6cAwiA4eisWeJD2rJ2TPVKmYosxIKMFSC/kB18ugVIl16DCM+4XJcQk7nfn+QY+ux29GgeAO55IryCrdQFzFGBP0Y7J3dE0vXiT2P6q9cOXC5ovPjLwUCtGkPEpgrujl9MjFVUonNAzR9MTXwZoUhmNGWspYQc9rhtkGQ9OA91126T8o1h8jiE48A1ajxbTjtxQZBm0SasnDhxEfOdRO1Up7GLIELP8KTKlpwvbLoWTnopiHpeuv8Tp25F2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDlNbfDUxXS3raZR5LIFqLiGplQV/eI5fTlLaICoIbQ=;
 b=ZOzoKakHe9bm1IXjFy9ZlM+PtFdZpAUKvPcAk2TSMJbDW6cK1Z2LMQwuu5YnN6YXars7GjPCJxUn1IZIZxnCucbKvz/sYNF8oWOMFKy/0u+Pxgjjeved6g91zkXEVd0zTNdmhQpFyDB7udR5wyqbX32a26AWUjapRqJa1i0+bxkg49WMwJFx2b8uBe+6vlKKHJB0pt9XDNVkZ9wAgaSQXSE8dgeYQjpSoKrmicZygp5RA/Gn6/P1Gct0+kNG+O8lLo9NPQIxbovrlYCyLEyTdjQ9Gz0SZJiqcvYPRjqSDoKREvz//PIY8ZrBPpldYkiFwxofva2fcvehQToWavKSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 18:05:53 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 18:05:53 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
Subject: RE: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
Thread-Topic: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
Thread-Index: AQHb1WBVj8AHGxYzakCen+euf/Fr6bPzWWaAgAFdnICAACaOcA==
Date: Thu, 5 Jun 2025 18:05:53 +0000
Message-ID: <IA1PR11MB62666A1BEC04E766C1838534E26FA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
 <20250604145236.1143122-3-dnyaneshwar.bhadane@intel.com>
 <20250604185419.GG6239@mdroper-desk1.amr.corp.intel.com>
 <vmtkl2bvwn6ualbftneb4bfpvnu5fjsbs2qrurkz4ifejxoqxb@vus2o5jhnfxl>
In-Reply-To: <vmtkl2bvwn6ualbftneb4bfpvnu5fjsbs2qrurkz4ifejxoqxb@vus2o5jhnfxl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|SA3PR11MB7977:EE_
x-ms-office365-filtering-correlation-id: 95428f43-d3aa-43be-ac91-08dda45b9cda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6wCPSJoiwkw4N7ZfPTWw8s68o0WGQjQQg/HZnr7clgkAaTrkX7q2VoJZWy82?=
 =?us-ascii?Q?+AEb58ShwOYdYspnhwNe6W17Zp5Lzn3+JKWTrRJaxwAGmXhjLeZazL+wK20o?=
 =?us-ascii?Q?aXgVgkEa7iCR2HYUFAr2YJuVne7sIvIDRVF+6OWf4xVKhrYaoMmVK1jGun9l?=
 =?us-ascii?Q?ne/0ZKD7QhKsdx2JlklChByb06ilBRP84DGRhPmr9ivEIerddlP9o3JLwULz?=
 =?us-ascii?Q?GiY6o+tic0af1RtSpxjZURKF3E6nJl7R39kEnjI1GjaaUdv5TnX+Dm5YJTIA?=
 =?us-ascii?Q?yxsZuac0WQUJdADXEu4FOWfvV390Y+bafqfCv9lSMYP5nc7S4HgtALtJFQ5O?=
 =?us-ascii?Q?9NoTGRPg3R41en59dG2lJIbHe7xsP5MyZCoGFWS8wPFbu2YVnh/JdPytfYjw?=
 =?us-ascii?Q?gmDv05OABfQpq+Daxlf5sCZVRwtPjTctIRHO7EFGRoyxk9cS9+gSbCOSn2xD?=
 =?us-ascii?Q?6TOSgFyvlGJ63Zrj//w+GJnavIFsQDGLI4F944j7oOUae7au2EqJiXMgMsoO?=
 =?us-ascii?Q?8FfXuAwlDRZ3/iY8f4eO9LpSkbqZp/WaSdiTUl46d8AgRbpYk+vaXcK0kT9e?=
 =?us-ascii?Q?R9R1qpJqJU4MDkkSAbbc9MVGWakAuSs77XRKxPlgYMmoP8Bu1ARLMsxunbwE?=
 =?us-ascii?Q?15Gpv3mJxEWuS5TA6r4/xJlAIbxwNdPli7jrgtJh182/KtAP4mo3N4IovcVu?=
 =?us-ascii?Q?+IB7gUxLfmOBJ14muS9MbXqj4NxGQUvjLjfuF97nrDQ5HD5LGtzdL80r/Z32?=
 =?us-ascii?Q?Yp148ECMIfzSewGlJR1IAXHqLuckOdjSmlBI8tEkEbixhTOlwBP9jJTmmX8/?=
 =?us-ascii?Q?CJsJZPohRSrYDI8RrnmrLM0Y9cgJx6E+WIumJZn44YPHjfvzaj7PGXQU0d1b?=
 =?us-ascii?Q?UjUQ3x8AmnvpfGX81Ykg+spygv69z49mbV0j0PLLmScIJU/acBBY334A6XEy?=
 =?us-ascii?Q?YrXkOXC1zSYp+hsfdddWkesaxpdYjWBBwbImNetpfWu5pL209Mkx0vtCR7ZI?=
 =?us-ascii?Q?ExPe/69IPr34DXp1w5v7bSoHVLR9/MoxrWqXOtQ68Ro0ClLUrWO1RwhYlqJa?=
 =?us-ascii?Q?W7XfkzPEAw7hQWdA6XVTLLvwNyemmvM1tPBvEldghgQsScT/Bq6Jp8absAuO?=
 =?us-ascii?Q?MqBCQAA4xTx7F15klp6kxk/bOpoHG+a/6qYZ16YeKe048UiVT1U5aPE0jfle?=
 =?us-ascii?Q?Nxr9+NeuKDAF3FXTwhPhBqT+GruHm2JtbGUuKH0rakAcBBrCFYetAR2t1Uu3?=
 =?us-ascii?Q?rADcWY6kwu8UJtJvr6OmVJFVuO9XeIiEfKKsTlWq7RHn3FDTbUkxNlcqn8Rj?=
 =?us-ascii?Q?wByp9KUBYwuPkjS9fY2ZTWXxBgAcNbSxuMFUt2F7uhiuHbAAM9TpxwZmrICR?=
 =?us-ascii?Q?qeLPID4ugmqxYu98flmtSnkLFZf86rpWB5iGSjawWB5BUyP5ELYRtDCJ13ol?=
 =?us-ascii?Q?CGKiXP+0bJIXAkbqEj1N9FRMV/T4CAGxYpI4IwYtZMtCZKAUfFXifw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YEBuVTIHlxyMgJbDEIiLaHJhic5dlqKm/mmjPyZ16UXG32Ex+fbyYV45zpvQ?=
 =?us-ascii?Q?1wtUTSvlnoBSig92HgrKCVVPQ0yP2zxEOLj+/OHNyALvROjIqbzpLImiVFyq?=
 =?us-ascii?Q?JfXE7vMlVbYHEWP+hCYJ70pPeTEH2lsetUjnW8zt9QRzlnC0fTt9Oxx7R77M?=
 =?us-ascii?Q?9J46t2EUIgnAwR+/6Ew1GeXY1k/g6hfVdUiRrGdEzRlS1ibuEPBRpWhbe7QF?=
 =?us-ascii?Q?6er7+eIQUZTv2ZPSZJ1CqFfbVcJl12WyTCLkc1oXsuO1MrgEzSCHnBoqxm3v?=
 =?us-ascii?Q?EHYHBlPI4na8zreAM/apOlLw310Z4UMfBjFH5HDPbR6acUOb+JC+iLiH/sLr?=
 =?us-ascii?Q?VWHu2ReL2We7TthypVNmOkYWZvHsASz9PBOD4U3LtAHuDD+vlM8toYSEXzEd?=
 =?us-ascii?Q?5WiqxIGdPm3Y2WyITGBVNWERzfSmZtBCVUJtQ5/bMzyi2rQbJ/3iE3SlTcPj?=
 =?us-ascii?Q?Hvx/9H/YEc77FrQyy6zQzp+89qXV7aPsgMJ8tue/gkA9jZypZM0FFT/lbPyN?=
 =?us-ascii?Q?gZ6wOLA+JYUvDMOvZ8sFD5ZmSNdq+S+RCKQPy0qGaYd01+q7ERInKRStZIDL?=
 =?us-ascii?Q?zI2IKEhjYXfgGpH1d3CYiR4D4dhwVKNuR6MhL4BCsxf/IwFXH6qI9sdeH8JH?=
 =?us-ascii?Q?aJn7KNU0fBr2SwrqjycG46stjKceO1Unl2qSqgoYgqsj900VKyKb/GIGfIeW?=
 =?us-ascii?Q?W87VfaFvLdkuLdvAZeGn8wAOwWyNYg3JCwsAWRySe/vrIN0GZDdj4xVG1bh6?=
 =?us-ascii?Q?5Z1+OY0GkwdcBlDKd5ofnrPJBtjP8ElCCCuiF4Poh8NQWJju/dcZ7/4yRHbi?=
 =?us-ascii?Q?LFWTVGsJttGuuWv68/T47j6qKLBrkyphG9jv/ddtt+CsoER88mykauRgNdTI?=
 =?us-ascii?Q?ExBeHSiJaKzTFTdOes5dbE/587IHb3Q+U+DixhgoyB+pjHM+Ch4J9vGR35QP?=
 =?us-ascii?Q?XrWKFJ6cU+Llo0ptKE1qbuAiGgBf/J/A6vYPm02RtKUCOTDk5YLjOLUD75y+?=
 =?us-ascii?Q?1AWNPwZ0WNGh7AcEZheSuLFg+t4HL1bhEHdUxOq1cHIXAbsJkUZPwXWnwXSE?=
 =?us-ascii?Q?KXIyB/h9A1g6piqwKc5CP8sTfABBWdQzSeZz1fLDKbEX88gTZgDhP59P+I6Z?=
 =?us-ascii?Q?8XmXga2jpR+BAyclX+mIaEnZZAeiRMdHUAxqaOJ+XSKlNp0tM9sVvCYPOKER?=
 =?us-ascii?Q?TbToR6VhZ6k0gEQrzJYNcu4/ysuw2312XD88QVZSl9tW4wyN/XZpo/ux13gx?=
 =?us-ascii?Q?CA2ANj+ZIK3cH2KJA/fTDzhSbi6eyrgr+9PEEgMNHBsQu/daR+dsK5Pqrq7p?=
 =?us-ascii?Q?tBocaeW94Op6KJahggjL8ust8YFLVDsv+Ael6puIxx0TBzZlwN0mpzgYqPq6?=
 =?us-ascii?Q?kMb/avd0P+JMbNSWf/Ff/+svNwX2U/TJg+78RFMBn8+Qz2qQfEYWXZeYPj4/?=
 =?us-ascii?Q?LqZMpQmXbrmiEFNAVQuSoH8rlIP7MWQKxnZQzaxdLuuOHwzFwYu4Yk5wV3Tz?=
 =?us-ascii?Q?zSGRLO8wAUkLQ/v5S12+NcM28ri1TKfXt4BCBLb75BIWzF7Gy9Zdlq14qTlV?=
 =?us-ascii?Q?Z4Cg5pK6jGfCwqWv34b2Fek7i7aTVT56ZwZiFodX+BdtXXoUlBkh3o1BXATg?=
 =?us-ascii?Q?Og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95428f43-d3aa-43be-ac91-08dda45b9cda
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 18:05:53.6720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvhedY0CrLCyHqs4gyBdhz2Yw8s8kck6yc49tnu11WfvzANdQDiGsD2WF2zh46rANchVaOT/N98zmoMjBTv1lHOXlCnY8E55FHaaXTGDnqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, June 5, 2025 9:16 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>; intel-
> xe@lists.freedesktop.org; Chauhan, Shekhar <shekhar.chauhan@intel.com>
> Subject: Re: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
>=20
> On Wed, Jun 04, 2025 at 11:54:19AM -0700, Matt Roper wrote:
> >On Wed, Jun 04, 2025 at 08:22:35PM +0530, Dnyaneshwar Bhadane wrote:
> >> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> >>
> >> Add set of workarounds for xe2_hpg.
> >>
> >> -v2: Fix xe2_hpg GMD version for some workarounds.
> >>
> >> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> >> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_wa.c         | 55 +++++++++++++++++++++--------=
-
> >>  drivers/gpu/drm/xe/xe_wa_oob.rules |  4 +--
> >>  2 files changed, 40 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> >> index 67196baa4249..2c0e0adc5904 100644
> >> --- a/drivers/gpu/drm/xe/xe_wa.c
> >> +++ b/drivers/gpu/drm/xe/xe_wa.c
> >> @@ -489,8 +489,8 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> >>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> FUNC(xe_rtp_match_first_render_or_compute)),
> >>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3,
> XE2_EUPEND_CHK_FLUSH_DIS))
> >>  	},
> >> -	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221:
> GRAPHICS_STEP(A0, B0) */
> >> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> >> +	{ XE_RTP_NAME("16021540221"),
> >> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> >
> >Breaking out 20.01/20.02 into a separate entry farther down is good
> >since it keeps the LPG and HPG handling separate, and also avoids
> >blindly applying this 20.03 which doesn't exist today, but could
> >potentially show up in the future.
> >
> >However is there actually a benefit to splitting 16021540221 (a-step
> >only) and 18034896535 (all steppings) into separate entries given that
> >the two workarounds have the same actions?  I think breaking it out
> >like this will actually cause a warning if run on an A-step platform
> >since we'll have two entries trying to update the same bits of the same
> >register (see compatible_entries() in xe_reg_sr.c).
>=20
> humn... it looks like our kunit in drivers/gpu/drm/xe/tests/xe_wa_test.c
> is only covering the gt table, not engine. We should add entries for
>=20
> 	KUNIT_CASE_PARAM(xe_wa_engine, platform_gen_params),
>=20
> and
>=20
> 	KUNIT_CASE_PARAM(xe_wa_lrc, platform_gen_params),
>=20
> to cover this in kunit and avoid introducing these bugs.
> Shekhar/Dnyaneshwar, would you be able to do that? It can (should?) be
> separate from these patches to avoid unnecessary delays in applying these
> workarounds.
Thanks Lucas, I will take care of this, and I will send the separate patch =
for this.=20

Dnyaneshwar,=20

>=20
> thanks
> Lucas De Marchi
