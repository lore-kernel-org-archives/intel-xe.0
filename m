Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CB1C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 04:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E581310E05F;
	Fri,  8 Aug 2025 04:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvEH+80W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65CB10E05F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 04:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754628826; x=1786164826;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vbJb7tDvBMilPBghJAP0G2lTdkGpHL2ITVUY6LxAr50=;
 b=NvEH+80W8+PI+LNE9UVjH48WQC7vfwZWSC3l4iPKJlPxf4aPrGTywicV
 kqQ7fTszXmjZhW7BdofV5EX/0zedRaDToCtXCpVfVXN+wWpc2xOp3aAPn
 bv8vIdpu6UDlvtbrH1BlBxzLtZp2J2zzfTjb6tzIEOHNGr/jDQA7RZjz0
 AO2KIR12u5vBPCmM328fthG/hw4xNzawTop2XROdcZO26pKSC2RxFotqP
 gxZ0ImaRlJo/Nb+9L3IYqQOLwi9BG11aRm4t0QoyO7xclS/wsaMFK9QKF
 5Q8peFKDYiXnWQLNGv1kkybFV7ALSqCt1I6ckVimcDPMxRmQEvO7wmqN1 A==;
X-CSE-ConnectionGUID: A3iLDmWHRZCxSLl5uXOV8Q==
X-CSE-MsgGUID: cJ0CZPwdQi6OoHajW5HaOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57053617"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57053617"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 21:53:46 -0700
X-CSE-ConnectionGUID: ooqfyLLiQG2/9klLHM0tUQ==
X-CSE-MsgGUID: mgNXnvcSSpax3hr3eEMxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169361137"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 21:53:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 21:53:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 21:53:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 21:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jbkvy2j7BZzU1ujAOZ/jWHk5mP09lhhecJIQFZntoiiES5TkYQLZKG96R5Vjv2y181bkPhxRmnnDcQJY4YPI7/icdg2nIUUIQOxfyGPeiUfptwCu9vGRPGJq25F2mND6emwTAk8D1RstdGDUlCu4zExh+qHZyFtFyE1p0QKI/iE+LD8bx0ZS5c89usEzG6s+y5eYFUrzLXSH4S2Zvk1mfUlt3ms6JHjxLfCA657/wXrP+UdNl8Uxy32hu3hHggsou5n+6xFhdkwwiERlUjCU+tdexnIG7Bx52fIYf9gCrgPzOoAGBc9w8HFQJbkCuXwf8yDDHjGjWCP9S2hxUqGjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrxPHiSdBTGkmB+0rOxqnEwRkXFdaTZ+UOCfsrAzars=;
 b=P5YvoCo3t4QPs0fML8VtgnOzJMh7bMfkJdo83AavwumkeijerpIm4E7VLtX2geLkJsMpPN3K/AD1qfuaxzTCQV4RIPO5S2FVQ6ItJsLCdmyvPA0Lp4AkpTEWm/ozz3IkuCwnRToJzRgyfTt4MksYDI2NyFfQ2JmEH5pHd1HgCuocCAJs70aTFWQjDzr+eNkAu39B1MpHDxsMs4I6/Dw4ddJbyjy5Sxzr1Biypbt88eAdVnxCb9JNk7qBcgxEiGa+V1sVk7vUzFLNuUu3DvDK+ARULYPXJXCEssixRZ3IFpjClUyPTEQUsH5cu86ohIpsElwanzIYkgC6pBh8QLDTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Fri, 8 Aug
 2025 04:53:43 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 04:53:43 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/xe: Misc refine for svm
Thread-Topic: [PATCH v2] drm/xe: Misc refine for svm
Thread-Index: AQHb+lUMsfS56F0ERk2nF4kFDE1p2bQ85YeAgBtl79A=
Date: Fri, 8 Aug 2025 04:53:43 +0000
Message-ID: <DM4PR11MB5456CA65B950D1D096E360AFEA2FA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
 <20250721153339.369318-2-shuicheng.lin@intel.com>
 <aH6Gib4X+cHLi/Dj@lstrano-desk.jf.intel.com>
