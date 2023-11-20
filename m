Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8380C54E76
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 11:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C7D10E3A6;
	Mon, 20 Nov 2023 11:49:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A3110E3A6
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700480989; x=1732016989;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1hzk23JEO/vL14NujSZr1WSFKl2BAhobpGZYnlDhouo=;
 b=DQqpcHdmIW3WL+iKvForlYGYG4sFoq2gUtSPzqwUcIaeVGu4Wko9nP3+
 Bo9xOyyk301Veu4B6IbonbScbrCvdAcAjF2vRg4WR3Po8lluCCtuxPpyg
 S+TwINlrxJxhwTpIoRK5VXOFp1gvRx9HouV2JpXGlsMWDSxnOCZPhAmj1
 GmaFHY6sP4gow6Es+gwJUMqpbgRhS/mz1ulHLvjQYbPh+ErmjzFQRGpVJ
 rTHnJ42q/YNKvLnAwjpk5ovVqwxWGC9oY6dd38iLJSi4wikXJc5txPDUK
 ZRp9GERvUcI7GwELPiMIFtro2zbl4DM+TNDGJslFIQjC92OcbE/fr8Du4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4721720"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="4721720"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 03:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="801133309"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="801133309"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 03:49:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 03:49:28 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 03:49:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 03:49:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 03:49:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMNKKzXbmso2ORP0FXMzwXqueEaMD+jwX5CIFVYXlaUVcM1/V2aFwvI5UX9RHU4stisIwncySSvGRa3BW864Me4URaNMsi7ysClT0/kFhKd0swqubG+aJxLo/z/ZHjIA8+EPp2UXKJXFh2z9DDEm1/Kdg9KMO8O9Kpy1brh/o4nv7N1UwfpOGnREEiN+NdYCYvQShcpxLgSvGoI6eUbN7GLLLmgY27JGANF5Fj8yIWfd1d+7RI6T/w3jGnqr4d3m5RYQpWrwsZGIm6lEFuXxIJ09FBuyDP/LfFf4gNv9V+NjlYVWi5knZdk0K3tzqlOOgYwncCPU0SgXCW4YP7/KjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDeNZzbOIvvoiQDOVzc1nS5A4SRf6IBJQSuwgL/kMYc=;
 b=FReA+FTOW/bjy09ciaAxv2DEVzl+43Okx8OcAugiv+YbUYuAQxh74csvKNr2/lFasmwRv7tZbpzALEFvPVvF6a3UOxxsHvOZtMKNjpUlHdId+WfmX1Cq6o7H/fkIQdNqkenlxxIRMwO/VrQOkUdqSohb2uegL9on3br53u6bZWsQQxm+JeRNcdXyloTGY9ao84IKhKhKEfX7IcR5QSt1LKCdZ6JEV7j8KdFTWKPqO9FRHPKOuttP/amA+U5aKbEtZ2Ay09OCubCpUNLspXCLHt8zB/RZ+hqThN52YtWGLnCzfpdgkAhENq1YT1UVbPZFXgFgywuyNVKns+CZGLeqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH0PR11MB5346.namprd11.prod.outlook.com (2603:10b6:610:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 11:49:25 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 11:49:24 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [CI 09/10] drm/xe/gsc: Define GSCCS for MTL
Thread-Index: AQHaGajCEkiY1UY06UmZIP4yhssOfbCDG6OA
Date: Mon, 20 Nov 2023 11:49:24 +0000
Message-ID: <SN7PR11MB67506D45A1F7B2E6736344B2E3B4A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
 <20231117225155.2614535-10-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231117225155.2614535-10-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH0PR11MB5346:EE_
x-ms-office365-filtering-correlation-id: 9d747851-658c-49ad-6535-08dbe9bebde1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NuZpIXQ2C/qiBn5dJKAHjoqKhHowE7HmSFdfauTpF7eVmGYKwuVh0vKxMRm3GD68A8nTdrtS3LoPSg95VmcyPRU/FB9bxousTqCnscHTi9iatFA2F45bDyu0wbhqqMF1iKfGN6jYNwjec1oloaMddg8iwrIAApMTkmbOcwGfIOR6tRuODKhLROPMsLp/tMUuOHhaYYLerNViMShMsZ0d3kd4RTLHVVXVPgBUcxD66YgN3uTFD2jshYAFJ5k6jbFLSMNK+tVS/YW0cVREbcuT1FgtzQk/tNyp8bYFPN3gcb6mTrFBsor7ZVDfL5F9kDaBRgC2tybb/ILpXc2HUF5R3r0cwKOkBFp34PdQOLX6nuNZhVyZkxmr8buo9klXTagtnj+YaVjc94gieiC/tvAac+ijEJrnqOs/HIR2Qi2HwIKTVnI0dOTqowQ/kE0UgGRt99fH0FRNCqcIsQ45lvXVcgdBh6/91iAnQIXmKRgKaKiVPstfL5akmDaAGytkQ7rnAm27TBeo5JbZ3XzdPQp0IpqcOZtCQfO1SKjgMlPBgACmgNbKT237sDTwkVIp1Z0R+aXaPpsUZIBOatuiJjj74EFeSWYzbBuAQXOLzeKOpp5FkacxQxIObOZYQLFk4KNB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(86362001)(5660300002)(2906002)(52536014)(33656002)(38070700009)(9686003)(478600001)(122000001)(6506007)(7696005)(71200400001)(83380400001)(53546011)(26005)(8936002)(8676002)(38100700002)(316002)(55016003)(82960400001)(110136005)(64756008)(66476007)(66556008)(66446008)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F4UsFZxX3t1bewfaK3reqRSwS0BIml0W7oxRvUjSDvlhVyGYZkuZ1e8Z1D/U?=
 =?us-ascii?Q?igFk6dXySz6+q/+NSGCC9dQ5rmeJcjjVSDSiXNhi/ls8fGbn8C8+lP01ejP5?=
 =?us-ascii?Q?0LjzsoYxssZLPRKM1WfrozozZ28XDX9QDfyclN49wKEp5ywsrq7jVaNoEJk2?=
 =?us-ascii?Q?ZA/jhDfHmP3dDIIB4dCkuxM18Fnt4FBTMSThF0QOp3JpnMM1zt4Pvs0HoYVT?=
 =?us-ascii?Q?g/C6Z0L1q3MQdsEFQvtITeIS0pQ+UZDuAaSSCjwWLwZ6ZhMe9VyLdDeo+nCp?=
 =?us-ascii?Q?edU1tu/ZaMxXggouhE8n/mC1CmMgGD3PrYW1jdx8eS3YtQ2/eUCbsjJypcxs?=
 =?us-ascii?Q?2Q7QyCAL08mvinDLitS1UVL30moJ0YB3C2N2Q/oqXZPAqoO2LGeF6AXbCfcs?=
 =?us-ascii?Q?VflYgI2THLf511BaDKTWnhPRJGZqaL0FFs0JaTzXBKgsELeyjSZBOEf+X+Wg?=
 =?us-ascii?Q?7hwn8YMp6W5r/eqRM0Mo49f8D8tGxv9ALswNq8qWwwWdSp5qQU9ejB86WGy9?=
 =?us-ascii?Q?zpyFjvedZL0iTtnhaOIPnl/kjC3BY6HIhQtnlSV9Amy/10Eqwyob6PNQ8yFO?=
 =?us-ascii?Q?qMckNI5SY/C1lNp0ybMmrA6LVdZX9v/GVF2nA7YBVpeqSPMgPjydW/w/mngL?=
 =?us-ascii?Q?qZhFpgvH6l4fC69rWxNGJcwfYFn5mTWkY1BKnkgzjsbTc9dTmkK89WXm4d6Y?=
 =?us-ascii?Q?g+1aPZJEgXyTzEEONCBmUl6SK6J5Nf177TBTXfONEUCabK9OlTfvcpY5pnmM?=
 =?us-ascii?Q?OGpxRU4cL9eeHznC172AUHXvCUbsj7uZ5O1ZTfQGRZsbGBWVOT4/xYiJ8Ost?=
 =?us-ascii?Q?WKPHLcza2kCvcrG12CI1jLl4/0nmFpbG32KZfCPZ8WOO+WkNgX3rds6cufuL?=
 =?us-ascii?Q?GRO9oc3VOWMGpInJoPG2/4bhe22HlK1Zvafi6o5sXUMPLyR+ZfaDXEMPJpTm?=
 =?us-ascii?Q?vlttUofw+7LdoCfKwJbSECpv2CxPcwLq6iroYCakNjSqPmlwu9KTNG18TLDD?=
 =?us-ascii?Q?/sCESEL/0VJ9GewNyEBixYIhDN7VZaEX322oMdu50vw3iNhJT7WrYmeNtFic?=
 =?us-ascii?Q?0stWwbADHgF2Y7opdWiybeEmBMzGrgF9tlVrxIfojORiuEmZ9WnYmwAVR2Yb?=
 =?us-ascii?Q?0VrKRy3OryVL9WXwYtYpeRUbt6D4+cpdSgBRZSGzH3Razq0O6jsMWX4vqktw?=
 =?us-ascii?Q?PxlGpi0YK1kqkU+4Trqb7hk5wM9kPUxLiZK2JmbozuhhxpXu5XHyirfSxUn5?=
 =?us-ascii?Q?GbDsfrU29iGBZi4NFaQa7Qfx9F7WtNgyHT9ZOUj3YWLdBj+5wIN7OCCy/sKH?=
 =?us-ascii?Q?OWVnQbHq3D3cNuAJe1PLUQueMsB8F3J87YodsklqUJJO1q2V+2VDUGyC0/Sh?=
 =?us-ascii?Q?qXs1EODF/lGRHyI+SJFLgMvar4A1MdLJr+Y+LT+SgtmyZORzJwgE+hXe3VMd?=
 =?us-ascii?Q?o2BTYLjErNX5suDQm8m5dVQhlAug1c5hIFIbvygf7bC4ahBW3k+T1J5s7iph?=
 =?us-ascii?Q?ults60MNlBNwYlrw6UfNXx3vW2YLiPmfEBGCOyIRsF8noEVqAkx8XIrhQZB0?=
 =?us-ascii?Q?LD56I1FWdbI5MpvGFZcCCcdpZjASSO02it9ZGPl8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d747851-658c-49ad-6535-08dbe9bebde1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 11:49:24.1643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/3uuqS4IZMCyduO+pa1yMjLycPjBkLG8VzQsm4FVzAJhls/HPmsWh6e39JgdWxyxerXEv286KHF0CVPcrgDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5346
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [CI 09/10] drm/xe/gsc: Define GSCCS for MTL
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Dani=
ele
> Ceraolo Spurio
> Sent: Saturday, November 18, 2023 4:22 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [CI 09/10] drm/xe/gsc: Define GSCCS for MTL
>=20
> Add the GSCCS to the media_xelpmp engine list. Note that since the GSCCS =
is
> only used with the GSC FW, we can consider it disabled if we don't have t=
he
> FW available.
>=20
> v2: mark GSCCS as allowed on the media IP in kunit tests
>=20
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci_test.c |  9 +++------
>  drivers/gpu/drm/xe/xe_hw_engine.c      | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c            |  2 +-
>  3 files changed, 24 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c
> b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> index 9c6f6c2c6c6e..98ecab51154e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> @@ -33,13 +33,10 @@ static void check_media_ip(const struct
> xe_media_desc *media)
>  	struct kunit *test =3D xe_cur_kunit();
>  	u64 mask =3D media->hw_engine_mask;
>=20
> -	/*
> -	 * VCS and VECS engines are allowed on the media IP
> -	 *
> -	 * TODO:  Add GSCCS once support is added to the driver.
> -	 */
> +	/* VCS, VECS and GSCCS engines are allowed on the media IP */
>  	mask &=3D ~(XE_HW_ENGINE_VCS_MASK |
> -		  XE_HW_ENGINE_VECS_MASK);
> +		  XE_HW_ENGINE_VECS_MASK |
> +		  XE_HW_ENGINE_GSCCS_MASK);
>=20
>  	/* Any remaining engines are an error */
>  	KUNIT_ASSERT_EQ(test, mask, 0);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> b/drivers/gpu/drm/xe/xe_hw_engine.c
> index e831e63c5e48..c52c26c395a7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -26,6 +26,7 @@
>  #include "xe_rtp.h"
>  #include "xe_sched_job.h"
>  #include "xe_tuning.h"
> +#include "xe_uc_fw.h"
>  #include "xe_wa.h"
>=20
>  #define MAX_MMIO_BASES 3
> @@ -610,6 +611,24 @@ static void read_compute_fuses(struct xe_gt *gt)
>  		read_compute_fuses_from_dss(gt);
>  }
>=20
> +static void check_gsc_availability(struct xe_gt *gt) {
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
> +	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
> +		return;
> +
> +	/*
> +	 * The GSCCS is only used to communicate with the GSC FW, so if we
> don't
> +	 * have the FW there is nothing we need the engine for and can
> therefore
> +	 * skip its initialization.
> +	 */
> +	if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
> +		gt->info.engine_mask &=3D ~BIT(XE_HW_ENGINE_GSCCS0);
> +		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
> +	}
> +}
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt)  {
>  	int i;
> @@ -617,6 +636,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>  	read_media_fuses(gt);
>  	read_copy_fuses(gt);
>  	read_compute_fuses(gt);
> +	check_gsc_availability(gt);
>=20
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT <
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT >
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> 682ba188e456..406b4cd4c88a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -197,7 +197,7 @@ static const struct xe_media_desc media_xelpmp =3D {
>  	.name =3D "Xe_LPM+",
>  	.hw_engine_mask =3D
>  		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> -		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
> +		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>  };
>=20

Do we have a function which checks if GSC CS is running or not for clients =
like HDCP to use

Regards,
Suraj Kandpal
>  static const struct xe_media_desc media_xe2 =3D {
> --
> 2.41.0

