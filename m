Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A16BC0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 20:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664A710E9C9;
	Thu, 30 Jan 2025 20:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgH4MPQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5059C10E9C9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 20:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738270103; x=1769806103;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sbk/KmHC7Hbn+fKfoFK9whZvC2WKn08fFXC4PZU11Zk=;
 b=AgH4MPQG4Jx35LILgdHCyr32csPB4OXF6XUQcpI/DRpdzHnxRLwgINal
 TR1HaysL51vNuGyOpoFKlGsn1QPuNpm7/U6fpAnqYx76PmcSM4xOgzuMJ
 9jLS3NVTuk8Q5CA58UzlWdrltHpp2xHi+8aIirNRyQlLXHBE4BcO+Mksm
 CHs2QIQkJv4yoVxp1KX9TFH0994CUzIlCLOwOjvHtR5XtYC1TcvAzIldB
 YECc6wvJktyPcFoO0NDvj688QjdUsU6det7xife/AIkywwkIuA+NVmtLu
 LXOUShF5Ig4EM7wQhRqmUnXehgduQmJpl+daw48nB0sH4SWoMoSdx22zY Q==;
X-CSE-ConnectionGUID: TUhTpvmqQIiCU9K7Yz9IkQ==
X-CSE-MsgGUID: 43ZSiXymRmSb8CEQw8ONJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56380050"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="56380050"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 12:48:22 -0800
X-CSE-ConnectionGUID: CfJJDz5uSgS4bRnw4EpnMw==
X-CSE-MsgGUID: 9dLnMIvIRVqazkNNp+p5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146624779"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 12:48:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 12:48:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 12:48:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 12:48:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISQ4rJShbWTB1e04DFrQGllwoLRyDlcQCoaviCvGf/vTo+OtkK//9xWwidQX/qrbF3SXmgPErWsVH74CbEAutZh03JYWEMFiLulurZIHGTDZ/T+lNOJtSaZVPh5cSpf1pGxnCMra4nTS6QA0oZblZYExNBMojaSFK3nq6RaF5PjRTd7GyfVrzkZat741nSu1B+mw7TMvQyO/uIQAkJ35NMkMrkjbESYoeSU+QW9Sr1abqogqcjtRTmqc1LIkBuRIt8fnszO0+JgglHZuGQkcRj8M/gj2jUSSOpxwZaLR84NlYommHgjsx7mkOw9ebcryEwWKaVMvrgwLnvSzi5eDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Bj/vpOiyPkDUg99Qwhv+ZWKPaAXXP/ngGXq5wQbtqo=;
 b=JWCO5kGtk+IY9ssRLvmQA+cTb9FA1UzNHfR7V7tSREgiQn39PhjKPAmHGmoDabWHGiBk7Ka/sSxk4r6AVR2nMJrLEuwJd2QhhSkq3iL0by9OYfXnVvglR2ekFwfDYXnbuSfRcuSv04KpqyCuv60ftDEFyfjXg7S5T6D50N7Qoyy/sS31JRte1RhJGo9PAizbBpP704b+m9XunT90QiXzuBOW885cDvfmc+crKGMoJ3yJzxPbnzI9vu9LtvDDqDV3fpah0/JCf8xvYGpktk9WzenGV2McQpQdrRzKcTp11jKPHwH8B22N43/+XOt26VUoHfpJmYfsSjqO12tGgIHC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 20:47:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 20:47:38 +0000
