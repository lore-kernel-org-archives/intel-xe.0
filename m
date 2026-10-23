Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A24606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RQ8Td/bc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3030112989;
	Fri, 23 Oct 2026 05:16:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4412E112989;
 Fri, 23 Oct 2026 05:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792732596; x=1824268596;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CRrr/DDf1m02F9uH0czFtGKWoRUw08tr7jbhnE7jpdQ=;
 b=RQ8Td/bc1Rl/gzRFQzxox5t6BJSBxegc0acSEOBrwwbu9yQkUPCuk0cX
 d3rqHe2MK69GxrBCVt+HLmgRYAn7azJ32GeSpYH+zwV0xrNQGFPUxgT8r
 U/1XPWwnS6gphM+/gsJ3KqYC0TZ8ceCxLTYtJ68YnMHPRgs372AlJyK14
 8ipAlGe2T61E72aEC7ZmoWhmDrV9E+Z83hv4oLNMvYSOUWWTGtze9pf1Z
 jrIBEJgoPBs5bNVPIUi03zmRhxuGvQic+Lx5LmJrCVDuPBdNmuI+9laGN
 pV2V5X1GamnCy3B7XJ4hxdji7K3f6H29VDpS12bEI3k5TJZf8V3rfH3Yw A==;
X-CSE-ConnectionGUID: dWkNNhHYSqqxuJE0RR0oUg==
X-CSE-MsgGUID: 8zyA066CTKSuqGTziZdd+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1389401"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1389401"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:16:36 -0700
X-CSE-ConnectionGUID: XQFC2aRLQ9eIyBjsiqh+CA==
X-CSE-MsgGUID: k1vqdNwcSaWAJ0Y5wb4vmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3666169"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:16:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:16:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:16:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUbJVdPx43/h6OE/YHlEf5d7odHBGVKK5AN6j4iNyVyDUuefrZzzEvRzPCJfHpWZAsoG3LU2QvVH2vFSvqOL4AHaawd+DWmcZ768yxEkP9sQ7uCtypU2PxnVnllKt2qJvbx+/ncihyTQ2coftfugF5FHZ/x6aDX/NmbMeCZFE4tSWta3WHiFxcMBVof7t0um+HxTg3PbvRgyS2VbL3EszpBwi3+AxrfzobZI0C0cx9YHj4sies4WLkmfoBwZamH5UUMX7t9HWsIYTl5wweNX318avx6dWlo/+xIZztkPWZvBLze9hUjHaiIoEC0VDjsgIRmV3tK0CX2UL7Od/BuMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jk0j7XJTRjYYq8L5cxs3zR/gZGGRlNG9H8AWvS99Go=;
 b=cAwD725CahQgv0KCfOhFMNJJtX8AWIBZdpa0WGRZBJx/1Xj4vKj5xT12LNp+a+CL0PYldad4rOKdpX3dz12Wr9XKIpsFF5XzU/3UyfG3syZWGEJZXO1GnLPwze/arPhBv6GB1lsRqRnR0CqJ45iruPy9Zx+o4w8h/9xWjBAEDEUIdIDIG05+bMPnp35aKmjzsdJflWMGQr72quH3qZ58VumaiCrMk15tv6Wi9RfxGukdDTabCl1jgwr6lAIpWWpSZw7//hNif6vd7pJP2lrwRZwHHdb8xpataaJMku9NOtkqypUsX2Ujd2l0SGFTzww1sRZE+E5jEhgV78WXRBJcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SA3PR11MB872435.namprd11.prod.outlook.com (2603:10b6:806:593::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 05:16:28 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 05:16:27 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v8 13/14] drm/i915/dp: Extend intel_dp_can_support_m_n()
 for BMG M/N bypass
Thread-Topic: [PATCH v8 13/14] drm/i915/dp: Extend intel_dp_can_support_m_n()
 for BMG M/N bypass
Thread-Index: AQHdYqvH9mlNXm2VeEm6okzBDRPVx7cKldqw
Date: Fri, 23 Oct 2026 05:16:27 +0000
Message-ID: <BYAPR11MB378301FE9514CD9263480BD3B2642@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
 <20261023050227.2068466-14-suraj.kandpal@intel.com>
