Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D156FCCA472
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 13:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9623710E816;
	Wed,  8 Oct 2025 13:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gh/rPw3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB9F10E811
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759930771; x=1791466771;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=WxehU6+9vFr83qQBd3UMikXcXggiru4owF22slvuJvM=;
 b=gh/rPw3i6ykb2ZUokWsW2imUKQiirQjQmUicJPIknrmprX2erbZO7Xtz
 ohnV0GCnH5/JCIQ4uB5o6Yj0bn/raviSXWFIgelm8tdlCThx0HUma5Tov
 HtOe3MvAUzzdJ7ZVNK1LFCcQUaDcZ7pmpWUGWnXFRE5FizavmGhuQqVQc
 LfkFftuIrxuzsvAIAyLg5177y46p0dPHwIpKtAozKaR/rRBcy9n/iwnkN
 /TzplaoIMDiUTyELl5yUiKfhoO5yF8CYOZEerboEiFQAgLS1yffr0reFP
 o9EET/idVp8+lWWe3MccVpDhA3vPgLRwTlLwYVildKXu5A0Eg5vAjrdxu A==;
X-CSE-ConnectionGUID: Hoc2jK9gTiOnRC8lM+v6Kg==
X-CSE-MsgGUID: meXEWMusSR6xvaXb57ZlFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="64739811"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="64739811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 06:39:31 -0700
X-CSE-ConnectionGUID: iqDsiF1TTJO9Yft6TTWPkQ==
X-CSE-MsgGUID: eHQdxnJQT2i1fnIc836j+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="184707005"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 06:39:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 06:39:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 06:39:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 06:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qskqo1Wwda+yBm7qKrGxF2yW0+QKQ4+pR1tIIAiPPbn4BGLcv+vD1JBYi40Z9PzXXplmFrr02+jHK56PFdHvUwpMT6k+t370HwzSAPPTVuyWA1f1t3ghSVwb9kewea2BnBScyP2a9aLNNQgCpPktEoiAUHUZXa89lkJ6X2X/VjHtEH3Qb8FpBqGWrPzpsH8ZJ5ywhasfDQtNeHwOcePsqs9gZVx1ttzL72lIE7wwcbfmYRnIdYLLyFXZ+lo+OTNXbutql7g6xeKAT6nJdWl/93qkiVH1nzk/r8UP4mJgLfRnVD1XUPVxm5jEMUN4IasMfonV4KZLON3Ift+JnRRX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4VGxkxmXMpmmgmc7CAC4Dxiyn/o3PJ9BFoXENTSPZo=;
 b=hivn3DrCjmbD62QONLFa0fEQe8XWCWaeu9n6pm2i9em5XTV3qhTdDuP+7NGCBN9ryt+PmwqfxucqtiszZIED/nOd08RILhWD9R265+/jNUT0isgzooLQR9P/rpV5qHZyv88WPpv74EuFgTT+1c1MlSX3ijS7V/OdH+MOKhJliLG8u4UWvuSdmXWimAA9ntCJz3ym5WSnYgHBe/COVZq60kbz6BRsrB6BxW0Thhe+VzOTbOC0lurIWA8NcOJnDwpdgjWkrRFp+nRj4164qPo8cxvQDBXH3HuX6BA0dB2ad/jtdaOFJQ3bSJuitH5vz6R1WlkQ3suSfUER1KGfoFQwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 13:39:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 13:39:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251007204829.1468209-46-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-46-matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 21/23] drm/xe: Break GT setup out of xe_info_init()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Oct 2025 10:39:24 -0300
