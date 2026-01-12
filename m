Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F65CF45AE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 17:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0135110E422;
	Mon, 12 Jan 2026 17:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYvcVY6g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56B410E422
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768237210; x=1799773210;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9ez/w7Lao+UiUjJ3iQEyXZl38Ju0mu+V2Jl5gLhvAFw=;
 b=hYvcVY6gQLknGsBblsCUXA/8cTZuwxmTy1wnZXZePBnocUDJvxQe7kj5
 bbURkj0O7L8exS/lNMLDIvH3LiwwQXnUoVKescAviY4wOdyE1ZQQrMXGm
 R+auDTSmg8eGeDuk+F1DgOGbCNkeM5fuYlEA5FYmYs2Kc23TOYUMX8VMO
 dGHGjg/UeSLCh+scDtad4vON/r7I6gL4FU4eho+ZgB5jxYKh/mmn2FoQ1
 UuX2FUHZ5nwY9pQZMNwMVssqx/2GFjilW2gwC8WojP6ZcyrFX6EdBAxiI
 BgkryheDw6Wnhs63ANtApPijGu1wN6viOCU5nt8y8w0gy8V1sOwKryR3U w==;
X-CSE-ConnectionGUID: YCHtBpvkRk+NT80BDsQ0yw==
X-CSE-MsgGUID: XPWEtpISQ66DdyKWdVzjUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86930539"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="86930539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 09:00:09 -0800
X-CSE-ConnectionGUID: WQbHkhjISQKPmyI8aOakOA==
X-CSE-MsgGUID: ZQcGtwG9TN29EUwYyzrnuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="203348239"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 09:00:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 09:00:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 09:00:08 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 09:00:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShBeQQxokzHHHJrYFmVELMMHGM3ucuT6A+V12jcGRBR3SdJAP1pypdoYOHjjOVNRvEfVOksWCpCeXpSpmDg0ZDj0gz7Qz8c6I2HaVrgE0P1KXqPG6xr8LDhTTqnO1CkCcO3p+40fGMQiPY0rspmy48E5M9iRiEkWfSGl4ojVq04gvS1RLK+3rc41/vS/FVLYZ0OKcFlGBl/ADFakz/xHu+dsCkO/idBRbwAvsSvA1GBij29sFr5cgKRieHsdDW5sMMr+ZhiR6O8BdXZ5c/Uo6EM7pU+cY84PeJ0HkBKbwmMORx2tDndYBp/NUyQlabGru2/xR5pkPyYffry0Xz6kkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3t08l6kVXBrPUR85lx+hvfo1IdXdFopylTsB/a6doCA=;
 b=uUFu9J8l4FxzczcHEJqV2xMb/GIJ/lm53xM0Hag3Tygkjs3jvKeYAau4CF8Nu1/43S1cjFynuK7noCLphsYFdC/YRnndd/nk6OQIbeZOHAjiysos0tBK4NGweLx6uYlOZyov071OyAHGTuzgnkBslJm6/rsep5PiVAWynPQHU3WEbsFrCnpa6X2WkzlLsQD31wWnC/YBR4QxTKnuTjTvcq+YRetT1O0jmnj06hkceFYrkjijBj1oTalR3ycNCAlOMDUwbg8wlJxsaAukFyPR06all6IzFBRzLmsfFbJjsa5JKzAb11FmS6PkANapNDeRRl3ph5cgx6RpdfwHKwhgnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 17:00:02 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%3]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 17:00:02 +0000
Date: Mon, 12 Jan 2026 08:59:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/device: Convert wait for lmem init into an assert
Message-ID: <20260112165959.GC458797@mdroper-desk1.amr.corp.intel.com>
References: <20251219145024.2955946-2-balasubramani.vivekanandan@intel.com>
 <176643787576.111846.4832379078077660731@a3b018990fe9>
 <aVt6TN7UaIFAZMaa@bvivekan-mob1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aVt6TN7UaIFAZMaa@bvivekan-mob1>
