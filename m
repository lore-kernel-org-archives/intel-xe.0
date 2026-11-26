Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18860A2611
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lpE3Ro+A;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZkKronvZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2239011223E;
	Thu, 26 Nov 2026 09:36:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB77B11223E;
 Thu, 26 Nov 2026 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795685782; x=1827221782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jCKHq5G86QjW4TJOgumyseJdRzTY1EdYJwm6lDDt1yA=;
 b=lpE3Ro+ACE9g+lDkrM2lY4oCkzGA+/AO7Aag1iZSJTJyK5oMQXaPddE4
 2g3SSq4ohrtShbqlZwsawolLV37P29ytlG/MDKE6uF/HDE61lsjt7LZE3
 Ln+3ybYWU7AoM8OsyIoM5otsTqyrSPeIeJh7n0dqWK5x8r+zIRntsAw0v
 LIR6ouHXXkXO20N9Igt7Ku4WvNr1KAh2/kIQqjn/p9XPqiJZk4alwG3sN
 Rqn21APkq1u8if+O6Yvp7YLxCgvutbxA8lSrxax7AFlrUnjRkvzoI8B52
 hCTaFY7zJh29X06q2ZVD1sUt5rp5VKXhEX0hzUbswwZCipHjQTTljxAkt Q==;
X-CSE-ConnectionGUID: xGPbUKNfTaq1BVYeKe4bNA==
X-CSE-MsgGUID: 9IOU/YjFQjqvjD8UMj8Q7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4473859"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4473859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:17:58 -0800
X-CSE-ConnectionGUID: ol9wW6l4R3CdaoXxOrfsqA==
X-CSE-MsgGUID: yFPZ0ntHR6ateWI8dTVATg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12382210"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:17:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:17:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 01:17:57 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:17:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hA3Vd9M+GwWLjWHC27hgpZh5GoP5HglrFStA7PjI2w3jpB3oE/3c76YuhqvoAu/3mmovCsFK3MO22ulxUABWwVAI0jWCFRXiZ8oTwk/Krz56X1BtqLcRfQsq2m9r/Uu8Dzc6NtFkJGuheX3iO0qmO9ExEMWZWjk1351ZZGgs8L4YcNMeTQVshGQKijyh2jLCFXBp60fWWsrtIXDe/wXuBOygcaQ/xMKs9xKHJGrTrTMlxr9NjiWToDyRwMA4mYIB+QJZ2xnMsB8nqi1Kviiv+1ykYIJqHNv5UeiY+6uo7t/COCaDkOK/Ff0JFiMv975ZIbuOwZwHKPGr/ulL3tAHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+UhWX9rhCMu5Tcz+YmY9Q7M3n4FwwqzI9q2biyeqAo=;
 b=pvxCZaFMbjK0JSBf93hRglwlq4B+MJJyg9DCBtwtRpZ5JiZGJx2u5my6IZB5Zrp7bLXGt1ev81CSEb3rx69+9PHJcj+SbKJqvMwGN/HYsOFq6/wS7F/OQVWLeKH0/b8Ya8kvKxSwDppSsI2sxBt4kakD/KlRXEZFXr3v7PTUYF4FpnNgZAEV98KnuMHGcBb+yG7SuFwwV4bYvsuyNJ3DcxCrYXMjapQnbBG1eK0XwPt/2e7ae9T2BlrSm11gXeKWaw8QBoNp8mqGFN2hCVA8kNQOvQnZiD/ekEmPLT1bwC90PpWJ5wXCNIcmLiunlwCMVs26F3uq1hJhnMfhnEEIaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+UhWX9rhCMu5Tcz+YmY9Q7M3n4FwwqzI9q2biyeqAo=;
 b=ZkKronvZ8qZOCfTj9QP3VQ+lCjCI+dtz8c+VMmBX15EiIj8tq/Lik5FZjia98gfvLAR592qsMRMCbSWJ55MQTGn82cU0oOITbSRCGfnrd2PO27KHCzGU2LniZBaKbgT/qmhEDK/VJnk0Pqb+JipOWkJFD1O6e43wtQ8I4DowJwA=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS4PPFDA9EFDFDB.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:17:53 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:17:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH 10/15] drm/i915/vrr: Split out setting the guardband
