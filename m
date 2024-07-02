Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE849C3065C
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 20:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4CD10E318;
	Tue,  2 Jul 2024 20:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2tQusDY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E795910E318
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 20:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719950969; x=1751486969;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LeMZgfow75YCq5P34JDUHUykWh2AWpHstRlpeZRGECo=;
 b=A2tQusDYxwLNfTnQ+cFxiWHI1WPoINwIg7OmIQtMuW0IxMvQfmwDC+XS
 /j9ayys4vLTjYxqwzh8lELqvq2LJUCbhCXQFItmzuZrnrLbQXWbcniOlw
 3xNrZExYBcaPV7QGZdE5YJHZbVsbXnBfAX4pszYQ2w1iFypBR48mj8xeK
 iBtUOQc0/tmnXNrBnW3ZekFieVxaJfAgqV/BLSCTcbqRUF7U6YVhW74Qb
 nHHmOyXgvr9uZAnK/5LZL0O8tAQMdahqWz0cM12TJJg3yEkZ7/fpWcCNJ
 r0oxLN8UehWyEE0XU4v6vqKXG9Q9CFboU2i/iN8uBUgiSODDh4KIdV9gr w==;
X-CSE-ConnectionGUID: W9lCw6K/QnyGvMkCH8xLDw==
X-CSE-MsgGUID: NuLFnn8rS3SlxrcQJyM06w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17100705"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="17100705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 13:09:29 -0700
X-CSE-ConnectionGUID: VqemWvTaQVqUbLYdmUF8KA==
X-CSE-MsgGUID: HyYos+XWR066GywxhkB1Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="50862880"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 13:09:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 13:09:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 13:09:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 13:09:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 13:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgRdI9Dt3qmXI400kLOZqKvJTsRPurdCUmnuu4cfQ4Dyfc8bbhBmaKzXvPkf84rpOP8i76thsSyXAZW04gVDC7QWbpo9olrrw4bAMQMAjy2UzViFc9/+c1qFpCWrvcKhttV3bOLOQeWv2fsT5/GFeB3/uNYvnROX6RASi+9dp6HMJrzFOpisiglHe7HzQdZhxJvDuWH27r6lDBoIGAGzaqsj4DuG1DMmEnls36fEjq/c8U06xYcy7ystuVDy66Ymv7AntXxCepglp0euxqsHsXUpXt3avuTAB4IKdGwtyMFp9G18X3ahL/jSjcvyQ9XabI9kgM5jToW8cpPwRCYiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hev2EUGT6IBxyB9Zt3K0PN5bvU72OnEfnBz8ZIm5wQ=;
 b=XraWI9VCGPeFz+BOiH1QkrwX0xfHOD42KQJYZiRRGgLBPI22NvE+JbTGxaKn+XZ2lXaGYFQ0bJgQlLbn3Oow4plYYYGizFMqMsVvHUAeJWLKpPAnQlXrUlXeLVQ3erWEzg23qjJSS0Fj+I+z5o8dJQs9YaiEiXOCsEk0Uc0ctN8y7HRZ0Tp8iBYNPg7yIY7rE80lM/S1V1+3LEwPUpniftjBmfPI5DwHKSFX47j+btsMHAjwQCa5hHc8E29AISK6EEAZKNUL/fQQSTVosyy20y5c+FPfc1cJQpJd5yiTzrmPKUQkxQCx9DrCxvPneNwGejrc1an5vx+sFbrFmXtRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.39; Tue, 2 Jul
 2024 20:09:24 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 20:09:24 +0000
Date: Tue, 2 Jul 2024 16:09:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Dave Airlie
 <airlied@gmail.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Jose Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/obsrv: Rename xe perf layer as xe observability
 layer
