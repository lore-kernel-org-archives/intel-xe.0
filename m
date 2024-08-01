Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3940C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A8E10E8E2;
	Thu,  1 Aug 2024 20:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQ36FeWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D325D10E8E2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722545301; x=1754081301;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6ewK/2rzaz/0oEk3BRroQc8MNIrTRP3ZR7ReTDxSWp4=;
 b=mQ36FeWkOs2p/nSfjbNgKYnx61ncZZS5UwzyESb0XBmJ7DuxFaroGcUF
 SFDRZFdd/RSdHShywOjyNLXA/raHQB/HqN/l4ZA6vLd8gwTCy40bKcXjj
 qg3ShbnKJglJPrx8MuqEqojAxlSX7v+ctQl/FWNtQcflsPHXy+mYoYc9N
 Ek+O5zf9exX7XBAieKVKfEjMsRE7zScxrwXrwm8yZP7mPUAgVraGv9CQc
 pVBP9arBYpDUG0pzxszIPLo0UkPPvFDiAcuGYvAGTfPJONCQYEGCmwqZb
 i/0X8p32OSMo/IfZnHtM7sJenptxc06V314xEccjUVOjQZ4Pn8IOBEfra w==;
X-CSE-ConnectionGUID: ntrHtSSjRi+LUL925Bqg3A==
X-CSE-MsgGUID: WSdbWNR5R+mXjp9eIOLlvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24325538"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="24325538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:48:21 -0700
X-CSE-ConnectionGUID: qSvr1hC1RU+Z+OlMSEWn6w==
X-CSE-MsgGUID: zPHxlt6ZTnCbh/mncPBTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="78439917"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 13:48:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:48:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 13:48:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 13:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKkTqthoInn1yciHv8bKoEzCSP6rzVt2k/QAvF5s4JwX+XecZ+fXKo988idJm+FdWYEb5N78ndCpxD9ohr/0OL0ELXR3KXFuDIFDZOSNA2MZi1qMk14IjPx48UgCD77lT9n4wASHby6PkdkFF0mln+3sixH5HDYpqmqpX1hsTzFwbM0psl/XugLSmjXIQ9tSKspzH/tFwER02sS6H8rCwM7/p69zqMGz/gRh04eS33sQrFbeHH4iIfq1zOsrYMELw+tTs+Sva+UtErS6wzaDLzjHItEG30O6GHWxHtXGxfh838RjzOG9lGsaNTc8EeO9OKlMkUfPoOmEQqyj68pRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJL4Jx6Z/zC9ohhN//KivyFi4JNlgRVbGnLiRHMpFCs=;
 b=HkBRmKyQE7StcibDa3uMu9fLDgIpNmaVxqfNDCd7WOJtWkwIRfG96317B8QBq3ZdrsZvVAuhpSUhUkBLVIMfQUoQ9fkhv653DOvrVnTWKPudpITEHfFmJ5Uz10mj021K9td49zXIYuw2EO7qxN0dbWuwAG8nGlIsai2/MqSLV6JPpyTxotrP9pw9pQMvrE7oBA5L/Ea1f5iBHeCgPenLvFERtpLN42t+C9etnSTyACWRAvQ73uVJdI3HFSFw9pqTzwj6uvIW2nYQRCjgA+NQMXW0Up2zbn2pF2LAURDd6MUJAGI5e3YYhSCd1YYJACONH5WbsIUVcZ6IR7ONOM0XCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 20:48:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 20:48:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe/guc: Release GuC v70.29.2 for LNL, BMG
Thread-Topic: [PATCH 2/3] drm/xe/guc: Release GuC v70.29.2 for LNL, BMG
Thread-Index: AQHa5FJNg64MtRO/5UKrdVSjX0dy8rIS3ndw
Date: Thu, 1 Aug 2024 20:48:14 +0000
Message-ID: <CH0PR11MB54445814CD694C271A56E405E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240801203341.3042386-1-julia.filipchuk@intel.com>
 <20240801203341.3042386-2-julia.filipchuk@intel.com>
