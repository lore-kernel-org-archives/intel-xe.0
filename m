Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D66D262A7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 22:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E955210E186;
	Tue, 20 Jan 2026 22:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcQo1Ii2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C0510E186
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768948210; x=1800484210;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rcvGlmmimFwqySVSrVAaHvqk9PzOqAU5ClHYul4LHgE=;
 b=KcQo1Ii2Tn952mrn3v+KqP3+7YBFnbHcsdSx5worZy6uBLpCoVVgoOXl
 Iu1d1qw3P0mEaCd03oyNsLKQHHkXgrcb7zpJ/s3oF2M8VxlR2aZfWhhei
 BQjDEqePDOFGOhVydR8Fs6HBZQ+glZtTkLuE4RwmdyKoxTH7GimBcatmf
 AMYSdd6lfJ4bAP8psBZZ5p5UPDP8PX6TGh15xgLgCp+be5A+zSa0mHL0K
 Mdu8uvwfcgnm28Nrdz4z7SZkHxO347rZ858MFJnTJawLFY5N2B78YvoDx
 Uj4O74J4Obcp9Fpnhn4BdPnNg6q1K0UoAFe8ktQUGzhQRELAFZo3KZgMR Q==;
X-CSE-ConnectionGUID: bH0bx0FSQe2catAY610New==
X-CSE-MsgGUID: 7ble+DzJSMOS/tXsqwk+Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80474766"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="80474766"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:30:09 -0800
X-CSE-ConnectionGUID: dqRUYf+HRNOpkW3D0yT1cg==
X-CSE-MsgGUID: ZYAEDeNNR56Yeir/WCebCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205885656"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:30:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:30:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 14:30:08 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:30:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8NkBvq8SuSf/tK8VL6GKPjMdrqfEtr/TUdQzewq/7qFWRUPox8/q4k7S8WUYORfpCCdaG3b6vKGAqEm6sIOlbneGIHtwO0f07hdNihGBxliOyDV5iGLfhGnkUwPenG4nKv+tQa7vI0Ugg+yJFXvWtp4sU4uFGIISsHt2boX3ECBAPy0VmtRwqryYtuJ1UPaVMak2w0SJ+ec7komj6oiN2pOGepgUrBeoKnu3ySmAnrXdWoEYqgys0trMfahCESMeou7HvGXXpKMSgu4CxnS9DvdxiWqCRge+KO1hxwqbBsW4NFKC26Mui0OuBIarJT9I6xQcRHYax5EetqIHdiYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuFhvI1H3PjLL5r91vZXA6FH1TZuQ2wHMScHRpig+Ps=;
 b=rfuQtb/KiOzskgcWXxN6o0gTOVdE12XbRU5h5DHzFmKKIV2e8oL9xcvW44+PTNQClPiQnxRSh1IakRAZkcJhEvMZF8zWFVgYaPfPShbPpWl36m8hwbqHzdF5s7hBS4SfHDmMsjJWKlLrwgY9Rzd/Iz2Tir/ctAdPrfOAoVPIEOGXRHJELJohAyy5Vfy0E23xbt954GMujb0Nfvk9ZewK4trxnv6lHzdM/7omd4IxfAus0Jat/nzhqQItTxLM6tGigNZa8ZkGwPEhzbsOk+DPOuPTSQTl2uxhFMe+GV/XSdHysJsIOC88GI2NJl1voLX4lhIYx3LL3pNk4KQ3Ye+ELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 22:30:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 22:30:04 +0000
