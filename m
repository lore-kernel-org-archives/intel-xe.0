Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACADC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 05:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738E810E17C;
	Wed, 29 Nov 2023 05:09:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F8410E17C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 05:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701234556; x=1732770556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j4RfFG2lePxowj1cEdVX9rKTkeKJzpv6lgz7v7cNzGM=;
 b=bNlQsX32S7lMfi2JmTGwCig8lkZhoxtpwUHHVSSWZNxiF7hSuyXdhmnS
 2R1xBmzdBnJ1fJjdbeIWp8HrJHQcocdKqRwETqdZACA9LPitnP9rsqE2I
 7lZDcUam2+seMnLzMMP0IMq8YcAlovF2rWMDY8+2rfKKLzwjxAlmIclYo
 oPjMTO5lh6vmlnv2CXAN8fMqUYzlpvYU8Mf9iZyiQoc0Z3DoGIpvvQb4Y
 h/wOY+jUz3i8p42u7tw1FKHA8wzrf5k+/QQ/7tory3HoP4w2zyFnEppsk
 1J2SfjsfbA33rsBco2aPvgrKamSxaeLQ5IEKCz14UejfPFUVq4mYyT7Mk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392843597"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="392843597"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 21:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100369627"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="1100369627"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 21:09:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 21:09:15 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 21:09:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 21:09:14 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 21:09:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItsTip7+BXM7zAwFLooHv4sZEv1DdHkqv05B10YNvWieMe7zRL1IjEbmTLvGFQtHsZZEXU/1ryjAVX/F9AS6V7tMwKSnrqFrqLEPILz0A6WtAHpXqH2+eiDohpHBMdAev9VoCqqS7rxNio2DxU7L9oobK/HLPyLGvt4dvgWe4A2iQc7BP5WD0pICWES5qazHm7Tw2FR03TyzS2V032/TQDIHVjzB9vaXWh+98LlusPoJnynnLC6Fyy9JFAVG1TgXvXzf0Wg2dGZIK8UYUmXCQiwSfpv2YMyDbGL+FhEspE/CaLpXtM1uD4/6teIJZ5bbW96OcKF0ygQRyFCC3B4vyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNeR2cgjNo0uWnk0BSpbOpxhz4HuhjgUGCbLxJfLhFo=;
 b=GIw3CN0CzRiO8VmEzQzSgxJ60+70B9cblarLXwF2uRo8vD9KtOXwAoIlqRViP5Bd2e4S63Bp92/hwtdGhkBZOn5K1hJq+JdHmtQ1kyAtAI3hzE80X2mkxPTcGAL2EX2HVjBkAnWZ/2atFVuVwfZttSxZWmdocc/afjHnnatnMFIHizBb6qCTyoIn+2XSZwe7gNBQN7UrWKOmI2zwifdd1Zn+An1gm8KajTe7BLXaxR/x5GgGl2RqC1QkdBZqoCXQvcVvltfAVGhLY8/bjK5VFHdcYGZv8GcKv/8fQ24R+FLEJQ5QvrVdO6ok4ZCVW9gYLHX4Rb4766ZD8vLZM0mRcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Wed, 29 Nov 2023 05:09:12 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 05:09:12 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH V2 2/3] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
Thread-Index: AQHaHt8VRWXDfgSdREaXrWOcMcjvh7CQF3aAgACtveA=
Date: Wed, 29 Nov 2023 05:09:12 +0000
Message-ID: <DS7PR11MB619746FC75A7404D35603E4F8183A@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20231124141311.3894165-1-tejas.upadhyay@intel.com>
 <20231124141311.3894165-2-tejas.upadhyay@intel.com>
 <2shdzih77alry6puziabqq3udglakqygq3llhh7qons6pvkaj2@nmjoug5qilke>
