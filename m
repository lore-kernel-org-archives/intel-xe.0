Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3E7C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 20:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8E610E9FE;
	Fri,  9 Aug 2024 20:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5KfoGiB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A27810E9FE
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 20:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723236213; x=1754772213;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8JG5S6Ie5xycCBGKuxUHr8sP/4ec/3OK1wH38lHkmnY=;
 b=C5KfoGiBm9q4s2N/pzMJ3jfnoBAJMRDVMAkR/2xFXaSt6ms86OmMdR0X
 pdpzlSqH61SBiuhjcpXvSje9isiRb7LjhsWmDpA2CExVgljHIhPM9uslr
 b50z6bZckZZQqGeHx2QZEgfcXadt0f/ZOkvbyxfpDfmAqmMbFQt9eQvBQ
 kt2IYc1Ug3yX8ZGGoIz/3nomj0MN0UBQn8AYbuoYExAMudK5GhaHWjd3G
 s+B/UHSpyUApJQ8twp45/F1vSrNqoWoGhASI05LsY6MNp24Vcp8qxCp8y
 3muze2S6VTjfl3Y2OT3z7o9ub5vv2UkGKFshl7ixVj7QyE1bIJ44f9wFo w==;
X-CSE-ConnectionGUID: yg5HdtHnSnebi+jUDo1tdQ==
X-CSE-MsgGUID: HVw7yXKcQXKMXen3q15asw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32001936"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32001936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 13:43:32 -0700
X-CSE-ConnectionGUID: wLf5jcCjRdaSTOI6Alx35g==
X-CSE-MsgGUID: pt32tvUwSJqcfb+f6zzJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62619589"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 13:43:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 13:43:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 13:43:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 13:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McCKVKbnddN+PWdFhgCANhqmCBiGWoJQNmekt69Lab01seiGZQvDWGNknsxhqIrT/hjP5Z8JrA7HuKkpvg0AxZVgVgUW+VvHbkFYKQLU0D7jsvyAU9ChSqFWfqxWsTHKGl4hJGvHrpufMjqWZzcRk5NKvFSi1b4jeUPsL3SY9NLe+qMIl85qriPVci7GWKi+BG/dcwz+vwX/gn8l0eChzC8QgdZzGiZpvQrxcB3S4bK3jcyUMU2+ka7k5tE0HKrSY4oL1C3cMSq6IKeHxWh1Osdl6NTjKXS4hfxXSroPxR01P3mxk47CGslBSWFRpde9Gi2KXeW0P4V+AmR8AEoM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SE81pGja3A8cfVSUe4TROxm68kXb3G5+rnsx8N2t+ek=;
 b=TBkqb1nktLY3/NG8U8lPDg8orJEk1LNwPnDequEtC7E4IBkMNEEwTnqLikYCv1zf6qoXUEVVIHtoV2G5KQ6fmlv912ri5DD9hkU2VcqurWIaW55LG5sTlU9z29AATDY4ydtZfWvgNOG3ZUkotyjMBhw7SaAAo9N7Sq+q/jT/7kYhIsZwgXqNx7ZMejP3DYX1o43OIMhDp1jNB/chkyL6kiA4ZZ8eEKaLjqDCCGnz5yrSgTUEzSpVn3WtpwnQEd6TKKSQ4uPcDl8+bvFVuBzVmDRsF2g2eIhOPlVMdfGU0cwyUMIWSwotirP9tQlOiSS9SjBPR5Tz5KNTAjCLmwAfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8762.namprd11.prod.outlook.com (2603:10b6:8:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Fri, 9 Aug
 2024 20:43:29 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 20:43:29 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/5] drm/xe: Add xe_sched_msg_lock/unlock helper
Thread-Topic: [PATCH 1/5] drm/xe: Add xe_sched_msg_lock/unlock helper
Thread-Index: AQHa6pERbhS8d9g2ckOVqmahsmWeE7IfY/Uw
Date: Fri, 9 Aug 2024 20:43:29 +0000
Message-ID: <CH0PR11MB5444B3B45F30A71B19E05150E5BA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
 <20240809191929.3138956-2-matthew.brost@intel.com>
