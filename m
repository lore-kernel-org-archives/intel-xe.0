Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C7FCCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6567210E80F;
	Wed, 15 Oct 2025 14:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlUDGR5K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A4510E80F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760539113; x=1792075113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5DGtma6HPMB9tLfw+OOe0ZqbT3EgykoRqKi3HAKSWLU=;
 b=RlUDGR5KnjpYaiuLi0sGYx2ohPW68AFYv233RDC8Ocp/Xp3saDNtpjbR
 JgabGCSXl3r1bsQwV4m25dC4bTxBpW12PJBX+VPeS3xYeOtAyW8ObQsOa
 3IaNuF9NoVycT9G1bT4Orffy0fo4mBY7EL83sNwYRDtAbTp3Qj6uF0b08
 2Vw9FeevuvSYFzSWQoXdAKslQanGt4BbIJv+guL8fGHf+lNJPuGO+6aPq
 dE7t3QXdZcUXcRbjdUhw1Ezd7/JDM5hw3ZoNyHlKZJZNzlfMb6qr7VDY2
 rBMlM93o4vCxXlaXQzfP2I7rl6fHpAG+4bqeIbHYSUQlDwY/v0PG1K9dq g==;
X-CSE-ConnectionGUID: LUE0FeS1Q+K/5RNBqYZ7Ug==
X-CSE-MsgGUID: aZ1qM+rMSBGMuAb992DW5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62616421"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62616421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:38:33 -0700
X-CSE-ConnectionGUID: CjIqhkowSqWQ5/m18BQTjg==
X-CSE-MsgGUID: MxwdoUdRSB+mS9fmyoaNag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="212798294"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:38:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 07:38:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 07:38:32 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 07:38:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a90DoVsvYylEH3cNDGv0W/DfLBiEuuGr56ogz/SafILwX/8rZ/npFWYnXlK2ZapySuo2OQMXil7ht6w2OlwiWLRSYtHbcJdXXyaExBPXidfrJCG9+lO81zYwGkj+HBcf6KEpe3uoXuaUfegIWld7SHOTTvxc2qJ99O30FZnSjB+4rTIxiIX/k4JDpRJ9HNZazzGvjkGYrz/+dqtIf0EQ44BoMi7EuaMsBkCGsYhAbW9XMtL8im5Yl88U3dxAStIuLnVJYOuWjlNj+5m4V56N9VtLmVW7tjJSgiXGygQHPoy8JmbemQK41WjgG3H0WCl+JnfsHYcl21CHY518vtpZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKfsIsv8KM/MJ80fvu9oNmFBH74ykR0ggW/tEy1evuY=;
 b=sLHC+n6b0hv/JUvl7NKXCoi6HUGVk604wiBPy7ZncOuJNbPPL+T7ebws8VTVIUeAZambTASILsIjYaFmNxq97PYpCy2wiVL5np2IC41nfC3E2fVGAXbKgtQNZLaWAkB6+qL8GloaJzOR3+rVyyzgGeJNUAKi47rH7z56JurJSlqyMhoehQnN2G5gQ/ZEqgCyhy878ThIHByIup0xnkFwjrbxiFSEcIIIroxkhei3voYX28FjlMetoVO7otys9f1W/Z+WxLmS/KKZSXU2A1rRacnnTNAArDjUklEN9sz98UvGxDU5gLnCdK3av3gB3qU9wzb2cRNoEkqAKeKEZO4hCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 14:38:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Wed, 15 Oct 2025
 14:38:29 +0000
Date: Wed, 15 Oct 2025 09:38:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Tejas
 Upadhyay" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 21/23] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
