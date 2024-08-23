Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D73C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 05:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697B510EC26;
	Fri, 23 Aug 2024 05:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sn1CXbMA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2073010EC26
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 05:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724391029; x=1755927029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LQSaVaPYfzH6LEHgM/RTho2bfLEZIAwzDIAGnLzSwgE=;
 b=Sn1CXbMA8bkAxRhq1QbGIez1B3j10mcNKiuGEDuky3IgPqhTKljUZpYp
 pi+03VhJiTovNBL3VU+dEpKaS35CQ/Vm8U8q9TA3gNXd9qwCVC4r8Dkg2
 AgQYatntLbjcggahqrGtbNtsWcCaKG4J/98TDE5zpcG/LYQGLl2M8wFTb
 sTWlH8zKCULdMLyFny29hg3eBONKfhnmOTK+c21d79DpgnPvLs0JOyOfz
 J9tKnwndL+FLp29JOm8JJY3iU4gHmHXTYQyhGqM68m9HCC8TpB6VkkqOj
 m2+MFf5syeslYtQ8pNMD0QOoy09FuOaEnfWsUIc3PyoCv67l95u/S4XTg Q==;
X-CSE-ConnectionGUID: u/oUYBs/QYSCvqGga2dsUg==
X-CSE-MsgGUID: uJn09+NRTTmm8yaO1/e30g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26595559"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="26595559"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 22:30:27 -0700
X-CSE-ConnectionGUID: 39nXxIctQOyQpNtK/vgRXQ==
X-CSE-MsgGUID: x2g6pQ4USduHjzGT4hqZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66021908"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 22:30:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 22:30:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 22:30:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 22:30:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 22:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RW/DOMXJ3UVLbXjeSuGW12J93t0kpFtCMrhEa77uB3nEeSXUErtYM+FtDqvgFRsaURzQl2q/kWy5gfqdWfZ/IJO5oFAtGF9CEkQONY7ij0Oeo0WRcbVeGYHY8bEjTAKjHS98mbHLlMvWETOykZU/4v3+97A7GA2cQKMi5GJnhOiootiH2KkZ2PlFah7VbIcNR+PaPcNQSLI4YUBk4IznlUK637odUL6O5Fh9tWirZiRlWcbiD94r+VIkQaABHpdxpl31rWRabFkl2PTYQ9SDN391BRVBXkhGHi9wnjlA6lNk7kRgfK3u4MopOVSBQtInryg4ck4gJVO6Una7OW473Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o0e5V4ulTBvmzvXCUsppZ0fxpushHTqhT5fWea0KJs=;
 b=Om44iRn8Zp3EYeQDGS/wqD+TQ52bVOWEyrbIP7uZ/mYOZamCEDT4tsPaMkINLn9H00xwbl1J+zi3oWtFUqTMQQ+lMG/lD/knaslEpg0w18NZ8oICgwIaRqACK3fSOJHv47uHWSTcWyq3Bps3qE3tJK5oBk7H4ChnLrK/W+UFq4upa94gbIOfhcVHrkI2eMeObT5sVDa1pBk7UXun95yKIdz/NSKXbotPWVomkqP49LZ5Zb/5q/kmZVZ1K/uAa2kL0hm7/9GPVMmnOe9Z87CQa9Hv+W3EZ6sjF0rZyiNc28S8jiIIiVhdBTvqF3MFgM5fjWf5BeB2pbZEbdsQEbfhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 05:30:24 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 05:30:23 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "ville.syrala@intel.com" <ville.syrala@intel.com>