In-Reply-To: <2shdzih77alry6puziabqq3udglakqygq3llhh7qons6pvkaj2@nmjoug5qilke>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|SJ1PR11MB6297:EE_
x-ms-office365-filtering-correlation-id: 410ddd70-66a3-4c35-66ef-08dbf0995370
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YX2WNZktAdFSsSXB1UiMcql4OBXJRpmWrDHiIB53Tk6LSPtEP0+7FzfhSR2Y7yz2exAE0mbINeQSfB3oZxuK3Yq+wlHHXpyZzxkiRszZGfnK0nAyb+6suOccMKUXAvOLWUVXBxib8VnaO7+o3Kh+ojESl2vQzoytvo89xsweLavJLafB4/XoSO5+lByAPxkCTejfbonInPfKlk/UrNnZeNbByrdQi4eTHxoY0ZB1qc+CFHsefgphJ9vBcpXkfxdC/fS374r4C0a96CXXolY2hJYz6XpCQ2ybrxD5vVaJQzdKA582whzuejulWliEp/ZdxY1JYuH00mWCmsiRN0wyd0nO4Op9BwN0Do7Ph2iAHDa0RDzVdlJaOQ4UZNFtnFpbc0XDU2Klei04kz9okWT5lo0gedCvtkIXUS4tdIn1SAm8RHAJCkUWT0idpLcOLKf+y8ef7MjJ0GKDi0P96qj0bK3bz7c4rXL0XeGnFhd77E5jxdF5kb3ULJpPNS/8VTOMd4t+hOLqplJBn9JnsER/IOK9Y3ss/jx5meXrnO+3J2TDC2LHJGJBTxcRN1avLf16QBD3oNCMJ090eI7M+u6uqNwtyK/70RSqzlSJHnNNImy0JYulnIAyuwJAURxMocUq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(2906002)(7696005)(52536014)(4326008)(8936002)(66556008)(8676002)(6862004)(64756008)(66446008)(76116006)(55016003)(478600001)(71200400001)(9686003)(53546011)(6636002)(66946007)(316002)(66476007)(6506007)(38100700002)(83380400001)(41300700001)(122000001)(86362001)(33656002)(82960400001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wLjSEOP7liR6ZPOIV8zi2ZKUvbayhBTEUQr1MveuPr3FmlR934pjk8mDdwaB?=
 =?us-ascii?Q?zV7/9WCtjdE033GHWJts/+p9M/iylkPz6if8p20dcupYtO86rFMvh7zL/oM+?=
 =?us-ascii?Q?/1Q9YI6AHqbmam5czgJLcPpzdNAd4blR4fWre9StFLpvQLsGNGS0hQVHikFr?=
 =?us-ascii?Q?AzNE/Oen0gf8cge6cdzG/WBxQsgH5WBm5t9AkqqSiAfg0Em6kGgUzfYKaQ6k?=
 =?us-ascii?Q?HekrL3JpGMyjwmuHNGsVaVUVvdG5663EBJXTEvfeI9F+UeShxrTtwinJ5RFx?=
 =?us-ascii?Q?s/RE8wyGsvBSJLD9PnExqhAO2ZKoxAZxr2sc44IvuFXPytN4/6Ci7fefVO5G?=
 =?us-ascii?Q?Mr6dGq6Caq/aXsZ1E+EsucPa87dL1jlTqYzdXJ6zErm7i0owtqKdUbe4kGYT?=
 =?us-ascii?Q?gkdyxFMypldBfS0mTkQYnC0RMfRJ6zOurb6FOIAMm1e3DaE8oBwNCLlviglR?=
 =?us-ascii?Q?N6rprFbTIb/2utapvu96xlHIGbxRIpk6SIW8qoSXV/Bxyn/stCGTfJvpO6eu?=
 =?us-ascii?Q?6fq0ouFT5BPAjLRe1V2x0c7xNI4jfhxWbxvsFL4IxTwyg64nceYv7NrJxuKm?=
 =?us-ascii?Q?zodR6Dzbn8UNGwqiGFzknpqYiXiaQVuZ39EayPXBY2ApuzPFdWZC3QIq6G3E?=
 =?us-ascii?Q?2gMQ0udwHxYSfufUWpfHXg4t77WM20AjZ7XO1Mhq3SjzX2OL2EeFepiA8xVj?=
 =?us-ascii?Q?S69yqAdpOP8x5gwPwjMNBrkJ7qdzZo7WHOh0eKRRWTfAddPpvZNxAuEnHl7H?=
 =?us-ascii?Q?vkvP3qbingD53vfHi9LmkJSEQNJaHFXGRUmcAogqkmxNsKALQh6U/hLo/Lan?=
 =?us-ascii?Q?5MalD2vGcTSNZyO1FltAS2uhP/Pem4Xd3JtI7BJKZEE7Dfi8FmHegezSuGHb?=
 =?us-ascii?Q?5+kyrCxednF5TcjmwMXUsGsqm0XB1E5E8oXaG0DU4uJvmuFFRr82aL72MDSV?=
 =?us-ascii?Q?7bSfwUbgGJCb+2EsP/E1q2xPAOoXpRcimE7p9eOGkizxVoGptTMRiujXrM3Z?=
 =?us-ascii?Q?GkjdRn9S5+pfrbER4sXj76egoN07/xQGZBk8B+1FSFTo2Qjy6fc9WDHKfQNX?=
 =?us-ascii?Q?7lnCAAkSwjR8pWzl1WgKCo2JXoovKsFuBvSR8OimhiSiQHoHFYm7IcwrJGDw?=
 =?us-ascii?Q?RYHVJWgA6Q7bt7Qgjglcdnhu2RZgi/oLGuxf+dKfZrSXbLF5p5PSBYB2R3lT?=
 =?us-ascii?Q?sGzFAsp0LvXMeC3R1hmiwUOWF+akqNd/WPKkNzICg/YcTU140icxnk2MFc9K?=
 =?us-ascii?Q?mMo9BsBQ76E9WjTb/ZL2DjH9ZtOATpdE28DQ5HQNO3cLu9kCX9GopF9NiqYG?=
 =?us-ascii?Q?pjo1Z0dupqqYa7Bw1sb5DIt8eWess2r5o7nThKpAK4BQsjQFkPIgUMvTJIM/?=
 =?us-ascii?Q?lMlrQwQ5yYde32VPU1mdC+rmux21AyW8iZAs+8MMDiGMA+bnuu1pWIYdye6W?=
 =?us-ascii?Q?IHuzpVQwX97dS5ijWkSk1SXHJBNgvIqWNZz+OhYPg5nhJADqOth1rHW7wHI8?=
 =?us-ascii?Q?BEERT38jAiHmmEmCbiQbCGjFlq6pj6ZDO/4d23q6aYa23vJ6DGSOd55aD+rN?=
 =?us-ascii?Q?jIsXj8qk4kBx/h1tjarDEbtpLEvEquAp6zrEe7iZlkYWQ0sO8NldlKJTN86o?=
 =?us-ascii?Q?u/51gnbDO3whI7WZ8nWCzTMB6qnRMC2Ad2x88VRngbKb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410ddd70-66a3-4c35-66ef-08dbf0995370
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 05:09:12.2984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XX+m9V7MHByh3hQjEeedU6c/aUOU0y9B6nRBPDHOIoUDOX7rDwpwWy5E7sqRxZnv1nu01Uoknxg7Xqukb90FSTZhiB4HU3IY+bBcl0ZJ1lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, November 29, 2023 12:12 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V2 2/3] drm/xe/ats-m: Expose uid for ATS-M=
 via
