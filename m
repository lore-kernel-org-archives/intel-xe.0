Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02558E6FE49
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 07:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E0610E2FE;
	Mon,  9 Sep 2024 07:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJEA4iMy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96ECC10E2FE
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725867727; x=1757403727;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CwLOceXmn8hrkMHNRJVcZTTqL3aJbwK2DU7gJsAaDhY=;
 b=ZJEA4iMy7bLMEuDLL5OxvQYOiyqMEsdEKCKmbW/SD72WCMLl/nUT8y3I
 lfRoSF9p/+hKwHcE2kvc1Ws37qrIiE9MOd2iAdwai0h+55whbJ+nPqWE3
 Uy0kBOERcyRPvtpAinMABylkcfaoO4Xu6dSOEyOgjrT0JSg4uapn/qhJa
 t6CToJo9Pn45jWKp/dGgW29J4Nxo0ahtjNytgKncQUeN6ZXU5yeE5qThf
 ezpt4RLuujKYQCKbJGWnJJccNJPZ8kS1AjreWA8W/diJwfylChqac676Z
 G409doHOH/rOi/5XfHZVtVrIXvWuD1oCqfs1GE2jzBzHVHNlfQy3n2gtF A==;
X-CSE-ConnectionGUID: OZ4Hs/7jT9yz7aSkFyB3FA==
X-CSE-MsgGUID: aqwOZWTITZGun4+4Uxci1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24702533"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24702533"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:42:06 -0700
X-CSE-ConnectionGUID: 23vatCndSWeQ13gsfdU6Tw==
X-CSE-MsgGUID: YqZqjr8jSaKDnsSUjPGT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="66628661"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 00:42:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 00:42:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 00:42:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 00:42:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luMaBq86huB61Cv1w/4w9X5N2YDZy7cEqd0fym+UnTGIEUYFv43g2mK5GpUJJwyT5qW+bWLZTk3RmyHJvxpmzpWe06TIqjIXB5IomAsW9d3DgmtKPFTJJ59ZaGLHhb4l//KBbofKRZKs95oeUTHx3FSUaUTnzChYbLxlS9AqXMlMcrpMi2SeIRhWPxOth8mBT0HU/08LNai5IgbxzOJYnGiN2KtTpQAWHryvaluabRLRCDC1I+Sx+lkfZoHrilzKn4RNMRg8xQNyox+5NC0thy94ExmcEeRb6/mZRB2B0WB/k2yKeuqU/sF8x1XCXRs2xJAoHVIxRlUj3kOkilP4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLzIX1LuK4H6n9zxTcXbXcRYlS+xLFm0SB0Gm8/nv6U=;
 b=HCx4/RB4ndki0ZFZWOa3A8mIKTHn7NsFkjRL3YONlGQwdp/OIuD6xs5TBZaXSrvYLdGwVOO4I7GJcRWu5h9X6NUu0KTEc+qeohsxYqBLzklsaNmsUpiZNlp5FqOOreg5MTE2zu+HBGC0IO61rT6nSM1MNB8mBXgBP7BNHSpEPv6diavwNj8HNojlspr8OBMwxQKA5NMVf8DzCsOqoh5mUwDNbg7994AyP1dpluhDsi8N0nDDWBF11e1b7bvHzBZutRahAhgRbHCG+COplUzLYXV/dm9IfjZ9LMYRreGoKY3JmacS3FhzYczCvDCU2XES8NfxXgeqqM+yxkkXHkGpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24)
 by IA1PR11MB6145.namprd11.prod.outlook.com (2603:10b6:208:3ef::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 07:42:01 +0000
Received: from PH0PR11MB5609.namprd11.prod.outlook.com
 ([fe80::410e:7a23:21ce:673]) by PH0PR11MB5609.namprd11.prod.outlook.com
 ([fe80::410e:7a23:21ce:673%6]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 07:42:01 +0000
From: "Ranjan, Joshua Santhosh" <joshua.santosh.ranjan@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar,
 Shubham" <shubham.kumar@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Ausmus, James"
 <james.ausmus@intel.com>, "Degrood, Felix J" <felix.j.degrood@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>, "Cabral, Matias A"
 <matias.a.cabral@intel.com>
Subject: RE: [PATCH v3 0/1] Add support for EU stall sampling
Thread-Topic: [PATCH v3 0/1] Add support for EU stall sampling
Thread-Index: AQHbAoseX7U1NgEPK0Ox9MpKqHnrErJPElLA
Date: Mon, 9 Sep 2024 07:42:01 +0000
Message-ID: <PH0PR11MB560982D9948D9FF2DCE229CDA1992@PH0PR11MB5609.namprd11.prod.outlook.com>
References: <cover.1725866097.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1725866097.git.harish.chegondi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: shubham.kumar@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5609:EE_|IA1PR11MB6145:EE_
x-ms-office365-filtering-correlation-id: c46c8a65-2762-4da4-ad99-08dcd0a2e492
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6/GKRqgWcxXukGifld5L+7yqrdZUWF49SfDL6rd97tn1dhYGy47AZ4uTuqy4?=
 =?us-ascii?Q?QiCfok9sEtlHuU/W9ERHz58xe2EQF+Pjha3yamSOq4kZ4if6Ls82j98WhVvk?=
 =?us-ascii?Q?agNfmfM98m1hYkpnhgxdC3w7M1QGQ+bb/QuyOCd0FKhPAhF1SnYoUF+OUH/e?=
 =?us-ascii?Q?zBZ7sh/t1yJSgttUKzzu8jyvDbt+Uv5vUMkBjYuK3zeY4w9sPDu0sj4LzVbv?=
 =?us-ascii?Q?B79ryf/vDY2csxiIXKFBIGnS3stxG2AVUrii9p82TA0y3fbbOCNiJayMRSOH?=
 =?us-ascii?Q?R7C9KGmrLwT/ynayLPFQg2bcq1ITTK0wuMeQH4VxWF2jfhmSujoNIYlg1UiR?=
 =?us-ascii?Q?exNiB2d+IjroVac9bjlfHQnz0V65ADcVXRRLiWryjfHqpIezeqG7FS+lamM7?=
 =?us-ascii?Q?d/N2l6I4UfqFkwf0rKyHMDudvgK6R3xav6j3ECb6Gd61OktUTC71Wr8bZIaG?=
 =?us-ascii?Q?XCIeGxDYMzLup7iBZ76ARoNOXRHYTTExfT/xxgOKh3ex4RZQ+CJ9h8qzCIaX?=
 =?us-ascii?Q?lDMB+sLiQ0LZ9ZToUIn4yKo4aE7Lac/ELwn6D+XcxTwxrHdRYrU8kj2OKJch?=
 =?us-ascii?Q?vS6iOWYNtbJ3M+CquBbmynh25W0E4bniMJBTJgk8NfKW0AolXiHA0YU1/4u/?=
 =?us-ascii?Q?Rt2VbFDDWufEcg9WIlxa/7zQslTyf/hnBS60wU3IBKk7JnJUa6XYZ/hI//5N?=
 =?us-ascii?Q?eq7dXZyMwIrYdSTYy6KjXAKsCx9HA0tb2xLNtzUmUuUoDS4/n9BBr6+sNDh/?=
 =?us-ascii?Q?DuT5f5ZI2e/it5bFlqX/BaZU2cAXZpzqQVWBHbg+ALQ/f0vrpCagXb/tNxcX?=
 =?us-ascii?Q?GgmEdcV/ZaYzH3rZlQ3CInMiLW6dhh8w840CIt0iBfGm0PjxkwAKV4PPee7l?=
 =?us-ascii?Q?iFbgTGC+9hE7lwBMYWZyUezwWLQMB8jkyc66YK7/crVOWodnsDF227H0dy/1?=
 =?us-ascii?Q?TJihdxPFsPVbp5X3+GhzZP3kGcYgdYTvf6mVFpOCsjrGaQBFk9byvAbnikj5?=
 =?us-ascii?Q?B3asE+R4nQlNQ7NYL611VYpAQWtKr7n0QcK/ZfA4eM7nWlm0w6ScTmGvHByL?=
 =?us-ascii?Q?hv8SZh2MPjFA4L9XQ62oDRus0DGuzLurQjL7hITPqzYZ/gMvpMxz7Em63Geb?=
 =?us-ascii?Q?xHuOuCICQoIWnscoxEL0mqbB7+SGolgxT8nI3/VPba4bMcuDvts9hHbR69On?=
 =?us-ascii?Q?QGqfbRb1/db6lu+rw4NVijxJgwopRDhHsStUuM/4YnFGgMIeilIiO7SkinnU?=
 =?us-ascii?Q?th1OpEaXnQnZSMnM9mV4VYQABYaO03nSrHAaf7PnlEnZ81qSETFTTUsbHWMI?=
 =?us-ascii?Q?24mTD0C73cXXjvnzbBFNH4j1YeQUZAhEliMzsxDREtAsjwVYnkfAIlvJd4L8?=
 =?us-ascii?Q?PH5Um5M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?24sWA+q+1b9C/6ohy8t+wJsYQPpeEJjhEvNMjlqPRYM68toac7d3sqRS0hly?=
 =?us-ascii?Q?5PEr9AUkLb0OqLlChwSXRe1Eoq2u9gvGtSVSsvEL5TlZPnn5xnlkBd3q0cGy?=
 =?us-ascii?Q?vxDRZMjp0LDkSB2C4am1ZWF6Ptb8Kjgy6Dlj2Ia0yXNwbYPOqLBYKB06mZkO?=
 =?us-ascii?Q?fDnVwc3TF1OH7cGp8OI8IN8HSp6GpJ710VTVS6xlkWkAr1gJPOCnM5gvkcCr?=
 =?us-ascii?Q?45ZfWrhrMIOFkWSb/DXp7VZAWX41gg8CtocbzkInDKlrIdGJv4xJ4acMFbTS?=
 =?us-ascii?Q?D/NJzrCAV4WBrGf+SHZ5WWv6nGQUikR2mkXgiIANanqyCQYc7+vz8mDf6OPt?=
 =?us-ascii?Q?isA6UX5kESLOvW4SclaMtz07KCw3ONfhmUcKNLTkJDWGAFkmZGyI7gRn4KPg?=
 =?us-ascii?Q?bqYTZ30v3Cz8k83nPKMfHPsONzhvUBzNIC/pnULMnOxdlR8M6gsblRFkZUKE?=
 =?us-ascii?Q?9Uz4jW2WggRieAdNTJNktQ/ltmHE58VVqhSRSFdkbxX9ImBRa/2NN7EXOAK0?=
 =?us-ascii?Q?qG7SvtviMhGMYTx0Slg9y7VorYn8c63pMzpDFpzJvOhEZWr5k/QmigOTOSMK?=
 =?us-ascii?Q?2A/H7VzzmhJMRj6PMKRd/EKs7RcLCvrHiYgD6I2FaXQCcd6DGeRaEKT3o3mM?=
 =?us-ascii?Q?v7rrj3/62xMvd8XKDklRsZ4/3imr2lKnT6lucDbLGxh9kpXlMIbDDBRFTs3L?=
 =?us-ascii?Q?OtVoxCjAF40L/rnHA5FkXWxi7LSefLyhCIHExLyjM26faLyBK843TGtCZFIJ?=
 =?us-ascii?Q?+qlD1fRWXPW9mZaxsQWr23O9ajIINGueD5cZfstBNIe/r9ZWul+DGOJFI7Qp?=
 =?us-ascii?Q?ennHGT8bkVqUUxOxAJfKqTGxRmE9a+x+ufGZyiFVQkTACmhxb6JWVZAlt4tm?=
 =?us-ascii?Q?YC8dgNUq49CBMBuB2XgIQPobQ2wDgYuf3swufGwvOTTr0qaw9k4STPzWi38f?=
 =?us-ascii?Q?6S05dJRQv9Ko+v+74B4P+k6dWGKEEKFXVoBS83vJ2ZVhHUOSUaWeyjitP80Z?=
 =?us-ascii?Q?hC/Uz1/DWuKo79+1eObAiL5VJOMs1K/j/AevTpOhd0HtKhPl99RjguMkxEvP?=
 =?us-ascii?Q?VM93DLj9YDbODhowUcIDU/iPwRB6ky2wvDvfBw1XYy0QcTt0pLv2ToYW8uTz?=
 =?us-ascii?Q?IQ/1DZ5aVM9NbtDTRcXG0ngEzRMuITGci9cy9Gu1NrnJbaiYSQf3xcCba2c7?=
 =?us-ascii?Q?0V6UMJP5q6xMmWVCA1x4OBoJTS7SCcmLgZRW3Y2kydbNPv7XMKvl+ypyLFuI?=
 =?us-ascii?Q?R89Lfsc1mlz6mwr9cS/IamS3GBsL77LZmdhoeZKxpKexV417hsSKNl2+URn3?=
 =?us-ascii?Q?fDqPa94Tg4EQULzohrVKXFyLcTfuegIavQ7lmw2KjSKl8Hk6W8dYCwFIkSYo?=
 =?us-ascii?Q?qxmCbMDy6tH0GvSJW4RxUCFJ4GAoO6BD4CtW5awVkO8RsvwDdfeAw7kWfw+W?=
 =?us-ascii?Q?tazafgOHGG9KBDfrz+TaTc+jU+Fvrd+tfbc7v5naQaOArx8Mve1HT2BY4+RG?=
 =?us-ascii?Q?kiZXpgPXgMW20aRi7fomZg3gLTiZbxSxtFR3IT0Cv79CwjSFO+Hw/KcgjZ9e?=
 =?us-ascii?Q?0sfXTpUYWHZP7LaTM+OY1s8ujObUl9Isvj+fwA3r7gaFIFMam9ebGa2fSl1v?=
 =?us-ascii?Q?ZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46c8a65-2762-4da4-ad99-08dcd0a2e492
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 07:42:01.7650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NWzDB5hutuGrdz01Q/75F+m3JxKMHX1IAy7pYfh97lKRO95JoteML+5rdCGocqMVygXVV5xlImlz4p7PLV22ybijnF328Om/D7MepM/m06g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6145
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

+ @Kumar, Shubham

-----Original Message-----
From: Chegondi, Harish <harish.chegondi@intel.com>=20
Sent: Monday, September 9, 2024 1:07 PM
To: intel-xe@lists.freedesktop.org
Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Ausmus, James <james.ausmus=
@intel.com>; Degrood, Felix J <felix.j.degrood@intel.com>; Souza, Jose <jos=
e.souza@intel.com>; Cabral, Matias A <matias.a.cabral@intel.com>; Ranjan, J=
oshua Santhosh <joshua.santosh.ranjan@intel.com>; Chegondi, Harish <harish.=
chegondi@intel.com>
Subject: [PATCH v3 0/1] Add support for EU stall sampling

The following patch adds support for EU stall sampling, a new hardware feat=
ure first added in PVC and is being supported in XE2 and later architecture=
 GPUs. This feature would enable capturing of EU stall data which include t=
he IP address of the instruction stalled and various stall reason counts. M=
ore details are explained in the patch commit message.

Support for this feature is being added into Mesa.
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142

A new test in the IGT repo:=20
https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
is also under development to test this feature in the driver. This patch ha=
s undergone basic testing with the new IGT test that is under development.

Thank You.

v3: a. Removed data header and changed read() to return -EIO when data is d=
ropped by the HW.
    b. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query EU stall data rec=
ord info
    c. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_dat=
a_xe2
       to xe_drm.h. These declarations would help user space to parse the
       EU stall data
    d. Addressed other review comments from v2
v2: Rename xe perf layer as xe observation layer (Ashutosh)

Harish Chegondi (1):
  drm/xe/eustall: Add support for EU stall sampling

 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   33 +
 drivers/gpu/drm/xe/xe_eustall_cntr.c       | 1000 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eustall_cntr.h       |   60 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    6 +
 drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_trace.h              |   35 +
 include/uapi/drm/xe_drm.h                  |  134 +++
 11 files changed, 1298 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.c
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.h

--
2.45.1