Date: Thu, 30 Jan 2025 14:47:33 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <uasu4nm62h3zfznjpwd33kbnlo32o72nmlqlyrzhdninxnoezg@n4prm2oidvst>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001> <Z5rlgedsHPm6lhSw@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5rlgedsHPm6lhSw@intel.com>
X-ClientProxiedBy: MW4PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:303:b9::26) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 55012472-2aff-4b36-bfce-08dd416f5530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?T55z+0wng51JlFMnQUp+qjVUQa6tD0E8Z2XCgJwu6qbQ4oIvVUaLkaBfJn?=
 =?iso-8859-1?Q?RKVFvY8icC+mkT3PdGl3QsMH2zMvmjjOzsNlrZgduTT4eZmXs28pbxrPEv?=
 =?iso-8859-1?Q?yk8QbDw0zQziioLy4ltwGpO4cGgXGL1nPc0Pmc4P3JTTxW/GnJLPwpAoyL?=
 =?iso-8859-1?Q?n8TAeelDZC2z26iCHyb3/WkeVmN9ZLpjgrUqX5X3qctOTZst35VAl2Qjva?=
 =?iso-8859-1?Q?8TTWGsQ5uoIk5uj4I0Nk7m+vHhV70A/SR9fYFavfOEwyid30Uy4d1OXYUu?=
 =?iso-8859-1?Q?IDIno0V6yK+1ZnkgyrVhjCVEEk2HYuUBhNzKUpfaYBbzJh3VoDtV6gu+Xm?=
 =?iso-8859-1?Q?MkyoSbWpKtSy33CgVRMGVlJ0eXDCmtqzNgn61G06pIB7rrcJT2hglHy8Uk?=
 =?iso-8859-1?Q?8EMiYLdfpAytsIVj24OVreUkSWaHwKUksNQ7ibm0pgnztVm001VjeagfII?=
 =?iso-8859-1?Q?ZpTUAeHRyJytUhuyh+k28mVLIMmHbqB5EAhyK/GhngckA78IdbM8NXw4iG?=
 =?iso-8859-1?Q?3st461b9xxiPR+bUeNa5QSt3hAgmxrkJpV4Ccp4dcWvWGUIbiFqIZmNBpA?=
 =?iso-8859-1?Q?LBCbpruYWIxK37NV39aT4GFW3sjTWpNFeywE4o66Xo5uZYrRwsHx/Bw3xg?=
 =?iso-8859-1?Q?bLvlDnMbLKuPNyXThaTiWKMGWm8VMBXFphlomqLq3kXxUqtSYhxdefAwJV?=
 =?iso-8859-1?Q?wwJvBUL4DASLVZwdPU+A9D50NCHCT2+BP2dZCIbegtmaY6vvxkNkTT/pca?=
 =?iso-8859-1?Q?9fCXZtQfnQgUGHR+7KgHm5auOtX8uOYfvVwTov4uA+oia/F0OEqXiMWibd?=
 =?iso-8859-1?Q?dARbBf3gIKFqxC+6qg+H0PGNpP2ldjh1yOSQE2rl9NBhxBniDhUqJIfO6m?=
 =?iso-8859-1?Q?U7nSdpQYWCDE613nFC7zy59Zn9hbuL8kYsLHMytrmJ90RxKJ7frWH1zYeL?=
 =?iso-8859-1?Q?aT8KJQX/WY744AaxM9PEyVRB2xsMJcU3q4w5HcvosvC/QJ6wyRcAOk3VLj?=
 =?iso-8859-1?Q?O2ZCgZWSX7D33UhbWBtqedwyOblKfFtwWUGAF5uWOyxeE6wEeQiNiZKW+r?=
 =?iso-8859-1?Q?mOCYoR7sZxs7RmkN8Z2H9TA2Kv5FrXQI3ikRS33HYQYHsIV9FmdU9elP+k?=
 =?iso-8859-1?Q?rMFSoZEk1uG30UBEmC3K6hhfsttTFUn0hin0T8NNh+MlW0EuVw3EqcsGk5?=
 =?iso-8859-1?Q?39QkiO63y9OfA6H5Tdxt231ZEAk31v4+uhkzkQvxtfP0tU4tCy8eShg0Mk?=
 =?iso-8859-1?Q?PjMRAHEkoiAxSrmQKuPL0UY1wk13Ck+IhpQ2SCZzVTbLDVn61IaMYHMJ8v?=
 =?iso-8859-1?Q?323JjA4R7d8xe6zC53FErlw48DEBETdpPh/otQV44qdyHb0sMrb4aZqxO2?=
 =?iso-8859-1?Q?qq4j21vPtFauf8dkRVhtTwWkZixFwgRFYL5kCuIS3x2pVRGUjN5f2WIl0s?=
 =?iso-8859-1?Q?I+3BFrtfFPwWxyZk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hrCPHJOwUfGnOdOFV2PLDhxqjep/Gv4aDTfzcaIbKsOCTtEkP71zvHQTjs?=
 =?iso-8859-1?Q?AETspRK8RLHXpFVls8msE1rKkWOFuBlWSjDy/LQohcrLdfMUJghrHeY42+?=
 =?iso-8859-1?Q?sM/HnK7KN1GAat4dFEWIrFb67TO1S7wHlUze4MeH4HwxpMpuQv8Mb5n63v?=
 =?iso-8859-1?Q?de6SUWvSb+5R7/TIisffdu0Lq6kCWJkDkCt0NOLGRUk9mKwtvhYQg8n0Ec?=
 =?iso-8859-1?Q?wAxWQ4VFvdd70VG6q1IHi40T92CW/blz9RD781h4QiJsLHDStGXCH6cKEm?=
 =?iso-8859-1?Q?LgZMywSHcW2HNF/lHDjCGLxBxkYpQAdT8qzDvTDkHmg4TlVViGIXM79Aai?=
 =?iso-8859-1?Q?QlOWJ3gKdKj8v3tahDBbzV0yhfZMdXALqKsbwLG9YoTpyRoFjllL4Ctyoh?=
 =?iso-8859-1?Q?oMM2Fve0jTpy+UzRmx5JiMqSUjOfqSWE3fV4OdKIT+bEGklY9HKtg6uymc?=
 =?iso-8859-1?Q?kVNEf7rXYM4Dry1Q83OaLITpRXMUkvZkoj/p9Fqh/LKlhighVrtNVp9lYT?=
 =?iso-8859-1?Q?RWwWa8h0XknFlCwE5dpy4Sq60WJeLCwcdf9dpL3c8Duwp3orAJ1JYJuoCw?=
 =?iso-8859-1?Q?/gQ2TyzIJVA9UdkLpVwaWIVaVk5Ds6+z7lpbU7FqWimMs08ZkF8wZm6qXj?=
 =?iso-8859-1?Q?6XeYE221L1GlX1HvWQYsYeouRGjDZN+kjIxwqeIOPmCK4nf1LVEOadiVBK?=
 =?iso-8859-1?Q?VIepnUH6UOasQlQP7oFMwD0qK0CDtqS/3FAKU3KTvU2fwBMcqVB/75hce0?=
 =?iso-8859-1?Q?9ywRsD6USwUPJKEhUkeYq/A3J8RmaS5Rkew24BcaLp5AUE5HT9Daz/wKTr?=
 =?iso-8859-1?Q?nYWrX9W0IntU1RCPk9Ds3xSE+2wCcAkYjxd001PnW7cJlF2HKk0D2KK8l1?=
 =?iso-8859-1?Q?m89ceMsyg07OIXLQigY3diQ/3L9hACWGsnWbLeLTJ3ahUzRk/dmgwAMko0?=
 =?iso-8859-1?Q?DjmtpPndxRfb3J1B/MxA8/bdetKf0CPyrBzHVTjXBpxZ9cA5/tYwFAkUAS?=
 =?iso-8859-1?Q?HWVEYM5mqZctiUFkC+smKqO+IYVDpsf3iAx7eja1j4gIKiIp7lQyxcswB2?=
 =?iso-8859-1?Q?ufCmTCFkrFqqccQ6abM24zgqRYFrit1W7mhCtF48892YAblseI0Z4+ZiTG?=
 =?iso-8859-1?Q?tSJVbx9RK95/2FFkOMeqniDcRK3wuLxf4XM2G5Z+Oj5gUCFQCv5uZxznxJ?=
 =?iso-8859-1?Q?zH56T8KPtQIt5g4rWREujIvMo0OHVtOWc/rz92JllkF82CsVRpwi9/fh/6?=
 =?iso-8859-1?Q?B1sfYIYKUJ9tu56B2se50d4TmbFNv0dFk6BLbEFGEWEm2IlT6ufSfOPchA?=
 =?iso-8859-1?Q?Qdn2M5zLs9Cc9oVbHhJxkCJL5TuAdVcngzvJ0tSD2N2Sjf0qtYx00jsYh/?=
 =?iso-8859-1?Q?LTWhfPJGrXhBb9ZRbGr/fq4MgXXUlV+D1Bqi1f2+DVzFxupkcJ/Fh6f5ch?=
 =?iso-8859-1?Q?uld7HLrNGET8fumLGUb7iCotc0HoZRhUe58dXdvaPnryYSTJT8CLB5BzI+?=
 =?iso-8859-1?Q?NoI80PHP6uCF72Gi22Og9R9/55ZoZLR1/nBa5a1EP/UVuEvEAbgL242cG1?=
 =?iso-8859-1?Q?x0vT5OV2tB/llZHooaN0NC0bP+HnNpNzgWI5Y81rHA4Ypy7QD7PAzH7Zxm?=
 =?iso-8859-1?Q?N+yx/YR6hVBN6Dn4XASI3n7PVknCb5dHabioI+FxopMSLizsjAvPQyBg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55012472-2aff-4b36-bfce-08dd416f5530
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 20:47:38.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iEzz7JNKtJ76nhoCALIzrgB1+dlQaY/3UFZYodbzVsbz3qfVIkf0uKQBygHWNz/01Zo/Xa2fOPK+EgaX/zyZU69EjYf6yoBIK6fo6rEdos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6940
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

