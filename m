Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109A5C83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 18:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABBA10E1B8;
	Tue,  8 Jul 2025 18:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRpwn9Uf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEC310E1B8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751999822; x=1783535822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wSQ5axYe3aWZk9NNba/xewodUj5EdAegHG+evUI2kAs=;
 b=mRpwn9Ufhb3Jb21XaxjhqbB+rmiEPr82C+VmNrWcOzEWi2YnB95TX7Tv
 GIhUqYpIkOKaqTkhkgNmDxM5E6yQBqZ1u5JCxNHGlrLtNXmkgyu242thC
 eQPf/Sj4N7rVRfEvGwxDH9ATDN/FU2IWHOfAfWXc4EFgYlJ1mzdxXvJ0M
 WhMuO07z/5eq/k9spnISBHkfndLI1fR5MFAJ8HEc2ztf2joYH6bfXPkz4
 YibRgFT8aSLtIt5Pc2lcqYDddrwKf3IhgQa4EhjLQTx9HNRyjqEkyEYPo
 87cxZZvMypwPs2VGXHBvMNjo2mAGbdD2D12Oj/+ngZ9atT1ZE9hMC5p43 Q==;
X-CSE-ConnectionGUID: O4w1ZT4PSHioy71QAEkJLA==
X-CSE-MsgGUID: 93XpAsnWQIu9TyAqbiRfHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65310881"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="65310881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:37:02 -0700
X-CSE-ConnectionGUID: OWzybswOTFSt6sthfvqHuw==
X-CSE-MsgGUID: lrrjfYR8TdeccX26Pxt61w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="155198763"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:37:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:37:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 11:37:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:37:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/OePlNDtw7o8WVrT4QuVmGfkvL811wgCfvsvb6ZD6D5o6zyalSRhUWRf24orIfbkMsDMnf6i+w0QQS9X1Fy55gAquTrrevFtoZjmVgS6Wx6+HGMVpegKfEHfr9A9GiC08H9TyGDxTAFZsDsAdN6bnk2jlKuavzcj67KvD2fTgxcJOvRCkmrXDqlqiM1wJYY6GrnPmG5AkIKGh5JAThWo1Wiz4xOonLSnZMgt5mhNqE6Nr8BcPSR1KhEYdgYygdkSTMMHJIpAmcJ0ZkHNMPqOJK78zJfL5aokVs076yhQHRZ+pyMlrrbVKkWIG5tNnTwzqsOvC9JwQxt2TCGmv4+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJSyDPyskTAYbj0R3IcJv9tnrThiQOPc1xjYwJVqf8Q=;
 b=nlpLV+bU1VpMghfNpQHlZKvUCQX6rhedhqN7+AI1SMS7V/LyDrK+023R1qk8D1lM24nhPQQdV0OEpJf/qUdTohqkRVBfIDGdlXd3VqVOavRhFu/vD+/+CqS5P6S465s8GVQ6iitu/aWlPQj2oYRZEncqmGh9oaBrfNyZFGhzL3AV8rJpuHz8KzRB37sipIsLtWYpaQXvZi/xB/jZTVfTAqd9dO3+tzZA++/hapzrujTsosnCKrSBqPH43j1tzkcYO4fgYuO2yQPB7TTGiX+wl5DCZZn5/P223VMUKr8/kfSQ2vWxMK8dYJ5iaDVMGscT1Rcc7aoNJElklWHlclF/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 18:36:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Tue, 8 Jul 2025
 18:36:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v9] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Topic: [PATCH v9] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Index: AQHb75Ry4wSifk/Y1EaVLuGgujJroLQojlsQ
