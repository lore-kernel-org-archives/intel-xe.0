Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF22C0218D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 23:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ED810E719;
	Tue, 28 Jan 2025 23:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJXGunTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE5A10E719
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738105518; x=1769641518;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+I2v0NRB155jbSKysP7cL1i83HoTq8+cV/UEOx7OrFk=;
 b=dJXGunTe7MglSBLiILH8CwZ5DB/MN3UcU2qIJNjSmuIsFmpkWq4yUpNo
 TO1FA9ZXY8UwvfbXlc6OcNQRlvlk06oQLzkCQPJ+fJefz5MYWdvJ7XRjW
 /67Mx3kkesSMkwrVw7rlH9taRMvYHqMr+SkLqamcljTY1NlWdpkiLDppX
 mN5sZ2F3uZPF865YlCiLKhNFnXtjLe1pcJJcDg/LHUuUSdiCr1dYbw+IZ
 JBayl09Sw8s2U/CBNokAPi56PdgX8XLuMbwRMS8tUOx+AlgRPABbEbeIP
 3kLhgeqwJpXCFbuBvEqYmH4xNmkhlv+bVMHHk5v8COiFhBTFI5ZnkUThf A==;
X-CSE-ConnectionGUID: Qrd9XsWsSiaOpmzT0lwzKw==
X-CSE-MsgGUID: RghUAe4FRliX6CrvLg4ELA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38640719"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38640719"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 15:05:18 -0800
X-CSE-ConnectionGUID: RF0L57+HSGu97Brt2YLLTQ==
X-CSE-MsgGUID: 8KGtVT4gTm2DiTFDOAGmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113488952"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 15:05:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 15:05:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 15:05:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 15:05:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqkB16VODy9xOsnoJXVRbcyBtK9tYs1WAvUTSSxdqeN7W4rhX5e6/Fs8rvM3hd1L8Oabb6FqXGkCCbA0OBWZC9Pp3NQQu4keEz8akJfzEwA58v/2UZ8WE/QHe3SdOE83KTQJdUAnTxaqoqMTBnn61Zbg47Xly2qobMFa/TRTh6VGqiQbzTzTzl26DBiXGoceVUtFrqVXj1Ic2fPGGAyHiLFAsKEjqiI3W1Qf055mC8NoQAa4lNIKhAaAN357s1iAZHGdkvU2qmWts3rbqwmJhCaZ1q3/WZi1qQZ/HUHRrI+uzSpX0DPwnWLVLFoTB+06kGNxnLGtEwNHUcuwNsp2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7FWAHylD19BQHjRvXXRJK497bB3hyp4qcYpzJwO6Ts=;
 b=wy766l+3BLNdno/7Fy9A7NLrf0IwiilPk/E7/QRL4LHYiBt5dU/lUQyZEe3wG7oscCAkoU+V/0TZuI+BP9Lhb450FZDkpUYUw8q2O9jga0cQV03zzqDRRroAzUoz9rG7MogUmN0bGhoF/px1ns6NvNWQC6TtjSjz0xXzcYvp6LU2aDYFWqs6cdBcfgFcZPAnM/jbkj8UrRpnB5QmqBBJZwHT6K3SY0JohqFT7OqiEXPeiDWG+G5ZBI2yUbP7mTxXAzkOpCAzLEBM43+89tY288NK/B5iSBfJuFQiiGXaRO08aaMpInMjAVQoDxndmlKGG2CdTbJTtokWZ/Y/oidAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 23:05:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 23:05:12 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Thread-Topic: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Thread-Index: AQHbcdDwPJXVuO/+mkimoT4qNoYnJ7MszfOQ
