Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C76C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 07:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCEB10F1E1;
	Fri,  8 Mar 2024 07:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIxkKx5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD88D10EE86
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709881210; x=1741417210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yIlQIovvRwvjw2rImyhwvyh1TbaZjRkQRuuJM2W1fWg=;
 b=MIxkKx5i7wgfA5C/IyLtMQf7VDql9RKtJMMcmTCh+KGb8IDMk3hAtpkb
 iZeW+gJUMkarWYFn9/RHYzEOcIXy9ipuBMZbJfGOvIPC9HTGhl1NN4eyL
 cBExBDYRB4EeVINiTKTE9IR7aJmQ3h3UdSYXZ1ijuaOZtE1pVKIU5zldj
 X9Zi1xu+eh3ywGAAqZaveQYyzgANlCzA1ivgzhb1uSHbVzUpcaMSYUDRF
 DgWU6Hh1X0muhFeWjacjJ6vpr/mbzCgRpc3Idaxz6kmQIUQ2gEcinJ9bL
 YwcrzVP8HdJ/3+KsvDhfKzPiZSM3DWeacK9NuQF+RVmxivUB9wveFAQLf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="5186288"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="5186288"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 23:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10785955"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 23:00:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 23:00:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 23:00:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 23:00:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 23:00:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KH3WrKmWU4ptHM4RAEmQufO45GMDHaGqk6qKrr62oYetGj24xFiS3CD/M1lWh5e10MpKbZBnMnDB+IjmYHydQuJLU4B6cAaJzfE5Qye4IHy2HQVVVCpUA3j/lmedmvs8nqIdxk5JApiVwM52Z4tN4YYuSY1UFp4gKeAe0wbyaxVgTUeXr8Oa5n4fd4+JIf9K88n+jtqaKSfP9MSMVpCXOtsI3Ay4lPeLRW9v4mHPby5lNI/EXmJpTJ/dckf0oC8KfdRgBtkacSzhmTzIskpOm8JYSbaPY3jvriOiJX/82Iix5kdnqtitnZ44Or71ulVvy5SVVgPA3jeXsElU0hiJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+YxaQDy2Hc0jPHxpHTo7BRgfk1LPfJxzXWVyRrN2cI=;
 b=DJhhW8E5RTewUJlD7iGyEFga09WFKSG7rjn6N+pwfYzP4PYUKT/q5WxZ4YDY2TYsYtVQRu15l/l8OX+M2wUd1QseSsLz7lF5ypl0LWG30hFbYnh0rrXiytQr1BySnirf/QZFOUY0V+genGBX/yEDP0i4rUGBSU02TEcg+YfmnFCw5KYHlzMg2yHgttUAA5nLCUTNz5F+MxhAGs3mAh+sLn5C5zSHcYHyQ1mvyBqsUd6lafInprwoUEd1imBJGkaIlJ7dWcSuAs6Gvf8pBfLy7gCiYZz/7pmkYHhoggzYNAG/6+l36cJy4eiTKn5pHeESR5wg+suCzkW6LzSPrst7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 07:00:00 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.005; Fri, 8 Mar 2024
 07:00:00 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe/gt: Remove redundant num_engine check
