Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA50EA8550
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 09:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D4610E69C;
	Tue, 10 Mar 2026 09:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lL1zIMgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D3310E69B;
 Tue, 10 Mar 2026 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773133267; x=1804669267;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=lL1zIMgvC4JwR73Cv16JIBvFD5LgLdlZRRByScO+Zlw2t0OFQgr1vU3K
 2SjACaCn1nCScPJrVwFY4PSr0sNnoy1OHK+03Jco667HVw6bPixpIKtOA
 GL4wqdTkB3vEDVcE+g9+YNt9k4nWwJJBRZZYbDdZ4SdxO159mTpxelf7o
 bqL4JD5crXElA4qgeJtzWDZoQHHvI22N+38HUOd147ss4MyE6dhMbF0Gz
 QaYlBVy1AOZ80lxDmiF79B6PLlaw6nV0a2BZJcjtNjw6mnkMh/8vlCW+n
 daMfWsp09DGp01c7Q/crkKWz1FQAEXjPfOw0Mm32fu1BFODXax0GpKeH+ A==;
X-CSE-ConnectionGUID: QQQheIwHQeSHorYpliKHsw==
X-CSE-MsgGUID: 97Y0bfQbQfaQ1JzQfH3y5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85648985"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85648985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:01:05 -0700
X-CSE-ConnectionGUID: 78SG7O0XQWSJiuaJKVUtPQ==
X-CSE-MsgGUID: fbfCu0T8Qyms282lB46KfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219294205"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:01:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:01:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 02:01:02 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tj/fdxZMk0Hu8CxuhWPRfVRZWon7dLKXgbIkwPpsJFTWSLbl47vPmuUHKW6fH7Aapxohg9aL07pxp9IcUnN/Zp+t952Np82QvefPPtvEg4YvjrxqjF/jjrOuCHCLbbPzv6KaZCRyHPlPjGKbn8OAMHp6gQ6pI2xNONRE/a0HE03k3LB7v4gqkUqNGCodpJwglYY8903czWX7YUDMBzTRvanGdQ8f5JcRB6AVEfjVFBCrp7LDPadFJ1lDuppFHxIIW6f4XziyNkIl1ecy3AD6wXCDmvSoGDv8YHFbS85v+WiEB0MdWQMVlTtL4VDch/JgZVCbTSAaO3JWHDziIKAXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=sW2GdnjmiMfP22tI/K9kyt4CZU5xPzPAZzVwdDBxisxJOIFKSrrQBQc5nl93J8WoyIhDrDTE19WRyKglIAcc1XtPnh4gOqS0LkWQvhgBm4A0JlOIUWPwLQcV+J0hpJF/YPOL6cbFZCzY16wAVwxvTZ8Bu1TNul3AIwbL46gbx+CJxkMXw37t+2xyeME5y52k7l4o8Yb32aSBo9OFqNrZtmK0SsOrw3n917O0dBWDa1EHv3Xniz7hHYzJiqCcvMyrefRVd3xykufLmFEQHLNSvmV4lONJncixWi2oIVECDUoVVU1pxETUqdFU2hQKjnpBVurwuPv3PHCIg9lgTKGhMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.9; Tue, 10 Mar 2026 09:00:58 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 09:00:57 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Briano,
 Ivan" <ivan.briano@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v36 4/4] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v36 4/4] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHcrYHBrOY7SSPxkEq2nlwSvobDfbWnfb1Q
Date: Tue, 10 Mar 2026 09:00:57 +0000
Message-ID: <DS7PR11MB627168F214425C848935B2A0E746A@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20260306155556.67500-6-jonathan.cavitt@intel.com>
 <20260306155556.67500-10-jonathan.cavitt@intel.com>
