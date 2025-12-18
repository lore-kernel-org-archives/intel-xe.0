Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF263D711C3
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AF310E123;
	Thu, 18 Dec 2025 21:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyrAVKNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40A510EB5E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766091831; x=1797627831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fn9W2CuhVQy3vLu8aunluNkQ7UBHKHjbndvIw1xX+vc=;
 b=nyrAVKNPFryxFXlivWc8pE5Ht0GVyxc6hZzT0mrCEKQ2ttOrdj+kMIov
 5p4u1yngsG3Lry4EwWQH7wAt/joMCh4ptEX+/rFIDRnfhM5spxA1xUbuQ
 FybFioorRwy8BCwFV8iHpkWe6HiEjTNscerbJTePZ13wOlrKh0IdkMTPV
 uZweTBpAnemGdxNlzeWbhIVwJ4wnjpMSorwWiaIIL9pyNxSOzyqfu5mRp
 gx/HJDUFXLAJTz4Pv4UM1wcBllR6uiJCIZ2oYd5QoRc29oQ2YtKtVfuMY
 7yG5QEzla94fB1f63QP1gcOUwByVW2c7An1RSpBYbgv0GG4dOQ36xvw27 w==;
X-CSE-ConnectionGUID: egPSPz+XSZ+mL8xvwdImcA==
X-CSE-MsgGUID: mALLYmU4Q+i+SNa2VHA5cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68027032"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68027032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:03:51 -0800
X-CSE-ConnectionGUID: U7N3InHUS1CMyeiHxkxvTQ==
X-CSE-MsgGUID: r8035AYrRs69e9Y1QElxYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203765370"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:03:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:03:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 13:03:49 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:03:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2CqF1P9hRoLBQ7otdvW5OfYxFUKN0jtvyuBcn8UqoQYC3NfEqYPE3IjJv/cR7PAQS+wLC3o8wDWF1O64puTU49CL/N8tOdOzK0w08kvdElwNpdHqCxF39TYgSoeka4n9XuYNZ2B8pIPaMAyW6APJ+tzLLCw11BT6Bbis4yznuyiOYOGXpJymPV2/JfJprP8RdhbFmVIKYeH+50d+xKDZ9jhRLM6WddousWKZy36FEYbiyBKfqkQUPbY8C1hclFwTkEcSwrNzCVfcjmPOTHZ3eKDJPMvJqte4yfkIYLbAJPm3nWlYyrWakyZlyaQ50Rq8Si+zdVLAdlJI8Qfj8FajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDgFHJBufOVEYXC/bClVo56QuTFnlOwrUPsswlj/3Mk=;
 b=VI5RV4QNrZs0fbRRZZfTvMyRH7v8zv4C0+smvJ9iSmYoWpYOLEGQKDk90C8yjnUCNA2ZpGfvHUzpGpRfogywvNXYpsDRDeldvlLaeyIocNmi0vW8h9ltCnUdq5FnsToV1Y/cvR7QNyQacENCbgd6umoR/4e+V0K7Y15BpaNfC74EhOI4gTOsj1jxT4z1ktUzSoSv3tUYwjXj2Gt0+0gzCsRrkpu1uISUquWKidKXJdSBsZRGzlPXxAyUbZih2wbOLn8+lBergPasmGKyWnlvIHtP5aIvCFfOnubk9wy7GPuF6BbDnXT8tnb6uAtBdYResujVJxRf5oO4+1oYb2CBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 21:03:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:03:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 6/6] drm/xe/xe_guc_ct: Justify WRITE_ONCE/READ_ONCE usage
Thread-Topic: [PATCH 6/6] drm/xe/xe_guc_ct: Justify WRITE_ONCE/READ_ONCE usage
Thread-Index: AQHccDP5+z39ANu+hU2jRJiS1kgT3rUn4niAgAAALFA=
Date: Thu, 18 Dec 2025 21:03:45 +0000
Message-ID: <CH0PR11MB54447005D7FF2D3CBB7BBB36E5A8A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
 <20251218153527.6436-14-jonathan.cavitt@intel.com>
 <874ipn33oo.wl-ashutosh.dixit@intel.com>
