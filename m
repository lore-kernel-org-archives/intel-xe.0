Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F022ECD4857
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 17:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8710E81A;
	Wed,  4 Sep 2024 17:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVBoO1yX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA01910E81A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725470837; x=1757006837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hoLstTdenuq+OPakawRlLZeJw3Oh8fnlUuMofg432wU=;
 b=lVBoO1yXLyk80zq7fHFvF0intFWV4ThAyVWRCrUtPno5zo0xWnDJA5rf
 eHyG5i5AXL+xP4KdvSknXMn5udVq647fZf+8NuL/2HdYr0kI4D/Cve35Y
 3zWKnZYO9/01nPXt5SN2jz5gSIY1nseX+gl5ZCPDBWSgDlCf8CA3aTOGR
 OJKefy08/ereiNp+fIperpQZNbwzsnYzpgwGcnc1bR5xP6AWzfr3/kXxD
 uTCr6wHev0WkXIxSQuuLViUnD0Yyp6GNbtb88139scIArAqcQGARXtJiH
 R+mh/RYvqL598ixISepgPy1I75bCjf21WIB5JeHQs/Ob3cnCIAsN9ZQhW w==;
X-CSE-ConnectionGUID: 6hrkdaiaT2W59KoXTzHLLQ==
X-CSE-MsgGUID: VupoB3mQSS+MRcXEXnfsyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24262466"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24262466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:27:16 -0700
X-CSE-ConnectionGUID: CgNelwVmSH2fJVlnl1ajcw==
X-CSE-MsgGUID: +GcJjQvuTSCF/lctExZaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="69499187"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 10:27:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:27:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:27:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 10:27:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 10:26:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lInQ474UB720M18KjXfXB4rXOI3nwgcycL5izsOfkwW0rUHFTGzfnB8hyBkL9utkHhbwhc374JQRbIXERPbvZ3f02Pjps5fADjjlDV+4P6yEAs8DK2V+zoS9CDlRIq0VIIK6aGNf9IKhKlr13xOP+N6sy+DQi+/NOgDjHppdkRNyHfVgWjWjvOi1TAwi5i/YpWpegPrzYMJ4d6vmrS4Ks1roAzUpbsjRdqMjs3Zl8+UJOwdHo1GiebcvnYY5igtbqBg2h5G8IhnKCHXO4k7pitzfJKKOYzsSo/kCbgBYOqtPr+TQS3D7CrqQ8wc7e/pcy2RZ7qf34CdMUafN2lHrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/ZoXwvuA//nKMbao6skrcUy0Ert0JBmVpgN8FlQFNM=;
 b=GgsD+6rltzCe3iSjj9V7qZx73z4PNR28HSCboSPEcKa3ySsov83E37D7Ibg39TPR64Kl49JomygXx5r+f8Hq054pWBgBDjtC2/iEdMHva+anI9Z3s2Y+FAno0ksxDcO/iIlo8Tdmj7upAp/kjT3Cf9WAxCCRVd9COUYYZ3XW3ThTyuLHHawceY33YbWJ40lNbl/W0kGNRsxmfexpFZrA9yh1CkZn3VoU4ugUWa44SXTB16f30uohfu7rWoeTOtKjlN4ewGeArja8bmmlvKnwZMJaIc3gJMSiOdYLlFUpoKHzm1ndSVW+fHsHTK3x8uzlE69jHZGCiP3z+NSKaS+oCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB4918.namprd11.prod.outlook.com (2603:10b6:510:31::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 17:26:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 17:26:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Suppress missing outer rpm protection warning
Thread-Topic: [PATCH] drm/xe: Suppress missing outer rpm protection warning
Thread-Index: AQHa/uq4ck97Ob8paUGfjuytTRLoX7JH4BRQ
Date: Wed, 4 Sep 2024 17:26:47 +0000
Message-ID: <CH0PR11MB5444C7A17B3B4943ABC55C46E59C2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240904165116.22829-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240904165116.22829-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB4918:EE_
x-ms-office365-filtering-correlation-id: 92717489-f0f9-41f2-9a4b-08dccd06c15a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GDjSI+r0+SMX1RrwMadcZcd72Yorg05FfTywPR0irr/L0/0qz4rxq20zKR2Z?=
 =?us-ascii?Q?V58x8bI9stdlzdcKy35mCYWiep6L/4pigCjpprkSdVM5abyp8UnIpNSBR7+w?=
 =?us-ascii?Q?ZuNmC7iVzMOlup+pk/Gt8EmXMBN2Hkya7QRHVrihorTroVc3EINbZyQt//Rc?=
 =?us-ascii?Q?iX2o9xP8MVVizF9krjJ6aMNx08/2P47Rm8mwvNLzBboYPRsov40RuZJhtdEP?=
 =?us-ascii?Q?LRnT/qPmLaBiwY/Kf/5CWclprsBwSKz+EiPArxUYfRynLxlVg1D2IRQs0zI5?=
 =?us-ascii?Q?3vWdpFbn6q4Vkl7bsRljQ8TNoKK+0kYu7dppvG+f7oX970eO4lPd2e/vZUO+?=
 =?us-ascii?Q?wxkPOKqQzAobXy/9fmgup8mpP4ufVd95ccvBCZO2Lf5o0J+D6/z8RsUYDVWr?=
 =?us-ascii?Q?FEV6buETk3xFmlpkQEn7RHXfhsyZ5O/h9laQZnBwBVFCpdoWvuHggkQxoNeL?=
 =?us-ascii?Q?5TN9Qo5m/oe06vO7sTS0xvilu2BdZhxm12Qu1VVcdEtElE7nh/ePi9pR1KyM?=
 =?us-ascii?Q?R/yPDNEINXdFWzYrqZajOkQwlI7o3L8O4XRs813JSpI7kLecepmhJv0r8+KA?=
 =?us-ascii?Q?2lG3LnhV5LdQZxaUR9kwAjQJVjqwzNZr20eI1LkMwsvHehs35i0/ztuSGeID?=
 =?us-ascii?Q?EnjWSkf85sXL5NqArfibcu7dhoLqylnqO6mJpemebh3OVpuCfzGLFl/QIrqJ?=
 =?us-ascii?Q?t2AovBZ7zBbCasYHIn8g1gCjpE3rM2xHHNUs2/FX+oB3RPa4sj18fAljU3M2?=
 =?us-ascii?Q?Twf6SlZnkGAEzF97AmUD1ix64fT4OGNjT/B0CIpqX/uZZ4bRaBGPY3HPFXML?=
 =?us-ascii?Q?PIf3GyLpnb+ky1iynz7xOCWMKOWox7/KLcEP49sHzUoU/2EaLji5stsxNZym?=
 =?us-ascii?Q?V5rbWGfC54dLsbGc6thJOUjMzlMtsbCUFA64JloiFM/GYSMNefIULU6fB6iq?=
 =?us-ascii?Q?oIP4KnjDfFj4RIUIen0E8cZppG16DygrSoG9xBEnW389DZe6eYFbC3j9o3QX?=
 =?us-ascii?Q?NKu4LX1kdW7KbDh5JhcRh6M+Sm7Iw66ODQVMDCqYS1UkXC7fzNahPcZDGY3A?=
 =?us-ascii?Q?tlaksCspZeYun3vQPaGpUdOnf+kM191XVvZIkDJ802ZeVxQ+f1Km7BH+x3Vf?=
 =?us-ascii?Q?qYV52U17Og0XX45t0r6bAJ58aptLk3mgTfp241C4LbouY0I7uFrzelCG5n+T?=
 =?us-ascii?Q?8B84Ea6uA44iIl6EtHYR3O+tNk7o4X5zjkRZ4HtW5WQ3899cR38+D6ZMAxIm?=
 =?us-ascii?Q?q2MGvduVXJzEDJq5f/mfzHNfTLMjN2HJjXG+fMetsBeQFgh9j5DvBEEzQ8IT?=
 =?us-ascii?Q?Hbo1rS+0Ghu9Oci8+LeMF+TTbc/lioXHkDffg5bME2VWRkGv4tePCeVgVyy4?=
 =?us-ascii?Q?l84b8y1TWgm0YHgt+XmMiYn2m05ONZkDizhP6hEOsaaziEcpmw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zETif+aClJf5gjnUZ2VSYr82TgpLcJ5id1cI330XtKPPkZQ8iGrUejuR3di2?=
 =?us-ascii?Q?an/dCfRmSClfNPIapIWINffGXx0MeQ+Jiab2UokaBPPWPAmjRS0ElvGCeMP0?=
 =?us-ascii?Q?7zyCnWL2k2YQoUPuESvLc36KwcPfVnT8n7Vsp3JHL2WDjmn+dpFZ6NIJtcJ2?=
 =?us-ascii?Q?dRHRaWyQTNrQJeO0QotkzuYDKJpuCldUsitniIrRMtR/5Rxt6wFbIpPC1UD2?=
 =?us-ascii?Q?OQOFn+WAlHBwSx9fJKktmZo7JE2H2bnXMch+SfSg3M1/r1Lo8DGxy1qsnzw/?=
 =?us-ascii?Q?/4gajRWvMSfri185NN6fZrvzon+LZNm2B1Okg8gEPrJBerlZkNqoLndYFMw8?=
 =?us-ascii?Q?D770ae8uUn3slZa3joNG8hWzFd2AupVAajVZ0F8A3kJClNRkvqyHaUVIBSt7?=
 =?us-ascii?Q?D3qzkJxvwS+cCIbR4SZ6E2wRypxLAvlRToiPAGL25+2pp62CQqD8hSUkP9fQ?=
 =?us-ascii?Q?/T+BSEivNqHNmcZJ+BupYgCDiNNhALiaSuxJZYOw4aKQN60imHfq76yHi+wD?=
 =?us-ascii?Q?TRwAvXDW+L/NZjQXBX6kWDqgf+7CMfmhM5hkA96u2Hyf5szIiVwR7DBPAt4w?=
 =?us-ascii?Q?rzr5dyF98QIpMwLIINzcgji2QqLgXa22C4Pmig/aZUIlNi+LBjtMfpGUuApr?=
 =?us-ascii?Q?xD4DpFTtTd5ug5WCkFruTi2d8DnHec1qLRUXKcwBJtYcJIXwZTx8h0MjHaMf?=
 =?us-ascii?Q?pC3uB8HYDQFSBtANkIBDuwe3fcx6cMWPlgvcSs8Qybo0ICAgAKC7zrjcrykj?=
 =?us-ascii?Q?f5CH+I90nM+Pu5itrDzBd/P35tMv+7oKf6qvbjAIu1kBPR/J+YnELt47ews6?=
 =?us-ascii?Q?UsFmxNkia88Y4v7e/459Okvmjku91UayLeixnrsr6r5zYsAYQ/MU2XdHwzY7?=
 =?us-ascii?Q?AMABwSDL/JAeE+O+61ZZe7j1air8IqvJyr5PWq0njGMCbSM5QG6FW70xhPhA?=
 =?us-ascii?Q?sC9iUQSdo1f7ucadLFZAnWQMnC1euLsS/Hwxg/JSLmztTW2rNIdjsGcJrfAF?=
 =?us-ascii?Q?Ughb6224AxtM9sHm3gd0q55VcWIDcMZh/E9b0edDzKYXHbExComDFGI8bkMF?=
 =?us-ascii?Q?PgrjvevMPDYjLgJtRERolj+2ThRpPx4xgzOmxRMvUVS66+IX0l6V0+tRjK9w?=
 =?us-ascii?Q?O00F3SL3nv5KslkG4VlZxjSbjTf686XSJGCG6uf/0jVNHx8YOLnJyPcpiV6K?=
 =?us-ascii?Q?wNoG4I9FICJx3saS32caHyAsLtIN7EpOE5e0ZaqUtkhFEt6EY/eSuuIpDJfZ?=
 =?us-ascii?Q?XPtqXPYSy+SGoQnR+6ahHSoRHrwtdEYYSwTiZqU6E6J1d79QJ9seUhU1haRJ?=
 =?us-ascii?Q?K+vVZhDlN+Cr4qc8EmrV+bn3tTZadJuOQNyeyRRz95Xl0tsWfN44gtzI6VJF?=
 =?us-ascii?Q?aLt6CAP9D4+q59I+P97dlQjQo8hqWzuHVoDiSmpXXeNwyDobWpnPo2oIvVnt?=
 =?us-ascii?Q?pu5xK9n+vFiPoGKDjwi1heeyK9Q7LgKjzVuazd7OS6Vhz+Y/cJv9nxtnQFi+?=
 =?us-ascii?Q?aqhbBh3vAz/5Q+v1LJqHVHbR/3djDappGWbeSgiBbmqsdeJlLtccoTWVblzt?=
 =?us-ascii?Q?sxxa5RpGvZ4kFN1et1OP5N/NLb7GObGvcBQD/eRa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92717489-f0f9-41f2-9a4b-08dccd06c15a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 17:26:47.6806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWNd7vhLVw3dnugwTGX345GLOv4INPc9YqjpXdUXRdLTguocArJ9wxsAcoLhoxNZ2fSIyXtK2KGpIu28geMLKgHgW7jYyJVebfoLXUfqK08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4918
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Wednesday, September 4, 2024 9:51 AM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Brost, Matthew <matthew.brost@i=
ntel.com>; Auld, Matthew <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Suppress missing outer rpm protection warning
>=20
> Do not raise a WARN if we are likely within suspending or resuming
> path. This is likely this false positive:
>=20
> rpm_status:           0000:03:00.0 status=3DRPM_SUSPENDING
> console:              xe_bo_evict_all (called from suspend)
> xe_sched_job_create:  dev=3D0000:03:00.0, ...
> xe_sched_job_exec:    dev=3D0000:03:00.0, ...
> xe_pm_runtime_put:    dev=3D0000:03:00.0, ...
> xe_sched_job_run:     dev=3D0000:03:00.0, ...
> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> console:              xe 0000:03:00.0: [drm] Missing outer runtime
>                                                      PM protection
> console:               xe_guc_ct_send+0x15/0x50 [xe]
> console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
> [snip]
> console:               drm_sched_run_job_work+0x649/0xc20
>=20
> At this point, BOs are getting evicted from VRAM with rpm
> usage-counter =3D 2, but rpm status =3D SUSPENDING.
>=20
> The xe->pm_callback_task won't be equal 'current' because this call is
> coming from a work queue.
>=20
> So, pm_runtime_get_if_active() will be called and return 0 because rpm
> status !=3D ACTIVE (but equal SUSPENDING or RESUMING).
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index da68cd689a96..352f9d593496 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -588,6 +588,18 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *x=
e)
>  	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
>  }
> =20
> +/*
> + * Very unreliable! Should only be used to suppress the false positive c=
ase
> + * in the missing outer rpm protection warning.
> + */
> +static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
> +{
> +	struct device *dev =3D xe->drm.dev;
> +
> +	return dev->power.runtime_status =3D=3D RPM_SUSPENDING ||
> +		dev->power.runtime_status =3D=3D RPM_RESUMING;
> +}
> +
>  /**
>   * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without re=
suming
>   * @xe: xe device instance
> @@ -604,7 +616,8 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)
> =20
>  	ref =3D xe_pm_runtime_get_if_in_use(xe);
> =20
> -	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> +	if (drm_WARN(&xe->drm, !ref && !xe_pm_suspending_or_resuming(xe),
> +		     "Missing outer runtime PM protection\n"))

I don't know for certain, but I think we want to run pm_runtime_get_noresum=
e if
xe_pm_runtime_get_if_in_use fails, regardless of the pm suspend/resume stat=
us.
Something like:

"""
	if (!ret) {
		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
			"Missing outer runtime PM protection\n");
		pm_runtime_get_noresume(xe->drm.dev);
	}
"""

I at least think it's worth double-checking.
Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  		pm_runtime_get_noresume(xe->drm.dev);
>  }
> =20
> --=20
> 2.46.0
>=20
>=20
