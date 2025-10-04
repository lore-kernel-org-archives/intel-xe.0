Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC31CAC5BB
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 04:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BC310E1F1;
	Sat,  4 Oct 2025 04:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iX7u8jCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669D410E1F1
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 04:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759552586; x=1791088586;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NLdyto9SYu46TJwUESkyfc4kRqeMO5gLSedM19JOv00=;
 b=iX7u8jCzLJRRhucKt930377y2EXeIfbbYHrlq3MnUaUDCmllUMvIM2Ai
 UDWyIeqAmtSRvqquuebq5wIdzU24Ij6O6pf0lX80aqNZxvqSpVF7rU4jh
 XnIADZlFyOrg9ZB5K3Hu/IznWwUZA8bOzC5dyvjlLHopmKcRhARyP622O
 UwK9R4KwxC+mvTglUb5DbXrZZFwkltwuRMwyAIHbyE0897eQIfhoYJn2h
 ApMitjBnxDO2natgnEmKaclDg7qDzUch3IP2QSXCQLDCBhgxmubtmaFUG
 vS2Oi/FjeNqXVkUZ0Cu0XYm8uFLevhRa+nCXV2tayrLOar50DItVXp847 A==;
X-CSE-ConnectionGUID: MzvlZ5f3RRi4LY/WZuAOLw==
X-CSE-MsgGUID: 51RxoRdJSQ+efIyE3iWDJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73254557"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="73254557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 21:36:26 -0700
X-CSE-ConnectionGUID: jxyG4ecFSTSo0axqbkTP4w==
X-CSE-MsgGUID: Aj2mkLfFTOGtjtxSMP5g6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="179369763"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 21:36:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 21:36:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 21:36:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 21:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBk0KBdoB5hS9nymWKK07q8GXJKviRoH/URoiHtywDrV+by4JHt900rEXUltWJWfv4S56XGgkfqdpiJ1AG8pSm3ZYwiegZq/8swgJtGLAJKrrzuPZuPBGYi38148Xn70e5Ys6TkIV7uz8dp4G72b3qqW0OWVa0lLQOI8oydJE8veIbxG0cl8oiRs5cV8e2RJtA0jqchFcaYLJ7Y/0FhTzzDXYeWZw4SN6bM/eX4U6OL1HjaJNRFz4h+tff3Y+vlYlKaCURm5RaYc499ohlz/660X/Enjv2dGJkN/hvmogyPT/j3kc37YPzNHlJ/hvhaiZLw7iHE8ytBJgy3a9FEbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okajerlxeJhuU0ZeDG1TQ7TvxqUEwPGXYBA2H5TPDEg=;
 b=tGIi5D8srd9bHvFij+sOlkiFGboA12iuf8G2BqfBN+Epl3uYcQd5d5rvbGP9O09MUU8cxfHvci7AkUgHlZGxgPdtPqq9lwLd1D+o3yPHJzxrHG9SC6S9AfH/f5pzQXLCXP6IiFSoHTfPxEsHnJQOTr3BXt1KnAthCqwaVrGoePaJW4LrvrVOsrViVCaenaUMXP3i8hGRKZZBu3FDsyCobnOufBBsh59hKG1NNxtf2Wg0qlMj3+h1gmQXa3KZlAp1pfLN7aBQ3sKVvPZp7FA/VBEj7+ekSStdbphRcyx9rj5cGimLXBDwvqp/4ACnKOpHPdxzERysBPTd84YcmPOZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Sat, 4 Oct
 2025 04:36:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Sat, 4 Oct 2025
 04:36:13 +0000