Date: Tue, 28 Jan 2025 23:05:12 +0000
Message-ID: <CH0PR11MB544432BA26C7971F94A9C194E5EF2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-3-oak.zeng@intel.com>
In-Reply-To: <20250128222145.3849874-3-oak.zeng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7303:EE_
x-ms-office365-filtering-correlation-id: 6c10d6f6-7a4f-4b3f-59e7-08dd3ff0385e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SlCM9ti5nqNvglf3DkybaJyjEBWB3VhbhKhT8R5Wr5w4BytOzFtTEbMU173Q?=
 =?us-ascii?Q?SitkJbQa226nuWHPLgFSqD1q5/GLgFV+SVN+7fT3vHpc5qKvyqvURXvAAsk0?=
 =?us-ascii?Q?LJgQ6BnVSUseqPYK1qP3IpjPzjC335HblovntT+RzW25isl6u67S9PcaDFky?=
 =?us-ascii?Q?dyM/QQWO2YT+cWbDky7SJ9EAapyanp7ieGne0fUatUNTnxpEhWSvDVzQmwJl?=
 =?us-ascii?Q?JSE78hEPWHNsu8vkrymoj2qMppZT9oi0ljwZPgLvDu2B7odR4SeGRnLrpP0c?=
 =?us-ascii?Q?7iT+BHJ+OBc2AtRXGbH2bKMpY4YgcCZBXcI4KEL2ugMywG4DQ73YEhZQynI5?=
 =?us-ascii?Q?P3h+PUMiJUu6I1l3QCwV2j4TmjdKiHSopJy2wDPvdccO3qwhHrDi1Z5cCuja?=
 =?us-ascii?Q?f1k24syYAgYFR2g8lpLHmREH/MKy8d38q1NOl0tTA03SAIn1PFmDXFD33Rm/?=
 =?us-ascii?Q?frWeS1CkZVAJrjWQN+D56DFCc1waqRrjeDR9P/qcEo3KYzowIxO3CovYJzwl?=
 =?us-ascii?Q?RtznsqlD4vO4kmTx5ZCMnRlgWmLhhCDrN1tZi0FFSCgLP7POUnraoFMVmDKc?=
 =?us-ascii?Q?Uc4Kmhj/cqoEI3I6RKNU+srazIHVMvRiRZfxshl5ZlBI2nRTz6ayCTCAw2gB?=
 =?us-ascii?Q?rw4ecptqDgH5OWbNxRVGs3KpoIya6rWRZ5cq87I/u48EfoEn7mIyMYN/S/6r?=
 =?us-ascii?Q?czJ2tOZguPJ/hVJr2WtGu/8icVfhokGSpQGxl6BSKXt0dN5oN0aZ2CQQ4N1b?=
 =?us-ascii?Q?M3q5VTti4zQMLtd4o9MgmkgLsfUttgsajyaAl5wm2yg7L4V8Gzn6/LuFgEni?=
 =?us-ascii?Q?fl+CT5phn/9mq/cJfH1QkKBIDfarkqv824aAGZVGLuUQxgNKEFRyvihQSyJR?=
 =?us-ascii?Q?pphuUgmwIDEsY2Hby/ARuSRDqs66g0rQq/rYi8PND+NuDxE2C3iOEMdtXvaS?=
 =?us-ascii?Q?/AKt5i+o8U6VW26QiaLhApvvZ7kFJnRvnzY2U9D/pABaRdQu+8gXck7NXe3v?=
 =?us-ascii?Q?CrggVWNmke08+B8JK/W08qnfspVrldAFb6+dGkTev1SjdRqZnI9uQa3tSkbX?=
 =?us-ascii?Q?kfh3E+zHvXC+JYcONid2j98bXCtJ9b7F1uygiqXYEaWBmyBzHIrpAUyZgYRC?=
 =?us-ascii?Q?7D5z8mqKZRwzE3X6LSMeSu6MYr9rvPPQPiOm1iuLbMk+PblH0nffx1wYGGuJ?=
 =?us-ascii?Q?jL/Ybq6aTngo818sfXy8T+t1SDeoVoUIdeBGH2bOA85XTJ+c2ZpnkOdb2MY5?=
 =?us-ascii?Q?C2Qk5ypT0beiHvA6JAP/IY/KfBCIZglvHmj8UgUuWGnOSSiGT8iRKOD7yhxc?=
 =?us-ascii?Q?5q1lbvfi7ifQ+G2XQ12YBq4A+PAUkNxbr5mu0l4zHo52fr8NSavzWJKqfiOx?=
 =?us-ascii?Q?KHP82RigUj+ScUAr9lZGKzJ3GM6Vp0jbv7ND9ja/Ym5zmI55A6/mLFoWQ+vm?=
 =?us-ascii?Q?qRhaeHR+KDlsm9m3Al8LJ7Evo+DxWZW9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p9ouq9VNX0o4e+b9kfYWbjRWT4vb9AHcecYXSqnJt4S2UeUAIR+Z0HVsC4tr?=
 =?us-ascii?Q?72nGJasJMV30jpR5AeQoES0FNpWyfTMxP70cxI6LNcsdXZ6AneZt2LzccBtN?=
 =?us-ascii?Q?u3Hb+ZOvyKJiolEbU/jRLgX8mG8Km70IXVIhsLxKO4LLOPSeN+gf0g/FO6kI?=
 =?us-ascii?Q?Wfb6j5BsvT95YcOjFchKK4Sm8hezh1dBmubKkdA3utvSd0uedYnX59M43jA1?=
 =?us-ascii?Q?63T7kEZrRTeQh9+RkoDTObdEX6Cdc4JatC00jw0BIxuC1T6KLLDcLVV3Zo40?=
 =?us-ascii?Q?hq6/0mEApcybTGYNYPC1DKLRkdJIzG67OJAHmi8cRqfPV8ghncNcxwdt92Y9?=
 =?us-ascii?Q?V1QWrx4/ILqmfZLsi3rwEkCWMvKKfe1lr0Wy/6sU4kuNJH3xhAAA2zvErkAR?=
 =?us-ascii?Q?m7eSqNv3yfNSO12BqqNdSg/SDleLc36j7WWEkZQq1HdZ77Dbo8OLtIiDFoBW?=
 =?us-ascii?Q?3jyNz6AXSKspkUFe7t9Pix2s5ZclbSrBso5odQ1A5JFBcACHufFdV0c4OWKs?=
 =?us-ascii?Q?InxT+gvpn1+3u40qSvC8RCaUUPu4xjV0vWWgqL/wAUz3rU/fY8a69f4DYWmr?=
 =?us-ascii?Q?/a+7RtC/u7R8E0rDySsT5FpYF9+YsDO7Nxj1Jrc8M3ovQERjiQq9BdKN+l4r?=
 =?us-ascii?Q?wOZvhG1N0ZY/bWcf+vFAbQ1igkTnEBdY4G+9g1lIyB/8o4NsUE60hn/mMX9R?=
 =?us-ascii?Q?4q+UYl3qj5wefIJQfok3gSrEXtNX5x+cEKVNA5+ywwTf4LHjW1PFzIkS+XZ5?=
 =?us-ascii?Q?gj9Pv+lrzZIiAOsWRas++Q64SdcrVoqfW8skgj+9tDdNjTgNkxw9P7/ZtZdX?=
 =?us-ascii?Q?Qxj58LfNWEPdRRz7+mJZTlOmernJJlbHVe3VU0YI6ZLERkpdAV6QiYj0rd4I?=
 =?us-ascii?Q?HJz4OqmudgNyUxav5m0/Wm/Cz5uMbtbUdWvXKRRA4wAUOo6+kil9gzx+lBgw?=
 =?us-ascii?Q?3dzGKVZ2gPRbQeBProaxlLYvgzMcTDNUfxBj0w33wY/FjFVP/7daMUJP0y0q?=
 =?us-ascii?Q?0FftnFY7p0qgSGqmhoxD989jD8ceRM/436oDAd/BNiUCxYAzdl9y6qpULtuL?=
 =?us-ascii?Q?UI9wxvaZL8Gx3blaKssISLoTu+lyqtUumWdc3VcjfdAbeYEtPjnt5s5OI6zX?=
 =?us-ascii?Q?XCz+3DIblEZ9V4ogDytE58vgrHDojVy3kvrwmG8KIODzavw/IYJb/0ntYG1+?=
 =?us-ascii?Q?1xYvnrFOV2/z31MXW87PnGT0TM2+4APlPkz56viUUY5CZy8o1aILjwZen/ty?=
 =?us-ascii?Q?xKE5hSz3QdP79y1Xgu4zJm4PkBRT2CE7dRfVtIHd1xnvbt/ASTGWSyY95/Vc?=
 =?us-ascii?Q?Bydgpb3wrsSej1uyvwIkplT6+IrqTWX2tNvnpCULRP6HvqEXAZj7VL1bM1c/?=
 =?us-ascii?Q?RnLj4mUrTg37ybgXdvU/6Ro9V1Btzm6i4madVTy8NHBmLtSCEO9u/e15b+gJ?=
 =?us-ascii?Q?eJERTfT+9A0f6ZzwNbjXCpRhPbyk8qow88HfeTxO+cHLe20/r+tMBTYzgMa5?=
 =?us-ascii?Q?F7Vk4v+D7QYtU51kCKicIBnCO4rTXl3J2a+/9yDKMwBIX6C0B8kpKfhtNl7i?=
 =?us-ascii?Q?vjw7EqRhd07fzo1ieu77OvuHZ18OUP13+7fEFJuZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c10d6f6-7a4f-4b3f-59e7-08dd3ff0385e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 23:05:12.6367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FfczoBL/VArfNLjfKJBK8bm77tTAIOAPm6QaIBjvYQrJfTxF0KqtP/JNl91Mz/TYdbC6nYqC14TLWhO6+Tc4tc0uDGocMyY51tnNMuT/njM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Oak Ze=
