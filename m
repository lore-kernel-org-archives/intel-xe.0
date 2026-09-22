Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78293C98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 20:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7410E2E9;
	Tue, 22 Sep 2026 20:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPQoZUyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E7610E2E9
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790109994; x=1821645994;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HRrJZ5nbO83EtCG4pXx3nnqADBQVjZUm8s80zKSJYZ4=;
 b=DPQoZUyNxSdYa22FqnPLNyAnLnrb1CDO+dMPzZ/paG8H35lT4NFWkCCX
 VFNh5TCTTpaOT0hFsLYDPqTqZebe5m7zA8PhOyllKbH+gsRjMAAO2Aq04
 QXyFCNq6Ei+l3OdR7mYls+CxxpCbvVu7Iu1gJKlA0sjVQ7/wD5Bz3W90j
 1ProAagCH/cttH4vve0d96n+pacHa3hAYq3Gz3cIfA4zNgJNzaAr6Sq0v
 5tR6sjKgSrMHE3xoRQMxhsyqjrKZxEuVy+M6fe6zFMtLtsIonSA9ejxi9
 63qq+G52RW0tA/yC4hbj3jRTF9MTqYToLQz/MmBFG593S3mh58X/f8jyj A==;
X-CSE-ConnectionGUID: Fgt/KVXOQwmvzK49BJxCAw==
X-CSE-MsgGUID: kOiW+SFnRYeHe7yXUmdIXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89885815"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="89885815"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 13:46:33 -0700
X-CSE-ConnectionGUID: zr+k0zEjTGqEJCGYKGyhYQ==
X-CSE-MsgGUID: FXmG6CgtTVurqkXTCkYahg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4584741"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 13:46:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 13:46:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 13:46:33 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 13:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zx65Njy7Sq1EgQrkpYZ1KmpTT4F2nw0PzKn5XCax8JexivMqVje+11sVr9p5WLLQp/HYrWHNPCun2d78EZApj9Xy8O0rynLeArmnHIxFf9MXzBCJwU25ywOQvoKYAcMnrPElh83EBtZRyESr0rv284iPlPscWU/MuDCgsMccuyC7GxqcezpycMgRqmu9xOSw4vSEXtUblFd5+0/G3SGfMKt0TKrQc7zNPgFx2wUXFXerNFLNJmm4rK2RFeGyoMD1EAUfovbu5hrvpxRiI0+iGJfqqnvL7HMar4jwXObaRQY6ptmxefxJcuDv151403AsAzXR+v2LQswd38QNihwbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ec65QgvTUQfcIkHnFfdZ3GgVFuBACOk1I3hblMT0kU=;
 b=aD1e30jFTml9QC+1c3LrOB9tivm4E5dj/E0mFc75AvXAvKPsWZ2Knh5wNomBNVEwSat4V25vR8EFgOj/E4HU6h5F6pJQ0O72YCNJjaqjp2OiyT8hix7v1bvtpEro41xYxYguMp8r+v7+kiyboqaSW9FQqtDXBpXhjKC8iCq3OW7N8vA3iRuX0UekQWz0BXQDhHSZY8rf2AHPKrb8tw2/nhCkg09nTXkMHRhLrU79t8p6oxGv6KOGy6suzHWb824emux0RRHiaPWPUQ146uqkFolt2zujZCpGMmHhA5e9eSvD9H2Rk2T6/dGwBUayo3jxgPeB6RMW6ZP+YnwdU7DqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 20:46:26 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::9f88:5b88:b76b:271e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::9f88:5b88:b76b:271e%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 20:46:26 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 21/24] drm/xe: Add ULLS migration job support to GuC
 submission
Thread-Topic: [PATCH v6 21/24] drm/xe: Add ULLS migration job support to GuC
 submission
