Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A776EC52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 18:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7332210E4DB;
	Thu, 15 Aug 2024 18:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by3NEz9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C98310E4DB
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723745907; x=1755281907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZN6YGsrxirt3ps4I7Ihil9wZudC12lP6GLdszghdeGQ=;
 b=by3NEz9YnnQ8bTJ61rvi6UXzA/wKdfl7jOLsROUGOKa6inq9srdyFSN7
 jW9Iue/u9MQKBq6yomXjMNSF7B0evuRo7CEwygpCJfGr9CTn0MexRMQr5
 mvW06k8tFAbapa+CpGx4+3rmvdNeSb3KAthJO5RtXXu8TfVBw0yUwlmKK
 KAGWtnUS0e6bI3U6vTd1PsSaa9PaeQf8ZqXgzA09qS9AIhisieI98dq2S
 //DxIRAJwgxidIcpl25v6oH0L4l4MB+6R7ovwLvjoRSH5HSdZdrS9/Hqs
 cLdUBr8b96Hx9dPVzHf/TI+YaLuT8wlbowjCfDmBrtj24kVbWiO6800Iq Q==;
X-CSE-ConnectionGUID: 0ginPBGpSFepDwUX8deZLg==
X-CSE-MsgGUID: DFqO6G84S5C4XLqWCt1kZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21571314"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21571314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 11:18:27 -0700
X-CSE-ConnectionGUID: DipXyGr3SV6MZuBFwJtzvQ==
X-CSE-MsgGUID: OPTSpfmpQsiHPg9HXH78bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59590584"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 11:18:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:18:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 11:18:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 11:18:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mo8c9W0fFF0ZTh6sAMfd8TQ5X3k4dYCDkCFPhbG3wP89UNnmHbMxKtLTle9qoxy1x7AIt9OgpwIdvO/jX8FCY1qbYhR9qreHX4/7VbbUWL+Ajm5JMq7GyzGRzCmOYPREIs2IKlEjfIlC2zv1A30UNt+zNmMmLCxCmfRgDBLdqD5Zh2uTqxtV0D1i3rE33OXEZcApKlDh0LzNouAZIGhXfQ/IdxTjA3W2nYXTjBLbCxzoa1YC9lsMjLkUBQCxQRPIfmU1mdMXna5FRt7ZdcWKlwWdyZ4fC+OygRQRQEzWs3mdZukmnMxt0GIYycJN9aEQpuAXiS53D7RE1L7vsi/L6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWC1f0RErg3f1boC/B7+Vubi9fp8LS6NHd2bLosIU9c=;
 b=zSvbxqIa8z+t5piQWWzfNHadFBApN42ibVGKXbA12xIG2giXqvSzOOr2BJyQfHeXwDjHNhb7zKAZ0XDQct6VLRQJZEUpM4Rbq6yXjD4VTxXAGBN9QZahobnMb/FVn4S6O0YBqMFl6YtAElj6WNR4a0XsZxyMc7ER1wU83bLjzgbfEWgU4TkXDS9PgGwkQ8SRqOxcBzcgZnwE7PRK3sMQ6t7/D1/eCmq5uy3C6ZhB6SD5btqYD+xXujPnmwlPyMhHNKTflfqGbtJiNQPpDH4QSKjpkL8dED/xI9RBUYtR+SLhAWrXtt73dputNJJcdESjfnv9N0ZpCiS4l5k9HaJtAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 18:18:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 18:18:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Thread-Topic: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Thread-Index: AQHa7zhM7heY5VGfX0G4KaXailywxLIok13Q
