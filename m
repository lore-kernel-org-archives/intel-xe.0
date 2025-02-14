Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1F8C021A0
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 02:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BD010EBD6;
	Fri, 14 Feb 2025 02:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cq3Ob+Z9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810CF10EBD6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 02:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739499200; x=1771035200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QuyIj001+XxkNhHmKFKKeKyud0rNyPdsLpFg8begieA=;
 b=Cq3Ob+Z9DwUK7lguzH0jlx9BPNrQm/XJYVFUc5F6y71DSKMX+lrxOj5q
 j7TVHnUvBDvN9t3M4ywqn7qKOW3YIXEdDOUMkeOB9LMRsuwRbicPpwb9d
 8UM7edc151Ion/n7krYywkToj+WEZaJ9HbQfOReXx4Jg+i5l3jns/FVtw
 p/2aAklL5BJIroRpSO6GrswrYf7t+nC3Yemch66jRxXuV+4PdnvUlF0/G
 gT8tSpurT33XCNrmh5hHM1E2MziSjeC4IK7lR+ExjWyH+EaAgInCEsH+a
 TrrTYJtYxntldP0sds7Z3IeVseAuaSfoay/HuHbJmlhlws39/arkZJD27 w==;
X-CSE-ConnectionGUID: rKOdbZNoQFOSN9lxiDeSgg==
X-CSE-MsgGUID: r7yLFBePQlOIuxKNjcFTjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="44001090"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="44001090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 18:13:20 -0800
X-CSE-ConnectionGUID: 8sQtvt4lRwSBa0tY363DyA==
X-CSE-MsgGUID: O3FuNCtmTQiD2tNSidUgvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114218270"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 18:13:20 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 13 Feb 2025 18:13:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 18:13:19 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 18:13:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTmofMqQNSLzhv9gZ/jvjfP3HcrtVhRHIueRhcodEFh0qGEpabrJD32yrTqHjRSw5OlRRCYlGJ2b4jRfuBEfJKxAGZGPE5GOjebAs8LRANfr6oLss6xPL81jgSNqPjxIF0+0nuIWMhvp6TMC71PXCv1752RUVL6jInMzw3NA3sc7XjAopfB6JiSDTmP5Q63GzUel1GxtNAFY898IANgBDRq47Zq8pdnqAGVVDEH4o0Q942/er8Ul9mnNMyCkDdyITgScptXNo9LEoMgvJbZzQT3el5iqp+IXn0PxOCS1wiiAbEwZk+dJhbqfocjCyVKqowtZ+RqTE4hclHk+hPqWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnpnqW3khlIS66aZ3cJfzIHmu7tRtv9dNsT1NtczUTc=;
 b=Al2AiYMm9iOQ9fa6Hiy5idd6qYiXWEOIjYN/d04p6CpZHyeGsl/SFLEuNe4ffi06+7GYHS94XdxfJse0EgGo+B1O5v2As6w+wkKPYOUqMIBzgkn8rljRUpDTyEpiIFxh0l+hVaTLnBdzgoGjB3uELsBJry3LkGyERURSd4/CPn/BguVUCTjTLzANKxV1jmdOcfe+d8QAdv9GKAO9BhjZGl9XaXBRoga6WYx/wS0hP29/CgvzBO12R+ByHZk7WBKPuobMaumHNshBuzPny1ViKwMWkLp9bOdY00HC0xpS97M29NThfdofVBu+J6kD1mWWbDD3wOoPHE2KxXVaCTwPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 02:12:58 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%6]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 02:12:58 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/debugfs: Add missing xe_pm_runtime_put in
 wedge_mode_set
Thread-Topic: [PATCH] drm/xe/debugfs: Add missing xe_pm_runtime_put in
 wedge_mode_set
