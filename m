Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BA9C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9057910E92B;
	Thu,  1 Aug 2024 20:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyenvW2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0527010E8E2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722545038; x=1754081038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HmC2x9g5l92HvALCmTQ7uH/FMsqzBwGveJtAJ4h+xFY=;
 b=ZyenvW2DYXahOcrenNnXFVasZz+DD0ZIjyNuS7oejlI3bSsplyGQOjrP
 Il+u/4G4m2ICaerAv7g6JfdXxA12SMQwfqkxlcslI+zwn1jdC5zz6RewP
 kIFK0M/rFgmnluYt1cdn54RWO1MjQhqPcSapSq5MD2K4s34hlCwbJqvpw
 pjptnNgIFewH+NQgdS0S8tm5ikMl0ZAz2/4bZl46SazvbNrBec1QXE0W3
 MffkZroJjs/8flOs8Jztz1/+aWs2ebcr7bmSHgiDtW6o9kmzU2pXfHHMA
 zKytLqU9zal1p1QNBrvhv5ygQINrZZyOuzdByMu5pa5/onk+AMK3bYnSq Q==;
X-CSE-ConnectionGUID: /zuisGtLStmCol/gJbNMVw==
X-CSE-MsgGUID: yE0Q/RtKTsu29lksDKyZ5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20690742"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20690742"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:43:57 -0700
X-CSE-ConnectionGUID: K5XrlRZHQceLu4bhI9Qutw==
X-CSE-MsgGUID: byqJWC3YStG5233XK3gO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="59802779"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 13:43:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:43:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 13:43:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 13:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOfLYyzxAP09TTMAMe86yogJlh2Sgz4MzNEKT5MH66wIwxKMTbbcsZU/R+o3hCL8LWw39s1quPmGBf7PPF3ao76OXuw+3NUW3B28zAEd4Eyj5rkWVzsR+XS3qGdhUHSxEIMKo6sJ2vLAa+32n6AIabRwbM3efvGUlpKe31XjCDbpg5/BiaThNcXzfOA5XYiv1tSO1NE7AvslE8TSr8JpdnA6+FOUwPUbUS5FdKFyEzQQXFb1nv/pWdVuDQCU+iza08c3MrDl0ljDSa9XyomD37k46QDFCIuQ7F36NunyuhGzOe/XeCHClng9Xe4vC6+AQYxbJBS2P7S2ww8ZZSotyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy80B7XmEPYElIoVB0U3SGqxTjMfEF5gDv4hxr3QXHU=;
 b=mHWfqQCuDEX+6Y5j2cib+8LPfVn0d/dWDt4Dm6QIRd+iOYP2Qp5eCSxIdKVDyYM+PZqYVj4OzoWMHEhBpQXSZ5XApimi6eGyrLVPWsmeYwhTFg8BsDEnT+XbxUkSdUFwQ0I+HZPmJye8WBQUoWyByvSQWSTOhJ3ITMNc/z63ink9vGp4zsPFxY8XekACj/ghX1KjPhhI+dog4IEYc1ibH+6hFjIIPnOEtexaf9kNVpx9yp0Muq4drhloL2GHfN1LBryj/vnxjRX7/CW06p57/8L9U2HR3PeR9Sr/QT/1CVhXrE1hfOGVqJlFVrYMlI/Z4dKuIgoYJLdwV3NycAxjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 20:43:54 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 20:43:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0
 for LNL/BMG/PVC"
Thread-Topic: [PATCH 1/3] Revert "drm/xe/guc: Pre-release GuC firmware
 v70.24.0 for LNL/BMG/PVC"