Date: Thu, 15 Aug 2024 18:18:22 +0000
Message-ID: <CH0PR11MB54444D758CA9F5281F35D37EE5802@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
In-Reply-To: <20240815172602.2729146-3-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB7467:EE_
x-ms-office365-filtering-correlation-id: 10040106-ab03-478a-8980-08dcbd56a5d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?dkNdL3CbUkOt7XFmBLgWDa6jD2EC+69533gu8PlLBdJlKWj8XnSMgTC1eUJA?=
 =?us-ascii?Q?5Ub9p6jzUc7Mr9oMwNgjhngHCfn07jnTGrbi/rWbeSBxt4mm7j/EsWFgQKG0?=
 =?us-ascii?Q?Q4q3SUqqyE1uUje8PPl2xQbuyna+pYQc9LuFHUrl6Roe8756tULVnbbykgsY?=
 =?us-ascii?Q?BFJIcmCy7MzIuA8yGa8uaAKd7BAbtQ9rJn9YNcm+J2YsSfa9UG2QcRNinfMy?=
 =?us-ascii?Q?0P816uEABPKK9qiz14RFBi77dVM456dAdx+9+C69n7KAnxBzOvJ2oRhyntI8?=
 =?us-ascii?Q?bKC8L35Fd81jcvoiMo1WPSEnmvniiJ89LDQ3cNzbOx96d0CHaa3Xubs7rmMv?=
 =?us-ascii?Q?lQZ0bNoXmg0zBwHIPlSCI4z6EAC+0s8A08rg/cOOZ8sKUQpav/hA7jxRmZSd?=
 =?us-ascii?Q?xO60vQHvrTD6MZp7vOErZOWqEcgRU7SLABTFbQPvjTp1jnKrRLbrp87XkXHp?=
 =?us-ascii?Q?mr+p9iELhwjtFwCOuOKWYee9LLz6iJ0lopc+A/tJyOzxPpsU12xJhS/FWWCQ?=
 =?us-ascii?Q?FhKwqj5Xkt8IkrbJ5FFodp3PuMPoSjJAqUS131GE0ltwPZxh2xBVynVcnR/f?=
 =?us-ascii?Q?DRB8JAv9yYNy47oY/6rCkkXT7imj9wzhyDZadg4ll95X0A7b4zxR3w+jW5Sa?=
 =?us-ascii?Q?7fiSWbU/UU6beKQDjOKoDU4qtuzwdrfYcEjtwp6yDGs5XzGGlU4R4gzjRVsk?=
 =?us-ascii?Q?NzzuVijUjMgiqDuZ7mYCqFPc8mCBiEPWSL+5V7nzGRD1fQFe6fXkdn4l4ZQe?=
 =?us-ascii?Q?aO6fBmUg/ZirvvXXpDyLhL3FNtbRXjlYH/Twr3koSjZ+g3BrzcPjx/AiClMD?=
 =?us-ascii?Q?4nkOule0P2+QRND4X/3e8WCyKerGQ1IeDTtpNq38JAHeG06Ha5CeUI9dPJpJ?=
 =?us-ascii?Q?8uYPIr4sPr2CWnbz0uzeg1Ka6U058imdHZP5bOo/WAyQ0Aj8EsQLK53eN5Ob?=
 =?us-ascii?Q?MZJKjAtnRSFZJWaYyN61OYzkNurxUK8XC14tyW4UQSkGBgMzZUDN91MdDnGi?=
 =?us-ascii?Q?/L/wDIJ27BNtb53GDwbAuYRecriSdE/7MqF7YkecuImnUrwHydLrl812Nb+M?=
 =?us-ascii?Q?VIjkvUdWo4TUd6p5k0JyAP3WzEUpotxolC5f9f6or2cFblki/Gdo+i4vaDc/?=
 =?us-ascii?Q?NKVjBEtK7ZwW/Fwbh+EWr6S8h0Z7XkMPvfQ8Uqq9v91v871YXRtvwFGh7zl1?=
 =?us-ascii?Q?QUM/5yO3hnnV4jTRgl+onAEPbdx8wvLVl5LccUMnhKWw1XAM4QN1f6jjeAJZ?=
 =?us-ascii?Q?13JQuIC4+bvEYHzholNU290hSz0rXkPzzUxze2FJTLQGhSO5P7sK6m0w/vHI?=
 =?us-ascii?Q?0YWgx5lTG1IaIbS6NHhmK51cN0zc44x554A1+9EICL03cyDEOisjyo9G08gm?=
 =?us-ascii?Q?AqVht147Pnh9Iu7zDhGsU+j4iIfZFJzu78cVqGWf6joeQmWkVQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GCm6qXRyxIGVgNP4kR+y99uBu4izJouLrU1o7RHae9vBO9GrGPq+Ui/9fiUn?=
 =?us-ascii?Q?nEbet1O8Hb+HL/SXlpzg2iG8nVuzcFZEv6h/UijS0kJOZJkRngOEejbd10cA?=
 =?us-ascii?Q?UPD6JF37ZNi0MGojbzJ3+gY9g/cgMrIPdzzYUkwFJk6LZvk5l1q8lhVi90be?=
 =?us-ascii?Q?qTZ+Ho67YmTGnQaXQsSYitZ9JIGWfDC3aU9GtPfZUaBrRtqLStoWnugcIm/n?=
 =?us-ascii?Q?vEq9U/TbX61www6Lid7evUb+3tKOzIiBZNEjnHtcNzus+eF1Tbgz0AdS74wR?=
 =?us-ascii?Q?N9ymebeGXVdNYOJrI4ZOGaBB8wm2rbO9cnFU+F3U2k4ANC4rhwxq8aFlTkYF?=
 =?us-ascii?Q?taOd6VP0GXtM6a+scmyMs+4AStKv7YG5HT7k+JWJvPYMLLKoIIi0iv9fplOB?=
 =?us-ascii?Q?azx4GGY9J3uhNEpMn/DesROTfHcRAG4SMb6OfD5l3fwkF1KqO3KV7/M88Qby?=
 =?us-ascii?Q?h8vqGblcRd6N5yU/SJpClLNpbRUvnHwJhgg48S6ssMOR4o1pdMBQ3kPN1Jve?=
 =?us-ascii?Q?UK6rUFtjMD3O4P0yiYqtZDdfaHxhejjIhaTRD8l/nt75GKLJ2VQEo/8ASXFV?=
 =?us-ascii?Q?2OlWUVaDSfapFI0QF17xAleq8PBdEwRwYvfPVJ8Jz2l+oLq8e2ed4GDBskMu?=
 =?us-ascii?Q?57EsQrU6w//frtYqr9lNk51GHcxuwZSRUuxRoa5B/fFxLeIote1lrCGPUNd/?=
 =?us-ascii?Q?9s6fL8nZZODuNOD9xZAkETP4XJnAgA4ko6lUIOnCUEU3oCjzWif6E4rU02XN?=
 =?us-ascii?Q?FyzPs5KWWR53B4n6QCbwyzcl8YKJFzhv3kPml0AmaTNNUvOqeZPx/MQKZSTV?=
 =?us-ascii?Q?AKn4q8tVX0p/aYvWpy2LgArbj4FgL4orjhIa2aDKbhwPIsUnGccxyZ3UD20k?=
 =?us-ascii?Q?Ig/jBtqPyVTOU36oK+3vvj8kIccib7O8hvHLI77HGqBMw2C67yzOognvHO9m?=
 =?us-ascii?Q?c9NXILvN3DKt77A/fSfMkkXCBYpXVoU+7kRFyQ0X1Ku4J4+Igo6T5tspdaNF?=
 =?us-ascii?Q?elIzwbN20wqaAxwD7XCh6DW8Tb2zdkKPpgqLmDZS6xFmqU6464L9CFbFWDVJ?=
 =?us-ascii?Q?Gc3hg9D/vJ2ysSCriLd8JNeoFx6gj6khwPQXd3npuB6rExxuLgCpbybsnuaS?=
 =?us-ascii?Q?x3lA6vN+I9OM1lQMo8kShujuRXJdiTrKoKhurUlTGAOAZPz8KsAggvgS7OkS?=
 =?us-ascii?Q?d9Ks7ps3o2GzwDNOz68kqFwv9DlwiPK/S25wzai2x3c/4Svrg9Dekc8IS28f?=
 =?us-ascii?Q?snot3UG0CyYhj1hTqF4RXcTfZq+BG5rOK1Png/5ih4deZcUoGUYZc4AHQfMa?=
 =?us-ascii?Q?mT4xiqot6Ah3bTCARXPAfmOTFpjgjpefzX2O/bMt/Zc/v4jf2+3vejZcrzIN?=
 =?us-ascii?Q?pPvuFuNEI2fP5FUf6hcQlePGsS0mvyjje48QT/9gBAnNthVolKINjYxNlEPB?=
 =?us-ascii?Q?YiRR04z6a+fnoouKWzGBtMx02Xtmnk2hgYBgpemuuo6HbuEwq/+vbVPonsE6?=
 =?us-ascii?Q?4sedi+spzeLq1f+Me6b/tMqOROoaR3JGTf7ORPQb3PuCYRnEPqABnQJqKGCE?=
 =?us-ascii?Q?mq75eaRXMp09PK0TLqi64KKRTOQ9Pby3GIIL6/Yh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10040106-ab03-478a-8980-08dcbd56a5d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 18:18:22.6232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qF/gHz3WBY2BuVl78TYi9RiBxldSL3Y2yBO55Bcbx2GOGMi3W5AS1K1t5Rw9u1zC4dVswKxOV+UTtTr2PwZNutym2+EYtE91yHnWIGvvYvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Thursday, August 15, 2024 10:26 AM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