Subject: RE: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Topic: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Index: AQHa8yRxSHbN2EGPg0GDkKIKvSAJeLI0MqbA
Date: Fri, 23 Aug 2024 05:30:23 +0000
Message-ID: <IA0PR11MB73071438F92AEF10750E423CBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-3-vinod.govindapillai@intel.com>
In-Reply-To: <20240820171408.192309-3-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW5PR11MB5787:EE_
x-ms-office365-filtering-correlation-id: de963664-6119-4fb9-a68c-08dcc334b014
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?B2PIae8UOEPithubytqaHBj4+0RX5X9pjzMUGws00WyqalDrHNMZvSOc2xeS?=
 =?us-ascii?Q?mJA0F5AC/jciC92ORLXCPtH3T/VLc1ts51wHaF8heewgKGowH2l7KHHj+BTN?=
 =?us-ascii?Q?U4JuCl4fHqnfFeJvOy0le4IxDLDGf8VMRbN0Gso2VZWAPqspKVPpn6L7K1FZ?=
 =?us-ascii?Q?vE6+9wz7lE6DqJsCEG0OJvOc7lZbgemyjmVVNlwYS0fl4jb+rR+3jjJMNoSq?=
 =?us-ascii?Q?98rEOFIQkkvFd09VMBjzCfjgWKV7bvHVFsQwlpzxUwpOaS0OVWTe3aK9FWkm?=
 =?us-ascii?Q?c/rqlqtQjSkbb6x1lrLiPBaFopQhlwdMBq5ViEqflaLhMa7b/PGPsD5VLgk/?=
 =?us-ascii?Q?CTDy5hfdzRu7xUOWk9J31ilf1Lv8qmRHsVZuj05jIsx3MARvjBdHUo20umrq?=
 =?us-ascii?Q?m6xaHlBTqPkCeOMNqL1cfgyjnnB6Xd8UcUmtVXS3oRY/Mw8XRxo9nj/uMpUu?=
 =?us-ascii?Q?BHGJYewtKwFYQoJGCEQ4iJnXuweQZ8osgLnWyXMTegPRtB56mcasWjSsb2Fy?=
 =?us-ascii?Q?+W1MMIgC+z6jYKkXaP9VSZjY/6+flsUWxxM4BP4vpFP0CyRG2zMCLsZSi7l+?=
 =?us-ascii?Q?br78eToAyFGJoT9H5d76KHj7yIS+qdlHfMjbZWByOkoIFJtdNcr1Znd/B90+?=
 =?us-ascii?Q?nts4qSbwaSC5yXZZnnlWB88L5hbUJqx2TcfB65hM20b7HlVvrnPkY3VBaygv?=
 =?us-ascii?Q?CXef/3A604M8VFQk8Y6vSZIJOiynBiHsSljimkrPkL5hG6csuPhZ2DZFidt6?=
 =?us-ascii?Q?14vuIqdQMiuju/aNn5N1KEAEEKkDpL8eGn80c7oZdJtgSEbaI7+kgg5uuLi1?=
 =?us-ascii?Q?ZmFvxvzRJdTXaEdcdFQRdZ5FgR2kDTvC8+H41GdCF2gkDgL7gANCn0hYCYRO?=
 =?us-ascii?Q?DiSAl8gs2tG+APZD1of6ZS5ZI7hvwfzxtbrLPixrOTuXihpGYqpck0vPC8/W?=
 =?us-ascii?Q?vdP4jCS85IT2WeIK8VZa05hSR6sW2Tk5kskw+JNWFiJ0Ui1YSIiDA+R1egF0?=
 =?us-ascii?Q?JFQkNDEkjtIRrQ84kArgO3MbdIvUbSm2/2iYNDmLRQM08SU4YD8qwvbQZwul?=
 =?us-ascii?Q?vTjSL409JBpDR7dlz1NgcHH3CffEZE3bO5VRz+MJ131XhUq+SgxvPPUSgoZ0?=
 =?us-ascii?Q?R70A692LxTu8Yiszh4SKOyCGZsWksrnbL7vJsRpJZAT2qgAuCMwgLBhHiDDf?=
 =?us-ascii?Q?Pkbae7PIrVdA9h1/5On3L+cPGnJF5ZaI3Jt+ytH3qMIRR+szFsf//SmqO8HI?=
 =?us-ascii?Q?l72ORxZbGV5lTzrcuQzZEaZ0gHXq8PooTuWs5GXjxFZhV3QixHul0f9rwqsC?=
 =?us-ascii?Q?Kdkm+jYY0CEsNlHkom7lKReuNRZyaDGxkQXrA9n1ywYA5QcMBSaP6RMHiir3?=
 =?us-ascii?Q?zKFs13ODfjDitRCW7tGvENqhcTNo0ZLB+muJ65SwvszovObr6A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CqW9zQao9vL6W8rH4IKPEW34KsS2Ngo2JPoPJLiGXxEn5yike+MXVMUQzJ3q?=
 =?us-ascii?Q?DM9xf5w7yPHleGrIbEq+Y9sKSXwrm37M1Hh6PjMwev0d3+auoRqhaix8vf85?=
 =?us-ascii?Q?ThoSVLzqEOgf9smk/CRbQnXb0IePimf6B0siTJhbtuZx9yGAqiKOPraQu7kv?=
 =?us-ascii?Q?f4A6Udy61Zca+nPovbyFq1T1LEPHh/A5lUqvmpoB9r6u/ACWRX/6xABjc9jv?=
 =?us-ascii?Q?52PlfWlGTJZzZRKy9ID/amlEpKkHphNDGfv/zYoGj965UsfO680RWq2eJKaS?=
 =?us-ascii?Q?yKvr9F/VFDEzX6R4EdGjZ71hPwC1/GioOU4IQuASqw6AZ0OrNmEeRtbwYgfw?=
 =?us-ascii?Q?tw8s6vUsaNnYCB8JxCz8KLFUyRyXyED6f/BhIkXB35XM9rVX5xI70Xw8sydy?=
 =?us-ascii?Q?AEgrqXw7nuTnI496A7w7cUTE8I9uSNQJSCaRHOuFrR8FkhruzXHXp9R+/Fbl?=
 =?us-ascii?Q?IYkZLZ6PlwYwqmAU78d5Ydljx5r7KQIcbBHq8ym6qk5y4Lvdho8yrEJgSKiT?=
 =?us-ascii?Q?17WH1ChtZ1xF7X8Uv91Ww5vxt27jbWYCs9eWNakqx+ZkmWWEWv04ugMbo+qq?=
 =?us-ascii?Q?nAmWQgfELNHIjib5gqXb/SqXVkcKsdT3WjTontUkDgD2RM1HDYvqUZkos1R6?=
 =?us-ascii?Q?cKXy1IDRmb1h+IyVOrmgfkFPP18R4GiOmKFNLAMLwcvcl0+vFRZ9vcwpvedg?=
 =?us-ascii?Q?/VKGy0qixOCTOVYPeu0tDKb0/B4iU5Y7tzwYZQtGKHvLNkNLAH0ABhdn+5I/?=
 =?us-ascii?Q?Ln07NCF7+lD2nQ33v+n7VBw7hTAliTTtJJaz3iL0jYECUTcL0XHQ6+a1NpF+?=
 =?us-ascii?Q?3Yt5NEI1naGnxDKZ7UiYEY1+rIy3j8k3UqR9rw+EOqhl9mjO+Y2UMB6fSW9B?=
 =?us-ascii?Q?ZNV6v2JywvPT/1lWMoEC0i5odKsc/EP6XdnRKIEMjFluDRgUsbgD6VbD3tzR?=
 =?us-ascii?Q?evwTb2ogpDuG3ZQ6sMe1foED8mnvBriK2kQkZ1i4WGGViJr8AigS425H1MyT?=
 =?us-ascii?Q?6SLaGrrOvZdkLP3dU3BW7ZkXl3hNPxx68H839Of/SZ0HEiFbYUPAg2bxgR4R?=
 =?us-ascii?Q?wJR4l668ue2MmJ5Lc+3lk3eJXEWejG0PuZM2uojH/b+4nszSTkQoW4U2wlxa?=
 =?us-ascii?Q?y5bp07qjALcWTeCebTcZ+TYK+2pyuWQERjBMbVY6NvFmBxYwXXlPeyiQS1z7?=
 =?us-ascii?Q?cJ4smGIOgIMtfNlAYOn0do8geeu86XKVoImmNA0McsIW7pNIBdKJ0cR3kQSK?=
 =?us-ascii?Q?ZAwJPnqTnBbJGZq/SHFZLz9i+2+YtY/5n4UvmQyf3u/IIIi6iGO8giJ+lAck?=
 =?us-ascii?Q?2OuJf+mm/1FfkoVf+zre7HhjaMXKzCKsZC4PgfM0KXK+wDPOuc/cPE6+eAwH?=
 =?us-ascii?Q?cAACqRZ8n6d2oz7XnlXDn7Rmlk+7c82j1MtBhODOPi3S2Z7pRpS/A6IxrRjq?=
 =?us-ascii?Q?ndNugGtvznCTtlp2X2oGdSyuC4pYkV4w7DEwzFKsLRW9JO6gG4hY0Ujf0pTG?=
 =?us-ascii?Q?2aqKIjps2R2hW4odarxrI0CDBh527Vc1Hvfmgb5wMxDM4XdTB43DbQxUVloB?=
 =?us-ascii?Q?Ak8kk4e57v+OZ1eZbA+FDWp3jMx0hggtCqjvAaew?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de963664-6119-4fb9-a68c-08dcc334b014
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 05:30:23.9348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7FbQgWhJjCymoUfwVV2UVGNQpF8vLQfD30D1kdmSAzhpcLLfZPEGsA9QmjMad/8QnT5WaFVL7y2F7K4NqWG1lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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
> From: Govindapillai, Vinod <vinod.govindapillai@intel.com>
> Sent: Tuesday, August 20, 2024 10:44 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Deak, Imre
> <imre.deak@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>; Shankar, Uma <uma.shankar@intel.com>;
> ville.syrala@intel.com
> Subject: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
> xe_display_pm_suspend/resume()
>=20
> From: Imre Deak <imre.deak@intel.com>
>=20
> This is a preparation for the follow-up patch where polling will be handl=
ed
> properly for all cases during runtime suspend/resume.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index ad7fc5137b42..b2a0b4b5c45c 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -320,15 +320,13 @@ void xe_display_pm_suspend(struct xe_device *xe,
> bool runtime)
>  	 * properly.
>  	 */
>  	intel_power_domains_disable(xe);
> +
Un-necessary change.

