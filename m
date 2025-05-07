Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D51C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432ED10E8B9;
	Wed,  7 May 2025 20:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoKQp4wb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D3810E8B6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650215; x=1778186215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jX6ghPLv4fe1aOo+Y99ktamQxMjUI7SLmDJQ2If+T8A=;
 b=WoKQp4wbs7xDDayNTY6wlVhFQdgxUmb9vlOrI4cimFoirVdolgodNmNh
 GK3tDSlI5NSkDM92NkKjeo9mSdqh67gVRo8VUsIIkT+CBqWIR5ioaatm8
 7Ks0d+e1cCStLnB05HqUj+KBJLkfWf9OLBq+ir8bh6jN5Q3tzAQFPBzwg
 +bKqe0oWouyo5xRVBWZMcsmGlNe0f2QkCvysdse54gfzQwHd/AA3zPDZG
 +CAqXYOvnYxygxFgAg8PfTK3moj2geMk6xnawyLW35rRQMdlsO6ZrwbuV
 ZKuVcmcynAldiXF5WCwwE1ZKgIdQIjO9DQkQpqv6ExKqO8apOsKGY0KJV Q==;
X-CSE-ConnectionGUID: 0ODtPR9xRj2QCSKkHl1TtQ==
X-CSE-MsgGUID: CFTgnVnuQtOWmlPEWQZ7UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59396581"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59396581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:54 -0700
X-CSE-ConnectionGUID: 0vzCyjBMQmmnzK4uC10PdQ==
X-CSE-MsgGUID: D2HotMAYT5S+8VN+G1x8tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141038385"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXyBtWeUudW3TcYYB5QrJs0JXG+NWD0ULRyx+W+o4ptOmijCJVR1NorOA+7CJ0dfht8/NLvcEn0r9rs3kJClwH6wIdM0xxMzg8RaVVgR6CRybceH8OoufPzhyb1tSrmZJ8dKoB1CwAS9D7FpkDmTdCaMPC/HufswS2KiS56Faqd2bfHBIAIn+NHU22TN2Mfz0LF8r2EoZg3IMQq03uGPaHD1KJgHvN/ys1z2KbsO+9K3SbhiGk+x36OC53toaXa/9xRt9xGgmdT2XlQRtsyGwha2JFfZ6U07sm1+ZwqZF4GjvDreuDmjCJose2hYXjYkCY9HL0vCgZI1L6wEV2N6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vWm0ppqON2JT+ImRz8S1tIY5AocOY8QXpztsajrk9I=;
 b=g917AcNpuu1mbzWDQLE8+HiLmfAJjbr9ePlheBxkXjVn4RG13V+xel53QAfwyLBhUn8zlC7IE32+yurmhNPyRBwDTX10l04zYQICdunRG5zHrS1ZuoxnIwXNwo2FgEcXHgbgiXsh0lX5UCzM/88Kv5lPVw8zmY2TvA42J5GOIqutr7j3SZ/CtVrRsjh7VoyqWUSLUx4izr2gr40ljQOveiKfi4rqGx6Pjb6/O9/fcrSzVlH4sUgwiNIe0Dohe2x0+s8gORojAO8dAVj5+ZOD1IKPebubu3OkQcBQlrN1qELsXasjcgBPMxReKwPt284qGBuDktsLW42W+i+IMYKmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 20:36:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:50 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 9/9] drm/xe: Implement
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Thread-Topic: [PATCH v4 9/9] drm/xe: Implement
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Thread-Index: AQHbv4ysUXxGQ1JNm0WsmV7eqoC7xbPHnxxA
Date: Wed, 7 May 2025 20:36:49 +0000
Message-ID: <CH0PR11MB5444A3DB2A84FB38A5A01B8DE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-10-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-10-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7009:EE_
x-ms-office365-filtering-correlation-id: 7b0a329c-380e-4664-4c1b-08dd8da6e4d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?99/fMDMbLwh0F8tYvRexqjbz5Z+qxLyC5ErIYkEBrNOQRAHSgpf9riXGDs?=
 =?iso-8859-1?Q?E6rk5ASxVPABeCTWgDE6kDSPSyacAMbIkyMl1xJrbGgsgg4C4xIwHdD/EJ?=
 =?iso-8859-1?Q?Fu1+mlyfGStcAq9dknWwyAR91of9GdICv2qg3ZcCjJDysepCHKeyJHp2pr?=
 =?iso-8859-1?Q?PDDuJrAX6pFW9yIdkP7B0zxcNgumxz+eDXpXHLyz0wrw9ocJ2ImTMoPGDz?=
 =?iso-8859-1?Q?2MBTxakCWoOfa5BLQLmOccj1TnlKsX88rX3f3YUnIRm9GItQ9YwUlvx8kv?=
 =?iso-8859-1?Q?mCLAyo/pe6hPAv1XCEMksaOnPuNiUtQL/dMVH7BxvH1JmLcNTiTUxN1vfU?=
 =?iso-8859-1?Q?oNK9ngwdblnuucQw5R9Ei3KZbcUnn8bBUZLZbrXoDZvuG5Hl1I+8yqZzKV?=
 =?iso-8859-1?Q?F4iUfl1tZ0Aa6RBwntWdaIIJV1Bdg2guij2LL5X1SmW/2FI6+LwVYOA3d8?=
 =?iso-8859-1?Q?JdpZjM6eNLkevdx+iyyGkhH/O1arKlxF01+cEDrcLPfrMmq5taM7rkt07Z?=
 =?iso-8859-1?Q?wHN4q1WBleUQxj4y6kkWUJzQNer0N++9RM4lGv4XW6vRQbNX5MAFHVIBx/?=
 =?iso-8859-1?Q?ws58hMLzGpsd3mfqfYlSoEmUcjX7+ipVPwPhchaUjX5LNHH6WrS3L/G7tl?=
 =?iso-8859-1?Q?yrFP25FWIc1rUdhato/awc+LyRDPLXVPFR+IIc1zmbWf36RrOT1phULX+K?=
 =?iso-8859-1?Q?vNX+mk/BL1GAJIRtAtnpcCmbkebrlLQC+uzlQ2DpXO2XbAa9g8gIWwK4T4?=
 =?iso-8859-1?Q?xK6Z9kJIKYSZAd1UNRoXjhgxTiNQmkF+1SeVIcG0J1HPPMGgTA4vImXqzk?=
 =?iso-8859-1?Q?QNkBkmqdvdLlp7IVDqa4qKZLX6mazG9WpuhjGJ+564cLeTQsWtXWyz/Dzb?=
 =?iso-8859-1?Q?HTIE8kQCCTRAviD6pLwVVQnm2e2uaruIsPAUaJ7Z9UV/nNHx5sqcoPC6Jg?=
 =?iso-8859-1?Q?A26XASgCXnRVYl92VxwnjHbrWC5eqPrJ5EzmoVb8hXPF0jBuCLNB4ahYsK?=
 =?iso-8859-1?Q?FX5B7ez6oWWryFkntCoSc16hWvam6cxgaJMSzfnZ3m5ktScCJITTlXxae2?=
 =?iso-8859-1?Q?N3opsqliOFYZOKDyqF/OQ0850yjVlVqq5j0p5h3MA96O/rTpWF8ofcBRq2?=
 =?iso-8859-1?Q?SdFENPjwtLY0rf3cQpuSEdGlU8Mr/JudOU5lcxbufPYPayYSf7tpBeY5mN?=
 =?iso-8859-1?Q?1bOvU36LnlEBWZL3rzUL2ngC5CQtNNvz8fDrSAkyUtFu3kAr/fTw0Cu8zF?=
 =?iso-8859-1?Q?6LJ7kEZcZjmzMPu85Yytw1nsuFm/EbeQ2slUiN7GwGngCenuVeOTQPaZn5?=
 =?iso-8859-1?Q?nVo7IbDb/YjBTkxupAaMHMlM3VK48D3J0IxUhn/y2qZ/q3gtE8hnX9zMw4?=
 =?iso-8859-1?Q?oYcUz1jtB56ZIx5W87qDCHbf2iVwJRBUMiPT/zDrGQyZElWMZabgOaWeS+?=
 =?iso-8859-1?Q?TTf1D6/6lH39H3k1uLoLkFUdjFRajhl/bedTGp+qCaUuGqQFpwXmV+Ogr0?=
 =?iso-8859-1?Q?5hNbikN6e0w3ZTpsQBwNeyOJVUHEqdpa2YcL7fOupSI5E9CXO4/FiSCx5K?=
 =?iso-8859-1?Q?eFCCSUo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AypdggENNa3HWjtma7NeaqzVAyyaeMTnl9WzvV6fmxkL4tbO5CmKM3j3/l?=
 =?iso-8859-1?Q?PddMTqqoRnmD0lUY1qaBkziaPlW2OwDT5clhNCZnAw0pZ/xrOZKEfu3fEJ?=
 =?iso-8859-1?Q?5CWfDYyDwIijMQvAwziKKHb94b7k2dFiwX/tgw6f5k2GyazxA96XcwOdWc?=
 =?iso-8859-1?Q?gcB2f2zjPI68nDaz8zI8e27/Zb42/+Ah8sMk4R4q8gh7NVp8bmwXG/aMpW?=
 =?iso-8859-1?Q?NfLeUHDXoQE9oXb2/f5+dPDkQ94k3SEisnBr0IM+X9s4BMKalgVyviOFBy?=
 =?iso-8859-1?Q?2wdw94Ybv2FVsTBvGQG7mZk0ibPLBbHab1FzKZasFUEbeAERgjuOcYelmo?=
 =?iso-8859-1?Q?x69+jyyaezfDswPlitH5FYUYHQMYaeApaaf4mbLmSdNExHXtsVYaFcEas0?=
 =?iso-8859-1?Q?aRbavDk6LWaDRKId20PRD45YSujD/FECL6lrGMX1yuW0ZB45Pl/J/0QYg0?=
 =?iso-8859-1?Q?aybo4N+S1yDJ6tUPYnkTb99XhVVA+jwGzVz21YlK+h2uhtpAiRmftBSLOq?=
 =?iso-8859-1?Q?oLd54F+cTxvTuXoiL7JfF5BZkUeHRUycWenL7u2nEFtr5aCIx0gK/rO3Ce?=
 =?iso-8859-1?Q?WNVvIMPs1tsedqkzBn2toqt923X5RZYM03qqySvj5erXDNJJKaWKMJ3K6s?=
 =?iso-8859-1?Q?B/91nwJqzzBsDO72lub9oMUXXCy6Ke425VfxXKj4xt7Df1T97QBjiayA6h?=
 =?iso-8859-1?Q?JciG86y7zcfamReINjS/JcnwaPkkZQvoZOlrFd4Qbo7X72V/X9hkAl2Gp1?=
 =?iso-8859-1?Q?AmHg5fheYoYXKydWrlL1z7fnX/m00puTKdw92d7lvkpz+Ro+cP9MNexR4w?=
 =?iso-8859-1?Q?BZ8xOJunTlrkRGfn4g3lJbtDMLONsi3K0QuV+f4WReEG3YuGkJyJb/psHx?=
 =?iso-8859-1?Q?ORa18YuYxbuWuB7GarFzYGQVly6WMrzzkbxrSZK1Q7QfPOV1QsKxUooDwi?=
 =?iso-8859-1?Q?RMDxuvP42JSVbKzmepbI5pW92BgKQau5MsH6rV0zBkV0ArIrGqsHNx/bvJ?=
 =?iso-8859-1?Q?VuyV2iTulE1UJ+s2A+biJmuBq64N6BPgHludvFAAWr3NSHc7tNKwa3DSCQ?=
 =?iso-8859-1?Q?HfiCvBvMe5akZzuJpGeZOyeE0IgA9wYQ+3rjMVCk/lQmYD12g8eue1ZfCj?=
 =?iso-8859-1?Q?tXZlAijr3x9b2avsUaUwzOxSROd9pTsOUczJ9loe3cgigFv8bZ97qxBq/p?=
 =?iso-8859-1?Q?RpkHghTFdux9dW5k1bFwqq9SeRhuaw9lTqSd/j4bzwp82qvynCaSOGg+tK?=
 =?iso-8859-1?Q?bPOq1L8pcOT8deh0i8lyLkvB/KUljEMaPwxVcbrfhV9fCphSitPKx5ITL4?=
 =?iso-8859-1?Q?EJPyQIEKiguldz1PNvqle5L8LcORPXWThs9sOLhgLOH+8hqdx+J4ysFxPw?=
 =?iso-8859-1?Q?RnL1cDbECmkSJxUYHkU10JZmmjBoedOQ/czneNVlJU9xb7QVJaG4UPvk4j?=
 =?iso-8859-1?Q?sO1SuESygF6wGFylSCBU+0Tt0zc3X98/G4coAbUfLzJVud2Xqt+FhZApWq?=
 =?iso-8859-1?Q?us2POoJbklq4pXBZ9awWbo98nI60G92ccg0wDl8WwIvbR5UGLPfl6kb9cI?=
 =?iso-8859-1?Q?G95GrYBm4RseNjFbaiRwpoVNoBxeH2/rxo/UuMBVssTQbVQDz4GQ73NTm2?=
 =?iso-8859-1?Q?W9Qqscbw/8mwhc224CFYm8M/iE4So3AfhN1Mn4KZCjtN1SjOI+xHzGvg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0a329c-380e-4664-4c1b-08dd8da6e4d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:49.9437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Swdu3FbQOMFU8xozOpMuqUzboVy31UAFP7xqV5Q7td/9XWyNQBzSfISCuOGfTEeMCS988mZgThjYJ7pUhyV+118Wu/Z6CT9tjRzddOomsTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, May 7, 2025 1:16 PM
