Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82505C021B6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 00:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3063510E503;
	Tue, 25 Feb 2025 00:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmKCZbkI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E3010E503
 for <Intel-Xe@lists.freedesktop.org>; Tue, 25 Feb 2025 00:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740441650; x=1771977650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J7Wc6orI1NDduvfQ7mccNvEFXTL9+se5pbR73lbup4k=;
 b=UmKCZbkIH+CNYkT5jtARWGQgOXElDVtFeqGADGdQWvyMDkGNnMMU8M1W
 wmsmt/f1/Ci0hSzS+s9dw1HZlobI+NJE3pckMlUeeNKbY5RVEc9MUX4Zc
 K+dHhY8P9Psduz0HNtiq/gl7dIF0Gth1DuoSKspcVCNaQQVf/eYd77AQ3
 kfRhNcb5N6Y6M6WV3uFEEOLuNJEnlJ/PXrJhLMl5sEMSPYSZPkHe7kmTu
 1hIEmpMmkjU6CavOVXVYFcIiqVqcrvj82dP13kNpV4IsXjM+3xzhBAUsr
 iwNKuJnyr5hSjTGvmlthkB3g1XuMrZ5Vogzvfcb3V0kxKXPLYif4QXHs/ Q==;
X-CSE-ConnectionGUID: cYkF7wRqSaOdEdqjTGqXvA==
X-CSE-MsgGUID: OrcxjStaQp2CtWDjCY50Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40411662"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="40411662"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:00:48 -0800
X-CSE-ConnectionGUID: ouawBBfVTBqyCV9PIcAYBg==
X-CSE-MsgGUID: L7PeaTe0SV+1Bwp6E6/DxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147088247"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:00:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 16:00:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 16:00:47 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 16:00:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuZ/dpYI/bRuEpT3BVVEcrjArQk+gsVtqDov7OOQnSCNXmYKwtkWgY2833gcFh+h0vujGEbrYjeruOqh3HInY8royp/One5gs5KY5B8zSaJJNKb9qFq6ixrQRcKKMUa+Q17id5jRly0JPWZuMbVwrlDtBelvrMxq6Ji3O8A64Yd4vZ0lCJ3kiGkfE2gikZCG25FH3aKTOviurEaokENo9II1AAwOKlxKq9VY7lCGfnahxMlzFV2qIKfQKSqaFYr9rY9795if2WT+5Dks/RtanioHxesJ8qXaLqt/XQJv3ke/7micGhws+SpbMzxICflbDjrDsgyMJ0c3O/H+uHC87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g739myo6a5LkbnTM1QaPOl3JBShU2CRAj3BOx7+SeDk=;
 b=sMKCG2CPmqwKNhS/gyx7tYW6cst1wYGe1JW4ECkVDRbqUJjGihZ23A+VnPNHGjUro4MhKmcufe395G2khb/Yx8UXZ0hbKQim6bw9a2hQ4NjzAxA9I1L5rVABce2NDzcHbemjaTdwzNragmGtoMzlTGTvvJNehyrSLFmrwM+FYvzQ14yqpGlbdwwfe9J/rhWdLgoZ7FgWfjKcDrmFi7npX73bGz7+GuUuZ+Z1ZmZhQgP0elR42f5SRLPfM+H4iEsP7TESgn4h6+Lsqi06L3pBkoaqSXTocX90oPQV7QshcYmqxmkUdK8Ehke/tBQ/zG0nsyMuPmiiewn7r2Vg+bS/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 00:00:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 00:00:15 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/uc: Add support for different firmware files on
 each GT
Thread-Topic: [PATCH] drm/xe/uc: Add support for different firmware files on
 each GT