ng
Sent: Tuesday, January 28, 2025 2:22 PM
To: intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com; Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for certai=
n platform
>=20
> Normally scratch page is not allowed when a vm is operate under page
> fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PA=
GE
> and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
> is fault mode relies on recoverable page to work, while scratch page
> can mute recoverable page fault.
>=20
> On xe2 and xe3, HW prefetching can cause page fault interrupt. Due to
> page fault interrupt overhead (i.e., need Guc and KMD involved to fix
> the page fault), HW prefetching can be slowed by many orders of magnitude=
.
>=20
> Fix this problem by allowing scratch page under fault mode for xe2 and xe=
3.
> With scratch page in place, HW prefetching could always hit scratch page
> instead of causing interrupt.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

LGTM, though see my comment for patch 2 regarding the added platform checks=
.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 196d347c6ac0..3346f88f284a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1732,6 +1732,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, voi=
d *data,
>  	if (XE_IOCTL_DBG(xe, args->extensions))
>  		return -EINVAL;
> =20
> +	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &=
&
> +			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> +			 !(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) || IS_PANTHERLAKE(xe))))
> +		return -EINVAL;
> +
>  	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
>  		args->flags |=3D DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> =20
> @@ -1745,10 +1750,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, voi=
d *data,
>  	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>  		return -EINVAL;
> =20
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &=
&
> -			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
> --=20
> 2.26.3
>=20
>=20