Date: Tue, 8 Jul 2025 18:36:43 +0000
Message-ID: <CH0PR11MB5444BDF25578E61761DEE2E2E54EA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250707231108.3217573-1-zhanjun.dong@intel.com>
In-Reply-To: <20250707231108.3217573-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB6719:EE_
x-ms-office365-filtering-correlation-id: 4b382c96-4355-4b63-e4f3-08ddbe4e6325
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?voBRaXsQVpSPbt7FnGpca7fLh+NPtC+uuqZmPghrhsVrqlQnkgqvgrSy/9Sb?=
 =?us-ascii?Q?KyynyTVd2Xe6PadtoxUovNt+qLaH4pENALtGSYRKcKcjCAzXwZKuYuF3JYwj?=
 =?us-ascii?Q?7D5ZzhucD+Rn4bKrvzpIsod/mqr1ccnKVi2lAtPBns8u8KQbpG08rBLtHGrq?=
 =?us-ascii?Q?+zDKnnIu0UzndHrlm9PN/LrkKJDRF5xLoK7+4zKkW8KUK3IGdfY9N0OFLeH2?=
 =?us-ascii?Q?AvBEG9BHLlfhHal82olHiYoq3MAYN5OSuopG9oSX1qW5RcTkXE8kkKBIGDG+?=
 =?us-ascii?Q?Zk4sMZQrvVZ4Hiqs+7gT9jwMBpWdZofY0WgLYRGGk8qdm/00djPH48RtVojp?=
 =?us-ascii?Q?bxc+TXJffoHOd9Z/kqORUJKscjLs/03ZPZej3aqjtCobpzIhpxCOUPcsOi4o?=
 =?us-ascii?Q?00b1U+IJ68BK0iBmZoKTrvBHvfnB48EgS0Mh6BJ8XgXBZTq3dAnJamdJWJwn?=
 =?us-ascii?Q?U9w2hcnugVPchHffpNCLUU3D7CpiUoZdlQP35vNvuPaAx2AoEIpnDpLkFl5o?=
 =?us-ascii?Q?5MZ1FXCRCEAT62xQ3yzLyTX83C3SMRr7b/9em55SjehdS7RdG1QnQYvqory7?=
 =?us-ascii?Q?wBpwZ+3Q7ySB3TFG9NGr8/FEJaw3Yo5ijYuRT9T+7+EvErH7CAn26sCXb0ln?=
 =?us-ascii?Q?x7+aRp5zEosNNhAdFlmuezEzdFk8Mf2didu9TDtSoc0Jr9TfDYR6TBynXCrC?=
 =?us-ascii?Q?E8w85pRe4NS+qea1gvlY+71VNUahdgD31jGPywjMweFif9AX+U9Ql/7XseyA?=
 =?us-ascii?Q?6SsFwX15ac6DLM+WGjVyFGBicgmKtiJDz1hiI22ZY796q71DZ0PXUe194LFS?=
 =?us-ascii?Q?aPJeiO1VAAVb3yfM1x+mUxluUalYGJ8A2FTfMRwlBkiy03T9Klgakd0AhjKw?=
 =?us-ascii?Q?cI2+NNJOw/zMOYkj8og9oySpgfDgbblbTDz9sI0fujCuM9tipOxeN+xuZ3Ts?=
 =?us-ascii?Q?JIkReVWe80ebRINxLetSXodM3E8p12RFCOmiU07KsZghxGbKHl6AAEaH8IXC?=
 =?us-ascii?Q?dDsHNeFGbsWaEf+9mdIzzi35DVMnjJVdV7HOTDQT6Z9h9Jgvbjlsz3lBK6qI?=
 =?us-ascii?Q?nitXd3A2YNcJszdt7m95aqofRL6tHH86A2WCuKoiI9YcO4RXtGsSgqX59NIG?=
 =?us-ascii?Q?wC8gmJqBun1hfWWmXwJT2bhl3o21239WornDz5oiqNLLGGPSQyL/e7Pu1iEF?=
 =?us-ascii?Q?QAq68F5YGj4xd3grJc4U4on+WrucDXNTv5/ffwG/mUuygA4KHE3mSUk6T5U0?=
 =?us-ascii?Q?AfmJK3SlljDYEKCxMWlvzwE5nidEAuKJ3AhUlcDr/A7CirWHO91YFEpDbCLU?=
 =?us-ascii?Q?xeh3d1XjbkgS2T7Pt8+xG8696X9icnQlNf4Hqqk/1Ez//kV6R7p1f+Pin/Q3?=
 =?us-ascii?Q?By9hLD3AwVhVuia+2Hg+CsUsomoB99ObAa6qUXWerdlzBUEG+5yZeopqcwMb?=
 =?us-ascii?Q?zcTIfMpPs/4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pHiCkA1hdcCPCDUJrXzPd56OEtwkbbUyaLPRKYTSR5oBM2huHABT/sUebeoU?=
 =?us-ascii?Q?DVEzCa7G8ltgwc5EbMkt6g81+6xSCD5rtgCEsIBUNf5t9nzdO3l4QsoFqQak?=
 =?us-ascii?Q?g2JRj65bbLymXcTs4Ww1fl1xWuQnXgzVR+IypoUdRP2NFWAeSdhaG8uMwdyh?=
 =?us-ascii?Q?2niK9Dw/Pvu1IG6XKO6qRLi4tPSAfHVz0k2YP5LQv/I5bMkZobWoCicpl9RJ?=
 =?us-ascii?Q?we++vAW/JHFXeRxchJbJ80NyIB01EVtsBRTmUSC3FmpUfgiKVqNQz1372myA?=
 =?us-ascii?Q?tb8tIS/870dvpTMMGSimG2GDs5LAGbEQOzHGU3TIy2PziX2Gptk9u+YWQ7yy?=
 =?us-ascii?Q?Nc0RaKBRmro6ZZtcIJbW37XyPea493HHWFu1lGsGTWLGD/dRSqeqMzSfZa0/?=
 =?us-ascii?Q?LZtrWaRkh/lcrfMpYoRbyFFsNZCvDoABWQ2EfsMvlGwlyDkTZN/NRlTM4NuQ?=
 =?us-ascii?Q?SvfFKzAOKMW0hDE5LIyv808yHtQ6jBt6Ok9EbDXmLIG0rdbeK+bAqIIystyp?=
 =?us-ascii?Q?YDJb28CJ3QJuePVfiiVt4Ocas6SudJZJ0rQJlWBqHOENbwpfOo5nEH0wBfTU?=
 =?us-ascii?Q?DA3ej4VK2ShPdxY1IODRlsEF8bcmL21tbEBrJb6Q4Zu9G+rW/K6agZbA4Zoj?=
 =?us-ascii?Q?t0AiBOHJ2MdyX8VduJ1IuSOYdA8fua4LXDI/pGL3xhsEnddz0ITIWbcI2fQB?=
 =?us-ascii?Q?HJAf5V2MTAdZSpxI1Wu2kvfNO+A/NVE3gM0pW97pE3ZpRzWrqSKfFWidMfLa?=
 =?us-ascii?Q?LZ2UBiVrtYj4IY+nAhLbIELXYhv8ktoKMxFEWvOAPVsi8sofRtdrciPz7uOe?=
 =?us-ascii?Q?VP86+o10hwdSdy2+wf6tVd8Ax5cCS/qBORKNvsqdFKs0L2Q7tO71Zcy5V0W6?=
 =?us-ascii?Q?KjrSBGIqY0usbdiJJatjLqGdwEREeso7HsADJoLAY8GMxcsvcqnr3BwmSRCe?=
 =?us-ascii?Q?23SkYh7UnGLGBPQRBZ+gXL0z9jU8V3FPsQTYSMDNdjduclxnfxW0BKyL/9tk?=
 =?us-ascii?Q?/8Z5NI8HDZYHphmnJW7PQkGuROssB0vlW1/psiFfuDKNtQqxfYouyVt+YS1n?=
 =?us-ascii?Q?MhL4hfTkT2XFAO3MTyvnKYmj873n+GCTyYlw8GW4ftEVVg6RgevYeQAnsZG1?=
 =?us-ascii?Q?nyhx2hAwN3j7NJY5GfCVQaZWFJ5RTrIFw3cnSR77yqtDpw7nElHVu+dIlsWj?=
 =?us-ascii?Q?hjCjftmI90GKwsNWEaoRiKEhkC9ne6Vun3AQod6CPciOidJArrcDq8hQ5D9P?=
 =?us-ascii?Q?Pl8mTQiayskk4XxGi/cPc4GK1qwNmRdsePYjBZCuLMcFil3spyNgBHABefUi?=
 =?us-ascii?Q?IloMqzGf021ZNXalzS4puENOF39mQvNUbbIdDYxtIIFAP+9ridD2SUZt/W1N?=
 =?us-ascii?Q?dmH+P2UBXWOV0urTYuwFpWeTYoCIRYOx3xPrdeeugBoaHHZSS5MmKqgZOA3M?=
 =?us-ascii?Q?5UO2NAFs+bRWokV7kOiBAOZdHw4Yxyj3fNwEvsVJL4waTTAP/r2sonHPZSvy?=
 =?us-ascii?Q?69h3+qiC3SGyQoKUypeijAhzJjZKBGSMV6XnxyKC5KB3IBzCy8Pk8N1oJH8E?=
 =?us-ascii?Q?tUF+teVeOozRxS3eBc+BkRSY6utFKMem6lJRbx3kzlOjn0QAvzH1+dgMBAWe?=
 =?us-ascii?Q?VgTmVROvFvuMhzL4klxZITs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b382c96-4355-4b63-e4f3-08ddbe4e6325
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 18:36:43.6172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgFdOg8lj0G8nyUXS89txSVcAElct6OobdxMlYpKSTAiZN0HjnVx41eewkT1NfCCQm118S6KD1JkxhYgBeuAYChmX4oBLkSerbURONW4Gy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
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
From: Dong, Zhanjun <zhanjun.dong@intel.com>=20
Sent: Monday, July 7, 2025 4:11 PM
To: intel-xe@lists.freedesktop.org
Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajde=
czko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Cavitt, Jonath=
an <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>
Subject: [PATCH v9] drm/xe/uc: Disable GuC communication on hardware initia=
lization error.
>=20
> Disable GuC communication on Xe micro controller hardware initialization
> error.
>=20
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917

