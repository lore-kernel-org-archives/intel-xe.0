Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A0EC3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 19:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C2F10E89D;
	Wed, 10 Jul 2024 19:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVJ+/rNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A15810E89D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720640025; x=1752176025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r3VqbOR/4lvv6gO1UntjoBtyqFSZ1S/KOZ+qbg9kQKU=;
 b=ZVJ+/rNOxOP4+cSqlV+S/6hCDr2pFNYlK9NS0vwEKOhmC/DHlzhT18l5
 dwZqG15TUflmXCGHw9M713uTqDR/WWD8LzFDsRRIH48nqkb6u72anqD/f
 sbD4YGZVuKV0iUejC2vJY4vrFe/glqwDgXgrb9spNPsFd986/IIHFCeGj
 OTmzKF7oNdVtCLxAlJa/2mUMaT9Ggb9b8UU3DsGQKrrfCivyiNek5XJRl
 rMUhnlM/UiwYTuSEuxiCedeVq5tLnD8U1eG3qc0J7MIN8+2d/RKboEcJG
 XqEaiJvmSY0S00NKOae7eIM5O5fK8CbR3IRa6FqpCcC5NMrggG2HG42kR w==;
X-CSE-ConnectionGUID: VWnHw6VyTsK2NulcQQv23A==
X-CSE-MsgGUID: j22j0lyESnuj0xH2YYUgtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28653166"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="28653166"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 12:33:45 -0700
X-CSE-ConnectionGUID: SRMmeRUKRnia+deQ7eZEBA==
X-CSE-MsgGUID: 1w2xZQNdRD2avSwtO4QM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="52617761"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 12:33:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 12:33:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 12:33:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 12:33:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 12:33:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYbtt9anT52aY/zaBZvWGJgszw7KtqQQYELcWVoIUYVI3gJQPUfJTX92mLTMNrVSkap1VZf4SKNizExwpj0s/HdKtcq1LobHFIU8mYaK3gUW2F+fnSRsHldWQH+0As5e6bF0sx+B6XMpPdePOB+faJlV6rK7QbJjpBBoYL1frUSvR6u15/bNGXgJoMDfcG7rPbqs0dyLvOjlVxpDNdnHeZol/u4gvtUNdRLqCZMr7NohJ83bWIVVmm6pSxYlTSJcgRlnoh1vjINc9XP/F4iT67KuPeAYmLjqq37zT7rO0wLD8uo2F1Mh6lTISu42t6QXUc2jPa7XoSdheJNoLn8jkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0Oxp+2pDMdbR4hyP+xToT6i65IymBKXpMnSS/KYs50=;
 b=CaV8NUrN/2rXdGJDBgpiBLMgaE/3eENpEjV8HNlECoT6+qZ5os1kUi8Fdg4ekA7IlqI99YgI/A0SzeqwC1XNC2pJ/gzrNVb7yJt87CRG+R8KNvmZOMlnVai2r7OOMZt8H3lkYeRKGxtkcu2q/kyHOHR+YM7O85elqxVeAUYME30X8dLBHRW5bQLL6HCD6lWV7k+226Tur2a/roNDoWoAG5WeoE57e9Ox+X1gvr0fYQhpZJ8Oa+L6u2C/XhJ9MvTNMvlSVSYb1YyZsyQW5K56rLfFGwmM1tX0sOOX++UPlN9D/gkEuxGTKj22qzqaP/X3JhLS2M3Qx3rIK6vARRNf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 19:33:41 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 19:33:41 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Nerlige Ramappa, 
 Umesh" <umesh.nerlige.ramappa@intel.com>, "Krzemien, Robert"
 <robert.krzemien@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/oa/uapi: Allow OA config's to have arbitrary
 names/id's
Thread-Topic: [PATCH] drm/xe/oa/uapi: Allow OA config's to have arbitrary
 names/id's
