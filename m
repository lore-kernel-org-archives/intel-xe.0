Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C961C46CD4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 10:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4EC89317;
	Wed, 27 Dec 2023 10:37:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F77689317
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703673429; x=1735209429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KQKJGAETDvgd1DSN87KfLe/Y4lyDawqrZkNTe8uGX3Y=;
 b=FBjVi7IYEhYn95yJF/82+KDXGl/3mUuB8vN7ngOp8zi9wA8TtdW25YO+
 ZLpFbblAXabXot3cZg0lbkG0PJ7gTMwVpBMKN+wjNwZI0/kK8GeGAh7Ok
 y51o2kJJsxnSL1Ym1Qv0h4Q6Ma/m/6wF+6njgDss/EFMgAhptbYubvH6Y
 xPNip5dJ49U8gTZA+XMzV9ay6aN/ZacQfrlF7sJtkqrNQIMADIlb7Cf7j
 SocifOcIqm15mamojdE1svNphb7sIsds7jwRNyVXVBSBxtVql6G22jITU
 VRBAaLTkG109FkHPMDj+NMGaq/Fkp48CgXxhFS1MEjqSD/33hLx6m+UON w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="427604223"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="427604223"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 02:37:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="1025363797"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="1025363797"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 02:37:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 02:37:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 02:37:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 02:37:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 02:37:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXrlt9GbKFAPwPsIsslFkdeF86RYqF7aaukIeo3e8e8w6dbfG5iW8bIVEEc4NuQK2O5ccwr+/aYWRTGvI+Lf+/sZl1QxqTxDBmTk0vOFNAPmwixsS6jNAEaCu1xHhQ0E1cP+cI0keLXOZSZ9xAsM+fv+ZjtvSo+4SuN9A5NIIQrX6ABVIZ+DdZUniUYQ5O19VHAntL7i2IYVx/5ZJRTSdl4H7pd0sRXtIgGXL7FQiPZXv9zUwgwzKID0staTZWLw9Y/n/p/5vOcrxjwvR0dD0vetzYjSiqffhRjxD+IE1sVrKCIuQ+I9IGOu1B5NpLqCf7hzi/qY3PFlUhDQdKtPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQQts9XRZNuGu6C+tc0BhUOP/RVUv30qojPh24sIWwc=;
 b=VVKe8HggghRA8cWaHBnEPjSQ6MQk7XNO1zdpDo3RbKEh/NvS8jI58js/+mt94U/HOYzCoHMtdHYG2IqNLlTBMOsG6w/7dCDyK5ovebupIiYqgUl1eH0a9UHoWST7iKruhOJ+jdGaiHOeimlEnqalmOWVlZJnDLycX4FNUDj7U9qIt2WKBo+hHizLQSGqvs/g7RBcp5tvvXhSeYnJLiBx9hhQhyvTwSqy45+pi+kyckkI2FNDtpcvgHDY0g0+3sBahKtF75DqyvbQxSJZ0Zv3Lq7vhWWPPkFxHrA7yIdanlFAqOS/n1d1+CrGvqfz4VA0LYLhc3x6/R8p6LY3WplIkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Wed, 27 Dec
 2023 10:36:57 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 10:36:57 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Thread-Topic: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Thread-Index: AQHaOJ4Zpo6RbjglA0S9ihMdGxYDLbC83sTg
