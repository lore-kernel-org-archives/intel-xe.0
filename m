Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E37C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 22:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2FA10E02C;
	Mon, 14 Jul 2025 22:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivoQgNHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5832410E02C
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 22:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752530586; x=1784066586;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x5iIuhWlRibxbTEyl9bY49Wj+TSu6n3/fA7uItEEEE0=;
 b=ivoQgNHbEKOX6JytREgnpRQsPbQ+4+9XXACF8qU9cPLN4ySHnxRfrpht
 IxFd9HFRYQXB8A3R6GkUv5cg/hDShpaTjU9/J86+e4/zvhh+KUdo7wkFI
 cThbNznOuiAqwL2zJAhIoMiM0LlbyJpOSN7vbSJhRVcp2qbiSiaKBLpeG
 EgZ0RRKKcsXQzuk3CJkskeRfpb19Ukd0kkCrw4mY+hDGAxH8TnEdXtbb2
 Ubhv63Kflpc9LmKzL26cy0tQcScg2sGNMgw89eDv9zB8EVjh6Khjub70c
 kNal009dZ+F2VEzeCDqFXuro+dQnCwicYFnbZ+bPukYryZTH/6Gmq1S8g Q==;
X-CSE-ConnectionGUID: uiwY5QzyTmyhBAfTAlIdmQ==
X-CSE-MsgGUID: BAPC65LjRDOjuS/OSUxXzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54889882"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="54889882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 15:03:01 -0700
X-CSE-ConnectionGUID: gNTA15OZTsyDw2FQr6NRpQ==
X-CSE-MsgGUID: YfIs6H0gQUeMDNBiILR8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="161363318"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 15:03:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 15:03:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 15:03:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.85)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 15:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Klhe6LWZZd7ZjFxrQjJ7R2bTqiUUMwkIE/cxP+6N7e6op+WHXv16a+ZwU95Ar9qEA5BvA3jo1LMtq0Z833rOjaFTJb2no6+3JWBywCbQkySjy5mjtK+u5lzSyFfEVZMDAoP9M0jPQNhxalYAM2SCu9/9/EkD4cx1Db9g0JFMojpm9JFBSzGKw8FMKWeY60015d/78hs4GIfyCdOlQj37HHQO/gZOzWa1AOvv7adQ8jDrTPHEpSSZogeiNfrhLN9Xp1QyoauUiqgDxUHmPOdOkkSZ7ETBBDDMyrk44fhafQv5omx48hmVmrkxCptNZSdmp68Q9cM/QphLEyrv9YaJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMM9/8r1fDsApVcQT6hfqOqE8U2j6FNVBwwoxBeUZpE=;
 b=haD6Z3PQz21EAnhDapLasln+nqNcUqgPLlmH1IU30XFsAbsy+z/IwyCRZm8qp2WFnNrKevRRW7xP6ElKjkbk2WlJCeBj1WjteCG86fpKG1F/S0JrJ80c9VJwhbN1KQhfr1sVIcqYyyo7UHcMSE/tA2c4FdS/b0pLC6oDgmLYFgF5HI+jMM2roDzPIV2QIVFuRrU1FBhoJv5iQZ+4d3v9vreg8p1Krav4V7C9zuoebEp5g+D25MbQbXy2zITpXl36QkY3jGuwm+rd8cJe5dNkC2c0fRTRH6XrXnDfXVxyr8rfFoF3/XyJR1IkaNVtRkT5rDOG9foWFpLl3lUdp8jJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 14 Jul
 2025 22:02:55 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 22:02:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe: Don't fail probe on unsupported mailbox command
Thread-Topic: [PATCH v2] drm/xe: Don't fail probe on unsupported mailbox
 command
