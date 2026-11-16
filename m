Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8653A606A7BE
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uuh2QTSk;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fLhSw1V9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4F810E190;
	Mon, 16 Nov 2026 11:26:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17310E40E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794828366; x=1826364366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=8ZiuOShLCzq7TU1vHZ6wEWgcjUaB3Lx5J98UXZ7QT9E=;
 b=Uuh2QTSkTOCp4e3kWwEVserqMUQBhwBOFFXsIuwFrquCrgwMklQ5Cgr7
 m3kWdg1SrwdcUvUn1cUM0QdZBUgBzgVi5MhuiLsSfJ7kM7kutlxqe1yvT
 wSvoP1RNaJEUQ280DdQrBQv/XugE+mbYUDF6xDHonHm8+7//n5C3SYkD9
 X4VbsWKTo/wYIcpe59LlxCBPybXmE8EhTIXU+DCkJFiOzO0vaYJvgzVUL
 kaxCscUDqaVgaeWUlNZZ/iBSq5Mr3uO10NjqyRVGC9HkqPd+DPNzpqKK2
 kV2BYOEVXnSIU69DeByNgyKDhKHcYwkfgDO9uz55JOLZHE3kBSIqP8GIc A==;
X-CSE-ConnectionGUID: yvRU9V7BTWW6x1T2ObIj1A==
X-CSE-MsgGUID: q5kDaUpdSsOK03YwYtuRBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3434655"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208,217";a="3434655"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 03:26:06 -0800
X-CSE-ConnectionGUID: czBZRspSSjyywfCuHY4EHg==
X-CSE-MsgGUID: dQBlZi82R/OKOpbgI1c52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208,217";a="9364894"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 03:26:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 03:26:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 03:26:05 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 03:26:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0bsRGswt1qyc8Tl6ZN0xn5nm84QMgixRZSTxc1vzBQ629iw/EEqpj8jjS1gKvJpYZjoA8ZkGfRy2kPvirsIu4ds9iS20fCyJxT5BtVUs35st2KxVkwSLi3/jal3RPEevMoACY3nT2wX5P5C34DBQlIQbkuPOOfx0oceV8Yhf4IupN8Wit+JUL63KDK2DBBv6qLyGJgtmz0m4+VfD/F3Lmdw+jjfOTop3ja6jYnmGBFDgD04phxswiTQpZirbIBxWkgJfU6RsJ+kjIOFiiSIfFR/8W26CRXM8Ao74JbIKO1/d6rknnkrGxXBCQSfQaSGuFM04KIQxyJYgJ7cqRehOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPA931HkaRZd8r3jGjhkkqBZaL2zh6GvixOhY923xe4=;
 b=iAm4Z3DDcwe2otjQLEk3FAiJcZcH/Mbp7LuOrosbLO4hnuEhzXk2sOfmhk4HJdAeVI15EkSutRSBD8QSgrb2s7I/uEhRlaWLimc1E86hcvSf6JFPDO0u0JOLQYGAKmi65niRuJNrwWb2MhDiXKh8d7048syWHR3LyoQ/nK6BZ6mG4THY9HIWyOP/r1fIDqwfYOpYIBnPlTj9OOCfmKzhjDgHv7r3D444Bm/o6rbA+lhq9MkJMDg8XoF+qRKx7SWblgUnXwo+VdsmLplDzHcck9pDL2LaR7q2UQ2JBxtL+iRUWeVexFjxeA5i3fOe+EjA+jwLnQnUlRnKgukusgCMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPA931HkaRZd8r3jGjhkkqBZaL2zh6GvixOhY923xe4=;
 b=fLhSw1V9/rOWHAQZxEDhlXhypy6ONSflhgB1DZ+px21SiLWLu4y0qwjUYNzLc0lJPyJWdboZXu5rZ4qKrlEmtZ0vqQz14jI3Kls9gtvYOJqDzMu+34B5BuWVYDWWj9ANPcGRprGTp2AO2sPca/aU+/uz9BWcPEBWVGMnn0dZozI=
