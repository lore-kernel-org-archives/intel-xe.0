Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD533CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 15:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFC210E315;
	Wed,  1 Oct 2025 15:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkPCZdrG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B08C10E09F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759332951; x=1790868951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ns23HT+Z2c/9QDzBoiudIN+iGhIO0ZDN87v/CeO0s6E=;
 b=CkPCZdrGGjxu7LbuI0TueY7t1mElU+qNVn2yFD7y8n+er+QYP5KP6kyq
 2tAYDXudCMd2bz19K4sVFPfOlsnpti727+vyXhtcoXPxnav66pHV/1OF6
 0uuPAea00m3ZObtxHvmq6CG1mr81orVlxtrE4y6A+uOWVf6SplH8n8Qls
 KJUZbaQABc5aqyc8rU+MUuVY4MwuXOgAg4jc5WEi8E6y7mIfEzGzEuRdq
 KKcaljKC1SgeiPwU5a9eBEAT66tBDmtl6+X+sNDtUY+wPQGh5YMvgcWQx
 28v0Nj9Jf1ZIkzQvKbAZ/qvLXiXOi+3WMUCvOl/+d4QxaoBXCDCI+mgGz A==;
X-CSE-ConnectionGUID: Q+wPvGJrSIicw/zvT48DYA==
X-CSE-MsgGUID: EpOpraSgTv6LeX6IAd7HTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60825433"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="60825433"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:35:50 -0700
X-CSE-ConnectionGUID: elwgk4zgTwmHB/DAnbkCuw==
X-CSE-MsgGUID: nvNVB/7+QCufIGpDZO07PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="177938398"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:35:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:35:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 08:35:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:35:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qsnj0K3o2o9pou/VZrjxWZlU2nDjaDXcCA2T0paiXpENg6bzP08X5AhuMwQKwcjwtFxmI0fW9fTDB5sOO8AR9+RF1PbmlRlKhHFCDfRjuCiENPOhjt1Ui2piaGj6/AuD8oikuw++Ign2UCOFGayCI8t/SkVkEs2VwDUx6heCNPDGA153SlKeQVzfSg0DWe0PxAjdNHj6ovcdK1us/y89I2HsgOwDkhPFvOgibh0U3F+LX9l1lrN5TcBrpOQXTsgNzatGe0bLd9GFlFP7CtbduM7EjGISXUoUygEsMULIY+hQkz3lEef29lwUnCmfQoWyI4GgixVwXWehb1WE54hBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPe/or4so/4fkl2DzSANnex716GpRP5ODoXBh/zG00I=;
 b=nt5wmzbKSeD8J4+40Pkady/dnMVIrRXxv35qZWPF/5sgAlASqNhdkBYdWePzqobVN5fgqQuViepgr2rVOqiCIrwQZs6CrDRQhuvHyqWQzOEqfFdem5hl/zQg5sNvymwusMxXBrdLELSMaEEp9KxaiBn2VCg8mMtq1vFYi9Sng0E+EcEhgalRgCpjtR15KAI6K/58ig4QlkxAJAeUYUWI8lJjuQXsjHTcVuS3aM0iFThW6ziPq/YNRqWssG67QcV5a4GRXb7zZVhUt4PTh0gRuZcTyHukz1GxEp/ArEMgqJznhrx1WPHuvrJanf8qEYum/o/oS34lxd2etpESNlUGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Wed, 1 Oct
 2025 15:35:46 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 15:35:46 +0000