Thread-Index: AQHbhwqAKDwDUHyaJUqEgU1tKazrw7NXEb5A
Date: Tue, 25 Feb 2025 00:00:15 +0000
Message-ID: <CH0PR11MB544452CED8E0D584B02A38E0E5C32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250224222124.59345-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250224222124.59345-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4645:EE_
x-ms-office365-filtering-correlation-id: b9ccc79e-c7ad-47ee-f47f-08dd552f624f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OdKEeTn4I+Ci/PySdSsmq4nb6AISb6eWjqw7zY/0ct6/s6TiENS8GmF4jhA7?=
 =?us-ascii?Q?pke0O3GrlTB3wRLJ+nVfGX+D+I2txyOQ8/d3SMmYKYA4HCvDnU18NDqtVb9m?=
 =?us-ascii?Q?zDjHwDQoLpgDLNmgJiFmDnnbKQjm7McVdJ1AaXsulHYe1TUZSCejkMoSM5Kg?=
 =?us-ascii?Q?Es2QdLMuDt/4rNQ8kUxm2OLB16SqvQN5weONC3MNgs/T/pKpr8ni+4rzqMzP?=
 =?us-ascii?Q?ajVPeH0ZR64YPS9ZvJMardbUX/EKRtIzWNRajrvbjhr1AlLKa0jP1TPqipOe?=
 =?us-ascii?Q?uihpRGg5KwMUdAuhlO0e3sXJrDw0HvlNf07Wi0XUU7lhsYji4DwmrC0H/4XB?=
 =?us-ascii?Q?liui+FZoFrJb0aavjU3MKKA+x2bqAKs9CMWqtBBf3I4pBkPZfLn6i03Zo+oA?=
 =?us-ascii?Q?2XYmMZwH/QmrVCgDGlcMfwf/ZCGfOKxhbGJhTYlm85A6MVu2No69Knjv/c01?=
 =?us-ascii?Q?ttrPKa8e/yZcUcI0rnkBnVg7T/Pn04xXNewmStUC4kp8ZoGKQVFO5q0tq+V3?=
 =?us-ascii?Q?2CGHVfm63zJRoeHoxv44Qddv/vldmo23buznxsRDe3g2mJCg8sZmnTgx6dp3?=
 =?us-ascii?Q?Tx9yKYGD7FM48ZpmqEot7FfwPQ0vuRml1I/2qV1qfo7lvZTCwGbt5Q8gxGXp?=
 =?us-ascii?Q?sQ9Vn3iSF4Lpv9wh14PaN0SJHjkcJFzm2xk7RjY9bvZeHgPWtnC5vLCzjxoH?=
 =?us-ascii?Q?bTsYvYd46TgpEhmaGG8/c8fG4IEbblN3lXhjXB0RqHnyB1jZ/3Wyd3omkPE8?=
 =?us-ascii?Q?0Op7AYpaDgqkRo26ET4AMyXCoG/Z7Iv9LsQ32+FdbXG0CfBlfOuJZh3obR78?=
 =?us-ascii?Q?MnfH0FuHXJ8bpLa/09yL5EWS1DtpJADkTVIk2I6La+tn8rxLrc6TZrt/TsaJ?=
 =?us-ascii?Q?tOW72TNL6baw/wefr93DoINjJyvqFqBMCz2nCQoC0jCNuvgBglBfeB6+8CFS?=
 =?us-ascii?Q?34TyXhpgxeTE1euIa6IrotcW5ld+FMH9PnYfvjkVHuEZTO3T9fgznKriwiRL?=
 =?us-ascii?Q?JeBfwDAS5KQR606MaOr34kDX/vKq+KkRZHdT4nMsdACyLavQWxK+sLbXXF3q?=
 =?us-ascii?Q?sd6vV+DcXOLtswiqA5E93dGcklSXUDJYmpKHxmmrb9oPs3yYc631Ne6iGxFv?=
 =?us-ascii?Q?d2/Esu4iQjyb/gqlasltla9Oe6aF9LtdgKvWzEKEOTCYkzcwAbC4aWkflYN/?=
 =?us-ascii?Q?hcT72F5DNk0YaBGS17UuRSTQki/q7JHuGjX0WHEe2t2axlKdUvm8J5b783l0?=
 =?us-ascii?Q?o0q+iYlRWo8CiYmtjDaf89B0JXloRxTH3kJNlaDh5Z3hQxrSbakOlBYDMJio?=
 =?us-ascii?Q?MGPnBue+WZi0FXFnY6DZvzhSQxB+uWnBvdUn0Y/lI7OJZeOcOMImPzzWR952?=
 =?us-ascii?Q?X90eNsK8PgQnyLltgqJI8E8LhMFCfrtaroTYhfEkh3S2d79S33gGuga2zoUX?=
 =?us-ascii?Q?sPGkafR0nUpzFV5CQgW+G74K1vNBCzKB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Uk87OgUI2ER5xixtVdemWxVGEbFjdTbN/eVVO+u4486kZcj10n7IaWa7jOu+?=
 =?us-ascii?Q?z8Aijv/IhQuk2tfPaYwbvnG69aqmifXBTe0GhSY0sE8op+PxuD3Q4ORp2A8u?=
 =?us-ascii?Q?lPm8P0Nh0eJuLfgZJsGbi4lpF6GOMCSVB9Z0pMnZpVO44DqdAfDeAIG9k2fp?=
 =?us-ascii?Q?pgYW+erasaoTQQBBk5vzHaK0LSyBH1KTHWS9AEIka7OMlovDwlL9XAJu8lNj?=
 =?us-ascii?Q?fhCwWrPyo13md6TnFPI/ZWSU+EabwjLYOGM8R7w2+Vmql+39QH5Xfq3q6ioD?=
 =?us-ascii?Q?ELbEkBmMFIu43B5DwuegGarwUqejowSAcjIQuDPWJ+3HARNQ0Cn98qtYtquf?=
 =?us-ascii?Q?7kirsfsT3tauQQd+BWbzFJglgyOv/NUJEVTGjjbvMdHWiJIumbbKogCNRh1x?=
 =?us-ascii?Q?Puk0n28f1smYoZ5oYy7hndgc5YGnVE9m0TbiSL3t3WFX2d9U7Recbgsx4nlN?=
 =?us-ascii?Q?9BZe0tXXc9SppGwk81jd1SOVqvQUxI8qYow/ljsaIqNjaEQtqIAURfI0gIKS?=
 =?us-ascii?Q?uMcl+kUZZ+Tz+kCRVAh8TV6S5jNSmhdUQnE0ci9A3SiVSWxG6sTeGEX3N3H0?=
 =?us-ascii?Q?XZLOm8xCnp6+fRWPJwcG1lBS5al93JzZ59RifSgMCbQO5b/whGE8JstCCe8n?=
 =?us-ascii?Q?va4j62eIJjk+H5VYVcM8ykiZaSud964cebP/xog+j9Zv2XcFzAVIdRixoXXv?=
 =?us-ascii?Q?F0fV6wg1iRIAg8FQD8hj7utGXMGRT8Dpe2rdBViJ9ivsd8yU7ZrjJqNQsqDs?=
 =?us-ascii?Q?YJ9TuPhbuA0uvR6ecaHq1UkjiVr7aweOy7kB3MWSwm7oML4CiMNwwa73z6ny?=
 =?us-ascii?Q?mbgZRtJeoPZvAY9TE9FueYXIfyBtbs4xux0hQjsN4T1x1Ygn6bKozyYTXDMI?=
 =?us-ascii?Q?MKs4YLaL3zLmd2caxfZLw9KO27NWPIo36rvMjiNZ0hRiQFS7SDu088Ym+GF5?=
 =?us-ascii?Q?cbMivhJpIN64t320x+zk2xZ2zpozQWIfiWypXJ9kOpiPHm+kyYo5Q6pumq+k?=
 =?us-ascii?Q?qZodxRvApyEA6eG4v7FK8f/f8FoS7uj95yRp7Yca1kjeVhNiRm5leN0hXbo5?=
 =?us-ascii?Q?SMAkBDCut0EIdU3FP+Dd4q+2PZiG0l93cW+3usEfZUN75u6sCnNHiCCh+CXv?=
 =?us-ascii?Q?qa6KFvGRp6d2Q5GgqMLWyUArBuzWfFtVUG5WZzWdSC948NsLIMYJb6KHe9Hq?=
 =?us-ascii?Q?ww6kpNPf3BbkUxerkqXvFpnonJoIBzU2eT+BvixoJWIJa9mi2sSPYr9Wo9pG?=
 =?us-ascii?Q?NYfxa9Zld+jQgHyi17QYi3aBGudppcQDb7lL/ilu+Ne+vs3JWGDJkliqU/Cy?=
 =?us-ascii?Q?WnwHVkuELty2LF3fp8ecXlefBxqMz+gMiBmgOgbQDtFxAVkPFQYkmpvDX5uG?=
 =?us-ascii?Q?6nXwueI1b/HTWFEdpVv3ihkiJcqVrMuEumz2WzrzISo3heHxD/lURECbDZxY?=
 =?us-ascii?Q?MARh/Qg4VfTuLXj7f/GfI1B6zw1BXU25OCqY3FppN378IaZSsp0RK7Bdp1AP?=
 =?us-ascii?Q?HhcSdai8jppKiGGq95GvIQtpzPT+GuLQGmgbLz19roHRKPVHmjM8VMEMCjzw?=
 =?us-ascii?Q?8f4rj6K97WrwxTrohYqwfNRlaOQ39cy+Nvdtoa/6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ccc79e-c7ad-47ee-f47f-08dd552f624f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 00:00:15.7521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gD5YoSBxIgwzcQnhRBPjTI71AD+VhHRf99UPxEKA9N4HXldtWgtLCLsTTxeGa0OyGuFGd2hVnVATleA1GN1eBCE5gcSalqZvaNDV+NBQswY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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

