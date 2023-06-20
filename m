Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543E9EB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jun 2023 22:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC5D10E1A0;
	Tue, 20 Jun 2023 22:38:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B0010E19C
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jun 2023 22:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687300737; x=1718836737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZQNVcaepQQP2eWrOvAweNTH/Hs3SoTW2KhtcZNTtXuc=;
 b=ISZE6boqvcdb6f+yEwF7eQ0Birxwq3tvFaaAnDLjDGXMindbtfHjV2ma
 9PB1BSQ1FJ3mONcA/EA9ysVUJ85D69kboE9LCrclDcB174z3vVR9pHuRI
 oQ/6cZspUbILGI/kfaYLsv853hpJ9lrKTCH5TVDfHJAubrWBgbN1+gtjm
 1rlOYsLweLA7378BlBPmQQzCFKZNXrrdk7OX8yro7oHB9tDbDYMQe+wJ1
 7NfArohjq7IfCaOh4sEXcSicWjr6tnI2c0IFRRgWULLYxM1oGS+TVMJ4c
 7wmq8pFmpe4tmVUzRoobYB8QMzq68qnxPtClWyq6QiZL1LFpIJtvaCdZk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340342261"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="340342261"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 15:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="664413453"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="664413453"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 20 Jun 2023 15:38:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 15:38:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 15:38:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 15:38:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 15:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhyXzoabzijjwm1HvnYCvory8DaahLtEGQqka8uf+YjwetE0SyQ5/+h3NWaeoDRs+6B3Tb8y5sYc7WWlSNak2mDSMsDevwqAa1GUDPT35roJu4pFNTE+C7Wo1mpV5ELITDf7BNlks/iPd1CAODsUQksc2bfzTuzGdHNEm0HRjIlQ1o/dTTBrdTrvkzVb/YNO5uMjHDxb4P3gdFepBj+6u1SKh6HHO2tSB71LLcerej6Dux2FXooY01jKBEt67wxkZ5lgULNdcRssdMKCTa3CHJ1tOenVM4lzIYkKOOKknx029SlvmH6adiPhC7n2fulRx8AeteemnQLAJVlM4kGC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVacZonW1kppRiLs8szCEYiJBTgKRAgLezeUnXnnL1E=;
 b=EZe9J5dyxjZDNL1IZYY0qsSjNyhyfgEfNwEq+5eSToUpUQwaoMiYQ52cFO4LSz+EFZjET95WFIzL40eMeuOZ3bFIbMPKydg1J8YuUUUvs1pMddxMDOKK3Mw8sBHGOmm00UNhI22zWFdTkTV6X0XebJ8AB9xpdgZx0WGfk7Tm0gAkqXvzYlM9JAGPoAVClXRrLvE+ZJBp7ux9xlih0HFxsgBFSDULgefEMqseAEm3mAraL9X+7CWXOiYEfp1Gio3fGKvFQVGrs9KCusjE5Kxz1cgqBx+klwMC6HLdNqAPM+Imo/uo0W54GT2GDbOxG7bzjKnlvpZQBGbLGVpQWelMag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21; Tue, 20 Jun 2023 22:38:50 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 22:38:51 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
Thread-Index: AQHZo65XKmLJRtXRWEeVQ19I0PrYNK+UNMWAgAAOquA=
Date: Tue, 20 Jun 2023 22:38:50 +0000
Message-ID: <DM4PR11MB5971ED74CBC0D05B16B0CD41875CA@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
 <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
 <p7zjd7pktccivhdosyrteoixzrkqqiawzcjluhfujwo35qpisl@zol4cc6pxhjp>