In-Reply-To: <aH6Gib4X+cHLi/Dj@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA0PR11MB8397:EE_
x-ms-office365-filtering-correlation-id: f09856c7-b1bf-4831-8b58-08ddd6378d1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fin3nQ0ILrhZQTefANRXK9tKpnIwGUnakiT8efgR7A9j6XbptWgdCBBoun6q?=
 =?us-ascii?Q?5Xivq0l/dOYtNa0T0X92un+noem6VGewOVzMNa1AxH+H7m1VY1b8ETXocUbB?=
 =?us-ascii?Q?dD0Y/zDAhM/EooTktpkwCnI+z+irYqn74bClLk1vMiKthFFUYTBN+dUrWz/D?=
 =?us-ascii?Q?e+cl+5bdHCTi3Que2uAPWg3cjrGoB+iYbxdVmYr4AQQnhDXNbD6LoDxcQz+E?=
 =?us-ascii?Q?uE3zLdpU8wOuOgP8M/q2IY8Vu0vyvoNarFy7PulL3fwIsjO4oTXmIoKdEzSe?=
 =?us-ascii?Q?1ZlHvFiR5ywOCAohyoVXHFJgdx5GixYjspKNpO/rMt1ZVgvLeoJ0wDxibemV?=
 =?us-ascii?Q?xElzQLDlg6EVOAFtIrlkA+Q3LhqnHEEzTU8DFtXGlBlqEryKuyYa18W/q0P4?=
 =?us-ascii?Q?3qFYJNoVr88BFxz3FlLGxSc8B6N0qZX9R6rdhBLAlzzVXAEybQczAJ0GPOgN?=
 =?us-ascii?Q?e9crEFVvmrilvnuibqvWQJCFSuIrIAwuNw6yVv1l6avTvS1E2X0QT9iMxxDp?=
 =?us-ascii?Q?ViY33RjAH65Kx7aMsuT103IexeMYKfZI/YAMTsIikYKogH7U0IoDXmpBxMLM?=
 =?us-ascii?Q?WY8XBcfxbtB+ZpRpxvdgHyscoSrbV+ULk2FOFrO47Wgs3g/x5NldmwzIowjb?=
 =?us-ascii?Q?iLsg15m5K9moNXZShDMxEZIVPF8K4IwuHsKdjc9GIzlbwVA+h9ls4GkQxc+7?=
 =?us-ascii?Q?bvtJDmuYQnNgWPVqAbYSsJPJSCY8kEsFdrOz7rzKjnzAO8rmDs2TSVvDK4Q6?=
 =?us-ascii?Q?7BzflDddzHV7l7Ktdn3vYr635AGv9f2dgy/Ik7oDsoe7y2PZIrA9QIY0XY+I?=
 =?us-ascii?Q?yEu8AchoLw7bUiq586ppmm8Kx3MStzecKaGNJZW7mbgBwNu01SiL9Ge0DUXS?=
 =?us-ascii?Q?06GTLwGSKWbToj3olRW3IbYqDFxoukYkGJgfWYd7vLfLNehnWBnJCREoRkt4?=
 =?us-ascii?Q?zuhpGahytTdAhLUivi6CHjRYHRnFZFdQobabVB7ZspfU8N4OzTadvYtmlRak?=
 =?us-ascii?Q?oywg12xeprHSeIM4C9FjZwd8CK/9EerrEibkEn2nUjtH/CKdlgokNoC666za?=
 =?us-ascii?Q?WLaLOACWFZ3vybXmcDVTZp4e0pua8MlLNkS3Ct4gYE16T7oVgkOaHR9hUDMN?=
 =?us-ascii?Q?i/qDh37hGv1Ea21Wdp/aYmJ7dHc/fRnRfjI66QoDmDdXSCp21VtnDCfDZwtN?=
 =?us-ascii?Q?vWwSXCxx1TIixOvG2U2Y+MaIilDwuP4rT7o4JvRLoqv4H5ZzpzhcP0qAYFKw?=
 =?us-ascii?Q?it5OZLU5W0+RjUKMCDDWZay5WtfyX6AcpJTUSgAbjKdPhqLGFl1Os3YkmIA1?=
 =?us-ascii?Q?HAA1DBoyCVHI9uDykfiKvQCEvdewOk5G0Kqwv7wNMFNN89tLyjIqxtxQjfZf?=
 =?us-ascii?Q?RRyZq4sQHI5zMqhK1yAqLEVEs6pJylp8U54Nv3/2cWpuMLlw5vtR3uYKcLGF?=
 =?us-ascii?Q?io+Ph13dsRK7WbHuWh19qMqdRp5L6hoMuaqGOwwK+3FRTintSUQw+SUeNYrE?=
 =?us-ascii?Q?mmxHTk5S3kRa6iQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mJj+qE9XYPf4apY8QjXug/c0JF0vEybslz74h0ojb4QGWsLQFq1gQwyKC7Tq?=
 =?us-ascii?Q?3HN4jhjytFu08/FpBovm+7JdXO/pFVzB9vN3srq8XsJjtaONimRtTMybSCvA?=
 =?us-ascii?Q?OZBrSbl4Ox2g5FOsonHmc7dq973rQOb1jXio2xuoU4qzdNAIMEW87no+ZbfW?=
 =?us-ascii?Q?dcFCFfGvmdGSyPRSGJWs3zqa6foin+xozsfeKLZN8nsIgpN33U6Prgo9fPxT?=
 =?us-ascii?Q?J4nFqkjjSGW0VoP8TJRq/2o2l50YY+gOlxRSx/4Mvf2uDPq58iTItI4S6Klk?=
 =?us-ascii?Q?R/M8D3pFMbLfRBRy+8LFr6Soxir/wVLPEI/BebVBjliBorqAtmKDKWLYJeAl?=
 =?us-ascii?Q?+RHtZoNIyFBEveQ2S8QCG51W5ykbhuP+xR8u5QN25XjxAK50nKwoghj5avLO?=
 =?us-ascii?Q?nu8iMHH1vElncqNpYO9OBDj4i1W4sJfCTrdxsnFk8/EYflaYomeRi+m4jWLd?=
 =?us-ascii?Q?MEkeODeGsADQN7vNAMhlGEvm3bKlw4+I/fPfTw3kAEg1SP9Fk3+mmGPxgNrV?=
 =?us-ascii?Q?HJDd984aDkbE8fHIZJrRjluUIrhKdt+1fy8g1hdPEyFojdZwckyscY4jqX7Y?=
 =?us-ascii?Q?ewUf2zYY2NoGBevfz19oHz/NsSKTkGmrOHtMtGtfihSGigY7ImScAXziBEtu?=
 =?us-ascii?Q?JAG4i/Lxd7Y8tC7xuWUO5zxytHegLT/Uu1bqY7rUqitvyAfpIlhkIHX/gyWC?=
 =?us-ascii?Q?6jnuEmPzj3IX4Jk8Jjju66TeX0tbQBXlCsWiKSWgYTn9GnVZhMQxSbe8ernC?=
 =?us-ascii?Q?LI7vVo8LX2vWNuRzap8lELTqshQND1gC8TpBgwuw0enIORha25O8lcz4Py9V?=
 =?us-ascii?Q?8YAmaYktcNttFFCbcHutU57jTNywKKeRfpc8cc9GYBlxo/1aPwsPxFIDcOGa?=
 =?us-ascii?Q?lIX18rYn5NlCVzL7gQwtol8da3dflAJcAmq76/wUP337/991T9Rmb+vBKy3/?=
 =?us-ascii?Q?gEPjxKe91rcUfgu/SLKnrmmLSzUk5G/gSsnOjuI8m/LOaYsHB/Wkdb68fseH?=
 =?us-ascii?Q?Dij8yyg2nK7inoAe+uzKFldZ1rQVHdLw5hqmOhtrVF/BHWxiKgze2MY3Q9Md?=
 =?us-ascii?Q?xgf8HPskTqAbs7t0fayxaKk1+lPogsL1z6LSqcfVabkl7VlOLN8zsFiF2ov2?=
 =?us-ascii?Q?X7cp9swpvpAdsCuQifpafNIeAlvAelOYHu4Hht4DBElNoBVyaULqSCbnruSg?=
 =?us-ascii?Q?RVQZ8SOapTAgmtz5QoZMKiNj9drXXgSLdWtcYz7Mq8xd/SLFRbtHm+SoXTcd?=
 =?us-ascii?Q?ANvT/cjvD9K1UiaNVAPWc6VFIj/JuWLM4fUBivRf1lOocI8tKfqv8mz0qAy7?=
 =?us-ascii?Q?REbs6s1YhO1irHgCUfMJKaBjQ1Yf9oGbK1I6yF5vFP0Lps66JL8QOAgezEpk?=
 =?us-ascii?Q?uZQbaWoFHF99GznkLqFMSehhooRwLtabEUnj7wbeile5E8Q7jz1V1/mqNZb9?=
 =?us-ascii?Q?vaVbvmlWU13u3x6y3Zzha7Azm+inZjANO0LlOOtbaMOR5zh4kv9cy6sMVKKW?=
 =?us-ascii?Q?lri1LNgVdWJ3hD2hb3Cy85YH8qvcdSbeqxGnuufTEI6ikGc2HwvyStJK96R9?=
 =?us-ascii?Q?Wy+JtRBs+3FHwhgXtrTt0q6QeC4NJE9uBqzrN4kGnDt+ODm+bcPzgIb1udMj?=
 =?us-ascii?Q?jvHwLlzULLyxUOfNKh7u9RYQM5S1wxYrnuPzAT8cweRi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09856c7-b1bf-4831-8b58-08ddd6378d1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 04:53:43.5469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0gxwkFDkzy31d9EjubRXNCHptnqwx4r25y8j/ol14aYFvtfcGAhmYGhWkY7sZmb5mxhGAxjFnmABIBIP3af1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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

