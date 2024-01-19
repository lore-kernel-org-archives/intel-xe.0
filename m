Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B22C47DB7
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 09:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7862C10E1C6;
	Fri, 19 Jan 2024 09:28:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF9910E1C6
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 09:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705656534; x=1737192534;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ECr3FRFcFh3xV6LWS3ODbo7D1oCJnS5zjBsWA822JAA=;
 b=aIvnCgTFNjcrn0dL/dwQJ9nHQQj7sbliaOU5bw9/BA7/4sUI+zhTq2Ed
 MK4WsJq50wtNyKJmYQht4YkmLczNBexhGR4Ty1v6MjevxbsqHQAGI/PdM
 LxBfv2+dOdYfnmLGBYdaFtRTD7yie5FWRdGhvEptgoiomipS54ZVLs6Nc
 aO+413V1oxhGIG8/ZqBsiY1pImL2wPp++ClqirOyLWZ9IYgur3cclijLx
 OzUekr5XXG/IXHEMXd+dlfH2QhXghiCSNuUeGcKtRL51bGJPkc4JQT0fp
 LD8YvhVuvYDqx9sLMRr45RKE8OfOqfKOmY0jvEE/PY6jvsoRauUhhK6ks w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="467076997"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="467076997"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 01:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="819021824"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="819021824"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 01:28:43 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 01:28:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 01:28:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 01:28:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 01:28:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDOlYbmCBJfTz/TdakI43oBEsT7e2xDYZxsLnkD9fAj/KV4zR5UcW+8kj275yvBFaghgnymikFLTyevy4FrJ7hgBFMehDVqbxnWZhN42ZesZ9xvR38QLpq57ebVjRwpmkqM3DhqZrdy9zbpQDokAVW022NpTPsvW+sefdIJyYYLTzetkJuehQ1nOvNchzuNIfb3AAp1kFlMrXL1rNKuVusJMd5cpqniiTz2sx2x+iJs4aZtbvo47qUmo0L9NpATCZ1nZTzjl+OcYsaWocFkMOK+GB0G/CayC6wBIsasRTTMwqPa5CNjrD/ly7NU+VCVTC/3hTePn/0LF0tIKRdGevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HL0m+tHmaVRLtVC00ufr6cyYg5P5OnoxqMivM0ksgFw=;
 b=FdlZ3cU+6GKO1Is1cY6V5lcUXb9Dvq9ATITQgTjKDubcjtSTOqFNK9dv/8/Myzjn9AkuvufPzX/zR5ZaYlwwe7DHkEyjithv5DE6kdiadpS9lHFWULkHyXvn2CHq44HtigbzkZBcCKbsnypCEc0KqgUQvQ6ZICXdLfgkfEUxwp6JuR+JdsHRJ9t79zN4jBArQ0g8PXuXsKK/eWT6LZezyqLSmDG40qsT0IL+7VNM9dIOJkbPZhvuP2QPEueCWCq5fuO1Qq6dXX+oOneiGEC1elt8JsV4ft6eK5yhjGIWkOeBTBENZrTQ7cvj3y39+m6KT78bQrzz5vKkT9ZWiVT4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 09:28:40 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 09:28:40 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
