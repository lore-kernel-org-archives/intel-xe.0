Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5043C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 09:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB8210E669;
	Tue, 22 Sep 2026 09:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0v63XrU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1CC10E478;
 Tue, 22 Sep 2026 09:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790068456; x=1821604456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AHqKd9vg2TWeYXq10IHw0jSSTd4SjcT6VGMc48JdLR8=;
 b=I0v63XrU1CDtjvY5C4ytBqWU6b0kDR+9TGIdlDbfDIMzygTxxU6pmofk
 90wTr6+TewdK2QUCAwsVa7lDdnJqAiyNCq1LTQomXYcDUr5xUMdIN5UU2
 +jstftt70P00kDyrEYljoUNYloFbzNRe0BD0PxaSWuZn0W4aLlcuyx/X/
 duYXZSx2nI852J/M9TqCxF01/XaS8f6IftYFW6mtZ2tkC6dHS85YQ/uis
 wB2G6NLcPWCni/eeo/cDtY82FbfEPO46x+gfoDqDxT6uvZuKhqn0OpPS8
 M2SdIbCJPglTul4hcipIB+EKg4LQMN847qVTiIC0M2ct+NXSxMcb9YNzr g==;
X-CSE-ConnectionGUID: OdSoxQs1TLClUqmPHCaBIQ==
X-CSE-MsgGUID: HWTgowDiTaOJjDOiDOcyow==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116175634"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="116175634"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 02:14:16 -0700
X-CSE-ConnectionGUID: CKhVy9/aQHuH5VhaKYCECg==
X-CSE-MsgGUID: B4bUCxlFQE6T1ciUCKd/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4356161"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 02:14:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 02:14:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 02:14:15 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 02:14:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4aq0oZgbKLDyqeONFZ5aHmEAJhBBfkbL/kiLiSQhC22Ll/1+0yavmqZ2jaBX2VmNgzBWWp9meBiB9kSUJQHOlchHk/yPCQPpvBfXBUhpv7Z8a9xqh9TJeuUypwX5DJHc4y9Qlk7HZsRHNNIgNXvDX6Y7NjU7JgUM6sPQyJa1b2iA51z0NPjbJx+IhN4BKCL7gTplhSAezDMCzBT+ssv2Ay+vRZwF7K823eLvPDE0knVPRij9nI4DGjHehKx6dTI7R16iqEguV0y3FB8yyw1/+pPRUavnsm8TtQaH3TcUHVhENRY+BxjpSZ6vhpgJLrqAbv8lHYDvpafmTCBugyFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qip3RC+Bl+zNNwsYDHwusGMlA90eCxAQSLoFymsZrVc=;
 b=cvoWHIB+8WudBa2sXcT196lK9+GuvVwrwrNr3Lo1sIiCOoky4njG1IHZs3K5Hc7XQSNzpZHvR677EaSI8zFXSsxaZzTo7w8VYnXydAqEzQN1cggXDABAu3ruF4dIHxqNtr9BBjT3ot8kIqrm6gvxskJ4/vB2zsG+omkAIwUmwtKYfHrgBXLYrV2B9FL8Sy74DGi0Z3Q2uLQ1QF0P4JOZRqNUZsJB8vUsutUQmvfu7aLcEY/3TmZdVjTV8UqzPcqOVX6gsZn0lXS4XdoBGa9FjdznADXICb1YfURdfZWG1l2LVHUKfDJm0aaZxX3+lUAR0oVusMQnn7QoiCOQ2qxuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by SA3PR11MB069086.namprd11.prod.outlook.com (2603:10b6:806:532::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 09:14:09 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 09:14:09 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 6/8] drm/i915/linktraining: log link training DPCD access
 errors
Thread-Topic: [PATCH 6/8] drm/i915/linktraining: log link training DPCD access
 errors
