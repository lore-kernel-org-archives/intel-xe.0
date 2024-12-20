Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FB9E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 16:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4250410E051;
	Fri, 20 Dec 2024 16:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/oaaV6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6335110E051
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734711315; x=1766247315;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K5qxJWM4OjkxxKrJayyknIwpovKK4sltXKfFkFshAhs=;
 b=S/oaaV6a6GoFHHJ/TQ/M7VjP9YBwBF5Wh7XeXPBY/2SeKlRSfW8wt148
 TNQ6912g4TFrO4Owm4UTgEh5dFgcWboGV+RsHYTS3SAEqtRVGETdNQouW
 j+BFgwj8GdmuHr5GaHkzkqz3RSdRzMfTuEU4icQnL0qOV2GvjQGJDfHjs
 D8FpP6QYoFBlaOzLWmHa2lSH8bPmwfodtF5vLheVmmrmtScBumC47ZyWY
 3tIWZrtQzb0W0P/1DLI8tMJMGxMXv9gxNudzuxPhJu+cQGiu9oUQTW9Dc
 O7Ka+aF3dUq/Ce1kleG7P6wkr7u0ZAr/Lo729f9cyYcQDJcwcGNAB2mjQ Q==;
X-CSE-ConnectionGUID: 0ZmIjZcETZCHnJiQ9+we4w==
X-CSE-MsgGUID: 72X7MejSTwiJA6mMbGjPHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39047952"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="39047952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:15:13 -0800
X-CSE-ConnectionGUID: o4U8Lj8PRcmuJJSF4Et3Sw==
X-CSE-MsgGUID: 99NFxy2OQV2jhYZZDJP1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="129357681"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 08:15:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 08:15:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 08:15:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 08:15:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmK+r2Xwr8rBhF7LTJlFbNwQXB6GlVOnLuYCXwEsINP1SGWrJ4jk7AIBNm0aPL74xNKmaz7R0n2VdfVpa1Cr/bh+9QMe6YcQm+cayIhxvzmlSsSW15VJksgdbTdNOz90uLln0xn8TWA/SNL9XQNHnChY7eLbdBiRbWFjaGfTwOg7fFUOHeNUJeqwqvFniJZ29JLNdK2G0SOzHMOUus8JMnhR0Ms6H5sSt408zkMX/MocwhGK/uzZcsF72hgR1QdIYcDp6U/rO5LovU532QrkthxPM6icgiQRZ44yKBQYQf6CSd3/Exm8v30feKuOzcoRObYweCAfbpkCJdkkDF8mVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoIz++6zogLRZbykg7Q5GU7TwpUDRAcsmDKOzqCApA4=;
 b=mrM2zqXACdH1Qa5eSrqEaF3ZdIGLvaFtPzUCQN3UGv6sZxLCTChTvgmEJ0gDE+7+jaLeBD89pmY9dFI/A7q/jd/1XhnGQf1enfPPsH+1suSc7Py7j4WlmD8CmD5QLDkwKt7Y8yzHBymGGFZhdR2+JVzKD/IR6vezlSCwSBJ58r2WWCvsEij3BUQsDE8pIBk4iHdrPfXbwJXjV8HDIh2HRM/mgNOyhafujx/DyXZ6wTyGZ5uflFc7deCN74w+Wft32p1D3fLJhNJwn8AuSLUDpX2ls+sCLCOGXMbFRSg6P5QtM4nvxmhN4aiqu5KZJxcqJoTUFqrfvFGY9F5XqNpCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 20 Dec
 2024 16:15:07 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 16:15:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Introduce the RPa information