Thread-Topic: [PATCH 10/15] drm/i915/vrr: Split out setting the guardband
Thread-Index: AQHdfXBeyeCBcDLcIUe+dRA2KIvlIrdADdyAgAAEy3A=
Date: Thu, 26 Nov 2026 09:17:52 +0000
Message-ID: <DS4PPFE901A304F72FAE783703ECE4573BFE3422@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-11-suraj.kandpal@intel.com>
 <5c3107ba9fadff86183457e3d98e630b381a7ba7@intel.com>
In-Reply-To: <5c3107ba9fadff86183457e3d98e630b381a7ba7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS4PPFDA9EFDFDB:EE_
x-ms-office365-filtering-correlation-id: 1cf7d025-9f1d-4d7e-5bd3-08df4b9e2642
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|38070700021|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info: +3hyGX1tzjhduY60tV/EPubqF9Om97wZ8QR9zpsu620hcxhwLL6d/nZToAAs5zjSBMMJJU2YNSVYEkBL5BDq8XNUno8Jk/bIFXsT2vabXqen4LSVCV2VC1fb5SVFan0UelhEvRW1+RbNKaidxWVKj1C2wFTdVvqdz7Nv3MZ1sGHg2C7vMGpxQn4Ohc2kn0q6h2dVpHT4Exzuw0GrPN7hnsfV3MJx/kejia9Cf6+ZUJyfxbZ3nWbvcWD+3wyWMxkplhqF1l2xcMcaKp2W0P4iJoxNCBFJJIKVSToEAgDncxBsb4T7zEfIZE6YGtzB5gWoipLrfqanfOUkFQtndX/xR9gW+fAxSy25h8MPHC1l//WCFCh9Ha7tFw4K1dTfaMpmecm11TaMZOpi6/AbvED63ug3BZuK4quYH+HWTQrAamp/0soJkFGl/S7du8kK1G6qYBdKFV6c7jlTzEJPvi4Lw9IAfJPCSD8y0ISBs28d4FsyZqCIWbSvIwMID/dQRwOnONVSc+Q4q4ALsmSHwvJaVL79eyEisDE9qIi7v86TDGSA3/CySgjmiYr8oQNdPQMKPBJFNwqGM8/bfwcS1z64hkqQCQJcGt6/uKeN8Qed1C3qi0tKSi/kfwhcS3lqhB2MRiUO8ijZbGDPs2owzhBQwpTn0U88FdnHj3LsN1TszoLKJUmtjwdMaxVhYSbVkFK/9iPWKJbCzLzSg+H4yoMyyzUwjGdY91kvPuTnXr4hTaI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QlXZqIo5l0Q5E7OLr0BtznfgeNjtWtGJQhmDGo4wXUtO+4akC/xliGPMDHXR?=
 =?us-ascii?Q?2YPETiYV1fNqzSC6lJTv3Jo+FQi5zmlclTPDQQO668DQJukTnQdTZYz0ibgc?=
 =?us-ascii?Q?ry9GFN7pleMCasuH1cCaOh/BAM8mz3e9AzW3duBDqdzlWgqSPqul0AlQrjGS?=
 =?us-ascii?Q?by629nMXY+4sJxSJ3KCCbtZozyOP3WAMRBriZpFqWJP7h8E8c5oW7RIvkw3S?=
 =?us-ascii?Q?PrgYoXD2okY8QwWOTx3N7a/wSVUCxiqJQb566aKrykkypT7+NFmKg+3UCbV9?=
 =?us-ascii?Q?4yZj2B+rN0bVF9/L+2BWG2ez/Oi7G5tRgAjQw1UHuwxNUSv+qmGKrocZm1o9?=
 =?us-ascii?Q?Dvy4IFbsTINKPvF6xDLQ4er1sdZdiqwOnukQlPBmFOx1Nn2OZxmFor2J6ZPr?=
 =?us-ascii?Q?pC5DpDGeTf3b6T9DwqWB5zdKGwos7ctoQYXAc79/D9WVAR4tJgydL2PDQjq6?=
 =?us-ascii?Q?/xmM1xMOS397OFVqrDJqlj98kk1CPu4ck5lYYODaBsVD0qI419nR7lbEyU+3?=
 =?us-ascii?Q?r8HMDAkhy19fOo5toN4j8rv16hCuqvGh/SHfvjy8MFnMgrOhhC10Myptvv41?=
 =?us-ascii?Q?tFSofAOpK7IIGrVIwVZasJEUuo9khq68HdK86JnhLQC5bPq/bkQZKq5nsfle?=
 =?us-ascii?Q?jdFmC2aje1ib3rQ2bUcGg/oslWQbO0VJgi2MHkiJ0f+G9Cu+vj3OII38Cli8?=
 =?us-ascii?Q?uNNG/BaBGFNZphkTfjTQ3YgKhWj/7XB5CJze2GfF9pG44AIFGWAV8K5pPQZE?=
 =?us-ascii?Q?CbfLkj/h7t+8cQ0y5iym6oxHz0d5HpI5pBQCWzLISV5MWwUYyZVVnWeJfni8?=
 =?us-ascii?Q?LA0Dlo0dAHXd+/kQa54Y/LEpouQEN7NfZ5JidUk2DU6XBBBmoRVZugYrDdVu?=
 =?us-ascii?Q?I2kBfozVRGzTFrV+Sk3qilbFB5MjSw1tRAuWGnqnmEM1hVRLKy7OlzgeoRdy?=
 =?us-ascii?Q?bRUgLyrR2C6j6Kkw8say53oofWBGqNkMj/5jc5B/uZfoOeBMnjF1t+LkEXqK?=
 =?us-ascii?Q?hrLRpdRPAI4Lb0bUqO6Lk+UV/p1CFPQi5EZ3bORcD+vFhCwIjmYtbtxVxsvV?=
 =?us-ascii?Q?ftevwflyDe4OH3Ar5/tOkZbk2GzdEH2km+k5i27TnFO0++jQ7cFjKXFFI/F2?=
 =?us-ascii?Q?qQF0/vl7b2z2GxVI/jquIkWFsLKXD1mI73RzWOfulXVKN6rS5gBbcPL/Fiq6?=
 =?us-ascii?Q?8CQA3L966xGxW3EUGkdGNzEPM7ztuLkXBYHopY731xn5gK3Od4e/LLy6Dh2E?=
 =?us-ascii?Q?b4n9PME+74+N0i0uSEUSri3mxWPxuvg3/68ZxtrLiJl9DOmousrJyUxi6oUt?=
 =?us-ascii?Q?wBcAQMR1L9Ejug/dPF0qVC6ss9gSNsQmHAtR49qe7WNUetQVuLf3tQdf09PN?=
 =?us-ascii?Q?73MqkDjop1zGJy0yrtjkK3b0VSyHvgeWHarpGm9qImbRfMSdhig9m12gYNnh?=
 =?us-ascii?Q?6cTC6j9z9VkorAY2pm9wVj1XFlXLOolqSfNNVWYJ/J8RBJ7sciAfO45OrOF0?=
 =?us-ascii?Q?SPiWC/0PlLCoE6sAkxt91wuqWuAAEiol2SU8y1v5lkgIXr5rLw3dxUbF0dzh?=
 =?us-ascii?Q?fgUGwPJCJYwzR6LN1pymQD9qUA2fItJXCeLflQMu4h3rNTOJiAoyXP/RvFAi?=
 =?us-ascii?Q?KLqUaJILe73ds96TSqhkyxFTSsCp+Z0rULahMA2nkqeafPEToWsfCJrth5Ne?=
 =?us-ascii?Q?3+eGbPMYXM+QmDcwWa23YbCLfL37UFav6XxLZDIPjF0YuDKCveKDfw8nd58m?=
 =?us-ascii?Q?cjrAez+IdA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: g6VzO4tsVHoKENNNtBndQ6LqfYIPEzKpdXtQz/Qt7RLk+ucPbWvcv1sie8CcmCIky8Ns15JrHZ8/3hSegBzYuz99usriRFL4Zbs90fCE/g2e0dEXFKeRvB+6xcuejhuOTZy095AmamVTPKfejDiX38FPFGpph2aIxPq97pJJmOXb9sRk+ZD89Hp9Lm/YbGWkeOzLc1R46ttLzRpmtVHfmv+85pklMHL4YIEFECT7JxLPkl9hnlI1RWgDUZG+dc3FSRaSZbBIxwR2YR5NU7NTwpTzU+vAy0s31NNr4kEpotzNn7LeeiF/521buYccG/YP67Dg1D24ZIC6Mt4pBLouzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf7d025-9f1d-4d7e-5bd3-08df4b9e2642
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 09:17:52.7772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m/v8h1wYiF5ODewM9EaYjup6CdVnS/ZR4Ca2Pf/v/ikhr1wTmKjP1Go2Vmw6zL9/QPAfSdWIi22vYGA9e295KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDA9EFDFDB
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>=20
> On Thu, 26 Nov 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > Move setting the VRR guardband, and the vblank start and pipeline full
> > derived from it, out of intel_vrr_compute_guardband() into a new
> > intel_vrr_guardband_val(). Pipelock is going to use it to raise the
> > guardband of a tile to match the other tiles in its group.
> >
> > No functional change.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_vrr.c | 30
> > +++++++++++++++---------  drivers/gpu/drm/i915/display/intel_vrr.h |
> > 1 +
> >  2 files changed, 20 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c
> > b/drivers/gpu/drm/i915/display/intel_vrr.c
> > index 47603c141298..ad88034c23f8 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> > @@ -620,22 +620,13 @@ static bool
> intel_vrr_use_optimized_guardband(const struct intel_crtc_state *crt
> >  	return true;
> >  }
> >
> > -void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
> > +void intel_vrr_guardband_val(struct intel_crtc_state *crtc_state, int
> > +guardband)
>=20
> What does intel_vrr_guardband_val() mean?