X-ClientProxiedBy: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
 To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 205d3d81-418d-4d03-84cb-08de51fc06ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7qeY4fcVAdNwTdPVMHiwoaIzgQKwa8CJxRxpABKcUrjtwLcW6j/pzBS7rja7?=
 =?us-ascii?Q?iEZX32Suu9+CZRxy+sQ0mLGHSqjor0nebG/FeCAlbwJxsnwqlKUjJXxEWTQN?=
 =?us-ascii?Q?lxDo3qTelV7rKgvBLG372tKaFhkpC4xBCq7RF66OdfslY6eaWi9X1llJ/z0o?=
 =?us-ascii?Q?VhHP/i1oWnqHdruS+fNb6qpnevuX2Sv97tp0xQkKkZJXfRW/znJj/hie3i7s?=
 =?us-ascii?Q?zP94gK0Cytz1K8zUT66tZJCS1L8bFXn7h+MdMS74wlImpK92TfrgKqipX/3a?=
 =?us-ascii?Q?lSqFdFLnGBEJdEbqss0DKApx1HaxLGObju4jU0aHsfnIqtO3XQ4XxjxCdzEY?=
 =?us-ascii?Q?Vi9sgmYDM/iVh0vxKmFQcQc6ZqfhwqcPNwKcQ3XREKTA/Vpod6QtnbB0eJjA?=
 =?us-ascii?Q?k15tMxkweiXv+ZLWaQR4agJ7iQ7U3AJtY0sKC6iFb7+J9O1l9MMJsyotMAAc?=
 =?us-ascii?Q?XpJv1CIPxsyzDUQMAnK42sJUvOJLUh9a99p0VCVfZYmijcl6TIFhLgKic4Os?=
 =?us-ascii?Q?i06oo3OWgBtrNkjR7qS56GLJsUl9TZdNBfg2ow1qE8C7fBPbkAx0IcRbkDf8?=
 =?us-ascii?Q?r8GG4Oj53Kg/yrC4N10qzAXGGWHSpb0PpqeLdgUkfvP7/1b42iFiKjSbGyGW?=
 =?us-ascii?Q?/6ZxOOv/wbO6lYfArkiAs1kTDRiRNvVpXeaoi8LMFp1+8XC/F4l+iDpn25pP?=
 =?us-ascii?Q?7EZCQrIDz989oFs1Tbeizo6nuOm1JfAn3dUipPxE8Ww9TXJvRXhcaMEr3Q4T?=
 =?us-ascii?Q?UGhKx27wx4G5fPMqooPZpz0/wwAh4aK0Fdh/MuXQBlZ4BjvpNXJ4x/U7D2aF?=
 =?us-ascii?Q?DKaX9rbMmLN+1WCX7HS0J8V2wwKjWrGG8RzZmfcV2QijF7OM1lWrPmkEubLv?=
 =?us-ascii?Q?N5jh9waetNOvWuvPsZfxAE0y1QR+n/7/mDmGpcD3/sAzqsSiU3QV37Bepxxo?=
 =?us-ascii?Q?QPulyjv8YE75Da98uscp8AOSW9FZYqiF+fvu4bprau0uDVrpyZn7KCoIDhQF?=
 =?us-ascii?Q?H4y8bxNjhWbgI6yU5mFR13fdUKOxSJ8AJGk4AQpMw2j4CI4zn/RfTlgXtQ00?=
 =?us-ascii?Q?doVxAUYiKR1f14m0eD7kLE5JfMUU8XQVdNzRww0kwbVt3pIORY1BRWiPfQjL?=
 =?us-ascii?Q?dnc0sZPaNpH0zv0MUH1sw1SwVZnK6rN+AMn8IBgZFkShXLSDhCbZDQ9HUdM+?=
 =?us-ascii?Q?8jpW2OquuayVD6/U6lYOUDMq+yzRu02i8QzYzzk4LM2Mpvgerj0O8OoTDpoJ?=
 =?us-ascii?Q?O2E6j4mv7/FgWiXK5FIVRYDC8R4TR6zWJ1FOUGOmumhf6lOhM2LgW21fHuIw?=
 =?us-ascii?Q?rv3jXK6OmuYGOmLd/Yk45r30/vzoz3I9MeVkpPtUO+dE5u9ndRNh6WRffAC1?=
 =?us-ascii?Q?33GBLeO1VsaHYdZjv7KhlVdR1U00+RVe64QjqGpb7dsDKXnQ/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vd4+3TSkuwCo53Zdkjr0Kvdw9JmRz0f9ikcCUzIt9HIXxtuFKY6ElhFoyqdC?=
 =?us-ascii?Q?6U4q62QPx/CHH56GuTllMA9d/P5VKnn2B+w8evrMAqyuazD4pvoVdJJcRLg+?=
 =?us-ascii?Q?R6jVEl2Lb19ZUpmtnKBpExKmDYvcy+tEMiu28ZOAyEnUpFiYeVAhI1/gHWu6?=
 =?us-ascii?Q?4KeGGb6jcV4fiWiJcRC8kjSMNK56vM9qUHIA6VnEB1lRFuZXYGEIr3r9SyNn?=
 =?us-ascii?Q?k/bj18oYoPDZBfccHscYUCOYmQD8EoYTuKvhXbsNppzdcbjpUqlfmnpm2HLs?=
 =?us-ascii?Q?gd+Ox5LdhhTB1/EtEhxBkH6Wkx1nPaiYC3Wh2qRBRT1RHGV4032FpGTv/Buz?=
 =?us-ascii?Q?VqQV6K1eFXviv9bixhSXQQ5xAYyU8aOUAXTWcTYSsn7Osz+e+dw6ihI1HFw7?=
 =?us-ascii?Q?Eg3mTW7dFgHTXtnye5V1QvvDB+qYsX9u7NicrWREtKcjHFoepuIRVTGwJTyd?=
 =?us-ascii?Q?/d78HXtPVHByhDQokIDKdjMDrxw6l2jHCqYgrzm6OWzMZK1PS8wointXzZ6k?=
 =?us-ascii?Q?6qNFMr5N1n1OyqeAYFGDejZOdXADHOco+fnWOSdi5zQm0CYKcnjz5t1waZIH?=
 =?us-ascii?Q?AgFTt170GuIj5xxu0B3l/DLoVAKVrvFOEZ+PzKZRbmUg56vhp5ThazXtzhNC?=
 =?us-ascii?Q?4cGBaDCjG1190ge38gCT42bN1a3eCi6TsrTzN+Rkug6As5U9cFSyqBCMq/+p?=
 =?us-ascii?Q?F6Aq83KvHd/AsBxKeCN1poxobhH6NC6U4l0B8WwdmeFGEs9Q+F+fqcDNWdxn?=
 =?us-ascii?Q?Bj62jOfrdWkqyDZN5m9j3VMB+mx6jLkd9OgO+mckNIAJRUzBXLEpGml3jczX?=
 =?us-ascii?Q?el9V+ykg+VpfO0FB5Wgqg1eZFIF4x4C8JZzW9SOp9oO1HMurRetF1t9C3uP8?=
 =?us-ascii?Q?Hm2zcBUNJ7yMasayXHPzE2q8EtZ5MGe+Y/IPnkSo2EC9eUhxbCPTYe8EialM?=
 =?us-ascii?Q?5sz8q/tmqSsI2P5ukANy4FhYA36J809J3f2Pj4/ox5VFp2Z+AG0mJ2GewJWo?=
 =?us-ascii?Q?EmQIs9MSSXY8JEUy1fmaqYXuUiY1cBELFYHBlD7UIAlkGsGZde/pnSGXry8d?=
 =?us-ascii?Q?0SkWkn2hQ6PQAodyYU58GCbdjwCAoF0p+pHsvy/85p0xNy9tplQsCY94xs/l?=
 =?us-ascii?Q?ZnfcROaqxLnYBJUAQVF1v2Y1mehNj/tob/nOdRREa9dat16YK2Ic7chK1Cf6?=
 =?us-ascii?Q?IBhEnezJL3JDuV/L1dJEX1rETv3sV6zqdz+b590gU25mXo63tbaWnZN6WdPq?=
 =?us-ascii?Q?WgJCirZ1JZH0zEN8dejaPiRLyTMDt/KJUp2vTxacB27eUWnPgu6l6yFSqQQ5?=
 =?us-ascii?Q?Isf5TTj1N0bFaagvbJoJysKjWPmMR7l3sg3ewPP1IS/owsCttmT4K5Dmo27P?=
 =?us-ascii?Q?hj4utDbpEw5gCr0tOD7vuw7M+pzoJNk+OfPqK4eP78UI8skFFnYu91FcaE/+?=
 =?us-ascii?Q?67xUUUMKrAhoCzvTFYXCkLi35Ub7nEd5YbwQrs2VphySrvxBL0bwb9A0XIOJ?=
 =?us-ascii?Q?1b/5PJuubELM4iXrbPu9THD3F7L4Yeonr/IrMZuPoXJQ9cUQ/apK6a1h1LIk?=
 =?us-ascii?Q?/mnbQoAEIx420dBSCh6P4TUYdgKYdn9vSs7U7CkdkHKaNUwO90AVr0zTh+VO?=
 =?us-ascii?Q?AQ5paqmNH7G1j55x4bRk/Y25bzIlN6yk95p3sPyKhHvoW7H/24SWXR7jE3fc?=
 =?us-ascii?Q?hVDTsDyy2JUsg8OnMk+reG1vdhL2ysqyZw0h3HvzTOnD3D3U2sMMhzdnRG2H?=
 =?us-ascii?Q?AxO3ejpd+Fquvyy0Fb5efwGam0KgyZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 205d3d81-418d-4d03-84cb-08de51fc06ae
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 17:00:02.2726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQMzZ9SvPJLkshmbRXgbgFP7DuRDVoS+chpzthl/DYam2bu9Bf6JEzYBmTN6teJaPgL/19IzjzVo0ljZZ26DHJMTG6y8IWDAKdrthveHChk=
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

