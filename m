Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1746ECEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 06:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC8110E2C7;
	Mon, 17 Nov 2025 06:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYodyNPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D548D10E2C7
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763361688; x=1794897688;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4VGKPyKlyQrfoYK7+BZepRJq7TzvW43k71k8PaSLuoc=;
 b=UYodyNPR4tmOQs0GPLjHDTp+kqu1vAyu7D9LFUrxAuB4TC5V3G1j7MsL
 y11UVFzvJqdiCmbjRwT9k+nvS9H/qJorGzlcKkqflkoGxpUdfqQ2ET7xu
 rrsVoFj/TXPvbBxW1rUJuUQKDYE6fHSbiM0+Tv6EwtgOXK78hHAjrYShK
 t5voR0Y2vFROmnDLFkN9P1NMT0PHHylLdlDETaAQbNV9V8Uh0hBf8QXc9
 s8wt3AxACgymrCWsonUMxwFcpukBYIaYmsUnpB4eqmpP6JN4iZdJI+G6e
 MOUxRo8i7rpEMUUdr8IQQmteS83n5tbP4+g/h+pDWyyDM+CgaQ80RuWlp A==;
X-CSE-ConnectionGUID: iMHTQFbaREazL6ogz3F3dw==
X-CSE-MsgGUID: tyPLmKIVS7Oklm65hs9vLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="69202793"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="69202793"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 22:41:28 -0800
X-CSE-ConnectionGUID: 8n+LBzRsTMm+GlIUDK8T6g==
X-CSE-MsgGUID: eJ0s4J8DSMGq8PJZSLQ+Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213767109"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 22:41:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 22:41:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 16 Nov 2025 22:41:25 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 22:41:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSWcZFCNB4rlYXf5FcM7sBQBfo/HIETvsDwKdap0MmSKMe+8gCCtVjaD2/SnZLStAXvG0pnL0/VICewwVwne2A3hLmybOYJ4u9/ju0tUEmIbX3nJ8E3fG2fW2ij85ZTV3H8SZ1K9JoFaifP+YajBApToeFt0zi/d+D5bKf34EMuoVpJuOaEdL1BJa7U3QZc9tpNjkVMqNrM277OKCCJILArW7OxS0b3NKjg9qczSZqsrGq44bD4zUwJg7tIthwZ+3bzwBRfFStaldB2DbenIkZftguBsvIaAh+DF6LuuwAE7S55YQJo0u+q7Vj3X64n6HyVrkjKJFnbdVOUcu6xkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsf5d3B+I1JzHCZkxFsaprM1aYnfDlcWBPLif5VO8eY=;
 b=LAS4JBF5pEjNtgTVQQ64YB7nq/7Ij/N3V5A8b8qQ+nwwvKmfDuixjgOdN3A0krjfp8G5EudDTifYUZ4BwEXiVTomBpXI1HGSzRrrTJXUDF20Z35wDRG/D39jF5/RALk3vd2WlcoRXail3P/rx3g9N7XEAOzkLFczY963KePJoB2ABFlcxnpEzd0UW9VkNhoYmxTOaxqhjQIljMl+xvxF6sIoffcrdpY7EKTa7lypvx2oizBVo8KpifBEZrLJD7QTsPz7QuScaUuCBHB6zGjZ5r7OQD4/kZfg6x8pb9gHWgCMe7/4E82tzIMFSP82B0WHk2o3CrEm2wgVYwPO8uUsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:41:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 06:41:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Sousa, 
 Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/xe/kunit: Fix forcewake assertion in mocs test
Thread-Topic: [PATCH] drm/xe/kunit: Fix forcewake assertion in mocs test
Thread-Index: AQHcVPb3pKQuXdCyYkG+xfg96LV2ELTyYHyAgAQPxpA=
Date: Mon, 17 Nov 2025 06:41:22 +0000
Message-ID: <SJ1PR11MB6204622EBAC1E86FA824D93C81C9A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251113234038.2256106-2-matthew.d.roper@intel.com>
 <qdbhgnsiknjpqjaliztrpokasvv4g4unbnyu62p5bxgyibowwz@uza4yrzk4f7d>
