Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51180C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 06:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B47010E2CD;
	Mon, 12 May 2025 06:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtCOdv+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8F910E2CD
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747032127; x=1778568127;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3iW0lC8F0l3WQEXlge13JMG0D6/9bHLkNp46W776WwM=;
 b=FtCOdv+B9RaQLUCOAhZhbNPqTpcHWpzJqiqWNIfQK2Py01qjvjv7Kph1
 PoCEkpDh/WcQF+dy2TkG/tRgwXGS2qOnqCMGtVxelRWDXRpGSVD6hsKbg
 2DeQZtBfZ/1iuS8/4A2guJl/JNgx8pqbQFN8FXmwwk2p1N+7OaoqCqd1p
 fMTqlNT0se1YtAaKaeDzREzPu8ypD0v3pZPEfFBgiddIgx8Mnax3w34Jx
 0CMP/MHiGYAnSNsJ+/5QF6LrJ0VwK73WKSVt9etEq+p6hg9RRaPwB1vBW
 e/YoT/eYErbSF7fuL0ri7dNdp//D4TllhIkvOgkLTij0saPVq7AolAd/E A==;
X-CSE-ConnectionGUID: EYniEvtwSSy/YYy7iqCscQ==
X-CSE-MsgGUID: BxIOsd3BT7KukvcYs6E25w==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48506838"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48506838"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:42:07 -0700
X-CSE-ConnectionGUID: SUf0DzyLRTeDACblXcgzvw==
X-CSE-MsgGUID: 9VZfRBeuRx+S0z5C9KT3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="174426577"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:42:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 23:42:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 11 May 2025 23:42:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 11 May 2025 23:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8LGZ+FAEBaV46RJ08NVntr7ig5rlDIExXUYq/K2smWBEro86WI+HSzSXKVqHRzMBdlrOMTtDvnwNBxTqzY9cl5h3LrDU5x4WRjmonPxV1MvUx3CdcDi/151dpqJskA/FjE+x/mReTK4jREzsq6y2/qVP91K5Sxi5hP4E4YmjHQa7I5KhzgCMf5GOwIFFQyLoMZAUH19AJ+ocRnwdrN4EvYhbP6Fi4Ai0DyrFcX/z12Gg+g7MK/vPiHhrOSqzpCEG1y6jO5h6okanmkTRZ9bVnGGRlRKoVkVsGgOeSfmR5g/o6Pgwn1+ujYMxV1096N6YXsrMV/MQIu/DJzALqWcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8a8Hy0Hmsa2Ol0nBHtYQ13RgrtS4UfZ2VrPtej80Y20=;
 b=O9l4he01lU9AuId/vvuSJysxx0RAg+o4Ur2VTJjheHwNLDmgm0qj8vd/CRyzYH4VT28gL1tBUOFAO47h3RKQyqjvtizm9K/K3KFSx42PewuAZ7+sPTTcvzZFD+yo8AV0expZ/dLM3iMMn3pjqPQ1basj5YP8Nvd8+f3Bb5MOfCQ75XMGkvObAAa0nJerBxTFGEnmJbY9c35HyMGKGXTAbvczbNSCWJComSiwJMNhH+kU50JTuyJwLvD/DfvlGeoeDQZuStTh2C95iAlfD206u3aYPAEEC217gOAiVmj+gqeMwzgdjPqUGu5TWIaHcm/YVFppQ+SoSo5LuflZaj6O9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 06:42:04 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 06:42:03 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
