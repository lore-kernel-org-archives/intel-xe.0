Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78497CFC29B
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 18:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DC010E8F3;
	Fri, 21 Nov 2025 18:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgTcyua3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEAA10E8F3
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763749987; x=1795285987;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BvoiiwHAw1bkUWlJzlV2dQ6N8sqHcdNSLdWPojJA8nw=;
 b=JgTcyua3IZMdJQG8WUfx5q29+7gRDtr1MgLubeYcQ4bLRIn5x0/IwU4+
 qEXKl/W84DD3VhJEO83Yz31kRrsVHEFI66aVFjnaidqxwhvgHTM4DLN+p
 gM7kOU85Yyv/1K5P7SqZ/Y424MGYh1av7EYymkpZjcWyY10LWruhafAzu
 IE988Nspqbp7BUn56dvsxOpnoYg+UdO2oAToDMTTdN4w5/NF/oFyoAaan
 iRMjaj37F7zbd1vhp7Wvv63ZEX/1B/NjKI3XjlbS/A2k6qes2F+Hh2EjJ
 uQ7Ttsc2HWmvaYJP+w0nnL/CoD9WFsX8GUhAcZexxtT8v6ai2w+dQ9Jeq g==;
X-CSE-ConnectionGUID: oFJLYwjjTmqSavPtuUaRbw==
X-CSE-MsgGUID: 0FOiKZJgQbCGRKBJwL7mXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88501405"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="88501405"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 10:33:06 -0800
X-CSE-ConnectionGUID: 683hDky0Ri29UDgbV/YN3Q==
X-CSE-MsgGUID: gNfP4vH7QSCof1yibkUsgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="196046243"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 10:33:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 10:33:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 10:33:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 10:33:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4xnRHBQqd+JAmtC0LLH4hXmyaV7DWEfjyoBWTOylm9pgJ2jLhpcQlqO058GPkfllB6QpZlt51mkbwV27TEl/Jbz/4ugw5/P8ux2YYhPecCTN3lu7NZdFZEjSr2Pxgwpwh6bNd3bj5kVNhhQe1QLgVOz1Zu7M11Md1g8p1F/N5lXDT8UY6NmbARZQDjLrG6Juj+MqudJqKUEGhWKsy567mADrQMgf2HxxbUX2AsFpLQALVKRZd0tnKgAvB9tMHe5x57d8OVPlHIVMB62PpPWHnTJTnXYVaUHoSxUa+d3j13Tx+RG0ENmy7IPQfuat9dhNihGR9V6uiqk4PMWPDpqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4f8paq33idS2jMt3SHDgJ1JHQ764oomHrEjShpMcOnk=;
 b=cAz7/RN1xC6i2nFf2OYgFMFgtKX1IoP5hjipCe/8ALEzQnRTH50xJOLUECHvK5kjHSCfh1Dn+XyPa58oseg3jqH6yg2RWE3uEixb4sOgVnbL8jJqouMb1YUxX8e2DpikKVoRqFFmtB1lhUFTEuwuc94qmqy9oMd312iqNcV5nF8YhDGxkuuWvIAPFSgUnYnHdJ9EpROQc3qH4RT0qAe0GhKjHcq4DUBndR2YSmJpnGjuvvkNjEhHfD7AN0w9XgmuaPhicWVo6e8E5MPlRYKecqbUOdjHlTa1/u7ffq14DieY9K/V2JHfyYYeZ6PLj4xBrxRboWVBLKWPxxDbmPXsVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CYXPR11MB8712.namprd11.prod.outlook.com (2603:10b6:930:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Fri, 21 Nov
 2025 18:32:58 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 18:32:58 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 05/11] drm/xe/guc: Add page reclamation interface to GuC
