Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6EBC369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 21:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F5510E88E;
	Thu,  1 May 2025 21:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjCU+D7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB7710E88E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746136233; x=1777672233;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WoMXCaPbPpLXWqroeTdOFwfPcXZUctukpGO97JzRCzc=;
 b=hjCU+D7aWej6GYAU3AMNDHUfLZJ7/RoLbLrXfqFZ95QuYumKevtclgcJ
 kd2S+gBTpGQ/YbkxsPC0BUIC6tjSe4PYbBpi+NmtFAKdCidBX11VF9+Of
 k0RlbwHCOtGe+8jN9gcvgd4RyF5KwqXMWl9RPvCTwugxntygF1MgjepPa
 nzhO5ewXV4UBv/V2nFadTu03WywDBWtzP9rKmPMNNigBMRY9ycl4gIibF
 WNzlqC9+MDqK+dfEaZfrKy4iROeiGE2if35orW3ZAoL+QdTNSYNHH049v
 iFsdP7ahOwQsUDPyxsUVw97uTj7KEfLEw9f+vq1n0MLbaiuMc+fQHlnwe w==;
X-CSE-ConnectionGUID: gUpi85CtRqOAGxouBSmWvw==
X-CSE-MsgGUID: f7CJYzC1QAmTNDOiTLVEiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47702264"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="47702264"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 14:50:32 -0700
X-CSE-ConnectionGUID: ueVVu8fvTyaVAADvBYkYRw==
X-CSE-MsgGUID: 5T+dJffoR96iakQXyItcTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="139475755"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 14:50:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 14:50:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 14:50:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 14:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwHXzJf75e5TQG51pdcpAmf1jar+ghYJ0ALNZ9+l4BA/6QtQsKlfpFCxrI1Ua00XZjVjdo9eAXKs+Ez0jv6OlOL1CXulegKy6Aa1jP8xNfQLlGrcmCjTNlsk42UOvOssZ6vIrOA2Y6HLNZW/FqDUL0RBYTzLvztBYJeEz2gJC9woH6vRlOK2xs3Hzn6sn+WqlVIyeW1uC55rcBlkO+ojDbMmRI/e+JW4BrGDWFj2xu/BlWVllbPEQKISR9eetnefpoeJmdHx3ae3tf3uX/ZFyXbXo9qfUhJrjFVe/4q97Ce9ysGbo+TAUM1FTkdkAaM9oZIKfxTK1I28oO6lRr5XsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Yc7I5Gynlu8kE20LnE9RmQ9eT/QLCbMlY49o1uilGM=;
 b=rnyQ1EEL/MHg503CmcXsS4haPGsuTCJq0rl1GTbhlt7woxqYokPfXxCdLkbu69ejjs11kVKseDQWrlXMjEsnbFDfWtP2kmOKs96N+YNgXk/XhmXV+tquLKTtIUocmkODdID/1Y83LhZ08hh1cNgOBgSZCve0d6LEwHyiv0URE2+eTATudQZZ7zf2j6Cop+yLensEm8S2xc4Oc4xd5Noe5JXifK4q4yCzTiBi5qbQCOmwoz6hOH4KEpe6kCnZhShSJSOt3dPpP4dFR6+d729/QmN9P54U+qaXVYuiv30VJ4r70QdNbDb2gtpPM2Bv0J/UBr38qC8NhczwP5N8t9P95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6906.namprd11.prod.outlook.com (2603:10b6:510:202::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 21:50:27 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 21:50:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Fix page fault queue calculation
Thread-Topic: [PATCH] drm/xe: Fix page fault queue calculation
Thread-Index: AQHbusdsMkeO8fM93UevpI4rdcNc9bO+ToxA
Date: Thu, 1 May 2025 21:50:27 +0000
Message-ID: <CH0PR11MB544418F309C272B5AD1E29AFE5822@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250501183220.72097-1-stuart.summers@intel.com>
In-Reply-To: <20250501183220.72097-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6906:EE_
x-ms-office365-filtering-correlation-id: 199221c6-8340-4b9d-571b-08dd88fa2f5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HAihj96A2NLQO9TlHSwD/hchuJWJHjPK/ttEkwwFjMtNywXEiSeFVfHB7t9s?=
 =?us-ascii?Q?xoM2uX0Toeu18mwt2tvzK8CgufT1/rPfQ0hZdG65mmQdoWuooAf73qRs7P+X?=
 =?us-ascii?Q?h1SnwfA7PfQM3KpYWkXjdNwv6w44UlGBdsq5wOW0rDyCeARJ8cYwomvnfqs4?=
 =?us-ascii?Q?6Wgs+OqePsIL8lCclhHIhC5AKC/24eXsRptGuj8u4uDrHrjUTbdKMb1dzyTl?=
 =?us-ascii?Q?bYBraup07T10eOWrxuLE3gs6voCuIWO9hkscvlNTMZb5HeSUJJnwNWSgBLRR?=
 =?us-ascii?Q?0TjKPRqLfuyAJCxEhN0kkoPsBL2HcFWVoyEEH4tHeFaiLK8iUpYBgaDyNvJj?=
 =?us-ascii?Q?mPd4MKP9QbOF+OyZ+SjK5UrQ+I95fIgow8AuRkLGdZNdnvsgSqWT6UUMBNQ4?=
 =?us-ascii?Q?lufHT46WnPh9Qxj0gxmzVmibmG01cPKhUKJSquyCkfHXyuJ97gzBmgtIn+/P?=
 =?us-ascii?Q?pJF9DW3+dOXkY+P3T1OLRqbhVmLa9y/UV3ND84lrLpnuRKbww2KODCvKwR4X?=
 =?us-ascii?Q?XLq4CCj7lon/1hCqmVUc2/UObEybuABp/2rauGZ/0lyZubqcPi7uoiDoBJtE?=
 =?us-ascii?Q?CvOYHDxpZVNvs+WUtRXZAGZeSv28tbl7r9le+fvyigPe/kffpnLQHhEXJGkH?=
 =?us-ascii?Q?RlchC4z80UyJxPLyXu21QFTpld2CRHx0v7c6j7VcbtZ3L6WSDdfGP3yKDr/Y?=
 =?us-ascii?Q?Ry7hf8qxZFSC8moqVFMSVNspkzw9ODsNwFbudgAuRlJ4oCWQXFjzEHwRTpvf?=
 =?us-ascii?Q?Gp8heF41+rpE3+sPQp/+wckavFdiPQPR+FUlEKX63ZxlFVRSgUBKVFG55YBh?=
 =?us-ascii?Q?B1FBPF1z4Q5niBGUMsW3b07gEkK3WIKmC/wBeIoZRe9BjHNghgiXJ8+E49hC?=
 =?us-ascii?Q?ibjRUT8Hq8hjG643NVoFCXX3HLOU3bTJfk9bIZtHUZskE7FcJflJvcLy7Pd6?=
 =?us-ascii?Q?lDQqa2WmLu0ZSyhbk3F6RhPXUrpwN/1MPhJyOhuQVHPKoPsFcgMSJ/u5qEeT?=
 =?us-ascii?Q?7HwgKr8JXd3kN/2LIkFv44pm7LRruq9Jkf+yIGoGy2mc1NzXTINRxgQNVA8e?=
 =?us-ascii?Q?+KoOU/srsZ6HOYGf5uqtdSCzvmdtENjtXY+dhfHBvVjI9gM/qtdVN3Cgfq/T?=
 =?us-ascii?Q?MpKO5VEobG4l7ULk/mN5d6WJGCmpj94ljnOFg3GP1S9on2IMj63AoQ1OQAS8?=
 =?us-ascii?Q?7Cu8mHSd2hUB5rsNzdd/fGWryOTX93QF0i+mM+Yy5Ws1ptOGPr4bACA8G4Zg?=
 =?us-ascii?Q?zF507icFezOyng4Du4GO5f+UP+PU1A+p4tuMz1dmNEttbGAQFtdcO8XAUEd3?=
 =?us-ascii?Q?JaYWwB4p5BOz6Kz1Q7qrIOo4CeYWtyoKMT+qZiFPG0FQxJcENxNPYUJwe/UJ?=
 =?us-ascii?Q?4ppV0Jci6u5Y9ILhGB//qAV1NqkrsBxLlEP987UebwjGf3vJEs22Bf2H3yo9?=
 =?us-ascii?Q?9RWc4Q/ExrwrZk2mKjSvid1OXq9r/uDe5CjRDeoPH7NJ5CyL4WR9CQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TzHtCYZAHigVdWKTzWkHR4ch8QZ008g+i1hV7DDjgFbciRb4tXO+6iizaO/O?=
 =?us-ascii?Q?u1dV7NBhe9K24FoQYzDJyZmHpyDZ1l5sQY88D8lVeEPLl7tWfaTIlb4pOzLb?=
 =?us-ascii?Q?RhJwfENcCEVoz5xZGg1TiC0HFH6H1poLK251RPHjRD8HhSPbLwAUuu7xFBkj?=
 =?us-ascii?Q?myRixvcf7n1QdR9tKRaAJYXiheJcfjUM/q/baCl7Lj7hfP7yhClVYbvlCP+D?=
 =?us-ascii?Q?iHXlsTMuBfpa5abPiDUFoLOav8hjwBRNYSh2tCmHNL8RicoYHHl2wFJ/HZML?=
 =?us-ascii?Q?65cYA4weNmTKCSX/2NvoRm03HmJ4iVowi+DWMmMqObVq/HZqmBvELyNsmIgX?=
 =?us-ascii?Q?MKQN4MFVraMjkQMpVNE6+pLnlZuHSF4qctlhXsn3dFGMYiYi4gpva599Ny7G?=
 =?us-ascii?Q?cfy7o/K9z/8rYyDv/cWIOe3ULTli3ENFcp15R5JAvXi7kg+PStZYqyWT2Dss?=
 =?us-ascii?Q?oVfdD2C6HTgmv/qLhcg/12d2EbYdPsSuksxYr1IpuSYLXIyKPXYnkz62ZmWl?=
 =?us-ascii?Q?0eVP3rp5YI2ujt09Z68xbLwVciGbI/DVhoGgZgvXNrz7j7tWeC/44LbihQ4U?=
 =?us-ascii?Q?N5aWL9qum//3CxZakrWCwxCFKWOH2sxlITuJUvJ+18wlc+1IQWFlyFZre8qv?=
 =?us-ascii?Q?Xqr8r/uKcCgqEowp4hmIK+bqld31s3uVMFY5nmmT6HZcJHAaVRfR3idj8U/o?=
 =?us-ascii?Q?u53AktPKHALVR9Lqj9b8kgc52DwHGlAWAsYU5haU2whbgNELs6nymhAT3xKU?=
 =?us-ascii?Q?LxLPCWV2F03UgK5yRq6XqyaRUS9r80wuohfI495kN7c8z3saRTiPzEjm9OAy?=
 =?us-ascii?Q?QH9qOexXdLqxUMlADQuHJMZDc7ry28xf9lONQcR4a19eSMlOTk0iU1AZGAsX?=
 =?us-ascii?Q?5O621wIWeD/kNJrICHQKXZomjBxkCuWxgNK1CpvDPMRYbcujZb1eEfNIJ3QP?=
 =?us-ascii?Q?GtczCisE627GpIYErQa3LEwH/JPAARQZXFQjlY+yJhC+pBnqgABhmgjkGlR1?=
 =?us-ascii?Q?ybll9Y5Gsyh0WTzDF1aRaOR2lKbprK/PLXplyFwjguPzMXCye+x1gV6mVbEc?=
 =?us-ascii?Q?Yx4ZONxdwx372yRkmkdu/ywUKXFmP/7GQ1sxVLw8tobSdS2n2Vz8z+w998kA?=
 =?us-ascii?Q?ZsCYUVCz7Plrp/P+lPaNMYqeQMF7Mz3Fu5GS9NUEZokSdmzc3uJx2PqDXhu/?=
 =?us-ascii?Q?26BQk/coNmoj2l9t4UShW+1Q1oDRBwu+u4UDdvGtwoppD1tPij/AS4KcVlIJ?=
 =?us-ascii?Q?pIIdC1r04TNZR7NTVr4AgFGMy2A5Grxm1DM7IjDe22yN5sxi4Hm+BF72/afB?=
 =?us-ascii?Q?HcIMrA/XRnJGy2mqBnK+h4RtOWLI87Y10aWdA+aiF5Cd6t4251c1NnMLYrgP?=
 =?us-ascii?Q?bWzDJiqJY1yn0+OFgU0doNDcmQee8alPSdnXUQa8b31tqV7DdFsGkT1curgM?=
 =?us-ascii?Q?2zHhZDffFgStGWzfudRzHpZoVDZWICW2R7Zn4WpalugUJRyYQUDp7ui2iOP2?=
 =?us-ascii?Q?WPiCF+DZU/kjDGMnrKeSy3X7yWETMbT+AWundgZvBCU5jO0at4GXfjOM1YTI?=
 =?us-ascii?Q?H7f7p0A0QsK+dOFwU83gg6gGdnfyEk8D4Zii4rdE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199221c6-8340-4b9d-571b-08dd88fa2f5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 21:50:27.3645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQG8Nwcqmxm3rZFoBULGit+1HoNtbCSwO19l9wPk+uhSlwDq9+/EVcGSwuNUm49D9hlRFCx1/rQwnFIkMQDmkTm1v1KTWjWArMgpcC3BYQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6906
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Stuart=
 Summers
Sent: Thursday, May 1, 2025 11:32 AM
Cc: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com=
>; De Marchi, Lucas <lucas.demarchi@intel.com>; Summers, Stuart <stuart.sum=
mers@intel.com>
Subject: [PATCH] drm/xe: Fix page fault queue calculation
>=20
> We followed up with the design architects to have a more
> precise calculation for a theoretical maximum number of
> page faults we might expect based on the number of TLBs
> available in the system. Fix the original calculation which
> did not take the number of TLBs into consideration.
>=20
> Fixes: 29582e0ea75c ("drm/xe: Add page queue multiplier")
> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue =
size")
>=20
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe=
_gt_pagefault.c
> index 10622ca471a2..80a816c3837b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -436,15 +436,20 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, stru=
ct pf_queue *pf_queue)
>  				XE_MAX_EU_FUSE_BITS) * num_dss;
> =20
>  	/*
> -	 * user can issue separate page faults per EU and per CS
> +	 * Each TLB can report up to 32 faults. The number of TLBs is
> +	 * equal to the number of render/compute/media engines plus twice
> +	 * the number of copy engines plus the number of EUs.

LGTM, though I would like to know why we need to count the copy engines twi=
ce.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  	 *
> -	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> -	 * without it. Follow on why this multiplier is required.
> +	 * Reserve enough space here to ensure we are able to cover that
> +	 * theoretical maximum.
>  	 */
> -#define PF_MULTIPLIER	8
> +#define MAX_FAULTS_PER_TLB	32
>  	pf_queue->num_dw =3D
> -		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
> -#undef PF_MULTIPLIER
> +		PF_MSG_LEN_DW * MAX_FAULTS_PER_TLB *
> +		(num_eus +
> +		 hweight64(gt->info.engine_mask) +
> +		 hweight32(xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY)));
> +#undef MAX_FAULTS_PER_TLB
> =20
>  	pf_queue->gt =3D gt;
>  	pf_queue->data =3D devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
> --=20
> 2.34.1
>=20
>=20