Date: Fri, 3 Oct 2025 21:36:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 15/34] drm/xe/vf: Close multi-GT GGTT shift race
Message-ID: <aOCkOs/YmXPiDuZc@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-16-matthew.brost@intel.com>
 <d9c9b830-3deb-469d-83e9-93a5adb3ffc9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9c9b830-3deb-469d-83e9-93a5adb3ffc9@intel.com>
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2611e7-4dd5-4c2c-926f-08de02ff8ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JzU7NW4BY1+FOaiE1pWjpfOSrHksPEeX/FZ4/4lWDZj+PKbJcdeS4YkWEu?=
 =?iso-8859-1?Q?gsSy+yDlYM8kgJLE8LO2Q1uiAdYCmpvGw01z8d/egS82wWj05IyGgZGAuf?=
 =?iso-8859-1?Q?DcgWXidkiDjqfpO98pl64620uh/PDOo6r85hJ/7aJ7GFC3H11oSmRsgBnL?=
 =?iso-8859-1?Q?bCMuzqHWV/3E34SjjSMvRNYV22+pJGi3pNtanxd/z+6IOXC65CdiNDI4fw?=
 =?iso-8859-1?Q?MTuzPsrvXOqV4gZYUgSagrs0TWrnEMcDXqpsCvsnJfWCc2VPImr99zxo4i?=
 =?iso-8859-1?Q?n5QMmfFOIc+0BQTqMFJdzHSZBLbpypT+sheAFO4wEGrnV9BRTP3yjfGIza?=
 =?iso-8859-1?Q?TMa2yBCfuQrgV9HwX36uBDBQTQ3jp5kgM9r4bE1ehlhrtrdQtKyHL+fBnW?=
 =?iso-8859-1?Q?3YAZo68vPr7/0UPHBAoxiKj/F1rjORiWmuGWfaAraW4ZautyYuj4TY8LK5?=
 =?iso-8859-1?Q?wApHMnp3Zmh15d+Y98X7X2ow+O/i0/SkcEo18viKGNor0LU83jfdwFL+yy?=
 =?iso-8859-1?Q?CLw2R5FzuFHNzhGn7movTzVSCan+hX2Y2AJ0NjE77Kx9k1SrWRunROSX1w?=
 =?iso-8859-1?Q?rnmsNjGBEylHtBPA07M34ptVxjMnqz+iSQREBTm43B7YcXUEZmSuzBO54n?=
 =?iso-8859-1?Q?JJRRl/tLY0NxksHdfeOaCQaA7Yvt1jE44aP3Hr2J/GiipBGA11Io5RENe5?=
 =?iso-8859-1?Q?W2bNW5WWoCspNCiZtW/VQYQe1xITGcWoNUZvi7305AVSOYY5a7rFVsIgpX?=
 =?iso-8859-1?Q?/xzQqUshy4VLApD2bz7+cZDld4z4SecKZ+TWIk1NaU7yLCfKtmWUyKH+fX?=
 =?iso-8859-1?Q?rYz7ZadWBtaGt+MmZM6al0sT3i6ap7qoIWs94YCuVKq9k17URQqxhGQNXj?=
 =?iso-8859-1?Q?+KevJvReJipDjPSaVBlmB5SDvPzCdlUibCLbykuXyN9uT+ifrJlfZLYX1s?=
 =?iso-8859-1?Q?1P7Egf2OSSX5by8qOG71vH0T7HHp87bqW19EIn5ggihWLuuFqVz17R6iXI?=
 =?iso-8859-1?Q?vLqYaoxGuy9sdkPid1H86Y0b6Owtu7sRrw/I5ul+7haXRx3u8OFJOuqL2/?=
 =?iso-8859-1?Q?8U465Lu41wHV2fEFnL5IYU7yZcm/cbcmL+iOKOHq99zajej/St+Ox09cmc?=
 =?iso-8859-1?Q?sjcqYCVSyVmxsQPzOSwo3jewXSSXz7zxa+UT7ShvX/IYF1ff0/FPpaxCEf?=
 =?iso-8859-1?Q?LU2nr1ddLPwbsBrJ6iyNrmmGDoT2X+gfBim6/1q8zXepsKn15OcP/AWIVa?=
 =?iso-8859-1?Q?I5rU2rXpoKY/QxxzHejvIpGMDA669n4U09y+L6W846ADRHT7CNKoIkfp2j?=
 =?iso-8859-1?Q?1Rvxyu9rMsnCNyFtA499P3yiidZhdNlRYYYx2txqV++GwNl9auqASgwf0+?=
 =?iso-8859-1?Q?PWh2RNpW73/E5wsj2K56EOeyeoVkfkSVHgIMy7YEdJPPjOS/0xYOEvcTPF?=
 =?iso-8859-1?Q?uHtCDhNwatwkayfpi/0FnH6acyJxwu3viXqkskdQ2ZRZwDCwrw81a8I93t?=
 =?iso-8859-1?Q?toyeV3AorxAt4/3gj6XqE4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SsCnI/IEE6kmHA9Fy1pW8Bj/v5Y4Yf3xBMxVxW9sieAp9RiIW75lARlWV3?=
 =?iso-8859-1?Q?EInavMPctCKR7UdKx2/fcljrGA5ljTSVQGZyEudXsd2A2JjfLQ5QiUcIb+?=
 =?iso-8859-1?Q?vQBe2FZ41AByWze1rVTHFHRtPKBZ16qGH/KowaDLvJNd38QLwZzUSftGkU?=
 =?iso-8859-1?Q?jHLX0tYZRJzzp5bWviCZ/2Kkrm1X4Kz4FFoTcDM0ILBpB01lIW00KK2qQz?=
 =?iso-8859-1?Q?Ml4rqQIqGpRxh7pGwXzAICeDxVpnPdKmFDaVzasrwnaViuvMe1zeOipX8A?=
 =?iso-8859-1?Q?AQ5m5qevm5L5BUQowVwnk59JqI4PaWhiPa7qjIXbHxkxIPNcd6mSk/lfYp?=
 =?iso-8859-1?Q?31NVqxj9zAzDrkPsu8dbSjILu+3bRRvPQlQW9Gjfu3sgzl0zvYjqlp/naB?=
 =?iso-8859-1?Q?zxml84n5XGt0x8aZpgMPgNQeTdi0DGdjMNtRjhlh9FktDT2ZUdvooXdA3w?=
 =?iso-8859-1?Q?+PG6C3kvklhNCv0BdBVvQVzevpsVFOhy+JiO1p2KoF34cb0rjSYvROFS3V?=
 =?iso-8859-1?Q?Xsq1Cu7JaYdWRwkTujNcuskwVbT0M2BXDW0lK56yvM7y7/cvsghMTx0iPi?=
 =?iso-8859-1?Q?V3s2cFDOO9AaqNRZHNvFkpeMR6CaIHNP9b5ZjkgXr9h3shBqDifd4LP1BW?=
 =?iso-8859-1?Q?+74jCnWS02ZuENWHO5uZ8ctOjEJbCw2HlP9tRawWNw8JB8CDMI0izVw4ee?=
 =?iso-8859-1?Q?H7mOwsEr7Zovb//Cfe7VLx1qLXXvmDmdWBn+viOIZSi03q2fbSwBOZQFnH?=
 =?iso-8859-1?Q?LF+hIX/dp4qHb3S0Wh6tTeBxwiX+zYSFQ4nW0NXLWfzYfmxuJ6L5L0FgW/?=
 =?iso-8859-1?Q?D3Al11tqnHbPWyI+R9s6RkxvLEh0kftv7me2WExku7RVzbEJaXoefPT81b?=
 =?iso-8859-1?Q?oDKIOfzGV7Zwn3NWIZXIUyywG8ZeaYjuFQdyUZ183mFOz6NpltNKwvpeTg?=
 =?iso-8859-1?Q?vcOkLnCTfHocATO2aX8mIpsuQMsbxhiAVzBVBuM8bIPkaMKgSY463modeK?=
 =?iso-8859-1?Q?TAQnGI6b2sVZ85sDRwRBK1v4mEg0ZqsSPJ1KH7PZr2st9OJU/fiG0iYDUP?=
 =?iso-8859-1?Q?pDP8BeDPhmvrBvOiRx0ZISM7Gs+5WaErnRtKieZy7yNopxx+EN6GnMC/Aw?=
 =?iso-8859-1?Q?KhHAaq7qdAMfSI+z6youwpzAWA3HuhGUqIDaOtMwIz1P/qvF76LYxkl+/N?=
 =?iso-8859-1?Q?ZHegqPKbllUdvGB1li3kWeSNUQPyNuUwCRnNCeOW4qdh9KPF7JUJhrDxGw?=
 =?iso-8859-1?Q?Z5IiNsbnddNrvh49q3O/sD3Kqu4dopvt9wEm+52l1ZWhvV8JOtclVa6S5Q?=
 =?iso-8859-1?Q?rnvUHqiATVeJRWpcYlV/BhIsQuv25IwhkN9AfjQdahCoGOf6d4t/TS+9Su?=
 =?iso-8859-1?Q?VqxleUNo2mTUH/uNxV4a2cA7DwqMd5osCx9yBJjeGorjgHPpim6oJHVtnG?=
 =?iso-8859-1?Q?mxBIEEW6SsiK2A84cWbzCgdMPHuRqHC42mZlullHWDbtW97rmCEYsKuWCM?=
 =?iso-8859-1?Q?smKcuCeWUzZoZ6EqFXRRm2dp0S62+3HDils2YcGvbu6Q4Mvnktm2bWxuDn?=
 =?iso-8859-1?Q?YSV3rPcgPTFzTFpZNXlixC4TaUINLf9Pa2FZt62Ed6+d7tt8vv7JlAT2Af?=
 =?iso-8859-1?Q?R/rQhKsotBJlBxV7ZxT8Xi3LMxMjHjkZ9Ynw7Knnayago6+FhX3N2YIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2611e7-4dd5-4c2c-926f-08de02ff8ca7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 04:36:13.4591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdOM9234mG6GbS/M0unWoiPGIWGv6kOztEq8VW3wpdA5Zwwbf2C5t9FrFco7tQRh0aSoUFBj6fbv0zkzXrJpQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
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

