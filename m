Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A801606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 03:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XxOA2P4e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FEB10E1DE;
	Fri, 23 Oct 2026 03:39:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5693510E1DE;
 Fri, 23 Oct 2026 03:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792726753; x=1824262753;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LWyHoGw106JSIl7DMFYRqEa7ahnPEQGY1JrbLl+KJKA=;
 b=XxOA2P4ejTprdyRcqxnOTYcpdzcbaATWJvZ3tK2H6yLwNEHKsxs0qW3+
 bSekPq3/JGWnQK2wocEfOZDJWiHqrCyNeY8nsNxc7fJSw4bDZSSn6GMnv
 tbn9myKC7RbSFpFxM2RXD+/jw5fA7YRziyePGkAlDs0Mn3Llw4eUN3Gsz
 PIXQ83WcTPCrPg+rnn2ShHgx5Wxbqatve2RK6TctsVrd1NEdvdbxCl4f/
 WsZYwiM19MGHnHtdnj3MjRBY0BqR0OF0lfP8/J39paU9swW/aRrmsz/46
 GDhHV4hPujduhsnb6M5n+XejL8dJ2F8uydtZOwasjo/IZdoLfAiKgYzbZ w==;
X-CSE-ConnectionGUID: ilz7qQxaTwaNhNsd5Oe9ag==
X-CSE-MsgGUID: EIjO7fonQ3O2yWaoV9bozA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1372660"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1372660"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 20:39:13 -0700
X-CSE-ConnectionGUID: lgxNFshQRUStfQ6Xt62lLQ==
X-CSE-MsgGUID: Qqw0UWq4S6OuOXO3oKAxnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3569965"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 20:39:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 20:39:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 20:39:12 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 20:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crel0uY12/lKD1abt+xznZQjWGLv+YdTStT+97+Oi1InxbvSIfjwaA/kkmfPwk4k7nkRP4ITIdTyO4wZwwQlUW6rOiW8AgdLH1f67LmUdzZiYUHeUHxXHb3HBkiwQdhFfWRw50L8KUCnFmXhEYJtQNvsC4z+Q1c5KwEZi9jTk2nooO/sud8fdsWrnz+XPUWCX2ZWtSdEmOUGb2BsxP9s7v1CHbRKYHOxk7VaTR4znmgja0tSG0a1CuprVHw1mYBonH9NG2Humd56p67khwhB2QxihHdZ+p2rhqbaZsOrXL9FgLb6UnlZlH2pWapio7/ZH1sToEW6lDL4mogvz9EDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsRWpK8spvPBafHgQGs9hgNC3WGkdHUYY0MPKWQN3WQ=;
 b=BJk60gTsJUzIsLqlQPVsb7+L7jpm2cXdXmWx/3dyyS//7anE8ZxX58QadN5EDVjiQypuFBQVWb55orRmlAN0xoqJci4OF+r+80cOsTSaRuNdzc3wLuIy/suWBzzxKsvdlkM1b1rDKFkR9w+hCQG3Z6aJiUKK3IHKRE9OMVsh/7ePzEAqiz0t4UaYS0FJWoE7Iz5TgPdriovaZMkF4a1wAJt179lyQyLcDxKNy0A0Agob/ApIyKJhgNByHrWU4Y9o9iSY6rJm2gioqC1HWuwhKmYwA4BnPQQ+GYihk9VTpD1ZltqEWTgKztL3EXO8A8bQuQaCDYEH9O5DD9G2jaJfzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DM4PR11MB8157.namprd11.prod.outlook.com
 (2603:10b6:8:187::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 03:39:09 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Fri, 23 Oct 2026
 03:39:08 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v7 08/13] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v7 08/13] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdYdSvqywGsreb7Ue/feK8AloBmLcJ0tSAgAACzwCAAKaxkA==
Date: Fri, 23 Oct 2026 03:39:08 +0000
Message-ID: <DS4PPFE901A304FABBCB3729D736EF87C89E3642@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-9-suraj.kandpal@intel.com>
 <BYAPR11MB37830FEF13F6A9C523A0B9C1B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
 <BYAPR11MB3783F7C420248824F9576A00B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3783F7C420248824F9576A00B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DM4PR11MB8157:EE_
