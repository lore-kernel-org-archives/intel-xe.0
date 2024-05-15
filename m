Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1A4C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 21:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF65B10E0E5;
	Wed, 15 May 2024 21:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UidLfYOj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB01E10E0E5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 21:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715810179; x=1747346179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7+RN/YxeY+JRVADcPv1xvbb8B8CM1Htd4A/zf1RxX6s=;
 b=UidLfYOjBuQfOhPg1h9jq0pr43PqtuFnTrqgw2y7tVPTU1hmEiBBMGc5
 vjdLli4qAVleuZXkvsmoLCu73AU6yj2e0UBQFyTr3M0cePWiUq9YrJAnG
 xQLc3w9BtbF1N3T1jMdWVjr4/z2mPab+hlhXG/BvXOqxDZufN+eqg81i5
 y/VZx7PiqBul06q1qJqsMHgq+SyNxB/2P/6LEyRyEyfyIlnvz3ngnP/l1
 YUHNu0WFLer8+1sMxxBKjlDHz3s20nSQNfmdb7rLn2VlT/Eocittn8ub3
 XmD+bezPvIh944zmF8KqAzVXytsXj1qIG4yaLm2UdyAm9EQ2tVTwoNjgc A==;
X-CSE-ConnectionGUID: M4gi0Cv+QgaKaC1U0n9AbA==
X-CSE-MsgGUID: 1zYr5uOFQwyzi3U+AN+06Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11723681"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11723681"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:56:18 -0700
X-CSE-ConnectionGUID: ElfWs5MZR6eJI6LQQB3FLQ==
X-CSE-MsgGUID: 4WKT3ua1RxOQbdVDv8DDMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="54401301"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 14:56:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:56:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:56:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 14:56:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 14:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmMWJ/Bizz9dl+JNSACmtLmndL/BLFbzZQqbt4bMrBhHc6E2BfVv4OUgP5zIut9YsBJYZlmXiCnhJC/XMbhzYUUFh24vbbmkCWhaC1siEio1tvO7UpXSkAwItMcyLWZYbLlpLAEwob9IEE/6wuTCaN/kKLsiiiI6K+1b3lUqH4FtE1G9DMIPfNNE4Wqq/9Q85lzgS3+h05vaUQGmSFkNj2pf0N5qcTYn44H25A6PJabkDqsM584Trk2G24HfcIQ8mTXBWCbWhSPk4kUJEbY8l4nxF+NdouoszJOumLVWF2bcqEVMeuWorkXkrSNzi8Q+O2Jnr0nCy6i03B8I8nSCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwUAxcK+CtYTYE7hQ0lkiV691Ow7ZISFujaTs99XV+o=;
 b=g2ltEnI+xQX6xd6rPAGHTqDbHs3VukCOWIqJKH8NPpY28drpE0rSsB7CzZli5f/ADpSw6g2l2aFUbquPtK/kvtx/B6QT1xvDwAkx9bNTwi7j6vttwtwyMpmzyLLpjoDJS2GZzcimhPeEfikGAmE5UblFAKJlx+BMrEEVR0GRD9wIIANbNT1gyr6RmN/lmRV0AkSZSdTXU7dLPvtsfieHyKFU3v66u18W6SNR8HKkHMdA/xYb5V4cisq2UcvMN54hFmZDvCFnhHPR8WA446JqkxtVtn7oEcz0GkaO3aO137N3HVC9QvwtGom8weJyyh+cDsxxLvRDDAhQzUM5iGEo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 15 May
 2024 21:56:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 21:56:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Zeng, Oak"
 <oak.zeng@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH v2 2/6] drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Thread-Topic: [PATCH v2 2/6] drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Thread-Index: AQHapmBycv6vOQZAnUylBbiK4V524bGY0YQQ
Date: Wed, 15 May 2024 21:56:14 +0000
Message-ID: <CH0PR11MB54447CD0F72C0D0C121A9D7AE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240515004010.100091-1-matthew.brost@intel.com>
 <20240515004010.100091-3-matthew.brost@intel.com>