Message-ID: <ZoReaBy9J0YfQFP6@intel.com>
References: <20240702160740.2487279-1-ashutosh.dixit@intel.com>
 <ZoQo5F7cUsM3VZKE@intel.com>
 <87tth7a9c3.wl-ashutosh.dixit@intel.com>
 <dnkulc6j3c25f3powx5kltuxv3qak6oxbilqj3uog5lwp3ikna@6mflfe2vdmyq>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dnkulc6j3c25f3powx5kltuxv3qak6oxbilqj3uog5lwp3ikna@6mflfe2vdmyq>
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e66bdeb-b88a-44f6-dc1e-08dc9ad2ddee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9y82WbafYrAOfJuTul6m83uCUQuRowUQEF469oMKjLelqoSfPhIig1cVw7?=
 =?iso-8859-1?Q?6wZbmKOWo03AAkpQZDIAqafJO89z2pjsJsH2ScZgeCS0tjcMg6NsRXbWCu?=
 =?iso-8859-1?Q?qyU1+G2GAQhDtoQnz7ATxHH++71GjfW7sl3z5dRM/ZSl5HgsCFjabuaVdK?=
 =?iso-8859-1?Q?SmylJ9rsgBMC1ZUpr4i8CP1loJoUG0+Nw6EXLlXjohpl35D8WWZOy9kU+O?=
 =?iso-8859-1?Q?hyuu87iaayxhK/abnLUVPPhTLFifRWY201RA9ZH733EasmgsjNIAYwmKoy?=
 =?iso-8859-1?Q?vvjU33qEgbrLnhvEqlB0R1YXKikcvxgP7tUVQSFDs9PShm+lD92OhJBgfd?=
 =?iso-8859-1?Q?bgdl8K6Y8blcefqbLYjaV57JqaSwjC+Ct8xDvVXe895D+/UUrwg92vf5Qb?=
 =?iso-8859-1?Q?BPKcPtCWz75WQJYV8+dxMG4ChONuU4OcmyCemiehM/HZCIhvR+wtdfuJZW?=
 =?iso-8859-1?Q?6oX5Sc82EGhL3Xy4AyVUVgc6HcDYP1NZikCqfHV7cfpvI2Or+R9GKu1zvE?=
 =?iso-8859-1?Q?kZ/Uf0Li9mXwpDM9UF+yxkXqW684PYlh9p0vwVOkSakxDMLakFNM4Q7T7R?=
 =?iso-8859-1?Q?Pmpm3NA+RvMoXRlvIlEnFy7A+aREOQGpRvqx6bVfBRyXsANx/jRFCGJK+u?=
 =?iso-8859-1?Q?/FhATXNaFFB7wkHlsHT6tLJM8v6cvR7BNgjPiBUOXzkZJGRh09B8h/xQ61?=
 =?iso-8859-1?Q?4BjukXh/FslfTICy7YsjaVhdAG1Hg0jWJP5zkuh3TtkqyAfqkbkdJQg5JC?=
 =?iso-8859-1?Q?dl6Zmf7sIwJBAxW3VtnhYlT7m2K8mseMZmr4tdf1BamCsCka/EqR5tk60B?=
 =?iso-8859-1?Q?kWyILmAncgrABB7ZBEJW9I3QKc8piFgHUfGnkZFBSyI9YNcEr2wJPHPJ2m?=
 =?iso-8859-1?Q?gBrBKWNr+Nx02ioqbk5ohAYlgHuLAOtdgJ+B5CMROrQU0jJACb7ZqxLQqN?=
 =?iso-8859-1?Q?uTY/GRFocDUkXMgNq9xYKrYBYvZ0VhI+zV7bhhNwc1V374Q3iAat4BTIIQ?=
 =?iso-8859-1?Q?1bQ12iczwNnvyBarrOgSgAIf++0x6FtGBP4+PTEL0c3iQ/t3Ts3yHhms8I?=
 =?iso-8859-1?Q?Rf1rkyAe6o3bcC6v+m3C2igf+RJo1YmUROYPOGhevKfFMHBKRhOYtvheh4?=
 =?iso-8859-1?Q?El9Zd0cesdglbpTdYN4cNbUUtyiV3aISFH4oeb/D1Z3Q/BIKwkD0zkXJAV?=
 =?iso-8859-1?Q?XMK7P0CNmDyAAS2bfIFHl9duOv36D/Y5tgcFVUmJ5hiMu9QYL/k35qLm5B?=
 =?iso-8859-1?Q?zv/6tjfQI82nYbBOhK07CT4dPYSHl5HeZhV1Q8Oo9fo5Dv8yF/I3ZD9RTa?=
 =?iso-8859-1?Q?IThJd63p8q/GfpnyvbC8t8eGwxO3NmDYfiCQchNxJrVfrNEw7Nt0LYgqYp?=
 =?iso-8859-1?Q?dPW4ZGRmOaHtFxoEIoKu9BCiNyOxcTfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Jgr6PrOSg2Z1EGYTIw40DVg7F5eDqT2eDPBVsCBsRfpMajmr9Tx41EIQ0G?=
 =?iso-8859-1?Q?UCaK4Xj7rMrfdwipQRQawDfPh4pc4ETbMK6yTTuW8vr8T61g84/EQNpxPy?=
 =?iso-8859-1?Q?nPOuwCmS2uceikET99YKLZQftTuR1l3+k/gmRvyFG3tKNqe3Ox4plTyI7J?=
 =?iso-8859-1?Q?jVqrvQBJCRmQn8WRQxWaVeLmItFNOYMzQ61ZwFQoOiEAE9lq1P1fqWSnjS?=
 =?iso-8859-1?Q?lqpkbKibQveAVcf+7GMHShu8GvCzB47yPMkvNrIKlG3bYu9hHfdhWQjANn?=
 =?iso-8859-1?Q?Na6ktNu8PBSk5toCxL3+fRJbIdSI+65E9+G0f+WStQuOPwzr5aAbLofq3+?=
 =?iso-8859-1?Q?bmmahWMf9h2U705IYoSILuq4dPQSSVq2YQx3wd8uqD/3OeklFLqgYuGsU9?=
 =?iso-8859-1?Q?q8ch/7D5OJYXeocgGUGEjMHCENc3XHX9MaOfH+mn661BzGAMedHiFzgcmE?=
 =?iso-8859-1?Q?3KzR5CDLVEwjK5XKB1Jx0ZdyyMXOUADLoIAkM81B5DY2HEgZlfB7+rNUbE?=
 =?iso-8859-1?Q?6tSpTVCViQ3EJdWUfn5XMJidbuhKRn+Vb3AUfLxWQhUMZUWXPNPRmfUJgY?=
 =?iso-8859-1?Q?KbsVX/DBZ4oxcZQOc1j1tBB6D72ASBzml+pl4TTstD3urGtJ+pb1uIQfAA?=
 =?iso-8859-1?Q?p5iIVLTvJH6Ez6alE9mDYmCM5mXKpoPLULuZRFPWuPK2+Fwy7XEM0TUvYP?=
 =?iso-8859-1?Q?tz+H4WxIw0xQOPidIyzy2Fme8WzumCDDGW+QKlyBKxc7DyxhDDcG1W2KTc?=
 =?iso-8859-1?Q?VyNvcaEfph29Jwzx3u5Tm/KA0TWhUaQ+grlTmK1XH8Nb684Plfx12qqRTC?=
 =?iso-8859-1?Q?XRQoLyFYhIcnQLnR68ZJnwdDkjffv0ujoH7qf4myPJ1Lw+iz1PvConpIbr?=
 =?iso-8859-1?Q?DL76xPtRX/ffXsGNM4FQxtMLNAvbq1vm10Fw1Uo3E64uO/KOiWNLtkrkX5?=
 =?iso-8859-1?Q?/eXbUiCpr62h9f8zy6ej/M2iRAcjS7wxioGh6yx8kjiWOn4dZxXL15kYkL?=
 =?iso-8859-1?Q?qhciVmKXCw3Mr4cu4BkvGSNofwQuVoJLfpWKVERkBFiFy8GK574xNBnHXs?=
 =?iso-8859-1?Q?DQqKXGCFHnAMg350ZtEsCjIxxSMNqAiJALkbZAS5uDeKuQ4zjfqs+Z+MAE?=
 =?iso-8859-1?Q?7cpeVNl8VzULojufMcGMs2V1Az3JFwGu1uLXMChluQ53umUPqsbVKpucW8?=
 =?iso-8859-1?Q?/5gCtdMieUj/kz9XMs9MMJx8mnrHB0dfdYOD65Ke7GZlzGHgE9FL1PUZCt?=
 =?iso-8859-1?Q?V53dbpCuNuPtGZyDX/jkSHOhiRqHUDeo/8m2z19mv+zrBkRPfug5G8liNF?=
 =?iso-8859-1?Q?5RUSKlWHMr9uzrz/5JCQ9xGvhO62m8vGMXsh8srmI7SPY149RoCgr6mCd3?=
 =?iso-8859-1?Q?pkVSB9zIJDDwsv9GOqeCcFS2DLnrAB7YpEJJ38nWk+HRL9MB0MbCGTV898?=
 =?iso-8859-1?Q?reBAMsIBVYICHC8thJjaNizyuSsJgxiowaMg5X6T7aHvOg4qoREubutPfW?=
 =?iso-8859-1?Q?5uoth8gdIgd6FRIeWqyRdxyGCUC/CneczBoflYa/CXcaMGRe0GO4TsI+w7?=
 =?iso-8859-1?Q?cz4/LOOQjmJJPuqn58UEw5Qv8JQHziAZR+PBSgQeu4MnFCzBANcW5ngAHI?=
 =?iso-8859-1?Q?/bxvvYzf9wYTu20ZbFzkQc7G08kDx8QbS3TEMxj+FwpH8S9WYOJ15/JQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e66bdeb-b88a-44f6-dc1e-08dc9ad2ddee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 20:09:23.9924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxfwKud2Er54uVVDhRfONt7S0xV8wpUDI7pVSk9mzfefN8rUBI/9xWrZBv1rGOBqCe3AfRlVCg9OzTwxP+pAHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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