On Mon, Jan 05, 2026 at 02:16:04PM +0530, Vivekanandan, Balasubramani wrote:
> On 22.12.2025 21:11, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: drm/xe/device: Convert wait for lmem init into an assert
> > URL   : https://patchwork.freedesktop.org/series/159300/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72_FULL -> xe-pw-159300v1_FULL
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with xe-pw-159300v1_FULL absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in xe-pw-159300v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   
> > 
> > Participating hosts (2 -> 2)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in xe-pw-159300v1_FULL:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
> >     - shard-bmg:          [PASS][1] -> [FAIL][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> >     - shard-lnl:          [PASS][3] -> [FAIL][4]
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> 
> These are expected failures on this patch because the function
> wait_for_lmem_ready is removed. There is already an IGT patch in-flight
> to fix this - https://patchwork.freedesktop.org/series/159151/
> 
> Regards,
> Bala

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-159300v1_FULL that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@core_getversion@basic:
> >     - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#6914])
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@core_getversion@basic.html
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@core_getversion@basic.html
> > 
> >   * igt@core_hotunplug@unbind-rebind:
> >     - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#6779])
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@core_hotunplug@unbind-rebind.html
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html
> > 
> >   * igt@core_setmaster@master-drop-set-user:
> >     - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#4674])
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
> > 
> >   * igt@fbdev@write:
> >     - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2134]) +1 other test skip
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@fbdev@write.html
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@fbdev@write.html
> > 
> >   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> >     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327])
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> > 
> >   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
> >     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
> > 
> >   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> >     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252])
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> > 
> >   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
> >     - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2291])
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> > 
> >   * igt@kms_dsc@dsc-with-bpc:
> >     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2244])
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_dsc@dsc-with-bpc.html
> > 
> >   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> >     - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2316]) +2 other tests skip
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank:
> >     - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#3321]) +1 other test fail
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> >     - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> > 
> >   * igt@kms_flip@flip-vs-suspend-interruptible:
> >     - shard-bmg:          [PASS][25] -> [INCOMPLETE][26] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-10/igt@kms_flip@flip-vs-suspend-interruptible.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
> >     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2293]) +1 other test skip
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
> >     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4141]) +1 other test skip
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2311])
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
> >     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2313])
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
> > 
> >   * igt@kms_hdr@static-toggle-suspend:
> >     - shard-bmg:          NOTRUN -> [ABORT][31] ([Intel XE#6740]) +1 other test abort
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html
> > 
> >   * igt@kms_plane_multiple@2x-tiling-none:
> >     - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#4596])
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
> >     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6886]) +3 other tests skip
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> > 
> >   * igt@kms_pm_rpm@system-suspend-idle:
> >     - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#6693])
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_pm_rpm@system-suspend-idle.html
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_pm_rpm@system-suspend-idle.html
> > 
> >   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
> >     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> > 
> >   * igt@kms_psr@psr2-cursor-plane-move:
> >     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#6703])
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_psr@psr2-cursor-plane-move.html
> > 
> >   * igt@kms_rotation_crc@multiplane-rotation:
> >     - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#1874])
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-3/igt@kms_rotation_crc@multiplane-rotation.html
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation.html
> > 
> >   * igt@kms_scaling_modes@scaling-mode-full-aspect:
> >     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2413])
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> > 
> >   * igt@xe_eudebug@attach-debug-metadata:
> >     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4837]) +1 other test skip
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@xe_eudebug@attach-debug-metadata.html
> > 
> >   * igt@xe_exec_basic@many-bindexecqueue-rebind:
> >     - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#6703]) +564 other tests skip
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
> >     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2322])
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> > 
> >   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:
> >     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4943]) +3 other tests skip
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
> >     - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#6557] / [Intel XE#6703]) +7 other tests skip
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
> > 
> >   * igt@xe_module_load@many-reload:
> >     - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#6913])
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@xe_module_load@many-reload.html
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_module_load@many-reload.html
> > 
> >   * igt@xe_pm@d3hot-mocs:
> >     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6703]) +16 other tests skip
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_pm@d3hot-mocs.html
> > 
> >   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
> >     - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#6251]) +1 other test fail
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@fbdev@nullptr:
> >     - shard-bmg:          [SKIP][54] ([Intel XE#2134]) -> [PASS][55] +2 other tests pass
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@fbdev@nullptr.html
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@fbdev@nullptr.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> >     - shard-bmg:          [SKIP][56] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][57]
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> >     - shard-bmg:          [SKIP][58] ([Intel XE#2291]) -> [PASS][59] +1 other test pass
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> > 
> >   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> >     - shard-bmg:          [SKIP][60] ([Intel XE#2316]) -> [PASS][61] +2 other tests pass
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> > 
> >   * igt@kms_pm_rpm@i2c:
> >     - shard-bmg:          [SKIP][62] ([Intel XE#6693]) -> [PASS][63] +2 other tests pass
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_pm_rpm@i2c.html
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_pm_rpm@i2c.html
> > 
> >   * igt@xe_exec_basic@many-execqueues-null-defer-bind:
> >     - shard-bmg:          [SKIP][64] ([Intel XE#6703]) -> [PASS][65] +469 other tests pass
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
> > 
> >   * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
> >     - shard-bmg:          [SKIP][66] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][67] +7 other tests pass
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html
> > 
> >   * igt@xe_pm@s4-vm-bind-prefetch:
> >     - shard-lnl:          [DMESG-WARN][68] -> [PASS][69]
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
> >    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html
> > 
> >   * igt@xe_pmu@gt-frequency:
> >     - shard-lnl:          [FAIL][70] -> [PASS][71] +1 other test pass
> >    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@xe_pmu@gt-frequency.html
> >    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-lnl-7/igt@xe_pmu@gt-frequency.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_big_fb@linear-32bpp-rotate-90:
> >     - shard-bmg:          [SKIP][72] ([Intel XE#2327]) -> [SKIP][73] ([Intel XE#6703]) +3 other tests skip
> >    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
> >    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> >     - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [SKIP][75] ([Intel XE#2327]) +5 other tests skip
> >    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> >    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-addfb:
> >     - shard-bmg:          [SKIP][76] ([Intel XE#2328]) -> [SKIP][77] ([Intel XE#6703])
> >    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html
> >    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
> >     - shard-bmg:          [SKIP][78] ([Intel XE#1124]) -> [SKIP][79] ([Intel XE#6703]) +8 other tests skip
> >    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> >    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> > 
> >   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> >     - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#1124]) +9 other tests skip
> >    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> >    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> >     - shard-bmg:          [SKIP][82] ([Intel XE#6703]) -> [SKIP][83] ([Intel XE#2314] / [Intel XE#2894])
> >    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> >    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> >     - shard-bmg:          [SKIP][84] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][85] ([Intel XE#6703]) +1 other test skip
> >    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> >    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> > 
> >   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> >     - shard-bmg:          [SKIP][86] ([Intel XE#367]) -> [SKIP][87] ([Intel XE#6703]) +1 other test skip
> >    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> >    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> > 
> >   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> >     - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [SKIP][89] ([Intel XE#367])
> >    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> >     - shard-bmg:          [SKIP][90] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][91] ([Intel XE#6703]) +2 other tests skip
> >    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> >    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
> >     - shard-bmg:          [SKIP][92] ([Intel XE#3432]) -> [SKIP][93] ([Intel XE#6703]) +1 other test skip
> >    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> >    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> >     - shard-bmg:          [SKIP][94] ([Intel XE#2887]) -> [SKIP][95] ([Intel XE#6703]) +11 other tests skip
> >    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> >    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
> >     - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [SKIP][97] ([Intel XE#2887]) +14 other tests skip
> >    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
> >    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
> > 
> >   * igt@kms_cdclk@mode-transition:
> >     - shard-bmg:          [SKIP][98] ([Intel XE#6703]) -> [SKIP][99] ([Intel XE#2724])
> >    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cdclk@mode-transition.html
> >    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_cdclk@mode-transition.html
> > 
> >   * igt@kms_cdclk@mode-transition-all-outputs:
> >     - shard-bmg:          [SKIP][100] ([Intel XE#2724]) -> [SKIP][101] ([Intel XE#6703])
> >    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
> >    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
> > 
> >   * igt@kms_chamelium_color@ctm-0-50:
> >     - shard-bmg:          [SKIP][102] ([Intel XE#2325]) -> [SKIP][103] ([Intel XE#6703]) +1 other test skip
> >    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
> >    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html
> > 
> >   * igt@kms_chamelium_color@ctm-green-to-red:
> >     - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#2325])
> >    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html
> >    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html
> > 
> >   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> >     - shard-bmg:          [SKIP][106] ([Intel XE#6703]) -> [SKIP][107] ([Intel XE#2252]) +6 other tests skip
> >    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> >    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> > 
> >   * igt@kms_chamelium_edid@dp-edid-resolution-list:
> >     - shard-bmg:          [SKIP][108] ([Intel XE#2252]) -> [SKIP][109] ([Intel XE#6703]) +9 other tests skip
> >    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> >    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> > 
> >   * igt@kms_content_protection@content-type-change:
> >     - shard-bmg:          [SKIP][110] ([Intel XE#2341]) -> [SKIP][111] ([Intel XE#6703])
> >    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_content_protection@content-type-change.html
> >    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_content_protection@content-type-change.html
> > 
> >   * igt@kms_content_protection@dp-mst-suspend-resume:
> >     - shard-bmg:          [SKIP][112] ([Intel XE#6703]) -> [SKIP][113] ([Intel XE#6743])
> >    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html
> >    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_content_protection@dp-mst-suspend-resume.html
> > 
> >   * igt@kms_content_protection@legacy:
> >     - shard-bmg:          [FAIL][114] ([Intel XE#1178]) -> [SKIP][115] ([Intel XE#6703])
> >    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_content_protection@legacy.html
> >    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_content_protection@legacy.html
> > 
> >   * igt@kms_content_protection@mei-interface:
> >     - shard-bmg:          [SKIP][116] ([Intel XE#6703]) -> [SKIP][117] ([Intel XE#2341])
> >    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_content_protection@mei-interface.html
> >    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_content_protection@mei-interface.html
> > 
> >   * igt@kms_content_protection@uevent:
> >     - shard-bmg:          [FAIL][118] ([Intel XE#6707]) -> [SKIP][119] ([Intel XE#6703])
> >    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_content_protection@uevent.html
> >    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_content_protection@uevent.html
> > 
> >   * igt@kms_cursor_crc@cursor-offscreen-512x512:
> >     - shard-bmg:          [SKIP][120] ([Intel XE#6703]) -> [SKIP][121] ([Intel XE#2321]) +2 other tests skip
> >    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> >    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-128x42:
> >     - shard-bmg:          [SKIP][122] ([Intel XE#2320]) -> [SKIP][123] ([Intel XE#6703]) +2 other tests skip
> >    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> >    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-64x21:
> >     - shard-bmg:          [SKIP][124] ([Intel XE#6703]) -> [SKIP][125] ([Intel XE#2320]) +1 other test skip
> >    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> >    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> > 
> >   * igt@kms_cursor_crc@cursor-random-512x170:
> >     - shard-bmg:          [SKIP][126] ([Intel XE#2321]) -> [SKIP][127] ([Intel XE#6703])
> >    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html
> >    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> >     - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [SKIP][129] ([Intel XE#2291]) +1 other test skip
> >    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> >    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> >     - shard-bmg:          [SKIP][130] ([Intel XE#6703]) -> [SKIP][131] ([Intel XE#2286])
> >    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> >    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> > 
> >   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> >     - shard-bmg:          [SKIP][132] ([Intel XE#1508]) -> [SKIP][133] ([Intel XE#6703])
> >    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> >    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> > 
> >   * igt@kms_dp_link_training@uhbr-sst:
> >     - shard-bmg:          [SKIP][134] ([Intel XE#6703]) -> [SKIP][135] ([Intel XE#4354])
> >    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
> >    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html
> > 
> >   * igt@kms_dp_linktrain_fallback@dsc-fallback:
> >     - shard-bmg:          [SKIP][136] ([Intel XE#4331]) -> [SKIP][137] ([Intel XE#6703])
> >    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> >    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> > 
> >   * igt@kms_dsc@dsc-fractional-bpp:
> >     - shard-bmg:          [SKIP][138] ([Intel XE#6703]) -> [SKIP][139] ([Intel XE#2244])
> >    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html
> >    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html
> > 
> >   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> >     - shard-bmg:          [SKIP][140] ([Intel XE#4422]) -> [SKIP][141] ([Intel XE#6703])
> >    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> >    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> > 
> >   * igt@kms_fbcon_fbt@fbc:
> >     - shard-bmg:          [SKIP][142] ([Intel XE#6703]) -> [SKIP][143] ([Intel XE#4156])
> >    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
> >    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html
> > 
> >   * igt@kms_fbcon_fbt@psr:
> >     - shard-bmg:          [SKIP][144] ([Intel XE#776]) -> [SKIP][145] ([Intel XE#6703])
> >    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_fbcon_fbt@psr.html
> >    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html
> > 
> >   * igt@kms_feature_discovery@chamelium:
> >     - shard-bmg:          [SKIP][146] ([Intel XE#2372]) -> [SKIP][147] ([Intel XE#6703])
> >    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_feature_discovery@chamelium.html
> >    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
> > 
> >   * igt@kms_feature_discovery@display-4x:
> >     - shard-bmg:          [SKIP][148] ([Intel XE#6703]) -> [SKIP][149] ([Intel XE#1138])
> >    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
> >    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank:
> >     - shard-bmg:          [SKIP][150] ([Intel XE#6703]) -> [SKIP][151] ([Intel XE#2316]) +1 other test skip
> >    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
> >    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> >     - shard-bmg:          [SKIP][152] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][153] ([Intel XE#6703]) +3 other tests skip
> >    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> >    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
> >     - shard-bmg:          [SKIP][154] ([Intel XE#6703]) -> [SKIP][155] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
> >    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> >    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> >     - shard-bmg:          [SKIP][156] ([Intel XE#2312]) -> [SKIP][157] ([Intel XE#2311]) +9 other tests skip
> >    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> >    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> >     - shard-bmg:          [SKIP][158] ([Intel XE#6703]) -> [SKIP][159] ([Intel XE#4141]) +8 other tests skip
> >    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> >    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
> >     - shard-bmg:          [SKIP][160] ([Intel XE#2312]) -> [SKIP][161] ([Intel XE#4141]) +4 other tests skip
> >    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> >    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][162] ([Intel XE#4141]) -> [SKIP][163] ([Intel XE#2312]) +1 other test skip
> >    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> >    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
> >     - shard-bmg:          [SKIP][164] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][165] ([Intel XE#2312])
> >    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> >    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> >     - shard-bmg:          [SKIP][166] ([Intel XE#4141]) -> [SKIP][167] ([Intel XE#6703]) +15 other tests skip
> >    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> >    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> >     - shard-bmg:          [SKIP][168] ([Intel XE#6703]) -> [SKIP][169] ([Intel XE#2352])
> >    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> >    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
> >     - shard-bmg:          [SKIP][170] ([Intel XE#6703]) -> [SKIP][171] ([Intel XE#2311]) +16 other tests skip
> >    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
> >    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][172] ([Intel XE#2311]) -> [SKIP][173] ([Intel XE#6703]) +29 other tests skip
> >    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> >    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
> >     - shard-bmg:          [SKIP][174] ([Intel XE#2311]) -> [SKIP][175] ([Intel XE#2312]) +4 other tests skip
> >    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
> >    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> >     - shard-bmg:          [SKIP][176] ([Intel XE#2352]) -> [SKIP][177] ([Intel XE#6703])
> >    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> >    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
> >     - shard-bmg:          [SKIP][178] ([Intel XE#6703]) -> [SKIP][179] ([Intel XE#2312]) +12 other tests skip
> >    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
> >    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][180] ([Intel XE#2313]) -> [SKIP][181] ([Intel XE#2312]) +4 other tests skip
> >    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> >    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> >     - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [SKIP][183] ([Intel XE#2313]) +17 other tests skip
> >    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> >    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][184] ([Intel XE#2313]) -> [SKIP][185] ([Intel XE#6703]) +27 other tests skip
> >    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> >    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> >     - shard-bmg:          [SKIP][186] ([Intel XE#2312]) -> [SKIP][187] ([Intel XE#2313]) +8 other tests skip
> >    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> >    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> > 
> >   * igt@kms_hdr@invalid-hdr:
> >     - shard-bmg:          [ABORT][188] ([Intel XE#6740]) -> [SKIP][189] ([Intel XE#1503])
> >    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
> >    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
> > 
> >   * igt@kms_joiner@basic-force-ultra-joiner:
> >     - shard-bmg:          [SKIP][190] ([Intel XE#6911]) -> [SKIP][191] ([Intel XE#6703])
> >    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html
> >    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
> > 
> >   * igt@kms_joiner@basic-max-non-joiner:
> >     - shard-bmg:          [SKIP][192] ([Intel XE#6703]) -> [SKIP][193] ([Intel XE#4298])
> >    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
> >    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html
> > 
> >   * igt@kms_joiner@invalid-modeset-big-joiner:
> >     - shard-bmg:          [SKIP][194] ([Intel XE#6901]) -> [SKIP][195] ([Intel XE#6703])
> >    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
> >    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
> > 
> >   * igt@kms_joiner@invalid-modeset-ultra-joiner:
> >     - shard-bmg:          [SKIP][196] ([Intel XE#6703]) -> [SKIP][197] ([Intel XE#6911])
> >    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> >    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> > 
> >   * igt@kms_plane_lowres@tiling-yf:
> >     - shard-bmg:          [SKIP][198] ([Intel XE#2393]) -> [SKIP][199] ([Intel XE#6703])
> >    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html
> >    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
> > 
> >   * igt@kms_plane_multiple@tiling-yf:
> >     - shard-bmg:          [SKIP][200] ([Intel XE#6703]) -> [SKIP][201] ([Intel XE#5020])
> >    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
> >    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
> >     - shard-bmg:          [SKIP][202] ([Intel XE#6703]) -> [SKIP][203] ([Intel XE#6886])
> >    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
> >    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
> >     - shard-bmg:          [SKIP][204] ([Intel XE#6886]) -> [SKIP][205] ([Intel XE#6703])
> >    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> >    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> > 
> >   * igt@kms_pm_backlight@bad-brightness:
> >     - shard-bmg:          [SKIP][206] ([Intel XE#870]) -> [SKIP][207] ([Intel XE#6703]) +1 other test skip
> >    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
> >    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html
> > 
> >   * igt@kms_pm_dc@dc3co-vpb-simulation:
> >     - shard-bmg:          [SKIP][208] ([Intel XE#2391]) -> [SKIP][209] ([Intel XE#6703])
> >    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
> >    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
> > 
> >   * igt@kms_pm_dc@dc5-retention-flops:
> >     - shard-bmg:          [SKIP][210] ([Intel XE#6703]) -> [SKIP][211] ([Intel XE#3309])
> >    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
> >    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html
> > 
> >   * igt@kms_pm_rpm@dpms-lpsp:
> >     - shard-bmg:          [SKIP][212] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][213] ([Intel XE#6693]) +1 other test skip
> >    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
> >    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
> > 
> >   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
> >     - shard-bmg:          [SKIP][214] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][215] ([Intel XE#1406] / [Intel XE#6703]) +6 other tests skip
> >    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> >    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> > 
> >   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
> >     - shard-bmg:          [SKIP][216] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][217] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
> >    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> >    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> > 
> >   * igt@kms_psr2_su@page_flip-xrgb8888:
> >     - shard-bmg:          [SKIP][218] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][219] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
> >    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_psr2_su@page_flip-xrgb8888.html
> >    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html
> > 
> >   * igt@kms_psr@fbc-psr2-cursor-plane-move:
> >     - shard-bmg:          [SKIP][220] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][221] ([Intel XE#1406] / [Intel XE#6703]) +9 other tests skip
> >    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> >    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> > 
> >   * igt@kms_psr@psr2-sprite-blt:
> >     - shard-bmg:          [SKIP][222] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][223] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
> >    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html
> >    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html
> > 
> >   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> >     - shard-bmg:          [SKIP][224] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][225] ([Intel XE#1406] / [Intel XE#6703])
> >    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> >    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> > 
> >   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> >     - shard-bmg:          [SKIP][226] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][227] ([Intel XE#1406] / [Intel XE#2414])
> >    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> >    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> > 
> >   * igt@kms_rotation_crc@bad-pixel-format:
> >     - shard-bmg:          [SKIP][228] ([Intel XE#6703]) -> [SKIP][229] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
> >    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
> >    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
> > 
> >   * igt@kms_rotation_crc@primary-rotation-90:
> >     - shard-bmg:          [SKIP][230] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][231] ([Intel XE#6703]) +4 other tests skip
> >    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
> >    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html
> > 
> >   * igt@kms_setmode@invalid-clone-exclusive-crtc:
> >     - shard-bmg:          [SKIP][232] ([Intel XE#1435]) -> [SKIP][233] ([Intel XE#6703])
> >    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> >    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> > 
> >   * igt@kms_sharpness_filter@filter-formats:
> >     - shard-bmg:          [SKIP][234] ([Intel XE#6703]) -> [SKIP][235] ([Intel XE#6503]) +2 other tests skip
> >    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
> >    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_sharpness_filter@filter-formats.html
> > 
> >   * igt@kms_sharpness_filter@invalid-filter-with-plane:
> >     - shard-bmg:          [SKIP][236] ([Intel XE#6503]) -> [SKIP][237] ([Intel XE#6703]) +1 other test skip
> >    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-plane.html
> >    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern:
> >     - shard-bmg:          [FAIL][238] ([Intel XE#1729]) -> [SKIP][239] ([Intel XE#6703])
> >    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> >    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> >     - shard-bmg:          [SKIP][240] ([Intel XE#2426]) -> [SKIP][241] ([Intel XE#6703])
> >    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> >    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> > 
> >   * igt@kms_tv_load_detect@load-detect:
> >     - shard-bmg:          [SKIP][242] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][243] ([Intel XE#2450])
> >    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
> >    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html
> > 
> >   * igt@kms_vrr@seamless-rr-switch-drrs:
> >     - shard-bmg:          [SKIP][244] ([Intel XE#1499]) -> [SKIP][245] ([Intel XE#6703]) +1 other test skip
> >    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-drrs.html
> >    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
> > 
> >   * igt@xe_compute@ccs-mode-basic:
> >     - shard-bmg:          [SKIP][246] ([Intel XE#6703]) -> [SKIP][247] ([Intel XE#6599])
> >    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
> >    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html
> > 
> >   * igt@xe_eudebug@basic-vm-bind-vm-destroy:
> >     - shard-bmg:          [SKIP][248] ([Intel XE#4837]) -> [SKIP][249] ([Intel XE#6703]) +5 other tests skip
> >    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
> >    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
> > 
> >   * igt@xe_eudebug@multigpu-basic-client:
> >     - shard-bmg:          [SKIP][250] ([Intel XE#6703]) -> [SKIP][251] ([Intel XE#4837]) +4 other tests skip
> >    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug@multigpu-basic-client.html
> >    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@xe_eudebug@multigpu-basic-client.html
> > 
> >   * igt@xe_eudebug_online@pagefault-one-of-many:
> >     - shard-bmg:          [SKIP][252] ([Intel XE#6665]) -> [SKIP][253] ([Intel XE#6703])
> >    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@xe_eudebug_online@pagefault-one-of-many.html
> >    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html
> > 
> >   * igt@xe_eudebug_online@pagefault-read-stress:
> >     - shard-bmg:          [SKIP][254] ([Intel XE#6665] / [Intel XE#6681]) -> [SKIP][255] ([Intel XE#6703])
> >    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@xe_eudebug_online@pagefault-read-stress.html
> >    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html
> > 
> >   * igt@xe_eudebug_online@single-step:
> >     - shard-bmg:          [SKIP][256] ([Intel XE#6703]) -> [SKIP][257] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
> >    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug_online@single-step.html
> >    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@xe_eudebug_online@single-step.html
> > 
> >   * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
> >     - shard-bmg:          [SKIP][258] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][259] ([Intel XE#6703]) +2 other tests skip
> >    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
> >    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
> > 
> >   * igt@xe_eudebug_sriov@deny-eudebug:
> >     - shard-bmg:          [SKIP][260] ([Intel XE#6703]) -> [SKIP][261] ([Intel XE#5793])
> >    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
> >    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html
> > 
> >   * igt@xe_evict@evict-mixed-many-threads-small:
> >     - shard-bmg:          [INCOMPLETE][262] ([Intel XE#6321]) -> [SKIP][263] ([Intel XE#6703])
> >    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
> >    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
> >     - shard-bmg:          [SKIP][264] ([Intel XE#2322]) -> [SKIP][265] ([Intel XE#6703]) +8 other tests skip
> >    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> >    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
> >     - shard-bmg:          [SKIP][266] ([Intel XE#6703]) -> [SKIP][267] ([Intel XE#2322]) +7 other tests skip
> >    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> >    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> > 
> >   * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
> >     - shard-bmg:          [SKIP][268] ([Intel XE#6874]) -> [SKIP][269] ([Intel XE#6703]) +28 other tests skip
> >    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
> >    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
> > 
> >   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
> >     - shard-bmg:          [SKIP][270] ([Intel XE#6703]) -> [SKIP][271] ([Intel XE#6874]) +23 other tests skip
> >    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
> >    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
> > 
> >   * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
> >     - shard-bmg:          [SKIP][272] ([Intel XE#6703]) -> [SKIP][273] ([Intel XE#5007])
> >    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
> >    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
> >     - shard-bmg:          [SKIP][274] ([Intel XE#6703]) -> [SKIP][275] ([Intel XE#4943]) +20 other tests skip
> >    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
> >    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
> >     - shard-bmg:          [SKIP][276] ([Intel XE#4943]) -> [SKIP][277] ([Intel XE#6703]) +21 other tests skip
> >    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html
> >    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html
> > 
> >   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> >     - shard-bmg:          [SKIP][278] ([Intel XE#6703]) -> [ABORT][279] ([Intel XE#5466])
> >    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> >    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> > 
> >   * igt@xe_pm@d3cold-mocs:
> >     - shard-bmg:          [SKIP][280] ([Intel XE#2284]) -> [SKIP][281] ([Intel XE#6703]) +1 other test skip
> >    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@xe_pm@d3cold-mocs.html
> >    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
> > 
> >   * igt@xe_pm@s3-d3cold-basic-exec:
> >     - shard-bmg:          [SKIP][282] ([Intel XE#6703]) -> [SKIP][283] ([Intel XE#2284])
> >    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html
> >    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html
> > 
> >   * igt@xe_pm@vram-d3cold-threshold:
> >     - shard-bmg:          [SKIP][284] ([Intel XE#6703]) -> [SKIP][285] ([Intel XE#579])
> >    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
> >    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html
> > 
> >   * igt@xe_pxp@display-pxp-fb:
> >     - shard-bmg:          [SKIP][286] ([Intel XE#4733]) -> [SKIP][287] ([Intel XE#6703]) +2 other tests skip
> >    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html
> >    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html
> > 
> >   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> >     - shard-bmg:          [SKIP][288] ([Intel XE#6703]) -> [SKIP][289] ([Intel XE#4733])
> >    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> >    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> > 
> >   * igt@xe_query@multigpu-query-invalid-extension:
> >     - shard-bmg:          [SKIP][290] ([Intel XE#944]) -> [SKIP][291] ([Intel XE#6703]) +1 other test skip
> >    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html
> >    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
> > 
> >   * igt@xe_query@multigpu-query-invalid-size:
> >     - shard-bmg:          [SKIP][292] ([Intel XE#6703]) -> [SKIP][293] ([Intel XE#944]) +1 other test skip
> >    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html
> >    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-size.html
> > 
> >   
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> >   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> >   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> >   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> >   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> >   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> >   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> >   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> >   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> >   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> >   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
> >   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> >   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> >   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> >   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> >   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> >   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> >   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> >   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> >   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
> >   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> >   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
> >   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
> >   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> >   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> >   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
> >   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> >   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
> >   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
> >   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> >   [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
> >   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> >   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> >   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> >   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> >   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
> >   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> >   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> >   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> >   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> >   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> >   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> >   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
> >   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
> >   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
> >   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> >   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> >   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> >   [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
> >   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> >   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> >   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> >   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
> >   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
> >   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
> >   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> >   [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
> >   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
> >   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
> >   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
> >   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
> >   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
> >   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
> >   [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
> >   [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
> >   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
> >   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
> >   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
> >   [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
> >   [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
> >   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
> >   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
> >   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
> >   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
> >   [Intel XE#6913]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913
> >   [Intel XE#6914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914
> >   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> >   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> >   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> >   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * Linux: xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72 -> xe-pw-159300v1
> > 
> >   IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >   xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72: 0b9ab258bd57ffe1b88e942940534f4bf5139b72
> >   xe-pw-159300v1: 159300v1
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