> sysfs
>=20
> On Fri, Nov 24, 2023 at 07:43:10PM +0530, Tejas Upadhyay wrote:
> >On ATS-M CSC firmware calculated unique device id(uid) can be read from
> >defined registers. Only ATS-M has this way of reading uid. Also ATS-M
> >customer require this solution to locate and name their devices
> >effectively.
>=20
> s/Also ATS-M.*//
>=20
> As this justification doesn't really belong to a commit message.
>=20
> *This* solution can't be a requirement. *A* solution, with this being the
> proposed one, maybe.  Imagine the mess if each customer with each platfor=
m
> requires a different solution and each solution only works with one of th=
em.
>=20
> >
> >Consumer of csc uid is level0 sysman and end users using sysman.
>=20
> so you mean that only ATS-M works with level0 sysman? That seems a very
> poor abstraction to be done in the kernel. If we need a uid, let's give a=
 uid
> that can support different backends so we don't confine the support to 1
> platform for no reason.

No, By this I was meaning, ATS-M consumer seems to have requirement of read=
ing UID, which they are going to get through sysman.=20

Also, In future when there is requirement on other platforms to read UID, t=
hen xe_read_csc_uid() API can be made generic like xe_read_ uid () to suppo=
rt all types of methods to read UID.

Infact I will change it to make it generic as part of next patchset with on=
ly abstraction being UID read method in xe_read_csc_uid().

