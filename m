Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816D3D7497F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 16:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C8E10E223;
	Fri, 19 Dec 2025 16:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzgKwBRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DE210E223
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766162553; x=1797698553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZAG1RmRy1n7SX7O1zeYMHjJdoeFYsXbvM3bUYR5A850=;
 b=HzgKwBRWms8gqdaiJrz0Yr4SmgLYf7iAc1cEggsHboDk32pVhUzq4IPd
 I0l9cy3EHAYh84GrjNmfuXVUTtp3KFCSktx3RFAkvXlj9Rx0zCLuGlHKW
 3e+3HzX+HLFIBy/UQFbPFrzcThsVKfj+8AzoBpvCMTWQHbup8+oHQULHW
 tmsbgpVYHqFIZHwNhCYSLTbMjSFP7uGifNvyVCsaejTXNKxz4P8C07++M
 FfCL3/a8OrwIbfAxG4QJkd11pwbZy9CR2x5SQ0NLQRwQGiu4T+fBtuFI6
 rxu3xSX/vl7F3WXCz4TOElbpm3LQq6e2fwd2bIIRMMl/hNtL/bet9pe0S Q==;
X-CSE-ConnectionGUID: 4aIiJJNXSOmCjV3FfKiWwQ==
X-CSE-MsgGUID: RNuyViSDStW79A/7BX3HwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68201826"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68201826"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:42:33 -0800
X-CSE-ConnectionGUID: A3t/pVBsTa+iBx68rZeRcQ==
X-CSE-MsgGUID: bn5V081TRsWJsQ3DPyHRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="222319317"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:42:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:42:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:42:31 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:42:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIHvbZUb/lG9smrfXJxBK+jwkgiFqqD7eQqLB01qBhL3ve1r8mufrb1yDYgw9qQOANmDnALPTt5451bSDyjKtVE0vwyTzE/IY+sJPb6kV6B0UqzjW0poUf7VE7/HP7/uqWRNCGxXi0rgrP4bGSsDJXQ39t8BFCS8UhVFkGssYC5CJSLvV4YnT5OFMp4GeKoBB5R/RStO1d61C8BDxEUHpoS76qyczACgIQeEkRK4RMW41FGGOB8wBa3vj5SZFlp2clOy4mgxuD57zHgRnbFN9KoYDg2E/DfdUHt2MOAbVFN17cXqWre4yidfobOwt1UUmwpnn7of4yHsB5qs0w9Dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHLhXHvLTjnHOWjgpK/7ea3T544pay+Tb3WkvfApEJ8=;
 b=TQKr+/4haJwOOHg0VO5eEQxK6oUTu2+uvM1Vc/bRUjjiJyfqzxbLWmg6jTLvHauEciLkDdE758hE8XHDO/uhHxiCHcaErsTgEMoW3NOlru8yZ8Qh5xoPCTVMpTaVIBinGrxj9XeolyyyHuzH+GR/7pu9oNSC24G9zWjb6+NAd0cFSwR9sbynPNg7RDPZsNxN79NA399LAdAASVZIZ9W2PYIcia0FIXS/WxzkFgxklTa0Ag6oPVmgoY+N6cZdGJahSQ39eD/igSxRqqpUFGkA7PRU2fRhaWuucLYqy6lu7uLrnSBwT6VVCG6eXKOobbXxs+3Bmk31doKtBc0tuZ7rVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7115.namprd11.prod.outlook.com (2603:10b6:806:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 16:42:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 16:42:23 +0000
Date: Fri, 19 Dec 2025 08:42:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/device: Discard check for lmem_init
Message-ID: <20251219164219.GO4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
 <20251217231229.GC1180203@mdroper-desk1.amr.corp.intel.com>
 <aUVg3EtDPVJ9hnm7@bvivekan-mobl1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUVg3EtDPVJ9hnm7@bvivekan-mobl1>
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce69168-c08e-4895-6239-08de3f1d95d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XMVR228bpQnknZthjNf06dIt/mkPXbhV1DY363CeIXRGOziesZ/wqRcHrhjK?=
 =?us-ascii?Q?OaTzeojRbT3L9HkHH1J+cx1IoLGooznLt8SCMFA/jVVtAFDC6rmDHDLTWF26?=
 =?us-ascii?Q?cCPyOfX9ylVtetQr1vH6hlHOqkjZc8adeNOMIEM+K1CSDvA4CwLeFOuP4UgR?=
 =?us-ascii?Q?BKfiILEtfF5xjJ8QO0fFOAOIJWAnDP+BZEVVroWghEzgOaw7lbWaEO3iyCMw?=
 =?us-ascii?Q?Xll8urB2sKi6FpyHyn3qWInD1l3orpvRU1GaSBEA3jFzbWsxqnEyR99e0PbY?=
 =?us-ascii?Q?R7yECUNugpqCQHsS+mXJmScqFW2hV5FTqGMKs9gGBkvtRElmChmWXVMNkGis?=
 =?us-ascii?Q?vaXhxtu34pXgosgBNYuItWrDRDJuxF1ctzXLTx0X2SpkbJHtKFJnaPXzJ6Sn?=
 =?us-ascii?Q?N4jHReQZMxGeL+bCrCeoD/3z0yLUUcjNdQvWFuKbYQXZBhs3yPlitTYo4UBg?=
 =?us-ascii?Q?Cx2EVRtmEvYJc6IsKd5lrISB7GK3y1lH2GJCcNEmbAp8a2fuDiw1t6uIow9J?=
 =?us-ascii?Q?mX09BrWQGWIAmNSlimq48LNx7hkLhNzHknj8B7f0XPPjK+LhU3fdOWKxnQ30?=
 =?us-ascii?Q?Ox3LrlkagHbO3mkWLdy7n5aXjBtBcklONMfWo4ZEvRfXvwq+6SG5cEpNGzLV?=
 =?us-ascii?Q?l7QkA80VQSiziVaiefw5N930PQKZ7TyTgbEqU1tHTnpn6feR+V34jPEYB+Yt?=
 =?us-ascii?Q?WVDQ1xweL0KYXVAhqQQZ/CUcrAHFj+fdD2uktsjGgjxfwzJXz1a6XNpB5y21?=
 =?us-ascii?Q?aodwRCpS/94YcZKm5MdOGdMyOidHK6s4CWl0TpTKkwFhVXz3irO2M6mPVJ/k?=
 =?us-ascii?Q?qp6qCJmgpLCmwRm2UWFGzRwtL6rsZ2wgmJ6fXlKTujkZf3Bn0bGTPMgo+BtE?=
 =?us-ascii?Q?MQbEtslUwc4Y+sy15nyFsh1QmHclpDAMMnvXMV9uOhwrHzLK/KIQF+nZAKUg?=
 =?us-ascii?Q?ILPrx4aUO8j8HBCDKNJQj+lBj6w5nALOe5GZjMPRDLi7LBibqjFbs3CmYhmJ?=
 =?us-ascii?Q?BUav3rXFH1qzdS/3g9sENYglFmcorxEohv/lcxeVRUl9jQX9RmQiaJKK2Q9B?=
 =?us-ascii?Q?k+TknQ4ii2YtGiN5w1UZwUhyUTVioXUIucjVKq6AyZxozfQtuwpHV6uslwXX?=
 =?us-ascii?Q?eKyISt4wqH60bnc17U7MLm6lL9icWLLqzqjl53kER5mb6oOwbKlCCMUMl9vt?=
 =?us-ascii?Q?rnyR2kLPMoQimN7mFnohMN9OenuVTIqG87qXfoYNGpk/u1RHmBMkGRrrwXXC?=
 =?us-ascii?Q?WTp7jS8rpZ1Z/Cn3VMojaWri6LABYQyOriMhKKiIHltgmCAXFjH42k41llH7?=
 =?us-ascii?Q?IyMeP1qR6bhP/1QmJjwU5VFR+ziGedPAF9HTPpKLsRyRGqC6Fhx0mWC0Aciv?=
 =?us-ascii?Q?B+OKj/gCujHvkj4Ae2/JKL2imtSHaTyJ0Zw/em+VdpXP+CPrb34hsJXb/5Cx?=
 =?us-ascii?Q?Prit+UMXzsUowuDo0nYv4GFsnw3iyREj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ejXhPD/Y9kB/HARUZ3X/f+3fhylt/MHUaDkdrtya//T2wafjqWdy3BDERTQc?=
 =?us-ascii?Q?yT9gQfueL2PPrn1i5ycgqHvRSWpJKIk+J/fJDXuYisAheEDZuXTyobEQvV4J?=
 =?us-ascii?Q?fMZsBmbN8Z4I6HsoFayn79Z+Ebj4rlM6pQf0pR2euA5oGSoMA+qG9ktVXLUd?=
 =?us-ascii?Q?tW1UfZTFzC9D7bBTlUjjUMRTW17u0UWh0a0ekF58kXXlq0nTO/hvfnpudiYy?=
 =?us-ascii?Q?j8baElcegNFz9+pHH0tqMhJaPycsPuxDrZDuiTzS/jU9aUQJ/h+qikXVF3sv?=
 =?us-ascii?Q?UPKhnUFyFq13FBKr+681IVFYQD5LVxibEdizFJ/3b5CXMBYcU1LDdfwtHAM5?=
 =?us-ascii?Q?T0LXM1DAHpIZqNjqF+8hYQ7ioYHrTBUwB+299KEJjDESqIa1sevDpTbcNPcU?=
 =?us-ascii?Q?eU+/RV5n64CcFYPGLoDIO0NBB4X/IFrUK142phtzN4KEMetj1aZhhi7tZb2Y?=
 =?us-ascii?Q?pdceUVbhbmw+yOMoMKfXEM6RhnTY9MRw7DfUOkVD/VOdCz0AhO/Wi8RPzs9n?=
 =?us-ascii?Q?rKg/LrcPBhfRMvNmxwLRaspN2tC6MoWQZBkhLIwYRewbw6QNHcg1Vjh0isaf?=
 =?us-ascii?Q?hQW3tqM9GoNMs8vQGuMsmedoNBDkBKeqToq056r6pgTkVvB/QqtGp3Zn+myK?=
 =?us-ascii?Q?7F6uwdbr2dhMkyJ1lQKfSJeCDVptxy2f8a2HTxsyITulng0P3crb66B6QnV/?=
 =?us-ascii?Q?nE2nlKiu2WKHCFY/xMSylyFhWEWhWyaNmSlX934NZKkF+6RQdZNq9OodPXIB?=
 =?us-ascii?Q?f3WslEMXC+fen3pMXoo0ofrYSv73QmeLdXhC6zScg+W/ER0R2woUJAJsC69p?=
 =?us-ascii?Q?fk5upxoRy4OXSj3UGbgAS/Pf1JTtsgCSqFuHEeChw+ECmWmhGI9pBKHGSJJO?=
 =?us-ascii?Q?LZeUPAiIHMz6baGZeSFCsE4u3ZWLWBe8GRINFHV3A4qWJIfEB8pXWLRg/Uf8?=
 =?us-ascii?Q?6F9tHxUrYP9p3QK1y6Nn597QLCdppUpbVu5nBhHLiVXoXgLCHn1mOvtsFFlG?=
 =?us-ascii?Q?2ZVIKxmgo/040qMw+G06rdCk5Dkbui+ePd7VV8mG5DOMRv4oojd8wEmUniwQ?=
 =?us-ascii?Q?9qsBhI3iFNsZgdekfifWgA7F1GCks8fdi2NOXjYiRLOio9kVUIo0e3tQa1qo?=
 =?us-ascii?Q?VI33z0JoEO++6zaFVaTSOipKns8FdHxWOik41vnyECtbc/3Ch8qyG9/rn1aL?=
 =?us-ascii?Q?Ngju3ZMz5RNvmUos5Qie7sqFQZHNUM+e3mbim1pNtd3IwuR9ki7dl1H+W9bj?=
 =?us-ascii?Q?2eFArkcF6gk5Tgle5lIY5nSYGLCH28x+W1424BHi1f/xjxgCVIAPjKAFHlUa?=
 =?us-ascii?Q?E09blftcrHwLBJagyHfk6eiUJ4LyZvGeXUMbfxBd+OEIXoRwSceDAvjIQ9qm?=
 =?us-ascii?Q?kXx0oPjG/u5psyH5Z1kq8kCiAFt0rkldZeer3A/f9mnFMCFqbKcTNhDPMBYQ?=
 =?us-ascii?Q?5kL6tSuf2L5X1EvtwfaxByAIsgQGPi78cwphs2EddVyKaAuzWu/YSnTNr/Se?=
 =?us-ascii?Q?UvSWMKs6+hcE/j0YRqlCu+1KcuMyxBMcxtDQ2EttF9Cn76Jq/zWwf0TL4d0q?=
 =?us-ascii?Q?WuumVsrwR2Cy4qNTNmwoMX2H1E2T7aL14U+StWm782EX5TkVhqQhSWgEpwQ8?=
 =?us-ascii?Q?cv6myxY7m2LrYai1OFvGDbsdfiWDGonJMbhPDjdENUK8d0/A1CO5YYuOf+SH?=
 =?us-ascii?Q?xwPF/9tocsBXDOmxMuGo8jzefrASWsbDZkMNg/sw+U7RqYvFAoxfjITHkb8N?=
 =?us-ascii?Q?OLx3laFJE/I300Qmy3ZWm6BaD3HmRj0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce69168-c08e-4895-6239-08de3f1d95d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:42:23.4846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7rfl+i1779V+6ToWI8ta0HsNIGNqiwe7pz2p7eseP3g2dnlpaFUwtOkjdSxf5uI3Djoc+4vYVFTDdpWtlB209U61W1/iBHkjf3EYXQA7zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7115
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

On Fri, Dec 19, 2025 at 07:57:40PM +0530, Vivekanandan, Balasubramani wrote:
> On 17.12.2025 15:12, Matt Roper wrote:
> > On Wed, Dec 17, 2025 at 06:21:43PM +0530, Balasubramani Vivekanandan wrote:
> > > Prior to lmem init check, driver is waiting for the pcode uncore_init
> > > status. uncore_init status will be asserted after the complete boot and
> > > initialization of the SoC by the pcode. uncore_init confirms that lmem
> > > init and mmio unblock has been already completed.
> > > It makes no sense to check for lmem init after the pcode uncore_init
> > > check. So it can be removed.
> > 
> > While I think this should be fine on our current platforms, one thing
> > that worries me is that we'll bypass xe_pcode_ready() if we ever have a
> > device that sets skip_pcode in xe_pci.c.  No such device exists today,
> > but if one shows up in the future it may not be obvious when enabling
> > the platform that we'd need to add back the GU_CNTL check (or something
> > equivalent).
> 
> I agree.
> 
> > 
> > A couple thoughts:
> > 
> >  - Maybe we should have an initial patch that drops 'skip_pcode' from
> >    xe_device_desc since it's not being used today.  If it becomes
> >    necessary in the future, then we can easily re-add it, and the
> >    process of doing so may help remind us that we also need to do other
> >    checks to make sure the device/lmem is fully initialized and ready to
> >    use.
> 
> We may not be able to drop skip_pcode because it is used for SRIOV and
> going to be used for a future platform. So I am not dropping skip_pcode
> in my upcoming revision.