>=20
> Although the query uapi is the official way to get at the GuC's hwconfig
> table contents, it's still useful to have a quick debugfs interface to
> dump the table in a human-readable format while debugging the driver.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 57 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.h |  2 +
>  3 files changed, 70 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_g=
t_debugfs.c
> index 5125d76ccfac..8f95d3a5949b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -19,6 +19,7 @@
>  #include "xe_gt_sriov_vf_debugfs.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_topology.h"
> +#include "xe_guc_hwconfig.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -270,6 +271,15 @@ static int vecs_default_lrc(struct xe_gt *gt, struct=
 drm_printer *p)
>  	return 0;
>  }
> =20
> +static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	xe_guc_hwconfig_dump(&gt->uc.guc, p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] =3D {
>  	{"hw_engines", .show =3D xe_gt_debugfs_simple_show, .data =3D hw_engine=
s},
>  	{"force_reset", .show =3D xe_gt_debugfs_simple_show, .data =3D force_re=
set},
> @@ -288,6 +298,7 @@ static const struct drm_info_list debugfs_list[] =3D =
{
>  	{"default_lrc_vcs", .show =3D xe_gt_debugfs_simple_show, .data =3D vcs_=
default_lrc},
>  	{"default_lrc_vecs", .show =3D xe_gt_debugfs_simple_show, .data =3D vec=
s_default_lrc},
>  	{"stats", .show =3D xe_gt_debugfs_simple_show, .data =3D xe_gt_stats_pr=
int_info},
> +	{"hwconfig", .show =3D xe_gt_debugfs_simple_show, .data =3D hwconfig},
>  };
> =20
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe=
_guc_hwconfig.c
> index d9b570a154a2..025bad701556 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -6,6 +6,7 @@
>  #include "xe_guc_hwconfig.h"
> =20
>  #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> =20
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
> @@ -103,3 +104,59 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *=
dst)
>  	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
>  			   guc->hwconfig.size);
>  }
> +
> +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
> +{
> +	size_t size =3D xe_guc_hwconfig_size(guc);
> +	u32 *hwconfig;
> +	u64 num_dw;
> +	u32 extra_bytes;
> +	int i =3D 0;
> +
> +	if (size =3D=3D 0) {
> +		drm_printf(p, "No hwconfig available\n");
> +		return;
> +	}
> +
> +	num_dw =3D div_u64_rem(size, sizeof(u32), &extra_bytes);
> +
> +	hwconfig =3D kzalloc(size, GFP_KERNEL);
> +	if (!hwconfig) {
> +		drm_printf(p, "Error: could not allocate hwconfig memory\n");
> +		return;
> +	}
> +
> +	xe_guc_hwconfig_copy(guc, hwconfig);
> +
> +	/* An entry requires at least three dwords for key, length, value */
> +	while (i + 3 <=3D num_dw) {
> +		u32 attribute =3D hwconfig[i++];
> +		u32 len_dw =3D hwconfig[i++];
> +
> +		if (i + len_dw > num_dw) {
> +			drm_printf(p, "Error: Attribute %u is %u dwords, but only %llu remain=
\n",
> +				   attribute, len_dw, num_dw - i);
> +			len_dw =3D num_dw - i;
> +		}
> +
> +		/*
> +		 * If it's a single dword (as most hwconfig attributes are),
> +		 * then it's probably a number that makes sense to display
> +		 * in decimal form.  In the rare cases where it's more than
> +		 * one dword, just print it in hex form and let the user
> +		 * figure out how to interpret it.
> +		 */

I think there's an argument to be made that since we can't be certain what
the format of the single dword attribute is, any format we choose would be
just as valid as any other.  So maybe it would be best if we just returned =
a
hexadecimal representation for every attribute value, rather than having
an exception for the single dword case?

Not blocking, just a consideration.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +		if (len_dw =3D=3D 1)
> +			drm_printf(p, "[%2u] =3D %u\n", attribute, hwconfig[i]);
> +		else
> +			drm_printf(p, "[%2u] =3D { %*ph }\n", attribute,
> +				   (int)(len_dw * sizeof(u32)), &hwconfig[i]);
> +		i +=3D len_dw;
> +	}
> +
> +	if (i < num_dw || extra_bytes)
> +		drm_printf(p, "Error: %llu extra bytes at end of hwconfig\n",
> +			   (num_dw - i) * sizeof(u32) + extra_bytes);
> +
> +	kfree(hwconfig);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe=
_guc_hwconfig.h
> index b5794d641900..7df315900e1c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> @@ -8,10 +8,12 @@
> =20
>  #include <linux/types.h>
> =20
> +struct drm_printer;
>  struct xe_guc;
> =20
>  int xe_guc_hwconfig_init(struct xe_guc *guc);
>  u32 xe_guc_hwconfig_size(struct xe_guc *guc);
>  void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
> +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
> =20
>  #endif
> --=20
> 2.45.2
>=20
>=20