Message-ID: <v74hnh5tyciwdef2i2delsb4yuvqf45xovcoudqxp2zmurixbu@o7zzu7gvge4v>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-21-bfb74f038215@intel.com>
 <46abe5ec-3fff-4019-8af3-b273b9627f8c@intel.com>
 <20251014181436.GZ5409@mdroper-desk1.amr.corp.intel.com>
 <2bf254f4-d07f-4ca7-9dda-6109bb97c200@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2bf254f4-d07f-4ca7-9dda-6109bb97c200@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: ade28101-c7c4-40d2-15ae-08de0bf880de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MZw9SCMwdh05zKWjCbjKEZgHXS8+RpLiX8JzsdFH2PwOgse9zLKkpJ075STm?=
 =?us-ascii?Q?NWLoQ0XgFHFanxd1p/4wKK5guye1WOR2K4sDfvxDtqc06Eap+YFMTTkDHwfQ?=
 =?us-ascii?Q?2VsXh0r0LQmPWHl3yTvrf5AZScR7YUrbnLKqe5bCdQVcT6Kwh/VP/a73qHxH?=
 =?us-ascii?Q?5oJ/bMHDppqOO9L7hp6oYD/R/3qiwL9amfoFfghi1oer5IArHsn+X2Wcoi7C?=
 =?us-ascii?Q?LblZzoiaVdcc6Kb+WngjUqbEhJepumAu5PB17rEUx9VPfOttrDX+FO627lRJ?=
 =?us-ascii?Q?SWYpQt6z6yB5D1SMBgS/zQPUf4xew8cMzFxZ5mBJ2uYG/ifyrXZZZh7ZwHAp?=
 =?us-ascii?Q?iiiCPOkFiL0ITzga6m6g3I0987P2mYOKQr2wKrQ1VNEbLxFOlB5ZWTYxgP0E?=
 =?us-ascii?Q?hPOflJFwhan+mNq5hpe8/c2pi5jIqWXKyhv6+HF7Sg+nzo/SdmRxylpjq6B/?=
 =?us-ascii?Q?UPR/r1A6bvVWS4HcY4V6vDzZe5YgMQOW60gx/nZA5NSlCouCWiZyqX+rHulf?=
 =?us-ascii?Q?FovoxIjVj3LYc+n90p1mFbYac7J18uFqHYVMmfHJz5eiH7MyIjetVCazqefM?=
 =?us-ascii?Q?2Ge/jG1L9rSWbIbTBKalCZoUbiTRw5ckeDDXXh2IsIc/uOkDY6TCpCkOMocF?=
 =?us-ascii?Q?ImQJ1D0eVaKt51BbZHE7Hi/w4HAAM3bcZH+N/ljbLTothFvhBuR2wAWiTutB?=
 =?us-ascii?Q?BBhMLvz8uMI0Vs3BW+Q4ycGcp8nCmHHkI9+m3UT0ttf6bV29VmdfSmHZiJjA?=
 =?us-ascii?Q?KKc0SVVD0GJB9CZ5XeEz197646xK1PgYtSoQ9SPYw0JL8fL9HkHkPp9wnNsS?=
 =?us-ascii?Q?4WTDBISsRFVCLVj5xApLc1SR4FNEyOY97/pb+MqG2ENVxn09n6BqO2CP5Dh8?=
 =?us-ascii?Q?ikCQV3JDu8Wgqf1alKO2kC29N47NByBlK9HigQrAMAA9hsFSJXWQAtj3sg5y?=
 =?us-ascii?Q?COYS+DYOm/Kj5VSxMoyyZ1MEqGD5V5BuhVGNexU44yVhwZBcwKl1RfG/zYP2?=
 =?us-ascii?Q?O6WsM136HJWLUIjomccdaVX61G1rbCd3o7xTp4tWs+EzkqP+lyUO/GaR4iWW?=
 =?us-ascii?Q?4r2v/IHKM4+xIWicdAtZGyrelSg8w/cLw6G0SPhweLRa7+Kp/99WeGgGxqcM?=
 =?us-ascii?Q?fiH0LyKNwjOvuDNEg7de9HgGObFiRbVLT4SyBfLzmSqCRkDdrm7p+Rotx/TC?=
 =?us-ascii?Q?cIrsEq0NhsDP0c/nRsbIWJMR/tLFJ4ZUD1E5FdvTtD49FN4NHx7u3Vc78Czn?=
 =?us-ascii?Q?s3H1puSsaDNvYa8tKel38PndT6tvtHY8gJiBcUY6PyrB6Kq2OJ/TeKb5lpma?=
 =?us-ascii?Q?Yhh5H9mebE1EIkZrj3+z3lGfqwC4a74updBW1+Ybr1HKTPuikEYK9i/pFwIS?=
 =?us-ascii?Q?8+LMNYW47Y9S9kpIVsc95Xes/iVtaS0vb9nUfnbN9CMo03GsGapTJxFyq37G?=
 =?us-ascii?Q?f7YKUmqw4CkabIWKW4jHeRhjdukEBIZF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?enMZfVS36g54Z1bf3wxfOOEIBSWP6CqJhjUJJynUbCORfmheXMNrZO6dqMEt?=
 =?us-ascii?Q?bUf2cdPf+dgkhQI2IYMH8fDraYaOcbj8XQBocT9TrsqOWb2b/BB7LfgB76z4?=
 =?us-ascii?Q?243WnJFnA9VmWM+unkizH9eZ45TFyC0OXNIvvtjiachWOPkkBMKEIHmt06y2?=
 =?us-ascii?Q?rBNJieDLQrKiCtgot0Vlj9zCD1R5xDznTdSdMDl45KdmoxN03vvQHGJyBi2w?=
 =?us-ascii?Q?oWcocT1nvPdcB7It1PMwCA0+eR+ofLRCKtHuB6xzkDMpeXYM/wmj7wRKEGjv?=
 =?us-ascii?Q?HAW7YP4rrBjIzwy6GgucpScPnvR/K5QPCh8uY46SZK4LFx323WdrFAcCkFXE?=
 =?us-ascii?Q?3dbWDGo7/CUGXzJ0hU136eQm6gItedLorouysQkpSpOD0nHiAh/ArAnkFy2O?=
 =?us-ascii?Q?Yo2NyeI7tK9QkaZ2s8QqQgn0UV3V1WmZibKnSB8GIohzuYtqhlSMYYKY0+ag?=
 =?us-ascii?Q?5qwgjQKs5mTqGqRHalTxAr0oUqodFqhtz/TTTp14pVF9RjEkbJmdAbD1OkqZ?=
 =?us-ascii?Q?fq43qi5YPBwJQmJlQMiuyujFpK/XhOo+s2IwmlVacGNql2+udDE1onx7z7yH?=
 =?us-ascii?Q?BtTxSwCKZEgeQcEQaJkIoj3jafKlc5pIQgg8D+cH62UYHnqYCODCU0SW4MIZ?=
 =?us-ascii?Q?QSjP7jpak2EVY5n97FgKBRgr4PiCsfiMB0dYndOA3jsU6mWEvw9+2s6qbOlS?=
 =?us-ascii?Q?44GHbGREiGPoSMRIyG7DnU/qRacs2V2hwHLjMhixV+AoPhmMop7hCz4uNw/i?=
 =?us-ascii?Q?uKWpVHL8guCwY6Im0YLrfZoJTTyiz83Eyl4cfrCzV7gOdfrbktrewiSDYrgw?=
 =?us-ascii?Q?C/lAX4kbaBzNCGuOoe3NkET6b5u5TzZhJvWAa06S0hhex4pEfo5sb0pw+ghW?=
 =?us-ascii?Q?eF9vBXc/1gijtdesrFuw5IlzXFOaQxldaTvDSWWdx5Sf5Zgqw1TMqDILvqBn?=
 =?us-ascii?Q?gQOwrCLdcYtqyAxUlMhvFBMItzeoJ9GkPfFAEzxMP+Oa8Lt/PDLiy9/1Prlt?=
 =?us-ascii?Q?DOJifVyYEhayYbQTlt8OxqAGq93YPjw1jrwY17OmT0qjPU/x7o1si1B5yjVz?=
 =?us-ascii?Q?brIn3NwwJaCSrfGhDgO21p9bXj/iiXfR24Wnmufo7FhVb9rTRR9yk3veFmex?=
 =?us-ascii?Q?zv3+mc/30AKCqajaNq/n+f8u8TJU2iChg2yvbSPEF0PJclFyRDyiL9paFufy?=
 =?us-ascii?Q?i8JSpqXz/mmzRji1HvgTujT/T9eWu/GX0wFoy+91aubychD61qHgcJJNks7X?=
 =?us-ascii?Q?2x4Zp4mCf7DC59w2EYOfjJgpMYn0ngMyTRHgnBWkiNbamh4wtL7BvN+Z3u6y?=
 =?us-ascii?Q?hcWABTZXPhvAEr4VbEx5+IvqR+MKMUAxMNtdF//VMTHx/DqZZ4Rc3YMP1ZZI?=
 =?us-ascii?Q?u1Oud716pkWgM/wahJP8U9IrZq7sGA7h6/KBTX9D2cq4FCDYAm5ibB7udnue?=
 =?us-ascii?Q?H/V8VEVPDW4qtJG6Hlb6zfxZ4bJYxXQ9MMPUztBlaXJ/teOhTq+uzpRHpGOU?=
 =?us-ascii?Q?BBt/fXqEdrT1Y7FhVux49EzYGFoDHZztRaf3Z2bR9miwT+BtHK5K17UXjy65?=
 =?us-ascii?Q?q08O6gNJ5cHW3+VB463Z3zRru7MCZIRFGh0wuYRBRYp05o8wncBX+S3mezgW?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ade28101-c7c4-40d2-15ae-08de0bf880de
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:38:27.6414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ni0LE9vyCBjsjpWG/D6xs/gllDeVZG1V230CKIN0TYto5PPWqF4Yih6exmajxbRrv+XCUjKR54fGKZmofCBBUy0h0DNPWeisiKw4K1RRGf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7755
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

