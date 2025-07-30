Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0368EC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 21:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE8D10E0B5;
	Wed, 30 Jul 2025 21:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+dbzr5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6670510E0B5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753909813; x=1785445813;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=40hWleUFlo2HJXLc706zwDzBB+wZB+YN37dE+3MCG7s=;
 b=l+dbzr5kyzeMOc+ydk7/hGFFtn39iPyxbHtonFYGjTXGDDlBkTkJSj3G
 xa2qaksEaHtdNm0zBJzZ4HFJSHtxEdV/uf3ySkOWf0WID6TOSYtrDsmB5
 vxiFVn8Mu1qUaas300+CfhUTTuZ8wphzo517Yv22rhlPOsbWFJwREUH8o
 YxQHgtAzC4p//dErEAHbz1KMFPcwf+A4I5PT+/DSNk4xjfP5CcwDr7S8g
 PlsnaQ9iUsHl8SsPKb0W7n0tq/hCuZhocfvlqFUgK4s3bUG6oTLHwW/SH
 TSQGnFOQr9AgU+E1DNC8Oba2QP+c3byb9AcZnbyWw4nTnnR9tUciLy8L9 w==;
X-CSE-ConnectionGUID: reK72qQ+QyykVXt22VwTUA==
X-CSE-MsgGUID: 9bfZ/Z7ySYKR/wn98cuVwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56371619"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56371619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:10:13 -0700
X-CSE-ConnectionGUID: Dgd7ah1fQJOC6TAjEC2ooQ==
X-CSE-MsgGUID: wm1lo2J3SiugZCHwcyIPug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167573069"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:10:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:10:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 14:10:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgI/W7ZbEz9vZ1hp0s5evNyBG2wYBEaEd5rK8nFfnP5n7Dqu9lLZFoe+T8xMWXNK9PkjCqxv/vfhM78EM3h+cpxZAkJ0GMOc0ueBERRiFIbE0p0pD+MQcDIDp2w8AT0stG5nj4/w3/8KREX5tV3HyyvSOoDOmulL07+5mg5YQIbz4b4YdaYWp53SbRmS1V9U4f38C2T5eUCnNL1Pk/SUPAW++qzw3QFKygdT55sa/gPuSzwV5NRtPr9fuCLccwJqpAzsmJyIXsVw3ybbXr4PyCl6K8RtEWeOFASXySWW+4sKDMEbFdFaPI8hg/Rfqk05egps98+msPuWbvpgEve6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpcwWSTWqcBe2CpDjlDHgC8ftMEyKYAbjo3nh+DWad0=;
 b=yBjJwzYK/CmiBBZHe3MtIHzrwP2DjTl5ey1/2TCKIPWRo1wDNz7UCofXT4DB6AKHDz+7Q3ts5yVAPjq0GBcs34B1jnLG1a/aHJsSeAui+PmqRWBRkpkz3GNxZN9njqIrLigntbn9Ac9+SOWWySS42nWRosqoVr1l/qhroYI+0Nc35jMgN/Ra/9PHt+VhvrlmIJ7oz1fSg4XFt6lp1ZZRPKsYllTP5c2qb6AM2bbn0Kowr66I9ENobde0UWiSIl6Gqx/gplA2A7kEsBn+YvKOuA4mlReDWk2RyskIeQBAHy0mlY453aKI2si7uQ4eHdnQsZh6FO+zgLVLHt+RIEwMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 21:09:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 21:09:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
