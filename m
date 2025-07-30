Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFBBC83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 21:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4408A10E6DC;
	Wed, 30 Jul 2025 21:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDZHaSnq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337CB10E0B5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 21:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753909869; x=1785445869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NDAipI3ne0rOS53/Opqfk+OclcxSM7SzsE/erDivNOc=;
 b=HDZHaSnqJoIA7a70+Cpdq/0b3fCIU7t67pRWL/W12vxci8/8rDgq4348
 4bPhl6KqGTnHAeVE8W90sVaeINhiwcuNQJqavYJmc382K332rjGv3vcuD
 12pBHX2PhaJ2LUuxYAgiklqYW4O+KSWhXUnpu5OyFIzo9icpHoFUlHJMd
 YZWHrJ6C+o4gp+0sTLKjUwx57CieVbIKmc/T+qKv24JHosxhClM/22X57
 Ekanm/i3apv9Ml2XUo0zDj8amnKASub00GKWdXmpoSA5Rci4QyF9XAIxD
 r+y6hsGNlCR+TdXqNbVud7rFqNmnDQiAOOtsw+mkI5rwHmthCGIbFey6Z A==;
X-CSE-ConnectionGUID: PxCyEeCTSHajp0bvNGtx7g==
X-CSE-MsgGUID: h3AtwpK9TNeq+m1o3MEIVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56303212"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56303212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:11:08 -0700
X-CSE-ConnectionGUID: KKOBGggARbiuLVDBP9BWTw==
X-CSE-MsgGUID: BbHOMzXsQ2+v/ib90dvlOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193930600"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:11:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:11:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 14:11:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:11:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOML4f7cmHWRQ7gth+K2aAA1B6RXj7b/mTD63LTpHZvpLXyCPlJIX3XLnqV/GtvN2bnFS4fW6S0nT+8h90ZNwloiNmb8MK7KfUSm9w6lBqmKnribeVUgyu+ItLwOPnigfn5gTgA7aDyFujrmBz7W5GmX/7zeKvcB8kJ8ZYAMWnTnn36/wvvgRUyOglKW01kwzx/O2DVFyrRVypYtcEH2vxQ0wX6GH8GPeGZ2fJqKqaYKJKvR8MB4PfB5Tda+8hi1JnyfBvBygMnjH3kyKIl+epkmjtl94xOiGHR4jWH4lL1Q5taf0ovDYEKdVjSq0zcxy+m/bwhitdG+g46o9/5NDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ka2GJ9y2e4fyHO+1J0opVXV0DfQW+EIKe4whRuqy2E=;
 b=a2BfSIv+wgDfypRvz2j3e0CW4Jp4Zc0BAXbaUvD9PLK/XxkxlQBL/9mCHoxknXdRo3zvIJxC0jPX/sIpuBbbNRA29jVp/tRE3ItDvoaRJYnqBup4M4VJQaZ1lbPAzArbBmGcRxJkcwqvo2jneLgTG5iDBguf9GnVujf0qLViCuwCc3QERsXUUGgGrUZf7tTVUq8MpV19La0ddPQfEUwG2717Dv8tHNWwUSsraDEqQ6oRjU9V4aEB3UAPQ88OSEFiYXLhqJPB9HORAljVVf+nHnVUjzqxpQwkieVL4gTylhqzfB5DQAFPXokep1Rbvufvh9p060+WSWeXBs+bT5kDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 21:10:23 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 21:10:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