To: intel-xe@lists.freedesktop.org
Cc: Souza, Jose <jose.souza@intel.com>; Santa, Carlos <carlos.santa@intel.c=
om>; Venkatesh Reddy, Sushma <sushma.venkatesh.reddy@intel.com>
Subject: [PATCH v4 9/9] drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY=
_STATE
>=20
> Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
> queue default state to user data passed in. The intent is for a Mesa
> tool to use this replay GPU hangs.
>=20
> v2:
>  - Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
>  - Fix the page size math calculation to avoid a crash
> v4:
>  - Use vmemdup_user (Maarten)
>  - Copy default state first into LRC, then replay state (Testing, Carlos)
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 25 ++++++++++++--
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              | 42 ++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_lrc.h              |  3 +-
>  5 files changed, 58 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 21d4ced31dd9..a4d0a2c9be51 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -47,6 +47,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *=
q)
>  	if (q->xef)
>  		xe_file_put(q->xef);
> =20
> +	kvfree(q->replay_state);
>  	kfree(q);
>  }
> =20
> @@ -139,7 +140,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue =
*q)
>  	}
> =20
>  	for (i =3D 0; i < q->width; ++i) {
> -		q->lrc[i] =3D xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags)=
;
> +		q->lrc[i] =3D xe_lrc_create(q->hwe, q->vm, q->replay_state,
> +					  SZ_16K, q->msix_vec, flags);
>  		if (IS_ERR(q->lrc[i])) {
>  			err =3D PTR_ERR(q->lrc[i]);
>  			goto err_unlock;
> @@ -460,6 +462,23 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct=
 xe_exec_queue *q, u64 value
>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>  }
> =20
> +static int exec_queue_set_hang_replay_state(struct xe_device *xe,
> +					    struct xe_exec_queue *q,
> +					    u64 value)
> +{
> +	size_t size =3D xe_gt_lrc_hang_replay_size(q->gt, q->class);
> +	u64 __user *address =3D u64_to_user_ptr(value);
> +	void *ptr;
> +
> +	ptr =3D vmemdup_user(address, size);
> +	if (XE_IOCTL_DBG(xe, IS_ERR(ptr)))
> +		return PTR_ERR(ptr);
> +
> +	q->replay_state =3D ptr;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -468,6 +487,7 @@ static const xe_exec_queue_set_property_fn exec_queue=
_set_property_funcs[] =3D {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] =3D exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] =3D exec_queue_set_timeslice=
,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] =3D exec_queue_set_pxp_type,
> +	[DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE] =3D exec_queue_set_hang_repla=
y_state,
>  };
> =20
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -488,7 +508,8 @@ static int exec_queue_user_ext_set_property(struct xe=
_device *xe,
>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>  	    XE_IOCTL_DBG(xe, ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_P=
RIORITY &&
>  			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> -			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
> +			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> +			 ext.property !=3D DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE))
>  		return -EINVAL;
> =20
>  	idx =3D array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_prop=
erty_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/x=
e/xe_exec_queue_types.h
> index cc1cffb5c87f..94185854ffbf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -140,6 +140,9 @@ struct xe_exec_queue {
>  		struct list_head link;
>  	} pxp;
> =20
> +	/** @replay_state: GPU hang replay state */
> +	void *replay_state;
> +
>  	/** @ops: submission backend exec queue operations */
>  	const struct xe_exec_queue_ops *ops;
> =20
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_exe=
clist.c
> index 788f56b066b6..cbc2ed9f6ffb 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -269,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(stru=
ct xe_device *xe,
> =20
>  	port->hwe =3D hwe;
> =20
> -	port->lrc =3D xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
> +	port->lrc =3D xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSI=
X, 0);
>  	if (IS_ERR(port->lrc)) {
>  		err =3D PTR_ERR(port->lrc);
>  		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index fa4bd48c1874..d9130c360a23 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -46,13 +46,19 @@ lrc_to_xe(struct xe_lrc *lrc)
>  	return gt_to_xe(lrc->fence_ctx.gt);
>  }
> =20
> -size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> +/**
> + * xe_gt_lrc_hang_replay_size() - Hang replay size
> + * @gt: The GT
> + * @class: Hardware engine class
> + *
> + * Determine size of GPU hang replay state for a GT and hardware engine =
class.
> + *
> + * Return: Size of GPU hang replay size
> + */
> +size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class=
 class)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
