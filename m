Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8FCC27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 21:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4275D10E103;
	Wed,  5 Jun 2024 21:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGsGQkyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B825910E103
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 21:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717621276; x=1749157276;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cUJnQOLtUsQaYGKz0FsY4U+aNwYIwRhUwysRVqklt+w=;
 b=dGsGQkyh4vsiwjevPA4FRetC5mdct/I0uTDVefconkNoBuxOct730wG0
 asgyUEber3hFq5kldnvnLrhOs3sv6TqMW9PY8PC0W8rFW4vv+PTNQbOjI
 RWkuZg1PvJjVLoNXUm7R4XeZ8LKY0+YB6Og+5sgG4PgF50XzzD9MRnEDs
 34e36zjl3e6W2Ncl7A1cpm2zrgwhybt6s+rLDpTQNmU3MFrGmQzqkrvgv
 PFI55paJc4sMi2XSqZxfjfqswpp5HHpgZd6wD0Pzb6IfVSTVNX2J9gNbr
 pQdOau0h5Btv72YKAV8S68mhNJV2+Vzoi4+J03n49oHSG7Cu6FBg53+FD w==;
X-CSE-ConnectionGUID: X9FzLOU1S7+FsdwnMaDncg==
X-CSE-MsgGUID: CKwodR/CS3m7xitA1w3adw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14139157"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14139157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 14:01:11 -0700
X-CSE-ConnectionGUID: qQsA0uOBQCO1xcgp+gbOBg==
X-CSE-MsgGUID: TUWn593GSeq1jiNckfeJkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="60912780"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 14:01:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 14:01:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 14:01:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 14:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD/gab8fwFJ8qk+Pd4JWWWR0M6GAaUVdbWBsPoHzGPSJjpwAXLhQG9CBq2h2O/BPXUkTIbWxSyYlZSEAsb4C6Ww2FwGN0iwCWEc6nmSe5QUp9Tx//iwwomlrWuTeDpxE8nNO9R05UQquDQKTG43fXedfRzZqKkVpvDel9Y6Hu9NpiOsmcsqsdISrmWsOioF49cXat4A47Kdw4gjX/+t+SxiSfDi5VmjZ9bzoXFGjdd8H3p59s54AiqunYInXvA8KmZlIAxnPyHdC71hd33dlJ+n/ovTLD1GTO6Eg50VxYxAWGGyiw6aOxosOqzvRholGlBg1BPDeIil3sqb4Nbv60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW8M55S/ChzHFYcF8QGRRgu6N/55K0dyU9qa17bN05w=;
 b=gJCv6YYlnuNuto45bJqgvF2CVORYqR3oR2ask0VcuYroinA7nm0UU6sYAZwTw/mYGpYS6cMgHF8bkupm9/UrJXQ7PL61YpDw+R/+aW6xQBvPj8OpD0S/MDWkUNn46TrdDG9WmbwQh6C2GneXHxHyHQ5YaOIgpC4m4+YvXnKqYixsih/md4YPzjBPH9HwgNWOufYsNgHP2AygyD5w2XpECBQHfpPf9/SreM+FvfN6tZHXiCcS6j3byt7b6j845pb+gmcehBnHcxTs11V18SwX1awrAAcv9q0mon+WmtWL+lY4c0S3KG3QkxZrswwGGStFBKoVpOozmzB8cV1aOSrYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Wed, 5 Jun
 2024 21:01:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 21:01:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
