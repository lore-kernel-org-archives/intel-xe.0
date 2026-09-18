Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33216C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 07:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0E010F250;
	Fri, 18 Sep 2026 07:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPWxVB2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CB310F229;
 Fri, 18 Sep 2026 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789718376; x=1821254376;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4lbFNEe1eeX9uEufUlRFVU+LkJ4bzISf5AsVNqNwts8=;
 b=dPWxVB2ULmqZpNuoQ+++XnU8rlJ+FcZ1p0QMIaGUe5nkQc1yeJJ7QEet
 mp7IdxOkB59UV76rVi/KSAQyE5B7zJnhm71MjnRIUBp02YB3rhJSx5I9E
 cEkndDIscJuwRX97zvF4xS/Fo2i4+8aLIeWEWf3VheRM2l1fZ2jn3NefH
 0dqisTVEY7paVFulycDc1yJnJAAK831bWqoU9BPS6aRJs9MaheEInFmAe
 qPL9f7JlB+/RU8OHeuq34vdBAhDZt/DNzWj+e4Y8j2kRoSGuarr/r24iT
 hFPHfSehVCrNfzw+2C2WuSo1G7aNapwx4OSFINE6Psv2O0eE+whAcDDr/ w==;
X-CSE-ConnectionGUID: ZGoxs5ZTT9SzNep57Ep52Q==
X-CSE-MsgGUID: oJ4Do94nRgiUYNYyniLSgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="715378"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="715378"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 00:59:36 -0700
X-CSE-ConnectionGUID: e1CZ8RqbQFCqsFkJ83wLtA==
X-CSE-MsgGUID: MCzJxg/LRfueaxdIA+MWmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271600614"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 00:59:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 00:59:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 00:59:35 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 00:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2ZbtA49cN8NmeWlWGjqS9U0lTOzDujrCHcwQn6LXgerzNFYHx0NYMA/eoGL+quztICLvhhYEnvGp92DddDyC1Lw6uWdf3naUy+FduypH7T0ZDa0lLa9euu3SwE0YFL2UzKD9X34VMCPqjSB9ZiqpPQkWQ65LMVfb2iyZie377xfFkiHsi1krovJU+vtTb79ZHoxkNYVv1jVVbk3Lsu3sEBl3bulLfDC25sGPyV/RjLfkEpDLTckUZxBt544ND/ZowXW/OaE/4uEjlQ7fW4XwC+4XxyjCi8d9OD6QEyejFwgDPdnUDKsj2GPRMm0cNPGbE1kCLj84B+x1ZRMuIYaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izNzrFvMLb3gkpgxRASlUKCTXAIXfsUITyuf4rTrwEw=;
 b=Zcvci88H0loYi6YZOg4zmZkQPbwrqKQHOrJ6S/gCXrM3UmQm8IEQ4xCQOmFaQQdhOqQi7tlei6iud0umO1lV/CrwWCf7t+XdSM/LXvCFd6dMuYCn/6AhzZS4IOhgCtc1XmLx4xC4cGMrWTOgajbNJK8Kp4bNuJKeyzKDZuTdX8Kj4TLwdJTw37Jm6MBNasnAY3GWr4LjDZmPU6aq0DM3Pb7w0J8jt+f3LVgQYl5cJ3rDLmDZ+jTCYpeQ6Pzd6ctUIN5du8g+lh0jC5GFYiY7lH2aFrQhc9R4vV/UvPQCN59Y5QdjR5PSOihKS0b3lGHaMnQHfU+mqC2FlMpCAwFE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by DS4PR11MB417314.namprd11.prod.outlook.com (2603:10b6:8:504::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 18 Sep
 2026 07:59:33 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8%6]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 07:59:32 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Topic: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Index: AQHdRzhdT5FPUvz9lEmCWMA5aWZ72bbT+JtQ
