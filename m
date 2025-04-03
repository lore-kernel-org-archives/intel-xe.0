Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC19C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 21:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708CC10E2F6;
	Thu,  3 Apr 2025 21:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+TSGKTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8450010E2F6
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743717055; x=1775253055;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9aWRucni4V7YdqGf5+p0o+lbYtcbFu1zScRJpBXYMUg=;
 b=S+TSGKThM75XUxXcbSFSRSsOqEWS4Rc1uIHnxOHm30RkOF57PVdLplM6
 ItKLMSRS7jAuvtbM9f7hEE9lAc5NSIQulsu61nHaYXwBjwqLdx782KRT8
 gkhPuMggNJl/hEo9R74nkf36GVq+liq+bkg6YQ1Wjr3Hks3Vt3j/ipSjw
 J2CHoz7OJ+k9SZT6nYA8oKLowBTSjBpGE1drv0/8DRFTSKCrXvN3UxLL6
 q8pptgxpJ+4fmoVKBqxJn1Hcd2eAVojapAIVhjvq3Nj+c5pVmSxr0HPT3
 6M1zQF75x6pBdm8MAbDPNwMa6nZJy17TzrrTG2wg+w8z+lwYxtejV03UW w==;
X-CSE-ConnectionGUID: UOv8Sdd1SDmQEKGs/D+7eg==
X-CSE-MsgGUID: Z8MXzGU0SXCwL+0jlK8/iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45035089"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45035089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:50:54 -0700
X-CSE-ConnectionGUID: nt250uW7T9iwtMVIqc3fNQ==
X-CSE-MsgGUID: u2rj3bYJTry3defyLFn5Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132121220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 14:50:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 14:50:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:50:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:50:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umd8Zt5xWXajVnMOrLCLReaYFvKNo6gvjiooqTuXpqaUd0Mlv6xZERMxPPTRvvKjFsBa3oqwPp7zChxlXnU4uSwN2zM7+dbdi8QkjLsv6SStlCcS7Oo6Xc5S4utdEGZ1DIMJv+sGY2rhrRZF5i+GygOLRedpJEJ7aMyfUpy7u7ESiDGwj52gBwYgUhVciNYmIvCPu97z+D1Fl0ABuQ2XCyNgKrUsofEFvbKP961KSS7U4vzOSYqzy9y32iKcTsISiqHoV9TQDvOD37Jp7vLmIM182EAE/IFVRvf4bDFjM1GskT9ArcmcsiRQhXVVX7aOFDGTNPljzBOIeo7PeLki2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lild53bJihhJ/u3UjUmmHoK0ENM1+zBRoHTcsa1JFLE=;
 b=d9qK+56svhuA3JfIvIt6mbckY7EyVMY47YO0NSlYlyuLHzRvE/SJ0ztOXMbth5ZPz0ONIiMB5BE80XfoivTl1zRG5VX5lgOeqkSjVpkGvYAClsG0I8SjEKC+JIiwCA/3XePOO+RmG9An5HLa9rkriE6L7Boep8+iK9depLYpCCU+qhVBzJgqWq9hhCO8ybOjkRtUiouoz4FP2SGoG8giDTji7vXWqWyC+xl2qrnBgA8sq3WnRO9VimLYEZWDv3bFBMjBEPpMv5plP5EljpudnzdZ4caMj7uH4dzsofZVrruROXt4xjvTkrqZc73LNkAMAg8ZsqPafmGvOnTFljkggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6018.namprd11.prod.outlook.com (2603:10b6:8:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Thu, 3 Apr
 2025 21:50:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 21:50:51 +0000
Date: Thu, 3 Apr 2025 16:50:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: add documentation for survivability mode
Message-ID: <ny4ww6wka3jsn3fdogxpco55venm32s62xbw6cgktsnpxi6lle@n7tnwsbkyebc>
References: <20250403102555.1265786-1-riana.tauro@intel.com>
 <20250403102555.1265786-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250403102555.1265786-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:303:8f::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 714918b1-4c2f-43b5-c7da-08dd72f99a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m2GlO8BffwpAiajmNzo2apL5DsUo+sl7znik9pEweatye9l3UHvQqUyRHcPz?=
 =?us-ascii?Q?1uWgowqz+4kpSmHLDzxoetbSB/jhgmTyrmR3+G9Q6TLEv5AjIYRs2LL36kLM?=
 =?us-ascii?Q?qSdTwvsXqaRTXvTfl8Wr3uRFkfcRzqspw7Q244S7OJ+9AKTj1O8R2VGcCDw8?=
 =?us-ascii?Q?g3TZtBhrhk3+D6VI6sRCxTVVcMbPqbxIukDNJ4pVEC2DQIQGYaoraxz/VCOa?=
 =?us-ascii?Q?huNwyyv1YSrmiUdbVV3i8r9dTYrvFRvAyRsj1LrIWIjgyiijRsQ/CfTGZgSy?=
 =?us-ascii?Q?mDH19r6IrSeQPs0CgrEDqfTtd3F4K50g954OXSKCDkB1ue61sg51McBGKgQz?=
 =?us-ascii?Q?BJPBnJiEWEwxO/ez/yvUAIcFUuIiMXuPXTlx6GNxIlRjvgmkVDzOc29vDang?=
 =?us-ascii?Q?WV7h6ytCOauVSx1H8h2NA0sJO0BxUd+rqsTZ2yKiMnIxstGNXUofhct3RUeZ?=
 =?us-ascii?Q?NqG19LdlPNIhSMnQteav6JwRXzb5EYrMF4UZ4Sk+g9nV0Sp1xAOQPtIsFNRE?=
 =?us-ascii?Q?T2nJEejBijwJXaEjvPIQFtwOiy9CdWebrgW1IcawlFJ4iHD6vRjUh1uG/zec?=
 =?us-ascii?Q?11+ORtM9sJGaj9cP+2g7PzRoMSKBhHWcY0NZVWmtl9CfQ27NTMSeDsFulzc8?=
 =?us-ascii?Q?b/MALS18Qa8Cy3q4mlSvSOFjKze7nYy1KKUXEyFPYKKr3PzS2ssPTL8B3Tz/?=
 =?us-ascii?Q?ZrdT5h1DeBeigpDgNyMAZmZNZ4fo/Ko6DgwVOIaYCJxPdhfR+aIccdiRyPa3?=
 =?us-ascii?Q?HSe8+e3gTo09VQ/wmHPdwoEDaLpsLDKmSuzFHiT7qq8tgNdMkBdaMsB5j47f?=
 =?us-ascii?Q?u+3vu0DeQKPB0Yn+MyFOZ8SlM4qTLBvTRk2wwrZ2QAQMAB3AJrUmXNekKbCs?=
 =?us-ascii?Q?j1jsamrNL/FmODD8xIUd0tLTvPt6uAK7i7BQ8baPzaj33SrotAL4WT8jvZN1?=
 =?us-ascii?Q?p6Ur5vOoArCPHqXzakyBmD4M1glQHY9Ri4MQi6uC5RMbFDyPhA1ZgEpP6kOZ?=
 =?us-ascii?Q?eiscYFk3G+tyUZfcRG/pEnN/TyeZkwa+7LqgWAdU0W8OkB5VzmyS3eRAlLzE?=
 =?us-ascii?Q?im0GGt6y19xzIu48GVdAC5RgMja1ln3py85NBtEdvHbnY3Ap/qosVKEXJAoD?=
 =?us-ascii?Q?ierZirSvMMhm7CLJvVFvH/j7bDQVj8Wj6pg20g6CAg91/Dci+/JbqgD1LOEf?=
 =?us-ascii?Q?K2Mylh8y5CNz5A5t9KD7cNSfM36i9TPpooL9q+NIz98GGu+qGDQOf5n28FIh?=
 =?us-ascii?Q?NmDQebRXXnNsnItbTR/6Bs4HVpiVxUUhlEr6NVAlapEbIa4s+oxcHuHQxV26?=
 =?us-ascii?Q?LsYJRmBAyFICvWS3P0gyiHfU+tNKZPLiUYlEw6/0O8PjPS5RoXuYRY5p4TiP?=
 =?us-ascii?Q?n9LIRYmPESYw7/88hc9icy/KPtz/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JyA7wxuwLPaCF3EcnrRBC73xZa8dfuOohedyR+aSoqD0+zpU8IKknEzVyRgy?=
 =?us-ascii?Q?2lrN/joB4zCH/sPMEwfBYE7BISZczY63vf8uTBjBop7qhhrSwk/SFm4BJWW2?=
 =?us-ascii?Q?4XpjH7MQmxeH1/AoELfHTu3HPCyYVPTEg7JoNdAeGL6Nph46HOK1GXK69s6p?=
 =?us-ascii?Q?hDrX5yLXVOJoIOu6evetyjB0nJxq1RIRr0UCaMK5RoMM4S9gmdIbVNfi3Hs9?=
 =?us-ascii?Q?GhFEw5muG1G0CL2TTNo/BR2f9Pgt9ZB9bvx9c1P4RAnS4K+p4MN7i5qizrFj?=
 =?us-ascii?Q?eQkia7+BMi9qMxn1Vj78ZgqZvr3G2hirJB7zaYXmffKPtOjRSWKc7SRnfq/b?=
 =?us-ascii?Q?ln83yGgW9R03NLqjvTPa1xbk2phgSuDGVmbk8EkTzoDaMT870qI6IE353QSd?=
 =?us-ascii?Q?GGlARmfQqrqylElcT8iPvxtCE81N+BVuh92OLSduswJUvFVQ3dmDBIPt2bkD?=
 =?us-ascii?Q?rt5/zejjJ/wXKwBxidOz2e1gype1eQbNCcX3v/SpnS/Tpzoof7033Rp/Wjj2?=
 =?us-ascii?Q?Bazwkuy8WcHHaMYMOet2I35uEUPheFppV0gmCnG3vGOC8L4UGwMJuY+mG7w9?=
 =?us-ascii?Q?kml2ONDX09svfSDm9qUDYirHD38NPQNzHfYaM/PRLhUhLU29t0czHizvbNWR?=
 =?us-ascii?Q?T4spIO5yxSMMZNgASyx7zsrpdZuhL2AeRMLBRhnY5m4r+lr77Rh1UfBuzs3D?=
 =?us-ascii?Q?cgwmh8of/BiCem2llbKeiqMnNzb7VH8+gjFEL/bUN7On/ViIRkOvS+Lm+6pz?=
 =?us-ascii?Q?Eu82dlrkAqD4H5qxqxx3aizQi93p50mLHzUrScvXDcY4UX+8wXvxswEwNiRi?=
 =?us-ascii?Q?CzQq4K9pv27OvOoD8OPn270QtVS+nzjKPMkRYYhbI/2I8R4I3w+q+CUwqzhm?=
 =?us-ascii?Q?KxtrLKjfYIv13p4C0Lq3j5ORMIVtY/HxADNQ8upoyJNu521NRwA7f6q3N8R9?=
 =?us-ascii?Q?ZBKF3oque/VQUKN4Hxv5GVnSz99IyWcr1MDB8LgRv4qQN6ZMPfmOVgwgVzh9?=
 =?us-ascii?Q?H8ibT5PwspQi/+O8Y4NlkXKPJ8cgVW2Al9WC4L4m+amD2jWzhCZCOdkAiWvJ?=
 =?us-ascii?Q?ZZJaRnOhZRTwCMgx8/5CMu/mYbHRTeu0l39bkDHeT/iHMfp5sV22k+ftkxNa?=
 =?us-ascii?Q?jRbm6zYtdA+dMlbQkiaGRVyTz2WKdDddQlrEZVe1trKoWa4BZ7AVajYbktPV?=
 =?us-ascii?Q?3wy3J+2+QMPWXAzrx6mtalg23EJII5xVvQNxAhaMwLpQlYDOO5a7atNa/oKP?=
 =?us-ascii?Q?56B732bDbfsJsQokCqbTS2Yw02I7aW8Naf37m6wbNokX3nC1nVtGPWovSoXi?=
 =?us-ascii?Q?q790nanStbBPW9i1YSNYW5/mACmWlIn/cyu5Wx/T2BxJcIHEiiTa1jnnP7Xf?=
 =?us-ascii?Q?T4ywZsLd3/10qDId8xxhc1jJITO1MRCRwQKecJsl0Z1eRFWbjYjLPBgFpfcR?=
 =?us-ascii?Q?JsqG9h8LGohFo1mIMms7FfLCEaJ3SMt/xHqySZ5mkA6sBbG2iFK9gne/R5Xy?=
 =?us-ascii?Q?k8cxRY97REPJ7FP6eyowokrHKvFj1UU71waaqLpRWI7qRHozQWOudjXsgkR2?=
 =?us-ascii?Q?EIUE7eWoKtxO9ecmlI0xWQukSxsViuogdJh5X8Der3Kb06jJegbhuBBQNgNm?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 714918b1-4c2f-43b5-c7da-08dd72f99a00
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:50:51.4698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LGtnyAj1M/Jv/9ab+4xtGOtiynwtB6dK9kN/dyl0DE7mjmvLWKurFU6P5dF0tTp7y78jgw0zctXfxx2ka5aAahQVAVLYzLrk04zZKqjL18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6018
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

On Thu, Apr 03, 2025 at 03:55:52PM +0530, Riana Tauro wrote:
>Add survivability mode document to pcode document

Add survivability mode in the pcode documentation.

... One additional line justifying why this is the proper place wouldn't
hurt too.

>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> Documentation/gpu/xe/xe_pcode.rst          |  7 +++++
> drivers/gpu/drm/xe/xe_survivability_mode.c | 36 +++++++++++++++-------
> 2 files changed, 32 insertions(+), 11 deletions(-)
>
>diff --git a/Documentation/gpu/xe/xe_pcode.rst b/Documentation/gpu/xe/xe_pcode.rst
>index d2e22cc45061..5937ef3599b0 100644
>--- a/Documentation/gpu/xe/xe_pcode.rst
>+++ b/Documentation/gpu/xe/xe_pcode.rst
>@@ -12,3 +12,10 @@ Internal API
>
> .. kernel-doc:: drivers/gpu/drm/xe/xe_pcode.c
>    :internal:
>+
>+==================
>+Boot Survivability
>+==================
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_survivability_mode.c
>+   :doc: Xe Boot Survivability
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>index cb813b337fd3..3d59753eae34 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>@@ -28,20 +28,34 @@
>  * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>  * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>  * such that it enters survivability mode when pcode initialization is incomplete and boot status
>- * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
>- * survivability mode and provides additional information required for debug
>+ * denotes a failure.
>  *
>- * KMD exposes below admin-only readable sysfs in survivability mode
>+ * Survivability mode can also be entered manually using the survivability mode attribute available
>+ * through configfs which is beneficial in several usecases. It can be used to address scenarios
>+ * where pcode does not detect failure or for validation purposes. It can also be used in
>+ * In-Field-Repair (IFR) to repair a single card without impacting the other cards in a node.
>  *
>- * device/survivability_mode: The presence of this file indicates that the card is in survivability
>- *			      mode. Also, provides additional information on why the driver entered
>- *			      survivability mode.
>+ * Use below command enable survivability mode manually
>+ * ::

same comment as in patch 1. These "::" look misplaced

>  *
>- *			      Capability Information - Provides boot status
>- *			      Postcode Information   - Provides information about the failure
>- *			      Overflow Information   - Provides history of previous failures
>- *			      Auxiliary Information  - Certain failures may have information in
>- *						       addition to postcode information
>+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>+ *
>+ * Refer :ref:`xe_configfs` for more details on how to use configfs
>+ *
>+ * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
>+ * debug information
>+ * ::
>+ *
>+ *	/sys/bus/pci/<device>/surivability_mode

/sys/bus/pci/devices/<device>/surivability_mode

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+ *
>+ * Capability Information:
>+ *	Provides boot status
>+ * Postcode Information:
>+ *	Provides information about the failure
>+ * Overflow Information
>+ *	Provides history of previous failures
>+ * Auxiliary Information
>+ *	Certain failures may have information in addition to postcode information
>  */
>
> static u32 aux_history_offset(u32 reg_value)
>-- 
>2.47.1
>
