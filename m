Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D83BC0219D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 13:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEB410EA92;
	Thu, 13 Feb 2025 13:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpsfckAA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEC110EA89
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739451894; x=1770987894;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=27qYn6+bqjJ8RRTlfAHcoItpO40VCe706OqorbLsomM=;
 b=YpsfckAAuPITFFI695qHIWGbsXgqekzGDSqcSJ+h4Rj0/FKAPGBdpqnH
 sPpCREgMjUI8pIsQXwAfHzsC4gv3a8wYdlshitCXrtk/B/cndsczhaYOn
 MRY6fJoo8sv2Wjob8L38XR0tIfW40b1qMPZrlBelPkRsT21y74eRY4DAX
 SJZgeBOsTL7CLJimtCnOek90ac/tp/hwz0TbrJXnvKpkeEhY44WaPV1kQ
 dCUqTJ7npM5idgTYHPkBU88mTbwU0VJ3bPGbj+ntkO4/paz3lT0buRDPo
 McwDQLHPGOP4f600daDeQYYZPhDrXysOGK9cR3EWJm8Ox8Egx6PLieAr4 A==;
X-CSE-ConnectionGUID: n/nhVmR6RSK2LIL/xpxQTA==
X-CSE-MsgGUID: etc4H5G8RgC55U2VaQl7JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40412513"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40412513"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:04:54 -0800
X-CSE-ConnectionGUID: 5+CeeyALQ420sC3Gk5XeeQ==
X-CSE-MsgGUID: h+pevFUMTVqTIzWV0GMQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118072435"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 05:04:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 05:04:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 05:04:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 05:04:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APs+rgBPrfy0fvjA28cQGe3hi/er1ofKXqhUyfl26AbSFzmCqR0WEG806xvSCF1POQYQwjAPkyGDMBZl+NZ+5IIoXOCJ+mk96VjZ8yq27/YPMc5IRAWnyNQlEsn4A/0pW3MK7IWt0Bmc7SwHc29WviSm3kV7M0ijX56TbUn5clLBWcZObg8lFAS0a0+v9kNnP+FhCTQarytx/CiXpNiAY24QqNXFJacq96IYmsSq4cPgQ6OegEbz8+h5H6mDLJHE3v6v5NTT+wdQJhQAunFa2K6mCVW6M8RIv9htytJtqIklhNqLjEeVFhCDkuh8iJmFXKxMY9SOtxwNK/kkUtB6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2yswUCy6ypY4UaxxgJ8DSuQ3XvLJ0hv4icMEb1DrMQ=;
 b=uSY9Ra8le15vZsvwKGTZH/xmSSPSN6tuUlbYJMyh9aRW5ni22iqtT86jm3virY6TDNK393NAZwQxGuCulFb4Up3lbkNFs8YkNj75ttusW676IIqXp8fMnoPdrEK5Obn9sPC3dKIj+yIxj+l30SKGhD8qP9Oemm5vzhcMOT9YMXjxhgXzxaI4oh9dQMhleLnJPBedajMekvMg1jlIrum3nHmEUq/1kDj9T5txEzfkCiJ/aPfU/mZS4KjewiVBCYm/NFJwQ8KejgVR9JuUDxGKWD0lSWJ/pd2hRJdxZx27P0BvzACI9JwRiwDVE/TI3a965fptECY0Bf9rf77Mv4UWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 13:04:46 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 13:04:45 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>
Subject: RE: [PATCH] drm/xe/display: Remove hpd cancel work sync from runtime
 pm path
Thread-Topic: [PATCH] drm/xe/display: Remove hpd cancel work sync from runtime
 pm path
