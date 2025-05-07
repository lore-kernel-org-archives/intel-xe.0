Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF0CC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E481810E1C4;
	Wed,  7 May 2025 20:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQ1NOfsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EAC10E8A0
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648881; x=1778184881;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z7ojk3Y7x/Q/R883tDo5baVDceVZ2XR2O38IdTeBfEQ=;
 b=RQ1NOfsr9OQGg/5l93AHBmCboeZDVNMnAiBLjXanRAbUCYxw0Dvzs56H
 LmueJPN+w3kvqzHUtHjq1YbkN4ovSTDyf62cVCbiMAisJGODMJIJ/ZgYl
 acgTyZZsiGmvTKhXAzFzZ7AE1grnAFvddZA2FpcnsJt5vb1DOJYeO4Ni8
 8nFt0fH+8wxBXN7TEbPM7wL2GVHhiR7+8WusrVLsUtnMUiITPn12ixf4W
 I7DncdLonbvcHG4OGKXT7BfMxA4pdshX6YSFO8tPuh1pSRKIk5ilL1iqy
 S34SLMQXSiKwgkvHey5997nzk9yfdo2AgLTKQQPr5wWIqcFoPeESfoxgM g==;
X-CSE-ConnectionGUID: PEZHs3k2S3CrNVr8nVyqDw==
X-CSE-MsgGUID: 8gGPOGlmTw2qlJHhwlZ0rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59758267"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59758267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:40 -0700
X-CSE-ConnectionGUID: 0bu4K+ZNTwaO32ioxs2vRw==
X-CSE-MsgGUID: vXOcSaymSV2pd3u/ConhJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="167119441"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:14:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:14:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8oVrRcCLuR+6a1Qdd8ym0u/RyhvH3EnsSdWCCyYOG0lJTs1Kvtk74DKI4EOeyPW/xVnvQjkXu0emqRch6n1a03mu5WQBRe4LE4yU3qolNmGUvmmDEAq9/p8PvaKcP+JusoRaBQPnuXV/ZNyauEBbO3wzxGnyXhoasBQk45MJSK5n6j2pYi0LY3MbCj9vnWubyilTgN/vMAX5VihcYa1FeyjVYoDNa0B9gscAknOdCXmrTqvIDjOhB3tg3xHW6Z25C/o1a+hpwS0P4bOLa/AOx5ZFW4PA4tFUkYos1jHAmDIiK2cyOGDdD8fg6Lb7TO1HYGbAADoaBoH1Pg70+jpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpVH4HiwNREh+jGrXPNEZjJYoPSrb2bfzVgXYhRGKok=;
 b=nHFW6+hySZNNikZQnhXozaDiqVL/SjEmHGj2gJO5OPN44RoAcb3DNkCGE1lQSYpL10ee9H9jWH9m6uNUKyWYas6EqJWF9afligMo1W03ZSnGpsOxt1zNP5iEZbwxJinUF6oo4qvXowFkGESHHWjYVZq/qRGVhyRx5nscc1u3PTCAu2IUomgqiDqfpERM/zajPGI8bzPZ6e8y7qaLbDZPF3lwbC/E3+X0pLpKMsEFyiMmsS3RvB56NwSI6Eo8cjX28aYgCk7wvKC8sv+Z3+/GW20OQ14r7lIK6FmedPhBD0P/3rX2bXIMFvShlLHyYbUgyVU4jZ1eV3B1E1QjTXOj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CO1PR11MB5203.namprd11.prod.outlook.com (2603:10b6:303:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 20:14:32 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 20:14:32 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2] drm/xe: Add config control for svm flush work
Thread-Topic: [PATCH v2] drm/xe: Add config control for svm flush work
Thread-Index: AQHbu4Pn2Mnuzn8QS06BcNWiXX8VVbO/kseAgAgN4ZA=
Date: Wed, 7 May 2025 20:14:31 +0000
Message-ID: <DM4PR11MB54562BCD985B591B7D10953EEA88A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250502040757.1722973-1-shuicheng.lin@intel.com>
 <20250502170052.1787973-1-shuicheng.lin@intel.com>
 <aBT8L2f44VrIGlzO@lstrano-desk.jf.intel.com>
