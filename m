Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34976C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 03:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A4010E26B;
	Wed, 30 Apr 2025 03:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0f6Xce+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6BA10E26B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 03:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745984129; x=1777520129;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=hFfjHEwnD1A0i465dpxXFMO5xFCahwBWxhweCz7IUsY=;
 b=l0f6Xce+e6ahm2C7O9SzTivvKT8X0Pe0SdqEtQIAuQyfdt+zfcoXiKGV
 axcwh0thj9iocE+voBElV3qtf05MXyF0KTAU/iii79WPfMtYH2OVU7y7I
 L0si+HlGBYqq6jV2N3h774+8ikQTcU42I630tKvRex0pSa4ajxSb3DYbu
 wD1xIkvfN4xJZA6QCpNQZYhjwtmJ5XgwCrJgHzezKO1r38EBvNYWgM+p0
 Ug+UtVWBiVxGsfzXeikYx/LNFpKIaijo60/4HngbpgIh6UbG8m2Xiffta
 9ELLcQKaDD8L9s80adxYrMi4fnLQi/FNYI75D9qujS11PHvY2GLKbMFf2 A==;
X-CSE-ConnectionGUID: AHPnYQ5tSci/eQD4s/5prw==
X-CSE-MsgGUID: DoMcgGGgRpCn0NXztDxadQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="57828660"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
 d="png'150?scan'150,208,217,150";a="57828660"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 20:35:27 -0700
X-CSE-ConnectionGUID: Zep9jSHrRsWzzV2FyPEuHw==
X-CSE-MsgGUID: vcT1SX09TWWBt7qL6g/DCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
 d="png'150?scan'150,208,217,150";a="138978466"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 20:35:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 20:35:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 20:35:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 20:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tv1hEOccOc36mcoFWfpQNiqOnqMvb1UnUgp0V9Hrar8l/Vztxez1nLHeLYKoUWeasbKk1LL0NBc8iwWKo2JFajH4R7lgFfmBK36ey4Y5t8pu6I7PUWeYEYboYrGIlvHIlqKdCv1y6ME7DY3Bt1ALtUoIiRsUtCE7yhcXD4717dch0n9vId3g10SDUZgdg0Ed/CihHcBuxD5KIctveBYIMcSIFJuV3c1vOnPuVegmxC0ceMY87Crr50wuciXH1MPfeU0Ugy0PSEsBnpDd/Em9sYU7uQSq4IuxcTdk6OyNI4WzmsTtxA5CEtlm9DR7D6/y4nU5Oi3VXEy7ro3ge8LETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACPK9PUdmwNtV8HRkDfj4lX1rEBoeSqBcdh/1n6ibSo=;
 b=Co8kx/SXbRQV44tfGEmvnO5gI8/bkP3ZqCfToNsVNgjEoqg8xKxyphw7GtxVNgqNplhCN3/MD9Qcq4u8IIYzgWsBFKz2Fc28YLRfyUGikcpKkvlMvK22PVhqjwbIvJnLeZnlCsc5t9g4Iai6T+7HJLKdzJdiBByo4j8DAAUa7Ak5hfkxgmdjIAs4uEVTq+shtVZY+jPFR5tnBp10v5WkUzTevF62Fw8ddYdGttYrhUN3bHWgMDbbNkxjYgr7om5At6JxGQh2Po6CU1NxsdHaei7Z7m+ET+ZsncpXt1LO/Wiuuz6edBdLG3VuOmj/97JJczvbZE9t2oMRYfu+Gw8RpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 03:34:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 03:34:42 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH V2] drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
Thread-Topic: [PATCH V2] drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
Thread-Index: AQHbuBXBrEx9FelZ9UOz4pJ9df39wrO640mAgACs0lA=
Date: Wed, 30 Apr 2025 03:34:42 +0000
Message-ID: <SJ1PR11MB62040205AAE8BBC22A2DBAF881832@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250428082357.1730068-1-tejas.upadhyay@intel.com>
 <20250429171121.GJ6239@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250429171121.GJ6239@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7004:EE_
