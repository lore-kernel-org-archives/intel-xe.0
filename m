Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CE3EE01F1
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 00:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECE010E8BD;
	Wed, 11 Sep 2024 00:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/yXwBsm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CAF10E8BD
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 00:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726015725; x=1757551725;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=O/yXwBsmlEDMZYTgiQWh6xAr+Lu5B/Z8BMcD+EV7dmoW8/nd8l8tCAS/
 HZL4VeKhJojkzPBd3rR04OywZKBefMrLjpbpgnug99FV+7YNaC6rdDUgr
 yhwxF3n+NTXbs/MWwCepsjSIWe+F0Vv3lFwyzPlEDnsiOQWyX4NCh50xU
 ONESNNjeMqmh/6hG5QWqOBPuBy3b2OFY7poNAEewIQantuZvmUQCQZagK
 M+JQ61K+BRerqZJZ+PWATkRMj2EHF4FMtqAzFf0UD2YJFmO5vf8Z0T5ue
 ipNVbnNEtnEtVlr18y3VUwLfPuwqaeRAk149RkfbJourA/Cl+q91X1mvC A==;
X-CSE-ConnectionGUID: vSxs9clOS++OSuHvA5eyvA==
X-CSE-MsgGUID: Bh1tQ2XpR/mM0RdC4Do6hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13464604"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="13464604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 17:48:44 -0700
X-CSE-ConnectionGUID: 0W9q5qs0TRO9rERVKJEK8w==
X-CSE-MsgGUID: /QngHloYSmqkjvvW7YQoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71814504"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 17:48:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 17:48:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 17:48:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 17:48:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 17:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzL65Gb5XOyv3Zr5conw78NSiduxQDQgREW3R3dSTW08PuB+dgTeHXvDQtbac2elf6LikFWdHair6trHdzH0FnYXN3DvWa2j1MFFeJ7FHTzJFQKnFYAyR3UyW5zjXDbH3swyMUn/XmLQ4nMEGiD+7kcdo/UmphVFJrzJIIIEI5Uf4UXX8mtAKIfEO48t3rupJKcrmWdOuuPcEyXAOmyXarvYLidaJyt05lp4xeMgd9cA5sJ58VskXc4eXa8EApD++cQhnfKziHAB+f7+V0QX69hYEoeNC4TKToOYZi5prEkc41PDODZ0lfxrpnre5q/4bBo5yBzMdnsEXEBdHqsmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=xdslc9ZcOZs+xlVeMJ39VONbLbzHq5ZQIIh6+ijctv+kEQy2zjs5VvLn45K8gUljIx4OJ6oJxAKTbAyJr+WfmX4+Ki1balbv/qql8AsDSVIUI3hl5rBQ87Uh001MXebH/QUgEuu1+0kkrnNSyIR6YIyyR727MHd9EKSnEcGpI8QKYd1CuUV9Hh+97DHj9kA0vEWNC3HO7KdSjinfQHpcEthbVRt0oynFBOhZ/VSzoRS+5jnfl7sF0zNc5Dt2YBCg/N/Ns0VSFSWR3sGUfWISxJSU2rR4En604IoCvL2b7ns0B5wCczyuvBL2kpf9PMj5prdRgNgxIvuy8bp17LY0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 00:48:41 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 00:48:41 +0000
Message-ID: <a1ddec1c-e36a-4c15-87ad-e6929aa03747@intel.com>
Date: Tue, 10 Sep 2024 17:48:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] drm/xe/guc: Copy GuC log prior to dumping
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-5-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::16) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 313f7d11-99e0-405d-725f-08dcd1fb7b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUM5Qi96WnFFajZsNE9GRmNMQ0JtZnJBM016WGJNVHl3Z3lBK3hudmJLb3pq?=
 =?utf-8?B?dEswSXkxeURJUFhHa25UWnNPc25Cb2hEclZTaFJhQmhWL2FmRTZFUmZkQmlx?=
 =?utf-8?B?SytNdWI0VWpYUVVVZEtvUFFWUno1RGZpV0RiRjRicVlUeFUvU0FseGN0NjNt?=
 =?utf-8?B?T1BJSFNrNExZU1R0aW95dkVTbnB4NWpYbXQwSTJNcGd6QUEyMEhTQ1lSd05F?=
 =?utf-8?B?bHN4RHJkZGJUUnNhWVR1QXRWcEoyQVcwL2pKREUwT2s3V0hZL2RkbllXbC9x?=
 =?utf-8?B?eEs2bUpXazRoZUt0QktEVTZYMzM3em4zaXJIYVlsT3VhNG9jenhucG1XY2s3?=
 =?utf-8?B?cjNveEoyN3MwcDVpNklnRk13WWtPNlNEQ09mTnptdWZHWGxwQWdvbUdiUndJ?=
 =?utf-8?B?UWdwaVA2WWFHVDFITDZKZFNJVURTdXpWY0htdVd1QTdWUi83R1E4U3V4MHNh?=
 =?utf-8?B?bWhtbVhzWm9CdmJkaFhZVFAwdnI3d1QyNXpQVjZ1ZkxZWlRoRTNsdW1LR3Vq?=
 =?utf-8?B?Ly93dmVpdWkzQlhlbHkvWEc4VlVteks0ekswRFM1YnpFc1poOGZHaXIvS1h5?=
 =?utf-8?B?ZjNzakYxOFE4SklZZnlqeUV6SUN1d29SbC9UOE9jYWc3eHV5SnpudnhKY2Zx?=
 =?utf-8?B?WVRnTDFCamJQWTBrMnNEbkFWY1oyc1JHcExDaHhzS0hkbGM3dFdLd0RUSUpY?=
 =?utf-8?B?WDZ4TkF5dmViVmhoS2NTZ0YxMC9RaWlVRko2WnN0TWhUQ1ZsYWIzY0JMOEU0?=
 =?utf-8?B?OEU4NCtlM09lWkppam5mODZaSUlCUWVTQjNRS0JLRVZNaWthbWRrazhGRm5N?=
 =?utf-8?B?YmpaeDFYKzIyYSszODBLeGxRcWY2T1ltY2Foc1Mxb2hlMnNDT0xFL1IwdzQy?=
 =?utf-8?B?ekwvY3kwbDRNdWVKY1E0RmwvWjlZWTh2YTZXdnJ4NFlIYmNsMnJQY0F6YU5s?=
 =?utf-8?B?V1VEK0M1cUxhQzBqbzh2SU1iaERTL3ZkMDd6T0lWKzMxUXlJQWVBRFQ2MnFm?=
 =?utf-8?B?RmN3N1AxcE5YdXkwZ3dLd0RJM0xUckZKNjhBZlNlNkhBZ3lqZjNEMTF4dGRu?=
 =?utf-8?B?cC9rMk9OSlhTYVpaNUJiZ2xwTk9HMG5ncVdSbExabkp6alVqMTFjcFh2TGgz?=
 =?utf-8?B?NTFsWnhBSWE2bEpqVWdzT29qL1puVzVoOFZNQ3FXdUJHa2RMTUF2Qnd3SUVD?=
 =?utf-8?B?NEJHWlYzbHE3c1R3YzJuYkRwWnVkZ0RSWHNEZms4VE40Y1g4K0R2SlZSVU4z?=
 =?utf-8?B?c0hEeUlINXlIVVl0U1NjYWViTDRxQjRJaDl2MlBJL29nc08xd2lnNXU2YzFy?=
 =?utf-8?B?TTYrU1JWWWl3MU1SUUtNRGQzOXcyQnUvbmJ0YWhMS0FUanYrR3BCYTRlbmhC?=
 =?utf-8?B?Zm1FTmhYY1FRMlhWdlBka3FXVzdySVhYdXNFY0d0MlVqWnI0bzdyS0JRY0tP?=
 =?utf-8?B?TTFkek9DY1hHcnZaQjJCWExlRkk0ZUU0NHYvMmNyK3pDdEtjdGdqYWo5c0Mz?=
 =?utf-8?B?aGVlL2Q2MHZoYm1SbmdXZkI0VDU0K2xKWUQrK2wwZEF5ejRyVGNlVWxkWEkz?=
 =?utf-8?B?ZXk3YnQvM0NXSWNNWEJMZS8xcE52cURZOVNJd2ZickM2c28wTG9vWjY5eHRP?=
 =?utf-8?B?Q3lUSVN2a0NWZTlTRnZaRlJ2eXA0QndpV1pMSzhVN216U0E1bXBsZFhOTGZk?=
 =?utf-8?B?NnltT2FuV2NZRDREY2NaWmc5NS9CMzVDTW9sYWRoT0tPYktMKytHN2JDNDZN?=
 =?utf-8?B?L25WdytmZTM1Y3VaelAyOWdiTnowY1ZGNHF1UjBJRmRWenI5SHcyTVp4RnRG?=
 =?utf-8?B?dmEwSkk5cTlVTkFQSHFqUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU1WV0NEbXRYdk9HeVN1bFdNaW5TMjRyWGo1Wk55UEtBUnYzdmVvbHN3Uk9j?=
 =?utf-8?B?THB3MjYzVldZN3djUFQ5YVJTM1JhdkMyU2R3d0xrckF4L2k4WXJMQWk2REZh?=
 =?utf-8?B?dGlraS9wOUhEbXpZbEREdjgwVHhrRGlUeGFnTWEwdExIY1JDT1c4K2NwdUxV?=
 =?utf-8?B?V2t5aVg3WkUyUmpFQmk2eG1tTDZZZklpcWs5elZiNno3aEt6aFlXQWNJRUtp?=
 =?utf-8?B?U28yUXFRZDZXYWc4T2tGL1hPZmtKcjFCeEVrZVpkQ3NrZERObmRycG9GQnFY?=
 =?utf-8?B?OWU2dTgwdk5ZUURkTlYyOFZwUjBxWkM1dkpSOHNsU1NpZDZTenNvREVNbnR2?=
 =?utf-8?B?aG1HRnNjTXJONGdJdUdSTktmS0toMVhIeGpsWEFHRFl5WDE5aVdkdkF2Y2pG?=
 =?utf-8?B?MzVsL2tjN1R1UDFQVzdsRmM3VjFZemkzWkRpbkJrUDZDUWJMLytSbExSRHkv?=
 =?utf-8?B?SGROa0hSUGxqUENLd1I0Zzh1aHF6eVpZb0EwM1JidkhWVkZCQlVOV2k3M1M0?=
 =?utf-8?B?VjZQaGZhVTIrQW85MlBtRDVvVmswM0VUQno0ZXBOMjEwMTlPTkRKNzVsVTBS?=
 =?utf-8?B?N0ZlaFM5LzFZWGZjS05JRDVRUjVWeEduWG9qQkV2UG5CWU1HTVZKZDBuekZh?=
 =?utf-8?B?d2p4Z2xoRDBjdys1ZFNoWStnSW1hd29UZGEvRGNqQWc3QkVmVVRPYkU1MjQ3?=
 =?utf-8?B?V3cyQzl5RGxHaVYrTWtBQTNTVFlnMUw2cmNxenp1TWxZOXROYytHRFVaQ3hQ?=
 =?utf-8?B?R2RvenNxUUtoRmlyaHlMSEptZk5ESWxrcWF2TUsxbnRmQlJBbmNHN1ZCK0dn?=
 =?utf-8?B?dHZldVFKSFJwaHRYVlh3YzA4YzY2UUkrVU9CeU95UTRLMC9wNkZMV2FxeHF6?=
 =?utf-8?B?RWNkdVJWdVR1YXFGbnZBcVdaSXdkOFhwQU1SblRzTEZvMkxYU1lXNVlQL29j?=
 =?utf-8?B?enNkeXNYM1UvLzU4NTlWQStIZGZQS1dsWXYyRlIyUGRXSTh1TjUreG8vVnVE?=
 =?utf-8?B?UTNaODVPVVhGL0N2aW5FRHR5dGIyalZUWWJUMjNzc3YrK09CRWp2MUVoY3I1?=
 =?utf-8?B?RjdnaXFRbEpvT0sxc2NCcEVqSmhLMm04TGZHbnJNaklSWUppSFlPTTIrQzBT?=
 =?utf-8?B?MUg4OXhoZkVlL2tTTHZLYjZ2RWQ0S1EwS3Z0OGVZS1UweXAyazFqS3RZaTF1?=
 =?utf-8?B?cUJDdXhpLzlhT0JhK2doZnB4UFJtT1I0QWhKS2JQVXpoVVpwL1BqTUpqQXdC?=
 =?utf-8?B?WjA2T2dWbm9VaTgzRGdaN1V3V3NkQ3hkcnZDS0g2V0Z0ZGVlUThHeUlrQjBn?=
 =?utf-8?B?ZWp2WmpUWEloRDRtNFZDcUQ1R3ZLUFBkbnRzQmM0QkVLNCtIdy95RzFqUmNp?=
 =?utf-8?B?eldVT0ZEeTdacUc1aUZlVFRJTW1wSnZVUXY0bDBwSk1FRmorWUlWZU1acTRJ?=
 =?utf-8?B?R3pCd1M1Sy9HK2pzUnZrTUo2eENGcWRtT091QTJKMkJpbjRURFhCdkN2eUsr?=
 =?utf-8?B?OTRHcGRFM21TUzlUMnY5TFZxdzFMREtFQW5OSmZpejkwOGc3TUtwR3RNSTFn?=
 =?utf-8?B?UzVUS05yWE5oWkVzeUxUYWoySzV5cDFhUFNuUGdRNk9qMDdjUTV5akJiY2Jq?=
 =?utf-8?B?TFpkYjk1cWY4YXRidUE1c1ZtK2pwTGppN3BFTXdNemVRam5HYU1iUW1HWk1p?=
 =?utf-8?B?SXVDWUJKdjlVVWQ5Si9tSUh1ZFlIblJjUmZmT2k4TWNOYnlsSHZJMTRHRmw0?=
 =?utf-8?B?UTk2MnVzNDVaS1NpRlhQOVh6akNRQk5nMGhVeXZEVlZDTUZXcnJJWC84Y0No?=
 =?utf-8?B?TTlsVjBLc1dlaVNXVlcvTTRLZHpBTUFNcG5FNlNKZnJ6WE9udkZVdzVLakFQ?=
 =?utf-8?B?NVdsWjZaalA2RDBMYXRyUHprMGhISi9uOGtEejZ6b3JjOCtHWFZmdE1SZUFS?=
 =?utf-8?B?UlFlb3Z1TFlGWXpHZzQzL3NZSFBYdFlkMHRsR0xIazFEU2s2RWc5UmJuelN0?=
 =?utf-8?B?YWMwUG1mWmpQZzY2b0NUa0JKYko2TGZVTXVqK1l6M3VuT0N1UHpXa3ZlaFJI?=
 =?utf-8?B?T2hNSnJGNjhCUG41SnBQWU5BZlU3cEc4eTNtQWRwcHNZUktXTW53aENZM0Fa?=
 =?utf-8?B?VStBWmkzVHR5T3BnbmQwWnFVVm4zQkFBeWdEalVvaXgzN0VMRmJXem9qQXRv?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 313f7d11-99e0-405d-725f-08dcd1fb7b30
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 00:48:41.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/XvGa0JiqsrZsoC+p8mJjsjgCnjekDVXc4LCFmxqf6i/f/IRfbXvwBFrpUFKw91xLCgVYZNWDX7aLP7KvlCT9iD5pTEh/lL09tYSc3IH2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