Thread-Index: AQHdSZDHtkllamR2SEmc0/XRuYe3UrbaUjeQ
Date: Tue, 22 Sep 2026 09:14:09 +0000
Message-ID: <MW4PR11MB6887C30578E64D2395F58F6AE3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-7-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-7-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|SA3PR11MB069086:EE_
x-ms-office365-filtering-correlation-id: b1527cb9-7756-4eef-6221-08df1889dc19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: MZOdHU/7YOmcwAyvkDrvzuwVo57Pjrf+C3kemQVtoLUovuajNoLD2SVmxPp/L7U8mpUEMi0rGVzSlEPNR/ayhB7I2TnYZaim6xIdO/stAFMdU7Y9Sy40Rj2ycBiWVr8ZFguBTpMND0iOKbRVJh1/YHZMOYC/5IiqLlgNlA1HTWG31202iqqH97+ENjQpq7ZdfM1TJgySk6kZU0Zj3IU2l05cGDo6jLpn4w1QwBljwdXkagIwqqyScrcCWTKo1Ssu9D1IWSdC5J2e0tKGqaMEHjYQyZB8+cewaJ8eUHMucBTU3o258nvaE271sJsLhd6Tibo7xaNDgtcU9E6mAIVvC8UB3ORXj2bDQoINX2thSiij7LyWzz5VM4AFc3JR8HfbVIJGh4xMTWrsLV2nf3WHB5yCjn33PlmTIQkLLRtN9pHVal20zByjez5HWt+Z1G528jjVSNBE+hT536Z/VaU0JRcGEoDask0/Yh5lKmS1CNHVy/kunYymKpqoHVzMAgDYiJKhKCf6y0cN1s560xLLn/Sj8YimJUoJy7rkzZoZp7zcgqAfj/S0r160UHvPc1oMHToOtOOlNbJg7lKXEIp1/E+TfsPBII4adybrnUUW8lYjbRhvCUqPcb0K/tR43apUyzSeZCyLtBC448C/rZ/NX3IK6Tlstpv0a6PAXvqpdhZIYGqhQbbd2m7m6k+Hz421svjotxzg/zRMAei0qkS2sJdTqSusKzpuA0rU7E/wnQE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ikFN5k2nD3blbvjKoFPptawvCYFHQbmEpsiAC58OlNKNmTGJMz2GZ1q24jQg?=
 =?us-ascii?Q?McdUb+z7KlwoagO5NBjVuSZhYyVmhbvnnOuAHpKnDmi+fqvNgrqp4LW+O7dD?=
 =?us-ascii?Q?IjgWtB+IkTXNqCPu2HV3mZBlbar7l4QB5aRI5bcvE980QiuDstJpAmmLogm0?=
 =?us-ascii?Q?YLnS3EyeEnpiKXI+VK6mbrC0DZKLnHYdnK4qrI4EPSphuSYTJx1k5W6b/zdC?=
 =?us-ascii?Q?kHMj5M/Z/LTVwQCP5s5tII1Gjr3m2oi8ti/2sxZPcKSVabKaNtgLdrOyWpNl?=
 =?us-ascii?Q?yJcICV+b6lAKyXPIh7TEtuZ8UlLw9yaIZGKXBIk7QxTzeY2M5F6lwfZMWhsd?=
 =?us-ascii?Q?4HJ6fcenlx15SiiQrDgSPjEGXrJM4d/73Dh9YWtMo3xyrDJb/mLT56/2LtbC?=
 =?us-ascii?Q?umYWoA9icweSa8ILm57wET7RTfggYw+NFYFXXJbVwjoBAnhozH/ruf/w7R/u?=
 =?us-ascii?Q?YjxXpE4zGdOvduvZcIuzOKLMecm/fwbf5ZBbqwwm7maJWdqyl/0znFdpx7zN?=
 =?us-ascii?Q?wOWXb6qTmzXzt4w2gOJ62pUnP3cAhE9t7ZNVSp0nEFDifyrl2AQ3YUx4Nypw?=
 =?us-ascii?Q?tSyiVKRIKj5w0YSwszKBrjF2RAC9YVcTDHTnXkEy9IamfXM6xwIPMqcjHsnx?=
 =?us-ascii?Q?qXKXkhVZ93DPr4RRUPIRC8zOvKXxlOO+0MxFs8bafe2/Q+BtVF9uoDItORIP?=
 =?us-ascii?Q?3rbOTwP+WaWrszkWCW1sNtzEF7u3sBH13CO/fRSP6QpdBlgE0hCpmhKKc5+6?=
 =?us-ascii?Q?GDnHcsEqHdbit5NxQ+OZx9VQOdgRa8zDpZgVDifWt6UrYN3hD5pAl4HmP12h?=
 =?us-ascii?Q?pBdX03ZFbEBJ05m1If3sy86EjrAzznBTl3sxA+yjC1Fd91u4MM2vde78Nbpo?=
 =?us-ascii?Q?Op0j7lN88y9LwieKgaY8BzAjGyOujEhMPP7PM14JDq2eyj6CPSMEfXzmuAOR?=
 =?us-ascii?Q?m5izKVk0xPeVjfIHM9T6lFEe+hyL494QhYfOmpxellpwHlNMPzD3wEBTtyFB?=
 =?us-ascii?Q?63YGzGeCrwCYpdQ0Op0Ds7JBti+mRbeLqIBYeWzpPN29bd0w9wynsAEYo8nN?=
 =?us-ascii?Q?a4CIpkyA8hDaX/oZaCTWw5M1uVfdAjrp1H5mod1sKwNEEOBC0EgJKZjD7any?=
 =?us-ascii?Q?g9AR+UvUYdB2fy3Dpor8sBdjnnl0Tv7B/Cm8KsGI64ivRDfZY9VS3MbWeTVm?=
 =?us-ascii?Q?Ujekc+mImoeW38niDL6iinNNcW/1fBiTXv/udMSzd4UhSD3u4yvWFWOtxlx6?=
 =?us-ascii?Q?AFbiu6WoUE8cgequw0YMWYrJlpCgq+CstZkaShNre+JkaR0hsg53unD/voyx?=
 =?us-ascii?Q?JpJVTcK0sXxIJz5rIlxS3QMdVBDRCbSfNa32/MgpC1DRoFhMj7hOnYbHIoYy?=
 =?us-ascii?Q?uvZcIkyi01xKiaw5ECdgiJJzp2+O55MoLJ4cVcRbGY2kBl3QXlRoLLxl4bhc?=
 =?us-ascii?Q?C1HsBpPNLyhAihqOo0tMKh9cx1YKh86fSD1HEP5kDcovPj26IZDhXOOnBV46?=
 =?us-ascii?Q?xRzqRY0M8mDL0AfS3/uXEqy1tMHOQpigIiVebAmFD+xLDni/TsJTGxtT1wH7?=
 =?us-ascii?Q?Xr1wGK87s8yHkyL1/pRxC98r1j5t2DfXKBcBVDdFkuh8BSziOeyo8foI+McD?=
 =?us-ascii?Q?T2I44C4oWLMBVkw5m1wKfGLBWozQ58FS3PLzF9SAxYBqXCvcXhCCxygXzCwg?=
 =?us-ascii?Q?Jr07Zmnn5DyYi42xwagkl5X3auAKOhkM2T+bfalFJlcF54Wc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VkiTi0nQfwvu3syKNM4HEnhQeX0vDL299zM3srEMqd/tHJPE+9xm3d/mJO4PtpJuv+oaBSUwlPWL1nlrslVqzLMrCqYLpiM3e07PPabU5ryhsinhaEKjaz4zAC+Opc7FKncoE41U4SsWpDwuo2POYVg4n9cnDnPry+aCq43LvHMtESnWa0huATQ83E0hVMMP/He0z5yf+XqUZWBie3M+rgY59dA1eicWU8u6sal4p6bYuwEGKMMWxk0l+ssizZ07UO+ClNEXc1DpwIB+LKX5FbNKdCkswhaY2bxw7p37GqclK6iWasSgeEfoaP7BiLsv/mm8j70aBcXn4mDZrJu9yw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1527cb9-7756-4eef-6221-08df1889dc19
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 09:14:09.1944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxSdpl8kyR6HiWeoUBnSeeQNUwyKOf6efYLH2FhsLYPGadqm5Y0Q6dWV2fFoLTI+XRq4diohB8bQFn9SpyDm9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB069086
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sura=
j
> Kandpal
> Sent: Monday, September 21, 2026 11:07 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 6/8] drm/i915/linktraining: log link training DPCD access
> errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index b6e8b13ee4db..ac1aff6edf05 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1635,7 +1635,8 @@ intel_dp_128b132b_intra_hop(struct intel_dp
> *intel_dp,
>=20
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_SINK_STATUS,
> &sink_status);
>  	if (ret < 0) {
> -		lt_dbg(intel_dp, DP_PHY_DPRX, "Failed to read sink
> status\n");
> +		lt_dbg(intel_dp, DP_PHY_DPRX, "Failed to read sink status
> (%pe)\n",
> +		       ERR_PTR(ret));
>  		return ret;
>  	}
>=20
> @@ -2180,7 +2181,8 @@ intel_dp_128b132b_lane_cds(struct intel_dp
> *intel_dp,
>  	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_TRAINING_PATTERN_SET,
>  				     DP_TRAINING_PATTERN_2_CDS);
>  	if (ret < 0) {
> -		lt_err(intel_dp, DP_PHY_DPRX, "Failed to start 128b/132b
> TPS2 CDS\n");
> +		lt_err(intel_dp, DP_PHY_DPRX, "Failed to start 128b/132b
> TPS2 CDS (%pe)\n",
> +		       ERR_PTR(ret));
>  		return false;
>  	}
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> --
> 2.34.1