Thread-Topic: [PATCH 05/11] drm/xe/guc: Add page reclamation interface to GuC
Thread-Index: AQHcWGqWdvx/d2gY5UG4PpFcDkQGVbT9dgpQ
Date: Fri, 21 Nov 2025 18:32:57 +0000
Message-ID: <DM4PR11MB5456D83789C73B756FF7F570EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-6-brian3.nguyen@intel.com>
In-Reply-To: <20251118090552.246243-6-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CYXPR11MB8712:EE_
x-ms-office365-filtering-correlation-id: 594544c8-9629-4a0e-e547-08de292c64de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?4Kdrp6+Hr8fWPfhorpeQso+0+GB4kJeXXx1BujwpKVCmiumzo7iPyayoWZLS?=
 =?us-ascii?Q?7udjmlS7oViaFHcu9uH+kt2TaAnn4X5RsnvzY2eA/W5gf4r5BTEwHPgmpaIi?=
 =?us-ascii?Q?IvqDROrGSNBKEnGt7d6x4hu2yJ952dh02kfrX66kg11RI377JMla8sir4Zr6?=
 =?us-ascii?Q?j5tIc3WrIfKvAvyikszEOmHJFwmQnOi681z78gdUYMRFsbcAVZpCUQsSNi0Q?=
 =?us-ascii?Q?MnKY2A4uRnKGNKwn2oG6ERaykcheCPQRT+JkDay/8iJ3U73IwcUps6ScrE7C?=
 =?us-ascii?Q?2o92YfhVpIUNqa0fTCd8WjAJ5kvYhHgmjYH/FnEYEsn8rDIIIvnlS9g0jjrG?=
 =?us-ascii?Q?SOEZpTCM4QEAzPuV6G73vWPIsl+S4PHW1W4HnJF2mqKT7KpSbjat0tNAlgoa?=
 =?us-ascii?Q?zwaoTMjJkJaoEp1YGPRxto2WfpUafavKf/Z3gtac+i2+ys6zcchThfgPfV5v?=
 =?us-ascii?Q?e6sgOEmjYWupWtrsHB41aN3ZElBGzD7268Q6/aUb13t05OAhg42AgAadSTWb?=
 =?us-ascii?Q?Xg7/5bItN+9tm3zUduMcYM13MEdVk8wb/qEMPHQRSIqPNDflZH4YqHRtgofM?=
 =?us-ascii?Q?mH3djaNHZJfvsGYmizOJ7zFv2JGo+b7FL27Uhzcrxq6+YCeAgaiL3nInqN/E?=
 =?us-ascii?Q?77pAfXm4QHmUA5mY47ioH4+Iy7hRqoyBj9+V4ICXRL89nUzXaZbLr8uCLfV8?=
 =?us-ascii?Q?6FU4xJhdWjsR/SGNE8Gtf/yexR7ZMinCfjshn3Gh/dc8gviWz5Zf6KJGxrfI?=
 =?us-ascii?Q?fEAbB/TBVLGrBvjtvNw0MMgEeLPigWi6uBicQ7SoVDsrKgMJmrmLvCzgpM+Y?=
 =?us-ascii?Q?SAA92COTr6HyCMNdB6kudI5Y1e3d4utzRPV9FALk9EvOmBVIGvcAu4VjO6+Q?=
 =?us-ascii?Q?gc2koQCcPWsfPM6Hb6lYgwe1vSnHo0WV1mjDv994nIpwXL3vIfXacuOZ4j8E?=
 =?us-ascii?Q?YDed1CubDaFq+1gWAdCH5TttD4LkuUyAZSBZ6Z6t8wmG+nXxO21NcxE4DCGf?=
 =?us-ascii?Q?6onjratwc6k7Swl8VqIgHJHOl3QI1stJ7jynApviddJMYlRxHvnBVGo2uFtx?=
 =?us-ascii?Q?G9S5X0NvINTUSWjgR77Z5SQJLjJjy7SdBBpZSoBia7SDUT5rbsDR7kbeZeSo?=
 =?us-ascii?Q?Dn+DJ0+gQGUOnYyNdwwvGmLjG8TkvNIhQzBw9nslsVT0EyevAw/34Mw0Pefc?=
 =?us-ascii?Q?lcHCSi77A2TIWjK1Ofi+QKLCLC6buuxJ9Frqvj52J0BkmBZT8b0PpV3wzh0d?=
 =?us-ascii?Q?y2UdAvlg3ZNeYkmIXA3rJKiCqO6HwbJaGRv3iS1n4Gn6bmQs4KaYcEBgIMEQ?=
 =?us-ascii?Q?kJ3J55i5ptIcCbpP9lyK9lrLDU7boqYsNLGN+HyhRrTd9Loeb7Dv4l/P6EHY?=
 =?us-ascii?Q?ISEI4Z0tVaMoBhXgD5WvrwAIrc8WcoO/n10VLNXeINfQqbkG9wpdAkj9Q1iJ?=
 =?us-ascii?Q?Gj22uyOXkFC5vEJMgeNSwpEqtjBuaOTTuOuvdjbnKBGPKciALZSrfQr6kczx?=
 =?us-ascii?Q?EXOII3fPMaoWMKqXOjx6pNYV7gAPrSd+2c4J?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ufl/1rnixIlE4IWqtAfH4AklliguXD/cmtvQZk5sQ7Qbjk2EoyoCwRKMXq95?=
 =?us-ascii?Q?MH0/2pVg0B0QJ2MXwHU9vAB/UGqqAb3Pp6CEIDBrRu9PyrIaqUNQmVCqNgKu?=
 =?us-ascii?Q?VI8mLhIQ/qIn/PUqt2sQy+HwCBRJOStdm29ntnaOeTMaUQIkoAIe9Cl79asP?=
 =?us-ascii?Q?3LmPdxjnA1OS+e5zOkKXpO+QtNVoOoWN9MF5YkSP4wUt6CFkgRO55JD/CJsD?=
 =?us-ascii?Q?mUxQfKZZbptEANvE1TiNNgA74TEle+CZUEiYcmtkxUe8VP7ShFm5XujkAqzI?=
 =?us-ascii?Q?Ko//1iRvokHYKrdbnzqT2G6IXbC/C24EvfWjeFl8Z0rG9DoepyfYzMsozXDl?=
 =?us-ascii?Q?WrAd12ZHU25gbLg9xr03YZwCYQp5zWcRQsmXviVG55G90xWoB1cyh+VN6ovs?=
 =?us-ascii?Q?PktOSKJPlhViLKFfE+aYiZujSOwsvpI894Xg4Y4YBpbNLEkRhl9ISu+2TwDu?=
 =?us-ascii?Q?o7kiZTaOKuZmB5vE3M4bcfn1NOjBMq8kJ5TwgbPM748t8tbwfqEREXk8dP0w?=
 =?us-ascii?Q?8uScQVLHSGcghaGYqubYRhwCn961Jm2Z0uTL9unae4YesI5fz7Yk1Ltbqh2Q?=
 =?us-ascii?Q?/rQFd5ULPqrNDx1zhpAhy/L+K8nLnig0Fz43hO7qdlreSuo1lJExdKUa/jDB?=
 =?us-ascii?Q?za2uB4xey7vYHIr/95hH+S+R5/d6tRJjF7xdHhXlfeNFPnlT+6vyuWEY/mdU?=
 =?us-ascii?Q?wpLO57qj24D7m/2e71afkPAujLP14ze/OhL6KZNc48f+gA7oce8CKDw5B7lo?=
 =?us-ascii?Q?g6lEUfH5O/IcEff3mATpC+29nw/6zu22smYFe75rLUSN90p0ZJJYFD7NsPV/?=
 =?us-ascii?Q?muJiC9bIX9DltDwnpUggtJ/j/j42aHsHN/vPQpDa8Rh9B+2DGAvhzahbvw+J?=
 =?us-ascii?Q?CK3jQw/iNMqiXeHdT8E+/xmbm+XXv5hrvRIeJYJOEBiqHVN/oSwAWuhbTTpi?=
 =?us-ascii?Q?qdWHNsaIUhPT0P/0uUJJ7Vh8/7X0jy9jA1sZs9IiozMRE1z3tKIwTb7bG8s0?=
 =?us-ascii?Q?UcP2W44Xlq6Oeq5fi4/C3ov5hZmtv+GE0T3JFVJOoeBe8YEQWQLEy8hkLa2Z?=
 =?us-ascii?Q?E3NQrsIKtzlD/MDBdViAp5BKio6YdfKuGncEqOt6A0U1oxXJqHY3EOmZM1o1?=
 =?us-ascii?Q?/yY6pBn3XMlW7L5WyhcREI5D4SdpeHLQfgjalIK2SQ0pXYiGggZC8uio8MTQ?=
 =?us-ascii?Q?E7fLI6/Hi9WpfhNKI07Zi4MSS8a/tA73KCawcIeMNpuWl5hxat5RFegmGpTX?=
 =?us-ascii?Q?74/ZCzHIYOlKG+8mm2Ij6XHxX+q7lXgftKcwEb37hBa83QUVe4E8JCwy2SdT?=
 =?us-ascii?Q?3DP5o1vO4trJe8r4AmpSqGrp7pM3ZlNuR/9aB2WDGqzBgb4C9S9ShWgB8Qc4?=
 =?us-ascii?Q?oD/B+DVVhktDpQVDZmmZGDNdg2bN3mZHZ9LP8K4s10IX43+ZWiukruxVQbn6?=
 =?us-ascii?Q?xpf6l6w3kqRkkH0/PGmjKv+5XWkFCmNMewNCgny675u/FEQb0G45D8U3Rhcn?=
 =?us-ascii?Q?X4Ijl2rxpTnOtUnWTDB5v2agPs5ZasxGQD01Pqh8v4hwP85Yugk+9pVJdWng?=
 =?us-ascii?Q?yIjsKAaJFvMyFZMad6AxwTZG1nG20GC1pDyUHdau?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594544c8-9629-4a0e-e547-08de292c64de
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 18:32:58.0256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJ3e3qxFTkvTdPmbMeQgI0suOeIovEsJKm1mKz3TKXb7rk54jEnyg7kHLzcJ4+yhRLBxz/P9/c5VfZNpXcuOqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8712
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

