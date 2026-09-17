Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCBAC982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 08:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B2710EC83;
	Thu, 17 Sep 2026 08:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nx5Eh+B2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC74910EC83;
 Thu, 17 Sep 2026 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789634725; x=1821170725;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TN8WbwWMCbxsqh27dIm9kAqH0njISuEeL1UODW2H6D0=;
 b=Nx5Eh+B2kg2y9DjJ/aDuV0QfhLV2iIOf0uNSxLAclZKo1M1C32IVvflc
 1r4Xb0Pc44TOVR0DX2yiUwE/6y7R63cREHQOMLKkvliZeyBfjPm/SDGWq
 Pb3tV3enx70v7/OSfId7b0Ql/gCnMcJ1Rgwhn01c+aghg1tEFlid1E+rG
 ibMWVn1EZePkW9NXGLVnA3ujtDxjjpI/ktoHFM1OdVkg8hoO6pOWGoxdF
 JFi0qRrJLYY6QnMva7MqusxYhjF0XxLIPWsQw5Qp3Hp3elcmfsE9Y7Dlr
 nVlxwyPgtStE0TwY7Y6el1aZwvAqgTtHrVPNh5PFb5xBCq+ZZsEbgxFrj Q==;
X-CSE-ConnectionGUID: p79+c5GgTl2PdTQK5DRrJw==
X-CSE-MsgGUID: IhpnWa+TTjm72wpDZhNZSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93860163"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93860163"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 01:45:25 -0700
X-CSE-ConnectionGUID: Ej14C7aMQFyideKFjUk+8A==
X-CSE-MsgGUID: JkS3Oxs6SGSvBnQGg63t1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275617675"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 01:45:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 01:45:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 01:45:24 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 01:45:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S19NEuKXDyKqQpj4nd/0690XrZwp1iZl6nt5Sjrd0u8Qdfm3+phOxhfMNPq3BZ5qLAlzXbFiNoVTIfFmmftk0CEKk6889yXUDNMjFU28yDjFAPH6BWp/TsdjF7X9oAjh2rsZZ8jSg8D4FknGSuqHXHM0TCkeygmA6RJQOjFXdBehjgKgYNj2cRhRTonUdrnwpI78Xi/Frpp0PRJAdeOAQUOVFuYPNAnW7E4/87g5Jp42PQAZjxxnKpV0HUzvQ58ab4SgphPq8y5hSwx3EpssRHu0QIxlD0GQL4Eh6NwTvJEl0ViLLrfVnOpmwy9oGbdKAGg+1HGJmbXHkCsuPUugHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLTYIRZJMK/+0Mic2EHSUa+byh5KnxaJKGJNvashVU0=;
 b=gi4EIpwpxL3mzfkQkkpHek3NiYSwZoc78Tjr5VVuy7WBGtNes/mBIh/ZTOcvHOwKpD0pSqO1Pi4X96j3/se+pKexMH9MjCjtTF9/M1KX8o24AKaYR1eI+L81E5Df3gwK/sojlJqAQcxVWtXohloUMFxeYRBQTnZ3Ae2ld9brzlVdUNdYi9UovXe+Jd8Dbe+syFmlOQ4I4s1YQRTkSe4zcujMp7xflAak2s5td/X9RC+t3RNH8Fpyqh6flBgaPfjjHHE+nPuhbXD6DDAcM1BUyZYGGY+eeGKe1fXE+5CaNPfZzNzyrUyTnn8r/9YcV6+kMPLkQ3ekP+nSSSq1f+IsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by PH7PR11MB8009.namprd11.prod.outlook.com (2603:10b6:510:248::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 08:43:52 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 08:43:51 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH] drm/i915/dp: Expose sink max compressed bpp in debugfs