Date: Tue, 20 Jan 2026 14:30:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 06/17] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Message-ID: <aXAB6XdbDu+jsNtZ@lstrano-desk.jf.intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-25-niranjana.vishwanathapura@intel.com>
 <dc27df4f5351345d6925db872390f3b290909fb5.camel@linux.intel.com>
 <aW_uP9eTH76NHPKZ@nvishwa1-desk>
 <aW//pmK8UIGNxfps@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW//pmK8UIGNxfps@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:303:83::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 61577744-ec69-4e59-ad6d-08de5873751f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?M1wyq9PuvcrOPUYQugSifPALwbWwItv5MzV1S6POYCFOCZwmJUnudGz4SA?=
 =?iso-8859-1?Q?TODqCDBIm6B9vIeuiikJ5eX9UFpfLhKelU96kA0coqx2ZHdwchseWmgjPW?=
 =?iso-8859-1?Q?bg9PhAGzT/NkTAuUTyqpE89pn8ab0Gdq32rj3E02pyDbPYJoBReLYUjSQC?=
 =?iso-8859-1?Q?YhdphVcjPo7ivcQrF4oT4Q4YqgMfLNdCBYQ+RnABwQb7OIIxzdL7sEUMBe?=
 =?iso-8859-1?Q?7ebbGOUNtzI9OjTciM/g32xkMBXAi5MTUJDZ984fauG7JZHFeI3O1VwVl8?=
 =?iso-8859-1?Q?/X1F7k6M+puDWpmFu0Nd6PlvMQTKTAxrNeZfQhRsuKiy+0BHnS3+v5EVo7?=
 =?iso-8859-1?Q?k6O7CiLWiKjsyj/+0NbqXv7+ifD1EwWkIgGW/cv0Zg1exwUAEES2Yo/GC/?=
 =?iso-8859-1?Q?+xAYbeceX0MJ/tuSIj86TbhvAPsOIYp8Lhha+e2vdqyiSPT0ajI7jMcAdK?=
 =?iso-8859-1?Q?pvThocgYibLVM+sbnEnQpNm9Qm/vBBBYNQznS7/HS2XnHcOxPAxECs5bKr?=
 =?iso-8859-1?Q?laZAk3b+rZzSTZLWWyLPtP5hXOPOkc+6/M5ZlW57DO2S5CyGY991jJuhFB?=
 =?iso-8859-1?Q?azp/MTjYm2yMqAsE5eFdtEVHRQzgY2BYVN2tTA/MoGeQV+t5H7r/rrbDI6?=
 =?iso-8859-1?Q?CzXfoaDGJRzbr9iWTjrv72otphXMqmAxmGpyIlgm2sdGlwhDmmyBarPkC7?=
 =?iso-8859-1?Q?b9cBVnlszjh4kI97H+TW6yfIR64h4VU3PjXkGEG/zyl5uYbi0yOg+PijVj?=
 =?iso-8859-1?Q?RfA6BpUB+MchtbisHa1HQo32+XUbuC+XuGRiQ3d+CNOnZA2VVMUZ/ey0h+?=
 =?iso-8859-1?Q?sXvLz8HUjO9oa2qTLJtYVKw/LNXLCwFZbNkp43BaTvsHp8WtyMRQaCwQxj?=
 =?iso-8859-1?Q?oRwwW/2/IwgJRG37e1nmBCtCD1bTQmXbKSdfmZRXOkTx4rtbHPYQhtUa9R?=
 =?iso-8859-1?Q?wV5T+a1GkzE+WyLAxZbgi98BZeHR2m52nyJJB9owEyF9tS+P0+ligr0LXy?=
 =?iso-8859-1?Q?6TG2Pe1TUrTYrXPYsHJoBUza1gZCcTcdetkZRM6mn0pHf1AG70T67Gmp8/?=
 =?iso-8859-1?Q?Pje5Vuw4nSIDy6ipHpOH/at5OD8TTL+PT2xtUSM8hyxAPIW1X6vLdVJN6h?=
 =?iso-8859-1?Q?rPetFnwgfUVCixy8zRQgnNSqunNo6aVEs7Thv3nfUVlPz7bYKGXuqa74X4?=
 =?iso-8859-1?Q?tXoLaSN8jyG1rgm6F94jaMvGgCEq4KfezerYt8OomgtFXzKZbOuAMygXeD?=
 =?iso-8859-1?Q?0xUoDPhMNrtz6ayI0zo0yVlMF17lUkLGTuz/iyfV+zx6pV5Ihy5eH5Qk3f?=
 =?iso-8859-1?Q?vUAgM+l0lTfA3ncA0cqiAisK4Kesd4uoCTYsw0jv8rub2iQUmWtsYUKM/V?=
 =?iso-8859-1?Q?FO/oZAouEDmiVj4V+oljGL0HYveL+7G8CpghsOYVp2hMe7T6GNQSvHVKVc?=
 =?iso-8859-1?Q?Blgufj4+caTAr5UgGX70+aCnB3f+9lw912ixXytsf/AAYd5J3SJmAfyr7t?=
 =?iso-8859-1?Q?Glp5Rz4wjIxZxdIeF3UTxhsCePXiNXNFRvAlUXCr+vQ70ll7wS3lUQvO+5?=
 =?iso-8859-1?Q?B+KdAztulZLnFz1nygiHkwZeudK2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OWPdcmEy/9HahkUjTTkni72fi2WeFoK4if/LFxhvp/i4hggjQYDI+DYW0D?=
 =?iso-8859-1?Q?O23ZPFtPNEYvw8JJlhIs8Y2TklR6ChBLAlycRp/PcsTrWDbfFr7/m/XVHa?=
 =?iso-8859-1?Q?cvcdLd3/rUBTYzAfBx/NcgxMdeGBTTvk13c3Rvb9ssKCavxYDKvWTsnyuL?=
 =?iso-8859-1?Q?V/b/T8/6pbnKh4sCo5isqFceGrizmyf51UQ5Do+xxVh8FEnyesaJJhq4jQ?=
 =?iso-8859-1?Q?V/ey/HHE87nVIQmWEExXe8wVs2QzvsAKehU0/pp3LXj1TtcY3JUugb85ET?=
 =?iso-8859-1?Q?YAvlmA07rZZEF2184HHFpfM5RfuW92wEAQ2+Y8fungPjaAd0BG3uBs9I1g?=
 =?iso-8859-1?Q?+FuxeRSp4Cbj5zmr2VucU7z5ibRdfpROcPoNo6EjGpfT8wtlF6HgFzkXBo?=
 =?iso-8859-1?Q?SN0lkAFi58KWNqtaYPp8u8JeF9LrGts8zgPGyPXoh74HyK3xVFqdL+hJ45?=
 =?iso-8859-1?Q?+AmIVns6f8vOGKgh4cU+tTIte6xtzfOZHiIcCbGdQEElfSUFtyLZncZacg?=
 =?iso-8859-1?Q?ekRbIQy8SaR6VQCWtgO/SL4bD9v0XY8B8gqzH/J/rw7dv6aYPpPDJPfHNu?=
 =?iso-8859-1?Q?feIQ+dIA3hmJCRq/2nlUSLnoWmKh+03yg0FR1x8dOTdXhURpeFzBol97N0?=
 =?iso-8859-1?Q?4VyLYl+k4Xfnr5kf7fKnxpbrvbFvs9U1EukiPxu5aUBSN7qze+N6HgLDAd?=
 =?iso-8859-1?Q?lznST2CzXUYqPG1YIp0CYUJbxVU6K/7IYISB/NUijITD/epAIASneTo8ha?=
 =?iso-8859-1?Q?HLOU+UBhBluFUQtzeR4nMo1uJjz+epX08x06VoTubnrZFKhpfuVCu1+jSS?=
 =?iso-8859-1?Q?yN7pHNm7f/jrIcUEYQfKHSNKPDDj8YYjGVFWWREcfgat53aL76ysksOIyt?=
 =?iso-8859-1?Q?bY9iTfx6FgddRFykHhHOFTC8y3yqc8rh/wT220jRftCzCUYAzvn1/rTSCn?=
 =?iso-8859-1?Q?20PxZ0PCAZveZlC9JWr3gn2OXMY8Qj5QynMQlq3dmHtl7oHCOGGVFfDtPv?=
 =?iso-8859-1?Q?GPK1g5AeNp03zQx0DlGnyi0ca/Yql+gNZCfVb98zNESzB9IQw1IMgt2QB9?=
 =?iso-8859-1?Q?E1B6+NJnGFDrDJQa1jGm5GO9+h5rcEYoRqB33TbTHUSAwWW2pINGdT6xcs?=
 =?iso-8859-1?Q?RiRM6ba84FhuIZQdEkX1RuYSsnpk1kQN0JiHGWBnYIZo7eud0CfZ6mMvrO?=
 =?iso-8859-1?Q?nPrqaPIEfBv59R8AbAOJsNzbxh5YedeEUu6qMNxAgwn2POsd6pz54YMjwb?=
 =?iso-8859-1?Q?EE2KKxHr/7Rul+hXsCxGVFHXCXWyu1gpTTOHoZNHFHwapPBl91dSmVPuzx?=
 =?iso-8859-1?Q?czDIEYb8eVViotpzAI70tUcwaWHk9+B3s11EJSOAE6Cf2VoVjmFcqlu2An?=
 =?iso-8859-1?Q?XYhLaQLdr701GDeJzlgcaTVMRlaA9E1r1d5adFdEpQW5M2QxSJB4IF0UQV?=
 =?iso-8859-1?Q?Up0qSi1C/w6B5gk+FWNTWX49wlARGyWV1wNCnuJqPLmbls4pxpI8V6yPhF?=
 =?iso-8859-1?Q?4dMiouDQ+pT6WWzxk2WGGKvhgvKbHxpnl1M2LacGiUEgDoiJd+CUOxtEIW?=
 =?iso-8859-1?Q?HPRuLCiUXY031wPShBUWp2vlUACXVIlwOcLtQ2OtP3/4Y51DqD9pRjRA2Z?=
 =?iso-8859-1?Q?oeKr3e7jYoquW+mUq/R+2DBgTCUQx8rWEtW0h5+94cRFMfLhXeiUeW40PP?=
 =?iso-8859-1?Q?bPfjhFVLbEKWR9HLTQkZieMP9EUe/c3wPRnUdMJIHj6OUAmSOuPhv+LaOx?=
 =?iso-8859-1?Q?hKOxRTUs3hjD4cT6/FbEx3+yCYs84PObsEKJSXGokWuogsoZAFBGKlZ9iK?=
 =?iso-8859-1?Q?/7FLqDVDK6NJr6p8YJsVToo62ggbaTk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61577744-ec69-4e59-ad6d-08de5873751f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:30:04.3912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4fXjIdrZwpEhVp//GjTshTs9QIBngW+Drb3ug5VfxTtL75LO8fnMBXP3h25eYeu41vPkehzy4vfUIhk3v0YwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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

