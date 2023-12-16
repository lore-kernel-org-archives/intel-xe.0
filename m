Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235A6C4167B
	for <intel-xe@archiver.kernel.org>; Sat, 16 Dec 2023 05:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB72810E05A;
	Sat, 16 Dec 2023 05:10:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AFE10E05A
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Dec 2023 05:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702703451; x=1734239451;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DTCAL5Walq/r3BFy5SN3hocOiy9/Ka5EelbhtlL4ii8=;
 b=LyWG0EJFM77VdHgdzylT5e68eH5maPEG5MJ1ZmtUZeDU/aV5UhFpv1fU
 XtqoFXavvuXUdOA8CioWIPRGOCxwDZnCT/UQqcoxC61N8UGJaCnhzowgA
 FLNQAka7CCZss66nJTg7DpiznIekIMycPDYLfVW25OX64qk7A1BbEi169
 oiEEnlqkIT6MrwGlevuWxRykycrdu0tCgAhTxsNFzbVRpQLQMapOJ3l9z
 1+3jX55nVrsJyB2TSJMu9UHy2X30/qfP2VGhuw3UyyFtmCbg3apZMYI+k
 1TXA608xNaltSsmG1PE/KzhZow1VUKlDyyiwoiKYIu+NTMrNbFvqBARI3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2535602"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2535602"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 21:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="778500447"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="778500447"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 21:10:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 21:10:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 21:10:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 21:10:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGh8JoOvnnKnueyTZW8PpCSYRgb9F0fEFmHHboniSZLNNFsM08o2fpPj6pheVhoX8AXTqjTAgzzcVUNDgpU3bc9ligcDrvGEBd1KIxy3Nx92sr+9bERyhc2fSBu0CMJ+aMFH/pRS/pC8yaSMC84UDNgMyh4f8tsoxJPeJu2BqBRC4ypPw9rpmW5teMtE2WGx9lKgCerhSpaA5uWJY7P5bR8zSbZpJxvN5CsuWIcyrm6Dae24lGeCWXrGiU6Zuh9DrRaVoY76Mq/x19etOK+3nk7P+69s1AKcjPPJinXwmI70/z4NhjaABn1i3BeFsc6YKk2McvOOybw+FMK99WR1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdC3co2SpU56ktxQMLvFaGlTKW4q++OvCfq5PzgGBn8=;
 b=PTe4b+04HG7FxWPPRLR0/FDrDn96gInlDBMlBRxvyTQyZhVpmo05JT3sMIxAFuaNeRrW5JBxLIZWgC741or/t3vdSdYmVmRLFYNCk3dX8Vg2Ur1thrlRLDPifrk/mx0b0iBtjMqyVRheU0ZBxwGquyJEuPBrDwqzy10+HCtIpZaW0rVcL1mCLLmeHQ35xHoJ9tHqDYYHoYLwjvkmPB5tsviZ2dKy4Yujepg6QAs11JskmBFBtWCF2VGf1mjSWh1+kZcDtIbI2s5Hhi3ipDmlVA3GnLWw1NG06XS6gt/D5QlVkvAg3mzt/X56UABo4Hwylm7B6OhjuJE4FpSVUV8pFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.35; Sat, 16 Dec
 2023 05:10:48 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7091.032; Sat, 16 Dec 2023
 05:10:47 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Make sysfs gt force reset synchronous