Thread-Index: AQHa0mcGP8j6cU2r1kyeNK6f3auOy7HwWq7Q
Date: Wed, 10 Jul 2024 19:33:40 +0000
Message-ID: <BL1PR11MB5445F0FA5BF1B7504FDD9E4BE5A42@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20240710011741.3589516-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240710011741.3589516-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|DM4PR11MB8204:EE_
x-ms-office365-filtering-correlation-id: 1347ac9d-1c21-4fa5-b95a-08dca1173416
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2V3qjW359lUsJOEZlF0+T8qglf/bYwvoH8vdaoDSzkaHDEtY7zmA83ZydbTr?=
 =?us-ascii?Q?nlESHKL74UMMQGeISl6F5oFlf2dkW3+Xeg+oNcVAd8k5nIgF30iiOPtZ+U3b?=
 =?us-ascii?Q?PH7HUJrUqmzF8JFsOfqmmUjqkI8TaKZFQmqzofGyC12SaTqsddS/xpTUCV5r?=
 =?us-ascii?Q?eyUDEpPtwvSPI414kzrHldt0St5IaXaUrZg78DjqBrCht8V4ERriKus6E5Iw?=
 =?us-ascii?Q?4I4Np9g/Dr6P9QWN8DG9vJMHmyyHBQUzXN7BR7vxVypQmTxqZJ+r2c9PuPhy?=
 =?us-ascii?Q?hLyUiNOIWUNTr1MJds60DVRHdrX2J8paL1h8v/Rn4RO2wM0rNw8t+3xmiAA8?=
 =?us-ascii?Q?p2LBdGs62KnM3J9bFPfaGI3i3jHBb+1NdXRRHJ5VDZ+gbvjuXU/yYFbVOHI6?=
 =?us-ascii?Q?sH9C3J+SAWZlclv//G/cq0jjSYE+3eM61FU/XXAD8rfjaRI18ZhMOStGNlpU?=
 =?us-ascii?Q?zEjkLzGjtRs3d26C6ILf+In2ZMDpa4ItCCr28FtoQG0CzUlwxdudKyLEis9P?=
 =?us-ascii?Q?AE9mL5oNKQ3Lw1QbZsjdqGTXuYvneUdPqadjM/TuQ6Mm+tLQYtb6XzWcJ225?=
 =?us-ascii?Q?90j/ZbumAZ2C/DTMRYH0ueVOl6eI5M9H5lw1z8Ci6VSdes9k4JyrIpyHX8l1?=
 =?us-ascii?Q?waEsUQC+jrHXBVLOCpJgqq5NAwXHxHNb0BTWNdOT73thEBGaZn0su/hFJCFJ?=
 =?us-ascii?Q?SNNtpUB7BGIN3EURLbIMgNjF0SSg9OHxPAD6nCcxaqIOvtcqi2LY/9D9ueKm?=
 =?us-ascii?Q?zS06Ru8HGaXN9k0xo/83akl+rUrLe3h/eNaXEUWtbClYt3k4MRsyaoKzRIyb?=
 =?us-ascii?Q?MqTAcK/zLp2SVaMau9Ircyl20zRuqDteRD26OchlxwfhfnN2SBStLMT9pdXw?=
 =?us-ascii?Q?XgEzkH1eATcHxnDqRZH6vqGhC8laLAwkmcgq/ueJsc56/PJqu68DyJFAG51S?=
 =?us-ascii?Q?sgTvlVgpS639eekF1C89zYI+tzZVPpgsjeoLZT/m+GrCULVSi+C8VDWyneLp?=
 =?us-ascii?Q?sY1Rb4Vq+5WA4NcMJaYGfFaGL8bQ1y8oU7bkkabkrBbQtsStD09LgaBYc7If?=
 =?us-ascii?Q?1hmqRWrKOHPIMuvlK49iS2oNrdBVgmV7JsTFjTVsvx1mGtpaDFyzUIvrZN3c?=
 =?us-ascii?Q?1JCC90dc9UDvcTkY2V/mqAh6LCy83zViHzPyiUnXxs2OSb8T7mQwaYtTGRHI?=
 =?us-ascii?Q?HiepIb1LSJD5YJZNAoTJ9Zx+SEMnxkWF1d2HDbWPoAjt4ppEvmq+OfJ80Bnk?=
 =?us-ascii?Q?jwRgT44Y60Om5icYFz7cND7RmShyT0fa3drSQ8ythJ+kOnSPYXWoqmuFh8FG?=
 =?us-ascii?Q?78Hn5aflvlng6kITlM+C5PQxsxNvKIvWUG2sBBywkkTsgttcM552/4aKJnYJ?=
 =?us-ascii?Q?/7dTN2/SqrccHmlMAkWxc5+3RCwpxNLq0olGzUjsWL6uLZIBlA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bIvrZwwIh0+sdTItnQO3evOQVujUT9LiekrWmmo033W82tahuERWxjzHRLlz?=
 =?us-ascii?Q?n2QhNWPHrcLkNPJlKiRVV9El8hufqFUFp4QNad7zmXA3nTDMHg/BH+NIBOcs?=
 =?us-ascii?Q?87IVG6Ck00rXLyWZ02zjYxjdcNxCqu8VxyOsEMaFIPv9X+G3eennBNhLt4Uk?=
 =?us-ascii?Q?EGGioLOExlYbCL253roOApKPmRsK5MgxD1TjG6jH9tjJ14DxKDX7X/AsHT3N?=
 =?us-ascii?Q?pVowZg6c/MpfDi7Y3XpqZwaom0ohUKx245t4vJSNESeeCD9WMSylRTJ9Wr4U?=
 =?us-ascii?Q?jHTGyc8CxBsD520rKHM1dAtQdiQkbi8Ld9skiW6rX3a+uysRJLYLZtwL0E4C?=
 =?us-ascii?Q?gZGBcWgSjiCrRgeKL1OxGHMDqiiRSB4DdjRMwnzB8GrgGesPjcaTzsZZ9GOQ?=
 =?us-ascii?Q?XBYykByZsB8z0Wme67/E0pGlTYZF+6aa9ld3mFXfUAZK7iQ8qASMEH2y0evZ?=
 =?us-ascii?Q?shrX7Efr7731uY6wT5BhiTPAH4RqtjNMLB8PYnkp5y62WW8l/EXseqg68DH1?=
 =?us-ascii?Q?/XOOcpCHVFCaFzBjr4+SCB8fthGub4pYHNn0aEvf6sbYTb9Oi+cdi4JR2TUx?=
 =?us-ascii?Q?CJ8r25ljVhlgWcvmOJN7HP6I4lX3LuDfny6iYgfg/W8QBMZjMpmJ0Kmbtqjd?=
 =?us-ascii?Q?zUO3adqRWv1qlxq+CGph++G0yofcLBcUO7Vmc5sw6uluAvHDZcJjX5saveYa?=
 =?us-ascii?Q?TeViZG1k/W8PskdBD5dTYozDdM4mjADYtKVdjjkk1sjs9OVZ9c+O8Dkcse/i?=
 =?us-ascii?Q?yqTXWCbRW0PoZbP2uGDIqUdcpVVY70J8ANOr5J1dL3VFnQTW6Of+fP/4jsBC?=
 =?us-ascii?Q?IDF6qf07ITPGTOMTWga40teH77SF4nvtCmlzvBKX19dbFe+5dnV67NOhVnb9?=
 =?us-ascii?Q?yBaiRRWPlS4yA7LOjBu4nIKCKpMSn6Vd01jwXHw7YQrmt2pVQRpcrLmWcbR0?=
 =?us-ascii?Q?QlwFyM3n8EaFPts5LI96NWY3pKLt3VFJ/GuCvMXU56T8jzC8JKNO1CtfcnqV?=
 =?us-ascii?Q?yCWEtwVtM5zAZDfdJmyMv6J9Tq4IDsDZLnpKDQ/BKR+IIvRvFbapb55ht3WT?=
 =?us-ascii?Q?KQj+/ju02yJ37ZOGT3yfPAc6rcNSrNlNfvOe56MHZ0VJBE0e9KKcJCBtTovN?=
 =?us-ascii?Q?xelShoEytMuEZz1DFpP3JcP3eCya7BY5N2pg0QT59SrIiGWJBuzMhGr2a/sP?=
 =?us-ascii?Q?XbU5wzFW6C+Qt6O9l9oZN5whVvmAVFXs/ZtewMEI291mF3fotov1mxXtdmBm?=
 =?us-ascii?Q?9R/xPG3ySDEpAEa+IqFFXQp0zVw2o5tFRTI00H9uwp0LYtUSFkZLs1frz+vJ?=
 =?us-ascii?Q?EuE+ggceCdlqGuMS4iQf/xmq9vBsiPcedIIs+iVaOUdXn/ZdTAhww1L5gf+s?=
 =?us-ascii?Q?V/ecLWdOBWQQQyIn7XpspDSOXvE5Kzey1/SZc6bhTGZhmYVd7tbmMtMJ/sHW?=
 =?us-ascii?Q?07QxOaoR/OBePbMNHkCNPz2lSV6ylMgb0kL6rBW+Y/YDAF9E/dem/TewaVtM?=
 =?us-ascii?Q?j3GkKjp5iTnIpeD8y61pgKUL8upameNTbVFntgWZc7Lgcxjegdbu0xxFzOrn?=
 =?us-ascii?Q?Xy3VRpy6pUJ8TnUDROL957IQH6rXoFUOMt1icqSY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1347ac9d-1c21-4fa5-b95a-08dca1173416
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 19:33:40.9569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DVMtKXzetD4UhvS3aJLTVHQyehMhMzNg4aJHuJqydTtjiIxDYHEfTOiUwQz+CyantVXIH7mzuM6tCK8z3rpzuBL0rsBOf3mAOwxunhnw4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Tuesday, July 9, 2024 6:18 PM
To: intel-xe@lists.freedesktop.org
Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>; Nerlige Ramappa, =
Umesh <umesh.nerlige.ramappa@intel.com>; Krzemien, Robert <robert.krzemien@=
intel.com>; Souza, Jose <jose.souza@intel.com>
Subject: [PATCH] drm/xe/oa/uapi: Allow OA config's to have arbitrary names/=
id's
>=20
> Added OA configs were previously identified by means of a uuid. Rather th=
an
> forcing userspace to use uuid, here we generalize this scheme to allow
> userspace the flexibility to use whatever naming scheme (including uuid)
> they may wish to use to identify and track OA config's. Names must still =
be
> unique or will be rejected.
>=20
> Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I read the extended explanation in reply and agree this is a good
change.  It might be best to try and move parts of that explanation
into the commit message for added clarity, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 30 ++++++++++++------------------
>  include/uapi/drm/xe_drm.h  |  4 ++--
>  2 files changed, 14 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 6d69f751bf78..4f00577e92b4 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -49,7 +49,7 @@ struct xe_oa_reg {
>  struct xe_oa_config {
>  	struct xe_oa *oa;
> =20
> -	char uuid[UUID_STRING_LEN + 1];
> +	char name[UUID_STRING_LEN + 1];
>  	int id;
> =20
>  	const struct xe_oa_reg *regs;
> @@ -899,8 +899,8 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream=
, struct xe_oa_config *oa_c
>  	/* Look for the buffer in the already allocated BOs attached to the str=
eam */
>  	llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
>  		if (oa_bo->oa_config =3D=3D oa_config &&
> -		    memcmp(oa_bo->oa_config->uuid, oa_config->uuid,
> -			   sizeof(oa_config->uuid)) =3D=3D 0)
> +		    memcmp(oa_bo->oa_config->name, oa_config->name,
> +			   sizeof(oa_config->name)) =3D=3D 0)
>  			goto out;
>  	}
> =20
> @@ -1430,8 +1430,8 @@ static int xe_oa_stream_init(struct xe_oa_stream *s=
tream,
>  		goto err_put_k_exec_q;
>  	}
> =20
> -	drm_dbg(&stream->oa->xe->drm, "opening stream oa config uuid=3D%s\n",
> -		stream->oa_config->uuid);
> +	drm_dbg(&stream->oa->xe->drm, "opening stream oa config name=3D%s\n",
> +		stream->oa_config->name);
> =20
>  	WRITE_ONCE(u->exclusive_stream, stream);
> =20
> @@ -2066,7 +2066,7 @@ static int create_dynamic_oa_sysfs_entry(struct xe_=
oa *oa,
>  	oa_config->attrs[0] =3D &oa_config->sysfs_metric_id.attr;
>  	oa_config->attrs[1] =3D NULL;
> =20
> -	oa_config->sysfs_metric.name =3D oa_config->uuid;
> +	oa_config->sysfs_metric.name =3D oa_config->name;
>  	oa_config->sysfs_metric.attrs =3D oa_config->attrs;
> =20
>  	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
> @@ -2118,14 +2118,8 @@ int xe_oa_add_config_ioctl(struct drm_device *dev,=
 u64 data, struct drm_file *fi
>  	oa_config->oa =3D oa;
>  	kref_init(&oa_config->ref);
> =20
> -	if (!uuid_is_valid(arg->uuid)) {
> -		drm_dbg(&oa->xe->drm, "Invalid uuid format for OA config\n");
> -		err =3D -EINVAL;
> -		goto reg_err;
> -	}
> -
> -	/* Last character in oa_config->uuid will be 0 because oa_config is kza=
lloc */
> -	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
> +	/* Last character in oa_config->name will be 0 because oa_config is kza=
lloc */
> +	memcpy(oa_config->name, arg->name, sizeof(arg->name));
> =20
>  	oa_config->regs_len =3D arg->n_regs;
>  	regs =3D xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
> @@ -2144,8 +2138,8 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, =
u64 data, struct drm_file *fi
> =20
>  	/* We shouldn't have too many configs, so this iteration shouldn't be t=
oo costly */
>  	idr_for_each_entry(&oa->metrics_idr, tmp, id) {
> -		if (!strcmp(tmp->uuid, oa_config->uuid)) {
> -			drm_dbg(&oa->xe->drm, "OA config already exists with this uuid\n");
> +		if (!strcmp(tmp->name, oa_config->name)) {
> +			drm_dbg(&oa->xe->drm, "OA config already exists with this name\n");
>  			err =3D -EADDRINUSE;
>  			goto sysfs_err;
>  		}
> @@ -2166,7 +2160,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, =
u64 data, struct drm_file *fi
> =20
>  	mutex_unlock(&oa->metrics_lock);
> =20
> -	drm_dbg(&oa->xe->drm, "Added config %s id=3D%i\n", oa_config->uuid, oa_=
config->id);
> +	drm_dbg(&oa->xe->drm, "Added config %s id=3D%i\n", oa_config->name, oa_=
config->id);
> =20
>  	return oa_config->id;
> =20
> @@ -2224,7 +2218,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *de=
v, u64 data, struct drm_file
> =20
>  	mutex_unlock(&oa->metrics_lock);
> =20
> -	drm_dbg(&oa->xe->drm, "Removed config %s id=3D%i\n", oa_config->uuid, o=
a_config->id);
> +	drm_dbg(&oa->xe->drm, "Removed config %s id=3D%i\n", oa_config->name, o=
a_config->id);
> =20
>  	xe_oa_config_put(oa_config);
> =20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 19619d4952a8..43bcae64a7b0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1637,8 +1637,8 @@ struct drm_xe_oa_config {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> =20
> -	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
> -	char uuid[36];
> +	/** @name: Unique config name/id */
> +	char name[36];
> =20
>  	/** @n_regs: Number of regs in @regs_ptr */
>  	__u32 n_regs;
> --=20
> 2.41.0
>=20
>=20