Date: Fri, 18 Sep 2026 07:59:32 +0000
Message-ID: <CH3PR11MB7300C17AE50788F3A333B996BA872@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260918063829.1321703-1-suraj.kandpal@intel.com>
In-Reply-To: <20260918063829.1321703-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|DS4PR11MB417314:EE_
x-ms-office365-filtering-correlation-id: c075e9e2-bf0b-40fb-aa48-08df155ac629
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|18002099003|10067099003|22082099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: 9a/ZjqJHVh5QwwDYo9aFqs9pktL+IxQpJg6diLXQGXpkUxIEz5Xx2T4PiL7a9pB+ov5RrEIhl3zBuQu6Ebk8Ff289mCImn/JCrJv6ZF5s+3ii3emYVfcmwmc5ABUOS8BLB5mUkQTVkFIC9NWI3XRYrJWQZqoOtjyTNssRHd+j4MTWY4mYB8qp+g3l++qRGOBiW5YQXyO7/T4+W8jJ4FogcfjvGuc4jmCon2UHU+fqJ1hc61txyr3egs79Hj7xfmPrvlW9JbLlcpiFe6tFwCj2QTQNEuj1zCDeCEZpxps3OhYvyzscmSDhvgLZvGUXWy2tl1EFuJydHMGYBlTnMVAmRzGcZplrwQl8VJDVkBDdTwYOCPcxFjz4F6PpW36uK3AKiX6XMMbKFW/JJ4dmQdJ+Agr4XWZHU0Bq4g6mz+4GOMlANqR+D8m4PWPwIJg/oMPVnhPTxlcAC42ecweVOsxtFyP1eeddrLhCmqAshhMjJj1MGUHPS82PML5GkEbBE8YB3N8RQwdOv6y07cXeINQ3jdeeZH6+IpaJJ9eW/3+h8yyOrJ8h3I03KGGBIUOv7WpWF9FBCNFIlLmngh3Yhs1lrJ0x4yz0wroKunYfD0FLr2aQ5/lOGg1nqH3lWp+or5wBGxJMW/iSPImmAnqyFAROd15tcJ2rWwQ5q2JbYmSypcLSbZjq8Hob5FeD0ATDAKl7Hg9jXshcOBWbXUv4fmW6KT7U5jdw0rRibFu7Zpv5pg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(18002099003)(10067099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?557ObNPkfJ2kLsftBgTTsqWpSJfjmVjsxbWnSQuQpZRRbpq07TzUOr5bWnnj?=
 =?us-ascii?Q?1NPJWLM4L96pR2uHMQA5LPxlPieTuQR4hkNt1kUIA+IUGbCDrWIASxzk3DEx?=
 =?us-ascii?Q?5iXlYOuml9z5P2gO4ZR5R7Ydd2OBP8WWvGiY9ec1xsDUAAZXynX0C1rOzFVR?=
 =?us-ascii?Q?mkce1d1OINUtXjQdWNT5881YVcRpB1+jRVoDggj7LjhFV2PfILzpHhyqT3++?=
 =?us-ascii?Q?rbIuqiKlj80ZJzR6QWilPEptl8yvJ31uyuhGcoeZwZ/SDL8nFYAtPUo7WVvj?=
 =?us-ascii?Q?grkMm8ipYbtP7PQ/9MN1pxLRRESB9RHXpXcqCJ0B1TKD7ET2MN5rIWfc6q1x?=
 =?us-ascii?Q?hTisNpAzMXmfutOkX+uoAQHcrmZkquwCR9XwS0Weo85dyqWEZq7+yImFeAyH?=
 =?us-ascii?Q?oK9wuyl5Ftq0Q3FWxcuurne7BqT9971s4ht0zbisi1DYdhyb4bp/3tkIz0+r?=
 =?us-ascii?Q?1spOZEgaW/ypz6wdsHvIOVE3V/Q/AfZPLZQ085jRsjIJXFZl5FU3RUtVpId3?=
 =?us-ascii?Q?PQQLtpGUpJysZhERKhOHX/Jk5zMz1xqeWIwaD/U0l4w3di54pZkQ2U1zE4XZ?=
 =?us-ascii?Q?XQ0ZByPyjUsaBT4hPAaQzMC6Tg6AS+htoaSPFenTB+9l5BeTjGe1UI1L0/e2?=
 =?us-ascii?Q?RaFODUePisCZeqM0XOeF7Mi4S7NNG3A432hMxDEZ8gJtuv7e3GpTjlNLfJJw?=
 =?us-ascii?Q?NgVDkUFKgBFH2F9+HSsFXkmjGB3hnbYBknRtds9bkPrC86QBNA/cy1vxlq4/?=
 =?us-ascii?Q?csmCw1txcpQ35o2CPuE4RqSF8oVI6G+31fMJHHdS7NjYxMKuEZ6YQcxmmcX9?=
 =?us-ascii?Q?VuIofQ6y6KIJdJpfEklBhkoHEEa9FgUEXiMcyxp4ol1PwkEAnObtZPjYPJDf?=
 =?us-ascii?Q?gijULf75qAAXXiqbOoQhUP3UnuvN398UDwpPpgdb+QSM/1x8/eHRIQ6mYOfK?=
 =?us-ascii?Q?vxo9jNh33eBsTrTI6gM+UwVBCYNkN5YRjOkI5SQcsfMD+tD+xioC5v38uaNp?=
 =?us-ascii?Q?2y8e5quXAyHBFtYc8w/umRxw5mRjofjEha5mualV41G1cUJa5fNID4UDK3/K?=
 =?us-ascii?Q?53mIVK9MWIFVHORnmaR6yw6JRsvVJ9yqJCclwYbMNzVe6rDH/axmipyDHa/J?=
 =?us-ascii?Q?L72SkafRqOMThtlvfC1EW1OYoCl3iqhZd2mJmEDdZ0GUGvdNHOm8kegAEnlu?=
 =?us-ascii?Q?T93lOg0STUFxwUSHAuq6y62NvLxeQjLNCqdIdh+8p+z+gcstZ4NyQx0TmH8H?=
 =?us-ascii?Q?hMqHjLuzHgl4XvagGoX8mLD/qC9vGYuZVVfOy95seAecE0HnXl76IiIuFztv?=
 =?us-ascii?Q?ha8thzkvxCZmEYiwk/tBC2lp++va7zACYWoVkE0zsjRr7SfYx/SW0oipdYdP?=
 =?us-ascii?Q?XTC3x6caE4COjxBu1fcV9asLOsGFj7bojO/4rXJdkiuzhAKW8+z0dOnVSxyv?=
 =?us-ascii?Q?gcSJvmUksQaZY3Ll2spx9nOU4vRhkA6laX7nuZ/hwmoF68wQSJZwq/a5EJBK?=
 =?us-ascii?Q?wKAM92LkmM0vvvahtN6CEw/BOZVgQqDNwH9jTd67W8v8421L72EZp8sBesFe?=
 =?us-ascii?Q?i+vS41IYyEMUL8MKsh6OWdRZKCB5Xk/6tT5vYilB5ASQ/g7I01mqtVvzyEfI?=
 =?us-ascii?Q?lsYyFr2gCBEJv5Q97QTZzvCzdRDAY5MJzLnoX4hCFv8mrqk7EdYXdmQgI0va?=
 =?us-ascii?Q?Emg7L/Da1OVYTp9dHK/ZzjPzxrzYMQRRETcs6TPfArM5tjM3t4Uk9ADsOdFo?=
 =?us-ascii?Q?Byw6CBkV9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nsgfm6TmWPz+qJHPNqSr2+2qyZC+XwoV/kdgo4vyQyUiO95wrDLLhf4eoIy03bzJNNhs1mOS03xfTmSEQprrZXNQyw6PiNzfGeRcTma7e1WasYpkcreQzwTS0BK/3wrmIjbIeZJbwPW4J/UtC4vEZm6sn7uXMEMRhbSrJ8RrEqW3HQpC01U6/e66UazyvwOvd1XiHmZ+p6MC3TyCgPrwO4UrTMRU5YSMc5X4n6i50RH4FQIjZYEIdxkOPVsYXkIyrwE1Fd57y3RrvT3Nk/Crzw7zGpJh6JOBNExmc39KNSfvnsdj41J4Mrqs+9suKNbzF/HnOafT3uc+6mfyD2DHeA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c075e9e2-bf0b-40fb-aa48-08df155ac629
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 07:59:32.5188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFgd7SJFrn/MsfTL8ZeclR8ewsS32MNGV+mcITw5I7CN5r7gnuweUSnSbF4t6Mps5U9OUjHOXOjTIsFNzVxYgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB417314
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Friday, September 18, 2026 12:08 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Shankar, Uma <uma.shankar@intel.com>; Sharma,
> Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com=
>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
>=20
> From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec for
> SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced which
> powers down the PHY. Which means we need to make sure "Disable DC5/6" of
> AUX Programming sequence is honored.
> Disable Dc5/6 when programming AUX.
>=20
> Bspec: 68851, 68967
> Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------
> v1 -> v2:
> -Fix commit message (Arun)
> -Fix the if typo (Arun, Sashiko)
>=20
>  drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 3cb07b0a901c..879b203f9258 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	u32 aux_clock_divider;
>  	enum intel_display_power_domain aux_domain;
>  	struct ref_tracker *aux_wakeref;
> +	struct ref_tracker *dc_off_wakeref =3D NULL;
>  	struct ref_tracker *pps_wakeref =3D NULL;
>  	int i, ret, recv_bytes;
>  	int try, clock =3D 0;
> @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>=20
>  	aux_wakeref =3D intel_display_power_get(display, aux_domain);
>=20
> +	if (HAS_LT_PHY(display))
> +		dc_off_wakeref =3D intel_display_power_get(display,
> +POWER_DOMAIN_DC_OFF);
> +
>  	/*
>  	 * The PPS state needs to be locked for:
>  	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
> @@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	if (pps_wakeref)
>  		intel_pps_unlock(intel_dp, pps_wakeref);
>=20
> +	if (dc_off_wakeref)
> +		intel_display_power_put(display, POWER_DOMAIN_DC_OFF,
> +dc_off_wakeref);
> +
>  	intel_display_power_put_async(display, aux_domain, aux_wakeref);
>  out_unlock:
>  	intel_digital_port_unlock(encoder);
> --
> 2.34.1

