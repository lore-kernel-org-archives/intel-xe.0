Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6FEC71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 22:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D2110E740;
	Wed, 11 Jun 2025 22:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpJczJze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C763D10E740
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Jun 2025 22:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749679512; x=1781215512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bpHnyZUG/+3rjpmETWO9B2RYM5evWzDTPdq8odj9FT8=;
 b=RpJczJze8PpgkpAYw3PKIoQc7rUMde3Ur3Ch6x59/rbXqJsOgy1CjTcy
 rlN4YxOKCJ7vWrh4feGIbQHW/2dbk2xvx1syE9D+iZMQ+22rn7lcQr0oW
 ZGE7LPota1ngxQvP5gndB0KOOHKtZPPSx1C4QjPfP/SZxhi0FBCdPsKoQ
 dAZpB+w68eAeqsTBNwiNxzTrrIo8gKO2x/wLK1khsXW3M6EzcO5fmeWIv
 r+/byWKBz2bMX0UaA6YSLs8PZfMRQnAaX9i1v/8VTWMsa671SCxAI8fcG
 AkrTjI5nXZuuNgq9ZG1sm0C2jwJFo2PIqXSxu/QVCCgGywuchbOkOgCIQ Q==;
X-CSE-ConnectionGUID: +I62+sscQiqBNqk8PsNXAQ==
X-CSE-MsgGUID: RDz6RJzSQ1mZEo+RmGm6BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51978440"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51978440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 15:05:11 -0700
X-CSE-ConnectionGUID: TtrDmLugQdW1YwCqhDnlBA==
X-CSE-MsgGUID: QIIrf69AQcmCgM/ykQJoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="184528317"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 15:05:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 15:05:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 15:05:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.86) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 15:05:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gw2KeTM/0qy1dHP9lRhNZEavZ9ekYD0FVQWV/BnFs5ox61yqe7rWtIHBGI0S/31PW3H7MHcyE8nBt7Urfbwgsk9lG6Xoy72D/vodKeQSVmFbphVa9F53iFOxNTnpXuAR2pdat0T6+scGgDVamecMIUnWlmEBkOSvsOfkIvNHLIQXf6C+sGzd5V9KTyLsiE4s+kBAnZSLw3PQYB4fsCdkav4wXbt7q8caAQbp8xmJWHC/5MqeRD5dbSG56Zs04WBJbx6o5S2adAy2H8tl8Hgfj0EewoYPa1NEmoo3/Bu4N7jv3k4B9PTrwoCSKInm0+KJ7UX+qWXyvpEGRrt4di0AcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glssl6pjPaK37U7VT7XVfOtLjoTcA7X5jr7T9EWHjuU=;
 b=VLxpiUtpsuQDyIDw6m7/eBZ+oFzU5VgTAV/4BHhfFClKwYwyVhbhDQ/DVw8bDbE32dDuWoe+LcGYNLKwC1BBsUMpDTX2a7yKeEHv3Cfr/K0W+qO+PsiSniIKxm8nIslxKR+vKMQLh6cqdEpMT8IT3KkPyiEmIPSwRWgKl6ZLzsTmet55BNLlutPVXz2k0rqKah3kaAilAQybIMiTr0xoOPJPZEnJiCE1zbUi4Sc2F2FM7g5hTr3rlbzWw8zewE/d9Me77un62j3TbHnDkF++wg/mCgN8CDTaewc4CA3BsTw1BqNGKTmvGDyJxalJsfynIA8KQVPOvjCAjxlL3ZfmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 22:04:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 22:04:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/guc: Clean up of GuC 'CTL' defines
