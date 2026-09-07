Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43604C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 14:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC7C8905A;
	Mon,  7 Sep 2026 14:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJSnZbwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04E88905A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788790423; x=1820326423;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GeRhdz1WulBwcNYpzNy07J0V5tpF7ApiuSqeSzoZmqI=;
 b=HJSnZbwNbDutkmsSiU5UtWu+qiRPN8xj8ASyhFghb/9EVRGhw56q3RF+
 VMXkurz7gYT55DkQXE7P32HRjQ0LzB9iMDG/iZq2wn/YXlT9ATM7CQfrn
 XvHdX/UM2SQ5sHr6LvJhFj5TXibwhrobI5peEjuwFLa9Vkz0T9dhj3dnl
 G3SRdMgElS0Rl0Y2Hu+4z8ejXO7k6QRJn2n9GZMBXDg7OS2XUGTPWB5Tk
 1UW2GZzuR/z2FmMlZ83drmEeubm7jcBJ6Gh+QbsvrlyQcwgdwP3w7bLGz
 sHceYwz85nvYfqBpT/KiKw5K73ixGHh8cjU5KPUkT5d1WJ7nsKcLcqKB1 w==;
X-CSE-ConnectionGUID: la2MylM5SZmhNhbSNE5Flg==
X-CSE-MsgGUID: y7yhfOkXTfSpLPs0tPvcQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89039008"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89039008"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:13:43 -0700
X-CSE-ConnectionGUID: z3LOqUP6R9O0wzI8EQs78g==
X-CSE-MsgGUID: sUqyeexwQ/CgPYkiPxmv4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272654792"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:13:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:13:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 07:13:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:13:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzHqQ3y31an/dCwtG+faSj0Xcc61yWgmb7IIYZ7HMg0bK07HB4zue/m9kTrhkQh5GPFsER3B8NSIlM52svIDTe2XyFGSu5sAWX7jxWVe4wcl0dZcK4qAU+4mK7mUF6dHJzmotf4LrhJg0eZ8Q55msRXEBOCu31HjD0p78UyZnoA5PoqBUUTagSwDijDRdJFHMt/3tlryKiY1Pn5moWHK0nw2cdMNxW5YeR8SxpsU/+q+F1NdHbftlrx1sDnGpLg5jBemXY3vLCR3exjUAVaIZT0Oahcp0JpEE10vp577Vm9XqLf3bhmUvTNG0QxZeMAGlWPtAUFYAtRjflw9CYufwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlqRwZOHVhN47Gms+9SjOBAQYNpLn+h2WVZyqG8nTvI=;
 b=ESwLqjU6WqaWZjFaTGFnMVEmFT6sU5XczTLos/xp84QnUXPlCubFv//p3DAtQpWCGGZtgnqWTTmPX129HGJ6Hj833SP1rSqrRbOcaZJLSnRXyw4cEia7utPe2iULXhavqNqAJKvdWqrI99sIi6UdEwuTCMKPuenhk+lY1Uur3Ke6xLjHRFEMPCI+twllaTlWAdCRlkfH/WLO0wflTNuSTM3B+RoFYc7y+eeGkbt+5wL9tdLHUGBtM3/G6e/rbNVIdZeUUwkkhVHi08yYV5Y+5aYSVP0KPyKtiTBeyC2DvuACtZOSYyqYhi2q6onU6NAV19XohvrA7MFU9NObi2+nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 14:13:38 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 14:13:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v3] drm/xe: Add multi_queue_active_lrca debugfs
