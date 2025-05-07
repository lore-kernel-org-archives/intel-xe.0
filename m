Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D9CC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C66D10E1B0;
	Wed,  7 May 2025 20:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8cOKy9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0203410E1B0
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648918; x=1778184918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kftKUh4MlzYh9OIB3PRCDM3TK/1rjG8WLqPrNI65NZw=;
 b=K8cOKy9xNn8ox+pfWD5tDoTCH4fQol3Zy4JbBIM2qmBL95kRLpKXuFF6
 QLU6yUl2Hrn7+oqfNW0JcNLJnx/1Ie/uvc2TcdmRQ8RdU3rG6ZM4Ev9v5
 G1jnF2Dayquot+uz2TiZPQ8ChTvKtYkRdtwytqrxiRgkxWlUFfX9Njc0b
 LSBIRhe/ybK+Fz+xdMjbwAkSITWZ2o89F/mEmK0JmnUNDfn27c0wxX5Fx
 dwHFfcFhNqmV/7O+iXphsKNlM5avaXo3jzxLf3Ng4XoT9QskcUb3TmB50
 U9gD55I8RjB3wEbFTgRJrwHQzk3AI+weNoWc/gw1aCnK/W7wPfvQy/MeI A==;
X-CSE-ConnectionGUID: ewmvIXxMSRe/3GJak7G/BA==
X-CSE-MsgGUID: N8XEBrddScu9iLzE5kjyOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59066761"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59066761"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:15:18 -0700
X-CSE-ConnectionGUID: yocrGm+uTwqn3nOia8j/4g==
X-CSE-MsgGUID: 6P1oi09hRVa+zBOrujvKSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136460457"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:15:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:15:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:15:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEFShm4ygfs5azZfNSd+WJbx4OcQmjSwEyOZsA8+JKUD687yon+4v1TFmTEhsUrVKkYF79Io9R24JHvMM3b+PDkaREOmDDuwnY2qd83julV9KW2FazmYqTuSywd8zr9tCC8nbff2cZRgbtDyZeEMIAY7w0DWMm5jYkiUOeTgZdzazo1FjnKXImzZWi+Uc3wWgXXvF1K7grrDMjg+n5s2bkXamhnF4MX3mckbgtr7QA4Zion1EXyNv/m5PxHwOB0hXZxvczOG1jBtJKlXOyGzNtaWn+QbZLKnnwKXaw/fG2/oJacJ3FzmUB/E7/kkIGqhBK4WeNCQfUtYKbNVEGAZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZtU3BiGM09BI9b+RdyuI+InHigxGA57ZHhBRrJ3B3I=;
 b=GVy3evhW/pJ2rQKa8oe+F5Akhs0I+TDPedNjaMZO++8siU8NYSQq+Leo1gUXWcZcJfo8U5tRLS3OMQu99kDZvC/Hh5Ft3qZ49/pUkXycl+H2TjMX3WUcw+3RF225uXi8+TuyJPQsBVrl8Lhu8MRS2Ch7MZBWa6jUiP14FoXjJl3hHa7bMO79riV+Nw4W1BU/nW2xiFLktCk3tfFIMbYBsxgj/GpaI9GAbfp49Rw/7l5W0W0+dZnlB676dh07jiXM/bOTTcprYtvYEwXcqVrAOS66Eo9njtpd15vUYIqie0FN2vi8kw5KPocCcPFMDEL3DK/DMP2rCgnOkqtkIO2/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 20:15:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 20:15:04 +0000
From: "Brost, Matthew" <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Hellstrom, Thomas"
 <thomas.hellstrom@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/xe: Add config control for svm flush work
Thread-Topic: [PATCH v2] drm/xe: Add config control for svm flush work
Thread-Index: AQHbu4PnbAwq1n0/F0mgeoINOrvRrrO/kseAgAgPeYCAAAAWYA==
Date: Wed, 7 May 2025 20:15:03 +0000
Message-ID: <PH7PR11MB65222B6ABD0EC2292BE148B4EF88A@PH7PR11MB6522.namprd11.prod.outlook.com>
References: <20250502040757.1722973-1-shuicheng.lin@intel.com>
 <20250502170052.1787973-1-shuicheng.lin@intel.com>
 <aBT8L2f44VrIGlzO@lstrano-desk.jf.intel.com>
 <DM4PR11MB54562BCD985B591B7D10953EEA88A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB54562BCD985B591B7D10953EEA88A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5167:EE_
