Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D14BCD4857
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 16:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDABD10E7FC;
	Wed,  4 Sep 2024 16:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvM2uzet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7918310E7FC
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725466025; x=1757002025;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JQoz4kx9Wc348SphmZbjN94NSvVXTF+FUKYN5MEdixM=;
 b=TvM2uzet2VIi29+aiP1cO2I4EFnUFrTuMU3UKsoIkj42Nqe9fLZ87Yvh
 RSaEzJsqYyUKhM6bwdlho8G2UnIytfJwxKViAraD7fPLOl3se30s2IGD7
 Mj89Ej4roUj3qmyHROruM3SK6NEntcfzfE+cWtXF1tUeCvOHbuC011U/h
 p59CvXHxt9UCkVfdBzDJoSPJ3OwfY7RM96sS/BTYe+pkUFS9wU+Jig0Ab
 nEo3mmzTA61zd/qnioSnOFMHLpfTTRY7BGxdTwL4fPmG1hBjUtbrWEUjc
 bREdQnZaz0PcqH57vtaPb+rUF95Ske6x+cuRyCDqyzGFu9LgS4MCXyYRS w==;
X-CSE-ConnectionGUID: zmQb13iERQeht2R8P3sFTA==
X-CSE-MsgGUID: YDDBEtYIS8yy6ZgjlK1UMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24094104"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24094104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 09:07:04 -0700
X-CSE-ConnectionGUID: emAum4R1T4GE7t4Gt47EQA==
X-CSE-MsgGUID: aCd1wjDoTXuEzOTBBShe+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="65837559"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 09:07:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 09:07:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 09:07:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 09:07:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3Aw9ZZ8dcamTFBJwyd6FV29u7jEWEwxtqRC/f1nqabGj5DpWWP99AMznYQ5KU4rf8VjOeE6Ze9/Ll9Xpfd1iJMz8qrohnl3W2GH3fgE/wh9kREYVVvYGggipUw8MIuQnsCPWjO6Hp1dovI3i8q+4mGwmbXFSjk6GmZvZmMotEACgc2SaP0Hh2usMLGNUKHNJ5c1DcwKKxjDzVUNyVsSTFyNQ3pVt9m9oWR8inH33GDBAX8ObELYMIxQ5HRFpmwxtUI3w/Xtnr3ODCNez5Y2si5CYn0pnuvGyR4/kuoxsHpwUtGne4+bQeHMFOHrEd3a1LlByfKiFtX/ShvNzVigxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Txxhzv1hnpNFa3w2AsRtpwAOjX3mRVmkopJklaayOM=;
 b=IWwYWEjEui+ECpDFLAvGUiPqM6JVCBKBrhrlyOMZ+4y5fXhZjILptjc6E1RF8DinUAWXiyI7xoONP/nYbah9MsIHhRLYP+hmECna5M/bklQB7M5IYve/6YFHG1W43ZltmaQXUPeAI96+P30VOn5oaZ0Mhb8mA/WpKPU5CZbzWuW0p2k3PtW24ukhDyG84bKQrYqvk7jDR4Ur4EPjnfA3AL9Z7AJ7NzNpW6wSgUnUDaqt2LNRvhmpW2n/eeAuZAFg6R8wd9AhyLZyPPxkbGnHABvjJH+nQq3xdu5FwmdPe0OS8fo36A/Fb6h1qO/s5n7beBiIoo2RNxq1VXvprv64xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB7699.namprd11.prod.outlook.com (2603:10b6:806:338::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 4 Sep
 2024 16:07:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 16:07:00 +0000
Date: Wed, 4 Sep 2024 12:06:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Kill missing outer runtime PM protection warning
Message-ID: <ZtiFoXyyZJi2Mset@intel.com>
References: <20240903223822.380841-1-rodrigo.vivi@intel.com>
 <23623c0f-f3e5-4227-9a84-7490ae3978ec@intel.com>
 <Zth22JdcjlcSAzin@intel.com>
 <cd6009f5-6404-4404-be21-712425d4a24c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd6009f5-6404-4404-be21-712425d4a24c@intel.com>
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6b3310-b462-41e3-f1c0-08dcccfb9bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?362QWE8Z0DCZPa8MJGO+BJfWXBtYPldQZP0zRyFnLuPFZ9TG+M82z3k1Rc?=
 =?iso-8859-1?Q?EfZJj318EZdVt3FAyMUc/Y6o0Pb/rnZJbNw0bofi+c4TgzI8dRJUBYZ6Lr?=
 =?iso-8859-1?Q?de4vsCUwf9VTGpmFWjW+nbMbYPd3sv5SFD5a4EcbL63hBgBjujjEFueJKC?=
 =?iso-8859-1?Q?Yuh934kIOeBZjG/+l4Nzzp7Caf6CBPGvuo7pLaa+UwctMlHnHewnVD28VZ?=
 =?iso-8859-1?Q?obqaC6kOVJ1Nm86GBE7UgzCn1urlBbtcgKW76olraDGq8H2zmBC91iLIog?=
 =?iso-8859-1?Q?bSosL0cTsc3fjuEfNR5UA6fRLD82asiz/f2S5EKKDuI59t9+0YjiDMpPQp?=
 =?iso-8859-1?Q?MMn+/Q76G3B2L+mR0esP5gA1+e5Wo9Vf7NGPd/+LJkNAtju5NGjSYW8gtD?=
 =?iso-8859-1?Q?iH5SZK/T/QrEkFzsJeLiIcWUdH5UoT498kfnp/D22G+Ei8kgNmcfRTkLF7?=
 =?iso-8859-1?Q?i8V60IqmAGLaof4mFB5pvpk4QHLQTduEtjGRZGgnMwGVRukC4ZBEJop80z?=
 =?iso-8859-1?Q?OdMNGAFRxrahoY5ywvOEowlZxf7TTOc5GyHVslYjomEdqSfQ1kNHaKUlmg?=
 =?iso-8859-1?Q?bAv+It2sDt1GXkOhxZbO0zI2k74N8onTQmIspHsE4HUQJK+90yuYrpPFQB?=
 =?iso-8859-1?Q?FMrpT9M1sagLcPnS/CtsCJWf5T/FA9S0fUFQ4+gWmNU1foj0pQamyqR39k?=
 =?iso-8859-1?Q?8PUKitUnzdWQ7iGtPoLNNWIJvTEVPyEplTdyfqzWUxDvJRaxDWTYSqoezV?=
 =?iso-8859-1?Q?7vPYpq6fTyxunACJ6YeWForrImcvFXK23hzqiixbKBTQy3wM27MF2hQyrL?=
 =?iso-8859-1?Q?Jd8hEetP5u1SdKWnlzHvjDiox8wN1mQ+/DZe8BWm52f+GjjlX3KjzYjSlN?=
 =?iso-8859-1?Q?9nq4X9GSmOhpk94WstMSHG3QO69eD3BlXY7ODyxf5n5aVOUO4UuXSAOsg0?=
 =?iso-8859-1?Q?WXQoKCailcUIp4eP7kxPbx56648fbsKnsBPtyd2Ca/j8wZrAToWJ9oAObB?=
 =?iso-8859-1?Q?OX9szJmm1kD3MTxn49IRb1CRouv+vmC30lulqJLCOOh6Twrh60rJ1zZ+h+?=
 =?iso-8859-1?Q?TUei8DOw0WIcXzgPD1oCiSxvhMA4aF7V/17XlOqEjUlp5QakV2wV7EV17a?=
 =?iso-8859-1?Q?CKe5Mykbe4KVGT8/gIuL5jQ0xg5DtqbE7AdiuMxrnmtKHaUjS4M+MIacrI?=
 =?iso-8859-1?Q?YQyap1E468ZcjCFcjTTnwQnoVUaBNrKa5bsQBFDqjjxzlA26hY7nfcLMQh?=
 =?iso-8859-1?Q?/eB7E7XoMdojbL7icxF+cCQd7sr+pA9Cwp6nmA6oOaMHWWgnL7l/ZtZAML?=
 =?iso-8859-1?Q?VYscPsFs3YrgLBbfUzmaji7SdY46eCV+jAtNpXwpmFFVT1x5riozB3LxRb?=
 =?iso-8859-1?Q?doEo3dPhiE39PgVTdOlONh8cLBGOazxPB0O09iEE9W+FhWtiaMTNQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6z2RauUCdTxseiM5jO/PWbotQW2fm2LsO1YsYBbaJ6kJaup7CBDSDPCKpC?=
 =?iso-8859-1?Q?dZUPw7wjI3vdKw8wxv2O8JjhPs5HoYRM0ep7+LIzKmRGTuFs4pTkRlYFQb?=
 =?iso-8859-1?Q?FAU9aFMUJxLFtg5eoZi8egBiAxXrz0aVSw/3mvExkEZ6SnMXQhtXrT+yhb?=
 =?iso-8859-1?Q?6T/6hFDS71M/5u3o5L1yndNKj86FC6729ZgfO56ZWONzNDDym+1RVj2ZlR?=
 =?iso-8859-1?Q?CsPrnPfyR9AwJezNmtuXWHintzhIb0dzeE23wEkIAcKDYnqz2apbwukwpI?=
 =?iso-8859-1?Q?GhGGhEgVunQicGddb0+eitQBdmS09NcXVKFPl1tEtm2SsUaLpNWK0A5Lr2?=
 =?iso-8859-1?Q?kNFs2My+gaGiOeQ8H8CNA6RRodsJjwVHr2z8N59H3ztePqep/BE6EUzdzZ?=
 =?iso-8859-1?Q?CEDJYTLSc+QNlK9pfzI14CNdAVq2C0yirrr24XwrwQDyn4VfcC7n/5ESXm?=
 =?iso-8859-1?Q?B/SX74Qjzzc+DEQBp5waMPYX2fr1hWctJ9KOz3iJwykMkMOnCjpdMVrYre?=
 =?iso-8859-1?Q?8Qk6K1xyzmN0h3CDL6sjNgxFUgTwHT8ZvNPcpSIpowkFyCmB8IURqzb4pU?=
 =?iso-8859-1?Q?Wh2Sg5l6huTQWBaq/JURANlyoauOVwFhHM1pJZUHprG6eYLXzaoA2FgeEz?=
 =?iso-8859-1?Q?loz/hqXudesnN/pb8VJuK9r0yq7wO91kQtmxJrWBUdnuTmq6u0vBo6F27B?=
 =?iso-8859-1?Q?7qgVjACUHfCqgKk2ZkLG7eRcYl5UKeS9B9vJWfOwz+SNTnNDryLL5+1w6j?=
 =?iso-8859-1?Q?LFNTpKhvz7i8tuWgKfIR8ZpF6tZ6wYpAtnRs+NIZpEk1D9EqI77KbQZOdc?=
 =?iso-8859-1?Q?cd0w2scEQrHBX2EhFMnqeFday9jgNzL5bxyNKE6CrrR/NHtaPlRMJuNTg6?=
 =?iso-8859-1?Q?NCPYVFAmT5ufhzoYIXoZa3EbsPqDZPIICYL/X8LNDXKT+o1+CL8P1Wz8QZ?=
 =?iso-8859-1?Q?7HzRM1dhSuBByKUbbYT/wLOvTbyy3j4u2fzcfu7GbbM3HNF0WZ0Iyo4U4O?=
 =?iso-8859-1?Q?nSS99+ubn4HNermJ20vCfikoecMVkD5LFnIg0/N4zk/V9ZalssuN2LoOLp?=
 =?iso-8859-1?Q?6GkIlKcoVFxHtD0bQBcJIYXi2DCjNj1WjIu+16tXqrUznxGWbVV2NafdNX?=
 =?iso-8859-1?Q?r10gZciyVCPC4FW6x9DkkXZ86RaN3XzSCR0lu76sUtRfpNOXvIFSU7SI37?=
 =?iso-8859-1?Q?rLnVDph17+7wwCzd9+/FJjQtZuhSdfox+NKDLRdA4xnSMLGCEJqWLvenJK?=
 =?iso-8859-1?Q?yciIAtKOGVWrobYb91HKcs/hrLE51HOO2J+D/JedhF8zSokcu3PwzOAcn8?=
 =?iso-8859-1?Q?8XAz20bej9y7c4CNtXsfjmb5KhgCxJTuvYVVioP9AiWHZHZWT1xICewhg8?=
 =?iso-8859-1?Q?78OFEKkvOPOH6FpytYDwqBWT0Ab4ixKSdqhaO6sskpt08RjJEdbbZ5DYmW?=
 =?iso-8859-1?Q?EOYE2goalwIFlE4ZoUJQOW8UaYj3Qx1bQTAgKPXhC6TNo0A68jEeGOhWz2?=
 =?iso-8859-1?Q?MfdEOKDOQ4DF5ZkT1Pu+SujlV6LokL4ietn1p2oiC7ddQkvGIyORz3Pukd?=
 =?iso-8859-1?Q?Qy1w4bjHvQv2wazqbso+TjLVT/UQjygEad82eWarFUHIpZNsnzKmo3LqKr?=
 =?iso-8859-1?Q?iBkB8bssiJuvjpeaRasVnWIs+sXsEXDooGEBD0k2dkHHLCl1AQpN/6Xg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6b3310-b462-41e3-f1c0-08dcccfb9bd0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 16:07:00.4568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vALHdB9InWJbYZ9Gk5JcIm2+qLWoRFbf6xgOpu9dGDrzuYs4k+FV4P2bl1YYcFRkJNev+VUun5dJd42eOghjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7699
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

On Wed, Sep 04, 2024 at 04:42:14PM +0100, Matthew Auld wrote:
> On 04/09/2024 16:03, Rodrigo Vivi wrote:
> > On Wed, Sep 04, 2024 at 01:49:47PM +0100, Matthew Auld wrote:
> > > On 03/09/2024 23:38, Rodrigo Vivi wrote:
> > > > This message was very useful to ensure that Xe was taking all
> > > > the needed outer runtime pm references. However, at this point
> > > > it is only a false positive. So, remove it.
> > > > 
> > > > False positive cases:
> > > > 
> > > > 1:
> > > > [184.983389] xe ...: [drm] Missing outer runtime PM protection
> > > > [snip]
> > > > [184.984096]  drm_ioctl+0x2cf/0x580 [drm]
> > > > [snip]
> > > > [184.984710] xe 0000:00:02.0: Runtime PM usage count underflow!
> > > > 
> > > > In this case the underflow is the problem since we are sure that
> > > > the ioctl is protected. But something else is abusing the 'put'
> > > > calls.
> > > > 
> > > > 2:
> > > > rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
> > > > console:              xe_bo_evict_all (called from suspend)
> > > > xe_sched_job_create:  dev=0000:03:00.0, ...
> > > > xe_sched_job_exec:    dev=0000:03:00.0, ...
> > > > xe_pm_runtime_put:    dev=0000:03:00.0, ...
> > > > xe_sched_job_run:     dev=0000:03:00.0, ...
> > > > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > > > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > > > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > > > console:              xe 0000:03:00.0: [drm] Missing outer runtime
> > > > 		      	 	       	     	     PM protection
> > > > console:               xe_guc_ct_send+0x15/0x50 [xe]
> > > > console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
> > > > [snip]
> > > > console:               drm_sched_run_job_work+0x649/0xc20
> > > > 
> > > > At this point, BOs are getting evicted from VRAM with rpm
> > > > usage-counter = 2, but rpm status = SUSPENDING.
> > > > The xe->pm_callback_task won't be equal 'current' because this call is
> > > > coming from a work queue.
> > > > 
> > > > So, pm_runtime_get_if_active() will be called and return 0 because rpm
> > > > status != ACTIVE (but equal SUSPENDING).
> > > > 
> > > > The only way out is to just grab the reference and move on.
> > > > 
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_pm.c | 10 ++--------
> > > >    1 file changed, 2 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index da68cd689a96..e1a5e43b0f34 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -592,20 +592,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> > > >     * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
> > > >     * @xe: xe device instance
> > > >     *
> > > > - * This function should be used in inner places where it is surely already
> > > > + * This function should *only* be used in inner places where it is surely already
> > > >     * protected by outer-bound callers of `xe_pm_runtime_get`.
> > > > - * It will warn if not protected.
> > > >     * The reference should be put back after this function regardless, since it
> > > >     * will always bump the usage counter, regardless.
> > > >     */
> > > >    void xe_pm_runtime_get_noresume(struct xe_device *xe)
> > > >    {
> > > > -	bool ref;
> > > > -
> > > > -	ref = xe_pm_runtime_get_if_in_use(xe);
> > > > -
> > > > -	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> > > > -		pm_runtime_get_noresume(xe->drm.dev);
> > > 
> > > This has proven to find real bugs in the past, right? If so, it seems
> > > unfortunate to drop this completely?
> > 
> > You do have a point....
> > 
> > > What about making it slightly more
> > > fuzzy with something like:
> > > 
> > > drm_WARN(!pm_read_callback_task() && !pm_runtime_active(), ...
> > 
> > I don't like inspecting the status directly because it can be racy,
> > but in this particular case it would for sure avoid the case-2 of
> > our false positives. But perhaps something like this:
> > 
> > @@ -600,12 +600,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> >    */
> >   void xe_pm_runtime_get_noresume(struct xe_device *xe)
> >   {
> > +       struct device *dev = xe->drm.dev;
> >          bool ref;
> >          ref = xe_pm_runtime_get_if_in_use(xe);
> > -       if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> > -               pm_runtime_get_noresume(xe->drm.dev);
> > +       if (drm_WARN(&xe->drm, !ref && dev->power.runtime_status != RPM_SUSPENDING,
> > +                    "Missing outer runtime PM protection\n"))
> > +               pm_runtime_get_noresume(dev);
> > 
> > 
> > > 
> > > That should avoid the false positive, at the cost of not finding some real
> > > bugs, but at least gives us something?
> > 
> > Well, right, this eliminates the false positive case 2.
> > But still at least the false positive case 1.
> 
> I see that more as secondary issue due to some ref imbalance or something.
> Do you have some logs for 1 or link? I might have an idea.

https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7986/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html

> 
> > 
> > The big problem that I saw with this warning at this moment, was that
> > CI-buglog classified all the "Missing outer runtime PM protection"
> > in a single bucket and that was ignored because we had the issue of
> > the pending ggtt_node removal case to handle.
> > 
> > Meanwhile we masked all these bugs that I'm hunting now, because
> > they all looked the ggtt_node removal.
> > 
> > But well, I guess we could workaround and continue the clean-up
> > on the CI-buglog side and workaround false positives instead of
> > simply removing this protection and going blindly forever on
> > the unprotected potential new inner callers...
> > 
> > thought on the diff above? (&& dev->power.runtime_status != RPM_SUSPENDING)
> 
> Yeah seems fine, but maybe also need to check resuming also?

hmm indeed! Thanks

> 
> > 
> > Thanks a lot,
> > Rodrigo.
> > 
> > > 
> > > > +	pm_runtime_get_noresume(xe->drm.dev);
> > > >    }
> > > >    /**