Thread-Index: AQHa5FJHGwXH5CWH20uC+nTvdhUCwLIS3JxQ
Date: Thu, 1 Aug 2024 20:43:54 +0000
Message-ID: <CH0PR11MB5444D0F6C383D3FC861FBE22E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240801203341.3042386-1-julia.filipchuk@intel.com>
In-Reply-To: <20240801203341.3042386-1-julia.filipchuk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6113:EE_
x-ms-office365-filtering-correlation-id: 3d0cebbf-3564-42b1-7a0e-08dcb26aa85c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?01ivdj8t4aCFytX2znYeq7EByFgp3idKzuKIhXJsNlmUKrjiq29g2aBwTbvF?=
 =?us-ascii?Q?YZnUiLCfm0levMXu0Q1mP4jk7aas1GcrAoHCUf3YN7DxmuvZPdyA9y6kBA13?=
 =?us-ascii?Q?K4fVSRIQ6i/JJJHXWvcoHS2BhSDJBo0M94PpEk4JE9XBmhYZ9Asin3TZ+GNW?=
 =?us-ascii?Q?DLfTnWzHe6ZVU+m89iirmJ6IPELr1at9QpQ3FU358buwlfojf7P1Ax0i2bI9?=
 =?us-ascii?Q?HqkHkootFOYWEER9TE9biglawRmkT411XCX9vfiCba73TRrIgIUSV/qoE6G9?=
 =?us-ascii?Q?BEr6f7ADvFSzzB8LrWG8fk5+RxU+Rs2o0L52V85n/VohR22xI5bDf5BcSeUO?=
 =?us-ascii?Q?tUQbRpACFYh4Qy1DRx3nxnHw/Y0KdI6Y3Bj1NdKZUrqEcX8nVfs43C3o3UwO?=
 =?us-ascii?Q?s8MPHo8Bbbid7FHhhTCJpcoJCzjoOckUgRrGiTDYh8/XdHRX3Qvb3env+CdA?=
 =?us-ascii?Q?es8CuCQSfsikTPSDqeiL4x7oSiyVs4r2gTDy9cgfxRIcfyl+FoKNKlYJ5YBA?=
 =?us-ascii?Q?k0oTzxfqo+fmJI6YvLl5SHKA8MhKp2VT2VFbTZtT8CPWh0JJmkq0zBi5ifTo?=
 =?us-ascii?Q?H4TLMh+K7FD3DKlP1sHXXNcwg4YeVzLsIjbFi9XXAaXAr2oGVSa8n8lesMWS?=
 =?us-ascii?Q?Pfn8y8POYnCkU4xmtpxLal3xbCrAMM//AfyOltqbNU+1ETW2QG3jcAG/TJSm?=
 =?us-ascii?Q?s8qvky2UsySz6xl4m7pkrQXyFp/Sgdh1YVVmT1rjETth8ccVo8IEcv1FUPxX?=
 =?us-ascii?Q?C8oz6ExhchjhalnkUDEZYpaXhjfDXqSK8pE+rXaXRQFqodEFDSqwp3gf2RlX?=
 =?us-ascii?Q?8i+ZV5TsKyZpP7EVYwOD2P1hLwinNZx//eAHa+NFv09OFvCLPkQUeSRPf0IQ?=
 =?us-ascii?Q?DpiknGbf34PeWO/aU02NXvZY4vxkRo7Uy9iVMOA+Qrx/AgE9AqSzobdCyqND?=
 =?us-ascii?Q?85PK+JmZqigPzNTM7SSPLkYbNC6o2gyu6UjFdOGbPZFz8SklC1V23w/Ji+JA?=
 =?us-ascii?Q?ET8IpDHn4T0UvR7E6PJSSjDdl6MVNc6L3OH3SMJpMhVR92eU/7FJKRRGbRmw?=
 =?us-ascii?Q?lC2Umh5W/l6WIYdbdzZuJ9kByblb71YW+IuX+3m3pkenC5KYzSSsK8aUjSaC?=
 =?us-ascii?Q?igPF++sUvg7qdBOmOywaJ0HQApuQhtRr2qD2OubShfxDhxYCqa9asVyLD5RR?=
 =?us-ascii?Q?+XUzJzJR4b6cUFKfaIgmUvdqvZPgevHC97vRqNeZPtmd283+4iNb9Qed1qif?=
 =?us-ascii?Q?pRwgseMJKSFgdV18y5enAE/U3QdLmaiGhXHLKbojv3T3Bgv++n3DY9HAChx8?=
 =?us-ascii?Q?Bn10gAyMkQg2tFE+mqV3OW0OahzJj14NmNCWycmYNzcX3M/Dkmev2JCNkbWg?=
 =?us-ascii?Q?IBX8AQZyrh7eDJ7nV3fT51QWgz1r?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uhn1fokA2LkUt3zo+WPSscdIXHRCE+OkvdQS07OdWcj5190qwoi12nDlfYSV?=
 =?us-ascii?Q?IssTs2RvCopYgyWhqw2njk71YMsM9j3NP/taMGvNf30d7R67OfoOm67QePwH?=
 =?us-ascii?Q?/pcAV9cXdeeKTMM+ZNV3SyR+LDFVGZ+QV0DtM8x8By7K7td0rAEXJmeskasZ?=
 =?us-ascii?Q?CiwAw52sl7a2qjvVLLXtd+5maYKX+R+lrFc5tZYbfM93pdxW5PGEZhW2N1c+?=
 =?us-ascii?Q?EqyXxhQSaXBTb8CetiQ+ZW1CvS/xzFWg+lGNIvlO5rBjG9P8nd7XV+nXBtyi?=
 =?us-ascii?Q?cWtfnUGUMy4oLzAhSZlZWxWGBgh7QTQ5CFqmQnnQLQJmiScyJ4ZwxyiyWd+s?=
 =?us-ascii?Q?2aRjst7/ASWSVzQVitm5+jL7GGjE/DR1CHNNiXNbDcsawvTGWIg4l20nFp8T?=
 =?us-ascii?Q?QJMegENXcerL1E73vXs4o6ID1SpC8WcsuyTHkCPv53eEI4Er18UVSY+Y9a4S?=
 =?us-ascii?Q?MDsdE3gEVoOhoJxygYF3GqO/RmLGr6L2MG9xRbf6tm5qZdGoUzDHLKeAOn2+?=
 =?us-ascii?Q?3LVgdBV3wSt4MH/c3me72TKmn5H2a4HP8EnUZ+fttkZO+vBqi6sYwH6jtCIk?=
 =?us-ascii?Q?GzxnI1vJdRMYh6ms5W+LNvDJXPsdQhiR1/zrNDxmEZ2tpgjViNtoNHnUsr1S?=
 =?us-ascii?Q?UU7GMxP3N6dZHsr8utuPhgSqPe0sYgUrVM5DufuvaStUQZ85FD+ChhIrxlzT?=
 =?us-ascii?Q?356Q60udfecop7MNqorqwRR64XcRfkonFKS2+S4+2dhqVf37jDW9w6fdTMzv?=
 =?us-ascii?Q?sOyqiW7fn66nuF3wkrydLLpGVVEiuGIge4iJaDcgQRbD4hwut0NIHZ6YPH9q?=
 =?us-ascii?Q?iQeONK7Mpb14T9XkAV7emJc3fL9x6Hn1X/ZjdUTT8gR823CpX0V3GBo7lXsD?=
 =?us-ascii?Q?8IJRdRvMVxZxsvzZGCibLDNv6zTGOOoySUJMCA3i3LFHkh9Y9PFXSNxbpfTV?=
 =?us-ascii?Q?zDQSlSAqw9p2Vaio7Y9JeozLBjNbOQ8KzshUaWd7qfiZWXBoXKVb/JD88aNe?=
 =?us-ascii?Q?HPZBWOfCxBB5CbcgQK2DeaC3HpxiZBLRxbk+2o6ZO1UmYaXVebLoqL/gEcOC?=
 =?us-ascii?Q?oNmxdtlBc6MBFw3pS9NcE4Yfh7CXfCkSZ6uKM2jH04jxwcG0VKAZHY3aIsTQ?=
 =?us-ascii?Q?6wfLz4H30/h/IrZr3WJz40amN0Ou8vdQdJJZ6Us0cAJ2lZqmjG52arMxkpGu?=
 =?us-ascii?Q?XU2Phv6xt6pFpUM+0ktQ/uOntcZBlyDO4gY+uE/NS9TGKFx4TxJYuH6fHk1y?=
 =?us-ascii?Q?9s7vE5FPk/5lkJjqSqpd7ek5z8PxMzzGxSXPSgyKM+Roma5jt25dYucRX7nr?=
 =?us-ascii?Q?4kYkTmfQbPEKtRoCMKb5hjjP6oZtrHDJJuaMZ3nsn0sXW0MCfR6sifKOpIYX?=
 =?us-ascii?Q?fgfKpKb3U2/W6RBxvpLANgc2XEKxQRoPXrP6gRSGnR0V/qgPN3vozQLcgImF?=
 =?us-ascii?Q?UvZ7ZqBBbypyLJbprvo/1Cc9UhTBNzVvZNNkls5K8Yt5HmsSA41ouj7jFIcL?=
 =?us-ascii?Q?vGJ0T3o+4MmmMHpsiydjecWm1HhNEDs6EX8tIDRP/iVvvxUfR8q/c5Pyholn?=
 =?us-ascii?Q?zlLbv22p1BFfZqLfyG4eRHKZsYDQy2TZgmCZY/0mQmx1AAhamDweMAv0w9QP?=
 =?us-ascii?Q?dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0cebbf-3564-42b1-7a0e-08dcb26aa85c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 20:43:54.0424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZDuYNcGF0wunK36QVFu/wMsG/nc4Z94psI4+wwGB4qlgUPL4mWC41h0nRFQxiu7FZGokaIi6n0BiGPXHtTl//uhZC1n4dpjE3OwdGcz2vfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Julia =
Filipchuk
Sent: Thursday, August 1, 2024 1:34 PM
To: intel-xe@lists.freedesktop.org
Cc: Filipchuk, Julia <julia.filipchuk@intel.com>
Subject: [PATCH 1/3] Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0 =
for LNL/BMG/PVC"
>=20
> This reverts commit dbd3e63b48f43788cb31eac045a848508a5c14df.

LGTM, though I don't fully remember if revert commits also require
Signed-off-bys.

Also, may I ask why this revert is needed?  It seems like the related
following patches are just modifying the fw_def values for some of
the platforms and adding a new macro.  So theoretically that could
be accomplished in two patches - one that updates the fw_def values,
and a second to add the new functionality to guc_read_css_info.

I won't block on the explanation, I was just curious.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index 6b92255a769d..5b70d23724c4 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -105,10 +105,8 @@ struct fw_blobs_by_type {
>  };
> =20
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
> -	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
>  	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> -	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
>  	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
>  	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
>  	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
> --=20
> 2.45.2
>=20
>=20