x-ms-office365-filtering-correlation-id: ae88cf80-c816-42a3-638f-08dd8da3da6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aEi8ctqSB3eb/ZcdPhJ7+aIR4gevsP+AJJqqfXOV+m4kLLHg+pmhXC+CS3UZ?=
 =?us-ascii?Q?gVIw3m6qh3KiovSJzjPvHzkNUG0O1PdP6hRPBQ5L5HYw6ZteNyL89GyC/+3B?=
 =?us-ascii?Q?J17GAJ47W8FfWB3d/dggfrg4B2YPwTDOCepVu6UPegoBdALybgJcFWRJFjzm?=
 =?us-ascii?Q?US+OBTbcO6ITvT1Mcxp5EZWAPt3v3lexGuwKjNLU2pOJMjeZ55KCTctXPa5E?=
 =?us-ascii?Q?jEAtKAok6q67HrI8SFFTEhRhxQ1FPqxJ1hzL7/2GKL+L03NGLcYHwL+nBA/B?=
 =?us-ascii?Q?dftZi1RJPIOJ90UI6ZPcdTjy38hA8y5Hxt8g5h4NTRzIR+GH8zFDy2Nb9WnO?=
 =?us-ascii?Q?+ffQYZlcwisYd92JFORNhiBPnsM0VgmZuBcEab7yFZ5CeurS8cbbiQaGrjkw?=
 =?us-ascii?Q?Gp/3wkzCXT259I6G2OQ6K5tfOTqfsG4i+kYj5I7fHh7VnsAgfghGeTzY2k8a?=
 =?us-ascii?Q?Ih8KnN4s4GzZTTQV4PPdD4ihDqAjgoLiiR1lxsdY44jY3nLM3MMerkiva3ks?=
 =?us-ascii?Q?IG3JECQMlPzm6mhLjUEEBPOzLz4UN9Rkg1K/+3Biw6LLrJ45eoRfhTrRRM4n?=
 =?us-ascii?Q?WjoCA/BQasrmmsoPIaEA76GMbPhQYd1ue9IUiWoVDAXGYHbN7w6NpQDF15TI?=
 =?us-ascii?Q?etvQSgoWY9FiRdLBKEEnCvv+m1d0j6lesGrLDQkGJ0nGlpZSbc/BdWZyP8e4?=
 =?us-ascii?Q?tJ/EVG5LXre1PaAKUBZjzEM2lX4QLMbCTNImsdUXKbDMnIiVsldwuoFJqTzf?=
 =?us-ascii?Q?I5EhkM/dvvIc0MOoZTON4ynAb9dqaKM2N1kLSt4k9zaCrh3yKZ3rThzNoax4?=
 =?us-ascii?Q?Lhi0W0DGGhALDZrhDhKi001mxNbEERjj2jaajiHcy5UT6H2CBi62pBrOS7Is?=
 =?us-ascii?Q?hnQpl3xU5LIC9zA9PeTOJBLPeqXnKxzKHKYyvQxyQkfJ2751JW2NettbAfb0?=
 =?us-ascii?Q?G4AjWmlZf/PpDMDM00Rs1MhntZT2IRjypS0gw9K3Y3rh/Vr7yg5ijIwoNhOS?=
 =?us-ascii?Q?CPsxH1LF/Mhw4wQ6R4r4LfsRiLC43l4GD8KSO0sgjylhsCcGeKAi1Uv7eJNl?=
 =?us-ascii?Q?tZA2bnDkjH1/NzJpNzrrqR2YOo6xvATLk2ye6LJbBQ7ahPnFcZNFGruw5KXx?=
 =?us-ascii?Q?IJO/82EUN5PJlodBNhoZbCEMg1a+qriwzEZ5tYQY7yswdBBRPreRWkE9EhXn?=
 =?us-ascii?Q?Y2bTfi0v3G7xW4BZkAYWOtaOZ3wvpSu81AdOPSfJV2qeRnztvVq3pZbjrYOC?=
 =?us-ascii?Q?vs/NFuaEg8Jpne0b8/kqdba0eVLrd+sYhDQ2nbD6kS1VlEMaeOOkcED7q67E?=
 =?us-ascii?Q?4XBH5iKNHIbUsoz4jomLQMH7DY/v/JsC8rmxkuRz8Qc16HO7GYWG6RwdViD2?=
 =?us-ascii?Q?oNxTgV152dUJbmziwx2Bz3lFrUTecLKwOfu7WofvCFUR3jkjjRS0ojwLrlef?=
 =?us-ascii?Q?VhYL+uXwAzvCWNravnG2cCaLNF0qb42vnXFkCqfA7OAhRqMApHGTUoSO2qHk?=
 =?us-ascii?Q?9ln5qQqSgPvwn/8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G/qjJY0zXC9zpsjvOuF5P8XYr9XVZJ8WXXG/qzzyqvVOcj+Em0iqReKgZzcM?=
 =?us-ascii?Q?fL+T71BZz+XaoiRz6Z2aQTTNgELRmf3z/PZb6Nm0cPkEGbf+9NkdnD140Hti?=
 =?us-ascii?Q?1bBDl22WplfUrx/61qiuns1Gs/guGL3FSD/Atl2mdInvJD3ddPedNmHZvHRV?=
 =?us-ascii?Q?JQbnbTQ3mexkA4kwlFxZbxR4nTXabawgXSpbm/xfTOU4tv/Q1u96gnQMEWdg?=
 =?us-ascii?Q?vohwHHSIA5rM0EQ6taVAIjMlws3kfZPZgsssDLds+JE7XvVp3ZGF/GiNqIJo?=
 =?us-ascii?Q?CKLqx15WEk4xFTlTN0W6oshd7j1O/weZEWbh1vDmrcqKooVM/YmD9HvIZnP9?=
 =?us-ascii?Q?RQJzYgYudUs1tjz0BbY3DXSFMV8+8djf1lC1y6PqvdOFI2THpBm74HWN6QJO?=
 =?us-ascii?Q?5KvF8fvAsgd9ZZaXLHT3WGTMvTQixXfAQpETGXFjQjt+5mMQY0tRRQgmYgrQ?=
 =?us-ascii?Q?uTFVd3LnMEEfHqHkpMBjyjYAhvFE55tUeroJweIhfCU0samSnW0LEv9cOYl1?=
 =?us-ascii?Q?d2EmjQB/YgOFNZTUuUtB46TPsisnLK+h7pssMZiPket+Dr6fPtPReAqhHltw?=
 =?us-ascii?Q?f0PJqJr3idFKVH/y/ZNV6fWdC5i8GdKaQGtiW1VwSfWnpFxR8wSyD1dQlhiZ?=
 =?us-ascii?Q?2cPUtbGJ4gZgP/uWGlHBz6BMRcXDkG1WE8w4qoc1oo9ELr+T84nJL5aIN8fl?=
 =?us-ascii?Q?NyUg8kL84VcUA/HEKUM2x6onTUMBpf1aSvXyHJ3LitvEiOFZDsLFP87lsLKJ?=
 =?us-ascii?Q?RXORsrCuqCjuJ+v/mfY8+7exQTABTQKX0uV8gdVtJ6aCAJFeJYziz6XXDO1n?=
 =?us-ascii?Q?J5uCPPp77JZuVgf2vym9NQASsn8qaiBoCGYrC+uEJO/T4W+/6vsZQGwUs/p1?=
 =?us-ascii?Q?9hOYvFpF3IxjtBNQTsex6rILC0bEdVAlmVw6yKtNPrl4VTbU4VlTPnFlCxMs?=
 =?us-ascii?Q?d6hjnylVbFewX3XQ8GvrIL90Z7EDcQcgPg6DbM8GIsuMutSgE12JvCrsoVb0?=
 =?us-ascii?Q?2wMpJ1QDTLuDyXc/H3HUdUs/VDtlGHVbkO9ukFa+2z8y2ZHG0xCa8z6cz1ME?=
 =?us-ascii?Q?9qVUY21HlJstO+4pO1q5ulklcRh78vPIWdAY7K8mJ2F7Bj4kBisJ2d0w6RQ+?=
 =?us-ascii?Q?UQwYNaNoppCrJZHUmL54dJlMwD9TYC0G/DRfDl6uiW8IzY6mzkpCLI5pD4Bk?=
 =?us-ascii?Q?esUB+2CatVjfiyzZs4brqFolH2Da8FVChxWIHC4/t55Y6uq2iaYqwNBfkwJQ?=
 =?us-ascii?Q?/KwW4ruZnc1cuMMZh2DzHvMZ0IEeNqg+Puhq9nCqdfA5Oprrd9z9fk4PcJWX?=
 =?us-ascii?Q?J3bD6qmDRzjce6d71SiUMJV9lL0kqGLKBuw1VBWOFw42F9cMV1Zy6a9YndXZ?=
 =?us-ascii?Q?0+RGA6wn0M7ujxpwuOWfNU/k0hsSkw6r2fMQsyXgbUS3BxcvU84LfMMFtmTX?=
 =?us-ascii?Q?IJeDeJ4l+WeHXKaRuTXHg+yQgqv7GSHzME8s6OXXRS+P4nKlObzXAXZWkDj5?=
 =?us-ascii?Q?dqz9EeFNmjouSsAZdlUUdNvkb7G8mObu98K3nXvfUfJ6152cLXps2NpqmNQk?=
 =?us-ascii?Q?JYhCSQwKLtKE+XQNL1Ymvrn6rsdBZ6FRgucc7J6j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae88cf80-c816-42a3-638f-08dd8da3da6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:15:03.9926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0JEzbQv1WmgiKBzGYERGKJ+eIOGqRYkEbyvRZNH6TlKVILzzuBGEYZUbT5Gom+fb9Q0fC3oW1Yvp8wYSCAKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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