x-ms-office365-filtering-correlation-id: d4f660bb-c6c5-440d-4987-08dd8797f219
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|4053099003|4013099003|13003099007|8096899003|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?qamcGrRrduQ230eA1QfWbcHAVIe2hbg0pPCL9VQFKZYOlH7D9awqx56aS5el?=
 =?us-ascii?Q?h0JETW0q8N8h8Wf4WJFX4MGCRRUro68wEshKShTf2G2Jds0n5Qeu+GFLQ4KJ?=
 =?us-ascii?Q?dOxjZS81XRXMKphgxL+6rTpv5qFZMmJleo1hcmlULNMtAcZBtZ7jOd0xdQTb?=
 =?us-ascii?Q?HwfW0xilTw4yr3pAwessiJG6AIIJvUaiJL+oqq5bU9QSpwj63Z3CPILt5QJe?=
 =?us-ascii?Q?M7iENmGwZ4Hl80gQZyMteiyYqtpdCrsFfCSvJEcHIwN+6kDqiUcCZ5oEiJN4?=
 =?us-ascii?Q?GCwF2abO2vW68kgL125lQoBTKqPEKPn5VAKRYOgVDpWoecCC/3SapmnTS5DY?=
 =?us-ascii?Q?P294uKxyWKcIzBYfEWLYIwdrVSjRVKuJss88Z1EDxlg1vtJaaHa0UzpVjkvv?=
 =?us-ascii?Q?7r3A85GUelu+snixrP5fC8oioqZIIAHNmw8ZRKu+FxS+lCNAG1EOD1TEiLzr?=
 =?us-ascii?Q?/i8RgpAKmRBhsLPTpKxHOrNZRQtpT/AmmGj7u6EKru7Iluy3R9gJW9lHsdRA?=
 =?us-ascii?Q?U8FiysuTHPaZ6iAF6MCvfaJ8CYdfe0QkC9C3A8IO0b1tzZBOJ/u5mwtig6Xb?=
 =?us-ascii?Q?QxiWLsx6fVkyf5v0rY+5nfwdFKrtASqmPREomrLV7f3BxDPEEw6/epkz3k92?=
 =?us-ascii?Q?W13zg4VqbMycgU0SmEleJ7EVuncW8XbXCkAP9Mh1IQCAoSxUy1aUtI0Bm9w5?=
 =?us-ascii?Q?o0Fwo1RqSg0egararXQ6dTFp1uxsQuz9VNzH2arZQVWCaRSkStFdKj9R1X1j?=
 =?us-ascii?Q?YyvODod/85c0l65I5xbENLWTo52w34vOzh9JGStiuAN5nrebYcT+98fc2qgj?=
 =?us-ascii?Q?PkvU2pXvLgvcQI00DTiS6AtC4LEGAA4xdOU3UznlgJRicqmcT16M2XpVOxSL?=
 =?us-ascii?Q?5ua9a4nKz78rpwJhJHa9Nu5ddC59s3K98bGiHqL3csKz+iSJp+3FqVCxTGRW?=
 =?us-ascii?Q?gPRdOtfkCsSzR8hrXFdJAzPE3cA8cYeRAH1VoWVRu/j91uzLWnYSjHfjpkdw?=
 =?us-ascii?Q?+q6k4gyXy20nbuus5HAu+EHldqUvKFkP+rRfV1ozRuE6Fu/WuM29no0OzUoD?=
 =?us-ascii?Q?obF4/9I3XM9N6UazKEaILzqaTwH8xB+gl1IvtixEiz8SI8zOmFfij59eO5+W?=
 =?us-ascii?Q?P1T2ZfeNZL+EGLjpXhwPw2zDLw0tNNbLF85TXsvv4vSWr5jA/dnzHwH6lgD0?=
 =?us-ascii?Q?ATq/N++OyZFRWX30KsZDd7T98CeQWO2P+nNK22XA61bGYeowqwMsvt4dypRy?=
 =?us-ascii?Q?9/azVQk0yc1CnEk7fvFNV2+RZ0DLe2G9NaraYpzdFGoMRYSFiIpcFROjOEic?=
 =?us-ascii?Q?7o/EmH+GfSJwAgIyZz12ug9nseiXVPLPN1wWa7S8eVLss73ZkqUuLskEWPNC?=
 =?us-ascii?Q?2i37sg9pzi7AdxRJSMWFKr7LGFvLLdmCePadRFMk2HXNgEoOG/rhMLX2fauO?=
 =?us-ascii?Q?iwxBbqGsiRI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(4053099003)(4013099003)(13003099007)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RzPgOywVOn9G4vN66zs1rlkgYHvaRSKzqkRb+DbYPiYg97Vg73idqXYB8NQE?=
 =?us-ascii?Q?viOAHcCOMRGDY4Qs8xuVvX7UXP6XpRVZ7nonrWCDK+SGBVCLbJq2PEl+1JSs?=
 =?us-ascii?Q?cxxQ6bn/xF054KgNa3uv6or9cYDZuXWwA7k3Phiu4UTvtsFxkQVzzrU+b/CJ?=
 =?us-ascii?Q?oZRZfwLLuv8/VrnqVpiW6l2W4wDTOaOqYcQXenlpZqhni1mHS/bcJDBugRjx?=
 =?us-ascii?Q?/PtOkbtGJzH/rbPdv9L7RlBTGp5s5cBKczy5t4rah2nNRWgtszDUHwKFXEv3?=
 =?us-ascii?Q?9aWaj3ItXw9AJ6MvNZ5up7YsPHt9lnYuI+YCNtSjsXtS29+komuBEkv687y4?=
 =?us-ascii?Q?Cf/a8MI0LvHQhJ0XrleAQvRYYZUyiMi0kyzdVOTs7MWRuOKi+Mcica9sUtQC?=
 =?us-ascii?Q?BIgks8cu2LyElcgJOrz5qkDwGSofOd/OVdUczlFRTkn4GE3RNXgDgTtkRfGh?=
 =?us-ascii?Q?AjpC1B1miue+AZRWWTrTKcUklca4WEWPpRBt1hyA4PQBb+yfazJ9O5WZ9PZQ?=
 =?us-ascii?Q?mWGTkoOlyPCo6WtfAefr7hAnV8gI7LVNBJC/dcAlshWs0LcwkcrDBWEUJ+va?=
 =?us-ascii?Q?xaqRwaUx41zOHYDMrU5hS8s/ERiukRzhMsXt0f6DEcqz7S55D/58XpFOxXZS?=
 =?us-ascii?Q?6kcCbbXs7ORrNjBqRth5YB3AU3LmbifHgOAeZQXt2t2KBXJf4DyfeS1xlOcu?=
 =?us-ascii?Q?JUgs1PdmFH30Gj10CCz1ngIPyOrcADfLejTvIL4p3dXTMfbNGFRydGrAbl1b?=
 =?us-ascii?Q?4/ryw0v0ynSkbNvDh9b/5Buz3MG8mkUhFMRg3mTZ3qY+m6ADnOnX8I2b0f6L?=
 =?us-ascii?Q?CxY6iUTggg+PG8C0rMYgoDMN+ySjX8SsaAh7YkqVwd0dNX5jUO0B6Y2U8Mxa?=
 =?us-ascii?Q?GzCdlqY+yPtAxIp+vCk9SQVxmJusaHZfBwcaB3pudY5o7qRHsM4RF00eUHaj?=
 =?us-ascii?Q?+s52m2s+oN0hdfyClPAy9wF+Fvgce0q+j9FfhO8buZHHC6EXwYkXmtzqsF63?=
 =?us-ascii?Q?DmTcdzA7AcgNS6dpCiVIFALx2nJ/CHsdqC6js9v+Im+7e5El6K/h+rLZ+gYR?=
 =?us-ascii?Q?l8oq6W6W2c8bD4a5a2vq6IbNiqaoI1tobt8CObCJE7N9hEn5La72NSzDFGjf?=
 =?us-ascii?Q?SCIbSDSA0n57oac+006FfUjUFAhyjOP3KKDmFPthnHyo/HP15/iYYqnLJzpv?=
 =?us-ascii?Q?td0w+tn8j4YHS+HFWAx9+f3nj3ocrLUxMUCQzN3G4+GyWfbNHmQCpVDP5TDf?=
 =?us-ascii?Q?V4svU8Ay2oOAQsiq24pVlpOz8y8skXXliUDVDupJQJuqmYwpPjoOPY7wPEu0?=
 =?us-ascii?Q?Vid72IlpvXELWKoGrUKr1VRK6dk0sdWU9tKm2HJOvkLM0Fy9sYh2PH1RFEzO?=
 =?us-ascii?Q?aJDuNZ6EdzIDiztB2tiQKweBRdywlHC/XDAsHnPZQ1zuxl8dQqa/6q6/BHUZ?=
 =?us-ascii?Q?Y+OoO5z6cf7AzONwC1CRIa9nQuf949CQCAmSgsRsVovLWGmrjlF6SJdxCO3x?=
 =?us-ascii?Q?ZlHPdm12L0VXkLiBVxGCy2hR/SR9yJwQQXvCz/3v4cqaLHTnXg6jfblLVD3M?=
 =?us-ascii?Q?TyuaNB3aYFA7maAqRhMFsEgChAUpV5cm7JZUh98cwmDvP0zoJPkZtXcmsYOt?=
 =?us-ascii?Q?ikOIEMWCj7FMYTGHs60c3HBS5go9vYyI8hPrNXpfZfkd?=
