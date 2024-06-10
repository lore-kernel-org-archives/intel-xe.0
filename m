Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A27C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E264B10E48E;
	Mon, 10 Jun 2024 16:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjMyIuV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656110E48E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037309; x=1749573309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2lkDjkwDRaO57jz+B+YfAAVNlEDBu7zx4S6hNA15FW4=;
 b=kjMyIuV5HiCFJpgXHM+PvnwhdXkoBFFcjmxY8NcJcOAmyuEPWMLAYPtL
 4PRtjOb4MRqwwy5xl90niWW4Lu+5SHu18M3G5grsMDKn2Z2ASVQgEvPvC
 vifM5I8VWSBltsNGpXfVXgVsmB9cZj5jhkPdMgghW/cbwibQVc3zgQEiQ
 iEgT8gtAhiNDNO08gtXODz1k4ozr+iOri09CoUgGmphepGOQO+XAw4QwE
 4lmzUSBVqaHxc6NLwBl7EArNGoVA1Tu/ikAvxC+KxcXTinDbT3t1vU3ZP
 kE8Ru1+RujGXBK5/dJZpQWmgwUnBmoloACbZe3OunaTr3TEqZwwradsKs g==;
X-CSE-ConnectionGUID: fn+tdKKlSE6Ctm7p6omcXA==
X-CSE-MsgGUID: fKeciGYFRmq/Evej9mq/hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26127179"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="26127179"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:35:08 -0700
X-CSE-ConnectionGUID: N2LZVaqYR5aNrmto0IyMiA==
X-CSE-MsgGUID: tuKzCMImT9GiU7lO2XZfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="44045638"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 09:35:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:35:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:35:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 09:35:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 09:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0wFUDrV8TeStDEMDG6z2373aOWee9CpTHIZaYUldL7ReblLDT4deN6z9+bgT0oy9v+FUyY3Dc/9+LTMKbAnMpZ4q2hhmT2HDH/dCSf9n45OXh7Ih2ov9QQ2MsqU/gc6bsPQzbom5nKrm+T6NzEJ+89ZeaGDFpTrG6MIgdfAGj8VE7/PVlziv5o25nXD3TJhFDbYcWl4MKywiYdbemEOV8t5W8QQkAhH9dyyq9eHK+x3RpOZfsaf/JRUehk5v/pTbqQ+c6OpsEx2o2m+/Ae30XdUzTW9M+hNCyRgzC7J+TMb9ECKg/rc4xpL/1E416UCkVBTzBZAfU93pm/uBywQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuJqA0AeRgWOwWkIw6S/tcQSpTrv+wbzZVgjybZZ+Eg=;
 b=Fheu5eWxOPlXucIyrK3udB13pG+RQcj/DbZ7V3SeY4032Vny+2ISvmKlEkw30MvUbRR4dI4hwrEOzqAFaFD884ux8zp/uQfxFZ5kXwYWUJYUbfumJgd1YFV3+RtmLeaf74Yv3zpGtgB4RbsUZvu7v1vwyYqP6XX5tx/tNwAr931dxzX0DOS5iiNknx0iPEF2tFK/61GsTP0O/d/ZdOtxWV3uM4rtVloxNtQoJsDerHEPPAZdpuNo03MoGzM/7kKRHYoWBEt8KZtiJgp9+so/LTN5wdhyewjsFpvTxbwia+W1NUdlK46pdrmy2HHGB6udXJj2y2HwpvaeIS/UA1zmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 16:35:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 16:35:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 08/10] drm/xe: Add pending disable assert to
 handle_sched_done
Thread-Topic: [PATCH v5 08/10] drm/xe: Add pending disable assert to
 handle_sched_done