In-Reply-To: <20240801203341.3042386-2-julia.filipchuk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6652:EE_
x-ms-office365-filtering-correlation-id: 71eced40-8f5b-4d9f-9c6a-08dcb26b4364
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?NyCRCeGF+kPmejtlRDSA6l+Cw3tseX6uvlzJyPifmnh1cL1NexHQEgqQOB//?=
 =?us-ascii?Q?SRujMyqBNwX/Aq9BJ67nqdH9mjSjbjJlLBWnf5cz2lRuayN13Nc02CycP83p?=
 =?us-ascii?Q?XckZo79s58d3d2BF3iiqqo4hH3CVQRoTuMHM+ypQGL+EkkhDv1g4A0AmV/gc?=
 =?us-ascii?Q?usl60h2fvJVGp4bcpjkuIuXTqc4BH0of/87X/d85Kq0tDBfgMzergxWLARNq?=
 =?us-ascii?Q?XPvC5wzSSan4+N+XdKR+9FYMz++HKf2FKvJBeZhm3dWpMXXuTwWpF4F9w3n+?=
 =?us-ascii?Q?yxAssBnrGyI9sqK+kJm7TdOvJ/33whnWx7Q/WrLi/rra3vHVIaAAjKRN/ETf?=
 =?us-ascii?Q?Z6EZWdlCAEcetH94x6eJ/sj6EN1iz/a+tF4SAsfCQ4tCOhZvyRIHooO6Ar+U?=
 =?us-ascii?Q?P9zfuZDdgMWtE/5z/IE16UGsVdt7QJSOP1sKm5zpOVcsDikk79Jul/jB4lwx?=
 =?us-ascii?Q?JnUMbamjFnZFPdSBEMJEmudi2r9LaPS6k1kyFjKy8Zpst0V49KdicbW7w+ml?=
 =?us-ascii?Q?zDHFupYDOf7fCBHErVEhBpXxm7ET9lvf5XR8i07RVs89TcDf0LqdbLVILtBT?=
 =?us-ascii?Q?RJjmhsqkRHkz62F3iIqn2AoouTIwaE3HU4bYDNM7xDheUyh0kM0V4zwQ/l0A?=
 =?us-ascii?Q?Add1yrVUWYsY3HHOd0ZIllbQMaY4pA46ItPjEsDqs8j+U5chXdDBHC6uWZZ1?=
 =?us-ascii?Q?T34igikczxgMqv20rtTTzyJclDMlOJgXZhR9gjV5NUwhNzcmsc6bQ8tcwlAd?=
 =?us-ascii?Q?eAc8pisfwUw3YkidPvA6lVpW9iyKoJhiowgOBk8y3KGO3RDTznfA9SIMb5Qz?=
 =?us-ascii?Q?FErgwQWZ6OlUOJRihkqtZnl7BYr4Oucn3UeIP6uuT+LfXLDTajqqX84Q/AgI?=
 =?us-ascii?Q?XCA7UKt3LHkOdjfLBglC7ZTw+AvjzeDQPAOLbW7GD0/zdEfECaX9LO4tSMUe?=
 =?us-ascii?Q?1365eCc+KsCI6jpld4jg6ZFdzXGZ8NtdLwILeb4Gn5UtTm1cmOUERYvD1BXr?=
 =?us-ascii?Q?MKYCdP+BHU0L7o5m8+MmfOyM57qjBkjXAmQaPn0RPP2ThbueGy3srVmSI0cY?=
 =?us-ascii?Q?7QLEdN+L3wo+37ukNR4HWz5fXJWSPVFNERn3YsiEkjCiPspYwt/g5ura3iMy?=
 =?us-ascii?Q?Q7m+e3KoW/QRE1NHUXf1zISSCUkvC5miVHJvZf/RQd/fZMGNQIsm4bLdbqOJ?=
 =?us-ascii?Q?t4+agMr+zD1xEZDOdo27YCnXzmDb8XQzYvWrI7viVG6YKyYUfVSkxnv66KmR?=
 =?us-ascii?Q?b91JvFTXVVTJz82yYQjfoi1c7+bsZfcK+MDe4AsgBBeI2BYZI6wRd9uZoj7J?=
 =?us-ascii?Q?GbAc2OGgEgWGuioF+Xss8J5pfULus/k8ZwTxefggtD54u24W2d/lqqvIjUx4?=
 =?us-ascii?Q?g+Bs4RSHCmy5sj1s0wOwnXJ+AWInidSSjmX7rgCAtQ+R13IGGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0LYmuVa7vhOb4ShKc1uwmLmbAz0mmOkcKLfeskiMmjGgi1aVCxHfI56u/DrE?=
 =?us-ascii?Q?/bc5AekxPpJOiaAvT/kKIsDNUKrWpo9qsDcUJ+wBscFtXrNVPA9Pk4/lSyGB?=
 =?us-ascii?Q?m/0faOGNIBJlcyuvnWLpC0QydYQQ/ai9emNYXBRmhXubEiZojO8bL5fXKR66?=
 =?us-ascii?Q?uJRDKeV7HdY7KS05RTod9Vd7Y62CNRsHGu7ZXUORqECPfDLx2ZGsh1egTJ3E?=
 =?us-ascii?Q?GjIS1rMV1W5YM/Mh9+9Esv6nL2T5CchqS3nZ/YpAAOA1M5pfVE6Z8hxU04uO?=
 =?us-ascii?Q?kjdWGES6CzWwxCWEb7F3tJa4Hw1+6xnNKv+ZRYSLfJDjb5TlH5r8cnEG2G7J?=
 =?us-ascii?Q?/PuVnpWGQSmS0xwG5YzZbGmsxTmbXU75DOy9bwMJ7ZK3ecjAgGUp9Eb6fjLd?=
 =?us-ascii?Q?OZ3++YEOYswlZBoGWoo4QffiVqwMhgOXaBISmmf+H9P1C1HpXm3zy1ie22hi?=
 =?us-ascii?Q?UboyYRFSlWRq9yxh35glxv9DkIsLINBarruGt5bph1BXt89J86JVZ9134rwZ?=
 =?us-ascii?Q?Xiu6nz47HIuFHBkMNxjHYQtHrDjVNxsYcaCfPRXul/her5qFRtq7fbbCHL0Q?=
 =?us-ascii?Q?DguYzTX4LH38Uxu25JYfWckvTf3rGQLSG1+BOhGObai6kZMkBlxoJHEnuvk9?=
 =?us-ascii?Q?cqHXKslrlc4CZq5WEizJkkHrxRCk+9JrYn6EiiVyy39oNve0R/aDEDU/eS5l?=
 =?us-ascii?Q?mVxOIhlDO+2P6WHNsXURNIbVjh2htNQPZPsUBPk0mAQGUczLtGzPQsn1ShSw?=
 =?us-ascii?Q?Ub46e0dk/kiDEEcKmA68pe9NchS4erz8kCKwA1HU3g4KS70geD5tII9BMGKa?=
 =?us-ascii?Q?+dOeUqrIUfEo6q4GNH64bRY6ZVufj7W7p+8I/WKtNMbnenPuJqQtSuBAl45E?=
 =?us-ascii?Q?MvurOLLo+aVAUW9HeRK1UJoZ/MkOFIQ+ZROnw0YDNXBdkB0f7rjCAGLUYcKv?=
 =?us-ascii?Q?/IqGFDwY+VP7iA8fhLYBJMCZpBbWEcjPIbI/14fsbYlIWwKqS0Pqc77+cRjJ?=
 =?us-ascii?Q?9/6nsw72ElgmYo8MBugPENwk2olcK3BvZD3izfprh0pAowwggxbW1vayeImA?=
 =?us-ascii?Q?XwRXIb9IEni5qvZqSZvc2kXHBMBoX6vgiItQvmo8+gbtzDwh81XKKjkMIDoJ?=
 =?us-ascii?Q?XRPb3JWbZ5HifO+Hrt9dGVwubhhiAUabBQ10fpGkxWXnNckjYrS0llFFcVkM?=
 =?us-ascii?Q?VXRl9nVc+Ui+obMiU2r6pLJKb+HKVsJT+L1DOK2/TZtAIZcMJAn4hF7K/4By?=
 =?us-ascii?Q?3VHLpXziswU2JaWnXNE6W+Qu0zw6DO/bfuFl5Z47SbKIjqAS6UBTVfAEgj8E?=
 =?us-ascii?Q?rxnKOAu4uf/P+hkHALMJv9rGPbr+YP3BuIbBn0mRiEc/KuNLl9arOXajRAFJ?=
 =?us-ascii?Q?Yb0RrlFQ+g/FfTxAkRf+bE7qVMR140DDfysnQWhwhousVbHtvxP7Qtuae4yo?=
 =?us-ascii?Q?vak6UioykyZEBjjs8fXpjPecKbDixe3S5ziGUAmEyj3U39osD7v1AFae8NTp?=
 =?us-ascii?Q?E8xDYEg/7h2aXZi8A5qK/CwRyynpI4bZ+XaQA4M8UOV+e+xUXuJTWYOxmJw1?=
 =?us-ascii?Q?rityNJnVwEdfLBtY2gaXQJhidq3WvaxDv8CRotdkduLcCPnLM5VCgoqRSB5c?=
 =?us-ascii?Q?aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71eced40-8f5b-4d9f-9c6a-08dcb26b4364
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 20:48:14.1352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZRC7OxgRD6RFoW7KOEhid+l5QMelbKkNEqrNVpODHdvcIdBxqPAvS6pNeMQS5ECefQFqap4yPeSq8WZdoBfvhoDGn/Oq7Jgtot4r9vT02o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
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


