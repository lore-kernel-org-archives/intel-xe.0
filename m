Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A28CA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 11:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C75010E347;
	Thu,  1 Oct 2026 11:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqtxXTV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D4510E21A
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853902; x=1822389902;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5c9hyzfkzMukSQLXzBmK6Y4+mX2FrwDcuejppZ1cKzs=;
 b=UqtxXTV0l2u7hYE7NzAypoHIRxh34eqiFVyFSWqQgqFuy5tkkp9rlXPY
 TTfqzQbDx+imaiUHrGyWqwQUz4RrMHor2LArloZ/xjkrLaHuLGlnMhohw
 1ZU5vNaYmDwmBRuy3XUwqUzHSG0mHx2Z209SPX8nFUzcOUvDn5yE7/bK3
 h25bIOG3yATZfHh5AciFHRnTFNMrQZuyim39wGc0OpXaf0bcpU/VWf6Lh
 8obHOsjXATQiLlW5C4Mncl/A4l8eaKr9UrKCCecLJ7BveazVPIjrIFq+s
 bpIeLcu0sVi7NxXB8ozZtT7N3IpVjXCYvy0pc8duHVtWKzOVe7UnTVNWm g==;
X-CSE-ConnectionGUID: QrQUhYBKTJi7f+FeMtib6A==
X-CSE-MsgGUID: fLFbIUzwSc+oWJah8z8yxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101766877"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="101766877"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:25:01 -0700
X-CSE-ConnectionGUID: 1J8NziVSTECXCsR+LlKU0w==
X-CSE-MsgGUID: a0N8cV/lQZy6nPdn80LtCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279747100"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:25:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:25:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:25:00 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:24:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKJVhD6v/2TRQCdxSgkFeWH/xyj1w1xfSRXO01obXiyNP5k7ep6ln3xp4yQtfp7HgIyqzdI3rMlBJKWL8+StnJkB+mPBfAyM+udXsnf4NHNFUQNQw/ISdEC8sXwu3tQJwlow09mKah2SpnpTjBRjaA++puceMzMxGE5oj5qrPhSvGu8ENMSrDJUWsqhM4IPZ4jhz5YVJJ75HATK22VwqLYk0dkzfL0ty6kbt6ZsujPlxHzIGSKCQ5oW4v1RXfjBeu3lZjF/qY9gapObsIXjv4dDwGjeCCMo9kVmHJXumxAk+lrrg8BJuthBvC3xtUGcmcoYoPjI01pcNhDqyshhFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDEzJhvarUTsz4zGohlg8rK3x7GizkmXZ1BUQ6u6sMs=;
 b=lrxtQieuWYlq/NFFV/HKSVHGE8K7Y4WcJ4230X4Fn3V+FiyUnQiwRyWn4NvqJog484zRPZBAcL3WFm884qBbtLldvkP08aFJpWJwHSWDtUxnAnJLmx7oHBgcPAVYYMZp4xmITVkJfd3yHga0Xla7Qse7WWtTKmohpxmN1Azpre+/JhMWGiBDKnFZm03ajlerw0BhCLtHj/kub9WTNpJjZmTltJxM6iTsUAhe7naoQ+phW9vFcfK4vFcX85Rg0+2zVVn1yi6cqyQnaI7CiUOAQoAZPd0tCNLJBG+e4RFtUh63068NXPkqiF37LyWEItDGOxjnAPApd79CCa5hs6U7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MW4PR11MB6690.namprd11.prod.outlook.com (2603:10b6:303:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 11:24:56 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0451.014; Thu, 1 Oct 2026
 11:24:55 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v3 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
Thread-Topic: [PATCH v3 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
Thread-Index: AQHdTxFDqjYGy2frtUCbps4WPrGK97boiw7w
Date: Thu, 1 Oct 2026 11:24:55 +0000
Message-ID: <DS0PR11MB8718FB6941FCBB29011AF8C8818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-10-riana.tauro@intel.com>
In-Reply-To: <20260928061830.417395-10-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|MW4PR11MB6690:EE_
x-ms-office365-filtering-correlation-id: 7db7bd76-09f1-44a7-42ef-08df1fae9e9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 1D3HDhmU09RVaE0ZWp0ZWVwsMSjHgSPDBPlZI6BmxhHjH/ZB3Aihc1xCYbnzfNgtt08HsL0jlVPVu6AdjKDWa2VDgxDoyTdx5SkTaLc2RpVv+pwbo3IwcsCu8YHHB39M3U2ULNGv/Lcz7EsIJLYOYdjcIEXFGXxAX++H1BytQYCR9wTwITNp4RZLeQSxEd0WHlPQ8A94umEtr1f5Q/FDRKO/Mo1F0/lcxwt+OLdbSUeuPxPyhoT2IqAmQI97oZ9jiw0QHc1seYokTtRre4MFTHnuhZ9wm+QCpIcNyzospq/vR1cPC0ZPcYgDF67L7wCvYCH9sfjLqrrQdFtazpl6VxvczvC5G0JlTYTtkiuxGTqkbxbRsE5z7Wjcl5zQpPo8qezUlr0D5JJ1avIjy6sKfsAJEQGzhdQCsM7/UFfuS/pJHlRFR7Y3mc7ydUp45oN0aEQJDDprIZoQxkmbaZ6RJfQjeLg9i1rcarVFb+HNy6kkT/sLZcgiHBv/0U4zoUm36A1ByT1RiKUJCVMIFgvUDHaodH4E1ADzm/7e35JfUMHdQtlFk1Cj9muM76Z7zvWBWrXMpnlIsshQak3VrwFh+6WiAvTW1HVvUtvTyKci+f6tSWhdk0wlwhW8rzAgRHCm3N71aXstMW8aX7h8spvzKVyrQBuo5XImq8jp0BFED1KUsxd2xIi9CPd/b7kT9oaeCv/qoArLY5lqGZ2zCd9sCiFWC0DMOlm6RsA1tekc8fM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PsdCJtdwkOT1u2Lq58WTv+ZApN1XfgQkffixlBKjyOqJl78JtbgnH75V/z3g?=
 =?us-ascii?Q?nPFYBBZqXKluiPGA0KNiX1Ak0O7TCaIbHTdI0awEQRMxZM7mAab0CwMHiTuE?=
 =?us-ascii?Q?CG7RS/Mgx5hfgoQEl0vi1AuKdzGUUV5V8DqfVFultyAPQea3Z75i0Eq2ZRHI?=
 =?us-ascii?Q?XmX0DePegcNwyEXgumGUyuPCJIVpDRaGlyTOJzhqh4iVEqTFJKh27y5xUKNh?=
 =?us-ascii?Q?TF/YuTATfbdpcyCQk7msQQoqgIVPqpioPHwseKHL4KhhWUfTqDNn6NkxMihZ?=
 =?us-ascii?Q?VcQ+CdOdrkUt7eudXbbnf4z5uj3kRNwSa80Z+7NoAuxHLhbeJ4G9Xqsoje6i?=
 =?us-ascii?Q?e4u6O2Ve3Ouk6JK9oDYIyUKO1HC+/emMguUuwfdejv6G+rO0mCttdHA7OKpJ?=
 =?us-ascii?Q?GajbjWGTt9pUNPzt58pWgMM0t+K7/ubrxp2UCt40wC41EAPk+6FaOY49pDqx?=
 =?us-ascii?Q?bgYr7jyGn0fznrcGpvdN5S4aoGTkEV1cxr6FXOThX8QxXtOKXtF9b9o+5h1V?=
 =?us-ascii?Q?2Se2o4gjJ4uCQbIaZDwqtxZ0Vrk5zI/2KPkCwmEhaBE0kHu91kLnEnwYauqE?=
 =?us-ascii?Q?BEDr3upe6ht9z1AhoFlipJa01sQ3W0H9G23yBaMZmYQHiZ0LJ9jmBuF7DSFU?=
 =?us-ascii?Q?u5f4tQ6QPa6y6kHROX172qpaie48aMFy1KsH2CoQT7r88FXPOrm/nEJ7IT2K?=
 =?us-ascii?Q?4d8XEHn7CFAnKc2fgiO5WhGCKmremYTvZT84qaE8qc/Pn1z46nzjlaizcg80?=
 =?us-ascii?Q?d9cvhRInvr8MWIlABfu3cOhPuDyyltq+pWuZ6yYgeEFXTIoTC6PyS9jnCTfo?=
 =?us-ascii?Q?U3pDbukCV0oPiU51KXlQZdqQJW4VCQlwNNbzfbuN4LG5V50NG8o+6gtY7kL6?=
 =?us-ascii?Q?yB+XLGbP/1QtskrxGK93wp7NhvgNJfBME55qIgEWqjH46kMgX1juaMdI06iY?=
 =?us-ascii?Q?+7PVx32zDDhCzukw8ekiZC7N90KQxKkuK0GGksVF4E6YisbLrlfMvBaL0Uzd?=
 =?us-ascii?Q?kLDqZhhB+LnctUm4eBc9jxAk3gm+LxVOpgjA+lJ1F3wnImyrqdazpcuoPGvP?=
 =?us-ascii?Q?zbBjaHFyWdvASH8q9IxCT+x29P8Pn3gB9YRLEA6L5UTMmH7pQUgd0LWjZhfh?=
 =?us-ascii?Q?t12KJaao6DUa73OMDphqDKRtZ4kewODKo7MGhHxKew6eBg80nk2IPb9ILVmI?=
 =?us-ascii?Q?aKkvrMezEyaQyaip42ED4OapHcJRi0dqEla3ujXp2qSUphF0/gc6/yc27o8B?=
 =?us-ascii?Q?p7PhDvxkRXQnjkpiHl2B4/1ETGIsFzrTKrd+NnrRBpDQ/Y8Ue05666ZZWsCO?=
 =?us-ascii?Q?HXQ1s0C45db1n/qdjZDv+2CTMpT5MuP/jKlmARcCiKhlR30omdk0cTpouJWW?=
 =?us-ascii?Q?tK1mukbpf2hsa50uUucuYg/dt8sPMtcft7ok7GjxSWfIyKCqS7QtuBYNQCvm?=
 =?us-ascii?Q?xzZaWS1OTAM7fcJOjlpjFC/yeXO6dnSJqBQ4u7rYNfLKFW98gJC1c4pjXRZW?=
 =?us-ascii?Q?y4cLY37YnLjWCNUnYM5l8mDowrcg3rSa3ps5z+onauJnS/TvJmhmN8nbQkPe?=
 =?us-ascii?Q?H94qBqNkBcfJrHMlRuVKDGY0VM8Ua3D0MDaqVO5PRADCJX3WVpjVtS0UCM0J?=
 =?us-ascii?Q?Nlcd20LtSfMzpXa+eNqMfWGJRJWfqVq6ONg0D04rCXZ+bWI20xPKC512iRNB?=
 =?us-ascii?Q?ohuOh9mzX7XymUqzHjD18tUctEST4Na9kExrgV2GyVvEAjWKXZf0n8lAV9fh?=
 =?us-ascii?Q?TM6olJqKQg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BR/kF5kBxDweYigrJ+kGAt7Q2tbiQDV60CwHim1OxNs6t8TyXWBIGymp66nxlfdMTm49V2sBJDcweOcIp20bjGDY0kU8j+A1gvXvG5ybcVgLXJoP62tpeXqdAUYPA1CvmwIwGxAWN2aXZmNRt4oWlJUXbfArvS5loKg1+eXsCTEcPENnw/FdsndRUYM5de3oV40Da0s1362sfI93oZ/04dDtml9d/zYaoMh3qwB07GzE1ZQU5P/Vz9t5f/i1E/Rj9jEKaIIXd6XA1JJjfbigsQR32G43Vv730K86Meb3It4AaheVwGif0Y2TufnZufYs+35oOWdGThFtBX1R6Dn1+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db7bd76-09f1-44a7-42ef-08df1fae9e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 11:24:55.5280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mkMy451mPqWjB1+Zf3v7Tlhf2u7scg7jFO3WbH+qdDxDBghavRhX3pIxTP/i8r7Tq5Exc3oveJeDi81XlgKuj364YD91/Kwqzm7A7gHwuk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6690
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 28 September 2026 11:49
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v3 2/6] drm/xe/xe_ras: Add support to query page offline
> queue and list
>=20
> Add support to query page offline list and queue from firmware during
> module load. The page offline list command retrieves pages that are alrea=
dy
> offlined by the firmware. The page offline queue command retrieves the pa=
ges
> pending to be offlined by the firmware.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: rebase
>     store total pages once per response (Sashiko)
>=20
> v3: common function for offline and queue (Himal)
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 74 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h             | 35 +++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>  3 files changed, 113 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 1225c561a872..752754f09314 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -335,6 +335,77 @@ static bool ras_counter_is_valid(struct xe_device
> *xe, struct xe_ras_error_class
>  	return true;
>  }
>=20
> +static void get_offline_pages(struct xe_device *xe, u32 cmd, void *req, =
size_t
> req_size,
> +			      void *resp, size_t resp_size,
> +			      struct xe_ras_offline_common *common, bool
> offline) {
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_offline_list_request *list_req;
> +	u32 total_pages =3D 0, count =3D 0;
> +	ssize_t rlen;

size_t rlen;

> +	int ret, i;
> +
> +	list_req =3D req ? req : NULL;

equivalent to list_req =3D req

> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> cmd, req, req_size, resp,
> +				  resp_size);
> +
> +	do {
> +		memset(resp, 0, resp_size);
> +
> +		if (list_req)
> +			list_req->index =3D count;
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline
> data, cmd=3D%#x\n",
> +				   cmd);
> +			return;
> +		}
> +
> +		if (rlen !=3D resp_size) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "unexpected page offline response length
> %zu (expected %zu), cmd=3D%#x\n",
> +				   rlen, resp_size, cmd);
> +			return;
> +		}
> +
> +		for (i =3D 0; i < common->pages_returned && i <
> XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, common->page_addresses[i],
> offline);
> +
> +		count +=3D common->pages_returned;
> +		if (!common->pages_returned)
> +			break;
> +
> +		if (!total_pages)
> +			total_pages =3D common->total_pages;
> +
> +		if (count > total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned exceed total pages %u,
> returned %u, cmd=3D%#x\n",
> +				   total_pages, count, cmd);
> +			return;
> +		}
> +	} while (common->additional_data);
> +}
> +
> +static void get_queued_pages(struct xe_device *xe) {
> +	struct xe_ras_offline_common response =3D {0};
> +
> +	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL,
> 0, &response,
> +			  sizeof(response), &response, true); }
> +
> +static void get_offlined_list(struct xe_device *xe) {
> +	struct xe_ras_offline_list_response response =3D {0};
> +	struct xe_ras_offline_list_request request =3D {0};
> +
> +	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
> &request, sizeof(request),
> +			  &response, sizeof(response), &response.common,
> false); }