In-Reply-To: <20240809191929.3138956-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8762:EE_
x-ms-office365-filtering-correlation-id: 8ae3be5c-b81b-4748-9d6c-08dcb8b3ecd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sOoY3uXAj0Mp3nGB6QGMOox5mhTxFGSK4SGOzWBDC/VtKDeZRdO5jl8AdI9V?=
 =?us-ascii?Q?f4zifQ+TPVsOUtNVa6uwqIa94vZmQOMy79ahkMaS/wQQ4NW3TBE8h/VKn04U?=
 =?us-ascii?Q?olqqbbZw1lfSDIYc4/5w1zx8X8sfC9WSgWcuezndmPVgubbYspcn73dgGYsO?=
 =?us-ascii?Q?2wcCJEZz9NbQbjdVW+877H/rROwLDXmUOWwWYfkiaroGNP0YTQW/4IHXQqzD?=
 =?us-ascii?Q?qft2GEO4585AfTnVfPoF5KQajFr6J9W9mDE3oBOAEZPREUWXiK8sHJ48PQTN?=
 =?us-ascii?Q?9aVp9f4x3RPRJgCiNKiyey8En+4l8BeMZWbsYkbEYHfUeRyJrqCeikR6oMaa?=
 =?us-ascii?Q?UUfH1FzE8jzk6YtDr6TAO281e+XyUOeKvWIM7s1aphETDJJL+F69pmFuIJsY?=
 =?us-ascii?Q?1PZzP5Vi+LeDtgcn3ItLDTO2mp8ToUkdPK30XdyDcaTDsue7lb/8ojAJPNe5?=
 =?us-ascii?Q?l31boEN+fblYCJtvnParxsSvqX0I6MGDMmL9Z4/ysrBadrtWL2YiRe/TMeLQ?=
 =?us-ascii?Q?tmKBehgXSW/ruHnrS9vVJQiHafuxmZ1KbeGKo7v5OPFOdIwXaqdRxPYsQipc?=
 =?us-ascii?Q?Dqp36njQwzhmdSSOPUpihxD4SHU66DC2yUJV4B2cuffxaFc4Q/iOgnSpBh48?=
 =?us-ascii?Q?i19C62fxgxrnLb1A1i4FL93SL7dbQVyX43UZUOvS4HfjNScZKvIpemvaHPxi?=
 =?us-ascii?Q?5lJhiempEGOY2zhJJvAC5JO6xrViuLWI0X78+SBINqYwb9FLRnPN9F3BE9wL?=
 =?us-ascii?Q?uSwyOrqiOVq3lkcCzBoMIvxcjGRsmvaZqDasphbTwqzEcuBXUTMgnOFnBHJB?=
 =?us-ascii?Q?gb5AUTaGytWH+PJXs/A4xR8e8AIQsDqtT4BxLOTqdfWnWlhMSXWGUdtEw+9B?=
 =?us-ascii?Q?t5/ZluDCXISl/meQxwGUQ5SW+0ObJu0znTU9iKX16m7wPsLFlrJ3Fw2b3InC?=
 =?us-ascii?Q?R1OcKdQkvGtjNw0Xx3jFmZKVP5E/FwcWLN8x3tq4Wzp7gnOEHcbNdYD93A3t?=
 =?us-ascii?Q?2zUI7dIIjaADpUzXr21UksHiulzEkLu5UM3ZA9Z5xswvawX8Y7nQJGLmSdsI?=
 =?us-ascii?Q?3YXbSEYiX1dM61xSlUpvaYO9LYSaZKPalANvxQEYL/VXMG0JmXN6yed34Poj?=
 =?us-ascii?Q?9U8Y/igkTKiCHkjxM3gJo57g8DB2DiBaFkOJhNDYGVP0zT6QbtmVcDlHXTVJ?=
 =?us-ascii?Q?vH6PPe1asTjTJOWFuUZr+tIcYmO/q7J78QKXHnHb22Q5FwiIChnZ/kQIqVLa?=
 =?us-ascii?Q?antGMQmuNm4775RXbwrCLWB4d+tMQotjrAtPkyxDIfCvOswWZ7+d1hlzr9HL?=
 =?us-ascii?Q?M5HsRey2rm8xvJ8wQdTEkQMaBbOrouJZYFbuYgwtlHw8k7JPeFE/MtEnJH2U?=
 =?us-ascii?Q?lnETyepvj7SfM0PQI3RxPziHjSJHMGWSFTNmRzMNN3SVp4EM6A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NevykiYtfmRMu7wTlFvL7/9cBGeCUYaHXOkWY+xX/pDp1wfWKy7xf+Ok6Mri?=
 =?us-ascii?Q?DK3e2luX8JqeZxVvoiugwgkY/ycyW8zJFJNa0nI2IvSRxyyG/qqFCtyQNrM1?=
 =?us-ascii?Q?7Jg8v77AaZGapRjRgEz5SQBmDXry+T1ZyFYrhRBMMSOvJlTcS/jo9AtXWTWe?=
 =?us-ascii?Q?TF8juD4q0Jm5p8ZwIJt8fZrNnT6cP4gSq7fU1bVCnbmh23i+R8e0OgnnUMdg?=
 =?us-ascii?Q?H2MuMGcFk3PqlfjxSVQM5/ZcZXA5aYFLOsoSGaI3draP9bTIetoQ8olsD+QQ?=
 =?us-ascii?Q?CmB4gJt4LYbshJZnvS5HCGdYvubSL/hRZ0HGygv4aVQeS55jz5iIqYCfZcOB?=
 =?us-ascii?Q?mh+Glqio5vickNX6sfDQY2EOU2q4+Swx/XhDhMnn0UkVGxBSyOd3n2dSj6OY?=
 =?us-ascii?Q?nRr3hteNLM3KnJ7d/G1HLejPwca+8dHLv//la3eGXRpZDGCaQk7G3AaD4yf8?=
 =?us-ascii?Q?aG+DOdQLNIjDW2JtJYc1O887yOCuTL5wLu3fygxRo2j3ScKD2YjOe0X0R3Xy?=
 =?us-ascii?Q?9F0W/X11RSDyeexnsjcMzyROlNl45/KDKpky2iCp274+9k1+2f65bHLhZlJk?=
 =?us-ascii?Q?eDfcG4XlZSNkMZEji+lQ86jvesdXHnEdzErwGljSCY8/zgA/6tsBe7T16+A9?=
 =?us-ascii?Q?VqNN+fVxK4L5poyi5UOPqP5n4ypbgqgwPrEro9LZrJ+eAB8dsfVqkEdP4S2i?=
 =?us-ascii?Q?BrrD34fIPhiCoo2F+ciMxVyECtFwhPQfBT/9ZEfwlTl/nFd6z7wP1RYJUME9?=
 =?us-ascii?Q?84Rlr5l9hdnegPt/TufIo08AyEa8Dep90em9rmAghgAHzpRcMiTwwPym5khf?=
 =?us-ascii?Q?WcefFpyn3N3wd9RCk5WH6vlyyAB8xWK8IM1m8xsJHdg54Q+4ujSRNTm1tUEW?=
 =?us-ascii?Q?BUqtYLogqLkWMAKHi3Lupsgu1f6hH7XG1vplHeO3NkUZQzxc/FEnhooYrAaj?=
 =?us-ascii?Q?ez8bzhMOt8zptOgRDk4mQVZ4FrUbQn61a6EC51lTL0w0gdeBlhU62UCUqH/v?=
 =?us-ascii?Q?jHI2oMsT+Ary5SlBd/HQ4Ca6+/dJKhuHwe3/HuAS8SIRsxy7+QgUHFD+Na/Q?=
 =?us-ascii?Q?0VJGBOg5ArUiUVdc7FWzPPp8jljfsMcw64ibXAJbtB5k9ZnYTaFN2S6L6Hha?=
 =?us-ascii?Q?01R4DVBqgRT8sjznNjE4mlbQKuRcMVzQNdJiZDNZ9neQrLFt4bgn0+lBHsiG?=
 =?us-ascii?Q?iWylCQ5fhULsGqwLg3xZGzL9G8VpyyYH3g1NnbkB2SF0VUmXyupjiyr2u/Y7?=
 =?us-ascii?Q?KCCJFX3Z7BiR5HHA+n/Ydy45o2MMogoHd7FzhoV/ML2opLk6plE2yc6nvF7z?=
 =?us-ascii?Q?tkt58Ijfk5YMyA10d+FJZkP2uNlN15rI7RbQMjgsKca7jDCYUPtQUCv9tNJq?=
 =?us-ascii?Q?UjUfDiv80zLfpSTtYK3Tink5umhtq5vSPShPm8XxCTVkF1XBlUnmDWhxpE6h?=
 =?us-ascii?Q?Aok+tkVv2qbgtiOVLMNYcdwdJqNlf/aiplPJ/MYll3G9yYzKGRaAZeJlIZPH?=
 =?us-ascii?Q?EUFB7LJlsY8FYD6UZNXXSxo1QmidRC4TDMWtFpflLqrZvnQUOgKETOqUSJUE?=
 =?us-ascii?Q?cX1geSkzqe/F94yKdkBtrLoWD9ivoX9sV4c8oKn/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae3be5c-b81b-4748-9d6c-08dcb8b3ecd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 20:43:29.1451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWMx3s2bETN46/n8UFyNETFGTsZCZLai+qXFg8atmP6n96QY3x/YXN9m6VI6qPoSylKOBLPGNNgm5k4f1xeUF3TTHwMH8/tw7X6DBE5vWuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8762
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
Sent: Friday, August 9, 2024 12:19 PM
To: intel-xe@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH 1/5] drm/xe: Add xe_sched_msg_lock/unlock helper
>=20
> Will help callers to own locking when adding messages to scheduler.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