Thread-Topic: [PATCH 1/2] drm/xe/guc: Clean up of GuC 'CTL' defines
Thread-Index: AQHb2xS16spU33UtCUqkNRV7o6W8BLP+fBxg
Date: Wed, 11 Jun 2025 22:04:52 +0000
Message-ID: <CH0PR11MB54440646ACCA2BA671D29DEEE575A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-2-John.C.Harrison@Intel.com>
In-Reply-To: <20250611210553.3756700-2-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4771:EE_
x-ms-office365-filtering-correlation-id: 90e3900e-df6e-4732-2776-08dda933fe09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EHOYpxu6oW+Q7HRipjkl2OlC+O6Af7kLB7/mwZ0b7M0FbDcQ/dQncTi+Oc93?=
 =?us-ascii?Q?Y3+YaKqd1BZvpkrOX2vS/cnZx9eN8MagkFvK3cRd9QBnBx/MBD8DvSCPVGLU?=
 =?us-ascii?Q?Wz8fDfZsjNUqM1rDyyBVarGDcX4R36c6Kn1uo11sxyEW/S1U5mCRQso3X1MV?=
 =?us-ascii?Q?TpL4H5aqzy0B24wFAeEZy9vQY3MjFYzRaA8Qdn10wxtx3lJE1/NW2jWNW+DT?=
 =?us-ascii?Q?fMp3RIYgctMEsvY3pJZVPwGcRpbrLow5wM6MIKBVZukYAF2JgtuzR+ZRvIGj?=
 =?us-ascii?Q?YRcwHwsm+nQwAexIXvDvLS5XcdhTK9R4Sp/mNDBJEeC3hOxvW+lPKoJzj68+?=
 =?us-ascii?Q?d4OSNxRlRyO96Q/310sNft2yFcHfIxYzIfZ1NdnPkhBdFHExyXtdibHM7z47?=
 =?us-ascii?Q?OhtbXJJ1QborZDM2pXNQ+YPvC9awvBwC1Vqwd41jHyqutzBzAWEV6cVj6ulX?=
 =?us-ascii?Q?k5P+VtM79JGLYD1Yx4acCUu8Dloc3SsWmG21HxLqkqLuLlB5MSgIIdUc5h1X?=
 =?us-ascii?Q?q7BeUt6GBw7w7aeytpPKgkgPDkd7ibfEYHx7cIQBWvR5tZufXJVy7ZP8wLOR?=
 =?us-ascii?Q?23pyZ3X9szNLk8aaO85cC+6RGlyaqIX1PNmKsRsQWzk14rSqslXllLexhmYt?=
 =?us-ascii?Q?WMgQB/++//Lym0wbKr5VuWbRDSXPSrkzJgI0qre7BemJeaCFcn9YZdk2WKN9?=
 =?us-ascii?Q?pwutMTNE1cZ6AUOaJYo3T7dJmKUF+HrQL1SFPKK3IaBkvTqy5Ha052/Z+Tk+?=
 =?us-ascii?Q?IHGIkFJOaXDF3Nf3tNLNMlnEm7+bRxOg/YKNQ1CAh6AM8dur5RnLYxJZy2c2?=
 =?us-ascii?Q?peYjiK6SLRhPUAb6pZVKKXxQMIMw/FBeuit6WcOR6dcmWik8CZRANJvoqB0M?=
 =?us-ascii?Q?yMFOKzKWde9PqaUNz5GgmRcoZYTMr8QVrmT+6VL4HoHaQ6wIuM8XaLNmxVJX?=
 =?us-ascii?Q?ibRaUc/FNkWFHYvxPd9/aqkMG55ozeiWXEIw1aSRnst1quS9+ePgE70LX62H?=
 =?us-ascii?Q?sGHUwLUd1kY51JArTKuU1hlk2xyiHKKXtRcnxBui4GWDukKykxt1XE8d8rVL?=
 =?us-ascii?Q?bkyAmNW7GwjfQqaFYzPSgIaZtl4NH9k+JhlLV4HHXug0Ahlp7FIStN6Xn05c?=
 =?us-ascii?Q?mWyska4y1PlyaJC7vEc3flUZKe09PnCnf0H35+JnFd1Ql3s96LkNyUBFVUri?=
 =?us-ascii?Q?E8qz4QG6q0zGAqqot0lX43X/XgcDumam8Ah2C+pQp+9NsfjLEDb7zwht22hk?=
 =?us-ascii?Q?O8/z3HMesDr+qKs4nyUyMus73Mp9+kTx6/JP+J7GDKbhVlbeJVwTxPoVRBxk?=
 =?us-ascii?Q?a7269vyeHIpTIXiN8nvEE0SduZBbHLiVAGENkNhJWMapn8+XRRgn7OHlUbGX?=
 =?us-ascii?Q?5HIb5fT5TzY+gefTFyGuAAN7IDETS/qDFBaIV8GqmIowKcH1xEJ74UDBZZgv?=
 =?us-ascii?Q?i2S/jSFMNpO3UctSbl/VdZNSReq+chka2FP9jJyKxpkL2Q3xJ6rJzQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O23AyWtkxhejZXlqBxoqCz1sNMAAIFRl2BXjlkRq+M4yaGwDKHOMXS32KAYB?=
 =?us-ascii?Q?mQTVbm42xamSQF086Me9CeokyXj9X1smUEZ5+fJ91PTOL1UcrkxcpK2lfmzh?=
 =?us-ascii?Q?S4yaguL/cKMwlQcxF8xr1TwvMETJ9RVOPEkKIe6XMIopINVpKbZ4rf5Svbo2?=
 =?us-ascii?Q?9L/7L1twh8dSVPyV1TckqvcC3TzemB4R+J6v0D7pritU78G219phEFZM5FKR?=
 =?us-ascii?Q?th723IjeWgWj+18QYFMtNQVSgCcyNthlKKD0mmEa3kyCjV+wSAKdwEMe2RJu?=
 =?us-ascii?Q?4didVM9Rxyk+T14JPmvIFpUK7CYPvX5mvsCvasHM1qVzjLdjUPYnCg4tsPbK?=
 =?us-ascii?Q?MA/uDVBoIdQzkG+XF3VXTboLCEbjK6HzQf5iDDxwkYgukt0JX4YnJlovFjoo?=
 =?us-ascii?Q?uaINy7pxszxY8SuAszqmGFHiJi5ZFC1Z8xOZrzvljD/3yoyPDB5LDVz3fw+p?=
 =?us-ascii?Q?n9kiNCe1JD5YdeGFU+0AKYRZfDQTOGojFOczCYVHHwxF/qbEWkx8Vvx3pYLu?=
 =?us-ascii?Q?KjhDfPW9yua/kZwG5E/6vMZODHeynNAiLPxDqex+vpS8sK937K68kqI3YU7O?=
 =?us-ascii?Q?7/oBN11Nptnq2lSb0mGGeLjFofVrUlCCtj/bhEb7/VAAOMrwaBW3wvIdSSoi?=
 =?us-ascii?Q?on59MZ5u8S1Qenl52fPnv2kyYVJOhXIbVLaoUXqMcD23BKHJAqEqWoJOHlnZ?=
 =?us-ascii?Q?5+eS0UUUlkD8aHM5RjB3IRuEOz5NYWuv9S08K0Y9ypTuIkQ+QQDpp2IF/f/u?=
 =?us-ascii?Q?umTrFNFXKHFSvl0UNRa3cy+AfFav2d5XO0oBaPKZSm3dHW9+tyxuTJDxAdyT?=
 =?us-ascii?Q?CtQD66XRLEzI21P83EPkCx1SEllfDIxBngIxrqYBnd0gQ6CrrNM0KyrqixCg?=
 =?us-ascii?Q?1ErP39iKyBkGRkX+wh8MO3C77Q2ZQUcA7DXIhJ/1xEqLFK/yLfQCCRwSiGbt?=
 =?us-ascii?Q?Z77TpYQZPfQBlFBpArGyFSX6YM/ay2WpYNTny7pH7AjYCwpLLMHqBi60jQAe?=
 =?us-ascii?Q?dIfIuQCPysaKJywsLS6oAo+nUQ7g3CtISyg9hujNcBqrc3XhdPfrjLc5A2pY?=
 =?us-ascii?Q?5TWcFF5gY69k2syuHWirhAvQeBaaP364WAq2z2PgeJxw4428qTWx6BpYD8Px?=
 =?us-ascii?Q?fu2TbozBWvq1A5WPW89JRMW7bpHfmmUe01I0Pd5EqeemLvEb3v5xpc+nbDAK?=
 =?us-ascii?Q?FFOroOXCixbkw03rPKHCz4lr+7GxYosAUClPk6+7phs6/H/e/fiHYT4KTxk5?=
 =?us-ascii?Q?FnxUHfvC0yRk/uWfeIwwoBI0ajmZP5i7Kr6CJ2GR8ZGTeocLLeXFzm2bOJGm?=
 =?us-ascii?Q?SAlYMsEx8hcpAupCs64vl5McfJQYa5ePnNaUmgnUd+MLisu5X8Qg066UZkG9?=
 =?us-ascii?Q?B97HRl3BRaBxn6eD83YdrrPz4D6t3AyTYSkeirTrARNdT8QM7tZOMmKq3Fx/?=
 =?us-ascii?Q?g1IDBgvhKYjoGmBoRyip9cgooroaBX2tjtoVbGkQ8XF9KPvURaKbIDO+hRjK?=
 =?us-ascii?Q?O3WiMGjtc64x4w/EEGQUGGYRiUebjBybDjgn9UzQgXv9EW/Zl9TgfrIebnCO?=
 =?us-ascii?Q?F0Evf4Ffktvq63IOk93WmitepiKgkb4Ixos4xy3/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e3900e-df6e-4732-2776-08dda933fe09
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 22:04:52.6715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qq8Wyh4js3ldKYJL2h3cjo8lmEt0sADvg+lUXq6nJ071BOYKhGxTFLt5kDtabonn9+vQSfjspoyyNy34SK2UetFkNJNVz1egWvdAfpvW1tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C=
.Harrison@Intel.com
Sent: Wednesday, June 11, 2025 2:06 PM
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Clean up of GuC 'CTL' defines
>=20
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> All the field generation for the CTL defines (used for GuC init data)
> were hand-rolled rather than using FIELD_PREP/REG_GENMASK/BIT macros.
>=20
> Also, there were a bunch of macros defined for verbosity settings that
> were never used - it's just a number from 0 to 3, why do we need a define
> for each level!?

