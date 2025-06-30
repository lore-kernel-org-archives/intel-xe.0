Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB879C83033
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 22:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17B810E4D2;
	Mon, 30 Jun 2025 22:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4wVOdIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6480610E260
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 22:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751321327; x=1782857327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HTkpov9WejcplAkg1RBoSKQMUYRQ9oUBgYNeEB0mwu8=;
 b=n4wVOdIgwErJt0Yq3J3kgmFhCvZ135SIqidoB/YwKeOdZbyzk8hmACQ2
 GlmkV7m3b5ePlCY8G8N1hcqlbukl62N7JT5557rccr0M9WleuRo5aEe8k
 fsN30pHPeM/KGTgfEsX/v25MtBXl5bcV4idvFXnPm67gCg0YXQJwWgFHk
 xcmI9aOzBuZcbB+GR6rRiSQsYJtVr/rqjnkMgPVRY5zpmdNEI7eBcMJxZ
 6/SR9QsFaeT46fj7VtCzxnHknN4fqBTMk09ASA+/KBVn3uSw3HSXAvKVa
 +Aoxfoulgl5UNy1m0xwBmt08ElCBw8y/kg/8L2rX4KFTZJY/OOFeJLTmo A==;
X-CSE-ConnectionGUID: WfPmssvFTKKv1R5OUkQiFg==
X-CSE-MsgGUID: QPQyf36tQX2g/MnofA+kOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="65008800"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="65008800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:08:46 -0700
X-CSE-ConnectionGUID: WNvLF8osQRK82yBwNctrqQ==
X-CSE-MsgGUID: RhfOUNQzTDm6aQGvdlOq2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="157622192"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:08:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:08:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 15:08:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKi8s7oq6WzKvvEjCPN+ZUxeScKPYePUBT4ZAUtiBG/yDgWPikiymLRDJ3YQC3yoUPbr5Eh6Ws5juGJyxI3U6c5wloBI+jmNR4ZK67P5F1rCbGBXUVWCL3GcH9TVkkYNjrmQGlh7KUJ/2if3kZxVQna0aj0KGhPKUvnkXGLomv1Bs3EgoEzc/Bg+D1Z6LFLGM+TVL+lvl8P5KoxPxuRchShjcrKKMbvW9buQ0wg3liw4jOUL5s8EvuO6mvYL3/LntfA5pXF0xnE/3v5qLQiJJUkfRqljemdlGqqj8/RRzH8y8javUsePWZ7lPJAv7i8lh77FYvV/M1T2XdjBMkrWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0AKFVJk3qqByunhRmZ9qdhFuo8Jg7oy5tFgodSgXwM=;
 b=g8s8o1m0usbzLyDQdjn1ytZhJZrb2VOEmVEKjeTQu8Ugj76rIs/ydEUdO1haXyIxqbXbrRMA035MJR6HxzOVJc/WjWlqGNehf7DSoU6R1mAmcl0fVE9GApOcp7XGJXrKH/zD4VVUucu69EPjCL9kIGc5HsWLVnklLHzOhKIkZl8sjPwuC8hMBTY53JYHiuX6kkjJYuU5fHBLOYbDMp3qWLQcTZlWLwuxlFbADB+h61oMG5ttHNdBa6/FvcDlD7+nn7XWVsdOhy8oqi2Jzle2PVaWnbkN8soP1+MYTioJSTeN1YQglRlDY4FHHlnvPRrDEzkPswg6wi3ByxK0lsQiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH8PR11MB9457.namprd11.prod.outlook.com (2603:10b6:610:2c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 22:08:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 22:08:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 5/6] drm/xe: Don't compare GT ID to GT count when
 determining valid GTs
Thread-Topic: [PATCH v3 5/6] drm/xe: Don't compare GT ID to GT count when
 determining valid GTs