Content-Type: multipart/related;
 boundary="_004_SJ1PR11MB62040205AAE8BBC22A2DBAF881832SJ1PR11MB6204namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f660bb-c6c5-440d-4987-08dd8797f219
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 03:34:42.7447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XP8I3BgRkt7p0G0zFix6Y/YhQtGUqZju2Hdpq7/v+VMTascqQznXjnpa/ABoO8gKnSGNRq0jIXpHSaZHHxg5xvcoC1vvR9OoQdAWPr44s9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
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

--_004_SJ1PR11MB62040205AAE8BBC22A2DBAF881832SJ1PR11MB6204namp_
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB62040205AAE8BBC22A2DBAF881832SJ1PR11MB6204namp_"

--_000_SJ1PR11MB62040205AAE8BBC22A2DBAF881832SJ1PR11MB6204namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable





> -----Original Message-----

> From: Roper, Matthew D <matthew.d.roper@intel.com>

> Sent: 29 April 2025 22:41

> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>

> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad

> <himal.prasad.ghimiray@intel.com>

> Subject: Re: [PATCH V2] drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for

> LNCF regs

>

> On Mon, Apr 28, 2025 at 01:53:57PM +0530, Tejas Upadhyay wrote:

> > LNCF registers report wrong values when XE_FORCEWAKE_GT only is held.