Thread-Topic: [PATCH 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
Thread-Index: AQHcAXpVQzEqKDLCkUCprH26K5uetrRLCprw
Date: Wed, 30 Jul 2025 21:09:56 +0000
Message-ID: <CH0PR11MB5444CEA80C83A713DEE5CAC1E524A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-3-michal.wajdeczko@intel.com>
In-Reply-To: <20250730174913.178434-3-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB5319:EE_
x-ms-office365-filtering-correlation-id: 7c964674-51af-468f-d0ff-08ddcfad6f7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EEFr/YeOSHRXexVSfb3bzg3JrNPevFakP88Qsd9hnZg30JFqm3K+AciItkU7?=
 =?us-ascii?Q?Wi3gbpeC7OWV9WSnlYueBhcefwd+Dh6gnORKM88G4Lf1IYJEcs6u+sEQ2t2h?=
 =?us-ascii?Q?GYoS59FolIK2z116qTptgmF7hZL7NkED46C72sRnixta/igHXM+a48bM4ggK?=
 =?us-ascii?Q?MXHK4QUzIh8tcLLMs7bbtpPPpPnoJ54Dnb1m0jUO6ZrgjaIvrnn2dzVTNpKt?=
 =?us-ascii?Q?hixYsyAE5NMgqiEXGTzXN9KGAqk2rVCJkAzP1QkjEtdVTasY+P46Jxf4gvuQ?=
 =?us-ascii?Q?3N4fKGYJuOiKV743Poc1nQ+6DZ4v9Sp0G/xy9ET0vLdPovfOFj7A3dgr1F5W?=
 =?us-ascii?Q?Nvnj905nr9Tg+yEIZY6eS3B6uPulANf4AIwm9526XnQQMw6GXpV50iKl/ala?=
 =?us-ascii?Q?z8NZUrFwqL00fI5VHbI4gj7/ZKchNXyTmJbarUI4JaloJPw02azD2/yB05Hd?=
 =?us-ascii?Q?PQXVkEn4ShZWFA9VWJCzVSRlKvM4Frp6S1gmoEHWsG9pcaAWTJlJnX9L7i4d?=
 =?us-ascii?Q?um5V9pkcG4645kfb7nOJHraTJGBaMeXDCOBe8IDoF7lXiXrizd8JGtosE3hY?=
 =?us-ascii?Q?Bt98rqP/gElAjVR1FEHyNFKU4P43Y9mL8NzVVey0iJnbegxdArxJYaSRZakx?=
 =?us-ascii?Q?cACCDmPp/F4ztcHE+hvbAwY7xqP5jtmMinI44SjArpBwJbr6Br3goFgTDQ81?=
 =?us-ascii?Q?Rc/fqHFMVyuxLzACpesKxJk6ImT4VdvieMTIFj0RxDFd9IAzFSUjCbLO99/h?=
 =?us-ascii?Q?hZ3Y4761pnQk/wyXcrpbzDt42lH/BdxhMKxUfptM3NBQDp2w+7/cjKrGHUId?=
 =?us-ascii?Q?zuXPe9VhII4NFtSJ1rjBas8q6TasJ1xuwwxjdrD/+yWStkuPEHu8/WUNy1qr?=
 =?us-ascii?Q?4tmihD8JUZ22tgu04LTa1nNBwltdgJKnygWrzujlCpO0Mq9tkj9z9I6YGlfl?=
 =?us-ascii?Q?5DBC65WnDxoIdKL8eo2TYYEYS9BuCRcRGG1mLkbLrWTimyS7idlBU/6h4fv9?=
 =?us-ascii?Q?ezqHBfE8Eu0+gA+TTKI9Afa0xW+aUSEobooIcJDZSu9pblGWx3d562TRkfmm?=
 =?us-ascii?Q?PaBpVQhNuRawnSvUve8YRj0zYyuGVgHpPApMPyY8vEC3z81nYdX9jB3mh5pf?=
 =?us-ascii?Q?YBU0f822H8AgwpmU2o3kZBMiHXT7dOvmfYBbbUIzeJQF0Nhd0ImsUEdxInps?=
 =?us-ascii?Q?JnMbdo4zpbCr1LR94dFYPRlXG8rWznDBJ4BMNCIaB2H2rluRfpyPJEYI6LsS?=
 =?us-ascii?Q?6xVG2wCo1Ui30tPJtb5OAkfu54t9M//ZAAMUMivmpz/oSLJV2JdZeg0Jmhqh?=
 =?us-ascii?Q?84g6FDvs2MNt0fvKMRpsFhphxhUPR51WNE4/uzmje9NkrQ6K0eX76ptyvYmu?=
 =?us-ascii?Q?8IgmJln62Kz/mXJuPUfY+z4hmiJVJ3Fmok0twMolkWHiIy7NKb1atJonbYpF?=
 =?us-ascii?Q?/CB70BT3ktIu4aoU9Ng0vL9OkxfX9pJuK3HAUB35tt/qRPG80MeQ9Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JJoCSQJqF0Ja6B9VmgvsQJ8lPI9GnRwLHsSr3Azsso9fK6P4EhB0/KCID8wH?=
 =?us-ascii?Q?JmtNKfWMV121R1aN3zonksC3uQJ+xZ3LAZ+5JkQoTeOJg8bT2Nu8aES5fSnG?=
 =?us-ascii?Q?yeM7qTSjZchBIZVJrksYirOu29auuMUm1/tHlbqDXDRQb93EibjX8ttqBNBX?=
 =?us-ascii?Q?LnlmwxMzNBau8cDtG4hm2zTrL7wp2pE8eEGSU5kFiaUaFMDBgWP4SvZNHUjb?=
 =?us-ascii?Q?OECVqRQuj5buIrcwF54uUCHMoJp7mGFWJ8Hw9h8aK1ExG/FEdkdPOyvDlx43?=
 =?us-ascii?Q?ybnapAuv+/hMVGH5Agk3ytJRy/gHoZFczMWpXTUNjtp1p6jLhf6xaU5Dy4lG?=
 =?us-ascii?Q?+mngpvqeRJ1fEU79podxuHqudWdq5z1LelOPSK9ttnM+qPHBaa83HA6i23Qj?=
 =?us-ascii?Q?mnHMCJJSJQ2WvdMu3vCtFBuZzTMS+DO49SGSZK4ZZaWtikMSovmr6Jrn+cnY?=
 =?us-ascii?Q?LBKNgJHj7HUCn5kTI4+5B4fWwXBXaiPuI2WZRpYTBTx+UkIMZF4HGizpDS+N?=
 =?us-ascii?Q?2frR5YVY5qJ19+925wZUGP0C8U2sfMThKVkluH5jRBfo9GxrBDxXYdoCJIba?=
 =?us-ascii?Q?cl11AA6JQh3FVdkpxVuL52+SbbY1a4Cz0MbhzZV0osHtg5nANMLn0jN/5E1Y?=
 =?us-ascii?Q?EGJjld4mTpusPElGsGxyAUkmHKt+11cm4d2M24N+vArE+EIY4uVwTwCPA90O?=
 =?us-ascii?Q?flmqoCQY1B8Q2M+Rr74J6/SFRBEh2qFOtli/W+bUVBcLzdxoGIsGXjLb380E?=
 =?us-ascii?Q?wnv5RJmSMpHjSn4GJmDzSOShkFWv3H9iKpWYL4/LcIdVUwge81TmBws00G1h?=
 =?us-ascii?Q?2hEafA/MEk6rukH6+OIhHs/GGJmydFIbrUvbKPuowl89zKdr02zAqKHRjyIu?=
 =?us-ascii?Q?BxN9tOKT57x11sUn19MNhepW/MHbRBkdT5dKaiXITFAJJGcu8OgRgVZevTec?=
 =?us-ascii?Q?AdmJ42e8DYz6c7FsFeZD0G5+IwvyLk4PmToG0OC0P79+zVNJ9L23BYHNALEY?=
 =?us-ascii?Q?tfyBfXxHUgE/HtqPHE5oItrhM21iuChkojIc4JxzuHWLdi29DC4BPl+IBZ+M?=
 =?us-ascii?Q?9MgvDyWJezBFQhOoIH/BzxRl6OG+P+ltjxM52CowbHgYtoaHD2KtN22MHWfe?=
 =?us-ascii?Q?NR6xSeMnuJTEa35EODyWRR0PGijnbanEKRyzONLENJco++ZsPnjZHKctR6pq?=
 =?us-ascii?Q?eDqB77spFOzw297ts68HStz1hPgqD6NX4aIe9t6HFqhDqF0gxp4lGuyrQpRI?=
 =?us-ascii?Q?fH1dyBRE7nUca4A5jRyFyy4yN9+aFwjQ1q1pq4vhVrMS78Tn6GbEcrDgJVa1?=
 =?us-ascii?Q?pcJZpECL4dx8D/pXi7VlrEd5LL2Je4oL/qoSzIk7zgT+rERpzfS7jwVlZLeQ?=
 =?us-ascii?Q?V6/R9gowP2UedpJwF8nC9s+89gdJQW3+0LEp5h5uT0spfIcS8fTHSJQhCy6j?=
 =?us-ascii?Q?h41SFCFuU8Xsi/k83DjnCGC7VbNzffENjyDn84MOgYgC5ripqKOGLBOfCxsY?=
 =?us-ascii?Q?yXIdDKlzhf22F9erNTOLOQB8GG81EsQcZ0PTGoRN/gt9sNd4rSuEfI7Rlv21?=
 =?us-ascii?Q?Bv16by7bSvvzFeT7RsRDii37pInCwTbzNBm/gZn8wO1JuurlbnCC3NpZXW/j?=
 =?us-ascii?Q?OYx4gG+L67NqFnQvbNF8ntymbtmuSt4kNRPl3PTkzT7R?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c964674-51af-468f-d0ff-08ddcfad6f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 21:09:56.2965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5vM6rGcaTH8K+kKZs8AIVIpkKbxJzJD/AH8GliogTOiD8S96EMgbvR4iOkBBkWd8Uhv97Tbv4yBTae8hQG44+9oXBVVWCFr/dnBraY6GesA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5319
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, July 30, 2025 10:49 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
>=20
> The PF driver might be resumed just to configure VFs, but since
> it is doing some asynchronous GuC reconfigurations after fresh
> reset, we should wait until all pending works are completed.
>=20
> This is especially important in case of LMEM provisioning, since
> we also need to update the LMTT and send invalidation requests
> to all GuCs, which are expected to be already in the VGT mode.
>=20
> Fixes: 68ae022278a1 ("drm/xe/pf: Force GuC virtualization mode")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 28 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 ++-
>  drivers/gpu/drm/xe/xe_pci_sriov.c           |  7 +++++-
>  drivers/gpu/drm/xe/xe_sriov_pf.c            | 27 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h            |  1 +
>  6 files changed, 66 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_pf.c
> index 2761319fdc26..8bc7d7f9f47a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -16,6 +16,7 @@
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_guc_submit.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> =20
> @@ -258,3 +259,30 @@ void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>  {
>  	pf_queue_restart(gt);
>  }
> +
> +static bool pf_flush_restart(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));=20