On Wed, Jan 29, 2025 at 09:35:45PM -0500, Rodrigo Vivi wrote:
>On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
>> On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
>> > GuC provides support to read engine counters to calculate the
>> > engine activity. KMD exposes two counters via the PMU interface to
>> > calculate engine activity
>> >
>> > Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
>> > Engine Total Ticks (engine-total-ticks) - total ticks of engine
>> >
>> > Engine activity percentage can be calculated as below
>> > Engine activity % = (engine active ticks/engine total ticks) * 100.
>> >
>> > v2: fix cosmetic review comments
>> >    add forcewake for gpm_ts (Umesh)
>> >
>> > v3: fix CI hooks error
>> >    change function parameters and unpin bo on error
>> >    of allocate_activity_buffers
>> >    fix kernel-doc (Umesh)
>> >    use engine activity (Umesh, Lucas)
>> >    rename xe_engine_activity to xe_guc_engine_*
>> >    fix commit message to use per-engine class(Lucas)
>> >
>> > v4: remove forcewake as engine is already running
>> >    when reading gpm timestamp
>>
>> + Rodrigo
>>
>> Sorry, I think I mentioned offline that the runtime pm get is sufficient for
>> reading this register, but it's not. It does need a forcewake of the GT
>> domain.  At the same time, we cannot use the xe_force_wake_get because of
>> the lockdep issue you mentioned and also I assume that xe_force_wake_get may
>> sleep and the event may be read from irq context.
>
>I don't understand this statement entirely. force wake get cannot sleep.
>It is based on spin locks. It should not be issuing any lockdep here.

