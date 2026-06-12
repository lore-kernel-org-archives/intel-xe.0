Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D118DCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 16:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3E110EAA1;
	Fri, 12 Jun 2026 16:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hw4qJtyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE85E10EAA1
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781282149; x=1812818149;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CmYqYkhQpT2uVl7unsD/sl7YGuDuvIZ8feQRXcWzREA=;
 b=hw4qJtyDinGliDchAeKxztNrceeuXFYFelOn5ZrSRDhULvF2fLIaFHJE
 uBX2CC9Wnw6Eu9+BFEltJfl47oeyeERHgBc/PgxQ6T6CSWNO/Ko/0FEs/
 olpUSns7bcGTZchrZB0oJsR1i4n7Fbdn4nN7ORmg4qkEljfDzZ1aV9oAZ
 Dy/B/c8vT9tOt5N2F6nR0osV04Fq7lITJ4q/OZGfLMXMb08N8wzBZd83U
 mMSDQiCg3KbGy++O0FcCaZpwGIoOylMR+U55Rlqmx3Zviugbyl45q89+b
 Fwr9C9ykf6Gweb4dzsVliPxnJJFhk+5qM3dbrCBt9Jxgk9xa0bOPA+5pr A==;
X-CSE-ConnectionGUID: 5i/q3SOTSZ+66t7rV+0adQ==
X-CSE-MsgGUID: 7+qSkSJ9TROhaV52v2ifng==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93229261"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="93229261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 09:35:48 -0700
X-CSE-ConnectionGUID: B3in1DXRSHihQHPXEVj44w==
X-CSE-MsgGUID: nOnUmk+3QEmk9tjpvlsEtA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 09:35:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 09:35:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 09:35:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 09:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VciJ7sdHQWyht/n3AOrHhDoPaByGT+7JU8ZAyy2ocfF000hHFtpMuGktJbdUdHNWX2CdPxN4KVgxY7J8iig7OPeSti5xUJ58o1lOYT1xN6T97exJk09fx/XzaxbMOULxDeZQ3t2Bq6xCm9coZJ1pLbvJYeNa126kTCDBz78R73UC30D2CanMIzTeIwh17V44vbEFT0GopndV6qLvxy7S+32bpPgEnxkYaEmlO/I0q8KyRRK2rHrAYK0SHN/8FZlQHq+9jkTaLgrogJBGXbLVBwbLmR9O/u83MrLmXKnSlsHBaQxVcSpI5/SPzWR6VQCQkxTeTxMEntPS5emlpIbcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdwunQdqKGNe/X2Fc/30XOrzfg7Byd46UEe1/DmDXWk=;
 b=b5X0Vl8Jr6j0NeKIOAET+ZC5tDjcJqxfAGzdsCzFOXPu6tmOnNu1sbSUU/sBT5FvnZB9EacuKgksIYz+ZVeX25czKiTHVPPf/sBxnPUZs5ZPTobDUiTfcQVhIWgQ6smikU46nAN59MnI47RY4I9xgRxf/Bkl47Cj6B6ORiEibY6dayHDjVJ15fm8RQ+67/kq1FilviVAbRxeyHZQ6ptQ0YSNDZXZMQJmaXR9T3sB2zT5HPWz8ItiI5xW8vK8iRT2CdDRAwkpEPsWCSn59BmWKr4juctN0Ak/6yQW8gdQIjJnIyLyNGaY5QMNlydmZt+8TRuwqsq44uju5C58RlWYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by IA0PR11MB8378.namprd11.prod.outlook.com (2603:10b6:208:48e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 16:35:41 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%5]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 16:35:40 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>
Subject: RE: [PATCH] drm/xe: Disable scheduling early on FD close to avoid CAT
 error cascade