On Tue, Jan 20, 2026 at 02:20:22PM -0800, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 01:06:07PM -0800, Niranjana Vishwanathapura wrote:
> > On Mon, Jan 19, 2026 at 05:57:29PM +0100, Thomas Hellström wrote:
> > > Hi,
> > > 
> > > On Wed, 2025-12-10 at 17:02 -0800, Niranjana Vishwanathapura wrote:
> > > > This patch adds support for exec_queue set_property ioctl.
> > > > It is derived from the original work which is part of
> > > > https://patchwork.freedesktop.org/series/112188/
> > > > 
> > > > Currently only DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
> > > > property can be dynamically set.
> > > > 
> > > > v2: Check for and update kernel-doc which property this ioctl
> > > >     supports (Matt Brost)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > > > Signed-off-by: Niranjana Vishwanathapura
> > > > <niranjana.vishwanathapura@intel.com>
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Two questions on this patch:
> > > 
> > > 1) I don't see any locking to protect the exec-queue / lrc state.
> > > Perhaps I missed it, but couldn't this blow up if someone runs two
> > > set_property ioctls in parallel on the same exec-queue? Looks like at
> > > least the set_priority is doing non-atomic RMW assignments?
> > > 
> 
> I don't think we'd blow up. At worst q->multi_queue.priority would race
> between a set in guc_exec_queue_set_priority (parallel across queues)
> and read of that value in __guc_exec_queue_process_msg_set_sched_props
> (serialize across queues). Eventually we'd stablize on the most recently
> set value in __guc_exec_queue_process_msg_set_sched_props.
> 
> > 
> > Hmm...I think only checking and setting of 'q->multi_queue.priority'
> > in guc_exec_queue_set_multi_queue_priority() is a potential issue
> > (as the rest is handled by message handling queue and guc ct backend).
> > I think we can fix it with a simple spicklock in this function.
> > 
> 
> Hmm, I'm not sure what a lock here buys us as if two user threads try to
> set q->multi_queue.priority we'd never really knows who should win the
> race of saying of setting.
> 
> > > 2) Do we really need this to be mutable? In i915 assuming that lrc /
> > > context configuration could change created horrendous locking
> > > constructs that were later fixed by making it immutable at first
> > > command sumbission. I don't exactly remember the details but do we need
> > > to change properties after first submission? If not I suggest blocking
> > > that.
> 
> I don't think this is overly complicated here given the actual queue
> interaction with the GuC is serialized by the DRM scheduler.
> 
> My thinking is this patch is probably fine as is, albiet a little
> harmlessly racey.