I think you need to swap the order of the Closes and Signed-off-by,
but that can be done at merge-time if it's necessary, so there's no
need to create another revision for this change.

You might also need to remove the period from the commit name,
but that too can be a merge-time revision, so again, no need for
another revision.

Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Change list:
> v9: Switched to xe_guc_sanitize
> v8: Fix kernel-doc style
>     Add error handling in vf_guc_min_load_for_hwconfig
> v7: Add kernel-doc for xe_guc_disable_communication
>     Unset submission_state.enabled as well
> v6: Skip disable ct on xe_guc_enable_communication error
> v5: Set wedge is excessive action, revert back to disable ct
> v4: Fix typo and add new line
> v3: v2 CI re-run
> v2: Remove unnecessary jump to err-out
>     Drop disable ct, switch to set wedge
> ---
>  drivers/gpu/drm/xe/xe_guc.c |  8 ++++++--
>  drivers/gpu/drm/xe/xe_uc.c  | 18 +++++++++++++-----
>  2 files changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8573957facae..b1d1d6da3758 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe=
_guc *guc)
> =20
>  	ret =3D xe_gt_sriov_vf_connect(gt);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_gt_sriov_vf_query_runtime(gt);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	return 0;
> +
> +err_out:
> +	xe_guc_sanitize(guc);
> +	return ret;
>  }
> =20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 6431ba3a2c53..3e0c3af235f2 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -158,7 +158,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> =20
>  	err =3D xe_gt_sriov_vf_connect(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
> =20
>  	uc->guc.submission_state.enabled =3D true;
> =20
> @@ -168,9 +168,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> =20
>  	err =3D xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
> =20
>  	return 0;
> +
> +err_out:
> +	xe_guc_sanitize(&uc->guc);
> +	return err;
>  }
> =20
>  /*
> @@ -202,15 +206,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
> =20
>  	ret =3D xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_guc_post_load_init(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	ret =3D xe_guc_pc_start(&uc->guc.pc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
> =20
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
> =20
> @@ -222,6 +226,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	xe_gsc_load_start(&uc->gsc);
> =20
>  	return 0;
> +
> +err_out:
> +	xe_guc_sanitize(&uc->guc);
> +	return ret;
>  }
> =20
>  int xe_uc_reset_prepare(struct xe_uc *uc)
> --=20
> 2.34.1
>=20
>=20
