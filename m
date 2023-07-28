Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8F0C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 05:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB01A10E648;
	Fri, 28 Jul 2023 05:54:47 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD75C10E648
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690523686; x=1722059686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eboRInqaDLPzIsfFR7jSzULwaIdp0jpLB+qJqdzvY30=;
 b=b9oE7D9pwVHECHaLhPVv1yzYPUeCyxYBBaSaMPOpEAa8pZl/SJY1R6dt
 VSHQZDz2RT6zN6L55WaN5qOmNMxNVBils5aPuG/2hEd45JX5wgTrlNXz/
 hpRETea9lM8YWLc94fWYF1CImrx2OYuEku1GWzJ/XWxuhM/UFhCzNIiJD
 Dqo+kdAsTfEXG/e6YlzEWGxS7p2wp1430pdIev4t8yvKMgHnPngNfbtUL
 vhY/56hif4s9o5Lg/N5i6NhPBycZsiccY9rSeLYNEwr1YTFDYpJDYcJRR
 LCZPtwoIBm19qhueB5I0Dm5awcHbr1HNWctPSEQvFO/9SvVLFkQQO7GIF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434797171"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="434797171"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 22:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901093962"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="901093962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 22:54:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 22:54:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 22:54:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 22:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2XvUu57sl+/vIlD00g81TorvbpRhn71DgrKnvRBF7OGjTTUY5wXH69P8CDaMCQLongSp385ZX/OmJyCVla2a/eXGANr+5n31V7eR3LhyhKI1Wlduh6y7IJXBVJhgZTFIvrA8n9SKAQCcO2wAWXtxMr0xFiEMxyrUQWRveVkLX+XqaQAnySLEhD0LWmEko7mofV+BKwbOTVPvAp+Nvf415SrJ8GmTq8xQYFZs/K1+lCAjVVYPtsSCl7SYu4aMTpDJkE2dYTMw+ekCK8qJ3+v4gW93FDIfYoF3RC+v/+4vX+hkIQ4e4T7NzoZBhZvF3CnT7OwOFuIKOMymx+LJKBqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCtD9l8UG0vAYC6AkMg3pEdtIFkLh2OfRKGJLJ0tgqc=;
 b=YWc5QTtPrW0jHZvEsMvDQSo0/6ImjaUPAyT4aO//2uJaoeCegmsSzZL7BfKbmyrvSzrdEA/5TV9HrjKVyRLfERjbQ6Ik4uDK87cP9VTf4zIjoqVkPO7QGfsi3kdYU75JOOxEdSUco+E4CKRFkEi1grpk0Yy3XScIhLPgkYafhBGEYthYK65EHDoNY3m1CTGRdmOksovZIg1VhzFlqPPz4JtAjCl93gvS/sRRyON+XP2MCO7uC1YXSxFq71IT9wiAKe50gJ1nfyU2a3ANvwZLThvIdOZVuLqKvzVCDuOJsbSiA0uwg6dZHhC1cMdm3EmB6Q/w3Dm2l/xRdzPf9cZ5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 05:54:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 05:54:42 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZwGKel9GdYyOvlEC4e+S8iukGt6/NvMCAgADe1oCAAAW5AIAABISA
Date: Fri, 28 Jul 2023 05:54:42 +0000
Message-ID: <SJ1PR11MB62041E3422EBC2A5D9ABC05C8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com> <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
 <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA0PR11MB7211:EE_