>  	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> -	if (has_display(xe)) {
> +	if (!runtime && has_display(xe)) {
>  		drm_kms_helper_poll_disable(&xe->drm);

Can we get rid of this API as we don't reply on device polling and use inte=
rrupt based.

> -		if (!runtime)
> -			intel_display_driver_disable_user_access(xe);
> -	}
> -
> -	if (!runtime)
> +		intel_display_driver_disable_user_access(xe);
>  		intel_display_driver_suspend(xe);
> +	}
>=20
>  	xe_display_flush_cleanup_work(xe);
>=20
> @@ -387,15 +385,12 @@ void xe_display_pm_resume(struct xe_device *xe,
> bool runtime)
>=20
>  	/* MST sideband requires HPD interrupts enabled */
>  	intel_dp_mst_resume(xe);
> -	if (!runtime)
> +	if (!runtime && has_display(xe)) {
>  		intel_display_driver_resume(xe);
> -
> -	if (has_display(xe)) {
>  		drm_kms_helper_poll_enable(&xe->drm);
> -		if (!runtime)
> -			intel_display_driver_enable_user_access(xe);
> +		intel_display_driver_enable_user_access(xe);
> +		intel_hpd_poll_disable(xe);
Do we need this disable here as we are enabling this only in xe_display_pm_=
runtime_suspend() and hence disable only in xe_display_pm_runtime_resume()

Thanks and Regards,
Arun R Murthy
-------------------

>  	}
> -	intel_hpd_poll_disable(xe);
>=20
>  	intel_opregion_resume(display);
>=20
> --
> 2.34.1