Thread-Index: AQHb6eVo1/zgNVb4KUuw8kRjOIKQirQcPeEg
Date: Mon, 30 Jun 2025 22:08:38 +0000
Message-ID: <CH0PR11MB5444D78990699F9D773EFE53E546A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <20250630173438.2342706-13-matthew.d.roper@intel.com>
In-Reply-To: <20250630173438.2342706-13-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH8PR11MB9457:EE_
x-ms-office365-filtering-correlation-id: 490174e7-c171-4a1f-1af4-08ddb822aa7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O2/SfmJFFazAOe+YLPbPsnvUiku8pVUpx68k8qAyS9UuLwRVUHvoZultIRu1?=
 =?us-ascii?Q?0T8polkOIdlL06eu+HQLndJlalqJWHjX0LoeYD5S+yH2u42BhcnCMoygx/ki?=
 =?us-ascii?Q?avlvstNrHp6W38kti39IcZoiRQ3d+WThhk9V9nE4H8kcKBmYHR4ySPBtpNsA?=
 =?us-ascii?Q?Y4oxRGyp20TYXLg6LjjAzlu2GJbiEBlIojljL8jcXeqWPjVNN62ggtbxbIdJ?=
 =?us-ascii?Q?4ghIVLUG5XkQw1wc2Gx9z9h2iTnHv+lXVG48w3GyQUTQR/rhSh0w/H2QE0FT?=
 =?us-ascii?Q?UTli/K3Wvf7chuH78mQnOZwghJfJsCDnSTzG4Yj4dvplbtJn1DFlN6Kq5z2M?=
 =?us-ascii?Q?XBjpb9vV8258MAJJYAZ3Q51s4j0ePq1t2/Vs6qYkcT7FbRZpwzDNjbu5zodM?=
 =?us-ascii?Q?l8qZN+93LPa/8YctZRuGhBDxFIhI4E+UP5PwLx5jnkJke+miLTTEdwDn1WiB?=
 =?us-ascii?Q?uNlR8QZ8rLXDC698dxnHIfmSCkRYmP7zdFEDFRR37Ab7NZaOY4oqWUfJYrvk?=
 =?us-ascii?Q?EkgrrC8prFXKpsXlgBhHOLH0rOd1Y5g3W77MlV0N3utq+3jWuqSrnP/5wbE4?=
 =?us-ascii?Q?eqM2tETOFE9j5xdAHPP5lQa4INdW0nHgxIMVjG0Kbj4lPhhByJjn2p9EB7ps?=
 =?us-ascii?Q?CK15VgfCCMzY2+0/YzE+WAt9xPIjB9z777XWvxXOroFJMcOWNtXiP8XTPuLv?=
 =?us-ascii?Q?Txt5gggP4E4Jp9HPGhELawy+V1vk6IYjXq5mR6hqgdjsFKriLw+v3FygIDhv?=
 =?us-ascii?Q?ut4MuyhKFnRV7QCZLmSB6BgiCXK5qjnMFwmsA1jamAT1ntZdJZL5Bbnxcroi?=
 =?us-ascii?Q?PXheaTBNs3epYVPdDhFRpN3mg/LkCjHPOuNF4+gfh7mKfdQboz9v7hIbquZ8?=
 =?us-ascii?Q?0wg56WHHkDeVVHOOm9eFlmHahGovSGFmy+AX9n8kDnyIKxXyzA1pKIjddsCL?=
 =?us-ascii?Q?MgIaVyGa+N0Pb15k8CCwenLDUUuKi8Zz1J4aVW9zCvIWgd+9okmzEoY9zNvT?=
 =?us-ascii?Q?juNsrUxxqkDQ+hVMQpSzy6NaQPTWeMmiNRpCmD5ZtKbk74YYRn5jBSzboTkA?=
 =?us-ascii?Q?ssnlRYqL16u2gEcC87PchGnecuLu3vjZMmDnEbo5aHwFsv6aCR5jmN53BRfw?=
 =?us-ascii?Q?hy/4oxDFXibqygLh3V+ReZebKAdDIMTGysww79hhEiv6U3m8kwJ2v/S839c2?=
 =?us-ascii?Q?tRrQVK0nmbfe/ymhVvH543ki688X95cBG0s64dHsQ1DL1/z75IR5hGSzwDIj?=
 =?us-ascii?Q?KxPZoZnaU3I7YwJbMYNOQar1n+jfi9OM0128/kctEyRDGkewN4VJ40WlY1gT?=
 =?us-ascii?Q?l/Se3uMAQmaoBlp5gKLY1zGfKZroMNYeAjyKcMUq5C5JNKy9rRFGntVNzL0S?=
 =?us-ascii?Q?TNW/7kmuQc8XPd8MYt3AHZM9X098gVLT7dOCggPOVu3YAvZoU0oU+HfamIpa?=
 =?us-ascii?Q?bTZm+A8h2/T8YUweDMDVZZbu1WbAOt1i8t9Sf+ghyYNZRbjpvOicYo2jolw6?=
 =?us-ascii?Q?suN2WlCyRtL3lZE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Svi0/ijn+16hkX1NYDnLIjDGh/MwEfciwk1eCAF6EI7uHGnng2URfR0iQxii?=
 =?us-ascii?Q?jUK8UzZzKXpwus29gouuQ9wIatqNou8NrSFwPVcSQbexTsJfjlQDK3fgrki0?=
 =?us-ascii?Q?ibBFBmquwSBjAbq/gTl8TnJDlwlK8+gedSf05oKNVKIlMAB/knfV5Xe9Eajc?=
 =?us-ascii?Q?kwsNVSvT4SIVY2iqn+G2Y9t766NgLCSTJFXnmFrDQSuUQOsTo63a6A7RF3ip?=
 =?us-ascii?Q?GWoZG5UqCtYMdyxW6f+yKaYpk2ETiVVBau8S3bj5yuf5h7rHdHlP8A76Grwb?=
 =?us-ascii?Q?LLs71d5E8G/ngH+flknHliHFUjKpnAUSkhU0q17wV85y5+NTJASwmGQA95hs?=
 =?us-ascii?Q?7PWJdRTtZ6I8qBWpCSHKs+FvaGVetcBtcF31borkRALNWcMRsFiV421aEsSp?=
 =?us-ascii?Q?f4aPNcFBbMr/AM5UKSxJ8Y/NrGeAArcfR51JoULREYMXhSDQQV2YIzOocsKL?=
 =?us-ascii?Q?jX6aR+hJm83qcHhsVA1YgMmSROVjDOVHDv4PFvglNRqcQRx3vKOzCnwDYpPe?=
 =?us-ascii?Q?fB8fdVE3TfUIbn2sVN1elk1P9aLf6ulwpujqyLJSj8ckOeZTNmnEBJgtV/eW?=
 =?us-ascii?Q?71FrPMcKTXyOOzlEZgOPO2KgcRkGewm2UrUnHiUMJv+P8OlWUcuwASokEx21?=
 =?us-ascii?Q?tu+90f6PWp6i4EXXppUoGayS03/htzICZVXjr3jtVuo9O+plMEHulT432Syf?=
 =?us-ascii?Q?gWoKymYfHjdT/d0yYS0nT4Yzofxh8vp/lzmaCs33XKj9TvAEEqiMLGu9IrZu?=
 =?us-ascii?Q?S0FYp79X6wPFeR8KHuTWG/GwXwpPwZApiKr1RodSebrGsYAPuTAL+yIzCkUC?=
 =?us-ascii?Q?byr2PacnhlQNnnHO3CQ2Y4WvhKFCrxUkTpwL8I+yXyutOFrZJfU1T68KNe/v?=
 =?us-ascii?Q?7coQxj0Vk8zpwv8uXp9poBPfgsktSTQOY7UleCS/CyZOKOvhInJURVzABDj3?=
 =?us-ascii?Q?Zej9oz91JHjm+RpYK3LS7nCDoj2zCnFah4rw7OceCAopZXbsptqWgJDXGgQc?=
 =?us-ascii?Q?FxEupwI3Gq6NDBYoJ6Zm7FwzUkQe/mmu7FpEFYBvfvqmmWCpaPHVVnOeJD9m?=
 =?us-ascii?Q?jE5PsDFu2uYryaP60dxNVjnTZKLAQNKpXEVJJ+Wz5MAf7l75DF8Z/CJj32Ti?=
 =?us-ascii?Q?bh/DF8xm3lRfH7n+s1TLAMu5RNEX/aXb90uzsMFHtZ2GCjjI/6DsA4Kj5pxL?=
 =?us-ascii?Q?m/3BpfLu67VxhK2j9beijJD2HqVAgsLqN/iPIUcAvge4ww2KeCL4RkPt7m4W?=
 =?us-ascii?Q?l0GIGbxPGfBTkSS7w5na6mN3E50jSi1BOvMwZN31iE0rDnVRyfqhNsD9G/Vl?=
 =?us-ascii?Q?nKi6KPZAHv+GiQDQoqArNZ0Q1g9WxD/k2PaG20luhFFfuiKbmGzREBWNbr3Y?=
 =?us-ascii?Q?oUpSItyiptP+5YGgmGg6abgoM9tw3qIRGIhG7TqZkxR1Gmz27S7ycI2/lJWG?=
 =?us-ascii?Q?xDYgJwg5t0MKXX5sYqrtI7B0qny+kE3DZUcxKYbIWbqSbfwhcHoQGJj5Yqvd?=
 =?us-ascii?Q?MGwoKUkzZuPYSicoOKCh7k9tpPr7r5Opg1DQJ8Yha/kMR4RM7VJcll1Quy8A?=
 =?us-ascii?Q?TaikvxPBPRz6207CVpn7CMZaPJJT7Ukeb1ApiUYn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490174e7-c171-4a1f-1af4-08ddb822aa7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 22:08:38.4870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEBSRQ9osieSR500tFiZ/qfA7X+Jxl6zX88/arQNJn7tclu4n+8hH6/6J6BxRtNP7JbL/e21yzUMMQQXOaQcjGJCfmeBXPoNf7RCZ+6H1/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9457
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Monday, June 30, 2025 10:35 AM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH v3 5/6] drm/xe: Don't compare GT ID to GT count when determ=
ining valid GTs
>=20
> On current platforms with multiple GTs, all of the GT IDs are
> consecutive; as a result we know that the GT IDs range from 0 to
> gt_count-1 and can determine if a GT ID is valid by comparing against
> the count.  The consecutive nature of GT IDs may not hold true on future
> platforms if/when we have platforms that are both multi-tile and have
> multiple GTs within each tile.  Once such platforms exist, it's quite
> possible that we could wind up with something like a GT list composed of
> IDs 0, 2, and 3 with no GT 1 (which would be a 2-tile platform with
> media only on the second tile).
>=20
> To future-proof the code we should stop comparing against the GT count
> to determine whether a GT ID is valid or not.  Instead we should do an
> actual lookup of the ID to determine whether the GT exists.  This also
> means that our GT loop macro should not end at the GT count, but should
> rather examine the entire space up to (# of tiles) * (max GT per tile)
> to ensure it doesn't stop prematurely.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Maybe it would be good to have a macro to generate the
(# of tiles) * (max GT per tile) value (or just save that value to xe->info=
),
as well as a mask of all the active GTs.  So, in the above example, we'd ha=
ve
4 max GTs with an active mask of 1011.

It would mean we wouldn't need to call into xe_device_get_gt in
xe_exec_queue_create_ioctl or xe_hw_engine_lookup (just
compare eci[0].gt_id to the active GT mask instead).

This isn't a blocking ask, mind.  Just a potential optimization to consider=
.
LGTM otherwise.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.h     | 6 +-----
>  drivers/gpu/drm/xe/xe_eu_stall.c   | 6 ++++--
>  drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 3 ++-
>  4 files changed, 8 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> index 4e719d398c88..f0eb8150f185 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -127,12 +127,8 @@ static inline bool xe_device_uc_enabled(struct xe_de=
vice *xe)
>  	for ((id__) =3D 1; (id__) < (xe__)->info.tile_count; (id__)++) \
>  		for_each_if((tile__) =3D &(xe__)->tiles[(id__)])
> =20
> -/*
> - * FIXME: This only works for now since multi-tile and standalone media
> - * happen to be mutually exclusive.  Future platforms may change this...
> - */
>  #define for_each_gt(gt__, xe__, id__) \
> -	for ((id__) =3D 0; (id__) < (xe__)->info.gt_count; (id__)++) \
> +	for ((id__) =3D 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_=
gt_per_tile; (id__)++) \
>  		for_each_if((gt__) =3D xe_device_get_gt((xe__), (id__)))
> =20
>  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_=
stall.c
> index 96732613b4b7..af7916315ac6 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -258,11 +258,13 @@ static int set_prop_eu_stall_wait_num_reports(struc=
t xe_device *xe, u64 value,
>  static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
>  				   struct eu_stall_open_properties *props)
>  {
> -	if (value >=3D xe->info.gt_count) {
> +	struct xe_gt *gt =3D xe_device_get_gt(xe, value);
> +
> +	if (!gt) {
>  		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value)=
;
>  		return -EINVAL;
>  	}
> -	props->gt =3D xe_device_get_gt(xe, value);
> +	props->gt =3D gt;
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index fee22358cc09..8991b4aed440 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -610,7 +610,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev=
, void *data,
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
> =20
> -	if (XE_IOCTL_DBG(xe, eci[0].gt_id >=3D xe->info.gt_count))
> +	if (XE_IOCTL_DBG(xe, !xe_device_get_gt(xe, eci[0].gt_id)))
>  		return -EINVAL;
> =20
>  	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 3439c8522d01..796ba8c34a16 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1059,12 +1059,13 @@ struct xe_hw_engine *
>  xe_hw_engine_lookup(struct xe_device *xe,
>  		    struct drm_xe_engine_class_instance eci)
>  {
> +	struct xe_gt *gt =3D xe_device_get_gt(xe, eci.gt_id);
>  	unsigned int idx;
> =20
>  	if (eci.engine_class >=3D ARRAY_SIZE(user_to_xe_engine_class))
>  		return NULL;
> =20
> -	if (eci.gt_id >=3D xe->info.gt_count)
> +	if (!gt)
>  		return NULL;
> =20
>  	idx =3D array_index_nospec(eci.engine_class,
> --=20
> 2.49.0
>=20
>=20
