Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEE3C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 20:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28AC10EA00;
	Fri,  9 Aug 2024 20:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEnE+QsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916E610EA00
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723236457; x=1754772457;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MlHSTLK6eyXBoPrtZ+eXPlVilBKHDSnyjTy/hiClft0=;
 b=TEnE+QsWnbGqEGcXRPHYUArdlPohsOuIiAAOuGJwbISNVOZD8nkS2nEj
 9bojtz1GZx06gK08fRpG3Po47YoRHo6AyAj7iZ88OWeufffARrmYUqPPc
 10UY2qYrz20FxCGZr/uFGrYpsLIblwnXu2XqkHvV68n1c9IJ8dEAfDhqe
 1ryEl6Jtbk36+nt4AgAMwWIAQuyZOmaLiCLtQEUNh0KD75GbtfL0F+4Q8
 2TI9iqvUYBG87K1y5Iexyq/649eIdaJsa8dcyG6/FkI2qlzj/la4Ger31
 oDdRKqBJGi2BzkRdFbtUs8cAqbF+S7PJVdxUyYfHLyESlfs0cr/p22dnW A==;
X-CSE-ConnectionGUID: jKZJfqbiSgO85/sRCxoUMg==
X-CSE-MsgGUID: LZkGV/IwSuOdRw2R7mQVcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21085915"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="21085915"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 13:47:36 -0700
X-CSE-ConnectionGUID: mjZLf2w1RbKHHffvzr00ng==
X-CSE-MsgGUID: U4jvRZUJR66+VHEs6kx5NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="88320836"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 13:47:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 13:47:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 13:47:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 13:47:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 13:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQyxvSKRQvfpiTflIALaQYI3JUOOMW90zNOC+WSHg4N4AnoeNAu437LC40sS4hhVlJX/4xwD11D2p5bfMQJ4GA1a6MmU3wj0Ei9X9XrxTeTgP3LOqMBYvlzSPifEALYdp/fSI6adx1SO5xzywsKPeX/cC6RPeDL/p4v/bnzGBgvtZ61qZxLM7G6znK95SD10EPDo+OEcK4MvQdXRsVTRxEaNFvGYjOhzvoqofGgXBBl+S+7guIcfrWQ4yBIKRKf77h5YnXSwKIjGkhUbucuqc7CqbuQgLgqMc58D909PdTFTvnMAS9/N65ZWSPc8r9bhhXmG9P9ToDlPkZtr5T9BEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INGHZY2Z4UmxKYYGobMnM8IKbx6cHSm66+xTe6JIWkA=;
 b=I4+IXHjwHo850kUctbIQUIGkAg7HzlMRGpVzIgvu3YwGzJznKjTfn/4eSA/KEQQaPsPjT/ZR/el3b4LTbvwNf3QHYI9n5t6h6ct2xAdk7XUFo3enp/J8kdkk0Wmjsq49ovHsoQBIXdLVq1sG5uX0z37Q7oLMGEkQLYUIYveWXMRRSw9YrhO2z567qz6CrEshXxiLPZVSfbrJZyJ85JKNu2bU1rME9rWA09RZ6NjHGw0je0xY1fNGqmZLhp3Rtx8vEg+fVBWcg0DzuNBfXaRHOSiTGXSBgyAMvzP0QThHsWDjwNXFOyqv/hNbCEo5vX7lI+bWtbB1KI2y869pXo2/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 9 Aug
 2024 20:47:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 20:47:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/5] drm/xe: Add xe_sched_add_msg_locked helper
Thread-Topic: [PATCH 3/5] drm/xe: Add xe_sched_add_msg_locked helper
Thread-Index: AQHa6pEJNJ5YsPD2uUaJdJoDLIpg17IfZKeA
Date: Fri, 9 Aug 2024 20:47:14 +0000
Message-ID: <CH0PR11MB5444674E25F33B5552C61DE5E5BA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
 <20240809191929.3138956-4-matthew.brost@intel.com>
