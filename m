Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F7FC3ABC5
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7291910E8AA;
	Wed,  7 May 2025 20:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFZESJjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03910E8A6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650211; x=1778186211;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zwueP7F29nJf7ZLe81FFm+T8sEz60zaedRztAVyZqQE=;
 b=bFZESJjGM1dejvendK/D1LNBxWzUTyWLuuPBCR0XEoE6TfXRGCSEWGk/
 +/ilAW0Q+R12XASFKHl6QE43dfNGj69mTXsKk5KMMRBgKp300yUSnqlpe
 LhagvV8AFvvh9nmnwlVbIMFCLsjQQuC3b+RylRMAO40djVnQmEmhNXLS9
 6Z0Y6pZvJ5RoduVmNPihhbsnxU1i8Gv8b3r8ROY6TqyHk4hEuGan+TS7z
 64oNOYtAWaJRAcwtZ9S5NRFqoaJrkgSKnUmCK7Y/ZYg2GWyjVS3eHt/6x
 ooyOWSZFMvWgb8w6J4U/858E9ZDB4JD/rKpAeSdLCQO3HZSIR/YgjgSPK A==;
X-CSE-ConnectionGUID: 1J/dRJkUSPekbLF/cihJ4w==
X-CSE-MsgGUID: TBhB8nKlSO+pxp2xmAIX4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59396567"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59396567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:51 -0700
X-CSE-ConnectionGUID: 8Gv34UmBRMez9Gr4rsTuEg==
X-CSE-MsgGUID: vT3kWtsWTge89yX82QkjvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141038376"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:50 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EovBpEO1u9opMkU5qbzaGH6Lsx3OnBBHbl40RBbr/SmTpVfKdFTg0D8dJmzvuLSaCYqkYhobaCK3/66AKb/50mWdf5RX5s5FecxCEBSJBE/QqjOCSex3uODJJQQArX1HAAtNyEYNgKLnkTOXG9x2m5PNicu+Zp7uLeKFA0ZMdN5MKydSAvSefE17mbtS+EBYM/a+2S/bGWbzM/6Mq2liG0BwqIiG7bKw0JAhkV14TSz1B/dS0if4KQH1erXVX9Fw6Hvie6Osji+KpLHbggG0LpXR6FzGILUsnxwZViHrAiLNiLaEMP/zUT8L4kkx+z4SDP4DXJ9Mfq7lKwb8jD29OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hs/dwIEzXbYSlDwYrMNXbC8NeMZ7Qj+XiVJl2a08rrY=;
 b=FsnINwyxRr6RKZmYDFbBf/Y/ulcri8GlaSGBJ8OODuvzDmG9TpjFraTFNNri0uuwF4QfscoXJ6EecIT2/vu3YYDeVaooO6PQCfRWzGpe6HLg6wthfCTeUp00nx7u7f4fsfg1rbN9OsL2YFDYGnASK+pWyKtZb6etDWfji7Ecq0MXHez4og2jD1B1MnApARqx/2Bnq6PEYrTAPC0nx4ql0jKLff0baxeVCfQwIAQhmuet/QcOu5C6kQgXa4KS1iGn3PZmcrrirJRztNRvpMBd60y1lmAj++9k0/0RquzKZ+aXKO3MObvcu67DLYSQBo1GSlAevX8sf3drM6oPy3OZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 20:36:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 8/9] drm/xe: Add replay_offset and replay_length lines
 to LRC HWCTX snapshot
Thread-Topic: [PATCH v4 8/9] drm/xe: Add replay_offset and replay_length lines
 to LRC HWCTX snapshot
