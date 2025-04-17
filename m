Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF1C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD2C10E3B3;
	Thu, 17 Apr 2025 20:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkc7ajOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC48710E3B3
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744920946; x=1776456946;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ltKtKiZoVCQYLzOHWy7EWBqEl/eMMt9Vp+yRJgueYP0=;
 b=jkc7ajOBD9vOS5p7OywyaykaahIs9LIHjlgnLarLiXy9jS2O0Ez6ChsB
 korcMZNynpH5atrAWEvzGATtwcqFgdJCt5pV7f2nZcfWUFq4iH1vXS1U7
 9SfwyvoeugBmSF0VETxdZKD6WshXoNswviS7QhR5FvNHGCy0WGK7J7zr4
 n4Sskg6MCMyycmO63aOFXVxa5tmZBulCL2Lm0muq5RoMW4OBx5j+69lyu
 iuKPWEZxB5uMw+2mWDFI1uLgciVYmVXR0GwUVRRyB3wMDu0QWjRWoVu6U
 CIiuWj0QC5S94fnwoJdsUljSfmSPkPkvCF8lSeMOvNis9mZXVwSucGLXx Q==;
X-CSE-ConnectionGUID: uemle8aRRfy/isD07zhNlQ==
X-CSE-MsgGUID: ejwyBkutQaC5fXQn+zUcyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46699357"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46699357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:15:45 -0700
X-CSE-ConnectionGUID: otEXTjVaRhu1AWIww83kFg==
X-CSE-MsgGUID: MsAGnEXrTZuy6GiWliLBtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="131223253"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:15:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 13:15:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 13:15:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 13:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6a70ZCnPr5W+MO3d9lcFyX+f/pcyInL4V8lDgE6tJ7t3QHcwlVzhLJPkK0ZdUIvjn2FaoTm6DDNZHD/3XeZDwCk233gW8iggX0mMfwKWFF+bDjoRCyVQbu7Dvtp6nQPW4pItcGXZwmdoC52AD/a41GFQZyd5aexgvkRxLkMnkc4gWZqdbvPJdLas1WN9labu9aTsiedhwHB3A1ALWgAoVEeTMsHFVrOFaHVrFebBGvVvL3RbaStLC2ndEZf849ah6qF4SBmMAV9IH1NJ6vx8BUnI2pnaUqDv+i3KkWvFUYToc0V4y6biPiQYPmzaTkZ9mWgrnhTQeU0v6B3Y3OVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWHN1lV3F5APTo9BKUXacb7T3EF3EbudCp05osilL3M=;
 b=E482mkr5zFmmGZR6ZZGz6qWsV/14aym6L/tmWPOFIaj3Cl2lBR7x7Rux82KjGTmh2Ga/nwxXObLDQgDwGbCoGctZ6i5UWRA9lfxvrPy/FTdHrQzjaMCiVLZc9UWSV8ksqPth6+gSz+luQ5uwCiUFkUW4mLm50oj5betCEFk2DzC/wLJH//V05gy9hK68v606zFPsLG8dFAGTFkCajrwelSFD/4G1htZ6+9rh2m59rEh6iBNVKMIPOA/Zd7o+/9pwSsmyYmnBbnHrFUDKcYDAgpN+OtmYh2bEhKQhZ8KJOG/3mrk67Nl3KWP9fGmOcnezSypYDAPEsyiI5EdXIzjQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Thu, 17 Apr
 2025 20:15:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 20:15:09 +0000