There are two different skip_pcode flags --- one in xe->info and the
other in the bind-time device descriptor.  The descriptors flag gets
copied into the xe->info.flag and then things like SRIOV potentially
update the xe->info.flag farther.  I think we should be able to drop the
flag from the descriptor (which represents intrinsic traits of the
platform family) and leave the one in xe->info (which tracks the current
handling for the specific device we're working with).


Matt

> 
> > 
> >  - Maybe we should replace wait_for_lmem_ready() with an
> >    "assert_lmem_ready()" function that will just do a quick sanity check
> >    on debug builds.
> > 
> >         static void assert_lmem_ready(struct xe_device *xe) {
> >                 if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> >                         return;
> > 
> >                 xe_assert(xe, xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT);
> >         }
> 
> Thanks, this looks good. I will update.
> 
> Regards,
> Bala
> 
> > 
> >    That eliminates all the looping/polling logic, but still helps make
> >    sure we don't miss anything if we ever need to skip the pcode step on
> >    a future platform (or if the init flows change and our ordering
> >    assumptions are no longer true).  And since it's an xe_assert() it's
> >    only active on debug/CI builds and will be compiled out on release
> >    builds.
> > 
> > 
> > Matt
> > 
> > > 
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 67 +++-------------------------------
> > >  1 file changed, 5 insertions(+), 62 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 1197f914ef77..3818d0cccb0e 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -8,7 +8,6 @@
> > >  #include <linux/aperture.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/fault-inject.h>
> > > -#include <linux/iopoll.h>
> > >  #include <linux/units.h>
> > >  
> > >  #include <drm/drm_atomic_helper.h>
> > > @@ -630,63 +629,6 @@ static int xe_set_dma_info(struct xe_device *xe)
> > >  	return err;
> > >  }
> > >  
> > > -static int lmem_initializing(struct xe_device *xe)
> > > -{
> > > -	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT)
> > > -		return 0;
> > > -
> > > -	if (signal_pending(current))
> > > -		return -EINTR;
> > > -
> > > -	return 1;
> > > -}
> > > -
> > > -static int wait_for_lmem_ready(struct xe_device *xe)
> > > -{
> > > -	const unsigned long TIMEOUT_SEC = 60;
> > > -	unsigned long prev_jiffies;
> > > -	int initializing;
> > > -
> > > -	if (!IS_DGFX(xe))
> > > -		return 0;
> > > -
> > > -	if (IS_SRIOV_VF(xe))
> > > -		return 0;
> > > -
> > > -	if (!lmem_initializing(xe))
> > > -		return 0;
> > > -
> > > -	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
> > > -	prev_jiffies = jiffies;
> > > -
> > > -	/*
> > > -	 * The boot firmware initializes local memory and
> > > -	 * assesses its health. If memory training fails,
> > > -	 * the punit will have been instructed to keep the GT powered
> > > -	 * down.we won't be able to communicate with it
> > > -	 *
> > > -	 * If the status check is done before punit updates the register,
> > > -	 * it can lead to the system being unusable.
> > > -	 * use a timeout and defer the probe to prevent this.
> > > -	 */
> > > -	poll_timeout_us(initializing = lmem_initializing(xe),
> > > -			initializing <= 0,
> > > -			20 * USEC_PER_MSEC, TIMEOUT_SEC * USEC_PER_SEC, true);
> > > -	if (initializing < 0)
> > > -		return initializing;
> > > -
> > > -	if (initializing) {
> > > -		drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
> > > -		return -EPROBE_DEFER;
> > > -	}
> > > -
> > > -	drm_dbg(&xe->drm, "lmem ready after %ums",
> > > -		jiffies_to_msecs(jiffies - prev_jiffies));
> > > -
> > > -	return 0;
> > > -}
> > > -ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
> > > -
> > >  static void vf_update_device_info(struct xe_device *xe)
> > >  {
> > >  	xe_assert(xe, IS_SRIOV_VF(xe));
> > > @@ -740,6 +682,11 @@ int xe_device_probe_early(struct xe_device *xe)
> > >  	if (IS_SRIOV_VF(xe))
> > >  		vf_update_device_info(xe);
> > >  
> > > +	/*
> > > +	 * Check for pcode uncore_init status to confirm if the SoC
> > > +	 * initialization is complete. Until done, any MMIO or lmem access from
> > > +	 * the driver will be blocked
> > > +	 */
> > >  	err = xe_pcode_probe_early(xe);
> > >  	if (err || xe_survivability_mode_is_requested(xe)) {
> > >  		int save_err = err;
> > > @@ -756,10 +703,6 @@ int xe_device_probe_early(struct xe_device *xe)
> > >  		return save_err;
> > >  	}
> > >  
> > > -	err = wait_for_lmem_ready(xe);
> > > -	if (err)
> > > -		return err;
> > > -
> > >  	xe->wedged.mode = xe_modparam.wedged_mode;
> > >  
> > >  	err = xe_device_vram_alloc(xe);
> > > -- 
> > > 2.43.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