in the read call, perf is holding a raw_spinlock. You can't take a spinlock
when you hold a raw_spinlock, so you can't even check if you need a force wake.
In a RT kernel, spinlock may sleep, raw_spinlock may not.

We are only not getting splats on drm-tip because the pmu in i915 got
the locks wrong and the temporary solution starting from 6.13 was to
shoot the messenger:

	177ab7c0296b ("Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING."")

I'm starting to think it's better to remove that patch and disabling
perf_pmu CI for i915.  Becauses we almost did the same mistake in xe
since CI is not covering that.  I started to fix i915 a few weeks ago,
but then got side tracked with other things... I may return to that
soon.


>It is quite simple flow with minimal or none interdependency. Remember
>that in i915 for instance it exists and lives in the middle of every
>mmio read and write call...

and it's wrong

>
>>
>> I would check if we can add a helper xe_force_wake_get_if_active() and just
>> use that to bump up the wakeref.
>
>I would prefer to not complicate things...

also see my other reply to Umesh: _if_active() wouldn't work neither.

As it stands in the perf core, we either convert the lock needed to be a
raw_spinlock, or we need to move the actual hw read to another context
as I suggested.

Lucas De Marchi

>
>>
>> @Rodrigo, @Vinay Any thoughts on this ^ ?
>
>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
>>
>> Thanks,
>> Umesh
>>
>> >
>> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/Makefile                   |   1 +
>> > drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>> > drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
>> > .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
>> > drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>> > drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>> > 8 files changed, 451 insertions(+)
>> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> >
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index 328aff36831b..7e93461c60bd 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>> > 	xe_device_sysfs.o \
>> > 	xe_dma_buf.o \
>> > 	xe_drm_client.o \
>> > +	xe_guc_engine_activity.o \
>> > 	xe_exec.o \
>> > 	xe_execlist.o \
>> > 	xe_exec_queue.o \
>> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > index fee385532fb0..ec516e838ee8 100644
>> > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > @@ -140,6 +140,7 @@ enum xe_guc_action {
>> > 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>> > 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>> > 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> > +	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> > 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>> > 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>> > 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index 096859072396..124cc398798e 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -358,6 +358,8 @@
>> > #define   RENDER_AWAKE_STATUS			REG_BIT(1)
>> > #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>> >
>> > +#define MISC_STATUS_0				XE_REG(0xa500)
>> > +
>> > #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>> > #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>> > #define FORCEWAKE_GSC				XE_REG(0xa618)
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > new file mode 100644
>> > index 000000000000..088209b9c228
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > @@ -0,0 +1,317 @@
>> > +// SPDX-License-Identifier: MIT
>> > +/*
>> > + * Copyright © 2025 Intel Corporation
>> > + */
>> > +#include "xe_guc_engine_activity.h"
>> > +
>> > +#include "abi/guc_actions_abi.h"
>> > +#include "regs/xe_gt_regs.h"
>> > +
>> > +#include "xe_bo.h"
>> > +#include "xe_force_wake.h"
>> > +#include "xe_gt_printk.h"
>> > +#include "xe_guc.h"
>> > +#include "xe_guc_ct.h"
>> > +#include "xe_hw_engine.h"
>> > +#include "xe_map.h"
>> > +#include "xe_mmio.h"
>> > +
>> > +#define TOTAL_QUANTA 0x8000
>> > +
>> > +static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> > +	size_t offset = 0;
>> > +
>> > +	offset = offsetof(struct guc_engine_activity_data,
>> > +			  engine_activity[guc_class][hwe->logical_instance]);
>> > +
>> > +	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>> > +}
>> > +
>> > +static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > +
>> > +	return buffer->metadata_bo->vmap;
>> > +}
>> > +
>> > +static int allocate_engine_activity_group(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	u32 num_activity_group = 1;
>> > +
>> > +	engine_activity->eag = kmalloc_array(num_activity_group,
>> > +					     sizeof(struct engine_activity_group),
>> > +					     GFP_KERNEL);
>> > +
>> > +	if (!engine_activity->eag)
>> > +		return -ENOMEM;
>> > +
>> > +	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
>> > +	engine_activity->num_activity_group = num_activity_group;
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int allocate_engine_activity_buffers(struct xe_guc *guc,
>> > +					    struct engine_activity_buffer *buffer)
>> > +{
>> > +	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>> > +	u32 size = sizeof(struct guc_engine_activity_data);
>> > +	struct xe_gt *gt = guc_to_gt(guc);
>> > +	struct xe_tile *tile = gt_to_tile(gt);
>> > +	struct xe_bo *bo, *metadata_bo;
>> > +
>> > +	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>> > +						   XE_BO_FLAG_SYSTEM |
>> > +						   XE_BO_FLAG_GGTT |
>> > +						   XE_BO_FLAG_GGTT_INVALIDATE);
>> > +	if (IS_ERR(metadata_bo))
>> > +		return PTR_ERR(metadata_bo);
>> > +
>> > +	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>> > +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> > +					  XE_BO_FLAG_GGTT |
>> > +					  XE_BO_FLAG_GGTT_INVALIDATE);
>> > +
>> > +	if (IS_ERR(bo)) {
>> > +		xe_bo_unpin_map_no_vm(metadata_bo);
>> > +		return PTR_ERR(bo);
>> > +	}
>> > +
>> > +	buffer->metadata_bo = metadata_bo;
>> > +	buffer->activity_bo = bo;
>> > +	return 0;
>> > +}
>> > +
>> > +static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>> > +{
>> > +	struct xe_guc *guc = &hwe->gt->uc.guc;
>> > +	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>> > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> > +
>> > +	return &eag->engine[guc_class][hwe->logical_instance];
>> > +}
>> > +
>> > +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>> > +{
>> > +	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>> > +}
>> > +
>> > +#define read_engine_activity_record(xe_, map_, field_) \
>> > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>> > +
>> > +#define read_metadata_record(xe_, map_, field_) \
>> > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>> > +
>> > +static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > +{
>> > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> > +	struct guc_engine_activity *cached_activity = &ea->activity;
>> > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct iosys_map activity_map, metadata_map;
>> > +	struct xe_device *xe =  guc_to_xe(guc);
>> > +	struct xe_gt *gt = guc_to_gt(guc);
>> > +	u32 last_update_tick, global_change_num;
>> > +	u64 active_ticks, gpm_ts;
>> > +	u16 change_num;
>> > +
>> > +	activity_map = engine_activity_map(guc, hwe);
>> > +	metadata_map = engine_metadata_map(guc);
>> > +	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>> > +
>> > +	/* GuC has not initialized activity data yet, return 0 */
>> > +	if (!global_change_num)
>> > +		goto update;
>> > +
>> > +	if (global_change_num == cached_metadata->global_change_num)
>> > +		goto update;
>> > +	else
>> > +		cached_metadata->global_change_num = global_change_num;
>> > +
>> > +	change_num = read_engine_activity_record(xe, &activity_map, change_num);
>> > +
>> > +	if (!change_num || change_num == cached_activity->change_num)
>> > +		goto update;
>> > +
>> > +	/* read engine activity values */
>> > +	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
>> > +	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
>> > +
>> > +	/* activity calculations */
>> > +	ea->running = !!last_update_tick;
>> > +	ea->total += active_ticks - cached_activity->active_ticks;
>> > +	ea->active = 0;
>> > +
>> > +	/* cache the counter */
>> > +	cached_activity->change_num = change_num;
>> > +	cached_activity->last_update_tick = last_update_tick;
>> > +	cached_activity->active_ticks = active_ticks;
>> > +
>> > +update:
>> > +	if (ea->running) {
>> > +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>> > +			 engine_activity->gpm_timestamp_shift;
>> > +		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>> > +	}
>> > +
>> > +	return ea->total + ea->active;
>> > +}
>> > +
>> > +static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > +{
>> > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>> > +	struct guc_engine_activity *cached_activity = &ea->activity;
>> > +	struct iosys_map activity_map, metadata_map;
>> > +	struct xe_device *xe = guc_to_xe(guc);
>> > +	ktime_t now, cpu_delta;
>> > +	u64 numerator;
>> > +	u16 quanta_ratio;
>> > +
>> > +	activity_map = engine_activity_map(guc, hwe);
>> > +	metadata_map = engine_metadata_map(guc);
>> > +
>> > +	if (!cached_metadata->guc_tsc_frequency_hz)
>> > +		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>> > +									     guc_tsc_frequency_hz);
>> > +
>> > +	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
>> > +	cached_activity->quanta_ratio = quanta_ratio;
>> > +
>> > +	/* Total ticks calculations */
>> > +	now = ktime_get();
>> > +	cpu_delta = now - ea->last_cpu_ts;
>> > +	ea->last_cpu_ts = now;
>> > +	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>> > +	ea->quanta_ns += numerator / TOTAL_QUANTA;
>> > +	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>> > +	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>> > +
>> > +	return ea->quanta;
>> > +}
>> > +
>> > +static int enable_engine_activity_stats(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > +	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>> > +	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>> > +	int len = 0;
>> > +	u32 action[5];
>> > +
>> > +	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>> > +	action[len++] = metadata_ggtt_addr;
>> > +	action[len++] = 0;
>> > +	action[len++] = ggtt_addr;
>> > +	action[len++] = 0;
>> > +
>> > +	/* Blocking here to ensure the buffers are ready before reading them */
>> > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> > +}
>> > +
>> > +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct engine_activity_group *eag = &engine_activity->eag[0];
>> > +	int i, j;
>> > +
>> > +	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>> > +		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>> > +			eag->engine[i][j].last_cpu_ts = ktime_get();
>> > +}
>> > +
>> > +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>> > +{
>> > +	u32 reg;
>> > +
>> > +	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>> > +
>> > +	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> > +}
>> > +
>> > +/**
>> > + * xe_guc_engine_activity_active_ticks - Get engine active ticks
>> > + * @hwe: The hw_engine object
>> > + *
>> > + * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>> > + */
>> > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>> > +{
>> > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>> > +
>> > +	return get_engine_active_ticks(guc, hwe);
>> > +}
>> > +
>> > +/**
>> > + * xe_guc_engine_activity_total_ticks - Get engine total ticks
>> > + * @hwe: The hw_engine object
>> > + *
>> > + * Return: accumulated quanta of ticks allocated for the engine
>> > + */
>> > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>> > +{
>> > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>> > +
>> > +	return get_engine_total_ticks(guc, hwe);
>> > +}
>> > +
>> > +/**
>> > + * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>> > + * @guc: The GuC object
>> > + *
>> > + * Enable engine activity stats and set initial timestamps
>> > + */
>> > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>> > +{
>> > +	int ret;
>> > +
>> > +	ret = enable_engine_activity_stats(guc);
>> > +	if (ret)
>> > +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>> > +	else
>> > +		engine_activity_set_cpu_ts(guc);
>> > +}
>> > +
>> > +static void engine_activity_fini(void *arg)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = arg;
>> > +
>> > +	kfree(engine_activity->eag);
>> > +}
>> > +
>> > +/**
>> > + * xe_guc_engine_activity_init - Initialize the engine activity data
>> > + * @guc: The GuC object
>> > + *
>> > + * Return: 0 on success, negative error code otherwise.
>> > + */
>> > +int xe_guc_engine_activity_init(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct xe_gt *gt = guc_to_gt(guc);
>> > +	int ret;
>> > +
>> > +	ret = allocate_engine_activity_group(guc);
>> > +	if (ret) {
>> > +		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>> > +		return ret;
>> > +	}
>> > +
>> > +	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>> > +	if (ret) {
>> > +		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>> > +		kfree(engine_activity->eag);
>> > +		return ret;
>> > +	}
>> > +
>> > +	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>> > +
>> > +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
>> > +					engine_activity);
>> > +}
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > new file mode 100644
>> > index 000000000000..c00f3da5513d
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > @@ -0,0 +1,18 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright © 2025 Intel Corporation
>> > + */
>> > +
>> > +#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>> > +#define _XE_GUC_ENGINE_ACTIVITY_H_
>> > +
>> > +#include <linux/types.h>
>> > +
>> > +struct xe_hw_engine;
>> > +struct xe_guc;
>> > +
>> > +int xe_guc_engine_activity_init(struct xe_guc *guc);
>> > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>> > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>> > +#endif
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> > new file mode 100644
>> > index 000000000000..a2ab327d3eec
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> > @@ -0,0 +1,89 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright © 2025 Intel Corporation
>> > + */
>> > +
>> > +#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>> > +#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>> > +
>> > +#include <linux/types.h>
>> > +
>> > +#include "xe_guc_fwif.h"
>> > +/**
>> > + * struct engine_activity - Engine specific activity data
>> > + *
>> > + * Contains engine specific activity data and snapshot of the
>> > + * structures from GuC
>> > + */
>> > +struct engine_activity {
>> > +	/** @active: current activity */
>> > +	u64 active;
>> > +
>> > +	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>> > +	u64 last_cpu_ts;
>> > +
>> > +	/** @quanta: total quanta used on HW */
>> > +	u64 quanta;
>> > +
>> > +	/** @quanta_ns: total quanta_ns used on HW */
>> > +	u64 quanta_ns;
>> > +
>> > +	/**
>> > +	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>> > +	 * per the quanta_ratio. This remainder is used in subsequent
>> > +	 * quanta calculations.
>> > +	 */
>> > +	u64 quanta_remainder_ns;
>> > +
>> > +	/** @total: total engine activity */
>> > +	u64 total;
>> > +
>> > +	/** @running: true if engine is running some work */
>> > +	bool running;
>> > +
>> > +	/** @metadata: snapshot of engine activity metadata */
>> > +	struct guc_engine_activity_metadata metadata;
>> > +
>> > +	/** @activity: snapshot of engine activity counter */
>> > +	struct guc_engine_activity activity;
>> > +};
>> > +
>> > +/**
>> > + * struct engine_activity_group - Activity data for all engines
>> > + */
>> > +struct engine_activity_group {
>> > +	/** @engine: engine specific activity data */
>> > +	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > +};
>> > +
>> > +/**
>> > + * struct engine_activity_buffer - engine activity buffers
>> > + *
>> > + * This contains the buffers allocated for metadata and activity data
>> > + */
>> > +struct engine_activity_buffer {
>> > +	/** @activity_bo: object allocated to hold activity data */
>> > +	struct xe_bo *activity_bo;
>> > +
>> > +	/** @metadata_bo: object allocated to hold activity metadata */
>> > +	struct xe_bo *metadata_bo;
>> > +};
>> > +
>> > +/**
>> > + * struct xe_guc_engine_activity - Data used by engine activity implementation
>> > + */
>> > +struct xe_guc_engine_activity {
>> > +	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>> > +	u32 gpm_timestamp_shift;
>> > +
>> > +	/** @num_activity_group: number of activity groups */
>> > +	u32 num_activity_group;
>> > +
>> > +	/** @eag: holds the device level engine activity data */
>> > +	struct engine_activity_group *eag;
>> > +
>> > +	/** @device_buffer: buffer object for global engine activity */
>> > +	struct engine_activity_buffer device_buffer;
>> > +};
>> > +#endif
>> > +
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > index 057153f89b30..6f57578b07cb 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > @@ -208,6 +208,25 @@ struct guc_engine_usage {
>> > 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > } __packed;
>> >
>> > +/* Engine Activity stats */
>> > +struct guc_engine_activity {
>> > +	u16 change_num;
>> > +	u16 quanta_ratio;
>> > +	u32 last_update_tick;
>> > +	u64 active_ticks;
>> > +} __packed;
>> > +
>> > +struct guc_engine_activity_data {
>> > +	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > +} __packed;
>> > +
>> > +struct guc_engine_activity_metadata {
>> > +	u32 guc_tsc_frequency_hz;
>> > +	u32 lag_latency_usec;
>> > +	u32 global_change_num;
>> > +	u32 reserved;
>> > +} __packed;
>> > +
>> > /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>> > enum xe_guc_recv_message {
>> > 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> > index 573aa6308380..63bac64429a5 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> > @@ -13,6 +13,7 @@
>> > #include "xe_guc_ads_types.h"
>> > #include "xe_guc_buf_types.h"
>> > #include "xe_guc_ct_types.h"
>> > +#include "xe_guc_engine_activity_types.h"
>> > #include "xe_guc_fwif.h"
>> > #include "xe_guc_log_types.h"
>> > #include "xe_guc_pc_types.h"
>> > @@ -103,6 +104,9 @@ struct xe_guc {
>> > 	/** @relay: GuC Relay Communication used in SR-IOV */
>> > 	struct xe_guc_relay relay;
>> >
>> > +	/** @engine_activity: Device specific engine activity */
>> > +	struct xe_guc_engine_activity engine_activity;
>> > +
>> > 	/**
>> > 	 * @notify_reg: Register which is written to notify GuC of H2G messages
>> > 	 */
>> > --
>> > 2.47.1
>> >