Thread-Topic: [PATCH] drm/xe: Introduce the RPa information
Thread-Index: AQHbUvQIz8MGkmRO4EimZtVwAMs7lbLvTcOA
Date: Fri, 20 Dec 2024 16:15:07 +0000
Message-ID: <BL1PR11MB5445192AA37160C59E664860E5072@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241220152936.623627-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241220152936.623627-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|SA2PR11MB5129:EE_
x-ms-office365-filtering-correlation-id: cea95859-6e7f-47cf-a5b5-08dd21117892
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ssQe8OIYvVatc705QhpDGLtwu9JTpO6fkIhpSHgMg/HLVc3PGj4/eZkCYFow?=
 =?us-ascii?Q?fXn9bzacDYIvQoajl7rHa9YHYOJrCsjRVC2DZ0ygIHZ550iEqmF2XDgvh0HJ?=
 =?us-ascii?Q?5ND5m5+Vw15L+6vIHJltNS6QMp5+ObdeqjadCrY+V7tqwvYyfkH3/xe/ViK8?=
 =?us-ascii?Q?rec1snNF+WcL5RSzj8PuRIqJ0SRRGMQJrKf5yPmwODFh6HGO3sLY94rLWZW5?=
 =?us-ascii?Q?QtSrfCFZuOOFPvSRpNXf813Og10o4IXIXMY9qaMLSfa0Jwz4qPRHfMNqN/yE?=
 =?us-ascii?Q?P5gSzfCnwzkFjm9SFB22YhoFy9lf54ruVSqOfBZBubFKQNkrINNE0MN0ywvE?=
 =?us-ascii?Q?bzgrK6JUe0bX+y2XTze/xPAmRjBqSB0XE147egmcFiGiJESAwr8KkHIaIlhr?=
 =?us-ascii?Q?gAPnnolP4J8sZaBrnco3MBIKPDkYwHpzH1q3ryTEiHbp0ni9CUwQec2tMNFC?=
 =?us-ascii?Q?1kfwklq926wz1CAp5LNYEZri+wq9ulZAaCj6at/oueco7i+OjKYAjtyBtj5F?=
 =?us-ascii?Q?sL3VJr7ZiGmOlUrdtHO+1alrPil15GXOsrwfkTB76PqGAQDwfv48L1uZNZIz?=
 =?us-ascii?Q?o1EjQfGFM1xPlczE0UNJ3+kJ/XxsGZ7s+S+XuZF1TtraXvXN58vCqxdOIjT9?=
 =?us-ascii?Q?XpeSbsyIMASGHNUYlBX8XbALvSX5ZDWvrnSiVahwcke4oi38IGqOK0OF7cik?=
 =?us-ascii?Q?6+juTYzlJ2BfQbT8pT7B/WRmoMbf5A447G+ZDZd1mZgy83854SomN/ZViyEp?=
 =?us-ascii?Q?+UDqsPNYVixexnnFJRgBwxizkHRDxW/dipJ5JbtfiiCB9a7v/ilOHTJBipoc?=
 =?us-ascii?Q?MGrLO0vYb19a1a2JerWVZRB7uF3rbEV6yykim6E8GZxGE2r7hcMaardqZWwv?=
 =?us-ascii?Q?GdYDqzVvJu/wMRgBKQEOGW6ys+GJxKiJ7Eh4Q73OPr0ebIwfi287iA7IC1RR?=
 =?us-ascii?Q?d1lCPHp8gRMLPe7f7m1V45wTLu6KM79luMWuDqIOgcIpAyPYBVhxvsaJsqbw?=
 =?us-ascii?Q?li4D4X5dBPfNjSWEhZkHDlZJZnaHziJX8y1j12vLMWTaj24H+/EYLTPUgwDk?=
 =?us-ascii?Q?DTEJQrUIddiCjemjvqNAZAkUTWjrqS9pImM9jiDpijnDuZ73iRrZffJ8GO52?=
 =?us-ascii?Q?UmZEjUV6O+3plsbWrHfX7jutPeJMUQ7V15XXCPfw0lbCf6KVb09CKTROjmZe?=
 =?us-ascii?Q?B2S1E/n6rOApgPIt0CucqdmIJoBgUcXwt0XsnErhkeHTP/OTD2UkEXuoXELC?=
 =?us-ascii?Q?EQHSzlIGwDL9/FfDWBrQs0qH88FR1SCHO8+ZduvS9e1A3j7NBDaLQGmAvWLo?=
 =?us-ascii?Q?aQqeBk3CpWg+kUIpYg3keVKuJX5NlXLyx8g33U7lSpeWH63pCAJ5ab6nraCX?=
 =?us-ascii?Q?Lkpi40CW+nvE+W77vz4VbUN3r2l5sTCUMNL7y8PD1HSP3itjYJ09jfyUiRaC?=
 =?us-ascii?Q?p2vCdwX5joZq1+x94w5/QZa1LO6+VuUE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bkfFUAUuZvDj1nd2tKtgUnIedI8WVXlsMiHUiqFBxEPfcfl7NZfnM4teOw1k?=
 =?us-ascii?Q?l/byo25+pVNs1DdnfX/F9dDFJb/RNTFDzKdG2WmXbzIwFBNnY2kzFgXj8BQc?=
 =?us-ascii?Q?CFwnWXa0fo59njPLgxzjhoZWHsaEARVtojL0zknqjZzTtoS75ROpvTDvWF3a?=
 =?us-ascii?Q?GQbLm4n5cp8abddIQ0IEwurVvboPFuOCp9lxsCUGYyQZcKj2POXHDDyLFnmf?=
 =?us-ascii?Q?1J7V9ulGTW0b9avGol2CIX/x1MVyZW53rNo4YtrbeFAGUTT+3PypR/R7/iJV?=
 =?us-ascii?Q?qGAxj28Hfs2M4pzjfdR3ZVuCJUPysVMiLtuyjuO9NeZd1t40qd38xmsDBKRq?=
 =?us-ascii?Q?46df0GYKJWQWXKezvT7ybzb8sFp7M9Z0gNDl5EcNPrcYFfEgZaSBvoe1Eh0c?=
 =?us-ascii?Q?5AwkMyV9MdW7M9RSmWKm7gQZ8EmP6xWBOw+6Y8OWiZPAQ20xY2ja/8iB66mV?=
 =?us-ascii?Q?E6AciAPJgqpLCYDjurniWe94QIaYHfxB7vfEj+2vIDc+gT/uTsX4oEgrDvrH?=
 =?us-ascii?Q?hPCNwI/gb5YRRefp/qfimdbaOszseMQCkgF44YYU8NEbdyiXtXrcN6YeMCaK?=
 =?us-ascii?Q?QQaiY6qSEZ9WZQcSxVoXjLIyH5K+xJC5iDjVZNf4qoJ9tsY3VNX2zXb09ihC?=
 =?us-ascii?Q?aojMGyCbcIV8PkEU65USNDR908+hmbt4fw7isJI589WlM9KZli1hQ2B4Tfl6?=
 =?us-ascii?Q?fHJ61Z+MaYq1uor6BN02kbYd59HCyji2RRshi4MrvlaNZQ/ka+vccxLacxnS?=
 =?us-ascii?Q?9krnOg0lO+nKnlx/ssBcCHAc8pbIluBI6S0sBDZLebqWrB2Ic2BpZuM5EwaH?=
 =?us-ascii?Q?QqkJVs+YKtfZBIf9M7Uya9ETgwzKuBjr9dF/kyvO/rEl7vnbS5VeravEN+7O?=
 =?us-ascii?Q?EOiAbNVRMflqClg9uo3gTKRXT1HgQHwzRLHL2EQcmoUBMvcP8nPwr6U+baEQ?=
 =?us-ascii?Q?yApK7lOtnFVw3P+1ofOQ560Mls1XdO9IpkqlyW0xqthbai+n3iUYNYIoFISz?=
 =?us-ascii?Q?mZYvBLP+AEdomgUZlQhjRSZU60zTEUWJARJynGblpEon+9t0VAszmJKPG5A5?=
 =?us-ascii?Q?/MlFdZ5hG2l/4IGnxn6f84bTCWTILV8ku0PEJKZn8upNLmPOpOb8uQq2WkP/?=
 =?us-ascii?Q?tJuepD/EBGzjPWhM65EVGkFITVjf5cD1oyTtFtPtVVoCDrPOOmWrVmrfk/aC?=
 =?us-ascii?Q?lC2OaM0Ldi6l23o/0PZWc6jF3OgFivGjh0ECwEt1vROx1uykSkoKfUUxnJc1?=
 =?us-ascii?Q?mZpKAiI7IwjQWnuQWLJLnRWg2VNKkaakCPqS8n6O6LiZjMr1LbsuPVstSowO?=
 =?us-ascii?Q?OIt6Zgl7qrgjxnbVwtQh828OqM75fKQ72vQPbdqOTHGLqFMx8DLxzD6QHgsq?=
 =?us-ascii?Q?ns3856Jgrb6OuiKCA2qIChsGy9LwabI/5VyYsdnSlSEbXoNHXtC8669IUZAv?=
 =?us-ascii?Q?nDuMp18+E7yolH73wZG/GWlkM88sHeO32l+dAnuByFRVrXuQ2ITs/enHfKoo?=
 =?us-ascii?Q?3z2+L/Xvkhow9pAlpayWL8oBIIoPxC9WRU3mtq+rvnzPNcRstw3349lSn62z?=
 =?us-ascii?Q?gleLLeuVKZa51AQo2NX2gFDHnlHAsLe4ERfuEM6Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea95859-6e7f-47cf-a5b5-08dd21117892
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 16:15:07.6896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/BGd7ih0Z+oPRxvPssIEXF2fPyvnMgpliejV+G0k+PHHBkYQfLfy/W3l4LndKuAwND3lokzfCuQ0DW9AKGltHyQvn2Vs5ljYcTwrcI1b/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Friday, December 20, 2024 7:30 AM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgau=
mkar@intel.com>
Subject: [PATCH] drm/xe: Introduce the RPa information
>=20
> RPa is the Achievable frequency, defined by PCODE at runtime
> based on multiple running conditions.
>=20
> v2: Remove RPA_MASK from i915 file
>=20
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