In-Reply-To: <20240515004010.100091-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8017:EE_
x-ms-office365-filtering-correlation-id: 58471e0e-b1ea-4204-c4fe-08dc7529d760
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?qFyTjldP4jP4FqY/UyqHw+9dPC/qvzWmlBZTa7qr5r5TPYR9P+tCY+zF4E?=
 =?iso-8859-1?Q?KLOBt3VNgGDmZLmnvVqC+A97zyaQNu4YHL8pZ9UKKu9CSGKLWqajl/ZXO5?=
 =?iso-8859-1?Q?6ruy1FvM3iaVmMj9fP+yzyGM4WaO31CO3/RrrV1v4GW0Nnb7TUo4M7aWMG?=
 =?iso-8859-1?Q?vhNOUYiYb8TFJylt6GWzMRC4xmtb5oAwHhCnZXPMejojoovTTz0KUHZIWd?=
 =?iso-8859-1?Q?NHhAkwlJbhJC0PCA1w9n7D4rr0tp9efc31PNt+KKVz/ArgFmurO/u09SMm?=
 =?iso-8859-1?Q?OnUDSAXVWFyGukEqjLiVu2AMKYklSgzrVs+Mb0vlCkv85hBf41ZLlREUbi?=
 =?iso-8859-1?Q?m2OGrB4E0PBvsmiVoZaTrbgQoJ3cMLYiZPTQAjwuiK+6jBpOzWhOZ6eOIr?=
 =?iso-8859-1?Q?0fWUEZK2+bYxYKXoD28j7omTotBRgyiR+GK+BcO9ehE07alRpPS+HyT5zK?=
 =?iso-8859-1?Q?tnJNc1OPjnvbMVJBt4sC2Aq6rwC6FeKwFRPCwEkO1BHjpjHc4L2De8F/d9?=
 =?iso-8859-1?Q?m4hOYtHHTzo67Mhm2RnyNQ4101wlfE8X9ST84MdKnCVq69ftSd2AebXcKu?=
 =?iso-8859-1?Q?Nh71CGnzXETAi7XtHt2rEPqF/P8SA+iKyEaltRLDXKPQ2CehzwQcQx72kA?=
 =?iso-8859-1?Q?YgcMxiNP+spsKCaxQXcfg+k7cXRbNuJb2Lrna/povxbMcwQu4YxtsUmryT?=
 =?iso-8859-1?Q?Msg2Ju4yuJpc+JpjBCuP1vMdmQjFilz+79+OmVwXeUMp+P3p5+RZRhG02/?=
 =?iso-8859-1?Q?bt6EG9SgIpri5oxTjVOZu0Ion+io83IPARQ7hn38K7Chmh75IFlXZrQJhA?=
 =?iso-8859-1?Q?9q4C9C4Z/l0oof1eqb84mlo03h+c4zFOckq0/94w+GwxmzocpJYsOf11Yy?=
 =?iso-8859-1?Q?yu6vLFLKLpIvTfrv1lalsSStdqGptNJYZp5IYZ+3YL/C6hG32lyUZvNfGc?=
 =?iso-8859-1?Q?AgvtriBp2MjypeXb2WvNMc68ZB79tMLNRdgL+qK4h6vJ9AfmmYX8UPCw5J?=
 =?iso-8859-1?Q?WeEP1dZ2ZkgGzqlZYoDwie9X3TEZrjaHyJ0F2SqVjNrDzdCuTfwzo3yL3O?=
 =?iso-8859-1?Q?r3A0UsQrOHWJCaaDIXjwXWdgZTK2PDihETowM9dFshRbSakh+2iRdJBggH?=
 =?iso-8859-1?Q?q51J29+VrOc7YGMmq1yUy4nGMQEGWtPUDiQ35NHtTH6SBDpgtQtKT9hxov?=
 =?iso-8859-1?Q?+yzun1D33PXyBysNLDRFC6OXRZox7u/RSmw/YDzVsIpdY7yoVG1bSBPzE7?=
 =?iso-8859-1?Q?0ci+d1jkPJh6/DBjWHAdYi29mGBlZjTE3iY8Kd3e24pH3jd0WOYHaLsB5k?=
 =?iso-8859-1?Q?lHdNz+dYpY9d6Fcy9vXSIhMbtbSp/vEppji83zgO9Kq736Yn+3eLjWeWnC?=
 =?iso-8859-1?Q?Cu3kV8SwjLl36nZJovMd71Cu5TQD8NRQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BMz/226xPqHGb6zXS10LXdh0DVLM146vtTvh2RiqQDeoBHed4BU2tZekoB?=
 =?iso-8859-1?Q?kFVZOncZjgJFbJbTI3rm5G7C/KviNEZT3BD1JXv8ts0gz6yL7oCmnmrgie?=
 =?iso-8859-1?Q?AZmNM8nRbqsYQl/Nf4fnJMbyiFL6gYNGKM2Y4llggQYm3NHMZWj68sutJs?=
 =?iso-8859-1?Q?gfr4jjYs8VJvP6v2hbiMeWi28w2whjakyVXGGbCX8kyxb9pqhaXxV8/XTy?=
 =?iso-8859-1?Q?tOHxwj4TrImW4/6Um+PpG41G0tK/utke51ofCF1A789yrDnRmpCik2cI9L?=
 =?iso-8859-1?Q?UxxM+6gnvoBmFOyF8EFen6hVi6ssW2/LwF8hgZABc1U3WhO1v4+CRDrxcX?=
 =?iso-8859-1?Q?wNd9zMXGrb4atgHxMlJkymjH+bqWOHgKDQEAoZ2TefRJcQKLUMddU/PstN?=
 =?iso-8859-1?Q?/9G99+9mIwDVxsa0Srb+ssdOBxqHRCUiWTDVCTpZnHHgpXOX2izTkU7Spp?=
 =?iso-8859-1?Q?sVDyGrtYbXfVThSEd2KcvxzL8s8q8YFw2pXFNfiJnMEWkTOjT38QpgQ/34?=
 =?iso-8859-1?Q?2gxnw2P42QFiqMkma5CZguSFjZeqwo8sCiHQjJcdfRTqIq69YEF1BL3peO?=
 =?iso-8859-1?Q?HaLouwMR3CKNCuYE5YhPFymzEVHjwVM2np7QplSj2Ai3nQGQvc8MoRLNfx?=
 =?iso-8859-1?Q?MywYINp8kCNxIUC6Ix63gVn38jleKualYGPnJ4WSaB7zBKqjpvXT//UQpa?=
 =?iso-8859-1?Q?mnr8h77Gp/bN6BLHlIeBfwbRGPO21nsI9NlkPKHBru1UuhbLThFAX7Ccjd?=
 =?iso-8859-1?Q?l3kwOfZOax2wCEVAnhQjSrsWt79C00ro5YXD/uTWImmT94K1mJ07LeZoMu?=
 =?iso-8859-1?Q?+b7O0KRHQCh0KeSm6iGCRY1N8v98vUuSlWNAFO4HsA8O16INLjMS5xBF5Y?=
 =?iso-8859-1?Q?UDSXZyPsCTtc99VLnm8OxfLc5xBF0fZ7kpiYBrhug1B3zrRmbb1E6dth38?=
 =?iso-8859-1?Q?fX8leszA/7rz8Qp+MjJ5XMG2J8gSaMOmu/QgMapaGOG0gXUyri8iAv+dIG?=
 =?iso-8859-1?Q?ObkK4nDC2dDt5tXkK4qXm0f4rRD4OfVTB/WsLjpCoOIqwHYvr58yebjljc?=
 =?iso-8859-1?Q?sG5THcjCaJNKExVnM351s3ORFubD1uJUvZ0204XYpQ+PuhJR/MW+zIthX6?=
 =?iso-8859-1?Q?tog125x9nnWt8GhPK0ZU0czXs+XYUa8jB8R3ORKVn8+YjYgW8usVwKwREA?=
 =?iso-8859-1?Q?DPJobkSQAgGz9SwjS3KqYWRqF61DMyF3X1KWGus02FL5RH4eDH9Mq5U8fe?=
 =?iso-8859-1?Q?t2jk/C5KHM03SLWJkyMX/rKZ0R1Wf8HXpKXhFFmVCbiVMJLHcRxMqhNbwi?=
 =?iso-8859-1?Q?IRRafoSt8Ywc6BeVpYGLF+gXVL4DEgyXYxCucqT1cMQBCylx6xViXyMph4?=
 =?iso-8859-1?Q?x75zON8XPmYZS/jf732Y6j8VIotTTBAb/KjdGMTTciQk4C6wrcdFMMENBq?=
 =?iso-8859-1?Q?rlPO7IV7Ls4eanWE8pdjqcHHwrP7isnN7FZYZiG4hMo1OLQBy8x2vMYZcu?=
 =?iso-8859-1?Q?UpbwRGj9qYxXmS0JkjQJEtFiGgcjDYm+HbM5Ja2Fmx0zfc2rgzzM4ZtjpH?=
 =?iso-8859-1?Q?NWjX8+WDASXvE40W5sBqf7VTEkoU430CLwUMHaeJSkwns87ZaQfZYdYfV2?=
 =?iso-8859-1?Q?oddHkJalBJ1/KAHmVnonWjF/cvT771Bijp?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58471e0e-b1ea-4204-c4fe-08dc7529d760
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 21:56:14.6707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0AmVWfCX0oe1e3fD3GAcwv4XmrQnei1gNJ9vvkZnRE7zmtEuR9NeD+8KwDML/0Hx6gKY0AnwN1x3+RTwvdlVjFP4UY0hiqexLuRoUsPjnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew Brost
> Sent: Tuesday, May 14, 2024 5:40 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak <oak.zeng@intel.c=
om>; Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> Subject: [PATCH v2 2/6] drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
>=20
> Each xe_vma_op resolves to 0-3 pt_ops. Add storage for the pt_ops to
> xe_vma_ops which is dynamically allocated based the number and types of
> xe_vma_op in the xe_vma_ops list. Allocation only implemented in this
> patch.
>=20
> This will help with converting xe_vma_ops (multiple xe_vma_op) in a
> atomic update unit.
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I have a minor nit lower down, but nothing worth blocking over:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt_types.h | 12 ++++++
>  drivers/gpu/drm/xe/xe_vm.c       | 66 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
>  3 files changed, 84 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_=
types.h
> index cee70cb0f014..2093150f461e 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -74,4 +74,16 @@ struct xe_vm_pgtable_update {
>  	u32 flags;
>  };
> =20
> +/** struct xe_vm_pgtable_update_op - Page table update operation */
> +struct xe_vm_pgtable_update_op {
> +	/** @entries: entries to update for this operation */
> +	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> +	/** @num_entries: number of entries for this update operation */
> +	u32 num_entries;
> +	/** @bind: is a bind */
> +	bool bind;
> +	/** @rebind: is a rebind */
> +	bool rebind;

I wonder if using a single "mask" variable for both bind and rebind
would be preferable instead of having separate Booleans for bind
and rebind?  Something like:

#define VM_PGTABLE_UPDATE_OP_BIND	BIT(1)
#define VM_PGTABLE_UPDATE_OP_REBIND	BIT(2)
	/** @bind_mask: Mask of bind types to perform */
	u32 bind_mask;

If you decide to take it this direction, you'd probably also want helper
functions to set, unset, and check the bind and rebind flags for the
bind_mask.  That's... six helper functions in total?

I can see why this wasn't chosen initially: the complexity of using a
mask instead of two separate Booleans rapidly gets out of hand.  But
it might be considered preferable from an upstream perspective to
use a mask instead, if only from a style perspective?  I'm not certain.

Feel free to disregard this, it's just a suggestion.
-Jonathan Cavitt

> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c5b1694b292f..17b43b567bf3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -712,6 +712,42 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>  }
> =20
> +static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
> +		if (!vops->pt_update_ops[i].num_ops)
> +			continue;
> +
> +		vops->pt_update_ops[i].ops =3D
> +			kmalloc_array(vops->pt_update_ops[i].num_ops,
> +				      sizeof(*vops->pt_update_ops[i].ops),
> +				      GFP_KERNEL);
> +		if (!vops->pt_update_ops[i].ops)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> +		kfree(vops->pt_update_ops[i].ops);
> +}
> +
> +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 ti=
le_mask)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> +		if (BIT(i) & tile_mask)
> +			++vops->pt_update_ops[i].num_ops;
> +}
> +
>  static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *v=
ma,
>  				  u8 tile_mask)
>  {
> @@ -739,6 +775,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vo=
ps, struct xe_vma *vma,
> =20
>  	xe_vm_populate_rebind(op, vma, tile_mask);
>  	list_add_tail(&op->link, &vops->list);
> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
> =20
>  	return 0;
>  }
> @@ -779,6 +816,10 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worke=
r)
>  			goto free_ops;
>  	}
> =20
> +	err =3D xe_vma_ops_alloc(&vops);
> +	if (err)
> +		goto free_ops;
> +
>  	fence =3D ops_execute(vm, &vops);
>  	if (IS_ERR(fence)) {
>  		err =3D PTR_ERR(fence);
> @@ -793,6 +834,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker=
)
>  		list_del(&op->link);
>  		kfree(op);
>  	}
> +	xe_vma_ops_fini(&vops);
> =20
>  	return err;
>  }
> @@ -814,12 +856,20 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, s=
truct xe_vma *vma, u8 tile_ma
>  	if (err)
>  		return ERR_PTR(err);
> =20
> +	err =3D xe_vma_ops_alloc(&vops);
> +	if (err) {
> +		fence =3D ERR_PTR(err);
> +		goto free_ops;
> +	}
> +
>  	fence =3D ops_execute(vm, &vops);
> =20
> +free_ops:
>  	list_for_each_entry_safe(op, next_op, &vops.list, link) {
>  		list_del(&op->link);
>  		kfree(op);
>  	}
> +	xe_vma_ops_fini(&vops);
> =20
>  	return fence;
>  }
> @@ -2276,7 +2326,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struc=
t xe_vma_op *op)
>  	return err;
>  }
> =20
> -
>  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queu=
e *q,
>  				   struct drm_gpuva_ops *ops,
>  				   struct xe_sync_entry *syncs, u32 num_syncs,
> @@ -2328,6 +2377,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm=
, struct xe_exec_queue *q,
>  				return PTR_ERR(vma);
> =20
>  			op->map.vma =3D vma;
> +			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +				xe_vma_ops_incr_pt_update_ops(vops,
> +							      op->tile_mask);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_REMAP:
> @@ -2372,6 +2424,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm=
, struct xe_exec_queue *q,
>  					vm_dbg(&xe->drm, "REMAP:SKIP_PREV: addr=3D0x%016llx, range=3D0x%016=
llx",
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
> +				} else {
> +					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>  				}
>  			}
> =20
> @@ -2408,13 +2462,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *=
vm, struct xe_exec_queue *q,
>  					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT: addr=3D0x%016llx, range=3D0x%016=
llx",
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
> +				} else {
> +					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>  				}
>  			}
> +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_UNMAP:
>  		case DRM_GPUVA_OP_PREFETCH:
> -			/* Nothing to do */
> +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -3261,11 +3318,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void=
 *data, struct drm_file *file)