Date: Wed, 1 Oct 2025 11:35:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/debugfs: Update xe_gt_topology_dump signature
Message-ID: <aN1KTDWZ_71DM2Kq@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-2-michal.wajdeczko@intel.com>
 <275ae979fdbefb5e6f4fbc00bf183eb0b7d336c1@intel.com>
 <cf3dcf02-e213-4339-b356-efa8056f84bb@intel.com>
 <1bdb6f5ad557a144f402c106d80a319248028bbe@intel.com>
 <aNwSDXlttVzutmxp@black.igk.intel.com>
 <e7814fa2-8244-48e6-bd06-ef3f71540e56@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e7814fa2-8244-48e6-bd06-ef3f71540e56@intel.com>
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f449b69-c33f-45aa-2325-08de01003082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M/yEdbMosE44euIme9x5kP+a0eUwVZFbr3m1GuRBKq4c0nf0Gw5XrpSNX7R7?=
 =?us-ascii?Q?5OvdaWf4nAUBbIziMu//80zjG8+5+Yi3Qe8QCF6KaGNdz2WL0WwwRON5ljL7?=
 =?us-ascii?Q?6xBnyy5dZcq8ymnoywEyXHeeDp76gQSkbHpjDqyIHLlFJrrcuH0FRgwI/INR?=
 =?us-ascii?Q?0C3aFd7i6wLKN/FUIjOMFQsgAY9LYoEfc7ECS03/oTlKKj9MIqjheH8LgSzN?=
 =?us-ascii?Q?hYC0v9Pjc89eIGenJmLvlecDJMxH9z0DVHd9P8r5QKgtSLG8nszsdNPkzux8?=
 =?us-ascii?Q?VhF0R5mSHgc21frSxzU4GBQfYKmQmJ72ZAXdXnIw0tMbYPCycpCBZqlVI3ZY?=
 =?us-ascii?Q?BcvUHP4m8XyCNQBKNEPUuTLPv4wEk5QyPO2Fg3BdLfZxpwQpHY2U4sVi+RUQ?=
 =?us-ascii?Q?B6aMShzAUrbEm3kgrGtbnDh9tgFyVife8wOcw2b9wQMsJgBEi6zCc0VNsJ38?=
 =?us-ascii?Q?Fy0wh+jIlMUHRscoJCC7EIO6SDxrKiJ/fdh3mTLCvGh9e4UqgJv53FnEm0lO?=
 =?us-ascii?Q?0BSvXKSxvg1pHHOSJCKpZ2p4x6bq+ZAoB0F+Cgk59LVh4qRCglvkO+eJ62Vi?=
 =?us-ascii?Q?2tvMQsCxc1CebMWacPV4B3SpBFnP88iFMqMwzWReEzxfrz35U3ahbTb96sL2?=
 =?us-ascii?Q?F4/8fnQbZZc31pKjm/el8/VtNPav+0U/lrCP+NLwIjPslACTjStSDg/WKawC?=
 =?us-ascii?Q?pYb4Ddi5+g4mf5u8EEaeGhIwBdbd7FqE5vyFouvDm+Z231kqCTK5hWoT5dxe?=
 =?us-ascii?Q?CySiDUS9Au51zuHGWSTZvPyLU6Vf6GtSLUqfSuRB4GiNGgDAIwTBnktH5cIZ?=
 =?us-ascii?Q?oT5/OBRCZRgn+oGzDr3laxCDxkk8JNYz0z3GsTP7oeXV5m/jMXGT2iWM3uHC?=
 =?us-ascii?Q?E//eUtNU83RmH6tXIjCMOmii9TJHJaWWXNTBGMERp3OmobvtWtu/TaWmxqtp?=
 =?us-ascii?Q?OYggQZJ3hAFxJZzEWif/5r8dvtbbYSOrfDGwABWmEtlokZWiWcMcRSxQt8JD?=
 =?us-ascii?Q?0jHLbFnhY0oNCDIDCkz9oqvTgg7GfxkDoDnIARUgLchs/U2OtgjW1tnNYZNc?=
 =?us-ascii?Q?+uABqMMxWekG7CIdjG0AJxKXWNOfCtG0zcYksgMd4fYFMYIowSvfBNhMtql5?=
 =?us-ascii?Q?IVDwmntRXpS+DbgQ+sgufj2lLCBcqaxp0cL6oJUxrf7gvtaBvbPDgOZT/OEL?=
 =?us-ascii?Q?IFlDrLX5Cg2x2ptGSvGgadt6GWty003z7SdRvuTKVekCv048LvD6VZLdYowk?=
 =?us-ascii?Q?ycVWT4JFbO1tL/gy5EP4wjIzR46L8+bWboqipAfJYHwaeX2US4SEgdD3XAZd?=
 =?us-ascii?Q?kLsGjAB+f5WAjZy8vuZgL10wPNszZkiDs+WCNF+trnKhEKM15WOTF4cYUsCz?=
 =?us-ascii?Q?GIdDgQambkOVlbOj4drvewrfsvXjh5BZ0JB2/i7oKtGQ/6LTEkLzgDFtVHne?=
 =?us-ascii?Q?k7as4Ri2pzjBJ+tJeaHopq1+rphqMYCn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X3Dnl8TGvAiF39lyI8/voF66z1uODGMjEOS3sXuR+3SFBfbKhVPIYDqwktz9?=
 =?us-ascii?Q?8lwAguIDgSyONcmLY6SesHcRVM4/M9qTs4T/QQdkzo1+6rZMeol23IHEpl7w?=
 =?us-ascii?Q?HkTFY8oM4qF+q8jVxfpRp55UaclIlJXrckp3jgjxLQZNCPxdjxm1Thlc2y/l?=
 =?us-ascii?Q?PHce8Uw6AzjBV0484MYMhqk9j15oVJ3IAen1YeoMoJ99tkwN8ytbuxQ6on/Q?=
 =?us-ascii?Q?+8uoOlbi9bfss/Eob+9i99s2g1vnYDhSR/7y3SLGxZZt6Zin9RXf5euc/D8v?=
 =?us-ascii?Q?x+eENLhjE3HvFaEK3rPB2ldevKuglvfn5yWWo6D+86hd6bpXqwKMdIL23Aoc?=
 =?us-ascii?Q?UNLlyw5YY0CnrIxjZJbgIwiImPANNGHtCwBTR5Q858ob2xUgyG8hQBuFJ1ha?=
 =?us-ascii?Q?Zxww3VB0prxoKl6u6R96rGQmKSBtGT+m5wvzHtPjkMKDTXfbboUD7VvHADGZ?=
 =?us-ascii?Q?ReiEtC/P8+NsAxMqiOn+GfcLA5yfEut439oYcoZC2imuCIZlcdzG0Mxviayw?=
 =?us-ascii?Q?JIf3WQ4vo89rGMx2fMnkGWOSYlKz9tKISwRwr50aS9TL594V7iumacp6GQ9H?=
 =?us-ascii?Q?91u9hO/W6KJI3lg/rbCHNqZXp9NtDeIxoQ4dioNUFZqWIw1k6v1/eoSeSzJd?=
 =?us-ascii?Q?0Rp+EeqGHqv0H04x6N8nnCiK+BgvGEaJtgaKBb10t9torA9po10MwWBhHpSV?=
 =?us-ascii?Q?4Op6mOfVnEosDO7I914ec2KI+dmfQ9Q7AdwJ3rwmQZzjP+j/ijciYdIvvdaD?=
 =?us-ascii?Q?/VJCU/Np7eYFm7b6Sc4wsNSvElifNcv76CM1b8+HjtrZ3tBxzCHvoQ+gDItC?=
 =?us-ascii?Q?IAJS9h+csACYKJvNJolg8vgjeYhhea3K+4fs7VLla0TP4ax7XlBUIjRKr8wR?=
 =?us-ascii?Q?zR/adxw4oFJH52ym/3XJ13lIgPFbPRLE4Qe5nRD8+UYFYQXikEVCswoNUWgX?=
 =?us-ascii?Q?SoxjhMeTvysL5G9L0y8SRvob1J6/FyeuSRWTgurjDXGYWLvGw5Qzycu1bfjj?=
 =?us-ascii?Q?Qm/XgZ0NtCbwfmRhuxOUlOORRVfmjjH6rp66+cDJO6gNfro6E83xGbIuOu6J?=
 =?us-ascii?Q?WFeqJx/gwJLWUgcnjslBSfCLusFpbhtRw5bhHXLS3Zp5tV161S9JAKfZeRid?=
 =?us-ascii?Q?43ITbxkH0nPBjKahVaHyUr4NEKaWV5Qf6ZhWpLVzGiiekym9RvXv4q2VRsxH?=
 =?us-ascii?Q?RhycrkEi7C0FHjPYyzwG0hM6m/pgyvK1jj4rovHULM7dciqC0bIjinO4y9WC?=
 =?us-ascii?Q?rxZDvLCXQOjUaCa7/hfq/a2yqj6hW6AKwIWf9jbrGZ5FwPrnz4ftCGd7SyHw?=
 =?us-ascii?Q?wbSphNL3w+6d6q7TgGitfgkk1hXcY662N8I67Np1QBwmo51nipkd0briETHr?=
 =?us-ascii?Q?KKHW57nOfazUBDxoYpBUIWyx15mccHUlSf1naYYvfaRMjqkh5lNRY+f8mBUt?=
 =?us-ascii?Q?brnSuR4GfhOu8eDdVaaSTo4OAWE1SUFKic8MRHw0xU1A1asjvA+xcXlps3oW?=
 =?us-ascii?Q?RdFOGfXqEkoeYXySW2cgtQQCArjtY3rNnT0O9PhCYVgEYz2LovcWYWgZh1xr?=
 =?us-ascii?Q?zyeMeYjwVwar20psTgSlGVVkERoqZCzk0N04W92E6g3NKG6ebuMe0KQtbt5I?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f449b69-c33f-45aa-2325-08de01003082
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:35:46.1175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtgTW0CkDu9JNc+1NwSdehgJouDSG5UvbDRYSyu/ffsEHH8BkOiAV1SisiCUaPZ8fbeSiSm4NaBX+RlNIqPdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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