Thread-Index: AQHdPLKzwSBVuKkLG06r+AgAM1LMlrba/vZA
Date: Tue, 22 Sep 2026 20:46:26 +0000
Message-ID: <BL1PR11MB54471C764C97663C6282A90AEA832@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-22-matthew.brost@intel.com>
In-Reply-To: <20260904211613.3934307-22-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|DM4PR11MB6429:EE_
x-ms-office365-filtering-correlation-id: 459ea8a9-d447-415a-5cdd-08df18ea922a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: JwQwrUeSkeCsE3o0wjqE5j+BNSxf3M6g1ZlI71bDKytXmMg2tuYvwXAf1VVfUJD1WRwU61gqc4jtzUBF9nHoHC4IVIRQhVmfLFMeBF11HR+mIlUUNHgKxOL5y15jWKmhgjyWDgtkg1SvsyP2ywqaKK1qGvzZ3PqQt2ivuyq6z8M5k04pTA07Vw87ffQn74UDJcXEni11WTXeKC7aWDFTNL08AFYtPwZUsU6g/Ii5vLrIxWEwmKtzZppV+/1MrJl/lKIgAB8hBLVqM6eup11qdmiAylepGcza9CxktiFdHndb7P+RRrpC87AxPtFEB7LmuKFSrcv8KObbJb19JvX8CvGrc17gEysJ5y6TDzPIXUmNr+hvMzSlu8lrAZg7/B1yjudIvCCoNVo4iXbVo71RNUKBBYfExkWbR58p/Byq69NfDf5L0BgZwzxQKEyBtRR+ndF6qk+U+h6PNmOFuAPDHJTUtXR23gtYANEsQOJcLJuIxxva3LEfPQiNZhnQnnGUo9SmzTCKo/Khvc33Umy+gvk4qdMIqRdEIDNBM0gdYV5MXIeV1WN8cxFs9H7mJKK9fBKTyjxdoovVLMkEmK3Ook1QNfT0c9FwbGb62CKYUqvLp2LwWmN1++xEGY6s4/NdTtzq2uC5XJRXwyDw/5DuRGQlBew5/ULJ//D2VQljMNM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mNVfxdqNC2M8L2BV2IS3otokymRkwQF2jGOFvwc3wPbeb/tRHUTo8EU2MxUK?=
 =?us-ascii?Q?41Y4ICrlRZVM3OEuFPJSj/xGx0QMI+wbK+axPlruRFLk011MR+6KrSvwjtAr?=
 =?us-ascii?Q?a8rtTbi53uXCnzIiG6jJMFxOhQfq69511KFg2G5HGDsyGsubzgr1Bd/6cquf?=
 =?us-ascii?Q?BdcpBJLDlQ3jDUiAD7Mu6aQ7BqrV36f09McV9SvGKTu2j/H3nzKdA9b+162b?=
 =?us-ascii?Q?QGdn+XXtfCmIuDlWEAerO2Hfi4qIe3x0Z030z3bhvBc9TTgShaj3uIMnNZTp?=
 =?us-ascii?Q?nt+sYZlrxxI0yR6ZppnvSo2Zk/J08ANFEJ24iNrLosrSGo6jBOVcZ0kBSx+N?=
 =?us-ascii?Q?9gAD3Qmwqxa9yzTSOvdtWXnh3tZEQyffB7jvOMO2M7nS6IXy087WZ0TeLnNC?=
 =?us-ascii?Q?N4DCP8Y6p1rErCXATI4G01R4nPT+52Nvey7ULbAnnlB0XCySP2t42aJdwXNM?=
 =?us-ascii?Q?Qr32MVgEm6D2C3ow/mUnBidCyi4Z2IURqioLwD0eJt1PJYr0Bu4heEFPkCp0?=
 =?us-ascii?Q?AVMc0PdHrtWL4gY2OpCBPLJc3oIVWV7ExQaxT1M6bd/RVyo2f4Kj3e47jdYM?=
 =?us-ascii?Q?VvQPpCYFuGkJGyk+60xstFSkKqbumxQN6FoszxI6ODr4glObXLsYw+eT7uJL?=
 =?us-ascii?Q?+UoFiy+xDbuuZ6t5qbF2yRirDZdkZGNkhAlF+jPxa9miX17QXAhZDbunR4Oa?=
 =?us-ascii?Q?Nk+J+PnHGEK7US+zWO3yPkm1V8LwH4INdRoQij/nxWVHE/FnQncH3D+2x1o0?=
 =?us-ascii?Q?7JQTUULEQYF89TdyCrukMI42FaNlIlsYV2tembAN9QeGkU8qUaCCIxrTZ4wM?=
 =?us-ascii?Q?YOQ6x9N8bG6kdhzkRsb+N9hYbSOL/34ynRY62tgDkpcepWhofyW0rJsTlLKT?=
 =?us-ascii?Q?vyoxjEHz5e0LWEMIhHNYoC4xoSktHNZuJui3GnU/LSrXxOHDVpkTIk3kxXHA?=
 =?us-ascii?Q?ppquE6eJzPd0l05TYtSC/8DPfR2WUFTYild3+uD6mt8S408UckR9ZVoOhmS1?=
 =?us-ascii?Q?sPVA19fbfNe7hPEyd4Q/8bqad0JWYKp7oXjj8sYtLWZxQezvgmjqoUpscsO6?=
 =?us-ascii?Q?1xS7cQhODn9BrJChE3tFmoNQJgPoODkKUNtwS0uaxZ0BSgmValyO9sAGVCsc?=
 =?us-ascii?Q?yNlA0jXIm8FsFqYSW45QWluPTTVX9iqfyPYBTl5InyXaDgNPqE5WWD0XAsGj?=
 =?us-ascii?Q?57dUeJDYTtOFDvUr1EggN6GeiNje5O/nPFkykPI/dQfmgSCzTrDj+hywPEWC?=
 =?us-ascii?Q?3QQYZTgBuEqy1vSrZNzalkX1fpyChBG61ESkTJwPcWkZczuZVzmimPJZID96?=
 =?us-ascii?Q?8odMJgTNz9Y878yOZNljDlLXm5PItdDSnWbAlEta08fcVdL+qw9wjJLaSYPx?=
 =?us-ascii?Q?4vm7BCVNyoX8QqnMPbIiSJai/Cj6hqlckVKvUcVt6SAn5XnSrfr3sxMK26SE?=
 =?us-ascii?Q?D9MI8G1N8mGTcFBGpDgtuX6RTBo2ksiRNeCLgSYWS/XllGnK+2SAZNFha42C?=
 =?us-ascii?Q?mAjF9HxEj921xl1FEL2Ofpkbma3V98FXamgfNF7Y5pvG4qaB+o41prWyYEXF?=
 =?us-ascii?Q?a7efQn+VBR/UckscckTRFdfrBeTvdWbzMMHLBYXVYbg/TxZUwcSgU5DKYw90?=
 =?us-ascii?Q?Xi3q2u6ZLfQebpA92INfAoiSTwY4XAGI0ekUwNGtayyER1e3xZsodaGeNM1w?=
 =?us-ascii?Q?5HJAgrKfj8b3rWYVfBhGaKiPWAMFYX8U7yZ7IIwPzIQ2ET0q2ld/ap2qhLw8?=
 =?us-ascii?Q?BLaIcP4GfA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AemJCKoDycBIJRkdYry0PAdg6n1oLSL9QsBd0QtMBZx5/+Tma4IJt8TDpfAv+nBMl54ktVBfvF02c91TgyF6mZ3N0mlKw1tw2xZvqgohPbv78zhqaMxKf1cNmZ9b1yfKl8fJPddAIv9W4I8TTXqeJyrOpvuLFFx+SFUpHzpQKsVovn4eX6hNEq2WVvcIQpvNfptf3eaIYQg+pMayC5yt3Ur8FVSwZvUVsErR+lhDM2mq2pm0xh0ukuTqcAK1uuCl5UgY+jTfqU/7lv/nIlWDi5yWwHNJR5jiTuvSUetK7aBgGV8BcevsBrGKHSE11YvyACyuJYqCE7t2+bhhg8i1/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459ea8a9-d447-415a-5cdd-08df18ea922a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 20:46:26.3027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oILhp7OGm7Efp0oUHubVEsaj5kH5jfCdEq0o7JeFzt0uh7AcU/lC5XeLEUTgzzh+CTLMvFoKPP0c/VzJSGAZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
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

