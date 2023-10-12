Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768C2CDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 03:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4553810E3E3;
	Thu, 12 Oct 2023 03:39:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D85910E3E3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 03:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697081987; x=1728617987;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PnrCh2PcNarLzuyeSBpsHngOIIY3IGsdByn82tpkU5k=;
 b=XyFnz9iyt9s+/0JHb5GFJoA/VQ1LMgL4MKARENthzgixnLczkogl2kWn
 9uzyc4sGiDcjz+V0Nevh4BQB3bJWeiD7lsKg1qbDTf5T7jm1e+eFh3JAM
 9PrQ4sKqvkWl8rI+3/7gpnYjbO1PnbRQE6/3LYGkTwDbzANo/7o/tD1j6
 MF1fojqXvFa9fNWVc7TX3crYNaeSa940egkV750gJFgar+3aHgWH9u4AQ
 e08Uy+D1maoWsY0ADdF8nLy60xSJYQ7RxpPjIc4cqD/hBF/0PZF81+//t
 /4wzEvjTm9WHN6X/Sa5FoMNAsv2rJN4Z3CG0mHxUCN/inCqBwQHEvUxCf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="449015924"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="449015924"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 20:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085501920"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="1085501920"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 20:39:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 20:39:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 20:39:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 20:39:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 20:39:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fub31znE0LRnuO/Sz+ypR4CtRCDPhJrCMQ1AnvIJk96RzYAJaoroT7bimmkldKTZzl8Q6WzMkWBN3xsahY6wh+uJTgzsuerLIMsehIe06EIf0jwKwwkHyJe5V8JtveabxvENuuqDsT03zwR7x/RXR5Y19fFbspozU0bd1rH+T5HkY3WH+OEIjGgtWsgwQsprI0TCO1P756wAhzpTi6CBsBLw3Le5/swROCf7BHg11WLdIYCG0fwhrVHpwT8QBG4pqw5bcKLevHGW0cyMIbgZnfvLfwN/tai1512E8kR7iCVUja6pKxE5UF5GyMcfojsT9r8p7SYF52d7NqAVMS4R5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69cQAPbepdG1CDrKeGDUbsuGON/6hflYb/SEVlrsLzg=;
 b=NkoV0lDN1/v8PJzJSj6Kt7Fr1bqYIsZkm9DsuKdwL/ZdJBkNFU/TJIRoT6qv+1QUHYbSmyUkvnrjfzWaMhFFBxQAo4Bq8OKystNCCGG9zboL3NTKQExPZYd4nyVoD9z70dVgGi62GQ8ahfefYzta++v4AvUW7jO8f2yX3YdFewsPvO0JmMewNne+ZRfDHl2koErw7HExAfq+yLfjyq64etZ/DtCyaKHymybG7wDAUcQhSgq0FbeLhGiM16VnDUJIxsLYwDxEetnX9T005rZpJ09GIyQh0FKp93LUBjnLjSPNQZrYPte3I3SSAXuJbZu1mRxNILHzCkLiruuGgPXwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.43; Thu, 12 Oct 2023 03:39:01 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 03:39:01 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [v2 0/3] drm/xe: Cleanup for addressing vga decode