On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> Add page reclamation related changes to GuC interface, handlers, and send=
ers
> to support page reclamation.
>=20
> Currently TLB invalidations will perform an entire PPC flush in order to =
prevent
> stale memory access for noncoherent system memory. Page reclamation is an
> extension of the typical TLB invalidation workflow, allowing disabling of=
 full
> PPC flush and enable selective PPC flushing. Selective flushing will be d=
ecided
> by a list of pages whom's address is passed to GuC at time of action.
>=20
> Page reclamation interfaces require at least GuC FW ver 70.31.0.

Should driver disable this feature if the running FW is < 70.31.0?
What will happen if driver send this action while GuC doesn't support it ye=
t?

Shuicheng

>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_fwif.h         |  1 +
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 14 ++++++++++++++
>  4 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..11de3bdf69b5 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -151,6 +151,8 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_TLB_INVALIDATION =3D 0x7000,
>  	XE_GUC_ACTION_TLB_INVALIDATION_DONE =3D 0x7001,
>  	XE_GUC_ACTION_TLB_INVALIDATION_ALL =3D 0x7002,
> +	XE_GUC_ACTION_PAGE_RECLAMATION =3D 0x7003,
> +	XE_GUC_ACTION_PAGE_RECLAMATION_DONE =3D 0x7004,
>  	XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION =3D 0x8002,
>  	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE =3D 0x8003,
>  	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED =3D 0x8004, diff --git
> a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c index
> 2697d711adb2..e13704e61032 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1311,6 +1311,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
>  		g2h_release_space(ct, len);
>  	}
>=20
> @@ -1546,6 +1547,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
>  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> @@ -1711,6 +1713,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg,
> bool fast_path)
>  		switch (action) {
>  		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>  		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +		case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
>  			break;	/* Process these in fast-path */
>  		default:
>  			return 0;
> @@ -1747,6 +1750,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32
> *msg, u32 len)
>  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
>  		__g2h_release_space(ct, len);
>  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c90dd266e9cf..34d74a71c4f0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -16,6 +16,7 @@
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> +#define G2H_LEN_DW_PAGE_RECLAMATION		3
>=20
>  #define GUC_ID_MAX			65535
>  #define GUC_ID_UNKNOWN			0xffffffff
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index c05709a5bc98..3185f8dc00c4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -95,6 +95,20 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval
> *tlb_inval, u32 seqno)
>  	return -ECANCELED;
>  }
>=20
> +static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> +			     u64 gpu_addr)
> +{
> +	u32 action[] =3D {
> +		XE_GUC_ACTION_PAGE_RECLAMATION,
> +		seqno,
> +		lower_32_bits(gpu_addr),
> +		upper_32_bits(gpu_addr),
> +	};
> +
> +	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			      G2H_LEN_DW_PAGE_RECLAMATION, 1); }
> +
>  /*
>   * Ensure that roundup_pow_of_two(length) doesn't overflow.
>   * Note that roundup_pow_of_two() operates on unsigned long,
> --
> 2.51.2