Some minor nits below, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C=
.Harrison@Intel.com
Sent: Monday, February 24, 2025 2:21 PM
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH] drm/xe/uc: Add support for different firmware files on eac=
h GT
>=20
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> The different GTs on a device can be very different. So add support
> for being able to load a different GuC firmware image that is tailored
> to the specific GT type.

NIT:
Commit message is good, and we can leave it as-is.  Though perhaps consider=
 this
rewording:

"""
The various GTs on a device may contain differences that need to be account=
ed
for by firmware.  So, add support for being able to load a unique GuC firmw=
are
image per GT type, tailored to its usage.
"""

>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 73 +++++++++++++++++++++--------------
>  1 file changed, 43 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index 18e06ee9e23f..eb77528628f2 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -98,6 +98,7 @@ struct uc_fw_entry {
>  		u16 minor;
>  		u16 patch;
>  		bool full_ver_required;
> +		const char *gt_type;

NIT:
It seems like this value is currently only ever being set to an empty strin=
g.  I
take it this may not be the case in the future?

>  	};
>  };
> =20
> @@ -107,21 +108,21 @@ struct fw_blobs_by_type {
>  };
> =20
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
> -	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
> -	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> -	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
> -	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
> -	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
> -	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
> +	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1, ""))	\
> +	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2, ""))	\
> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2, ""))	\
> +	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2, ""))	\
> +	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2, ""))	\
> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2, ""))	\
> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2, ""))	\
> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2, ""))	\
> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
> +	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))
> =20
>  #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
> +	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1, ""))	\
>  	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
>  	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
>  	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
> @@ -136,30 +137,30 @@ struct fw_blobs_by_type {
>  	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
>  	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
> =20
> -#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
> -	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) v=
ersion__ ".bin"
> +#define MAKE_FW_PATH(dir__, uc__, shortname__, type__, version__)			\
> +	__stringify(dir__) "/" __stringify(shortname__) type__ "_" __stringify(=
uc__) version__ ".bin"
> =20
> -#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
> -	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## . ##=
 c))