x-ms-office365-filtering-correlation-id: b9c82a4f-e74e-4e8c-b04e-08db8f2f2345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WPLzgwCWDLuQcmyPJBSgdbEUwlhw3zejHZYQkGP2W2oy0MRpKRCa1yJBefqH7b+NyCJvdzpfvjkUAom448sXviaT2HvHJGCjZOE6Cn8OjltBCYzxW2c+DotE3eiZOw0YnyN0EdYnbF71HV1JDGXi9yLFuuZSewzK9hr+qtr2kRq37Bxv7ku/FNB4ONlhJV8q73+a3TU4F6OJT66neNkFppumbKrKfpUO5p6b9X06Qj99HnnhloGIg4GdiA7RFeA+W+mXIFB1zm+tZK/OZGTyCOoSH3tCcAJYK+YqNHAot8EoAl1ChYM5v43Y42HuPEo9OM1GFHcUwMfu2BwqSb4vbO7Di7/DCzc13LSrfqT69Wc3Ylgjf3xymTEZqYJDHauOre6Luc3Xzfis4Bsg+Kcr2huh4yXxBUrjAkdY50j+NGm4hboQUwmwgrLP54cxtoz5az4A6VoUZJK5qFQO2u2SIVS9AJ4AtbqhkeI8J1IVRqwwNfl6rsT4nvuV7jWcUJP6KuLn+LBSHlv0bSAWzEjL6F1Dll2yktmkHgF90wOmHDlWeVbsLIbXideJdw24zGYlR/EsjeyTk0vBXKllQGHuuixfNGPt+CdZy0NUr7s0NMpa2tDO4UyyuzxLkGjJT5Bt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(2906002)(316002)(8936002)(8676002)(52536014)(5660300002)(38070700005)(33656002)(41300700001)(30864003)(55016003)(86362001)(7696005)(71200400001)(122000001)(110136005)(82960400001)(478600001)(6506007)(53546011)(186003)(9686003)(83380400001)(66946007)(76116006)(38100700002)(66556008)(66476007)(19627235002)(64756008)(6636002)(66446008)(4326008)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RK5gNKurI7YuHparIzmBHipmDxXZKGmTlrrbLrRIYRDMR2CKGKXAVZo1gzUt?=
 =?us-ascii?Q?8lrA5um8wWVgPC3SQI36I0568hcloNrzhmdO2UEWCiPL+7fXpCx4rPim/7tJ?=
 =?us-ascii?Q?+aUG1N1HKcmRD5ze+hLtEh7PE2Pz2plvFMGDuZ9krk+WlkWfbH6wVMIaj/ye?=
 =?us-ascii?Q?LlGbFqzGKam1gPGf0tNbGVdUvK9KG+oZDFyYbz6pxoAYiigdr6tRPRSQ16K6?=
 =?us-ascii?Q?gIlvoWQG9XA0LTzniSmJ+tjWtXv9kovGfPFD7yQUcTXbYEYkPdOQv7MMojcb?=
 =?us-ascii?Q?iASwmuf1ITcAK3biku34orhepDAGuq1ACeBfnOt/3t/YWtxzxIgXh1MN/qRK?=
 =?us-ascii?Q?ea1Bf6zw7ez8ChzqdjBHi/l1RvJL82ORjE7PqZHkW04VNq9/7GIyZ7oERTdY?=
 =?us-ascii?Q?7o3sCAQvb0j5ITndp30eRbYVFODPVhcSZRyv/dcM/DtLqwDx/2uw0LLl60Oz?=
 =?us-ascii?Q?75gi+prRNSV95wymtKSCV97VCzyneDeqo6U5jWxBgyK+kyvk6v/H8eQbIFyY?=
 =?us-ascii?Q?8xT7usjBRRitfOSKXNyGMulWGDkgUtq/kcaSrCKwwQYZv8INQ5XPAvOhw8zw?=
 =?us-ascii?Q?VJ/Yel7lQEXjwRrgk4qpsNkj8gxsQYHW9Dvkp9/iqa6CAgfypnmsaaPqmTYF?=
 =?us-ascii?Q?op5E0WZtvl8tW3ZJPH3HY4IqSn+JK9g3IY3wMFhvlIU6yzTHLs2Goksi2xOS?=
 =?us-ascii?Q?GyqOL/XuyXftFMuEGpfbaXDGNft+eQi7dOE360LJkqcM/PzcpcVic3VPfSaU?=
 =?us-ascii?Q?kG1fiv6XfOv3jphjR2SQWtBYs6v2YReFlKRyLOyIC5sX4BcNc9xC8nYT/yLU?=
 =?us-ascii?Q?tyrwRQA0AbxFiBrWFOBdOWi/CQE3bgD4AFqV2a77TFProJ5EtR//KnAOwlzL?=
 =?us-ascii?Q?C66L6a4H40kqtQDg6YFdEsIMOnUpgTbGuG7DvMNRVoLSg9by7hiEuIrDV+a+?=
 =?us-ascii?Q?Vue0I1Hd8jBEyy4G/NMIJg58NFuHoC/LK9JUFFLdNcFJHelvau/UK4VdZlv/?=
 =?us-ascii?Q?oWpwlylI1lJx/HXL4dk+oJRbEwCB42YU58kEinArw6adYATiFnpagQM/Fz+z?=
 =?us-ascii?Q?PdcDNfe2s7vCHRV/8yamkQN4NGp6Td/LBD3Vw2mrZt4i9+/Yw9Gbm+OcKRGU?=
 =?us-ascii?Q?S2hOLRxsHvYSz4WuL3dqmZ9taZKaBMhUW9UAvcMiG9s8M4fOvEUxdvtK2H53?=
 =?us-ascii?Q?2+rc/zVSQySXZG7myk/fv7O3T11W7BQQzIe+50msy6vTkrMBhuoquL/O1SIn?=
 =?us-ascii?Q?93MKvk+MVkMhiThKcOufLPnjx9NCXw6qbxmE10x19JaQJ4qb1R0mEO2aWsv5?=
 =?us-ascii?Q?WyEWlOXND41G42Mg3hZyv5Pe2j2gftP39Sq/rAOZkEoN3EZc/eY+ibQUaxl9?=
 =?us-ascii?Q?EhZrS3pzWRW2ksWGIU9QNLL4CNObp/dRkPbW0z5Ydzi1wVL/S70vDvlggLsl?=
 =?us-ascii?Q?eTLZPmmlQqVMsQkW5hnOHT8xOvLSpLHlP5f0ETNfeDMUKqtjn9fbIbySav3n?=
 =?us-ascii?Q?QX1wjDNb+ClvLuL9w4WMD6MFN+bjCtL2FBArwSRiaNah9doqTERAXsS2wS04?=
 =?us-ascii?Q?n7ybYAwayWmlmT1HdpHMbXj9rSx30nmO/AyqdxpRwV6pYRrmHmOsNBBfWvk2?=
 =?us-ascii?Q?aluKycPKqjhWAPrWx7+paasGRVHVWYCQ9DGFRmDXZy6W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c82a4f-e74e-4e8c-b04e-08db8f2f2345
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 05:54:42.0855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYb+AzfjhHeAYscFCbQqtft4BncmRMhui/vm2IMqYC5+IjWZI6PDKZgAZwVyelYq/Z0R60fmcjiChNG8m9sVedoC1kY5A0ECbupfNVWIhjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, July 28, 2023 10:35 AM
> To: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
> On Thu, Jul 27, 2023 at 09:44:23PM -0700, Niranjana Vishwanathapura
> wrote:
> > On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
> > > On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
> > > > Add sysfs entries for the min, max, and defaults for each of
> > > > engine scheduler controls for every hardware engine class.
> > > >
> > > > Non-elevated user IOCTLs to set these controls must be within the
> > > > min-max ranges of the sysfs entries, elevated user can set these
> > > > controls to any value. However, introduced compile time CONFIG
> > > > min-max values which restricts elevated user to be in compile time
> > > > min-max range if at all sysfs min/max are violated.
> > > >
> > > > Sysfs entries examples are,
> > > > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.default=
s/
> > > > job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> > > > job_timeout_min         preempt_timeout_max     preempt_timeout_us
> timeslice_duration_min
> > > >
> > > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> > > > .defaults/              job_timeout_min         preempt_timeout_max
> preempt_timeout_us      timeslice_duration_min
> > > > job_timeout_max         job_timeout_ms          preempt_timeout_min
> timeslice_duration_max  timeslice_duration_us
> > > >
> > > > V9 :
> > > >    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> > > > V8 :
> > > >    - fix enforce_sched_limit and avoid code duplication - Niranjana
> > > >    - Make sure min < max - Niranjana
> > > > V7 :
> > > >    - Rebase to replace hw engine with eclass interface
> > > >    - return EINVAL in place of EPERM
> > > >    - Use some APIs to avoid code duplication
> > > > V6 :
> > > >    - Rebase changes to reflect per engine class props interface - M=
attB
> > > >    - Use #if ENABLED - MattB
> > > >    - Remove MAX_SCHED_TIMEOUT check as range validation is enough
> > > > V5 :
> > > >    - Rebase to resolve conflicts - CI
> > > > V4 :
> > > >    - Rebase
> > > >    - Update commit to reflect tile addition
> > > >    - Use XE_HW macro directly as they are already filtered
> > > >      for CONFIG checks - Niranjana
> > > >    - Add CONFIG for enable/disable min/max limitation
> > > >      on elevated user. Default is enable - Matt/Joonas
> > > > V3 :
> > > >    - Resolve CI hooks warning for kernel-doc
> > > > V2 :
> > > >    - Restric min/max setting to #define default min/max for
> > > >      elevated user - Himal
> > > >    - Remove unrelated changes from patch - Niranjana
> > > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Kconfig                    |   6 +
> > > >  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
> > > >  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
> > > >  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
> > > >  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354
> ++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
> > > >  7 files changed, 466 insertions(+), 6 deletions(-)  create mode
> > > > 100644 drivers/gpu/drm/xe/Kconfig.profile
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Kconfig
> > > > b/drivers/gpu/drm/xe/Kconfig index d44794f99338..0a4ea965645b
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/Kconfig
> > > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > > @@ -83,3 +83,9 @@ depends on DRM_XE  depends on EXPERT  source
> > > > "drivers/gpu/drm/xe/Kconfig.debug"
> > > >  endmenu
> > > > +
> > > > +menu "drm/xe Profile Guided Optimisation"
> > > > +	visible if EXPERT
> > > > +	depends on DRM_XE
> > > > +	source "drivers/gpu/drm/xe/Kconfig.profile"
> > > > +endmenu
> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> > > > b/drivers/gpu/drm/xe/Kconfig.profile
> > > > new file mode 100644
> > > > index 000000000000..e72f15ec4bf6
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > > > @@ -0,0 +1,46 @@
> > > > +config DRM_XE_JOB_TIMEOUT_MAX
> > > > +       int "Default max job timeout (ms)"
> > > > +       default 10000 # milliseconds
> > > > +       help
> > > > +         Configures the default max job timeout after which job wi=
ll
> > > > +         be forcefully taken away from scheduler.
> > > > +config DRM_XE_JOB_TIMEOUT_MIN
> > > > +       int "Default max job timeout (ms)"
> > > > +       default 1 # milliseconds
> > > > +       help
> > > > +         Configures the default min job timeout after which job wi=
ll
> > > > +         be forcefully taken away from scheduler.
> > > > +config DRM_XE_TIMESLICE_MAX
> > > > +       int "Default max timeslice duration (us)"
> > > > +       default 10000000 # microseconds
> > > > +       help
> > > > +         Configures the default max timeslice duration between mul=
tiple
> > > > +         contexts by guc scheduling.
> > > > +config DRM_XE_TIMESLICE_MIN
> > > > +       int "Default min timeslice duration (us)"
> > > > +       default 1 # microseconds
> > > > +       help
> > > > +         Configures the default min timeslice duration between mul=
tiple
> > > > +         contexts by guc scheduling.
> > > > +config DRM_XE_PREEMPT_TIMEOUT_MAX
> > > > +       int "Default max  preempt timeout (us)"
> > > > +       default 10000000 # microseconds
> > > > +       help
> > > > +         Configures the default max preempt timeout after which co=
ntext
> > > > +         will be forcefully taken away and higher priority context=
 will