In-Reply-To: <aBT8L2f44VrIGlzO@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CO1PR11MB5203:EE_
x-ms-office365-filtering-correlation-id: 9d7e9196-25c0-411f-6401-08dd8da3c75a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PeTptPNCSfCreQ5o9herC+AZC+n1Jcb0UpM8m0D9/oYE+RMg8p0smUHACMZp?=
 =?us-ascii?Q?yYS25rZFOyvXdwKMUVZ3dVp0u1DPZKFbs3Q40jOzBCLlHAImjH+dkjc1DiI0?=
 =?us-ascii?Q?QkJBkuRoFDVgm4bJRaTrMdnu7IXk+DB3ijqxhx0BHrTuhAr2s/U3x6K01zni?=
 =?us-ascii?Q?0yGhmTFamaJdv7oxbamGL8bA0RNQvHzUxTtFBhNPlg9BnmcW3z0jRCMav6Aa?=
 =?us-ascii?Q?nobC0RlSPv5KxS/3tCrl0K/WLe4Y7tzAi+fo4TE9y95un833sDgwyuGf+ScB?=
 =?us-ascii?Q?Nl4YHE+fpxh8nnHwAlEvdVvhTQksT2Q7lvS1gZuEC+qEqmSY/tzbAmtNBB6B?=
 =?us-ascii?Q?TEF0J5K/p693jy4ifbzWDKU9Q+epFrls9hvEJO+KRjg0BvTx59WxpKf8E1VM?=
 =?us-ascii?Q?8Ol0lOIFPiE4OnHozVrbS/4YlZ8S5FXg9lsIet+5ssGA8wHXQSa7BnI4AGLb?=
 =?us-ascii?Q?FMznY6PAtoQMI7NxOOSJeLjbEshkAsJ2vqpubMfsQf2CrQtmCW3pKxuFySiv?=
 =?us-ascii?Q?lxyQ8Lq/2YNlaKpkyPTVmD/x1l47vLfutpaYsacVd1GLn+1r/Lp6GP7zLeKY?=
 =?us-ascii?Q?Gg4LHHXZLKIOZ4/vcs61EYHrVo5GD1yHGPeZLrq6tOGDxhgAfw4XSotn/90r?=
 =?us-ascii?Q?+fkUc8oEdrZtFkr/76QcA34owwNpGTMzQsPhs+G7tC51fZyIco8L/UeA2A8b?=
 =?us-ascii?Q?VWGIn5ChCiCBuwDAYI4M6HafipmnpZZggahhPgJTPPMflodB+SrVElIn7h4k?=
 =?us-ascii?Q?dK6qws6BmXTovTl4HbwXJj0MsAbbME8bqzL+Z2XOGB1504eziMZ1bRHEv8SG?=
 =?us-ascii?Q?SPHTmTtQLFFa6zedg3iA+I45EXiR5sQNwyis4D0KG1T2ccDaG/2/v1sUx1RR?=
 =?us-ascii?Q?LY2w/ufw1a6Zcudw7mkpgAU/A2m2+OtL9AbrpSkcLT/N0pYwcb0FJXxtFIbY?=
 =?us-ascii?Q?TAcSzm9AtHRzYOIybI/d2F5G8o7rOnjAK8BHsCUtDbBvUON1eEQlq8vgAo0a?=
 =?us-ascii?Q?OnHPwmNH5mIjVDNgMHfhVo8DwtAKN6Z/WWZzoAUrgSOWK8tFEUfRLaKBvdYO?=
 =?us-ascii?Q?EzgsaQ9YfbLbFH9W0UpWS8UL+rUVaWk6sIBBTzfOQ720N22gWlD6gi7cvxro?=
 =?us-ascii?Q?CSBX7lgYrN2yDByhOxycoSVQ2nI8j7IPiS9qdBBnYnAFt1bC3hWRMaOOFAd6?=
 =?us-ascii?Q?eezAwHSqv/kiPKUwFoyFu/rumrGxP5+etvjDWALvy324Sa55jPDPNmPurV7/?=
 =?us-ascii?Q?KPUq4AujSKUQODPgXs7X0j33L5vf2C8KY0CYrvinmeVC6QTsIEWLEXTP3hAk?=
 =?us-ascii?Q?uzlEou9I2epzeqOnn7efi9lCNJnhXJpSmDyGKnHKXEH+orAbG2b05z597flw?=
 =?us-ascii?Q?IRDwmE354Wo6U6lDeKIb0rOdPFTxhuaMiJ9G+P5NoeA83EtIydfmVBbUj10m?=
 =?us-ascii?Q?gdi+HBGOoXwCNhyit19eaXc6PEdcVtc4q2mWr5gzruwWUCHD1dySVQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iQsFozGDnvcTxWaHARgI8IXrQtvhJ4kLyTQn8hl0Gnkg0mxkfDMkiluLH6RN?=
 =?us-ascii?Q?92OVW+nsNwNrqKIuGjvbWMybaZlcJ4TXoCkQ6h299/r7rgOzS5CgIrn31oPW?=
 =?us-ascii?Q?WJ2NC/Sxx4PS1u+KMfe+J+rr3/KBPj3LzgVhcemQ5C+zWR/YjZH4rnn9Cscj?=
 =?us-ascii?Q?Ms2vCy93LposO2x3eUCwcGGrjyVR77OdlXqtLwQp4z/uEGuAQcqZ1yanACdM?=
 =?us-ascii?Q?pz+yUQc7p95QyNybSNcJNctzNtCFxlZv/wTQn2XQEEC436ftQvTk/lxcNeYo?=
 =?us-ascii?Q?+Ty8+se6ZzfIF0gs+pB1Gqjg2X9feEy2jWsebXHgRrVAf+geuGfOaashNg94?=
 =?us-ascii?Q?njrCyGGHVjohcvtN9OdMwjaAk8F1cljV0PUrcl2XT+S72QF/doTcYHvwtMcP?=
 =?us-ascii?Q?KAuBJ2+XPTAEbEkThKuLGWvXyNjU7nsyZo9I601CrU25Yga/jXF3XqYgWJWq?=
 =?us-ascii?Q?Q3nUefgj2KIekJ7Jp8V0XB3IXLVcQO14W/ShcrULyzz+CjojfrAGk2F5WOVC?=
 =?us-ascii?Q?+86B+yI7+GHgxvrdh027b3y5fbJ0ZyKdFKcjwcVGm7WPcxZ1tkk8XRtNkUC3?=
 =?us-ascii?Q?TTEh1abFtshtTolqugGBLbzgtoNxH/Y6n5Kggjnpq+HwIOrhDTfWT0BERTx1?=
 =?us-ascii?Q?1e4HofnYIY5SOSwozaiXHk/EuDFOFs8xp9AkDjoCBgrnMESJtgjV9JwSUZiY?=
 =?us-ascii?Q?3hywHT1eZ5TMs5wm5SujL0FrZFWd3fVsnWDU4P49a9jwA8pGv1ome1xYulcr?=
 =?us-ascii?Q?jL9JM/G6Ka5PDsb4aYcJgkZiL/n21WjfFR3eWhtZgXs1+m3nJ3nvFkZemDwh?=
 =?us-ascii?Q?Qn/Tx2v+XphUnGuukCiI4yMVYcu89M1T4z5GfylPdT9GEmnDgwABm+vTJ1Z9?=
 =?us-ascii?Q?9YoT2H67oORPGWYFmEUNofMsxctvSduHwguWUlJEMHirAagfd/abhrAvx0JB?=
 =?us-ascii?Q?kyStJ4xX3lo1M6Bm73j6U2JnehdYamI0y0sYRbiG6jvei9bBvMcJOF1uF7Dn?=
 =?us-ascii?Q?NqPEAGnHUQutjXbZ7NF/PusHnehRZj4KZagHPFh2uzd+rYsEgg856AuE/yKo?=
 =?us-ascii?Q?R8FciNLxPp6Kcz4KetFizK6e1TC/PtPFMW08iS4NOnwiSTBM/6fGzob6i7DD?=
 =?us-ascii?Q?ym4bfLY2Ed2qcciAAwhF/1y1gzOtU4AiJjov12fjyS4/Bp5PDmF3ExzeVzZV?=
 =?us-ascii?Q?LGQhKDEQ2hoJQ88Kev/ms5X9DAqevGZS4odt2liyYAUUqJ7F1TnMimzmFzA+?=
 =?us-ascii?Q?UowLql2pXnOp4mzMFF4sz0qAnivle6UDTWLjnPIY5w/4wqB42n//Vp0FEASj?=
 =?us-ascii?Q?OKA97wLbTjBLAbzfxIH0IbvK/QHBT4q/xAAOyZgGPCjhmgSCIxIb6r6IQVik?=
 =?us-ascii?Q?DU3Oq59MLIam678YTvelIC4L4B2EyFcHY5gZBxHgLrqAepPG8VRrP3iwvwNi?=
 =?us-ascii?Q?cy9qzpHhO7dCY+bfYgsW+TikBaASrNZ03ApOkz2zZlxtCNplT3050kNVj1cs?=
 =?us-ascii?Q?nwmJNBsyZCNoEVBbVL0P2rwSs2aR2XeWcY/1IrWC73qBy5HQXekrw+yVy5UI?=
 =?us-ascii?Q?foN8EaUYtrBxAEd7TxzQV7XP+P3manJI1PC527S1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7e9196-25c0-411f-6401-08dd8da3c75a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:14:32.0124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qLGFac7q7HJ0JKGUQLaRnjoHSO2iaKQ6lxZmldT0nmAdMEuvz6OYXOA1f6rVfuDyZ5bA6mjKJPFyrgPpgVAAZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5203
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