Thread-Index: AQHau0EWQRgsb0v5sUae+ro3aUdiwbHBMZ9A
Date: Mon, 10 Jun 2024 16:35:04 +0000
Message-ID: <CH0PR11MB5444072878827D9F20CC8B16E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-9-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-9-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW3PR11MB4537:EE_
x-ms-office365-filtering-correlation-id: 41eba263-8100-4b87-8195-08dc896b484d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?1/KTf/kqxKaSbY0F+KJ2cBuJEfq0HhRrh3QSqeH4pjBzW10HzGqxUKWNCzZz?=
 =?us-ascii?Q?hjUS4c/6n9usVc5A9EplsYbfxEZgF3tOK/NKWfJsqYmWUMWI+ExtWPTBHwNb?=
 =?us-ascii?Q?u2V3itpXgm8h/m0TQDBzvcCpgrZn8I/vmPXFvQeyuodBYjI7LKbCl8oFjOtL?=
 =?us-ascii?Q?cbe4ouyqJumq0OFaYifGPVWsVRzZA/KWfC26x6DKA3wiLW5Dj+bkrLz6SN2v?=
 =?us-ascii?Q?fh9WuKsrwYT23fmaOMFywMdulyx2c0ryE1jyNxNLZc5H0wnrCs7oJmuGZlQm?=
 =?us-ascii?Q?tMjErgK7faWkWyRyipnACHlrZtRC3/Fdox/5LEXu9TWVCEzZ/ViHFtAHX5oA?=
 =?us-ascii?Q?omSQnr6jwZwi4kDcTSK3/Kuh5KMwwOZYDOSqjUgLS0T6LwZmt4KlvBVweQ97?=
 =?us-ascii?Q?64IMvteu3UM6qbFLnKCmSj26Zgjr3MnM1HzUsIr19BF903x/h/9zAK9mfM1K?=
 =?us-ascii?Q?xbVVcDYR1urKxn3uzflZW5LkgiaSc2XKpJcowzDmgqu8kRe/SbsYLr90nM4Q?=
 =?us-ascii?Q?5qLdNWAfMQfnzm5/bANu/D0zxI7JAkdQhzuRVX1Ui1i3Us+je15L6NZ75/99?=
 =?us-ascii?Q?dt5IO/bBBMYkTOmpoqIfILE6LF78iP5NpbjVy6d5Zc2kfzraKzsFM85P5fMP?=
 =?us-ascii?Q?8mxfOEs0d93cV8O+dow2ALpOzok5vyBSkWNy2xvlbAHjyhtlF6gTZIwQ7G3X?=
 =?us-ascii?Q?NMnixwflYy/Xw0MjCDCp+whkx1ZsmpeU3ScUs03R2ZL5FjYs4APU77vyRx5m?=
 =?us-ascii?Q?ghdde05D/ZNaPfkfncwwexgQ0+R1W94Kh4tL1RmxueXWD013Q3E30W8xBROY?=
 =?us-ascii?Q?6pyodEic3w+Bgndx+ydEqyNnvV5d6++t3NHbXMLYWs4CHPZKVL6GuJo9EwIm?=
 =?us-ascii?Q?eAY6UlxN+AmZxAfCACAnF0YBwxzRC5jvcmuLvsoEMjFTyf9Wn7hwtd5IHwxu?=
 =?us-ascii?Q?Y93PJNb0XtHeKwKucmC7R5XEOr/n/0qtJgI6zZ3lYX2N1G9E9Mf5gogDIC8j?=
 =?us-ascii?Q?7kiaqY5/Q64aPwJOjwAes8H4pr6NwRqOwxhx+4EDabu0CyFjmbPbvXaJNBF4?=
 =?us-ascii?Q?OHI27lt301PB8jlIBRCjQ7jXyNGzyI+SmDdNrocwvwg884Ak1y0lQV6IKFfi?=
 =?us-ascii?Q?LVt+ao3nTh/P8ddvHtbXGhMV2Z5V9JWzpjqw83RoyI6bRbP52qFpQcDfLyYx?=
 =?us-ascii?Q?EzfgUEGStH/drq+PMTBqzpNEd39CxcwvqjLxfzyN4XOzEoxa2KSxAmlhL1P1?=
 =?us-ascii?Q?PeoJiU6CVNKpQJbSWGDItd1TXx6YiKd+5quTKz75J3O6BxLq8g4JpfiB/CC9?=
 =?us-ascii?Q?/unH3ordpFqBdYVBY4VciiyYG1TO3wGIXHAHTREFDn4U5OISA3WrzJTK3GMC?=
 =?us-ascii?Q?8MJTQM4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e2a7QtErLboeWLlgtO0sPJEBR3glMvC5lZPfEWOWr546vgo0DZGasMOJnJpW?=
 =?us-ascii?Q?HzKNibLHs2aeydL4bEOIB1c0jlodNWDX2BwHYGl0DbPn0U+bMegka2CeoMt2?=
 =?us-ascii?Q?Sy7Xtl3K/At/XI4rTVVKijd620yef9EPYD2lWaNAEA0A+N2jp62qUUIJITpl?=
 =?us-ascii?Q?xisXye394HS5Yi2/sIMIqGOxpQKBcBcPQhm+44elARoeBWxNERg537fiEUZt?=
 =?us-ascii?Q?kPN/oGD9/9mntAqOpcjW1mPW3nTrJ/CqPoDRVG6VtIWK3qBTOwpZIm56ylvC?=
 =?us-ascii?Q?5Cm3PwGzBLGh2jnghABLRAynO2RkTszIiGUlek8ox2w218eax6OlpQl1SFdu?=
 =?us-ascii?Q?qkx5nMCvVGzFm8jtLpBn09O0qGQ+KvnEwDkPQXg0BQ0nsoyx51JdISp48XBO?=
 =?us-ascii?Q?TxRRbuMz9Lcos/qcXewvGcAtU//W85RzGilkDlRfM5t1yGEbDLH9BMwvTNut?=
 =?us-ascii?Q?eARgEp321Bm2iZ4RFrDX4adgu3RczckUHD2AIOgh8qVuLsZqzR72py0O9twu?=
 =?us-ascii?Q?/6ptWzhYaXu4HLMC/ovwygmjolSynTmAfLfcGqBvrPdyyr40qHyMusfEwfPY?=
 =?us-ascii?Q?ugmOTOAYMmqd78RCQ2QEBF3bXjahPWxgqAX+6puzi+isF7nqcwYyNgq22Hfm?=
 =?us-ascii?Q?cEUzFt/dC1al9ek6U9c6119z1DHfDrBkJjYlDG+rLSBpv3V2Ndk4iSwjyCZ0?=
 =?us-ascii?Q?G7zCDXe+w3p2jzC4Wc/jKnlZA4qleaha635cXAwnDjLHn8nq4lwHpXr7bshq?=
 =?us-ascii?Q?fthuDK/tMrvoIcteNQ/sQf88Sj7VE4BAZ9AZOwDfVgEnKnWO/3gOh4XZxbgP?=
 =?us-ascii?Q?VxngmZ/LnhRjdUOYmhYSxTSMCOlq0/o/u3Um5V+wb+A3DwSZsjPwEUms6w9L?=
 =?us-ascii?Q?fVIxU0Yvao2Yw+PIFVFshLyoNxekoTkT0qWcoSPFPrDuehZhp6RPr6OApSoR?=
 =?us-ascii?Q?wuE2+vGc6Seq5FvQX8QM7MCMx/Zj0WnH8InjuZ22B6cGR7YreenSfSsDZjaJ?=
 =?us-ascii?Q?WmhaGXblGQWh56HZ5NZLWlz2m/jl+g2tLRwxkVAAYLCnStDtvoAoG6b77OxX?=
 =?us-ascii?Q?JVcoD4xWjTsqIHSkMfzscIC0s38HG0As6wqR8l1t6RMxEBgWfLh4o9hm4CSh?=
 =?us-ascii?Q?GJobaormhrhXjsnkEDDUdj0cE7tOsDVriy0R9nAiNAhkWisdAROQRFt9p4ir?=
 =?us-ascii?Q?szuHvfsvgMPeySVZSs+Ib0A0o7GquepNIaPVqfnr6oh/FkoryCtZOZtdy2qW?=
 =?us-ascii?Q?3JZO5cbztVNk3FWgIqEViW1V9QEkff2zxt/kU7xQ2PvZU4jcWdsaOp/tO9ez?=
 =?us-ascii?Q?EJ+63CnwiSeqV73DwYwWmyC12KMdRJojWnLKl1Z6wTM0swpAV9uMOISgiJBX?=
 =?us-ascii?Q?uMw7lsCbcisExBw4WZCag0k8Xdp1KkYN/nO8EI9TMooYQVN+1rMf9mkUoRbY?=
 =?us-ascii?Q?ePBxLEz5VXNYMjid71i4d2isrmYXHypw831TTdtOIhd9/91HGuAOOUs9F7ge?=
 =?us-ascii?Q?QzLkzDgKAZZ6IJHH9/LRjoHI+3n6P9NIOoJPisgDmKGWuROrjn8bJgjB9zuM?=
 =?us-ascii?Q?Lygw+6xrA0+LrpJCND7p1/pavA5DSg+luxt2IlwX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41eba263-8100-4b87-8195-08dc896b484d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 16:35:04.6948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYYHaCdKVOwrlgkli8izvRL5LP7OHAlTblMJkTWPwxFDgkhTkc4Jub41ckzfCaR5vxUEHLO2yVkwfip/PbvXkeRgMI8wiOy6Xq41nkSB9NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
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
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 08/10] drm/xe: Add pending disable assert to handle_sche=
d_done
>=20
> Will help catch bugs in GuC state machine.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index e697732f1e74..9e1535c2d8f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1607,6 +1607,8 @@ static void handle_sched_done(struct xe_guc *guc, s=
truct xe_exec_queue *q)
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
>  	} else {
> +		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> +
>  		clear_exec_queue_pending_disable(q);
>  		if (q->guc->suspend_pending) {
>  			suspend_fence_signal(q);
> --=20
> 2.34.1
>=20
>=20
