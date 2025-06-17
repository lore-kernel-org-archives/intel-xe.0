Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F6BC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 21:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097A710E1AD;
	Tue, 17 Jun 2025 21:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1ajSSX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E08310E181
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750194899; x=1781730899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zMxmw+WUpdi462QkoxTJacDaFVVJU0KqBO7GVzjOj+E=;
 b=l1ajSSX8oFXrkpqbmYg/lSDHKmI5z7H74Ms1M7jYBfUjmrWkMOeMjJIw
 x4nDGp6LIgtzAezJU3oNnch/qS1bWAc8UBopxhSk4AEBQla0yYeG2Oh24
 UslOSCA/liYApNj8PDXkQCk5lxo8dkmWGpKiUd1upgCRB4JnVx2SSfq8C
 czt5KkGnyWNU6E25hhCNkAlGK3dDN0nw60OghTZByrG1afzIzqg9iM+m/
 qIYBkXrKlrwHjf8FEBE9G931tu+LHHg9eGs6nLBHVjzcUnvfrjcBn3dX0
 /BGPOvakLoB27rSbckPTF1R+wRnHrg13+0u6NZ9F4i3qJyzwXxXWkRDqb A==;
X-CSE-ConnectionGUID: a4yUqtXtSQqfiiMCyJTM8Q==
X-CSE-MsgGUID: Z2gQFX6NRJmHVESR2pPC0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51622296"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="51622296"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 14:14:58 -0700
X-CSE-ConnectionGUID: fdo00w2sR12EepR5Zp2lTg==
X-CSE-MsgGUID: cVNrb0WgQaqE3RUr27t6zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="179922328"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 14:14:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 14:14:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 14:14:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 14:14:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6ccer+49h4Ae4PR0B3q5oFQgt4DGZvMkOI05fzWF6YhrdXiPQMxrgRim0m5ao/PGJu6EovazTjnsSTWli6KHuQ1lYhlG8jIaEJXhqDJzzMMcDmIaqpPzKRE2uJyTumMohidKJxJ9p9Wk4ezViMqTHdzGdM4vqHH87XVweLdB+oVMS+qMLhWPThHNRFfDAWNApKAfj/+9aNm6e+u/hZCuP1lweM8/GfqzgKHKI1Mp2v2S3Vg5yqJBiLrlah6F/s9OZ/ptF6v3k2cdKssngZnQYkDAdxt8GR8eidJ8greR225fyrZvdtNC4uIWWLZShQPyF8fnTJDJgTcjsZmYswdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrzJYBdwgYOXZaG8i+E8yW3lv8B7Nptgn82giPI/9Gg=;
 b=KsiFVeMQnYtX+0G/AE6c+qAJ6kue31j2YDiw8llz+mBpXA32DVzDN8Z5DTLk3dHifjERBXWsFkEfIloNJpngiis0ImOgwoXJ6TfCf2NhmythKIeG4yovAQf90ChqsIMHytdSTBzM+5L+5hqQIoWY/qMmltzVH7hQdBXT3NCFYafjfIUdms2tje9p+DzTc5meqQ5xSQ2PbaXj6z/BKO1Dxu8W1aIRsQMEHRpD9rUdpth/8eqq4rX66NIIyaxe3o6CjCqJw5XQw1puBrBx0iGpqCof0l3Uo+MNIH0g+DwIUGRzqUK6B0f7ICjR4sBp4zxEkxx8fpxxFf/RnmbZOq7Abg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 17 Jun
 2025 21:14:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 21:14:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 2/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Thread-Topic: [PATCH v4 2/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Thread-Index: AQHb36xjgDf+93lXRUe6aJJ2659B9LQH2ayg
Date: Tue, 17 Jun 2025 21:14:26 +0000
Message-ID: <CH0PR11MB5444407666E7580F73B33E02E573A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250617171600.2905682-1-soham.purkait@intel.com>
 <20250617171600.2905682-3-soham.purkait@intel.com>
In-Reply-To: <20250617171600.2905682-3-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: 5d3c04a0-123e-4ad1-af84-08ddade3f0d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Wzzv8Puvv/0DtAzlWuvbRGLJ32/YwwfBdomhLD5PoVobiYWAF2H1QMwBw2Yz?=
 =?us-ascii?Q?qYVIY2GvqYfOntp5+9G0EqdjrjlypimUvFQmvibCvhDcPT6PSUklP3YQ0Jex?=
 =?us-ascii?Q?XafGDdWBEFFtnfg7rcpBfFHZpSYklBMWTGtibJVl+hG93cJSxwCTN2z7F9f+?=
 =?us-ascii?Q?vOT6jhYhePpIlazxzVVvtz8lKST947isMN+/2i0JyZNBbfkmJc+h0PQYFR/o?=
 =?us-ascii?Q?EE5iPGuPfSLp5A02NjMunucqLOFB9UzjzdPvQF+NJc6Ir1aPyoyVrREiyJFj?=
 =?us-ascii?Q?R+oZCeVlCYLaVcKeM8lcr2XHwBHptpsjQ2A7vOrQxFOTwuZsf2OP3/5hkL53?=
 =?us-ascii?Q?ZbNFA0xLzYu2/7alVvjOrR3WhPvbOeFiT98h5tMxRmiVqFzFs1L0ie3PKYc2?=
 =?us-ascii?Q?+GLa/70srMdUA8AcDOvQwerd5R+pD19Z9N4qJ0SpT48hDhIX11DBnCBhKuzO?=
 =?us-ascii?Q?MJRd19rhKBoRlTXTsZo9JKr/dLwC5a4xajBjYt7cZ2GPZ1410jEryKN3/xk7?=
 =?us-ascii?Q?tYmW2Y7xSUuzxMAq/9QZaM4vm18pMnAd0OT5Ptx5kJDygcLXptKEwD8SnGVL?=
 =?us-ascii?Q?BCdHU85mEmqMfIEOp48y55fDYBqdWUgD9sbcHh7zPtqYvhLe5uLY/k7Bb4eB?=
 =?us-ascii?Q?4t0884AsFqr4EE10gzM6qICx7RoDdTOnnnbnfV1HZuDs0BHWxKikkoxsxAIB?=
 =?us-ascii?Q?cXURkCSJKbOKtn7GSbxQ4OJe3asSlPpEdeob+Ik0uivPo8e7UWs5B1oDuHcs?=
 =?us-ascii?Q?fFijcmaCVZ0okDwGEIYXxj40BIKXBpMyC4GtXiMAJY+CUJmwDT4Tf2RTVVI3?=
 =?us-ascii?Q?zIwuKe2vCqixlN2ggxsSa4EY/ivjYSR4h4bB7yGibvYPw/LPBK1HP4+qeJli?=
 =?us-ascii?Q?xYUiYnm3PN1/aBQG7SbQBj0gQAuJfX4Ma9/hMpRE/8JTBcgdVcN3S2wX0Iz2?=
 =?us-ascii?Q?1bnHu4Ze2YFes8dgo7Wzx4vm73APep3LLs1kuPaDO6EPbi17gWiIqFuDaUh6?=
 =?us-ascii?Q?Z2c+zV4IO6ZsYmL/Qd3YAp/1EDzlpGBEn2G9+G145nwWmHxguv4G8Bx4esR3?=
 =?us-ascii?Q?miDuhwdxoqRMdADIehQeCrtyryVgPdO3IjjCuxJHtX23GtIgM1/x5xLkipv4?=
 =?us-ascii?Q?OwzttKH2foEweLmz4Xk38O3Os7z0vCEXSrEwKwkmOg5jtAFDLM4NE3TCtbHX?=
 =?us-ascii?Q?ZhAmN6YpW519P6kFOJvm1pc1rnEQqc/FWuVae9ikHQUzfzGj/wy4KuK7BNsj?=
 =?us-ascii?Q?P2eCJaJjVQwLzYAF1Aok2YzvnkM9oqd4db3zwmnWWwxafeArZ7SO0dx5X/mg?=
 =?us-ascii?Q?bOgEKpiW0d8Ji2FvMF/ifMEDsirZtVTlsMLYvYLXwyOVfCBHDaBPvLcHFKSp?=
 =?us-ascii?Q?FTuPQIb/PCk8Py8SMYjGizlX8/sa6NxsWAfDjDtC+M+v3kMaO1KAsgT+j8a9?=
 =?us-ascii?Q?FcUlCoWv6Z/aZkJprqVhFreF27BWI6lDozeKrK6dirGMAjm2CgtlNnHGk7BZ?=
 =?us-ascii?Q?QtCGonoj9GRJ/jA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DP9DFFewWbasw9WcUCURt6xxxHWL8MQDuRs8TqbdO568i95hcpGGQ5Q5to9d?=
 =?us-ascii?Q?V8Uk68tDmTbr6Z/OyZObJikqIgsOMFdZJkn+d7B3UTiAmheye3ijQoA5SR4w?=
 =?us-ascii?Q?IIE+7OwBh7L62BDnHNRLPbDftpBqIKf3wQKZJSuoBgAdhQ1qxJ33I6REWGtl?=
 =?us-ascii?Q?mHrbsObWboayXur3/H+veR7YQ3j9pE5sTW9MZ7jBusvAlBU4X7DEkG7JGloo?=
 =?us-ascii?Q?kFWG17gw3NgSRXYy4xFhhG9vrZ7RISHzdCaFA0zgseyN8ryKwG8P2gEs/Lkt?=
 =?us-ascii?Q?Yn4OS9mCl2Q+rkYi7KC67WmEMUNbIzTPVnVYG8J28TMfsap51bnOytlNvOpP?=
 =?us-ascii?Q?eVtJ6Nxot5gLl4i1AkxID6TEeTXc1Ky3CKKsQ7oCmGkhUX8azMqMQ60uT1jk?=
 =?us-ascii?Q?Oe347uBAZ6O8qzUYLYzjtcffUkuFjmFZeMnOS0vS8IkxQO/iknj/HfWExCsY?=
 =?us-ascii?Q?lPDzcsZ7O6wZPSeGxV9xmVYsJtYeHR81Z29jJyPsp1MCxud96ZhtRji2bpLs?=
 =?us-ascii?Q?oJEfWpvsDZO+6NPAwbw6Zvv2RAsiAZgyFPUTCh1Zqprzsraz/2egRQWtrAZW?=
 =?us-ascii?Q?fO32ryYG2Qy6n6kLyV8diww82jAwgO8RSvEXhPk/BB6287CZhYEqssf9G9cU?=
 =?us-ascii?Q?11v4U/30BuaiQqIG1cju+TclEDuPnX3namCvcolXOmc08urzlUncGD/cHuQb?=
 =?us-ascii?Q?VijYpQdmrurLpcbFv+g8TZgyVXSxa8Sc1HVink4nDMw0XKFPAipac7m4SO76?=
 =?us-ascii?Q?555B37jB7ANDB361AEmDK1GUC7vou9glG2+i1j7vFu+JOPTCDJc1Am9keOev?=
 =?us-ascii?Q?ITZQzgzf1vIkgnp99ejdMsd7DX82r/vkXrAfcFCuBhW+hRzFC3GojbFilzub?=
 =?us-ascii?Q?26qaaRw3koxnW00YelhcRULxpUlZdXtpdZHofiOBn+Zt5nrJgxO8fM4qzD4J?=
 =?us-ascii?Q?X6LHst477SQlAXx/JOVe/JZngl4Sbvw2t6YfywgQslNc9fHP6q3jWi26cgxF?=
 =?us-ascii?Q?pjstkFA406fWzLlHAuMkSKM6/2GUy5EqykGz+n4L3/lVblWWXlvIbIAPbO3e?=
 =?us-ascii?Q?BPa12s4wNzzhROOEnukgMRAzV8OOYXh2mgbalSZFECbChC13T++AMxtSWusV?=
 =?us-ascii?Q?lQ0M8rJ9yqfw4MfHHUCeBSL04ff8/0E+mB+rc1rs4dHb6LhFJMKorA/1O7C/?=
 =?us-ascii?Q?5rHnlyxdUQaqdY9daUD3x9e4L5dZ3VABqE/iscLeuX5xxrwkXjJeRqqfVXKo?=
 =?us-ascii?Q?LisoPD/ppDkiM/AQCwH2KOLZj8hF2JWdeBXr5kmvP/1OJJjRdHQ30mA6tmFD?=
 =?us-ascii?Q?vJrScAUuCEjzOt6DK4I9BX6nHJmXe0tGwtU9v4zEklX9HGjrYOiO/VEKc4VS?=
 =?us-ascii?Q?YTJ/rgoZvKbxyLo9J0nCRe1JUrDW4c06QPMPAgqC8OBJvkD59BF9gGcWP6/R?=
 =?us-ascii?Q?bDINw1D9T69Q0Xe0nOnBOAv68M9mEP+HWSX3O0RPuGETQ65JcMSHbRYCZspq?=
 =?us-ascii?Q?zgpMLzFZGsxByu3Z5cyY4OsGR1tF1YbuZ/eYH0KuvIkXN2rOfhjREpJCBYUD?=
 =?us-ascii?Q?tdiQ8ID11aBL2toyJz9PK6VpDIDHCKGHqTX9sPjChI6heSf2lmvKGlsg9LNW?=
 =?us-ascii?Q?8CzExSx4pjjtiMIwdXTPoxcSXssHTMDW553wRflNChce?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3c04a0-123e-4ad1-af84-08ddade3f0d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 21:14:26.5778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDhXZQR8wAhbp33reAp72jli4yHGpNto7J3Lk92yVWEhrS0sHNhj0vPWzXNy7XK0iaPXSl95YzMaqXSiAemtYATJsyO2jE6LVApdbQlvhs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Soham =
Purkait
Sent: Tuesday, June 17, 2025 10:16 AM
To: intel-xe@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.c=
om>; Nilawar, Badal <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poos=
a@intel.com>
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham <soham.purk=
ait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>; Tauro, Riana <r=
iana.tauro@intel.com>; Nikula, Jani <jani.nikula@intel.com>
Subject: [PATCH v4 2/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie lin=
k state residency offset
>=20
>    Add G-State residency and pcie link state residency
> offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
> respectively.
>=20
> v1 : Moved offset macros to drm/xe/regs/xe_pmt. (Riana)
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

See my comments for patch 1.  Once you have swapped the order of the
two patches in this patch series, you can add my reviewed-by:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/x=
e_pmt.h
> index b0efd9b48d1e..4e377b6eac92 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -21,4 +21,14 @@
>  #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>  #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
> =20
> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
> +
> +#define PCIE_LINK_L0_RESIDENCY_COUNTER		(0x570)
> +#define PCIE_LINK_L1_RESIDENCY_COUNTER		(0x578)
> +#define PCIE_LINK_L1_2_RESIDENCY_COUNTER	(0x580)
> +
>  #endif
> --=20
> 2.34.1
>=20
>=20
