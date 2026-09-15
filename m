Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D64C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 06:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A0110F99D;
	Tue, 15 Sep 2026 06:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhVfuXAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D48D10F9C7;
 Tue, 15 Sep 2026 06:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789452167; x=1820988167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dBg/zUscHIWW4GhZLaw3WN1AZjWzUMW9TqHqmZJ3BJk=;
 b=BhVfuXAxE9ONwFxEJtcwYQJhlMyauktuxIQTGMkFtrA0YHdkSB6fy2xo
 qjNt97sGHasHlfWZpv2DMhGH3nsChskFpcTQPnhKR6/TMu/cGxfZ/2zck
 zEAZJs4SDv5Ru5sCvjOf63vBRvEnBaeRDvRuUTEkajNNfHGQdqZQLlFpc
 rACkJ/hgyufmKjJ4DtLRM82DuK4JXOkp3xs+35gij/GgiKI2T8ZiNSvBa
 /t+NIHx/izwxqAhRuFWsWzpsObGyTrU4GDtQnSFig8bNGn6JrzQ7Wul4L
 +XaEnEHUvD5DMd9E46wMOyDOzGce6ksHeWOqHkWAC+7Ug1UuNJ3C1zm0I A==;
X-CSE-ConnectionGUID: EXT7/72sTgy4+ZESP0B7VQ==
X-CSE-MsgGUID: 3tSYxXFrQruyMfoDCXQV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92316797"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92316797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 23:02:46 -0700
X-CSE-ConnectionGUID: 7iw41s4gRhCpOtyfPd+I3Q==
X-CSE-MsgGUID: c32T73seRrWdLJTZMI718A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272360876"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 23:02:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 23:02:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 23:02:45 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 23:02:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HovZtnlxUjQiVuNM91/eUf1BKki73Xv064tLLMCx6Txbv+zkj6wO1rwBowX9xmJ/G0UMCZZin+oskFaB+d/ejcB+tVegLYXZsZDk8/Fx7MVtDFVlRvQrqXklrgm9RYMLHqdiG4oSJCZFURrEhpg9vmR10dPJ0MSgjqnQBvuKzkLzxduDl46hk6G6pgJiKIpc1oLSF5X090VPBLB15xQQyq4wXvPzXLv+580bTfNd7TnoYuaDA3KKmt41HXNGXSAiHW0FN+2gdrPeieH3S/mawemZYNv1tkWOihKlnC+88gMEbnnuWFAR7dqDs3IdUGcr4rlUdU3Z2aGNUrjDtsDtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBg/zUscHIWW4GhZLaw3WN1AZjWzUMW9TqHqmZJ3BJk=;
 b=pv/Frmaage5+U7qWkfwnTdXZh5eHXsOz9UOj1uOtS2oZpauwlPciyzKkzmnNxkRlqR0R9tIjsiBTPwwJwKgdnryQoE1oJat6cRoSkbfGWv/LjqXmuKFGn/mul3oZZ++aw0Vqu58Q4F5OGYKilj6W8sk2HLz/7Pqj9NCRameX6eu3WfTt1pS3CdKr+c692f9tCSLs3G/AtF91xffTrWu3WJv1sFF4cUQ5MjecRX4UKmcqV0jl1SaI3hAUAHHpspT6yuHWMF5LhmnMLc9eA965QBkTyV5RNcFzsKGT5crEguzOlqHsAo17jheIBsiPmBMqnCsggOvappiD/L2NcmBdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CY5PR11MB6187.namprd11.prod.outlook.com
 (2603:10b6:930:25::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 06:02:42 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 06:02:42 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "Lankhorst, Maarten"
 <maarten.lankhorst@intel.com>
Subject: RE: [PATCH 4/4] drm/i915/display: debug log about fence wait errors
Thread-Topic: [PATCH 4/4] drm/i915/display: debug log about fence wait errors
Thread-Index: AQHdQVz0rvxdx0VKFUuUSIr66AKaE7bPLKhQ
Date: Tue, 15 Sep 2026 06:02:41 +0000
Message-ID: <DS4PPFE901A304FFEE55A75AE71B3B18544E3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789069102.git.jani.nikula@intel.com>
 <6b670a146bfcfd0cc2c7641cc8d72df96e356ef9.1789069102.git.jani.nikula@intel.com>
In-Reply-To: <6b670a146bfcfd0cc2c7641cc8d72df96e356ef9.1789069102.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CY5PR11MB6187:EE_
x-ms-office365-filtering-correlation-id: 87b83baf-4a0f-454a-2b03-08df12eef456
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: IkDLBdRzIhEZPDhTi7xsB8gX9DRwpd+3ScNB1AUeDkK3/YqPplH4XN59Q/2gTvSh3zln+VdWgJ1P9WjAVKParZYD5uRRVgXRyWyhkwOqAxbMUST2DY3KsmGqs+E7KIpnxHEl66ATtW3QYc9kgCzL4qGHPB4pcZpGl32BQI7UFrVC1eYd1nMZMhObyn52jgF7YTSFmQfCdYEeusNAY2idFwkE+nOu9EUxatYBmz17gEhc5b1VunKoJpxlYc7vY+Czy5IvrMOIUdRAoFXLpwi29pjXdAmDbtENcTZnyrQga/8CMH2KUgVwy5Lc9qfenOUnpBGzQ6Tu4oTeCwnRJ0P9/cGsDJ21kJtwd/XjZqMzfHHSOkenbBHLk8UL6pEHiKMAr+6TrrHB2zycmAwH6AZfPYyQX9ZbbFtt2guONFDVB4Tc6LD7eLfmm7C2a6zQj9Ap9gFyiWy3KqB6LievvINlBzNuXhKEv5Kxi682LA7hlOzLhrZRV4ft2cE7rNFTo6rfwdCavGGbuvwfNDvm0qsTnOJVTxykGrAVPqkiYskAnLAJwqgmBYDT+8uS8TkQdl+X0Mk3FgSvrDtE5M81DYS809Y8AofxhQxq/6x+jijZN+FF5SAYboJo2Cg03PiWiQRM0Bt+UCjFR2UrVj6CDl77ErgiUApwGWhR5Mm4/LeT8efvAtR6HYvIVQ62uZgfoCMt9B+F1Lpebi/WDerW10E6Z2MB+wlEeQC/wMeYlSllXg8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bm5CR0JKbU85MlVZVGJkbng5Z3NKY2RJTHUreldKZFJXS2xWZjlNZUZJTzdl?=
 =?utf-8?B?anRpcHloTUJkT2JyT0lEVlBPcGVBUmtSWGcvTnEzRkhFZUVVSWF6SzhSbldO?=
 =?utf-8?B?bWwxMmFmMnFvd3lrMUVReExvSllnNVhhME4wVFZabENRaXFhR2VMYjkrYnlP?=
 =?utf-8?B?cEZhdHQ2Y1JvaEZjRmlIZlhHV2J2RjJmV1Fld01TOGUreXBqYkh5dUJ6cmFr?=
 =?utf-8?B?MlFzZ2JrK0tGOXp0KzUwNjRCNlVXL0RzWjFhV2lBL1hiNWVOT21uK1dreDJK?=
 =?utf-8?B?Q3QwWW5WWk0wMk4zQUZ3cDViY2NucWdMRDdBTU9xbmVFS3U5R3kzYWp1cGhK?=
 =?utf-8?B?YTQ3c3lrSndha3BrTG45MWlzaVpkTEYvSXU3TU5xQys2cFNUNDFGZ3VBN1Bz?=
 =?utf-8?B?d0dKOWhlYzFWblZvNjBTd3RwMytPRjdyOEJOZnNpdmZ6aHdBdkZvZi9EYndW?=
 =?utf-8?B?OHJNSU5LSXJzcDdpRjlMQ3RvOGhtMi9FejdpaEJaYmlPMjhqaGZWRThZUGl2?=
 =?utf-8?B?QnJnRllOYnJweHhZUi9EcW9WdXBVTHd0anVuL2pNa2tZT1lPMjRmdHdyRHZN?=
 =?utf-8?B?VTRDTGh5Y0drZlhQU0FMUmd2S3BGU3pNQmZQcGVLWFpPQVlhbXpPdnZVcXpk?=
 =?utf-8?B?RTZUbCtYeGpLN0hCYkdTWlVkL3AzaDBNTTdHN1dXRDViVEdsNlE2bnovQ1p0?=
 =?utf-8?B?L3Q2R3RZamYvRTl6UGVpc3JxQ2ppdmxySGQ3U3A2RmRvazc0ZWNaZ0YxdS9v?=
 =?utf-8?B?Y0tkcmZsQU5FRm9MYXFLYm1kYjhHZlV5dUZZbUZTdzdyelJKMlNLakROQ1F2?=
 =?utf-8?B?Q29OYUY4Ly9pYWluUEg1RjF1cDZ5V1BUVmtmQkxKQzhUOHlxbVpCWWtHbVdx?=
 =?utf-8?B?RzVnZkl6czlBZXNIL1EvcTdwdkhGa0JGYS9BMmw3OGxnNEtvZkFLdVFOaDIv?=
 =?utf-8?B?SlBpZTAyKzJOWUdmWmZzMkZGTTZkNXArcVlESTIzdlRQY0gwaEduR2RuYWx5?=
 =?utf-8?B?dXJpK2UxckpzcjNTakdCc2YyWE9rMlZIcHc2eDJlVVNGMUw2TW9Kc1BLdWFn?=
 =?utf-8?B?QmtOWHhRNktKREZrd1RrUjV0N3ZtZkhRNkVzRmNMMVdzMEl0aGRxTEsyUFRE?=
 =?utf-8?B?c3JpWXpLVTVXaC85TldoM1Fub3o1ZEpKUVRlMTZqQXBwaHRBdGRLMkl3ZGha?=
 =?utf-8?B?dFh0bEszNEVHamovTXlYZ2dIUXl4a2h1a2x6UzFTYWI1ZmJwSlJsY251TUZp?=
 =?utf-8?B?d2orM29ReU9kRHVJd2dQdUplTm9aZk5GbmRDeENNeS9nY1gwQ1QyVFl5M2x0?=
 =?utf-8?B?Tyt6R282WFRQUDhLYy9KbnRWbDZ5T2I4ZjBBREVtdkZHK0xqZnZ1UXZlZXBz?=
 =?utf-8?B?WSs5RTN4WWtPRUd2dE42UlNLbEpPSitiOWJaOXp6YWZ0dXNYbkZYM3M2U3pP?=
 =?utf-8?B?ZlJJRERoS2F0SHpoaFhXVW9WaEVvL1cwZUQ5T0xYMUZ4MUlUTkx4Y2VhNEdy?=
 =?utf-8?B?SzIyK3ZkL2pBVHQ5dW0rMlBKTVkzck5WSlBybi9OQldxanVKemtWMHNnNVRk?=
 =?utf-8?B?U09ya2xPV0Q3UGtrTlRTd0ZUK09mSERMRkYxZXAxd0JacDlRUWxQcmFhUHFX?=
 =?utf-8?B?a1J0S2I2SW15cG14QUN1c2RpYmw1TDFCMFV4cmpRSzVxYVNCbWI5TEhvN0VO?=
 =?utf-8?B?Wk5JWXhwTGhJdDZjK2lOWEFSNmhMaVg2VlcvVS9mOVpqeC9iTFB4WDZDODB4?=
 =?utf-8?B?LzZvaE40ZXZDSEl1SHh6cEVhL1h2aEEyaG40bjFtREltM3VPbWc4Qi9laVpk?=
 =?utf-8?B?ODFjOVZybzAwMG5HNTN3Y2QyaHQ4QVF6S3p1d1B2dWRGSXZWM0lDek1wOS9h?=
 =?utf-8?B?V0NVbTNCMjNsUmhIdVlEblpjbHJMYmVwYS9iL3RHMTZtY1piMWFUMFBaVG9O?=
 =?utf-8?B?NWZqd1ZjWXhxUXFuTGtYUHo1bUl1N1Q2ZEl4R1dOSzI1S09EYkRxa296VlRk?=
 =?utf-8?B?SGVwQmtPTVcyQ3FtZUZoc1NHZzZ3bkVualZzNU1QaXZFOWRyNGlRVUQ3ZVZE?=
 =?utf-8?B?UXF5RGxvejd0RmNhNFZValB5ckREMHdyTE95aFRHZVdaa1hjT0RLVkN4QWVC?=
 =?utf-8?B?ME14R0xvbkRsYVlEUzN0Zno2Uy9WQzhQRDJpRndwK0FOSHJWM0dEYmIzTVVm?=
 =?utf-8?B?aEFlOG9tR1JmQXhSQnhzRk9Db2lnSTZiZXlYOGtyVTZueUNvRTVPdHk5VkJD?=
 =?utf-8?B?cUhOZ0liVFllUEJjWjQ3STdvTk15UzE2dnc4blZscWpVcWJKWXB3RjhubS9L?=
 =?utf-8?B?NlB3ZDRNU0drNXZaYjExcHhLS2FKZnNjOXRvbUJzdFpRQnd0dWVCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AQJO5f7o6e4Kbc5OCUGO5hT9beAys0ftK7xhyZHYq0ECvkPSa9PwwdGGN2uOZqPlSV+5v3NhFOwGgwgAF5S4g4TVwsqE2RQ5xkyCMDnsVqVJLQxI5HIetDDloDdvsEq77Gf15hovcCJv4vWw8V27KOPMvXS/8J/6JhdN5HOiJRxS/Xx7gCayIdZpwVedQ9QfGtPVZTzXnX9PnTN9hx7GYLkSHf+cpU77ml83BWm0hLI5cdxrk4GH3/S2fzNtsa8gd2JUTr4FPKyOBY8Y3vklU/b3F+9Q3Y9USO+4rUyar4hz+PkTEW8YpYgVmxRmNwROX35ZqIEMiRRRBpU4uMbjAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b83baf-4a0f-454a-2b03-08df12eef456
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 06:02:42.0285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YREPGsrOkuTGC2r1rt6Ja6d6IU/vNewjk0j2jqBjpCLjQL+/XyyNonEFLmN9e5MuHftywyo0KQuJADowt8716w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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

PiBTdWJqZWN0OiBbUEFUQ0ggNC80XSBkcm0vaTkxNS9kaXNwbGF5OiBkZWJ1ZyBsb2cgYWJvdXQg
ZmVuY2Ugd2FpdCBlcnJvcnMNCj4gDQo+IEN1cnJlbnRseSB0aGVyZSdzIG5vIGluZGljYXRpb24g
aWYgZmVuY2Ugd2FpdCBmYWlsZWQuIERlYnVnIGxvZyBhYm91dCBpdC4NCj4gDQo+IHYyOiBSZWJh
c2UsIG5vIHRpbWVvdXQgYW55bW9yZQ0KPiANCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFu
aS5uaWt1bGFAaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwg
PHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCA2ICsrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gaW5kZXggOTgzZTg0YmNhMWVlLi5l
ZGFhMjk5NDRkMjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheS5jDQo+IEBAIC03MjkwLDYgKzcyOTAsNyBAQCBzdGF0aWMgdm9pZCBza2xfY29t
bWl0X21vZGVzZXRfZW5hYmxlcyhzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSkN
Cj4gDQo+ICBzdGF0aWMgdm9pZCBpbnRlbF9hdG9taWNfY29tbWl0X2ZlbmNlX3dhaXQoc3RydWN0
IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+IHsNCj4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxh
eSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoc3RhdGUpOw0KPiAgCXN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lOw0KPiAgCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0ZTsN
Cj4gIAlsb25nIHJldDsNCj4gQEAgLTczMDAsOCArNzMwMSwxMSBAQCBzdGF0aWMgdm9pZCBpbnRl
bF9hdG9taWNfY29tbWl0X2ZlbmNlX3dhaXQoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAq
c3RhdGUpDQo+ICAJCQljb250aW51ZTsNCj4gDQo+ICAJCXJldCA9IGRtYV9mZW5jZV93YWl0KG5l
d19wbGFuZV9zdGF0ZS0+ZmVuY2UsIGZhbHNlKTsNCj4gLQkJaWYgKHJldCA8IDApDQo+ICsJCWlm
IChyZXQgPCAwKSB7DQo+ICsJCQlkcm1fZGJnX2ttcyhkaXNwbGF5LT5kcm0sICJbUExBTkU6JWQ6
JXNdIGZlbmNlDQo+IHdhaXQgZmFpbGVkICglcGUpXG4iLA0KPiArCQkJCSAgICBwbGFuZS0+YmFz
ZS5pZCwgcGxhbmUtPm5hbWUsIEVSUl9QVFIocmV0KSk7DQo+ICAJCQlicmVhazsNCj4gKwkJfQ0K
PiANCj4gIAkJZG1hX2ZlbmNlX3B1dChuZXdfcGxhbmVfc3RhdGUtPmZlbmNlKTsNCj4gIAkJbmV3
X3BsYW5lX3N0YXRlLT5mZW5jZSA9IE5VTEw7DQo+IC0tDQo+IDIuNDcuMw0KDQo=