In-Reply-To: <20240809191929.3138956-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW6PR11MB8366:EE_
x-ms-office365-filtering-correlation-id: 0c80d694-144d-41c7-6558-08dcb8b4732b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?7av6h2rCI3Vuc4EqsEwJjX5FLIQMHA0m/xiGgkEMuC3Bp0CbJNC1AhOoz7bF?=
 =?us-ascii?Q?wAgXz4BJCHMRdY0VTxuyFN0bN0YZhXV/v5mGeGmnXmfCnTTJfEupZ7vn8iG5?=
 =?us-ascii?Q?UdjuPIdlTGYgTSNMN3xgn3xNBL7WHUtUkvdFTW3YXTd1GiHcWpQelZmOujSB?=
 =?us-ascii?Q?WPgOGPD6qDlZg9q3IbJnYRgq2BU4jzNBg9VId56+mH8Zen03C+tGUB7xNTfq?=
 =?us-ascii?Q?hqI3PpjDc+QPaPgULsofETctDHNoRrOlXEErZ7Ned5XgtYifPwQ4Jat9113s?=
 =?us-ascii?Q?vCqYcjrEm0WNT++kfAWPpky1QeZgSNM81gktZ7jiFkbH9ElI7lIIRMZlg7qq?=
 =?us-ascii?Q?GfV8i865YsqGNPsQlBZbEtE6JwJikSHRFNTR/+unDPetcnxcWLuzTZUP6a3Z?=
 =?us-ascii?Q?+ztsi/Rtlo9h/aXYoHSoBEPguEVHv1ilMZffujqUMgQoUO17Y2/LyAi1jFVf?=
 =?us-ascii?Q?OjLPmnV++nzzE6rOwaH7QDZn21VnjmEpGKJKzK4ApXuacs6JYvH/INESFHyr?=
 =?us-ascii?Q?6LM2d0XwHG5qeHWDcqgU226jQwWHf/wKwoD4BI8mRuPyqxuIoWfO3lDGLezV?=
 =?us-ascii?Q?bxc3rjNnc/vGH3REldqGumv7lrwnNitT2OT4Lnyti00W+qhzuqya/nzEPqJC?=
 =?us-ascii?Q?jt6PVVEFYqOGLyIeG2DIrI42qlCjKYafL4UztWkF2/xyUWa4qE9e1GIw/Byb?=
 =?us-ascii?Q?TgALJGxCO19CI8aeSSXa3Uy8o1GEGDJGQsSfCo4FVUtrFdfdCbnx9bT2x6u1?=
 =?us-ascii?Q?nn5qWFL+GHTZzzrEwAfuys82AoRiX2k+MBB+xTIZJrL6u8p/QQybkFGXy1Zj?=
 =?us-ascii?Q?DWtOuZhclqs7U0izsPKKvOPyy/LykOGC3xzMWZMM5Ti3Wx5nprylwsmiLEhi?=
 =?us-ascii?Q?BQLJFX9z0tOd7/i/y21E4cSPVJn30lfg/2N/rZRcJgiJ2/b66fqGH6wBUuaV?=
 =?us-ascii?Q?wDOaaB1gH8ISQkrhG/kmCkfwugEDM4s2T/QCIX/sFUsxEO+t/84qeBVZ06NZ?=
 =?us-ascii?Q?3T6dPIxlSeOui0cQNpcREX95My/KwFlb6BVKA7Mxc6shUVNs66wyVzfuVG7B?=
 =?us-ascii?Q?b1p/0y431HfcobHVrej4ODUF150WPK4Zswhj5qnXKnFFOG2iMajnVQhm1HdL?=
 =?us-ascii?Q?J1/+nHhe7Vs1XaJ2z/8zL0B0D1VNQjsHnWcmeROVUHLe90KjN0WlBsZBCMRK?=
 =?us-ascii?Q?ifEauybxOYOorBnmz4m9WfMLLFpVBEZp6j+zgxIcNTQDaJf+M4LUbSMCr30X?=
 =?us-ascii?Q?JY5tTGF7LftnWKEMHEjzkQrHwF958pyuQzPS7MSramncvCB1EqF7ts6VLbye?=
 =?us-ascii?Q?95ClGjacQgb0MYUwcbJtOAurWtBU8P8uCc53LLXzwfkrj8wikWT7Yh3BMst0?=
 =?us-ascii?Q?//C3pzPlrxB6JVMtoiyAnDeqSvTk4H5rHda3a99zxiQmbQ8ZFw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sbOA6h61PpGtB3YW/5vjDk6XWjyaRdTOamtefdRktQ+H+Q7qVS4jgJy/TGbi?=
 =?us-ascii?Q?cuTa0BmvaH5n/QfCHUvERt6+CryEF+8qTfMPsVI8Kd8li5qmkGTPc0Av9y0c?=
 =?us-ascii?Q?z1TyhF4AuIjzn0kIKssrLQIVjd6YdHD5VVyKkj71ZLp1yWuybs7f8XkGCeLG?=
 =?us-ascii?Q?hxzWRnWKTvGZKO0ddjoDREXjuAiWpVTBhC2Nltot6fdZUhsg4SRUNkbSrmdK?=
 =?us-ascii?Q?nbbnRsTLm1vXCZYZYM+vWmHSn2GjGC3VJNzjKoVbKMKlLZlMuZAKBgYhmBaW?=
 =?us-ascii?Q?qa3p5IgLaUPyJadk94dse6xx5RvQS4w5kNKg5wDzmh0wO2+cLkZ1fw9UMFG2?=
 =?us-ascii?Q?F4HkSMG0agtIVQPTkvke51SpYcNG2PK0GkQrQOZ9tHiaG6b4kGGQCSEmFz0f?=
 =?us-ascii?Q?lJk/vDU8riJJlPPYZL6A3BDras9+Keu/6Z2xpSDIsBmyaOwBMiPSfFZ/Nfxs?=
 =?us-ascii?Q?qDJvKGxC9T0WUK/fPSj9r/eUTrSY9D2qdDijWf0S7ESlhpNHjyV7PPMq6lAN?=
 =?us-ascii?Q?0s/WGR6irFbfIlwqfTpBVCJeK5W8ceZ3HF5x3WV9oay1twdgIxmmlqYjfRhg?=
 =?us-ascii?Q?DTxXovTu/OOig+OscmwWCc/QK9EW9qKh1gZH4hkSmlfbKBeazfBUfo2zXWxI?=
 =?us-ascii?Q?StIWD4k5zLhboJQA9Aad+D4Z9Mq3Ac/u85Bfh9PhiEpFZ8kz2c99t1dpGuPQ?=
 =?us-ascii?Q?yrq5i/lzJxYCbX1Fqe/ROG5FgBMv4UaMBCyjAeSCXIcrfsE7Ttp2zwv3L7if?=
 =?us-ascii?Q?yaifo2zZm9go77nTdvb/0ziowenvQeE6qp7SQ9PJ/OqPtFp+8Q9UUZG/SoUB?=
 =?us-ascii?Q?Lp0Ci3eTmOP1zPnpVDjlsQXHKQiJ5VXkPMZkpvwNlCGeuqLUTyHPycl3NaMp?=
 =?us-ascii?Q?lqBivmTnmFEa1AjwFnsNkd6eq3C78jrWU1/L/YKHdtR5T1Ckdarkk38KTFG2?=
 =?us-ascii?Q?UPGo8FRwTtVtqiZVr/ZJ6O2OJ/EbgJ2RiyCTv+QRGvw2w2gTuNWeGmaMPDqR?=
 =?us-ascii?Q?HuGqP6vGiauTLH68jy1aU/raOAks21WX+Q3/vsTiqswMMGq2AT1gQh7ynxN0?=
 =?us-ascii?Q?WvGI4csr/HRXSNGnBOqy85iBbWhI3PqTsE3hB8MOOsiL4Yb3s3IUzP+BuJS1?=
 =?us-ascii?Q?9x1ZIwyZ/Iig0T4IY6CAJvfFpjjsUh5ZO54CG+HqMLjb9/XoRaxq4L1r09G5?=
 =?us-ascii?Q?G99rVTRb3IquIzO0IDlldop6dw0C4Do3J16A06CnI6LWkQgaAgkInK5/jt2p?=
 =?us-ascii?Q?Y0qBllPdJ8MA5pEVQdYMyzdISHpdemgSUeyNzJqL52cD3+M+d+/RgGmileAG?=
 =?us-ascii?Q?mojowDiqmBv/d7bftGuwwk7RJ4d11RLrplYHGiNonVsIZoerizDgf3J42Asn?=
 =?us-ascii?Q?pkGdBAc5T13YmCGqEM1vfLbxFii6QYQ+NgT8l4ayOFQJrxvQrVa6D9dHjWT+?=
 =?us-ascii?Q?sI26IIV8q9sAMcF+DFiH/hJ1CFx08e4ahe3Meg5bnErSJlHj7Ie0JPSz4KmI?=
 =?us-ascii?Q?5o0CdR+kT6XTQzW6pC6lLPOCZfVhYmJN/xmymFwcmvg/PHWHu7R739qs/Omc?=
 =?us-ascii?Q?X8ElCQw0BHlWpf1hwkPpzJN0WN3hP84LP025SFfr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c80d694-144d-41c7-6558-08dcb8b4732b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 20:47:14.5363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YtAfligBB+jGXR5EVkOd/ZQVA6u43o+lH3ADxGre/cIXfgUSj6RUcGSHpV9zqGNLy6c3GOc3lzcf29HV17Prbi65azCAuBuf3ywWgMx/ljM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
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
Subject: [PATCH 3/5] drm/xe: Add xe_sched_add_msg_locked helper
>=20
> Will help by allowing callers to own message locking.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 9 ++++++++-
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> index 1c703e8423de..c518d1d16d82 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -94,8 +94,15 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>  		      struct xe_sched_msg *msg)
>  {
>  	xe_sched_msg_lock(sched);
> -	list_add_tail(&msg->link, &sched->msgs);
> +	xe_sched_add_msg_locked(sched, msg);
>  	xe_sched_msg_unlock(sched);
> +}
> =20
> +void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> +			     struct xe_sched_msg *msg)
> +{
> +	lockdep_assert_held(&sched->base.job_list_lock);
> +
> +	list_add_tail(&msg->link, &sched->msgs);
>  	xe_sched_process_msg_queue(sched);
>  }

IMO it might make sense to move this function above
xe_sched_add_msg for style reasons, as xe_sched_add_msg
now uses xe_sched_add_msg_locked.  But I won't block on
such a change.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.h
> index a54038fb3094..cee9c6809fc0 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -24,6 +24,8 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *=
sched);
> =20
>  void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>  		      struct xe_sched_msg *msg);
> +void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> +			     struct xe_sched_msg *msg);
> =20
>  static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
>  {
> --=20
> 2.34.1
>=20
>=20
