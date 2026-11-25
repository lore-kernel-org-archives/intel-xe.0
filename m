Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CAC606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 06:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B6HIvOxB;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=I6NkqcNZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8998510E08E;
	Wed, 25 Nov 2026 06:11:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E5010E08E;
 Wed, 25 Nov 2026 06:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795587063; x=1827123063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=noQJXW+siq0u09tg3YQDK+IurTme5jXOiAipjiVRLUo=;
 b=B6HIvOxBB9Y6Ac/HEmnwbcagUZD3xucjxCFYMueC+3O1G6nA/bYNPUvK
 EbBu9Uek9WuZlyvGKJ+8G36qeHBeNlk8KRjcs4nfz6ge1LsNqrvHUZOi2
 iL6WzOGJDvB2QwWKBfariAP10xtwaVPTKbSNe4L6oJO0pYnRQqpxMzQzY
 fqCoOSD15K/e+REdOR6dvEdwwUtJATTYmnJ2PXH9q7Jr2adb00k1CLN/Q
 wflF7XpGiokS+OhavlDmoVvnN126aZhrbYCQ9QIy7F36NBigpYelRDtNt
 n906mKXkb4ycv7kUK+zx211MNN3qHVv0yfN4ctxPNnnx2CZJmahmmmaEb w==;
X-CSE-ConnectionGUID: +21GM/d6RFyFV83So2WALQ==
X-CSE-MsgGUID: TOAktUUUSqmjzbNbgR8LjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4338213"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4338213"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:11:02 -0800
X-CSE-ConnectionGUID: fqJvzjDHRMOVLFe+L/5XDw==
X-CSE-MsgGUID: URalI86KTtqiIzMzsH5obw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="13454548"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:11:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:11:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 22:11:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:11:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7PC9cAg9zD0pw4KUT+SCwgILjVBudZ/fGC0fEzhgfACGyzLc5M5Cxg9/TCiQ67KRkawRiWTCnSuIgIFcIQLJzhCwOrBP4lvP1ZuReOMWnTetA7cxqCDw+CDfW3B9EggoLRRwHgjU876Bgopkh7MYxg5nnh6Slc6M1wVBZaF1sBD9jYUaAY951eI3Hh54I1yMfQgj26jrQwHqYhPTZxH90uh2gU1kECtdPW0rjJBN4Qga7j5vFVoGfWGv2gZfRnWpvTELVloxOW/6J/MJtMCc1QCMTYvJafXHxz8y9+G22QlJ9LCANeBeeIUgA1dXCCuoPu0CyHz2w59Y0pJQReebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Bi0smPQFLOOOaOmmN2Yp5cWsx0jpSJr4vdFUSF3jI0=;
 b=LkZxibFBQmtIda7YUJd2lzJlZ2tnVJtgFTH350LNCauZTQSx1D5NmooA8a2BttDQy0cieg/5sdGnDa+wSy2SVySdkwDGRKbwp1brQfyZrGz66QFIIiim43Rdjedh3fvdEa47z0RjTSQI+xY3dzTPXk3cQePt2fD+X/tXhqZNtakIz0BJ7mqnnPOxfy3nXgVhJTcJ/5BmH6WdskLdj/wv+E/2a0hEFk7BA1MOGoDKthV6rExNrHXahd0ByxW+IB9L6zDUEFaj1HRCXqmRKCfvJOpBh8Fqb7MMAVTXkj11Z43RFSXA+wnAl5bMJOMyE4BJKUDVOPZzrYfka5zwkMyM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Bi0smPQFLOOOaOmmN2Yp5cWsx0jpSJr4vdFUSF3jI0=;
 b=I6NkqcNZLZQ9SSoHvlqnYzSzoqOoTtVRR+HQgn01AadQNZkH9MMfMJEdsa9Am9pXVOixtzyr3mSYHB6OQwhpzcFLKV1xM+TxijFIMNObsoazT98u/UGb82cp9v/VFL8Cuoc5/0MyS8FzEqIPm/CmPLD+C9tjki/ZaDXsAnwZsV8=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH0PR11MB5281.namprd11.prod.outlook.com
 (2603:10b6:610:bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 06:10:58 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 06:10:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 2/2] drm/i915/display: use str_enable_disable() more
Thread-Topic: [PATCH 2/2] drm/i915/display: use str_enable_disable() more
Thread-Index: AQHdfCK5VfNLKG+ECUKI3Kom0+WSM7c+TxPQ
Date: Wed, 25 Nov 2026 06:10:58 +0000
Message-ID: <DS4PPFE901A304FCBE2BE41B24614CCFB27E3432@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261124141146.1560208-1-jani.nikula@intel.com>
 <20261124141146.1560208-2-jani.nikula@intel.com>