>  		goto unwind_ops;
>  	}
> =20
> +	err =3D xe_vma_ops_alloc(&vops);
> +	if (err)
> +		goto unwind_ops;
> +
>  	err =3D vm_bind_ioctl_ops_execute(vm, &vops);
> =20
>  unwind_ops:
>  	if (err && err !=3D -ENODATA)
>  		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> +	xe_vma_ops_fini(&vops);
>  	for (i =3D args->num_binds - 1; i >=3D 0; --i)
>  		if (ops[i])
>  			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_=
types.h
> index ce1a63a5e3e7..211c88801182 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -21,6 +21,7 @@ struct xe_bo;
>  struct xe_sync_entry;
>  struct xe_user_fence;
>  struct xe_vm;
> +struct xe_vm_pgtable_update_op;
> =20
>  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
>  #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
> @@ -368,6 +369,13 @@ struct xe_vma_ops {
>  	struct xe_sync_entry *syncs;
>  	/** @num_syncs: number of syncs */
>  	u32 num_syncs;
> +	/** @pt_update_ops: page table update operations */
> +	struct {
> +		/** @ops: operations */
> +		struct xe_vm_pgtable_update_op *ops;
> +		/** @num_ops: number of operations */
> +		u32 num_ops;
> +	} pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>  };
> =20
>  #endif
> --=20
> 2.34.1
>=20
>=20