Actually maybe we need WRITE_ONCE / READ_ONCE semantics here to prevent
data tearing.

Matt

> 
> Matt
> 
> > 
> > Yah, ability to dynamically change multi-queue priority is a requirement
> > from the Compute UMD team.
> > 
> > Niranjana
> > 
> > > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > 
> > > 
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device.c     |  2 ++
> > > >  drivers/gpu/drm/xe/xe_exec_queue.c | 35
> > > > ++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
> > > >  include/uapi/drm/xe_drm.h          | 26 ++++++++++++++++++++++
> > > >  4 files changed, 65 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > b/drivers/gpu/drm/xe/xe_device.c
> > > > index 1197f914ef77..7a498c8db7b1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] =
> > > > {
> > > >  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
> > > > DRM_RENDER_ALLOW),
> > > >  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS,
> > > > xe_vm_query_vmas_attrs_ioctl,
> > > >  			  DRM_RENDER_ALLOW),
> > > > +	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY,
> > > > xe_exec_queue_set_property_ioctl,
> > > > +			  DRM_RENDER_ALLOW),
> > > >  };
> > > >  
> > > >  static long xe_drm_ioctl(struct file *file, unsigned int cmd,
> > > > unsigned long arg)
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index d0082eb45a4a..d738a9fea1e1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -790,6 +790,41 @@ static const xe_exec_queue_set_property_fn
> > > > exec_queue_set_property_funcs[] = {
> > > >  							exec_queue_s
> > > > et_multi_queue_priority,
> > > >  };
> > > >  
> > > > +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void
> > > > *data,
> > > > +				     struct drm_file *file)
> > > > +{
> > > > +	struct xe_device *xe = to_xe_device(dev);
> > > > +	struct xe_file *xef = to_xe_file(file);
> > > > +	struct drm_xe_exec_queue_set_property *args = data;
> > > > +	struct xe_exec_queue *q;
> > > > +	int ret;
> > > > +	u32 idx;
> > > > +
> > > > +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args-
> > > > >reserved[1]))
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (XE_IOCTL_DBG(xe, args->property !=
> > > > +			
> > > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> > > > +		return -EINVAL;
> > > > +
> > > > +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> > > > +	if (XE_IOCTL_DBG(xe, !q))
> > > > +		return -ENOENT;
> > > > +
> > > > +	idx = array_index_nospec(args->property,
> > > > +				
> > > > ARRAY_SIZE(exec_queue_set_property_funcs));
> > > > +	ret = exec_queue_set_property_funcs[idx](xe, q, args-
> > > > >value);
> > > > +	if (XE_IOCTL_DBG(xe, ret))
> > > > +		goto err_post_lookup;
> > > > +
> > > > +	xe_exec_queue_put(q);
> > > > +	return 0;
> > > > +
> > > > + err_post_lookup:
> > > > +	xe_exec_queue_put(q);
> > > > +	return ret;
> > > > +}
> > > > +
> > > >  static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64
> > > > properties)
> > > >  {
> > > >  	u64 secondary_queue_valid_props =
> > > > BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > index e6daa40003f2..ffcc1feb879e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > @@ -125,6 +125,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device
> > > > *dev, void *data,
> > > >  				struct drm_file *file);
> > > >  int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void
> > > > *data,
> > > >  				     struct drm_file *file);
> > > > +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void
> > > > *data,
> > > > +				     struct drm_file *file);
> > > >  enum xe_exec_queue_priority
> > > > xe_exec_queue_device_get_max_priority(struct xe_device *xe);
> > > >  
> > > >  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct
> > > > xe_vm *vm);
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index fd79d78de2e9..705081bf0d81 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -106,6 +106,7 @@ extern "C" {
> > > >  #define DRM_XE_OBSERVATION		0x0b
> > > >  #define DRM_XE_MADVISE			0x0c
> > > >  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
> > > > +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
> > > >  
> > > >  /* Must be kept compact -- no holes */
> > > >  
> > > > @@ -123,6 +124,7 @@ extern "C" {
> > > >  #define
> > > > DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION,structdrm_xe_observation_param)
> > > >  #define
> > > > DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, structdrm_xe_madvise)
> > > >  #define
> > > > DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS,structdrm_xe_vm_query_mem_range_attr)
> > > > +#define
> > > > DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY,structdrm_xe_exec_queue_set_property)
> > > >  
> > > >  /**
> > > >   * DOC: Xe IOCTL Extensions
> > > > @@ -2315,6 +2317,30 @@ struct drm_xe_vm_query_mem_range_attr {
> > > >  
> > > >  };
> > > >  
> > > > +/**
> > > > + * struct drm_xe_exec_queue_set_property - exec queue set property
> > > > + *
> > > > + * Sets execution queue properties dynamically.
> > > > + * Currently only
> > > > %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
> > > > + * property can be dynamically set.
> > > > + */
> > > > +struct drm_xe_exec_queue_set_property {
> > > > +	/** @extensions: Pointer to the first extension struct, if
> > > > any */
> > > > +	__u64 extensions;
> > > > +
> > > > +	/** @exec_queue_id: Exec queue ID */
> > > > +	__u32 exec_queue_id;
> > > > +
> > > > +	/** @property: property to set */
> > > > +	__u32 property;
> > > > +
> > > > +	/** @value: property value */
> > > > +	__u64 value;
> > > > +
> > > > +	/** @reserved: Reserved */
> > > > +	__u64 reserved[2];
> > > > +};
> > > > +
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif
> > > 