Date: Thu, 17 Apr 2025 13:15:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/guc: Fix capture of steering registers
Message-ID: <20250417201507.GC6239@mdroper-desk1.amr.corp.intel.com>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
 <20250417195215.3002210-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417195215.3002210-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1319e0-a4fd-41e1-0bae-08dd7dec8d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AZMq8NNzfsL3DfjODOebnLJQ2YNSZ4D/Ua9pD1cd1MoWndAImv5WQMhJn7?=
 =?iso-8859-1?Q?1/V4nkM1Kh5vjXDmqDECPqGp1xlrVfgVE/7iXhVwFG3B6cQP8JUWSlZYRJ?=
 =?iso-8859-1?Q?h2/sN78RnK7JgcujYMWJdXXXyM6xCNfgCjT5DdaPno0qxs8z38BfoeOEq3?=
 =?iso-8859-1?Q?w0UUM1ZnuxEYN/Xc0NksWWU5Q243f+kmAF5ZfkCxiP3uwyhw0LO4h1fOkd?=
 =?iso-8859-1?Q?iV0KePEd4anNu2aRJM0tJZQko4Z+Ax9Tx4zvnaeMx3KVTDLjmc1ltM7PES?=
 =?iso-8859-1?Q?O5m3dwRHh6kcTjH9thwb8Oa6GdQr0PIBDI72kpqlEYmlqpJv+Utl2MN5nW?=
 =?iso-8859-1?Q?vd79bJ2FXMiQs4baVDc6gAWP+Nyq5fu1T+lJIodbCG1y8xd1JqT4V194n2?=
 =?iso-8859-1?Q?VjnLYoq6DQsj1BT9EmNXBsJZxCIoBla/5Nr/BiIww99i4TByuztJdZafIJ?=
 =?iso-8859-1?Q?FnmDh5BLV9i3o/jjEFEPijduvbWvYKZBUzXZD9/agEcotw2envCvWIvkLa?=
 =?iso-8859-1?Q?ouMfwppv5wk/vRkkya7Ho+idFB1BalD3wPvpMyV2E8T0EHg2t0V8sHRwjC?=
 =?iso-8859-1?Q?o5/IzNg3OuOQcm3ghmRVzXd2dlQlnmAl0ccX0FDWD+B+5GEiQIwbXUkBQY?=
 =?iso-8859-1?Q?7TNIFc+IdBFZq2HG3W8GStqKuOCV+oibVMvJVTvrhWcCC2rQfxVuCqp6qY?=
 =?iso-8859-1?Q?bzdfB+FL3sJiCRrtcrrozA1IuXCTRqORyV/+YRF5bjYCN/T0Wt3YHl2QkF?=
 =?iso-8859-1?Q?rKhutY8mVtxfnJUGHu9kAUIshwEg0yHc7irsZvM52j69JpQF+zBLCmUSYl?=
 =?iso-8859-1?Q?lVOMN/r1q02uHvAvWnBNoRJUw8gb+m3Nw6xADyzOPcUO/I2Gp6X3MwQR9h?=
 =?iso-8859-1?Q?NBaVVfFHWgKFAEV8grh4/Am/ZZ/f4c/Pv2pYq1uuKtNfTeAXLu43cenEqq?=
 =?iso-8859-1?Q?YUHd9Rv+MZe+ENC2Ikr/koIh4XU3IG5PLRYAmGskUH6UVUUcSLdI3M7tN/?=
 =?iso-8859-1?Q?Cj0+WvdPZH3uqHJtEel9OXRDfkb8v3RS6XgBNqroFJIakEDm5vCl1xK9ZV?=
 =?iso-8859-1?Q?pLpjex3jlajNZX/WyfRi8uYjeRv2OtKAd/sRB2izxw0yUi2F5bkJcalTcN?=
 =?iso-8859-1?Q?ohLyx33qxMQCK8oy9TJYZ+TwVf85QHyLw7d3ULEhQg4ODIFSdpGiGcB2aO?=
 =?iso-8859-1?Q?39MSTcB45HqUODq1kvRupOC/iAbzLyi9Pp9Oxtlnscd8TXJ+EX230nBmQC?=
 =?iso-8859-1?Q?YvkNRM+Kt5VVFyYnboKx+xlkZ95jo7rdd5XQJ+s0BKa3xbRn56YHZrBdwF?=
 =?iso-8859-1?Q?6N+m/Qtt5Y12QU4cX9EpsqCbaghsydCVCa0B+APgrvcHdSt0PkO6+Cajh7?=
 =?iso-8859-1?Q?d2JnnlwSz10DYeV2+89nSiqFOqdOlghnu7BHIged+8uIwIjF3lU5ulrl9V?=
 =?iso-8859-1?Q?2dkDLiDG3YaujNXRQGLZ2jN5U0oD5gL+0p8f88nTusLZ2W58nJc94ggric?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?M345IIsFyYwLXc84fHF+E0OLgQkG8m9MUDPy3j3Mfhrv3gOFMxBaZLGWhi?=
 =?iso-8859-1?Q?dZndmFKJSdlAptM4v7owjV5rxJjlNtz6xKrzphq1L+gXDATUpXSKp54WTM?=
 =?iso-8859-1?Q?Yw1xqNFc7srOqaEx7h7pOZ3JUVRW/1qkx2HHCTUsfhGEjNZQgZERAzNKwr?=
 =?iso-8859-1?Q?hzyLh1m0p6bGBITxGJJYYYIvgEU0ZSkNNmlkfk9uaArnemqoFwH7KAt33S?=
 =?iso-8859-1?Q?L6K2oWQzZR6wZetEEq2WzXc1YzB58ZuLH2RrE8b0EWAW1lCVe59yuyAgFM?=
 =?iso-8859-1?Q?8xn32Gnt5YNvxhntGkUWOXSzd86+9j9gQGh4ZilMtkg3Ntz7AKfgNmkxS/?=
 =?iso-8859-1?Q?vRE8yNf9BHIcn7gy1uYtlOQmgKYOqpSZLNGKQlvTpALbK/sSwPILwZwHdj?=
 =?iso-8859-1?Q?e9ue8TFguNRcUmgn3UtfLXrzcVC9U8We4a9tHFGL4wbXze9lW97sL2D05C?=
 =?iso-8859-1?Q?1+bnVBT77xga1wIUYGyRUqi08z4pC5bXQNnVHG38ZaAhXNzTotcZZGWmnq?=
 =?iso-8859-1?Q?Sr7Gi7fhN17swG4qtfd5n/hXc+KBHzhoc7yW875wVx9E2/JPrKGGCoaVjk?=
 =?iso-8859-1?Q?rxRodkt5lNG/VK/nSB8YmQcgNQXe4ZcnS8DXR607x026gQIuToZ7d1JxE7?=
 =?iso-8859-1?Q?aIlYUAU1NOcw+WA1bBFjF4nMVqCabDUg+CPuJ2TSss1Zm8FmVFoIho4mt/?=
 =?iso-8859-1?Q?OGD8V10fpUP/1qX+buq0Msq6xIHU367akORTA/HfGOFKhrigOc0ZIzfwbP?=
 =?iso-8859-1?Q?uSoJKUnO8Ep8J5n1GElqRWQDpbZb6DQTXi/5f7ejnRzrFl5KYQbh1pXr67?=
 =?iso-8859-1?Q?GtWbpQAh9BbgHuNR6W2Sx8v2DZE4F0VU14lX4kk8n5pyonPx774t2PKfuK?=
 =?iso-8859-1?Q?t4oSrz879X1naKkVIygfsYmgAR//CIHKhYem++J3XigMN0xQTR0thPAV/W?=
 =?iso-8859-1?Q?yorG/GcAJnM/JeOEDSyMW61yIgHTGXXi18qjh4zZe6T7Fnr/GZAttZ+42k?=
 =?iso-8859-1?Q?xuaw63vWt47rTHTwRo7JhOWSdCDTF1z2iaFfmV5C/3/ntvOe6FN8Pwgcpr?=
 =?iso-8859-1?Q?9snI/RLLDk+s9XgrvWGuE0v5mFT15am2d0ExJIM8Xb1O/s7ZFX36UcJ0H3?=
 =?iso-8859-1?Q?gHS3Tcnog+61YwD2IP/8ymNdLPpaGi3fyqznznsUPpPsQpPEGNjhTT1AMM?=
 =?iso-8859-1?Q?qxm5rgyO7TYk67Xej4Y7CTiV0Qk4DoDnPWc01ZBbq79Yx9xz+CYA8qgLbF?=
 =?iso-8859-1?Q?UUvDaJIqT434OotmyMOQ9IOfAn6LW3HAJlykcU2Sx6m9+LER9Mc1DwKKV/?=
 =?iso-8859-1?Q?DBs+6uVbC7yfnH3n6vqNusd8YFl3WMWN3iCfXTK3rXHB/H0FTGAjrRNPLP?=
 =?iso-8859-1?Q?0V6Pqsjbqp3N+m5fklDMs5szBWUACfwTCtPs2Ka2USiQ8tsy3uOhlq268p?=
 =?iso-8859-1?Q?cEPZFEjL35H+gYYVutut4bINL9/mbxuzcbkORywoegRpWJN4h4gldU5BBX?=
 =?iso-8859-1?Q?uhYFgklbJpIqOxieAkwdJ70vYifyeuH/TKnXpAURF7mLryKTbULffaS1oM?=
 =?iso-8859-1?Q?rCf8qkdHjahCoy1eOP/kBaN4MXcFsYmgkCwzyYeyPpNRn2JuRHbjAunfnm?=
 =?iso-8859-1?Q?EESpQYVUF06zLc22IW9thShFP1o/vGehcMUQKvBAgNcDc5aMukDZ1OKg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1319e0-a4fd-41e1-0bae-08dd7dec8d4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:15:09.4723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3ZfJjDO4mWFcC+eUId7VnyYAURNLMFWsE25x8tvbibQKJyCaC1sLSowKqwYNrJKyp0XmjnPHexwYP42ldTY4BIvnbtQ1XGoC8ZZoE5gDn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6919
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

On Thu, Apr 17, 2025 at 12:52:12PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The list of registers to capture on a GPU hang includes some that
> require steering. Unfortunately, the flag to say this was being wiped
> to due a missing OR on the assignment of the next flag field.
> 
> Fix that.
> 
> Fixes: b170d696c1e2 ("drm/xe/guc: Add XE_LP steered register lists")
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f6d523e4c5fe..9095618648bc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -359,7 +359,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
>  
>  	ext->reg = XE_REG(extlist->reg.__reg.addr);
>  	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_NEEDED, 1);
> -	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
> +	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
>  	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
>  	ext->regname = extlist->name;
>  }
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