> > > > +         run.
> > > > +config DRM_XE_PREEMPT_TIMEOUT_MIN
> > > > +       int "Default min  preempt timeout (us)"
> > > > +       default 1 # microseconds
> > > > +       help
> > > > +         Configures the default min preempt timeout after which co=
ntext
> > > > +         will be forcefully taken away and higher priority context=
 will
> > > > +         run.
> > > > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> > > > +       bool "Default configuration of limitation on scheduler time=
out"
> > > > +       default y
> > > > +       help
> > > > +	 Configures the enablement of limitation on scheduler timeout
> > > > +	 to apply to applicable user. For elevated user, all above MIN
> > > > +	 and MAX values will apply when this configuration is enable to
> > > > +	 apply limitation. By default limitation is applied.
> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > > > b/drivers/gpu/drm/xe/xe_engine.c index 9e167b113963..d934196eb79f
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > > > @@ -13,6 +13,7 @@
> > > >
> > > >  #include "xe_device.h"
> > > >  #include "xe_gt.h"
> > > > +#include "xe_hw_engine_class_sysfs.h"
> > > >  #include "xe_hw_fence.h"
> > > >  #include "xe_lrc.h"
> > > >  #include "xe_macros.h"
> > > > @@ -191,8 +192,12 @@ static int engine_set_priority(struct
> > > > xe_device *xe, struct xe_engine *e,  static int
> engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> > > >  				u64 value, bool create)
> > > >  {
> > > > -	if (!capable(CAP_SYS_NICE))
> > > > -		return -EPERM;
> > > > +	u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> > > > +	u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> > >
> > > So I screwed this up in my last comment, sorry.
> > >
> > > min =3D cap_nice ? KConfig option for min :
> > > e->hwe->eclass->sched_props.timeslice_min;
> > > same logic for max;
> > >
> > > Probably add helper for this.
> > >
> > > > +
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(value, min, max))
> > >
> > > Then I think logic works too...
> > >
> > > if cap nice && !Kconfig option to enfore limits (enforce_schedule_lim=
it
> returns false):
> > > 	user can do whatever
> > > else if cap nice
> > > 	user within Kconfig range
> > > else
> > > 	user within sysfs range
> > >
> > > This is what we want in the end.
> > >
> >
> > Matt, I think this is exactly what the previous revision of the patch w=
as
> doing.
> >
>=20
> No... Previous version
>=20
> min =3D Kconfig option to enfore limits ? KConfig option for min : e->hwe=
-
> >eclass->sched_props.timeslice_min
> same for max
>=20
> Results in:
>=20
> if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit
> returns false):
> 	user can do whatever
> else if cap_nice || Kconfig option to enfore limit
> 	user within Kconfig range
> else
>  	user within sysfs range
>=20
> !cap_nice && Kconfig option to enfore limits =3D=3D user within Kconfig r=
ange
> (previously) !cap_nice && Kconfig option to enfore limits =3D=3D user wit=
hin sysfs
> range (my suggestion)