In-Reply-To: <p7zjd7pktccivhdosyrteoixzrkqqiawzcjluhfujwo35qpisl@zol4cc6pxhjp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|DM6PR11MB4658:EE_
x-ms-office365-filtering-correlation-id: 89392471-d3ab-4a49-a5a8-08db71df1eb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5CT+OCiJlTLWEQH2+pbKQhldw+Q2FG7kwsFX563POFi8ZRObbDb3WQGHNfN7ZrPZ9Y32UNMbjXhqdqzCUKS7XUczOMH1vZjsuWEN0I917DJ035IKvZ74bG3JyS1onP6CZ0fFsgLbfVjgRISUT8sSKA91miMAr9BDaSAKDxd7/XM7TIfS5OtanzlLnvaxe7o3SNhZCa2OexFbbdPLVfA66Z0TMsFSVqCWE4lrVXcZJmeZmnjGFx+aD5YqIAw2tcaTmjJFyBlDfSDwZIetzNrWR6B4UZl1aKT+VfY3hN6vMUcAJ34LRVYZb/U4cN25t38NpKgEGvWkWeHx2SpjqghkaeUYc1KkeA30F5mhqrmiA2uZu+j+Gc7CL32im+03Ejn413Gy9kyTo/pLm25tbG1UG+lv6yNxztrqQag4w/Qb7DQ627IU0KvQd5RkhehH9y1si2T8xgWsgdypb0M2qL4qtGjLUX95Nq0HwalVgjjrVLVptekBViixFINuOH5h35MF5OywmzNVrOwqH0S0WlB2injjtBnhHGuL35ZXS/qh/3awQmvwiFBHn0w1bVapd57ZRFsHMeE1SmAT8LCySnMIXARwSgCTvEdItL/G8uya3Kf4EVoXVTQ6mn5AM220zFf5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(2906002)(107886003)(7696005)(54906003)(71200400001)(83380400001)(478600001)(6506007)(53546011)(26005)(186003)(9686003)(30864003)(6862004)(5660300002)(52536014)(33656002)(66476007)(316002)(55016003)(122000001)(38100700002)(4326008)(6636002)(66946007)(82960400001)(41300700001)(76116006)(8676002)(86362001)(8936002)(66556008)(66446008)(38070700005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Df5WaIwPrv6O/Ork/w2hy4OfT5UkHL8mdCXlugwkqwJjdPCHc3P2A1ve2o7n?=
 =?us-ascii?Q?14wgBzZFuUxOkWfhsQvlWt86PZRs8QOUhCEPJOTSBhp+ONM7L3vwLNfWDN5N?=
 =?us-ascii?Q?j887wO7U+IJE72mM5OUNhazJQml9y+1/qIS7J3LjCSUJRK8c9SHTlYJwl+VM?=
 =?us-ascii?Q?8F/c4mkarnuoOpcHqzT4voJhpq/vCZaI9EPTqhGYINcYj0oqW9fSSP6/hmMk?=
 =?us-ascii?Q?G/3s4Xn2EGf/t+9jWzvsba6WAO+HPLJpm9USAloiTXZMXKs41SPsDfPbFSw7?=
 =?us-ascii?Q?SsE/0/+mRFwxXqR9dK42CU2wzhnEJwVVDkHCMn8Zr2VZTjU7RujKyYK6n0cn?=
 =?us-ascii?Q?dv9Yjv6C3Q4bR4EzEsJT8SC9NQJktrMLB5FA5/GDRY0FebVWfzoS5qNwto9T?=
 =?us-ascii?Q?qO01Px7dPofFJZ2tdO6CSqNpZHyDjGwqdJvdOLK6raew2vI8qI40NeE0VFI+?=
 =?us-ascii?Q?rFIowcg3vh+vXqGOBhKhELpNwHyLcSWa1OjflT90vIb5qj0VGL0kuB9kmwFh?=
 =?us-ascii?Q?a9qpqkSivXHrmkUvl9ca7CQWqSMX6k6Shi4UJwcsAyq2XuXgzBoWKXbc3AlR?=
 =?us-ascii?Q?PqJlPo8VR1YsRkI+1k8N1Nbwy6thbrE03M8i1YWQNtjt3lJqQBrzSJnw6Slg?=
 =?us-ascii?Q?+n35Xw3/ZrXZ44p4uLekxVxZiXS/sN8axc/lmuVOCPjJH7F9M8dyxmjoWv5f?=
 =?us-ascii?Q?gYs2YJmkos7+qllU6+kPzGaXviOEsx/MufgG8wtBRxS+rNcp/jyMSFkpfj2V?=
 =?us-ascii?Q?7F7w1vxBmGmZ9qs8wKa7G/2WgVZnmagWx7YsZhm+NGlfEt4cvZ02bbDhNBfd?=
 =?us-ascii?Q?cTu4drniVwEijAcXcVazituISTjcYZQ4jf2PoTJoemcB05iot7ZIlFVrAcT1?=
 =?us-ascii?Q?zXm3Jtn5VQl9HP8RxPSKJL0+zJ5/yhwp6ai/WgWZPbwa4m7aPb+GtSSjJE6O?=
 =?us-ascii?Q?dN+/R5wnRM9nzkSiqQx0wuYjD1kIvnAlMgvlLUiQZDX8AKOvDqxmKjyEKFnk?=
 =?us-ascii?Q?GqvyCE/R87eFtk+cABBA/mVA80yyuWwfVPJPHCKpF1mWcipLVUjlX2nNygVE?=
 =?us-ascii?Q?FiSkENh3ivchEp45F//XaF5RRlc56eq4y7gNMmo7lkSmnw8VDwb0EpkbVX1O?=
 =?us-ascii?Q?6ytoSPgYk21u/X04gEvwm0JeLgvUQIGKDERt92cERKzVSEjOO7YMYrx48kFO?=
 =?us-ascii?Q?Hmo0qPGU1Kd8EWCrwLLsCwabi6c8Dg3vYTBZCWCD4dZSa1NK7xVTzw7G4jgk?=
 =?us-ascii?Q?d0K9vegHlPxDqKy1eNR1qxCacfSE2ZTg0BnSZ6wXYO/zGdmvvPUBP7bW3AQE?=
 =?us-ascii?Q?sIIEQlq1p5LXFYYsbkoyWxRfuNtV39oz3maS0JWbbMRmkhKLFjNnq6+16n0O?=
 =?us-ascii?Q?TJ9Vtrt31MfMV+L7ZqumRqDuGcQgsfWrz9lM7ZJxyJPOEb4FGUqp043iZ5Dw?=
 =?us-ascii?Q?UJCD5OI2/r0IfCoSXXkV5G9+UIjj0aAsBAD/KPPs3ous6sfV1XrN1og+Ys96?=
 =?us-ascii?Q?Nt2DtkIzireVH2D9HVcovNsuhDAPbJNZ1MgHDzczb2RkEwVDZGXPncjbcbIp?=
 =?us-ascii?Q?Cmz2A0kBC4t+ZLvEeYUN6xp+7ARUOWWnx1IzZ8KRluPkOTY+eZcCY1rQdyGI?=
 =?us-ascii?Q?Jw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89392471-d3ab-4a49-a5a8-08db71df1eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 22:38:50.9177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMX9vE2N9nC3a45gfD4o5S9Dm/7ELaJoysZbv83fZ2W9p4GmvGovEDzPwOvets9hFmX9wLV77F3eQXwjF/Y7fQk7k1b+d0x5ayNjbDE7ers=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Tuesday, June 20, 2023 2:28 PM
> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
>=20
> On Tue, Jun 20, 2023 at 12:32:29PM -0700, Radhakrishna Sripada wrote:
> >This will help debug register read/writes and provide
> >a way to trace all the mmio transactions.
> >
> >In order to avoid spam from xe_mmio_wait32,
> >xe_mmio_read32_notrace is introduced and used.
>=20
> feedback given before was to avoid the exported _notrace stuff. If there
> was a justification for it somewhere I probably lost it. Could you
> clarify? If I understand the above paragraph correctly, it's due to
> the fact the xe_mmio_wait32() reads the register multiple times...
> why would we want to avoid the "spam"? If we are reading it multiple
> times, the trace should show it instead of hiding.  If we demonstrate
> there is an actual impact, then xe_mmio_wait32() should be adjusted, not
> the rest of the shim layer in intel_uncore.h
Unless I missed some whaere earlier feedback I received was on the usage of=
 inline in function definitions.
Xe_mmio_wait32 I believe is loosely based out of __intel_wait_for_register(=
atleast based on compat-headers)
Where during the actual check, no trace version of register read is used an=
d just the final value is traced before
Returning from the function. A similar kind of approach is adapted here.

If it does not make much value like that then I believe we can use a tracea=
ble version
But in case if developers want to have a stack trace for each tracee out pu=
t then the spam becomes even more
messy.

>=20
> >
> >v2: Do not use inline for the function declarations.(MattR)
> >
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Cc: Matt Roper <matthew.d.roper@intel.com>
> >Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> >---
> > .../drm/xe/compat-i915-headers/intel_uncore.h |  8 +-
> > drivers/gpu/drm/xe/xe_mmio.c                  | 80 ++++++++++++++++++-
> > drivers/gpu/drm/xe/xe_mmio.h                  |  5 ++
> > drivers/gpu/drm/xe/xe_trace.h                 | 26 ++++++
> > 4 files changed, 111 insertions(+), 8 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> >index fae6213d26f1..036f3b963a84 100644
> >--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> >+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> >@@ -113,7 +113,7 @@ static inline u32 intel_uncore_read_fw(struct
> fake_uncore *uncore,
> > {
> > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> >
> >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> >+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
>=20
> how would you even know that intel_uncore_read_fw() is non-traceable?
> ditto for all the other functions in this header.
In i915 intel_uncore_read_fw and other _fw functions translate to raw_uncor=
e_read
And its variants which do not include the GEN6 Header/footer which have the=
 traces
included and hence are the non-trace variants. Unless I am missing somethin=
g.

--Radhakrishna(RK) Sripada=20
>=20
>=20
> Lucas De Marchi
>=20
> > }
> >
> > static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
> >@@ -121,7 +121,7 @@ static inline void intel_uncore_write_fw(struct
> fake_uncore *uncore,
> > {
> > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> >
> >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
> > }
> >
> > static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
> >@@ -129,7 +129,7 @@ static inline u32 intel_uncore_read_notrace(struct
> fake_uncore *uncore,
> > {
> > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> >
> >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> >+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
> > }
> >
> > static inline void intel_uncore_write_notrace(struct fake_uncore *uncor=
e,
> >@@ -137,7 +137,7 @@ static inline void intel_uncore_write_notrace(struct
> fake_uncore *uncore,
> > {
> > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> >
> >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
> > }
> >
> > #endif /* __INTEL_UNCORE_H__ */
> >diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >index 78c7f839f783..ef2192a2d060 100644
> >--- a/drivers/gpu/drm/xe/xe_mmio.c
> >+++ b/drivers/gpu/drm/xe/xe_mmio.c
> >@@ -19,6 +19,7 @@
> > #include "xe_gt_mcr.h"
> > #include "xe_macros.h"
> > #include "xe_module.h"
> >+#include "xe_trace.h"
> >
> > #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > #define TILE_COUNT		REG_GENMASK(15, 8)
> >@@ -429,7 +430,7 @@ static const struct xe_reg mmio_read_whitelist[] =3D=
 {
> > 	RING_TIMESTAMP(RENDER_RING_BASE),
> > };
> >
> >-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg)
> > {
> > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >
> >@@ -439,6 +440,31 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg
> reg)
> > 	return readb(tile->mmio.regs + reg.addr);
> > }
> >
> >+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >+{
> >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >+	u8 val;
> >+
> >+	if (reg.addr < gt->mmio.adj_limit)
> >+		reg.addr +=3D gt->mmio.adj_offset;
> >+
> >+	val =3D readb(tile->mmio.regs + reg.addr);
> >+
> >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> >+
> >+	return val;
> >+}
> >+
> >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 v=
al)
> >+{
> >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >+
> >+	if (reg.addr < gt->mmio.adj_limit)
> >+		reg.addr +=3D gt->mmio.adj_offset;
> >+
> >+	writel(val, tile->mmio.regs + reg.addr);
> >+}
> >+
> > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> > {
> > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >@@ -446,10 +472,12 @@ void xe_mmio_write32(struct xe_gt *gt, struct
> xe_reg reg, u32 val)
> > 	if (reg.addr < gt->mmio.adj_limit)
> > 		reg.addr +=3D gt->mmio.adj_offset;
> >
> >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
> >+
> > 	writel(val, tile->mmio.regs + reg.addr);
> > }
> >
> >-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg)
> > {
> > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >
> >@@ -459,6 +487,21 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg
> reg)
> > 	return readl(tile->mmio.regs + reg.addr);
> > }
> >
> >+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >+{
> >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >+	u32 val;
> >+
> >+	if (reg.addr < gt->mmio.adj_limit)
> >+		reg.addr +=3D gt->mmio.adj_offset;
> >+
> >+	val =3D readl(tile->mmio.regs + reg.addr);
> >+
> >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> >+
> >+	return val;
> >+}
> >+
> > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set=
)
> > {
> > 	u32 old, reg_val;
> >@@ -470,6 +513,16 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg
> reg, u32 clr, u32 set)
> > 	return old;
> > }
> >
> >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 v=
al)
> >+{
> >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >+
> >+	if (reg.addr < gt->mmio.adj_limit)
> >+		reg.addr +=3D gt->mmio.adj_offset;
> >+
> >+	writeq(val, tile->mmio.regs + reg.addr);
> >+}
> >+
> > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
> > {
> > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >@@ -477,10 +530,12 @@ void xe_mmio_write64(struct xe_gt *gt, struct
> xe_reg reg, u64 val)
> > 	if (reg.addr < gt->mmio.adj_limit)
> > 		reg.addr +=3D gt->mmio.adj_offset;
> >
> >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
> >+
> > 	writeq(val, tile->mmio.regs + reg.addr);
> > }
> >
> >-u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg)
> > {
> > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >
> >@@ -490,6 +545,21 @@ u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg
> reg)
> > 	return readq(tile->mmio.regs + reg.addr);
> > }
> >
> >+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> >+{
> >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >+	u64 val;
> >+
> >+	if (reg.addr < gt->mmio.adj_limit)
> >+		reg.addr +=3D gt->mmio.adj_offset;
> >+
> >+	val =3D readq(tile->mmio.regs + reg.addr);
> >+
> >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> >+
> >+	return val;
> >+}
> >+
> > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32=
 val,