Thread-Topic: [PATCH] drm/xe/gt: Remove redundant num_engine check
Thread-Index: AQHacST3IFv5dRFCc0GHFZXsJ0smjrEtaeCg
Date: Fri, 8 Mar 2024 07:00:00 +0000
Message-ID: <MW4PR11MB70567E7EC0CFD83682EBFB66B3272@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|BL3PR11MB6364:EE_
x-ms-office365-filtering-correlation-id: 5d4bb17e-9847-4995-31f4-08dc3f3d5f3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VcjPYuPrFYzpEz7eNDLkFZJSlKTnVtlLPrAY/uAbfDEpxKqIqqY3NZxciw+YcOv48FRJLdfxoWlKDEv3UGBmFlychsVChIqyAc42SdlbyYKxgwRoUf2/Nvt+I2yJGRVEugEISRsIK3Adyy9rGLWc2E22OpuLR3IU3aRlv1cyuT+Dy6HVNUfJtVVJk5GWB355bOstjAnPSlBgzMqQejYRq4HRHPYrWe7DAL1frJMWYysKinhVyoL+uzOFuUnXRBfyGkT71ftt5maHV6AABVQ9iUsjNmdNtM9kYD37gEYZMEZm5BP+LQHcJYO7cZymPLIT4ZTvmLaRZDoxqe92rGaIE6czUGr8IPVVzj5E4ASJ22XoGar4ZgrUbKXODIxCdLHEiN/ZWeNQMmKl3lua61ce+78ewH8cVVcf3zBjw4yZN/s9TUrCnDfLMejV311F8cx9jm8jRqeM5WkadTuL85uGbmvZ/20p8U1f2t6TWBPg5JzwnvF3dV7SBCaz9SRFDaNa7U0obl5cctYvvHT8qQeLNMi5EMfXtIIuev1tg3rqwAJlH1uu3/UvNlgMTDZAPjtHhAlxMYRWnpPuP/+ArSwRMxJtrZbg/JiRS60YaOjytblkDd1w/V175moOQ3NsgKih1CqsM141cdKnQGtd6SoVE/hxeZNenFvopSo/n668e++j6HZ5Mh5vZcvGvu6iSe6KAGQBEdBfMGY50l6KHZp5Ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?coMx5YcVCX6NqLFpBIcAzs9OwsU6B5Yq1oGrApza/u4AJTYffSjVg0CQovfA?=
 =?us-ascii?Q?uJReRhYG0eBH2Uwge9jtYhDBEOZjXIKfM8IoevxXLLcNPjQh+hlD3w2rYYjE?=
 =?us-ascii?Q?bIu5AwIMVXfVAuLvv+95I+1+w42cAlsrxA3+g5bJYJT0lWy+4ZpFRK9vUz/W?=
 =?us-ascii?Q?Kj7udBNRvOMD2BHzhJbku6F/5BTyYgSmA5iVtnK5q7maKglVVkm+UuPBIz1i?=
 =?us-ascii?Q?Rxz20dj2y4GT0WQ7jagM/aLlzGJtfSBip7uRKwV6x89NoNrgTjlFHU+g2lnT?=
 =?us-ascii?Q?3NO5huJ7O1G+9mzZ4yJXejioj4esWROenQ2VWxB3vw9iJY7oSSTdd5+z9dl8?=
 =?us-ascii?Q?oxoHZ4hz4Ee+fTuHSnuEWzLAe8kqPCTO6mSWZEyG/wmcW11tHg2WnY0/TqPO?=
 =?us-ascii?Q?RWaxPqWwfUwdaULzEhm1cWQA6IGmDEvpTLRRCgc9naCztIMTREBun4LWw4yd?=
 =?us-ascii?Q?K4VDvAjAt3VGXdA+JnZjfps6r51Ui8LEmxJo0uk3bvLOIfMxjmg+Jbu84LD8?=
 =?us-ascii?Q?qwvxg3ZyGrmdJV3ZP73Ew5cjAB3F9PQcq10uc+combfousHohIXcuBSW6n6R?=
 =?us-ascii?Q?0iStr6M0TUdb8JA+gDe7z4dEoODzNdTlmdrJjWLCK53PCq2jQsgUnRrMJvWb?=
 =?us-ascii?Q?YAOf2byOhOUKN7ujhmrO0KC+QUeFGVcLJIU/QmDERGZmB81WNE9F96vv+dGv?=
 =?us-ascii?Q?iiYHunfggsJanvL0WyMWFJvgXUITgsL/SMy5gRypUxuqxbkdsJ/KzNphhXqd?=
 =?us-ascii?Q?2s7e+LLtwnHKjOPZo7IqfsyotG1QV3louNemprt+XJrQzYRik6W64+VOTLaw?=
 =?us-ascii?Q?vfhcGwdmoFCxQVp7sOTbvGwWzuGeg6pWg2IQHS80dcGJ5LD+lXOxNjspgvnb?=
 =?us-ascii?Q?uKveTsYn45U7ztwYFtG9EmxBk4yP4xvwmEgRcqejkIflsbvF0AUq8ROru9tO?=
 =?us-ascii?Q?BnbJBYa4cIkRn82P9I8LIjoKYwRz4wWOg9GmxKioho57VpI5zVEFHLTEEYXP?=
 =?us-ascii?Q?9u0T7yMvrn8UePMJbqF9JJaZV2cMy3Uw7DpQF0zNKUDscOeU5oHU0Y/G4WXd?=
 =?us-ascii?Q?L9HiYqicHh8ApJ6usFd91YFaOMLoXwv1srYUua8BpoleUAl3Gm6Qi9mlQzAJ?=
 =?us-ascii?Q?BFoYNgNjGPkqciXrAx2v+rI3XXiGnpEY6sq1rydgaIx2X0bdvPJRqU5lyUdD?=
 =?us-ascii?Q?rM/7+YE9AiNetfXC1apDixrK2taEbKa1N1uIzNEhkeJQ3jD3L+ArXDPeoOmH?=
 =?us-ascii?Q?OSNtOW9XmkryL6WCUuKJV073R64dSR2Wa8AA5+2WhuIEPPdg0uWOd9QvLmto?=
 =?us-ascii?Q?f54Gv1nedBOmcrYLM8pTx3gr7+VGCLqaT08v8UFtUnJsE/rbuj5OgXW2z5RH?=
 =?us-ascii?Q?5uqVkm3SU9hbnFIZqhdht01sEhcbqaFliLHM8+0Pkt7EXFN0mE8OHTOsdY2d?=
 =?us-ascii?Q?yBnTyWnxTQ19jt7vFr0KVChGJtjAN4Uq+dtghwfMJ5fe09+p6yiJUMHcThvT?=
 =?us-ascii?Q?xm+g2AnbLtEqQcJn6D2OeMpaW9UUka9N1hOudz+rfVDjS1f+y68tg1lBwfOS?=
 =?us-ascii?Q?XjVliL2avKPMFrfb8ZHYKkQGxuRexQ7bu3Rpv3IdQMRG+80uQm0AN5v1O3vj?=
 =?us-ascii?Q?kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4bb17e-9847-4995-31f4-08dc3f3d5f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 07:00:00.2351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ZpTSBZbnZynqfIwfeukOkKTcjPg5bvwMgAUxE0lfdVj6ayXzf2LPZb39J/b7QO+2H5jcX/u7yCS+YHGasQs74oepqYDlHskUFGt40M1Rc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: 08 March 2024 12:33
> To: intel-xe@lists.freedesktop.org
> Cc: Andi Shyti <andi.shyti@linux.intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/gt: Remove redundant num_engine check
>=20
> In __xe_gt_apply_ccs_mode num_engines will never be 0 as it is already
> checked by parent function.
>=20
> Fixes: 0d97ecce16bd ("drm/xe: Enable Fixed CCS mode setting")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 529fc286cd06..2bbd7b203cc2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -22,7 +22,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt,
> u32 num_engines)
>=20
>  	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>=20
> -	xe_assert(xe, num_engines && num_engines <=3D num_slices);
> +	xe_assert(xe, num_engines <=3D num_slices);

LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>  	xe_assert(xe, !(num_slices % num_engines));
>=20
>  	/*
> --
> 2.25.1