Thread-Index: AQHbfmweg8i6h66Dl0KPvKCAG8PlYrNF33UAgAAY8cA=
Date: Fri, 14 Feb 2025 02:12:58 +0000
Message-ID: <DM4PR11MB5456C2C99492FD1EEF5C12DAEAFE2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250213230322.1180621-1-shuicheng.lin@intel.com>
 <Z65-tkdKpqzH2gMg@intel.com>
In-Reply-To: <Z65-tkdKpqzH2gMg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS0PR11MB7286:EE_
x-ms-office365-filtering-correlation-id: 428fa21c-1040-4040-41e1-08dd4c9d1a0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?E4lMBSv7afwH4eP5zEvpg599HVfeGuN+Ak/Q8YAjN6OrofYFOEj32Ox8J5dy?=
 =?us-ascii?Q?+M09/xWspi9wAdXR7W+ewpMaQ5PAYyqijXXrxdk61MQWJua1LUCFQWIACfgd?=
 =?us-ascii?Q?4SWpd5gvz5nFrWvY8oyj4xleJ+LD0/5jJb2dmRFm6cY7PIBkFNTGPX2Z9uR/?=
 =?us-ascii?Q?OeaMIoQTJgds7rQgZczn/hKmJ0HubGcRbtdV4XazixFve49izXnnVZP/K8DC?=
 =?us-ascii?Q?NG3lQe0qHx4ZVPFmuY+1m/jS39QIJpEythncckvpsqnLke7H4N5b8+V3ol1i?=
 =?us-ascii?Q?yjLcuVDqPtT51uDEodgNwz5hiUJuGKCE15YG5w5BCouvLaobIJG3lQw1FEiI?=
 =?us-ascii?Q?jm4982lNd0nwCy5n10E2m8yGlV8FM45hd1s/kOyBmmfjBI3Jz4qoPhaHKPIC?=
 =?us-ascii?Q?y8wNkXHCNa0uZaPKtxMiWAo7YeLGPGIZkvS4n6TeCC3Y6hLPQbJ70XGHuCSq?=
 =?us-ascii?Q?GXeGPXPfiq2PpTJuH3FSK4CGobNlAFu2OqqqUJcHUmA6LmBxFll4NNRhcT8m?=
 =?us-ascii?Q?e5q/OjYY9Z4GfzFUFkeaQASuW4HffV8JAaM5leXcbfXNMhwQrWGtW6dEs5H4?=
 =?us-ascii?Q?ckx1mixDL8O3WsZ+kAAPK2AXMskZ+wQMNkheBw4v7GcywWiQVDbh7NezdDb9?=
 =?us-ascii?Q?tElcSu8YqbI80hzHTF5t+1GTjOsn58qSi4+Q2cDiWYudAv8nOeQrrXJS0J/a?=
 =?us-ascii?Q?frrUob5ubH+jP2cuJ1NIEytG2FpbeKjenBzBbjnfWffgWyghOeEFiTQR4osm?=
 =?us-ascii?Q?9X3eR5dO8+mKxmfkQBVmXKUXM9ftpRPiaXvSiLWMbca2QlAYgo1uMMrd8JRH?=
 =?us-ascii?Q?LfEiv9+mZyFG7gzAZT+gnqbj6iB71IdAVAhwB4jpxLdZPXYUVJvfRS/yEHPz?=
 =?us-ascii?Q?KUk1lneqOvgmQfFzLI5vTOBiQKLiV+kYCFOJMpoZ4sMcj62CQXR6sqFlkc1X?=
 =?us-ascii?Q?K2a/eTP9Syp6kWgeRqB+d3ijwWjxvCvOT0knMWb+bXHF2H+F4NgK6W2yFDFi?=
 =?us-ascii?Q?wGl9TUzYdxI6ywxWXRTBxNO+25EVCZm4GIcouwEhFlVb0LOmaGrhcEtbGikq?=
 =?us-ascii?Q?7YM6K6WAOtDuvf0yexN765LVVWPXqg1taSD8c4OYxynAchVQYbFckoZod66+?=
 =?us-ascii?Q?gKmJ8Tz1bEz9z7hsjOSHrGDZLns0E9ZPwcRtoujDp0imI6MpayHiSDjZe3BD?=
 =?us-ascii?Q?U1wxep6s1isFgu8AVJKZHrjJIpALnCJu56HpOitsDYVFgMZeILzfitN9UpQp?=
 =?us-ascii?Q?2GkBejdwZCKuQhT4dfu657LHf6EIHmtvplFp0WG9zLo2D5jKtJW0XRFCMDI9?=
 =?us-ascii?Q?KYKMe38oU6AQu/a6n9aoQwtbYCL8spahSKMdXXJjPV279AFeyA/Aab3resz2?=
 =?us-ascii?Q?Tzh4Y72fEpEpzhBnGiVvoZfZwR4AVIm2h1ki8NHKop5868HC1xGEruAHZIJP?=
 =?us-ascii?Q?RXb6udfFJQsHutLQdLTjlIqt+Ksk5/vE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XlzxjDnwCjA0yW67VBS0KDBHw2eWljjQGzRerTcqfXeiSz0Up2ov2/5sAM3C?=
 =?us-ascii?Q?mw4xXF2E4pHMeNQdRd3xk9tnofU7O9GZ/vuVe8La+gS+jRCMhqaH5eIz9FeK?=
 =?us-ascii?Q?VVbxJwChZfjEl+pn6o3NAS21m1K7U4GBgiUtgwDKTxRa3b7nhSuUovvccuuv?=
 =?us-ascii?Q?NRZGilSL7i6IaPPipR5zH/OnyhVAv2It0OXwg6igAU3tdBISIAhgSq4JYbmc?=
 =?us-ascii?Q?m5PPB/PPeQ2+++SoK/4XfWlG3di2FcwKx/aDdp+LWYrSQGSVc2jXnLpn7lw5?=
 =?us-ascii?Q?0yiP6bsBQ71RcEeJ9ZkoJA1MM07MbUgqVYCMS+2igb/l8/9y7OUdzZ7vWT8J?=
 =?us-ascii?Q?SVoEHpx+kRmccyPwj/uPxwVBHTozwvnq9pBvJJDvs43axKnWKuZKfZNyFHkG?=
 =?us-ascii?Q?acxP9bETzCVUBMmb98VPgCvIVttSVTp4+OK12/KB4TUp7A7QBKQh2HRvFvrb?=
 =?us-ascii?Q?gLq2nOiv1baNvupaGjzVdCbfTVkTunA/y1OUpEFhexL3UTcvDFJsblkj92lH?=
 =?us-ascii?Q?6v6A6r70hgKA0sTG9zjoD/BFNL6FV/0Im1ZDJ9vr8xJTUEqbhaFATjLoGHCL?=
 =?us-ascii?Q?bOBSakuBQx88H3by3Ru6PyF5qD28MnJ4q4wEYcgUERlMF8UrgGo/uzK94rUO?=
 =?us-ascii?Q?XiPU9zg1d+AlEAdNmcKMaLU/D6MMaiu1909CpdJvds5MrjP67Wj01d5kMYjT?=
 =?us-ascii?Q?ijQn6y6O7cCjRN7xsrWn5AifWd3+TEd6FpBGZYbga4SAB3yiyOcvlJy7JzdS?=
 =?us-ascii?Q?5rCeUIS4lLcHw5iKD9twe0eV8b9FnFihS+J/oFskoiONRlUHxfq+xIF90jz9?=
 =?us-ascii?Q?6j4SgbavDyLgWcLdFr3gsYnqtrIcCrXT3SO92xKNiCq6Cz5O69k9ywVVQKhh?=
 =?us-ascii?Q?rVII+JrT6aeNm3t6kaUPLPvYul+UEC5ZzIefrrJTMJLLnchiMGxFW2FN4bBR?=
 =?us-ascii?Q?71zLEbqoaAUMfhH0R5jq57WMDSznKVRT9dM6MF5gh+U+RWY8rYt2FOf2d/Ul?=
 =?us-ascii?Q?he1rTB2WyS9jhRYCntQLx8WuIt62DGCXhamurZLap40hgpgtCXOVQdzryzIL?=
 =?us-ascii?Q?NvbExBt6cUMl82uOsRTXPCfDtvgPcYHq4//0b1UAW10oFlde3bDdm4TWW7TV?=
 =?us-ascii?Q?1yWN2opSjyucgy7NTcNF0qDymSvFy7VvwIakv71WuqldxO8V4uqsEuf38VMv?=
 =?us-ascii?Q?WYtMc1VIZypK9YTnQTzbBIJhuhFTxi0h6QNhOe+M9CduKcfRusGDIxSPaXAD?=
 =?us-ascii?Q?rkruOGfj96xKNZMmWlHSOekXYWlrpw+O512SfUvXV4/tHeGtOT2Ro7eFnMbs?=
 =?us-ascii?Q?iJJXawTSuW9ylAIAlYhwRygScMXd7W7rGPn91/pD3SqXkMCTIRUf0hmt0aZb?=
 =?us-ascii?Q?I4fWV9iluS6AP5RmYNA7eZQfgpaY73+S8A68dZlOse/lLOiWRYpl57DzEkG1?=
 =?us-ascii?Q?4LeQzG8eHr0EzRyp+6oanauc/IUUMlGFrqmiRMLih84c4dbh4bIAhsIN1C+i?=
 =?us-ascii?Q?FHmF7J244czNVm4DSeqzzga8RnEqfTcuWLF/2DhMvRZQcP1c+aHMkmOJ8oZF?=
 =?us-ascii?Q?bEtAqFrZ2F9IR14Y7aP98Q17PWJViPalQWEGPN3W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428fa21c-1040-4040-41e1-08dd4c9d1a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 02:12:58.6953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZG6czVmn13PF0zbwtK+vP8qMiwygQpss+RBZ878jwH50iatoI6EW/JwHaYfxUIIU62tvaU7w16W3T+ViiudgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, February 13, 2025 3:23 PM