> -#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c)			\
> -	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
> +#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
> +	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a ## . ## b ## .=
 ## c))
> +#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
> +	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a))
>  #define fw_filename_no_ver(dir_, uc_, shortname_)				\
> -	MAKE_FW_PATH(dir_, uc_, shortname_, "")
> +	MAKE_FW_PATH(dir_, uc_, shortname_, "", "")
>  #define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
> -	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
> -
> -#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
> -	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
> -	  a, b, c, true }
> -#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
> -	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
> -	  a, b, c }
> +	MAKE_FW_PATH(dir_, uc_, shortname_, "", "_" __stringify(b))
> +
> +#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
> +	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
> +	  a, b, c, true, t }
> +#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
> +	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
> +	  a, b, c, false, t }
>  #define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
>  	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
> -	  0, 0 }
> +	  0, 0, 0, false, "" }
>  #define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
>  	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
> -	  a, b, c }
> +	  a, b, c, false, "" }
> =20
>  /* All blobs need to be declared via MODULE_FIRMWARE() */
>  #define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
> @@ -227,6 +228,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_=
fw *uc_fw)
>  	};
>  	static const struct uc_fw_entry *entries;
>  	enum xe_platform p =3D xe->info.platform;
> +	struct xe_gt *gt =3D uc_fw_to_gt(uc_fw);
>  	u32 count;
>  	int i;
> =20
> @@ -234,8 +236,19 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc=
_fw *uc_fw)
>  	entries =3D blobs_all[uc_fw->type].entries;
>  	count =3D blobs_all[uc_fw->type].count;
> =20
> +	xe_gt_assert(gt, (gt->info.type =3D=3D XE_GT_TYPE_MAIN) || (gt->info.ty=
pe =3D=3D XE_GT_TYPE_MEDIA));
> +
>  	for (i =3D 0; i < count && p <=3D entries[i].platform; i++) {
>  		if (p =3D=3D entries[i].platform) {
> +			if (entries[i].gt_type[0]) {
> +				if (gt->info.type =3D=3D XE_GT_TYPE_MAIN &&
> +				    (entries[i].gt_type[0] !=3D 'g'))
> +					continue;
> +				if (gt->info.type =3D=3D XE_GT_TYPE_MEDIA &&
> +				    (entries[i].gt_type[0] !=3D 'm'))
> +					continue;
> +			}

NIT:
There may be value in breaking this block of if-statements into a helper fu=
nction:
"""
static bool check_skip_auto_fw(struct xe_gt *gt, const char *gt_type)
{
	char tag;

	// ASIDE: Probably unnecessary check below.
	if (!gt_type)
		return false;

	tag =3D gt_type[0];

	if (!tag)
		return false;
	else if (gt->info.type =3D=3D XE_GT_TYPE_MAIN && tag !=3D 'g')
		return true;
	else if (gt->info.type =3D=3D XE_GT_TYPE_MEDIA && tag !=3D 'm')
		return true;
	else
		return false;
}
...
	for (i =3D 0; i < count && p <=3D entries[i].platform; i++) {
		if (p =3D=3D entries[i].platform &&
		    !check_skip_auto_fw(gt, entries[i].gt_type)) {
...
"""
Just something to consider.
-Jonathan Cavitt
	=09
> +
>  			uc_fw->path =3D entries[i].path;
>  			uc_fw->versions.wanted.major =3D entries[i].major;
>  			uc_fw->versions.wanted.minor =3D entries[i].minor;
> --=20
> 2.47.0
>=20
>=20