In-Reply-To: <874ipn33oo.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6384:EE_
x-ms-office365-filtering-correlation-id: 0f8690e3-d050-4c70-0f3b-08de3e78eeca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qDkZyMF0NIBKL+HNlx/F/oE9eEcZZoaQQYdUdR6TfjfMJ+7pujT3Eu//fMcE?=
 =?us-ascii?Q?QTBhlFAEacaot5SfGJGf4ezVbczlp2FgcDc3woPr1nz1wOIryOHWrFagifrO?=
 =?us-ascii?Q?kBWogQMEPhseSlRSnd/IQw9f5d4URNsWbIPDBWwpa5uOATN57pnIcqS4wJCs?=
 =?us-ascii?Q?JQ14Rk8Dk0oXPAVU8nrF0B79IiOAm4A4Qmh3CyZ7xwbhaITAGQ9pys3odASl?=
 =?us-ascii?Q?GAx+O36hPg3k0yWtTr1butxKL38jrvJsZDkq1KFwr7H9gtFWwh4RiHWgtHsl?=
 =?us-ascii?Q?qDmDI5Ly5mHhhNNYBzmPwp7bQ1aTFIMSHfZIZwWOUzgAGRw8T6j3QsQMvFdN?=
 =?us-ascii?Q?cdZP8ayDE03heXBTj9rUyWqHQQNp9a52WSpuEX9tn13+l5bY+YzmsxLatHZp?=
 =?us-ascii?Q?8kCMjQ/LoZYHzPn7GqfYfNPSwwH7x3fbhMjFjYgP44z8nbn6jau0IuN+eYTn?=
 =?us-ascii?Q?NDR3XZtnZ2K2OV698oFioFd8YAhQAjLuBDdWd6EcO65ywTwTcqu8j0Mu1Mwz?=
 =?us-ascii?Q?S3YakU+WFICEaxgKNm1pHWzUigU5p7hyqi/Nqv9P4QTbPAoebCKx0PLqEHXl?=
 =?us-ascii?Q?BYz2jrICURcCVGDBvt1fNkYPQbJYPxwRub2YUSiocxOWyf1+F0PmT6FVbZOE?=
 =?us-ascii?Q?UXA4lTveTrydyv7x4bVAVkEHEhn81SsFiXb/32cAW7I7OdXWKgzCyUcAZASR?=
 =?us-ascii?Q?uEEVeHETJe8+SSilw03qRdsU9FdCadAj1i25sTnRT+oBLcM1FD0BdyH2vRmS?=
 =?us-ascii?Q?UWArtHOmcbonaJFWUJjyVpmgEgS46YRUx+GZYUyv6aaBPInUK/GMyoT0ssK9?=
 =?us-ascii?Q?TbTETfLHSsT7gZ887qsiXdDtHn/aDDeWYaOiLEmgE+10JyPOxmX8o9tKJ9/P?=
 =?us-ascii?Q?hfqRLqgbw+wX7wj6KYjquUD8CCdx00XpH0oHz8N1xFb4DUuDvXOzVWmI51aF?=
 =?us-ascii?Q?lgA1r4kqcA0DuznPb6LfKZT6kYMJAYcrHiC0HyIZRKxxXWbygUHpK+53hrAn?=
 =?us-ascii?Q?IeOrKuXB54imvPQWbMIVH79FVVPb8LrLX+LoFo3xH6tC6YPZ+Ljok9O8EiDd?=
 =?us-ascii?Q?AbqODwMTLBT1JOwG+Nc6TJuogoM+AzeewULg5W5FY4Nrq95n7WAsIqznKXAo?=
 =?us-ascii?Q?Vce7jsPNW/oHtu2pV60P11/FB8+ZkwFG8pxjGW2sGvoJI/VPU+28ZbN5kNmz?=
 =?us-ascii?Q?YEVduQFWDHtDexonhMaQ6bdR+GJDUXm7ajxKRQHqysijHiKFiABVRUe13wRS?=
 =?us-ascii?Q?1GhO2RyNUCcOBRNI8VFcbJtGBsNVU/hjxK7wzL27lOyHRtuUqSv8Ufw4psgx?=
 =?us-ascii?Q?06dSZa3ITb7MDXPR1a17KkKZNIh9dk3XGbBMqoDxFNskNS7DiNgdpmKfx/qf?=
 =?us-ascii?Q?PCgEarFEBAeN39DTcI2Sg/MzsenjNoHoJ1Vr9oIvQpzT+YawppIwbt+ltaMB?=
 =?us-ascii?Q?uvhM/pZ3A9Sme6CQn0Y1Lmq+O1nFRoKZOj17MEB3VSdA2WwSI1YpIH2CRqwd?=
 =?us-ascii?Q?9+LwvIWPF8hAZlryzsRvSFfUogXN7GrICv9Q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OyZwKMhx4kxaS+3vHjd0BFAdR222zLR/L0LF0DiINrEhr6Aj4zgve4IrU77I?=
 =?us-ascii?Q?b2G0VMy6MiT8ndEcO77sTl3V5L673w0sf/xFPGCEO8qFJmJiemdrGH0jf5kM?=
 =?us-ascii?Q?vNb15G/S59+p8mjtQdHpUvrIapEJ+wa9od3E6szXYxnr+MSgOTR8+Td1Cxru?=
 =?us-ascii?Q?u22xOL7sc1mNWEPSorraBaM2SC/cHD1LN0Udcad8xPlWTX+yTrYIoG9N+ccT?=
 =?us-ascii?Q?y/jDGnUH0wIlbuVpg5G/4vzrG37XKb1Uu/hHMtniiD6LmmncdBJ3DP24BYsF?=
 =?us-ascii?Q?u9k7ntuv9XYQx3rEjAkuhvbEn2v9qCaSlPlESrjMUqK9X9a0tj/37eYyOJiN?=
 =?us-ascii?Q?ztFtXjYt6/q5dEZg7hXVNWK/K6Pb2S0tgLW6MldklgB6BaCDzA9RNc8FQWhQ?=
 =?us-ascii?Q?xKdH7MvalZpnvyK0b72ND+sYBwhp5oK4q9uCFEGu9mMye0guQOAIErkykFYB?=
 =?us-ascii?Q?RskAWLqyTSyK3NXl7+H/9ppT9Y4KTSOjhJkDwXXRQ61TPikY5Be+X+IjLHfw?=
 =?us-ascii?Q?gWDjYlG2jJ0fwcvzjY1NVuCGfJOeJ8QDlKurNZSjcr7c+8S24zqJBT+0Uyib?=
 =?us-ascii?Q?xkd40LhsrOzetTsqUyp3/gtTxZRxNCCq77Qx8lT7f1sYX9mxIcCt87y1Cax9?=
 =?us-ascii?Q?di80GIxpwoLrRKgI0e3ZMlgSyT7CVAU12rCY9NGUBoyWs9h6SMZmXQ8suNDK?=
 =?us-ascii?Q?Y957xXh/jJyivkZ/vLtvdoosQwSIW/M710qYH0PTiD+I+XMWIv3vWc2uUtoc?=
 =?us-ascii?Q?a5N3d+Fuv59uWtJmoz8dAcSaMKY8CBt2uvRv/bePrY+4Z0l2ceG62p2iqTze?=
 =?us-ascii?Q?lazrs9pQCfbuRYlBDWJ+cf8vIbC9Tu5mBP2E/V8a06vm0kOtj4W1BQnxWame?=
 =?us-ascii?Q?EE2xGKfEs8yixRHBRJQ1V19MblzdxQ46AehReFbbViyi0Tj+f1XJ8eJjW83i?=
 =?us-ascii?Q?JZxhAf9mEPSOG0jlLW8VV8FFU/Hf+5AnxLLPUbWnWFwjhBDEGvieVUlkGE6p?=
 =?us-ascii?Q?87Eyyma7VhbvcmQ3nHT7Vg+0XF57oROoBYJi53WnazjplLt9ZmFeBI/Iy6gT?=
 =?us-ascii?Q?yxgueuF47t4ae+2k0z6i71nelo0b2j97COYj34PEW7zVQmHXSBF2sxQLw889?=
 =?us-ascii?Q?UauhAeJ2UX2ljLjgmwOXuXNuPe55t7bmaM72dcKm3mHAP/7R4Z4L4emIYDB+?=
 =?us-ascii?Q?zWZmuEXrB4tTeZXpSc6FleGVPmpA/RH80JYsBHXzRybnXkh8ElJvFr7gMuJb?=
 =?us-ascii?Q?oQ/wGceg92BQDVgePww1hRy158Wbhp0yohpxY6ojvHy6h0nb3DkWZ8LcKMmy?=
 =?us-ascii?Q?kqsWR2lJhsOobHFP8Kzsf+TFUopd0tr8kEBrK73+vfCl9Rhkuf8h6PoMoiY6?=
 =?us-ascii?Q?LqTsMPxCo0av0N0e/3pjuSSh4D229nwwzuh2VmoEoraAFYuh2kmWEQHeewGx?=
 =?us-ascii?Q?gsO3qd8NRaURxAkmCfA+CP3R1b7YVJcpBqhVLHJ560g7tpgu+Z4wCZk06ZYi?=
 =?us-ascii?Q?B9b8fp2Dz8Y+P9dmLirMZsbTfiGTpaX23FyePNw2vPXz7gcv/VQ7dWTczZKC?=
 =?us-ascii?Q?wL/6bLM4XEeSaLu3GSon2jr3B/Q5o+LatIDEUga9EDkCqAififKdlDaHE/HQ?=
 =?us-ascii?Q?nlOTVZy/B6nYhat1XabafZvGtJ57xjrx6eF66yYkx/d5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8690e3-d050-4c70-0f3b-08de3e78eeca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 21:03:45.5813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B8XpXCVx2+3noe0feUj736+XKQ4YCJT7M253O0zlCsa5Hyn8Ady0e+WI9oApkCDJhrOKwuqEZ7LeJfPQbWlbJEZNWZ5wTGFud0fKjDKfN+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
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
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Thursday, December 18, 2025 1:01 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, Saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; Brost, Matthew <matthew.brost@intel.co=
m>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Vivi, Rodrig=
o <rodrigo.vivi@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH 6/6] drm/xe/xe_guc_ct: Justify WRITE_ONCE/READ_ONCE usa=
ge
>=20
> On Thu, 18 Dec 2025 07:35:34 -0800, Jonathan Cavitt wrote:
> >
> > Usage of READ_ONCE and WRITE_ONCE requires comments justifying it.
> > Some recently added uses had cross-dependencies with each other, but
> > needed to be added separately, so introduce the justifications now when
> > it makes more sense to.
>=20
> What is the reason for doing this in a separate patch? Afais, these
> comments should be added in the same patches where the code was changed. =
So
> people can see it in a single patch...

