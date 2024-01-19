Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F1EC47DB7
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 13:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA3C10E9F4;
	Fri, 19 Jan 2024 13:50:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC4910E9F4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705672250; x=1737208250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ErKCaXr9Of1Fs9M5mVprt44bQuz0yN/5NPJ2s8dMrys=;
 b=M6JI+GA/gjWIJfKe2KEZdpg7D6dFqRVHq4CFccnWFdaIjrZMf5u5HD1I
 Km/eihXiwP7X2emd5seMq6FimfJqJ8H97vmglk591gppcKdl4qt3LNgH2
 gmO7OCFUpwbV4UK+OkQ987FGb61vUiYZ2nIxrACsW+DddTUdcEoVqtZOp
 rcDewVjgAX22jLvO3pHlsKzPqhWczv41yOGmESC6fWWd5NB+yseWLahCA
 xPTyC8HFxkWBIDXDa+fjMk9GWbj8ZzEMQ91gm7P55/YNxW95FGEUk86xP
 fu5kJh5qKdQgRykX3N9AQeXAdmNasEvjVD+mgMN6uui2AQpsGh1AfC717 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="431921110"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="431921110"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 05:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="661452"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 05:50:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 05:50:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 05:50:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 05:50:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6eWyy3BuWzTdxtOQ3C0Ubxl0V8Er7W1o+mfgBvaZHxSOy/oGo2Fh+UV4tM9F9jAj16CI+kU41QXbhydTBJe+0z+nOcX04aqN0E7xN5SqgmgvMmGJFwFS3VD8e53FR10EwsHkwzsVshaKAEFA4sh512TEslcB9scoSGBar8ZbidGRafMmpsgpCUmrh63IHbTtvuOhvUmZS6vffGtNNk3ni/B4ydgIau2XqjKRi/1AQQa+B1G71yxMLqK62r118a9yOpVbF3aK5f8BCLernpRknK5HlT3cVM+jQkCyLD1tn7SIM/XiWFh74VkHw9SnBzwOMjp7CbsNbaE5p5cjz3MLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTeYN5n0ifP3US7GWz3sT0FGkzQ9ae/sG5IGQBKcNhE=;
 b=dezXYTv8aim/3ZYi75V6Rh7ZzlQy8vikgu7j1AD7Xqgy1BDOdQ7yNiXZ6q1ESbhRpqAU42GkwLnuW+uTwEqX5NmdMuLdRj9jEJsapKg553pkKWEnsmkZgJuEf1EGkxXzImhpr71O+SqkiLVpn6rqqJuqy1tYlSF+SG5MLvMbC09Y49Du+ycFYqG4vbDy8qC1j7YokBdJr95UnF0pLU40XuSwc23TYDjFdBmeAYnofEKZu/SwIn+uNQP0FdXmK2MfAb3PlqUuydD/0btThyPkj5clbvIh0V4kucQZRj/UhruhOeuBsxvD5wI929pzeQwZNzYxV3D0J0hXbJjkYXpQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH0PR11MB5079.namprd11.prod.outlook.com (2603:10b6:510:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Fri, 19 Jan
 2024 13:50:41 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 13:50:40 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe_debugfs: Print skip_guc_pc in xe info
Thread-Topic: [PATCH] drm/xe/xe_debugfs: Print skip_guc_pc in xe info
Thread-Index: AQHaStc3JZCMaviqm0eCmviH2sVRjrDhJmeQ
Date: Fri, 19 Jan 2024 13:50:40 +0000
Message-ID: <CY5PR11MB621181F07F4190BCF6E17EB995702@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240119131025.1872947-1-badal.nilawar@intel.com>
In-Reply-To: <20240119131025.1872947-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH0PR11MB5079:EE_
x-ms-office365-filtering-correlation-id: 92c32ae9-d6e0-46e1-036a-08dc18f59fd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3/fx8COFPKhDbx7nRha7gCdiUh7i61qEoxLBf14fAdtao9QQxLe9ymZ5svMeRqVmJoIDmGXW9MOO/9dHo7apmfLXoLMOPRMVrQnYGWpicH9QGznkpVchemz34e1ws9MNRC/vGcCZ/eFxsVg8jLhVCoC8lLSFdfZ73FfiJunOFcUhMveGf9Lfo9LW7SIgqJBJw3PD+Z6SVA0ZIVNsG3qRvu32A/bKPX+zm//BeJiweqhaNEs5BIcwY+aUvAseYN80BkBFrMFhO1SJZp7zkuydw4nD3CmxnohFg04Ns4pyvNNOPnmgxQCXzoLV6PMP0tPD4acv+zUsB+JZ+OMptJEOfZKOnG2uHwlIh8e6JtMb4WWPo622A0EgpTO3nzG54TCkBjsKEJbZ780+x9+YLSMt4j1zfRyReaK4jpzaveeK29DVoiht5VSSW8iJIeC+rniB4XyOeYITk6sHVo+O8Ge+z0klARghRDn4gv2jSTYdk7Qk6Umf6hrsAjrMK55WsjDsv+RtGynp8Cf18qA1xUunp2MOGSME7w4TVRnuf5aDkmkii4B7HGIMp+RhBjVJGqwfhAtJUU2GuWfefICABQm9D9gJVK011jGNwc9VdmCsSShTL/R/TQcJ7lupVMkIQ/sv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(107886003)(7696005)(110136005)(54906003)(66946007)(76116006)(71200400001)(6506007)(9686003)(64756008)(478600001)(316002)(26005)(66556008)(66446008)(83380400001)(41300700001)(66476007)(53546011)(5660300002)(8676002)(8936002)(52536014)(4326008)(2906002)(33656002)(38070700009)(55016003)(38100700002)(82960400001)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1CI+mW2JfM92WyAAT/BZ7HsdPAwdgkdJcWNyIy1hp81QX2+VIWoKB7hE3DcR?=
 =?us-ascii?Q?f2GfBuRrgx68S4i7VJL2m+O6uBFctqSO1abDKl6gnRP5aJUcDp9UUlsOK89B?=
 =?us-ascii?Q?CNOYiYvFED2owrxLmznXZK/vnbLc9i1Gg3fx5D1pKRHy8HZVFuEyp991ymMd?=
 =?us-ascii?Q?DwLwM/3/m7BB0AF6fudKxOBNU9OKtsE+T5zmln2yPZgtxw6+6iiJ0aNovVan?=
 =?us-ascii?Q?mEnjjX2rObSbce+HSWliPbXyP20DZcgsqwWe9PxA/jxLGjkUyRlYSRCXkeWG?=
 =?us-ascii?Q?hH/+2VpHepwDsKoBNpSSxFg+Qi5Wb6RdNfems6ZF/mU8tOcpk4YJKFa6EuZP?=
 =?us-ascii?Q?m+oSUCQojXmtXlHHRhN4BZihnRTUsU5GAMw2Rd1rywNKvvEGrQ2O8cDJK7MW?=
 =?us-ascii?Q?CJ7lVhq2Svn+uj9YJCgWNjP8/Yec2aZHr6ulVkZJrVa2DwVxTFVoD8j9RRSN?=
 =?us-ascii?Q?EUZwk69ltv8AWSCSd9c88dL8x9SRqHjdPH+R41gdGYzpaydtGdPlKjdOq8Oa?=
 =?us-ascii?Q?jKsl6Pvhny0ygi917K9IS95Tq4m6dIsXQ9vb9yTYsGGUKeEXMFx1X8mJ6Ykz?=
 =?us-ascii?Q?UDMESVpLa+fgnozvZf5TOGwkrt9lOXvZS5pFCrA1VH4JUEaap7R8Tc0zn46O?=
 =?us-ascii?Q?JnmfedNq/GTv6Sv0ulu+3khxr4krq7bufpD40f7VpXGIK52k1AdPPFllIOOA?=
 =?us-ascii?Q?74jLJimD7voAR7XDHq/3f8tjKAbYbvMxPa2fmtqgJvRad0L8xan/scu4GZLb?=
 =?us-ascii?Q?8RFowlrylijEtoaSpP9J6RpPfVDMwCnKDu5jSQPzkca6sT7V5PAv1a+vy+Vw?=
 =?us-ascii?Q?A1Qa+p3Y7tji4+w0Vc5Q9AuzOVaInTn5kemVuzu9MoU9wO6p/QCIUvniA1Ol?=
 =?us-ascii?Q?nminvu1A49zp5wm6RMSuKJNY4QRJQVyXlQv+/y1oaydppna5hrMy5yZmqYqr?=
 =?us-ascii?Q?Gl9CZ6gPe3QAtg5MFaIT+mM82ghhdPmnsLB/3ffRiQ9I45i1pYfcqQaRmZqI?=
 =?us-ascii?Q?ajJU16ylgcuZMbPbnJbQHyRyGfbjLGFsOpkX8bbiYpXRLt0PsHYmajt1To8O?=
 =?us-ascii?Q?BC+C9SDaOmkMvIaiZLlzsK/il9xz3X8fyofx9jXf4sLJZDJdUC0uDv4Vkg7G?=
 =?us-ascii?Q?VN0pzBdBDu5BKmuSywbvcsPvT3ziTAgFULU5c89RAdpQMTzDYul+hhGOYztk?=
 =?us-ascii?Q?2FXshQiXVXz86a80ThAq9ktPhSHM+IB2L2wFdPmgygt1K7GwNpV3Z8C7pld0?=
 =?us-ascii?Q?2DJfLUisnwNRV7L484dULqO8u/gIgNAd2/Kb07Uv16EGgRCliyQIQk6u6D/G?=
 =?us-ascii?Q?oNKqwzPdgZLLXMfA2hHNAr1rFhtTaPn2NziP7Zm9oVgCcdR3NtnjcFXvUXur?=
 =?us-ascii?Q?zvDapGICEh7mUIjZJicXz+XbwQ1/R940RMRz8ZbD0EgWhl3IJ6gRPGM6+uUj?=
 =?us-ascii?Q?2/tTJx375D6yExCTgFgUVopD34f4UQ820ippf++JNVheS0L5xFX9iZaix2qB?=
 =?us-ascii?Q?flCDLLtILdIxZjQ00gstmBfYsfPwBOabyvdRAHrRdi2dX1P56pJyAOqFMhcF?=
 =?us-ascii?Q?eFo5qJh2WNQg+SkbDV9oKhQ2N6PVUuIbUD+/8bQl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c32ae9-d6e0-46e1-036a-08dc18f59fd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 13:50:40.7073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mx+GUPs+5wEPzdpeHVa94jd00d8zcP/e4zEJpObnSB9t/4ZzAlE2B95SyuJErfLxgKHgroPfdYTSzW0oqmFudSmwGVNNR9XYE5F7Gv0tC7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5079
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Friday, January 19, 2024 6:40 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> Dixit, Ashutosh <ashutosh.dixit@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>; Tauro, Riana <riana.tauro@intel.com>
> Subject: [PATCH] drm/xe/xe_debugfs: Print skip_guc_pc in xe info
>=20
> Print xe->info.skip_guc_pc in xe info
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c index c56fd7d59f05..01db5b27bec5
> 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -55,6 +55,7 @@ static int info(struct seq_file *m, void *data)
>  	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe-
> >info.force_execlist));
>  	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe-
> >info.has_flat_ccs));
>  	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
> +	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe-
> >info.skip_guc_pc));

>  	for_each_gt(gt, xe, id) {
>  		drm_printf(&p, "gt%d force wake %d\n", id,
>  			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
> --
> 2.25.1

