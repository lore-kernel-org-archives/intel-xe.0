Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34C3CD13D2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2C78952F;
	Thu, 30 Apr 2026 20:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8m1tEVX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6DE8952F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777582677; x=1809118677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kILxNhweARXKlvWXPmWqrOQp0f2sXnvuhYuTYeNTLpE=;
 b=K8m1tEVX6ENiXGGeHxyFV2/o2w35aGMJB8k8VvD1t0qurEowCavfGC6/
 nvCX5HinXtwBAsO71V0nEUYxtC2lFl0yc3TG5AGliDngo/X5EtQjtZbXi
 el9mPwPe4FQj02h9KFnPnFOjji4NqYOsGkxMUGzgtopcS66xetAEjWz+y
 2f8yCY6oMKkRWyiBZOnikzmVNnMvRFgUOFr8QYvZJAD/b/KUTbTt6PP+f
 nWQZQ+G6YAeBz90zSiPKAZ7wB/X9DbCDN1yomI1gdRNGxWyjmzGqkwOf4
 M0ZFTt4WZRWqH2vnr0U8vIoM2ytA+l3YHnV5Cx0Y/KpbJuMKwRZu2h07c Q==;
X-CSE-ConnectionGUID: YgA+2XLwTdKcvi3mJ625Mg==
X-CSE-MsgGUID: yUC4s7rdS7SNkKTcoVhcmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78601352"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78601352"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:57:57 -0700
X-CSE-ConnectionGUID: MzQqpDTFTTefkKVrCCqTgQ==
X-CSE-MsgGUID: 94DCsQ+HSDOoD7/JosjcUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="258277131"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:57:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 13:57:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 13:57:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 13:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNQwxXpjLRPaMOBKMExm6vYOPt4pqgNQDOMt8rUhU7Wis5FBtYxEQQ016LLu8E8GBJkS8/lwnf7IlfFHFOwbQ6hGMonHW/uxRMLAoPTwYQBfy43kxrvGRrvKwhSxy+M4WMKi1Ycgz5fKrJM+4lvByZz1SGZrTnMsfe9AsiXsFMtzdZN0P+kxPwC+VND/l6q55BHT9HHUxhK/McoIyInZZKOSMQd0IQGZvTRj3PbTJBJKN+0lApnFJwxqlDfLf1YfVbrEvuS9bcunGIywqAlAfeqi34rkceyMH5pQX4fPDE4xAd6BGqtEYVHRIQj8Rv5e6INLLaJUSzNOqG2kzwNKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D61UhkIUHQPalpJq00H/cF65C4rIwo9gKiLgRRXPkXI=;
 b=Uo9jPBP409/7c1T9QfxGm30r9oiM/oqWP+qMEkI2AdllaKyU+q0VDP/nIDj9DtkaaJWYmiJYdJIqoB2nnv+iQBPeErclPdiGuehtXA1REt3dOTkyRsTz1LTC9l82WSS5C2GvO7KU61AJrs1CJXgPbOpz92ojTcRrPEtV4pHsBUbcN8mfpD1hhvtrqaq5zBHsMNfTcfzwn/uUv0roMBg4jd48Z7pRe15Gn9MiHjKn79dGUHY+5BR+cRNVEc9dqBn+UqHoje5w9mC3giWcnsCVczJbYuy9cmifN3D7tvE3w11mWWGjoNRW/Ptr4enYJSSMsP9Lkn4ySOLD8lpOZUzFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA0PR11MB4688.namprd11.prod.outlook.com (2603:10b6:806:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 20:57:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 20:57:52 +0000
Date: Thu, 30 Apr 2026 16:57:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <maarten@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, <lukas@wunner.de>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v6 8/8] drm/xe/pci: Introduce PCIe FLR
Message-ID: <afPCSglJC3E0e_Zh@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
 <20260423100017.1051587-9-raag.jadav@intel.com>
 <2de7d34d-6f47-4327-9290-7cebfd47a69d@intel.com>
 <afGKM1bKyORzPzJ-@black.igk.intel.com> <afIwQWRZyZqM2lWl@intel.com>
 <16ed12a2-bcbe-4569-9be2-1fb3d3faa66d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <16ed12a2-bcbe-4569-9be2-1fb3d3faa66d@intel.com>