Thread-Topic: [PATCH v3] drm/xe: Add multi_queue_active_lrca debugfs
Thread-Index: AQHdPs929GNiiaNjhUurM4BpblsJq7bDKFIg
Date: Mon, 7 Sep 2026 14:13:35 +0000
Message-ID: <DS0PR11MB8718D37837F644E858FCD8D681B22@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260907134719.999549-2-varun.gupta@intel.com>
In-Reply-To: <20260907134719.999549-2-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA1PR11MB8150:EE_
x-ms-office365-filtering-correlation-id: 8cfcce57-e1c4-44ac-8824-08df0cea34fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10070799003|38070700021|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: EWbRlPS/VG0G8iwHtdej+RxA1CSAgLUvB+3BNu/XHV87QR+tGBwQR5JF2UM8tlywzvhTnq3e5S7DcGGg1qHiIEYmGtnKjSdL1YTUKyKjZT91NbREn95KFBRzxlrzKuQ/WXaqOAjIaZUII5iT71Ngipzeki0WAV3pjLzuNSt8mRZJRfO0HePSilR323oGNUDKCsKEJ/Lx8uqTwiIHZZb6WjkETWVkeaK1TdmOuM3XA5LZmGmD2goRknVtJhAoQNPrngkEOMRSych8r3nPdR4UYuanPRBSKCpffUm3BV7HiIOAodmL3eXSf5Epcswr8N0adzjXTv8yotyQyDCmldRLlDKwSuhKRdWtyC7CVdHRbJPFECHRVp0Ipu+c6GsfQAzMZrFOfrKAXuim+2nvhBna1mGsKwfB8qmq5HA6A4K7jWZwo7kKXoJUVCa+5xgYqNSxtsplfiidkKho68b6NbunMM9OaAVSYWkBPSRjbDNO4ApqXIfHopFhHXmVDh+WM+e5Ucp9vJNlnm6OEKN0wVnlxlS0qsgdXNhG3MyIEFq2W6XO9IVDC/dbttkrgwxQm46EWnphqPBtRww/tJDsHZVKgZC9cyQjmci3e4de+QGvMAE4jGjFkPAxSzwzYR5O/F9zzufVJrSKuWbofw+tWPg7dV/ioOVWPrQsbFPY5oUNm1E03LcmTPBiJa86N82haulRb14ekiEAwVwKJHQsFtt/HdoAQ8K1Y/py88uF4VmaHvw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(38070700021)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aKwJaX8MyyLxT5xBDQ9Mjir5TPYQgAjUumV/IxGJftMHw2bRBf6lc387FeS+?=
 =?us-ascii?Q?qJJesNTTjG0WoGQiS9263pQwT8mgpWnDyDcNbhqO1df4rONhGE5zOrEl28hP?=
 =?us-ascii?Q?KSTLwTtSWslM7Le7wxRf8O3rUvqyasneG/W74uRHl3RUPwRzALN1mQLg60lP?=
 =?us-ascii?Q?5UVbv3y75hdInLiP+aJ3uUJLlhZcEpKJiAqk6j7T6DtY6elugR4Jz/cg1lF5?=
 =?us-ascii?Q?dtDD+EFNSChdi0ueIFq4Yfdr5Bnn/Z9FFXJdOa516mY/OA9VQZSSN1A7ZzMJ?=
 =?us-ascii?Q?9regeFzS9LNb4YT8dEExk8W/uGSiI4NDNILFS6ZHci8VUyzQ/SU7j6xQmevY?=
 =?us-ascii?Q?lem3T5FtIq9u51kuY08CW+xt+iOvnQE8mIaEnDVTCHYy2LuHeqveMvjDTVl9?=
 =?us-ascii?Q?d5gfR7vFqepMCFqT7Irk6gNheO8fgMEMMTBXskRzqrUw+hytNQ/tc15TAY4i?=
 =?us-ascii?Q?XHCtuc2BSUf3ScCHU08y753ZLOGKPi++7L7zyfj6i5lm+XRvqLT5068AvL/i?=
 =?us-ascii?Q?IP7Ehm4oplbirpfLEW3wrKBT3EKisPKzkI2JJZbo3Rx1q4/2uXaF9+864Mh+?=
 =?us-ascii?Q?NYs9uaycsNwFnZe22uindkfPj9PNnvoCqr17kNHFrkR2J4HiFsBpyrsiV3ek?=
 =?us-ascii?Q?L8d/dSEuHMOUckNMtBu24Z/qQhldx9g0O9I3ojgey+l7CtpiTpbgstQ0YIki?=
 =?us-ascii?Q?G6D8yLRkyi7FxkqIfRtqcmE3akFn9RCYn7GrQdi6WiewOX8mv5jSi+/R/ocf?=
 =?us-ascii?Q?xrHVVAp02BRYWBRBRGV6EFbxFIZ0clmkWDWkBxFsH2Q4ncUcsEkQeXsfYHmb?=
 =?us-ascii?Q?fKzSua6Yg2XdeeeDhdPWuDRz8WLX7mpZtoZIPmnA0CPKKNN1KreAtLTpGkPj?=
 =?us-ascii?Q?X9COFM2zLmjX7rcYBrikYekQxZl7bJcdG5nfOIGUfcMV/Y8TMUThUI5IaIHu?=
 =?us-ascii?Q?TnznQJN613FrIdG60tR2oK97ax7dPzR4pQGtzcbiguMga9e5ZpF4B9sGZ+Gp?=
 =?us-ascii?Q?Eet7bGqZKiWjHiO3IWAgoMzorHnyPj6i5VCG6merHWtMS0Watc4UNTsB17c8?=
 =?us-ascii?Q?5QUTANJMBv6GoNPOo/RoKhzHCU2mw8iqaY9XO1QN/D37Y6EIifyz0TRrV0i0?=
 =?us-ascii?Q?2rGGYEU2uJ6QOIb+SQwkAVt7BKbFVhxGgWVFhLNmooP+3lQQNhhu0oUeWTxi?=
 =?us-ascii?Q?Xq4k8Ll/6ab0S5TcRrwg3Ap34znlQ5igT2MK7SLlhkLgvSVePXPWn0U1FpIX?=
 =?us-ascii?Q?f35a28m4S1SKzhIIuEFP8mkW+P3rybdmJKy47kqSrSaQFfH2WeyoQPXmXRQz?=
 =?us-ascii?Q?ao9fZPLGtJyFwGXhvOLSzbHnuvxr7v8n0JZVTc+W4BY3JoW+DGVZqOd/vxV9?=
 =?us-ascii?Q?uedkPTIxpJ9bXHU85k5NzhDtnhkaMmBZ0xN5MKITGxTNAoSSnJSpURrK1Bzf?=
 =?us-ascii?Q?bWRwFyfzJBV2qVbS1rsiB7Cm7anLqcncz9FT9dbOc9+Dmvm+GVPNjecVmmuv?=
 =?us-ascii?Q?HnB4Rr/py2EN7F7ImS6sSitJg57MnKuHcU7ZRSZCOcP2E2jzHbOaXyVxOiIk?=
 =?us-ascii?Q?uEO6E5OzGRq54mJFUb5cwsUksg0Aol+WPFbAOXh/YXiErAZGYH/8uvALFXVd?=
 =?us-ascii?Q?hVe86zrX/aJALpNdv1IFAQOTKxomrQkAenmLU48XjUcRWAyCTYjvu2egIRM/?=
 =?us-ascii?Q?q9iCo3FwPdoFRwNP9cN7JhnTlkyyo/bUJlnm8EuMKk6qZowwypft5UfSA9cj?=
 =?us-ascii?Q?Sbn/Y/DCPAicPpN74obVQ01RYb2m/M29XVIFc+1Apz+gfDFBNLxbUs8PAlrc?=
