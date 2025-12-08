Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CB0D3ABEF
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 05:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0207010E034;
	Mon,  8 Dec 2025 05:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTNnmPNd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DCA10E034
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 05:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765173367; x=1796709367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C/I74ScuM1DuXZznGhtXCuKTb8X+OpxwyBEp5yoXEVI=;
 b=HTNnmPNdjKtQe/rOUZDwUGNxMLtIP3DjOEH1aAY6DEfQg8pNcCh4z/zi
 Hun49CJ7wC/ZiWrOT2A8jsGzO6mnnUR9kofmPhE08bVC5MNZDeH03SUzr
 TWmFMhNMcbIbE5QnBJpuPdvXqpu7QZlU4hGmG0ggP3W7v8Y8t0nwzgGkC
 02S09n5bk5HTsiOnqF/rno+Ps0cKNBEpZj4Uq/8Wanm+HLy33lXl0a3d3
 BV1UhpZGc5DxD6hijc0xBaUFV/8m6nGBEy//ucaBq8qFblkjrVyPlFNz3
 MiL/YdN3xkVBVlj4RTNAHF+O4v3n+JDpaEO0Wb4uYkVfggYZVX9LNSgIh A==;
X-CSE-ConnectionGUID: vWi3oVHlR0ulS5Q5qRo5Tw==
X-CSE-MsgGUID: JKBlP1FPR52AHFs4PWXgCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="70967499"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="70967499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 21:56:07 -0800
X-CSE-ConnectionGUID: kHPVb8yFQQCZMyQ2y9+dtw==
X-CSE-MsgGUID: qFRCdxOQQyOokuBEMZMyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195751311"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 21:56:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 21:56:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 21:56:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 21:56:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELOuh4nZGK4MtJEUG8M+xRKXHWjSYZmWAqclyHbhgUYLb3WgjT+reYeNoxWqMez0KeSbcBO9gYcyeOrd75CbMyOARHLFeNt4osRefhtPyrPv6ynkBeNMcmfNKaAzrPSG041HbzLs1xD84cT6OkdcYXZpV7DWKBev8KicDf8hXzKEI5BCoMGWveuf8RFhxhVs+ygF2SI9NSon+bOVPxPtnYejurcBTzyFFaIQ8dsmYgRbTEb0Kf5EpYmjJKEs7tJ3ZwoA0FxSfhxt/BKkeF098nlPARNG49UtHGVYAroi5EhXzdqBbFhA7e+yDYJUvodx32EdyHaScpGe5A8DljQmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/xW569ui5F9DUpA2jCGNeo3FZgmWZcUb371i+sFUCY=;
 b=Zkn8xUIXM8iWH9yS4maeOJ6hFUWx3qupbc16LiaO4SuMpJXGmSDgycNuGqGOTZ/NYTKu4b5We5zpLfy8RK59rKq8t8LoLFkJ/SJndCS96nhiiAkRMdiP5y4SA0eoH41a6Vgnk7ueVWf3wMpAgDTHqeU69ww3Q6Yvsv3SKglbv9f0dnkol8gbVI4RoSSbcYPUiHHFMLcu55cXmHmuuJ7u+9DxtP2jQuk2B7l3caTSPcjw9Yzucs2u9a30Cx9vTGfh0Z9VS/nYY9kb8+lgURJ+5dqb1kDYYzgCBqIVTK45FbmhigNdrAG/eqyzCmHIniuCeYOb/LMHwVZSG8iMx/PPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA3PR11MB9183.namprd11.prod.outlook.com (2603:10b6:208:57e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 05:56:03 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::642:db31:123:8343]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::642:db31:123:8343%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 05:56:03 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Tauro,
 Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH] drm/xe/pcode: Add support to get pcode version