> > Holding XE_FORCEWAKE_ALL ensures correct operations on LNCF regs.

> >

> > V2(Himal):

> >  - Use xe_force_wake_ref_has_domain

> >

> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1999

>

> LNCF registers are part of the RENDER forcewake domain on Xe_LP platforms=
,

> so using ALL is a brute force way to fix the problem on those.  However t=
he

> LNCF registers are documented as being part of the GT domain from Xe_HPG

> onward, so the existing code should have already been working correctly f=
or

> those platforms.  However the original bug report was for both ADL-P (Xe_=
LP)

> and DG2 (Xe_HPG) so it doesn't seem like forcewake should have been the

> cause of the DG2 errors.

>

> Have you confirmed that the issue has vanished on DG2 (not just ADL)?



Pre-merge results confirmed that,

[cid:image001.png@01DBB9AE.C309F7A0]



https://patchwork.freedesktop.org/series/147446/#rev1



There are other instances in xe driver where we use FORCEWAKE_ALL for LNCF,=
 for example see below,

void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)

{

        struct xe_device *xe =3D gt_to_xe(gt);

        struct xe_mocs_info table;

        unsigned int fw_ref, flags;



        flags =3D get_mocs_settings(xe, &table);



        xe_pm_runtime_get_noresume(xe);

        fw_ref =3D xe_force_wake_get(gt_to_fw(gt),

                                   flags & HAS_LNCF_MOCS ?

                                   XE_FORCEWAKE_ALL : XE_FW_GT);



Tejas



> If so, you should feed your findings back to the hardware team in case th=
e

> documentation for this register range is incorrect.  There are a number o=
f

> other LNCF and LBCF registers that the driver accesses so we should make

> sure we figure out what's actually happening here.  Also,

> i915 (the official driver for DG2) is still using GT forcewake for the LN=
CF

> registers on DG2 and isn't seeing problems like this, which makes it

> questionable as to whether this is truly the root cause.

>

>

> Matt

>

> > Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")

> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com<mailto:tejas.up=
adhyay@intel.com>>

> > ---

> >  drivers/gpu/drm/xe/tests/xe_mocs.c | 7 +++++--

> >  1 file changed, 5 insertions(+), 2 deletions(-)

> >

> > diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c

> > b/drivers/gpu/drm/xe/tests/xe_mocs.c

> > index ef1e5256c56a..0e502feaca81 100644

> > --- a/drivers/gpu/drm/xe/tests/xe_mocs.c

> > +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c

> > @@ -46,8 +46,11 @@ static void read_l3cc_table(struct xe_gt *gt,

> >         unsigned int fw_ref, i;

> >         u32 reg_val;

> >

> > -       fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);

> > -       KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");

> > +      fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);