Thread-Topic: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
Thread-Index: AQHbtPuVFAMFIjZt1Uq6h6hu7ZlyebPOjPnQ
Date: Mon, 12 May 2025 06:42:03 +0000
Message-ID: <IA1PR11MB6266DE91973CDC2237B392E7E297A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|PH7PR11MB6401:EE_
x-ms-office365-filtering-correlation-id: 8fa06010-6d62-48a5-d2e8-08dd91201b42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ccm6vCgnsNZ4BI5NiX9TIy8RoIRZkCc989ULK40eTYMHkLGsW96XuDNjpI0o?=
 =?us-ascii?Q?zQQsLEv/SWFZ52sC/4JKcfEy9TuVc7UwyI4ZLUisjOOr3vw6/FsFMPmpoIsg?=
 =?us-ascii?Q?ze1r3Ql+ABL+niX9Xk66XwcW+NNHu/5wdepGKiKyB98TQzPXhAKnqeSd2BW2?=
 =?us-ascii?Q?2Ei+obpFacnaNNS8/TzP+G7EUx4QQT2ZPIcL1juccW+x83chEZGcAjqobTBP?=
 =?us-ascii?Q?s5Glp2KW9RsSfcE/tNzG3lffb9JkEUJSkfHrko1rfMEuP2DfKCmPN24dlwSb?=
 =?us-ascii?Q?gaZlR0LtSzG2fy4g+68cz+lZ2a4v3uxjO2DrehcAvMzcqZYAE/XEVy/Cw8gY?=
 =?us-ascii?Q?qzZH/rol06PQ2gAqA9SxMHeKcdedS1eBZU3xH2IfigtvO7jicwqfcAktrtei?=
 =?us-ascii?Q?JRAOlc+fqxR8iHRlr/1IC8KUwWh/UhiAOCFSScelMdD2jM8suhJXPJtHFgZL?=
 =?us-ascii?Q?YWDOWfOebWEaV9V78IZUuogpitlYCCubSctR8q3fzyyHdYuVasIjVqWWLAdf?=
 =?us-ascii?Q?kgdyEf9nPcL1fSveVSFdqeIrjSRtK5znZcFcsR/A5j3AKP2AGE+xvGHMr2dw?=
 =?us-ascii?Q?YljqXc4pcQ3E6FsZuie7AE5mN3Ar7cuWoTEkcGrYBF0VsJPwz2+lxvsgt/Ap?=
 =?us-ascii?Q?Jb2aETH1mR4OCGvBv5GWuUsJE/xDqXtZqs4vODSkwXIw85kqW2ajolNUHURq?=
 =?us-ascii?Q?7wSA7x5fmXfHE9sWnJ2RyXi+1Z7AjP9QNYW2W2NpJfV7ddi5O/m72ivUrqeE?=
 =?us-ascii?Q?3Scx/bo8UKx38fw/ffh9qgE5flmtLXmtTBBYk/a2DefZo8JNdwF4eZy0JN70?=
 =?us-ascii?Q?5/ROI1G+IlsOZBcfhRNxj3OE0xD0GNGTL2HWi0MgUKwUozaPSp7hkCZF0tUa?=
 =?us-ascii?Q?DLo1UhJ2I9Y4pKYoV8TC9nwZxphhjX7g7Bd0Lrtw1fK2tBaBkwZIc5Ay3HAv?=
 =?us-ascii?Q?ohdKnXYS/BiWHzHDVfuCioKS4lHALzFfNpMK5so54qelgO4WZvYeu7yQrx9b?=
 =?us-ascii?Q?2S20x/4ltD6afAul+YxupsBEhBFRVhoYwqp1Mp8HwE5VDjfLDze0a/LgMcR+?=
 =?us-ascii?Q?xUIj3EBqbjvMtnkmTy1Rq0NYIgrAUVGFnvVOpFR68NyYr5mAMV2q4ktx5MkK?=
 =?us-ascii?Q?GMN5J1AB7ipZ3hTuzRYo2aUrVmpukMVrENLAEhCbvuyhDnULFuhULiU9I3y/?=
 =?us-ascii?Q?jZiWQg4yl8oAJ09jzEiA4ruYRjiVV+6nPXkPzROkv/j+gAXeVV26h3tLzh8q?=
 =?us-ascii?Q?y3/mRariFhps8yJ57mhFt/zIce68wIWedHE9esnEWqHDnUcZlCXI27X3FdRh?=
 =?us-ascii?Q?VFpTyMixWOw0YfkgFOLQba9EJ79rx8ISV0d1BY9z5WH2N5uSFGgIt3d27wPs?=
 =?us-ascii?Q?gI0Iyu34mLCmsxxxvHojldYqE48ltG4XUVp7SETEWeUzgbOR2j9D3HfLcIo0?=
 =?us-ascii?Q?kCWSx5RQmtToxNhw8Z7D7D6U5Yndqzy5WK7LhQ5sfdt9utRk55IR7g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?av20oL2jqVk/e7TQJ/LKxmYB9ZnAxJnun0iwbTGfiIihc8y/4vX3yJ/iESJv?=
 =?us-ascii?Q?wVnAOrZDEK6r8qLt1j4vJq3ccVeQV6oqjtyFwyZlv7F25yBBd20hBOdqF1KN?=
 =?us-ascii?Q?4ELSXZ1BN2NvU4cocxr598ciGGmh+bQPtqvwe6XIQBVSCA5X9OuKfGORAMYK?=
 =?us-ascii?Q?pFqLmBRcp73tfCdHFvbkAIMF4FkDczecukctF6IodkA+MBwavPxyJNDSar+2?=
 =?us-ascii?Q?j5Zej1drIkgMYl+yVxUBpJLV357S3laSgRqeVUFaFxwkc+v91WNXjVbp8i3M?=
 =?us-ascii?Q?kRrC3ohTBYgo8vbpPYzBnzeyA0aIt2cUqAci/cyQay+qdOnzPKvBsnZdmo54?=
 =?us-ascii?Q?brv83/kKiNwa6lwYqC5ueG4Ggu16Hr+TAQzuMIdKyGszMdVSihPHot6TSdbN?=
 =?us-ascii?Q?7lZd8nOvl+PKOyn4vYjKp2SEo+JXvVs29gLue/FnVEqCbBTX+kMOZbmBEckc?=
 =?us-ascii?Q?qJ5jvNxhW+QkeYJ+5ZPgEmXMzVdnhXKya0hSO1oJBEAxxAJK9YB/vAAXgOtc?=
 =?us-ascii?Q?l4Q2bkENR0fHPnRNunehK0kw8aNpKsnwv0iMXuuXChZrd3+s07rtJcew732K?=
 =?us-ascii?Q?UF8LRjX2QJbRlBkjpxI4xVpFPU1iG3/k8gku5tWca/qXw3N+zvhnzv+ceQyJ?=
 =?us-ascii?Q?Lt8lmgL1RTn8CyfZK7xh0YpOOQ04+2o/+z9PNFQtCUZe20cinx8lAMYdXiEl?=
 =?us-ascii?Q?+uMY6dA7AxMphLxVT24inWWS4lC7JDt3c4aBsz6dpU97WV5C+SVID5QWRYlJ?=
 =?us-ascii?Q?im6iJXcc5gz473UKxpugNUqta1V02oUgXXD8lMBda6mY5n9bjfNncUCBeuW/?=
 =?us-ascii?Q?oc6q5/Py4v1teA6WxfMvYxUe5LIrfTvhb8oRETEiPRAQ+Trq22+nfALl/Rnu?=
 =?us-ascii?Q?4csKY3Gm3mjiI1eHXEqu4TbzwJyBBpzt0qfePEtJUyPSxl4lGh+2iWiquUlm?=
 =?us-ascii?Q?9D6bFkK44qpU05rT7YWsWiB2jeiXNytnUHkmvID85KiPbdM/gzvHWRynEEeh?=
 =?us-ascii?Q?t6AZHDY2XqfrthFPczzWagisw/zR/s+rtBeNM8hb5SVOxC2OCAfz7ee4/k7Z?=
 =?us-ascii?Q?ELMZxDWXmQTv/TEfQu0Hm+rFWFbCfsZXnVtSgpaLZrstO0oKOK6rJmQq+XvI?=
 =?us-ascii?Q?sDFP9JeVbtZSlGzT4bOMs1Vm98AKNgzCEqdR4fYhC86rO2A+YpTRQFm5sw+a?=
 =?us-ascii?Q?0mFHcxjfo1cZ2cVc0wnGcGjfJ/EEErqZ5csEXYedfhzRJUNeSfOs5ePyvxTX?=
 =?us-ascii?Q?pE3vrhyaABVxwtEa8V/LXpqtoe4g17k2ix+ULPrYlGKWReSlyCMHhkgeDBt0?=
 =?us-ascii?Q?xVBweiAtk0425KuJ0QyC3X81cUVYtlMMS9ASG90Jnqbvhx1Ot6BKofOtFbkK?=
 =?us-ascii?Q?hVWR/312gIvGem/TUY1m10s0jldSKp5AU1Vpys5P2GJZASw9bLNoFwqUE/p0?=
 =?us-ascii?Q?/5DMiffyqI/xbZdbq5JfClDZXPVf5ucOu65N++bXd2A5HkJfVVxJqGbnUM0h?=
 =?us-ascii?Q?f9zgOJ8rfXgekr28cNh1ZcF4UvYqwFzF2+8P+FJHzcIHqGKEEzPp6/GK6d20?=
 =?us-ascii?Q?hFYpWOGIFTHISRGVVmSPMWdryv0jrHMgXueBfOdqPcNiHPPUPwVcS+mvR8rz?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa06010-6d62-48a5-d2e8-08dd91201b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 06:42:03.8730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ISkUW/t3NntC/50Pes338B0MIuqrohnKWPWlOeU1NtTsmiUAlLw2HR8FhJAt0O0RtOcGgMYXh2bfItPWqJdkWdnCgvp/zGbJQeuuSuXEnzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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