In previous version we can achieve it by just adding one below check right?
#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT) && cap_nice
+       u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
+       u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX;
+#else
+       u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
+       u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
+#endif

Please let me know!

>=20
> The logic is different and I believe we want what I'm suggesting.
>=20
> Matt
>=20
> > > > +		return -EINVAL;
> > > >
> > > >  	return e->ops->set_timeslice(e, value);  } @@ -201,8 +206,12 @@
> > > > static int engine_set_preemption_timeout(struct xe_device *xe,
> > > >  					 struct xe_engine *e, u64 value,
> > > >  					 bool create)
> > > >  {
> > > > -	if (!capable(CAP_SYS_NICE))
> > > > -		return -EPERM;
> > > > +	u32 min =3D e->hwe->eclass->sched_props.preempt_timeout_min;
> > > > +	u32 max =3D e->hwe->eclass->sched_props.preempt_timeout_max;
> > > > +
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(value, min, max))
> > > > +		return -EINVAL;
> > > >
> > > >  	return e->ops->set_preempt_timeout(e, value);  } @@ -266,11
> > > > +275,15 @@ static int engine_set_persistence(struct xe_device *xe,
> > > > struct xe_engine *e,  static int engine_set_job_timeout(struct xe_d=
evice
> *xe, struct xe_engine *e,
> > > >  				  u64 value, bool create)
> > > >  {
> > > > +	u32 min =3D e->hwe->eclass->sched_props.job_timeout_min;
> > > > +	u32 max =3D e->hwe->eclass->sched_props.job_timeout_max;
> > > > +
> > > >  	if (XE_IOCTL_DBG(xe, !create))
> > > >  		return -EINVAL;
> > > >
> > > > -	if (!capable(CAP_SYS_NICE))
> > > > -		return -EPERM;
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(value, min, max))
> > > > +		return -EINVAL;
> > > >
> > > >  	return e->ops->set_job_timeout(e, value);  } diff --git
> > > > a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > index afa7d25c3852..e601bffe3b13 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt
> > > > *gt, struct xe_hw_engine *hwe,
> > > >
> > > >  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> > > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms =3D HZ *
> 5;
> > > > +		gt->eclass[hwe->class].sched_props.job_timeout_min =3D
> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > > +		gt->eclass[hwe->class].sched_props.job_timeout_max =3D
> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > > >  		gt->eclass[hwe->class].sched_props.timeslice_us =3D 1 * 1000;
> > > > +		gt->eclass[hwe->class].sched_props.timeslice_min =3D
> XE_HW_ENGINE_TIMESLICE_MIN;
> > > > +		gt->eclass[hwe->class].sched_props.timeslice_max =3D
> > > > +XE_HW_ENGINE_TIMESLICE_MAX;
> > > >  		gt->eclass[hwe->class].sched_props.preempt_timeout_us =3D
> 640 *
> > > > 1000;
> > > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =3D
> > > > +
> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =3D
> > > > +
> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> > > >  		/* Record default props */
> > > >  		gt->eclass[hwe->class].defaults =3D gt->eclass[hwe-
> >class].sched_props;
> > > >  	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > index 7eca9d53c7b1..3d37d6d44261 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > @@ -10,6 +10,37 @@
> > > >
> > > >  struct drm_printer;
> > > >
> > > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN #define
> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MIN
> CONFIG_DRM_XE_JOB_TIMEOUT_MIN #else
> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> > > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX
> CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else
> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #define
> XE_HW_ENGINE_TIMESLICE_MIN
> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> > > > +XE_HW_ENGINE_TIMESLICE_MIN 1 #endif #ifdef
> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #define
> XE_HW_ENGINE_TIMESLICE_MAX
> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #else #define
> > > > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000) #endif
> > > > +
> > > >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
> > > > xe_hw_engines_init(struct xe_gt *gt);  void
> > > > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > index 990bb675d1e0..2b7ac4e02db6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > > @@ -11,6 +11,20 @@
> > > >
> > > >  static int xe_add_hw_engine_class_defaults(struct kobject
> > > > *parent);
> > > >
> > > > +bool enforce_schedule_limit(void) { #if
> > > > +IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > > +	return true;
> > > > +#else
> > > > +	return !capable(CAP_SYS_NICE);
> > > > +#endif
> > > > +}
> > > > +
> > > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> > > > +	return timeout >=3D min && timeout <=3D max; }
> > > > +
> > > >  static void kobj_xe_hw_engine_release(struct kobject *kobj)  {
> > > >  	kfree(kobj);
> > > > @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject
> *parent, char *name)
> > > >  	return keclass;
> > > >  }
> > > >
> > > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> > > > +				     struct kobj_attribute *attr,
> > > > +				     const char *buf, size_t count) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +	u32 timeout;
> > > > +	int err;
> > > > +
> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	if (timeout < eclass->sched_props.job_timeout_min)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(timeout,
> > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > > > +		return -EINVAL;
> > > > +
> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
> > > > +
> > > > +	return count;
> > > > +}
> > > > +
> > > > +static ssize_t job_timeout_max_show(struct kobject *kobj,
> > > > +				    struct kobj_attribute *attr, char *buf) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +
> > > > +	return sprintf(buf, "%u\n",
> > > > +eclass->sched_props.job_timeout_max);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute job_timeout_max_attr =3D
> > > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> > > > +job_timeout_max_store);
> > > > +
> > > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> > > > +				     struct kobj_attribute *attr,
> > > > +				     const char *buf, size_t count) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +	u32 timeout;
> > > > +	int err;
> > > > +
> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	if (timeout > eclass->sched_props.job_timeout_max)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(timeout,
> > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > > > +		return -EINVAL;
> > > > +
> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
> > > > +
> > > > +	return count;
> > > > +}
> > > > +
> > > > +static ssize_t job_timeout_min_show(struct kobject *kobj,
> > > > +				    struct kobj_attribute *attr, char *buf) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +
> > > > +	return sprintf(buf, "%u\n",
> > > > +eclass->sched_props.job_timeout_min);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute job_timeout_min_attr =3D
> > > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> > > > +job_timeout_min_store);
> > > > +
> > > >  static ssize_t job_timeout_store(struct kobject *kobj,
> > > >  				 struct kobj_attribute *attr,
> > > >  				 const char *buf, size_t count)  {
> > > >  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > > +	u32 min =3D XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > > +	u32 max =3D XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> > > > +	u32 min =3D e->hwe->eclass->sched_props.job_timeout_min;
> > > > +	u32 max =3D e->hwe->eclass->sched_props.job_timeout_max;
> > > > +#endif
> > >
> > > I don't think we need this, just make sure default is within min /
> > > max of the sched_props.
> > >
> >
> > Shouldn't the sched_prop set through sysfs here which applies to all
> > future user engines (xe_engine) has the same requirement as the
> > sched_prop set directly to user engine (xe_engine) through set_properly
> ioctl?
> > ie., shoudln't the requirement be same in job_timeout_store() and
> > engine_set_job_timeout()?
> >
> > Niranjana
> >
> > > Matt
> > >
> > > >  	u32 timeout;
> > > >  	int err;
> > > >
> > > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct kobject
> *kobj,
> > > >  	if (err)
> > > >  		return err;
> > > >
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(timeout, min, max))
> > > > +		return -EINVAL;
> > > > +
> > > >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
> > > >
> > > >  	return count;
> > > > @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct
> > > > kobject *kobj,  static struct kobj_attribute job_timeout_def =3D
> > > > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> > > >
> > > > +static ssize_t job_timeout_min_default(struct kobject *kobj,
> > > > +				       struct kobj_attribute *attr, char *buf) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > > +kobj_to_eclass(kobj->parent);
> > > > +
> > > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute job_timeout_min_def =3D
> > > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> > > > +
> > > > +static ssize_t job_timeout_max_default(struct kobject *kobj,
> > > > +				       struct kobj_attribute *attr, char *buf) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > > +kobj_to_eclass(kobj->parent);
> > > > +
> > > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute job_timeout_max_def =3D
> > > > +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> > > > +
> > > >  static ssize_t timeslice_duration_store(struct kobject *kobj,
> > > >  					struct kobj_attribute *attr,
> > > >  					const char *buf, size_t count)  {
> > > >  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > > +	u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
> > > > +	u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX; #else
> > > > +	u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> > > > +	u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> > > > +#endif
> > > >  	u32 duration;
> > > >  	int err;
> > > >
> > > > @@ -90,11 +218,92 @@ static ssize_t timeslice_duration_store(struct
> kobject *kobj,
> > > >  	if (err)
> > > >  		return err;
> > > >
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(duration, min, max))
> > > > +		return -EINVAL;
> > > > +
> > > >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
> > > >
> > > >  	return count;
> > > >  }
> > > >
> > > > +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> > > > +					    struct kobj_attribute *attr,
> > > > +					    const char *buf, size_t count) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +	u32 duration;
> > > > +	int err;
> > > > +
> > > > +	err =3D kstrtou32(buf, 0, &duration);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	if (duration < eclass->sched_props.timeslice_min)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(duration,
> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > > > +				     XE_HW_ENGINE_TIMESLICE_MAX))
> > > > +		return -EINVAL;
> > > > +
> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> > > > +
> > > > +	return count;
> > > > +}
> > > > +
> > > > +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> > > > +					   struct kobj_attribute *attr,
> > > > +					   char *buf)
> > > > +{
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +
> > > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute timeslice_duration_max_attr =3D
> > > > +	__ATTR(timeslice_duration_max, 0644,
> timeslice_duration_max_show,
> > > > +	       timeslice_duration_max_store);
> > > > +
> > > > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> > > > +					    struct kobj_attribute *attr,
> > > > +					    const char *buf, size_t count) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +	u32 duration;
> > > > +	int err;
> > > > +
> > > > +	err =3D kstrtou32(buf, 0, &duration);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	if (duration > eclass->sched_props.timeslice_max)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(duration,
> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > > > +				     XE_HW_ENGINE_TIMESLICE_MAX))
> > > > +		return -EINVAL;
> > > > +
> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> > > > +
> > > > +	return count;
> > > > +}
> > > > +
> > > > +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> > > > +					   struct kobj_attribute *attr, char
> *buf) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +
> > > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute timeslice_duration_min_attr =3D
> > > > +	__ATTR(timeslice_duration_min, 0644,
> timeslice_duration_min_show,
> > > > +	       timeslice_duration_min_store);
> > > > +
> > > >  static ssize_t timeslice_duration_show(struct kobject *kobj,
> > > >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11 +327,40
> > > > @@ static ssize_t timeslice_default(struct kobject *kobj,  static
> > > > struct kobj_attribute timeslice_duration_def =3D
> > > > __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> > > >
> > > > +static ssize_t timeslice_min_default(struct kobject *kobj,
> > > > +				     struct kobj_attribute *attr, char *buf) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > > +kobj_to_eclass(kobj->parent);
> > > > +
> > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min); }
> > > > +
> > > > +static struct kobj_attribute timeslice_duration_min_def =3D
> > > > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default,
> > > > +NULL);
> > > > +
> > > > +static ssize_t timeslice_max_default(struct kobject *kobj,
> > > > +				     struct kobj_attribute *attr, char *buf) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > > +kobj_to_eclass(kobj->parent);
> > > > +
> > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max); }
> > > > +
> > > > +static struct kobj_attribute timeslice_duration_max_def =3D
> > > > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default,
> > > > +NULL);
> > > > +
> > > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> > > >  				     struct kobj_attribute *attr,
> > > >  				     const char *buf, size_t count)  {
> > > >  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > > +	u32 min =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > > +	u32 max =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> > > > +	u32 min =3D e->hwe->eclass->sched_props.preempt_timeout_min;
> > > > +	u32 max =3D e->hwe->eclass->sched_props.preempt_timeout_max;
> > > > +#endif
> > > >  	u32 timeout;
> > > >  	int err;
> > > >
> > > > @@ -130,6 +368,10 @@ static ssize_t preempt_timeout_store(struct
> kobject *kobj,
> > > >  	if (err)
> > > >  		return err;
> > > >
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(timeout, min, max))
> > > > +		return -EINVAL;
> > > > +
> > > >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
> > > >
> > > >  	return count;
> > > > @@ -158,17 +400,129 @@ static ssize_t
> > > > preempt_timeout_default(struct kobject *kobj,  static struct
> > > > kobj_attribute preempt_timeout_def =3D  __ATTR(preempt_timeout_us,
> > > > 0444, preempt_timeout_default, NULL);
> > > >
> > > > +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> > > > +					   struct kobj_attribute *attr,
> > > > +					   char *buf)
> > > > +{
> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > > +kobj_to_eclass(kobj->parent);
> > > > +
> > > > +	return sprintf(buf, "%u\n",
> > > > +eclass->defaults.preempt_timeout_min);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute preempt_timeout_min_def =3D
> > > > +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> > > > +NULL);
> > > > +
> > > > +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> > > > +					   struct kobj_attribute *attr,
> > > > +					   char *buf)
> > > > +{
> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > > +kobj_to_eclass(kobj->parent);
> > > > +
> > > > +	return sprintf(buf, "%u\n",
> > > > +eclass->defaults.preempt_timeout_max);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute preempt_timeout_max_def =3D
> > > > +__ATTR(preempt_timeout_max, 0444,
> preempt_timeout_max_default,
> > > > +NULL);
> > > > +
> > > > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> > > > +					 struct kobj_attribute *attr,
> > > > +					 const char *buf, size_t count) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +	u32 timeout;
> > > > +	int err;
> > > > +
> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	if (timeout < eclass->sched_props.preempt_timeout_min)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(timeout,
> > > > +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > > +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > > +		return -EINVAL;
> > > > +
> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
> > > > +
> > > > +	return count;
> > > > +}
> > > > +
> > > > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> > > > +					struct kobj_attribute *attr, char *buf)
> {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +
> > > > +	return sprintf(buf, "%u\n",
> > > > +eclass->sched_props.preempt_timeout_max);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute preempt_timeout_max_attr =3D
> > > > +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> > > > +	       preempt_timeout_max_store);
> > > > +
> > > > +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> > > > +					 struct kobj_attribute *attr,
> > > > +					 const char *buf, size_t count) {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +	u32 timeout;
> > > > +	int err;
> > > > +
> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	if (timeout > eclass->sched_props.preempt_timeout_max)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (enforce_schedule_limit() &&
> > > > +	    !engine_timeout_in_range(timeout,
> > > > +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > > +
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > > +		return -EINVAL;
> > > > +
> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
> > > > +
> > > > +	return count;
> > > > +}
> > > > +
> > > > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> > > > +					struct kobj_attribute *attr, char *buf)
> {
> > > > +	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
> > > > +
> > > > +	return sprintf(buf, "%u\n",
> > > > +eclass->sched_props.preempt_timeout_min);
> > > > +}
> > > > +
> > > > +static struct kobj_attribute preempt_timeout_min_attr =3D
> > > > +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> > > > +	       preempt_timeout_min_store);
> > > > +
> > > >  static const struct attribute *defaults[] =3D {
> > > >  	&job_timeout_def.attr,
> > > > +	&job_timeout_min_def.attr,
> > > > +	&job_timeout_max_def.attr,
> > > >  	&timeslice_duration_def.attr,
> > > > +	&timeslice_duration_min_def.attr,
> > > > +	&timeslice_duration_max_def.attr,
> > > >  	&preempt_timeout_def.attr,
> > > > +	&preempt_timeout_min_def.attr,
> > > > +	&preempt_timeout_max_def.attr,
> > > >  	NULL
> > > >  };
> > > >
> > > >  static const struct attribute *files[] =3D {
> > > >  	&job_timeout_attr.attr,
> > > > +	&job_timeout_min_attr.attr,
> > > > +	&job_timeout_max_attr.attr,
> > > >  	&timeslice_duration_attr.attr,
> > > > +	&timeslice_duration_min_attr.attr,
> > > > +	&timeslice_duration_max_attr.attr,
> > > >  	&preempt_timeout_attr.attr,
> > > > +	&preempt_timeout_min_attr.attr,
> > > > +	&preempt_timeout_max_attr.attr,
> > > >  	NULL
> > > >  };
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > > index 757136614672..2e2ab351a991 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > > @@ -10,6 +10,8 @@
> > > >
> > > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> > > >  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> > > > +bool enforce_schedule_limit(void); bool
> > > > +engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> > > >
> > > >  /**
> > > >   * struct kobj_eclass - A eclass's kobject struct that connects
> > > > the kobject and the
> > > > --
> > > > 2.25.1
> > > >
