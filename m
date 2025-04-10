Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F5DC369A6
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 12:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655A010E973;
	Thu, 10 Apr 2025 12:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+WpKxXT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E228E10E973
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744286793; x=1775822793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aokfT7Uvyw52JIcN72bTSp2rVN6Ue6slXTzcdtoOiiU=;
 b=V+WpKxXTzs7c4m2dUkFePTet5QssOL/BVqBsx0DTxdu9Wd08rYGXkIqY
 E4d6a7RmdDqE5KCVvbRs/+HV+/9OYtunEoQ5PHUUGmw7tj38ICE48CLia
 aahn1RlhlPPBscnCRujSLriL61Wuz7Aqb1oIEnzAp6/IqCY91+LI4xCTJ
 9vyf9K4WQlEQ6F9XkjVyBm1zvhsRp7RDaTd6cWX588BqMsXhOjo1vljHs
 BbZOIxdjCn9Xqs+ec5TT9dklzkhZK44L1/O6r3Y+CIUdkFNOrJ9p09CKr
 2g1nvRp9LMeFISFUIggZv171mBXOs7gPyxD4b59E5jJdlkdejjv44Yv/j Q==;
X-CSE-ConnectionGUID: 1BmkMHLsRVCkcsabhzg6dQ==
X-CSE-MsgGUID: KPDzlO4JRSuh+rCx4yKxfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45940059"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45940059"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:06:33 -0700
X-CSE-ConnectionGUID: 68fvKIrxRU+6/AY/yu7tsw==
X-CSE-MsgGUID: z1eNlMKQTjG4nc8kdjNoXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129830615"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:06:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 05:06:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 05:06:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 05:06:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOmaedevvAaIZBtAkxaFxjbTcmvNXpMD8eMoyIdAgwkEV/1CoF34vFsDIgHHTkI2d/QxUsoNaCeS595TazEEvgF9PgG82FQhbQmB1IOifIf5MizIXCO80cdKlUytu+4H34zopgrDjn3OivuufBMS88Q92jkFDpwdwzNIDvBQOJWZvPNYJlL/R/xsrskqtVfYrLVod4qnJeC/6uWqm0ySKolpcsdTrDDkdkLOgmo0BGBFfY6Pj3aguBQXK/LpttScfrYgIaq3NAlFI+YXbhr7+dGtrYUN6TiFqQUH5fn/nqaJv9wLJstYlDoUIPkBvwoVDeZHDJZKbcwv+L50Qti+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIdYjNhOv9QotLtvRLeP/vboz3mCj8o2ps0oOFbc4kY=;
 b=R+mJ3Oev1nJnvsnZ3HEdd0ZxZgmuYzghr0+3uu6w65pKhQSnl/GOHdJmPg4DCFyMdbWF22r0qBgaPKP6aubTQfalT8ZQiVJtE5yQQXf7wrlsMqmYjSGmI81auJt/BshdNH1Lq41B2pzLK54Fnr5nQtRao0fIoBumGPMaYPPK7SFCp3atkt7kMAe+y+YhLmj72HdWlRF1XCtZMUnRVvtZBWKHYldJMDEUffoCENe5Ne2USFFWmoigRvabmrn13swvxiLO8n4NkwP6KNUO2HUHroxe6pyFQgKC4uMA0Y6WMBvF7bF6XvMbCig+T0xj3FqBw9yBCh7mIk8oO4JWl2HzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CY8PR11MB7948.namprd11.prod.outlook.com (2603:10b6:930:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 12:06:29 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 12:06:29 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
Thread-Topic: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
Thread-Index: AQHbqgfkpGpzN3e0PkCbd23AzW0l7rOcvq2w
Date: Thu, 10 Apr 2025 12:06:29 +0000
Message-ID: <CY5PR11MB62113A236791FC539318DC9695B72@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
In-Reply-To: <20250410110057.2497056-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CY8PR11MB7948:EE_
x-ms-office365-filtering-correlation-id: 418a2f79-a912-47ec-c9ee-08dd78282065
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+x9dwHdfC/UNPOb2CRoLNg5rtURDSt3tAekEd6ng3VnGP89wqN0u5WWG8714?=
 =?us-ascii?Q?MSZvyIWI/+91Enidculcjw/QDpgg+5GktnkLCLxcOdKKYd2wFgtjJmpshucV?=
 =?us-ascii?Q?251wPxlDKDii7N7tMdaJU39Br1XndnUNY/4/x9PzhL0/YF2FdT07OVnt8h58?=
 =?us-ascii?Q?TigXqptFPjQZgb7zRYskEObBuIlnoss03BNSXfri3VwJLGki6TZv8Sk1sqT3?=
 =?us-ascii?Q?nSRxV/IijqdHKkYPDKBF0OZZWl84s9MRbqB1Z55Fj/ivxN3rrrvGI6ofyDEx?=
 =?us-ascii?Q?UDtbEIFNmZFFDbkePHeMBRQ5jYBK70+hHKUW7T6/lgB9iBmA3OiHkywMqolz?=
 =?us-ascii?Q?9o2Svs0nnba6dKlvol7i/thd5YrB54o+wqmutZrOy61Bsm//S291hi3BT/4F?=
 =?us-ascii?Q?45yLT/5A0RRL/dbe3sfvatCYgS1HXrbsf+BY9jLYnSlevEis5+xIxFGJWH/s?=
 =?us-ascii?Q?RFknK3TzNb3qD0+AGYhS0Co/lmC9Yby9FyGchZ0QOah5hib0M7xCNqCgVm1D?=
 =?us-ascii?Q?LN/bvnHc6GNt+gmgHhNzdUBlnNizwwygi/N0Bd8j8FT1uzLvERsNkebUHhDH?=
 =?us-ascii?Q?8DOb+yMdXKvPcFipW6BDTlFnqxMcrKAv/kQENfus/4sBcslRAbfSEVNXlCHk?=
 =?us-ascii?Q?wMbiwVkrydTATF8aRCy21hiu1202qEUxvL3LNWUNwGwDki5Tqd2wyHZ6sQ+h?=
 =?us-ascii?Q?WebfJ4NJhXPRMsHuUTiGAhwv7k3l2T5oniveQlSEstTiSjTI/yjfRmFp3Wjr?=
 =?us-ascii?Q?SQ49XRDnkLIkxz+MlxGrEKLd8koD7qJh6kdK8wb1BB4DSuYruGCk/CZzOrIo?=
 =?us-ascii?Q?zhAbnYZDDsnYXjv8s9BFaP1fjxzms8v0Pl2KK7TI0MFKv6hozmbpS0VJlF3J?=
 =?us-ascii?Q?deuYtn7Fhmeh08ojiNcmOprGBbxpFJhoLsVp8ZiATgWUpp/uixv+V5mS3J/w?=
 =?us-ascii?Q?FgDqUZlcsFXyU6uryoGY07WdIcHk7MEEEdA/Cc1Gk4q4UPf2xuJ8lVawb4si?=
 =?us-ascii?Q?1DdHhb2mAM+JutDOPGqrBKzluYcLB+yYIfMpeSFYT/Smw3HHp+F38dI578O5?=
 =?us-ascii?Q?pd687bBMfcevg2phg9TjXPOV+nobxs0YG1sAKasXb6bihesA03g90NF/dVt3?=
 =?us-ascii?Q?m4sqbV2rQFLcYVPAzRIbNoJqM7L7xs7uqUS3U20pjRckvn+nrNo2sqCTxrJy?=
 =?us-ascii?Q?IRTNiicnNQtArbC8lGHOr1xF0bmXmkzlgLByv/6yA1m5iEStPbdfE02itdCx?=
 =?us-ascii?Q?3wGDpGNcZXRgklTbpqjylaAR+qPrs5Cnb7kNgL2aKeVe5OJuiYrARiKDse3w?=
 =?us-ascii?Q?TM+Ll54fSL9ns3pzaVmxzewebZDELFMtGM5aN7ZCnrLEAAq9g2BbZeWiZSi3?=
 =?us-ascii?Q?XRGTwgzksX80AurZ3P9DYg58EQSEXbwq8YAD3gZ5OwTDzXD68L+9Ee9avnAA?=
 =?us-ascii?Q?HB2OGlUKl1yN2ZB73Wa+m7Y76TNm8jlQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D5L9JxT6gCoCNLQIbj049klULzA1wysE3HoIyjy1WGV1eKC7ZspAptRsOqGN?=
 =?us-ascii?Q?Cv/KAjF99S2KhRz+8MxNC4KKb02KUvr4A3xVYp/ZPR1PNieA+kfYzO8uSoNP?=
 =?us-ascii?Q?QKNn9kXlAknmnPE87k64QWEBQPr8PIhD9UPXrZhn1MgQ4YlEF8cIEVR/qJgf?=
 =?us-ascii?Q?K68XS7pF59MTX22VJ3xKvLF4ARXT7uc5ACn3xKW4hmGT0lxhb1rsUGCoIjpc?=
 =?us-ascii?Q?Ut3oolZM0Nthf+tU2XmBFOgt4GYSuxdzhpTGRVNDAOu4PwiSUVURGDQGa2Ov?=
 =?us-ascii?Q?ZkzL9rdj573ZFYGFnmpoc7ZG54HLjvJYHp7fwfK9jzYyOJO9xRgH65wl1TSg?=
 =?us-ascii?Q?4Kmb749rYoAt/xGksOvaIbz+iJKAvSz7/l0A2iLuRGNNghXGhdXxBXipgjWK?=
 =?us-ascii?Q?+z5PJNPf7yiDppoHx54CjpYXF1jMaRiHP+gUC7yhrnkGj9sylY2MqMS28XG4?=
 =?us-ascii?Q?nKWkqz0KNDFqJs/KPS/1X8j3V1YARw1OBQo1cSLqZc1rgRRhqOYehtPW+e/A?=
 =?us-ascii?Q?at4rSI0NLPWw2ycCL9x4VKDLQ9v3magbqP7qqqeu+2shjw0T4PTQSBBeiSt3?=
 =?us-ascii?Q?BQMnyHy0d7urcYCebtglsWoZr+kWh45N3SOIhr0NJc1545BLgz9E6qlLJjHE?=
 =?us-ascii?Q?DhWMehsw31fwTKocHAKXxT4Z73hzFHC5tIZOR5v1fww84S/i+vG8X7pMBJNW?=
 =?us-ascii?Q?YJjS6EwYPWy4Oaij+7yit+BRyu+UZ/VhvI03Gr/O9E2bZyAVQ8siIWfqqEtm?=
 =?us-ascii?Q?3v83x2h7fIsWVM7ZVJR7bVaSkiKWverzBaOG1lWdt/DHIfeY7eiDjmW4L5qB?=
 =?us-ascii?Q?K3F1oaIRbOuPbRGNNYj0T9AQdQhUs8/WPgyAw1rxK8+VICSeM0Kq8v49cqI4?=
 =?us-ascii?Q?WU15Hcwx4n6JVwemq3L+E7OcVA4r43FaIaaKreUEvM2KukD2HKD3YisPe0QQ?=
 =?us-ascii?Q?knOA8jWN6ES2hDnGvG/wpbgRz+G672pWDLAkSnj7ubyzm85eXHWy080H4Cby?=
 =?us-ascii?Q?2BKLoQFV4TeTCA9bg5Wnl016Cijhn+vitUOyROrZqmYg1UY6upiL4BMg+5DL?=
 =?us-ascii?Q?mnQ3PNtu735W3dH6fbJxijUp3tX0kmtDbTDi6c54eie00lxX1BsFttw5wbmk?=
 =?us-ascii?Q?HcC8jjd7HnlRTl1YwGLIdYwLCpPlqKuWn2n/K0Cb82ZIGAPOLYxxJYVfZkhY?=
 =?us-ascii?Q?mulaKmQUJSfZsAgd0IwDCWUvhJNfXxR1yBZ0hzB4V1+aRAU5rr9/mirLdEnv?=
 =?us-ascii?Q?bLiqJmtiCtjTiqAc0S6u/apW9KdTj0GkrRQHuVuoo8rVOj2p3hUd0b4BdYa+?=
 =?us-ascii?Q?gI56mHTWibX4+SIKGGb9Vd6op2U32qrHzimhtYeVXLFv7vFG1+7vzW6sI69A?=
 =?us-ascii?Q?veb+t83qN7EK3hDhqeM53c9VdhNnpmC9ZorQnF3Up/RzK87avemdoWRwiLxl?=
 =?us-ascii?Q?Wqu9XITA0wg7uvsmZV38+dLfD1krmVJm4oIoa1o5j5Psi3lBjTuyqfr/Fvff?=
 =?us-ascii?Q?CzLTc5/fX9ohhUI7m4oiQI2xRv9/5ucivPkX4p5MuS8OGqsU1uQzG5gGe9Ln?=
 =?us-ascii?Q?gLhHqrDgDzHdLJUmengeWiYY9WnRM4zwwcLd/Fmf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418a2f79-a912-47ec-c9ee-08dd78282065
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 12:06:29.3975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lnox4ex0nBay5+dWSDEkHGmSb2Z+KjcsSowW5t4QcCoIjlIbxF2O8/YeiNIEM8unSxxf1QZlds7kKdTTAqfzdJRNPXveQoS7Hn0z8AHReKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7948
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Thursday, April 10, 2025 4:31 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa,
> Karthik <karthik.poosa@intel.com>
> Subject: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
>=20
> Add wait for LMEM ready during system and runtime resume.
> This wait is there in probe and is missing during resume.
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  drivers/gpu/drm/xe/xe_device.h | 1 +
>  drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 75e753e0a682..4c0d9eb51d1f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
>  	return !!val;
>  }
>=20
> -static int wait_for_lmem_ready(struct xe_device *xe)
> +int wait_for_lmem_ready(struct xe_device *xe)
>  {
>  	unsigned long timeout, start;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h index 0bc3bc8e6803..60bc92f9ab22
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);  int
> xe_device_probe(struct xe_device *xe);  void xe_device_remove(struct
> xe_device *xe);  void xe_device_shutdown(struct xe_device *xe);
> +int wait_for_lmem_ready(struct xe_device *xe);
>=20
>  void xe_device_wmb(struct xe_device *xe);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> 4e112fbacada..2e59670660c1 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
>  	if (err)
>  		return err;
>=20
> +	err =3D wait_for_lmem_ready(xe);
In Xe we are referring this as a vram.
Do  we have any spec, that document this ?
> +	if (err)
> +		goto err;
> +
>  	xe_display_pm_resume_early(xe);
>=20
>  	/*
> @@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		if (err)
>  			goto out;
>=20
> +		err =3D wait_for_lmem_ready(xe);
> +		if (err)
> +			goto out;
> +
>  		xe_display_pm_resume_early(xe);
>=20
>  		/*
> --
> 2.25.1