Thread-Topic: [PATCH] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Thread-Index: AQHc+iOUnHoYz4J17U2ldRFxAArnerY7HZLw
Date: Fri, 12 Jun 2026 16:35:40 +0000
Message-ID: <PH8PR11MB80406CC88853B0C439BBFADEF4182@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260612042548.3740605-1-matthew.brost@intel.com>
In-Reply-To: <20260612042548.3740605-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|IA0PR11MB8378:EE_
x-ms-office365-filtering-correlation-id: ab07f898-78a3-4f10-46e8-08dec8a0a43c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|23010399003|38070700021|22082099003|18002099003|6133799003|56012099006|11063799006;
x-microsoft-antispam-message-info: 3+T1OILBdVrHilazvTfpEdw6VWC5AErT7kZ36dNw3kkiowHQ+nblEvUsS8mAAed0BGRPZ88FyYxPg0vRODIxfr5A5oRfwBbmPQJo5P1zNFQkUqIRS5ID3BonCzuM10hnSXtEz0T7dOcJDSkibyuCE2GXQk8y/Gcy962LsoARnpIw68EXoqu15taOOs6fZa95YDh/od5SGceOcWi4Aykw6TWiOaT2UipwKShVF23XsljTzWCTJCD4HIAH3s81AwYKpxlt6hsl5OV2nIUjBS3Ira3QOvaQeEJ98WTfimKysPD/NkgTwhIE4PE6yEa7mphnIc3w/uZcS8UPCfQc4BYNcAP8REwgnsQGC/r9H5v8r266elNw8wnVmElh6dsPKbwR6E5v28QNs/UgAuXMrd7zFNGBCPuD8Fdko31Lm7/rn4wjo5JU2LSwo/5eXmtqs/eyJkiiOKivxUO1N1UPANLtgTJIjoCq8bCLfa0HwSIUNIEKdf7vswYsxbuZZLexOEPNdCB7kgPxeHWyrvoyAQykb6f0NadLtZY90O9I9zPSGJv0++8IULhaVqZXnyeBO7PWvdWVcc5zb9S4pZ75k/uU3FS2xCNZNTr4xrkm2JdntyZxayBLAVEup7DfvfXtc77FJEsK5H/+ezcDMPCNJ0ymXajE+aPGKbRQ1eR0HJ9KjTTK5Wv5fZuNOKsxp9ndxFAC+aIrqnZlHGYqEX7cv5r1o6kbYR/fEXyfyr5fqoLRHs6ZA4imZfb+wJ3acHBjuYGb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(23010399003)(38070700021)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UNRntxvtdlfxit/f6BaXUBHEx3MkaW2VueVCbOb1eyHcTZGtgbWpo1HXF/wN?=
 =?us-ascii?Q?Q9YVzVxBleDKZVh1wML+LLwpzlWa0Q6EwEotiMQlWuvMxsOSLxGHKWoKGCtO?=
 =?us-ascii?Q?fsuSRvkdZ+0AIu1iZJLw8Z+5cj8ap/3K7MmiJwAXgyScNK176Eccw2OZ9kgQ?=
 =?us-ascii?Q?ldu6RTy99uPH7zfbEkdbWWVa1tUIW212BzIxly32Ep/YhSFf0T8KWQ0tEI0T?=
 =?us-ascii?Q?VXmNfkGqZIA2gHZRxqAcAfWXO6HCo2R0a8eF3ub4BRw3tFEIQ3ziGxtoYi0P?=
 =?us-ascii?Q?z4CtCUu7g9zjlvQiy/Dy8SvSVFHCHEAFhP1VgFWj9x5ehx19TkSEJzKPul5a?=
 =?us-ascii?Q?uhF4xFCCJghUZBs2BrkFUTaVr35Oq/h+c2lBSslJTPxqIxtR6Zf4zeXiGGO/?=
 =?us-ascii?Q?m8QWQ3Hv0AjmymSiIaxhMYUerM7AV+pr/4/mUp+IbVZUmUDWHqHo/CMDNiII?=
 =?us-ascii?Q?4aygj1mh5f5HOCB7YbNOIaxf8PYTBWuPxrlVsb5iK7LCnV7kyUVXkphha2VL?=
 =?us-ascii?Q?kqtrr+gEAbADidTeYjzKzjMXdVG6cnN96EbMa4IJK9ZHdLIrESAhhVESP2qj?=
 =?us-ascii?Q?QKP48xoORu/QvqLRVf2++m0hQpbH3rgYZOT49jG/fWNS+9BgW4UC3gr/gwa2?=
 =?us-ascii?Q?ZL/Bzd1JMndRAFhshFgowe9ClEXsSR9ZXjvQQSzXKDZllg9MXkFRpzq+cmrT?=
 =?us-ascii?Q?xFgci3jL9w5mZ2UmhXhXPSyr3EV3lCqSRGpiqgR7lHCCycDA7sYp997BtJAY?=
 =?us-ascii?Q?SXO5tEGvONF5XXxBKR7pOVBVFckL0J4+MyNlmYu64tDSSTxuranS3onREVl6?=
 =?us-ascii?Q?HS09DRsV/NW9lmAREK5QYhsmL0Tl9WZVyl/520bLjI44P8P4DVlHPt+SGJh4?=
 =?us-ascii?Q?ly/Xcc4fhYr6SAtsjqr3QhtHAtDQJ8kgTscmGiIAXfkycDtayExAi3/nuEsG?=
 =?us-ascii?Q?4f5TpvQs3G5jgFbMPjSpW0pyfAbrVQI8PzSEQdPdexq1Rq7MK7iwf2sHmKND?=
 =?us-ascii?Q?Cg/8Umbv6QgpJdMrp5tw7DWqJrNvwYlB42ez/XSQuD+dRqCVMkUmupJSKr5e?=
 =?us-ascii?Q?zt9XdBKne0ZVhZ0Vk9vPLHbefBSr3iw1MuLiJqAX/ICizWkXQerPHJzgcGJt?=
 =?us-ascii?Q?Ku/h//vt3LPqAUKOPTT1XX2x65tp+lANZ12BFq9JOCuPnaK+BBkmlhDi94Y/?=
 =?us-ascii?Q?Qe1j+gWqWbrNd5xG8hRNJj7uKSts9Szx/fpgGIDfZYLSe2Eg2eLW1PW6b1/i?=
 =?us-ascii?Q?erbXSVxy2vNI7UTyT6Qb1XZqKlhDGI3BwjJvz907PPkHXUG8N/MvOZ+rQvwN?=
 =?us-ascii?Q?P6NiGbwvKxAZBFfs0UOxtMGMJDOjcx4rSo7mDzDNlMk8E8FazfzDx2coVzcK?=
 =?us-ascii?Q?U4kYM7Mgxh1BmE6m9HUBtK6965nSj3+oCPHBqhqyrtsVY+CSVl09/AeSSFU1?=
 =?us-ascii?Q?zCQViXhPfxvsDvOsMTmPialvQwcK4ew/TCQwuVaEpUvDwcH0+TJwfP/RBEGe?=
 =?us-ascii?Q?R4toBZWZdo76Apkg0JbKywLIw9esj6UAFyNty+HZRyo70RRHJFuaa28kvqMO?=
 =?us-ascii?Q?0xBWdgZqZXqbXH5tSKKR8TL2IEUbO0qVqzg75DOdEXOnS66XshSSAwGg8qDM?=
 =?us-ascii?Q?mLqvMf11cBBk0hDsYx8vYRtvXaPnNodZca2mBdbnYCzXgwWCxjMZvoxQg+2A?=
 =?us-ascii?Q?d2S+vIj/eqbTBYOeWSTIrJi9Zi99QogR/mZioEC62ZgVlz9+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Rc/KTTPE1lgFMVs8WwATgXfg+gB3JZyCmHW/oa55o6rse3U0B5eGBssKet22VUI9p+6/az95MME7hoH7sqqbD9fzCooVxxZvfT01AGl4VME14tJdXmn8Ipt3fkrClgGFm+GnAoKBMJabzaTZuTNtyc6+wHmc0WzhLEEOqJ3f2zwRp5vB8UFp4yWy3bJIujw8NBqrRFV3VnXa1Pypxwynqey9ywq5VFe/TjK8ZA/WY8sMJghfW3Xg3LrkhT25iaTpJ3LncO/Nlm2QBvOoXbkarYocRiaYhyVPBQVmjo+41Kf1XhZRBjUvgxNZOCw4Qg42jBm2wYJtld0CuWviqPP5Gw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab07f898-78a3-4f10-46e8-08dec8a0a43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 16:35:40.8354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4A0buiiAxBVfmBjohXWbKiu7vnoyKQW+0geifV8KK8DpP0HLGWW9FITH35xMk9I3HhwlyNcMbhQaDKobnHX7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8378
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