On Fri, Oct 03, 2025 at 04:24:13PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > As multi-GT VF post-migration recovery can run in parallel on different
> > workqueues, but both GTs point to the same GGTT, only one GT needs to
> > shift the GGTT. However, both GTs need to know when this step has
> > completed. To coordinate this, perform the GGTT shift under the GGTT
> > lock. With shift being done under the lock, storing the shift value
> > becomes unnecessary.
> > 
> > v3:
> >  - Update commmit message (Tomasz)
> > v4:
> >  - Move GGTT values to tile state (Michal)
> 
> I'm wondering if this would be huge task to make this move as a separate step/patch?
> 

Let me look at that but quick reaction is there changes are fairly
tighly coupled.

> >  - Use GGTT lock (Michal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h        |   3 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 166 +++++++-------------
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   5 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   7 +-
> >  drivers/gpu/drm/xe/xe_guc.c                 |   2 +-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  30 +++-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   2 +-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |  23 +++
> >  drivers/gpu/drm/xe/xe_vram.c                |   6 +-
> >  9 files changed, 117 insertions(+), 127 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index a6c361db11d9..c27414d4e856 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -27,6 +27,7 @@
> >  #include "xe_sriov_vf_ccs_types.h"
> >  #include "xe_step_types.h"
> >  #include "xe_survivability_mode_types.h"
> > +#include "xe_tile_sriov_vf_types.h"
> >  #include "xe_validation.h"
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > @@ -185,6 +186,8 @@ struct xe_tile {
> >  		struct {
> >  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> >  			struct xe_ggtt_node *ggtt_balloon[2];
> > +			/** @sriov.vf.self_config: VF configuration data */
> > +			struct xe_tile_sriov_vf_selfconfig self_config;
> >  		} vf;
> >  	} sriov;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index dc2516be590b..768c192eb662 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -436,42 +436,57 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
> >  	return value;
> >  }
> >  
> > -static int vf_get_ggtt_info(struct xe_gt *gt)
> > +static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
> >  {
> > -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	struct xe_tile_sriov_vf_selfconfig *config =
> > +		&gt_to_tile(gt)->sriov.vf.self_config;
> > +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	u64 start, size;
> > +	s64 shift;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	mutex_lock(&ggtt->lock);
> 
> with
> 	guard(mutex)(&ggtt->lock);
> 
> you will avoid all below error prone goto's
> 

Yes, agree a guard would be better here. Will change.

> > +
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	if (config->ggtt_size && config->ggtt_size != size) {
> >  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
> >  				size / SZ_1K, config->ggtt_size / SZ_1K);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> >  				start, start + size - 1, size / SZ_1K);
> >  
> > -	config->ggtt_shift = start - (s64)config->ggtt_base;
> > +	shift = start - (s64)config->ggtt_base;
> >  	config->ggtt_base = start;
> >  	config->ggtt_size = size;
> > +	err = config->ggtt_size ? 0 : -ENODATA;
> >  
> > -	return config->ggtt_size ? 0 : -ENODATA;
> > +	if (!err && shift && recovery) {
> > +		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\\n",
> > +				 shift, config->ggtt_base);
> > +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > +	}
> > +out:
> > +	mutex_unlock(&ggtt->lock);
> > +	return err;
> >  }
> >  
> >  static int vf_get_lmem_info(struct xe_gt *gt)
> >  {
> > -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	struct xe_tile_sriov_vf_selfconfig *config =
> > +		&gt_to_tile(gt)->sriov.vf.self_config;
> 
> I would try to avoid accessing directly tile-level data from here,
> but we can fix that in follow up
> 
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	char size_str[10];
> >  	u64 size;
> > @@ -481,20 +496,23 @@ static int vf_get_lmem_info(struct xe_gt *gt)
> >  
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> 
> these goto's seems to be unnecessary now
> 
> >  
> >  	if (config->lmem_size && config->lmem_size != size) {
> >  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
> >  				size / SZ_1M, config->lmem_size / SZ_1M);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
> >  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
> >  
> >  	config->lmem_size = size;
> > +	err = config->lmem_size ? 0 : -ENODATA;
> >  
> > -	return config->lmem_size ? 0 : -ENODATA;
> > +out:
> > +	return err;
> >  }
> >  
> >  static int vf_get_submission_cfg(struct xe_gt *gt)
> > @@ -508,21 +526,23 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >  
> >  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> 
> same here
> 

