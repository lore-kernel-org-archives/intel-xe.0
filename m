Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD5E8B368
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 21:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48AB10E274;
	Tue,  3 Feb 2026 21:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpx2JGSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EB110E274
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 21:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770154955; x=1801690955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bv+gynkX/oT5sc93U8CcJuEtqgA1fgxrnT7ymK2QC84=;
 b=lpx2JGSnLtoa5wdk24OaDU8CytWnMbz6tsFcj4UGFj6eEiJbBccbVWp/
 QhlJNoN11sB5twd2G7qRM6KhPVu6enB9BVx8U19v+a+o7d7c+ECnfwHe0
 tuDC4M4ZA9eYNN9WKfEgdT9ITWsfCf2fI5tqUXUw7pgSFJt7PkqjAsSAZ
 iePIVIlpi1Ju1AJm9ed8FZwsrX77m6b9l565xlrXI4ftHNnofFcBtSFl2
 beMIqwEFVifLSaw2ay5v0kx8QrInvMNd2syMZI20Pus/GLdC80BFRLKz3
 WejvULJ36F4GGWLbcdDtvf0WO3AfwrIMvveo01Z8lHdoTmjh9jYj+I7Jq Q==;
X-CSE-ConnectionGUID: osGgRYi1QyOkio8v3QBcEQ==
X-CSE-MsgGUID: FM4raPj5Seu584lUIfHwrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="93989171"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="93989171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:42:35 -0800
X-CSE-ConnectionGUID: 8gTvplFTSrGmPW8mA2vuFQ==
X-CSE-MsgGUID: KkAcwYr6QJq9AeIqMdGPEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210084065"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:42:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 13:42:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 13:42:34 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 13:42:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4llnoz2DER7WVtQBiFaqSAaNeqERr6ArxYuaPjOLv+Sg25dIHkSz4UFRrqhOlf87O5b0yfe8NelYfm++oTH2sFtPMpQIPeUGZanTCn2cBYn+TQRSgjB3i4A6brZRmwXNuZly8CC+9Iq8tcCZRzc3eVaOOBpnsH8QISLzUAMnxd6t7TR2bnXlR2f0c5Za3lAAjAcsV0n5W8nWgD8aJM4BF5IEFnFEHHBjBXXcw3Q8ZPPeARkpm8rIeAD2pep6+7bbaiu66D3oOfnBHRe2bJfuEJfVTIncLlpBXAhDzblKVWi2Arh+kzTnttih2uhX+zs3NLeZaH7i16ytrd50NETnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7JFdAdx9mGyDG0AmoNHdDUAlGUm7OutEnLp+wRB6W0=;
 b=pwsDYu9kv9rvrpURqRxhkDGWv2FtZjjr94Zz6qoavCp+d8ySDEcJsi0xOFI3SEkyvDJFEPiXG5pnIrMh72LTvARzP8XvtbojohDFJRPe+WbiNyNKCH1mjbCmnk0NxfVb/0tsb88fSgDmow7+iVvtpig11g8WBpeOky1sA92u1NAgn7kKjXlqNcQd0RIg6u3esqB3fYZsPJ7ssqahTq5iQxK/AJTIB2chuF7QsIF+GwJ1Im6O4grg1FeowMvCpa4ASboa6RPqiD6d97M20nsgOODeXvAgAeW50ENmRsqSWSKyaq9Npb0+w5P8uDzYGjGxSH+Gtoy/KgEB1QWreg7f7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Tue, 3 Feb
 2026 21:42:26 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 21:42:26 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2] drm/xe/configfs: Fix 'parameter name omitted' errors
