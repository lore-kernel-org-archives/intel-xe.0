Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855F5C7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 17:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABE210E2ED;
	Thu, 26 Jun 2025 17:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Akia92Su";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B018F10E8D9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 17:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750957722; x=1782493722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FhPkQRGJQVl3u14MOyjRBnsT5u/7sgU3GXmpZvU/fjE=;
 b=Akia92Su854Gy6360xSnznt4nCDaeXY6ePdmAzH7L48E1HeJkEsdH2M9
 P4yIz9pnvcItm7TxPI0eC+RGAgcSyj3muS7SAZ5MLj47LToovjw6Ml5qk
 eamZJTStE/lJ+h+Ch0f9EkrIM+LVXmkrl7DPRpzTLs4nIG3ktSQFAEdkS
 saiHv5/r3S1eJDJqA76NZM1sObUaafS3q6eh5qO2ws8+tABL08RzTsXK1
 /c8jDCD6ncaTnVRIXs0DiBgTuszbu1eIlCJkXGEGXoZG8XLe3YDHjA6CG
 Qanei+/OzoV7Z+MHeP9ir67zmUEVcTkcehn2J+BEV1hibQJQ5tiuJ08FB Q==;
X-CSE-ConnectionGUID: gntoqHizRLyK5rOKxxx1Sw==
X-CSE-MsgGUID: 6/ZX4Q9SSJG1N3BwYX7HyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53394046"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53394046"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:08:41 -0700
X-CSE-ConnectionGUID: 55mLtqVkTgKTPA54rQZtPg==
X-CSE-MsgGUID: WFGIekZoQCyn/QyBaAF8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152326632"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:08:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 10:08:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 10:08:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 10:08:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzgyjefZLw+tiT0SHG5PM+w7tOPtbb4tft1/wB0CwzdHHvtg50qHdcW9cDXKBhEEjOf0XCMtimT5lVeGimUxtN50kpe5CFJLQrIM4J3cwxo09d6VjSxRHgUDzPqc+NibbYowFiDQHY+Gj0rhYcRQpvKmVhDX136Sw2i64tTH28oGgwvUkkc/3nUJFZ3AYdV10mnQrYhzen1bs6NfyTBBCmqrLgwgHBtlQnWzxW0o+XKqGki8HAKcTb7P1N9Uyoj8ipLwKK8TH6gKJ+DETu2RlmUKEPDs2V+Ss15KMCT3YUGd+uPx4NAyCsi8kDXXHVcyBQ26kBPL4GanFHrJo0a6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSaSE90oSLfAHwcjzKjfB5lu1RGARug3mQ/wLSN5zHc=;
 b=eHqaVHK67gqVSsU4ACjN0QbmkKQ80ZVhV0OTgI4NpSLme34ehuoaVgqVaQQtDtCLS8h8DHLQaiHPZzHoEJtgFbbgZWrBYn9zb4QvXfXds+cpFpq5qxXsn9+2AY/J2CVYlzFeHYGH3SrkGsXNBq4ZbiQVInC8+7p8B9tdyxlOfMSzIrqurhyELZS5xrx3yC3iWgeGI/SLB1uCcjgQhk/ZxULtqyPqKgYd6g+uBxqczi/cHhONVPMb37/IIe6EkBgfoXRuAKdZI9sKgVqu0/KruxZJiUekNAo/6wb02PEB7N5NPfRp4ebQP80X2GpFcJNgtgYnynhTDbZvYhlZDtED0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 17:08:22 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::701c:c42c:4440:5420]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::701c:c42c:4440:5420%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 17:08:22 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nguyen, Brian3" <brian3.nguyen@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>
Subject: RE: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Thread-Topic: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Thread-Index: AQHbzyTK02qF3Skq20ea1rjsn++aoLPmy0YAgBb53wCAGBYDEA==
Date: Thu, 26 Jun 2025 17:08:22 +0000
Message-ID: <PH8PR11MB80405061D209DFD27B39DE50F47AA@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20250523150418.168362-1-jia.yao@intel.com>
 <20250527163050.287042-1-jia.yao@intel.com>
 <aDYDsozeWc+kpEfV@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456F18EC221141CB3388FE6EA75A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456F18EC221141CB3388FE6EA75A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|BL1PR11MB5253:EE_