On Tue, Sep 30, 2025 at 07:46:29PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/30/2025 7:23 PM, Raag Jadav wrote:
> > On Tue, Sep 30, 2025 at 02:43:47PM +0300, Jani Nikula wrote:
> >> On Tue, 30 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> >>> On 9/30/2025 10:45 AM, Jani Nikula wrote:
> >>>> On Tue, 23 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> >>>>> +/**
> >>>>> + * xe_gt_topology_dump() - Dump GT topology into a drm printer.
> >>>>> + * @gt: the &xe_gt
> >>>>> + * @p: the &drm_printer
> >>>>> + *
> >>>>> + * Return: always 0.
> >>>>> + */
> >>>>> +int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> >>>>
> >>>> What benefit do the formatted kernel-doc give us? IMO it's just
> >>>> boilerplate with pretty much everything being obvious from the function
> >>>> name and parameters. And the functions aren't significant enough to be
> >>>> made part of the Sphinx build either.
> >>>
> >>> I'm just following the (unwritten?) rule that in Xe we should document
> >>> all public functions, and while in some cases such kernel-doc does not
> >>> bring anything new, also like in [1], IMO it's still better than no
> >>> documentation at all, as sometimes, like [2], function name isn't
> >>> telling you the whole thing
> >>
> >> I'm not arguing against documentation. I'm arguing against excessive use
> >> of kernel-doc formatting for functions that will never be part of the
> >> Sphinx documentation build.
> >>
> >> /**
> >>  * xe_gt_topology_dump() - Dump GT topology into a drm printer.
> >>  * @gt: the &xe_gt
> >>  * @p: the &drm_printer
> >>  *
> >>  * Return: always 0.
> >>  */
> >>
> >> vs.
> >>
> >> /* Dump GT topology into a drm printer. Always returns 0. */
> >>
> >> For non-EXPORT_SYMBOL() driver internal stuff, in most cases the
> >> parameter descriptions are self-evident, and repeating the function name
> >> is just, well, repeating. The formatting doesn't buy us anything, it
> >> just brings overhead and extra maintenance, because the format will be
> >> checked.
> >>
> >> For EXPORT_SYMBOL() and the more important functions, or generally
> >> things you might want to include in the Sphinx build, or anything that
> >> might benefit from the formatting for readability, sure, use
> >> kernel-doc. Otherwise, I wouldn't bother.
> > 
> > +1. I've always thought kdoc formatting was a general guidance than a hard
> > rule, especially when the driver footprint is already quite huge.
> > 
> 
> I would not mess here with the driver footprint, as this is not the same as LOC
> 
> what I'm afraid is that once we decide to relax the documentation rule,
> then suddenly all functions will be treated by their authors as "trivial"
> and as such do not require *any* doc at all, even the simplified variant
> 
> OTOH if adding few lines with @params is too much too much for the author,
> then maybe he will reconsider if function really must be public and/or
> requires that many parameters, and/or their names makes sense

I'd like to get the view of Lucas and Thomas here as well, but I'm with
Michal here. I prefer to request all the public functions to have the
kernel doc style. So we ensure that we don't miss documentation, we
follow a standard and author gets to consideration of the params and
all, like Michal described.

Having that as part of sphynx doc build or not is a different discussion
as it needs to be included in the Documentation/gpu/*.rst

> 
> 