> > 			       u32 mask, u32 eval)
> > {
> >@@ -511,7 +581,7 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg
> reg, u32 val, u32 mask,
> > 	u32 read;
> >
> > 	for (;;) {
> >-		read =3D xe_mmio_read32(gt, reg);
> >+		read =3D xe_mmio_read32_notrace(gt, reg);
> > 		if ((read & mask) =3D=3D val) {
> > 			ret =3D 0;
> > 			break;
> >@@ -531,6 +601,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg
> reg, u32 val, u32 mask,
> > 		wait <<=3D 1;
> > 	}
> >
> >+	trace_xe_reg_rw(false, &reg, read, sizeof(read));
> >+
> > 	if (out_val)
> > 		*out_val =3D read;
> >
> >diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> >index c06fcac2cc5b..02364ba9dda2 100644
> >--- a/drivers/gpu/drm/xe/xe_mmio.h
> >+++ b/drivers/gpu/drm/xe/xe_mmio.h
> >@@ -20,11 +20,16 @@ struct xe_device;
> > #define GEN12_LMEM_BAR		2
> >
> > int xe_mmio_init(struct xe_device *xe);
> >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg);
> > u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
> >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 v=
al);
> > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg);
> > u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
> > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set=
);
> >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 v=
al);
> > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val);
> >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg);
> > u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
> > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32=
 val,
