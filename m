Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47F5CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 11:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A2910E987;
	Thu, 28 Aug 2025 11:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFwuswV3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A0510E987
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 11:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756382114; x=1787918114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bgoR851JeTAB3oFtqNg0rDgeMtZaQz/Xt2TpogrGcXc=;
 b=aFwuswV3ebGTYUc8G5ia/HuyMj+cRc7GCL36vwkqEBRF8A+NLMhg9Zcb
 H7pF+AsD6mxrQ5Chjdel1wb563auJAjE8YIxZvW/XPHOXvyVu6tNQ9Hz2
 MKeiAQuzQWYYo19v4i5Zq8sWQVaW4E2QCosETbvWW3ku1S81MlA5pk2or
 OXL7pHW2CEuqzqEbqrOSaYlLSnAZtLFam8irWEk8uYt30/XTVW74P953i
 6W39sd3r+2JipmeGCK9sX3LPNVqS6vEjiajrRMlPPYXrH7f7hpqIEiPlQ
 i4vNJWxj/ukCaSVmK08O6ZeteGb/2GmAueQxZY9Z0v385dnjRxfuPnWNr Q==;
X-CSE-ConnectionGUID: oV3pFhV5T36H+LqS2Lv2Nw==
X-CSE-MsgGUID: MMq3ln9TRvqHoQnOutCBLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58748944"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58748944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 04:55:14 -0700
X-CSE-ConnectionGUID: KbxJb7rxSw2zHTg7onqulQ==
X-CSE-MsgGUID: IRi1ZOjuRxajgDsS4nl24g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175373002"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 04:55:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 04:55:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 04:55:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.85)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 04:55:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fr68SjX248gpSWJIBwan+S6aMDm9Z5ZlgZeRVsJra5/eguRYZ7jZA/3dTDWMaiqqXAcJqpK4ycdnXA2YPXzjWK4YaoukhEDVwrwtchvXYXhYaDflY5CAtUcbMjh3Fu7HJKQa4OYt5spKSXdnnj2etftLFw2DcJLT+VqUcFFdjOzinsxNGQhk+7/HbMKpNeTPoAV6jdbSELYKoxmaIZr0XRa7RtjZANbHGcInY73+HQyd3WD3dzJBqPUs8M9OS5jPhg+N70E/MGWCjLGutQiD0wjzDEO9chyMzVszgLwI86kMK+ESNDTP/sWutCuOwOutbTt3J+2bY75lf00/4zY2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC5cJs5XjS32zlWD2bC8bwKopVQzAI/kwOaaH3gvcIg=;
 b=wKOJkh1RkpHbEWYwYMeGhpgWtw8R7sbo7obBasgl0Wu+LISE3/G3PqKehnK1wGXyC8ILCVmJyVlSUql8m/x5NmPqOIhlv/iU5tHwjiS++gwtiZDgsngd2h5JHY4rXqeIKHdrKhvIb4JLZZ9Ioz6+6Vj7AiJhaMcFcJlIyFIp8ZJV/wnHWUl7nzVYszp6fTTUxfXadxRMhAsOCx5tYa8H6Z+HFm6RNZr47dIQ8pSmhks76G8lah9uxa5/45kY29qaA1r1eZrKXvXk/AjNG3t71qIo36mTxc8/bQ7LDwuKn9j0H1v3HBmGY3cHQfV+fknoAwNPjYhvvfDMyWprxDZk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by LV1PR11MB8852.namprd11.prod.outlook.com (2603:10b6:408:2b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 28 Aug
 2025 11:55:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.9052.014; Thu, 28 Aug 2025
 11:55:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: RE: [PATCH 2/2] drm/xe/vm: Fix error handling in
 xe_vm_query_vmas_attrs_ioctl()
Thread-Topic: [PATCH 2/2] drm/xe/vm: Fix error handling in
 xe_vm_query_vmas_attrs_ioctl()
Thread-Index: AQHcGAWtEEnc+cm48UCi6wszkzzRv7R39QRw
Date: Thu, 28 Aug 2025 11:55:03 +0000
Message-ID: <SJ1PR11MB6204B01857915CEB7F0DD1C4813BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250828104933.3839825-1-himal.prasad.ghimiray@intel.com>
 <20250828104933.3839825-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250828104933.3839825-3-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|LV1PR11MB8852:EE_
x-ms-office365-filtering-correlation-id: e2c61ef0-4fa0-4cc9-9eca-08dde629b958
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lC2mJOaLpt+lEuFo6mBUv9RZsXH+72f7BJPtdAllzSz5cQ/BFnMeMEot+x/m?=
 =?us-ascii?Q?fe8Y875K6Ybhso0UFZ9Rgp6t2tCoDuwzXDc3WINMK3Ii2hx8Iuvvbx872sKK?=
 =?us-ascii?Q?MddekDzMseYJ3rjUtVCBgfe1MZu3eC7zldV5oHdRDrr0NT8R7EfH1FJnnQnT?=
 =?us-ascii?Q?OdL2bZrIzengKi1IrufKfsClz5vtvQ4K4GhB2oLHjmPb0CcUGVfM57Nxf5h9?=
 =?us-ascii?Q?R9YzF9L2Z6rN9maU8kBwq70f9uJto+UJrEcBIwwID2lP1S78x6UEipvcQn3U?=
 =?us-ascii?Q?+DsYiXXjo7Uzv9uX2iRwZQYKBmFBAN4ZDwFWLrcYlDbOnulxCw9F/V3s0u+5?=
 =?us-ascii?Q?i5mCiUL/QwdYJVKAnsBQQAE/CNxRgDl8fBEtEi7sD2NVwYWZ6LRpz02PEseu?=
 =?us-ascii?Q?7VMsNAEgvkV2RyD5s4WvhOq6vdgJT97Lsuk+eopmOEYuAV62T0OzFf4qdDaa?=
 =?us-ascii?Q?w+T8HeaqbONgUNhhIBAZJzjaSUVr1zT9EiJME41CckWVIaX4VAmlKVzDInaW?=
 =?us-ascii?Q?jTCEfW+CB/uSfly5058/5HwmUnfGEb5Zqm5BG4oaDD9guQrrav1tWRhuOov6?=
 =?us-ascii?Q?q9efmOY0qYVnm7DjZCAtT0/YlKocGkAhvtnXiu+Gmim1fKQBp/obAjYFFSOu?=
 =?us-ascii?Q?0/BUNT956qTIeTda3IGQaV6bWZ9ZW5tIiA92mBLELcRQdkkbpqcBqVZ9Imo9?=
 =?us-ascii?Q?onZFl/3+rMno3OJ97c8UbJRGNEJeGHH9rTuPC1cyIUfky6dedW46BVbtcofK?=
 =?us-ascii?Q?3NuMgDUmne+FkJ12USV2ac9HjBLoS3b7xinXC1oxfpDB0l9pAqzDskMWCKDj?=
 =?us-ascii?Q?lJsc7NWrVhXhrTskh4ec4PvFMgL+hhvciXMmsYJSZnZ9yvdKJbsJIjEbdSH/?=
 =?us-ascii?Q?QYn9zjONroTWWuV+F+HTyKiTJZqPP6Az9lOxCyf8JNSdfaL89+L7cDIMInro?=
 =?us-ascii?Q?9JspPAcenm+oAHEaUI8ydmCxDMVPlTZvEujY1VoR6f9mBz8f5UTkAYmwhjMB?=
 =?us-ascii?Q?7u/R/QCq9pC4PZ2RT/aLVFdp6PUY61NzJVI2fGWAR7xHw1Iroto4zcaVVstm?=
 =?us-ascii?Q?z9zxKwonwvt/EtRV61Ezh8L7UBxFitWZYPr3j0NMZtJF6m4pPH14Du/kQ+Zs?=
 =?us-ascii?Q?L6FV1TvnLLMYrgzFQgRfLpapNp1Tnw/y/bqDRfoesNowOWh2PAT1TUAofYNG?=
 =?us-ascii?Q?wXOJGM/uJa4licz9C4c3OmLeEIOiyG4bvxo/adQHhT2geYA/pVYCUMUgYIcn?=
 =?us-ascii?Q?7Fw+9lho5n49gUk/updE38zRqKypo+rrWdk8ZWOpJMpOw32Yu2q37C6lYEdv?=
 =?us-ascii?Q?/g4wMgdIxWNjH686Tx6MU/R7BqteiDOSocgTFmw7/l5ZyRQH6a4PMAE7Mnc7?=
 =?us-ascii?Q?iNAesjxjNbUMcGOUl6DGIxQA8ptKxJ3LqYa4JrH9w4Ru5k8awvhAcg2oicjc?=
 =?us-ascii?Q?P7/2Zo1dRKqgLzhiMU5QyG+2fLChXyPkcfcasEK5uZxUN7rpvbfDMA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rotnoSnX3f+e3C2/fCyOQQNzgx++qHlyfUNDJeQ2jwitF+H8EpavqfT9RyB/?=
 =?us-ascii?Q?+7KcatAhecGuTR2kghfd/Rn/IGpBseaKeM5Qz55NCtiY07ek+VZLWNyKmhEH?=
 =?us-ascii?Q?wju8eAmmJ8jSHsjpawmXtV53QMMpbMEndwNjNORPftgQWQSNCnvfHjjwWp71?=
 =?us-ascii?Q?lDPCViaawDk0Hi2jN5dus9pegNI0tAn5qMMftXe+/hFaloSaaM67Y8xH+LRS?=
 =?us-ascii?Q?BqMqdRTONbptlSTI/fTuT57YZ4N1B5aGVGWTXK89zEoSj3ROS4wScYRgICDT?=
 =?us-ascii?Q?VIThKPJysbkHS9ul/9lruKpWZuCc+8mTZv4J6koMqxabIVLL4a1C51mDDklB?=
 =?us-ascii?Q?KIgCYH4YbLvMTUxRTzBLe5giL4HfjdyccO1HbGKuaUIzOE8IUSExAvi5sC6B?=
 =?us-ascii?Q?g6jGaimBrwimcb7FFePGV80OVfTShjBr8+3DTzuUYC+Xk1jYSB4Mj9aJCiQF?=
 =?us-ascii?Q?BMw1KJs4Spr6vcZCKkOKHLCW15cTIpodnVrv9yyTX2jsAhykripKN7dyu0VL?=
 =?us-ascii?Q?MyzczGx6UHz8qp+QbTUEAAK+ZJAGFWgb/aNdOPNU6SIqNpABf01X2Y4gn0bC?=
 =?us-ascii?Q?OPzUuCPHJK5GK8dOUf3zMH1R1JU7ILuPsa0Wr+kEeazKpyaKlmV8baejchkn?=
 =?us-ascii?Q?Q0qWTs3P79xCBN2SjqH6N0lXIMfYQc7of6OrAMs8Esc6xiv093vRqAOT3KLF?=
 =?us-ascii?Q?tTfHeLQdtRsj7t4VxZZgy7Q+cpJFLS5yWuGdHkohqIFYgBiwLkg5FFu5OZBV?=
 =?us-ascii?Q?KfVRe+cw+LwmpmwG/ufaqwFz2iCLv9QABZgfATU9sjzn3ibbdQO6Z4m/TwmU?=
 =?us-ascii?Q?b0U4c8PpU6VJhPYi1NDNJ92N8RtcSB78GbvV0PPgsm/Do/mlQNHedu11f1Dr?=
 =?us-ascii?Q?r4dGD7B/oMSoWkq2QQACSm5fM4U9cqcHazvcTBbbjLJXRNWIyW1J7l8KsAqG?=
 =?us-ascii?Q?BYIovaQ+HodJ05byLHQJZgvYMlh/nmm9C1hKUMRlEhTL+p3W0BZ5t6XNhMo4?=
 =?us-ascii?Q?01SJIath5aXiHw3fQwYml8rBvYX562H8F6vZDUY8ErxBs11/k6bzrw2JxqIf?=
 =?us-ascii?Q?GXj3mlPevclCwdLQbclPN++2IiNCh1NbzwHXvot3E3BiqFxzwptldHZXBfoe?=
 =?us-ascii?Q?/ZN/AQHw83RjxXpipnClrxLUlYjyaVY4ctuQpjI5FBNl/JAP3eaF1yMvUPBK?=
 =?us-ascii?Q?7qsTKKl5eraVJ3yJzcHoasM+cEc04hN+FCBL94o8ObDzosWyj2lFVFWyqhi1?=
 =?us-ascii?Q?uuW4TogFpMnD+EvBZa9uQkBx26m4fmQsyc5ZkBXQZrca/sAhATWkGw9VmCat?=
 =?us-ascii?Q?XwccqP44hFenSOuoGYEYPbTIJVhEvc7NVctDuusG167TTRwPhBmDtON+guy0?=
 =?us-ascii?Q?ZQtKjB4VKvWjJuj0zTlGZTA2FTmh/M/jeZ28kkasMkm61mcZv1aip1jOX2L5?=
 =?us-ascii?Q?O9r4zVx0AfdhvWCdGXLQTm7OxJzQp9VK3BrCESwag7lNNL2OHkbF259bbkO5?=
 =?us-ascii?Q?ZMgO7DGSFdGGDU4LPC957OpbsXC20WN4+k7QgyHxdgulAGUS6Rj+A6IMEdHi?=
 =?us-ascii?Q?Mh5wtnZ+7BRdS3f5tOyVpsX6I8dS3koUZdMbpmSYqVoBNGQ5KT/WH1PgMeH+?=
 =?us-ascii?Q?/TUVoI72gVAA40sqDQtNoM3lpDXm9jEvTNyGQV75RIfd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c61ef0-4fa0-4cc9-9eca-08dde629b958
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 11:55:03.3816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKlN1NDMC+s/sBm2+Bomgd9D2v6n5MGY+Fef0rc2p0QiqsH/9Jiu+lpR+e5Nn1HOM3KeAlUm0l0AIpxQIQNLtwNxRU9gCIpz7gRCIpT9Q9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8852
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Hima=
l
> Prasad Ghimiray
> Sent: 28 August 2025 16:20
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Dan Carpenter
> <dan.carpenter@linaro.org>
> Subject: [PATCH 2/2] drm/xe/vm: Fix error handling in
> xe_vm_query_vmas_attrs_ioctl()
>=20
> copy_to_user() returns the number of bytes not copied on failure, not a
> negative error code. Update the logic to return -EFAULT instead of the nu=
mber
> of bytes to correctly signal the error.
>=20
> Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and
> memory attributes")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> e913efa2057b..5a9dde9dd722 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2288,6 +2288,8 @@ int xe_vm_query_vmas_attrs_ioctl(struct
> drm_device *dev, void *data, struct drm_
>=20
>  	err =3D copy_to_user(attrs_user, mem_attrs,
>  			   args->sizeof_mem_range_attr * args-
> >num_mem_ranges);
> +	if (err)
> +		err =3D -EFAULT;

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  free_mem_attrs:
>  	kvfree(mem_attrs);
> --
> 2.34.1