Hi maintainers,
Could you please help me review and merge the patch.
Thanks in advance.

Best Regards
Shuicheng

On Mon, July 21, 2025 11:27 AM, Matthew Brost wrote:
> On Mon, Jul 21, 2025 at 03:33:40PM +0000, Shuicheng Lin wrote:
> > Below changes should have no function effect.
> > 1. Correct typo of "operation"in macro range_debug().
> > 2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
> > 3. Remove preferred_region_is_vram check in
> xe_svm_range_needs_migrate_to_vram()
> >    as it is already checked in the begin of this function.
> > 4. Combine the devmem_possible check in xe_svm_handle_pagefault().
> > 5. Combine 2 xe_vm_unlock() call in xe_svm_handle_pagefault() into 1.
> >
> > v2: revert !ctx.devmem_only change (Matt)
> >
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++------------------
> >  1 file changed, 12 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 10c8a1bcb86e..a35bca95ab95 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct
> drm_gpusvm_range *r)
> >  	return gpusvm_to_vm(r->gpusvm);
> >  }
> >
> > -#define range_debug(r__, operaton__)
> 	\
> > +#define range_debug(r__, operation__)
> 	\
> >  	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,
> 	\
> >  	       "%s: asid=3D%u, gpusvm=3D%p, vram=3D%d,%d, seqno=3D%lu, " \
> >  	       "start=3D0x%014lx, end=3D0x%014lx, size=3D%lu",		\
> > -	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
> > +	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
> >  	       (r__)->base.gpusvm,					\
> >  	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
> >  	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> > @@ -263,8 +263,8 @@ static int xe_svm_garbage_collector(struct xe_vm
> *vm)
> >  	if (xe_vm_is_closed_or_banned(vm))
> >  		return -ENOENT;
> >
> > -	spin_lock(&vm->svm.garbage_collector.lock);
> >  	for (;;) {
> > +		spin_lock(&vm->svm.garbage_collector.lock);
> >  		range =3D list_first_entry_or_null(&vm-
> >svm.garbage_collector.range_list,
> >  						 typeof(*range),
> >  						 garbage_collector_link);
> > @@ -282,8 +282,6 @@ static int xe_svm_garbage_collector(struct xe_vm
> *vm)
> >  			xe_vm_kill(vm, true);
> >  			return err;
> >  		}
> > -
> > -		spin_lock(&vm->svm.garbage_collector.lock);
> >  	}
> >  	spin_unlock(&vm->svm.garbage_collector.lock);
> >
> > @@ -763,12 +761,12 @@ bool
> xe_svm_range_needs_migrate_to_vram(struct
> > xe_svm_range *range, struct xe_vm
> >
> >  	xe_assert(vm->xe, IS_DGFX(vm->xe));
> >
> > -	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
> > +	if (xe_svm_range_in_vram(range)) {
> >  		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
> >  		return false;
> >  	}
> >
> > -	if (preferred_region_is_vram && range_size < SZ_64K
> && !supports_4K_migration(vm->xe)) {
> > +	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
> >  		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K
> range migration\n");
> >  		return false;
> >  	}
> > @@ -793,16 +791,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> >  			    struct xe_gt *gt, u64 fault_addr,
> >  			    bool atomic)
> >  {
> > +	int devmem_possible =3D IS_DGFX(vm->xe) &&
> > +		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> >  	struct drm_gpusvm_ctx ctx =3D {
> >  		.read_only =3D xe_vma_read_only(vma),
> > -		.devmem_possible =3D IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > -		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K :
> 0,
> > -		.devmem_only =3D atomic && IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > -		.timeslice_ms =3D atomic && IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> > +		.devmem_possible =3D devmem_possible,
> > +		.check_pages_threshold =3D devmem_possible ? SZ_64K : 0,
> > +		.devmem_only =3D atomic && devmem_possible,
> > +		.timeslice_ms =3D atomic && devmem_possible ?
> >  			vm->xe->atomic_svm_timeslice_ms : 0,
> >  	};
> >  	struct xe_svm_range *range;
> > @@ -882,8 +878,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  retry_bind:
> >  	xe_vm_lock(vm, false);
> >  	fence =3D xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> > +	xe_vm_unlock(vm);
> >  	if (IS_ERR(fence)) {
> > -		xe_vm_unlock(vm);
> >  		err =3D PTR_ERR(fence);
> >  		if (err =3D=3D -EAGAIN) {
> >  			ctx.timeslice_ms <<=3D 1;	/* Double timeslice if we have
> to retry */
> > @@ -894,13 +890,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> >  			goto retry_bind;
> >  		goto err_out;
> >  	}
> > -	xe_vm_unlock(vm);
> >
> >  	dma_fence_wait(fence, false);
> >  	dma_fence_put(fence);
> >
> >  err_out:
> > -
> >  	return err;
> >  }
> >
> > --
> > 2.49.0
> >