On Wed, Oct 15, 2025 at 08:22:19AM +0530, Shekhar Chauhan wrote:
>
>On 10/14/2025 23:44, Matt Roper wrote:
>>On Tue, Oct 14, 2025 at 01:39:39PM +0530, Shekhar Chauhan wrote:
>>>On 10/14/2025 8:54, Lucas De Marchi wrote:
>>>>From: Matt Roper <matthew.d.roper@intel.com>
>>>>
>>>>The compression overfetch tuning settings only apply to platforms that
>>>>support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
>>>>compression) some of the registers being adjusted by this tuning will
>>>>not exist or may have been repurposed for something else, so we should
>>>>take care not to try to program them.
>>>>
>>>>Note that our xe_rtp_match_has_flatccs() function will also return false
>>>>on platforms that do have FlatCCS in the hardware design, but have
>>>>compression manually disabled in the BIOS.  On such platforms the
>>>>registers still exist (and it would be fine to continue programming
>>>>them), but they would have no effect, so skipping that tuning is also
>>>>safe.
>>>>
>>>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>The patch in itself looks fine to me, but, the patch doesn't specifically
>>>play only around Xe3p_XPC. Maybe we can move this patch out of the current
>>>series, or if we wish to keep it here, can we instead drop the xe3p_xpc from
>>>the prefix? Thoughts?
>>Aside from PVC (which is Xe1 and not relevant to these tuning settings),
>>Xe3p_XPC is the only IP we have without FlatCCS in the design, so at the
>>moment this patch is specific to Xe3p_XPC.  As a general architecture
>>though, if we eventually wind up with other IPs down the road that also
>>lack FlatCCS, then these tuning settings will also not apply to them for
>>the same reasons.
>>
>>
>>Matt
>
>Okay, makes sense, I'm still skeptical on whether this should be named 
>with the prefix Xe3p_XPC if we expect it to carry it's effect to other 
>future platforms as well. For that reason, I believe, the commit title 
>can be 'drm/xe: Skip compression tuning on platforms without flatccs'.

