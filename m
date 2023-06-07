Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D197C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FEE10E4B3;
	Wed,  7 Jun 2023 11:52:50 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2BF10E4B3
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 11:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686138769; x=1717674769;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yaqqK0Lggr2cxWm8IaYwPKOXaBMt+CEJCPkVIhUHiyY=;
 b=cxlnwIdLvwy+bGRqKnR2IOyA4/XOOGPI01pg110P468Eanw25pNlSrL6
 hiPVeXQKrJS3s8THJsPE3YuiOLRyub4haDb/W7uF9Tk2BxUOfJ+tKdV94
 wfJE+JvgjlOrB4VEAsghNJo1xiRoiGIg0smKXAoOHfzcUoD1gzgKbul+J
 Cji6HRbRHzxAqMCUvZrpinOHRcub2LH0jGolBeEb1S0CPAkRSlZ7RPQEb
 OiCA3uExwY/VrlqpHKHxM5odvPgm0o9MdBGSX35duh/mzliK/lYTWp9AS
 RIeGOB0QR7CjsU3NTQ3OgSY3qk1QL43wAieGz4bNiJjXvUS4kTS1Ppc1l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341615927"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="341615927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="742659653"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="742659653"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 07 Jun 2023 04:52:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 04:52:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 04:52:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 04:52:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6nB3Xryff6h95fbV6ZgN5QaHu0sZ9xw+WXk3H7xws7KQ5uRtbMz9wC+JTGPq+bZ1nrvXIVrDuBlUPebwI4IofGVZkUpPoHcbrF/lpvCu92WftncPU06jep0fZWnNb2oHgmBBJ6XgCAlJS2Y4gici5JzetgRH5Cuv+fuYRKbH3BPmVYSH2m5m1buQCkZckQVxZuEaBkmbPDPyn/jHEZELculD2dR1VMcTYPCJgWjp3ylOp4qnc1lRWDW1+A4rPsfIfOBJ1drrgfxZHeRtJ6vg/p9qPwehJcjaJmLmjaJX5hN9w3HdExLN9woR0lbcVZTkV2VboyVMiBHW+SIqp1IsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HT5cUwK+sq34wRoQy12ybYc4ar4MSNiuoiFcQgyDN0=;
 b=IJdNe4IuqLQ/mem0kBOPNaXksk2T41YMWjX67frLGvuF7iCdegGGOQquHxLCm0esZRTKzBWsmJ6JZ+8DX7HvOluvlNs26unc3f/+r4/SGwYBH9AjvLsYAvFPFHQfcbHImyrGXU27LnS9D9LU4KE/EuisAcSm/4p3Ft+IlzDNtEjOjER/pb8g3j/Nv4GbXtsfazwwhHTQBtlXHkv1CDuy83hQqBnH5B5VXxQsnDPwPpNmpv5lUBObFn3DkTZgy7oa1iDuPwj84aJSEkNP7XjoRZg0y4EzOcEN5bJxNs+SnAGp6vybBVWLjys4IDzoVM5Peof3xS8zF4CbyAl9tER0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 11:52:18 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 11:52:17 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] drm/xe: Donot apply forcewake while reading actual
 frequency