Please consider following if it looks ok. To make it less confusing and nam=
ing it what it actually does,

/*
 * Fetch the next batch of page addresses for @cmd from firmware and proces=
s
 * each one locally via handle_page_offline(). @notify_fw controls whether
 * firmware is told back (XE_SYSCTRL_CMD_PAGE_OFFLINE) once a page has been
 * handled - see the two callers below for why that differs per source.
 */
static void xe_ras_process_offline_pages(struct xe_device *xe, u32 cmd, voi=
d *req,
                     size_t req_size, void *resp, size_t resp_size,
                     struct xe_ras_offline_common *common, bool notify_fw)
{
    ...
    for (i =3D 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
        handle_page_offline(xe, common->page_addresses[i], notify_fw);
    ...
}

/*
 * Firmware's pending queue: addresses it hasn't finished offlining yet.
 * Drain it and ack each page back so firmware can dequeue it.
 */
static void xe_ras_drain_offline_queue(struct xe_device *xe)
{
    struct xe_ras_offline_common response =3D {0};

    xe_ras_process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL=
, 0,
                     &response, sizeof(response), &response, true);
}

/*
 * Firmware's persisted (flash) list of already-offlined pages. Just replay
 * them into local VRAM tracking on driver load; firmware already has them.
 */
static void xe_ras_restore_offlined_pages(struct xe_device *xe)
{
    struct xe_ras_offline_list_response response =3D {0};
    struct xe_ras_offline_list_request request =3D {0};

    xe_ras_process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &requ=
est,
                     sizeof(request), &response, sizeof(response),
                     &response.common, false);
}