Message-ID: <175993076410.201562.17597318115202277158@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR08CA0036.namprd08.prod.outlook.com
 (2603:10b6:a03:100::49) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: df32b360-d5f6-4b3e-7c07-08de0670198e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0FaVjVDQjVTSG9FSER6aGIyeGdpM0F3MFhaNXRtdWhzNm5DSWdDOVJvR05K?=
 =?utf-8?B?SmRaNTMxTnl4OWlobk1jTFJHcXN5T2xrTkh0WHRKbGxGanJTQTRFT2t4MEt3?=
 =?utf-8?B?QXg2b1kyRCt6YmQvRTNjM3N2WWppQkJVMkZsc0xIY1lrVm82R2ZBYXBYOWxS?=
 =?utf-8?B?ZlZ3WnBPNHArd2NCVlpoSDVxcitOeGp5b3FoTGlkbjd4ZHhpWUttK2VrL0lk?=
 =?utf-8?B?ZktwY09pZlc2MnRtM3VKZjNoOVBIa1krSDd5eGgrcUYyR2Z4L0lZRmZUcjNm?=
 =?utf-8?B?cjVMRithWndDTGlZS0pNeERYWXd6UTlQdk41YU5HWXFCd0x2am83aW9tUVpu?=
 =?utf-8?B?a3lXb3hFQXVUcnN4UEZ5VlhWYXVwOEpNajRySDBncFlXVEgrclZlV1hsTEk1?=
 =?utf-8?B?eVQ0N1VaeTIrK0Jzamdqd0k2ZUVpMGRUeTVMUDhFYkxRZEo4K1MxNE5jeEoy?=
 =?utf-8?B?TDRsT2VyNGdjNnVuZmRFRTFXQUdFSlRaempKbWRuZXpEckhRZHc4SHZnQThJ?=
 =?utf-8?B?SHlaaExHSlFmNkZBRVF5UksyejJtSW93elN6eXZ4bTA1aWU5Vjc5N0pxUCs2?=
 =?utf-8?B?VTRweFVzUzhXVW05MUVWY1RzTzU3RzBoNXBZRUNYSWQ3L0w4MFhSNy81dzEz?=
 =?utf-8?B?bDBvdld5MFlkSVVUbjBwSXpCbFBkS3g2bHRBb0pldmMxVWtFbzZrY2doOW1m?=
 =?utf-8?B?OGIwZUhwOWNBMlpXME1WbXpzbFpFLzBPVXF4N0gxRjg2eHNhQ1dmZHpCaS90?=
 =?utf-8?B?R1FCUnZWU25tU1QzekRKd2Zzclh4VGxoZGMrRDA5QnVDSmx5UHhsellqMlE0?=
 =?utf-8?B?L1lzTVc3TmtCNzNaY3dyZXR2TndTbnRhMDZsY1lLejhhVlpuMnlHeFU5cko1?=
 =?utf-8?B?bDlYWTU2SlRhTXdrQWFDeDEyUGlJV25xUUh1NUlXRndxRTB1WWVHalNtOE1i?=
 =?utf-8?B?dmxPWTI2aTBYYmIxQVdyNGQvQWVXaGZDWSsyUllYNDUxeU13ZmtrOHB3MDFv?=
 =?utf-8?B?OEordGdkK1BTRXBwQ1lJK21zV3ZzNVF2M0pGOUpMTkZ5UVBiV1dVRGF5YTU3?=
 =?utf-8?B?NDVSYVdWc0dCb3cyZ3NqR05kZ1JINWRhbnVNQVRaK05hcGFpdmlpRE8rV0Rr?=
 =?utf-8?B?QUtDcU5nY0ZrbHZ4MVFYdy9XMjkvNDJ2YzAxUU1SVXNhMlp2NTY3MlJzNUIx?=
 =?utf-8?B?bTVITnpaK0RVN1ZvTHhvSDFEMS96TkJpZVhXcjNWYmlKMDk3YUkvQWxYVE94?=
 =?utf-8?B?d1NCRDBvTUtrQlRzanloMWtVTDBQbmh0WG1rRjBNUzA5T0FoZ2Z2TTZTVkJ1?=
 =?utf-8?B?Smw4ZDFIZmFiR1FDT2dCZU5leStuZEtBSWdRelVmbTg0Z3pyOGJsNUd6c3lz?=
 =?utf-8?B?MzBIdHBSWGVCcDk3ZjRPaTlYZzhPQzUzTUlSZHlSa0U1eW12dis3WTkxM21m?=
 =?utf-8?B?dkpDYklpMUNYM29OMGVmMG5pUjNDV2Z4MElPVXBoL2o3UTJTd2xLNHE0S2Zv?=
 =?utf-8?B?akpZWFNaVTJ5c3pEZ2FIdldyd0NHZ2E5akNzZlBMLzRFZHJHbFVYZisvelRX?=
 =?utf-8?B?L3ZTQWUwUlNwNkxwczBaY2tDZGpMZnhac2h3cEZvR3FZV2dHRm15dXp4QVZX?=
 =?utf-8?B?Z0F0d254bGRrY1JmdlVQNDBhbTJBbnh0azNoY0pvMTJwdDF0MVFWV0g2RHhz?=
 =?utf-8?B?SE9iNitIN1RnR3VaT3I4MTJ3YjRZR3I3c2s2eUI3R2ZETWxkUTJHYkVIcW5K?=
 =?utf-8?B?UkxYOXFsRUF1dlAxR3hWQ0xZNCtxUDhOcDV6U0tBUlJqM1ZMNDhXTW5Wdkda?=
 =?utf-8?B?ZDhtUXJoVFM0c21rNFBnek9IcVYvR1BPblhDWmJUQVdXNGtQM2xPTk1Nb0Ja?=
 =?utf-8?B?MkljYmZrcmR5a0hEbUJpcVRlQ3pVMmp5N2JnK0VYcHZMZ3llV1BCN2RMUE9B?=
 =?utf-8?Q?mhH9jQAdxW7Qsx6qPFNibDHoXOn1gYmH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SktQQlJLRmRTNjN3a1VIOE5IQ3ByMjlPUWNhZWtJem9SbUNxZi96amNyaFJU?=
 =?utf-8?B?bGRtcSs1eXNTb3l4QUxEZ0czSnNMQ2FkdFB0ZUJvdW9TWm03V1NrVkF3L2ZT?=
 =?utf-8?B?Znl5a0RhaWtlZVJaa3phTU5nSDJLWjlEeUk2b3BJNkxBall1eWhSOGpoNWJR?=
 =?utf-8?B?WEZKV28xNXNXRG1XYnFQZXJGeDZmK2FZOTZKWW15RDAyV3VlazR4MFA0RVRJ?=
 =?utf-8?B?OUgzZ2VBSzRRcW1mOXJOeTYrTXVPaDBtdWIxWFVIb1B0RTlyOG41OVhWalVD?=
 =?utf-8?B?eHhjczgxTDd4cU95R2JXSGhFVU5LVlA5QWptRkhLU1V0Z3pmaDl3VHFDRWZS?=
 =?utf-8?B?a3hHWkJrc1JFSHFoVWFGSTlUb3MyL21EMUEwVnRzOVdRWjM1UGpmaU9RY0Jh?=
 =?utf-8?B?OU96Unk5MGdqdXBrMGxvdlFrc0szaklNbGp4emxvZDlpVTZ3L20zc3NINUVy?=
 =?utf-8?B?NWRiNUg1cFhaTThzTjRzWFprK0t5a2tXZGJYL09FWW93aWx1MXc4UVpoTlFX?=
 =?utf-8?B?bG1kZm5oMWk3Szh2WlpQZllVTFZzVkY1OGhOT3dod1o1SUpJYUkzS1Z3Zzdk?=
 =?utf-8?B?dEk2ajNER01BK3FtblNwV2RqdytYbXJKL2toQ08zWHVocWRPOUdaNHNiUkZR?=
 =?utf-8?B?RVJ2NVA0Uld6eDNGTGdKNU9ycXFyWGZyVHFzazFUaDFHUGp0QWNoZ0htYTZN?=
 =?utf-8?B?OGdoRFZiZW9OM21nbml1c0tMY29iZDBDM3NUWVdNRjcxMFREaHVzZy8wSTZh?=
 =?utf-8?B?ZXkyREh0MFY0MGhBMTduTFc1UVFFYUJteVFqNVZtQ1hmY2cwZUJOZzFveTZF?=
 =?utf-8?B?K0dxRjJWM3R6UktoOGdKaWQ3elU3ZDV0a29XNXNwcGMrMWpjaCtmVnNhdnNM?=
 =?utf-8?B?dENWaWhBYnN1a1BVbHZYUmN1dzVPOElROTkxNmFUZm9zYzRRdHBCR0hZUVJh?=
 =?utf-8?B?QWFrcFdIakFiSDVzSGZ5TFMzRFZLaWRmZ2x5Z2NsRzRzRDhYVUl2VjVWOGFy?=
 =?utf-8?B?bndTY2hFZE9SUDBZK29idzhqWkthU0xIdFBVYlBCU1pmM3NTaHZXYk1aQjVm?=
 =?utf-8?B?OEQrRXJHNEs2eUVQNGRPazUrSU1JalN5OWcwUHVlT096TDNUZXFQTzJRQ3hE?=
 =?utf-8?B?MitpMTZDZmlnazJPaUpJRCt1TzRwM3hIM0RsRTVhMHlvOU1sQldWMC9ieW1J?=
 =?utf-8?B?NGtFMm92VjJOdWRBRllkN3F1aEhxQ1pVRDF0NEFHdEMyekNHQjZJNktYSlFE?=
 =?utf-8?B?MEZTVFJOenMxcDJXZUdjZ3RMVmlOZWYrMWhJZGJSdVlvcC82UWtZbjRkQTVD?=
 =?utf-8?B?N2dVTDBxOHF5SWczMVEvOXZXQ2NaVm4wZ2dkNDFTanE2aUZkdnlodVQ5UmxZ?=
 =?utf-8?B?WFlMRjZONk9XRHhVV1pvbmNQTDNpc29aUGdoRUNaV1lBNVozYjVFSTl3Uitt?=
 =?utf-8?B?cFlHYzlHc1lqV1U5VHhObG5aUk16cU5raFVYRDM2QVVFTjd3SUNqRXpNU2la?=
 =?utf-8?B?OU5OeWJaTTJCRUVZWXErbzFUWmxRNVVzcDFQTzFKaGxHNXZXNHdJVzJWdDBE?=
 =?utf-8?B?WU9oMUdhOFdoVXBUL1pBQlp0RXN5THVUMXZ3dFBXMzRMclM3NmZhVTBQanJW?=
 =?utf-8?B?ZXBkalIzaEhVazh0MUlFT3lOOUtJTjliaXJhQm15R3JYR0FxWkNUU2s2Y0th?=
 =?utf-8?B?MXJPRThjQlcwdnVjNkMxU2FhbGovUThpblUyQUdXeW1lRm9hQUdYRkEyRjBl?=
 =?utf-8?B?ZjlTekplektsNU80SGdMNU1DSE9OUkhJd21nS0tlNE1TVnhHYnFmeUhWYlkx?=
 =?utf-8?B?S1NPbUtvU1NaK05LbWJvTVIyUUV5NUlwZTJVSUlVTUtvaWV3aDBBYTVlcFRi?=
 =?utf-8?B?MG03OVZwbVdFdnJOclI1MjgzZVFPK1NhQUdZSU5mR0tRQTlrUFFRdnFpaGtI?=
 =?utf-8?B?R0NsbGg5bVRMU3dXWlhYdHZtVG1jZHd5djRMdkR4dEU2NVV0N2s5dE45K2tI?=
 =?utf-8?B?THlzVGsxNDlHbXhxQloyWE1aM0lrMmRhYUVKT1A1Z3JaYkpLVVJkM0N3QkRO?=
 =?utf-8?B?Uk9xV2xlcnFDd2QxNkN2REV2T1h6QWpUSCtqbGN4S0RWQVQ2YThmY2pSTE5p?=
 =?utf-8?B?cWU2QTZReUZkZllwU1lCTGtLTDc3aSs5Y3pWTmZyZUJSWTR0Y291a1ZXNEJ6?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df32b360-d5f6-4b3e-7c07-08de0670198e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 13:39:27.1340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSW7ZHSqoNKK73UODfG5UvXV2r5nOOCpejGA4sMHkNRWs/Khv8PZAS0jWmqWbJ3GNb/LDJ4IzGT3lZDdjHaHDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
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