Date: Wed, 27 Dec 2023 10:36:57 +0000
Message-ID: <CY5PR11MB6211A31CBBD708FFEDBDCF06959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231227083204.3982491-1-karthik.poosa@intel.com>
In-Reply-To: <20231227083204.3982491-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|BL1PR11MB5255:EE_
x-ms-office365-filtering-correlation-id: 10c98c35-d8df-449d-cb42-08dc06c7c032
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZUDtKf9VB/y8w9NEDanir5ErOarS616NndPBc2eb4juTxa/vgWWhW5iEAphZNR2TBgabf3AECuNcjn+57iQ7X+tUroFuD0RPBwMi8kxxK+HdCpXgBfkA6qfyHh3nyBxLdh/QmVrqs5mqGXfXCpZpCD5XhZdPZG83LdJfePIKAcCDmlNlOxjUni31/JF4S3b54SSUGR6WPDS23QAitYwLiMawmAEiAiYEQhThHbYie3Sd5ygSTp8c1uN39AzywYSZWFmoGvqCW/Phv2xdsWbA3GladA18zLfunG4XP7aRtC4JLjjzml60Ez1js/kQhxfwkx/jJPltopbiIud9e+sZONvsh5xPnx/qr6CM8BRe4bJqnuO+ZxeOG9mfpfPC3SnmJZYs7plxPrA4uhJBEOMa2d/itAQ1qJNDB/VfK3m8qH7OAT/wm6vvtMVCDBSg+negRYBubNxrqt5pAzv9q1t6BTgk/6WP5ECV5iuMnv+4k12I9JUtEPbox+mkejQCxYyLK205Ll4CDoCraLya7pU9xCA5ve4SlRYQAXRswgfpdK9w1UlgtEByODKPUFdTAP4z3D2at6VJvvqOFppVRQfNesnql/ajPGLm82q7RqG8AJZ7LJGUqxy3Rtzeu1aXgOWQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(64756008)(66556008)(66446008)(66476007)(76116006)(5660300002)(66946007)(55016003)(52536014)(4326008)(8676002)(8936002)(316002)(54906003)(110136005)(41300700001)(9686003)(53546011)(478600001)(7696005)(33656002)(71200400001)(6506007)(86362001)(26005)(107886003)(38070700009)(83380400001)(122000001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HX9E4t/CGZKAqB8kB30vSfnbmPO6j+SDVRDlwWEt3KBjk30xdgfctePsLyFx?=
 =?us-ascii?Q?/Mtd8z5+o8s2qLyeDy28H+pgMARtkIps3SxNU5LttumTl2mCafBwNScmL5Ne?=
 =?us-ascii?Q?fxqJiB4Cey+qTUVb3iLYbLFRcRXxegF1T4Fq9/5bXV7bb3OKic0O0xSW0LBc?=
 =?us-ascii?Q?hgCSojVr0h6mwqNuSjDq1/8lMenN6T3xujFxrGl2RHLIX1RG9Exj1kiQJ7S5?=
 =?us-ascii?Q?iJZ9YoLCwywHKzwFa3nbzak7lShQo+zBiPfwAOW54yL551RAHtMnIS4OOKjc?=
 =?us-ascii?Q?4w1X2WGtVDQKdKa5+sckZKgxdEDTkUO0d/F4sUvK0lcXommswWu68NjTnzvA?=
 =?us-ascii?Q?PBBtrW7idoZpfGKN21eJ2VEMej1yX1OIsM3BBMD3bY/B97eMRPMVIBLBkB3I?=
 =?us-ascii?Q?wUtZZdKoNdfGdhuVzPeFWXq76h5UxqNh0uvHAK/Irj0U/8aR6aLuvodljD7G?=
 =?us-ascii?Q?t+K7hSFDjGAvJ50vdmYKbFm7gToeBhHbsihPw5Dg3SM0T7FfQYSfuhyEg+Gj?=
 =?us-ascii?Q?ISEWi6sVojEttFghxz1sjSR48obTtaBnSlQCXYACI2FFisYCR3P43jppVDoS?=
 =?us-ascii?Q?kugxrHMqyfC1FPFWXKCI6DDIeFqvtMG8CuOB10OrQkuGMeSsDrpgCqTLsS/d?=
 =?us-ascii?Q?JRYWUx4fhUmIyXltmytWZ1mw1wXAX+pU70S0ul+RRllNQUSIDK588pXWGDd5?=
 =?us-ascii?Q?iDG8pGF+vozayKfsgM2/NNV+QE72Lg+nSI3JoRbNfFnYCvAj/2FKlHXzsrh3?=
 =?us-ascii?Q?AXqchZHZzaslWBcV5FbtqKEEtizl88RQKhL6UnmMbhxM15wbPTbtn0bRBs5x?=
 =?us-ascii?Q?o8B9dJc/uWMQAn8S6t5i5Cn6tp06la06PsnUs8fJnvrxNBHV5kTgNO2s54sE?=
 =?us-ascii?Q?7ycBeB/aWHLOFuwjhduPEoVHmb7TvTvmIQywTDiI/dWqo0XCGL5SGU2YKlDb?=
 =?us-ascii?Q?F68XDCs9gP3hYw4fJ9bNXf0+EAGtCKwkiV/GJMUDrS98VvTcH9WBrzP8avZ/?=
 =?us-ascii?Q?uO9ev7UYVer7bT5eDi0uPgguuOgLyOIgnCEWqfcfyQIQ2YWaJ2oL1YICB7bV?=
 =?us-ascii?Q?fJGhgbugXeR5NvbIcXA+nOVmoT+PijrTKLaMa3WoTFPlR4Wq8viM2zememp7?=
 =?us-ascii?Q?lmfNCndm3R1DUQJGtm9SWXph3AwL//UgPIWiFqc8TKbDAcGs9esjMpNok3nD?=
 =?us-ascii?Q?q/65wYCQVFwZF3oGMwkCzphqabDEngMm7Zl+eRC8p9zOCGwIKEgrShWCEmkm?=
 =?us-ascii?Q?vvAYlTmnpef+uBf6kKzBM6jUadsXwg2zpKLNNBEmmBd7Qf4YuonJY3OTUaWc?=
 =?us-ascii?Q?KgUeRVp85TAxt7WxzVAZJ7Vu2/Isqhs0fG2Uk8ospgrhzQ7q7NIt3I600I+C?=
 =?us-ascii?Q?U3ahD1URYp4ABTnLLMfCZK6/32g+RMBbxj66Fo4qfIo9ZFXRQsm0M59NaAb+?=
 =?us-ascii?Q?5gpZH77xKmyCY2xx3zX8QmCCBQW5I7L5unhuqEI9JswPRquSfOPU08xvJ623?=
 =?us-ascii?Q?1vYcxYmo1GTFjUchKwLQF9DIjIBE/KOmYbSnOs9IC9lh+ZVQTd4D9EoJ+YKI?=
 =?us-ascii?Q?RMZ6A6VwuG7zRSEGLilcP4mPvnsCKua5HXqN7oht?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c98c35-d8df-449d-cb42-08dc06c7c032
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2023 10:36:57.2137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WPQr2EU1nO0gk2YS6+QJ8htLC88A6gbewxvB/vn6W9EJnTPIVM9ynvBhvjbMX+mWSKPzrAc3xvm4JUTO6pW3zoMA3BniXoNThFPg0WnlvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Wednesday, December 27, 2023 2:02 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa, Karthik
> <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
>=20
> Wait for gt reset to complete before returning from force_reset sysfs cal=
l.
> Without this igt test freq_reset_multiple fails sporadically in case xe_g=
uc_pc is
> not started.
>=20
> v2:
> - Changed wait for completion to interruptible (Anshuman).
> - Moved timeout to xe_gt.h (Anshuman).
> - Created a debugfs for updating timeout (Rodrigo).
>=20
> Testcase: igt@xe_guc_pc@freq_reset_multiple
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         |  2 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
>  3 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> 3af2adec1295..47abb9336c58 100644
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
> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(err);
>=20
> +	complete(&gt->reset_done);
>  	xe_gt_info(gt, "reset done\n");
>=20
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..fbda886c8a95 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -58,8 +58,16 @@ static int hw_engines(struct seq_file *m, void *data)
> static int force_reset(struct seq_file *m, void *data)  {
>  	struct xe_gt *gt =3D node_to_gt(m->private);
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	long ret;
>=20
>  	xe_gt_reset_async(gt);
> +	ret =3D wait_for_completion_interruptible_timeout(&gt->reset_done,
> +
This would defeat the purpose of xe_gt_reset_async(), as this will make for=
ce_reset=20
synchronous , I think we need wait_for_completion_interruptible_timeout in =
 xe_gt_freq sysfs
before reading the guc pc frequency.
Something like below.
guc_pc_freq_ready()
{
	wait_for_completion_interruptible_timeout()
}

Thanks,
Anshuman Gupta.
						msecs_to_jiffies(gt-
> >reset_timeout_ms));
> +	if (ret <=3D 0) {
> +		drm_err(&xe->drm, "gt reset timed out/interrputed, ret
> %ld\n", ret);
> +		return -ETIMEDOUT;
> +	}
>=20
>  	return 0;
>  }
> @@ -225,6 +233,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		return;
>  	}
>=20
> +	/* set a default timeout */
> +	gt->reset_timeout_ms =3D 1000;
> +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
> +					&gt->reset_timeout_ms);
>  	/*
>  	 * Allocate local copy as we need to pass in the GT to the debugfs
>  	 * entry and drm_debugfs_create_files just references the
> drm_info_list diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> b/drivers/gpu/drm/xe/xe_gt_types.h
> index f74684660475..824cefde20d2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -358,6 +358,12 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @reset_done : completion for GT reset */
> +	struct completion reset_done;
> +
> +	/** @gt_reset_timeout_ms : gt reset timeout in ms */
> +	u32 reset_timeout_ms;
>  };
>=20
>  #endif
> --
> 2.25.1

