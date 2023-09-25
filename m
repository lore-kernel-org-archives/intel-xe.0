Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C752BCE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 09:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8098010E21D;
	Mon, 25 Sep 2023 09:17:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E638210E21D
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695633468; x=1727169468;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8XaveU0GSQZ8oJNnPpsQ9u4V34lsdjROI1K4DxNc9Cs=;
 b=IvEbHo8IA+SZM1CvkQtrTWATP3jtnrSov7wXzIYTcRwqPd+/RCgpIF1w
 O+LyzEB6HOdZZWQBZK5EVwrT0omfwqpGOelkj8EdkTfHpxq0oFW67jvnx
 843KePrWQ3XMV6S5HVt808TKEyWw/BpbnH8c/dVkp0yAn/bz9fpcmQEBJ
 clfOyxcMMZ7fVflf1T4NdYbJf5DeD1isnHdVHbJLYoda+tZ8b5anmttMW
 RkqCDASqpXIQJfvimmYmNyjSUDSHKbYHDndjQx3rK6wmDZ73VUgiKvayE
 jQuXbgyNbfXMD8zli8eEz3l5JCu3quXI1E8KAnBMYt7iZQw6mV3tvfzGM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412136780"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="412136780"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 02:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995316526"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="995316526"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 02:17:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 02:17:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 02:17:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 02:17:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 02:17:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9svv499/sgDU6rEZm4lcnP0IzD8rnKLy0QE5rz/6iwhRW/qM9x+7wd06/ISCGsyOoCmnlQMqiBcLp/sxnhxwd0C9XCfPkgz3mC9cC1ydZx+5jl3H/uK+eHip1C4edUPXUumeF0LrcemPht1xBlDaCMWgbQi/CEofEWu8dx1vLi9+FagR1zQ9rG1zUJ//jtYqOPpIXaHOuxvSxubyPIbBCkRwP+f0tmU5YD/kXyZOSVOj3fXIwepUcI56w3yCjRmJVZSu+mfX1gVW5R2Ijh5YmNbHB0FpZ9hA59u2Zn23ibe+q0JHUw/NwxcS8u/pXQVs/SiiFT0sjojbdC3AYAGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INDs/TwyeTmblo39PjrJDsVuaNETbOCYSb461DhWfyY=;
 b=LBMBrJOB6hqA/hVoVbT9SM39x1ZN7mKuvlCT/yb8VYFqLJzZjfdgRmv/U2ZbFn+LOvQq574wDIk+MRTcJZ7/ZIXOv3iKUphpMGMRIgwmJbP9hFSuALdz6nOz9LA7jo6XNpaZWOcZMLZGhTaOwuPU/fKZcQ2aea1bvy/106ryznqX/eYeYIt0P4f+XilvwcmMsX88XuK1qg36V7PIWhUycF7C8IvasTyxUcoaiYiYIgVTJNP4vnj1B3H+HZ9EA1tFGuvF3ybQjsKdjZrwDkOPQevKdDlG6QawZ3DKyyZngYqoQAqhrmpBzBG4UMgcJvMmLRqHCTELkqFuMdIujSpS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Mon, 25 Sep
 2023 09:17:45 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::47c3:d35d:e598:b83]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::47c3:d35d:e598:b83%4]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 09:17:45 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 2/2] Revert "FIXME: drm/i915: xe doesn't have
 fastboot module parameter"
