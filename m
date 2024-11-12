Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830B0D597B0
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E77110E113;
	Tue, 12 Nov 2024 22:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dT6Fxb8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AED10E113
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731449761; x=1762985761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lxG0m7wOaZ77YsXF8udD/sPbfSh4kVZCmnlc0c24ta8=;
 b=dT6Fxb8C2ioW3jdhAWthUKZ++P1UlXdmkLBLgCcdh9jDivlQv8Tx0dyH
 CiZ8/0vX/+AXVw9lDGbQyi5Yu5FSIgK/KSIzK5NkF3nSjHXZWCScPnENi
 BNeNcdsVk+6HMs7NG+Chi3yU6lRpSPzdWhMDl/P+4KEwf3CBvf+J+FO/T
 qTdOImsxp+pIujNgBw1t84/91VorRVMVp4O7lr4oy42E1NbcLA/SQ5AKG
 u1Lyyvonm+PBLfVB0Dsi3XoXmfqVqyo25tDou/g6626vkJffQrrJTOCF+
 ON10RW7TQ24ALQawQvQ6PRQiUiNj+i4fg1tWShGH4KjRHd3yGqnreEwur Q==;
X-CSE-ConnectionGUID: tq0efIA2SD+l1YXjKWSoAQ==
X-CSE-MsgGUID: 5uDwmMYQSo+kbH835wuaBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42419052"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42419052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:16:00 -0800
X-CSE-ConnectionGUID: oNu6tKgQTXOPYY84Dtyp9A==
X-CSE-MsgGUID: VS+BPn4IQNi70338zOAaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118499140"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 14:16:00 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 14:16:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 14:16:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 14:15:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ3rt6eJYvIvoHX/QVfcsH/jMj4arrVTVB7x3/jYZvCFwZPrLObZyop3CJJ6EGJUx38O9vlVZ6gYI6DFuQFTsIgdwZXequQn2KoIYIgtKvrns6w0QA2dujLP8aYAgCGcqHvXDieZ2/Ompc4AhTLydP3sfy0xDqQvIRZDhPuzvo0uTgzcMYDJ3FkwbWlAbLXrtKvN1ihQPuWEoWdYqrkQeP/Zhi7yUvb9HvvI3d/w+OVWLjLq4ZBDbcjoCn1/PyX61dBgepA0UvbLzZcM0aUDhZwMEudfMeQK8H/AqeOshLQB13uNL4tK+Zlq6qXL4Uy/WWtC2sGQ0ZaAfEBKauIrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUYEoAKkIWQEBeU6W3IMDectPynCRQOFf5E0FECND8I=;
 b=b8jl5yOIDPQwz8Q0OL11Uqao4XTJsAlSc2rmwNBGgIdFjZMhbt2iLPvgIuk+qK7PElGO6MJAATAxoJIdxuY4ZhrEUTZaUK9J/v2ye23V3JSyP+VB/LCk7VD7wLHB0xmIN4vkK/mds6Rk7t7g2ln2rrc0CgTlGOztnmfBk40Wk+LPhY6ZDVWwsByqqmUN7nhmYKiM5l5dDWrld+mrVmOaqfiALfbWqeZQaWJZQz/nmJWe05c8NfoIkAk0cBD4/8GwK6MmSvLxYc8rpBJpFmGGMu8fvsvVabmr8arHiKtdmTUh5L4BpeC8pDZt8Mg6K/jyA6qNnRq+JRIUBvisnt7o7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 22:15:55 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 22:15:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Remove redundant rebind from preempt rebind worker
Thread-Topic: [PATCH] drm/xe: Remove redundant rebind from preempt rebind
 worker
Thread-Index: AQHbNUuKlKjFOTIDg0u7fWtJP+IwvrK0LTSAgAAHWACAAAAwwA==
Date: Tue, 12 Nov 2024 22:15:55 +0000
Message-ID: <CH0PR11MB5444B4E4591329C1084AA938E5592@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241112214104.1341240-1-matthew.brost@intel.com>
 <CH0PR11MB544438DCEDDCE33CB71C14D4E5592@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZzPSJHSWnhCCbZxx@lstrano-desk.jf.intel.com>