In-Reply-To: <20261124141146.1560208-2-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH0PR11MB5281:EE_
x-ms-office365-filtering-correlation-id: 992cc052-5adb-472c-4f19-08df4abadf77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 7DYkdEbPeu9nSkQwnewr8rPdM9PhjXaezbkZpl0DocCfLWLOctmqKUN9PgXcJdi6rY45ZvMpAwHgq0BeSNg2eRFDU83AbOI6tsf8n5ot+1T4g3oIYtVKauwBJhMyOeGMuRLKKYR9hxOtHEUlZDQYP/6vchAno3Xop93warG4yKMFNsg46/OCb3XRlrcssaMzxmF6RSpvNFxo8//XwOmgG+GiGOl0m8olmxDTGFsW3kJgyFDZogLS7+EFh9jNag3BZ+ia/GoiXUsmLZj0Cjn1HxkhmgKPp6adJP2rZ7lSz1QtBlplktA4N6sIl/kACWAQi2Y1rs54JxaE+B/s0DJP7bhlmDLoFo4jrpaw6rmZcyxeOThkt/ksSsDrpA1FaFa1jSExM7p2zesTEYOJIcVgECoSSTSmJt9wLpzlH7eMgVHP6fP01Kyh4enX7mwRqlQ3s5SIKolqIkLYgTjYvvQ8z1rqk8irlh6bpu3jgZP73KOoxBjOXzdD1asLYxA1TIWPVWOE/5j0NftC4awOHkHRC7dMk+A8fiOycVNA4XFd04ogt8wk8uSxwA7QP3DQkX7fXdPF7Bd7UuqYEZb9NRddjBewn6Q3tRwWD2k1XaU6VfZqJOqFvLAJVwxNtH9X7Ph1MzoIuqNcv5RuNIW+wQtXsJmJYRaH3UFYHkSphqeDc4kbmvuP/NiyheuvpnWgrX2iyD01y2k7Z67JjNstRZChaBZ0YxO3Z/5EWg0zvmJdsGI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BXuxfXDxtOy4abdCVenpBiwATc2ZR4tCOUSTXYiFe4ie5AayFCAMS1jxNR7i?=
 =?us-ascii?Q?k/u+pnRj6IIk+Ay+JhDBgt0hTHsZnbdtS0CxgRRHU8EKtG7o3fPntwQjFUxM?=
 =?us-ascii?Q?OJwdSHa2gztDBITsn1Dk2XO+fQRUQU3Ts3vnGrho4nzHQ6gze2qScRKcUXh9?=
 =?us-ascii?Q?oXY3gO+FUM6+hEJW7V3Y6jynQxX0ddEDMs/g39YpLrUpyuwurZIcRb83oxmz?=
 =?us-ascii?Q?ScsJK+E/7w1vJWYcANUIK56Foud5gs5W8zUw4ymBT27/DSM+oYMSqqU6XECx?=
 =?us-ascii?Q?v8dLRjsZ6s+DQkE/U3QOuCrGzkD+TFXO6aE3s5gQ+bC/ge139Y38GXiD4oVE?=
 =?us-ascii?Q?C5mYelzlIepMXIrCGzH22dceo+Imuc3HrJ0/PuykoYgkzZnFLCfIdtOqxC2O?=
 =?us-ascii?Q?DSFE5iZ8to5DI1PC0ju/LKmm7Jufyn0MeOxvAYG2Sh1b8yCSJsgAeaG+DNPJ?=
 =?us-ascii?Q?PiaOvGrnH6483VhgAlWbTO/TKOCqAL9sLeSacya8WB6crJ2B8R0Fj+q19oSg?=
 =?us-ascii?Q?Wv7bXDl2Vo5Eb9KWIaBMiWf2tFeYCF6qoMwCydjJQQhzeZ7KxXkhIM9li0n1?=
 =?us-ascii?Q?g5VddNv2c/SFqv/Jd4XkmCrYkqzXFyfdPQLmOje8J/TxUqI/Lo32egVWh10A?=
 =?us-ascii?Q?QjGydHDz3EiFtoh6Kxwe/7eLVOzCm75MNO1A1gg5QJ/13dbQ0hJnyMEyItjS?=
 =?us-ascii?Q?fS3/UmvvplIvdAZJhNxjdsbbVFNSWCehkIvV8ZuMwa7m+8A11sMSvF+hRfNC?=
 =?us-ascii?Q?/MwKio1ZZCeiQZpJBLaO6cbPoiLh5/yzezzg8fLxwhpNKK6jyrFm3adVqyID?=
 =?us-ascii?Q?OfXjC2884L6hpnm4P2PWer1lFRHdv2VQM8iIecTX4tI3x0ZcPgQ1hI08ru7c?=
 =?us-ascii?Q?R7xUrOa5wazIh6BypkPhPmPgVcnljVjw/6HUtARkyO0Ikw59ivGuR8sxbslD?=
 =?us-ascii?Q?2ZkCXHNAc902laLHWDnUiUoRDMBfx2SpEsWO2QxkZC+2HVAsHhVfg44ymu0X?=
 =?us-ascii?Q?oRGHdDuGaK3WBp3IjRJkHlFleoPD4pfBMQb9umn0Yf7S5/EOW98Hae3hhsBg?=
 =?us-ascii?Q?SCjd2Ine2OA+Cvg7r6NoE+H4jl5EmNJnSrhmzCUdHGT6VjQo+cqfUeha7vSZ?=
 =?us-ascii?Q?z54c51sK6/MtItX4dQ8T8pNUDSjvHWPYK4b3LGMVXO2C1VYNtA8embbsdWfa?=
 =?us-ascii?Q?WQe4wJt8pD3B6H29xQMnlSmQxkD55/E31R48HuBbOhH+W5eCHGHCLiyDoSW+?=
 =?us-ascii?Q?VT3iJ6l+ih1rgGX+4sV5KSvKsJtVJmSYLHy1JgoyFRsR+tRnc/n02mVS9x+S?=
 =?us-ascii?Q?ogLTzawZ1lhfUPmcE0+W9VNZo/o5EEz7jm0fQ4yEHbTxTPA7gEAAouIyn0n8?=
 =?us-ascii?Q?Uo6SVUoz9B5DGgeWpzDC5peIWitu1czp5X9NyCinknjIgBIa01LKcCltlFI7?=
 =?us-ascii?Q?FfAlRkn1RQsmU5Lm+UfFcwOHAx7C5WrWYnrRAsM4TXCNJqcF8W5PTfIPbtu2?=
 =?us-ascii?Q?4NTX+93O0eRJEnz37IJxK4tQXT9p7EAVfdEMSPGKe9VwHLJwyL5BwIECX4d1?=
 =?us-ascii?Q?57Nj4wySFSVk23yDBKF4L7EwcXrQg9MNB713hdoZcc50NYpJmcLXntJiDlYa?=
 =?us-ascii?Q?Nc64jfBF71tsW7VeTmzEWJmSoCtSggRXPPx3wAB/fpz/UhG6fcyC682Zc8YL?=
 =?us-ascii?Q?skG+oAnXUMgn8ExbsClhnfQqPaplUbolPMb7cW1i2JpVaIb+ZkfjVyJbzv/H?=
 =?us-ascii?Q?GIwc/JbJ7g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vj2+5s8vJJ3I9Dt/MtN/Lrp/HwlgNlujQHaytEbjjI8BeINSdn+zoKUtP3WSUbsgnO/rah7lZLZgqyTNluo+CdE3jQLPHPzLhTm4ytZ7f+ACi7FSFonWb/n7BKdoCACfXm2ml6cdFCZK+uiJ4QaX5VupFWzLHy2fdLSzg1yl1XT8cvwRVa00UO5T1hjQ/3c50wyGY4LZc6IFD3OigIDfXTjMKmnCsTffLh/HqASQy0SHujxPKxGjpbwkvlvXSv8xrH5tlj7hR2zP6VMYDU/eOwpyZZDaQLWKTZhlS2CI6GRwWvAgU65mi7qUZyCGzR8hvRAPaONWGfO6iSs9r+SXLA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992cc052-5adb-472c-4f19-08df4abadf77
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 06:10:58.2981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8sUYhEKZ1vsNvhoWzj8YUXgeTb22PvssogYgB4UrLcC31CKh/hV+gkFlc8iT9cDKb2M93Dd4zGEx3QZ+L6jlDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH 2/2] drm/i915/display: use str_enable_disable() more
>=20
> Convert a few places to str_enable_disable(). Improve the grammar and swi=
tch
> to %pe errno logging while at it.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 4 ++--
>  drivers/gpu/drm/i915/display/intel_hdmi.c    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 566a921d18a1..33cfa32791ae 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -756,8 +756,8 @@ intel_dp_mst_toggle_hdcp_stream_select(struct
> intel_connector *connector,
>  					 hdcp->stream_transcoder, enable,
>  					 TRANS_DDI_HDCP_SELECT);
>  	if (ret)
> -		drm_err(display->drm, "%s HDCP stream select failed (%d)\n",
> -			enable ? "Enable" : "Disable", ret);
> +		drm_err(display->drm, "HDCP stream select %s failed
> (%pe)\n",
> +			str_enable_disable(enable), ERR_PTR(ret));
>  	return ret;
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 667d4514c375..ff1106b70390 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1572,8 +1572,8 @@ int intel_hdmi_hdcp_toggle_signalling(struct
> intel_digital_port *dig_port,
>  					 cpu_transcoder, enable,
>  					 TRANS_DDI_HDCP_SIGNALLING);
>  	if (ret) {
> -		drm_err(display->drm, "%s HDCP signalling failed (%d)\n",
> -			enable ? "Enable" : "Disable", ret);
> +		drm_err(display->drm, "HDCP signalling %s failed (%pe)\n",
> +			str_enable_disable(enable), ERR_PTR(ret));
>  		return ret;
>  	}
>=20
> --
> 2.47.3