>=20
> -----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Julia =
Filipchuk
Sent: Thursday, August 1, 2024 1:34 PM
To: intel-xe@lists.freedesktop.org
Cc: Filipchuk, Julia <julia.filipchuk@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Release GuC v70.29.2 for LNL, BMG
>=20
> The VF API version for this release is 1.13.4
>=20
> Released version is set as recommended and minimum.
>=20
> Add comparable version macro to xe_uc_fw.

I think the new macros could be separated out into a new patch.  I can see =
how they'd
be useful for scalability, but it doesn't seem related to updating the GuC =
release for LNL
and BMG.

Not blocking, just something to consider.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.h   |  3 +++
>  drivers/gpu/drm/xe/xe_uc_fw.c | 11 +++++++----
>  drivers/gpu/drm/xe/xe_uc_fw.h |  6 ++++++
>  3 files changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index e0bbf98f849d..9a0b9123dce0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -11,6 +11,9 @@
>  #include "xe_hw_engine_types.h"
>  #include "xe_macros.h"
> =20
> +#define GUC_SUBMIT_VER(guc)   MAKE_VER_STRUCT((guc)->fw.versions.found[X=
E_UC_FW_VER_COMPATIBILITY])
> +#define GUC_FIRMWARE_VER(guc) MAKE_VER_STRUCT((guc)->fw.versions.found[X=
E_UC_FW_VER_RELEASE])
> +
>  struct drm_printer;
> =20
>  void xe_guc_comm_init_early(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index 5b70d23724c4..89bea1461d20 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -15,6 +15,7 @@
>  #include "xe_gsc.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> +#include "xe_guc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> @@ -105,7 +106,8 @@ struct fw_blobs_by_type {
>  };
> =20
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
> +	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>  	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
>  	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
>  	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
> @@ -304,14 +306,15 @@ static void uc_fw_fini(struct drm_device *drm, void=
 *arg)
