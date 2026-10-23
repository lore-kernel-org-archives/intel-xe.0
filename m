Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE33606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jwkx37ot
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BABE10E527;
	Fri, 23 Oct 2026 05:11:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0050D10E527;
 Fri, 23 Oct 2026 05:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792732298; x=1824268298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iPjZ7xJmo7Ee0lQA0vnVUqyKXU2b434924C9KQkyjW0=;
 b=Jwkx37otl4OpU71lvl7khZZRr8iu9vxjbz63YPVc9H1NVbUmJBipZaUr
 nrvdgw5J+gykgOmNPx88IVCxgTcE51laWQv5m1bJS1OfGD19OIADgBK48
 /xhgy/k2N1QBZLjq4mDctysG/SlI0NGeK0Mu3Ozs4l8c9c7ZyPG/XStrt
 ve8Ri0qnS+CH9uEo9vR1GehvFpkDiliIN5e/rCHJj8BqHIEV2iYGvKFoN
 ZSwkVIeEdLr5jvx/vcTBDy2nP7dIBLf94TTC7Q3DHuG4eLAfnOG+9w4nj
 ls70cWOXOQLwtE5nVNw5CoTjwRJHyA9G8RS8QocZr15/Pgn/zgrddG/E+ A==;
X-CSE-ConnectionGUID: kXxJffbDQ6Wn8mrTAxmHzQ==
X-CSE-MsgGUID: dPh5ki0oQ1CRjhouSeISaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1502968"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1502968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:11:38 -0700
X-CSE-ConnectionGUID: +UDqzWiUTeeLgB9d0BfyMg==
X-CSE-MsgGUID: ubUep4VVRY2v8Lq/PJDZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926533"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:11:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:11:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:11:37 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:11:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/9E4G52KN2KJ39RxydmD4QoaYKq4GcNKDBuj162tWQ0zmPwrIJOaUtLHw7Q5wJnrqM3dgZqd0bDfZk61zayo2dWip+nyk8vU03T6XjyGowNJ4jPAw8JaHqNaMAHrPaj2mKWnxVmf+8+vjZQnScNNnFmgsuiUsO8t7L7T37KeCxv4aVe0JEvcOLDIaPrv1o9Dk47eduYlxXB5NtMyZIiE5+eFlJKRVHchyRzJpq3+I7oAoDCRL6fJy0jYKfMGjHefxL8wPKvO56iVrDO/Hq14kA4RGhjPYF0RL3s6ZL3ALKQLGA4Xox0lEZ+JzFvDM8g/onGyaAYeOzelF4rM6zGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw3ODgcTtQAVHskCoYcTEbJNMCuWiC/EAY/i7bjYI2Y=;
 b=QUIu+8+7TUHzKF6pijjRXR9X0x4stQzRRH284LYoEqh878jaQKAiEbOa60eSjUgVlENDFRr5aV+0G0/pKFHA7uZRzTc69Z5+ir9TkMt5LUgAv0NPtvCp/u2SjsQJ4vr702SmnW0qKuMBepAyfH07Qn7bv9/pT7JpkjZ7nV0CoTzrnNJJ/8KIhopm7jGvOjLDWtSuPLHvQOon7co2XksnTtp/DS08AAmGxO3AmBBYjimoZTddIZJSi+fzj88QhXZxndVzI4hwlr9a8ccccqUIYKo5IhU0W9EJIHv2z/FfQ3ERBcdePJcXZN+Iy/+qWVfyjVwro9cBYaIGX552F///3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by CH3PR11MB870661.namprd11.prod.outlook.com (2603:10b6:610:367::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 05:11:29 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 05:11:28 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v8 09/14] drm/i915/display: Program Wa_14021768792 for
 linkm/n ratio > 10
Thread-Topic: [PATCH v8 09/14] drm/i915/display: Program Wa_14021768792 for
 linkm/n ratio > 10
Thread-Index: AQHdYqvRdxqDPLCvAkSOrCzdF+6WfrcKlCkg
Date: Fri, 23 Oct 2026 05:11:28 +0000
Message-ID: <BYAPR11MB3783B90D43B270430A68D4ADB2642@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
 <20261023050227.2068466-10-suraj.kandpal@intel.com>