Thread-Topic: [PATCH] drm/xe/pcode: Add support to get pcode version
Thread-Index: AQHcaAOwBubhukCHeESefMRkdCcfPLUXPhQg
Date: Mon, 8 Dec 2025 05:56:03 +0000
Message-ID: <CY5PR11MB621169F2C83F559E20BC127895A2A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20251208052941.3635041-1-karthik.poosa@intel.com>
In-Reply-To: <20251208052941.3635041-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA3PR11MB9183:EE_
x-ms-office365-filtering-correlation-id: f1165237-0715-4218-0871-08de361e7884
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dRnMZksx5M9+VVHkRbFKdauneo3+mHBb5nvgOt91LphyjNUJ4829m3HPBgh9?=
 =?us-ascii?Q?2j2q1zfxKLShLMNJvKjEMd4Iz4Qxdiox7OEkOeSRRDENLmHbAVBibKFagHXv?=
 =?us-ascii?Q?qOtCkGb2eP1mx9Ane1rrmZk+dfk2u13sfa1eN3btL1LKI6qPqIAXsqEbhch4?=
 =?us-ascii?Q?xvVTXXLNMGHCwQdkTghuzuSsxbOjW//RnNjqdDm9JTj5nlLO2gE1ANbtdM9m?=
 =?us-ascii?Q?ctaTHbrcs9lY3gwxhpXcDDpi4u15DfBIkCU1CLQc3SYv94YQ4jCs8ksGQlBe?=
 =?us-ascii?Q?d1JFiyIhyaLe7urzYeUEwDOaLuD+3djL02n4Q9KYebrr1NzFEzbTGcQ8XRJV?=
 =?us-ascii?Q?+/vP7s3BbhRyHoaQTOqBJfC/m2BhAZmr527A3JSa5kCiTuCiDhbhwSNrBlbZ?=
 =?us-ascii?Q?/jg32ez+BuD9IjISW1mUDmzovDrnMUzLUZoJxTkT2FY7zCViu8sJCq0CxmsV?=
 =?us-ascii?Q?exJBFW7cM1NR/sZn6ImTLh/TdPC6/d+C9X6V2RTmwqfz3y8wFIbddCE3Cdxs?=
 =?us-ascii?Q?bOR2hPC7X3qe82yODcfFs0VgT6LRLIMpNOvuF6GV64P4ZEb3qsKHADdgkORv?=
 =?us-ascii?Q?5llt3dJYoADieKuS5VErlMauIerb8U3KvK3pQYS1ysW41WCQ1mUqk8wzuwlV?=
 =?us-ascii?Q?AmBFzZ6gJnl1opgzvU8/ZvyTqaLgX7QvYtBgSWOqqDPWnVYQ8pGBUlR1H9KU?=
 =?us-ascii?Q?QRd3to7kuXIPDt8VLFlj6VTEQVc5UssyeqPD/0+jVvPmaB+ROab0Knuz2zq0?=
 =?us-ascii?Q?oILk5y2lbNfO9A2Qd5b2C7cRY6CzmSSS6giAulw3P/Ty6Lf7xhJlVOF6ZHAq?=
 =?us-ascii?Q?OpcNqlY8hN/Al8Oo/1KYhyDql41myEnZ/TxkAjmhxZKs3kuQkWTUkwBw/EEe?=
 =?us-ascii?Q?w+vrTZje6cIb5re1bNsnWeNvYjhRAPv6B93p5HUKhUNwxKzvLxW9h+/yCTCo?=
 =?us-ascii?Q?3EtI7zHNSuT0jEdP/vRBs45zTePJkNCHkqFg+nRBD1wxQ0VaMNh3Es1Z9p/O?=
 =?us-ascii?Q?wsSgPqZgPjH66hlCtWf2hCz4b87VAYehGSiYS4tJ/bwnWb9yszEL/Hh97RVO?=
 =?us-ascii?Q?28qO9hH8/hebL6ra4xa6mh0b8dZsY9A8HINJzf9hyMi/I0bLGt9uc4MXmfy8?=
 =?us-ascii?Q?tmP46bDeklS2f2cvJOnHYr1028+Q+Qrw7E/AuxAMEpfAp24LsiNDhQ+Fc0LP?=
 =?us-ascii?Q?9yd6BOEfC+/63Q1pmVrkD8bKut0fuiBCKohXk8lypyY7l6gKgWyMs2SiPEnD?=
 =?us-ascii?Q?Shk4LbYc+gAB4y4eruWKZrh6iCl1+EDxbq0oHQqfMpujJaVna8vPbZ8mi30g?=
 =?us-ascii?Q?GARBn7m70gfjby0jmVCwt50IlIyBGVw/2w0vc0V5IeBlZgPHfpzxzLk6fOVu?=
 =?us-ascii?Q?YkP+XVrVWuDaStKoIZf+xzWLSySOI9vSUxhopeOXGjlht1hOUEYaV8RJmRgC?=
 =?us-ascii?Q?gabT7yXj+jF2RSbdnXzphGtndRMwDEuhTy0NBninpvi/5IaoDoUOZVhMO3h2?=
 =?us-ascii?Q?i/2z5fZY4IksJU4ssPL3ywPgODVDAiwISqFd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HUia7Q14RYlq1V6W2MhgFhqAc0GR7ksgYKQLXo/U17zJ8uoRcsLdWbfpYnqZ?=
 =?us-ascii?Q?E6oXxlIwsMFavNrNWPjcWM23+lyEip/desZH4oQdOYhGTiYKHOrZHO7teaUG?=
 =?us-ascii?Q?oXYr2XewVvbwh4Z4IiEPEeBy1h0H1rdpysjXphx+27ZwrAxFMbvplNJkuRBZ?=
 =?us-ascii?Q?BAh83LlXndtgrrRg2XfcYUvaq+y4ElhAzkvqQcUwVD+2IjE/Kv2rMhXT4Bon?=
 =?us-ascii?Q?/VeJ/G7XUyAy3FG9rWcK25KzAnFDakUbqLp2hmsEtr8HZoZV1NCGKWlJnD19?=
 =?us-ascii?Q?QocaHHsnaHMCiZE7MEv0a/hf6pZ6GGcnu7yPMnJZCuuVb9pWiIVL5eJZhmXR?=
 =?us-ascii?Q?xPuztXAJZuU1jneECMv/e63AlSma4JQ1+7oIG0uhvo9ZGIhYf1Wq877R+i2M?=
 =?us-ascii?Q?9G2NJ/oNjJM6H6hsikjKPgs/a66P8j4IoHD7E6N6f7dTWPvsGpjNwuTCx9vN?=
 =?us-ascii?Q?OFAzQ4ZwIGp2VRpg3Ol7FJ5NVBjTrIUhCLTZIPix7t0VHatIFl+mH0zrZCEM?=
 =?us-ascii?Q?3k20KTK4bE+QWLhYAa1vocic9s2ZNBisFfVMXe+5yn+RLhOekad38+6VE7l6?=
 =?us-ascii?Q?XZHlwhUf2Wz8IMn49wInwBmvGYncWtCSIhKSQ9NwnAszutjZ1yIDmBBkNMiR?=
 =?us-ascii?Q?dWfAYCa0zbA5+WxpZ0jGfXZ1SO3+KghRyLASDExU/42bENqTrktN5UgVavMa?=
 =?us-ascii?Q?4QfPQy8sbfixH6ONxt366/Davm9Mld8IyCYCkwQ66DkhvpEtxthU5wSRJz4/?=
 =?us-ascii?Q?5almgB9Y/CYPLVOENn36qUHRE7JTewzDMmOCKoGHRWKB2PfsVHEvwBNnqwQy?=
 =?us-ascii?Q?iqyNGsZVWV/+ylrJMgbqVUMY5gOSJqM88V0nKrnJp9H47IjGJX+LTEvpHxmJ?=
 =?us-ascii?Q?mtXabTWkbOzbdIiXwpljwlFUzJRnX4qILmY9NqYRFB1wtrP1XrdJc1rNONr9?=
 =?us-ascii?Q?j8oR34uVF5LM+hd06/1wpkjizv6SVvysVYjUKlHWsBgOkkKnomjlbQ1zKK+g?=
 =?us-ascii?Q?1BV1xIc3l5DTikbbkoUVZFbjSxTHc+n3wY18zHho8ij9aZZcnKKRWYUc56BN?=
 =?us-ascii?Q?4KEwP0D1VP9NLZMpDBuu4xkcqrjvSeK5idb/ayfBzUSHpvpxBMvkp+dbwGPK?=
 =?us-ascii?Q?Cw+EMg0X2wKh1veHwDqHQxEpmtGclWUq5nRDI+rmWEasn+fBeMv5z/RjnmjZ?=
 =?us-ascii?Q?OWOMsGraLFjoWF40JwZJBwH/CTQ2xU6nHheiO1pUamS/4qFkveb+H2rfoP/Z?=
 =?us-ascii?Q?TyMGpzB0XPmjuuHfr+uKB+C2xkdmZcZuj2NArSYks1IKsWIy15t1+xy3FcPQ?=
 =?us-ascii?Q?Ns2sYQ4lHTsRJbSXoveXDif+w/hsT2T/gQ3LaqhElKhPyO7ZmSLFhRmACoFQ?=
 =?us-ascii?Q?5XHy0bevlDT2sb/igXNLz0D/HFrueeoKSrws/PQ0ATFUDzaPeeS+J22o7lT/?=
 =?us-ascii?Q?y1lCyuCcGG8TfAtBUG9mIcAhuCB49qX/1S3kh/kVlv0a4Qp8wlW3urC0Japu?=
 =?us-ascii?Q?RY4gLC8lbKajQpbYb1UtDuYOX0/CR9qpF51UYK9I4zqlEPvCR5Y2t7UNplJR?=
 =?us-ascii?Q?6v9kJ4QIMdO6VME5VNEOt6DY+0X4lLGNYhC761I9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1165237-0715-4218-0871-08de361e7884
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 05:56:03.1461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pJic1MVuT4lmb6mz6LKrbw5JBO+/iEXMGQiHKdnEbvJ3vt+/MrG4yjXtAvnIY7gXReqrwQa/RYeewhrvxroqqqWOIEDZmdb7/IoDGlcQl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9183
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Monday, December 8, 2025 11:00 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Jadav,=
 Raag