> To: Lin, Shuicheng <shuicheng.lin@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/debugfs: Add missing xe_pm_runtime_put in
> wedge_mode_set
>=20
> On Thu, Feb 13, 2025 at 11:03:22PM +0000, Shuicheng Lin wrote:
> > xe_pm_runtime_put is missed in the failure path.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c index 56cb3788e752..761e00cb6437
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -176,6 +176,7 @@ static ssize_t wedged_mode_set(struct file *f, cons=
t
> char __user *ubuf,
> >  		ret =3D xe_guc_ads_scheduler_policy_toggle_reset(&gt-
> >uc.guc.ads);
> >  		if (ret) {
> >  			xe_gt_err(gt, "Failed to update GuC ADS scheduler
> policy. GuC may
> > still cause engine reset even with wedged_mode=3D2\n");
> > +			xe_pm_runtime_put(xe);
>=20
> to ensure a git-grep alignment in the balance we try to use goto in cases=
 like
> this...
>=20
> so it would be something like
>=20
> ssize_t ret =3D size;
>=20
> - return -EIO;
> + ret =3D -EIO;
> + goto out;
>=20
>=20
> +out
> xe_pm_runtime_put(xe);
>=20
> - return size;
> + return ret;

The ret value is changed to 0 with " ret =3D kstrtouint_from_user(ubuf, siz=
e, 0, &wedged_mode); ".
So I have to set "ret=3Dsize;" before the "for_each_gt" loop.
It makes me prefer to go with this one. What is your idea about it?
Thanks.

>=20
> But well, the code itself is right and better to protect.
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> just let me know if you are taking the goto approach or if I should get t=
his one
> merged.
>=20
> Thanks,
> Rodrigo.
>=20
> >  			return -EIO;
> >  		}
> >  	}
> > --
> > 2.25.1
> >