LGTM, though we can probably remove everything after the hyphen in this
sentence, as the contents past it might come across as incredulous or accus=
atory.

But besides that:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> So fix that all up.
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c      | 21 ++++++---------------
>  drivers/gpu/drm/xe/xe_guc_fwif.h | 28 +++++++++-------------------
>  2 files changed, 15 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0fcdf389711a..e16d19b44bcc 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -72,8 +72,7 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>  	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
>  		flags |=3D GUC_LOG_DISABLED;
>  	else
> -		flags |=3D GUC_LOG_LEVEL_TO_VERBOSITY(level) <<
> -			 GUC_LOG_VERBOSITY_SHIFT;
> +		flags |=3D FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(le=
vel));
> =20
>  	return flags;
>  }
> @@ -116,22 +115,14 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *=
guc)
>  	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>  	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
> =20
> -	BUILD_BUG_ON((CRASH_BUFFER_SIZE / LOG_UNIT - 1) >
> -			(GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT));
> -	BUILD_BUG_ON((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) >
> -			(GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT));
> -	BUILD_BUG_ON((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) >
> -			(GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT));
> -
>  	flags =3D GUC_LOG_VALID |
>  		GUC_LOG_NOTIFY_ON_HALF_FULL |
>  		CAPTURE_FLAG |
>  		LOG_FLAG |
> -		((CRASH_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_CRASH_SHIFT) |
> -		((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_DEBUG_SHIFT) |
> -		((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) <<
> -		 GUC_LOG_CAPTURE_SHIFT) |
> -		(offset << GUC_LOG_BUF_ADDR_SHIFT);
> +		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
> =20
>  	#undef LOG_UNIT
>  	#undef LOG_FLAG
> @@ -144,7 +135,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *gu=
c)
>  static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>  {
>  	u32 ads =3D guc_bo_ggtt_addr(guc, guc->ads.bo) >> PAGE_SHIFT;
> -	u32 flags =3D ads << GUC_ADS_ADDR_SHIFT;
> +	u32 flags =3D FIELD_PREP(GUC_ADS_ADDR, ads);
> =20
>  	return flags;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc=
_fwif.h
> index 6f57578b07cb..b05646cb4fb1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -84,13 +84,10 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_LOG_NOTIFY_ON_HALF_FULL	BIT(1)
>  #define   GUC_LOG_CAPTURE_ALLOC_UNITS	BIT(2)
>  #define   GUC_LOG_LOG_ALLOC_UNITS	BIT(3)
> -#define   GUC_LOG_CRASH_SHIFT		4
> -#define   GUC_LOG_CRASH_MASK		(0x3 << GUC_LOG_CRASH_SHIFT)
> -#define   GUC_LOG_DEBUG_SHIFT		6
> -#define   GUC_LOG_DEBUG_MASK	        (0xF << GUC_LOG_DEBUG_SHIFT)
> -#define   GUC_LOG_CAPTURE_SHIFT		10
> -#define   GUC_LOG_CAPTURE_MASK	        (0x3 << GUC_LOG_CAPTURE_SHIFT)
> -#define   GUC_LOG_BUF_ADDR_SHIFT	12
> +#define   GUC_LOG_CRASH			REG_GENMASK(5, 4)
> +#define   GUC_LOG_DEBUG			REG_GENMASK(9, 6)
> +#define   GUC_LOG_CAPTURE		REG_GENMASK(11, 10)
> +#define   GUC_LOG_BUF_ADDR		REG_GENMASK(31, 12)
> =20
>  #define GUC_CTL_WA			1
>  #define   GUC_WA_GAM_CREDITS		BIT(10)
> @@ -110,21 +107,14 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> =20
>  #define GUC_CTL_DEBUG			3
> -#define   GUC_LOG_VERBOSITY_SHIFT	0
> -#define   GUC_LOG_VERBOSITY_LOW		(0 << GUC_LOG_VERBOSITY_SHIFT)
> -#define   GUC_LOG_VERBOSITY_MED		(1 << GUC_LOG_VERBOSITY_SHIFT)
> -#define   GUC_LOG_VERBOSITY_HIGH	(2 << GUC_LOG_VERBOSITY_SHIFT)
> -#define   GUC_LOG_VERBOSITY_ULTRA	(3 << GUC_LOG_VERBOSITY_SHIFT)
> -#define	  GUC_LOG_VERBOSITY_MIN		0
> +#define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
>  #define	  GUC_LOG_VERBOSITY_MAX		3
> -#define	  GUC_LOG_VERBOSITY_MASK	0x0000000f
> -#define	  GUC_LOG_DESTINATION_MASK	(3 << 4)
> -#define   GUC_LOG_DISABLED		(1 << 6)
> -#define   GUC_PROFILE_ENABLED		(1 << 7)
> +#define	  GUC_LOG_DESTINATION		REG_GENMASK(5, 4)
> +#define   GUC_LOG_DISABLED		BIT(6)
> +#define   GUC_PROFILE_ENABLED		BIT(7)
> =20
>  #define GUC_CTL_ADS			4
> -#define   GUC_ADS_ADDR_SHIFT		1
> -#define   GUC_ADS_ADDR_MASK		(0xFFFFF << GUC_ADS_ADDR_SHIFT)
> +#define   GUC_ADS_ADDR			REG_GENMASK(21, 1)
> =20
>  #define GUC_CTL_DEVID			5
> =20
> --=20
> 2.49.0
>=20
>=20