Thread-Topic: [PATCH v2] drm/xe/configfs: Fix 'parameter name omitted' errors
Thread-Index: AQHclUSpsBXhIrDwr0KEjdowP+H+XbVxgMog
Date: Tue, 3 Feb 2026 21:42:25 +0000
Message-ID: <DM4PR11MB54563EC555B0DB904144CDA4EA9BA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260203193745.576-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260203193745.576-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN0PR11MB6208:EE_
x-ms-office365-filtering-correlation-id: b7eac4e9-ba15-406e-4153-08de636d1f42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?g5nak/ieUlda380Zz1Ys/lau6JZVU35VeFEMJYVPjRjv+nIdTQQ6pOxjjH3O?=
 =?us-ascii?Q?tZznyfLPtIad8/Sb//RuKkqk/G1jNV5mPlGbpvdCk70oRohNG2nnoL1Keed7?=
 =?us-ascii?Q?0cXEa0ck3F7moGWulDMtwoNRquQTpKDhVz23TwpfRfKAKWiztFss3r7yi8Vl?=
 =?us-ascii?Q?YZz4gQNsUQvLQuySNBlQ59GSF9LPms9nFbGIieACVwr5ZXKfIp/FCqk22fVe?=
 =?us-ascii?Q?5+Gllsc6Wytf2RzKVnMmj6YL+XpyecCwYouWidT2M6zvC+Fac5AKWUji2nXf?=
 =?us-ascii?Q?s46vA+D5af3qIjN5ar62IIQ4qC7SYclzRRWe6/JOvMwxLOJZ3F+m+PIh6cus?=
 =?us-ascii?Q?bnx+nPwWHoR0whgRdNHo0G1CZJblEut2hVS4I5xIWelm9hCG+AXgOe2Jyn2w?=
 =?us-ascii?Q?jADaly2mRKnPh3dDNbr9qKTU1px/j//g0rKUzE4q/Ri215NpPe3jvzHCDz5H?=
 =?us-ascii?Q?3LLznCikn4rWi4AsOnR9Nr0shK/mQeqVE1augCxHNAvGcikOXDma76PJOAE9?=
 =?us-ascii?Q?51HQhlwIrWpKwbzENyXVQqKVMocnc0GyFFiCG6HSZTxMpp7xsGPfmm/i3Kaq?=
 =?us-ascii?Q?dWloIIOJ2spK9UUqgoGdtnCAlgF8G2HszUDiw5Tt6kQ5ENwl97hPLbiMTCO0?=
 =?us-ascii?Q?g7YiyrSirwOM4Ye5XQbSRteUR/hHwM6cHdOD2QMQUASeNxITWTRPuwC2rT+o?=
 =?us-ascii?Q?SBr/Xrg4Nnn3Y9/WVpy53NCjW4W3IAFyEsOP8Xs/sJO7bJbYFQ38JDIhAmhz?=
 =?us-ascii?Q?wGVrc4Pr/ZeINsqNmXM6ioNpMElvdotbp0bQwZ+Vjw5ZqOTVhYSNmlANj1yY?=
 =?us-ascii?Q?A6yTGw7p/AgDjyNO08QLV8fRvP8jTFl1/wm6Szwxohq7nipdv5OWJf5eaYMC?=
 =?us-ascii?Q?OKoJI3bMAMqdhaDRnMm38g6MLTkgC1RiBn03yAiGqSAnCdQxzgDaZ3XHxjZZ?=
 =?us-ascii?Q?flKVO6rNwHwjjW6z3PdWHJdIdFsVb7f69cUPl3SomS/2U4z8U2K1nflJecF9?=
 =?us-ascii?Q?N0zgbByToO2lTFnOssA+ZQdbXayLzegTZCAThXIRjENiztV/iBVtoqzAJBCZ?=
 =?us-ascii?Q?ThonIbILpBs048/nXY/GAoWDv7pP5qsvX9GADfNoG1p1mqsQBfl8TKVp/U9P?=
 =?us-ascii?Q?UF7Lw29hwvaF/vSzHENCUjjSGKiRp5IVnlTYA1rDY/LOjEBqY6OWQUJ95u42?=
 =?us-ascii?Q?iKZ5mbQPuGlvgh5W2qk4RiSlQx/giqvNvJH62abw7dd3vczBts4poOlrBSXQ?=
 =?us-ascii?Q?O/L1nLPtm1BfOVstBznV5gKdRNVWTwKWedqk4X2xM/Io7hotvVwT4MRFQ4rQ?=
 =?us-ascii?Q?PhYGskUChIc3bcIOxN/efeeOxTOFu7mWvB5Fo56pYL+Y3DR1P9z3gVuahZFk?=
 =?us-ascii?Q?9Lu7m/1wOMhBYe7mv1jNiyYNDtQDNSS4KGVlZbvrg+h1GhqcZXTSQRWPdIko?=
 =?us-ascii?Q?ss5u0puYFhGFBEK9whjLxcJjFm23ce3FOk6vIOCBS/RyaER/ZNlvsdQ/58Fq?=
 =?us-ascii?Q?9GIkBHy7k97E3AxHyP1ZDvoIbcEJUrXaTUUzLvm+wmgurFJd5JG3rFIfhZ2Q?=
 =?us-ascii?Q?lE0UeJN7F8A3yn4U4fIcySGZ7tdTnzBUSH4rd6CT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p+BxAwJhgMwBIq8LcZE2h4PuSEHGYRa1Q+wuC7zXw2skH/mnohHfaXWu3U6G?=
 =?us-ascii?Q?1oYqUwiXUR8AL3LE9kIIM2cvKdo+LNbGuOdzqa7GpPO5CHK5JuUeqC1ng6k4?=
 =?us-ascii?Q?oaG42whm5ZrKXFn1y/3e80Ns+GRISvmDBHFUYAQ+OQ4QYNa6xx/sg8RN/U/Z?=
 =?us-ascii?Q?ve2QcEEzM4zZAsqhsEhuQChTDKRBqOya6sRn9P5XiczTIwhk8FeHmlsUr5km?=
 =?us-ascii?Q?I8ASCwiBq4dGBloPt6LIXvfLeGsASmOwB6jk6EaU9miL65KDDl+7riHJmgJE?=
 =?us-ascii?Q?rNK44XsjnCrMRD1gaIe+QDV8dZhyAioyv493szYxYwSznW2ffKyQE65nSKqQ?=
 =?us-ascii?Q?17Mo6ashfiC+r4qgX+1RJhSSoE4sZ0+9+nvewzdk/co7eyhr1Y7Zb2rIVUa5?=
 =?us-ascii?Q?4mXq/a/Lai2ixMFP9y9ZvhJVgQ7uuNgZoPgF8UjLRj7CfD41x6NiNmQmRY2N?=
 =?us-ascii?Q?NPkHcbL3sHeXLhjk7fQUsd3DSZNUD6ODNl9YFfUeRs9Yv5hVjUfIiLwH4Hzl?=
 =?us-ascii?Q?5juYcPml0Zrqz+KgEnqAKygw3nBj6/6rAg34+MbPR1fx2yUjOsWVGuauJf+D?=
 =?us-ascii?Q?KuspmFzwPj8G8+ukf+HcP1qsfHVFCOoO2dcEjtAeq/aUZpjPx5vs7IBjDrqb?=
 =?us-ascii?Q?EOQFrcY5MaFZF1h2oRT0u2PCm1T6/3hVHwMNTwy8IM6HxmpZWQc3WEprBBzB?=
 =?us-ascii?Q?7a0PCU228CTkjokLXQLIcYOPS075uln6xw+0NJXEyL7t/ZT8hxcWo0YPtNFs?=
 =?us-ascii?Q?OslGol9zBY3q/Zzp7mgac6JvsF1wyuuSmDf0Bs+TkcCvAKJfnBINRT9gzX2S?=
 =?us-ascii?Q?VJmUQhM+1LzROYoSbITGeUN4vem1mDvOqeTt7nhBbfIixlIBX5chv9TKs0GK?=
 =?us-ascii?Q?OtHfrF8Pl3c98/m7sgykKXLIvsrJRIUrQ7IUohpgihmVhq9hXAsA+6vVpKVn?=
 =?us-ascii?Q?8eH9IIxmE1g5aYiqBkokYYTdkALP19drXs4kCcOb0h69cerGS7bhurPkMwtY?=
 =?us-ascii?Q?jQhuBc5UNpX+PncMFqkqIcPu/NMvJFB2BcGcBu5LhOWIDt5Z4A4aDyCJ9pWh?=
 =?us-ascii?Q?Q3VfyIs0BVA3UludqrrAcvOuppmUQNPu5fwTVfd+ijUe3yvvO952M8DFFgKH?=
 =?us-ascii?Q?L/5ehTZiXAm1Z/noeUgFMSJYjA3uW4fndF5aSrRXTC5noYIpg4lu6dj5IJEo?=
 =?us-ascii?Q?av5dt2H/heRH5uZr3V38Djs35R7DUKMhFbcxfN5s5WgLEQF8FYml4TeqoH4H?=
 =?us-ascii?Q?1FeodmrVA10nPGRSxFkfk+70/1FcgCISJPF8bq7B7VtCqB1vIvCk4AcaGYEC?=
 =?us-ascii?Q?Yrwpkz3Pbjakhyl5OAK3BZVcwNdqLjbFGSnRrGpvLZl8v4+mDbCZh4MS/RJj?=
 =?us-ascii?Q?91n4js5bJNBpawxF4Y4ChDuMO/yRQ4+LXTlC+4roCnbfK6OprF9sMfF4v1Qd?=
 =?us-ascii?Q?7TjU11k2AZ+SZW2vCa19MSX36t6I/5fMZlHjcHwXk6SUM8D+K7ZkniNoDRQ1?=
 =?us-ascii?Q?guYkHohNi/0yUa+XMGpJzVxrMZYxlVDVoDrXeZZjJoR+yZtw80TRxlmV4Jue?=
 =?us-ascii?Q?qoI7SpgrflLQ9kN8VgXhQJ0r2x+BVSN2loyAtmrx6y2kmjlchP6I4vF8ly+f?=
 =?us-ascii?Q?1JXIPqiobd7TPTJ7uh3epXWPV5LBuay+76PMgeEk2XjAajg+2kDGR7UhLYCb?=
 =?us-ascii?Q?PaXUiSe2qA2WK8Jz1tU/M40ubopV36c0Sl7bID+WFwQbPNiyRV/UmIeExXa5?=
 =?us-ascii?Q?5e3sNHco7w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7eac4e9-ba15-406e-4153-08de636d1f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 21:42:25.9663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8C85hQoGTNzbF97jSHI4yH3q63k9uaADbO8AaYKEFbs2FYyOd5ri71b0XUZKfUKCaYddq0G+oR+Yc/L7yn2GSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
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

