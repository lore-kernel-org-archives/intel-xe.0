Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B688AC54ED1
	for <intel-xe@archiver.kernel.org>; Sat, 28 Jun 2025 14:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E4610E15C;
	Sat, 28 Jun 2025 14:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMdc5vQ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE0410E15C
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Jun 2025 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751121246; x=1782657246;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FMNqEgNY5SkfuyRdEOk33gfnDgVvbzdxhzVA67SwX04=;
 b=bMdc5vQ3pGt63myk+KUWvdErRrj3hNmwO9qRwGamSCQYbpFu7yJq/8xf
 0XQc1v3pnnke3cElCz6tkpXoz5AiFnpKmPCjpUEvq/tZsC8r8lyLxQYxk
 cCKxHTCpYIJx9CMPmtlnPvuQll69bcWnIOzGLtjrUDqsTXq66ZAOzlq/u
 I1AG1OtIFjcweRc894dxllWXvcvErAWbP2gupj4cK8PPB6F/C9I6mw0gR
 DWCRD7ncMxlwDPsQID1Hjdw6i1oLGxia/CxvjsTgd3VO3eljGRIHLsPBc
 QyDZ8lY//Fr0vr47jIbTPvp+3qPNoHxgjGW0E0+HaKGbIMumqSyz9PeST w==;
X-CSE-ConnectionGUID: NaC8Ek58ReOxw8k989cT1A==
X-CSE-MsgGUID: NZhubO3WSxep/8CLzjYC4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="63663675"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; d="scan'208";a="63663675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2025 07:34:05 -0700
X-CSE-ConnectionGUID: wusF8jIzQpSHzeonn8VTUw==
X-CSE-MsgGUID: DAo4B73ZSTOBdj1Ja2oPEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; d="scan'208";a="152775657"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2025 07:34:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 28 Jun 2025 07:34:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 28 Jun 2025 07:34:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 28 Jun 2025 07:34:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1sX7d6l4vuuGX+aTl69+eje5pbHBfDF9R4CvTIEEC9hay2Jy1J838gI2ZseA2Q1dIKfvlXGHnYH4IFRvLqi+vH7lOcA7bhZ1HtJZwiaHKYxHGEoUQO2jBAei471rtvA2cYBtYXHtSkPk9DpQKkimA56Iw7rAWEkzMfaz81RJzHK9SCPq4uo06er4/tD8c1TqddsK4GHs/VDH6t87LUiTiVR7UPZvr/DK4Ec0E31nrV8r7gaTxBRE0QaOIDiFd0qXTaKzwhHSKboWiQ986apL9emh+vIW6jbKqfcZZiFkwF/m2Lz7Yen9y80qKvX95CAlouPg1JkcQoWjEFHkdGkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP5YvX71B7W84jCeDtdHGIz29fVbqM+0L0jP/+DPgII=;
 b=clScD9L6HOwzRymC50RwKJFsS3n0UIIBaeX+DpCis06RBSAIpCLHIY6BwpaO31MldSOE4mq4u9pjqrLQlcn8fyZmG0ROIYUwSWLMY7XOXS00NhutYknDYyaUWnKD7s7kF0kV8p70e5HnU8XjHpr7JJ9uiKYJEla5Z8dQmhJv/3T2ZvOYM6rkxftdjiCT+pvcbGvniqAdaSY8SyNkfT6c+pjm2CDuLEzslYjvfJtE9pnqIKT/vGnuZRBcnZzwm+cpFLNxsWUoHhT8hV4fQNJEAQBmBuRScpId7HpVLK2tHnR9S30TMBOcF5gDXOUR/b4h5AuN+1+H7IRZiPwVMHSG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7287.namprd11.prod.outlook.com (2603:10b6:8:13f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Sat, 28 Jun
 2025 14:33:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Sat, 28 Jun 2025
 14:33:48 +0000
Date: Sat, 28 Jun 2025 09:33:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
 Harry Austen <hpausten@protonmail.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 0/2] drm/xe: xe with/without kunit