In-Reply-To: <20261023050227.2068466-10-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|CH3PR11MB870661:EE_
x-ms-office365-filtering-correlation-id: d4cbfecc-f19b-4ea8-7fe7-08df30c41836
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|260925021311599003|260925021911599003|260925022911599003|56012099006|4143699003|11063799006|5023799004|261021123027099003|261021121427099003|261009223027099003|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info: dM7chMgBPMHFGWl6C2zWv4wL9nHqdsVDa0o4IgLMH/Wp63WI6WoIuQ4ec0cvZMsiHsIrhDMgSBf/5wtx90FTRpYqPJyQJpL2sNuq4xOvxWE/1F3YSV4m73UrqiLcMOtN/vvN9xqZeZTWqDu5Y/yFNiIAW6Mrpe+WXoR10X6MGeyuDIDirI71z+TPu68Q3Hs2T/6sXfDs2G7eEaGLtaBQDotCV2hTrUO4v6cA+ZT8EEYhqpUdNEE+rL++66L48lgEnCnbaa8qVlMxxDmDBzM4hlaBR4k+gY/3+L9B/C77iVCg0ODYpZQmo260Zqy9qDDzquKCNJQkqKKvmIXmwQVZjpy1kx0/JF3razkfy508j1LKLeaJdniFoOXXgKkGn0Qmi7MzJfIz0p+X9uVxs+4BQHz91oLoGJYS3whRAgBdORNghBO/hQ5x8kzFBmpMbOGLotqm46tmwo0k2USenuir3KCl9FBGZ/r1vQu3D3qzb1jzTkHmx7XtsTDKu4M9LiyNpGMMeVTjXNGr/Adv701YFWTNNv9eMBeJmdlJNyC9Rgqr1k0gaJA0qhhC8J5WlVHq6WVSwiiV9aFect/PJZ3v6THY7qM2UPwjeoHFXo3dOu8bSa06PviGvh5bxWGhkEwmatnCfcxY5kKQtS6qifR00j4YtcKdE8ZET/mbs/LHtdbKX+LpDvth+89M1ATScXzNO/L6l51a9ATQiCZo7VDxFP4mVAwPvQEz2tI7PHI0mfM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(4143699003)(11063799006)(5023799004)(261021123027099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jhyd4eH4L0akYfIh/gz5U/qReAk3UO99sxNIHQw56n9gvjDDit5eTLsS3zyL?=
 =?us-ascii?Q?Hk2D7U7QVAS/jHJet9wmJk14xvUSk1AccrWdoLdulEfk/DQU9hZHtAAXCfhV?=
 =?us-ascii?Q?57M42pWgMTwd6P8aRoRl3oVeSvcqWIt+Cc9VO8asqX05JyKu0OEd1Xx1V9Qg?=
 =?us-ascii?Q?cFTf1cNkJEMN0Y7J7ckVHvRWaHLxVHFDZLDq5uTzmFul+eDU/348VRlhoV6C?=
 =?us-ascii?Q?43W2YeciWxWA1xxmG1bybVcIgvrFmnE0Rf2Wny3IeVGIK3H235KlMMHpxq2r?=
 =?us-ascii?Q?jGjt5FZ8rNewnNkzf5dGf2nhRNdPoEdRTIG8dqp22o/6winrWetzm/3ciirh?=
 =?us-ascii?Q?1Rc6jyN62NNPCnKJYeLFQZpAXCbIX6FmrXy9jjVwqap7YbhmgD0kW4KVjYzl?=
 =?us-ascii?Q?gYP8r57xQIb624jLs2KgKkCClsC+yl9LSYiVDugZfhECgtYE1TQE2Md8H+C5?=
 =?us-ascii?Q?IINcrZBGxt3ap36fO2LP9ExlB/BLNUArpnOcPQjDqy+b8690e7sl3w1J6f0M?=
 =?us-ascii?Q?/uylsspXDCuw1bLotsifHoVXtqdyFdHyihx06hzws5a2G8pXuCzCeSAwlULT?=
 =?us-ascii?Q?aJAB8tUevDaDxCQ1g6GWFg4Yxw2ukeklK+y/YqWMAwnR6v22Np/U71l29lQj?=
 =?us-ascii?Q?WofPCASVh/gjiOz8Ma7AfmN/U7M8Jq11Ino7kPdQWytAeUEOmmmss1Qfz5w/?=
 =?us-ascii?Q?dlp//CFDrQzT4bRIdzUbtvLAmBmBPqwRDdXwASA0RIUFjOs36rfG711MdoAm?=
 =?us-ascii?Q?Xl4kX2+7M6120OFyWtlO28rgsU4IjyBefzXKvtq75ysR3/pVlQtXORyywcwQ?=
 =?us-ascii?Q?7VesAH03Vsq5i2rXNX+z5FzDqNVETAAkUBB2XbzFyuMp0tUAQBnm3gsHAJxb?=
 =?us-ascii?Q?OSVEhC5cEC5oUDpOjIgubmM5uwkXHMr2vY04cvnR99+AEDEqQ+WZVrpkC1pb?=
 =?us-ascii?Q?CVnxQElOMxllHE8gq3iZg8KVd2hADEZ6z9kW/ndvjpPLuP9BgSdf5GEa9K9U?=
 =?us-ascii?Q?TL0q/GFYuRUOAWNqVAWDqDmDuRhmz9O4nPf8jp6WWQVtXb3gXsAZ+M/LnIqP?=
 =?us-ascii?Q?x4uVo1xOe2Am5S2S6E1Hj4er3a6gUiGG4afANd299uEvnxIi32mhxGu/Vpyd?=
 =?us-ascii?Q?hbLV30KxXwVna4EJ2/e5Bk1EcXtIxxLmQ6DiNzti9N+zAeGsCyJX5vGm7k4z?=
 =?us-ascii?Q?1nK9qYXNzMV10urBMlfZXY4BUu3/XHarVq9N/2e9rrIlQSt5TOb6ZuQ2WBBl?=
 =?us-ascii?Q?MXJcX5vD4MR8r2iWuwE38tyzElwoRjqswt21CxcEyIZzJ/d6p7Zz1R8qXNgm?=
 =?us-ascii?Q?piZbQf5UQVr4cirLK0cG4VByG2tV+7OvhsI0gmOE/GlQrtCcNdMsW2mohdAb?=
 =?us-ascii?Q?fXCl+WUJ2F0KqNqmTAp4i94o9S2lnWIquQ7wG9paEp9I5xbu0AWOL3mX78r9?=
 =?us-ascii?Q?WFQl/pch6RVXeheAcMTnG5bIArJjP4L5/u44OpwZzRQSmXcp8RKdXpJE9bcV?=
 =?us-ascii?Q?g3kVpcJqhQx3QeAjk81smhyvIpWCO0NM2ft7yexQ4ZPAVjxeaQ8GKfHH/7jF?=
 =?us-ascii?Q?9+EgdY6yhhJBvOqyeU6fT2cWqKFHtrJLDgLC5CfTOCZLzZhNRSou2WdKwk8y?=
 =?us-ascii?Q?hmSmqNH+dBGsv2+4TdF8gVPHCw/coiyawyrMcB4EZMCLpy5be0Zrsc52dgCe?=
 =?us-ascii?Q?ZHBjHCIV8NniJexY2e83fsvF8Bpc5NBQ3XMagBrdIgp4buUs0aNpq95Y/P1G?=
 =?us-ascii?Q?m+z73SOvg0/kvP8AUGc6o6ozY1NKkTnZ02HxExXsakFnazIGY7c1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bujnPAEEBGUHUDdCafpgbzNVkZnG15esYK8T7mWm7mb6ja4ymfzRS8DDGOvucxFocwp2Lbb8g/0VrjoYTUzKI47KtV3Nkv+9cLMd9fiIhUZoxyx1vCSnaMsp2rJoHFIhlAAMi9U/4zQo5GzAmNjyYJor3JlEU48YkM62uW7wQr3fF4cfg01LkO40Ik/YOb1aaZQB+Ny7Dpx/dAYddTNVEaaiUb5YacLnFhNSheAMnpwbOQfd7nc44leic89vWMPMioAvhy7Gbrnpt3XS9o4RH02mlSutJdiLHKzhiQPC7YQQiy3iFn8e7OHz+xLWCKaJrwgY3ZErbn3jPsSVzFL0+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cbfecc-f19b-4ea8-7fe7-08df30c41836
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:11:28.7583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELOK2sjeSYt15KP3xcZcxlS6pFiQoBwj/4F1xAsF85wT7DUVmXeBnVQR2G6dFyhpuHQt3tSQgTzXVNsipAhQPZaVeiNDYrPAiQxfOdmlMl0bR9Rw/4JEPS6S/Am8GVIB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB870661
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



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 23 October 2026 10:32
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: [PATCH v8 09/14] drm/i915/display: Program Wa_14021768792 for
> linkm/n ratio > 10
>=20
> Add a bypass_m_n_ratio_limit member to struct intel_link_m_n to track
> whether Wa_14021768792 is used to bypass the Link M/N ratio limit, and
> program the workaround when it is set.
> CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N, since
> writing LINK_N arms the double buffered update of the M/N registers, and =
all
> of the programming has to be done before the transcoder is enabled.
> Both are also explicitly cleared when the mechanism is not in use, so tha=
t
> state cannot leak from a previous modeset.
>=20
> Bspec: 49266
> Co-developed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  | 35 ++++++++++++++++++-
>  .../drm/i915/display/intel_display_types.h    |  2 ++
>  2 files changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 461b81bf8341..b48f12cc615f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2715,6 +2715,15 @@ void intel_zero_m_n(struct intel_link_m_n *m_n)
>  	m_n->tu =3D 1;
>  }
>=20
> +static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n) {
> +	if (!m_n->link_n)
> +		return 0;
> +
> +	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
> +		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m, m_n-
> >link_n)); }
> +
>  void intel_set_m_n(struct intel_display *display,
>  		   const struct intel_link_m_n *m_n,
>  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg, @@ -2726,7
> +2735,9 @@ void intel_set_m_n(struct intel_display *display,
>  	intel_de_write(display, data_n_reg, m_n->data_n);
>  	intel_de_write(display, link_m_reg, m_n->link_m);
>=20
> -	if (DISPLAY_VER(display) >=3D 14)
> +	if (DISPLAY_VER(display) >=3D 14 && m_n->bypass_m_n_ratio_limit)
> +		link_n |=3D
> PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
> +	else if (DISPLAY_VER(display) >=3D 14)
>  		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
>  	else
>  		link_n &=3D DATA_LINK_M_N_MASK;
> @@ -2747,6 +2758,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct
> intel_display *display,
>  	return IS_DISPLAY_VER(display, 5, 7) || display->platform.cherryview;
> }
>=20
> +static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
> +				     enum transcoder transcoder,
> +				     const struct intel_link_m_n *m_n) {
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	bool enable =3D m_n->bypass_m_n_ratio_limit && m_n->link_n;
> +	u32 link_m_frac =3D enable ? m_n->link_m % m_n->link_n : 0;
> +
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return;
> +
> +	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
> +		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> link_m_frac));
> +
> +	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
> +		     DP_ENHANCED_TGDDA_ENABLE,
> +		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0); }
> +
>  void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    const struct intel_link_m_n *m_n) @@ -
> 2754,6 +2785,8 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_crtc
> *crtc,
>  	struct intel_display *display =3D to_intel_display(crtc);
>  	enum pipe pipe =3D crtc->pipe;
>=20
> +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> +
>  	if (DISPLAY_VER(display) >=3D 5)
>  		intel_set_m_n(display, m_n,
>  			      PIPE_DATA_M1(display, transcoder), diff --git
> a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 8f9fb2603638..d0748837ce97 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -985,6 +985,8 @@ struct intel_link_m_n {
>  	u32 data_n;
>  	u32 link_m;
>  	u32 link_n;
> +	/* Wa_14021768792 for linkm/n ratio > 10 */
> +	bool bypass_m_n_ratio_limit;

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  };
>=20
>  struct intel_csc_matrix {
> --
> 2.34.1

