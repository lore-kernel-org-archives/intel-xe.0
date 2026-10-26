Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C42606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XAfBTQN9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A31D10E09A;
	Mon, 26 Oct 2026 21:54:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1853210E09A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 21:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793051673; x=1824587673;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l21caAxnA7E2/Kvf/aHPYip6SgBN3ellTNZCPu1iC2g=;
 b=XAfBTQN9nzwUZWI20kuQBLHhpf75ttyweTxKHQjO0a1dZlQqHCrBJv1w
 igAdB2iUwfqhrjNlrGYV3pc3BmsT+UyJzcYvGJPBvimF40qnbvb+ZH2I5
 EsWuJmbPCKBbOjKsjwWAs6yxZaj+Omjn4BIn6nX3aDtrzpMQiSHX341Ox
 whlTe49qQZ10vprPFMZbgQYAMUL9qGSy3uLhNX8leE+1wZbpuL/3kL6Hj
 dd4Lg7+tHpfDb7hFotEapPcNpsdCkH5wDFN8NTlXJfqQRnQ2DB1CZk/Ev
 /bUjNse7ToVF2dNnHTlFQ9DyAaHIcUWnArOsXZQQAwqCfrU2iST+e2t/w g==;
X-CSE-ConnectionGUID: RT9Bl4MfQfCVk9MJtHBAQQ==
X-CSE-MsgGUID: /GjTd7h2TQeUHGYjblSPzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1631274"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1631274"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 14:54:33 -0700
X-CSE-ConnectionGUID: RXTd7xNySBuzSP/xVV+rag==
X-CSE-MsgGUID: n/QosC9xSn2EeytOJYhCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6240225"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 14:54:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 14:54:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 14:54:32 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 14:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7FPQtX04jrMjdkycXj/kJbsEclVGoZIN+Ks6hUxE25Eb5gM6TzG+ESv3sqo7XRFUQjPNA10/Z2PTWyIXMft1ICwVTBjGNtY1pUZVe9WtuVl9ObK3dxWu43+K/YlMVASQvV3KoBKs+baR2Mvug0/06elvPSU1vJ9OUbGPfIv/NmK+a+PHe10D1Jb8g9NB6o9N2ioEQ2Bpa3OtGFPeLBp1Emwxbqo2wgNFJooL61fiTVVWJ3cpGSRZsmMATP0AMymYOyEFFVsLlOtAsaM3FtR+xojpg7BDkD6wopymsScJJzTQnBQV34LMWwIGsYsXjTmjwYyBBEgfTFfiY6bUXZIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZJxRoahrNzYsqy87SXedXuA6XFtbuBjA95BZSz4VPg=;
 b=n3NVSXDbdPKZ55M+S2t9i9g6hI0XhPmfoxtpaoSIp3ibL70QAr8wUXaAhOQqhwAOVlb7zuk0Nz4suEVkMEg82lIUJWri8+zWg03nStio3RzZI5FPZCwXMISgYsa+mMEVHgtW/RoBv3FulYt7QRRxyQL/+M3/nqaoZ9ypT/UU7YHHXT2qZjY7hhd1+Oo5LmIqWZwGHKCanwGlcRut2lvDm9GbVA+8Xcs3MCxtnAP9xckcXyQItdhPy6toDDyHPPAsMijqWQ4OBkc6mQGyPFwmPvhFqgKLdl8TRj4w/FTt9uVrrhF7OTkJyFlOunaWWd/hxgad+az+omc25yt4bPm3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by PH7PR11MB6834.namprd11.prod.outlook.com (2603:10b6:510:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 21:54:24 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 21:54:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Charles, Daniel" <daniel.charles@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>, "Yao, Jia" <jia.yao@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Topic: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Index: AQHdXaluV8WgdKZjk0irk4kfszJejrcQbajQ
Date: Mon, 26 Oct 2026 21:54:23 +0000
Message-ID: <CH0PR11MB53950982B31056C6EFCDBD54E5612@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261016195904.1377149-1-daniel.charles@intel.com>
 <20261016195904.1377149-3-daniel.charles@intel.com>
In-Reply-To: <20261016195904.1377149-3-daniel.charles@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|PH7PR11MB6834:EE_
x-ms-office365-filtering-correlation-id: 470bef38-5c2e-499b-0adf-08df33abb2ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|10067099003|56012099006|261026140227099003|6133799003|22082099003|18002099003|261026121527099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: Ngn6t4Nn++qIujyqOpGP6K2DViBFQpbDBw+5+uXwypraZpvLReLytOczZFcGgyWjVP1cPjEdP+Yoia20WF2A1Z8ZkcRVNBLzs+g3YIkMNTx+tGxXeAGpueFFjDFoHyEjxQoVbqm2cfvXgMqOQ6p9hYLyCBiYPkgCJoSOBJMP8Ulo57LwYQL7uUzxk7dP/7CZqMbN6FGlGHsJKnGaW/eTNc8THvZI6QfVhC+X2uK5s3lTBNuthBpG1kEs0OVHUXis+wj2Flq9boRsKG27TCVnG+c0FqUg7X0MfdmM+NOyDALybg1EdCIVJPZ2TKhINTwPjytK7rXrAKzn4+RVqVl1jrE3E9O4mg0ECRNBkvRBbkGyq+2iV+yscXtXpC/jTXcvZrhk7uZ2qzDbtXIPCm/O+q52TVyXvouUAsduiXSLB5PZt8kAozN3oPRTrGvJ7bzLrCzR+Z3XzWgnMW5id/tbipKgWPc7fKuyHiTZJAj5ALOo1ofxV/C5PA0+khQTXEeBFpVibAnMR/UcuI9QpgyAZcR3ko/u1dSayHgorcf7tXaSgjlGNJn6vCYI/qLm9Vh5fDRIOuEL3JRq0Ic1aEju4uk2eW6d1V4Jq0rxhtUvELQ+Wuor7BXtlKIaBAIFmYZ0CUQmw+JKNrEIqrakY24ZFXin3ISgbfN7XcN0cgrj1pzrmROnM8kuLkufEZzbt3HtIZQ6KV5oCiBhvZnQ+yI5MEXYzKuPS2q/GbGXnMN4qLU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(22082099003)(18002099003)(261026121527099003)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CaLGvdlta5lXdJKMaI0zG/bhHHyzaJbb+oPNl7wH6QCBY/EOIdu+QpNTVVJU?=
 =?us-ascii?Q?FbXAXbxL0IsWzl9dpg8FDlQsOifniEsk4Lt8BQAmRtktpqHsgjWDhUDbfTfC?=
 =?us-ascii?Q?c8Cp2DAokCMsrt3PIk91G91iWNKhekDR5YHDAF3u3Ra6RsiKqQ1oGFhRZoJf?=
 =?us-ascii?Q?2gy8NsMZEajEluPQN7Y9IWqOGoMc9/mj+YqGxLM34hwInFfVyPzZWMBSbHtC?=
 =?us-ascii?Q?yaOxPl2fRRuwgTjO/vUq7Zkjer//DUFouF/uNnjyQZYHsf5i85iV9ilvQmWo?=
 =?us-ascii?Q?NJuRAH7a1Cnxg32bSnJlvMYxVd+wjGsUCOi5XaR6PKOY9SeYws75+lVhWbCj?=
 =?us-ascii?Q?Tto0GMyseTZQ9fG82UwWwJZ2FNYsK1PdhfwK9/pXLitJWFwJn1EhOeB42q+4?=
 =?us-ascii?Q?9DCjiT8+I19K3C6EKJ3+Uv4ZJir9ZdrgoX7f7Kz7Jqt8B917B7EkEXiCbz16?=
 =?us-ascii?Q?5EF/9uJFfax9op4+gI+2i5/7HqFFyBrEmrI2e9d21b+Vm2a2Mp8l04kW3KOp?=
 =?us-ascii?Q?C3Q4fNIej2O6JwjSRZjNddTQoBFuOdTNfFCuOWpA066esH4Rej8VRUrFX2ib?=
 =?us-ascii?Q?TDdd9RJpsp6OQrCEVK2HoQY7FyuczTJ03A7Hr5OyWHh7TGa2d7Va+PJHpp8M?=
 =?us-ascii?Q?2yoO7EMKz6wt6nkUoOANMR/eRpq8+2D8FOrxHdaxKG/rjJj4jvUTHMSOkoSa?=
 =?us-ascii?Q?hwAle0eUi/3vNbWhjL/tkubBvkeRBdHFjY12ilrQBVweM+1t9YPzWWWvrhD8?=
 =?us-ascii?Q?u37xF6rQddDxgbR0AQYv59muyFMcY/9BprUB0m+T4ejsauqAmVO8UAvapBBW?=
 =?us-ascii?Q?QbIag5ZsR6FLQJwSmxBB1ugEwpJbrcbnINcYfxYe5zJFZLTBe3vX64gKul21?=
 =?us-ascii?Q?1/gfYzv6fp4XbXfPilKWWTngvABPp/Wo8vtWsUz9ovdOtS+9nIeUpsuwz6Hr?=
 =?us-ascii?Q?W1eq2fYGierq+yDm30kPtcNEXZw/F74lyA1+d432UuMnQS5CjD7JVbffzJ39?=
 =?us-ascii?Q?ZxQZvyLd5AkDREu3pUtoPg9s12Qb/pjG6OCESJLnms9UeKp4clTXlBxd03Gw?=
 =?us-ascii?Q?FX7I9QtvbxEzIH9+jzVrHOZbgHRlemQmvD5t0NBDAuX3SoEiocPnmAdXBlxC?=
 =?us-ascii?Q?Wqi2s+AGNHewQbTPjdmh+9SvNXG3JsNkWdaBUsN+AJObKiWIn3nVVjXlc8xG?=
 =?us-ascii?Q?jOuya8gpMFq0aDxvUYapogvt12/EfkteGrWA7KFckt9KtII1eKzDWZGyVbNi?=
 =?us-ascii?Q?3f90gdhymoJAZ7cq4dnRkPYA+jXnbfI0xRUgsRGjsWSLjpMzdJIwL03cEUil?=
 =?us-ascii?Q?FyLJPwsEeJte3LEKU3Hr1EF33gr9zBqG8xwUY6SM6J9VMtcx5zApfeGNyKrK?=
 =?us-ascii?Q?DHawbd9k0PAJz8pV1rsK3r9vbS8GYMovdLLBEd/jUrROGwZvuzmFyL3ZtZMs?=
 =?us-ascii?Q?W1nYfEWOrBIkx0LXsySHsFRtsp0tBXd1XUYQXlq+YLs9/B6bVwxBk4+j90Pw?=
 =?us-ascii?Q?pFEBk9ti+4OSGEGZNhkrWqTVNSAtY1AQMtYp+4pufOwoOkYfTupfvtoHdok5?=
 =?us-ascii?Q?y5y8/KzlEp/PpfDUQ23U9JOHm/msuLYy8hI5D708XaY81CDMQtZRz09j2lqV?=
 =?us-ascii?Q?O8j6Hnv3eqJntShns8nM14NRSsQIMhrM2sBqMgzWTp/LZ00YTxWbIFlx3c6Y?=
 =?us-ascii?Q?embsdK/0PLjgvIGafIgSO5Ynf5INijRPgTNXVqMYjKkQgRHEN9a5H7oZWVL5?=
 =?us-ascii?Q?ZRfNRulPrw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nGpAbPzXu1GKb66bDVpryqShVvCJYwxhOdLNP1gsuUv4A2Wg9kYxbHh3qa7/jLj5zlGVkUjjJFpizPRLFwMntwb2+2rdgNq7MSkW9zI4SUkIKI/UherllcciS/NO7P75YW5i7T566HrNZ2Smmw5NsXKS1+q9HdIe2CzYD+1ZBtzEWrc4dD7kqyGOScBqSD98IvmFTpg1OjiJSYSN/6dXeQUYapmSLs22z9mYMu3vjzONgZulmo85Fip5h9ER712t4F6s1N+Qr6TuHdCPYqGx6Vp9zBVCJD4WXHaL8vngFoz5dm1DehxcpNq8L1J6625Pq6h4ccdNe4Hn7AqWzTwIDg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470bef38-5c2e-499b-0adf-08df33abb2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 21:54:23.9779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwEL9gV8giloUyQTO/GsluRbjGBXwcukDUU7+SZ0PU1EYXFK0++2EkdyeIN46GC47X6z67y2nTRQiCf9fEAaOa25YxbGcQwQaV51y57Kmv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6834
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

-----Original Message-----
From: Charles, Daniel <daniel.charles@intel.com>=20
Sent: Friday, October 16, 2026 12:59 PM
To: intel-xe@lists.freedesktop.org
Cc: Wang, X <x.wang@intel.com>; Yao, Jia <jia.yao@intel.com>; Cavitt, Jonat=
han <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>; =
Charles, Daniel <daniel.charles@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Disable scheduling early on FD close to avo=
id CAT error cascade
>=20
> From: Matthew Brost <matthew.brost@intel.com>
>=20
> When an FD is closed with many exec queues, teardown relies on the TDR
> path to clean up scheduling. However, the TDR handling is serialized
> (i.e., only one exec queue is processed at a time), which can make it
> too slow compared to GuC scheduling activity.
>=20
> In this window, GuC may continue to schedule contexts backed by invalid
> page tables, leading to a cascade of CAT errors and repeated engine
> resets. This significantly increases recovery time and can degrade
> system stability.
>=20
> To mitigate this, eagerly disable scheduling by sending a self-message
> outside of the TDR path. This prevents further scheduling of invalid
> contexts and avoids the CAT error/reset cascade.
>=20
> Wait for pending enable/disable operations to complete before sending
> the early disable. If the queue has no references when the KILL message
> is processed, let the following CLEANUP message handle teardown. Assert
> that the queue is referenced when kill is entered.
>=20
> Cc: Wang Xin <x.wang@intel.com>
> Cc: Jia Yao <jia.yao@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 70 ++++++++++++++++++--
>  2 files changed, 67 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/d=
rm/xe/xe_guc_exec_queue_types.h
> index 74b711abe2572..89397e1e65465 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
>  	 * a message needs to sent through the GPU scheduler but memory
>  	 * allocations are not allowed.
>  	 */
> -#define MAX_STATIC_MSG_TYPE	4
> +#define MAX_STATIC_MSG_TYPE	5
>  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>  	/** @destroy_async: do final destroy async from this worker */
>  	struct work_struct destroy_async;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index c4ef3e9bf7a18..97369d97ef51f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2045,12 +2045,45 @@ static void __guc_exec_queue_process_msg_cgp_sync=
(struct xe_sched_msg *msg,
>  		guc_exec_queue_send_cgp_sync(q, 0);
>  }
> =20
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
> +					      bool bound)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +	struct xe_guc *guc =3D exec_queue_to_guc(primary);
> +	int ret;
> +
> +	/* At zero references, the queued CLEANUP message handles disabling. */
> +	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
> +		return;
> +
> +	ret =3D wait_event_timeout(guc->ct.wq,
> +				 (!exec_queue_pending_enable(primary) &&
> +				  !exec_queue_pending_disable(primary)) ||
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc), HZ * 5);
> +	if (!ret && !vf_recovery(guc)) {
> +		xe_gt_warn(primary->gt, "Pending enable/disable failed to respond on k=
ill, guc_id=3D%d\n",
> +			   primary->guc->id);
> +		xe_gt_reset_async(primary->gt);
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +		return;
> +	}
> +
> +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
> +		return;
> +
> +	if (exec_queue_enabled(primary))
> +		disable_scheduling(primary, true);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
>  #define CGP_SYNC_MSG			6
> +#define KILL				7
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -2085,6 +2118,9 @@ static void guc_exec_queue_process_msg(struct xe_sc=
hed_msg *msg,
>  	case CGP_SYNC_MSG:
>  		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
>  		break;
> +	case KILL:
> +		__guc_exec_queue_process_msg_kill(msg, bound);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2211,8 +2247,21 @@ static int guc_exec_queue_init(struct xe_exec_queu=
e *q)
>  	return err;
>  }
> =20
> +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> +				       struct xe_sched_msg *msg,
> +				       u32 opcode);
> +
> +#define STATIC_MSG_CLEANUP	0
> +#define STATIC_MSG_SUSPEND	1
> +#define STATIC_MSG_RESUME	2
> +#define STATIC_MSG_CGP_SYNC	3
> +#define STATIC_MSG_KILL		4
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
> +	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_KILL;
> +
> +	xe_gt_assert(q->gt, kref_read(&q->refcount));
> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	/*
> @@ -2222,6 +2271,23 @@ static void guc_exec_queue_kill(struct xe_exec_que=
ue *q)
>  	 * stays set until the queue is torn down.
>  	 */
>  	suspend_wait_wake(q);
> +
> +	/*
> +	 * We eagerly send a message to ourselves to disable scheduling, as the
> +	 * TDR is serialized (i.e., only one exec queue is processed at a time)=
.
> +	 * If an FD is closed with many exec queues, the TDR can be slower than
> +	 * the GuC scheduling contexts with invalid page tables, creating a
> +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> +	 * this by immediately disabling scheduling outside of the TDR.
> +	 */
> +	if (!exec_queue_wedged(q)) {
> +		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg(q, msg, KILL);
> +		xe_sched_msg_unlock(sched);
> +	}
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
> =20
> @@ -2274,10 +2340,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_e=
xec_queue *q,
>  	return true;
>  }
> =20
> -#define STATIC_MSG_CLEANUP	0
> -#define STATIC_MSG_SUSPEND	1
> -#define STATIC_MSG_RESUME	2
> -#define STATIC_MSG_CGP_SYNC	3
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_CLEANUP;
> --=20
> 2.43.0
>=20
>=20