Because the comment "WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initiali=
zed
and xe_guc_ct_enabled" doesn't make sense when those functions don't have
READ_ONCEs yet.
-Jonathan Cavitt

>=20
> >
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++++
> >  drivers/gpu/drm/xe/xe_guc_ct.h | 2 ++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc=
_ct.c
> > index 20ac0438ffb6..24857c2c8cb5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -529,6 +529,11 @@ static void guc_ct_change_state(struct xe_guc_ct *=
ct,
> >	if (ct->g2h_outstanding)
> >		xe_pm_runtime_put(ct_to_xe(ct));
> >	ct->g2h_outstanding =3D 0;
> > +
> > +	/*
> > +	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
> > +	 * xe_guc_ct_enabled.
> > +	 */
> >	WRITE_ONCE(ct->state, state);
> >
> >	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc=
_ct.h
> > index cb1335f1d66f..8d318b094f33 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -30,11 +30,13 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct d=
rm_printer *p, bool want_ctb)
> >
> >  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
> >  {
> > +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
> >	return READ_ONCE(ct->state) !=3D XE_GUC_CT_STATE_NOT_INITIALIZED;
> >  }
> >
> >  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> >  {
> > +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
> >	return READ_ONCE(ct->state) =3D=3D XE_GUC_CT_STATE_ENABLED;
> >  }
> >
> > --
> > 2.43.0
> >
>=20