Message-ID: <2iyam53uwxh7z3d5kxgkwvtays6dv7ywyrp2mhupplsoaemovo@xarj3h7jolu2>
References: <20250627-xe-kunit-v2-0-756fe5cd56cf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250627-xe-kunit-v2-0-756fe5cd56cf@intel.com>
X-ClientProxiedBy: BYAPR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7f73e3-f29f-4e75-c318-08ddb650cb36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?juTilHW/ZvEuobmhP5toZNONNZmuiT/R8f9em4dioY+lRggAe5WYiSQA8oxH?=
 =?us-ascii?Q?rw1xx7+k4fGSGbo5HysF9CEXY7VhxifPkxN4inc+lVaTp/+LLOYpM0SRhPCN?=
 =?us-ascii?Q?CvTGwxtYkGgAzOiT1rELnSXCYgcLS8UXB1u2els1Fl68w+jEJ6JshDAHZhSm?=
 =?us-ascii?Q?/Ob5II75/MtFl4za3WmMiSNY6c3zlwHy1vjtsMKC1k0AG9Z8zT34tQGjT51h?=
 =?us-ascii?Q?+6PHt544RFwH0KHrvSRW3u8PL3u4KIWZRpKSaZvH1Xko6N04XIR+oFrL/Eq+?=
 =?us-ascii?Q?uJNATnxugMNb10AWh6VRW+S2d+fsQMeAPh+4YXCBJfIljO5U9niBmuob7f3u?=
 =?us-ascii?Q?00oSaIg6rTTKOnrvmbqtKsinfitYJ76TpOnzgG7QMEx5z24Slj5x7qscmaVC?=
 =?us-ascii?Q?Hzly+BauAOILrtf2Z4XSzLXMuasPRuQsOSNJUJ7uKeaKV8ur4z4noIrxqcfi?=
 =?us-ascii?Q?rARmNiX5gjH+2ZNpYi6WAHACgXQRLUJkpI/CPAKj4MtMQ4q5jzpLF1QqA8If?=
 =?us-ascii?Q?Nfot0U/TAbbRRKLI7Bt4ygyVFcVEJXYqaMlLstGZTEJrhDmDKokSYj3+UhMH?=
 =?us-ascii?Q?9Sh4nzH1KHrqPtFLND9k3sn29t1OJpfgZf27jwUEP5b4EJTfJbmkJznlda4j?=
 =?us-ascii?Q?+fBTCJioxCwsc10h3wiTAL/9mlbQxU5a/oP/k3FRHCRkW0hDSFd19dNYU9wY?=
 =?us-ascii?Q?DMybsekkum6qFD/svGADbGGaHKvxR19KZGum46MoguIAhzLuAKOGI4FVOHk/?=
 =?us-ascii?Q?mGmuZeTcuz72dwPk/4SBqror55EkIoJA7Ixw/yuizeVeVCiHXhINXTlOauSj?=
 =?us-ascii?Q?Z/dSlkMWezWE+JPAIAvKMNKhMTsC6oEwVFcuxpOWrhgqlejC9Vmxa6lXYbtb?=
 =?us-ascii?Q?bmLTRF+YGDKdQuRVVjDHgz6cDEVNRU4vJTBcPagxTlM/0dZcppm1ct50XtD3?=
 =?us-ascii?Q?w8vLJQcFCr2b9kEXVVj1bg/DyIUj1kKN0x3PbZV+c0uJfb+sIPbVhCfQbgbF?=
 =?us-ascii?Q?K+Mk96Gz/1+1hTfLArBFUSU9YQ2aLGVYi1QesKK9dJIgHZgUPppKsnil+M4z?=
 =?us-ascii?Q?khYeIyqtycKWZAo+DF1Gxfa92/Rq0t21JDfokaX5SRmQFBWijb4mT8NK6DSS?=
 =?us-ascii?Q?A3lRjC1wsXW8k9np4Rjhx2Vf7kmq6KSKvJNT3dGyABzru14aLdQBVTTHppWY?=
 =?us-ascii?Q?ugMoTfT2xwYmEmsd3b/wwtv+/XV1vixrqoG9rlZ62ixZyHC6/4b8o7gm2ZKS?=
 =?us-ascii?Q?Im9a+WjqjmFZ3+1H6SV5G0H0mMwtIKqx2opG4wWEU7gKEY3QVXk9G95oScH6?=
 =?us-ascii?Q?b2i2VSPeQCNXuR84Mp635u30trakcfQm++1aFB2S2cVc9dKNOcy/AVm7Kxj1?=
 =?us-ascii?Q?sJHWp2AVB6b2F9QTlccDWCJnH5e6gXf+orjFmU/3RIa8juI+Djs2RkmnhoJI?=
 =?us-ascii?Q?zXbPgiCcvlc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ILcNCGukiWFgqx+BvhNdouqp6ZRbg2hgwVgqIFfkw3e5ZWzSOOBD3Ep3r1eR?=
 =?us-ascii?Q?yPYc85mW776/bCbkMDynziAJQu6m0TQ+EKz0PVc9kDtirwCb6ilVKKgcVbnC?=
 =?us-ascii?Q?iD6Av4XihvUr+zJ+BoxnLVYDXQ1O1aLXzps2trZBzhBTtNuTUPnuNFw+R0hv?=
 =?us-ascii?Q?OdViHNGXwCIA0axQiW6/q9a/eDSGBD9gwESHK90kAt9oYAGXahyC28IRqd9X?=
 =?us-ascii?Q?1c76403OQEW/Q9u8Toaz1I/X6qVqFUIswDhLTtd3dUH9qNC8tLLJexUA8hUT?=
 =?us-ascii?Q?L3J3tnc6pjco6HzYNgxQOHiMfx3qCJ/sttXpaOizoF3XFPzLSMVmzgj/c3kW?=
 =?us-ascii?Q?u72cetNHsHWjL2i0y60Qt6uJonn1EMCwzIjxzCv+prI0at/z0oJRdCucMc9R?=
 =?us-ascii?Q?GJu3nVxw/GlmSIpUInkcy27bmH8kSMSNp2/Rj+pTu4RPgqfLijf3+CfJpZXq?=
 =?us-ascii?Q?0rhRC2rjIeWUb/FauFR8AvlJfObfEiAi4zmBXHWyvKKQxBirYNn3SnRjJYz8?=
 =?us-ascii?Q?c7i8+lOBiDULDaCGNRdgQv+dkdvoSG0jl1ajIB6rwDRRQN1sOlZJ90TfSxPr?=
 =?us-ascii?Q?H9zAxQ0YfotsB7idumKNBct/VW3Jxtzatf04oCtpZabKh3N+NhQ5GEgkVKZm?=
 =?us-ascii?Q?XEJqFQDQHBjYw8PpKFERQKavgMFCnWf6w3YAXO4KrN4IHqN+Ule4obg9RiN/?=
 =?us-ascii?Q?pfpRECTWjzQzQtsw1RcHDSAmNBfynou+FFxTZ2OtSOW1D3i4/6iZMRdKrInO?=
 =?us-ascii?Q?qCXfRlMWBJuyiyzoA3uOMtN4FKBTP+Hc0df8EclZWL753kH3HNFHxjSHmrnD?=
 =?us-ascii?Q?isu3uKLEDRExQwGTECKyx2ci/5iJN5/+7tQzs148FEKe1qnDQ4ueUe8KDxUC?=
 =?us-ascii?Q?6/5R7vVvP1XqPkVg28vXnp0PeQ9C7EBtibjjR5IWUo+AE1p0MErB0Y6yTfTI?=
 =?us-ascii?Q?JPtx9fVyhr7Zdw1lVhcMoiN1BcEUTk2gSK5LRh7rPXDP3mbydv7HCUhrdIRb?=
 =?us-ascii?Q?rEHCwIqwp43NnozaUMzJWGzOlMhzNK77SzxQvTXSQ4A4dTY2hNExWJVD7C6O?=
 =?us-ascii?Q?5/bb+WlPp3nDOrXhbRKRq2pZ2+cyYq2gGUHZUNgmaxsTqQqijlpK1fVbe4F/?=
 =?us-ascii?Q?mpxq9db6nUquWDIawOWsb/DJ/h5ncOsfoEk55OyXfi6YZ4QVpCsgC5/MxPo4?=
 =?us-ascii?Q?SGFD4VP55W/zizTPoHE3vrnQH/fn65gLN1FxMAKHjPnnjMZj+CiIG6us8Bz6?=
 =?us-ascii?Q?lGVuZFSReZcDMEeOUrQU8oku8/iQsuOsrNn9HM5l+8nyEsb/HkRCyDmCuOuf?=
 =?us-ascii?Q?56tgAn13e8rviQqajqROKTe08DYxV/wvP2JLwIB6JAbqHme/Zgi/Ufqdk0aU?=
 =?us-ascii?Q?EFmiCXHJlCsVgJHuiT+chxPEvO0dmgIL5Vdslh/rkRR2EXq5aWC/0EJuHoGB?=
 =?us-ascii?Q?lFPIeLWULw4B/fksk8Sv3IMZC+a6JrDk783sawJUEZctq2UG2s9ZhQKpRT37?=
 =?us-ascii?Q?DoJUI7yh8PDP0jEvUydWNuysN+PphdIStV7kGccaFJqXP9gwuSFuxsHEExmj?=
 =?us-ascii?Q?0HSA0l8Po0mC9nLqiN7X3k2/fOv6Ijkjzj6onrxdWhWRfJKhMYSkxWIvvt9W?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7f73e3-f29f-4e75-c318-08ddb650cb36
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 14:33:48.1967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9X05hWKYO95mdi/YLZNe5BRngzHKfr9CW9ZGz4fHT3V9I5UAzHUugGnpeZhlVt6W/gvWDTXYS5XRUc14+w3dKtIqYfxIVMK6WUpbv/v/lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7287
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