> -	size_t size;
> -
> -	/* Per-process HW status page (PPHWSP) */
> -	size =3D LRC_PPHWSP_SIZE;
> +	size_t size =3D 0;
> =20
>  	/* Engine context image */
>  	switch (class) {
> @@ -78,11 +84,18 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engin=
e_class class)
>  		size +=3D 1 * SZ_4K;
>  	}
> =20
> +	return size;
> +}
> +
> +size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> +{
> +	size_t size =3D xe_gt_lrc_hang_replay_size(gt, class);
> +
>  	/* Add indirect ring state page */
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		size +=3D LRC_INDIRECT_RING_STATE_SIZE;
> =20
> -	return size;
> +	return size + LRC_PPHWSP_SIZE;
>  }
> =20
>  /*
> @@ -886,7 +899,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> =20
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
> +		       struct xe_vm *vm, void *replay_state, u32 ring_size,
> +		       u16 msix_vec,
>  		       u32 init_flags)

The formatting here is a bit weird.  I think msix_vec and init_flags can go=
 on the same line:

"""
static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
		struct xe_vm *vm, void *replay_state, u32 ring_size,
		u16 msix_vec, u32 init_flags)
{
"""

This isn't a blocking request, though, so:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  {
>  	struct xe_gt *gt =3D hwe->gt;
> @@ -901,9 +915,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_=
hw_engine *hwe,
> =20
>  	kref_init(&lrc->refcount);
>  	lrc->flags =3D 0;
> -	lrc->replay_size =3D xe_gt_lrc_size(gt, hwe->class);
> -	if (xe_gt_has_indirect_ring_state(gt))
> -		lrc->replay_size -=3D LRC_INDIRECT_RING_STATE_SIZE;
> +	lrc->replay_size =3D xe_gt_lrc_hang_replay_size(gt, hwe->class);
>  	lrc_size =3D ring_size + xe_gt_lrc_size(gt, hwe->class);
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		lrc->flags |=3D XE_LRC_FLAG_INDIRECT_RING_STATE;
> @@ -932,7 +944,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_=
hw_engine *hwe,
>  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>  			     hwe->fence_irq, hwe->name);
> =20
> -	if (!gt->default_lrc[hwe->class]) {
> +	if (!gt->default_lrc[hwe->class] && !replay_state) {
>  		init_data =3D empty_lrc_data(hwe);
>  		if (!init_data) {
>  			err =3D -ENOMEM;
> @@ -950,6 +962,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_=
hw_engine *hwe,
>  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
>  				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
> +		if (replay_state)
> +			xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE, replay_state,
> +					 lrc->replay_size);
>  	} else {
>  		xe_map_memcpy_to(xe, &map, 0, init_data,
>  				 xe_gt_lrc_size(gt, hwe->class));
> @@ -1040,6 +1055,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct x=
e_hw_engine *hwe,
>   * xe_lrc_create - Create a LRC
>   * @hwe: Hardware Engine
>   * @vm: The VM (address space)
> + * @replay_state: GPU hang replay state
>   * @ring_size: LRC ring size
>   * @msix_vec: MSI-X interrupt vector (for platforms that support it)
>   * @flags: LRC initialization flags
> @@ -1050,7 +1066,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct x=
e_hw_engine *hwe,
>   * upon failure.
>   */
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size, u16 msix_vec, u32 flags)
> +			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags)
>  {
>  	struct xe_lrc *lrc;
>  	int err;
> @@ -1059,7 +1075,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *h=
we, struct xe_vm *vm,
>  	if (!lrc)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	err =3D xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec, flags);
> +	err =3D xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec, fl=
ags);
>  	if (err) {
>  		kfree(lrc);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 2d6838645858..1ee1bff40569 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -46,7 +46,7 @@ struct xe_lrc_snapshot {
>  #define XE_LRC_CREATE_RUNALONE 0x1
>  #define XE_LRC_CREATE_PXP 0x2
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size, u16 msix_vec, u32 flags);
> +			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
>  void xe_lrc_destroy(struct kref *ref);
> =20
>  /**
> @@ -73,6 +73,7 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
>  	kref_put(&lrc->refcount, xe_lrc_destroy);
>  }
> =20
> +size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class=
 class);
>  size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
> --=20
> 2.34.1
>=20
>=20