On Tue, Feb 3, 2026 11:38 AM Michal Wajdeczko wrote:
> On some configs and old compilers we can get following build errors:
>=20
>   ../drivers/gpu/drm/xe/xe_configfs.h: In function
> 'xe_configfs_get_ctx_restore_mid_bb':
>   ../drivers/gpu/drm/xe/xe_configfs.h:40:76: error: parameter name omitte=
d
>    static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *p=
dev,
> enum xe_engine_class,
>                                                                          =
   ^~~~~~~~~~~~~~~~~~~~
>   ../drivers/gpu/drm/xe/xe_configfs.h: In function
> 'xe_configfs_get_ctx_restore_post_bb':
>   ../drivers/gpu/drm/xe/xe_configfs.h:42:77: error: parameter name omitte=
d
>    static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *=
pdev,
> enum xe_engine_class,
>                                                                          =
    ^~~~~~~~~~~~~~~~~~~~ when trying to
> define our configfs stub functions. Fix that.
>=20
> Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context
> switch")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
> v1:
> https://patchwork.freedesktop.org/patch/696102/?series=3D159395&rev=3D1
> v2: align everything with the .c signatures (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> b/drivers/gpu/drm/xe/xe_configfs.h
> index 487531269511..07d62bf0c152 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -23,9 +23,11 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev
> *pdev);  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);  bool
> xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
> xe_engine_class,
> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +				       enum xe_engine_class class,
>  				       const u32 **cs);
> -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum
> xe_engine_class,
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					enum xe_engine_class class,
>  					const u32 **cs);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev); @@ -40,9
> +42,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_de=
v
> *pdev) { return  static inline bool xe_configfs_media_gt_allowed(struct p=
ci_dev
> *pdev) { return true; }  static inline u64
> xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { r=
eturn
> false; } -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci=
_dev
> *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pde=
v,
> +						     enum xe_engine_class
> class,
>  						     const u32 **cs) { return 0; }
> -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pd=
ev,
> enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pd=
ev,
> +						      enum xe_engine_class
> class,
>  						      const u32 **cs) { return
> 0; }  #ifdef CONFIG_PCI_IOV  static inline unsigned int
> xe_configfs_get_max_vfs(struct pci_dev *pdev)
> --
> 2.47.1