On Fri, Sep 4, 2026 2:16 PM Matthew Brost wrote:
> Add ULLS migration job support to GuC submission backend.
>=20
> Changes required:
> - On migration queue, reduce max jobs to the number of ULLS semaphores
>   minus one
> - Skip writing the saved ring tail for ULLS jobs except for the first
>   ULLS job - the ring updates both the saved tail and the tail register
>   itself
> - Set ULLS sempahore for current job releasing last job except for first
>   ULLS job
> - Suppress submit H2G for ULLS except for first ULLS job
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-24-
> matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 5e3e911a397b..a83360fcbbf3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1189,9 +1189,10 @@ static void submit_exec_queue(struct
> xe_exec_queue *q, struct xe_sched_job *job)
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>=20
>  	if (!job->restore_replay || job->last_replay) {
> +		/* A ULLS job past the first publishes its own ring tail */
>  		if (xe_exec_queue_is_parallel(q))
>  			wq_item_append(q);
> -		else
> +		else if (!xe_sched_job_ulls_is_chained(job))
>  			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>  		job->last_replay =3D false;
>  	}
> @@ -1208,6 +1209,9 @@ static void submit_exec_queue(struct
> xe_exec_queue *q, struct xe_sched_job *job)
>  	if (exec_queue_suspended(q))
>  		return;
>=20
> +	if (xe_sched_job_ulls_is_chained(job))
> +		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
> +
>  	if (!exec_queue_enabled(q)) {
>  		action[len++] =3D
> XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>  		action[len++] =3D q->guc->id;
> @@ -1221,13 +1225,14 @@ static void submit_exec_queue(struct
> xe_exec_queue *q, struct xe_sched_job *job)
>  		set_exec_queue_pending_enable(q);
>  		set_exec_queue_enabled(q);
>  		trace_xe_exec_queue_scheduling_enable(q);
> -	} else {
> +	} else if (!xe_sched_job_ulls_is_chained(job)) {
>  		action[len++] =3D XE_GUC_ACTION_SCHED_CONTEXT;
>  		action[len++] =3D q->guc->id;
>  		trace_xe_exec_queue_submit(q);
>  	}
>=20
> -	xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> +	if (!xe_sched_job_ulls_is_chained(job) || num_g2h)
> +		xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
>=20
>  	if (extra_submit) {
>  		len =3D 0;
> @@ -2098,6 +2103,7 @@ static int guc_exec_queue_init(struct
> xe_exec_queue *q)
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
>  	int err, i;
> +	int max_jobs =3D (xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES);
>=20
>  	xe_gt_assert(guc_to_gt(guc),
> xe_device_uc_enabled(guc_to_xe(guc)));
>=20
> @@ -2137,8 +2143,11 @@ static int guc_exec_queue_init(struct
> xe_exec_queue *q)
>  		submit_wq =3D primary->guc->sched.base.submit_wq;
>  	}
>=20
> +	if (q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION)
> +		max_jobs =3D min(max_jobs,
> LRC_MIGRATION_ULLS_SEMAPHORE_COUNT - 1);

	If (xe_sched_job_is_migration(q))
		...
This check is broader than the queue that can enter ULLS.
It is OK now, as xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES equal to 55, while=
 LRC_MIGRATION_ULLS_SEMAPHORE_COUNT is 64, so the max_jobs is kept at 55.
If we reduce LRC_MIGRATION_ULLS_SEMAPHORE_COUNT later, we may need to restr=
ict this min() only to ULLS queue.

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> +
>  	err =3D xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    submit_wq, xe_lrc_ring_size() /
> MAX_JOB_SIZE_BYTES, 64,
> +			    submit_wq, max_jobs, 64,
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    ge->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> --
> 2.34.1