x-ms-exchange-antispam-messagedata-1: CToyPoEAiZBCWQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: P2DTV4E8j/BNwUn/Kbk6Y5GgwZWuUWjUsKPD3rOH5OiuKBrD/1M7FwcnMwMm/Z9hPrOJ87GP/EbFmqV+yxVUqYQWjjl7KCHxLuzvnz3c5uZz2oNyyoHp15o6NccjA0fbruEj24E213xcdI59n/q3rE/QZr7dMo+rRcOgyj+TCDI+IxQ0feMuo9H38d90wDafam3GnHfy801oxsMX/ip3GOwsOkxoh8RRP5lQK889ES9V7R0h0BMXALZKR5josWgd5yEBjVzmD6QJrvgoym1Y4HiD+TVxH8SqGtHdJ+LvPLS0e1Oo1ImUvlBXO53PIjzFxgD9M6GP0mExbMh6mNKrpw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfcce57-e1c4-44ac-8824-08df0cea34fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 14:13:36.0491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0BmRW4TG+rLU5//wrgUOK3v82pDio3x044E4gbZlr6HvXJpnQCoeiKU9LI5xv5V3SEw+Tz1BZAxPTLoYHEYBOpATO6FC/WDosj9hyCnE95U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 07 September 2026 19:17
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v3] drm/xe: Add multi_queue_active_lrca debugfs
>=20
> Add a per-GT debugfs file, multi_queue_active_lrca, that prints, for ever=
y
> engine supporting multi-queue, the currently active queue ID
> (CSMQDEBUG) and the LRCA of the exec queue occupying that slot within the
> running multi-queue group.
>=20
> RING_CURRENT_LRCA only reports the primary queue's LRCA for the group
> and does not update to reflect the active queue in multi-queue mode, whic=
h
> makes it hard to tell which queue is actually running when debugging mult=
i-
> queue CSB/context-switch issues. Resolve the active LRCA by matching the
> primary LRCA against each queue's group and picking the queue at the
> reported active_id position.
>=20
> v3:
>  - Use xe_exec_queue_get_lrc() instead of raw pointer dereference to
>    safely handle concurrent multi-queue group creation and avoid race
>    conditions (Sashiko)
> v2:
>  - Maintain alphabetical order for includes and
>    pf_only_debugfs_list (Tejas)
>  - Export and reuse xe_lrc_get_multi_queue_active_queue_id() instead
>    of duplicate MMIO read (Tejas)

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
> Bspec: 60321, 73976
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 46 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.c | 73
> ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.h |  5 ++
>  drivers/gpu/drm/xe/xe_lrc.c        |  6 +--
>  drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>  5 files changed, 128 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 361a70234d1f..d7d6f50d8dab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_managed.h>
>  #include <linux/math.h>
>=20
> +#include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -25,6 +26,7 @@
>  #include "xe_gt_stats.h"
>  #include "xe_gt_topology.h"
>  #include "xe_guc_hwconfig.h"
> +#include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_mmio.h"
> @@ -130,6 +132,48 @@ static int hw_engines(struct xe_gt *gt, struct
> drm_printer *p)
>  	return 0;
>  }
>=20
> +static int multi_queue_active_lrca(struct xe_gt *gt, struct drm_printer
> +*p) {
> +	struct xe_guc *guc =3D &gt->uc.guc;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u32 cur_lrca, active_id, lrca;
> +		unsigned int fw_ref;
> +
> +		if (!xe_gt_supports_multi_queue(gt, hwe->class))
> +			continue;
> +
> +		/*
> +		 * Forcewake is dropped before
> xe_guc_submit_active_multi_queue_lrca()
> +		 * below, which takes guc->submission_state.lock, to avoid
> holding a
> +		 * GT forcewake ref across a mutex acquired elsewhere in the
> opposite
> +		 * order.
> +		 */
> +		fw_ref =3D xe_force_wake_get(gt_to_fw(gt),
> XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref,
> XE_FORCEWAKE_ALL)) {
> +			drm_printf(p, "%s\tforcewake failed, skipping\n",
> hwe->name);
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +			continue;
> +		}
> +
> +		cur_lrca =3D xe_mmio_read32(&gt->mmio,
> +					  RING_CURRENT_LRCA(hwe-
> >mmio_base));
> +		active_id =3D xe_lrc_get_multi_queue_active_queue_id(hwe);
> +
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +		lrca =3D xe_guc_submit_active_multi_queue_lrca(guc, hwe,
> cur_lrca,
> +							     active_id);
> +
> +		drm_printf(p, "%s\tactive_queue_id %u\tcurrent_lrca
> 0x%08x\tactive_lrca 0x%08x\n",
> +			   hwe->name, active_id, cur_lrca, lrca);
> +	}
> +
> +	return 0;
> +}
> +
>  static int steering(struct xe_gt *gt, struct drm_printer *p)  {
>  	xe_gt_mcr_steering_dump(gt, p);
> @@ -249,6 +293,8 @@ static const struct drm_info_list
> vf_safe_debugfs_list[] =3D {  static const struct drm_info_list
> pf_only_debugfs_list[] =3D {
>  	{ "hw_engines", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> hw_engines },
>  	{ "mocs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_mocs_dump },
> +	{ "multi_queue_active_lrca",
> +		.show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> multi_queue_active_lrca
> +},
>  	{ "pat", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_pat_dump },
>  	{ "powergate_info", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_gt_idle_pg_print },
>  	{ "steering", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D steering
> }, diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..a39dcb85e3f4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3853,6 +3853,79 @@ bool xe_guc_has_registered_mlrc_queues(struct
> xe_guc *guc)
>  	return false;
>  }
>=20
> +/**
> + * xe_guc_submit_active_multi_queue_lrca() - Resolve the LRCA of the
> +active
> + * queue in the multi-queue group currently running on an engine.
> + * @guc: the &xe_guc managing the exec queues
> + * @hwe: the &xe_hw_engine whose active queue is being resolved
> + * @cur_lrca: value read from RING_CURRENT_LRCA, identifies the running
> +group
> + * @active_id: current Active Queue ID read from CSMQDEBUG (position in
> +group)
> + *
> + * The running group is identified by matching @cur_lrca against the
> +group's
> + * primary LRCA; @active_id then selects the active queue within that gr=
oup.
> + *
> + * Return: the LRCA of the active queue, or 0 if no matching queue is fo=
und.
> + */
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +	u32 lrca =3D 0;
> +
> +	/*
> +	 * submission_state.lock also protects exec_queue teardown: an exec
> +	 * queue is removed from exec_queue_lookup before its
> group/primary
> +	 * are freed, so any q found in the xarray below has a live group
> +	 * and primary for as long as we hold the lock.
> +	 */
> +	guard(mutex)(&guc->submission_state.lock);
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		struct xe_exec_queue_group *group =3D q->multi_queue.group;
> +		struct xe_lrc *active_lrc;
> +		struct xe_lrc *primary_lrc;
> +
> +		if (!q->multi_queue.valid || !group || !group->primary)
> +			continue;
> +		/*
> +		 * Multi-queue exec queues are bound to a hw engine class;
> +		 * GuC dynamically schedules them onto one of the class's
> +		 * physical instances, so there is no fixed queue-to-instance
> +		 * mapping to filter on here.
> +		 */
> +		if (q->class !=3D hwe->class)
> +			continue;
> +		if (q->multi_queue.pos !=3D active_id)
> +			continue;
> +		/*
> +		 * LRCAs are page-aligned (4K) addresses in GGTT; the low
> +		 * bits reported by RING_CURRENT_LRCA are not meaningful,
> so
> +		 * only compare bits [31:12].
> +		 */
> +		primary_lrc =3D xe_exec_queue_get_lrc(group->primary, 0);
> +		if (!primary_lrc)
> +			continue;
> +
> +		if ((xe_lrc_ggtt_addr(primary_lrc) ^ cur_lrca) & GENMASK(31,
> 12)) {
> +			xe_lrc_put(primary_lrc);
> +			continue;
> +		}
> +
> +		active_lrc =3D xe_exec_queue_get_lrc(q, 0);
> +		xe_lrc_put(primary_lrc);
> +		if (!active_lrc)
> +			continue;
> +
> +		lrca =3D xe_lrc_ggtt_addr(active_lrc);
> +		xe_lrc_put(active_lrc);
> +		break;
> +	}
> +
> +	return lrca;
> +}
> +
>  /**
>   * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>   * exec queues registered to given GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> b/drivers/gpu/drm/xe/xe_guc_submit.h
> index ccade320dc69..29abf07d8f04 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -11,6 +11,7 @@
>  struct drm_printer;
>  struct xe_exec_queue;
>  struct xe_guc;
> +struct xe_hw_engine;
>=20
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);  int
> xe_guc_submit_enable(struct xe_guc *guc); @@ -55,6 +56,10 @@ void
> xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>=20
>  bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
>=20
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id);
> +
>  int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c in=
dex
> 25fe9dbc9141..f1cf1463f1b2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -2705,7 +2705,7 @@ static u64 get_queue_timestamp(struct
> xe_hw_engine *hwe)
>  				   RING_QUEUE_TIMESTAMP(hwe-
> >mmio_base));
>  }
>=20
> -static u32 get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
> +u32 xe_lrc_get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
>  {
>  	u32 val =3D xe_mmio_read32(&hwe->gt->mmio,
>  				 RING_CSMQDEBUG(hwe->mmio_base));
> @@ -2739,14 +2739,14 @@ static u64
> xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>  	if (!hwe)
>  		return xe_lrc_queue_timestamp(lrc);
>=20
> -	if (get_multi_queue_active_queue_id(hwe) !=3D lrc->multi_queue.pos)
> +	if (xe_lrc_get_multi_queue_active_queue_id(hwe) !=3D
> +lrc->multi_queue.pos)
>  		return xe_lrc_queue_timestamp(lrc);
>=20
>  	/* queue is active, so store the queue timestamp register */
>  	reg_queue_ts =3D get_queue_timestamp(hwe);
>=20
>  	/* double check queue and primary queue are both still active */
> -	if (get_multi_queue_active_queue_id(hwe) !=3D lrc->multi_queue.pos ||
> +	if (xe_lrc_get_multi_queue_active_queue_id(hwe) !=3D
> +lrc->multi_queue.pos ||
>  	    !context_active(primary_lrc))
>  		return xe_lrc_queue_timestamp(lrc);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h in=
dex
> 7be5e3da8bc8..a8ff4e59a1f4 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -158,6 +158,7 @@ int xe_lrc_lookup_default_reg_value(struct xe_gt *gt,
>  u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs=
);
>=20
>  void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum
> xe_multi_queue_priority priority);
> +u32 xe_lrc_get_multi_queue_active_queue_id(struct xe_hw_engine *hwe);
>=20
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);  vo=
id
> xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
> --
> 2.43.0

