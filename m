Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60931CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 15:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1783C10E9A1;
	Wed, 14 Oct 2026 15:26:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915AB10E9A1
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791991610; x=1823527610;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TX5juIbSln8cGhIXndztxMB+yBhYYa9OQNtwSWWrAMA=;
 b=dPiDXbjN29E1vzsFYK+GbRNhidyRLztnJbsYCCSD+bhS8S3SnzcyCIZV
 tbF8fl0bRU5fQU1MGuYUIhPv72JbWBQTZXokSaVPJ1vbOqqefrwStVBkG
 tqM8oG8oVp++nPViD/vbz/W55iqkUcbeJGM+jywprrmYkbZiOW+YtUkJg
 3l4ouegobDI7Var0hJWrl2hkO5r89FkABtVtyeFeQrnnnyVdSHOaGCMRh
 p1iCw66ty/jzGVLbV89hWPvCnkBIY/lbiMVRYVQcndjSzz5hlrDo+lBJM
 J0Z7t5J9dhvtHYRKjjGKNFkZgi25qR1uj0++I21puzr33/GAsMi4FaQjS Q==;
X-CSE-ConnectionGUID: PM0rNGvORSGQJ70haIrnhA==
X-CSE-MsgGUID: v8yO8gymSXOgAWxzBohUDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="641348"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="641348"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:26:50 -0700
X-CSE-ConnectionGUID: Rubc4+mjTy6lREURMNdLow==
X-CSE-MsgGUID: MNRCNldXRNWPWvJwM9f5jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1473060"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:26:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 08:26:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 08:26:48 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 08:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SArmOqTY5RpoHCCIauhICH3mBTAvlSUeaqOhEl/gStNMId3LtUx6zT/tVyEW3yErLhw2twbYp/h9qLIk5nt9wjw7D+kzj/1i64+xlyl/ombrPB4Zq8qALeV57UpUjZNrmRVGfd9r1QXgGBpwXHAaAfh9aA1r9j5BYkmknaGQeIhypHAHfHAbkfvjMbC6sxwdLsS7QPpJzhwmKw3HDPPNcn1l0e2qMToNFMlGojAsQ19S2AI1y1/2cQq1dIb2SWlH2oBaWtAcD/JTcatnOsuZfusumBGy9So/YoyxJSA/yM6W+xf+iHRnCQbd6JAtpFJQX8WFBTwb+N68az5wUOA/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjti/LpeZmx/hRjEOoij9Me+GSfjUDZl9fWYCFvx4FI=;
 b=fbHaJdDXPK3OR81rH8oZaDVMUC8vTGnZHGIblVa+8zXLLClgU0grNB7LsOJ4+/zuOGUTgILO7Q+3mtaq1YJd9OlgcAGqG7KleW2618p+9+btRkHxL9+cUjw2Kv2qaVoDE4p7juLShpcSqnZHShuk3qPf7XF0+7uClEkc6A05vY+dCP0D5LEbSPf9DqA3AshYxXgG8f+AYfoiaLpl9RxK46Jyz91uCvgN/hztfAVx4KNklbY60ekmJpjSSokgAXiNwCutMAlCefZe+ZGixfqI5ZijQ5kjniA622Gf7v/R8V4dXr1lcwsRN8Ox67r+u60RWHDcH3zMtGoVRcZp8mLTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by PH9PR11MB666607.namprd11.prod.outlook.com (2603:10b6:510:41b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 15:26:45 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 15:26:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Charles, Daniel" <daniel.charles@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Yao, Jia" <jia.yao@intel.com>, "Wang, X" <x.wang@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Thread-Topic: [PATCH 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Index: AQHdWrwb5SDSQgKtzU6fmDAj90Hir7b7jA6wgAGe/tA=
Date: Wed, 14 Oct 2026 15:26:45 +0000
Message-ID: <CH0PR11MB53954ACC11E4876ECAD84B2CE59D2@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-3-daniel.charles@intel.com>
 <CH0PR11MB53954320E7C1D1870CB0ECD0E59E2@CH0PR11MB5395.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB53954320E7C1D1870CB0ECD0E59E2@CH0PR11MB5395.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|PH9PR11MB666607:EE_
x-ms-office365-filtering-correlation-id: 9d66e1f2-116d-432a-bf82-08df2a078ead
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: gFb0OQZ8DTl4M/plTo3AEQmu9OqtEKVYLvui8gh/dm4H4Qm3OlIQdpvaUL150ayS6c97J1JS2xCSEFVIJ1o1MynC1k3mvQRDWAGTFQvUOfmP9mLEceYnpG0voFyrZh/QYIoefxg3L0UHNeyc/lfnyY8z5uAI76IDh7n1CTd2PzRWFlkT968kDmwmS7aBWIHMg18xwlcretbWKQ46OMIMOEAQetudZkr8LAHrWyzZG6aI3fzB40Znd+iHZlGnhHgqA/zeEuBNycjkXXmASin5Aj0i6fAH7tXeZ2CE1j4NBUMRiMCn4tbGRColJkLnQb/u3d1nAWj3KQnePgfygaOLyehF6/Akc7O98pWTDQTI+jleWWiGZXSJduZEYrvh0qSTBun8KHX+OZQQEjbL0pAbjiClMXjxIi1F/nePaonZaiGb/zSOuaoQGCxIqd2B7ffL09aejpLOdPHwEcme4d50kXUD3p46rPcB3JU/jegptEMpRjCWVMG3YqGX2SOVXJ4HpSaezjwLYLmaGk65mn7YtgXKM6nSIkxTS8IBuM9Y/cZTGeu0HFMC1eAtVoRA/VpIqB2r1eq6orDhSQ4gorbfh5xhasYOOsdXsZVocSAT5DDdo7Q5Kf3ArrmoRrx3+wR1TC5zsX+6ppPT9iu+ImDdorzHLjMojEbY51zIwKY/m/eG3bhlOsmypaFDru1pwblU2+aMeA6SJL4MCnn9aTbhilyszOQgP2PZRALPp9wwc3w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tlyaNUdnoydgAlSZP9wrtur4amvTkxvZr4lHh2QLG3HB6XSK/OU664akASMh?=
 =?us-ascii?Q?kRFLK02V7D+WrQkGGlPA9wlSYBqnlfl3eHyeb3XHRZrcbNN1wSHDzamzdADV?=
 =?us-ascii?Q?v3iodBTxU373x0GdfxUbIKrx+ZymIUxAKG0+AVsu5pYw2pbfM+MY0+mBEpGn?=
 =?us-ascii?Q?9xu56vvIQB3dn0IUQZXB3LaURMgnW014/qvvOc3EsaIZ1uzcdv5O9nY9TkEv?=
 =?us-ascii?Q?yWO0FzR3R7a6kYb0omKLflRt16B4gxBgXpvdjBYXoEniKTqXbzNG0CpsuRyx?=
 =?us-ascii?Q?6n+rB2g2Rxlph88GAJ0MgoXrMLRNnI39wTArSz+aIRi7LE9wJ3OUnIHGxj1W?=
 =?us-ascii?Q?ezYp4I/2dRfwEJsedRt2+GOil/1Dazj/10O3jELwrtxGeZHmc7gw8T55Kilv?=
 =?us-ascii?Q?Inky/ojhLQro6aiNwakx0exyocZFvnxN0Z8AS/02kcZ+wTKCUM0e/2XVPlk4?=
 =?us-ascii?Q?o175iUmJYXZpjYEkaWJk5Ad3tD7Hn5Sdk7HqMI//ocM+h+n+PfJWnUtetwx5?=
 =?us-ascii?Q?MoGE/jdbP6qMipG5zvqXlAULXgi61UqhpoGZi3OwJIVsIYQitvsaMXOXUpbU?=
 =?us-ascii?Q?kz6tRew4yCOdlVq6u2zErOZAuR3cNjuDWkguqI03aNDStdtuYr5LOgEfDsyb?=
 =?us-ascii?Q?JVN8srAhfVM4MiRHh4OgbG8rGD6uWKUztQfbDowc87FCqPg7AgGTfbCt3Vas?=
 =?us-ascii?Q?ejzJk4POSi/jOqgO9cMdhn/sLNXZWCD+3NcUfe3LCmOM7z9AJsRod7EOBcoF?=
 =?us-ascii?Q?g8Qf9R/1jt8PfKbOlW8Qpp0vZwQ2bGU/Zfc7sjRp/GFzf2XEZCOz5S2SHl8n?=
 =?us-ascii?Q?Lfe2nNf3aneYW2aQhmwrPSaf3qHymthwk/uAEHiuSEHhgSnWIECgOXmB4Xlp?=
 =?us-ascii?Q?ntGqZnfCyfLVLrq7rkfAABWTDEbEB2AQU/L4esQViY8HvkhLWCiV2T5UZzDQ?=
 =?us-ascii?Q?AJ8p7oQX72rjhWcjP8IMQiO6t7HH64ePJvOnu+x1vrXazXyWsUKGJpAvyoCg?=
 =?us-ascii?Q?Sus3yYAXh8RRv19S4WvR41lFmtSTSr5gO97eyJZoK6TRW3HB2PHqeyYfAoOM?=
 =?us-ascii?Q?GDUjnQpq07BbliLp2gxLIXjjGqrx4jU6lXLOil7TlVouS9o2IjfhMu/5VZYm?=
 =?us-ascii?Q?fHDkFH2Q3OmLAwMDaw3OUhIdTmbLe8Nf4zh7INFO0sfmpbiNo+NxMUIJhAmW?=
 =?us-ascii?Q?Lq8OE2aW5EOTaUC75KZXFf7XGQi6t1TNOAwKjmFDLO0oEx7gXJpUPqbYfUgf?=
 =?us-ascii?Q?em2MhKTmSiwWWtvl53dPjLFzvoye+He8mWtT8GOzhs0mTNe9eo5MV+UolqLe?=
 =?us-ascii?Q?NIXmuXHRdRcbWM9jui9nx2ey+1v+Vrn87G7VGpW7zGbhX2Lm0amlIcfw+wsm?=
 =?us-ascii?Q?lat7jJwu8KyrPqC0hIl09gwcuTHvyvp80O+fxlzsgy5jdI0E6tXDbHw958Iw?=
 =?us-ascii?Q?fOeUlNirm1WpRA5gaQwpyJZs/o42FFLikwWYhrkQdqLxVrjYb1KoBmZ/nilI?=
 =?us-ascii?Q?frXpDwxLhhD3nO1OnxXUlN3JP0CfJXaEXGH6cXNc42wsd/G/mr5K+EulbplC?=
 =?us-ascii?Q?k37LiKda28UpwKnhxc7k3H9TSva/uJVQ+hfsmNF3eAKObuWPLXyBV0zc4E7v?=
 =?us-ascii?Q?lOGpfZJZOiX5I6tGOzVJk4nnXftXDLEhT7IcQI71poywOcboBIWFPcBmCkcz?=
 =?us-ascii?Q?BtfQGfHGPCPG/PuEiYlP0xCz/ricJuz75MihHn7OTj2RmLp9bzYYshzolmUs?=
 =?us-ascii?Q?EwuYNAd15dIvU5SXBVweDFj2EAoBzuTrzD7iTuffdypXYSmsKYSAOdWY+5nh?=
x-ms-exchange-antispam-messagedata-1: 5dTSIcsAecxgrQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HDhUd1R4VGSFHiB3GzjC2EoOEuezw/mgCbfV+2bhB06NOqwfZ9S9BIVzLxtj5BNJdl580tR7AE7RAbdiRnScQPzQZBhhvYb9FxG5LAqlJuU68c8CzkSyWo1gkfT6t48ChW2pC6trkb/IVMAf4O1tBHj1t0BWXGIpPwLT/MlAhoEn7IXeX0+LMOMVoaSlmTxbYkB38XphPj4ct15OGtyES20HAAZm2TSzhQOt7Gfd7DeNJD0f1JX6/2vP8TdRhm57tBD8xABF4MD/iMA+EvoOPepIVNEHFTo91eMxUznsvpyHi3vNmn1BEY1MXqXjUKZ96Aa7LkeZ/tlwI4jhC9DdpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d66e1f2-116d-432a-bf82-08df2a078ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 15:26:45.6285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KlrF2qa36XhNWf/FZsLac1VzObyvt72bqHfbF1nnZE/yy4lq64FFtst2mllb/hc9e6QHWBOBLhszfujAFlwq/sB5h4wr/VsH4nzkM2vIYc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB666607
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
From: Cavitt, Jonathan=20
Sent: Tuesday, October 13, 2026 7:47 AM
To: Charles, Daniel <daniel.charles@intel.com>; intel-xe@lists.freedesktop.=
org; Brost, Matthew <matthew.brost@intel.com>
Cc: x.wang@intnel.com; Yao, Jia <jia.yao@intel.com>; Wang, X <x.wang@intel.=
com>
Subject: RE: [PATCH 2/3] drm/xe: Disable scheduling early on FD close to av=
oid CAT error cascade
>=20
> -----Original Message-----
> From: Charles, Daniel <daniel.charles@intel.com>=20
> Sent: Monday, October 12, 2026 7:35 PM
> To: intel-xe@lists.freedesktop.org
> Cc: x.wang@intnel.com; Yao, Jia <jia.yao@intel.com>; Cavitt, Jonathan <jo=
nathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Wang, X=
 <x.wang@intel.com>
> Subject: [PATCH 2/3] drm/xe: Disable scheduling early on FD close to avoi=
d CAT error cascade
> >=20
> > From: Matthew Brost <matthew.brost@intel.com>
> >=20
> > When an FD is closed with many exec queues, teardown relies on the TDR
> > path to clean up scheduling. However, the TDR handling is serialized
> > (i.e., only one exec queue is processed at a time), which can make it
> > too slow compared to GuC scheduling activity.
> >=20
> > In this window, GuC may continue to schedule contexts backed by
> > invalid page tables, leading to a cascade of CAT errors and repeated
> > engine resets. This significantly increases recovery time and can
> > degrade system stability.
> >=20
> > To mitigate this, eagerly disable scheduling by sending a self-message
> > outside of the TDR path. This prevents further scheduling of invalid
> > contexts and avoids the CAT error/reset cascade.
> >=20
> > This change improves robustness and reduces recovery latency in
> > multiple queue teardown scenarios.
> >=20
> > Cc: Wang Xin <x.wang@intel.com>
> > Cc: Jia Yao <jia.yao@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Tested-by: Jia Yao <jia.yao@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>=20
> I think this patch was designed as a holdover for until exec_queue_kill_s=
ync
> was implemented, and as such is unneeded in the series that introduces
> exec_queue_kill_sync.
>=20
> Matt, is this correct?  Or does this patch serve a different purpose?
>=20
> I'm not blocking on this (yet), just want some clarification.

I received clarification via DM and yes, this patch is still necessary.
My RB still stands.
-Jonathan Cavitt

> -Jonathan Cavitt
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c           | 46 ++++++++++++++++++--
> >  2 files changed, 43 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu=
/drm/xe/xe_guc_exec_queue_types.h
> > index 74b711abe2572..89397e1e65465 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
> >  	 * a message needs to sent through the GPU scheduler but memory
> >  	 * allocations are not allowed.
> >  	 */
> > -#define MAX_STATIC_MSG_TYPE	4
> > +#define MAX_STATIC_MSG_TYPE	5
> >  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> >  	/** @destroy_async: do final destroy async from this worker */
> >  	struct work_struct destroy_async;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe=
_guc_submit.c
> > index c4ef3e9bf7a18..609af66b343d5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2045,12 +2045,23 @@ static void __guc_exec_queue_process_msg_cgp_sy=
nc(struct xe_sched_msg *msg,
> >  		guc_exec_queue_send_cgp_sync(q, 0);
> >  }
> > =20
> > +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg=
,
> > +					      bool bound)
> > +{
> > +	struct xe_exec_queue *q =3D msg->private_data;
> > +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q=
);
> > +
> > +	if (exec_queue_enabled(primary) && bound)
> > +		disable_scheduling(primary, true);
> > +}
> > +
> >  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> >  #define SET_SCHED_PROPS			2
> >  #define SUSPEND				3
> >  #define RESUME				4
> >  #define SET_MULTI_QUEUE_PRIORITY	5
> >  #define CGP_SYNC_MSG			6
> > +#define KILL				7
> >  #define OPCODE_MASK	0xf
> >  #define MSG_LOCKED	BIT(8)
> >  #define MSG_HEAD	BIT(9)
> > @@ -2085,6 +2096,9 @@ static void guc_exec_queue_process_msg(struct xe_=
sched_msg *msg,
> >  	case CGP_SYNC_MSG:
> >  		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
> >  		break;
> > +	case KILL:
> > +		__guc_exec_queue_process_msg_kill(msg, bound);
> > +		break;
> >  	default:
> >  		XE_WARN_ON("Unknown message type");
> >  	}
> > @@ -2211,8 +2225,19 @@ static int guc_exec_queue_init(struct xe_exec_qu=
eue *q)
> >  	return err;
> >  }
> > =20
> > +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> > +				       struct xe_sched_msg *msg,
> > +				       u32 opcode);
> > +
> > +#define STATIC_MSG_CLEANUP	0
> > +#define STATIC_MSG_SUSPEND	1
> > +#define STATIC_MSG_RESUME	2
> > +#define STATIC_MSG_CGP_SYNC	3
> > +#define STATIC_MSG_KILL		4
> >  static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >  {
> > +	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_KILL;
> > +
> >  	trace_xe_exec_queue_kill(q);
> >  	set_exec_queue_killed(q);
> >  	/*
> > @@ -2222,6 +2247,23 @@ static void guc_exec_queue_kill(struct xe_exec_q=
ueue *q)
> >  	 * stays set until the queue is torn down.
> >  	 */
> >  	suspend_wait_wake(q);
> > +
> > +	/*
> > +	 * We eagerly send a message to ourselves to disable scheduling, as t=
he
> > +	 * TDR is serialized (i.e., only one exec queue is processed at a tim=
e).
> > +	 * If an FD is closed with many exec queues, the TDR can be slower th=
an
> > +	 * the GuC scheduling contexts with invalid page tables, creating a
> > +	 * cascade of CAT errors and engine resets, which is quite slow. Avoi=
d
> > +	 * this by immediately disabling scheduling outside of the TDR.
> > +	 */
> > +	if (kref_read(&q->refcount) && !exec_queue_wedged(q)) {
> > +		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> > +
> > +		xe_sched_msg_lock(sched);
> > +		guc_exec_queue_try_add_msg(q, msg, KILL);
> > +		xe_sched_msg_unlock(sched);
> > +	}
> > +
> >  	xe_guc_exec_queue_trigger_cleanup(q);
> >  }
> > =20
> > @@ -2274,10 +2316,6 @@ static bool guc_exec_queue_try_add_msg(struct xe=
_exec_queue *q,
> >  	return true;
> >  }
> > =20
> > -#define STATIC_MSG_CLEANUP	0
> > -#define STATIC_MSG_SUSPEND	1
> > -#define STATIC_MSG_RESUME	2
> > -#define STATIC_MSG_CGP_SYNC	3
> >  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
> >  {
> >  	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_CLEANUP=
;
> > --=20
> > 2.43.0
> >=20
> >=20
>=20