Thread-Index: AQHZmRbDcLvSjg8Ni0SqAuTTLAmv0q9/Onpw
Date: Wed, 7 Jun 2023 11:52:17 +0000
Message-ID: <CY5PR11MB6211AE6C4C705A4BE95415119553A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230607081004.887428-1-badal.nilawar@intel.com>
In-Reply-To: <20230607081004.887428-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB5390:EE_
x-ms-office365-filtering-correlation-id: 1b24596f-6bab-4f16-3ef6-08db674da4b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +L8F7nq/k06YX+yF0xeiOkjQG1tUB/9nj4A8gsW/nmWCllk4voBmVZLKkOA7g0LW0yFQOJ0CWEl0jX+FtUykhW4XlN0/6zJavoYgg28HSx5oMHTU+81JJROr6Nuv7romx/SvCmdjJh2S9mtSOMiVOplRoVotSSflCGJaznzS/YEcex9ZU1raZklGBX4bmV84LhcCAZeNUGnKAh8FqifdLEYENdh33lLu8BcCnbdWHYurBeRL6TusMQuHez+cayftNE6lSCptWT+Y3yjxnyuEkUjLl6omjBMpj081I4MCxexJFgkhqP8kaQk1EVuZAFePMj6DdJzrgH5N2UWLyS+YKU4rVsTkCBVM1iPFVDqXP4RQwr/5AOpItRHLPXsEStipX4Y0KgxHKDpzGQuqdGWRjoqpdCS9c1Dnp2x3/6kI5P9ny0BNjljU2rigpsLSPngRkp3oQ3RlUxtGNdpX1kKBHJBAyKRGYtT0jROAmqJOr3kcQZwF8Egs9ns7LDigc4rIKJ+plIA6BJWvPkbmZWr0KGulOmVA6Sr4mJrgOGv9ek5XyKHkXcjjnU1C6BvrGpFr+EgZn2HBe4XSFPoWszhH6uMXoziZaOC4/UkLGwrMcfc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(83380400001)(2906002)(33656002)(86362001)(38070700005)(38100700002)(122000001)(82960400001)(55016003)(7696005)(71200400001)(316002)(5660300002)(41300700001)(52536014)(107886003)(8676002)(8936002)(4326008)(110136005)(478600001)(66946007)(66556008)(76116006)(66476007)(66446008)(64756008)(6506007)(53546011)(9686003)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lUke1if6bkR06mfsKFissfW2BRnRXKT1ITmIc/97SavQPpDZXubt5/cDtx7S?=
 =?us-ascii?Q?RSwAvyWq6XuhxD/2GmIBfqMlfNe4HcxaLrBr7+NA0RXDJkh50F+6QnoW/JHf?=
 =?us-ascii?Q?lYIeapyS9IorAWxJlZUZzrnY94PIoZ5dpG26TRO7+udpXvA2KBYLAtSJI6cJ?=
 =?us-ascii?Q?N753SfOKctV3vUJLp8f2SQFaELHTDlezMfZ3XIQYdS/ehrd4gl5Tb2ILKBAo?=
 =?us-ascii?Q?gYXks+QAtqECfIs2RbXtfRBTc8FDmfEY3iDS0f4rYV4WFE5F6noJK/Y8HfcW?=
 =?us-ascii?Q?Yw9tSKrpRpguWIKWHE5clA3NiU9RvK/jZ8QXN4N6EJEHvqvKuZifGlOfHvty?=
 =?us-ascii?Q?1SNqgXn+RzRzOoPOgTZMQsAT6DDJDbPo9QC5yUmJYAXH4f7BEzDIG4+QiUXa?=
 =?us-ascii?Q?xNw8o80lH4fMWoTUDJqMAJkqxjDK/EnBoT9kL/fAdBLjjpSpgX7qnpL17sVv?=
 =?us-ascii?Q?bR717OzDp+7esh+UCxl8IdxUreH+nbhC8VGJim4jl6IOEP9Fu7bbHeDYnfkU?=
 =?us-ascii?Q?+36iziVhSV/K0oAI4U8S9IyJu3tqXssZtpt7f7OHJUbCZcAwoPkQGQ61qU+L?=
 =?us-ascii?Q?ebBFYewpuCxw9yv51iF/58YAVeyePWnVzJ3GkXhrABzJtKeT1im94RzYs+Pv?=
 =?us-ascii?Q?QE9wlpL9T+lmF6ldGR0MYUBrM9dea3uFn5XVlhtU0qIvPavs9BCEyiQGGzf1?=
 =?us-ascii?Q?OM+Dz+N/gKvw5tC8H0vz9+fnS9cxcrg50LAYx+FsznUPPFwNq7KsqxKqawTI?=
 =?us-ascii?Q?Q7F8kNAbdehWxISHnscMkN9XApRG988gUXd0UwKWBzhp1N7XVFE20Ppx1b87?=
 =?us-ascii?Q?GiUbFiWvQk23V9xko0ujiAEz4K8UjkJgbh6KyBZ2mccB3y09ViToFtiOEhk0?=
 =?us-ascii?Q?kqqBtCXmGKQgqhS/TU/7h8sHH/EZ/rkV8lyf8oVMfIISzB+LcEgywMnEjQud?=
 =?us-ascii?Q?S6De+GwpMJCZAkGVF9G7WqJUIlp6aKp8Vb7bI3ih/36nJW7x3DohbyGsFD6U?=
 =?us-ascii?Q?4MiI1yT5DFfV90fHelI8SqbYA/0K/QKagQZ8Lc6rnpXkY4oDvC2a3gS+jG5B?=
 =?us-ascii?Q?cxpzpRxb3nFmkZrGxB8o/u5+q0AHSUIe0TbSHswmmHYBHb6k0T5BE8aJSHk6?=
 =?us-ascii?Q?Um6KW91a9RorXLr7oaPc3k9x/tFtRcSKay3gAQW5987kCHJjbOyeZ1CnxigC?=
 =?us-ascii?Q?bPYugOCpWT8eH7+mKYDWgLaRWuTOfhQOk/jxcnXL8iyZDcIyo9RJrqTBfaPz?=
 =?us-ascii?Q?Rjx5HhTzZ81LYsF4XXtPEcobWa+TnE0AiaDVQTxr+8BGn5eeaX8P9PeZPmzb?=
 =?us-ascii?Q?tTsnNaqOdEwxcOYjxu62EQiVVmzSASNJkC4+rkfZejzJZ34YM0aVkntrrEDG?=
 =?us-ascii?Q?zx09hdwA9d0GEpaIy6irp+E57FW1yB4Qeyi+fjU3kfhzP0dZhFIwbzbuGLlY?=
 =?us-ascii?Q?UBvUsI/jFsY55jIxf2NRwf11slMG6z9/4UyUx8iU06A305AosfqQ3vXrEzNP?=
 =?us-ascii?Q?D2df9KXXZAM5NEHpJGIQb7HbfV1k86THkKKPUoM8AmSVoWdin4154O/JblO0?=
 =?us-ascii?Q?ezRvhEiFoUsGfweX+W5JVcauQLACF1k0JDV0qnCd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b24596f-6bab-4f16-3ef6-08db674da4b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 11:52:17.6249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eysMNfGRaRZN3vTaJ4m09ugr43qcxmpPVZEMNS6fgeIAbxi/KX+Y/Y67HP4inYcqQ/GGphb+TvRY4ChARdBF91oDlwQx9VDRkQQrm/Go3QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Donot apply forcewake while reading
 actual frequency
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Wednesday, June 7, 2023 1:40 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>
> Subject: [PATCH] drm/xe: Donot apply forcewake while reading actual
> frequency
>=20
> The registers RPSTAT1, MTL_MIRROR_TARGET_WP1 doesn't fall under any of
> the forcewake domain so doesn't require forcewake to be read.
> When GT in RC6 frequency reported will be 0.
Please mention Bspec index.
>=20
> Fixes: 7dbca224f176 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Checkpatch has warned on avoce commit hash.
Br,
Anshuman.
>=20
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> b/drivers/gpu/drm/xe/xe_guc_pc.c index 67faa9ee0006..d04600b943e4
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -371,14 +371,8 @@ static ssize_t freq_act_show(struct device *dev,
>  	ssize_t ret;
>=20
>  	xe_device_mem_access_get(gt_to_xe(gt));
> -	/*
> -	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
> -	 * to verify that our freq requests are really happening.
> -	 */
> -	ret =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		goto out;
>=20
> +	/* When in RC6, actual frequency reported will be 0. */
>  	if (xe->info.platform =3D=3D XE_METEORLAKE) {
>  		freq =3D xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
>  		freq =3D REG_FIELD_GET(MTL_CAGF_MASK, freq); @@ -389,8
> +383,6 @@ static ssize_t freq_act_show(struct device *dev,
>=20
>  	ret =3D sysfs_emit(buf, "%d\n", decode_freq(freq));
>=20
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
> XE_FORCEWAKE_ALL));
> -out:
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
> --
> 2.25.1

