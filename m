Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D0CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9260010E274;
	Thu, 11 Jun 2026 16:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8fFb8E2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8895810E274
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781196990; x=1812732990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G4qc+kHSdOJdaGC08VtPqjNUuFdn7yL5SHgLhoFVT7s=;
 b=m8fFb8E29Rl6yQYVc0c/DqvEmSuz9GEUYA3VQvMvB6moQg0lZL1RRhNC
 cY2mQRROmnuzWWjsPDux/cFpPy0pZdNzF1RcTvP/FpEOMe1QqkJZyp9xY
 Zmr/mp7Ur50NXnWVejONf+XyteTQjqo4hekEmiQxvDw1KRy6kz9zZMJuA
 PK4MmAjGFig0wbHiqmbkSfAq6FSuVLWOz25NL82neiFPOqqy3hPU1x5tW
 BqYK158Q/15tAIiEMuT6qZGlNcj/cvd4rhhwOh/slUzGr4N97vasYZHVv
 /upZhBXh80MpIN0gd6ILgxxJV4QxSbn56Krxuv0Ftmlr/MC8EgzhsC38L Q==;
X-CSE-ConnectionGUID: mfhY108pSdGREZ4Ho30Hig==
X-CSE-MsgGUID: 0pijBJuvTWylttQnpS+tWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93124499"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93124499"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:56:29 -0700
X-CSE-ConnectionGUID: VX3JhLmqSqGMdOuf4l9sLA==
X-CSE-MsgGUID: 4fR8QZh1TA2BWg1sQlxdEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="276727228"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:56:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 09:56:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 09:56:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 09:56:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odyTIQXLqlwe4yNNXgKXfSGOsOeFWG0Ko0/w5pc2MARVnKZqEI6yS4NB0nANGqDwEyVCJ3rUP2rDEFXJXvuUCFJ8p3GBI3IQrTWf6mU20zhwVReGzj2DZlJa3q5RMgFfSTzALlwxQsJVOa99rmtvsml87V1tZrDZhuwAaevmP8z6Rts7OPBLhzF6zSPzA9Zgh0rTQ5lUs2OMu0QSC2Szy0EdD+cQ3k9Sd5/1JT0t9YZx9ZeVkOOGakkOA/b3mFJLTaQ7anVBPEUMDX2MmctCfN8cMDzYrs+oI89m8dwaLL0OWL0GlGaZwPhG2CCA20d2jsHlGD5KqlD4epCpk7vUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsSjgXaT1VFW6dSRR5OCIspMYWjz/rv8voip8n+ZIkU=;
 b=nGyMREeSvZialEFE8rmwGA5ya6k+VYCeuNfntRGsuLQtiK2GGp9dv6fdXr2PusJWbpewCS0+o3hqZoJWI5fDhL41rP42yJo89bh5udzR3QwXHbDWdUuduLH8jDU8bzsuBHTtz1ijbJMSQOmTC3Nendt5gWpW13+womm/tSbCHhR+3zeXAvoU4VzQVox0voLz6cgQvVriQXw7qjBu7/Ryt4zk8tHJI8Xuh46qnVDCCkhfaG3r8/QDfl4M3IFuW1kJsXmN8DfJCk0iESPlTeqNul/nqMsszWkcukmKUAu0kXPM+MEbPUnCLvocIMIDXyCQ6smp3zP7ZLDc97Vr0SkFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) by
 SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.12; Thu, 11 Jun 2026 16:56:14 +0000