Hi Maintainers,
To avoid forgot the patch, could you please help me review and merge it whe=
n you are available?
Thanks in advance.

Shuicheng

On Fri, May 2, 2025 10:09 AM Brost, Matthew wrote:
> On Fri, May 02, 2025 at 05:00:52PM +0000, Shuicheng Lin wrote:
> > Without CONFIG_DRM_XE_GPUSVM set, GPU SVM is not initialized thus
> > below warning pops. Refine the flush work code to be controlled by the
> > config to avoid below warning:
> > "
> > [  453.132028] ------------[ cut here ]------------ [  453.132527]
> > WARNING: CPU: 9 PID: 4491 at kernel/workqueue.c:4205
> > __flush_work+0x379/0x3a0 [  453.133355] Modules linked in: xe
> drm_ttm_helper ttm gpu_sched drm_buddy drm_suballoc_helper
> drm_gpuvm drm_exec
> > [  453.134352] CPU: 9 UID: 0 PID: 4491 Comm: xe_exec_mix_mod Tainted:
> G     U  W           6.15.0-rc3+ #7 PREEMPT(full)
> > [  453.135405] Tainted: [U]=3DUSER, [W]=3DWARN ...
> > [  453.136921] RIP: 0010:__flush_work+0x379/0x3a0 [  453.137417]
> Code:
> > 8b 45 00 48 8b 55 08 89 c7 48 c1 e8 04 83 e7 08 83 e0 0f 83 cf 02 89
> > c6 48 0f ba 6d 00 03 e9 d5 fe ff ff 0f 0b e9 db fd ff ff <0f> 0b 45 31
> > e4 e9 d1 fd ff ff 0f 0b e9 03 ff ff ff 0f 0b e9 d6 fe [  453.139250]
> > RSP: 0018:ffffc90000c67b18 EFLAGS: 00010246 [  453.139782] RAX:
> > 0000000000000000 RBX: ffff888108a24000 RCX: 0000000000002000 [
> > 453.140521] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
> > ffff8881016d61c8 [  453.141253] RBP: ffff8881016d61c8 R08:
> > 0000000000000000 R09: 0000000000000000 [  453.141985] R10:
> > 0000000000000000 R11: 0000000008a24000 R12: 0000000000000001 [
> > 453.142709] R13: 0000000000000002 R14: 0000000000000000 R15:
> > ffff888107db8c00 [  453.143450] FS:  00007f44853d4c80(0000)
> > GS:ffff8882f469b000(0000) knlGS:0000000000000000 [  453.144276] CS:
> > 0010 DS: 0000 ES: 0000 CR0: 0000000080050033 [  453.144853] CR2:
> 00007f4487629228 CR3: 00000001016aa000 CR4: 00000000000406f0
> [  453.145594] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000 [  453.146320] DR3: 0000000000000000 DR6:
> 00000000fffe0ff0 DR7: 0000000000000400 [  453.147061] Call Trace:
> > [  453.147336]  <TASK>
> > [  453.147579]  ? tick_nohz_tick_stopped+0xd/0x30 [  453.148067]  ?
> > xas_load+0x9/0xb0 [  453.148435]  ? xa_load+0x6f/0xb0 [  453.148781]
> > __xe_vm_bind_ioctl+0xbd5/0x1500 [xe] [  453.149338]  ?
> > dev_printk_emit+0x48/0x70 [  453.149762]  ? _dev_printk+0x57/0x80 [
> > 453.150148]  ? drm_ioctl+0x17c/0x440 [  453.150544]  ?
> > __drm_dev_vprintk+0x36/0x90 [  453.150983]  ?
> > __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe] [  453.151575]  ?
> > drm_ioctl_kernel+0x9f/0xf0 [  453.151998]  ?
> > __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe] [  453.152560]
> > drm_ioctl_kernel+0x9f/0xf0 [  453.152968]  drm_ioctl+0x20f/0x440 [
> > 453.153332]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe] [  453.153893]  ?
> > ioctl_has_perm.constprop.0.isra.0+0xae/0x100
> > [  453.154489]  ? memory_bm_test_bit+0x5/0x60 [  453.154935]
> > xe_drm_ioctl+0x47/0x70 [xe] [  453.155419]  __x64_sys_ioctl+0x8d/0xc0
> > [  453.155824]  do_syscall_64+0x47/0x110 [  453.156228]
> > entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > "
> >
> > v2 (Matt):
> >     refine commit message to have more details
> >     add Fixes tag
> >     move the code to xe_svm.h which already have the config
> >     remove a blank line per codestyle suggestion
> >
> > Fixes: 63f6e480d115 ("drm/xe: Add SVM garbage collector")
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 13 ++++++++++++-
> > drivers/gpu/drm/xe/xe_svm.h |  6 ++++++  drivers/gpu/drm/xe/xe_vm.c  |
> > 3 +--
> >  3 files changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 890f6b2f40e9..d25f02c8d7fc 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -726,7 +726,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm,
> > struct xe_tile *tile,  }  #endif
> >
> > -
> >  /**
> >   * xe_svm_handle_pagefault() - SVM handle page fault
> >   * @vm: The VM.
> > @@ -966,3 +965,15 @@ int xe_devm_add(struct xe_tile *tile, struct
> xe_vram_region *vr)
> >  	return 0;
> >  }
> >  #endif
> > +
> > +/**
> > + * xe_svm_flush() - SVM flush
> > + * @vm: The VM.
> > + *
> > + * Flush all SVM actions.
> > + */
> > +void xe_svm_flush(struct xe_vm *vm)
> > +{
> > +	if (xe_vm_in_fault_mode(vm))
> > +		flush_work(&vm->svm.garbage_collector.work);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 3d441eb1f7ea..2881af1e60b2 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -96,6 +96,8 @@ static inline bool
> xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
> >  #define xe_svm_notifier_unlock(vm__)	\
> >  	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> >
> > +void xe_svm_flush(struct xe_vm *vm);
> > +
> >  #else
> >  #include <linux/interval_tree.h>
> >
> > @@ -180,5 +182,9 @@ static inline void xe_svm_notifier_lock(struct
> > xe_vm *vm)  static inline void xe_svm_notifier_unlock(struct xe_vm
> > *vm)  {  }
> > +
> > +static inline void xe_svm_flush(struct xe_vm *vm) { }
> >  #endif
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 2a9d58a4471c..91a0570abb16 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3419,8 +3419,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> >  	}
> >
> >  	/* Ensure all UNMAPs visible */
> > -	if (xe_vm_in_fault_mode(vm))
> > -		flush_work(&vm->svm.garbage_collector.work);
> > +	xe_svm_flush(vm);
> >
> >  	err =3D down_write_killable(&vm->lock);
> >  	if (err)
> > --
> > 2.25.1
> >