Thread-Topic: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
Thread-Index: AQHatq+SMhpHvJEDjEeb3RX8qciHbLG5phxw
Date: Wed, 5 Jun 2024 21:01:06 +0000
Message-ID: <CH0PR11MB5444AE223F9CEA03E93C37E6E5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240604184700.1946918-1-matthew.brost@intel.com>
In-Reply-To: <20240604184700.1946918-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB8287:EE_
x-ms-office365-filtering-correlation-id: 131f88da-e861-4c69-e404-08dc85a29e5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?3Lqm432BUM3XelnfhMrYDsU17TVTtT2W+g8m17iq4qqMBbkfm/n+BUCeYx2i?=
 =?us-ascii?Q?SChSM5uAU5egBYtFtMP/5tXXGCqJqvPEzxNgW6oyDNwWOHDmtKNj1LA9fhhK?=
 =?us-ascii?Q?tMMRpVWBL7WuxXjmTU3bXDyNMlGVjeNgg1ECNQEEBQ9YzIHNgYWYwSTmvrYy?=
 =?us-ascii?Q?tW5wZbQwzr+K58lLu1agV4PAWvOOAiMFL5Puu3OjvDkmu7WtTzPlZYU91fbR?=
 =?us-ascii?Q?9hUHeZY9Qy/jRnngdozsrKsPt1nF9wUkCZflyJtNiSaI1Hah3gaumccvA3D/?=
 =?us-ascii?Q?WzQZUQVt/R5SBINDSyh5m2WFesocw7HyVunHcvE1ImXvtOXFgps1yy5bGxD7?=
 =?us-ascii?Q?ZgBSotWi/OIwnEiXdQEDgy6YiF1ihjmvlYhRcqAKClZan/vWeqb93+hVvdzY?=
 =?us-ascii?Q?O8obArWKOXRx69iFFazZGnVz89GXSRw7HnzUwEF+fZqRQjRkxZr7wL36eoCb?=
 =?us-ascii?Q?7l2y8sO52+HX+B18KVESnJXDnvWN+bXzP1RDgw2L0wvcCvPv838vMs23O1Dh?=
 =?us-ascii?Q?5Lzjl49466YYqXWgdnHfQgjgZToBbwMoKeQC7cLrH5BRTeThQWRNH8CT3GRe?=
 =?us-ascii?Q?4auESm3fzz5hOKipGeqLTR4oU0hwP55GMj77ky6ET7e5HEqtUDl4QMu+7qcL?=
 =?us-ascii?Q?WxrcVvecJ6lkvctAkRlrFcH8H1bjLCq+rcXWfO1ymjDaZFesegZB/g86gYiA?=
 =?us-ascii?Q?e5/J4qTSPxbEUBWuAl8WO3MdP3YUdtFRn+5ebmLVp39oEViDx5UeMwszvlHt?=
 =?us-ascii?Q?hm0/tFO7p0AJ+Nbxqifi0w0OcOyZo8dV5shQa9Ewfmb6hMG4YbN84qXmu5P1?=
 =?us-ascii?Q?uli+CXVryMzkZwQ7zyiuU6k+suBHRf/i84t2INun6pPCcQ+W/hldGqx4Jrrd?=
 =?us-ascii?Q?Tq7HjuutTvUIotZxWPb4hyOock1NVxe1wPmkek4RqjrtrPuZKqtlFOUTxuwR?=
 =?us-ascii?Q?AaPGCFvne7PFUqLYHxZva3yy+num/k7HLUIJwxl8bPG10BpDAzqkaQbv73EX?=
 =?us-ascii?Q?nsuXvkdVqrDtdMUINux9uuhixqSvF2isKYlKwOtKF67qpWD66fFC1Ejw7EF3?=
 =?us-ascii?Q?oh14LZxKiciloI61dRlG9uJ99dmqNKyEWNkKVDIlKhHfBKivF1OcSxfdyv5M?=
 =?us-ascii?Q?pxJsaGJFmhpgIjeToHR4wXNd1AgOwpvz7qc/p4LEvHO8T6CYXbWzckNC9Q70?=
 =?us-ascii?Q?FstmXv7Sp1zwqLvM8tz+EyekFYsNhqQXbsg1QMWiiGuz/z4q3wuTxGmGVPpc?=
 =?us-ascii?Q?UaszWaJSRaXdJR+TSArkRMPqqCAJ/8E7MOiSAScs7PvsCP5BQQU4jxqh+Fb/?=
 =?us-ascii?Q?pH09QMquWf4u6VX6Ja64OTUje9bL+Fw1KTm00kuiGlGvcQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ai+BXQJFZG+foBfnlQ+8kauKvv/NUSgB6iJ9XCuWCEz2qLwlS2lhxPXk0Pl?=
 =?us-ascii?Q?y5yBwLGgfEJ+WNB41EDvbIVGFhZjjsRAR5fD4YXrOoSJselOJw8sSDbFFBTb?=
 =?us-ascii?Q?tlk1HTArhwrXS5oJZHDv6TZ2aFqgjq9uRseOobrwftXTu9iQUmXsBT9kHJdC?=
 =?us-ascii?Q?XbKIJbVPowjWhdj7L0wKpLPq8mnA5U8EfWo4tev72RywwsrqiYECK2SLuR4q?=
 =?us-ascii?Q?DZ4QivwKy2Udex9jXwT9Pi5WK796a4sIeEZsfns3bsNL8rZjNfaydtimeqxL?=
 =?us-ascii?Q?0brB4Xi2zqlLtg5/SsAoLwKYFvzLC7fkDQhdA1Kjq4+PMHUKIL1TNYGn1PLl?=
 =?us-ascii?Q?1R3ZSC/4hr5RXOXa89Kbu6A2gtwZy2UX+0FgxTY8v3aY+S34NEAnIYwC+G3r?=
 =?us-ascii?Q?lOtyNCPL5gwQKl8BkSNMYdNzVy7gSK4Syit0ZgEKtKVWvMUZcyW7+DXmXxhI?=
 =?us-ascii?Q?hk/lkOfxWGbwfD2kV4vKI0z+4JPAakpXKq5QalCtmXQibn5z7SKHwOVH9txD?=
 =?us-ascii?Q?vAZ28OYtXS43A861wmdG9Mf1S8fIrBUJ23V8FHGCAqCucFPRvlgsfts1NSxJ?=
 =?us-ascii?Q?nBoTzZFusEFPfeZrpiBVgAGOUkiTxCjYdmfpELJCDglvvpermdtcT0WsQMqR?=
 =?us-ascii?Q?bn371XY+5n9XSl9mZH3IDu66FzTeP/bKACejeRr/0HmTpYs+AaCCOgAYkyze?=
 =?us-ascii?Q?DgXI5BJZzwPKSf5a0XCMTp/VarMULVwmOjNBt5g6BAvs9RyI0lYyqTWLhQ8C?=
 =?us-ascii?Q?hotkGNpFroHZHlAmLXbVLMlaamzqv+kEE8NMKonarzb7Jl+jf3LrYTjB2qYw?=
 =?us-ascii?Q?/ElksMx0s1Bv5sAt9JiuEvaj8z+j7IcvywKUJU2ADzlujctYHXWiwCPnkzrP?=
 =?us-ascii?Q?6ZcnKchfmUx8NQdZog58q2/AbCW+KzIGt6MkFdNN4/ipV4AphllFsVMD+Nj/?=
 =?us-ascii?Q?yslbhyecxhLRbXSKPPFHUQIvquUFejlkTpyUQJwvK2SwA2MTslrp7/0N6hlI?=
 =?us-ascii?Q?F0ihaqQ9jQeyHWbGVO6/3NOsw6f24L9qc35xP2SVlythKwbk1V7UhQ/EZxPU?=
 =?us-ascii?Q?HOMyaASZEohzFqADj4XNLue3O++fUiLr8z27iTXf1rDW417Rk1qNKK9+1JIF?=
 =?us-ascii?Q?S3EkI5dpJZQAg1u+6C//92BluvcIqRdTWA747JI1fWIx+Ob5Bzl2//Dkk/2E?=
 =?us-ascii?Q?CEShfZk5SMY1pJRB35VqZl6P8Xc12/pYvBmXGIJit+vbmx0zoZBqJcs/FhfT?=
 =?us-ascii?Q?hcOfaaKumfQegZXR49NfXQMveNNN4gwYgVuU1OFXmjEzj2jSKI4mIb10kBt+?=
 =?us-ascii?Q?ptRgbAg/cqqpdfHYgsbFNOC3HEIaMx2yGMLUz89nAI8eWTksHqpxErCZLO//?=
 =?us-ascii?Q?kXya94QKsxPjH+C1Hpo0ixwYsw4QrqjisY0Y5Ditiau1OVvkodgW4pPQ98a3?=
 =?us-ascii?Q?p3mEgytlUG7nV8q10kVI5s2HAf/WaWEdS1/y6qoGVvpDnYdk29AH3hQbv7pR?=
 =?us-ascii?Q?39HrZIKlfdVQGxYid+rGPJE7JqluCV/KJsZgxDtdlStPo2OELz2hsTbOt1ZP?=
 =?us-ascii?Q?uvfvz2kFkY6ayjf+A4soWYNCa0ejDdhO+iF5V6VH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 131f88da-e861-4c69-e404-08dc85a29e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 21:01:06.7190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I39mF44SeaZ6n7J6TFMUnvzvIYV1KtDS6yLgof5uUhDEJ54CWeZmNloS0ssvSRSrBR6vVZdkIHnRww9tMYWPBZsrgLgfXvomlEcg301V6MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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