Received: from CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10)
 by IA1PR11MB8221.namprd11.prod.outlook.com (2603:10b6:208:451::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:25:57 +0000
Received: from CY5PR11MB6161.namprd11.prod.outlook.com
 ([fe80::5f03:e3e6:6e73:20f1]) by CY5PR11MB6161.namprd11.prod.outlook.com
 ([fe80::5f03:e3e6:6e73:20f1%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:25:57 +0000
From: "Legowski, Jakub" <jakub.legowski@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
Thread-Topic: [PATCH v3 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
Thread-Index: AQHdQR6FY8HyGUhrb0GIVSsS/Jrqd7cw9+pb
Date: Mon, 16 Nov 2026 11:25:57 +0000
Message-ID: <CY5PR11MB61614CA8621EE779FA834DC7917C2@CY5PR11MB6161.namprd11.prod.outlook.com>
References: <20260910121759.1835037-1-jakub.legowski@intel.com>
In-Reply-To: <20260910121759.1835037-1-jakub.legowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6161:EE_|IA1PR11MB8221:EE_
x-ms-office365-filtering-correlation-id: c144c2d4-c412-42c2-9659-08df43d462a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|8096899003|11063799006|260925022911599003|260925021911599003|260925021311599003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: ywqjE4ZmeRJxWhwiTxGvGQtqSk/5qLCp5SZVgEukXzPABFt9ssHyAjzC77SpIpmxj0GcBDtCwVMFAmgr/dGJRO+7cxmd+qmkOR65eeM5S66HLnGcCPfWvjnQ7GjGQfyJHDbBApwGBysiGTNT21yTA6Hoo5gHLZY/JnTK2ezYW0lT1X9d2eXYCq6zjVOZDXp7UKtCk63PzYCz7jlnzFgr1vfNFUwKtgNuXmYLO7myGyqm93/KinLZmFExtb/eTKigSrgbJcH2re8wRRmqV9MA3TiKOZp5QvBZkzJZaem/+v30qew2OlcpnlfdqEW077BEsJOOtrv5WUVvq4DAwA+PTUC+Mt49wAKnghMY2UuLYeB3OfmAsk37MlzYQ2Qwn89hY6Eh5QMhVukKd8NnoVeCiupXLkSeqZnw/QfpbwJ3X8UbYROiB4OVdcUu/ymftYOV++mWnzPy5jtG8DRAd8Zd9vD9mFxNlfFsWNvAT+3Naaqda/r6rbI3mJ2Zo4P3EnSlc5ShNdaDTUjW3cSVt4m03DzphYeh5H3v4n1mum6dljVVVW98EpCrG+9FG6hsrjPfJ4/U/+7Zw0GF4FJdXJ/ncVjZnWaO6aDMjHysjUo8zlAJatwQq3qRPmh5eE1+bWCHdv4145OlLrOQQQgJDrqj1QIIrpdQ51YakI13nnLHfI81pHkSukGLKiNrLAAM3bkIDWRLBljylZLFq2K7BjvOci5ESL2z0HCz3EmlTlMI7Ys=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6161.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(8096899003)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yXZgh8Eed4Q6X1vZRE4oF4zAkfmmY+pjQHRKkGkUgT5ZhbLlamkGhNQp15jK?=
 =?us-ascii?Q?6l6cbsrv5NJF8E+Dx9xVmV2PnLMoPfjMvMhjAA+aihL+GgHr0/Uwvh8hJgL9?=
 =?us-ascii?Q?VQ1o1VsgDJF8xwOgVw03qMmxUA1XWaSJdMTQohsGk77YJdXLZOtsUcfTvBeY?=
 =?us-ascii?Q?k35XY50wEBAHuEGpraigNTz3E6rcQZcl/MHNWuvhrI/EIpF33EH3Vu+sD9tS?=
 =?us-ascii?Q?tklUx1h92pZZnche4QwC3a2IEYsU+ZPl/DbNOf5nMFw0ZhVWhigOsZyyhla2?=
 =?us-ascii?Q?Y9Y01iBkBbCWYtLYLuUv850cfuX1CiZztBeKQPecY+yQ1LgjHz0FdxQkx8El?=
 =?us-ascii?Q?z9zvOAClyWkO0jM6Xv9WF8CMPJK3T2aiV/boObR7AhEDgrLbgApy8SiuLPFp?=
 =?us-ascii?Q?1LSA2N0AitQaIls0pNTq5Jx8bJ7ybr6EcQw/BpseI+Eilgot+T875NFcm/i6?=
 =?us-ascii?Q?RjW8SSPNSnhNd6STTd1iMMwYbufB999fq0EMKdSPPuo5OOoZJCHf0Hz6DU57?=
 =?us-ascii?Q?E/hA6KkmkW0nlkTID7XKghDFpkf+wR9+v/pUu1qmFLC0pbBKE5Jx4/6r/Cde?=
 =?us-ascii?Q?8eKM6QIu1ca1V8fNGWcR0EsVEw5RyYsyF6VYx+IMK8P8c8dhrxssDSmtUcIO?=
 =?us-ascii?Q?NuMbH2hnhWroFjsITtIAjqTzcnMSQ4P2+eGkLt6eMz4DfibKZgUnv6OxSSlE?=
 =?us-ascii?Q?u9UQCVRokAf8vzdCPgwK3LJRvcLov7B0Vm6tRyjoFjcO1qdbLzAL0ZFKfQ2d?=
 =?us-ascii?Q?Uz8/qaI8t1CcPf3TmcoyPQDCt4Kk2uTM7mbRclnoDEiX8SXxwqP2eORGwE+o?=
 =?us-ascii?Q?UvtBopCCxU8qb2xWX304HIFzXCiATtZdakgZzzwss5OMFOvs85EE0ZrJLMWz?=
 =?us-ascii?Q?6dXKHfmWKzd4IkGq7fFGN/Eh8FZhdlSSLmPg8BV/KgYgWE1cdr7b+KkpE1fR?=
 =?us-ascii?Q?ecw6DVYprGacroq7YxhTzckYipex/jbeZ0EbrzsY+7NJd4FQ+nHqUDE3Kdyo?=
 =?us-ascii?Q?mBxS/10c/P5k7GgH21RNaXWzPEkzVGMXvq+phDNcUKWUguEnvztqvFIyfMhl?=
 =?us-ascii?Q?MHXfZ38WryYZ7ykPvQkQvGJyNvU+Jamky44Yhybr28vf9c2w8riratpdLzxK?=
 =?us-ascii?Q?m/YB9DWdztpnSh9MMd0symo87No8hVHWI7D3CTQaWghcKs/GdGcmuNYpmx5t?=
 =?us-ascii?Q?2Su1nkQ4GZnyZ5fVx/vUUiYbYSXtglzLrwYEthw4BpAqxuXL2w/P3RH7Gd4+?=
 =?us-ascii?Q?IPdm0l7GskPwb5ZMuoj8kRo1/vvmGLX0wj/jHxc3NcakD5XwICKZ9yVXotYV?=
 =?us-ascii?Q?ZXfKgVgVCq6ieIjR/zmRTuSG0yxPsmO/llJrNu1dZYVcWlA55mXsUxrzg0Fq?=
 =?us-ascii?Q?Ht1Xlftnef0JhUT/4Qj49pF1bIwgKvLURau7TMXG24CPAggjyvEXXdJ48KDW?=
 =?us-ascii?Q?I4mAUwkr+Trk+SyzMtW/k9INX3WK4il/0ttZYPOuCOIW3O/k2/8yvdaCDv4z?=
 =?us-ascii?Q?3ECNAc1pO0WREmpZuHf1PNlgStUSuD7yZZdx1CnAYpxHiwew0Ot/oUd7CRX7?=
 =?us-ascii?Q?jMEiTAp4ajNXoGQOMwfx2eyv5IpC+TxI3Rwav8SkSUtbMF+Mertlwc8kt1tv?=
 =?us-ascii?Q?yy4kFkAI2nUeDkBEPtalw1uDFGImvcqaSSVVLIZ+t0hSRstNpL9CTxSbTUvA?=
 =?us-ascii?Q?reTGLCZsX3iRlttQmxWEfCXrj9jfpRa/+pToxfEHg8YNxvtU75qvWdVLhmbN?=
 =?us-ascii?Q?twF4zIj5VA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CY5PR11MB61614CA8621EE779FA834DC7917C2CY5PR11MB6161namp_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YiZlI1fmrYsaDvYBCi6hb4HQ+IS5ofpFrBkXnf+GM0A/WI52LFZGZ9RLxcGnpQALltBhtfdq73ELp4Vb7zv0O0usN21N+JItx5BZJ0ccaY8CbK1o/gD0e/fWx9/hUBdFJJLDdlJXWleUjTp7AOMenb3RGSnt7yrAKN/khd5lTl4GjYzY9XIgvQNku2tJU4ZGTFGSaPKYHyTXpi5B1CNZ+OQ3DSRhxl8gNSjp9NiFA14Tw8z4VF0GjkozrjHXWW4aU2RBvxictPYwLVkxNrwtUGmrQceCQBtr9+KzU0f4dO2FPNLAgJKgj1VP7AmlbeJD1+l8M4PKApMiIa1EHwyO6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6161.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c144c2d4-c412-42c2-9659-08df43d462a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 11:25:57.6647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VpB7UUk699ai27BHM7gwAkGDbUhT1j9yYP3EUFcKc2LkrQ5ogWiAQDYXQIsCw7yd+u/7SjUbud9igr9msD0vL3TNeDvf66yOO7WHTQeNJSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8221
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--_000_CY5PR11MB61614CA8621EE779FA834DC7917C2CY5PR11MB6161namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, are there any blockers for this patch or could it be included in new ve=
rsion of drm-tip?

Best regards,
Jakub Legowski
________________________________
From: Legowski, Jakub <jakub.legowski@intel.com>
Sent: Thursday, September 10, 2026 2:17 PM
To: intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>
Cc: Brost, Matthew <matthew.brost@intel.com>; Patelczyk, Maciej <maciej.pat=
elczyk@intel.com>; Legowski, Jakub <jakub.legowski@intel.com>; stable@vger.=
kernel.org <stable@vger.kernel.org>
Subject: [PATCH v3 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done

Move wake_up_all() after clear_exec_queue_pending_disable()

When a SCHED_DONE G2H arrives for a banned exec queue,
handle_sched_done() calls wake_up_all() before
clear_exec_queue_pending_disable(). This creates a race with the
wait_event_timeout() in guc_exec_queue_timedout_job() that waits
for pending_disable to be cleared:

    smp_rmb();
    ret =3D wait_event_timeout(guc->ct.wq,
                 ...
                 ...);

This was observed as:
[drm:guc_exec_queue_timedout_job [xe]] Tile0: GT0: Check job
 timeout: seqno=3D4294967169, lrc_seqno=3D4294967169,
 guc_id=3D4, running_time_ms=3D0, timeout_ms=3D5000, diff=3D0x00000001

Moving the wake_up_all() (along with its smp_wmb())
after all paths that clear pending_disable, ensuring that waiters
always observe the updated state when woken.

Same as for runnable_state =3D=3D 1 in the beginning of
handle_sched_done().

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc=
_submit.c
index 99d8c807ff05..a181b5042293 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3239,25 +3239,27 @@ static void handle_sched_done(struct xe_guc *guc, s=
truct xe_exec_queue *q,
                         clear_exec_queue_pending_disable(q);
                         suspend_fence_signal(q);
                 } else {
+                       bool destroyed =3D exec_queue_destroyed(q);
+
+                       /*
+                        * Make sure to clear the pending_disable only
+                        * after sampling the destroyed state. We want
+                        * to ensure we don't trigger the unregister too
+                        * early with something intending to only
+                        * disable scheduling. The caller doing the
+                        * destroy must wait for an ongoing
+                        * pending_disable before marking as destroyed.
+                        */
+                       clear_exec_queue_pending_disable(q);
+
                         if (exec_queue_banned(q)) {
+                               /* Pairs with smp_rmb in guc_exec_queue_tim=
edout_job */
                                 smp_wmb();
                                 wake_up_all(&guc->ct.wq);
                         }
-                       if (exec_queue_destroyed(q)) {
-                               /*
-                                * Make sure to clear the pending_disable o=
nly
-                                * after sampling the destroyed state. We w=
ant
-                                * to ensure we don't trigger the unregiste=
r too
-                                * early with something intending to only
-                                * disable scheduling. The caller doing the
-                                * destroy must wait for an ongoing
-                                * pending_disable before marking as destro=
yed.
-                                */
-                               clear_exec_queue_pending_disable(q);
+
+                       if (destroyed)
                                 deregister_exec_queue(guc, q);
-                       } else {
-                               clear_exec_queue_pending_disable(q);
-                       }
                 }
         }
 }
--
2.48.1


--_000_CY5PR11MB61614CA8621EE779FA834DC7917C2CY5PR11MB6161namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: &quot;IntelOne Display =
Light&quot;; font-size: 11pt; color: rgb(0, 0, 0);">
Hi, are there any blockers for this patch or could it be included in new ve=
rsion of drm-tip?</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;IntelOne Display =
Light&quot;; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;IntelOne Display =
Light&quot;; font-size: 11pt; color: rgb(0, 0, 0);">
Best regards,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;IntelOne Display =
Light&quot;; font-size: 11pt; color: rgb(0, 0, 0);">
Jakub Legowski</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Legowski, Jakub &lt;j=
akub.legowski@intel.com&gt;<br>
<b>Sent:</b> Thursday, September 10, 2026 2:17 PM<br>
<b>To:</b> intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.or=
g&gt;<br>
<b>Cc:</b> Brost, Matthew &lt;matthew.brost@intel.com&gt;; Patelczyk, Macie=
j &lt;maciej.patelczyk@intel.com&gt;; Legowski, Jakub &lt;jakub.legowski@in=
tel.com&gt;; stable@vger.kernel.org &lt;stable@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH v3 1/1] drm/xe/guc: Fix wake_up race in handle_sched=
_done</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Move wake_up_all() after clear_exec_queue_pending_=
disable()<br>
<br>
When a SCHED_DONE G2H arrives for a banned exec queue,<br>
handle_sched_done() calls wake_up_all() before<br>
clear_exec_queue_pending_disable(). This creates a race with the<br>
wait_event_timeout() in guc_exec_queue_timedout_job() that waits<br>
for pending_disable to be cleared:<br>
<br>
&nbsp;&nbsp;&nbsp; smp_rmb();<br>
&nbsp;&nbsp;&nbsp; ret =3D wait_event_timeout(guc-&gt;ct.wq,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ...);<br>
<br>
This was observed as:<br>
[drm:guc_exec_queue_timedout_job [xe]] Tile0: GT0: Check job<br>
&nbsp;timeout: seqno=3D4294967169, lrc_seqno=3D4294967169,<br>
&nbsp;guc_id=3D4, running_time_ms=3D0, timeout_ms=3D5000, diff=3D0x00000001=
<br>
<br>
Moving the wake_up_all() (along with its smp_wmb())<br>
after all paths that clear pending_disable, ensuring that waiters<br>
always observe the updated state when woken.<br>
<br>
Same as for runnable_state =3D=3D 1 in the beginning of<br>
handle_sched_done().<br>
<br>
Fixes: dd08ebf6c352 (&quot;drm/xe: Introduce a new DRM driver for Intel GPU=
s&quot;)<br>
Cc: stable@vger.kernel.org<br>
Reviewed-by: Matthew Brost &lt;matthew.brost@intel.com&gt;<br>
Reviewed-by: Maciej Patelczyk &lt;maciej.patelczyk@intel.com&gt;<br>
Signed-off-by: Jakub Legowski &lt;jakub.legowski@intel.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++-------------=
-<br>
&nbsp;1 file changed, 16 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc=
_submit.c<br>
index 99d8c807ff05..a181b5042293 100644<br>
--- a/drivers/gpu/drm/xe/xe_guc_submit.c<br>
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c<br>
@@ -3239,25 +3239,27 @@ static void handle_sched_done(struct xe_guc *guc, s=
truct xe_exec_queue *q,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear=
_exec_queue_pending_disable(q);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suspe=
nd_fence_signal(q);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool destroyed =
=3D exec_queue_destroyed(q);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Make sur=
e to clear the pending_disable only<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * after sa=
mpling the destroyed state. We want<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to ensur=
e we don't trigger the unregister too<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * early wi=
th something intending to only<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * disable =
scheduling. The caller doing the<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * destroy =
must wait for an ongoing<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * pending_=
disable before marking as destroyed.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_exec_queue=
_pending_disable(q);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (e=
xec_queue_banned(q)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Pairs with smp_rmb in guc_exec_queue_tim=
edout_job */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smp_wmb();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wake_up_all(&amp;guc-&gt;ct.wq);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (exec_queue_d=
estroyed(q)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Make sure to clear the pending_disa=
ble only<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * after sampling the destroyed state.=
 We want<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to ensure we don't trigger the unre=
gister too<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * early with something intending to o=
nly<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * disable scheduling. The caller doin=
g the<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * destroy must wait for an ongoing<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * pending_disable before marking as d=
estroyed.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_exec_queue_pending_disable(q);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (destroyed)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deregister_exec_queue(guc, q);<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_exec_queue_pending_disable(q);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
-- <br>
2.48.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CY5PR11MB61614CA8621EE779FA834DC7917C2CY5PR11MB6161namp_--