Received: from DS0PR11MB6424.namprd11.prod.outlook.com
 ([fe80::9137:2289:db99:59bd]) by DS0PR11MB6424.namprd11.prod.outlook.com
 ([fe80::9137:2289:db99:59bd%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:56:14 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, 
 "Purkait, Soham" <soham.purkait@intel.com>
Subject: RE: [PATCH v3 0/2] drm/xe/debugfs: Add a debugfs for pcode information
Thread-Topic: [PATCH v3 0/2] drm/xe/debugfs: Add a debugfs for pcode
 information
Thread-Index: AQHc+cHsfGHvkg8OL02qbwvcnc742bY5krbw
Date: Thu, 11 Jun 2026 16:56:13 +0000
Message-ID: <DS0PR11MB6424AC2ACB8F4394BA2528F2C11B2@DS0PR11MB6424.namprd11.prod.outlook.com>
References: <20260611165607.3653019-1-karthik.poosa@intel.com>
In-Reply-To: <20260611165607.3653019-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6424:EE_|SJ2PR11MB8565:EE_
x-ms-office365-filtering-correlation-id: 015cee25-8d89-486d-219b-08dec7da58d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|6133799003|38070700021|11063799006|5023799004|56012099006;
x-microsoft-antispam-message-info: ETpGIrfnU9kTliKfX2ST/zHVfcRLYBtlEZ6wVeMFVGz21MyNjyvwmM5Si7+HN6md8v+rTPxGrAn7/4SdUmVk74PwmhBRQA3GWj5MaNAjA7AN8om6mRjWo+w3ldhx7PsMxMRboeoaO/snAgHD1P0Ut4S8iB6w4O8eFiPGkzsDcbsKQFqsYbO0Dw7dNMGRoY6kY0eMdGHNx9vEi6491Pwqax/2KnFmjGsAlp+1vnzse8zmPrXVcow0TQxVbLPvky0Un5WwKfoyuWm9S0g6QQHDj1wOmzobzfKPBYZxWKSCDBRgrlq5FeWMA7ArRwObFLyax5kA0XEGfvCoH4/xC1sLsC37enmSxGlWOLs87pXPgNhIqBHi+w6EnMdZf1WcPTCWfMy8xUZPSU888thKeZPD6DQUBtUmsrbziCq+CKq5Evp03N1tioJ2qEqnhhPagP6WFRJUxG8arBYV3O+b6CkcKs04QvJVWV3+v+IR3HiJr0AH+HXXjzcCMWeEeUis1qPlISUC++rhU+8RdCYVt08JqqnAFJ37Uswka36udq6ILFumi0/5R8Zx+W89rCltjH6sW4FLDzaqOyHKxcmt3kM0KBqa2qBtJosdgYc1gsD7HjETa95s1S2M7NsH/NqHHBc1yKFB3Zi/CbcPPX/0YgmaigWlXmrH3asmHWn2/QStLvkZguZk5PUT9NpHHRK6bmLgLocds/7tV5YAabSSUjluildEgiuoN81Oq3U3FzxcjS0VJkqawVjIQ20kTtmzwP5/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(38070700021)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XaPr+p47rhDgkNlkoA/Aal65M9h9kbBVEU9QeI0bocPESxKTDjdywdVQG5lR?=
 =?us-ascii?Q?+rOoX9EXVFZTPPv0eTFku6P6frzMmodLWyHT8TzrQ1heKJ+IkZ/lEpsue6sV?=
 =?us-ascii?Q?SirCzX7I+gLvvz2Z5texP9HsR2wTlK36d5eALYawncIfoHlt+zcEiAO+/MLX?=
 =?us-ascii?Q?z0RQUeLImMwlUcJmE147UhFxlXFvqNl4A8CZ2sbGiNMExhnnIwt+zOfi+jz6?=
 =?us-ascii?Q?viBHqo5yErFn6a/iiA/kk9au8feO9lGYNC+lQacW9ZMogziY2UuitKA9C6RX?=
 =?us-ascii?Q?8UCybByvL8d4B6sJvtkXxX2viF4mRRS7EpIDSKSK7o4+M2qGuVyDFDmFdrZA?=
 =?us-ascii?Q?8ibJ0oQfHWvvV0zex9C1m05jcI0QRS1Nl+iSgNui5CY4y2ftqMymUisywzIi?=
 =?us-ascii?Q?ekCgnMJ4CPqo9Axk2gDNj/vKdZtTOmTLAfT9fxJGqggA5JbM/2V3q2VqOTrF?=
 =?us-ascii?Q?oUVil9S85hZaHdrsDrTCRRqVB434ZVOV6KPH0rg5M1eGg2OtUV7NcxLuHgtI?=
 =?us-ascii?Q?GkEVrKQzQUGx5j5+ZvENsnVW7H0F/cMVzM5f2+YgtdmkU9V8RbT4SpiEc8lv?=
 =?us-ascii?Q?WI/Eyaj25HSqXKcN0iTQVRHdJDMAu6qv2hvYcDXy1N3X9m0HpmClC28M+i37?=
 =?us-ascii?Q?1YQ0F1zszNt/THqxoNotH2WrgfjXfELRdNJXikOdQAkg7vKp3YFoZEGz1jmw?=
 =?us-ascii?Q?Zf58COLB5gqhClHfeTtLX1Xc1abjrH/IkKOGiwnmbdsJe+ruf4SQvr0Qy+X7?=
 =?us-ascii?Q?isqBKVOpVhRboCcCYlcLpDl0dbhqIMIvHM1ymDUWkj8rMQCKFRiuUyVmx6qv?=
 =?us-ascii?Q?N9fqt5pmJaKvyXuSYR90Rm/anAnGPJmr+aIfC0GX9GI+kyslOf7e1gDQZ15X?=
 =?us-ascii?Q?+QP/YnO2SPOyTdJkjL220ne+Z0eMsDAwUgRDNDejVy4BDgf5QZLZR933JFXK?=
 =?us-ascii?Q?vW8cSf7Bl0SAlKJu4UM7/g3be3EmKtU2Y3xXtuPGBiSTajXGc6ylubUpMJwN?=
 =?us-ascii?Q?2EuiZW/zGJtbAUnFi9yrpTc/AxrBH59MwZ4Uu29H0kQaQiHvPuL4OEL7fRWV?=
 =?us-ascii?Q?/txQbL1nSwnZbxChHiI9+8TQBbFVeV6XwFj68okPdFTozeCoTUk9drv25lR5?=
 =?us-ascii?Q?paCu+WRh2EeXpX10R3UF13j5u8vnvLlGw6CdAdZ6NB2YeF3kAq7rHq5wC6fR?=
 =?us-ascii?Q?NodU3H1EhAfOks+nhaqPa1jpZkD8l86LmmQWHhLn2WFjLYulA7W3jebFzY7v?=
 =?us-ascii?Q?3OJDsZvTxNkIEtpe7TjFFexIvS7MGnyc/T07frRNDR2dhkWukpbt06XM/Psy?=
 =?us-ascii?Q?yRlhyOGOfiXvXK8DTWOAsEg08tlmISs65LNP+GUmYUQALqXnF/drHTTprT5o?=
 =?us-ascii?Q?vX+NazOItQAaEgbdGkolIbAQMLA0MuC67AZT7hdZd6rWKFILYwhSKNftCqV6?=
 =?us-ascii?Q?lV5CggjttjpkZhGjP3ukbxBS3/qIDbHOaJnWndV/d/b9bgeQfvf4JsAwLtw7?=
 =?us-ascii?Q?TC9IKnBYSwDohPJZZ6g7CIy1e4P/uUGhx/TlT4ugwvHnosmcCBZOaRSYewyK?=
 =?us-ascii?Q?WYWED08vNFJXB0mBJY/QJmq5ojef31658k7MVpxhb1kvzvLaIoLeissOQAf/?=
 =?us-ascii?Q?J79mF8fmqvz3erQ2ftA0Q86uFMgtm8zMD5gW9XaahKoqRnSCbjt/oI4fQINu?=
 =?us-ascii?Q?+bhOb7PE+Jb1RsSKJO6v4iLNzWk4PhnIZXY3Bnf7YHSYGn5Ap59v9KF3DVXL?=
 =?us-ascii?Q?1ISwy/V11A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BTKBp1Oe4w+qHFay+zQcKV4ecT+BTNt/40bTxI3q1L/1dti3dcRbCRxrh+Oe/x4pUK9RpOGVTYoOSex8JgLhMMo28XFKgSrhDj58Uz9xeUBzL3vfC4xHNoCMfT2BRYeNxPcTGnSB0v/XzUy5RP5V8zgSdzpPGRrw1tOMtgAlFQGhWr28SZBQta28FBdTtqo60Zfdn5AuaYeebmxzOY70Ju1VnP1ZFMAVDcwudhZRjvB8WzRNdIluG/xbSyFuL+ItpbOYILzBMVSXD1m0pgddqcetrYw3Wku1D2w7mYKDh3DMxqfMU3ddXcEWPh2s1fFqUWYr7qZKQGpicwVFaqLbYw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015cee25-8d89-486d-219b-08dec7da58d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 16:56:13.9864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKHFFbldijjReeLQDDh1xHCZOaF8x3bg0O/tlW2ph7DcyEVAcHKVZ9LdceT25ZslHgPcXRPIm2uldmuQAoz2nHjmJSVaj2nafGzx97ixhRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
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



>-----Original Message-----
>From: Poosa, Karthik <karthik.poosa@intel.com>
>Sent: Thursday, June 11, 2026 12:56 PM
>To: intel-xe@lists.freedesktop.org
>Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
><anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>Jadav, Raag <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>;
>Purkait, Soham <soham.purkait@intel.com>; Ruhl, Michael J
><michael.j.ruhl@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>
>Subject: [PATCH v3 0/2] drm/xe/debugfs: Add a debugfs for pcode informatio=
n
>
>Introduce a pcode_info debugfs entry to report pcode details.
>This initial implementation exposes the pcode version which is got from PM=
T
>telemetry.
>This can aid debugging when the pcode version is needed.
>
>v2: Enable the debugfs only for supported platforms which is BMG and CRI
>as of now.
>
>v3:
> - Move platform check from patch 2 to patch 1.
> - Add a comment about why only BMG and CRI have pcode_info debugfs
>   enabled.
> - To runtime reference of device before reading from PMT.

This looks reasonable to me.

For the series:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M
>Karthik Poosa (2):
>  drm/xe/pcode: Add support to get pcode version from PMT
>  drm/xe/debugfs: Add debugfs for pcode information
>
> drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
> drivers/gpu/drm/xe/xe_debugfs.c  | 19 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_pcode.c    | 29 +++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_pcode.h    |  8 ++++++++
> 4 files changed, 58 insertions(+)
>
>--
>2.25.1

