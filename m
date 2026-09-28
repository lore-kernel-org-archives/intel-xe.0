Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C250CA5FA5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 13:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7B10EA42;
	Mon, 28 Sep 2026 13:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNG23SAQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB10810EA40;
 Mon, 28 Sep 2026 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790601641; x=1822137641;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Atntx37GDB1HcHZCkn0fBYfHYzluCXaCblZPHcxhobs=;
 b=QNG23SAQPXA0P3ZQLVMJIIMdm+Dln75u2hW46RJIz6CGcHEkqd+MtfEE
 TfnhaJ48Rf9tkVw+FlB5P/XtI6OXSS/CImz9O7yGbNaO5berMo0stBkad
 QJjk8l2h3blzZ3znofnC2tJ7gfi4CNBA1/zryIoOjoQrfXiv69hTHsNSY
 HmUs5qIzGmV/vGD9Dkr8+vKJB01G2WajWr3sI2foY1y0EqxsD61I1J7Bm
 EM4cUcMzF0PcvRZ6BeuFCJrudQBOtdMr6Z6k6KlTzVyX7u0vkZD0n2KXd
 kAq+C1WgN+K3keBZJyU/IKtRepjKBSG4wUXGvLG4i4Ev2YTPG4v3ALkpc Q==;
X-CSE-ConnectionGUID: oGFHc+gTSJKsFw/GQewLFA==
X-CSE-MsgGUID: lrX8Z4vMR2+t4Oox46uWPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91318494"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="91318494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 06:20:40 -0700
X-CSE-ConnectionGUID: yenRvH0PRuaMp+h7dPTsDA==
X-CSE-MsgGUID: 2Mx8choWQ0CkSKrlaQRncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="312970570"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 06:20:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 06:20:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 06:20:39 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 06:20:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zW/i7+j5sr3TdsrpANnpsFEl+bEIitjvPLojSLA2i1/ROkOLkwzVwsUk23luK/cKaQB9LOfQTo8ObvS1EFSXzjuf7zqrne8iE8as32dtRziq2Eo4XdWZ8IRxNu/jLRtBRADnwpkLfhzO8zoC8h7bLOPb9o3UebviD62Zhe3Be9ZuEfRrJwnzawxLr1BNtKpX7tZBIsrBz/u8k5MwbcU8pz4sKVuCeOtpeEKMzYdoEtLE40h+y7pIHMbP0vug03DYhY8C0teHvreOxC0XfrfpYOqLosFAxzy2EbH+Sn5n0U2z/ZD4XHabX5yuVxAds/sRmrRlPsWtPHV3lrnTz3qKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ginZbDApmFJyYjTdis37RCaD2sVXlmD9xpqXbdGleu4=;
 b=CuSL+AEbrw37z9Ict1zZuHbYPDaixE5eA16G12y91oVaWA9iUkWVdkptJnc5eBVTbQ/wWcLQgrpHrch/8tT8SlnkYZp1PvPsdgeIgDL/kkUWu6kMgBlVI0iBoXvLuMKvP1DMZFmVaNdYnPpTgo/nlKLUHQgMV5JLaP78XwbGqYlBMQ0IlA9kwobNhFFVBTZKjsXcWTTaCLP8052wzLQ6BhKw9x7ru6eIVy3QVPezTYI0YplyINmsBz9robL+c1oayXIhcLGnD5npfnkr5WHTzjLKByLeZXh3GWd9tmWYJW1Et3x+G1HNemBAjC9qpl2XIGh3QOb1V8Y3j5EF79QcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3787.namprd11.prod.outlook.com (2603:10b6:5:143::10)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 13:20:36 +0000