> From: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
> Sent: Thursday, April 24, 2025 3:00 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>;
> Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>;
> Taylor, Clinton A <clinton.a.taylor@intel.com>; Atwood, Matthew S
> <matthew.s.atwood@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>; Kalvala, Haridhar
> <haridhar.kalvala@intel.com>; Chauhan, Shekhar
> <shekhar.chauhan@intel.com>
> Subject: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
>=20
> In existing code for PIPE CONTROL post sync operation instructions
> POST_SYNC prefix is not present in the name, add it so that it will repre=
sent it
> is a post sync operation type.
Is there a specific reason for this renaming? Is it truly necessary?
Regardless, the terms PIPE_CONTROL_POST_SYNC_TYPE_QW_WRITE and PIPE_CONTROL=
_POST_SYNC_OP_TYPE_QW_WRITE would be more descriptive.=20
If renaming is indeed required, it should be applied to PIPE_CONTROL_WRITE_=
TIMESTAMP.=20
This refers to all the post-sync operation types defined and used in the co=
de within the Xe/i915 context.

Renaming can clutter the Git history with unnecessary changes, making it ha=
rder to track the evolution of the code and understand the reasons behind c=
ertain modification.

Regards,
Dnyaneshwar
>=20
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 2 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c                  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 8cfcd3360896..75efdacc4979 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -54,7 +54,7 @@
>  #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
>  #define	  PIPE_CONTROL_TLB_INVALIDATE
> 	BIT(18)
>  #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
> -#define   PIPE_CONTROL_QW_WRITE				(1<<14)
> +#define   PIPE_CONTROL_POST_SYNC_QW_WRITE		(1<<14)
>  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
>  #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
>  #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a7582b097ae6..da50213b78c5 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -145,7 +145,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool
> invalidate_tlb, u32 *dw,
>  		PIPE_CONTROL_VF_CACHE_INVALIDATE |
>  		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>  		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
> -		PIPE_CONTROL_QW_WRITE |
> +		PIPE_CONTROL_POST_SYNC_QW_WRITE |
>  		PIPE_CONTROL_STORE_DATA_INDEX;
>=20
>  	if (invalidate_tlb)
> @@ -216,7 +216,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value,
> bool stall_only, u32 *dw,
>  			      int i)
>  {
>  	u32 flags =3D PIPE_CONTROL_CS_STALL |
> PIPE_CONTROL_GLOBAL_GTT_IVB |
> -		    PIPE_CONTROL_QW_WRITE;
> +		    PIPE_CONTROL_POST_SYNC_QW_WRITE;
>=20
>  	if (!stall_only)
>  		flags |=3D PIPE_CONTROL_FLUSH_ENABLE;
> --
> 2.25.1