Thread-Topic: [PATCH] drm/xe: Make sysfs gt force reset synchronous
Thread-Index: AQHaL9xaOawqn/1jLkaWYrBd1bbXdrCrW26A
Date: Sat, 16 Dec 2023 05:10:47 +0000
Message-ID: <CY5PR11MB62116CE92949678B0A0AE8BC9592A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231216050448.2636222-1-karthik.poosa@intel.com>
In-Reply-To: <20231216050448.2636222-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|LV2PR11MB5999:EE_
x-ms-office365-filtering-correlation-id: cbb7a7b1-46f8-4de6-40a3-08dbfdf55d34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YknOkweXMjpTTU1nJ5zUtcKTmOdCyGJpH+B6+5DVDmY8peDs5k+jp55ugoDcRWKJZed3uVoOhwjoMfggcILjd7/wOl26r/iGA3J6osXWQNcPLZK9H8vhzCdV9V+T/B8ZRdpQ5dmaDZYw8F2UoabywFmH+3IhhpxU6gHyP5Mejmx2DvEUzW3KH3KXVQThl54nYhFpVgO8uxr54BqUQrypnavDQ8TaX6q+xlBDP2Jdct4RZd3rbbf/TPuBk1wiylbI46xiPBUZg6msGqKaGRbQe0qLkgj1izlbwummw+T6YZL+UKZGuoQce7dc/Hz2z2nBEcSlFUvSmU2uMqVtP0nVe5jjacRwStT5ZibW30lz4nrK6sxe2XzqDVVvHYcfw2J1DWlR28oXl84Pz66DpySPra3ZlfrLCTY1N8MbJHN9ZlQawMCpNM3RoRDV6BlO8yhfl/3m/Ql66RFyh5YGkztTD5hZrNCVtyPav9EhLK8x2ardab0yDN2KqNu9UxdnYNQb1bFCwAIGWgNwMSIwUHA8c49CugHH0l22H4x1g2CAQ6GiWS8qGuVGwId3X/bxhqTqmMku6x5fe2qu5shKE1DluqqpmMx7jV2oMipASUccrlU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38070700009)(55016003)(26005)(2906002)(107886003)(9686003)(5660300002)(71200400001)(7696005)(6506007)(76116006)(110136005)(66556008)(66946007)(52536014)(4326008)(316002)(54906003)(64756008)(66446008)(66476007)(53546011)(83380400001)(41300700001)(122000001)(966005)(8676002)(8936002)(38100700002)(82960400001)(478600001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9P3g9JfGqFWSMcZrU0kYauiXdjJwdgY4c1S0tsJESn6Q6nQrBDFUk0y0u/1u?=
 =?us-ascii?Q?hqXPaTLdsKPqwxT18ovvrHO/8HSAWCdxChjNF50gAQno7HY8QATqVnqzKj3x?=
 =?us-ascii?Q?9gksNvJfzaXwsN1949Vk5G3sTZ61RECIDFEDaPp1UoeQA0mpX6iLXLtcWsQY?=
 =?us-ascii?Q?A/xZtUO7sN5Zt2Py2IAJUAjTGHf9w+HZy5ftPYarX6KJuPlMN3bthmiN/vRi?=
 =?us-ascii?Q?CdkP1ZGN1f8T+Dcg+FC7ALMH12/XLodiunjpstss5JiKiEmcgeFNlH2MN82l?=
 =?us-ascii?Q?ay/+KnBuHgu0LkKLWztOsYuKYMhMDMNeY7MaACnurdR3yHoqV0NNbrEFcZ59?=
 =?us-ascii?Q?zU9X2UW3f6MEVCMJQtF/Sk26utCKSBUyAEJ4TKoe1Q4dY7DWW9t5voQZRSoF?=
 =?us-ascii?Q?2JBRWWEG6ZUbYj1qeuIJAhTSHyGvcAJVgOkILhv3QYkJfmA+RA4MbIrK9UtC?=
 =?us-ascii?Q?3fAaaQEKsYO/x5mdFaJq4ZtfqKC77MJu1+TJfTIVFYBEGnbccv9PEAIWcFzv?=
 =?us-ascii?Q?UUqw4eLBc7/zJtRFKm9OZ1OGIMlXqD5TFqxbByJ3v1dQNfaX0oTwclxRnBBO?=
 =?us-ascii?Q?n5oPmuuxvCW/jMSmY1gisolbVDLYkrwVU+5KFxRTjvACasV3+RpqMI1JRJdH?=
 =?us-ascii?Q?mdji4Tg3jv5gblfKhCgT7ZABmHwvJ4P53o/HHd1iOWwBUj664TELzU4sTlae?=
 =?us-ascii?Q?u5HrjaqgBJBEV21v/Uh7YoA1lfmYzvNdCmgrl3f+0kQB0xrYHFo1NyoZOIxs?=
 =?us-ascii?Q?OlUcCPaOElifcANFMsZrhkgMQayWq2TPFhfP0wj4kRNfH73/TfUjaYTIk4cp?=
 =?us-ascii?Q?dKFLPt6IPAOzinz84g3sqr0LxARPOJo5wOyI9vz9SiWTEAT+P5RpGndepW+u?=
 =?us-ascii?Q?SUPW6PXLiu9t4VagGDRbjJ8LNawflom8d8OgtSmeN6i5uSEGFD9iRyaEpIR9?=
 =?us-ascii?Q?dq719fUkBMxVpsFrnLkC6lgFprlmje4ZA5mSJjeMwEc2GYWpIUtG+WIVJ2Lh?=
 =?us-ascii?Q?l8hd4ElnsggDJBzTG/9tSEvBk1k7Zpa4UZNRscU4xzqukltIf+VZUAa+6SNX?=
 =?us-ascii?Q?20kKE7lbRK6vnelOoOKhlRDJf17/6xNDN/wq7iopYoPT5aL2xI7ANrHm0T8n?=
 =?us-ascii?Q?/VeN40Z/joBhFmz4TIIiLHPhVs3wVuXH9bGXsfl4kL3/Txrey/oYHAkXzMZR?=
 =?us-ascii?Q?lNuXYUgE1AeI6UQ0jeqoVKhbH3N/FtG1UeA2XjekD8/I4cbNh51Num+iwIMT?=
 =?us-ascii?Q?j8xckXnz9ghDpU5T+w7fLKSjmryqG1aflfT2hEJb3/RHtO1esopnmAn/rVDP?=
 =?us-ascii?Q?EWtfwaEftxgbObHjqQIffTDyjQapKwkve5bSobGeba2NQ4fe6wpi6tDq4GeX?=
 =?us-ascii?Q?SL0MBxaoxPxbZaklzlnIRIwaKMVbrgAtv++J6xNWGVJmV6XEOY+F0fZ4PuMT?=
 =?us-ascii?Q?b/ci9C4EgO4ZNn984IXUrVwFjcp1CB9xYaZL0vcIcDYXCTFreGI3hpXU5X/Z?=
 =?us-ascii?Q?qK46LmRWInUq2ShQOWPNF30BjknhnQi/kFBTAREtEhTgVfomJW0iyG8mIj+H?=
 =?us-ascii?Q?cEGGcTTBVvH4sqLu0UcrZPa8r2t775d3O5J/5VOJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb7a7b1-46f8-4de6-40a3-08dbfdf55d34
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2023 05:10:47.5445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbk7e7WNEh+Sq3x3A/E/oQf5IrFYe4NJwimxMrOhm/QfBuTgSg6DM5ALmqUeX4kjBpCkgNmoUhzFBF/sfKd4BdrDAbQE/D+rPFgNMIKOrIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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



> -----Original Message-----
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Saturday, December 16, 2023 10:35 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Poos=
a,
> Karthik <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe: Make sysfs gt force reset synchronous
>=20
> Wait for gt reset to complete before returning from force_reset sysfs cal=
l. Without
> this igt test freq_reset_multiple fails sporadically in case xe_guc_pc is=
 not started.
>=20
> Testcase: igt@xe_guc_pc@freq_reset_multiple
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         |  3 +++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
>  3 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> dfd9cf01a5d5..eb7552b6dfa5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>=20
>  	gt->tile =3D tile;
>  	gt->ordered_wq =3D alloc_ordered_workqueue("gt-ordered-wq", 0);
> +	init_completion(&gt->reset_done);
>=20
>  	return gt;
>  }
> @@ -647,6 +648,8 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(err);
>=20
> +	complete(&gt->reset_done);
Don't use unnecessary whitespace, take a look at coding guidelines.
https://www.kernel.org/doc/html/v4.10/process/coding-style.html
> +
>  	xe_gt_info(gt, "reset done\n");
>=20
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..f4ff0eef0468 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -23,6 +23,8 @@
>  #include "xe_uc_debugfs.h"
>  #include "xe_wa.h"
>=20
> +#define XE_GT_RESET_TIMEOUT_MS	(msecs_to_jiffies(5 * 1000))
We should define this to somewhere else, not in to debugfs headers.
> +
>  static struct xe_gt *node_to_gt(struct drm_info_node *node)  {
>  	return node->info_ent->data;
> @@ -58,9 +60,17 @@ static int hw_engines(struct seq_file *m, void *data) =
 static
> int force_reset(struct seq_file *m, void *data)  {
>  	struct xe_gt *gt =3D node_to_gt(m->private);
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	unsigned long timeout;
>=20
>  	xe_gt_reset_async(gt);
>=20
> +	timeout =3D wait_for_completion_timeout(&gt->reset_done,
> XE_GT_RESET_TIMEOUT_MS);
Please use interruptible version of =3D wait_for_completion_timeout.
Thanks,
Anshuman.
> +	if (timeout =3D=3D 0) {
> +		drm_err(&xe->drm, "gt reset timed out");
> +		return -ETIMEDOUT;
> +	}
> +
>  	return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> b/drivers/gpu/drm/xe/xe_gt_types.h
> index f74684660475..6f2fb9e3cfea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -358,6 +358,9 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @reset_done : Completion of GT reset */
> +	struct completion reset_done;
>  };
>=20
>  #endif
> --
> 2.25.1

