Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C6ACCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 14:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31C710E611;
	Tue, 14 Oct 2025 14:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8NvCtL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D4510E5EA;
 Tue, 14 Oct 2025 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760450596; x=1791986596;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VI2GYnLKkWKwiuSTGD+pMAUToYv49lwSRjKp06GSBWs=;
 b=d8NvCtL/vzqz0hCAFwc9UQP3Bwd9ha1tHcuO8oZg4N7nRDbWrfO7h2Z3
 Z9h+aaylqO75PX1ncp3LxW2z/MBIT6Urpect8uDFCQ+XhU80N1ziFEoJ6
 xZy/jQ0w4yN/r/2YuOu07kTEl9ddUeDmYGCs9SYGZPwAy9BcpN6UM//HN
 kQGJxH6QbHk5arpdjuWHSPb7yyFDLDwRj+lGDya0BpJ6DjUqVL4bR3Kw/
 bNH2w4cFBwsNprlk7FEcmYeUC+n3Q52XYAUo1U9SXKjSnLHNbWHam6eos
 y2uPO1Timpqp3hJ78qjt9d1xz9xn102tR9f5Lba74pE/Ke6Vm5XDZpCae g==;
X-CSE-ConnectionGUID: 4+J2H84/TaKo5nzXeqrfuQ==
X-CSE-MsgGUID: kRcETNJPQWCUbQ3MSmT/Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62760082"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62760082"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:03:16 -0700
X-CSE-ConnectionGUID: SUbwcjx2RG+5D/S3n5Ta6w==
X-CSE-MsgGUID: uULCDTTNTn2BiIgeM3R3uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="212852263"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:03:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 07:03:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 07:03:15 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 07:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzkoqm+UIwHZXPb25btFp+0i/sNzrmoWYprfbu5MT05Zs4S+HzW8W19u7kHgWXDPgRi7aoNFN3VMeeiVjr/CTebqH0QxWdOgvts9ZB+YB8491Di7JaqK70QR3aceFhOnyPb3WeWtUQZAb6VdJPAoLNxjy3A/t0gN/lmGVsD+9WIEhc80+MVBwKEvNRmq5032EaoNYKZkbkFFzghqiozSWH5liWQNm5puPDlM60yfWlwVWXU35NT45pUEGkGuxZcY+RGF/EjypmSu4x7vgZu2FcmDIKHROBhr7AyW9j1KuWSjlsHXQwJMjGsejZfg7cuawOe1vpZO5xDoy2BCO5M6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiqxV0XzrcaChaYMjMo9bJu5cYn7o74Im63Eew9frSg=;
 b=i2S3XRUbRkHeqBYo4PrKxV92ij0G2dRvFzfJf2+mu+/QjnmyjysmmnhDCScccz7abzi6zFx5eH0zZES2hjIHvmoDNDMGOFl3WdA10E8eB/HmHV5ThVLaR35yqyT08WfqiVj9okyISS4nXMdFFIw9NQ14daNZOaz2/h4nkKd9ssjCzMdYTdztJNthPZo39wvavhwqnQga6JSKR/qRk5/wx1H+SDgjFGm8oC0NLAojFpYo/NwnM2eLTCo0/eRMdBPsjrIwHimcKOrhGSMOESKB+NROgsdGJ2KPlG3gz9GEDAVWlyOBsbgDM8oTcAx3dFdF4CWxrx5S4+T+bCPsLeb7nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:03:13 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 14:03:11 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Lis, Tomasz"
 <tomasz.lis@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block section
Thread-Topic: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
 section
Thread-Index: AQHcDZIUOsvG1ggVzUyz8/qLFFc3p7TCCtLAgAAAirA=
Date: Tue, 14 Oct 2025 14:03:11 +0000
Message-ID: <CH3PR11MB8434CFBD44BD935E41889A958DEBA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250815030936.2387322-1-matthew.brost@intel.com>
 <CH3PR11MB84348297B0CE882D299660C68DEBA@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB84348297B0CE882D299660C68DEBA@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CO1PR11MB4818:EE_