Did this an hour or so ago.

Matt

-----Original Message-----
From: Lin, Shuicheng <shuicheng.lin@intel.com>=20
Sent: Wednesday, May 7, 2025 1:15 PM
To: Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.d=
emarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Hellstrom, Thom=
as <thomas.hellstrom@intel.com>
Cc: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com=
>
Subject: RE: [PATCH v2] drm/xe: Add config control for svm flush work

Hi Maintainers,
To avoid forgot the patch, could you please help me review and merge it whe=
n you are available?
Thanks in advance.

Shuicheng

On Fri, May 2, 2025 10:09 AM Brost, Matthew wrote:
> On Fri, May 02, 2025 at 05:00:52PM +0000, Shuicheng Lin wrote:
> > Without CONFIG_DRM_XE_GPUSVM set, GPU SVM is not initialized thus=20
> > below warning pops. Refine the flush work code to be controlled by=20
> > the config to avoid below warning:
> > "
> > [  453.132028] ------------[ cut here ]------------ [  453.132527]
> > WARNING: CPU: 9 PID: 4491 at kernel/workqueue.c:4205
> > __flush_work+0x379/0x3a0 [  453.133355] Modules linked in: xe
> drm_ttm_helper ttm gpu_sched drm_buddy drm_suballoc_helper drm_gpuvm=20
> drm_exec
> > [  453.134352] CPU: 9 UID: 0 PID: 4491 Comm: xe_exec_mix_mod Tainted:
> G     U  W           6.15.0-rc3+ #7 PREEMPT(full)
> > [  453.135405] Tainted: [U]=3DUSER, [W]=3DWARN ...
> > [  453.136921] RIP: 0010:__flush_work+0x379/0x3a0 [  453.137417]
> Code:
> > 8b 45 00 48 8b 55 08 89 c7 48 c1 e8 04 83 e7 08 83 e0 0f 83 cf 02 89
> > c6 48 0f ba 6d 00 03 e9 d5 fe ff ff 0f 0b e9 db fd ff ff <0f> 0b 45=20
> > 31
> > e4 e9 d1 fd ff ff 0f 0b e9 03 ff ff ff 0f 0b e9 d6 fe [  453.139250]
> > RSP: 0018:ffffc90000c67b18 EFLAGS: 00010246 [  453.139782] RAX:
> > 0000000000000000 RBX: ffff888108a24000 RCX: 0000000000002000 [=20
> > 453.140521] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
> > ffff8881016d61c8 [  453.141253] RBP: ffff8881016d61c8 R08:
> > 0000000000000000 R09: 0000000000000000 [  453.141985] R10:
> > 0000000000000000 R11: 0000000008a24000 R12: 0000000000000001 [=20
> > 453.142709] R13: 0000000000000002 R14: 0000000000000000 R15:
> > ffff888107db8c00 [  453.143450] FS:  00007f44853d4c80(0000)
> > GS:ffff8882f469b000(0000) knlGS:0000000000000000 [  453.144276] CS:
> > 0010 DS: 0000 ES: 0000 CR0: 0000000080050033 [  453.144853] CR2:
> 00007f4487629228 CR3: 00000001016aa000 CR4: 00000000000406f0 [ =20
> 453.145594] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000 [  453.146320] DR3: 0000000000000000 DR6:
> 00000000fffe0ff0 DR7: 0000000000000400 [  453.147061] Call Trace:
> > [  453.147336]  <TASK>
> > [  453.147579]  ? tick_nohz_tick_stopped+0xd/0x30 [  453.148067]  ?
> > xas_load+0x9/0xb0 [  453.148435]  ? xa_load+0x6f/0xb0 [  453.148781]
> > __xe_vm_bind_ioctl+0xbd5/0x1500 [xe] [  453.149338]  ?
> > dev_printk_emit+0x48/0x70 [  453.149762]  ? _dev_printk+0x57/0x80 [=20
> > 453.150148]  ? drm_ioctl+0x17c/0x440 [  453.150544]  ?
> > __drm_dev_vprintk+0x36/0x90 [  453.150983]  ?
> > __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe] [  453.151575]  ?
> > drm_ioctl_kernel+0x9f/0xf0 [  453.151998]  ?
> > __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe] [  453.152560]
> > drm_ioctl_kernel+0x9f/0xf0 [  453.152968]  drm_ioctl+0x20f/0x440 [=20
> > 453.153332]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe] [  453.153893]  ?
> > ioctl_has_perm.constprop.0.isra.0+0xae/0x100
> > [  453.154489]  ? memory_bm_test_bit+0x5/0x60 [  453.154935]
> > xe_drm_ioctl+0x47/0x70 [xe] [  453.155419] =20
> > __x64_sys_ioctl+0x8d/0xc0 [  453.155824]  do_syscall_64+0x47/0x110 [ =20
> > 453.156228] entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > "
> >
> > v2 (Matt):
> >     refine commit message to have more details
> >     add Fixes tag
> >     move the code to xe_svm.h which already have the config
> >     remove a blank line per codestyle suggestion
> >
> > Fixes: 63f6e480d115 ("drm/xe: Add SVM garbage collector")
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 13 ++++++++++++-=20
> > drivers/gpu/drm/xe/xe_svm.h |  6 ++++++  drivers/gpu/drm/xe/xe_vm.c =20
> > |
> > 3 +--
> >  3 files changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c=20
> > b/drivers/gpu/drm/xe/xe_svm.c index 890f6b2f40e9..d25f02c8d7fc=20
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -726,7 +726,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm,=20
> > struct xe_tile *tile,  }  #endif
> >
> > -
> >  /**
> >   * xe_svm_handle_pagefault() - SVM handle page fault
> >   * @vm: The VM.
> > @@ -966,3 +965,15 @@ int xe_devm_add(struct xe_tile *tile, struct
> xe_vram_region *vr)
> >  	return 0;
> >  }
> >  #endif
> > +
> > +/**
> > + * xe_svm_flush() - SVM flush
> > + * @vm: The VM.
> > + *
> > + * Flush all SVM actions.
> > + */
> > +void xe_svm_flush(struct xe_vm *vm) {
> > +	if (xe_vm_in_fault_mode(vm))
> > +		flush_work(&vm->svm.garbage_collector.work);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h=20
> > b/drivers/gpu/drm/xe/xe_svm.h index 3d441eb1f7ea..2881af1e60b2=20
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -96,6 +96,8 @@ static inline bool
> xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
> >  #define xe_svm_notifier_unlock(vm__)	\
> >  	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> >
> > +void xe_svm_flush(struct xe_vm *vm);
> > +
> >  #else
> >  #include <linux/interval_tree.h>
> >
> > @@ -180,5 +182,9 @@ static inline void xe_svm_notifier_lock(struct=20
> > xe_vm *vm)  static inline void xe_svm_notifier_unlock(struct xe_vm
> > *vm)  {  }
> > +
> > +static inline void xe_svm_flush(struct xe_vm *vm) { }
> >  #endif
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c=20
> > index 2a9d58a4471c..91a0570abb16 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3419,8 +3419,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> >  	}
> >
> >  	/* Ensure all UNMAPs visible */
> > -	if (xe_vm_in_fault_mode(vm))
> > -		flush_work(&vm->svm.garbage_collector.work);
> > +	xe_svm_flush(vm);
> >
> >  	err =3D down_write_killable(&vm->lock);
> >  	if (err)
> > --
> > 2.25.1
> >