In-Reply-To: <20260306155556.67500-10-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|PH0PR11MB4808:EE_
x-ms-office365-filtering-correlation-id: a4ab99d7-16dc-4888-d566-08de7e838b63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: KFunjmKwp6GkUbxqbswyVLPx4ZJaJOx4x6KdtyaONxCgTSVFEmSbDOuZjz61J9lRSAv8ywZOSRP0JNspPPexpYtDQPa79whYpt/SS/vnPpyDGHcsgOUJDwV0YwX+gvo9bg6qvCqYESfzPS173GaHZGOv/xUboEmTzrvKYVMtXpxJFyObBIEkyAD31Amr25t+fPGS1QWzQpTnpYXM1ln/4iafuvxztq2QOuFZt4PlaaIL2And5Eix4WIAy/BSWzJHuTnKiIPRACQ8xWbzOKWktZGDnmgcKxizJI3F6UB9s8lTLtbasvdrZVVEh2H/wkHO/09Gg2X/keLXMG8+Dsv7Po85rykHbzMDpYTu5jTFjM71XqRkaiiOfp/XSuHJjyRv+UhISIzbnRkg76pzzpuzmE7dJMDf1sVjzE0TciInqwJrp0EQwQ0wajjm1he6xs4v9gOxjJZiUWqm4sQbPNL7rt81L0371T29IeRLrnydw0BYEBAt1wJLt3OL9aGducKElD3CizeB3V24TZ/ps1CsWR70637e+W7sHrV4G85AKWQzkBK7IuHF1YlY0m4oDxTdFiB29Llq1oiMFrwnXcBDHYTqxZONviI7q2Uu1kQqphbZxh8dmf4uoZS8OCAALj4DdztBd8SN51Thr+7JL1Gvm3E1srA3k8S2psi1DeUnUsSKle+QZPRDAS0RBJNgP0hU7VWJhJfrwovFE7NJpuyYzh9utshH5h325gW8A20OiaqcLenpVFdxX4eFAF1Rd+zgQk6bPHz0c+O1gh6aAFmCB3Bj3AYQjrLv+8wHfTFiX/M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eCCdUB1XDrwjM9JUuZKd0CE6fiyyetUIti8mfJUtAUiXgcG2t9f28zKoTo3m?=
 =?us-ascii?Q?S906eoeqB80NQOBT9zhyMFkxGLNIgSF+hrXlUDhbACV1pjJzoZvzolOthMpJ?=
 =?us-ascii?Q?z/UWCP295YFo5LRoyOQNjFZ2MgJ79kjzyoWotsXgZB4jaFE2RpLTyrlC3Qsz?=
 =?us-ascii?Q?x5vOXy4rlu8WvfZo467d9twfgyuJl3vp5F/Yp6G7ewUU+Rp4QGuuJ/Fqo3iw?=
 =?us-ascii?Q?1vzORo1nnmcwluMUpvNe6BdWnxXyCppYmRnDMBGyQ9IG8C2dnTKPArCghIOg?=
 =?us-ascii?Q?OVtrAgfW608mHJ8nth/IcQI5w8HY+KN2FHtcJvSIHlqLiLEho1+bfHw556so?=
 =?us-ascii?Q?+734/rIApt+Uq2P58c/e0u2H3TtMBbwEoJXgp4ezSEmELmSD14NEwWjuwx+H?=
 =?us-ascii?Q?GIZ4rYSi8151OqRXLZ7Y+w0jdI3a65B0DUpvd+9boSdmtVk4U98abpJgNSi8?=
 =?us-ascii?Q?eWGSBLh3DKACsl5Wll98qNUvtKImq8/1FG8MZBQumSHk8Neq3W0oqIQ0zKZr?=
 =?us-ascii?Q?llsddtkCJVDHi4W0vqMZonSy5PaNoIuQWDcoP5SNcTZh6h9lejLNPU6SmQV9?=
 =?us-ascii?Q?O2lpy34bW30JoWvjACMm/Jn8BY5CQIGkReNJlP9ytJEnOva6OmPQKGWE617W?=
 =?us-ascii?Q?7mnpLN9J6NY33p53VMseVchHTjfCavgioiaGrAp8UZppwr7n/JmgXODFEJ9g?=
 =?us-ascii?Q?ssSUhf8BI8PmVtDKvortfOTjotwUu1IU4o8O8d2OsX9wZOJ13Lm/MkHp1rQO?=
 =?us-ascii?Q?NFo3jyl6SaBWC6EJaMMCat8pqJvoS1N0/h/Al5Q3R4W0yYvuQ7UQmqwlevw1?=
 =?us-ascii?Q?GGHU7YgMeFnbz2UsJnOAVNqFEHyJZJ5JiJklQQ/fQ1OtgbtqyIwhnej1CJgO?=
 =?us-ascii?Q?8tQzMvYv9J1pNJgUiF/vMOlGBRGCYLte3kEEJqTLaRKt/SbGMkqvpym15gdB?=
 =?us-ascii?Q?SA2yp8BP6ajAfPesAe922bzTrZk6AHyUY6DdyUx2a8QuOsJZYt9rGNLAFLhE?=
 =?us-ascii?Q?e/tzbTweLTUJb5C0NA1ajnqRjJ27O5kSls12+U5+KpuwSPrfreZucJZk8tTN?=
 =?us-ascii?Q?OdzW+VKZ79+htbRMCC3FzWW9DkswsyKe6CEyDERQ2n9kn4bI8vYcCrB0e+yl?=
 =?us-ascii?Q?tbkGBaSuiESRnxApJMGTP1hRXFmo+qYCMaJAZmXSfya6ITrP97joLcOswd2M?=
 =?us-ascii?Q?wauJv340xVhAr92yKf/AHGKbAyaOoB30j9/8+2UAQjsuJ283/RL1nn7RF69O?=
 =?us-ascii?Q?ZCCZ6znYMcm5/2VqFqKnwdtp1a2NUeRvhcqL4yJRO3oFLb5eU7Qcz0qyy26w?=
 =?us-ascii?Q?yHWmYxAACY0C9snUIauj46uiJQuTcgQ9aF64gRLwhXllcuBteXY/YJuJTrw/?=
 =?us-ascii?Q?zsSeNjEDB18FFhMzotKjEvr/BYcD0thlQauJAhC+Lhw9Pt0kaLuZemMmtZmd?=
 =?us-ascii?Q?McSd5VQ8sSENFEdcaSvTjaecE5bv/8JC6xJ30sfg0amFbju2Ebw+GUAElgEb?=
 =?us-ascii?Q?4LyfmoKaURrhHvE0bMMUhaFjZbkDcuwgRIx6rgiyk7AItDRQv3M4tg7AqkRy?=
 =?us-ascii?Q?s2P4qV09bJQbC4OogZWorqcd8uPNItEmifSlIjC+milAM/R2Lult8POPD6WA?=
 =?us-ascii?Q?pKYMeFSqULJ08KQqBGgz5uZYkdDBnKL3ioY0afrrwX8qJEK32oYrzsHf45Sx?=
 =?us-ascii?Q?rvihmYmcUVj7UAxFJUN7xFDVlSO87yS9JP2czQ4eqAdGKSh3WrFnEgkJdgsr?=
 =?us-ascii?Q?6z7xANw4hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ct5p5alsxz+fx5X581G/mLTc45LSjHnacgGmvkaldt8ExNu4b5q0cWENe8qh8z8o7rNwdyenZvpDcGX6Pwn560lwO+cVfbbRppqs48k7RXb45MK5Gc9EQO+dBTGoXKaOw5rldcFKXvL0Xw9PVw8d6PlLuwB7RKAt2h2N8BfIMJHhCgGVBrB/m2jezS+eLfQfWVv5WD9tWCqACPRPeZobZJZH19OWpwKhnIk/c+s3V6vk60IDxII2cIOioE3BgSxjkbkh+9Z9iV3oK6GeglI8NFL8/THoDjm/QFcNQBAGU7AKKzJxoWj8lN+RtXH5oLHsus//BpqzerzEvXiPAANURw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ab99d7-16dc-4888-d566-08de7e838b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 09:00:57.7388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzKBIFdWNMmrVjsF/wnMqFq+CmZqVrUT+Ov2lXgqj10iJqMDP7b30DTbXZS3/HViYzT12D0R8h/SutFRMf3XmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
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

Acked-by: Michal Mrozek <michal.mrozek@intel.com>
