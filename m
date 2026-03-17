Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC42FED9F1
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 17:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D10610E5E8;
	Tue, 17 Mar 2026 17:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k01cEE2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A6D10E068
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773768086; x=1805304086;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VXJIHrYyheDcafAde5hMSAWNRhXWFx3zOocEpq8j2xc=;
 b=k01cEE2YVoaoTUAv0MLHK/Qqan2D+NZaZsaqgAmKOYx3uh8qaMT3yLhw
 inCtcrJ/8vzkWQPV9qRJZ9zniBr/4fOQw+HlSTWHlPdMwUSdd4D7UDdpl
 62dNtxMPC4yY61LYob8VKxCk1rHIsp91tyg47MzrhuWvPLnXRkt9me/3v
 vLdUvplxxXQp17GhQ5xVUK4+X/85+sP4ldjirBfW/7mtIT7H1BL5LQhMR
 g92OV12PC3VGZth16rQfMTCnRsAogNEYhnd1XwSpTXI9rgSnIpnesLW02
 Zt1j3Y7bX/c9ThP9VrdOevSDz48m3MGsd/lPvqe1s2xWZMcBi8Otkjq3W g==;
X-CSE-ConnectionGUID: NfWcJeZzSpmc7ivLu2M03w==
X-CSE-MsgGUID: mL/e6G7tRYqV00ytybV7Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74694633"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="74694633"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 10:21:25 -0700
X-CSE-ConnectionGUID: k1O/XPytQASMnEaXD7+buA==
X-CSE-MsgGUID: FUuvPxn5TGy3XXGEi7SPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="224483751"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 10:21:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 10:21:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 10:21:22 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 10:21:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOJ+cZSV/dOereG94T3B/8J0dHyTbDrjp//sQ909LRFM8tqh/V73ghT7eV8TpQ+OJ/oiRwrTxhTGHq45WFp4fFHNKEZAX1YeTquHmQugCRVPsrM+Wp1TZ33qF1aFQmGS4+3iTGkXCQhECXmI3+/m8PuMjNxWjchhRHYJxNrtbnXZtdcKoeP+HTNhRe7JHQ5siA0QdMfBnJVMn4aq52lO6kHh19nEdNzx1HNbgfPeOtuqRoDedHxRssgw2yYXEx7bABTiUhEE/ZeZL9QoxJHl1QvvohlGGYp3XpTd6rmRWLV4ARbYm0zsv4Dqgx+BwrQjiJIM+q5KShtdvFcMveFvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXJIHrYyheDcafAde5hMSAWNRhXWFx3zOocEpq8j2xc=;
 b=Xdd3a84dOWunhrF//3FYFakt2FazCyLu05HFcEzFBXoWTcMi49W2O1j3Hj9N7tbTP2dyc3t1UoDvGhfnO78ZejPqzoHUw2RleqXaEclxhSngWESgy3abK1GjFfFAg5bCwHhhRnIcdIl7m2IskeTjF81+fzGdm3HS89UOMJuCrnRz+tGMm4huScYOKDYr1ypVqpX2MuBs7COyRTKPQS4xBimYbyAISEiP3ZtROoLItOiL1nBrvagWdcHuOS3+DMbvOBsVB4U+Val/Fwxrfuc+VZZucKJSE6N7mTTO48LGMtHzF6MhyfgCdCjdT3O/w+cF9aXGrjTQ9t5700ersHS0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Tue, 17 Mar
 2026 17:19:19 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 17:19:19 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Fix mismatched include guards in header files
Thread-Topic: [PATCH] drm/xe: Fix mismatched include guards in header files
Thread-Index: AQHctV8v0ajopefxJUGUmQxjpAz3SrWyq+CAgABM6qA=
Date: Tue, 17 Mar 2026 17:19:19 +0000
Message-ID: <DM4PR11MB5456757F064024A58855D7CEEA41A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260316160451.1688247-2-shuicheng.lin@intel.com>
 <SA3PR11MB811839BC0A7222AFB96EAE4DD041A@SA3PR11MB8118.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB811839BC0A7222AFB96EAE4DD041A@SA3PR11MB8118.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA2PR11MB4970:EE_