X-ClientProxiedBy: SJ0PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA0PR11MB4688:EE_
X-MS-Office365-Filtering-Correlation-Id: a91b5983-a95f-42dc-524c-08dea6fb252d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: hyA9fsZBgO6Y/8V9C48RNG3FpBR8cHzliConSzTE1VbK4+opRwPy4KAITR02GexiGbQL5jd89qWbYKExKs6sBhQ8k3AiE8Y22wp+9aHSMfU/GtFSdd3NBHNvZtxgk/E/TKHOOQg7rCsmHXhca9x+fj3uZ+osAeAzxG4N+1pEPcCwTXzVj5nwxnY4ZYG6xP9TtUJ8hud84UsFpyJ9+ommCRDAqhyyv6oFIRqJmsUWPGjFl+8UG3c+amPb9/J4dEtkdMb7r5YIrX/7A17GjrfiEahNswvnOaBgskkmqEU3P7oE3661NMgKzWyfef/CCYdouEAc/cHbMLSmjj4te9zUjrF9IVGzaU3C3S1a7bgHbHnQhZewesZsh+H6ia+ZrzyffebBXhIXgjwWalJ45u9OVqSfuD5xPrPEO0XAKFEO2uf2d0OCE5+/wbf6644z4XGnr0YZBF154zK+FBCDzco1DvT5Rtr9C5paV+H9nXq9n+X1FKtFiTmxerdOVa9NvJxczmZFI5nmWx2GOCT8jqTV/ecckfZbEWKvMOVP+QceKD15U/rP4LHX3lfadk4HmB8jssAOy4InNpjJcI7X4uNlHvJxQzIs8oqkOmsdxl16CbKKcGLvS7y6gOdk8JS6vnWgo1VUDoJ6kF4c9A2bA5KdUHsOUj1xAQbkPZxuQbQczaLojL5DdVOIZFd3d9DTsbPc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SqoedTZdlnolchuLeAW9EnEl6nga4ylbDZexntcweg6uq75MnWJHw+9YxxUU?=
 =?us-ascii?Q?m0jHpZ1+KbRlQKFgdZ9Umb1fcUAS+8uvd4Ihu/pr3P0qJBB95lmbmFO7mLvy?=
 =?us-ascii?Q?L81/iV5dIbdu8tnoKMCK2fPdUUZgCGQHA7An0mwJKT+soWmOG5F7RdlYxQxp?=
 =?us-ascii?Q?zxY+ejV2AsnJwR6upU/jpTf9n8/Ri8U8Wf61+H8xf/65LoEHR2PXjVpIVMut?=
 =?us-ascii?Q?rk8ta9mNCrBZg3kyR7By4hzyto8K1JFNR+ILGLsv9F0VYaosywMrCKIO+Pgv?=
 =?us-ascii?Q?toeuhStBCS4lD0aaLMbLwPVn9b2XOOhgwdaJJVSIMPyQqwagc+GCoHfap7ri?=
 =?us-ascii?Q?XwBAixfAaNWU/v7XQwkDIVb4+nLehdk5QPqI9pww863Paz0WuoT74UodGfq2?=
 =?us-ascii?Q?W9Lph6nCUaoYSJuI52hYyNiG8QxWOerxqIfPN67jF5lt46L/rZn2lr6IRcIC?=
 =?us-ascii?Q?7ALtOek+EJ/Uk92hLKvF6hMgWol8delivFAkn712zWBpZjAkjhzTukQDuwMi?=
 =?us-ascii?Q?/1BBjmwMtDBaroRyVCWhzZt0D/hO8YvW+iJnu6YqLoSDgbRKU4KVTfDyDb6A?=
 =?us-ascii?Q?OrqCRshtTc40bb3j8ZWYsCeBO2+cJCDKVMpxhFIELaqYhKsqOH9Ij1rPicdX?=
 =?us-ascii?Q?O6w7NEX7iez9mIoYaVsxsn0pvm87juR0w0aAk/5NB3xVjPpI9bgf3b+83e5u?=
 =?us-ascii?Q?1PvsvfPRF3XP+19OBbei29Raa+Wje02KoJ7vai5ECiu8nT7HF7TLSCCttzh6?=
 =?us-ascii?Q?SlEYviivfgBYCsx1Uc+zpGzaq5RZ4LhBAlgeFfkxaINV6f0PNUB+EOrMR5Yb?=
 =?us-ascii?Q?i9qA2wjrLKdkVtTwXwp8inhE7J99jaG3QMj8g6hJg+OPllyeI9tEi0bA7kyn?=
 =?us-ascii?Q?BwE0Skk93KNw9+P0+lriRYkRjewekUr9p8QaxdBNmA9spbj4Rim9aDlU+6Xv?=
 =?us-ascii?Q?Bgts2sKTU646K6Om7ENTQb5WXBkfZJ3bXB+ig2VrGO/J+lhsG0A+8H4jy/2d?=
 =?us-ascii?Q?sWyg/T3g4zPZopr/S96N9VmdN3kIgvHFXFdJh7s3MBMVGdoo90/QJVbvaPXj?=
 =?us-ascii?Q?IgGbFOgqLLfvfthY5qXWhpKRQUejv6Lu/enGvTTF29DyxNRt9eD9TJGmHOlg?=
 =?us-ascii?Q?K+aDjQ843LFAqKjeneOPuE4L9YgxbyFr21drc47JkAb5EJPiAf9FlXux2M4A?=
 =?us-ascii?Q?PWqqJpcXk4nTPBG+QTYaB/fg93f1E4UBbdz2i4h9gXDR1CIz61WA2nCouuJD?=
 =?us-ascii?Q?v+X/34+EHpPoprcGXM9pE2NFhv8tX+6e4m7tXxJXsitqbPijehtYiCyIaPiW?=
 =?us-ascii?Q?lJGlWgxgUC8b6xyEUKdO6j1iQswfsmTGxTrNIIoEgVoYTYKJ0F+Gye7R0nF/?=
 =?us-ascii?Q?fhsBxmheOD5+2C0Lmh3JNeLyU+cIam7mR08q5kgxLcplF/igRwv2tmtqTYAj?=
 =?us-ascii?Q?jMEGmKmDxYImz8o2aSFTkcME7kXDs/NymNGv9P8vOmT9QSJpbK+7Vcg6A6TO?=
 =?us-ascii?Q?Y2KcSR2w7CZ5iqEbMEgy5SKpqoLpC3XzDkaPW+N6ZhXqAShLdYYuu0FdWHsm?=
 =?us-ascii?Q?8ZXFfX481wrYcA9Nk+2ua04w6TX9y2geVFHOb1siMvLYqbEOZXBbcuC1E0SD?=
 =?us-ascii?Q?Q+lFZ81iFP/gwpioWf+qQZkQlt8BJ46Us6pEOi5yH4cjIOrsQynOTAvYT5Kf?=
 =?us-ascii?Q?ryegYXh7rATU0gsYEDmpCPeZT3dw9SZtmGpiNsp1O4gpwoKyNjWAiqsFP2dY?=
 =?us-ascii?Q?vIO0W9zKGA=3D=3D?=