Will remove the gotos in this functions.

> >  
> >  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
> >  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
> >  				num_ctxs, config->num_ctxs);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  	if (config->num_dbs && config->num_dbs != num_dbs) {
> >  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
> >  				num_dbs, config->num_dbs);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> > @@ -530,7 +550,10 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >  	config->num_ctxs = num_ctxs;
> >  	config->num_dbs = num_dbs;
> >  
> > -	return config->num_ctxs ? 0 : -ENODATA;
> > +	err = config->num_ctxs ? 0 : -ENODATA;
> > +
> > +out:
> > +	return err;
> >  }
> >  
> >  static void vf_cache_gmdid(struct xe_gt *gt)
> > @@ -544,17 +567,18 @@ static void vf_cache_gmdid(struct xe_gt *gt)
> >  /**
> >   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
> >   * @gt: the &xe_gt
> > + * @recovery: VF post migration recovery path
> 
> small note about what's different in this path would not hurt
> 

Will add.

Matt

> >   *
> >   * This function is for VF use only.
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> > +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> >  
> > -	err = vf_get_ggtt_info(gt);
> > +	err = vf_get_ggtt_info(gt, recovery);
> >  	if (unlikely(err))
> >  		return err;
> >  
> > @@ -584,80 +608,16 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> >   */
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> >  {
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> > -
> > -	return gt->sriov.vf.self_config.num_ctxs;
> > -}
> > -
> > -/**
> > - * xe_gt_sriov_vf_lmem - VF LMEM configuration.
> > - * @gt: the &xe_gt
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: size of the LMEM assigned to VF.
> > - */
> > -u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> > -{
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> > -
> > -	return gt->sriov.vf.self_config.lmem_size;
> > -}
> > -
> > -/**
> > - * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
> > - * @gt: the &xe_gt
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: size of the GGTT assigned to VF.
> > - */
> > -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> > -{
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> > -
> > -	return gt->sriov.vf.self_config.ggtt_size;
> > -}
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u16 val;
> >  
> > -/**
> > - * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
> > - * @gt: the &xe_gt
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: base offset of the GGTT assigned to VF.
> > - */
> > -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> > -{
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> >  
> > -	return gt->sriov.vf.self_config.ggtt_base;
> > -}
> > +	xe_gt_assert(gt, config->num_ctxs);
> > +	val = config->num_ctxs;
> >  
> > -/**
> > - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> > - * @gt: the &xe_gt struct instance
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: The shift value; could be negative
> > - */
> > -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> > -{
> > -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > -
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> > -
> > -	return config->ggtt_shift;
> > +	return val;
> >  }
> >  
> >  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> > @@ -1057,6 +1017,8 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> >   */
> >  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > +	struct xe_tile_sriov_vf_selfconfig *tconfig =
> > +		&gt_to_tile(gt)->sriov.vf.self_config;
> >  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	char buf[10];
> > @@ -1064,17 +1026,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> >  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> > -		   config->ggtt_base,
> > -		   config->ggtt_base + config->ggtt_size - 1);
> > -
> > -	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > -	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> > +		   tconfig->ggtt_base,
> > +		   tconfig->ggtt_base + tconfig->ggtt_size - 1);
> >  
> > -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> > +	string_get_size(tconfig->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > +	drm_printf(p, "GGTT size:\t%llu (%s)\n", tconfig->ggtt_size, buf);
> >  
> >  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
> > -		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > -		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> > +		string_get_size(tconfig->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > +		drm_printf(p, "LMEM size:\t%llu (%s)\n", tconfig->lmem_size, buf);
> >  	}
> >  
> >  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> > @@ -1161,21 +1121,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
> >  static int vf_post_migration_fixups(struct xe_gt *gt)
> >  {
> >  	void *buf = gt->sriov.vf.migration.scratch;
> > -	s64 shift;
> >  	int err;
> >  
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > +	err = xe_gt_sriov_vf_query_config(gt, true);
> >  	if (err)
> >  		return err;
> >  
> > -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> > -	if (shift) {
> > -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > -		if (err)
> > -			return err;
> > -	}
> > +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > +	if (err)
> > +		return err;
> >  
> >  	return 0;
> >  }
> > @@ -1274,7 +1229,6 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
> >  		return -ENOMEM;
> >  
> >  	gt->sriov.vf.migration.scratch = buf;
> > -	init_rwsem(&gt->sriov.vf.self_config.lock);
> >  	spin_lock_init(&gt->sriov.vf.migration.lock);
> >  	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 0b0f2a30e67c..08568e68447d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >  				 struct xe_uc_fw_version *wanted,
> >  				 struct xe_uc_fw_version *found);
> > -int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> > +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
> >  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> > @@ -29,9 +29,6 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> >  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> > -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> > -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> > -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
> >  
> >  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
> >  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index e753646debc4..1796d4caf62f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
> >  #define _XE_GT_SRIOV_VF_TYPES_H_
> >  
> > +#include <linux/rwsem.h>
> >  #include <linux/types.h>
> >  #include <linux/workqueue.h>
> >  #include "xe_uc_fw_types.h"
> > @@ -14,12 +15,6 @@
> >   * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
> >   */
> >  struct xe_gt_sriov_vf_selfconfig {
> > -	/** @ggtt_base: assigned base offset of the GGTT region. */
> > -	u64 ggtt_base;
> > -	/** @ggtt_size: assigned size of the GGTT region. */
> > -	u64 ggtt_size;
> 
> maybe we can keep GGTT base/size at the GT level, as this is still
> a valid data that we get from the GuC, and the base/size at the
> Tile-level would be just what we actually use/setup?
> 
> in theory both (or rather all 3 is some cases) should be always the same,
> but you never know ...
> 
> > -	/** @ggtt_shift: difference in ggtt_base on last migration */
> > -	s64 ggtt_shift;
> >  	/** @lmem_size: assigned size of the LMEM. */
> >  	u64 lmem_size;
> 
> and this one should then either be removed or keep it like proposed above
> 
> >  	/** @num_ctxs: assigned number of GuC submission context IDs. */
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index d5adbbb013ec..c016a11b6ab1 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -713,7 +713,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > +	err = xe_gt_sriov_vf_query_config(gt, false);
> >  	if (err)
> >  		return err;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > index f221dbed16f0..074981e2ef07 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > @@ -9,7 +9,6 @@
> >  
> >  #include "xe_assert.h"
> >  #include "xe_ggtt.h"
> > -#include "xe_gt_sriov_vf.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_printk.h"
> >  #include "xe_tile_sriov_vf.h"
> > @@ -40,10 +39,10 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> > +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> 
> nit: if it's static then no need for "xe_tile_sriov" prefix
> 
> 	vf_balloon_ggtt_locked()
> 
> >  {
> > -	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> > -	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> > +	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> > +	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
> >  	struct xe_device *xe = tile_to_xe(tile);
> >  	u64 wopcm = xe_wopcm_size(xe);
> >  	u64 start, end;
> > @@ -244,11 +243,30 @@ void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
> >  {
> >  	struct xe_ggtt *ggtt = tile->mem.ggtt;
> >  
> > -	mutex_lock(&ggtt->lock);
> > +	lockdep_assert_held(&ggtt->lock);
> >  
> >  	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> >  	xe_ggtt_shift_nodes_locked(ggtt, shift);
> >  	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> > +}
> >  
> > -	mutex_unlock(&ggtt->lock);
> > +/**
> > + * xe_tile_sriov_vf_lmem - VF LMEM configuration.
> > + * @tile: the &xe_tile
> > + *
> > + * This function is for VF use only.
> > + *
> > + * Return: size of the LMEM assigned to VF.
> > + */
> > +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile)
> > +{
> > +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> > +	u64 val;
> > +
> > +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> > +
> 
> drop this sep line
> 
> > +	xe_tile_assert(tile, config->lmem_size);
> 
> or rather move it here
> > +	val = config->lmem_size;
> > +
> > +	return val;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > index 93eb043171e8..54e7f2a5c4e4 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > @@ -11,8 +11,8 @@
> >  struct xe_tile;
> >  
> >  int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> > -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
> >  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> >  void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> > +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > new file mode 100644
> > index 000000000000..140717f81d8f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_TILE_SRIOV_VF_TYPES_H_
> > +#define _XE_TILE_SRIOV_VF_TYPES_H_
> > +
> > +#include <linux/mutex.h>
> 
> not needed
> 
> > +
> > +/**
> > + * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
> > + */
> > +struct xe_tile_sriov_vf_selfconfig {
> > +	/** @ggtt_base: assigned base offset of the GGTT region. */
> > +	u64 ggtt_base;
> > +	/** @ggtt_size: assigned size of the GGTT region. */
> > +	u64 ggtt_size;
> > +	/** @lmem_size: assigned size of the LMEM. */
> > +	u64 lmem_size;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> > index b44ebf50fedb..bc471e3dd494 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -16,10 +16,10 @@
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt_mcr.h"
> > -#include "xe_gt_sriov_vf.h"
> >  #include "xe_mmio.h"
> >  #include "xe_module.h"
> >  #include "xe_sriov.h"
> > +#include "xe_tile_sriov_vf.h"
> >  #include "xe_ttm_vram_mgr.h"
> >  #include "xe_vram.h"
> >  #include "xe_vram_types.h"
> > @@ -237,9 +237,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> >  		offset = 0;
> >  		for_each_tile(t, xe, id)
> >  			for_each_if(t->id < tile->id)
> > -				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
> > +				offset += xe_tile_sriov_vf_lmem(t);
> >  
> > -		*tile_size = xe_gt_sriov_vf_lmem(gt);
> > +		*tile_size = xe_tile_sriov_vf_lmem(tile);
> >  		*vram_size = *tile_size;
> >  		*tile_offset = offset;
> >  
> 