On Tue, Jul 02, 2024 at 02:47:10PM -0500, Lucas De Marchi wrote:
> On Tue, Jul 02, 2024 at 12:21:32PM GMT, Ashutosh Dixit wrote:
> > On Tue, 02 Jul 2024 09:20:52 -0700, Rodrigo Vivi wrote:
> > > 
> > 
> > Hi Rodrigo,
> > 
> > > On Tue, Jul 02, 2024 at 09:07:40AM -0700, Ashutosh Dixit wrote:
> > > > In Xe, the perf layer allows capture of HW counter streams. These HW
> > > > counters are generally performance related but don't have to be necessarily
> > > > so. Also, the name "perf" is a carryover from i915 and is not preferred.
> > > >
> > > > In this patch we propose the name "observability" for this common layer
> > > > which allows capture of different types of these counter streams.
> > > 
> > > Yeap, perf is indeed a bad name. I thought about observability at first
> > > because I always read 'OA' as observability architecture. Although Matt
> > > Roper convinced me that the most recent spec pages calls that as
> > > Observation Architecture.
> > > 
> > > Shouldn't we go then with xe_observation?
> > 
> > OK, I think we can go with xe_observation.
> > 
> > > 
> > > Well, although, OTOH, xe_observ can be applied as short to whatever
> > > bspec page you are looking at ;)
> > > Then perhaps just a mention to both names in some doc?
> > > 
> > > No strong preferences on what final name, but +1 on changing the
> > > name:
> > 
> > Will change to xe_observation. So we'll be opening/working with observation
> > streams. Will change names and comments to that effect.
> > 
> > 
> > > 
> > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > 
> > Also since this is a uapi change don't we need to include this in the 6.11
> > PR? How else will we handle the uapi change?
> 
> yes, this needs to go with 6.11... should be sent in a -fixes pull
> request (since we already submitted the drm-xe-next pull request).

hmmm... I was not very worried or trying to rush this to 6.11 because:
1. the name change doesn't break compatibility
2. because I don't like rushing uapi changes, specially with userspace not
engaged yet.

But since both of you are raising this a must-have for 6.11. It is just
because the name discrepancy for something released on 6.10 and then renamed
on 6.11, or will we really have a trouble on the 6.10 if the 'perf' name
gets released in 6.10?

Cc: Sima and Dave for awareness in case we send this as a
yet another last-pr-for-6.11 or if we send as drm-xe-next-fixes.