Thread-Index: AQHbfYPoaZqkUmeUjEWECLSFDgYHorNFNCuQ
Date: Thu, 13 Feb 2025 13:04:44 +0000
Message-ID: <SJ1PR11MB620460FFCB4F6B7B9786392881FF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250212192447.402715-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250212192447.402715-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB5829:EE_
x-ms-office365-filtering-correlation-id: bc6eb876-221a-433c-aa0d-08dd4c2efcd0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YjUoZrL2y2ua4hjFLGvQIjJNflGQaN5odBe+7tgNk4CfT4e58T5tlQx7lzXF?=
 =?us-ascii?Q?q3L3VCao7VWW0UngSaoveNOewjX90tyLkDJteOXfBcDTz9rsDTUBXq+HVLS1?=
 =?us-ascii?Q?BZuUbGoaPS2TuJt3hBwypl+7r8n3nzUn7lOVux7qm5bo5jIKDyFrQMmjKjhV?=
 =?us-ascii?Q?HkPY59r8CF7UDXlk8epeIEH8goyTGvMMjkXJREshW4/I+VfJsNCK+Xezo1D/?=
 =?us-ascii?Q?tSJ7xqSMRCF66tdLLxAgLRnKn+Dwgfan5hTzXLBg4wphdIkPc+PmMcy6SLu+?=
 =?us-ascii?Q?kw/ieVizGjwC9TYF/Wh+CkpdHwJx9865OdP3PgwiBx66tNIWXOXV1xJljzgq?=
 =?us-ascii?Q?MULmrJg6elEg3etHnkNVRjZZ7WhhP2rbK7unbESyQp0mGj5HPCJoCVn1B0VT?=
 =?us-ascii?Q?hvH+reR3YzFsbsyJZWQZ5TYvLBBfYlk0mib5lMpw9kLvgQv9YKyuE26/6Lsn?=
 =?us-ascii?Q?hlHWCZpM3vaSWxCdXUgEYIUg3zs3E6bHwIywThN51oEWSV31yi5Nxj8gUzPZ?=
 =?us-ascii?Q?YEM1aDDhKWSKcba0+FR89HNHdJIfVV3ldvjezFxhlW91lpVZR14NtUkwggSS?=
 =?us-ascii?Q?9gcvOUYzN8pDu+PEX0oK43Ui2oje6ofIbvBojHHqxLOP0kiFNuxh4xR2ZUiF?=
 =?us-ascii?Q?GoQ2oTcmThGHjzF8HRM26gIKgehvt8KRGLQwpGZQ+2M6OiOXW4/DuhbkzQpY?=
 =?us-ascii?Q?i2H/fQhyXl8ZDYPb3nnapiC4yfZXr/1Qid5q+SjV8Nts5T4IOG6VuL/Q+9Vo?=
 =?us-ascii?Q?pqjvD6H0CZtackvLDR3c/pcaikt3swqk02/XBrwdpbntvxNLEqToH1O71tK4?=
 =?us-ascii?Q?GR2NKbKaxh5Z2AvBMzoyxR7diQrbNVSbOS6KSP7UQONihL/Fddn8OjifzfpJ?=
 =?us-ascii?Q?VG85bsCxtG34d5O7vdXfilVxvw/6Blc6LvW+bQIPzCpYeVbgTe/t74Q01zKF?=
 =?us-ascii?Q?Pkpt5MJQe5OpPaGpvErFwPG/Ff29n/XBCIv776OBOveNEfYpGKBMGKdQiN5x?=
 =?us-ascii?Q?2rXxwhcS0NhQrtVrtC2gGCv7OEklXLpmYqUw+YpiqFCDemIyAUpzd9HFNY4J?=
 =?us-ascii?Q?1Snj16zH12DObafEcF9edKd+SgFSW3j8W47kQSSSLT+zb7k4AuW1Qt5z627/?=
 =?us-ascii?Q?s/CEaOsOcfQ41OvhQqh70DlSUyxtVVj44iuqPu6FxkaFjLNYVmwPKi3+IMaE?=
 =?us-ascii?Q?dFRCS16lDJ55dzYVztL7oWMCzBMV9O5hPumwomueRFwB3NMB6RTlTNNdQWz8?=
 =?us-ascii?Q?VqxpGSAp1fKSU4yDATvDr3YMKayJICvoDOgsxaN872917qZuYyiqQXe2d4nY?=
 =?us-ascii?Q?6PrUVgk7xh9BNLYZV9bHqTRGuJeIjGx/K/v3G2V9ne+Y1q3J5XzqErkyE8/t?=
 =?us-ascii?Q?tA5J5Pi8W/34cbuSJXUeIYAo2HaQRixZEth2sJSKE956zrOI3AdCaGD6ZMil?=
 =?us-ascii?Q?K36n5ud16GY8rY9unx3c+aLl1fG0qdZR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zFOE4xF1UdoiouxMQJYWyzrPgDyi9+kWs2W4nyw/dbO0FPAsuastP7HZHCs/?=
 =?us-ascii?Q?qL3JGVDH3GrfJnqnf40S62lC3o0I/n55njAIkNYQ6UWj6tvGfY7kB4x/VBrX?=
 =?us-ascii?Q?1eJiXcZcvDOl5DfUnSA82d5d4ozayW+dq+KeRQ3GXk8uPX4m5j/GFca8H1cK?=
 =?us-ascii?Q?6OVl6PeAcSnWS9BTYXZwHV91gc8smKtw8RJVpDA23DjJKLBDZe2cTdMYMv+V?=
 =?us-ascii?Q?1cgFW5qTItQs1KyWwfQQY4ZVZfKRZv3+M/oD3Ucn2o8XGTSyq73l3DRqezUn?=
 =?us-ascii?Q?tSM2WXOhYffZyH3ty4r/27A+hRJfPm9T875mJkeSAOVIW0Nk4M+/bYKz/6nh?=
 =?us-ascii?Q?tomydLIK6bOLYDhrkVE2otVxAK/usN0TYextDmqiItsMT24XDO0yysaDtA6o?=
 =?us-ascii?Q?l3heqqsE7N0/l/nOGg/teehPrMyM4nJapDRf58kwTzOMOyExJcTBz2EZofQS?=
 =?us-ascii?Q?yeF/U+8oSPUgy95IaWqoCYW/tnmWo09EEkyNIQpbTL5xKa/xr6bNv99BJtoB?=
 =?us-ascii?Q?WVuBuLLBjQ9aqb9DTth4F3Y3lfEJ5f614LOwYlAWWCNs2q2qk5CmBZB9Pnoc?=
 =?us-ascii?Q?uOb9CHxsxyl9aAGhnycHCqsR8pg55+KuF8Rqt6mWbsANrT95eoKBSKBT4QT6?=
 =?us-ascii?Q?mlWyh7JR1ofGwUXV6MV1tq5muWI3DA3VP1szmsB99sJDWg9X8gGrZbfSjosH?=
 =?us-ascii?Q?BK7ct0oSG1wG6B8nY5erMe+9wH3fGb3uy7ZYsLQeR8ogRnh+uEDpaOgNztCb?=
 =?us-ascii?Q?nyR0NXU2dEKXnRoSLCviJA/vgb956+fQn4nN+6c/Ym5Y4qW/q1QLMJYZh1T5?=
 =?us-ascii?Q?mGlUGLh8V1Muj0cHuMGRV2ELky1jo9ZgG0Io1M1gYEBL6LCfqx/CUOiayDXV?=
 =?us-ascii?Q?19uHl8GioSEHn75WYaFapXmCST1K+e5NuKi0OymvzJlAweue9SWQ0qPtcqxv?=
 =?us-ascii?Q?fqZUGlC2vXf6w9KQrl4aCyGzuaqr+68s1e2TNUBc7sS8Lrx+VGFgbe1pXmnz?=
 =?us-ascii?Q?iv9ORBxWO2he72WI8aDm23gzPwHreFWS/GBB4GpDtppIJ3gY4iof5lr68pU2?=
 =?us-ascii?Q?YH97wKp9fui9GY51JVBMfSE6mkYXjriYUk+FchC7P9w/VUU362ZyZBQVftdq?=
 =?us-ascii?Q?NqRhZX1+7EbYA/nVFdl8xXMWymJnlE//uBME7xnIajpXRB9vSH2wSWsowYSZ?=
 =?us-ascii?Q?3PUIdGiAe8+ScBIhEEYcUwHLDSRHcKavq3NFmA/uxhq6CwnAS9IQFH5ZuvP+?=
 =?us-ascii?Q?4swLYxGPKNHSwB2RHmha/9tRHiKzFFc4owVVvuaPUO+kO6ALKOBY8IsrDqVz?=
 =?us-ascii?Q?NCyAyW/g5Yt9a2T9vk7ETzomCD/RJbd2nzaqrpWsMUpu0U65QRHYteYN20jT?=
 =?us-ascii?Q?yFhP66sSgzL32G4mFJunKFrS5itJajLwWHz0xu6svu8zQ9DAgu7Km6PPHsKP?=
 =?us-ascii?Q?RFPHDgLekdkvAnNvvho/ofCJeUPPFM2IbfMg75pjXP61o8LSLCegFBYcgmUD?=
 =?us-ascii?Q?+bEKVgQtrU31RpTdbJkmvTUeEThMcLyoK8mpKuVf/ZRu9fOum4/HZfQt3Vrh?=
 =?us-ascii?Q?lYvL7lcuyY3Fsjt5SkganPgjswBDhU1Tq9JP4+cK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6eb876-221a-433c-aa0d-08dd4c2efcd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 13:04:44.9618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jz/7nU6ynI7Z658rd/VfazJP1OxA7H+KVf5+TRM/LE3/Uh6VtKtopMx3tZaDhi60FKMhKZFN5+0/YmacCi8eg/36sarO9lnG60wz/Thfmhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodr=
igo
> Vivi
> Sent: Thursday, February 13, 2025 12:55 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Deak, Imre <imre.deak@intel.c=
om>
> Subject: [PATCH] drm/xe/display: Remove hpd cancel work sync from runtime
> pm path
>=20
> This function will synchronously cancel and wait for many display work qu=
eue
> items, which might try to take the runtime pm reference causing a bad
> deadlock. So, remove it from the runtime_pm suspend patch.
>=20
> Reported-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index 651799c946ac..f0f427689a56 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -311,7 +311,8 @@ static void __xe_display_pm_suspend(struct
> xe_device *xe, bool runtime)
>=20
>  	xe_display_flush_cleanup_work(xe);
>=20
> -	intel_hpd_cancel_work(xe);
> +	if (!runtime)
> +		intel_hpd_cancel_work(xe);

So the before suspend still need to make sure hpd work is cancelled smoothl=
y, no?

Tejas
>=20
>  	if (!runtime && has_display(xe)) {
>  		intel_display_driver_suspend_access(display);
> --
> 2.48.1