x-ms-office365-filtering-correlation-id: d1e07f94-8368-4463-5c35-08ddb4d40e80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?P7x38UQ6X9G2NGVEq+5SSb1XG8zBKHCcEVnHZqNb87FkeMAt3E5tgm7R9U2y?=
 =?us-ascii?Q?AZuiJUY5h63xi8usIIUsknKOvjGMUp+K6UAH3vHCZjs4N9aqZMguTssvz8aX?=
 =?us-ascii?Q?zXrjmwJimDTVoeBWVeX8/2AiUmDXEQeJPPOivJUeMVKZixLttUjwHgTmy8LQ?=
 =?us-ascii?Q?NcQmMPbTOk93AtBAloFmuRstr3+ab9j/+ZKelBhJ1Mp0kO0Bux376cybtWn5?=
 =?us-ascii?Q?gbHMxemmT65A9DDDo5t6fCvP416kMrm4fYjNmt9r3Xs/m8VvIciCcj53GoJJ?=
 =?us-ascii?Q?B2jGgZPokPEKdF5fIYvSFjAZi/GqOE4ZBy/zCrb/MnouzFglwFnFj8zJ2rWp?=
 =?us-ascii?Q?tf8RBHWrCqCXEHIGRur8OPyGni1a3wptAvNmtyYXqpzM7cVjnK06aqpu0A6D?=
 =?us-ascii?Q?OyLAszW1L1gI/PYxnfSXtDjb6aQjhPAuUEQMPFihaX8Z3gi26OrgxOGm0svH?=
 =?us-ascii?Q?Jsq4fGEgbXV26hQsG2/6z88Fj6e2xbF6Ym9Fx7tGFi0M9W0/y+uLjF1TjMjM?=
 =?us-ascii?Q?j53HXwfAnPH8qP0I/t7kXN75i7xevNy2zXStXthzV6C9DIK3X9ISvQ2GwM0s?=
 =?us-ascii?Q?P8RUdWT2DwIOx53exRIB2538Q2hHz53H/+2VNuXkbD+6zdRNCswtuotfNvQ3?=
 =?us-ascii?Q?DEEWu/FxWWigyccfX8z4w+wlzXsnxe3vmhr4WasZwGUG9dtuyArZg/+aBn0r?=
 =?us-ascii?Q?n9gopoExDIRJE95r0EqrYioA5RGfCnAGgySlprYdIrYRigExCVjL2R41qDgR?=
 =?us-ascii?Q?kRms/RO2Fu7FsaEplg4O5AxB3IfnJ8lLAmEy8a2HKNKyFlyFUJ738PXY6Ito?=
 =?us-ascii?Q?8ThSSlvWUVImbx2smMKRT02GXgrlnWqiySCu3gNWusio9AAOjK2qNenuXmjq?=
 =?us-ascii?Q?oisVedD143K/L7/YYFMZ9PN18M4bSc1+lrzGyq7qw8GcIi94o5oO8Cooa1mM?=
 =?us-ascii?Q?RJI/G1co/ErQsD9KJqd66e5RpVoe1hmxqPdNQeY4UlCfuSu3rCvT4xB3HZQS?=
 =?us-ascii?Q?um0Xgow2yjjn21OVK5fdbRhQxdKH1r52vl7It4jr/EwhTZd0a3hYWOC1vE5y?=
 =?us-ascii?Q?04x0MVIj/Hf/ezz7+LYTW9Kn11paK7Z2hX1d3RECez+IIJJMcO3B/Te618dk?=
 =?us-ascii?Q?WYp6r7imBu43zWASsSbTYqXD3spnsFlCkB9AlPWK13LFx1TEWPIb/BMv00M9?=
 =?us-ascii?Q?UP4TtP07ty8oOUTTyGz5azzkhy9TvCAgM3OVEajouPvBOpHNyuIsJivZsDnr?=
 =?us-ascii?Q?SLM5Y6vwlY1EZ8lDocaP5tTTW1yUVj+8Gp9Z98b/vNnQ4c5o7wUxxLwKdpr1?=
 =?us-ascii?Q?CdrFMuRV09vRTAm6v9oRGIQX3kdGrS7QGJ+dm25S3FvQ+DK3xigxVS2F5MRL?=
 =?us-ascii?Q?PVd6EOHdHVjczf2QZ30gNcujnMcvmLfjZ+cxtP580OqOGi0uKS9SzS6ytr4p?=
 =?us-ascii?Q?nOFsrFivhV+VNsGRXbaWbZ1l7OMpsFnxDZn5VypgwgDxX2QgYfZyUQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ddpe2VTk3JhPVaWItyTtXtMQalToK+nvEg3s71L9kIJ/49lS10nIyATy4qq4?=
 =?us-ascii?Q?CLD2UqtC3rfQtjVR4zbpuB3LwEmMRFoOzkwYX0wD8m5Jd/vLNrGDxjUbIt2l?=
 =?us-ascii?Q?xeS6LsUzTnkJbN7cnKQzdQPoWolNKBQvhZTiMCHKe8zaP5plt/6yro9CBJom?=
 =?us-ascii?Q?JUvrjM7CVvqbQa6wPDPEsf4/kqP6dMkQUcGW1DXufFHVjKKTSAvI6V3DwPT1?=
 =?us-ascii?Q?E4JXN5/PWhKAMrY57gbVVSrRvk19EfNm2qaInQ/jOvZWIFhhXmZ/HtbO7nbO?=
 =?us-ascii?Q?DplQjfJJbrCOpMB0LJWdzco+Ge1Fa68JLJv9cSDbthiuHj2nSfIUWnPaO+6L?=
 =?us-ascii?Q?AcasFHNzgSnSpxBQ6ucm6Q+uk0RXz3jcfItlorlpDRf1QKsOUUoTpLVbFYvM?=
 =?us-ascii?Q?5DK1zXKN78055oYHnPoGSynP4lbC7Mk55T4wtxdvYQ7YWPW231YEdMktiLlC?=
 =?us-ascii?Q?amRRVlrUhxJWx3MVsLsooS33IEFNXg+Sx+qBdQ0fLVycZ560AGdYveujx46G?=
 =?us-ascii?Q?PBDPOJhn9Um3qNrLB94WGGKS/jlB9M0z11HByfL1TWIM3rIYr4HCTiSKCWJT?=
 =?us-ascii?Q?CiIXpvuoSuYOLp2toIPrSHKyHCI7j2xFsAYYT+zBtVPcSQgMlnwEEoC2K8Vl?=
 =?us-ascii?Q?QMpfyNt3CGGo/rFn4S2NanyrBeFgy8qQFytJpuvsTIwr0klGvD2owo1Deu38?=
 =?us-ascii?Q?OW1nMwz6Mc288WZwtJqFUEpCfGrmQCyoVhKQpTF3ctm56ZNmcKq/bUiDjT0y?=
 =?us-ascii?Q?lia3Ut61rHkf8wG4Oqlaaf1tsVsEXjhazR+wwhyGhcsklyMSuoKXHfBQqgC+?=
 =?us-ascii?Q?0CphDOEEMVpHZYHelGy0gO3kVjsly2KXBME/siGV6xcuTluislo/7ZhwC9/X?=
 =?us-ascii?Q?8bXZNyBndLIjyy9RwMNGmjLYXo9FeRLOXkKg69HhLQCWaK1m0bBHNvahZhNF?=
 =?us-ascii?Q?ixO/wfI3MgQN18QpnleXbVOwQWkthmlLJzndj1dIY3GzbD6cVjoQg/ZX3eCs?=
 =?us-ascii?Q?pV/TQEy1cozrmgr3ZOmdhbqhJxA71SDoamZw85QfYG+IK9OaUVvTy4A3ss0X?=
 =?us-ascii?Q?zDIDtxYow34UqSzw2ruQ297GbwAKpDPqblprJR8SuMzHMKcGaE92ox9e4eIB?=
 =?us-ascii?Q?BD86ZkIJPVXOALKk+/Oj/oZpld5d1/ff297+eHVqyy/9Bal8UJ4tfFcbBtKr?=
 =?us-ascii?Q?wdjdqoAC73dQ4t2lt45jiTImmdKChBWMPjLpHbD0oJB1HVIzCawMEOicNkoN?=
 =?us-ascii?Q?zBHb9QgCqWMkSYF+2qe6aX6FMN5opuSFpSN/QIUpg7Ui2GsDIteDhwk8GRAO?=
 =?us-ascii?Q?TGEq2yIBptegkVcH8rd0Iu47DzJyanecGCsSgo2x7WMCdqMr/PWYi1PQCj1B?=
 =?us-ascii?Q?YIvqnq11tj7qkBZ9WFfOl9zfkSioBOhpgkcbu0nyilq5T0rf0nCDWqmfZbAQ?=
 =?us-ascii?Q?55DuBLAMwrJBNzGYRe0e9HlulNSdbvi4Y39jdKm8sWCHvN6PnNM42UKx5uR6?=
 =?us-ascii?Q?i8Ej5yqD7o7r3gAmge5ira3I6CDmTJq4euhK7ttnMYosHythl/VvZXR4Dash?=
 =?us-ascii?Q?9hIrtvbu9tO+OVNy6I0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e07f94-8368-4463-5c35-08ddb4d40e80
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 17:08:22.5275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRmHjrLcmlHvw4pYFN4D8kujfmm2VUnIfkJ2bKLVzSEmm/wL/qYhLeebOnxhLUThGYO9502CrafefYbB67FUYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
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