>=20
> I mean I don't actually want you to explain it to me, but think about it,=
 and
> compare with what the function *does*, and ask yourself if the name descr=
ibes
> the function.
>=20
> It's a non-static function. It better have a good name. This one doesn't =
say
> anything about what it does.

Well I did start off by calling it intel_vrr_guardband_set() but then chang=
ed it last second since
Function usually here come in pairs of set/get but yes will find a better n=
ame for this.

Regards,
Suraj Kandpal

>=20
> >  {
> >  	struct intel_display *display =3D to_intel_display(crtc_state);
> >  	struct drm_display_mode *adjusted_mode =3D &crtc_state-
> >hw.adjusted_mode;
> >  	struct drm_display_mode *pipe_mode =3D &crtc_state->hw.pipe_mode;
> > -	int guardband;
> >
> > -	if (!intel_vrr_possible(crtc_state))
> > -		return;
> > -
> > -	if (intel_vrr_use_optimized_guardband(crtc_state))
> > -		guardband =3D
> intel_vrr_compute_optimized_guardband(crtc_state);
> > -	else
> > -		guardband =3D crtc_state->vrr.vmin - adjusted_mode-
> >crtc_vdisplay;
> > -
> > -	crtc_state->vrr.guardband =3D min(guardband,
> intel_vrr_max_guardband(crtc_state));
> > +	crtc_state->vrr.guardband =3D guardband;
> >
> >  	if (intel_vrr_always_use_vrr_tg(display)) {
> >  		adjusted_mode->crtc_vblank_start  =3D @@ -654,6 +645,23 @@
> void
> > intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
> >  							     crtc_state-
> >vrr.guardband);  }
> >
> > +void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
> > +{
> > +	struct drm_display_mode *adjusted_mode =3D &crtc_state-
> >hw.adjusted_mode;
> > +	int guardband;
> > +
> > +	if (!intel_vrr_possible(crtc_state))
> > +		return;
> > +
> > +	if (intel_vrr_use_optimized_guardband(crtc_state))
> > +		guardband =3D
> intel_vrr_compute_optimized_guardband(crtc_state);
> > +	else
> > +		guardband =3D crtc_state->vrr.vmin - adjusted_mode-
> >crtc_vdisplay;
> > +
> > +	intel_vrr_guardband_val(crtc_state,
> > +				min(guardband,
> intel_vrr_max_guardband(crtc_state)));
> > +}
> > +
> >  static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
> > {
> >  	struct intel_display *display =3D to_intel_display(crtc_state); diff
> > --git a/drivers/gpu/drm/i915/display/intel_vrr.h
> > b/drivers/gpu/drm/i915/display/intel_vrr.h
> > index 19c7990be1b2..225e2607c9df 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> > @@ -24,6 +24,7 @@ void intel_vrr_check_modeset(struct
> > intel_atomic_state *state);  void intel_vrr_compute_config(struct
> intel_crtc_state *crtc_state,
> >  			      struct drm_connector_state *conn_state);  void
> > intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state);
> > +void intel_vrr_guardband_val(struct intel_crtc_state *crtc_state, int
> > +guardband);
> >  void intel_vrr_set_transcoder_timings(const struct intel_crtc_state
> > *crtc_state);  void intel_vrr_enable(const struct intel_crtc_state
> > *crtc_state);  void intel_vrr_send_push(struct intel_dsb *dsb,
>=20
> --
> Jani Nikula, Intel