On Fri, Jun 27, 2025 at 01:30:33PM -0700, Lucas De Marchi wrote:
>For the second patch, original version is from
>https://lore.kernel.org/intel-xe/20250516104210.17969-1-hpausten@protonmail.com/
>
>I took that and kept only the kunit part as mentioned there.
>
>First patch fixes the bug reported when building with
>
>	CONFIG_DRM_XE=y
>	CONFIG_DRM_I915=y
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>Changes in v2:
>- First patch should be good enough fix, so reword it accordingly
>- Link to v1: https://lore.kernel.org/r/20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com
>---
>Harry Austen (1):
>      drm/xe: Allow dropping kunit dependency as built-in
>
>Lucas De Marchi (1):
>      drm/xe: Fix conflicting intel_pcode_* symbols

Applied the first patch to drm-intel-next and the second to drm-xe-next.

Thanks
Lucas De Marchi

>
> drivers/gpu/drm/xe/Kconfig    | 3 ++-
> drivers/gpu/drm/xe/xe_pcode.c | 6 +++++-
> 2 files changed, 7 insertions(+), 2 deletions(-)
>
>base-commit: 98f015a92833e2d04fda89e1657a13d7290403e8
>change-id: 20250626-xe-kunit-20c0199723b2
>
>Lucas De Marchi
>