Thanks,
Tejas
>=20
> Lucas De Marchi
>=20
> >
> >This patch exports uid to the userspace via sysfs.
> >For example, uid can be read by:
> >cat /sys/class/drm/cardX/device/csc_uid
> >
> >V2(Michal):
> >  - Make separate patch for csc uid capability
> >  - Use %#llx for 0x
> >  - Dump error value when sysfs creation fails
> >  - Have consistency in csc uid name
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> > drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> > drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> >drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > 4 files changed, 37 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> >b/drivers/gpu/drm/xe/regs/xe_regs.h
> >index ec9372aa739f..3599c7b38b61 100644
> >--- a/drivers/gpu/drm/xe/regs/xe_regs.h
> >+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> >@@ -71,6 +71,9 @@
> > #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> > #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> >
> >+#define DEVUID_LWORD				XE_REG(0x102008)
> >+#define DEVUID_HWORD				XE_REG(0x10200C)
> >+
> > #define GGC					XE_REG(0x108040)
> > #define   GMS_MASK				REG_GENMASK(15, 8)
> > #define   GGMS_MASK				REG_GENMASK(7, 6)
> >diff --git a/drivers/gpu/drm/xe/xe_device.c
> >b/drivers/gpu/drm/xe/xe_device.c index 8be765adf702..6c8a9f9d69c9
> >100644
> >--- a/drivers/gpu/drm/xe/xe_device.c
> >+++ b/drivers/gpu/drm/xe/xe_device.c
> >@@ -342,6 +342,15 @@ static void xe_device_sanitize(struct drm_device
> *drm, void *arg)
> > 		xe_gt_sanitize(gt);
> > }
> >
> >+static void xe_read_csc_uid(struct xe_device *xe) {
> >+	if (xe->info.has_csc_uid) {
> >+		struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
> >+
> >+		xe->info.csc_uid  =3D xe_mmio_read64_2x32(mmio,
> DEVUID_LWORD);
> >+	}
> >+}
> >+
> > int xe_device_probe(struct xe_device *xe)  {
> > 	struct xe_tile *tile;
> >@@ -366,6 +375,8 @@ int xe_device_probe(struct xe_device *xe)
> > 	if (err)
> > 		return err;
> >
> >+	xe_read_csc_uid(xe);
> >+
> > 	err =3D drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> > 	if (err)
> > 		return err;
> >diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >index 99113a5a2b84..4fbf0275d3bf 100644
> >--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >@@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev,
> >struct device_attribute *attr,
> >
> > static DEVICE_ATTR_RW(vram_d3cold_threshold);
> >
> >+static ssize_t csc_uid_show(struct device *dev,
> >+			    struct device_attribute *attr,
> >+			    char *buf)
> >+{
> >+	struct pci_dev *pdev =3D to_pci_dev(dev);
> >+	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> >+
> >+	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid); }
> >+
> >+static DEVICE_ATTR_RO(csc_uid);
> >+
> > static void xe_device_sysfs_fini(struct drm_device *drm, void *arg) {
> > 	struct xe_device *xe =3D arg;
> >
> > 	sysfs_remove_file(&xe->drm.dev->kobj,
> > &dev_attr_vram_d3cold_threshold.attr);
> >+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);
> > }
> >
> > void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14 @@
> >void xe_device_sysfs_init(struct xe_device *xe)
> > 		return;
> > 	}
> >
> >+	if (xe->info.has_csc_uid) {
> >+		ret =3D sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
> >+		if (ret) {
> >+			drm_warn(&xe->drm, "UID sysfs setup failed
> err=3D%pe\n", ERR_PTR(ret));
> >+			return;
> >+		}
> >+	}
> >+
> > 	ret =3D drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
> xe);
> > 	if (ret)
> > 		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> diff
> >--git a/drivers/gpu/drm/xe/xe_device_types.h
> >b/drivers/gpu/drm/xe/xe_device_types.h
> >index a28257b26355..eb3897309dac 100644
> >--- a/drivers/gpu/drm/xe/xe_device_types.h
> >+++ b/drivers/gpu/drm/xe/xe_device_types.h
> >@@ -238,6 +238,8 @@ struct xe_device {
> > 		u8 vm_max_level;
> > 		/** @va_bits: Maximum bits of a virtual address */
> > 		u8 va_bits;
> >+		/** @csc_uid: device uid calculated by CSC FW, used for
> generating uuid */
> >+		u64 csc_uid;
> >
> > 		/** @is_dgfx: is discrete device */
> > 		u8 is_dgfx:1;
> >--
> >2.25.1
> >