Thread-Index: AQHZ+Es2hN5oGiVdDk6/UG5JhhcUfbBFip3g
Date: Thu, 12 Oct 2023 03:39:00 +0000
Message-ID: <DM4PR11MB6360B3578AB87F633CA96A66F4D3A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20231006115645.2402795-1-uma.shankar@intel.com>
In-Reply-To: <20231006115645.2402795-1-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH0PR11MB5126:EE_
x-ms-office365-filtering-correlation-id: 75c82d00-868f-4d67-2d2c-08dbcad4c5d7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c3HKR3t/ue83qgFSL+QGaDvpcDdW2aJPpTuzg86/1oW6OJiWVaFRDm/h7eUEn+1MrGpAFEcCBJ2+7Tbi4mbuiGNHX+mxt3zh37oVxvhm+o4jTqPeqLphm9hDv+ads0sK1rhADGrMiQwiAjWfb1+09hP5DTl07Pl0VY8xlNBNDeOLldO0jK/KtaDdhBZlit4Bog98RxY62DmeBSATWwY2gPSZZXVuEPOYA3FSyTMkcO0MLM0izZWZmDa07pgYrZE3lbl5jRKhEefJXlUKccdUDIHf7WNZDMjeHc/UON4zm3YfwSNy/hwzaQ21W38HD5NGY+7sXsQxfPsi1/ye9YHOJQU55nBl7qjuPOr+6y3nSH48aB/24ddtM8yoCgJ11xNvHmDHusJ+dK0jYo/HtBKwAiA2jHt3EycQRWuiL8LqcdFR3QbVtd4rV1RiPjKI1tpFSEhr1tXbRTDjThs0poFaXSzw9Qja/J2jbM7EQ2YrkFh5iMM6eG9TiJoGJxUj1vY9v9wZp370OpiwCS7uZFFPh2q3CJEZsBqDkibqVs53R6vvgRDvnBKyt/TdWaRApVNPYJ9tMM/4MIrgXuebcOVvU631sVjt47jwTqs7XeCbL/HHj3p1kWpoDL3j07te14ZW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(9686003)(26005)(6506007)(7696005)(53546011)(107886003)(83380400001)(71200400001)(55016003)(478600001)(4326008)(8936002)(8676002)(5660300002)(41300700001)(38100700002)(122000001)(2906002)(82960400001)(86362001)(38070700005)(33656002)(52536014)(54906003)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(6916009)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ja8jOUVZ/O70SXPn+XMLrSfSkCuGddSRZjYvUAzDT0pxVfVmUXNHjIpAePVp?=
 =?us-ascii?Q?c3NqBUG/W5BBhr6YVRs7myxb0otHYsRWLzAN8sPBL3u8LP9p8OkinudppYVZ?=
 =?us-ascii?Q?tIy75ruEJcxqeSk2wui5R6IwvD4hyO/zdYOtN1Lhd6rsQUo/wvNRdwJdpDhz?=
 =?us-ascii?Q?bTPH7zDjVlthISUdbMxQOVfVEkNYaKYssMZt+od5XSPUxdG/NRO5K/jl3sGF?=
 =?us-ascii?Q?oqEamgwPlHI9B239w8qMlN1j9Lf4ooQBXzXJR9CTvN6vIAOJSDC9o42TYFGW?=
 =?us-ascii?Q?PFI8ypdBisz9fnwYlQCat0K/6X3kLM9CYJy9WVPE7IKiMtRr1kPavx8m0CiJ?=
 =?us-ascii?Q?G52vSdZPXGBoFV8Ed2bi2PZ8IEWmYk+FJ+6ApaAKQPW+7cmnthPxuiVQeHVz?=
 =?us-ascii?Q?BF7abDffxYm2i3dz2jNIS/sMUhGnuDJMOY3hh6bL2vOAO5N7zf9/kAHlpZYh?=
 =?us-ascii?Q?mxYzjflNhV24jtC4lFmwoOQo9knEmFi1QpYQ/hgQVQN4izMXOvFp66f0k3YA?=
 =?us-ascii?Q?pDI+e6nGtYudacY0nRwRnzEDHaaMGmV4Sg/Vd6PIBznRbhPYHD0dFS9bVpRw?=
 =?us-ascii?Q?4hxGTxSeQKVraCE0mKtYvFEPPpjhXfZO7FIgsZDsBwwSilH7QAjdAsErP4B4?=
 =?us-ascii?Q?0KGflwXhHxPfphJVaYCNk0vdCrWVcpXXR07J2adMYkjY7xMJP6krIG4pPzBd?=
 =?us-ascii?Q?So3MKOqQPFR5b93wiLgwH5PfWxbhrWfCiVo/u6murX0S11hgPi/kfJQYWrtx?=
 =?us-ascii?Q?Ai1Om92xl7A+2oUq3VG2DWhxSBKfwdWIlGh8A5n2GLovaiVvQPt0RPQHB6u4?=
 =?us-ascii?Q?6GqrsrDa62CvHyjvsHNe4EjZ0QH4/2EijS17Seoi+RXp2kXg+uW5QX+kPhf7?=
 =?us-ascii?Q?CqNkLJVli4JlC7+G2zElH0Mn7tDitzqVmGgoLPo6442GW5Y3ABdDntm2/BMO?=
 =?us-ascii?Q?AGIlcumnx6NOPFLFqFwPI/mwbNzi3x8en5AagwKi/uJYUxPUNLR8riGVXR4U?=
 =?us-ascii?Q?AvHULEEyBK6FG90HeViCi5ZzkKMd/5+uxSUDDv6qoK4ww/bKjb6gzWl2Vhzx?=
 =?us-ascii?Q?dAWsLwuIDFEuJynegqbzast/GvsC4PexRImE67io/gtmy76JmhexTPkuxwon?=
 =?us-ascii?Q?wf2MsQCYvQb7Wzm+IRHuQfh5slnRDpqEoR8jNAl4TOgK935NrPnFSE4vedak?=
 =?us-ascii?Q?GBbp+LLSI+H5fkY37TrhbqDhXVPfeodtYFFHPLWN+LsgeqxmkGwRN3ajB4uj?=
 =?us-ascii?Q?eoyU92pfEs52XlcffWNLDRpOJEpDP/JClHShPDpBjjLSxxpJS+LV5CpMQrKk?=
 =?us-ascii?Q?YUcowbgVfkc+stE6Kf/63CYrYgZDKfDHsV/4zx5+FQMIozQGehyyFxCHM+Qp?=
 =?us-ascii?Q?friUb2ehFG3/40EAQ3vxZ/B0Zqz6BN6hjXKp5ENnltS6+XOwy6jebKebIu8Z?=
 =?us-ascii?Q?tSSuAvLk1Py13UprgY4/M/Z60a1hSQCiLHd2/yt47qiYhzJ1ZQhaPA9q9uDZ?=
 =?us-ascii?Q?KafrDsIi8ELuwYxoBplbmY+iFHCWu2qRWx6YJ5knZO7RqQsaRcUpdveWvXGI?=
 =?us-ascii?Q?mITRZK88iEfujUEH27J5Dcvg7CGPA4bUjEv8EHYV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c82d00-868f-4d67-2d2c-08dbcad4c5d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 03:39:00.3818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofk7dSS+l2h/sZBUVefJSS/0aRb7JQ7tcYJDcrVnhaAwFBxcCrwVOy1Re6LnIFnQ1Wc68HTyB7hPgE976r7TVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 0/3] drm/xe: Cleanup for addressing vga decode
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Shankar, Uma <uma.shankar@intel.com>
> Sent: Friday, October 6, 2023 5:27 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: [v2 0/3] drm/xe: Cleanup for addressing vga decode
>=20
> This series implements exclusive version of vga decode for i915 and xe. I=
t reverts
> the FIXME with #ifdefs.
>=20
> Currently the xe verison is a place holder, will be addressed once the i9=
15 display
> changes are re-worked in upstream.
>=20
> v2: Addressed Arun's review comments

Pushed to drm-xe-next. Thanks for the reviews.

Regards,
Uma Shankar

> Uma Shankar (3):
>   Revert "FIXME: drm/i915/vga: disable vga set decode for xe"
>   drm/i915/display: Created exclusive version of vga decode setup
>   drm/xe: Create a dummy version for vga decode
>=20
>  drivers/gpu/drm/i915/display/intel_vga.c     | 22 +-------------------
>  drivers/gpu/drm/i915/soc/intel_gmch.c        | 14 +++++++++++++
>  drivers/gpu/drm/i915/soc/intel_gmch.h        |  2 ++
>  drivers/gpu/drm/xe/Makefile                  |  1 +
>  drivers/gpu/drm/xe/display/xe_display_misc.c | 14 +++++++++++++
>  5 files changed, 32 insertions(+), 21 deletions(-)  create mode 100644
> drivers/gpu/drm/xe/display/xe_display_misc.c
>=20
> --
> 2.42.0