Makes sense changing it, but I don't mind either way since we are also
adding Xe3p_XPC in the same series so it's clear why we are doing so.

Lucas De Marchi

>This in itself engulfs Xe3p_XPC (and any other future platforms). But, 
>consider this feedback as only a nitpick.
>
>Since the changes already look good,
>
>Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
>>
>>>>---
>>>>   drivers/gpu/drm/xe/xe_rtp.c    |  6 ++++++
>>>>   drivers/gpu/drm/xe/xe_rtp.h    | 10 ++++++++++
>>>>   drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
>>>>   3 files changed, 22 insertions(+), 3 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>>>>index b5f430d59f805..22a879270c1ec 100644
>>>>--- a/drivers/gpu/drm/xe/xe_rtp.c
>>>>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>>>>@@ -376,3 +376,9 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>>>>   {
>>>>   	return xe_gt_has_discontiguous_dss_groups(gt);
>>>>   }
>>>>+
>>>>+bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
>>>>+			      const struct xe_hw_engine *hwe)
>>>>+{
>>>>+	return gt_to_xe(gt)->info.has_flat_ccs;
>>>>+}
>>>>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>>>>index ac12ddf6cde6d..92f0d16110dd5 100644
>>>>--- a/drivers/gpu/drm/xe/xe_rtp.h
>>>>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>>>>@@ -483,4 +483,14 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
>>>>   bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>>>>   						  const struct xe_hw_engine *hwe);
>>>>+/**
>>>>+ * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS compression
>>>>+ * @gt: GT structure
>>>>+ * @hwe: Engine instance
>>>>+ *
>>>>+ * Returns: true if platform has FlatCCS compression, false otherwise
>>>>+ */
>>>>+bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
>>>>+			       const struct xe_hw_engine *hwe);
>>>>+
>>>>   #endif
>>>>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>>>>index fd58ea5e78bf6..7c140d8cb1e07 100644
>>>>--- a/drivers/gpu/drm/xe/xe_tuning.c
>>>>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>>>>@@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>>>   				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>>>>   	},
>>>>   	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
>>>>-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>>>>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
>>>>+		       FUNC(xe_rtp_match_has_flat_ccs)),
>>>>   	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>>>>   			 SET(CCCHKNREG1, L3CMPCTRL))
>>>>   	},
>>>>@@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>>>   	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>>>>   	},
>>>>   	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>>>>-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>>>>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
>>>>+		       FUNC(xe_rtp_match_has_flat_ccs)),
>>>>   	  XE_RTP_ACTIONS(SET(L3SQCREG2,
>>>>   			     COMPMEMRD256BOVRFETCHEN))
>>>>   	},
>>>>   	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
>>>>-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
>>>>+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
>>>>+		       FUNC(xe_rtp_match_has_flat_ccs)),
>>>>   	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>>>>   			     COMPMEMRD256BOVRFETCHEN))
>>>>   	},
>>>>