In-Reply-To: <20261023050227.2068466-14-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SA3PR11MB872435:EE_
x-ms-office365-filtering-correlation-id: 58af73fe-bd05-4b3e-70b5-08df30c4ca3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022105027099003|261022075727099003|56012099006|11063799006|4143699003|261009223027099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: mt9czERXJNZtJJJXViMy7PeuCK3j/hoeDg+IvNgxT78VDgt6VIB/Q0pXgdonsO3LuOiq5ZTQ0PwcVeqSO9rGrAOaEm7xZJFTtnzSl6QTPW1p4PIgUqrNSjqTiNrx8TvoHQdkKTkH8otN0IeS+yhsgY37VrzFyxpaAhhlqaQHhPSYYwvbG4YWpscn21HUfQ5aK44zr9dUkANwIG5PVG5f7szsY9CyAaeK5rOOHIoGAmgkAUjmoc2w5k/xhNCLdUPcGuyFrNYVGIIkQcMoVG1gcaF6fjSo01qLred5awI5h1zkGZcKbw2sTYPBYPBI99RMp3Win2sotYMq2PvdFUWNEjPk7OtYSWQH4e1A946VfBtGIncL44dB7kYec2L6i7IEwUTZ81XWhM8WuCGPnOedk8EdbxSq737PRTuSZ4NLJpWCtzv/S/P7vG59XqGcM6VVmYZ7rET2uHMDaIl+7JFYcocYFTp9w9Epghtlpc/AKBBlB1w9kuhoZTEaIb9dUk6+K9phPvrMCVb3Et5bYXwgxz0ekcXTMDaQXx5+WUN0PexcPBNctKG5Hd5YKuWviQv+X3xZXJJWNJkkf9NUo3p6grtZvGhFlPQBQ5eGLOCK6N2+gk0aRdTXT4pSCNC0b155oZu7lYRCFb8SVkHnTn2hlNPv9U3q0tN4lnWAbWr5PRND32NNoCAZyEqh4fY5puLLvLcEgn3Sq6+0G53ko4TvNZOnLNTt1sjCy+GmxHwLa9c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(4143699003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CD62JC64lMzN2VQUBQcDp/wPUEFNoVIaDBJoHIC40YPQ2hE6l2JT0zJf+vnf?=
 =?us-ascii?Q?ySVwpcTd4+pKon6b8qn4yfeyQOQ68yuVej/ynZeRAwOHtmSeicyhcDnuRyIY?=
 =?us-ascii?Q?UtBn8TCLaHRunqPKb7Xd4qxZDmvPH3SUMl++/RNNXH/TgH4ucdCCmsgupq5m?=
 =?us-ascii?Q?2/7iwS0juxTWiU1TRSyRunqTRsm9dhejOhm4OxScdRMH3Oo+zofk7J7n/sat?=
 =?us-ascii?Q?h2X09mSvw+TOzZiXaKabINlZ4e4bmDIta4T5Zheim++mDYcONZi2EOGm4P89?=
 =?us-ascii?Q?ePc9OXZccL6MfW0NjMNXWUbsF/W9wDPhFGyUlwxFKstO98zKzZykcq7x8MYy?=
 =?us-ascii?Q?PaTXC2TO/TzP41CfIqKM9Tf+DiPomVi/hmIVgy+MNBFNEPOStg0pYC0pQUo6?=
 =?us-ascii?Q?oxg5aYg9pdxiN/LlqMp1oi13yVZWI4o2J5n6b/qzZ9yxFvTq+UgVAbVmBD1K?=
 =?us-ascii?Q?A8z8ikQJYvq9imUztUpnJ/D0dO5zXoIqy5u3AeuYsVyEkGg2yFfV/BvH54Rm?=
 =?us-ascii?Q?YlTPRBBhDqWzTQ2E7Ule61aWP0ymseIWlNNOHM2umaPjX3VOsltuuoiC7Pqa?=
 =?us-ascii?Q?hK3xx5hi0op7XqdDlPuU+vLT9kQsuT0jW1XBEnAuwyC63x9q3nHx9ohIcd5b?=
 =?us-ascii?Q?V030SDzxRIeq7fkr2UlFDY0s0nahdCCdQJPbUKtlhtgSsg44yb9JRp94pH5Q?=
 =?us-ascii?Q?F7/ZKvYK5dl12QZgVyNxTHCvmGwimrB1CE3P8juMIGa82WXICLee83DL0qNT?=
 =?us-ascii?Q?KBieMp3HqqXefGoTGS//UzWCdprW0luSqbI8MdJwIANhVLXQIdiFGjp+pWrz?=
 =?us-ascii?Q?pTzzjx9Jym3MQan0OuXE8PncXAmgztlvJoiJ4mFiF5dUAe9UdcSejzjCCwhK?=
 =?us-ascii?Q?8IzvB/JI1a2EEriCuajs3eNkZnuB8zpY0wD7E7fE3sZBW+nxd3u4BcK10iQ0?=
 =?us-ascii?Q?+agWcIbduykBuXvUQ840at59xrGwIprKjHftGXtghvprBBAauGys7p4r0NXa?=
 =?us-ascii?Q?JddEOfVINGiceAREsJGOGfhHEN7lSWp12a4EUFBn5U5SVlR3MPloC1DdSOml?=
 =?us-ascii?Q?EFwKZFanCHgeK6BJdnl8tv77P1jsUOwNSdFKfi1C5KquiQNDNHoDFSiSARFU?=
 =?us-ascii?Q?WE/p49HGRO6O4176RTaQKeI7wDfThXKtDFfzFu1/AE5HCOlnR+JugLyVvdNj?=
 =?us-ascii?Q?4b9jobYsD1AVeFXDH/Ktovf0SM38nvWlk7zOcipaLRGhsWJ5J/i80cggviSC?=
 =?us-ascii?Q?Q5I012YioUlnFq7nD6bxVqkzyt+wO9moKNmpWDDua+XR/qsr4YzT+0IWSlw1?=
 =?us-ascii?Q?d70LwJFnCsX7qiKO3TqAuYPNRPs8fjD+eHclEyYeDGDtCHem22hXOzpzzKh+?=
 =?us-ascii?Q?N11Vjo+f09Ydl4BJCRzqnR2LBsEPxdAxvVkE2TuGQJ52PnIhrSbD+3z+ZyL7?=
 =?us-ascii?Q?lCuXFJXczAPIGRm0KL8r+DlOsCUPPUF8zMi3tPh9trYqQ3PAJEG/PpNZEM+T?=
 =?us-ascii?Q?mkuSXiLTyrwrfPWHdqlwqPsky4Gg19pOSLVsVP0gIuNOtRVemLeRgxTJqmSH?=
 =?us-ascii?Q?CCTqNGrZtelCE0RhmrBYQI9dQwd4FTLnOoHaltpB+0Z2fUaEQPjbzWEPozJZ?=
 =?us-ascii?Q?LDIvEmp5LYxNQLAL2GyczWlvOMn6+nxwCMJIZSsmS5BcVlCwRMz6owzWJ/SG?=
 =?us-ascii?Q?BxFTpM9OaDuoQSizK2lSH53hpKKIM8CquLjaq+eRTaeSaFQOQTv4YE9uAAWR?=
 =?us-ascii?Q?2Rnqk1ZT+LWN3lioZxHn8cASpXdxwDlF0zopTu4yZMaQtsaD+Wsc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JwZDQTHTCAWe1+kXaDqFPoPd9iMobCGB6uzDmZ5+KRG1eEyY7A5JVi+CulTANI9YDQXg446kw5f2L/NC3fHhv6eWi1XfwpUl/gEcgCVE25jWdtPPZudDkeKyn5Gz+CDASTWfyA+tmTNMClmGyjg2Pymyp93RlnUx2XT8/MDWZm4Gav3S64e7U5IOyMK8FG8rlO9h1ho7//6ynKDzjnRZ4yXtTvWjw+B/BTnD7LaeF/GXCa57ZdIXKnFk0H+s9ouXZ7M2vjEwr8act+s3X+7x4qiaORCRQaeix+XDdYqMzvzlwvHAp62q3L212WwVn6am/quXNjzX1oOshC2hE4lXFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58af73fe-bd05-4b3e-70b5-08df30c4ca3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:16:27.4457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGN8By5IgNYMFmlz17mqjj4NK6nswE67+6mDRfdqnUhdVhG4z5/bPEsbSdFabUiRAWb0rM5lDuvr2LD+BbCrooG3/MTMNX4dGphU+HSp9Gv6wiGH388JOO2jm7JwpKIv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB872435
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 23 October 2026 10:32
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v8 13/14] drm/i915/dp: Extend intel_dp_can_support_m_n()
> for BMG M/N bypass
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> On BMG platforms, the standard M/N ratio limit of 10 can be bypassed unde=
r
> specific conditions, as permitted by hardware capabilities.
>=20
> Modify the helper intel_dp_can_support_m_n() to account for this by
> checking whether the platform supports bypassing the limit. The workaroun=
d
> is only intended for 128b/132b links, so restrict it to those.
>=20
> Put the bypass condition, a UHBR link rate plus
> intel_display_can_bypass_m_n_limit(), into a helper and use it from
> intel_dp_check_m_n_ratio() as well, so that the prediction and the decisi=
on
> on the final state cannot drift apart.
>=20
> During the mode_valid phase, the check assumes that TRANSCODER_A will
> be used, to allow the mode where the M/N ratio is within the limits for t=
he
> workaround.
>=20
> v2:
> -Keep the helper static: the MST mode_valid now goes through the shared
> intel_dp_mode_valid_m_n() rather than calling it directly, so it no longe=
r
> needs to be exported.
> v3:
> -Use the cpu transcoder instead of the pipe, following the change to
> intel_display_can_bypass_m_n_limit(). (Mitul)
> v4:
> -Share the bypass condition with intel_dp_check_m_n_ratio() through
> intel_dp_can_bypass_m_n_limit(). (Mitul) -The helper is exported again, t=
he
> MST mode_valid calls it directly to check the ratio against the maximum B=
W
> configuration. (Mitul)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 28 ++++++++++++++++-----
>  drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
>  3 files changed, 24 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 73c67565a329..772006691882 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1286,10 +1286,20 @@ static int intel_dp_link_m_n_ratio(u32 link_m,
> u32 link_n)
>  	return DIV_ROUND_UP(link_m, link_n);
>  }
>=20
> +static bool
> +intel_dp_can_bypass_m_n_limit(struct intel_display *display, int link_ra=
te,
> +			      int m_n_ratio, enum transcoder cpu_transcoder) {
> +	return drm_dp_is_uhbr_rate(link_rate) &&
> +		intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> +cpu_transcoder); }
> +
>  bool intel_dp_can_support_m_n(struct intel_display *display,
> +			      const struct intel_crtc_state *crtc_state,
>  			      int pixel_clock, int link_rate)  {
>  	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> +	enum transcoder cpu_transcoder =3D TRANSCODER_A;
>  	u32 link_m, link_n;
>  	int m_n_ratio;
>=20
> @@ -1298,7 +1308,13 @@ bool intel_dp_can_support_m_n(struct
> intel_display *display,
>=20
>  	m_n_ratio =3D intel_dp_link_m_n_ratio(link_m, link_n);
>=20
> -	return m_n_ratio <=3D max_m_n_ratio;
> +	if (m_n_ratio <=3D max_m_n_ratio)
> +		return true;
> +
> +	if (crtc_state)
> +		cpu_transcoder =3D crtc_state->cpu_transcoder;
> +
> +	return intel_dp_can_bypass_m_n_limit(display, link_rate, m_n_ratio,
> +cpu_transcoder);
>  }
>=20
>  void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,=
 @@
> -1315,9 +1331,8 @@ void intel_dp_check_m_n_ratio(const struct
> intel_crtc_state *crtc_state,
>  	if (m_n_ratio <=3D max_m_n_ratio)
>  		return;
>=20
> -	if (intel_dp_is_uhbr(crtc_state) &&
> -	    intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> -					       crtc_state->cpu_transcoder)) {
> +	if (intel_dp_can_bypass_m_n_limit(display, crtc_state->port_clock,
> m_n_ratio,
> +					  crtc_state->cpu_transcoder)) {
>  		m_n->bypass_m_n_ratio_limit =3D true;
>  		drm_dbg_kms(display->drm,
>  			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
> @@ -1388,7 +1403,7 @@ static bool intel_dp_mode_valid_m_n(struct
> intel_dp *intel_dp, int pixel_clock)
>  	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
>  				      INTEL_DP_LINK_CAPS_FILTER_ALL);
>  	for_each_dp_link_config(&iter, &link_config) {
> -		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
> +		if (intel_dp_can_support_m_n(display, NULL,
> m_n_pixel_clock,
>  					     link_config.rate)) {
>  			found =3D true;
>=20
> @@ -2777,7 +2792,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp
> *intel_dp,
>=20
>  	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits-
> >link_config_filter);
>  	for_each_dp_link_config(&iter, &link_config) {
> -		if (!intel_dp_can_support_m_n(display, pixel_clock,
> link_config.rate))
> +		if (!intel_dp_can_support_m_n(display, crtc_state, pixel_clock,
> +					      link_config.rate))
>  			continue;
>=20
>  		intel_dp_link_caps_filter_add(link_caps, &new_filter,
> &link_config); diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index ef5aa28617f0..1f4a3aff9abe 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -241,6 +241,7 @@ bool intel_dp_joiner_candidate_valid(struct
> intel_connector *connector,
>  u8 intel_dp_as_sdp_transmission_time(void);
>=20
>  bool intel_dp_can_support_m_n(struct intel_display *display,
> +			      const struct intel_crtc_state *crtc_state,
>  			      int pixel_clock, int link_rate);
>=20
>  int intel_dp_link_init(struct intel_dp *intel_dp); diff --git
> a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 687a12e995c5..ed130df0b615 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1567,7 +1567,7 @@ mst_connector_mode_valid_ctx(struct
> drm_connector *_connector,
>  					   min_link_bpp_x16,
>  					   bw_overhead_flags);
>=20
> -	if (!intel_dp_can_support_m_n(display, mode->clock,
> max_link_clock)) {
> +	if (!intel_dp_can_support_m_n(display, NULL, mode->clock,
> +max_link_clock)) {

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  		*status =3D MODE_CLOCK_HIGH;
>  		return 0;
>  	}
> --
> 2.34.1