Hi maintainers:

Could you help merge it ?

Thanks,
Jia

-----Original Message-----
From: Lin, Shuicheng <shuicheng.lin@intel.com>=20
Sent: Wednesday, June 11, 2025 2:18 AM
To: Brost, Matthew <matthew.brost@intel.com>; Yao, Jia <jia.yao@intel.com>;=
 intel-xe@lists.freedesktop.org
Cc: Nguyen, Brian3 <brian3.nguyen@intel.com>; Zuo, Alex <alex.zuo@intel.com=
>; Auld, Matthew <matthew.auld@intel.com>; Patelczyk, Maciej <maciej.patelc=
zyk@intel.com>
Subject: RE: [PATCH v2] drm/xe: Fix out-of-bounds field write in MI_STORE_D=
ATA_IMM

Hi maintainers:
Just to avoid this patch be missed, could you please help review and merge =
it?
Thanks.

Best Regards
Shuicheng

On Wed, May 28, 2025 2:26 AM Brost, Matthew wrote:
> On Tue, May 27, 2025 at 04:30:50PM +0000, Jia Yao wrote:
> > According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE=
.
> > The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the=20
> > condition 2 * x + 1 <=3D 0x3FE must be satisfied. Therefore, the=20
> > maximum valid value for x is 0x1FE, not 0x1FF.
> >
> > v2
> >  - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew &=20
> > Patelczyk, Maciej)
> >
> > Bspec: 60246
> >
> > Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM
> > support")
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Thanks for the fix:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
> > Cc: Alex Zuo <alex.zuo@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > Signed-off-by: Jia Yao <jia.yao@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c=20
> > b/drivers/gpu/drm/xe/xe_migrate.c index 8f8e9fdfb2a8..1ede50780a14
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
> >  	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> >  	/*
> >  	 * MI_STORE_DATA_IMM command is used to update page table. Each
> > -	 * instruction can update maximumly 0x1ff pte entries. To update
> > -	 * n (n <=3D 0x1ff) pte entries, we need:
> > +	 * instruction can update maximumly 0x1fe pte entries. To update
> > +	 * n (n <=3D 0x1fe) pte entries, we need:
> >  	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
> >  	 * 2 dword for the page table's physical location
> >  	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
> >  	 */
> > -	num_dword =3D (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
> > +	num_dword =3D (1 + 2) * DIV_U64_ROUND_UP(entries,
> MAX_PTE_PER_SDI);
> >  	num_dword +=3D entries * 2;
> >
> >  	return num_dword;
> > @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct=20
> > xe_migrate *m,
> >
> >  	ptes =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> >  	while (ptes) {
> > -		u32 chunk =3D min(0x1ffU, ptes);
> > +		u32 chunk =3D min(MAX_PTE_PER_SDI, ptes);
> >
> >  		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> MI_SDI_NUM_QW(chunk);
> >  		bb->cs[bb->len++] =3D pt_offset;
> > --
> > 2.34.1
> >