Thread-Topic: [PATCH] drm/i915/dp: Expose sink max compressed bpp in debugfs
Thread-Index: AQHdQtu8D13I5JGB6kq0Z1Q7el/lbLbSe2AA
Date: Thu, 17 Sep 2026 08:43:51 +0000
Message-ID: <MW4PR11MB6887770D90D277D9BE2E1878E3B82@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260912173404.946030-1-swati2.sharma@intel.com>
In-Reply-To: <20260912173404.946030-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|PH7PR11MB8009:EE_
x-ms-office365-filtering-correlation-id: f7e24e11-6ad3-42c2-e5d8-08df1497ccc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: hs3YuAqLZ0o0V9cUJPUiCdff51XnBZY2WgCNxKb/ivN9DVD2qXK9c2KTOeDMcZrV5ziJ9elLoOUQR87sCFyBj9SPDGYslRVknEBF96R17JIei3JhlRZyTMKxned/cknEQCX4B4PKTfV7LMuS1y5ldCzfACJlMLMDPnyh29c4FBsGGTXJfA7jqB8reECUgXuzBsWH6wmvf9bJPoth4KU/FYreQ1+CZwNRovs95pnk2lhU3hM38VnJB3GyWZgLQqrXow9gNTjuglsxcTVFPaSqfnOK56m5AdLkDBUOQ0khvYtZHCdZlza941c+jiQcwsK1gY40zgeyv2TPHDN5AzWoW4uTK4TjPc1PNmNqE1g1sVW2a4f/d2qxj+TuaD2+hA7S/xOBjDI0sPPDaAVkAx2YEGbJoWYKN39C6KPw1i4nXsyTAlxiadEY+iv9jNcpzq7yOjqtqBU+7dLZDVBa9KgSCTVfI8mONYBEgchCqGtkO8drG6l94mSdUrA8TpBWamw9alqOdsmwcXIriJcbSMhDeMUF0OHM2BsFQXqNKAREFKrbAFnUZU/Vzs9Ws49Cmi08Ypx2/TKJZYV8a2rXO5kLl7yItrY5RrY++LLpAts8H5WsE4OqLxbA6HQLCcXk/wHrm18+bJmZorwbcblYOtgGR8gE/BaBh+XDeLKCnWsrN6KxK5ycAsNfRAdspX9FQ4RMPeZQ2eOdbcDB7RLzcXpEA68gWbqQywmD1Ia5UEQhSvs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?csvZ+ciZCFDWsCwzr2VgYWlFo26MfGLUK/ZwtgT3arl0Lw4qM1oed4tsIbc8?=
 =?us-ascii?Q?OH55aOPtss9GnfyD/yLOaPuKIIwLkeVW9F28yp94KcjCpInLQHgeYK0ua1Y3?=
 =?us-ascii?Q?l7O4FNojgSnG1NRH7G6RhPoMIGKIOrq9WiVL9S7Rb8OmzavF86FIavdosy9T?=
 =?us-ascii?Q?KXN/8zxl7N7nlylzWOUyFS7PGcZcnxZOYlO4eLewVFSNHjInokbk9ElOTAqW?=
 =?us-ascii?Q?VfnadjRpMHfYepagTap1J3fb3sdqLVPMmsIMv6Zi/wXXelhW325PBD3rIyHi?=
 =?us-ascii?Q?ezTWTCN2nZ8PXfg7hABDY42bNHywAlwnLFQBp14l7Q48fd5WoP0nnfZo5uob?=
 =?us-ascii?Q?datUaUiPwP69wk5xJwx5qXf7uI8IfAZWI2mbgZ35Bkg+/ZQ/HUUaYPJ5EBPi?=
 =?us-ascii?Q?nc9Fa/avMPBk1TOn9JFlm4t7CeUkmLnvd05LJo9T95mv245yEiaharbIHe/g?=
 =?us-ascii?Q?b/Gp3IUn4Vx/JGGYjwDS1vCmI8XCUXkvm6Sq30Tsat/ch3ot8rgf4f/GIt4e?=
 =?us-ascii?Q?jtFce0bFYMLnyGFliu/gGrbpTwX2brMFz3AX8zRn81k68v38R9KVnZ9hjoa+?=
 =?us-ascii?Q?Hpb+52KPZ0XkeIVVgPkKgZ3iK2XBH+RbWOJfxwc+VtnNImzbE+fTLl4doqPa?=
 =?us-ascii?Q?3bvVm9P7dINiXed0kwEjDIOaXl8AHnUCg1IZFgAsqaxIs73C4nqTViVL6z4q?=
 =?us-ascii?Q?eWyjrH3OjvLfVMy32lBNSq3Gpts6FiM1yUvg/hJnshHiDJ6M5yuidw0X2PDM?=
 =?us-ascii?Q?tToDfaPhuKUj/FBAYYdsgfKIi6s2KDUrnX6A+eJCx1RkLLstpJllQcUHb5Ln?=
 =?us-ascii?Q?E5Wu/1cZffQktUrIbVrmvs84RoVVhHXTJx3kg1BVg0n+r9/H+9KkDBSoQ2HW?=
 =?us-ascii?Q?7+pwxyivRoKIL4fBdxtMBtC4YwCB83xA5rcr5IYKBZXFAcb1pElRHbCGc4eN?=
 =?us-ascii?Q?N7SN0ixOs+7apBbfR7hoYJldMz60hz3Z0ed+y02f0SzOo7li5DVSYhJrPg3a?=
 =?us-ascii?Q?NDBDbQ8Z4NyM7zvScIRfxnCKihXDF753clcqSrVqRvkheYg2voDkMVC4ppU7?=
 =?us-ascii?Q?wDZXjGSHYMuPQFt9weelrdcQgMTlAII8YSVquw+FSBwm8KSnEd8HCzyRbNrV?=
 =?us-ascii?Q?CkGC22x4xienYwBGpA2W5zwwjoCkqPLUuLcgFC2sn1P+lj2rMwXOLWk1Aduw?=
 =?us-ascii?Q?Rw+uQjYqHEd0mCrqLnoXvn7hapULJBAUZmy8/IkwbiXfcHTnVRXVS13BgbrI?=
 =?us-ascii?Q?+JF8jI0CNvABsn/eqnrN9IJZ82LAdLH68wznuKpyvC5B/2XIf00mP/cd5I5w?=
 =?us-ascii?Q?E27IWBTPOr8QFBgqDlHUaZHrtb5vjfOEnjZ6MqV/8xKD5rtpkM107E/ZnP3G?=
 =?us-ascii?Q?oPx4Ojnt6CcT0itpNghH940y+9B5fWQa1DkoxhCG6JBkKuMj7AU0D6oQ0f4i?=
 =?us-ascii?Q?AMfmHdVVNiyGq51X13YTdiMXRijwWLYCpSTMuze3REkn8gYFN4pT3VUHngQz?=
 =?us-ascii?Q?00dA8vesHLdXZGhWRcI/PWyFCS5r2lbBt+eSTlS4m9VhjZja/RnbEKx/BG7c?=
 =?us-ascii?Q?u0UpVtFvSjJz0m2iBSp36OZ+8+fjbhETYeHF70bJhQklmVgMze72cj7oPV7D?=
 =?us-ascii?Q?xMGekdUcEvdstjkmWZJVgQq3GVeiVDrBu23tLxYamcTAQcb/kKbTXN4x5JKZ?=
 =?us-ascii?Q?7uw7AgoyuFQEYgm+wSRlUHQWEIvH3pPtf8iN5+HOritcNyKedhg7kyeyublH?=
 =?us-ascii?Q?KwS+3WBO4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2Js+4plSrl1AIiaRQbboTE/yTCV8SPgXdDHHWqOlCwwLsE7VKN6FnB8lv1M78IMbAsl357kSw5ZAccRavL8c8c0RiuCx3Bbr652iqf2Ar64nYQta3WfM803S2aiiVR1vGQ8GAq+TqMNUH+HYIgpkypFDdjNjPHhtVols4M5qZxuH0n/Z9KE4gHB0d5wj7BMSo3o5nILoZ7StB6WvU7F3GS/mvD0DwiRLAAMW6Q+hI1EVzQPIjfXyKoCPzqNjMDTd9DEbhEjcy0XbJIyfoPHOa9OIFywSXn0/rmNZs2A0e/QlhuaktwcfipZXRZLB86k0E6pcE83dvvT6rbC1dZKNFA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e24e11-6ad3-42c2-e5d8-08df1497ccc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 08:43:51.7487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klA1t1hvPqALgDRPhkjKqaG3DhkUf5lKQI+SWNXHVEOHscJESkRgo/N0UH0t5amrFQxqdaD4pFIFTwU5s0hPVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8009
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Sw=
ati
> Sharma
> Sent: Saturday, September 12, 2026 11:04 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH] drm/i915/dp: Expose sink max compressed bpp in debugfs
>=20
> Add DSC_Sink_Max_Compressed_BPP to the i915_dsc_fec_support debugfs
> file, derived from the sink's DPCD DSC capabilities.
>=20
> Max compressed bpp differs by output format, so print one value per forma=
t:
> RGB, YCBCR420, and YCBCR444.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  .../drm/i915/display/intel_display_debugfs.c  | 23 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  1 -
>  drivers/gpu/drm/i915/display/intel_dp.h       |  3 +++
>  3 files changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 2bbf4760dc30..2e2956d6c28c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -906,7 +906,17 @@ static int i915_dsc_fec_support_show(struct seq_file
> *m, void *data)
>  	struct intel_dp *intel_dp;
>  	struct drm_modeset_acquire_ctx ctx;
>  	struct intel_crtc_state *crtc_state =3D NULL;
> +	static const struct {
> +		enum intel_output_format format;
> +		const char *name;
> +	} dsc_formats[] =3D {
> +		{ INTEL_OUTPUT_FORMAT_RGB, "RGB" },
> +		{ INTEL_OUTPUT_FORMAT_YCBCR420, "YCBCR420" },
> +		{ INTEL_OUTPUT_FORMAT_YCBCR444, "YCBCR444" },
> +	};
> +	u8 dsc_bpc[3] =3D {};
>  	int ret =3D 0;
> +	int i;
>  	bool try_again =3D false;
>=20
>  	drm_modeset_acquire_init(&ctx,
> DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> @@ -955,6 +965,19 @@ static int i915_dsc_fec_support_show(struct seq_file
> *m, void *data)
>  			   drm_dp_dsc_sink_bpp_incr(connector-
> >dp.dsc_dpcd));
>  		seq_printf(m, "DSC_Sink_Max_Slice_Count: %d\n",
>  			   drm_dp_dsc_sink_max_slice_count((connector-
> >dp.dsc_dpcd), intel_dp_is_edp(intel_dp)));
> +		drm_dp_dsc_sink_supported_input_bpcs(connector-
> >dp.dsc_dpcd,
> +dsc_bpc);
> +
> +		seq_puts(m, "DSC_Sink_Max_Compressed_BPP:");
> +		for (i =3D 0; i < ARRAY_SIZE(dsc_formats); i++) {
> +			u16 max_bppx16 =3D
> +
> 	intel_dp_dsc_max_sink_compressed_bppx16(connector,
> +
> 	dsc_formats[i].format,
> +
> 	dsc_bpc[0]);
> +
> +			seq_printf(m, " %s: " FXP_Q4_FMT,
> dsc_formats[i].name,
> +				   FXP_Q4_ARGS(max_bppx16));
> +		}
> +		seq_putc(m, '\n');
>  		seq_printf(m, "Force_DSC_Enable: %s\n",
>  			   str_yes_no(intel_dp->force_dsc_en));
>  		if (!intel_dp_is_edp(intel_dp))
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 437b9e7bb864..5ef98102cdc1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2044,7 +2044,6 @@ static u16 intel_dp_dsc_max_delta_bppx16(const
> struct intel_connector *connector
>  	return max_bpp << 4;
>  }
>=20
> -static
>  u16 intel_dp_dsc_max_sink_compressed_bppx16(const struct
> intel_connector *connector,
>  					    enum intel_output_format
> output_format,
>  					    int bpc)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 04fae203bb69..881674043c17 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -212,6 +212,9 @@ bool intel_dp_has_connector(struct intel_dp
> *intel_dp,  int intel_dp_dsc_max_src_input_bpc(struct intel_display *disp=
lay);
> int intel_dp_dsc_min_src_input_bpc(void);
>  int intel_dp_dsc_min_src_compressed_bpp(void);
> +u16 intel_dp_dsc_max_sink_compressed_bppx16(const struct
> intel_connector *connector,
> +					    enum intel_output_format
> output_format,
> +					    int bpc);
>  int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
>  				const struct drm_connector_state
> *conn_state);
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> --
> 2.25.1

