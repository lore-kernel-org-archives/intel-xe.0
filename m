Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AFCD5B149
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 20:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6349910E21E;
	Mon, 28 Oct 2024 20:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zvxiclng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3E210E21E
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 20:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730147372; x=1761683372;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QbVJACoFFXMSo4YjUDvoLnhaBSDB5WehTaiWeLchtfY=;
 b=ZvxiclngxkyVNP9t8T++AYSUQ5Jrl2b5g1zHmlperoqXhzjzay92XKaV
 f7YdB5lXUVju+D42EV9hEL3JlmTH1WnSHKU4Zj/47i3fdMfkaRGgxTPhQ
 pbC/8cGtHIMHPaShwrGNYWJLgrfJLzHQvIp9cjzywHkCnGW9UIuk4HwWb
 nXBZGgrSHuXU2XhPEFPYdmsZsZLKRa0gTnkR+RE3BfkZDh3b9uISrS+HG
 jFXFZKtw9ZFe2g16TyF0euLLMaFkiHMyL01wD7MqZVDk7hd/3rvVw+Kpk
 qfscayW/n39Hi5SGSKc+6P6ww2xeuyUY2LPXJILzEF9zI7eT4A36DvB+z Q==;
X-CSE-ConnectionGUID: IRK/rS6gRtSFoDQQ1+0hpA==
X-CSE-MsgGUID: 2/luXtwORf6MVsygH3ZkKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="17396196"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="17396196"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 13:29:32 -0700
X-CSE-ConnectionGUID: GpT2QDh5THqdW4bJ5t4yPQ==
X-CSE-MsgGUID: 7rIHgYdnTD2STz0M2Ocz8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="119200013"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 13:29:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 13:29:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 13:29:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 13:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ni/2xEWaYX7+48gKlcpu0CT4wKWL2Comb8ISpQK5TbIiX9w1XDmB5XpRyhY7VSbutoQ9SapW+2pnOn1R5YlEIpFg99EaRK6T5pj1t6+ghdz/s490J1BZY60eKNv8EJsSfLlqL7bxg4+6mOjv7DQkmPDceGvvyNqNkBuXq1zceHE4FSuq+wtOwI4lWto8tG0rki3D+uMtXM2VJNWmzTRRc1vn2Lm7scjgP+GnPECYXLYrgGE4rNjgAuy9t1ywlb1MbM7JT5ZdTknH10Vkt1lIWgAqxAGYsNkre99iYKqZ2Ljg2Lgt/DIXtVHsnf/HYNOBJlOs+pYNOX3SLRwgZV4WvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyyniHUpJXIz7zomfxLKmACrs0l9V16/3LN6QRQ9BEY=;
 b=IQBPWO4HD5/V6k+xtzVlHiwEwz+OrG/+lL+nn4z4IrY5+ldZ2lpXb9qIssqIPL1n/AINy1o/3DN7aabCDWNk4NYvUm1/GBEy4hCIH/VqGV4apSuWkqq5T/GcmX0AF3s7ue6Gn6YgC+sZBWHP6/kVWBJbu3RIaTvqxh0EwH5onmnkYC46S0eDge0q3bWz68h6X0vaF91nGYq5AtF22vMTPUxJVZTChDM6P9xIyrzohsUkO6RGAKFYM6bOFFRnFNWxsr6yN/CdnD/hUgR1hcOJw4RDjyrZlNdsIgaKhdxAygUDxyn2B2qmFD01yQptbqpaKrFIVYmtw/6QT8r/W4Nkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8490.namprd11.prod.outlook.com (2603:10b6:806:3a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 20:29:29 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 20:29:29 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Stop accumulating LRC timestamp on job_free
Thread-Topic: [PATCH 3/3] drm/xe: Stop accumulating LRC timestamp on job_free
Thread-Index: AQHbJ8n2MwRcvkD2O0epy+zHgO3EjbKcPn2A
Date: Mon, 28 Oct 2024 20:29:29 +0000
Message-ID: <CH0PR11MB5444C74C6244FB0DEB086A99E54A2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-5-lucas.demarchi@intel.com>
In-Reply-To: <20241026170952.94670-5-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8490:EE_
x-ms-office365-filtering-correlation-id: 4616b994-ba62-42d7-30c3-08dcf78f394f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cbMlx9trR0/yPUItnI5IfYEV0QNOJppS2Sdlv+AALPxJY48bZZUj0wom3btv?=
 =?us-ascii?Q?ckZQs9Il+FcxcBo6x+iy+/QUq7tNNtTwUMHefPD2iWeWar3rK5GN0VeY5S4p?=
 =?us-ascii?Q?wsJEHTagrB3zrYSzlqfhn/M0CPhPiLLIBNIgU6uMJtM3Egj8aoe3hP6y0axc?=
 =?us-ascii?Q?stQ1dbC2dLN9nlXt6iIZiXMYofJjHwYdzsuUNnfE1GBGPlImVo5Qygkc38Pc?=
 =?us-ascii?Q?7U4ROY1FSdOXVUWcMid7wKT71e1ADq1Q/28jt5LzjftINqnzIbjHe0VQouAf?=
 =?us-ascii?Q?s5/MSdp58fV+n5rfR+oOyI1AJwu/oAJYSeoRCoGUsu1FX3RYc+PRXe01TT21?=
 =?us-ascii?Q?jch+oapsLuxgA7BswLazeUkvLL7ObkNHxtzodjsa63VdmTNFU2Bx/Mus+z04?=
 =?us-ascii?Q?kiF8EVc8/ugaj3gSeiGzilProKB0+vmeW/SA1GNjboEno4Lty+t2FbRmGxPf?=
 =?us-ascii?Q?Gkm0Ur5/5f+IZe4v6XpCQbxIcQJxV/rpMjFO7PrPvfiNXamGkbOFBPZj2bLo?=
 =?us-ascii?Q?jWhygVoKgSWhIUIgC8kc0OLN4r93Q+Y/lJbVfWbL5yqNcA7u49x+JYSGL9qo?=
 =?us-ascii?Q?JCNOqlzmMbJAQ0pgcx7xjphoq8oeXmS+2pfAxV31/iJXI4hsAsaHOPpOb88M?=
 =?us-ascii?Q?qCe+aecD+6ouhevxjkQTehOWS1CO+Wk4ugDdHGE9gOEKZN877rSlVlNsup1Y?=
 =?us-ascii?Q?dIr3Yjb44cKtTsf/oOAHA2qmbqJiwSOp7275/OlR0JjcaFagY2+2RhRIt+9R?=
 =?us-ascii?Q?HUeCH3w3pwB5FKQWYVCjobWD7Iwvh+r+Rrvbb9Fm8/axhtG/78T85V0gaQf/?=
 =?us-ascii?Q?faJWO9vcfxPc1ayqm0S8UkyJd5Hzsi1B3ZbZnZSDwb7iMEOutd/x1JowNvhS?=
 =?us-ascii?Q?+SQ+isGsFtMh4ebnMkur2Vm1murmAvUVT+yqWoG5ar2lh40wNsEfhTh+dXfq?=
 =?us-ascii?Q?P3EAapsEpLCQTazxaaVddMRo8xTvUYZpdKVozIr7h3pWhPyoopZUD06ER239?=
 =?us-ascii?Q?Lp4ayO5wF0xDRGxSxG4gRbmScGMflErcDTVraGoEgY4WJHZhvGRS4JEXo/dr?=
 =?us-ascii?Q?tALoSVtaNvrt8FguscVXs4XQjHm5KjN32HrkU6GZMYPizjYjXEsqrj04gZTo?=
 =?us-ascii?Q?5taKzndYnUUNZwFx0UMM7MtlLynla8kH6MBY85c+25pR+uuz2LzIN6h9npz2?=
 =?us-ascii?Q?zFfNXj/f+AZsIAw1R8hFy0FDTPA8G7TIGMNk5MDExGIDfoaMZcXlXCTPnm/2?=
 =?us-ascii?Q?CWMv74gBQ+wKA9OsfVGNRoqwccU+F6dO4OS2votOFfRQcnTYeWAOk/ijJHJ4?=
 =?us-ascii?Q?jRHbJ5HvrgTlOuxgSMSTJYRfkx3xJgWjm0b4p42Bhd/XB51YlGXOaLyDVQmC?=
 =?us-ascii?Q?OkUq2N8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w13h2RiEhMIZ8MW8AB1KXNpLK8JKbblct61EZ67saP5mPUmemIVDh0DaHjmi?=
 =?us-ascii?Q?BXPbJ583Ba5Ja3cyQOo+FC0c35XmgHecD3KKKu4IFYYQPSFFWvTIuSKf9XQY?=
 =?us-ascii?Q?LwWsmlA5GM/pwc6SFNeRuV6s8+lav/5LCH8AZbVcFpQRQuSDWj0JXdGUhNXP?=
 =?us-ascii?Q?q9kS33jgL9q8/KpPV32chHdmlav7j/jfJQ1bGsCHTpx8qmw/9hZLV/4njBdp?=
 =?us-ascii?Q?MrVmmtepI20q3Rgn9Y0XtooNtphwhwZXfgdmjwi+Jxumd6C7d+qTkSm4J6G4?=
 =?us-ascii?Q?LEvjs9/ziuA8Ruvp8jvicl4G4xO5XSudPFZT+VviIktAnHuhbQ3q10V33smr?=
 =?us-ascii?Q?gxfyaRFBji5tgTC0vFITi8pK3EmdV3PNOkaSy4O2dA9YYQ8S/Jee+fY6hVfy?=
 =?us-ascii?Q?5+mMo1x6qxr552oI+hSe4QA5GSDcuk4qFBmdaEJxOv015ozKBrTP4GAM9UDr?=
 =?us-ascii?Q?YvQ45/Gug97MOna2pmfw+wSedDnc94t9w3qdR680UIKI0JYucYl6qkPq/1Gd?=
 =?us-ascii?Q?v3fmFyBMj6TuHBKbGAj2VP20tz9eB8Brsm9qh3EFIO5PgZklSURR6ASsWehW?=
 =?us-ascii?Q?N83zvX3YhAV1uH938AuykNQ9PgaTzRhEsURBgVpV/3/qGpvT5YCKBebPTbTT?=
 =?us-ascii?Q?IHDB/NxvdUtodliiLcOafp+gxaOmdLtnVfeR38ddfo2j+ZK1sPVKyeyqcCr9?=
 =?us-ascii?Q?Zr4JHNpWBE3yPGCu8VtRbw0T04Q3cen6JpbMmX/qh4t0Rszo6gEgYR8z83xm?=
 =?us-ascii?Q?l7H9SFz6MCiF9/Lw4UVoJFEM9fpYEMgqmG/NmVvjlkwJ612Co+eHwKH2pIOM?=
 =?us-ascii?Q?RnHHtH7vF8NsFQX+BFhcRfHdO99cQkVZr6NJzhw4Qzesq3k2swvKx/YnQsls?=
 =?us-ascii?Q?qufq+/WEBmREQ/+7dyUR+qeemeMCH3rtdhq+0qjydiuY1s4Pwa+7LhxonNrl?=
 =?us-ascii?Q?yQxTW1XzzOG+1p1TZp+MPyxxRV2jG7oYfRYt5rURowINwWszmQ+HDufrXPcz?=
 =?us-ascii?Q?RJvhxkpjODFh2QpEEWbZiR73mNvJeMo/Jget1xlhAYgkmgkOpAT4SuIOExaK?=
 =?us-ascii?Q?KRkTgN8Wasc28//P43IPszyN+qoPxfI+vC683TO/pUfsEGMasozRncFw9+b3?=
 =?us-ascii?Q?67xY3Ta0IQvjoWdA8VKHpgT8WspgC8Qjj1wSNI9ecD96k1/UQMhUgnUYi71J?=
 =?us-ascii?Q?CujkVngJvzmskB6/q/JvF5GNiqqZvIP8p1VrzAyJZsJY+WjwRFwvxuTcF5aN?=
 =?us-ascii?Q?8HzgGApusByI6Nigm0YTuibz8/6z93X+5wNusHb1QeSj8aPdp0C0snzO7Nkh?=
 =?us-ascii?Q?UY+oeITN+CNTB5YY2rY7upV8oiupPoUBXtkH1vpiZujij1W8yL8ThkxKQQiP?=
 =?us-ascii?Q?+5QLrmgUgtW3O2PJHt6InGbKAnQ/msEZlZu/usav6uS6HD4D6D9wuos+3GI1?=
 =?us-ascii?Q?WjiMfBPJaurerDkY5MbZgHgBQcM/zn5BdjRX9wywdeIQADcoz2WqMdEERbTb?=
 =?us-ascii?Q?RvfHViNCXWPpGL/AjpkNuCjWfIOnwCS2H5lsdvOPYHmItNeHt3CKDN61O1lY?=
 =?us-ascii?Q?XJrfKKV1mv5WzH1FVzlq03pBsJk1PnN4U1B8bR+i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4616b994-ba62-42d7-30c3-08dcf78f394f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 20:29:29.3312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXSF25lRDBlJ9lN4eI4vOx/9SRMxXAgxZ0Bgu1xkXzMV1AmhNsYXU04v5eE9viovvAJ/SNIQ/uTqMNt5DQIL+3eFQn4HXMsgzRODSY0PTeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Saturday, October 26, 2024 10:09 AM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <u=
mesh.nerlige.ramappa@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com=
>
Subject: [PATCH 3/3] drm/xe: Stop accumulating LRC timestamp on job_free
>=20
> The exec queue timestamp is only really useful when it's being queried
> through the fdinfo. There's no need to update it so often, on every
> job_free. Tracing a simple app like vkcube running shows an update
> rate of ~ 120Hz.
>=20
> The update on job_free() is used to cover a gap: if exec
> queue is created and destroyed rapidily, before a new query, the
> timestamp still needs to be accumulated and accounted on the xef.
> Initial implementation in commit 6109f24f87d7 ("drm/xe: Add helper to
> accumulate exec queue runtime") couldn't do it on the exec_queue_fini
> since the xef could be gone at that point. However since commit
> ce8c161cbad4 ("drm/xe: Add ref counting for xe_file") the xef is
> refcounted and the exec queue has a reference.
>=20
> Improve the fix in commit 2149ded63079 ("drm/xe: Fix use after free when
> client stats are captured") by reducing the frequency in which the
> update is needed.
>=20
> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are ca=
ptured")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index b15ca84b2422..bc2fc917e0de 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -260,8 +260,14 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	int i;
> =20
> +	/*
> +	 * Before releasing our ref to lrc and xef, accumulate our run ticks
> +	 */
> +	xe_exec_queue_update_run_ticks(q);

I mean, if it works, it works.  However,

1) I might be mistaken, but if I'm understanding correctly, xe_exec_queue_f=
ini
is just as asynchronous as guc_exec_queue_free_job was, meaning we're fairl=
y
liable to hit the same issues as before.

2) If this is designed to cover an fd close use case (as per a discussion w=
e had),
shouldn't we be accumulating the usage in the code segment that performs
the fd close?  I don't know where that is, but I suspect it might be xe_fil=
e_close
or xe_file_destroy.

I won't block on this, because perhaps I don't have the full picture.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
>  	for (i =3D 0; i < q->width; ++i)
>  		xe_lrc_put(q->lrc[i]);
> +
>  	__xe_exec_queue_free(q);
>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index e5d7c767a744..ebe4665d9159 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -747,8 +747,6 @@ static void guc_exec_queue_free_job(struct drm_sched_=
job *drm_job)
>  {
>  	struct xe_sched_job *job =3D to_xe_sched_job(drm_job);
> =20
> -	xe_exec_queue_update_run_ticks(job->q);
> -
>  	trace_xe_sched_job_free(job);
>  	xe_sched_job_put(job);
>  }
> --=20
> 2.47.0
>=20
>=20