x-ms-office365-filtering-correlation-id: c3cc5d80-1cb6-40f4-cf9a-08de0b2a6973
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XVws6HKNpEFmXG+PcGNu48lAgGzuJ1EkXlCDPqQ4DuFUWL68B/0uP0py3qHb?=
 =?us-ascii?Q?L8bDMCymW8zACQi4NXFHHQ9srV6lbETNPDsBFouy2VqKMO1QqOYZNgfw0nec?=
 =?us-ascii?Q?p7wtYS28NZ62n9SgDNSS2BsWea9DehAaQ7OcfhBZiMY2GlZZBmM74Wxph/Em?=
 =?us-ascii?Q?8anTQN9Hu5zrBal4GC6EhOMy+Mok6d0xNkvpgBGbBqSmDNXNYF4V1yyLa9fH?=
 =?us-ascii?Q?nhDmm8ctMaZx1y9V8r/tdQjpXHt1cnICv6Ydgn45O6briYkNbkzS0Jm+xKtx?=
 =?us-ascii?Q?ZxSlmzYi79kxpcd+LO08fkM/Zy4ld0nSFKDPrfShC0hIwMkfUHT1TBcZP2QH?=
 =?us-ascii?Q?6Q5tq4Q6Jnd6a/F7I/YkZ3g/d4niOm3uBJ9OCN9fMdgndR8GLT7EThmRFX0b?=
 =?us-ascii?Q?aSI4j4nRyBH7WGCkol+il2hX5Bs6B1b8n4wmrjmum2zW6rso6yuRDfzWRo24?=
 =?us-ascii?Q?nhWrAGbX+fSxN60lzetmO4ha8zEm0zxQqhbsZZqeeC77oDVEriABY04fGUCa?=
 =?us-ascii?Q?rqiWc/i4IMuqnKtE0VNimb2oVphkgaX+iClDshgkqjiZwqNgFmCvQM7+WnjZ?=
 =?us-ascii?Q?m7RTKXSXlED31kPdvlHbfcSNdmyTEXOIjU7ZSkKBzU9iptmlcJ6LFPPOTZHe?=
 =?us-ascii?Q?lIRCSrvxkQCwz2odwxZtjKi/apLPZ/Pk7N9fZSvB16LoQya14Srqs3XJTc4R?=
 =?us-ascii?Q?KMLvKJA4LB6/x3KkyaBr+qD7bm9GKVJBqoGwq0epo/pKeo1Z3zZYF5p8yMwE?=
 =?us-ascii?Q?iC8LRpTlqtDzQMNvPVihkY1K6uoY6n3ImxblhIT7+HxuTIJ6bApjgcuVVvsb?=
 =?us-ascii?Q?lbhepGI+/0ZMgbgbSNzGH1pUBglnvqwX79URB96kY+KHZvzoQVAMCd+UIzuU?=
 =?us-ascii?Q?GLiE+1I3G9tGlZdgPkf03CaX+91GGGaC89YG4Z5xR8bB51aqwTvjSVLKhNP3?=
 =?us-ascii?Q?LanIotWCHZYaYzaVPzdziOOX66V0/ST62sykoxnwpCibCaRanvIn7P1+vYrN?=
 =?us-ascii?Q?MN8u1Kvq0AyyeqtRfhkpWNMOV2yNFgaHS4hTwsnV9+TB2hOhfGCgH0SBQcu6?=
 =?us-ascii?Q?pEd5WL/ABo0LxWZKBQjP1H1KAA/YTdzFiAgSxh4UT6TyZ3wcy2v38QxMeLwX?=
 =?us-ascii?Q?VQyja7OihsGWwx1rHKwn2+I/mGIaRCrVpm89O4XbDlx+bPlLSO1U1NZ8tBjc?=
 =?us-ascii?Q?JspiRPtVZ0zZPeJVtFKUQNRJhM9HjDlBjjc4DpTNPjHEmDVFLvhCaqcF0MR4?=
 =?us-ascii?Q?7oaUtnGJH3Zy0HeyzRgK3q4uUqr6ozTks2cO8QP6gNgQvLlFs9l0zGpKfZ7/?=
 =?us-ascii?Q?iTBd1c3FQziF8lJJ/8xxL8adLCTUsB/Br6HMVW03Laj9uaZMjGrMehWMVnQS?=
 =?us-ascii?Q?vkQ6u3TK2rM/IyV2q5XlWL1Gv4HQgyMkZMvBZq8Uz8wqCYlflgY0vgLtJo2u?=
 =?us-ascii?Q?kCP9fWTn7UuYQSZBwgLCBjB5aF9huKyFJpYgYKwmZMWjRvs0PbEPPeVzqZjo?=
 =?us-ascii?Q?umFMPBpltJLsGu06xIGa/BTJiLzQfmspqItg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YULCz+o62qckyszWZQyi3kDsx9pk28sNjSGwOvk0L6hDj5+Ez2IulPiW1VIA?=
 =?us-ascii?Q?UhmlJwHH6sc2Qe4pA1ZrsfvdE4a5TC5fcU4/VW28AZuMFCiff4AhDYdMh5gu?=
 =?us-ascii?Q?fNhS+s9PqC9Qxp6+9Us/MhlpuxfDDph8CBsIYAmd5agvpIPjVJlBQN+3U8NJ?=
 =?us-ascii?Q?ohiRs6KpjmSqg27XZpqyJls+v7WMpy4OoqdVg1YduyNZb89NM2T883k4Y+rC?=
 =?us-ascii?Q?DD29Sz7wjhOjngFN0QEu+o1sS+33boUyGX5LGqSenW5vx+N3As5esBK03BxK?=
 =?us-ascii?Q?H8HIMhucfRjexIpsVT5gdR5VEbx75HecNk1XqsdTysatvY4JrYRSl/UM0Lor?=
 =?us-ascii?Q?CDd9QMFzFExU0xHEuGEQ+z596FntzAxYlDTCLrk9/aScOOLqDqHFRN/U/Zyd?=
 =?us-ascii?Q?zmmvrj6bD97J5Pr1EdGHJNuDZjEW4JCBjVX+scC4DIBZnmhhjLw2gd6NWsUI?=
 =?us-ascii?Q?X9yp/aYxRPp2/bLKX2vf96Er0isf+0wb9qEKnWXjdNTmR1UHD0HT8DprAp+U?=
 =?us-ascii?Q?To8HbHSHdv5rpLVt3xTGo7CaSF/b7OXywc3/ceW0hwfs1J4d+Lru4GBNHqe8?=
 =?us-ascii?Q?ayO63V8f8+qspAbQw3V2jjdpPAW9I0H7TwgePs3GSR3h0PP59BV0Wc8rc9d3?=
 =?us-ascii?Q?vSgzg9EdEXurVt0xKbMnErftQJ8nwkFQH+c0T94E310xRRtOx1ff0HqozMyR?=
 =?us-ascii?Q?mJ5sgHl2eyDKWgoUmHvrXQKelVtrFbxLOuDwBoRz7HoDtdEcW3ngHeo2Wn2J?=
 =?us-ascii?Q?zr8cvAZOFmRO/IhBzgfgZdsR+XSS77gugtvPVBYxIXxqo9XFlu1zpfpEgF9J?=
 =?us-ascii?Q?Woh4AcOLaS4elVoMpS1AfyQC8efK+6qVqiaVgZhhuKquHJwdf1eZSWE6xurg?=
 =?us-ascii?Q?KTs5NAmnHijKErpapXZDDfVUfcXE7lQnM1fCAtTs6axFCHzedOz4NCttD84z?=
 =?us-ascii?Q?+ICPn2NuoCWDS3//Dv0JYIeWdcrjtErhzEp+9byL7PSTHwMXGuBQAL+5vBgY?=
 =?us-ascii?Q?cv4QFlANSKehaHPrOwLsBB1bY3VqQ9QkMKfS1gIszcDvlZrLbW1o4cPzqNwf?=
 =?us-ascii?Q?t+FXJLK+syvmeXmA1CN+aA48Gk27alLn0jNOfAqsEqPO3bgYNWKcZ6TuwlUC?=
 =?us-ascii?Q?5dhkl+iOJvRrxee3SnDUCJSPe3aqniYNrMwqA3LQKNk8I9doBZIFbDPWcKwf?=
 =?us-ascii?Q?4spaYz88w6ck4eCyw4Ber5HJJK4ML77DVn66zSmCdkxcmeJRFSr96GcsETGM?=
 =?us-ascii?Q?j6Net1f4gv/2zkAC3CZoJSa1XgWF0y/Yl6V5SqmMJxIzWAa2STFYtQSGs1zM?=
 =?us-ascii?Q?xaUCv1j1om98/U1s0sbLbPgyYmSpKqesFr7CvzqIDz311seSLgk0for09KSC?=
 =?us-ascii?Q?7nuClvyCwNqxVl9FlHObn48xvefa9+8udqlP5tdDTMI+5mhdUKG3iPirN9cg?=
 =?us-ascii?Q?nmeAs/1rdFUkt3uvDxdOb6XBAaKiBjNg8o9H+kPJawJ8/Dtt8NMIqBbzz4R1?=
 =?us-ascii?Q?nXzFvYaykZZiIC2KT1MciEv9Jl/dGrPVbMxbqNmoIyJ90658nW8EOvKnO4d7?=
 =?us-ascii?Q?1W9J2u4DzAYdfJSPqnt/BcYi4JBWniqQiW7ZMAgQuBCnoCxoJn2RuYCOQTLq?=
 =?us-ascii?Q?PV02N8KeupOUslaoI9CoeJQ2ufp2NOgG51N1bcTV/PM4XuUFCMAku/mD8zPu?=
 =?us-ascii?Q?ZNES6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cc5d80-1cb6-40f4-cf9a-08de0b2a6973
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 14:03:11.8271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6R+z0Z8ZwgyFpWGx7Og0ufvbEPrRwp1zVe/gLzIMBq1S+BKIy+DVUUPjb5kMYfSq2c/jUXnws4VRVrQXsgtMy9vHW73zRDsB4YjDoNy+jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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
> From: Dandamudi, Priyanka
> Sent: 14 October 2025 07:32 PM
> To: 'Matthew Brost' <matthew.brost@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> section
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: 15 August 2025 08:40 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> > <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > Subject: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> > section
> >
> > The non-block will become invalid and hang until the test exhausts all
> > memory when LR jobs are tracked in the DRM scheduler.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_exec_compute_mode.c | 113
> > -----------------------------
> >  1 file changed, 113 deletions(-)
> >
> > diff --git a/tests/intel/xe_exec_compute_mode.c
> > b/tests/intel/xe_exec_compute_mode.c
> > index b904dc76b4..316f7322c1 100644
> > --- a/tests/intel/xe_exec_compute_mode.c
> > +++ b/tests/intel/xe_exec_compute_mode.c
> > @@ -320,116 +320,6 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> >  		close(map_fd);
> >  }
> >
> > -/**
> > - * SUBTEST: non-blocking
> > - * Description: Fill the ring and check we get expected errors.
> > - * Test category: functionality test
> > - */
> > -#define VM_DATA		0
> > -#define SPIN_DATA	1
> > -#define EXEC_DATA	2
> > -#define DATA_COUNT	3
> > -static void non_block(int fd, int expect) -{
> > -	uint64_t addr =3D 0x1a0000;
> > -	struct drm_xe_sync sync[1] =3D {
> > -		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > -		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > -		  .timeline_value =3D USER_FENCE_VALUE},
> > -	};
> > -	struct drm_xe_exec exec =3D {
> > -		.num_batch_buffer =3D 1,
> > -		.num_syncs =3D 1,
> > -		.syncs =3D to_user_pointer(&sync),
> > -	};
> > -	struct {
> > -		struct xe_spin spin;
> > -		uint32_t batch[16];
> > -		uint64_t vm_sync;
> > -		uint32_t data;
> > -		uint64_t exec_sync;
> > -	} *data =3D NULL;
> > -	struct xe_spin_opts spin_opts =3D { .preempt =3D false };
> > -	struct drm_xe_engine *engine;
> > -	uint64_t batch_offset =3D (char *)&data[EXEC_DATA].batch - (char
> > *)data;
> > -	uint64_t batch_addr =3D addr + batch_offset;
> > -	uint64_t sdi_offset =3D (char *)&data[EXEC_DATA].data - (char *)data;
> > -	uint64_t sdi_addr =3D addr + sdi_offset;
> > -	size_t bo_size;
> > -	uint32_t vm;
> > -	uint32_t exec_queue;
> > -	int value =3D 0x123456;
> > -	uint32_t bo =3D 0;
> > -	int b, err;
> > -
> > -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > -	bo_size =3D sizeof(*data) * DATA_COUNT;
> > -	bo_size =3D xe_bb_size(fd, bo_size);
> > -
> > -	engine =3D xe_engine(fd, 1);
> > -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> > >instance.gt_id),
> > -
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > -
> > -	data =3D xe_bo_map(fd, bo, bo_size);
> > -	memset(data, 0, bo_size);
> > -	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> > -
> > -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> > -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> > -			       addr, bo_size, sync, 1);
> > -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> > 0, NSEC_PER_SEC);
> > -	data[VM_DATA].vm_sync =3D 0;
> > -
> > -	spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char
> > *)data;
> > -	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> > -	sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char
> > *)data;
> > -	exec.exec_queue_id =3D exec_queue;
> > -	exec.address =3D spin_opts.addr;
> > -	xe_exec(fd, &exec);
> > -	xe_spin_wait_started(&data[SPIN_DATA].spin);
> > -
> > -	b =3D 0;
> > -	data[EXEC_DATA].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > -	data[EXEC_DATA].batch[b++] =3D sdi_addr;
> > -	data[EXEC_DATA].batch[b++] =3D sdi_addr >> 32;
> > -	data[EXEC_DATA].batch[b++] =3D value;
> > -	data[EXEC_DATA].batch[b++] =3D MI_BATCH_BUFFER_END;
> > -	igt_assert(b <=3D ARRAY_SIZE(data[EXEC_DATA].batch));
> > -
> > -	sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_sync - (char
> > *)data;
> > -	exec.num_syncs =3D 0;
> > -	exec.exec_queue_id =3D exec_queue;
> > -	exec.address =3D batch_addr;
> > -
> > -	while (1) {
> > -
> > -		err =3D ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> > -
> > -		if (err =3D=3D -1 && errno =3D=3D EWOULDBLOCK)
> > -			break;
> > -
> > -		igt_assert_eq(err, 0);
> > -	}
> > -	igt_assert_eq(errno, expect);
> > -
> > -	xe_spin_end(&data[SPIN_DATA].spin);
> > -	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> > USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > -	usleep(50000);
> > -
> > -	exec.num_syncs =3D 1;
> > -	xe_exec(fd, &exec);
> > -	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> > USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > -
> > -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> > -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> > 0, NSEC_PER_SEC);
> > -	munmap(data, bo_size);
> > -	gem_close(fd, bo);
> > -
> > -	xe_exec_queue_destroy(fd, exec_queue);
> > -	xe_vm_destroy(fd, vm);
> > -}
> > -
> >  #define LR_SPINNER_TIME 30
> >  /**
> >   * SUBTEST: lr-mode-workload
> > @@ -570,9 +460,6 @@ igt_main
> >  					  s->flags);
> >  	}
> >
> > -	igt_subtest("non-blocking")
> > -		non_block(fd, EWOULDBLOCK);
> > -
> >  	igt_subtest("lr-mode-workload")
> >  		lr_mode_workload(fd);
> >
> LGTM,
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > --
> > 2.34.1