Sent: Tuesday, June 4, 2024 11:47 AM
To: intel-xe@lists.freedesktop.org
Cc: Brost, Matthew <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
>=20
> Clean up laying violation of setting q->flags EXEC_QUEUE_FLAG_BANNED bit
> in GuC backend. Move banned to GuC owned bit and report banned status to
> upper layers via reset_status vfunc. This is a slight change in behavior
> as reset_status returns true if wedged or killed bits set too, but in
> all of these cases submission to queue is no longer allowed.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c             |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 12 +++++-------
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++----
>  4 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 97eeb973e897..4cf6c6ab4866 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -141,7 +141,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data,=
 struct drm_file *file)
>  			 q->width !=3D args->num_batch_buffer))
>  		return -EINVAL;
> =20
> -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> +	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
>  		err =3D -ECANCELED;
>  		goto err_exec_queue;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 27215075c799..cf45df0328da 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -677,7 +677,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_devic=
e *dev, void *data,
> =20
>  	switch (args->property) {
>  	case DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN:
> -		args->value =3D !!(q->flags & EXEC_QUEUE_FLAG_BANNED);
> +		args->value =3D q->ops->reset_status(q);

LGTM.

Maybe migrating over to using q->ops->reset_status could be done later, and
instead we could just check the EXEC_QUEUE_STATE_BANNED flag directly for
now, saving the change to reset_status for a separate patch.  That way, we'=
d
have more room to justify this change in the commit message separately from
the one made to the EXEC_QUEUE_FLAG_BANNED.  But it's not strictly
necessary, IMO.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  		ret =3D 0;
>  		break;
>  	default:
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/x=
e/xe_exec_queue_types.h
> index 18d8b2a60928..f0c5f82ce7e3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -70,18 +70,16 @@ struct xe_exec_queue {
>  	 */
>  	struct dma_fence *last_fence;
> =20
> -/* queue no longer allowed to submit */
> -#define EXEC_QUEUE_FLAG_BANNED			BIT(0)
>  /* queue used for kernel submission only */
> -#define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
> +#define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
>  /* kernel engine only destroyed at driver unload */
> -#define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> +#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
>  /* for VM jobs. Caller needs to hold rpm ref when creating queue with th=
is flag */
> -#define EXEC_QUEUE_FLAG_VM			BIT(3)
> +#define EXEC_QUEUE_FLAG_VM			BIT(2)
>  /* child of VM queue for multi-tile VM jobs */
> -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
> +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>  /* kernel exec_queue only, set priority to highest level */
> -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
> +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> =20
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside fro=
m ban
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 47aab04cf34f..4464ba337d12 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -61,6 +61,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  #define EXEC_QUEUE_STATE_RESET			(1 << 6)
>  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> +#define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> =20
>  static bool exec_queue_registered(struct xe_exec_queue *q)
>  {
> @@ -134,12 +135,12 @@ static void set_exec_queue_destroyed(struct xe_exec=
_queue *q)
> =20
>  static bool exec_queue_banned(struct xe_exec_queue *q)
>  {
> -	return (q->flags & EXEC_QUEUE_FLAG_BANNED);
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
>  }
> =20
>  static void set_exec_queue_banned(struct xe_exec_queue *q)
>  {
> -	q->flags |=3D EXEC_QUEUE_FLAG_BANNED;
> +	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>  }
> =20
>  static bool exec_queue_suspended(struct xe_exec_queue *q)
> @@ -189,8 +190,9 @@ static void set_exec_queue_wedged(struct xe_exec_queu=
e *q)
> =20
>  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *=
q)
>  {
> -	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> -		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED));
> +	return (atomic_read(&q->guc->state) &
> +		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED |
> +		 EXEC_QUEUE_STATE_BANNED));
>  }
> =20
>  #ifdef CONFIG_PROVE_LOCKING
> --=20
> 2.34.1
>=20
>=20