x-ms-office365-filtering-correlation-id: 912e1163-3573-4939-dcb7-08df30b73208
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|261021123027099003|38070700021|261022075727099003|56012099006|260925022911599003|5023799004|11063799006|260925021311599003|260925021911599003|4143699003|261009223027099003|10067099003|18002099003|6133799003|261021121427099003|22082099003|261022113327099003;
x-microsoft-antispam-message-info: 3Pu9cIHEAGXCmqjHFabGQi8RSJdMZQpAmHa8Ma2nkoYFiBFijgRQjD3JJNmB6xRImjUVCGfidWhF1tpJXry9A/vwDehtcXmB7CV8Xa7nzoTTQ+DemhLswA1qxcn9bJ95yqVhhxQWS6AvJEMPPx/rzVMe3rDe+lij39QIeTakBS3tAFJqu/PdvCpovzgx8cdfbtEEyKRe10a0aRWosBz1OvcOhbwWsLuotiDY/Rn5e+nhPSlPgO9M2yWwGRlE+YlFA50UNhyY4VZtcocVSp+dgLJZ2bEST/rPqzmJvO/JprK8MPVjxVuAwkq3F9HmFpWm7bb8Zad41mU90yXDI1pbYLke5AvWJvtClwzyWdx4s0PA4ALWKku3tjB8q0VicWwJy0jAsxtowiCyf1riJVUiXs2OWYmE3dZ1Q3icNQjkeQ0qSaRwU896N1AxTDqDEHG+ZnLXK5hB8jI+6TyqHSbtGjYO4NvPXBeIwObG3kRF1TV9jkjMPIHhWGzCGNAwP2HuaZpQcjSKy+8sRFStv6zH9DvfEjQiq5uoqSeQYn7HIJgMTE4f6MD0Ji8gWyW9NwNcXJfUap01Poh0T4DdTS/Q/tGvbYB2lo0EeevPTFsJayqHwujv0CZwpgMOQRSII9wgZwSr5KTPaeXPbGRdKhEHXu9wB72KTGSq5LV4zwL18fQsdp1ItbGsj8nXELD0IgiH0nTR8NPrhba5oJJn7iv/v3MLkYuWpOAgK+q08MC85LY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261021123027099003)(38070700021)(261022075727099003)(56012099006)(260925022911599003)(5023799004)(11063799006)(260925021311599003)(260925021911599003)(4143699003)(261009223027099003)(10067099003)(18002099003)(6133799003)(261021121427099003)(22082099003)(261022113327099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GU3vqXlwjOLBEVadU5zFow3ljyBHxCQkDpplSFEX/VD90M8y8o+lKv/Sg8XU?=
 =?us-ascii?Q?8xgi0pZw6AGOy336NyOW73OfWnu+3GeC25a1JDpSHXsBoHyn/AKsrnlGgafR?=
 =?us-ascii?Q?j4d5Jz63R3WLtDpYGgKMMbB1UthDl9t7U3cXAv+a7EDUeqqRTdEpHg5PEdgv?=
 =?us-ascii?Q?peRu5l5Fyv2oPfoblfzQBCHGRx8cuszj3NrYQpUITYvoyMbP8TQYeVeYTQEi?=
 =?us-ascii?Q?0b4jGMn0MAqnocprNGhVmT7imR4N1cfNKRu9coGNxFy0P4tuaBQ8oH1flLNT?=
 =?us-ascii?Q?Qka4XfEf8RhQ9JObkP4hb5fXt6hLu76h33UbOEVBxVJzsBYBiFl9nT3Y858Q?=
 =?us-ascii?Q?Xv3lSh9jxhlCM/uY0v266CSQfsjvXePIIeysYllW+RgLmpkhwSyCk+7xOIaG?=
 =?us-ascii?Q?59XricaB4kDA0nuU4ZOeQzEPPxLGVZiRw+KjlKzLw4mhDvAn/B/3UxaSgwqQ?=
 =?us-ascii?Q?+Bpq7OvkYP/5FmQVmjqQX1WdOJaMOI9lXgfmtsCfm/LJczg74DUTUjR8WsOg?=
 =?us-ascii?Q?PQw0WpLC92a3PRvuZw6yiT+VXI8lwzBV9fn+GguIBEZPEjNB72cuQHtSFbZg?=
 =?us-ascii?Q?TusF4Ut+jCxdmjUzNoUII4NnKsf84+dW0TCpQNrn+eyaTyKzhq3eU57s/LB1?=
 =?us-ascii?Q?VbPvJ59PZu0GpijWBWF8xw0Zjc1ye0y/PQxdePksOqP607O/kg9KPL8RfrZn?=
 =?us-ascii?Q?e8aSOwy7vE9Qc0ZCiiwt/M4ntGBwGoH5u+EYJ3+pcRd114DWJmwdAuHUcqbF?=
 =?us-ascii?Q?BtELtf9ZPeCyMF7re0V55l1rKt2fTtSHwWCL0KiBWU2TVnG23lFHKz2FLJe1?=
 =?us-ascii?Q?6GO/In3gJCA5mVjX4eF4MHMYDuKjwcaDu5ihRshDKsqykIuki2b6v9kvnGsP?=
 =?us-ascii?Q?HKZeuu0ZzB2ggSsrp3fMNFJVIIkpTlEdEPgGHEmfZninaeWycWc07WEKQ2DQ?=
 =?us-ascii?Q?qI8MKS+UZ8muVY2Y/EEEsunTGzHCAjhJz7BZx8hv+Qg3BBsejfbaURPQign6?=
 =?us-ascii?Q?P/X5FEpXIfyowdAsvY93j7wqpbof3RVoxbypClPJoY83CV8A/L6IaudHWell?=
 =?us-ascii?Q?MG4qqHf7B+Jk2729hZ5y+bX41fAJ21Mj5gSESIATWz6FibagrA5T2wgVTXW9?=
 =?us-ascii?Q?SeAJaDcrNyBfnAE11YzS271dNcH3xlqZm9gof612t3+P547z/hXQdt+K1QYL?=
 =?us-ascii?Q?YVTvhipY1IMXnrPUr4xK7eDfmYaYtqYRI1Cam+gp66ZdjtzEXqN0pojFnapv?=
 =?us-ascii?Q?v3Yn2IpazeHsuEcrOt8Vdp9r3YoeQ7DZhUWL/9p+qYoIQZKJNDVCeW+Yhzj+?=
 =?us-ascii?Q?/Xo3vZwrlJ9LaDsn1qEZuRYuSFZtoOwf2/m3Z1Cp1Ap5syWlHKYNNRdJx+qm?=
 =?us-ascii?Q?b90J8lUOzKMuJQ763eFqVPW9IvkTofLyIkeyU2DvSEdcS/yptuGj6mC9a+4y?=
 =?us-ascii?Q?ahewEswgTkvCvt1lUJiLeaP2Z5FzYJF1nNMYitK1AGovzaeBcV83ePP9dBst?=
 =?us-ascii?Q?kvyOTEwrqUjildSOatx6UtBeyxGVIIa3If3eW70fGa8BnA+UJhULCpVA/hzL?=
 =?us-ascii?Q?hHe1yohhcbEDmt+d5ukbFwP/a5y2t/H74pWVIRqSgYeRFHDc9zib944TkMWH?=
 =?us-ascii?Q?N/tkUDnSfyt9j2ebj4BgWLTn/GjLP6xN0k0m4MKlb+wJRk1RiwbfYH4BF21L?=
 =?us-ascii?Q?Y1Hmd8UWgTHaP5BrHSO7r1nagg6ESnA3oDMzvKJyaYA3+LwgIo19iLxEbDhp?=
 =?us-ascii?Q?ptGqZh7J7g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GdJT4KwPpxMhBJ/QZ328xghKe5BuEaifEodhPDHNBQesnZDNnE42J/txuFBwEMlBgcux+lH7spS/Iz2ZesDkeHTrXF/9CsHhGFv5+/QJTOSJ7XEULXDq79TZZnpqzk5WyHFKgkRIucpeTVKSsKksyn8FClUftYULjJTzFutO9SlBihWxIcbLLHgex3v9CkzOym+hspQAtANwOceYB+hRfm0sX5CBKdDVGot+FDaWTbB2bUaVX2cLJsV4Ga1FjZTibsrRlhRFr/wLkkorKTa+zg8fOx3n/QBeX0jewr3IqrgvnlP182MZoCye+wsz0/C+GRCF1aEVax9m8ekHAm/aLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912e1163-3573-4939-dcb7-08df30b73208
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 03:39:08.6177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHY0yjkB8QOkV0j2qOKst1yJ9KieYJPSeis2y+Wjro0taENkbMu/0yGwmbOKLMMjui8kTh8C4INEMU9NhaATnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Sent: 22 October 2026 23:12
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH v7 08/13] drm/i915/display: Add bits for
> Wa_14021768792 for linkm/n ratio > 10
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Golani, Mitulkumar Ajitkumar
> > Sent: 22 October 2026 23:02
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-
> > gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> > Subject: RE: [PATCH v7 08/13] drm/i915/display: Add bits for
> > Wa_14021768792 for linkm/n ratio > 10
> >
> >
> >
> > > -----Original Message-----
> > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Sent: 22 October 2026 08:53
> > > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > > Cc: Golani, Mitulkumar Ajitkumar
> > > <mitulkumar.ajitkumar.golani@intel.com>;
> > > Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> > > <suraj.kandpal@intel.com>
> > > Subject: [PATCH v7 08/13] drm/i915/display: Add bits for
> > > Wa_14021768792 for linkm/n ratio > 10
> > >
> > > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > >
> > > To support a Link M/N ratio between 10.0 and 15.0, for some BMG
> > > ultrajoiner cases we need Wa_14021768792.
> > >
> > > To bypass the hardware limitation within the Timing Generator DDA
> > > (TGDDA), we need to program the LINKM and LINKN registers as defined
> > > in
> > the WA.
> > > Along with this we also need the relevant bits in HDMI_EMP_DATA and
> > > CHICKEN_TRANS.
> > >
> > > Add the bits for the WA and a new member 'bypass_m_n_ratio_limit' to
> > > track if we need to bypass the Link M/N ratio limit in the
> > > intel_link_m_n
> > structure.
> > >
> > > Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold
> > > INT(Link M / Link N) and bits 31:28 hold CEIL(Link M / Link N).
> > >
> > > The workaround is limited to transcoder A. Check the transcoder
> > > rather than the pipe: for a single pipe the two are the same, but
> > > the joiner secondaries read the M/N back through the primary's
> > > transcoder, so a pipe check would have them report the workaround as
> > > not applied while their state, copied from the primary, has it applie=
d.
> > >
> > > CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N,
> > since
> > > writing LINK_N arms the double buffered update of the M/N registers,
> > > and all of the programming has to be done before the transcoder is
> > enabled.
> > > Both are also explicitly cleared when the mechanism is not in use,
> > > so that state cannot leak from a previous modeset.
> > >
> > > v2:
> > > -Drop the drm_WARN_ON() on the extended LINK_N field in
> > intel_get_m_n():
> > > it is derived from Link M and Link N, so the state checker
> > > comparison of those and of bypass_m_n_ratio_limit already covers it.
> > > (Sashiko) -Compare bypass_m_n_ratio_limit unconditionally, so that a
> > > change to it forces a full modeset instead of being applied during a
> > > seamless M/N fastset. (Sashiko)
> > > v3:
> > > -Check for transcoder A instead of pipe A, so that the joiner
> > > secondaries read the flag back the same as the primary. (Mitul)
> > > -Drop bypass_m_n_ratio_limit from intel_compare_link_m_n(), the
> > > unconditional
> > > PIPE_CONF_CHECK_BOOL() already compares it. (Mitul) -Print
> > > bypass_m_n_ratio_limit in the crtc state dump. (Mitul)
> > > v4:
> > > -Move the state checker comparison and the state dump of
> > > bypass_m_n_ratio_limit to separate commits. (Mitul)
> > >
> > > Bspec: 49266
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_display.c  | 80
> > > ++++++++++++++++++- drivers/gpu/drm/i915/display/intel_display.h  |
> > > ++++++++++++++++++2
> > > + .../gpu/drm/i915/display/intel_display_regs.h | 10 +++
> > >  .../drm/i915/display/intel_display_types.h    |  2 +
> > >  4 files changed, 93 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > > b/drivers/gpu/drm/i915/display/intel_display.c
> > > index 461b81bf8341..9e9321976a21 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -2715,6 +2715,15 @@ void intel_zero_m_n(struct intel_link_m_n
> > *m_n)
> > >  	m_n->tu =3D 1;
> > >  }
> > >
> > > +static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n) {
> > > +	if (!m_n->link_n)
> > > +		return 0;
> > > +
> > > +	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
> > > +		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m,
> > > m_n->link_n)); }
> > > +
> > >  void intel_set_m_n(struct intel_display *display,
> > >  		   const struct intel_link_m_n *m_n,
> > >  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg, @@ -
> > > 2726,7 +2735,9 @@ void intel_set_m_n(struct intel_display *display,
> > >  	intel_de_write(display, data_n_reg, m_n->data_n);
> > >  	intel_de_write(display, link_m_reg, m_n->link_m);
> > >
> > > -	if (DISPLAY_VER(display) >=3D 14)
> > > +	if (DISPLAY_VER(display) >=3D 14 && m_n->bypass_m_n_ratio_limit)
> > > +		link_n |=3D
> > > PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
> > > +	else if (DISPLAY_VER(display) >=3D 14)
> > >  		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
> > >  	else
> > >  		link_n &=3D DATA_LINK_M_N_MASK;
> > > @@ -2747,6 +2758,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct
> > > intel_display *display,
> > >  	return IS_DISPLAY_VER(display, 5, 7) ||
> > > display->platform.cherryview; }
> > >
> > > +static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
> > > +				     enum transcoder transcoder,
> > > +				     const struct intel_link_m_n *m_n) {
> > > +	struct intel_display *display =3D to_intel_display(crtc);
> > > +	bool enable =3D m_n->bypass_m_n_ratio_limit && m_n->link_n;
> > > +	u32 link_m_frac =3D enable ? m_n->link_m % m_n->link_n : 0;
> > > +
> > > +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> > > +		return;
> > > +
> > > +	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
> > > +		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > > +		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > > link_m_frac));
> > > +
> > > +	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
> > > +		     DP_ENHANCED_TGDDA_ENABLE,
> > > +		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0); }
> > > +
> > >  void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
> > >  				    enum transcoder transcoder,
> > >  				    const struct intel_link_m_n *m_n) @@ -
> > > 2754,6 +2785,8 @@ void intel_cpu_transcoder_set_m1_n1(struct
> > > intel_crtc *crtc,
> > >  	struct intel_display *display =3D to_intel_display(crtc);
> > >  	enum pipe pipe =3D crtc->pipe;
> > >
> > > +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> > > +
> > >  	if (DISPLAY_VER(display) >=3D 5)
> > >  		intel_set_m_n(display, m_n,
> > >  			      PIPE_DATA_M1(display, transcoder), @@ -3504,6
> > > +3537,49 @@ void intel_get_m_n(struct intel_display *display,
> > >  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> > > data_m_reg)) + 1;  }
> > >
> > > +bool intel_display_can_bypass_m_n_limit(struct intel_display *displa=
y,
> > > +					int m_n_ratio,
> > > +					enum transcoder transcoder)
> > > +{
> > > +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> > > +		return false;
> > > +
> > > +	if (m_n_ratio > 15)
> > > +		return false;
> > > +
> > > +	if (transcoder !=3D TRANSCODER_A)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
> > > +				    enum transcoder transcoder,
> > > +				    struct intel_link_m_n *m_n) {
> > > +	struct intel_display *display =3D to_intel_display(crtc);
> > > +	u32 link_m_frac;
> > > +	int m_n_ratio;
> > > +
> > > +	if (!m_n->link_n)
> > > +		return;
> > > +
> > > +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> > > +
> > > +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> > > transcoder))
> > > +		return;
> > > +
> > > +	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
> > > +	      DP_ENHANCED_TGDDA_ENABLE))
> > > +		return;
> > > +
> > > +	link_m_frac =3D
> > > REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > > +				    intel_de_read(display,
> > > HDMI_EMP_DATA(display, transcoder)));
> > > +
> > > +	if (link_m_frac =3D=3D m_n->link_m % m_n->link_n)
> > > +		m_n->bypass_m_n_ratio_limit =3D true; }
> > > +
> > >  void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
> > >  				    enum transcoder transcoder,
> > >  				    struct intel_link_m_n *m_n) @@ -3521,6
> +3597,8 @@ void
> > > intel_cpu_transcoder_get_m1_n1(struct
> > > intel_crtc *crtc,
> > >  		intel_get_m_n(display, m_n,
> > >  			      PIPE_DATA_M_G4X(pipe),
> > > PIPE_DATA_N_G4X(pipe),
> > >  			      PIPE_LINK_M_G4X(pipe),
> > > PIPE_LINK_N_G4X(pipe));
> > > +
> > > +	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
> > >  }
> > >
> > >  void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc, diff
> > > --git a/drivers/gpu/drm/i915/display/intel_display.h
> > > b/drivers/gpu/drm/i915/display/intel_display.h
> > > index 404168f4213b..d53b7b4a80e7 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.h
> > > @@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct
> > > intel_display *display);  int intel_crtc_num_joined_pipes(const
> > > struct intel_crtc_state *crtc_state);  void
> > > intel_display_compute_link_m_n(u32
> > > *link_m, u32 *link_n,
> > >  				    int pixel_clock, int link_symbol_clock);
> > > +bool intel_display_can_bypass_m_n_limit(struct intel_display *displa=
y,
> > > +					int m_n_ratio, enum transcoder
> > > transcoder);
> > >
> > >  #endif
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h
> > > b/drivers/gpu/drm/i915/display/intel_display_regs.h
> > > index 983a0d9dcb9c..bbdbc27629d7 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> > > @@ -550,6 +550,11 @@
> > >  #define _TRANS_MULT_B		0x6102c
> > >  #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv,
> > (trans),
> > > _TRANS_MULT_A)
> > >
> > > +#define _HDMI_EMP_DATA_A	0x600d8
> > > +#define _HDMI_EMP_DATA_B	0x610d8
> > > +#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
> > > +#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display),
> > > (trans), _HDMI_EMP_DATA_A)
> > > +
> > >  /* Hotplug control (945+ only) */
> > >  #define PORT_HOTPLUG_EN(dev_priv)
> > > 	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
> > >  #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
> > > @@ -1192,6 +1197,10 @@
> > >  #define _PIPEB_LINK_N1		0x61044
> > >  #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
> > >  #define  PIPE_LINK_N1_EXTENDED(val)
> > > 	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
> > > +#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
> > > +#define  PIPE_LINK_N1_EXT_CEIL(val)
> > > 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
> > > +#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
> > > +#define  PIPE_LINK_N1_EXT_INT(val)
> > > 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))  #define
> > > PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran,
> > > _PIPEA_LINK_N1)
> > >
> > >  #define _PIPEA_LINK_M2		0x60048
> > > @@ -1710,6 +1719,7 @@
> > >  #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
> > >  #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
> > >  #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
> > > +#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)
> > >  #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
> > >  #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > > index 8f9fb2603638..d0748837ce97 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > > @@ -985,6 +985,8 @@ struct intel_link_m_n {
> > >  	u32 data_n;
> > >  	u32 link_m;
> > >  	u32 link_n;
> > > +	/* Wa_14021768792 for linkm/n ratio > 10 */
> > > +	bool bypass_m_n_ratio_limit;
> >
> > This commit still combines register definitions, WA programming, the
> > bypass helper and readback.
> > For reviewability, could it be split into: (1) register definitions,
> > (2) the bypass_m_n_ratio_limit member plus write-side programming, (3)
> > readback together with the state checker compare (fold
> > `drm/i915/display: Compare bypass_m_n_ratio_limit in the state
> > checker` into it), with the dump staying separate ?
> >
> > I'd keep the compare after the readout rather than before, so it
> > doesn't land without anything that sets the flag.
> >
> > Not a blocker; the current order is bisect-safe.
> >
>=20
> Optional,
> for reviewability: 548e544158f8f could be split into
> (A) the register definitions,
> (B) the bypass_m_n_ratio_limit member plus the write side
> (bmg_get_link_n_ext(), intel_set_m_n(), bmg_enhanced_tgdda_write()), and
> (C) intel_display_can_bypass_m_n_limit() plus readback, with "Compare
> bypass_m_n_ratio_limit in the state checker" folded into (C).
>=20
> Each step builds and is bisect-safe since nothing sets the flag until the
> compute patches. Fine to keep as is if you prefer.

Sure will do

Regards,
Suraj Kandpal

>=20
> > >  };
> > >
> > >  struct intel_csc_matrix {
> > > --
> > > 2.34.1