In-Reply-To: <ZzPSJHSWnhCCbZxx@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB4903:EE_
x-ms-office365-filtering-correlation-id: fe3dac5a-8c02-4f13-a547-08dd03679413
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?MIVs6rah9a4SBex0fXg+OhkrX/x9ObFAyct8SbuuRMLQs7/3kD4kUXr/Z4ZX?=
 =?us-ascii?Q?1J0r6OFHyEV2G/KhnlQr6Zu2UGwxOq+rViIc7dqgx6i5ANHZ4+A0iKNXR7IA?=
 =?us-ascii?Q?UDAC/C7Z6mReR5Aa+CpDgYm+IicqRrtyTEOWCYcMFRDDDvGBynewUAjSM8AF?=
 =?us-ascii?Q?fXlAMMvZ7s3d0dB9lpHcY1M95eqM9vZLHc9iX+cpUR/uVbrelBtnWGtTSgPk?=
 =?us-ascii?Q?0mH5uAYUuKrLJjMoJwDZV+zsn60jz1MNnoEhIzu4l2ERtFf/BFiCGNAzSHN3?=
 =?us-ascii?Q?HkURfDcF9jZT07H3i2WAqm+StfrZePze2W/DrSgqpUzr3UepwHt3hqD/Qv4U?=
 =?us-ascii?Q?7w+UxCpdY7G7AHYly+JGgjAuu9vmrDw+csbruTU+M1Y/VK0v41mG/Df9eD2C?=
 =?us-ascii?Q?KuxTjIuCQq2kqiOCmn9BAzoDLlE3klitytYy71FgWGZUDKZIlbxnWbk7INli?=
 =?us-ascii?Q?Hu7CcccF60wTIc69QYQGJ498jhr26M8z1myRx69RCgST1l0mOxEe+UpwYZ1F?=
 =?us-ascii?Q?XfTwgZJSiuH32DbvaqlV2UaPbE/F+9hO1v+GvWwsedZE04UoU+SZSNo8rJ+L?=
 =?us-ascii?Q?XHbT5XGlIOTbtbLsJCWQNhwJdUMdKdx4UYhw9SFmYfSmkgys3SwydI+87h9r?=
 =?us-ascii?Q?rWpccS3w5M+xhCicW7oynCsRQEYf6vfXPJIA2NIdRxc0NFDDTQT2Ez9SxWyz?=
 =?us-ascii?Q?JcoRx6Pk4R+TIdT8vbfk/+TtdUk3q6gtiHuO0Yi3TaqD65ZmtmOoRsXwCLF+?=
 =?us-ascii?Q?BPY/Euz60vqXVqcnjT2gz9EDRkXy7Dr5aW95/qeHCzfwzGvYc+i+hmLWZwkp?=
 =?us-ascii?Q?Z3RvtMHcXc8glgd32RpknEHQVs1Ep4M8xrIcC4dc5oCOaPrBlfjZ3Cfdc/3O?=
 =?us-ascii?Q?ebsqeFv8Or2O72yTODlNXFUW2l1k4Ed+KlP62b+mO/AGg3G/hAMFMhELNm/L?=
 =?us-ascii?Q?XEMjPgnqQAW/oj6aVeb8DC73X2VQ6/1xl1CIfdf5SP3ZgUFaCeemQBx7U3FM?=
 =?us-ascii?Q?UKMmIgwZXjXnHv4Cg8z8w+8yOKDHD2xV1GxUnG6Z7oTqIp96LURg6sL5yqAV?=
 =?us-ascii?Q?kms0i8Pb6WD+kcmK6PNtDk4l0j2ZYGQi5qAsrzDA0qlZy1MOS56FzNARdixr?=
 =?us-ascii?Q?nMnlOreqW41oGELWG6zKTXPgg6SPqrZWYoyxtSs1HZcbJpfG96QzvnVs69dQ?=
 =?us-ascii?Q?e0k6+wUczTuiTqcfbXVwPMJpOhZpkOEbj0Owpyu0VvGn+Od86xAyUqugGCWp?=
 =?us-ascii?Q?CrS4t7pUXg8SDSLWBJmHGP2rrLHhvZLSq4932iNgApjX+u9ECJQRVSWJSGn1?=
 =?us-ascii?Q?wk6YbeLQe9hekXN4ajfODXA66kN1+67uUBeSrVdM4Tns8idykdCzmrS5uIjW?=
 =?us-ascii?Q?vk9A+zY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DXywzLBqXDWegyzeO2shfsfKpUOaKswPQLzATVxYtgVq5Nd5PUp9d9otn7EJ?=
 =?us-ascii?Q?dN3is9n/T3OY2oYKop+3emY0MTTO6w/QqwazG04oZL8uhvKD26zf8TfCJmmO?=
 =?us-ascii?Q?d4/rIKSY8PpY5arauK3OKHB4hwUdTG/at+4S72GVzvrGpXuVE9kEXU/i3oVy?=
 =?us-ascii?Q?fatyjqwIpwcffwiek5c4f1/T3uQa6EIn1wy5zf6V9PGdrnlqpTXa98hdT0cE?=
 =?us-ascii?Q?pXWPQXvNPns1h3ktay266MvTXeC7hL1Kd7N58JX3lglHJ6wm5dUC9H6MF6am?=
 =?us-ascii?Q?/iY1/C1R0POYF28d1HzeKWaeOxK5KPvl/K8ianbcq9e122KO2dXyALBKsuVR?=
 =?us-ascii?Q?VJKhCHYJL/OUVUWZrNRGohUHFy0cFKlmC3KbRAOyoaptFUO3VWPK1lfLFmXr?=
 =?us-ascii?Q?YjvzunLwy6kC0S8oN3tE1R8uI8JwOtfMa3sg5FFIar12k6rLhD67SDZ8HWEb?=
 =?us-ascii?Q?pmxabGkaalNBOEYEazYBLvX1Auzjex4CqAfciyenx19pcNLEiN6rXU2VDmRE?=
 =?us-ascii?Q?EhcL9BDBs4KE8w/Ys/i4da5x9YK+D2ptw7HcuLtshQEd4o0qLPKGUEckwKq7?=
 =?us-ascii?Q?O3aJDRTDMy0ApSPj5SnWA72xYHNmIzVBJEnDdaFbEA+A78KxcTroK3WgmWY6?=
 =?us-ascii?Q?KgJHJYc6jPj1YKk6Pt1YbbxjwWYgDx9Jfs6C4Qx2nMj+ZBAlQWItF/TF84Pa?=
 =?us-ascii?Q?9+HvmDM+kHiAuX9gsHYLPZv7baAEigghZ4st4QYT/8uFzJZ3MqUYw4HPzjJu?=
 =?us-ascii?Q?UXiusiWTc3lZ28IQ6syPm/FHYliPfvkNawONq3kY+8j2V6KrKxCNpHwSv5y6?=
 =?us-ascii?Q?jasAZZx3If9sVqjd11B2CB6SX2RZLXUQdtqBXOEPB0XaEjJhcdnybtd5ZMw2?=
 =?us-ascii?Q?Cn6YbiWyfuZtJsqZTYbGE/KMzn1w7nW36e0xNAYBlh1BY6cxE9CIMHI260jL?=
 =?us-ascii?Q?7n3L+OqmrlcoOhx4EINNUZRyoQ/Q49bO3HtIh1hacuI+D1QRTTbcnMUDzSbB?=
 =?us-ascii?Q?TunFEr/dzCShp7jVaFzz2G2tB83894BaHNdxiJY7MfOMf+XG3XCmOmpziVUL?=
 =?us-ascii?Q?yYtLd5VhiP5tRze9uL/wwVz1+s98ye1Qux8vl91AQzGFwMwokpE35O4BEaqw?=
 =?us-ascii?Q?pP9ndAxt+swdl1jRdfp2klKipQe9JM9f6oP5SWGtiNBFxNlJHJ4p1Y33fiZd?=
 =?us-ascii?Q?gkzGavlM3eYEy1OrgZNctKH20CmfhcNJBAU0hRjPjfUkxsz/sfgFNUnOK/By?=
 =?us-ascii?Q?12URzssLeneSHa0W+P5v7iLjwqWWfK+8qgKdNBefbHf7rrW9a5EUDO17KpUO?=
 =?us-ascii?Q?tu7ANYwr1WEPasQWB8x0zf0imaET0GOqOXU4mnNa2Fx9uK29lxXIxOnKvw5W?=
 =?us-ascii?Q?uEcrvvoZAPLWte082g3M1t9huQdY/c/2323PbCbrk8PBWgq4gETDmUQaswHU?=
 =?us-ascii?Q?vSleh2Yh+Z+HWuzKvcVc21vJx0oIOThfT4xjqAJhqaz4X5tvXhpuRRP2YPSv?=
 =?us-ascii?Q?yap4/W0Mm6kIipdK4ngMUm3KKAZZtoV4ThC4V+PKRC95h82aL6p5UZ3cedn3?=
 =?us-ascii?Q?LA40yKSYcl1VKuLehoDfLiY6bZ+hE4t5pr7Klk0m?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3dac5a-8c02-4f13-a547-08dd03679413
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 22:15:55.7243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6smjQG9F4hb5LIh8s7UDQ1CplR+q2BOvSeTwnj1MO5k2STEp2npL3LjNtYrI4OZ/fkPsHJlLiKwiDioMPiZucRA4sxqSyzu+8mTKXe8/1pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, November 12, 2024 2:10 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Remove redundant rebind from preempt rebind wo=
rker
>=20
> On Tue, Nov 12, 2024 at 02:47:39PM -0700, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ma=
tthew Brost
> > Sent: Tuesday, November 12, 2024 1:41 PM
> > To: intel-xe@lists.freedesktop.org
> > Subject: [PATCH] drm/xe: Remove redundant rebind from preempt rebind wo=
rker
> > >=20
> > > We issue a rebind in xe_preempt_work_begin so no need to call
> > > xe_vm_rebind again in the preempt rebind worker.
> >=20
> > The call to xe_vm_rebind in xe_preempt_work_begin passes a rebind_worke=
r value of "false",
> > whereas the call in preempt_rebind_work_func passes a rebind_worker val=
ue of "true".
> > Ergo, I think the execution requirements are different enough to warran=
t two separate calls.
> >=20
>=20
> Hmm, this still doesn't look right but yea this patch also isn't right.
> Let mm follow up on way we doing it is this way. I think we should just
> call xe_vm_bind in xe_preempt_work_begin with a value of true unless I'm
> mistaken.

Okay, it sounds like the solution is as simple as changing the "false" to "=
true" in
xe_preempt_work_begin on top of what we're doing here.  It's probably more
complicated than that, but if it somehow isn't, then you can add my Reviewe=
d-by
to the patch preemptively, as then the xe_vm_rebind in preempt_rebind_work_=
func
would irrefutably be redundant.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Matt
>=20
> > I could be wrong, though, so I won't nack.
> > -Jonathan Cavitt
> >=20
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 4 ----
> > >  1 file changed, 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 624133fae5f5..756c72cd6048 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -525,10 +525,6 @@ static void preempt_rebind_work_func(struct work=
_struct *w)
> > >  	if (err)
> > >  		goto out_unlock;
> > > =20
> > > -	err =3D xe_vm_rebind(vm, true);
> > > -	if (err)
> > > -		goto out_unlock;
> > > -
> > >  	/* Wait on rebinds and munmap style VM unbinds */
> > >  	wait =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> > >  				     DMA_RESV_USAGE_KERNEL,
> > > --=20
> > > 2.34.1
> > >=20
> > >=20
>=20