Thread-Topic: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
Thread-Index: AQHaSq5/sHAJbBHwP0+sQUDZVH3d1LDg3fuA
Date: Fri, 19 Jan 2024 09:28:40 +0000
Message-ID: <CY5PR11MB621172B0F827E4FD706646DB95702@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
In-Reply-To: <20240119081852.1858212-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB7182:EE_
x-ms-office365-filtering-correlation-id: 54cfc7e7-2187-445c-eafa-08dc18d105ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Piv1y8n7F6uWGgr/CH2WpzSpImIg3EGDWP+9dF/StKQC00FdBNRVRtC7rQNq9qDOplAtW8FzWZKGNqUb51z4Qrngc7HwVZw0Lwn+xBG7o4FU5F//LJH7QT6YL64EFLyB5SWIQA3hyS4CjFyqyRBLuDu4Kd0TPkZ8Vyql1mW4oTI3XY9ROXIJFzS5tlHpP5I6nJm8YNquk6kM9co5fTl0Pp7ddMyMwD4xFjxXxyxKYmSufQ7VC2r9XdiPGc37Xa0p0gtb6OzbYQig293gp3jbTt+bvlKdDwx34OldnB+FylBHSBq6jqlFGALT35kV7e0hHQLIWkImhNvHi/xJJ5EII7XHbmSaqfGzLPRe8cnL3IhCiH2nIhSpVEFXHc+5g9XlDNJWJlIeq0abRzRx9Gq/8Gtu0OW9ZqpUrGWo8BrhtVcfTdnRRNyq03zRLH/oAGcrdFF0jzKY8T8bPjnhUf1c1sMemjpOLigUeJbJDndF/EwCdk6DCgblrovvvFmCnkptGw98TXeDzHiW0Xr/LXYD6mqLHU9r4qII2IJRtUrGDXVzTXBRhOzCuH4qF3njQ9WmMh+4EwIr0cfl4Zxg2az//IohGEKRKoFElTBR2EDPQNkwI6VQEvwLx9CtbHwC7oES
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(366004)(39860400002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6506007)(82960400001)(41300700001)(66556008)(8936002)(8676002)(76116006)(316002)(66946007)(66476007)(64756008)(66446008)(110136005)(54906003)(52536014)(478600001)(4326008)(83380400001)(71200400001)(53546011)(9686003)(26005)(107886003)(5660300002)(38100700002)(2906002)(38070700009)(122000001)(7696005)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?acp7jmxfTsLAEr9yjVX+4kSK+VrRWczaSE5MR8Rscg6ZP+jhV29e5csZlLe+?=
 =?us-ascii?Q?Y44Zfw3kE73UemLS6dXsVISb4y3EiOxziqdXm+uoazV7uaYMjtSe27cDJQSQ?=
 =?us-ascii?Q?jrvqUflxivVErvZcsQbWuiuU/MJDI4efK+LsUH8IWVEaUrNZaYF1Rrtoh3bL?=
 =?us-ascii?Q?Fz0ZZ11RrJR5PtdRfeEEsiVZKvyPuIYdpc/ikLaNInkTrCwtAcTEOf9gyPk/?=
 =?us-ascii?Q?G7fE2FSKtDHfB4iJk/HJ2d6n2PWDNY9FLTQ8BaCYutMHX7QSDP3yDNIQgBZy?=
 =?us-ascii?Q?wLWxOT8HZV2LGLszxivH57TIMuDWd75nqxweCnpfF2gYl+loE/NV86NjpH3P?=
 =?us-ascii?Q?VWZkADVL/xPxJb1Yesz6DlNWVkKJXOntfXCnwXpP7Cdqeozn26bH5oAcSi6p?=
 =?us-ascii?Q?7ddNZ5B4x3Z3lEFC5RJLMngr2/RxeO8VO6z5rIJd/ARhorbLccK7TljytHgk?=
 =?us-ascii?Q?+LlXLHOi4cCtrP06rWaS2KMdX+kWog0xyPTZPKrkHBEO+MkZnXlYwWcUeuHy?=
 =?us-ascii?Q?Fav0340CJh6BFMUeRiU2jLmAaS+ANL36HAQX0dX5Ax8DoDNty7WjqFbj4bZH?=
 =?us-ascii?Q?KFI6xkgMaAe3VqI0iqc0L4fLakXbseVScnxk2Rvojh7E2HFT1F9erp3A2Oe5?=
 =?us-ascii?Q?TKFgWyJ9yQXSHklRvPd81eU0yvwM5ggO2uhp7TOZwteHBBwZACpleHb9yXcw?=
 =?us-ascii?Q?i+5SeFtDF+2gnG5/zhqaSSdNTC78qzH9ZSWLXxuRfqMTiWY2kv1AIJC9ETYh?=
 =?us-ascii?Q?nXSGhvlMsLMYCW3EetRBwwuRc0eovjRHTPxHip8Tm0UuWSOdNR8nmOP/5G3p?=
 =?us-ascii?Q?cmxIyOdamBthNNlUMyvVoFKf0NQPldEjuV6YqOqnZ0gY0FCgA6fq5E+S0SSj?=
 =?us-ascii?Q?1PBFwjbZZm4RD4IYNNHh/M96DchYnoYjlllXAr9JTd6ULJVIvVe0iF+G+1pa?=
 =?us-ascii?Q?gvTgVQxxkKajT80TA1SxtjfuGqOMrEVUL9yhylGIbO/EDoMrWWYj/zMxyhde?=
 =?us-ascii?Q?ZrgIVqML4EqSbC5udgTbrQi/Jkq4ldDkH4Myqua/v1k3Cp2tFQyvsFjvBjE4?=
 =?us-ascii?Q?TvzU4vrKSh1L736lbcUM2SzKBncl4vZipjizogeKprTnF0uzBxfsis8/dmc0?=
 =?us-ascii?Q?19jXUfDc3wcEmGe9yDDbWl6O0QyagcSbw/xYXKhVuztIxImjI3l4PHxLQ+R9?=
 =?us-ascii?Q?S9Gt3geJ3EBXbEu6V9hpe8IswZOKsweQNYQ0etyGkT8yrGvnAO+dg8FTOG/n?=
 =?us-ascii?Q?ZlKhfiRs7GmEc88ebRgLgW6sJWcsi6Qzjid6zSJyj3ddMMIakRmnHgbEd2b4?=
 =?us-ascii?Q?blCtcOk0bV+oOXTd89rTYvRG3lMFzvkDnfxUrQg8D9NsZEy0k1ammS9GgoQc?=
 =?us-ascii?Q?a+ezU7abOkgIM3GQ8J1OYhtPivrYqGilURMmsIyQsUUqTfQCJrAcDftySSjN?=
 =?us-ascii?Q?a3/arnTHveC+EFGOpEdAKN3JZJNCA2LG5EfA9em3UpBojCEZ1WE0+o0YyAAl?=
 =?us-ascii?Q?7GakSHxHwgWJZ4Cr2DuutZvqH5DqV0ICwvYbalhBtc6GAIgdsMDCWuzZCVKw?=
 =?us-ascii?Q?UAvafUPCE08bXzCYH5rwPEAdVQAWEUWaTPmFO43a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cfc7e7-2187-445c-eafa-08dc18d105ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 09:28:40.6131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MfOT/6Tm8uC8lwGFy2vWKjElUeQAFkAtnR+uppaC9wP6l8DKZC7bAEZq8zSTRiGyazDxylPLlb7vI1r8/A1PwDYmu5mnLfCoCu/Z8DPUZJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
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
> Sent: Friday, January 19, 2024 1:49 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> Dixit, Ashutosh <ashutosh.dixit@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>
> Subject: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
> support
>=20
> Expose debugfs entry to check if platform support GuC PC (SLPC) feature.
>=20
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c index c56fd7d59f05..2f474bf0e7c7
> 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -30,6 +30,13 @@ static struct xe_device *node_to_xe(struct
> drm_info_node *node)
>  	return to_xe_device(node->minor->dev);  }
>=20
> +static int is_gucpc_supported(struct seq_file *m, void *data) {
> +	struct xe_device *xe =3D node_to_xe(m->private);
> +
> +	return (int)!xe->info.skip_guc_pc;
> +}
> +
>  static int info(struct seq_file *m, void *data)  {
>  	struct xe_device *xe =3D node_to_xe(m->private); @@ -67,6 +74,7 @@
> static int info(struct seq_file *m, void *data)
>=20
>  static const struct drm_info_list debugfs_list[] =3D {
>  	{"info", info, 0},
> +	{"is_gucpc_supported", is_gucpc_supported, 0},
Above debugfs is per device.
We need this debugfs for each gt.
Thanks,
Anshuman.
>  };
>=20
>  static int forcewake_open(struct inode *inode, struct file *file)
> --
> 2.25.1