x-ms-office365-filtering-correlation-id: f1b3163e-153c-4608-c467-08de8449534a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Ck7I7h1WseYyQP4AIw1VdPVROiWCjRJOggarmP6zeqYUaWA/04lPZCH0cWQ1J+xN/VEP84R7ZHQsvYizP/QK3Iov1Wr1wnezs5NUtRGmG+oLOUids1Ns2tm9r1wM2x0roh0bU9+zZNtSEBUKei23hJPWX0bQmtAtx+3Z0oFW9Bo/2wdIB8FyMUmIETgR6pxBXXqcm0i1/wK3jV2B9PPkC1vtOxqg389rPB7fArIQ0RNzlyBu25Srr/O2Fdp6D2kqHOUuXhmP7OYogvebyA1RKFwzfAT7I5/OihJ2odlA0J7Q3LPRVNPKGULECYmmcDI7neqKy956CvdtZ9r1UDnI+6IHy0NPSArjO9xpvi/q5X+YBvg9mjpBmsIlv/BnfoozDyLTciI5xLRA9PoB+4mHrZLkgRWwFgtsm/NMveq2fYptqsToGws+f73gITgpedYoofgx1tK+De9jX+x+evSdbVmp2p+YxV8bs8DVn6QpBLLu4BwauydA6PY7gvdPOQ7nOkdSLZxhJ7yA0RLlZQr+CBK1L5JaLQUo+s0+W6zNj7zrJ4v6omLRdhT7abKTb8EgTWAq9nPT44GzHvEzaNI5ZFKmrkKESzpjIXDyt2WpZfjDBK5sE92GMAp2EoKHDwdILaGqghp8lcETi3/FwlRK2wZvDWHXTViNg3OGDu9E7oB2NrxsUS1WA25ho1DJTN+ECSZ7zp/2H9mN6TShrybtVbhzODYQFM/SLhAj+/QtpW5aDNsg91xMYvbOQ/ojhyiBp2/b+y9f2kPXFcQ5fKcO+ZJNwiL2v0KLkAEmilHJK5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azFvd29RbjRPY2Rkc0NrOGxOSUVZckY1dHdDWWZsUVIzS1I1OGNpR1VDMTRp?=
 =?utf-8?B?UnV5cWtEVy9yUUJoVVMzZW00YnpoWTRkNmFiVW9uMWRlNEJrVHY1QlFrTFZZ?=
 =?utf-8?B?N0wrUEZhT2s2dWY1UkR3YjdBVGtHeE5XenBPcHExZjRUZTRqL2NCOWl1c0pM?=
 =?utf-8?B?NTVueHpmZW9pR0NDM0NEQy9sUUF4ditYdUFac0NRQ0RPVFBlOG0wWkdldGQx?=
 =?utf-8?B?dFZjenAweU9zVVBidUx2ekxzWTIrSlkvNDhpamIvdVlYZC9uelNEYUhXYmwv?=
 =?utf-8?B?VmF3akl3azFsMDIyWlUwM2g0bEx1WU9GdEdxVS9WZ0JLaE9FNWdTcCtjaWV1?=
 =?utf-8?B?eDNjTExjbG5GSnJZRlJ5Q1J5Q2hsQWk0T1VFMUFXWVRkYkNGQzh1MGZMa1p5?=
 =?utf-8?B?TkJ1amp0bkh1VnFxeE9NODNwbjRuWkFvNGJyUTkrb215cStJZDRST1Z3N3lv?=
 =?utf-8?B?bmNyS1dSWUpkekxGRmprazZoN3Q3NHhHK05WWFkzcUViMTh3RlIvMEhFRlcz?=
 =?utf-8?B?TDNGVGRGc2UwZHhsd25qMUFIVUw5V2RRdmorcWg3MlhxTE9GdVhPclZsbSs5?=
 =?utf-8?B?dG1uUW5QZld5ZTU1T1JCWmJpZTBmTnN4cG5GaUlNZFhlUmhkUkNWZ3VQYXo4?=
 =?utf-8?B?c3FmVVVxUnZmaWpITllUcVQvSVZ2cmtVRGdDdFpJYVRLVW92YUhEWlZqa21t?=
 =?utf-8?B?dWdQaVErTUc5RzJLbkozWllHNm9SSHNoYWphYlJCUUEwaVlHaXlEUFRMQ3hk?=
 =?utf-8?B?NWptRllNT0pzQklLZmxVWEtIeThkNHRNZFh5Zm52SERDeC93S0hnUHFTTTl2?=
 =?utf-8?B?ankzdjRRSUZQaVJ2OGp3cFA0eEhZMlZmVUlldk1kR0JWdFN5WW5RYlc4bHZ2?=
 =?utf-8?B?MFNkLzVGL2xaTytCN0dqaGJwWVBRbFpPTzZNMTd0TWFOT2xqd29tZFJnWG5L?=
 =?utf-8?B?ZmFORjE1dG1IZVNMalhWSTV2WHpGcjR2V2J5WmR4QlJyNTNIUG05Y1E5U1dt?=
 =?utf-8?B?Wkc0dnFjSDVkczdHdytoL1Y4Y0hDbkFvY2p6VmcxdnB4a1AvY3M0RmFDQkRT?=
 =?utf-8?B?cDljRWIrM0oyUWc3V0JCS1VyRlZaWjkwTnRWUFpWOHZmLzlPZEVpK0ltMmI4?=
 =?utf-8?B?UE9zbUNvZ3NnNjYyaGZGeXh4ay9xeHlIc1UydlQ3TmhoSXNiYmFEdlh0STFW?=
 =?utf-8?B?VCtpR2ZTRGV5bnFZL1ZBYk1CS1RObDAyWnVNZXdpam9qd01QTFA4eFkxNGxC?=
 =?utf-8?B?cDVDejhtVkN6VkI1L3VwTHI1SVRBZFZwbFBrQnZVQUtYY3JWWGw4d3VQZXJy?=
 =?utf-8?B?emloN3BTT2tGZHlpOUVpZllud2ZTS3QyYStEcldnT3h1QUkzb014TFlET0NZ?=
 =?utf-8?B?OG5xSmhUK2s4RUlRUTF3K2NGOEkrYkMxUlNQSGtwQkxjRG9RV2lhaFRScEtL?=
 =?utf-8?B?RmhjZHBmZ2lyY0M4bnJtaVFHN1g0aExNbG02Sk5DTEVYMnBTR3VKbHhWejB4?=
 =?utf-8?B?TkNHWUM5MjNQalpPWFNUTmRYdXUrVVVmcjcvVUd5bkI1OHRYRXV2ZWN1SXBY?=
 =?utf-8?B?Yzd2eVNUNkI0UjUrbzcyOCtPMW1SRmdpVUZ5WGFxbmt2YzU3enNpbDNTSnU4?=
 =?utf-8?B?dGEwUXcxdVRrMTRVbnFNT0srTVBsNG4wOGRBSTJhU3Zmd2Rmc25qZjlPUUR4?=
 =?utf-8?B?Tkt1dW12N1cxeVExYityZzduOTk2TEJRbTZweTViS2R2K3hQTXczQW51OTBS?=
 =?utf-8?B?K05VajJrbnFKMHB3MmZzdStNQVBLL29XaEVIZEhadVRMSGxKd1ZyZ1NDVDNz?=
 =?utf-8?B?Viszb0ZxYkRuUzk0WStvRkxpR1lidGJwKzkyUThPN0k3aDNkdzV6VEI1VFNr?=
 =?utf-8?B?QmJoYTRiTXdlK284UGI5dTNIS1E1M3puU3FHdlE1UFdwN2lZMXlseXRjY08y?=
 =?utf-8?B?UlU3UDFQaE9CSWtsOEd4MTBuTW40N3VheVRMVGdjbGhkekFPWGVyMEErYTVL?=
 =?utf-8?B?TEs0bFJQUGR4NXJmS1BVMWg2ckcyZ0d2YVdzc2hRaUFBTTZEMlZKT3FJVEF2?=
 =?utf-8?B?anNQcnp6UjZxRkdZZDFobVl6aWVzMG40OWNLRXgxNHBSY3FNK1p3aVo2RTVP?=
 =?utf-8?B?bU5nR3VEN3RrTWJTa0RyWXJxOTJ2MktXQWZra1hHZ3VFOW1rTmtwS3c2bERo?=
 =?utf-8?B?bmRQNWt1KzE4RjJvcVhuNzJlTzF5azVHbVMwSXF2ZVBEcUJOeGcrMTVmam80?=
 =?utf-8?B?ZDEvZnlHbW9zRUNnSS84NEFJRkVFcSs5L0FHbm0xTE9CTUFqUENzM2tVamk0?=
 =?utf-8?B?bU4xMVphZzhLb09oMjZQcm8ydXhzc21tVHhRM0RuRjBpcWlLeXVmQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YfkylpG3n9Qsz3E38G6ZGb0Fxb31I1ptohz2pEuGQ5RCKW6WtFj0qHuW61g+3bHnvnMzP+/EL/zdLTyzIYPK+B8UKTG/duClHPvTvkOH+c5T21zrcG26UycOBjqLPfqTHborxle0ObWkFcrRF8BIMomgzxT9EL6QqMfGzAc/+1AE52Jgzn+W2cxMFQN6z+pMaQ+6TgNRe/XupRSCJiKqR3qq18m37GVheAAd2SUK2FNF5H5UjPFQSIM1DDt5v2aHTbx2vzCh42ZZ1+ZWTYb0/XOkrHH0W1oK5gmhok7vr/eab0P+JZqiuF8MzF5w7YTpA8gMWHU/sh8BCG7WnQBxZg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b3163e-153c-4608-c467-08de8449534a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 17:19:19.7549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggO8qvkJ/Vdb7sMUbLZqbEo0By46DA2fS6NdV/4ZgMLTcKmwlDH/Lf4vrlWtHUZCVnKVl5i3AXUzrH7MNTj1bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
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