X-Exchange-RoutingPolicyChecked: SVReNs1OO2RMbDliXaPZdVKwf40JP8kqRhKlwVuq4MwzmH8L/bqcqNsrlCfjvhBuSIdfaCzJzeYuz983kKixq2YCOfFbV97oQsn/o8L3xMZJTSJZ64l4tMa2tX+/97pmwzRweLRTEXmxVkKet3/Orkz5+DgPU9GMP03j3K97+GuBMtWJq50x7BpN5QQCsK7Ah2sYQLtFibHiMAaBg0wYwRaUXb/DeYfGWhO+K3+kekjtTmMtInhMXhqvVNXvx0S4ygz1XiUO0wuZBDmqscvhYvtyfkZEfxvnRpnLTM17FlA1WXosvSriYdCIOXdoOphHwot7OODJ9OyDKbLdbyoIwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a91b5983-a95f-42dc-524c-08dea6fb252d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 20:57:52.7573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyfWCAqwh7UtP98+TT/TtCU7e/LG2gtKO7NSayKrMWO7HZjp1ALITCR1Erzx3L0jr/xi/WG3SN9XiFeJr29oGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4688
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

On Wed, Apr 29, 2026 at 10:57:53AM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 4/29/2026 9:22 AM, Rodrigo Vivi wrote:
> > On Wed, Apr 29, 2026 at 06:33:55AM +0200, Raag Jadav wrote:
> > > On Tue, Apr 28, 2026 at 04:28:15PM -0700, Daniele Ceraolo Spurio wrote:
> > > > <snip>
> > > > 
> > > > I haven't gone through the code yet, but I wanted to ask some questions
> > > > regarding the approach first.
> > > Sure.
> > > 
> > > > > +
> > > > > +/**
> > > > > + * DOC: PCI Error Handling
> > > > > + *
> > > > > + * Xe driver registers PCI callbacks which are called by PCI core in case of
> > > > > + * bus errors or resets.
> > > > > + *
> > > > > + * Currently only PCI Function Level Reset (FLR) callbacks are supported. Since
> > > > > + * most of the Endpoint Function state is lost on PCIe FLR, the flow is pretty
> > > > > + * much similar to system suspend/resume flow with a few notable exceptions.
> > > > IMO we need a couple of lines to describe what the impact of FLR is on the
> > > > HW. Something like:
> > > > 
> > > > "PCI FLR clears VRAM and resets the state of all the HW units. Therefore,
> > > > the contents of all exec queues and BOs in VRAM are lost and the HW needs a
> > > > full re-init".
> > > Makes sense.
> > > 
> > > > > + *
> > > > > + * Prepare phase:
> > > > > + * - Temporarily wedge the device to prevent userspace access
> > > > I'm not convinced that wedging is the correct approach here, because the
> > > > expectation from the apps POV is that wedging is permanent, so they won't
> > > > try again later. Maybe we can have a separate flr_in_progress flag and
> > > > return something like -EBUSY or -EAGAIN when the FLR is in progress?
> > > This was my initial plan but during implementation I realized that much
> > > of the code paths that need handling based new flag are already handled
> > > by wedged flag. Like IOCTLs, dummy page faulting, GT reset worker, GuC
> > > submission, GuC PC and TLB invalidation corner cases, SRIOV races and so
> > > on. So I decided to reuse it here.
> > > 
> > > In my understand wedging is permanent only when we choose to send the
> > > uevent and expect device recovery from userspace, which IIUC we're not.
> > > So I hope that's okay?
> > Right, it should be okay.
> > 
> > But we have 2 different users on top.
> > 
> > Runtime (NEO/Level0-core and Apps):
> > 
> > UMDs will send DEVICE_LOST to application in the case of any kind of reset.
> > Nothing prevents App to go and try it again. It will just receive error.
> > 
> > Admin (Level0-sysman and XPUManager):
> > 
> > As Raag told, to them it is only permanent if we ask for help through the
> > wedge uevent hints. Otherwise they should still be able to re-enumerate
> > the devices whenever needed.
> 
> Those are very specific to server use-cases. While that's what we're
> currently implementing FLR for, there might be other use-cases in the future
> that require us to implement this on the client side (there is already at
> least one case where we wedge but we could instead recover via
> driver-triggered FLR), where the apps can be less curated.
> 
> I'm a bit lost on how a random app is supposed to tell the difference
> between temporary and permanent wedges if they get a DEVICE_LOST error in
> both cases. Are we expecting all apps to register to the uevent? Or are the
> UMD drivers expected to return a different code if the wedge is permanent?
> Because I don't think that an app should just keep trying again non-stop.

Thomas had a proposal with watch queue where we could pass UMD some different
error codes in different situations so UMD could perhaps handle different cases
in different ways.

But as of now they have no different ways of handling things. They send
DEVICE_LOST to the application. Application can be reinitialized or not.
Nothing there states that device is lost forever at the same time that
nothing is done to restart the application automatically. It is up to
the user to restart things over when they need/want to.

> 
> > 
> > > > > + * - Stop accepting new submissions
> > > > This is done as part of the above step and it isn't a separate one, right?
> > > We explicitly xe_guc_submit_disable() inside flr_prepare() so I thought it
> > > was worth spelling out. Will drop.
> 
> Maybe instead of dropping it, reword it as "stop all submissions to the
> GuC".
> 
> > > 
> > > > > + * - Kill exec queues which signals all fences and frees in-flight jobs
> > > > > + * - Skip memory eviction due to untrustworthy VRAM contents
> > > > Note that the VRAM contents are not necessarily untrustworthy at this points
> > > > since the FLR hasn't happened yet. However, if the admin is triggering an
> > > > FLR it is likely that something is broken (whether memory, GuC, GT or
> > > > something else), so we shouldn't try to touch the HW anyway.
> > > Yes, that's what I meant here but your phrasing is better. Will update.
> > > 
> > > > > + * - Remove all memory mappings since VRAM contents will be lost
> > > > Dumb question, but what happens if a userspace app has an object mapped and
> > > > they try to access it from the CPU after this step?
> > > I'm not much familiar with MM parts but from what I understand it'll
> > > cause a fault which should be redirected to dummy page. I've tried to
> > > handle it with commit c020fff70d75 but I'm not sure if that's sufficient.
> > > This is why I've marked MM corner cases as TODO.
> 
> AFAICS that patch only redirects to dummy page while the wedged flag is set.
> What happens after the FLR is completed and we've removed the wedged flag?
> If we've dropped the mapping to the memory, where is that access going to
> go?
> 
> > > 
> > > > > + *
> > > > > + * Re-initialization phase:
> > > > > + * - Recreate kernel bos due to skipped eviction in prepare phase
> > > > > + * - Restore kernel queues which were killed in prepare phase
> > > > > + * - Reload all uC firmwares
> > > > > + * - Bring up GT and unwedge to allow userspace access
> > > > > + *
> > > > > + * Since VRAM contents are lost, the user is expected to recreate user memory
> > > > > + * and reload context.
> > > > How is the user expected to realize that they need to re-create their BOs? A
> > > > queue can be killed for different reasons and normally that doesn't imply
> > > > that any associated BO is now invalid.
> > > We return -ECANCELED if wedged flag is set and the dummy page data will
> > > read all 0s. This would be the indication to the application that it needs
> > > to recreate user memory and reload context.
> 
> Applications don't usually check their memory to see if it is still good.
> Are we expecting them to start doing this? or are we expecting all memory to
> get thrown out every time an application gets an -ECANCELED error?
> In either case I'd like an ack from the UMD teams on this.
> 
> Daniele
> 
> > > 
> > > Raag
> > > 
> > > > > + *
> > > > > + * TODO: Add PCIe error handling callbacks using similar flow.
> > > > > + *
> > > > > + * Current implementation is only limited to re-initializing GT.
> > > > > + * This needs to be extended for a lot of components listed below.
> > > > > + *
> > > > > + * - Proper re-initialization of GSC and PXP for integrated platforms
> > > > > + * - SRIOV cases which need synchronization between PF and VF
> > > > > + * - Re-initialization of all child devices of Xe
> > > > > + * - User memory handling and MM corner cases
> > > > > + * - Display
> > > > > + */
> > > > > +
> > > > > 
> 