> > +      if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {

> > +                    xe_force_wake_put(gt_to_fw(gt), fw_ref);

> > +                    KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Faile=
d.\n");

> > +      }

> >

> >         for (i =3D 0; i < info->num_mocs_regs; i++) {

> >                       if (!(i & 1)) {

> > --

> > 2.34.1

> >

>

> --

> Matt Roper

> Graphics Software Engineer

> Linux GPU Platform Enablement

> Intel Corporation

--_000_SJ1PR11MB62040205AAE8BBC22A2DBAF881832SJ1PR11MB6204namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 129.75pt 72.0pt 129.7pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; <span lang=3D"EN-US" style=3D"mso-fareast-la=
nguage:EN-IN">-----Original Message-----</span></p>
<p class=3D"MsoPlainText">&gt; <span lang=3D"EN-US" style=3D"mso-fareast-la=
nguage:EN-IN">From: Roper, Matthew D &lt;matthew.d.roper@intel.com&gt;</spa=
n></p>
<p class=3D"MsoPlainText">&gt; <span lang=3D"EN-US" style=3D"mso-fareast-la=
nguage:EN-IN">Sent: 29 April 2025 22:41</span></p>
<p class=3D"MsoPlainText">&gt; <span lang=3D"EN-US" style=3D"mso-fareast-la=
nguage:EN-IN">To: Upadhyay, Tejas &lt;tejas.upadhyay@intel.com&gt;</span></=
p>
<p class=3D"MsoPlainText">&gt; <span lang=3D"EN-US" style=3D"mso-fareast-la=
nguage:EN-IN">Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad</s=
pan></p>
<p class=3D"MsoPlainText">&gt; <span lang=3D"EN-US" style=3D"mso-fareast-la=
nguage:EN-IN">&lt;himal.prasad.ghimiray@intel.com&gt;</span></p>
<p class=3D"MsoPlainText">&gt; <span lang=3D"EN-US" style=3D"mso-fareast-la=
nguage:EN-IN">Subject: Re: [PATCH V2] drm/xe/tests/mocs: Hold XE_FORCEWAKE_=
ALL for</span></p>
<p class=3D"MsoPlainText">&gt; <span lang=3D"EN-US" style=3D"mso-fareast-la=
nguage:EN-IN">LNCF regs</span></p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; On Mon, Apr 28, 2025 at 01:53:57PM +0530, Te=
jas Upadhyay wrote:</p>
<p class=3D"MsoPlainText">&gt; &gt; LNCF registers report wrong values when=
 XE_FORCEWAKE_GT only is held.</p>
<p class=3D"MsoPlainText">&gt; &gt; Holding XE_FORCEWAKE_ALL ensures correc=
t operations on LNCF regs.</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; &gt; V2(Himal):</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; - Use xe_force_wake_ref_has_domai=
n</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; &gt; Closes: <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/-/issues/1999">
<span style=3D"color:windowtext;text-decoration:none">https://gitlab.freede=
sktop.org/drm/xe/kernel/-/issues/1999</span></a></p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; LNCF registers are part of the RENDER forcew=
ake domain on Xe_LP platforms,</p>
<p class=3D"MsoPlainText">&gt; so using ALL is a brute force way to fix the=
 problem on those.&nbsp; However the</p>
<p class=3D"MsoPlainText">&gt; LNCF registers are documented as being part =
of the GT domain from Xe_HPG</p>
<p class=3D"MsoPlainText">&gt; onward, so the existing code should have alr=
eady been working correctly for</p>
<p class=3D"MsoPlainText">&gt; those platforms.&nbsp; However the original =
bug report was for both ADL-P (Xe_LP)</p>
<p class=3D"MsoPlainText">&gt; and DG2 (Xe_HPG) so it doesn't seem like for=
cewake should have been the</p>
<p class=3D"MsoPlainText">&gt; cause of the DG2 errors.</p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; Have you confirmed that the issue has vanish=
ed on DG2 (not just ADL)?</p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Pre-merge results con=
firmed that,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><img border=3D"0" wid=
th=3D"967" height=3D"106" style=3D"width:10.0763in;height:1.1041in" id=3D"P=
icture_x0020_1" src=3D"cid:image001.png@01DBB9AE.C309F7A0"></span><span sty=
le=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://patchwork.freedesktop.org/seri=
es/147446/#rev1">https://patchwork.freedesktop.org/series/147446/#rev1</a><=
o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">There are other instances in xe driver where we u=
se FORCEWAKE_ALL for LNCF, for example see below,<o:p></o:p></p>
<p class=3D"MsoPlainText">void xe_mocs_dump(struct xe_gt *gt, struct drm_pr=
inter *p)<o:p></o:p></p>
<p class=3D"MsoPlainText">{<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct=
 xe_device *xe =3D gt_to_xe(gt);<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct=
 xe_mocs_info table;<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsign=
ed int fw_ref, flags;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags =
=3D get_mocs_settings(xe, &amp;table);<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pm_=
runtime_get_noresume(xe);<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fw_ref=
 =3D xe_force_wake_get(gt_to_fw(gt),<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; flags &amp; HAS_LNCF_MOCS ?<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; XE_FORCEWAKE_ALL : XE_FW_GT);<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Tejas<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; If so, you should feed your findings back to=
 the hardware team in case the</p>
<p class=3D"MsoPlainText">&gt; documentation for this register range is inc=
orrect.&nbsp; There are a number of</p>
<p class=3D"MsoPlainText">&gt; other LNCF and LBCF registers that the drive=
r accesses so we should make</p>
<p class=3D"MsoPlainText">&gt; sure we figure out what's actually happening=
 here.&nbsp; Also,</p>
<p class=3D"MsoPlainText">&gt; i915 (the official driver for DG2) is still =
using GT forcewake for the LNCF</p>
<p class=3D"MsoPlainText">&gt; registers on DG2 and isn't seeing problems l=
ike this, which makes it</p>
<p class=3D"MsoPlainText">&gt; questionable as to whether this is truly the=
 root cause.</p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; Matt</p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; &gt; Fixes: a6a4ea6d7d37 (&quot;drm/xe: Add =
mocs kunit&quot;)</p>
<p class=3D"MsoPlainText">&gt; &gt; Signed-off-by: Tejas Upadhyay &lt;<a hr=
ef=3D"mailto:tejas.upadhyay@intel.com"><span style=3D"color:windowtext;text=
-decoration:none">tejas.upadhyay@intel.com</span></a>&gt;</p>
<p class=3D"MsoPlainText">&gt; &gt; ---</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; drivers/gpu/drm/xe/tests/xe_mocs.=
c | 7 +++++--</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; 1 file changed, 5 insertions(+), =
2 deletions(-)</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; &gt; diff --git a/drivers/gpu/drm/xe/tests/x=
e_mocs.c</p>
<p class=3D"MsoPlainText">&gt; &gt; b/drivers/gpu/drm/xe/tests/xe_mocs.c</p=
>
<p class=3D"MsoPlainText">&gt; &gt; index ef1e5256c56a..0e502feaca81 100644=
</p>
<p class=3D"MsoPlainText">&gt; &gt; --- a/drivers/gpu/drm/xe/tests/xe_mocs.=
c</p>
<p class=3D"MsoPlainText">&gt; &gt; +++ b/drivers/gpu/drm/xe/tests/xe_mocs.=
c</p>
<p class=3D"MsoPlainText">&gt; &gt; @@ -46,8 +46,11 @@ static void read_l3c=
c_table(struct xe_gt *gt,</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; unsigned int fw_ref, i;</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; u32 reg_val;</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
w_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);</p>
<p class=3D"MsoPlainText">&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; K=
UNIT_ASSERT_NE_MSG(test, fw_ref, 0, &quot;Forcewake Failed.\n&quot;);</p>
<p class=3D"MsoPlainText">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fw_ref =
=3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);</p>
<p class=3D"MsoPlainText">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xe=
_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {</p>
<p class=3D"MsoPlainText">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; xe_force_wake_put(gt_to_fw(gt), fw_ref);</p>
<p class=3D"MsoPlainText">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; KUNIT_ASSERT_TRUE_MSG(test, true, &quot;Forcewake Failed.\n&quot;);</p>
<p class=3D"MsoPlainText">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (i =3D 0; i &lt; info-&gt;num_mocs_regs; i++) {</p>
<p class=3D"MsoPlainText">&gt; &gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if (!(i &amp; 1)) {</p>
<p class=3D"MsoPlainText">&gt; &gt; --</p>
<p class=3D"MsoPlainText">&gt; &gt; 2.34.1</p>
<p class=3D"MsoPlainText">&gt; &gt;</p>
<p class=3D"MsoPlainText">&gt; </p>
<p class=3D"MsoPlainText">&gt; --</p>
<p class=3D"MsoPlainText">&gt; Matt Roper</p>
<p class=3D"MsoPlainText">&gt; Graphics Software Engineer</p>
<p class=3D"MsoPlainText">&gt; Linux GPU Platform Enablement</p>
<p class=3D"MsoPlainText">&gt; Intel Corporation</p>
</div>
</body>
</html>

--_000_SJ1PR11MB62040205AAE8BBC22A2DBAF881832SJ1PR11MB6204namp_--

--_004_SJ1PR11MB62040205AAE8BBC22A2DBAF881832SJ1PR11MB6204namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=27630;
	creation-date="Wed, 30 Apr 2025 03:34:40 GMT";
	modification-date="Wed, 30 Apr 2025 03:34:41 GMT"
Content-ID: <image001.png@01DBB9AE.C309F7A0>
Content-Transfer-Encoding: base64

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
LhJfbLAumDPXuiB7v7VNctqfPkvwO+upVdaPz0uOnIsfW1fN5deWWHc3S27sro9f425PWVf9zeXZ
F/daUx5j1x7LtO6XnKx/WyU++7EU614X723s2lx+7dlt1vprkiPHsM0ax5/DrsW93yg5dk3dpgWS
/3rJReJanXXDM/xZcdZt9kc1Wrf9lLu5xuEik8VTYnhnreqIw9csPNwt3e7iIDMWrybJkXNxv3XV
U/zaAusGveTWa5qtRW9/ao1c3fXxu4OSd4EL1g/f4e411m0OIjj5QY3g94UP/iW5OPKV9XfCs45Y
qyUXTsNe8Z5le+2J3mvq3hbTI7NKcnDkdJ11GX/v23XWBsnJ7saO5L1nJUfONWvDh2J4frrztOTG
kcLu+Azm92SJFN+iBuslyVXgktGaL8i0xlpkf4xNzs7x7xFHj1p/KoU3cu0Ra22r5N4Jm4y7P5zT
k3PWum09u7bVIP3POPdPq4b51VRekBw84U4+Iv8qPyi8z236thqsv/ktD0+HnGr/1xY+x0IqUX/M
+gJ/j12G7L38/t+y/9sFByds+TGy4CvJpYPmPy0R8kxKma1mGjjaDPut29LjrHOlesWxLLvHljcc
80sHbZfOWqv/dNAazePy28+tf7Fntr6UQ5Y9jxy1LhPkLh7Ra2usmoKj1qIDRuu/rriRu0Rf7+se
qY786TZ21jsusnr9KS7jZzZY67oLgq1uda1HWTtTny+2YbNe3M1SwwarX7mbS7h614ZdtO79FXeb
a11S7NJeNLE2jNffc1n9byvTtjDyOv0Lya1b3IdTaH+5+zNrrP9wag8vWg+/LcbX3uY1Su/91V52
1QGhTZtjnbuAtbP2ouJBLtnuw32xLMU6Z+5T1iWFLvF3xR53Fq63DzuFo/59KX1e+9iuS1j1Uvxc
23SGrU2IK+x9/PodD4IgvhN08d2f+C7Ce4kLCgrAjGEkJycLBz/nbn3qQZZG2jU2NDv35ExbhtLq
SpSuCu701Tvs1QyEOY6clIfh6Sf4yUWYbfMrcRi6Y3LIHnwWy0I6eksE5P7wn8x+29vE/x0JCUOY
i/eaCv41X4mk1ASoHEejTkpARmL3PQ4dGHH4WBvksggsi3fZDsZLjem2ZX5tX+QbtNjLF4oJfQUZ
TnGQIzj1NYT1YmSs/wuvIcJxWKE8GBkpYezEiOKSzj3ovaWr1aqdVqo2NeFvvFPU2xtBDiLwnXMn
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

--_004_SJ1PR11MB62040205AAE8BBC22A2DBAF881832SJ1PR11MB6204namp_--