This patch can extremely reduce the possibility of CAT error.

Tested-by: Jia Yao <jia.yao@intel.com>

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, June 11, 2026 9:26 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wang, X <x.wang@intel.com>; Yao, Jia <jia.yao@intel.com>
> Subject: [PATCH] drm/xe: Disable scheduling early on FD close to avoid CA=
T
> error cascade
>=20
> When an FD is closed with many exec queues, teardown relies on the TDR
> path to clean up scheduling. However, the TDR handling is serialized (i.e=
., only
> one exec queue is processed at a time), which can make it too slow compar=
ed
> to GuC scheduling activity.
>=20
> In this window, GuC may continue to schedule contexts backed by invalid
> page tables, leading to a cascade of CAT errors and repeated engine reset=
s.
> This significantly increases recovery time and can degrade system stabili=
ty.
>=20
> To mitigate this, eagerly disable scheduling by sending a self-message ou=
tside
> of the TDR path. This prevents further scheduling of invalid contexts and
> avoids the CAT error/reset cascade.
>=20
> This change improves robustness and reduces recovery latency in multiple
> queue teardown scenarios.
>=20
> Cc: Wang Xin <x.wang@intel.com>
> Cc: Jia Yao <jia.yao@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 32
> ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e82018445b7c..1625d3cd03fc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1872,11 +1872,23 @@ static void
> __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
>  	kfree(msg);
>  }
>=20
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_exec_queue *primary =3D
> xe_exec_queue_multi_queue_primary(q);
> +
> +	if (exec_queue_enabled(primary))
> +		disable_scheduling(primary, true);
> +
> +	kfree(msg);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to
> catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
> +#define KILL				6
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1903,6 +1915,9 @@ static void guc_exec_queue_process_msg(struct
> xe_sched_msg *msg)
>  	case SET_MULTI_QUEUE_PRIORITY:
>=20
> 	__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>  		break;
> +	case KILL:
> +		__guc_exec_queue_process_msg_kill(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2014,12 +2029,29 @@ static int guc_exec_queue_init(struct
> xe_exec_queue *q)
>=20
>  	return err;
>  }
> +static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct
> xe_sched_msg *msg,
> +				   u32 opcode);
>=20
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)  {
> +	struct xe_sched_msg *msg;
> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	__suspend_fence_signal(q);
> +
> +	/*
> +	 * We eagerly send a message to ourselves to disable scheduling, as
> the
> +	 * TDR is serialized (i.e., only one exec queue is processed at a time)=
.
> +	 * If an FD is closed with many exec queues, the TDR can be slower
> than
> +	 * the GuC scheduling contexts with invalid page tables, creating a
> +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> +	 * this by immediately disabling scheduling outside of the TDR.
> +	 */
> +	msg =3D kmalloc_obj(*msg);
> +	if (msg)	/* Not fatal if malloc fails */
> +		guc_exec_queue_add_msg(q, msg, KILL);
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
>=20
> --
> 2.34.1

