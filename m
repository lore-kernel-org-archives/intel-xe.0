Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F53C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 15:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E92B10E064;
	Fri,  8 Aug 2025 15:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAihGJKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6D310E064
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754668380; x=1786204380;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lhJawxgbvkbPIWv4KHT1F5PdYtVavdsmCgM0zO4fPtk=;
 b=jAihGJKDRZwXIvTX3dYxkJpJhi3U56E2XrFjVr1C4xSvQY9b/uZmdYFa
 SmkZ4MIiIBiQdzOriLbBYonlEI42JZxhRJEZbpKkU3E5uW1BkfBsGHR8G
 krK+uuJmvOqaoP2JNMgpqTottpw5KLaAm9f+CUx2i/OJFLS/9P2YxWMUG
 qCOxXJET6GBySgtH59k7CCTEgPfIN0WW+iX12jBvwHfl7VZguLBZ8KNQc
 hUP+0kBS4WtELBl1ch8eId7StIaifnnDbo2AfkScW9SJPZlDRBlrMHhFT
 NCaeS+DLM8trf85OUG1iLx7aOFoImx9OLZV3t6DsmJCdLEKdMgl1a2Sxh w==;
X-CSE-ConnectionGUID: pJNbCNAEQniuLmK7TZA+DQ==
X-CSE-MsgGUID: m1STHZ0vQ4Gisl4vZzseaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56218231"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56218231"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 08:53:00 -0700
X-CSE-ConnectionGUID: NHn8+qUURfaqNIw80SWyrg==
X-CSE-MsgGUID: C8AGNphMREaYzuieVL8/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="196178701"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 08:53:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 08:52:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 08:52:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.55)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 08:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8Jk2eVnPHzOhMEw3RbFwgwzWGefkH8iPlf3u2VgyC/l0gWxoCe15s5KCi4a1YZKLgIsFkBTnor5YyHltBl9xllybmO7DNSuQIJUhKUZvKpmdMSpWPY4GZiavvTqfujtC2r/fFibuXJowPDpTwL64ZEdT4AMiiqxlNVXJnLP/ZQErnb9aE25CC7+TKohoF/fXnd2C3rao50gJrbz3E/GulW04MGlbble6rU5Z9Ezm6J7gtmm8BLWMzTNGxve6eW4WJnaUbQ2v6ZKfb2EqQk4faGhnBi0t8Fnxncbt73Cei5jvNI1/xSJ8HcwjOdFDQyOI17U1Oc5Iexw41RtwbgF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUetqKhe/4LDQH4j7TAKzEyo7LlE8BJvTpC0QrfjJpQ=;
 b=Xc0tJtpW3ls7lBpHQw8f+7i/ghFJrI7eHpDb99CuQ4kTuvUKofHRl5uJGcw22MWGtAR/jv3h57BPBI6VenefnlkjBc/T4fdg6phn2zbPI4c9rz+zvby/f3wrUBmcDh3zUTT+cG5/o1enH86e7t/yfB/nE+jWEKIKDafvm3mh8A1d9iDy3/KP6WUrlZ8vlyseS4g8q5/v2v6UP0WYruDMRIPfJaMG8BLJUihhb9SkJ2GrXDnHwKF5Q23cZMXS0O7Gf66QnNJ87+v3H0uFC3INVhmcDYD6xRnRyz261KSXvUIwk0v2mZOvuaEB6xTEy698V3M0qbVW4mgn71fai96i/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Fri, 8 Aug
 2025 15:52:57 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 15:52:57 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/xe: Misc refine for svm
Thread-Topic: [PATCH v2] drm/xe: Misc refine for svm
Thread-Index: AQHb+lUMsfS56F0ERk2nF4kFDE1p2bQ85YeAgBtl79CAAAyWgIAAq6yA
Date: Fri, 8 Aug 2025 15:52:56 +0000
Message-ID: <DM4PR11MB54568BE4671119B32618FA3BEA2FA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
 <20250721153339.369318-2-shuicheng.lin@intel.com>
 <aH6Gib4X+cHLi/Dj@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456CA65B950D1D096E360AFEA2FA@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aJWMzwFLxQYhwB8i@lstrano-desk.jf.intel.com>