>  static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_heade=
r *css)
>  {
>  	struct xe_gt *gt =3D uc_fw_to_gt(uc_fw);
> +	struct xe_guc *guc =3D container_of(uc_fw, struct xe_guc, fw);
>  	struct xe_uc_fw_version *release =3D &uc_fw->versions.found[XE_UC_FW_VE=
R_RELEASE];
>  	struct xe_uc_fw_version *compatibility =3D &uc_fw->versions.found[XE_UC=
_FW_VER_COMPATIBILITY];
> =20
>  	xe_gt_assert(gt, uc_fw->type =3D=3D XE_UC_FW_TYPE_GUC);
> =20
> -	/* We don't support GuC releases older than 70.19 */
> -	if (release->major < 70 || (release->major =3D=3D 70 && release->minor =
< 19)) {
> -		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
> +	/* We don't support GuC releases older than 70.29.2 */
> +	if (GUC_FIRMWARE_VER(guc) < MAKE_VER(70, 29, 2)) {
> +		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.29.2 or newer is required\n=
",
>  			  release->major, release->minor);
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.=
h
> index c108e9d08e70..1b1fdd103b9c 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -12,6 +12,12 @@
>  #include "xe_uc_fw_abi.h"
>  #include "xe_uc_fw_types.h"
> =20
> +/* Create a comparable u64 version number. Prevent truncation from small=
er types. */
> +#define MAKE_VER(maj, min, pat) \
> +	(((u64)(maj) << 32) | ((u64)(min) << 16) | (pat))
> +
> +#define MAKE_VER_STRUCT(ver) MAKE_VER((ver).major, (ver).minor, (ver).pa=
tch)
> +
>  struct drm_printer;
> =20
>  int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
> --=20
> 2.45.2
>=20
>=20