Thread-Index: AQHb9QoFka3B8DQbgUCBitPg0ARkLbQyKlWg
Date: Mon, 14 Jul 2025 22:02:55 +0000
Message-ID: <CH0PR11MB54446B46579C1A88384DE2DDE554A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250714215503.2897748-1-raag.jadav@intel.com>
In-Reply-To: <20250714215503.2897748-1-raag.jadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM6PR11MB4594:EE_
x-ms-office365-filtering-correlation-id: 73d3aaf1-4d86-4864-f8ba-08ddc3222fd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8CbFcfotYomoZrgvuvi3Ozrw9tvCUwZPmqumDeJuhc2LTFJ5JwLxUeyzq8Hi?=
 =?us-ascii?Q?QX/zVcjEKFwGnaLq/usqPPojWYi83HbCLPMP4tlHxhWkiYioX1Hqh4YPVmiz?=
 =?us-ascii?Q?yxvI/BBI3BSxNUnjVbgdRxkfEAj4Wx2r3/hQyXgwBoQI5vR5dGoLTrtTRoXy?=
 =?us-ascii?Q?T2RApk1NXKoa8DNxwUFId+9s3XXIyLOm+g2bmJDnJqmdIcLhYBTIgXxNvz1h?=
 =?us-ascii?Q?OROtPLyDD1XjEZshh4mCkeR2TAxBuoVbSpSC1bJ3kPIrty7O7icBMVpHVE2c?=
 =?us-ascii?Q?XkRfUy8N02zYXvwZWeWNAxtf6KG/JYdD0yfMwBiZEaNtwr1Lt67EJAePr+48?=
 =?us-ascii?Q?jHrJySsJXXH8rHTLtchAhbQeRBn/lulmfqvw3WrTAOYT5pm/k140R+OniTCa?=
 =?us-ascii?Q?i4p8O6rWV3aOh+5IkfKhX2inGDuho/Tp6fLr11zBv/fs4yMQesJeWXAkTZmi?=
 =?us-ascii?Q?r6oELfeoxH6SayDNWUEYHq1U97SJO+PRXzTLiMUqRr4Z3R9/WzMi9mL76lTu?=
 =?us-ascii?Q?hJUi0xwXl2XrxD7Jaf88kt8B6RYWNIkC8ZjikJfpy5rf7tv1RGk6ZV220XzU?=
 =?us-ascii?Q?psKejvhnx7WgQuRQeSO1bSez/Si61Vqr4VRXu3hqTdPjwwMt4SxEqlPfKBDD?=
 =?us-ascii?Q?LKwpxYr/E8Gd9UXyr5TySzdTL1Rfahu8Q/KlseV4X+heyhhkLiqhlJW3biws?=
 =?us-ascii?Q?wwqgkhbxJph5eKrgfeWC7DwLUh+KQOJG/ytsuoKVIvwKCzOv7lXLu8qfzmzJ?=
 =?us-ascii?Q?Be/xq2Pwy6uVvjZy/0GWU/uyjiUsQ66Fu4hudBafonRRkWGvwzekKFLIGoUx?=
 =?us-ascii?Q?nG4qj/pizflArqEA7pXr53VZpbaDowuSvRIiKDJZfCN0pyX9qulrFBN7ddMB?=
 =?us-ascii?Q?xBCVbUhGBzZSczZf3/0hl208TZDcJP9ksaYILzd6lGJzMfbTUEXFosbKfZmm?=
 =?us-ascii?Q?KbNwm9I1sFn/Yz7p/fOHa+199Xda81K9SXB1TSuV+683GxaGgUVBltAi1+K+?=
 =?us-ascii?Q?BKRtCWv+H8Ipbv10a4AMzW+UcuCt4uND1llZYWxBD836St+c3+7v3vQ+c4wB?=
 =?us-ascii?Q?XaLEtg93j201TM7vf0soi1PJw5U8RVzt2WAutk6NSkf7ncPuxukkTXF1ALLT?=
 =?us-ascii?Q?h7F6XvpGgAQBO2WST9P352ysQ3haIa+TdYW9mwDK5OJDpxNOJb4ntwlX9xO1?=
 =?us-ascii?Q?afueEScxxNX3wu8a6d86bMZvXSve/nDHBToB6qshvesBGAHabFhdboryoOrR?=
 =?us-ascii?Q?UR98RNxkSphpA2Km9FNh5SFVXlZzTrfeXVqpxetRLj4rTU9noYmXq/4EenZl?=
 =?us-ascii?Q?RsmgOBOqQf9Q0G7ugBjvISEh8nMiH2JeZYxldtc2grBX9lMQqL7i0t8Uwxu1?=
 =?us-ascii?Q?t32v40M/atiwhX92SxFzBms2UAeaVGRivcGvMe9xiAIhHg5Evi1k2TH9R6on?=
 =?us-ascii?Q?yrlHDu3f1KQGKe/zjNVCTCYGzljljpssYCdOhYuKC609X7pT//pcag=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QdIQx6yXMRMA/2ZLtTddu6tsdDRj2hs72VHgkWxxVkeSHEV8WeKtd0WlNjlV?=
 =?us-ascii?Q?UPqY7+NMeHVXhqk9NG3l1kk4SwV4MQkFxv4Eq08tRj6kNtw19COJGWWrBO4B?=
 =?us-ascii?Q?JkdPomLtWNeFj4yIpgjL9nXkKO6XbsiHtDV6zkxi3Xc6ZYVAD4pas1D9kMYv?=
 =?us-ascii?Q?XZdX6ju2mb9g6DGb1Fyvr0GTaA/mx3awFRls9TgwypVVzyENgL1I1P6X5PYc?=
 =?us-ascii?Q?bxiB12QEPj6UlU2WZpe4JFVQ7pXRFad4FkyWEGXJy8cBU+iuA9Yq6CyIUT0Z?=
 =?us-ascii?Q?yZ6KKQTm+U79mQvWOaOaOZXMaNDV1cxVSTV81p/s59HWiKlh6th8VnY/59zp?=
 =?us-ascii?Q?L//PY5AXAwDJ6vW0PtNuTkHzNFwmFGJO4QWc8TnC33bOReKN4z0/aXBhPber?=
 =?us-ascii?Q?2FBM8HZ3fe9ebWq4plNcvW703KfVUXSMtwrcIGOXfsoepwd+JAIUCZFoSTqq?=
 =?us-ascii?Q?VWtt4b3GTf6Snpju5lPHOmGTMJkDNjSaw1TmI2eR6enrLBdEs5Qjd+KAT27C?=
 =?us-ascii?Q?OgvCr8bf9e3joTxuZjagLFbMQmXqfBLZ+DRa3BOGjJp0CyF8jJIUPox1FTLb?=
 =?us-ascii?Q?MLwdh3qxNc5ElVtiFVy7Vb5q/Xv4RslZYnx9IHR4l2jHK/ffjytBNVhMn40f?=
 =?us-ascii?Q?2sn4356WYJwCgc/cMEgz96cYD3EV+8jWJdgzjPJXRGVcZ8V7PbZ46/8C9mgP?=
 =?us-ascii?Q?kN8Ygks6PuSqxEdBTy+gnb27KclZ7Lrzrrhd7ev/Vgj93XtmlUVUXMoDkVCH?=
 =?us-ascii?Q?v0n0oFwSHKj7ljFrphvORn7RWsn8TUbfbzHOa465pjpdOrtAx/pBWl0xKbno?=
 =?us-ascii?Q?85JLbvtA4bIwXGULc9ltfJyk5Uz33Rdv7iz/B0/qqefCB42j4gOR4290eYdb?=
 =?us-ascii?Q?fSaGjyBMkxqKhY2/HaJvbvm0+HBBhZt9/hhJRGWpfPzdp2DlqAWdXiE9GOv+?=
 =?us-ascii?Q?f7LK1VW+r0+r4TVOMSRR+UNC6RwpnZitTrGedFleZ91/NGzfVqWW0NRXycQt?=
 =?us-ascii?Q?xA6mlF7bAc2G4CMfgk0dwAjN4X4b1i7TESKZfl3HLbm/NASQI9fMHGECeUUf?=
 =?us-ascii?Q?iejrCB3bpmFJ0B7bni+xg1Nw27iJAC4vraydYdT2q0PXkoH2BxcAdP3U8r4C?=
 =?us-ascii?Q?gI/csHCvnm7oZbdbxMvZGU3oqbkcqukGGKDpjlUmBDLvCHMZuYH0l/StAlRJ?=
 =?us-ascii?Q?+QCsLMEbWZ4LQUdGi7PLQhYAOPEfo6FQSoL6SDwuBGylidh9uNqGb3xWsOS7?=
 =?us-ascii?Q?zm7FgfDuqzSCTdsLq7EAgf5VGbss+MeKnYCt8aZHDp4cMHocGkz4jJqmP0NZ?=
 =?us-ascii?Q?2IgaYhbgiTXLmQtNsy6q/sSrbny9qPtDFU22IZ6k894mKqtSZS5Qyuz5F8Gu?=
 =?us-ascii?Q?gyLIAE/p3axjKeXtO+L7xW6WUz55e+iSUtds2N+PGiG/nFED0xgLBBCIVJ0l?=
 =?us-ascii?Q?p6s4LA1cHFA3QvZxtEh9UkGpIWtKml/lAFS07mbEjAxn/eLx4wNEw3aqYghf?=
 =?us-ascii?Q?zxDKvO+0FnfwuZDHgjx3IfIOuwuoti3+MVLCjTYlaj7hI/x7oe6EEV7l/ym3?=
 =?us-ascii?Q?YTdQ4J0PuXzXPrQIpqiKd6lsWxNDTiEiu/2V1d1S?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d3aaf1-4d86-4864-f8ba-08ddc3222fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 22:02:55.5348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCJdUJOYnHIBKGq044UuA3mV5mMPX+S1ooTWgq3GPvd150OSItyzV6mXmIQXZZwjocA6VQmmsAW4BX2Za4MRU7kYks9pt1AN+6SzI55B4EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Raag J=