In-Reply-To: <aJWMzwFLxQYhwB8i@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB5832:EE_
x-ms-office365-filtering-correlation-id: 69d6f7f3-8c39-40db-3087-08ddd693a4c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6qZ55odk3gbfNlwANKYrCNuiXwtVu0xz4CbpH1Y2OD++FJlQCG0nmBvDXIpQ?=
 =?us-ascii?Q?IAGeEUJyBD5BrwNn2J4Pkcpx2TlJecudcQ4Q0bwlJYuGAzBYbYiZE7Iz1khb?=
 =?us-ascii?Q?OqGi0xhOVe8lemEDmyh6wNCOIXlK9YY+L8Y9lygLvAMDVJPMU2LUiW3gnyaU?=
 =?us-ascii?Q?GYcao56cUV53Jp5KRePF9f9CQE8+RMd1ltsFN0AdX8lG4L0WChgXz3mTxXGH?=
 =?us-ascii?Q?/SbYB9DFoOvxT1dJSuhbxlLAahDnyd1rUygtD3XGAmCmeuvVcAEYLaK07Rrg?=
 =?us-ascii?Q?5J+U23VQOMdJIyzdtBAGhugB+7T2sT9xfKSY83ZrV77XImwurZw45qI8obb3?=
 =?us-ascii?Q?+9YMXF/MKPq6lr2CjMlr6u7GQPY/HjAiu+GDUAqYA0KNlW8J0MFjtavd6PhE?=
 =?us-ascii?Q?QtZ9a7GSwrGljSLvEIJ4oYQ7KyGmx/yy2GXHGv9Va+hsavbXP0eWgvCJvnN/?=
 =?us-ascii?Q?P+OKy5fooMzU3xRaUMVQCGjfcThFRnwEsjwTzXQvENMPGDDBZKH/e4agAHi0?=
 =?us-ascii?Q?yD9QfZHXypol5nJykWbar8jZ66KlCWRjhLKlC9Ut182uFcsn6pnlSfsjZa6N?=
 =?us-ascii?Q?dN2Tq5ODf8S6VjnsixmIOphMeYO80oP38+7NND4R22+mc/F/Qe3sJ7UdTAww?=
 =?us-ascii?Q?95cfW0jer0FfzuWz+RrGZ2Ntpcrvr9ZRLzTOyPscLiMpvE3QnkxZmy8T93FB?=
 =?us-ascii?Q?XG1nf5F8oYqNoc3+Swf/FIXMSIc0+IfIXkVX80UqnRKLAktBE38AJtVliP3d?=
 =?us-ascii?Q?yQ5M2q9bKbymbytYFtbJGobslqSE0LjJa48MBkzYi6kumhaaNAEA6ziS0jya?=
 =?us-ascii?Q?fenb7DTziY6shzE1olY0NWLpbHr4cHh+86XkdEGCL48nL3MvTZSU7aoVVWev?=
 =?us-ascii?Q?mPAoNMq0yVm6s0bL98I3wlrk/pKuMt/tvaYbgp+3egacavU+r3w7lp0lJLX/?=
 =?us-ascii?Q?puN52tgUbMPpdTvoRFYm6RMDoMtWO7NTzphiHIyjpYLeVgHwAwDkQj6vrHDD?=
 =?us-ascii?Q?PAy28h6VssGsWdIRw/Agyek4YaVNs0G9XZPtDSUl3zlwOobOy9EKyTIEc4Z/?=
 =?us-ascii?Q?bzkTtN2dfF5KxPkHf3D9GAFTRawo387wiAtZTOOKS0jWHDe+o36OOEtOPdCG?=
 =?us-ascii?Q?qBtgcNkI8raXgltjKAPkqg29N4nsksJR1lHsRejqZEIkzzhlViER7ZBUtG5Y?=
 =?us-ascii?Q?YoTO+FyziolWkfUDCymUrjJXEYsMugwIja5MRmFddEislv/YV7d+N3Wx/vOT?=
 =?us-ascii?Q?bLKwdzypyBUm/hDHarS6BllQQIW4y5qyNtfD9weNQ8QXaLZca2dEBvMdXYQ7?=
 =?us-ascii?Q?wDR4goGVWDriXgH94fGO7PaY3u/8/Lbmb0c8TtJc7qw2q79LbHT5NY3Z7RJ2?=
 =?us-ascii?Q?AsEfMcAC+FW/HGoVAo+rrcHtv+KzyunH3st9zuuSyvp84MYvK/ejRqzAoqY9?=
 =?us-ascii?Q?mgK2we9nDKI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IcRboMwoCBdV/Bm1Ff5hsPwDi7E1ZGy9Kt/egFtgNcqtmbhIZ2o8Ocbj7zSG?=
 =?us-ascii?Q?gq4AzeVEGc5uj5UaRHHBBjyorSaFKXTUvlK03/4LVj5IVas5TESM8mKNGSgo?=
 =?us-ascii?Q?EQtD1P/aG9EvwBtn5Dm/LIymzZVIKWG9a3UIpFrRen6cHCECwPYRa76QJS67?=
 =?us-ascii?Q?5hkUPL68iDLgLkkLpJBTgGhQcSLUsJapPwuc6+kO+H9OVtlVrwuiuB4Rk2gt?=
 =?us-ascii?Q?ZDrFb1c5E+wLeQMXv2mqyvAhZIUKSFFMPgi/DP7gqVcHS5ZMfdFRAkOSKsM3?=
 =?us-ascii?Q?Ozmoy9ClVAPjuvQmK6GafCviaagjLJRvCgpmHncOioCpjr17Vv402DhFgDuZ?=
 =?us-ascii?Q?dXhfbjp3yb4X0+SCNbN2D9wbpYSkClB4HB4XaZaFTzvu48yGuGsr/SRfNjvm?=
 =?us-ascii?Q?Ms94XBap8f+8GnxP+hcMoe+y5r5qrU4U+FSoH7X7QWdin4mjixbY9e8fmE3i?=
 =?us-ascii?Q?8KoIjJ9LRJb3wyAuFrlkTvxhM4jGBXQsTQ90TwkLfvk2PJgupQyt1dfdYX+L?=
 =?us-ascii?Q?bCmj5fnyZdwKO58zUX2nDO6r+qB7nahaHs09LJYNW9s51LvPz2UHy/fm06p7?=
 =?us-ascii?Q?59jUmUQgmX6u55IieiRgEhW2tH0iMDKiYK+MzhlnjtF6ny+L5EPO0pRmP3wW?=
 =?us-ascii?Q?62Dx0CxocZV/4r4uDh5q+Dm/lYZt58iBwkvuAdewS0syzksbk05sZLURbF8u?=
 =?us-ascii?Q?iVfxIqo08sizjjZhgmVX/SPHQJ2XWqL4CKrcTy6YriNaYVUYbwZ1A90pMNDe?=
 =?us-ascii?Q?zoyp/AE5x7RD5yo1C6qtd/ENIw4Mx0CjS+SDaxXeAxkRqZeQhNeplozhzSLj?=
 =?us-ascii?Q?Ns+ZFLAnOpfteKsbpp8nzdID3tymOGdHVUv6gFrq6Q1VgKf0mj7mBsyFI08+?=
 =?us-ascii?Q?8mbz6j52wnzsnWJ1eyxG0gXRb8X9vFzBdDm3rKfkXQOrbC1n7agTUCA03UFn?=
 =?us-ascii?Q?sJ3sWhtMU8K6QtA34YboIULXykPCugXsULzEKw4toZp7R847JrYhkQ4tysyY?=
 =?us-ascii?Q?rqVS4S8iuNTuTef3E1ZvjelTfdz958SFWjBriWt0SYWfq5XvC8D8zV6cH3Q8?=
 =?us-ascii?Q?ZtSpWc+hMPj1434qbfTpIZlpZJM+B4cJu3FcjfbEJ0Z1TPRzsgxsE01dVJU/?=
 =?us-ascii?Q?CiVZMGnBSECKL8UYEO2CqLh6BAxozxyQN9PTQrJFiinNHaymK7YXmX2YEsao?=
 =?us-ascii?Q?QDz/JdahXN+w6rtlbUgYvtScFVzfm5eGldckjVCtMfj15OLzxzUI/AGKeCge?=
 =?us-ascii?Q?6PMoVRBF2jlmyHEEuWwzj1NvPkJnsqRLIuUdUeeq9tdxxFbw8aTeJP3xHjPK?=
 =?us-ascii?Q?vD8sAAnRhCC+RN6mKuyEG64WnrFjiUO1gu0X1dTG0fhe2ybQusTP82TAQo/J?=
 =?us-ascii?Q?OYZLZvTBi1/xPpvK4BCmStt2f9y8iKqBOXY0IBE4lnO0HvV9BqcfLg7cWtk4?=
 =?us-ascii?Q?VQWEiMGkupJVPDBbkhYvNdOOLvFOrWErIoChPA0FX5dCADufu43pT0b5ihBX?=
 =?us-ascii?Q?kKdXopU7RwRDnJ8s3sSN0/h5UbV95j5sc1WXdgjo3B/nsf8f29IGuEp/ctvv?=
 =?us-ascii?Q?fgS3XBHiYUoLLrDtuJ6arp2oaT37dMgxlePr0EF0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d6f7f3-8c39-40db-3087-08ddd693a4c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 15:52:56.8989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUvap/Z+nX2nsxK+6VQ2jELittnQMRZ+vjfp30+fPYP7tsCud9ZRuxQW6tKsYS4I5Uhha75f2SEDj6tR31OOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
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