Received: from DM6PR11MB3787.namprd11.prod.outlook.com
 ([fe80::8ae8:5fb9:cf27:18dc]) by DM6PR11MB3787.namprd11.prod.outlook.com
 ([fe80::8ae8:5fb9:cf27:18dc%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 13:20:36 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v5 2/2] drm/i915/dmc: Add sanity check for DMC load address
Thread-Topic: [PATCH v5 2/2] drm/i915/dmc: Add sanity check for DMC load
 address
Thread-Index: AQHdSpdYtYBeTN5RaEe4nV+ywrXY77bkAwbQ
Date: Mon, 28 Sep 2026 13:20:36 +0000
Message-ID: <DM6PR11MB3787A09208ECA6A192888E95B28D2@DM6PR11MB3787.namprd11.prod.outlook.com>
References: <20260922133535.3180973-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260922133535.3180973-6-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260922133535.3180973-6-dibin.moolakadan.subrahmanian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3787:EE_|PH0PR11MB5063:EE_
x-ms-office365-filtering-correlation-id: 1609ce0a-a228-42d7-b128-08df1d6348b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: iEub+YPcgBEgGXuTnB7UmNFeXU4XN2rRD3A59IMSdck8XLPJJ1/0XyMeeP/e7bUuJZhkH5wuhH28VsnDoKfX8BtOdvtFSDvRX+23O6a7sjZ+ioUAHAoDpIoFH228yQ1fSoYIeo7xXFlR29C5rFVVOGxvSVM56z6zQ/BmAJhP+3pCbarzg5cNMFdKLic/I6b7+LdbUWQG26u46Y2t8BzN5fBxPvQ40dlIou/lmXYGEPblpBM4SPMRPy4v2eJzKisrR/9V6bcjuG6UQcFqutwMkYlfh6WVujHhfUTQotPPlO7NLiseBdqBFw0RjPT1ZtMn1f+r7tuxYTo/uVGtJq6NTryYq9BAjBaJuTsHAyRHJXaJPBx93mCeQlBd2qOfy2gcKlTeVVL1M5Z+eftNa7IWyodme08MftPF2C/XU/1sFKk6JtEl41HEcnU8tKM5Y7K9+el9oklFr6F3CWvpcekYBEAiWYRdPv7JQcNZVu00AOwh+xMF3Ye04kBFcVQ/otVC5gm7BHj5xt5qLPIL71SiE/FkjNRmUO9XgtLrbT6iGuK28JBO811+nX5G5DevY+tx2qBvESMlfUwXQuDY3f8RjQKnREjqjqtoIE3XbS8eycAK1Ti9bVSHkAC8t92RuXgMplz+VKqLRkvOfU6Qbwpzzof2VYUxZSF5syVX9aVLNe1gw02K+0LhKvvLewnkiOIfbfjlQDbGbeveGVJeqKnCC+/cpvq/i3NCf1BGuEPlNiw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sdpv4jetq5upi2MfblU3ajKDvxUuTj2C7r79JdB77lCmn/baamtj8Kz3RMFh?=
 =?us-ascii?Q?CL9hzXsSTNQqtm85jmby9pl1+Y9uYvy0CdHRO6aFuY2mfPwV40rOex89meHt?=
 =?us-ascii?Q?jd3x5OlXZDJrC1nr70SRT6cywG9dp0to1RFgSYtCBFz5UPjR2+a6U38d5BxF?=
 =?us-ascii?Q?8sfkjGrCDgFJgVj+0lMUUJ/Ul9PUDs07bqMlRZrgdFmTEXdQseuFx0oJ4+6X?=
 =?us-ascii?Q?t/IFGZEszy9Gad1HImsMtM3nXYXiQ30utXZWSHWKwjlruyfU+uuukbM18cGE?=
 =?us-ascii?Q?AKqY2HgZe1fsT4bcCNCG1+KVOq5FE95iu1KYGlbnfvOuY3aqDDIyDNxsvPKk?=
 =?us-ascii?Q?tFaF3rtfsqUWFK8oT0CrkEAxENcGmpBfSHFI7cNZdzisIoSk0UtUYRs669CK?=
 =?us-ascii?Q?XPIEEnXrtpdC92HB4ZzBFtgES9gJ6DFQ9s19vBxUReIXwsFo/h3LoEcmi3vz?=
 =?us-ascii?Q?Wvfl06X7zRov1p8Lizpm5u6T7UvCicxogOMCtRRbFTuVgxtDRxCq0g83Mmwe?=
 =?us-ascii?Q?JzXwDLEELz4SCWCAOR5GkBs0v3JuBgdqNJXzlCzKFw/jP+J/8H4v8UTEOaci?=
 =?us-ascii?Q?R1gz0coc5dzBTIOYnJn/YZkunWlqsm5kHubrkWv9EhS4dT2jnAbowbJ8sog9?=
 =?us-ascii?Q?RnSN1kbN3GRQUj8xFn9ZjGDrFeaUn0FtgF60/PVjEuV0iNlHJbyD5zSc+0AM?=
 =?us-ascii?Q?PYbJlmWoT3uiqtUHFZ+peQpfDQssbukomiBbffnTru8eERwDGTxf4CSS5kqk?=
 =?us-ascii?Q?Mz+ZOElYLNe/mOM8ru3B51k6kebT/6wjX5faIxQxC0iX5noZu8v9Ac17NaYv?=
 =?us-ascii?Q?4RV4HnffeBijnsQcxafSSvh/v8/WVbUZ48FHo32y6NG4qiI4mrO1VzHlZ0v4?=
 =?us-ascii?Q?aaDDZaGw7YwkJwRX1QgefR9EalR36xvvSLSb3X/aOqpJTQiGneequshc3gHH?=
 =?us-ascii?Q?Hdo4wQF/G/pWZN/WMPIJBPKjO5S+ACngnbhmCdbfW8SFFS8gjtQmEQJY9r6U?=
 =?us-ascii?Q?AkL9/8MNzW07Xe9QX1Uw9pz08k+nIjnBKHzS0gXmXO5K8dquuZWKiwNQL8ri?=
 =?us-ascii?Q?fGef4yoXyYLzaBKwev6/0CwauYrvAkVyDARsVVwPipWavN/2t++1ssNXY0aq?=
 =?us-ascii?Q?0L1txI37RfJZtNqq/LZtatGmrhkgDbraDlYylvhn0HbV5MrsFK3bQd/T2FqE?=
 =?us-ascii?Q?S8kyRRrJ/c1hosKiU4pnDruOEhtiG5I24R6MsVjtniKiFl8Ip5MLeIrnzQUv?=
 =?us-ascii?Q?xjKyyQdl8G9JdZGViNoif457PBmCit1ERZQOwK1OsH/Xt81byVQT3fAWh9A5?=
 =?us-ascii?Q?QOcfHHaRwb4C6sJirXtFjeQcHWQ9XPFtH/noQ8UHCo9+tnZgaqcbqU45x0hR?=
 =?us-ascii?Q?CzAGO/3vKHhPLv8Wb8Yvhb9ZqtP48sXu+O3+xXk2Z0DGrw7raha+r5MO0ot5?=
 =?us-ascii?Q?Q4PxShsCRo/OznPlRDDuxDk0xG2Qlj+CbBWoXnRcEQVkHE0WTXAz1+gaTlMk?=
 =?us-ascii?Q?vRBQ0v0Sv4nax5VdVht2YuDav48ciEIZqZ0PA6pkAQx6qyBk3YzAEy95l099?=
 =?us-ascii?Q?uh4CyuM/sBpsyGxA6yaroRqWtpyJp/KaFZcIrH75S23LWiZIdn+1xGMiuqEY?=
 =?us-ascii?Q?W4GSDA60YYHsoaTXpXSomk39CwyXz5gdaSYNImAV4xeD9bpUUBzwr/bjH8LI?=
 =?us-ascii?Q?4lTDKEVxw1XpuutOsiCL8I2aELY5u4th4YGsfMSMkj6Mtsdt4Yr82hKbq3kC?=
 =?us-ascii?Q?DLe4gTVyxq8+1HM4pqi09ChrZhBvTFM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: w7Qd35E6Cj9A1u39ibYjSX2+MP5YPCIlEmjo99iU47TCt+L2d6xFrY75RiUPfjD/+G6hWoMPQoMknvTkovlXd4EucUUeELe/qaCqWmHIwBSCEHBaIj7wiS3+8rIVYFdbqR+DeFkzRwNZTadsZ3+y682HjLdMOVbGbWlRw5Keu3da9mIOIdXl/Fw240XOnJUCeyY3USPJaAjR7NtUBMxg7pAIG/ablPJkx0EDAKjmt5BcIwSmrw7pZfaervGnsrLHlN6kUSC1M6b33Dlcj9X0MXwoeQO0JjIhcASxa21gvWFVk63hy8HA8ZNKDo77E/kUYiCYD6NLQ6USGRtpuk4CYg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1609ce0a-a228-42d7-b128-08df1d6348b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 13:20:36.7951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z41LsMnc+TV5SyYvmF8h896h2GJvT56TbOApC3RZ+IYL+jbRDpTcxk+bli2WpJf20VcrltwM9iYbQaUYvnx9gL0g7MW4Ove9q1TTJLguwXidUli5kFByeq8snG8EgPpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
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
> From: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> Sent: 22 September 2026 19:06
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> jani.nikula@linux.intel.com
> Subject: [PATCH v5 2/2] drm/i915/dmc: Add sanity check for DMC load
> address
>=20
> For DMC firmware header version 3, the firmware load address is stored in
> dmc_info->start_mmioaddr and later used by dmc_load_program().
>=20
> Unlike the MMIO address table, the firmware load address is not validated=
.
> Add a sanity check to ensure it is within the valid range.
>=20
> BSpec: 69671, 68378
> Fixes: 3d5928a168a9 ("drm/i915/xelpd: Pipe A DMC plugging")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude-Code:Sonnet-5
> Signed-off-by: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c      | 55 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 ++++
>  2 files changed, 67 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c
> b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 725481012578..6611765fd62c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1023,6 +1023,55 @@ static void dmc_set_fw_offset(struct intel_dmc
> *dmc,
>  	}
>  }
>=20
> +/*
> + * Check if the load address is within the valid range for the given DMC=
 ID.
> + */
> +static bool dmc_load_addr_sanity_check(struct intel_dmc *dmc,
> +				       u32 start_addr, u32 payload_size,
> +				       int header_ver, enum intel_dmc_id
> dmc_id) {
> +	u32 start_range, end_range, end_addr;
> +
> +	if (header_ver !=3D 3)
> +		return true;
> +
> +	switch (dmc_id) {
> +	case DMC_FW_MAIN:
> +		start_range =3D DMC_MAIN_PROGRAM_BASE_START;
> +		end_range =3D DMC_MAIN_PROGRAM_BASE_END;
> +		break;
> +	case DMC_FW_PIPEA:
> +		start_range =3D DMC_PIPEA_PROGRAM_BASE_START;
> +		end_range =3D DMC_PIPEA_PROGRAM_BASE_END;
> +		break;
> +	case DMC_FW_PIPEB:
> +		start_range =3D DMC_PIPEB_PROGRAM_BASE_START;
> +		end_range =3D DMC_PIPEB_PROGRAM_BASE_END;
> +		break;
> +	case DMC_FW_PIPEC:
> +		start_range =3D DMC_PIPEC_PROGRAM_BASE_START;
> +		end_range =3D DMC_PIPEC_PROGRAM_BASE_END;
> +		break;
> +	case DMC_FW_PIPED:
> +		start_range =3D DMC_PIPED_PROGRAM_BASE_START;
> +		end_range =3D DMC_PIPED_PROGRAM_BASE_END;
> +		break;
> +	default:
> +		MISSING_CASE(dmc_id);
> +		return false;
> +	}
> +
> +	if (payload_size =3D=3D 0)
> +		end_addr =3D start_addr;
> +	else if (check_add_overflow(start_addr, payload_size - 1, &end_addr))
> +		return false;
> +
> +	if (start_addr < start_range || end_addr > end_range)
> +		return false;
> +
> +	return true;
> +}
> +
>  static bool dmc_mmio_addr_sanity_check(struct intel_dmc *dmc,
>  				       const u32 *mmioaddr, u32 mmio_count,
>  				       int header_ver, enum intel_dmc_id
> dmc_id) @@ -1189,6 +1238,12 @@ static u32 parse_dmc_fw_header(struct
> intel_dmc *dmc,
>  		return 0;
>  	}
>=20
> +	if (!dmc_load_addr_sanity_check(dmc, start_mmioaddr, payload_size,
> +					dmc_header->header_ver, dmc_id)) {
> +		drm_err(display->drm, "DMC %d: firmware has wrong load
> address\n", dmc_id);
> +		return 0;
> +	}
> +
>  	dmc_info->payload =3D kmalloc(payload_size, GFP_KERNEL);
>  	if (!dmc_info->payload)
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> index 6b7978fb8986..324320afad58 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> @@ -521,6 +521,18 @@ enum pipedmc_event_id {
>  #define TGL_PIPE_MMIO_END(dmc_id)	_PICK_EVEN(((dmc_id) - 1),
> _TGL_PIPEA_MMIO_END,\
>  					      _TGL_PIPEB_MMIO_END)
>=20
> +/* For DMC header version v3*/
> +#define DMC_MAIN_PROGRAM_BASE_START	0x80000
> +#define DMC_MAIN_PROGRAM_BASE_END	0x86fff
> +#define DMC_PIPEA_PROGRAM_BASE_START	0x90000
> +#define DMC_PIPEA_PROGRAM_BASE_END	0x96fff
> +#define DMC_PIPEB_PROGRAM_BASE_START	0x98000
> +#define DMC_PIPEB_PROGRAM_BASE_END	0x9efff
> +#define DMC_PIPEC_PROGRAM_BASE_START	0x52000
> +#define DMC_PIPEC_PROGRAM_BASE_END	0x53fff
> +#define DMC_PIPED_PROGRAM_BASE_START	0x59000
> +#define DMC_PIPED_PROGRAM_BASE_END	0x5afff
> +

Changes LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  #define SKL_DMC_DC3_DC5_COUNT	_MMIO(0x80030)
>  #define SKL_DMC_DC5_DC6_COUNT	_MMIO(0x8002C)
>  #define BXT_DMC_DC3_DC5_COUNT	_MMIO(0x80038)
> --
> 2.43.0