> <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa, Kart=
hik
> <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe/pcode: Add support to get pcode version
>=20
> Add api get_pcode_version() to read pcode version from PMT telemetry.
Please add the usages of this API.
Please add a debugfs to start with it.

Thanks,
Anshuman.
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
>  drivers/gpu/drm/xe/xe_pcode.c    | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
>  3 files changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h
> b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index 0f79c0714454..8cbf51834457 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -15,6 +15,8 @@
>  #define	ENERGY_PKG			REG_GENMASK64(31, 0)
>  #define	ENERGY_CARD			REG_GENMASK64(63, 32)
>=20
> +#define PUNIT_VERSION_OFFSET		(0xA0)
> +
>  #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>  #define BMG_TELEMETRY_OFFSET		(SOC_BASE +
> BMG_TELEMETRY_BASE_OFFSET)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.=
c
> index 0d33c14ea0cf..85d54147c636 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -15,6 +15,8 @@
>  #include "xe_device.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
> +#include "xe_vsec.h"
> +#include "regs/xe_pmt.h"
>=20
>  /**
>   * DOC: PCODE
> @@ -377,4 +379,19 @@ int intel_pcode_request(struct drm_device *drm, u32
> mbox, u32 request,
>  	return xe_pcode_request(tile, mbox, request, reply_mask, reply,
> timeout_base_ms);  }
>=20
> +int get_pcode_version(struct xe_device *xe, struct pcode_version
> +*version) {
> +	int ret =3D 0;
> +
> +	ret =3D xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(xe_root_tile_mmio(xe),
> PUNIT_TELEMETRY_GUID),
> +				(u64 *)version, PUNIT_VERSION_OFFSET,
> 	sizeof(u64));
> +	if (ret !=3D sizeof(u64)) {
> +		drm_warn(&xe->drm, "couldn't get pcode version from pmt,
> ret %d\n", ret);
> +		return ret;
> +	}
> +	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n",
> version->major,
> +		version->minor, version->engg);
> +	return 0;
> +}
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.=
h
> index a5584c1c75f9..87a4f490508e 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -12,6 +12,12 @@ struct drm_device;
>  struct xe_device;
>  struct xe_tile;
>=20
> +struct pcode_version {
> +	u16 minor;
> +	u16 major;
> +	u32 engg;
> +};
> +
>  void xe_pcode_init(struct xe_tile *tile);  int xe_pcode_probe_early(stru=
ct
> xe_device *xe);  int xe_pcode_ready(struct xe_device *xe, bool locked); @=
@ -
> 22,6 +28,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, =
u32
> val,
>  			   int timeout_ms);
>  int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>  			     u32 data1, int timeout);
> +int get_pcode_version(struct xe_device *xe, struct pcode_version
> +*version);
>=20
>  #define xe_pcode_write(tile, mbox, val) \
>  	xe_pcode_write_timeout(tile, mbox, val, 1)
> --
> 2.25.1