Thread-Index: AQHZ7vdn7qQr8lIQu0OMMUYRr1Hav7ArQ+KA
Date: Mon, 25 Sep 2023 09:17:45 +0000
Message-ID: <CY5PR11MB6344C71CD63660EEACF3BB00F4FCA@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <20230924144751.446446-2-arun.r.murthy@intel.com>
In-Reply-To: <20230924144751.446446-2-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|DS7PR11MB6125:EE_
x-ms-office365-filtering-correlation-id: d800f14c-a31a-4856-95aa-08dbbda8477d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GFPx7F3dugEFR8S0pooOfY+JQHFymMHCYSn3yE2JzqXcZ9gidnPpxEYNFzST4ucRybbNmQm6Co9i5R79cwRmVOB9L3ikCpE5nToILQoUpxxTj+Kig1mswvgqgppVq34/AE3C2oeiNbEWCoy+dzTzkrUyJFdirHaTQjqbtWKrZX254FF0mXJA6bLjnBZMDPrh7v24v6HXrfqegbWXjHoeQXb4GJH6ZZ9V0t8mjkw82T8JntLhVcqWWihVLSMZiNpV+/sL1lHXKFDgnIjEtRDxbBqcGMl+kpyzpOHnd7GHpcp0qiqlkrQr0SBI5i13DjQMsI2J0mK19DBxQGiaBShuqL/IPlr6sQOl6GeYoaRfOs+GxwdsSrTKKRaILjSXQQ7eAjI6FFY+uajoW824S0EVVMz9ZP/S66jqyovZHuzlYPPs9L9p6MlwWK3IargLn0jnj7HcMhz1SI89zpCLPPF03+Livi3ryiwEaI8IpkKvTcJQUhCnpWcR2TjJdR0GbpsHePq5DLSTm6Ms53pOyl5DTEwus+QK+DZ00gGpYskO7N4ijAGbQMTw01524qvfIx8vSmJJJD5bodq/RARVt7OkfiHsWFt9heBtbgdOCLIvwIyOL5ImL6E4/PONHQH16Wwx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(186009)(1800799009)(451199024)(38070700005)(6506007)(53546011)(7696005)(478600001)(83380400001)(8936002)(9686003)(5660300002)(41300700001)(26005)(66446008)(66556008)(110136005)(66946007)(71200400001)(4326008)(316002)(66476007)(2906002)(64756008)(76116006)(107886003)(52536014)(8676002)(38100700002)(33656002)(86362001)(55016003)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5mQsf6qZ3tFY99amtSfV5VxZqxy55Eb4Lm296k82xQb8dPNZOEnwTzSVXfI1?=
 =?us-ascii?Q?ewAUu6BkUqdnaIZ1VGUkKxtOrcFyzIhZhH+WtWDx+aW/f5/KDehvm5RhmQn3?=
 =?us-ascii?Q?Mb9ze/ontFu1opjffPWPQDO5a7u/x0JGLWVLmlYtHtQFVhSpNyE04ZBZKGxF?=
 =?us-ascii?Q?6Je3/VXOUThMkpKn+1Mo4aQu/JCNlS+6DxZQ+joai1pgOCZf5RSJorANfNX8?=
 =?us-ascii?Q?J0RjEspm6m8vjc6fm3HvQy4rB79Jq0R2O5xKxfypUhsHnnWzWlOnEs0/kcdu?=
 =?us-ascii?Q?G35+4uZhpG2qguRTLK62m76d/zUB21PjgudIjKVDjM6OByB4q0bc2aYh7V+/?=
 =?us-ascii?Q?phBgfRqG+WJpHkP3DJDlKSHLuOOPVjlp2WmuWSjsJ4+PqzGHVfQYzQ/dIvwW?=
 =?us-ascii?Q?/v3w6R+ZvR4AJVbhnLiFz6NoxZORIkpwvNLokQTVPibNHyT/l8u9IKTLAU/s?=
 =?us-ascii?Q?QIjOQ9Vp/gVYWiG3vLGaggLc18o7P14NtMtvb0HbERrI2IL5MyDNAeBqUOd3?=
 =?us-ascii?Q?U9VAumYL7hOMYVkOdnJaojCVrU5JhkvxnTRC/aivRSrQsoutkW3L4Ql44lnO?=
 =?us-ascii?Q?zWgCYp3OCMwpBNBqnP74/25GntO7/DZWd0p2kLm8RebWOJXCtKiBIP6C+2Y1?=
 =?us-ascii?Q?qrTvCuu2bz9ee2IKtYrgsCWQ+WtJdE0rMOMOASJTcBoouCjnKPECl8dVsImy?=
 =?us-ascii?Q?AdHAMelAS6q4LVKnSKrXOtL2XG8Vw6eqdXRet5ZYkyjQmcdQFrpKdteBMGYE?=
 =?us-ascii?Q?pP1QnFfD9c2mV3hSjfIGz/cT1nhne5CqkgphdlofX7I4BsNFIPupsg+mpVqd?=
 =?us-ascii?Q?FslnKfFzj5H1LUMHLeApHxVwx/gVeS+zs6hAGg82rM1TqQWUDR+k0ytYgWrD?=
 =?us-ascii?Q?mF2ffOKFsJLuQtZtoPrDSNfpBnKcXOqwq4/pC/QuYKfgyhITklFP5WYzRnfy?=
 =?us-ascii?Q?fHHoHzxjvSZMj2Lr7Qa8kB9oYq3VOWMzcDYi28F7WQJwHUSG2HvdkIuwPzbO?=
 =?us-ascii?Q?3/uUDZPzWjgAhOCHrVnNpEbNQDa+AERaOWwWU5XxPePZYc3qceLwgQhI5ZHo?=
 =?us-ascii?Q?JDD3o/pKe1d6H0SQ32TwObWoYhOqPCV+aIxmXeq1St6qybxR9o0B5Q1/T6Z2?=
 =?us-ascii?Q?I5oSOvvIKQVTReJlAN1+1cFvr++Q70MOnpqnLOVTq7HgrPzdLcL1A8Byrzvq?=
 =?us-ascii?Q?wXmZv8XGAPgWAD6ms3T26h0Zk1+DWdh59b1mU2Z8izgjXAA8+9OTcC8eK4ZF?=
 =?us-ascii?Q?V/WK6ny/RA1911OYqW/fKDcWXlTkoXPNe2+nKr/3hLqtDHIBxANw9OHxEI9V?=
 =?us-ascii?Q?3/2Kx+F/sRzeYX6HAsop9S4jAU6ZEDqNtALx8sqLEyuPpOPpCJ0Y0zGxBIhy?=
 =?us-ascii?Q?HOR+6od3UhAxI4eR0b/3AkMc/uyjAeUqZLABahZrkhXqtSEVIJefCmLGK+Kn?=
 =?us-ascii?Q?5+p/fXeHM/VCmjF3NYVfnI3Z/kF6hrG4/KM+mh5Mjs1yTALu24DyzZBGB/H2?=
 =?us-ascii?Q?BBCvadJ5yUioy70Ln/dMKRz4tqBptVYoDMHxwjzEH7xEmA5J2bmJd6wVX94s?=
 =?us-ascii?Q?6hJpFHlgefyR43Jgb/fkyY227BdQXurVUYRj12HF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d800f14c-a31a-4856-95aa-08dbbda8477d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 09:17:45.4105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UbN4fxsK53kF8sBaX5Xe8aXADK5KvotqFz20mf3V/s2iH8zAmpdVr8JAQjG6CBTbCE/dNgLrQ5G/kU4wsw/L7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] Revert "FIXME: drm/i915: xe doesn't have
 fastboot module parameter"
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
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Arun=
 R
> Murthy
> Sent: Sunday, September 24, 2023 8:18 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [Intel-xe] [PATCH 2/2] Revert "FIXME: drm/i915: xe doesn't have =
fastboot
> module parameter"
>=20
> Fastboot module parameter has been added to xe driver.

Use "git commit --fixup" linking to patch which introduce the original chan=
ge.
Suggested by Jani in a different series.

Regards,
Uma Shankar

> This reverts commit e1d816044a2feb4aab2592c840e999bd9a13f0a8.
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index b2e16cb8d026..46a166b9ae43 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4986,7 +4986,6 @@ pipe_config_mismatch(bool fastset, const struct
> intel_crtc *crtc,
>=20
>  static bool fastboot_enabled(struct drm_i915_private *dev_priv)  { -#ifd=
ef I915
>  	if (dev_priv->params.fastboot !=3D -1)
>  		return dev_priv->params.fastboot;
>=20
> @@ -5000,9 +4999,6 @@ static bool fastboot_enabled(struct drm_i915_privat=
e
> *dev_priv)
>=20
>  	/* Disabled by default on all others */
>  	return false;
> -#else
> -	return true;
> -#endif
>  }
>=20
>  bool
> --
> 2.25.1