T24gVHVlLCBNYXIgMTcsIDIwMjYgNTo0MSBBTSBOaXRpbiBHb3RlIHdyb3RlOg0KPiBIaSwNCj4g
DQo+ID4gRml4IGluY2x1ZGUgZ3VhcmQgbWFjcm9zIHRoYXQgZG9uJ3QgbWF0Y2ggdGhlaXIgcmVz
cGVjdGl2ZSBmaWxlIG5hbWVzOg0KPiA+DQo+ID4gLSB4ZV9ndF9pZGxlX3R5cGVzLmg6IF9YRV9H
VF9JRExFX1NZU0ZTX1RZUEVTX0hfIC0+DQo+ID4gX1hFX0dUX0lETEVfVFlQRVNfSF8NCj4gPiAt
IHhlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmg6IF9YRV9HVUNfRU5HSU5FX1RZUEVTX0hfIC0+DQo+
ID4gX1hFX0dVQ19FWEVDX1FVRVVFX1RZUEVTX0hfDQo+ID4gLSB4ZV9oZWNpX2dzYy5oOiBfX1hF
X0hFQ0lfR1NDX0RFVl9IX18gLT4gX1hFX0hFQ0lfR1NDX0hfDQo+ID4gLSB4ZV9od19lbmdpbmVf
Y2xhc3Nfc3lzZnMuaDogX1hFX0VOR0lORV9DTEFTU19TWVNGU19IXyAtPg0KPiA+IF9YRV9IV19F
TkdJTkVfQ0xBU1NfU1lTRlNfSF8NCj4gPiAtIHhlX2xhdGVfYmluZF9md190eXBlcy5oOiBfWEVf
TEFURV9CSU5EX1RZUEVTX0hfIC0+DQo+ID4gX1hFX0xBVEVfQklORF9GV19UWVBFU19IXw0KPiA+
IC0geGVfcGxhdGZvcm1fdHlwZXMuaDogX1hFX1BMQVRGT1JNX0lORk9fVFlQRVNfSF8gLT4NCj4g
PiBfWEVfUExBVEZPUk1fVFlQRVNfSF8NCj4gPiAtIHhlX3RpbGVfcHJpbnRrLmg6IF94ZV90aWxl
X3ByaW50a19IXyAtPiBfWEVfVElMRV9QUklOVEtfSF8NCj4gPg0KPiA+IFRoZXNlIGd1YXJkcyBh
cHBlYXIgdG8gYmUgbGVmdG92ZXJzIGZyb20gZmlsZSByZW5hbWVzIG9yIGNvcHktcGFzdGUgZXJy
b3JzLg0KPiA+IENvcnJlY3RpbmcgdGhlbSB0byBmb2xsb3cgdGhlIHN0YW5kYXJkIGNvbnZlbnRp
b24gb2YgbWF0Y2hpbmcgdGhlIGZpbGUNCj4gPiBuYW1lIHByZXZlbnRzIHBvdGVudGlhbCBpbmNs
dWRlIGd1YXJkIGNvbGxpc2lvbnMuDQo+ID4NCj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBleHBl
Y3RlZC4NCj4gPg0KPiANCj4gVGhlIHBhdGNoIGxvb2tzIGdvb2QgZm9yIGZpeGluZyB0aGUgZ2Vu
dWluZWx5IG1pc25hbWVkIGd1YXJkcy4NCj4gDQo+IE5pdDogdGhlcmUgYXJlIGFsc28gc29tZSBz
dHlsZS1vbmx5IGd1YXJkIG1pc21hdGNoZXMgaW4geGUvIChtaXNzaW5nIF9IIHN1ZmZpeCwNCj4g
X18gdnMgXyBwcmVmaXgpLCBlLmcuIHhlX21pZ3JhdGUuaCwgeGVfcmVnX3NyLmgsIHhlX252bS5o
LCBldGMuDQo+IFRob3NlIGNvdWxkIGJlIGEgZm9sbG93LXVwIHBhdGNoIGlmIGRlc2lyZWQsIGJ1
dCBJJ2Qga2VlcCB0aGVtIHNlcGFyYXRlIHNpbmNlDQo+IHRoZXkncmUgY29zbWV0aWMgcmF0aGVy
IHRoYW4gY29ycmVjdG5lc3MgZml4ZXMuDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NClllcywg
SSBhbHNvIG5vdGljZWQgc29tZSBvZiB0aGVtLiBMZXQgbWUgaGF2ZSBhIGNoZWNrIGFuZCBmaXgg
dGhlbSBsYXRlci4NCg0KU2h1aWNoZW5nDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBOaXRpbiBHb3Rl
IDxuaXRpbi5yLmdvdGVAaW50ZWwuY29tPg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hl
bmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X2lkbGVfdHlwZXMuaCAgICAgICAgIHwgNiArKystLS0NCj4gPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmggIHwgNCArKy0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9oZWNpX2dzYy5oICAgICAgICAgICAgICB8IDYgKysrLS0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfY2xhc3Nfc3lzZnMuaCB8IDQg
KystLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbGF0ZV9iaW5kX2Z3X3R5cGVzLmggICAg
fCA0ICsrLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BsYXRmb3JtX3R5cGVzLmggICAg
ICAgIHwgNCArKy0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3ByaW50ay5oICAg
ICAgICAgICB8IDQgKystLQ0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF9pZGxlX3R5cGVzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxl
X3R5cGVzLmgNCj4gPiBpbmRleCBhMzY2N2M1NjdmOGEuLjViNWQyZTgzNTEwMiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfaWRsZV90eXBlcy5oDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2lkbGVfdHlwZXMuaA0KPiA+IEBAIC0zLDggKzMsOCBA
QA0KPiA+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ICAgKi8N
Cj4gPg0KPiA+IC0jaWZuZGVmIF9YRV9HVF9JRExFX1NZU0ZTX1RZUEVTX0hfDQo+ID4gLSNkZWZp
bmUgX1hFX0dUX0lETEVfU1lTRlNfVFlQRVNfSF8NCj4gPiArI2lmbmRlZiBfWEVfR1RfSURMRV9U
WVBFU19IXw0KPiA+ICsjZGVmaW5lIF9YRV9HVF9JRExFX1RZUEVTX0hfDQo+ID4NCj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0K
PiA+IEBAIC00MCw0ICs0MCw0IEBAIHN0cnVjdCB4ZV9ndF9pZGxlIHsNCj4gPiAgCXU2NCAoKmlk
bGVfcmVzaWRlbmN5KShzdHJ1Y3QgeGVfZ3VjX3BjICpwYyk7ICB9Ow0KPiA+DQo+ID4gLSNlbmRp
ZiAvKiBfWEVfR1RfSURMRV9TWVNGU19UWVBFU19IXyAqLw0KPiA+ICsjZW5kaWYgLyogX1hFX0dU
X0lETEVfVFlQRVNfSF8gKi8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19leGVjX3F1ZXVlX3R5cGVzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
ZXhlY19xdWV1ZV90eXBlcy5oDQo+ID4gaW5kZXggZmQwOTE1ZWQ4ZWIxLi5lNWU1M2I0MjFmMjkg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19leGVjX3F1ZXVlX3R5
cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2V4ZWNfcXVldWVfdHlw
ZXMuaA0KPiA+IEBAIC0zLDggKzMsOCBAQA0KPiA+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMiBJbnRl
bCBDb3Jwb3JhdGlvbg0KPiA+ICAgKi8NCj4gPg0KPiA+IC0jaWZuZGVmIF9YRV9HVUNfRU5HSU5F
X1RZUEVTX0hfDQo+ID4gLSNkZWZpbmUgX1hFX0dVQ19FTkdJTkVfVFlQRVNfSF8NCj4gPiArI2lm
bmRlZiBfWEVfR1VDX0VYRUNfUVVFVUVfVFlQRVNfSF8NCj4gPiArI2RlZmluZSBfWEVfR1VDX0VY
RUNfUVVFVUVfVFlQRVNfSF8NCj4gPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4N
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2hlY2lfZ3NjLmgNCj4gPiBpbmRleCA3NDVlYjY3ODM5NDIuLmE3NmY0MTIyYjc3OCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuaA0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9oZWNpX2dzYy5oDQo+ID4gQEAgLTIsOCArMiw4IEBADQo+ID4g
IC8qDQo+ID4gICAqIENvcHlyaWdodChjKSAyMDIzLCBJbnRlbCBDb3Jwb3JhdGlvbi4gQWxsIHJp
Z2h0cyByZXNlcnZlZC4NCj4gPiAgICovDQo+ID4gLSNpZm5kZWYgX19YRV9IRUNJX0dTQ19ERVZf
SF9fDQo+ID4gLSNkZWZpbmUgX19YRV9IRUNJX0dTQ19ERVZfSF9fDQo+ID4gKyNpZm5kZWYgX1hF
X0hFQ0lfR1NDX0hfDQo+ID4gKyNkZWZpbmUgX1hFX0hFQ0lfR1NDX0hfDQo+ID4NCj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4NCj4gPiBAQCAtMzcsNCArMzcsNCBAQCBpbnQgeGVf
aGVjaV9nc2NfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7ICB2b2lkDQo+ID4geGVfaGVjaV9n
c2NfaXJxX2hhbmRsZXIoc3RydWN0IHhlX2RldmljZSAqeGUsIHUzMiBpaXIpOyAgdm9pZA0KPiA+
IHhlX2hlY2lfY3NjX2lycV9oYW5kbGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzIgaWlyKTsN
Cj4gPg0KPiA+IC0jZW5kaWYgLyogX19YRV9IRUNJX0dTQ19ERVZfSF9fICovDQo+ID4gKyNlbmRp
ZiAvKiBfWEVfSEVDSV9HU0NfSF8gKi8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZV9jbGFzc19zeXNmcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfaHdfZW5naW5lX2NsYXNzX3N5c2ZzLmgNCj4gPiBpbmRleCAyOGEwZDdjOTA5YzAuLjM3MjI1
YzFhZTUyOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
X2NsYXNzX3N5c2ZzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
X2NsYXNzX3N5c2ZzLmgNCj4gPiBAQCAtMyw4ICszLDggQEANCj4gPiAgICogQ29weXJpZ2h0IMKp
IDIwMjMgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiAgICovDQo+ID4NCj4gPiAtI2lmbmRlZiBfWEVf
RU5HSU5FX0NMQVNTX1NZU0ZTX0hfDQo+ID4gLSNkZWZpbmUgX1hFX0VOR0lORV9DTEFTU19TWVNG
U19IXw0KPiA+ICsjaWZuZGVmIF9YRV9IV19FTkdJTkVfQ0xBU1NfU1lTRlNfSF8NCj4gPiArI2Rl
ZmluZSBfWEVfSFdfRU5HSU5FX0NMQVNTX1NZU0ZTX0hfDQo+ID4NCj4gPiAgI2luY2x1ZGUgPGxp
bnV4L2tvYmplY3QuaD4NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbGF0ZV9iaW5kX2Z3X3R5cGVzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9sYXRl
X2JpbmRfZndfdHlwZXMuaA0KPiA+IGluZGV4IDJhOGE5ODVjMzdlNy4uN2ZkYjI0ZTgxMGIzIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9sYXRlX2JpbmRfZndfdHlwZXMu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9sYXRlX2JpbmRfZndfdHlwZXMuaA0K
PiA+IEBAIC0zLDggKzMsOCBAQA0KPiA+ICAgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jw
b3JhdGlvbg0KPiA+ICAgKi8NCj4gPg0KPiA+IC0jaWZuZGVmIF9YRV9MQVRFX0JJTkRfVFlQRVNf
SF8NCj4gPiAtI2RlZmluZSBfWEVfTEFURV9CSU5EX1RZUEVTX0hfDQo+ID4gKyNpZm5kZWYgX1hF
X0xBVEVfQklORF9GV19UWVBFU19IXw0KPiA+ICsjZGVmaW5lIF9YRV9MQVRFX0JJTkRfRldfVFlQ
RVNfSF8NCj4gPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW9zeXMtbWFwLmg+DQo+ID4gICNpbmNs
dWRlIDxsaW51eC9tdXRleC5oPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGxhdGZvcm1fdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BsYXRmb3Jt
X3R5cGVzLmgNCj4gPiBpbmRleCA2Y2ZmMzg1MjI3ZWEuLjM0NDc4NDhiNzRlMyAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGxhdGZvcm1fdHlwZXMuaA0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbGF0Zm9ybV90eXBlcy5oDQo+ID4gQEAgLTMsOCArMyw4
IEBADQo+ID4gICAqIENvcHlyaWdodCDCqSAyMDIyIEludGVsIENvcnBvcmF0aW9uDQo+ID4gICAq
Lw0KPiA+DQo+ID4gLSNpZm5kZWYgX1hFX1BMQVRGT1JNX0lORk9fVFlQRVNfSF8NCj4gPiAtI2Rl
ZmluZSBfWEVfUExBVEZPUk1fSU5GT19UWVBFU19IXw0KPiA+ICsjaWZuZGVmIF9YRV9QTEFURk9S
TV9UWVBFU19IXw0KPiA+ICsjZGVmaW5lIF9YRV9QTEFURk9STV9UWVBFU19IXw0KPiA+DQo+ID4g
IC8qDQo+ID4gICAqIEtlZXAgdGhpcyBpbiBncmFwaGljcyB2ZXJzaW9uIGJhc2VkIG9yZGVyIGFu
ZCBjaHJvbm9sb2dpY2FsIG9yZGVyDQo+ID4gd2l0aGluIGEgZGlmZiAtIC1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdGlsZV9wcmludGsuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3RpbGVfcHJpbnRrLmgNCj4gPiBpbmRleCA2MzY0MGE0MjY4NWQuLjczODQzM2E3NjRiZCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9wcmludGsuaA0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3ByaW50ay5oDQo+ID4gQEAgLTMsOCArMyw4
IEBADQo+ID4gICAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ID4gICAq
Lw0KPiA+DQo+ID4gLSNpZm5kZWYgX3hlX3RpbGVfcHJpbnRrX0hfDQo+ID4gLSNkZWZpbmUgX3hl
X3RpbGVfcHJpbnRrX0hfDQo+ID4gKyNpZm5kZWYgX1hFX1RJTEVfUFJJTlRLX0hfDQo+ID4gKyNk
ZWZpbmUgX1hFX1RJTEVfUFJJTlRLX0hfDQo+ID4NCj4gPiAgI2luY2x1ZGUgInhlX3ByaW50ay5o
Ig0KPiA+DQo+ID4gLS0NCj4gPiAyLjQzLjANCg0K