On Thurs, August 7, 2025 10:36 PM Matthew Brost wrote:
> On Thu, Aug 07, 2025 at 10:53:43PM -0600, Lin, Shuicheng wrote:
> > Hi maintainers,
> > Could you please help me review and merge the patch.
> > Thanks in advance.
> >
>=20
> Bad timing, I'm going to suggest we hold off to make Himal's life a bit e=
asier, I
> think we are a couple of days away from merging [1] and after tht merge w=
e
> rebase this one on top.
>=20
> Matt
>=20
> [1] https://patchwork.freedesktop.org/series/149550/

Thanks for the info.
Sure, let's wait for Himal's patches be merged first.
I will rebase the patch after it.

Best Regards
Shuicheng

>=20
> > Best Regards
> > Shuicheng
> >
> > On Mon, July 21, 2025 11:27 AM, Matthew Brost wrote:
> > > On Mon, Jul 21, 2025 at 03:33:40PM +0000, Shuicheng Lin wrote:
> > > > Below changes should have no function effect.
> > > > 1. Correct typo of "operation"in macro range_debug().
> > > > 2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
> > > > 3. Remove preferred_region_is_vram check in
> > > xe_svm_range_needs_migrate_to_vram()
> > > >    as it is already checked in the begin of this function.
> > > > 4. Combine the devmem_possible check in xe_svm_handle_pagefault().
> > > > 5. Combine 2 xe_vm_unlock() call in xe_svm_handle_pagefault() into =
1.
> > > >
> > > > v2: revert !ctx.devmem_only change (Matt)
> > > >
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > >
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > >
> > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++------------------
> > > >  1 file changed, 12 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > b/drivers/gpu/drm/xe/xe_svm.c index 10c8a1bcb86e..a35bca95ab95
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct
> > > drm_gpusvm_range *r)
> > > >  	return gpusvm_to_vm(r->gpusvm);
> > > >  }
> > > >
> > > > -#define range_debug(r__, operaton__)
> > > 	\
> > > > +#define range_debug(r__, operation__)
> > > 	\
> > > >  	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,
> > > 	\
> > > >  	       "%s: asid=3D%u, gpusvm=3D%p, vram=3D%d,%d, seqno=3D%lu, " =
\
> > > >  	       "start=3D0x%014lx, end=3D0x%014lx, size=3D%lu",		\
> > > > -	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
> > > > +	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
> > > >  	       (r__)->base.gpusvm,					\
> > > >  	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
> > > >  	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> > > > @@ -263,8 +263,8 @@ static int xe_svm_garbage_collector(struct
> > > > xe_vm
> > > *vm)
> > > >  	if (xe_vm_is_closed_or_banned(vm))
> > > >  		return -ENOENT;
> > > >
> > > > -	spin_lock(&vm->svm.garbage_collector.lock);
> > > >  	for (;;) {
> > > > +		spin_lock(&vm->svm.garbage_collector.lock);
> > > >  		range =3D list_first_entry_or_null(&vm-
> > > >svm.garbage_collector.range_list,
> > > >  						 typeof(*range),
> > > >  						 garbage_collector_link);
> > > > @@ -282,8 +282,6 @@ static int xe_svm_garbage_collector(struct
> > > >xe_vm
> > > *vm)
> > > >  			xe_vm_kill(vm, true);
> > > >  			return err;
> > > >  		}
> > > > -
> > > > -		spin_lock(&vm->svm.garbage_collector.lock);
> > > >  	}
> > > >  	spin_unlock(&vm->svm.garbage_collector.lock);
> > > >
> > > > @@ -763,12 +761,12 @@ bool
> > > xe_svm_range_needs_migrate_to_vram(struct
> > > > xe_svm_range *range, struct xe_vm
> > > >
> > > >  	xe_assert(vm->xe, IS_DGFX(vm->xe));
> > > >
> > > > -	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
> > > > +	if (xe_svm_range_in_vram(range)) {
> > > >  		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
> > > >  		return false;
> > > >  	}
> > > >
> > > > -	if (preferred_region_is_vram && range_size < SZ_64K
> > > && !supports_4K_migration(vm->xe)) {
> > > > +	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
> > > >  		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K
> > > range migration\n");
> > > >  		return false;
> > > >  	}
> > > > @@ -793,16 +791,14 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > struct xe_vma *vma,
> > > >  			    struct xe_gt *gt, u64 fault_addr,
> > > >  			    bool atomic)
> > > >  {
> > > > +	int devmem_possible =3D IS_DGFX(vm->xe) &&
> > > > +		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> > > >  	struct drm_gpusvm_ctx ctx =3D {
> > > >  		.read_only =3D xe_vma_read_only(vma),
> > > > -		.devmem_possible =3D IS_DGFX(vm->xe) &&
> > > > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > > > -		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> > > > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K :
> > > 0,
> > > > -		.devmem_only =3D atomic && IS_DGFX(vm->xe) &&
> > > > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > > > -		.timeslice_ms =3D atomic && IS_DGFX(vm->xe) &&
> > > > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> > > > +		.devmem_possible =3D devmem_possible,
> > > > +		.check_pages_threshold =3D devmem_possible ? SZ_64K : 0,
> > > > +		.devmem_only =3D atomic && devmem_possible,
> > > > +		.timeslice_ms =3D atomic && devmem_possible ?
> > > >  			vm->xe->atomic_svm_timeslice_ms : 0,
> > > >  	};
> > > >  	struct xe_svm_range *range;
> > > > @@ -882,8 +878,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > > struct xe_vma *vma,
> > > >  retry_bind:
> > > >  	xe_vm_lock(vm, false);
> > > >  	fence =3D xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> > > > +	xe_vm_unlock(vm);
> > > >  	if (IS_ERR(fence)) {
> > > > -		xe_vm_unlock(vm);
> > > >  		err =3D PTR_ERR(fence);
> > > >  		if (err =3D=3D -EAGAIN) {
> > > >  			ctx.timeslice_ms <<=3D 1;	/* Double timeslice if we have
> > > to retry */
> > > > @@ -894,13 +890,11 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > struct xe_vma *vma,
> > > >  			goto retry_bind;
> > > >  		goto err_out;
> > > >  	}
> > > > -	xe_vm_unlock(vm);
> > > >
> > > >  	dma_fence_wait(fence, false);
> > > >  	dma_fence_put(fence);
> > > >
> > > >  err_out:
> > > > -
> > > >  	return err;
> > > >  }
> > > >
> > > > --
> > > > 2.49.0
> > > >