Quoting Matt Roper (2025-10-07 17:48:51-03:00)
>xe_info_init() is getting a bit long and hard to follow.  Break the
>allocation and basic initialization of the xe_gt structures out to their
>own functions.
>
>v2:
> - Rename new functions from init_* to alloc_*.  (Gustavo)
> - Move early NULL return of media GT before allocation.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pci.c | 88 +++++++++++++++++++++++--------------
> 1 file changed, 54 insertions(+), 34 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index f7aec1c5959b..a5932e4f4a23 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -688,6 +688,53 @@ static void xe_info_probe_tile_count(struct xe_device=
 *xe)
>         }
> }
>=20
>+static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>+                                      const struct xe_graphics_desc *grap=
hics_desc,
>+                                      const struct xe_media_desc *media_d=
esc)
>+{
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        struct xe_gt *gt;
>+
>+        gt =3D xe_gt_alloc(tile);
>+        if (IS_ERR(gt))
>+                return gt;
>+
>+        gt->info.type =3D XE_GT_TYPE_MAIN;
>+        gt->info.id =3D tile->id * xe->info.max_gt_per_tile;
>+        gt->info.has_indirect_ring_state =3D graphics_desc->has_indirect_=
ring_state;
>+        gt->info.engine_mask =3D graphics_desc->hw_engine_mask;
>+
>+        /*
>+         * Before media version 13, the media IP was part of the primary =
GT
>+         * so we need to add the media engines to the primary GT's engine=
 list.
>+         */
>+        if (MEDIA_VER(xe) < 13 && media_desc)
>+                gt->info.engine_mask |=3D media_desc->hw_engine_mask;
>+
>+        return gt;
>+}
>+
>+static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>+                                    const struct xe_media_desc *media_des=
c)
>+{
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        struct xe_gt *gt;
>+
>+        if (MEDIA_VER(xe) < 13 || !media_desc)
>+                return NULL;
>+
>+        gt =3D xe_gt_alloc(tile);
>+        if (IS_ERR(gt))
>+                return gt;
>+
>+        gt->info.type =3D XE_GT_TYPE_MEDIA;
>+        gt->info.id =3D tile->id * xe->info.max_gt_per_tile + 1;
>+        gt->info.has_indirect_ring_state =3D media_desc->has_indirect_rin=
g_state;
>+        gt->info.engine_mask =3D media_desc->hw_engine_mask;
>+
>+        return gt;
>+}
>+
> /*
>  * Initialize device info content that does require knowledge about
>  * graphics / media IP version.
>@@ -770,48 +817,21 @@ static int xe_info_init(struct xe_device *xe,
>                         return err;
>         }
>=20
>-        /*
>-         * All platforms have at least one primary GT.  Any platform with=
 media
>-         * version 13 or higher has an additional dedicated media GT.  An=
d
>-         * depending on the graphics IP there may be additional "remote t=
iles."
>-         * All of these together determine the overall GT count.
>-         */
>+        /* Allocate any GT and VRAM structures necessary for the platform=
. */
>         for_each_tile(tile, xe, id) {
>                 int err;
>=20
>-                tile->primary_gt =3D xe_gt_alloc(tile);
>+                err =3D xe_tile_alloc_vram(tile);
>+                if (err)
>+                        return err;
>+
>+                tile->primary_gt =3D alloc_primary_gt(tile, graphics_desc=
, media_desc);
>                 if (IS_ERR(tile->primary_gt))
>                         return PTR_ERR(tile->primary_gt);
>=20
>-                gt =3D tile->primary_gt;
>-                gt->info.type =3D XE_GT_TYPE_MAIN;
>-                gt->info.id =3D tile->id * xe->info.max_gt_per_tile;
>-                gt->info.has_indirect_ring_state =3D graphics_desc->has_i=
ndirect_ring_state;
>-                gt->info.engine_mask =3D graphics_desc->hw_engine_mask;
>-
>-                err =3D xe_tile_alloc_vram(tile);
>-                if (err)
>-                        return err;
>-
>-                if (MEDIA_VER(xe) < 13 && media_desc)
>-                        gt->info.engine_mask |=3D media_desc->hw_engine_m=
ask;
>-
>-                if (MEDIA_VER(xe) < 13 || !media_desc)
>-                        continue;
>-
>-                /*
>-                 * Allocate and setup media GT for platforms with standal=
one
>-                 * media.
>-                 */
>-                tile->media_gt =3D xe_gt_alloc(tile);
>+                tile->media_gt =3D alloc_media_gt(tile, media_desc);
>                 if (IS_ERR(tile->media_gt))
>                         return PTR_ERR(tile->media_gt);
>-
>-                gt =3D tile->media_gt;
>-                gt->info.type =3D XE_GT_TYPE_MEDIA;
>-                gt->info.id =3D tile->id * xe->info.max_gt_per_tile + 1;
>-                gt->info.has_indirect_ring_state =3D media_desc->has_indi=
rect_ring_state;
>-                gt->info.engine_mask =3D media_desc->hw_engine_mask;
>         }
>=20
>         /*
>--=20
>2.51.0
>