This is probably good, though if you have a link to the BSpec page for the =
RPa
registers, it would be good to include it here.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h    |  4 +++
>  drivers/gpu/drm/xe/xe_gt_freq.c      | 15 ++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 53 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
>  5 files changed, 73 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/=
xe_regs.h
> index 3293172b0128..6cf282618836 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -44,12 +44,16 @@
> =20
>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
> =20
> +#define MTL_GT_RPA_FREQUENCY			XE_REG(0x138008)
>  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> =20
>  #define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
>  #define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
>  #define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> =20
> +#define MTL_MPA_FREQUENCY			XE_REG(0x138028)
> +#define   MTL_RPA_MASK				REG_GENMASK(8, 0)
> +
>  #define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
>  #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> =20
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_f=
req.c
> index 6bd39b2c5003..604bdc7c8173 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -115,6 +115,20 @@ static ssize_t rpe_freq_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(rpe_freq);
> =20
> +static ssize_t rpa_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc =3D dev_to_pc(dev);
> +	u32 freq;
> +
> +	xe_pm_runtime_get(dev_to_xe(dev));
> +	freq =3D xe_guc_pc_get_rpa_freq(pc);
> +	xe_pm_runtime_put(dev_to_xe(dev));
> +
> +	return sysfs_emit(buf, "%d\n", freq);
> +}
> +static DEVICE_ATTR_RO(rpa_freq);
> +
>  static ssize_t rpn_freq_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
> @@ -202,6 +216,7 @@ static const struct attribute *freq_attrs[] =3D {
>  	&dev_attr_act_freq.attr,
>  	&dev_attr_cur_freq.attr,
>  	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpa_freq.attr,
>  	&dev_attr_rpe_freq.attr,
>  	&dev_attr_rpn_freq.attr,
>  	&dev_attr_min_freq.attr,
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index e8b9faeaef64..a6fdd2c062ff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -38,6 +38,7 @@
> =20
>  #define FREQ_INFO_REC	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>  #define   RPE_MASK		REG_GENMASK(15, 8)
> +#define   RPA_MASK		REG_GENMASK(31, 16)
> =20
>  #define GT_PERF_STATUS		XE_REG(0x1381b4)
>  #define   CAGF_MASK	REG_GENMASK(19, 11)
> @@ -328,6 +329,19 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32=
 freq)