These wrappers/helpers look good to me.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 12 ++++++------
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h | 10 ++++++++++
>  2 files changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> index e4ad1d6ce1d5..eea71c67cf2a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -15,11 +15,11 @@ static void xe_sched_process_msg_queue_if_ready(struc=
t xe_gpu_scheduler *sched)
>  {
>  	struct xe_sched_msg *msg;
> =20
> -	spin_lock(&sched->base.job_list_lock);
> +	xe_sched_msg_lock(sched);
>  	msg =3D list_first_entry_or_null(&sched->msgs, struct xe_sched_msg, lin=
k);
>  	if (msg)
>  		xe_sched_process_msg_queue(sched);
> -	spin_unlock(&sched->base.job_list_lock);
> +	xe_sched_msg_unlock(sched);
>  }
> =20
>  static struct xe_sched_msg *
> @@ -27,12 +27,12 @@ xe_sched_get_msg(struct xe_gpu_scheduler *sched)
>  {
>  	struct xe_sched_msg *msg;
> =20
> -	spin_lock(&sched->base.job_list_lock);
> +	xe_sched_msg_lock(sched);
>  	msg =3D list_first_entry_or_null(&sched->msgs,
>  				       struct xe_sched_msg, link);
>  	if (msg)
>  		list_del(&msg->link);
> -	spin_unlock(&sched->base.job_list_lock);
> +	xe_sched_msg_unlock(sched);
> =20
>  	return msg;
>  }
> @@ -93,9 +93,9 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *=
sched)
>  void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>  		      struct xe_sched_msg *msg)
>  {
> -	spin_lock(&sched->base.job_list_lock);
> +	xe_sched_msg_lock(sched);
>  	list_add_tail(&msg->link, &sched->msgs);
> -	spin_unlock(&sched->base.job_list_lock);
> +	xe_sched_msg_unlock(sched);
> =20
>  	xe_sched_process_msg_queue(sched);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.h
> index 10c6bb9c9386..a54038fb3094 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -25,6 +25,16 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler =
*sched);
>  void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>  		      struct xe_sched_msg *msg);
> =20
> +static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
> +{
> +	spin_lock(&sched->base.job_list_lock);
> +}
> +
> +static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
> +{
> +	spin_unlock(&sched->base.job_list_lock);
> +}
> +
>  static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
>  {
>  	drm_sched_stop(&sched->base, NULL);
> --=20
> 2.34.1
>=20
>=20