Asserting here seems unnecessary.  If we're certain that the pf functions
will never be called in a non-pf context, then we probably don't need to
assert the system is in sriov-pf mode here.  And if we aren't certain of th=
is,
it probably makes more sense to put the assertion in
xe_gt_sriov_pf_wait_ready instead, or to have a separate return path instea=
d
of breaking instantly.

Unless the system can exit sriov-pf mode in the middle of execution?  I don=
't
think that's a possibility, though.

The assertion by itself isn't harmful if we're assuming the system would ne=
ver
hit the assertion in a non-sriov-pf context, though, so I won't block on it=
's
removal.  Though a justification would do well here, if only for my sake.

Everything else is
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
> +	return flush_work(&gt->sriov.pf.workers.restart);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_wait_ready() - Wait until per-GT PF SR-IOV support is =
ready.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
> +{
> +	/* don't wait if there is another ongoing reset */
> +	if (xe_guc_read_stopped(&gt->uc.guc))
> +		return -EBUSY;
> +
> +	if (pf_flush_restart(gt))
> +		xe_gt_sriov_dbg_verbose(gt, "ready after restart\n");
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_=
gt_sriov_pf.h
> index e2b2ff8132dc..e7fde3f9937a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -11,6 +11,7 @@ struct xe_gt;
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
>  int xe_gt_sriov_pf_init(struct xe_gt *gt);
> +int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt);
>  void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/dr=
m/xe/xe_gt_sriov_pf_debugfs.c
> index bf679b21f485..3ed245e04d0c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_pm.h"
> +#include "xe_sriov_pf.h"
> =20
>  /*
>   *      /sys/kernel/debug/dri/0/
> @@ -205,7 +206,8 @@ static int CONFIG##_set(void *data, u64 val)					\
>  		return -EOVERFLOW;						\
>  										\
>  	xe_pm_runtime_get(xe);							\
> -	err =3D xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
> +	err =3D xe_sriov_pf_wait_ready(xe) ?:					\
> +	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
>  	xe_pm_runtime_put(xe);							\
>  										\
>  	return err;								\
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pc=
i_sriov.c
> index 27b148eab49c..af05db07162e 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -16,6 +16,7 @@
>  #include "xe_pci_sriov.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_printk.h"
> =20
> @@ -154,6 +155,10 @@ static int pf_enable_vfs(struct xe_device *xe, int n=
um_vfs)
>  	xe_assert(xe, num_vfs <=3D total_vfs);
>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> =20
> +	err =3D xe_sriov_pf_wait_ready(xe);
> +	if (err)
> +		goto out;
> +
>  	/*
>  	 * We must hold additional reference to the runtime PM to keep PF in D0
>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
> @@ -191,7 +196,7 @@ static int pf_enable_vfs(struct xe_device *xe, int nu=
m_vfs)
>  failed:
>  	pf_unprovision_vfs(xe, num_vfs);
>  	xe_pm_runtime_put(xe);
> -
> +out:
>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>  			num_vfs, str_plural(num_vfs), ERR_PTR(err));
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sri=
ov_pf.c
> index afbdd894bd6e..7e8f3d3ac656 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -9,6 +9,7 @@
> =20
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_gt_sriov_pf.h"
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> @@ -102,6 +103,32 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>  	return 0;
>  }
> =20
> +/**
> + * xe_sriov_pf_wait_ready() - Wait until PF is ready to operate.
> + * @xe: the &xe_device to test
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_wait_ready(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int err =3D 0;
> +
> +	if (xe_device_wedged(xe))
> +		return -ECANCELED;
> +
> +	for_each_gt(gt, xe, id) {
> +		err =3D xe_gt_sriov_pf_wait_ready(gt);
> +		if (err)
> +			break;
> +	}
> +
> +	return err;
> +}
> +
>  /**
>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>   * @xe: the &xe_device to print info from
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sri=
ov_pf.h
> index c392c3fcf085..e3b34f8f5e04 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -15,6 +15,7 @@ struct xe_device;
>  #ifdef CONFIG_PCI_IOV
>  bool xe_sriov_pf_readiness(struct xe_device *xe);
>  int xe_sriov_pf_init_early(struct xe_device *xe);
> +int xe_sriov_pf_wait_ready(struct xe_device *xe);
>  void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *r=
oot);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_prin=
ter *p);
>  #else
> --=20
> 2.47.1
>=20
>=20