Tejas
> +
>  static struct pci_dev *find_usp_dev(struct pci_dev *pdev)  {
>  	struct pci_dev *vsp;
> @@ -1049,6 +1120,9 @@ void xe_ras_init(struct xe_device *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
>=20
> +	get_queued_pages(xe);
> +	get_offlined_list(xe);
> +
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index f119489bcdf2..021ffbd6d4e2 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>=20
>  #define XE_RAS_NUM_COUNTERS			16
>  #define XE_RAS_NUM_ERROR_ARR			3
> +#define XE_RAS_NUM_PAGES			25
>  /* Error bits in IEH global error status register */
>  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>  /* Device memory error categories */
> @@ -330,6 +331,40 @@ struct xe_ras_page_offline_response {
>  	u32 reserved;
>  } __packed;
>=20
> +/**
> + * struct xe_ras_offline_common - Common structure for offline list and
> +queue  */ struct xe_ras_offline_common {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_request - Request for get offline list
> +command  */ struct xe_ras_offline_list_request {
> +	/** @index: Zero-based index into the offline page list */
> +	u32 index;
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_response - Response from get offline list
> +command  */ struct xe_ras_offline_list_response {
> +	/** @max_entries: Total no of pages that can be stored in flash */
> +	u32 max_entries;
> +	/** @common: Common offline page information */
> +	struct xe_ras_offline_common common;
> +} __packed;
> +
>  /**
>   * struct xe_ras_get_health_request - Request structure for obtaining gp=
u
> health
>   */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index a01576bf2e73..3a71ed446949 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -31,6 +31,8 @@ enum xe_sysctrl_group {
>   * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>   * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a
> page
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined
> + pages from flash
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined
> queued
> + pages from firmware
>   * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>   * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>   */
> @@ -42,6 +44,8 @@ enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_SET_THRESHOLD		=3D 0x06,
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	=3D 0x07,
>  	XE_SYSCTRL_CMD_PAGE_OFFLINE		=3D 0x08,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		=3D 0x09,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	=3D 0x0A,
>  	XE_SYSCTRL_CMD_GET_HEALTH		=3D 0x0B,
>  	XE_SYSCTRL_CMD_SET_HEALTH		=3D 0x0C,
>  };
> --
> 2.47.1