> 
> Thanks for working on this rename and I'm sorry I raised this concern
> after it had been merged.
> 
> Once we get this squared we should also update mesa (just checked their
> MR and it has been merged last week). +Jose
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> for xe_observation
> 
> Lucas De Marchi
> 
> > 
> > Thanks.
> > --
> > Ashutosh
> > 
> > 
> > 
> > > 
> > > >
> > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile          |  2 +-
> > > >  drivers/gpu/drm/xe/xe_device.c       |  4 +-
> > > >  drivers/gpu/drm/xe/xe_device_types.h |  2 +-
> > > >  drivers/gpu/drm/xe/xe_gt_types.h     |  2 +-
> > > >  drivers/gpu/drm/xe/xe_module.c       |  6 +-
> > > >  drivers/gpu/drm/xe/xe_oa.c           | 34 +++++-----
> > > >  drivers/gpu/drm/xe/xe_obsrv.c        | 93 ++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_obsrv.h        | 20 ++++++
> > > >  drivers/gpu/drm/xe/xe_perf.c         | 92 --------------------------
> > > >  drivers/gpu/drm/xe/xe_perf.h         | 20 ------
> > > >  include/uapi/drm/xe_drm.h            | 97 ++++++++++++++--------------
> > > >  11 files changed, 187 insertions(+), 185 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_obsrv.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_obsrv.h
> > > >  delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
> > > >  delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index b1e03bfe4a68..21e8ebe10e85 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -96,10 +96,10 @@ xe-y += xe_bb.o \
> > > >	xe_mocs.o \
> > > >	xe_module.o \
> > > >	xe_oa.o \
> > > > +	xe_obsrv.o \
> > > >	xe_pat.o \
> > > >	xe_pci.o \
> > > >	xe_pcode.o \
> > > > -	xe_perf.o \
> > > >	xe_pm.o \
> > > >	xe_preempt_fence.o \
> > > >	xe_pt.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index cfda7cb5df2c..adf6cec662ea 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -42,9 +42,9 @@
> > > >  #include "xe_memirq.h"
> > > >  #include "xe_mmio.h"
> > > >  #include "xe_module.h"
> > > > +#include "xe_obsrv.h"
> > > >  #include "xe_pat.h"
> > > >  #include "xe_pcode.h"
> > > > -#include "xe_perf.h"
> > > >  #include "xe_pm.h"
> > > >  #include "xe_query.h"
> > > >  #include "xe_sriov.h"
> > > > @@ -142,7 +142,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> > > >			  DRM_RENDER_ALLOW),
> > > >	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> > > >			  DRM_RENDER_ALLOW),
> > > > -	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
> > > > +	DRM_IOCTL_DEF_DRV(XE_OBSRV, xe_obsrv_ioctl, DRM_RENDER_ALLOW),
> > > >  };
> > > >
> > > >  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index c37be471d11c..4a51f0152cf2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -463,7 +463,7 @@ struct xe_device {
> > > >	/** @heci_gsc: graphics security controller */
> > > >	struct xe_heci_gsc heci_gsc;
> > > >
> > > > -	/** @oa: oa perf counter subsystem */
> > > > +	/** @oa: oa observability subsystem */
> > > >	struct xe_oa oa;
> > > >
> > > >	/** @needs_flr_on_fini: requests function-reset on fini */
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index 24bb95de920f..005c38fa3b4a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -389,7 +389,7 @@ struct xe_gt {
> > > >		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
> > > >	} user_engines;
> > > >
> > > > -	/** @oa: oa perf counter subsystem per gt info */
> > > > +	/** @oa: oa observability subsystem per gt info */
> > > >	struct xe_oa_gt oa;
> > > >  };
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > > index 893858a2eea0..76002c0202c4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > @@ -11,7 +11,7 @@
> > > >  #include "xe_drv.h"
> > > >  #include "xe_hw_fence.h"
> > > >  #include "xe_pci.h"
> > > > -#include "xe_perf.h"
> > > > +#include "xe_obsrv.h"
> > > >  #include "xe_sched_job.h"
> > > >
> > > >  struct xe_modparam xe_modparam = {
> > > > @@ -80,8 +80,8 @@ static const struct init_funcs init_funcs[] = {
> > > >		.exit = xe_unregister_pci_driver,
> > > >	},
> > > >	{
> > > > -		.init = xe_perf_sysctl_register,
> > > > -		.exit = xe_perf_sysctl_unregister,
> > > > +		.init = xe_obsrv_sysctl_register,
> > > > +		.exit = xe_obsrv_sysctl_unregister,
> > > >	},
> > > >  };
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > > index 4188516a7816..ba23efb49f42 100644
> > > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > > @@ -32,7 +32,7 @@
> > > >  #include "xe_macros.h"
> > > >  #include "xe_mmio.h"
> > > >  #include "xe_oa.h"
> > > > -#include "xe_perf.h"
> > > > +#include "xe_obsrv.h"
> > > >  #include "xe_pm.h"
> > > >  #include "xe_sched_job.h"
> > > >  #include "xe_sriov.h"
> > > > @@ -481,7 +481,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
> > > >					  OASTATUS_RELEVANT_BITS, 0);
> > > >	/*
> > > >	 * Signal to userspace that there is non-zero OA status to read via
> > > > -	 * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
> > > > +	 * @DRM_XE_OBSRV_IOCTL_STATUS obsrv fd ioctl
> > > >	 */
> > > >	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
> > > >		return -EIO;
> > > > @@ -1158,15 +1158,15 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
> > > >			       unsigned long arg)
> > > >  {
> > > >	switch (cmd) {
> > > > -	case DRM_XE_PERF_IOCTL_ENABLE:
> > > > +	case DRM_XE_OBSRV_IOCTL_ENABLE:
> > > >		return xe_oa_enable_locked(stream);
> > > > -	case DRM_XE_PERF_IOCTL_DISABLE:
> > > > +	case DRM_XE_OBSRV_IOCTL_DISABLE:
> > > >		return xe_oa_disable_locked(stream);
> > > > -	case DRM_XE_PERF_IOCTL_CONFIG:
> > > > +	case DRM_XE_OBSRV_IOCTL_CONFIG:
> > > >		return xe_oa_config_locked(stream, arg);
> > > > -	case DRM_XE_PERF_IOCTL_STATUS:
> > > > +	case DRM_XE_OBSRV_IOCTL_STATUS:
> > > >		return xe_oa_status_locked(stream, arg);
> > > > -	case DRM_XE_PERF_IOCTL_INFO:
> > > > +	case DRM_XE_OBSRV_IOCTL_INFO:
> > > >		return xe_oa_info_locked(stream, arg);
> > > >	}
> > > >
> > > > @@ -1209,7 +1209,7 @@ static int xe_oa_release(struct inode *inode, struct file *file)
> > > >	xe_oa_destroy_locked(stream);
> > > >	mutex_unlock(&gt->oa.gt_lock);
> > > >
> > > > -	/* Release the reference the perf stream kept on the driver */
> > > > +	/* Release the reference the OA stream kept on the driver */
> > > >	drm_dev_put(&gt_to_xe(gt)->drm);
> > > >
> > > >	return 0;
> > > > @@ -1222,7 +1222,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
> > > >	unsigned long start = vma->vm_start;
> > > >	int i, ret;
> > > >
> > > > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
> > > > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
> > > >		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
> > > >		return -EACCES;
> > > >	}
> > > > @@ -1789,8 +1789,8 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
> > > >   * @file: @drm_file
> > > >   *
> > > >   * The functions opens an OA stream. An OA stream, opened with specified
> > > > - * properties, enables perf counter samples to be collected, either
> > > > - * periodically (time based sampling), or on request (using perf queries)
> > > > + * properties, enables OA counter samples to be collected, either
> > > > + * periodically (time based sampling), or on request (using OA queries)
> > > >   */
> > > >  int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
> > > >  {
> > > > @@ -1836,8 +1836,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> > > >		privileged_op = true;
> > > >	}
> > > >
> > > > -	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
> > > > -		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
> > > > +	if (privileged_op && xe_obsrv_paranoid && !perfmon_capable()) {
> > > > +		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe OA stream\n");
> > > >		ret = -EACCES;
> > > >		goto err_exec_q;
> > > >	}
> > > > @@ -2097,7 +2097,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
> > > >		return -ENODEV;
> > > >	}
> > > >
> > > > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
> > > > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
> > > >		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
> > > >		return -EACCES;
> > > >	}
> > > > @@ -2181,7 +2181,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
> > > >  /**
> > > >   * xe_oa_remove_config_ioctl - Removes one OA config
> > > >   * @dev: @drm_device
> > > > - * @data: pointer to struct @drm_xe_perf_param
> > > > + * @data: pointer to struct @drm_xe_obsrv_param
> > > >   * @file: @drm_file
> > > >   */
> > > >  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
> > > > @@ -2197,7 +2197,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
> > > >		return -ENODEV;
> > > >	}
> > > >
> > > > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
> > > > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
> > > >		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
> > > >		return -EACCES;
> > > >	}
> > > > @@ -2381,7 +2381,7 @@ static int xe_oa_init_gt(struct xe_gt *gt)
> > > >
> > > >	/*
> > > >	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
> > > > -	 * will appear in OA unit query, but no perf streams can be opened on them.
> > > > +	 * will appear in OA unit query, but no OA streams can be opened on them.
> > > >	 */
> > > >	gt->oa.num_oa_units = num_oa_units;
> > > >	gt->oa.oa_unit = u;
> > > > diff --git a/drivers/gpu/drm/xe/xe_obsrv.c b/drivers/gpu/drm/xe/xe_obsrv.c
> > > > new file mode 100644
> > > > index 000000000000..f04ed4eb86b1
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_obsrv.c
> > > > @@ -0,0 +1,93 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2023-2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/errno.h>
> > > > +#include <linux/sysctl.h>
> > > > +
> > > > +#include <drm/xe_drm.h>
> > > > +
> > > > +#include "xe_oa.h"
> > > > +#include "xe_obsrv.h"
> > > > +
> > > > +u32 xe_obsrv_paranoid = true;
> > > > +static struct ctl_table_header *sysctl_header;
> > > > +
> > > > +static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_obsrv_param *arg,
> > > > +		       struct drm_file *file)
> > > > +{
> > > > +	switch (arg->obsrv_op) {
> > > > +	case DRM_XE_OBSRV_OP_STREAM_OPEN:
> > > > +		return xe_oa_stream_open_ioctl(dev, arg->param, file);
> > > > +	case DRM_XE_OBSRV_OP_ADD_CONFIG:
> > > > +		return xe_oa_add_config_ioctl(dev, arg->param, file);
> > > > +	case DRM_XE_OBSRV_OP_REMOVE_CONFIG:
> > > > +		return xe_oa_remove_config_ioctl(dev, arg->param, file);
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_obsrv_ioctl - The top level observability layer ioctl
> > > > + * @dev: @drm_device
> > > > + * @data: pointer to struct @drm_xe_obsrv_param
> > > > + * @file: @drm_file
> > > > + *
> > > > + * The function is called for different observability streams types and
> > > > + * allows execution of different operations supported by those stream
> > > > + * types.
> > > > + *
> > > > + * Return: 0 on success or a negative error code on failure.
> > > > + */
> > > > +int xe_obsrv_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > > +{
> > > > +	struct drm_xe_obsrv_param *arg = data;
> > > > +
> > > > +	if (arg->extensions)
> > > > +		return -EINVAL;
> > > > +
> > > > +	switch (arg->obsrv_type) {
> > > > +	case DRM_XE_OBSRV_TYPE_OA:
> > > > +		return xe_oa_ioctl(dev, arg, file);
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > > +}
> > > > +
> > > > +static struct ctl_table obsrv_ctl_table[] = {
> > > > +	{
> > > > +	 .procname = "xe_observability_paranoid",
> > > > +	 .data = &xe_obsrv_paranoid,
> > > > +	 .maxlen = sizeof(xe_obsrv_paranoid),
> > > > +	 .mode = 0644,
> > > > +	 .proc_handler = proc_dointvec_minmax,
> > > > +	 .extra1 = SYSCTL_ZERO,
> > > > +	 .extra2 = SYSCTL_ONE,
> > > > +	 },
> > > > +	{}
> > > > +};
> > > > +
> > > > +/**
> > > > + * xe_obsrv_sysctl_register - Register xe_obsrv_paranoid sysctl
> > > > + *
> > > > + * Normally only superuser/root can access observability stream
> > > > + * data. However, superuser can set obsrv_paranoid sysctl to 0 to allow
> > > > + * non-privileged users to also access observability data.
> > > > + *
> > > > + * Return: always returns 0
> > > > + */
> > > > +int xe_obsrv_sysctl_register(void)
> > > > +{
> > > > +	sysctl_header = register_sysctl("dev/xe", obsrv_ctl_table);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_obsrv_sysctl_unregister - Unregister xe_obsrv_paranoid sysctl
> > > > + */
> > > > +void xe_obsrv_sysctl_unregister(void)
> > > > +{
> > > > +	unregister_sysctl_table(sysctl_header);
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_obsrv.h b/drivers/gpu/drm/xe/xe_obsrv.h
> > > > new file mode 100644
> > > > index 000000000000..13cf4a8029a7
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_obsrv.h
> > > > @@ -0,0 +1,20 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2023-2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_OBSRV_H_
> > > > +#define _XE_OBSRV_H_
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +struct drm_device;
> > > > +struct drm_file;
> > > > +
> > > > +extern u32 xe_obsrv_paranoid;
> > > > +
> > > > +int xe_obsrv_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> > > > +int xe_obsrv_sysctl_register(void);
> > > > +void xe_obsrv_sysctl_unregister(void);
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
> > > > deleted file mode 100644
> > > > index d6cd74cadf34..000000000000
> > > > --- a/drivers/gpu/drm/xe/xe_perf.c
> > > > +++ /dev/null
> > > > @@ -1,92 +0,0 @@
> > > > -// SPDX-License-Identifier: MIT
> > > > -/*
> > > > - * Copyright © 2023-2024 Intel Corporation
> > > > - */
> > > > -
> > > > -#include <linux/errno.h>
> > > > -#include <linux/sysctl.h>
> > > > -
> > > > -#include <drm/xe_drm.h>
> > > > -
> > > > -#include "xe_oa.h"
> > > > -#include "xe_perf.h"
> > > > -
> > > > -u32 xe_perf_stream_paranoid = true;
> > > > -static struct ctl_table_header *sysctl_header;
> > > > -
> > > > -static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
> > > > -		       struct drm_file *file)
> > > > -{
> > > > -	switch (arg->perf_op) {
> > > > -	case DRM_XE_PERF_OP_STREAM_OPEN:
> > > > -		return xe_oa_stream_open_ioctl(dev, arg->param, file);
> > > > -	case DRM_XE_PERF_OP_ADD_CONFIG:
> > > > -		return xe_oa_add_config_ioctl(dev, arg->param, file);
> > > > -	case DRM_XE_PERF_OP_REMOVE_CONFIG:
> > > > -		return xe_oa_remove_config_ioctl(dev, arg->param, file);
> > > > -	default:
> > > > -		return -EINVAL;
> > > > -	}
> > > > -}
> > > > -
> > > > -/**
> > > > - * xe_perf_ioctl - The top level perf layer ioctl
> > > > - * @dev: @drm_device
> > > > - * @data: pointer to struct @drm_xe_perf_param
> > > > - * @file: @drm_file
> > > > - *
> > > > - * The function is called for different perf streams types and allows execution
> > > > - * of different operations supported by those perf stream types.
> > > > - *
> > > > - * Return: 0 on success or a negative error code on failure.
> > > > - */
> > > > -int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > > -{
> > > > -	struct drm_xe_perf_param *arg = data;
> > > > -
> > > > -	if (arg->extensions)
> > > > -		return -EINVAL;
> > > > -
> > > > -	switch (arg->perf_type) {
> > > > -	case DRM_XE_PERF_TYPE_OA:
> > > > -		return xe_oa_ioctl(dev, arg, file);
> > > > -	default:
> > > > -		return -EINVAL;
> > > > -	}
> > > > -}
> > > > -
> > > > -static struct ctl_table perf_ctl_table[] = {
> > > > -	{
> > > > -	 .procname = "perf_stream_paranoid",
> > > > -	 .data = &xe_perf_stream_paranoid,
> > > > -	 .maxlen = sizeof(xe_perf_stream_paranoid),
> > > > -	 .mode = 0644,
> > > > -	 .proc_handler = proc_dointvec_minmax,
> > > > -	 .extra1 = SYSCTL_ZERO,
> > > > -	 .extra2 = SYSCTL_ONE,
> > > > -	 },
> > > > -	{}
> > > > -};
> > > > -
> > > > -/**
> > > > - * xe_perf_sysctl_register - Register "perf_stream_paranoid" sysctl
> > > > - *
> > > > - * Normally only superuser/root can access perf counter data. However,
> > > > - * superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
> > > > - * users to also access perf data.
> > > > - *
> > > > - * Return: always returns 0
> > > > - */
> > > > -int xe_perf_sysctl_register(void)
> > > > -{
> > > > -	sysctl_header = register_sysctl("dev/xe", perf_ctl_table);
> > > > -	return 0;
> > > > -}
> > > > -
> > > > -/**
> > > > - * xe_perf_sysctl_unregister - Unregister "perf_stream_paranoid" sysctl
> > > > - */
> > > > -void xe_perf_sysctl_unregister(void)
> > > > -{
> > > > -	unregister_sysctl_table(sysctl_header);
> > > > -}
> > > > diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
> > > > deleted file mode 100644
> > > > index 53a8377a1bb1..000000000000
> > > > --- a/drivers/gpu/drm/xe/xe_perf.h
> > > > +++ /dev/null
> > > > @@ -1,20 +0,0 @@
> > > > -/* SPDX-License-Identifier: MIT */
> > > > -/*
> > > > - * Copyright © 2023-2024 Intel Corporation
> > > > - */
> > > > -
> > > > -#ifndef _XE_PERF_H_
> > > > -#define _XE_PERF_H_
> > > > -
> > > > -#include <linux/types.h>
> > > > -
> > > > -struct drm_device;
> > > > -struct drm_file;
> > > > -
> > > > -extern u32 xe_perf_stream_paranoid;
> > > > -
> > > > -int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> > > > -int xe_perf_sysctl_register(void);
> > > > -void xe_perf_sysctl_unregister(void);
> > > > -
> > > > -#endif
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 12eaa8532b5c..b80d0b0d7bb2 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -80,7 +80,7 @@ extern "C" {
> > > >   *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
> > > >   *  - &DRM_IOCTL_XE_EXEC
> > > >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > > > - *  - &DRM_IOCTL_XE_PERF
> > > > + *  - &DRM_IOCTL_XE_OBSRV
> > > >   */
> > > >
> > > >  /*
> > > > @@ -101,7 +101,7 @@ extern "C" {
> > > >  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
> > > >  #define DRM_XE_EXEC			0x09
> > > >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> > > > -#define DRM_XE_PERF			0x0b
> > > > +#define DRM_XE_OBSRV			0x0b
> > > >
> > > >  /* Must be kept compact -- no holes */
> > > >
> > > > @@ -116,7 +116,7 @@ extern "C" {
> > > >  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> > > >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > > > -#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
> > > > +#define DRM_IOCTL_XE_OBSRV			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSRV, struct drm_xe_obsrv_param)
> > > >
> > > >  /**
> > > >   * DOC: Xe IOCTL Extensions
> > > > @@ -1376,66 +1376,67 @@ struct drm_xe_wait_user_fence {
> > > >  };
> > > >
> > > >  /**
> > > > - * enum drm_xe_perf_type - Perf stream types
> > > > + * enum drm_xe_obsrv_type - Observability stream types
> > > >   */
> > > > -enum drm_xe_perf_type {
> > > > -	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
> > > > -	DRM_XE_PERF_TYPE_OA,
> > > > +enum drm_xe_obsrv_type {
> > > > +	/** @DRM_XE_OBSRV_TYPE_OA: OA observability stream type */
> > > > +	DRM_XE_OBSRV_TYPE_OA,
> > > >  };
> > > >
> > > >  /**
> > > > - * enum drm_xe_perf_op - Perf stream ops
> > > > + * enum drm_xe_obsrv_op - Observability stream ops
> > > >   */
> > > > -enum drm_xe_perf_op {
> > > > -	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
> > > > -	DRM_XE_PERF_OP_STREAM_OPEN,
> > > > +enum drm_xe_obsrv_op {
> > > > +	/** @DRM_XE_OBSRV_OP_STREAM_OPEN: Open an observability stream */
> > > > +	DRM_XE_OBSRV_OP_STREAM_OPEN,
> > > >
> > > > -	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
> > > > -	DRM_XE_PERF_OP_ADD_CONFIG,
> > > > +	/** @DRM_XE_OBSRV_OP_ADD_CONFIG: Add observability stream config */
> > > > +	DRM_XE_OBSRV_OP_ADD_CONFIG,
> > > >
> > > > -	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
> > > > -	DRM_XE_PERF_OP_REMOVE_CONFIG,
> > > > +	/** @DRM_XE_OBSRV_OP_REMOVE_CONFIG: Remove observability stream config */
> > > > +	DRM_XE_OBSRV_OP_REMOVE_CONFIG,
> > > >  };
> > > >
> > > >  /**
> > > > - * struct drm_xe_perf_param - Input of &DRM_XE_PERF
> > > > + * struct drm_xe_obsrv_param - Input of &DRM_XE_OBSRV
> > > >   *
> > > > - * The perf layer enables multiplexing perf counter streams of multiple
> > > > - * types. The actual params for a particular stream operation are supplied
> > > > - * via the @param pointer (use __copy_from_user to get these params).
> > > > + * The observability layer enables multiplexing observability streams of
> > > > + * multiple types. The actual params for a particular stream operation are
> > > > + * supplied via the @param pointer (use __copy_from_user to get these
> > > > + * params).
> > > >   */
> > > > -struct drm_xe_perf_param {
> > > > +struct drm_xe_obsrv_param {
> > > >	/** @extensions: Pointer to the first extension struct, if any */
> > > >	__u64 extensions;
> > > > -	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
> > > > -	__u64 perf_type;
> > > > -	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
> > > > -	__u64 perf_op;
> > > > +	/** @obsrv_type: observability stream type, of enum @drm_xe_obsrv_type */
> > > > +	__u64 obsrv_type;
> > > > +	/** @obsrv_op: observability op, of enum @drm_xe_obsrv_op */
> > > > +	__u64 obsrv_op;
> > > >	/** @param: Pointer to actual stream params */
> > > >	__u64 param;
> > > >  };
> > > >
> > > >  /**
> > > > - * enum drm_xe_perf_ioctls - Perf fd ioctl's
> > > > + * enum drm_xe_obsrv_ioctls - Observability fd ioctl's
> > > >   *
> > > > - * Information exchanged between userspace and kernel for perf fd ioctl's
> > > > - * is stream type specific
> > > > + * Information exchanged between userspace and kernel for observability fd
> > > > + * ioctl's is stream type specific
> > > >   */
> > > > -enum drm_xe_perf_ioctls {
> > > > -	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
> > > > -	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
> > > > +enum drm_xe_obsrv_ioctls {
> > > > +	/** @DRM_XE_OBSRV_IOCTL_ENABLE: Enable data capture for a stream */
> > > > +	DRM_XE_OBSRV_IOCTL_ENABLE = _IO('i', 0x0),
> > > >
> > > > -	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
> > > > -	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
> > > > +	/** @DRM_XE_OBSRV_IOCTL_DISABLE: Disable data capture for a stream */
> > > > +	DRM_XE_OBSRV_IOCTL_DISABLE = _IO('i', 0x1),
> > > >
> > > > -	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
> > > > -	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
> > > > +	/** @DRM_XE_OBSRV_IOCTL_CONFIG: Change stream configuration */
> > > > +	DRM_XE_OBSRV_IOCTL_CONFIG = _IO('i', 0x2),
> > > >
> > > > -	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
> > > > -	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
> > > > +	/** @DRM_XE_OBSRV_IOCTL_STATUS: Return stream status */
> > > > +	DRM_XE_OBSRV_IOCTL_STATUS = _IO('i', 0x3),
> > > >
> > > > -	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
> > > > -	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
> > > > +	/** @DRM_XE_OBSRV_IOCTL_INFO: Return stream info */
> > > > +	DRM_XE_OBSRV_IOCTL_INFO = _IO('i', 0x4),
> > > >  };
> > > >
> > > >  /**
> > > > @@ -1546,11 +1547,11 @@ enum drm_xe_oa_format_type {
> > > >   * Stream params are specified as a chain of @drm_xe_ext_set_property
> > > >   * struct's, with @property values from enum @drm_xe_oa_property_id and
> > > >   * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
> > > > - * @param field in struct @drm_xe_perf_param points to the first
> > > > + * @param field in struct @drm_xe_obsrv_param points to the first
> > > >   * @drm_xe_ext_set_property struct.
> > > >   *
> > > >   * Exactly the same mechanism is also used for stream reconfiguration using
> > > > - * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
> > > > + * the @DRM_XE_OBSRV_IOCTL_CONFIG obsrv fd ioctl, though only a subset of
> > > >   * properties below can be specified for stream reconfiguration.
> > > >   */
> > > >  enum drm_xe_oa_property_id {
> > > > @@ -1571,11 +1572,11 @@ enum drm_xe_oa_property_id {
> > > >
> > > >	/**
> > > >	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
> > > > -	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
> > > > +	 * reports, previously added via @DRM_XE_OBSRV_OP_ADD_CONFIG.
> > > >	 */
> > > >	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
> > > >
> > > > -	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
> > > > +	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: OA counter report format */
> > > >	DRM_XE_OA_PROPERTY_OA_FORMAT,
> > > >	/*
> > > >	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
> > > > @@ -1596,13 +1597,13 @@ enum drm_xe_oa_property_id {
> > > >
> > > >	/**
> > > >	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
> > > > -	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
> > > > +	 * stream in a DISABLED state (see @DRM_XE_OBSRV_IOCTL_ENABLE).
> > > >	 */
> > > >	DRM_XE_OA_PROPERTY_OA_DISABLED,
> > > >
> > > >	/**
> > > >	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
> > > > -	 * @exec_queue_id. Perf queries can be executed on this exec queue.
> > > > +	 * @exec_queue_id. OA queries can be executed on this exec queue.
> > > >	 */
> > > >	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
> > > >
> > > > @@ -1622,7 +1623,7 @@ enum drm_xe_oa_property_id {
> > > >  /**
> > > >   * struct drm_xe_oa_config - OA metric configuration
> > > >   *
> > > > - * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
> > > > + * Multiple OA configs can be added using @DRM_XE_OBSRV_OP_ADD_CONFIG. A
> > > >   * particular config can be specified when opening an OA stream using
> > > >   * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
> > > >   */
> > > > @@ -1645,8 +1646,8 @@ struct drm_xe_oa_config {
> > > >
> > > >  /**
> > > >   * struct drm_xe_oa_stream_status - OA stream status returned from
> > > > - * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
> > > > - * query stream status in response to EIO errno from perf fd read().
> > > > + * @DRM_XE_OBSRV_IOCTL_STATUS obsrv fd ioctl. Userspace can call the ioctl to
> > > > + * query stream status in response to EIO errno from obsrv fd read().
> > > >   */
> > > >  struct drm_xe_oa_stream_status {
> > > >	/** @extensions: Pointer to the first extension struct, if any */
> > > > @@ -1665,7 +1666,7 @@ struct drm_xe_oa_stream_status {
> > > >
> > > >  /**
> > > >   * struct drm_xe_oa_stream_info - OA stream info returned from
> > > > - * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
> > > > + * @DRM_XE_OBSRV_IOCTL_INFO obsrv fd ioctl
> > > >   */
> > > >  struct drm_xe_oa_stream_info {
> > > >	/** @extensions: Pointer to the first extension struct, if any */
> > > > --
> > > > 2.41.0
> > > >