>  				   freq);
>  }
> =20
> +static void mtl_update_rpa_value(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	u32 reg;
> +
> +	if (xe_gt_is_media_type(gt))
> +		reg =3D xe_mmio_read32(&gt->mmio, MTL_MPA_FREQUENCY);
> +	else
> +		reg =3D xe_mmio_read32(&gt->mmio, MTL_GT_RPA_FREQUENCY);
> +
> +	pc->rpa_freq =3D decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
> +}
> +
>  static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt =3D pc_to_gt(pc);
> @@ -341,6 +355,25 @@ static void mtl_update_rpe_value(struct xe_guc_pc *p=
c)
>  	pc->rpe_freq =3D decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>  }
> =20
> +static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	u32 reg;
> +
> +	/*
> +	 * For PVC we still need to use fused RP1 as the approximation for RPe
> +	 * For other platforms than PVC we get the resolved RPe directly from
> +	 * PCODE at a different register
> +	 */
> +	if (xe->info.platform =3D=3D XE_PVC)
> +		reg =3D xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> +	else
> +		reg =3D xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> +
> +	pc->rpa_freq =3D REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER=
;
> +}
> +
>  static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt =3D pc_to_gt(pc);
> @@ -365,10 +398,13 @@ static void pc_update_rp_values(struct xe_guc_pc *p=
c)
>  	struct xe_gt *gt =3D pc_to_gt(pc);
>  	struct xe_device *xe =3D gt_to_xe(gt);
> =20
> -	if (GRAPHICS_VERx100(xe) >=3D 1270)
> +	if (GRAPHICS_VERx100(xe) >=3D 1270) {
> +		mtl_update_rpa_value(pc);
>  		mtl_update_rpe_value(pc);
> -	else
> +	} else {
> +		tgl_update_rpa_value(pc);
>  		tgl_update_rpe_value(pc);
> +	}
> =20
>  	/*
>  	 * RPe is decided at runtime by PCODE. In the rare case where that's
> @@ -447,6 +483,19 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
>  	return pc->rp0_freq;
>  }
> =20
> +/**
> + * xe_guc_pc_get_rpa_freq - Get the RPa freq
> + * @pc: The GuC PC
> + *
> + * Returns: RPa freq.
> + */
> +u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
> +{
> +	pc_update_rp_values(pc);
> +
> +	return pc->rpa_freq;
> +}
> +
>  /**
>   * xe_guc_pc_get_rpe_freq - Get the RPe freq
>   * @pc: The GuC PC
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_p=
c.h
> index efda432fadfc..619f59cd633c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -21,6 +21,7 @@ int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>  int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
>  u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
> +u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
>  u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
>  u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc);
>  int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe=
_guc_pc_types.h
> index 13810be015db..2978ac9a249b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -17,6 +17,8 @@ struct xe_guc_pc {
>  	struct xe_bo *bo;
>  	/** @rp0_freq: HW RP0 frequency - The Maximum one */
>  	u32 rp0_freq;
> +	/** @rpa_freq: HW RPa frequency - The Achievable one */
> +	u32 rpa_freq;
>  	/** @rpe_freq: HW RPe frequency - The Efficient one */
>  	u32 rpe_freq;
>  	/** @rpn_freq: HW RPN frequency - The Minimum one */
> --=20
> 2.47.1
>=20
>=20