adav
Sent: Monday, July 14, 2025 2:55 PM
To: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.viv=
i@intel.com>
Cc: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com=
>; Summers, Stuart <stuart.summers@intel.com>; Ceraolo Spurio, Daniele <dan=
iele.ceraolospurio@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.co=
m>; Jadav, Raag <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe: Don't fail probe on unsupported mailbox command
>=20
> If the device is running older pcode firmware, it is possible that newer
> mailbox commands are not supported by it. The sysfs attributes aren't
> useful in that case, but we shouldn't fail driver probe because of it.
> As of now, it is unknown if we can distinguish unsupported commands befor=
e
> attempting them. But until we figure out a way to do that, fix the
> regressions.
>=20
> v2: Add debug message (Lucas)
>=20
> Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator ve=
rsion")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe=
_device_sysfs.c
> index 8250aa4620ee..fd2ba0da02a2 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -160,8 +160,13 @@ static int late_bind_create_files(struct device *dev=
)
> =20
>  	ret =3D xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILI=
TY_STATUS, 0),
>  			    &cap, NULL);
> -	if (ret)
> +	if (ret) {
> +		if (ret =3D=3D -ENXIO) {
> +			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
> +			ret =3D 0;
> +		}

If we're disarming the error value here, then do we need to 'goto out' afte=
r this,
or can we reenter the standard execution path safely here?  I'm guessing we=
're
branching unconditionally because we still detected a failure in this funct=
ion that
requires handling, and that we're just masking the report to prevent driver=
 probe
failures on boot as per the commit message description.

So, assuming there's a compelling reason we still need to branch here:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  		goto out;
> +	}
> =20
>  	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
>  		ret =3D sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version=
.attr);
> --=20
> 2.34.1
>=20
>=20