> > 			       u32 mask, u32 eval);
> >diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace=
.h
> >index 2f8eb7ebe9a7..a5d514c190a2 100644
> >--- a/drivers/gpu/drm/xe/xe_trace.h
> >+++ b/drivers/gpu/drm/xe/xe_trace.h
> >@@ -12,6 +12,7 @@
> > #include <linux/tracepoint.h>
> > #include <linux/types.h>
> >
> >+#include "regs/xe_reg_defs.h"
> > #include "xe_bo_types.h"
> > #include "xe_engine_types.h"
> > #include "xe_gt_tlb_invalidation_types.h"
> >@@ -507,6 +508,31 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
> > 	     TP_ARGS(vm)
> > );
> >
> >+TRACE_EVENT(xe_reg_rw,
> >+	    TP_PROTO(bool write, struct xe_reg *reg, u64 val, int len),
> >+	    TP_ARGS(write, reg, val, len),
> >+
> >+	    TP_STRUCT__entry(
> >+		    __field(u64, val)
> >+		    __field(struct xe_reg *, reg)
> >+		    __field(u16, write)
> >+		    __field(u16, len)
> >+		    ),
> >+
> >+	    TP_fast_assign(
> >+		   __entry->val =3D (u64)val;
> >+		   __entry->reg =3D reg;
> >+		   __entry->write =3D write;
> >+		   __entry->len =3D len;
> >+		),
> >+
> >+	    TP_printk("%s reg=3D0x%x, len=3D%d, val=3D(0x%x, 0x%x)",
> >+		      __entry->write ? "write" : "read",
> >+		      __entry->reg->addr, __entry->len,
> >+		      (u32)(__entry->val & 0xffffffff),
> >+		      (u32)(__entry->val >> 32))
> >+);
> >+
> > TRACE_EVENT(xe_guc_ct_h2g_flow_control,
> > 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> > 	    TP_ARGS(_head, _tail, size, space, len),
> >--
> >2.34.1
> >
