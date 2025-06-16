Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D1C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF5010E060;
	Mon, 16 Jun 2025 06:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCvMIUsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ABE10E060
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750054444; x=1781590444;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AX8qoWhYtw0xFRq47BKgYIAB+BfbQPHi2ZQ/P/GSzdg=;
 b=aCvMIUsJuTZmSCv0qHoz2+IGaUSTVHgjHmp0E92EJpWxZqw+RpB258OC
 1iDrm9pPmdggMPPW9YrJezB42rqYgYchBtrf191yRQa1p79M8nANI0sN7
 EtCLqqpx6cukB6nQRxjc8i1QzRCUrBpf6FKCEmjuTHcEkbZ3D513CDweR
 D/duxaVPpf9a6BmaYmeslIrrPv0l/TTrtoVIwZfqllReZMOzajWs30hzH
 PcjDTbPnPIBI/uATDdtFWpQswSKqNZa94ZxJKTYft9IX7e5rU5R4LqhMv
 qt0lsfU61sKvtP+Po0HXHbGAYPIEer2P5Y9tMgZNKg4+smasjF9sGSvdH A==;
X-CSE-ConnectionGUID: 3c3P4kysRoezoXajFoDLsw==
X-CSE-MsgGUID: 7xw8Km0QRKO0hW4vS7MhnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54806843"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="54806843"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:14:04 -0700
X-CSE-ConnectionGUID: wCza/VNHT7aHosVbS7uq1g==
X-CSE-MsgGUID: cNxfrrX5RCunrT78ACZj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="149287360"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:14:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 23:14:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 15 Jun 2025 23:14:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 23:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RG8zrFUemt1xS5IwchMxjidgQx1GHSLgpAFHM1DT7Vxm2Onb9cHcfbQtI0WDx2uDn2zMVF7FKk4d09qyB9BsOjagEpixKCpmWQYXnNwcRBDZYa5kSwGG4hSM7LDWeFVGQXymuDdO5g+fYhpXo5KN0JHy5jOu3MkCElaWRrmij/XRZeotg+Jpq/tyXJg09N2pLhzh4ZF3AgPstN/M/oxjEp60Khs8q5KIdbpPUI7yZQ7QSIzadMTd2A1xgrNptTN3xCl8IkKE8Sy8jEvl/uDzW+Jyv24FVCg9cLMobZp7/YTb1xGgLWq+rWVOO3CpPWfsnAUO/McadF9kTJ1kOtmzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pjfhm/V5gAIyuJbdOiwjpw9pIW17bITqhcVyCudjEM=;
 b=NrCdwn3AEJJoKC4e9eTKCqaIVe/FUoquUTljbYotoRZlq4E5W/Uv36d99uqbS9sorQi36FWUWgXYE8r2vpoCHVDbIam618PI9sdy8JZFmK0RIwGdgS6hLJNLGuwgpSrLzLtCv/7/lLwS/+h/lJKiuF5xwu7ismzmGJEo1kd3EaURQkL5zpVwXMCRaJvpEzieIMSIyBSHEhwdHohL+Xuqo4tSIgE86irWrDVXbuNzNycINP8iF298BHvu8qFO61C9EbafldwIRaaEWLLrfp3pookSraMMQRL5p8gfjPC1xjp8/nQiFbHg6lR3vIF1hMJ6X7Iy6i2bmrdd8OUzS/tJjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:13:55 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 06:13:55 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/xe/pat: Determine ATS / PTA programming during
 early sw init
Thread-Topic: [PATCH 1/2] drm/xe/pat: Determine ATS / PTA programming during
 early sw init