Thread-Index: AQHbv4yyFO+nqq12F0eMcbA/ObGbO7PHnrXA
Date: Wed, 7 May 2025 20:36:46 +0000
Message-ID: <CH0PR11MB54448115A724B1A444D2C931E588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-9-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-9-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7009:EE_
x-ms-office365-filtering-correlation-id: d9298b2e-3ded-4f9b-c200-08dd8da6e2eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1KPy3iTCQYqB90cOTA3iq5Bnq48n3GNEW7WqucFpsDVsGSr59N61toOCMt?=
 =?iso-8859-1?Q?uwTlddRF+XQAk7UJV+Z3x8q3yVmuMwJTThY9/CDDiM1CzdsdzVo0P0BkFc?=
 =?iso-8859-1?Q?+txETxZ/nE4oLEzwCwriU//R38b9NQZ4HyELVoTkY7ogy/ka3I3vMjR2XK?=
 =?iso-8859-1?Q?2UDE4uE347S7tSQr4OfhabYDN97+MC0V1UnbueP9MgH/yGygS7GClR9cOx?=
 =?iso-8859-1?Q?SN/Uw9OtyhOYchcZmdPUkrDEEaQaAvz5G9wMUj4HNu2lwrChO9DBywV/vy?=
 =?iso-8859-1?Q?ivTr+XFUcbumvrSJmVxmnetux9Lwh6bGxBDZSZEpEX7TGnxxmx2CLBrIty?=
 =?iso-8859-1?Q?A1PDjn4CynbV7pdkjNAZMW/QZ9jm//MHAukJ59wICBQ0l6tTCfGwHspafJ?=
 =?iso-8859-1?Q?LXrdn5Gg0r3aIpLVPV6wT3gDM2eSdX4+mX+zHPNlhAb+CeO9d/mj0jTRAJ?=
 =?iso-8859-1?Q?Y5ay8doZMe0Peuq3CcqZcPlmpAefKNnNbkLmxQlrX7wyig7nQSiXMU+47/?=
 =?iso-8859-1?Q?NshXTT6/8M/kxXprg+EEGCblA7rBFwL+z8DE4zIdKDg0xEF6wuNpVUovYl?=
 =?iso-8859-1?Q?YnQ5pHuYgCvuhVutV53Vwy2hdnHPlguNra97CCjj/Lv5u8Ym15TMgtfHYF?=
 =?iso-8859-1?Q?p1YI5y2iq1eOClNwR0izuruy4Is4oo0++bssCkOnWjzT9FqdUy+6xNKQwE?=
 =?iso-8859-1?Q?URLWqggBqcGbj0CZqDVfH6iOzblr4yfMS/4EbYDgiC8KviO4yOncBEXy37?=
 =?iso-8859-1?Q?GQJsLMxv7IYRVLxn3K/TPqarU6J2AiPq2+SpmEV60tO2qTm9+UZwWSdjqm?=
 =?iso-8859-1?Q?ycmd8/EvBByXrvnxMkbo6CTnFLEm3ooxZY+HkGer0Wcq6sfREOFmbLnQI/?=
 =?iso-8859-1?Q?zc1JMQO7fhRv5wavzJ4y384Fz1IHNaoqHT3b5mmeJjfE68FR4Pv7IoMt++?=
 =?iso-8859-1?Q?ZnhyebevZrJNpT9oh41WQwvRQu6ZgxS/aE1E/yi92R9dvcLn5ztusO+g0J?=
 =?iso-8859-1?Q?sJrvPPdVFdlbs+lmuPcFPYyW1oncdEXjDeSq2GXWixiWScxmCpjcrUcJEW?=
 =?iso-8859-1?Q?B0Nv9CwJx0IvObIt6QIRQlmb2uzQRRCT5tJLdlznY18bpC+qLnq0klcJxh?=
 =?iso-8859-1?Q?BPFwU9rkVoritjd/waorBPIWS7AVpTO6b3R9YgumA27zznjVzj5gz5G+/m?=
 =?iso-8859-1?Q?dX8L7aYYHu9E5eIu1t5kiWJzMsPY87IDw/q4wtHJDc5GA23wOyuDywzvem?=
 =?iso-8859-1?Q?pXZcyfTeFkTVmsNlVRDsUAKYkqlCCd6chiP//AB/RV06v+z9s+CT0xSmlD?=
 =?iso-8859-1?Q?VohRHARcuA1u3kP+EhLNxzrsw09pVKxYEXHAB+YgoXu00ZT3gTofF1Oafd?=
 =?iso-8859-1?Q?Ga/Auhj0R19zhqK12DviRlJHgD9RGQTzwN9ZwWOXBAlzoOoyBNhEpShyvT?=
 =?iso-8859-1?Q?5JnTuCevT+XX8nf8RfmWiqx33x60PZfuZPUDoLEbKa12DOwAwHkn45WbE2?=
 =?iso-8859-1?Q?B3yqqp7fTyHDV1YuKM/E/EdNpd/GJGA0TSFQ1i0aP6/RTDfY2m+0MVrMnt?=
 =?iso-8859-1?Q?po28sDU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?//Y9g9KUcGFsSjG8dp6033PUyH+EJK7yiqQ7LM6l7huWwNEDk8DTfuFQRz?=
 =?iso-8859-1?Q?pUHq36ePacm4ZdpT993EaV3+DN2MT0Z7vf+ZmPW2eHEDvSdn8SSm57jtpd?=
 =?iso-8859-1?Q?zdEYdtBRHC/axWNj7SmJrg9qZFhivda2GIwalvfG4af9ized09R6gUNktq?=
 =?iso-8859-1?Q?+JhEY6KkuRuUmCg52rXfz+hVTyLRfdr8WwddwqlKID4oJISc7QcF+Aw3SN?=
 =?iso-8859-1?Q?ZQ1zfA/BDKUNik5acc7NUjPpQLGNr2OT+EQNxlZShiVv/Mz7TbCvddzzAj?=
 =?iso-8859-1?Q?pagAO4svn5CklL9BOwzk10EUXU1HOQnZjfzagSH7ht1JLXi+M+Vz7KyaWK?=
 =?iso-8859-1?Q?oRSC0OFOlsyHXJvU0Z0Wb/QmKV7LNdghgi4JqjDgk41Kbbrk2ejME6PQwB?=
 =?iso-8859-1?Q?NAdd5EAg+ag3BsY9in/Y4fPmVh57xlkFHGaKq+APi355+vzDfTo6eWHoIB?=
 =?iso-8859-1?Q?Jt1pHsCQ6VZCRinOFMqQzXYU8NJVUSVbS/leVigYVw24ikvRyXBTAwcx09?=
 =?iso-8859-1?Q?piNKSb7o36brm33Qlr2Q9m5cVAt3MGR5uzc0Ds2e/ZWnOdPAKKchBMwBxn?=
 =?iso-8859-1?Q?JCJ0D0vhNQ4xKabnwzPfUBqLW1Agdpv7vtLJcmxUrvSOXF04mHIk1xaj/q?=
 =?iso-8859-1?Q?GZcsNvzATVuGicwF+gyQALscG6h4ShlDEgCPxI9YeaJIbLjFHFNzYOtC99?=
 =?iso-8859-1?Q?/zBZ132n7efVYFiSHnjZHdswL2w1jVLAIu48hhgkgX1rAknRshqXgC0d+0?=
 =?iso-8859-1?Q?yCi18UQv/RgzNLWpPv6jjSIYTp/i8QSYONdXipqZO/czGNEYnE8P2xUK12?=
 =?iso-8859-1?Q?gPIOi0Vh7QUkAiO48uReBIL+7a32jjbbnkm/9TATGqPlv7Xl23FUdZhCTO?=
 =?iso-8859-1?Q?bXlX7IZvIUkHPbEgU9emw79Fnr06838jtpTjsh2wxJGInEnFcORWYQBD0l?=
 =?iso-8859-1?Q?HcjrJi5q94gGCOhIWrTcms3Aq8g4jrMmhoVgn+HyOrkknZqfHpvLTEHRCO?=
 =?iso-8859-1?Q?7fRIAOHJuhYQuq943r46d8zgVgZXEfQBAvvOLN1BALGEX8nXevldJ4jq5s?=
 =?iso-8859-1?Q?iTwraTQygDoIuwvG3dPU/Nq38cUPIQkN5HxUcEOYd5eFR/O+VCYcioWBUS?=
 =?iso-8859-1?Q?7FaYPqaB4QxNM92l+sBSOZVk0nbRmt4ALTiv0NY2+xsDsSJqvo2M23abqM?=
 =?iso-8859-1?Q?RuoTMh70yJ8JNNRhEIcbtzYypRnSqUwW/GospCAYAHWERcLavI1q9DA2u4?=
 =?iso-8859-1?Q?0+5KraUwtGn3TWr2n5F3dNtfONwnbssa+Za50rtxsmOcjxDn7QmOlOh50O?=
 =?iso-8859-1?Q?zSdlrBXdfGV9GLV7Zuc7DVSSbX3dNK3QjWSSDZR4V2lsTba0s70KAgjE+a?=
 =?iso-8859-1?Q?tLGKh5mdmCpGcXaWRizbgrUx5L0g9YLt33aP5Mc+uTIOEr5SU6cTvghIVY?=
 =?iso-8859-1?Q?eleZ7dMLtwTBf/bV6mV0li8W56d5ex9jmtAG6xAlteqaeW6xHPJwKOuRyx?=
 =?iso-8859-1?Q?nbP3VrAcHM3+vaQhC9xPq+2/k+8rEd53X7/djgfLU92NjQvsklMnKIG8Vs?=
 =?iso-8859-1?Q?VNpPwWTuvTs/XGz/n3dt5AE6FNYEDRcrGetkMg0NodZWv/KIYZLKCxfFM6?=
 =?iso-8859-1?Q?tGfeLlX1zrynd2AeY3ZQnhIF+5XZFhHhIC5/nW3mEB7pREBFQZq0LBCg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9298b2e-3ded-4f9b-c200-08dd8da6e2eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:46.7296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ItKQmxnTSUe5YLEdGBwUwGZg+8ai66zDZnU9yAwbTGpbdelck5VamXvi+TnH5nsWN3W8N919HQoCmmESoQRqEAt3tI1rx8xnDtLWf7c7KlU=
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
Subject: [PATCH v4 8/9] drm/xe: Add replay_offset and replay_length lines t=
o LRC HWCTX snapshot
>=20
> Add replay_offset and replay_length lines to LRC HWCTX snapshot with the
> idea being this information can be used extract the data which needs to
> be pass to exec queue extension DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
> so GPU hang can be replayed via a Mesa tool.
>=20
> The additional lines look like:
>=20
> [HWCTX].replay_offset: 0x%x
> [HWCTX].replay_length: 0x%x
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_lrc.c       | 8 ++++++++
>  drivers/gpu/drm/xe/xe_lrc.h       | 1 +
>  drivers/gpu/drm/xe/xe_lrc_types.h | 3 +++
>  3 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 855c8acaf3f1..fa4bd48c1874 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -901,6 +901,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_=
hw_engine *hwe,
> =20
>  	kref_init(&lrc->refcount);
>  	lrc->flags =3D 0;
> +	lrc->replay_size =3D xe_gt_lrc_size(gt, hwe->class);
> +	if (xe_gt_has_indirect_ring_state(gt))
> +		lrc->replay_size -=3D LRC_INDIRECT_RING_STATE_SIZE;
>  	lrc_size =3D ring_size + xe_gt_lrc_size(gt, hwe->class);
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		lrc->flags |=3D XE_LRC_FLAG_INDIRECT_RING_STATE;
> @@ -1691,6 +1694,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(str=
uct xe_lrc *lrc)
>  	snapshot->lrc_bo =3D xe_bo_get(lrc->bo);
>  	snapshot->lrc_offset =3D xe_lrc_pphwsp_offset(lrc);
>  	snapshot->lrc_size =3D lrc->bo->size - snapshot->lrc_offset;
> +	snapshot->replay_offset =3D 0;
> +	snapshot->replay_size =3D lrc->replay_size;
>  	snapshot->lrc_snapshot =3D NULL;
>  	snapshot->ctx_timestamp =3D xe_lrc_ctx_timestamp(lrc);
>  	snapshot->ctx_job_timestamp =3D xe_lrc_ctx_job_timestamp(lrc);
> @@ -1765,6 +1770,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *=
snapshot, struct drm_printer
>  	}
> =20
>  	drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_P=
PHWSP_SIZE);
> +	drm_printf(p, "\n\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_of=
fset);
> +	drm_printf(p, "\n\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_si=
ze);
> +
>  	drm_puts(p, "\t[HWCTX].data: ");
>  	for (; i < snapshot->lrc_size; i +=3D sizeof(u32)) {
>  		u32 *val =3D snapshot->lrc_snapshot + i;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 0b40f349ab95..2d6838645858 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -23,6 +23,7 @@ struct xe_lrc_snapshot {
>  	struct xe_bo *lrc_bo;
>  	void *lrc_snapshot;
>  	unsigned long lrc_size, lrc_offset;
> +	unsigned long replay_size, replay_offset;
> =20
>  	u32 context_desc;
>  	u32 ring_addr;
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lr=
c_types.h
> index 71ecb453f811..c2766719ff77 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -25,6 +25,9 @@ struct xe_lrc {
>  	/** @size: size of lrc including any indirect ring state page */
>  	u32 size;
> =20
> +	/** @replay_size: Size LRC needed for replaying a hang */
> +	u32 replay_size;
> +
>  	/** @tile: tile which this LRC belongs to */
>  	struct xe_tile *tile;
> =20
> --=20
> 2.34.1
>=20
>=20