In-Reply-To: <qdbhgnsiknjpqjaliztrpokasvv4g4unbnyu62p5bxgyibowwz@uza4yrzk4f7d>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7018:EE_
x-ms-office365-filtering-correlation-id: 2a2193a4-2224-4f10-6cac-08de25a452b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2bYqHFUjtYUzrL/eRDb0iHSEpreK8k5q81rOh7JQdvyNLzni7qAlV0HNCIBE?=
 =?us-ascii?Q?JGLwtcuTlCKvLiS0YPNVqwqMZGW5U1FNsdVYkl7XEDgFR90kPO+8NqypzKiB?=
 =?us-ascii?Q?IwqzlYrlgYLn4k9iP5r6tVjGkFMQe2kbqrfjht+NS5s2BHf/n96qmpFhf7+D?=
 =?us-ascii?Q?zQOpe3BvKZ9pxB/hEIqSid53Jgwz2FehfNKhP/GTXCPB1U02o8gRCv2niyV5?=
 =?us-ascii?Q?VXVOjbXZuu/y3Nre3x82rGddxn0FWg9+YkhjpA82X1TIY+eNsgdgG83nD/Be?=
 =?us-ascii?Q?5S/blWzNxDDsLHVbTIKq/0I50HZg7C5c+AnYwIRtGtTf5AQYKDz5mshoqV8L?=
 =?us-ascii?Q?GTMwINRJPV5YoGzCgszJa64FtxRpq9Mt7cNi0/xXwiAzA/e7BNB5lk1BWWDd?=
 =?us-ascii?Q?36hCv0d2bj4wzTOT5PStQMgr7cXhW0g/hmOHU5vrpevGiD6K0VnBkd87yFSN?=
 =?us-ascii?Q?0E9hLkUOCG4kyz0OqwTj8m/RGIeFQ7Yu11fZ9vs9z5klS8LvuUewrJZUif2o?=
 =?us-ascii?Q?u5QJXSSz00viP5WtHY80qYTyuwuvtbyr+Kq5e53y9d+FewPwea+Kto2PfBCL?=
 =?us-ascii?Q?UWSaQ8w2SPEKI2MCmIxjYKojjCdGPSDNv4giqsN7Fqp+nkpvop+usqNwmjOS?=
 =?us-ascii?Q?hOxcLWNoqmW+aofCMWagoy8E8ivGQNUAM3bE6o/5xo5X0i5r0rFu953Ll2S9?=
 =?us-ascii?Q?gfQ0QCaOOpWQDiukGrt8BqxstC9mbjpzxO2Eb+mZDY9hcFi+z3jMO8xuv3Wr?=
 =?us-ascii?Q?9PIx3tZQ4hHeuplJ7QA6mgFOGZH/Tlra97vbd85MQ2KIAQDKDLLDcJ7edWGL?=
 =?us-ascii?Q?ZtbOgUUKBys3CsTJ7Vkc42D1bQsGJMSYeTPPfCNL8hnNjbYdiwUDHQ6xTJBN?=
 =?us-ascii?Q?0lljb30brfBPbmwUvdGk7kMMWp3UADwo3djwClAmvU9SlOINEB+aNKCsVyEm?=
 =?us-ascii?Q?+3Tmr5Tq3enq7ptmUaUXc704+Vize5gyLfFiuewPLn2ie0/DKeK+HISHjf4W?=
 =?us-ascii?Q?rUXpvlNyxPosIrCCWeU5Xz8iXZjivm0Pnda53m5L5s6skOHOpadOMLQeX4x+?=
 =?us-ascii?Q?XoC+i/qPIwJ8J70tyV4iVbLSaYc6AYvCtlkYjlM8xx3fnERhyC3FGQnCRRQW?=
 =?us-ascii?Q?fWU/0/J6vMm+zik6WRIFcmxd7/Zer4mRkEH4urPjQeDCXwu5n8VG4DpMUItx?=
 =?us-ascii?Q?qHsumShnyS70WxQ7r/1GY/6PNal+DArNQqvrA+wEtTqvkDIGaPzwIZxfWq6N?=
 =?us-ascii?Q?sSQhdXNOWJCxcURaFt9KqdwykYSAEtzz8BODJ1ZX9nI2v16x1fLbbvPyWhyQ?=
 =?us-ascii?Q?AfLgR9UPIujjmfkaMVoytZYQYOqAEdQxqc5tH1u84T8TqlriJgLLZFjAU1Mn?=
 =?us-ascii?Q?aaiEojqU4kxA6R0BmD/I6I6YhF0Mkz0piXs9x+BV4HrO27/wlOF21ee0v7Ns?=
 =?us-ascii?Q?tBF6/Hvvdc7fXFEjylwono4YEJWAbumt9XKxI0Z6beDXKSVFeY6+o/+fhIuf?=
 =?us-ascii?Q?QGxru7x4Q4Fg/xrtZcIk97OXUvOP1t7EXM2m?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hEF2sPVv/CS0jrHCjneaMKrLdL72fvVltpluBPvr2BqfgsCLIYsjHPxhAcV4?=
 =?us-ascii?Q?u3UERyXB8VIrjYjHFZpk9RnTcvPtHLtFKhqXFGrVj4AOqjL4IauQ2O/OuWvo?=
 =?us-ascii?Q?33CDBZfYDL8QNzvXiIz0iuEtvAumtCqtBPqVpLb6ECWmHf9BN4Fc5nUOaR//?=
 =?us-ascii?Q?nkeGmsCOmxtEv3rScZf70fUOjtJXfW6G6JmAZyzbNOgYRnlT6aw8/zmVmvsF?=
 =?us-ascii?Q?0mFqdoj8wmIuYxV2Ci6tDMFvqT7X4I2sWNQggfooFow20GHN7fWaBE4CPUQS?=
 =?us-ascii?Q?5AMS47wFgjJCZsbCCo5DtUAWdhnUvc8DIH3M1kgeQ/M7f60l2qAJekfdL8je?=
 =?us-ascii?Q?XtEl74yQiJc2IQuCfk5M+4ZRZv1ixHKWePxtrgYApRbaKyHxdvJRdOaqseZ+?=
 =?us-ascii?Q?yqCSktxQ13gYNiQYneQCEIQhXWRZY793gUWSLogkxGuwcV4thjjkZxa9kLca?=
 =?us-ascii?Q?wytJIMyLCo7Wglq8wHbrfqWVNegT8CKWIqnTMBfbu+cQdbAHlB6mTieRGVyH?=
 =?us-ascii?Q?+LE/368Aj5tleriwelem4M4tQeguj2kcvbxQpz3Ri7hFa6xPetKBmgvGE1I7?=
 =?us-ascii?Q?Ad0omuY6atdcQSSZAywCevm/FDkDU3rziAvqlu40x7OtnqGdDKPbQyD+ZW7U?=
 =?us-ascii?Q?g/5y2R8qbdiKxdlh8awXdzqqSaj+bhX6Yx+pYRq7+kQpKPm5hyDXyJD4n9oO?=
 =?us-ascii?Q?HFqy8qcdblstc7AbnsyTlu/vnqEZjCv7I2S5iyQUssO+pP0h/6IJ7uoTXVNE?=
 =?us-ascii?Q?lYeT+9lBik0lhBqW0QWwN4nUJbzFvYS1S17jREwwmTi8UuhzQGlWfUCSMaTX?=
 =?us-ascii?Q?bdWVFMyP09pQbcHxFUvfK3XDiJW/MaGWfyAB1ClFpLW/XyXY4LDUDNjW9hGt?=
 =?us-ascii?Q?CviiU9MeAXirdXn4VgOdF8VKTsD61E35oUuFC80yGU8EpKa5fkM86eVJRc43?=
 =?us-ascii?Q?ircNek3xcDCtKVwkSbgb0eVsQfZZc/ATMw0gXfCpex3kzROWCWVWUqUz2kQ3?=
 =?us-ascii?Q?jhp3Ao1Zu1qlWlF4jJdjpeL8givR7hsMYHh/jY586P8n85o36jAPTI5Dc8iU?=
 =?us-ascii?Q?iA50LFjTBxCxKRnGr2pqRNnwyR8VdrhUu2T0MmAQIeoiTXsapV5oyrvnQINJ?=
 =?us-ascii?Q?9VKF9kMR6ja2HCf9vBr45H2Mae45TA4A3HiQkuQ6StLRIaRMUND+UEP8ZZpF?=
 =?us-ascii?Q?fw10P3j2uaXhojB6PQSuGGlGn90Tjxve2EB5Srz1Bq2veZaDEp4wVNDI+g5X?=
 =?us-ascii?Q?TVXLpKKDlTUT/B+eXaKa9AYMMbnE2M+sbi/d9Fz8Wa3WpNkvOZ+N1vJAntda?=
 =?us-ascii?Q?+BR+9vfdfK/PMz1ZH2LUlEdFhK3u3dce804F1NoRp/DhmVuZ5PSdqG/QRGre?=
 =?us-ascii?Q?iWl7hHjKeXJpq9myusY54o4JT95OpmvBApPBozfyoe25KGFxRXmGQXzPmPDx?=
 =?us-ascii?Q?PoWhedYSTSlWo3BEu18Hg4SK3e/whAjmRJE/P/ypZvXU1Ka+AeaDOs107pWJ?=
 =?us-ascii?Q?yJLrD06xvtfK7tuTSmeq9PaOFE6W6FHEikiLTGaRFi27OsSm6VLtq5DdOM+4?=
 =?us-ascii?Q?krmXdQkLJPC8mPbTWm05M9EUfhZCw4KID83rKhCg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2193a4-2224-4f10-6cac-08de25a452b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:41:22.5304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYpmocWIp6/hmKBwFRd5MxGF6yJyWiBxlEowqIwcG5Y5C1JWeXsUeSUTbNDN15VVEzL31IkCYZUOK/jXD7Pk1/u2i+y1offxABI13VkxsFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7018
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: 14 November 2025 22:09
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>
> Subject: Re: [PATCH] drm/xe/kunit: Fix forcewake assertion in mocs test
>=20
> On Thu, Nov 13, 2025 at 03:40:39PM -0800, Matt Roper wrote:
> >The MOCS kunit test calls KUNIT_ASSERT_TRUE_MSG() with a condition of
> >'true;' this prevents the assertion from ever failing.  Replace
> >KUNIT_ASSERT_TRUE_MSG with KUNIT_FAIL_AND_ABORT to get the
> intended
> >failure behavior in cases where forcewake was not acquired successfully.
> >
> >Fixes: 51c0ee84e4dc ("drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for
> LNCF
> >regs")
> >Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>=20
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> thanks
> Lucas De Marchi
>=20
> >---
> > drivers/gpu/drm/xe/tests/xe_mocs.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c
> >b/drivers/gpu/drm/xe/tests/xe_mocs.c
> >index 0e502feaca81..6bb278167aaf 100644
> >--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> >+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> >@@ -49,7 +49,7 @@ static void read_l3cc_table(struct xe_gt *gt,
> > 	fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> > 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >-		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
> >+		KUNIT_FAIL_AND_ABORT(test, "Forcewake Failed.\n");
> > 	}
> >
> > 	for (i =3D 0; i < info->num_mocs_regs; i++) {
> >--
> >2.51.1
> >