Thread-Index: AQHb3KzZgUJV5VdUzkSWQN6ULM7Z/bQFUjSg
Date: Mon, 16 Jun 2025 06:13:55 +0000
Message-ID: <SJ1PR11MB6204DA3335391B63F1E51EC58170A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250613214751.792066-3-matthew.d.roper@intel.com>
In-Reply-To: <20250613214751.792066-3-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6354:EE_
x-ms-office365-filtering-correlation-id: 32e88c9f-a418-4d2b-4c70-08ddac9cf992
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zYeqglA2pXo6WA//l1yCMVpJCPdALVchthL8wq7cvyGIuNN5LEaLlgONhiHQ?=
 =?us-ascii?Q?I+WnOrJJkKH2CO5/DAsaYQW4cjIG0NgoOAw9YDeZrYw/JpXbYHYCGPTCSKdr?=
 =?us-ascii?Q?Lgy075HOWlHrq5clik7IGpCMzrtEtGnqcQuTCiEJyy2uaXWmagokUcy+ynOn?=
 =?us-ascii?Q?qaE+SSbGFE7MsB85CwBPbbq8LJFyfCYbWKtZ5CzFWB7fd5yXgIb7kK906da/?=
 =?us-ascii?Q?ieLxleXAvLHbou8I66O3z3qfKPf66HKCKMbYTRdslmDcdgQqDe8UCRxh5iZO?=
 =?us-ascii?Q?00OyuBehC0W8x7mSiyZvI6annc6brPR8zGxb84iAkOfI32/5Y0TGkINr1X+f?=
 =?us-ascii?Q?hRbDIExXY88PSxJOkDp7gaEwWMsHWz7d1LWzyrq2wrsskWOI68pIuYS6lJnh?=
 =?us-ascii?Q?EuXa8vQHn1mxt56Zbi3arfhLoOvINqlH4HkPH0aSevPlk19gH9e0q+6Yf8JF?=
 =?us-ascii?Q?6EcV1SbxMVGR/QxoUzdSQjw5Sa3ZeUXmAJQZHhz3taJZN0e1IvaH/P+hSHmh?=
 =?us-ascii?Q?sHmuwmvJ+PRadT1VGak0vBntbWMRr7os0GfYVqc/+QCXFArOoEoO3eD/k86h?=
 =?us-ascii?Q?ldvJmE0V8jPGzxUX+KQ+sx0Zy7t1YdoWMHaXPGEGKgIF3LOofpMLYQ3zfJUc?=
 =?us-ascii?Q?G0Ct+NFFaha/6HTGyrWItV1cAxAafZv2NW60FYPP8HFqJCyQxbIhWBdawuep?=
 =?us-ascii?Q?zkafwhbYsbqzSKI1Wc9Rj89YdE8Jn9jBlC/f28ImkOS7lEpPuHzx4DbmQuIh?=
 =?us-ascii?Q?xOI+5cUHQ0JykHXey0gwLaOuDQahdTzrKwIRZhe5vFzRW7mYZhzqY9AcxobW?=
 =?us-ascii?Q?glW08hvlXFSMZL8r9MhPr5b2x8y7GWlpp5AhDJyNEVGkQFByt9c5FBTLO/Dq?=
 =?us-ascii?Q?J0WAtWKSL5ezGIfjNgk/lA1cm+8jk4ZydI6XqZ4ViHVeN3T6HeEPjJhnDDUH?=
 =?us-ascii?Q?dSCJdKyIypH8BdfuM4iNV7PcbKu4AAN5bjnxSztMiGMku/mQp4BE9NsSzSSp?=
 =?us-ascii?Q?z3dWZrWyuaeOIhRUkxe/m80T7R8mt8f7DBeZ+zKnADmtOaF1xjRYzi1JYHPv?=
 =?us-ascii?Q?3Fc5aKO74J/diibY53u1aYM2YK9jqdH6fwmKM6FvHQpFXZUaG65pRgtmFa3f?=
 =?us-ascii?Q?69OwdUZZ4eDK4zyDlCGcp2ZSpbqTt6duBi/6xxprJRzDecJm4+XGSeZbv6Jk?=
 =?us-ascii?Q?cbjRz5bo6ST8Goc/Q0gQiYMyzfKHE6WlOtahKsWwk2QWutSjtn6Sto+n7JYO?=
 =?us-ascii?Q?S4bvp+VUCEgt1R0VzenPJ1dS14BFMtHBisysDQFw+h1vmCKJioMsXQMqxFN5?=
 =?us-ascii?Q?o6Y1AtCsuep9JwhTFjPKi+cpgj9202xDdICh4s5SKdK3PzCAgkJnXwoFpUEw?=
 =?us-ascii?Q?x+XDd+S+WguCXpxUB22eFKzfK+7vH9b/IFTt7im1UzO9RM50TDLCqeA58aYb?=
 =?us-ascii?Q?ipHgZRmXlgq7o1XLcZMeM0L+UM89wWeF/SD0K8GBTnSZQ/ORTs4Knw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ee8HByuiwdTJwd+Trmf3q+gMlGWO9OxlG1Rsl9tYVwCgyDOTC9a9vpa1mr01?=
 =?us-ascii?Q?YHuQq9qnGV1mW7dilOdZoYwk3qtHS8HGopeuMeNtvkXxWkB7gR8hBjLeEV8Z?=
 =?us-ascii?Q?IHAYGtk/HuzznB35mNjReX6jExSBbcobjDdrK8x4alsuZAUimGpJOI6o1B2n?=
 =?us-ascii?Q?MMEyr8fNxjfd7/JnUjCxtm0mvrMeLmE/ZlKEy9sXn71N6BDjkCB7ZXXDm60a?=
 =?us-ascii?Q?s6aJetN/R6KvYdy/JsJQIHbYD00Oau5VTllf8PkIsA91cF4XCao9WFH6OEzz?=
 =?us-ascii?Q?pjUcdTfgNvMQ+lKgrNCEluzwQASp6xvGS379CmZHuch4BTO4+5RXcp7xT6Zn?=
 =?us-ascii?Q?N9ZBiCl322QlrhrkqWI4Z7kFaAsAm1TmMV2orLp58txFJ6SZPywopCKjEgiG?=
 =?us-ascii?Q?9kel8QYQS673zQaY0omxAqFYTMXmGbYjVJ/ELJTXjABPkzo/82BpA6ir1HJ3?=
 =?us-ascii?Q?kH6GwzwCJwcumhjIgrMPMQg9OvbIWXWFYif9nddQVNCG9EzrDrNO5KbuwPN5?=
 =?us-ascii?Q?G3jlMFB8C5hfqp9iE0pRWQKAxsrCw3cblzggCs6K4gNlJh43L6H/4tEzkZFr?=
 =?us-ascii?Q?ZvSGs1+dwjgfqWvq7SnsDEfyFXgnh1po6ug2nsu8uKN4PBMcl6VhjJhKZROt?=
 =?us-ascii?Q?f+erir8FQiWkqggT894vRJ1B6foDAhBlbfk/+S4AamQKOeRJCmdF+oVYpgDA?=
 =?us-ascii?Q?vfLDR8/+cViy6UTVQcFopOtIqe6YpkYKczK0VuBemnMfcYP2Wo/ixT8fx3Jv?=
 =?us-ascii?Q?efyyTbKClE0IXE3ZUL+GsXwkvtv+E+MCCM7t0wQtY1N0wVi19xp8NYGfhGJa?=
 =?us-ascii?Q?V4c4RPchIxFjS3WvoCKtgobFlvgXYqpBl2Xa3ChrA/wY1WFFXkbiyoI6OUv6?=
 =?us-ascii?Q?DIBtDr2E1wZLDcnuSC4VEICU/+ETYkMkKPUP3y5MZodSpWNUeQM9yEPcUGPf?=
 =?us-ascii?Q?A3wk1ChJU3cF5Ld3nZgMkNSbL+rQq2s8oyFFJHo5NDXs41SKPdbcH82QF8AK?=
 =?us-ascii?Q?sU+biV70tx3Sr7MUNDrOFeFpS2FEYrvXFkVzEGt3P0JVniTlFeUghSaI/s8c?=
 =?us-ascii?Q?9ohM7FUrc4xocku49EPfKthrCf8iklh435bBG0d9mheTN89UDORKfW9WkIvk?=
 =?us-ascii?Q?W3KGBfC4SDxjutTzU2Gzi7g5NG9ymY/I4S7K2tqzkctZ6Ir2in3DoH/vQIZF?=
 =?us-ascii?Q?GM6IaWCVmLF4rJFnCvzDKvXRCGfUATkNcad6hoC+i3oLXKmcCv+AutRUcjiD?=
 =?us-ascii?Q?7ujHA6M06cWkjiB7TVR4jaXPAMMXbp+ju5jlKFr9b0vQjNVb0KOcMq7SOXGX?=
 =?us-ascii?Q?7CXDgp5WMqC0T4ik22wZJuckgqe9t5iJ0aq3SeAZQ7JkJLwSQM4zlrTrahB6?=
 =?us-ascii?Q?bqTz+BExfBvzlpN2WAoNUl7gw4dSnlSovF8g6BRjmBju7Hwh1IlXlDsZZvNJ?=
 =?us-ascii?Q?XaoyO/Mqpvdy9VUwhHHA/KgqahXkzNyfbJjosHL3S7g1OeEIJWP1Af1o5YkT?=
 =?us-ascii?Q?OJqlB0AKn7n6kfgzwn0Lt4gtYA8r1dkqBQjX0V6jewVmM6TNFPUUy4Lju4oA?=
 =?us-ascii?Q?RZbnumwMZuN6TuecbF91arG05D1+o1C+pCOYI95b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e88c9f-a418-4d2b-4c70-08ddac9cf992
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 06:13:55.8095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dzWsY1MZIRF6VRxL8gml8YAOUp+KYm5RI1vD4trlgPitUbpq+pwyi/9gz2h3hkE5HoncPm/99MZiJlL0SNwE+9rGpvTcOWck9F1HaomC4MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 14 June 2025 03:18
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 1/2] drm/xe/pat: Determine ATS / PTA programming during
> early sw init
>=20
> Decide whether programming of the special ATS and PTA PAT entries is
> necessary (and which entries should be programmed) during early software
> initialization rather than hardcoding this into the 'program' functions.
> Future platforms may want to re-use the same functions but utilize differ=
ent
> special entry values.  Consolidating all of the decisions into one place =
keeps
> things simple.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
>  drivers/gpu/drm/xe/xe_pat.c          | 21 +++++++++++++++------
>  2 files changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..003afb279a5e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -499,6 +499,10 @@ struct xe_device {
>  		const struct xe_pat_table_entry *table;
>  		/** @pat.n_entries: Number of PAT entries */
>  		int n_entries;
> +		/** @pat.ats_entry: PAT entry for PCIe ATS responses */
> +		const struct xe_pat_table_entry *pat_ats;
> +		/** @pat.pta_entry: PAT entry for page table accesses */
> +		const struct xe_pat_table_entry *pat_pta;
>  		u32 idx[__XE_CACHE_LEVEL_COUNT];
>  	} pat;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex
> 38a6a49c1b2a..31663ead7822 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -307,21 +307,27 @@ static const struct xe_pat_ops xelpg_pat_ops =3D {
> static void xe2lpg_program_pat(struct xe_gt *gt, const struct
> xe_pat_table_entry table[],
>  			       int n_entries)
>  {
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
>  	program_pat_mcr(gt, table, n_entries);
> -	xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),
> xe2_pat_ats.value);
>=20
> -	if (IS_DGFX(gt_to_xe(gt)))
> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
> xe2_pat_pta.value);
> +	if (xe->pat.pat_ats)
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe-
> >pat.pat_ats->value);
> +	if (xe->pat.pat_pta)
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
> +xe->pat.pat_pta->value);
>  }
>=20
>  static void xe2lpm_program_pat(struct xe_gt *gt, const struct
> xe_pat_table_entry table[],
>  			       int n_entries)
>  {
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
>  	program_pat(gt, table, n_entries);
> -	xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS),
> xe2_pat_ats.value);
>=20
> -	if (IS_DGFX(gt_to_xe(gt)))
> -		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA),
> xe2_pat_pta.value);
> +	if (xe->pat.pat_ats)
> +		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe-
> >pat.pat_ats->value);
> +	if (xe->pat.pat_pta)
> +		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe-
> >pat.pat_pta->value);
>  }
>=20
>  static void xe2_dump(struct xe_gt *gt, struct drm_printer *p) @@ -386,6
> +392,9 @@ void xe_pat_init_early(struct xe_device *xe)
>  	if (GRAPHICS_VER(xe) =3D=3D 30 || GRAPHICS_VER(xe) =3D=3D 20) {
>  		xe->pat.ops =3D &xe2_pat_ops;
>  		xe->pat.table =3D xe2_pat_table;
> +		xe->pat.pat_ats =3D &xe2_pat_ats;
> +		if (IS_DGFX(xe))
> +			xe->pat.pat_pta =3D &xe2_pat_pta;

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  		/* Wa_16023588340. XXX: Should use XE_WA */
>  		if (GRAPHICS_VERx100(xe) =3D=3D 2001)
> --
> 2.49.0