Thread-Topic: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
Thread-Index: AQHcAXpWJmC/YuphWEiamZ/sioJcAbRLHULQ
Date: Wed, 30 Jul 2025 21:10:22 +0000
Message-ID: <CH0PR11MB54447BED0BF0F6D4F435D43FE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-4-michal.wajdeczko@intel.com>
In-Reply-To: <20250730174913.178434-4-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB5319:EE_
x-ms-office365-filtering-correlation-id: 65c8d07c-8bcc-4dc1-7b01-08ddcfad7f6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8BIrVAQApI59/xRnObiWkZ7CKthVPWb60Vo9nOXeat3KxpooNt6cxj04J3Ql?=
 =?us-ascii?Q?VTQlg1zb0JARYcMJUmfdhlwJ1V6gX3/SnQ7lACMcKo2NjMyHxiJEO8kw604h?=
 =?us-ascii?Q?AQLGucikdSkwLWws4iBxggvml8MEBf8FIwJVFMiqXpBUEGN2HmEZz/q5v+mt?=
 =?us-ascii?Q?XodXACv5rOlEfwF3Cvxs9HLIxbGyA1qO/aw6mmOrSKZNeJo7jahlgybz0U+E?=
 =?us-ascii?Q?U3C0VjhUBCCUdPhzs3S6at2z7cwtYqfwxBHitVG6J7M4i32xSzcOq63guEiK?=
 =?us-ascii?Q?qQx92HOQ6g4rJAnPpSSWzU+43bcgODTxD9DDpGBmdgSAtZbgqa5AoQWz1ES5?=
 =?us-ascii?Q?KYE/Gaf86446xAjLFeEFUUeE8IZfMJPqZQq1g/EK0jiBOjdczTw41bHFzo0o?=
 =?us-ascii?Q?B/PM0VJvEn5caUfOlL+eJc/rc0xtQ3DJ1fsqYBKRtgzc0ptUofaRaH94HhLT?=
 =?us-ascii?Q?it33iWC62EDho/YFk3ZVz3pKfXVFihKu04JCbIqY4U0a0seSbJiqn8LKhnEP?=
 =?us-ascii?Q?WzmmxYJZ9H2LbTt2PofjVIoyz0Ns4c4xIjxhcwFn3XojzZv7s44X3vlIh02O?=
 =?us-ascii?Q?nPJ7QhkiZPer3W8kwSGhD9jl5mWYbDyhGYPBKS5aS+24Ua19+TUTGoDcAGP4?=
 =?us-ascii?Q?oR7WpiMgFa6xZDohr6FBJDOjfcH5r6TZmcXNrnzoGm8tVjwo2ufM5Qpi+nVl?=
 =?us-ascii?Q?9PsSl1OWm9+iKMjh6I9v0aUz837VcmPGR7ZFSMYUi1FDnXFt7DvhJlWBG44w?=
 =?us-ascii?Q?/0VaXpKEWB42yN80GhxGsuZloCwmKiFBvv1YH+1b0Z4wli8dSb3qm6tifpir?=
 =?us-ascii?Q?OBU8ZKhHkvdFs79fKoE/zKcuZ1yypgweHOGg8TrTGQ0t55Ls3e8TMRvHdvI5?=
 =?us-ascii?Q?DenRMR4fUy01WE+hLrEZ7eupY8cPcoAw7XjF6G8s9m5g5h8mglsthMh8ay0D?=
 =?us-ascii?Q?EfHSJlZbo6eGkHQ9eZHYgnHFJyRwOBVywH/E07/omjdEvGcez7RATh8hunBO?=
 =?us-ascii?Q?P79J3wT3rxrT3HI5T6Mbm4NfEg2qJ6If6kPadXG4ANstFj02ka8G1VPKLtaN?=
 =?us-ascii?Q?a7Dj7DMX5NepfjV2QXyrsEfnpdfRLdoJvicU/f6bxoJviSZjxGRYsR1hLHR4?=
 =?us-ascii?Q?Uxvg6lOaawq/DQaXCxBexISAhr+NbKvYpBNd+9btvAvKC6rgJ1Ifjbm9pWw+?=
 =?us-ascii?Q?QVbSx6vhCOR/BKH6AmoaHJ+JkbqX0jp3HY8RPENk+dAPd82lk0gc6GmcZkQv?=
 =?us-ascii?Q?PUXIH9oCj9QV1pKe7ePKdJoFN/qT+2JGifVXui997UW4jScCCr6hyqwUi9WT?=
 =?us-ascii?Q?lYPdPniI3QlahwgLW+kiXIB79hbV87llqz8uRbyBfBfW+9l3DEsxfVAAFHHn?=
 =?us-ascii?Q?FgT0/IDu+J9zWTj5moCYPBp2hSNSWoYrhF3qTfCRKjs79k/Sbcg56uh0xdTD?=
 =?us-ascii?Q?KpGBOvBVPVwKF4ayszv+g+YLM4PcDv4yaZM8UHT3DeoQmR0NEf4kaA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mZab0mN0ZeKxw3P9XIeZXgLwak9QKYNlOspRRLGHUi+NXeKYupOJQH6jbk58?=
 =?us-ascii?Q?hIr2SSi9OSeWS0Tf8pzlCaJyTuDxju/YfqxpLyx6lNAUwGhm9BiUqa0uecoG?=
 =?us-ascii?Q?TU+qTlwBMGe1sj4ffIVPwNEBzSTp+5yVUMmIhdtNTyN0B3UXMn6Ub/dyUJu3?=
 =?us-ascii?Q?SesdkqjkZ/9YVGyelr9IGu1MqU62zFYO3KaI1njRAb+T/gg5FJt6swQYT0kR?=
 =?us-ascii?Q?L+svRcBmy4VnzvPVKc2jntHOmmt5N/QrguCzX8R8uMxfO5lsRPt0s/NFWYCq?=
 =?us-ascii?Q?3WjF5s6mzGZkzkd+rninf0qLv9wTDF9xx6VuU64ICxu2zC6P7SMH3fdEJUzx?=
 =?us-ascii?Q?YVeupm0otkvuezUFzyLmdETI2ma5yrvbiijWcB+XCDwW+8hCJijN4kDkilTT?=
 =?us-ascii?Q?WPQUyZjkPOfzbukr6vT81ic9HjxwgzjxIg4VVTPwlcd0rYMvtQgXzlVOSR65?=
 =?us-ascii?Q?Gn+8RIwejTIHjUyH17QQImablxib/Sa8bny2OQwrLYn3/3uAGSXrV+wNvBQz?=
 =?us-ascii?Q?CGexDG1+NqnjiRJicGva6ARKOZ26oCdhihMSLBLrvMm+oVpps/nJvsr3synf?=
 =?us-ascii?Q?xCqgG8BIg37vqB9QnS+zZYYI77RP9AdFjZffbwigB4C/cb8HF30JfPn3szOM?=
 =?us-ascii?Q?3u99+DO/1P20L9S1hnedrt3mXT+CI6gaDYZ2+kwC1W0eM7LQhQr8WJxT67d+?=
 =?us-ascii?Q?2g0NWv38P+/rDZiROsmbqidqs4cQNWm0ggy9AD/ndj12/BWQgD2vO6onsse2?=
 =?us-ascii?Q?VXPPsk1sbxNQ+wyjJmAygSJVlAv/6U6I4HIUizhyWqkF3QHQeLmKeubJQ6Pp?=
 =?us-ascii?Q?ADQNQVej82r/cwnRdxjSEMc6T2+8qQ/ouvy3xU+//715tGBhjIUQlsSTEk5C?=
 =?us-ascii?Q?Z+jZWhX5Zbb0awkz5M26NsV8r0591noaCTcmpM+zYH6b7ErVmxmUlbWdpXcd?=
 =?us-ascii?Q?21QrQCR6uLIb3CoKj8LekbcgidquhBXM/ax9nXMn5VnS4t+l4EhAniAYvG34?=
 =?us-ascii?Q?Jnlh5RDcOvADdqugcOrPQlI0UpwJ/LQrNNQuYi6aJ5hlxyzcgAiXBKChc3xN?=
 =?us-ascii?Q?yJ8HIwI4IVGbeUqTecflIgDzPY6cT9BU1y0WlehNAVBitD07vEHQRHa9Ekb3?=
 =?us-ascii?Q?BrbA30Zfmo1VjAyzgcCfMEXaXG9Oewvvn3S35iejlHajybT1xcac24n1eTd3?=
 =?us-ascii?Q?T1IqjH66lXDiGiQjoi43Omj7AgtKGGlouZuVb4XzBB1nUySCiBgLPdrrw63x?=
 =?us-ascii?Q?yIljHhoCF4XVeUCmsCdVe3DNuMtpajZLQuIUC0Avkh8zHhz+vwRO2OXyjSo4?=
 =?us-ascii?Q?DTuSs7N3xY5ybDCCIdkmfz5F1BVTeOorQw8D5yfBvfgV64dScvlXi/2aNdzH?=
 =?us-ascii?Q?cIeqOMlUVp6tWwTHvAed944Su9DegB9q+40FPjzjR9Q5J5a68gSKLQvea+pM?=
 =?us-ascii?Q?UK3u2ZQh3ood6GXisM94Xmy5qaTJHr8+fLNpLdyouT7Mtran0r1wMUxpDJ2i?=
 =?us-ascii?Q?fP1mM79qJ5C+j7E5j8AZLH9Uu/GqZz+fWBoD34bl9PxOcK4gyFrxXlChUaJy?=
 =?us-ascii?Q?D9TH8v8fqU+Tpz0xrK32RLsL5q627kmSIrRGgHwBWcut31bXrJ3I6ihSbLwk?=
 =?us-ascii?Q?kNGipUCK+mmXMuhY/v9eUyMtLa7YoVjvsuTIrNmV/cum?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c8d07c-8bcc-4dc1-7b01-08ddcfad7f6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 21:10:23.0269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTn4Lvxu0qIgzsVmeyKu6meNHttpXl6JLVFh8ZBUaogAYRGIm3R0PdIRMIprx0K5GDFZcIoErLYxVB0FEr7o419O3TQwJIUqnPT/deYsGT8=
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
Subject: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
>=20
> The PF's restart worker shouldn't attempt to resume the device on
> its own, since its goal is to finish PF and VFs reprovisioning on
> the recently reset GuC. Take extra RPM reference while scheduling
> a work and release it from the worker or when we cancel a work.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_pf.c
> index 8bc7d7f9f47a..0c9012fb625d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -53,7 +53,11 @@ static void pf_init_workers(struct xe_gt *gt)
> =20
>  static void pf_fini_workers(struct xe_gt *gt)
>  {
> -	disable_work_sync(&gt->sriov.pf.workers.restart);
> +	if (disable_work_sync(&gt->sriov.pf.workers.restart)) {
> +		xe_gt_sriov_dbg_verbose(gt, "pending restart disabled!\n");
> +		/* release a rpm reference taken on the worker behalf */
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +	}
>  }
> =20
>  /**
> @@ -205,8 +209,11 @@ static void pf_cancel_restart(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> =20
> -	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
> +	if (cancel_work_sync(&gt->sriov.pf.workers.restart)) {
>  		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
> +		/* release a rpm reference taken on the worker behalf */
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +	}
>  }
> =20
>  /**
> @@ -224,9 +231,12 @@ static void pf_restart(struct xe_gt *gt)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
> =20
> -	xe_pm_runtime_get(xe);
> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
> +
>  	xe_gt_sriov_pf_config_restart(gt);
>  	xe_gt_sriov_pf_control_restart(gt);
> +
> +	/* release a rpm reference taken on our behalf */

NIT:
For consistency with the other two comments, maybe:
s/our/the worker
Or is the pm reference taken in this instance different from the pm referen=
ce
taken in pf_cancel_restart and pf_fini_workers?

There're also some other minor grammar things ("s/a rpm/an rpm" and=20
"s/worker behalf/worker's behalf", for example) that can be applied more
generally to the whole patch.

I'm not going to block on minor grammatical fixups, though, so:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  	xe_pm_runtime_put(xe);
> =20
>  	xe_gt_sriov_dbg(gt, "restart completed\n");
> @@ -245,8 +255,13 @@ static void pf_queue_restart(struct xe_gt *gt)
> =20
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> =20
> -	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
> +	/* take a rpm reference on behalf of the worker */
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart)) {
>  		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
> +		xe_pm_runtime_put(xe);
> +	}
>  }
> =20
>  /**
> --=20
> 2.47.1
>=20
>=20
